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
	StopRendering \{reason = menu_transition}
endscript

script menu_transition_start_rendering 
	if ($rendering_has_been_stopped_menu_transition = true)
		hide_glitch
		StartRendering \{reason = menu_transition}
	endif
endscript

script menu_transition_hide_glitch 
	hide_glitch
endscript

script menu_camera_control_script 
	Change \{current_menu_camera = 'none'}
	begin
	if NOT ($current_menu_camera = $target_menu_camera)
		Change \{menu_camera_finished = 0}
		formatText checksumName = Camera_Name 'ui_%s_camera' s = ($target_menu_camera)
		formatText checksumName = last_camera_name 'ui_%s_camera' s = ($current_menu_camera)
		getmenutransitiontime <...>
		if NOT (($cas_override_camera_time) < 0)
			new_time = ($cas_override_camera_time)
		else
			RemoveParameter \{new_time}
		endif
		if NOT (<time> = 0)
			SpawnScriptNow applymenutransitiondof params = {<...> use_transitiondof = 1}
		endif
		menucontrolscript = menu_camera_control_standard
		if GlobalExists Name = <Camera_Name>
			if StructureContains structure = ($<Camera_Name>) controlscript
				ExtendCrc ($<Camera_Name>.controlscript) '_MenuTransition' out = newcontrolscript
				if ScriptExists <newcontrolscript>
					menucontrolscript = <newcontrolscript>
				endif
			endif
		endif
		<menucontrolscript> {
			($default_camera_transition_params)
			time = <time>
			($<Camera_Name>.params)
			time = <new_time>
		}
		if NOT (<time> = 0)
			CCam_WaitMorph
		endif
		SpawnScriptNow applymenutransitiondof params = {<...>}
		Change current_menu_camera = ($target_menu_camera)
	endif
	Change \{menu_camera_finished = 1}
	Wait \{1
		gameframe}
	repeat
endscript

script menu_camera_control_standard 
	CCam_EnableHandcam \{ShakeEnabled = FALSE
		DriftEnabled = FALSE}
	CCam_DoMorph {
		<...>
	}
endscript

