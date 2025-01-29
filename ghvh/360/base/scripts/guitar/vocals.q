vocal_mic_type_props = {
	logitech = {
		noise_gate = 0.01
		star_power_peak = 0.4
		star_power_hertz = 100
		star_power_frames = 2
		allow_volume_change = true
	}
	singstar = {
		noise_gate = 0.01
		star_power_peak = 0.4
		star_power_hertz = 125
		star_power_frames = 2
		allow_volume_change = true
	}
	microsoft_wireless = {
		noise_gate = 0.01
		star_power_peak = 0.24000001
		star_power_hertz = 150
		star_power_frames = 1
		allow_volume_change = FALSE
	}
	mic = {
		noise_gate = 0.01
		star_power_peak = 0.4
		star_power_hertz = 100
		star_power_frames = 2
		allow_volume_change = true
	}
	headset = {
		noise_gate = 0.05
		star_power_peak = 0.25
		star_power_hertz = 60
		star_power_frames = 3
		allow_volume_change = true
	}
	wav = {
		noise_gate = 0.01
		star_power_peak = 0.120000005
		star_power_hertz = 75
		star_power_frames = 3
		allow_volume_change = true
	}
	bot = {
		noise_gate = 0.1
		star_power_peak = 0.15
		star_power_hertz = 75
		star_power_frames = 3
		allow_volume_change = true
	}
}
vocal_pitch_detection_lag = 0
vocals_volume_adjust_lockout_ms = 500
vocal_difficulty = {
	easy_rhythm = {
		leniency = {
			pitch_class = 6
		}
		slide_leniency = {
			pitch_class = 6
		}
		hit_credit = 0.5
		phrase_score = 100
		jam_score = 0.3
		ff_sustain_pts = 100
		ff_beat_pts = 3
		ff_beat_slop = 0.2
		ff_health_boost = [
			0.1
			0.15
			0.2
			0.25
		]
	}
	easy = {
		leniency = {
			pitch_class = 2
			cents = 25
		}
		slide_leniency = {
			pitch_class = 4
			cents = 25
		}
		hit_credit = 0.5
		phrase_score = 200
		jam_score = 0.4
		ff_sustain_pts = 200
		ff_beat_pts = 6
		ff_beat_slop = 0.2
		ff_health_boost = [
			0.1
			0.15
			0.2
			0.25
		]
	}
	medium = {
		leniency = {
			pitch_class = 2
			cents = -25
		}
		slide_leniency = {
			pitch_class = 4
			cents = -25
		}
		hit_credit = 0.5
		phrase_score = 300
		jam_score = 0.5
		ff_sustain_pts = 300
		ff_beat_pts = 9
		ff_beat_slop = 0.2
		ff_health_boost = [
			0.1
			0.15
			0.2
			0.25
		]
	}
	hard = {
		leniency = {
			pitch_class = 1
		}
		slide_leniency = {
			pitch_class = 3
			cents = 25
		}
		hit_credit = 0.5
		phrase_score = 400
		jam_score = 0.67
		ff_sustain_pts = 400
		ff_beat_pts = 12
		ff_beat_slop = 0.2
		ff_health_boost = [
			0.1
			0.15
			0.2
			0.25
		]
	}
	expert = {
		leniency = {
			pitch_class = 1
			cents = -25
		}
		slide_leniency = {
			pitch_class = 3
		}
		hit_credit = 0.5
		phrase_score = 500
		jam_score = 0.8
		ff_sustain_pts = 500
		ff_beat_pts = 15
		ff_beat_slop = 0.2
		ff_health_boost = [
			0.1
			0.15
			0.2
			0.25
		]
	}
}
vocal_starpower_increase = 25.0
vocal_sp_threshold_melodic = 50
vocal_sp_boost_melodic = 10.0
vocal_sp_threshold_noise = 0.1
vocal_sp_boost_noise = 10.0
vocal_tut_threshold_melodic = 6
vocal_tut_mute = 0
vocal_tut_no_star_power = 0
vocal_phrase_qualities = [
	{
		min = 0.0
		text = qs(0x4cc460d8)
		round_to = 0
		rgba = [
			255
			0
			0
			255
		]
		health = -6.0
		sp_boost = 0.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_bad_comet_fx
		song_value = 0.0
		streak = 0
	}
	{
		min = 0.1
		text = qs(0x4cc460d8)
		round_to = 0
		rgba = [
			255
			0
			0
			255
		]
		health = -4.0
		sp_boost = 0.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_bad_comet_fx
		song_value = 0.4
		streak = 0
	}
	{
		min = 0.2
		text = qs(0x33092d70)
		rgba = [
			255
			140
			0
			255
		]
		health = -2.0
		sp_boost = 0.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_bad_comet_fx
		song_value = 0.55
		streak = 0
	}
	{
		min = 0.4
		text = qs(0x01ed5501)
		rgba = [
			255
			255
			255
			255
		]
		health = 0.0
		sp_boost = 0.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_good_comet_fx
		song_value = 0.7
		streak = 0
	}
	{
		min = 0.6
		text = qs(0xb4782d22)
		rgba = [
			255
			255
			0
			255
		]
		health = 2
		sp_boost = 8.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_good_comet_fx
		song_value = 0.85
		streak = 0
	}
	{
		min = 0.8
		text = qs(0x82bb7a47)
		rgba = [
			0
			255
			0
			255
		]
		health = 3
		sp_boost = 25.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_good_comet_fx
		song_value = 1.0
		streak = 1
	}
]
vocal_score_inflation = 1
vocal_min_pitch_duration = 550
vocal_base_sustain_score = 10
vocal_base_beat_score = 15
vocal_record_song = 0
vocal_use_recording = ''
vocal_bot_uses_starpower = 0
vocal_bot_semitones_off = 0
vocal_enable_guitar_samples = 0
vocal_enable_freeform_always = 0
vocal_bot_with_mic = 0
vocal_marker_freeform = qs(0x1cd6e13e)
vocal_marker_freeform_0 = qs(0x1cd6e13e)
vocal_marker_freeform_1 = qs(0x1cd6e13e)
vocal_marker_freeform_2 = qs(0x1cd6e13e)
vocal_marker_freeform_3 = qs(0x1cd6e13e)
vocal_marker_freeform_4 = qs(0x1cd6e13e)
vocal_marker_freeform_5 = qs(0x1cd6e13e)
vocal_marker_freeform_6 = qs(0x1cd6e13e)
vocal_marker_freeform_7 = qs(0x1cd6e13e)
vocal_marker_freeform_8 = qs(0x1cd6e13e)
vocal_marker_freeform_9 = qs(0x1cd6e13e)
vocal_marker_freeform_10 = qs(0x1cd6e13e)
vocal_marker_freeform_11 = qs(0x1cd6e13e)
vocal_marker_freeform_12 = qs(0x1cd6e13e)
vocal_marker_freeform_13 = qs(0x1cd6e13e)
vocal_marker_freeform_rgba = [
	100
	80
	0
	255
]
vocal_marker_hype = qs(0x3f3d9ab9)
vocal_marker_hype_rgba = [
	100
	80
	0
	255
]
vocal_mic_invalid_dist = 0

