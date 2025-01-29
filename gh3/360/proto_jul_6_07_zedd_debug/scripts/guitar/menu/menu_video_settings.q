video_settings_menu_font = text_a5

script create_video_settings_menu popup = 0
	kill_start_key_binding
	createscreenelement {
		type = containerelement
		parent = root_window
		id = vom_container
		pos = (0.0, 0.0)
	}
	if (<popup> = 0)
		new_menu scrollid = vs_scroll vmenuid = vs_vmenu font = $video_settings_menu_font menu_pos = (300.0, 400.0) spacing = 8 text_left
		change menu_focus_color = [240 235 240 255]
		change menu_unfocus_color = [235 120 135 255]
		displaytext {
			parent = vom_container
			pos = (800.0, 550.0)
			just = [center center]
			text = "video options"
			scale = 1.5
			rgba = [240 235 240 255]
			font = $video_settings_menu_font
			noshadow
		}
		create_menu_backdrop texture = venue_bg
		displaysprite parent = vom_container tex = options_video_poster pos = (640.0, 360.0) dims = (1024.0, 512.0) just = [center center] z = 1 font = $video_settings_menu_font
		getglobaltags user_options
		displaysprite parent = vom_container id = vom_hilite tex = white pos = (285.0, 415.0) rgba = [40 60 110 255] dims = (275.0, 35.0) z = 2
		add_user_control_helper text = "SELECT" button = green z = 100
		add_user_control_helper text = "BACK" button = red z = 100
		add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
		text_params = {
			parent = vs_vmenu
			type = textelement
			font = $video_settings_menu_font
			rgba = ($menu_unfocus_color)
			scale = 0.75
			z_priority = 3
		}
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	else
		z = 100
		new_menu scrollid = vs_scroll vmenuid = vs_vmenu menu_pos = (0.0, 340.0) exclusive_device = ($last_start_pressed_device)
		setscreenelementprops {
			id = vs_vmenu
			dims = (1280.0, 720.0)
			internal_just = [center top]
		}
		createscreenelement {
			type = textelement
			font = ($video_settings_menu_font)
			parent = vs_scroll
			pos = (640.0, -90.0)
			scale = 1.4
			text = "VIDEO SETTINGS"
			rgba = ($menu_unfocus_color)
			just = [center top]
			z_priority = <z>
		}
		create_pause_menu_frame z = (<z> - 10)
		calibrate_text = "CALIBRATE LAG"
		text_params = {parent = vs_vmenu type = textelement font = ($audio_settings_menu_font) rgba = ($menu_unfocus_color) scale = 1 z_priority = <z>}
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		createscreenelement {
			type = spriteelement
			parent = vom_container
			texture = menu_pause_frame_banner
			pos = (640.0, 540.0)
			just = [center center]
			z_priority = (<z> + 100)
		}
		createscreenelement {
			type = textelement
			parent = <id>
			text = "PAUSED"
			font = text_a6
			pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			scale = 0.8
		}
	endif
	createscreenelement {
		<text_params>
		text = "Calibrate Lag"
		event_handlers = [
			{focus vom_focus params = {item = calibrate popup = <popup>}}
			{unfocus vom_unfocus params = {item = calibrate popup = <popup>}}
			{pad_choose menu_video_settings_select_calibrate_lag}
		]
		<exclusive_params>
	}
	<id> :settags hilite_pos = (285.0, 420.0)
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
	if (<popup> = 0)
		gettags
		<id> :gettags
		if screenelementexists \{id = vom_hilite}
			vom_hilite :setprops pos = <hilite_pos>
		endif
	endif
endscript

script vom_unfocus 
	retail_menu_unfocus
	if (<popup>)
		return
	endif
endscript

script menu_video_settings_select_calibrate_lag 
	ui_flow_manager_respond_to_action \{action = select_calibrate_lag}
endscript
