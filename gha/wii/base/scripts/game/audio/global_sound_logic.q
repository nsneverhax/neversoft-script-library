
script stars 





endscript
InteriorPanningRadius = 10
Global_User_SFX_Number = 10
Guitar_Always_Volume_100 = 0
Star_power_verb_is_on = 0
sfx_adjusted_guitar_volume = 100
highpass_cutoff_freq_modulated = 2000
lowpass_cutoff_freq_modulated = 1000
phaser_delay_time_modulated = 10
auto_wah_is_on = 0
wah_cutoff_freq_modulated = 900
current_audio_effect_type = HighPass
guitar_audio_effects_are_on = 0
guitar_audio_effects_are_on_p1 = 0
guitar_audio_effects_are_on_p2 = 0
Debug_Audible_Downbeat = 0
Debug_Audible_Open = 0
Debug_Audible_Close = 0
Debug_Audible_HitNote = 0
CrowdListenerStateClapOn1234 = 0
CrowdLevelForSurges = 1.66
temp_language_hack = lang_english
star_power_deployed_flag = 0
star_power_ready_flag = 0
star_power_awarded_flag = 0
StreamPriorityLow = 10
StreamPriorityLowMid = 30
StreamPriorityMid = 50
StreamPriorityMidHigh = 70
StreamPriorityHigh = 90
StreamPriorityHighest = 95
StreamPrioritySystem = 109
Global_SoundEvent_Default_Priority = 50
Global_SoundEvent_Default_Buss = Default
Global_SoundEvent_NoRepeatFor = 0.1
Global_SoundEvent_InstanceManagement = stop_furthest
Global_SoundEvent_InstanceLimit = 1
GuitarVolumeFullStereoLevel = 100
GuitarVolumePartialStereoLevel = 85
GuitarVolumeRamptimeUp = 0.0
GuitarVolumeRamptimeDown = 0.02
Player1Pan = {
	panLCR1 = -100
	panLCR2 = -100
}
Player2Pan = {
	panLCR1 = 100
	panLCR2 = 100
}
0xf2fd69fd = NULL
winlose_sfx_unique_id = NULL
winlose_sfx_loaded = 0

script SoundEvent 
	SoundEventFast <...>
endscript

script RegisterSoundEvent 
	AddSoundEventScript SoundEvent_EventID = <SoundEvent_EventID>
	OnExitRun DeRegisterSoundEvent params = {SoundEvent_EventID = <SoundEvent_EventID>}
	<event> <...>
endscript

script DeRegisterSoundEvent 
	RemoveSoundEventScript SoundEvent_EventID = <SoundEvent_EventID>
endscript

script Master_SFX_Adding_Sound_Busses 
	CreateBussSystem \{$BussTree}
	setsoundbussparams \{$default_BussSet}
	setsoundbussparams \{$default_BussSet
		time = 0.5}
	SoundBussLock \{Master}
	SoundBussLock \{User_Guitar}
	SoundBussLock \{User_Band}
	SoundBussLock \{User_SFX}
	SoundBussLock \{User_Music}
	SoundBussLock \{Crowd_Beds}
	SoundBussLock \{Crowd_Singalong}
	SoundBussLock \{band_Balance}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{Music_Setlist}
	createsoundbusseffects \{Guitar_Balance = {
			effect = $Echo_Guitar_Buss_Dry
			effect2 = $Reverb_Guitar_Buss_Dry
		}}
	createsoundbusseffects \{Crowd_W_Reverb = {
			effect = $Echo_Crowd_Buss
			effect2 = $Reverb_Crowd_Buss
		}}
endscript

script GH3_Change_crowd_reverb_settings_by_Venue 
	GetPakManCurrent \{map = zones}

	switch <pak>
		case z_party
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_party}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_party}
		case z_dive
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_dive}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_dive}
		case z_soundcheck
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_dive}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_dive}
		case z_prison
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_prison}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_prison}
		case z_artdeco
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_artdeco}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_artdeco}
		case z_video
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_video}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_video}
		case z_wikker
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_wikker}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_wikker}
		case z_budokan
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_budokan}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_budokan}
		case z_hell
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_hell}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_hell}
		default
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss}
	endswitch
endscript

script PrintPushPopDebugInfo 
	if NOT GotParam \{push}
		if NOT GotParam \{pop}

			return
		endif
	endif
	if GotParam \{push}
		pushPop = 'push'
	else
		pushPop = 'pop'
	endif
	if NOT GotParam \{Name}

		return
	endif

endscript

script Generic_Reverb_Functionality_Script \{NewEchoSettings = $Echo_Generic_Outside_Slap
		EchoFadeTime = 0.5
		NewReverbSettings = $Reverb_Generic_Outside_Verb
		ReverbFadeTime = 0.5}
	if inside
		if GotParam \{NewEchoSettings}
			if GotParam \{EchoFadeTime}
				setsoundbusseffects effect = <NewEchoSettings> time = <EchoFadeTime>
			else
				setsoundbusseffects effect = <NewEchoSettings>
			endif
		endif
		if GotParam \{NewReverbSettings}
			if GotParam \{ReverbFadeTime}
				setsoundbusseffects effect = <NewReverbSettings> time = <ReverbFadeTime>
			else
				setsoundbusseffects effect = <NewReverbSettings>
			endif
		endif
	else
		if GotParam \{Destroyed}
		else
			if GotParam \{Created}
			else
				if GotParam \{ExitEchoSettings}
					if GotParam \{ExitEchoFadeTime}
						setsoundbusseffects effect = <ExitEchoSettings> time = <ExitEchoFadeTime>
					else
						setsoundbusseffects effect = <ExitEchoSettings>
					endif
				endif
				if GotParam \{ExitReverbSettings}
					if GotParam \{ExitReverbFadeTime}
						setsoundbusseffects effect = <ExitReverbSettings> time = <ExitReverbFadeTime>
					else
						setsoundbusseffects effect = <ExitReverbSettings>
					endif
				endif
			endif
		endif
	endif
endscript

script GH_Guitar_Battle_DSP_Effects_Player1 
	switch <attack_effect>
		case double_note_flange

		setsoundbusseffects \{effect = $Flange_DoubleNotes1}

		setsoundbussparams \{Guitar_Balance_First_Player = {
				vol = 2
			}}
		case overload_highpass

		setsoundbusseffects \{effect = $HighPass_Thin1}

		setsoundbussparams \{Guitar_Balance_First_Player = {
				vol = 3
			}}
		case brokenstring_chorus

		setsoundbusseffects \{effect = $Chorus_Generic1}

		setsoundbussparams \{Guitar_Balance_First_Player = {
				vol = 0
			}}
		case lefty_eq

		setsoundbusseffects \{effect = $LowPass_Muffled1}

		setsoundbussparams \{Guitar_Balance_First_Player = {
				vol = 6
			}}
		case diffup_eq

		setsoundbusseffects \{effect = $EQ_Wah1}

		setsoundbussparams \{Guitar_Balance_First_Player = {
				vol = -6
			}}
		default

	endswitch
endscript

