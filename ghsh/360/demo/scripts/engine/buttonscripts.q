select_shift = 0
memcard_screenshots = 0
skater_cam_0_mode = 2
skater_cam_1_mode = 2
screenshotmode = 0
disable_screenshots = 0
alternate_viewer_hud_behavior = 0
arl_text = qs(0xfa6448fa)
arr_text = qs(0x1994c5f0)
aru_text = qs(0xe2af40e0)
ard_text = qs(0xb4520bf6)
all_text = qs(0x56ec18ea)
alr_text = qs(0xebf66988)
alu_text = qs(0x1a0d9384)
ald_text = qs(0xc078ff16)
root_text = {
	arl_text = qs(0xfa6448fa)
	arr_text = qs(0x1994c5f0)
	aru_text = qs(0xe2af40e0)
	ard_text = qs(0xb4520bf6)
	all_text = qs(0x56ec18ea)
	alr_text = qs(0xebf66988)
	alu_text = qs(0x1a0d9384)
	ald_text = qs(0xc078ff16)
}
modelviewer_text = {
	arl_text = qs(0xfa6448fa)
	arr_text = qs(0xe1145bb2)
	aru_text = qs(0xe2af40e0)
	ard_text = qs(0xb4520bf6)
	all_text = qs(0x21114c03)
	alr_text = qs(0x6d6e0b45)
	alu_text = qs(0x1a0d9384)
	ald_text = qs(0xc078ff16)
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
	if screenelementexists \{id = current_menu_anchor}
		return
	endif
	if screenelementexists \{id = root_window}
		if root_window :getsingletag \{menu_state}
			if (<menu_state> = on)
				return
			endif
		endif
	endif
	if screenelementexists \{id = videophone_notification}
		return
	endif
	if objectexists \{id = skatercam0}
		switch skater_cam_0_mode
			case 1
			change \{skater_cam_0_mode = 2}
			case 2
			change \{skater_cam_0_mode = 3}
			case 3
			change \{skater_cam_0_mode = 4}
			case 4
			change \{skater_cam_0_mode = 1}
		endswitch
		skatercam0 :sc_setmode \{mode = skater_cam_0_mode}
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
	if screenelementexists \{id = current_menu_anchor}
		return
	endif
	if screenelementexists \{id = root_window}
		if root_window :getsingletag \{menu_state}
			if (<menu_state> = on)
				return
			endif
		endif
	endif
	if objectexists \{id = skatercam1}
		switch skater_cam_1_mode
			case 1
			change \{skater_cam_1_mode = 2}
			case 2
			change \{skater_cam_1_mode = 3}
			case 3
			change \{skater_cam_1_mode = 4}
			case 4
			change \{skater_cam_1_mode = 1}
		endswitch
		skatercam1 :sc_setmode \{mode = skater_cam_1_mode}
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
		change \{screenshotmode = 1}
		<text> = qs(0x6e88b80c)
	else
		change \{screenshotmode = 0}
		<text> = qs(0x20ffabb3)
	endif
	if screenelementexists \{id = center_tri}
		setscreenelementprops {
			id = center_tri
			text = <text>
		}
	endif
	return
	if notcd
		switch $render_mode
			case 0
			change \{render_mode = 1}
			show_wireframe_mode
			case 1
			change \{render_mode = 2}
			show_wireframe_mode
			case 2
			change \{render_mode = 3}
			toggle_wireframe_skins
			case 3
			change \{render_mode = 4}
			toggle_wireframe_skins
			case 4
			change \{render_mode = 0}
			toggle_wireframe_skins
		endswitch
		if (($render_mode = 3) || ($render_mode = 4))
			setrendermode \{mode = 0}
		else
			setrendermode \{mode = $render_mode}
		endif
	endif
endscript
viewer_taking_screenshot = 0

script do_screenshot \{hires = 0}
	change \{viewer_taking_screenshot = 1}
	hide_analog_options
	if toggle2d \{off}
		wait \{2
			frames}
		hide_analog_options
		wait \{2
			frames}
		if (<hires> = 1)
			spawnhiresscreenshot \{scale = 2}
			block \{type = hires_screenshot_finished}
		else
			screenshot
		endif
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
		if (<hires> = 1)
			spawnhiresscreenshot \{scale = 2}
			block \{type = hires_screenshot_finished}
		else
			screenshot
		endif
		wait \{2
			frames}
		change \{viewer_taking_screenshot = 0}
	endif
endscript

script userselectsquare 
	if ($enable_button_cheats = 1)
		spawnscriptlater \{do_screenshot}
	endif
endscript

script userselectcircle 
	if ($render_mode)
		if notcd
			switch wireframe_mode
				case 0
				change \{wireframe_mode = 1}
				case 1
				change \{wireframe_mode = 2}
				case 2
				change \{wireframe_mode = 3}
				case 3
				change \{wireframe_mode = 4}
				case 4
				change \{wireframe_mode = 5}
				case 5
				change \{wireframe_mode = 6}
				case 6
				change \{wireframe_mode = 0}
			endswitch
			setwireframemode \{mode = wireframe_mode}
			show_wireframe_mode
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
debug_show_analog_options = 1

script show_analog_options 
	if ($viewer_taking_screenshot = 1)
		return
	endif
	if ($profiling_cameracuts = true)
		return
	endif
	if ($debug_show_analog_options = 0)
		return
	endif
	if NOT screenelementexists \{id = viewer_options_anchor}
		setscreenelementlock \{id = root_window
			off}
		createscreenelement \{id = viewer_options_anchor
			type = containerelement
			parent = root_window
			pos = (0.0, 0.0)
			z_priority = 6000}
		createscreenelement \{id = viewer_options_bg
			type = spriteelement
			parent = viewer_options_anchor
			dims = (1280.0, 160.0)
			pos = (0.0, 20.0)
			just = [
				left
				top
			]
			rgba = [
				0
				0
				0
				255
			]
			alpha = 0.3}
		createscreenelement \{id = left_anchor
			type = containerelement
			parent = viewer_options_anchor
			scale = 1.0
			pos = (256.0, 96.0)
			just = [
				left
				top
			]}
		createscreenelement \{id = analog_l_l
			type = textelement
			parent = left_anchor
			font = debug
			text = $all_text
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				right
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_l_r
			type = textelement
			parent = left_anchor
			font = debug
			text = $alr_text
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				left
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_l_t_button
			type = textelement
			parent = left_anchor
			font = debug
			text = qs(0xbb0b71dd)
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_l_t
			type = textelement
			parent = left_anchor
			font = debug
			text = $alu_text
			scale = 0.8
			pos = (0.0, -28.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_l_b_button
			type = textelement
			parent = left_anchor
			font = debug
			text = qs(0x9026221e)
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_l_b
			type = textelement
			parent = left_anchor
			font = debug
			text = $ald_text
			scale = 0.8
			pos = (0.0, 32.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = right_anchor
			type = containerelement
			parent = viewer_options_anchor
			scale = 1.0
			pos = (1024.0, 96.0)
			just = [
				left
				top
			]}
		createscreenelement \{id = analog_r_l
			type = textelement
			parent = right_anchor
			font = debug
			text = $arl_text
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				right
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_r_r
			type = textelement
			parent = right_anchor
			font = debug
			text = $arr_text
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				left
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_r_t_button
			type = textelement
			parent = right_anchor
			font = debug
			text = qs(0xbb0b71dd)
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_r_t
			type = textelement
			parent = right_anchor
			font = debug
			text = $aru_text
			scale = 0.8
			pos = (0.0, -28.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_r_b_button
			type = textelement
			parent = right_anchor
			font = debug
			text = qs(0x9026221e)
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = analog_r_b
			type = textelement
			parent = right_anchor
			font = debug
			text = $ard_text
			scale = 0.8
			pos = (0.0, 32.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = center_anchor
			type = containerelement
			parent = viewer_options_anchor
			scale = 1.0
			pos = (640.0, 96.0)
			just = [
				left
				top
			]}
		createscreenelement \{id = center_square
			type = textelement
			parent = center_anchor
			font = debug
			text = qs(0x3c0326f0)
			scale = 0.8
			pos = (-16.0, 0.0)
			just = [
				right
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = center_circle
			type = textelement
			parent = center_anchor
			font = debug
			text = qs(0x9bb944ae)
			scale = 0.8
			pos = (16.0, 0.0)
			just = [
				left
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = center_tri_button
			type = textelement
			parent = center_anchor
			font = debug
			text = qs(0xf44ae71a)
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		if ($screenshotmode = 0)
			<text> = qs(0x20ffabb3)
		else
			<text> = qs(0x6e88b80c)
		endif
		createscreenelement {
			id = center_tri
			type = textelement
			parent = center_anchor
			font = debug
			text = <text>
			scale = 0.8
			pos = (0.0, -16.0)
			just = [center bottom]
			rgba = [100 100 100 255]
		}
		createscreenelement \{id = center_x_button
			type = textelement
			parent = center_anchor
			font = debug
			text = qs(0xdf67b4d9)
			scale = 0.8
			pos = (0.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		createscreenelement \{id = center_x
			type = textelement
			parent = center_anchor
			font = debug
			text = qs(0x761a966f)
			scale = 0.8
			pos = (0.0, 32.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		setscreenelementlock \{id = root_window
			on}
	endif
endscript

script hide_analog_options 
	if screenelementexists \{id = viewer_options_anchor}
		destroyscreenelement \{id = viewer_options_anchor}
	endif
endscript
toggleviewmode_enabled = false

script toggleviewmode 
	if ($toggleviewmode_enabled = false)
		return
	endif
	switch $view_mode
		case 0
		getviewportcamerapos \{viewport = bg_viewport}
		getviewportcameraorient \{viewport = bg_viewport}
		change \{viewercam_nofail = 1}
		setsavezonenametocurrent
		setanalogstickactiveformenus \{0}
		change \{view_mode = 1}
		setenablemovies \{0}
		makegemsvisibleonallviewports
		if NOT userviewerinfe
			pausegh3
		else
			switch_to_obj_speed
			set_viewer_speed
		endif
		unpausespawnedscript \{update_crowd_model_cam}
		disable_bg_viewport
		enable_crowd_models_cfunc \{active = true}
		hide_hud
		case 1
		change \{view_mode = 2}
		case 2
		change \{viewercam_nofail = 0}
		if NOT ($autolaunch_cas_artist = 1)
			if NOT gotparam \{no_reload}
				getsavezonename
				setpakmancurrentblock map = zones pakname = <save_zone>
			endif
		endif
		change \{view_mode = 0}
		setanalogstickactiveformenus \{1}
		viewer_cam :sethfov hfov = ($camera_fov)
		setenablemovies \{1}
		show_hud
		enable_bg_viewport
		unpausegh3
		if userviewerinfe
			disable_pause
		else
			enable_pause
		endif
	endswitch
	setviewmode \{$view_mode}
	if ($view_mode = 1)
		if NOT gotparam \{viewerreload}
			setviewportcameraorient viewport = bg_viewport at = <at> left = <left> up = <up>
			setviewportcamerapos viewport = bg_viewport pos = <pos>
		endif
	endif
	if ($view_mode = 2)
		toggleviewmode
	endif
endscript

script userselectx 
	if isguitarcontroller \{controller = 0}
		userselectleftanalogup
		return
	endif
	if isdrumcontroller \{controller = 0}
		userselectleftanalogup
		return
	endif
	if istrue \{$soft_assert_active}
		return
	endif
	change \{viewer_rotation_angle = 0}
	toggleviewmode
	switch_to_env_speed
	if ($view_mode = 1)
		set_viewer_speed
	endif
	if ($show_battle_text = 1)
		change \{show_battle_text = 0}
	else
		change \{show_battle_text = 1}
	endif
endscript

script userselectrightanalogup 
	if ($objviewer_light_test = 1)
		lightshow_cyclenextsnapshot \{usesnapshotpositions = true
			save = true}
	else
		lightshow_debugcycle
	endif
endscript

script userselectrightanalogdown 
	togglemetrics
endscript

script flip_crowd_debug_mode 
	if ($crowd_debug_mode = 1)
		change \{crowd_debug_mode = 0}
	else
		change \{crowd_debug_mode = 1}
	endif
endscript
pak_mode = 0
debug_encore = 0

script userselectrightanalogleft 
	change \{current_transition = preencore}
	change \{debug_encore = 1}
	setglobaltags \{progression
		params = {
			encore_song = beastandtheharlot
		}}
	userselectleftanalogup <...>
endscript
toggle_nav_view_mode = 0

script userselectrightanalogright 
	pos = (1000.0, 170.0)
	if ($debug_forcescore = off)
		change \{debug_forcescore_dir = up}
		change \{debug_forcescore = poor}
		create_panel_message text = qs(0x43c6fab9) pos = <pos> id = autoplay
	elseif ($debug_forcescore = poor &&
			$debug_forcescore_dir = up)
		change \{debug_forcescore = medium}
		create_panel_message text = qs(0x97004065) pos = <pos> id = autoplay
	elseif ($debug_forcescore = medium &&
			$debug_forcescore_dir = up)
		change \{debug_forcescore = good}
		create_panel_message text = qs(0x2920775c) pos = <pos> id = autoplay
	elseif ($debug_forcescore = good)
		change \{debug_forcescore_dir = down}
		change \{debug_forcescore = medium}
		create_panel_message text = qs(0x97004065) pos = <pos> id = autoplay
	elseif ($debug_forcescore = medium &&
			$debug_forcescore_dir = down)
		change \{debug_forcescore = poor}
		create_panel_message text = qs(0x43c6fab9) pos = <pos> id = autoplay
	elseif ($debug_forcescore = poor &&
			$debug_forcescore_dir = down)
		change \{debug_forcescore = off}
		create_panel_message text = qs(0x7234ebca) pos = <pos> id = autoplay
	endif
	crowdincrease \{player_status = player1_status}
endscript

script userselectleftanalogup 
	calc_songscoreinfo
	cutoff = ($star_rating_cutoffs.star5 [0])
	if ($debug_forcescore = off)
		change structurename = player1_status score = ($player1_status.base_score * <cutoff> + 1)
		change structurename = player1_status total_notes = ($player1_status.max_notes)
		change structurename = player1_status notes_hit = ($player1_status.total_notes)
		change structurename = band1_status score = ($player1_status.base_score * <cutoff> + 1)
	elseif ($debug_forcescore = poor)
		change structurename = player1_status score = ($player1_status.base_score / 2 + 1)
		change structurename = band1_status score = ($player1_status.base_score / 2 + 1)
	elseif ($debug_forcescore = medium)
		change structurename = player1_status score = ($player1_status.base_score + 1)
		change structurename = band1_status score = ($player1_status.base_score + 1)
	elseif ($debug_forcescore = good)
		change structurename = player1_status score = ($player1_status.base_score * <cutoff> + 1)
		change structurename = player1_status total_notes = ($player1_status.max_notes)
		change structurename = player1_status notes_hit = ($player1_status.total_notes)
		change structurename = band1_status score = ($player1_status.base_score * <cutoff> + 1)
	endif
	if ($game_mode = training)
		finish_practice_song
	else
		guitarevent_songwon
	endif
endscript

script userselectleftanalogdown 
	if ($enable_button_cheats = 1)
		spawnscriptlater \{do_screenshot
			params = {
				hires = 1
			}}
	endif
endscript

script userselectleftanalogleft 
	if screenelementexists \{id = view_models_menu}
		set_player_to_model
	else
		spawnscriptnow \{profile_camera_cuts}
	endif
endscript

script userselectleftanalogright 
	if screenelementexists \{id = view_models_menu}
		resetmodelviewercamera
	endif
endscript
viewer_rotation_angle = 0

script userviewerx 
endscript

script userviewersquare 
	if (($cas_free_cam_active) = 1)
		if ($viewer_rotation_angle = 0)
			change \{viewer_rotation_angle = 1}
			centercamera \{x = -10
				y = -90
				scale = 0.7}
		else
			if ($viewer_rotation_angle = 1)
				centercamera \{x = -10
					y = -180
					scale = 0.7}
				change \{viewer_rotation_angle = 2}
			else
				if ($viewer_rotation_angle = 2)
					change \{viewer_rotation_angle = 3}
					centercamera \{x = -10
						y = -270
						scale = 0.7}
				else
					if ($viewer_rotation_angle = 3)
						change \{viewer_rotation_angle = 0}
						centercamera \{x = -10
							y = 0
							scale = 0.7}
					endif
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
	if (($cas_free_cam_active) = 1)
		if ($viewer_rotation_angle = 0)
			change \{viewer_rotation_angle = 1}
			centercamera \{scale = 0.5
				y = -45}
		else
			if ($viewer_rotation_angle = 1)
				centercamera \{scale = 0.5
					y = -135}
				change \{viewer_rotation_angle = 2}
			else
				if ($viewer_rotation_angle = 2)
					change \{viewer_rotation_angle = 3}
					centercamera \{scale = 0.5
						y = -225}
				else
					if ($viewer_rotation_angle = 3)
						change \{viewer_rotation_angle = 0}
						centercamera \{scale = 0.5
							y = -315}
					endif
				endif
			endif
		endif
	endif
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
		setmovementvelocity \{2.5}
		setrotatevelocity \{50}
		create_panel_message \{id = viewermovemode
			text = qs(0x4028308f)
			pos = (320.0, 84.0)
			rgba = [
				128
				0
				0
				255
			]}
		case 1
		setmovementvelocity \{6}
		setrotatevelocity \{80}
		create_panel_message \{id = viewermovemode
			text = qs(0xd1a924c7)
			pos = (320.0, 84.0)
			rgba = [
				255
				128
				0
				255
			]}
		case 2
		setmovementvelocity \{18}
		setrotatevelocity \{120}
		create_panel_message \{id = viewermovemode
			text = qs(0x1bc03998)
			pos = (320.0, 84.0)
			rgba = [
				200
				200
				0
				255
			]}
		case 3
		setmovementvelocity \{43}
		setrotatevelocity \{160}
		create_panel_message \{id = viewermovemode
			text = qs(0xe32ca150)
			pos = (320.0, 84.0)
			rgba = [
				255
				255
				0
				255
			]}
		case 4
		setmovementvelocity \{127}
		setrotatevelocity \{200}
		create_panel_message \{id = viewermovemode
			text = qs(0xf94c0af9)
			pos = (320.0, 84.0)
			rgba = [
				0
				255
				0
				255
			]}
	endswitch
	if ($viewer_speed = env)
		change env_viewer_move_mode = ($viewer_move_mode)
	else
		change obj_viewer_move_mode = ($viewer_move_mode)
	endif
endscript

script userviewerl1 
	if userviewerinfe
		return
	endif
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
	if userviewerinfe
		return
	endif
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

script userviewerinfe 
	if ($cas_heap_state = in_cas)
		return \{true}
	endif
	fe_asset_name = `zones/z_frontend/z_frontend.scn`
	if isassetloaded name = <fe_asset_name>
		return \{true}
	endif
	return \{false}
endscript

script show_wireframe_mode 
	switch wireframe_mode
		case 0
		wireframe_message \{text = qs(0xdfe67166)}
		case 1
		wireframe_message \{text = qs(0xd2c77ba0)}
		case 2
		wireframe_message \{text = qs(0x005bdf57)}
		case 3
		wireframe_message \{text = qs(0x996bfb67)}
		case 4
		wireframe_message \{text = qs(0x929d2efd)}
		case 5
		wireframe_message \{text = qs(0xd914aa8a)}
		case 6
		wireframe_message \{text = qs(0x52b5a4d5)}
	endswitch
endscript

script wireframe_message \{text = qs(0x3d6b48c8)}
	create_panel_message text = <text> id = wireframe_mess rgba = [200 128 128 128] pos = (20.0, 340.0) just = [left center] scale = 5 style = wireframe_style
endscript

script wireframe_style 
	legacydomorph \{time = 0
		scale = (1.0, 1.0)}
	legacydomorph \{time = 3
		scale = (1.0, 1.0)}
	legacydomorph \{time = 1
		alpha = 0}
	die
endscript

script viewerleft 
	if (($cas_free_cam_active) = 0)
		viewer_cam :gethfov
		hfov = (<hfov> + 1)
		if (<hfov> > 150)
			hfov = 150
		endif
		viewer_cam :sethfov hfov = <hfov>
		viewer_print_debug_info
	endif
endscript

script viewerright 
	if (($cas_free_cam_active) = 0)
		viewer_cam :gethfov
		hfov = (<hfov> -1)
		if (<hfov> < 5)
			hfov = 5
		endif
		viewer_cam :sethfov hfov = <hfov>
		viewer_print_debug_info
	endif
endscript

script viewerup 
	printf \{qs(0xe6609ef6)}
endscript

script viewerdown 
	printf \{qs(0xd7ab2617)}
endscript

script viewer_print_debug_info 
endscript
