jam_input_current_lead = NULL
jam_sustain_lead = 0

script jam_input_lead controller = ($player1_status.controller) spawn_id = jam_input_spawns select_player = 1 hammer_on = 1
	mid_up_strum = 0
	mid_down_strum = 0
	SpawnScriptNow jam_input_lead_tilt id = <spawn_id> params = {controller = <controller> Player = <select_player>}
	jam_input_add_player_server Player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_lead_per_frame 
	instrument_controls = [Enabled]
	if ($game_mode = training)
		if ScreenElementExists \{id = jam_band_container}
			jam_band_container :GetTags
		elseif ScreenElementExists \{id = jam_studio_element}
			jam_studio_element :GetTags
		endif
	endif
	if ArrayContains array = <instrument_controls> contains = Enabled
		if NOT (<touch_strum> = 1)
			if ControllerPressed up <controller>
				if (<mid_up_strum> = 0)
					jam_input_lead_strum spawn_id = <spawn_id> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
					SpawnScriptNow jam_input_stop_sound_lead id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
				endif
				<mid_up_strum> = (<mid_up_strum> + 1)
			else
				<mid_up_strum> = 0
			endif
			if ControllerPressed down <controller>
				if (<mid_down_strum> = 0)
					jam_input_lead_strum spawn_id = <spawn_id> hold_pattern = <hold_pattern> up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
					SpawnScriptNow jam_input_stop_sound_lead id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
				endif
				<mid_down_strum> = (<mid_down_strum> + 1)
			else
				<mid_down_strum> = 0
			endif
		else
			jam_input_lead_strum spawn_id = <spawn_id> hold_pattern = <hold_pattern> mute = 1 up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
			SpawnScriptNow jam_input_stop_sound_lead id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
		endif
		jam_input_whammy Player = <select_player> controller = <controller>
	endif
	if (($jam_advanced_record) = 0)
		jam_check_simple_record_input controller = <controller> select_player = <select_player>
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

script jam_input_lead_per_frame_no_strum 
	if ControllerPressed up <controller>
		<mid_up_strum> = (<mid_up_strum> + 1)
	else
		<mid_up_strum> = 0
	endif
	if ControllerPressed down <controller>
		<mid_down_strum> = (<mid_down_strum> + 1)
	else
		<mid_down_strum> = 0
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

script jam_input_stop_sound_lead select_player = 1 controller = ($player1_status.controller)
	Wait \{$jam_input_strum_wait
		gameframes}
	GetHeldPattern controller = <controller> Player = <select_player> nobrokenstring
	lead_hold_pattern = <hold_pattern>
	jam_input_get_single_note pattern = <lead_hold_pattern>
	<lead_hold_pattern> = <single_note_pattern>
	begin
	GetHeldPattern controller = <controller> Player = <select_player> nobrokenstring
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
	Wait \{1
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
	final_note_sample = NULL
	note_type = 0
	if NOT (<mute> = 1)
		if ControllerPressed select <controller>
			<note_type> = 3
		endif
	else
		<note_type> = 3
	endif
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead}
	scale_index = ($jam_track_scaleindex [1])
	if ((<scale_index> = 0) || (<scale_index> = 4))
		if (<hold_pattern> = 17)
			jam_get_sample Player = <select_player> button = 6 sample_type = <note_type> tilt = ($jam_tilt_lead)
		endif
		if NOT (<final_note_sample> = NULL)
			<sustain> = 1
			jam_input_lead_play_note <...>
			return
		endif
	endif
	strum_type = ($guitarist_info.strum)
	ExtendCrc <strum_type> '_Strums' out = strum_anims
	GetArraySize ($<strum_anims>.med)
	GetRandomValue Name = newindex integer a = 0 b = (<array_Size> - 1)
	strum_anim = ($<strum_anims>.med [<newindex>])
	band_play_strum_anim Name = GUITARIST anim = <strum_anim> BlendDuration = $strum_blend_time
	if (<hold_pattern> && 1)
		<hold_pattern> = 1
		jam_get_sample Player = <select_player> button = 5 sample_type = <note_type> tilt = ($jam_tilt_lead)
	elseif (<hold_pattern> && 16)
		<hold_pattern> = 16
		jam_get_sample Player = <select_player> button = 4 sample_type = <note_type> tilt = ($jam_tilt_lead)
	elseif (<hold_pattern> && 256)
		<hold_pattern> = 256
		jam_get_sample Player = <select_player> button = 3 sample_type = <note_type> tilt = ($jam_tilt_lead)
	elseif (<hold_pattern> && 4096)
		<hold_pattern> = 4096
		jam_get_sample Player = <select_player> button = 2 sample_type = <note_type> tilt = ($jam_tilt_lead)
	elseif (<hold_pattern> && 65536)
		<hold_pattern> = 65536
		jam_get_sample Player = <select_player> button = 1 sample_type = <note_type> tilt = ($jam_tilt_lead)
	elseif (<hold_pattern> && 1048576)
		<hold_pattern> = 1048576
		jam_get_sample Player = <select_player> button = 0 sample_type = <note_type> tilt = ($jam_tilt_lead)
	endif
	if NOT (<final_note_sample> = NULL)
		<sustain> = 1
		jam_input_lead_play_note <...>
	endif