script GH_Guitar_Battle_DSP_Effects_Player2 
	switch <attack_effect>
		case double_note_flange

		setsoundbusseffects \{effect = $Flange_DoubleNotes2}

		setsoundbussparams \{Guitar_Balance_Second_Player = {
				vol = 2
			}}
		case overload_highpass

		setsoundbusseffects \{effect = $HighPass_Thin2}

		setsoundbussparams \{Guitar_Balance_Second_Player = {
				vol = 3
			}}
		case brokenstring_chorus

		setsoundbusseffects \{effect = $Chorus_Generic2}

		setsoundbussparams \{Guitar_Balance_Second_Player = {
				vol = 0
			}}
		case lefty_eq

		setsoundbusseffects \{effect = $LowPass_Muffled2}

		setsoundbussparams \{Guitar_Balance_Second_Player = {
				vol = 6
			}}
		case diffup_eq

		setsoundbusseffects \{effect = $EQ_Wah2}

		setsoundbussparams \{Guitar_Balance_Second_Player = {
				vol = -6
			}}
		default

	endswitch
endscript

script GH3_Change_Guitar_Audio_Effects_Guitar_Single_Player \{effect_type = Default}
endscript

script GH3_Guitar_Effects_Wait 
endscript

script GH3_Battle_Attack_Finished_SFX 
	if (<Player> = 1)
		SoundEvent \{event = GH_SFX_BattleMode_Attack_Over_P1}
	else
		SoundEvent \{event = GH_SFX_BattleMode_Attack_Over_P2}
	endif
endscript

script Reset_Battle_DSP_Effects 
	if (<Player> = 1)
		Reset_Battle_DSP_Effects_Player1
	else
		Reset_Battle_DSP_Effects_Player2
	endif
endscript

script Reset_Battle_DSP_Effects_Player1 
	setsoundbusseffects \{effect = $LowPass_Default1
		time = 0.15}
	setsoundbusseffects \{effect = $HighPass_Default1
		time = 0.15}
	setsoundbusseffects \{effect = $Flange_Default1
		time = 0.15}
	setsoundbusseffects \{effect = $Chorus_Default1
		time = 0.15}
	setsoundbusseffects \{effect = $EQ_Default1
		time = 0.15}

	setsoundbussparams \{Guitar_Balance_First_Player = {
			vol = 0
		}}
endscript

script Reset_Battle_DSP_Effects_Player2 
	setsoundbusseffects \{effect = $LowPass_Default2
		time = 0.15}
	setsoundbusseffects \{effect = $HighPass_Default2
		time = 0.15}
	setsoundbusseffects \{effect = $Flange_Default2
		time = 0.15}
	setsoundbusseffects \{effect = $Chorus_Default2
		time = 0.15}
	setsoundbusseffects \{effect = $EQ_Default2
		time = 0.15}

	setsoundbussparams \{Guitar_Balance_Second_Player = {
			vol = 0
		}}
endscript

script Check_And_Reset_Effects 
endscript

script cleanup_spawned_scripts_for_effects 
endscript

script turn_off_current_audio_effect 
endscript

script Profiling_FMOD_EFFECTS 
endscript
0x9799c5af = {
	effect = $0x2973b414
	effect2 = $0x902425b3
	effect3 = $0xf3253ee5
	effect4 = $0x8d024152
}
0x2973b414 = {
	effect = LowPass
	Name = LowPasstest1
	cutoff = 5000.0
	resonance = 10.0
}
0x902425b3 = {
	effect = HighPass
	Name = HighPasstest1
	cutoff = 300.0
	resonance = 3.0
}
0xf3253ee5 = {
	effect = echo
	Name = InGameEcho1
	delay = 150
	DecayRatio = 0.4
	maxchannels = 0
	Drymix = 1.0
	Wetmix = 0.5
}
0x8d024152 = {
	effect = flange
	Name = flangetest1
	Drymix = 1.0
	Wetmix = 0.0
	DEPTH = 1.0
	rate = 0.1
}

script GH_Star_Power_Verb_On \{which_player = 1}
	if ($guitar_player1_unique_id = NULL)
		return
	endif
	if ($Star_power_verb_is_on = 1)
		if NOT isSinglePlayerGame
			SpawnScriptNow star_power_deployed_sfx_multiplayer params = {the_player = <which_player>}
		endif
		return
	endif
	Change \{Star_power_verb_is_on = 1}
	if isSinglePlayerGame
		SoundEvent \{event = Star_Power_Deployed_SFX}
	else
		SpawnScriptNow star_power_deployed_sfx_multiplayer params = {the_player = <which_player>}
	endif
	if ($game_mode != tutorial)
		if NOT IsSoundEventPlaying \{Star_Power_Deployed_Cheer_SFX}
			SoundEvent \{event = Star_Power_Deployed_Cheer_SFX}
		endif
	endif
	PushSoundBussParams
	setsoundbussparams \{$Star_Power_BussSet
		time = 0.5}
	get_song_tempo_cfunc
	if (<beat_duration> > 400)
		beat_duration = (<beat_duration> / 2)
	endif
	if (isngc)
		setsoundbusseffects \{$0x9799c5af
			time = 0.1}
	else
		if (<beat_duration> > 400)
			beat_duration = (<beat_duration> / 2)
		endif
	endif
	if (<beat_duration> > 400)
		beat_duration = (<beat_duration> / 2)
	endif
	if (<beat_duration> > 400)
		beat_duration = 400
	endif
	setsoundbusseffects effect = {effect = echo Name = GuitarEcho1 delay = <beat_duration>}
	setsoundbusseffects \{effect = {
			effect = echo
			Name = GuitarEcho1
			Drymix = 1.0
			Wetmix = 0.5
		}
		time = 0.1}
	setsoundbusseffects \{effect = {
			effect = sfxreverb
			Name = GuitarReverb1
			ReflectionsLevel = -1200.0
			ReverbLevel = -550.0
		}
		time = 0.1}
	0xb47e73e6 \{stream_id = $0xb65332bc
		Enabled = true}
endscript

script GH_Star_Power_Verb_Off 
	if ($guitar_player1_unique_id = NULL)
		return
	endif
	if ($Star_power_verb_is_on = 1)
		PopSoundBussParams
	endif
	0xb47e73e6 \{stream_id = $0xb65332bc
		Enabled = FALSE}
	setsoundbusseffects \{effect = {
			effect = echo
			Name = GuitarEcho1
			Wetmix = 0.0
		}}
	if (isngc)
		setsoundbusseffects \{$0xbc9810a0
			time = 0.5}
	else
		setsoundbusseffects \{effect = {
				effect = sfxreverb
				Name = GuitarReverb1
				ReflectionsLevel = -10000.0
				ReverbLevel = -10000.0
			}
			time = 0.5}
	endif
	Change \{Star_power_verb_is_on = 0}
endscript

script GH3_Set_Guitar_Verb_And_Echo_to_Dry 
	setsoundbusseffects \{effect = $Echo_Guitar_Buss_Dry}
	setsoundbusseffects \{effect = $Reverb_Guitar_Buss_Dry}
endscript

script GH_SFX_Overloaded_Static_Player1 
endscript

script GH_SFX_wait_then_kill_Overloaded_Static_Player1 
endscript

script GH_SFX_Overloaded_Static_Player2 
endscript

script GH_SFX_wait_then_kill_Overloaded_Static_Player2 
endscript

script GH_BattleMode_Modulate_HPF_Cutoff 
endscript

script gh_battlemode_modulate_HPF_value 
endscript

script GH_BattleMode_Modulate_LPF_Cutoff 
endscript

script gh_battlemode_modulate_LPF_value 
endscript

script GH_BattleMode_Modulate_Phaser_Delay 
endscript

script gh_modulate_Phaser_Delay_Value 
endscript

script gh_battlemode_modulate_Wah_value 
endscript

script GH_BattleMode_Player1_SFX_DiffUp_Start 
	SoundEvent \{event = GH_SFX_BattleMode_DiffUp_P1}
