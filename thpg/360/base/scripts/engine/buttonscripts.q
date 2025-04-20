select_shift = 0
memcard_screenshots = 0
skater_cam_0_mode = 2
skater_cam_1_mode = 2
screenshotmode = 0
arl_text = "Show Pak\\b6"
arr_text = "\\b5AI Displays"
aru_text = "Toggle 2D"
ard_text = "Profiler"
all_text = "\\b6"
alr_text = "\\b5"
alu_text = "Kill Splats"
ald_text = "Model Viewer"
root_text = {
	arl_text = "Show Pak\\b6"
	arr_text = "\\b5AI Displays"
	aru_text = "Toggle 2D"
	ard_text = "Profiler"
	all_text = "\\b6"
	alr_text = "\\b5"
	alu_text = "Kill Splats"
	ald_text = "Model Viewer"
}
modelviewer_text = {
	arl_text = "Show Pak\\b6"
	arr_text = "\\b5AI Displays"
	aru_text = "Toggle 2D"
	ard_text = "Profiler"
	all_text = "Set Player\\b6"
	alr_text = "\\b5Reset Camera"
	alu_text = "Kill Splats"
	ald_text = "Model Viewer"
}
select_text = root_text

script set_select_text \{text = $root_text}
	change all_text = (<text>.all_text)
	change alr_text = (<text>.alr_text)
	change alu_text = (<text>.alu_text)
	change ald_text = (<text>.ald_text)
	change arl_text = (<text>.arl_text)
	change arr_text = (<text>.arr_text)
	change aru_text = (<text>.aru_text)
	change ard_text = (<text>.ard_text)
	change select_text = <text>
	refresh_analog_options
endscript

script refresh_analog_options 
	hide_analog_options
	show_analog_options
endscript

script userselectselect 
	if infrontend
		return
	endif
	if isobserving
		return
	endif
	if issurveying
		return
	endif
	if screenelementexists id = current_menu_anchor
		return
	endif
	if screenelementexists id = root_window
		if root_window :getsingletag menu_state
			if (<menu_state> = on)
				return
			endif
		endif
	endif
	if screenelementexists id = videophone_notification
		return
	endif
	if objectexists id = skatercam0
		switch skater_cam_0_mode
			case 1
			change skater_cam_0_mode = 2
			case 2
			change skater_cam_0_mode = 3
			case 3
			change skater_cam_0_mode = 4
			case 4
			change skater_cam_0_mode = 1
		endswitch
		skatercam0 :sc_setmode mode = skater_cam_0_mode
	endif
endscript

script userselectselect2 
	if infrontend
		return
	endif
	if isobserving
		return
	endif
	if issurveying
		return
	endif
	if screenelementexists id = current_menu_anchor
		return
	endif
	if screenelementexists id = root_window
		if root_window :getsingletag menu_state
			if (<menu_state> = on)
				return
			endif
		endif
	endif
	if objectexists id = skatercam1
		switch skater_cam_1_mode
			case 1
			change skater_cam_1_mode = 2
			case 2
			change skater_cam_1_mode = 3
			case 3
			change skater_cam_1_mode = 4
			case 4
			change skater_cam_1_mode = 1
		endswitch
		skatercam1 :sc_setmode mode = skater_cam_1_mode
	endif
endscript
view_mode = 0
render_mode = 0
wireframe_mode = 0
drop_in_car = 0
drop_in_car_setup = minibajacarsetup

script userselecttriangle 
	if ($view_mode = 1)
		return
	endif
	if ($screenshotmode = 0)
		change screenshotmode = 1
		<text> = "ScreenShot Paused"
	else
		change screenshotmode = 0
		<text> = "ScreenShot Unpaused"
	endif
	if screenelementexists id = center_tri
		setscreenelementprops {
			id = center_tri
			text = <text>
		}
	endif
	return
	if notcd
		switch $render_mode
			case 0
			change render_mode = 1
			show_wireframe_mode
			case 1
			change render_mode = 2
			show_wireframe_mode
			case 2
			change render_mode = 3
			toggle_wireframe_skins
			case 3
			change render_mode = 4
			toggle_wireframe_skins
			case 4
			change render_mode = 0
			toggle_wireframe_skins
		endswitch
		if (($render_mode = 3) || ($render_mode = 4))
			setrendermode mode = 0
		else
			setrendermode mode = $render_mode
		endif
	endif