endscript

script jam_input_lead_hopo spawn_id = jam_input_spawns controller = ($player2_status.controller)
	if ControllerPressed select <controller>
		return
	endif
	final_note_sample = NULL
	if (<hold_pattern> && 1)
		<hold_pattern> = 1
		jam_get_sample Player = <select_player> button = 5 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample Player = <select_player> button = 5 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 16)
		<hold_pattern> = 16
		jam_get_sample Player = <select_player> button = 4 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample Player = <select_player> button = 4 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 256)
		<hold_pattern> = 256
		jam_get_sample Player = <select_player> button = 3 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample Player = <select_player> button = 3 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 4096)
		<hold_pattern> = 4096
		jam_get_sample Player = <select_player> button = 2 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample Player = <select_player> button = 2 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 65536)
		<hold_pattern> = 65536
		jam_get_sample Player = <select_player> button = 1 tilt = ($jam_tilt_lead) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample Player = <select_player> button = 1 tilt = ($jam_tilt_lead) hopo = 2
		<pulloff_sample> = <final_note_sample>
	endif
	if NOT (<final_note_sample> = NULL)
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
		SpawnScriptNow jam_input_stop_sound_lead id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
	endif
endscript

script jam_input_lead_get_current_note 
	scale_index = ($jam_track_scaleindex [1])
	if ((<scale_index> = 0) || (<scale_index> = 4))
		if (<hold_pattern> = 17)
			jam_get_sample Player = <Player> button = 6 tilt = ($jam_tilt_lead) get_text = 1
			if GotParam \{single_note_text}
				return single_note_text = <single_note_text>
			else
				return \{single_note_text = qs(0xca3bb3d6)}
			endif
		endif
	endif
	fret_anims = ($guitarist_info.fret_anims)
	finger_anims = ($guitarist_info.finger_anims)
	if (<hold_pattern> && 1)
		jam_get_sample Player = <Player> button = 5 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim Name = GUITARIST anim = ($<finger_anims>.green)
		band_play_fret_anim Name = GUITARIST anim = ($<fret_anims>.track_117)
	elseif (<hold_pattern> && 16)
		jam_get_sample Player = <Player> button = 4 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim Name = GUITARIST anim = ($<finger_anims>.green_red)
		band_play_fret_anim Name = GUITARIST anim = ($<fret_anims>.track_118)
	elseif (<hold_pattern> && 256)
		jam_get_sample Player = <Player> button = 3 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim Name = GUITARIST anim = ($<finger_anims>.yellow)
		band_play_fret_anim Name = GUITARIST anim = ($<fret_anims>.track_119)
	elseif (<hold_pattern> && 4096)
		jam_get_sample Player = <Player> button = 2 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim Name = GUITARIST anim = ($<finger_anims>.blue_orange)
		band_play_fret_anim Name = GUITARIST anim = ($<fret_anims>.track_120)
	elseif (<hold_pattern> && 65536)
		jam_get_sample Player = <Player> button = 1 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim Name = GUITARIST anim = ($<finger_anims>.green_blue)
		band_play_fret_anim Name = GUITARIST anim = ($<fret_anims>.track_121)
	elseif (<hold_pattern> = 1048576)
		jam_get_sample Player = <Player> button = 0 tilt = ($jam_tilt_lead) get_text = 1
		band_play_finger_anim Name = GUITARIST anim = ($<finger_anims>.None)
	endif
	if GotParam \{single_note_text}
		return single_note_text = <single_note_text>
	else
		return \{single_note_text = qs(0xca3bb3d6)}
	endif
