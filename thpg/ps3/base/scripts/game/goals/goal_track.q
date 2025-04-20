goal_track_no_travel = 0
goal_track_current_while_retry = null

script goal_track_get_globals 
	if NOT gotparam goal
		if gman_getactivatedgoalid
			<goal> = <activated_goal_id>
		else
			softassert "No goal passed to goal_track_get_globals data and no activated goal"
			return false
		endif
	endif
	if GMan_GetTrackInfo goal = <goal> name = track
		gman_getdata goal = <track> constants = 1
		return {true track_globals = <...> track_name = <track>}
	else
		softassert "Goal %g is missing track constant." g = <goal>
	endif
	return false
endscript

script goal_get_track_name 
	requireparams \{[
			goal
		]
		all}
	if GMan_GetTrackInfo goal = <goal> name = track
		return track_name = <track>
	elseif gman_getconstant goal = <goal> name = track
		return track_name = <track>
	endif
	softassert 'No track for goal %g' g = <goal>
endscript

script goal_is_in_a_track 
	if NOT gotparam goal
		softassert "goal_is_in_a_track: Must pass goal param"
		return false
	endif
	if NOT gman_goalexists goal = <goal>
		softassert "goal_is_in_a_track: Goal %g doesn't exist" g = <goal>
		return false
	endif
	if GMan_GetTrackInfo goal = <goal> name = track
		return true
	endif
	if checksumequals a = m_r1_postvid b = <goal>
		return true
	endif
	return false
endscript

script goal_get_current_in_track 
	requireparams [track] all
	if NOT checksumequals a = $goal_track_current_while_retry b = null
		if GMan_GetTrackInfo goal = $goal_track_current_while_retry
			if checksumequals a = (<track_info>.track) b = <track>
				return {true current_goal_in_track = ($goal_track_current_while_retry)}
			endif
		endif
	endif
	<track_info> = ($global_goal_track_info.<track>)
	getarraysize (<track_info>.goals)
	if (<array_size> > 0)
		<goal_idx> = 0
		begin
		if NOT gman_haswongoal goal = (<track_info>.goals [<goal_idx>])
			return {true current_goal_in_track = (<track_info>.goals [<goal_idx>])}
		endif
		<goal_idx> = (<goal_idx> + 1)
		repeat <array_size>
	endif
	if gotparam include_impress
		if NOT GMan_GoalIsLocked goal = (<track_info>.impress)
			if NOT gman_haswongoal goal = (<track_info>.impress)
				return {true current_goal_in_track = (<track_info>.impress)}
			endif
		endif
	endif
	return false
endscript

script goal_track_notify_goal_won 
	requireparams \{[
			goal_id
		]
		all}
	if NOT goal_is_in_a_track goal = <goal_id>
		return
	endif
endscript

script goal_track_notify_goal_lost 
	requireparams \{[
			goal_id
		]
		all}
	if NOT goal_is_in_a_track goal = <goal_id>
		return
	endif
	change \{goal_track_current_while_retry = null}
endscript

