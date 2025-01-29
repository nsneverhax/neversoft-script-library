musicstudio_buss_lookup = {
	rhythm = [
		JamMode_RhythmGuitar
		JM_Rhythm_Line61
		JM_Rhythm_Line62
	]
	lead = [
		JamMode_LeadGuitar
		JM_Lead_Line61
		JM_Lead_Line62
	]
	bass = [
		JamMode_Bass
		JM_Bass_Line61
		JM_Bass_Line62
	]
	drums = {
		cymbal = [
			JamMode_Drums_Cymbals_Crash
			JM_Drums_Cymbals_Crash_Line61
			JM_Drums_Cymbals_Crash_Line62
		]
		hihat = [
			JamMode_Drums_Cymbals_Hats
			JM_Drums_Cymbals_Hats_Line61
			JM_Drums_Cymbals_Hats_Line62
		]
		tom1 = [
			JamMode_Drums_Hats
			JM_Drums_Hats_Line61
			JM_Drums_Hats_Line62
		]
		tom2 = [
			JamMode_Drums_Toms
			JM_Drums_Toms_Line61
			JM_Drums_Toms_Line62
		]
		kick = [
			JamMode_Drums_Kick
			JM_Drums_Kick_Line61
			JM_Drums_Kick_Line62
		]
		snare = [
			JamMode_Drums_Snare
			JM_Drums_Snare_Line61
			JM_Drums_Snare_Line62
		]
	}
	vocal = [
		JamMode_Vox
		JM_Keys_Line61
		JM_Keys_Line62
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
	if NOT GotParam \{curr_bend}
		if (<note_expressive_type> >= 0)
			musicstudio_mainobj :MusicStudio_GetBendSet track = ($jam_tracks [<instrument>].id)
			curr_bend_set = ($musicstudio_bend_sets [<bend_set>].bend_set)
			curr_bend = ($<curr_bend_set> [<note_expressive_type>])
		else
			curr_bend = 0
		endif
	endif
	expressive_type_struct = ($musicstudio_expressive_types [<curr_bend>])
	killspawnedscript id = ($jam_tracks [<instrument>].spawn_id)
	killspawnedscript \{name = musicstudio_stop_scrub_note}
	StopSound unique_id = ($<curr_sound_global>) fade_type = linear fade_time = fade_time_var
	musicstudio_mainobj :MusicStudio_PlaySoundGetScaledVolume {
		velocity = <note_velocity>
		db_low = ($musicstudio_scaled_volume_db_low)
		db_high = ($musicstudio_scaled_volume_db_high)
	}
	musicstudio_mainobj :MusicStudio_PlaySoundGetScaledADSR {
		velocity = <note_velocity>
		adsr_params = ($musicstudio_scaled_adsr_params)
	}
	musicstudio_scale_get_note_num string = <note_string> Fret = <note_fret> show_flats = 0
	bend_range = 0
	musicstudio_mainobj :MusicStudio_GetExpressiveParams {
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
	musicstudio_mainobj :MusicStudio_PlaySoundBend {
		track_checksum = ($jam_tracks [<instrument>].id)
		curr_sound_unique_id = <unique_id>
		expressive_type_struct = <expressive_type_struct>
		original_pitch = <pitch_shift>
	}
	musicstudio_mainobj :MusicStudio_PlaySoundVibrato {
		track_checksum = ($jam_tracks [<instrument>].id)
		curr_sound_unique_id = <unique_id>
		expressive_type_struct = <expressive_type_struct>
	}
	musicstudio_mainobj :MusicStudio_SetLastPitch {
		track_checksum = ($jam_tracks [<instrument>].id)
		last_pitch = <full_note_num>
	}
	Change globalname = <curr_sound_global> newValue = <unique_id>
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
	RequireParams \{[
			instrument
		]
		all}
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = ($jam_tracks [<instrument>].id)
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
		ScriptAssert \{'Bad instrument, cant find buss'}
	endswitch
	return buss = <buss>
endscript

script musicstudio_play_sound_get_pan 
	GetSongInfo
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = ($jam_tracks [<instrument>].id)
	switch <effect_type_index>
		case 0
		case 1
		return \{pan = 0}
	endswitch
	GetTrackInfo track = ($jam_tracks [<instrument>].id)
	return pan = (<pan> / 5.0)
endscript

script musicstudio_play_sound_rhythm 
	RequireParams \{[
			final_note_sample
			pitch_shift
		]
		all}
	StopSoundEvent Jam_Fret_Noise_Rhythm fade_time = ($jam_fade_time) fade_type = linear
	PlaySound {
		<final_note_sample>
		pitch = <pitch_shift>
		vol = <scaled_volume>
		buss = <buss>
		<scaled_adsr>
	}
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_lead 
	RequireParams \{[
			final_note_sample
			pitch_shift
		]
		all}
	StopSoundEvent Jam_Fret_Noise_Lead fade_time = ($jam_fade_time) fade_type = linear
	if GotParam \{no_vibrato}
		vibrato_struct = {bpm = $jam_current_bpm depth = 0 time = 0}
	else
		musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0)
		note_quantize_s = (<note_quantize_ms> / 1000.0)
		vibrato_struct = {bpm = ($jam_current_bpm * 2) depth = $jam_lead_vibrato_depth time = <note_quantize_s>}
	endif
	PlaySound {
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
	RequireParams \{[
			final_note_sample
			pitch_shift
			note_string
			note_fret
		]
		all}
	StopSoundEvent Jam_Fret_Noise_bass_short fade_time = ($jam_fade_time) fade_type = linear
	StopSoundEvent Jam_Fret_Noise_bass_medium fade_time = ($jam_fade_time) fade_type = linear
	musicstudio_play_sound_get_panRemoveCenter_flag \{track = bass}
	if NOT ($MusicStudio_LoadedBass_IsKeyboard = 1)
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
			panRemoveCenter = <panRemoveCenter>
		}
	else
		num_loops = -1
		if ($MusicStudio_LoadedBass_IsOneShot = 1)
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
			panRemoveCenter = <panRemoveCenter>
		}
	endif
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_melody 
	RequireParams \{[
			pitch_shift
			final_note_sample
		]
		all}
	musicstudio_play_sound_get_panRemoveCenter_flag \{track = melody}
	num_loops = -1
	if ($MusicStudio_LoadedKeyboard_IsOneShot = 1)
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
		panRemoveCenter = <panRemoveCenter>
	}
	return unique_id = <unique_id>
endscript

script musicstudio_play_sound_get_panRemoveCenter_flag 
	RequireParams \{[
			track
		]
		all}
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = <track>
	if (<effect_type_index> = -1)
		<panRemoveCenter> = true
	else
		<panRemoveCenter> = false
	endif
	return panRemoveCenter = <panRemoveCenter>
endscript
