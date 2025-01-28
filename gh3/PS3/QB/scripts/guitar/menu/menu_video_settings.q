video_settings_menu_font = text_a5

script create_video_settings_menu \{Popup = 0}
	kill_start_key_binding
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = vom_container
		Pos = (0.0, 0.0)}
	if (<Popup> = 0)
		new_menu \{scrollid = vs_scroll
			vmenuid = vs_vmenu
			font = $video_settings_menu_font
			Menu_pos = (300.0, 400.0)
			Spacing = 8
			text_left}
		Change \{menu_focus_color = [
				240
				235
				240
				255
			]}
		Change \{menu_unfocus_color = [
				235
				120
				135
				255
			]}
		displayText \{PARENT = vom_container
			Pos = (800.0, 550.0)
			just = [
				Center
				Center
			]
			Text = "video options"
			Scale = 1.5
			rgba = [
				240
				235
				240
				255
			]
			font = $video_settings_menu_font
			noshadow}
		create_menu_backdrop \{texture = Venue_BG}
		displaySprite \{PARENT = vom_container
			tex = options_video_poster
			Pos = (640.0, 360.0)
			Dims = (1024.0, 512.0)
			just = [
				Center
				Center
			]
			Z = 1
			font = $video_settings_menu_font}
		GetGlobalTags \{user_options}
		displaySprite \{PARENT = vom_container
			Id = vom_hilite
			tex = White
			Pos = (285.0, 415.0)
			rgba = [
				40
				60
				110
				255
			]
			Dims = (275.0, 35.0)
			Z = 2}
		add_user_control_helper \{Text = "SELECT"
			button = Green
			Z = 100}
		add_user_control_helper \{Text = "BACK"
			button = RED
			Z = 100}
		add_user_control_helper \{Text = "UP/DOWN"
			button = Strumbar
			Z = 100}
		text_params = {
			PARENT = vs_vmenu
			Type = TextElement
			font = $video_settings_menu_font
			rgba = ($menu_unfocus_color)
			Scale = 0.75
			z_priority = 3
		}
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	else
		Z = 100
		new_menu scrollid = vs_scroll vmenuid = vs_vmenu Menu_pos = (0.0, 340.0) exclusive_device = ($last_start_pressed_device)
		SetScreenElementProps \{Id = vs_vmenu
			Dims = (1280.0, 720.0)
			internal_just = [
				Center
				Top
			]}
		CreateScreenElement {
			Type = TextElement
			font = ($video_settings_menu_font)
			PARENT = vs_scroll
			Pos = (640.0, -90.0)
			Scale = 1.4
			Text = "VIDEO SETTINGS"
			rgba = ($menu_unfocus_color)
			just = [Center Top]
			z_priority = <Z>
		}
		create_pause_menu_frame Z = (<Z> - 10)
		calibrate_text = "CALIBRATE LAG"
		text_params = {PARENT = vs_vmenu Type = TextElement font = ($audio_settings_menu_font) rgba = ($menu_unfocus_color) Scale = 1 z_priority = <Z>}
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = vom_container
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
	endif
	CreateScreenElement {
		<text_params>
		Text = "Calibrate Lag"
		event_handlers = [
			{Focus vom_focus Params = {item = calibrate Popup = <Popup>}}
			{unfocus vom_unfocus Params = {item = calibrate Popup = <Popup>}}
			{pad_choose menu_video_settings_select_calibrate_lag}
		]
		<exclusive_params>
	}
	<Id> :SetTags hilite_pos = (285.0, 420.0)
endscript

script destroy_video_settings_menu 
	restore_start_key_binding
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = vom_container}
	destroy_menu \{menu_id = vs_scroll}
	destroy_pause_menu_frame
endscript

script vom_focus 
	retail_menu_focus
	if (<Popup> = 0)
		GetTags
		<Id> :GetTags
		if ScreenElementExists \{Id = vom_hilite}
			vom_hilite :SetProps Pos = <hilite_pos>
		endif
	endif
endscript

script vom_unfocus 
	retail_menu_unfocus
	if (<Popup>)
		return
	endif
endscript

script menu_video_settings_select_calibrate_lag 
	ui_flow_manager_respond_to_action \{action = select_calibrate_lag}
endscript