script goal_track_update_ped_after_goal 
	requireparams [goal_id] all
	if NOT gamemodeequals is_career
		return
	endif
	printf 'goal_track_update_ped_after_goal - goal: %g' g = <goal_id>
	goal_get_track_name goal = <goal_id>
	if goal_is_track_won track = <track_name>
		GMan_BeatGoalTrack track = <track_name>
		GMan_PedFunc goal = <track_name> tool = ped func = kill_peds
		goal_trigger_dialog_kill
		writeachievements achievement = (($global_goal_track_info.<track_name>).achievement)
		formattext textname = new_goal_track "Goal Track: %t won." t = <track_name> dontassertforchecksums
		if ($goal_track_debug_info = 1)
			create_console_message text = <new_goal_track>
		endif
		printf <new_goal_track>
	else
		<should_teleport> = 0
		<ped_travel_method> = skate
		goal_get_current_in_track track = <track_name>
		if ($goal_track_no_travel = 1)
			<should_teleport> = 1
		elseif GMan_GetTrackInfo goal = <current_goal_in_track> name = ped_travel_method
			if checksumequals a = <ped_travel_method> b = Teleport
				<should_teleport> = 1
			elseif checksumequals a = <ped_travel_method> b = teleport_with_skater
				<should_teleport> = 1
			endif
		endif
		if (<should_teleport> = 1)
			if gman_getconstant goal = <current_goal_in_track> name = start_zone
				<travel_to_goal_zone> = <start_zone>
			else
				<travel_to_goal_zone> = unknown
			endif
			getcurrentlevel
			<travel_from_goal_zone> = <level>
			goal_trigger_dialog_kill
			<auto_start_after_teleport> = false
			if ((checksumequals a = <travel_to_goal_zone> b = z_crib) || (checksumequals a = <travel_from_goal_zone> b = load_z_crib))
				GMan_PedFunc goal = <track_name> tool = ped func = kill_peds
			else
				goal_track_ped_recreate track = <track_name>
				if goal_track_goal_should_auto_start goal = <current_goal_in_track>
					<auto_start_after_teleport> = true
				endif
			endif
			if (($goal_track_no_travel = 1) || (checksumequals a = <ped_travel_method> b = teleport_with_skater))
				printf 'goal_track_update_ped_after_goal - teleporting to %g' g = <current_goal_in_track>
				begin
				wait 1 gameframes
				BlockUntilScreenClear wait_for_auto_save = 1
				repeat 3
				goal_teleport_to_start goal = <current_goal_in_track>
				do_actual_unpause
				hideloadingscreen
				if checksumequals a = <auto_start_after_teleport> b = true
					spawnscriptnow goal_auto_start params = {goal = <current_goal_in_track>}
				endif
			endif
		endif
	endif
endscript

script BlockUntilScreenClear wait_for_auto_save = 0
	printf 'BlockUntilScreenClear - Start'
	<clear> = 0
	begin
	if IsScreenClear
		if (<wait_for_auto_save> = 1)
			if NOT istrue $ingame_save_active
				<clear> = 1
			endif
		else
			<clear> = 1
		endif
	endif
	if (<clear> = 1)
		break
	else
		wait 1 gameframe
	endif
	repeat
	printf 'BlockUntilScreenClear - Done'
endscript

script goal_track_goal_should_auto_start 
	if NOT gman_haswongoal goal = <goal>
		if GMan_GetTrackInfo goal = <goal> name = auto_start
			if (<auto_start> = 1)
				return \{true}
			endif
		endif
		if checksumequals a = <goal> b = m_hu_outro
			return \{true}
		endif
	endif
	return \{false}
endscript

script goal_update_track_ped_interact_areas 
	requireparams \{[
			goal
			ped_id
		]
		all}
	if GMan_GetTrackInfo goal = <goal> name = track_ped_areas
		<ped_id> :agent_setinteractareas interact_areas = <track_ped_areas>
		<ped_id> :settags disable_goal_ped_get_attention = true
	elseif gman_getconstant goal = <goal> name = track_ped_areas
		<ped_id> :agent_setinteractareas interact_areas = <track_ped_areas>
		<ped_id> :settags disable_goal_ped_get_attention = true
	else
		<ped_id> :agent_setinteractareas interact_areas = [none]
	endif
endscript

script goal_track_ped_recreate \{in_goal = 0}
	requireparams \{[
			track
		]
		all}
	GMan_PedFunc goal = <track> tool = ped func = kill_peds
	if (<in_goal> = 0)
		if NOT goal_track_should_have_ped track = <track>
			return
		endif
	endif
	GMan_PedFunc goal = <track> tool = ped func = create_peds
endscript

