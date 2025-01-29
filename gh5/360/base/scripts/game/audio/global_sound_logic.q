
script create_venue_effects_settings 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
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

script PrintPushPopDebugInfo 
	if NOT GotParam \{push}
		if NOT GotParam \{pop}
			printf \{qs(0xf0680b89)}
			return
		endif
	endif
	if GotParam \{push}
		pushPop = qs(0x1acc2a0c)
	else
		pushPop = qs(0x8637b58f)
	endif
	if NOT GotParam \{Name}
		printf \{qs(0xd2bb34b1)}
		return
	endif
	printf qs(0x3c00af92) a = <Name> b = <pushPop>
endscript

script Generic_Reverb_Functionality_Script \{NewEchoSettings = $echo_dry
		EchoFadeTime = 0.5
		NewReverbSettings = $reverb_dry
		ReverbFadeTime = 0.5}
	if inside
		if GotParam \{NewEchoSettings}
			if GotParam \{EchoFadeTime}
				setsoundbusseffects effects = [{<NewEchoSettings> Name = crowd_w_reverb_buss_echo}] time = <EchoFadeTime>
			else
				setsoundbusseffects effects = [{<NewEchoSettings> Name = crowd_w_reverb_buss_echo}]
			endif
		endif
		if GotParam \{NewReverbSettings}
			if GotParam \{ReverbFadeTime}
				setsoundbusseffects effects = [{<NewReverbSettings> Name = crowd_w_reverb_buss_reverb}] time = <ReverbFadeTime>
			else
				setsoundbusseffects effects = [{<NewReverbSettings> Name = crowd_w_reverb_buss_reverb}]
			endif
		endif
	else
		if GotParam \{Destroyed}
		else
			if GotParam \{Created}
			else
				if GotParam \{ExitEchoSettings}
					if GotParam \{ExitEchoFadeTime}
						setsoundbusseffects effects = [{<ExitEchoSettings> Name = crowd_w_reverb_buss_echo}] time = <ExitEchoFadeTime>
					else
						setsoundbusseffects effects = [{<ExitEchoSettings> Name = crowd_w_reverb_buss_echo}]
					endif
				endif
				if GotParam \{ExitReverbSettings}
					if GotParam \{ExitReverbFadeTime}
						setsoundbusseffects effects = [{<ExitReverbSettings> Name = crowd_w_reverb_buss_reverb}] time = <ExitReverbFadeTime>
					else
						setsoundbusseffects effects = [{<ExitReverbSettings> Name = crowd_w_reverb_buss_reverb}]
					endif
				endif
			endif
		endif
	endif
endscript

script GH_Star_Power_Verb_On 
	printf \{channel = sfx
		qs(0x9892061a)}
	getplayerinfo <Player> part
	printf channel = sfx qs(0xbaecfbed) s = <Player>
	if ($Star_power_verb_is_on = 1)
		printf \{channel = sfx
			qs(0xf3504361)}
		if NOT isSinglePlayerGame
			printf \{channel = sfx
				qs(0x4292e934)}
			SpawnScriptNow star_power_clap_panning_multiple params = {Player = <Player>}
			SpawnScriptNow star_power_deployed_sfx_multiplayer params = {Player = <Player>}
		endif
	else
		printf \{channel = sfx
			qs(0xd6de249a)}
		SpawnScriptNow star_power_clap_panning params = {Player = <Player>}
		printf \{channel = sfx
			qs(0xc8d90171)}
		Change \{Star_power_verb_is_on = 1}
		gman_songtool_getcurrentsong
		if isps3
			if NOT (<current_song> = jamsession)
				if isSinglePlayerGame
					SoundEvent \{event = star_power_deployed_lfe_gh4}
					SoundEvent \{event = star_power_deployed_back_gh4}
					SoundEvent \{event = star_power_deployed_front_gh4}
					if ($game_mode != tutorial)
						if NOT IsSoundEventPlaying \{Star_Power_Deployed_Cheer_SFX}
							SoundEvent \{event = Star_Power_Deployed_Cheer_SFX}
						endif
					endif
				else
					SpawnScriptNow star_power_deployed_sfx_multiplayer params = {Player = <Player>}
				endif
			endif
		else
			if isSinglePlayerGame
				SoundEvent \{event = star_power_deployed_lfe_gh4}
				SoundEvent \{event = star_power_deployed_back_gh4}
				SoundEvent \{event = star_power_deployed_front_gh4}
				if ($game_mode != tutorial)
					if NOT IsSoundEventPlaying \{Star_Power_Deployed_Cheer_SFX}
						SoundEvent \{event = Star_Power_Deployed_Cheer_SFX}
					endif
				endif
			else
				SpawnScriptNow star_power_deployed_sfx_multiplayer params = {Player = <Player>}
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
	gman_songtool_getcurrentsong
	switch <part>
		case guitar
		printf \{channel = sfx
			qs(0xaf3a873b)}
		if NOT (<current_song> = jamsession)
			songsetvenueeffectsendvolume Player = <Player> vol = 0
		endif
		case bass
		printf \{channel = sfx
			qs(0xf7672ca5)}
		if NOT (<current_song> = jamsession)
			songsetvenueeffectsendvolume Player = <Player> vol = -10
		endif
		case drum
		printf \{channel = sfx
			qs(0x45603514)}
		if NOT (<current_song> = jamsession)
			songsetvenueeffectsendvolume Player = <Player> vol = -3
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
			Wetmix = 0.5
			delay = 100}
		default
		printf \{channel = sfx
			qs(0xacc915b2)}
	endswitch
endscript

script GH_Star_Power_Verb_Off 
	printf \{channel = sfx
		qs(0xfa676f80)}
	if ($Star_power_verb_is_on = 1)
	endif
	printf channel = sfx qs(0x149d7db3) s = <Player>
	SpawnScriptNow star_clap_end params = {Player = <Player>}
	SpawnScriptNow \{clap_fading}
	Change \{Star_power_verb_is_on = 0}
	gman_songtool_getcurrentsong
	if NOT (<current_song> = jamsession)
		songsetvenueeffectsendvolume Player = <Player> vol = -100
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
			wetmis = 0.25
			delay = 100}
	endif
endscript

script GH3_Set_Guitar_Verb_And_Echo_to_Dry 
endscript

