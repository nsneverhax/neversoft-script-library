musicstudio_buss_lookup = {
	rhythm = [
		jammode_rhythmguitar
		jm_rhythm_line61
		jm_rhythm_line62
	]
	lead = [
		jammode_leadguitar
		jm_lead_line61
		jm_lead_line62
	]
	bass = [
		jammode_bass
		jm_bass_line61
		jm_bass_line62
	]
	drums = {
		cymbal = [
			jammode_drums_cymbals_crash
			jm_drums_cymbals_crash_line61
			jm_drums_cymbals_crash_line62
		]
		hihat = [
			jammode_drums_cymbals_hats
			jm_drums_cymbals_hats_line61
			jm_drums_cymbals_hats_line62
		]
		tom1 = [
			jammode_drums_hats
			jm_drums_hats_line61
			jm_drums_hats_line62
		]
		tom2 = [
			jammode_drums_toms
			jm_drums_toms_line61
			jm_drums_toms_line62
		]
		kick = [
			jammode_drums_kick
			jm_drums_kick_line61
			jm_drums_kick_line62
		]
		snare = [
			jammode_drums_snare
			jm_drums_snare_line61
			jm_drums_snare_line62
		]
	}
	vocal = [
		jammode_vox
		jm_keys_line61
		jm_keys_line62
	]
}

script musicstudio_play_sound \{playback = 0
		note_expressive_type = -1}
	musicstudio_jamroom_visualizer_message <...>
	if (<instrument> = 5)
		return
	endif
	requireparams \{[
			final_note_sample
			instrument
			note_type
		]
		all}
	fade_time_var = 0.2
	switch <instrument>
		case 0
		killspawnedscript \{name = jam_input_stop_sound_rhythm}
		curr_sound_global = jam_input_current_chord
		fade_time_var = $jam_fade_time_cutoff
		case 1
		killspawnedscript \{name = jam_input_stop_sound_lead}
		curr_sound_global = jam_input_current_lead
		fade_time_var = $jam_fade_time_cutoff
		case 2
		killspawnedscript \{name = jam_input_stop_sound_bass}
		curr_sound_global = jam_input_current_bass
		fade_time_var = $jam_fade_time_kb
		case 4
		killspawnedscript \{name = jam_input_stop_sound_melody}
		curr_sound_global = jam_input_current_melody
		fade_time_var = $jam_fade_time_kb
	endswitch
	if NOT gotparam \{curr_bend}
		if (<note_expressive_type> >= 0)
			musicstudio_mainobj :musicstudio_getbendset track = ($jam_tracks [<instrument>].id)
			curr_bend_set = ($musicstudio_bend_sets [<bend_set>].bend_set)
			curr_bend = ($<curr_bend_set> [<note_expressive_type>])
		else
			curr_bend = 0
		endif
	endif
	expressive_type_struct = ($musicstudio_expressive_types [<curr_bend>])
	killspawnedscript id = ($jam_tracks [<instrument>].spawn_id)
	killspawnedscript \{name = musicstudio_stop_scrub_note}
	stopsound unique_id = ($<curr_sound_global>) fade_type = linear fade_time = fade_time_var
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
	change globalname = <curr_sound_global> newvalue = <unique_id>
	if ($sfx_debug = 1)
		printf \{channel = sfx
			qs(0x03ac90f0)}
		printf channel = sfx qs(0x0bc409e2) a = ($jam_tracks [<instrument>].name_text)
		printf channel = sfx qs(0x19208504) b = <final_note_sample> c = <pitch_shift>
		printf channel = sfx qs(0xc7225da6) d = <curr_bend> e = <scaled_volume>
		printf \{channel = sfx
			qs(0x03ac90f0)}
	endif
	broadcastevent \{type = jam_note_hit}
endscript

