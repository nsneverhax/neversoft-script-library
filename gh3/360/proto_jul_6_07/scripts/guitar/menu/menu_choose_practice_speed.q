menu_choose_practice_speed_font = fontgrid_title_gh3

script create_choose_practice_speed_menu 
	new_menu scrollid = cps_scroll vmenuid = cps_vmenu name = "Select speed"
	text_params = {parent = cps_vmenu type = textelement font = ($audio_settings_menu_font) rgba = ($menu_unfocus_color)}
	createscreenelement {
		type = containerelement
		id = cps_container
		parent = root_window
		pos = (0.0, 0.0)
	}
	createscreenelement {
		type = spriteelement
		parent = cps_container
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		rgba = [100 100 100 255]
		just = [left top]
	}
	createscreenelement {
		<text_params>
		text = "Full Speed"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = full}}
		]
	}
	createscreenelement {
		<text_params>
		text = "Slow"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slow}}
		]
	}
	createscreenelement {
		<text_params>
		text = "Slower"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slower}}
		]
	}
	createscreenelement {
		<text_params>
		text = "Slowest"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slowest}}
		]
	}
endscript

script destroy_choose_practice_speed_menu 
	destroy_menu \{menu_id = cps_container}
	destroy_menu \{menu_id = cps_scroll}
endscript

script menu_choose_practice_speed_set_speed speed = full
	switch <speed>
		case full
		change current_speedfactor = 1.0
		change structurename = pitchshiftslow1 pitch = 1.0
		case slow
		change current_speedfactor = 0.8
		change structurename = pitchshiftslow1 pitch = 1.25
		case slower
		change current_speedfactor = 0.66666675
		change structurename = pitchshiftslow1 pitch = 1.5
		case slowest
		change current_speedfactor = 0.5
		change structurename = pitchshiftslow1 pitch = 2.0
	endswitch
	ui_flow_manager_respond_to_action action = continue device_num = (<device_num>)
endscript
