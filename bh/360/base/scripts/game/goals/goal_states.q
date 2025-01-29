
script init_goal_manager \{game_mode = career}
	if ($disable_goals = 1)
		return
	endif
	if ($goal_goalmanager_uninitializing = 1)
		script_assert \{qs(0x6d0e6636)}
		return
	endif
	if ($goals_for_gamemode_loaded = 0)
		Change \{goals_for_gamemode_loaded = 1}
		LoadPak \{'pak/goal_infos.pak'
			localized
			no_vram}
		Change \{goals_for_career_loaded = 1}
		PushMemProfile \{'Goals script'}
		GMan_AddGoals game_mode = <game_mode>
		PopMemProfile
		UnLoadPak \{'pak/goal_infos.pak'
			localized}
		GMan_LoadGoalStates
		GMan_SyncGoalsWithCareer
		spawnscriptnow \{goal_wait_intializeallgoals}
		if ((checksumequals a = <game_mode> b = career) && ($goal_added_first_time = 0))
			GMan_SaveGoalStates
			Change \{goal_added_first_time = 1}
		endif
	endif
endscript

script goal_wait_intializeallgoals 
	GMan_InitializeAllGoals
	GMan_SetCanStartGoal \{1}
endscript

script deinit_goal_manager 
	printf \{'deinit_goal_manager - called'}
	if (($goals_for_gamemode_loaded = 1) && ($goal_goalmanager_uninitializing = 0))
		printf \{'deinit_goal_manager - deiniting'}
		spawnscriptnow \{deinit_goal_manager_catch_hang}
		Change \{goal_goalmanager_uninitializing = 1}
		printf \{'deinit_goal_manager - deactivating all goals'}
		GMan_DeactivateAllGoals
		GMan_BlockUntilAllGoalsDeactivated
		printf \{'deinit_goal_manager - uninitializing all goals'}
		wait \{2
			gameframes}
		GMan_UninitializeAllGoals
		begin
		if GMan_AllGoalsUninitialized
			break
		endif
		wait \{2
			gameframes}
		repeat
		if IsTrue \{$goals_for_career_loaded}
			printf \{'deinit_goal_manager - saving goal states'}
			GMan_SaveGoalStates
		endif
		printf \{'deinit_goal_manager - removing all goals'}
		wait \{2
			gameframes}
		GMan_RemoveAllGoals
		if ExistsPakManMap \{map = missions}
			SetPakManCurrentBlock \{map = missions
				pak = None
				block_scripts = 1}
			DestroyPakManMap \{map = missions}
		endif
		Change \{goals_for_gamemode_loaded = 0}
		Change \{goals_for_career_loaded = 0}
		Change \{goal_goalmanager_uninitializing = 0}
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
		GetArraySize ($goal_types)
		<num_types> = <array_size>
		<j> = 0
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
					if NOT checksumequals a = <ignore_state> b = <goal_state>
						FormatText TextName = text qs(0x351ed798) g = <goal> s = <goal_state>
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
	if GMan_HasWonGoal goal = <goal_id>
		if GMan_GoalIsSingleplay goal = <goal_id>
			ScriptAssert 're-initializing %g, which has been beaten and is singleplay' g = <goal_id>
		endif
	endif
	GMan_EndGoalTransition goal = <goal_id> state = goal_initing success = true
endscript

script goal_post_init 
	if ($goal_debug_print = 1)
		printf 'goal_post_init - %a' a = <goal_id>
	endif
endscript

script goal_activating 
	RequireParams \{[
			goal_id
		]
		all}
	printf 'goal_activating - %a' a = <goal_id>
	Change \{goal_is_between_retries = 0}
	Change \{goal_presentation_hold_requests = 0}
	spawnscriptnow goal_activating_spawned params = <...>
endscript

script goal_activating_spawned 
	printf 'goal_activating_spawned - %a' a = <goal_id>
	if GMan_GetConstant goal = <goal_id> name = pre_activate
		<pre_activate_script> = <pre_activate>
	else
		GMan_GetGoalString goal = <goal_id>
		FormatText checksumname = pre_activate_script '%s_pre_activate' s = <goal_string>
	endif
	if ScriptExists <pre_activate_script>
		<pre_activate_script> goal_id = <goal_id>
	endif
	if ScreenElementExists \{id = goal_retry_anchor}
		DestroyScreenElement \{id = goal_retry_anchor}
	endif
	if ScreenElementExists \{id = debug_goal_info_container}
		DestroyScreenElement \{id = debug_goal_info_container}
	endif
	if GMan_GetConstant goal = <goal_id> name = has_pak
		if (<has_pak> = true)
			PushMemProfile \{'Mission Heap'}
			MemPushContext \{mission}
			SetPakManCurrentBlock map = missions pak = <goal_id> block_scripts = 1
			MemPopContext
			PopMemProfile
		endif
	endif
	GMan_EndGoalTransition goal = <goal_id> state = goal_activating success = true
endscript

