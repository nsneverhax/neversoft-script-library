
script ui_create_debug_color_calibration 
	make_menu \{nobg}
	add_menu_item \{choose_back}
	CreateScreenElement \{Type = SpriteElement
		parent = main_menu_anchor
		texture = color_calibration
		z_priority = 1000
		Pos = (630.0, 340.0)}
	menu_finish \{no_helper_text}
endscript

script ui_destroy_debug_color_calibration 
	generic_ui_destroy
endscript
