jam_input_current_lead = null
jam_sustain_lead = 0

script jam_input_lead controller = ($player1_status.controller) spawn_id = jam_input_spawns select_player = 1 hammer_on = 1
	mid_up_strum = 0
	mid_down_strum = 0
	spawnscriptnow jam_input_lead_tilt id = <spawn_id> params = {controller = <controller> player = <select_player>}
	jam_input_add_player_server player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_lead_per_frame 
	instrument_controls = [enabled]
	if ($game_mode = training)
		if screenelementexists \{id = jam_band_container}
			jam_band_container :gettags
		elseif screenelementexists \{id = jam_studio_element}
			jam_studio_element :gettags
		endif
	endif
	if arraycontains array = <instrument_controls> contains = enabled
		if (<midi_note> = -1)
			if NOT (<touch_strum> = 1)
				if controllerpressed up <controller>
					if (<mid_up_strum> = 0)
						jam_input_lead_strum spawn_id = <spawn_id> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_lead id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
					<mid_up_strum> = (<mid_up_strum> + 1)
				else
					<mid_up_strum> = 0
				endif
				if controllerpressed down <controller>
					if (<mid_down_strum> = 0)
						jam_input_lead_strum spawn_id = <spawn_id> hold_pattern = <hold_pattern> up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_lead id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
					<mid_down_strum> = (<mid_down_strum> + 1)
				else
					<mid_down_strum> = 0
				endif
			else
				jam_input_lead_strum spawn_id = <spawn_id> hold_pattern = <hold_pattern> mute = 1 up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
				spawnscriptnow jam_input_stop_sound_lead id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
			endif
			jam_input_whammy player = <select_player> controller = <controller>
		else
			if (<midi_note_on> = 1)
				if (<mid_up_strum> = 0)
					jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead
						stop = 1}
					killspawnedscript \{name = jam_input_stop_sound_lead_midi}
					mute = 0
					if (<midi_note_velocity> < 40)
						<mute> = 1
					endif
					jam_input_lead_strum midi_note = <midi_note> spawn_id = <spawn_id> hold_pattern = <hold_pattern> mute = <mute> up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
					<mid_up_strum> = (<mid_up_strum> + 1)
				endif
			else
				spawnscriptnow id = <spawn_id> jam_input_stop_sound_lead_midi params = {midi_note = <midi_note>}
			endif
		endif
	endif
	if (($jam_advanced_record) = 0)
		jam_check_simple_record_input controller = <controller> select_player = <select_player>
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript
jam_lead_curr_midi_note = 0

script jam_input_lead_per_frame_no_strum 
	if controllerpressed up <controller>
		<mid_up_strum> = (<mid_up_strum> + 1)
	else
		<mid_up_strum> = 0
	endif
	if controllerpressed down <controller>
		<mid_down_strum> = (<mid_down_strum> + 1)
	else
		<mid_down_strum> = 0
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
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

script jam_input_stop_sound_lead select_player = 1 controller = ($player1_status.controller)
	wait \{$jam_input_strum_wait
		gameframes}
	getheldpattern controller = <controller> player = <select_player> nobrokenstring
	lead_hold_pattern = <hold_pattern>
	jam_input_get_single_note pattern = <lead_hold_pattern>
	<lead_hold_pattern> = <single_note_pattern>
	begin
	getheldpattern controller = <controller> player = <select_player> nobrokenstring
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
	if ($jam_highway_step_recording = 0)
	endif
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
	if (<pattern> = 17)
		return \{single_note_pattern = 17}
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

