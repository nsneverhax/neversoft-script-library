musicstudio_note_edit_mode = none

script musicstudio_skip_next_note_forward 
	notetracker_whammy_set_fast_forward
	musicstudio_skip_next_note \{direction = 1}
endscript

script musicstudio_skip_next_note_backward 
	notetracker_whammy_set_rewind
	musicstudio_skip_next_note \{direction = -1}
endscript

script musicstudio_skip_next_note \{direction = 0}
	if musicstudio_mainobj :musicstudioghmix_getclosestnote direction = <direction>
		musicstudio_mainobj :musicstudioghmix_movehighway time = <note_time>
		switch ($musicstudio_note_edit_mode)
			case toggle_pattern
			musicstudio_toggle_pattern_update_name_text
			case drum_velocity
			musicstudio_edit_drum_velocity_update_name_text
			case drum_toggle_perc
			musicstudio_edit_drum_perc_toggle_update_name_text
			case guitar_sound_edit
			musicstudio_update_velocity_name_text
			musicstudio_update_chord_name_text
			musicstudio_update_note_name_text
			musicstudio_update_expressive_type_name_text
		endswitch
	else
		musicstudio_show_popup_warning warning = ($ghmix_warning_closest_note_fail_1)
	endif
endscript

script musicstudio_track_design_get_state 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		return \{musicstudio_state = musicstudio_note_track_design_drums_state}
	endif
	return \{musicstudio_state = musicstudio_note_track_design_state}
endscript

script musicstudio_track_design_get_active 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		return \{active = 0}
	endif
	return \{active = 1}
endscript

script musicstudio_skip_closest_note 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = false
	if gotparam \{mode}
		change musicstudio_note_edit_mode = <mode>
		musicstudio_skip_next_note \{direction = 0}
	else
		if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
			musicstudio_mainobj :musicstudioghmix_movehighway time = <note_time>
		else
			musicstudio_show_popup_warning warning = ($ghmix_warning_closest_note_fail_1)
		endif
	endif
endscript

script musicstudio_note_edit_mode_deinit 
	change \{musicstudio_note_edit_mode = none}
endscript

script musicstudio_note_edit_enable_whammy_skip 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
endscript

script musicstudio_toggle_pattern_is_active 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		return \{active = 1}
	else
		return \{active = 0}
	endif
endscript

script musicstudio_clear_pattern 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_mainobj :musicstudioghmix_updatenote index = <note_index> clear_pattern = true
		musicstudio_toggle_pattern_update_name_text
	endif
endscript

script musicstudio_toggle_pattern 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_mainobj :musicstudioghmix_updatenote index = <note_index> pattern = <color_pattern>
		if (<instrument> = 3)
			musicstudio_toggle_pattern_set_default_velocity color_index = <color_index> color_pattern = <color_pattern>
		endif
		musicstudio_toggle_pattern_update_name_text
	endif
	if (<instrument> = 3)
		musicstudio_preview_closest_drum_note
	endif
endscript

script musicstudio_toggle_pattern_set_default_velocity 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<color_pattern> && <note_pattern>)
			curr_velocity = (<note_drum_velocity_array> [<color_index>])
			if (<curr_velocity> = 0)
				musicstudio_mainobj :musicstudioghmix_updatenote {index = <note_index>
					drum_pattern = <color_pattern>
					drum_velocity = ($musicstudio_default_strum_velocity)}
			endif
		else
			musicstudio_mainobj :musicstudioghmix_updatenote {index = <note_index>
				drum_pattern = <color_pattern>
				drum_velocity = 0}
		endif
		music_studio_update_note_text no_scrub jam_instrument = <instrument> sound_index = <note_index>
	endif
endscript

script musicstudio_toggle_pattern_name_text 
	musicstudio_toggle_pattern_get_name_text color_pattern = <color_pattern>
	return name_text = <name_text>
endscript

script musicstudio_toggle_pattern_update_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if NOT (<instrument> = 3)
		pattern_array = [65536 4096 256 16 1]
		button_array = [green red yellow blue orange]
	else
		pattern_array = [1 65536 4096 256 16 1048576]
		button_array = [green red yellow blue orange back]
	endif
	getarraysize <pattern_array>
	index = 0
	begin
	musicstudio_toggle_pattern_get_name_text color_pattern = (<pattern_array> [<index>])
	musicstudio_menu_update_button_text button = (<button_array> [<index>]) button_text = <name_text>
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script musicstudio_toggle_pattern_get_name_text 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<note_pattern> && <color_pattern>)
			return \{name_text = qs(0x4c2d78d8)}
		else
			return \{name_text = qs(0xa472d802)}
		endif
	else
		return \{name_text = qs(0xf5b91c89)}
	endif
