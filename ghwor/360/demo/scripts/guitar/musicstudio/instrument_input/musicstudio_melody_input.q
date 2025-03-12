jam_input_current_melody = null
jam_input_current_melody_atk = null
jam_sustain_melody = 0
jam_melody_touch_count = 0
jam_melody_current_pattern = 0
jam_melody_last_pattern = 0
jam_melody_curr_midi_note = 0

script jam_input_melody \{spawn_id = jam_input_spawns}
	if NOT gotparam \{controller}
		getplayerinfo \{1
			controller}
	endif
	mid_up_strum = 0
	mid_down_strum = 0
	change \{jam_melody_touch_count = 0}
	jam_input_add_player_server player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_stop_sound_melody_midi 
	if (<midi_note> != $jam_melody_curr_midi_note)
		return
	endif
	wait \{2
		gameframes}
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
		stop = 1}
	jam_input_melody_stop_sound
endscript

script jam_input_stop_sound_melody \{select_player = 1
		check_touch = 0}
	wait \{$jam_input_strum_wait
		gameframes}
	getheldpattern controller = <controller> player = <select_player>
	melody_hold_pattern = <hold_pattern>
	current_melody = $jam_input_current_melody
	<open_strum> = 0
	if (<melody_hold_pattern> = 1048576)
		<open_strum> = 1
	endif
	begin
	getheldpattern controller = <controller> player = <select_player>
	if NOT (<melody_hold_pattern> && <hold_pattern>)
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
			stop = 1}
		break
	endif
	if NOT issoundplayingbyid \{$jam_input_current_melody}
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
			stop = 1}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_input_melody_stop_sound
endscript

script jam_input_melody_stop_sound 
	if issoundplayingbyid \{$jam_input_current_melody}
		stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = 0.05
	endif
endscript

script jam_input_melody_get_current_note 
	jam_active_scales = ($jam_track_scales_new)
	current_scale_name = (<jam_active_scales> [4])
	current_scale = ($<current_scale_name>)
	guitar_jam_scales_get_diatonic \{instrument = 4}
	if (<diatonic> = 1)
		if (<hold_pattern> = 17)
			note_struct = (<current_scale> [6])
		endif
	endif
	if (<hold_pattern> = 17)
		note_struct = (<current_scale> [6])
	elseif (<hold_pattern> && 1)
		note_struct = (<current_scale> [5])
	elseif (<hold_pattern> && 16)
		note_struct = (<current_scale> [4])
	elseif (<hold_pattern> && 256)
		note_struct = (<current_scale> [3])
	elseif (<hold_pattern> && 4096)
		note_struct = (<current_scale> [2])
	elseif (<hold_pattern> && 65536)
		note_struct = (<current_scale> [1])
	elseif (<hold_pattern> = 1048576)
		note_struct = (<current_scale> [0])
	endif
	if gotparam \{note_struct}
		root = ($jam_track_rootnotes [4])
		scale = ($jam_track_scaleindex [4])
		musicstudio_scale_get_note_text string = (<note_struct> [0]) fret = (<note_struct> [1]) root = <root> scale = <scale>
	else
		note_text = qs(0x03ac90f0)
	endif
	return single_note_text = <note_text>
endscript

script musicstudio_input_melody_tilt_update 
	<low_tilt> = 0.0
	<high_tilt> = 100.0
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [4])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> chromatic
		<chromatic> = 1
	else
		<chromatic> = 0
	endif
	if guitargetanalogueinfo controller = <controller>
		<spc_v_dist> = <righty>
		jam_calc_line_rot player = <player> spc_v_dist = <spc_v_dist>
		if (<chromatic> = 0)
			if (<line_rot> <= 30)
				change \{jam_tilt_melody = 0}
			else
				change \{jam_tilt_melody = 1}
			endif
		else
			if (<line_rot> <= 1)
				change \{jam_tilt_melody = 0}
			elseif (<line_rot> > 1 && <line_rot> < 50)
				change \{jam_tilt_melody = 1}
			elseif (<line_rot> > 50 && <line_rot> < 99)
				change \{jam_tilt_melody = 2}
			else
				change \{jam_tilt_melody = 3}
			endif
		endif
	endif
endscript

script jam_input_melody_display_note 
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
		stop = 1}
	spawnscriptnow jam_fretboard_add_note params = {player = <select_player> gem_pattern = <hold_pattern> sustain = jam_sustain_melody}
endscript

script jam_get_single_sample_for_melody_playback 
	<sample_checksum> = ($melody_sample)
	<oct> = 1
	if (<string> = 5)
		<oct> = 3
	elseif ((<string> = 2) && (<fret> >= 2))
		<oct> = 2
	elseif (<string> > 2)
		<oct> = 2
	endif
	begin
	if (<string> > 0)
		if (<string> = 4)
			<fret> = (<fret> - 8)
		else
			<fret> = (<fret> - 7)
		endif
		<string> = (<string> -1)
	endif
	if (<fret> < 0)
		<fret> = (<fret> + 12)
	endif
	if (<string> = 0)
		break
	endif
	repeat
	if (<oct> = 2)
		<fret> = (<fret> + 12)
	elseif (<oct> = 3)
		<fret> = (<fret> + 24)
	endif
	<range> = ($jam_melody_octave_range)
	if (<range> = 2)
		<fret> = (<fret> + 12)
	endif
	<final_pitch> = (<fret> -16)
	return sample_checksum = <sample_checksum> pitch_shift = <final_pitch>
endscript