script vocals_start_mic 
	printf \{'Vocals: Starting mic.'}
	NetSessionFunc \{func = voice_init}
	NetSessionFunc \{Obj = voice
		func = enable}
endscript

script vocals_init 
	printf channel = sfx qs(0xc71fb922) p = <Player>
	ui_options_audio_update_mic_volume Player = <Player>
endscript

script vocals_set_mics_to_user_volumes 
	gamemode_getnumplayersshown
	<p> = 1
	begin
	if playerinfoequals <p> part = vocals
		ui_options_audio_update_mic_volume Player = <p>
	endif
	<p> = (<p> + 1)
	repeat <num_players_shown>
endscript

script controller_has_headset 
	RequireParams \{[
			controller
		]
		all}
	if (<controller> > 3)
		return \{FALSE}
	endif
	if vocals_controllerhasusableheadset controller = <controller>
		return \{true}
	endif
	return \{FALSE}
endscript

script get_num_mics_plugged_in 
	<num_mics_plugged_in> = 0
	<controller> = 0
	begin
	if controller_has_headset controller = <controller>
		<num_mics_plugged_in> = (<num_mics_plugged_in> + 1)
	endif
	<controller> = (<controller> + 1)
	repeat 4
	<mic> = 0
	begin
	if ismicrophonepluggedin number = <mic>
		<num_mics_plugged_in> = (<num_mics_plugged_in> + 1)
	endif
	<mic> = (<mic> + 1)
	repeat 2
	return num_mics_plugged_in = <num_mics_plugged_in>
