
script audio_effects_create_settings_by_venue 
	if GetPakManCurrentName \{map = zones}
		formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	endif
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		printf \{channel = sfx
			qs(0x9733853e)}
		printf \{channel = sfx
			qs(0x9733853e)}
		printf \{channel = sfx
			qs(0x9733853e)}
		printf \{channel = sfx
			qs(0x9733853e)}
		printf \{channel = sfx
			qs(0x9733853e)}
		printf \{channel = sfx
			qs(0x9733853e)}
		printf \{channel = sfx
			qs(0x9733853e)}
		venuesize = 'nothing'
	endif
	printf channel = sfx qs(0xfb84a2a3) s = <venuesize>
	switch <venuesize>
		case 'Large_EXT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{Name = venueverb $large_ext_reverb}]
		case 'Large_INT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{Name = venueverb $large_int_reverb}]
		case 'Medium_INT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{Name = venueverb $medium_int_reverb}]
		case 'Medium_EXT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{Name = venueverb $medium_ext_reverb}]
		case 'Small_INT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{Name = venueverb $small_int_reverb}]
		case 'Small_EXT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{Name = venueverb $small_ext_reverb}]
		default
		printf \{channel = sfx
			qs(0x79963774)}
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{Name = venueverb $medium_int_reverb}]
	endswitch
	setdspeffectparams \{effects = [
			{
				effect = sfxreverb
				Name = venueverb
				speakermask = [
					1
					1
					1
					0
					1
					1
					1
					1
				]
			}
		]}
endscript

script audio_master_sfx_adding_sound_busses 
	CreateBussSystem \{$BussTree}
	setsoundbussparams \{$default_BussSet}
	setsoundbussparams \{$default_BussSet
		time = 0.5}
	SoundBussLock \{Master}
	SoundBussLock \{user_vocals}
	SoundBussLock \{user_drums}
	SoundBussLock \{User_Guitar}
	SoundBussLock \{user_bass}
	SoundBussLock \{user_rhythmgtr}
	SoundBussLock \{user_crowd}
	SoundBussLock \{User_SFX}
	SoundBussLock \{User_Band}
	SoundBussLock \{user_crowdsingalong}
	SoundBussLock \{user_misc}
endscript

script audio_play_character_powers_sfx \{character = qs(0x41113d82)
		power = NULL
		lvl = 0}
	gamemode_gettype
	GetPakManCurrentName \{map = zones}
	if (<Type> = career)
		if (<pakname> = 'z_modular')
			if (<power> = lightningboltright)
				SoundEvent \{event = audio_powers_generic_electricity_bolt_right_softer}
			elseif (<power> = lightningboltleft)
				SoundEvent \{event = audio_powers_generic_electricity_bolt_left_softer}
			elseif (<power> = lightningbolt)
				SoundEvent \{event = audio_powers_generic_electricity_bolt_softer}
			endif
			if (<character> = qs(0x6a66ae57))
				if (<lvl> = 1)
					SoundEvent \{event = audio_powers_johnny_power_lvl_1_softer}
				else (<lvl> = 2)
					SoundEvent \{event = audio_powers_johnny_power_lvl_2_softer}
				endif
			elseif (<character> = qs(0x5d2b4ed3))
				SoundEvent \{event = audio_powers_axel_power_lvl_1_softer}
			elseif (<character> = qs(0x33d6c02a))
				if (<lvl> = 1)
					SoundEvent \{event = endofsong_camera_cheer_quiet}
					SoundEvent \{event = audio_powers_judy_power_lvl_1_softer}
				else (<lvl> = 2)
					SoundEvent \{event = endofsong_camera_cheer_quiet}
					SoundEvent \{event = audio_powers_judy_power_lvl_2_softer}
				endif
			elseif (<character> = qs(0xe26369e9))
				if (<lvl> = 1)
					SoundEvent \{event = audio_powers_lars_power_lvl_1_softer}
				else (<lvl> = 2)
					SoundEvent \{event = audio_powers_lars_power_lvl_2_softer}
				endif
			elseif (<character> = qs(0x6545783e))
				if issoundplaying \{star_deployed_front}
					SetSoundParams \{star_deployed_front
						vol = -15.5}
					if (<lvl> = 1)
						SoundEvent \{event = audio_powers_pandora_power_lvl_1}
						SetSoundParams \{powers_pandora_power_lvl_1
							vol = -9}
					else (<lvl> = 2)
						SoundEvent \{event = audio_powers_pandora_power_lvl_2}
						SetSoundParams \{powers_pandora_power_lvl_2
							vol = -6}
					endif
				else
					if (<lvl> = 1)
						SoundEvent \{event = audio_powers_pandora_power_lvl_1_softer}
					else (<lvl> = 2)
						SoundEvent \{event = audio_powers_pandora_power_lvl_2_softer}
					endif
				endif
			endif
			return
		endif
	endif
	if (<power> = lightningboltright)
		SoundEvent \{event = audio_powers_generic_electricity_bolt_right}
	elseif (<power> = lightningboltleft)
		SoundEvent \{event = audio_powers_generic_electricity_bolt_left}
	elseif (<power> = lightningbolt)
		SoundEvent \{event = audio_powers_generic_electricity_bolt}
	endif
	if (<character> = qs(0x6a66ae57))
		if (<lvl> = 1)
			SoundEvent \{event = audio_powers_johnny_power_lvl_1}
		else (<lvl> = 2)
			SoundEvent \{event = audio_powers_johnny_power_lvl_2}
		endif
	elseif (<character> = qs(0x5d2b4ed3))
		SoundEvent \{event = audio_powers_axel_power_lvl_1}
	elseif (<character> = qs(0x33d6c02a))
		if (<lvl> = 1)
			SoundEvent \{event = endofsong_camera_cheer}
			SoundEvent \{event = audio_powers_judy_power_lvl_1}
		else (<lvl> = 2)
			SoundEvent \{event = endofsong_camera_cheer}
			SoundEvent \{event = audio_powers_judy_power_lvl_2}
		endif
	elseif (<character> = qs(0xe26369e9))
		if (<lvl> = 1)
			SoundEvent \{event = audio_powers_lars_power_lvl_1}
		else (<lvl> = 2)
			SoundEvent \{event = audio_powers_lars_power_lvl_2}
		endif
	elseif (<character> = qs(0x6545783e))
		Wait \{2
			gameframes}
		if issoundplaying \{star_deployed_front}
			SetSoundParams \{star_deployed_front
				vol = -15.5}
			if (<lvl> = 1)
				SoundEvent \{event = audio_powers_pandora_power_lvl_1}
				SetSoundParams \{powers_pandora_power_lvl_1
					vol = -9}
			else (<lvl> = 2)
				SoundEvent \{event = audio_powers_pandora_power_lvl_2}
				SetSoundParams \{powers_pandora_power_lvl_2
					vol = -6}
			endif
		else
			if (<lvl> = 1)
				SoundEvent \{event = audio_powers_pandora_power_lvl_1}
			else (<lvl> = 2)
				SoundEvent \{event = audio_powers_pandora_power_lvl_2}
			endif
		endif
	endif
endscript

script audio_gameplay_star_power_verb_on 
	printf \{channel = sfx
		qs(0x9861e19e)}
	getplayerinfo <Player> part
	GetPakManCurrentName \{map = zones}
	printf channel = sfx qs(0xbaecfbed) s = <Player>
	if ($g_star_power_verb_is_on = 1)
		printf \{channel = sfx
			qs(0x6e477ae5)}
		if NOT isSinglePlayerGame
			printf \{channel = sfx
				qs(0x4fb8b0f8)}
			SpawnScriptNow audio_crowd_star_power_clap_panning_multiple params = {Player = <Player>}
			SpawnScriptNow audio_gameplay_star_power_deployed_logic params = {Player = <Player>}
		endif
	else
		printf \{channel = sfx
			qs(0xa3ebdd3c)}
		SpawnScriptNow audio_crowd_star_power_clap_panning params = {Player = <Player>}
		printf \{channel = sfx
			qs(0xe96a22ba)}
		Change \{g_star_power_verb_is_on = 1}
		playlist_getcurrentsong
		if isps3
			if NOT (<current_song> = jamsession)
				if isSinglePlayerGame
					SoundEvent \{event = audio_star_power_deployed_back}
					SoundEvent \{event = audio_star_power_deployed_front}
					if ($game_mode != tutorial)
						if NOT IsSoundEventPlaying \{audio_star_power_cheer_deployed}
							SoundEvent \{event = audio_star_power_cheer_deployed}
						endif
					endif
				else
					SpawnScriptNow audio_gameplay_star_power_deployed_logic params = {Player = <Player>}
				endif
			endif
		else
			if isSinglePlayerGame
				SoundEvent \{event = audio_star_power_deployed_back}
				SoundEvent \{event = audio_star_power_deployed_front}
				if ($game_mode != tutorial)
					if NOT IsSoundEventPlaying \{audio_star_power_cheer_deployed}
						SoundEvent \{event = audio_star_power_cheer_deployed}
					endif
				endif
			else
				SpawnScriptNow audio_gameplay_star_power_deployed_logic params = {Player = <Player>}
			endif
		endif
	endif
	get_song_tempo_cfunc
	oneandahalfbeats = (<beat_duration> * 1.5)
	printf channel = sfx qs(0x3d45af48) s = <oneandahalfbeats>
	if (<oneandahalfbeats> > 600)
		if (<beat_duration> > 400)
			beat_duration = (<beat_duration> / 2)
		endif
		if (<beat_duration> > 400)
			beat_duration = (<beat_duration> / 2)
		endif
		if (<beat_duration> > 400)
			beat_duration = (<beat_duration> / 2)
		endif
		if (<beat_duration> > 400)
			beat_duration = 400
		endif
	else
		beat_duration = <oneandahalfbeats>
	endif
	printf channel = sfx qs(0xa8e933a2) s = <beat_duration>
	printf \{channel = sfx
		qs(0x05b68718)}
	playlist_getcurrentsong
	switch <part>
		case guitar
		printf \{channel = sfx
			qs(0xaf3a873b)}
		if NOT (<current_song> = jamsession)
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume Player = <Player> vol = 0
			endif
		endif
		case bass
		printf \{channel = sfx
			qs(0xf7672ca5)}
		if NOT (<current_song> = jamsession)
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume Player = <Player> vol = -10
			endif
		endif
		case drum
		printf \{channel = sfx
			qs(0x45603514)}
		if NOT (<current_song> = jamsession)
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume Player = <Player> vol = -3
			endif
		endif
		case vocals
		printf \{channel = sfx
			qs(0x21a151f5)}
		vocaldspsetparams \{effect = sfxreverb
			ReverbLevel = 200
			RoomHF = 1000
			Diffusion = 1200
			DryLevel = -2000.0}
		vocaldspsetparams \{effect = echo
			Drymix = 0.0
			Wetmix = 0.5}
		default
		printf \{channel = sfx
			qs(0xacc915b2)}
	endswitch
endscript

script audio_gameplay_star_power_verb_off 
	printf \{channel = sfx
		qs(0x40a729cb)}
	if ($g_star_power_verb_is_on = 1)
	endif
	printf channel = sfx qs(0x149d7db3) s = <Player>
	SpawnScriptNow audio_crowd_end_star_clap params = {Player = <Player>}
	SpawnScriptNow \{audio_crowd_fading_claps}
	Change \{g_star_power_verb_is_on = 0}
	playlist_getcurrentsong
	if NOT (<current_song> = jamsession)
		if ($playing_song = 1)
			sap_setvenueeffectsendvolume Player = <Player> vol = -100
		endif
	endif
	getplayerinfo <Player> part
	if (<part> = vocals)
		vocaldspsetparams \{effect = sfxreverb
			ReverbLevel = -550
			RoomHF = 0
			Diffusion = 100
			DryLevel = 0.0}
		vocaldspsetparams \{effect = echo
			Drymix = 0.0
			Wetmix = 0.25}
	endif
endscript

script audio_effects_set_guitar_verb_and_echo_to_dry 
endscript

script audio_effects_change_dsp_snapshot \{time = 4
		scriptname = None}
	singalong_effect_send = -6
	singalong_buss = -3
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'nothing'
	endif
	switch <venuesize>
		case 'Large_EXT'
		<singalong_effect_send> = -1
		<singalong_buss> = -3
		case 'Large_INT'
		<singalong_effect_send> = -2
		<singalong_buss> = -3
		case 'Medium_INT'
		<singalong_effect_send> = -6
		<singalong_buss> = -3
		case 'Medium_EXT'
		<singalong_effect_send> = -6
		<singalong_buss> = -2
		case 'Small_INT'
		<singalong_effect_send> = -6.5
		<singalong_buss> = -4
		case 'Small_EXT'
		<singalong_effect_send> = -6
		<singalong_buss> = -2
		default
		<singalong_effect_send> = -6
		<singalong_buss> = -2
	endswitch
	if GotParam \{snapshot}
		switch <snapshot>
			case 'house'
			setsoundbusseffects effects = [
				{Name = kick_eq $eq_house_kick}
				{Name = kick_delay $echo_house_kick}
				{Name = snare_eq $eq_house_snare}
				{Name = snare_delay $echo_house_snare}
				{Name = cymbal_eq $eq_house_cymbal}
				{Name = guitar_compressor $compressor_house_guitar}
				{Name = guitar_eq $eq_house_guitar}
				{Name = bass_compressor $compressor_house_bass}
				{Name = bass_eq $eq_house_bass}
				{Name = vocal_eq $eq_house_vocal}
				{Name = vocal_delay $echo_house_vocal}
			] time = <time>
			Change g_current_eq_kick_gain = ($eq_house_kick.gain)
			Change g_current_delay_kick_wetmix = ($echo_house_kick.Wetmix)
			Change g_current_eq_snare_gain = ($eq_house_snare.gain)
			Change g_current_delay_snare_wetmix = ($echo_house_snare.Wetmix)
			Change g_current_eq_cymbal_gain = ($eq_house_cymbal.gain)
			Change g_current_comp_guitar_threshold = ($compressor_house_guitar.THRESHOLD)
			Change g_current_eq_guitar_gain = ($eq_house_guitar.gain)
			Change g_current_comp_bass_threshold = ($compressor_house_bass.THRESHOLD)
			Change g_current_eq_bass_gain = ($eq_house_bass.gain)
			Change g_current_eq_vocals_gain = ($eq_house_vocal.gain)
			Change g_current_delay_vocals_wetmix = ($echo_house_vocal.Wetmix)
			audio_effects_set_effects_by_venue_type params = {time = <time>}
			if GotParam \{bump_3db}
				setsoundbussparams \{$house_3db_bussset
					time = 0}
				Wait \{1
					gameframe}
				setsoundbussparams \{$house_bussset
					time = 20}
			else
				setsoundbussparams $house_bussset time = <time>
			endif
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume \{track = kick
					vol = -6}
				sap_setvenueeffectsendvolume \{track = snare
					vol = -6}
				sap_setvenueeffectsendvolume \{track = cymbal
					vol = -12}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = 0}
				sap_setvenueeffectsendvolume \{track = bass
					vol = 2}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -6}
			endif
			case 'stage'
			setsoundbusseffects effects = [
				{Name = kick_eq $eq_stage_kick}
				{Name = kick_delay $echo_stage_kick}
				{Name = snare_eq $eq_stage_snare}
				{Name = snare_delay $echo_stage_snare}
				{Name = cymbal_eq $eq_stage_cymbal}
				{Name = guitar_compressor $compressor_stage_guitar}
				{Name = guitar_eq $eq_stage_guitar}
				{Name = bass_compressor $compressor_stage_bass}
				{Name = bass_eq $eq_stage_bass}
				{Name = vocal_eq $eq_stage_vocal}
				{Name = vocal_delay $echo_stage_vocal}
			] time = <time>
			Change g_current_eq_kick_gain = ($eq_stage_kick.gain)
			Change g_current_delay_kick_wetmix = ($echo_stage_kick.Wetmix)
			Change g_current_eq_snare_gain = ($eq_stage_snare.gain)
			Change g_current_delay_snare_wetmix = ($echo_stage_snare.Wetmix)
			Change g_current_eq_cymbal_gain = ($eq_stage_cymbal.gain)
			Change g_current_comp_guitar_threshold = ($compressor_stage_guitar.THRESHOLD)
			Change g_current_eq_guitar_gain = ($eq_stage_guitar.gain)
			Change g_current_comp_bass_threshold = ($compressor_stage_bass.THRESHOLD)
			Change g_current_eq_bass_gain = ($eq_stage_bass.gain)
			Change g_current_eq_vocals_gain = ($eq_stage_vocal.gain)
			Change g_current_delay_vocals_wetmix = ($echo_stage_vocal.Wetmix)
			audio_effects_set_effects_by_venue_type params = {time = <time>}
			setsoundbussparams $stage_bussset time = <time>
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume \{track = kick
					vol = -11}
				sap_setvenueeffectsendvolume \{track = snare
					vol = -15}
				sap_setvenueeffectsendvolume \{track = cymbal
					vol = -5}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -17}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = -11}
				sap_setvenueeffectsendvolume \{track = bass
					vol = -5}
			endif
			Change \{g_current_send_vol = 2}
			case 'game'
			setsoundbusseffects effects = [
				{Name = kick_eq $eq_game_kick}
				{Name = kick_delay $echo_game_kick}
				{Name = snare_eq $eq_game_snare}
				{Name = snare_delay $echo_game_snare}
				{Name = cymbal_eq $eq_game_cymbal}
				{Name = guitar_compressor $compressor_game_guitar}
				{Name = guitar_eq $eq_game_guitar}
				{Name = bass_compressor $compressor_game_bass}
				{Name = bass_eq $eq_game_bass}
				{Name = vocal_eq $eq_game_vocal}
				{Name = vocal_delay $echo_game_vocal}
			] time = <time>
			Change g_current_eq_kick_gain = ($eq_game_kick.gain)
			Change g_current_delay_kick_wetmix = ($echo_game_kick.Wetmix)
			Change g_current_eq_snare_gain = ($eq_game_snare.gain)
			Change g_current_delay_snare_wetmix = ($echo_game_snare.Wetmix)
			Change g_current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			Change g_current_comp_guitar_threshold = ($compressor_game_guitar.THRESHOLD)
			Change g_current_eq_guitar_gain = ($eq_game_guitar.gain)
			Change g_current_comp_bass_threshold = ($compressor_game_bass.THRESHOLD)
			Change g_current_eq_bass_gain = ($eq_game_bass.gain)
			Change g_current_eq_vocals_gain = ($eq_game_vocal.gain)
			Change g_current_delay_vocals_wetmix = ($echo_game_vocal.Wetmix)
			audio_effects_set_effects_by_venue_type params = {time = <time>}
			setsoundbussparams $game_bussset time = <time>
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume \{track = kick
					vol = -100}
				sap_setvenueeffectsendvolume \{track = snare
					vol = -100}
				sap_setvenueeffectsendvolume \{track = cymbal
					vol = -100}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = -100}
				sap_setvenueeffectsendvolume \{track = bass
					vol = -100}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -100}
			endif
			Change \{g_current_send_vol = 0}
			case 'join'
			setsoundbusseffects effects = [
				{Name = kick_eq $eq_game_kick}
				{Name = kick_delay $echo_game_kick}
				{Name = snare_eq $eq_game_snare}
				{Name = snare_delay $echo_game_snare}
				{Name = cymbal_eq $eq_game_cymbal}
				{Name = guitar_compressor $compressor_game_guitar}
				{Name = guitar_eq $eq_game_guitar}
				{Name = bass_compressor $compressor_game_bass}
				{Name = bass_eq $eq_game_bass}
				{Name = vocal_eq $eq_game_vocal}
				{Name = vocal_delay $echo_game_vocal}
			] time = <time>
			Change g_current_eq_kick_gain = ($eq_game_kick.gain)
			Change g_current_delay_kick_wetmix = ($echo_game_kick.Wetmix)
			Change g_current_eq_snare_gain = ($eq_game_snare.gain)
			Change g_current_delay_snare_wetmix = ($echo_game_snare.Wetmix)
			Change g_current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			Change g_current_comp_guitar_threshold = ($compressor_game_guitar.THRESHOLD)
			Change g_current_eq_guitar_gain = ($eq_game_guitar.gain)
			Change g_current_comp_bass_threshold = ($compressor_game_bass.THRESHOLD)
			Change g_current_eq_bass_gain = ($eq_game_bass.gain)
			Change g_current_eq_vocals_gain = ($eq_game_vocal.gain)
			Change g_current_delay_vocals_wetmix = ($echo_game_vocal.Wetmix)
			setsoundbussparams $join_bussset time = <time>
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume \{track = kick
					vol = -15}
				sap_setvenueeffectsendvolume \{track = snare
					vol = -15}
				sap_setvenueeffectsendvolume \{track = cymbal
					vol = -6}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -15}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = -15}
				sap_setvenueeffectsendvolume \{track = bass
					vol = -6}
			endif
			Change \{g_current_send_vol = 2}
			case 'pause'
			setsoundbusseffects effects = [
				{Name = kick_eq $eq_game_kick}
				{Name = kick_delay $echo_game_kick}
				{Name = snare_eq $eq_game_snare}
				{Name = snare_delay $echo_game_snare}
				{Name = cymbal_eq $eq_game_cymbal}
				{Name = guitar_compressor $compressor_game_guitar}
				{Name = guitar_eq $eq_game_guitar}
				{Name = bass_compressor $compressor_game_bass}
				{Name = bass_eq $eq_game_bass}
				{Name = vocal_eq $eq_game_vocal}
				{Name = vocal_delay $echo_game_vocal}
			] time = <time>
			Change g_current_eq_kick_gain = ($eq_game_kick.gain)
			Change g_current_delay_kick_wetmix = ($echo_game_kick.Wetmix)
			Change g_current_eq_snare_gain = ($eq_game_snare.gain)
			Change g_current_delay_snare_wetmix = ($echo_game_snare.Wetmix)
			Change g_current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			Change g_current_comp_guitar_threshold = ($compressor_game_guitar.THRESHOLD)
			Change g_current_eq_guitar_gain = ($eq_game_guitar.gain)
			Change g_current_comp_bass_threshold = ($compressor_game_bass.THRESHOLD)
			Change g_current_eq_bass_gain = ($eq_game_bass.gain)
			Change g_current_eq_vocals_gain = ($eq_game_vocal.gain)
			Change g_current_delay_vocals_wetmix = ($echo_game_vocal.Wetmix)
			setsoundbussparams $pause_bussset time = <time>
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume \{track = kick
					vol = -100}
				sap_setvenueeffectsendvolume \{track = snare
					vol = -100}
				sap_setvenueeffectsendvolume \{track = cymbal
					vol = -100}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = -100}
				sap_setvenueeffectsendvolume \{track = bass
					vol = -100}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -100}
			endif
			Change \{g_current_send_vol = 2}
			default
		endswitch
	endif
endscript