script goal_track_kill_all_peds 
	printf 'goal_track_kill_all_peds'
	ForEachGoalTrack do = GMan_PedFunc params = {tool = ped func = kill_peds}
	goal_track_kill_special_case_peds goal = m_r1_buildkick2 checkpoint = story_splash tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_r1_postvid checkpoint = chk1 tool = ped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_c2_revman checkpoint = story_splash tool = ped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_c3_photo2 checkpoint = introIGC tool = m_c3_photo2_ped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_impress_c1 checkpoint = cams tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_impress_c2 checkpoint = cams tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_impress_c3 checkpoint = presentation tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_impress_h1 checkpoint = cams tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_impress_h2 checkpoint = cams tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_impress_h3 checkpoint = cams_1 tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_impress_r1 checkpoint = cams tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_impress_r2 checkpoint = cams tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_impress_r3 checkpoint = presentation tool = goalped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_training_grind_desc checkpoint = intro_cuts tool = ped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_training_manual_desc checkpoint = chk1 tool = ped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_training_qp2rail_desc checkpoint = intro_cuts tool = ped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_training_revman_desc checkpoint = chk1 tool = ped ignore_goal = <ignore_goal>
	goal_track_kill_special_case_peds goal = m_training_line_desc checkpoint = chk1 tool = ped ignore_goal = <ignore_goal>
endscript

script goal_track_kill_special_case_peds 
	if NOT checksumequals a = <ignore_goal> b = <goal>
		if gman_goalexists goal = <goal>
			if gman_goalisinitialized goal = <goal>
				GMan_PedFunc goal = <goal> checkpoint = <checkpoint> tool = <tool> func = kill_peds
			endif
		endif
	endif
endscript

script goal_track_restore_all_peds 
	printf 'goal_track_restore_all_peds'
	ForEachGoalTrack where = goal_track_should_have_ped do = GMan_PedFunc params = {tool = ped func = create_peds}
	goal_track_restore_special_case_peds goal = m_r1_buildkick2 checkpoint = story_splash tool = goalped
	goal_track_restore_special_case_peds goal = m_r1_postvid checkpoint = chk1 tool = ped
	goal_track_restore_special_case_peds goal = m_c2_revman checkpoint = story_splash tool = ped
	goal_track_restore_special_case_peds goal = m_c3_photo2 checkpoint = introIGC tool = m_c3_photo2_ped
	goal_track_restore_special_case_peds goal = m_impress_c1 checkpoint = cams tool = goalped
	goal_track_restore_special_case_peds goal = m_impress_c2 checkpoint = cams tool = goalped
	goal_track_restore_special_case_peds goal = m_impress_c3 checkpoint = presentation tool = goalped
	goal_track_restore_special_case_peds goal = m_impress_h1 checkpoint = cams tool = goalped
	goal_track_restore_special_case_peds goal = m_impress_h2 checkpoint = cams tool = goalped
	goal_track_restore_special_case_peds goal = m_impress_h3 checkpoint = cams_1 tool = goalped
	goal_track_restore_special_case_peds goal = m_impress_r1 checkpoint = cams tool = goalped
	goal_track_restore_special_case_peds goal = m_impress_r2 checkpoint = cams tool = goalped
	goal_track_restore_special_case_peds goal = m_impress_r3 checkpoint = presentation tool = goalped
	goal_track_restore_special_case_peds goal = m_training_grind_desc checkpoint = intro_cuts tool = ped
	goal_track_restore_special_case_peds goal = m_training_manual_desc checkpoint = chk1 tool = ped
	goal_track_restore_special_case_peds goal = m_training_qp2rail_desc checkpoint = intro_cuts tool = ped
	goal_track_restore_special_case_peds goal = m_training_revman_desc checkpoint = chk1 tool = ped
	goal_track_restore_special_case_peds goal = m_training_line_desc checkpoint = chk1 tool = ped
endscript

script goal_track_restore_special_case_peds 
	if gman_goalexists goal = <goal>
		if gman_goalisinitialized goal = <goal>
			GMan_PedFunc goal = <goal> checkpoint = <checkpoint> tool = <tool> func = create_peds
		endif
	endif
endscript

script goal_track_should_have_ped 
	requireparams \{[
			track
		]
		all}
	if NOT gman_goalexists goal = <track>
		return \{false}
	endif
	if GMan_GoalIsLocked goal = <track>
		return \{false}
	endif
	if NOT gman_goalisinitialized goal = <track>
		return \{false}
	endif
	if goal_is_track_won track = <track>
		return \{false}
	endif
	return \{true}
