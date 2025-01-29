
script ui_create_customize_character_instrument 
	SpawnScriptNow \{ui_create_customize_character_instrument_spawned}
endscript

script ui_create_customize_character_instrument_spawned 
	Change \{rich_presence_context = presence_rockstar_creator}
	cas_queue_wait
	make_generic_car_menu {
		vmenu_id = create_customize_character_instrument_vmenu
		title = qs(0x83e71211)
		num_icons = 1
		show_history
		exclusive_device = <state_device>
		pad_back_script = <menu_pad_back_script>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_instrument_vmenu
		NO_ROTATE = 1
		no_zoom}
	Change \{cas_current_instrument = guitar_and_vocals}
	cas_set_object_node_pos Player = ($cas_current_player) node = $cas_node_name
	i = 0
	begin
	add_car_menu_text_item {
		text = ((($cag_instruments) [<i>]).text)
		choose_state = uistate_customize_character_instrument_change
		choose_state_data = {
			new_state = uistate_cag_main
			new_data = {instrument_info = (($cag_instruments) [<i>]) hist_tex = ((($cag_instruments) [<i>]).icon)}
			instrument = ((($cag_instruments) [<i>]).instrument_name)
		}
	}
	i = (<i> + 1)
	repeat 2
	add_car_menu_text_item {
		text = qs(0x388cd3db)
		choose_state = uistate_customize_character_instrument_change
		choose_state_data = {
			new_state = uistate_cadrm_main
			new_data = {instrument_info = (($cag_instruments) [2])}
			instrument = drum
		}
	}
	add_car_menu_text_item {
		text = qs(0xc0b34c9f)
		choose_state = uistate_customize_character_instrument_change
		choose_state_data = {
			new_state = uistate_customize_character_mic
			new_data = {instrument_info = (($cag_instruments) [3])}
			instrument = vocals
		}
	}
	menu_finish car_helper_text no_rotate_text no_zoom_text controller = <state_device>
	printf \{qs(0xa17964d3)}
	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
	endif
	LaunchEvent Type = focus target = create_customize_character_instrument_vmenu data = {child_index = <selected_index>}
	if ($autolaunch_cas_instrument != None)
		switch (($autolaunch_cas_instrument))
			case bass
			data = {instrument_info = (($cag_instruments) [1])}
			state = uistate_cag_main
			case drum
			case drums
			data = {instrument_info = (($cag_instruments) [2])}
			state = uistate_cadrm_main
			case vocals
			data = {instrument_info = (($cag_instruments) [3])}
			state = uistate_customize_character_mic
			default
			data = {instrument_info = (($cag_instruments) [0])}
			state = uistate_cag_main
		endswitch
		Change cas_current_appearance = {
			($cas_current_appearance)
			($autolaunch_cas_instrument_parts)
		}
		spawnscriptdelayed frames = 50 generic_event_choose params = {state = uistate_customize_character_instrument_change data = {
				new_state = <state>
				new_data = <data>
				instrument = ($autolaunch_cas_instrument)
			}
		}
		Change \{autolaunch_cas_instrument = None}
	endif
endscript

script ui_destroy_customize_character_instrument 
	destroy_generic_menu
endscript

script ui_init_customize_character_instrument 
	if GotParam \{state_device}
		ui_event event = menu_change_device force_event = true data = {state_device = <state_device>}
	endif
endscript

script ui_deinit_customize_character_instrument 
	Change \{cas_current_instrument = guitar_and_vocals}
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
		if GotParam \{no_fast_update}
			rebuildcurrentcasmodel instrument = <instrument> no_fast_update
		else
			rebuildcurrentcasmodel instrument = <instrument>
		endif
	endif
endscript

script customize_character_instrument_return_to_band_lobby 
	cleanup_cas_menu_handlers
	if ($shutdown_game_for_signin_change_flag = 1)
		cas_free_resources \{spawn
			block_scripts = 1}
	else
		SpawnScriptNow \{cas_free_resources}
	endif
	Change \{cas_current_savegame = -1}
	Change \{cas_current_profile = None}
	generic_event_back \{state = uistate_band_lobby_setup}
endscript
