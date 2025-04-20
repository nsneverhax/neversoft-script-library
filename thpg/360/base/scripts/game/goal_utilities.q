
script goal_is_permanent 
	gman_getgoaltype goal = <goal_id>
	getarraysize \{$goal_permanent_goaltypes}
	<index> = 0
	begin
	if checksumequals a = <goal_type> b = ($goal_permanent_goaltypes [<index>])
		return \{true}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{false}
endscript

script goal_has_trigger 
	gman_getgoaltype goal = <goal_id>
	getarraysize \{$goal_nontrigger_goaltypes}
	<index> = 0
	begin
	if checksumequals a = <goal_type> b = ($goal_nontrigger_goaltypes [<index>])
		return \{false}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{true}
endscript

script goal_is_ambient 
	gman_getgoaltype goal = <goal_id>
	getarraysize \{$goal_ambient_goaltypes}
	<index> = 0
	begin
	if checksumequals a = <goal_type> b = ($goal_ambient_goaltypes [<index>])
		return \{true}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{false}
endscript
goal_batched_action = 0
in_goal_batched_action_end = 0

script goal_batched_action_start 
	if ($goal_debug_print = 1)
		printf \{'goal_batched_action_start'}
	endif
	if ($goal_batched_action = 1)
		scriptassert \{'goal_batched_action_start - Pair mismatch'}
	endif
	if ($in_goal_batched_action_end = 1)
		scriptassert \{'goal_batched_action_start - Pair mismatch... Still in action_end'}
	endif
	change \{goal_batched_action = 1}
endscript

script goal_batched_action_end 
	if ($goal_debug_print = 1)
		printf 'goal_batched_action_end'
	endif
	if ($goal_batched_action = 0)
		scriptassert 'goal_batched_action_end - Pair mismatch'
	endif
	change goal_batched_action = 0
	change in_goal_batched_action_end = 1
	GoalPakManager_Lock
	GoalPakManager_WaitForPaks
	GoalPakManager_GoalAction action = refresh_intros_unload
	GoalPakManager_WaitForPaks
	GoalPakManager_GoalAction action = refresh_intros_load
	GoalPakManager_WaitForPaks
	GoalPakManager_Unlock
	change in_goal_batched_action_end = 0
endscript

script goal_should_unload_intro 
	if structurecontains structure = <pak_info> main
		if structurecontains structure = (<pak_info>.main) unload_intro
			if (((<pak_info>.main).unload_intro) = 1)
				return \{true}
			endif
		endif
	endif
endscript

script goal_gpm_load_intro 
	if ($goal_debug_print = 1)
		printf 'goal_gpm_load_intro - Loading Pak %s' s = <goal_string>
	endif
	if NOT ((gman_getgoalstate goal = <goal_id> states = [goal_initing]) || (gman_goalisinitialized goal = <goal_id>))
		gman_initializegoal goal = <goal_id>
	endif
	GoalPakManager_WaitForPaks
	if ($goal_debug_print = 1)
		printf 'goal_gpm_load_intro - Loaded Pak %s' s = <goal_string>
	endif
	if GoalPakManager_IsLoaded goal_string = <goal_string> pak_id = <pak_id>
		if ($goal_debug_print = 1)
			printf 'goal_gpm_load_intro - Postiniting %s' s = <goal_string>
		endif
		if gman_goalisinitialized goal = <goal_id>
			formattext checksumname = post_load_script '%s_post_init' s = <goal_string>
			if scriptexists <post_load_script>
				<post_load_script> goal_id = <goal_id>
			endif
			if NOT gman_getgoalstate goal = <goal_id> states = [goal_inactive]
				softassert "Goal %g is supposedly initialized, but is not in inactive state" g = <goal_id>
				gman_endgoaltransition goal = <goal_id> state = goal_initing success = true
			endif
		else
			if ($debug_fake_long_transition_states = 1)
				wait 2 seconds ignoreslomo
			endif
			gman_endgoaltransition goal = <goal_id> state = goal_initing success = true
		endif
	else
		printf 'goal_gpm_load_intro - Pak %s unloaded whilst waiting for load' s = <goal_string>
	endif
endscript

script goal_gpm_unload_intro 
	printf 'goal_gpm_unload_intro - Unloading Pak %s' s = <goal_string>
	gman_getgoaltype goal = <goal_id>
	if checksumequals a = <goal_type> b = story
		GMan_PedFunc goal = <goal_id> func = kill_global_peds
	endif
	GoalPakManager_WaitForPaks
	printf 'goal_gpm_unload_intro - Unloaded Pak %s' s = <goal_string>
endscript

script goal_gpm_init_not_loaded 
	printf 'goal_gpm_init_not_loaded - Pak %s' s = <goal_id> dontassertforchecksums
	softassert "goal_gpm_init_not_loaded unexpected in Skate9 (goal=%g)" g = <goal_id>
	goal_historical_trigger_create goal_id = <goal_id>
endscript

script goal_gpm_pending_intro_purged 
	printf 'goal_gpm_pending_intro_purged - Pak %s' s = <goal_id> dontassertforchecksums
	GMan_SetGoalFinishedInitializing goal = <goal_id>
endscript

script goal_wait_for_pakless_mission_unload 
	if GoalPakManager_HasMission
		printf 'goal_wait_for_pakless_mission_unload - Waiting...'
		begin
		GoalPakManager_WaitForPaks
		wait 1 gameframe
		if NOT GoalPakManager_HasMission
			break
		endif
		repeat 10
		if GoalPakManager_HasMission
			softassert "goal_wait_for_pakless_mission_unload - Mission still loaded"
		endif
	endif
endscript

script goal_wait_for_pakless_mission_load 
	if NOT GoalPakManager_HasMission
		begin
		printf 'goal_wait_for_pakless_mission_load - Waiting...'
		GoalPakManager_WaitForPaks
		wait 1 gameframe
		if GoalPakManager_HasMission
			break
		endif
		repeat 10
		if NOT GoalPakManager_HasMission
			softassert "goal_wait_for_pakless_mission_load - Mission not loaded"
		endif
	endif
endscript

script goal_setup_trigger 
	goal_historical_trigger_destroy goal_id = <goal_id>
	<continue> = true
	<do_init> = true
	<do_outline> = false
	<do_composite_object_create> = true
	gman_getgoaltype goal = <goal_id>
	switch <goal_type>
		case arcade
		gman_getconstant goal = <goal_id> name = arcade_machine_id
		if iscreated <arcade_machine_id>
			<continue> = true
			<do_composite_object_create> = false
			<mangled_id> = <arcade_machine_id>
		else
			if isinnodearray <arcade_machine_id>
				create name = <arcade_machine_id>
			endif
			<continue> = false
		endif
		case chalk
		<model> = 'Props\\chalk_marker\\chalk_marker.mdl'
		<extra_components> = [
			{component = motion}
			{component = hover}
		]
		<continue> = true
		<do_init> = false
		<scale> = 1.0
		case turf
		<model> = 'GameObjects\\line_challenge_goal_icon\\line_challenge_goal_icon.mdl'
		<extra_components> = [
			{component = motion}
			{component = hover}
		]
		<continue> = true
		<do_init> = false
		<scale> = 1.0
		case photo
		<model> = 'props\\digital_camera_icon\\digital_camera_icon.mdl'
		<extra_components> = [
			{component = motion}
			{component = hover}
		]
		<continue> = true
		<scale> = 1.2
		<do_outline> = false
		<custom_material_id> = digital_camera_icon_glow
		case film
		<model> = 'photo_camera\\photo_camera.mdl'
		<extra_components> = [
			{component = motion}
			{component = hover}
		]
		<continue> = true
		<scale> = 1.0
		<do_outline> = false
		<custom_material_id> = photo_camera_glow
		case net
		<model> = 'Props\\historical_timedout_marker\\historical_timedout_marker.mdl'
		<extra_components> = [
			{component = motion}
			{component = hover}
		]
		<continue> = true
		<scale> = 0.35000002
		case race
		<model> = 'Props\\race_icon\\race_icon.mdl'
		<extra_components> = [
			{component = motion}
			{component = hover}
		]
		<continue> = true
		<scale> = 1.0
		<do_outline> = false
		case uber
		<model> = 'GameObjects\\uber_goal_icon\\uber_goal_icon.mdl'
		<extra_components> = [
			{component = motion}
			{component = hover}
		]
		<continue> = true
		<scale> = 1.0
		case test_goal
		<model> = 'Props\\historical_timedout_marker\\historical_timedout_marker.mdl'
		<extra_components> = [
			{component = motion}
			{component = hover}
		]
		<continue> = true
		<scale> = 0.35000002
		case dummy
		case classic
		case hawkman
		case high_score_run
		case story
		case travel
		case track_man
		<continue> = false
		default
		<continue> = false
	endswitch
	if (<continue> = true)
		if (<do_composite_object_create> = true)
			<base_components> = [
				{component = suspend}
				{component = objectproximity}
				{component = model}
			]
			<components> = (<extra_components> + <base_components>)
			manglechecksums a = <goal_id> b = _goalTrigger
			if iscreated <mangled_id>
				<mangled_id> :die
			endif
			goal_get_activate_pos goal = <goal_id>
			if NOT gotparam activate_pos
				return
			endif
			<activate_pos> = (<activate_pos> + (0.0, 1.0, 0.0))
			setsearchallassetcontexts
			createcompositeobject {
				components = <components>
				params = {
					name = <mangled_id>
					model = <model>
					collisionmode = <collision_mode>
					pos = <activate_pos>
					suspenddistance = 60
					lod_dist1 = 10
					lod_dist2 = 100
					scale = <scale>
				}
			}
			setsearchallassetcontexts off
			if gotparam activate_quat
				<mangled_id> :obj_setorientation quat = <activate_quat>
				if (<goal_type> = turf)
					<mangled_id> :obj_hover amp = 0.25 freq = 2
				endif
			else
				<mangled_id> :obj_roty speed = 200
				<mangled_id> :obj_hover amp = 0.25 freq = 2
			endif
		endif
		if gotparam custom_material_id
			if gman_getconstant goal = <goal_id> name = lifestyle
				switch <lifestyle>
					case career
					<custom_material_color> = {r = 0.0 g = 4.0 b = 0.0}
					case rigger
					<custom_material_color> = {r = 0.8 g = 0.0 b = 3.5}
					case hardcore
					<custom_material_color> = {r = 3.0 g = 0.5 b = 0.0}
				endswitch
			else
				<custom_material_color> = {r = 1.0 g = 1.0 b = 0.0}
			endif
			<mangled_id> :obj_makematerialunique
			<mangled_id> :obj_setmaterialcolor material = body material = <custom_material_id> color = <custom_material_color>
		endif
		<mangled_id> :settags is_historical_trigger = false
		if (<do_init> = true)
			runscriptonobject {
				id = <mangled_id>
				goal_trigger_init_goal_trigger
				params = {
					goal_id = <goal_id>
					trigger_obj_id = <mangled_id>
					do_outline = <do_outline>
				}
			}
		endif
	endif
endscript

script goal_setup_arcade_trigger 
	<destroy> = true
	if ($goals_for_gamemode_loaded = 1)
		if gman_goalexists goal = <goal_id>
			if gman_goalisinitialized goal = <goal_id>
				<destroy> = false
				settags is_historical_trigger = false
				obj_getid
				gman_setdata goal = <goal_id> params = {trigger_obj_id = <objid>}
				goal_trigger_init_goal_trigger {
					goal_id = <goal_id>
					trigger_obj_id = <objid>
					do_outline = true
				}
			endif
		endif
	endif
	if (<destroy> = true)
		die
	endif