script audio_crowd_setup_based_on_zone 
	venuesize = 'Medium_EXT'
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'Medium_EXT'
	endif
	printf channel = sfx qs(0x1425fcec) s = <venuesize>
	switch <venuesize>
		case 'Large_EXT'
		venuetype = 'LG'
		case 'Large_INT'
		venuetype = 'LG'
		case 'Medium_INT'
		venuetype = 'MD'
		case 'Medium_EXT'
		venuetype = 'MD'
		case 'Small_INT'
		venuetype = 'SM'
		case 'Small_EXT'
		venuetype = 'SM'
		default
		venuetype = 'MD'
	endswitch
	switch <venuesize>
		case 'Small_INT'
		newvenuesize = 'SM_INT'
		case 'Small_EXT'
		newvenuesize = 'SM_EXT'
		case 'Medium_INT'
		newvenuesize = 'MD_INT'
		case 'Medium_EXT'
		newvenuesize = 'MD_EXT'
		case 'Large_INT'
		newvenuesize = 'LG_INT'
		case 'Large_EXT'
		newvenuesize = 'LG_EXT'
		default
		printf \{qs(0xd177cb8d)}
		newvenuesize = 'MD_INT'
	endswitch
	formatText checksumName = whistletemp 'Audio_Crowd_%s_Whistle_Positive' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_whistle_soundevent = <whistletemp>
	formatText checksumName = oneshotgoodtemp 'Audio_Crowd_%s_OneShot_Positive' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_oneshot_positive_soundevent = <oneshotgoodtemp>
	formatText checksumName = oneshotbadtemp 'Audio_Crowd_%s_OneShot_Negative' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_oneshot_negative_soundevent = <oneshotbadtemp>
	formatText checksumName = loopgoodtemp 'Crowd_Loop_%s_Good' s = <venuesize> AddToStringLookup = true
	Change g_current_crowd_looping_bg_area_good = <loopgoodtemp>
	formatText checksumName = loopneutraltemp 'Crowd_Loop_%s_Neutral' s = <venuesize> AddToStringLookup = true
	Change g_current_crowd_looping_bg_area_neutral = <loopneutraltemp>
	formatText checksumName = loopbadtemp 'Crowd_Loop_%s_Bad' s = <venuesize> AddToStringLookup = true
	Change g_current_crowd_looping_bg_area_bad = <loopbadtemp>
	crowdtransitionchecksum = crowd_transition
	formatText checksumName = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Normal' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_clap_normal_soundevent = <claptemp>
	formatText checksumName = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Middle' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_clap_middle_soundevent = <claptemp>
	formatText checksumName = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Left_Middle' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_clap_left_middle_soundevent = <claptemp>
	formatText checksumName = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Right_Middle' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_clap_right_middle_soundevent = <claptemp>
	formatText checksumName = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Left' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_clap_left_soundevent = <claptemp>
	formatText checksumName = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Right' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_clap_right_soundevent = <claptemp>
	formatText checksumName = transitiontemp '%s_Crowd_Negative_To_Neutral' s = <venuetype> AddToStringLookup = true
	Change g_current_crowd_transition_negative_to_neutral = <transitiontemp>
	formatText checksumName = transitiontemp '%s_Crowd_Neutral_To_Negative' s = <venuetype> AddToStringLookup = true
	Change g_current_crowd_transition_neutral_to_negative = <transitiontemp>
	formatText checksumName = transitiontemp '%s_Crowd_Neutral_To_Positive' s = <venuetype> AddToStringLookup = true
	Change g_current_crowd_transition_neutral_to_positive = <transitiontemp>
	formatText checksumName = transitiontemp '%s_Crowd_Positive_To_Neutral' s = <venuetype> AddToStringLookup = true
	Change g_current_crowd_transition_positive_to_neutral = <transitiontemp>
	formatText checksumName = swelltemp 'Audio_Crowd_%s_Swell_Short' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_swell_short_soundevent = <swelltemp>
	formatText checksumName = swelltemp 'Audio_Crowd_%s_Swell_Short_Soft' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_swell_short_soft_soundevent = <swelltemp>
	formatText checksumName = swelltemp 'Audio_Crowd_%s_Swell_Med' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_swell_med_soundevent = <swelltemp>
	formatText checksumName = swelltemp 'Audio_Crowd_%s_Swell_Long' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_swell_long_soundevent = <swelltemp>
	formatText checksumName = encoretemp 'Audio_Crowd_%s_Encore' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_encore = <encoretemp>
	formatText checksumName = anticipationtemp '%s_Crowd_Anticipation_Loop' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_anticipation = <anticipationtemp>
	formatText checksumName = applausetemp 'Audio_Crowd_%s_Applause' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_applause_soundevent = <applausetemp>
	formatText checksumName = introtemp 'Audio_Crowd_%s_Venue_Intro' s = <pakname> AddToStringLookup = true
	Change g_current_crowd_venue_intro_soundevent = <introtemp>
	formatText checksumName = preencoretemp 'Audio_Crowd_%s_PreEncore_Looping' s = <newvenuesize> AddToStringLookup = true
	Change g_current_crowd_preencore_looping_soundevent = <preencoretemp>
	formatText checksumName = tempvenuesize '%s' s = <newvenuesize> AddToStringLookup = true
	Change g_current_venue_size = <tempvenuesize>
	if ((<pakname> = 'z_mansionstudio') || (<pakname> = 'z_modular') || (<pakname> = 'z_credits') || (<pakname> = 'z_visualizer') || (<pakname> = 'z_finalbattle') || (<pakname> = 'z_cube'))
		Change \{g_current_crowd_looping_bg_area_bad = FrontEnd}
		Change \{g_current_crowd_looping_bg_area_neutral = FrontEnd}
		Change \{g_current_crowd_looping_bg_area_good = FrontEnd}
		Change \{g_current_crowd_looping_bg_area = FrontEnd}
	endif
	printf \{channel = sfx
		qs(0xfba306ee)}
	printf \{channel = sfx
		qs(0xeccb29cc)
		s = $g_current_crowd_whistle_soundevent}
	printf \{channel = sfx
		qs(0x85882829)
		s = $g_current_crowd_oneshot_positive_soundevent}
	printf \{channel = sfx
		qs(0x8a385de2)
		s = $g_current_crowd_oneshot_negative_soundevent}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0xaf9bfc58)
		s = $g_current_crowd_looping_bg_area_bad}
	printf \{channel = sfx
		qs(0x54170d2b)
		s = $g_current_crowd_looping_bg_area_neutral}
	printf \{channel = sfx
		qs(0xf11b2384)
		s = $g_current_crowd_looping_bg_area_good}
	printf \{channel = sfx
		qs(0xd945db33)
		s = $g_current_crowd_looping_bg_area}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0x15f8409d)
		s = $g_current_crowd_transition_negative_to_neutral}
	printf \{channel = sfx
		qs(0x54acd4de)
		s = $g_current_crowd_transition_neutral_to_negative}
	printf \{channel = sfx
		qs(0xf7b280e9)
		s = $g_current_crowd_transition_neutral_to_positive}
	printf \{channel = sfx
		qs(0x1a483556)
		s = $g_current_crowd_transition_positive_to_neutral}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0x0fe88cfb)
		s = $g_current_crowd_swell_short_soundevent}
	printf \{channel = sfx
		qs(0x0e6f2362)
		s = $g_current_crowd_swell_med_soundevent}
	printf \{channel = sfx
		qs(0xfdc2c70b)
		s = $g_current_crowd_swell_long_soundevent}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0x8c5aa2d1)
		s = $g_current_crowd_applause_soundevent}
	printf \{channel = sfx
		qs(0xfba306ee)}
endscript

script audio_crowd_event_listener 
	if NOT ($g_crowd_in_jam_mode_song_state = 1)
		GetPakManCurrent \{map = zones}
		if GotParam \{pak}
		endif
		if (<pak> != z_studio && <pak> != z_tool && <pak> != z_credits)
			GetPakManCurrentName \{map = zones}
			if (($game_mode != practice) && (<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
				if GotParam \{event_type}
					switch <event_type>
						case 1
						if ($g_turn_off_oneshot_cheers = 0)
							audio_crowd_play_short_swell_for_this_venue
						endif
						Crowd_AllPlayAnim \{anim = swellsh
							playonce = true}
						case 2
						if ($g_turn_off_oneshot_cheers = 0)
							audio_crowd_play_applause_for_this_venue
						endif
						case 3
						if ($current_crowd >= 1.3333)
							if ($g_turn_off_oneshot_cheers = 0)
								audio_crowd_surge_and_sustain_at_end_of_song
							endif
						endif
						case 4
						audio_crowd_play_whistle_based_on_venue
						case 5
						if ($current_crowd >= 1.3333)
							audio_crowd_adjust_fast_small_surge
						endif
						case 6
						if ($current_crowd >= 1.3333)
							if ($g_turn_off_oneshot_cheers = 0)
								audio_crowd_play_short_swell_for_this_venue_softer
							endif
							audio_crowd_adjust_fast_big_surge
						endif
						Crowd_AllPlayAnim \{anim = swellsh
							playonce = true}
						case 7
						if ($current_crowd >= 1.3333)
							if ($g_turn_off_oneshot_cheers = 0)
								audio_crowd_play_med_swell_for_this_venue
							endif
							audio_crowd_adjust_med_surge
						endif
						Crowd_AllPlayAnim \{anim = swellmd
							playonce = true}
						case 8
						if ($current_crowd >= 1.3333)
							if ($g_turn_off_oneshot_cheers = 0)
								audio_crowd_play_long_swell_for_this_venue
							endif
							audio_crowd_adjust_slow_big_surge
						endif
						Crowd_AllPlayAnim \{anim = swelllg
							playonce = true}
						case 9
						printf \{'Not Working Right Now'}
						case 10
						audio_effects_song_quiet_start_adjust_all_sfx_down
						case 11
						audio_effects_song_quiet_over_adjust_all_sfx_to_normal
						case 12
						audio_crowd_moment_on_stage_reaction_sfx
						default
						printf \{channel = sfx
							qs(0x3c088a0f)}
					endswitch
				endif
			endif
		else
			printf \{channel = sfx
				qs(0xa2c245d8)}
		endif
	else
		printf \{channel = sfx
			qs(0xe737e2b8)}
	endif
endscript

script audio_crowd_play_whistle_based_on_venue 
	SoundEvent \{event = $g_current_crowd_whistle_soundevent}
endscript

script audio_crowd_play_short_swell_for_this_venue 
	printf \{channel = sfx
		qs(0x32f04896)
		s = $g_current_crowd_swell_short_soundevent}
	SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
	Crowd_AllPlayAnim \{anim = swellsh
		playonce = true}
endscript

script audio_crowd_play_short_swell_for_this_venue_softer 
	SoundEvent \{event = $g_current_crowd_swell_short_soft_soundevent}
	Crowd_AllPlayAnim \{anim = swellsh
		playonce = true}
endscript

script audio_crowd_play_med_swell_for_this_venue 
	SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
	Crowd_AllPlayAnim \{anim = swellmd
		playonce = true}
endscript

script audio_crowd_play_long_swell_for_this_venue 
	SoundEvent \{event = $g_current_crowd_swell_long_soundevent}
	Crowd_AllPlayAnim \{anim = swelllg
		playonce = true}
endscript

script audio_crowd_play_applause_for_this_venue 
	SoundEvent \{event = $g_current_crowd_applause_soundevent}
endscript

script audio_crowd_adjust_loop_to_default \{restarting = 0
		Normal = 0
		time = 1.5}
	if ($current_playing_transition = loading)
	else
		if (<restarting> = 1)
			if GotParam \{time}
				setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0} time = <time>}
			else
				setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0} time = <time>}
			endif
		else
			if (<Normal> = 1)
				if GotParam \{time}
					setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0} time = <time>}
				else
					setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0} time = <time>}
				endif
			else
			endif
		endif
	endif
endscript

script audio_crowd_adjust_fast_small_surge 
	if GotParam \{pak}
		printf channel = sfx qs(0x454351a7) s = <pak>
	endif
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 10)} time = 0.08}
	Wait \{1.5
		Seconds}
	audio_crowd_adjust_loop_to_default \{time = 4
		Normal = 1}
endscript

script audio_crowd_adjust_fast_big_surge 
	if GotParam \{pak}
	endif
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 10)} time = 0.08}
	Wait \{1.5
		Seconds}
	audio_crowd_adjust_loop_to_default \{time = 4
		Normal = 1}
endscript

script audio_crowd_adjust_med_surge 
	if GotParam \{pak}
		printf channel = sfx qs(0xb758ec23) s = <pak>
	endif
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 10)} time = 2}
	Wait \{4
		Seconds}
	audio_crowd_adjust_loop_to_default \{time = 4
		Normal = 1}
endscript

script audio_crowd_adjust_slow_big_surge 
	if GotParam \{pak}
		printf channel = sfx qs(0x843fe62e) s = <pak>
	endif
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 10)} time = 3}
	Wait \{8
		Seconds}
	audio_crowd_adjust_loop_to_default \{time = 4
		Normal = 1}
endscript

script audio_effects_song_quiet_start_adjust_all_sfx_down \{sfxbalancetime = 4
		crowdbalancetime = 8
		sfxvolsub = 4.0
		crowdvolsub = 5.0}
	gamemode_gettype
	printf \{channel = sfx
		qs(0xfa5455b6)}
	setsoundbussparams {sfx_balance = {vol = (($default_BussSet.sfx_balance.vol) - <sfxvolsub>)} time = <sfxbalancetime>}
	setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol) - <crowdvolsub>)} time = <crowdbalancetime>}
endscript

script audio_effects_song_quiet_over_adjust_all_sfx_to_normal \{sfxbalancetime = 8
		crowdbalancetime = 4}
	gamemode_gettype
	printf \{channel = sfx
		qs(0x1c6b884d)}
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)} time = <sfxbalancetime>}
	setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)} time = <crowdbalancetime>}
endscript

script audio_effects_song_quiet_reset_sfx_balance \{loading_transition = 0
		restarting = 0}
	if (<loading_transition> = 1)
	else
		if (<restarting> = 1)
			printf \{channel = sfx
				qs(0x929376d7)}
			printf \{channel = sfx
				qs(0xd75ad5d0)}
			setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)}}
			setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)}}
		else
			printf \{channel = sfx
				qs(0x58c63f4c)}
			Change \{g_crowd_transition_start_of_song_normal = 1}
			printf \{channel = sfx
				qs(0x30d83413)}
		endif
	endif
endscript

script audio_crowd_moment_on_stage_reaction_sfx 
endscript

script audio_crowd_surge_and_sustain_at_end_of_song 
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 4)} time = 3.5}
endscript

script Crowd_Singalong_Volume_Up 
	printf \{channel = sfx
		qs(0x48c0a678)}
endscript

script Crowd_Singalong_Volume_Down 
	printf \{channel = sfx
		qs(0xb11ef720)}
endscript

script Change_Crowd_Looping_SFX \{crowd_looping_state = good
		Player = 1
		loading_transition = 0
		restarting = 0}
	Wait \{1
		gameframe}
	if NOT ui_event_exists_in_stack \{Name = 'gameplay'}
		crowd_looping_state = good
	endif
	gamemode_gettype
	if (<Type> = competitive)
		crowd_looping_state = good
	endif
	audio_crowd_do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state> loading_transition = <loading_transition> restarting = <restarting>
endscript

script audio_crowd_do_actual_changing_of_looping_sound \{loading_transition = 0
		restarting = 0}
	if GotParam \{crowd_looping_state}
		GetPakManCurrent \{map = zones}
		switch <crowd_looping_state>
			case bad
			new_bg_area = $g_current_crowd_looping_bg_area_bad
			new_oneshots = $g_current_crowd_oneshot_negative_soundevent
			case neutral
			new_bg_area = $g_current_crowd_looping_bg_area_neutral
			new_oneshots = $g_current_crowd_oneshot_positive_soundevent
			case good
			new_bg_area = $g_current_crowd_looping_bg_area_good
			new_oneshots = $g_current_crowd_oneshot_positive_soundevent
			default
			printf \{channel = sfx
				qs(0xae489741)}
			new_bg_area = $g_current_crowd_looping_bg_area_good
			new_oneshots = $g_current_crowd_oneshot_positive_soundevent
		endswitch
	else
		printf \{channel = sfx
			qs(0x5b438be7)}
		return
	endif
	GetPakManCurrentName \{map = zones}
	if (($g_crowd_in_jam_mode_song_state = 1) || ($calibrate_lag_enabled = 1) || (<pakname> = 'z_mansionstudio') || (<pakname> = 'z_modular') || (<pakname> = 'z_credits') || (<pakname> = 'z_visualizer') || (<pakname> = 'z_finalbattle') || (<pakname> = 'z_cube'))
		new_oneshots = audio_crowd_oneshots_do_nothing
	endif
	if ($calibrate_lag_enabled = 0)
		sfx_backgrounds_new_area BG_SFX_Area = <new_bg_area> loading_transition = <loading_transition> restarting = <restarting>
	else
		sfx_backgrounds_new_area BG_SFX_Area = FrontEnd loading_transition = <loading_transition> restarting = <restarting>
	endif
	if ($movie_on_first_freeplay = 1)
		One_Shot_SoundEvent SoundEvent = <new_oneshots> waitTime = 5
	endif
endscript

script audio_crowd_silence_front_end \{immediate = 0}
	sfx_backgrounds_new_area BG_SFX_Area = FrontEnd immediate = <immediate>
	One_Shot_SoundEvent SoundEvent = audio_crowd_oneshots_do_nothing waitTime = 5 immediate = <immediate>
endscript

script audio_crowd_generic_transition \{state = neutral_to_positive}
	audio_crowd_play_transition state = <state> left = 1 right = 1
endscript

script audio_crowd_play_transition 
	setspawnedscriptnorepeatfor \{time = 0.1}
	SetSpawnInstanceLimits \{Max = 2
		management = ignore_spawn_request}
	Volume = 0
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'nothing'
	endif
	if GotParam \{state}
		switch <state>
			case negative_to_neutral
			stopsound \{$g_current_crowd_transition_neutral_to_negative
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $g_current_crowd_transition_negative_to_neutral
			printf \{channel = sfx
				qs(0x82b1060b)
				t = $g_current_crowd_transition_negative_to_neutral}
			if ((<venuesize> = 'Large_EXT') || (<venuesize> = 'Large_INT'))
				Volume = 11
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				Volume = 8
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				Volume = 6
			endif
			case neutral_to_positive
			stopsound \{$g_current_crowd_transition_positive_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $g_current_crowd_transition_neutral_to_positive
			if (<venuesize> = 'Large_EXT')
				Volume = 1.5
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				Volume = 6
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				Volume = 2
			endif
			case positive_to_neutral
			stopsound \{$g_current_crowd_transition_neutral_to_positive
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $g_current_crowd_transition_positive_to_neutral
			if (<venuesize> = 'Large_EXT')
				Volume = 3
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				Volume = 0.5
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				Volume = 1.5
			endif
			case neutral_to_negative
			stopsound \{$g_current_crowd_transition_negative_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $g_current_crowd_transition_neutral_to_negative
			if (<venuesize> = 'Large_EXT')
				Volume = 5
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				Volume = 0
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				Volume = 3
			endif
			case med_to_good
			printf \{qs(0x51243726)}
			stopsound \{$g_current_crowd_transition_positive_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $g_current_crowd_transition_neutral_to_positive
			default
			printf \{qs(0x2e6cd3cd)}
		endswitch
		Wait \{1
			gameframe}
		if GotParam \{left}
			if GotParam \{right}
				audio_gameplay_multiplayer_get_sfx_pan_values \{crowd_meter_transition
					wide}
				PlaySound <transitionevent> vol = <Volume> buss = Crowd_Transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
				audio_gameplay_multiplayer_get_sfx_pan_values \{crowd_meter_transition
					left}
				PlaySound <transitionevent> buss = Crowd_Transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		else
			if GotParam \{right}
				audio_gameplay_multiplayer_get_sfx_pan_values \{crowd_meter_transition
					right}
				PlaySound <transitionevent> buss = Crowd_Transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
			endif
		endif
	endif
endscript

script crowd_transition_sfx_negative_to_neutral 
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x3da6f454)}
		audio_crowd_generic_transition state = negative_to_neutral Player = <Player>
	endif
endscript

script crowd_transition_sfx_neutral_to_positive 
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x7ba459ad)}
		audio_crowd_generic_transition state = neutral_to_positive Player = <Player>
	endif
endscript

script crowd_transition_sfx_neutral_to_negative 
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x73ffdd74)}
		audio_crowd_generic_transition state = neutral_to_negative Player = <Player>
	endif
endscript

script crowd_transition_sfx_positive_to_neutral 
	audio_crowd_adjust_loop_to_default \{time = 1
		Normal = 1}
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x713e8a0b)}
		audio_crowd_generic_transition state = positive_to_neutral Player = <Player>
	endif
endscript

script audio_ui_menu_music_on 
	menu_music_on <...>
endscript

script menu_music_on 
	SpawnScriptNow audio_ui_menu_music_on_spawned params = {<...>}
endscript

script audio_ui_menu_music_on_spawned 
	if ($g_menu_music_on_flag = 1)
		return
	else
		Change \{g_menu_music_on_flag = 1}
		Change \{g_menu_music_ambient_hack = 1}
	endif
	if GotParam \{waitforguitarlick}
		Wait \{4
			Seconds}
	endif
	printf \{channel = sfx
		qs(0xf5814c6c)}
	EnableUserMusic
	begin
	SpawnScriptNow \{audio_ui_menu_music_se}
	if ($g_menu_music_pan_right = 1)
		SetSoundParams \{$g_current_menu_song
			pan1x = -1
			pan1y = 1
			pan2x = -0.4
			pan2y = 1}
	endif
	printf \{channel = sfx
		qs(0x9dccc65f)}
	sfx_backgrounds_new_area \{BG_SFX_Area = FrontEnd
		fadeintime = 2.0
		fadeintype = linear
		fadeouttime = 2
		fadeouttype = linear}
	One_Shot_SoundEvent SoundEvent = audio_crowd_oneshots_do_nothing waitTime = 5 immediate = <immediate>
	Wait \{2
		Seconds}
	audio_ui_menu_music_checks
	Wait \{1
		Second}
	repeat
endscript

script audio_ui_menu_music_change_pan_and_vol 
	if (issoundplaying $g_current_menu_song)
		if GotParam \{panandlowervol}
			Wait \{0.5
				Seconds}
			setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) - 2.4)} time = 4}
		else
			if GotParam \{reset}
				Wait \{0.5
					Seconds}
				setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 4}
			endif
		endif
	endif
endscript

script audio_ui_menu_music_checks 
	begin
	if ($g_menu_music_preloading = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	begin
	Wait \{1
		Second}
	if NOT (issoundplaying $g_menu_music_stream)
		break
	else
	endif
	repeat
endscript

script audio_ui_menu_music_off 
	printf \{channel = sfx
		qs(0x712dd3b4)}
	disableusermusic
	KillSpawnedScript \{Name = audio_ui_menu_music_on}
	KillSpawnedScript \{Name = audio_ui_menu_music_on_spawned}
	Change \{g_menu_music_on_flag = 0}
	audio_ui_kill_menu_music
endscript

script audio_ui_fade_menu_music \{Wait = 0
		Volume = 100
		time = 0}
	Wait <Wait> Seconds
	if GotParam \{out}
		if (time = 0)
			<time> = 0.7
		endif
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) - <Volume>)} time = <time>}
		if NOT GotParam \{dont_fade_crowd}
			setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) - <Volume>)} time = <time>}
		endif
	else
		if GotParam \{in}
			setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = <time>}
			setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = <time>}
			printf \{channel = sfx
				qs(0xc856a506)}
			sfx_backgrounds_new_area \{BG_SFX_Area = FrontEnd
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 2
				fadeouttype = linear}
			One_Shot_SoundEvent SoundEvent = audio_crowd_oneshots_do_nothing waitTime = 5 immediate = <immediate>
		else
			printf \{channel = sfx
				qs(0x876d718a)}
		endif
	endif
endscript

script audio_gameplay_multiplayer_get_sfx_pan_values \{vocalist = 0}
	pan1x = -1
	pan1y = 1
	pan2x = 1
	pan2y = 1
	if GotParam \{crowd_meter_transition}
		if GotParam \{left}
			<pan1x> = -1
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif GotParam \{right}
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 1
			<pan2y> = 1
		elseif GotParam \{wide}
			<pan1x> = -1
			<pan1y> = 1
			<pan2x> = 1
			<pan2y> = 1
		endif
	elseif (<vocalist> = 1)
		<pan1x> = -0.25
		<pan1y> = 1
		<pan2x> = 0.25
		<pan2y> = 1
	else
		if GotParam \{Player}
			getplayerinfo <Player> highway_position
			if (<highway_position> = left)
				<pan1x> = -1
				<pan1y> = 1
				<pan2x> = -0.75
				<pan2y> = 1
			elseif (<highway_position> = leftcenter)
				<pan1x> = -1.0
				<pan1y> = 1
				<pan2x> = 0.25
				<pan2y> = 1
			elseif (<highway_position> = center)
				<pan1x> = -1
				<pan1y> = 1
				<pan2x> = 1
				<pan2y> = 1
			elseif (<highway_position> = rightcenter)
				<pan1x> = -0.25
				<pan1y> = 1
				<pan2x> = 1
				<pan2y> = 1
			elseif (<highway_position> = right)
				<pan1x> = 0.75
				<pan1y> = 1
				<pan2x> = 1
				<pan2y> = 1
			endif
		else
			printf \{channel = sfx
				qs(0xaf1934a4)}
		endif
	endif
	return <...>
