jam_input_current_chord = null
jam_last_chord = 0
jam_input_current_rhythm_notetxt = qs(0x2ba2c9a2)
jam_input_current_rhythm_fullnotetxt = qs(0x2ba2c9a2)
jam_sustain_rhythm = 0
jam_input_strum_wait = 0

script jam_input_rhythm show_hud = 1 controller = ($player1_status.controller) spawn_id = jam_input_spawns select_player = 1
	mid_up_strum = 0
	mid_down_strum = 0
	spawnscriptnow jam_input_rhythm_chromatic_tilt id = <spawn_id> params = {controller = <controller> player = <select_player>}
	jam_input_add_player_server player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_rhythm_per_frame 
	instrument_controls = [enabled]
	if ($game_mode = training)
		if screenelementexists \{id = jam_band_container}
			jam_band_container :gettags
		elseif screenelementexists \{id = jam_studio_element}
			jam_studio_element :gettags
		endif
	endif
	if arraycontains array = <instrument_controls> contains = enabled
		if NOT (<touch_strum> = 1)
			if controllerpressed up <controller>
				if (<mid_up_strum> = 0)
					jam_input_rhythm_strum hold_pattern = <hold_pattern> up_strum = 1 spawn_id = <spawn_id> select_player = <select_player>
					spawnscriptnow jam_input_stop_sound_rhythm id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
				endif
				<mid_up_strum> = (<mid_up_strum> + 1)
			else
				<mid_up_strum> = 0
			endif
			if controllerpressed down <controller>
				if (<mid_down_strum> = 0)
					jam_input_rhythm_strum hold_pattern = <hold_pattern> up_strum = 0 spawn_id = <spawn_id> select_player = <select_player>
					spawnscriptnow jam_input_stop_sound_rhythm id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
				endif
				<mid_down_strum> = (<mid_down_strum> + 1)
			else
				<mid_down_strum> = 0
			endif
		else
			jam_input_rhythm_strum hold_pattern = <hold_pattern> mute = 1 up_strum = 0 spawn_id = <spawn_id> select_player = <select_player>
			spawnscriptnow jam_input_stop_sound_rhythm id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
		endif
	endif
	jam_input_whammy player = <select_player> controller = <controller>
	if (($jam_advanced_record) = 0)
		ui_event_get_stack
		if NOT (((<stack> [0].base_name) = 'options_cheats_new'))
			jam_check_simple_record_input controller = <controller> select_player = <select_player>
		endif
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

script jam_input_stop_sound_rhythm select_player = 1 controller = ($player1_status.controller)
	wait \{$jam_input_strum_wait
		gameframes}
	getheldpattern controller = <controller> player = <select_player> nobrokenstring
	chord_held_pattern = <hold_pattern>
	begin
	getheldpattern controller = <controller> player = <select_player> nobrokenstring
	if NOT (<chord_held_pattern> = <hold_pattern>)
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_rhythm
			stop = 1}
		break
	endif
	if NOT issoundplayingbyid \{$jam_input_current_chord}
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_rhythm
			stop = 1}
		break
	endif
	wait \{1
		gameframe}
	repeat
	stopsound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
	if ($jam_highway_step_recording = 0)
	endif
endscript

script fret_noise_rhythm 
	Random (
		@ soundevent \{event = jam_fret_noise_rhythm}
		@ 
		@ 
		@ 
		@ 
		)
endscript

script jam_calc_line_rot 
	jam_menu_get_lefty player = <player>
	if (<lefty> = 1)
	endif
	if (<spc_v_dist> > 0)
		return \{line_rot = 0}
	endif
	<line_rot> = (<spc_v_dist> * -100)
	return line_rot = <line_rot>
endscript

