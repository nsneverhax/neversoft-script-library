
script Create_Venue_Effects_Settings 
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
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
		VenueSize = 'nothing'
	endif
	printf channel = sfx qs(0xfb84a2a3) s = <VenueSize>
	switch <VenueSize>
		case 'Large_EXT'
		printf channel = sfx qs(0x00bcbb5a) s = <VenueSize>
		CreateEffectSendStack Slot = ($venue_sendeffect_slot) effects = [{name = venueverb $Large_EXT_Reverb}]
		case 'Large_INT'
		printf channel = sfx qs(0x00bcbb5a) s = <VenueSize>
		CreateEffectSendStack Slot = ($venue_sendeffect_slot) effects = [{name = venueverb $Large_INT_Reverb}]
		case 'Medium_INT'
		printf channel = sfx qs(0x00bcbb5a) s = <VenueSize>
		CreateEffectSendStack Slot = ($venue_sendeffect_slot) effects = [{name = venueverb $Medium_INT_Reverb}]
		case 'Medium_EXT'
		printf channel = sfx qs(0x00bcbb5a) s = <VenueSize>
		CreateEffectSendStack Slot = ($venue_sendeffect_slot) effects = [{name = venueverb $Medium_EXT_Reverb}]
		case 'Small_INT'
		printf channel = sfx qs(0x00bcbb5a) s = <VenueSize>
		CreateEffectSendStack Slot = ($venue_sendeffect_slot) effects = [{name = venueverb $Small_INT_Reverb}]
		case 'Small_EXT'
		printf channel = sfx qs(0x00bcbb5a) s = <VenueSize>
		CreateEffectSendStack Slot = ($venue_sendeffect_slot) effects = [{name = venueverb $Small_EXT_Reverb}]
		default
		printf \{channel = sfx
			qs(0x79963774)}
		CreateEffectSendStack Slot = ($venue_sendeffect_slot) effects = [{name = venueverb $Medium_INT_Reverb}]
	endswitch
	SetDSPEffectParams \{effects = [
			{
				Effect = sfxreverb
				name = venueverb
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
	SetSoundBussParams \{$default_BussSet}
	SetSoundBussParams \{$default_BussSet
		time = 0.5}
	SoundBussLock \{Master}
	SoundBussLock \{User_Vocals}
	SoundBussLock \{User_Drums}
	SoundBussLock \{User_Guitar}
	SoundBussLock \{User_Bass}
	SoundBussLock \{User_RhythmGTR}
	SoundBussLock \{User_Crowd}
	SoundBussLock \{User_SFX}
	SoundBussLock \{User_Band}
	SoundBussLock \{User_CrowdSingalong}
	SoundBussLock \{User_Misc}
endscript

script PrintPushPopDebugInfo 
	if NOT GotParam \{push}
		if NOT GotParam \{Pop}
			printf \{qs(0xf0680b89)}
			return
		endif
	endif
	if GotParam \{push}
		pushPop = qs(0x1acc2a0c)
	else
		pushPop = qs(0x8637b58f)
	endif
	if NOT GotParam \{name}
		printf \{qs(0xd2bb34b1)}
		return
	endif
	printf qs(0x3c00af92) a = <name> b = <pushPop>
endscript

script Generic_Reverb_Functionality_Script \{NewEchoSettings = $Echo_Dry
		EchoFadeTime = 0.5
		NewReverbSettings = $Reverb_Dry
		ReverbFadeTime = 0.5}
	if inside
		if GotParam \{NewEchoSettings}
			if GotParam \{EchoFadeTime}
				setsoundbusseffects effects = [{<NewEchoSettings> name = Crowd_W_Reverb_Buss_Echo}] time = <EchoFadeTime>
			else
				setsoundbusseffects effects = [{<NewEchoSettings> name = Crowd_W_Reverb_Buss_Echo}]
			endif
		endif
		if GotParam \{NewReverbSettings}
			if GotParam \{ReverbFadeTime}
				setsoundbusseffects effects = [{<NewReverbSettings> name = Crowd_W_Reverb_Buss_Reverb}] time = <ReverbFadeTime>
			else
				setsoundbusseffects effects = [{<NewReverbSettings> name = Crowd_W_Reverb_Buss_Reverb}]
			endif
		endif
	else
		if GotParam \{Destroyed}
		else
			if GotParam \{Created}
			else
				if GotParam \{ExitEchoSettings}
					if GotParam \{ExitEchoFadeTime}
						setsoundbusseffects effects = [{<ExitEchoSettings> name = Crowd_W_Reverb_Buss_Echo}] time = <ExitEchoFadeTime>
					else
						setsoundbusseffects effects = [{<ExitEchoSettings> name = Crowd_W_Reverb_Buss_Echo}]
					endif
				endif
				if GotParam \{ExitReverbSettings}
					if GotParam \{ExitReverbFadeTime}
						setsoundbusseffects effects = [{<ExitReverbSettings> name = Crowd_W_Reverb_Buss_Reverb}] time = <ExitReverbFadeTime>
					else
						setsoundbusseffects effects = [{<ExitReverbSettings> name = Crowd_W_Reverb_Buss_Reverb}]
					endif
				endif
			endif
		endif
	endif
endscript

script GH_Star_Power_Verb_On 
	printf \{channel = sfx
		qs(0x9892061a)}
	GetPlayerInfo <player> part
	printf channel = sfx qs(0xbaecfbed) s = <player>
	if ($Star_power_verb_is_on = 1)
		printf \{channel = sfx
			qs(0xf3504361)}
		if NOT isSinglePlayerGame
			printf \{channel = sfx
				qs(0x4292e934)}
			spawnscriptnow Star_Power_Clap_Panning_Multiple params = {player = <player>}
			spawnscriptnow Star_Power_Deployed_SFX_Multiplayer params = {player = <player>}
		endif
	else
		spawnscriptnow \{Star_Clapping_Fade_In}
		printf \{channel = sfx
			qs(0xd6de249a)}
		spawnscriptnow Star_Power_Clap_Panning params = {player = <player>}
		printf \{channel = sfx
			qs(0xc8d90171)}
		Change \{Star_power_verb_is_on = 1}
		GMan_SongTool_GetCurrentSong
		if IsPS3
			if NOT (<current_song> = jamsession)
				if isSinglePlayerGame
					SoundEvent \{event = Star_Power_Deployed_LFE_GH4}
					SpawnScript \{Star_Power_Delay_Logic}
					SoundEvent \{event = Star_Power_Deployed_Front_Gh4}
					if ($game_mode != tutorial)
						if NOT IsSoundEventPlaying \{Star_Power_Deployed_Cheer_SFX}
							SoundEvent \{event = Star_Power_Deployed_Cheer_SFX}
						endif
					endif
				else
					SpawnScript \{Star_Power_Delay_Logic}
					spawnscriptnow Star_Power_Deployed_SFX_Multiplayer params = {player = <player>}
				endif
			endif
		else
			if isSinglePlayerGame
				SoundEvent \{event = Star_Power_Deployed_LFE_GH4}
				SpawnScript \{Star_Power_Delay_Logic}
				SoundEvent \{event = Star_Power_Deployed_Front_Gh4}
				if ($game_mode != tutorial)
					if NOT IsSoundEventPlaying \{Star_Power_Deployed_Cheer_SFX}
						SoundEvent \{event = Star_Power_Deployed_Cheer_SFX}
					endif
				endif
			else
				SpawnScript \{Star_Power_Delay_Logic}
				spawnscriptnow Star_Power_Deployed_SFX_Multiplayer params = {player = <player>}
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
	GMan_SongTool_GetCurrentSong
	switch <part>
		case guitar
		printf \{channel = sfx
			qs(0xaf3a873b)}
		if NOT (<current_song> = jamsession)
			SongSetVenueEffectSendVolume player = <player> vol = 0
		endif
		case bass
		printf \{channel = sfx
			qs(0xf7672ca5)}
		if NOT (<current_song> = jamsession)
			SongSetVenueEffectSendVolume player = <player> vol = -10
		endif
		case Drum
		printf \{channel = sfx
			qs(0x45603514)}
		if NOT (<current_song> = jamsession)
			SongSetVenueEffectSendVolume player = <player> vol = -3
		endif
		case vocals
		printf \{channel = sfx
			qs(0x21a151f5)}
		VocalDSPSetParams \{Effect = sfxreverb
			ReverbLevel = 200
			RoomHF = 1000
			Diffusion = 1200
			DryLevel = -2000.0}
		VocalDSPSetParams \{Effect = echo
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
	SetSoundBussParams {UI_Star_Power_Delay = {vol = (($default_BussSet.UI_Star_Power_Delay.vol)) pitch = 0.0} time = 0}
	Change \{Star_Power_Delay = 0}
	StopSoundsByBuss \{UI_Star_Power_Delay}
	printf channel = sfx qs(0x149d7db3) s = <player>
	spawnscriptnow Star_Clap_End params = {player = <player>}
	spawnscriptnow \{Clap_Fading}
	Change \{Star_power_verb_is_on = 0}
	GMan_SongTool_GetCurrentSong
	if NOT (<current_song> = jamsession)
		SongSetVenueEffectSendVolume player = <player> vol = -100
	endif
	GetPlayerInfo <player> part
	if (<part> = vocals)
		VocalDSPSetParams \{Effect = sfxreverb
			ReverbLevel = -550
			RoomHF = 0
			Diffusion = 100
			DryLevel = 0.0}
		VocalDSPSetParams \{Effect = echo
			Drymix = 0.0
			wetmis = 0.25
			delay = 100}
	endif
endscript

script GH3_Set_Guitar_Verb_And_Echo_to_Dry 
endscript

script GH5_Music_Change_DSP_Snapshot \{time = 4
		scriptname = None}
	printf channel = sfx qs(0x71489f1f) s = <scriptname>
	Singalong_Effect_Send = -6
	Singalong_Buss = -3
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		printf \{channel = sfx
			qs(0x9733853e)}
		VenueSize = 'nothing'
	endif
	switch <VenueSize>
		case 'Large_EXT'
		printf \{channel = sfx
			qs(0xd7731e55)}
		<Singalong_Effect_Send> = -1
		<Singalong_Buss> = -3
		case 'Large_INT'
		printf \{channel = sfx
			qs(0xd5c3d66d)}
		<Singalong_Effect_Send> = -2
		<Singalong_Buss> = -3
		case 'Medium_INT'
		printf \{channel = sfx
			qs(0x89bdc134)}
		<Singalong_Effect_Send> = -6
		<Singalong_Buss> = -3
		case 'Medium_EXT'
		printf \{channel = sfx
			qs(0x8b0d090c)}
		<Singalong_Effect_Send> = -6
		<Singalong_Buss> = -2
		case 'Small_INT'
		printf \{channel = sfx
			qs(0x3d696ba6)}
		<Singalong_Effect_Send> = -6.5
		<Singalong_Buss> = -4
		case 'Small_EXT'
		printf \{channel = sfx
			qs(0x3fd9a39e)}
		<Singalong_Effect_Send> = -6
		<Singalong_Buss> = -2
		default
		printf \{channel = sfx
			qs(0x79963774)}
		<Singalong_Effect_Send> = -6
		<Singalong_Buss> = -2
	endswitch
	if GotParam \{snapshot}
		switch <snapshot>
			case 'house'
			printf \{channel = sfx
				qs(0xc5ba5694)}
			setsoundbusseffects effects = [
				{name = kick_eq $EQ_House_Kick}
				{name = Kick_Delay $Echo_House_Kick}
				{name = Snare_EQ $EQ_House_Snare}
				{name = Snare_Delay $Echo_House_Snare}
				{name = Cymbal_EQ $EQ_House_Cymbal}
				{name = Guitar_Compressor $Compressor_House_Guitar}
				{name = Guitar_EQ $EQ_House_Guitar}
				{name = Bass_Compressor $Compressor_House_Bass}
				{name = Bass_EQ $EQ_House_Bass}
				{name = Vocal_EQ $EQ_House_Vocal}
				{name = Vocal_Delay $Echo_House_Vocal}
			] time = <time>
			Change Current_EQ_Kick_Gain = ($EQ_House_Kick.gain)
			Change Current_Delay_Kick_Wetmix = ($Echo_House_Kick.Wetmix)
			Change Current_EQ_Snare_Gain = ($EQ_House_Snare.gain)
			Change Current_Delay_Snare_Wetmix = ($Echo_House_Snare.Wetmix)
			Change Current_EQ_Cymbal_Gain = ($EQ_House_Cymbal.gain)
			Change Current_Comp_Guitar_Threshold = ($Compressor_House_Guitar.threshold)
			Change Current_EQ_Guitar_Gain = ($EQ_House_Guitar.gain)
			Change Current_Comp_Bass_Threshold = ($Compressor_House_Bass.threshold)
			Change Current_EQ_Bass_Gain = ($EQ_House_Bass.gain)
			Change Current_EQ_Vocals_Gain = ($EQ_House_Vocal.gain)
			Change Current_Delay_Vocals_Wetmix = ($Echo_House_Vocal.Wetmix)
			VenueTypeDecision params = {time = <time>}
			if GotParam \{Bump_3db}
				SetSoundBussParams \{$House_3db_BussSet
					time = 0}
				wait \{1
					gameframe}
				SetSoundBussParams \{$House_BussSet
					time = 20}
			else
				SetSoundBussParams $House_BussSet time = <time>
			endif
			SongSetVenueEffectSendVolume \{track = kick
				vol = -6}
			SongSetVenueEffectSendVolume \{track = snare
				vol = -6}
			SongSetVenueEffectSendVolume \{track = cymbal
				vol = -12}
			SongSetVenueEffectSendVolume \{track = tom
				vol = -6}
			SongSetVenueEffectSendVolume \{track = guitar
				vol = 0}
			SongSetVenueEffectSendVolume \{track = bass
				vol = 2}
			SongSetVenueEffectSendVolume \{track = vocal
				vol = -6}
			SongSetVenueEffectSendVolume \{track = Band
				vol = -6}
			GetPakManCurrent \{map = zones}
			if (<pak> = Z_Visualizer)
				SongSetVenueEffectSendVolume \{track = Crowd
					vol = -100}
				SetSoundBussParams {CrowdSingalong_Stream = {vol = -100} time = <time>}
			else
				SongSetVenueEffectSendVolume \{track = Crowd
					vol = -100}
				SetSoundBussParams {CrowdSingalong_Stream = {vol = -100} time = <time>}
			endif
			case 'stage'
			printf \{channel = sfx
				qs(0x7c1981b3)}
			setsoundbusseffects effects = [
				{name = kick_eq $EQ_Stage_Kick}
				{name = Kick_Delay $Echo_Stage_Kick}
				{name = Snare_EQ $EQ_Stage_Snare}
				{name = Snare_Delay $Echo_Stage_Snare}
				{name = Cymbal_EQ $EQ_Stage_Cymbal}
				{name = Guitar_Compressor $Compressor_Stage_Guitar}
				{name = Guitar_EQ $EQ_Stage_Guitar}
				{name = Bass_Compressor $Compressor_Stage_Bass}
				{name = Bass_EQ $EQ_Stage_Bass}
				{name = Vocal_EQ $EQ_Stage_Vocal}
				{name = Vocal_Delay $Echo_Stage_Vocal}
			] time = <time>
			Change Current_EQ_Kick_Gain = ($EQ_Stage_Kick.gain)
			Change Current_Delay_Kick_Wetmix = ($Echo_Stage_Kick.Wetmix)
			Change Current_EQ_Snare_Gain = ($EQ_Stage_Snare.gain)
			Change Current_Delay_Snare_Wetmix = ($Echo_Stage_Snare.Wetmix)
			Change Current_EQ_Cymbal_Gain = ($EQ_Stage_Cymbal.gain)
			Change Current_Comp_Guitar_Threshold = ($Compressor_Stage_Guitar.threshold)
			Change Current_EQ_Guitar_Gain = ($EQ_Stage_Guitar.gain)
			Change Current_Comp_Bass_Threshold = ($Compressor_Stage_Bass.threshold)
			Change Current_EQ_Bass_Gain = ($EQ_Stage_Bass.gain)
			Change Current_EQ_Vocals_Gain = ($EQ_Stage_Vocal.gain)
			Change Current_Delay_Vocals_Wetmix = ($Echo_Stage_Vocal.Wetmix)
			VenueTypeDecision params = {time = <time>}
			SetSoundBussParams $Stage_BussSet time = <time>
			SongSetVenueEffectSendVolume \{track = kick
				vol = -11}
			SongSetVenueEffectSendVolume \{track = snare
				vol = -15}
			SongSetVenueEffectSendVolume \{track = cymbal
				vol = -5}
			SongSetVenueEffectSendVolume \{track = tom
				vol = -7}
			SongSetVenueEffectSendVolume \{track = vocal
				vol = -17}
			SongSetVenueEffectSendVolume \{track = guitar
				vol = -11}
			SongSetVenueEffectSendVolume \{track = bass
				vol = -5}
			SongSetVenueEffectSendVolume \{track = Band
				vol = -7}
			GetPakManCurrent \{map = zones}
			if (<pak> = Z_Visualizer)
				SongSetVenueEffectSendVolume \{track = Crowd
					vol = -100}
				SetSoundBussParams {CrowdSingalong_Stream = {vol = -100} time = <time>}
			else
				SongSetVenueEffectSendVolume track = Crowd vol = (<Singalong_Effect_Send> - 100)
				SetSoundBussParams {CrowdSingalong_Stream = {vol = (<Singalong_Buss> - 100)} time = <time>}
			endif
			Change \{current_send_vol = 6}
			case 'game'
			printf \{channel = sfx
				qs(0x0735013e)}
			spawnscriptnow \{Setting_Crowd_Loop_Beginning_Of_Song}
			setsoundbusseffects effects = [
				{name = kick_eq $EQ_Game_Kick}
				{name = Kick_Delay $Echo_Game_Kick}
				{name = Snare_EQ $EQ_Game_Snare}
				{name = Snare_Delay $Echo_Game_Snare}
				{name = Cymbal_EQ $EQ_Game_Cymbal}
				{name = Guitar_Compressor $Compressor_Game_Guitar}
				{name = Guitar_EQ $EQ_Game_Guitar}
				{name = Bass_Compressor $Compressor_Game_Bass}
				{name = Bass_EQ $EQ_Game_Bass}
				{name = Vocal_EQ $EQ_Game_Vocal}
				{name = Vocal_Delay $Echo_Game_Vocal}
			] time = <time>
			Change Current_EQ_Kick_Gain = ($EQ_Game_Kick.gain)
			Change Current_Delay_Kick_Wetmix = ($Echo_Game_Kick.Wetmix)
			Change Current_EQ_Snare_Gain = ($EQ_Game_Snare.gain)
			Change Current_Delay_Snare_Wetmix = ($Echo_Game_Snare.Wetmix)
			Change Current_EQ_Cymbal_Gain = ($EQ_Game_Cymbal.gain)
			Change Current_Comp_Guitar_Threshold = ($Compressor_Game_Guitar.threshold)
			Change Current_EQ_Guitar_Gain = ($EQ_Game_Guitar.gain)
			Change Current_Comp_Bass_Threshold = ($Compressor_Game_Bass.threshold)
			Change Current_EQ_Bass_Gain = ($EQ_Game_Bass.gain)
			Change Current_EQ_Vocals_Gain = ($EQ_Game_Vocal.gain)
			Change Current_Delay_Vocals_Wetmix = ($Echo_Game_Vocal.Wetmix)
			VenueTypeDecision params = {time = <time>}
			SetSoundBussParams $Game_BussSet time = <time>
			SongSetVenueEffectSendVolume \{track = kick
				vol = -100}
			SongSetVenueEffectSendVolume \{track = snare
				vol = -100}
			SongSetVenueEffectSendVolume \{track = cymbal
				vol = -100}
			SongSetVenueEffectSendVolume \{track = guitar
				vol = -100}
			SongSetVenueEffectSendVolume \{track = bass
				vol = -100}
			SongSetVenueEffectSendVolume \{track = vocal
				vol = -100}
			SongSetVenueEffectSendVolume \{track = tom
				vol = -100}
			SongSetVenueEffectSendVolume \{track = Band
				vol = -100}
			GameMode_GetType
			GetPakManCurrent \{map = zones}
			if (<type> = freeplay)
				if (<pak> = Z_Visualizer)
					SongSetVenueEffectSendVolume \{track = Crowd
						vol = -100}
					SetSoundBussParams {CrowdSingalong_Stream = {vol = -100} time = <time>}
				else
					SongSetVenueEffectSendVolume track = Crowd vol = <Singalong_Effect_Send>
					SetSoundBussParams {CrowdSingalong_Stream = {vol = <Singalong_Buss>} time = <time>}
				endif
			else
				if (<pak> = Z_Visualizer)
					SongSetVenueEffectSendVolume \{track = Crowd
						vol = -100}
					SetSoundBussParams {CrowdSingalong_Stream = {vol = -100} time = <time>}
				else
					SongSetVenueEffectSendVolume \{track = Crowd
						vol = -100}
					SetSoundBussParams {CrowdSingalong_Stream = {vol = -100} time = <time>}
				endif
			endif
			Change \{current_send_vol = 0}
			case 'join'
			printf \{channel = sfx
				qs(0xcaac3b03)}
			setsoundbusseffects effects = [
				{name = kick_eq $EQ_Game_Kick}
				{name = Kick_Delay $Echo_Game_Kick}
				{name = Snare_EQ $EQ_Game_Snare}
				{name = Snare_Delay $Echo_Game_Snare}
				{name = Cymbal_EQ $EQ_Game_Cymbal}
				{name = Guitar_Compressor $Compressor_Game_Guitar}
				{name = Guitar_EQ $EQ_Game_Guitar}
				{name = Bass_Compressor $Compressor_Game_Bass}
				{name = Bass_EQ $EQ_Game_Bass}
				{name = Vocal_EQ $EQ_Game_Vocal}
				{name = Vocal_Delay $Echo_Game_Vocal}
			] time = <time>
			Change Current_EQ_Kick_Gain = ($EQ_Game_Kick.gain)
			Change Current_Delay_Kick_Wetmix = ($Echo_Game_Kick.Wetmix)
			Change Current_EQ_Snare_Gain = ($EQ_Game_Snare.gain)
			Change Current_Delay_Snare_Wetmix = ($Echo_Game_Snare.Wetmix)
			Change Current_EQ_Cymbal_Gain = ($EQ_Game_Cymbal.gain)
			Change Current_Comp_Guitar_Threshold = ($Compressor_Game_Guitar.threshold)
			Change Current_EQ_Guitar_Gain = ($EQ_Game_Guitar.gain)
			Change Current_Comp_Bass_Threshold = ($Compressor_Game_Bass.threshold)
			Change Current_EQ_Bass_Gain = ($EQ_Game_Bass.gain)
			Change Current_EQ_Vocals_Gain = ($EQ_Game_Vocal.gain)
			Change Current_Delay_Vocals_Wetmix = ($Echo_Game_Vocal.Wetmix)
			SetSoundBussParams $Join_BussSet time = <time>
			SongSetVenueEffectSendVolume \{track = kick
				vol = -15}
			SongSetVenueEffectSendVolume \{track = snare
				vol = -15}
			SongSetVenueEffectSendVolume \{track = cymbal
				vol = -6}
			SongSetVenueEffectSendVolume \{track = tom
				vol = -6}
			SongSetVenueEffectSendVolume \{track = vocal
				vol = -15}
			SongSetVenueEffectSendVolume \{track = guitar
				vol = -15}
			SongSetVenueEffectSendVolume \{track = bass
				vol = -6}
			SongSetVenueEffectSendVolume \{track = Band
				vol = -6}
			GetPakManCurrent \{map = zones}
			if (<pak> = Z_Visualizer)
				SongSetVenueEffectSendVolume \{track = Crowd
					vol = -100}
				SetSoundBussParams {CrowdSingalong_Stream = {vol = -100} time = <time>}
			else
				SongSetVenueEffectSendVolume track = Crowd vol = (<Singalong_Effect_Send> - 3)
				SetSoundBussParams {CrowdSingalong_Stream = {vol = (<Singalong_Buss> - 9.5)} time = <time>}
			endif
			Change \{current_send_vol = 6}
			case 'pause'
			printf \{channel = sfx
				qs(0xe44985ba)}
			setsoundbusseffects effects = [
				{name = kick_eq $EQ_Game_Kick}
				{name = Kick_Delay $Echo_Game_Kick}
				{name = Snare_EQ $EQ_Game_Snare}
				{name = Snare_Delay $Echo_Game_Snare}
				{name = Cymbal_EQ $EQ_Game_Cymbal}
				{name = Guitar_Compressor $Compressor_Game_Guitar}
				{name = Guitar_EQ $EQ_Game_Guitar}
				{name = Bass_Compressor $Compressor_Game_Bass}
				{name = Bass_EQ $EQ_Game_Bass}
				{name = Vocal_EQ $EQ_Game_Vocal}
				{name = Vocal_Delay $Echo_Game_Vocal}
			] time = <time>
			Change Current_EQ_Kick_Gain = ($EQ_Game_Kick.gain)
			Change Current_Delay_Kick_Wetmix = ($Echo_Game_Kick.Wetmix)
			Change Current_EQ_Snare_Gain = ($EQ_Game_Snare.gain)
			Change Current_Delay_Snare_Wetmix = ($Echo_Game_Snare.Wetmix)
			Change Current_EQ_Cymbal_Gain = ($EQ_Game_Cymbal.gain)
			Change Current_Comp_Guitar_Threshold = ($Compressor_Game_Guitar.threshold)
			Change Current_EQ_Guitar_Gain = ($EQ_Game_Guitar.gain)
			Change Current_Comp_Bass_Threshold = ($Compressor_Game_Bass.threshold)
			Change Current_EQ_Bass_Gain = ($EQ_Game_Bass.gain)
			Change Current_EQ_Vocals_Gain = ($EQ_Game_Vocal.gain)
			Change Current_Delay_Vocals_Wetmix = ($Echo_Game_Vocal.Wetmix)
			SetSoundBussParams $Pause_BussSet time = <time>
			SongSetVenueEffectSendVolume \{track = kick
				vol = -100}
			SongSetVenueEffectSendVolume \{track = snare
				vol = -100}
			SongSetVenueEffectSendVolume \{track = cymbal
				vol
				-100}
			SongSetVenueEffectSendVolume \{track = guitar
				vol = -100}
			SongSetVenueEffectSendVolume \{track = bass
				vol = -100}
			SongSetVenueEffectSendVolume \{track = vocal
				vol = -100}
			SongSetVenueEffectSendVolume \{track = tom
				vol = -100}
			SongSetVenueEffectSendVolume \{track = Band
				vol = -100}
			GetPakManCurrent \{map = zones}
			if (<pak> = Z_Visualizer)
				SongSetVenueEffectSendVolume \{track = Crowd
					vol = -100}
				SetSoundBussParams {CrowdSingalong_Stream = {vol = -100} time = <time>}
			else
				SongSetVenueEffectSendVolume track = Crowd vol = (<Singalong_Effect_Send> - 1)
				SetSoundBussParams {CrowdSingalong_Stream = {vol = (<Singalong_Buss> - 9)} time = <time>}
			endif
			Change \{current_send_vol = 6}
		endswitch
	endif
endscript

script Setup_All_Crowd_Sounds_Based_On_Zone 
	VenueSize = 'Medium_EXT'
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		VenueSize = 'Medium_EXT'
	endif
	printf channel = sfx qs(0x1425fcec) s = <VenueSize>
	switch <VenueSize>
		case 'Large_EXT'
		venuetype = 'LG'
		case 'Large_INT'
		venuetype = 'LG'
		case 'SPACE'
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
	switch <VenueSize>
		case 'Small_INT'
		NewVenueSize = 'SM_INT'
		case 'Small_EXT'
		NewVenueSize = 'SM_EXT'
		case 'Medium_INT'
		NewVenueSize = 'MD_INT'
		case 'Medium_EXT'
		NewVenueSize = 'MD_EXT'
		case 'Large_INT'
		NewVenueSize = 'LG_INT'
		case 'Large_EXT'
		NewVenueSize = 'LG_EXT'
		case 'SPACE'
		NewVenueSize = 'LG_EXT'
		default
		printf \{qs(0xd177cb8d)}
		NewVenueSize = 'MD_INT'
	endswitch
	FormatText checksumname = whistletemp '%s_Crowd_Whistle_Positive' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Whistle_SoundEvent = <whistletemp>
	FormatText checksumname = oneshotgoodtemp '%s_Crowd_OneShot_Positive' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_OneShot_Positive_SoundEvent = <oneshotgoodtemp>
	FormatText checksumname = oneshotbadtemp '%s_Crowd_OneShot_Negative' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_OneShot_Negative_SoundEvent = <oneshotbadtemp>
	FormatText checksumname = loopgoodtemp 'Crowd_Loop_%s_Good' s = <VenueSize> AddToStringLookup = true
	Change Current_Crowd_Looping_BG_Area_Good = <loopgoodtemp>
	FormatText checksumname = loopneutraltemp 'Crowd_Loop_%s_Neutral' s = <VenueSize> AddToStringLookup = true
	Change Current_Crowd_Looping_BG_Area_Neutral = <loopneutraltemp>
	FormatText checksumname = loopbadtemp 'Crowd_Loop_%s_Bad' s = <VenueSize> AddToStringLookup = true
	Change Current_Crowd_Looping_BG_Area_Bad = <loopbadtemp>
	crowdtransitionchecksum = Crowd_Transition
	FormatText checksumname = claptemp '%s_Crowd_Clap_To_Beat_Normal' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Clap_Normal_SoundEvent = <claptemp>
	FormatText checksumname = claptemp '%s_Crowd_Clap_To_Beat_Middle' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Clap_Middle_SoundEvent = <claptemp>
	FormatText checksumname = claptemp '%s_Crowd_Clap_To_Beat_Left_Middle' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Clap_Left_Middle_SoundEvent = <claptemp>
	FormatText checksumname = claptemp '%s_Crowd_Clap_To_Beat_Right_Middle' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Clap_Right_Middle_SoundEvent = <claptemp>
	FormatText checksumname = claptemp '%s_Crowd_Clap_To_Beat_Left' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Clap_Left_SoundEvent = <claptemp>
	FormatText checksumname = claptemp '%s_Crowd_Clap_To_Beat_Right' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Clap_Right_SoundEvent = <claptemp>
	FormatText checksumname = transitiontemp '%s_Crowd_Negative_To_Neutral' s = <venuetype> AddToStringLookup = true
	Change Current_Crowd_Transition_Negative_To_Neutral = <transitiontemp>
	FormatText checksumname = transitiontemp '%s_Crowd_Neutral_To_Negative' s = <venuetype> AddToStringLookup = true
	Change Current_Crowd_Transition_Neutral_To_Negative = <transitiontemp>
	FormatText checksumname = transitiontemp '%s_Crowd_Neutral_To_Positive' s = <venuetype> AddToStringLookup = true
	Change Current_Crowd_Transition_Neutral_To_Positive = <transitiontemp>
	FormatText checksumname = transitiontemp '%s_Crowd_Positive_To_Neutral' s = <venuetype> AddToStringLookup = true
	Change Current_Crowd_Transition_Positive_To_Neutral = <transitiontemp>
	FormatText checksumname = swelltemp '%s_Crowd_Swell_Short' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Swell_Short_SoundEvent = <swelltemp>
	FormatText checksumname = swelltemp '%s_Crowd_Swell_Short_Soft' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Swell_Short_Soft_SoundEvent = <swelltemp>
	FormatText checksumname = swelltemp '%s_Crowd_Swell_Med' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Swell_Med_SoundEvent = <swelltemp>
	FormatText checksumname = swelltemp '%s_Crowd_Swell_Long' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Swell_Long_SoundEvent = <swelltemp>
	FormatText checksumname = encoretemp '%s_Encore_Crowd' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Encore = <encoretemp>
	FormatText checksumname = anticipationtemp '%s_Crowd_Anticipation_Loop' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Anticipation = <anticipationtemp>
	FormatText checksumname = Applausetemp '%s_Crowd_Applause' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_Applause_SoundEvent = <Applausetemp>
	FormatText checksumname = IntroTemp '%s_Crowd_Venue_Intro' s = <pakname> AddToStringLookup = true
	Change Current_Crowd_Venue_Intro_SoundEvent = <IntroTemp>
	FormatText checksumname = PreEncoreTemp '%s_Crowd_PreEncore_Looping_SoundEvent' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Crowd_PreEncore_Looping_SoundEvent = <PreEncoreTemp>
	FormatText checksumname = tempvenuesize '%s' s = <NewVenueSize> AddToStringLookup = true
	Change Current_Venue_Size = <tempvenuesize>
	printf \{channel = sfx
		qs(0xfba306ee)}
	printf \{channel = sfx
		qs(0x8d80eacf)
		s = $Current_Crowd_Whistle_SoundEvent}
	printf \{channel = sfx
		qs(0xf1a35267)
		s = $Current_Crowd_OneShot_Positive_SoundEvent}
	printf \{channel = sfx
		qs(0xfe1327ac)
		s = $Current_Crowd_OneShot_Negative_SoundEvent}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0x77767cd1)
		s = $Current_Crowd_Looping_BG_Area_Bad}
	printf \{channel = sfx
		qs(0x832a45ec)
		s = $Current_Crowd_Looping_BG_Area_Neutral}
	printf \{channel = sfx
		qs(0xf6e25b4b)
		s = $Current_Crowd_Looping_BG_Area_Good}
	printf \{channel = sfx
		qs(0x24ab80a8)
		s = $Current_Crowd_Looping_BG_Area}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0x36c99555)
		s = $Current_Crowd_Transition_Negative_To_Neutral}
	printf \{channel = sfx
		qs(0xddf4ea0b)
		s = $Current_Crowd_Transition_Neutral_To_Negative}
	printf \{channel = sfx
		qs(0x7eeabe3c)
		s = $Current_Crowd_Transition_Neutral_To_Positive}
	printf \{channel = sfx
		qs(0x3979e09e)
		s = $Current_Crowd_Transition_Positive_To_Neutral}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0xe6bc13b4)
		s = $Current_Crowd_Swell_Short_SoundEvent}
	printf \{channel = sfx
		qs(0x5881663d)
		s = $Current_Crowd_Swell_Med_SoundEvent}
	printf \{channel = sfx
		qs(0x8f5e027f)
		s = $Current_Crowd_Swell_Long_SoundEvent}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0xec13644d)
		s = $Current_Crowd_Applause_SoundEvent}
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
					if ($Turn_Off_OneShot_Cheers = 0)
						Play_A_Short_Crowd_Swell_For_This_Venue
					endif
					case 2
					if ($Turn_Off_OneShot_Cheers = 0)
						Play_A_Crowd_Applause_For_This_Venue
					endif
					case 3
					if ($current_crowd >= 1.3333)
						if ($Turn_Off_OneShot_Cheers = 0)
							Crowd_Surge_And_Sustain_At_End_Of_Song
						endif
					endif
					case 4
					Play_A_Crowd_Whistle_Good_Based_On_Venue
					case 5
					if ($current_crowd >= 1.3333)
						GH3_AdjustCrowdFastSmallSurge
					endif
					case 6
					if ($current_crowd >= 1.3333)
						if ($Turn_Off_OneShot_Cheers = 0)
							Play_A_Short_Crowd_Swell_For_This_Venue_Softer
						endif
						GH3_AdjustCrowdFastBigSurge
					endif
					case 7
					if ($current_crowd >= 1.3333)
						if ($Turn_Off_OneShot_Cheers = 0)
							Play_A_Med_Crowd_Swell_For_This_Venue
						endif
						GH3_AdjustCrowdMedSurge
					endif
					case 8
					if ($current_crowd >= 1.3333)
						if ($Turn_Off_OneShot_Cheers = 0)
							Play_A_Long_Crowd_Swell_For_This_Venue
						endif
						GH3_AdjustCrowdSlowBigSurge
					endif
					case 9
					printf \{'Not Working Right Now'}
					case 10
					Song_Quiet_Adjust_All_SFX_Down
					case 11
					Song_Quiet_Over_Adjust_All_SFX_To_Normal
					case 12
					Moment_On_Stage_Crowd_Reaction_SFX
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