script goal_activated 
	printf 'goal_activated - %g' g = <goal_id>
	if GMan_GetConstant goal = <goal_id> name = post_activate
		<post_activate_script> = <post_activate>
	else
		GMan_GetGoalString goal = <goal_id>
		FormatText checksumname = post_activate_script '%s_post_activate' s = <goal_string>
	endif
	if ScriptExists <post_activate_script>
		<post_activate_script> goal_id = <goal_id>
	endif
endscript

script goal_checkpoint_enter 
endscript

script goal_checkpoint_exit 
	if ((GotParam exit_restart_node) || (GotParam exit_restart_pos))
		goal_move_player restart_node = <exit_restart_node> restart_pos = <exit_restart_pos>
	endif
endscript

script goal_win \{goal_text = qs(0x38ef6c8a)}
	printf 'goal_win - %a' a = <goal_id>
	if ScreenElementExists \{id = goal_message}
		RunScriptOnScreenElement \{id = goal_message
			kill_panel_message}
	endif
	broadcastevent \{type = goal_won}
endscript

script goal_result 
	printf \{'goal_result'}
	switch <result_this_try>
		case Win
		ui_display_message \{type = uberalert
			text = qs(0xa7275d94)
			Color = green
			has_background}
		case lose
		ui_display_message \{type = uberalert
			text = qs(0x820c24e9)
			Color = red
			has_background}
		default
		ui_display_message \{type = uberalert
			text = qs(0x994a16dc)
			Color = red
			has_background}
	endswitch
	GMan_EndGoalTransition goal = <goal_id> state = goal_result success = true
endscript

script goal_give_rewards 
	if StructureContains structure = <career_rewards> rigger_piece
		game_progression_give_skill skill = (<career_rewards>.rigger_piece)
	endif
	if StructureContains structure = <career_rewards> crib_piece
		game_progression_give_skill skill = (<career_rewards>.crib_piece)
	endif
	if StructureContains structure = <career_rewards> skill
		game_progression_give_skill skill = (<career_rewards>.skill)
	endif
endscript

script goal_lose 
	printf 'goal_lose - %a' a = <goal_id>
endscript

script goal_deactivating 
	printf 'goal_deactivating - %a' a = <goal_id>
	killspawnedscript \{name = power_utils_power_pickup_wait_spawn_next}
	if GMan_GetConstant goal = <goal_id> name = pre_deactivate
		<pre_deactivate_script> = <pre_deactivate>
	else
		FormatText checksumname = pre_deactivate_script '%s_pre_deactivate' s = <goal_string>
	endif
	if ScriptExists <pre_deactivate_script>
		<pre_deactivate_script> goal_id = <goal_id>
	endif
	KillTextureSplats \{all}
	killspawnedscript \{name = goal_spawned_safe_pass_checkpoint}
	killspawnedscript \{name = goal_spawned_safe_fail_checkpoint}
	spawnscriptnow goal_deactivating_spawned params = <...>
endscript

script goal_deactivating_spawned 
	if GotParam \{cleanup_objects}
		goal_deactivating_cleanup_objects cleanup_objects = <cleanup_objects>
	endif
	if GMan_GetConstant goal = <goal_id> name = has_pak
		if (<has_pak> = true)
			wait \{1
				gameframe}
			SetPakManCurrentBlock \{map = missions
				pak = None
				block_scripts = 1}
		endif
	endif
	GMan_EndGoalTransition goal = <goal_id> state = goal_deactivating success = true
endscript

script goal_deactivating_cleanup_objects 
	GetArraySize <cleanup_objects>
	<index> = 0
	begin
	if IsCreated (<cleanup_objects> [<index>])
		if CompositeObjectExists name = (<cleanup_objects> [<index>])
			(<cleanup_objects> [<index>]) :Die
		else
			kill name = (<cleanup_objects> [<index>])
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script goal_deactivated 
	if GMan_GetConstant goal = <goal_id> name = post_deactivate
		<post_deactivate_script> = <post_deactivate>
	else
		GMan_GetGoalString goal = <goal_id>
		FormatText checksumname = post_deactivate_script '%s_post_deactivate' s = <goal_string>
	endif
	if ScriptExists <post_deactivate_script>
		<post_deactivate_script> goal_id = <goal_id>
	endif
endscript

script goal_result_exit 
	RequireParams \{[
			goal_id
			result_this_try
		]
		all}
	printf 'goal_result_exit - %g' g = <goal_id>
	if checksumequals a = <result_this_try> b = Win
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
	GMan_GetData goal = <goal_id>
	if GotParam \{goal_ped_marker}
		if ObjectExists id = <goal_ped_marker>
			<goal_ped_marker> :Die
		endif
	endif
	spawnscriptnow goal_uniniting_spawned params = <...>
endscript

script goal_uniniting_spawned 
	printf 'goal_uniniting_spawned - %a' a = <goal_id>
	GMan_EndGoalTransition goal = <goal_id> state = goal_uniniting success = true
endscript
