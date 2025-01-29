core_goal_info = {
	Name = 'core_goal'
	goal_type = core
	checkpoints = [
		{
			Name = 'main'
			tools = [
				{
					Name = 'song'
					Type = song
				}
			]
		}
	]
}

script goal_time_expired \{show_expire_message = 1}
	printf 'goal_time_expired - %a' a = <goal_id>
	if (<show_expire_message> = 1)
	endif
	broadcastevent \{Type = goal_expired}
endscript

script goal_get_checkpoint_ui 
	RequireParams \{[
			goal
			checkpoint
		]
		all}
	if gman_getconstant goal = <goal> Name = checkpoint_ui
		if StructureContains structure = <checkpoint_ui> <checkpoint>
			return true checkpoint_ui = (<checkpoint_ui>.<checkpoint>)
		endif
	endif
	return \{FALSE}
endscript

script goal_get_title 
	RequireParams \{[
			goal
		]
		all}
	if gman_getconstant goal = <goal> Name = goal_title
		return goal_title = <goal_title>
	else
		gman_getgoalstring goal = <goal>
		formatText TextName = goal_title qs(0x35b12509) a = <goal_string>
		return goal_title = <goal_title>
	endif
endscript

script goal_get_desc 
	RequireParams \{[
			goal
		]
		all}
	if NOT GotParam \{checkpoint}
		gman_getcurrentcheckpoint goal = <goal>
		<checkpoint> = <current_checkpoint>
	endif
	if goal_get_checkpoint_ui goal = <goal> checkpoint = <checkpoint>
		if StructureContains structure = <checkpoint_ui> goal_desc
			return goal_desc = (<checkpoint_ui>.goal_desc)
		endif
	endif
	if gman_getconstant goal = <goal> Name = goal_desc
		return goal_desc = <goal_desc>
	endif
	return \{goal_desc = qs(0xe2d2ef7d)}
endscript

script goal_end_run_script_launcher 
	GMan_GetActivatedGoalId
	SpawnScriptLater <end_run_script> params = {goal_id = <activated_goal_id>}
endscript

script gman_passcheckpoint 
	if NOT gman_getgoalstate goal = <goal> states = [goal_activated]
		SoftAssert qs(0xdb87bb49) g = <goal> s = <goal_state>
		return
	endif
	SpawnScriptNow goal_spawned_safe_pass_checkpoint params = {goal = <goal>}
endscript

script goal_spawned_safe_pass_checkpoint 
	if gman_getdata goal = <goal> Name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			gman_getcurrentcheckpoint goal = <goal>
			SoftAssert qs(0x663315dc) s = <current_checkpoint>
		endif
	endif
	gman_setdata goal = <goal> params = {goal_checkpoint_transition = 1}
	gman_spawnedsafepasscheckpoint goal = <goal>
endscript

script gman_failcheckpoint \{show_retry_dialog = 0}
	if NOT gman_getgoalstate goal = <goal> states = [goal_activated]
		SoftAssert qs(0x150cd07e) g = <goal> s = <goal_state>
		return
	endif
	SpawnScriptLater noqbid goal_spawned_safe_fail_checkpoint params = {
		goal = <goal>
		txt = <txt>
		show_retry_dialog = <show_retry_dialog>
	}
endscript

script goal_spawned_safe_fail_checkpoint \{show_retry_dialog = 0}
	if GotParam \{goal_id}
		<goal> = <goal_id>
	endif
	if gman_getdata goal = <goal> Name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			gman_getcurrentcheckpoint goal = <goal>
			SoftAssert qs(0x663315dc) s = <current_checkpoint>
		endif
	endif
	gman_setdata goal = <goal> params = {goal_checkpoint_transition = 1}
	if GotParam \{show_retry_dialog}
		if (<show_retry_dialog> = 1)
			goal_failed_retry_options goal = <goal> txt = <txt>
		else
			gman_spawnedsafefailcheckpoint goal = <goal>
		endif
	else
		gman_spawnedsafefailcheckpoint goal = <goal>
	endif