endscript

script audio_ui_freeplay_play_sfx 
	getplayerinfo <Player> part
	audio_gameplay_multiplayer_get_sfx_pan_values Player = <Player>
	switch <Type>
		case Jump
		PlaySound freeplay_enter_sfx vol = -4 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x676c844f)}
		case start
		PlaySound freeplay_enter_sfx vol = -4 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x896c91fb)}
		case select
		PlaySound generic_select vol = -3 pitch = 4 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x0ae2d889)}
		case instrument
		PlaySound generic_select vol = -3 pitch = 4 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xf7571e78)}
		case up
		PlaySound generic_scroll vol = -12 pitch = 0 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xcac0cdfe)}
		case down
		PlaySound generic_scroll vol = -12 pitch = 0 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xafc32f0f)}
		case drop
		PlaySound freeplay_drop_sfx vol = -4.5 pitch = 1 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x43aa5374)}
		case back
		SoundEvent \{event = audio_ui_generic_back}
		printf \{channel = sfx
			qs(0xfa648a70)}
		case Default
		printf \{channel = sfx
			qs(0x30b3405c)}
	endswitch
endscript

script audio_effects_reset_to_current_snapshot 
	audio_effects_change_dsp_snapshot \{snapshot = $g_current_music_dsp_snapshot_setting
		time = 3.0
		scriptname = audio_effects_reset_to_current_snapshot}
endscript

script audio_freeplay_music_and_crowd_transitions 
	if GotParam \{transition}
		switch <transition>
			case 'Start_Of_Game_Setup_Immediate'
			Change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 0.0}
			setsoundbussparams \{$music_stream_quiet_bussset
				time = 0.0}
			setsoundbussparams \{$start_of_game_crowds_silence_bussset
				time = 0.0}
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume \{track = kick
					vol = -100}
				sap_setvenueeffectsendvolume \{track = snare
					vol = -100}
				sap_setvenueeffectsendvolume \{track = cymbal
					vol = -100}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = -100}
				sap_setvenueeffectsendvolume \{track = bass
					vol = -100}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -100}
			endif
			case 'Start_Of_Game_Fade_In_To_House'
			Change \{g_current_music_dsp_snapshot_setting = 'house'}
			setsoundbussparams \{$house_bussset
				time = 0.5}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 0.5}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			setsoundbussparams \{$house_crowd_bussset
				time = 0.15}
			case 'Fade_Out_House_Music_To_Start_A_Stage_Song'
			setsoundbussparams \{$music_stream_quiet_bussset
				time = 5.0}
			setsoundbussparams \{$prestage_crowd_bussset
				time = 8}
			printf \{channel = sfx
				qs(0xc32df256)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good
				fadeintime = 6
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			Wait \{2.5
				Seconds}
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume \{track = kick
					vol = -100}
				sap_setvenueeffectsendvolume \{track = snare
					vol = -100}
				sap_setvenueeffectsendvolume \{track = cymbal
					vol = -100}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = -100}
				sap_setvenueeffectsendvolume \{track = bass
					vol = -100}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -100}
			endif
			Change \{g_current_music_dsp_snapshot_setting = 'stage'}
			audio_effects_change_dsp_snapshot \{snapshot = 'stage'
				time = 0.0}
			setsoundbussparams \{$stage_crowd_bussset
				time = 15}
			case 'End_Of_Stage_Song_Fade_Out_Crowd'
			printf \{channel = sfx
				qs(0x98152f3c)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 20
				fadeintype = linear
				fadeouttime = 20
				fadeouttype = linear}
			setsoundbussparams \{$house_bussset
				time = 25}
			case 'End_Of_Stage_Song_Setup_House_Immediate'
			Change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 0}
			setsoundbussparams \{$house_3db_bussset
				time = 0.0}
			case 'Stage_To_Join'
			SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
			SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
			Change \{g_current_music_dsp_snapshot_setting = 'join'}
			audio_effects_change_dsp_snapshot \{snapshot = 'join'
				time = 2}
			printf \{channel = sfx
				qs(0x367075b7)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			case 'House_To_Join'
			SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
			SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
			printf \{channel = sfx
				qs(0xcc49e8b7)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			Change \{g_current_music_dsp_snapshot_setting = 'join'}
			audio_effects_change_dsp_snapshot \{snapshot = 'join'
				time = 2}
			case 'Join_To_Game'
			printf \{channel = sfx
				qs(0x15aab6d4)}
			gamemode_gettype
			if (<Type> = freeplay)
				vocals_mute_all_mics \{mute = FALSE}
			endif
			Change \{g_current_music_dsp_snapshot_setting = 'game'}
			audio_effects_change_dsp_snapshot \{snapshot = 'game'
				time = 4.0}
			case 'Join_To_House'
			Change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			printf \{channel = sfx
				qs(0x495111bc)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Join_To_Stage'
			Change \{g_current_music_dsp_snapshot_setting = 'stage'}
			setsoundbussparams \{$stage_crowd_bussset
				time = 2}
			audio_effects_change_dsp_snapshot \{snapshot = 'stage'
				time = 1.0}
			printf \{channel = sfx
				qs(0x8b235d0d)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good
				fadeintime = 3
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			case 'Game_To_Pause'
			setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 3)} time = 2}
			Change \{g_current_music_dsp_snapshot_setting = 'pause'}
			audio_effects_change_dsp_snapshot \{snapshot = 'pause'
				time = 1.0}
			case 'Pause_To_Game'
			printf \{channel = sfx
				qs(0xee66b36a)}
			setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 2}
			Change \{g_current_music_dsp_snapshot_setting = 'game'}
			audio_effects_change_dsp_snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = freeplay_music_crowd_transitions_pause_to_game}
			case 'Pause_To_Setlist'
			printf \{channel = sfx
				qs(0xa4d8014d)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 2.5
				fadeintype = linear
				fadeouttime = 2.5
				fadeouttype = linear}
			setsoundbussparams \{$music_stream_quiet_bussset
				time = 0.3}
			case 'Pause_To_MainMenu'
			printf \{channel = sfx
				qs(0xdb641471)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 2
				fadeintype = linear
				fadeouttime = 3.5
				fadeouttype = linear}
			Change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			One_Shot_SoundEvent SoundEvent = audio_crowd_oneshots_do_nothing waitTime = 5 immediate = <immediate>
			case 'Pause_To_House'
			Change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			printf \{channel = sfx
				qs(0x04f57dca)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Pause_To_Stage'
			Change \{g_current_music_dsp_snapshot_setting = 'stage'}
			audio_effects_change_dsp_snapshot \{snapshot = 'stage'
				time = 1.0}
			setsoundbussparams \{$prestage_crowd_bussset
				time = 1}
			printf \{channel = sfx
				qs(0xc687317b)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Setlist_To_Pause'
			printf \{channel = sfx
				qs(0x21fc4b89)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good
				fadeintime = 1.5}
			setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 3)} time = 2}
			Change \{g_current_music_dsp_snapshot_setting = 'pause'}
			audio_effects_change_dsp_snapshot \{snapshot = 'pause'
				time = 0.5}
			case 'Setlist_To_Game'
			printf \{channel = sfx
				qs(0x58ccbfbe)}
			printf \{channel = sfx
				qs(0xdf81d6e3)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			Change \{g_current_music_dsp_snapshot_setting = 'game'}
			audio_effects_change_dsp_snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = freeplay_music_crowd_transitions_setlist_to_game}
			case 'Game_To_House'
			printf \{channel = sfx
				qs(0xc056152f)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good
				fadeintime = 3
				volpercentincrease = 20}
			Change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			Wait \{4
				Seconds}
			printf \{channel = sfx
				qs(0xc056152f)}
			sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 10
				fadeintype = linear
				fadeouttime = 20
				fadeouttype = linear}
			default
			printf \{channel = sfx
				qs(0xeca56022)}
		endswitch
	endif
endscript

script audio_gameplay_intro_kick_sfx_waiting 
	gamemode_gettype
	if NOT (<Type> = freeplay || $in_sing_a_long = true)
		Wait ($current_intro.hud_move_time / 1000.0) Seconds
		SoundEvent \{event = audio_ui_gameplay_intro_kick}
	endif
endscript

script audio_gameplay_intro_highway_up_sfx_waiting 
	gamemode_gettype
	if NOT (<Type> = freeplay)
		waitTime = (($current_intro.highway_move_time / 1000.0) - 1.5)
		if (<waitTime> < 0)
			waitTime = 0
		endif
		Wait <waitTime> Seconds
		SoundEvent \{event = audio_ui_gameplay_highway_up}
		GetPakManCurrent \{map = zones}
	else
		if ($g_beginning_of_freeplay_highway_up = 1)
			Change \{g_beginning_of_freeplay_highway_up = 0}
			SoundEvent \{event = audio_ui_gameplay_highway_up}
		endif
	endif
endscript

script audio_gameplay_intro_vocal_highway_up_sfx_waiting 
	if NOT ($in_sing_a_long = true)
		SoundEvent \{event = audio_ui_gameplay_vocal_highway_appear}
	endif
endscript

script audio_gameplay_intro_sfx_warmup 
	KillSpawnedScript \{Name = audio_crowd_play_loading_screen_swell}
	KillSpawnedScript \{Name = audio_crowd_loading_whistle}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol))} time = 2}
endscript