endscript

script goal_time_expired show_expire_message = 1
	printf 'goal_time_expired - %a' a = <goal_id>
	if (<show_expire_message> = 1)
		create_panel_message id = goal_message text = "Out of time!" style = panel_message_generic_loss
	endif
	gman_getgoaltype goal = <goal_id>
	if checksumequals a = <goal_type> b = classic
	endif
	if GoalManager_EndRunCalled name = <goal_id>
		if GoalManager_StartedEndOfRun name = <goal_id>
			SpawnSkaterScript goal_init_after_end_of_run params = {goal_id = <goal_id>}
		else
			GoalManager_ClearEndRun name = <goal_id>
		endif
	endif
	if NOT checksumequals a = <goal_type> b = turf
		if NOT inmultiplayergame
			skater :killskater no_node
		endif
	endif
	broadcastevent type = goal_expired
endscript

script goal_should_uninit 
	if NOT inmultiplayergame
		if gman_haswongoal goal = <goal_id>
			if NOT goal_is_permanent goal_id = <goal_id>
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script goal_historical_trigger_create do_init = true
	if NOT gman_goalexists goal = <goal_id>
		return
	endif
	if gman_goalissingleplay goal = <goal_id>
		return
	endif
	if NOT gman_haswongoal goal = <goal_id>
		return
	endif
	if ($goal_goalmanager_uninitializing = 1)
		return
	endif
	manglechecksums a = <goal_id> b = _goalTrigger
	if iscreated <mangled_id>
		<mangled_id> :die
	endif
	if NOT getglobalflag flag = $CAREER_TRAINING_DONE
		return
	endif
	if gman_getconstant goal = <goal_id> name = trigger_pos
		<pos> = <trigger_pos>
	else
		return
	endif
	if gman_haswongoal goal = <goal_id>
		gman_getgrade goal = <goal_id>
		switch <grade>
			case 1
			<model> = 'Props\\historical_am_marker\\historical_am_marker.mdl'
			<custom_material_id> = historical_am_marker_GLOW
			case 2
			<model> = 'Props\\historical_pro_marker\\historical_pro_marker.mdl'
			<custom_material_id> = historical_pro_marker_GLOW
			case 3
			<model> = 'Props\\historical_sick_marker\\historical_sick_marker.mdl'
			<custom_material_id> = historical_sick_marker_GLOW
			default
			<model> = 'Props\\historical_am_marker\\historical_am_marker.mdl'
			<custom_material_id> = historical_am_marker_GLOW
		endswitch
	else
		<model> = 'Props\\historical_timedout_marker\\historical_timedout_marker.mdl'
	endif
	<trigger_components> = [
		{component = motion}
		{component = model}
		{component = hover}
		{component = suspend}
		{component = objectproximity}
	]
	setsearchallassetcontexts
	createcompositeobject {
		components = <trigger_components>
		params = {
			name = <mangled_id>
			model = <model>
			pos = (<pos> + (0.0, 1.0, 0.0))
			suspenddistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
			scale = 1.0
		}
	}
	setsearchallassetcontexts off
	<mangled_id> :obj_roty speed = 200
	if gotparam custom_material_id
		<mangled_id> :obj_makematerialunique
		if NOT gman_getconstant goal = <goal_id> name = lifestyle
			gman_getgoalstring goal = <goal_id>
			if gotparam goal_string
				formattext checksumname = goal_info_struct '%a_track_info' a = <goal_string>
				if globalexists name = <goal_info_struct> type = structure
					if structurecontains structure = $<goal_info_struct> lifestyle
						<lifestyle> = (<goal_info_struct>.lifestyle)
					endif
				endif
			endif
		endif
		if gotparam lifestyle
			switch <lifestyle>
				case career
				<custom_material_color> = {r = 0.0 g = 4.0 b = 0.0}
				case rigger
				<custom_material_color> = {r = 0.8 g = 0.0 b = 3.5}
				case hardcore
				<custom_material_color> = {r = 3.0 g = 0.5 b = 0.0}
			endswitch
		else
			<custom_material_color> = {r = 1.0 g = 1.0 b = 0.0}
		endif
		<mangled_id> :obj_setmaterialcolor material = body material = <custom_material_id> color = <custom_material_color>
	endif
	<mangled_id> :settags is_historical_trigger = true
	if checksumequals a = <do_init> b = true
		runscriptonobject {
			id = <mangled_id>
			goal_trigger_init_goal_trigger
			params = {
				goal_id = <goal_id>
				trigger_obj_id = <mangled_id>
				do_outline = false
			}
		}
	endif
endscript

script goal_get_prompt_text 
	requireparams \{[
			goal
		]
		all}
	if gman_getconstant goal = <goal> name = view_goals_title
		return prompt_text = <view_goals_title>
	else
		return \{prompt_text = "Try this goal!"}
	endif
endscript

script goal_historical_trigger_destroy 
	manglechecksums a = <goal_id> b = _goalTrigger
	if iscreated <mangled_id>
		<mangled_id> :getsingletag is_historical_trigger
		if (<is_historical_trigger> = true)
			<mangled_id> :die
		endif
	endif
endscript

script goal_should_rollout 
	requireparams \{[
			goal
		]
		all}
	if NOT GMan_ShouldRollout goal = <goal>
		return \{false}
	endif
	if skater :walking
		return \{false}
	endif
	<rollout> = true
	goal_get_type_info goal = <goal>
	<rollout> = (<goal_type_info>.should_rollout)
	return <rollout>
endscript

script goal_end_run_script_launcher 
	spawnscriptlater <end_run_script>
	do_actual_unpause
	ui_change_state \{state = uistate_gameplay}
endscript

script gman_passcheckpoint 
	printf 'GMan_PassCheckpoint goal=%g' g = <goal>
	if NOT gman_getgoalstate goal = <goal> states = [goal_activated]
		softassert "Can't GMan_PassCheckpoint while goal %g in state %s (should be goal_activated)" g = <goal> s = <goal_state>
		return
	endif
	spawnscriptlater goal_spawned_safe_pass_checkpoint params = {
		goal = <goal>
		do_rollout = <do_rollout>
	}
endscript

script goal_spawned_safe_pass_checkpoint do_rollout = 1
	if gotparam goal_id
		<goal> = <goal_id>
	endif
	if gman_getdata goal = <goal> name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			gman_getcurrentcheckpoint goal = <goal>
			softassert "Tried to pass checkpoint %s while already passing or failing that checkpoint" s = <current_checkpoint>
		endif
	endif
	gman_setdata goal = <goal> params = {goal_checkpoint_transition = 1}
	if (<do_rollout> = 1)
		if goal_should_rollout goal = <goal>
			ui_display_message type = uberalert color = green text = "SUCCESS!"
			goal_rollout_skater deactivate_tools = 1
		endif
	endif
	gman_spawnedsafepasscheckpoint goal = <goal>
endscript

script gman_failcheckpoint show_retry_dialog = 0
	if NOT gman_getgoalstate goal = <goal> states = [goal_activated]
		softassert "Can't GMan_FailCheckpoint while goal %g in state %s (should be goal_activated)" g = <goal> s = <goal_state>
		return
	endif
	spawnscriptlater noqbid goal_spawned_safe_fail_checkpoint params = {
		goal = <goal>
		txt = <txt>
		show_retry_dialog = <show_retry_dialog>
		do_rollout = <do_rollout>
	}
endscript

script goal_spawned_safe_fail_checkpoint show_retry_dialog = 0 do_rollout = 1
	if gotparam goal_id
		<goal> = <goal_id>
	endif
	if gman_getdata goal = <goal> name = goal_checkpoint_transition
		if (<goal_checkpoint_transition> = 1)
			gman_getcurrentcheckpoint goal = <goal>
			softassert "Tried to pass checkpoint %s while already passing or failing that checkpoint" s = <current_checkpoint>
		endif
	endif
	gman_setdata goal = <goal> params = {goal_checkpoint_transition = 1}
	if (<do_rollout> = 1)
		if goal_should_rollout goal = <goal>
			goal_rollout_skater deactivate_tools = 1
			skater :enableplayerinput
		endif
	endif
	if gotparam show_retry_dialog
		if (<show_retry_dialog> = 1)
			goal_failed_retry_options goal = <goal> txt = <txt>
		else
			gman_spawnedsafefailcheckpoint goal = <goal>
		endif
	else
		gman_spawnedsafefailcheckpoint goal = <goal>
	endif
endscript

script goal_skater_is_in_bail 
	if skater :isinbail
		return \{true}
	endif
	if skater :getsingletag \{nail_the_trick_bailed}
		return \{true}
	endif
	return \{false}
endscript
goal_rollout_active = 0

script goal_rollout_skater time = 3.0 deactivate_tools = 0 hide_ui = 1
	if ($goal_rollout_active = 1)
		if ($goal_debug_print = 1)
			create_console_message text = "Goal: Already in rollout."
		endif
		return
	endif
	onexitrun goal_rollout_skater_ended
	change goal_rollout_active = 1
	if ($goal_debug_print = 1)
		create_console_message text = "Goal: Rollout started."
	endif
	if (<deactivate_tools> = 1)
		gman_deactivatetools goal = <goal_id>
	endif
	kill_start_key_binding
	if goal_skater_is_in_bail
		skater :removetags tags = [nail_the_trick_bailed]
		MakeSkaterGoto SkaterInit
	elseif skater :isinbodycheck
		skater :disableplayerinput AllowCameraControl
		wait 1 gameframe
		MakeSkaterGoto SkaterInit
	endif
	if (<hide_ui> = 1)
		score_multiplier_container_id = score_multiplier_container
		trick_text_container_id = trick_text_container
		the_trick_text_id = the_trick_text
		the_score_pot_text_id = the_score_pot_text
		the_score_id = the_score
		spawnscriptnow reset_trick_string params = {
			instant
			score_multiplier_container_id = <score_multiplier_container_id>
			trick_text_container_id = <trick_text_container_id>
			the_trick_text_id = <the_trick_text_id>
			the_score_pot_text_id = <the_score_pot_text_id>
			the_score_id = <the_score_id>
			skater_num = <skater_num>
		}
	endif
	spawnscriptnow goal_rollout_safety_limit params = {time = <time>}
	skater :disableplayerinput AllowCameraControl
	SlowSkaterToStop
	killspawnedscript name = goal_rollout_safety_limit
	MakeSkaterGoto StoppedState
	restore_start_key_binding
endscript

script goal_rollout_skater_ended 
	if ($goal_debug_print = 1)
		create_console_message \{text = "Goal: Rollout ended."}
	endif
	change \{goal_rollout_active = 0}
endscript

script goal_rollout_safety_limit 
	requireparams \{[
			time
		]
		all}
	wait <time> seconds ignoreslomo
	launchevent \{type = endofrundone}
endscript

script GMan_AddStokens 
	careerfunc func = addstokens params = {stokens = <stokens>}
endscript

script GMan_GetStokens 
	careerfunc \{func = getstokens}
	return stokens = <stokens>
endscript

