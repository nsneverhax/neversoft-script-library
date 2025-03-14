
script ui_create_controlsetup 
	printf \{"UI: ui_create_controlsetup"}
	create_controller_config_menu \{controller_number = 1}
endscript

script ui_destroy_controlsetup 
	printf \{"UI: ui_destroy_controlsetup"}
	generic_ui_destroy
endscript
