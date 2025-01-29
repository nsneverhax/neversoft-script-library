
script ui_create_customize_character_mic 
	SpawnScriptNow ui_create_customize_character_mic_spawned params = {<...>}
endscript

script ui_create_customize_character_mic_spawned 
	cas_queue_wait
	if NOT GotParam \{old_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_mic_save
		old_save_checksum = <array_checksum>
		ui_event_add_params old_save_checksum = <old_save_checksum>
	endif
	make_generic_car_menu {
		vmenu_id = create_customize_character_mic_vmenu
		title = qs(0xc0b34c9f)
		num_icons = 2
		show_history
		exclusive_device = <state_device>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_mic_vmenu
		camera_list = [
			'customize_character_mic'
			'customize_character_mic_R'
			'customize_character_mic_B'
			'customize_character_mic_L'
		]
		zoom_camera = 'customize_mic_Zoom'}
	add_car_menu_text_item {
		icon = icon_customize
		text = qs(0xc23883c4)
		choose_state = uistate_customize_character_mic_main
		choose_state_data = {instrument_info = <instrument_info>}
	}
	add_car_menu_text_item {
		icon = icon_save
		text = qs(0xe618e644)
		choose_state = uistate_cas_save_slots
		choose_state_data = {savegame = ($cas_current_savegame) text = qs(0xe618e644) slot_list = player_mic_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
	}
	add_car_menu_text_item {
		icon = icon_load
		text = qs(0xad5cfad4)
		choose_state = uistate_generic_dialog_box
		choose_state_data = {
			is_popup
			heading_text = qs(0x834b8fcd)
			body_text = qs(0x05569fd6)
			confirm_func = ui_event
			confirm_func_params = {event = menu_replace data = {state = uistate_cas_save_slots savegame = ($cas_current_savegame) text = qs(0xad5cfad4) slot_list = player_mic_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}}
			not_focusable = <not_focusable>
		}
	}
	menu_finish car_helper_text controller = <state_device>
	printf \{qs(0xcb0dee4f)}
	LaunchEvent Type = focus target = create_customize_character_mic_vmenu data = {child_index = <selected_index>}
endscript

script ui_return_customize_character_mic 
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_customize_character_mic 
	destroy_generic_menu
endscript

script ui_init_customize_character_mic 
endscript

script ui_deinit_customize_character_mic 
endscript

script customize_character_mic_exit_save 
	ScriptAssert \{'customize_character_mic_exit_save: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
