cs_highlighter_positions = [
	(620.0, 193.0)
	(621.0, 232.0)
	(622.0, 271.0)
	(623.0, 296.0)
	(624.0, 330.0)
]
cs_is_popup = 0
cs_menu_font = fontgrid_title_a1

script create_controller_settings_menu \{popup = 0}
	disable_pause
	if NOT (<popup>)
		menu_pos = (638.0, 184.0)
	else
		menu_pos = (465.0, 310.0)
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = cs_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if (<popup>)
		z = 100
		Change \{cs_is_popup = 1}
		new_menu menu_parent = cs_container scrollid = cs_scroll vmenuid = current_menu menu_pos = <menu_pos> spacing = -10 exclusive_device = ($last_start_pressed_device)
		CreateScreenElement {
			Type = TextElement
			font = ($cs_menu_font)
			parent = cs_scroll
			Pos = (180.0, -30.0)
			Scale = 1.7333001
			text = qs(0x8b69cff8)
			rgba = ($menu_unfocus_color)
			z_priority = <z>
		}
		create_pause_menu_frame x_scale = 1.3 z = (<z> - 10)
		text_params = {parent = current_menu Type = TextElement font = ($cs_menu_font) rgba = ($menu_unfocus_color) z_priority = <z> Scale = (1.2, 1.0667)}
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		CreateScreenElement {
			Type = SpriteElement
			parent = cs_container
			texture = menu_pause_frame_banner
			Pos = (640.0, 540.0)
			just = [center center]
			z_priority = (<z> + 100)
		}
		CreateScreenElement {
			Type = TextElement
			parent = <id>
			text = qs(0x662aaaf7)
			font = fontgrid_text_a6
			Pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			Scale = 0.8
		}
	else
		Change \{cs_is_popup = 0}
		event_handlers = [
			{pad_back controller_settings_menu_back}
		]
		new_menu scrollid = cs_scroll vmenuid = current_menu menu_pos = <menu_pos> text_left event_handlers = <event_handlers> no_focus = 1 spacing = 8
		set_focus_color \{rgba = [
				190
				185
				165
				255
			]}
		set_unfocus_color \{rgba = [
				60
				45
				30
				255
			]}
		create_menu_backdrop \{texture = menu_venue_bg}
		displaySprite \{parent = cs_container
			tex = Options_Controller_Poster
			Pos = (135.0, 30.0)
			dims = (640.0, 620.0)
			rot_angle = -1.5
			z = 5}
		displaySprite \{parent = cs_container
			tex = Options_Controller_Poster2
			Pos = (525.0, 130.0)
			dims = (552.0, 266.0)}
		displaySprite \{parent = cs_container
			tex = tape_H_03
			Pos = (610.0, 0.0)
			dims = (120.0, 60.0)
			z = 6
			rot_angle = 60}
		displaySprite \{parent = cs_container
			tex = tape_H_03
			rgba = [
				0
				0
				0
				128
			]
			Pos = (608.0, 5.0)
			dims = (120.0, 60.0)
			z = 6
			rot_angle = 60}
		displaySprite \{parent = cs_container
			tex = tape_H_04
			Pos = (760.0, 106.0)
			dims = (140.0, 65.0)
			z = 4}
		displaySprite \{parent = cs_container
			tex = tape_H_04
			rgba = [
				0
				0
				0
				128
			]
			Pos = (763.0, 111.0)
			dims = (140.0, 65.0)
			z = 4}
		displaySprite \{parent = cs_container
			tex = Tape_V_01
			Pos = (250.0, 360.0)
			dims = (80.0, 142.0)
			z = 6
			flip_v
			rot_angle = -10}
		displaySprite \{parent = cs_container
			tex = Tape_V_01
			rgba = [
				0
				0
				0
				128
			]
			Pos = (255.0, 363.0)
			dims = (80.0, 142.0)
			z = 6
			flip_v
			rot_angle = -10}
		displaySprite \{parent = cs_container
			tex = tape_H_02
			Pos = (1090.0, 300.0)
			dims = (112.0, 54.0)
			z = 4
			rot_angle = -80}
		displaySprite \{parent = cs_container
			tex = tape_H_02
			rgba = [
				0
				0
				0
				128
			]
			Pos = (1095.0, 305.0)
			dims = (112.0, 54.0)
			z = 4
			rot_angle = -80}
		CreateScreenElement {
			Type = TextElement
			id = cs_controller_text
			parent = cs_container
			Pos = (465.0, 564.0)
			Scale = (0.85, 1.0)
			text = qs(0x90d184e2)
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			z_priority = 6
			rot_angle = -1.5
		}
		CreateScreenElement {
			Type = TextElement
			id = cs_options_text
			parent = cs_container
			Pos = (460.0, 275.0)
			Scale = (0.7, 0.6)
			text = qs(0x0b6ccd33)
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			z_priority = 6
			rot_angle = -16
		}
		displaySprite \{parent = cs_container
			tex = Options_Controller_CheckBG
			Pos = (945.0, 205.0)
			z = 4
			flip_h
			rot_angle = -5
			Scale = 0.7}
		displaySprite \{parent = cs_container
			id = cs_check_1
			tex = Options_Controller_X
			Pos = (975.0, 212.0)
			z = 6
			Scale = 0.7}
		displaySprite \{parent = cs_container
			tex = Options_Controller_CheckBG
			Pos = (950.0, 251.0)
			z = 5
			rot_angle = -5
			Scale = 0.7}
		displaySprite \{parent = cs_container
			id = cs_check_2
			tex = Options_Controller_X
			Pos = (970.0, 245.0)
			z = 6
			Scale = 0.7}
		displaySprite {
			parent = cs_container
			id = cs_highlighter
			tex = Options_Controller_Highlight
			Pos = ($cs_highlighter_positions [0])
			dims = (460.0, 58.0)
			z = 4
			rot_angle = 1
		}
		font = fontgrid_text_a6
		z = 5
		text_params = {parent = current_menu Type = TextElement font = <font> Scale = 0.8 rgba = ($menu_unfocus_color) z_priority = <z> rot_angle = 1.5}
		<exclusive_params> = {exclusive_device = ($primary_controller)}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100
			all_buttons}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
	if (<popup>)
		<p1_l_flip_text> = qs(0x1332c72f)
		<p2_l_flip_text> = qs(0x7eb43475)
	else
		<p1_l_flip_text> = qs(0xd5a4e5b5)
		<p2_l_flip_text> = qs(0x27f3084d)
	endif
	CreateScreenElement {
		<text_params>
		text = <p1_l_flip_text>
		event_handlers = [
			{pad_choose controller_settings_menu_choose_lefty_flip_p1 params = {popup = <popup>}}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter params = {index = 0}}
			{unfocus retail_menu_unfocus}
		]
		id = lefty_flip_p1_se
		<exclusive_params>
	}
	if NOT (<popup>)
		GetScreenElementDims id = <id>
		if (<width> > 300)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((300.0, 0.0) + <height> * (0.0, 1.0))
		endif
	endif
	CreateScreenElement {
		<text_params>
		text = <p2_l_flip_text>
		event_handlers = [
			{pad_choose controller_settings_menu_choose_lefty_flip_p2 params = {popup = <popup>}}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter params = {index = 1}}
			{unfocus retail_menu_unfocus}
		]
		id = lefty_flip_p2_se
		<exclusive_params>
	}
	if NOT (<popup>)
		GetScreenElementDims id = <id>
		if (<width> > 300)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((300.0, 0.0) + <height> * (0.0, 1.0))
		endif
	endif
	GetGlobalTags \{user_options}
	getplayerinfo \{1
		lefty_flip}
	controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip>
	controller_settings_menu_update_lefty_flip_p2_value lefty_flip_p2 = <lefty_flip_p2>
	if NOT (<popup>)
		GetScreenElementDims id = <id>
		if (<width> > 300)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((300.0, 0.0) + <height> * (0.0, 1.0))
		endif
	endif
	if NOT IsGuitarController controller = ($primary_controller)
		SetScreenElementProps \{id = cs_calibrate_whammy_menu_item
			rgba = [
				128
				128
				128
				255
			]
			not_focusable}
		SetScreenElementProps \{id = cs_calibrate_sensors_menu_item
			rgba = [
				128
				128
				128
				255
			]
			not_focusable}
	endif
