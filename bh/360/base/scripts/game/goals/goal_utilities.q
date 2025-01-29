core_goal_info = {
	name = 'core_goal'
	goal_type = core
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'song'
					type = song
				}
			]
		}
	]
}

script goal_time_expired \{show_expire_message = 1}
	printf 'goal_time_expired - %a' a = <goal_id>
	if (<show_expire_message> = 1)
	endif
	broadcastevent \{type = goal_expired}
endscript

script goal_get_checkpoint_ui 
	RequireParams \{[
			goal
			checkpoint
		]
		all}
	if GMan_GetConstant goal = <goal> name = checkpoint_ui
		if StructureContains structure = <checkpoint_ui> <checkpoint>
			return true checkpoint_ui = (<checkpoint_ui>.<checkpoint>)
		endif
	endif
	return \{false}
endscript

script goal_get_title 
	RequireParams \{[
			goal
		]
		all}
	if GMan_GetConstant goal = <goal> name = goal_title
		return goal_title = <goal_title>
	else
		GMan_GetGoalString goal = <goal>
		FormatText TextName = goal_title qs(0x35b12509) a = <goal_string>
		return goal_title = <goal_title>
	endif
endscript

script goal_get_desc 
	RequireParams \{[
			goal
		]
		all}
	if NOT GotParam \{checkpoint}
		GMan_GetCurrentCheckpoint goal = <goal>
		<checkpoint> = <current_checkpoint>
	endif
	if goal_get_checkpoint_ui goal = <goal> checkpoint = <checkpoint>
		if StructureContains structure = <checkpoint_ui> goal_desc
			return goal_desc = (<checkpoint_ui>.goal_desc)
		endif
	endif
	if GMan_GetConstant goal = <goal> name = goal_desc
		return goal_desc = <goal_desc>
	endif
	return \{goal_desc = qs(0xe2d2ef7d)}
endscript

script goal_end_run_script_launcher 
	Gman_GetActivatedGoalId
	spawnscriptlater <end_run_script> params = {goal_id = <activated_goal_id>}
endscript

script GMan_PassCheckpoint 
	if NOT GMan_GetGoalState goal = <goal> states = [goal_activated]
		softassert qs(0xdb87bb49) g = <goal> s = <goal_state>
		return
	endif
	spawnscriptnow goal_spawned_safe_pass_checkpoint params = {goal = <goal>}
endscript

script goal_spawned_safe_pass_checkpoint 
	if GMan_GetData goal = <goal> name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			GMan_GetCurrentCheckpoint goal = <goal>
			softassert qs(0x663315dc) s = <current_checkpoint>
		endif
	endif
	GMan_SetData goal = <goal> params = {goal_checkpoint_transition = 1}
	GMan_SpawnedSafePassCheckpoint goal = <goal>
endscript

script GMan_FailCheckpoint \{show_retry_dialog = 0}
	if NOT GMan_GetGoalState goal = <goal> states = [goal_activated]
		softassert qs(0x150cd07e) g = <goal> s = <goal_state>
		return
	endif
	spawnscriptlater noqbid goal_spawned_safe_fail_checkpoint params = {
		goal = <goal>
		txt = <txt>
		show_retry_dialog = <show_retry_dialog>
	}
endscript

script goal_spawned_safe_fail_checkpoint \{show_retry_dialog = 0}
	if GotParam \{goal_id}
		<goal> = <goal_id>
	endif
	if GMan_GetData goal = <goal> name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			GMan_GetCurrentCheckpoint goal = <goal>
			softassert qs(0x663315dc) s = <current_checkpoint>
		endif
	endif
	GMan_SetData goal = <goal> params = {goal_checkpoint_transition = 1}
	if GotParam \{show_retry_dialog}
		if (<show_retry_dialog> = 1)
			goal_failed_retry_options goal = <goal> txt = <txt>
		else
			GMan_SpawnedSafeFailCheckpoint goal = <goal>
		endif
	else
		GMan_SpawnedSafeFailCheckpoint goal = <goal>
	endif
endscript

script goal_retry_current_goal 
	printf \{'goal_retry_current_goal'}
	if GMan_CanRetryCurrentGoal
		GMan_GetCurrentRetryableGoalId
		if GMan_GetData goal = <current_retryable_goal_id> name = retry
			printf \{'goal_retry_current_goal: WARNING: retry current already active, ignoring'}
			return
		endif
		GMan_SetRetryFlag \{type = current}
		GMan_DeactivateTools goal = <current_retryable_goal_id>
		GMan_RetryCurrentGoal
	else
		printf \{'goal_retry_current_goal - WARNING: cannot retry current goal'}
	endif
endscript
goal_is_between_retries = 0

script goal_retry_last_goal 
	goal_viewport_kill \{all}
	spawnscriptnow \{goal_retry_last_goal_spawned}
endscript

