transitions_locked = 0
target_menu_camera = 'null'
current_menu_camera = 'null'
menu_camera_finished = 0
disable_transition_stoprender = 0

script menu_start_transition 
endscript

script menu_complete_transition 
endscript

script menu_transition_stop_rendering 
	if ($disable_transition_stoprender = 0)
		pushdisablerendering \{context = menu_transition
			Type = unchecked}
	endif
endscript

script menu_transition_start_rendering 
	if checkdisablerendering \{context = menu_transition}
		hide_glitch \{num_frames = 2}
		popdisablerendering \{context = menu_transition
			Type = unchecked}
	endif
endscript

script menu_transition_hide_glitch 
	hide_glitch \{num_frames = 2}
endscript

script switch_to_no_band_camera 
	KillCamAnim \{Name = ch_view_cam}
	SpawnScriptLater \{noqbid
		play_cameracut
		params = {
			from_switch_to_no_band_camera
		}}
	Wait \{2
		Seconds}
	begin
	if NOT ($current_menu_camera = 'mainmenu')
		Change \{camera_cut_played = 0}
		return
	endif
	if NOT cas_queue_is_busy
		break
	endif
	Wait \{1
		gameframe}
	repeat
	stop_cameracut
	task_menu_default_anim_in \{base_name = 'mainmenu'}
endscript

script menu_camera_control_script 
	Change \{current_menu_camera = 'none'}
	begin
	if NOT ($current_menu_camera = $target_menu_camera)
		Change \{menu_camera_finished = 0}
		task_menu_retrieve_camera_fullname base_name = ($target_menu_camera)
		Camera_Name = <camera_fullname>
		task_menu_retrieve_camera_fullname base_name = ($current_menu_camera)
		last_camera_name = <camera_fullname>
		getmenutransitiontime Camera_Name = <Camera_Name> last_camera_name = <last_camera_name>
		if NOT (($cas_override_camera_time) < 0)
			new_time = ($cas_override_camera_time)
		else
			RemoveParameter \{new_time}
		endif
		if NOT (<time> = 0)
			SpawnScriptNow applymenutransitiondof params = {Camera_Name = <Camera_Name> last_camera_name = <last_camera_name> time = <time> use_transitiondof = 1}
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
		SpawnScriptNow applymenutransitiondof params = {Camera_Name = <Camera_Name> last_camera_name = <last_camera_name>}
		Change current_menu_camera = ($target_menu_camera)
	else
		if cas_queue_is_busy
			if ($current_menu_camera = 'mainmenu')
				SpawnScriptNow \{noqbid
					switch_to_no_band_camera}
			endif
		endif
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
	if NOT GlobalExists Name = <last_camera_name>
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
		if GlobalExists Name = <Camera_Name>
			if StructureContains structure = ($<Camera_Name>) transitiondof
				if StructureContains structure = ($<Camera_Name>.transitiondof) screen_FX
					dofType = ($<Camera_Name>.transitiondof)
					dofParam = (<dofType>.screen_FX [0])
					if StructureContains structure = ($<Camera_Name>) blend_transition_dof
						if ($<Camera_Name>.blend_transition_dof = 1)
							AddParam structure_name = dofParam Name = time value = <time>
						endif
					endif
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
	if NOT GotParam \{dont_cancel_cas_pull_cam}
		KillSpawnedScript \{Name = cas_pull_back_camera}
	endif
	if GotParam \{override_base_name}
		base_name = <override_base_name>
		printf qs(0xdc5b800e) s = <base_name> channel = Camera
	endif
	if NOT ViewportExists \{id = bg_viewport}
		setup_bg_viewport
	endif
	task_menu_retrieve_camera_fullname base_name = <base_name>
	Camera_Name = <camera_fullname>
	if GlobalExists Name = <Camera_Name>
		KillCamAnim \{Name = ch_view_cam}
		if camanimfinished \{Name = menu_view_cam}
			printf \{qs(0xd7b7aa34)
				channel = Camera}
			Change target_menu_camera = <base_name>
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
		Change target_menu_camera = <base_name>
		Change \{menu_camera_finished = 0}
		task_menu_retrieve_camera_fullname base_name = ($current_menu_camera)
		current_camera_name = <camera_fullname>
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

script task_menu_retrieve_camera_fullname 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = camera_fullname '%p_ui_%s_camera' p = <pakname> s = <base_name>
	if NOT GlobalExists Name = <camera_fullname>
		formatText checksumName = camera_fullname 'ui_%s_camera' s = <base_name>
	endif
	return camera_fullname = <camera_fullname>
endscript

script task_menu_retrieve_camera_params 
	RequireParams \{[
			Camera_Name
		]
		all}
	task_menu_retrieve_camera_fullname base_name = <Camera_Name>
	return camera_params = ($<camera_fullname>.params)
endscript

script task_menu_retrieve_camera_dof_params 
	RequireParams \{[
			Camera_Name
		]
		all}
	task_menu_retrieve_camera_fullname base_name = <Camera_Name>
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

script setup_zone_nobandcam 
	Change ui_no_band_camera = {
		($ui_no_band_camera)
		params = {
			LockTo = World
			Pos = (-12.2872505, 2.768528, 23.516026)
			Quat = (0.0035930001, 0.917991, -0.031315)
			FOV = 87.0
		}
	}
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_cameras_no_band' out = array_name
	if GlobalExists Name = <array_name>
		array = ($<array_name>)
		GetArraySize <array>
		if (<array_Size> = 0)
			return
		endif
		entry = (<array> [0])
		RemoveComponent \{structure_name = entry
			Name = Name}
		Change ui_no_band_camera = {
			($ui_no_band_camera)
			params = <entry>
			transitiondof = (<entry>.DOF)
			DOF = (<entry>.DOF)
		}
		return
	endif
	return
endscript

script ui_use_no_band_camera 
	task_menu_default_anim_in \{base_name = 'no_band'}
endscript
