
script menu_choose_band_make_selection 
	get_savegame_from_controller controller = <device_num>
	getglobaltags band_info param = name savegame = <savegame>
	if gotparam \{from_band_ui}
		cancel_all_cas_loads \{kill}
		cas_queue_block
	endif
	if (<name> = qs(0x03ac90f0))
		scriptassert \{'should never have no name here!'}
	else
		if gotparam \{from_options}
			generic_event_choose no_sound state = uistate_band_name_logo data = {override_base_name = 'none' controller = <device_num>}
			if gotparam \{band_info}
				ui_band_mode_choose_sound instrument = `default` controller = <device_num>
			elseif gotparam \{band_index}
				ui_band_mode_choose_sound controller = <device_num>
			endif
		else
			generic_event_choose \{state = uistate_game_mode}
		endif
	endif
endscript