script Play_A_Crowd_Whistle_Good_Based_On_Venue 
	SoundEvent \{event = $Current_Crowd_Whistle_SoundEvent}
endscript

script Play_A_Short_Crowd_Swell_For_This_Venue 
	printf \{channel = sfx
		qs(0x32f04896)
		s = $Current_Crowd_Swell_Short_SoundEvent}
	SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent}
	Crowd_AllPlayAnim \{anim = SwellSH
		playonce = true}
endscript

script Play_A_Short_Crowd_Swell_For_This_Venue_Softer 
	SoundEvent \{event = $Current_Crowd_Swell_Short_Soft_SoundEvent}
	Crowd_AllPlayAnim \{anim = SwellSH
		playonce = true}
endscript

script Play_A_Med_Crowd_Swell_For_This_Venue 
	SoundEvent \{event = $Current_Crowd_Swell_Med_SoundEvent}
	Crowd_AllPlayAnim \{anim = SwellMD
		playonce = true}
endscript

script Play_A_Long_Crowd_Swell_For_This_Venue 
	SoundEvent \{event = $Current_Crowd_Swell_Long_SoundEvent}
	Crowd_AllPlayAnim \{anim = SwellLG
		playonce = true}
endscript

script Play_A_Crowd_Applause_For_This_Venue 
	SoundEvent \{event = $Current_Crowd_Applause_SoundEvent}
endscript

script GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue 
endscript

script GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue 
endscript

script GH3_AdjustCrowdLoopBackToDefault \{restarting = 0
		Normal = 0}
	if ($current_playing_transition = loading)
	else
		printf \{channel = sfx
			qs(0x569ef608)}
		if (<restarting> = 1)
			if GotParam \{time}
				SetSoundBussParams {Crowd_beds = {vol = ($default_BussSet.Crowd_beds.vol) pitch = 0.0} time = 1.5}
			else
				SetSoundBussParams {Crowd_beds = {vol = ($default_BussSet.Crowd_beds.vol) pitch = 0.0} time = 1.5}
			endif
		else
			if (<Normal> = 1)
				if GotParam \{time}
					SetSoundBussParams {Crowd_beds = {vol = ($default_BussSet.Crowd_beds.vol) pitch = 0.0} time = 1.5}
				else
					SetSoundBussParams {Crowd_beds = {vol = ($default_BussSet.Crowd_beds.vol) pitch = 0.0} time = 1.5}
				endif
			else
			endif
		endif
	endif
endscript

script GH3_AdjustCrowdFastSmallSurge 
	if GotParam \{pak}
		printf channel = sfx qs(0x4d995118) s = <pak>
	endif
	printf \{channel = sfx
		qs(0xf2c3f029)}
	SetSoundBussParams {Crowd_beds = {vol = (($default_BussSet.Crowd_beds.vol) + 2)} time = 0.08}
	wait \{1.5
		seconds}
	GH3_AdjustCrowdLoopBackToDefault \{time = 4
		Normal = 1}
endscript

script GH3_AdjustCrowdFastBigSurge 
	if GotParam \{pak}
		printf channel = sfx qs(0xff61e7c6) s = <pak>
	endif
	printf \{channel = sfx
		qs(0x71cbe9dd)}
	SetSoundBussParams {Crowd_beds = {vol = (($default_BussSet.Crowd_beds.vol) + 4)} time = 0.08}
	wait \{1.5
		seconds}
	GH3_AdjustCrowdLoopBackToDefault \{time = 4
		Normal = 1}
endscript

script GH3_AdjustCrowdMedSurge 
	if GotParam \{pak}
		printf channel = sfx qs(0x0d163bb8) s = <pak>
	endif
	printf \{channel = sfx
		qs(0x07ac0c0b)}
	SetSoundBussParams {Crowd_beds = {vol = (($default_BussSet.Crowd_beds.vol) + 4)} time = 2}
	wait \{4
		seconds}
	GH3_AdjustCrowdLoopBackToDefault \{time = 4
		Normal = 1}
endscript

script GH3_AdjustCrowdSlowBigSurge 
	if GotParam \{pak}
		printf channel = sfx qs(0xe0d3da54) s = <pak>
	endif
	printf \{channel = sfx
		qs(0xcd3ff7f4)}
	SetSoundBussParams {Crowd_beds = {vol = (($default_BussSet.Crowd_beds.vol) + 4)} time = 3}
	wait \{8
		seconds}
	GH3_AdjustCrowdLoopBackToDefault \{time = 4
		Normal = 1}
endscript

script Song_Quiet_Adjust_All_SFX_Down \{SFXBalanceTime = 4
		CrowdBalanceTime = 8
		SFXVolSub = 4.0
		CrowdVolSub = 5.0}
	GameMode_GetType
	printf \{channel = sfx
		qs(0xfa5455b6)}
	SetSoundBussParams {SFX_Balance = {vol = (($default_BussSet.SFX_Balance.vol) - <SFXVolSub>)} time = <SFXBalanceTime>}
	SetSoundBussParams {Crowd_Balance = {vol = (($default_BussSet.Crowd_Balance.vol) - <CrowdVolSub>)} time = <CrowdBalanceTime>}
endscript

script Song_Quiet_Over_Adjust_All_SFX_To_Normal \{SFXBalanceTime = 8
		CrowdBalanceTime = 4}
	GameMode_GetType
	printf \{channel = sfx
		qs(0x1c6b884d)}
	SetSoundBussParams {SFX_Balance = {vol = ($default_BussSet.SFX_Balance.vol)} time = <SFXBalanceTime>}
	SetSoundBussParams {Crowd_Balance = {vol = ($default_BussSet.Crowd_Balance.vol)} time = <CrowdBalanceTime>}
endscript

script Song_Quiet_Reset_SFX_Balance \{loading_transition = 0
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
			SetSoundBussParams {SFX_Balance = {vol = ($default_BussSet.SFX_Balance.vol)}}
			SetSoundBussParams {Crowd_Balance = {vol = ($default_BussSet.Crowd_Balance.vol)}}
		else
			printf \{channel = sfx
				qs(0xd4c3161a)}
			Change \{Crowd_Transition_Start_Of_Song_Normal = 1}
			printf \{channel = sfx
				qs(0xd626aaa4)}
		endif
	endif
endscript

script Moment_On_Stage_Crowd_Reaction_SFX 
endscript

script Crowd_Surge_And_Sustain_At_End_Of_Song 
	printf \{channel = sfx
		qs(0x81999d59)}
	SetSoundBussParams {Crowd_beds = {vol = (($default_BussSet.Crowd_beds.vol) + 4)} time = 3.5}
endscript

script Crowd_Singalong_Volume_Up 
	GetPakManCurrent \{map = zones}
	GMan_SongTool_GetCurrentSong
	GameMode_GetType
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		printf \{channel = sfx
			qs(0x9733853e)}
		VenueSize = 'nothing'
	endif
	if NOT (<type> = freeplay)
		if NOT ((<pak> = Z_Visualizer) || (<pak> = Z_Cube) || (<pak> = Z_Space))
			if NOT (<current_song> = jamsession)
				if NOT ($crowd_is_singing = 1)
					switch <VenueSize>
						case 'Large_EXT'
						printf \{channel = sfx
							qs(0xd7731e55)}
						SongSetVenueEffectSendVolume \{track = Crowd
							vol = -1}
						SetSoundBussParams \{CrowdSingalong_Stream = {
								vol = -3
							}
							time = 4}
						case 'Large_INT'
						printf \{channel = sfx
							qs(0xd5c3d66d)}
						SongSetVenueEffectSendVolume \{track = Crowd
							vol = -2}
						SetSoundBussParams \{CrowdSingalong_Stream = {
								vol = -3
							}
							time = 4}
						case 'Medium_INT'
						printf \{channel = sfx
							qs(0x89bdc134)}
						SongSetVenueEffectSendVolume \{track = Crowd
							vol = -6}
						SetSoundBussParams \{CrowdSingalong_Stream = {
								vol = -3
							}
							time = 4}
						case 'Medium_EXT'
						printf \{channel = sfx
							qs(0x8b0d090c)}
						SongSetVenueEffectSendVolume \{track = Crowd
							vol = -6}
						SetSoundBussParams \{CrowdSingalong_Stream = {
								vol = -2
							}
							time = 4}
						case 'Small_INT'
						printf \{channel = sfx
							qs(0x3d696ba6)}
						SongSetVenueEffectSendVolume \{track = Crowd
							vol = -6.5}
						SetSoundBussParams \{CrowdSingalong_Stream = {
								vol = -4
							}
							time = 4}
						case 'Small_EXT'
						printf \{channel = sfx
							qs(0x3fd9a39e)}
						SongSetVenueEffectSendVolume \{track = Crowd
							vol = -6}
						SetSoundBussParams \{CrowdSingalong_Stream = {
								vol = -2
							}
							time = 4}
						default
						printf \{channel = sfx
							qs(0x79963774)}
						SongSetVenueEffectSendVolume \{track = Crowd
							vol = -7}
						SetSoundBussParams \{CrowdSingalong_Stream = {
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
	GameMode_GetType
	if NOT (<type> = freeplay)
		GMan_SongTool_GetCurrentSong
		if NOT (<current_song> = jamsession)
			if ($crowd_is_singing = 1)
				SongSetVenueEffectSendVolume \{track = Crowd
					vol = -100}
				SetSoundBussParams \{CrowdSingalong_Stream = {
						vol = -100.0
					}
					time = 4}
			endif
		endif
	endif
	Change \{crowd_is_singing = 0}
endscript

script Change_Crowd_Looping_SFX \{crowd_looping_state = good
		player = 1
		loading_transition = 0
		restarting = 0}
	wait \{1
		gameframe}
	if NOT ui_event_exists_in_stack \{name = 'gameplay'}
		crowd_looping_state = good
	endif
	GameMode_GetType
	if (<type> = competitive)
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
			New_BG_Area = $Current_Crowd_Looping_BG_Area_Bad
			New_OneShots = $Current_Crowd_OneShot_Negative_SoundEvent
			case neutral
			New_BG_Area = $Current_Crowd_Looping_BG_Area_Neutral
			New_OneShots = $Current_Crowd_OneShot_Positive_SoundEvent
			case good
			New_BG_Area = $Current_Crowd_Looping_BG_Area_Good
			New_OneShots = $Current_Crowd_OneShot_Positive_SoundEvent
			default
			printf \{channel = sfx
				qs(0xae489741)}
			New_BG_Area = $Current_Crowd_Looping_BG_Area_Good
			New_OneShots = $Current_Crowd_OneShot_Positive_SoundEvent
		endswitch
	else
		printf \{channel = sfx
			qs(0x5b438be7)}
		return
	endif
	if (($crowd_in_jam_mode_song_state = 1))
		New_OneShots = DoNothing_OneShot
	endif
	printf \{channel = sfx
		qs(0x2eecfe07)}
	if ($calibrate_lag_enabled = 0)
		Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = <New_BG_Area> loading_transition = <loading_transition> restarting = <restarting>
	else
		Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = FrontEnd loading_transition = <loading_transition> restarting = <restarting>
	endif
	One_Shot_SoundEvent SoundEvent = <New_OneShots> waittime = 5
endscript

script BG_Crowd_Front_End_Silence \{immediate = 0}
	Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = FrontEnd immediate = <immediate>
	One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waittime = 5 immediate = <immediate>
endscript

script Crowd_Transition_SFX_Poor_To_Medium 
	if GotParam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x3da6f454)}
		Crowd_generic_transition_sfx state = Negative_To_Neutral player = <player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Good 
	if GotParam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x7ba459ad)}
		Crowd_generic_transition_sfx state = Neutral_To_Positive player = <player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Poor 
	if GotParam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x73ffdd74)}
		Crowd_generic_transition_sfx state = Neutral_To_Negative player = <player>
	endif
endscript

script Crowd_Transition_SFX_Good_To_Medium 
	GH3_AdjustCrowdLoopBackToDefault \{time = 1
		Normal = 1}
	if GotParam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x713e8a0b)}
		Crowd_generic_transition_sfx state = Positive_To_Neutral player = <player>
	endif
endscript

script Crowd_generic_transition_sfx \{state = Neutral_To_Positive}
	if ($game_mode = p2_pro_faceoff)
	elseif ($calibrate_lag_enabled = 1)
		printf \{channel = sfx
			qs(0x1ab712d2)}
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
	volume = 0
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		VenueSize = 'nothing'
	endif
	if GotParam \{state}
		switch <state>
			case Negative_To_Neutral
			StopSound \{$Current_Crowd_Transition_Neutral_To_Negative
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $Current_Crowd_Transition_Negative_To_Neutral
			if ((<VenueSize> = 'Large_EXT') || (<VenueSize> = 'Large_INT'))
				volume = 11
			elseif ((<VenueSize> = 'Medium_EXT') || (<VenueSize> = 'Medium_INT'))
				volume = 8
			elseif ((<VenueSize> = 'Small_EXT') || (<VenueSize> = 'Small_INT'))
				volume = 6
			endif
			case Neutral_To_Positive
			StopSound \{$Current_Crowd_Transition_Positive_To_Neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $Current_Crowd_Transition_Neutral_To_Positive
			if (<VenueSize> = 'Large_EXT')
				volume = 1.5
			elseif ((<VenueSize> = 'Medium_EXT') || (<VenueSize> = 'Medium_INT'))
				volume = 6
			elseif ((<VenueSize> = 'Small_EXT') || (<VenueSize> = 'Small_INT'))
				volume = 2
			endif
			case Positive_To_Neutral
			StopSound \{$Current_Crowd_Transition_Neutral_To_Positive
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $Current_Crowd_Transition_Positive_To_Neutral
			if (<VenueSize> = 'Large_EXT')
				volume = 3
			elseif ((<VenueSize> = 'Medium_EXT') || (<VenueSize> = 'Medium_INT'))
				volume = 0.5
			elseif ((<VenueSize> = 'Small_EXT') || (<VenueSize> = 'Small_INT'))
				volume = 1.5
			endif
			case Neutral_To_Negative
			StopSound \{$Current_Crowd_Transition_Negative_To_Neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $Current_Crowd_Transition_Neutral_To_Negative
			if (<VenueSize> = 'Large_EXT')
				volume = 5
			elseif ((<VenueSize> = 'Medium_EXT') || (<VenueSize> = 'Medium_INT'))
				volume = 0
			elseif ((<VenueSize> = 'Small_EXT') || (<VenueSize> = 'Small_INT'))
				volume = 3
			endif
			case med_to_good
			printf \{qs(0x51243726)}
			StopSound \{$Current_Crowd_Transition_Positive_To_Neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $Current_Crowd_Transition_Neutral_To_Positive
			default
			printf \{qs(0x712bf1ca)}
		endswitch
		wait \{1
			gameframe}
		if GotParam \{left}
			if GotParam \{right}
				printf \{channel = sfx
					qs(0x0316271d)}
				Get_Multiplayer_SFX_Pan_Values \{crowd_meter_transition
					wide}
				PlaySound <transitionevent> vol = <volume> buss = Crowd_Transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
				printf \{channel = sfx
					qs(0x58436b7c)}
				Get_Multiplayer_SFX_Pan_Values \{crowd_meter_transition
					left}
				PlaySound <transitionevent> buss = Crowd_Transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		else
			if GotParam \{right}
				printf \{channel = sfx
					qs(0x0e3be335)}
				Get_Multiplayer_SFX_Pan_Values \{crowd_meter_transition
					right}
				PlaySound <transitionevent> buss = Crowd_Transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
				printf \{channel = sfx
					qs(0xdf6ecc9d)}
			endif
		endif
	endif
endscript

script Crowd_Transition_SFX_Negative_To_Neutral 
	if GotParam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x3da6f454)}
		Crowd_generic_transition_sfx state = Negative_To_Neutral player = <player>
	endif
endscript

script Crowd_Transition_SFX_Neutral_To_Positive 
	if GotParam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x7ba459ad)}
		Crowd_generic_transition_sfx state = Neutral_To_Positive player = <player>
	endif
endscript

script Crowd_Transition_SFX_Neutral_To_Negative 
	if GotParam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x73ffdd74)}
		Crowd_generic_transition_sfx state = Neutral_To_Negative player = <player>
	endif
endscript

script Crowd_Transition_SFX_Positive_To_Neutral 
	GH3_AdjustCrowdLoopBackToDefault \{time = 1
		Normal = 1}
	if GotParam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x713e8a0b)}
		Crowd_generic_transition_sfx state = Positive_To_Neutral player = <player>
	endif
endscript

script menu_music_on 
	spawnscriptnow Menu_Music_On_Spawned params = {<...>}
endscript

script Menu_Music_On_Spawned 
	if ($Menu_Music_On_Flag = 1)
		return
	else
		Change \{Menu_Music_On_Flag = 1}
	endif
	if GotParam \{waitforguitarlick}
		wait \{4
			seconds}
		SoundEvent \{event = Guitar_Lick_Crowd_Swell}
	endif
	EnableUserMusic
	begin
	SoundEvent \{event = Menu_Music_SE}
	if ($Menu_Music_Pan_Right = 1)
		SetSoundParams \{$Current_Menu_Song
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
	One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waittime = 5 immediate = <immediate>
	wait \{2
		seconds}
	Menu_music_Checking
	wait \{1
		second}
	repeat
endscript

script Menu_Music_Panning_Vol 
	if (issoundplaying $Current_Menu_Song)
		if GotParam \{panandlowervol}
			wait \{0.5
				seconds}
			SetSoundBussParams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) - 2.4)} time = 4}
		else
			if GotParam \{reset}
				wait \{0.5
					seconds}
				SetSoundBussParams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 4}
			endif
		endif
	endif
endscript

script Menu_Music_Pan_reset 
	if ($Menu_Music_Pan_Right = 1)
		Change \{Menu_Music_Pan_Right = 0}
		i = -0.4
		begin
		SetSoundParams $Current_Menu_Song pan1x = -1 pan1y = 1 pan2x = <i> pan2y = 1
		i = (<i> + 0.0077770003)
		wait \{1
			gameframe}
		repeat 180
	endif
endscript

script Menu_Music_Pan 
	if ($Menu_Music_Pan_Right = 0)
		Change \{Menu_Music_Pan_Right = 1}
		i = 1
		begin
		SetSoundParams $Current_Menu_Song pan1x = -1 pan1y = 1 pan2x = <i> pan2y = 1
		i = (<i> -0.0077770003)
		wait \{1
			gameframe}
		repeat 180
	endif
endscript

