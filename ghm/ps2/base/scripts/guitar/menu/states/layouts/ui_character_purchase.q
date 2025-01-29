
script ui_create_character_purchase 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	make_character_purchase_menu <...>
	menu_finish \{car_helper_text
		no_rotate_zoom_text}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_character_purchase 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	destroy_character_purchase_menu
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript
