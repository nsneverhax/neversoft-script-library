
script musicstudio_change_sound \{async = 0}
	if (<index> = -1)
		return
	endif
	if NOT GotParam \{instrument}
		musicstudio_get_player_instrument Player = <Player>
	endif
	<load_screen> = 0
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		<load_screen> = 1
	elseif musicstudio_mainobj :musicstudioghmix_isinghmix
		<load_screen> = 1
	endif
	if (<instrument> = 4)
		<load_screen> = 0
	endif
	if (<load_screen> = 1)
		Change \{musicstudio_loadedsound = add_load_screen}
	endif
	switch <instrument>
		case 0
		settrackinfo track = ($jam_tracks [<instrument>].id) effect = <index>
		SetArrayElement ArrayName = jam_current_instrument_effects globalarray index = <instrument> NewValue = <index>
		musicstudio_instrument_loadrhythmguitar index = <index>
		case 1
		settrackinfo track = ($jam_tracks [<instrument>].id) effect = <index>
		SetArrayElement ArrayName = jam_current_instrument_effects globalarray index = <instrument> NewValue = <index>
		musicstudio_instrument_loadleadguitar index = <index>
		case 2
		setsonginfo bass_kit = <index>
		musicstudio_instrument_loadbass index = <index>
		case 3
		if GotParam \{drum_kit_percussion}
			Change jam_current_percussion_kit = <index>
			loaddrumkitall \{reset_percussion = 0
				async = 0
				standard = 0
				heap_percussion = quota_percussion}
			setsonginfo percussion_kit = <index>
		elseif GotParam \{drum_kit_only}
			Change jam_current_drum_kit = <index>
			loaddrumkitall \{reset_percussion = 0
				async = 0
				percussion = 0
				heap_drums = quota_drums}
			setsonginfo drum_kit = <index>
		else
			Change jam_current_drum_kit = <index>
			loaddrumkitall \{reset_percussion = 0
				async = 0
				take_perc_from_base
				heap_drums = quota_drums
				heap_percussion = quota_percussion}
			setsonginfo drum_kit = <index>
			Change \{jam_current_percussion_kit = -1}
			find_percussion_from_base_kit drum_kit_index = <index>
			if GotParam \{percussion_kit_index}
				Change jam_current_percussion_kit = <percussion_kit_index>
			endif
			setsonginfo \{percussion_kit = $jam_current_percussion_kit}
		endif
		case 4
		setsonginfo keyboard_sound = <index>
		musicstudio_instrument_loadkeyboard index = <index>
	endswitch
	if (<load_screen> = 1)
		destroy_loading_screen
	endif
	Change \{musicstudio_loadedsound = NULL}
endscript

script musicstudio_change_sound_go_back 
endscript

script musicstudio_percussion_preview_sound 
	musicstudio_preview_sound percussion <...>
endscript

script musicstudio_preview_sound 
	musicstudio_get_player_instrument Player = <Player>
	switch <instrument>
		case 0
		sound_name = ($musicstudio_instrument_list_rhythm [<index>].prefix_nl)
		formatText checksumName = sample 'musicstudio_rhythm_%a' a = <sound_name>
		case 1
		sound_name = ($musicstudio_instrument_list_lead [<index>].prefix_nl)
		formatText checksumName = sample 'musicstudio_lead_%a' a = <sound_name>
		case 2
		sound_name = ($musicstudio_instrument_list_bass [<index>].prefix_nl)
		formatText checksumName = sample 'musicstudio_bass_%a' a = <sound_name>
		case 3
		if GotParam \{percussion}
			sound_name = ($percussion_drum_kits [<index>].string_id)
		else
			sound_name = ($drum_kits [<index>].string_id)
		endif
		formatText checksumName = sample 'musicstudio_drums_%a' a = <sound_name>
		case 4
		sound_name = ($musicstudio_instrument_list_keyboard [<index>].prefix_nl)
		formatText checksumName = sample 'musicstudio_keyboard_%a' a = <sound_name>
	endswitch
	musicstudio_stop_preview_sound <...>
	musicstudio_mainobj :Obj_SpawnScriptNow musicstudio_play_preview_sound params = {instrument = <instrument> sample = <sample>}
endscript

