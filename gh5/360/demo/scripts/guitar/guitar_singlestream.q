single_stream_enabled = 0
single_stream_factor = 1.0
single_stream_max_vol = 400.0
single_stream_min_vol = 30.0
single_stream_effects_created = 1

script single_stream_response_script \{onoff = true
		playerindex = 1}
	printf \{qs(0x745042b6)}
	if (<onoff> = true)
		if ($single_stream_factor < 1.0)
			change single_stream_factor = ($single_stream_factor + 0.1)
			if ($single_stream_factor > 0.98999995)
				change \{single_stream_factor = 1.0}
				setplayerinfo \{1
					star_power_amount = 100.0}
				spawnscriptnow \{activate_star_power}
			else
				spawnscriptnow single_stream_react_improving params = {player = <playerindex>}
			endif
		endif
	else
		spawnscriptnow single_stream_red_bar params = {player = <playerindex>}
		if ($single_stream_factor > 0.0)
			change single_stream_factor = ($single_stream_factor - 0.1)
			setplayerinfo \{1
				star_power_amount = 1.0}
			if ($single_stream_factor < 0.01)
				change \{single_stream_factor = 0.0}
				playsound \{crowd_fail_song
					buss = crowd_one_shots
					pan1x = 1
					pan1y = 1
					pan2x = 1
					pan2y = 1
					vol = 7}
				printf \{qs(0x64d6a0ae)}
			else
				spawnscriptnow single_stream_react_worsening params = {player = <playerindex>}
			endif
		endif
	endif
	vol_factor = ($single_stream_factor)
	dsp_factor = ($single_stream_factor)
	pan_factor = ($single_stream_factor)
	vol_percent = (<vol_factor> * ($single_stream_max_vol - $single_stream_min_vol) + $single_stream_min_vol)
	setsoundparams mp3stream vol_percent = <vol_percent>
	setsoundparams fsbstream vol_percent = <vol_percent>
	cutoff_lowpass = (<dsp_factor> * (125.0 - 10) + 10)
	cutoff_highpass = (<dsp_factor> * (22000.0 - 1500) + 1500)
	setsoundbusseffects effects = [{effect = highpass name = mp3_highpass cutoff = <cutoff_lowpass> resonance = 1.0}] time = 0.2
	setsoundbusseffects effects = [{effect = lowpass name = mp3_lowpass cutoff = <cutoff_highpass> resonance = 1.0}] time = 0.2
	pan1x = (<pan_factor> * (-1 - 0.25) + 0.25)
	pan1y = 1.0
	pan2x = (<pan_factor> * (1 + 0.25) - 0.25)
	pan2y = 1.0
	setsoundparams mp3stream pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	setsoundparams fsbstream pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script single_stream_reset 
	change \{single_stream_factor = 1.0}
	killspawnedscript \{name = single_stream_red_bar}
endscript

script single_stream_red_bar \{player = 1}
	printstruct <...>
	formattext checksumname = left_rock_id 'sidebar_left_rock_meterp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <left_rock_id>
		<left_rock_id> :getsingletag red_frames
		<left_rock_id> :settags red_frames = 3
		if gotparam \{red_frames}
			if (<red_frames> > 0)
				return
			endif
		endif
		<left_rock_id> :se_setprops red_alert_alpha = 1.0
		<left_rock_id> :se_setprops red_alert_add_alpha = 1.0
		begin
		<left_rock_id> :getsingletag red_frames
		if (<red_frames> < 1)
			break
		endif
		<left_rock_id> :settags red_frames = (<red_frames> - 1)
		wait \{1
			gameframes}
		repeat
		<left_rock_id> :se_setprops red_alert_alpha = 0.0 time = 0.2
		<left_rock_id> :se_setprops red_alert_add_alpha = 0.0 time = 0.2
	endif
endscript

script single_stream_react_improving 
	if ($single_stream_factor > 0.2)
		RandomNoRepeat (
			@ playsound \{ext_md_crowd_whistle_1
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_2
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_3
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_4
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_5
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_6
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_7
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_8
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_9
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_10
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_11
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_12
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_13
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_14
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_15
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_16
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_17
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_18
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_19
				vol = 13
				buss = crowd_one_shots}
			@ playsound \{ext_md_crowd_whistle_19
				vol = 13
				buss = crowd_one_shots}
			)
		if ($single_stream_factor > 0.5)
			RandomNoRepeat (
				@ playsound \{ext_md_crowd_applause
					vol = 7
					buss = crowd_one_shots}
				@ playsound \{ext_md_crowd_applause
					vol = 7
					buss = crowd_one_shots}
				)
			if ($single_stream_factor > 0.8)
				RandomNoRepeat (
					@ playsound \{crowd_cheer_md_ext_sg_06
						vol = 7
						buss = crowd_one_shots}
					@ playsound \{crowd_cheer_md_ext_sg_06
						vol = 7
						buss = crowd_one_shots}
					)
			endif
		endif
	endif
endscript

script single_stream_react_worsening \{player = 1}
	if ($single_stream_factor < 0.8)
		if ($single_stream_factor < 0.5)
			if ($single_stream_factor < 0.2)
				soundevent \{event = ui_sfx_lose_multiplier_4x}
				highway_pulse_multiplier_loss \{player = 1
					multiplier = 4}
			else
				soundevent \{event = ui_sfx_lose_multiplier_3x}
				highway_pulse_multiplier_loss \{player = 1
					multiplier = 3}
			endif
		else
			soundevent \{event = ui_sfx_lose_multiplier_2x}
			highway_pulse_multiplier_loss \{player = 1
				multiplier = 2}
		endif
	endif
endscript
