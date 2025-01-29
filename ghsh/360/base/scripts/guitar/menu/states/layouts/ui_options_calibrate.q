
script ui_create_options_calibrate 
	ui_options_get_controller_type
	make_menu_frontend \{screen = GUITARIST
		title = qs(0x1133c9c4)}
	add_menu_frontend_item \{text = qs(0x550b8c8e)
		choose_state = uistate_options_calibrate_lag}
	if (<Type> = guitar)
	else
	endif
	menu_finish
endscript

script ui_destroy_options_calibrate 
	generic_ui_destroy
endscript
