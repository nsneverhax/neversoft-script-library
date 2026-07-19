transitions_locked = 0
target_menu_camera = 'null'
current_menu_camera = 'null'
target_menu_camera_back = 0
menu_camera_finished = 0

script menu_start_transition 
endscript

script menu_complete_transition 
endscript

script menu_transition_stop_rendering 
	stoprendering \{reason = menu_transition}
endscript

script menu_transition_start_rendering 
	if ($rendering_has_been_stopped_menu_transition = true)
		hide_glitch
		startrendering \{reason = menu_transition}
	endif
endscript

script menu_transition_hide_glitch 
	hide_glitch
endscript

script menu_camera_control_script 
	change \{current_menu_camera = 'none'}
	begin
	if NOT ($current_menu_camera = $target_menu_camera)
		change \{menu_camera_finished = 0}
		FormatText checksumname = camera_name 'ui_%s_camera' s = ($target_menu_camera)
		FormatText checksumname = last_camera_name 'ui_%s_camera' s = ($current_menu_camera)
		GetMenuTransitionTime <...>
		if NOT (($cas_override_camera_time) < 0)
			new_time = ($cas_override_camera_time)
		else
			RemoveParameter \{new_time}
		endif
		if NOT (<time> = 0)
			spawnscriptnow ApplyMenuTransitionDOF params = {<...> use_transitiondof = 1}
		endif
		menucontrolscript = menu_camera_control_standard
		if GlobalExists name = <camera_name>
			if StructureContains Structure = ($<camera_name>) controlscript
				ExtendCRC ($<camera_name>.controlscript) '_MenuTransition' out = newcontrolscript
				if ScriptExists <newcontrolscript>
					menucontrolscript = <newcontrolscript>
				endif
			endif
		endif
		<menucontrolscript> {
			($default_camera_transition_params)
			time = <time>
			($<camera_name>.params)
			time = <new_time>
		}
		if NOT (<time> = 0)
			CCam_WaitMorph
		endif
		spawnscriptnow ApplyMenuTransitionDOF params = {<...>}
		change current_menu_camera = ($target_menu_camera)
	endif
	change \{menu_camera_finished = 1}
	Wait \{1
		gameframe}
	repeat
endscript

script menu_camera_control_standard 
	CCam_EnableHandcam \{ShakeEnabled = false
		DriftEnabled = false}
	CCam_DoMorph {
		<...>
	}
endscript

script CameraCuts_HandCam_MenuTransition \{name = none}
	CCam_DoMorph
	zooming = false
	if GotParam \{type}
		if (<type> = longshot)
			GetRandomValue \{name = random_value
				Integer
				a = 0
				b = 100}
			if (<random_value> < 25)
				CCam_DoMorph <...> FOV = 62 time = <camera_time>
				zooming = true
			endif
			if (<random_value> > 95)
				CCam_DoMorph <...> FOV = 78 time = <camera_time>
				zooming = true
			endif
		endif
		if (<type> = mid)
			GetRandomValue \{name = random_value
				Integer
				a = 0
				b = 100}
			if (<random_value> < 5)
				CCam_DoMorph <...> FOV = 64 time = <camera_time>
				zooming = true
			endif
			if (<random_value> > 85)
				CCam_DoMorph <...> FOV = 82 time = <camera_time>
				zooming = true
			endif
		endif
	endif
	if (<zooming> = true)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = 0.05
		amplitudeRotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
endscript

script GetMenuTransitionTime 
	if GlobalExists name = <last_camera_name>
		if GlobalExists name = <camera_name>
			if CompareStructs struct1 = ($<last_camera_name>.params) struct2 = ($<camera_name>.params)
				return \{time = 0}
			endif
		endif
	endif
	if GlobalExists name = <last_camera_name>
		if ($target_menu_camera_back = 1)
			camera_name = <last_camera_name>
		endif
	else
		return \{time = 0}
	endif
	time = ($default_camera_transition_time)
	if GlobalExists name = <camera_name>
		if StructureContains Structure = ($<camera_name>) time
			time = ($<camera_name>.time)
		endif
	endif
	return time = <time>
endscript

