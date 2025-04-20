
script ui_create_net_skaterselect 
	printf \{'UI: ui_create_net_skaterselect'}
	cas_ensure_skater_loaded \{name = custom_story
		load_paks
		loading_screen}
	ui_destroy_background
	launch_select_skater_menu
endscript

script ui_destroy_net_skaterselect 
	printf \{'UI: ui_destroy_net_skaterselect'}
	generic_ui_destroy
endscript
