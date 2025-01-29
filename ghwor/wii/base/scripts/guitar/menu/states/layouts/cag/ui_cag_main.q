car_show_all_instruments = 0

script ui_create_cag_main 
	getcasappearance
	if ((<instrument_info>.desc_id) = guitar)
		if NOT GotParam \{old_guitar_save_checksum}
			printstruct \{savegame = $cas_current_savegame}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
			old_guitar_save_checksum = <array_checksum>
			ui_event_add_params old_guitar_save_checksum = <old_guitar_save_checksum>
		endif
		make_generic_car_menu {
			vmenu_id = create_cag_main_vmenu
			pad_back_script = cag_main_back
			pad_back_params = {instrument = guitar}
			title = qs(0x9504b94a)
			num_icons = 2
			show_history
			exclusive_device = <state_device>
		}
		generic_menu :se_setprops \{skull_alpha = 0}
		generic_menu :se_setprops \{border_elements_alpha = 1}
		setup_cas_menu_handlers vmenu_id = create_cag_main_vmenu camera_list = ['cag_main' 'cag_main_R' 'cag_main_B' 'cag_main_L'] zoom_camera = 'customize_cag_Zoom' controller = <state_device>
		if ($car_show_all_instruments = 1)
			add_car_menu_text_item \{icon = icon_customize
				text = qs(0x2e29f40a)
				pad_choose_script = cag_choose_pick_a_guitar
				pad_choose_params = {
					old_instrument = guitar
					show_all = true
				}}
		endif
		add_car_menu_text_item \{icon = icon_customize
			text = qs(0xa3c4a68e)
			pad_choose_script = cag_choose_pick_a_guitar
			pad_choose_params = {
				old_instrument = guitar
			}}
		cag_get_focusable_flag appearance = <appearance> instrument_info = <instrument_info>
		add_car_menu_text_item {
			icon = icon_customize
			text = qs(0xc23883c4)
			choose_state = uistate_cag_custom
			choose_state_data = {instrument_info = <instrument_info> cag_preset_index = <cag_preset_index>}
			<cag_focusable_flag>
		}
		add_car_menu_text_item {
			icon = icon_save
			text = qs(0xe618e644)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_guitar_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
			not_focusable = <not_focusable>
		}
		add_car_menu_text_item {
			icon = icon_load
			text = qs(0xad5cfad4)
			choose_state = uistate_generic_dialog_box
			choose_state_data = {
				is_popup
				player_device = <state_device>
				heading_text = qs(0x834b8fcd)
				body_text = qs(0x05569fd6)
				confirm_func = ui_event
				confirm_func_params = {event = menu_replace data = {state = uistate_cas_save_slots savegame = ($cas_current_savegame) text = qs(0xad5cfad4) slot_list = player_guitar_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}}
				not_focusable = <not_focusable>
			}
			pad_select_sound_uitype = warningmessage
		}
	endif
	if ((<instrument_info>.desc_id) = bass)
		if NOT GotParam \{old_bass_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
			old_bass_save_checksum = <array_checksum>
			ui_event_add_params old_bass_save_checksum = <old_bass_save_checksum>
		endif
		make_generic_car_menu {
			vmenu_id = create_cag_main_vmenu
			pad_back_script = cag_main_back
			pad_back_params = {instrument = bass}
			title = qs(0x7d4f9214)
			num_icons = 2
			show_history
			exclusive_device = <state_device>
		}
		generic_menu :se_setprops \{skull_alpha = 0}
		generic_menu :se_setprops \{border_elements_alpha = 1}
		if ($car_show_all_instruments = 1)
			add_car_menu_text_item \{icon = icon_customize
				text = qs(0xf971e2d7)
				pad_choose_script = cag_choose_pick_a_guitar
				pad_choose_params = {
					old_instrument = bass
					show_all = true
				}}
		endif
		setup_cas_menu_handlers vmenu_id = create_cag_main_vmenu camera_list = ['cag_main' 'cag_main_R' 'cag_main_B' 'cag_main_L'] zoom_camera = 'customize_cag_Zoom' controller = <state_device>
		add_car_menu_text_item \{icon = icon_customize
			text = qs(0x4b5cda5d)
			pad_choose_script = cag_choose_pick_a_guitar
			pad_choose_params = {
				old_instrument = bass
			}}
		cag_get_focusable_flag appearance = <appearance> instrument_info = <instrument_info>
		add_car_menu_text_item {
			icon = icon_customize
			text = qs(0xc23883c4)
			choose_state = uistate_cag_custom
			choose_state_data = {instrument_info = <instrument_info> cag_preset_index = <cag_preset_index>}
			<cag_focusable_flag>
		}
		add_car_menu_text_item {
			icon = icon_save
			text = qs(0xe618e644)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_bass_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
			not_focusable = <not_focusable>
		}
		add_car_menu_text_item {
			icon = icon_load
			text = qs(0xad5cfad4)
			choose_state = uistate_generic_dialog_box
			choose_state_data = {
				is_popup
				player_device = <state_device>
				heading_text = qs(0x834b8fcd)
				body_text = qs(0x05569fd6)
				confirm_func = ui_event
				confirm_func_params = {event = menu_replace data = {state = uistate_cas_save_slots savegame = ($cas_current_savegame) text = qs(0xad5cfad4) slot_list = player_bass_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}}
				not_focusable = <not_focusable>
			}
			pad_select_sound_uitype = warningmessage
		}
	endif
	printf \{qs(0x85155f19)}
	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_select_guitar no_wait
	endif
	if GotParam \{selected_index}
		LaunchEvent Type = focus target = create_cag_main_vmenu data = {child_index = <selected_index>}
	endif
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_cag_main 
	destroy_generic_menu
endscript

script ui_return_cag_main 
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_init_cag_main 
endscript

script ui_deinit_cag_main 
endscript

script cag_update_photo 
	destroy_generic_menu
	if ($cas_current_savegame >= 0)
		if is_completely_custom_musician id = ($cas_current_profile)
			if (($cas_editing_new_character) = true)
				cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame)
			endif
		endif
	endif
