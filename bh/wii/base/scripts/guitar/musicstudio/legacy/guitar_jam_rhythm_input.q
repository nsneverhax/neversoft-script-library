jam_input_current_chord = NULL
jam_last_chord = 0
jam_input_current_rhythm_notetxt = qs(0x2ba2c9a2)
jam_input_current_rhythm_fullnotetxt = qs(0x2ba2c9a2)
jam_sustain_rhythm = 0
jam_input_strum_wait = 0

script jam_input_rhythm \{show_hud = 1
		spawn_id = jam_input_spawns
		select_player = 1}
	if NOT GotParam \{controller}
		getplayerinfo \{1
			controller}
	endif
	mid_up_strum = 0
	mid_down_strum = 0
	jam_input_add_player_server Player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_rhythm_per_frame 
	instrument_controls = [Enabled]
	if ($game_mode = practice)
		if ScreenElementExists \{id = jam_band_container}
			jam_band_container :GetTags
		elseif ScreenElementExists \{id = jam_studio_element}
			jam_studio_element :GetTags
		endif
	endif
	if ArrayContains array = <instrument_controls> contains = Enabled
		if (<midi_note> = -1)
			if NOT (<touch_strum> = 1)
				if ControllerPressed up <controller>
					if (<mid_up_strum> = 0)
						jam_input_rhythm_strum hold_pattern = <hold_pattern> up_strum = 1 spawn_id = <spawn_id> select_player = <select_player>
						SpawnScriptNow jam_input_stop_sound_rhythm id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
					<mid_up_strum> = (<mid_up_strum> + 1)
				else
					<mid_up_strum> = 0
				endif
				if ControllerPressed down <controller>
					if (<mid_down_strum> = 0)
						jam_input_rhythm_strum hold_pattern = <hold_pattern> up_strum = 0 spawn_id = <spawn_id> select_player = <select_player>
						SpawnScriptNow jam_input_stop_sound_rhythm id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
					<mid_down_strum> = (<mid_down_strum> + 1)
				else
					<mid_down_strum> = 0
				endif
			else
				jam_input_rhythm_strum hold_pattern = <hold_pattern> mute = 1 up_strum = 0 spawn_id = <spawn_id> select_player = <select_player>
				SpawnScriptNow jam_input_stop_sound_rhythm id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
			endif
		else
			if (<midi_note> >= 48 && <midi_note> <= 58)
				Change jam_midi_rhythm_mode = (<midi_note> - 48)
			else
				if (<midi_note_on> = 1)
					if (<mid_up_strum> = 0)
						jam_update_falling_gem_sustain \{sustain_global = jam_sustain_rhythm
							stop = 1}
						KillSpawnedScript \{Name = jam_input_stop_sound_rhythm_midi}
						up_strum = 0
						if (<midi_note_velocity> > 100)
							<up_strum> = 1
						endif
						jam_input_rhythm_strum midi_note = <midi_note> hold_pattern = <hold_pattern> up_strum = <up_strum> spawn_id = <spawn_id> select_player = <select_player>
						<mid_up_strum> = (<mid_up_strum> + 1)
					endif
				else
					SpawnScriptNow id = <spawn_id> jam_input_stop_sound_rhythm_midi params = {midi_note = <midi_note>}
				endif
			endif
		endif
	endif
	jam_input_whammy Player = <select_player> controller = <controller>
	if (($jam_advanced_record) = 0)
		ui_event_get_stack
		if NOT (((<stack> [0].base_name) = 'options_cheats_new'))
			jam_check_simple_record_input controller = <controller> select_player = <select_player>
		endif
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript
jam_midi_rhythm_mode = 0
jam_rhythm_curr_melody_note = 0

script jam_input_stop_sound_rhythm_midi 
	if (<midi_note> != $jam_rhythm_curr_melody_note)
		return
	endif
	Wait \{2
		gameframes}
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_rhythm
		stop = 1}
	stopsound \{$jam_input_current_chord
		fade_type = linear
		fade_time = $jam_fade_time}
endscript