endscript

script musicstudio_preview_closest_drum_note 
	musicstudio_mainobj :musicstudio_getmainplayeridindex
	getplayerinfo <playerid_index> controller
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getplayerindex
		<main_player> :musicstudioplayer_getcontroller
		lefty_flip = 0
		if isdrumcontroller controller = <controller>
			getplayerinfo <player> lefty_flip
		endif
		if (<lefty_flip> = 0)
			pattern_array = [65536 4096 256 16 1 1048576]
			drum_pattern_array = [1 65536 4096 256 16 1048576]
			drum_pad_array = [tom2 snare hihat tom1 cymbal kick]
		else
			pattern_array = [4096 65536 1 16 256 1048576]
			drum_pattern_array = [1 65536 4096 256 16 1048576]
			drum_pad_array = [tom2 snare hihat tom1 cymbal kick]
		endif
		if gotparam \{velocity}
			<note_velocity> = <velocity>
		endif
		if gotparam \{color_index}
			musicstudio_play_sound_get_buss instrument = 3 pad = (<drum_pad_array> [<color_index>])
			jam_input_drum_strum {hold_pattern = (<pattern_array> [<color_index>])
				velocity = (<note_drum_velocity_array> [<color_index>])
				controller = <controller>
				buss = <buss>
				select_player = <playerid_index>
				loop_pitch = 0
				percussion = (<note_drum_perc_array> [<color_index>])
				loop}
		else
			getarraysize <pattern_array>
			index = 0
			begin
			if (<note_pattern> && (<drum_pattern_array> [<index>]))
				musicstudio_play_sound_get_buss instrument = 3 pad = (<drum_pad_array> [<index>])
				new_velocity = (<note_drum_velocity_array> [<index>])
				jam_input_drum_strum {hold_pattern = (<pattern_array> [<index>])
					velocity = (<note_drum_velocity_array> [<index>])
					controller = <controller>
					buss = <buss>
					select_player = <playerid_index>
					loop_pitch = 0
					percussion = (<note_drum_perc_array> [<index>])
					loop}
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
endscript

script musicstudio_preview_closest_note 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if gotparam \{chord_type}
			<note_chord_type> = <chord_type>
		endif
		if gotparam \{velocity}
			<note_velocity> = <velocity>
		endif
		if gotparam \{fret}
			<note_fret> = <fret>
		endif
		if gotparam \{string}
			<note_string> = <string>
		endif
		if NOT gotparam \{curr_bend}
			curr_bend = <note_expressive_type>
		endif
		expressive_struct = ($musicstudio_expressive_types [<curr_bend>])
		if structurecontains structure = <expressive_struct> bend
			curr_bend_name = (<expressive_struct>.bend)
			curr_bend_struct = ($<curr_bend_name>)
			if structurecontains structure = <curr_bend_struct> bend_from_last_note
				if (<note_index> > 0)
					musicstudio_preview_closest_note_set_last_pitch instrument = <instrument> note_index = (<note_index> - 1)
				else
					musicstudio_preview_closest_note_set_last_pitch instrument = <instrument> note_index = 0
				endif
			endif
		endif
		jam_get_sample_checksum {fret = <note_fret>
			string = <note_string>
			type = <note_type>
			chord_dir = 0
			chord_type = <note_chord_type>
			jam_instrument = <instrument>}
		final_note_sample = <sample_checksum>
		musicstudio_play_sound <...>
		if screenelementexists \{id = musicstudio_ghmix}
			if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
					param = alias_ghmix_highway}
				if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
					killspawnedscript \{name = musicstudio_stop_scrub_note}
					<ghmix_nowbar> :obj_spawnscriptnow musicstudio_stop_scrub_note params = {jam_instrument = <instrument>}
				endif
			endif
		endif
	endif
endscript

script musicstudio_preview_closest_note_set_last_pitch 
	getcustomnote track = ($jam_tracks [<instrument>].id) index = <note_index>
	musicstudio_scale_get_note_num string = <note_string> fret = <note_fret> show_flats = 0
	musicstudio_mainobj :musicstudio_setlastpitch {
		track_checksum = ($jam_tracks [<instrument>].id)
		last_pitch = <full_note_num>
	}
