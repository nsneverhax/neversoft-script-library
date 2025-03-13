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
			type = unchecked}
	endif
endscript

script menu_transition_start_rendering 
	if checkdisablerendering \{context = menu_transition}
		hide_glitch \{num_frames = 2}
		popdisablerendering \{context = menu_transition
			type = unchecked}
	endif
endscript

script menu_transition_hide_glitch 
	hide_glitch \{num_frames = 2}
endscript

script switch_to_no_band_camera 
	killcamanim \{name = ch_view_cam}
	spawnscriptlater \{noqbid
		play_cameracut
		params = {
			from_switch_to_no_band_camera
		}}
	wait \{2
		seconds}
	begin
	if NOT ($current_menu_camera = 'mainmenu')
		change \{camera_cut_played = 0}
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
	change \{current_menu_camera = 'none'}
	begin
	if NOT ($current_menu_camera = $target_menu_camera)
		change \{menu_camera_finished = 0}
		task_menu_retrieve_camera_fullname base_name = ($target_menu_camera)
		camera_name = <camera_fullname>
		task_menu_retrieve_camera_fullname base_name = ($current_menu_camera)
		last_camera_name = <camera_fullname>
		getmenutransitiontime camera_name = <camera_name> last_camera_name = <last_camera_name>
		if NOT (($cas_override_camera_time) < 0)
			new_time = ($cas_override_camera_time)
		else
			removeparameter \{new_time}
		endif
		if NOT (<time> = 0)
			spawnscriptnow applymenutransitiondof params = {camera_name = <camera_name> last_camera_name = <last_camera_name> time = <time> use_transitiondof = 1}
		endif
		menucontrolscript = menu_camera_control_standard
		if globalexists name = <camera_name>
			if structurecontains structure = ($<camera_name>) controlscript
				extendcrc ($<camera_name>.controlscript) '_MenuTransition' out = newcontrolscript
				if scriptexists <newcontrolscript>
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
			ccam_waitmorph
		endif
		spawnscriptnow applymenutransitiondof params = {camera_name = <camera_name> last_camera_name = <last_camera_name>}
		change current_menu_camera = ($target_menu_camera)
	else
		if cas_queue_is_busy
			if ($current_menu_camera = 'mainmenu')
				spawnscriptnow \{noqbid
					switch_to_no_band_camera}
			endif
		endif
	endif
	change \{menu_camera_finished = 1}
	wait \{1
		gameframe}
	repeat
endscript

script menu_camera_control_standard 
	ccam_enablehandcam \{shakeenabled = false
		driftenabled = false}
	ccam_domorph {
		<...>
	}
endscript

script cameracuts_handcam_menutransition \{name = none}
	ccam_domorph
	zooming = false
	if gotparam \{type}
		if (<type> = longshot)
			getrandomvalue \{name = random_value
				integer
				a = 0
				b = 100}
			if (<random_value> < 25)
				ccam_domorph <...> fov = 62 time = <camera_time>
				zooming = true
			endif
			if (<random_value> > 95)
				ccam_domorph <...> fov = 78 time = <camera_time>
				zooming = true
			endif
		endif
		if (<type> = mid)
			getrandomvalue \{name = random_value
				integer
				a = 0
				b = 100}
			if (<random_value> < 5)
				ccam_domorph <...> fov = 64 time = <camera_time>
				zooming = true
			endif
			if (<random_value> > 85)
				ccam_domorph <...> fov = 82 time = <camera_time>
				zooming = true
			endif
		endif
	endif
	if (<zooming> = true)
		amplitudeposition = 0.01
		amplituderotation = -0.01
	else
		amplitudeposition = 0.05
		amplituderotation = -0.08
	endif
	cameracuts_sethandcamparams <...>
endscript

script getmenutransitiontime 
	if globalexists name = <last_camera_name>
		if globalexists name = <camera_name>
			if comparestructs struct1 = ($<last_camera_name>.params) struct2 = ($<camera_name>.params)
				return \{time = 0}
			endif
		endif
	endif
	if NOT globalexists name = <last_camera_name>
		return \{time = 0}
	endif
	time = ($default_camera_transition_time)
	if globalexists name = <camera_name>
		if structurecontains structure = ($<camera_name>) time
			time = ($<camera_name>.time)
		endif
	endif
	return time = <time>
endscript

script applymenutransitiondof \{use_transitiondof = 0}
	dofparam = ($dof_off_tod_manager.screen_fx [0])
	if (<use_transitiondof> = 1)
		if globalexists name = <camera_name>
			if structurecontains structure = ($<camera_name>) transitiondof
				if structurecontains structure = ($<camera_name>.transitiondof) screen_fx
					doftype = ($<camera_name>.transitiondof)
					dofparam = (<doftype>.screen_fx [0])
					if structurecontains structure = ($<camera_name>) blend_transition_dof
						if ($<camera_name>.blend_transition_dof = 1)
							addparam structure_name = dofparam name = time value = <time>
						endif
					endif
				endif
			endif
		endif
	else
		if globalexists name = <camera_name>
			if structurecontains structure = ($<camera_name>) dof
				if structurecontains structure = ($<camera_name>.dof) screen_fx
					doftype = ($<camera_name>.dof)
					dofparam = (<doftype>.screen_fx [0])
				endif
			endif
		endif
	endif
	if viewportexists \{id = bg_viewport}
		if NOT screenfx_fxinstanceexists \{viewport = bg_viewport
				name = depth_of_field__simplified_}
			screenfx_addfxinstance {
				viewport = bg_viewport
				<dofparam>
			}
		else
			screenfx_updatefxinstanceparams {
				viewport = bg_viewport
				<dofparam>
			}
		endif
	else
		printf \{qs(0xef60923a)}
	endif
