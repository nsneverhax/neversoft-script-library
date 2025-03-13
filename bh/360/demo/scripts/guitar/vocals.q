voclas_proto = 1
voclas_proto_num_players = 4
voclas_proto_test_offset = (0.0, 0.0)
voclas_proto_adjustments = [
	{
		rgba_fireball = [
			0
			177
			255
			255
		]
		scale_fireball = (0.45000002, 0.45000002)
		particle_base = {
			start_color = [
				255
				128
				0
				255
			]
			end_color = [
				255
				0
				0
				0
			]
		}
		particle_miss = {
			start_color = [
				128
				0
				255
				255
			]
			end_color = [
				0
				0
				255
				0
			]
		}
		hud_parent = alias_v1
		highway_position = vocal1
	}
	{
		rgba_fireball = [
			39
			224
			105
			255
		]
		scale_fireball = (0.45000002, 0.45000002)
		particle_base = {
			start_color = [
				255
				128
				0
				255
			]
			end_color = [
				255
				0
				0
				0
			]
		}
		particle_miss = {
			start_color = [
				0
				128
				255
				255
			]
			end_color = [
				0
				0
				255
				0
			]
		}
		hud_parent = alias_v2
		highway_position = vocal2
	}
	{
		rgba_fireball = [
			222
			39
			224
			255
		]
		scale_fireball = (0.45000002, 0.45000002)
		particle_base = {
			start_color = [
				255
				128
				0
				255
			]
			end_color = [
				255
				0
				0
				0
			]
		}
		particle_miss = {
			start_color = [
				0
				128
				0
				255
			]
			end_color = [
				0
				0
				255
				0
			]
		}
		hud_parent = alias_v1
		highway_position = vocal1
	}
	{
		rgba_fireball = [
			255
			191
			0
			255
		]
		scale_fireball = (0.45000002, 0.45000002)
		particle_base = {
			start_color = [
				255
				128
				0
				255
			]
			end_color = [
				255
				0
				0
				0
			]
		}
		particle_miss = {
			start_color = [
				128
				128
				128
				255
			]
			end_color = [
				0
				0
				255
				0
			]
		}
		hud_parent = alias_v1
		highway_position = vocal1
	}
]
vocal_mic_type_props = {
	logitech = {
		noise_gate = 0.02
		star_power_peak = 0.4
		star_power_hertz = 100
		star_power_frames = 2
		allow_volume_change = true
		input_lag_ms = 30
	}
	singstar = {
		noise_gate = 0.01
		star_power_peak = 0.4
		star_power_hertz = 125
		star_power_frames = 2
		allow_volume_change = true
		input_lag_ms = 60
	}
	microsoft_wireless = {
		noise_gate = 0.01
		star_power_peak = 0.21000001
		star_power_hertz = 160
		star_power_frames = 1
		allow_volume_change = true
		input_lag_ms = 60
	}
	headset = {
		noise_gate = 0.02
		star_power_peak = 0.25
		star_power_hertz = 60
		star_power_frames = 3
		allow_volume_change = true
		input_lag_ms = 180
	}
	wav = {
		noise_gate = 0.01
		star_power_peak = 0.120000005
		star_power_hertz = 75
		star_power_frames = 3
		allow_volume_change = true
		input_lag_ms = 30
	}
	bot = {
		noise_gate = 0.1
		star_power_peak = 0.15
		star_power_hertz = 75
		star_power_frames = 3
		allow_volume_change = true
		input_lag_ms = 30
	}
}
vocal_pitch_detection_lag = 20
vocal_difficulty = {
	beginner = {
		leniency = {
			pitch_class = 6
		}
		slide_leniency = {
			pitch_class = 6
		}
		note_on_dropoff = {
			pitch_class = 10
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
		score_per_second = 50.0
	}
	easy = {
		leniency = {
			pitch_class = 3
		}
		slide_leniency = {
			pitch_class = 4
			cents = 50
		}
		note_on_dropoff = {
			pitch_class = 5
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
		score_per_second = 100.0
	}
	medium = {
		leniency = {
			pitch_class = 2
		}
		slide_leniency = {
			pitch_class = 4
		}
		note_on_dropoff = {
			pitch_class = 4
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
		score_per_second = 160.0
	}
	hard = {
		leniency = {
			pitch_class = 1
			cents = 50
		}
		slide_leniency = {
			pitch_class = 3
			cents = 50
		}
		note_on_dropoff = {
			pitch_class = 3
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
		score_per_second = 220.0
	}
	expert = {
		leniency = {
			pitch_class = 1
		}
		slide_leniency = {
			pitch_class = 3
		}
		note_on_dropoff = {
			pitch_class = 2
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
		score_per_second = 275.0
	}
}
vocal_starpower_increase = 25.0
vocal_sp_threshold_melodic = 50
vocal_sp_boost_melodic = 10.0
vocal_sp_threshold_noise = 0.1
vocal_sp_boost_noise = 10.0
vocal_ff_points_correct_pitch_mod = 0.2
vocal_ff_points_deg_rate_mod = 0.1
vocal_ff_points_sustain_rate_mod = 0.1
vocal_ff_points_base_mod = 0.3
vocal_ff_rewards_threshold = 0.7
vocal_ff_points_scale_constant = 1000.0
vocal_ff_quality_base = 0.31
vocal_tut_threshold_melodic = 6
vocal_tut_mute = 0
vocal_tut_no_star_power = 0
vocals_hyperspeed_values = [
	1.0
	0.87
	0.77
	0.69
	0.625
	0.57
]
vocal_phrase_qualities = [
	{
		min = 0.0
		text = qs(0x4cc460d8)
		round_to = 0
		rgba = [
			225
			30
			30
			255
		]
		health = -6.0
		sp_boost_legacy = 0.0
		sp_boost_bonus = 0.0
		sp_boost = 0.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_no_fx
		song_value = 0.0
		streak = 0
		multiplier_mod = -3
	}
	{
		min = 0.1
		text = qs(0x4cc460d8)
		round_to = 0
		rgba = [
			225
			30
			30
			255
		]
		health = -4.0
		sp_boost = 0.0
		sp_boost_bonus = 0.0
		sp_boost_legacy = 0.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_no_fx
		song_value = 0.2
		streak = 0
		multiplier_mod = -3
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
		sp_boost_bonus = 0.0
		sp_boost_legacy = 0.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_no_fx
		song_value = 0.4
		streak = 0
		multiplier_mod = -3
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
		sp_boost_bonus = 0.0
		sp_boost_legacy = 0.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_no_fx
		song_value = 0.6
		streak = 0
		multiplier_mod = -3
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
		sp_boost = 0.0
		sp_boost_bonus = 0.0
		sp_boost_legacy = 8.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_no_fx
		song_value = 0.8
		streak = 0
		multiplier_mod = -2
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
		sp_boost_bonus = 10.0
		sp_boost_legacy = 25.0
		sp_max_health = 2.0
		fx_script = vocals_end_phrase_no_fx
		song_value = 1.0
		streak = 1
		multiplier_mod = 1
	}
]
vocal_freeform_qualities = [
	{
		min = 0.0
		text = qs(0x00000000)
		rgba = [
			255
			0
			0
			255
		]
		health_boost = 0.0
	}
	{
		min = 0.3
		text = qs(0x00000000)
		rgba = [
			255
			255
			0
			255
		]
		health_boost = 4.0
	}
	{
		min = 0.6
		text = qs(0x00000000)
		rgba = [
			0
			255
			0
			255
		]
		health_boost = 8.0
	}
]
vocal_score_inflation = 1
vocal_min_pitch_duration = 1
vocal_record_song = 0
vocal_use_recording = ''
vocal_bot_uses_starpower = 0
vocal_bot_semitones_off = 0
vocal_enable_guitar_samples = 0
vocal_enable_freeform_always = 0
vocal_bot_with_mic = 0
vocal_marker_freeform = qs(0x1cd6e13e)
vocal_marker_freeform_rgba = [
	100
	80
	0
	255
]
vocal_mic_invalid_dist = 0
vocal_count_in_min_blank_ms_default = 10000
vocal_count_in_duration_ms_default = 4000
rolling_accuracy_mod = 0.5
vocal_note_on_fade_start = 0.5
vocal_base_score_scale = 1.0

script vocals_start_mic 
	printf \{'Vocals: Starting mic.'}
	netsessionfunc \{func = voice_init}
	netsessionfunc \{obj = voice
		func = enable}
endscript

script vocals_init_mic_starpower_button 
	setmicstarpowerbuttonparams \{num_frames = 10
		threshold = 15}
endscript

script vocals_init 
	printf channel = sfx qs(0xc71fb922) p = <player>
	ui_options_audio_update_mic_volume player = <player>
endscript

script vocals_set_mics_to_user_volumes 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = vocals
			ui_options_audio_update_mic_volume player = <player>
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script controller_has_headset 
	requireparams \{[
			controller
		]
		all}
	if (<controller> > 3)
		return \{false}
	endif
	if vocals_controllerhasusableheadset controller = <controller>
		return \{true}
	endif
	return \{false}
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
	repeat 4
	return num_mics_plugged_in = <num_mics_plugged_in>
endscript

script has_usb_mic_plugged_in 
	<mic> = 0
	begin
	if ismicrophonepluggedin number = <mic>
		return \{true}
	endif
	<mic> = (<mic> + 1)
	repeat 4
	return \{false}
endscript

script vocals_reset_mics 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		setplayerinfo <player> mic_type = none
		getnextplayer player = <player> on_screen
		repeat <num_players_shown>
	endif
endscript

script vocals_get_num_mics 
	num_mics = 0
	index = 0
	begin
	if ismicrophonepluggedin number = <index>
		num_mics = (<num_mics> + 1)
	endif
	index = (<index> + 1)
	repeat 4
	return num_mics = <num_mics>
endscript

script vocals_distribute_mics \{only_preferences = 0
		invalidate_bogus_mics = 1}
	change \{vocal_mic_invalid_dist = 0}
	distribution_changed = false
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = vocals
			if NOT vocals_player_has_mic player = <player>
				if (<invalidate_bogus_mics> = 1)
					setplayerinfo <player> mic_type = none
				endif
			endif
			if ($game_type = freeplay)
				if playerinfoequals <player> freeplay_state = dropped
					setplayerinfo <player> mic_type = none
				endif
			elseif NOT vocals_preference_match player = <player>
				setplayerinfo <player> mic_type = none
			endif
		else
			setplayerinfo <player> mic_type = none
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	vocals_get_num_vocalists_onscreen
	vocals_get_num_mics
	<mic_types> = [mic0 mic1 mic2 mic3]
	total_assigned = 0
	total_assigned_mics = 0
	total_assigned_headsets = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = vocals
			if NOT playerinfoequals <player> mic_type = none
				if NOT playerinfoequals <player> mic_type = headset
					total_assigned_mics = (<total_assigned_mics> + 1)
				endif
			endif
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
		getfirstplayer \{on_screen}
		begin
		skip_freeplay_player = false
		if ($game_mode = freeplay)
			if playerinfoequals <player> freeplay_state = dropped
				skip_freeplay_player = true
			endif
		endif
		if (<skip_freeplay_player> = false)
			if playerinfoequals <player> part = vocals
				if playerinfoequals <player> mic_type = none
					getplayerinfo <player> mic_preference
					if (<mic_preference> = mic)
						if (<total_assigned_mics> < <num_mics>)
							vocals_safely_assign_mic player = <player> mic_type = any_mic
							total_assigned_mics = (<total_assigned_mics> + 1)
							distribution_changed = true
						endif
					elseif (<mic_preference> = headset)
						vocals_safely_assign_mic player = <player> mic_type = headset
						distribution_changed = true
					endif
				endif
			endif
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
		if (<only_preferences> = 0)
			if (<total_assigned_mics> < <num_mics>)
				getfirstplayer \{on_screen}
				begin
				skip_freeplay_player = false
				if ($game_mode = freeplay)
					if playerinfoequals <player> freeplay_state = dropped
						skip_freeplay_player = true
					endif
				endif
				if (<skip_freeplay_player> = false)
					if playerinfoequals <player> part = vocals
						if playerinfoequals <player> mic_type = none
							getplayerinfo <player> controller
							if NOT controller_has_headset controller = <controller>
								if (<total_assigned_mics> < <num_mics>)
									vocals_safely_assign_mic player = <player> mic_type = any_mic
									total_assigned_mics = (<total_assigned_mics> + 1)
									distribution_changed = true
								endif
							endif
						endif
					endif
				endif
				getnextplayer on_screen player = <player>
				repeat <num_players_shown>
			endif
			getfirstplayer \{on_screen}
			begin
			skip_freeplay_player = false
			if ($game_mode = freeplay)
				if playerinfoequals <player> freeplay_state = dropped
					skip_freeplay_player = true
				endif
			endif
			if (<skip_freeplay_player> = false)
				if playerinfoequals <player> part = vocals
					if playerinfoequals <player> mic_type = none
						if (<total_assigned_mics> < <num_mics>)
							vocals_safely_assign_mic player = <player> mic_type = any_mic
							<total_assigned_mics> = (<total_assigned_mics> + 1)
							distribution_changed = true
						elseif gotparam \{allow_default_headset}
							vocals_safely_assign_mic player = <player> mic_type = headset
							total_assigned_headsets = (<total_assigned_headsets> + 1)
						endif
					endif
				endif
			endif
			getnextplayer on_screen player = <player>
			repeat <num_players_shown>
		endif
	endif
	if vocals_mic_distribution_is_valid
		return true distribution_changed = <distribution_changed>
	else
		return false distribution_changed = <distribution_changed>
	endif
endscript

script vocals_preference_match 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> mic_preference
	getplayerinfo <player> mic_type
	if (<mic_type> = headset)
		if (<mic_preference> = headset)
			return \{true}
		endif
	elseif (<mic_type> = none)
		return \{false}
	elseif (<mic_preference> = mic)
		return \{true}
	endif
	return \{false}
endscript

script vocals_mic_distribution_is_valid 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = vocals
			if playerinfoequals <player> is_local_client = 1
				if NOT vocals_player_has_mic player = <player>
					return false invalid_mic_player = <player>
				endif
			else
				if playerinfoequals <player> mic_type = none
					return false invalid_mic_player = <player>
				endif
			endif
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	return \{true}
endscript

script vocals_safely_assign_mic 
	requireparams \{[
			player
			mic_type
		]
		all}
	printf channel = vocals qs(0xaf7ba393) a = <player> b = <mic_type>
	<is_valid_assignment> = 1
	if playerinfoequals <player> bot_play = 1
		<is_valid_assignment> = 0
	endif
	this_player = <player>
	if (<mic_type> = any_mic)
		mics = [mic0 mic1 mic2 mic3]
		getnumplayersingame \{on_screen}
		index = 0
		begin
		mic = (<mics> [<index>])
		getfirstplayer \{on_screen}
		mic_used = false
		begin
		if playerinfoequals <player> mic_type = <mic>
			mic_used = true
			break
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
		if (<mic_used> = false)
			if 0x4b21c27d mic_type = <mic> player = <this_player>
				mic_type = <mic>
				break
			endif
		endif
		index = (<index> + 1)
		repeat 4
	endif
	if NOT 0x4b21c27d mic_type = <mic_type> player = <this_player>
		<is_valid_assignment> = 0
	endif
	if (<is_valid_assignment> = 1)
		setplayerinfo <this_player> mic_type = <mic_type>
		printf channel = vocals qs(0x65af0376) a = <this_player> b = <mic_type>
	else
		setplayerinfo <this_player> mic_type = none
		printf channel = vocals qs(0xc28a5343) a = <this_player>
	endif
endscript

script 0x4b21c27d 
	requireparams \{[
			player
			mic_type
		]
		all}
	getplayerinfo <player> controller
	<is_valid_assignment> = 1
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
		case mic2
		if NOT ismicrophonepluggedin \{number = 2}
			<is_valid_assignment> = 0
		endif
		case mic3
		if NOT ismicrophonepluggedin \{number = 3}
			<is_valid_assignment> = 0
		endif
		case any_mic
		<is_valid_assignment> = 0
		default
		<is_valid_assignment> = 0
	endswitch
	if (<is_valid_assignment> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script vocals_player_has_mic 
	requireparams \{[
			player
		]
		all}
	if NOT gotparam \{dont_check_part}
		if NOT playerinfoequals <player> part = vocals
			softassert 'Player %p is not playing vocals' p = <player>
			return \{false}
		endif
	endif
	if playerinfoequals <player> bot_play = 1
		return \{true}
	endif
	getplayerinfo <player> mic_type
	if (<mic_type> = headset)
		getplayerinfo <player> controller
		if NOT controller_has_headset controller = <controller>
			return \{false}
		endif
	elseif (<mic_type> = mic0)
		if NOT ismicrophonepluggedin \{number = 0}
			return \{false}
		endif
	elseif (<mic_type> = mic1)
		if NOT ismicrophonepluggedin \{number = 1}
			return \{false}
		endif
	elseif (<mic_type> = mic2)
		if NOT ismicrophonepluggedin \{number = 2}
			return \{false}
		endif
	elseif (<mic_type> = mic3)
		if NOT ismicrophonepluggedin \{number = 3}
			return \{false}
		endif
	elseif (<mic_type> = none)
		return \{false}
	endif
	return \{true}
endscript

script vocals_get_num_vocalists_on_same_highway 
	this_player = <player>
	vocals_getactivehighway player = <player>
	this_highway = <active_highway>
	<num_vocalists> = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = vocals
			vocals_getactivehighway player = <player>
			if (<active_highway> = <this_highway>)
				<num_vocalists> = (<num_vocalists> + 1)
			endif
		endif
		getnextplayer player = <player> on_screen
		repeat <num_players_shown>
	endif
	return num_vocalists_on_highway = <num_vocalists>
endscript

script vocals_get_num_vocalists 
	<num_vocalists> = 0
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if playerinfoequals <player> part = vocals
			<num_vocalists> = (<num_vocalists> + 1)
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return num_vocalists = <num_vocalists>
endscript

script vocals_get_num_vocalists_onscreen 
	<num_vocalists_shown> = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = vocals
			<num_vocalists_shown> = (<num_vocalists_shown> + 1)
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	return num_vocalists_shown = <num_vocalists_shown>
endscript

script get_num_non_vocals_players_onscreen 
	if ($musicstudio_jamroom_highways != 0)
		return \{num_non_vocals_players = $musicstudio_jamroom_highways}
	endif
	vocals_get_num_vocalists_onscreen
	getnumplayersingame \{on_screen}
	return num_non_vocals_players = (<num_players_shown> - <num_vocalists_shown>)
endscript

script vocals_activate_starpower 
	gamemode_gettype
	if (<type> != practice)
		spawnscriptnow star_power_activate_and_drain params = {player = <player>}
	endif
endscript

script vocals_mute_all_mics \{mute = true}
	if ($g_in_tutorial = 1)
		if ($vocal_tut_mute = 1)
			mute = true
		endif
	endif
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = vocals
			printf channel = sfx 'Vocals player %p mute=%m' p = <player> m = <mute>
			spawnscriptnow vocal_sidechain_logic params = {player = <player> muting = <mute>}
			vocals_muteoutput player = <player> mute = <mute>
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script vocals_ingame_change_mic_volume 
	requireparams \{[
			change
			player
		]
		all}
	if ($in_sing_a_long = true)
		printf \{channel = sfx
			'vocals_ingame_change_mic_volume - changing mic volume is not allowed in sing-along'}
		return
	endif
	gamemode_gettype
	if (<type> = freeplay)
		getplayerinfo <player> freeplay_mic_volume
		mic_volume = <freeplay_mic_volume>
		changespinaltapvolume spinal_tap_volume = <mic_volume> change = <change>
		setplayerinfo <player> freeplay_mic_volume = <volume>
	else
		get_savegame_from_player player = <player>
		getglobaltags savegame = <savegame> user_options param = volumes
		mic_volume = (<volumes>.guitar.mic.vol)
		changespinaltapvolume spinal_tap_volume = <mic_volume> change = <change>
		mic_struct = {(<volumes>.guitar.mic) vol = <volume>}
		dummy_struct = {(<volumes>.guitar) mic = <mic_struct>}
		volumes = {<volumes> guitar = <dummy_struct>}
		gamemode_gettype
		setglobaltags savegame = <savegame> user_options params = {volumes = <volumes>}
	endif
	if (<mic_volume> = <volume>)
		return
	endif
	printf channel = sfx 'vocals_ingame_change_mic_volume - player %p setting volume %d' p = <player> d = <volume>
	ui_options_audio_update_mic_volume player = <player> vol = <volume>
	if (<change> > 0)
		<rgba> = [96 240 96 255]
	else
		<rgba> = [240 96 96 255]
	endif
	formattext textname = text qs(0xfeedb846) d = <volume>
	vocals_message {
		player = <player>
		text = <text>
		rgba = <rgba>
	}
endscript

script vocals_controller_uses_headset_for_singing 
	requireparams \{[
			controller
		]
		all}
	get_local_in_game_player_num_from_controller controller_index = <controller>
	if (<player_num> = -1)
		return \{false}
	endif
	getplayerinfo <player_num> part
	if (<part> != vocals)
		return \{false}
	endif
	getplayerinfo <player_num> mic_type
	if (<mic_type> != headset)
		return \{false}
	endif
	if ($playing_song = 0)
		return \{false}
	endif
	ui_event_get_top
	if (<base_name> != 'gameplay')
		return \{false}
	endif
	return \{true}
endscript

script vocals_get_lag_calibration 
	requireparams \{[
			player
		]
		all}
	vocals_getmictype player = <player>
	if (<specific_mic_type> = invalid)
		mic_input_lag = 0
	else
		mic_input_lag = ($vocal_mic_type_props.<specific_mic_type>.input_lag_ms)
	endif
	<gem_offset> = ($time_gem_offset)
	printf channel = vocals qs(0x5817322d) a = ($time_input_offset) b = ($vocal_pitch_detection_lag) c = <mic_input_lag>
	<input_offset> = ($time_input_offset - $vocal_pitch_detection_lag - <mic_input_lag>)
	get_lag_values
	<input_offset> = (<input_offset> - <audio_offset>)
	<gem_offset> = (<gem_offset> - <audio_offset>)
	<gem_offset> = (<gem_offset> - <video_offset>)
	change time_drum_midi_offset_with_lag = ($time_drum_midi_offset + <audio_offset> + <video_offset>)
	change time_gem_offset_with_lag = ($time_gem_offset + <audio_offset> + <video_offset>)
	printf channel = vocals 'Vocals: Visual lag %v ms, Input lag %i ms, mic type: %m' v = <gem_offset> i = <input_offset> m = <specific_mic_type>
	return gem_offset = <gem_offset> input_offset = <input_offset>
endscript

script vocals_hide_player 
	requireparams \{[
			player
		]
		all}
	vocalshighway_getid player = <player>
	safe_hide id = <vocals_highway_id>
	setplayerinfo <player> interactive = 0
endscript

script vocals_unhide_player 
	requireparams \{[
			player
		]
		all}
	setplayerinfo <player> interactive = 1
	vocalshighway_getid player = <player>
	safe_show id = <vocals_highway_id>
endscript

script vocals_score_percent_to_text 
	vocals_score_text = qs(0x72675d42)
	<percent> = (<percent> / 100.0)
	getarraysize ($vocal_phrase_qualities)
	i = 0
	begin
	if (<percent> >= ($vocal_phrase_qualities [<i>].song_value))
		vocals_score_text = ($vocal_phrase_qualities [<i>].text)
		vocals_score_rgba = ($vocal_phrase_qualities [<i>].rgba)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return {
		vocals_score_text = <vocals_score_text>
		vocals_score_rgba = <vocals_score_rgba>
	}
endscript

script vocals_deinit_all_mics 
	index = 0
	begin
	vocals_deinitmic controller = <index>
	index = (<index> + 1)
	repeat 4
endscript

script vocals_reinit_mics 
	requireparams \{[
			noise_gate
		]
		all}
	vocals_deinit_all_mics
	vocals_init_assigned_mics noise_gate = <noise_gate>
endscript

script vocals_init_assigned_mics 
	requireparams \{[
			noise_gate
		]
		all}
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = vocals
			vocals_init_mic player = <player> noise_gate = <noise_gate>
		endif
		getnextplayer player = <player> on_screen
		repeat <num_players_shown>
	endif
endscript

script vocals_init_mic 
	requireparams \{[
			noise_gate
			player
		]
		all}
	getplayerinfo <player> controller
	getplayerinfo <player> mic_type
	if NOT (<mic_type> = none)
		if NOT (<mic_type> = headset)
			vocals_initmic controller = <controller> mic_type = <mic_type> noise_gate = <noise_gate>
			ui_options_audio_update_mic_volume player = <player>
		endif
	endif
endscript

script vocals_get_highway_type_text 
	requireparams \{[
			highway_type
		]
		all}
	text = qs(0x00000000)
	switch <highway_type>
		case scrolling
		text = qs(0x737839f5)
		case static
		text = qs(0x305014bd)
		case karaoke
		text = qs(0xecc0f978)
		default
		softassert qs(0x9b46dedf) a = <highway_type>
	endswitch
	return highway_type_text = <text>
endscript

script vocals_safely_set_highway_view 
	requireparams \{[
			highway_type
			player
		]
		all}
	this_player = <player>
	getplayerinfo <player> part
	if (<part> = vocals)
		getplayerinfo player = <player> controller
		get_progression_instrument_user_option part = vocals controller = <controller> option = 'highway_view'
		if (<highway_type> != <user_option>)
			save_progression_instrument_user_option part = vocals controller = <controller> option = 'highway_view' new_value = <highway_type>
		endif
	endif
	getnumplayersingame \{on_screen}
	getfirstplayer
	begin
	if playerinfoequals <player> part = vocals
		if playerinfoequals <player> is_local_client = 1
			setplayerinfo <player> vocals_highway_view = <highway_type>
			printf channel = vocals qs(0xb0c9dca1) a = <player> b = <highway_type>
		endif
	endif
	getnextplayer player = <player> on_screen
	repeat <num_players_shown>
endscript

script vocals_debug_print_all_mic_types 
	index = 1
	printf \{channel = vocals
		qs(0x4dc9a289)}
	begin
	getplayerinfo <index> mic_type
	printf channel = vocals qs(0xc76dc81e) a = <index> b = <mic_type>
	index = (<index> + 1)
	repeat 4
	index = 1
	printf \{channel = vocals
		qs(0xd5085d58)}
	begin
	getplayerinfo <index> mic_preference
	printf channel = vocals qs(0x41859766) a = <index> b = <mic_preference>
	index = (<index> + 1)
	repeat 4
endscript

script vocals_debug_print_all_headsets 
	index = 1
	printf \{channel = vocals
		qs(0xaae4b629)}
	begin
	getplayerinfo <index> controller
	if controller_has_headset controller = <controller>
		printf channel = vocals qs(0x2f379803) a = <index> b = <controller>
	else
		printf channel = vocals qs(0xb2f398c0) a = <index> b = <controller>
	endif
	index = (<index> + 1)
	repeat 4
endscript

script vocal_freeform_debug_update_points_spawned 
	wait \{5
		seconds}
	die
endscript

script vocals_freeform_debug_update_message 
	if screenelementexists \{id = vocals_freeform_debug_message}
		destroyscreenelement \{id = vocals_freeform_debug_message}
	endif
	createscreenelement {
		id = vocals_freeform_debug_message
		parent = root_window
		type = textelement
		dims = (300.0, 50.0)
		just = [left center]
		pos = (600.0, 300.0)
		rgba = [255 255 255 255]
		font = debug
		text = <message>
	}
	vocals_freeform_debug_message :obj_spawnscript \{vocal_freeform_debug_update_points_spawned}
endscript

script vocal_freeform_debug_update_points 
	if screenelementexists \{id = vocals_freeform_debug_text}
		destroyscreenelement \{id = vocals_freeform_debug_text}
	endif
	formattext textname = debug_text qs(0x2b985c34) a = <score>
	createscreenelement {
		id = vocals_freeform_debug_text
		parent = root_window
		type = textelement
		dims = (300.0, 50.0)
		just = [left center]
		pos = (300.0, 300.0)
		rgba = [255 255 255 255]
		font = debug
		text = <debug_text>
	}
	vocals_freeform_debug_text :obj_spawnscript \{vocal_freeform_debug_update_points_spawned}
endscript
