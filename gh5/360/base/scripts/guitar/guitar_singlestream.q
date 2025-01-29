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
			Change single_stream_factor = ($single_stream_factor + 0.1)
			if ($single_stream_factor > 0.98999995)
				Change \{single_stream_factor = 1.0}
				setplayerinfo \{1
					star_power_amount = 100.0}
				SpawnScriptNow \{activate_star_power}
			else
				SpawnScriptNow single_stream_react_improving params = {Player = <playerindex>}
			endif
		endif
	else
		SpawnScriptNow single_stream_red_bar params = {Player = <playerindex>}
		if ($single_stream_factor > 0.0)
			Change single_stream_factor = ($single_stream_factor - 0.1)
			setplayerinfo \{1
				star_power_amount = 1.0}
			if ($single_stream_factor < 0.01)
				Change \{single_stream_factor = 0.0}
				PlaySound \{Crowd_Fail_Song
					buss = Crowd_One_Shots
					pan1x = 1
					pan1y = 1
					pan2x = 1
					pan2y = 1
					vol = 7}
				printf \{qs(0x64d6a0ae)}
			else
				SpawnScriptNow single_stream_react_worsening params = {Player = <playerindex>}
			endif
		endif
	endif
	vol_factor = ($single_stream_factor)
	dsp_factor = ($single_stream_factor)
	pan_factor = ($single_stream_factor)
	vol_percent = (<vol_factor> * ($single_stream_max_vol - $single_stream_min_vol) + $single_stream_min_vol)
	SetSoundParams mp3stream vol_percent = <vol_percent>
	SetSoundParams fsbstream vol_percent = <vol_percent>
	cutoff_lowpass = (<dsp_factor> * (125.0 - 10) + 10)
	cutoff_highpass = (<dsp_factor> * (22000.0 - 1500) + 1500)
	setsoundbusseffects effects = [{effect = HighPass Name = mp3_highpass cutoff = <cutoff_lowpass> resonance = 1.0}] time = 0.2
	setsoundbusseffects effects = [{effect = LowPass Name = mp3_lowpass cutoff = <cutoff_highpass> resonance = 1.0}] time = 0.2
	pan1x = (<pan_factor> * (-1 - 0.25) + 0.25)
	pan1y = 1.0
	pan2x = (<pan_factor> * (1 + 0.25) - 0.25)
	pan2y = 1.0
	SetSoundParams mp3stream pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	SetSoundParams fsbstream pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script single_stream_reset 
	Change \{single_stream_factor = 1.0}
	KillSpawnedScript \{Name = single_stream_red_bar}
endscript

script single_stream_red_bar \{Player = 1}
	printstruct <...>
	formatText checksumName = left_rock_id 'sidebar_left_rock_meterp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <left_rock_id>
		<left_rock_id> :GetSingleTag red_frames
		<left_rock_id> :SetTags red_frames = 3
		if GotParam \{red_frames}
			if (<red_frames> > 0)
				return
			endif
		endif
		<left_rock_id> :se_setprops red_alert_alpha = 1.0
		<left_rock_id> :se_setprops red_alert_add_alpha = 1.0
		begin
		<left_rock_id> :GetSingleTag red_frames
		if (<red_frames> < 1)
			break
		endif
		<left_rock_id> :SetTags red_frames = (<red_frames> - 1)
		Wait \{1
			gameframes}
		repeat
		<left_rock_id> :se_setprops red_alert_alpha = 0.0 time = 0.2
		<left_rock_id> :se_setprops red_alert_add_alpha = 0.0 time = 0.2
	endif
endscript

script single_stream_react_improving 
	if ($single_stream_factor > 0.2)
		RandomNoRepeat (
			@ PlaySound \{ext_md_crowd_whistle_1
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_2
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_3
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_4
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_5
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_6
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_7
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_8
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_9
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_10
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_11
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_12
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_13
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_14
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_15
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_16
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_17
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_18
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_19
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{ext_md_crowd_whistle_19
				vol = 13
				buss = Crowd_One_Shots}
			)
		if ($single_stream_factor > 0.5)
			RandomNoRepeat (
				@ PlaySound \{ext_md_crowd_applause
					vol = 7
					buss = Crowd_One_Shots}
				@ PlaySound \{ext_md_crowd_applause
					vol = 7
					buss = Crowd_One_Shots}
				)
			if ($single_stream_factor > 0.8)
				RandomNoRepeat (
					@ PlaySound \{crowd_cheer_md_ext_sg_06
						vol = 7
						buss = Crowd_One_Shots}
					@ PlaySound \{crowd_cheer_md_ext_sg_06
						vol = 7
						buss = Crowd_One_Shots}
					)
			endif
		endif
	endif
endscript

script single_stream_react_worsening \{Player = 1}
	if ($single_stream_factor < 0.8)
		if ($single_stream_factor < 0.5)
			if ($single_stream_factor < 0.2)
				SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
				highway_pulse_multiplier_loss \{Player = 1
					multiplier = 4}
			else
				SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
				highway_pulse_multiplier_loss \{Player = 1
					multiplier = 3}
			endif
		else
			SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
			highway_pulse_multiplier_loss \{Player = 1
				multiplier = 2}
		endif
	endif
endscript
