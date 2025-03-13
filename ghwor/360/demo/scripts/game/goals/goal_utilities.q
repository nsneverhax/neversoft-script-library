
script goal_time_expired \{show_expire_message = 1}
	printf 'goal_time_expired - %a' a = <goal_id>
	if (<show_expire_message> = 1)
	endif
	broadcastevent \{type = goal_expired}
endscript

script goal_get_checkpoint_ui 
	requireparams \{[
			goal
			checkpoint
		]
		all}
	if gman_getconstant goal = <goal> name = checkpoint_ui
		if structurecontains structure = <checkpoint_ui> <checkpoint>
			return true checkpoint_ui = (<checkpoint_ui>.<checkpoint>)
		endif
	endif
	return \{false}
endscript

script goal_get_title 
	requireparams \{[
			goal
		]
		all}
	if gman_getconstant goal = <goal> name = goal_title
		return goal_title = <goal_title>
	else
		gman_getgoalstring goal = <goal>
		formattext textname = goal_title qs(0x0bc409e2) a = <goal_string>
		return goal_title = <goal_title>
	endif
endscript

script goal_get_desc 
	requireparams \{[
			goal
		]
		all}
	if NOT gotparam \{checkpoint}
		gman_getcurrentcheckpoint goal = <goal>
		<checkpoint> = <current_checkpoint>
	endif
	if goal_get_checkpoint_ui goal = <goal> checkpoint = <checkpoint>
		if structurecontains structure = <checkpoint_ui> goal_desc
			return goal_desc = (<checkpoint_ui>.goal_desc)
		endif
	endif
	if gman_getconstant goal = <goal> name = goal_desc
		return goal_desc = <goal_desc>
	endif
	return \{goal_desc = qs(0xe2d2ef7d)}
endscript

script goal_end_run_script_launcher 
	gman_getactivatedgoalid
	spawnscriptlater <end_run_script> params = {goal_id = <activated_goal_id>}
endscript

script goal_spawned_safe_pass_checkpoint 
	if gman_getdata goal = <goal> name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			gman_getcurrentcheckpoint goal = <goal>
			softassert qs(0x663315dc) s = <current_checkpoint>
		endif
	endif
	gman_setdata goal = <goal> params = {goal_checkpoint_transition = 1}
	gman_passcheckpoint goal = <goal>
endscript

script goal_spawned_safe_fail_checkpoint \{show_retry_dialog = 0}
	if gotparam \{goal_id}
		<goal> = <goal_id>
	endif
	if gman_getdata goal = <goal> name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			gman_getcurrentcheckpoint goal = <goal>
			softassert qs(0x663315dc) s = <current_checkpoint>
		endif
	endif
	gman_setdata goal = <goal> params = {goal_checkpoint_transition = 1}
	if gotparam \{show_retry_dialog}
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
		if gman_getdata goal = <current_retryable_goal_id> name = retry
			printf \{'goal_retry_current_goal: WARNING: retry current already active, ignoring'}
			return
		endif
		gman_setretryflag \{type = current}
		gman_deactivatetools goal = <current_retryable_goal_id>
		gman_retrycurrentgoal
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
	if gman_canretrylastgoal
		gman_setretryflag \{type = last}
		gman_getlastretryablegoalid
		change \{goal_is_between_retries = 1}
		disable_pause
		killskatercamanim \{current}
		stuckcheck = 200
		begin
		if gman_getgoalstate goal = <last_retryable_goal_id> states = $goal_idle_states
			break
		endif
		wait \{2
			gameframes}
		stuckcheck = (<stuckcheck> - 1)
		if (<stuckcheck> = 0)
			softassert \{qs(0x29c519a2)}
		endif
		repeat
		if NOT gman_goalisinitialized goal = <last_retryable_goal_id>
			stuckcheck = 200
			begin
			wait \{2
				gameframes}
			if NOT gman_getgoalstate goal = <last_retryable_goal_id> states = [goal_uniniting]
				break
			endif
			stuckcheck = (<stuckcheck> - 1)
			if (<stuckcheck> = 0)
				softassert \{qs(0x8793d1d4)}
			endif
			repeat
			gman_initializegoal goal = <last_retryable_goal_id>
			stuckcheck = 200
			begin
			wait \{2
				gameframes}
			if gman_goalisinitialized goal = <last_retryable_goal_id>
				break
			endif
			stuckcheck = (<stuckcheck> - 1)
			if (<stuckcheck> = 0)
				softassert \{qs(0xbc755570)}
			endif
			repeat
		endif
		gman_retrylastgoal
	else
		enable_pause
	endif