endscript
viewer_taking_screenshot = 0

script do_screenshot 
	change \{viewer_taking_screenshot = 1}
	hide_analog_options
	if toggle2d \{off}
		wait \{2
			frames}
		hide_analog_options
		wait \{2
			frames}
		screenshot
		wait \{2
			frames}
		toggle2d \{on}
		change \{viewer_taking_screenshot = 0}
	else
		wait \{2
			frames}
		hide_analog_options
		wait \{2
			frames}
		screenshot
		wait \{2
			frames}
		change \{viewer_taking_screenshot = 0}
	endif
endscript

script userselectsquare 
	if notcd
		spawnscriptlater \{do_screenshot}
	endif
endscript

script userselectcircle 
	if gamemodeequals is_mocap
		return
	endif
	if ($render_mode)
		if notcd
			switch wireframe_mode
				case 0
				change wireframe_mode = 1
				case 1
				change wireframe_mode = 2
				case 2
				change wireframe_mode = 3
				case 3
				change wireframe_mode = 4
				case 4
				change wireframe_mode = 5
				case 5
				change wireframe_mode = 6
				case 6
				change wireframe_mode = 0
			endswitch
			setwireframemode mode = wireframe_mode
			show_wireframe_mode
		endif
	else
		viewer_cam :obj_getposition
		vectorlength vector = <pos>
		if (<length> < 2.0)
			return
		endif
		viewer_cam :obj_getorientation
		dir = ((-1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, -1.0) * <z>)
		unpauseskaters 0
		getskaterid
		<objid> :obj_setorientation dir = <dir>
		<objid> :TeleportSkaterToNode pos = (<pos> + <dir>) KillRagdoll
		<objid> :setspeed 2.5
		<objid> :anim_enable
		restore_skater_camera
		getskatercam
		<skatercam> :obj_setorientation dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
		if ($view_mode)
			change view_mode = 0
			toggleviewmode no_reload
			toggleviewmode no_reload
			toggleviewmode no_reload
			if skater :walking
				MakeSkaterGoto SkaterInit params = {walk}
			else
				MakeSkaterGoto SkaterInit
			endif
		endif
	endif
endscript

script userselectstart 
	if notcd
		change \{render_mode = 0}
		setrendermode \{mode = $render_mode}
		togglepass \{pass = 0}
	endif
endscript