script Menu_music_Checking 
	begin
	if ($menu_music_preloading = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin
	wait \{1
		second}
	if NOT issoundplaying \{$menu_music_stream}
		break
	endif
	repeat
endscript

script Menu_Music_Off 
	DisableUserMusic
	killspawnedscript \{name = menu_music_on}
	killspawnedscript \{name = Menu_Music_On_Spawned}
	killspawnedscript \{name = menu_music_play_crowd_surge}
	Change \{Menu_Music_On_Flag = 0}
	KillMenuMusic
endscript

script GH5_Band_Screen_UI_Sound \{player_num = 2}
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
		StopSound \{lobbyscroll01}
		PlaySound lobbyscroll01 vol = -13 pitch = 1 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{down}
		printf \{channel = sfx
			qs(0x603e66a7)}
		StopSound \{lobbyscroll01}
		PlaySound lobbyscroll01 vol = -13 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{choose}
		printf \{channel = sfx
			qs(0x03d77756)}
		StopSound \{UI_Sound_05}
		PlaySound UI_Sound_05 vol = -15 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{back}
		printf \{channel = sfx
			qs(0x3e573add)}
		StopSound \{UI_Sound_09}
		PlaySound UI_Sound_09 vol = -11 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{generic_back}
		printf \{channel = sfx
			qs(0xffb7ef45)}
		StopSound \{UI_Sound_09}
		PlaySound \{UI_Sound_09
			vol = -11
			buss = front_end}
	endif
	if GotParam \{error}
		printf \{channel = sfx
			qs(0x6504f146)}
		StopSound \{Menu_Select_Negative}
		PlaySound Menu_Select_Negative vol = -4 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if GotParam \{continue}
		printf \{channel = sfx
			qs(0x0a59a215)}
		StopSound \{UI_Sound_05}
		StopSound \{Band_Complete_SFX}
		PlaySound \{Band_Complete_SFX
			vol = -2
			buss = front_end}
	endif
endscript

script Game_Rules_SFX 
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
		SoundEvent \{event = UI_SFX_Negative_Select}
	endif
endscript

script Attract_Mode_Start_Sound_Script 
	printf \{channel = sfx
		qs(0xa66c98f7)}
	SetSoundBussParams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) - 100)} time = 2.5}
	SetSoundBussParams {Vocals_Balance = {vol = (($default_BussSet.Vocals_Balance.vol) - 11)} time = 1.5}
	SetSoundBussParams {Drums_Balance = {vol = (($default_BussSet.Drums_Balance.vol) - 11)} time = 1.5}
	SetSoundBussParams {Guitar_Balance = {vol = (($default_BussSet.Guitar_Balance.vol) - 11)} time = 1.5}
	SetSoundBussParams {Bass_Balance = {vol = (($default_BussSet.Bass_Balance.vol) - 11)} time = 1.5}
	SetSoundBussParams {RhythmGTR_Balance = {vol = (($default_BussSet.RhythmGTR_Balance.vol) - 11)} time = 1.5}
	SetSoundBussParams {Band_Balance = {vol = (($default_BussSet.Band_Balance.vol) - 11)} time = 1.5}
	SetSoundBussParams {SFX_Balance = {vol = (($default_BussSet.SFX_Balance.vol) - 11)} time = 1.5}
	SetSoundBussParams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 11)} time = 7}
	SetSoundBussParams {CrowdSingalong_Balance = {vol = (($default_BussSet.CrowdSingalong_Balance.vol) - 11)} time = 7}
	SetSoundBussParams {Crowd_W_Reverb = {vol = (($default_BussSet.Crowd_W_Reverb.vol) - 11)} time = 7}
endscript

script Attract_Mode_Ends_Sound_Script 
	printf \{channel = sfx
		qs(0x2023477e)}
	SetSoundBussParams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2.5}
	SetSoundBussParams {Vocals_Balance = {vol = ($default_BussSet.Vocals_Balance.vol)} time = 1.5}
	SetSoundBussParams {Drums_Balance = {vol = ($default_BussSet.Drums_Balance.vol)} time = 1.5}
	SetSoundBussParams {Guitar_Balance = {vol = ($default_BussSet.Guitar_Balance.vol)} time = 1.5}
	SetSoundBussParams {Bass_Balance = {vol = ($default_BussSet.Bass_Balance.vol)} time = 1.5}
	SetSoundBussParams {RhythmGTR_Balance = {vol = ($default_BussSet.RhythmGTR_Balance.vol)} time = 1.5}
	SetSoundBussParams {Band_Balance = {vol = ($default_BussSet.Band_Balance.vol)} time = 1.5}
	SetSoundBussParams {SFX_Balance = {vol = ($default_BussSet.SFX_Balance.vol)} time = 1.5}
	SetSoundBussParams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 7}
	SetSoundBussParams {CrowdSingalong_Balance = {vol = ($default_BussSet.CrowdSingalong_Balance.vol)} time = 7}
	SetSoundBussParams {Crowd_W_Reverb = {vol = ($default_BussSet.Crowd_W_Reverb.vol)} time = 7}
endscript

script sound_options_scroll 
	SoundEvent \{event = audio_options_up_down}
endscript

script playing_sound_fader \{time = 2.102}
endscript

script playing_sound_knob 
	SetSpawnedScriptNoRepeatFor \{time = 2.256}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if GotParam \{instrument}
		switch <instrument>
			case guitar
			PlaySound audio_options_guitar vol = -9.0 buss = Options_Guitar effects = [{<eq_setting> name = audiooptionssound}]
			case bass
			PlaySound audio_options_bass vol = -9.0 buss = Options_Bass effects = [{<eq_setting> name = audiooptionssound}]
			case vocals
			PlaySound Audio_Options_Vocals vol = -9.0 buss = Options_Vocals effects = [{<eq_setting> name = audiooptionssound}]
			case drums
			PlaySound audio_options_drum vol = -9.0 buss = Options_Drums effects = [{<eq_setting> name = audiooptionssound}]
		endswitch
	endif
endscript

script menu_music_fade \{wait = 0
		volume = 100
		time = 0}
	wait <wait> seconds
	if GotParam \{out}
		SetSoundBussParams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) - <volume>)} time = <time>}
		if NOT GotParam \{dont_fade_crowd}
			printf \{channel = sfx
				qs(0x66d4f019)}
			SetSoundBussParams {Crowd = {vol = (($default_BussSet.Crowd.vol) - <volume>)} time = <time>}
		endif
	else
		if GotParam \{in}
			SetSoundBussParams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = <time>}
			printf \{channel = sfx
				qs(0xd3aa811b)}
			SetSoundBussParams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = <time>}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 2
				fadeouttype = linear}
			One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waittime = 5 immediate = <immediate>
		else
			printf \{channel = sfx
				qs(0x876d718a)}
		endif
	endif
endscript

script Get_Multiplayer_SFX_Pan_Values \{Vocalist = 0}
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
	elseif (<Vocalist> = 1)
		<pan1x> = -0.25
		<pan1y> = 1
		<pan2x> = 0.25
		<pan2y> = 1
	else
		if GotParam \{player}
			GetPlayerInfo <player> highway_position
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

script UI_SFX_Freeplay 
	GetPlayerInfo <player> part
	Get_Multiplayer_SFX_Pan_Values player = <player>
	switch <type>
		case jump
		PlaySound Freeplay_Enter_SFX vol = 2 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x676c844f)}
		case start
		PlaySound Freeplay_Enter_SFX vol = 3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x896c91fb)}
		case select
		PlaySound UI_Sound_05 vol = -3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x0ae2d889)}
		case instrument
		PlaySound UI_Sound_05 vol = -3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xf7571e78)}
		case up
		PlaySound Menu_Scroll_Up vol = -2 pitch = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xcac0cdfe)}
		case down
		PlaySound Menu_Scroll_down vol = -2 pitch = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xafc32f0f)}
		case drop
		PlaySound Freeplay_Drop_SFX vol = 3 pitch = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x43aa5374)}
		case back
		PlaySound UI_Sound_09 vol = -12 pitch = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xfa648a70)}
		case Default
		printf \{channel = sfx
			qs(0x30b3405c)}
	endswitch
endscript

script Reset_To_Current_Snapshot 
	printf \{channel = sfx
		qs(0xd46aacbb)
		t = $Current_Music_DSP_SnapShot_Setting}
	GH5_Music_Change_DSP_Snapshot \{snapshot = $Current_Music_DSP_SnapShot_Setting
		time = 3.0
		scriptname = Reset_To_Current_Snapshot}
endscript

script Freeplay_Music_Crowd_Transitions 
	printf \{channel = sfx
		qs(0x7a886d7d)}
	if GotParam \{transition}
		printf channel = sfx qs(0x72f3cb1c) s = <transition>
		switch <transition>
			case 'Start_Of_Game_Setup_Immediate'
			Change \{Current_Music_DSP_SnapShot_Setting = 'house'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'house'
				time = 0.0}
			SetSoundBussParams \{$Music_Stream_Quiet_BussSet
				time = 0.0}
			SetSoundBussParams \{$Start_Of_Game_Crowds_Silence_BussSet
				time = 0.0}
			SongSetVenueEffectSendVolume \{track = kick
				vol = -100}
			SongSetVenueEffectSendVolume \{track = snare
				vol = -100}
			SongSetVenueEffectSendVolume \{track = cymbal
				vol = -100}
			SongSetVenueEffectSendVolume \{track = guitar
				vol = -100}
			SongSetVenueEffectSendVolume \{track = bass
				vol = -100}
			SongSetVenueEffectSendVolume \{track = vocal
				vol = -100}
			SongSetVenueEffectSendVolume \{track = tom
				vol = -100}
			SongSetVenueEffectSendVolume \{track = Band
				vol = -100}
			case 'Start_Of_Game_Fade_In_To_House'
			Change \{Current_Music_DSP_SnapShot_Setting = 'house'}
			SetSoundBussParams \{$House_BussSet
				time = 0.5}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'house'
				time = 0.5}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
				fadeintime = 0.2
				fadeintype = linear}
			SetSoundBussParams \{$House_Crowd_BussSet
				time = 0.15}
			case 'Fade_Out_House_Music_To_Start_A_Stage_Song'
			SetSoundBussParams \{$Music_Stream_Quiet_BussSet
				time = 5.0}
			SetSoundBussParams \{$PreStage_Crowd_BussSet
				time = 8}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
				fadeintime = 6
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			wait \{2.5
				seconds}
			SongSetVenueEffectSendVolume \{track = kick
				vol = -100}
			SongSetVenueEffectSendVolume \{track = snare
				vol = -100}
			SongSetVenueEffectSendVolume \{track = cymbal
				vol = -100}
			SongSetVenueEffectSendVolume \{track = guitar
				vol = -100}
			SongSetVenueEffectSendVolume \{track = bass
				vol = -100}
			SongSetVenueEffectSendVolume \{track = vocal
				vol = -100}
			SongSetVenueEffectSendVolume \{track = tom
				vol = -100}
			SongSetVenueEffectSendVolume \{track = Band
				vol = -100}
			Change \{Current_Music_DSP_SnapShot_Setting = 'stage'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'stage'
				time = 0.0}
			SetSoundBussParams \{$Stage_Crowd_BussSet
				time = 15}
			case 'End_Of_Stage_Song_Fade_Out_Crowd'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
				fadeintime = 20
				fadeintype = linear
				fadeouttime = 20
				fadeouttype = linear}
			SetSoundBussParams \{$House_BussSet
				time = 25}
			case 'End_Of_Stage_Song_Setup_House_Immediate'
			Change \{Current_Music_DSP_SnapShot_Setting = 'house'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'house'
				time = 0}
			SetSoundBussParams \{$House_3db_BussSet
				time = 0.0}
			case 'Stage_To_Join'
			SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent}
			SoundEvent \{event = $Current_Crowd_Swell_Med_SoundEvent}
			Change \{Current_Music_DSP_SnapShot_Setting = 'join'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'join'
				time = 2}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			case 'House_To_Join'
			SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent}
			SoundEvent \{event = $Current_Crowd_Swell_Med_SoundEvent}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			Change \{Current_Music_DSP_SnapShot_Setting = 'join'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'join'
				time = 2}
			case 'Join_To_Game'
			printf \{channel = sfx
				qs(0x15aab6d4)}
			Change \{Current_Music_DSP_SnapShot_Setting = 'game'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'game'
				time = 4.0}
			case 'Join_To_House'
			Change \{Current_Music_DSP_SnapShot_Setting = 'house'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'house'
				time = 1.0}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Join_To_Stage'
			Change \{Current_Music_DSP_SnapShot_Setting = 'stage'}
			SetSoundBussParams \{$Stage_Crowd_BussSet
				time = 2}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'stage'
				time = 1.0}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
				fadeintime = 3
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			case 'Game_To_Pause'
			SetSoundBussParams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 3)} time = 2}
			Change \{Current_Music_DSP_SnapShot_Setting = 'pause'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'pause'
				time = 1.0}
			case 'Pause_To_Game'
			printf \{channel = sfx
				qs(0xee66b36a)}
			SetSoundBussParams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 2}
			Change \{Current_Music_DSP_SnapShot_Setting = 'game'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = Freeplay_Music_Crowd_Transitions_Pause_To_Game}
			case 'Pause_To_Setlist'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
				fadeintime = 2.5
				fadeintype = linear
				fadeouttime = 2.5
				fadeouttype = linear}
			SetSoundBussParams \{$Music_Stream_Quiet_BussSet
				time = 0.3}
			case 'Pause_To_MainMenu'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
				fadeintime = 2
				fadeintype = linear
				fadeouttime = 3.5
				fadeouttype = linear}
			Change \{Current_Music_DSP_SnapShot_Setting = 'house'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'house'
				time = 1.0}
			One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waittime = 5 immediate = <immediate>
			case 'Pause_To_House'
			Change \{Current_Music_DSP_SnapShot_Setting = 'house'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'house'
				time = 1.0}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Pause_To_Stage'
			Change \{Current_Music_DSP_SnapShot_Setting = 'stage'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'stage'
				time = 1.0}
			SetSoundBussParams \{$PreStage_Crowd_BussSet
				time = 1}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Setlist_To_Pause'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
				fadeintime = 1.5}
			SetSoundBussParams {Crowd = {vol = (($default_BussSet.Crowd.vol) - 3)} time = 2}
			Change \{Current_Music_DSP_SnapShot_Setting = 'pause'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'pause'
				time = 0.5}
			case 'Setlist_To_Game'
			printf \{channel = sfx
				qs(0x58ccbfbe)}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			Change \{Current_Music_DSP_SnapShot_Setting = 'game'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = Freeplay_Music_Crowd_Transitions_Setlist_To_Game}
			case 'Game_To_House'
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
				fadeintime = 3
				volpercentincrease = 20}
			Change \{Current_Music_DSP_SnapShot_Setting = 'house'}
			GH5_Music_Change_DSP_Snapshot \{snapshot = 'house'
				time = 1.0}
			wait \{4
				seconds}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
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
	GameMode_GetType
	if NOT ((<type> = freeplay) || ($in_sing_a_long = true))
		wait ($current_intro.hud_move_time / 1000.0) seconds
		SoundEvent \{event = Song_Intro_Kick_SFX}
	endif
endscript

script Song_Intro_Highway_Up_SFX_Waiting 
	GameMode_GetType
	if NOT (<type> = freeplay)
		waittime = (($current_intro.highway_move_time / 1000.0) - 1.5)
		if (<waittime> < 0)
			waittime = 0
		endif
		wait <waittime> seconds
		SoundEvent \{event = Song_Intro_Highway_Up}
		GetPakManCurrent \{map = zones}
	else
		if ($Beginning_Of_Freeplay_Highway_Up = 1)
			Change \{Beginning_Of_Freeplay_Highway_Up = 0}
			SoundEvent \{event = Song_Intro_Highway_Up}
		endif
	endif
endscript

script Song_Intro_Highway_Up_Vocals_SFX_Waiting 
	if NOT ($in_sing_a_long = true)
		SoundEvent \{event = Vocal_Highway_Appear}
	endif
endscript

script GH_SFX_Intro_WarmUp 
	killspawnedscript \{name = Loading_Screen_Crowd_Swell}
	killspawnedscript \{name = Crowd_Loading_Whistle}
	printf \{channel = sfx
		qs(0xa4fa756e)}
	SetSoundBussParams {Crowd_beds = {vol = (($default_BussSet.Crowd_beds.vol))} time = 2}
endscript

