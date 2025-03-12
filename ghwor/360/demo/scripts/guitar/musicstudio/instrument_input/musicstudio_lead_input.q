jam_input_current_lead = null
jam_sustain_lead = 0
jam_lead_curr_midi_note = 0

script jam_input_lead \{spawn_id = jam_input_spawns
		select_player = 1
		hammer_on = 1}
	if NOT gotparam \{controller}
		getplayerinfo \{1
			controller}
	endif
	mid_up_strum = 0
	mid_down_strum = 0
	jam_input_add_player_server player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_stop_sound_lead_midi 
	if (<midi_note> != $jam_lead_curr_midi_note)
		return
	endif
	wait \{2
		gameframes}
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead
		stop = 1}
	stopsound \{unique_id = $jam_input_current_lead
		fade_type = log_fast
		fade_time = 0.3}
endscript

script jam_input_stop_sound_lead \{select_player = 1}
	if NOT gotparam \{controller}
		getplayerinfo \{1
			controller}
	endif
	wait \{$jam_input_strum_wait
		gameframes}
	getheldpattern controller = <controller> player = <select_player>
	lead_hold_pattern = <hold_pattern>
	jam_input_get_single_note pattern = <lead_hold_pattern>
	lead_hold_pattern = <single_note_pattern>
	begin
	getheldpattern controller = <controller> player = <select_player>
	jam_input_get_single_note pattern = <hold_pattern>
	<hold_pattern> = <single_note_pattern>
	if NOT (<lead_hold_pattern> = <hold_pattern>)
		if ((<hold_pattern> < <lead_hold_pattern>) || (<lead_hold_pattern> || <hold_pattern>) || <hold_pattern> = 1048576)
			jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead
				stop = 1}
			break
		endif
	endif
	if NOT issoundplayingbyid \{$jam_input_current_lead}
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead
			stop = 1}
		break
	endif
	wait \{1
		gameframe}
	repeat
	stopsound \{unique_id = $jam_input_current_lead
		fade_type = log_fast
		fade_time = 0.3}
endscript

script jam_input_get_single_note 
	single_note_pattern = 1048576
	if (<pattern> && 65536)
		<single_note_pattern> = 65536
	endif
	if (<pattern> && 4096)
		<single_note_pattern> = 4096
	endif
	if (<pattern> && 256)
		<single_note_pattern> = 256
	endif
	if (<pattern> && 16)
		<single_note_pattern> = 16
	endif
	if (<pattern> && 1)
		<single_note_pattern> = 1
	endif
	return single_note_pattern = <single_note_pattern>
endscript

script fret_noise_lead 
endscript

script jam_input_lead_get_current_note 
	jam_active_scales = ($jam_track_scales_new)
	current_scale_name = (<jam_active_scales> [1])
	current_scale = ($<current_scale_name>)
	guitar_jam_scales_get_diatonic \{instrument = 1}
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
		root = ($jam_track_rootnotes [1])
		scale = ($jam_track_scaleindex [1])
		musicstudio_scale_get_note_text string = (<note_struct> [0]) fret = (<note_struct> [1]) root = <root> scale = <scale>
	else
		note_text = qs(0x03ac90f0)
	endif
	return single_note_text = <note_text>
endscript

script musicstudio_input_lead_tilt_update 
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [1])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> chromatic
		<chromatic> = 1
	else
		<chromatic> = 0
	endif
	if guitargetanalogueinfo controller = <controller>
		<spc_v_dist> = <righty_unscaled>
		<spc_v_dist> = (<spc_v_dist> * 0.0078125)
		jam_calc_line_rot player = <player> spc_v_dist = <spc_v_dist>
		if (<chromatic> = 0)
			if (<line_rot> <= 30)
				change \{jam_tilt_lead = 0}
			else
				change \{jam_tilt_lead = 1}
			endif
		else
			if (<line_rot> <= 1)
				change \{jam_tilt_lead = 0}
			elseif (<line_rot> > 1 && <line_rot> < 50)
				change \{jam_tilt_lead = 1}
			elseif (<line_rot> > 50 && <line_rot> < 99)
				change \{jam_tilt_lead = 2}
			else
				change \{jam_tilt_lead = 3}
			endif
		endif
	endif
endscript

script jam_input_lead_display_note 
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead
		stop = 1}
	spawnscriptnow jam_fretboard_add_note params = {player = <select_player> gem_pattern = <hold_pattern> sustain = jam_sustain_lead hopo = <hopo_note>}
endscript