script goal_retry_last_goal_spawned 
	disable_pause
	if GMan_CanRetryLastGoal
		GMan_SetRetryFlag \{type = last}
		GMan_GetLastRetryableGoalId
		Change \{goal_is_between_retries = 1}
		disable_pause
		KillSkaterCamAnim \{current}
		stuckcheck = 200
		begin
		if GMan_GetGoalState goal = <last_retryable_goal_id> states = $goal_idle_states
			break
		endif
		wait \{2
			gameframes}
		stuckcheck = (<stuckcheck> - 1)
		if (<stuckcheck> = 0)
			softassert \{qs(0x29c519a2)}
		endif
		repeat
		if NOT GMan_GoalIsInitialized goal = <last_retryable_goal_id>
			stuckcheck = 200
			begin
			wait \{2
				gameframes}
			if NOT GMan_GetGoalState goal = <last_retryable_goal_id> states = [goal_uniniting]
				break
			endif
			stuckcheck = (<stuckcheck> - 1)
			if (<stuckcheck> = 0)
				softassert \{qs(0x8793d1d4)}
			endif
			repeat
			GMan_InitializeGoal goal = <last_retryable_goal_id>
			stuckcheck = 200
			begin
			wait \{2
				gameframes}
			if GMan_GoalIsInitialized goal = <last_retryable_goal_id>
				break
			endif
			stuckcheck = (<stuckcheck> - 1)
			if (<stuckcheck> = 0)
				softassert \{qs(0xbc755570)}
			endif
			repeat
		endif
		GMan_RetryLastGoal
	else
		enable_pause
	endif
	Change \{dont_create_speech_boxes = 0}
endscript

script goal_move_player_load_zone 
	RequireParams \{[
			zone
		]
		all}
	printf \{'goal_move_player_load_zone'}
	<new_zone> = <zone>
	GetCurrentLevel
	FormatText checksumname = current_zone '%s' s = (<level_structure>.level)
	if NOT checksumequals a = <new_zone> b = <current_zone>
		<should_load> = 0
		if NOT checksumequals a = <new_zone> b = <current_zone>
			<should_load> = 1
		endif
		if (<should_load> = 1)
			printf 'goal_move_player_load_zone: Starting a hard zone load (from %a to %b)' a = <current_zone> b = <new_zone>
			if NOT GotParam \{new_level}
				SetButtonEventMappings \{block_menu_input}
				if Gman_GetActivatedGoalId
					load_level_handle_loading_screen
				else
					load_level_handle_movie_loading_screen level = <new_zone>
				endif
			endif
			spawnscriptnow goal_wait_retry_zone_load params = {new_zone = <new_zone> new_level = <new_level> goal = <goal>}
		else
			printf 'goal_move_player_load_zone: Zone %z already loaded, no load necessary.' z = <new_zone>
			return \{no_zone_load_necessary}
		endif
	else
		printf 'goal_move_player_load_zone: No load necessary, current zone matches new zone (%a)' a = <current_zone>
		return \{no_zone_load_necessary}
	endif
endscript

script goal_retry_load_zone \{move_to_trigger = 1}
	RequireParams \{[
			retry_goal
		]
		all}
	printf \{'goal_retry_load_zone'}
	if NOT GMan_GoalExists goal = <retry_goal>
		ScriptAssert qs(0xc6554b2a) d = <retry_goal>
	endif
	if NOT GMan_GetConstant goal = <retry_goal> name = start_zone
		ScriptAssert qs(0x544d1825) d = <retry_goal>
	endif
	if GMan_GetCheckpointStartZone goal = <retry_goal>
		if checksumequals a = <checkpoint_start_zone> b = dont_load_zone
			return \{no_zone_load_necessary}
		endif
		<new_zone> = <checkpoint_start_zone>
		printf channel = goal 'goal_retry_load_zone: checkpoint start zone (%z)' z = <new_zone>
	else
		<new_zone> = <start_zone>
		printf channel = goal 'goal_retry_load_zone: goal start zone (%z)' z = <new_zone>
	endif
	if (<move_to_trigger> = 1)
		if GMan_GetConstant goal = <retry_goal> name = trigger_pos
			goal_move_player Pos = <trigger_pos>
		endif
	endif
	goal_move_player_load_zone zone = <new_zone> goal = <retry_goal>
	if GotParam \{no_zone_load_necessary}
		return \{no_zone_load_necessary}
	endif
endscript
goal_zone_loading = 0

script goal_wait_retry_zone_load 
	printf \{'goal_wait_retry_zone_load'}
	Change \{goal_zone_loading = 1}
	if GotParam \{new_level}
		RequireParams \{[
				goal
			]
			all}
		Change goal_startup_goal = <goal>
		change_level level = <new_level>
		printf \{'goal_wait_retry_zone_load - waiting for goal'}
		begin
		if GMan_GoalExists goal = <goal>
			break
		endif
		wait \{1
			gameframe}
		repeat
	elseif GotParam \{new_zone}
		SetPakManCurrentBlock map = zones pak = <new_zone>
		wait \{0.5
			seconds
			ignoreslomo}
		if NOT ZoneLoadedAndParsed <new_zone>
			wait \{1
				gameframe}
			printf \{'goal_retry_load_zone: Done waiting for zone to unload, starting actual load.'}
			SetPakManCurrentBlock map = zones pak = <new_zone>
		endif
	else
		ScriptAssert \{qs(0xe4404b2d)}
	endif
	Change \{goal_zone_loading = 0}
	LaunchEvent \{Broadcast
		type = goal_retry_load_zone_done}
	SetButtonEventMappings \{unblock_menu_input}
	printf \{'goal_retry_load_zone: Finished hard zone load.'}
