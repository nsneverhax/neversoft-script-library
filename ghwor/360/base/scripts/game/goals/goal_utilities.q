
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
		formatText TextName = goal_title qs(0x0bc409e2) a = <goal_string>
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

script goal_spawned_safe_pass_checkpoint 
	if gman_getdata goal = <goal> Name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			gman_getcurrentcheckpoint goal = <goal>
			SoftAssert qs(0x663315dc) s = <current_checkpoint>
		endif
	endif
	gman_setdata goal = <goal> params = {goal_checkpoint_transition = 1}
	gman_passcheckpoint goal = <goal>
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
		else
			gman_failcheckpoint goal = <goal>
		endif
	else
		gman_failcheckpoint goal = <goal>
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
	gman_setquitflag goal = <activated_goal_id>
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

script gman_preqbrgoal 
	printf 'QBRGoal: %g' g = <goal>
	GMan_DeactivateAllGoals
	gman_blockuntilallgoalsdeactivated
	if IsTrue <pakless>
		gman_uninitializeallgoals
		begin
		if gman_allgoalsuninitialized
			break
		endif
		Wait \{2
			gameframes}
		repeat
		gman_getgoalsbypak \{pak = pakless}
		<i> = 0
		begin
		gman_removegoal goal = (<goals_by_pak> [<i>])
		<i> = (<i> + 1)
		repeat <goals_by_pak_size>
	else
		gman_uninitializegoal goal = <goal>
		begin
		if gman_getgoalstate goal = <goal> states = [goal_uninited]
			break
		endif
		printf \{'GMan_preQBRGoal: Block until goal uninited.'}
		Wait \{2
			gameframes}
		repeat
		Wait \{2
			gameframes}
		gman_removegoal goal = <goal>
	endif
endscript

script gman_postqbrgoal 
	if IsTrue <pakless>
		GetArraySize \{$goal_infos_pakless}
		<i> = 0
		begin
		gman_addgoal goal_info = ($goal_infos_pakless [<i>])
		printstruct ($goal_infos_pakless [<i>])
		<i> = (<i> + 1)
		repeat <array_Size>
		gman_initializeallgoals
	else
		AppendSuffixToChecksum Base = <goal> SuffixString = '_goal_info'
		gman_addgoal goal_info = ($<appended_id>)
		Wait \{2
			gameframes}
		gman_initializegoal goal = <goal>
		begin
		if gman_goalisinitialized goal = <goal>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		gman_activategoal goal = <goal>
	endif
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
					formatText TextName = text qs(0x351ed798) g = <goal_string> s = <state_string>
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
							formatText TextName = c_text qs(0x961d63b2) c = <current_checkpoint>
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

script get_current_songs_struct 
	playlist_getcurrentsong
	get_song_struct song = <current_song>
	return song_struct = <song_struct>
endscript

script is_current_song_a_jam_session 
	playlist_getcurrentsong
	if (<current_song> = jamsession)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script gman_startgamemodegoal 
	gamemode_gettype
	if (<Type> = quickplay)
		goal_name = quickplay
		goal_struct = quickplay_info
	elseif (<Type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = fest_mode || $game_mode = fest_mode_team)
			goal_name = competitive
			goal_struct = competitive_info
		elseif ($game_mode = section_scoring)
			Change \{competitive_rules = section_scoring}
			goal_name = competitive
			goal_struct = competitive_info
		endif
	endif
	if GotParam \{goal_name}
		if NOT (GMan_GoalIsActive goal = <goal_name>)
			gman_quickstartgoal goal_struct = <goal_struct> goal_name = <goal_name>
		endif
	endif
endscript

script gman_shutdowngamemodegoal 
	gamemode_gettype
	if (<Type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = section_scoring || $game_mode = fest_mode || $game_mode = fest_mode_team)
			gman_quickremovegoal \{goal_name = competitive}
		endif
	elseif (<Type> = quickplay)
		gman_quickremovegoal \{goal_name = quickplay}
	endif