endscript

script jam_input_lead_tilt 
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [1])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if StructureContains structure = <chosen_scale> chromatic
		<chromatic> = 1
	else
		<chromatic> = 0
	endif
	begin
	if GuitarGetAnalogueInfo controller = <controller>
		<spc_v_dist> = <righty_unscaled>
		<spc_v_dist> = (<spc_v_dist> * 0.0078125)
		jam_calc_line_rot Player = <Player> spc_v_dist = <spc_v_dist>
		if (<chromatic> = 0)
			if (<line_rot> <= 30)
				Change \{jam_tilt_lead = 0}
			else
				Change \{jam_tilt_lead = 1}
			endif
		else
			if (<line_rot> <= 1)
				Change \{jam_tilt_lead = 0}
			elseif (<line_rot> > 1 && <line_rot> < 50)
				Change \{jam_tilt_lead = 1}
			elseif (<line_rot> > 50 && <line_rot> < 99)
				Change \{jam_tilt_lead = 2}
			else
				Change \{jam_tilt_lead = 3}
			endif
		endif
	else
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_input_lead_play_note \{sustain = 0
		playback = 0}
	KillSpawnedScript \{Name = jam_input_stop_sound_lead}
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead
		stop = 1}
	stopsound \{unique_id = $jam_input_current_lead
		fade_type = linear
		fade_time = $jam_fade_time}
	StopSoundEvent \{jam_fret_noise_lead
		fade_time = 0.2
		fade_type = linear}
	if GotParam \{no_vibrato}
		vibrato_struct = {bpm = $jam_current_bpm DEPTH = 0 time = 0}
	else
		ms_per_beat = (60000.0 / $jam_current_bpm)
		seconds_per_measure = ((<ms_per_beat> * 2) / 1000.0)
		vibrato_struct = {bpm = ($jam_current_bpm * 2) DEPTH = $jam_lead_vibrato_depth time = <seconds_per_measure>}
	endif
	switch <note_type>
		case 0
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar vibrato = <vibrato_struct>
		case 1
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = -2 buss = jammode_leadguitar attack_time = 0.055 attack_function = flat_middle vibrato = <vibrato_struct>
		case 2
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = -3.5 buss = jammode_leadguitar attack_time = 0.07 attack_function = flat_middle vibrato = <vibrato_struct>
		case 3
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar vibrato = <vibrato_struct>
	endswitch
	Change jam_input_current_lead = <unique_id>
	if ($jam_tutorial_status = Active)
		broadcastevent Type = jam_tutorial_lead_strum data = {hold_pattern = <hold_pattern> tilt = ($jam_tilt_lead) note_type = <note_type>}
	endif
	if (<playback> = 0)
		SpawnScriptNow jam_fretboard_add_note params = {Player = <select_player> gem_pattern = <hold_pattern> sustain = jam_sustain_lead hopo = <hopo_note>}
		<pulsate_id> = pulsate_lead_spawn_id
		KillSpawnedScript id = <pulsate_id>
		SpawnScriptNow id = <pulsate_id> jam_band_pulsate_speaker_head params = {instrument = 1 spawn_id = <pulsate_id>}
		jam_record_note <...>
	endif
	broadcastevent \{Type = jam_note_hit}
endscript
