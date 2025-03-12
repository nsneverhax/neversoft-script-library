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
		formattext textname = goal_title qs(0x35b12509) a = <goal_string>
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

script gman_passcheckpoint 
	if NOT gman_getgoalstate goal = <goal> states = [goal_activated]
		softassert qs(0xdb87bb49) g = <goal> s = <goal_state>
		return
	endif
	spawnscriptnow goal_spawned_safe_pass_checkpoint params = {goal = <goal>}
endscript

script goal_spawned_safe_pass_checkpoint 
	if gman_getdata goal = <goal> name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			gman_getcurrentcheckpoint goal = <goal>
			softassert qs(0x663315dc) s = <current_checkpoint>
		endif
	endif
	gman_setdata goal = <goal> params = {goal_checkpoint_transition = 1}
	gman_spawnedsafepasscheckpoint goal = <goal>
endscript

script gman_failcheckpoint \{show_retry_dialog = 0}
	if NOT gman_getgoalstate goal = <goal> states = [goal_activated]
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
	change \{dont_create_speech_boxes = 0}
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

script goal_retry_load_zone \{move_to_trigger = 1}
	requireparams \{[
			retry_goal
		]
		all}
	printf \{'goal_retry_load_zone'}
	if NOT gman_goalexists goal = <retry_goal>
		scriptassert qs(0xc6554b2a) d = <retry_goal>
	endif
	if NOT gman_getconstant goal = <retry_goal> name = start_zone
		scriptassert qs(0x544d1825) d = <retry_goal>
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
		if gman_getconstant goal = <retry_goal> name = trigger_pos
			goal_move_player pos = <trigger_pos>
		endif
	endif
	goal_move_player_load_zone zone = <new_zone> goal = <retry_goal>
	if gotparam \{no_zone_load_necessary}
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
	gman_setquitflag
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

script goal_set_pending_grade 
	requireparams \{[
			goal
			grade
		]
		all}
	printf 'goal_set_pending_grade -- %r' r = <grade>
	if ((<grade> < 0) || (<grade> > 3))
		softassert 'Grade %s must be in range [0 3]' s = <grade>
		return
	endif
	gman_setpendinggrade goal = <goal> grade = <grade>
	if gotparam \{ui}
		spawnscriptnow goal_ui_announce_pending_grade params = {goal = <goal> grade = <grade> mode = <ui>}
	endif
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

script quick_start_goal \{activate = true}
	quick_remove_goal goal_name = <goal_name>
	gman_addgoal goal_info = ($<goal_struct>)
	gman_initializegoal goal = <goal_name>
	begin
	if gman_goalisinitialized goal = <goal_name>
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<activate> = true)
		gman_activategoal goal = <goal_name>
	endif
endscript

