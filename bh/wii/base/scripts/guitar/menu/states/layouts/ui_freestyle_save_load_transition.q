
script ui_create_freestyle_save_load_transition 
	SpawnScriptNow \{freestyle_load_to_manager}
endscript

script freestyle_load_to_manager 
	destroy_loading_screen
	ui_event_wait_for_safe
	ui_memcard_load_freestyle \{event = menu_replace
		state = uistate_freestyle_replay}
endscript

script ui_destroy_freestyle_save_load_transition 
	generic_ui_destroy
endscript
