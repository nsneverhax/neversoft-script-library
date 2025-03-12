menu_select_practice_mode_font = fontgrid_title_a1
training_mode = tutorials

script maybeallowtutorials 
	if (
			(isguitarcontroller controller = $primary_controller)
			||
			(isdrumcontroller controller = $primary_controller)
			||
			((isps3) && $enable_button_cheats = 1)
		)
		return \{allow_tutorials = 1}
	endif
endscript

script create_select_practice_mode_menu 
	change \{rich_presence_context = presence_menus}
	spawnscriptnow \{menu_music_on}
	createscreenelement {
		type = containerelement
		id = spm_container
		parent = root_window
		pos = (0.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = menu_venue_bg}
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
		id = current_menu
		text = qs(0xc6510dd1)
		font = fontgrid_text_a1
		pos = (555.0, 320.0)
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
				choose_training_mode_old
			}
			{
				pad_back
				generic_event_back
			}
		]
		z_priority = 10}
	displaytext \{id = practice_text
		parent = spm_container
		text = qs(0x3ea7dec9)
		font = fontgrid_text_a1
		pos = (710.0, 245.0)
		scale = 0.7
		just = [
			center
			center
		]
		rot = -5
		z = 10}
	displaytext \{parent = spm_container
		text = qs(0x42622a8d)
		font = fontgrid_text_a1
		pos = (655.0, 540.0)
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
	update_training_menu
	maybeallowtutorials
	if NOT gotparam \{allow_tutorials}
		change \{training_mode = practice}
		update_training_menu
	endif
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
endscript

script destroy_select_practice_mode_menu 
	destroy_menu_backdrop
	clean_up_user_control_helpers
	destroy_menu \{menu_id = spm_container}
	destroy_menu \{menu_id = spm_scroll}
endscript

script switch_training_mode 
	maybeallowtutorials
	if gotparam \{allow_tutorials}
		generic_menu_up_or_down_sound
		if ($training_mode = tutorials)
			change \{training_mode = practice}
		else
			change \{training_mode = tutorials}
		endif
		update_training_menu
	endif
endscript

script choose_training_mode_old 
	generic_menu_pad_choose_sound
	if ($training_mode = tutorials)
		maybeallowtutorials
		if gotparam \{allow_tutorials}
			generic_event_choose \{state = uistate_select_tutorial}
		endif
	else
		generic_event_choose \{state = uistate_songlist
			data = {
				no_jamsession
			}}
	endif
endscript

script update_training_menu 
	if ($training_mode = tutorials)
		if screenelementexists \{id = spm_poster}
			setscreenelementprops \{id = spm_poster
				texture = practice_poster_1}
		endif
		if screenelementexists \{id = current_menu}
			setscreenelementprops \{id = current_menu
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
		if screenelementexists \{id = current_menu}
			setscreenelementprops \{id = current_menu
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