endscript

script goal_debug_beat_checkpoint 
	printf \{'goal_debug_beat_checkpoint'}
	Gman_GetActivatedGoalId
	begin
	if GMan_GoalIsInitialized goal = <activated_goal_id>
		break
	endif
	if NOT GMan_HasActiveGoals
		break
	endif
	printf \{'Debug beat checkpoint: Waiting for goal to finish initializing.'}
	wait \{2
		gameframes}
	repeat
	if Gman_GetActivatedGoalId
		KillSkaterCamAnim \{current}
		GMan_PassCheckpoint goal = <activated_goal_id>
	endif
endscript

script goal_quit_current_goal \{from_pause = true}
	wait \{1
		gameframe}
	if ScreenElementExists \{id = goal_message}
		RunScriptOnScreenElement \{id = goal_message
			kill_panel_message}
	endif
	ui_kill_all_messages \{instant = 1}
	Gman_GetActivatedGoalId
	GMan_SetQuitFlag
	GMan_DeactivateAllGoals
	GMan_BlockUntilAllGoalsDeactivated
	GMan_UnSetQuitFlag goal = <activated_goal_id>
	if (<from_pause> = true)
	endif
endscript

script goal_move_player \{player = player0_body}
	if CompositeObjectExists <player>
		if GotParam \{restart_pos}
			<Pos> = (<restart_pos>.Pos)
			if StructureContains \{structure = restart_pos
					Quat}
				<Quat> = (<restart_pos>.Quat)
			endif
		elseif GotParam \{restart_node}
			GetNode <restart_node>
			if GotParam \{node}
				<Pos> = (<node>.Pos)
			endif
		endif
		if NOT GotParam \{Pos}
			softassert \{qs(0x5a68e6bb)}
		endif
		if GotParam \{zone}
			goal_move_player_load_zone zone = <zone>
			if NOT GotParam \{no_zone_load_necessary}
				Block \{type = goal_retry_load_zone_done}
			endif
		endif
		<player> :MovementResolution_TeleportObject Pos = <Pos>
		GetPlayerCamera <player>
		if GotParam \{player_camera}
			<player_camera> :CameraBlender_Reset
		endif
		if GotParam \{zone}
			if NOT GotParam \{no_zone_load_necessary}
				HideLoadingScreen
				enable_pause
			endif
		endif
	endif
endscript

script goal_get_leaderboard_metrics 
	if NOT GotParam \{goal_type}
		GMan_GetGoalType goal = <goal>
	endif
	if StructureContains structure = $goal_type_info <goal_type>
		<leaderboard_metrics> = ($goal_type_info.<goal_type>.leaderboard)
	endif
	RequireParams \{[
			leaderboard_metrics
		]
		all}
	return leaderboard_metrics = <leaderboard_metrics>
endscript

script goal_get_leaderboard_columns 
	RequireParams \{[
			goal
		]
		all}
	return \{leaderboard_columns = [
			0
			1
			2
			3
			4
		]}
endscript

script goal_utility_manage_objects 
	printf \{'starting goal_manage_objects'}
	MemPushContext \{BottomUpHeap}
	if GotParam \{action}
		if GotParam \{objects}
			GetArraySize <objects>
			<i> = 0
			switch <action>
				case remove
				begin
				<object_name> = (<objects> [<i>])
				kill name = <object_name>
				<i> = (<i> + 1)
				repeat <array_size>
				case add
				begin
				<object_name> = (<objects> [<i>])
				create name = <object_name>
				<i> = (<i> + 1)
				repeat <array_size>
				case reset
				begin
				<object_name> = (<objects> [<i>])
				kill name = <object_name>
				create name = <object_name>
				<i> = (<i> + 1)
				repeat <array_size>
				case glow
				begin
				<object_name> = (<objects> [<i>])
				<object_name> :Obj_SetOutlineFlag on
				<i> = (<i> + 1)
				repeat <array_size>
				case remove_prefix
				begin
				<object_name> = (<objects> [<i>])
				kill prefix = <object_name>
				<i> = (<i> + 1)
				repeat <array_size>
				case add_prefix
				begin
				<object_name> = (<objects> [<i>])
				create prefix = <object_name>
				<i> = (<i> + 1)
				repeat <array_size>
				case reset_prefix
				begin
				<object_name> = (<objects> [<i>])
				kill name = <object_name>
				create name = <object_name>
				<i> = (<i> + 1)
				repeat <array_size>
				default
			endswitch
		else
			if GotParam \{Object}
				switch <action>
					case remove
					kill name = <Object>
					case add
					create name = <Object>
					case remove_prefix
					kill prefix = <Object>
					case add_prefix
					create prefix = <Object>
					case reset
					kill prefix = <Object>
					create prefix = <Object>
					case reset_prefix
					kill prefix = <Object>
					create prefix = <Object>
					case glow
					<Object> :Obj_SetOutlineFlag on
					default
				endswitch
			endif
		endif
	endif
	MemPopContext
