
script create_controller_disconnect_menu 
	kill_start_key_binding
	destroy_menu \{menu_id = cd_static_text_container}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = cd_static_text_container
		Pos = (0.0, 0.0)}
	if ($playing_song = 1)
		Menu_pos = (550.0, 500.0)
		menu_z = 1000
		rocking_out_text = "YOU ARE ROCKING OUT A BIT TOO HARD"
		rocking_out_off = (640.0, 160.0)
		rocking_out_dims = (500.0, 200.0)
		Z = 3.0
		please_reconnect_off = (640.0, 270.0)
		please_reconnect_dims = (550.0, 300.0)
		offwhite = [223 223 223 255]
		FormatText \{TextName = please_reconnect_text
			"Please ensure a controller is connected properly"}
		menu_font = fontgrid_title_gh3
		new_menu {
			scrollid = cd_scrolling_menu
			vmenuid = cd_vmenu
			use_backdrop = 0
			Menu_pos = <Menu_pos>
			exclusive_device = ($unplugged_controller)
			Spacing = -20
		}
		create_pause_menu_frame x_scale = 1.2 y_scale = 1.2 Z = (<menu_z> - 10)
		CreateScreenElement {
			Type = TextBlockElement
			PARENT = cd_static_text_container
			font = <menu_font>
			Text = <rocking_out_text>
			Pos = <rocking_out_off>
			Dims = <rocking_out_dims>
			just = [Center Top]
			Scale = 1.0
			rgba = [150 0 0 250]
			z_priority = <menu_z>
		}
		CreateScreenElement {
			Type = TextBlockElement
			PARENT = cd_static_text_container
			font = <menu_font>
			Text = <please_reconnect_text>
			Pos = <please_reconnect_off>
			Dims = <please_reconnect_dims>
			just = [Center Top]
			Scale = 0.85
			rgba = [210 210 210 250]
			z_priority = <menu_z>
		}
		displaySprite PARENT = cd_static_text_container tex = Dialog_BG Pos = (448.0, 470.0) Scale = (1.5, 1.5) Z = <menu_z>
		displaySprite PARENT = cd_static_text_container tex = Dialog_BG flip_h Pos = (448.0, 550.0) Scale = (1.5, 1.5) Z = <menu_z>
		displaySprite PARENT = cd_static_text_container tex = White Pos = (462.0, 550.0) Scale = (89.0, 7.5) Z = (<menu_z> + 0.1) rgba = <offwhite>
		displaySprite PARENT = cd_static_text_container tex = Dialog_Frame_Joiner Pos = (448.0, 540.0) Rot_Angle = 5 Scale = (1.89, 1.875) Z = (<menu_z> + 0.2)
		displaySprite PARENT = cd_static_text_container tex = Dialog_Frame_Joiner Pos = (770.0, 547.0) flip_v Rot_Angle = -5 Scale = (1.89, 1.875) Z = (<menu_z> + 0.2)
		displaySprite Id = hi_right PARENT = cd_static_text_container tex = Dialog_Highlight Pos = (770.0, 553.0) Scale = (1.25, 1.25) Z = (<menu_z> + 0.3)
		displaySprite Id = hi_left PARENT = cd_static_text_container tex = Dialog_Highlight flip_v Pos = (500.0, 553.0) Scale = (1.25, 1.25) Z = (<menu_z> + 0.3)
		set_focus_color \{rgba = [
				180
				50
				50
				255
			]}
		set_unfocus_color \{rgba = [
				0
				0
				0
				255
			]}
		text_scale = (1.2, 1.25)
		CreateScreenElement {
			Type = TextElement
			PARENT = cd_vmenu
			font = <menu_font>
			Scale = <text_scale>
			rgba = [180 50 50 255]
			Text = "RESUME"
			just = [LEFT Top]
			z_priority = (<menu_z> + 0.2)
			event_handlers = [
				{Focus controller_disconnect_resume_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose controller_disconnect_menu_select_resume}
			]
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = cd_vmenu
			font = <menu_font>
			Scale = <text_scale>
			rgba = [0 0 0 255]
			Text = "QUIT"
			just = [LEFT Top]
			z_priority = (<menu_z> + 0.2)
			event_handlers = [
				{Focus controller_disconnect_quit_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose controller_disconnect_menu_select_quit}
			]
		}
	else
		blinker_pos = (750.0, 80.0)
		displaySprite {
			PARENT = cd_static_text_container
			Id = controller_disconnect_pill
			tex = Control_Pill_Fill
			Dims = (384.0, 80.0)
			just = [Center Center]
			Pos = <blinker_pos>
			rgba = [50 50 50 212]
			Z = 100
		}
		displayText {
			PARENT = cd_static_text_container
			Id = controller_disconnect_text
			Text = "PLEASE RECONNECT CONTROLLER"
			Pos = (<blinker_pos> + (0.0, -5.0))
			just = [Center Center]
			Z = 101
			font = text_a10
			Scale = 0.7
			rgba = [223 223 223 255]
		}
		SpawnScriptNow \{menu_controller_disconnect_wait_for_reconnect}
	endif
endscript

script menu_controller_disconnect_wait_for_reconnect 
	begin
	if GuitarGetAnalogueInfo \{controller = $unplugged_controller}
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	if ScreenElementExists \{Id = controller_disconnect_pill}
		DoScreenElementMorph \{Id = controller_disconnect_pill
			Scale = 0
			Time = 0.25
			relative_scale}
	endif
	if ScreenElementExists \{Id = controller_disconnect_text}
		DoScreenElementMorph \{Id = controller_disconnect_text
			Scale = 0
			Time = 0.25}
	endif
	Wait \{0.25
		Seconds}
	controller_disconnect_menu_select_resume
endscript

script controller_disconnect_resume_focus 
	retail_menu_focus
	if ScreenElementExists \{Id = hi_left}
		if ScreenElementExists \{Id = hi_right}
			SetScreenElementProps \{Id = hi_left
				Pos = (470.0, 505.0)
				flip_v}
			SetScreenElementProps \{Id = hi_right
				Pos = (735.0, 505.0)}
		endif
	endif
endscript

script controller_disconnect_quit_focus 
	retail_menu_focus
	if ScreenElementExists \{Id = hi_left}
		if ScreenElementExists \{Id = hi_right}
			SetScreenElementProps \{Id = hi_left
				Pos = (510.0, 565.0)
				flip_v}
			SetScreenElementProps \{Id = hi_right
				Pos = (690.0, 565.0)}
		endif
	endif
endscript

script destroy_controller_disconnect_menu 
	destroy_menu \{menu_id = cd_scrolling_menu}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = cd_static_text_container}
endscript

script controller_disconnect_menu_select_resume 
	restore_start_key_binding
	Change \{check_for_unplugged_controllers = 1}
	if ($playing_song = 1)
		gh3_start_pressed
		ui_flow_manager_respond_to_action \{action = select_resume}
	else
		destroy_controller_disconnect_menu
	endif
endscript

script controller_disconnect_menu_select_quit 
	restore_start_key_binding
	Change \{check_for_unplugged_controllers = 1}
	ui_flow_manager_respond_to_action \{action = select_quit}
endscript