script show_analog_options 
	if ($viewer_taking_screenshot = 1)
		return
	endif
	if NOT screenelementexists id = viewer_options_anchor
		setscreenelementlock id = root_window off
		createscreenelement {
			id = viewer_options_anchor
			type = containerelement
			parent = root_window
			just = [center bottom]
			pos = (640.0, 720.0)
			alpha = 0
			z_priority = 6000
		}
		doscreenelementmorph id = viewer_options_anchor alpha = 1 time = 0.25
		createscreenelement {
			id = viewer_options_bg
			type = spriteelement
			parent = viewer_options_anchor
			dims = (1280.0, 160.0)
			pos = (0.0, 10.0)
			just = [center bottom]
			rgba = [0 0 0 128]
		}
		createscreenelement {
			id = left_anchor
			type = containerelement
			parent = viewer_options_anchor
			scale = (1.6, 1.4)
			pos = (-300.0, -90.0)
			just = [left top]
		}
		createscreenelement {
			id = analog_l_l
			type = textelement
			parent = left_anchor
			font = text_a1
			text = $all_text
			scale = 0.4
			pos = (0.0, 0.0)
			just = [right center]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_l_r
			type = textelement
			parent = left_anchor
			font = text_a1
			text = $alr_text
			scale = 0.4
			pos = (0.0, 0.0)
			just = [left center]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_l_t_button
			type = textelement
			parent = left_anchor
			font = text_a1
			text = "\\b7"
			scale = 0.4
			pos = (0.0, 0.0)
			just = [center bottom]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_l_t
			type = textelement
			parent = left_anchor
			font = text_a1
			text = $alu_text
			scale = 0.4
			pos = (0.0, -14.0)
			just = [center bottom]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_l_b_button
			type = textelement
			parent = left_anchor
			font = text_a1
			text = "\\b4"
			scale = 0.4
			pos = (0.0, 0.0)
			just = [center top]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_l_b
			type = textelement
			parent = left_anchor
			font = text_a1
			text = $ald_text
			scale = 0.4
			pos = (0.0, 16.0)
			just = [center top]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = right_anchor
			type = containerelement
			parent = viewer_options_anchor
			scale = 1.0
			pos = (0.0, -90.0)
			just = [left top]
			scale = (1.6, 1.4)
		}
		createscreenelement {
			id = analog_r_l
			type = textelement
			parent = right_anchor
			font = text_a1
			text = $arl_text
			scale = 0.4
			pos = (0.0, 0.0)
			just = [right center]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_r_r
			type = textelement
			parent = right_anchor
			font = text_a1
			text = $arr_text
			scale = 0.4
			pos = (0.0, 0.0)
			just = [left center]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_r_t_button
			type = textelement
			parent = right_anchor
			font = text_a1
			text = "\\b7"
			scale = 0.4
			pos = (0.0, 0.0)
			just = [center bottom]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_r_t
			type = textelement
			parent = right_anchor
			font = text_a1
			text = $aru_text
			scale = 0.4
			pos = (0.0, -14.0)
			just = [center bottom]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_r_b_button
			type = textelement
			parent = right_anchor
			font = text_a1
			text = "\\b4"
			scale = 0.4
			pos = (0.0, 0.0)
			just = [center top]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = analog_r_b
			type = textelement
			parent = right_anchor
			font = text_a1
			text = $ard_text
			scale = 0.4
			pos = (0.0, 16.0)
			just = [center top]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = center_anchor
			type = containerelement
			parent = viewer_options_anchor
			scale = 1.0
			pos = (320.0, -90.0)
			just = [left top]
			scale = (1.6, 1.4)
		}
		createscreenelement {
			id = center_square
			type = textelement
			parent = center_anchor
			font = text_a1
			text = "Screen\\b1"
			scale = 0.4
			pos = (-8.0, 0.0)
			just = [right center]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = center_circle
			type = textelement
			parent = center_anchor
			font = text_a1
			text = "\\b2Drop"
			scale = 0.4
			pos = (8.0, 0.0)
			just = [left center]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = center_tri_button
			type = textelement
			parent = center_anchor
			font = text_a1
			text = "\\b0"
			scale = 0.4
			pos = (0.0, 0.0)
			just = [center bottom]
			rgba = [200 200 200 255]
		}
		if ($screenshotmode = 0)
			<text> = "ScreenShot Unpaused"
		else
			<text> = "ScreenShot Paused"
		endif
		createscreenelement {
			id = center_tri
			type = textelement
			parent = center_anchor
			font = text_a1
			text = <text>
			scale = 0.4
			pos = (0.0, -14.0)
			just = [center bottom]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = center_x_button
			type = textelement
			parent = center_anchor
			font = text_a1
			text = "\\b3"
			scale = 0.4
			pos = (0.0, 0.0)
			just = [center top]
			rgba = [200 200 200 255]
		}
		createscreenelement {
			id = center_x
			type = textelement
			parent = center_anchor
			font = text_a1
			text = "Viewer"
			scale = 0.4
			pos = (0.0, 16.0)
			just = [center top]
			rgba = [200 200 200 255]
		}
		setscreenelementlock id = root_window on
	endif
endscript

script hide_analog_options 
	if screenelementexists \{id = viewer_options_anchor}
		destroyscreenelement \{id = viewer_options_anchor}
	endif
endscript

script toggleviewmode 
	switch $view_mode
		case 0
		setsavezonenametocurrent
		setanalogstickactiveformenus 0
		change view_mode = 1
		setenablemovies 0
		skater :spawnterrainsound action = stopsounds
		unpausespawnedscript update_crowd_model_cam
		case 1
		change view_mode = 2
		case 2
		if NOT gotparam no_reload
			getsavezonename
			setpakmancurrentblock map = zones pakname = <save_zone>
		endif
		change view_mode = 0
		setanalogstickactiveformenus 1
		viewer_cam :sethfov hfov = ($camera_fov)
		setenablemovies 1
	endswitch
	setviewmode $view_mode
