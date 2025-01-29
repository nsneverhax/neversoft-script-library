
script menu_choose_band_make_selection 
	get_savegame_from_controller controller = <device_num>
	if GotParam \{band_index}
		Change current_band = <band_index>
	endif
	NetSessionFunc func = 0xa2f7594b params = {Profile = ($current_band)}
	createprofile
	get_band_info
	GetGlobalTags <band_info> param = Name
	if GotParam \{from_band_ui}
		cancel_all_cas_loads \{kill}
		cas_queue_block
	endif
	if (<Name> = qs(0x03ac90f0))
		hide_glitch \{num_frames = 5}
		generic_event_choose \{state = uistate_band_name_logo
			data = {
				from_boot
				skip_destroy
			}}
	else
		if GotParam \{from_options}
			generic_event_choose no_sound state = uistate_band_name_logo data = {override_base_name = 'none' controller = <device_num>}
			if GotParam \{band_info}
				SoundEvent \{event = ui_sfx_select}
			elseif GotParam \{band_index}
				SoundEvent \{event = ui_sfx_select}
			endif
		else
			ui_event \{event = menu_replace
				data = {
					state = uistate_boot_download_scan
				}}
		endif
	endif
endscript