script jam_input_lead_strum controller = ($player2_status.controller) hammer_on = 1 mute = 0
	final_note_sample = null
	if gotparam \{midi_note}
		if (<midi_note> >= 28 && <midi_note> <= 74)
			change jam_lead_curr_midi_note = <midi_note>
			<pitch_shift> = 0
			<note_string> = 0
			<note_fret> = (<midi_note> - 28)
			<chord_dir> = <up_strum>
			string_wrap = [4 4 4 3 4]
			getarraysize <string_wrap>
			new_fret = <note_fret>
			new_string = 0
			wrap_done = 0
			begin
			if (<new_fret> > <string_wrap> [<new_string>])
				<new_fret> = (<new_fret> - (<string_wrap> [<new_string>] + 1))
				<new_string> = (<new_string> + 1)
			else
				<wrap_done> = 1
				break
			endif
			repeat <array_size>
			if (<wrap_done> = 0)
				<string_wrap> = [12 13]
				getarraysize <string_wrap>
				<new_string> = 3
				<new_fret> = (<new_fret> + 9)
				begin
				if (<new_fret> > <string_wrap> [(<new_string> - 3)])
					<new_fret> = (<new_fret> - (<string_wrap> [(<new_string> - 3)] + 1))
					<new_fret> = (<new_fret> + 9)
					<new_string> = (<new_string> + 1)
				else
					break
				endif
				repeat <array_size>
			endif
			<note_fret> = <new_fret>
			<note_string> = <new_string>
			printf channel = jam_mode qs(0x4de6200f) a = <midi_note> b = <note_fret> c = <note_string>
			if (<mute> = 1)
				<note_type> = 3
			else
				<note_type> = 0
			endif
			jam_get_sample_checksum fret = <note_fret> string = <note_string> type = <note_type> chord_type = <chord_type> jam_instrument = 1
			<final_note_sample> = <sample_checksum>
		else
			return
		endif
	else
		note_type = 0
		if NOT (<mute> = 1)
			if controllerpressed select <controller>
				<note_type> = 3
			endif
		else
			<note_type> = 3
		endif
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead}
		scale_index = ($jam_track_scaleindex [1])
		if ((<scale_index> = 0) || (<scale_index> = 4))
			if (<hold_pattern> = 17)
				jam_get_sample player = <select_player> button = 6 sample_type = <note_type> tilt = ($jam_tilt_lead)
			endif
			if NOT (<final_note_sample> = null)
				<sustain> = 1
				jam_input_lead_play_note <...>
				return
			endif
		endif
		strum_type = ($guitarist_info.strum)
		extendcrc <strum_type> '_Strums' out = strum_anims
		getarraysize ($<strum_anims>.med)
		getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
		strum_anim = ($<strum_anims>.med [<newindex>])
		band_play_strum_anim name = guitarist anim = <strum_anim> blendduration = $strum_blend_time
		if (<hold_pattern> && 1)
			<hold_pattern> = 1
			jam_get_sample player = <select_player> button = 5 sample_type = <note_type> tilt = ($jam_tilt_lead)
		elseif (<hold_pattern> && 16)
			<hold_pattern> = 16
			jam_get_sample player = <select_player> button = 4 sample_type = <note_type> tilt = ($jam_tilt_lead)
		elseif (<hold_pattern> && 256)
			<hold_pattern> = 256
			jam_get_sample player = <select_player> button = 3 sample_type = <note_type> tilt = ($jam_tilt_lead)
		elseif (<hold_pattern> && 4096)
			<hold_pattern> = 4096
			jam_get_sample player = <select_player> button = 2 sample_type = <note_type> tilt = ($jam_tilt_lead)
		elseif (<hold_pattern> && 65536)
			<hold_pattern> = 65536
			jam_get_sample player = <select_player> button = 1 sample_type = <note_type> tilt = ($jam_tilt_lead)
		elseif (<hold_pattern> && 1048576)
			<hold_pattern> = 1048576
			jam_get_sample player = <select_player> button = 0 sample_type = <note_type> tilt = ($jam_tilt_lead)
		endif
	endif
	if NOT (<final_note_sample> = null)
		<sustain> = 1
		jam_input_lead_play_note <...>
	endif
endscript

script jam_input_lead_hopo spawn_id = jam_input_spawns controller = ($player2_status.controller)
	if controllerpressed select <controller>
		return
	endif
	final_note_sample = null
	if (<hold_pattern> && 1)
		<hold_pattern> = 1
		jam_get_sample player = <select_player> button = 5 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 5 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 16)
		<hold_pattern> = 16
		jam_get_sample player = <select_player> button = 4 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 4 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 256)
		<hold_pattern> = 256
		jam_get_sample player = <select_player> button = 3 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 3 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 4096)
		<hold_pattern> = 4096
		jam_get_sample player = <select_player> button = 2 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 2 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 65536)
		<hold_pattern> = 65536
		jam_get_sample player = <select_player> button = 1 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 1 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	endif
	if NOT (<final_note_sample> = null)
		if (<hammer> = 1)
			<final_note_sample> = <hammer_sample>
			<note_type> = 1
		else
			<final_note_sample> = <pulloff_sample>
			<note_type> = 2
		endif
		<hopo_note> = 1
		<sustain> = 1
		jam_input_lead_play_note <...>
		spawnscriptnow jam_input_stop_sound_lead id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
	endif