endscript

script goal_retry_current_goal 
	printf \{'goal_retry_current_goal'}
	if gman_canretrycurrentgoal
		gman_getcurrentretryablegoalid
		if gman_getdata goal = <current_retryable_goal_id> Name = retry
			printf \{'goal_retry_current_goal: WARNING: retry current already active, ignoring'}
			return
		endif
		gman_setretryflag \{Type = current}
		gman_deactivatetools goal = <current_retryable_goal_id>
		gman_retrycurrentgoal
	else
		printf \{'goal_retry_current_goal - WARNING: cannot retry current goal'}
	endif
endscript
goal_is_between_retries = 0

script goal_retry_last_goal 
	goal_viewport_kill \{all}
	SpawnScriptNow \{goal_retry_last_goal_spawned}
endscript

script goal_retry_last_goal_spawned 
	disable_pause
	if gman_canretrylastgoal
		gman_setretryflag \{Type = last}
		gman_getlastretryablegoalid
		Change \{goal_is_between_retries = 1}
		disable_pause
		KillSkaterCamAnim \{current}
		stuckcheck = 200
		begin
		if gman_getgoalstate goal = <last_retryable_goal_id> states = $goal_idle_states
			break
		endif
		Wait \{2
			gameframes}
		stuckcheck = (<stuckcheck> - 1)
		if (<stuckcheck> = 0)
			SoftAssert \{qs(0x29c519a2)}
		endif
		repeat
		if NOT gman_goalisinitialized goal = <last_retryable_goal_id>
			stuckcheck = 200
			begin
			Wait \{2
				gameframes}
			if NOT gman_getgoalstate goal = <last_retryable_goal_id> states = [goal_uniniting]
				break
			endif
			stuckcheck = (<stuckcheck> - 1)
			if (<stuckcheck> = 0)
				SoftAssert \{qs(0x8793d1d4)}
			endif
			repeat
			gman_initializegoal goal = <last_retryable_goal_id>
			stuckcheck = 200
			begin
			Wait \{2
				gameframes}
			if gman_goalisinitialized goal = <last_retryable_goal_id>
				break
			endif
			stuckcheck = (<stuckcheck> - 1)
			if (<stuckcheck> = 0)
				SoftAssert \{qs(0xbc755570)}
			endif
			repeat
		endif
		gman_retrylastgoal
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
	formatText checksumName = current_zone '%s' s = (<level_structure>.level)
	if NOT checksumequals a = <new_zone> b = <current_zone>
		<should_load> = 0
		if NOT checksumequals a = <new_zone> b = <current_zone>
			<should_load> = 1
		endif
		if (<should_load> = 1)
			printf 'goal_move_player_load_zone: Starting a hard zone load (from %a to %b)' a = <current_zone> b = <new_zone>
			if NOT GotParam \{new_level}
				SetButtonEventMappings \{block_menu_input}
				if GMan_GetActivatedGoalId
					load_level_handle_loading_screen
				else
					load_level_handle_movie_loading_screen level = <new_zone>
				endif
			endif
			SpawnScriptNow goal_wait_retry_zone_load params = {new_zone = <new_zone> new_level = <new_level> goal = <goal>}
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
	if NOT gman_goalexists goal = <retry_goal>
		ScriptAssert qs(0xc6554b2a) d = <retry_goal>
	endif
	if NOT gman_getconstant goal = <retry_goal> Name = start_zone
		ScriptAssert qs(0x544d1825) d = <retry_goal>
	endif
	if gman_getcheckpointstartzone goal = <retry_goal>
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
		if gman_getconstant goal = <retry_goal> Name = trigger_pos
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
		if gman_goalexists goal = <goal>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	elseif GotParam \{new_zone}
		SetPakManCurrentBlock map = zones pak = <new_zone>
		Wait \{0.5
			Seconds
			ignoreslomo}
		if NOT zoneloadedandparsed <new_zone>
			Wait \{1
				gameframe}
			printf \{'goal_retry_load_zone: Done waiting for zone to unload, starting actual load.'}
			SetPakManCurrentBlock map = zones pak = <new_zone>
		endif
	else
		ScriptAssert \{qs(0xe4404b2d)}
	endif
	Change \{goal_zone_loading = 0}
	LaunchEvent \{broadcast
		Type = goal_retry_load_zone_done}
	SetButtonEventMappings \{unblock_menu_input}
	printf \{'goal_retry_load_zone: Finished hard zone load.'}
