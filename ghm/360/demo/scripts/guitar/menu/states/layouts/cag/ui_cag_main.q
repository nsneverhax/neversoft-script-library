cag_instrument_type = none

script ui_create_cag_main 
	change \{randomize_from_cai_menu = 1}
	setbuttoneventmappings \{block_menu_input}
	getcasappearance
	if structurecontains structure = <appearance> cas_full_instrument
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
		change \{cag_instrument_type = guitar}
		if NOT gotparam \{old_guitar_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
			old_guitar_save_checksum = <array_checksum>
			ui_event_add_params old_guitar_save_checksum = <old_guitar_save_checksum>
		endif
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			title = qs(0x9504b94a)
			num_icons = 2
			show_history}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu
			camera_list = [
				'cag_main'
				'cag_main_R'
				'cag_main_B'
				'cag_main_L'
			]
			zoom_camera = 'customize_cag_Zoom'}
		add_generic_menu_text_item \{text = qs(0xaef38dca)
			choose_state = uistate_cag_metallica_presets
			choose_state_data = {
				part = cas_guitar_body
				is_popup
				hist_tex = icon_customize
				no_edit
				camera_list = [
					'cag_main'
					'cag_main_R'
					'cag_main_B'
					'cag_main_L'
				]
				zoom_camera = 'customize_cag_Zoom'
			}}
		add_generic_menu_text_item {
			text = qs(0x16e9b43d)
			pad_choose_script = ui_cag_main_check_category
			pad_choose_params = {state = uistate_cag_custom text = qs(0x16e9b43d) instrument_info = <instrument_info> is_esp = 1}
		}
		add_generic_menu_text_item {
			text = qs(0x143491e0)
			pad_choose_script = ui_cag_main_check_category
			pad_choose_params = {state = uistate_cag_custom text = qs(0x143491e0) instrument_info = <instrument_info> is_esp = 0}
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
		change \{cag_instrument_type = bass}
		if NOT gotparam \{old_bass_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
			old_bass_save_checksum = <array_checksum>
			ui_event_add_params old_bass_save_checksum = <old_bass_save_checksum>
		endif
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			title = qs(0x7d4f9214)
			num_icons = 2
			show_history}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu
			camera_list = [
				'cag_main'
				'cag_main_R'
				'cag_main_B'
				'cag_main_L'
			]
			zoom_camera = 'customize_cag_Zoom'}
		add_generic_menu_text_item \{text = qs(0xaef38dca)
			choose_state = uistate_cag_metallica_presets
			choose_state_data = {
				part = cas_bass_body
				is_popup
				hist_tex = icon_customize
				no_edit
				camera_list = [
					'cag_main'
					'cag_main_R'
					'cag_main_B'
					'cag_main_L'
				]
				zoom_camera = 'customize_cag_Zoom'
			}}
		add_generic_menu_text_item {
			text = qs(0x16e9b43d)
			pad_choose_script = ui_cag_main_check_category
			pad_choose_params = {state = uistate_cag_custom text = qs(0x16e9b43d) instrument_info = <instrument_info> is_esp = 1}
		}
		add_generic_menu_text_item {
			text = qs(0x143491e0)
			pad_choose_script = ui_cag_main_check_category
			pad_choose_params = {state = uistate_cag_custom text = qs(0x143491e0) instrument_info = <instrument_info> is_esp = 0}
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
	if notcd
		add_generic_menu_text_item {
			text = qs(0x95f67c67)
			choose_state = uistate_cag_custom
			choose_state_data = {instrument_info = <instrument_info>}
		}
	endif
	createscreenelement \{parent = create_cag_main_vmenu
		type = descinterface
		desc = 'Axesmith_menu_item'
		not_focusable
		autosizedims = true}
	getcurrentcasobject
	printf \{qs(0x85155f19)}
	bandmanager_changestance name = <cas_object> stance = stance_select_guitar no_wait
	spawnscriptlater cag_custom_update_current_category params = {instrument_info = <instrument_info>}
	menu_finish \{car_helper_text}
endscript

script ui_cag_main_check_category 
	if ((<instrument_info>.desc_id) = guitar)
		getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue param = guitar_category
		category = <guitar_category>
		title = qs(0x6c44fa7a)
		text_body = qs(0x77fa3b2c)
	else
		getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue param = bass_category
		category = <bass_category>
		title = qs(0x2c36f8ba)
		text_body = qs(0x83b14e04)
	endif
	if (<is_esp> = 1)
		menu_category = esp
	else
		menu_category = gh
	endif
	obj_getid
	if (<category> != <menu_category>)
		ui_event_block event = menu_change state = uistate_generic_dialogue data = {
			title = <title>
			text = <text_body>
			choose_yes_func = generic_event_replace
			choose_yes_params = {data = {state = <state> text = <text> instrument_info = <instrument_info> is_esp = <is_esp> container_id = <objid>}}
		}
	else
		ui_event_block paramsevent = menu_change state = <state> data = {instrument_info = <instrument_info> is_esp = <is_esp>}
	endif
endscript

script ui_destroy_cag_main 
	change \{randomize_from_cai_menu = 0}
	destroy_generic_menu
endscript

script ui_init_cag_main 
	ui_event_add_params hist_tex = <hist_tex>
	change_cas_instrument_if_necessary instrument = (<instrument_info>.instrument_name)
endscript

script ui_deinit_cag_main 
	change_cas_instrument_if_necessary \{instrument = none}
endscript

script cag_exit_save 
	if gotparam \{old_guitar_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
		if NOT (<old_guitar_save_checksum> = <array_checksum>)
			if checkforsignin
				cag_update_photo
				ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
			else
				generic_event_back
			endif
		else
			generic_event_back
		endif
	elseif gotparam \{old_bass_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
		if NOT (<old_bass_save_checksum> = <array_checksum>)
			cas_get_player_status
			if checkforsignin local controller_index = ($<player_status>.controller)
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
	wait \{3
		gameframes}
	begin
	if NOT cas_queue_is_busy \{in_queue_too}
		break
	endif
	wait \{1
		gameframe}
	repeat
	<appearance> = ($cas_current_appearance)
	<body_part> = (<instrument_info>.body_part)
	<current_desc_id> = (<appearance>.<body_part>.desc_id)
	<array> = ($<body_part>)
	<category> = none
	getarraysize <array>
	<i> = 0
	begin
	<desc_id> = (<array> [<i>].desc_id)
	if (<desc_id> = <current_desc_id>)
		if structurecontains structure = (<array> [<i>]) is_esp
			<category> = esp
		elseif structurecontains structure = (<array> [<i>]) is_metallica
			<category> = metallica
		else
			<category> = gh
		endif
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<category> = none)
		scriptassert \{qs(0xbc124d93)}
	endif
	if (<body_part> = cas_guitar_body)
		setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = <category>}
	else
		setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = <category>}
	endif
	setbuttoneventmappings \{unblock_menu_input}
endscript