endscript
newscreenshotmode = 0

script userselectx 
	if istrue $soft_assert_active
		return
	endif
	change viewer_rotation_angle = 0
	toggleviewmode
	switch_to_env_speed
	if ($view_mode = 1)
		set_viewer_speed
	endif
	if gamemodeequals is_mocap
		skater :mocap_suspend
	endif
	if ($newscreenshotmode)
		skater :obj_killspawnedscript name = Screenshot_SkaterMover
		skater :obj_spawnscriptnow Screenshot_SkaterMover
		if ($view_mode = 1)
			skater :anim_enable off
		else
			skater :anim_enable
		endif
	endif
endscript

script Screenshot_SkaterMover 
	begin
	if held circle
		if held up
			skater :rotate y = -5
		endif
		if held down
			skater :rotate y = 5
		endif
	else
		if held triangle
			if held up
				skater :move x = 0.01
			endif
			if held down
				skater :move x = -0.01
			endif
		else
			if held up
				skater :move y = 0.01
			endif
			if held down
				skater :move y = -0.01
			endif
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script userselectrightanalogup 
	toggle2d
endscript

script userselectrightanalogdown 
	togglemetrics
endscript
pak_mode = 0

script userselectrightanalogleft 
	change pak_mode = ($pak_mode + 1)
	if ($pak_mode = 3)
		change \{pak_mode = 0}
	endif
	switch $pak_mode
		case 0
		change \{showpakmap = 0}
		change \{showpakmapexpand = 0}
		case 1
		change \{showpakmap = 1}
		change \{showpakmapexpand = 0}
		case 2
		change \{showpakmap = 1}
		change \{showpakmapexpand = 1}
	endswitch
endscript
toggle_nav_view_mode = 0

script userselectrightanalogright 
	toggleaidebugmenu
endscript

script userselectleftanalogup 
	killtexturesplats \{all}
	preallocsplats
endscript

script userselectleftanalogdown 
	if NOT screenelementexists \{id = view_models_menu}
		set_select_text \{text = $modelviewer_text}
	else
		set_select_text \{text = $root_text}
	endif
	switch_to_obj_speed
	toggle_model_viewer
	if screenelementexists \{id = view_models_menu}
		set_viewer_speed
	endif
endscript

script userselectleftanalogleft 
	if screenelementexists \{id = view_models_menu}
		set_player_to_model
	endif
endscript

script userselectleftanalogright 
	if screenelementexists \{id = view_models_menu}
		resetmodelviewercamera
	endif
endscript
viewer_rotation_angle = 0

script userviewerx 
	if ($viewer_rotation_angle = 0)
		change viewer_rotation_angle = 1
		centercamera scale = 0.5 y = -45
	else
		if ($viewer_rotation_angle = 1)
			centercamera scale = 0.5 y = -135
			change viewer_rotation_angle = 2
		else
			if ($viewer_rotation_angle = 2)
				change viewer_rotation_angle = 3
				centercamera scale = 0.5 y = -225
			else
				if ($viewer_rotation_angle = 3)
					change viewer_rotation_angle = 0
					centercamera scale = 0.5 y = -315
				endif
			endif
		endif
	endif
endscript

script userviewersquare 
	if ($viewer_rotation_angle = 0)
		change viewer_rotation_angle = 1
		centercamera x = -10 y = -90 scale = 0.7
	else
		if ($viewer_rotation_angle = 1)
			centercamera x = -10 y = -180 scale = 0.7
			change viewer_rotation_angle = 2
		else
			if ($viewer_rotation_angle = 2)
				change viewer_rotation_angle = 3
				centercamera x = -10 y = -270 scale = 0.7
			else
				if ($viewer_rotation_angle = 3)
					change viewer_rotation_angle = 0
					centercamera x = -10 y = 0 scale = 0.7
				endif
			endif
		endif
	endif
endscript
viewer_move_mode = 1
obj_viewer_move_mode = 0
env_viewer_move_mode = 2
viewer_speed = env
user_viewer_triangle_tod = 1

script userviewertriangle 
endscript

