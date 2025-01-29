cs_highlighter_positions = [
	(620.0, 193.0)
	(621.0, 227.0)
	(622.0, 261.0)
	(623.0, 296.0)
]
cs_is_popup = 0
cs_menu_font = fontgrid_title_gh3

script create_controller_settings_menu \{Popup = 0}
	kill_start_key_binding
	if NOT (<Popup>)
		Menu_pos = (638.0, 188.0)
	else
		Menu_pos = (465.0, 310.0)
	endif
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = cs_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	if (<Popup>)
		Z = 100
		Change \{cs_is_popup = 1}
		new_menu scrollid = cs_scroll vmenuid = cs_vmenu Menu_pos = <Menu_pos> Spacing = -10 exclusive_device = ($last_start_pressed_device)
		CreateScreenElement {
			Type = TextElement
			font = ($cs_menu_font)
			PARENT = cs_scroll
			Pos = (180.0, -30.0)
			Scale = 1.3
			Text = "CONTROLLER SETTINGS"
			rgba = ($menu_unfocus_color)
			z_priority = <Z>
		}
		create_pause_menu_frame x_scale = 1.3 Z = (<Z> - 10)
		text_params = {PARENT = cs_vmenu Type = TextElement font = ($cs_menu_font) rgba = ($menu_unfocus_color) z_priority = <Z> Scale = (0.9, 0.8)}
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = cs_container
			texture = menu_pause_frame_banner
			Pos = (640.0, 540.0)
			just = [Center Center]
			z_priority = (<Z> + 100)
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <Id>
			Text = "PAUSED"
			font = text_a6
			Pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			Scale = 0.8
		}
	else
		Change \{cs_is_popup = 0}
		new_menu scrollid = cs_scroll vmenuid = cs_vmenu Menu_pos = <Menu_pos> text_left
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
		create_menu_backdrop \{texture = Venue_BG}
		CreateScreenElement \{Type = SpriteElement
			PARENT = cs_container
			Id = cs_light_overlay
			texture = Venue_Overlay
			Pos = (640.0, 360.0)
			Dims = (1280.0, 720.0)
			just = [
				Center
				Center
			]
			z_priority = 99}
		displaySprite \{PARENT = cs_container
			tex = Options_Controller_Poster
			Pos = (135.0, 30.0)
			Dims = (640.0, 620.0)
			Rot_Angle = -1.5
			Z = 5}
		displaySprite \{PARENT = cs_container
			tex = Options_Controller_Poster2
			Pos = (525.0, 130.0)
			Dims = (552.0, 266.0)}
		displaySprite \{PARENT = cs_container
			tex = tape_H_03
			Pos = (610.0, 0.0)
			Dims = (120.0, 60.0)
			Z = 6
			Rot_Angle = 60}
		displaySprite \{PARENT = cs_container
			tex = tape_H_03
			rgba = [
				0
				0
				0
				128
			]
			Pos = (608.0, 5.0)
			Dims = (120.0, 60.0)
			Z = 6
			Rot_Angle = 60}
		displaySprite \{PARENT = cs_container
			tex = tape_H_04
			Pos = (760.0, 106.0)
			Dims = (140.0, 65.0)
			Z = 4}
		displaySprite \{PARENT = cs_container
			tex = tape_H_04
			rgba = [
				0
				0
				0
				128
			]
			Pos = (763.0, 111.0)
			Dims = (140.0, 65.0)
			Z = 4}
		displaySprite \{PARENT = cs_container
			tex = Tape_V_01
			Pos = (250.0, 360.0)
			Dims = (80.0, 142.0)
			Z = 6
			flip_v
			Rot_Angle = -10}
		displaySprite \{PARENT = cs_container
			tex = Tape_V_01
			rgba = [
				0
				0
				0
				128
			]
			Pos = (255.0, 363.0)
			Dims = (80.0, 142.0)
			Z = 6
			flip_v
			Rot_Angle = -10}
		displaySprite \{PARENT = cs_container
			tex = Tape_H_02
			Pos = (1090.0, 300.0)
			Dims = (112.0, 54.0)
			Z = 4
			Rot_Angle = -80}
		displaySprite \{PARENT = cs_container
			tex = Tape_H_02
			rgba = [
				0
				0
				0
				128
			]
			Pos = (1095.0, 305.0)
			Dims = (112.0, 54.0)
			Z = 4
			Rot_Angle = -80}
		CreateScreenElement {
			Type = TextElement
			Id = cs_controller_text
			PARENT = cs_container
			Pos = (465.0, 571.0)
			Scale = (0.65000004, 0.8)
			Text = "Controller"
			font = text_a6
			rgba = ($menu_unfocus_color)
			z_priority = 6
			Rot_Angle = -1.5
		}
		CreateScreenElement {
			Type = TextElement
			Id = cs_options_text
			PARENT = cs_container
			Pos = (460.0, 293.0)
			Scale = (0.5, 0.4)
			Text = "Options"
			font = text_a6
			rgba = ($menu_unfocus_color)
			z_priority = 6
			Rot_Angle = -16
		}
		displaySprite \{PARENT = cs_container
			tex = Options_Controller_CheckBG
			Pos = (945.0, 205.0)
			Z = 4
			flip_h
			Rot_Angle = -5
			Scale = 0.7}
		displaySprite \{PARENT = cs_container
			Id = cs_check_1
			tex = Options_Controller_X
			Pos = (975.0, 212.0)
			Z = 6
			Scale = 0.7}
		displaySprite \{PARENT = cs_container
			tex = Options_Controller_CheckBG
			Pos = (950.0, 251.0)
			Z = 5
			Rot_Angle = -5
			Scale = 0.7}
		displaySprite \{PARENT = cs_container
			Id = cs_check_2
			tex = Options_Controller_X
			Pos = (970.0, 245.0)
			Z = 6
			Scale = 0.7}
		displaySprite {
			PARENT = cs_container
			Id = cs_highlighter
			tex = Options_Controller_Highlight
			Pos = ($cs_highlighter_positions [0])
			Dims = (460.0, 58.0)
			Z = 4
			Rot_Angle = 1
		}
		font = text_a6
		Z = 5
		text_params = {PARENT = cs_vmenu Type = TextElement font = <font> Scale = 0.7 rgba = ($menu_unfocus_color) z_priority = <Z> Rot_Angle = 1.5}
		<exclusive_params> = {exclusive_device = ($primary_controller)}
		Change \{user_control_pill_text_color = [
				0
				0
				0
				255
			]}
		Change \{user_control_pill_color = [
				180
				180
				180
				255
			]}
		add_user_control_helper \{Text = "SELECT"
			button = Green
			Z = 100}
		add_user_control_helper \{Text = "BACK"
			button = RED
			Z = 100}
		add_user_control_helper \{Text = "UP/DOWN"
			button = Strumbar
			Z = 100}
	endif
	if (<Popup>)
		<p1_l_flip_text> = "P1 Lefty Flip: OFF"
		<p2_l_flip_text> = "P2 Lefty Flip: OFF"
	else
		<p1_l_flip_text> = "P1 Lefty Flip:"
		<p2_l_flip_text> = "P2 Lefty Flip:"
	endif
	CreateScreenElement {
		<text_params>
		Text = <p1_l_flip_text>
		event_handlers = [
			{pad_choose controller_settings_menu_choose_lefty_flip_p1 Params = {Popup = <Popup>}}
			{Focus retail_menu_focus}
			{Focus controller_settings_menu_highlighter Params = {Index = 0}}
			{unfocus retail_menu_unfocus}
		]
		Id = lefty_flip_p1_se
		<exclusive_params>
	}
	if NOT (<Popup>)
		GetScreenElementDims Id = <Id>
		if (<width> > 300)
			SetScreenElementProps Id = <Id> Scale = 1
			fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0))
		endif
	endif
	CreateScreenElement {
		<text_params>
		Text = <p2_l_flip_text>
		event_handlers = [
			{pad_choose controller_settings_menu_choose_lefty_flip_p2 Params = {Popup = <Popup>}}
			{Focus retail_menu_focus}
			{Focus controller_settings_menu_highlighter Params = {Index = 1}}
			{unfocus retail_menu_unfocus}
		]
		Id = lefty_flip_p2_se
		<exclusive_params>
	}
	if NOT (<Popup>)
		GetScreenElementDims Id = <Id>
		if (<width> > 300)
			SetScreenElementProps Id = <Id> Scale = 1
			fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0))
		endif
	endif
	GetGlobalTags \{user_options}
	controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip_p1>
	controller_settings_menu_update_lefty_flip_p2_value lefty_flip_p2 = <lefty_flip_p2>
	CreateScreenElement {
		Id = cs_calibrate_whammy_menu_item
		<text_params>
		Text = "Calibrate Whammy"
		event_handlers = [
			{pad_choose controller_settings_menu_choose_whammy_bar Params = {Popup = <Popup>}}
			{Focus retail_menu_focus}
			{Focus controller_settings_menu_highlighter Params = {Index = 2}}
			{unfocus retail_menu_unfocus}
		]
		<exclusive_params>
	}
	if NOT (<Popup>)
		GetScreenElementDims Id = <Id>
		if (<width> > 300)
			SetScreenElementProps Id = <Id> Scale = 1
			fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0))
		endif
	endif
	if NOT IsGuitarController controller = ($primary_controller)
		SetScreenElementProps \{Id = cs_calibrate_whammy_menu_item
			rgba = [
				128
				128
				128
				255
			]
			NOT_FOCUSABLE}
	endif