endscript

script musicstudio_update_velocity_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_velocity_name_text
		musicstudio_menu_update_button_text button = yellow button_text = <name_text>
	endif
endscript

script musicstudio_velocity_name_text 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		formattext textname = name_text qs(0xb6d317a1) a = <note_velocity>
		return name_text = <name_text>
	else
		return \{name_text = qs(0xf5b91c89)}
	endif
endscript

script musicstudio_update_expressive_type_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_expressive_type_name_text
		musicstudio_menu_update_button_text button = blue button_text = <name_text>
	endif
endscript

script musicstudio_expressive_type_name_text 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		formattext textname = name_text qs(0xa03a7de5) a = ($musicstudio_expressive_types [<note_expressive_type>].name_text)
		return name_text = <name_text>
	else
		return \{name_text = qs(0xf5b91c89)}
	endif
endscript

script musicstudio_change_expressive_type 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_mainobj :musicstudioghmix_updatenote index = <note_index> expressive_type = <index>
		music_studio_update_note_text jam_instrument = <instrument> sound_index = <note_index>
	endif
endscript

script musicstudio_get_selected_expressive_type 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		return selected = <note_expressive_type>
	else
		return \{selected = 0}
	endif
endscript

script musicstudio_preview_expressive_type 
	musicstudio_preview_closest_note curr_bend = <index>
endscript

script musicstudio_get_list_checksum_expressive_type 
	return \{list_checksum = musicstudio_expressive_types}
endscript

script musicstudio_update_chord_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<instrument> = 0)
			musicstudio_chord_name_text
			musicstudio_menu_update_button_text button = red button_text = <name_text>
		else
			musicstudio_update_strum_type_name_text
		endif
	endif
endscript

script musicstudio_chord_name_text 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<note_type> >= 2)
			formattext textname = name_text qs(0xe7082617) a = ($jam_special_chords [<note_chord_type>].name_text)
		else
			formattext textname = name_text qs(0x7fb065a7) a = ($rhythm_chord_types [<note_chord_type>].name_text)
		endif
		return name_text = <name_text>
	else
		return \{name_text = qs(0xf5b91c89)}
	endif
endscript

script musicstudio_change_chord 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_mainobj :musicstudioghmix_updatenote index = <note_index> chord_type = <index>
		music_studio_update_note_text jam_instrument = <instrument> sound_index = <note_index>
	endif
endscript

script musicstudio_get_selected_chord 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		return selected = <note_chord_type>
	else
		return \{selected = 0}
	endif
endscript

script musicstudio_preview_chord 
	musicstudio_preview_closest_note chord_type = <index>
endscript

script musicstudio_get_list_checksum_chord 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<note_type> >= 2)
			return \{list_checksum = jam_special_chords}
		endif
	endif
	return \{list_checksum = rhythm_chord_types}
endscript

script musicstudio_update_strum_type_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_strum_type_name_text
		musicstudio_strum_type_get_active
		musicstudio_menu_update_button_text button = red button_text = <name_text> active = <active>
	endif
endscript

script musicstudio_strum_type_choose_script 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<note_type> = 0)
			<note_type> = 3
		else
			<note_type> = 0
		endif
		musicstudio_mainobj :musicstudioghmix_updatenote index = <note_index> type = <note_type>
		musicstudio_update_strum_type_name_text
		musicstudio_preview_closest_note
	endif
endscript

script musicstudio_strum_type_get_active 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	switch <instrument>
		case 1
		return \{active = 1}
		case 2
		if NOT ($musicstudio_loadedbass_iskeyboard = 1)
			return \{active = 1}
		endif
	endswitch
	return \{active = 0}
endscript

script musicstudio_strum_type_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		switch <instrument>
			case 1
			note_type_text = qs(0x6d593c27)
			if (<note_type> = 3)
				note_type_text = qs(0xd1cb9389)
			endif
			formattext textname = name_text qs(0x11d44ff1) s = <note_type_text>
			return name_text = <name_text>
			case 2
			if NOT ($musicstudio_loadedbass_iskeyboard = 1)
				note_type_text = qs(0x6d593c27)
				if (<note_type> = 3)
					note_type_text = qs(0x92e7f202)
				endif
				formattext textname = name_text qs(0x11d44ff1) s = <note_type_text>
				return name_text = <name_text>
			endif
		endswitch
	endif
	return \{name_text = qs(0xe14eacee)}
