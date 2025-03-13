
script ui_create_debug_color_histogram 
	color_histogram_menu_pos = (675.0, 20.0)
	make_generic_menu {
		vmenu_id = color_histogram_menu
		pos = <color_histogram_menu_pos>
		dims = (400.0, 500.0)
		title_pos = <color_histogram_menu_pos>
		title_just = [left top]
		z_priority = 100.0
		title = qs(0x319d7241)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item \{text = qs(0x1fe26aa1)
		pad_choose_script = enablescreenhistogram
		pad_choose_params = {
			mode = 2
			colors = 0
		}}
	add_generic_menu_text_item \{text = qs(0x8ca1c8ca)
		pad_choose_script = enablescreenhistogram
		pad_choose_params = {
			mode = 2
			colors = 1
		}}
	add_generic_menu_text_item \{text = qs(0xe2426512)
		pad_choose_script = enablescreenhistogram
		pad_choose_params = {
			mode = 3
			colors = 0
		}}
	add_generic_menu_text_item \{text = qs(0x8b28ec65)
		pad_choose_script = enablescreenhistogram
		pad_choose_params = {
			mode = 3
			colors = 1
		}}
	add_generic_menu_text_item \{text = qs(0xe165e47e)
		pad_choose_script = enablescreenhistogram
		pad_choose_params = {
			mode = 0
			colors = 0
		}}
	menu_finish \{no_helper_text}
endscript

script ui_destroy_debug_color_histogram 
	generic_ui_destroy
endscript
