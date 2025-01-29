musicstudio_buss_lookup = {
	rhythm = [
		jammode_rhythmguitar
	]
	lead = [
		jammode_leadguitar
	]
	bass = [
		jammode_bass
	]
	drums = {
		cymbal = [
			jammode_drums_cymbals_crash
		]
		hihat = [
			jammode_drums_cymbals_hats
		]
		tom1 = [
			jammode_drums_hats
		]
		tom2 = [
			jammode_drums_toms
		]
		kick = [
			jammode_drums_kick
		]
		snare = [
			jammode_drums_snare
		]
	}
	vocal = [
		jammode_vox
	]
}

script musicstudio_play_sound \{playback = 0
		note_expressive_type = -1}
	musicstudio_jamroom_visualizer_message <...>
	if (<instrument> = 5)
		return
	endif
	RequireParams \{[
			final_note_sample
			instrument
			note_type
		]
		all}
	fade_time_var = 0.2
	switch <instrument>
		case 0
		KillSpawnedScript \{Name = jam_input_stop_sound_rhythm}
		curr_sound_global = jam_input_current_chord
		fade_time_var = $jam_fade_time_cutoff
		case 1
		KillSpawnedScript \{Name = jam_input_stop_sound_lead}
		curr_sound_global = jam_input_current_lead
		fade_time_var = $jam_fade_time_cutoff
		case 2
		KillSpawnedScript \{Name = jam_input_stop_sound_bass}
		curr_sound_global = jam_input_current_bass
		fade_time_var = $jam_fade_time_kb
		case 4
		KillSpawnedScript \{Name = jam_input_stop_sound_melody}
		curr_sound_global = jam_input_current_melody
		fade_time_var = $jam_fade_time_kb
	endswitch
	if NOT GotParam \{curr_bend}
		if (<note_expressive_type> >= 0)
			musicstudio_mainobj :musicstudio_getbendset track = ($jam_tracks [<instrument>].id)
			curr_bend_set = ($musicstudio_bend_sets [<bend_set>].bend_set)
			curr_bend = ($<curr_bend_set> [<note_expressive_type>])
		else
			curr_bend = 0
		endif
	endif
	expressive_type_struct = ($musicstudio_expressive_types [<curr_bend>])
	KillSpawnedScript id = ($jam_tracks [<instrument>].spawn_id)
	KillSpawnedScript \{Name = musicstudio_stop_scrub_note}
	stopsound ($<curr_sound_global>) fade_type = linear fade_time = fade_time_var
	musicstudio_mainobj :musicstudio_playsoundgetscaledvolume {
		velocity = <note_velocity>
		db_low = ($musicstudio_scaled_volume_db_low)
		db_high = ($musicstudio_scaled_volume_db_high)
	}
	musicstudio_mainobj :musicstudio_playsoundgetscaledadsr {
		velocity = <note_velocity>
		adsr_params = ($musicstudio_scaled_adsr_params)
	}
	musicstudio_scale_get_note_num string = <note_string> fret = <note_fret> show_flats = 0
	bend_range = 0
	musicstudio_mainobj :musicstudio_getexpressiveparams {
		track_checksum = ($jam_tracks [<instrument>].id)
		note_num = <full_note_num>
		expressive_type_struct = <expressive_type_struct>
	}
	musicstudio_play_sound_get_buss instrument = <instrument>
	musicstudio_play_sound_get_pan instrument = <instrument>
	pitch_shift = (<pitch_shift> + <bend_range> + (($jam_current_tuning) / 10.0))
	switch <instrument>
		case 0
		musicstudio_play_sound_rhythm {
			final_note_sample = <final_note_sample>
			pitch_shift = <pitch_shift>
			note_type = <note_type>
			scaled_volume = <scaled_volume>
			scaled_adsr = <scaled_adsr>
			buss = <buss>
			bend_range = <bend_range>
			pan = <pan>
		}
		case 1
		musicstudio_play_sound_lead {
			final_note_sample = <final_note_sample>
			pitch_shift = <pitch_shift>
			note_type = <note_type>
			scaled_volume = <scaled_volume>
			scaled_adsr = <scaled_adsr>
			buss = <buss>
			bend_range = <bend_range>
			pan = <pan>
		}
		case 2
		musicstudio_play_sound_bass {
			final_note_sample = <final_note_sample>
			pitch_shift = <pitch_shift>
			note_string = <note_string>
			note_fret = <note_fret>
			scaled_volume = <scaled_volume>
			scaled_adsr = <scaled_adsr>
			buss = <buss>
			bend_range = <bend_range>
			pan = <pan>
		}
		case 4
		musicstudio_play_sound_melody {
			final_note_sample = <final_note_sample>
			pitch_shift = <pitch_shift>
			scaled_volume = <scaled_volume>
			scaled_adsr = <scaled_adsr>
			buss = <buss>
			bend_range = <bend_range>
			pan = <pan>
		}
	endswitch
	musicstudio_mainobj :musicstudio_playsoundbend {
		track_checksum = ($jam_tracks [<instrument>].id)
		curr_sound_unique_id = <unique_id>
		expressive_type_struct = <expressive_type_struct>
		original_pitch = <pitch_shift>
	}
	musicstudio_mainobj :musicstudio_playsoundvibrato {
		track_checksum = ($jam_tracks [<instrument>].id)
		curr_sound_unique_id = <unique_id>
		expressive_type_struct = <expressive_type_struct>
	}
	musicstudio_mainobj :musicstudio_setlastpitch {
		track_checksum = ($jam_tracks [<instrument>].id)
		last_pitch = <full_note_num>
	}
	Change GlobalName = <curr_sound_global> NewValue = <final_note_sample>
	if ($sfx_debug = 1)
		printf \{channel = sfx
			qs(0x03ac90f0)}
		printf channel = sfx qs(0x0bc409e2) a = ($jam_tracks [<instrument>].name_text)
		printf channel = sfx qs(0x19208504) b = <final_note_sample> c = <pitch_shift>
		printf channel = sfx qs(0xc7225da6) d = <curr_bend> e = <scaled_volume>
		printf \{channel = sfx
			qs(0x03ac90f0)}
	endif
	broadcastevent \{Type = jam_note_hit}