script ApplyMenuTransitionDOF \{use_transitiondof = 0}
	dofParam = ($DOF_Off_tod_manager.screen_fx [0])
	if (<use_transitiondof> = 1)
		if ($target_menu_camera_back = 1)
			if GlobalExists name = <last_camera_name>
				camera_name = <last_camera_name>
			endif
		endif
		if GlobalExists name = <camera_name>
			if StructureContains Structure = ($<camera_name>) TransitionDOF
				if StructureContains Structure = ($<camera_name>.TransitionDOF) screen_fx
					dofType = ($<camera_name>.TransitionDOF)
					dofParam = (<dofType>.screen_fx [0])
				endif
			endif
		endif
	else
		if GlobalExists name = <camera_name>
			if StructureContains Structure = ($<camera_name>) dof
				if StructureContains Structure = ($<camera_name>.dof) screen_fx
					dofType = ($<camera_name>.dof)
					dofParam = (<dofType>.screen_fx [0])
				endif
			endif
		endif
	endif
	if ViewportExists \{id = bg_viewport}
		if NOT ScreenFX_FxInstanceExists \{viewport = bg_viewport
				name = Depth_of_Field__simplified_}
			ScreenFX_AddFXInstance {
				viewport = bg_viewport
				<dofParam>
			}
		else
			ScreenFX_UpdateFXInstanceParams {
				viewport = bg_viewport
				<dofParam>
			}
		endif
	else
		printf \{qs("\Lbg_viewport doesn't exist")}
	endif
endscript

script ApplyMenuDOF 
	if ViewportExists \{id = bg_viewport}
		if NOT ScreenFX_FxInstanceExists \{viewport = bg_viewport
				name = Depth_of_Field__simplified_}
			ScreenFX_AddFXInstance {
				viewport = bg_viewport
				<dofParam>
			}
		else
			ScreenFX_UpdateFXInstanceParams {
				viewport = bg_viewport
				<dofParam>
			}
		endif
	else
		printf \{qs("\Lbg_viewport doesn't exist")}
	endif
endscript

script task_menu_default_anim_in \{base_name = 'none'}
	printf qs("\Ltask_menu_default_anim_in Base Name : %s") s = <base_name> channel = camera
	if GotParam \{ignore_time}
		params = {ignore_time = 1}
	endif
	if (<base_name> = 'null')
		return
	endif
	if GotParam \{ignore_camera}
		spawnscriptnow menu_soundevent_in params = <...>
		return
	endif
	if GotParam \{override_base_name}
		base_name = <override_base_name>
		printf qs("\Ltask_menu_default_anim_in override Base Name : %s") s = <base_name> channel = camera
	endif
	if NOT ViewportExists \{id = bg_viewport}
		setup_bg_viewport
	endif
	FormatText checksumname = camera_name 'ui_%s_camera' s = <base_name>
	if GlobalExists name = <camera_name>
		KillCamAnim \{name = ch_view_cam}
		if CamAnimFinished \{name = menu_view_cam}
			printf \{qs("\LCamera not active starting...")
				channel = camera}
			change target_menu_camera = <base_name>
			change \{target_menu_camera_back = 0}
			change \{menu_camera_finished = 0}
			PlayIGCCam {
				id = cs_view_cam_id
				name = menu_view_cam
				viewport = bg_viewport
				LockTo = world
				pos = (-28.344543, 0.47631302, 7.1957684)
				Quat = (-0.00071999995, -0.99706, -0.07604)
				Play_hold = 1
				controlscript = menu_camera_control_script
				params = <params>
				interrupt_current
			}
			spawnscriptnow menu_soundevent_in params = <...>
			return
		endif
		spawnscriptnow menu_soundevent_in params = <...>
		printf \{qs("\LSetting Camera Target")
			channel = camera}
		if NOT GotParam \{do_not_hide}
			root_window :SE_SetProps \{alpha = 0.0}
		endif
		if GotParam \{back}
			change \{target_menu_camera_back = 1}
		else
			change \{target_menu_camera_back = 0}
		endif
		change target_menu_camera = <base_name>
		change \{menu_camera_finished = 0}
		FormatText checksumname = current_camera_name 'ui_%s_camera' s = ($current_menu_camera)
		if GlobalExists name = <current_camera_name>
			if CompareStructs struct1 = $<camera_name> struct2 = $<current_camera_name>
				root_window :SE_SetProps \{alpha = 1.0}
				no_camera = 1
			endif
		endif
		change \{generic_menu_block_input = 1}
		begin
		if ($menu_camera_finished = 1)
			break
		elseif NOT ($view_mode = 0)
			break
		endif
		Wait \{1
			game
			frame}
		repeat
		change \{generic_menu_block_input = 0}
		printf \{qs("\LSetting Camera Target Finished")
			channel = camera}
		root_window :SE_SetProps \{alpha = 1.0}
	else
		root_window :SE_SetProps \{alpha = 1.0}
		spawnscriptnow menu_soundevent_in params = <...>
	endif
