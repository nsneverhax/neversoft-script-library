
script ui_create_view_tricks 
	printf \{"UI: ui_create_view_tricks"}
	if gman_hasactivegoals
		<back_state> = uistate_pausemenu
	else
		<back_state> = UIstate_view_status
	endif
	create_edit_tricks_menu \{from_view_tricks}
endscript

script ui_destroy_view_tricks 
	printf \{"UI: ui_destroy_view_tricks"}
	generic_ui_destroy
	destroy_special_tricks_menu
	restore_start_key_binding
endscript