script audio_gameplay_countoff_logic 
	gamemode_gettype
	getnumplayersingame \{local}
	getfirstplayer \{local}
	playlist_getcurrentsong
	song_name = <current_song>
	GetPakManCurrentName \{map = zones}
	if (<Type> = career)
		if (<pakname> = 'z_modular')
			return
		endif
	endif
	if NOT GotParam \{countoff_sound}
		playlist_getcurrentsong
		get_song_struct song = <current_song>
		if StructureContains structure = <song_struct> Name = countoff
			countoff_sound = (<song_struct>.countoff)
		else
			countoff_sound = 'sticks_normal'
		endif
		if GotParam \{countoff_sound_type}
			countoff_sound = <countoff_sound_type>
		endif
	endif
	formatText checksumName = countoff_sound '%s' s = <countoff_sound> AddToStringLookup = true
	if NOT ($game_mode = practice)
		if (<velocity> > 99)
			switch <countoff_sound>
				case sticks_normal
				PlaySound \{StickClickMed
					buss = Countoffs
					send_vol1 = $g_current_send_vol
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case hihat01
				PlaySound \{HiHatClosed01
					buss = Countoffs
					send_vol1 = $g_current_send_vol
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							-0.90999997
							-0.44
							0.0
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case sticks_tiny
				PlaySound \{StickClickSmall
					buss = Countoffs
					send_vol1 = $g_current_send_vol
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							-1.41
							-0.90999997
							-0.44
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case sticks_huge
				PlaySound \{StickClickLarge
					buss = Countoffs
					send_vol1 = $g_current_send_vol
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case hihat02
				PlaySound \{HiHatOpen02
					buss = Countoffs
					send_vol1 = $g_current_send_vol
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.42000002
							0.83
							1.21
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.17
							0.0
							0.0
						]
					}}
				case hihat03
				PlaySound \{HiHatPedal02
					buss = Countoffs
					send_vol1 = $g_current_send_vol
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.83
							1.58
							2.27
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.17
							0.0
							0.0
						]
					}}
				default
				printf \{channel = sfx
					qs(0x71d9c052)}
				PlaySound \{HiHatPedal02
					buss = Countoffs
					send_vol1 = $g_current_send_vol
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.83
							1.58
							2.27
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.17
							0.0
							0.0
						]
					}}
			endswitch
		else
			if (<velocity> > 74)
				switch <countoff_sound>
					case sticks_normal
					PlaySound \{StickClickMed
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-3.73
								-4.14
								-5.17
								-6.0
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case hihat01
					PlaySound \{HiHatClosed01
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case sticks_tiny
					PlaySound \{StickClickSmall
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case sticks_huge
					PlaySound \{StickClickLarge
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case hihat02
					PlaySound \{HiHatOpen02
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					case hihat03
					PlaySound \{HiHatPedal02
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					default
					PlaySound \{HiHatPedal02
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
				endswitch
			else
				switch <countoff_sound>
					case sticks_normal
					PlaySound \{StickClickMed
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-9.09
								-8.610001
								-7.9300003
								-7.51
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case hihat01
					PlaySound \{HiHatClosed01
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case sticks_tiny
					PlaySound \{StickClickSmall
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case sticks_huge
					PlaySound \{StickClickLarge
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case hihat02
					PlaySound \{HiHatOpen02
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					case hihat03
					PlaySound \{HiHatPedal02
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					default
					PlaySound \{HiHatPedal02
						buss = Countoffs
						send_vol1 = $g_current_send_vol
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
				endswitch
			endif
		endif
	else
		if (<velocity> > 99)
			switch <countoff_sound>
				case sticks_normal
				PlaySound \{StickClickMed
					buss = Countoffs
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case hihat01
				PlaySound \{HiHatClosed01
					buss = Countoffs
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							-0.90999997
							-0.44
							0.0
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case sticks_tiny
				PlaySound \{StickClickSmall
					buss = Countoffs
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							-1.41
							-0.90999997
							-0.44
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case sticks_huge
				PlaySound \{StickClickLarge
					buss = Countoffs
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case hihat02
				PlaySound \{HiHatOpen02
					buss = Countoffs
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.42000002
							0.83
							1.21
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.17
							0.0
							0.0
						]
					}}
				case hihat03
				PlaySound \{HiHatPedal02
					buss = Countoffs
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.83
							1.58
							2.27
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.17
							0.0
							0.0
						]
					}}
				default
				PlaySound \{HiHatPedal02
					buss = Countoffs
					RandomVol = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.83
							1.58
							2.27
						]
					}
					RandomPitch = {
						Type = RandomNoRepeatLastTwoType
						vals = [
							0.17
							0.0
							0.0
						]
					}}
			endswitch
		else
			if (<velocity> > 74)
				switch <countoff_sound>
					case sticks_normal
					PlaySound \{StickClickMed
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-3.73
								-4.14
								-5.17
								-6.0
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case hihat01
					PlaySound \{HiHatClosed01
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case sticks_tiny
					PlaySound \{StickClickSmall
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case sticks_huge
					PlaySound \{StickClickLarge
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case hihat02
					PlaySound \{HiHatOpen02
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					case hihat03
					PlaySound \{HiHatPedal02
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					default
					PlaySound \{HiHatPedal02
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
				endswitch
			else
				switch <countoff_sound>
					case sticks_normal
					PlaySound \{StickClickMed
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-9.09
								-8.610001
								-7.9300003
								-7.51
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case hihat01
					PlaySound \{HiHatClosed01
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case sticks_tiny
					PlaySound \{StickClickSmall
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case sticks_huge
					PlaySound \{StickClickLarge
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case hihat02
					PlaySound \{HiHatOpen02
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					case hihat03
					PlaySound \{HiHatPedal02
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					default
					PlaySound \{HiHatPedal02
						buss = Countoffs
						RandomVol = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							Type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
				endswitch
			endif
		endif
	endif
endscript

script audio_gameplay_you_rock_crowd_waiting 
	Wait \{2
		Seconds}
	SoundEvent \{event = Medium_Crowd_Applause}
endscript

script audio_gameplay_fail_song_stop_sounds 
	printf \{channel = sfx
		qs(0xa65f93ed)}
	StopSoundsByBuss \{Crowd}
	StopSoundsByBuss \{UI_Star_Power}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundsByBuss \{wrong_notes_bass}
	StopSoundsByBuss \{wrong_notes_drums}
	StopSoundsByBuss \{wrong_notes_guitar}
	StopSoundsByBuss \{binkcutscenes}
	StopSoundsByBuss \{UI_Battle_Mode}
endscript

script audio_gameplay_stop_sounds_for_killsong \{loading_transition = 0}
	printf \{channel = sfx
		qs(0xd5794b7a)}
	setsoundbussparams {Default = {vol = ($default_BussSet.Default.vol) pitch = 0} time = 0.02}
	setsoundbussparams \{Crowd_Beds = {
			pitch = 0
		}
		time = 0.02}
	StopSoundEvent \{Song_Intro_Kick_SFX}
	StopSoundEvent \{audio_ui_gameplay_intro_kick}
	StopSoundEvent \{pyro}
	StopSoundEvent \{audio_ui_gameplay_ripple_up}
	StopSoundEvent \{audio_ui_gameplay_highway_up}
	StopSoundEvent \{Crowd_Fast_Surge_Cheer}
	StopSoundEvent \{Medium_Crowd_Applause}
	StopSoundEvent \{audio_star_power_release_front_p1}
	StopSoundEvent \{audio_star_power_release_front_p2}
	StopSoundEvent \{audio_star_power_deployed_lfe_p1}
	StopSoundEvent \{audio_star_power_deployed_front_p1}
	StopSoundEvent \{audio_star_power_deployed_back_p1}
	StopSoundEvent \{audio_star_power_deployed_front_p2}
	StopSoundEvent \{audio_star_power_deployed_back_p2}
	StopSoundEvent \{audio_star_power_available_p2}
	StopSoundEvent \{audio_star_power_available_p1}
	StopSoundEvent \{audio_ui_generic_warning}
	StopSoundEvent \{audio_ui_gameplay_ripple_up}
	StopSoundEvent \{audio_ui_gameplay_highway_up}
	StopSoundEvent \{audio_ui_gameplay_vocal_highway_appear}
	StopSoundEvent \{ui_sfx_rewind_highway}
	stopsound \{shredfest_momentum_difficulty_down}
	stopsound \{$g_current_crowd_transition_neutral_to_positive}
	stopsound \{shredfest_player_dropout}
	stopsound \{point_awarded}
	stopsound \{shredfest_momentum_difficulty_up}
	StopSoundEvent \{audio_multiplayer_sudden_death_dropped}
	StopSoundEvent \{audio_star_power_awarded}
	StopSoundEvent \{audio_star_power_awarded_p1}
	StopSoundEvent \{audio_star_power_awarded_p2}
	StopSoundEvent \{audio_star_power_available}
	StopSoundEvent \{audio_star_power_release_front}
	StopSoundEvent \{audio_star_power_cheer_deployed}
	StopSoundEvent \{audio_star_power_cheer_deployed_p1}
	StopSoundEvent \{audio_star_power_cheer_deployed_p2}
	StopSoundEvent \{audio_star_power_cheer_deployed_p3}
	StopSoundEvent \{$g_current_crowd_clap_normal_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_middle_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_left_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_right_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_left_middle_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_right_middle_soundevent}
	StopSoundEvent \{audio_star_power_deployed_back}
	StopSoundEvent \{audio_star_power_deployed_lfe}
	StopSoundEvent \{audio_star_power_deployed_front}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundEvent \{audio_ui_gameplay_lose_multiplier_2x}
	StopSoundEvent \{audio_ui_gameplay_lose_multiplier_3x}
	StopSoundEvent \{audio_ui_gameplay_lose_multiplier_4x}
	StopSoundEvent \{audio_star_power_deployed_back_p3}
	StopSoundEvent \{audio_star_power_deployed_front_p3}
	StopSoundEvent \{audio_star_power_available_p3}
	StopSoundEvent \{audio_star_power_awarded_p3}
	StopSoundEvent \{audio_star_power_release_front_p3}
	StopSoundsByBuss \{drums_ingame}
	StopSoundsByBuss \{drums_jammode}
	StopSoundsByBuss \{guitar_jammode}
	StopSoundsByBuss \{bass_jammode}
	StopSoundsByBuss \{wrong_notes_guitar}
	StopSoundsByBuss \{wrong_notes_bass}
	StopSoundsByBuss \{wrong_notes_drums}
	StopSoundsByBuss \{Crowd_One_Shots}
	StopSoundsByBuss \{Crowd_Beds}
	StopSoundsByBuss \{Crowd_Transitions}
	StopSoundsByBuss \{Crowd_Cheers}
	StopSoundsByBuss \{sfx}
	StopSoundsByBuss \{Countoffs}
	StopSoundEvent \{audio_powers_generic_electricity_bolt}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_left}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_right}
	StopSoundEvent \{audio_powers_resurrection_sfx}
	StopSoundEvent \{audio_powers_generic_power_up_lvl1}
	StopSoundEvent \{audio_powers_generic_power_up_lvl2}
	StopSoundEvent \{audio_powers_johnny_power_lvl_1}
	StopSoundEvent \{audio_powers_johnny_power_lvl_2}
	StopSoundEvent \{audio_powers_judy_power_lvl_1}
	StopSoundEvent \{audio_powers_judy_power_lvl_2}
	StopSoundEvent \{audio_powers_pandora_power_lvl_1}
	StopSoundEvent \{audio_powers_pandora_power_lvl_2}
	StopSoundEvent \{audio_powers_axel_power_lvl_1}
	StopSoundEvent \{audio_powers_axel_use_resurrection}
	StopSoundEvent \{audio_powers_lars_power_lvl_1}
	StopSoundEvent \{audio_powers_lars_power_lvl_2}
	StopSoundEvent \{audio_powers_axel_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_softer}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_left_softer}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_right_softer}
	StopSoundEvent \{audio_powers_generic_power_up_lvl1_softer}
	StopSoundEvent \{audio_powers_generic_power_up_lvl2_softer}
	StopSoundEvent \{audio_powers_johnny_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_johnny_power_lvl_2_softer}
	StopSoundEvent \{audio_powers_judy_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_judy_power_lvl_2_softer}
	StopSoundEvent \{audio_powers_lars_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_lars_power_lvl_2_softer}
	StopSoundEvent \{audio_powers_pandora_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_pandora_power_lvl_2_softer}
	StopSoundEvent \{endofsong_camera_cheer}
	StopSoundEvent \{endofsong_camera_quiet}
	StopSoundEvent \{endofsong_camera_softer}
	StopSoundEvent \{fb_success_scream}
	StopSoundEvent \{z_finalbattle_hita}
	StopSoundEvent \{z_finalbattle_hw_attack_drummer}
	StopSoundEvent \{z_finalbattle_hw_attack_vocalist}
	StopSoundEvent \{z_finalbattle_hw_attack_guitarist}
	StopSoundEvent \{z_finalbattle_hw_attack_sword}
	StopSoundEvent \{fb_success_part3}
	KillSpawnedScript \{Name = z_finalbattle_fast_restart_wait_then_play_scream_sfx}
	KillSpawnedScript \{Name = audio_play_career_power_up_sfx}
	KillSpawnedScript \{Name = audio_crowd_kill_quiet_crowd_one_shots_fast}
	One_Shot_SoundEvent \{SoundEvent = audio_crowd_oneshots_do_nothing}
	stopsound \{$g_current_crowd_anticipation}
	StopSoundEvent \{GH_SFX_BattleMode_Lightning_Player1}
	StopSoundEvent \{GH_SFX_BattleMode_Lightning_Player2}
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
	StopSoundEvent \{Battlemode_HeartBeat_P1}
	StopSoundEvent \{Battlemode_HeartBeat_P2}
	if (<Type> = Normal)
		if (<loading_transition> = 1)
		else
		endif
	endif
endscript

script audio_stopping_sounds_killsong_lite 
	printf \{channel = sfx
		qs(0x70509e68)}
	StopSoundEvent \{Song_Intro_Kick_SFX}
	StopSoundEvent \{audio_ui_gameplay_intro_kick}
	StopSoundEvent \{pyro}
	StopSoundEvent \{audio_ui_gameplay_ripple_up}
	StopSoundEvent \{audio_ui_gameplay_highway_up}
	StopSoundEvent \{Crowd_Fast_Surge_Cheer}
	StopSoundEvent \{Medium_Crowd_Applause}
	StopSoundEvent \{audio_star_power_release_front_p1}
	StopSoundEvent \{audio_star_power_release_front_p2}
	StopSoundEvent \{audio_star_power_deployed_lfe_p1}
	StopSoundEvent \{audio_star_power_deployed_front_p1}
	StopSoundEvent \{audio_star_power_deployed_back_p1}
	StopSoundEvent \{audio_star_power_deployed_front_p2}
	StopSoundEvent \{audio_star_power_deployed_back_p2}
	StopSoundEvent \{audio_star_power_available_p2}
	StopSoundEvent \{audio_star_power_available_p1}
	StopSoundEvent \{audio_ui_generic_warning}
	StopSoundEvent \{audio_ui_gameplay_ripple_up}
	StopSoundEvent \{audio_ui_gameplay_highway_up}
	StopSoundEvent \{audio_ui_gameplay_vocal_highway_appear}
	StopSoundEvent \{ui_sfx_rewind_highway}
	stopsound \{shredfest_momentum_difficulty_down}
	stopsound \{$g_current_crowd_transition_neutral_to_positive}
	stopsound \{shredfest_player_dropout}
	stopsound \{point_awarded}
	stopsound \{shredfest_momentum_difficulty_up}
	StopSoundEvent \{audio_multiplayer_sudden_death_dropped}
	StopSoundEvent \{audio_star_power_awarded}
	StopSoundEvent \{audio_star_power_awarded_p1}
	StopSoundEvent \{audio_star_power_awarded_p2}
	StopSoundEvent \{audio_star_power_available}
	StopSoundEvent \{audio_star_power_release_front}
	StopSoundEvent \{audio_star_power_cheer_deployed}
	StopSoundEvent \{audio_star_power_cheer_deployed_p1}
	StopSoundEvent \{audio_star_power_cheer_deployed_p2}
	StopSoundEvent \{audio_star_power_cheer_deployed_p3}
	StopSoundEvent \{$g_current_crowd_clap_normal_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_middle_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_left_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_right_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_left_middle_soundevent}
	StopSoundEvent \{$g_current_crowd_clap_right_middle_soundevent}
	StopSoundEvent \{audio_star_power_deployed_back}
	StopSoundEvent \{audio_star_power_deployed_lfe}
	StopSoundEvent \{audio_star_power_deployed_front}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundEvent \{audio_ui_gameplay_lose_multiplier_2x}
	StopSoundEvent \{audio_ui_gameplay_lose_multiplier_3x}
	StopSoundEvent \{audio_ui_gameplay_lose_multiplier_4x}
	StopSoundEvent \{audio_star_power_deployed_back_p3}
	StopSoundEvent \{audio_star_power_deployed_front_p3}
	StopSoundEvent \{audio_star_power_available_p3}
	StopSoundEvent \{audio_star_power_awarded_p3}
	StopSoundEvent \{audio_star_power_release_front_p3}
	StopSoundsByBuss \{drums_ingame}
	StopSoundsByBuss \{drums_jammode}
	StopSoundsByBuss \{guitar_jammode}
	StopSoundsByBuss \{bass_jammode}
	StopSoundsByBuss \{wrong_notes_guitar}
	StopSoundsByBuss \{wrong_notes_bass}
	StopSoundsByBuss \{wrong_notes_drums}
	StopSoundsByBuss \{sfx}
	StopSoundsByBuss \{Countoffs}
	StopSoundEvent \{audio_powers_generic_electricity_bolt}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_left}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_right}
	StopSoundEvent \{audio_powers_resurrection_sfx}
	StopSoundEvent \{audio_powers_generic_power_up_lvl1}
	StopSoundEvent \{audio_powers_generic_power_up_lvl2}
	StopSoundEvent \{audio_powers_johnny_power_lvl_1}
	StopSoundEvent \{audio_powers_johnny_power_lvl_2}
	StopSoundEvent \{audio_powers_judy_power_lvl_1}
	StopSoundEvent \{audio_powers_judy_power_lvl_2}
	StopSoundEvent \{audio_powers_pandora_power_lvl_1}
	StopSoundEvent \{audio_powers_pandora_power_lvl_2}
	StopSoundEvent \{audio_powers_axel_power_lvl_1}
	StopSoundEvent \{audio_powers_axel_use_resurrection}
	StopSoundEvent \{audio_powers_lars_power_lvl_1}
	StopSoundEvent \{audio_powers_lars_power_lvl_2}
	StopSoundEvent \{audio_powers_axel_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_softer}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_left_softer}
	StopSoundEvent \{audio_powers_generic_electricity_bolt_right_softer}
	StopSoundEvent \{audio_powers_generic_power_up_lvl1_softer}
	StopSoundEvent \{audio_powers_generic_power_up_lvl2_softer}
	StopSoundEvent \{audio_powers_johnny_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_johnny_power_lvl_2_softer}
	StopSoundEvent \{audio_powers_judy_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_judy_power_lvl_2_softer}
	StopSoundEvent \{audio_powers_lars_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_lars_power_lvl_2_softer}
	StopSoundEvent \{audio_powers_pandora_power_lvl_1_softer}
	StopSoundEvent \{audio_powers_pandora_power_lvl_2_softer}
	StopSoundEvent \{endofsong_camera_cheer}
	StopSoundEvent \{endofsong_camera_quiet}
	StopSoundEvent \{endofsong_camera_softer}
	StopSoundEvent \{z_finalbattle_hita}
	StopSoundEvent \{z_finalbattle_hw_attack_drummer}
	StopSoundEvent \{z_finalbattle_hw_attack_vocalist}
	StopSoundEvent \{z_finalbattle_hw_attack_guitarist}
	StopSoundEvent \{z_finalbattle_hw_attack_sword}
	StopSoundEvent \{fb_success_part3}
	StopSoundEvent \{fb_success_scream}
	KillSpawnedScript \{Name = z_finalbattle_fast_restart_wait_then_play_scream_sfx}
	KillSpawnedScript \{Name = audio_play_career_power_up_sfx}
	stopsound \{$g_current_crowd_anticipation}
endscript

script audio_gameplay_guitar_wrong_note_sound_logic \{vol = 0.0
		pitch = 0.0
		soundasset = Default
		buss = Front_End
		pan1x = 0.0
		pan1y = 0.0
		pan2x = 0.0
		pan2y = 0.0}
	playlist_getcurrentsong
	if ArrayContains array = ($g_transformation_dummy_songs) contains = <current_song>
		return
	endif
	getplayerinfo <Player> highway_position
	switch <highway_position>
		case left
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = -0.75
		<pan2y> = 1
		case leftcenter
		<pan1x> = -1.0
		<pan1y> = 1
		<pan2x> = 0.25
		<pan2y> = 1
		case center
		if isSinglePlayerGame
			pan1x = -1.0
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 1.0
		else
			pan1x = -0.25
			pan1y = 1.0
			pan2x = 0.25
			pan2y = 1.0
		endif
		case rightcenter
		<pan1x> = -0.25
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
		case right
		<pan1x> = 0.75
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
		default
	endswitch
	getplayerinfo <Player> part
	switch <part>
		case bass
		RandomNoRepeat (
			@ soundasset = bad_note_bass1
			vol = -2
			@ soundasset = bad_note_bass2
			vol = -2
			@ soundasset = bad_note_bass4
			vol = -2
			@ soundasset = bad_note_bass6
			vol = -2
			)
		newbuss = wrong_notes_bass
		case guitar
		RandomNoRepeat (
			@ soundasset = bad_note1
			vol = -5.63
			@ soundasset = bad_note2
			vol = -4.02
			@ soundasset = bad_note3
			vol = -5.2599998
			@ soundasset = bad_note4
			vol = -5.21
			@ soundasset = bad_note6
			vol = -5.2599998
			)
		newbuss = wrong_notes_guitar
		case drum
		switch <drum_stream>
			case 0
			case 2
			soundasset = bad_note_tom1
			vol = -6
			pitch = RandomFloat (-2.0, 0.0)
			case 1
			soundasset = bad_note_hihat1
			vol = -2
			pitch = -4
			case 3
			soundasset = bad_note_kick1
			vol = -1
			pitch = 4
		endswitch
		newbuss = wrong_notes_drums
		default
		printf \{channel = sfx
			qs(0xd6ef2146)}
	endswitch
	<controllersoundvolume> = (<vol> + 10)
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 1)
		vol = (<vol> - 8)
	endif
	getplayerinfo <Player> controller
	PlaySound <soundasset> vol = <controllersoundvolume> pitch = <pitch> buss = <newbuss> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y> Priority = 90 panremovecenter = true controllers = {controller1 = (<controller>)}
	PlaySound <soundasset> vol = <vol> pitch = <pitch> buss = <newbuss> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y> Priority = 90 panremovecenter = true
endscript

script audio_ui_play_playlist_scroll_sfx 
	SoundEvent \{event = audio_ui_setlist_playlist_scroll}
endscript

script audio_ui_play_songlist_scroll_sfx 
	SoundEvent \{event = audio_ui_setlist_scroll}
endscript

script audio_ui_play_sort_songlist_sfx 
	SoundEvent \{event = audio_ui_setlist_sort}
endscript

script audio_gameplay_play_revive_or_kill_player_sfx \{Player = 1
		vocalist = 0
		cheer = 0}
	audio_gameplay_multiplayer_get_sfx_pan_values Player = <Player> vocalist = <vocalist>
	transitionevent = $g_current_crowd_transition_neutral_to_positive
	if (<cheer> = 1)
		stopsound \{$g_current_crowd_transition_neutral_to_positive}
		printf \{channel = sfx
			qs(0xacd1e525)}
		PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	else
		stopsound \{shredfest_momentum_difficulty_up}
		printf \{channel = sfx
			qs(0xe1577cb8)}
		PlaySound shredfest_player_dropout vol = -7 buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script audio_gameplay_play_momentum_difficulty_up_sfx 
	audio_gameplay_multiplayer_get_sfx_pan_values Player = <Player>
	transitionevent = $g_current_crowd_transition_neutral_to_positive
	if NOT issoundplaying \{shredfest_momentum_difficulty_up}
		stopsound \{shredfest_momentum_difficulty_up}
		stopsound \{$g_current_crowd_transition_neutral_to_positive}
		switch <highway_position>
			case left
			printf \{channel = sfx
				qs(0xba999941)}
			PlaySound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case right
			printf \{channel = sfx
				qs(0x8f7647cd)}
			PlaySound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case leftcenter
			printf \{channel = sfx
				qs(0x3069704d)}
			PlaySound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case rightcenter
			printf \{channel = sfx
				qs(0xaac242f0)}
			PlaySound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case center
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			PlaySound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal1
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			PlaySound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal2
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			PlaySound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal3
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			PlaySound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal4
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			PlaySound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case Default
			printf \{channel = sfx
				qs(0x578d9ab3)}
		endswitch
	else
		if issoundplaying <transitionevent>
			SetSoundParams <transitionevent> pan1x = -1 pan2x = 1 pan1y = 1 pan2y = 1
		endif
		SetSoundParams \{shredfest_momentum_difficulty_up
			pan1x = -1
			pan2x = 1
			pan1y = 1
			pan2y = 1}
	endif
endscript

script audio_gameplay_play_momentum_difficulty_down_sfx 
	if NOT issoundplaying \{shredfest_momentum_difficulty_down}
		audio_gameplay_multiplayer_get_sfx_pan_values Player = <Player>
		switch <highway_position>
			case left
			printf \{channel = sfx
				qs(0x40cf2783)}
			PlaySound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case right
			printf \{channel = sfx
				qs(0x5a6396dc)}
			PlaySound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case leftcenter
			printf \{channel = sfx
				qs(0x36d9dc4c)}
			PlaySound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case rightcenter
			printf \{channel = sfx
				qs(0x6cb99ac2)}
			PlaySound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case center
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			PlaySound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal1
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			PlaySound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal2
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			PlaySound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal3
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			PlaySound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal4
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			PlaySound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case Default
			printf \{channel = sfx
				qs(0x578d9ab3)}
		endswitch
	else
		SetSoundParams \{shredfest_momentum_difficulty_down
			pan1x = -1
			pan2x = 1
			pan1y = 1
			pan2y = 1}
	endif
endscript

script audio_gameplay_elimination_sfx_logic 
	if NOT issoundplaying \{shredfest_player_dropout}
		audio_gameplay_multiplayer_get_sfx_pan_values Player = <Player>
		switch <highway_position>
			case left
			printf \{channel = sfx
				qs(0x28e32290)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -7 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case right
			printf \{channel = sfx
				qs(0x4be64bed)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -7 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case leftcenter
			printf \{channel = sfx
				qs(0x8ed28fe0)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -7 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case rightcenter
			printf \{channel = sfx
				qs(0x9c69d162)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -7 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case center
			printf \{channel = sfx
				qs(0x4bd810a4)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -7 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case Default
			printf \{channel = sfx
				qs(0xdb59d86c)}
		endswitch
	else
		SetSoundParams \{shredfest_player_dropout
			pan1x = -1
			pan2x = 1
			pan1y = 1
			pan2y = 1}
	endif
endscript

script audio_ui_play_cast_vote_sfx 
	switch <option>
		case 0
		SoundEvent \{event = gameplay_vote_hell_sfx}
		case 1
		SoundEvent \{event = gameplay_vote_heaven_sfx}
		default
		printf \{channel = sfx
			qs(0x8f74c921)}
	endswitch
endscript

script audio_ui_play_kill_voting_screen_sfx 
	if IsSoundEventPlaying \{vote_hell_crowd_swell}
		StopSoundEvent \{vote_hell_crowd_swell}
	endif
	if IsSoundEventPlaying \{vote_heaven_crowd_swell}
		StopSoundEvent \{vote_heaven_crowd_swell}
	endif
	if IsSoundEventPlaying \{vote_tie_crowd_swell}
		StopSoundEvent \{vote_tie_crowd_swell}
	endif
endscript

script audio_ui_voting_screen_timer 
	SpawnScriptNow \{audio_gameplay_counter_play_beep_spawn
		params = {
			time = 2.5
		}}
	Wait \{2.5
		Seconds}
	KillSpawnedScript \{Name = audio_gameplay_counter_play_beep_spawn}
endscript

script audio_ui_play_tie_breaker_sfx 
	printf channel = sfx qs(0x00c56ec0) s = <count>
	Volume = -25
	pluspitch = -1.0
	switch <count>
		case 1
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (1.0 + <pluspitch>) buss = Front_End
		case 2
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (1.05 + <pluspitch>) buss = Front_End
		case 3
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (1.1 + <pluspitch>) buss = Front_End
		case 4
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (1.15 + <pluspitch>) buss = Front_End
		case 5
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (1.1 + <pluspitch>) buss = Front_End
		case 6
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (1.0 + <pluspitch>) buss = Front_End
		case 7
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.9 + <pluspitch>) buss = Front_End
		case 8
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.75 + <pluspitch>) buss = Front_End
		case 9
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.65000004 + <pluspitch>) buss = Front_End
		case 10
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.5 + <pluspitch>) buss = Front_End
		case 11
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.4 + <pluspitch>) buss = Front_End
		case 12
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.3 + <pluspitch>) buss = Front_End
		case 13
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.25 + <pluspitch>) buss = Front_End
		case 14
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.2 + <pluspitch>) buss = Front_End
		case 15
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.16 + <pluspitch>) buss = Front_End
		case 16
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.14 + <pluspitch>) buss = Front_End
		case 17
		PlaySound menu_gameplay_spin vol = <Volume> pitch = (0.120000005 + <pluspitch>) buss = Front_End
		default
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.120000005 buss = Front_End
		printf \{channel = sfx
			qs(0x9716a790)}
	endswitch
endscript

script audio_ui_play_voting_outcome_result_sfx 
	switch <winner>
		case 0
		SoundEvent \{event = vote_hell_crowd_swell}
		case 1
		SoundEvent \{event = vote_heaven_crowd_swell}
		case 2
		SoundEvent \{event = vote_tie_crowd_swell}
		default
		printf \{channel = sfx
			qs(0x8e2e0ea8)}
	endswitch
endscript

script audio_gameplay_spawned_point_awarded_waiting \{pan_wide = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{channel = sfx
		qs(0x046b774e)}
	if (<pan_wide> = 1)
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
	else
		audio_gameplay_multiplayer_get_sfx_pan_values Player = <Player>
	endif
	Wait \{0.08
		Seconds}
	PlaySound point_awarded vol = -11 buss = ui_ingame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script audio_gameplay_spawned_point_awarded_perfectionist_sfx \{pan_wide = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{channel = sfx
		qs(0x046b774e)}
	if (<pan_wide> = 1)
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
	else
		audio_gameplay_multiplayer_get_sfx_pan_values Player = <Player>
	endif
	PlaySound point_awarded vol = -11 buss = ui_ingame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script audio_ui_play_switch_teams_sfx \{Type = request
		direction = left}
	request_vol = -8
	resend_vol = -8
	if GotParam \{Type}
		switch <Type>
			case request
			switch <direction>
				case left
				PlaySound team_switch_request vol = <request_vol> buss = Front_End pan1x = -1 pan1y = 1 pan2x = -0.25 pan2y = 1
				case right
				PlaySound team_switch_request vol = <request_vol> buss = Front_End pan1x = 0.25 pan1y = 1 pan2x = 1 pan2y = 1
				default
				PlaySound team_switch_request vol = <request_vol> buss = Front_End pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1
			endswitch
			case resend
			switch <direction>
				case left
				PlaySound team_switch_resend vol = <resend_vol> buss = Front_End pan1x = -1 pan1y = 1 pan2x = -0.25 pan2y = 1
				case right
				PlaySound team_switch_resend vol = <resend_vol> buss = Front_End pan1x = 0.25 pan1y = 1 pan2x = 1 pan2y = 1
				default
				PlaySound team_switch_resend vol = <resend_vol> buss = Front_End pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1
			endswitch
			case swap
			SoundEvent \{event = audio_ui_online_team_switch}
			default
			printf \{channel = sfx
				qs(0x4e2b9495)}
		endswitch
	endif
endscript

script audio_ui_play_car_scroll_widget_sfx 
	setspawnedscriptnorepeatfor \{time = 0.07}
	PlaySound car_widget_scroll vol = -10 pitch_percent = ((<fill_perc> * 6.0) + 90) buss = Front_End
endscript

script audio_ui_play_highway_ripple_sfx 
	if inroadiebattlemode
		getfirstplayer \{out = first_player}
		if (<Player> = <first_player>)
			roadie_battle_play_fretboard_sfx
		endif
	elseif (<Type> = freeplay)
		if NOT playerinfoequals <Player> freeplay_state = dropped
			if NOT playerinfoequals <Player> part = vocals
				SoundEvent \{event = audio_ui_gameplay_ripple_up}
			endif
		endif
	else
		if NOT playerinfoequals <Player> part = vocals
			SoundEvent \{event = audio_ui_gameplay_ripple_up}
		endif
	endif
endscript

script audio_ui_play_unlock_item_sfx 
	SoundEvent \{event = audio_ui_song_complete_unlock_item}
endscript

script testtonesoundevent \{Type = Default}
	printf channel = sfx qs(0x7a0099b8) s = <Type>
	switch <Type>
		case guitar
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{testtones_guitar
			buss = Master}
		case bass
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{testtones_bass
			buss = Master}
		case kick
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{testtones_kickdrum
			buss = Master}
		case snare
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{testtones_snaredrum
			buss = Master}
		case tom
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{testtones_toms
			buss = Master}
		case cymbal
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{testtones_cymbals
			buss = Master}
		case vox
		printf \{channel = sfx
			qs(0x982ddb54)}
		PlaySound \{testtones_vocals
			buss = Master}
		case Band
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{testtones_band
			buss = Master}
		case Crowd
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{testtones_crowd
			buss = Master}
		default
		printf channel = sfx qs(0x7a0099b8) s = <Type>
	endswitch
endscript

script testtoneenterscript 
	setsoundbussparams {sfx_balance = {vol = (($default_BussSet.sfx_balance.vol) - 100)}}
endscript

script testtoneexitscript 
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)}}
endscript

script Audio_Sync_Test_Disable_Highway 
	disable_bg_viewport
	Change \{g_save_check_time_early = $check_time_early}
	Change \{g_save_check_time_late = $check_time_late}
	Change \{check_time_early = 1.0}
	Change \{check_time_late = 1.0}
endscript

script Audio_Sync_Test_Enable_Highway 
	enable_bg_viewport
	Change \{check_time_early = $g_save_check_time_early}
	Change \{check_time_late = $g_save_check_time_late}
endscript

script stars 
	printf \{channel = sfx
		qs(0x65278da5)}
	printf \{channel = sfx
		qs(0x65278da5)}
	printf \{channel = sfx
		qs(0x65278da5)}
	printf \{channel = sfx
		qs(0x65278da5)}
	printf \{channel = sfx
		qs(0x65278da5)}
endscript

script audio_gameplay_star_power_deployed_logic \{Player = 1}
	printf \{channel = sfx
		qs(0x1731e460)}
	getplayerinfo <Player> highway_position
	GetPakManCurrentName \{map = zones}
	printf channel = sfx qs(0x39116743) s = <highway_position>
	if NOT issoundplaying \{star_deployed_back}
		printf \{channel = sfx
			qs(0x33be8dbf)}
		if (<highway_position> = left)
			printf \{channel = sfx
				qs(0x0c362bcf)}
			SoundEvent \{event = audio_star_power_deployed_back_p1}
			SoundEvent \{event = audio_star_power_deployed_front_p1}
			SoundEvent \{event = audio_star_power_cheer_deployed_p1}
		else
			if (<highway_position> = right)
				printf \{channel = sfx
					qs(0xe7802ff6)}
				SoundEvent \{event = audio_star_power_deployed_back_p2}
				SoundEvent \{event = audio_star_power_deployed_front_p2}
				SoundEvent \{event = audio_star_power_cheer_deployed_p2}
			else
				printf \{channel = sfx
					qs(0x21730a2e)}
				SoundEvent \{event = audio_star_power_deployed_back_p3}
				SoundEvent \{event = audio_star_power_deployed_front_p3}
				SoundEvent \{event = audio_star_power_cheer_deployed_p3}
			endif
		endif
		printf \{channel = sfx
			qs(0x5c01b82f)}
		Change \{g_star_power_deployed_flag = 1}
		Wait \{0.9
			Seconds}
		printf \{channel = sfx
			qs(0x682127d4)}
		Change \{g_star_power_deployed_flag = 0}
	else
		printf \{channel = sfx
			qs(0x2ee2205e)}
		if ($g_star_power_deployed_flag = 1)
			printf \{channel = sfx
				qs(0x7320b431)}
			SetSoundParams \{star_deployed_front
				pan1x = -1
				pan1y = 1
				pan2x = 1
				pan2y = 1}
			SetSoundParams \{star_deployed_back
				pan1x = -1
				pan1y = 1
				pan2x = 1
				pan2y = -1}
			SetSoundParams \{sp_cheer1
				pan1x = -1
				pan1y = 1
				pan2x = 1
				pan2y = 1}
		else
			printf \{channel = sfx
				qs(0x5c49053a)}
			if (<highway_position> = left)
				printf \{channel = sfx
					qs(0x0c362bcf)}
				SoundEvent \{event = audio_star_power_deployed_back_p1}
				SoundEvent \{event = audio_star_power_deployed_front_p1}
				SoundEvent \{event = audio_star_power_cheer_deployed_p1}
			else
				if (<highway_position> = right)
					printf \{channel = sfx
						qs(0xe7802ff6)}
					SoundEvent \{event = audio_star_power_deployed_back_p2}
					SoundEvent \{event = audio_star_power_deployed_front_p2}
					SoundEvent \{event = audio_star_power_cheer_deployed_p2}
				else
					printf \{channel = sfx
						qs(0x21730a2e)}
					SoundEvent \{event = audio_star_power_deployed_back_p3}
					SoundEvent \{event = audio_star_power_deployed_front_p3}
					SoundEvent \{event = audio_star_power_cheer_deployed_p3}
				endif
			endif
		endif
	endif
endscript

script audio_gameplay_star_power_ready_logic \{Player = 1}
	getplayerinfo <Player> highway_position
	if NOT issoundplaying \{star_available}
		if (<highway_position> = left)
			SoundEvent \{event = audio_star_power_available_p1}
		elseif (<highway_position> = right)
			SoundEvent \{event = audio_star_power_available_p2}
		else
			SoundEvent \{event = audio_star_power_available_p3}
		endif
		Change \{g_star_power_ready_flag = 1}
		Wait \{0.9
			Second}
		Change \{g_star_power_ready_flag = 0}
	else
		if ($g_star_power_ready_flag = 1)
			SetSoundParams \{star_available
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				SoundEvent \{event = audio_star_power_available_p1}
			elseif (<highway_position> = right)
				SoundEvent \{event = audio_star_power_available_p2}
			else
				SoundEvent \{event = audio_star_power_available_p3}
			endif
		endif
	endif
endscript

script audio_gameplay_star_power_awarded_logic \{Player = 1}
	getplayerinfo <Player> highway_position
	if NOT issoundplaying \{sp_awarded1}
		if (<highway_position> = left)
			SoundEvent \{event = audio_star_power_awarded_p1}
		elseif (<highway_position> = right)
			SoundEvent \{event = audio_star_power_awarded_p2}
		else
			SoundEvent \{event = audio_star_power_awarded_p3}
		endif
		Change \{g_star_power_awarded_flag = 1}
		Wait \{0.3
			Second}
		Change \{g_star_power_awarded_flag = 0}
	else
		if ($g_star_power_awarded_flag = 1)
			SetSoundParams \{sp_awarded1
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				SoundEvent \{event = audio_star_power_awarded_p1}
			elseif (<highway_position> = right)
				SoundEvent \{event = audio_star_power_awarded_p2}
			else
				SoundEvent \{event = audio_star_power_awarded_p3}
			endif
		endif
	endif
endscript

script audio_gameplay_star_power_release_logic \{Player = 1}
	getplayerinfo <Player> highway_position
	if NOT issoundplaying \{star_release_front}
		if (<highway_position> = left)
			SoundEvent \{event = audio_star_power_release_front_p1}
		elseif (<highway_position> = right)
			SoundEvent \{event = audio_star_power_release_front_p2}
		else
			SoundEvent \{event = audio_star_power_release_front_p3}
		endif
		Change \{g_star_power_deployed_flag = 1}
		Wait \{0.9
			Second}
		Change \{g_star_power_deployed_flag = 0}
	else
		if ($g_star_power_deployed_flag = 1)
			SetSoundParams \{star_release_front
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
			SetSoundParams \{star_release_center
				pan1x = 0.2392232
				pan1y = 0.97096455}
		else
			if (<highway_position> = left)
				SoundEvent \{event = audio_star_power_release_front_p1}
			elseif (<highway_position> = right)
				SoundEvent \{event = audio_star_power_release_front_p2}
			else
				SoundEvent \{event = audio_star_power_release_front_p3}
			endif
		endif
	endif
endscript

script audio_crowd_fading_claps 
	Change \{g_clap_fade = 1}
	setsoundbussparams \{Crowd_Star_Power = {
			vol = -100
		}
		time = 5}
	Wait \{5
		Seconds}
	Change \{g_clap_fade = 0}
	Change \{g_star_clap_left = 0}
	Change \{g_star_clap_right = 0}
	Change \{g_star_clap_left_middle = 0}
	Change \{g_star_clap_right_middle = 0}
	Change \{g_star_clap_middle = 0}
	Change \{g_star_clap_normal = 0}
	StopSoundsByBuss \{Crowd_Star_Power}
	setsoundbussparams {Crowd_Star_Power = {vol = ($default_BussSet.Crowd_Star_Power.vol)} time = 0.1}
endscript

script audio_crowd_kill_clap_fade 
	KillSpawnedScript \{Name = audio_crowd_fading_claps}
	setsoundbussparams {Crowd_Star_Power = {vol = ($default_BussSet.Crowd_Star_Power.vol)} time = 0.1}
endscript

script audio_crowd_star_power_clap_panning \{Player = 1}
	if NOT isSinglePlayerGame
		getplayerinfo <Player> highway_position
		if (<highway_position> = left)
			Change \{g_star_clap_left = 1}
			Change \{g_star_clap_right = 0}
			Change \{g_star_clap_left_middle = 0}
			Change \{g_star_clap_right_middle = 0}
			Change \{g_star_clap_middle = 0}
			Change \{g_star_clap_normal = 0}
			Change \{g_star_clap_leftcenterright = 0}
		elseif (<highway_position> = right)
			Change \{g_star_clap_right = 1}
			Change \{g_star_clap_left = 0}
			Change \{g_star_clap_left_middle = 0}
			Change \{g_star_clap_right_middle = 0}
			Change \{g_star_clap_middle = 0}
			Change \{g_star_clap_normal = 0}
			Change \{g_star_clap_leftcenterright = 0}
		else
			Change \{g_star_clap_middle = 1}
			Change \{g_star_clap_left = 0}
			Change \{g_star_clap_right = 0}
			Change \{g_star_clap_left_middle = 0}
			Change \{g_star_clap_right_middle = 0}
			Change \{g_star_clap_normal = 0}
			Change \{g_star_clap_leftcenterright = 0}
		endif
	else
		Change \{g_star_clap_normal = 1}
		Change \{g_star_clap_left = 0}
		Change \{g_star_clap_right = 0}
		Change \{g_star_clap_left_middle = 0}
		Change \{g_star_clap_right_middle = 0}
		Change \{g_star_clap_middle = 0}
		Change \{g_star_clap_leftcenterright = 0}
	endif
endscript

script audio_crowd_star_power_clap_panning_multiple \{Player = 1}
	printf \{channel = sfx
		qs(0xea38b5f9)}
	if NOT isSinglePlayerGame
		printf \{channel = sfx
			qs(0x7bf0f48c)}
		getplayerinfo <Player> highway_position
		printf channel = sfx qs(0x197ff74a) s = <highway_position>
		if (<highway_position> = left)
			if (($g_star_clap_right = 1))
				Change \{g_star_clap_normal = 1}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_right_middle = 1)
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 1}
			elseif ($g_star_clap_middle = 1)
				Change \{g_star_clap_left_middle = 1}
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			endif
		elseif (<highway_position> = right)
			if (($g_star_clap_left = 1))
				Change \{g_star_clap_normal = 1}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_left_middle = 1)
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 1}
			elseif ($g_star_clap_middle = 1)
				Change \{g_star_clap_right_middle = 1}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			endif
		else
			if ($g_star_clap_left = 1)
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 1}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_right = 1)
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 1}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_normal = 1)
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 1}
			endif
		endif
	endif
	printf \{channel = sfx
		qs(0xfdcf6710)
		s = $g_star_clap_normal}
	printf \{channel = sfx
		qs(0xaedfda0e)
		s = $g_star_clap_left}
	printf \{channel = sfx
		qs(0x4f47b92a)
		s = $g_star_clap_right}
	printf \{channel = sfx
		qs(0xa2917e49)
		s = $g_star_clap_left_middle}
	printf \{channel = sfx
		qs(0x4908b79f)
		s = $g_star_clap_right_middle}
	printf \{channel = sfx
		qs(0x9763f30c)
		s = $g_star_clap_middle}
	printf \{channel = sfx
		qs(0xe401e016)
		s = $g_star_clap_leftcenterright}
	printf \{channel = sfx
		qs(0x40f32e2c)}
endscript

script audio_crowd_end_star_clap \{Player = 1}
	if NOT isSinglePlayerGame
		getplayerinfo <Player> highway_position
		if (<highway_position> = left)
			if (($g_star_clap_left_middle = 1))
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 1}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_normal = 1)
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 1}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_leftcenterright = 1)
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_right_middle = 1}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			endif
		elseif (<highway_position> = right)
			if (($g_star_clap_right_middle = 1))
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 1}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_normal = 1)
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 1}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_leftcenterright = 1)
				Change \{g_star_clap_left_middle = 1}
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			endif
		else
			if ($g_star_clap_left_middle = 1)
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 1}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_right_middle = 1)
				Change \{g_star_clap_normal = 0}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 1}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_leftcenterright = 1)
				Change \{g_star_clap_normal = 1}
				Change \{g_star_clap_left = 0}
				Change \{g_star_clap_right = 0}
				Change \{g_star_clap_left_middle = 0}
				Change \{g_star_clap_right_middle = 0}
				Change \{g_star_clap_middle = 0}
				Change \{g_star_clap_leftcenterright = 0}
			endif
		endif
	endif