script goal_retry_current_goal retry_from_fail = false
	printf 'goal_retry_current_goal'
	goal_exit_area_end
	goal_trigger_dialog_kill
	grid_trigger_dialog_kill
	if gman_canretrycurrentgoal
		gman_getcurrentretryablegoalid
		if gman_getdata goal = <current_retryable_goal_id> name = retry
			printf 'goal_retry_current_goal: WARNING: retry current already active, ignoring'
			return
		endif
		gman_setretryflag type = current
		<reset_retry_from_fail> = false
		if (<retry_from_fail> = true)
			gman_getgoaltype goal = <current_retryable_goal_id>
			if (<goal_type> = classic)
				gman_setdata goal = <current_retryable_goal_id> params = {retry_from_fail = true}
				<reset_retry_from_fail> = true
			endif
		endif
		gman_getgoaltype goal = <current_retryable_goal_id>
		if checksumequals a = <goal_type> b = photo
			gman_getconstants goal = <current_retryable_goal_id>
			if ((gotparam cam_quat) && (gotparam cam_stand_pos) && (gotparam cam_stand_quat))
				goal_photo_remove_default_camera
				goal_photo_place_default_camera {
					goal = <current_retryable_goal_id>
					cam_quat = <cam_quat>
					cam_stand_pos = <cam_stand_pos>
					cam_stand_quat = <cam_stand_quat>
					cam_zoom = <cam_zoom>
					cam_target_offset = <cam_target_offset>
					cam_target_scale = <cam_target_scale>
				}
			endif
		endif
		StopAllAgentVO
		killskatercamanim current
		gman_deactivatetools goal = <current_retryable_goal_id>
		skater :killskater no_node
		if GMan_CanRetryCheckpoints goal = <current_retryable_goal_id>
			<move_to_trigger> = 0
		else
			<move_to_trigger> = 1
		endif
		goal_retry_load_zone retry_goal = <current_retryable_goal_id> move_to_trigger = <move_to_trigger>
		if gotparam no_zone_load_necessary
			igc_temporarily_disable_rendering 3 gameframes
		else
			printf 'goal_retry_current_goal - blocking for goal_retry_load_zone_done'
			block type = goal_retry_load_zone_done
			printf 'goal_retry_current_goal - got goal_retry_load_zone_done'
			gman_setdata goal = <current_retryable_goal_id> params = {hide_loading_screen = 1}
		endif
		ui_change_state state = uistate_gameplay
		gman_retrycurrentgoal
		if (<reset_retry_from_fail> = true)
			gman_setdata goal = <current_retryable_goal_id> params = {retry_from_fail = false}
		endif
		do_actual_unpause
	else
		printf 'goal_retry_current_goal - WARNING: cannot retry current goal'
	endif
endscript

script goal_retry_ambient_goal 
	printf 'goal_retry_ambient_goal'
	ui_kill_message type = alert_goal
	launchevent broadcast type = angry_chase_done
	UI_Clear_User_Goal_Waypoint
	unpauseskaters
	skater :killskater no_node
	gman_getdata goal = <goal_id>
	if gotparam restart_pos
		goal_move_skater restart_pos = <restart_pos>
	else
		softassert 'Goal %g missing restart_pos, skater will not be moved' g = <goal_id>
	endif
	if gotparam hide_loading_screen
		if (<hide_loading_screen> = 1)
			hideloadingscreen
			gman_setdata goal = <goal_id> params = {hide_loading_screen = 0}
		endif
	endif
	<do_retry_msg> = false
	switch <goal_id>
		case m_training_grind
		if NOT getglobalflag flag = $CAREER_TRAINING_DONE
			<do_retry_msg> = true
			changenodeflag nodeflag_slums_training_grind 1
			goal_setup_trigger goal_id = m_training_grind
		endif
		case m_training_manual
		if NOT getglobalflag flag = $CAREER_TRAINING_DONE
			<do_retry_msg> = true
			changenodeflag nodeflag_slums_training_manual 1
			goal_setup_trigger goal_id = m_training_manual
		endif
		case m_line_slums
		if NOT getglobalflag flag = $CAREER_TRAINING_DONE
			<do_retry_msg> = true
			goal_setup_trigger goal_id = m_line_slums
		endif
	endswitch
	if (<do_retry_msg> = true)
		if NOT gman_haswongoal goal = <goal_id>
			goal_ui_display_message text = "Almost!  Try again." type = uberalert color = red
		endif
	endif
	restore_start_key_binding
endscript
goal_is_between_retries = 0

script goal_retry_last_goal 
	goal_exit_area_end
	goal_viewport_kill \{all}
	spawnscriptnow \{goal_retry_last_goal_spawned}
endscript

script goal_retry_last_goal_spawned 
	kill_start_key_binding
	if gman_canretrylastgoal
		gman_setretryflag type = last
		goal_trigger_dialog_kill
		grid_trigger_dialog_kill
		gman_getlastretryablegoalid
		change goal_is_between_retries = 1
		if Gman_GoalHasMainPak goal = <last_retryable_goal_id>
			fadetoblack on alpha = 1 time = 0
			igc_temporarily_disable_rendering 3 gameframes
		endif
		StopAllAgentVO
		ui_kill_message type = uberalert
		score_text_bail_die
		do_actual_unpause
		ui_change_state state = uistate_gameplay
		pauseskaters
		kill_start_key_binding
		gman_setdata goal = <last_retryable_goal_id> params = {init_with_force_priority = 0 no_uninit_only_force_priority = 0}
		killskatercamanim current
		goal_classic_mode_kill_msgs
		stuckcheck = 200
		begin
		if gman_getgoalstate goal = <last_retryable_goal_id> states = $goal_idle_states
			break
		endif
		wait 2 gameframes
		stuckcheck = (<stuckcheck> - 1)
		if (<stuckcheck> = 0)
			softassert "goal_retry_last_goal_spawned - Stuck waiting for goal to finish transition"
		endif
		repeat
		if NOT gman_goalisinitialized goal = <last_retryable_goal_id>
			stuckcheck = 200
			begin
			wait 2 gameframes
			if NOT gman_getgoalstate goal = <last_retryable_goal_id> states = [goal_uniniting]
				break
			endif
			stuckcheck = (<stuckcheck> - 1)
			if (<stuckcheck> = 0)
				softassert "goal_retry_last_goal_spawned - Stuck waiting for goal_uniniting"
			endif
			repeat
			goal_historical_trigger_destroy goal_id = <last_retryable_goal_id>
			gman_setdata goal = <last_retryable_goal_id> params = {initializing_from_historical_trigger = 1}
			gman_setdata goal = <last_retryable_goal_id> params = {init_with_force_priority = 1}
			if goal_should_uninit goal_id = <last_retryable_goal_id>
				if GoalPakManager_IsIntroInited goal_id = <last_retryable_goal_id>
					appendsuffixtochecksum base = <last_retryable_goal_id> suffixstring = '_intro'
					if NOT GoalPakManager_IsLoaded goal_id = <last_retryable_goal_id> pak_id = <appended_id>
						gman_setdata goal = <last_retryable_goal_id> params = {no_uninit_only_force_priority = 1}
						printf 'goal_retry_last_goal_spawned - Bump priority of %s' s = <last_retryable_goal_id> dontassertforchecksums
					endif
				endif
			endif
			gman_initializegoal goal = <last_retryable_goal_id>
			stuckcheck = 200
			begin
			wait 2 gameframes
			if gman_goalisinitialized goal = <last_retryable_goal_id>
				break
			endif
			stuckcheck = (<stuckcheck> - 1)
			if (<stuckcheck> = 0)
				softassert "goal_retry_last_goal_spawned - Stuck waiting for GMan_GoalIsInitialized"
			endif
			repeat
			gman_setdata goal = <last_retryable_goal_id> params = {initializing_from_historical_trigger = 0}
		endif
		goal_retry_load_zone retry_goal = <last_retryable_goal_id>
		if NOT gotparam no_zone_load_necessary
			block type = goal_retry_load_zone_done
			do_actual_unpause
			gman_setdata goal = <last_retryable_goal_id> params = {hide_loading_screen = 1}
		endif
		gman_retrylastgoal
		panel_hide_score_in_goal
		fadetoblack off time = 0.5 no_wait
	else
		restore_start_key_binding
		panel_hide_score_in_goal
		do_actual_unpause
		ui_change_state state = uistate_gameplay
	endif
	change dont_create_speech_boxes = 0
	goal_trigger_dialog_kill
	grid_trigger_dialog_kill
endscript

script goal_move_skater_load_zone 
	requireparams [zone] all
	printf 'goal_move_skater_load_zone'
	<new_zone> = <zone>
	getcurrentlevel
	formattext checksumname = current_zone '%s' s = (<level_structure>.level)
	if NOT checksumequals a = <new_zone> b = <current_zone>
		<should_load> = 0
		if ((checksumequals a = <current_zone> b = z_crib) || (checksumequals a = <new_zone> b = z_crib))
			<should_load> = 1
			GetLevelStructureName level = <new_zone>
			<new_level> = (<level_structure_name>.load_script)
		elseif NOT checksumequals a = <new_zone> b = <current_zone>
			<should_load> = 1
		endif
		if (<should_load> = 1)
			printf 'goal_move_skater_load_zone: Starting a hard zone load (from %a to %b)' a = <current_zone> b = <new_zone>
			if NOT gotparam new_level
				setbuttoneventmappings block_menu_input
				skater :disableplayerinput
				if gman_getactivatedgoalid
					load_level_handle_loading_screen
				else
					load_level_handle_movie_loading_screen level = <new_zone>
				endif
			endif
			spawnscriptnow goal_wait_retry_zone_load params = {new_zone = <new_zone> new_level = <new_level> goal = <goal>}
		else
			printf 'goal_move_skater_load_zone: Zone %z already loaded, no load necessary.' z = <new_zone>
			return no_zone_load_necessary
		endif
	else
		printf 'goal_move_skater_load_zone: No load necessary, current zone matches new zone (%a)' a = <current_zone>
		return no_zone_load_necessary
	endif
endscript

script goal_retry_load_zone move_to_trigger = 1
	requireparams [retry_goal] all
	printf 'goal_retry_load_zone'
	if NOT gman_goalexists goal = <retry_goal>
		scriptassert "goal '%d' does not exist" d = <retry_goal>
	endif
	if NOT gman_getconstant goal = <retry_goal> name = start_zone
		scriptassert "goal %d is missing constant start_zone" d = <retry_goal>
	endif
	if gman_getcheckpointstartzone goal = <retry_goal>
		if checksumequals a = <checkpoint_start_zone> b = dont_load_zone
			return no_zone_load_necessary
		endif
		<new_zone> = <checkpoint_start_zone>
		printf channel = goal 'goal_retry_load_zone: checkpoint start zone (%z)' z = <new_zone>
	else
		<new_zone> = <start_zone>
		printf channel = goal 'goal_retry_load_zone: goal start zone (%z)' z = <new_zone>
	endif
	if (<move_to_trigger> = 1)
		if gman_getconstant goal = <retry_goal> name = trigger_pos
			goal_move_skater pos = <trigger_pos>
			skater :disableplayerinput
		endif
	endif
	goal_move_skater_load_zone zone = <new_zone> goal = <retry_goal>
	if gotparam no_zone_load_necessary
		return no_zone_load_necessary
	endif
endscript
goal_zone_loading = 0

