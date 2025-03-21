
script ui_create_customize_character_instrument 
	Change \{rich_presence_context = presence_instrument_creator}
	CasBlockForLoading
	CasWaitForComposite
	make_generic_car_menu {
		vmenu_id = create_customize_character_instrument_vmenu
		Title = qs(0xf51c2e5b)
		num_icons = 1
		show_history
		exclusive_device = <state_device>
		pad_back_script = <menu_pad_back_script>
	}
	generic_menu :SE_SetProps \{abstract_01_alpha = 0}
	generic_menu :SE_SetProps \{generic_menu_title_bg_alpha = 0}
	generic_menu :SE_SetProps \{border_elements_alpha = 1}
	setup_cas_menu_handlers vmenu_id = create_customize_character_instrument_vmenu no_rotate = 1 no_zoom controller = <state_device>
	Change \{cas_current_instrument = guitar_and_vocals}
	cas_set_object_node_pos player = ($cas_current_player) node = $CAS_node_name
	i = 0
	begin
	add_car_menu_text_item {
		text = ((($cag_instruments) [<i>]).text)
		choose_state = UIstate_customize_character_instrument_change
		choose_state_data = {
			new_state = UIstate_cag_main
			new_data = {instrument_info = (($cag_instruments) [<i>]) hist_tex = ((($cag_instruments) [<i>]).icon)}
			instrument = ((($cag_instruments) [<i>]).instrument_name)
		}
	}
	i = (<i> + 1)
	repeat 2
	add_car_menu_text_item {
		text = qs(0x388cd3db)
		choose_state = UIstate_customize_character_instrument_change
		choose_state_data = {
			new_state = UIstate_cadrm_main
			new_data = {instrument_info = (($cag_instruments) [2])}
			instrument = Drum
		}
	}
	add_car_menu_text_item {
		text = qs(0xc0b34c9f)
		choose_state = UIstate_customize_character_instrument_change
		choose_state_data = {
			new_state = UIstate_customize_character_mic
			new_data = {instrument_info = (($cag_instruments) [3])}
			instrument = vocals
		}
	}
	menu_finish car_helper_text no_rotate_text no_zoom_text controller = <state_device>
	printf \{qs(0xa17964d3)}
	if GetCurrentCASObject
	endif
	LaunchEvent type = focus target = create_customize_character_instrument_vmenu data = {child_index = <selected_index>}
	if ($autolaunch_cas_instrument != None)
		switch (($autolaunch_cas_instrument))
			case bass
			data = {instrument_info = (($cag_instruments) [1])}
			state = UIstate_cag_main
			case Drum
			case drums
			data = {instrument_info = (($cag_instruments) [2])}
			state = UIstate_cadrm_main
			case vocals
			data = {instrument_info = (($cag_instruments) [3])}
			state = UIstate_customize_character_mic
			default
			data = {instrument_info = (($cag_instruments) [0])}
			state = UIstate_cag_main
		endswitch
		Change cas_current_appearance = {
			($cas_current_appearance)
			($autolaunch_cas_instrument_parts)
		}
		SpawnScriptDelayed frames = 50 generic_event_choose params = {state = UIstate_customize_character_instrument_change data = {
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