script jam_input_stop_sound_rhythm \{select_player = 1}
	if NOT GotParam \{controller}
		getplayerinfo \{1
			controller}
	endif
	Wait \{$jam_input_strum_wait
		gameframes}
	GetHeldPattern controller = <controller> Player = <select_player>
	chord_held_pattern = <hold_pattern>
	begin
	GetHeldPattern controller = <controller> Player = <select_player>
	if NOT (<chord_held_pattern> = <hold_pattern>)
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_rhythm
			stop = 1}
		break
	endif
	if NOT issoundplaying \{$jam_input_current_chord}
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_rhythm
			stop = 1}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	stopsound \{$jam_input_current_chord
		fade_type = linear
		fade_time = $jam_fade_time}
	if ($jam_highway_step_recording = 0)
	endif
endscript

script fret_noise_rhythm 
	Random (
		@ SoundEvent \{event = jam_fret_noise_rhythm}
		@ 
		@ 
		@ 
		@ 
		)
endscript

script jam_calc_line_rot 
	jam_menu_get_lefty Player = <Player>
	if (<lefty> = 1)
	endif
	if (<spc_v_dist> > 0)
		return \{line_rot = 0}
	endif
	<line_rot> = (<spc_v_dist> * -100)
	return line_rot = <line_rot>
endscript

script musicstudio_rhythm_chromatic_tilt_update 
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [0])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if NOT StructureContains structure = <chosen_scale> chromatic
		return
	endif
	if GuitarGetAnalogueInfo controller = <controller>
		<spc_v_dist> = <righty>
		jam_calc_line_rot Player = <Player> spc_v_dist = <spc_v_dist>
		if (<line_rot> > 30)
			Change \{jam_tilt_rhythm = 1}
		else
			Change \{jam_tilt_rhythm = 0}
		endif
	endif
endscript

script jam_input_rhythm_get_current_note 
	jam_active_scales = ($jam_track_scales_new)
	current_scale_name = (<jam_active_scales> [0])
	current_scale = ($<current_scale_name>)
	scale_index = ($jam_track_scaleindex [0])
	chord_pattern = ($jam_scales_new [<scale_index>].chord_pattern)
	<pattern_array> = ($jam_button_patterns_singles)
	GetArraySize <pattern_array>
	<count> = 0
	begin
	if (<hold_pattern> = (<pattern_array> [<count>]))
		note_struct = (<current_scale> [<count>])
		chord_type = 0
		if ($jam_rhythm_chord_type = 1)
			chord_type = ($<chord_pattern> [<count>])
		endif
		break
	endif
	<count> = (<count> + 1)
	repeat <array_Size>
	if NOT GotParam \{single_note_text}
		<pattern_array> = ($jam_button_patterns_chords)
		GetArraySize <pattern_array>
		<count> = 0
		begin
		if (<hold_pattern> = (<pattern_array> [<count>]))
			note_struct = (<current_scale> [<count>])
			chord_type = 0
			if ($jam_rhythm_chord_type = 1)
				chord_type = ($<chord_pattern> [<count>])
			endif
			break
		endif
		<count> = (<count> + 1)
		repeat <array_Size>
	endif
	if NOT GotParam \{single_note_text}
		<pattern_array> = ($jam_button_patterns_bonus)
		GetArraySize <pattern_array>
		<count> = 0
		begin
		if (<hold_pattern> = (<pattern_array> [<count>]))
			note_struct = (<current_scale> [<count>])
			chord_type = 0
			if ($jam_rhythm_chord_type = 0)
				chord_type = ($<chord_pattern> [<count>])
			endif
			break
		endif
		<count> = (<count> + 1)
		repeat <array_Size>
	endif
	if GotParam \{note_struct}
		root = ($jam_track_rootnotes [0])
		Scale = ($jam_track_scaleindex [0])
		musicstudio_scale_get_note_text string = (<note_struct> [0]) fret = (<note_struct> [1]) root = <root> Scale = <Scale>
		formatText TextName = note_text qs(0x646d1d57) a = <note_text> b = ($rhythm_chord_types [<chord_type>].small_name_text)
	else
		note_text = qs(0xc1e75f6d)
	endif
	return single_note_text = <note_text> note_string = <note_text>
endscript

script jam_input_rhythm_display_note 
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_rhythm
		stop = 1}
	SpawnScriptNow jam_fretboard_add_note params = {Player = <select_player> gem_pattern = <hold_pattern> sustain = jam_sustain_rhythm}
	if ($jam_tutorial_status = Active)
		broadcastevent Type = jam_tutorial_rhythm_strum data = {hold_pattern = <hold_pattern> note_type = <note_type> chord_type = <chord_type>}
	endif
endscript
