
script ui_create_remaptricks 
	printf \{"UI: ui_create_remaptricks"}
	create_edit_tricks_menu \{from_remap_tricks}
endscript

script ui_destroy_remaptricks 
	printf \{"UI: ui_destroy_remaptricks"}
	generic_ui_destroy
	destroy_special_tricks_menu
	restore_start_key_binding
endscript