endscript

script jam_input_lead_get_current_note 
	scale_index = ($jam_track_scaleindex [1])
	if ((<scale_index> = 0) || (<scale_index> = 4))
		if (<hold_pattern> = 17)
			jam_get_sample player = <player> button = 6 tilt = ($jam_tilt_lead) get_text = 1
			if gotparam \{single_note_text}
				return single_note_text = <single_note_text>
			else
				return \{single_note_text = qs(0xca3bb3d6)}
			endif
		endif
	endif
	fret_anims = ($guitarist_info.fret_anims)
	finger_anims = ($guitarist_info.finger_anims)
	if (<hold_pattern> && 1)
		jam_get_sample player = <player> button = 5 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim name = guitarist anim = ($<finger_anims>.green)
		band_play_fret_anim name = guitarist anim = ($<fret_anims>.track_117)
	elseif (<hold_pattern> && 16)
		jam_get_sample player = <player> button = 4 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim name = guitarist anim = ($<finger_anims>.green_red)
		band_play_fret_anim name = guitarist anim = ($<fret_anims>.track_118)
	elseif (<hold_pattern> && 256)
		jam_get_sample player = <player> button = 3 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim name = guitarist anim = ($<finger_anims>.yellow)
		band_play_fret_anim name = guitarist anim = ($<fret_anims>.track_119)
	elseif (<hold_pattern> && 4096)
		jam_get_sample player = <player> button = 2 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim name = guitarist anim = ($<finger_anims>.blue_orange)
		band_play_fret_anim name = guitarist anim = ($<fret_anims>.track_120)
	elseif (<hold_pattern> && 65536)
		jam_get_sample player = <player> button = 1 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim name = guitarist anim = ($<finger_anims>.green_blue)
		band_play_fret_anim name = guitarist anim = ($<fret_anims>.track_121)
	elseif (<hold_pattern> = 1048576)
		jam_get_sample player = <player> button = 0 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim name = guitarist anim = ($<finger_anims>.none)
	endif
	if gotparam \{single_note_text}
		return single_note_text = <single_note_text>
	else
		return \{single_note_text = qs(0xca3bb3d6)}
	endif
endscript

script jam_input_lead_tilt 
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [1])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> chromatic
		<chromatic> = 1
	else
		<chromatic> = 0
	endif
	begin
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
	else
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_input_lead_play_note \{sustain = 0
		playback = 0}
	killspawnedscript \{name = jam_input_stop_sound_lead}
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead
		stop = 1}
	stopsound \{unique_id = $jam_input_current_lead
		fade_type = linear
		fade_time = $jam_fade_time}
	stopsoundevent \{jam_fret_noise_lead
		fade_time = 0.2
		fade_type = linear}
	if gotparam \{no_vibrato}
		vibrato_struct = {bpm = $jam_current_bpm depth = 0 time = 0}
	else
		ms_per_beat = (60000.0 / $jam_current_bpm)
		seconds_per_measure = ((<ms_per_beat> * 2) / 1000.0)
		vibrato_struct = {bpm = ($jam_current_bpm * 2) depth = $jam_lead_vibrato_depth time = <seconds_per_measure>}
	endif
	switch <note_type>
		case 0
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar vibrato = <vibrato_struct>
		case 1
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar vibrato = <vibrato_struct>
		case 2
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar vibrato = <vibrato_struct>
		case 3
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar vibrato = <vibrato_struct>
	endswitch
	change jam_input_current_lead = <unique_id>
	if ($jam_tutorial_status = active)
		broadcastevent type = jam_tutorial_lead_strum data = {hold_pattern = <hold_pattern> tilt = ($jam_tilt_lead) note_type = <note_type>}
	endif
	if (<playback> = 0)
		spawnscriptnow jam_fretboard_add_note params = {player = <select_player> gem_pattern = <hold_pattern> sustain = jam_sustain_lead hopo = <hopo_note>}
		<pulsate_id> = pulsate_lead_spawn_id
		killspawnedscript id = <pulsate_id>
		spawnscriptnow id = <pulsate_id> jam_band_pulsate_speaker_head params = {instrument = 1 spawn_id = <pulsate_id>}
		jam_record_note <...>
	endif
	broadcastevent \{type = jam_note_hit}
endscript
