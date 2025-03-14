
script init_goal_manager game_mode = career
	if ($disable_goals = 1)
		return
	endif
	if ($goal_goalmanager_uninitializing = 1)
		script_assert "init goal manager called while deinit goal manager running"
		return
	endif
	if ($goals_for_gamemode_loaded = 0)
		change goals_for_gamemode_loaded = 1
		if insplitscreengame
			game_mode = freeskate2p
		endif
		switch <game_mode>
			case career
			loadpak 'pak/goal_infos/goal_infos.pak' localized no_vram
			change goals_for_career_loaded = 1
			case netlobby
			case net
			case freeskate2p
			loadpak 'pak/goal_infos/goal_infos_net.pak' no_vram
			default
			printf 'init_goal_manager - using default with gamemode = %d' d = <game_mode>
			loadpak 'pak/goal_infos/goal_infos_net.pak' no_vram
			game_mode = net
		endswitch
		pushmemprofile 'Goals script'
		gman_addgoals game_mode = <game_mode>
		popmemprofile
		switch <game_mode>
			case career
			unloadpak 'pak/goal_infos/goal_infos.pak' localized
			case netlobby
			case net
			case freeskate2p
			unloadpak 'pak/goal_infos/goal_infos_net.pak'
			default
			unloadpak 'pak/goal_infos/goal_infos_net.pak'
		endswitch
		gman_loadgoalstates
		gman_syncgoalswithcareer
		spawnscriptnow goal_wait_intializeallgoals
		if ((checksumequals a = <game_mode> b = career) && ($goal_added_first_time = 0))
			gman_savegoalstates
			change goal_added_first_time = 1
		endif
	endif
endscript

script goal_wait_intializeallgoals 
	if NOT inmultiplayergame
		begin
		printf 'goal_wait_intializeallgoals waiting for the skater to be created...'
		if iscreated skater
			printf 'goal_wait_intializeallgoals: wait done!'
			break
		endif
		wait 2 gameframes
		repeat
	endif
	if gamemodeequals is_career
		if cd
			change goal_dev_show_progress = 0
		endif
		gman_initializeallgoals exceptions = $goal_track_list
		careerfunc func = updateatoms
		begin
		wait 1 gameframe
		if NOT GMan_HasInitializingGoals
			if ($goal_batched_action = 0)
				if ($in_goal_batched_action_end = 0)
					break
				endif
			endif
		endif
		repeat
		gman_initializeallgoals
	else
		gman_initializeallgoals
	endif
	gman_setcanstartgoal 1
endscript

script deinit_goal_manager 
	printf 'deinit_goal_manager - called'
	if (($goals_for_gamemode_loaded = 1) && ($goal_goalmanager_uninitializing = 0))
		printf 'deinit_goal_manager - deiniting'
		spawnscriptnow deinit_goal_manager_catch_hang
		change goal_goalmanager_uninitializing = 1
		printf 'deinit_goal_manager - waiting for existing goal pak actions'
		GMan_UnpauseGoalStateScripts
		begin
		if GoalPakManager_GoalAction action = is_processing
			printf 'GPM is processing'
		else
			break
		endif
		wait 2 gameframes
		repeat
		printf 'deinit_goal_manager - waiting for existing goal state scripts'
		begin
		if GMan_HasUpdatingGoalStateScripts
			printf 'has updating goal state scripts'
			begin
			if GoalPakManager_GoalAction action = is_processing
				printf 'GPM is processing'
			else
				break
			endif
			wait 2 gameframes
			repeat
		else
			break
		endif
		wait 2 gameframes
		repeat
		printf 'deinit_goal_manager - deactivating all goals'
		gman_deactivateallgoals
		gman_blockuntilallgoalsdeactivated
		printf 'deinit_goal_manager - purging pending goal intros'
		begin
		if GMan_HasInitializingGoals
			GoalPakManager_GoalAction action = purge_pending
			begin
			if GoalPakManager_GoalAction action = is_processing
				printf 'GPM is processing'
			else
				break
			endif
			wait 2 gameframes
			repeat
		else
			break
		endif
		wait 2 gameframes
		repeat
		printf 'deinit_goal_manager - uninitializing all goals'
		wait 2 gameframes
		gman_uninitializeallgoals
		begin
		if gman_allgoalsuninitialized
			break
		endif
		wait 2 gameframes
		repeat
		if istrue $goals_for_career_loaded
			printf 'deinit_goal_manager - saving goal states'
			gman_savegoalstates
		endif
		printf 'deinit_goal_manager - removing all goals'
		wait 2 gameframes
		gman_removeallgoals
		printf 'deinit_goal_manager - waiting for goal_batched_action_end'
		begin
		if ($in_goal_batched_action_end = 0)
			break
		endif
		wait 2 gameframes
		repeat
		change goals_for_gamemode_loaded = 0
		change goals_for_career_loaded = 0
		change goal_goalmanager_uninitializing = 0
		killspawnedscript name = deinit_goal_manager_catch_hang
		printf 'deinit_goal_manager - finished'
	endif