script musicstudio_play_sound_get_buss 
	requireparams \{[
			instrument
		]
		all}
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	<lookup> = (<effect_type_index> + 1)
	switch <instrument>
		case 0
		buss = (($musicstudio_buss_lookup.rhythm) [<lookup>])
		case 1
		buss = (($musicstudio_buss_lookup.lead) [<lookup>])
		case 2
		buss = (($musicstudio_buss_lookup.bass) [<lookup>])
		case 3
		buss = ((($musicstudio_buss_lookup.drums).<pad>) [<lookup>])
		case 4
		buss = (($musicstudio_buss_lookup.vocal) [<lookup>])
		default
		scriptassert \{'Bad instrument, cant find buss'}
	endswitch
	return buss = <buss>
endscript

script musicstudio_play_sound_get_pan 
	getsonginfo
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	switch <effect_type_index>
		case 0
		case 1
		return \{pan = 0}
	endswitch
	gettrackinfo track = ($jam_tracks [<instrument>].id)
	return pan = (<pan> / 5.0)
endscript

script musicstudio_play_sound_rhythm 
	requireparams \{[
			final_note_sample
			pitch_shift
		]
		all}
	stopsoundevent jam_fret_noise_rhythm fade_time = ($jam_fade_time) fade_type = linear
	playsound {
		<final_note_sample>
		pitch = <pitch_shift>
		vol = <scaled_volume>
		buss = <buss>
		<scaled_adsr>
	}
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_lead 
	requireparams \{[
			final_note_sample
			pitch_shift
		]
		all}
	stopsoundevent jam_fret_noise_lead fade_time = ($jam_fade_time) fade_type = linear
	if gotparam \{no_vibrato}
		vibrato_struct = {bpm = $jam_current_bpm depth = 0 time = 0}
	else
		musicstudio_mainobj :musicstudioghmix_getnotequantizems note = (1.0)
		note_quantize_s = (<note_quantize_ms> / 1000.0)
		vibrato_struct = {bpm = ($jam_current_bpm * 2) depth = $jam_lead_vibrato_depth time = <note_quantize_s>}
	endif
	playsound {
		<final_note_sample>
		pitch = <pitch_shift>
		vol = <scaled_volume>
		buss = <buss>
		vibrato = <vibrato_struct>
		<scaled_adsr>
	}
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_bass 
	requireparams \{[
			final_note_sample
			pitch_shift
			note_string
			note_fret
		]
		all}
	stopsoundevent jam_fret_noise_bass_short fade_time = ($jam_fade_time) fade_type = linear
	stopsoundevent jam_fret_noise_bass_medium fade_time = ($jam_fade_time) fade_type = linear
	musicstudio_play_sound_get_panremovecenter_flag \{track = bass}
	if NOT ($musicstudio_loadedbass_iskeyboard = 1)
		playsound {
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
			panremovecenter = <panremovecenter>
		}
	else
		num_loops = -1
		if ($musicstudio_loadedbass_isoneshot = 1)
			<num_loops> = 0
		endif
		playsound {
			<final_note_sample>
			pitch = <pitch_shift>
			vol = <scaled_volume>
			buss = <buss>
			pan1x = <pan>
			pan1y = 1.0
			<scaled_adsr>
			num_loops = <num_loops>
			panremovecenter = <panremovecenter>
		}
	endif
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_melody 
	requireparams \{[
			pitch_shift
			final_note_sample
		]
		all}
	musicstudio_play_sound_get_panremovecenter_flag \{track = melody}
	num_loops = -1
	if ($musicstudio_loadedkeyboard_isoneshot = 1)
		<num_loops> = 0
	endif
	playsound {
		<final_note_sample>
		pitch = <pitch_shift>
		vol = <scaled_volume>
		buss = <buss>
		pan1x = <pan>
		pan1y = 1.0
		<scaled_adsr>
		num_loops = <num_loops>
		panremovecenter = <panremovecenter>
	}
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_get_panremovecenter_flag 
	requireparams \{[
			track
		]
		all}
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = <track>
	if (<effect_type_index> = -1)
		<panremovecenter> = true
	else
		<panremovecenter> = false
	endif
	return panremovecenter = <panremovecenter>
endscript