endscript

script goal_move_player_load_zone 
	requireparams \{[
			zone
		]
		all}
	printf \{'goal_move_player_load_zone'}
	<new_zone> = <zone>
	getcurrentlevel
	formattext checksumname = current_zone '%s' s = (<level_structure>.level)
	if NOT checksumequals a = <new_zone> b = <current_zone>
		<should_load> = 0
		if NOT checksumequals a = <new_zone> b = <current_zone>
			<should_load> = 1
		endif
		if (<should_load> = 1)
			printf 'goal_move_player_load_zone: Starting a hard zone load (from %a to %b)' a = <current_zone> b = <new_zone>
			if NOT gotparam \{new_level}
				setbuttoneventmappings \{block_menu_input}
				if gman_getactivatedgoalid
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
goal_zone_loading = 0

script goal_wait_retry_zone_load 
	printf \{'goal_wait_retry_zone_load'}
	change \{goal_zone_loading = 1}
	if gotparam \{new_level}
		requireparams \{[
				goal
			]
			all}
		change goal_startup_goal = <goal>
		change_level level = <new_level>
		printf \{'goal_wait_retry_zone_load - waiting for goal'}
		begin
		if gman_goalexists goal = <goal>
			break
		endif
		wait \{1
			gameframe}
		repeat
	elseif gotparam \{new_zone}
		setpakmancurrentblock map = zones pak = <new_zone>
		wait \{0.5
			seconds
			ignoreslomo}
		if NOT zoneloadedandparsed <new_zone>
			wait \{1
				gameframe}
			printf \{'goal_retry_load_zone: Done waiting for zone to unload, starting actual load.'}
			setpakmancurrentblock map = zones pak = <new_zone>
		endif
	else
		scriptassert \{qs(0xe4404b2d)}
	endif
	change \{goal_zone_loading = 0}
	launchevent \{broadcast
		type = goal_retry_load_zone_done}
	setbuttoneventmappings \{unblock_menu_input}
	printf \{'goal_retry_load_zone: Finished hard zone load.'}
endscript

script goal_debug_beat_checkpoint 
	printf \{'goal_debug_beat_checkpoint'}
	gman_getactivatedgoalid
	begin
	if gman_goalisinitialized goal = <activated_goal_id>
		break
	endif
	if NOT gman_hasactivegoals
		break
	endif
	printf \{'Debug beat checkpoint: Waiting for goal to finish initializing.'}
	wait \{2
		gameframes}
	repeat
	if gman_getactivatedgoalid
		killskatercamanim \{current}
		gman_passcheckpoint goal = <activated_goal_id>
	endif
endscript

script goal_quit_current_goal \{from_pause = true}
	wait \{1
		gameframe}
	if screenelementexists \{id = goal_message}
		runscriptonscreenelement \{id = goal_message
			kill_panel_message}
	endif
	ui_kill_all_messages \{instant = 1}
	gman_getactivatedgoalid
	gman_setquitflag goal = <activated_goal_id>
	gman_deactivateallgoals
	gman_blockuntilallgoalsdeactivated
	gman_unsetquitflag goal = <activated_goal_id>
	if (<from_pause> = true)
	endif
endscript