endscript

script gman_shutdownallgoals \{except = NULL}
	gman_getallloadedgoalids
	if NOT GotParam \{loaded_goal_ids}
		return
	endif
	GetArraySize <loaded_goal_ids>
	if (<array_Size> = 0)
		return
	endif
	i = 0
	begin
	cur_id = (<loaded_goal_ids> [<i>])
	if (<cur_id> != <except>)
		gman_quickremovegoal goal_name = <cur_id>
	endif
	i = (<i> + 1)
	repeat <array_Size>
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
	formatText TextName = final_suffix '_%a' a = <suffix>
	GetArraySize <active_goal_ids>
	if (0 = <array_Size>)
		return
	endif
	i = (<array_Size> - 1)
	begin
	cur_id = (<active_goal_ids> [<i>])
	if GMan_GoalIsActive goal = <cur_id>
		AppendSuffixToChecksum Base = <cur_id> SuffixString = <final_suffix>
		if NOT GotParam \{callback_data}
			<callback_data> = {goal_id = <cur_id>}
		else
			<callback_data> = (<callback_data> + {goal_id = <cur_id>})
		endif
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
	i = (<i> - 1)
	if (<i> < 0)
		break
	endif
	repeat <array_Size>
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

script debug_add_game_rules_text 
	<ruleset> = ($competitive_rules)
	if NOT GlobalExists Name = <ruleset>
		text = qs(0xd4876724)
	else
		text = (($<ruleset>).text)
	endif
	if GotParam \{override}
		text = <override>
	endif
	if GMan_GoalIsActive \{goal = competitive}
		rgba = [20 220 20 255]
	else
		rgba = [220 20 20 255]
	endif
	if ScreenElementExists \{id = debug_goals_text}
		DestroyScreenElement \{id = debug_goals_text}
	endif
	CreateScreenElement {
		Type = TextElement
		just = [top left]
		parent = root_window
		Type = TextBlockElement
		id = debug_goals_text
		text = <text>
		Pos = (100.0, 100.0)
		Scale = 1.5
		just = [left top]
		rgba = <rgba>
		fit_width = `expand	dims`
		fit_height = `expand	dims`
		font = fontgrid_title_a1
	}
endscript

script get_goal_results_data 
	gman_getdata goal = <goal> Name = <results_screen_goal_data>
	if NOT GotParam \{results_screen_goal_data}
		ScriptAssert qs(0x8b1b399f) a = <goal>
		return
	endif
	column_title = (<results_screen_goal_data>.column_title)
	goal_var_source = (<results_screen_goal_data>.data_source)
	goal_var_name = (<results_screen_goal_data>.var_name)
	is_band_data = 0
	column_data = []
	if (<goal_var_source> = player_goal_data)
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			gman_getdata goal = <goal> Player = <Player> Name = <goal_var_name> return_name = recieved_data
			if NOT GotParam \{recieved_data}
				ScriptAssert qs(0xaa773e13) v = <goal_var_name> s = <goal_var_source>
				return
			endif
			<column_data> = (<column_data> + (<recieved_data>))
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
	elseif (<goal_var_source> = player_info_data)
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <Player> (<goal_var_name>) out = recieved_data
			<column_data> = (<column_data> + (<recieved_data>))
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
	elseif (<goal_var_source> = player_goal_data_array)
		gman_getdata goal = <goal> Name = <goal_var_name> return_name = column_data
	elseif (<goal_var_source> = band_info_data)
		is_band_data = 1
		getbandsstatus
		GetArraySize <bands>
		i = 0
		begin
		if (<bands> [<i>].in_game)
			getbandinfo (<i> + 1) score out = recieved_data
			<column_data> = (<column_data> + (<recieved_data>))
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return goal_results_column_title = <column_title> goal_results_column_data = <column_data> is_band_data = <is_band_data>
endscript