endscript

script musicstudio_play_sound_get_buss 
	RequireParams \{[
			instrument
		]
		all}
	switch <instrument>
		case 0
		buss = (($musicstudio_buss_lookup.rhythm) [0])
		case 1
		buss = (($musicstudio_buss_lookup.lead) [0])
		case 2
		buss = (($musicstudio_buss_lookup.bass) [0])
		case 3
		if GotParam \{pad}
			buss = ((($musicstudio_buss_lookup.drums).<pad>) [0])
		else
			buss = jammode_drums
		endif
		case 4
		buss = (($musicstudio_buss_lookup.vocal) [0])
		default
		ScriptAssert \{'Bad instrument, cant find buss'}
	endswitch
	return buss = <buss>
endscript

script musicstudio_play_sound_get_pan 
	gettrackinfo track = ($jam_tracks [<instrument>].id)
	return pan = (<pan> / 5.0)
endscript

script musicstudio_play_sound_rhythm 
	RequireParams \{[
			final_note_sample
			pitch_shift
		]
		all}
	StopSoundEvent jam_fret_noise_rhythm fade_time = ($jam_fade_time) fade_type = linear
	PlaySound {
		<final_note_sample>
		pitch = <pitch_shift>
		vol = <scaled_volume>
		buss = <buss>
		pan1x = <pan>
		pan1y = 1.0
		panremovecenter = true
		<scaled_adsr>
		attack_length = 0.0
		attack_function = log_fast
		decay_length = 0.5
		decay_function = log_slow
		release_length = 0.2
		release_function = linear
	}
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_lead 
	RequireParams \{[
			final_note_sample
			pitch_shift
		]
		all}
	StopSoundEvent jam_fret_noise_lead fade_time = ($jam_fade_time) fade_type = linear
	if GotParam \{no_vibrato}
		vibrato_struct = {bpm = $jam_current_bpm DEPTH = 0 time = 0}
	else
		musicstudio_mainobj :musicstudioghmix_getnotequantizems note = (1.0)
		note_quantize_s = (<note_quantize_ms> / 1000.0)
		vibrato_struct = {bpm = ($jam_current_bpm * 2) DEPTH = $jam_lead_vibrato_depth time = <note_quantize_s>}
	endif
	PlaySound {
		<final_note_sample>
		pitch = <pitch_shift>
		vol = <scaled_volume>
		buss = <buss>
		pan1x = <pan>
		pan1y = 1.0
		panremovecenter = true
		vibrato = <vibrato_struct>
		<scaled_adsr>
		attack_length = 0.0
		attack_function = log_fast
		decay_length = 0.5
		decay_function = log_slow
		release_length = 0.2
		release_function = linear
	}
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_bass 
	RequireParams \{[
			final_note_sample
			pitch_shift
			note_string
			note_fret
		]
		all}
	StopSoundEvent jam_fret_noise_bass_short fade_time = ($jam_fade_time) fade_type = linear
	StopSoundEvent jam_fret_noise_bass_medium fade_time = ($jam_fade_time) fade_type = linear
	PlaySound {
		<final_note_sample>
		pitch = <pitch_shift>
		vol = <scaled_volume>
		buss = <buss>
		release_function = linear
		release_time = 10.0
		release_length = 0.02
		pan1x = <pan>
		pan1y = 1.0
		<scaled_adsr>
		panremovecenter = true
		attack_length = 0.05
		attack_function = log_fast
		decay_length = 0.5
		decay_function = log_slow
		release_length = 0.5
		release_function = linear
	}
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_melody 
	RequireParams \{[
			pitch_shift
			final_note_sample
		]
		all}
	num_loops = -1
	if ($musicstudio_loadedkeyboard_isoneshot = 1)
		<num_loops> = 0
	endif
	PlaySound {
		<final_note_sample>
		pitch = <pitch_shift>
		vol = <scaled_volume>
		buss = <buss>
		pan1x = <pan>
		pan1y = 1.0
		<scaled_adsr>
		num_loops = <num_loops>
		panremovecenter = true
	}
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_get_panremovecenter_flag 
	return \{panremovecenter = true}
endscript