endscript

script task_menu_default_anim_out 
	spawnscriptnow menu_soundevent_out params = <...>
endscript

script task_menu_retrieve_camera_base_name 
	return camera_name = ($target_menu_camera)
endscript

script task_menu_retrieve_camera_params 
	RequireParams \{[
			camera_name
		]
		all}
	FormatText checksumname = camera_fullname 'ui_%s_camera' s = <camera_name>
	return camera_params = ($<camera_fullname>.params)
endscript

script task_menu_retrieve_camera_DOF_params 
	RequireParams \{[
			camera_name
		]
		all}
	FormatText checksumname = camera_fullname 'ui_%s_camera' s = <camera_name>
	if StructureContains Structure = ($<camera_fullname>) dof
		dof = ($<camera_fullname>.dof)
		dof_params = (<dof>.screen_fx [0])
		return dof_params = <dof_params>
	endif
endscript

script is_menu_camera_finished 
	if ($menu_camera_finished = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script task_menu_dump_camera_base_name 
	task_menu_retrieve_camera_base_name
	stars
	printf qs("\LCurrent Camera is: %c ") c = <camera_name>
	stars
endscript

script menu_transition_in 
	if NOT ($invite_controller = -1)
		return
	endif
	<wait_count> = 0
	begin
	if ScreenElementExists id = <menu>
		break
	endif
	<wait_count> = (<wait_count> + 1)
	if (<wait_count> > (60 * 10))
		printf qs("\Lmenu_transition_in still waiting for %s to exist") s = <menu>
	endif
	Wait \{1
		gameframe}
	repeat
	<menu> :Obj_SpawnScriptNow menu_transition_in_spawned params = {menu = <menu>}
endscript

script menu_transition_in_spawned 
	SE_GetProps \{pos}
	<org_pos> = <pos>
	OnExitRun menu_transition_in_spawned_cleanup params = {menu = <menu> org_pos = <org_pos>}
	SetButtonEventMappings \{block_menu_input}
	SE_GetProps \{scale}
	<org_scale> = <scale>
	Wait \{2
		gameframe}
	ui_fx_set_blur \{amount = 1.0
		time = 0.0}
	SE_SetProps \{scale = 1.4}
	Wait \{0.05
		seconds}
	SE_SetProps \{scale = 1.4499999}
	Wait \{0.05
		seconds}
	SE_SetProps pos = (<org_pos> + (0.0, 10.0))
	Wait \{0.05
		seconds}
	SE_SetProps pos = (<org_pos> + (-5.0, 10.0))
	Wait \{0.05
		seconds}
	SE_SetProps \{scale = 1.1}
	Wait \{0.05
		seconds}
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	SE_SetProps \{scale = 1.0}
	SE_SetProps pos = <org_pos>
endscript

script menu_transition_in_spawned_cleanup 
	if ScreenElementExists id = <menu>
		<menu> :SE_SetProps pos = <org_pos>
	endif
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script menu_transition_out 
	if NOT ($invite_controller = -1)
		return
	endif
	if NOT ScreenElementExists id = <menu>
		return
	endif
	<menu> :Obj_SpawnScriptNow menu_transition_out_spawned
endscript

script menu_transition_out_spawned 
	OnExitRun \{menu_transition_out_spawned_cleanup}
	SE_SetProps \{scale = 1.1}
	ui_fx_set_blur \{amount = 0.5
		time = 0.0}
	Wait \{0.05
		seconds}
	SE_SetProps \{scale = 1.4}
	ui_fx_set_blur \{amount = 1.0
		time = 0.0}
	Wait \{0.05
		seconds}
endscript

script menu_transition_out_spawned_cleanup 
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
endscript
