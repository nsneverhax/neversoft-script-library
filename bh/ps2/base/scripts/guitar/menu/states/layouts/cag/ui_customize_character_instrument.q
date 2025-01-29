
script ui_create_customize_character_instrument 
	SpawnScriptNow \{0x419cda3a}
	SpawnScriptNow ui_create_customize_character_instrument_spawned params = {<...>}
endscript

script ui_create_customize_character_instrument_spawned 
	OnExitRun \{0xf00f29a9}
	0x79db87d7
	Change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	casblockforloading
	caswaitforcomposite
	cas_queue_wait
	make_generic_menu \{vmenu_id = create_customize_character_instrument_vmenu
		title = qs(0x83e71211)
		num_icons = 1
		show_history
		0xc1dc518f = 1}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_instrument_vmenu
		NO_ROTATE = 1
		no_zoom}
	Change \{cas_current_instrument = None}
	0xce0505af
	cas_set_object_node_pos Player = ($cas_current_player) node = <0xb07e72b1>
	i = 0
	begin
	add_generic_menu_text_item {
		text = ((($cag_instruments) [<i>]).text)
		choose_state = uistate_cag_main
		choose_state_data = {instrument_info = (($cag_instruments) [<i>]) hist_tex = ((($cag_instruments) [<i>]).icon)}
	}
	i = (<i> + 1)
	repeat 2
	add_generic_menu_text_item {
		text = qs(0x388cd3db)
		choose_state = uistate_cadrm_main
		choose_state_data = {instrument_info = (($cag_instruments) [2])}
	}
	add_generic_menu_text_item {
		text = qs(0xc0b34c9f)
		choose_state = uistate_customize_character_mic
		choose_state_data = {instrument_info = (($cag_instruments) [3])}
	}
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}

	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
	endif
	LaunchEvent Type = focus target = create_customize_character_instrument_vmenu data = {child_index = <selected_index>}
	0x59249cc9
endscript

script ui_destroy_customize_character_instrument 
	KillSpawnedScript \{Name = ui_create_customize_character_instrument_spawned}
	destroy_generic_menu
endscript

script ui_init_customize_character_instrument 
endscript

script ui_deinit_customize_character_instrument 
endscript

script change_cas_instrument_if_necessary 
	if NOT ($cas_current_instrument = <instrument>)
		0xce0505af
		cas_set_object_node_pos Player = ($cas_current_player) node = <0xb07e72b1>
		if getcurrentcasobject
			<cas_object> :Hide
		endif
		if NOT (<instrument> = None)
		endif
		Change cas_current_instrument = <instrument>
		rebuildcurrentcasmodel instrument = <instrument>
	endif
endscript
