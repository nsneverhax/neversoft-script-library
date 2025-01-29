menu_select_practice_mode_font = fontgrid_title_gh3
training_mode = tutorials

script create_select_practice_mode_menu 
	end_song
	disable_pause
	Change \{rich_presence_context = presence_main_menu}
	SpawnScriptNow \{menu_music_on}
	CreateScreenElement {
		Type = ContainerElement
		id = spm_container
		parent = root_window
		Pos = (0.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Venue_BG}
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
	player_device = ($primary_controller)
	if ((IsGuitarController controller = <player_device>) || ((isps3) && $enable_button_cheats = 1))
		tutorial_text = 'tutorials'
	else
		tutorial_text = 'tutorials*'
		practice_mode_footnote \{alpha = 1}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = spm_container
		id = tutorials_text
		text = <tutorial_text>
		font = text_a6
		Pos = (555.0, 312.0)
		Scale = 0.7
		rot_angle = -5
		just = [center center]
		event_handlers = [
			{pad_up switch_training_mode}
			{pad_down switch_training_mode}
			{pad_choose choose_training_mode}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		z_priority = 10
	}
	displayText \{id = practice_text
		parent = spm_container
		text = 'practice'
		font = text_a6
		Pos = (715.0, 235.0)
		Scale = 0.7
		just = [
			center
			center
		]
		rot = -5
		z = 10}
	displayText \{parent = spm_container
		text = 'Select training mode'
		font = text_a11
		Scale = (0.85, 1.0)
		Pos = (658.0, 541.0)
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
	LaunchEvent \{Type = focus
		target = tutorials_text}
	update_training_menu
	if NOT (IsGuitarController controller = <player_device>)
		if NOT ((isps3) && $enable_button_cheats = 1)
			Change \{training_mode = practice}
			update_training_menu
		endif
	endif
	Change \{user_control_pill_text_color = [
			255
			255
			255
			255
		]}
	Change \{user_control_pill_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_scale = 0.6}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	if ((IsGuitarController controller = <player_device>) || ((isps3) && $enable_button_cheats = 1))
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
	if ((IsGuitarController controller = <player_device>) || ((isps3) && $enable_button_cheats = 1))
		generic_menu_up_or_down_sound
		if ($training_mode = tutorials)
			Change \{training_mode = practice}
		else
			Change \{training_mode = tutorials}
		endif
		update_training_menu
		practice_mode_footnote \{alpha = 0}
	elseif NOT (IsGuitarController controller = <player_device>)
		Change \{training_mode = practice}
		update_training_menu
		practice_mode_footnote \{alpha = 1}
	endif
endscript

script choose_training_mode 
	generic_menu_pad_choose_sound
	if ($training_mode = tutorials)
		player_device = ($primary_controller)
		if ((IsGuitarController controller = <player_device>) || ((isps3) && $enable_button_cheats = 1))
			ui_flow_manager_respond_to_action \{action = select_tutorial}
		endif
	else
		ui_flow_manager_respond_to_action \{action = select_practice}
	endif
endscript

script update_training_menu 
	if ($training_mode = tutorials)
		if ScreenElementExists \{id = spm_poster}
			SetScreenElementProps \{id = spm_poster
				texture = practice_poster_1}
		endif
		if ScreenElementExists \{id = tutorials_text}
			SetScreenElementProps \{id = tutorials_text
				rgba = [
					150
					140
					200
					255
				]
				Scale = 0.75}
		endif
		if ScreenElementExists \{id = practice_text}
			SetScreenElementProps \{id = practice_text
				rgba = [
					145
					145
					145
					255
				]
				Scale = 0.6}
		endif
	else
		if ScreenElementExists \{id = spm_poster}
			SetScreenElementProps \{id = spm_poster
				texture = practice_poster_2}
		endif
		if ScreenElementExists \{id = tutorials_text}
			SetScreenElementProps \{id = tutorials_text
				rgba = [
					145
					145
					145
					255
				]
				Scale = 0.6}
		endif
		if ScreenElementExists \{id = practice_text}
			SetScreenElementProps \{id = practice_text
				rgba = [
					220
					25
					30
					255
				]
				Scale = 0.75}
		endif
	endif
endscript

script practice_mode_footnote \{alpha = 0}
	0xe63d7b06 = (0.0, -6.0)
	0x81a9b929 = (0.7, 0.6)
	if French
		0xe63d7b06 = (17.0, -6.0)
		0x81a9b929 = (0.6, 0.6)
	endif
	if NOT ScreenElementExists \{id = footnote_overlay}
		CreateScreenElement \{Type = ContainerElement
			parent = spm_container
			id = footnote_overlay
			Pos = (0.0, 0.0)
			just = [
				left
				top
			]
			alpha = 0}
		CreateScreenElement \{Type = ContainerElement
			parent = footnote_overlay
			id = practice_mode_footer
			Pos = (640.0, 645.0)
			z_priority = 1000
			just = [
				center
				bottom
			]
			alpha = 1}
		CreateScreenElement \{Type = ContainerElement
			parent = practice_mode_footer
			id = footer_gradient
			Pos = (0.0, -17.0)
			z_priority = 1000
			just = [
				center
				bottom
			]
			alpha = 1
			rot_angle = 90}
		CreateScreenElement \{Type = SpriteElement
			parent = footer_gradient
			texture = Control_pill_body
			dims = (33.0, 600.0)
			Pos = (0.0, 0.0)
			rgba = [
				0
				0
				0
				100
			]
			just = [
				center
				bottom
			]
			alpha = 1}
		CreateScreenElement \{Type = SpriteElement
			parent = footer_gradient
			texture = Control_pill_body
			dims = (33.0, 600.0)
			Pos = (0.0, 0.0)
			rgba = [
				20
				0
				10
				100
			]
			just = [
				center
				top
			]
			alpha = 1
			flip_h}
		CreateScreenElement {
			Type = TextElement
			parent = practice_mode_footer
			id = practice_mode_footer_text
			Scale = <0x81a9b929>
			text = '*CONNECT A GUITAR HERO® GUITAR CONTROLLER TO ACCESS TUTORIALS'
			Pos = <0xe63d7b06>
			rgba = (($g_menu_colors).md_violet_grey)
			font = text_a11
			just = [center bottom]
			font_spacing = 0.8
			Shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 1
			z_priority = 1002
		}
	endif
	if (<alpha> = 1)
		SetScreenElementProps id = practice_mode_footer_text text = <text>
		DoScreenElementMorph \{id = footnote_overlay
			alpha = 1
			time = 0.25}
		RunScriptOnScreenElement \{id = practice_mode_footer_text
			alert_footnote}
	else
		DoScreenElementMorph \{id = footnote_overlay
			alpha = 0
			time = 0.25}
	endif
endscript

script alert_footnote 
	begin
	DoMorph \{alpha = 0.5
		time = 0.05}
	Wait \{0.05
		Second}
	DoMorph \{alpha = 1
		time = 0.05}
	Wait \{0.05
		Second}
	repeat 3
endscript