endscript

script GH_BattleMode_Player2_SFX_DiffUp_Start 
	SoundEvent \{event = GH_SFX_BattleMode_DiffUp_P2}
endscript

script GH_BattleMode_Player1_SFX_DoubleNotes_Start 
	SoundEvent \{event = GH_SFX_BattleMode_DoubleNote_P1}
endscript

script GH_BattleMode_Player2_SFX_DoubleNotes_Start 
	SoundEvent \{event = GH_SFX_BattleMode_DoubleNote_P2}
endscript

script GH_BattleMode_Player1_SFX_Shake_Start 
	SoundEvent \{event = GH_SFX_BattleMode_Lightning_Player1}
endscript

script GH_BattleMode_Player2_SFX_Shake_Start 
	SoundEvent \{event = GH_SFX_BattleMode_Lightning_Player2}
endscript

script GH_BattleMode_Player1_SFX_LeftyNotes_Start 
	SoundEvent \{event = GH_SFX_BattleMode_Lefty_P1}
endscript

script GH_BattleMode_Player2_SFX_LeftyNotes_Start 
	SoundEvent \{event = GH_SFX_BattleMode_Lefty_P2}
endscript

script GH_BattleMode_Player1_SFX_BrokenString_Start 
	SoundEvent \{event = GH_SFX_BattleMode_StringBreak_P1}
endscript

script GH_BattleMode_Player2_SFX_BrokenString_Start 
	SoundEvent \{event = GH_SFX_BattleMode_StringBreak_P2}
endscript

script GH_BattleMode_Player1_SFX_Steal 
	SoundEvent \{event = GH_SFX_BattleMode_Steal_P1}
endscript

script GH_BattleMode_Player2_SFX_Steal 
	SoundEvent \{event = GH_SFX_BattleMode_Steal_P2}
endscript

script GH_BattleMode_Player1_SFX_Whammy_Start 
	SoundEvent \{event = GH_SFX_BattleMode_WhammyAttack_P1}
endscript

script GH_BattleMode_Player2_SFX_Whammy_Start 
	SoundEvent \{event = GH_SFX_BattleMode_WhammyAttack_P2}
endscript

script GH_BattleMode_Player1_SFX_Death_Drain 
	SoundEvent \{event = GH_SFX_BattleMode_Death_Drain_P1}
endscript

script GH_BattleMode_Player2_SFX_Death_Drain 
	SoundEvent \{event = GH_SFX_BattleMode_Death_Drain_P2}
endscript

script GH_BattleMode_Start_Heartbeat_P1 
	SoundEvent \{event = Battlemode_HeartBeat_P1}
endscript

script GH_BattleMode_Stop_Heartbeat_P1 
	StopSoundEvent \{Battlemode_HeartBeat_P1}
endscript

script GH_BattleMode_Start_Heartbeat_P2 
	SoundEvent \{event = Battlemode_HeartBeat_P2}
endscript

script GH_BattleMode_Stop_Heartbeat_P2 
	StopSoundEvent \{Battlemode_HeartBeat_P2}
endscript

script GH_BattleMode_SFX_Sudden_Death 
	SoundEvent \{event = GH_SFX_BattleMode_Sudden_Death}
endscript

script GH3_Battle_Play_Crowd_Reaction_SFX 
	if (<receiving_player> = 1)
		Battle_Attack_Cheer_Based_On_Venue_P2
	else
		Battle_Attack_Cheer_Based_On_Venue_P1
	endif
endscript

script Battle_Attack_Cheer_Based_On_Venue_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Battle_Attack_Small_Crowd_Cheer_P1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Battle_Attack_Medium_Crowd_Cheer_P1}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Battle_Attack_Large_Crowd_Cheer_P1}
		case z_hell
		SoundEvent \{event = Battle_Attack_Hell_Crowd_Cheer_P1}
		default
		SoundEvent \{event = Battle_Attack_Medium_Crowd_Cheer_P1}
	endswitch
endscript

script Battle_Attack_Cheer_Based_On_Venue_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Battle_Attack_Small_Crowd_Cheer_P2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Battle_Attack_Medium_Crowd_Cheer_P2}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Battle_Attack_Large_Crowd_Cheer_P2}
		case z_hell
		SoundEvent \{event = Battle_Attack_Hell_Crowd_Cheer_P2}
		default
		SoundEvent \{event = Battle_Attack_Medium_Crowd_Cheer_P2}
	endswitch
endscript

script GH3_Battle_Play_Whammy_Pitch_Up_Sound 
	num_strums = ($<other_player_status>.whammy_attack)
	player_pan = ($<other_player_status>.Player)
	if (<player_pan> = 1)
		<pan1x> = -0.76199996
		<pan1y> = 0.6470001
		<pan2x> = -0.44799998
		<pan2y> = 0.894
	else
		<pan1x> = 0.47
		<pan1y> = 0.883
		<pan2x> = 0.728
		<pan2y> = 0.685
	endif
	switch <difficulty>
		case easy
		<total_strums> = ($battlemode_powerups [6].easy_repair)
		case medium
		<total_strums> = ($battlemode_powerups [6].medium_repair)
		case hard
		<total_strums> = ($battlemode_powerups [6].hard_repair)
		case expert
		<total_strums> = ($battlemode_powerups [6].expert_repair)
		default

	endswitch
	<change_pitch> = (1.3 * <num_strums> / <total_strums>)
	<local_pitch> = (100.0 - (10.0 * <change_pitch>))
	PlaySound GH3_BattleMode_WhammyAttack_Received vol = $Backgrounds_Master_Volume pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script GH3_Crowd_Manipulate_SFX 
endscript

script GH3_Crowd_Event_Listener \{event_type = surge_fast}
	if NOT ($game_mode = training)
		if GotParam \{event_type}
			if ($current_crowd > $CrowdLevelForSurges)
				switch <event_type>
					case sing

					SpawnScriptNow \{GH3_AdjustCrowdSingingVolumeUp}
					case surge_fast
					GH3_AdjustCrowdFastSurge <...>
					case surge_slow
					GH3_AdjustCrowdSlowSurge <...>
					case applause
					GH3_Play_A_Crowd_Applause_Based_On_Venue
					default

				endswitch
			else
				if GotParam \{override_state}
					switch <event_type>
						case sing

						SpawnScriptNow \{GH3_AdjustCrowdSingingVolumeUp}
						case surge_fast
						GH3_Play_A_Fast_Crowd_Swell_Based_On_Venue
						case surge_slow
						GH3_Play_A_Crowd_Applause_Based_On_Venue
						GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue
						case applause
						GH3_Play_A_Crowd_Applause_Based_On_Venue
						default

					endswitch
				endif
			endif
		endif
	endif
endscript

script GH3_Play_A_Fast_Crowd_Swell_Based_On_Venue 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		SoundEvent \{event = Small_Crowd_Swell}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_swell}
		case z_prison
		case z_artdeco
		case z_video
		SoundEvent \{event = Medium_Crowd_Swell}
		case z_wikker
		case z_budokan
		SoundEvent \{event = Crowd_Fast_Surge_Cheer}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Swell}
		default
		SoundEvent \{event = Medium_Crowd_Swell}
	endswitch
endscript

script GH3_Play_A_Crowd_Applause_Based_On_Venue 
	SoundEvent \{event = Crowd_Fast_Surge_Cheer}
endscript

script GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		case z_prison
		case z_artdeco
		case z_video
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		case z_wikker
		case z_budokan
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		case z_hell
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		default
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
	endswitch
endscript

script GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
		case z_prison
		case z_artdeco
		case z_video
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
		case z_wikker
		case z_budokan
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
		case z_hell
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
		default
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
	endswitch
endscript

script GH3_SFX_Encore_Accept 
	Do_Actual_Transition_SFX_Medium_To_Good
	GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue
endscript

script GH3_SFX_Encore_Decline 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Encore_Decline_Small_Crowd_Med_To_Bad_SFX}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Encore_Decline_Medium_Crowd_Med_To_Bad_SFX}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Encore_Decline_Crowd_Med_To_Bad_SFX}
		case z_hell
		SoundEvent \{event = Encore_Decline_Hell_Crowd_Med_To_Bad_SFX}
		default
		SoundEvent \{event = Encore_Decline_Medium_Crowd_Med_To_Bad_SFX}
	endswitch
	GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue
endscript

script GH3_AdjustCrowdSingingVolumeUp 
endscript

script GH3_AdjustCrowdSingingVolumeDown 
endscript

script GH3_AdjustCrowdFastSurge 
	SoundBussUnlock \{Crowd_Beds}
	setsoundbussparams \{$CrowdSurgeBig_BussSet
		time = 1.2}
	SoundBussLock \{Crowd_Beds}
	Wait \{1.5
		Seconds}
	SoundBussUnlock \{Crowd_Beds}
	setsoundbussparams \{$CrowdNormal_BussSet
		time = 4}
	SoundBussLock \{Crowd_Beds}
endscript

script GH3_AdjustCrowdSlowSurge 
	SoundBussUnlock \{Crowd_Beds}
	setsoundbussparams \{$CrowdSurgeSmall_BussSet
		time = 4}
	SoundBussLock \{Crowd_Beds}
	Wait \{8
		Seconds}
	SoundBussUnlock \{Crowd_Beds}
	setsoundbussparams \{$CrowdNormal_BussSet
		time = 4}
	SoundBussLock \{Crowd_Beds}
endscript

script Crowd_Singalong_Volume_Up 
	SoundBussUnlock \{Crowd_Singalong}
	setsoundbussparams \{$CrowdSingingVolUp_BussSet
		time = 4}
	SoundBussLock \{Crowd_Singalong}
endscript

script Crowd_Singalong_Volume_Down 
	SoundBussUnlock \{Crowd_Singalong}
	setsoundbussparams \{$CrowdSingingVolDown_BussSet
		time = 1}
	SoundBussLock \{Crowd_Singalong}
endscript
0xea35017a = NULL
0xe4c919f7 = -1
0x518674cc = [
	{
		Stream = 'OTHER\\MENMUSIC\\MENTOYS'
	}
	{
		Stream = 'OTHER\\MENMUSIC\\MENLOVE'
	}
	{
		Stream = 'OTHER\\MENMUSIC\\MENMAMA'
	}
	{
		Stream = 'OTHER\\MENMUSIC\\MENRAGD'
	}
	{
		Stream = 'OTHER\\MENMUSIC\\MENSWTE'
	}
	{
		Stream = 'OTHER\\MENMUSIC\\MENWALK'
	}
]

script 0x20cd6205 
	begin
	getrandomarrayelement ($0x518674cc)
	if ($0xe4c919f7 != <index>)
		Change 0xe4c919f7 = <index>
		break
	endif
	repeat
	0x810401fe FileName = (<element>.Stream) 0x3dd98e8d = 22050 stereo = true 0xa7c75de0
	return <...>
endscript
ismenumusicon = 0

script menu_music_on \{setflag = 0}
	if (<setflag> = 1)
		Change \{0x23c86b2d = 1}
	endif
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if GotParam \{waitforguitarlick}
		Wait \{3
			Seconds}
	endif
	if isps2
		if ($ismenumusicon = 1)
			return
		endif
		Change \{ismenumusicon = 1}
		if NOT ($current_song_qpak = None)
			unload_songqpak
			Change \{current_song_qpak = None}
		endif
		if NOT 0xdaee51ef
			0xdaee51ef \{disable}
			Change \{ismenumusicon = 0}
			return
		endif
	endif
	EnableUserMusic
	begin
	if ((isps2) || (isngc))
		if ((isngc))
			if NOT ($0xea35017a = NULL)
				Menu_music_Checking
			endif
		endif
		0x20cd6205
		Change 0xea35017a = <unique_id>
		begin
		if PreloadStreamDone \{$0xea35017a}
			break
		endif
		Wait \{6
			gameframe}
		repeat
		StartPreLoadedStream \{$0xea35017a}
		Wait \{3
			Seconds}
		Menu_music_Checking
		0xc7acd659 \{unique_id = $0xea35017a}
		Wait \{1
			Second}
	else
		SoundEvent \{event = Menu_Music_SE}
		Wait \{3
			Seconds}
		Menu_music_Checking
		Wait \{1
			Second}
	endif
	repeat
endscript

script Menu_music_Checking 
	begin
	if (isps2)
		if 0x0a110288 \{$0xea35017a}
			if NOT 0x355a9e77
				0x20cd6205
			endif
		elseif 0xc4ab3751
			StartPreLoadedStream \{$0xea35017a}
		else
			break
		endif
	else
		if (isngc)
			if NOT 0x0a110288 \{$0xea35017a}
				break
			endif
		else
			if NOT IsSoundEventPlaying \{Menu_Music_SE}
				break
			endif
		endif
	endif
	Wait \{1
		Second}
	repeat
endscript

script menu_music_off \{setflag = 0}
	if (<setflag> = 1)
		Change \{0x23c86b2d = 0}
	endif
	if isps2
		if ($ismenumusicon = 0)
			return
		endif
		Change \{ismenumusicon = 0}
		0xdaee51ef \{disable}
	endif
	EnableUserMusic \{disable}
	KillSpawnedScript \{Name = menu_music_on}
	if ((isps2) || (isngc))
		0xc7acd659 \{unique_id = $0xea35017a}
	else
		StopSoundEvent \{Menu_Music_SE}
	endif
	if ((isngc))
		Change \{0xea35017a = NULL}
	endif
endscript
0x67e65592 = NULL

script PlayEncoreStreamSFX 
endscript

script 0x8c046839 

	if ((isps2) || (isngc))
		if NOT ($0x67e65592 = NULL)
			0xc7acd659 \{unique_id = $0x67e65592}
			Change \{0x67e65592 = NULL}
			WaitOneGameFrame
			WaitOneGameFrame
		endif
	endif
endscript

script Song_Intro_Kick_SFX_Waiting 
	printingtext = ($current_intro.hud_move_time)
	Wait ($current_intro.hud_move_time / 1000.0) Seconds
	SoundEvent \{event = Song_Intro_Kick_SFX}
endscript

script Song_Intro_Highway_Up_SFX_Waiting 
	printingtext = ($current_intro.highway_move_time)
	waitTime = (($current_intro.highway_move_time / 1000.0) - 1.5)
	if (<waitTime> < 0)
		waitTime = 0
	endif
	Wait <waitTime> Seconds
	SoundEvent \{event = Song_Intro_Highway_Up}
endscript

script Change_Crowd_Looping_SFX \{crowd_looping_state = good
		Player = 1}

	if ($boss_battle = 1)

		if (<Player> = 1)
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		else

		endif
	else

		if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			do_actual_changing_of_looping_sound \{crowd_looping_state = good}
		else
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		endif
	endif