endscript

script ForEachGoalTrack \{where = goal_track_exists}
	getarraysize \{$goal_track_list}
	<i> = 0
	begin
	if <where> track = ($goal_track_list [<i>])
		<do> goal = ($goal_track_list [<i>]) track = ($goal_track_list [<i>]) <params>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script goal_track_exists 
	if NOT gman_goalexists goal = <track>
		return \{false}
	endif
	return \{true}
endscript

script goal_track_set_state 
	requireparams \{[
			track
			state
		]
		all}
	gman_setdata goal = <track> params = {gt_state = <state>}
endscript

script goal_track_ped_custom_pre_create 
	gman_getconstant goal = <goal_id> name = track
	if gman_getconstant goal = <goal_id> name = start_zone
		if NOT checksumequals a = <start_zone> b = z_crib
			get_current_zone_as_checksum
			if checksumequals a = <current_zone> b = z_crib
				return {ped_tool_no_create}
			endif
		endif
	endif
	goal_track_get_compass_blip_type_for_goal track = <track> goal = <goal_id>
	goal_get_activate_pos goal = <goal_id>
	return {
		compassbliptype = <compassbliptype>
		pos = <activate_pos>
		behavior = bv_agent
	}
endscript

script goal_track_init_custom_ped 
	requireparams \{[
			ped_id
			goal_id
		]
		all}
	goal_update_track_ped_interact_areas goal = <goal_id> ped_id = <ped_id>
	<ped_id> :settags is_historical_trigger = false
	spawnscriptnow goal_track_ped_init_trigger params = {ped_id = <ped_id> goal = <goal_id>}
endscript

script goal_track_ped_pre_create 
	<track> = <goal_id>
	if ($goals_for_gamemode_loaded = 0)
		scriptassert "tried to create goal ped for %g while goals aren't loaded" g = <goal_id>
		return
	endif
	if ($goal_goalmanager_uninitializing = 1)
		printf "tried to create goal ped for %g while GMan is uninitializing" g = <goal_id>
		return
	endif
	if goal_get_current_in_track track = <track>
		printf "Goal Track: Pre-create ped for %g" g = <current_goal_in_track>
		GMan_GetTrackInfo goal = <current_goal_in_track>
		if gman_getconstant goal = <current_goal_in_track> name = start_zone
			if NOT checksumequals a = <start_zone> b = z_crib
				get_current_zone_as_checksum
				if checksumequals a = <current_zone> b = z_crib
					return {ped_tool_no_create}
				endif
			endif
		endif
		goal_get_activate_pos goal = <current_goal_in_track>
		<pos> = <activate_pos>
		if structurecontains structure = <track_info> buddy_profile
			removeparameter profile
			<profile> = (<track_info>.buddy_profile)
		endif
		goal_track_get_compass_blip_type_for_goal track = <track> goal = <current_goal_in_track>
		<update_crib_blip_script> = goal_track_destroy_blip_at_crib
		if checksumequals a = <compassbliptype> b = goal_rigger_pulse
			if goal_starts_in_crib goal = <current_goal_in_track>
				<update_crib_blip_script> = goal_track_create_blip_at_crib
			endif
		endif
		<update_crib_blip_script>
	else
		softassert "no current goal in track %t" t = <track>
	endif
	return {
		pos = <pos>
		areas = [none]
		ped_skates = 1
		compassbliptype = <compassbliptype>
		behavior = bv_agent
		profile = <profile>
	}
endscript

script goal_track_get_compass_blip_type_for_goal 
	requireparams [goal] all
	if gotparam track
		if GMan_GetMostRecentlyPlayedEpisode
			if checksumequals a = <most_recently_played_episode> b = <track>
				<compassbliptype> = goal_important
				<compassbliptype> = (($global_goal_track_info.<track>).blip_pulse)
			endif
		endif
	endif
	if NOT gotparam compassbliptype
		GMan_GetLifestyle goal = <goal>
		switch <lifestyle>
			case career
			<compassbliptype> = goal_career
			case hardcore
			<compassbliptype> = goal_hardcore
			case rigger
			<compassbliptype> = goal_rigger
			default
			<compassbliptype> = goal
		endswitch
	endif
	return compassbliptype = <compassbliptype>
