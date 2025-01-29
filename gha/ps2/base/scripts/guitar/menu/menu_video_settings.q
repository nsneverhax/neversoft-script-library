video_settings_menu_font = text_a5

script create_video_settings_menu \{popup = 0}
	kill_start_key_binding
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = vom_container
		Pos = (0.0, 0.0)}
	if (<popup> = 0)
		new_menu \{scrollid = vs_scroll
			vmenuid = vs_vmenu
			font = $video_settings_menu_font
			menu_pos = (340.0, 388.0)
			spacing = 8
			text_left
			focus_color = light_grey
			unfocus_color = pink2}
		displayText \{parent = vom_container
			Pos = (800.0, 550.0)
			just = [
				center
				center
			]
			text = 'video options'
			Scale = 1.5
			rgba = [
				240
				235
				240
				255
			]
			font = $video_settings_menu_font
			noshadow}
		GetScreenElementDims id = <id>
		if (<width> > 375)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0))
		endif
		create_menu_backdrop \{texture = Venue_BG}
		displaySprite \{parent = vom_container
			tex = options_video_poster
			Pos = (640.0, 360.0)
			dims = (1024.0, 512.0)
			just = [
				center
				center
			]
			z = 1
			font = $video_settings_menu_font}
		GetGlobalTags \{user_options}
		displaySprite \{parent = vom_container
			id = vom_hilite
			tex = white
			Pos = (285.0, 415.0)
			rgba = [
				40
				60
				110
				255
			]
			dims = (280.0, 40.0)
			z = 2}
		add_user_control_helper \{text = 'SELECT'
			button = green
			z = 100}
		add_user_control_helper \{text = 'BACK'
			button = red
			z = 100}
		add_user_control_helper \{text = 'UP/DOWN'
			button = strumbar
			z = 100}
		text_params = {
			parent = vs_vmenu
			Type = TextElement
			font = $video_settings_menu_font
			rgba = ($menu_unfocus_color)
			Scale = 0.85
			z_priority = 3
		}
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	else
		z = 100
		new_menu scrollid = vs_scroll vmenuid = vs_vmenu menu_pos = (0.0, 340.0) exclusive_device = ($last_start_pressed_device)
		SetScreenElementProps \{id = vs_vmenu
			dims = (1280.0, 720.0)
			internal_just = [
				center
				top
			]}
		CreateScreenElement {
			Type = TextElement
			font = ($video_settings_menu_font)
			parent = vs_scroll
			Pos = (640.0, -90.0)
			Scale = 1.4
			text = 'VIDEO SETTINGS'
			rgba = ($menu_unfocus_color)
			just = [center top]
			z_priority = <z>
		}
		create_pause_menu_frame z = (<z> - 10)
		calibrate_text = 'CALIBRATE LAG'
		text_params = {parent = vs_vmenu Type = TextElement font = ($audio_settings_menu_font) rgba = ($menu_unfocus_color) Scale = 1 z_priority = <z>}
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		CreateScreenElement {
			Type = SpriteElement
			parent = vom_container
			texture = menu_pause_frame_banner
			Pos = (640.0, 540.0)
			just = [center center]
			z_priority = (<z> + 100)
		}
		CreateScreenElement {
			Type = TextElement
			parent = <id>
			text = 'PAUSED'
			font = text_a6
			Pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			Scale = 0.8
		}
	endif
	CreateScreenElement {
		<text_params>
		text = 'Calibrate Lag'
		event_handlers = [
			{focus vom_focus params = {item = calibrate popup = <popup>}}
			{unfocus vom_unfocus params = {item = calibrate popup = <popup>}}
			{pad_choose menu_video_settings_select_calibrate_lag}
		]
		<exclusive_params>
	}
	<id> :SetTags hilite_pos = (285.0, 407.0)
	GetScreenElementDims id = <id>
	<id> :SetTags hilite_dims = (<width> * (1.1, 0.0) + (55.0, 40.0))
	if isps2
		get_string_ps2 \{message = widescreen_string}
		CreateScreenElement {
			<text_params>
			text = <localized_string>
			event_handlers = [
				{focus vom_focus params = {item = wide_scrn popup = <popup>}}
				{unfocus vom_unfocus params = {item = wide_scrn popup = <popup>}}
				{pad_choose menu_video_settings_select_widescreen}
			]
		}
		<id> :SetTags hilite_pos = (285.0, 448.0)
		GetScreenElementDims id = <id>
		<id> :SetTags hilite_dims = (<width> * (1.1, 0.0) + (55.0, 40.0))
		if (<ps2_widescreen> = 1)
			displaySprite \{parent = vom_container
				id = widescrn_check
				tex = options_video_on
				Pos = (300.0, 450.0)
				dims = (32.0, 32.0)
				z = 6}
		else
			displaySprite \{parent = vom_container
				id = widescrn_check
				tex = options_video_off
				Pos = (300.0, 450.0)
				dims = (32.0, 32.0)
				z = 6}
		endif
		if NOT IsPAL
			get_string_ps2 \{message = progressivescan_string}
			CreateScreenElement {
				<text_params>
				text = <localized_string>
				event_handlers = [
					{focus vom_focus params = {item = prg_scan popup = <popup>}}
					{unfocus vom_unfocus params = {item = prg_scan popup = <popup>}}
					{pad_choose menu_video_settings_select_progressive_scan}
				]
			}
			<id> :SetTags hilite_pos = (285.0, 489.0)
			GetScreenElementDims id = <id>
			<id> :SetTags hilite_dims = (<width> * (1.1, 0.0) + (55.0, 40.0))
			if ($ps2_progressivescan = 1)
				displaySprite \{parent = vom_container
					id = prgscn_check
					tex = options_video_on
					Pos = (300.0, 490.0)
					dims = (32.0, 32.0)
					z = 6}
			else
				displaySprite \{parent = vom_container
					id = prgscn_check
					tex = options_video_off
					Pos = (300.0, 490.0)
					dims = (32.0, 32.0)
					z = 6}
			endif
		endif
	endif
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
		GetTags
		<id> :GetTags
		if ScreenElementExists \{id = vom_hilite}
			vom_hilite :SetProps Pos = <hilite_pos>
			vom_hilite :SetProps dims = <hilite_dims>
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

