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
				SetPlayerInfo \{1
					star_power_amount = 100.0}
				spawnscriptnow \{activate_star_power}
			else
				spawnscriptnow single_stream_react_improving params = {player = <playerindex>}
			endif
		endif
	else
		spawnscriptnow single_stream_red_bar params = {player = <playerindex>}
		if ($single_stream_factor > 0.0)
			Change single_stream_factor = ($single_stream_factor - 0.1)
			SetPlayerInfo \{1
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
				spawnscriptnow single_stream_react_worsening params = {player = <playerindex>}
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
	setsoundbusseffects effects = [{Effect = HighPass name = MP3_HIGHPASS cutoff = <cutoff_lowpass> resonance = 1.0}] time = 0.2
	setsoundbusseffects effects = [{Effect = LowPass name = MP3_LOWPASS cutoff = <cutoff_highpass> resonance = 1.0}] time = 0.2
	pan1x = (<pan_factor> * (-1 - 0.25) + 0.25)
	pan1y = 1.0
	pan2x = (<pan_factor> * (1 + 0.25) - 0.25)
	pan2y = 1.0
	SetSoundParams mp3stream pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	SetSoundParams fsbstream pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script single_stream_reset 
	Change \{single_stream_factor = 1.0}
	killspawnedscript \{name = single_stream_red_bar}
endscript

script single_stream_red_bar \{player = 1}
	printstruct <...>
	FormatText checksumname = left_rock_id 'sidebar_left_rock_meterp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <left_rock_id>
		<left_rock_id> :GetSingleTag red_frames
		<left_rock_id> :SetTags red_frames = 3
		if GotParam \{red_frames}
			if (<red_frames> > 0)
				return
			endif
		endif
		<left_rock_id> :SE_SetProps RED_ALERT_alpha = 1.0
		<left_rock_id> :SE_SetProps RED_ALERT_ADD_alpha = 1.0
		begin
		<left_rock_id> :GetSingleTag red_frames
		if (<red_frames> < 1)
			break
		endif
		<left_rock_id> :SetTags red_frames = (<red_frames> - 1)
		wait \{1
			gameframes}
		repeat
		<left_rock_id> :SE_SetProps RED_ALERT_alpha = 0.0 time = 0.2
		<left_rock_id> :SE_SetProps RED_ALERT_ADD_alpha = 0.0 time = 0.2
	endif
endscript

script single_stream_react_improving 
	if ($single_stream_factor > 0.2)
		RandomNoRepeat (
			@ PlaySound \{EXT_MD_Crowd_Whistle_1
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_2
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_3
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_4
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_5
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_6
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_7
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_8
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_9
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_10
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_11
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_12
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_13
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_14
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_15
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_16
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_17
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_18
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_19
				vol = 13
				buss = Crowd_One_Shots}
			@ PlaySound \{EXT_MD_Crowd_Whistle_19
				vol = 13
				buss = Crowd_One_Shots}
			)
		if ($single_stream_factor > 0.5)
			RandomNoRepeat (
				@ PlaySound \{EXT_MD_Crowd_Applause
					vol = 7
					buss = Crowd_One_Shots}
				@ PlaySound \{EXT_MD_Crowd_Applause
					vol = 7
					buss = Crowd_One_Shots}
				)
			if ($single_stream_factor > 0.8)
				RandomNoRepeat (
					@ PlaySound \{Crowd_Cheer_MD_EXT_SG_06
						vol = 7
						buss = Crowd_One_Shots}
					@ PlaySound \{Crowd_Cheer_MD_EXT_SG_06
						vol = 7
						buss = Crowd_One_Shots}
					)
			endif
		endif
	endif
endscript

script single_stream_react_worsening \{player = 1}
	if ($single_stream_factor < 0.8)
		if ($single_stream_factor < 0.5)
			if ($single_stream_factor < 0.2)
				SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
				highway_pulse_multiplier_loss \{player = 1
					Multiplier = 4}
			else
				SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
				highway_pulse_multiplier_loss \{player = 1
					Multiplier = 3}
			endif
		else
			SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
			highway_pulse_multiplier_loss \{player = 1
				Multiplier = 2}
		endif
	endif
endscript
