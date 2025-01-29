
script ui_create_customize_character_instrument 
	Change \{rich_presence_context = presence_rockstar_creator}
	casblockforloading
	caswaitforcomposite
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
	setup_cas_menu_handlers vmenu_id = create_customize_character_instrument_vmenu NO_ROTATE = 1 no_zoom controller = <state_device>
	if ($g_cas_instrument_menu_hack = 0)
		Change \{cas_current_instrument = guitar_and_vocals}
	endif
	cas_set_object_node_pos Player = ($cas_current_player) node = $cas_node_name
	i = 0
	begin
	add_car_menu_text_item {
		icon = icon_cag_type
		text = ($cag_instruments [<i>].text)
		choose_state = uistate_customize_character_instrument_change
		choose_state_data = {
			new_state = uistate_cag_custom_body_types
			new_data = {
				part = ($cag_instruments [<i>].body_part)
				cam_name = 'cag_custom_body'
				camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
				zoom_camera = 'customize_cag_Zoom'
			}
			instrument = ($cag_instruments [<i>].instrument_name)
		}
	}
	i = (<i> + 1)
	repeat 2
	add_car_menu_text_item {
		text = qs(0x388cd3db)
		choose_state = uistate_customize_character_instrument_change
		choose_state_data = {
			new_state = uistate_popout_select_part
			new_data = {
				part = ($cag_instruments [$cag_instrument_idxs.drum].body_part)
				cam_name = 'cadrm_main'
				camera_list = ['cadrm_main' 'cadrm_main_R' 'cadrm_main_B' 'cadrm_main_L']
				zoom_camera = 'cadrm_zoom'
				instrument = drum
				return_stance = stance_select_drum
				create_bg_menu = 1
				menu_title = qs(0xa4804d98)
			}
			instrument = drum
		}
	}
	add_car_menu_text_item {
		text = qs(0xc0b34c9f)
		choose_state = uistate_customize_character_instrument_change
		choose_state_data = {
			new_state = uistate_popout_select_part
			new_data = {
				part = ($cag_instruments [$cag_instrument_idxs.vocals].body_part)
				cam_name = 'customize_microphone'
				camera_list = ['customize_microphone_F' 'customize_microphone_R' 'customize_microphone_B' 'customize_microphone_L']
				zoom_camera = 'customize_mic_Zoom'
				instrument = vocals
				return_stance = stance_select_mic
				create_bg_menu = 1
				menu_title = qs(0x3490b188)
			}
			instrument = vocals
		}
	}
	menu_finish car_helper_text no_rotate_text no_zoom_text controller = <state_device>
	printf \{qs(0xa17964d3)}
	if getcurrentcasobject
	endif
	LaunchEvent Type = focus target = create_customize_character_instrument_vmenu data = {child_index = <selected_index>}
	if ($autolaunch_cas_instrument != None)
		switch (($autolaunch_cas_instrument))
			case bass
			data = {instrument_info = ($cag_instruments [$cag_instrument_idxs.bass])}
			state = uistate_cag_main
			case drum
			case drums
			data = {instrument_info = ($cag_instruments [$cag_instrument_idxs.drum])}
			state = uistate_cadrm_main
			case vocals
			data = {instrument_info = ($cag_instruments [$cag_instrument_idxs.vocals])}
			state = uistate_customize_character_mic
			default
			data = {instrument_info = ($cag_instruments [$cag_instrument_idxs.guitar])}
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
	if ($g_cas_instrument_menu_hack = 1)
		cas_set_object_node_pos Player = ($cas_current_player) instrument = <instrument>
		rebuildcurrentcasmodel instrument = ($cas_current_instrument) force_update = 1
	endif
endscript