endscript

script do_actual_changing_of_looping_sound 
	if GotParam \{crowd_looping_state}
		switch <crowd_looping_state>
			case bad
			Change_Crowd_Looping_SFX_Bad
			case neutral
			Change_Crowd_Looping_SFX_Neutral
			case good
			Change_Crowd_Looping_SFX_Good
			default
			Change_Crowd_Looping_SFX_Good
		endswitch
	endif
endscript

script Change_Crowd_Looping_SFX_Bad 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		BG_Crowd_Small_Bad
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		BG_Crowd_Medium_Bad
		case z_budokan
		case z_wikker
		BG_Crowd_Large_Bad
		case z_hell
		BG_Crowd_Hell_Bad
		case z_nipmuc
		bg_crowd_nipmuc_bad
		default
		BG_Crowd_Medium_Bad
	endswitch
endscript

script Change_Crowd_Looping_SFX_Neutral 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		BG_Crowd_Small_Neutral
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		BG_Crowd_Medium_Neutral
		case z_budokan
		case z_wikker
		BG_Crowd_Large_Neutral
		case z_hell
		BG_Crowd_Hell_Neutral
		case z_nipmuc
		bg_crowd_nipmuc_neutral
		default
		BG_Crowd_Medium_Neutral
	endswitch
endscript

script Change_Crowd_Looping_SFX_Good 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		BG_Crowd_Small_Good
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		BG_Crowd_Medium_Good
		case z_budokan
		case z_wikker
		case z_credits
		BG_Crowd_Large_Good
		case z_hell
		BG_Crowd_Hell_Good
		case z_nipmuc
		bg_crowd_nipmuc_good
		default
		BG_Crowd_Medium_Good
	endswitch
endscript

script Crowd_Transition_SFX_Poor_To_Medium 

	if GotParam \{Player}
		Crowd_generic_transition_sfx state = poor_to_med Player = <Player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Good 

	if GotParam \{Player}
		Crowd_generic_transition_sfx state = med_to_good Player = <Player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Poor 

	if GotParam \{Player}
		Crowd_generic_transition_sfx state = med_to_poor Player = <Player>
	endif
endscript

script Crowd_Transition_SFX_Good_To_Medium 

	if GotParam \{Player}
		Crowd_generic_transition_sfx state = good_to_med Player = <Player>
	endif
endscript

script Crowd_generic_transition_sfx \{state = med_to_good}
	if ($game_mode = p2_battle)
	else
		if ($boss_battle = 1)
			if (<Player> = 1)
				transition_sfx_left_side state = <state>
			else
			endif
		else
			if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			else
				transition_sfx_both_sides state = <state>
			endif
		endif
	endif
endscript

script transition_sfx_left_side 
	if GotParam \{state}
		if (<state> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium_P1
		endif
		if (<state> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor_P1
		endif
		if (<state> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good_P1
		endif
		if (<state> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium_P1
		endif
	endif
endscript

script transition_sfx_right_side 
	if GotParam \{state}
		if (<state> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium_P2
		endif
		if (<state> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor_P2
		endif
		if (<state> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good_P2
		endif
		if (<state> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium_P2
		endif
	endif
endscript

script transition_sfx_both_sides 
	if GotParam \{state}
		if (<state> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium
		endif
		if (<state> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor
		endif
		if (<state> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good
		endif
		if (<state> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium
		endif
	endif
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Bad_To_Med_SFX}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_bad_to_med_sfx}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Bad_To_Med_SFX}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Bad_To_Med_SFX}
		default
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Bad_To_Med_SFX_P1}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_bad_to_med_sfx_p1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX_P1}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Bad_To_Med_SFX_P1}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Bad_To_Med_SFX_P1}
		default
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Bad_To_Med_SFX_P2}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_bad_to_med_sfx_p2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX_P2}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Bad_To_Med_SFX_P2}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Bad_To_Med_SFX_P2}
		default
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX_P2}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Good_SFX}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_med_to_good_sfx}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Med_To_Good_SFX}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Good_SFX}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Good_SFX_P1}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_med_to_good_sfx_p1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX_P1}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Med_To_Good_SFX_P1}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Good_SFX_P1}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Good_SFX_P2}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_med_to_good_sfx_p2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX_P2}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Med_To_Good_SFX_P2}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Good_SFX_P2}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX_P2}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Bad_SFX}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_med_to_bad_sfx}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Med_To_Bad_SFX}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Bad_SFX}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Bad_SFX_P1}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_med_to_bad_sfx_p1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX_P1}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Med_To_Bad_SFX_P1}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Bad_SFX_P1}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Bad_SFX_P2}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_med_to_bad_sfx_p2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX_P2}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Med_To_Bad_SFX_P2}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Bad_SFX_P2}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX_P2}
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Good_To_Med_SFX}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_good_to_med_sfx}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Good_To_Med_SFX}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Good_To_Med_SFX}
		default
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Good_To_Med_SFX_P1}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_good_to_med_sfx_p1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX_P1}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Good_To_Med_SFX_P1}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Good_To_Med_SFX_P1}
		default
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Good_To_Med_SFX_P2}
		case z_nipmuc
		SoundEvent \{event = nipmuc_crowd_good_to_med_sfx_p2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX_P2}
		case z_budokan
		case z_wikker
		SoundEvent \{event = Crowd_Good_To_Med_SFX_P2}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Good_To_Med_SFX_P2}
		default
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX_P2}
	endswitch
endscript

script You_Rock_Waiting_Crowd_SFX 
	Wait \{2.75
		Seconds}
	GH3_Play_A_Crowd_Applause_Based_On_Venue
	GetPakManCurrent \{map = zones}
	if (<pak> = z_hell)
		SoundEvent \{event = 0x685318c8}
	else
		SoundEvent \{event = Crowd_Fast_Surge_Cheer}
	endif
endscript
save_check_time_early = 0.0
save_check_time_late = 0.0

script Audio_Sync_Test_Disable_Highway 
	disable_bg_viewport
	Change \{save_check_time_early = $check_time_early}
	Change \{save_check_time_late = $check_time_late}
	Change \{check_time_early = 1.0}
	Change \{check_time_late = 1.0}
endscript

script Audio_Sync_Test_Enable_Highway 
	enable_bg_viewport
	Change \{check_time_early = $save_check_time_early}
	Change \{check_time_late = $save_check_time_late}
endscript

script 0x3200ba84 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}

	if NOT (isps2)
		return
	endif
	if ($0xd5ab88b5 = NULL)
		return
	endif

	begin
	WaitOneGameFrame
	if NOT (0x0a110288 $0x67e65592)
		break
	endif
	repeat
	GetSongTimeMs
	CastToInteger \{time}
	time = (<time> + 1500)
	if (<time> < 0)
		time = 0
	endif
	0xdcc8a36f time = <time>
	if NOT ($playing_song = 1)
		return
	endif
	formatText \{checksumName = crowd_stream
		'%s'
		s = $0xd5ab88b5}
	Change crowd_stream_id = <crowd_stream>
	PreloadStream <crowd_stream> buss = Master position = <adjustedtime> 0xf7a8579e = true
	if (<unique_id> = NULL)

		return
	endif
	begin
	WaitOneGameFrame
	if NOT ($playing_song = 1)
		return
	endif
	GetSongTimeMs
	CastToInteger \{time}
	if (<time> >= <adjustedtime>)
		if PreloadStreamDone <unique_id>
			break
		endif
	endif
	repeat
	if NOT ($playing_song = 1)
		return
	endif
	if (($song_paused = 1) || ($0xfeed981d = 1))
		StartPreLoadedStream <unique_id> startpaused = 1 buss = Crowd_Singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
	else
		StartPreLoadedStream <unique_id> startpaused = 0 buss = Crowd_Singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
	endif
	Change crowd_unique_id = <unique_id>