endscript

script goal_debug_beat_checkpoint 
	printf \{'goal_debug_beat_checkpoint'}
	GMan_GetActivatedGoalId
	begin
	if gman_goalisinitialized goal = <activated_goal_id>
		break
	endif
	if NOT GMan_HasActiveGoals
		break
	endif
	printf \{'Debug beat checkpoint: Waiting for goal to finish initializing.'}
	Wait \{2
		gameframes}
	repeat
	if GMan_GetActivatedGoalId
		KillSkaterCamAnim \{current}
		gman_passcheckpoint goal = <activated_goal_id>
	endif
endscript

script goal_quit_current_goal \{from_pause = true}
	Wait \{1
		gameframe}
	if ScreenElementExists \{id = goal_message}
		RunScriptOnScreenElement \{id = goal_message
			kill_panel_message}
	endif
	ui_kill_all_messages \{instant = 1}
	GMan_GetActivatedGoalId
	gman_setquitflag
	GMan_DeactivateAllGoals
	gman_blockuntilallgoalsdeactivated
	gman_unsetquitflag goal = <activated_goal_id>
	if (<from_pause> = true)
	endif
endscript

script goal_move_player \{Player = player0_body}
	if CompositeObjectExists <Player>
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
			SoftAssert \{qs(0x5a68e6bb)}
		endif
		if GotParam \{zone}
			goal_move_player_load_zone zone = <zone>
			if NOT GotParam \{no_zone_load_necessary}
				Block \{Type = goal_retry_load_zone_done}
			endif
		endif
		<Player> :movementresolution_teleportobject Pos = <Pos>
		getplayercamera <Player>
		if GotParam \{player_camera}
			<player_camera> :camerablender_reset
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
		gman_getgoaltype goal = <goal>
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
				kill Name = <object_name>
				<i> = (<i> + 1)
				repeat <array_Size>
				case add
				begin
				<object_name> = (<objects> [<i>])
				create Name = <object_name>
				<i> = (<i> + 1)
				repeat <array_Size>
				case reset
				begin
				<object_name> = (<objects> [<i>])
				kill Name = <object_name>
				create Name = <object_name>
				<i> = (<i> + 1)
				repeat <array_Size>
				case glow
				begin
				<object_name> = (<objects> [<i>])
				<object_name> :Obj_SetOutlineFlag On
				<i> = (<i> + 1)
				repeat <array_Size>
				case remove_prefix
				begin
				<object_name> = (<objects> [<i>])
				kill prefix = <object_name>
				<i> = (<i> + 1)
				repeat <array_Size>
				case add_prefix
				begin
				<object_name> = (<objects> [<i>])
				create prefix = <object_name>
				<i> = (<i> + 1)
				repeat <array_Size>
				case reset_prefix
				begin
				<object_name> = (<objects> [<i>])
				kill Name = <object_name>
				create Name = <object_name>
				<i> = (<i> + 1)
				repeat <array_Size>
				default
			endswitch
		else
			if GotParam \{object}
				switch <action>
					case remove
					kill Name = <object>
					case add
					create Name = <object>
					case remove_prefix
					kill prefix = <object>
					case add_prefix
					create prefix = <object>
					case reset
					kill prefix = <object>
					create prefix = <object>
					case reset_prefix
					kill prefix = <object>
					create prefix = <object>
					case glow
					<object> :Obj_SetOutlineFlag On
					default
				endswitch
			endif
		endif
	endif
	MemPopContext
endscript