script goal_wait_retry_zone_load 
	printf 'goal_wait_retry_zone_load'
	change goal_zone_loading = 1
	if gotparam new_level
		requireparams [goal] all
		change goal_startup_goal = <goal>
		change_level level = <new_level>
		printf 'goal_wait_retry_zone_load - waiting for goal'
		begin
		if gman_goalexists goal = <goal>
			break
		endif
		wait 1 gameframe
		repeat
	elseif gotparam new_zone
		setpakmancurrentblock map = zones pak = <new_zone>
		wait 0.5 seconds ignoreslomo
		if NOT zoneloadedandparsed <new_zone>
			wait 1 gameframe
			printf 'goal_retry_load_zone: Done waiting for zone to unload, starting actual load.'
			setpakmancurrentblock map = zones pak = <new_zone>
		endif
	else
		scriptassert "must pass either new_zone or new_level"
	endif
	change goal_zone_loading = 0
	launchevent broadcast type = goal_retry_load_zone_done
	setbuttoneventmappings unblock_menu_input
	printf 'goal_retry_load_zone: Finished hard zone load.'
endscript

script goal_debug_beat_checkpoint 
	printf 'goal_debug_beat_checkpoint'
	gman_getactivatedgoalid
	begin
	if gman_goalisinitialized goal = <activated_goal_id>
		break
	endif
	if NOT gman_hasactivegoals
		break
	endif
	printf 'Debug beat checkpoint: Waiting for goal to finish initializing.'
	wait 2 gameframes
	repeat
	if gman_getactivatedgoalid
		killskatercamanim current
		gman_passcheckpoint goal = <activated_goal_id>
	endif
	panel_hide_score_in_goal
	do_actual_unpause
	ui_change_state state = uistate_gameplay
endscript

script goal_quit_current_goal 
	wait \{1
		gameframe}
	if screenelementexists \{id = goal_message}
		runscriptonscreenelement \{id = goal_message
			kill_panel_message}
	endif
	ui_kill_all_messages \{instant = 1}
	gman_deactivateallgoals
	do_actual_unpause
	ui_change_state \{state = uistate_gameplay}
endscript

script goal_move_skater_hold_hack 
	begin
	skater :disableplayerinput
	wait \{1
		gameframe}
	repeat
endscript

script goal_move_skater_hold_hack_end 
	killspawnedscript \{name = goal_move_skater_hold_hack}
endscript

script goal_move_skater 
	if gotparam restart_pos
		<pos> = (<restart_pos>.pos)
		if structurecontains structure = restart_pos quat
			<quat> = (<restart_pos>.quat)
		endif
	endif
	Ragdoll_Bail_Flash_Kill
	skater :killskater no_node
	if gotparam zone
		goal_move_skater_load_zone zone = <zone>
		if NOT gotparam no_zone_load_necessary
			spawnscriptnow goal_move_skater_hold_hack
			onexitrun goal_move_skater_hold_hack_end
			block type = goal_retry_load_zone_done
		endif
	endif
	skater :TeleportSkaterToNode {
		nodename = <restart_node>
		pos = <pos>
		quat = <quat>
		no_message
		do_effect = 0
		no_offset
		reset
	}
	if gotparam zone
		if NOT gotparam no_zone_load_necessary
			goal_move_skater_hold_hack_end
			MakeSkaterGoto SkaterInit
			hideloadingscreen
			restore_start_key_binding
		endif
	endif
endscript

script ready_skater_for_early_end_current_goal 
	if innetgame
		return
	endif
	if insplitscreengame
		return
	endif
	if isobserving
		return
	endif
	if gamemodeequals \{is_classic}
		return
	endif
	if NOT iscreated \{skater}
		return
	endif
	if skater :isinendofrun
		resetskaters node_name = <restart_node>
	endif
endscript

script goal_init_after_end_of_run 
	if NOT gman_goalexists goal = <goal_id>
		return
	endif
	gman_getdata goal = <goal_id>
	if gotparam competition
		return
	endif
	getskaterid
	begin
	if gman_goalexists goal = <goal_id>
		if GoalManager_FinishedEndOfRun name = <goal_id>
			GoalManager_ClearEndRun name = <goal_id>
			if NOT gamemodeequals is_classic
				if <objid> :skating
					skater :killskater no_node
				endif
			endif
			if innetgame
				<objid> :netenableplayerinput
			else
				if NOT gamemodeequals is_classic
					<objid> :enableplayerinput
				endif
			endif
			break
		endif
	else
		break
	endif
	wait 1 gameframe
	repeat
endscript

script goal_create_non_ped_trigger 
	if iscreated <id>
		return
	endif
	setsearchallassetcontexts
	<trigger_components> = [
		{component = motion}
		{component = model}
		{component = suspend}
		{component = objectproximity}
		{component = sound}
		{component = hover}
	]
	if gotparam compassbliptype
		<compassblip_component> = {component = compassblip compassbliptype = <compassbliptype>}
		addarrayelement array = <trigger_components> element = <compassblip_component>
		<trigger_components> = <array>
	endif
	createcompositeobject {
		components = <trigger_components>
		params = {
			name = <id>
			model = <model>
			pos = <pos>
			scale = 0.6
			suspenddistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
		}
	}
	if gotparam quat
		<id> :obj_setorientation quat = <quat>
	endif
	setsearchallassetcontexts off
	if gotparam create_script
		spawnscriptnow <create_script> params = {<create_params>}
	endif
endscript

script goal_trigger_init_goal_trigger activate_goal = 1 do_outline = true
	if ($goal_debug_print = 1)
		printf 'goal_trigger_init_goal_trigger - %a for goal %b' a = <trigger_obj_id> b = <goal_id>
	endif
	if gman_getdata goal = <goal_id> name = initializing_from_historical_trigger
		if (<initializing_from_historical_trigger> = 1)
			return
		endif
	endif
	if NOT gotparam prompt_text
		goal_get_prompt_text goal = <goal_id>
	endif
	if NOT iscreated <trigger_obj_id>
		create name = <trigger_obj_id>
	endif
	if NOT gotparam prompt_text
		goal_get_prompt_text goal = <goal_id>
	endif
	<trigger_obj_id> :settags goal_id = <goal_id>
	<trigger_obj_id> :obj_spawnscriptlater {
		goal_trigger_set_trigger_exceptions
		params = {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
			do_outline = <do_outline>
		}
	}
endscript

script goal_trigger_reset_goal_trigger 
	requireparams \{[
			activate_goal
		]
		all}
	if iscreated <trigger_obj_id>
		cleareventhandler \{objectinradius}
		<trigger_obj_id> :obj_spawnscriptlater goal_trigger_wait_and_set_exceptions params = {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
			do_outline = <do_outline>
		}
	endif
endscript

script goal_trigger_wait_and_set_exceptions 
	wait \{20
		gameframes}
	goal_trigger_set_trigger_exceptions {
		goal_id = <goal_id>
		trigger_obj_id = <trigger_obj_id>
		prompt_text = <prompt_text>
		activate_goal = <activate_goal>
		trigger_script = <trigger_script>
		trigger_script_params = <trigger_script_params>
		do_outline = <do_outline>
	}
endscript

script goal_trigger_set_trigger_exceptions 
	requireparams \{[
			activate_goal
		]
		all}
	goal_trigger_dialog_kill goal_id = <goal_id>
	cleareventhandler \{objectoutofradius}
	runscriptonobject {
		id = <trigger_obj_id>
		goal_set_exception_on_goal_trigger
		params = {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
			do_outline = <do_outline>
		}
	}
endscript

script goal_set_exception_on_goal_trigger 
	requireparams \{[
			activate_goal
		]
		all}
	cleareventhandler \{objectoutofradius}
	obj_setinnerradius \{$goal_utilities_trigger_radius_outer}
	seteventhandler {
		event = objectinradius
		scr = goal_trigger_far
		response = call_script
		params = {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
			do_outline = <do_outline>
		}
	}
endscript

script goal_trigger_clear_goal_trigger 
	printf 'goal_trigger_clear_goal_trigger - %a for goal %b' a = <trigger_obj_id> b = <goal_id>
	goal_trigger_dialog_kill goal_id = <goal_id>
	cleareventhandler \{objectoutofradius}
	runscriptonobject id = <trigger_obj_id> goal_unset_exception_on_goal_trigger
endscript

script goal_unset_exception_on_goal_trigger 
	cleareventhandler \{objectoutofradius}
	seteventhandler \{event = objectinradius
		scr = nullscript
		response = call_script}
endscript

script goal_trigger_can_start_goal do_near_check = 1
	if ($dont_create_speech_boxes = 1)
		return false
	endif
	if ($game_progress_block_triggers = 1)
		return false
	endif
	if ($sysnotify_wait_in_progress = 1)
		return false
	endif
	if gman_goalisactive goal = <goal_id>
		return false
	endif
	if gman_getactivatedgoalid
		return false
	endif
	if GMan_GoalIsLocked goal = <goal_id>
		return false
	endif
	if istrue $igc_playing
		return false
	endif
	if screenelementexists id = root_window
		if root_window :getsingletag menu_state
			if (<menu_state> = on)
				return false
			endif
		endif
	endif
	if NOT gman_canstartgoal name = <goal_id>
		return false
	endif
	if ($cap_in_menu = 1)
		return false
	endif
	if ($ingame_save_active = 1)
		return false
	endif
	if skater :export_isrecording
		return false
	endif
	if ve_is_playing
		return false
	endif
	if ($video_editor_in_video_editor = 1)
		return false
	endif
	if screenelementexists id = goal_photo_viewport_container
		return false
	endif
	if screenelementexists id = goal_photo_picture_handle
		return false
	endif
	if screenelementexists id = ui_accolade_anchor
		return false
	endif
	getskaterid
	<skaterid> = <objid>
	if <skaterid> :isinbail
		return false
	endif
	if (<do_near_check> = 1)
		if skatercurrentscorepotgreaterthan 0
			return false
		elseif <skaterid> :skating
			if NOT <skaterid> :onground
				return false
			endif
		elseif NOT <skaterid> :walk_ground
			return false
		endif
	endif
	return true
endscript

script goal_trigger_far 
	requireparams [activate_goal] all
	if NOT goal_trigger_can_start_goal goal_id = <goal_id> do_near_check = 0
		return
	endif
	cleareventhandler objectinradius
	gettags
	if gotparam dont_glow
		<do_outline> = false
	endif
	if NOT gotparam do_outline
		printf "WARNING: trigger missing do_outline tag"
		<do_outline> = false
	endif
	if (<do_outline> = true)
		gman_getgoaltype goal = <goal_id>
		if checksumequals a = <goal_type> b = story
			GMan_GetLifestyle goal = <goal_id>
			SetOutlineBasedOnLifestyle lifestyle = <lifestyle>
		endif
		obj_setoutlineflag on
	endif
	goal_trigger_dialog_kill goal_id = <goal_id>
	obj_setouterradius $goal_utilities_trigger_radius_outer
	seteventhandler {
		event = objectoutofradius
		scr = goal_trigger_refuse
		response = call_script
		params = {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
			do_outline = <do_outline>
		}
	}
	obj_setinnerradius $goal_utilities_trigger_radius_inner
	seteventhandler {
		event = objectinradius
		scr = goal_trigger_near
		response = call_script
		params = {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
			do_outline = <do_outline>
		}
	}
endscript

script goal_trigger_dialog_create 
	requireparams [activate_goal] all
	if screenelementexists id = goal_start_dialog
		return
	endif
	if ($goal_trigger_dialog_accepted = 1)
		return
	endif
	goal_trigger_dialog_clear_ped_speech
	if NOT gotparam prompt_text
		gman_getgoalstring goal = <goal_id>
		<prompt_text> = <goal_string>
	endif
	formattext textname = accept_text "\\m5 %s" s = <prompt_text>
	create_speech_box {
		anchor_id = goal_start_dialog
		text = <accept_text>
		no_pad_choose
		no_pad_start
		pad_option_script = goal_accept_trigger
		pad_option_params = {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
		}
		z_priority = 5
	}
	goal_start_dialog :settags owner_goal_id = <goal_id>