endscript

script cag_main_back \{old_instrument = guitar}
	if (<instrument> = guitar)
		SoundEvent \{event = audio_ui_band_lobby_complete}
	elseif (<instrument> = bass)
		SoundEvent \{event = audio_ui_band_lobby_complete}
	endif
	Change \{in_cai = 1}
	restoretoptemporarycasappearance
	generic_event_back
endscript

script cag_choose_pick_a_guitar \{old_instrument = guitar
		show_all = FALSE}
	Change \{in_cai = 0}
	ui_event_wait event = menu_change data = {
		state = uistate_cag_custom_body_types
		part = ($cag_instruments [$cag_instrument_idxs.<old_instrument>].body_part)
		old_instrument = <old_instrument>
		cam_name = 'cag_custom_body'
		camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
		zoom_camera = 'customize_cag_Zoom'
		show_all = <show_all>
	}
endscript

script cag_get_focusable_flag \{appearance = 0x69696969
		instrument_info = 0x69696969}
	<full_body_part> = (<instrument_info>.full_body_part)
	if StructureContains structure = <appearance> <full_body_part>
		return \{cag_focusable_flag = {
				not_focusable
			}}
	endif
	<body_part> = (<instrument_info>.body_part)
	if StructureContains structure = <appearance> <body_part>
		<desc_id> = (<appearance>.<body_part>.desc_id)
		if getactualcasoptionstruct part = <body_part> desc_id = <desc_id>
			if GotParam \{disallow_customize}
				return \{cag_focusable_flag = {
						not_focusable
					}}
			endif
		endif
	endif
	return \{cag_focusable_flag = {
		}}
endscript