endscript

script has_usb_mic_plugged_in 
	<mic> = 0
	begin
	if ismicrophonepluggedin number = <mic>
		return \{true}
	endif
	<mic> = (<mic> + 1)
	repeat 2
	return \{FALSE}
endscript

script vocals_distribute_mics 
	Change \{vocal_mic_invalid_dist = 0}
	gamemode_getnumplayersshown
	<i> = 1
	begin
	setplayerinfo <i> mic_type = None
	<i> = (<i> + 1)
	repeat <num_players_shown>
	vocals_get_num_vocalists_onscreen
	gamemode_getproperty \{prop = faceoff}
	vocals_getavailablemics
	<mic_types> = [mic0 mic1]
	if ((<faceoff> = true) && (<num_vocalists_shown> > 1))
		if (<available_mics> >= 2)
			<i> = 1
			<mic_idx> = 0
			begin
			if playerinfoequals <i> part = vocals
				vocals_safely_assign_mic Player = <i> mic_type = (<mic_types> [<mic_idx>])
				<mic_idx> = (<mic_idx> + 1)
			endif
			<i> = (<i> + 1)
			repeat <num_players_shown>
		elseif (<available_mics> = 1)
			<i> = 1
			begin
			if playerinfoequals <i> part = vocals
				getplayerinfo <i> controller
				if NOT controller_has_headset controller = <controller>
					vocals_safely_assign_mic Player = <i> mic_type = any_mic
				else
					vocals_safely_assign_mic Player = <i> mic_type = headset
				endif
			endif
			<i> = (<i> + 1)
			repeat <num_players_shown>
		else
			vocals_safely_assign_mic \{Player = 1
				mic_type = headset}
			vocals_safely_assign_mic \{Player = 2
				mic_type = headset}
		endif
	elseif (<num_vocalists_shown> = 1)
		<i> = 1
		begin
		if playerinfoequals <i> part = vocals
			break
		endif
		<i> = (<i> + 1)
		repeat <num_players_shown>
		if (<available_mics> >= 1)
			vocals_safely_assign_mic Player = <i> mic_type = any_mic
		else
			vocals_safely_assign_mic Player = <i> mic_type = headset
		endif
	endif
	if vocals_mic_distribution_is_valid
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script vocals_mic_distribution_is_valid 
	gamemode_getnumplayersshown
	<Player> = 1
	begin
	if playerinfoequals <Player> part = vocals
		if NOT vocals_player_has_mic Player = <Player>
			return FALSE invalid_mic_player = <Player>
		endif
	endif
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
	return \{true}
endscript