endscript

script musicstudio_update_note_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_note_name_text
		musicstudio_note_get_active
		musicstudio_menu_update_button_text button = green active = <active> button_text = <name_text>
	endif
endscript

script musicstudio_note_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<note_type> >= 2 && <instrument> = 0)
			return \{name_text = qs(0x9b26654e)}
		endif
		musicstudio_chromatic_get_note_text string = <note_string> fret = <note_fret>
		formattext textname = name_text qs(0x2fd8b5f2) a = <note_text>
		return name_text = <name_text>
	else
		return \{name_text = qs(0xf5b91c89)}
	endif
endscript

script musicstudio_note_get_active 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<note_type> >= 2 && <instrument> = 0)
			return \{active = 0}
		endif
	endif
	return \{active = 1}
endscript

script musicstudio_chromatic_get_note_text 
	requireparams \{[
			string
			fret
		]
		all}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	scale_index = 5
	root_index = ($jam_track_rootnotes [<instrument>])
	musicstudio_scale_get_note_text string = <string> fret = <fret> root = <root_index> scale = <scale_index>
	return note_text = <note_text> full_note_num = <full_note_num>
endscript

script musicstudio_get_selected_chromatic_note 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_chromatic_get_note_text string = <note_string> fret = <note_fret>
	endif
	return selected = <full_note_num>
endscript

script musicstudio_notes_get_list_size 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	available_notes_array = ($musicstudio_lead_available_notes_array)
	if (<instrument> = 2)
		<available_notes_array> = ($musicstudio_bass_available_notes_array)
	endif
	list_size = 0
	switch <instrument>
		case 0
		list_size = ($jam_num_frets_rhythm_0 + $jam_num_frets_rhythm_1)
		case 1
		case 2
		case 4
		getarraysize <available_notes_array>
		index = 0
		begin
		<list_size> = (<list_size> + (<available_notes_array> [<index>]))
		<index> = (<index> + 1)
		repeat <array_size>
	endswitch
	return list_size = <list_size>
endscript

script musicstudio_preview_note 
	musicstudio_notes_get_string_fret_from_index index = <index>
	musicstudio_preview_closest_note string = <string> fret = <fret>
endscript

script musicstudio_change_note 
	musicstudio_notes_get_string_fret_from_index index = <index>
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_mainobj :musicstudioghmix_updatenote index = <note_index> string = <string> fret = <fret>
		music_studio_update_note_text jam_instrument = <instrument> sound_index = <note_index>
	endif
endscript

script musicstudio_notes_get_name_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_notes_get_string_fret_from_index index = <index>
	musicstudio_chromatic_get_note_text string = <string> fret = <fret>
	octave = (<full_note_num> / 12)
	casttointeger \{octave}
	<octave> = (<octave> + 1)
	switch <instrument>
		case 0
		if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
			formattext textname = name_text qs(0x6ecbac27) a = <note_text> b = ($rhythm_chord_types [<note_chord_type>].name_text) c = <string> d = <fret>
		endif
		default
		formattext textname = name_text qs(0xbd564c49) a = <note_text> b = <octave> c = <string> d = <fret>
	endswitch
	return name_text = <name_text>
endscript
musicstudio_lead_available_notes_array = [
	5
	5
	5
	4
	5
	22
]
musicstudio_bass_available_notes_array = [
	5
	5
	5
	21
]

script musicstudio_notes_get_string_fret_from_index 
	requireparams \{[
			index
		]
		all}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	available_notes_array = ($musicstudio_lead_available_notes_array)
	if (<instrument> = 2)
		<available_notes_array> = ($musicstudio_bass_available_notes_array)
	endif
	string = 0
	fret = <index>
	switch <instrument>
		case 0
		if (<fret> > $jam_num_frets_rhythm_0)
			<fret> = (<fret> - $jam_num_frets_rhythm_0)
			<string> = (<string> + 1)
		endif
		case 1
		case 2
		case 4
		getarraysize <available_notes_array>
		begin
		if (<fret> > (<available_notes_array> [<string>]))
			<fret> = (<fret> - (<available_notes_array> [<string>]))
			<string> = (<string> + 1)
		else
			break
		endif
		repeat <array_size>
	endswitch
	return string = <string> fret = <fret>
endscript

