menu_select_practice_mode_font = fontgrid_title_a1
training_mode = tutorials

script MaybeAllowTutorials 
	if (
			(isguitarcontroller controller = $primary_controller)
			||
			(isdrumcontroller controller = $primary_controller)
			||
			((IsPS3) && $enable_button_cheats = 1)
		)
		return \{allow_tutorials = 1}
	endif
endscript

script create_select_practice_mode_menu 
	Change \{rich_presence_context = presence_menus}
	spawnscriptnow \{menu_music_on}
	CreateScreenElement {
		type = ContainerElement
		id = spm_container
		parent = root_window
		Pos = (0.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = menu_venue_bg}
	displaySprite \{texture = practice_poster_2
		id = spm_poster
		parent = spm_container
		Pos = (640.0, 340.0)
		dims = (600.0, 600.0)
		rot_angle = -5
		just = [
			center
			center
		]}
	displaySprite \{tex = practice_typebar_1
		parent = spm_container
		Pos = (710.0, 240.0)
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
	displaySprite \{tex = practice_typebar_2
		parent = spm_container
		Pos = (555.0, 320.0)
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
	displaySprite \{tex = tape_H_02
		parent = spm_container
		Pos = (775.0, 60.0)
		dims = (160.0, 64.0)
		rot_angle = -20
		just = [
			center
			center
		]
		z = 7}
	displaySprite {
		tex = tape_H_02
		parent = <id>
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 6
	}
	displaySprite \{tex = tape_H_02
		parent = spm_container
		Pos = (500.0, 640.0)
		dims = (160.0, 64.0)
		rot_angle = 20
		just = [
			center
			center
		]
		z = 7
		flip_v}
	displaySprite {
		tex = tape_H_02
		parent = <id>
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 6
	}
	displaySprite \{tex = tape_V_02
		parent = spm_container
		Pos = (430.0, 120.0)
		dims = (160.0, 96.0)
		rot_angle = 280
		just = [
			center
			center
		]
		z = 7}
	displaySprite {
		tex = tape_V_02
		parent = <id>
		Pos = (-5.0, 5.0)
		rgba = [0 0 0 128]
		z = 6
	}
	CreateScreenElement \{type = TextElement
		parent = spm_container
		id = current_menu
		text = qs(0xc6510dd1)
		font = fontgrid_text_A1
		Pos = (555.0, 320.0)
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
	displayText \{id = practice_text
		parent = spm_container
		text = qs(0x3ea7dec9)
		font = fontgrid_text_A1
		Pos = (710.0, 245.0)
		scale = 0.7
		just = [
			center
			center
		]
		rot = -5
		z = 10}
	displayText \{parent = spm_container
		text = qs(0x42622a8d)
		font = fontgrid_text_A1
		Pos = (655.0, 540.0)
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
	MaybeAllowTutorials
	if NOT GotParam \{allow_tutorials}
		Change \{training_mode = practice}
		update_training_menu
	endif
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		Bg_rgba = [
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
	MaybeAllowTutorials
	if GotParam \{allow_tutorials}
		generic_menu_up_or_down_sound
		if ($training_mode = tutorials)
			Change \{training_mode = practice}
		else
			Change \{training_mode = tutorials}
		endif
		update_training_menu
	endif
endscript

script choose_training_mode_old 
	generic_menu_pad_choose_sound
	if ($training_mode = tutorials)
		MaybeAllowTutorials
		if GotParam \{allow_tutorials}
			generic_event_choose \{state = UIstate_select_tutorial}
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
		if ScreenElementExists \{id = spm_poster}
			SetScreenElementProps \{id = spm_poster
				texture = practice_poster_1}
		endif
		if ScreenElementExists \{id = current_menu}
			SetScreenElementProps \{id = current_menu
				rgba = [
					150
					140
					200
					255
				]
				scale = 0.75}
		endif
		if ScreenElementExists \{id = practice_text}
			SetScreenElementProps \{id = practice_text
				rgba = [
					145
					145
					145
					255
				]
				scale = 0.6}
		endif
	else
		if ScreenElementExists \{id = spm_poster}
			SetScreenElementProps \{id = spm_poster
				texture = practice_poster_2}
		endif
		if ScreenElementExists \{id = current_menu}
			SetScreenElementProps \{id = current_menu
				rgba = [
					145
					145
					145
					255
				]
				scale = 0.6}
		endif
		if ScreenElementExists \{id = practice_text}
			SetScreenElementProps \{id = practice_text
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