endscript

script GMan_BlockUntilAllGoalsDeactivated 
	begin
	printf \{'GMan_BlockUntilAllGoalsDeactivated - Waiting for active goals...'}
	if NOT GMan_HasActiveGoals
		break
	endif
	wait \{1
		gameframe}
	repeat
	printf \{'GMan_BlockUntilAllGoalsDeactivated - No active goals.'}
endscript

script goal_set_pending_grade 
	RequireParams \{[
			goal
			grade
		]
		all}
	printf 'goal_set_pending_grade -- %r' r = <grade>
	if ((<grade> < 0) || (<grade> > 3))
		softassert 'Grade %s must be in range [0 3]' s = <grade>
		return
	endif
	GMan_SetPendingGrade goal = <goal> grade = <grade>
	if GotParam \{ui}
		spawnscriptnow goal_ui_announce_pending_grade params = {goal = <goal> grade = <grade> mode = <ui>}
	endif
endscript

script GMan_preQBRGoal 
	printf 'QBRGoal: %g' g = <goal>
	GMan_DeactivateAllGoals
	GMan_BlockUntilAllGoalsDeactivated
	if IsTrue <pakless>
		GMan_UninitializeAllGoals
		begin
		if GMan_AllGoalsUninitialized
			break
		endif
		wait \{2
			gameframes}
		repeat
		GMan_GetGoalsByPak \{pak = pakless}
		<i> = 0
		begin
		GMan_RemoveGoal goal = (<goals_by_pak> [<i>])
		<i> = (<i> + 1)
		repeat <goals_by_pak_size>
	else
		GMan_UninitializeGoal goal = <goal>
		begin
		if GMan_GetGoalState goal = <goal> states = [goal_uninited]
			break
		endif
		printf \{'GMan_preQBRGoal: Block until goal uninited.'}
		wait \{2
			gameframes}
		repeat
		wait \{2
			gameframes}
		GMan_RemoveGoal goal = <goal>
	endif
endscript

script GMan_postQBRGoal 
	if IsTrue <pakless>
		GetArraySize \{$goal_infos_pakless}
		<i> = 0
		begin
		GMan_AddGoal goal_info = ($goal_infos_pakless [<i>])
		printstruct ($goal_infos_pakless [<i>])
		<i> = (<i> + 1)
		repeat <array_size>
		GMan_InitializeAllGoals
	else
		AppendSuffixToChecksum base = <goal> SuffixString = '_goal_info'
		GMan_AddGoal goal_info = ($<appended_id>)
		wait \{2
			gameframes}
		GMan_InitializeGoal goal = <goal>
		begin
		if GMan_GoalIsInitialized goal = <goal>
			break
		endif
		wait \{1
			gameframe}
		repeat
		GMan_ActivateGoal goal = <goal>
	endif
endscript

script goal_event_has_occurred 
	FormatText checksumname = already_triggered_flag '%s_already_triggered_flag' s = <event_string>
	if GMan_GetData goal = <goal> name = <already_triggered_flag>
		if ((<...>.<already_triggered_flag>) = true)
			return \{true}
		endif
	else
		GMan_SetData goal = <goal> name = <already_triggered_flag> value = false initial
	endif
	GMan_SetData goal = <goal> name = <already_triggered_flag> value = true
	return \{false}
endscript