endscript

script GH_SFX_Intro_WarmUp 
	if NOT ($0x67e65592 = NULL)
		StartPreLoadedStream \{$0x67e65592
			buss = Crowd_PreSong_Intro}
	endif
	SpawnScriptLater \{0x3200ba84}
	return
endscript

script PreEncore_Crowd_Build_SFX 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_nipmuc
		0x926e049d = 'OTHER\\ENCBLD\\B_NIPMUC'
		case z_maxskc
		0x926e049d = 'OTHER\\ENCBLD\\B_MAXSKC'
		case z_fenway
		0x926e049d = 'OTHER\\ENCBLD\\B_FENWAY'
		case z_nine_lives
		0x926e049d = 'OTHER\\ENCBLD\\B_NINLIV'
		case z_jpplay
		0x926e049d = 'OTHER\\ENCBLD\\B_JPPLAY'
		case z_hof
		0x926e049d = 'OTHER\\ENCBLD\\B_HOF'
		default
		0x926e049d = 'OTHER\\ENCBLD\\B_NIPMUC'
	endswitch
	0x810401fe FileName = <0x926e049d> 0x3dd98e8d = 33075 looping = true
	Change 0xf2fd69fd = <unique_id>
	waitforpreload_stream \{Stream = 0xf2fd69fd}
	0x7c757af0 $0xf2fd69fd vol = ($Backgrounds_Master_Volume * 2) time = 4.0
	StartPreLoadedStream \{$0xf2fd69fd
		num_loops = -1}
endscript

script PreEncore_Crowd_Build_SFX_STOP 
	if NOT ($0xf2fd69fd = NULL)
		0xc7acd659 \{unique_id = $0xf2fd69fd}
		Change \{0xf2fd69fd = NULL}
	endif
endscript

script GH_BossDevil_Death_Transition_SFX 
	SoundEvent \{event = Devil_Die_Transition_SFX}
endscript

script Battle_SFX_Repair_Broken_String 
	if GotParam \{num_strums}
		if GotParam \{player_pan}
			if GotParam \{difficulty}
				if (<player_pan> = 1)
					<pan1x> = -0.76199996
					<pan1y> = 0.6470001
					<pan2x> = -0.44799998
					<pan2y> = 0.894
				else
					<pan1x> = 0.47
					<pan1y> = 0.883
					<pan2x> = 0.728
					<pan2y> = 0.685
				endif
				switch <difficulty>
					case easy
					<total_strums> = ($battlemode_powerups [5].easy_repair)
					case medium
					<total_strums> = ($battlemode_powerups [5].medium_repair)
					case hard
					<total_strums> = ($battlemode_powerups [5].hard_repair)
					case expert
					<total_strums> = ($battlemode_powerups [5].expert_repair)
					default

				endswitch
				<change_pitch> = (1.0 * <num_strums> / <total_strums>)
				<local_pitch> = (100.0 - (10.0 * <change_pitch>))
				PlaySound GH3_Battlemode_StringTune_2 vol = 50 pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y> buss = UI_Battle_Mode
			endif
		endif
	endif
endscript

script gh_sfx_play_aerosmith_entrance_audio_from_zone_memory 
	if NOT ($0x67e65592 = NULL)
		StartPreLoadedStream \{$0x67e65592
			buss = Crowd_PreSong_Intro}
	endif
	SpawnScriptLater \{0x3200ba84}
	return
endscript

script gh_sfx_play_dmcintro_audio_from_zone_memory 
	if NOT ($0x67e65592 = NULL)
		StartPreLoadedStream \{$0x67e65592
			buss = Crowd_PreSong_Intro}
	endif
	SpawnScriptLater \{0x3200ba84}
	return
endscript

script GH_SFX_Play_Encore_Audio_From_Zone_Memory 
	if NOT ($0x67e65592 = NULL)
		StartPreLoadedStream \{$0x67e65592
			buss = Crowd_PreSong_Intro}
	endif
	SpawnScriptLater \{0x3200ba84}
endscript
Tom_Intro_Front_Speakers_unique_id = NULL
Tom_Intro_Back_Speakers_unique_id = NULL
joe_intro_front_speakers_unique_id = NULL
joe_intro_back_speakers_unique_id = NULL
Slash_Intro_Front_Speakers_unique_id = NULL
Slash_Intro_Back_Speakers_unique_id = NULL
Lou_Intro_Front_Speakers_unique_id = NULL
Lou_Intro_Back_Speakers_unique_id = NULL

script GH_SFX_Preload_Boss_Intro_Audio 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_hof
		if ($current_song = bossjoe)

			Change \{joe_intro_front_speakers_unique_id = NULL}
			Change \{joe_intro_back_speakers_unique_id = NULL}
			if 0x810401fe \{FileName = 'OTHER\\INTRO\\JOE'
					0x3dd98e8d = 33075
					stereo = true}
				Change joe_intro_front_speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = joe_intro_front_speakers_unique_id}
				StartPreLoadedStream \{$joe_intro_front_speakers_unique_id
					startpaused = true}
			else

			endif
		endif
		case z_dive
		if ($current_song = bosstom)

			Change \{Tom_Intro_Front_Speakers_unique_id = NULL}
			Change \{Tom_Intro_Back_Speakers_unique_id = NULL}
			if 0x810401fe \{FileName = 'OTHER\\INTRO\\TOM'
					0x3dd98e8d = 33075
					stereo = true}
				Change Tom_Intro_Front_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = Tom_Intro_Front_Speakers_unique_id}
			else

			endif
		endif
		case z_prison
		if ($current_song = bossslash)

			Change \{Slash_Intro_Front_Speakers_unique_id = NULL}
			Change \{Slash_Intro_Back_Speakers_unique_id = NULL}
			if 0x810401fe \{FileName = 'OTHER\\INTRO\\SLASH'
					0x3dd98e8d = 33075
					stereo = true}
				Change Slash_Intro_Front_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = Slash_Intro_Front_Speakers_unique_id}
			else

			endif
		endif
		case z_hell
		if ($current_song = bossdevil)

			Change \{Lou_Intro_Front_Speakers_unique_id = NULL}
			Change \{Lou_Intro_Back_Speakers_unique_id = NULL}
			if 0x810401fe \{FileName = 'OTHER\\INTRO\\LOU'
					0x3dd98e8d = 33075
					stereo = true}
				Change Lou_Intro_Front_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = Lou_Intro_Front_Speakers_unique_id}
			else

			endif
		endif
		default

	endswitch
endscript

script GH_SFX_Play_Boss_Audio_From_Zone_Memory 
	GetPakManCurrent \{map = zones}
	switch <pak>
		default

	endswitch
endscript

script GH3_SFX_fail_song_stop_sounds 
	StopSoundsByBuss \{Crowd}
	StopSoundsByBuss \{UI_Star_Power}
	StopSoundsByBuss \{UI_Battle_Mode}
	StopSoundsByBuss \{Wrong_Notes_Player1}
	StopSoundsByBuss \{Wrong_Notes_Player2}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundsByBuss \{binkcutscenes}
	BG_Crowd_Front_End_Silence \{immediate = 1}
	if (isngc)
		end_song \{0xdeb80c0b = 1}
	endif