endscript

script goal_trigger_dialog_clear_ped_speech 
	if objectexists \{id = ped_speech_dialog}
		ped_speech_dialog :gettags
		if gotparam \{ped_id}
			runscriptonobject id = <ped_id> goal_trigger_dialog_reset_ped_speech params = <...>
		endif
	endif
endscript

script goal_trigger_dialog_reset_ped_speech 
	cleareventhandler \{anyobjectinradius}
	destroyscreenelement \{id = ped_speech_dialog}
	seteventhandler event = anyobjectinradius scr = ped_speech_got_trigger object = <ped_id> params = <...>
endscript

script goal_trigger_dialog_kill 
	if NOT screenelementexists \{id = goal_start_dialog}
		return
	endif
	if gotparam \{goal_id}
		if goal_start_dialog :getsingletag \{owner_goal_id}
			if NOT (<goal_id> = <owner_goal_id>)
				return
			endif
		endif
	endif
	destroyscreenelement \{id = goal_start_dialog}
endscript

script goal_trigger_near 
	requireparams [activate_goal] all
	if goal_trigger_can_start_goal goal_id = <goal_id> do_near_check = 1
		goal_trigger_dialog_create {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
		}
		obj_setouterradius $goal_utilities_trigger_radius_inner
		seteventhandler {
			event = objectoutofradius
			scr = goal_trigger_far
			response = call_script
			params = {
				goal_id = <goal_id>
				trigger_obj_id = <trigger_obj_id>
				prompt_text = <prompt_text>
				activate_goal = <activate_goal>
				trigger_script = <trigger_script>
				trigger_script_params = <trigger_script_params>
				do_outline = <do_outline>
			}
		}
	else
		goal_trigger_dialog_kill goal = <goal_id>
		goal_trigger_reset_goal_trigger {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
			do_outline = <do_outline>
		}
	endif
endscript

script goal_trigger_refuse \{anchor_id = goal_start_dialog}
	requireparams \{[
			activate_goal
		]
		all}
	cleareventhandler \{objectoutofradius}
	obj_setouterradius \{0}
	obj_setoutlineflag \{off}
	goal_trigger_dialog_kill goal_id = <goal_id>
	goal_trigger_reset_goal_trigger {
		goal_id = <goal_id>
		trigger_obj_id = <trigger_obj_id>
		prompt_text = <prompt_text>
		activate_goal = <activate_goal>
		trigger_script = <trigger_script>
		trigger_script_params = <trigger_script_params>
		do_outline = <do_outline>
	}
endscript
goal_trigger_dialog_accepted = 0

script goal_clear_trigger_in_exception 
	cleareventhandler \{objectinradius}
	goal_trigger_dialog_kill
endscript

script goal_accept_trigger 
	debounce x time = 0.5
	goal_trigger_dialog_kill
	gman_setdata goal = <goal_id> params = {init_with_force_priority = 0 no_uninit_only_force_priority = 0}
	if gotparam trigger_script
		<trigger_script> <trigger_script_params>
	endif
	<start_goal> = 0
	if goal_trigger_can_start_goal goal_id = <goal_id>
		if NOT gman_hasactivegoals
			if (<activate_goal> = 1)
				<start_goal> = 1
			endif
		endif
	endif
	<can_accept> = 0
	if ((gotparam trigger_script) || (<start_goal> = 1))
		<can_accept> = 1
	endif
	if (<can_accept> = 1)
		if NOT iscreated <trigger_obj_id>
			softassert "goal trigger object %t doesn't exist" t = <trigger_obj_id>
			return
		endif
		runscriptonobject id = <trigger_obj_id> goal_clear_trigger_in_exception
		change goal_trigger_dialog_accepted = 1
		goal_viewport_kill all
		StopAllAgentVO
		gman_getdata goal = <goal_id>
		<trigger_obj_id> :obj_setoutlineflag off
		if (<start_goal> = 1)
			kill_start_key_binding
			goal_accept_trigger_activate <...>
		else
			change goal_trigger_dialog_accepted = 0
		endif
	else
		goal_trigger_reset_goal_trigger {
			goal_id = <goal_id>
			trigger_obj_id = <trigger_obj_id>
			prompt_text = <prompt_text>
			activate_goal = <activate_goal>
			trigger_script = <trigger_script>
			trigger_script_params = <trigger_script_params>
		}
	endif
endscript

script goal_accept_trigger_activate 
	<trigger_obj_id> :gettags
	<do_historical_check> = false
	if gotparam is_historical_trigger
		<do_historical_check> = true
	endif
	if ((<do_historical_check> = true) && (<is_historical_trigger> = true))
		goal_historical_trigger_destroy goal_id = <goal_id>
		gman_setdata goal = <goal_id> params = {initializing_from_historical_trigger = 1}
		if NOT gman_haswongoal goal = <goal_id>
			if GoalPakManager_IsIntroInited goal_id = <goal_id>
				gman_setdata goal = <goal_id> params = {no_uninit_only_force_priority = 1}
				printf 'goal_accept_trigger - Bump priority of %s' s = <goal_id> dontassertforchecksums
			endif
		endif
		if goal_should_uninit goal_id = <goal_id>
			gman_setdata goal = <goal_id> params = {init_with_force_priority = 1}
		endif
		gman_initializegoal goal = <goal_id>
		stuck_check = 200
		begin
		if gman_goalisinitialized goal = <goal_id>
			break
		endif
		wait 2 gameframes
		stuck_check = (<stuck_check> - 1)
		if (<stuck_check> = 0)
			softassert "Stuck in goal_accept_trigger, waiting for %s intro to load!" s = <goal_id>
		endif
		repeat
		gman_setdata goal = <goal_id> params = {initializing_from_historical_trigger = 0}
	endif
	gman_deactivateallgoals
	gman_blockuntilallgoalsdeactivated
	gman_activategoal goal = <goal_id>
endscript

script goal_got_flag_sound 
	soundevent \{event = GoalUtils_SFX_GotFlag}
endscript

script goal_save_accept 
	dialog_box_exit
	kill_start_key_binding
	launch_beat_goal_save_game_sequence \{pad_back_script = goal_save_reject
		no_cam_anim}
endscript

script goal_save_reject 
	unpausegame
	gman_setcanstartgoal \{1}
	restore_start_key_binding
	dialog_box_exit
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
	root_window :settags \{menu_state = off}
	unpause_rain
	unhide_console_window
	unpause_trick_text
	launchevent \{broadcast
		type = goal_wait_for_save}
endscript
ped_zone_list = [
	{
		nodearray = 'Z_MONUMENTS'
		zone = z_monuments
		context = z_monuments
	}
	{
		nodearray = 'Z_MUSEUMS'
		zone = z_museums
		context = z_museums
	}
	{
		nodearray = 'Z_MUSEUM_INT'
		zone = z_museum_int
		context = z_museum_int
	}
	{
		nodearray = 'Z_BCITY'
		zone = z_bcity
		context = z_bcity
	}
	{
		nodearray = 'Z_HARBOR'
		zone = z_harbor
		context = z_harbor
	}
	{
		nodearray = 'Z_LANSDOWNE'
		zone = z_lansdowne
		context = z_lansdowne
	}
	{
		nodearray = 'Z_LOVE'
		zone = z_love
		context = z_love
	}
	{
		nodearray = 'Z_BELL'
		zone = z_bell
		context = z_bell
	}
	{
		nodearray = 'Z_FDR'
		zone = z_fdr
		context = z_fdr
	}
	{
		nodearray = 'Z_SLUMS'
		zone = z_slums
		context = z_slums
	}
	{
		nodearray = 'Z_PB_BRIDGE'
		zone = z_pb_bridge
		context = z_pb_bridge
	}
	{
		nodearray = 'Z_WP_BRIDGE'
		zone = z_wp_bridge
		context = z_wp_bridge
	}
	{
		nodearray = 'Z_BW_BRIDGE'
		zone = z_bw_bridge
		context = z_bw_bridge
	}
	{
		nodearray = 'Z_SECRET'
		zone = Z_SECRET
		context = Z_SECRET
	}
	{
		nodearray = 'Z_CRIB'
		zone = z_crib
		context = z_crib
	}
]
ped_zone_list_z_peds = [
	{
		zone = z_monuments
	}
	{
		zone = z_museums
	}
	{
		zone = z_museum_int
	}
	{
		zone = z_bcity
	}
	{
		zone = z_harbor
	}
	{
		zone = z_lansdowne
	}
	{
		zone = z_love
	}
	{
		zone = z_bell
	}
	{
		zone = z_fdr
	}
	{
		zone = z_slums
	}
	{
		zone = z_pb_bridge
	}
	{
		zone = z_wp_bridge
	}
	{
		zone = z_bw_bridge
	}
	{
		zone = Z_SECRET
	}
	{
		zone = z_crib
	}
]

script goal_kill_all_peds include_goalpeds = true
	printf 'goal_kill_all_peds'
	killspawnedscript name = AmbientScenes_ManagePak
	killspawnedscript name = Pedlife_Refresh
	change block_pedspawn = 1
	KillAllPedLifeObjects
	destroy_global_peds_in_zone zone = z_peds nodearray = 'Z_PEDS'
	destroy_global_peds_in_zone zone = z_vehicles nodearray = 'z_vehicles'
	foreachin ($ped_zone_list) do = destroy_global_peds_in_zone
	foreachin ($ped_zone_list_z_peds) do = destroy_global_peds_in_zone params = {nodearray = 'Z_PEDS'}
	foreachin ($ped_zone_list_z_peds) do = destroy_global_peds_in_zone params = {nodearray = 'z_vehicles'}
	foreachin ($ped_zone_list_z_peds) do = destroy_global_peds_in_zone params = {nodearray = 'global'}
	if (<include_goalpeds> = true)
		goal_toggle_goal_peds hide = true ignore_goal = <ignore_goal>
	endif
endscript

script goal_restore_all_peds 
	printf 'goal_restore_all_peds'
	change block_pedspawn = 0
	if ($goal_goalmanager_uninitializing = 0)
		spawn_global_peds_in_zone zone = z_peds nodearray = 'Z_PEDS'
		spawn_global_peds_in_zone zone = z_vehicles nodearray = 'z_vehicles'
		foreachin ($ped_zone_list) do = spawn_global_peds_in_zone
		foreachin ($ped_zone_list_z_peds) do = spawn_global_peds_in_zone params = {nodearray = 'Z_PEDS'}
		foreachin ($ped_zone_list_z_peds) do = spawn_global_peds_in_zone params = {nodearray = 'z_vehicles'}
		foreachin ($ped_zone_list_z_peds) do = spawn_global_peds_in_zone params = {nodearray = 'global'}
		goal_toggle_goal_peds hide = false ignore_goal = <ignore_goal>
	endif
endscript

script goal_kill_all_vehicles 
	printf \{'goal_kill_all_vehicles'}
	killspawnedscript \{name = Pedlife_Refresh}
	change \{block_vehiclespawn = 1}
	if gotparam \{fade}
		KillPedlifeVehicles \{fade}
	else
		KillPedlifeVehicles
	endif
endscript

script goal_restore_all_vehicles 
	printf \{'goal_restore_all_vehicles'}
	change \{block_vehiclespawn = 0}
endscript