endscript

script deinit_goal_manager_catch_hang 
	wait \{30
		seconds
		ignoreslomo}
	goal_debug_print_states \{ignore_state = goal_uninited}
	soft_assert \{reason = "deinit_goal_manager hanging for longer than 30 seconds"}
endscript

script goal_debug_print_states ignore_state = null
	printf '-- goal_debug_print_states'
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
					if NOT checksumequals a = <ignore_state> b = <goal_state>
						formattext textname = text "%g - %s" g = <goal> s = <goal_state> dontassertforchecksums
						printf <text>
					endif
				endif
				<i> = (<i> + 1)
				repeat <num_goals>
			endif
		endif
		<j> = (<j> + 1)
		repeat <num_types>
	else
		printf '-- goal_debug_print_states: $goals_for_gamemode_loaded = 0'
	endif
endscript

script goal_initing 
	if ($goal_debug_print = 1)
		printf 'goal_initing - %a' a = <goal_id>
	endif
	goal_historical_trigger_destroy goal_id = <goal_id>
	spawnscriptnow goal_initing_spawned params = <...>
endscript

script goal_initing_spawned 
	if ($goal_debug_print = 1)
		printf 'goal_initing_spawned - %a' a = <goal_id>
	endif
	if gman_haswongoal goal = <goal_id>
		if gman_goalissingleplay goal = <goal_id>
			scriptassert 're-initializing %g, which has been beaten and is singleplay' g = <goal_id>
		endif
	endif
	if goal_intro_paks_enabled
		GoalPakManager_Lock
		gman_getdata goal = <goal_id>
		if NOT gotparam no_uninit_only_force_priority
			no_uninit_only_force_priority = 0
		endif
		if NOT gotparam init_with_force_priority
			init_with_force_priority = 0
		endif
		gman_setdata goal = <goal_id> params = {init_with_force_priority = 0 no_uninit_only_force_priority = 0}
		if (<no_uninit_only_force_priority> = 1)
			GoalPakManager_GoalAction action = bump_intro_priority pak_info = <pak_info>
			printf 'goal_initing_spawned - GPM Priority Bumping %a' a = <goal_id>
		else
			GoalPakManager_WaitForPaks
			if NOT GoalPakManager_IsIntroInited goal_id = <goal_id>
				GoalPakManager_GoalAction action = add_intro pak_info = <pak_info>
				if ($goal_debug_print = 1)
					printf 'goal_initing_spawned - GPM Initing %a' a = <goal_id>
				endif
			endif
			if (<init_with_force_priority> = 1)
				GoalPakManager_GoalAction action = bump_intro_priority pak_info = <pak_info>
				printf 'goal_initing_spawned - GPM Priority Bumping (for a retry) %a' a = <goal_id>
			endif
			GoalPakManager_WaitForPaks
		endif
		if ($goal_batched_action = 0)
			GoalPakManager_GoalAction action = refresh_intros_unload
			GoalPakManager_WaitForPaks
			GoalPakManager_GoalAction action = refresh_intros_load
			GoalPakManager_WaitForPaks
		endif
		GoalPakManager_Unlock
		if (<no_uninit_only_force_priority> = 1)
			gman_endgoaltransition goal = <goal_id> state = goal_initing success = true
		endif
	else
		if ($debug_fake_long_transition_states = 1)
			wait 2 seconds ignoreslomo
		endif
		gman_endgoaltransition goal = <goal_id> state = goal_initing success = true
	endif
endscript