script goal_debug_show_states 
	begin
	if ScreenElementExists \{id = goal_debug_state_menu}
		DestroyScreenElement \{id = goal_debug_state_menu}
	endif
	CreateScreenElement \{id = goal_debug_state_menu
		type = ContainerElement
		parent = root_window
		scale = 0.52
		Pos = (70.0, 20.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		z_priority = 100}
	<num_cols> = 4
	<goals_per_col> = 38
	<i> = 0
	begin
	CreateScreenElement {
		type = vmenu
		parent = goal_debug_state_menu
		Pos = ((0.0, 0.0) + <i> * (575.0, 0.0))
		just = [left top]
		internal_just = [left top]
		regular_space_amount = 34
	}
	<i> = (<i> + 1)
	repeat <num_cols>
	if ($goals_for_gamemode_loaded = 1)
		GetArraySize ($goal_types)
		<num_types> = <array_size>
		<j> = 0
		<goal_iter> = 0
		begin
		<goal_type> = ($goal_types [<j>])
		RemoveParameter \{goals_by_type}
		if GMan_GetGoalsByType type = <goal_type>
			GetArraySize <goals_by_type>
			<num_goals> = <array_size>
			if (<num_goals> > 0)
				<i> = 0
				begin
				<goal> = (<goals_by_type> [<i>])
				if GMan_GoalExists goal = <goal>
					GMan_GetGoalState goal = <goal>
					GMan_GetGoalString goal = <goal>
					StringRemove text = <goal_string> remove = 'm_' new_string = goal_string
					<State_String> = '?'
					switch <goal_state>
						case goal_activating
						<State_String> = 'act.ing'
						case goal_deactivating
						<State_String> = 'deact.'
						case goal_initing
						<State_String> = 'initing'
						case goal_uniniting
						<State_String> = 'uniniting'
						case goal_result
						<State_String> = 'result'
						case goal_activated
						<State_String> = 'RUN'
						case GOAL_INACTIVE
						<State_String> = 'inactive'
						case goal_uninited
						<State_String> = 'uninited'
					endswitch
					FormatText TextName = text qs(0x351ed798) g = <goal_string> s = <State_String>
					if NOT ((checksumequals a = <goal_state> b = goal_uninited) || (checksumequals a = <goal_state> b = GOAL_INACTIVE))
						<text_color> = [255 255 255 70]
						switch <goal_state>
							case goal_activating
							case goal_deactivating
							case goal_initing
							case goal_uniniting
							case goal_result
							<text_color> = [255 255 0 255]
							case goal_activated
							<text_color> = [0 255 0 255]
						endswitch
						<column> = (<goal_iter> / <goals_per_col>)
						CastToInteger \{column}
						if (<column> >= <num_cols>)
							<column> = (<num_cols> - 1)
						endif
						<goal_iter> = (<goal_iter> + 1)
						if Gman_GetActivatedGoalId
							if checksumequals a = <activated_goal_id> b = <goal>
								CreateScreenElement {
									type = TextElement
									parent = {goal_debug_state_menu child = <column>}
									font = text_a1
									text = <text>
									rgba = <text_color>
									shadow
									shadow_offs = (1.0, 1.0)
								}
							endif
						else
							CreateScreenElement {
								type = TextElement
								parent = {goal_debug_state_menu child = <column>}
								font = text_a1
								text = <text>
								rgba = <text_color>
								shadow
								shadow_offs = (1.0, 1.0)
							}
						endif
						if checksumequals a = <goal_state> b = goal_activated
							GMan_GetCurrentCheckpoint goal = <goal>
							FormatText TextName = c_text qs(0x961d63b2) c = <current_checkpoint>
							CreateScreenElement {
								type = TextElement
								parent = goal_debug_state_menu
								font = text_a1
								text = <c_text>
								rgba = <text_color>
								shadow
								shadow_offs = (1.0, 1.0)
							}
						endif
					endif
				endif
				<i> = (<i> + 1)
				repeat <num_goals>
			endif
		endif
		<j> = (<j> + 1)
		repeat <num_types>
	endif
	wait \{10
		gameframes}
	repeat
endscript

script GMan_InitializeGoalBlocking \{goal = unset}
	GMan_InitializeGoal goal = <goal>
	begin
	if GMan_GoalIsInitialized goal = <goal>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script quick_start_goal \{activate = true}
	quick_remove_goal goal_name = <goal_name>
	GMan_AddGoal goal_info = ($<goal_struct>)
	GMan_InitializeGoal goal = <goal_name>
	begin
	if GMan_GoalIsInitialized goal = <goal_name>
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<activate> = true)
		GMan_ActivateGoal goal = <goal_name>
	endif
endscript

script quick_remove_goal 
	if GMan_GoalExists goal = <goal_name>
		if GMan_GoalIsInitialized goal = <goal_name>
			if GMan_GoalIsActive goal = <goal_name>
				GMan_DeactivateGoal goal = <goal_name>
				begin
				if NOT GMan_GoalIsActive goal = <goal_name>
					break
				endif
				wait \{1
					gameframe}
				repeat
			endif
			GMan_UninitializeGoal goal = <goal_name>
			begin
			if NOT GMan_GoalIsInitialized goal = <goal_name>
				break
			endif
			wait \{1
				gameframe}
			repeat
		endif
		GMan_RemoveGoal goal = <goal_name>
	endif
endscript

script GMan_SongTool_SetCurrentSong \{song = unset}
	GMan_SongFunc func = set_current_song params = {song = <song>}
endscript

script GMan_SongTool_GetCurrentSong 
	current_song = None
	GMan_SongFunc \{func = get_current_song}
	return current_song = <current_song>
endscript

script GMan_SongTool_GetCurrentSongVersion 
	GMan_SongFunc \{func = get_current_song_version}
	return current_song_version = <current_song_version>
endscript

script GMan_SongTool_SongWon 
	GuitarEvent_SongWon
endscript

script get_current_songs_struct 
	GMan_SongTool_GetCurrentSong
	get_song_struct song = <current_song>
	return song_struct = <song_struct>
endscript

script is_current_song_a_jam_session 
	GMan_SongTool_GetCurrentSong
	if (<current_song> = jamsession)
		return \{true}
	else
		return \{false}
	endif
endscript