script gman_blockuntilallgoalsdeactivated 
	begin
	printf \{'GMan_BlockUntilAllGoalsDeactivated - Waiting for active goals...'}
	if NOT GMan_HasActiveGoals
		break
	endif
	Wait \{1
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
		SoftAssert 'Grade %s must be in range [0 3]' s = <grade>
		return
	endif
	gman_setpendinggrade goal = <goal> grade = <grade>
	if GotParam \{UI}
		SpawnScriptNow goal_ui_announce_pending_grade params = {goal = <goal> grade = <grade> mode = <UI>}
	endif
endscript

script gman_preqbrgoal 
	ScriptAssert \{'GMan_preQBRGoal: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script gman_postqbrgoal 
	ScriptAssert \{'GMan_postQBRGoal: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script goal_event_has_occurred 
	formatText checksumName = already_triggered_flag '%s_already_triggered_flag' s = <event_string>
	if gman_getdata goal = <goal> Name = <already_triggered_flag>
		if ((<...>.<already_triggered_flag>) = true)
			return \{true}
		endif
	else
		gman_setdata goal = <goal> Name = <already_triggered_flag> value = FALSE initial
	endif
	gman_setdata goal = <goal> Name = <already_triggered_flag> value = true
	return \{FALSE}
endscript

script goal_debug_show_states 
	begin
	if ScreenElementExists \{id = goal_debug_state_menu}
		DestroyScreenElement \{id = goal_debug_state_menu}
	endif
	CreateScreenElement \{id = goal_debug_state_menu
		Type = ContainerElement
		parent = root_window
		Scale = 0.52
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
		Type = VMenu
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
		<num_types> = <array_Size>
		<j> = 0
		<goal_iter> = 0
		begin
		<goal_type> = ($goal_types [<j>])
		RemoveParameter \{goals_by_type}
		if gman_getgoalsbytype Type = <goal_type>
			GetArraySize <goals_by_type>
			<num_goals> = <array_Size>
			if (<num_goals> > 0)
				<i> = 0
				begin
				<goal> = (<goals_by_type> [<i>])
				if gman_goalexists goal = <goal>
					gman_getgoalstate goal = <goal>
					gman_getgoalstring goal = <goal>
					stringremove text = <goal_string> remove = 'm_' new_string = goal_string
					<state_string> = '?'
					switch <goal_state>
						case goal_activating
						<state_string> = 'act.ing'
						case goal_deactivating
						<state_string> = 'deact.'
						case goal_initing
						<state_string> = 'initing'
						case goal_uniniting
						<state_string> = 'uniniting'
						case goal_result
						<state_string> = 'result'
						case goal_activated
						<state_string> = 'RUN'
						case goal_inactive
						<state_string> = 'inactive'
						case goal_uninited
						<state_string> = 'uninited'
					endswitch
					formatText TextName = text qs(0x351ed798) g = <goal_string> s = <state_string> DontAssertForChecksums
					if NOT ((checksumequals a = <goal_state> b = goal_uninited) || (checksumequals a = <goal_state> b = goal_inactive))
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
						if GMan_GetActivatedGoalId
							if checksumequals a = <activated_goal_id> b = <goal>
								CreateScreenElement {
									Type = TextElement
									parent = {goal_debug_state_menu child = <column>}
									font = text_a1
									text = <text>
									rgba = <text_color>
									Shadow
									shadow_offs = (1.0, 1.0)
								}
							endif
						else
							CreateScreenElement {
								Type = TextElement
								parent = {goal_debug_state_menu child = <column>}
								font = text_a1
								text = <text>
								rgba = <text_color>
								Shadow
								shadow_offs = (1.0, 1.0)
							}
						endif
						if checksumequals a = <goal_state> b = goal_activated
							gman_getcurrentcheckpoint goal = <goal>
							formatText TextName = c_text qs(0x961d63b2) c = <current_checkpoint> DontAssertForChecksums
							CreateScreenElement {
								Type = TextElement
								parent = goal_debug_state_menu
								font = text_a1
								text = <c_text>
								rgba = <text_color>
								Shadow
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
	Wait \{10
		gameframes}
	repeat
endscript

script gman_initializegoalblocking \{goal = unset}
	gman_initializegoal goal = <goal>
	begin
	if gman_goalisinitialized goal = <goal>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script quick_start_goal \{activate = true}
	quick_remove_goal goal_name = <goal_name>
	gman_addgoal goal_info = ($<goal_struct>)
	gman_initializegoal goal = <goal_name>
	begin
	if gman_goalisinitialized goal = <goal_name>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<activate> = true)
		gman_activategoal goal = <goal_name>
	endif
endscript

script quick_remove_goal 
	if gman_goalexists goal = <goal_name>
		if gman_goalisinitialized goal = <goal_name>
			if GMan_GoalIsActive goal = <goal_name>
				gman_deactivategoal goal = <goal_name>
				begin
				if NOT GMan_GoalIsActive goal = <goal_name>
					break
				endif
				Wait \{1
					gameframe}
				repeat
			endif
			gman_uninitializegoal goal = <goal_name>
			begin
			if NOT gman_goalisinitialized goal = <goal_name>
				break
			endif
			Wait \{1
				gameframe}
			repeat
		endif
		gman_removegoal goal = <goal_name>
	endif
endscript

script gman_songtool_setcurrentsong \{song = unset}
	gman_songfunc func = set_current_song params = {song = <song>}
endscript

script gman_songtool_getcurrentsong 
	current_song = None
	gman_songfunc \{func = get_current_song}
	return current_song = <current_song>
endscript

script gman_songtool_getcurrentsongversion 
	gman_songfunc \{func = get_current_song_version}
	return current_song_version = <current_song_version>
endscript

script gman_songtool_getnextsong 
	next_song = None
	gman_songfunc \{func = get_next_song}
	return next_song = <next_song>
endscript

script gman_songtool_songwon 
	GuitarEvent_SongWon
endscript

script get_current_songs_struct 
	gman_songtool_getcurrentsong
	get_song_struct song = <current_song>
	return song_struct = <song_struct>
endscript

script is_current_song_a_jam_session 
	gman_songtool_getcurrentsong
	if (<current_song> = jamsession)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script gman_startgamemodegoal 
	gamemode_gettype
	if (<Type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = fest_mode || $game_mode = fest_mode_team)
			goal_name = competitive
			goal_struct = competitive_info
		elseif ($game_mode = section_scoring)
			Change \{competitive_rules = section_scoring}
			goal_name = competitive
			goal_struct = competitive_info
		endif
	elseif (<Type> = career)
		goal_name = career
		goal_struct = career_info
	endif
	if GotParam \{goal_name}
		if NOT (GMan_GoalIsActive goal = <goal_name>)
			quick_start_goal goal_struct = <goal_struct> goal_name = <goal_name>
		endif
	endif
endscript

script gman_shutdowngamemodegoal 
	gamemode_gettype
	if (<Type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = section_scoring || $game_mode = fest_mode || $game_mode = fest_mode_team)
			quick_remove_goal \{goal_name = competitive}
		endif
	endif
endscript

script gman_shutdownallgoals 
	gman_getactivatedgoalids
	if NOT GotParam \{active_goal_ids}
		return
	endif
	GetArraySize <active_goal_ids>
	if (<array_Size> = 0)
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
	repeat <array_Size>
endscript

script gman_disable_highway \{Player = 1}
	setplayerinfo <Player> interactive = 0
	destroy_highway_prepass <...>
	hide_highway_hud Player = <Player>
	formatText checksumName = Name 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <Name>
		safe_hide id = <Name>
	endif
	formatText checksumName = Name 'gem_containerp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <Name>
		safe_hide id = <Name>
	endif
	formatText checksumName = Name 'Gem_basebarp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <Name>
		safe_hide id = <Name>
	endif
	formatText checksumName = Name 'highway_containerp%p' p = <Player>
	if ScreenElementExists id = <Name>
		safe_hide id = <Name>
	endif
endscript

script goal_start_section_watcher 
	SpawnScriptNow section_watcher params = {<...>}
endscript

script section_watcher \{show_timer = 0
		use_vocal_markers = 0}
	printf \{channel = goal
		'Section Watcher Started...'}
	<section> = 0
	gman_setdata goal = <goal_id> params = {current_section = <section>}
	gman_songtool_getcurrentsong
	if GlobalExists Name = <goal_id>
		if StructureContains structure = ($<goal_id>) required_band
			if ArrayContains array = ($<goal_id>.required_band) contains = vocal
				<use_vocal_markers> = 1
			endif
		endif
	endif
	if (<use_vocal_markers> = 1)
		songfilemanager func = get_marker_array song_name = <current_song> part = vocals
	else
		songfilemanager func = get_marker_array song_name = <current_song> part = guitar
	endif
	<song_section_array> = <marker_array>
	GetArraySize <song_section_array>
	songfilemanager func = get_song_end_time song_name = <current_song>
	if (<array_Size> = 0)
		printf \{channel = goal
			'No markers found in song, exiting section_watcher...'}
		return
	endif
	GetSongTimeMs
	<new_time> = ((<song_section_array> [1].time) - (<time>))
	if (<show_timer> = 1)
		CastToInteger \{new_time}
		gman_timerfunc goal = <goal_id> tool = section_timer func = set_precise_start_time params = {precise_time = (<new_time>)}
		printf channel = goal 'timer set to %s seconds...' s = (<new_time> / 1000.0)
		gman_timerfunc goal = <goal_id> tool = section_timer func = attach_timer_to_player params = {Player = 0}
		gman_timerfunc goal = <goal_id> tool = section_timer func = reset
		gman_timerfunc goal = <goal_id> tool = section_timer func = show
		gman_timerfunc goal = <goal_id> tool = section_timer func = start
	endif
	begin
	GetSongTimeMs
	CastToInteger \{time}
	if (<section> = (<array_Size> - 1))
		break
	elseif ((<song_section_array> [(<section> + 1)].time) < (<time>))
		broadcastevent Type = song_section_end data = {section = <section>}
		if (<show_timer> = 1)
			if (<section> = (<array_Size> - 2))
				<new_time> = ((<total_end_time>) - (<time>))
				if (<new_time> < 0)
					break
				endif
			else
				<new_time> = ((<song_section_array> [<section> + 2].time) - (<time>))
			endif
			CastToInteger \{new_time}
			gman_timerfunc goal = <goal_id> tool = section_timer func = set_precise_start_time params = {precise_time = (<new_time>)}
			printf channel = competitive 'timer set to %s seconds...' s = (<new_time> / 1000.0)
			gman_timerfunc goal = <goal_id> tool = section_timer func = attach_timer_to_player params = {Player = 0}
			gman_timerfunc goal = <goal_id> tool = section_timer func = reset
			gman_timerfunc goal = <goal_id> tool = section_timer func = show
			gman_timerfunc goal = <goal_id> tool = section_timer func = start
		endif
		<section> = (<section> + 1)
		gman_setdata goal = <goal_id> params = {current_section = <section>}
	endif
	Wait \{1
		gameframe}
	repeat
	begin
	GetSongTimeMs
	CastToInteger \{time}
	if (<time> > <total_end_time>)
		broadcastevent Type = song_section_end data = {section = <section>}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script section_fret_display \{use_vocal_markers = 0}
	gman_songtool_getcurrentsong
	if GlobalExists Name = <goal_id>
		if StructureContains structure = ($<goal_id>) required_band
			if ArrayContains array = ($<goal_id>.required_band) contains = vocal
				<use_vocal_markers> = 1
			endif
		endif
	endif
	if (<use_vocal_markers> = 1)
		songfilemanager func = get_marker_array song_name = <current_song> part = vocals
	else
		songfilemanager func = get_marker_array song_name = <current_song> part = guitar
	endif
	<song_section_array> = <marker_array>
	GetArraySize <song_section_array>
	if (<array_Size> = 0)
		printf \{channel = goal
			'No markers found in song, exiting section_watcher...'}
		return
	else
		<marker_array_size> = <array_Size>
	endif
	gman_songfunc \{func = get_current_song_playlist_index}
	<current_song_index> = (<current_song_index> - 1)
	if StructureContains structure = ($<goal_id>) song_sections
		GetArraySize (($<goal_id>).song_sections [<current_song_index>])
		<challenge_array_size> = <array_Size>
	else
		return
	endif
	<section_index> = 0
	challenge_fretbars_array = []
	begin
	<index_number> = (($<goal_id>).song_sections [<current_song_index>] [<section_index>])
	<section_enter> = (<song_section_array> [<index_number>].time)
	if ((<index_number> + 1) >= <marker_array_size>)
		songfilemanager func = get_song_end_time song_name = <current_song>
		<section_end> = <total_end_time>
	else
		<section_end> = (<song_section_array> [(<index_number> + 1)].time)
	endif
	<challenge_fretbars_array> = (<challenge_fretbars_array> + {start = <section_enter> , end = <section_end>})
	<section_index> = (<section_index> + 1)
	repeat <challenge_array_size>
	getnumplayersingame
	getfirstplayer
	begin
	<player_instrument> = valid
	challenge_validate_player_instrument goal_id = <goal_id> Player = <Player>
	if (<player_instrument> = valid)
		set_challenge_marker_times Player = <Player> challenge_marker_times = <challenge_fretbars_array> side_glow = 1
	endif
	getnextplayer Player = <Player>
	repeat <num_players>
endscript

script set_challenge_marker_times 
	RequireParams \{[
			Player
			challenge_marker_times
		]
		all}
	if NOT playerinfoequals <Player> part = vocals
		setchallengemarkertimes Player = <Player> challenge_marker_times = <challenge_marker_times> side_glow = <side_glow>
	else
		vocals_setchallengemarkertimes Player = <Player> challenge_fretbars_array = <challenge_marker_times>
	endif
endscript

script goal_set_player_data_all_players \{params = {
		}}
	RequireParams \{[
			goal
			params
		]
		all}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_setdata goal = <goal> Player = <Player> params = <params>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script gman_sendcallbacktoallgoals 
	RequireParams \{[
			suffix
		]
		all}
	gman_getactivatedgoalids
	if NOT GotParam \{active_goal_ids}
		return
	endif
	formatText TextName = final_suffix '_%a' a = <suffix>
	GetArraySize <active_goal_ids>
	i = 0
	begin
	cur_id = (<active_goal_ids> [<i>])
	if GMan_GoalIsActive goal = <cur_id>
		AppendSuffixToChecksum Base = <cur_id> SuffixString = <final_suffix>
		if ScriptExists <appended_id>
			<appended_id> <callback_data>
		endif
		formatText checksumName = suffix_checksum '%d' d = <suffix>
		if gman_getconstant goal = <cur_id> Name = <suffix_checksum> return_name = custom_callback
			if ScriptExists <custom_callback>
				<custom_callback> <callback_data>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script gman_adjust_difficulty 
	RequireParams \{[
			Player
			adjustment
		]
		all}
	getplayerinfo <Player> difficulty
	get_difficulty_text difficulty = <difficulty>
	<difficulty_text> = <difficulty_text_nl>
	switch <adjustment>
		case up
		switch <difficulty>
			case beginner
			setplayerinfo <Player> difficulty = easy
			case easy
			setplayerinfo <Player> difficulty = medium
			case medium
			setplayerinfo <Player> difficulty = hard
			case hard
			setplayerinfo <Player> difficulty = expert
			setplayerinfo <Player> double_kick_drum = 0
			case expert
			getplayerinfo <Player> part
			if (<part> = drum)
				setplayerinfo <Player> double_kick_drum = 1
				competitive_main_difficulty_watcher_varupdated Player = <Player> current_value = expert_plus
			endif
		endswitch
		case down
		switch <difficulty>
			case easy
			setplayerinfo <Player> difficulty = beginner
			case medium
			setplayerinfo <Player> difficulty = easy
			case hard
			setplayerinfo <Player> difficulty = medium
			case expert
			getplayerinfo <Player> part
			getplayerinfo <Player> double_kick_drum
			if (<part> = drum && <double_kick_drum> = 1)
				setplayerinfo <Player> double_kick_drum = 0
				competitive_main_difficulty_watcher_varupdated Player = <Player> current_value = expert
			else
				setplayerinfo <Player> difficulty = hard
			endif
		endswitch
		case beginner
		setplayerinfo <Player> difficulty = beginner
		case easy
		setplayerinfo <Player> difficulty = easy
		case medium
		setplayerinfo <Player> difficulty = medium
		case hard
		setplayerinfo <Player> difficulty = hard
		case expert
		setplayerinfo <Player> difficulty = expert
	endswitch
	getplayerinfo <Player> part
	if NOT (<part> = vocals)
		getplayerinfo <Player> difficulty
		SpawnScriptNow morph_scroll_speed params = {Player = <Player> difficulty = <difficulty> blend_time = 2.0}
	endif
endscript

script gman_create_difficulty_indicators 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		getplayerinfo <Player> difficulty
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
		getplayerinfo <Player> double_kick_drum
		if (<part> = drum && <difficulty> = expert && <double_kick_drum> = 1)
			<difficulty_text> = qs(0xa672fac7)
			<icon> = icon_difficulty_expert_plus
		endif
		if NOT (<part> = vocals)
			get_highway_hud_root_id Player = <Player>
			if ScreenElementExists id = <highway_hud_root>
				if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
					SetScreenElementProps id = <hud_player_meter> difficulty_texture = <icon>
				endif
			endif
		else
			formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
			if ScreenElementExists id = <competitive_meters_id>
				SetScreenElementProps id = <competitive_meters_id> difficulty_texture = <icon>
			endif
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script gman_create_points_indicators \{metric = score}
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		if NOT (<part> = vocals)
			switch <metric>
				case score
				getplayerinfo <Player> score
				CastToInteger \{score}
				formatText TextName = text qs(0x4d4555da) s = <score>
			endswitch
			formatText checksumName = element_id 'p%p_points' p = <Player>
			formatText checksumName = parent_id 'gem_containerp%p' p = <Player>
			if ScreenElementExists id = <element_id>
				DestroyScreenElement id = <element_id>
			endif
			CreateScreenElement {
				Type = TextElement
				id = <element_id>
				parent = <parent_id>
				rgba = [255 255 255 255]
				font = fontgrid_text_a1
				Pos = (640.0, 320.0)
				text = <text>
				just = [center top]
				Scale = (0.5, 0.5)
				z_priority = 31
			}
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script goal_enable_bots 
	Change \{goal_debug_bot_struct = {
			Name = 'bot'
			Type = bot
			bot_params = {
				bots = [
					{
						Player = 1
						id = p1_bot
						hit_percent = 0.90999997
					}
					{
						Player = 2
						id = p2_bot
						hit_percent = 0.88
					}
					{
						Player = 3
						id = p3_bot
						hit_percent = 0.95
					}
					{
						Player = 4
						id = p4_bot
						hit_percent = 0.9
					}
				]
			}
		}}
endscript

script goal_disable_bots 
	Change \{goal_debug_bot_struct = {
			Name = 'bot'
			Type = bot
			bot_params = {
				bots = [
				]
			}
		}}
endscript
goal_debug_bot_struct = {
	Name = 'bot'
	Type = bot
	bot_params = {
		bots = [
		]
	}
}

script goal_get_data_sum_all_players 
	<data_sum> = 0
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_getdata goal = <goal_id> Player = <Player> Name = <data_name>
		<data_sum> = (<data_sum> + <...>.<data_name>)
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return data_sum = <data_sum>
endscript
