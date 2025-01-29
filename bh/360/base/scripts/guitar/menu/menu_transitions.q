transitions_locked = 0
target_menu_camera = 'null'
current_menu_camera = 'null'
target_menu_camera_back = 0
menu_camera_finished = 0
disable_transition_stoprender = 0

script menu_start_transition 
endscript

script menu_complete_transition 
endscript

script menu_transition_stop_rendering 
	if ($disable_transition_stoprender = 0)
		StopRendering \{reason = menu_transition}
	endif
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

script switch_to_no_band_camera 
	KillCamAnim \{name = ch_view_cam}
	spawnscriptlater \{noqbid
		play_cameracut
		params = {
			from_switch_to_no_band_camera
		}}
	wait \{2
		seconds}
	begin
	if NOT ($current_menu_camera = 'mainmenu')
		Change \{camera_cut_played = 0}
		return
	endif
	if NOT cas_queue_is_busy
		break
	endif
	wait \{1
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
		camera_name = <camera_fullname>
		task_menu_retrieve_camera_fullname base_name = ($current_menu_camera)
		last_camera_name = <camera_fullname>
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
			if StructureContains structure = ($<camera_name>) controlscript
				ExtendCrc ($<camera_name>.controlscript) '_MenuTransition' out = newcontrolscript
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
		Change current_menu_camera = ($target_menu_camera)
	else
		if cas_queue_is_busy
			if ($current_menu_camera = 'mainmenu')
				spawnscriptnow \{noqbid
					switch_to_no_band_camera}
			endif
		endif
	endif
	Change \{menu_camera_finished = 1}
	wait \{1
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

script CameraCuts_HandCam_MenuTransition \{name = None}
	CCam_DoMorph
	zooming = false
	if GotParam \{type}
		if (<type> = Longshot)
			GetRandomValue \{name = random_value
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
		if (<type> = mid)
			GetRandomValue \{name = random_value
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
		amplituderotation = -0.01
	else
		amplitudePosition = 0.05
		amplituderotation = -0.08
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
		if StructureContains structure = ($<camera_name>) time
			time = ($<camera_name>.time)
		endif
	endif
	return time = <time>
endscript

script ApplyMenuTransitionDOF \{use_transitiondof = 0}
	dofParam = ($DOF_Off_TOD_Manager.screen_fx [0])
	if (<use_transitiondof> = 1)
		if ($target_menu_camera_back = 1)
			if GlobalExists name = <last_camera_name>
				camera_name = <last_camera_name>
			endif
		endif
		if GlobalExists name = <camera_name>
			if StructureContains structure = ($<camera_name>) TransitionDOF
				if StructureContains structure = ($<camera_name>.TransitionDOF) screen_fx
					dofType = ($<camera_name>.TransitionDOF)
					dofParam = (<dofType>.screen_fx [0])
				endif
			endif
		endif
	else
		if GlobalExists name = <camera_name>
			if StructureContains structure = ($<camera_name>) DOF
				if StructureContains structure = ($<camera_name>.DOF) screen_fx
					dofType = ($<camera_name>.DOF)
					dofParam = (<dofType>.screen_fx [0])
				endif
			endif
		endif
	endif
	if ViewportExists \{id = bg_viewport}
		if NOT ScreenFX_FXInstanceExists \{viewport = bg_viewport
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
		printf \{qs(0xef60923a)}
	endif
endscript

script ApplyMenuDOF 
	if ViewportExists \{id = bg_viewport}
		if NOT ScreenFX_FXInstanceExists \{viewport = bg_viewport
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
		spawnscriptnow menu_soundevent_in params = <...>
		return
	endif
	if NOT GotParam \{dont_cancel_cas_pull_cam}
		killspawnedscript \{name = cas_pull_back_camera}
	endif
	if GotParam \{override_base_name}
		base_name = <override_base_name>
		printf qs(0xdc5b800e) s = <base_name> channel = Camera
	endif
	if NOT ViewportExists \{id = bg_viewport}
		setup_bg_viewport
	endif
	task_menu_retrieve_camera_fullname base_name = <base_name>
	camera_name = <camera_fullname>
	if GlobalExists name = <camera_name>
		KillCamAnim \{name = ch_view_cam}
		if CamAnimFinished \{name = menu_view_cam}
			printf \{qs(0xd7b7aa34)
				channel = Camera}
			Change target_menu_camera = <base_name>
			Change \{target_menu_camera_back = 0}
			Change \{menu_camera_finished = 0}
			PlayIGCCam {
				id = cs_view_cam_id
				name = menu_view_cam
				viewport = bg_viewport
				LockTo = World
				Pos = (-28.344543, 0.47631302, 7.1957684)
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
		printf \{qs(0xb186d8c7)
			channel = Camera}
		if NOT GotParam \{do_not_hide}
			root_window :SE_SetProps \{alpha = 0.0}
		endif
		if GotParam \{back}
			Change \{target_menu_camera_back = 1}
		else
			Change \{target_menu_camera_back = 0}
		endif
		Change target_menu_camera = <base_name>
		Change \{menu_camera_finished = 0}
		task_menu_retrieve_camera_fullname base_name = ($current_menu_camera)
		current_camera_name = <camera_fullname>
		if GlobalExists name = <current_camera_name>
			if CompareStructs struct1 = $<camera_name> struct2 = $<current_camera_name>
				root_window :SE_SetProps \{alpha = 1.0}
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
		wait \{1
			game
			frame}
		repeat
		Change \{generic_menu_block_input = 0}
		printf \{qs(0xf2569fd5)
			channel = Camera}
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

script task_menu_retrieve_camera_fullname 
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = camera_fullname '%p_ui_%s_camera' p = <pakname> s = <base_name>
	if NOT GlobalExists name = <camera_fullname>
		FormatText checksumname = camera_fullname 'ui_%s_camera' s = <base_name>
	endif
	return camera_fullname = <camera_fullname>
endscript

script task_menu_retrieve_camera_params 
	RequireParams \{[
			camera_name
		]
		all}
	task_menu_retrieve_camera_fullname base_name = <camera_name>
	return camera_params = ($<camera_fullname>.params)
endscript

script task_menu_retrieve_camera_DOF_params 
	RequireParams \{[
			camera_name
		]
		all}
	task_menu_retrieve_camera_fullname base_name = <camera_name>
	if StructureContains structure = ($<camera_fullname>) DOF
		DOF = ($<camera_fullname>.DOF)
		dof_params = (<DOF>.screen_fx [0])
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
	if GlobalExists name = <array_name>
		array = ($<array_name>)
		GetArraySize <array>
		if (<array_size> = 0)
			return
		endif
		entry = (<array> [0])
		RemoveComponent \{structure_name = entry
			name = name}
		Change ui_no_band_camera = {
			($ui_no_band_camera)
			params = <entry>
			TransitionDOF = (<entry>.DOF)
			DOF = (<entry>.DOF)
		}
		return
	endif
	return
endscript

script ui_use_no_band_camera 
	task_menu_default_anim_in \{base_name = 'no_band'}
endscript