script goal_post_init 
	if ($goal_debug_print = 1)
		printf 'goal_post_init - %a' a = <goal_id>
	endif
	if goal_intro_paks_enabled
		appendsuffixtochecksum base = <goal_id> suffixstring = '_intro'
		if NOT GoalPakManager_IsLoaded goal_string = <goal_string> pak_id = <appended_id>
			softassert "goal_post_init - pak not loaded - %s" s = <goal_string>
			return
		endif
	endif
	<create_historical_for_ambient> = false
	if goal_is_ambient goal_id = <goal_id>
		if gman_haswongoal goal = <goal_id>
			<create_historical_for_ambient> = true
		endif
	endif
	if checksumequals a = <create_historical_for_ambient> b = true
		goal_historical_trigger_create goal_id = <goal_id> do_init = false
	else
		goal_setup_trigger goal_id = <goal_id>
	endif
endscript

script goal_intro_paks_enabled 
	if NOT goal_gamemode_has_goalpaks
		return \{false}
	endif
	if ($goal_disable_intro_paks = 1)
		return \{false}
	endif
	return \{true}
endscript

script goal_checkpoint_enter 
	kill_panel_message_if_it_exists id = goal_message
	if NOT istrue $goal_presentation_waiting_for_start
		restore_start_key_binding
	endif
	change goal_presentation_waiting_for_start = 0
	Ragdoll_Bail_Flash_Kill
	goal_exit_area_end
	killspawnedscript name = goal_init_after_end_of_run
	if NOT isobserving
		getskaterid
		killskatercamanim skaterid = <objid> all
		skater :runstarted
	endif
	if (((gotparam retry_last) || (gotparam retry)) && ((gotparam retry_pos) || (gotparam retry_node)))
		goal_move_skater restart_node = <retry_node> restart_pos = <retry_pos>
	elseif ((gotparam enter_restart_node) || (gotparam enter_restart_pos))
		goal_move_skater restart_node = <enter_restart_node> restart_pos = <enter_restart_pos>
	endif
	gman_getactivatedgoalid
	gman_getdata goal = <activated_goal_id>
	if gotparam hide_loading_screen
		if (<hide_loading_screen> = 1)
			hideloadingscreen
			gman_setdata goal = <goal_id> params = {hide_loading_screen = 0}
		endif
	endif
	if gotparam retry
		unpauseskaters
	else
		if inmultiplayergame
			unpauseskaters no_unhide
		else
			unpauseskaters
		endif
	endif
endscript

script goal_activating 
	requireparams [goal_id] all
	printf 'goal_activating - %a' a = <goal_id>
	change goal_trigger_dialog_accepted = 0
	change goal_is_between_retries = 0
	change goal_presentation_hold_requests = 0
	killspawnedscript name = goal_ambient_complete_callouts
	gman_getgoaltype goal = <goal_id>
	if NOT checksumequals a = <goal_type> b = arcade
		manglechecksums a = <goal_id> b = _goalTrigger
		if iscreated <mangled_id>
			<mangled_id> :hide
		endif
	endif
	if UI_User_Waypointed_Goal goal = <goal_id>
		UI_Clear_User_Goal_Waypoint
	endif
	change ui_cannot_restore_r3 = false
	goal_destroy_prompt_for_next_goal
	if NOT inmultiplayergame
		goal_photo_fine_adjust_cleanup
		<do_delete> = true
		if IsInCrib
			if goal_is_ambient goal_id = <goal_id>
				<do_delete> = false
			else
				crib_save_settings
			endif
		else
			cap_save_career_settings
		endif
		if (<do_delete> = true)
			cap_delete_all_pieces
		endif
		goal_toggle_chalk_challenge_markers goal_id = <goal_id> state = 0
		if NOT goal_is_ambient goal_id = <goal_id>
			spawnscriptnow Stop_Rain_and_FreezeWeather
		endif
	endif
	cash_collect_kill_icons
	if screenelementexists id = in_game_episode_menu_anchor
		destroyscreenelement id = in_game_episode_menu_anchor
	endif
	spawnscriptnow goal_activating_spawned params = <...>
endscript