endscript

script GH3_SFX_Stop_Sounds_For_KillSong 
	StopSoundEvent \{Song_Intro_Kick_SFX}
	StopSoundEvent \{Notes_Ripple_Up_SFX}
	StopSoundEvent \{Song_Intro_Highway_Up}
	StopSoundEvent \{Crowd_Low_To_Med_SFX}
	StopSoundEvent \{Crowd_Good_To_Med_SFX}
	StopSoundEvent \{Crowd_Med_To_Bad_SFX}
	StopSoundEvent \{Crowd_Med_To_Good_SFX}
	StopSoundEvent \{Crowd_OneShots_Cheer_Close}
	StopSoundEvent \{Crowd_Fast_Surge_Cheer}
	StopSoundEvent \{Crowd_OneShots_Boo_Close}
	StopSoundEvent \{Medium_Crowd_Bad_To_Med_SFX}
	StopSoundEvent \{Medium_Crowd_Med_To_Bad_SFX}
	StopSoundEvent \{Medium_Crowd_Swell}
	StopSoundEvent \{Medium_Crowd_Applause}
	StopSoundEvent \{Large_Crowd_Applause_SFX}
	StopSoundEvent \{Small_Crowd_Bad_To_Med}
	StopSoundEvent \{Small_Crowd_Med_To_Bad_SFX}
	StopSoundEvent \{Small_Crowd_Med_To_Good}
	StopSoundEvent \{Small_Crowd_Good_To_Med_SFX}
	StopSoundEvent \{Small_Crowd_OneShots_Boo}
	StopSoundEvent \{Small_Crowd_OneShots_Cheer}
	StopSoundEvent \{Hell_Crowd_Good_To_Med}
	StopSoundEvent \{Hell_Crowd_Good_To_Med_SFX}
	StopSoundEvent \{Lose_Multiplier_Crowd}
	StopSoundEvent \{Star_Power_Awarded_SFX}
	StopSoundEvent \{Star_Power_Ready_SFX}
	StopSoundEvent \{Star_Power_Deployed_SFX}
	StopSoundEvent \{Star_Power_Deployed_Cheer_SFX}
	StopSoundEvent \{Single_Player_Bad_Note_Guitar}
	StopSoundEvent \{Midori_Win_1}
	StopSoundEvent \{Midori_Lose_1}
	StopSoundEvent \{Lars_Win_3}
	StopSoundEvent \{Lars_Lose_1}
	StopSoundEvent \{Johnny_Lose_1}
	StopSoundEvent \{Izzy_Lose_2}
	StopSoundEvent \{Izzy_Lose_1}
	StopSoundEvent \{Axel_Win_4}
	StopSoundEvent \{Axel_Win_1}
	StopSoundEvent \{Axel_Lose_2}
	StopSoundEvent \{Axel_Lose_1}
	StopSoundEvent \{Small_Crowd_Applause_SE}
	StopSoundEvent \{nipmuc_crowd_applause_se}
	StopSoundEvent \{Slash_Outro}
	StopSoundEvent \{GH_SFX_BattleMode_Lightning_Player1}
	StopSoundEvent \{GH_SFX_BattleMode_Lightning_Player2}
	StopSoundEvent \{GH_SFX_BattleMode_DeathOf_P1}
	StopSoundEvent \{GH_SFX_BattleMode_DeathOf_P2}
	StopSoundEvent \{GH_SFX_BattleMode_DiffUp_P1}
	StopSoundEvent \{GH_SFX_BattleMode_DiffUp_P2}
	StopSoundEvent \{GH_SFX_BattleMode_DoubleNote_P1}
	StopSoundEvent \{GH_SFX_BattleMode_DoubleNote_P2}
	StopSoundEvent \{GH_SFX_BattleMode_Lefty_P1}
	StopSoundEvent \{GH_SFX_BattleMode_Lefty_P2}
	StopSoundEvent \{GH_SFX_BattleMode_Steal_P1}
	StopSoundEvent \{GH_SFX_BattleMode_Steal_P2}
	StopSoundEvent \{GH_SFX_BattleMode_StringBreak_P1}
	StopSoundEvent \{GH_SFX_BattleMode_StringBreak_P2}
	StopSoundEvent \{GH_SFX_BattleMode_WhammyAttack_P1}
	StopSoundEvent \{GH_SFX_BattleMode_WhammyAttack_P2}
	StopSoundEvent \{GH_SFX_BossBattle_PlayerDies}
	StopSoundEvent \{GH_SFX_BattleMode_Attack_Over_P1}
	StopSoundEvent \{GH_SFX_BattleMode_Attack_Over_P2}
	StopSoundEvent \{Battle_Power_Awarded_SFX_P1}
	StopSoundEvent \{Battle_Power_Awarded_SFX_P2}
	StopSoundEvent \{GH_SFX_BattleMode_WhammyAttack_Received_P1}
	StopSoundEvent \{GH_SFX_BattleMode_WhammyAttack_Received_P2}
	StopSoundEvent \{GH_SFX_BattleMode_Death_Drain_P1}
	StopSoundEvent \{GH_SFX_BattleMode_Death_Drain_P2}
	StopSoundEvent \{Battle_Attack_Small_Crowd_Cheer_P1}
	StopSoundEvent \{Battle_Attack_Small_Crowd_Cheer_P2}
	StopSoundEvent \{Battle_Attack_Medium_Crowd_Cheer_P1}
	StopSoundEvent \{Battle_Attack_Medium_Crowd_Cheer_P2}
	StopSoundEvent \{Battle_Attack_Large_Crowd_Cheer_P1}
	StopSoundEvent \{Battle_Attack_Large_Crowd_Cheer_P2}
	StopSoundEvent \{Battle_Attack_Hell_Crowd_Cheer_P1}
	StopSoundEvent \{Battle_Attack_Hell_Crowd_Cheer_P2}
	StopSoundEvent \{Battlemode_HeartBeat_P1}
	StopSoundEvent \{Battlemode_HeartBeat_P2}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_2X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_3X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_4X}
	StopSoundEvent \{Lose_Multiplier_Crowd}
	stopsound \{Tom_Intro_Front_Speakers}
	stopsound \{Tom_Intro_Back_Speakers}
	stopsound \{joe_intro_front_speakers}
	stopsound \{joe_intro_back_speakers}
	stopsound \{Slash_Intro_Front_Speakers}
	stopsound \{Slash_Intro_Back_Speakers}
	stopsound \{Lou_Intro_Front_Speakers}
	stopsound \{Lou_Intro_Back_Speakers}
	if NOT (($current_transition = preencore) || ($current_playing_transition = songlost))

		BG_Crowd_Front_End_Silence \{immediate = 1}
	endif
endscript

script GH_SFX_Countoff_Logic 
	get_song_struct song = ($current_song)
	if StructureContains structure = <song_struct> Name = countoff
		countoff_sound = (<song_struct>.countoff)
	else
		countoff_sound = 'sticks_normal'
	endif
	if (<velocity> > 99)
		formatText checksumName = sound_event_name 'Countoff_SFX_%s_Hard' s = <countoff_sound>
	else
		if (<velocity> > 74)
			formatText checksumName = sound_event_name 'Countoff_SFX_%s_Med' s = <countoff_sound>
		else
			if (<velocity> > 49)
				formatText checksumName = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
			else
				formatText checksumName = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
			endif
		endif
	endif
	SoundEvent event = <sound_event_name>