script vocals_safely_assign_mic 
	RequireParams \{[
			Player
			mic_type
		]
		all}
	getplayerinfo <Player> controller
	<is_valid_assignment> = 1
	if playerinfoequals <Player> bot_play = 1
		<is_valid_assignment> = 0
	endif
	switch <mic_type>
		case headset
		if NOT controller_has_headset controller = <controller>
			<is_valid_assignment> = 0
		endif
		case mic0
		if NOT ismicrophonepluggedin \{number = 0}
			<is_valid_assignment> = 0
		endif
		case mic1
		if NOT ismicrophonepluggedin \{number = 1}
			<is_valid_assignment> = 0
		endif
		case any_mic
		if NOT ismicrophonepluggedin \{number = 0}
			if NOT ismicrophonepluggedin \{number = 1}
				<is_valid_assignment> = 0
			else
				<mic_type> = mic1
			endif
		else
			<mic_type> = mic0
		endif
		default
		<is_valid_assignment> = 0
	endswitch
	if (<is_valid_assignment> = 1)
		setplayerinfo <Player> mic_type = <mic_type>
	else
		setplayerinfo <Player> mic_type = None
	endif
endscript

script vocals_player_has_mic 
	RequireParams \{[
			Player
		]
		all}
	if NOT playerinfoequals <Player> part = vocals
		SoftAssert 'Player %p is not playing vocals' p = <Player>
		return \{FALSE}
	endif
	getplayerinfo <Player> mic_type
	if (<mic_type> = headset)
		getplayerinfo <Player> controller
		if NOT controller_has_headset controller = <controller>
			return \{FALSE}
		endif
	elseif (<mic_type> = mic0)
		if NOT ismicrophonepluggedin \{number = 0}
			return \{FALSE}
		endif
	elseif (<mic_type> = mic1)
		if NOT ismicrophonepluggedin \{number = 1}
			return \{FALSE}
		endif
	elseif (<mic_type> = None)
		return \{FALSE}
	endif
	return \{true}
endscript

script vocals_get_num_vocalists 
	<num_vocalists> = 0
	<i> = 1
	begin
	if playerinfoequals <i> part = vocals
		<num_vocalists> = (<num_vocalists> + 1)
	endif
	<i> = (<i> + 1)
	repeat $current_num_players
	return num_vocalists = <num_vocalists>
endscript

script vocals_get_num_vocalists_onscreen 
	gamemode_getnumplayersshown
	<num_vocalists_shown> = 0
	<i> = 1
	begin
	if playerinfoequals <i> part = vocals
		<num_vocalists_shown> = (<num_vocalists_shown> + 1)
	endif
	<i> = (<i> + 1)
	repeat <num_players_shown>
	return num_vocalists_shown = <num_vocalists_shown>
endscript

script get_num_non_vocals_players_onscreen 
	vocals_get_num_vocalists_onscreen
	gamemode_getnumplayersshown
	return num_non_vocals_players = (<num_players_shown> - <num_vocalists_shown>)
endscript

script vocals_activate_starpower 
	if ($is_attract_mode = 0)
		gamemode_gettype
		if (<Type> != training)
			SpawnScriptNow star_power_activate_and_drain params = {player_status = <player_status> Player = <Player> player_text = ($<player_status>.text)}
		endif
	endif
endscript

script vocals_mute_all_mics \{mute = true}
	if ($g_in_tutorial = 1)
		if ($vocal_tut_mute = 1)
			mute = true
		endif
	endif
	gamemode_getnumplayersshown
	<p> = 1
	begin
	if playerinfoequals <p> part = vocals
		printf 'Vocals player %p mute=%m' p = <p> m = <mute>
		vocals_muteoutput Player = <p> mute = <mute>
	endif
	<p> = (<p> + 1)
	repeat <num_players_shown>
endscript