script menu_video_settings_select_progressive_scan 
	if ($ps2_progressivescan = 1)
		SetScreenElementProps \{id = prgscn_check
			texture = options_video_off
			dims = (32.0, 32.0)}
		Change \{ps2_progressivescan = 0}
		setprogressive \{On = 0}
	else
		current_flow_state_name = ($ui_flow_manager_state [0])
		Change ps2_saveload_successor = <current_flow_state_name>
		hack_ps2_set_saveload_successor_checksum <current_flow_state_name>
		Change \{ps2_saveload_successor_action_state = {
				please_dont_crash
			}}
		previous_flow_state_name = ($previous_flow_manager_state [0])
		ui_flow_hack_previous_state = <previous_flow_state_name>
		ui_flow_manager_respond_to_action \{action = select_progressive_scan}
	endif
endscript

script menu_video_settings_select_widescreen 
	GetGlobalTags \{user_options}
	if (<ps2_widescreen> = 1)
		SetScreenElementProps \{id = widescrn_check
			texture = options_video_off
			dims = (32.0, 32.0)}
		SetGlobalTags \{user_options
			params = {
				ps2_widescreen = 0
			}}
		SetScreen \{widescreen = 0}
	else
		SetScreenElementProps \{id = widescrn_check
			texture = options_video_on}
		SetScreenElementProps \{id = widescrn_check
			texture = options_video_on
			dims = (32.0, 32.0)}
		SetGlobalTags \{user_options
			params = {
				ps2_widescreen = 1
			}}
		SetScreen \{widescreen = 1}
	endif
endscript
ps2_waiting_on_progressive_scan = 0

script ps2_cancel_progressive_scan 
	Change \{ps2_waiting_on_progressive_scan = 0}
	Change \{ps2_progressivescan = 0}
	setprogressive \{On = 0}
	ui_flow_manager_respond_to_action \{action = leave_warning_flow}
endscript

script ps2_try_progressive_scan 
	Change \{ps2_waiting_on_progressive_scan = 1}
	Change \{ps2_progressivescan = 1}
	setprogressive \{On = 1}
	refresh_ps2_trc_menu <...>
	SpawnScriptNow \{ps2_progressive_scan_timer}
endscript

script ps2_progressive_scan_timer 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	ps2_prog_timer = 0
	begin
	WaitOneGameFrame
	if NOT ($ps2_waiting_on_progressive_scan = 1)
		return
	endif
	if (<ps2_prog_timer> > (60 * 15))
		ps2_cancel_progressive_scan
		return
	endif
	ps2_prog_timer = (<ps2_prog_timer> + 1)
	repeat
endscript

script ps2_accept_progressive_scan 
	KillSpawnedScript \{Name = ps2_progressive_scan_timer}
	Change \{ps2_waiting_on_progressive_scan = 0}
	ui_flow_manager_respond_to_action \{action = leave_warning_flow}
endscript