script switch_to_env_speed 
	change viewer_move_mode = ($env_viewer_move_mode)
	change \{viewer_speed = env}
endscript

script switch_to_obj_speed 
	change viewer_move_mode = ($obj_viewer_move_mode)
	change \{viewer_speed = obj}
endscript

script set_viewer_speed 
	switch $viewer_move_mode
		case 0
		setmovementvelocity 2.5
		setrotatevelocity 50
		create_panel_message id = viewermovemode text = "1 Super Slow cam" pos = (640.0, 84.0) rgba = [100 0 0 255]
		case 1
		setmovementvelocity 6
		setrotatevelocity 80
		create_panel_message id = viewermovemode text = "2 Slow cam" pos = (640.0, 84.0) rgba = [192 100 0 255]
		case 2
		setmovementvelocity 18
		setrotatevelocity 120
		create_panel_message id = viewermovemode text = "3 Medium cam" pos = (640.0, 84.0) rgba = [128 128 0 255]
		case 3
		setmovementvelocity 43
		setrotatevelocity 160
		create_panel_message id = viewermovemode text = "4 Medium Fast cam" pos = (640.0, 84.0) rgba = [192 192 0 255]
		case 4
		setmovementvelocity 127
		setrotatevelocity 200
		create_panel_message id = viewermovemode text = "5 Fast cam" pos = (640.0, 84.0) rgba = [0 192 0 255]
	endswitch
	if ($viewer_speed = env)
		change env_viewer_move_mode = ($viewer_move_mode)
	else
		change obj_viewer_move_mode = ($viewer_move_mode)
	endif
endscript

script userviewerl1 
	change \{viewer_rotation_angle = 0}
	switch $viewer_move_mode
		case 0
		change \{viewer_move_mode = 1}
		case 1
		change \{viewer_move_mode = 2}
		case 2
		change \{viewer_move_mode = 3}
		case 3
		change \{viewer_move_mode = 4}
		case 4
		change \{viewer_move_mode = 0}
	endswitch
	set_viewer_speed
endscript

script userviewerl2 
	change \{viewer_rotation_angle = 0}
	switch $viewer_move_mode
		case 0
		change \{viewer_move_mode = 4}
		case 1
		change \{viewer_move_mode = 0}
		case 2
		change \{viewer_move_mode = 1}
		case 3
		change \{viewer_move_mode = 2}
		case 4
		change \{viewer_move_mode = 3}
	endswitch
	set_viewer_speed
endscript

script show_wireframe_mode 
	switch wireframe_mode
		case 0
		wireframe_message text = "Wireframe : Face Flags"
		case 1
		wireframe_message text = "Wireframe : Poly Density"
		case 2
		wireframe_message text = "Wireframe : Low Poly Highlight"
		case 3
		wireframe_message text = "Wireframe : Unique object colors"
		case 4
		wireframe_message text = "Wireframe : Renderable Unique MESH colors"
		case 5
		wireframe_message text = "Wireframe : Renderable MESH vertex density"
		case 6
		wireframe_message text = "Wireframe : Occlusion Map"
	endswitch
endscript

script wireframe_message \{text = "Wireframe"}
	create_panel_message text = <text> id = wireframe_mess rgba = [200 128 128 128] pos = (20.0, 340.0) just = [left center] scale = 5 style = wireframe_style
endscript

script wireframe_style 
	domorph \{time = 0
		scale = (1.0, 1.0)}
	domorph \{time = 3
		scale = (1.0, 1.0)}
	domorph \{time = 1
		alpha = 0}
	die
endscript

script viewerleft 
	viewer_cam :gethfov
	hfov = (<hfov> + 1)
	if (<hfov> > 150)
		hfov = 150
	endif
	viewer_cam :sethfov hfov = <hfov>
	viewer_print_debug_info
endscript

script viewerright 
	viewer_cam :gethfov
	hfov = (<hfov> -1)
	if (<hfov> < 5)
		hfov = 5
	endif
	viewer_cam :sethfov hfov = <hfov>
	viewer_print_debug_info
endscript

script viewerup 
	if NOT skatercamanimfinished
		return
	endif
endscript

script viewerdown 
	if NOT skatercamanimfinished
		return
	endif
endscript

script viewer_print_debug_info 
endscript