endscript

script audio_jam_play_metronome_sfx 
	setspawnedscriptnorepeatfor \{time = 0.1}
	SetSpawnInstanceLimits \{Max = 2
		management = kill_oldest}
	if GotParam \{downbeat}
		if (<downbeat> = 1)
			PlaySound StickClickMed buss = Practice_Band_Playback vol = RandomFloat (12.5, 13.0)
		endif
	else
		PlaySound StickClickMed buss = Practice_Band_Playback vol = RandomFloat (7.5, 8.0)
	endif
endscript

script audio_ui_menu_music_se 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{channel = sfx
		qs(0x44f09774)}
	GetArraySize \{$menu_music_songs}
	begin
	GetRandomValue Name = index integer a = 0 b = (<array_Size> -1)
	if NOT (<index> = $g_menu_music_last_song_index)
		if NOT (<index> = $g_menu_music_last_last_song_index)
			if NOT (<index> = $g_menu_music_last_last_last_song_index)
				if NOT (<index> = $g_menu_music_last_last_last_last_song_index)
					Change \{g_menu_music_last_last_last_last_song_index = $g_menu_music_last_song_index}
					Change \{g_menu_music_last_last_last_song_index = $g_menu_music_last_song_index}
					Change \{g_menu_music_last_last_song_index = $g_menu_music_last_song_index}
					Change g_menu_music_last_song_index = <index>
					break
				endif
			endif
		endif
	endif
	repeat
	Stream = ($menu_music_songs [<index>].Stream)
	array = ($menu_music_songs [<index>].array)
	delay = ($menu_music_songs [<index>].delay)
	offset = ($menu_music_songs [<index>].offset)
	vol = ($menu_music_songs [<index>].vol)
	if ($g_menu_music_map_screen = 1)
		printf \{channel = sfx
			qs(0xe911e28a)}
		KillSpawnedScript \{Name = stop_menu_ambience_then_kill_spawned_script}
		printf \{channel = sfx
			qs(0xd998edbc)}
		KillSpawnedScript \{Name = audio_ui_menu_ambience_sfx_spawn}
		printf \{channel = sfx
			qs(0xd4dd7ef6)}
		SpawnScriptNow \{audio_ui_menu_ambience_sfx_spawn}
		if ($g_menu_music_ambient_hack = 1)
			<Stream> = Random (
				@ gh6_menu_music_proto_1
				@*2 gh6_menu_music_proto_2
				@*2 gh6_menu_music_proto_3
				@*2 gh6_menu_music_proto_4
				@*2 gh6_menu_music_proto_5
				)
			printf channel = sfx qs(0xa29f6899) s = <Stream>
			Change \{g_menu_music_ambient_hack = 0}
		else
			<Stream> = gh6_menu_music_proto_1
		endif
		switch <Stream>
			case gh6_menu_music_proto_1
			vol = 9.5
			case gh6_menu_music_proto_2
			vol = 9.5
			case gh6_menu_music_proto_3
			vol = 9.5
			case gh6_menu_music_proto_4
			vol = 9.5
			case gh6_menu_music_proto_5
			vol = 9.5
			default
			vol = 9.5
			printf \{channel = sfx
				qs(0xf7a4910c)}
		endswitch
	else
		audio_ui_kill_menu_ambience_sfx
	endif
	if ($g_menu_music_band_select_screen = 1)
		audio_ui_kill_menu_ambience_sfx
		<Stream> = fb_power_select_screen_music
		vol = -6
	endif
	SpawnScriptNow audio_ui_menu_music_se_spawned params = {Stream = <Stream> array = <array> delay = <delay> vol = <vol> offset = <offset>}
endscript

script audio_ui_menu_music_se_spawned \{vol = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Change \{g_menu_music_preloading = 1}
	Change g_menu_music_stream = <Stream>
	PreloadStream <Stream>
	begin
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	StartPreLoadedStream <unique_id> buss = Music_FrontEnd forcesafepreload = 1 vol = (<vol> + 3) pan1x = -1 pan1y = 0.7 pan2x = 1 pan2y = 0.7
	Change \{g_menu_music_preloading = 0}
	Change g_current_menu_song = <Stream>
	if GlobalExists Name = <array> Type = array
		if (<delay> > 0.0)
			Wait <delay> Seconds
		endif
		GetArraySize $<array>
		index = 0
		GetStartTime
		<starttime> = (<starttime> + <offset>)
		pulse = 1
		begin
		begin
		getelapsedtime starttime = <starttime>
		if (<ElapsedTime> >= $<array> [<index>])
			break
		endif
		Wait \{1
			gameframe}
		repeat
		formatText checksumName = event 'frontend_speaker_pulse%d' d = <pulse>
		broadcastevent Type = <event>
		<pulse> = (3 - <pulse>)
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
endscript

script audio_ui_kill_menu_music 
	printf \{channel = sfx
		qs(0x1ec63c36)}
	KillSpawnedScript \{Name = audio_ui_menu_music_se_spawned}
	Change \{g_menu_music_preloading = 0}
	stopsound \{$g_menu_music_stream
		fade_time = 1.0
		fade_type = linear}
	audio_ui_kill_menu_ambience_sfx
endscript

script audio_ui_enter_quest_map 
	Change \{g_menu_music_map_screen = 1}
	Change \{g_menu_music_ambient_hack = 1}
	audio_ui_menu_music_off
endscript

script audio_ui_exit_quest_map 
	printf \{channel = sfx
		qs(0x075fb6f3)}
	Change \{g_menu_music_map_screen = 0}
	Change \{g_menu_music_ambient_hack = 0}
	audio_ui_menu_music_off
	audio_ui_menu_music_on
endscript

script audio_ui_enter_band_select 
	printf \{channel = sfx
		qs(0xec055e5d)}
	Change \{g_menu_music_band_select_screen = 1}
	audio_ui_menu_music_off
	audio_ui_menu_music_on
endscript

script audio_ui_exit_band_select 
	printf \{channel = sfx
		qs(0x7ec15a74)}
	Change \{g_menu_music_band_select_screen = 0}
	audio_ui_menu_music_off
	audio_ui_menu_music_on
endscript

script audio_ui_menu_ambience_sfx_spawn 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	Wait RandomNoRepeat (@ 8.0 @ 8.5 @ 9.0 @ 9.5 @ 10.0 )Seconds
	SoundEvent \{event = audio_ui_main_menu_ambience}
	repeat
endscript

script stop_menu_ambience_then_kill_spawned_script 
	printf \{channel = sfx
		qs(0xed430806)}
	StopSoundEvent \{audio_ui_main_menu_ambience
		fade_time = 0.7
		fade_type = log_slow}
	Wait \{0.7
		Seconds}
	printf \{channel = sfx
		qs(0xe8e4ad76)}
	KillSpawnedScript \{Name = audio_ui_menu_ambience_sfx_spawn}
endscript

script audio_ui_kill_menu_ambience_sfx 
	SpawnScriptNow \{stop_menu_ambience_then_kill_spawned_script}
endscript

script audio_crowd_anticipation_logic 
	gamemode_gettype
	if NOT ((<Type> = freeplay) || (<Type> = tutorial) || $in_sing_a_long = true)
		if ($current_crowd >= 1.3399999)
			if issoundplaying \{$g_current_crowd_anticipation}
				if ($g_crowd_anticipation_flag = 0)
					stopsound \{$g_current_crowd_anticipation
						fade_time = 3
						fade_type = log_slow}
					SpawnScriptNow \{audio_crowd_anticipation_flag_logic}
				endif
			endif
		elseif ($current_crowd >= 1.3)
			if issoundplaying \{$g_current_crowd_anticipation}
				if ($g_crowd_anticipation_flag = 0)
					SetSoundParams \{$g_current_crowd_anticipation
						vol = 3
						pitch = 0.3
						time = 0.5}
				endif
			else
				PlaySound \{$g_current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					Priority = 100
					buss = Crowd_Beds
					attack_length = 3
					decay_length = 0
					release_length = 0
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2700001)
			if issoundplaying \{$g_current_crowd_anticipation}
				if ($g_crowd_anticipation_flag = 0)
					SetSoundParams \{$g_current_crowd_anticipation
						vol = 1
						pitch = 0.2
						time = 0.5}
				endif
			else
				PlaySound \{$g_current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					Priority = 100
					buss = Crowd_Beds
					attack_length = 3
					decay_length = 0
					release_length = 0
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.25)
			if issoundplaying \{$g_current_crowd_anticipation}
				if ($g_crowd_anticipation_flag = 0)
					SetSoundParams \{$g_current_crowd_anticipation
						vol = -1
						pitch = 0.1
						time = 0.5}
				endif
			else
				PlaySound \{$g_current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					Priority = 100
					buss = Crowd_Beds
					attack_length = 3
					decay_length = 0
					release_length = 0
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2)
			if NOT issoundplaying \{$g_current_crowd_anticipation}
				if ($g_crowd_anticipation_flag = 0)
					PlaySound \{$g_current_crowd_anticipation
						vol = -3
						pan1x = 0
						pan1y = 0.59
						panremovecenter = true
						Priority = 100
						buss = Crowd_Beds
						attack_length = 3
						decay_length = 0
						release_length = 0
						attack_function = log_fast
						num_loops = -1}
				endif
			else
				SetSoundParams \{$g_current_crowd_anticipation
					vol = -3
					time = 0.5}
			endif
		else
			if issoundplaying \{$g_current_crowd_anticipation}
				if ($g_crowd_anticipation_flag = 0)
					stopsound \{$g_current_crowd_anticipation
						fade_time = 3
						fade_type = log_slow}
					SpawnScriptNow \{audio_crowd_anticipation_flag_logic}
				endif
			endif
		endif
	endif
endscript

script audio_crowd_anticipation_flag_logic 
endscript

script audio_crowd_kill_surging_scripts 
	Wait \{2
		Seconds}
	KillSpawnedScript \{Name = audio_crowd_play_one_shots_between_songs}
	KillSpawnedScript \{Name = audio_crowd_play_surge_between_songs}
endscript

script audio_crowd_play_surge_after_explosion 
	Wait \{2
		Seconds}
	SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
endscript

script audio_crowd_play_cheer_before_explosion 
	Wait \{1
		Second}
	SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
endscript

script audio_ui_play_colorwheel_up_down_sfx 
	printstruct <...>
	if GotParam \{current_ring}
		switch <current_ring>
			case 1
			SoundEvent \{event = audio_ui_car_colorwheel_highlight_1}
			case 2
			SoundEvent \{event = audio_ui_car_colorwheel_highlight_2}
			case 3
			SoundEvent \{event = audio_ui_car_colorwheel_highlight_3}
			case 4
			SoundEvent \{event = audio_ui_car_colorwheel_highlight_4}
			case 5
			SoundEvent \{event = audio_ui_car_colorwheel_highlight_5}
		endswitch
	endif
endscript

script audio_crowd_play_loading_screen_swell 
endscript

script audio_crowd_loading_whistle 
endscript

script audio_null_sound 
endscript

script audio_ui_jam_play_ghtunes_scroll_sfx 
	SoundEvent \{event = audio_ui_ghtunes_scroll}
endscript

script audio_animevent_play_win_lose_sound \{skip = 0}
	Obj_GetID
	i = 1
	if NOT ($g_dont_play_win_anim_sfx = 1)
		begin
		if playerinfoequals <i> band_member = <objID>
			getplayerinfo <i> part
			skip = 1
			break
		endif
		i = (<i> + 1)
		repeat 5
		if NOT (<skip> = 1)
			switch <objID>
				case GUITARIST
				part = guitar
				case BASSIST
				part = bass
				case vocalist
				part = vocals
				case drummer
				part = drum
				default
				part = guitar
			endswitch
		endif
		playlist_getcurrentsong
		part = <part>
		printf channel = sfx qs(0xafa59a93) s = <part>
		GetPakManCurrent \{map = zones}
		if GotParam \{event}
			switch <event>
				case mic_feedback
				SoundEvent \{event = audio_winloseanims_mic_feedback}
				case mic_grab
				SoundEvent \{event = audio_winloseanims_mic_grab}
				case mic_hit
				SoundEvent \{event = audio_winloseanims_mic_hit}
				case drummer_sticks_throw
				SoundEvent \{event = audio_winloseanims_sticks_throw}
				case large_smash
				if GotParam \{part}
					switch <part>
						case bass
						SoundEvent \{event = audio_winloseanims_large_bass_smash}
						case guitar
						SoundEvent \{event = audio_winloseanims_large_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case medium_smash
				if GotParam \{part}
					switch <part>
						case bass
						SoundEvent \{event = audio_winloseanims_medium_bass_smash}
						case guitar
						SoundEvent \{event = audio_winloseanims_medium_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case small_smash
				if GotParam \{part}
					switch <part>
						case bass
						SoundEvent \{event = audio_winloseanims_small_bass_smash}
						case guitar
						SoundEvent \{event = audio_winloseanims_small_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case drummer_tom_hit
				SoundEvent \{event = audio_winloseanims_tom_hit}
				case drummer_snare_hit
				SoundEvent \{event = audio_winloseanims_snare_hit}
				default
				printf \{channel = sfx
					qs(0xc0f17fb8)}
			endswitch
		endif
	endif
endscript

script audio_gameplay_counter_play_beep_spawn 
	count_x = 0.91999996
	count_y = 0
	count_z = 1
	count_a = 0.91999996
	if (<time> > 10)
		begin
		SoundEvent \{event = gameplay_vote_countdown}
		Wait \{1
			Seconds}
		repeat (<time> -10)
	endif
	if (<time> < 10)
		begin
		if (<count_z> > (10 - <time>))
			break
		endif
		count_y = (<count_y> + 1)
		count_z = (<count_z> + <count_a>)
		count_a = (<count_a> * 0.91999996)
		repeat
		begin
		count_x = (<count_x> * 0.82)
		repeat <count_y>
	endif
	begin
	SoundEvent \{event = gameplay_vote_countdown}
	Wait (0.07 + <count_x>) Seconds
	count_x = (<count_x> * 0.85)
	repeat
endscript

script audio_gameplay_vocal_sidechain 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf channel = sfx qs(0xc4a9a039) s = <Player>
	Change \{g_stop_vocal_sidechain = 0}
	g_global_rms_value = 0
	begin
	if ($g_stop_vocal_sidechain = 1)
		break
	endif
	if NOT ScriptIsRunning \{fretbar_update_tempo}
		break
	endif
	vocals_getcuramplitude Player = <Player>
	if GotParam \{current_amplitude}
		Change g_global_rms_value = (($g_global_rms_value + <current_amplitude>) / 2)
		if ($g_global_rms_value < 0.5)
			setsoundbussparams {vocals_balance = {vol = ($default_BussSet.vocals_balance.vol)} time = 0.1}
		elseif ($g_global_rms_value < 1.0)
			setsoundbussparams \{vocals_balance = {
					vol = 0
				}
				time = 0.1}
		elseif ($g_global_rms_value < 1.3)
			setvol = ($g_sidechaining_volume_percent_adjustment * -2.5)
			setsoundbussparams {vocals_balance = {vol = <setvol>} time = 0.1}
		elseif ($g_global_rms_value < 1.5)
			setvol = ($g_sidechaining_volume_percent_adjustment * -3.75)
			setsoundbussparams {vocals_balance = {vol = <setvol>} time = 0.1}
		else
			setvol = ($g_sidechaining_volume_percent_adjustment * -5.0)
			setsoundbussparams {vocals_balance = {vol = <setvol>} time = 0.1}
		endif
	endif
	Wait \{3
		gameframe}
	repeat
endscript

script audio_gameplay_vocal_sidechain_logic 
	if (<muting> = FALSE)
		Change \{g_stop_vocal_sidechain = 0}
		getnumplayersingame \{on_screen}
		num_vocals = 0
		if (<num_players_shown> > 1)
			getplayerinfo \{1
				part}
			if (<part> = vocals)
				num_vocals = (<num_vocals> + 1)
			endif
			getplayerinfo \{2
				part}
			if (<part> = vocals)
				num_vocals = (<num_vocals> + 1)
			endif
			getplayerinfo \{3
				part}
			if (<part> = vocals)
				num_vocals = (<num_vocals> + 1)
			endif
			getplayerinfo \{4
				part}
			if (<part> = vocals)
				num_vocals = (<num_vocals> + 1)
			endif
			if (<num_vocals> > 1)
				if ScriptIsRunning \{audio_gameplay_vocal_sidechain}
					KillSpawnedScript \{Name = audio_gameplay_vocal_sidechain}
				endif
			else
				SpawnScriptNow audio_gameplay_vocal_sidechain params = {Player = <Player>}
			endif
		else
			SpawnScriptNow audio_gameplay_vocal_sidechain params = {Player = <Player>}
			SpawnScriptNow audio_gameplay_detect_phoneme params = {Player = <Player>}
		endif
	else
		Change \{g_stop_vocal_sidechain = 1}
	endif
endscript

script audio_effects_set_effects_by_venue_type \{time = 1}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'nothing'
	endif
	printf channel = sfx qs(0x817bfec0) s = <pakname>
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		printf \{channel = sfx
			qs(0x40b15020)}
		switch <venuesize>
			case 'Large_EXT'
			setsoundbusseffects effects = [{Name = venueverb $large_ext_reverb}] time = <time>
			case 'Large_INT'
			setsoundbusseffects effects = [{Name = venueverb $large_int_reverb}] time = <time>
			case 'Medium_INT'
			setsoundbusseffects effects = [{Name = venueverb $medium_int_reverb}] time = <time>
			case 'Medium_EXT'
			setsoundbusseffects effects = [{Name = venueverb $medium_ext_reverb}] time = <time>
			case 'Small_INT'
			setsoundbusseffects effects = [{Name = venueverb $small_int_reverb}] time = <time>
			case 'Small_EXT'
			setsoundbusseffects effects = [{Name = venueverb $small_ext_reverb}] time = <time>
			default
			setsoundbusseffects effects = [{Name = venueverb $medium_int_reverb}] time = <time>
		endswitch
	else
		printf \{channel = sfx
			qs(0xc391b4fa)}
		setsoundbusseffects effects = [{Name = venueverb $no_crowd_reverb}] time = <time>
	endif
endscript

script audio_ui_outro_stars_logic 
	Stream = None
	vol = 0
	wait_time = 0
	switch <num_stars>
		case 1
		Stream = outro_one_star
		vol = -3.5
		wait_time = 0
		case 2
		Stream = outro_two_stars
		vol = -3.5
		wait_time = 0.1
		case 3
		Stream = outro_three_stars
		vol = -3.5
		wait_time = 0.03
		case 4
		Stream = outro_four_stars
		vol = -3.5
		wait_time = 0.08
		case 5
		Stream = outro_five_stars
		vol = -3.5
		wait_time = 0.08
		case 6
		Stream = outro_six_stars
		vol = -2.5
		wait_time = 0.15
		default
		Stream = outro_one_star
		vol = -3.5
	endswitch
	PreloadStream <Stream>
	begin
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	SpawnScriptNow audio_ui_spawning_outro_stars params = {<...>}
endscript

script audio_ui_spawning_outro_stars 
	Wait <wait_time> Seconds
	printf channel = sfx qs(0x9231b06a) s = <vol>
	StartPreLoadedStream <unique_id> buss = Front_End forcesafepreload = 1 vol = <vol>
endscript

script audio_ui_kill_outro_stars 
	KillSpawnedScript \{Name = audio_ui_spawning_outro_stars}
	stopsound \{outro_one_star}
	stopsound \{outro_two_stars}
	stopsound \{outro_three_stars}
	stopsound \{outro_four_stars}
	stopsound \{outro_five_stars}
	stopsound \{outro_six_stars}
endscript

script audio_song_break_down_whoosh \{whoosh = 1
		delay = 0.0}
	Wait <delay> Seconds
	switch <whoosh>
		case 1
		PlaySound \{song_break_down_whoosh_01
			vol = -3.0
			buss = Front_End}
		case 2
		PlaySound \{song_break_down_whoosh_02
			vol = -5.0
			buss = Front_End}
		default
		printf \{channel = sfx
			qs(0xa711cb5d)}
	endswitch
endscript

script audio_crowd_kill_only_one_shots 
	One_Shot_SoundEvent \{SoundEvent = audio_crowd_oneshots_do_nothing}
endscript

script audio_ui_gameplay_play_camera_win_sfx 
	SoundEvent \{event = audio_ui_song_complete_camera_movement}
	SoundEvent \{event = endofsong_camera_cheer}
endscript

script audio_crowd_play_swells_during_stats_screen 
endscript

script audio_ui_kill_menu_music_slowly 
	KillSpawnedScript \{Name = audio_ui_menu_music_on}
	KillSpawnedScript \{Name = audio_ui_menu_music_on_spawned}
	Change \{g_menu_music_on_flag = 0}
	KillSpawnedScript \{Name = audio_ui_menu_music_se}
	KillSpawnedScript \{Name = audio_ui_menu_music_se_spawned}
	Change \{g_menu_music_preloading = 0}
	stopsound \{$g_menu_music_stream
		fade_time = 2.4
		fade_type = linear}
endscript

script audio_cutscene_get_vol_tweak_of_preloaded_stream \{streamname = Default}
	printf channel = sfx qs(0xb3b9039e) t = <streamname>
	switch <streamname>
		case z_cairo_intro
		volumetweak = 0.0
		case z_mexicocity_intro
		volumetweak = -3.0
		case z_subway_intro
		volumetweak = -2.0
		case z_cairo_encore
		volumetweak = -5.0
		case z_mexicocity_encore
		volumetweak = -4.0
		case z_subway_encore
		volumetweak = -3.0
		case z_mexicocity_celebintro
		volumetweak = 0.0
		case rush_01
		case rush_02
		case rush_03
		case rush_04
		case rush_05
		volumetweak = 3.0
		case rush_06
		volumetweak = -100.0
		case 'Newmale_Outro'
		case 'Judy_Outro'
		case 'Newgirl_Outro'
		case 'Johnny_Outro'
		case 'Rush_Outro'
		case 'Pandora_Outro'
		case 'Lars_Outro'
		case 'Casey_Outro'
		case 'Axel_Outro'
		case 'Map_Intro'
		case 'Map_Unlock_2nd_Tier'
		case 'Map_Unlock_Rush'
		case 'Map_Unlock_3rd_Tier'
		case 'Map_FB_Intro'
		case 'Map_Unlock_Demigod'
		case 'FB_Outro'
		case 'Map_FB_Outro'
		case 'Map_Demigod_Complete'
		case 'Johnny_Outro_Generic'
		case 'Newgirl_Outro_Generic'
		case 'Newgirl_Outro'
		case 'Johnny_Outro'
		volumetweak = 5
		case 'Map_Unlock_2nd_Tier'
		Wait \{1
			Second}
		volumetweak = 5
		default
		volumetweak = -3
		printf channel = sfx qs(0x92919cd1) s = <volumetweak>
	endswitch
	printf channel = sfx qs(0x40a231ed) s = <volumetweak>
	return volumetweak = <volumetweak>
endscript

script audio_ui_gameplay_play_you_rock_sfx 
	SoundEvent \{event = you_rock_front}
	SoundEvent \{event = you_rock_back}
	Wait \{2
		Seconds}
	SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
	SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
	SoundEvent \{event = $g_current_crowd_applause_soundevent}
endscript

script audio_crowd_fail_song_logic 
	sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
		fadeintime = 10
		fadeintype = linear
		fadeouttime = 10
		fadeouttype = linear}
	SpawnScriptNow \{audio_crowd_neutral_crowd_wait_to_lower_stats}
	printf \{channel = sfx
		qs(0x85e2e392)}
	SpawnScriptNow \{audio_crowd_play_swells_during_stats_screen}
endscript

script audio_crowd_play_surge_from_main_menu_to_freeplay 
	Wait \{1
		Seconds}
	SoundEvent \{event = surge_from_main_to_freeplay}
endscript

script audio_crowd_play_intro_applause_and_swell 
	GetPakManCurrentName \{map = zones}
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		gamemode_gettype
		if NOT (<Type> = freeplay || $calibrate_lag_enabled = 1)
			SoundEvent \{event = $g_current_crowd_applause_soundevent}
			SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
			if issoundplaying \{silence_front_end_crowd_loop_ft}
				if ((<Type> = competitive))
					printf \{channel = sfx
						qs(0xbb0943e2)}
					sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good
						fadeintime = 2.0
						fadeintype = linear
						fadeouttime = 2
						fadeouttype = linear}
					One_Shot_SoundEvent \{SoundEvent = $g_current_crowd_oneshot_positive_soundevent
						waitTime = 5}
				else
					sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
						fadeintime = 2.0
						fadeintype = linear
						fadeouttime = 2
						fadeouttype = linear}
					One_Shot_SoundEvent \{SoundEvent = $g_current_crowd_oneshot_positive_soundevent
						waitTime = 5}
				endif
			endif
		endif
	endif
endscript

script audio_practice_fade_in_drums 
	setsoundbussparams {practicemode_drums = {vol = (($default_BussSet.practicemode_drums.vol) - 100)}}
	Wait \{3.5
		Seconds}
	setsoundbussparams {practicemode_drums = {vol = (($default_BussSet.practicemode_drums.vol))} time = 3.5}
endscript

script audio_practice_fade_out_drums 
	setsoundbussparams {practicemode_drums = {vol = (($default_BussSet.practicemode_drums.vol) - 100)} time = 2.0}
endscript

script audio_crowd_neutral_crowd_wait_to_lower_stats 
	setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) -20) pitch = 0.0} time = 7}
