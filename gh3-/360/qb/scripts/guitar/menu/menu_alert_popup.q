g_ap_prev_menu_id = 0

script create_alert_popup 
	change g_ap_prev_menu_id = <prev_menu_id>
	launchevent type = unfocus target = <prev_menu_id>
	new_menu \{scrollid = ap_popup_scroll
		vmenuid = ap_popup_vmenu
		menu_pos = (485.0, 485.0)
		event_handlers = [
			{
				pad_choose
				destroy_alert_popup
			}
		]}
	set_focus_color \{rgba = [
			130
			0
			0
			250
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	createscreenelement \{type = containerelement
		parent = root_window
		id = ap_popup_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	createscreenelement \{type = spriteelement
		parent = ap_popup_container
		texture = venue_bg
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 1000}
	displaysprite \{parent = ap_popup_container
		tex = autosave_poster
		pos = (0.0, 50.0)
		dims = (1240.0, 620.0)
		z = 1004}
	createscreenelement \{type = spriteelement
		parent = ap_popup_container
		id = autosave_light_overlay
		texture = venue_overlay
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 1099}
	displaysprite \{parent = ap_popup_container
		tex = tape_h_03
		pos = (210.0, 74.0)
		dims = (180.0, 80.0)
		z = 1005}
	displaysprite \{parent = ap_popup_container
		tex = tape_h_03
		rgba = [
			0
			0
			0
			128
		]
		pos = (208.0, 77.0)
		dims = (180.0, 80.0)
		z = 1005}
	displaysprite \{parent = ap_popup_container
		tex = tape_h_04
		pos = (760.0, 44.0)
		dims = (180.0, 80.0)
		z = 1005}
	displaysprite \{parent = ap_popup_container
		tex = tape_h_04
		rgba = [
			0
			0
			0
			128
		]
		pos = (762.0, 47.0)
		dims = (180.0, 80.0)
		z = 1005}
	if gotparam \{alert}
		<alert_text> = <alert>
	else
		<alert_text> = "WARNING"
	endif
	createscreenelement {
		type = textelement
		id = ap_alert_text
		font = text_a5
		text = <alert_text>
		pos = (638.0, 540.0)
		scale = 0.95
		parent = ap_popup_container
		rgba = [205 180 120 250]
		z_priority = 1006
	}
	getscreenelementdims \{id = ap_alert_text}
	if (<width> > 780)
		fit_text_in_rectangle \{id = ap_alert_text
			dims = (720.0, 40.0)
			pos = (638.0, 540.0)}
	endif
	displaysprite \{parent = ap_popup_container
		tex = autosave_underline
		pos = (508.0, 556.0)
		dims = (256.0, 48.0)
		rgba = [
			170
			30
			55
			255
		]
		z = 1005}
	clean_up_user_control_helpers
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "CONTINUE"
		button = green
		z = 1006}
endscript

script destroy_alert_popup \{force = 0}
	soundevent \{event = ui_sfx_select}
	destroy_menu \{menu_id = ap_popup_scroll}
	destroy_menu \{menu_id = ap_popup_container}
	if (<force> = 0)
		if screenelementexists \{id = $g_ap_prev_menu_id}
			launchevent \{type = focus
				target = $g_ap_prev_menu_id}
		endif
	endif
	clean_up_user_control_helpers
	if (<force> = 0 && $g_ap_prev_menu_id = ebn_marker)
		enter_band_name_reset_user_control_helpers
	endif
endscript

script autosave_popup_dot_progression 
	<ap_white> = [230 230 230 255]
	<ap_yellow> = [205 180 120 255]
	<ap_red> = [170 30 55 255]
	<ap_dot_init_pos> = (588.0, 571.0)
	<ap_dot_offset> = (40.0, 0.0)
	<i> = 0
	begin
	switch <i>
		case 0
		<active_color> = <ap_white>
		case 1
		<active_color> = <ap_yellow>
		case 2
		<active_color> = <ap_red>
	endswitch
	<active_pos> = <ap_dot_init_pos>
	<j> = 0
	begin
	formattext checksumname = ap_dot_checksum 'ap_dot_checksum_%n' n = <j>
	displaysprite {
		parent = ap_popup_container
		id = <ap_dot_checksum>
		tex = autosave_dot_16
		rgba = <active_color>
		pos = <active_pos>
		dims = (24.0, 24.0)
		z = 4
	}
	<active_pos> = (<active_pos> + <as_dot_offset>)
	wait \{0.5
		seconds}
	<j> = (<j> + 1)
	repeat 3
	if NOT (<i> = 2)
		destroy_menu \{menu_id = ap_dot_checksum_0}
		destroy_menu \{menu_id = ap_dot_checksum_1}
		destroy_menu \{menu_id = ap_dot_checksum_2}
	endif
	wait \{0.5
		seconds}
	<i> = (<i> + 1)
	repeat 3
endscript
