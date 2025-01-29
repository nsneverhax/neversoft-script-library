
script ui_create_customize_character_instrument 
	SpawnScriptNow 0x3af2cdfa params = {<...>}
endscript

script 0x3af2cdfa 
	Change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	casblockforloading
	caswaitforcomposite
	cas_queue_wait
	make_generic_menu \{vmenu_id = create_customize_character_instrument_vmenu
		title = qs(0x83e71211)
		num_icons = 1
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_instrument_vmenu
		NO_ROTATE = 1
		no_zoom}
	Change \{cas_current_instrument = None}
	cas_set_object_node_pos Player = ($cas_current_player) node = $cas_node_name
	i = 0
	begin
	add_generic_menu_text_item {
		text = ((($cag_instruments) [<i>]).text)
		pad_choose_script = 0x04b6321c
		pad_choose_params = {state = uistate_cag_main instrument_info = (($cag_instruments) [<i>]) hist_tex = ((($cag_instruments) [<i>]).icon)}
	}
	i = (<i> + 1)
	repeat 2
	add_generic_menu_text_item {
		text = qs(0x388cd3db)
		pad_choose_script = 0x04b6321c
		pad_choose_params = {state = uistate_cadrm_main instrument_info = (($cag_instruments) [2]) hist_tex = 0}
	}
	add_generic_menu_text_item {
		text = qs(0xc0b34c9f)
		pad_choose_script = 0x04b6321c
		pad_choose_params = {state = uistate_customize_character_mic instrument_info = (($cag_instruments) [3]) hist_tex = 0}
	}
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}

	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
	endif
	LaunchEvent Type = focus target = create_customize_character_instrument_vmenu data = {child_index = <selected_index>}
	destroy_loading_screen
	menu_music_on
endscript

script ui_destroy_customize_character_instrument 
	destroy_generic_menu
endscript

script ui_init_customize_character_instrument 
endscript

script ui_deinit_customize_character_instrument 
endscript

script change_cas_instrument_if_necessary 
	if NOT ($cas_current_instrument = <instrument>)
		cas_set_object_node_pos Player = ($cas_current_player) instrument = <instrument>
		if getcurrentcasobject
			<cas_object> :Hide
		endif
		if NOT (<instrument> = None)
		endif
		Change cas_current_instrument = <instrument>
		rebuildcurrentcasmodel instrument = <instrument>
	endif
endscript

script 0x04b6321c 
	create_loading_screen
	ui_event event = menu_change state = <state> data = {instrument_info = <instrument_info> hist_tex = <hist_tex>}
endscript