script musicstudio_get_selected_sound 
	musicstudio_get_player_instrument Player = <Player>
	switch <instrument>
		case 0
		case 1
		gettrackinfo track = ($jam_tracks [<instrument>].id)
		case 2
		getsonginfo
		<effect> = <bass_kit>
		case 3
		getsonginfo
		if GotParam \{percussion}
			<effect> = <percussion_kit>
		else
			<effect> = <drum_kit>
		endif
		case 4
		getsonginfo
		<effect> = <keyboard_sound>
	endswitch
	return selected = <effect>
endscript

script musicstudio_get_selected_sound_focusable 
	musicstudio_get_player_instrument Player = <Player>
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
	musicstudio_get_player_instrument Player = <Player>
	list_checksum = musicstudio_placeholder_options
	switch <instrument>
		case 0
		list_checksum = musicstudio_instrument_list_rhythm
		case 1
		list_checksum = musicstudio_instrument_list_lead
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
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	return instrument = <instrument>
endscript

script musicstudio_stop_preview_sound \{instrument = 0}
	switch (<instrument>)
		case 0
		stopsound \{$jam_input_current_chord_preview
			fade_type = linear
			fade_time = $jam_fade_time}
		case 1
		stopsound \{$jam_input_current_lead_preview
			fade_type = linear
			fade_time = $jam_fade_time}
		case 2
		stopsound \{$jam_input_current_bass_preview
			fade_type = linear
			fade_time = $jam_fade_time}
		case 3
		stopsound \{$jam_input_current_drums_preview
			fade_type = linear
			fade_time = $jam_fade_time}
		case 4
		stopsound \{$jam_input_current_melody_preview
			fade_type = linear
			fade_time = $jam_fade_time}
	endswitch
endscript

script musicstudio_play_preview_sound 
	RequireParams \{[
			instrument
			sample
		]
		all}
	switch <instrument>
		case 0
		Change jam_input_current_chord_preview = <sample>
		case 1
		Change jam_input_current_lead_preview = <sample>
		case 2
		Change jam_input_current_bass_preview = <sample>
		case 3
		Change jam_input_current_drums_preview = <sample>
		case 4
		Change jam_input_current_melody_preview = <sample>
	endswitch
	musicstudio_mainobj :musicstudio_playsoundgetscaledvolume {
		velocity = 100
		db_low = ($musicstudio_scaled_volume_db_low)
		db_high = ($musicstudio_scaled_volume_db_high)
	}
	musicstudio_play_sound_get_buss instrument = <instrument>
	musicstudio_play_sound_get_pan instrument = <instrument>
	PlaySound {
		<sample>
		vol = <scaled_volume>
		buss = <buss>
	}
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
	Wait \{1
		Second}
	jam_stop_sound jam_instrument = <instrument>
endscript

script load_musicstudio_soundpak \{async = 0
		Heap = quota_previews}
	RequireParams \{[
			path
		]
		all}
	if ispakloaded <path>
		return
	endif
	if (<async> = 1)
		spawnscript LoadPakAsync params = {pak_name = <path> Heap = <Heap> async = 1}
	else
		LoadPak <path> Heap = <Heap>
	endif
endscript

script unload_musicstudio_soundpak \{async = 0}
	RequireParams \{[
			path
		]
		all}
	if (<async> = 1)
		UnloadPakAsync pak_name = <path> async = 1
	else
		UnLoadPak <path>
		WaitUnloadPak <path> Block
	endif
endscript

script load_musicstudio_previews 
	load_musicstudio_soundpak \{path = 'pak/sounds/jam_mode/musicstudio_previews.pak'}
endscript

script unload_musicstudio_previews 
	unload_musicstudio_soundpak \{path = 'pak/sounds/jam_mode/musicstudio_previews.pak'}
endscript

script load_musicstudio_gameplay_sfx 
	load_musicstudio_soundpak \{path = 'pak/sounds/jam_mode/musicstudio_gameplay.pak'}
	load_musicstudio_soundpak \{path = 'pak/sounds/crowd/sfx_crowd_studio.pak'}
endscript

script unload_musicstudio_gameplay_sfx 
	unload_musicstudio_soundpak \{path = 'pak/sounds/jam_mode/musicstudio_gameplay.pak'}
	unload_musicstudio_soundpak \{path = 'pak/sounds/crowd/sfx_crowd_studio.pak'}
endscript