script goal_activating_spawned 
	printf 'goal_activating_spawned - %a' a = <goal_id>
	if NOT goal_is_ambient goal_id = <goal_id>
		crib_kill_bink
	endif
	if gman_getconstant goal = <goal_id> name = pre_activate
		<pre_activate_script> = <pre_activate>
	else
		gman_getgoalstring goal = <goal_id>
		formattext checksumname = pre_activate_script '%s_pre_activate' s = <goal_string>
	endif
	if scriptexists <pre_activate_script>
		<pre_activate_script> goal_id = <goal_id>
		wait 2 gameframes
	endif
	GMan_GetPakInfo goal = <goal_id>
	if gotparam pak_info
		if goal_gamemode_has_goalpaks
			goal_load_anim_pak goal = <goal_id>
			printf 'goal_activating_spawned - Loading Pak %s' s = <goal_string> dontassertforchecksums
			GoalPakManager_WaitForPaks
			goal_wait_for_pakless_mission_unload
			GoalPakManager_Lock
			if goal_should_unload_intro pak_info = <pak_info>
				GoalPakManager_WaitForPaks
				GoalPakManager_GoalAction action = remove_intro pak_info = <pak_info>
			endif
			GoalPakManager_WaitForPaks
			GoalPakManager_GoalAction action = evict_intros_for_mission pak_info = <pak_info>
			GoalPakManager_WaitForPaks
			GoalPakManager_GoalAction action = load_mission pak_info = <pak_info>
			GoalPakManager_WaitForPaks not_nodearrays
			parsenodearray block
			GoalPakManager_WaitForPaks
			GoalPakManager_GoalAction action = refresh_intros_unload
			GoalPakManager_WaitForPaks
			GoalPakManager_GoalAction action = refresh_intros_load
			GoalPakManager_WaitForPaks
			GoalPakManager_Unlock
		endif
	endif
	if goal_gamemode_has_goalpaks
		if GoalPakManager_IsLoaded goal_string = <goal_string> pak_id = <goal_id>
			printf 'goal_activating_spawned - Loaded Pak %s' s = <goal_string> dontassertforchecksums
		else
			printf 'goal_activating_spawned - Pak %s unloaded whilst waiting for load' s = <goal_string> dontassertforchecksums
			mission_unloaded = 1
		endif
	endif
	printf 'goal_activating_spawned after activate - %a' a = <goal_id>
	if gotparam mission_unloaded
		printf 'Early out of goal_activating_spawned, the mission was unloaded whilst we were waiting for it to be loaded'
		return
	endif
	if NOT gamemodeequals is_classic
		destroy_goal_panel_messages
	endif
	killspawnedscript name = Sk_Killskater_Finish use_proper_version
	if inmultiplayergame
		GoalManager_AnnounceGoalStarted name = <goal_id>
	endif
	goal_trigger_dialog_kill goal_id = <goal_id>
	if screenelementexists id = goal_retry_anchor
		destroyscreenelement id = goal_retry_anchor
	endif
	if screenelementexists id = debug_goal_info_container
		destroyscreenelement id = debug_goal_info_container
	endif
	if globalexists name = dump_coim_on_goal_start type = integer
		if ($dump_coim_on_goal_start = 1)
			if NOT cd
				dumpcoimentries dumptofile name = <goal_id>
			endif
		endif
	endif
	hide_compass_anchor
	if ($debug_fake_long_transition_states = 1)
		wait 2 seconds ignoreslomo
	endif
	gman_endgoaltransition goal = <goal_id> state = goal_activating success = true
endscript

script goal_activated 
	printf 'goal_activated - %g' g = <goal_id>
	goal_dev_progress_create goal = <goal_id>
	goal_track_notify_goal_started goal = <goal_id>
	GMan_GetLifestyle goal = <goal_id>
	goal_ui_update_scheme lifestyle = <lifestyle>
	gman_getgoaltype goal = <goal_id>
	if checksumequals a = <goal_type> b = photo
		gman_getconstants goal = <goal_id>
		if ((gotparam cam_quat) && (gotparam cam_stand_pos) && (gotparam cam_stand_quat))
			goal_photo_place_default_camera {
				goal = <goal_id>
				cam_quat = <cam_quat>
				cam_stand_pos = <cam_stand_pos>
				cam_stand_quat = <cam_stand_quat>
				cam_zoom = <cam_zoom>
				cam_target_offset = <cam_target_offset>
				cam_target_scale = <cam_target_scale>
			}
		endif
	endif
	if gman_getconstant goal = <goal_id> name = post_activate
		<post_activate_script> = <post_activate>
	else
		gman_getgoalstring goal = <goal_id>
		formattext checksumname = post_activate_script '%s_post_activate' s = <goal_string>
	endif
	if scriptexists <post_activate_script>
		<post_activate_script> goal_id = <goal_id>
	endif
