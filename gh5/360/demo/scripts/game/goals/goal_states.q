
script init_goal_manager \{game_mode = career}
	if ($disable_goals = 1)
		return
	endif
	if ($goal_goalmanager_uninitializing = 1)
		script_assert \{qs(0x6d0e6636)}
		return
	endif
	if ($goals_for_gamemode_loaded = 0)
		change \{goals_for_gamemode_loaded = 1}
		loadpak \{'pak/goal_infos.pak'
			localized
			no_vram}
		change \{goals_for_career_loaded = 1}
		pushmemprofile \{'Goals script'}
		gman_addgoals game_mode = <game_mode>
		popmemprofile
		unloadpak \{'pak/goal_infos.pak'
			localized}
		gman_loadgoalstates
		gman_syncgoalswithcareer
		spawnscriptnow \{goal_wait_intializeallgoals}
		if ((checksumequals a = <game_mode> b = career) && ($goal_added_first_time = 0))
			gman_savegoalstates
			change \{goal_added_first_time = 1}
		endif
	endif
endscript

script goal_wait_intializeallgoals 
	gman_initializeallgoals
	gman_setcanstartgoal \{1}
endscript

script deinit_goal_manager 
	printf \{'deinit_goal_manager - called'}
	if (($goals_for_gamemode_loaded = 1) && ($goal_goalmanager_uninitializing = 0))
		printf \{'deinit_goal_manager - deiniting'}
		spawnscriptnow \{deinit_goal_manager_catch_hang}
		change \{goal_goalmanager_uninitializing = 1}
		printf \{'deinit_goal_manager - deactivating all goals'}
		gman_deactivateallgoals
		gman_blockuntilallgoalsdeactivated
		printf \{'deinit_goal_manager - uninitializing all goals'}
		wait \{2
			gameframes}
		gman_uninitializeallgoals
		begin
		if gman_allgoalsuninitialized
			break
		endif
		wait \{2
			gameframes}
		repeat
		if istrue \{$goals_for_career_loaded}
			printf \{'deinit_goal_manager - saving goal states'}
			gman_savegoalstates
		endif
		printf \{'deinit_goal_manager - removing all goals'}
		wait \{2
			gameframes}
		gman_removeallgoals
		if existspakmanmap \{map = missions}
			setpakmancurrentblock \{map = missions
				pak = none
				block_scripts = 1}
			destroypakmanmap \{map = missions}
		endif
		change \{goals_for_gamemode_loaded = 0}
		change \{goals_for_career_loaded = 0}
		change \{goal_goalmanager_uninitializing = 0}
		killspawnedscript \{name = deinit_goal_manager_catch_hang}
		printf \{'deinit_goal_manager - finished'}
	endif
endscript

script deinit_goal_manager_catch_hang 
	wait \{30
		seconds
		ignoreslomo}
	goal_debug_print_states \{ignore_state = goal_uninited}
	softassert \{reason = qs(0xa9f56ac5)}
endscript

script goal_debug_print_states \{ignore_state = null}
	printf \{'-- goal_debug_print_states'}
	if ($goals_for_gamemode_loaded = 1)
		getarraysize ($goal_types)
		<num_types> = <array_size>
		<j> = 0
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
					if NOT checksumequals a = <ignore_state> b = <goal_state>
						formattext textname = text qs(0x351ed798) g = <goal> s = <goal_state>
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
		printf \{'-- goal_debug_print_states: $goals_for_gamemode_loaded = 0'}
	endif
endscript

script goal_initing 
	if ($goal_debug_print = 1)
		printf 'goal_initing - %a' a = <goal_id>
	endif
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
	gman_endgoaltransition goal = <goal_id> state = goal_initing success = true
endscript

script goal_post_init 
	if ($goal_debug_print = 1)
		printf 'goal_post_init - %a' a = <goal_id>
	endif
endscript

script goal_activating 
	requireparams \{[
			goal_id
		]
		all}
	printf 'goal_activating - %a' a = <goal_id>
	change \{goal_is_between_retries = 0}
	change \{goal_presentation_hold_requests = 0}
	spawnscriptnow goal_activating_spawned params = <...>
endscript

script goal_activating_spawned 
	printf 'goal_activating_spawned - %a' a = <goal_id>
	if gman_getconstant goal = <goal_id> name = pre_activate
		<pre_activate_script> = <pre_activate>
	else
		gman_getgoalstring goal = <goal_id>
		formattext checksumname = pre_activate_script '%s_pre_activate' s = <goal_string>
	endif
	if scriptexists <pre_activate_script>
		<pre_activate_script> goal_id = <goal_id>
	endif
	if screenelementexists \{id = goal_retry_anchor}
		destroyscreenelement \{id = goal_retry_anchor}
	endif
	if screenelementexists \{id = debug_goal_info_container}
		destroyscreenelement \{id = debug_goal_info_container}
	endif
	if gman_getconstant goal = <goal_id> name = has_pak
		if (<has_pak> = true)
			pushmemprofile \{'Mission Heap'}
			mempushcontext \{mission}
			setpakmancurrentblock map = missions pak = <goal_id> block_scripts = 1
			mempopcontext
			popmemprofile
		endif
	endif
	gman_endgoaltransition goal = <goal_id> state = goal_activating success = true
