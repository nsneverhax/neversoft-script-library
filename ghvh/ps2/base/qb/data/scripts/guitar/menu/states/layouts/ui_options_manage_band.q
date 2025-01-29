
script ui_create_options_manage_band 
	get_current_band_info
	bandname_id = <band_info>
	GetGlobalTags <bandname_id>
	formatText TextName = the_bands_name qs(0xb213c4fe) n = <Name>
	menu_manage_band_edit_logo_focus
	make_generic_menu \{screen = GUITARIST
		title = qs(0x9baf87e5)}
	add_generic_menu_text_item {
		text = <the_bands_name>
		text_just = [center center]
		child_anchor = [center center]
		text_offset = (0.0, 0.0)
		heading
	}
	add_generic_menu_text_item \{text = $0x0c138d34
		choose_state = uistate_options_manage_band_logo}
	add_generic_menu_text_item \{text = $0x25258bec
		pad_choose_script = menu_manage_band_rename_band}
	menu_finish
endscript

script ui_destroy_options_manage_band 
	menu_manage_band_edit_logo_unfocus
	generic_ui_destroy
	KillCamAnim \{Name = ch_view_cam}
endscript