endscript

script goal_load_anim_pak 
	requireparams \{[
			goal
		]
		all}
	GMan_GetPakInfo goal = <goal>
	if gotparam \{pak_info}
		if structurecontains \{structure = pak_info
				anim_pak}
			printf "goal_load_animsaves_pak - %g - %s" g = <goal> s = (<pak_info>.anim_pak)
			loadpak (<pak_info>.anim_pak) heap = animexportcapture no_vram
		endif
	endif
endscript

script goal_unload_anim_pak 
	requireparams \{[
			goal
		]
		all}
	GMan_GetPakInfo goal = <goal>
	if gotparam \{pak_info}
		if structurecontains \{structure = pak_info
				anim_pak}
			printf "goal_unload_animsaves_pak - %g - %s" g = <goal> s = (<pak_info>.anim_pak)
			unloadpak (<pak_info>.anim_pak)
			waitunloadpak (<pak_info>.anim_pak) block
		endif
	endif
endscript

script goal_win goal_text = "GOAL"
	printf 'goal_win - %a' a = <goal_id>
	if screenelementexists id = goal_message
		runscriptonscreenelement id = goal_message kill_panel_message
	endif
	if NOT gman_haswongoal goal = <goal_id>
		if gotparam reward_trickslot
			if NOT gotparam already_added_trickslot
				gman_setdata goal = <goal_id> params = {just_added_trickslot = 1}
				GetCurrentSkaterProfileIndex
				GetSkaterProfileInfo player = <currentskaterprofileindex>
				if (<max_specials> < max_number_of_special_trickslots)
					AwardSpecialTrickslot
				endif
			endif
		endif
	endif
	set_current_leaderboard goal = <goal_id>
	if gotparam goal_success_script
		<goal_success_script> <goal_success_params>
	endif
	if goal_is_ambient goal_id = <goal_id>
		if gman_getconstant goal = <goal_id> name = start_zone
			if NOT checksumequals a = <start_zone> b = z_crib
				spawnscriptnow goal_ambient_complete_callouts
			endif
		endif
	endif
	broadcastevent type = goal_won
endscript

script goal_rewards 
	crib_kill_bink
	if gotparam give_rewards
		<give_rewards> = 1
	endif
	gman_getdata goal = <goal_id>
	<show_success_messages> = 1
	if gotparam no_success_messages
		<show_success_messages> = 0
	endif
	if gotparam goal_no_end_messages_during_retry
		if (<goal_no_end_messages_during_retry> = 1)
			<show_success_messages> = 0
			gman_setdata goal = <goal_id> params = {goal_no_end_messages_during_retry = 0}
		endif
	endif
	gman_getgoaltype goal = <goal_id>
	if checksumequals a = <goal_type> b = track_man
		<show_success_messages> = 0
	endif
	if (<show_success_messages> = 1)
		spawnscriptlater {
			goal_success_messages
			params = {
				goal_id = <goal_id>
				goal_rewards = <goal_rewards>
				give_rewards = <give_rewards>
			}
		}
	else
		spawnscriptnow {
			goal_ambient_success_messages
			params = {
				goal_id = <goal_id>
				goal_rewards = <goal_rewards>
				give_rewards = <give_rewards>
			}
		}
		gman_endgoaltransition goal = <goal_id> state = goal_rewards success = true
		if NOT goal_is_permanent goal_id = <goal_id>
			spawnscriptnow goal_deactivated params = {goal_id = <goal_id>}
		endif
	endif
endscript

script goal_give_rewards 
	if structurecontains structure = <goal_rewards> rigger_piece
		game_progression_give_skill skill = (<goal_rewards>.rigger_piece)
	endif
	if structurecontains structure = <goal_rewards> crib_piece
		game_progression_give_skill skill = (<goal_rewards>.crib_piece)
	endif
	if structurecontains structure = <goal_rewards> skill
		game_progression_give_skill skill = (<goal_rewards>.skill)
	endif
	if structurecontains structure = <goal_rewards> cas_parts
		getarraysize (<goal_rewards>.cas_parts)
		if (<array_size> > 0)
			<i> = 0
			begin
			<part> = (<goal_rewards>.cas_parts [<i>])
			setglobalflag flag = (<part>.flag)
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if structurecontains structure = <goal_rewards> special
		careerfunc func = setspecialtricklocked params = {trick_id = ((<goal_rewards>.special).trick) locked = false}
		edit_tricks_menu_bind_trick new_key_combo = ((<goal_rewards>.special).key_combo) new_trick = ((<goal_rewards>.special).trick) index = ((<goal_rewards>.special).index) special
	endif