script quick_remove_goal 
	if gman_goalexists goal = <goal_name>
		if gman_goalisinitialized goal = <goal_name>
			if gman_goalisactive goal = <goal_name>
				gman_deactivategoal goal = <goal_name>
				begin
				if NOT gman_goalisactive goal = <goal_name>
					break
				endif
				wait \{1
					gameframe}
				repeat
			endif
			gman_uninitializegoal goal = <goal_name>
			begin
			if NOT gman_goalisinitialized goal = <goal_name>
				break
			endif
			wait \{1
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
	current_song = none
	gman_songfunc \{func = get_current_song}
	return current_song = <current_song>
endscript

script gman_songtool_getcurrentsongversion 
	gman_songfunc \{func = get_current_song_version}
	return current_song_version = <current_song_version>
endscript

script gman_songtool_songwon 
	guitarevent_songwon
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
		return \{false}
	endif
endscript

script gman_startgamemodegoal 
	gamemode_gettype
	if (<type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = fest_mode || $game_mode = fest_mode_team)
			goal_name = competitive
			goal_struct = competitive_info
		elseif ($game_mode = section_scoring)
			change \{competitive_rules = section_scoring}
			goal_name = competitive
			goal_struct = competitive_info
		endif
	elseif (<type> = career)
		goal_name = career
		goal_struct = career_info
	endif
	if gotparam \{goal_name}
		if NOT (gman_goalisactive goal = <goal_name>)
			quick_start_goal goal_struct = <goal_struct> goal_name = <goal_name>
		endif
	endif
endscript

script gman_shutdowngamemodegoal 
	gamemode_gettype
	if (<type> = competitive)
		if ($game_mode = compmega || $game_mode = compmega_team || $game_mode = section_scoring || $game_mode = fest_mode || $game_mode = fest_mode_team)
			quick_remove_goal \{goal_name = competitive}
		endif
	endif
endscript

script gman_shutdownallgoals 
	gman_getactivatedgoalids
	if NOT gotparam \{active_goal_ids}
		return
	endif
	getarraysize <active_goal_ids>
	if (<array_size> = 0)
		return
	endif
	i = 0
	begin
	cur_id = (<active_goal_ids> [<i>])
	if gotparam \{preserve_career}
		if (<cur_id> = career)
			cur_id = none
		endif
	endif
	quick_remove_goal goal_name = <cur_id>
	i = (<i> + 1)
	repeat <array_size>
endscript

script gman_disable_highway \{player = 1}
	setplayerinfo <player> interactive = 0
	destroy_highway_prepass <...>
	hide_highway_hud player = <player>
	formattext checksumname = name 'Highway_2Dp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <name>
		safe_hide id = <name>
	endif
	formattext checksumname = name 'gem_containerp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <name>
		safe_hide id = <name>
	endif
	formattext checksumname = name 'Gem_basebarp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <name>
		safe_hide id = <name>
	endif
	formattext checksumname = name 'highway_containerp%p' p = <player>
	if screenelementexists id = <name>
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
	gman_setdata goal = <goal_id> params = {current_section = <section>}
	gman_songtool_getcurrentsong
	if globalexists name = <goal_id>
		if structurecontains structure = ($<goal_id>) required_band
			if arraycontains array = ($<goal_id>.required_band) contains = vocal
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
	getarraysize <song_section_array>
	songfilemanager func = get_song_end_time song_name = <current_song>
	if (<array_size> = 0)
		printf \{channel = goal
			'No markers found in song, exiting section_watcher...'}
		return
	endif
	getsongtimems
	<new_time> = ((<song_section_array> [1].time) - (<time>))
	if (<show_timer> = 1)
		casttointeger \{new_time}
		gman_timerfunc goal = <goal_id> tool = section_timer func = set_precise_start_time params = {precise_time = (<new_time>)}
		printf channel = goal 'timer set to %s seconds...' s = (<new_time> / 1000.0)
		gman_timerfunc goal = <goal_id> tool = section_timer func = attach_timer_to_player params = {player = 0}
		gman_timerfunc goal = <goal_id> tool = section_timer func = reset
		gman_timerfunc goal = <goal_id> tool = section_timer func = show
		gman_timerfunc goal = <goal_id> tool = section_timer func = start
	endif
	begin
	getsongtimems
	casttointeger \{time}
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
			casttointeger \{new_time}
			gman_timerfunc goal = <goal_id> tool = section_timer func = set_precise_start_time params = {precise_time = (<new_time>)}
			printf channel = competitive 'timer set to %s seconds...' s = (<new_time> / 1000.0)
			gman_timerfunc goal = <goal_id> tool = section_timer func = attach_timer_to_player params = {player = 0}
			gman_timerfunc goal = <goal_id> tool = section_timer func = reset
			gman_timerfunc goal = <goal_id> tool = section_timer func = show
			gman_timerfunc goal = <goal_id> tool = section_timer func = start
		endif
		<section> = (<section> + 1)
		gman_setdata goal = <goal_id> params = {current_section = <section>}
	endif
	wait \{1
		gameframe}
	repeat
	begin
	getsongtimems
	casttointeger \{time}
	if (<time> > <total_end_time>)
		broadcastevent type = song_section_end data = {section = <section>}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script section_fret_display \{use_vocal_markers = 0}
	gman_songtool_getcurrentsong
	if globalexists name = <goal_id>
		if structurecontains structure = ($<goal_id>) required_band
			if arraycontains array = ($<goal_id>.required_band) contains = vocal
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
	getarraysize <song_section_array>
	if (<array_size> = 0)
		printf \{channel = goal
			'No markers found in song, exiting section_watcher...'}
		return
	else
		<marker_array_size> = <array_size>
	endif
	gman_songfunc \{func = get_current_song_playlist_index}
	<current_song_index> = (<current_song_index> - 1)
	if structurecontains structure = ($<goal_id>) song_sections
		getarraysize (($<goal_id>).song_sections [<current_song_index>])
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
	challenge_validate_player_instrument goal_id = <goal_id> player = <player>
	if (<player_instrument> = valid)
		set_challenge_marker_times player = <player> challenge_marker_times = <challenge_fretbars_array> side_glow = 1
	endif
	getnextplayer player = <player>
	repeat <num_players>
endscript

script set_challenge_marker_times 
	requireparams \{[
			player
			challenge_marker_times
		]
		all}
	if NOT playerinfoequals <player> part = vocals
		setchallengemarkertimes player = <player> challenge_marker_times = <challenge_marker_times> side_glow = <side_glow>
	else
		vocals_setchallengemarkertimes player = <player> challenge_fretbars_array = <challenge_marker_times>
	endif
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
	if NOT gotparam \{active_goal_ids}
		return
	endif
	formattext textname = final_suffix '_%a' a = <suffix>
	getarraysize <active_goal_ids>
	i = 0
	begin
	cur_id = (<active_goal_ids> [<i>])
	if gman_goalisactive goal = <cur_id>
		appendsuffixtochecksum base = <cur_id> suffixstring = <final_suffix>
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
	i = (<i> + 1)
	repeat <array_size>
endscript

script gman_adjust_difficulty 
	requireparams \{[
			player
			adjustment
		]
		all}
	getplayerinfo <player> difficulty
	get_difficulty_text difficulty = <difficulty>
	<difficulty_text> = <difficulty_text_nl>
	switch <adjustment>
		case up
		switch <difficulty>
			case beginner
			setplayerinfo <player> difficulty = easy
			case easy
			setplayerinfo <player> difficulty = medium
			case medium
			setplayerinfo <player> difficulty = hard
			case hard
			setplayerinfo <player> difficulty = expert
			setplayerinfo <player> double_kick_drum = 0
			case expert
			getplayerinfo <player> part
			if (<part> = drum)
				setplayerinfo <player> double_kick_drum = 1
				competitive_main_difficulty_watcher_varupdated player = <player> current_value = expert_plus
			endif
		endswitch
		case down
		switch <difficulty>
			case easy
			setplayerinfo <player> difficulty = beginner
			case medium
			setplayerinfo <player> difficulty = easy
			case hard
			setplayerinfo <player> difficulty = medium
			case expert
			getplayerinfo <player> part
			getplayerinfo <player> double_kick_drum
			if (<part> = drum && <double_kick_drum> = 1)
				setplayerinfo <player> double_kick_drum = 0
				competitive_main_difficulty_watcher_varupdated player = <player> current_value = expert
			else
				setplayerinfo <player> difficulty = hard
			endif
		endswitch
		case beginner
		setplayerinfo <player> difficulty = beginner
		case easy
		setplayerinfo <player> difficulty = easy
		case medium
		setplayerinfo <player> difficulty = medium
		case hard
		setplayerinfo <player> difficulty = hard
		case expert
		setplayerinfo <player> difficulty = expert
	endswitch
	getplayerinfo <player> part
	if NOT (<part> = vocals)
		getplayerinfo <player> difficulty
		spawnscriptnow morph_scroll_speed params = {player = <player> difficulty = <difficulty> blend_time = 2.0}
	endif
endscript

script gman_create_difficulty_indicators 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <player> part
		getplayerinfo <player> difficulty
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
		getplayerinfo <player> double_kick_drum
		if (<part> = drum && <difficulty> = expert && <double_kick_drum> = 1)
			<difficulty_text> = qs(0xa672fac7)
			<icon> = icon_difficulty_expert_plus
		endif
		if NOT (<part> = vocals)
			get_highway_hud_root_id player = <player>
			if screenelementexists id = <highway_hud_root>
				if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
					setscreenelementprops id = <hud_player_meter> difficulty_texture = <icon>
				endif
			endif
		else
			formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
			if screenelementexists id = <competitive_meters_id>
				setscreenelementprops id = <competitive_meters_id> difficulty_texture = <icon>
			endif
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script gman_create_points_indicators \{metric = score}
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <player> part
		if NOT (<part> = vocals)
			switch <metric>
				case score
				getplayerinfo <player> score
				casttointeger \{score}
				formattext textname = text qs(0x4d4555da) s = <score>
			endswitch
			formattext checksumname = element_id 'p%p_points' p = <player>
			formattext checksumname = parent_id 'gem_containerp%p' p = <player>
			if screenelementexists id = <element_id>
				destroyscreenelement id = <element_id>
			endif
			createscreenelement {
				type = textelement
				id = <element_id>
				parent = <parent_id>
				rgba = [255 255 255 255]
				font = fontgrid_text_a1
				pos = (640.0, 320.0)
				text = <text>
				just = [center top]
				scale = (0.5, 0.5)
				z_priority = 31
			}
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
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
