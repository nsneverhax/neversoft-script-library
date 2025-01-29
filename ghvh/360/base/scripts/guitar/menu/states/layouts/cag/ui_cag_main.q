cag_instrument_type = None

script ui_create_cag_main 
	Change \{randomize_from_cai_menu = 1}
	SetButtonEventMappings \{block_menu_input}
	getcasappearance
	if StructureContains structure = <appearance> cas_full_instrument
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			pad_back_script = generic_event_back
			title = qs(0xb1b4eb63)
			num_icons = 2
			show_history}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu}
		add_generic_menu_text_item \{text = qs(0xdbaa7f89)
			choose_state = uistate_popout_select_part
			choose_state_data = {
				part = cas_full_instrument
				is_popup
				hist_tex = icon_load
			}}
	elseif ((<instrument_info>.desc_id) = guitar)
		Change \{cag_instrument_type = guitar}
		if NOT GotParam \{old_guitar_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
			old_guitar_save_checksum = <array_checksum>
			ui_event_add_params old_guitar_save_checksum = <old_guitar_save_checksum>
		endif
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			title = qs(0x9504b94a)
			num_icons = 2
			show_history
			centered}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu
			camera_list = [
				'cag_main'
				'cag_main_R'
				'cag_main_B'
				'cag_main_L'
			]
			zoom_camera = 'customize_cag_Zoom'}
		add_generic_menu_text_item {
			text = qs(0xfca45220)
			pad_choose_script = ui_cag_main_check_category
			pad_choose_params = {state = uistate_cag_van_halen_presets text = qs(0xfca45220) instrument_info = <instrument_info> is_van_halen = 1 choose_state_data = {
					part = cas_guitar_body
					is_popup
					no_edit
					camera_list = ['cag_main' 'cag_main_R' 'cag_main_B' 'cag_main_L']
					zoom_camera = 'customize_cag_Zoom'
				}}
		}
		add_generic_menu_text_item {
			text = qs(0xc6bd9663)
			choose_state = uistate_cag_custom
			choose_state_data = {
				is_van_halen = 0
				instrument_info = <instrument_info>
			}
		}
		dim_save_option_for_guest <...>
		add_generic_menu_text_item {
			text = qs(0xe618e644)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_guitar_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
			not_focusable = <not_focusable>
		}
		add_generic_menu_text_item {
			text = qs(0xad5cfad4)
			choose_state = uistate_generic_dialogue
			choose_state_data = {
				title = qs(0x29a8ee6e)
				text = qs(0x7b18be62)
				choose_yes_func = generic_event_replace
				choose_yes_params = {data = {state = uistate_cas_save_slots savegame = ($cas_current_savegame) text = qs(0x42c78c11) slot_list = player_guitar_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}}
			}
			not_focusable = <not_focusable>
		}
	endif
	if ((<instrument_info>.desc_id) = bass)
		Change \{cag_instrument_type = bass}
		if NOT GotParam \{old_bass_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
			old_bass_save_checksum = <array_checksum>
			ui_event_add_params old_bass_save_checksum = <old_bass_save_checksum>
		endif
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			title = qs(0x7d4f9214)
			num_icons = 2
			show_history
			centered}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu
			camera_list = [
				'cag_main'
				'cag_main_R'
				'cag_main_B'
				'cag_main_L'
			]
			zoom_camera = 'customize_cag_Zoom'}
		add_generic_menu_text_item {
			text = qs(0xfca45220)
			pad_choose_script = ui_cag_main_check_category
			pad_choose_params = {state = uistate_cag_van_halen_presets text = qs(0xfca45220) instrument_info = <instrument_info> is_van_halen = 1 choose_state_data = {
					part = cas_bass_body
					is_popup
					no_edit
					camera_list = ['cag_main' 'cag_main_R' 'cag_main_B' 'cag_main_L']
					zoom_camera = 'customize_cag_Zoom'
				}}
		}
		add_generic_menu_text_item {
			text = qs(0xc6bd9663)
			choose_state = uistate_cag_custom
			choose_state_data = {
				is_van_halen = 0
				instrument_info = <instrument_info>
			}
		}
		dim_save_option_for_guest <...>
		add_generic_menu_text_item {
			text = qs(0xe618e644)
			choose_state = uistate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_bass_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
			not_focusable = <not_focusable>
		}
		add_generic_menu_text_item {
			text = qs(0xad5cfad4)
			choose_state = uistate_generic_dialogue
			choose_state_data = {
				title = qs(0x37d57ff2)
				text = qs(0x7b18be62)
				choose_yes_func = generic_event_replace
				choose_yes_params = {data = {state = uistate_cas_save_slots savegame = ($cas_current_savegame) text = qs(0xd9188342) slot_list = player_bass_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}}
			}
			not_focusable = <not_focusable>
		}
	endif
	if NotCD
		add_generic_menu_text_item {
			text = qs(0x95f67c67)
			choose_state = uistate_cag_custom
			choose_state_data = {instrument_info = <instrument_info>}
		}
	endif
	getcurrentcasobject
	printf \{qs(0x85155f19)}
	bandmanager_changestance Name = <cas_object> stance = stance_select_guitar no_wait
	SpawnScriptLater cag_custom_update_current_category params = {instrument_info = <instrument_info>}
	menu_finish \{car_helper_text}
