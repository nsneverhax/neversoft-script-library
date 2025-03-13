
script musicstudio_change_sound \{async = 0}
	if NOT gotparam \{instrument}
		musicstudio_get_player_instrument player = <player>
	endif
	<load_screen> = 0
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		<load_screen> = 1
	elseif musicstudio_mainobj :musicstudioghmix_isinghmix
		<load_screen> = 1
	endif
	if (<instrument> = 2)
		if NOT structurecontains structure = ($musicstudio_instrument_list_bass [<index>]) bass
			<load_screen> = 0
		endif
	endif
	if (<instrument> = 4)
		<load_screen> = 0
	endif
	if (<load_screen> = 1)
		change \{musicstudio_loadedsound = add_load_screen}
	endif
	switch <instrument>
		case 0
		case 1
		setsonginfo guitar_sound = <index>
		musicstudio_instrument_loadguitar index = <index> async = <async>
		case 2
		setsonginfo bass_sound = <index>
		musicstudio_instrument_loadbass index = <index> async = <async>
		case 3
		if gotparam \{drum_kit_percussion}
			change jam_current_percussion_kit = <index>
			loaddrumkitall reset_percussion = 0 async = <async> standard = 0
			setsonginfo percussion_kit = <index>
		elseif gotparam \{drum_kit_only}
			change jam_current_drum_kit = <index>
			loaddrumkitall reset_percussion = 0 async = <async> percussion = 0
			setsonginfo drum_kit = <index>
		else
			change jam_current_drum_kit = <index>
			loaddrumkitall reset_percussion = 0 async = <async> take_perc_from_base
			setsonginfo drum_kit = <index>
			change \{jam_current_percussion_kit = -1}
			find_percussion_from_base_kit drum_kit_index = <index>
			if gotparam \{percussion_kit_index}
				change jam_current_percussion_kit = <percussion_kit_index>
			endif
			setsonginfo \{percussion_kit = $jam_current_percussion_kit}
		endif
		case 4
		setsonginfo keyboard_sound = <index>
		musicstudio_instrument_loadkeyboard index = <index> async = <async>
	endswitch
	if (<load_screen> = 1)
		destroy_loading_screen
	endif
	change \{musicstudio_loadedsound = null}
endscript

script musicstudio_change_sound_go_back 
	return
endscript

script musicstudio_preview_sound 
	musicstudio_get_player_instrument player = <player>
	launchevent type = unfocus target = <scrolling_menu_elements>
	musicstudio_change_sound async = 0 player = <player> index = <index>
	musicstudio_audible_scale_preview player = <player>
	launchevent type = focus target = <scrolling_menu_elements>
endscript

script musicstudio_get_selected_sound 
	musicstudio_get_player_instrument player = <player>
	getsonginfo
	selected = 0
	switch <instrument>
		case 0
		case 1
		selected = <guitar_sound>
		case 2
		selected = <bass_sound>
		case 3
		if ($musicstudio_percussion_menu = 1)
			selected = <percussion_kit>
		else
			selected = <drum_kit>
		endif
		case 4
		selected = <keyboard_sound>
	endswitch
	return selected = <selected>
endscript

script musicstudio_get_selected_sound_focusable 
	musicstudio_get_player_instrument player = <player>
	switch <instrument>
		case 2
		if (($musicstudio_instrument_list_bass [<index>].prefix_nl) = $musicstudio_loadedkeyboard)
			return \{focusable = not_focusable}
		endif
		case 4
		if (($musicstudio_instrument_list_keyboard [<index>].prefix_nl) = $musicstudio_loadedbass)
			return \{focusable = not_focusable}
		endif
	endswitch
	return \{focusable = focusable}
endscript
musicstudio_placeholder_options = [
	{
		name_text = qs(0xe20c8714)
	}
]

script musicstudio_get_list_checksum_sound 
	musicstudio_get_player_instrument player = <player>
	list_checksum = musicstudio_placeholder_options
	switch <instrument>
		case 0
		case 1
		list_checksum = musicstudio_instrument_list_guitar
		case 2
		list_checksum = musicstudio_instrument_list_bass
		case 3
		list_checksum = drum_kits
		case 4
		list_checksum = musicstudio_instrument_list_keyboard
	endswitch
	return list_checksum = <list_checksum>
endscript

script musicstudio_get_player_instrument 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	return instrument = <instrument>
endscript

script musicstudio_play_single_note 
	jam_get_sample jam_instrument = <instrument> button = 0 tilt = 0 chord_dir = 0
	musicstudio_play_sound {
		instrument = <instrument>
		final_note_sample = <final_note_sample>
		pitch_shift = <pitch_shift>
		note_type = 0
		note_velocity = 100
		note_string = <note_string>
		note_fret = <note_fret>
	}
	wait \{1
		second}
	jam_stop_sound jam_instrument = <instrument>
endscript