endscript

script applymenudof 
	if viewportexists \{id = bg_viewport}
		if NOT screenfx_fxinstanceexists \{viewport = bg_viewport
				name = depth_of_field__simplified_}
			screenfx_addfxinstance {
				viewport = bg_viewport
				<dofparam>
			}
		else
			screenfx_updatefxinstanceparams {
				viewport = bg_viewport
				<dofparam>
			}
		endif
	else
		printf \{qs(0xef60923a)}
	endif
endscript

script task_menu_default_anim_in \{base_name = 'none'}
	printf qs(0x497b2e87) s = <base_name> channel = camera
	if gotparam \{ignore_time}
		params = {ignore_time = 1}
	endif
	if (<base_name> = 'null')
		return
	endif
	if gotparam \{ignore_camera}
		spawnscriptnow menu_soundevent_in params = <...>
		return
	endif
	if NOT gotparam \{dont_cancel_cas_pull_cam}
		killspawnedscript \{name = cas_pull_back_camera}
	endif
	if gotparam \{override_base_name}
		base_name = <override_base_name>
		printf qs(0xdc5b800e) s = <base_name> channel = camera
	endif
	if NOT viewportexists \{id = bg_viewport}
		setup_bg_viewport
	endif
	task_menu_retrieve_camera_fullname base_name = <base_name>
	camera_name = <camera_fullname>
	if globalexists name = <camera_name>
		killcamanim \{name = ch_view_cam}
		if camanimfinished \{name = menu_view_cam}
			printf \{qs(0xd7b7aa34)
				channel = camera}
			change target_menu_camera = <base_name>
			change \{menu_camera_finished = 0}
			playigccam {
				id = cs_view_cam_id
				name = menu_view_cam
				viewport = bg_viewport
				lockto = world
				pos = (-28.344543, 0.47631302, 7.1957684)
				quat = (-0.00071999995, -0.99706, -0.07604)
				play_hold = 1
				controlscript = menu_camera_control_script
				params = <params>
				interrupt_current
			}
			spawnscriptnow menu_soundevent_in params = <...>
			return
		endif
		spawnscriptnow menu_soundevent_in params = <...>
		printf \{qs(0xb186d8c7)
			channel = camera}
		if NOT gotparam \{do_not_hide}
			root_window :se_setprops \{alpha = 0.0}
		endif
		change target_menu_camera = <base_name>
		change \{menu_camera_finished = 0}
		task_menu_retrieve_camera_fullname base_name = ($current_menu_camera)
		current_camera_name = <camera_fullname>
		if globalexists name = <current_camera_name>
			if comparestructs struct1 = $<camera_name> struct2 = $<current_camera_name>
				root_window :se_setprops \{alpha = 1.0}
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
		wait \{1
			game
			frame}
		repeat
		change \{generic_menu_block_input = 0}
		printf \{qs(0xf2569fd5)
			channel = camera}
		root_window :se_setprops \{alpha = 1.0}
	else
		root_window :se_setprops \{alpha = 1.0}
		spawnscriptnow menu_soundevent_in params = <...>
	endif
endscript

script task_menu_default_anim_out 
	spawnscriptnow menu_soundevent_out params = <...>
endscript

script task_menu_retrieve_camera_base_name 
	return camera_name = ($target_menu_camera)
endscript

script task_menu_retrieve_camera_fullname \{base_name = 0x69696969}
	if getpakmancurrentname \{map = zones}
		formattext checksumname = camera_fullname '%p_ui_%s_camera' p = <pakname> s = <base_name>
		if NOT globalexists name = <camera_fullname>
			formattext checksumname = camera_fullname 'ui_%s_camera' s = <base_name>
		endif
	else
		formattext checksumname = camera_fullname 'ui_%s_camera' s = <base_name>
	endif
	return camera_fullname = <camera_fullname>
endscript

script task_menu_retrieve_camera_params 
	requireparams \{[
			camera_name
		]
		all}
	task_menu_retrieve_camera_fullname base_name = <camera_name>
	return camera_params = ($<camera_fullname>.params)
endscript

script task_menu_retrieve_camera_dof_params 
	requireparams \{[
			camera_name
		]
		all}
	task_menu_retrieve_camera_fullname base_name = <camera_name>
	if structurecontains structure = ($<camera_fullname>) dof
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

script setup_zone_nobandcam 
	change ui_no_band_camera = {
		($ui_no_band_camera)
		params = {
			lockto = world
			pos = (-12.2872505, 2.768528, 23.516026)
			quat = (0.0035930001, 0.917991, -0.031315)
			fov = 87.0
		}
	}
	getpakmancurrent \{map = zones}
	extendcrc <pak> '_cameras_no_band' out = array_name
	if globalexists name = <array_name>
		array = ($<array_name>)
		getarraysize <array>
		if (<array_size> = 0)
			return
		endif
		entry = (<array> [0])
		removecomponent \{structure_name = entry
			name = name}
		change ui_no_band_camera = {
			($ui_no_band_camera)
			params = <entry>
			transitiondof = (<entry>.dof)
			dof = (<entry>.dof)
		}
		return
	endif
	return
endscript

script ui_use_no_band_camera 
	task_menu_default_anim_in \{base_name = 'no_band'}
endscript
