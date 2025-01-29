manage_band_menu_font = text_a4

script create_manage_band_menu 
	get_band_game_mode_name
	formattext checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = <game_mode_name>
	getglobaltags <bandname_id>
	formattext textname = menu_text "Manage Band - %n" n = <name>
	new_menu scrollid = mb_scroll vmenuid = mb_vmenu use_backdrop = 1 name = <menu_text>
	text_params = {parent = mb_vmenu type = textelement font = ($audio_settings_menu_font) rgba = ($menu_unfocus_color)}
	createscreenelement {
		<text_params>
		text = "RENAME BAND"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_manage_band_rename_band}
		]
	}
	createscreenelement {
		<text_params>
		text = "DELETE BAND"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_manage_band_delete_band}
		]
	}
endscript

script destroy_manage_band_menu 
	destroy_menu \{menu_id = mb_scroll}
endscript

script menu_manage_band_rename_band 
	ui_flow_manager_respond_to_action \{action = select_rename_band}
endscript

script menu_manage_band_delete_band 
	ui_flow_manager_respond_to_action \{action = select_delete_band}
endscript