script gh5_music_change_dsp_snapshot \{time = 4
		scriptname = None}
	printf channel = sfx qs(0x71489f1f) s = <scriptname>
	singalong_effect_send = -6
	singalong_buss = -3
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		printf \{channel = sfx
			qs(0x9733853e)}
		venuesize = 'nothing'
	endif
	switch <venuesize>
		case 'Large_EXT'
		printf \{channel = sfx
			qs(0xd7731e55)}
		<singalong_effect_send> = -1
		<singalong_buss> = -3
		case 'Large_INT'
		printf \{channel = sfx
			qs(0xd5c3d66d)}
		<singalong_effect_send> = -2
		<singalong_buss> = -3
		case 'Medium_INT'
		printf \{channel = sfx
			qs(0x89bdc134)}
		<singalong_effect_send> = -6
		<singalong_buss> = -3
		case 'Medium_EXT'
		printf \{channel = sfx
			qs(0x8b0d090c)}
		<singalong_effect_send> = -6
		<singalong_buss> = -2
		case 'Small_INT'
		printf \{channel = sfx
			qs(0x3d696ba6)}
		<singalong_effect_send> = -6.5
		<singalong_buss> = -4
		case 'Small_EXT'
		printf \{channel = sfx
			qs(0x3fd9a39e)}
		<singalong_effect_send> = -6
		<singalong_buss> = -2
		default
		printf \{channel = sfx
			qs(0x79963774)}
		<singalong_effect_send> = -6
		<singalong_buss> = -2
	endswitch
	if GotParam \{snapshot}
		switch <snapshot>
			case 'house'
			printf \{channel = sfx
				qs(0xc5ba5694)}
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
			Change current_eq_kick_gain = ($eq_house_kick.gain)
			Change current_delay_kick_wetmix = ($echo_house_kick.Wetmix)
			Change current_eq_snare_gain = ($eq_house_snare.gain)
			Change current_delay_snare_wetmix = ($echo_house_snare.Wetmix)
			Change current_eq_cymbal_gain = ($eq_house_cymbal.gain)
			Change current_comp_guitar_threshold = ($compressor_house_guitar.THRESHOLD)
			Change current_eq_guitar_gain = ($eq_house_guitar.gain)
			Change current_comp_bass_threshold = ($compressor_house_bass.THRESHOLD)
			Change current_eq_bass_gain = ($eq_house_bass.gain)
			Change current_eq_vocals_gain = ($eq_house_vocal.gain)
			Change current_delay_vocals_wetmix = ($echo_house_vocal.Wetmix)
			venuetypedecision params = {time = <time>}
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
			songsetvenueeffectsendvolume \{track = kick
				vol = -6}
			songsetvenueeffectsendvolume \{track = snare
				vol = -6}
			songsetvenueeffectsendvolume \{track = cymbal
				vol = -12}
			songsetvenueeffectsendvolume \{track = tom
				vol = -6}
			songsetvenueeffectsendvolume \{track = guitar
				vol = 0}
			songsetvenueeffectsendvolume \{track = bass
				vol = 2}
			songsetvenueeffectsendvolume \{track = vocal
				vol = -6}
			songsetvenueeffectsendvolume \{track = Band
				vol = -6}
			GetPakManCurrent \{map = zones}
			if (<pak> = z_visualizer)
				songsetvenueeffectsendvolume \{track = Crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				songsetvenueeffectsendvolume \{track = Crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			endif
			case 'stage'
			printf \{channel = sfx
				qs(0x7c1981b3)}
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
			Change current_eq_kick_gain = ($eq_stage_kick.gain)
			Change current_delay_kick_wetmix = ($echo_stage_kick.Wetmix)
			Change current_eq_snare_gain = ($eq_stage_snare.gain)
			Change current_delay_snare_wetmix = ($echo_stage_snare.Wetmix)
			Change current_eq_cymbal_gain = ($eq_stage_cymbal.gain)
			Change current_comp_guitar_threshold = ($compressor_stage_guitar.THRESHOLD)
			Change current_eq_guitar_gain = ($eq_stage_guitar.gain)
			Change current_comp_bass_threshold = ($compressor_stage_bass.THRESHOLD)
			Change current_eq_bass_gain = ($eq_stage_bass.gain)
			Change current_eq_vocals_gain = ($eq_stage_vocal.gain)
			Change current_delay_vocals_wetmix = ($echo_stage_vocal.Wetmix)
			venuetypedecision params = {time = <time>}
			setsoundbussparams $stage_bussset time = <time>
			songsetvenueeffectsendvolume \{track = kick
				vol = -11}
			songsetvenueeffectsendvolume \{track = snare
				vol = -15}
			songsetvenueeffectsendvolume \{track = cymbal
				vol = -5}
			songsetvenueeffectsendvolume \{track = tom
				vol = -7}
			songsetvenueeffectsendvolume \{track = vocal
				vol = -17}
			songsetvenueeffectsendvolume \{track = guitar
				vol = -11}
			songsetvenueeffectsendvolume \{track = bass
				vol = -5}
			songsetvenueeffectsendvolume \{track = Band
				vol = -7}
			GetPakManCurrent \{map = zones}
			if (<pak> = z_visualizer)
				songsetvenueeffectsendvolume \{track = Crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				songsetvenueeffectsendvolume track = Crowd vol = (<singalong_effect_send> - 4)
				setsoundbussparams {crowdsingalong_stream = {vol = (<singalong_buss> - 13.5)} time = <time>}
			endif
			Change \{current_send_vol = 6}
			case 'game'
			printf \{channel = sfx
				qs(0x0735013e)}
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
			Change current_eq_kick_gain = ($eq_game_kick.gain)
			Change current_delay_kick_wetmix = ($echo_game_kick.Wetmix)
			Change current_eq_snare_gain = ($eq_game_snare.gain)
			Change current_delay_snare_wetmix = ($echo_game_snare.Wetmix)
			Change current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			Change current_comp_guitar_threshold = ($compressor_game_guitar.THRESHOLD)
			Change current_eq_guitar_gain = ($eq_game_guitar.gain)
			Change current_comp_bass_threshold = ($compressor_game_bass.THRESHOLD)
			Change current_eq_bass_gain = ($eq_game_bass.gain)
			Change current_eq_vocals_gain = ($eq_game_vocal.gain)
			Change current_delay_vocals_wetmix = ($echo_game_vocal.Wetmix)
			venuetypedecision params = {time = <time>}
			setsoundbussparams $game_bussset time = <time>
			songsetvenueeffectsendvolume \{track = kick
				vol = -100}
			songsetvenueeffectsendvolume \{track = snare
				vol = -100}
			songsetvenueeffectsendvolume \{track = cymbal
				vol = -100}
			songsetvenueeffectsendvolume \{track = guitar
				vol = -100}
			songsetvenueeffectsendvolume \{track = bass
				vol = -100}
			songsetvenueeffectsendvolume \{track = vocal
				vol = -100}
			songsetvenueeffectsendvolume \{track = tom
				vol = -100}
			songsetvenueeffectsendvolume \{track = Band
				vol = -100}
			gamemode_gettype
			GetPakManCurrent \{map = zones}
			if (<Type> = freeplay)
				if (<pak> = z_visualizer)
					songsetvenueeffectsendvolume \{track = Crowd
						vol = -100}
					setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
				else
					songsetvenueeffectsendvolume track = Crowd vol = <singalong_effect_send>
					setsoundbussparams {crowdsingalong_stream = {vol = <singalong_buss>} time = <time>}
				endif
			else
				if (<pak> = z_visualizer)
					songsetvenueeffectsendvolume \{track = Crowd
						vol = -100}
					setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
				else
					songsetvenueeffectsendvolume \{track = Crowd
						vol = -100}
					setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
				endif
			endif
			Change \{current_send_vol = 0}
			case 'join'
			printf \{channel = sfx
				qs(0xcaac3b03)}
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
			Change current_eq_kick_gain = ($eq_game_kick.gain)
			Change current_delay_kick_wetmix = ($echo_game_kick.Wetmix)
			Change current_eq_snare_gain = ($eq_game_snare.gain)
			Change current_delay_snare_wetmix = ($echo_game_snare.Wetmix)
			Change current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			Change current_comp_guitar_threshold = ($compressor_game_guitar.THRESHOLD)
			Change current_eq_guitar_gain = ($eq_game_guitar.gain)
			Change current_comp_bass_threshold = ($compressor_game_bass.THRESHOLD)
			Change current_eq_bass_gain = ($eq_game_bass.gain)
			Change current_eq_vocals_gain = ($eq_game_vocal.gain)
			Change current_delay_vocals_wetmix = ($echo_game_vocal.Wetmix)
			setsoundbussparams $join_bussset time = <time>
			songsetvenueeffectsendvolume \{track = kick
				vol = -15}
			songsetvenueeffectsendvolume \{track = snare
				vol = -15}
			songsetvenueeffectsendvolume \{track = cymbal
				vol = -6}
			songsetvenueeffectsendvolume \{track = tom
				vol = -6}
			songsetvenueeffectsendvolume \{track = vocal
				vol = -15}
			songsetvenueeffectsendvolume \{track = guitar
				vol = -15}
			songsetvenueeffectsendvolume \{track = bass
				vol = -6}
			songsetvenueeffectsendvolume \{track = Band
				vol = -6}
			GetPakManCurrent \{map = zones}
			if (<pak> = z_visualizer)
				songsetvenueeffectsendvolume \{track = Crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				songsetvenueeffectsendvolume track = Crowd vol = (<singalong_effect_send> - 3)
				setsoundbussparams {crowdsingalong_stream = {vol = (<singalong_buss> - 9.5)} time = <time>}
			endif
			Change \{current_send_vol = 6}
			case 'pause'
			printf \{channel = sfx
				qs(0xe44985ba)}
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
			Change current_eq_kick_gain = ($eq_game_kick.gain)
			Change current_delay_kick_wetmix = ($echo_game_kick.Wetmix)
			Change current_eq_snare_gain = ($eq_game_snare.gain)
			Change current_delay_snare_wetmix = ($echo_game_snare.Wetmix)
			Change current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			Change current_comp_guitar_threshold = ($compressor_game_guitar.THRESHOLD)
			Change current_eq_guitar_gain = ($eq_game_guitar.gain)
			Change current_comp_bass_threshold = ($compressor_game_bass.THRESHOLD)
			Change current_eq_bass_gain = ($eq_game_bass.gain)
			Change current_eq_vocals_gain = ($eq_game_vocal.gain)
			Change current_delay_vocals_wetmix = ($echo_game_vocal.Wetmix)
			setsoundbussparams $pause_bussset time = <time>
			songsetvenueeffectsendvolume \{track = kick
				vol = -100}
			songsetvenueeffectsendvolume \{track = snare
				vol = -100}
			songsetvenueeffectsendvolume \{track = cymbal
				vol
				-100}
			songsetvenueeffectsendvolume \{track = guitar
				vol = -100}
			songsetvenueeffectsendvolume \{track = bass
				vol = -100}
			songsetvenueeffectsendvolume \{track = vocal
				vol = -100}
			songsetvenueeffectsendvolume \{track = tom
				vol = -100}
			songsetvenueeffectsendvolume \{track = Band
				vol = -100}
			GetPakManCurrent \{map = zones}
			if (<pak> = z_visualizer)
				songsetvenueeffectsendvolume \{track = Crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				songsetvenueeffectsendvolume track = Crowd vol = (<singalong_effect_send> - 1)
				setsoundbussparams {crowdsingalong_stream = {vol = (<singalong_buss> - 9)} time = <time>}
			endif
			Change \{current_send_vol = 6}
		endswitch
	endif
endscript

script setup_all_crowd_sounds_based_on_zone 
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
	formatText checksumName = whistletemp '%s_Crowd_Whistle_Positive' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_whistle_soundevent = <whistletemp>
	formatText checksumName = oneshotgoodtemp '%s_Crowd_OneShot_Positive' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_oneshot_positive_soundevent = <oneshotgoodtemp>
	formatText checksumName = oneshotbadtemp '%s_Crowd_OneShot_Negative' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_oneshot_negative_soundevent = <oneshotbadtemp>
	formatText checksumName = loopgoodtemp 'Crowd_Loop_%s_Good' s = <venuesize> AddToStringLookup = true
	Change current_crowd_looping_bg_area_good = <loopgoodtemp>
	formatText checksumName = loopneutraltemp 'Crowd_Loop_%s_Neutral' s = <venuesize> AddToStringLookup = true
	Change current_crowd_looping_bg_area_neutral = <loopneutraltemp>
	formatText checksumName = loopbadtemp 'Crowd_Loop_%s_Bad' s = <venuesize> AddToStringLookup = true
	Change current_crowd_looping_bg_area_bad = <loopbadtemp>
	crowdtransitionchecksum = crowd_transition
	formatText checksumName = claptemp '%s_Crowd_Clap_To_Beat_Normal' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_clap_normal_soundevent = <claptemp>
	formatText checksumName = claptemp '%s_Crowd_Clap_To_Beat_Middle' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_clap_middle_soundevent = <claptemp>
	formatText checksumName = claptemp '%s_Crowd_Clap_To_Beat_Left_Middle' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_clap_left_middle_soundevent = <claptemp>
	formatText checksumName = claptemp '%s_Crowd_Clap_To_Beat_Right_Middle' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_clap_right_middle_soundevent = <claptemp>
	formatText checksumName = claptemp '%s_Crowd_Clap_To_Beat_Left' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_clap_left_soundevent = <claptemp>
	formatText checksumName = claptemp '%s_Crowd_Clap_To_Beat_Right' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_clap_right_soundevent = <claptemp>
	formatText checksumName = transitiontemp '%s_Crowd_Negative_To_Neutral' s = <venuetype> AddToStringLookup = true
	Change current_crowd_transition_negative_to_neutral = <transitiontemp>
	formatText checksumName = transitiontemp '%s_Crowd_Neutral_To_Negative' s = <venuetype> AddToStringLookup = true
	Change current_crowd_transition_neutral_to_negative = <transitiontemp>
	formatText checksumName = transitiontemp '%s_Crowd_Neutral_To_Positive' s = <venuetype> AddToStringLookup = true
	Change current_crowd_transition_neutral_to_positive = <transitiontemp>
	formatText checksumName = transitiontemp '%s_Crowd_Positive_To_Neutral' s = <venuetype> AddToStringLookup = true
	Change current_crowd_transition_positive_to_neutral = <transitiontemp>
	formatText checksumName = swelltemp '%s_Crowd_Swell_Short' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_swell_short_soundevent = <swelltemp>
	formatText checksumName = swelltemp '%s_Crowd_Swell_Short_Soft' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_swell_short_soft_soundevent = <swelltemp>
	formatText checksumName = swelltemp '%s_Crowd_Swell_Med' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_swell_med_soundevent = <swelltemp>
	formatText checksumName = swelltemp '%s_Crowd_Swell_Long' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_swell_long_soundevent = <swelltemp>
	formatText checksumName = encoretemp '%s_Encore_Crowd' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_encore = <encoretemp>
	formatText checksumName = anticipationtemp '%s_Crowd_Anticipation_Loop' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_anticipation = <anticipationtemp>
	formatText checksumName = applausetemp '%s_Crowd_Applause' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_applause_soundevent = <applausetemp>
	formatText checksumName = introtemp '%s_Crowd_Venue_Intro' s = <pakname> AddToStringLookup = true
	Change current_crowd_venue_intro_soundevent = <introtemp>
	formatText checksumName = preencoretemp '%s_Crowd_PreEncore_Looping_SoundEvent' s = <newvenuesize> AddToStringLookup = true
	Change current_crowd_preencore_looping_soundevent = <preencoretemp>
	formatText checksumName = tempvenuesize '%s' s = <newvenuesize> AddToStringLookup = true
	Change current_venue_size = <tempvenuesize>
	printf \{channel = sfx
		qs(0xfba306ee)}
	printf \{channel = sfx
		qs(0x8d80eacf)
		s = $current_crowd_whistle_soundevent}
	printf \{channel = sfx
		qs(0xf1a35267)
		s = $current_crowd_oneshot_positive_soundevent}
	printf \{channel = sfx
		qs(0xfe1327ac)
		s = $current_crowd_oneshot_negative_soundevent}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0x77767cd1)
		s = $current_crowd_looping_bg_area_bad}
	printf \{channel = sfx
		qs(0x832a45ec)
		s = $current_crowd_looping_bg_area_neutral}
	printf \{channel = sfx
		qs(0xf6e25b4b)
		s = $current_crowd_looping_bg_area_good}
	printf \{channel = sfx
		qs(0x24ab80a8)
		s = $current_crowd_looping_bg_area}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0x36c99555)
		s = $current_crowd_transition_negative_to_neutral}
	printf \{channel = sfx
		qs(0xddf4ea0b)
		s = $current_crowd_transition_neutral_to_negative}
	printf \{channel = sfx
		qs(0x7eeabe3c)
		s = $current_crowd_transition_neutral_to_positive}
	printf \{channel = sfx
		qs(0x3979e09e)
		s = $current_crowd_transition_positive_to_neutral}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0xe6bc13b4)
		s = $current_crowd_swell_short_soundevent}
	printf \{channel = sfx
		qs(0x5881663d)
		s = $current_crowd_swell_med_soundevent}
	printf \{channel = sfx
		qs(0x8f5e027f)
		s = $current_crowd_swell_long_soundevent}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0xec13644d)
		s = $current_crowd_applause_soundevent}
	printf \{channel = sfx
		qs(0xfba306ee)}
endscript

script GH3_Crowd_Event_Listener 
	if NOT ($crowd_in_jam_mode_song_state = 1)
		if GotParam \{pak}
		endif
		if NOT ($game_mode = practice)
			if GotParam \{event_type}
				switch <event_type>
					case 1
					if ($turn_off_oneshot_cheers = 0)
						play_a_short_crowd_swell_for_this_venue
					endif
					case 2
					if ($turn_off_oneshot_cheers = 0)
						play_a_crowd_applause_for_this_venue
					endif
					case 3
					if ($current_crowd >= 1.3333)
						if ($turn_off_oneshot_cheers = 0)
							crowd_surge_and_sustain_at_end_of_song
						endif
					endif
					case 4
					play_a_crowd_whistle_good_based_on_venue
					case 5
					if ($current_crowd >= 1.3333)
						gh3_adjustcrowdfastsmallsurge
					endif
					case 6
					if ($current_crowd >= 1.3333)
						if ($turn_off_oneshot_cheers = 0)
							play_a_short_crowd_swell_for_this_venue_softer
						endif
						gh3_adjustcrowdfastbigsurge
					endif
					case 7
					if ($current_crowd >= 1.3333)
						if ($turn_off_oneshot_cheers = 0)
							play_a_med_crowd_swell_for_this_venue
						endif
						gh3_adjustcrowdmedsurge
					endif
					case 8
					if ($current_crowd >= 1.3333)
						if ($turn_off_oneshot_cheers = 0)
							play_a_long_crowd_swell_for_this_venue
						endif
						gh3_adjustcrowdslowbigsurge
					endif
					case 9
					printf \{'Not Working Right Now'}
					case 10
					song_quiet_adjust_all_sfx_down
					case 11
					song_quiet_over_adjust_all_sfx_to_normal
					case 12
					moment_on_stage_crowd_reaction_sfx
					default
					printf \{channel = sfx
						qs(0x3c088a0f)}
				endswitch
			endif
		endif
	else
		printf \{channel = sfx
			qs(0x595a9f3d)}
	endif
endscript

script play_a_crowd_whistle_good_based_on_venue 
	SoundEvent \{event = $current_crowd_whistle_soundevent}
endscript

script play_a_short_crowd_swell_for_this_venue 
	printf \{channel = sfx
		qs(0x32f04896)
		s = $current_crowd_swell_short_soundevent}
	SoundEvent \{event = $current_crowd_swell_short_soundevent}
	Crowd_AllPlayAnim \{anim = swellsh
		playonce = true}
endscript

script play_a_short_crowd_swell_for_this_venue_softer 
	SoundEvent \{event = $current_crowd_swell_short_soft_soundevent}
	Crowd_AllPlayAnim \{anim = swellsh
		playonce = true}
endscript

script play_a_med_crowd_swell_for_this_venue 
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	Crowd_AllPlayAnim \{anim = swellmd
		playonce = true}
endscript

script play_a_long_crowd_swell_for_this_venue 
	SoundEvent \{event = $current_crowd_swell_long_soundevent}
	Crowd_AllPlayAnim \{anim = swelllg
		playonce = true}
endscript

script play_a_crowd_applause_for_this_venue 
	SoundEvent \{event = $current_crowd_applause_soundevent}
endscript

script GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue 
endscript

script GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue 
endscript

script gh3_adjustcrowdloopbacktodefault \{restarting = 0
		Normal = 0}
	if ($current_playing_transition = loading)
	else
		printf \{channel = sfx
			qs(0x569ef608)}
		if (<restarting> = 1)
			if GotParam \{time}
				setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0} time = 1.5}
			else
				setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0} time = 1.5}
			endif
		else
			if (<Normal> = 1)
				if GotParam \{time}
					setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0} time = 1.5}
				else
					setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0} time = 1.5}
				endif
			else
			endif
		endif
	endif
endscript

script gh3_adjustcrowdfastsmallsurge 
	if GotParam \{pak}
		printf channel = sfx qs(0x4d995118) s = <pak>
	endif
	printf \{channel = sfx
		qs(0xf2c3f029)}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 2)} time = 0.08}
	Wait \{1.5
		Seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		Normal = 1}
endscript

