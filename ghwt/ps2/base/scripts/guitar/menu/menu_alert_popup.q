g_ap_prev_menu_id = 0

script create_alert_popup 
	Change g_ap_prev_menu_id = <prev_menu_id>
	LaunchEvent Type = unfocus target = <prev_menu_id>
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
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = ap_popup_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = ap_popup_container
		texture = menu_venue_bg
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 1000}
	displaySprite \{parent = ap_popup_container
		tex = Autosave_Poster
		Pos = (0.0, 50.0)
		dims = (1240.0, 620.0)
		z = 1004}
	displaySprite \{parent = ap_popup_container
		tex = tape_H_03
		Pos = (210.0, 74.0)
		dims = (180.0, 80.0)
		z = 1005}
	displaySprite \{parent = ap_popup_container
		tex = tape_H_03
		rgba = [
			0
			0
			0
			128
		]
		Pos = (208.0, 77.0)
		dims = (180.0, 80.0)
		z = 1005}
	displaySprite \{parent = ap_popup_container
		tex = tape_H_04
		Pos = (760.0, 44.0)
		dims = (180.0, 80.0)
		z = 1005}
	displaySprite \{parent = ap_popup_container
		tex = tape_H_04
		rgba = [
			0
			0
			0
			128
		]
		Pos = (762.0, 47.0)
		dims = (180.0, 80.0)
		z = 1005}
	if GotParam \{alert}
		<alert_text> = <alert>
	else
		<alert_text> = qs(0xaa163738)
	endif
	CreateScreenElement {
		Type = TextElement
		id = ap_alert_text
		font = fontgrid_text_a6
		text = <alert_text>
		Pos = (638.0, 540.0)
		Scale = 0.95
		parent = ap_popup_container
		rgba = [205 180 120 250]
		z_priority = 1006
	}
	GetScreenElementDims \{id = ap_alert_text}
	if (<width> > 780)
		fit_text_in_rectangle \{id = ap_alert_text
			dims = (720.0, 40.0)
			Pos = (638.0, 540.0)}
	endif
	displaySprite \{parent = ap_popup_container
		tex = Autosave_Underline
		Pos = (508.0, 556.0)
		dims = (256.0, 48.0)
		rgba = [
			170
			30
			55
			255
		]
		z = 1005}
	clean_up_user_control_helpers
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
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 1006}
	LaunchEvent \{Type = focus
		target = ap_popup_vmenu}
endscript

script destroy_alert_popup \{Force = 0}
	if NOT (<no_sound> = 1)
		SoundEvent \{event = ui_sfx_select}
	endif
	destroy_menu \{menu_id = ap_popup_scroll}
	destroy_menu \{menu_id = ap_popup_container}
	if (<Force> = 0)
		if ScreenElementExists \{id = $g_ap_prev_menu_id}
			LaunchEvent \{Type = focus
				target = $g_ap_prev_menu_id}
		endif
	endif
	clean_up_user_control_helpers
	if (<Force> = 0 && $g_ap_prev_menu_id = ebn_marker)
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
	formatText checksumName = ap_dot_checksum 'ap_dot_checksum_%n' n = <j>
	displaySprite {
		parent = ap_popup_container
		id = <ap_dot_checksum>
		tex = Autosave_Dot_16
		rgba = <active_color>
		Pos = <active_pos>
		dims = (24.0, 24.0)
		z = 4
	}
	<active_pos> = (<active_pos> + <as_dot_offset>)
	Wait \{0.5
		Seconds}
	<j> = (<j> + 1)
	repeat 3
	if NOT (<i> = 2)
		destroy_menu \{menu_id = ap_dot_checksum_0}
		destroy_menu \{menu_id = ap_dot_checksum_1}
		destroy_menu \{menu_id = ap_dot_checksum_2}
	endif
	Wait \{0.5
		Seconds}
	<i> = (<i> + 1)
	repeat 3
endscript