script goal_move_player \{player = player0_body}
	if compositeobjectexists <player>
		if gotparam \{restart_pos}
			<pos> = (<restart_pos>.pos)
			if structurecontains \{structure = restart_pos
					quat}
				<quat> = (<restart_pos>.quat)
			endif
		elseif gotparam \{restart_node}
			getnode <restart_node>
			if gotparam \{node}
				<pos> = (<node>.pos)
			endif
		endif
		if NOT gotparam \{pos}
			softassert \{qs(0x5a68e6bb)}
		endif
		if gotparam \{zone}
			goal_move_player_load_zone zone = <zone>
			if NOT gotparam \{no_zone_load_necessary}
				block \{type = goal_retry_load_zone_done}
			endif
		endif
		<player> :movementresolution_teleportobject pos = <pos>
		getplayercamera <player>
		if gotparam \{player_camera}
			<player_camera> :camerablender_reset
		endif
		if gotparam \{zone}
			if NOT gotparam \{no_zone_load_necessary}
				hideloadingscreen
				enable_pause
			endif
		endif
	endif
endscript

script goal_get_leaderboard_metrics 
	if NOT gotparam \{goal_type}
		gman_getgoaltype goal = <goal>
	endif
	if structurecontains structure = $goal_type_info <goal_type>
		<leaderboard_metrics> = ($goal_type_info.<goal_type>.leaderboard)
	endif
	requireparams \{[
			leaderboard_metrics
		]
		all}
	return leaderboard_metrics = <leaderboard_metrics>
endscript