endscript

script audio_gameplay_crowd_stop_all_paused_sounds 
	printf \{channel = sfx
		qs(0xab4a5e0f)}
	stopsound \{silence_front_end_crowd_loop_ft}
	stopsound \{sm_int_crowd_anticipation_loop}
	stopsound \{sm_int_crowd_negative_loop_bk}
	stopsound \{sm_int_crowd_negative_loop_ft}
	stopsound \{sm_int_crowd_neutral_loop_bk}
	stopsound \{sm_int_crowd_neutral_loop_ft}
	stopsound \{sm_int_crowd_positive_loop_bk}
	stopsound \{sm_int_crowd_positive_loop_ft}
	stopsound \{sm_int_crowd_applause}
	stopsound \{sm_int_crowd_swell_lg}
	stopsound \{sm_int_crowd_swell_lg_02}
	stopsound \{sm_int_crowd_swell_md}
	stopsound \{sm_int_crowd_swell_md_02}
	stopsound \{sm_int_crowd_swell_md_03}
	stopsound \{sm_int_crowd_swell_sh}
	stopsound \{sm_int_crowd_swell_sh_02}
	stopsound \{sm_int_crowd_swell_sh_03}
	stopsound \{sm_crowd_negative_to_neutral}
	stopsound \{sm_crowd_neutral_to_negative}
	stopsound \{sm_crowd_neutral_to_positive}
	stopsound \{sm_crowd_positive_to_neutral}
	stopsound \{sm_ext_crowd_anticipation_loop}
	stopsound \{sm_ext_crowd_negative_loop_bk}
	stopsound \{sm_ext_crowd_negative_loop_ft}
	stopsound \{sm_ext_crowd_neutral_loop_bk}
	stopsound \{sm_ext_crowd_neutral_loop_ft}
	stopsound \{sm_ext_crowd_positive_loop_bk}
	stopsound \{sm_ext_crowd_positive_loop_ft}
	stopsound \{sm_ext_crowd_applause}
	stopsound \{sm_ext_crowd_swell_lg}
	stopsound \{sm_ext_crowd_swell_md}
	stopsound \{sm_ext_crowd_swell_sh}
	stopsound \{md_int_crowd_anticipation_loop}
	stopsound \{md_int_crowd_negative_loop_bk}
	stopsound \{md_int_crowd_negative_loop_ft}
	stopsound \{md_int_crowd_neutral_loop_bk}
	stopsound \{md_int_crowd_neutral_loop_ft}
	stopsound \{md_int_crowd_positive_loop_bk}
	stopsound \{md_int_crowd_positive_loop_ft}
	stopsound \{int_md_crowd_applause}
	stopsound \{int_md_crowd_swell_lg}
	stopsound \{int_md_crowd_swell_md}
	stopsound \{int_md_crowd_swell_sh}
	stopsound \{md_int_crowd_applause}
	stopsound \{md_int_crowd_swell_lg}
	stopsound \{md_int_crowd_swell_lg_02}
	stopsound \{md_int_crowd_swell_md}
	stopsound \{md_int_crowd_swell_md_02}
	stopsound \{md_int_crowd_swell_md_03}
	stopsound \{md_int_crowd_swell_sh}
	stopsound \{md_int_crowd_swell_sh_02}
	stopsound \{md_int_crowd_swell_sh_03}
	stopsound \{md_crowd_negative_to_neutral}
	stopsound \{md_crowd_neutral_to_negative}
	stopsound \{md_crowd_neutral_to_positive}
	stopsound \{md_crowd_positive_to_neutral}
	stopsound \{ext_md_crowd_anticipation_loop}
	stopsound \{ext_md_crowd_bad_loop_bk}
	stopsound \{ext_md_crowd_bad_loop_ft}
	stopsound \{ext_md_crowd_good_loop_bk}
	stopsound \{ext_md_crowd_good_loop_ft}
	stopsound \{ext_md_crowd_neutral_loop_bk}
	stopsound \{ext_md_crowd_neutral_loop_ft}
	stopsound \{md_ext_crowd_anticipation_loop}
	stopsound \{md_ext_crowd_negative_loop_bk}
	stopsound \{md_ext_crowd_negative_loop_ft}
	stopsound \{md_ext_crowd_neutral_loop_bk}
	stopsound \{md_ext_crowd_neutral_loop_ft}
	stopsound \{md_ext_crowd_positive_loop_bk}
	stopsound \{md_ext_crowd_positive_loop_ft}
	stopsound \{md_ext_crowd_applause}
	stopsound \{md_ext_crowd_swell_lg}
	stopsound \{md_ext_crowd_swell_lg_02}
	stopsound \{md_ext_crowd_swell_md}
	stopsound \{md_ext_crowd_swell_md_02}
	stopsound \{md_ext_crowd_swell_md_03}
	stopsound \{md_ext_crowd_swell_sh}
	stopsound \{md_ext_crowd_swell_sh_02}
	stopsound \{md_ext_crowd_swell_sh_03}
	stopsound \{lg_int_crowd_anticipation_loop}
	stopsound \{lg_int_crowd_negative_loop_bk}
	stopsound \{lg_int_crowd_negative_loop_ft}
	stopsound \{lg_int_crowd_neutral_loop_bk}
	stopsound \{lg_int_crowd_neutral_loop_ft}
	stopsound \{lg_int_crowd_positive_loop_bk}
	stopsound \{lg_int_crowd_positive_loop_ft}
	stopsound \{lg_int_crowd_applause}
	stopsound \{lg_int_crowd_swell_lg}
	stopsound \{lg_int_crowd_swell_md}
	stopsound \{lg_int_crowd_swell_sh}
	stopsound \{lg_crowd_negative_to_neutral}
	stopsound \{lg_crowd_neutral_to_negative}
	stopsound \{lg_crowd_neutral_to_positive}
	stopsound \{lg_crowd_positive_to_neutral}
	stopsound \{lg_ext_crowd_anticipation_loop}
	stopsound \{lg_ext_crowd_negative_loop_bk}
	stopsound \{lg_ext_crowd_negative_loop_ft}
	stopsound \{lg_ext_crowd_neutral_loop_bk}
	stopsound \{lg_ext_crowd_neutral_loop_ft}
	stopsound \{lg_ext_crowd_positive_loop_bk}
	stopsound \{lg_ext_crowd_positive_loop_ft}
	stopsound \{tool_crowd_loop_ft}
	stopsound \{lg_ext_crowd_applause}
	stopsound \{lg_ext_crowd_swell_lg}
	stopsound \{lg_ext_crowd_swell_lg_02}
	stopsound \{lg_ext_crowd_swell_md}
	stopsound \{lg_ext_crowd_swell_md_02}
	stopsound \{lg_ext_crowd_swell_md_03}
	stopsound \{lg_ext_crowd_swell_sh}
	stopsound \{lg_ext_crowd_swell_sh_02}
	stopsound \{lg_ext_crowd_swell_sh_03}
	StopSoundEvent \{audio_crowd_lg_ext_oneshot_positive}
	StopSoundEvent \{audio_crowd_lg_int_oneshot_positive}
	StopSoundEvent \{audio_crowd_md_ext_oneshot_positive}
	StopSoundEvent \{audio_crowd_md_ext_oneshot_positive_01}
	StopSoundEvent \{audio_crowd_md_int_oneshot_positive}
	StopSoundEvent \{audio_crowd_sm_ext_oneshot_positive}
	StopSoundEvent \{audio_crowd_sm_int_oneshot_positive}
	StopSoundEvent \{audio_crowd_lg_ext_oneshot_negative}
	StopSoundEvent \{audio_crowd_lg_int_oneshot_negative}
	StopSoundEvent \{audio_crowd_md_ext_oneshot_negative}
	StopSoundEvent \{audio_crowd_md_int_oneshot_negative}
	StopSoundEvent \{audio_crowd_sm_ext_oneshot_negative}
	StopSoundEvent \{audio_crowd_sm_int_oneshot_negative}
endscript

script updatevocalecho 
	count_players_by_part \{part = vocals}
	num_vocals = <players_by_part>
	if (<num_vocals> > 0)
		get_song_tempo_cfunc
		echodiff = (<tempo> - ($g_current_echo_bpm))
		if (<echodiff> < 0)
			echodiff = (<echodiff> * -1)
		endif
		if (<echodiff> > 11)
			echotime = ((60 / <tempo>) * 250)
			if (<echotime> < 140)
				echotime = (<echotime> * 2)
			endif
			Change g_current_echo_bpm = <tempo>
			vocaldspsetparams effect = echo delay = <echotime> Wetmix = 0.25
		endif
	endif
endscript

script ui_sfx 
	if NOT GotParam \{menustate}
		menustate = Generic
		printf \{channel = sfx
			qs(0x2790bc50)}
	endif
	if NOT GotParam \{uitype}
		uitype = select
		printf \{channel = sfx
			qs(0xf070c84f)}
	endif
	printf channel = sfx qs(0xf996531a) s = <menustate> p = <uitype>
	if GotParam \{mode}
		if (<mode> = music_store)
			menustate = musicstore
		else
			menustate = setlist
		endif
	endif
	if ($disable_menu_sounds = 0)
		if GotParam \{menustate}
			switch <menustate>
				case Generic
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_generic_select}
						case back
						SoundEvent \{event = audio_ui_generic_back}
						case scrollup
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollleft
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollright
						SoundEvent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						SoundEvent \{event = audio_ui_generic_select}
						case selectalt2
						SoundEvent \{event = audio_ui_generic_select}
						case toggleon
						SoundEvent \{event = audio_ui_generic_box_check}
						case toggleoff
						SoundEvent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						SoundEvent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						SoundEvent \{event = audio_ui_generic_scroll_end}
						case animatein
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						SoundEvent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						SoundEvent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						SoundEvent \{event = audio_ui_text_entry_scroll_down}
						case warningmessage
						if IsSoundEventPlaying \{jm_menu_back}
							StopSoundEvent \{jm_menu_back
								fade_type = log_slow
								fade_time = 0.001}
						endif
						SoundEvent \{event = audio_ui_generic_warning}
						case complete
						SoundEvent \{event = audio_ui_setlist_complete}
						SoundEvent \{event = audio_ui_setlist_complete_guitar}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case audio_options
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_audio_options_select}
						case back
						SoundEvent \{event = audio_ui_audio_options_back}
						case scrollup
						SoundEvent \{event = audio_ui_audio_options_scroll}
						case scrolldown
						SoundEvent \{event = audio_ui_audio_options_scroll}
						case scrollleft
						SoundEvent \{event = audio_ui_audio_options_scroll}
						case scrollright
						SoundEvent \{event = audio_ui_audio_options_scroll}
						case selectalt1
						SoundEvent \{event = audio_ui_generic_select}
						case selectalt2
						SoundEvent \{event = audio_ui_generic_select}
						case toggleon
						SoundEvent \{event = audio_ui_audio_options_eq_on}
						case toggleoff
						SoundEvent \{event = audio_ui_audio_options_eq_off}
						case negativeselect
						SoundEvent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						SoundEvent \{event = audio_ui_generic_scroll_end}
						case animatein
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						SoundEvent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						SoundEvent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						SoundEvent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case career_map
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_career_map_select_sound}
						case back
						SoundEvent \{event = audio_career_map_back_sound}
						case scrollup
						SoundEvent \{event = audio_career_map_scroll_sound}
						case scrolldown
						SoundEvent \{event = audio_career_map_scroll_sound}
						case scrollleft
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollright
						SoundEvent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						SoundEvent \{event = audio_ui_generic_select}
						case selectalt2
						SoundEvent \{event = audio_ui_generic_select}
						case toggleon
						SoundEvent \{event = audio_ui_generic_box_check}
						case toggleoff
						SoundEvent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						SoundEvent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						SoundEvent \{event = audio_ui_generic_scroll_end}
						case animatein
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						SoundEvent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						SoundEvent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						SoundEvent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case jammode
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_jam_select}
						case back
						SoundEvent \{event = audio_ui_jam_back}
						case scrollup
						SoundEvent \{event = audio_ui_jam_scroll}
						case scrolldown
						SoundEvent \{event = audio_ui_jam_scroll}
						case scrollleft
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollright
						SoundEvent \{event = audio_ui_generic_scroll_downs}
						case selectalt1
						SoundEvent \{event = audio_ui_generic_select}
						case selectalt2
						SoundEvent \{event = audio_ui_generic_select}
						case toggleon
						SoundEvent \{event = audio_ui_generic_box_check}
						case toggleoff
						SoundEvent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						SoundEvent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						SoundEvent \{event = audio_ui_generic_scroll_end}
						case toggle
						SoundEvent \{event = audio_ui_setlist_switch}
						case animatein
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						SoundEvent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						SoundEvent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						SoundEvent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case freeplay
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_generic_select}
						case back
						SoundEvent \{event = audio_ui_generic_back}
						case scrollup
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollleft
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollright
						SoundEvent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						SoundEvent \{event = audio_ui_generic_select}
						case selectalt2
						SoundEvent \{event = audio_ui_generic_select}
						case toggleon
						SoundEvent \{event = audio_ui_generic_box_check}
						case toggleoff
						SoundEvent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						SoundEvent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						SoundEvent \{event = audio_ui_generic_scroll_end}
						case toggle
						SoundEvent \{event = audio_ui_setlist_switch}
						case animatein
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						SoundEvent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						SoundEvent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						SoundEvent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case setlist
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_setlist_select}
						case back
						SoundEvent \{event = audio_ui_setlist_back}
						case scrollup
						SoundEvent \{event = audio_ui_setlist_scroll}
						case scrolldown
						SoundEvent \{event = audio_ui_setlist_scroll}
						case scrollleft
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollright
						SoundEvent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						SoundEvent \{event = audio_ui_generic_select}
						case selectalt2
						SoundEvent \{event = audio_ui_generic_select}
						case toggleon
						SoundEvent \{event = audio_ui_generic_box_check}
						case toggleoff
						SoundEvent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						SoundEvent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						SoundEvent \{event = audio_ui_generic_scroll_end}
						case toggle
						SoundEvent \{event = audio_ui_setlist_switch}
						case animatein
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						SoundEvent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						SoundEvent \{event = audio_ui_text_entry_scroll_up}
						case complete
						SoundEvent \{event = audio_ui_setlist_complete}
						SoundEvent \{event = audio_ui_setlist_complete_guitar}
						case remove
						SoundEvent \{event = audio_ui_setlist_remove}
						case switchtostore
						SoundEvent \{event = audio_ui_setlist_music_store_select}
						case addtoplaylist
						SoundEvent \{event = audio_ui_setlist_add_to_playlist}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case musicstore
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_generic_select}
						case back
						SoundEvent \{event = audio_ui_generic_back}
						case scrollup
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollleft
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollright
						SoundEvent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						SoundEvent \{event = audio_ui_generic_select}
						case selectalt2
						SoundEvent \{event = audio_ui_generic_select}
						case toggleon
						SoundEvent \{event = audio_ui_generic_box_check}
						case toggleoff
						SoundEvent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						SoundEvent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						SoundEvent \{event = audio_ui_generic_scroll_end}
						case toggle
						SoundEvent \{event = audio_ui_setlist_switch}
						case animatein
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						SoundEvent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						SoundEvent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						SoundEvent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case leaderboard
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_leaderboard_select}
						case back
						SoundEvent \{event = audio_ui_leaderboard_back}
						case scrollup
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollupbig
						SoundEvent \{event = audio_ui_leaderboard_scroll_big}
						case scrolldownbig
						SoundEvent \{event = audio_ui_leaderboard_scroll_big}
						case toggleon
						SoundEvent \{event = audio_ui_generic_box_check}
						case negativeselect
						SoundEvent \{event = audio_ui_band_lobby_negative_select}
						case stats_on
						SoundEvent \{event = audio_ui_song_stats_open}
						case stats_off
						SoundEvent \{event = audio_ui_song_stats_close}
						default
						printf \{channel = sfx
							qs(0x4f3a153b)}
					endswitch
				endif
				case car
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_generic_select}
						case back
						SoundEvent \{event = audio_ui_generic_back}
						case scrollup
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollleft
						SoundEvent \{event = audio_ui_generic_scroll_up}
						case scrollright
						SoundEvent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						SoundEvent \{event = audio_ui_generic_select}
						case selectalt2
						SoundEvent \{event = audio_ui_generic_select}
						case toggleon
						SoundEvent \{event = audio_ui_generic_box_check}
						case toggleoff
						SoundEvent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						SoundEvent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						SoundEvent \{event = audio_ui_generic_scroll_end}
						case toggle
						SoundEvent \{event = audio_ui_setlist_switch}
						case animatein
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						SoundEvent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						SoundEvent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						SoundEvent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						SoundEvent \{event = audio_ui_text_entry_scroll_down}
						case popup
						SoundEvent \{event = audio_ui_generic_popup}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case calibrate
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_generic_select}
						case back
						SoundEvent \{event = audio_ui_generic_back}
						case scrollup
						SoundEvent \{event = audio_calibrate_scroll_up}
						case scrolldown
						SoundEvent \{event = audio_calibrate_scroll_down}
						default
						printf \{channel = sfx
							qs(0xb1fefd92)}
					endswitch
				endif
				case rewards
				if GotParam \{uitype}
					switch <uitype>
						case select
						SpawnScriptNow \{audio_wait_to_play_unlock_sfx}
						case award
						SoundEvent \{event = audio_ui_song_complete_unlock_new_item}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case transformationinfo
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_setlist_scroll}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case songcomplete
				if GotParam \{uitype}
					switch <uitype>
						case animatein
						SoundEvent \{event = audio_ui_song_complete_menu_in}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case gamerules
				if GotParam \{uitype}
					switch <uitype>
						case toggleon
						SoundEvent \{event = audio_ui_song_stats_open}
						case toggleoff
						SoundEvent \{event = audio_ui_song_stats_close}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case universalpopup
				if GotParam \{uitype}
					switch <uitype>
						case animatein
						SoundEvent \{event = audio_ui_universal_popup_text_animate_in}
						case select
						SoundEvent \{event = audio_ui_generic_popup}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case questgiglist
				if GotParam \{uitype}
					switch <uitype>
						case animatein
						SoundEvent \{event = audio_ui_quest_giglist_animate_in}
						SoundEvent \{event = audio_ui_quest_giglist_animate_in_2}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case friendfeed
				if GotParam \{uitype}
					switch <uitype>
						case select
						SoundEvent \{event = audio_ui_generic_select}
						case negativeselect
						SoundEvent \{event = audio_ui_generic_negative_select}
						case animateinslide
						SoundEvent \{event = audio_ui_friend_feed_animate_in_slide}
						case animateoutslide
						SoundEvent \{event = audio_ui_friend_feed_animate_out_slide}
						case animateopen
						ui_event_get_top
						if (<base_name> = 'mainmenu')
							SoundEvent \{event = audio_ui_friend_feed_animate_in_open}
						else
							setsoundbussparams \{Music_Setlist = {
									vol = -3
								}
								time = 1}
							SoundEvent \{event = audio_ui_friend_feed_animate_in_open}
							SetSoundParams \{friend_feed_animate_in_open
								vol = -4.5}
						endif
						case animateclose
						ui_event_get_top
						if (<base_name> = 'mainmenu')
							SoundEvent \{event = audio_ui_friend_feed_animate_out_close}
						else
							setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)} time = 1}
							SoundEvent \{event = audio_ui_friend_feed_animate_out_close}
							SetSoundParams \{friend_feed_animate_out_close
								vol = -5.5}
						endif
						case scrollup
						SoundEvent \{event = audio_ui_friend_feed_scroll}
						case scrolldown
						SoundEvent \{event = audio_ui_friend_feed_scroll}
						case gotogameplay
						SoundEvent \{event = audio_ui_setlist_complete}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				default
			endswitch
		endif
	endif