script gh3_adjustcrowdfastbigsurge 
	if GotParam \{pak}
		printf channel = sfx qs(0xff61e7c6) s = <pak>
	endif
	printf \{channel = sfx
		qs(0x71cbe9dd)}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 4)} time = 0.08}
	Wait \{1.5
		Seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		Normal = 1}
endscript

script gh3_adjustcrowdmedsurge 
	if GotParam \{pak}
		printf channel = sfx qs(0x0d163bb8) s = <pak>
	endif
	printf \{channel = sfx
		qs(0x07ac0c0b)}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 4)} time = 2}
	Wait \{4
		Seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		Normal = 1}
endscript

script gh3_adjustcrowdslowbigsurge 
	if GotParam \{pak}
		printf channel = sfx qs(0xe0d3da54) s = <pak>
	endif
	printf \{channel = sfx
		qs(0xcd3ff7f4)}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 4)} time = 3}
	Wait \{8
		Seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		Normal = 1}
endscript

script song_quiet_adjust_all_sfx_down \{sfxbalancetime = 4
		crowdbalancetime = 8
		sfxvolsub = 4.0
		crowdvolsub = 5.0}
	gamemode_gettype
	printf \{channel = sfx
		qs(0xfa5455b6)}
	setsoundbussparams {sfx_balance = {vol = (($default_BussSet.sfx_balance.vol) - <sfxvolsub>)} time = <sfxbalancetime>}
	setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol) - <crowdvolsub>)} time = <crowdbalancetime>}
endscript

script song_quiet_over_adjust_all_sfx_to_normal \{sfxbalancetime = 8
		crowdbalancetime = 4}
	gamemode_gettype
	printf \{channel = sfx
		qs(0x1c6b884d)}
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)} time = <sfxbalancetime>}
	setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)} time = <crowdbalancetime>}
endscript

script song_quiet_reset_sfx_balance \{loading_transition = 0
		restarting = 0}
	if (<loading_transition> = 1)
		printf \{channel = sfx
			qs(0x989d0b7a)}
	else
		if (<restarting> = 1)
			printf \{channel = sfx
				qs(0xf695898a)}
			printf \{channel = sfx
				qs(0xd75ad5d0)}
			setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)}}
			setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)}}
		else
			printf \{channel = sfx
				qs(0xd4c3161a)}
			Change \{crowd_transition_start_of_song_normal = 1}
			printf \{channel = sfx
				qs(0xd626aaa4)}
		endif
	endif
endscript

script moment_on_stage_crowd_reaction_sfx 
endscript

script crowd_surge_and_sustain_at_end_of_song 
	printf \{channel = sfx
		qs(0x81999d59)}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 4)} time = 3.5}
endscript

script Crowd_Singalong_Volume_Up 
	GetPakManCurrent \{map = zones}
	gman_songtool_getcurrentsong
	gamemode_gettype
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		printf \{channel = sfx
			qs(0x9733853e)}
		venuesize = 'nothing'
	endif
	if NOT (<Type> = freeplay)
		if NOT ((<pak> = z_visualizer) || (<pak> = z_cube))
			if NOT (<current_song> = jamsession)
				if NOT ($crowd_is_singing = 1)
					switch <venuesize>
						case 'Large_EXT'
						printf \{channel = sfx
							qs(0xd7731e55)}
						songsetvenueeffectsendvolume \{track = Crowd
							vol = -1}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -3
							}
							time = 4}
						case 'Large_INT'
						printf \{channel = sfx
							qs(0xd5c3d66d)}
						songsetvenueeffectsendvolume \{track = Crowd
							vol = -2}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -3
							}
							time = 4}
						case 'Medium_INT'
						printf \{channel = sfx
							qs(0x89bdc134)}
						songsetvenueeffectsendvolume \{track = Crowd
							vol = -6}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -3
							}
							time = 4}
						case 'Medium_EXT'
						printf \{channel = sfx
							qs(0x8b0d090c)}
						songsetvenueeffectsendvolume \{track = Crowd
							vol = -6}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -2
							}
							time = 4}
						case 'Small_INT'
						printf \{channel = sfx
							qs(0x3d696ba6)}
						songsetvenueeffectsendvolume \{track = Crowd
							vol = -6.5}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -4
							}
							time = 4}
						case 'Small_EXT'
						printf \{channel = sfx
							qs(0x3fd9a39e)}
						songsetvenueeffectsendvolume \{track = Crowd
							vol = -6}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -2
							}
							time = 4}
						default
						printf \{channel = sfx
							qs(0x79963774)}
						songsetvenueeffectsendvolume \{track = Crowd
							vol = -7}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -3
							}
							time = 4}
					endswitch
				endif
			endif
		endif
	endif
	Change \{crowd_is_singing = 1}
endscript

script Crowd_Singalong_Volume_Down 
	gamemode_gettype
	if NOT (<Type> = freeplay)
		gman_songtool_getcurrentsong
		if NOT (<current_song> = jamsession)
			if ($crowd_is_singing = 1)
				songsetvenueeffectsendvolume \{track = Crowd
					vol = -100}
				setsoundbussparams \{crowdsingalong_stream = {
						vol = -100.0
					}
					time = 4}
			endif
		endif
	endif
	Change \{crowd_is_singing = 0}
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
	if ($game_mode = p2_pro_faceoff)
		do_actual_changing_of_looping_sound crowd_looping_state = good loading_transition = <loading_transition> restarting = <restarting>
	else
		do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state> loading_transition = <loading_transition> restarting = <restarting>
	endif
endscript

script do_actual_changing_of_looping_sound \{loading_transition = 0
		restarting = 0}
	if GotParam \{crowd_looping_state}
		GetPakManCurrent \{map = zones}
		switch <crowd_looping_state>
			case bad
			new_bg_area = $current_crowd_looping_bg_area_bad
			new_oneshots = $current_crowd_oneshot_negative_soundevent
			case neutral
			new_bg_area = $current_crowd_looping_bg_area_neutral
			new_oneshots = $current_crowd_oneshot_positive_soundevent
			case good
			new_bg_area = $current_crowd_looping_bg_area_good
			new_oneshots = $current_crowd_oneshot_positive_soundevent
			default
			printf \{channel = sfx
				qs(0xae489741)}
			new_bg_area = $current_crowd_looping_bg_area_good
			new_oneshots = $current_crowd_oneshot_positive_soundevent
		endswitch
	else
		printf \{channel = sfx
			qs(0x5b438be7)}
		return
	endif
	if (($crowd_in_jam_mode_song_state = 1))
		new_oneshots = DoNothing_OneShot
	endif
	printf \{channel = sfx
		qs(0x2eecfe07)}
	if ($calibrate_lag_enabled = 0)
		Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = <new_bg_area> loading_transition = <loading_transition> restarting = <restarting>
	else
		Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = FrontEnd loading_transition = <loading_transition> restarting = <restarting>
	endif
	One_Shot_SoundEvent SoundEvent = <new_oneshots> waitTime = 5
endscript

script BG_Crowd_Front_End_Silence \{immediate = 0}
	Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = FrontEnd immediate = <immediate>
	One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waitTime = 5 immediate = <immediate>
endscript

script Crowd_Transition_SFX_Poor_To_Medium 
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x3da6f454)}
		Crowd_generic_transition_sfx state = negative_to_neutral Player = <Player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Good 
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x7ba459ad)}
		Crowd_generic_transition_sfx state = neutral_to_positive Player = <Player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Poor 
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x73ffdd74)}
		Crowd_generic_transition_sfx state = neutral_to_negative Player = <Player>
	endif
endscript

script Crowd_Transition_SFX_Good_To_Medium 
	gh3_adjustcrowdloopbacktodefault \{time = 1
		Normal = 1}
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x713e8a0b)}
		Crowd_generic_transition_sfx state = positive_to_neutral Player = <Player>
	endif
endscript

script Crowd_generic_transition_sfx \{state = neutral_to_positive}
	if ($game_mode = p2_pro_faceoff)
	else
		play_transition_sfx state = <state> left = 1 right = 1
	endif
endscript

script transition_sfx_left_side 
	play_transition_sfx state = <state> left = 1
endscript

script transition_sfx_right_side 
	play_transition_sfx state = <state> right = 1
endscript

script play_transition_sfx 
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
			stopsound \{$current_crowd_transition_neutral_to_negative
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $current_crowd_transition_negative_to_neutral
			if ((<venuesize> = 'Large_EXT') || (<venuesize> = 'Large_INT'))
				Volume = 11
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				Volume = 8
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				Volume = 6
			endif
			case neutral_to_positive
			stopsound \{$current_crowd_transition_positive_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $current_crowd_transition_neutral_to_positive
			if (<venuesize> = 'Large_EXT')
				Volume = 1.5
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				Volume = 6
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				Volume = 2
			endif
			case positive_to_neutral
			stopsound \{$current_crowd_transition_neutral_to_positive
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $current_crowd_transition_positive_to_neutral
			if (<venuesize> = 'Large_EXT')
				Volume = 3
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				Volume = 0.5
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				Volume = 1.5
			endif
			case neutral_to_negative
			stopsound \{$current_crowd_transition_negative_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $current_crowd_transition_neutral_to_negative
			if (<venuesize> = 'Large_EXT')
				Volume = 5
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				Volume = 0
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				Volume = 3
			endif
			case med_to_good
			printf \{qs(0x51243726)}
			stopsound \{$current_crowd_transition_positive_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $current_crowd_transition_neutral_to_positive
			default
			printf \{qs(0x712bf1ca)}
		endswitch
		Wait \{1
			gameframe}
		if GotParam \{left}
			if GotParam \{right}
				printf \{channel = sfx
					qs(0x0316271d)}
				get_multiplayer_sfx_pan_values \{crowd_meter_transition
					wide}
				PlaySound <transitionevent> vol = <Volume> buss = Crowd_Transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
				printf \{channel = sfx
					qs(0x58436b7c)}
				get_multiplayer_sfx_pan_values \{crowd_meter_transition
					left}
				PlaySound <transitionevent> buss = Crowd_Transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		else
			if GotParam \{right}
				printf \{channel = sfx
					qs(0x0e3be335)}
				get_multiplayer_sfx_pan_values \{crowd_meter_transition
					right}
				PlaySound <transitionevent> buss = Crowd_Transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
				printf \{channel = sfx
					qs(0xdf6ecc9d)}
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
		Crowd_generic_transition_sfx state = negative_to_neutral Player = <Player>
	endif
endscript

script crowd_transition_sfx_neutral_to_positive 
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x7ba459ad)}
		Crowd_generic_transition_sfx state = neutral_to_positive Player = <Player>
	endif
endscript

script crowd_transition_sfx_neutral_to_negative 
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x73ffdd74)}
		Crowd_generic_transition_sfx state = neutral_to_negative Player = <Player>
	endif
endscript

script crowd_transition_sfx_positive_to_neutral 
	gh3_adjustcrowdloopbacktodefault \{time = 1
		Normal = 1}
	if GotParam \{Player}
		Wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x713e8a0b)}
		Crowd_generic_transition_sfx state = positive_to_neutral Player = <Player>
	endif
endscript

script menu_music_on 
	SpawnScriptNow menu_music_on_spawned params = {<...>}
endscript

script menu_music_on_spawned 
	if ($menu_music_on_flag = 1)
		return
	else
		Change \{menu_music_on_flag = 1}
	endif
	if GotParam \{waitforguitarlick}
		Wait \{4
			Seconds}
		SoundEvent \{event = guitar_lick_crowd_swell}
	endif
	EnableUserMusic
	begin
	SoundEvent \{event = Menu_Music_SE}
	if ($menu_music_pan_right = 1)
		SetSoundParams \{$current_menu_song
			pan1x = -1
			pan1y = 1
			pan2x = -0.4
			pan2y = 1}
	endif
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd
		fadeintime = 2.0
		fadeintype = linear
		fadeouttime = 2
		fadeouttype = linear}
	One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waitTime = 5 immediate = <immediate>
	Wait \{2
		Seconds}
	Menu_music_Checking
	Wait \{1
		Second}
	repeat
endscript

script menu_music_panning_vol 
	if (issoundplaying $current_menu_song)
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

script menu_music_pan_reset 
	if ($menu_music_pan_right = 1)
		Change \{menu_music_pan_right = 0}
		i = -0.4
		begin
		SetSoundParams $current_menu_song pan1x = -1 pan1y = 1 pan2x = <i> pan2y = 1
		i = (<i> + 0.0077770003)
		Wait \{1
			gameframe}
		repeat 180
	endif
endscript

script menu_music_pan 
	if ($menu_music_pan_right = 0)
		Change \{menu_music_pan_right = 1}
		i = 1
		begin
		SetSoundParams $current_menu_song pan1x = -1 pan1y = 1 pan2x = <i> pan2y = 1
		i = (<i> -0.0077770003)
		Wait \{1
			gameframe}
		repeat 180
	endif
endscript