endscript

script controller_settings_menu_highlighter \{Index = 0}
	if NOT ($cs_is_popup)
		SetScreenElementProps Id = cs_highlighter Pos = ($cs_highlighter_positions [<Index>])
	endif
endscript

script destroy_controller_settings_menu 
	restore_start_key_binding
	destroy_pause_menu_frame
	destroy_menu \{menu_id = cs_container}
	destroy_menu \{menu_id = cs_scroll}
	clean_up_user_control_helpers
endscript

script controller_settings_menu_update_lefty_flip_p1_value \{lefty_flip_p1 = 0}
	if (<lefty_flip_p1>)
		if NOT ($cs_is_popup)
			SetScreenElementProps \{Id = cs_check_1
				texture = Options_Controller_Check}
			Change \{pad_event_up_inversion = TRUE}
		else
			SetScreenElementProps \{Id = lefty_flip_p1_se
				Text = "P1 Lefty Flip: ON"}
		endif
	else
		if NOT ($cs_is_popup)
			SetScreenElementProps \{Id = cs_check_1
				texture = Options_Controller_X}
			Change \{pad_event_up_inversion = FALSE}
		else
			SetScreenElementProps \{Id = lefty_flip_p1_se
				Text = "P1 Lefty Flip: OFF"}
		endif
	endif