endscript

script goal_lose 
	printf 'goal_lose - %a' a = <goal_id>
	set_current_leaderboard goal = <goal_id>
	if gotparam goal_fail_script
		<goal_fail_script> <goal_fail_params>
	endif
	gman_getdata goal = <goal_id>
	<show_fail_message> = 1
	if gotparam goal_no_end_messages_during_retry
		if (<goal_no_end_messages_during_retry> = 1)
			<show_fail_message> = 0
		endif
	endif
	if gotparam no_fail_messages
		<show_fail_message> = 0
	endif
	if (<show_fail_message> = 1)
		spawnscriptlater goal_fail_messages params = {<...>}
	endif
	goal_track_notify_goal_lost goal_id = <goal_id>
endscript

script goal_checkpoint_exit 
	goal_exit_area_end
	goal_hud_destroy
	if GoalManager_EndRunCalled name = <goal_id>
		if GoalManager_StartedEndOfRun name = <goal_id>
			SpawnSkaterScript goal_init_after_end_of_run params = {goal_id = <goal_id>}
		else
			GoalManager_ClearEndRun name = <goal_id>
		endif
	endif
	if ((gotparam exit_restart_node) || (gotparam exit_restart_pos))
		goal_move_skater restart_node = <exit_restart_node> restart_pos = <exit_restart_pos>
	endif
endscript

script goal_deactivating 
	printf 'goal_deactivating - %a' a = <goal_id>
	destroy_goal_panel_messages
	goal_dev_progress_destroy
	if gman_getconstant goal = <goal_id> name = pre_deactivate
		<pre_deactivate_script> = <pre_deactivate>
	else
		formattext checksumname = pre_deactivate_script '%s_pre_deactivate' s = <goal_string>
	endif
	if scriptexists <pre_deactivate_script>
		<pre_deactivate_script> goal_id = <goal_id>
	endif
	killtexturesplats all
	preallocsplats
	goal_hud_destroy
	killspawnedscript name = goal_spawned_safe_pass_checkpoint
	killspawnedscript name = goal_spawned_safe_fail_checkpoint
	spawnscriptnow goal_track_notify_goal_ended params = {goal = <goal_id>}
	spawnscriptnow goal_deactivating_spawned params = <...>
endscript

script goal_deactivating_spawned 
	if gamemodeequals is_career
		careerfunc func = enableatomupdate params = {enable = true}
	endif
	net_view_goals_create_searching_text text = "Loading..." scale = 0.75 parent = root_window
	GMan_GetPakInfo goal = <goal_id>
	if gotparam pak_info
		if goal_gamemode_has_goalpaks
			goal_unload_anim_pak goal = <goal_id>
			printf 'goal_deactivating_spawned - Unloading Pak %s' s = <goal_string> dontassertforchecksums
			GoalPakManager_WaitForPaks
			goal_wait_for_pakless_mission_load
			GoalPakManager_Lock
			GoalPakManager_WaitForPaks
			GoalPakManager_GoalAction action = unload_mission pak_info = <pak_info>
			GoalPakManager_WaitForPaks
			reload_intro = 0
			if (<goal_beaten> = 0)
				if goal_should_unload_intro pak_info = <pak_info>
					GoalPakManager_GoalAction action = add_intro pak_info = <pak_info>
					GoalPakManager_WaitForPaks
				endif
			else
			endif
			GoalPakManager_GoalAction action = refresh_intros_unload
			GoalPakManager_WaitForPaks
			GoalPakManager_GoalAction action = refresh_intros_load
			GoalPakManager_WaitForPaks
			GoalPakManager_Unlock
			printf 'goal_deactivating_spawned - Unloaded Pak %s' s = <goal_string> dontassertforchecksums
		endif
	endif
	if ($debug_fake_long_transition_states = 1)
		wait 2 seconds ignoreslomo
	endif
	if screenelementexists id = net_view_goals_searching_cont
		runscriptonscreenelement id = net_view_goals_searching_cont net_view_goals_searching_fade_out_and_die
	endif
	gman_endgoaltransition goal = <goal_id> state = goal_deactivating success = true
	<run_deactivated> = false
	if NOT GMan_HasWonGoalThisTry goal = <goal_id>
		<run_deactivated> = true
	endif
	if goal_is_permanent goal_id = <goal_id>
		<run_deactivated> = true
	endif
	if (<run_deactivated> = true)
		goal_deactivated goal_id = <goal_id>
	endif
