character_head_viewport_props = {
	viewport = character_head_viewport
	camera = character_head_camera
	style = character_head_rendering
}

script begin_car_capture \{test = 0}
	kill_car_capture
	if cas_player_has_character_object player = ($cas_current_player)
		addparams ($character_head_viewport_props)
		if viewportexists id = <viewport>
			scriptassert \{'Viewport still hanging around'}
		endif
		createviewport {
			priority = 6
			id = <viewport>
			style = <style>
		}
		if (<test> = 1)
			createscreenelement {
				id = photo_test
				type = viewportelement
				parent = root_window
				texture = white
				scale = (128.0, 128.0)
				pos = (50.0, 50.0)
				just = [left top]
				z_priority = 15
				existing_viewport_id = <viewport>
			}
			setviewportproperties viewport = <viewport> active = true
			setactivecamera id = viewer_cam viewport = <viewport>
			viewer_cam :sethfov \{hfov = 45}
		else
			setviewportproperties viewport = <viewport> active = false
		endif
		fxparam = $dof_car_photo_tod_manager
		screenfx_clearfxinstances viewport = <viewport>
		if structurecontains \{structure = fxparam
				screen_fx}
			begin
			if getnextarrayelement (<fxparam>.screen_fx)
				screenfx_addfxinstance {
					viewport = <viewport>
					<element>
				}
			else
				break
			endif
			repeat
		endif
	endif
endscript

script kill_car_capture 
	if screenelementexists \{id = photo_test}
		destroyscreenelement \{id = photo_test}
	endif
	if cas_player_has_character_object player = ($cas_current_player)
		addparams ($character_head_viewport_props)
		if viewportexists id = <viewport>
			screenfx_clearfxinstances {
				viewport = <viewport>
			}
			destroyviewport id = <viewport>
			killcamanim name = <camera>
		endif
	endif
endscript

script car_capture_place_camera 
	if cas_player_has_character_object player = ($cas_current_player)
		addparams ($character_head_viewport_props)
		param_sets = [
			{
				locktobone = bone_head
				pos = (0.0, 0.34, 0.0)
				quat = (-0.161807, -0.16227801, -0.60744905)
				fov = 45
				lookat = <character_object>
				lookatbone = bone_brow_mid
				screenoffset = (0.2, -0.9)
			}
			{
				locktobone = bone_head
				pos = (0.0, 0.33, -0.1)
				quat = (-0.161807, -0.16227801, -0.60744905)
				fov = 45
				lookat = <character_object>
				lookatbone = bone_brow_mid
				screenoffset = (0.2, -0.9)
			}
			{
				locktobone = bone_head
				pos = (0.0, 0.35000002, 0.1)
				quat = (-0.161807, -0.16227801, -0.60744905)
				fov = 45
				lookat = <character_object>
				lookatbone = bone_brow_mid
				screenoffset = (0.0, -0.9)
			}
			{
				locktobone = bone_head
				pos = (0.05, 0.35000002, 0.1)
				quat = (-0.161807, -0.16227801, -0.60744905)
				fov = 45
				lookat = <character_object>
				lookatbone = bone_brow_mid
				screenoffset = (0.0, -0.9)
			}
		]
		getarraysize <param_sets>
		getrandomvalue a = 0 b = (<array_size> - 1) name = index integer
		chosen_param = (<param_sets> [<index>])
		if gotparam \{do_not_modify}
			chosen_param = {
				lockto = $cas_current_player_name
				pos = (-0.00301, 1.6, 1.2)
				quat = (0.0051659998, -1.0, -0.01)
				fov = 35
				lookat = $cas_current_player_name
				lookatbone = bone_neck
				screenoffset = (0.2, 0.65000004)
			}
		endif
		playigccam {
			name = <camera>
			viewport = <viewport>
			lockto = <character_object>
			<chosen_param>
			play_hold = 1
			interrupt_current
		}
	endif
endscript

script do_car_capture 
	printf \{qs(0x1bb4efa4)}
	if cas_player_has_character_object player = ($cas_current_player)
		addparams ($character_head_viewport_props)
		car_capture_move_away_character do_not_modify = <do_not_modify>
		wait \{1
			gameframes}
		if NOT gotparam \{do_not_modify}
			band_playfacialanim name = <character_object> anim = gh_rocker_male_hardrockface_5
		endif
		car_capture_place_camera do_not_modify = <do_not_modify>
		wait \{1
			gameframes}
		finishrendering
		setviewportproperties viewport = <viewport> active = true
		wait \{4
			gameframes}
		finishrendering
		finishrendering
		setviewportproperties viewport = <viewport> active = false
		if NOT gotparam \{readytorock}
			car_capture_move_back_character do_not_modify = <do_not_modify>
		endif
		photocapture_capturefromviewport name = car viewport = <viewport> saveshot = <saveshot>
	endif
endscript
car_capture_moved_char = 0
car_capture_moved_old_pos = (0.0, 0.0, 0.0)
car_capture_moved_old_quat = (0.0, 0.0, 0.0)

script car_capture_move_away_character 
	pos_dir = [
		{
			pos = (-2.6, 0.0, -23.0)
			quat = (-0.078807004, 0.56277496, 0.053912997)
		}
		{
			pos = (-2.94172, 0.0, -29.387184)
			quat = (-0.022496998, 0.540664, 0.014366)
		}
		{
			pos = (-2.9122872, 0.0, -35.93344)
			quat = (0.024223, 0.53719, -0.015568)
		}
		{
			pos = (-3.139093, 0.0, -42.170322)
			quat = (-0.008305001, 0.53201497, 0.005087)
		}
	]
	getarraysize <pos_dir>
	getrandomvalue a = 0 b = (<array_size> - 1) name = index integer
	chosen_pos_dir = (<pos_dir> [<index>])
	car_capture_move_back_character do_not_modify = <do_not_modify>
	if cas_player_has_character_object player = ($cas_current_player)
		<character_object> :obj_getposition
		<character_object> :obj_getquat
		change car_capture_moved_old_pos = <pos>
		change car_capture_moved_old_quat = <quat>
		change \{car_capture_moved_char = 1}
		if NOT gotparam \{do_not_modify}
			<character_object> :obj_setposition position = (<chosen_pos_dir>.pos)
			<character_object> :obj_setorientation quat = (<chosen_pos_dir>.quat)
		endif
	endif
endscript

script car_capture_move_back_character 
	if ($car_capture_moved_char = 1)
		if cas_player_has_character_object player = ($cas_current_player)
			if NOT gotparam \{do_not_modify}
				<character_object> :obj_setposition position = ($car_capture_moved_old_pos)
				<character_object> :obj_setorientation quat = ($car_capture_moved_old_quat)
			endif
		endif
		change \{car_capture_moved_char = 0}
	endif
endscript

script show_photo_cam 
	if cas_player_has_character_object player = ($cas_current_player)
		showcamoffset name = <character_object> bone = bone_head
	endif
endscript

script photograb_preset_profiles 
endscript

script cas_save_photo_of_car 
endscript