script is_mic_volume_shared 
	gamemode_getproperty \{prop = faceoff}
	if (<faceoff> = true)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script vocals_ingame_change_mic_volume 
	RequireParams \{[
			Change
			Player
		]
		all}
	if is_mic_volume_shared
		if NOT playerinfoequals <Player> controller = ($primary_controller)
			getplayerinfo <Player> controller
			printf 'Vocals: Player %p (controller %c) cannot change mic volume. Primary controller %d' p = <Player> c = <controller> d = ($primary_controller)
			return
		endif
	endif
	getplayerinfo <Player> checksum
	get_savegame_from_player_status player_status = <checksum>
	GetGlobalTags savegame = <savegame> user_options param = volumes
	mic_volume = (<volumes>.guitar.mic.vol)
	ChangeSpinalTapVolume spinal_tap_volume = <mic_volume> Change = <Change>
	mic_struct = {(<volumes>.guitar.mic) vol = <Volume>}
	Dummy_struct = {(<volumes>.guitar) mic = <mic_struct>}
	volumes = {<volumes> guitar = <Dummy_struct>}
	SetGlobalTags savegame = <savegame> user_options params = {volumes = <volumes>}
	if (<mic_volume> = <Volume>)
		return
	endif
	printf channel = sfx 'vocals_ingame_change_mic_volume - player %p setting volume %d' p = <Player> d = <Volume>
	ui_options_audio_update_mic_volume Player = <Player> vol = <Volume>
	if (<Change> > 0)
		<rgba> = [96 240 96 255]
	else
		<rgba> = [240 96 96 255]
	endif
	formatText TextName = text qs(0xfeedb846) d = <Volume>
	vocals_message {
		Player = <Player>
		text = <text>
		rgba = <rgba>
	}
endscript

script vocals_controller_uses_headset_for_singing 
	RequireParams \{[
			controller
		]
		all}
	get_player_num_from_controller controller_index = <controller>
	if (<player_num> = -1)
		return \{FALSE}
	endif
	getplayerinfo <player_num> part
	if (<part> != vocals)
		return \{FALSE}
	endif
	getplayerinfo <player_num> mic_type
	if (<mic_type> != headset)
		return \{FALSE}
	endif
	if ($playing_song = 0)
		return \{FALSE}
	endif
	ui_event_get_top
	if (<base_name> != 'gameplay')
		return \{FALSE}
	endif
	return \{true}
endscript

script vocals_set_star_power_clap 
	RequireParams \{[
			Player
			clap
		]
		all}
	setplayerinfo <Player> vocals_sp_clap = <clap>
	get_savegame_from_controller controller = <controller>
	SetGlobalTags savegame = <savegame> user_options params = {vocals_sp_clap_save = <clap>}
endscript

script vocals_get_lag_calibration 
	<gem_offset> = ($time_gem_offset)
	<input_offset> = ($time_input_offset + $vocal_pitch_detection_lag)
	GetGlobalTags \{user_options
		attract_mode_fix = 1}
	if (<lag_calibration> > 999)
		Mod a = <lag_calibration> b = 1000
		<video_offset> = (0 - <Mod>)
		<audio_offset> = ((<lag_calibration> / 1000) - 1)
		<input_offset> = (<input_offset> - <audio_offset>)
		<gem_offset> = (<gem_offset> - <audio_offset>)
		<gem_offset> = (<gem_offset> - <video_offset>)
		Change time_drum_midi_offset_with_lag = ($time_drum_midi_offset + <audio_offset> + <video_offset>)
		Change time_gem_offset_with_lag = ($time_gem_offset + <audio_offset> + <video_offset>)
	else
		Change \{time_drum_midi_offset_with_lag = $time_drum_midi_offset}
		Change \{time_gem_offset_with_lag = $time_gem_offset}
	endif
	printf 'Vocals: Visual lag %v ms, Input lag %i ms' v = <gem_offset> i = <input_offset>
	return gem_offset = <gem_offset> input_offset = <input_offset>
endscript

script vocals_score_percent_to_text 
	vocals_score_text = qs(0x6a5cf46c)
	<percent> = (<percent> / 100.0)
	GetArraySize ($vocal_phrase_qualities)
	i = 0
	begin
	if (<percent> >= ($vocal_phrase_qualities [<i>].song_value))
		vocals_score_text = ($vocal_phrase_qualities [<i>].text)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return vocals_score_text = <vocals_score_text>
endscript