script musicstudio_note_sound_design_get_state 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_state = musicstudio_note_sound_design_state
	if (<instrument> = 0)
		<musicstudio_state> = musicstudio_note_sound_design_rhythm_state
	elseif (<instrument> = 3)
		<musicstudio_state> = musicstudio_note_sound_design_drums_state
	endif
	return musicstudio_state = <musicstudio_state>
endscript

script musicstudio_track_has_notes_get_active 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 1}
		return \{active = 1}
	else
		return \{active = 0}
	endif
endscript

script musicstudio_edit_drum_velocity_name_text 
	musicstudio_edit_drum_get_name_text color_pattern = <color_pattern> color_index = <color_index> drum_name = <drum_name>
	return name_text = <name_text>
endscript

script musicstudio_edit_drum_velocity_update_name_text 
	pattern_array = [1 65536 4096 256 16 1048576]
	drum_name_array = [qs(0x5c69e467) qs(0x91233341) qs(0x4d0311e7) qs(0x7744b7a4) qs(0x908b8fe5) qs(0x6e4b4a3e)]
	button_array = [green red yellow blue orange back]
	getarraysize <pattern_array>
	index = 0
	begin
	musicstudio_edit_drum_get_name_text color_pattern = (<pattern_array> [<index>]) color_index = <index> drum_name = (<drum_name_array> [<index>])
	musicstudio_menu_update_button_text button = (<button_array> [<index>]) button_text = <name_text>
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script musicstudio_edit_drum_get_name_text 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<note_pattern> && <color_pattern>)
			if ((<note_drum_velocity_array> [<color_index>]) >= 0)
				curr_velocity = (<note_drum_velocity_array> [<color_index>])
				<curr_velocity> = ((<curr_velocity> / 128.0) * 16.0)
				casttointeger \{curr_velocity}
				formattext textname = name_text qs(0xe91be69c) a = <drum_name> b = <curr_velocity>
				return name_text = <name_text>
			else
				return \{name_text = qs(0x9e0cb7ef)}
			endif
		else
			return \{name_text = qs(0x9e0cb7ef)}
		endif
	else
		return \{name_text = qs(0xf5b91c89)}
	endif
endscript
musicstudio_edit_drum_velocity_color_index = 0

script musicstudio_edit_drum_velocity_init 
	musicstudio_skip_closest_note mode = <mode>
	change \{musicstudio_edit_drum_velocity_color_index = 0}
endscript

script musicstudio_edit_drum_velocity_choose 
	change musicstudio_edit_drum_velocity_color_index = <color_index>
endscript

script musicstudio_drum_velocity_change_value_confirm 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		musicstudio_preview_closest_drum_note player = <player> velocity = <curr_value>
	endif
endscript

script musicstudio_drum_velocity_change_value 
	pattern_array = [1 65536 4096 256 16 1048576]
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		curr_velocity = ((<curr_value> / 16.0) * 128.0)
		casttointeger \{curr_velocity}
		musicstudio_mainobj :musicstudioghmix_updatenote {index = <note_index>
			drum_pattern = (<pattern_array> [($musicstudio_edit_drum_velocity_color_index)])
			drum_velocity = <curr_velocity>}
		music_studio_update_note_text no_scrub jam_instrument = <instrument> sound_index = <note_index>
		musicstudio_drum_velocity_preview player = <player>
	endif
endscript

script musicstudio_drum_velocity_get_curr_value 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		curr_velocity = (<note_drum_velocity_array> [$musicstudio_edit_drum_velocity_color_index])
		<curr_velocity> = ((<curr_velocity> / 128.0) * 16.0)
		casttointeger \{curr_velocity}
		return curr_value = <curr_velocity>
	endif
endscript

script musicstudio_drum_velocity_get_value_bounds 
	low_velocity = 0
	high_velocity = 15
	return low_bound = <low_velocity> high_bound = <high_velocity>
endscript

script musicstudio_drum_velocity_preview 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		musicstudio_preview_closest_drum_note player = <player> color_index = ($musicstudio_edit_drum_velocity_color_index) velocity = <curr_value>
	endif
endscript

script musicstudio_edit_drum_perc_toggle_name_text 
	musicstudio_edit_drum_perc_get_name_text color_pattern = <color_pattern> index = <color_index> drum_name = <drum_name>
	return name_text = <name_text>
endscript

script musicstudio_edit_drum_perc_toggle_get_active 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<note_pattern> && <color_pattern>)
			return \{active = 1}
		else
			return \{active = 0}
		endif
	else
		return \{active = 0}
	endif