endscript

script goal_deactivated 
	if gman_getconstant goal = <goal_id> name = post_deactivate
		<post_deactivate_script> = <post_deactivate>
	else
		gman_getgoalstring goal = <goal_id>
		formattext checksumname = post_deactivate_script '%s_post_deactivate' s = <goal_string>
	endif
	if scriptexists <post_deactivate_script>
		wait 2 gameframes
		<post_deactivate_script> goal_id = <goal_id>
	endif
	change goal_film_showing_options = false
	if (($goal_goalmanager_uninitializing = 0) && (gman_goalexists goal = <goal_id>))
		gman_getgoaltype goal = <goal_id>
		if checksumequals a = <goal_type> b = photo
			goal_photo_remove_default_camera goal = <goal_id>
		endif
		if NOT inmultiplayergame
			if NOT goal_is_ambient goal_id = <goal_id>
				UnFreezeWeather
			endif
			goal_toggle_chalk_challenge_markers goal_id = <goal_id> state = 1
		endif
		cash_collect_restore_icons
		if NOT inmultiplayergame
			<do_restore> = true
			if IsInCrib
				if goal_is_ambient goal_id = <goal_id>
					<do_restore> = false
				else
					<context> = rigger_crib
				endif
			else
				<context> = rigger_career
			endif
			if (<do_restore> = true)
				if CAP_LoadRiggerSetup <context>
					cap_restore_pieces_from_array array = (<setup>.pieces)
				endif
			endif
		endif
		if goal_should_uninit goal_id = <goal_id>
			if NOT gman_getdata goal = <goal_id> name = retry_last
				gman_uninitializegoal goal = <goal_id>
			endif
		else
			<create_historical_trigger> = false
			if gman_haswongoal goal = <goal_id>
				if goal_is_ambient goal_id = <goal_id>
					<create_historical_trigger> = true
				endif
			endif
			if (<create_historical_trigger> = true)
				goal_historical_trigger_create goal_id = <goal_id> do_init = false
			else
				manglechecksums a = <goal_id> b = _goalTrigger
				if iscreated <mangled_id>
					<mangled_id> :unhide
				endif
			endif
		endif
	endif
endscript

script goal_end_rewards autosave = 0
	requireparams [goal_id] all
	printf 'goal_end_rewards - %g' g = <goal_id>
	<hardcore_uber_cut_hack> = 0
	if checksumequals a = <goal_id> b = m_hu
		if GMan_HasWonGoalThisTry goal = <goal_id>
			if NOT gman_haswongoal goal = m_hu_outro
				<hardcore_uber_cut_hack> = 1
				<autosave> = 0
				careerfunc func = enableatomupdate params = {enable = false}
			endif
		endif
	endif
	if ($goal_save_extra_data = 1)
		autosave = 1
		change goal_success_wants_autosave = <goal_id>
	endif
	if (<autosave> = 1)
		spawnscriptnow goal_display_success_messages_autosave params = {goal = <goal_id>}
	endif
	gman_getgoaltype goal = <goal_id>
	switch <goal_type>
		case hawkman
		case high_score_run
		case classic
		goal_arcade_restore_career_skater
	endswitch
	goal_ui_update_scheme lifestyle = none
	show_compass_anchor
	spawnscriptlater crib_update_av params = {force_bink_on}
	if getglobalflag flag = $CAREER_TRAINING_DONE
		if GMan_HasWonGoalThisTry goal = <goal_id>
			if gman_getconstant goal = <goal_id> name = track
				goal_track_prompt_for_next_goal track = <track>
			elseif GMan_GetTrackInfo goal = <goal_id> name = track
				goal_track_prompt_for_next_goal track = <track>
			else
				GMan_GetGoalAttemptData goal = <goal_id>
				if (<times_won> <= 1)
					gman_getgoaltype goal = <goal_id>
					switch <goal_type>
						case chalk
						case classic
						case film
						case hawkman
						case photo
						case race
						case turf
						spawnscriptnow ui_show_milestone_progress_after_street_goal params = {no_wait}
						default
					endswitch
				endif
			endif
		endif
		UI_Show_Goal_Waypoint_If_Set
	endif
	if (<hardcore_uber_cut_hack> = 1)
		spawnscriptlater goal_start_hu_outro
	endif