endscript

script GH_SFX_Training_Tuning_Strings 
	switch <note_played>
		case 0
		switch <training_notes_strummed>
			case 1
			PlaySound \{E_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{E_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{E_String
				vol = 90
				pitch = 90}
		endswitch
		case 1
		switch <training_notes_strummed>
			case 1
			PlaySound \{A_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{A_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{A_String
				vol = 90
				pitch = 90}
		endswitch
		case 2
		switch <training_notes_strummed>
			case 1
			PlaySound \{D_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{D_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{D_String
				vol = 90
				pitch = 90}
		endswitch
		case 3
		switch <training_notes_strummed>
			case 1
			PlaySound \{G_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{G_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{G_String
				vol = 90
				pitch = 90}
		endswitch
		case 4
		switch <training_notes_strummed>
			case 1
			PlaySound \{B_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{B_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{B_String
				vol = 90
				pitch = 90}
		endswitch
	endswitch
endscript

script GH_SFX_Note_Streak_SinglePlayer 
	if (<combo> = 50)
		SoundEvent \{event = UI_SFX_50_Note_Streak_SinglePlayer}
	else
		SoundEvent \{event = UI_SFX_100_Note_Streak_SinglePlayer}
	endif
endscript

script GH_SFX_Note_Streak_P1 
	if (<combo> = 50)
		SoundEvent \{event = UI_SFX_50_Note_Streak_P1}
	else
		SoundEvent \{event = UI_SFX_100_Note_Streak_P1}
	endif
endscript

script GH_SFX_Note_Streak_P2 
	if (<combo> = 50)
		SoundEvent \{event = UI_SFX_50_Note_Streak_P2}
	else
		SoundEvent \{event = UI_SFX_100_Note_Streak_P2}
	endif
endscript

script GH_SFX_Training_Hammer_On_Lesson_2 
	switch <note_played>
		case 0
		switch <training_notes_strummed>
			case 1
			PlaySound \{E_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{E_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{E_String
				vol = 90
				pitch = 90}
		endswitch
		case 1
		switch <training_notes_strummed>
			case 1
			PlaySound \{A_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{A_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{A_String
				vol = 90
				pitch = 90}
		endswitch
		case 2
		switch <training_notes_strummed>
			case 1
			PlaySound \{D_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{D_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{D_String
				vol = 90
				pitch = 90}
		endswitch
		case 3
		switch <training_notes_strummed>
			case 1
			PlaySound \{G_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{G_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{G_String
				vol = 90
				pitch = 90}
		endswitch
		case 4
		switch <training_notes_strummed>
			case 1
			PlaySound \{B_Tuning
				vol = 90
				pitch = 80}
			case 2
			PlaySound \{B_Tuning
				vol = 90
				pitch = 90}
			case 3
			PlaySound \{B_String
				vol = 90
				pitch = 90}
		endswitch
	endswitch
endscript

script StopNotes_01 
	if IsSoundEventPlaying \{Tutorial_String_1_Strum_Free}
		SetSoundParams \{Tutorial_String_1_Strum_Free
			vol = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_1_Strum_Free
			vol = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_1_Strum_Free
			vol = 10}
		StopSoundEvent \{Tutorial_String_1_Strum_Free}
	endif
endscript

script StopNotes_02 
	if IsSoundEventPlaying \{Tutorial_String_2_HOPO_Free}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol = 10}
		StopSoundEvent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_03 
	if IsSoundEventPlaying \{Tutorial_String_3_HOPO_Free}
		SetSoundParams \{Tutorial_String_3_HOPO_Free
			vol = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_3_HOPO_Free
			vol = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_3_HOPO_Free
			vol = 10}
		StopSoundEvent \{Tutorial_String_3_HOPO_Free}
	endif
endscript

script StopNotes_04 
	if IsSoundEventPlaying \{Tutorial_String_3_Strum_Free}
		SetSoundParams \{Tutorial_String_3_Strum_Free
			vol = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_3_Strum_Free
			vol = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_3_Strum_Free
			vol = 10}
		StopSoundEvent \{Tutorial_String_3_Strum_Free}
	endif
endscript

script StopNotes_05 
	if IsSoundEventPlaying \{Tutorial_String_2_HOPO_Free}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol = 10}
		StopSoundEvent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_06 
	if IsSoundEventPlaying \{Tutorial_String_1_HOPO_Free}
		SetSoundParams \{Tutorial_String_1_HOPO_Free
			vol = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_1_HOPO_Free
			vol = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_1_HOPO_Free
			vol = 10}
		StopSoundEvent \{Tutorial_String_1_HOPO_Free}
	endif
endscript

script Tutorial_Mode_Finish_Chord_02 
	Wait \{1
		Seconds}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
endscript

script Tutorial_Mode_Finish_Chord_03 
	Wait \{0.3
		Seconds}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
endscript

script 0x4981f67e 
	if ($winlose_sfx_loaded = 1)
		if NOT ($winlose_sfx_unique_id = NULL)
			StartPreLoadedStream \{$winlose_sfx_unique_id
				buss = Crowd_PreSong_Intro}
			Change \{winlose_sfx_loaded = 0}
		endif
	endif
endscript

script star_power_deployed_sfx_multiplayer \{the_player = 1}
	if NOT issoundplaying \{sp_deployed}
		if (<the_player> = 1)
			SoundEvent \{event = star_power_deployed_sfx_p1}
		else
			SoundEvent \{event = star_power_deployed_sfx_p2}
		endif
		Change \{star_power_deployed_flag = 1}
		Wait \{0.5
			Second}
		Change \{star_power_deployed_flag = 0}
	else
		if ($star_power_deployed_flag = 1)
			SetSoundParams \{sp_deployed
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<the_player> = 1)
				SoundEvent \{event = star_power_deployed_sfx_p1}
			else
				SoundEvent \{event = star_power_deployed_sfx_p2}
			endif
		endif
	endif
endscript

script star_power_ready_sfx_multiplayer \{which_player = 1}
	if NOT issoundplaying \{sp_available1}
		if (<which_player> = 1)
			SoundEvent \{event = star_power_ready_sfx_p1}
		else
			SoundEvent \{event = star_power_ready_sfx_p2}
		endif
		Change \{star_power_ready_flag = 1}
		Wait \{0.5
			Second}
		Change \{star_power_ready_flag = 0}
	else
		if ($star_power_ready_flag = 1)
			SetSoundParams \{sp_available1
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<which_player> = 1)
				SoundEvent \{event = star_power_ready_sfx_p1}
			else
				SoundEvent \{event = star_power_ready_sfx_p2}
			endif
		endif
	endif
endscript

script star_power_awarded_sfx_multiplayer \{Player = 1}
	if NOT issoundplaying \{sp_awarded1}
		if (<Player> = 1)
			SoundEvent \{event = star_power_awarded_sfx_p1}
		else
			SoundEvent \{event = star_power_awarded_sfx_p2}
		endif
		Change \{star_power_awarded_flag = 1}
		Wait \{0.3
			Second}
		Change \{star_power_awarded_flag = 0}
	else
		if ($star_power_awarded_flag = 1)
			stars
			stars
			SetSoundParams \{sp_awarded1
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<Player> = 1)
				SoundEvent \{event = star_power_awarded_sfx_p1}
			else
				SoundEvent \{event = star_power_awarded_sfx_p2}
			endif
		endif
	endif
endscript

script you_rock_explosion 
	PlaySound \{you_rock_explosion
		vol = 100}
endscript