script jam_input_rhythm_chromatic_tilt controller = ($player1_status.controller)
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [0])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if NOT structurecontains structure = <chosen_scale> chromatic
		return
	endif
	begin
	if guitargetanalogueinfo controller = <controller>
		<spc_v_dist> = <righty>
		jam_calc_line_rot player = <player> spc_v_dist = <spc_v_dist>
		if (<line_rot> > 30)
			change \{jam_tilt_rhythm = 1}
		else
			change \{jam_tilt_rhythm = 0}
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_input_rhythm_strum show_hud = 1 spawn_id = <spawn_id> mute = 0
	getplayerinfo <select_player> controller
	strum_type = ($vocalist_info.strum)
	extendcrc <strum_type> '_Strums' out = strum_anims
	getarraysize ($<strum_anims>.med)
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	strum_anim = ($<strum_anims>.med [<newindex>])
	band_play_strum_anim name = vocalist anim = <strum_anim> blendduration = $strum_blend_time
	index = 0
	begin
	<chord_dir> = 1
	if (<up_strum> = 0)
		<chord_dir> = 0
	endif
	if NOT (<mute> = 1)
		if controllerpressed select <controller>
			<chord_type> = 3
		endif
	else
		<chord_type> = 3
	endif
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_rhythm}
	<pattern_array> = ($jam_button_patterns_singles)
	getarraysize <pattern_array>
	<count> = 0
	begin
	if (<hold_pattern> = (<pattern_array> [<count>]))
		jam_get_sample player = <select_player> button = <count> tilt = ($jam_tilt_rhythm) chord_dir = <chord_dir> chord_type = <chord_type>
		break
	endif
	<count> = (<count> + 1)
	repeat <array_size>
	if NOT gotparam \{final_note_sample}
		<pattern_array> = ($jam_button_patterns_chords)
		getarraysize <pattern_array>
		<count> = 0
		begin
		if (<hold_pattern> = (<pattern_array> [<count>]))
			jam_get_sample player = <select_player> button = <count> tilt = ($jam_tilt_rhythm) chord_dir = <chord_dir> chord_type = <chord_type>
			break
		endif
		<count> = (<count> + 1)
		repeat <array_size>
	endif
	if NOT gotparam \{final_note_sample}
		<pattern_array> = ($jam_button_patterns_bonus)
		getarraysize <pattern_array>
		<count> = 0
		begin
		if (<hold_pattern> = (<pattern_array> [<count>]))
			if NOT gotparam \{chord_type}
				<chord_type> = ($jam_bonus_pattern_samples)
			endif
			jam_get_sample player = <select_player> button = <count> tilt = ($jam_tilt_rhythm) chord_dir = <chord_dir> chord_type = <chord_type>
			break
		endif
		<count> = (<count> + 1)
		repeat <array_size>
	endif
	if NOT gotparam \{final_note_sample}
		<special_chords_array> = ($jam_special_chords)
		getarraysize <special_chords_array>
		<index> = 0
		begin
		<cur_special> = (<special_chords_array> [<index>])
		if (<hold_pattern> = (<cur_special>.pattern))
			<pitch_shift> = 0
			<note_string> = 0
			<note_fret> = 0
			<chord_type> = <index>
			if (<chord_dir> = 0)
				<note_type> = 2
			else
				<note_type> = 3
			endif
			jam_get_sample_checksum fret = <note_fret> string = <note_string> type = <note_type> chord_type = <chord_type> jam_instrument = 0
			<final_note_sample> = <sample_checksum>
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	if gotparam \{final_note_sample}
		<sustain> = 1
		jam_input_rhythm_play_note <...>
		return
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script jam_input_rhythm_get_current_note 
	fret_anims = ($vocalist_info.fret_anims)
	finger_anims = ($vocalist_info.finger_anims)
	<pattern_array> = ($jam_button_patterns_singles)
	getarraysize <pattern_array>
	<count> = 0
	begin
	if (<hold_pattern> = (<pattern_array> [<count>]))
		jam_get_sample player = <player> button = <count> tilt = ($jam_tilt_rhythm) chord_dir = 1 chord_type = 1 get_text = 1
		switch <count>
			case 0
			band_play_finger_anim name = vocalist anim = ($<finger_anims>.none)
			case 1
			band_play_finger_anim name = vocalist anim = ($<finger_anims>.green)
			band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_117)
			case 2
			band_play_finger_anim name = vocalist anim = ($<finger_anims>.red)
			band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_118)
			case 3
			band_play_finger_anim name = vocalist anim = ($<finger_anims>.yellow)
			band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_119)
			case 4
			band_play_finger_anim name = vocalist anim = ($<finger_anims>.blue)
			band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_120)
			case 5
			band_play_finger_anim name = vocalist anim = ($<finger_anims>.orange)
			band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_121)
			case 6
			band_play_finger_anim name = vocalist anim = ($<finger_anims>.none)
		endswitch
		break
	endif
	<count> = (<count> + 1)
	repeat <array_size>
	if NOT gotparam \{single_note_text}
		<pattern_array> = ($jam_button_patterns_chords)
		getarraysize <pattern_array>
		<count> = 0
		begin
		if (<hold_pattern> = (<pattern_array> [<count>]))
			switch <count>
				case 0
				band_play_finger_anim name = vocalist anim = ($<finger_anims>.none)
				case 1
				band_play_finger_anim name = vocalist anim = ($<finger_anims>.green_red)
				band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_117)
				case 2
				band_play_finger_anim name = vocalist anim = ($<finger_anims>.green_yellow)
				band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_118)
				case 3
				band_play_finger_anim name = vocalist anim = ($<finger_anims>.green_blue)
				band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_119)
				case 4
				band_play_finger_anim name = vocalist anim = ($<finger_anims>.green_orange)
				band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_120)
				case 5
				band_play_finger_anim name = vocalist anim = ($<finger_anims>.green_red_yellow)
				band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_121)
				case 6
				band_play_finger_anim name = vocalist anim = ($<finger_anims>.yellow_orange)
				band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_122)
				case 7
				band_play_finger_anim name = vocalist anim = ($<finger_anims>.blue_orange)
				band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_123)
			endswitch
			jam_get_sample player = <player> button = <count> tilt = ($jam_tilt_rhythm) chord_dir = 1 chord_type = 1 get_text = 1
			break
		endif
		<count> = (<count> + 1)
		repeat <array_size>
	endif
	if NOT gotparam \{single_note_text}
		<pattern_array> = ($jam_button_patterns_bonus)
		getarraysize <pattern_array>
		<count> = 0
		begin
		if (<hold_pattern> = (<pattern_array> [<count>]))
			jam_get_sample player = <player> button = <count> tilt = ($jam_tilt_rhythm) chord_dir = 1 chord_type = 1 get_text = 1
			band_play_finger_anim name = vocalist anim = ($<finger_anims>.blue_orange)
			band_play_fret_anim name = vocalist anim = ($<fret_anims>.track_120)
			break
		endif
		<count> = (<count> + 1)
		repeat <array_size>
	endif
	if NOT gotparam \{single_note_text}
		<special_chords_array> = ($jam_special_chords)
		getarraysize <special_chords_array>
		<index> = 0
		begin
		<cur_special> = (<special_chords_array> [<index>])
		if (<hold_pattern> = (<cur_special>.pattern))
			single_note_text = (<cur_special>.note_txt)
			note_string = qs(0x00000000)
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return single_note_text = <single_note_text> note_string = <note_string>
endscript