script GMan_StartGameModeGoal 
	GameMode_GetType
	if (<type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = fest_mode || $game_mode = fest_mode_team)
			goal_name = competitive
			goal_struct = competitive_info
		elseif ($game_mode = section_scoring)
			Change \{competitive_rules = section_scoring}
			goal_name = competitive
			goal_struct = competitive_info
		endif
	elseif (<type> = career)
		goal_name = career
		goal_struct = career_info
	endif
	if GotParam \{goal_name}
		if NOT (GMan_GoalIsActive goal = <goal_name>)
			quick_start_goal goal_struct = <goal_struct> goal_name = <goal_name>
		endif
	endif
endscript

script GMan_ShutDownGameModeGoal 
	GameMode_GetType
	if (<type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = section_scoring || $game_mode = fest_mode || $game_mode = fest_mode_team)
			quick_remove_goal \{goal_name = competitive}
		endif
	endif
endscript

script GMan_ShutDownAllGoals 
	GMan_GetActivatedGoalIDs
	if NOT GotParam \{active_goal_ids}
		return
	endif
	GetArraySize <active_goal_ids>
	if (<array_size> = 0)
		return
	endif
	i = 0
	begin
	cur_id = (<active_goal_ids> [<i>])
	if GotParam \{preserve_career}
		if (<cur_id> = career)
			cur_id = None
		endif
	endif
	quick_remove_goal goal_name = <cur_id>
	i = (<i> + 1)
	repeat <array_size>
endscript

script GMan_Disable_Highway \{player = 1}
	SetPlayerInfo <player> interactive = 0
	destroy_highway_prepass <...>
	hide_highway_hud player = <player>
	FormatText checksumname = name 'Highway_2Dp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <name>
		safe_hide id = <name>
	endif
	FormatText checksumname = name 'gem_containerp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <name>
		safe_hide id = <name>
	endif
	FormatText checksumname = name 'Gem_basebarp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <name>
		safe_hide id = <name>
	endif
	FormatText checksumname = name 'highway_containerp%p' p = <player>
	if ScreenElementExists id = <name>
		safe_hide id = <name>
	endif
endscript

script goal_start_section_watcher 
	spawnscriptnow section_watcher params = {<...>}
endscript

script section_watcher \{show_timer = 0
		use_vocal_markers = 0}
	printf \{channel = goal
		'Section Watcher Started...'}
	<section> = 0
	GMan_SetData goal = <goal_id> params = {current_section = <section>}
	GMan_SongTool_GetCurrentSong
	if GlobalExists name = <goal_id>
		if StructureContains structure = ($<goal_id>) required_band
			if ArrayContains array = ($<goal_id>.required_band) contains = vocal
				<use_vocal_markers> = 1
			endif
		endif
	endif
	if (<use_vocal_markers> = 1)
		SongFileManager func = get_marker_array song_name = <current_song> part = vocals
	else
		SongFileManager func = get_marker_array song_name = <current_song> part = guitar
	endif
	<song_section_array> = <marker_array>
	GetArraySize <song_section_array>
	SongFileManager func = get_song_end_time song_name = <current_song>
	if (<array_size> = 0)
		printf \{channel = goal
			'No markers found in song, exiting section_watcher...'}
		return
	endif
	GetSongTimeMs
	<new_time> = ((<song_section_array> [1].time) - (<time>))
	if (<show_timer> = 1)
		CastToInteger \{new_time}
		GMan_TimerFunc goal = <goal_id> tool = section_timer func = set_precise_start_time params = {precise_time = (<new_time>)}
		printf channel = goal 'timer set to %s seconds...' s = (<new_time> / 1000.0)
		GMan_TimerFunc goal = <goal_id> tool = section_timer func = attach_timer_to_player params = {player = 0}
		GMan_TimerFunc goal = <goal_id> tool = section_timer func = reset
		GMan_TimerFunc goal = <goal_id> tool = section_timer func = show
		GMan_TimerFunc goal = <goal_id> tool = section_timer func = start
	endif
	begin
	GetSongTimeMs
	CastToInteger \{time}
	if (<section> = (<array_size> - 1))
		break
	elseif ((<song_section_array> [(<section> + 1)].time) < (<time>))
		broadcastevent type = song_section_end data = {section = <section>}
		if (<show_timer> = 1)
			if (<section> = (<array_size> - 2))
				<new_time> = ((<total_end_time>) - (<time>))
				if (<new_time> < 0)
					break
				endif
			else
				<new_time> = ((<song_section_array> [<section> + 2].time) - (<time>))
			endif
			CastToInteger \{new_time}
			GMan_TimerFunc goal = <goal_id> tool = section_timer func = set_precise_start_time params = {precise_time = (<new_time>)}
			printf channel = competitive 'timer set to %s seconds...' s = (<new_time> / 1000.0)
			GMan_TimerFunc goal = <goal_id> tool = section_timer func = attach_timer_to_player params = {player = 0}
			GMan_TimerFunc goal = <goal_id> tool = section_timer func = reset
			GMan_TimerFunc goal = <goal_id> tool = section_timer func = show
			GMan_TimerFunc goal = <goal_id> tool = section_timer func = start
		endif
		<section> = (<section> + 1)
		GMan_SetData goal = <goal_id> params = {current_section = <section>}
	endif
	wait \{1
		gameframe}
	repeat
	begin
	GetSongTimeMs
	CastToInteger \{time}
	if (<time> > <total_end_time>)
		broadcastevent type = song_section_end data = {section = <section>}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script section_fret_display \{use_vocal_markers = 0}
	GMan_SongTool_GetCurrentSong
	if GlobalExists name = <goal_id>
		if StructureContains structure = ($<goal_id>) required_band
			if ArrayContains array = ($<goal_id>.required_band) contains = vocal
				<use_vocal_markers> = 1
			endif
		endif
	endif
	if (<use_vocal_markers> = 1)
		SongFileManager func = get_marker_array song_name = <current_song> part = vocals
	else
		SongFileManager func = get_marker_array song_name = <current_song> part = guitar
	endif
	<song_section_array> = <marker_array>
	GetArraySize <song_section_array>
	if (<array_size> = 0)
		printf \{channel = goal
			'No markers found in song, exiting section_watcher...'}
		return
	else
		<marker_array_size> = <array_size>
	endif
	GMan_SongFunc \{func = get_current_song_playlist_index}
	<current_song_index> = (<current_song_index> - 1)
	if StructureContains structure = ($<goal_id>) song_sections
		GetArraySize (($<goal_id>).song_sections [<current_song_index>])
		<challenge_array_size> = <array_size>
	else
		return
	endif
	<section_index> = 0
	challenge_fretbars_array = []
	begin
	<index_number> = (($<goal_id>).song_sections [<current_song_index>] [<section_index>])
	<section_enter> = (<song_section_array> [<index_number>].time)
	if ((<index_number> + 1) >= <marker_array_size>)
		SongFileManager func = get_song_end_time song_name = <current_song>
		<section_end> = <total_end_time>
	else
		<section_end> = (<song_section_array> [(<index_number> + 1)].time)
	endif
	<challenge_fretbars_array> = (<challenge_fretbars_array> + {start = <section_enter> , end = <section_end>})
	<section_index> = (<section_index> + 1)
	repeat <challenge_array_size>
	GetNumPlayersInGame
	GetFirstPlayer
	begin
	<player_instrument> = valid
	challenge_validate_player_instrument goal_id = <goal_id> player = <player>
	if (<player_instrument> = valid)
		set_challenge_marker_times player = <player> challenge_marker_times = <challenge_fretbars_array> side_glow = 1
	endif
	GetNextPlayer player = <player>
	repeat <num_players>