endscript

script controller_settings_menu_update_lefty_flip_p2_value \{lefty_flip_p2 = 0}
	if (<lefty_flip_p2>)
		if NOT ($cs_is_popup)
			SetScreenElementProps \{Id = cs_check_2
				texture = Options_Controller_Check}
		else
			SetScreenElementProps \{Id = lefty_flip_p2_se
				Text = "P2 Lefty Flip: ON"}
		endif
	else
		if NOT ($cs_is_popup)
			SetScreenElementProps \{Id = cs_check_2
				texture = Options_Controller_X}
		else
			SetScreenElementProps \{Id = lefty_flip_p2_se
				Text = "P2 Lefty Flip: OFF"}
		endif
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p1 
	if (<Popup>)
		ui_flow_manager_respond_to_action \{action = select_lefty_flip
			create_params = {
				Player = 1
			}}
	else
		GetGlobalTags \{user_options}
		if (<lefty_flip_p1> = 1)
			<lefty_flip_p1> = 0
			SoundEvent \{Event = CheckBox_SFX}
		else
			<lefty_flip_p1> = 1
			SoundEvent \{Event = CheckBox_Check_SFX}
		endif
		SetGlobalTags user_options Params = {lefty_flip_p1 = <lefty_flip_p1>}
		controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip_p1>
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p2 
	if (<Popup>)
		ui_flow_manager_respond_to_action \{action = select_lefty_flip
			create_params = {
				Player = 2
			}}
	else
		GetGlobalTags \{user_options}
		if (<lefty_flip_p2> = 1)
			<lefty_flip_p2> = 0
			SoundEvent \{Event = CheckBox_SFX}
		else
			<lefty_flip_p2> = 1
			SoundEvent \{Event = CheckBox_Check_SFX}
		endif
		SetGlobalTags user_options Params = {lefty_flip_p2 = <lefty_flip_p2>}
		controller_settings_menu_update_lefty_flip_p2_value lefty_flip_p2 = <lefty_flip_p2>
	endif
endscript

script controller_settings_menu_choose_star_power 
	ui_flow_manager_respond_to_action action = select_calibrate_star_power_trigger create_params = {controller = <device_num> Popup = <Popup>}
endscript

script controller_settings_menu_choose_whammy_bar 
	ui_flow_manager_respond_to_action action = select_calibrate_whammy_bar create_params = {controller = <device_num> Popup = <Popup>}
endscript