endscript

script ui_return_cag_main 
	menu_finish \{car_helper_text}
endscript

script ui_cag_main_check_category 
	if ((<instrument_info>.desc_id) = guitar)
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = guitar_category
		category = <guitar_category>
		title = qs(0xc33f9fa6)
		text_body = qs(0x77fa3b2c)
	else
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = bass_category
		category = <bass_category>
		title = qs(dlog_body_no_options_alpha)
		text_body = qs(0x83b14e04)
	endif
	if (<is_van_halen> = 1)
		menu_category = van_halen
	else
		menu_category = gh
	endif
	Obj_GetID
	if (<category> != <menu_category>)
		ui_event_block event = menu_change state = uistate_generic_dialogue data = {
			title = <title>
			text = <text_body>
			is_popup
			choose_yes_func = generic_event_replace
			choose_yes_params = {state = <state> data = {text = <text> instrument_info = <instrument_info> is_van_halen = <is_van_halen> <choose_state_data> container_id = <objID>}}
		}
	else
		ui_event_block paramsevent = menu_change state = <state> data = {instrument_info = <instrument_info> is_van_halen = <is_van_halen> <choose_state_data>}
	endif
endscript

script ui_destroy_cag_main 
	Change \{randomize_from_cai_menu = 0}
	destroy_generic_menu
endscript

script ui_init_cag_main 
	ui_event_add_params hist_tex = <hist_tex>
	change_cas_instrument_if_necessary instrument = (<instrument_info>.instrument_name)
endscript

script ui_deinit_cag_main 
	change_cas_instrument_if_necessary \{instrument = None}
endscript

script cag_exit_save 
	if GotParam \{old_guitar_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
		if NOT (<old_guitar_save_checksum> = <array_checksum>)
			if CheckForSignIn
				cag_update_photo
				ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
			else
				generic_event_back
			endif
		else
			generic_event_back
		endif
	elseif GotParam \{old_bass_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
		if NOT (<old_bass_save_checksum> = <array_checksum>)
			cas_get_player_status
			if CheckForSignIn local controller_index = ($<player_status>.controller)
				cag_update_photo
				ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
			else
				generic_event_back
			endif
		else
			generic_event_back
		endif
	endif
endscript

script cag_update_photo 
	destroy_generic_menu
	if ($cas_current_savegame >= 0)
		if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
			if (($cas_editing_new_character) = true)
				cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame)
			endif
		endif
	endif
endscript

script cag_custom_update_current_category 
	Wait \{3
		gameframes}
	begin
	if NOT cas_queue_is_busy \{in_queue_too}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	<appearance> = ($cas_current_appearance)
	<body_part> = (<instrument_info>.body_part)
	<current_desc_id> = (<appearance>.<body_part>.desc_id)
	<array> = ($<body_part>)
	<category> = None
	GetArraySize <array>
	<i> = 0
	begin
	<desc_id> = (<array> [<i>].desc_id)
	if (<desc_id> = <current_desc_id>)
		if StructureContains structure = (<array> [<i>]) is_van_halen
			<category> = van_halen
		else
			<category> = gh
		endif
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<category> = None)
		ScriptAssert \{qs(0xbc124d93)}
	endif
	if (<body_part> = cas_guitar_body)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = <category>}
	else
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = <category>}
	endif
	SetButtonEventMappings \{unblock_menu_input}
endscript