endscript

script set_challenge_marker_times 
	RequireParams \{[
			player
			challenge_marker_times
		]
		all}
	if NOT PlayerInfoEquals <player> part = vocals
		SetChallengeMarkerTimes player = <player> challenge_marker_times = <challenge_marker_times> side_glow = <side_glow>
	else
		Vocals_SetChallengeMarkerTimes player = <player> challenge_fretbars_array = <challenge_marker_times>
	endif
endscript

script goal_set_player_data_all_players \{params = {
		}}
	RequireParams \{[
			goal
			params
		]
		all}
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GMan_SetData goal = <goal> player = <player> params = <params>
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript

script GMan_SendCallbackToAllGoals 
	RequireParams \{[
			suffix
		]
		all}
	GMan_GetActivatedGoalIDs
	if NOT GotParam \{active_goal_ids}
		return
	endif
	FormatText TextName = final_suffix '_%a' a = <suffix>
	GetArraySize <active_goal_ids>
	i = 0
	begin
	cur_id = (<active_goal_ids> [<i>])
	if GMan_GoalIsActive goal = <cur_id>
		AppendSuffixToChecksum base = <cur_id> SuffixString = <final_suffix>
		if ScriptExists <appended_id>
			<appended_id> <callback_data>
		endif
		FormatText checksumname = suffix_checksum '%d' d = <suffix>
		if GMan_GetConstant goal = <cur_id> name = <suffix_checksum> return_name = custom_callback
			if ScriptExists <custom_callback>
				<custom_callback> <callback_data>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script GMan_adjust_difficulty 
	RequireParams \{[
			player
			adjustment
		]
		all}
	GetPlayerInfo <player> difficulty
	get_difficulty_text difficulty = <difficulty>
	<difficulty_text> = <difficulty_text_nl>
	switch <adjustment>
		case up
		switch <difficulty>
			case beginner
			SetPlayerInfo <player> difficulty = easy
			case easy
			SetPlayerInfo <player> difficulty = medium
			case medium
			SetPlayerInfo <player> difficulty = hard
			case hard
			SetPlayerInfo <player> difficulty = expert
			SetPlayerInfo <player> double_kick_drum = 0
			case expert
			GetPlayerInfo <player> part
			if (<part> = Drum)
				SetPlayerInfo <player> double_kick_drum = 1
				competitive_main_difficulty_watcher_varUpdated player = <player> current_value = expert_plus
			endif
		endswitch
		case down
		switch <difficulty>
			case easy
			SetPlayerInfo <player> difficulty = beginner
			case medium
			SetPlayerInfo <player> difficulty = easy
			case hard
			SetPlayerInfo <player> difficulty = medium
			case expert
			GetPlayerInfo <player> part
			GetPlayerInfo <player> double_kick_drum
			if (<part> = Drum && <double_kick_drum> = 1)
				SetPlayerInfo <player> double_kick_drum = 0
				competitive_main_difficulty_watcher_varUpdated player = <player> current_value = expert
			else
				SetPlayerInfo <player> difficulty = hard
			endif
		endswitch
		case beginner
		SetPlayerInfo <player> difficulty = beginner
		case easy
		SetPlayerInfo <player> difficulty = easy
		case medium
		SetPlayerInfo <player> difficulty = medium
		case hard
		SetPlayerInfo <player> difficulty = hard
		case expert
		SetPlayerInfo <player> difficulty = expert
	endswitch
	GetPlayerInfo <player> part
	if NOT (<part> = vocals)
		GetPlayerInfo <player> difficulty
		spawnscriptnow morph_scroll_speed params = {player = <player> difficulty = <difficulty> blend_time = 2.0}
	endif