script goal_kill_all_scenes 
	printf \{'goal_kill_all_scenes'}
	if gotparam \{fade}
		DestroyAmbientScenes \{fade}
	else
		DestroyAmbientScenes
	endif
	change \{block_scenespawn = 1}
endscript

script goal_restore_all_scenes 
	printf \{'goal_restore_all_scenes'}
	change \{block_scenespawn = 0}
endscript

script goal_toggle_goal_peds 
	if NOT gotparam ignore_goal
		if gman_getactivatedgoalid
			<ignore_goal> = <activated_goal_id>
		else
			if checksumequals a = <hide> b = true
			endif
			<ignore_goal> = null
		endif
	endif
	if ($video_editor_in_video_editor = 1)
		if NOT (<ignore_goal> = null)
			scriptassert 'This is bad!'
			printf 'goal_toggle_goal_peds - Ignoring whilst in video editor: %s' s = <ignore_goal>
			return
		endif
	endif
	<kill_create> = true
	if NOT checksumequals a = <ignore_goal> b = null
		if GMan_GetTrackInfo goal = <ignore_goal>
			<ignore_goal> = (<track_info>.track)
			<kill_create> = false
		else
			switch <ignore_goal>
				case m_training_grind
				case m_training_line
				case m_training_manual
				case m_training_qp2rail
				case m_training_revman
				extendcrc <ignore_goal> '_desc' out = ignore_goal
				<kill_create> = false
			endswitch
		endif
	endif
	if NOT innetgame
		if (<kill_create> = true)
			if (<hide> = true)
				goal_track_kill_all_peds ignore_goal = <ignore_goal>
			else
				goal_track_restore_all_peds
			endif
		endif
	endif
	GMan_PedFunc func = get_global_peds
	getarraysize <global_peds>
	if (<array_size> > 0)
		<index> = 0
		begin
		if structurecontains structure = (<global_peds> [<index>]) goal_id
			<ped> = (<global_peds> [<index>])
			if NOT checksumequals a = (<ped>.goal_id) b = <ignore_goal>
				if iscreated (<ped>.ped_id)
					if (<hide> = true)
						(<ped>.ped_id) :Agent_Hide
					else
						(<ped>.ped_id) :Agent_Show
					endif
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
endscript

script goal_check_required_appearance 
	if gotparam \{specific_appearance}
		GetPlayerAppearance
		if NOT AppearanceChangedSpecific profile = <profile> specific_change = <specific_appearance>
			goto goal_check_required_appearance_box_create params = {
				goal_id = <goal_id>
				trigger_obj_id = <trigger_obj_id>
				prompt_text = <prompt_text>
				wrong_appearance_title_text = <wrong_appearance_title_text>
				wrong_appearance_body_text = <wrong_appearance_body_text>
				wrong_apperance_button_text = <wrong_apperance_button_text>
			}
		endif
	endif
endscript

script goal_check_required_appearance_box_create \{wrong_appearance_title_text = str_g_u_74
		wrong_appearance_body_text = str_g_u_75
		wrong_apperance_button_text = str_g_u_76}
	pausegame
	gman_pauseallgoals
	create_error_box {title = <wrong_appearance_title_text>
		text = <wrong_appearance_body_text>
		text_dims = (400.0, 0.0)
		bg_scale = 1.2
		buttons = [
			{
				text = <wrong_apperance_button_text>
				pad_choose_script = goal_check_required_appearance_box_exit
				pad_choose_params = {
					goal_id = <goal_id>
					trigger_obj_id = <trigger_obj_id>
					prompt_text = <prompt_text>
				}
			}
		]
	}
endscript

script goal_check_required_appearance_box_exit 
	debounce \{circle
		time = 0.3}
	goal_trigger_reset_goal_trigger goal_id = <goal_id> trigger_obj_id = <trigger_obj_id> prompt_text = <prompt_text>
	dialog_box_exit
	unpausegame
	gman_unpauseallgoals
endscript

script goal_keep_skater_paused 
	begin
	pauseskaters
	skater :pausephysics
	wait \{1
		gameframe}
	repeat
endscript

script goal_exit_area_begin verbose = 0 timer = none
	if NOT gotparam goal
		script_assert "Must pass goal= to goal_skater_exited_goal_area."
	endif
	gman_getdata goal = <goal>
	if gotparam goal_checkpoint_entered
		if (<goal_checkpoint_entered> = 0)
			return
		endif
	endif
	setscreenelementlock id = root_window off
	if screenelementexists id = goal_skater_exit_goal_area_params
		destroyscreenelement id = goal_skater_exit_goal_area_params
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = goal_skater_exit_goal_area_params
		pos = (0.0, 0.0)
		tags = {
			goal = <goal>
			verbose = <verbose>
			timer = <timer>
			restart_prefix = <restart_prefix>
			restart_positions = <restart_positions>
			restart_node = <restart_node>
			restart_pos = <restart_pos>
		}
	}
	if NOT checksumequals a = <timer> b = none
		gman_timerfunc goal = <goal> tool = <timer> func = reset
		gman_timerfunc goal = <goal> tool = <timer> func = show
		gman_timerfunc goal = <goal> tool = <timer> func = start
	endif
	<will_teleport> = 0
	if gotparam restart_prefix
		<will_teleport> = 1
	endif
	if gotparam restart_positions
		<will_teleport> = 1
	endif
	if gotparam restart_node
		<will_teleport> = 1
	endif
	if gotparam restart_pos
		<will_teleport> = 1
	endif
	if (<will_teleport> = 1)
		goal_exit_area_message text = "Get back in the goal area!"
	else
		goal_exit_area_message text = "Leaving goal area."
	endif
	if (<verbose> = 1)
		soundevent event = Classic_Mode_Out_of_bounds_Loop_start_sfx
	endif
	if ((gotparam arrow_point_to_pos) || (gotparam arrow_point_to_node) || (gotparam arrow_point_to_object))
		goal_create_arrow id = goal_exit_area_arrow
	endif
endscript

script goal_exit_area_end 
	if screenelementexists id = goal_skater_exit_goal_area_params
		goal_skater_exit_goal_area_params :gettags
		if gman_goalisactive goal = <goal>
			if NOT checksumequals a = <timer> b = none
				gman_timerfunc goal = <goal> tool = <timer> func = stop
				gman_timerfunc goal = <goal> tool = <timer> func = hide
			endif
		endif
		destroyscreenelement id = goal_skater_exit_goal_area_params
	endif
	killspawnedscript name = goal_exit_area_message_style
	if screenelementexists id = goal_exit_area_message_block
		destroyscreenelement id = goal_exit_area_message_block
	endif
	soundevent event = Classic_Mode_Out_of_bounds_Loop_stop_sfx
	if screenfx_fxinstanceexists viewport = 0 name = out_of_bounds_red
		screenfx_removefxinstance {
			viewport = 0
			name = out_of_bounds_red
		}
	endif
	goal_destroy_arrow id = goal_exit_area_arrow
endscript

script goal_exit_area_expire 
	printf \{'goal_exit_area_expire'}
	spawnscriptnow \{goal_exit_area_expire_spawned}
endscript

script goal_exit_area_expire_spawned 
	if NOT screenelementexists id = goal_skater_exit_goal_area_params
		script_assert "Something has gone wrong with the exit area scripts."
	endif
	goal_skater_exit_goal_area_params :gettags
	goal_exit_area_end
	<do_reset> = false
	gman_getgoaltype goal = <goal>
	if checksumequals a = <goal_type> b = film
		if NOT checksumequals a = <goal> b = m_training_revman
			<do_reset> = true
		endif
	endif
	switch <goal>
		case m_c1_film1
		case m_c1_film2
		case m_c1_film3
		<do_reset> = true
	endswitch
	if (<do_reset> = true)
		<teleport_type> = reset
		gman_deactivatetools goal = <goal>
		goal_film_cleanup
		goal_film_reset
	else
		<teleport_type> = none
		if gotparam restart_prefix
			<teleport_type> = type_prefix
		elseif gotparam restart_positions
			<teleport_type> = type_positions
		elseif gotparam restart_node
			<teleport_type> = type_node
		elseif gotparam restart_pos
			<teleport_type> = type_pos
		endif
		if NOT checksumequals a = <teleport_type> b = none
			skater :killskater no_node
			goal_retry_load_zone retry_goal = <goal>
			if gotparam no_zone_load_necessary
				igc_temporarily_disable_rendering 3 gameframes
			else
				printf 'goal_exit_area_expire - blocking for goal_retry_load_zone_done'
				gman_pausegoal goal = <goal>
				block type = goal_retry_load_zone_done
				gman_unpausegoal goal = <goal>
				restore_start_key_binding
				printf 'goal_exit_area_expire - got goal_retry_load_zone_done'
			endif
		endif
		switch <teleport_type>
			case type_prefix
			skater :killskater prefix = <restart_prefix>
			case type_positions
			goal_exit_area_find_closest_position_index restart_positions = <restart_positions>
			spawnscriptnow goal_move_skater params = {restart_pos = (<restart_positions> [<closest_position_index>])}
			case type_node
			spawnscriptnow goal_move_skater params = {restart_node = <restart_node>}
			case type_pos
			spawnscriptnow goal_move_skater params = {restart_pos = <restart_pos>}
		endswitch
		do_actual_unpause
		hideloadingscreen
	endif
	if checksumequals a = <teleport_type> b = none
		gman_deactivategoal goal = <goal>
		goal_exit_area_message text = "Left Goal Area. Stopping Goal."
	else
		goal_exit_area_message text = "Out of bounds! Returning to Goal."
		soundevent event = Teleport_Back_SFX
		broadcastevent type = event_goal_exit_area_teleport
	endif
endscript

script goal_exit_area_find_closest_position_index 
	skater :obj_getposition
	<shortest_distance> = 1000000000.0
	<closest_position_index> = 0
	getarraysize \{restart_positions}
	<index> = 0
	begin
	<delta> = (<pos> - (<restart_positions> [<index>].pos))
	vectorlength vector = <delta>
	if (<length> < <shortest_distance>)
		<shortest_distance> = <length>
		<closest_position_index> = <index>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return closest_position_index = <closest_position_index>
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
	printf 'starting goal_manage_objects'
	mempushcontext bottomupheap
	if gotparam action
		if gotparam objects
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
			if gotparam object
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

script goal_get_activate_pos assert = 1
	if NOT gotparam goal
		softassert 'goal_get_activate_pos: goal param required'
		return
	endif
	if gman_getconstant goal = <goal> name = trigger_pos
		gman_getconstant goal = <goal> name = trigger_quat
		return activate_pos = <trigger_pos> activate_quat = <trigger_quat>
	endif
	if IsCareerMode
		if (<assert> = 1)
			gman_getgoaltype goal = <goal>
			if checksumequals a = <goal_type> b = dummy
				return
			endif
			softassert 'goal_get_activate_pos: No trigger_pos for goal %g' g = <goal>
			return activate_pos = (0.0, 0.0, 0.0)
		endif
	endif
endscript

script goal_reinit_grid_post_unload 
	GridControlFunc func = init_grid params = {grid = <grid>}
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
	requireparams [goal grade] all
	printf 'goal_set_pending_grade -- %r' r = <grade>
	if ((<grade> < 0) || (<grade> > 3))
		softassert 'Grade %s must be in range [0 3]' s = <grade>
		return
	endif
	gman_setpendinggrade goal = <goal> grade = <grade>
	if gotparam ui
		spawnscriptnow goal_ui_announce_pending_grade params = {goal = <goal> grade = <grade> mode = <ui>}
	endif
endscript