script jam_input_rhythm_play_note \{sustain = 0
		playback = 0
		note_type = 0
		chord_type = 0}
	if NOT gotparam \{final_note_sample}
		printf \{channel = jam_mode
			'Error: Got to rhythm_play_note without any sample'}
		return
	endif
	killspawnedscript \{name = jam_input_stop_sound_rhythm}
	stopsound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
	stopsoundevent \{jam_fret_noise_rhythm
		fade_time = 0.3
		fade_type = linear}
	switch <note_type>
		case 0
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		case 1
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		case 2
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		case 3
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
	endswitch
	change jam_input_current_chord = <unique_id>
	if ($jam_tutorial_status = active)
		broadcastevent type = jam_tutorial_rhythm_strum data = {hold_pattern = <hold_pattern> note_type = <note_type> chord_type = <chord_type>}
	endif
	if (<playback> = 0)
		spawnscriptnow jam_fretboard_add_note params = {player = <select_player> gem_pattern = <hold_pattern> sustain = jam_sustain_rhythm}
		<pulsate_id> = pulsate_rhythm_spawn_id
		killspawnedscript id = <pulsate_id>
		spawnscriptnow id = <pulsate_id> jam_band_pulsate_speaker_head params = {instrument = 0 spawn_id = <pulsate_id>}
		jam_record_note <...>
	endif
	broadcastevent \{type = jam_note_hit}
endscript