endscript

script goal_track_create_blip_at_crib 
	if NOT iscreated \{UI_CribGoalBlip}
		createcompositeobject \{components = [
				{
					component = compassblip
					compassbliptype = goal_rigger_pulse
				}
			]
			params = {
				name = UI_CribGoalBlip
				pos = (382.7477, 4.1782, -307.17062)
			}}
	endif
endscript

script goal_track_destroy_blip_at_crib 
	if iscreated \{UI_CribGoalBlip}
		UI_CribGoalBlip :die
	endif
endscript

script goal_track_ped_init 
	requireparams [ped_id goal_id name] all
	if goal_get_current_in_track track = <goal_id>
		if ($goal_track_debug_info = 1)
			formattext textname = debug_ped_text "Goal Track: Inited ped %p" p = <name>
			create_console_message text = <debug_ped_text>
			printf <debug_ped_text>
		endif
		goal_update_track_ped_interact_areas goal = <current_goal_in_track> ped_id = <ped_id>
		<ped_id> :GPed_SetInitGoal goal_id = <current_goal_in_track>
		<ped_id> :settags is_historical_trigger = false
		spawnscriptnow goal_track_ped_init_trigger params = {ped_id = <ped_id> goal = <current_goal_in_track>}
	endif
endscript

script goal_track_ped_init_trigger 
	requireparams [ped_id goal] all
	begin
	if NOT gman_goalexists goal = <goal>
		return
	endif
	if gman_getgoalstate goal = <goal> states = $goal_idle_states
		break
	endif
	wait 2 gameframes
	repeat
	if NOT iscreated <ped_id>
		return
	endif
	if goal_starts_in_crib goal = <goal>
		<ped_id> :blip_off
	endif
	GMan_GetLifestyle goal = <goal>
	<ped_id> :SetOutlineBasedOnLifestyle lifestyle = <lifestyle>
	goal_get_prompt_text goal = <goal>
	goal_trigger_init_goal_trigger goal_id = <goal> trigger_obj_id = <ped_id> prompt_text = <prompt_text>
endscript

script goal_track_create_crib_peds 
	if goal_get_current_in_track \{track = m_r1}
		if checksumequals a = <current_goal_in_track> b = m_r1_buildqp
			goal_track_ped_recreate \{track = m_r1}
		endif
	endif
	if goal_get_current_in_track \{track = m_h1}
		if checksumequals a = <current_goal_in_track> b = m_h1_cribcut
			goal_track_ped_recreate \{track = m_h1}
		elseif checksumequals a = <current_goal_in_track> b = m_h1_finalepic_outro
			goal_track_ped_recreate \{track = m_h1}
		endif
	endif
endscript

script goal_is_track_won 
	requireparams \{[
			track
		]
		all}
	if gotparam \{include_impress}
		if gman_haswongoal goal = ($global_goal_track_info.<track>.impress)
			return \{true}
		else
			return \{false}
		endif
	endif
	if gman_haswongoal goal = <track>
		return \{true}
	endif
	if NOT GMan_GoalIsLocked goal = <track>
		if NOT goal_get_current_in_track track = <track>
			return \{true}
		endif
	endif
	return \{false}
endscript

script GMan_GetTrackInfo 
	requireparams \{[
			goal
		]
		all}
	if NOT gman_getconstant goal = <goal> name = track_info
		return \{false}
	endif
	if gotparam \{name}
		if structurecontains structure = <track_info> <name>
			<ret_val> = {}
			addparam structure_name = ret_val name = <name> value = (<track_info>.<name>)
			return {true <ret_val>}
		endif
	else
		return {true track_info = <track_info>}
	endif
	return \{false}
endscript