script cameracuts_handcam_menutransition \{Name = None}
	CCam_DoMorph
	zooming = FALSE
	if GotParam \{Type}
		if (<Type> = LongShot)
			GetRandomValue \{Name = random_value
				integer
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
		if (<Type> = Mid)
			GetRandomValue \{Name = random_value
				integer
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

script getmenutransitiontime 
	if GlobalExists Name = <last_camera_name>
		if GlobalExists Name = <Camera_Name>
			if comparestructs struct1 = ($<last_camera_name>.params) struct2 = ($<Camera_Name>.params)
				return \{time = 0}
			endif
		endif
	endif
	if GlobalExists Name = <last_camera_name>
		if ($target_menu_camera_back = 1)
			Camera_Name = <last_camera_name>
		endif
	else
		return \{time = 0}
	endif
	time = ($default_camera_transition_time)
	if GlobalExists Name = <Camera_Name>
		if StructureContains structure = ($<Camera_Name>) time
			time = ($<Camera_Name>.time)
		endif
	endif
	return time = <time>
endscript

script applymenutransitiondof \{use_transitiondof = 0}
	dofParam = ($DOF_Off_TOD_Manager.screen_FX [0])
	if (<use_transitiondof> = 1)
		if ($target_menu_camera_back = 1)
			if GlobalExists Name = <last_camera_name>
				Camera_Name = <last_camera_name>
			endif
		endif
		if GlobalExists Name = <Camera_Name>
			if StructureContains structure = ($<Camera_Name>) transitiondof
				if StructureContains structure = ($<Camera_Name>.transitiondof) screen_FX
					dofType = ($<Camera_Name>.transitiondof)
					dofParam = (<dofType>.screen_FX [0])
				endif
			endif
		endif
	else
		if GlobalExists Name = <Camera_Name>
			if StructureContains structure = ($<Camera_Name>) DOF
				if StructureContains structure = ($<Camera_Name>.DOF) screen_FX
					dofType = ($<Camera_Name>.DOF)
					dofParam = (<dofType>.screen_FX [0])
				endif
			endif
		endif
	endif
	if ViewportExists \{id = bg_viewport}
		if NOT screenFX_FXInstanceExists \{viewport = bg_viewport
				Name = depth_of_field__simplified_}
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
		printf \{qs(0xef60923a)}
	endif
endscript

script applymenudof 
	if ViewportExists \{id = bg_viewport}
		if NOT screenFX_FXInstanceExists \{viewport = bg_viewport
				Name = depth_of_field__simplified_}
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
		printf \{qs(0xef60923a)}
	endif
endscript

script task_menu_default_anim_in \{base_name = 'none'}
	printf qs(0x497b2e87) s = <base_name> channel = Camera
	if GotParam \{ignore_time}
		params = {ignore_time = 1}
	endif
	if (<base_name> = 'null')
		return
	endif
	if GotParam \{ignore_camera}
		SpawnScriptNow menu_soundevent_in params = <...>
		return
	endif
	if GotParam \{override_base_name}
		base_name = <override_base_name>
		printf qs(0xdc5b800e) s = <base_name> channel = Camera
	endif
	if NOT ViewportExists \{id = bg_viewport}
		setup_bg_viewport
	endif
	formatText checksumName = Camera_Name 'ui_%s_camera' s = <base_name>
	if GlobalExists Name = <Camera_Name>
		KillCamAnim \{Name = ch_view_cam}
		if camanimfinished \{Name = menu_view_cam}
			printf \{qs(0xd7b7aa34)
				channel = Camera}
			Change target_menu_camera = <base_name>
			Change \{target_menu_camera_back = 0}
			Change \{menu_camera_finished = 0}
			PlayIGCCam {
				id = cs_view_cam_id
				Name = menu_view_cam
				viewport = bg_viewport
				LockTo = World
				Pos = (-28.344543, 0.47631302, 7.1957684)
				Quat = (-0.00071999995, -0.99706, -0.07604)
				play_hold = 1
				controlscript = menu_camera_control_script
				params = <params>
				interrupt_current
			}
			SpawnScriptNow menu_soundevent_in params = <...>
			return
		endif
		SpawnScriptNow menu_soundevent_in params = <...>
		printf \{qs(0xb186d8c7)
			channel = Camera}
		if NOT GotParam \{do_not_hide}
			root_window :se_setprops \{alpha = 0.0}
		endif
		if GotParam \{back}
			Change \{target_menu_camera_back = 1}
		else
			Change \{target_menu_camera_back = 0}
		endif
		Change target_menu_camera = <base_name>
		Change \{menu_camera_finished = 0}
		formatText checksumName = current_camera_name 'ui_%s_camera' s = ($current_menu_camera)
		if GlobalExists Name = <current_camera_name>
			if comparestructs struct1 = $<Camera_Name> struct2 = $<current_camera_name>
				root_window :se_setprops \{alpha = 1.0}
				no_camera = 1
			endif
		endif
		Change \{generic_menu_block_input = 1}
		begin
		if ($menu_camera_finished = 1)
			break
		elseif NOT ($view_mode = 0)
			break
		endif
		Wait \{1
			game
			Frame}
		repeat
		Change \{generic_menu_block_input = 0}
		printf \{qs(0xf2569fd5)
			channel = Camera}
		root_window :se_setprops \{alpha = 1.0}
	else
		root_window :se_setprops \{alpha = 1.0}
		SpawnScriptNow menu_soundevent_in params = <...>
	endif
endscript

script task_menu_default_anim_out 
	SpawnScriptNow menu_soundevent_out params = <...>
endscript

script task_menu_retrieve_camera_base_name 
	return Camera_Name = ($target_menu_camera)
endscript

script task_menu_retrieve_camera_params 
	RequireParams \{[
			Camera_Name
		]
		all}
	formatText checksumName = camera_fullname 'ui_%s_camera' s = <Camera_Name>
	return camera_params = ($<camera_fullname>.params)
endscript

script task_menu_retrieve_camera_dof_params 
	RequireParams \{[
			Camera_Name
		]
		all}
	formatText checksumName = camera_fullname 'ui_%s_camera' s = <Camera_Name>
	if StructureContains structure = ($<camera_fullname>) DOF
		DOF = ($<camera_fullname>.DOF)
		dof_params = (<DOF>.screen_FX [0])
		return dof_params = <dof_params>
	endif
endscript

script is_menu_camera_finished 
	if ($menu_camera_finished = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script task_menu_dump_camera_base_name 
	task_menu_retrieve_camera_base_name
	stars
	printf qs(0x87a22b91) c = <Camera_Name>
	stars
endscript

script menu_transition_in \{anim_type = slide}
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
		printf qs(0xc11e16e2) s = <menu>
	endif
	Wait \{1
		gameframe}
	repeat
	<menu> :Obj_SpawnScriptNow menu_transition_in_spawned params = {anim_type = <anim_type>}
endscript

script menu_transition_in_spawned 
	se_getprops \{Pos}
	<org_pos> = <Pos>
	se_getprops \{Scale}
	<org_scale> = <Scale>
	Obj_GetID
	OnExitRun menu_transition_in_spawned_cleanup params = {objID = <objID> org_pos = <org_pos> org_scale = <org_scale>}
	switch <anim_type>
		case slide
		se_setprops Pos = (<org_pos> - (1280.0, 0.0))
		Wait \{0.048
			Seconds}
		se_setprops Pos = <org_pos> time = 0.1
		se_waitprops
		case zoom_blur
		ui_fx_set_blur \{amount = 1.0
			time = 0.0}
		se_setprops Scale = (<org_scale> * 1.4)
		Wait \{0.05
			Seconds}
		se_setprops Scale = (<org_scale> * 1.4499999)
		Wait \{0.05
			Seconds}
		se_setprops Pos = (<org_pos> + (0.0, 10.0))
		Wait \{0.05
			Seconds}
		se_setprops Pos = (<org_pos> + (-5.0, 10.0))
		Wait \{0.05
			Seconds}
		se_setprops Scale = (<org_scale> * 1.1)
		Wait \{0.05
			Seconds}
		ui_fx_set_blur \{amount = 0.0
			time = 0.0}
		se_setprops Scale = <org_scale>
		se_setprops Pos = <org_pos>
		LaunchEvent Type = focus target = <objID>
	endswitch
endscript

script menu_transition_in_spawned_cleanup 
	RequireParams \{[
			objID
			org_pos
			org_scale
		]
		all}
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	if ScreenElementExists id = <objID>
		<objID> :se_setprops Pos = <org_pos>
		<objID> :se_setprops Scale = <org_scale>
		spawnscript menu_reset_highlight params = {anchor = <objID>}
	endif
endscript

script menu_transition_out \{anim_type = slide}
	if NOT ($invite_controller = -1)
		return
	endif
	if NOT ScreenElementExists id = <menu>
		return
	endif
	<menu> :Obj_SpawnScriptNow menu_transition_out_spawned params = {anim_type = <anim_type>}
endscript

script menu_transition_out_spawned 
	se_getprops \{Pos}
	<org_pos> = <Pos>
	se_getprops \{Scale}
	<org_scale> = <Scale>
	Obj_GetID
	OnExitRun menu_transition_out_spawned_cleanup params = {objID = <objID> org_pos = <org_pos> org_scale = <org_scale>}
	switch <anim_type>
		case slide
		se_getprops \{Pos}
		<org_pos> = <Pos>
		se_setprops Pos = (<org_pos> - (1280.0, 0.0)) time = 0.1
		se_waitprops
		case zoom_blur
		se_setprops \{Scale = 1.1}
		ui_fx_set_blur \{amount = 0.5
			time = 0.0}
		Wait \{0.05
			Seconds}
		se_setprops \{Scale = 1.4}
		ui_fx_set_blur \{amount = 1.0
			time = 0.0}
		Wait \{0.05
			Seconds}
	endswitch
endscript

script menu_transition_out_spawned_cleanup 
	RequireParams \{[
			objID
			org_pos
			org_scale
		]
		all}
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	if ScreenElementExists id = <objID>
		<objID> :se_setprops Pos = <org_pos>
		<objID> :se_setprops Scale = <org_scale>
	endif
endscript