endscript

script goal_activated 
	printf 'goal_activated - %g' g = <goal_id>
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

script goal_checkpoint_enter 
endscript

script goal_checkpoint_exit 
	if ((gotparam exit_restart_node) || (gotparam exit_restart_pos))
		goal_move_player restart_node = <exit_restart_node> restart_pos = <exit_restart_pos>
	endif
endscript

script goal_win \{goal_text = qs(0x38ef6c8a)}
	printf 'goal_win - %a' a = <goal_id>
	if screenelementexists \{id = goal_message}
		runscriptonscreenelement \{id = goal_message
			kill_panel_message}
	endif
	broadcastevent \{type = goal_won}
endscript

script goal_result 
	printf \{'goal_result'}
	switch <result_this_try>
		case win
		ui_display_message \{type = uberalert
			text = qs(0xa7275d94)
			color = green
			has_background}
		case lose
		ui_display_message \{type = uberalert
			text = qs(0x820c24e9)
			color = red
			has_background}
		default
		ui_display_message \{type = uberalert
			text = qs(0x994a16dc)
			color = red
			has_background}
	endswitch
	gman_endgoaltransition goal = <goal_id> state = goal_result success = true
endscript

script goal_give_rewards 
	if structurecontains structure = <career_rewards> rigger_piece
		game_progression_give_skill skill = (<career_rewards>.rigger_piece)
	endif
	if structurecontains structure = <career_rewards> crib_piece
		game_progression_give_skill skill = (<career_rewards>.crib_piece)
	endif
	if structurecontains structure = <career_rewards> skill
		game_progression_give_skill skill = (<career_rewards>.skill)
	endif
endscript

script goal_lose 
	printf 'goal_lose - %a' a = <goal_id>
endscript

script goal_deactivating 
	printf 'goal_deactivating - %a' a = <goal_id>
	killspawnedscript \{name = power_utils_power_pickup_wait_spawn_next}
	if gman_getconstant goal = <goal_id> name = pre_deactivate
		<pre_deactivate_script> = <pre_deactivate>
	else
		formattext checksumname = pre_deactivate_script '%s_pre_deactivate' s = <goal_string>
	endif
	if scriptexists <pre_deactivate_script>
		<pre_deactivate_script> goal_id = <goal_id>
	endif
	killtexturesplats \{all}
	killspawnedscript \{name = goal_spawned_safe_pass_checkpoint}
	killspawnedscript \{name = goal_spawned_safe_fail_checkpoint}
	spawnscriptnow goal_deactivating_spawned params = <...>
endscript

script goal_deactivating_spawned 
	if gotparam \{cleanup_objects}
		goal_deactivating_cleanup_objects cleanup_objects = <cleanup_objects>
	endif
	if gman_getconstant goal = <goal_id> name = has_pak
		if (<has_pak> = true)
			wait \{1
				gameframe}
			setpakmancurrentblock \{map = missions
				pak = none
				block_scripts = 1}
		endif
	endif
	gman_endgoaltransition goal = <goal_id> state = goal_deactivating success = true
endscript

script goal_deactivating_cleanup_objects 
	getarraysize <cleanup_objects>
	<index> = 0
	begin
	if iscreated (<cleanup_objects> [<index>])
		if compositeobjectexists name = (<cleanup_objects> [<index>])
			(<cleanup_objects> [<index>]) :die
		else
			kill name = (<cleanup_objects> [<index>])
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script goal_deactivated 
	if gman_getconstant goal = <goal_id> name = post_deactivate
		<post_deactivate_script> = <post_deactivate>
	else
		gman_getgoalstring goal = <goal_id>
		formattext checksumname = post_deactivate_script '%s_post_deactivate' s = <goal_string>
	endif
	if scriptexists <post_deactivate_script>
		<post_deactivate_script> goal_id = <goal_id>
	endif
endscript

script goal_result_exit 
	requireparams \{[
			goal_id
			result_this_try
		]
		all}
	printf 'goal_result_exit - %g' g = <goal_id>
	if checksumequals a = <result_this_try> b = win
		<autosave> = 1
	else
		<autosave> = 0
	endif
	if (<autosave> = 1)
	endif
	goal_deactivated goal_id = <goal_id>
endscript

script goal_uniniting 
	printf 'goal_uniniting - %a' a = <goal_id>
	gman_getdata goal = <goal_id>
	if gotparam \{goal_ped_marker}
		if objectexists id = <goal_ped_marker>
			<goal_ped_marker> :die
		endif
	endif
	spawnscriptnow goal_uniniting_spawned params = <...>
endscript

script goal_uniniting_spawned 
	printf 'goal_uniniting_spawned - %a' a = <goal_id>
	gman_endgoaltransition goal = <goal_id> state = goal_uniniting success = true
endscript