endscript

script audio_play_quest_reward_anim_sfx 
	if GotParam \{play_text_whoosh}
		SoundEvent \{event = audio_ui_rewards_quest_text_animate_in}
		Wait \{0.2
			Seconds}
		StopSoundEvent \{audio_ui_rewards_quest_text_animate_in
			fade_type = linear
			fade_time = 0.5}
	else
		Wait \{0.6
			Seconds}
		ui_sfx \{menustate = rewards
			uitype = select}
	endif
endscript

script audio_ui_band_lobby_sfx_logic \{player_num = 2}
	SetSpawnInstanceLimits \{Max = 6
		management = kill_oldest}
	printscriptinfo \{'audio_ui_band_lobby_sfx_logic'
		channel = sfx}
	if (<player_num> = 1)
		<pan1x> = -0.25
		<pan1y> = 1
		<pan2x> = -0.25
		<pan2y> = 1
	elseif (<player_num> = 2)
		<pan1x> = -0.15
		<pan1y> = 1
		<pan2x> = -0.15
		<pan2y> = 1
	elseif (<player_num> = 3)
		<pan1x> = 0.15
		<pan1y> = 1
		<pan2x> = 0.15
		<pan2y> = 1
	elseif (<player_num> = 4)
		<pan1x> = 0.25
		<pan1y> = 1
		<pan2x> = 0.25
		<pan2y> = 1
	endif
	if GotParam \{up}
		printf \{channel = sfx
			qs(0x33228a6e)}
		stopsound \{band_lobby_scroll
			fade_time = 0.1
			fade_type = linear}
		PlaySound band_lobby_scroll vol = -6 pitch = 0.08 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{down}
		printf \{channel = sfx
			qs(0x603e66a7)}
		stopsound \{band_lobby_scroll
			fade_time = 0.1
			fade_type = linear}
		PlaySound band_lobby_scroll vol = -6 pitch = 0 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{choose}
		printf \{channel = sfx
			qs(0x03d77756)}
		stopsound \{lobbyselecta
			fade_time = 0.2
			fade_type = linear}
		PlaySound lobbyselecta vol = 0 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		stopsound \{lobbyback06}
	endif
	if GotParam \{back}
		printf \{channel = sfx
			qs(0x3e573add)}
		stopsound \{lobbyback06
			fade_time = 0.2
			fade_type = linear}
		PlaySound lobbyback06 vol = -6 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{generic_back}
		printf \{channel = sfx
			qs(0xffb7ef45)}
		stopsound \{lobbyselecta
			fade_time = 0.05
			fade_type = linear}
		stopsound \{lobbyback06
			fade_time = 0.05
			fade_type = linear}
		SoundEvent \{event = audio_ui_generic_back}
	endif
	if GotParam \{error}
		printf \{channel = sfx
			qs(0x6504f146)}
		stopsound \{lobbyback0
			fade_time = 0.1
			fade_type = linear6}
		stopsound \{menu_select_negative
			fade_time = 0.1
			fade_type = linear}
		PlaySound menu_select_negative vol = -8 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{toggleon}
		printf \{channel = sfx
			qs(0x1ef25b2d)}
		stopsound \{lobbyback06
			fade_time = 0.1
			fade_type = linear}
		stopsound \{lobbyselecta
			fade_time = 0.1
			fade_type = linear}
		PlaySound CheckBox_Check_SFX pitch = 0 vol = 0 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{toggleoff}
		printf \{channel = sfx
			qs(0x2a8028af)}
		stopsound \{lobbyback06
			fade_time = 0.1
			fade_type = linear}
		stopsound \{lobbyselecta
			fade_time = 0.1
			fade_type = linear}
		PlaySound checkbox_uncheck_sfx pitch = 0 vol = 0 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script audio_options_crowd_fader_loop 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if ($g_audio_options_crowd_fader_state = looping)
		SoundEvent \{event = audio_ui_audio_options_crowd}
	else
		StopSoundEvent \{audio_ui_audio_options_crowd
			fade_time = 0.3
			fade_type = linear}
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script audio_crowd_jam_ghtunes_adjust_crowd_from_track_levels 
	<db_per_tick> = 2
	<scale_amount> = 0.75
	<center_vol> = 8
	<track_vol> = 0.0
	GetArraySize ($jam_tracks)
	i = 0
	begin
	gettracksize track = ($jam_tracks [<i>].id)
	if (<track_size> > 0)
		gettrackinfo track = ($jam_tracks [<i>].id)
		<track_vol> = (<track_vol> + <Volume>)
	else
		<track_vol> = (<track_vol> + 0.0)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<average_vol> = (<track_vol> / <array_Size>)
	<vol_adjustment> = ((<average_vol> - <center_vol>) * <db_per_tick>)
	<vol_scale> = (<vol_adjustment> * <scale_amount>)
	<vol_scale> = (<vol_scale> - 4)
	setsoundbussparams {sfx_balance = {vol = (($default_BussSet.sfx_balance.vol) + <vol_scale>)} time = 1.0}
	setsoundbussparams {Crowd = {vol = (($game_bussset.Crowd.vol) + <vol_scale>)} time = 1.0}
endscript

script audio_gameplay_detect_phoneme 
endscript

script audio_gameplay_check_song_rms 
	if ($g_prototypes_off = 0)
		gamemode_gettype
		playlist_getcurrentsong
		<songname> = <current_song>
		get_song_prefix song = <current_song>
		get_song_struct song = <current_song>
		<oldarraynum> = -1
		songfilemanager func = get_song_end_time song_name = <current_song>
		setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)} time = 0.01}
		Change \{g_current_vol_crowd_amount = 0.5}
		Change \{g_current_vol_sfx_amount = 0.5}
		<center_rms> = -18
		<vol_offset> = (<song_struct>.overall_song_volume)
		getrmsdata song_prefix = <song_prefix> song = <songname>
		if (<array_Size> > 0)
			if NOT (<current_song> = jamsession || $game_mode = practice)
				SpawnScriptNow \{audio_gameplay_look_for_song_end}
				SpawnScriptNow audio_gameplay_find_song_start_end_triggers params = {<...>}
				begin
				GetSongTimeMs
				CastToInteger \{time}
				<arraynum> = (<time> / 50)
				if NOT (<arraynum> > <array_Size> || <time> > (<total_end_time> - 50))
					if NOT (<arraynum> < 0)
						if NOT (<oldarraynum> = <arraynum>)
							getrmsdata song_prefix = <song_prefix> song = <songname> index = <arraynum>
							rmsvalue = (<rmsvalue> + <vol_offset>)
							if (<rmsvalue> < -75)
								<rmsvalue> = <center_rms>
							else
								if (<rmsvalue> < (<center_rms> - 10))
									<rmsvalue> = (<center_rms> - 10)
								elseif (<rmsvalue> > (<center_rms> + 4))
									<rmsvalue> = (<center_rms> + 4)
								endif
							endif
							if (<rmsvalue> > <center_rms>)
								Change \{g_current_vol_sfx_amount = 0.2}
								Change \{g_current_vol_crowd_amount = 0.25}
							else
								Change \{g_current_vol_sfx_amount = 0.75}
								Change \{g_current_vol_crowd_amount = 0.6}
							endif
							<scaleamountsfx> = $g_current_vol_sfx_amount
							<scaleamountcrowd> = $g_current_vol_crowd_amount
							<scalevolsfx> = ((<rmsvalue> - <center_rms>) * <scaleamountsfx>)
							<scalevolcrowd> = ((<rmsvalue> - <center_rms>) * <scaleamountcrowd>)
							setsoundbussparams {sfx = {vol = (($default_BussSet.sfx.vol) + <scalevolsfx>)} time = 0.05}
							setsoundbussparams {Crowd = {vol = (($game_bussset.Crowd.vol) + <scalevolcrowd>)} time = 1.0}
							Wait \{2
								gameframes}
						else
							Wait \{2
								gameframes}
						endif
					else
						Wait \{1
							gameframe}
					endif
				else
					setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)} time = 0.5}
					KillSpawnedScript \{Name = audio_gameplay_look_for_song_end}
					break
				endif
				<oldarraynum> = <arraynum>
				repeat
			endif
		endif
	endif
endscript

script audio_gameplay_look_for_song_end 
	if ($g_prototypes_off = 0)
		playlist_getcurrentsong
		songfilemanager func = get_song_end_time song_name = <current_song>
		<song_end> = (<total_end_time> - 2000)
		<num_seconds_before> = 10.0
		<seconds_before> = (<song_end> - (<num_seconds_before> * 1000))
		current_global = $g_current_vol_crowd_amount
		<current_intensity> = <current_global>
		<p> = (<num_seconds_before> * 30.0)
		<i> = (<current_global> / <p>)
		begin
		GetSongTimeMs
		<song_time_ms> = <time>
		if (<current_intensity> < 0)
			Change \{g_current_vol_crowd_amount = 0.0}
			break
		endif
		if (<song_time_ms> > <seconds_before>)
			Change g_current_vol_crowd_amount = <current_intensity>
			current_intensity = (<current_intensity> - <i>)
			printf channel = sfx qs(0x010a461a) s = <current_intensity>
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script audio_gameplay_kill_check_rms 
	gamemode_gettype
	KillSpawnedScript \{Name = audio_gameplay_look_for_song_end}
	KillSpawnedScript \{Name = audio_gameplay_check_song_rms}
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)} time = 0.2}
	if (<Type> = competitive)
		SpawnScriptNow \{audio_waiting_for_crowd_to_fade}
	elseif (<Type> = career)
		SpawnScriptNow \{audio_waiting_for_crowd_to_fade}
	else
		setsoundbussparams {Crowd = {vol = ($game_bussset.Crowd.vol)} time = 1.0}
	endif
endscript

script audio_gameplay_find_song_start_end_triggers 
endscript

script audio_ui_create_dynamic_audio_modes 
endscript

script audio_gameplay_practice_play_project_dependent_drum_sample 
	playlist_getcurrentsong
	song_name = <current_song>
	get_song_source song_name = <song_name>
	<floor_tom_pitch> = -2
	<high_tom_pitch> = 2
	if ((<Source> = gh4) || (<Source> = gh4_1) || (<Source> = gh4_2) || (<Source> = gh4_3) || (<Source> = gh4_dlc) || (<Source> = gh5) || (<Source> = gh5_1) || (<Source> = gh5_dlc))
		if (<MidiNote> = 65)
			play_drum_sample pad = <pad> buss = <buss> velocity = 50
		elseif (<MidiNote> = 66)
			play_drum_sample pad = <pad> buss = <buss>
		elseif (<MidiNote> = 67)
			play_drum_sample pad = <pad> buss = <buss> velocity = 50
		elseif (<MidiNote> = 68)
			play_drum_sample pad = <pad> buss = <buss>
		elseif (<MidiNote> = 69)
			play_drum_sample pad = <pad> buss = <buss> velocity = 90
		endif
	else
		printf channel = sfx qs(0xd10c763c) s = <velocity>
		printf channel = sfx qs(0x3503bb7a) s = <buss>
		printf channel = sfx qs(0x3172c88d) s = <pad>
		switch <sfxtype>
			case kick
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity> loop_pitch = 1
			case fltom2
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 loop_pitch = <floor_tom_pitch> velocity = <velocity>
			case fltom1
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
			case tom2
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
			case tom1
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 loop_pitch = <high_tom_pitch> velocity = <velocity>
			case snareghost
			case snare
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
			case snareflam
			SpawnScriptNow audio_gameplay_practice_play_snare_flam params = {pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>}
			case snarecrossstick
			play_drum_sample pad = snare buss = <buss> percussion = 1 velocity = <velocity>
			case hihatclosed
			<velocity> = (<velocity> / 2)
			if (<velocity> > 69)
				<velocity> = 69
			elseif (<velocity> < 1)
				<velocity> = 1
			endif
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
			case hihatopen
			<velocity> = ((<velocity> / 2) + 70)
			if (<velocity> > 127)
				<velocity> = 127
			elseif (<velocity> < 70)
				<velocity> = 70
			endif
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
			case cowbell
			play_drum_sample pad = tom2 buss = <buss> percussion = 1 velocity = <velocity>
			case ridebell
			case ride
			<velocity> = (<velocity> / 2)
			if (<velocity> > 69)
				<velocity> = 69
			elseif (<velocity> < 1)
				<velocity> = 1
			endif
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
			case crash1
			<velocity> = ((<velocity> / 2) + 70)
			if (<velocity> > 127)
				<velocity> = 127
			elseif (<velocity> < 70)
				<velocity> = 70
			endif
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
			case crash2
			<velocity> = ((<velocity> / 2) + 70)
			if (<velocity> > 127)
				<velocity> = 127
			elseif (<velocity> < 70)
				<velocity> = 70
			endif
			play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
			case crash3
			<velocity> = ((<velocity> / 2) + 70)
			if (<velocity> > 127)
				<velocity> = 127
			elseif (<velocity> < 70)
				<velocity> = 70
			endif
			play_drum_sample pad = hihat buss = <buss> percussion = 1 velocity = <velocity>
			case splash
			play_drum_sample pad = tom1 buss = <buss> percussion = 1 velocity = <velocity>
			case china
			play_drum_sample pad = cymbal buss = <buss> percussion = 1 velocity = <velocity>
			case cymbalchoke1
			case cymbalchoke2
			case cymbalchoke3
			StopSoundsByBuss \{drums_practicemode_cymbals
				fade_time = 0.5
				fade_type = log_fast}
			StopSoundsByBuss \{drums_practicemode_hats
				fade_time = 0.5
				fade_type = log_fast}
			case countin_sticks_tiny
			audio_gameplay_countoff_logic countoff_sound = 'sticks_tiny' velocity = <velocity>
			case countin_sticks_normal
			audio_gameplay_countoff_logic countoff_sound = 'sticks_normal' velocity = <velocity>
			case countin_sticks_huge
			audio_gameplay_countoff_logic countoff_sound = 'sticks_huge' velocity = <velocity>
			case countin_hhpedal
			audio_gameplay_countoff_logic countoff_sound = 'hihat03' velocity = <velocity>
			case countin_hhclosed
			audio_gameplay_countoff_logic countoff_sound = 'hihat01' velocity = <velocity>
			case countin_hhopen
			audio_gameplay_countoff_logic countoff_sound = 'hihat02' velocity = <velocity>
			default
			printf \{channel = sfx
				qs(0xf0e02af2)}
		endswitch
	endif
endscript

script audio_gameplay_practice_play_snare_flam 
	<scaled_velocity> = (<velocity> * 0.75)
	roundtointeger \{scaled_velocity}
	play_drum_sample pad = <pad> buss = <buss> scale_volume = -3 percussion = 0 velocity = <scaled_velocity>
	Wait \{0.025
		Seconds}
	play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
endscript

script audio_crowd_kill_quiet_crowd_one_shots 
endscript

script audio_auto_mic_check 
	<num_vocals> = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 1)
		audio_figure_out_how_many_vocals {
			num_players_shown = <num_players_shown>
			num_vocals = <num_vocals>
		}
		if (<num_vocals> < 2)
			KillSpawnedScript \{Name = audio_microphone_auto_gain}
		else
			SpawnScriptNow \{audio_microphone_auto_gain}
		endif
	endif
endscript

script audio_microphone_auto_gain 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	<num_vocals> = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 1)
		audio_figure_out_how_many_vocals {
			num_players_shown = <num_players_shown>
			num_vocals = <num_vocals>
		}
		if (<num_vocals> > 1)
			audio_microphone_amplitude_test_and_balance {
				num_players_shown = <num_players_shown>
			}
		endif
	endif
endscript

script audio_microphone_amplitude_test_and_balance 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	<amplitude_mic_1> = 0
	<amplitude_mic_2> = 0
	<amplitude_mic_3> = 0
	<amplitude_mic_4> = 0
	begin
	audio_microphone_levels {
		amplitude_mic_1 = <amplitude_mic_1>
		amplitude_mic_2 = <amplitude_mic_2>
		amplitude_mic_3 = <amplitude_mic_3>
		amplitude_mic_4 = <amplitude_mic_4>
		num_players_shown = <num_players_shown>
	}
	Wait \{1
		gameframe}
	repeat
endscript

script audio_microphone_levels 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	<counter> = 1
	begin
	getplayerinfo <counter> part
	if (<part> = vocals)
		getplayerinfo <counter> controller
		if (<controller> > 3)
			return {
				amplitude_mic_1 = <amplitude_mic_1>
				amplitude_mic_2 = <amplitude_mic_2>
				amplitude_mic_3 = <amplitude_mic_3>
				amplitude_mic_4 = <amplitude_mic_4>
				num_players_shown = <num_players_shown>
			}
		endif
		vocals_getmicamplitude controller = <controller>
		switch <counter>
			case 1
			<amplitude_mic_1> = ((<amplitude_mic_1> + <amplitude>) / 2)
			case 2
			<amplitude_mic_2> = ((<amplitude_mic_2> + <amplitude>) / 2)
			case 3
			<amplitude_mic_3> = ((<amplitude_mic_3> + <amplitude>) / 2)
			case 4
			<amplitude_mic_4> = ((<amplitude_mic_4> + <amplitude>) / 2)
			default
			printf \{channel = sfx
				qs(0x73f83a25)}
		endswitch
	else
		switch <counter>
			case 1
			<amplitude_mic_1> = 0
			case 2
			<amplitude_mic_2> = 0
			case 3
			<amplitude_mic_3> = 0
			case 4
			<amplitude_mic_4> = 0
			default
			printf \{channel = sfx
				qs(0x64ca6d8f)}
		endswitch
	endif
	<counter> = (<counter> + 1)
	repeat <num_players_shown>
	audio_figure_out_balancing {
		amplitude_mic_1 = <amplitude_mic_1>
		amplitude_mic_2 = <amplitude_mic_2>
		amplitude_mic_3 = <amplitude_mic_3>
		amplitude_mic_4 = <amplitude_mic_4>
		num_players_shown = <num_players_shown>
	}
	return {
		amplitude_mic_1 = <amplitude_mic_1>
		amplitude_mic_2 = <amplitude_mic_2>
		amplitude_mic_3 = <amplitude_mic_3>
		amplitude_mic_4 = <amplitude_mic_4>
		num_players_shown = <num_players_shown>
	}
endscript