script goal_ambient_complete_callouts 
	if NOT getglobalflag flag = $CAREER_TRAINING_DONE
		return
	endif
	wait 10 gameframes ignoreslomo
	soundevent event = street_goal_pos
	wait 1.2 seconds ignoreslomo
	game_progress_get_lifestyle_weighting
	<highest_weight> = 0.0
	<event> = none
	if (<career_weight> > <highest_weight>)
		<highest_weight> = <career_weight>
		<event> = street_goal_car
	endif
	if (<hardcore_weight> > <highest_weight>)
		<highest_weight> = <hardcore_weight>
		<event> = street_goal_hxc
	endif
	if (<rigger_weight> > <highest_weight>)
		<event> = street_goal_rig
	endif
	if NOT checksumequals a = <event> b = none
		soundevent event = <event>
	endif
	wait 1.2 seconds ignoreslomo
	get_milestone_progress
	<event> = none
	switch <current_milestone>
		case milestone_am
		<event> = street_goal_am
		case milestone_pro
		case milestone_deck
		case milestone_shoes
		<event> = street_goal_pro
		case milestone_start_team
		case milestone_built_team
		<event> = street_goal_team
	endswitch
	if NOT checksumequals a = <event> b = none
		soundevent event = <event>
	endif
endscript

script gman_preqbrgoal 
	printf "QBRGoal: %g" g = <goal>
	do_actual_unpause
	ui_change_state state = uistate_gameplay
	gman_deactivateallgoals
	gman_blockuntilallgoalsdeactivated
	if GMan_GetTrackInfo goal = <goal> name = track
		GMan_PedFunc goal = <track> tool = ped func = kill_peds
	endif
	gman_uninitializegoal goal = <goal>
	begin
	if gman_getgoalstate goal = <goal> states = [goal_uninited]
		break
	endif
	printf 'GMan_preQBRGoal: Block until goal uninited.'
	wait 2 gameframes
	repeat
	wait 2 gameframes
	gman_removegoal goal = <goal>
endscript

script gman_postqbrgoal 
	appendsuffixtochecksum base = <goal> suffixstring = '_goal_info'
	gman_addgoal goal_info = ($<appended_id>)
	wait \{2
		gameframes}
	goals_menu_select_goal goal_id = <goal> do_pulse = 0
endscript

script goal_teleport_to_start 
	goal_retry_load_zone retry_goal = <goal>
	if NOT gotparam \{no_zone_load_necessary}
		block \{type = goal_retry_load_zone_done}
	endif
	hideloadingscreen
	goal_get_activate_pos goal = <goal> assert = 0
	if gotparam \{activate_pos}
		goal_move_skater pos = <activate_pos>
	endif
endscript

script goal_handle_startup_goal 
	<began_auto_start> = false
	<do_crib_training_check> = false
	if checksumequals a = $goal_startup_goal b = null
		<do_crib_training_check> = true
	else
		if goal_is_ambient goal_id = $goal_startup_goal
			if gman_getdata goal = ($goal_startup_goal) name = restart_pos
				goal_move_skater restart_pos = <restart_pos>
			endif
		else
			goal_get_activate_pos goal = ($goal_startup_goal) assert = 0
			if gotparam activate_pos
				goal_move_skater pos = <activate_pos>
			endif
		endif
		if goal_track_goal_should_auto_start goal = ($goal_startup_goal)
			fadetoblack on alpha = 1 time = 0
			igc_temporarily_disable_rendering 1 gameframe
			spawnscriptlater goal_auto_start params = {goal = ($goal_startup_goal)}
			<began_auto_start> = true
		endif
		change goal_startup_goal = null
	endif
	getcurrentlevel
	if checksumequals a = <level> b = load_z_crib
		goal_track_create_crib_peds
		if (<do_crib_training_check> = true)
			<show_crib_training> = true
			if gman_haswongoal goal = m_cribtrain
				<show_crib_training> = false
			elseif gman_haswongoal goal = m_h1_cribcut
				<show_crib_training> = false
			else
				GMan_GetGoalAttemptData goal = m_r1_buildqp
				if (<times_started> > 0)
					<show_crib_training> = false
				endif
			endif
			if NOT (($ve_zone_change_level_action) = none)
				show_crib_training = false
			endif
			if NOT ($ve_hard_load_zone = none)
				show_crib_training = false
			endif
			if (<show_crib_training> = true)
				spawnscriptlater goal_auto_start params = {goal = m_cribtrain}
				<began_auto_start> = true
			endif
		endif
	endif
	if checksumequals a = <began_auto_start> b = false
		careerfunc func = enableatomupdate params = {enable = true}
	endif
endscript

script goal_auto_start 
	requireparams [goal] all
	if gman_goalissingleplay goal = <goal>
		if gman_haswongoal goal = <goal>
			printf '-- goal_auto_start failed: %g has already been auto-started' g = <goal>
			return
		endif
	endif
	if istrue $signin_change_happening
		fadetoblack off time = 0 no_wait
		unpausespawnedscript sysnotify_handle_signin_change
		printf '-- goal_auto_start failed: player is signing out'
		return
	endif
	fadetoblack on alpha = 1 time = 0
	printf '-- goal_auto_start: %g' g = <goal>
	begin
	if goal_trigger_can_start_goal goal_id = <goal> do_near_check = 0
		break
	endif
	wait 2 gameframes
	repeat
	printf '-- goal_auto_start: activating %g' g = <goal>
	gman_activategoal goal = <goal>
endscript

script goal_starts_in_crib 
	if gman_getconstant goal = <goal> name = start_zone
		if checksumequals a = <start_zone> b = z_crib
			return \{true}
		endif
	endif
	return \{false}
endscript

script goal_toggle_chalk_challenge_markers 
	if gotparam start_zone
		<goal_id> = null
	else
		gman_getconstant goal = <goal_id> name = start_zone
	endif
	if AreNodeFlagsLocked
		<nodeflags_locked> = 1
		SetNodeFlagLock off
	else
		<nodeflags_locked> = 0
	endif
	if checksumequals a = <start_zone> b = z_crib
		if NOT (<goal_id> = m_chalk1_crib)
			changenodeflag nodeflag_z_crib_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_crib)
			changenodeflag nodeflag_z_crib_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_crib)
			changenodeflag nodeflag_z_crib_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk4_crib)
			changenodeflag nodeflag_z_crib_chalk4 <state>
		endif
		if NOT (<goal_id> = m_chalk5_crib)
			changenodeflag nodeflag_z_crib_chalk5 <state>
		endif
	else
		if NOT (<goal_id> = m_chalk1_wp_bridge)
			changenodeflag nodeflag_z_wp_bridge_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_wp_bridge)
			changenodeflag nodeflag_z_wp_bridge_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_wp_bridge)
			changenodeflag nodeflag_z_wp_bridge_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk2_pb_bridge)
			changenodeflag nodeflag_pb_bridge_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk3_pb_bridge)
			changenodeflag nodeflag_pb_bridge_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk1_pb_bridge)
			changenodeflag nodeflag_pb_bridge_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk1_bw_bridge)
			changenodeflag nodeflag_bw_bridge_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_bw_bridge)
			changenodeflag nodeflag_bw_bridge_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_bw_bridge)
			changenodeflag nodeflag_bw_bridge_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk1_fdr)
			changenodeflag nodeflag_z_fdr_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_fdr)
			changenodeflag nodeflag_z_fdr_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_fdr)
			changenodeflag nodeflag_z_fdr_chalk3 <state>
		endif
		if getglobalflag flag = $CAREER_TRAINING_DONE
			if NOT (<goal_id> = m_training_grind)
				changenodeflag nodeflag_slums_training_grind <state>
			endif
			if NOT (<goal_id> = m_training_manual)
				changenodeflag nodeflag_slums_training_manual <state>
			endif
			if NOT (<goal_id> = m_chalk3_slums)
				changenodeflag nodeflag_slums_chalk3 <state>
			endif
			if NOT (<goal_id> = m_chalk4_slums)
				changenodeflag nodeflag_slums_chalk4 <state>
			endif
		endif
		if NOT (<goal_id> = m_chalk3_love)
			changenodeflag nodeflag_z_love_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk4_love)
			changenodeflag nodeflag_z_love_chalk4 <state>
		endif
		if NOT (<goal_id> = m_chalk5_love)
			changenodeflag nodeflag_z_love_chalk5 <state>
		endif
		if NOT (<goal_id> = m_chalk1_love)
			changenodeflag nodeflag_z_love_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_love)
			changenodeflag nodeflag_z_love_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk6_love)
			changenodeflag nodeflag_z_love_chalk6 <state>
		endif
		if NOT (<goal_id> = m_chalk1_monuments)
			changenodeflag nodeflag_z_monuments_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_monuments)
			changenodeflag nodeflag_z_monuments_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_monuments)
			changenodeflag nodeflag_z_monuments_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk1_museums)
			changenodeflag nodeflag_z_museums_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_museums)
			changenodeflag nodeflag_z_museums_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_museums)
			changenodeflag nodeflag_z_museums_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk2_museum_int)
			changenodeflag nodeflag_z_museum_int_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk1_museum_int)
			changenodeflag nodeflag_z_museum_int_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_museum_int)
			changenodeflag nodeflag_z_museum_int_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk1_lansdowne)
			changenodeflag nodeflag_z_lansdowne_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_lansdowne)
			changenodeflag nodeflag_z_lansdowne_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_lansdowne)
			changenodeflag nodeflag_z_lansdowne_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk1_harbor)
			changenodeflag nodeflag_harbor_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_harbor)
			changenodeflag nodeflag_harbor_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_harbor)
			changenodeflag nodeflag_harbor_chalk3 <state>
		endif
		if NOT (<goal_id> = m_chalk1_bcity)
			changenodeflag nodeflag_bcity_chalk1 <state>
		endif
		if NOT (<goal_id> = m_chalk2_bcity)
			changenodeflag nodeflag_bcity_chalk2 <state>
		endif
		if NOT (<goal_id> = m_chalk3_bcity)
			changenodeflag nodeflag_bcity_chalk3 <state>
		endif
	endif
	if istrue <nodeflags_locked>
		SetNodeFlagLock
	endif
endscript

script goal_debug_show_states 
	begin
	if screenelementexists id = goal_debug_state_menu
		destroyscreenelement id = goal_debug_state_menu
	endif
	createscreenelement {
		id = goal_debug_state_menu
		type = vmenu
		parent = root_window
		scale = 0.6
		pos = (70.0, 20.0)
		just = [left top]
		internal_just = [left top]
		z_priority = 100
		regular_space_amount = 34
	}
	if ($goals_for_gamemode_loaded = 1)
		getarraysize ($goal_types)
		<num_types> = <array_size>
		<j> = 0
		begin
		<goal_type> = ($goal_types [<j>])
		removeparameter goals_by_type
		if gman_getgoalsbytype type = <goal_type>
			getarraysize <goals_by_type>
			<num_goals> = <array_size>
			if (<num_goals> > 0)
				<i> = 0
				begin
				<goal> = (<goals_by_type> [<i>])
				if gman_goalexists goal = <goal>
					gman_getgoalstate goal = <goal>
					formattext textname = text "%g - %s" g = <goal> s = <goal_state> dontassertforchecksums
					if NOT ((checksumequals a = <goal_state> b = goal_uninited) || (checksumequals a = <goal_state> b = goal_inactive))
						<text_color> = [255 255 255 70]
						switch <goal_state>
							case goal_activating
							case goal_deactivating
							case goal_initing
							case goal_uniniting
							case goal_rewards
							<text_color> = [255 255 0 255]
							case goal_activated
							<text_color> = [0 255 0 255]
						endswitch
						if gman_getactivatedgoalid
							if checksumequals a = <activated_goal_id> b = <goal>
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
						else
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
						if checksumequals a = <goal_state> b = goal_activated
							gman_getcurrentcheckpoint goal = <goal>
							formattext textname = c_text "  checkpoint: %c" c = <current_checkpoint> dontassertforchecksums
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
	wait 10 gameframes
	repeat
