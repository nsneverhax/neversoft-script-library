
script ui_create_debug_color_calibration 
	color_calibration_menu_pos = (675.0, 20.0)
	make_generic_menu {
		vmenu_id = color_calibration_menu
		pos = <color_calibration_menu_pos>
		dims = (400.0, 500.0)
		title_pos = <color_calibration_menu_pos>
		title_just = [left top]
		z_priority = 100.0
		title = qs(0xa742d891)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0xafe6557c)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_debug_brightness_calibration
		}}
	add_generic_menu_text_item \{text = qs(0x8455d092)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_debug_gamma_calibration
		}}
	add_generic_menu_text_item \{text = qs(0xe7bffd48)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_debug_atvi_color_calibration
		}}
	menu_finish \{no_helper_text}
endscript

script ui_destroy_debug_color_calibration 
	generic_ui_destroy
endscript