script GH_SFX_Countoff_Logic 
	GameMode_GetType
	GetNumPlayersInGame \{local}
	GetFirstPlayer \{local}
	GMan_SongTool_GetCurrentSong
	get_song_struct song = <current_song>
	if StructureContains structure = <song_struct> name = countoff
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
						type = RandomNoRepeatLastTwoType
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							-0.90999997
							-0.44
							0.0
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							-1.41
							-0.90999997
							-0.44
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							0.42000002
							0.83
							1.21
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							0.83
							1.58
							2.27
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							0.83
							1.58
							2.27
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-3.73
								-4.14
								-5.17
								-6.0
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case 'sticks_tiny'
					PlaySound \{StickClickSmall
						buss = Countoffs
						send_vol1 = $current_send_vol
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case 'hihat02'
					PlaySound \{HiHatOpen02
						buss = Countoffs
						send_vol1 = $current_send_vol
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					case 'hihat03'
					PlaySound \{HiHatPedal02
						buss = Countoffs
						send_vol1 = $current_send_vol
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-9.09
								-8.610001
								-7.9300003
								-7.51
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case 'sticks_tiny'
					PlaySound \{StickClickSmall
						buss = Countoffs
						send_vol1 = $current_send_vol
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case 'hihat02'
					PlaySound \{HiHatOpen02
						buss = Countoffs
						send_vol1 = $current_send_vol
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					case 'hihat03'
					PlaySound \{HiHatPedal02
						buss = Countoffs
						send_vol1 = $current_send_vol
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							-0.90999997
							-0.44
							0.0
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
					RandomVol = {
						type = RandomNoRepeatLastTwoType
						vals = [
							-1.41
							-0.90999997
							-0.44
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
					RandomVol = {
						type = RandomNoRepeatLastTwoType
						vals = [
							0.42000002
							0.83
							1.21
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
						vals = [
							0.17
							0.0
							0.0
						]
					}}
				case 'hihat03'
				PlaySound \{HiHatPedal02
					buss = Countoffs
					RandomVol = {
						type = RandomNoRepeatLastTwoType
						vals = [
							0.83
							1.58
							2.27
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
						type = RandomNoRepeatLastTwoType
						vals = [
							0.83
							1.58
							2.27
						]
					}
					RandomPitch = {
						type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-3.73
								-4.14
								-5.17
								-6.0
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case 'sticks_tiny'
					PlaySound \{StickClickSmall
						buss = Countoffs
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case 'hihat02'
					PlaySound \{HiHatOpen02
						buss = Countoffs
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					case 'hihat03'
					PlaySound \{HiHatPedal02
						buss = Countoffs
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-9.09
								-8.610001
								-7.9300003
								-7.51
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case 'sticks_tiny'
					PlaySound \{StickClickSmall
						buss = Countoffs
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case 'hihat02'
					PlaySound \{HiHatOpen02
						buss = Countoffs
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					case 'hihat03'
					PlaySound \{HiHatPedal02
						buss = Countoffs
						RandomVol = {
							type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
							type = RandomNoRepeatLastTwoType
							vals = [
								0.83
								1.58
								2.27
							]
						}
						RandomPitch = {
							type = RandomNoRepeatLastTwoType
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
	wait \{2
		seconds}
	SoundEvent \{event = Medium_Crowd_Applause}
endscript

script GH3_SFX_fail_song_stop_sounds 
	StopSoundsByBuss \{Crowd}
	StopSoundsByBuss \{UI_Star_Power}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundsByBuss \{Wrong_Notes_Bass}
	StopSoundsByBuss \{Wrong_Notes_Drums}
	StopSoundsByBuss \{Wrong_Notes_Guitar}
	StopSoundsByBuss \{BinkCutScenes}
endscript

script GH3_SFX_Stop_Sounds_For_KillSong \{loading_transition = 0}
	SetSoundBussParams {Default = {vol = ($default_BussSet.Default.vol)} time = 0.02}
	StopSoundEvent \{Song_Intro_Kick_SFX}
	StopSoundEvent \{Pyro}
	StopSoundEvent \{Notes_Ripple_Up_SFX}
	StopSoundEvent \{Song_Intro_Highway_Up}
	StopSoundEvent \{Crowd_Fast_Surge_Cheer}
	StopSoundEvent \{Medium_Crowd_Applause}
	StopSoundEvent \{Lose_Multiplier_Crowd}
	StopSoundEvent \{Star_Power_Release_Front_P1_Gh4}
	StopSoundEvent \{Star_Power_Release_Center_P1_Gh4}
	StopSoundEvent \{Star_Power_Release_Center_P2_GH4}
	StopSoundEvent \{Star_Power_Release_Front_P2_GH4}
	StopSoundEvent \{Star_Power_Deployed_LFE_P1_GH4}
	StopSoundEvent \{Star_Power_Deployed_LFE_P2_GH4}
	StopSoundEvent \{Star_Power_Deployed_Front_P1_GH4}
	StopSoundEvent \{Star_Power_Deployed_Back_P1_GH4}
	StopSoundEvent \{Star_Power_Deployed_Front_P2_GH4}
	StopSoundEvent \{Star_Power_Deployed_Back_P2_GH4}
	StopSoundEvent \{Star_Power_Available_P2_GH4}
	StopSoundEvent \{Star_Power_Available_P1_GH4}
	StopSound \{Shredfest_Momentum_Difficulty_Down}
	StopSound \{$Current_Crowd_Transition_Neutral_To_Positive}
	StopSound \{Shredfest_Player_Dropout}
	StopSound \{Point_Awarded}
	StopSound \{Shredfest_Momentum_Difficulty_Up}
	StopSoundEvent \{Shredfest_Play_SuddenDeath_Dropped}
	StopSoundEvent \{Star_Power_Awarded_SFX}
	StopSoundEvent \{Star_Power_Awarded_SFX_P1}
	StopSoundEvent \{Star_Power_Awarded_SFX_P2}
	StopSoundEvent \{Star_Power_Ready_SFX}
	StopSoundEvent \{Star_Power_Available_GH4}
	StopSoundEvent \{Star_Power_Release_Center_Gh4}
	StopSoundEvent \{Star_Power_Release_Front_GH4}
	StopSoundEvent \{Star_Power_Deployed_SFX}
	StopSoundEvent \{Star_Power_Deployed_Cheer_SFX}
	StopSoundEvent \{Star_Power_Deployed_Cheer_SFX_P1}
	StopSoundEvent \{Star_Power_Deployed_Cheer_SFX_P2}
	StopSoundEvent \{Star_Power_Deployed_Cheer_SFX_P3}
	StopSoundEvent \{$Current_Crowd_Clap_Normal_SoundEvent}
	StopSoundEvent \{$Current_Crowd_Clap_Middle_SoundEvent}
	StopSoundEvent \{$Current_Crowd_Clap_Left_Middle_SoundEvent}
	StopSoundEvent \{$Current_Crowd_Clap_Right_Middle_SoundEvent}
	StopSoundEvent \{$Current_Crowd_Clap_Left_SoundEvent}
	StopSoundEvent \{$Current_Crowd_Clap_Right_SoundEvent}
	StopSoundEvent \{Star_Power_Deployed_Back_GH4}
	StopSoundEvent \{Star_Power_Deployed_LFE_GH4}
	StopSoundEvent \{Star_Power_Deployed_Front_Gh4}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_2X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_3X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_4X}
	StopSoundEvent \{Lose_Multiplier_Crowd}
	StopSoundEvent \{Star_Power_Deployed_Back_P3_GH4}
	StopSoundEvent \{Star_Power_Deployed_Front_P3_GH4}
	StopSoundEvent \{Star_Power_Available_P3_GH4}
	StopSoundEvent \{Star_Power_Awarded_SFX_P3}
	StopSoundEvent \{Star_Power_Release_Center_P3_GH4}
	StopSoundEvent \{Star_Power_Release_Front_P3_GH4}
	StopSoundEvent \{UI_SFX_50_Note_Streak_SinglePlayer}
	StopSoundEvent \{UI_SFX_50_Note_Streak_P1}
	StopSoundEvent \{UI_SFX_50_Note_Streak_P2}
	StopSoundEvent \{UI_SFX_100_Note_Streak_SinglePlayer}
	StopSoundEvent \{UI_SFX_100_Note_Streak_P1}
	StopSoundEvent \{UI_SFX_100_Note_Streak_P2}
	StopSoundsByBuss \{Drums_InGame}
	StopSoundsByBuss \{Drums_JamMode}
	StopSoundsByBuss \{Guitar_JamMode}
	StopSoundsByBuss \{Bass_JamMode}
	StopSoundsByBuss \{Wrong_Notes_Guitar}
	StopSoundsByBuss \{Wrong_Notes_Bass}
	StopSoundsByBuss \{Wrong_Notes_Drums}
	StopSoundsByBuss \{Encore_Events}
	if (<type> = Normal)
		if (<loading_transition> = 1)
		else
		endif
	endif
endscript

script GH_SFX_Tutorial_Tuning_Strings 
	switch <note_played>
		case 0
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{E_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{E_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{E_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
		case 1
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{A_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{A_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{A_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
		case 2
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{D_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{D_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{D_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
		case 3
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{G_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{G_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{G_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
		case 4
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{B_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{B_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{B_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
	endswitch
endscript

script GH_SFX_Tutorial_Hammer_On_Lesson_2 
	switch <note_played>
		case 0
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{E_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{E_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{E_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
		case 1
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{A_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{A_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{A_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
		case 2
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{D_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{D_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{D_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
		case 3
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{G_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{G_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{G_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
		case 4
		switch <tutorial_notes_strummed>
			case 1
			PlaySound \{B_Tuning
				vol_percent = 90
				pitch_percent = 80
				buss = Tutorial_VO}
			case 2
			PlaySound \{B_Tuning
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
			case 3
			PlaySound \{B_String
				vol_percent = 90
				pitch_percent = 90
				buss = Tutorial_VO}
		endswitch
	endswitch
endscript

script StopNotes_01 
	if IsSoundEventPlaying \{Tutorial_String_1_Strum_Free}
		SetSoundParams \{Tutorial_String_1_Strum_Free
			vol_percent = 100}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_1_Strum_Free
			vol_percent = 50}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_1_Strum_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_1_Strum_Free}
	endif
endscript

script StopNotes_02 
	if IsSoundEventPlaying \{Tutorial_String_2_HOPO_Free}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 100}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 50}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_03 
	if IsSoundEventPlaying \{Tutorial_String_3_HOPO_Free}
		SetSoundParams \{Tutorial_String_3_HOPO_Free
			vol_percent = 100}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_3_HOPO_Free
			vol_percent = 50}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_3_HOPO_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_3_HOPO_Free}
	endif
endscript

script StopNotes_04 
	if IsSoundEventPlaying \{Tutorial_String_3_Strum_Free}
		SetSoundParams \{Tutorial_String_3_Strum_Free
			vol_percent = 100}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_3_Strum_Free
			vol_percent = 50}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_3_Strum_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_3_Strum_Free}
	endif
endscript

script StopNotes_05 
	if IsSoundEventPlaying \{Tutorial_String_2_HOPO_Free}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 100}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 50}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_06 
	if IsSoundEventPlaying \{Tutorial_String_1_HOPO_Free}
		SetSoundParams \{Tutorial_String_1_HOPO_Free
			vol_percent = 100}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_1_HOPO_Free
			vol_percent = 50}
		wait \{0.05
			seconds}
		SetSoundParams \{Tutorial_String_1_HOPO_Free
			vol_percent = 10}
		StopSoundEvent \{Tutorial_String_1_HOPO_Free}
	endif
endscript

script Tutorial_Mode_Finish_Chord_02 
	wait \{1
		seconds}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
endscript

script Tutorial_Mode_Finish_Chord_03 
	wait \{0.3
		seconds}
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
	GetPlayerInfo <player> highway_position
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
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
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
	GetPlayerInfo <player> part
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
		newbuss = Wrong_Notes_Bass
		case guitar
		RandomNoRepeat (
			@ soundasset = bad_note1
			vol = -6.63
			@ soundasset = bad_note2
			vol = -5.02
			@ soundasset = bad_note3
			vol = -6.2599998
			@ soundasset = bad_note4
			vol = -6.21
			@ soundasset = bad_note6
			vol = -6.2599998
			)
		newbuss = Wrong_Notes_Guitar
		case Drum
		switch <drum_stream>
			case 0
			case 2
			soundasset = Bad_Note_Tom1
			vol = -6
			pitch = RandomFloat (-2.0, 0.0)
			case 1
			soundasset = Bad_Note_HiHat1
			vol = -2
			pitch = -4
			case 3
			soundasset = Bad_Note_Kick1
			vol = -1
			pitch = 4
		endswitch
		newbuss = Wrong_Notes_Drums
		default
		printf \{channel = sfx
			qs(0xd6ef2146)}
	endswitch
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 1)
		vol = (<vol> - 8)
	endif
	PlaySound <soundasset> vol = <vol> pitch = <pitch> buss = <newbuss> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y> Priority = 90 panRemoveCenter = true
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
	SoundEvent \{event = Sort_Songlist}
endscript

script revive_or_kill_player_sfx \{player = 1
		Vocalist = 0
		cheer = 0}
	Get_Multiplayer_SFX_Pan_Values player = <player> Vocalist = <Vocalist>
	transitionevent = $Current_Crowd_Transition_Neutral_To_Positive
	if (<cheer> = 1)
		StopSound \{$Current_Crowd_Transition_Neutral_To_Positive}
		printf \{channel = sfx
			qs(0xacd1e525)}
		PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	else
		StopSound \{Shredfest_Momentum_Difficulty_Up}
		printf \{channel = sfx
			qs(0xe1577cb8)}
		PlaySound Shredfest_Player_Dropout vol = -12.0 buss = UI_InGame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script momentum_difficulty_up_sfx 
	Get_Multiplayer_SFX_Pan_Values player = <player>
	transitionevent = $Current_Crowd_Transition_Neutral_To_Positive
	StopSound \{Shredfest_Momentum_Difficulty_Up}
	StopSound \{$Current_Crowd_Transition_Neutral_To_Positive}
	switch <highway_position>
		case left
		printf \{channel = sfx
			qs(0xba999941)}
		PlaySound Shredfest_Momentum_Difficulty_Up buss = UI_InGame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case right
		printf \{channel = sfx
			qs(0x8f7647cd)}
		PlaySound Shredfest_Momentum_Difficulty_Up buss = UI_InGame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case leftcenter
		printf \{channel = sfx
			qs(0x3069704d)}
		PlaySound Shredfest_Momentum_Difficulty_Up buss = UI_InGame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case rightcenter
		printf \{channel = sfx
			qs(0xaac242f0)}
		PlaySound Shredfest_Momentum_Difficulty_Up buss = UI_InGame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case center
		printf \{channel = sfx
			qs(0xd7eabcbd)}
		PlaySound Shredfest_Momentum_Difficulty_Up buss = UI_InGame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		PlaySound <transitionevent> buss = Crowd_Transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case Default
		printf \{channel = sfx
			qs(0x578d9ab3)}
	endswitch
endscript

script momentum_difficulty_down_sfx 
	Get_Multiplayer_SFX_Pan_Values player = <player>
	switch <highway_position>
		case left
		printf \{channel = sfx
			qs(0x40cf2783)}
		PlaySound Shredfest_Momentum_Difficulty_Down buss = UI_InGame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case right
		printf \{channel = sfx
			qs(0x5a6396dc)}
		PlaySound Shredfest_Momentum_Difficulty_Down buss = UI_InGame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case leftcenter
		printf \{channel = sfx
			qs(0x36d9dc4c)}
		PlaySound Shredfest_Momentum_Difficulty_Down buss = UI_InGame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case rightcenter
		printf \{channel = sfx
			qs(0x6cb99ac2)}
		PlaySound Shredfest_Momentum_Difficulty_Down buss = UI_InGame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case center
		printf \{channel = sfx
			qs(0x75e7a8fa)}
		PlaySound Shredfest_Momentum_Difficulty_Down buss = UI_InGame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case Default
		printf \{channel = sfx
			qs(0x578d9ab3)}
	endswitch
endscript

script elimination_sfx_logic 
	if NOT issoundplaying \{Shredfest_Player_Dropout}
		Get_Multiplayer_SFX_Pan_Values player = <player>
		switch <highway_position>
			case left
			printf \{channel = sfx
				qs(0x28e32290)}
			PlaySound Shredfest_Player_Dropout buss = UI_InGame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case right
			printf \{channel = sfx
				qs(0x4be64bed)}
			PlaySound Shredfest_Player_Dropout buss = UI_InGame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case leftcenter
			printf \{channel = sfx
				qs(0x8ed28fe0)}
			PlaySound Shredfest_Player_Dropout buss = UI_InGame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case rightcenter
			printf \{channel = sfx
				qs(0x9c69d162)}
			PlaySound Shredfest_Player_Dropout buss = UI_InGame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case center
			printf \{channel = sfx
				qs(0x4bd810a4)}
			PlaySound Shredfest_Player_Dropout buss = UI_InGame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case Default
			printf \{channel = sfx
				qs(0xdb59d86c)}
		endswitch
	else
		SetSoundParams \{Shredfest_Player_Dropout
			pan1x = -1
			pan2x = 1
			pan1y = 1
			pan2y = 1}
	endif
endscript

script cast_vote_ui_sfx 
	switch <option>
		case 0
		SoundEvent \{event = Gameplay_Vote_Hell_SFX}
		case 1
		SoundEvent \{event = Gameplay_Vote_Heaven_SFX}
		default
		printf \{channel = sfx
			qs(0x8f74c921)}
	endswitch
endscript

script Kill_Voting_Screen_SFX 
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
	spawnscriptnow \{Counter_Play_Beep_Spawn
		params = {
			time = 2.5
		}}
	wait \{2.5
		seconds}
	killspawnedscript \{name = Counter_Play_Beep_Spawn}
endscript

script Tie_Breaker_SFX 
	printf channel = sfx qs(0x00c56ec0) s = <count>
	volume = -13
	switch <count>
		case 1
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 1.0 buss = front_end
		case 2
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 1.05 buss = front_end
		case 3
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 1.1 buss = front_end
		case 4
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 1.15 buss = front_end
		case 5
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 1.1 buss = front_end
		case 6
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 1.0 buss = front_end
		case 7
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.9 buss = front_end
		case 8
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.75 buss = front_end
		case 9
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.65000004 buss = front_end
		case 10
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.5 buss = front_end
		case 11
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.4 buss = front_end
		case 12
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.3 buss = front_end
		case 13
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.25 buss = front_end
		case 14
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.2 buss = front_end
		case 15
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.16 buss = front_end
		case 16
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.14 buss = front_end
		case 17
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.120000005 buss = front_end
		default
		PlaySound Menu_Gameplay_Spin vol = <volume> pitch = 0.120000005 buss = front_end
		printf \{channel = sfx
			qs(0x9716a790)}
	endswitch
endscript

script Voting_Outcome_Result_SFX 
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

script Spawned_Point_Awarded_Waiting \{pan_wide = 0}
	printf \{channel = sfx
		qs(0x046b774e)}
	if (<pan_wide> = 1)
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
	else
		Get_Multiplayer_SFX_Pan_Values player = <player>
	endif
	wait \{0.08
		seconds}
	PlaySound Point_Awarded vol = -7.5 buss = UI_InGame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script Spawned_Point_Awarded_Perfectionist_SFX \{pan_wide = 0}
	printf \{channel = sfx
		qs(0x046b774e)}
	if (<pan_wide> = 1)
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
	else
		Get_Multiplayer_SFX_Pan_Values player = <player>
	endif
	PlaySound Point_Awarded vol = -7.5 buss = UI_InGame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script switch_teams_sfx \{type = request
		direction = left}
	request_vol = -6
	resend_vol = -6
	if GotParam \{type}
		switch <type>
			case request
			switch <direction>
				case left
				PlaySound Team_Switch_Request vol = <request_vol> buss = front_end pan1x = -1 pan1y = 1 pan2x = -0.25 pan2y = 1
				case right
				PlaySound Team_Switch_Request vol = <request_vol> buss = front_end pan1x = 0.25 pan1y = 1 pan2x = 1 pan2y = 1
				default
				PlaySound Team_Switch_Request vol = <request_vol> buss = front_end pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1
			endswitch
			case resend
			switch <direction>
				case left
				PlaySound Team_Switch_Resend vol = <resend_vol> buss = front_end pan1x = -1 pan1y = 1 pan2x = -0.25 pan2y = 1
				case right
				PlaySound Team_Switch_Resend vol = <resend_vol> buss = front_end pan1x = 0.25 pan1y = 1 pan2x = 1 pan2y = 1
				default
				PlaySound Team_Switch_Resend vol = <resend_vol> buss = front_end pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1
			endswitch
			case swap
			SoundEvent \{event = Online_Team_Switch_Affirmation_SFX}
			default
			printf \{channel = sfx
				qs(0x5d4ccbf4)}
		endswitch
	endif
endscript

script CAR_Scroll_widget_sfx 
	SetSpawnedScriptNoRepeatFor \{time = 0.07}
	PlaySound Car_Widget_Scroll vol = -5.5 pitch_percent = ((<fill_perc> * 16.0) + 90) buss = front_end
endscript

script Highway_ripple_ui_sfx 
	if (<type> = freeplay)
		if NOT PlayerInfoEquals <player> freeplay_state = dropped
			if NOT PlayerInfoEquals <player> part = vocals
				SoundEvent \{event = Notes_Ripple_Up_SFX}
			endif
		endif
	else
		if NOT PlayerInfoEquals <player> part = vocals
			SoundEvent \{event = Notes_Ripple_Up_SFX}
		endif
	endif
endscript

script UI_Venue_Unlock_SFX 
	wait \{0.05
		seconds}
	SoundEvent \{event = Venue_Unlock_SFX}
endscript

script Unlock_Item_UI_SFX 
	SoundEvent \{event = UI_Unlock_Item_SFX}
endscript

script TestToneSoundEvent \{type = Default}
	printf channel = sfx qs(0x7a0099b8) s = <type>
	switch <type>
		case guitar
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{TestTones_Guitar
			buss = Master}
		case bass
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{TestTones_Bass
			buss = Master}
		case kick
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{TestTones_KickDrum
			buss = Master}
		case snare
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{TestTones_SnareDrum
			buss = Master}
		case tom
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{TestTones_Toms
			buss = Master}
		case cymbal
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{TestTones_Cymbals
			buss = Master}
		case vox
		printf \{channel = sfx
			qs(0x982ddb54)}
		PlaySound \{TestTones_Vocals
			buss = Master}
		case Band
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{TestTones_Band
			buss = Master}
		case Crowd
		printf \{channel = sfx
			qs(0x3d4d753d)}
		PlaySound \{testtones_crowd
			buss = Master}
		default
		printf channel = sfx qs(0x7a0099b8) s = <type>
	endswitch
endscript

script StartPinkNoiseLoopForCalirateLagScreen 
	PlaySound \{PinkNoise_Minnus_20
		buss = Default
		vol = -70
		num_loops = -1}
endscript

script StopPinkNoiseLoopForCalirateLagScreen 
	StopSound \{PinkNoise_Minnus_20}
endscript

script TestToneEnterScript 
	SetSoundBussParams {SFX_Balance = {vol = (($default_BussSet.SFX_Balance.vol) - 100)}}
endscript

script TestToneExitScript 
	SetSoundBussParams {SFX_Balance = {vol = ($default_BussSet.SFX_Balance.vol)}}
endscript

script muting_test_setup_script 
	SetSoundBussParams \{ui = {
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

script STARS 
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

script Star_Power_Deployed_SFX_Multiplayer \{player = 1}
	printf \{channel = sfx
		qs(0x9e86cd69)}
	GetPlayerInfo <player> highway_position
	printf channel = sfx qs(0x3c9d8c67) s = <highway_position>
	if NOT issoundplaying \{Star_Deployed_Back}
		printf \{channel = sfx
			qs(0xc62aa5dd)}
		if (<highway_position> = left)
			printf \{channel = sfx
				qs(0x4dfd5b77)}
			SoundEvent \{event = Star_Power_Deployed_LFE_P1_GH4}
			SoundEvent \{event = Star_Power_Deployed_Back_P1_GH4}
			SoundEvent \{event = Star_Power_Deployed_Front_P1_GH4}
			SoundEvent \{event = Star_Power_Deployed_Cheer_SFX_P1}
		else
			if (<highway_position> = right)
				printf \{channel = sfx
					qs(0x290badee)}
				SoundEvent \{event = Star_Power_Deployed_LFE_P1_GH4}
				SoundEvent \{event = Star_Power_Deployed_Back_P2_GH4}
				SoundEvent \{event = Star_Power_Deployed_Front_P2_GH4}
				SoundEvent \{event = Star_Power_Deployed_Cheer_SFX_P2}
			else
				printf \{channel = sfx
					qs(0xb3f669ca)}
				SoundEvent \{event = Star_Power_Deployed_LFE_P1_GH4}
				SoundEvent \{event = Star_Power_Deployed_Back_P3_GH4}
				SoundEvent \{event = Star_Power_Deployed_Front_P3_GH4}
				SoundEvent \{event = Star_Power_Deployed_Cheer_SFX_P3}
			endif
		endif
		printf \{channel = sfx
			qs(0xe6e95e4d)}
		Change \{Star_Power_Deployed_Flag = 1}
		wait \{0.9
			seconds}
		printf \{channel = sfx
			qs(0x0a5c5d52)}
		Change \{Star_Power_Deployed_Flag = 0}
	else
		printf \{channel = sfx
			qs(0xe4f96e42)}
		if ($Star_Power_Deployed_Flag = 1)
			printf \{channel = sfx
				qs(0xbf9f78e2)}
			SetSoundParams \{Star_Deployed_Front
				pan1x = -1
				pan1y = 1
				pan2x = 1
				pan2y = 1}
			SetSoundParams \{Star_Deployed_Back
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
				SoundEvent \{event = Star_Power_Deployed_LFE_P1_GH4}
				SoundEvent \{event = Star_Power_Deployed_Back_P1_GH4}
				SoundEvent \{event = Star_Power_Deployed_Front_P1_GH4}
				SoundEvent \{event = Star_Power_Deployed_Cheer_SFX_P1}
			else
				if (<highway_position> = right)
					printf \{channel = sfx
						qs(0x290badee)}
					SoundEvent \{event = Star_Power_Deployed_LFE_P1_GH4}
					SoundEvent \{event = Star_Power_Deployed_Back_P2_GH4}
					SoundEvent \{event = Star_Power_Deployed_Front_P2_GH4}
					SoundEvent \{event = Star_Power_Deployed_Cheer_SFX_P2}
				else
					printf \{channel = sfx
						qs(0xb3f669ca)}
					SoundEvent \{event = Star_Power_Deployed_LFE_P1_GH4}
					SoundEvent \{event = Star_Power_Deployed_Back_P3_GH4}
					SoundEvent \{event = Star_Power_Deployed_Front_P3_GH4}
					SoundEvent \{event = Star_Power_Deployed_Cheer_SFX_P3}
				endif
			endif
		endif
	endif
endscript

script Star_Power_Ready_SFX_Multiplayer \{player = 1}
	GetPlayerInfo <player> highway_position
	if NOT issoundplaying \{Star_Available}
		if (<highway_position> = left)
			SoundEvent \{event = Star_Power_Available_P1_GH4}
		elseif (<highway_position> = right)
			SoundEvent \{event = Star_Power_Available_P2_GH4}
		else
			SoundEvent \{event = Star_Power_Available_P3_GH4}
		endif
		Change \{Star_Power_Ready_Flag = 1}
		wait \{0.9
			second}
		Change \{Star_Power_Ready_Flag = 0}
	else
		if ($Star_Power_Ready_Flag = 1)
			SetSoundParams \{Star_Available
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				SoundEvent \{event = Star_Power_Available_P1_GH4}
			elseif (<highway_position> = right)
				SoundEvent \{event = Star_Power_Available_P2_GH4}
			else
				SoundEvent \{event = Star_Power_Available_P3_GH4}
			endif
		endif
	endif
endscript

script Star_Power_Awarded_SFX_Multiplayer \{player = 1}
	GetPlayerInfo <player> highway_position
	if NOT issoundplaying \{sp_awarded1}
		if (<highway_position> = left)
			SoundEvent \{event = Star_Power_Awarded_SFX_P1}
		elseif (<highway_position> = right)
			SoundEvent \{event = Star_Power_Awarded_SFX_P2}
		else
			SoundEvent \{event = Star_Power_Awarded_SFX_P3}
		endif
		Change \{Star_Power_Awarded_Flag = 1}
		wait \{0.3
			second}
		Change \{Star_Power_Awarded_Flag = 0}
	else
		if ($Star_Power_Awarded_Flag = 1)
			SetSoundParams \{sp_awarded2
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				SoundEvent \{event = Star_Power_Awarded_SFX_P1}
			elseif (<highway_position> = right)
				SoundEvent \{event = Star_Power_Awarded_SFX_P2}
			else
				SoundEvent \{event = Star_Power_Awarded_SFX_P3}
			endif
		endif
	endif
endscript

script Star_Power_Release_SFX_Multiplayer \{player = 1}
	GetPlayerInfo <player> highway_position
	if NOT issoundplaying \{Star_Release_Front}
		if (<highway_position> = left)
			SoundEvent \{event = Star_Power_Release_Center_P1_Gh4}
			SoundEvent \{event = Star_Power_Release_Front_P1_Gh4}
		elseif (<highway_position> = right)
			SoundEvent \{event = Star_Power_Release_Center_P2_GH4}
			SoundEvent \{event = Star_Power_Release_Front_P2_GH4}
		else
			SoundEvent \{event = Star_Power_Release_Center_P3_GH4}
			SoundEvent \{event = Star_Power_Release_Front_P3_GH4}
		endif
		Change \{Star_Power_Deployed_Flag = 1}
		wait \{0.9
			second}
		Change \{Star_Power_Deployed_Flag = 0}
	else
		if ($Star_Power_Deployed_Flag = 1)
			SetSoundParams \{Star_Release_Front
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
			SetSoundParams \{Star_Release_Center
				pan1x = 0.2392232
				pan1y = 0.97096455}
		else
			if (<highway_position> = left)
				SoundEvent \{event = Star_Power_Release_Center_P1_Gh4}
				SoundEvent \{event = Star_Power_Release_Front_P1_Gh4}
			elseif (<highway_position> = right)
				SoundEvent \{event = Star_Power_Release_Center_P2_GH4}
				SoundEvent \{event = Star_Power_Release_Front_P2_GH4}
			else
				SoundEvent \{event = Star_Power_Release_Center_P3_GH4}
				SoundEvent \{event = Star_Power_Release_Front_P3_GH4}
			endif
		endif
	endif
endscript

script StopAllCheeringSounds 
	StopSoundEvent \{$Current_Crowd_Swell_Short_SoundEvent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$Current_Crowd_Applause_SoundEvent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$Current_Crowd_Swell_Short_Soft_SoundEvent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$Current_Crowd_Swell_Med_SoundEvent
		fade_time = 0.8
		fade_type = log_slow}
	StopSoundEvent \{$Current_Crowd_Swell_Long_SoundEvent
		fade_time = 0.8
		fade_type = log_slow}
	Change \{Turn_Off_OneShot_Cheers = 1}
	wait \{8
		seconds}
	Change \{Turn_Off_OneShot_Cheers = 0}
endscript

script Clap_Fading 
	Change \{Clap_Fade = 1}
	SetSoundBussParams \{Crowd_Star_Power = {
			vol = -100
		}
		time = 5}
	wait \{5
		seconds}
	Change \{Clap_Fade = 0}
	Change \{Star_Clap_Left = 0}
	Change \{Star_Clap_Right = 0}
	Change \{Star_Clap_Left_Middle = 0}
	Change \{Star_Clap_Right_Middle = 0}
	Change \{Star_Clap_Middle = 0}
	Change \{Star_Clap_Normal = 0}
	StopSoundsByBuss \{Crowd_Star_Power}
	SetSoundBussParams {Crowd_Star_Power = {vol = ($default_BussSet.Crowd_Star_Power.vol)} time = 0.1}
endscript

script Clap_Fade_Kill 
	killspawnedscript \{name = Clap_Fading}
	SetSoundBussParams {Crowd_Star_Power = {vol = ($default_BussSet.Crowd_Star_Power.vol)} time = 0.1}
endscript

script Star_Power_Clap_Panning \{player = 1}
	if NOT isSinglePlayerGame
		GetPlayerInfo <player> highway_position
		if (<highway_position> = left)
			Change \{Star_Clap_Left = 1}
			Change \{Star_Clap_Right = 0}
			Change \{Star_Clap_Left_Middle = 0}
			Change \{Star_Clap_Right_Middle = 0}
			Change \{Star_Clap_Middle = 0}
			Change \{Star_Clap_Normal = 0}
			Change \{Star_Clap_LeftCenterRight = 0}
		elseif (<highway_position> = right)
			Change \{Star_Clap_Right = 1}
			Change \{Star_Clap_Left = 0}
			Change \{Star_Clap_Left_Middle = 0}
			Change \{Star_Clap_Right_Middle = 0}
			Change \{Star_Clap_Middle = 0}
			Change \{Star_Clap_Normal = 0}
			Change \{Star_Clap_LeftCenterRight = 0}
		else
			Change \{Star_Clap_Middle = 1}
			Change \{Star_Clap_Left = 0}
			Change \{Star_Clap_Right = 0}
			Change \{Star_Clap_Left_Middle = 0}
			Change \{Star_Clap_Right_Middle = 0}
			Change \{Star_Clap_Normal = 0}
			Change \{Star_Clap_LeftCenterRight = 0}
		endif
	else
		Change \{Star_Clap_Normal = 1}
		Change \{Star_Clap_Left = 0}
		Change \{Star_Clap_Right = 0}
		Change \{Star_Clap_Left_Middle = 0}
		Change \{Star_Clap_Right_Middle = 0}
		Change \{Star_Clap_Middle = 0}
		Change \{Star_Clap_LeftCenterRight = 0}
	endif
endscript

script Star_Power_Clap_Panning_Multiple \{player = 1}
	printf \{channel = sfx
		qs(0xd4253830)}
	if NOT isSinglePlayerGame
		printf \{channel = sfx
			qs(0xfae4d235)}
		GetPlayerInfo <player> highway_position
		printf channel = sfx qs(0x1fc7622c) s = <highway_position>
		if (<highway_position> = left)
			if (($Star_Clap_Right = 1))
				Change \{Star_Clap_Normal = 1}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_Right_Middle = 1)
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 1}
			elseif ($Star_Clap_Middle = 1)
				Change \{Star_Clap_Left_Middle = 1}
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			endif
		elseif (<highway_position> = right)
			if (($Star_Clap_Left = 1))
				Change \{Star_Clap_Normal = 1}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_Left_Middle = 1)
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 1}
			elseif ($Star_Clap_Middle = 1)
				Change \{Star_Clap_Right_Middle = 1}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			endif
		else
			if ($Star_Clap_Left = 1)
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 1}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_Right = 1)
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 1}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_Normal = 1)
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 1}
			endif
		endif
	endif
	printf \{channel = sfx
		qs(0xeb2f6f8f)
		s = $Star_Clap_Normal}
	printf \{channel = sfx
		qs(0xb9e8a7ea)
		s = $Star_Clap_Left}
	printf \{channel = sfx
		qs(0x5be19574)
		s = $Star_Clap_Right}
	printf \{channel = sfx
		qs(0x26a81163)
		s = $Star_Clap_Left_Middle}
	printf \{channel = sfx
		qs(0x8d27effe)
		s = $Star_Clap_Right_Middle}
	printf \{channel = sfx
		qs(0x8183fb93)
		s = $Star_Clap_Middle}
	printf \{channel = sfx
		qs(0x57cc176e)
		s = $Star_Clap_LeftCenterRight}
	printf \{channel = sfx
		qs(0x4bf4c5ee)}
endscript

script Star_Clap_End \{player = 1}
	if NOT isSinglePlayerGame
		GetPlayerInfo <player> highway_position
		if (<highway_position> = left)
			if (($Star_Clap_Left_Middle = 1))
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 1}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_Normal = 1)
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 1}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_LeftCenterRight = 1)
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Right_Middle = 1}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			endif
		elseif (<highway_position> = right)
			if (($Star_Clap_Right_Middle = 1))
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 1}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_Normal = 1)
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 1}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_LeftCenterRight = 1)
				Change \{Star_Clap_Left_Middle = 1}
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			endif
		else
			if ($Star_Clap_Left_Middle = 1)
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 1}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_Right_Middle = 1)
				Change \{Star_Clap_Normal = 0}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 1}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			elseif ($Star_Clap_LeftCenterRight = 1)
				Change \{Star_Clap_Normal = 1}
				Change \{Star_Clap_Left = 0}
				Change \{Star_Clap_Right = 0}
				Change \{Star_Clap_Left_Middle = 0}
				Change \{Star_Clap_Right_Middle = 0}
				Change \{Star_Clap_Middle = 0}
				Change \{Star_Clap_LeftCenterRight = 0}
			endif
		endif
	endif
endscript

script StartTestTones_Sine 
	SoundBussUnlock \{User_Vocals}
	SetSoundBussParams \{User_Vocals = {
			vol = -100.0
		}}
	SoundBussLock \{User_Vocals}
	SoundBussUnlock \{User_Drums}
	SetSoundBussParams \{User_Drums = {
			vol = -100.0
		}}
	SoundBussLock \{User_Drums}
	SoundBussUnlock \{User_Guitar}
	SetSoundBussParams \{User_Guitar = {
			vol = -100.0
		}}
	SoundBussLock \{User_Guitar}
	SoundBussUnlock \{User_Bass}
	SetSoundBussParams \{User_Bass = {
			vol = -100.0
		}}
	SoundBussLock \{User_Bass}
	SoundBussUnlock \{User_RhythmGTR}
	SetSoundBussParams \{User_RhythmGTR = {
			vol = -100.0
		}}
	SoundBussLock \{User_RhythmGTR}
	SoundBussUnlock \{User_Crowd}
	SetSoundBussParams \{User_Crowd = {
			vol = -100.0
		}}
	SoundBussLock \{User_Crowd}
	SoundBussUnlock \{User_SFX}
	SetSoundBussParams \{User_SFX = {
			vol = -100.0
		}}
	SoundBussLock \{User_SFX}
	SoundBussUnlock \{User_Band}
	SetSoundBussParams \{User_Band = {
			vol = -100.0
		}}
	SoundBussLock \{User_Band}
	begin
	PlaySound \{TestTone_SineWav_12db
		pan1x = -1.0
		pan1y = 1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_SineWav_12db
		pan1x = 0.0
		pan1y = 1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_SineWav_12db
		pan1x = 1.0
		pan1y = 1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_SineWav_12db
		pan1x = 1.0
		pan1y = -1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_SineWav_12db
		pan1x = -1.0
		pan1y = -1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_SineWav_12db
		LFEOnly = true
		LFE_vol = 0
		buss = Master}
	wait \{2
		seconds}
	repeat
endscript

script Start_Auto_Calibrate_Looping_Sound 
endscript

script Stop_Auto_Calibrate_Looping_Sound 
endscript

script Fire_Off_One_Shot_Blip 
endscript

script Run_Through_Auto_Audio_Lag_Calibration 
endscript

script StartTestTones_Pink 
	SoundBussUnlock \{User_Vocals}
	SetSoundBussParams \{User_Vocals = {
			vol = -100.0
		}}
	SoundBussLock \{User_Vocals}
	SoundBussUnlock \{User_Drums}
	SetSoundBussParams \{User_Drums = {
			vol = -100.0
		}}
	SoundBussLock \{User_Drums}
	SoundBussUnlock \{User_Guitar}
	SetSoundBussParams \{User_Guitar = {
			vol = -100.0
		}}
	SoundBussLock \{User_Guitar}
	SoundBussUnlock \{User_Bass}
	SetSoundBussParams \{User_Bass = {
			vol = -100.0
		}}
	SoundBussLock \{User_Bass}
	SoundBussUnlock \{User_RhythmGTR}
	SetSoundBussParams \{User_RhythmGTR = {
			vol = -100.0
		}}
	SoundBussLock \{User_RhythmGTR}
	SoundBussUnlock \{User_Crowd}
	SetSoundBussParams \{User_Crowd = {
			vol = -100.0
		}}
	SoundBussLock \{User_Crowd}
	SoundBussUnlock \{User_SFX}
	SetSoundBussParams \{User_SFX = {
			vol = -100.0
		}}
	SoundBussLock \{User_SFX}
	SoundBussUnlock \{User_Band}
	SetSoundBussParams \{User_Band = {
			vol = -100.0
		}}
	SoundBussLock \{User_Band}
	begin
	PlaySound \{TestTone_PinkNoise_12db
		pan1x = -1.0
		pan1y = 1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_PinkNoise_12db
		pan1x = 0.0
		pan1y = 1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_PinkNoise_12db
		pan1x = 1.0
		pan1y = 1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_PinkNoise_12db
		pan1x = 1.0
		pan1y = -1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_PinkNoise_12db
		pan1x = -1.0
		pan1y = -1.0
		buss = Master}
	wait \{2
		seconds}
	PlaySound \{TestTone_PinkNoise_12db
		LFEOnly = true
		LFE_vol = 0
		buss = Master}
	wait \{2
		seconds}
	repeat
endscript

script StopTestTones 
	if IsSoundEventPlaying \{StartTestTones_Pink}
		StopSoundEvent \{StartTestTones_Pink}
	endif
	if IsSoundEventPlaying \{StartTestTones_Sine}
		StopSoundEvent \{StartTestTones_Sine}
	endif
	SetSoundBussParams \{User_Vocals = {
			vol = 0.0
		}}
	SoundBussUnlock \{User_Drums}
	SetSoundBussParams \{User_Drums = {
			vol = 0.0
		}}
	SoundBussLock \{User_Drums}
	SetSoundBussParams \{User_Guitar = {
			vol = 0.0
		}}
	SoundBussUnlock \{User_Bass}
	SetSoundBussParams \{User_Bass = {
			vol = 0.0
		}}
	SoundBussLock \{User_Bass}
	SetSoundBussParams \{User_RhythmGTR = {
			vol = 0.0
		}}
	SoundBussUnlock \{User_Crowd}
	SetSoundBussParams \{User_Crowd = {
			vol = 0.0
		}}
	SoundBussLock \{User_Crowd}
	SoundBussUnlock \{User_SFX}
	SetSoundBussParams \{User_SFX = {
			vol = 0.0
		}}
	SoundBussLock \{User_SFX}
	SoundBussUnlock \{User_Band}
	SetSoundBussParams \{User_Band = {
			vol = 0.0
		}}
	SoundBussLock \{User_Band}
endscript

script Jam_Mode_Metronome 
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
	GetRandomValue name = index integer a = 0 b = (<array_size> -1)
	if NOT (<index> = $Menu_music_last_song_index)
		if NOT (<index> = $Menu_music_last_last_song_index)
			if NOT (<index> = $Menu_music_last_last_last_song_index)
				if NOT (<index> = $Menu_music_last_last_last_last_song_index)
					Change \{Menu_music_last_last_last_last_song_index = $Menu_music_last_song_index}
					Change \{Menu_music_last_last_last_song_index = $Menu_music_last_song_index}
					Change \{Menu_music_last_last_song_index = $Menu_music_last_song_index}
					Change Menu_music_last_song_index = <index>
					break
				endif
			endif
		endif
	endif
	repeat
	stream = ($menu_music_songs [<index>].stream)
	array = ($menu_music_songs [<index>].array)
	delay = ($menu_music_songs [<index>].delay)
	offset = ($menu_music_songs [<index>].offset)
	vol = ($menu_music_songs [<index>].vol)
	waittime = ($menu_music_songs [<index>].waittime)
	spawnscriptnow Menu_Music_SE_spawned params = {stream = <stream> array = <array> delay = <delay> vol = <vol> offset = <offset> waittime = <waittime>}
endscript

script Menu_Music_SE_spawned \{vol = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Change \{menu_music_preloading = 1}
	Change menu_music_stream = <stream>
	PreLoadStream <stream>
	begin
	if PreLoadStreamDone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
	StartPreLoadedStream <unique_id> buss = Music_FrontEnd forcesafepreload = 1 vol = (<vol> + 2.5)
	spawnscriptnow menu_music_play_crowd_surge params = {waittime = <waittime>}
	Change \{menu_music_preloading = 0}
	Change Current_Menu_Song = <stream>
	if GlobalExists name = <array> type = array
		if (<delay> > 0.0)
			wait <delay> seconds
		endif
		GetArraySize $<array>
		index = 0
		GetStartTime
		<starttime> = (<starttime> + <offset>)
		pulse = 1
		begin
		begin
		GetElapsedTime starttime = <starttime>
		if (<elapsedtime> >= $<array> [<index>])
			break
		endif
		wait \{1
			gameframe}
		repeat
		FormatText checksumname = event 'frontend_speaker_pulse%d' d = <pulse>
		broadcastevent type = <event>
		<pulse> = (3 - <pulse>)
		<index> = (<index> + 1)
		repeat <array_size>
	endif
endscript

script menu_music_play_crowd_surge 
	wait <waittime> seconds
	SoundEvent \{event = Surge_From_Main_To_Freeplay}
endscript

script KillMenuMusic 
	killspawnedscript \{name = Menu_Music_SE_spawned}
	killspawnedscript \{name = menu_music_play_crowd_surge}
	Change \{menu_music_preloading = 0}
	StopSound \{AMillionWays_Menu_Music}
	StopSound \{BlackCat_Menu_Music}
	StopSound \{BeautifulSoul_Menu_Music}
	StopSound \{Believe_Menu_Music}
	StopSound \{DirtyLittleSecret_Menu_Music}
	StopSound \{Fascination_Menu_Music}
	StopSound \{HandsDown_Menu_Music}
	StopSound \{LesArtistes_Menu_Music}
	StopSound \{LetsDance_Menu_Music}
	StopSound \{LikeWhoa_Menu_Music}
	StopSound \{Naive_Menu_Music}
	StopSound \{Paralyzer_Menu_Music}
	StopSound \{PicturesOfYou_Menu_Music}
	StopSound \{Rio_Menu_Music}
	StopSound \{SugarWereGoingDown_Menu_Music}
	StopSound \{TakeWhatYouTake_Menu_Music}
	StopSound \{TheAdventure_Menu_Music}
	StopSound \{WhipIt_Menu_Music}
endscript

script Crowd_Anticipation 
	GameMode_GetType
	if NOT ((<type> = freeplay) || (<type> = tutorial) || ($in_sing_a_long = true))
		if ($current_crowd >= 1.3399999)
			if issoundplaying \{$Current_Crowd_Anticipation}
				if ($Crowd_Anticipation_Flag = 0)
					StopSound \{$Current_Crowd_Anticipation
						fade_time = 3
						fade_type = log_slow}
					spawnscriptnow \{Crowd_Anticipation_Flag_Logic}
				endif
			endif
		elseif ($current_crowd >= 1.3)
			if issoundplaying \{$Current_Crowd_Anticipation}
				if ($Crowd_Anticipation_Flag = 0)
					SetSoundParams \{$Current_Crowd_Anticipation
						vol = 3
						pitch = 0.3
						time = 0.5}
				endif
			else
				PlaySound \{$Current_Crowd_Anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panRemoveCenter = true
					Priority = 100
					buss = Crowd_beds
					attack_length = 3
					decay_length = 0
					release_length = 0
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2700001)
			if issoundplaying \{$Current_Crowd_Anticipation}
				if ($Crowd_Anticipation_Flag = 0)
					SetSoundParams \{$Current_Crowd_Anticipation
						vol = 1
						pitch = 0.2
						time = 0.5}
				endif
			else
				PlaySound \{$Current_Crowd_Anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panRemoveCenter = true
					Priority = 100
					buss = Crowd_beds
					attack_length = 3
					decay_length = 0
					release_length = 0
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.25)
			if issoundplaying \{$Current_Crowd_Anticipation}
				if ($Crowd_Anticipation_Flag = 0)
					SetSoundParams \{$Current_Crowd_Anticipation
						vol = -1
						pitch = 0.1
						time = 0.5}
				endif
			else
				PlaySound \{$Current_Crowd_Anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panRemoveCenter = true
					Priority = 100
					buss = Crowd_beds
					attack_length = 3
					decay_length = 0
					release_length = 0
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2)
			if NOT issoundplaying \{$Current_Crowd_Anticipation}
				if ($Crowd_Anticipation_Flag = 0)
					PlaySound \{$Current_Crowd_Anticipation
						vol = -3
						pan1x = 0
						pan1y = 0.59
						panRemoveCenter = true
						Priority = 100
						buss = Crowd_beds
						attack_length = 3
						decay_length = 0
						release_length = 0
						attack_function = log_fast
						num_loops = -1}
				endif
			else
				SetSoundParams \{$Current_Crowd_Anticipation
					vol = -3
					time = 0.5}
			endif
		else
			if issoundplaying \{$Current_Crowd_Anticipation}
				if ($Crowd_Anticipation_Flag = 0)
					StopSound \{$Current_Crowd_Anticipation
						fade_time = 3
						fade_type = log_slow}
					spawnscriptnow \{Crowd_Anticipation_Flag_Logic}
				endif
			endif
		endif
	endif
endscript

script Crowd_Anticipation_Flag_Logic 
	Change \{Crowd_Anticipation_Flag = 1}
	wait \{3
		seconds}
	Change \{Crowd_Anticipation_Flag = 0}
endscript

script OneShotsBetweenSongs 
	begin
	SoundEvent \{event = $Current_Crowd_Whistle_SoundEvent}
	wait (RandomFloat (0.1, 1.2)) seconds
	repeat
endscript

script SurgeBetweenSongs 
	begin
	SoundEvent \{event = $Current_Crowd_OneShot_Positive_SoundEvent}
	wait (RandomFloat (0.3, 1.2)) seconds
	repeat
endscript

script KillSurgingScripts 
	wait \{2
		seconds}
	killspawnedscript \{name = OneShotsBetweenSongs}
	killspawnedscript \{name = SurgeBetweenSongs}
endscript

script Surge_After_Explosion 
	wait \{2
		seconds}
	SoundEvent \{event = $Current_Crowd_Swell_Med_SoundEvent}
endscript

script Cheer_Before_Explosion 
	wait \{1
		second}
	SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent}
endscript

script colorwheel_increment_up_down 
	printstruct <...>
	if GotParam \{current_ring}
		switch <current_ring>
			case 1
			SoundEvent \{event = ColorWheel_HighLight_1}
			case 2
			SoundEvent \{event = ColorWheel_HighLight_2}
			case 3
			SoundEvent \{event = ColorWheel_HighLight_3}
			case 4
			SoundEvent \{event = ColorWheel_HighLight_4}
			case 5
			SoundEvent \{event = ColorWheel_HighLight_5}
		endswitch
	endif
endscript

script Loading_Screen_Crowd_Swell 
endscript

script KillSurgingScripts_Faster 
	killspawnedscript \{name = OneShotsBetweenSongs}
	killspawnedscript \{name = SurgeBetweenSongs}
endscript

script Crowd_Loading_Whistle 
endscript

script MetalFest_Intro 
	wait \{1
		second}
	SoundEvent \{event = $Current_Crowd_Swell_Med_SoundEvent}
	wait \{1
		second}
	SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent}
	wait \{1
		second}
	SoundEvent \{event = $Current_Crowd_Swell_Long_SoundEvent}
	wait \{1
		second}
	KillSurgingScripts
endscript

script GHTunes_UI_Scroll_Pan 
	sfx_pan = (<sfx_pan> * 0.1)
	PlaySound GHTunes_Menu_Scroll vol = -2 pitch = 4 pan1x = <sfx_pan> pan1y = 1.0
endscript

script NullSound 
endscript

script GHMix_scroll 
	if GotParam \{adv_record}
		SoundEvent \{event = GHTunes_UI_Scroll}
	else
		if GotParam \{up}
			generic_menu_up_or_down_sound \{up}
		else
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script GHTunes_Scroll 
	SoundEvent \{event = GHTunes_UI_Scroll}
endscript

script play_win_lose_anim_sound \{skip = 0}
	Obj_GetID
	i = 1
	if NOT ($dont_play_win_amim_sfx = 1)
		begin
		if PlayerInfoEquals <i> band_member = <objID>
			GetPlayerInfo <i> part
			skip = 1
			break
		endif
		i = (<i> + 1)
		repeat 5
		if NOT (<skip> = 1)
			switch <objID>
				case Guitarist
				part = guitar
				case Bassist
				part = bass
				case Vocalist
				part = vocals
				case Drummer
				part = Drum
				default
				part = guitar
			endswitch
		endif
		GMan_SongTool_GetCurrentSong
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
				case Drummer_sticks_throw
				SoundEvent \{event = Drummer_sticks_throw}
				case Large_Smash
				if GotParam \{part}
					switch <part>
						case bass
						SoundEvent \{event = large_Bass_smash}
						case guitar
						SoundEvent \{event = large_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case Medium_Smash
				if GotParam \{part}
					switch <part>
						case bass
						SoundEvent \{event = medium_Bass_smash}
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
						SoundEvent \{event = small_Bass_smash}
						case guitar
						SoundEvent \{event = small_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case Drummer_Tom_Hit
				SoundEvent \{event = Drummer_Tom_Hit}
				case Drummer_Snare_Hit
				SoundEvent \{event = Drummer_Snare_Hit}
				default
				printf \{channel = sfx
					qs(0xc0f17fb8)}
			endswitch
		endif
	endif
endscript

script Counter_Play_Beep_Spawn 
	count_x = 0.91999996
	count_y = 0
	count_z = 1
	count_a = 0.91999996
	if (<time> > 10)
		begin
		SoundEvent \{event = Gameplay_Vote_Countdown}
		wait \{1
			seconds}
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
	SoundEvent \{event = Gameplay_Vote_Countdown}
	wait (0.07 + <count_x>) seconds
	count_x = (<count_x> * 0.85)
	repeat
endscript

script Counter_Play_Beep \{time = 10}
	spawnscriptnow Counter_Play_Beep_Spawn params = {time = <time>}
	wait <time> seconds
	killspawnedscript \{name = Counter_Play_Beep_Spawn}
endscript

script Trivia_Play_Music_Streams_Setup 
endscript

script Trivia_Play_Music_Streams_Fade_In \{time = 0.5}
endscript

script Trivia_Play_Music_Streams_Fade_Out \{time = 0.5}
endscript

script Trivia_Play_Music_Streams_Reset_Volumes 
endscript

script No_Dolby_Digital_Sounds 
	if IsSoundEventPlaying \{dolby_off}
		StopSoundEvent \{dolby_off
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{Menu_DolbyDigitalEnable_Surround_C}
		StopSound \{Menu_DolbyDigitalEnable_Surround_C
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{Menu_DolbyDigitalEnable_Surround_R}
		StopSound \{Menu_DolbyDigitalEnable_Surround_R
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{Menu_DolbyDigitalEnable_Surround_Ls}
		StopSound \{Menu_DolbyDigitalEnable_Surround_Ls
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{Menu_DolbyDigitalEnable_Surround_Rs}
		StopSound \{Menu_DolbyDigitalEnable_Surround_Rs
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{Menu_DolbyDigitalEnable_Surround_Lf}
		StopSound \{Menu_DolbyDigitalEnable_Surround_Lf
			fade_time = 0.2
			fade_type = linear}
	endif
	if issoundplaying \{Menu_DolbyDigitalEnable_Surround_L}
		StopSound \{Menu_DolbyDigitalEnable_Surround_L
			fade_time = 0.2
			fade_type = linear}
	endif
endscript

script Vocal_Sidechain 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf channel = sfx qs(0xc4a9a039) s = <player>
	Change \{STOP_VOCAL_SIDECHAIN = 0}
	GLOBAL_RMS_VALUE = 0
	begin
	if ($STOP_VOCAL_SIDECHAIN = 1)
		break
	endif
	if NOT ScriptIsRunning \{fretbar_update_tempo}
		break
	endif
	Vocals_GetCurAmplitude player = <player>
	if GotParam \{current_amplitude}
		Change GLOBAL_RMS_VALUE = (($GLOBAL_RMS_VALUE + <current_amplitude>) / 2)
		if ($GLOBAL_RMS_VALUE < 0.5)
			SetSoundBussParams {Vocals_Balance = {vol = ($default_BussSet.Vocals_Balance.vol)} time = 0.1}
		elseif ($GLOBAL_RMS_VALUE < 1.0)
			SetSoundBussParams \{Vocals_Balance = {
					vol = 0
				}
				time = 0.1}
		elseif ($GLOBAL_RMS_VALUE < 1.3)
			setvol = ($sidechainingvolumepercentadjustment * -2.5)
			SetSoundBussParams {Vocals_Balance = {vol = <setvol>} time = 0.1}
		elseif ($GLOBAL_RMS_VALUE < 1.5)
			setvol = ($sidechainingvolumepercentadjustment * -3.75)
			SetSoundBussParams {Vocals_Balance = {vol = <setvol>} time = 0.1}
		else
			setvol = ($sidechainingvolumepercentadjustment * -5.0)
			SetSoundBussParams {Vocals_Balance = {vol = <setvol>} time = 0.1}
		endif
	endif
	wait \{3
		gameframe}
	repeat
endscript

script Vocal_Sidechain_Logic 
	printf channel = sfx qs(0xc4a9a039) s = <player>
	printf channel = sfx qs(0x7013df09) s = <muting>
	if (<muting> = false)
		Change \{STOP_VOCAL_SIDECHAIN = 0}
		GetNumPlayersInGame \{on_screen}
		num_vocals = 0
		if (<num_players_shown> > 1)
			GetPlayerInfo \{1
				part}
			if (<part> = vocals)
				num_vocals = (<num_vocals> + 1)
			endif
			GetPlayerInfo \{2
				part}
			if (<part> = vocals)
				num_vocals = (<num_vocals> + 1)
			endif
			GetPlayerInfo \{3
				part}
			if (<part> = vocals)
				num_vocals = (<num_vocals> + 1)
			endif
			GetPlayerInfo \{4
				part}
			if (<part> = vocals)
				num_vocals = (<num_vocals> + 1)
			endif
			if (<num_vocals> > 1)
				printf \{channel = sfx
					qs(0x66ea4639)}
				if ScriptIsRunning \{Vocal_Sidechain}
					killspawnedscript \{name = Vocal_Sidechain}
				endif
			else
				printf \{channel = sfx
					qs(0x5dfd0eb3)}
				spawnscriptnow Vocal_Sidechain params = {player = <player>}
			endif
		else
			printf \{channel = sfx
				qs(0x0b018b40)}
			spawnscriptnow Vocal_Sidechain params = {player = <player>}
		endif
	else
		Change \{STOP_VOCAL_SIDECHAIN = 1}
	endif
endscript

script VenueTypeDecision \{time = 1}
	printf channel = sfx qs(0x7a6fe640) s = <time>
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		VenueSize = 'nothing'
	endif
	printf channel = sfx qs(0x23e3eeff) s = <VenueSize>
	if NOT (<pakname> = 'z_mall')
		switch <VenueSize>
			case 'Large_EXT'
			setsoundbusseffects effects = [{name = venueverb $Large_EXT_Reverb}] time = <time>
			case 'Large_INT'
			setsoundbusseffects effects = [{name = venueverb $Large_INT_Reverb}] time = <time>
			case 'Medium_INT'
			setsoundbusseffects effects = [{name = venueverb $Medium_INT_Reverb}] time = <time>
			case 'Medium_EXT'
			setsoundbusseffects effects = [{name = venueverb $Medium_EXT_Reverb}] time = <time>
			case 'Small_INT'
			setsoundbusseffects effects = [{name = venueverb $Small_INT_Reverb}] time = <time>
			case 'Small_EXT'
			setsoundbusseffects effects = [{name = venueverb $Small_EXT_Reverb}] time = <time>
			default
			printf \{channel = sfx
				qs(0xf9889ab0)}
			setsoundbusseffects effects = [{name = venueverb $Medium_INT_Reverb}] time = <time>
		endswitch
	else
		setsoundbusseffects effects = [{name = venueverb $Large_INT_Reverb}] time = <time>
	endif
endscript

script Outro_Stars 
	stream = None
	vol = 0
	wait_time = 0
	switch <num_stars>
		case 1
		stream = Outro_One_Star
		vol = -3.5
		wait_time = 0
		case 2
		stream = Outro_Two_Stars
		vol = -3.5
		wait_time = 0.1
		case 3
		stream = Outro_Three_Stars
		vol = -3.5
		wait_time = 0.03
		case 4
		stream = Outro_Four_Stars
		vol = -3.5
		wait_time = 0.08
		case 5
		stream = Outro_Five_Stars
		vol = -3.5
		wait_time = 0.08
		case 6
		stream = Outro_Six_Stars
		vol = -2.5
		wait_time = 0.15
		default
		stream = Outro_One_Star
		vol = -3.5
	endswitch
	PreLoadStream <stream>
	begin
	if PreLoadStreamDone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
	spawnscriptnow Spawning_Outro_Stars params = {<...>}
endscript

script Spawning_Outro_Stars 
	wait <wait_time> seconds
	printf channel = sfx qs(0x9231b06a) s = <vol>
	StartPreLoadedStream <unique_id> buss = front_end forcesafepreload = 1 vol = <vol>
endscript

script Kill_Outro_Stars 
	killspawnedscript \{name = Spawning_Outro_Stars}
	StopSound \{Outro_One_Star}
	StopSound \{Outro_Two_Stars}
	StopSound \{Outro_Three_Stars}
	StopSound \{Outro_Four_Stars}
	StopSound \{Outro_Five_Stars}
	StopSound \{Outro_Six_Stars}
endscript

script Kill_Only_OneShots 
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot}
endscript

script PlayAudioSequenceForLoadingBink 
	SetScriptCannotPause
endscript

script StopAudioSequenceForLoadingBink 
	StopSound \{LoadScreen_Music
		fade_time = 1.0
		fade_type = linear}
	StopSound \{LoadScreen_Star_Explode
		fade_time = 1.0
		fade_type = linear}
	StopSound \{LoadScreen_Electrical_Loop_Long
		fade_time = 1.0
		fade_type = linear}
endscript

script PlayCameraWinSFX 
	SoundEvent \{event = End_Of_Song_Camera_Movement_Sound}
	SoundEvent \{event = EndOfSong_Camera_Cheer}
endscript

script Crowd_Swells_During_Stats_Screen 
	begin
	wait RandomFloat (30.0, 50.0) seconds
	printf \{channel = sfx
		qs(0xd1248a93)}
	GetPakManCurrent \{map = zones}
	if NOT (<pak> = Z_Space)
		SoundEvent \{event = Surge_During_Stats_Screen}
	endif
	repeat
endscript

script KillMenuMusicSlowly 
	killspawnedscript \{name = menu_music_on}
	killspawnedscript \{name = Menu_Music_On_Spawned}
	Change \{Menu_Music_On_Flag = 0}
	StopSoundEvent \{Menu_Music_SE}
	killspawnedscript \{name = Menu_Music_SE_spawned}
	Change \{menu_music_preloading = 0}
	StopSound \{$menu_music_stream
		fade_time = 2.4
		fade_type = linear}
endscript

script GetVolumeTweakOfPreloadedStream \{streamname = Default}
	printf channel = sfx qs(0xaa2bf61d) t = <streamname>
	switch <streamname>
		case z_awardshow_intro
		volumetweak = 0.0
		case z_cabo_intro
		volumetweak = 0.0
		case z_centralpark_intro
		volumetweak = -3.0
		case z_easterisland_intro
		volumetweak = 0.0
		case z_gorge_intro
		volumetweak = -4.0
		case z_mall_intro
		volumetweak = 0.0
		case z_montreux_intro
		volumetweak = -2.0
		case z_paris_intro
		volumetweak = 0.0
		case z_space_intro
		volumetweak = 0.0
		case z_tokyo_intro
		volumetweak = 0.0
		case z_awardshow_encore
		volumetweak = 1.0
		case z_cabo_encore
		volumetweak = 0.0
		case z_centralpark_encore
		volumetweak = -2.0
		case z_easterisland_encore
		volumetweak = 0.0
		case z_gorge_encore
		volumetweak = 0.0
		case z_mall_encore
		volumetweak = 2.5
		case z_montreux_encore
		volumetweak = 1.0
		case z_paris_encore
		volumetweak = -4.0
		case z_space_encore
		volumetweak = 0.0
		case z_tokyo_encore
		volumetweak = 0.0
		case z_awardshow_celebintro
		volumetweak = -3.0
		case z_tokyo_celebintro
		volumetweak = -3.0
		case z_centralpark_celebintro
		volumetweak = -1.0
		case z_gorge_celebintro
		volumetweak = 0.0
		case z_paris_celebintro
		volumetweak = -2.0
		default
		volumetweak = 0
	endswitch
	printf channel = sfx qs(0x40a231ed) s = <volumetweak>
	return volumetweak = <volumetweak>
endscript

script You_Rock_Script 
	SoundEvent \{event = You_Rock_Front}
	SoundEvent \{event = You_Rock_Back}
	wait \{2
		seconds}
	SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent}
	SoundEvent \{event = $Current_Crowd_Swell_Med_SoundEvent}
	SoundEvent \{event = $Current_Crowd_Applause_SoundEvent}
endscript

script Fail_Song_Crowd_Logic 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
		fadeintime = 10
		fadeintype = linear
		fadeouttime = 10
		fadeouttype = linear}
	spawnscriptnow \{Neutral_Crowd_Wait_To_Lower_Stats}
	printf \{channel = sfx
		qs(0x85e2e392)}
	spawnscriptnow \{Crowd_Swells_During_Stats_Screen}
endscript

script Game_Start_Crowd_Cheer 
	if ($Not_Start_Of_Game = 0)
		wait \{8
			seconds}
		SetSoundBussParams {Crowd = {vol = (($default_BussSet.Crowd.vol) -10) pitch = 0.0} time = 20}
		wait \{2.5
			second}
		SoundEvent \{event = Beginning_Crowd_Swell}
		Change \{Not_Start_Of_Game = 1}
	endif
endscript

script Going_Into_Freeplay_From_Main_Menu 
	wait \{1
		seconds}
	SoundEvent \{event = Surge_From_Main_To_Freeplay}
endscript

script Intro_Crowds 
	printf \{channel = sfx
		qs(0x6020d865)}
	GameMode_GetType
	GetPakManCurrent \{map = zones}
	if (<pak> = Z_Space)
		SoundEvent \{event = Space_Intro_FT}
		SoundEvent \{event = Space_Intro_BK}
	endif
	if NOT (<type> = tutorial || <type> = freeplay || $calibrate_lag_enabled = 1)
		SoundEvent \{event = $Current_Crowd_Applause_SoundEvent}
		SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent}
	endif
endscript

script Intro_Crowds_Fast 
	printf \{channel = sfx
		qs(0x89152bc9)}
	GameMode_GetType
	GetPakManCurrent \{map = zones}
	if (<pak> = Z_Space)
		SoundEvent \{event = Space_Intro_FT}
		SoundEvent \{event = Space_Intro_BK}
	endif
	if NOT (<type> = tutorial || <type> = freeplay || $calibrate_lag_enabled = 1)
		SoundEvent \{event = $Current_Crowd_Applause_SoundEvent}
		SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent}
	endif
endscript

script PracticeDrums_FadeIn 
	SetSoundBussParams {PracticeMode_Drums = {vol = (($default_BussSet.PracticeMode_Drums.vol) - 100)}}
	wait \{3.5
		seconds}
	SetSoundBussParams {PracticeMode_Drums = {vol = (($default_BussSet.PracticeMode_Drums.vol))} time = 3.5}
endscript

script PracticeDrums_FadeOut 
	SetSoundBussParams {PracticeMode_Drums = {vol = (($default_BussSet.PracticeMode_Drums.vol) - 100)} time = 2.0}
endscript

script Neutral_Crowd_Wait_To_Lower_Stats 
	SetSoundBussParams {Crowd = {vol = (($default_BussSet.Crowd.vol) -20) pitch = 0.0} time = 7}
endscript

script Stop_All_Paused_Sounds 
	StopSound \{silence_front_end_crowd_loop_ft}
	StopSound \{SM_INT_Crowd_Anticipation_Loop}
	StopSound \{SM_INT_Crowd_Negative_Loop_BK}
	StopSound \{SM_INT_Crowd_Negative_Loop_FT}
	StopSound \{SM_INT_Crowd_Neutral_Loop_BK}
	StopSound \{SM_INT_Crowd_Neutral_Loop_FT}
	StopSound \{SM_INT_Crowd_Positive_Loop_BK}
	StopSound \{SM_INT_Crowd_Positive_Loop_FT}
	StopSound \{SM_INT_Crowd_Applause}
	StopSound \{SM_INT_Crowd_Swell_LG}
	StopSound \{SM_INT_Crowd_Swell_MD}
	StopSound \{SM_INT_Crowd_Swell_SH}
	StopSound \{SM_Crowd_Negative_To_Neutral}
	StopSound \{SM_Crowd_Neutral_To_Negative}
	StopSound \{SM_Crowd_Neutral_To_Positive}
	StopSound \{SM_Crowd_Positive_To_Neutral}
	StopSound \{SM_EXT_Crowd_Anticipation_Loop}
	StopSound \{SM_EXT_Crowd_Negative_Loop_BK}
	StopSound \{SM_EXT_Crowd_Negative_Loop_FT}
	StopSound \{SM_EXT_Crowd_Neutral_Loop_BK}
	StopSound \{SM_EXT_Crowd_Neutral_Loop_FT}
	StopSound \{SM_EXT_Crowd_Positive_Loop_BK}
	StopSound \{SM_EXT_Crowd_Positive_Loop_FT}
	StopSound \{SM_EXT_Crowd_Applause}
	StopSound \{SM_EXT_Crowd_Swell_LG}
	StopSound \{SM_EXT_Crowd_Swell_MD}
	StopSound \{SM_EXT_Crowd_Swell_SH}
	StopSound \{MD_INT_Crowd_Anticipation_Loop}
	StopSound \{MD_INT_Crowd_Negative_Loop_BK}
	StopSound \{MD_INT_Crowd_Negative_Loop_FT}
	StopSound \{MD_INT_Crowd_Neutral_Loop_BK}
	StopSound \{MD_INT_Crowd_Neutral_Loop_FT}
	StopSound \{MD_INT_Crowd_Positive_Loop_BK}
	StopSound \{MD_INT_Crowd_Positive_Loop_FT}
	StopSound \{INT_MD_Crowd_Applause}
	StopSound \{INT_MD_Crowd_Swell_LG}
	StopSound \{INT_MD_Crowd_Swell_MD}
	StopSound \{INT_MD_Crowd_Swell_SH}
	StopSound \{MD_INT_Crowd_Applause}
	StopSound \{MD_INT_Crowd_Swell_LG}
	StopSound \{MD_INT_Crowd_Swell_MD}
	StopSound \{MD_INT_Crowd_Swell_SH}
	StopSound \{MD_Crowd_Negative_To_Neutral}
	StopSound \{MD_Crowd_Neutral_To_Negative}
	StopSound \{MD_Crowd_Neutral_To_Positive}
	StopSound \{MD_Crowd_Positive_To_Neutral}
	StopSound \{EXT_MD_Crowd_Anticipation_Loop}
	StopSound \{EXT_MD_Crowd_Bad_Loop_BK}
	StopSound \{EXT_MD_Crowd_Bad_Loop_FT}
	StopSound \{EXT_MD_Crowd_Good_Loop_BK}
	StopSound \{EXT_MD_Crowd_Good_Loop_FT}
	StopSound \{EXT_MD_Crowd_Neutral_Loop_BK}
	StopSound \{EXT_MD_Crowd_Neutral_Loop_FT}
	StopSound \{MD_EXT_Crowd_Anticipation_Loop}
	StopSound \{MD_EXT_Crowd_Negative_Loop_BK}
	StopSound \{MD_EXT_Crowd_Negative_Loop_FT}
	StopSound \{MD_EXT_Crowd_Neutral_Loop_BK}
	StopSound \{MD_EXT_Crowd_Neutral_Loop_FT}
	StopSound \{MD_EXT_Crowd_Positive_Loop_BK}
	StopSound \{MD_EXT_Crowd_Positive_Loop_FT}
	StopSound \{MD_EXT_Crowd_Applause}
	StopSound \{MD_EXT_Crowd_Swell_LG}
	StopSound \{MD_EXT_Crowd_Swell_MD}
	StopSound \{MD_EXT_Crowd_Swell_SH}
	StopSound \{MD_INT_Crowd_Song_Transition}
	StopSound \{LG_INT_Crowd_Anticipation_Loop}
	StopSound \{LG_INT_Crowd_Negative_Loop_BK}
	StopSound \{LG_INT_Crowd_Negative_Loop_FT}
	StopSound \{LG_INT_Crowd_Neutral_Loop_BK}
	StopSound \{LG_INT_Crowd_Neutral_Loop_FT}
	StopSound \{LG_INT_Crowd_Positive_Loop_BK}
	StopSound \{LG_INT_Crowd_Positive_Loop_FT}
	StopSound \{LG_INT_Crowd_Applause}
	StopSound \{LG_INT_Crowd_Swell_LG}
	StopSound \{LG_INT_Crowd_Swell_MD}
	StopSound \{LG_INT_Crowd_Swell_SH}
	StopSound \{LG_Crowd_Negative_To_Neutral}
	StopSound \{LG_Crowd_Neutral_To_Negative}
	StopSound \{LG_Crowd_Neutral_To_Positive}
	StopSound \{LG_Crowd_Positive_To_Neutral}
	StopSound \{LG_EXT_Crowd_Anticipation_Loop}
	StopSound \{LG_EXT_Crowd_Negative_Loop_BK}
	StopSound \{LG_EXT_Crowd_Negative_Loop_FT}
	StopSound \{LG_EXT_Crowd_Neutral_Loop_BK}
	StopSound \{LG_EXT_Crowd_Neutral_Loop_FT}
	StopSound \{LG_EXT_Crowd_Positive_Loop_BK}
	StopSound \{LG_EXT_Crowd_Positive_Loop_FT}
	StopSound \{Tool_Crowd_Loop_FT}
	StopSound \{LG_EXT_Crowd_Applause}
	StopSound \{LG_EXT_Crowd_Song_Transition}
	StopSound \{LG_EXT_Crowd_Swell_LG}
	StopSound \{LG_EXT_Crowd_Swell_MD}
	StopSound \{LG_EXT_Crowd_Swell_SH}
	StopSoundEvent \{LG_EXT_Crowd_OneShot_Positive}
	StopSoundEvent \{LG_INT_Crowd_OneShot_Positive}
	StopSoundEvent \{MD_EXT_Crowd_OneShot_Positive}
	StopSoundEvent \{MD_EXT_Crowd_OneShot_Positive_01}
	StopSoundEvent \{MD_INT_Crowd_OneShot_Positive}
	StopSoundEvent \{SM_EXT_Crowd_OneShot_Positive}
	StopSoundEvent \{SM_INT_Crowd_OneShot_Positive}
	StopSoundEvent \{LG_EXT_Crowd_OneShot_Negative}
	StopSoundEvent \{LG_INT_Crowd_OneShot_Negative}
	StopSoundEvent \{MD_EXT_Crowd_OneShot_Negative}
	StopSoundEvent \{MD_INT_Crowd_OneShot_Negative}
	StopSoundEvent \{SM_EXT_Crowd_OneShot_Negative}
	StopSoundEvent \{SM_INT_Crowd_OneShot_Negative}
endscript

script Star_Power_Delay_Logic 
	SetSoundBussParams {UI_Star_Power_Delay = {vol = (($default_BussSet.UI_Star_Power_Delay.vol)) pitch = 0.0} time = 0.1}
	Change \{Star_Power_Delay = 1}
	wait \{0.1
		seconds}
	SetSoundBussParams {UI_Star_Power_Delay = {vol = (($default_BussSet.UI_Star_Power_Delay.vol) -30)} time = 3}
endscript

script Star_Clapping_Fade_In 
	killspawnedscript \{name = Clap_Fading}
	killspawnedscript \{name = Clap_Fade_Kill}
	SetSoundBussParams {Crowd_Star_Power = {vol = (($default_BussSet.Crowd_Star_Power.vol) -50) pitch = 0.0} time = 0.1}
	wait \{0.1
		seconds}
	SetSoundBussParams {Crowd_Star_Power = {vol = (($default_BussSet.Crowd_Star_Power.vol)) pitch = 0.0} time = 1}
endscript

script Setting_Crowd_Loop_Beginning_Of_Song 
	GameMode_GetType
	if NOT (<type> = freeplay)
		if (($current_crowd < 1.3333) && ($current_crowd > 0.64000005))
			crowd_looping_state = neutral
		endif
	else
		crowd_looping_state = good
	endif
	if (<type> = competitive)
		crowd_looping_state = good
	endif
	do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
endscript

script After_Loading_Screen_Crowd_Setting 
	GameMode_GetType
	if NOT (<type> = freeplay)
		if NOT (<type> = competitive)
			if ($calibrate_lag_enabled = 0)
				if NOT ($game_mode = practice)
					if (($current_crowd < 1.3333))
						Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
							fadeintime = 2.0
							fadeintype = linear
							fadeouttime = 2
							fadeouttype = linear}
					else
						Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
							fadeintime = 2.0
							fadeintype = linear
							fadeouttime = 2
							fadeouttype = linear}
					endif
				else
					BG_Crowd_Front_End_Silence
				endif
			else
				BG_Crowd_Front_End_Silence
			endif
		else
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 2
				fadeouttype = linear}
		endif
	else
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
			fadeintime = 2.0
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear}
	endif
endscript

script After_Loading_Screen_Kill_Global 
	Change \{IN_LOADING_SCREEN = 0}
	wait \{2
		gameframes}
	GameMode_GetType
	if NOT (<type> = freeplay)
		if NOT (<type> = competitive)
			if ($calibrate_lag_enabled = 0)
				if NOT ($game_mode = practice)
					if (($current_crowd < 1.3333))
						Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
							fadeintime = 2.0
							fadeintype = linear
							fadeouttime = 2
							fadeouttype = linear}
					else
						Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
							fadeintime = 2.0
							fadeintype = linear
							fadeouttime = 2
							fadeouttype = linear}
					endif
				else
					BG_Crowd_Front_End_Silence
				endif
			else
				BG_Crowd_Front_End_Silence
			endif
		else
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 2
				fadeouttype = linear}
		endif
	else
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good
			fadeintime = 2.0
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear}
	endif
endscript

script Play_Crowd_For_Hyperspace_Only 
	GetPakManCurrentName \{map = zones}
	if (<pakname> = 'z_cube')
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
			fadeintime = 2.0
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear}
		GameMode_GetType
		if NOT (<type> = tutorial || <type> = freeplay || $calibrate_lag_enabled = 1)
			SoundEvent \{event = $Current_Crowd_Applause_SoundEvent}
			SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent}
		endif
	endif
endscript
