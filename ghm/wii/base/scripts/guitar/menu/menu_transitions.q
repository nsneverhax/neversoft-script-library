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
	StartRendering \{reason = menu_transition}
endscript

script menu_transition_hide_glitch 
	hide_glitch
endscript

script menu_camera_control_script 
	viwaitforretrace
	Change \{current_menu_camera = 'none'}
	printf \{qs(0x910b5dbe)}
	begin
	if NOT ($current_menu_camera = $target_menu_camera)
		Change \{menu_camera_finished = 0}
		formatText checksumName = Camera_Name 'ui_%s_camera' s = ($target_menu_camera)
		formatText checksumName = last_camera_name 'ui_%s_camera' s = ($current_menu_camera)
		getmenutransitiontime <...>
		if GotParam \{ignore_time}
			time = 0
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
		printf 'calling menu control script: %x' X = <menucontrolscript>
		<menucontrolscript> {
			($default_camera_transition_params)
			time = <time>
			($<Camera_Name>.params)
		}
		if NOT (<time> = 0)
			CCam_WaitMorph
		endif
		SpawnScriptNow applymenutransitiondof params = {<...>}
		Change current_menu_camera = ($target_menu_camera)
	endif
	Change \{menu_camera_finished = 1}
	WaitOneGameFrame
	repeat
endscript

script ps2_launce_menu_video \{Camera_Name = None}
	if GlobalExists Name = <Camera_Name>
		if StructureContains structure = ($<Camera_Name>) video_name
			0xd518ab19 video = ($<Camera_Name>.video_name)
			stars
			printf qs(0x9651e9ba) a = ($<Camera_Name>.video_name)
			stars
		endif
	endif
endscript

script menu_camera_control_standard 
	CCam_EnableHandcam \{ShakeEnabled = FALSE
		DriftEnabled = FALSE}
	CCam_DoMorph {
		<...>
	}
endscript

script cameracuts_handcam_menutransition \{Name = None}
	CCam_DoMorph <...>
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
		printf \{qs(0x1e504034)}
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
		printf \{'waiting for task_menu_default_anim_in'}
		WaitOneGameFrame
		repeat 120
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

script menu_transition_in 
	<wait_count> = 0
	begin
	if ScreenElementExists id = <menu>
		break
	endif
	<wait_count> = (<wait_count> + 1)
	if (<wait_count> > (60 * 10))
		printf qs(0xc11e16e2) s = <menu>
	endif
	WaitOneGameFrame
	repeat
	<menu> :Obj_SpawnScriptNow menu_transition_in_spawned params = {menu = <menu>}
endscript

script menu_transition_in_spawned 
	se_getprops \{Pos}
	<org_pos> = <Pos>
	OnExitRun menu_transition_in_spawned_cleanup params = {menu = <menu> org_pos = <org_pos>}
	se_getprops \{Scale}
	<org_scale> = <Scale>
	se_getprops \{Pos}
	<org_pos> = <Pos>
	ui_fx_set_blur \{amount = 1.0
		time = 0.0}
	se_setprops \{Scale = 1.4}
	Wait \{0.05
		Seconds}
	se_setprops \{Scale = 1.4499999}
	Wait \{0.05
		Seconds}
	se_setprops Pos = (<org_pos> + (0.0, 10.0))
	Wait \{0.05
		Seconds}
	se_setprops Pos = (<org_pos> + (-5.0, 10.0))
	Wait \{0.05
		Seconds}
	se_setprops \{Scale = 1.1}
	Wait \{0.05
		Seconds}
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	se_setprops \{Scale = 1.0}
	se_setprops Pos = <org_pos>
endscript

script menu_transition_in_spawned_cleanup 
	if ScreenElementExists id = <menu>
		<menu> :se_setprops Pos = <org_pos>
	endif
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
endscript

script menu_transition_out 
	if NOT ScreenElementExists id = <menu>
		return
	endif
	<menu> :Obj_SpawnScriptNow menu_transition_out_spawned
endscript

script menu_transition_out_spawned 
	OnExitRun \{menu_transition_out_spawned_cleanup}
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
endscript

script menu_transition_out_spawned_cleanup 
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
endscript