endscript

script musicstudio_edit_drum_perc_toggle_update_name_text 
	pattern_array = [1 65536 4096 256 16 1048576]
	drum_name_array = [qs(0x5c69e467) qs(0x91233341) qs(0x4d0311e7) qs(0x7744b7a4) qs(0x908b8fe5) qs(0x6e4b4a3e)]
	button_array = [green red yellow blue orange back]
	getarraysize <pattern_array>
	index = 0
	begin
	musicstudio_edit_drum_perc_toggle_get_active color_pattern = (<pattern_array> [<index>])
	musicstudio_edit_drum_perc_get_name_text color_pattern = (<pattern_array> [<index>]) index = <index> drum_name = (<drum_name_array> [<index>])
	musicstudio_menu_update_button_text button = (<button_array> [<index>]) index = <index> button_text = <name_text> active = <active>
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script musicstudio_drum_perc_toggle 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getplayerindex
	getplayerinfo <player> lefty_flip
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		new_perc = 1
		if ((<note_drum_perc_array> [<color_index>]) = 1)
			<new_perc> = 0
		endif
		musicstudio_mainobj :musicstudioghmix_updatenote index = <note_index> drum_pattern = <color_pattern> drum_perc = <new_perc>
		musicstudio_edit_drum_perc_toggle_update_name_text
		music_studio_update_note_text no_scrub jam_instrument = <instrument> sound_index = <note_index>
	endif
	musicstudio_preview_closest_drum_note color_index = <color_index>
	musicstudio_mainobj :musicstudiohighway_reinit lefty = <lefty_flip> jam_instrument = <instrument>
endscript

script musicstudio_edit_drum_perc_get_name_text 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		if (<note_pattern> && <color_pattern>)
			type_text = qs(0xfd52050f)
			if (<note_drum_perc_array> [<index>] = 1)
				<type_text> = qs(0x18241dca)
			endif
			formattext textname = name_text qs(0xe91be69c) a = <drum_name> b = <type_text>
			return name_text = <name_text>
		else
			return \{name_text = qs(0x9e0cb7ef)}
		endif
	else
		return \{name_text = qs(0xf5b91c89)}
	endif
endscript

script musicstudio_velocity_change_value 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_mainobj :musicstudioghmix_updatenote index = <note_index> velocity = <curr_value>
		music_studio_update_note_text jam_instrument = <instrument> sound_index = <note_index>
	endif
endscript

script musicstudio_velocity_get_curr_value 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		return curr_value = <note_velocity>
	endif
endscript

script musicstudio_velocity_get_value_bounds 
	low_velocity = 0
	high_velocity = 127
	return low_bound = <low_velocity> high_bound = <high_velocity>
endscript

script musicstudio_velocity_up_down 
	musicstudio_velocity_change_value curr_value = <curr_value>
	musicstudio_velocity_preview player = <player> curr_value = <curr_value>
endscript

script musicstudio_velocity_preview 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		musicstudio_preview_closest_drum_note player = <player> velocity = <curr_value>
	endif
endscript

script musicstudio_velocity_add_subtract_update_note 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	printf channel = musicstudio qs(0xb5b19f86) s = <new_value>
	musicstudio_mainobj :musicstudioghmix_updatenote index = <note_index> velocity = <new_value>
	music_studio_update_note_text jam_instrument = <instrument> sound_index = <note_index>
	if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_menu
			param = ghmix_menu}
		<main_player> :musicstudiomenu_setchangevaluestate {
			id = <ghmix_menu>
			change_value_state = musicstudio_change_value_velocity
		}
	endif
endscript

script musicstudio_velocity_add_10 
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_velocity_get_value_bounds
		new_value = (<note_velocity> + 10)
		if (<new_value> > <high_bound>)
			<new_value> = <high_bound>
		endif
		musicstudio_velocity_add_subtract_update_note new_value = <new_value> note_index = <note_index>
	endif
endscript

script musicstudio_velocity_subtract_10 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if musicstudio_mainobj :musicstudioghmix_getclosestnote \{direction = 0}
		musicstudio_velocity_get_value_bounds
		new_value = (<note_velocity> - 10)
		if (<new_value> < <low_bound>)
			<new_value> = <low_bound>
		endif
		musicstudio_velocity_add_subtract_update_note new_value = <new_value> note_index = <note_index>
	endif
endscript