endscript

script controller_settings_menu_highlighter \{index = 0}
	if NOT ($cs_is_popup)
		SetScreenElementProps id = cs_highlighter Pos = ($cs_highlighter_positions [<index>])
	endif
endscript

script destroy_controller_settings_menu 
	destroy_menu_backdrop
	destroy_pause_menu_frame
	destroy_menu \{menu_id = cs_container}
	destroy_menu \{menu_id = cs_scroll}
	clean_up_user_control_helpers
endscript

script controller_settings_menu_update_lefty_flip_p1_value \{lefty_flip_p1 = 0}
	if (<lefty_flip_p1>)
		if NOT ($cs_is_popup)
			SetScreenElementProps \{id = cs_check_1
				texture = Options_Controller_Check}
			Change \{pad_event_up_inversion = true}
		else
			SetScreenElementProps \{id = lefty_flip_p1_se
				text = qs(0x49599c36)}
		endif
	else
		if NOT ($cs_is_popup)
			SetScreenElementProps \{id = cs_check_1
				texture = Options_Controller_X}
			Change \{pad_event_up_inversion = FALSE}
		else
			SetScreenElementProps \{id = lefty_flip_p1_se
				text = qs(0x1332c72f)}
		endif
	endif
endscript

script controller_settings_menu_update_lefty_flip_p2_value \{lefty_flip_p2 = 0}
	if (<lefty_flip_p2>)
		if NOT ($cs_is_popup)
			SetScreenElementProps \{id = cs_check_2
				texture = Options_Controller_Check}
		else
			SetScreenElementProps \{id = lefty_flip_p2_se
				text = qs(0x80469489)}
		endif
	else
		if NOT ($cs_is_popup)
			SetScreenElementProps \{id = cs_check_2
				texture = Options_Controller_X}
		else
			SetScreenElementProps \{id = lefty_flip_p2_se
				text = qs(0x7eb43475)}
		endif
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p1 
	if (<popup>)
		generic_event_choose \{state = uistate_pausemenu_lefty_flip_warning
			data = {
				Player = 1
			}}
	else
		GetGlobalTags \{user_options}
		if (<lefty_flip_p1> = 1)
			<lefty_flip_p1> = 0
			SoundEvent \{box_uncheck_sfx}
		else
			<lefty_flip_p1> = 1
			SoundEvent \{Box_Check_SFX}
		endif
		Change strcturename = player1_status lefty_flip = <lefty_flip_p1>
		SetGlobalTags user_options params = {lefty_flip_save = <lefty_flip_p1>}
		controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip_p1>
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p2 
	if (<popup>)
		generic_event_choose \{state = uistate_pausemenu_lefty_flip_warning
			data = {
				Player = 2
			}}
	else
		GetGlobalTags \{user_options}
		if (<lefty_flip_p2> = 1)
			<lefty_flip_p2> = 0
			SoundEvent \{box_uncheck_sfx}
		else
			<lefty_flip_p2> = 1
			SoundEvent \{box_uncheck_sfx}
		endif
		SetGlobalTags user_options params = {lefty_flip_p2 = <lefty_flip_p2>}
		controller_settings_menu_update_lefty_flip_p2_value lefty_flip_p2 = <lefty_flip_p2>
	endif
endscript

script controller_settings_menu_choose_star_power 
	generic_event_choose state = uistate_options_controller_star_power data = {controller = <device_num> popup = <popup>}
endscript

script controller_settings_menu_choose_whammy_bar 
	generic_event_choose \{state = uistate_options_controller_whammy}
endscript

script controller_settings_menu_back 
	generic_event_back
endscript
