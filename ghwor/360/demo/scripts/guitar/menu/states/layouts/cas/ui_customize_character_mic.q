
script ui_create_customize_character_mic 
	scriptassert \{'No longer used'}
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
	globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_mic_save
	if NOT (<old_save_checksum> = <array_checksum>)
		cas_get_player
		getplayerinfo <player> controller
		if checkforsignin local controller_index = <controller>
			cag_update_photo
			ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
		else
			ui_sfx \{menustate = car
				uitype = select}
			generic_event_back
		endif
	else
		ui_sfx \{menustate = car
			uitype = select}
		generic_event_back
	endif
endscript