script goal_get_leaderboard_columns 
	requireparams \{[
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
	mempushcontext \{bottomupheap}
	if gotparam \{action}
		if gotparam \{objects}
			getarraysize <objects>
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
				<object_name> :obj_setoutlineflag on
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
			if gotparam \{object}
				switch <action>
					case remove
					kill name = <object>
					case add
					create name = <object>
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
					<object> :obj_setoutlineflag on
					default
				endswitch
			endif
		endif
	endif
	mempopcontext
endscript

script gman_blockuntilallgoalsdeactivated 
	begin
	printf \{'GMan_BlockUntilAllGoalsDeactivated - Waiting for active goals...'}
	if NOT gman_hasactivegoals
		break
	endif
	wait \{1
		gameframe}
	repeat
	printf \{'GMan_BlockUntilAllGoalsDeactivated - No active goals.'}
endscript

script gman_preqbrgoal 
	printf 'QBRGoal: %g' g = <goal>
	gman_deactivateallgoals
	gman_blockuntilallgoalsdeactivated
	if istrue <pakless>
		gman_uninitializeallgoals
		begin
		if gman_allgoalsuninitialized
			break
		endif
		wait \{2
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
		wait \{2
			gameframes}
		repeat
		wait \{2
			gameframes}
		gman_removegoal goal = <goal>
	endif
endscript

script gman_postqbrgoal 
	if istrue <pakless>
		getarraysize \{$goal_infos_pakless}
		<i> = 0
		begin
		gman_addgoal goal_info = ($goal_infos_pakless [<i>])
		printstruct ($goal_infos_pakless [<i>])
		<i> = (<i> + 1)
		repeat <array_size>
		gman_initializeallgoals
	else
		appendsuffixtochecksum base = <goal> suffixstring = '_goal_info'
		gman_addgoal goal_info = ($<appended_id>)
		wait \{2
			gameframes}
		gman_initializegoal goal = <goal>
		begin
		if gman_goalisinitialized goal = <goal>
			break
		endif
		wait \{1
			gameframe}
		repeat
		gman_activategoal goal = <goal>
	endif
endscript

script goal_event_has_occurred 
	formattext checksumname = already_triggered_flag '%s_already_triggered_flag' s = <event_string>
	if gman_getdata goal = <goal> name = <already_triggered_flag>
		if ((<...>.<already_triggered_flag>) = true)
			return \{true}
		endif
	else
		gman_setdata goal = <goal> name = <already_triggered_flag> value = false initial
	endif
	gman_setdata goal = <goal> name = <already_triggered_flag> value = true
	return \{false}
endscript

script goal_debug_show_states 
	begin
	if screenelementexists \{id = goal_debug_state_menu}
		destroyscreenelement \{id = goal_debug_state_menu}
	endif
	createscreenelement \{id = goal_debug_state_menu
		type = containerelement
		parent = root_window
		scale = 0.52
		pos = (70.0, 20.0)
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
	createscreenelement {
		type = vmenu
		parent = goal_debug_state_menu
		pos = ((0.0, 0.0) + <i> * (575.0, 0.0))
		just = [left top]
		internal_just = [left top]
		regular_space_amount = 34
	}
	<i> = (<i> + 1)
	repeat <num_cols>
	if ($goals_for_gamemode_loaded = 1)
		getarraysize ($goal_types)
		<num_types> = <array_size>
		<j> = 0
		<goal_iter> = 0
		begin
		<goal_type> = ($goal_types [<j>])
		removeparameter \{goals_by_type}
		if gman_getgoalsbytype type = <goal_type>
			getarraysize <goals_by_type>
			<num_goals> = <array_size>
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
					formattext textname = text qs(0x351ed798) g = <goal_string> s = <state_string>
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
						casttointeger \{column}
						if (<column> >= <num_cols>)
							<column> = (<num_cols> - 1)
						endif
						<goal_iter> = (<goal_iter> + 1)
						if gman_getactivatedgoalid
							if checksumequals a = <activated_goal_id> b = <goal>
								createscreenelement {
									type = textelement
									parent = {goal_debug_state_menu child = <column>}
									font = text_a1
									text = <text>
									rgba = <text_color>
									shadow
									shadow_offs = (1.0, 1.0)
								}
							endif
						else
							createscreenelement {
								type = textelement
								parent = {goal_debug_state_menu child = <column>}
								font = text_a1
								text = <text>
								rgba = <text_color>
								shadow
								shadow_offs = (1.0, 1.0)
							}
						endif
						if checksumequals a = <goal_state> b = goal_activated
							gman_getcurrentcheckpoint goal = <goal>
							formattext textname = c_text qs(0x961d63b2) c = <current_checkpoint>
							createscreenelement {
								type = textelement
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

script gman_initializegoalblocking \{goal = unset}
	gman_initializegoal goal = <goal>
	begin
	if gman_goalisinitialized goal = <goal>
		break
	endif
	wait \{1
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
		return \{false}
	endif
endscript

script gman_startgamemodegoal 
	gamemode_gettype
	if (<type> = quickplay)
		goal_name = quickplay
		goal_struct = quickplay_info
	elseif (<type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = fest_mode || $game_mode = fest_mode_team)
			goal_name = competitive
			goal_struct = competitive_info
		elseif ($game_mode = section_scoring)
			change \{competitive_rules = section_scoring}
			goal_name = competitive
			goal_struct = competitive_info
		endif
	endif
	if gotparam \{goal_name}
		if NOT (gman_goalisactive goal = <goal_name>)
			gman_quickstartgoal goal_struct = <goal_struct> goal_name = <goal_name>
		endif
	endif
endscript

script gman_shutdowngamemodegoal 
	gamemode_gettype
	if (<type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = section_scoring || $game_mode = fest_mode || $game_mode = fest_mode_team)
			gman_quickremovegoal \{goal_name = competitive}
		endif
	elseif (<type> = quickplay)
		gman_quickremovegoal \{goal_name = quickplay}
	endif
endscript

script gman_shutdownallgoals \{except = null}
	gman_getallloadedgoalids
	if NOT gotparam \{loaded_goal_ids}
		return
	endif
	getarraysize <loaded_goal_ids>
	if (<array_size> = 0)
		return
	endif
	i = 0
	begin
	cur_id = (<loaded_goal_ids> [<i>])
	if (<cur_id> != <except>)
		gman_quickremovegoal goal_name = <cur_id>
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script goal_set_player_data_all_players \{params = {
		}}
	requireparams \{[
			goal
			params
		]
		all}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_setdata goal = <goal> player = <player> params = <params>
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script gman_sendcallbacktoallgoals 
	requireparams \{[
			suffix
		]
		all}
	gman_getactivatedgoalids
	formattext textname = final_suffix '_%a' a = <suffix>
	getarraysize <active_goal_ids>
	if (0 = <array_size>)
		return
	endif
	i = (<array_size> - 1)
	begin
	cur_id = (<active_goal_ids> [<i>])
	if gman_goalisactive goal = <cur_id>
		appendsuffixtochecksum base = <cur_id> suffixstring = <final_suffix>
		if NOT gotparam \{callback_data}
			<callback_data> = {goal_id = <cur_id>}
		else
			<callback_data> = (<callback_data> + {goal_id = <cur_id>})
		endif
		if scriptexists <appended_id>
			<appended_id> <callback_data>
		endif
		formattext checksumname = suffix_checksum '%d' d = <suffix>
		if gman_getconstant goal = <cur_id> name = <suffix_checksum> return_name = custom_callback
			if scriptexists <custom_callback>
				<custom_callback> <callback_data>
			endif
		endif
	endif
	i = (<i> - 1)
	if (<i> < 0)
		break
	endif
	repeat <array_size>
endscript

script goal_enable_bots 
	change \{goal_debug_bot_struct = {
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
	change \{goal_debug_bot_struct = {
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
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_getdata goal = <goal_id> player = <player> name = <data_name>
		<data_sum> = (<data_sum> + <...>.<data_name>)
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return data_sum = <data_sum>
endscript

script debug_add_game_rules_text 
	<ruleset> = ($competitive_rules)
	if NOT globalexists name = <ruleset>
		text = qs(0xd4876724)
	else
		text = (($<ruleset>).text)
	endif
	if gotparam \{override}
		text = <override>
	endif
	if gman_goalisactive \{goal = competitive}
		rgba = [20 220 20 255]
	else
		rgba = [220 20 20 255]
	endif
	if screenelementexists \{id = debug_goals_text}
		destroyscreenelement \{id = debug_goals_text}
	endif
	createscreenelement {
		type = textelement
		just = [top left]
		parent = root_window
		type = textblockelement
		id = debug_goals_text
		text = <text>
		pos = (100.0, 100.0)
		scale = 1.5
		just = [left top]
		rgba = <rgba>
		fit_width = `expand dims`
		fit_height = `expand dims`
		font = fontgrid_title_a1
	}
endscript

script get_goal_results_data 
	gman_getdata goal = <goal> name = <results_screen_goal_data>
	if NOT gotparam \{results_screen_goal_data}
		scriptassert qs(0x8b1b399f) a = <goal>
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
			gman_getdata goal = <goal> player = <player> name = <goal_var_name> return_name = recieved_data
			if NOT gotparam \{recieved_data}
				scriptassert qs(0xaa773e13) v = <goal_var_name> s = <goal_var_source>
				return
			endif
			<column_data> = (<column_data> + (<recieved_data>))
			getnextplayer player = <player>
			repeat <num_players>
		endif
	elseif (<goal_var_source> = player_info_data)
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <player> (<goal_var_name>) out = recieved_data
			<column_data> = (<column_data> + (<recieved_data>))
			getnextplayer player = <player>
			repeat <num_players>
		endif
	elseif (<goal_var_source> = player_goal_data_array)
		gman_getdata goal = <goal> name = <goal_var_name> return_name = column_data
	elseif (<goal_var_source> = band_info_data)
		is_band_data = 1
		getbandsstatus
		getarraysize <bands>
		i = 0
		begin
		if (<bands> [<i>].in_game)
			getbandinfo (<i> + 1) score out = recieved_data
			<column_data> = (<column_data> + (<recieved_data>))
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return goal_results_column_title = <column_title> goal_results_column_data = <column_data> is_band_data = <is_band_data>
endscript