script Menu_music_Checking 
	begin
	if ($menu_music_preloading = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	begin
	Wait \{1
		Second}
	if NOT issoundplaying \{$menu_music_stream}
		break
	endif
	repeat
endscript

script menu_music_off 
	disableusermusic
	KillSpawnedScript \{Name = menu_music_on}
	KillSpawnedScript \{Name = menu_music_on_spawned}
	Change \{menu_music_on_flag = 0}
	killmenumusic
endscript

script gh5_band_screen_ui_sound \{player_num = 2}
	SetSpawnInstanceLimits \{Max = 6
		management = kill_oldest}
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
		stopsound \{lobbyscroll01}
		PlaySound lobbyscroll01 vol = -9 pitch = 1 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{down}
		printf \{channel = sfx
			qs(0x603e66a7)}
		stopsound \{lobbyscroll01}
		PlaySound lobbyscroll01 vol = -9 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{choose}
		printf \{channel = sfx
			qs(0x03d77756)}
		stopsound \{lobbyselecta}
		PlaySound lobbyselecta vol = 0 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{back}
		printf \{channel = sfx
			qs(0x3e573add)}
		stopsound \{lobbyback06}
		PlaySound lobbyback06 vol = -8 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{generic_back}
		printf \{channel = sfx
			qs(0xffb7ef45)}
		stopsound \{UI_Sound_09}
		PlaySound UI_Sound_09 vol = -5.5 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{error}
		printf \{channel = sfx
			qs(0x6504f146)}
		stopsound \{menu_select_negative}
		PlaySound menu_select_negative vol = -4 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script game_rules_sfx 
	if GotParam \{scroll}
		switch <scroll>
			case up
			SoundEvent \{event = ui_sfx_scroll_up}
			case down
			SoundEvent \{event = ui_sfx_scroll_up}
			default
			SoundEvent \{event = ui_sfx_scroll_up}
		endswitch
	elseif GotParam \{choose}
		SoundEvent \{event = ui_sfx_select}
	elseif GotParam \{negative}
		SoundEvent \{event = ui_sfx_negative_select}
	endif
endscript

script attract_mode_start_sound_script 
	printf \{channel = sfx
		qs(0xa66c98f7)}
	setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) - 100)} time = 2.5}
	setsoundbussparams {vocals_balance = {vol = (($default_BussSet.vocals_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {drums_balance = {vol = (($default_BussSet.drums_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {Guitar_Balance = {vol = (($default_BussSet.Guitar_Balance.vol) - 11)} time = 1.5}
	setsoundbussparams {bass_balance = {vol = (($default_BussSet.bass_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {rhythmgtr_balance = {vol = (($default_BussSet.rhythmgtr_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {band_Balance = {vol = (($default_BussSet.band_Balance.vol) - 11)} time = 1.5}
	setsoundbussparams {sfx_balance = {vol = (($default_BussSet.sfx_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 11)} time = 7}
	setsoundbussparams {crowdsingalong_balance = {vol = (($default_BussSet.crowdsingalong_balance.vol) - 11)} time = 7}
	setsoundbussparams {Crowd_W_Reverb = {vol = (($default_BussSet.Crowd_W_Reverb.vol) - 11)} time = 7}
endscript

script attract_mode_ends_sound_script 
	printf \{channel = sfx
		qs(0x2023477e)}
	setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2.5}
	setsoundbussparams {vocals_balance = {vol = ($default_BussSet.vocals_balance.vol)} time = 1.5}
	setsoundbussparams {drums_balance = {vol = ($default_BussSet.drums_balance.vol)} time = 1.5}
	setsoundbussparams {Guitar_Balance = {vol = ($default_BussSet.Guitar_Balance.vol)} time = 1.5}
	setsoundbussparams {bass_balance = {vol = ($default_BussSet.bass_balance.vol)} time = 1.5}
	setsoundbussparams {rhythmgtr_balance = {vol = ($default_BussSet.rhythmgtr_balance.vol)} time = 1.5}
	setsoundbussparams {band_Balance = {vol = ($default_BussSet.band_Balance.vol)} time = 1.5}
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)} time = 1.5}
	setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 7}
	setsoundbussparams {crowdsingalong_balance = {vol = ($default_BussSet.crowdsingalong_balance.vol)} time = 7}
	setsoundbussparams {Crowd_W_Reverb = {vol = ($default_BussSet.Crowd_W_Reverb.vol)} time = 7}
endscript

script sound_options_scroll 
	SoundEvent \{event = audio_options_up_down}
endscript

script playing_sound_fader \{time = 2.102}
endscript

script playing_sound_knob 
	setspawnedscriptnorepeatfor \{time = 2.256}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if GotParam \{instrument}
		switch <instrument>
			case guitar
			PlaySound audio_options_guitar vol = -9.0 buss = options_guitar effects = [{<eq_setting> Name = audiooptionssound}]
			case bass
			PlaySound audio_options_bass vol = -9.0 buss = options_bass effects = [{<eq_setting> Name = audiooptionssound}]
			case vocals
			PlaySound audio_options_vocals vol = -9.0 buss = options_vocals effects = [{<eq_setting> Name = audiooptionssound}]
			case drums
			PlaySound audio_options_drum vol = -9.0 buss = options_drums effects = [{<eq_setting> Name = audiooptionssound}]
		endswitch
	endif
endscript

script menu_music_fade \{Wait = 0
		Volume = 100
		time = 0}
	Wait <Wait> Seconds
	if GotParam \{out}
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) - <Volume>)} time = <time>}
		if NOT GotParam \{dont_fade_crowd}
			printf \{channel = sfx
				qs(0x66d4f019)}
			setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) - <Volume>)} time = <time>}
		endif
	else
		if GotParam \{in}
			setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = <time>}
			printf \{channel = sfx
				qs(0xd3aa811b)}
			setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = <time>}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 2
				fadeouttype = linear}
			One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waitTime = 5 immediate = <immediate>
		else
			printf \{channel = sfx
				qs(0x876d718a)}
		endif
	endif
endscript

script get_multiplayer_sfx_pan_values \{vocalist = 0}
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
	printf channel = sfx qs(0x368ed67a) s = <pan1x> p = <pan2x>
	return <...>
endscript

script ui_sfx_freeplay 
	getplayerinfo <Player> part
	get_multiplayer_sfx_pan_values Player = <Player>
	switch <Type>
		case Jump
		PlaySound freeplay_enter_sfx vol = 2 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x676c844f)}
		case start
		PlaySound freeplay_enter_sfx vol = 3 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x896c91fb)}
		case select
		PlaySound UI_Sound_05 vol = 3 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x0ae2d889)}
		case instrument
		PlaySound UI_Sound_05 vol = 3 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xf7571e78)}
		case up
		PlaySound menu_scroll_up vol = 3 pitch = 1 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xcac0cdfe)}
		case down
		PlaySound menu_scroll_down vol = 3 pitch = 3 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xafc32f0f)}
		case drop
		PlaySound freeplay_drop_sfx vol = 6 pitch = 0 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x43aa5374)}
		case back
		PlaySound UI_Sound_09 vol = 0.5 pitch = 0 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xfa648a70)}
		case Default
		printf \{channel = sfx
			qs(0x30b3405c)}
	endswitch
endscript

script reset_to_current_snapshot 
	printf \{channel = sfx
		qs(0xd46aacbb)
		t = $current_music_dsp_snapshot_setting}
	gh5_music_change_dsp_snapshot \{snapshot = $current_music_dsp_snapshot_setting
		time = 3.0
		scriptname = reset_to_current_snapshot}
endscript

script freeplay_music_crowd_transitions 
	printf \{channel = sfx
		qs(0x7a886d7d)}
	if GotParam \{transition}
		printf channel = sfx qs(0x72f3cb1c) s = <transition>
		switch <transition>
			case 'Start_Of_Game_Setup_Immediate'
			Change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 0.0}
			setsoundbussparams \{$music_stream_quiet_bussset
				time = 0.0}
			setsoundbussparams \{$start_of_game_crowds_silence_bussset
				time = 0.0}
			songsetvenueeffectsendvolume \{track = kick
				vol = -100}
			songsetvenueeffectsendvolume \{track = snare
				vol = -100}
			songsetvenueeffectsendvolume \{track = cymbal
				vol = -100}
			songsetvenueeffectsendvolume \{track = guitar
				vol = -100}
			songsetvenueeffectsendvolume \{track = bass
				vol = -100}
			songsetvenueeffectsendvolume \{track = vocal
				vol = -100}
			songsetvenueeffectsendvolume \{track = tom
				vol = -100}
			songsetvenueeffectsendvolume \{track = Band
				vol = -100}
			case 'Start_Of_Game_Fade_In_To_House'
			Change \{current_music_dsp_snapshot_setting = 'house'}
			setsoundbussparams \{$house_bussset
				time = 0.5}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 0.5}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			setsoundbussparams \{$house_crowd_bussset
				time = 0.15}
			case 'Fade_Out_House_Music_To_Start_A_Stage_Song'
			setsoundbussparams \{$music_stream_quiet_bussset
				time = 5.0}
			setsoundbussparams \{$prestage_crowd_bussset
				time = 8}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good
				fadeintime = 6
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			Wait \{2.5
				Seconds}
			songsetvenueeffectsendvolume \{track = kick
				vol = -100}
			songsetvenueeffectsendvolume \{track = snare
				vol = -100}
			songsetvenueeffectsendvolume \{track = cymbal
				vol = -100}
			songsetvenueeffectsendvolume \{track = guitar
				vol = -100}
			songsetvenueeffectsendvolume \{track = bass
				vol = -100}
			songsetvenueeffectsendvolume \{track = vocal
				vol = -100}
			songsetvenueeffectsendvolume \{track = tom
				vol = -100}
			songsetvenueeffectsendvolume \{track = Band
				vol = -100}
			Change \{current_music_dsp_snapshot_setting = 'stage'}
			gh5_music_change_dsp_snapshot \{snapshot = 'stage'
				time = 0.0}
			setsoundbussparams \{$stage_crowd_bussset
				time = 15}
			case 'End_Of_Stage_Song_Fade_Out_Crowd'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_neutral
				fadeintime = 20
				fadeintype = linear
				fadeouttime = 20
				fadeouttype = linear}
			setsoundbussparams \{$house_bussset
				time = 25}
			case 'End_Of_Stage_Song_Setup_House_Immediate'
			Change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 0}
			setsoundbussparams \{$house_3db_bussset
				time = 0.0}
			case 'Stage_To_Join'
			SoundEvent \{event = $current_crowd_swell_short_soundevent}
			SoundEvent \{event = $current_crowd_swell_med_soundevent}
			Change \{current_music_dsp_snapshot_setting = 'join'}
			gh5_music_change_dsp_snapshot \{snapshot = 'join'
				time = 2}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			case 'House_To_Join'
			SoundEvent \{event = $current_crowd_swell_short_soundevent}
			SoundEvent \{event = $current_crowd_swell_med_soundevent}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			Change \{current_music_dsp_snapshot_setting = 'join'}
			gh5_music_change_dsp_snapshot \{snapshot = 'join'
				time = 2}
			case 'Join_To_Game'
			printf \{channel = sfx
				qs(0x15aab6d4)}
			Change \{current_music_dsp_snapshot_setting = 'game'}
			gh5_music_change_dsp_snapshot \{snapshot = 'game'
				time = 4.0}
			case 'Join_To_House'
			Change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Join_To_Stage'
			Change \{current_music_dsp_snapshot_setting = 'stage'}
			setsoundbussparams \{$stage_crowd_bussset
				time = 2}
			gh5_music_change_dsp_snapshot \{snapshot = 'stage'
				time = 1.0}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good
				fadeintime = 3
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			case 'Game_To_Pause'
			setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 3)} time = 2}
			Change \{current_music_dsp_snapshot_setting = 'pause'}
			gh5_music_change_dsp_snapshot \{snapshot = 'pause'
				time = 1.0}
			case 'Pause_To_Game'
			printf \{channel = sfx
				qs(0xee66b36a)}
			setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 2}
			Change \{current_music_dsp_snapshot_setting = 'game'}
			gh5_music_change_dsp_snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = freeplay_music_crowd_transitions_pause_to_game}
			case 'Pause_To_Setlist'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_neutral
				fadeintime = 2.5
				fadeintype = linear
				fadeouttime = 2.5
				fadeouttype = linear}
			setsoundbussparams \{$music_stream_quiet_bussset
				time = 0.3}
			case 'Pause_To_MainMenu'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_neutral
				fadeintime = 2
				fadeintype = linear
				fadeouttime = 3.5
				fadeouttype = linear}
			Change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waitTime = 5 immediate = <immediate>
			case 'Pause_To_House'
			Change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Pause_To_Stage'
			Change \{current_music_dsp_snapshot_setting = 'stage'}
			gh5_music_change_dsp_snapshot \{snapshot = 'stage'
				time = 1.0}
			setsoundbussparams \{$prestage_crowd_bussset
				time = 1}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Setlist_To_Pause'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good
				fadeintime = 1.5}
			setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 3)} time = 2}
			Change \{current_music_dsp_snapshot_setting = 'pause'}
			gh5_music_change_dsp_snapshot \{snapshot = 'pause'
				time = 0.5}
			case 'Setlist_To_Game'
			printf \{channel = sfx
				qs(0x58ccbfbe)}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			Change \{current_music_dsp_snapshot_setting = 'game'}
			gh5_music_change_dsp_snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = freeplay_music_crowd_transitions_setlist_to_game}
			case 'Game_To_House'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good
				fadeintime = 3
				volpercentincrease = 20}
			Change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			Wait \{4
				Seconds}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_neutral
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

script Song_Intro_Kick_SFX_Waiting 
	gamemode_gettype
	if NOT (<Type> = freeplay)
		Wait ($current_intro.hud_move_time / 1000.0) Seconds
		SoundEvent \{event = Song_Intro_Kick_SFX}
	endif
endscript

script Song_Intro_Highway_Up_SFX_Waiting 
	gamemode_gettype
	if NOT (<Type> = freeplay)
		waitTime = (($current_intro.highway_move_time / 1000.0) - 1.5)
		if (<waitTime> < 0)
			waitTime = 0
		endif
		Wait <waitTime> Seconds
		SoundEvent \{event = Song_Intro_Highway_Up}
		GetPakManCurrent \{map = zones}
	else
		if ($beginning_of_freeplay_highway_up = 1)
			Change \{beginning_of_freeplay_highway_up = 0}
			SoundEvent \{event = Song_Intro_Highway_Up}
		endif
	endif
endscript

script song_intro_highway_up_vocals_sfx_waiting 
	SoundEvent \{event = vocal_highway_appear}
endscript

script GH_SFX_Intro_WarmUp 
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	printf \{channel = sfx
		qs(0xa4fa756e)}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol))} time = 2}
endscript

