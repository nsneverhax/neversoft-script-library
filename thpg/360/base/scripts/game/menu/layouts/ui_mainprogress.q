
script ui_create_progress_menu 
	if NOT gotparam back_state
		scriptassert "Expects back_state param"
	endif
	make_cas_menu {
		title = "PROGRESS"
		back_state = <back_state>
		pausemenu
	}
	add_cas_menu_item {
		text = "STATS"
		choose_state = UIstate_stats
	}
	add_cas_menu_item {
		text = "DONE"
		choose_state = <back_state>
	}
	cas_menu_finish
endscript

script ui_create_mainprogress 
	printf \{"UI: ui_create_mainprogress"}
	ui_create_progress_menu \{back_state = UIstate_mainoptions}
endscript

script ui_destroy_mainprogress 
	printf \{"UI: ui_destroy_mainprogress"}
	generic_ui_destroy
endscript

script ui_create_hsfsprogress 
	printf \{"UI: ui_create_hsfsprogress"}
	ui_create_progress_menu \{back_state = uistate_pausemenu}
endscript

script ui_destroy_hsfsprogress 
	printf \{"UI: ui_destroy_hsfsprogress"}
	generic_ui_destroy
endscript
