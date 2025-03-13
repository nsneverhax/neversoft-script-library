ui_preview_pak_name = 'ui_testassets'

script debug_ui_loadpreviewpak 
	refreshpakmansizes \{map = ui_paks}
	ui_event_block \{event = menu_change
		data = {
			state = uistate_null
			clear_previous_stack
		}}
	destroyscreenelement \{id = ui_tool_root}
	setpakmancurrentblock \{map = ui_paks
		pakname = 'none'}
	ui_event_block \{event = menu_change
		data = {
			state = uistate_nxgui_preview
		}}
endscript

script debug_ui_show_paksize 
endscript