script GH_SFX_Countoff_Logic 
	gamemode_gettype
	getnumplayersingame \{local}
	getfirstplayer \{local}
	gman_songtool_getcurrentsong
	get_song_struct song = <current_song>
	if StructureContains structure = <song_struct> Name = countoff
		countoff_sound = (<song_struct>.countoff)
	else
		countoff_sound = 'sticks_normal'
	endif
	printf channel = sfx qs(0x61f203a2) s = <countoff_sound>
	if NOT ($game_mode = practice)
		printf channel = sfx qs(0xb61488ff) v = <velocity>
		if (<velocity> > 99)
			switch <countoff_sound>
				case 'sticks_normal'
				PlaySound \{StickClickMed
					buss = Countoffs
					send_vol1 = $current_send_vol
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
				case 'hihat01'
				PlaySound \{HiHatClosed01
					buss = Countoffs
					send_vol1 = $current_send_vol
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
				case 'sticks_tiny'
				PlaySound \{StickClickSmall
					buss = Countoffs
					send_vol1 = $current_send_vol
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
				case 'sticks_huge'
				PlaySound \{StickClickLarge
					buss = Countoffs
					send_vol1 = $current_send_vol
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
				case 'hihat02'
				PlaySound \{HiHatOpen02
					buss = Countoffs
					send_vol1 = $current_send_vol
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
				case 'hihat03'
				PlaySound \{HiHatPedal02
					buss = Countoffs
					send_vol1 = $current_send_vol
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
					send_vol1 = $current_send_vol
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
					case 'sticks_normal'
					PlaySound \{StickClickMed
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'hihat01'
					PlaySound \{HiHatClosed01
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'Sticks_Tiny'
					PlaySound \{StickClickSmall
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'sticks_huge'
					PlaySound \{StickClickLarge
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'Hihat02'
					PlaySound \{HiHatOpen02
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'Hihat03'
					PlaySound \{HiHatPedal02
						buss = Countoffs
						send_vol1 = $current_send_vol
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
						send_vol1 = $current_send_vol
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
					case 'sticks_normal'
					PlaySound \{StickClickMed
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'hihat01'
					PlaySound \{HiHatClosed01
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'Sticks_Tiny'
					PlaySound \{StickClickSmall
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'sticks_huge'
					PlaySound \{StickClickLarge
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'Hihat02'
					PlaySound \{HiHatOpen02
						buss = Countoffs
						send_vol1 = $current_send_vol
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
					case 'Hihat03'
					PlaySound \{HiHatPedal02
						buss = Countoffs
						send_vol1 = $current_send_vol
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
						send_vol1 = $current_send_vol
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
		printf \{channel = sfx
			qs(0xc53b1018)}
		if (<velocity> > 99)
			switch <countoff_sound>
				case 'sticks_normal'
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
				case 'hihat01'
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
				case 'Sticks_Tiny'
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
				case 'sticks_huge'
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
				case 'Hihat02'
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
				case 'Hihat03'
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
					case 'sticks_normal'
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
					case 'hihat01'
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
					case 'Sticks_Tiny'
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
					case 'sticks_huge'
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
					case 'Hihat02'
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
					case 'Hihat03'
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
					case 'sticks_normal'
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
					case 'hihat01'
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
					case 'Sticks_Tiny'
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
					case 'sticks_huge'
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
					case 'Hihat02'
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
					case 'Hihat03'
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

script You_Rock_Waiting_Crowd_SFX 
	Wait \{2
		Seconds}
	SoundEvent \{event = Medium_Crowd_Applause}
endscript

script GH3_SFX_fail_song_stop_sounds 
	StopSoundsByBuss \{Crowd}
	StopSoundsByBuss \{UI_Star_Power}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundsByBuss \{wrong_notes_bass}
	StopSoundsByBuss \{wrong_notes_drums}
	StopSoundsByBuss \{wrong_notes_guitar}
	StopSoundsByBuss \{binkcutscenes}
endscript

script GH3_SFX_Stop_Sounds_For_KillSong \{loading_transition = 0}
	setsoundbussparams {Default = {vol = ($default_BussSet.Default.vol)} time = 0.02}
	StopSoundEvent \{Song_Intro_Kick_SFX}
	StopSoundEvent \{pyro}
	StopSoundEvent \{Notes_Ripple_Up_SFX}
	StopSoundEvent \{Song_Intro_Highway_Up}
	StopSoundEvent \{Crowd_Fast_Surge_Cheer}
	StopSoundEvent \{Medium_Crowd_Applause}
	StopSoundEvent \{Lose_Multiplier_Crowd}
	StopSoundEvent \{star_power_release_front_p1_gh4}
	StopSoundEvent \{star_power_release_center_p1_gh4}
	StopSoundEvent \{star_power_release_center_p2_gh4}
	StopSoundEvent \{star_power_release_front_p2_gh4}
	StopSoundEvent \{star_power_deployed_lfe_p1_gh4}
	StopSoundEvent \{star_power_deployed_lfe_p2_gh4}
	StopSoundEvent \{star_power_deployed_front_p1_gh4}
	StopSoundEvent \{star_power_deployed_back_p1_gh4}
	StopSoundEvent \{star_power_deployed_front_p2_gh4}
	StopSoundEvent \{star_power_deployed_back_p2_gh4}
	StopSoundEvent \{star_power_available_p2_gh4}
	StopSoundEvent \{star_power_available_p1_gh4}
	stopsound \{shredfest_momentum_difficulty_down}
	stopsound \{$current_crowd_transition_neutral_to_positive}
	stopsound \{shredfest_player_dropout}
	stopsound \{point_awarded}
	stopsound \{shredfest_momentum_difficulty_up}
	StopSoundEvent \{shredfest_play_suddendeath_dropped}
	StopSoundEvent \{Star_Power_Awarded_SFX}
	StopSoundEvent \{star_power_awarded_sfx_p1}
	StopSoundEvent \{star_power_awarded_sfx_p2}
	StopSoundEvent \{Star_Power_Ready_SFX}
	StopSoundEvent \{star_power_available_gh4}
	StopSoundEvent \{star_power_release_center_gh4}
	StopSoundEvent \{star_power_release_front_gh4}
	StopSoundEvent \{Star_Power_Deployed_SFX}
	StopSoundEvent \{Star_Power_Deployed_Cheer_SFX}
	StopSoundEvent \{star_power_deployed_cheer_sfx_p1}
	StopSoundEvent \{star_power_deployed_cheer_sfx_p2}
	StopSoundEvent \{star_power_deployed_cheer_sfx_p3}
	StopSoundEvent \{$current_crowd_clap_normal_soundevent}
	StopSoundEvent \{$current_crowd_clap_middle_soundevent}
	StopSoundEvent \{$current_crowd_clap_left_middle_soundevent}
	StopSoundEvent \{$current_crowd_clap_right_middle_soundevent}
	StopSoundEvent \{$current_crowd_clap_left_soundevent}
	StopSoundEvent \{$current_crowd_clap_right_soundevent}
	StopSoundEvent \{star_power_deployed_back_gh4}
	StopSoundEvent \{star_power_deployed_lfe_gh4}
	StopSoundEvent \{star_power_deployed_front_gh4}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_2X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_3X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_4X}
	StopSoundEvent \{Lose_Multiplier_Crowd}
	StopSoundEvent \{star_power_deployed_back_p3_gh4}
	StopSoundEvent \{star_power_deployed_front_p3_gh4}
	StopSoundEvent \{star_power_available_p3_gh4}
	StopSoundEvent \{star_power_awarded_sfx_p3}
	StopSoundEvent \{star_power_release_center_p3_gh4}
	StopSoundEvent \{star_power_release_front_p3_gh4}
	StopSoundEvent \{UI_SFX_50_Note_Streak_SinglePlayer}
	StopSoundEvent \{UI_SFX_50_Note_Streak_P1}
	StopSoundEvent \{UI_SFX_50_Note_Streak_P2}
	StopSoundEvent \{UI_SFX_100_Note_Streak_SinglePlayer}
	StopSoundEvent \{UI_SFX_100_Note_Streak_P1}
	StopSoundEvent \{UI_SFX_100_Note_Streak_P2}
	StopSoundsByBuss \{drums_ingame}
	StopSoundsByBuss \{drums_jammode}
	StopSoundsByBuss \{guitar_jammode}
	StopSoundsByBuss \{bass_jammode}
	StopSoundsByBuss \{wrong_notes_guitar}
	StopSoundsByBuss \{wrong_notes_bass}
	StopSoundsByBuss \{wrong_notes_drums}
	if (<Type> = Normal)
		if (<loading_transition> = 1)
		else
		endif
	endif
endscript

script gh_sfx_tutorial_tuning_strings 
	switch <note_played>
		case 0
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{E_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{E_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{E_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 1
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{A_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{A_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{A_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 2
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{D_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{D_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{D_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 3
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{G_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{G_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{G_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 4
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{B_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{B_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{B_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
	endswitch
endscript

script gh_sfx_tutorial_hammer_on_lesson_2 
	switch <note_played>
		case 0
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{E_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{E_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{E_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 1
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{A_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{A_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{A_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 2
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{D_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{D_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{D_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 3
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{G_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{G_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{G_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 4
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{B_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			PlaySound \{B_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			PlaySound \{B_String
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
	endswitch
endscript

script StopNotes_01 
	if IsSoundEventPlaying \{Tutorial_String_1_Strum_Free}
		SetSoundParams \{Tutorial_String_1_Strum_Free
			vol_percent = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_1_Strum_Free
			vol_percent = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_1_Strum_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_1_Strum_Free}
	endif
endscript

script StopNotes_02 
	if IsSoundEventPlaying \{Tutorial_String_2_HOPO_Free}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_03 
	if IsSoundEventPlaying \{Tutorial_String_3_HOPO_Free}
		SetSoundParams \{Tutorial_String_3_HOPO_Free
			vol_percent = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_3_HOPO_Free
			vol_percent = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_3_HOPO_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_3_HOPO_Free}
	endif
endscript

script StopNotes_04 
	if IsSoundEventPlaying \{Tutorial_String_3_Strum_Free}
		SetSoundParams \{Tutorial_String_3_Strum_Free
			vol_percent = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_3_Strum_Free
			vol_percent = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_3_Strum_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_3_Strum_Free}
	endif
endscript

script StopNotes_05 
	if IsSoundEventPlaying \{Tutorial_String_2_HOPO_Free}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_06 
	if IsSoundEventPlaying \{Tutorial_String_1_HOPO_Free}
		SetSoundParams \{Tutorial_String_1_HOPO_Free
			vol_percent = 100}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_1_HOPO_Free
			vol_percent = 50}
		Wait \{0.05
			Seconds}
		SetSoundParams \{Tutorial_String_1_HOPO_Free
			vol_percent = 10}
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

script GH_SFX_Note_Streak_SinglePlayer 
	if NOT (($crowd_in_jam_mode_song_state = 1))
		if ((<combo> = 1000) || (<combo> = 500))
			SoundEvent \{event = UI_SFX_100_Note_Streak_SinglePlayer}
		else
			SoundEvent \{event = UI_SFX_50_Note_Streak_SinglePlayer}
		endif
	endif
endscript

script GH_SFX_Note_Streak_P1 
	if NOT (($crowd_in_jam_mode_song_state = 1))
		if ((<combo> = 1000) || (<combo> = 500))
			SoundEvent \{event = UI_SFX_100_Note_Streak_P1}
		else
			SoundEvent \{event = UI_SFX_50_Note_Streak_P1}
		endif
	endif
endscript

script GH_SFX_Note_Streak_P2 
	if NOT (($crowd_in_jam_mode_song_state = 1))
		if ((<combo> = 1000) || (<combo> = 500))
			SoundEvent \{event = UI_SFX_100_Note_Streak_P2}
		else
			SoundEvent \{event = UI_SFX_50_Note_Streak_P2}
		endif
	endif
endscript

script Guitar_Wrong_Note_Sound_Logic \{vol = 0.0
		pitch = 0.0
		soundasset = Default
		buss = Default
		pan1x = 0.0
		pan1y = 0.0
		pan2x = 0.0
		pan2y = 0.0}
	getplayerinfo <Player> highway_position
	switch <highway_position>
		case left
		pan1x = -1.0
		pan1y = 1.0
		pan2x = 0.0
		pan2y = 1.0
		case right
		pan1x = 1.0
		pan1y = 1.0
		pan2x = 0.0
		pan2y = 1.0
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
		default
	endswitch
	getplayerinfo <Player> part
	switch <part>
		case bass
		RandomNoRepeat (
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
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 1)
		vol = (<vol> - 8)
	endif
	PlaySound <soundasset> vol = <vol> pitch = <pitch> buss = <newbuss> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y> Priority = 90 panremovecenter = true
endscript

script playlist_scroll_sfx 
	SoundEvent \{event = playlist_scroll_sound}
endscript

script songlist_scroll_sfx 
	SoundEvent \{event = songlist_scroll_sound}
endscript

script songlist_playlist_switch_sfx 
	SoundEvent \{event = songlist_to_playlist_switch_sfx}
endscript

script sort_songlist_sfx 
	SoundEvent \{event = sort_songlist}
endscript

script revive_or_kill_player_sfx \{Player = 1
		vocalist = 0
		cheer = 0}
	get_multiplayer_sfx_pan_values Player = <Player> vocalist = <vocalist>
	transitionevent = $current_crowd_transition_neutral_to_positive
	if (<cheer> = 1)
		stopsound \{$current_crowd_transition_neutral_to_positive}
		printf \{channel = sfx
			qs(0xacd1e525)}
		PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	else
		stopsound \{shredfest_momentum_difficulty_up}
		printf \{channel = sfx
			qs(0xe1577cb8)}
		PlaySound shredfest_player_dropout vol = -12.0 buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script momentum_difficulty_up_sfx 
	get_multiplayer_sfx_pan_values Player = <Player>
	transitionevent = $current_crowd_transition_neutral_to_positive
	stopsound \{shredfest_momentum_difficulty_up}
	stopsound \{$current_crowd_transition_neutral_to_positive}
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
		case Default
		printf \{channel = sfx
			qs(0x578d9ab3)}
	endswitch
endscript

script momentum_difficulty_down_sfx 
	get_multiplayer_sfx_pan_values Player = <Player>
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
		case Default
		printf \{channel = sfx
			qs(0x578d9ab3)}
	endswitch
endscript

script elimination_sfx_logic 
	if NOT issoundplaying \{shredfest_player_dropout}
		get_multiplayer_sfx_pan_values Player = <Player>
		switch <highway_position>
			case left
			printf \{channel = sfx
				qs(0x28e32290)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case right
			printf \{channel = sfx
				qs(0x4be64bed)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case leftcenter
			printf \{channel = sfx
				qs(0x8ed28fe0)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case rightcenter
			printf \{channel = sfx
				qs(0x9c69d162)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case center
			printf \{channel = sfx
				qs(0x4bd810a4)}
			PlaySound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
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

script cast_vote_ui_sfx 
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

script kill_voting_screen_sfx 
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

script voting_screen_timer 
	SpawnScriptNow \{counter_play_beep_spawn
		params = {
			time = 2.5
		}}
	Wait \{2.5
		Seconds}
	KillSpawnedScript \{Name = counter_play_beep_spawn}
endscript

script tie_breaker_sfx 
	printf channel = sfx qs(0x00c56ec0) s = <count>
	Volume = -13
	switch <count>
		case 1
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 1.0 buss = Front_End
		case 2
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 1.05 buss = Front_End
		case 3
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 1.1 buss = Front_End
		case 4
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 1.15 buss = Front_End
		case 5
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 1.1 buss = Front_End
		case 6
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 1.0 buss = Front_End
		case 7
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.9 buss = Front_End
		case 8
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.75 buss = Front_End
		case 9
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.65000004 buss = Front_End
		case 10
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.5 buss = Front_End
		case 11
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.4 buss = Front_End
		case 12
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.3 buss = Front_End
		case 13
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.25 buss = Front_End
		case 14
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.2 buss = Front_End
		case 15
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.16 buss = Front_End
		case 16
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.14 buss = Front_End
		case 17
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.120000005 buss = Front_End
		default
		PlaySound menu_gameplay_spin vol = <Volume> pitch = 0.120000005 buss = Front_End
		printf \{channel = sfx
			qs(0x9716a790)}
	endswitch
endscript

script voting_outcome_result_sfx 
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

script spawned_point_awarded_waiting \{pan_wide = 0}
	printf \{channel = sfx
		qs(0x046b774e)}
	if (<pan_wide> = 1)
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
	else
		get_multiplayer_sfx_pan_values Player = <Player>
	endif
	Wait \{0.08
		Seconds}
	PlaySound point_awarded vol = -7.5 buss = ui_ingame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script spawned_point_awarded_perfectionist_sfx \{pan_wide = 0}
	printf \{channel = sfx
		qs(0x046b774e)}
	if (<pan_wide> = 1)
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
	else
		get_multiplayer_sfx_pan_values Player = <Player>
	endif
	PlaySound point_awarded vol = -7.5 buss = ui_ingame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script switch_teams_sfx \{Type = request
		direction = left}
	request_vol = -6
	resend_vol = -6
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
			SoundEvent \{event = online_team_switch_affirmation_sfx}
			default
			printf \{channel = sfx
				qs(0x5d4ccbf4)}
		endswitch
	endif
endscript

script car_scroll_widget_sfx 
	setspawnedscriptnorepeatfor \{time = 0.07}
	PlaySound car_widget_scroll vol = -10 pitch_percent = ((<fill_perc> * 6.0) + 90) buss = Front_End
endscript

script highway_ripple_ui_sfx 
	if (<Type> = freeplay)
		if NOT playerinfoequals <Player> freeplay_state = dropped
			if NOT playerinfoequals <Player> part = vocals
				SoundEvent \{event = Notes_Ripple_Up_SFX}
			endif
		endif
	else
		if NOT playerinfoequals <Player> part = vocals
			SoundEvent \{event = Notes_Ripple_Up_SFX}
		endif
	endif
endscript

script ui_venue_unlock_sfx 
	Wait \{0.05
		Seconds}
	SoundEvent \{event = venue_unlock_sfx}
endscript

script unlock_item_ui_sfx 
	SoundEvent \{event = ui_unlock_item_sfx}
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

script startpinknoiseloopforcaliratelagscreen 
	PlaySound \{pinknoise_minnus_20
		buss = Default
		vol = -70
		num_loops = -1}
endscript

script stoppinknoiseloopforcaliratelagscreen 
	stopsound \{pinknoise_minnus_20}
endscript

script testtoneenterscript 
	setsoundbussparams {sfx_balance = {vol = (($default_BussSet.sfx_balance.vol) - 100)}}
endscript

script testtoneexitscript 
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)}}
endscript

script muting_test_setup_script 
	setsoundbussparams \{UI = {
			vol = -100.0
		}}
	Change \{crowd_debug_mode = 1}
endscript

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

script Profiling_FMOD_EFFECTS 
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

script star_power_deployed_sfx_multiplayer \{Player = 1}
	printf \{channel = sfx
		qs(0x9e86cd69)}
	getplayerinfo <Player> highway_position
	printf channel = sfx qs(0x3c9d8c67) s = <highway_position>
	if NOT issoundplaying \{star_deployed_back}
		printf \{channel = sfx
			qs(0xc62aa5dd)}
		if (<highway_position> = left)
			printf \{channel = sfx
				qs(0x4dfd5b77)}
			SoundEvent \{event = star_power_deployed_lfe_p1_gh4}
			SoundEvent \{event = star_power_deployed_back_p1_gh4}
			SoundEvent \{event = star_power_deployed_front_p1_gh4}
			SoundEvent \{event = star_power_deployed_cheer_sfx_p1}
		else
			if (<highway_position> = right)
				printf \{channel = sfx
					qs(0x290badee)}
				SoundEvent \{event = star_power_deployed_lfe_p1_gh4}
				SoundEvent \{event = star_power_deployed_back_p2_gh4}
				SoundEvent \{event = star_power_deployed_front_p2_gh4}
				SoundEvent \{event = star_power_deployed_cheer_sfx_p2}
			else
				printf \{channel = sfx
					qs(0xb3f669ca)}
				SoundEvent \{event = star_power_deployed_lfe_p1_gh4}
				SoundEvent \{event = star_power_deployed_back_p3_gh4}
				SoundEvent \{event = star_power_deployed_front_p3_gh4}
				SoundEvent \{event = star_power_deployed_cheer_sfx_p3}
			endif
		endif
		printf \{channel = sfx
			qs(0xe6e95e4d)}
		Change \{star_power_deployed_flag = 1}
		Wait \{0.9
			Seconds}
		printf \{channel = sfx
			qs(0x0a5c5d52)}
		Change \{star_power_deployed_flag = 0}
	else
		printf \{channel = sfx
			qs(0xe4f96e42)}
		if ($star_power_deployed_flag = 1)
			printf \{channel = sfx
				qs(0xbf9f78e2)}
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
				qs(0x181f2540)}
			if (<highway_position> = left)
				printf \{channel = sfx
					qs(0x4dfd5b77)}
				SoundEvent \{event = star_power_deployed_lfe_p1_gh4}
				SoundEvent \{event = star_power_deployed_back_p1_gh4}
				SoundEvent \{event = star_power_deployed_front_p1_gh4}
				SoundEvent \{event = star_power_deployed_cheer_sfx_p1}
			else
				if (<highway_position> = right)
					printf \{channel = sfx
						qs(0x290badee)}
					SoundEvent \{event = star_power_deployed_lfe_p1_gh4}
					SoundEvent \{event = star_power_deployed_back_p2_gh4}
					SoundEvent \{event = star_power_deployed_front_p2_gh4}
					SoundEvent \{event = star_power_deployed_cheer_sfx_p2}
				else
					printf \{channel = sfx
						qs(0xb3f669ca)}
					SoundEvent \{event = star_power_deployed_lfe_p1_gh4}
					SoundEvent \{event = star_power_deployed_back_p3_gh4}
					SoundEvent \{event = star_power_deployed_front_p3_gh4}
					SoundEvent \{event = star_power_deployed_cheer_sfx_p3}
				endif
			endif
		endif
	endif
endscript

script star_power_ready_sfx_multiplayer \{Player = 1}
	getplayerinfo <Player> highway_position
	if NOT issoundplaying \{star_available}
		if (<highway_position> = left)
			SoundEvent \{event = star_power_available_p1_gh4}
		elseif (<highway_position> = right)
			SoundEvent \{event = star_power_available_p2_gh4}
		else
			SoundEvent \{event = star_power_available_p3_gh4}
		endif
		Change \{star_power_ready_flag = 1}
		Wait \{0.9
			Second}
		Change \{star_power_ready_flag = 0}
	else
		if ($star_power_ready_flag = 1)
			SetSoundParams \{star_available
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				SoundEvent \{event = star_power_available_p1_gh4}
			elseif (<highway_position> = right)
				SoundEvent \{event = star_power_available_p2_gh4}
			else
				SoundEvent \{event = star_power_available_p3_gh4}
			endif
		endif
	endif
endscript

script star_power_awarded_sfx_multiplayer \{Player = 1}
	getplayerinfo <Player> highway_position
	if NOT issoundplaying \{sp_awarded1}
		if (<highway_position> = left)
			SoundEvent \{event = star_power_awarded_sfx_p1}
		elseif (<highway_position> = right)
			SoundEvent \{event = star_power_awarded_sfx_p2}
		else
			SoundEvent \{event = star_power_awarded_sfx_p3}
		endif
		Change \{star_power_awarded_flag = 1}
		Wait \{0.3
			Second}
		Change \{star_power_awarded_flag = 0}
	else
		if ($star_power_awarded_flag = 1)
			SetSoundParams \{sp_awarded1
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				SoundEvent \{event = star_power_awarded_sfx_p1}
			elseif (<highway_position> = right)
				SoundEvent \{event = star_power_awarded_sfx_p2}
			else
				SoundEvent \{event = star_power_awarded_sfx_p3}
			endif
		endif
	endif
endscript

script star_power_release_sfx_multiplayer \{Player = 1}
	getplayerinfo <Player> highway_position
	if NOT issoundplaying \{star_release_front}
		if (<highway_position> = left)
			SoundEvent \{event = star_power_release_center_p1_gh4}
			SoundEvent \{event = star_power_release_front_p1_gh4}
		elseif (<highway_position> = right)
			SoundEvent \{event = star_power_release_center_p2_gh4}
			SoundEvent \{event = star_power_release_front_p2_gh4}
		else
			SoundEvent \{event = star_power_release_center_p3_gh4}
			SoundEvent \{event = star_power_release_front_p3_gh4}
		endif
		Change \{star_power_deployed_flag = 1}
		Wait \{0.9
			Second}
		Change \{star_power_deployed_flag = 0}
	else
		if ($star_power_deployed_flag = 1)
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
				SoundEvent \{event = star_power_release_center_p1_gh4}
				SoundEvent \{event = star_power_release_front_p1_gh4}
			elseif (<highway_position> = right)
				SoundEvent \{event = star_power_release_center_p2_gh4}
				SoundEvent \{event = star_power_release_front_p2_gh4}
			else
				SoundEvent \{event = star_power_release_center_p3_gh4}
				SoundEvent \{event = star_power_release_front_p3_gh4}
			endif
		endif
	endif
endscript

script stopallcheeringsounds 
	StopSoundEvent \{$current_crowd_swell_short_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$current_crowd_applause_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$current_crowd_swell_short_soft_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$current_crowd_swell_med_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$current_crowd_swell_long_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	Change \{turn_off_oneshot_cheers = 1}
	Wait \{8
		Seconds}
	Change \{turn_off_oneshot_cheers = 0}
endscript

script clap_fading 
	Change \{clap_fade = 1}
	setsoundbussparams \{Crowd_Star_Power = {
			vol = -100
		}
		time = 5}
	Wait \{5
		Seconds}
	Change \{clap_fade = 0}
	Change \{star_clap_left = 0}
	Change \{star_clap_right = 0}
	Change \{star_clap_left_middle = 0}
	Change \{star_clap_right_middle = 0}
	Change \{star_clap_middle = 0}
	Change \{star_clap_normal = 0}
	setsoundbussparams {Crowd_Star_Power = {vol = ($default_BussSet.Crowd_Star_Power.vol)} time = 0.1}
endscript

script clap_fade_kill 
	KillSpawnedScript \{Name = clap_fading}
	setsoundbussparams {Crowd_Star_Power = {vol = ($default_BussSet.Crowd_Star_Power.vol)} time = 0.1}
endscript

script star_power_clap_panning \{Player = 1}
	if NOT isSinglePlayerGame
		getplayerinfo <Player> highway_position
		if (<highway_position> = left)
			Change \{star_clap_left = 1}
			Change \{star_clap_right = 0}
			Change \{star_clap_left_middle = 0}
			Change \{star_clap_right_middle = 0}
			Change \{star_clap_middle = 0}
			Change \{star_clap_normal = 0}
			Change \{star_clap_leftcenterright = 0}
		elseif (<highway_position> = right)
			Change \{star_clap_right = 1}
			Change \{star_clap_left = 0}
			Change \{star_clap_left_middle = 0}
			Change \{star_clap_right_middle = 0}
			Change \{star_clap_middle = 0}
			Change \{star_clap_normal = 0}
			Change \{star_clap_leftcenterright = 0}
		else
			Change \{star_clap_middle = 1}
			Change \{star_clap_left = 0}
			Change \{star_clap_right = 0}
			Change \{star_clap_left_middle = 0}
			Change \{star_clap_right_middle = 0}
			Change \{star_clap_normal = 0}
			Change \{star_clap_leftcenterright = 0}
		endif
	else
		Change \{star_clap_normal = 1}
		Change \{star_clap_left = 0}
		Change \{star_clap_right = 0}
		Change \{star_clap_left_middle = 0}
		Change \{star_clap_right_middle = 0}
		Change \{star_clap_middle = 0}
		Change \{star_clap_leftcenterright = 0}
	endif
endscript

script star_power_clap_panning_multiple \{Player = 1}
	printf \{channel = sfx
		qs(0xd4253830)}
	if NOT isSinglePlayerGame
		printf \{channel = sfx
			qs(0xfae4d235)}
		getplayerinfo <Player> highway_position
		printf channel = sfx qs(0x1fc7622c) s = <highway_position>
		if (<highway_position> = left)
			if (($star_clap_right = 1))
				Change \{star_clap_normal = 1}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_right_middle = 1)
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 1}
			elseif ($star_clap_middle = 1)
				Change \{star_clap_left_middle = 1}
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			endif
		elseif (<highway_position> = right)
			if (($star_clap_left = 1))
				Change \{star_clap_normal = 1}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_left_middle = 1)
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 1}
			elseif ($star_clap_middle = 1)
				Change \{star_clap_right_middle = 1}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			endif
		else
			if ($star_clap_left = 1)
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 1}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_right = 1)
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 1}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_normal = 1)
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 1}
			endif
		endif
	endif
	printf \{channel = sfx
		qs(0xeb2f6f8f)
		s = $star_clap_normal}
	printf \{channel = sfx
		qs(0xb9e8a7ea)
		s = $star_clap_left}
	printf \{channel = sfx
		qs(0x5be19574)
		s = $star_clap_right}
	printf \{channel = sfx
		qs(0x26a81163)
		s = $star_clap_left_middle}
	printf \{channel = sfx
		qs(0x8d27effe)
		s = $star_clap_right_middle}
	printf \{channel = sfx
		qs(0x8183fb93)
		s = $star_clap_middle}
	printf \{channel = sfx
		qs(0x57cc176e)
		s = $star_clap_leftcenterright}
	printf \{channel = sfx
		qs(0x4bf4c5ee)}
endscript

script star_clap_end \{Player = 1}
	if NOT isSinglePlayerGame
		getplayerinfo <Player> highway_position
		if (<highway_position> = left)
			if (($star_clap_left_middle = 1))
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 1}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_normal = 1)
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 1}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_leftcenterright = 1)
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_right_middle = 1}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			endif
		elseif (<highway_position> = right)
			if (($star_clap_right_middle = 1))
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 1}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_normal = 1)
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 1}
				Change \{star_clap_right = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_leftcenterright = 1)
				Change \{star_clap_left_middle = 1}
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			endif
		else
			if ($star_clap_left_middle = 1)
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 1}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_right_middle = 1)
				Change \{star_clap_normal = 0}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 1}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_leftcenterright = 1)
				Change \{star_clap_normal = 1}
				Change \{star_clap_left = 0}
				Change \{star_clap_right = 0}
				Change \{star_clap_left_middle = 0}
				Change \{star_clap_right_middle = 0}
				Change \{star_clap_middle = 0}
				Change \{star_clap_leftcenterright = 0}
			endif
		endif
	endif
endscript

script starttesttones_sine 
	SoundBussUnlock \{user_vocals}
	setsoundbussparams \{user_vocals = {
			vol = -100.0
		}}
	SoundBussLock \{user_vocals}
	SoundBussUnlock \{user_drums}
	setsoundbussparams \{user_drums = {
			vol = -100.0
		}}
	SoundBussLock \{user_drums}
	SoundBussUnlock \{User_Guitar}
	setsoundbussparams \{User_Guitar = {
			vol = -100.0
		}}
	SoundBussLock \{User_Guitar}
	SoundBussUnlock \{user_bass}
	setsoundbussparams \{user_bass = {
			vol = -100.0
		}}
	SoundBussLock \{user_bass}
	SoundBussUnlock \{user_rhythmgtr}
	setsoundbussparams \{user_rhythmgtr = {
			vol = -100.0
		}}
	SoundBussLock \{user_rhythmgtr}
	SoundBussUnlock \{user_crowd}
	setsoundbussparams \{user_crowd = {
			vol = -100.0
		}}
	SoundBussLock \{user_crowd}
	SoundBussUnlock \{User_SFX}
	setsoundbussparams \{User_SFX = {
			vol = -100.0
		}}
	SoundBussLock \{User_SFX}
	SoundBussUnlock \{User_Band}
	setsoundbussparams \{User_Band = {
			vol = -100.0
		}}
	SoundBussLock \{User_Band}
	begin
	PlaySound \{testtone_sinewav_12db
		pan1x = -1.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		pan1x = 0.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		pan1x = 1.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		pan1x = 1.0
		pan1y = -1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		pan1x = -1.0
		pan1y = -1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		lfeonly = true
		lfe_vol = 0
		buss = Master}
	Wait \{2
		Seconds}
	repeat
endscript

script start_auto_calibrate_looping_sound 
endscript

script stop_auto_calibrate_looping_sound 
endscript

script fire_off_one_shot_blip 
endscript

script run_through_auto_audio_lag_calibration 
endscript

script starttesttones_pink 
	SoundBussUnlock \{user_vocals}
	setsoundbussparams \{user_vocals = {
			vol = -100.0
		}}
	SoundBussLock \{user_vocals}
	SoundBussUnlock \{user_drums}
	setsoundbussparams \{user_drums = {
			vol = -100.0
		}}
	SoundBussLock \{user_drums}
	SoundBussUnlock \{User_Guitar}
	setsoundbussparams \{User_Guitar = {
			vol = -100.0
		}}
	SoundBussLock \{User_Guitar}
	SoundBussUnlock \{user_bass}
	setsoundbussparams \{user_bass = {
			vol = -100.0
		}}
	SoundBussLock \{user_bass}
	SoundBussUnlock \{user_rhythmgtr}
	setsoundbussparams \{user_rhythmgtr = {
			vol = -100.0
		}}
	SoundBussLock \{user_rhythmgtr}
	SoundBussUnlock \{user_crowd}
	setsoundbussparams \{user_crowd = {
			vol = -100.0
		}}
	SoundBussLock \{user_crowd}
	SoundBussUnlock \{User_SFX}
	setsoundbussparams \{User_SFX = {
			vol = -100.0
		}}
	SoundBussLock \{User_SFX}
	SoundBussUnlock \{User_Band}
	setsoundbussparams \{User_Band = {
			vol = -100.0
		}}
	SoundBussLock \{User_Band}
	begin
	PlaySound \{testtone_pinknoise_12db
		pan1x = -1.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		pan1x = 0.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		pan1x = 1.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		pan1x = 1.0
		pan1y = -1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		pan1x = -1.0
		pan1y = -1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		lfeonly = true
		lfe_vol = 0
		buss = Master}
	Wait \{2
		Seconds}
	repeat
endscript

script stoptesttones 
	if IsSoundEventPlaying \{starttesttones_pink}
		StopSoundEvent \{starttesttones_pink}
	endif
	if IsSoundEventPlaying \{starttesttones_sine}
		StopSoundEvent \{starttesttones_sine}
	endif
	setsoundbussparams \{user_vocals = {
			vol = 0.0
		}}
	SoundBussUnlock \{user_drums}
	setsoundbussparams \{user_drums = {
			vol = 0.0
		}}
	SoundBussLock \{user_drums}
	setsoundbussparams \{User_Guitar = {
			vol = 0.0
		}}
	SoundBussUnlock \{user_bass}
	setsoundbussparams \{user_bass = {
			vol = 0.0
		}}
	SoundBussLock \{user_bass}
	setsoundbussparams \{user_rhythmgtr = {
			vol = 0.0
		}}
	SoundBussUnlock \{user_crowd}
	setsoundbussparams \{user_crowd = {
			vol = 0.0
		}}
	SoundBussLock \{user_crowd}
	SoundBussUnlock \{User_SFX}
	setsoundbussparams \{User_SFX = {
			vol = 0.0
		}}
	SoundBussLock \{User_SFX}
	SoundBussUnlock \{User_Band}
	setsoundbussparams \{User_Band = {
			vol = 0.0
		}}
	SoundBussLock \{User_Band}
endscript

script jam_mode_metronome 
	if GotParam \{downbeat}
		if (<downbeat> = 1)
			PlaySound StickClickMed vol = RandomFloat (12.5, 13.0)
		endif
	else
		PlaySound StickClickMed vol = RandomFloat (7.5, 8.0)
	endif
endscript

script Menu_Music_SE 
	printf \{channel = sfx
		qs(0x44f09774)}
	GetArraySize \{$menu_music_songs}
	begin
	GetRandomValue Name = index integer a = 0 b = (<array_Size> -1)
	if NOT (<index> = $menu_music_last_song_index)
		if NOT (<index> = $menu_music_last_last_song_index)
			if NOT (<index> = $menu_music_last_last_last_song_index)
				if NOT (<index> = $menu_music_last_last_last_last_song_index)
					Change \{menu_music_last_last_last_last_song_index = $menu_music_last_song_index}
					Change \{menu_music_last_last_last_song_index = $menu_music_last_song_index}
					Change \{menu_music_last_last_song_index = $menu_music_last_song_index}
					Change menu_music_last_song_index = <index>
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
	SpawnScriptNow menu_music_se_spawned params = {Stream = <Stream> array = <array> delay = <delay> vol = <vol> offset = <offset>}
endscript

script menu_music_se_spawned \{vol = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Change \{menu_music_preloading = 1}
	Change menu_music_stream = <Stream>
	PreloadStream <Stream>
	begin
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	StartPreLoadedStream <unique_id> buss = Music_FrontEnd forcesafepreload = 1 vol = (<vol> + 2.5)
	Change \{menu_music_preloading = 0}
	Change current_menu_song = <Stream>
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

script killmenumusic 
	KillSpawnedScript \{Name = menu_music_se_spawned}
	Change \{menu_music_preloading = 0}
	stopsound \{blueorchid_menu_music}
	stopsound \{inthemeantime_menu_music}
	stopsound \{lonelyisthenight_menu_music}
	stopsound \{lustforlife_menu_music}
	stopsound \{sexonfire_menu_music}
	stopsound \{smellsliketeenspirit_menu_music}
	stopsound \{steadyasshegoes_menu_music}
	stopsound \{superstition_menu_music}
	stopsound \{yougivelove_menu_music}
endscript

script crowd_anticipation 
	gamemode_gettype
	if NOT ((<Type> = freeplay) || (<Type> = tutorial))
		if ($current_crowd >= 1.3399999)
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					stopsound \{$current_crowd_anticipation
						fade_time = 3
						fade_type = log_slow}
					SpawnScriptNow \{crowd_anticipation_flag_logic}
				endif
			endif
		elseif ($current_crowd >= 1.3)
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					SetSoundParams \{$current_crowd_anticipation
						vol = 3
						pitch = 0.3
						time = 0.5}
				endif
			else
				PlaySound \{$current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					Priority = 100
					buss = Crowd_Beds
					attack_time = 3
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2700001)
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					SetSoundParams \{$current_crowd_anticipation
						vol = 1
						pitch = 0.2
						time = 0.5}
				endif
			else
				PlaySound \{$current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					Priority = 100
					buss = Crowd_Beds
					attack_time = 3
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.25)
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					SetSoundParams \{$current_crowd_anticipation
						vol = -1
						pitch = 0.1
						time = 0.5}
				endif
			else
				PlaySound \{$current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					Priority = 100
					buss = Crowd_Beds
					attack_time = 3
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2)
			if NOT issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					PlaySound \{$current_crowd_anticipation
						vol = -3
						pan1x = 0
						pan1y = 0.59
						panremovecenter = true
						Priority = 100
						buss = Crowd_Beds
						attack_time = 3
						attack_function = log_fast
						num_loops = -1}
				endif
			else
				SetSoundParams \{$current_crowd_anticipation
					vol = -3
					time = 0.5}
			endif
		else
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					stopsound \{$current_crowd_anticipation
						fade_time = 3
						fade_type = log_slow}
					SpawnScriptNow \{crowd_anticipation_flag_logic}
				endif
			endif
		endif
	endif
endscript

script crowd_anticipation_flag_logic 
	Change \{crowd_anticipation_flag = 1}
	Wait \{3
		Seconds}
	Change \{crowd_anticipation_flag = 0}
endscript

script oneshotsbetweensongs 
	begin
	SoundEvent \{event = $current_crowd_whistle_soundevent}
	Wait (RandomFloat (0.1, 1.2)) Seconds
	repeat
endscript

script surgebetweensongs 
	begin
	SoundEvent \{event = $current_crowd_oneshot_positive_soundevent}
	Wait (RandomFloat (0.3, 1.2)) Seconds
	repeat
endscript

script killsurgingscripts 
	Wait \{2
		Seconds}
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
endscript

script surge_after_explosion 
	Wait \{2
		Seconds}
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
endscript

script cheer_before_explosion 
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_short_soundevent}
endscript

script colorwheel_increment_up_down 
	printstruct <...>
	if GotParam \{current_ring}
		switch <current_ring>
			case 1
			SoundEvent \{event = colorwheel_highlight_1}
			case 2
			SoundEvent \{event = colorwheel_highlight_2}
			case 3
			SoundEvent \{event = colorwheel_highlight_3}
			case 4
			SoundEvent \{event = colorwheel_highlight_4}
			case 5
			SoundEvent \{event = colorwheel_highlight_5}
		endswitch
	endif
endscript

script loading_screen_crowd_swell 
endscript

script killsurgingscripts_faster 
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
endscript

script crowd_loading_whistle 
endscript

script metalfest_intro 
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_short_soundevent}
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_long_soundevent}
	Wait \{1
		Second}
	killsurgingscripts
endscript

script ghtunes_ui_scroll_pan 
	sfx_pan = (<sfx_pan> * 0.1)
	PlaySound ghtunes_menu_scroll vol = -2 pitch = 4 pan1x = <sfx_pan> pan1y = 1.0
endscript

script nullsound 
endscript

script ghmix_scroll 
	if GotParam \{adv_record}
		SoundEvent \{event = ghtunes_ui_scroll}
	else
		if GotParam \{up}
			generic_menu_up_or_down_sound \{up}
		else
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script ghtunes_scroll 
	SoundEvent \{event = ghtunes_ui_scroll}
endscript

script play_win_lose_anim_sound \{skip = 0}
	Obj_GetID
	i = 1
	if NOT ($dont_play_win_amim_sfx = 1)
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
		gman_songtool_getcurrentsong
		part = <part>
		printf channel = sfx qs(0xafa59a93) s = <part>
		GetPakManCurrent \{map = zones}
		if GotParam \{event}
			switch <event>
				case mic_feedback
				SoundEvent \{event = mic_feedback}
				case mic_grab
				SoundEvent \{event = mic_grab}
				case mic_hit
				SoundEvent \{event = mic_hit}
				case drummer_sticks_throw
				SoundEvent \{event = drummer_sticks_throw}
				case large_smash
				if GotParam \{part}
					switch <part>
						case bass
						SoundEvent \{event = large_bass_smash}
						case guitar
						SoundEvent \{event = large_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case medium_smash
				if GotParam \{part}
					switch <part>
						case bass
						SoundEvent \{event = medium_bass_smash}
						case guitar
						SoundEvent \{event = medium_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case small_smash
				if GotParam \{part}
					switch <part>
						case bass
						SoundEvent \{event = small_bass_smash}
						case guitar
						SoundEvent \{event = small_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case drummer_tom_hit
				SoundEvent \{event = drummer_tom_hit}
				case drummer_snare_hit
				SoundEvent \{event = drummer_snare_hit}
				default
				printf \{channel = sfx
					qs(0xc0f17fb8)}
			endswitch
		endif
	endif
endscript

script counter_play_beep_spawn 
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

script counter_play_beep \{time = 10}
	SpawnScriptNow counter_play_beep_spawn params = {time = <time>}
	Wait <time> Seconds
	KillSpawnedScript \{Name = counter_play_beep_spawn}
endscript

script trivia_play_music_streams_setup 
endscript

script trivia_play_music_streams_fade_in \{time = 0.5}
endscript

script trivia_play_music_streams_fade_out \{time = 0.5}
endscript

script trivia_play_music_streams_reset_volumes 
endscript

script no_dolby_digital_sounds 
	if IsSoundEventPlaying \{dolby_off}
		StopSoundEvent \{dolby_off
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{menu_dolbydigitalenable_surround_c}
		stopsound \{menu_dolbydigitalenable_surround_c
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{menu_dolbydigitalenable_surround_r}
		stopsound \{menu_dolbydigitalenable_surround_r
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{menu_dolbydigitalenable_surround_ls}
		stopsound \{menu_dolbydigitalenable_surround_ls
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{menu_dolbydigitalenable_surround_rs}
		stopsound \{menu_dolbydigitalenable_surround_rs
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{menu_dolbydigitalenable_surround_lf}
		stopsound \{menu_dolbydigitalenable_surround_lf
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{menu_dolbydigitalenable_surround_l}
		stopsound \{menu_dolbydigitalenable_surround_l
			fade_time = 0.2
			fade_type = linear}
	endif
endscript

script vocal_sidechain 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf channel = sfx qs(0xc4a9a039) s = <Player>
	Change \{stop_vocal_sidechain = 0}
	global_rms_value = 0
	begin
	if ($stop_vocal_sidechain = 1)
		break
	endif
	if NOT ScriptIsRunning \{fretbar_update_tempo}
		break
	endif
	vocals_getcuramplitude Player = <Player>
	if GotParam \{current_amplitude}
		Change global_rms_value = (($global_rms_value + <current_amplitude>) / 2)
		if ($global_rms_value < 0.5)
			setsoundbussparams {vocals_balance = {vol = ($default_BussSet.vocals_balance.vol)} time = 0.1}
		elseif ($global_rms_value < 1.0)
			setsoundbussparams \{vocals_balance = {
					vol = 0
				}
				time = 0.1}
		elseif ($global_rms_value < 1.3)
			setvol = ($sidechainingvolumepercentadjustment * -2.5)
			setsoundbussparams {vocals_balance = {vol = <setvol>} time = 0.1}
		elseif ($global_rms_value < 1.5)
			setvol = ($sidechainingvolumepercentadjustment * -3.75)
			setsoundbussparams {vocals_balance = {vol = <setvol>} time = 0.1}
		else
			setvol = ($sidechainingvolumepercentadjustment * -5.0)
			setsoundbussparams {vocals_balance = {vol = <setvol>} time = 0.1}
		endif
	endif
	Wait \{3
		gameframe}
	repeat
endscript

script vocal_sidechain_logic 
	printf channel = sfx qs(0xc4a9a039) s = <Player>
	printf channel = sfx qs(0x7013df09) s = <muting>
	if (<muting> = FALSE)
		Change \{stop_vocal_sidechain = 0}
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
				printf \{channel = sfx
					qs(0x66ea4639)}
				if ScriptIsRunning \{vocal_sidechain}
					KillSpawnedScript \{Name = vocal_sidechain}
				endif
			else
				printf \{channel = sfx
					qs(0x5dfd0eb3)}
				SpawnScriptNow vocal_sidechain params = {Player = <Player>}
			endif
		else
			printf \{channel = sfx
				qs(0x0b018b40)}
			SpawnScriptNow vocal_sidechain params = {Player = <Player>}
		endif
	else
		Change \{stop_vocal_sidechain = 1}
	endif
endscript

script venuetypedecision \{time = 1}
	printf channel = sfx qs(0x7a6fe640) s = <time>
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'nothing'
	endif
	printf channel = sfx qs(0x23e3eeff) s = <venuesize>
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
		printf \{channel = sfx
			qs(0xf9889ab0)}
		setsoundbusseffects effects = [{Name = venueverb $medium_int_reverb}] time = <time>
	endswitch
endscript

script outro_stars 
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
	SpawnScriptNow spawning_outro_stars params = {<...>}
endscript

script spawning_outro_stars 
	Wait <wait_time> Seconds
	printf channel = sfx qs(0x9231b06a) s = <vol>
	StartPreLoadedStream <unique_id> buss = Front_End forcesafepreload = 1 vol = <vol>
endscript

script kill_outro_stars 
	KillSpawnedScript \{Name = spawning_outro_stars}
	stopsound \{outro_one_star}
	stopsound \{outro_two_stars}
	stopsound \{outro_three_stars}
	stopsound \{outro_four_stars}
	stopsound \{outro_five_stars}
	stopsound \{outro_six_stars}
endscript

script kill_only_oneshots 
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot}
endscript

script playaudiosequenceforloadingbink 
	setscriptcannotpause
endscript

script stopaudiosequenceforloadingbink 
	stopsound \{loadscreen_music
		fade_time = 1.0
		fade_type = linear}
	stopsound \{loadscreen_star_explode
		fade_time = 1.0
		fade_type = linear}
	stopsound \{loadscreen_electrical_loop_long
		fade_time = 1.0
		fade_type = linear}
endscript

script playcamerawinsfx 
	SoundEvent \{event = end_of_song_camera_movement_sound}
	SoundEvent \{event = endofsong_camera_cheer}
endscript

script crowd_swells_during_stats_screen 
	begin
	Wait RandomFloat (30.0, 50.0) Seconds
	printf \{channel = sfx
		qs(0xd1248a93)}
	SoundEvent \{event = surge_during_stats_screen}
	repeat
endscript

script killmenumusicslowly 
	KillSpawnedScript \{Name = menu_music_on}
	KillSpawnedScript \{Name = menu_music_on_spawned}
	Change \{menu_music_on_flag = 0}
	StopSoundEvent \{Menu_Music_SE}
	KillSpawnedScript \{Name = menu_music_se_spawned}
	Change \{menu_music_preloading = 0}
	stopsound \{$menu_music_stream
		fade_time = 2.4
		fade_type = linear}
endscript

script getvolumetweakofpreloadedstream \{streamname = Default}
	printf channel = sfx qs(0xaa2bf61d) t = <streamname>
	switch <streamname>
		case z_cairo_intro
		volumetweak = 0.0
		case z_neworleans_intro
		volumetweak = 0.0
		case z_mexicocity_intro
		volumetweak = -3.0
		case z_nashville_intro
		volumetweak = -2.0
		case z_norway_intro
		volumetweak = -2.0
		case z_dublin_intro
		volumetweak = 0.0
		case z_vegas_intro
		volumetweak = 0.0
		case z_subway_intro
		volumetweak = -2.0
		case z_sanfrancisco_intro
		volumetweak = 0.0
		case z_carhenge_intro
		volumetweak = -3.0
		case z_freakshow_intro
		volumetweak = -2.0
		case z_dragrace_intro
		volumetweak = -2.0
		case z_lhc_intro
		volumetweak = -2.0
		case z_cairo_encore
		volumetweak = -5.0
		case z_neworleans_encore
		volumetweak = -1.0
		case z_mexicocity_encore
		volumetweak = -4.0
		case z_nashville_encore
		volumetweak = -6.0
		case z_norway_encore
		volumetweak = 0.0
		case z_dublin_encore
		volumetweak = -3.0
		case z_vegas_encore
		volumetweak = -2.0
		case z_subway_encore
		volumetweak = -3.0
		case z_sanfrancisco_encore
		volumetweak = -3.0
		case z_carhenge_encore
		volumetweak = -4.0
		case z_freakshow_encore
		volumetweak = -2.5
		case z_dragrace_encore
		volumetweak = -3.0
		case z_lhc_encore
		volumetweak = 0.0
		case z_carhenge_celebintro
		volumetweak = 0.0
		case z_dublin_celebintro
		volumetweak = 0.0
		case z_lhc_celebintro
		volumetweak = -6.0
		case z_mexicocity_celebintro
		volumetweak = 0.0
		case z_nashville_celebintro
		volumetweak = 2.0
		default
		volumetweak = 0
	endswitch
	printf channel = sfx qs(0x40a231ed) s = <volumetweak>
	return volumetweak = <volumetweak>
endscript

script you_rock_script 
	SoundEvent \{event = you_rock_front}
	SoundEvent \{event = you_rock_back}
	SoundEvent \{event = you_rock_lfe}
	Wait \{2
		Seconds}
	SoundEvent \{event = $current_crowd_swell_short_soundevent}
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	SoundEvent \{event = $current_crowd_applause_soundevent}
endscript

script fail_song_crowd_logic 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_neutral
		fadeintime = 10
		fadeintype = linear
		fadeouttime = 10
		fadeouttype = linear}
	SpawnScriptNow \{neutral_crowd_wait_to_lower_stats}
	printf \{channel = sfx
		qs(0x85e2e392)}
	SpawnScriptNow \{crowd_swells_during_stats_screen}
endscript

script game_start_crowd_cheer 
	if ($not_start_of_game = 0)
		Wait \{8
			Seconds}
		setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) -10) pitch = 0.0} time = 20}
		Wait \{2.5
			Second}
		SoundEvent \{event = beginning_crowd_swell}
		Change \{not_start_of_game = 1}
	endif
endscript

script going_into_freeplay_from_main_menu 
	Wait \{1
		Seconds}
	SoundEvent \{event = surge_from_main_to_freeplay}
endscript

script intro_crowds 
	printf \{channel = sfx
		qs(0x6020d865)}
	gamemode_gettype
	if NOT (<Type> = tutorial || <Type> = freeplay || $calibrate_lag_enabled = 1)
		SoundEvent \{event = $current_crowd_applause_soundevent}
		SoundEvent \{event = $current_crowd_swell_short_soundevent}
	endif
endscript

script intro_crowds_fast 
	printf \{channel = sfx
		qs(0x89152bc9)}
	gamemode_gettype
	if NOT (<Type> = tutorial || <Type> = freeplay || $calibrate_lag_enabled = 1)
		SoundEvent \{event = $current_crowd_applause_soundevent}
		SoundEvent \{event = $current_crowd_swell_short_soundevent}
	endif
endscript

script practicedrums_fadein 
	setsoundbussparams {practicemode_drums = {vol = (($default_BussSet.practicemode_drums.vol) - 100)}}
	Wait \{3.5
		Seconds}
	setsoundbussparams {practicemode_drums = {vol = (($default_BussSet.practicemode_drums.vol))} time = 3.5}
endscript

script practicedrums_fadeout 
	setsoundbussparams {practicemode_drums = {vol = (($default_BussSet.practicemode_drums.vol) - 100)} time = 2.0}
endscript

script neutral_crowd_wait_to_lower_stats 
	setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol) -20) pitch = 0.0} time = 7}
endscript

script stop_all_paused_sounds 
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
	stopsound \{sm_int_crowd_swell_md}
	stopsound \{sm_int_crowd_swell_sh}
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
	stopsound \{md_int_crowd_swell_md}
	stopsound \{md_int_crowd_swell_sh}
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
	stopsound \{md_ext_crowd_swell_md}
	stopsound \{md_ext_crowd_swell_sh}
	stopsound \{md_int_crowd_song_transition}
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
	stopsound \{lg_ext_crowd_song_transition}
	stopsound \{lg_ext_crowd_swell_lg}
	stopsound \{lg_ext_crowd_swell_md}
	stopsound \{lg_ext_crowd_swell_sh}
	StopSoundEvent \{lg_ext_crowd_oneshot_positive}
	StopSoundEvent \{lg_int_crowd_oneshot_positive}
	StopSoundEvent \{md_ext_crowd_oneshot_positive}
	StopSoundEvent \{md_ext_crowd_oneshot_positive_01}
	StopSoundEvent \{md_int_crowd_oneshot_positive}
	StopSoundEvent \{sm_ext_crowd_oneshot_positive}
	StopSoundEvent \{sm_int_crowd_oneshot_positive}
	StopSoundEvent \{lg_ext_crowd_oneshot_negative}
	StopSoundEvent \{lg_int_crowd_oneshot_negative}
	StopSoundEvent \{md_ext_crowd_oneshot_negative}
	StopSoundEvent \{md_int_crowd_oneshot_negative}
	StopSoundEvent \{sm_ext_crowd_oneshot_negative}
	StopSoundEvent \{sm_int_crowd_oneshot_negative}
endscript