endscript
slow_to_pause_wait_for_input_is_slowing = 0

script slow_to_pause_wait_for_input 
	killspawnedscript name = slow_to_pause_checking_for_buttons
	if screenelementexists id = slow_and_wait_input_event
		destroyscreenelement id = slow_and_wait_input_event
	endif
	if NOT gotparam no_slowdown
		change slow_to_pause_wait_for_input_is_slowing = 1
		setslomo 0.75
		wait 2 gameframes
		setslomo 0.5
		wait 2 gameframes
		setslomo 0.25
		wait 3 gameframes
		setslomo 0.1
		wait 4 gameframes
	endif
	if NOT gotparam not_NTT
		if NOT gotparam no_slowdown
			wait 0.7 seconds ignoreslomo
			skatercam0 :pause
		endif
	endif
	pauseskaters
	kill_start_key_binding
	setslomo 1.0
	if gotparam sounds
		if (<sounds> = 1)
			soundevent event = sk9_Skater_Stop_SFX2
		endif
	endif
	change slow_to_pause_wait_for_input_is_slowing = 0
	if gotparam uber
		ui_display_message type = uberalert text = <uber> color = bluelt time = 2000
	endif
	if gotparam instruc
		ui_display_message type = instruction text = <instruc>
	endif
	array_size = 0
	if gotparam buttons
		getarraysize <buttons>
	endif
	if (<array_size> > 0)
		createscreenelement {
			type = containerelement
			parent = root_window
			id = slow_and_wait_input_event
			pos = (0.0, 0.0)
		}
		<event_handlers> = []
		getarraysize buttons
		<index> = 0
		begin
		temp_array = [
			{
				pad_null
				null_script
				params = {}
			}
		]
		setarrayelement arrayname = temp_array index = 0 newvalue = {
			(<buttons> [<index>])
			slow_to_pause_on_input_event
			params = {button = (<buttons> [<index>])}
		}
		<event_handlers> = (<event_handlers> + <temp_array>)
		<index> = (<index> + 1)
		repeat <array_size>
		setscreenelementprops {
			id = slow_and_wait_input_event
			event_handlers = <event_handlers>
			replace_hadlers
		}
		launchevent target = slow_and_wait_input_event type = focus
		if gotparam sounds
			sounds = 1
		else
			sounds = 0
		endif
		spawnscriptnow slow_to_pause_checking_for_buttons params = {
			buttons = (<buttons>)
			uber_on_got = <uber_on_got>
			instruc_on_got = <instruc_on_got>
			script_on_got = <script_on_got>
			analogue_l = <analogue_l>
			analogue_r = <analogue_r>
			sounds = <sounds>
		}
	endif
	if gotparam button_and_stick
		return
	endif
	if gotparam analogue_l
		if gotparam analogue_r
			if gotparam sounds
				sounds = 1
			else
				sounds = 0
			endif
			spawnscriptnow slow_to_pause_checking_for_sticks params = {
				analogue_l = <analogue_l>
				analogue_r = <analogue_r>
				uber_on_got = <uber_on_got>
				instruc_on_got = <instruc_on_got>
				script_on_got = <script_on_got>
				sounds = <sounds>
			}
		else
			if gotparam sounds
				sounds = 1
			else
				sounds = 0
			endif
			spawnscriptnow slow_to_pause_checking_for_sticks params = {
				analogue_l = <analogue_l>
				uber_on_got = <uber_on_got>
				instruc_on_got = <instruc_on_got>
				script_on_got = <script_on_got>
				sounds = <sounds>
			}
		endif
	elseif gotparam analogue_r
		if gotparam sounds
			sounds = 1
		else
			sounds = 0
		endif
		spawnscriptnow slow_to_pause_checking_for_sticks params = {
			analogue_r = <analogue_r>
			uber_on_got = <uber_on_got>
			instruc_on_got = <instruc_on_got>
			script_on_got = <script_on_got>
			sounds = <sounds>
		}
	endif
endscript

script slow_to_pause_checking_for_buttons 
	getarraysize buttons
	begin
	all_buttons_pressed = 1
	index = 0
	begin
	if NOT slow_and_wait_input_event :getsingletag (<buttons> [<index>])
		all_buttons_pressed = 0
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	if (<all_buttons_pressed> = 1)
		if ((gotparam analogue_l) || (gotparam analogue_r))
			if gotparam analogue_l
				stk = left
				dir = <analogue_l>
			elseif gotparam analogue_r
				stk = right
				dir = <analogue_r>
			endif
			is_analogue_direction_held stick = <stk> direction = <dir>
			if (<is_held> = 1)
				slow_to_pause_unpause uber_on_got = <uber_on_got> instruc_on_got = <instruc_on_got> script_on_got = <script_on_got>
				break
			endif
		else
			slow_to_pause_unpause uber_on_got = <uber_on_got> instruc_on_got = <instruc_on_got> script_on_got = <script_on_got>
			break
		endif
	endif
	index = 0
	begin
	slow_and_wait_input_event :removetags (<buttons> [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
	wait 3 gameframes
	repeat
	if screenelementexists id = slow_and_wait_input_event
		destroyscreenelement id = slow_and_wait_input_event
	endif
	if gotparam sounds
		if (<sounds> = 1)
			soundevent event = sk9_Outof_Skater_Stop
		endif
	endif
endscript

script slow_to_pause_on_input_event 
	slow_and_wait_input_event :settags <button>
endscript

script slow_to_pause_checking_for_sticks 
	<created_temporary_element> = 0
	if NOT screenelementexists id = slow_and_wait_input_event
		createscreenelement {
			id = slow_and_wait_input_event
			type = containerelement
			parent = root_window
		}
		<created_temporary_element> = 1
	endif
	if gotparam analogue_l
		stk = left
		dir = <analogue_l>
		if gotparam analogue_r
			stk2 = right
			dir2 = <analogue_r>
		endif
	else
		stk = right
		dir = <analogue_r>
	endif
	is_held = 0
	held1 = 0
	held2 = 0
	begin
	if gotparam stk2
		is_analogue_direction_held stick = <stk> direction = <dir>
		held1 = <is_held>
		is_analogue_direction_held stick = <stk2> direction = <dir2>
		held2 = <is_held>
		printstruct <...>
		if (<held1> = 1)
			if (<held2> = 1)
				if gotparam button_and_stick
					if gotparam analogue_l
						stk = left
						dir = <dir>
					elseif gotparam analogue_r
						stk = right
						dir = <dir>
					endif
					is_analogue_direction_held stick = <stk> direction = <dir>
					if (<is_held> = 1)
						slow_to_pause_unpause uber_on_got = <uber_on_got> instruc_on_got = <instruc_on_got> script_on_got = <script_on_got>
					endif
				else
					slow_to_pause_unpause uber_on_got = <uber_on_got> instruc_on_got = <instruc_on_got> script_on_got = <script_on_got>
				endif
				break
			endif
		endif
	else
		is_analogue_direction_held stick = <stk> direction = <dir>
		if (<is_held> = 1)
			if gotparam button_and_stick
				if gotparam analogue_l
					stk = left
					dir = <dir>
				elseif gotparam analogue_r
					stk = right
					dir = <dir>
				endif
				is_analogue_direction_held stick = <stk> direction = <dir>
				if (<is_held> = 1)
					slow_to_pause_unpause uber_on_got = <uber_on_got> instruc_on_got = <instruc_on_got> script_on_got = <script_on_got>
				endif
			else
				slow_to_pause_unpause uber_on_got = <uber_on_got> instruc_on_got = <instruc_on_got> script_on_got = <script_on_got>
			endif
			break
		endif
	endif
	wait 3 gameframes
	repeat
	if gotparam sounds
		if (<sounds> = 1)
			soundevent event = sk9_Outof_Skater_Stop
		endif
	endif
	if (<created_temporary_element> = 1)
		if screenelementexists id = slow_and_wait_input_event
			destroyscreenelement id = slow_and_wait_input_event
		endif
	endif
endscript

script slow_to_pause_unpause 
	skatercam0 :unpause
	unpauseskaters
	restore_start_key_binding
	if gotparam uber_on_got
		ui_display_message type = uberalert text = <uber_on_got> color = bluelt
	else
		goal_ui_kill_message type = uberalert
	endif
	if gotparam instruc_on_got
		ui_display_message type = instruction text = <instruc_on_got>
	else
		goal_ui_kill_message type = instruction
	endif
	if gotparam script_on_got
		if scriptexists <script_on_got>
			<script_on_got>
		else
			printf 'Failed to find the script you specified'
		endif
	endif
endscript

script is_analogue_direction_held 
	getanalogueinfo
	if (<stick> = left)
		dirx = <leftx>
		diry = <lefty>
	elseif (<stick> = right)
		dirx = <rightx>
		diry = <righty>
	else
		printf 'direction needs to be LEFT or RIGHT'
		return 0
	endif
	threshhold = 0.5
	neg_threshhold = -0.5
	held_N = 0
	held_NE = 0
	held_E = 0
	held_SE = 0
	held_S = 0
	held_SW = 0
	held_W = 0
	held_NW = 0
	if (<diry> < <neg_threshhold>)
		held_N = 1
		held_NE = 1
		held_NW = 1
	else
		held_N = -1
		held_NE = -1
		held_NW = -1
	endif
	if (<diry> > <threshhold>)
		held_S = 1
		held_SE = 1
		held_SW = 1
	else
		held_S = -1
		held_SE = -1
		held_SW = -1
	endif
	if (<dirx> < <neg_threshhold>)
		if NOT (<held_W> = -1)
			held_W = 1
		endif
		if NOT (<held_NW> = -1)
			held_NW = 1
		endif
		if NOT (<held_SW> = -1)
			held_SW = 1
		endif
	else
		held_W = -1
		held_NW = -1
		held_SW = -1
	endif
	if (<dirx> > <threshhold>)
		if NOT (<held_E> = -1)
			held_E = 1
		endif
		if NOT (<held_NE> = -1)
			held_NE = 1
		endif
		if NOT (<held_SE> = -1)
			held_SE = 1
		endif
	else
		held_E = -1
		held_NE = -1
		held_SE = -1
	endif
	is_held = 0
	switch <direction>
		case n
		if (<held_N> = 1)
			printf 'N'
			is_held = 1
		endif
		case NE
		if (<held_NE> = 1)
			printf 'NE'
			is_held = 1
		endif
		case e
		if (<held_E> = 1)
			printf 'E'
			is_held = 1
		endif
		case SE
		if (<held_SE> = 1)
			printf 'SE'
			is_held = 1
		endif
		case s
		if (<held_S> = 1)
			printf 'S'
			is_held = 1
		endif
		case sw
		if (<held_SW> = 1)
			printf 'SW'
			is_held = 1
		endif
		case w
		if (<held_W> = 1)
			printf 'W'
			is_held = 1
		endif
		case NW
		if (<held_NW> = 1)
			printf 'NW'
			is_held = 1
		endif
	endswitch
	return is_held = <is_held>
endscript