endscript

script goal_start_hu_outro 
	wait \{1
		gameframe}
	change \{goal_startup_goal = m_hu_outro}
	spawnscriptlater \{change_level
		params = {
			level = load_z_crib
		}}
endscript

script goal_uninit_from_eviction 
	printf 'goal_uninit_from_eviction - %a' a = <goal_id>
	GoalPakManager_WaitForPaks
	if NOT goal_should_uninit goal_id = <goal_id>
		gman_setdata goal = <goal_id> params = {do_unload = 0}
	endif
	gman_uninitializegoal goal = <goal_id>
	GoalPakManager_WaitForPaks
	goal_historical_trigger_create goal_id = <goal_id>
	printf 'goal_uninit_from_eviction done - %a' a = <goal_id>
endscript

script goal_uniniting do_unload = 1
	printf 'goal_uniniting - %a' a = <goal_id>
	gman_getdata goal = <goal_id>
	if gotparam goal_ped_marker
		if objectexists id = <goal_ped_marker>
			<goal_ped_marker> :die
		endif
	endif
	goal_viewport_kill all
	gman_getgoaltype goal = <goal_id>
	if checksumequals a = <goal_type> b = arcade
		if gman_getconstant goal = <goal_id> name = arcade_machine_id
			if iscreated <arcade_machine_id>
				kill name = <arcade_machine_id>
			endif
		endif
	endif
	if (<do_unload> = 1)
		spawnscriptnow goal_uniniting_spawned params = <...>
	else
		gman_setdata goal = <goal_id> params = {do_unload = 1}
		<create_historical_trigger> = 1
		if gotparam dont_create_historical_trigger
			if (<dont_create_historical_trigger> = 1)
				<create_historical_trigger> = 0
			endif
		endif
		if (<create_historical_trigger> = 1)
			goal_historical_trigger_create goal_id = <goal_id>
		else
			gman_setdata goal = <goal_id> params = {dont_create_historical_trigger = 0}
		endif
		gman_endgoaltransition goal = <goal_id> state = goal_uniniting success = true
	endif
endscript

script goal_uniniting_spawned 
	printf 'goal_uniniting_spawned - %a' a = <goal_id>
	GMan_GetPakInfo goal = <goal_id>
	if gotparam pak_info
		if goal_gamemode_has_goalpaks
			GoalPakManager_Lock
			GoalPakManager_GoalAction action = remove_intro pak_info = <pak_info>
			if ($goal_batched_action = 0)
				GoalPakManager_WaitForPaks
				GoalPakManager_GoalAction action = refresh_intros_unload
				GoalPakManager_WaitForPaks
				GoalPakManager_GoalAction action = refresh_intros_load
				GoalPakManager_WaitForPaks
			endif
			GoalPakManager_Unlock
		endif
	endif
	manglechecksums a = <goal_id> b = _goalTrigger
	if iscreated <mangled_id>
		<mangled_id> :die
	endif
	if ($debug_fake_long_transition_states = 1)
		wait 2 seconds ignoreslomo
	endif
	gman_endgoaltransition goal = <goal_id> state = goal_uniniting success = true
	gman_getdata goal = <goal_id>
	<create_historical_trigger> = 1
	if gotparam dont_create_historical_trigger
		if (<dont_create_historical_trigger> = 1)
			<create_historical_trigger> = 0
		endif
	endif
	if (<create_historical_trigger> = 1)
		goal_historical_trigger_create goal_id = <goal_id>
	else
		gman_setdata goal = <goal_id> params = {dont_create_historical_trigger = 0}
	endif
endscript

script goal_uninitall_uninit 
	printf 'goal_uninitall_uninit - %s' s = <goal_id>
	GMan_GetPakInfo goal = <goal_id>
	GoalPakManager_GoalAction action = remove_intro pak_info = <pak_info>
endscript

script goal_gamemode_has_goalpaks 
	if NOT inmultiplayergame
		if gamemodeequals \{is_career}
			return \{true}
		endif
	endif
	return \{false}
endscript