endscript

script GMan_create_difficulty_indicators 
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		GetPlayerInfo <player> part
		GetPlayerInfo <player> difficulty
		switch <difficulty>
			case beginner
			<difficulty_text> = qs(0x7c69c087)
			<icon> = icon_difficulty_beginner
			case easy
			<difficulty_text> = qs(0x33285640)
			<icon> = icon_difficulty_easy
			case medium
			<difficulty_text> = qs(0xfbf1dc48)
			<icon> = icon_difficulty_medium
			case hard
			<difficulty_text> = qs(0x8686280d)
			<icon> = icon_difficulty_hard
			case expert
			<difficulty_text> = qs(0xcc443a5c)
			<icon> = icon_difficulty_expert
			case expert_plus
			<difficulty_text> = qs(0xa672fac7)
			<icon> = icon_difficulty_expert_plus
		endswitch
		GetPlayerInfo <player> double_kick_drum
		if (<part> = Drum && <difficulty> = expert && <double_kick_drum> = 1)
			<difficulty_text> = qs(0xa672fac7)
			<icon> = icon_difficulty_expert_plus
		endif
		if NOT (<part> = vocals)
			get_highway_hud_root_id player = <player>
			if ScreenElementExists id = <highway_hud_root>
				if <highway_hud_root> :Desc_ResolveAlias name = alias_player_meter param = hud_player_meter
					SetScreenElementProps id = <hud_player_meter> difficulty_texture = <icon>
				endif
			endif
		else
			FormatText checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
			if ScreenElementExists id = <competitive_meters_id>
				SetScreenElementProps id = <competitive_meters_id> difficulty_texture = <icon>
			endif
		endif
		GetNextPlayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script GMAN_create_points_indicators \{metric = score}
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		GetPlayerInfo <player> part
		if NOT (<part> = vocals)
			switch <metric>
				case score
				GetPlayerInfo <player> score
				CastToInteger \{score}
				FormatText TextName = text qs(0x4d4555da) s = <score>
			endswitch
			FormatText checksumname = element_id 'p%p_points' p = <player>
			FormatText checksumname = parent_id 'gem_containerp%p' p = <player>
			if ScreenElementExists id = <element_id>
				DestroyScreenElement id = <element_id>
			endif
			CreateScreenElement {
				type = TextElement
				id = <element_id>
				parent = <parent_id>
				rgba = [255 255 255 255]
				font = fontgrid_text_A1
				Pos = (640.0, 320.0)
				text = <text>
				just = [center top]
				scale = (0.5, 0.5)
				z_priority = 31
			}
		endif
		GetNextPlayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script goal_enable_bots 
	Change \{goal_debug_bot_struct = {
			name = 'bot'
			type = bot
			bot_params = {
				bots = [
					{
						player = 1
						id = p1_bot
						hit_percent = 0.90999997
					}
					{
						player = 2
						id = p2_bot
						hit_percent = 0.88
					}
					{
						player = 3
						id = p3_bot
						hit_percent = 0.95
					}
					{
						player = 4
						id = p4_bot
						hit_percent = 0.9
					}
				]
			}
		}}
endscript

script goal_disable_bots 
	Change \{goal_debug_bot_struct = {
			name = 'bot'
			type = bot
			bot_params = {
				bots = [
				]
			}
		}}
endscript
goal_debug_bot_struct = {
	name = 'bot'
	type = bot
	bot_params = {
		bots = [
		]
	}
}

script goal_get_data_sum_all_players 
	<data_sum> = 0
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GMan_GetData goal = <goal_id> player = <player> name = <data_name>
		<data_sum> = (<data_sum> + <...>.<data_name>)
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	return data_sum = <data_sum>
endscript
