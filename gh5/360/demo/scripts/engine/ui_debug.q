ui_preview_pak_name = 'ui_testassets'

script debug_ui_loadpreviewpak 
	refreshpakmansizes \{map = ui_paks}
	ui_event_wait \{event = menu_change
		data = {
			state = uistate_nxgui_preview
		}}
	ui_destroy_nxgui_preview
	setpakmancurrentblock \{map = ui_paks
		pakname = 'none'}
	ui_event_wait \{event = menu_change
		data = {
			state = uistate_nxgui_preview
		}}
endscript

script debug_ui_show_paksize 
endscript