script goal_track_debug_force_progression 
	requireparams [goal] all
	goal_track_get_globals goal = <goal>
	change game_progress_debug_active = 1
	GMan_UnBeatAllGoals
	wait 1 gameframe
	careerfunc func = debugforceatomunlocked params = {name = <track_name>}
	careerfunc func = updateatoms
	wait 1 second ignoreslomo
	<track_info> = ($global_goal_track_info.<track_name>)
	getarraysize (<track_info>.goals)
	if (<array_size> > 0)
		<goal_idx> = 0
		begin
		if checksumequals a = (<track_info>.goals [<goal_idx>]) b = <goal>
			break
		else
			careerfunc func = fakebeatprogressiongoal params = {goal_id = (<track_info>.goals [<goal_idx>]) goal_grade = 1}
		endif
		<goal_idx> = (<goal_idx> + 1)
		repeat <array_size>
	endif
	if GMan_GoalIsLocked goal = <track_name>
		GMan_UnlockGoal goal = <track_name>
	endif
	if NOT gman_goalisinitialized goal = <track_name>
		if NOT gman_getgoalstate goal = <track_name> states = [goal_initing]
			gman_initializegoal goal = <track_name>
		endif
	endif
	if gman_getconstant goal = <track_name> name = expected_abilities
		getarraysize <expected_abilities>
		<i> = 0
		begin
		AbilityFlags_SetAbilityValue ability = (<expected_abilities> [<i>]) state = on
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	careerfunc func = updateatoms
	wait 1 second ignoreslomo
	change game_progress_debug_active = 0
	if gman_goalisinitialized goal = <track_name>
		goal_track_ped_recreate track = <track_name>
	endif
endscript

script goal_track_notify_goal_started 
	requireparams \{[
			goal
		]
		all}
	if GMan_GetTrackInfo goal = <goal>
		if GMan_GoalIsLocked goal = (<track_info>.track)
			GMan_UnlockGoal goal = (<track_info>.track)
		endif
		if gman_haswongoal goal = <goal>
			change goal_track_current_while_retry = <goal>
			goal_track_ped_recreate track = (<track_info>.track) in_goal = 1
		else
			change \{goal_track_current_while_retry = null}
		endif
	endif
endscript

script goal_track_notify_goal_ended 
	requireparams \{[
			goal
		]
		all}
	if gameispaused
		printf \{'goal_track_notify_goal_ended - waiting for game to unpause'}
		wait \{1
			gameframe}
	endif
	if GMan_GetTrackInfo goal = <goal>
		change \{goal_track_current_while_retry = null}
		goal_track_update_ped_after_goal goal_id = <goal>
	endif
endscript

script goal_track_debug_states 
	begin
	if screenelementexists id = goal_debug_state_menu
		destroyscreenelement id = goal_debug_state_menu
	endif
	createscreenelement {
		id = goal_debug_state_menu
		type = vmenu
		parent = root_window
		scale = 0.6
		pos = (70.0, 270.0)
		just = [left top]
		internal_just = [left top]
		z_priority = 100
		regular_space_amount = 34
	}
	if ($goals_for_gamemode_loaded = 1)
		getarraysize ($goal_track_list)
		<num_tracks> = <array_size>
		<j> = 0
		begin
		<goal_track> = ($goal_track_list [<j>])
		if gman_goalexists goal = <goal_track>
			<text_color> = [192 192 192 255]
			removeparameter current_goal_in_track
			if goal_get_current_in_track track = <goal_track>
				formattext textname = text "%g - %c" g = <goal_track> c = <current_goal_in_track> dontassertforchecksums
				if NOT gman_goalexists goal = <current_goal_in_track>
					<text_color> = [200 128 0 255]
				endif
			else
				formattext textname = text "%g - (no current goal)" g = <goal_track> dontassertforchecksums
			endif
			createscreenelement {
				type = textelement
				parent = goal_debug_state_menu
				font = text_a1
				text = <text>
				rgba = <text_color>
				shadow
				shadow_offs = (1.0, 1.0)
			}
		endif
		<j> = (<j> + 1)
		repeat <num_tracks>
	endif
	wait 10 gameframes
	repeat
endscript