script audio_figure_out_balancing 
	<THRESHOLD> = 1.9
	<overall_amplitude> = 0
	<counter> = 1
	<new_amplitude_mic_1> = 0
	<new_amplitude_mic_2> = 0
	<new_amplitude_mic_3> = 0
	<new_amplitude_mic_4> = 0
	<audio_getting_mic_device_info> = true
	if ((<amplitude_mic_1> + <amplitude_mic_2> + <amplitude_mic_3> + <amplitude_mic_4>) > <THRESHOLD>)
		printf \{channel = sfx
			qs(0x1a5bd505)}
		<overall_amplitude> = (<amplitude_mic_1> + <amplitude_mic_2> + <amplitude_mic_3> + <amplitude_mic_4>)
		begin
		getplayerinfo <counter> part
		if (<part> = vocals)
			switch <counter>
				case 1
				<new_amplitude_mic_1> = ((<amplitude_mic_1> / <overall_amplitude>) * <THRESHOLD>)
				case 2
				<new_amplitude_mic_2> = ((<amplitude_mic_2> / <overall_amplitude>) * <THRESHOLD>)
				case 3
				<new_amplitude_mic_3> = ((<amplitude_mic_3> / <overall_amplitude>) * <THRESHOLD>)
				case 4
				<new_amplitude_mic_4> = ((<amplitude_mic_4> / <overall_amplitude>) * <THRESHOLD>)
				default
				printf \{channel = sfx
					qs(0x03f9fbc2)}
			endswitch
		endif
		<counter> = (<counter> + 1)
		repeat <num_players_shown>
		audio_change_microphone_balancing {
			new_amplitude_mic_1 = <new_amplitude_mic_1>
			new_amplitude_mic_2 = <new_amplitude_mic_2>
			new_amplitude_mic_3 = <new_amplitude_mic_3>
			new_amplitude_mic_4 = <new_amplitude_mic_4>
			amplitude_mic_1 = <amplitude_mic_1>
			amplitude_mic_2 = <amplitude_mic_2>
			amplitude_mic_3 = <amplitude_mic_3>
			amplitude_mic_4 = <amplitude_mic_4>
			num_players_shown = <num_players_shown>
			THRESHOLD = <THRESHOLD>
		}
	else
		begin
		switch <counter>
			case 1
			if (<amplitude_mic_1> > 0)
				ui_options_audio_update_mic_volume {
					audio_getting_mic_device_info = <audio_getting_mic_device_info>
					Player = <counter>
				}
				getplayerinfo <counter> controller
				if GotParam \{micvolume}
					setmicvolume controller = <controller> vol = <micvolume>
				endif
			endif
			case 2
			if (<amplitude_mic_2> > 0)
				ui_options_audio_update_mic_volume {
					audio_getting_mic_device_info = <audio_getting_mic_device_info>
					Player = <counter>
				}
				getplayerinfo <counter> controller
				if GotParam \{micvolume}
					setmicvolume controller = <controller> vol = <micvolume>
				endif
			endif
			case 3
			if (<amplitude_mic_3> > 0)
				ui_options_audio_update_mic_volume {
					audio_getting_mic_device_info = <audio_getting_mic_device_info>
					Player = <counter>
				}
				getplayerinfo <counter> controller
				if GotParam \{micvolume}
					setmicvolume controller = <controller> vol = <micvolume>
				endif
			endif
			case 4
			if (<amplitude_mic_4> > 0)
				ui_options_audio_update_mic_volume {
					audio_getting_mic_device_info = <audio_getting_mic_device_info>
					Player = <counter>
				}
				getplayerinfo <counter> controller
				if GotParam \{micvolume}
					setmicvolume controller = <controller> vol = <micvolume>
				endif
			endif
			default
			printf \{channel = sfx
				qs(0xb03088fb)}
		endswitch
		<counter> = (<counter> + 1)
		repeat <num_players_shown>
	endif
	return {
		amplitude_mic_1 = <amplitude_mic_1>
		amplitude_mic_2 = <amplitude_mic_2>
		amplitude_mic_3 = <amplitude_mic_3>
		amplitude_mic_4 = <amplitude_mic_4>
		num_players_shown = <num_players_shown>
	}
endscript

script audio_change_microphone_balancing 
	<counter> = 1
	<compressor_threshold> = -10
	<temp_db_value> = 0
	<audio_getting_mic_device_info> = true
	begin
	switch <counter>
		case 1
		if (<amplitude_mic_1> > 0)
			convertamplitudetodb amplitude = <amplitude_mic_1>
			<temp_db_value> = <db>
			convertamplitudetodb amplitude = <new_amplitude_mic_1>
			<temp_db_value> = ((<db> - <temp_db_value>))
			<temp_db_value> = ((<new_amplitude_mic_1> / <THRESHOLD>) * <temp_db_value>)
			ui_options_audio_update_mic_volume {
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
				Player = <counter>
			}
			getplayerinfo <counter> controller
			if GotParam \{micvolume}
				setmicvolume controller = <controller> vol = (<micvolume> + <temp_db_value>)
			endif
		endif
		case 2
		if (<amplitude_mic_2> > 0)
			convertamplitudetodb amplitude = <amplitude_mic_2>
			<temp_db_value> = <db>
			convertamplitudetodb amplitude = <new_amplitude_mic_2>
			<temp_db_value> = ((<db> - <temp_db_value>))
			<temp_db_value> = ((<new_amplitude_mic_2> / <THRESHOLD>) * <temp_db_value>)
			ui_options_audio_update_mic_volume {
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
				Player = <counter>
			}
			getplayerinfo <counter> controller
			if GotParam \{micvolume}
				setmicvolume controller = <controller> vol = (<micvolume> + <temp_db_value>)
			endif
		endif
		case 3
		if (<amplitude_mic_3> > 0)
			convertamplitudetodb amplitude = <amplitude_mic_3>
			<temp_db_value> = <db>
			convertamplitudetodb amplitude = <new_amplitude_mic_3>
			<temp_db_value> = ((<db> - <temp_db_value>))
			<temp_db_value> = ((<new_amplitude_mic_3> / <THRESHOLD>) * <temp_db_value>)
			ui_options_audio_update_mic_volume {
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
				Player = <counter>
			}
			getplayerinfo <counter> controller
			if GotParam \{micvolume}
				setmicvolume controller = <controller> vol = (<micvolume> + <temp_db_value>)
			endif
		endif
		case 4
		if (<amplitude_mic_4> > 0)
			convertamplitudetodb amplitude = <amplitude_mic_4>
			<temp_db_value> = <db>
			convertamplitudetodb amplitude = <new_amplitude_mic_4>
			<temp_db_value> = ((<db> - <temp_db_value>))
			<temp_db_value> = ((<new_amplitude_mic_4> / <THRESHOLD>) * <temp_db_value>)
			ui_options_audio_update_mic_volume {
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
				Player = <counter>
			}
			getplayerinfo <counter> controller
			if GotParam \{micvolume}
				setmicvolume controller = <controller> vol = (<micvolume> + <temp_db_value>)
			endif
		endif
		default
		printf \{channel = sfx
			qs(0xb03088fb)}
	endswitch
	<counter> = (<counter> + 1)
	repeat <num_players_shown>
	return {
		amplitude_mic_1 = <amplitude_mic_1>
		amplitude_mic_2 = <amplitude_mic_2>
		amplitude_mic_3 = <amplitude_mic_3>
		amplitude_mic_4 = <amplitude_mic_4>
		num_players_shown = <num_players_shown>
	}
endscript

script audio_figure_out_how_many_vocals 
	<counter> = 1
	begin
	getplayerinfo <counter> part
	if (<part> = vocals)
		num_vocals = (<num_vocals> + 1)
	endif
	<counter> = (<counter> + 1)
	repeat <num_players_shown>
	return {
		num_vocals = <num_vocals>
		num_players_shown = <num_players_shown>
	}
endscript

script audio_check_for_celeb_intro_encore 
	if ($g_celeb_intro = 1)
		if NOT ($game_mode = practice)
			if issoundplaying \{silence_front_end_crowd_loop_ft}
				sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
					fadeintime = 2.0
					fadeintype = linear
					fadeouttime = 2
					fadeouttype = linear}
				One_Shot_SoundEvent \{SoundEvent = $g_current_crowd_oneshot_positive_soundevent
					waitTime = 5}
			endif
		endif
	elseif ($g_celeb_encore = 1)
		if NOT ($game_mode = practice)
			if issoundplaying \{silence_front_end_crowd_loop_ft}
				sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good
					fadeintime = 2.0
					fadeintype = linear
					fadeouttime = 2
					fadeouttype = linear}
				One_Shot_SoundEvent \{SoundEvent = $g_current_crowd_oneshot_positive_soundevent
					waitTime = 5}
			endif
		endif
	endif
	audio_change_celeb_globals_to_zero
endscript

script audio_change_crowd_to_celeb_state 
	if (<celeb_state> = Intro)
		Change \{g_celeb_intro = 1}
	elseif (<celeb_state> = ENCORE)
		Change \{g_celeb_encore = 1}
	endif
	sfx_backgrounds_new_area \{BG_SFX_Area = FrontEnd
		fadeintime = 1.0
		fadeintype = linear
		fadeouttime = 1
		fadeouttype = linear}
	One_Shot_SoundEvent \{SoundEvent = audio_crowd_oneshots_do_nothing}
endscript

script audio_change_celeb_globals_to_zero 
	Change \{g_celeb_encore = 0}
	Change \{g_celeb_intro = 0}
endscript

script audio_medallion_status_logic_fast \{percentage = 6}
	SoundEvent \{event = audio_ui_career_medallion_fill_fast}
endscript

script locked_item_negative_select_sfx 
	StopSoundEvent \{audio_ui_generic_select}
	SoundEvent \{event = audio_ui_generic_negative_select}
endscript

script audio_menu_music_duck_volume 
	printstruct <...>
	printf channel = sfx qs(0x73307931) s = <outro_vo>
	switch <outro_vo>
		case 'Johnny_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{6
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{1.5
			Seconds}
		case 'Newgirl_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{6.5
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{1.5
			Seconds}
		case 'Newgirl_Outro_Generic'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{12.0
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Johnny_Outro_Generic'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{9.25
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Judy_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{7.5
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{1.5
			Seconds}
		case 'Newmale_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{8.5
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Pandora_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{11
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Lars_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{10.5
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Casey_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{6
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{1.5
			Seconds}
		case 'Axel_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{14
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Map_Intro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{12
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 3}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{2.0
			Seconds}
		case 'Map_Unlock_2nd_Tier'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -6)} time = 1}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{3
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Map_Unlock_Rush'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{8.0
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 3}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{1.5
			Seconds}
		case 'Rush_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{5
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{1.5
			Seconds}
		case 'Map_Unlock_3rd_Tier'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{7
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Map_FB_Intro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -6)} time = 1.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{3.5
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Map_FB_Outro'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{4.5
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Map_Unlock_Demigod'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{5.5
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		case 'Map_Demigod_Complete'
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		Wait \{6.5
			Seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		Wait \{0.5
			Seconds}
		default
		printf \{channel = sfx
			qs(0x3753d878)}
	endswitch
	printf \{channel = sfx
		qs(0x8b1dd6fa)}
endscript

script audio_kill_cutscene_audio 
	StopSoundsByBuss \{Encore_Events}
	StopSoundsByBuss \{binkcutscenes}
endscript

script audio_play_loc_vo_manually 
	<lang_crc> = NULL
	if English
		<lang_crc> = en_
	elseif German
		<lang_crc> = gr_
	elseif French
		<lang_crc> = fr_
	elseif Italian
		<lang_crc> = it_
	elseif Spanish
		<lang_crc> = sp_
	endif
	if GotParam \{stream_to_stop}
		ExtendCrc <lang_crc> (<stream_to_stop>) out = full_stream_name_to_stop
		stopsound <full_stream_name_to_stop>
		Wait \{0.8
			Seconds}
	endif
	if GotParam \{stream_name}
		ExtendCrc <lang_crc> (<stream_name>) out = full_stream_name
		PlaySound <full_stream_name> buss = Encore_Events vol = 3
	endif
endscript

script audio_kill_crowds_during_stats_screen 
	if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
		KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
endscript

script audio_final_battle_outro_preload_stream 
	tutorial_system_get_language_prefix
	formatText checksumName = localized_stream '%l_%s' l = <language_prefix> s = 'FB_Outro' AddToStringLookup = true
	PreloadStream <localized_stream>
	Change g_career_movie_stream = <unique_id>
	begin
	if PreloadStreamDone \{$g_career_movie_stream}
		printf \{qs(0xa0d116d1)
			s = $g_career_movie_stream}
		break
	endif
	printf \{qs(0xcfa0d6c1)
		s = $g_career_movie_stream}
	Wait \{1
		gameframe}
	repeat
endscript

script audio_fail_vo_line_selection 
	printf \{channel = sfx
		qs(0x9da2a941)}
	tutorial_system_get_language_prefix
	switch <language_prefix>
		case 'EN'
		RandomNoRepeat (
			@ PreloadStream \{en_fb_fail_02}
			@ PreloadStream \{en_fb_fail_03}
			@ PreloadStream \{en_fb_fail_07}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'GR'
		RandomNoRepeat (
			@ PreloadStream \{gr_fb_fail_02}
			@ PreloadStream \{gr_fb_fail_03}
			@ PreloadStream \{gr_fb_fail_07}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'FR'
		RandomNoRepeat (
			@ PreloadStream \{fr_fb_fail_02}
			@ PreloadStream \{fr_fb_fail_03}
			@ PreloadStream \{fr_fb_fail_07}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'IT'
		RandomNoRepeat (
			@ PreloadStream \{it_fb_fail_02}
			@ PreloadStream \{it_fb_fail_03}
			@ PreloadStream \{it_fb_fail_07}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'SP'
		RandomNoRepeat (
			@ PreloadStream \{sp_fb_fail_02}
			@ PreloadStream \{sp_fb_fail_03}
			@ PreloadStream \{sp_fb_fail_07}
			)
		Change celeb_intro_stream_id = <unique_id>
		default
		printf \{channel = sfx
			qs(0x5d69bfc9)}
	endswitch
	SetSoundParams \{ampzilla_fail_attack_back
		vol = -10
		time = 4}
	SetSoundParams \{ampzilla_fail_attack_front
		vol = -10
		time = 4}
	Wait \{4
		Seconds}
	if NOT ($celeb_intro_stream_id = None)
		StartPreLoadedStream <unique_id> buss = Encore_Events forcesafepreload = 1 vol = 0 Priority = 1
		Change \{celeb_intro_stream_id = None}
	endif
endscript

script audio_fail_endofsong_vo_line_selection 
	printf \{channel = sfx
		qs(0x9da2a941)}
	tutorial_system_get_language_prefix
	switch <language_prefix>
		case 'EN'
		RandomNoRepeat (
			@ PreloadStream \{en_fb_fail_01}
			@ PreloadStream \{en_fb_fail_04}
			@ PreloadStream \{en_fb_fail_05}
			@ PreloadStream \{en_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'GR'
		RandomNoRepeat (
			@ PreloadStream \{gr_fb_fail_01}
			@ PreloadStream \{gr_fb_fail_04}
			@ PreloadStream \{gr_fb_fail_05}
			@ PreloadStream \{gr_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'FR'
		RandomNoRepeat (
			@ PreloadStream \{fr_fb_fail_01}
			@ PreloadStream \{fr_fb_fail_04}
			@ PreloadStream \{fr_fb_fail_05}
			@ PreloadStream \{fr_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'IT'
		RandomNoRepeat (
			@ PreloadStream \{it_fb_fail_01}
			@ PreloadStream \{it_fb_fail_04}
			@ PreloadStream \{it_fb_fail_05}
			@ PreloadStream \{it_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'SP'
		RandomNoRepeat (
			@ PreloadStream \{sp_fb_fail_01}
			@ PreloadStream \{sp_fb_fail_04}
			@ PreloadStream \{sp_fb_fail_05}
			@ PreloadStream \{sp_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		default
		printf \{channel = sfx
			qs(0x5d69bfc9)}
	endswitch
	SetSoundParams \{ampzilla_fail_attack_back
		vol = -10
		time = 4}
	SetSoundParams \{ampzilla_fail_attack_front
		vol = -10
		time = 4}
	Wait \{4
		Seconds}
	if NOT ($celeb_intro_stream_id = None)
		StartPreLoadedStream <unique_id> buss = Encore_Events forcesafepreload = 1 vol = 0 Priority = 1
		Change \{celeb_intro_stream_id = None}
	endif
endscript

script audio_fail_demigod_vo_line_selection 
	printf \{channel = sfx
		qs(0x80e0937b)}
	tutorial_system_get_language_prefix
	switch <language_prefix>
		case 'EN'
		RandomNoRepeat (
			@ PreloadStream \{en_fb_demigod_fail_01}
			@ PreloadStream \{en_fb_demigod_fail_02}
			@ PreloadStream \{en_fb_demigod_fail_03}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'GR'
		RandomNoRepeat (
			@ PreloadStream \{gr_fb_demigod_fail_01}
			@ PreloadStream \{gr_fb_demigod_fail_02}
			@ PreloadStream \{gr_fb_demigod_fail_03}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'FR'
		RandomNoRepeat (
			@ PreloadStream \{fr_fb_demigod_fail_01}
			@ PreloadStream \{fr_fb_demigod_fail_02}
			@ PreloadStream \{fr_fb_demigod_fail_03}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'IT'
		RandomNoRepeat (
			@ PreloadStream \{it_fb_demigod_fail_01}
			@ PreloadStream \{it_fb_demigod_fail_02}
			@ PreloadStream \{it_fb_demigod_fail_03}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'SP'
		RandomNoRepeat (
			@ PreloadStream \{sp_fb_demigod_fail_01}
			@ PreloadStream \{sp_fb_demigod_fail_02}
			@ PreloadStream \{sp_fb_demigod_fail_03}
			)
		Change celeb_intro_stream_id = <unique_id>
		default
		printf \{channel = sfx
			qs(0x5d69bfc9)}
	endswitch
	SetSoundParams \{ampzilla_fail_attack_back
		vol = -10
		time = 4}
	SetSoundParams \{ampzilla_fail_attack_front
		vol = -10
		time = 4}
	Wait \{4
		Seconds}
	if NOT ($celeb_intro_stream_id = None)
		StartPreLoadedStream <unique_id> buss = Encore_Events forcesafepreload = 1 vol = 0 Priority = 1
		Change \{celeb_intro_stream_id = None}
	endif
endscript

script audio_fail_demigod_endofsong_vo_line_selection 
	printf \{channel = sfx
		qs(0x80e0937b)}
	tutorial_system_get_language_prefix
	switch <language_prefix>
		case 'EN'
		RandomNoRepeat (
			@ PreloadStream \{en_fb_fail_01}
			@ PreloadStream \{en_fb_fail_05}
			@ PreloadStream \{en_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'GR'
		RandomNoRepeat (
			@ PreloadStream \{gr_fb_fail_01}
			@ PreloadStream \{gr_fb_fail_05}
			@ PreloadStream \{gr_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'FR'
		RandomNoRepeat (
			@ PreloadStream \{fr_fb_fail_01}
			@ PreloadStream \{fr_fb_fail_05}
			@ PreloadStream \{fr_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'IT'
		RandomNoRepeat (
			@ PreloadStream \{it_fb_fail_01}
			@ PreloadStream \{it_fb_fail_05}
			@ PreloadStream \{it_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		case 'SP'
		RandomNoRepeat (
			@ PreloadStream \{sp_fb_fail_01}
			@ PreloadStream \{sp_fb_fail_05}
			@ PreloadStream \{sp_fb_fail_06}
			)
		Change celeb_intro_stream_id = <unique_id>
		default
		printf \{channel = sfx
			qs(0x490ec7ca)}
	endswitch
	SetSoundParams \{ampzilla_fail_attack_back
		vol = -10
		time = 4}
	SetSoundParams \{ampzilla_fail_attack_front
		vol = -10
		time = 4}
	Wait \{4
		Seconds}
	if NOT ($celeb_intro_stream_id = None)
		StartPreLoadedStream <unique_id> buss = Encore_Events forcesafepreload = 1 vol = 0 Priority = 1
		Change \{celeb_intro_stream_id = None}
	endif
endscript

script preload_fb_scene_2_stream 
	printf \{channel = sfx
		qs(0x9e15fdb9)}
	if ($game_mode = career)
		tutorial_system_get_language_prefix
		formatText checksumName = stream_checksum '%l_FB_Success_1st_Song' l = <language_prefix>
		PreloadStream <stream_checksum>
		Change celeb_intro_stream_id = <unique_id>
	endif
endscript

script audio_play_preloaded_fb_scene_2_stream 
	if ($game_mode = career)
		if NOT ($celeb_intro_stream_id = None)
			StartPreLoadedStream \{$celeb_intro_stream_id
				buss = Encore_Events
				forcesafepreload = 1
				vol = 0
				Priority = 1}
			Change \{celeb_intro_stream_id = None}
		endif
	endif
endscript

script preload_fb_scene_3_stream 
	printf \{channel = sfx
		qs(0x307d6c28)}
	if ($game_mode = career)
		tutorial_system_get_language_prefix
		formatText checksumName = stream_checksum '%l_FB_Success_2nd_Song' l = <language_prefix>
		PreloadStream <stream_checksum>
		Change celeb_intro_stream_id = <unique_id>
	endif
endscript

script audio_play_preloaded_fb_scene_3_stream 
	if ($game_mode = career)
		if NOT ($celeb_intro_stream_id = None)
			StartPreLoadedStream \{$celeb_intro_stream_id
				buss = Encore_Events
				forcesafepreload = 1
				vol = 0
				Priority = 1}
			Change \{celeb_intro_stream_id = None}
		endif
	endif
endscript

script audio_quiet_crowd_quickly_to_change_venue_freeplay 
	printf \{channel = sfx
		qs(0x603f9850)}
	StopSoundsByBuss \{Crowd
		fade_time = 0.6
		fade_type = linear}
endscript

script audio_delay_icon_appear 
	Wait \{0.15}
	SoundEvent \{event = stats_screen_stars_dropping}
	SoundEvent \{event = audio_ui_universal_popup_text_animate_in}
endscript

script audio_wait_to_play_unlock_sfx 
	Wait \{0.2
		Seconds}
	SoundEvent \{event = audio_ui_song_complete_unlock_new_item}
endscript

script audio_animate_in_competitive_mode_sfx 
	PlaySound \{stats_screen_stars_loop
		num_loops = -1
		attack_length = 0.4
		sustain_level = 0
		decay_length = 0.2
		release_length = 0.2
		attack_function = linear
		decay_function = log_fast
		release_function = linear
		buss = band_Balance}
	Wait \{0.2
		Seconds}
	SoundEvent \{event = stats_screen_star_whoosh}
	Wait \{0.1
		Seconds}
	SoundEvent \{event = stats_screen_last_star_hit}
	stopsound \{stats_screen_stars_loop}
	Wait \{0.5
		Seconds}
	PlaySound \{universal_popup_text_animate_in
		vol = -20
		buss = Front_End}
	SoundEvent \{event = stats_screen_stars_dropping}
endscript

script audio_waiting_for_crowd_to_fade 
	Wait \{2
		Seconds}
	setsoundbussparams {Crowd = {vol = ($game_bussset.Crowd.vol)} time = 1.0}
endscript

script audio_play_surges_during_encore_waiting_screen 
	GetPakManCurrentName \{map = zones}
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		printf \{channel = sfx
			qs(0xd9df487d)}
		SoundEvent \{event = $g_current_crowd_swell_long_soundevent}
		Wait (RandomFloat (4.0, 6.0)) Seconds
		SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
		Wait (RandomFloat (3.0, 4.0)) Seconds
		SoundEvent \{event = $g_current_crowd_swell_long_soundevent}
		Wait (RandomFloat (3.0, 4.0)) Seconds
		SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
		Wait (RandomFloat (3.0, 4.0)) Seconds
		SoundEvent \{event = $g_current_crowd_swell_long_soundevent}
	endif
endscript

script audio_kill_play_surges_during_encore_waiting_screen 
	printf \{channel = sfx
		qs(0xbf0214a0)}
	KillSpawnedScript \{Name = audio_play_surges_during_encore_waiting_screen}
	StopSoundEvent \{$g_current_crowd_swell_med_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$g_current_crowd_swell_short_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$g_current_crowd_swell_long_soundevent
		fade_time = 0.8
		fade_type = log_slow}
endscript

script audio_skip_song_in_freeplay_sfx 
	SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
	Wait (RandomFloat (1.0, 3.0)) Seconds
	SoundEvent \{event = $g_current_crowd_swell_long_soundevent}
	Wait (RandomFloat (1.0, 3.0)) Seconds
	SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
	Wait (RandomFloat (1.0, 3.0)) Seconds
	SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
endscript

script audio_ampzilla_scream 
	printf \{channel = sfx
		qs(0x49e7521d)}
	SoundEvent \{event = fb_success_scream}
endscript
