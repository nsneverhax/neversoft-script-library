
script ui_create_debugoptions 
	printf \{"UI: ui_create_debugoptions"}
	pause_menu_fmv_kill
	create_debug_options_menu \{pad_back_script = ui_change_state
		pad_back_params = {
			state = UIstate_pauseoptions
		}}
endscript

script ui_destroy_debugoptions 
	printf \{"UI: ui_destroy_debugoptions"}
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	generic_ui_destroy
endscript
