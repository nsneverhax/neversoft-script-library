menu_select_practice_mode_font = fontgrid_title_gh3
training_mode = tutorials

script create_select_practice_mode_menu 
	change \{rich_presence_context = presence_main_menu}
	spawnscriptnow \{menu_music_on
		params = {
			setflag = 1
		}}
	createscreenelement {
		type = containerelement
		id = spm_container
		parent = root_window
		pos = (0.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = venue_bg}
	displaysprite \{texture = practice_poster_2
		id = spm_poster
		parent = spm_container
		pos = (640.0, 340.0)
		dims = (600.0, 600.0)
		rot_angle = -5
		just = [
			center
			center
		]}
	displaysprite \{tex = practice_typebar_1
		parent = spm_container
		pos = (710.0, 240.0)
		dims = (192.0, 75.0)
		rot_angle = -5
		just = [
			center
			center
		]
		rgba = [
			0
			0
			0
			255
		]
		z = 5}
	displaysprite \{tex = practice_typebar_2
		parent = spm_container
		pos = (555.0, 320.0)
		dims = (220.0, 75.0)
		rot_angle = -5
		just = [
			center
			center
		]
		rgba = [
			0
			0
			0
			255
		]
		z = 5}
	displaysprite \{tex = tape_h_02
		parent = spm_container
		pos = (775.0, 60.0)
		dims = (160.0, 64.0)
		rot_angle = -20
		just = [
			center
			center
		]
		z = 7}
	displaysprite {
		tex = tape_h_02
		parent = <id>
		pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 6
	}
	displaysprite \{tex = tape_h_02
		parent = spm_container
		pos = (500.0, 640.0)
		dims = (160.0, 64.0)
		rot_angle = 20
		just = [
			center
			center
		]
		z = 7
		flip_v}
	displaysprite {
		tex = tape_h_02
		parent = <id>
		pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 6
	}
	displaysprite \{tex = tape_v_02
		parent = spm_container
		pos = (430.0, 120.0)
		dims = (160.0, 96.0)
		rot_angle = 280
		just = [
			center
			center
		]
		z = 7}
	displaysprite {
		tex = tape_v_02
		parent = <id>
		pos = (-5.0, 5.0)
		rgba = [0 0 0 128]
		z = 6
	}
	createscreenelement \{type = textelement
		parent = spm_container
		id = tutorials_text
		text = 'tutorials'
		font = text_a6
		pos = (555.0, 312.0)
		scale = 0.7
		rot_angle = -5
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				switch_training_mode
			}
			{
				pad_down
				switch_training_mode
			}
			{
				pad_choose
				choose_training_mode
			}
			{
				pad_back
				ui_flow_manager_respond_to_action
				params = {
					action = go_back
				}
			}
		]
		z_priority = 10}
	displaytext \{id = practice_text
		parent = spm_container
		text = 'practice'
		font = text_a6
		pos = (715.0, 235.0)
		scale = 0.7
		just = [
			center
			center
		]
		rot = -5
		z = 10}
	displaytext \{parent = spm_container
		text = 'Select practice mode'
		font = text_a11
		scale = (0.85, 1.0)
		pos = (658.0, 541.0)
		rgba = [
			255
			195
			20
			255
		]
		rot = -5
		z = 10
		noshadow
		just = [
			center
			center
		]}
	fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = (320.0, 70.0)
	launchevent \{type = focus
		target = tutorials_text}
	update_training_menu
	player_device = ($primary_controller)
	if NOT (isguitarcontroller controller = <player_device>)
		if NOT ((isps3) && $enable_button_cheats = 1)
			change \{training_mode = practice}
			update_training_menu
		endif
	endif
	change \{user_control_pill_text_color = [
			255
			255
			255
			255
		]}
	change \{user_control_pill_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_scale = 0.6}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	player_device = ($primary_controller)
	if ((isguitarcontroller controller = <player_device>) || ((isps3) && $enable_button_cheats = 1))
		add_user_control_helper \{text = 'UP/DOWN'
			button = strumbar
			z = 100}
	endif
endscript

script destroy_select_practice_mode_menu 
	destroy_menu_backdrop
	clean_up_user_control_helpers
	destroy_menu \{menu_id = spm_container}
	destroy_menu \{menu_id = spm_scroll}
endscript

script switch_training_mode 
	player_device = ($primary_controller)
	if ((isguitarcontroller controller = <player_device>) || ((isps3) && $enable_button_cheats = 1))
		generic_menu_up_or_down_sound
		if ($training_mode = tutorials)
			change \{training_mode = practice}
		else
			change \{training_mode = tutorials}
		endif
		update_training_menu
	endif
endscript

script choose_training_mode 
	generic_menu_pad_choose_sound
	if ($training_mode = tutorials)
		player_device = ($primary_controller)
		if ((isguitarcontroller controller = <player_device>) || ((isps3) && $enable_button_cheats = 1))
			ui_flow_manager_respond_to_action \{action = select_tutorial}
		endif
	else
		ui_flow_manager_respond_to_action \{action = select_practice}
	endif
endscript

script update_training_menu 
	if ($training_mode = tutorials)
		if screenelementexists \{id = spm_poster}
			setscreenelementprops \{id = spm_poster
				texture = practice_poster_1}
		endif
		if screenelementexists \{id = tutorials_text}
			setscreenelementprops \{id = tutorials_text
				rgba = [
					150
					140
					200
					255
				]
				scale = 0.75}
		endif
		if screenelementexists \{id = practice_text}
			setscreenelementprops \{id = practice_text
				rgba = [
					145
					145
					145
					255
				]
				scale = 0.6}
		endif
	else
		if screenelementexists \{id = spm_poster}
			setscreenelementprops \{id = spm_poster
				texture = practice_poster_2}
		endif
		if screenelementexists \{id = tutorials_text}
			setscreenelementprops \{id = tutorials_text
				rgba = [
					145
					145
					145
					255
				]
				scale = 0.6}
		endif
		if screenelementexists \{id = practice_text}
			setscreenelementprops \{id = practice_text
				rgba = [
					220
					25
					30
					255
				]
				scale = 0.75}
		endif
	endif
endscript
