
script audio_effects_create_settings_by_venue 
	if getpakmancurrentname \{map = zones}
		formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	endif
	if scriptexists <scriptgetvenuesize>
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
		case large_ext
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $large_ext_reverb}]
		case large_int
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $large_int_reverb}]
		case medium_int
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $medium_int_reverb}]
		case medium_ext
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $medium_ext_reverb}]
		case small_int
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $small_int_reverb}]
		case small_ext
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $small_ext_reverb}]
		default
		printf \{channel = sfx
			qs(0x79963774)}
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $medium_int_reverb}]
	endswitch
	setdspeffectparams \{effects = [
			{
				effect = sfxreverb
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

script audio_master_sfx_adding_sound_busses 
	createbusssystem \{$busstree}
	setsoundbussparams \{$default_bussset}
	setsoundbussparams \{$default_bussset
		time = 0.5}
	soundbusslock \{master}
	soundbusslock \{user_vocals}
	soundbusslock \{user_drums}
	soundbusslock \{user_guitar}
	soundbusslock \{user_bass}
	soundbusslock \{user_rhythmgtr}
	soundbusslock \{user_crowd}
	soundbusslock \{user_sfx}
	soundbusslock \{user_band}
	soundbusslock \{user_crowdsingalong}
	soundbusslock \{user_misc}
endscript

script audio_print_push_pop_debug_info 
	if NOT gotparam \{push}
		if NOT gotparam \{pop}
			printf \{qs(0xf0680b89)}
			return
		endif
	endif
	if gotparam \{push}
		pushpop = qs(0x1acc2a0c)
	else
		pushpop = qs(0x8637b58f)
	endif
	if NOT gotparam \{name}
		printf \{qs(0xd2bb34b1)}
		return
	endif
	printf qs(0x3c00af92) a = <name> b = <pushpop>
endscript

script audio_effects_generic_reverb_functionality \{newechosettings = $echo_dry
		echofadetime = 0.5
		newreverbsettings = $reverb_dry
		reverbfadetime = 0.5}
	if inside
		if gotparam \{newechosettings}
			if gotparam \{echofadetime}
				setsoundbusseffects effects = [{<newechosettings> name = crowd_w_reverb_buss_echo}] time = <echofadetime>
			else
				setsoundbusseffects effects = [{<newechosettings> name = crowd_w_reverb_buss_echo}]
			endif
		endif
		if gotparam \{newreverbsettings}
			if gotparam \{reverbfadetime}
				setsoundbusseffects effects = [{<newreverbsettings> name = crowd_w_reverb_buss_reverb}] time = <reverbfadetime>
			else
				setsoundbusseffects effects = [{<newreverbsettings> name = crowd_w_reverb_buss_reverb}]
			endif
		endif
	else
		if gotparam \{destroyed}
		else
			if gotparam \{created}
			else
				if gotparam \{exitechosettings}
					if gotparam \{exitechofadetime}
						setsoundbusseffects effects = [{<exitechosettings> name = crowd_w_reverb_buss_echo}] time = <exitechofadetime>
					else
						setsoundbusseffects effects = [{<exitechosettings> name = crowd_w_reverb_buss_echo}]
					endif
				endif
				if gotparam \{exitreverbsettings}
					if gotparam \{exitreverbfadetime}
						setsoundbusseffects effects = [{<exitreverbsettings> name = crowd_w_reverb_buss_reverb}] time = <exitreverbfadetime>
					else
						setsoundbusseffects effects = [{<exitreverbsettings> name = crowd_w_reverb_buss_reverb}]
					endif
				endif
			endif
		endif
	endif
endscript

script audio_play_career_power_up_sfx \{character = qs(0x41113d82)
		lvl = 1}
	printf channel = sfx qs(0x73307931) s = <character>
	if ((<character> = qs(0x6545783e)) || (<character> = qs(0x5d2b4ed3)))
		if (<lvl> = 1)
			wait \{0.55
				seconds}
			soundevent \{event = audio_powers_generic_power_up_lvl1}
		else
			wait \{0.25
				seconds}
			soundevent \{event = audio_powers_generic_power_up_lvl2}
		endif
	else
		if (<lvl> = 1)
			wait \{0.75
				seconds}
			soundevent \{event = audio_powers_generic_power_up_lvl1}
		else
			wait \{0.45000002
				seconds}
			soundevent \{event = audio_powers_generic_power_up_lvl2}
		endif
	endif
endscript

script audio_play_character_powers_sfx \{character = qs(0x41113d82)
		power = null
		lvl = 0}
	gamemode_gettype
	getpakmancurrentname \{map = zones}
	if (<type> = career)
		if (<pakname> = 'z_modular')
			if (<power> = lightningboltright)
				soundevent \{event = audio_powers_generic_electricity_bolt_right_softer}
			elseif (<power> = lightningboltleft)
				soundevent \{event = audio_powers_generic_electricity_bolt_left_softer}
			elseif (<power> = lightningbolt)
				soundevent \{event = audio_powers_generic_electricity_bolt_softer}
			endif
			if (<character> = qs(0x6a66ae57))
				if (<lvl> = 1)
					soundevent \{event = audio_powers_johnny_power_lvl_1_softer}
				else (<lvl> = 2)
					soundevent \{event = audio_powers_johnny_power_lvl_2_softer}
				endif
			elseif (<character> = qs(0x5d2b4ed3))
				soundevent \{event = audio_powers_axel_power_lvl_1_softer}
			elseif (<character> = qs(0x33d6c02a))
				if (<lvl> = 1)
					soundevent \{event = audio_powers_judy_power_lvl_1_softer}
				else (<lvl> = 2)
					soundevent \{event = audio_powers_judy_power_lvl_2_softer}
				endif
				tutorial_system_get_language_prefix
				formattext checksumname = success1stsong '%l_FB_Success_1st_Song' l = <language_prefix>
				formattext checksumname = success2ndsong '%l_FB_Success_2nd_Song' l = <language_prefix>
				formattext checksumname = fbintro '%l_Ampzilla_FB_Intro' l = <language_prefix>
				if NOT ((issoundplaying rush_01) || (issoundplaying rush_02) || (issoundplaying rush_03) || (issoundplaying rush_04) || (issoundplaying rush_05) || (issoundplaying rush_06) || (issoundplaying <success1stsong>) || (issoundplaying <success2ndsong>) || (issoundplaying <fbintro>))
					soundevent \{event = endofsong_camera_cheer_quiet}
				else
					printf \{channel = sfx
						qs(0x985501da)}
				endif
			elseif (<character> = qs(0xe26369e9))
				if (<lvl> = 1)
					soundevent \{event = audio_powers_lars_power_lvl_1_softer}
				else (<lvl> = 2)
					soundevent \{event = audio_powers_lars_power_lvl_2_softer}
				endif
			elseif (<character> = qs(0x6545783e))
				if issoundplaying \{star_deployed_front}
					setsoundparams \{star_deployed_front
						vol = -15.5}
					if (<lvl> = 1)
						soundevent \{event = audio_powers_pandora_power_lvl_1}
						setsoundparams \{powers_pandora_power_lvl_1
							vol = -9}
					else (<lvl> = 2)
						soundevent \{event = audio_powers_pandora_power_lvl_2}
						setsoundparams \{powers_pandora_power_lvl_2
							vol = -6}
					endif
				else
					if (<lvl> = 1)
						soundevent \{event = audio_powers_pandora_power_lvl_1_softer}
					else (<lvl> = 2)
						soundevent \{event = audio_powers_pandora_power_lvl_2_softer}
					endif
				endif
			endif
			return
		endif
	endif
	if (<power> = lightningboltright)
		soundevent \{event = audio_powers_generic_electricity_bolt_right}
	elseif (<power> = lightningboltleft)
		soundevent \{event = audio_powers_generic_electricity_bolt_left}
	elseif (<power> = lightningbolt)
		soundevent \{event = audio_powers_generic_electricity_bolt}
	endif
	if (<character> = qs(0x6a66ae57))
		if (<lvl> = 1)
			soundevent \{event = audio_powers_johnny_power_lvl_1}
		else (<lvl> = 2)
			soundevent \{event = audio_powers_johnny_power_lvl_2}
		endif
	elseif (<character> = qs(0x5d2b4ed3))
		soundevent \{event = audio_powers_axel_power_lvl_1}
	elseif (<character> = qs(0x33d6c02a))
		if (<lvl> = 1)
			soundevent \{event = audio_powers_judy_power_lvl_1}
		else (<lvl> = 2)
			soundevent \{event = audio_powers_judy_power_lvl_2}
		endif
		tutorial_system_get_language_prefix
		formattext checksumname = success1stsong '%l_FB_Success_1st_Song' l = <language_prefix>
		formattext checksumname = success2ndsong '%l_FB_Success_2nd_Song' l = <language_prefix>
		formattext checksumname = fbintro '%l_Ampzilla_FB_Intro' l = <language_prefix>
		if NOT ((issoundplaying rush_01) || (issoundplaying rush_02) || (issoundplaying rush_03) || (issoundplaying rush_04) || (issoundplaying rush_05) || (issoundplaying rush_06) || (issoundplaying <success1stsong>) || (issoundplaying <success2ndsong>) || (issoundplaying <fbintro>))
			soundevent \{event = endofsong_camera_cheer}
		else
			printf \{channel = sfx
				qs(0x985501da)}
		endif
	elseif (<character> = qs(0xe26369e9))
		if (<lvl> = 1)
			soundevent \{event = audio_powers_lars_power_lvl_1}
		else (<lvl> = 2)
			soundevent \{event = audio_powers_lars_power_lvl_2}
		endif
	elseif (<character> = qs(0x6545783e))
		wait \{2
			gameframes}
		if issoundplaying \{star_deployed_front}
			setsoundparams \{star_deployed_front
				vol = -15.5}
			if (<lvl> = 1)
				soundevent \{event = audio_powers_pandora_power_lvl_1}
				setsoundparams \{powers_pandora_power_lvl_1
					vol = -9}
			else (<lvl> = 2)
				soundevent \{event = audio_powers_pandora_power_lvl_2}
				setsoundparams \{powers_pandora_power_lvl_2
					vol = -6}
			endif
		else
			if (<lvl> = 1)
				soundevent \{event = audio_powers_pandora_power_lvl_1}
			else (<lvl> = 2)
				soundevent \{event = audio_powers_pandora_power_lvl_2}
			endif
		endif
	endif
endscript

script audio_gameplay_star_power_verb_on 
	printf \{channel = sfx
		qs(0x9861e19e)}
	getplayerinfo <player> part
	getpakmancurrentname \{map = zones}
	printf channel = sfx qs(0xbaecfbed) s = <player>
	if ($g_star_power_verb_is_on = 1)
		printf \{channel = sfx
			qs(0x6e477ae5)}
		if NOT issingleplayergame
			printf \{channel = sfx
				qs(0x4fb8b0f8)}
			spawnscriptnow audio_crowd_star_power_clap_panning_multiple params = {player = <player>}
			spawnscriptnow audio_gameplay_star_power_deployed_logic params = {player = <player>}
		endif
	else
		printf \{channel = sfx
			qs(0xa3ebdd3c)}
		spawnscriptnow audio_crowd_star_power_clap_panning params = {player = <player>}
		printf \{channel = sfx
			qs(0xe96a22ba)}
		change \{g_star_power_verb_is_on = 1}
		playlist_getcurrentsong
		if isps3
			if NOT (<current_song> = jamsession)
				if issingleplayergame
					soundevent \{event = audio_star_power_deployed_lfe}
					soundevent \{event = audio_star_power_deployed_back}
					soundevent \{event = audio_star_power_deployed_front}
					if ($game_mode != tutorial)
						if NOT issoundeventplaying \{audio_star_power_cheer_deployed}
							soundevent \{event = audio_star_power_cheer_deployed}
						endif
					endif
				else
					spawnscriptnow audio_gameplay_star_power_deployed_logic params = {player = <player>}
				endif
			else
				soundevent \{event = audio_star_power_deployed_front}
			endif
		else
			if issingleplayergame
				soundevent \{event = audio_star_power_deployed_lfe}
				soundevent \{event = audio_star_power_deployed_back}
				soundevent \{event = audio_star_power_deployed_front}
				if ($game_mode != tutorial)
					if NOT issoundeventplaying \{audio_star_power_cheer_deployed}
						soundevent \{event = audio_star_power_cheer_deployed}
					endif
				endif
			else
				spawnscriptnow audio_gameplay_star_power_deployed_logic params = {player = <player>}
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
				sap_setvenueeffectsendvolume player = <player> vol = 0
			endif
		endif
		case bass
		printf \{channel = sfx
			qs(0xf7672ca5)}
		if NOT (<current_song> = jamsession)
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume player = <player> vol = -10
			endif
		endif
		case drum
		printf \{channel = sfx
			qs(0x45603514)}
		if NOT (<current_song> = jamsession)
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume player = <player> vol = -3
			endif
		endif
		case vocals
		printf \{channel = sfx
			qs(0x21a151f5)}
		vocaldspsetparams \{effect = sfxreverb
			reverblevel = 200
			roomhf = 1000
			diffusion = 1200
			drylevel = -2000.0}
		vocaldspsetparams \{effect = echo
			drymix = 0.0
			wetmix = 0.5}
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
	printf channel = sfx qs(0x149d7db3) s = <player>
	spawnscriptnow audio_crowd_end_star_clap params = {player = <player>}
	spawnscriptnow \{audio_crowd_fading_claps}
	change \{g_star_power_verb_is_on = 0}
	playlist_getcurrentsong
	if NOT (<current_song> = jamsession)
		if ($playing_song = 1)
			sap_setvenueeffectsendvolume player = <player> vol = -100
		endif
	endif
	getplayerinfo <player> part
	if (<part> = vocals)
		vocaldspsetparams \{effect = sfxreverb
			reverblevel = -550
			roomhf = 0
			diffusion = 100
			drylevel = 0.0}
		vocaldspsetparams \{effect = echo
			drymix = 0.0
			wetmix = 0.25}
	endif
endscript

script audio_effects_set_guitar_verb_and_echo_to_dry 
endscript

script audio_effects_change_dsp_snapshot \{time = 4
		scriptname = none}
	singalong_effect_send = -6
	singalong_buss = -3
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	if scriptexists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'nothing'
	endif
	switch <venuesize>
		case large_ext
		<singalong_effect_send> = -1
		<singalong_buss> = -3
		case large_int
		<singalong_effect_send> = -2
		<singalong_buss> = -3
		case medium_int
		<singalong_effect_send> = -6
		<singalong_buss> = -3
		case medium_ext
		<singalong_effect_send> = -6
		<singalong_buss> = -2
		case small_int
		<singalong_effect_send> = -6.5
		<singalong_buss> = -4
		case small_ext
		<singalong_effect_send> = -6
		<singalong_buss> = -2
		default
		<singalong_effect_send> = -6
		<singalong_buss> = -2
	endswitch
	if gotparam \{snapshot}
		switch <snapshot>
			case 'house'
			setsoundbusseffects effects = [
				{name = kick_eq $eq_house_kick}
				{name = kick_delay $echo_house_kick}
				{name = snare_eq $eq_house_snare}
				{name = snare_delay $echo_house_snare}
				{name = cymbal_eq $eq_house_cymbal}
				{name = guitar_compressor $compressor_house_guitar}
				{name = guitar_eq $eq_house_guitar}
				{name = bass_compressor $compressor_house_bass}
				{name = bass_eq $eq_house_bass}
				{name = vocal_eq $eq_house_vocal}
				{name = vocal_delay $echo_house_vocal}
			] time = <time>
			change g_current_eq_kick_gain = ($eq_house_kick.gain)
			change g_current_delay_kick_wetmix = ($echo_house_kick.wetmix)
			change g_current_eq_snare_gain = ($eq_house_snare.gain)
			change g_current_delay_snare_wetmix = ($echo_house_snare.wetmix)
			change g_current_eq_cymbal_gain = ($eq_house_cymbal.gain)
			change g_current_comp_guitar_threshold = ($compressor_house_guitar.threshold)
			change g_current_eq_guitar_gain = ($eq_house_guitar.gain)
			change g_current_comp_bass_threshold = ($compressor_house_bass.threshold)
			change g_current_eq_bass_gain = ($eq_house_bass.gain)
			change g_current_eq_vocals_gain = ($eq_house_vocal.gain)
			change g_current_delay_vocals_wetmix = ($echo_house_vocal.wetmix)
			audio_effects_set_effects_by_venue_type params = {time = <time>}
			if gotparam \{bump_3db}
				setsoundbussparams \{$house_3db_bussset
					time = 0}
				wait \{1
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
				sap_setvenueeffectsendvolume \{track = tom
					vol = -6}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = 0}
				sap_setvenueeffectsendvolume \{track = bass
					vol = 2}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -6}
				sap_setvenueeffectsendvolume \{track = band
					vol = -6}
			endif
			getpakmancurrent \{map = zones}
			if (<pak> = z_visualizer)
				if ($playing_song = 1)
					sap_setvenueeffectsendvolume \{track = crowd
						vol = -100}
				endif
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				if ($playing_song = 1)
					sap_setvenueeffectsendvolume \{track = crowd
						vol = -100}
				endif
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			endif
			case 'stage'
			setsoundbusseffects effects = [
				{name = kick_eq $eq_stage_kick}
				{name = kick_delay $echo_stage_kick}
				{name = snare_eq $eq_stage_snare}
				{name = snare_delay $echo_stage_snare}
				{name = cymbal_eq $eq_stage_cymbal}
				{name = guitar_compressor $compressor_stage_guitar}
				{name = guitar_eq $eq_stage_guitar}
				{name = bass_compressor $compressor_stage_bass}
				{name = bass_eq $eq_stage_bass}
				{name = vocal_eq $eq_stage_vocal}
				{name = vocal_delay $echo_stage_vocal}
			] time = <time>
			change g_current_eq_kick_gain = ($eq_stage_kick.gain)
			change g_current_delay_kick_wetmix = ($echo_stage_kick.wetmix)
			change g_current_eq_snare_gain = ($eq_stage_snare.gain)
			change g_current_delay_snare_wetmix = ($echo_stage_snare.wetmix)
			change g_current_eq_cymbal_gain = ($eq_stage_cymbal.gain)
			change g_current_comp_guitar_threshold = ($compressor_stage_guitar.threshold)
			change g_current_eq_guitar_gain = ($eq_stage_guitar.gain)
			change g_current_comp_bass_threshold = ($compressor_stage_bass.threshold)
			change g_current_eq_bass_gain = ($eq_stage_bass.gain)
			change g_current_eq_vocals_gain = ($eq_stage_vocal.gain)
			change g_current_delay_vocals_wetmix = ($echo_stage_vocal.wetmix)
			audio_effects_set_effects_by_venue_type params = {time = <time>}
			setsoundbussparams $stage_bussset time = <time>
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume \{track = kick
					vol = -11}
				sap_setvenueeffectsendvolume \{track = snare
					vol = -15}
				sap_setvenueeffectsendvolume \{track = cymbal
					vol = -5}
				sap_setvenueeffectsendvolume \{track = tom
					vol = -7}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -17}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = -11}
				sap_setvenueeffectsendvolume \{track = bass
					vol = -5}
				sap_setvenueeffectsendvolume \{track = band
					vol = -7}
			endif
			getpakmancurrent \{map = zones}
			if (<pak> = z_visualizer)
				if ($playing_song = 1)
					sap_setvenueeffectsendvolume \{track = crowd
						vol = -100}
				endif
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				if ($playing_song = 1)
					sap_setvenueeffectsendvolume track = crowd vol = (<singalong_effect_send> - 4)
				endif
				setsoundbussparams {crowdsingalong_stream = {vol = (<singalong_buss> - 13.5)} time = <time>}
			endif
			change \{g_current_send_vol = 2}
			case 'game'
			setsoundbusseffects effects = [
				{name = kick_eq $eq_game_kick}
				{name = kick_delay $echo_game_kick}
				{name = snare_eq $eq_game_snare}
				{name = snare_delay $echo_game_snare}
				{name = cymbal_eq $eq_game_cymbal}
				{name = guitar_compressor $compressor_game_guitar}
				{name = guitar_eq $eq_game_guitar}
				{name = bass_compressor $compressor_game_bass}
				{name = bass_eq $eq_game_bass}
				{name = vocal_eq $eq_game_vocal}
				{name = vocal_delay $echo_game_vocal}
			] time = <time>
			change g_current_eq_kick_gain = ($eq_game_kick.gain)
			change g_current_delay_kick_wetmix = ($echo_game_kick.wetmix)
			change g_current_eq_snare_gain = ($eq_game_snare.gain)
			change g_current_delay_snare_wetmix = ($echo_game_snare.wetmix)
			change g_current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			change g_current_comp_guitar_threshold = ($compressor_game_guitar.threshold)
			change g_current_eq_guitar_gain = ($eq_game_guitar.gain)
			change g_current_comp_bass_threshold = ($compressor_game_bass.threshold)
			change g_current_eq_bass_gain = ($eq_game_bass.gain)
			change g_current_eq_vocals_gain = ($eq_game_vocal.gain)
			change g_current_delay_vocals_wetmix = ($echo_game_vocal.wetmix)
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
				sap_setvenueeffectsendvolume \{track = tom
					vol = -100}
				sap_setvenueeffectsendvolume \{track = band
					vol = -100}
			endif
			gamemode_gettype
			getpakmancurrent \{map = zones}
			if (<type> = freeplay)
				if (<pak> = z_visualizer)
					if ($playing_song = 1)
						sap_setvenueeffectsendvolume \{track = crowd
							vol = -100}
					endif
					setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
				else
					if ($playing_song = 1)
						sap_setvenueeffectsendvolume track = crowd vol = <singalong_effect_send>
					endif
					setsoundbussparams {crowdsingalong_stream = {vol = <singalong_buss>} time = <time>}
				endif
			else
				if (<pak> = z_visualizer)
					sap_setvenueeffectsendvolume \{track = crowd
						vol = -100}
					setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
				else
					sap_setvenueeffectsendvolume \{track = crowd
						vol = -100}
					setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
				endif
			endif
			change \{g_current_send_vol = 0}
			case 'join'
			setsoundbusseffects effects = [
				{name = kick_eq $eq_game_kick}
				{name = kick_delay $echo_game_kick}
				{name = snare_eq $eq_game_snare}
				{name = snare_delay $echo_game_snare}
				{name = cymbal_eq $eq_game_cymbal}
				{name = guitar_compressor $compressor_game_guitar}
				{name = guitar_eq $eq_game_guitar}
				{name = bass_compressor $compressor_game_bass}
				{name = bass_eq $eq_game_bass}
				{name = vocal_eq $eq_game_vocal}
				{name = vocal_delay $echo_game_vocal}
			] time = <time>
			change g_current_eq_kick_gain = ($eq_game_kick.gain)
			change g_current_delay_kick_wetmix = ($echo_game_kick.wetmix)
			change g_current_eq_snare_gain = ($eq_game_snare.gain)
			change g_current_delay_snare_wetmix = ($echo_game_snare.wetmix)
			change g_current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			change g_current_comp_guitar_threshold = ($compressor_game_guitar.threshold)
			change g_current_eq_guitar_gain = ($eq_game_guitar.gain)
			change g_current_comp_bass_threshold = ($compressor_game_bass.threshold)
			change g_current_eq_bass_gain = ($eq_game_bass.gain)
			change g_current_eq_vocals_gain = ($eq_game_vocal.gain)
			change g_current_delay_vocals_wetmix = ($echo_game_vocal.wetmix)
			setsoundbussparams $join_bussset time = <time>
			if ($playing_song = 1)
				sap_setvenueeffectsendvolume \{track = kick
					vol = -15}
				sap_setvenueeffectsendvolume \{track = snare
					vol = -15}
				sap_setvenueeffectsendvolume \{track = cymbal
					vol = -6}
				sap_setvenueeffectsendvolume \{track = tom
					vol = -6}
				sap_setvenueeffectsendvolume \{track = vocal
					vol = -15}
				sap_setvenueeffectsendvolume \{track = guitar
					vol = -15}
				sap_setvenueeffectsendvolume \{track = bass
					vol = -6}
				sap_setvenueeffectsendvolume \{track = band
					vol = -6}
			endif
			getpakmancurrent \{map = zones}
			if (<pak> = z_visualizer)
				if ($playing_song = 1)
					sap_setvenueeffectsendvolume \{track = crowd
						vol = -100}
				endif
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				if ($playing_song = 1)
					sap_setvenueeffectsendvolume track = crowd vol = (<singalong_effect_send> - 3)
				endif
				setsoundbussparams {crowdsingalong_stream = {vol = (<singalong_buss> - 9.5)} time = <time>}
			endif
			change \{g_current_send_vol = 2}
			case 'pause'
			setsoundbusseffects effects = [
				{name = kick_eq $eq_game_kick}
				{name = kick_delay $echo_game_kick}
				{name = snare_eq $eq_game_snare}
				{name = snare_delay $echo_game_snare}
				{name = cymbal_eq $eq_game_cymbal}
				{name = guitar_compressor $compressor_game_guitar}
				{name = guitar_eq $eq_game_guitar}
				{name = bass_compressor $compressor_game_bass}
				{name = bass_eq $eq_game_bass}
				{name = vocal_eq $eq_game_vocal}
				{name = vocal_delay $echo_game_vocal}
			] time = <time>
			change g_current_eq_kick_gain = ($eq_game_kick.gain)
			change g_current_delay_kick_wetmix = ($echo_game_kick.wetmix)
			change g_current_eq_snare_gain = ($eq_game_snare.gain)
			change g_current_delay_snare_wetmix = ($echo_game_snare.wetmix)
			change g_current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			change g_current_comp_guitar_threshold = ($compressor_game_guitar.threshold)
			change g_current_eq_guitar_gain = ($eq_game_guitar.gain)
			change g_current_comp_bass_threshold = ($compressor_game_bass.threshold)
			change g_current_eq_bass_gain = ($eq_game_bass.gain)
			change g_current_eq_vocals_gain = ($eq_game_vocal.gain)
			change g_current_delay_vocals_wetmix = ($echo_game_vocal.wetmix)
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
				sap_setvenueeffectsendvolume \{track = tom
					vol = -100}
				sap_setvenueeffectsendvolume \{track = band
					vol = -100}
			endif
			getpakmancurrent \{map = zones}
			if (<pak> = z_visualizer)
				if ($playing_song = 1)
					sap_setvenueeffectsendvolume \{track = crowd
						vol = -100}
				endif
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				if ($playing_song = 1)
					sap_setvenueeffectsendvolume track = crowd vol = (<singalong_effect_send> - 1)
				endif
				setsoundbussparams {crowdsingalong_stream = {vol = (<singalong_buss> - 9)} time = <time>}
			endif
			change \{g_current_send_vol = 2}
			default
		endswitch
	endif
	printdspsettingsonscreen
endscript

script audio_crowd_setup_based_on_zone 
	venuesize = medium_ext
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	if scriptexists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = medium_ext
	endif
	printf channel = sfx qs(0x1425fcec) s = <venuesize>
	switch <venuesize>
		case large_ext
		venuetype = 'LG'
		case large_int
		venuetype = 'LG'
		case medium_int
		venuetype = 'MD'
		case medium_ext
		venuetype = 'MD'
		case small_int
		venuetype = 'SM'
		case small_ext
		venuetype = 'SM'
		default
		venuetype = 'MD'
	endswitch
	switch <venuesize>
		case large_ext
		venuesizestring = 'Large_EXT'
		case large_int
		venuesizestring = 'Large_INT'
		case medium_int
		venuesizestring = 'Medium_INT'
		case medium_ext
		venuesizestring = 'Medium_EXT'
		case small_int
		venuesizestring = 'Small_INT'
		case small_ext
		venuesizestring = 'Small_EXT'
		default
		venuesizestring = 'Medium_INT'
	endswitch
	switch <venuesize>
		case small_int
		newvenuesize = 'SM_INT'
		case small_ext
		newvenuesize = 'SM_EXT'
		case medium_int
		newvenuesize = 'MD_INT'
		case medium_ext
		newvenuesize = 'MD_EXT'
		case large_int
		case large_ext
		newvenuesize = 'LG_EXT'
		default
		printf \{qs(0xd177cb8d)}
		newvenuesize = 'MD_INT'
	endswitch
	formattext checksumname = whistletemp 'Audio_Crowd_%s_Whistle_Positive' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_whistle_soundevent = <whistletemp>
	formattext checksumname = oneshotgoodtemp 'Audio_Crowd_%s_OneShot_Positive' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_oneshot_positive_soundevent = <oneshotgoodtemp>
	formattext checksumname = oneshotbadtemp 'Audio_Crowd_%s_OneShot_Negative' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_oneshot_negative_soundevent = <oneshotbadtemp>
	formattext checksumname = loopgoodtemp 'Crowd_Loop_%s_Good' s = <venuesizestring> addtostringlookup = true
	change g_current_crowd_looping_bg_area_good = <loopgoodtemp>
	formattext checksumname = loopneutraltemp 'Crowd_Loop_%s_Neutral' s = <venuesizestring> addtostringlookup = true
	change g_current_crowd_looping_bg_area_neutral = <loopneutraltemp>
	formattext checksumname = loopbadtemp 'Crowd_Loop_%s_Bad' s = <venuesizestring> addtostringlookup = true
	change g_current_crowd_looping_bg_area_bad = <loopbadtemp>
	crowdtransitionchecksum = crowd_transition
	formattext checksumname = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Normal' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_clap_normal_soundevent = <claptemp>
	formattext checksumname = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Middle' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_clap_middle_soundevent = <claptemp>
	formattext checksumname = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Left_Middle' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_clap_left_middle_soundevent = <claptemp>
	formattext checksumname = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Right_Middle' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_clap_right_middle_soundevent = <claptemp>
	formattext checksumname = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Left' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_clap_left_soundevent = <claptemp>
	formattext checksumname = claptemp 'Audio_Crowd_%s_Clap_To_Beat_Right' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_clap_right_soundevent = <claptemp>
	formattext checksumname = transitiontemp '%s_Crowd_Negative_To_Neutral' s = <venuetype> addtostringlookup = true
	change g_current_crowd_transition_negative_to_neutral = <transitiontemp>
	formattext checksumname = transitiontemp '%s_Crowd_Neutral_To_Negative' s = <venuetype> addtostringlookup = true
	change g_current_crowd_transition_neutral_to_negative = <transitiontemp>
	formattext checksumname = transitiontemp '%s_Crowd_Neutral_To_Positive' s = <venuetype> addtostringlookup = true
	change g_current_crowd_transition_neutral_to_positive = <transitiontemp>
	formattext checksumname = transitiontemp '%s_Crowd_Positive_To_Neutral' s = <venuetype> addtostringlookup = true
	change g_current_crowd_transition_positive_to_neutral = <transitiontemp>
	formattext checksumname = swelltemp 'Audio_Crowd_%s_Swell_Short' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_swell_short_soundevent = <swelltemp>
	formattext checksumname = swelltemp 'Audio_Crowd_%s_Swell_Short_Soft' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_swell_short_soft_soundevent = <swelltemp>
	formattext checksumname = swelltemp 'Audio_Crowd_%s_Swell_Med' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_swell_med_soundevent = <swelltemp>
	formattext checksumname = swelltemp 'Audio_Crowd_%s_Swell_Long' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_swell_long_soundevent = <swelltemp>
	formattext checksumname = encoretemp 'Audio_Crowd_%s_Encore' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_encore = <encoretemp>
	formattext checksumname = anticipationtemp '%s_Crowd_Anticipation_Loop' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_anticipation = <anticipationtemp>
	formattext checksumname = applausetemp 'Audio_Crowd_%s_Applause' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_applause_soundevent = <applausetemp>
	formattext checksumname = introtemp 'Audio_Crowd_%s_Venue_Intro' s = <pakname> addtostringlookup = true
	change g_current_crowd_venue_intro_soundevent = <introtemp>
	formattext checksumname = preencoretemp 'Audio_Crowd_%s_PreEncore_Looping' s = <newvenuesize> addtostringlookup = true
	change g_current_crowd_preencore_looping_soundevent = <preencoretemp>
	formattext checksumname = tempvenuesize '%s' s = <newvenuesize> addtostringlookup = true
	change g_current_venue_size = <tempvenuesize>
	if ((<pakname> = 'z_mansionstudio') || (<pakname> = 'z_modular') || (<pakname> = 'z_credits') || (<pakname> = 'z_visualizer') || (<pakname> = 'z_finalbattle') || (<pakname> = 'z_cube'))
		change \{g_current_crowd_looping_bg_area_bad = frontend}
		change \{g_current_crowd_looping_bg_area_neutral = frontend}
		change \{g_current_crowd_looping_bg_area_good = frontend}
		change \{g_current_crowd_looping_bg_area = frontend}
	endif
	printf \{channel = sfx
		qs(0xfba306ee)}
	printf \{channel = sfx
		qs(0x8d80eacf)
		s = $g_current_crowd_whistle_soundevent}
	printf \{channel = sfx
		qs(0xf1a35267)
		s = $g_current_crowd_oneshot_positive_soundevent}
	printf \{channel = sfx
		qs(0xfe1327ac)
		s = $g_current_crowd_oneshot_negative_soundevent}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0x77767cd1)
		s = $g_current_crowd_looping_bg_area_bad}
	printf \{channel = sfx
		qs(0x832a45ec)
		s = $g_current_crowd_looping_bg_area_neutral}
	printf \{channel = sfx
		qs(0xf6e25b4b)
		s = $g_current_crowd_looping_bg_area_good}
	printf \{channel = sfx
		qs(0x24ab80a8)
		s = $g_current_crowd_looping_bg_area}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0x36c99555)
		s = $g_current_crowd_transition_negative_to_neutral}
	printf \{channel = sfx
		qs(0xddf4ea0b)
		s = $g_current_crowd_transition_neutral_to_negative}
	printf \{channel = sfx
		qs(0x7eeabe3c)
		s = $g_current_crowd_transition_neutral_to_positive}
	printf \{channel = sfx
		qs(0x3979e09e)
		s = $g_current_crowd_transition_positive_to_neutral}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0xe6bc13b4)
		s = $g_current_crowd_swell_short_soundevent}
	printf \{channel = sfx
		qs(0x5881663d)
		s = $g_current_crowd_swell_med_soundevent}
	printf \{channel = sfx
		qs(0x8f5e027f)
		s = $g_current_crowd_swell_long_soundevent}
	printf \{channel = sfx
		qs(0x713755f7)}
	printf \{channel = sfx
		qs(0xec13644d)
		s = $g_current_crowd_applause_soundevent}
	printf \{channel = sfx
		qs(0xfba306ee)}
endscript

script audio_crowd_event_listener 
	if NOT ($g_crowd_in_jam_mode_song_state = 1)
		if gotparam \{pak}
		endif
		getpakmancurrentname \{map = zones}
		if (($game_mode != practice) && (<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
			if gotparam \{event_type}
				switch <event_type>
					case 1
					if ($g_turn_off_oneshot_cheers = 0)
						audio_crowd_play_short_swell_for_this_venue
					endif
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
					case 7
					if ($current_crowd >= 1.3333)
						if ($g_turn_off_oneshot_cheers = 0)
							audio_crowd_play_med_swell_for_this_venue
						endif
						audio_crowd_adjust_med_surge
					endif
					case 8
					if ($current_crowd >= 1.3333)
						if ($g_turn_off_oneshot_cheers = 0)
							audio_crowd_play_long_swell_for_this_venue
						endif
						audio_crowd_adjust_slow_big_surge
					endif
					case 9
					printf \{'Not Working Right Now'}
					case 10
					audio_effects_song_quiet_start_adjust_all_sfx_down
					spawnscriptnow \{audio_crowd_play_quiet_crowd_one_shots}
					case 11
					audio_effects_song_quiet_over_adjust_all_sfx_to_normal
					spawnscriptnow \{audio_crowd_kill_quiet_crowd_one_shots}
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
			qs(0xe737e2b8)}
	endif
endscript

script audio_crowd_play_whistle_based_on_venue 
	soundevent \{event = $g_current_crowd_whistle_soundevent}
endscript

script audio_crowd_play_short_swell_for_this_venue 
	printf \{channel = sfx
		qs(0x32f04896)
		s = $g_current_crowd_swell_short_soundevent}
	soundevent \{event = $g_current_crowd_swell_short_soundevent}
	crowd_allplayanim \{anim = swellsh
		playonce = true}
endscript

script audio_crowd_play_short_swell_for_this_venue_softer 
	soundevent \{event = $g_current_crowd_swell_short_soft_soundevent}
	crowd_allplayanim \{anim = swellsh
		playonce = true}
endscript

script audio_crowd_play_med_swell_for_this_venue 
	soundevent \{event = $g_current_crowd_swell_med_soundevent}
	crowd_allplayanim \{anim = swellmd
		playonce = true}
endscript

script audio_crowd_play_long_swell_for_this_venue 
	soundevent \{event = $g_current_crowd_swell_long_soundevent}
	crowd_allplayanim \{anim = swelllg
		playonce = true}
endscript

script audio_crowd_play_applause_for_this_venue 
	soundevent \{event = $g_current_crowd_applause_soundevent}
endscript

script audio_crowd_adjust_loop_to_default \{restarting = 0
		normal = 0
		time = 1.5}
	if ($current_playing_transition = loading)
	else
		if (<restarting> = 1)
			if gotparam \{time}
				setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol) pitch = 0.0} time = <time>}
			else
				setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol) pitch = 0.0} time = <time>}
			endif
		else
			if (<normal> = 1)
				if gotparam \{time}
					setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol) pitch = 0.0} time = <time>}
				else
					setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol) pitch = 0.0} time = <time>}
				endif
			else
			endif
		endif
	endif
endscript

script audio_crowd_adjust_fast_small_surge 
	if gotparam \{pak}
		printf channel = sfx qs(0x454351a7) s = <pak>
	endif
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 10) pitch = 2} time = 0.08}
	wait \{0.8
		seconds}
	audio_crowd_adjust_loop_to_default \{time = 7
		normal = 1}
endscript

script audio_crowd_adjust_fast_big_surge 
	if gotparam \{pak}
	endif
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 10) pitch = 2} time = 0.08}
	wait \{0.8
		seconds}
	audio_crowd_adjust_loop_to_default \{time = 7
		normal = 1}
endscript

script audio_crowd_adjust_med_surge 
	if gotparam \{pak}
		printf channel = sfx qs(0xb758ec23) s = <pak>
	endif
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 10) pitch = 2} time = 2.08}
	wait \{2.08
		seconds}
	audio_crowd_adjust_loop_to_default \{time = 6
		normal = 1}
endscript

script audio_crowd_adjust_slow_big_surge 
	if gotparam \{pak}
		printf channel = sfx qs(0x843fe62e) s = <pak>
	endif
	wait \{2.5
		seconds}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 10) pitch = 2} time = 1.5}
	wait \{1.5
		seconds}
	audio_crowd_adjust_loop_to_default \{time = 5
		normal = 1}
endscript

script audio_effects_song_quiet_start_adjust_all_sfx_down \{sfxbalancetime = 4
		crowdbalancetime = 8
		sfxvolsub = 4.0
		crowdvolsub = 5.0}
	gamemode_gettype
	printf \{channel = sfx
		qs(0xfa5455b6)}
	setsoundbussparams {sfx_balance = {vol = (($default_bussset.sfx_balance.vol) - <sfxvolsub>)} time = <sfxbalancetime>}
	setsoundbussparams {crowd_balance = {vol = (($default_bussset.crowd_balance.vol) - <crowdvolsub>)} time = <crowdbalancetime>}
endscript

script audio_effects_song_quiet_over_adjust_all_sfx_to_normal \{sfxbalancetime = 8
		crowdbalancetime = 4}
	gamemode_gettype
	printf \{channel = sfx
		qs(0x1c6b884d)}
	setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)} time = <sfxbalancetime>}
	setsoundbussparams {crowd_balance = {vol = ($default_bussset.crowd_balance.vol)} time = <crowdbalancetime>}
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
			setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)}}
			setsoundbussparams {crowd_balance = {vol = ($default_bussset.crowd_balance.vol)}}
		else
			printf \{channel = sfx
				qs(0x58c63f4c)}
			change \{g_crowd_transition_start_of_song_normal = 1}
			printf \{channel = sfx
				qs(0x30d83413)}
		endif
	endif
endscript

script audio_crowd_moment_on_stage_reaction_sfx 
endscript

script audio_crowd_surge_and_sustain_at_end_of_song 
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 4)} time = 3.5}
endscript

script crowd_singalong_volume_up 
endscript

script crowd_singalong_volume_down 
endscript

script change_crowd_looping_sfx \{crowd_looping_state = good
		player = 1
		loading_transition = 0
		restarting = 0}
	wait \{1
		gameframe}
	if NOT ui_event_exists_in_stack \{name = 'gameplay'}
		crowd_looping_state = good
	endif
	gamemode_gettype
	if (<type> = competitive)
		crowd_looping_state = good
	endif
	audio_crowd_do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state> loading_transition = <loading_transition> restarting = <restarting>
endscript

script audio_crowd_do_actual_changing_of_looping_sound \{loading_transition = 0
		restarting = 0}
	if gotparam \{crowd_looping_state}
		getpakmancurrent \{map = zones}
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
	getpakmancurrentname \{map = zones}
	if (($g_crowd_in_jam_mode_song_state = 1) || ($calibrate_lag_enabled = 1) || (<pakname> = 'z_mansionstudio') || (<pakname> = 'z_modular') || (<pakname> = 'z_credits') || (<pakname> = 'z_visualizer') || (<pakname> = 'z_finalbattle') || (<pakname> = 'z_cube'))
		new_oneshots = audio_crowd_oneshots_do_nothing
	endif
	gamemode_gettype
	if (($calibrate_lag_enabled = 0) && ($game_mode != tutorial))
		printf \{channel = sfx
			qs(0x542b8e34)}
		sfx_backgrounds_new_area bg_sfx_area = <new_bg_area> loading_transition = <loading_transition> restarting = <restarting>
	else
		printf \{channel = sfx
			qs(0xf6d9c800)}
		sfx_backgrounds_new_area bg_sfx_area = frontend loading_transition = <loading_transition> restarting = <restarting>
	endif
	one_shot_soundevent soundevent = <new_oneshots> waittime = 5
endscript

script audio_crowd_silence_front_end \{immediate = 0}
	printf \{channel = sfx
		qs(0xf2172302)}
	sfx_backgrounds_new_area bg_sfx_area = frontend immediate = <immediate>
	one_shot_soundevent soundevent = audio_crowd_oneshots_do_nothing waittime = 5 immediate = <immediate>
endscript

script crowd_transition_sfx_poor_to_medium 
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x3da6f454)}
		audio_crowd_generic_transition state = negative_to_neutral player = <player>
	endif
endscript

script crowd_transition_sfx_medium_to_good 
	if gotparam \{player}
		wait \{1
			gameframe}
		audio_crowd_generic_transition state = neutral_to_positive player = <player>
	endif
endscript

script crowd_transition_sfx_medium_to_poor 
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x73ffdd74)}
		audio_crowd_generic_transition state = neutral_to_negative player = <player>
	endif
endscript

script crowd_transition_sfx_good_to_medium 
	audio_crowd_adjust_loop_to_default \{time = 1
		normal = 1}
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x713e8a0b)}
		audio_crowd_generic_transition state = positive_to_neutral player = <player>
	endif
endscript

script audio_crowd_generic_transition \{state = neutral_to_positive}
	audio_crowd_play_transition state = <state> left = 1 right = 1
endscript

script audio_crowd_transition_left_side 
	audio_crowd_play_transition state = <state> left = 1
endscript

script audio_crowd_transition_right_side 
	audio_crowd_play_transition state = <state> right = 1
endscript

script audio_crowd_play_transition 
	setspawnedscriptnorepeatfor \{time = 0.1}
	setspawninstancelimits \{max = 2
		management = ignore_spawn_request}
	volume = 0
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	if scriptexists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'nothing'
	endif
	if gotparam \{state}
		switch <state>
			case negative_to_neutral
			stopsound \{$g_current_crowd_transition_neutral_to_negative
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $g_current_crowd_transition_negative_to_neutral
			printf \{channel = sfx
				qs(0x82b1060b)
				t = $g_current_crowd_transition_negative_to_neutral}
			if ((<venuesize> = large_ext) || (<venuesize> = large_int))
				volume = 11
			elseif ((<venuesize> = medium_ext) || (<venuesize> = medium_int))
				volume = 8
			elseif ((<venuesize> = small_ext) || (<venuesize> = small_int))
				volume = 6
			endif
			case neutral_to_positive
			stopsound \{$g_current_crowd_transition_positive_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $g_current_crowd_transition_neutral_to_positive
			if (<venuesize> = large_ext)
				volume = 1.5
			elseif ((<venuesize> = medium_ext) || (<venuesize> = medium_int))
				volume = 6
			elseif ((<venuesize> = small_ext) || (<venuesize> = small_int))
				volume = 2
			endif
			case positive_to_neutral
			stopsound \{$g_current_crowd_transition_neutral_to_positive
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $g_current_crowd_transition_positive_to_neutral
			if (<venuesize> = large_ext)
				volume = 3
			elseif ((<venuesize> = medium_ext) || (<venuesize> = medium_int))
				volume = 0.5
			elseif ((<venuesize> = small_ext) || (<venuesize> = small_int))
				volume = 1.5
			endif
			case neutral_to_negative
			stopsound \{$g_current_crowd_transition_negative_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $g_current_crowd_transition_neutral_to_negative
			if (<venuesize> = large_ext)
				volume = 5
			elseif ((<venuesize> = medium_ext) || (<venuesize> = medium_int))
				volume = 0
			elseif ((<venuesize> = small_ext) || (<venuesize> = small_int))
				volume = 3
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
		wait \{1
			gameframe}
		if gotparam \{left}
			if gotparam \{right}
				audio_gameplay_multiplayer_get_sfx_pan_values \{crowd_meter_transition
					wide}
				playsound <transitionevent> vol = <volume> buss = crowd_transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
				audio_gameplay_multiplayer_get_sfx_pan_values \{crowd_meter_transition
					left}
				playsound <transitionevent> buss = crowd_transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		else
			if gotparam \{right}
				audio_gameplay_multiplayer_get_sfx_pan_values \{crowd_meter_transition
					right}
				playsound <transitionevent> buss = crowd_transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
			endif
		endif
	endif
endscript

script crowd_transition_sfx_negative_to_neutral 
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x3da6f454)}
		audio_crowd_generic_transition state = negative_to_neutral player = <player>
	endif
endscript

script crowd_transition_sfx_neutral_to_positive 
	gamemode_gettype
	x = 0
	if (<type> = career)
		getpakmancurrentname \{map = zones}
		if ((<pakname> = 'z_credits') || (<pakname> = 'z_finalbattle') || (<pakname> = 'z_modular'))
			if scriptisrunning \{begin_song_after_intro}
				x = 1
			endif
		endif
	endif
	if (<x> = 0)
		if gotparam \{player}
			wait \{1
				gameframe}
			tutorial_system_get_language_prefix
			formattext checksumname = success1stsong '%l_FB_Success_1st_Song' l = <language_prefix>
			formattext checksumname = success2ndsong '%l_FB_Success_2nd_Song' l = <language_prefix>
			formattext checksumname = fbintro '%l_Ampzilla_FB_Intro' l = <language_prefix>
			if (($calibrate_lag_enabled = 0) && (<type> != tutorial))
				if NOT ((issoundplaying rush_01) || (issoundplaying rush_02) || (issoundplaying rush_03) || (issoundplaying rush_04) || (issoundplaying rush_05) || (issoundplaying rush_06) || (issoundplaying <success1stsong>) || (issoundplaying <success2ndsong>) || (issoundplaying <fbintro>))
					printf \{channel = sfx
						qs(0x7ba459ad)}
					audio_crowd_generic_transition state = neutral_to_positive player = <player>
				else
					printf \{channel = sfx
						qs(0x82ec6eb8)}
				endif
			endif
		endif
	else
		printf \{channel = sfx
			qs(0x5c5578c3)}
	endif
endscript

script crowd_transition_sfx_neutral_to_negative 
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x73ffdd74)}
		audio_crowd_generic_transition state = neutral_to_negative player = <player>
	endif
endscript

script crowd_transition_sfx_positive_to_neutral 
	audio_crowd_adjust_loop_to_default \{time = 1
		normal = 1}
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x713e8a0b)}
		audio_crowd_generic_transition state = positive_to_neutral player = <player>
	endif
endscript

script audio_ui_menu_music_on 
	spawnscriptnow audio_ui_menu_music_on_spawned params = {<...>}
endscript

script audio_ui_menu_music_on_spawned 
	if ($g_menu_music_on_flag = 1)
		return
	else
		change \{g_menu_music_on_flag = 1}
		change \{g_menu_music_ambient_hack = 1}
	endif
	if gotparam \{waitforguitarlick}
		wait \{4
			seconds}
	endif
	printf \{channel = sfx
		qs(0xf5814c6c)}
	enableusermusic
	begin
	spawnscriptnow \{audio_ui_menu_music_se}
	if ($g_menu_music_pan_right = 1)
		setsoundparams \{$g_current_menu_song
			pan1x = -1
			pan1y = 1
			pan2x = -0.4
			pan2y = 1}
	endif
	printf \{channel = sfx
		qs(0x9dccc65f)}
	sfx_backgrounds_new_area \{bg_sfx_area = frontend
		fadeintime = 2.0
		fadeintype = linear
		fadeouttime = 2
		fadeouttype = linear}
	one_shot_soundevent soundevent = audio_crowd_oneshots_do_nothing waittime = 5 immediate = <immediate>
	wait \{2
		seconds}
	audio_ui_menu_music_checks
	wait \{1
		second}
	repeat
endscript

script audio_ui_menu_music_change_pan_and_vol 
	if (issoundplaying $g_current_menu_song)
		if gotparam \{panandlowervol}
			wait \{0.5
				seconds}
			setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) - 2.4)} time = 4}
		else
			if gotparam \{reset}
				wait \{0.5
					seconds}
				setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 4}
			endif
		endif
	endif
endscript

script audio_ui_menu_music_reset_pan 
	if ($g_menu_music_pan_right = 1)
		change \{g_menu_music_pan_right = 0}
		i = -0.4
		begin
		setsoundparams $g_current_menu_song pan1x = -1 pan1y = 1 pan2x = <i> pan2y = 1
		i = (<i> + 0.0077770003)
		wait \{1
			gameframe}
		repeat 180
	endif
endscript

script audio_ui_menu_music_pan 
	if ($g_menu_music_pan_right = 0)
		change \{g_menu_music_pan_right = 1}
		i = 1
		begin
		setsoundparams $g_current_menu_song pan1x = -1 pan1y = 1 pan2x = <i> pan2y = 1
		i = (<i> -0.0077770003)
		wait \{1
			gameframe}
		repeat 180
	endif
endscript

script audio_ui_menu_music_checks 
	begin
	if ($g_menu_music_preloading = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin
	wait \{1
		second}
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
	killspawnedscript \{name = audio_ui_menu_music_on}
	killspawnedscript \{name = audio_ui_menu_music_on_spawned}
	change \{g_menu_music_on_flag = 0}
	audio_ui_kill_menu_music
endscript

script audio_freeplay_attract_mode_start_sound_script 
	setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) - 100)} time = 2.5}
	setsoundbussparams {vocals_balance = {vol = (($default_bussset.vocals_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {drums_balance = {vol = (($default_bussset.drums_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {guitar_balance = {vol = (($default_bussset.guitar_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {bass_balance = {vol = (($default_bussset.bass_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {rhythmgtr_balance = {vol = (($default_bussset.rhythmgtr_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {band_balance = {vol = (($default_bussset.band_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {sfx_balance = {vol = (($default_bussset.sfx_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) - 11)} time = 7}
	setsoundbussparams {crowdsingalong_balance = {vol = (($default_bussset.crowdsingalong_balance.vol) - 11)} time = 7}
	setsoundbussparams {crowd_w_reverb = {vol = (($default_bussset.crowd_w_reverb.vol) - 11)} time = 7}
endscript

script audio_freeplay_attract_mode_ends_sound_script 
	setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 2.5}
	setsoundbussparams {vocals_balance = {vol = ($default_bussset.vocals_balance.vol)} time = 1.5}
	setsoundbussparams {drums_balance = {vol = ($default_bussset.drums_balance.vol)} time = 1.5}
	setsoundbussparams {guitar_balance = {vol = ($default_bussset.guitar_balance.vol)} time = 1.5}
	setsoundbussparams {bass_balance = {vol = ($default_bussset.bass_balance.vol)} time = 1.5}
	setsoundbussparams {rhythmgtr_balance = {vol = ($default_bussset.rhythmgtr_balance.vol)} time = 1.5}
	setsoundbussparams {band_balance = {vol = ($default_bussset.band_balance.vol)} time = 1.5}
	setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)} time = 1.5}
	setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)} time = 7}
	setsoundbussparams {crowdsingalong_balance = {vol = ($default_bussset.crowdsingalong_balance.vol)} time = 7}
	setsoundbussparams {crowd_w_reverb = {vol = ($default_bussset.crowd_w_reverb.vol)} time = 7}
endscript

script audio_audiooptions_scroll 
	soundevent \{event = audio_ui_audio_options_scroll}
endscript

script audio_audiooptions_playing_sound_fader \{time = 2.102}
endscript

script audio_audiooptions_playing_sound_knob 
	setspawnedscriptnorepeatfor \{time = 2.256}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if gotparam \{instrument}
		switch <instrument>
			case guitar
			playsound audio_options_guitar vol = -9.0 buss = options_guitar effects = [{<eq_setting> name = audiooptionssound}]
			case bass
			playsound audio_options_bass vol = -9.0 buss = options_bass effects = [{<eq_setting> name = audiooptionssound}]
			case vocals
			playsound audio_options_vocals vol = -9.0 buss = options_vocals effects = [{<eq_setting> name = audiooptionssound}]
			case drums
			playsound audio_options_drum vol = -9.0 buss = options_drums effects = [{<eq_setting> name = audiooptionssound}]
		endswitch
	endif
endscript

script audio_ui_fade_menu_music \{wait = 0
		volume = 100
		time = 0}
	wait <wait> seconds
	if gotparam \{out}
		if (time = 0)
			<time> = 0.7
		endif
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) - <volume>)} time = <time>}
		if NOT gotparam \{dont_fade_crowd}
			setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) - <volume>)} time = <time>}
		endif
	else
		if gotparam \{in}
			setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = <time>}
			setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)} time = <time>}
			printf \{channel = sfx
				qs(0xc856a506)}
			sfx_backgrounds_new_area \{bg_sfx_area = frontend
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 2
				fadeouttype = linear}
			one_shot_soundevent soundevent = audio_crowd_oneshots_do_nothing waittime = 5 immediate = <immediate>
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
	if gotparam \{crowd_meter_transition}
		if gotparam \{left}
			<pan1x> = -1
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif gotparam \{right}
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 1
			<pan2y> = 1
		elseif gotparam \{wide}
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
		if gotparam \{player}
			getplayerinfo <player> highway_position
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
	getplayerinfo <player> part
	audio_gameplay_multiplayer_get_sfx_pan_values player = <player>
	switch <type>
		case jump
		playsound freeplay_enter_sfx vol = -4 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x676c844f)}
		case start
		playsound freeplay_enter_sfx vol = -4 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x896c91fb)}
		case select
		playsound generic_select vol = -3 pitch = 4 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x0ae2d889)}
		case instrument
		playsound generic_select vol = -3 pitch = 4 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xf7571e78)}
		case up
		playsound generic_scroll vol = -12 pitch = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xcac0cdfe)}
		case down
		playsound generic_scroll vol = -12 pitch = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xafc32f0f)}
		case drop
		playsound freeplay_drop_sfx vol = -4.5 pitch = 1 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x43aa5374)}
		case back
		soundevent \{event = audio_ui_generic_back}
		printf \{channel = sfx
			qs(0xfa648a70)}
		case `default`
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
	if gotparam \{transition}
		switch <transition>
			case 'Start_Of_Game_Setup_Immediate'
			change \{g_current_music_dsp_snapshot_setting = 'house'}
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
				sap_setvenueeffectsendvolume \{track = tom
					vol = -100}
				sap_setvenueeffectsendvolume \{track = band
					vol = -100}
			endif
			case 'Start_Of_Game_Fade_In_To_House'
			change \{g_current_music_dsp_snapshot_setting = 'house'}
			setsoundbussparams \{$house_bussset
				time = 0.5}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 0.5}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
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
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
				fadeintime = 6
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			wait \{2.5
				seconds}
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
				sap_setvenueeffectsendvolume \{track = tom
					vol = -100}
				sap_setvenueeffectsendvolume \{track = band
					vol = -100}
			endif
			change \{g_current_music_dsp_snapshot_setting = 'stage'}
			audio_effects_change_dsp_snapshot \{snapshot = 'stage'
				time = 0.0}
			setsoundbussparams \{$stage_crowd_bussset
				time = 15}
			case 'End_Of_Stage_Song_Fade_Out_Crowd'
			printf \{channel = sfx
				qs(0x98152f3c)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 20
				fadeintype = linear
				fadeouttime = 20
				fadeouttype = linear}
			setsoundbussparams \{$house_bussset
				time = 25}
			case 'End_Of_Stage_Song_Setup_House_Immediate'
			change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 0}
			setsoundbussparams \{$house_3db_bussset
				time = 0.0}
			case 'Stage_To_Join'
			soundevent \{event = $g_current_crowd_swell_short_soundevent}
			soundevent \{event = $g_current_crowd_swell_med_soundevent}
			change \{g_current_music_dsp_snapshot_setting = 'join'}
			audio_effects_change_dsp_snapshot \{snapshot = 'join'
				time = 2}
			printf \{channel = sfx
				qs(0x367075b7)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			case 'House_To_Join'
			soundevent \{event = $g_current_crowd_swell_short_soundevent}
			soundevent \{event = $g_current_crowd_swell_med_soundevent}
			printf \{channel = sfx
				qs(0xcc49e8b7)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			change \{g_current_music_dsp_snapshot_setting = 'join'}
			audio_effects_change_dsp_snapshot \{snapshot = 'join'
				time = 2}
			case 'Join_To_Game'
			printf \{channel = sfx
				qs(0x15aab6d4)}
			gamemode_gettype
			if (<type> = freeplay)
				vocals_mute_all_mics \{mute = false}
			endif
			change \{g_current_music_dsp_snapshot_setting = 'game'}
			audio_effects_change_dsp_snapshot \{snapshot = 'game'
				time = 4.0}
			case 'Join_To_House'
			change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			printf \{channel = sfx
				qs(0x495111bc)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Join_To_Stage'
			change \{g_current_music_dsp_snapshot_setting = 'stage'}
			setsoundbussparams \{$stage_crowd_bussset
				time = 2}
			audio_effects_change_dsp_snapshot \{snapshot = 'stage'
				time = 1.0}
			printf \{channel = sfx
				qs(0x8b235d0d)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
				fadeintime = 3
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			case 'Game_To_Pause'
			setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) - 3)} time = 2}
			change \{g_current_music_dsp_snapshot_setting = 'pause'}
			audio_effects_change_dsp_snapshot \{snapshot = 'pause'
				time = 1.0}
			case 'Pause_To_Game'
			printf \{channel = sfx
				qs(0xee66b36a)}
			setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)} time = 2}
			change \{g_current_music_dsp_snapshot_setting = 'game'}
			audio_effects_change_dsp_snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = freeplay_music_crowd_transitions_pause_to_game}
			case 'Pause_To_Setlist'
			printf \{channel = sfx
				qs(0xa4d8014d)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 2.5
				fadeintype = linear
				fadeouttime = 2.5
				fadeouttype = linear}
			setsoundbussparams \{$music_stream_quiet_bussset
				time = 0.3}
			case 'Pause_To_MainMenu'
			printf \{channel = sfx
				qs(0xdb641471)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 2
				fadeintype = linear
				fadeouttime = 3.5
				fadeouttype = linear}
			change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			one_shot_soundevent soundevent = audio_crowd_oneshots_do_nothing waittime = 5 immediate = <immediate>
			case 'Pause_To_House'
			change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			printf \{channel = sfx
				qs(0x04f57dca)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Pause_To_Stage'
			change \{g_current_music_dsp_snapshot_setting = 'stage'}
			audio_effects_change_dsp_snapshot \{snapshot = 'stage'
				time = 1.0}
			setsoundbussparams \{$prestage_crowd_bussset
				time = 1}
			printf \{channel = sfx
				qs(0xc687317b)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Setlist_To_Pause'
			printf \{channel = sfx
				qs(0x21fc4b89)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
				fadeintime = 1.5}
			setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) - 3)} time = 2}
			change \{g_current_music_dsp_snapshot_setting = 'pause'}
			audio_effects_change_dsp_snapshot \{snapshot = 'pause'
				time = 0.5}
			case 'Setlist_To_Game'
			printf \{channel = sfx
				qs(0x58ccbfbe)}
			printf \{channel = sfx
				qs(0xdf81d6e3)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			change \{g_current_music_dsp_snapshot_setting = 'game'}
			audio_effects_change_dsp_snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = freeplay_music_crowd_transitions_setlist_to_game}
			case 'Game_To_House'
			printf \{channel = sfx
				qs(0xc056152f)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
				fadeintime = 3
				volpercentincrease = 20}
			change \{g_current_music_dsp_snapshot_setting = 'house'}
			audio_effects_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			wait \{4
				seconds}
			printf \{channel = sfx
				qs(0xc056152f)}
			sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
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
	if NOT (<type> = freeplay || $in_sing_a_long = true)
		wait ($current_intro.hud_move_time / 1000.0) seconds
		soundevent \{event = audio_ui_gameplay_intro_kick}
	endif
endscript

script audio_gameplay_intro_highway_up_sfx_waiting 
	gamemode_gettype
	if NOT (<type> = freeplay)
		waittime = (($current_intro.highway_move_time / 1000.0) - 1.5)
		if (<waittime> < 0)
			waittime = 0
		endif
		wait <waittime> seconds
		soundevent \{event = audio_ui_gameplay_highway_up}
		getpakmancurrent \{map = zones}
	else
		if ($g_beginning_of_freeplay_highway_up = 1)
			change \{g_beginning_of_freeplay_highway_up = 0}
			soundevent \{event = audio_ui_gameplay_highway_up}
		endif
	endif
endscript

script audio_gameplay_intro_vocal_highway_up_sfx_waiting 
	if NOT ($in_sing_a_long = true)
		soundevent \{event = audio_ui_gameplay_vocal_highway_appear}
	endif
endscript

script audio_gameplay_intro_sfx_warmup 
	killspawnedscript \{name = audio_crowd_play_loading_screen_swell}
	killspawnedscript \{name = audio_crowd_loading_whistle}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol))} time = 2}
endscript

script audio_gameplay_countoff_logic 
	gamemode_gettype
	getnumplayersingame \{local}
	getfirstplayer \{local}
	playlist_getcurrentsong
	song_name = <current_song>
	getpakmancurrentname \{map = zones}
	if (<type> = career)
		if (<pakname> = 'z_modular')
			return
		endif
	endif
	if NOT gotparam \{countoff_sound}
		playlist_getcurrentsong
		get_song_struct song = <current_song>
		if structurecontains structure = <song_struct> name = countoff
			countoff_sound = (<song_struct>.countoff)
		else
			countoff_sound = 'sticks_normal'
		endif
		if gotparam \{countoff_sound_type}
			countoff_sound = <countoff_sound_type>
		endif
	endif
	formattext checksumname = countoff_sound '%s' s = <countoff_sound> addtostringlookup = true
	if NOT ($game_mode = practice)
		if (<velocity> > 99)
			switch <countoff_sound>
				case sticks_normal
				playsound \{stickclickmed
					buss = countoffs
					send_vol1 = $g_current_send_vol
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case hihat01
				playsound \{hihatclosed01
					buss = countoffs
					send_vol1 = $g_current_send_vol
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							-0.90999997
							-0.44
							0.0
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case sticks_tiny
				playsound \{stickclicksmall
					buss = countoffs
					send_vol1 = $g_current_send_vol
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							-1.41
							-0.90999997
							-0.44
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case sticks_huge
				playsound \{stickclicklarge
					buss = countoffs
					send_vol1 = $g_current_send_vol
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case hihat02
				playsound \{hihatopen02
					buss = countoffs
					send_vol1 = $g_current_send_vol
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							0.42000002
							0.83
							1.21
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.17
							0.0
							0.0
						]
					}}
				case hihat03
				playsound \{hihatpedal02
					buss = countoffs
					send_vol1 = $g_current_send_vol
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							0.83
							1.58
							2.27
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.17
							0.0
							0.0
						]
					}}
				default
				printf \{channel = sfx
					qs(0x71d9c052)}
				playsound \{hihatpedal02
					buss = countoffs
					send_vol1 = $g_current_send_vol
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							0.83
							1.58
							2.27
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
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
					playsound \{stickclickmed
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-3.73
								-4.14
								-5.17
								-6.0
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case hihat01
					playsound \{hihatclosed01
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case sticks_tiny
					playsound \{stickclicksmall
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case sticks_huge
					playsound \{stickclicklarge
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case hihat02
					playsound \{hihatopen02
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					case hihat03
					playsound \{hihatpedal02
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.83
								1.58
								2.27
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					default
					playsound \{hihatpedal02
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.83
								1.58
								2.27
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
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
					playsound \{stickclickmed
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-9.09
								-8.610001
								-7.9300003
								-7.51
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case hihat01
					playsound \{hihatclosed01
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case sticks_tiny
					playsound \{stickclicksmall
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case sticks_huge
					playsound \{stickclicklarge
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case hihat02
					playsound \{hihatopen02
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					case hihat03
					playsound \{hihatpedal02
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.83
								1.58
								2.27
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					default
					playsound \{hihatpedal02
						buss = countoffs
						send_vol1 = $g_current_send_vol
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.83
								1.58
								2.27
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
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
				playsound \{stickclickmed
					buss = countoffs
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case hihat01
				playsound \{hihatclosed01
					buss = countoffs
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							-0.90999997
							-0.44
							0.0
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case sticks_tiny
				playsound \{stickclicksmall
					buss = countoffs
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							-1.41
							-0.90999997
							-0.44
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case sticks_huge
				playsound \{stickclicklarge
					buss = countoffs
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							-3.09
							-2.84
							-2.49
							-2.3799999
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.51
							0.34
							0.17
							0.0
							-0.17
						]
					}}
				case hihat02
				playsound \{hihatopen02
					buss = countoffs
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							0.42000002
							0.83
							1.21
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.17
							0.0
							0.0
						]
					}}
				case hihat03
				playsound \{hihatpedal02
					buss = countoffs
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							0.83
							1.58
							2.27
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
						vals = [
							0.17
							0.0
							0.0
						]
					}}
				default
				playsound \{hihatpedal02
					buss = countoffs
					randomvol = {
						type = randomnorepeatlasttwotype
						vals = [
							0.83
							1.58
							2.27
						]
					}
					randompitch = {
						type = randomnorepeatlasttwotype
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
					playsound \{stickclickmed
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-3.73
								-4.14
								-5.17
								-6.0
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case hihat01
					playsound \{hihatclosed01
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case sticks_tiny
					playsound \{stickclicksmall
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case sticks_huge
					playsound \{stickclicklarge
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.17
								0.0
								-0.17
								-0.35000002
								-0.53
							]
						}}
					case hihat02
					playsound \{hihatopen02
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					case hihat03
					playsound \{hihatpedal02
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.83
								1.58
								2.27
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								0.0
								-0.17
								-0.17
							]
						}}
					default
					playsound \{hihatpedal02
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.83
								1.58
								2.27
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
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
					playsound \{stickclickmed
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-9.09
								-8.610001
								-7.9300003
								-7.51
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case hihat01
					playsound \{hihatclosed01
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.90999997
								-0.44
								0.0
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case sticks_tiny
					playsound \{stickclicksmall
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-1.41
								-0.90999997
								-0.44
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case sticks_huge
					playsound \{stickclicklarge
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								-3.09
								-2.84
								-2.49
								-2.3799999
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.53
								-0.71
								-0.89
							]
						}}
					case hihat02
					playsound \{hihatopen02
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.42000002
								0.83
								1.21
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					case hihat03
					playsound \{hihatpedal02
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.83
								1.58
								2.27
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
							vals = [
								-0.17
								-0.35000002
								-0.35000002
							]
						}}
					default
					playsound \{hihatpedal02
						buss = countoffs
						randomvol = {
							type = randomnorepeatlasttwotype
							vals = [
								0.83
								1.58
								2.27
							]
						}
						randompitch = {
							type = randomnorepeatlasttwotype
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
	wait \{2
		seconds}
	soundevent \{event = medium_crowd_applause}
endscript

script audio_gameplay_fail_song_stop_sounds 
	printf \{channel = sfx
		qs(0xa65f93ed)}
	stopsoundsbybuss \{crowd}
	stopsoundsbybuss \{ui_star_power}
	stopsoundsbybuss \{practice_band_playback}
	stopsoundsbybuss \{wrong_notes_bass}
	stopsoundsbybuss \{wrong_notes_drums}
	stopsoundsbybuss \{wrong_notes_guitar}
	stopsoundsbybuss \{binkcutscenes}
endscript

script audio_gameplay_stop_sounds_for_killsong \{loading_transition = 0}
	printf \{channel = sfx
		qs(0xd5794b7a)}
	setsoundbussparams {`default` = {vol = ($default_bussset.`default`.vol) pitch = 0} time = 0.02}
	setsoundbussparams \{crowd_beds = {
			pitch = 0
		}
		time = 0.02}
	stopsoundevent \{song_intro_kick_sfx}
	stopsoundevent \{audio_ui_gameplay_intro_kick}
	stopsoundevent \{pyro}
	stopsoundevent \{audio_ui_gameplay_ripple_up}
	stopsoundevent \{audio_ui_gameplay_highway_up}
	stopsoundevent \{crowd_fast_surge_cheer}
	stopsoundevent \{medium_crowd_applause}
	stopsoundevent \{audio_star_power_release_front_p1}
	stopsoundevent \{audio_star_power_release_front_p2}
	stopsoundevent \{audio_star_power_deployed_lfe_p1}
	stopsoundevent \{audio_star_power_deployed_front_p1}
	stopsoundevent \{audio_star_power_deployed_back_p1}
	stopsoundevent \{audio_star_power_deployed_front_p2}
	stopsoundevent \{audio_star_power_deployed_back_p2}
	stopsoundevent \{audio_star_power_available_p2}
	stopsoundevent \{audio_star_power_available_p1}
	stopsoundevent \{audio_ui_generic_warning}
	stopsoundevent \{audio_ui_gameplay_ripple_up}
	stopsoundevent \{audio_ui_gameplay_highway_up}
	stopsoundevent \{audio_ui_gameplay_vocal_highway_appear}
	stopsoundevent \{ui_sfx_rewind_highway}
	stopsound \{shredfest_momentum_difficulty_down}
	stopsound \{$g_current_crowd_transition_neutral_to_positive}
	stopsound \{shredfest_player_dropout}
	stopsound \{point_awarded}
	stopsound \{shredfest_momentum_difficulty_up}
	stopsoundevent \{audio_multiplayer_sudden_death_dropped}
	stopsoundevent \{audio_star_power_awarded}
	stopsoundevent \{audio_star_power_awarded_p1}
	stopsoundevent \{audio_star_power_awarded_p2}
	stopsoundevent \{audio_star_power_available}
	stopsoundevent \{audio_star_power_release_front}
	stopsoundevent \{audio_star_power_cheer_deployed}
	stopsoundevent \{audio_star_power_cheer_deployed_p1}
	stopsoundevent \{audio_star_power_cheer_deployed_p2}
	stopsoundevent \{audio_star_power_cheer_deployed_p3}
	stopsoundevent \{$g_current_crowd_clap_normal_soundevent}
	stopsoundevent \{$g_current_crowd_clap_middle_soundevent}
	stopsoundevent \{$g_current_crowd_clap_left_soundevent}
	stopsoundevent \{$g_current_crowd_clap_right_soundevent}
	stopsoundevent \{$g_current_crowd_clap_left_middle_soundevent}
	stopsoundevent \{$g_current_crowd_clap_right_middle_soundevent}
	stopsoundevent \{audio_star_power_deployed_back}
	stopsoundevent \{audio_star_power_deployed_lfe}
	stopsoundevent \{audio_star_power_deployed_front}
	stopsoundsbybuss \{practice_band_playback}
	stopsoundevent \{audio_ui_gameplay_lose_multiplier_2x}
	stopsoundevent \{audio_ui_gameplay_lose_multiplier_3x}
	stopsoundevent \{audio_ui_gameplay_lose_multiplier_4x}
	stopsoundevent \{audio_star_power_deployed_back_p3}
	stopsoundevent \{audio_star_power_deployed_front_p3}
	stopsoundevent \{audio_star_power_available_p3}
	stopsoundevent \{audio_star_power_awarded_p3}
	stopsoundevent \{audio_star_power_release_front_p3}
	stopsoundsbybuss \{drums_ingame}
	stopsoundsbybuss \{drums_jammode}
	stopsoundsbybuss \{guitar_jammode}
	stopsoundsbybuss \{bass_jammode}
	stopsoundsbybuss \{wrong_notes_guitar}
	stopsoundsbybuss \{wrong_notes_bass}
	stopsoundsbybuss \{wrong_notes_drums}
	stopsoundsbybuss \{crowd_one_shots}
	stopsoundsbybuss \{crowd_beds}
	stopsoundsbybuss \{crowd_transitions}
	stopsoundsbybuss \{crowd_cheers}
	stopsoundsbybuss \{sfx}
	stopsoundsbybuss \{countoffs}
	stopsoundevent \{audio_powers_generic_electricity_bolt}
	stopsoundevent \{audio_powers_generic_electricity_bolt_left}
	stopsoundevent \{audio_powers_generic_electricity_bolt_right}
	stopsoundevent \{audio_powers_resurrection_sfx}
	stopsoundevent \{audio_powers_generic_power_up_lvl1}
	stopsoundevent \{audio_powers_generic_power_up_lvl2}
	stopsoundevent \{audio_powers_johnny_power_lvl_1}
	stopsoundevent \{audio_powers_johnny_power_lvl_2}
	stopsoundevent \{audio_powers_judy_power_lvl_1}
	stopsoundevent \{audio_powers_judy_power_lvl_2}
	stopsoundevent \{audio_powers_pandora_power_lvl_1}
	stopsoundevent \{audio_powers_pandora_power_lvl_2}
	stopsoundevent \{audio_powers_axel_power_lvl_1}
	stopsoundevent \{audio_powers_axel_use_resurrection}
	stopsoundevent \{audio_powers_lars_power_lvl_1}
	stopsoundevent \{audio_powers_lars_power_lvl_2}
	stopsoundevent \{audio_powers_axel_power_lvl_1_softer}
	stopsoundevent \{audio_powers_generic_electricity_bolt_softer}
	stopsoundevent \{audio_powers_generic_electricity_bolt_left_softer}
	stopsoundevent \{audio_powers_generic_electricity_bolt_right_softer}
	stopsoundevent \{audio_powers_generic_power_up_lvl1_softer}
	stopsoundevent \{audio_powers_generic_power_up_lvl2_softer}
	stopsoundevent \{audio_powers_johnny_power_lvl_1_softer}
	stopsoundevent \{audio_powers_johnny_power_lvl_2_softer}
	stopsoundevent \{audio_powers_judy_power_lvl_1_softer}
	stopsoundevent \{audio_powers_judy_power_lvl_2_softer}
	stopsoundevent \{audio_powers_lars_power_lvl_1_softer}
	stopsoundevent \{audio_powers_lars_power_lvl_2_softer}
	stopsoundevent \{audio_powers_pandora_power_lvl_1_softer}
	stopsoundevent \{audio_powers_pandora_power_lvl_2_softer}
	stopsoundevent \{endofsong_camera_cheer}
	stopsoundevent \{endofsong_camera_quiet}
	stopsoundevent \{endofsong_camera_softer}
	stopsoundevent \{fb_success_scream}
	stopsoundevent \{z_finalbattle_hita}
	stopsoundevent \{z_finalbattle_hw_attack_drummer}
	stopsoundevent \{z_finalbattle_hw_attack_vocalist}
	stopsoundevent \{z_finalbattle_hw_attack_guitarist}
	stopsoundevent \{z_finalbattle_hw_attack_sword}
	stopsoundevent \{fb_success_part3}
	killspawnedscript \{name = z_finalbattle_fast_restart_wait_then_play_scream_sfx}
	killspawnedscript \{name = audio_play_career_power_up_sfx}
	killspawnedscript \{name = audio_crowd_kill_quiet_crowd_one_shots_fast}
	one_shot_soundevent \{soundevent = audio_crowd_oneshots_do_nothing}
	stopsound \{$g_current_crowd_anticipation}
	if (<type> = normal)
		if (<loading_transition> = 1)
		else
		endif
	endif
endscript

script audio_stopping_sounds_killsong_lite 
	printf \{channel = sfx
		qs(0x70509e68)}
	stopsoundevent \{song_intro_kick_sfx}
	stopsoundevent \{audio_ui_gameplay_intro_kick}
	stopsoundevent \{pyro}
	stopsoundevent \{audio_ui_gameplay_ripple_up}
	stopsoundevent \{audio_ui_gameplay_highway_up}
	stopsoundevent \{crowd_fast_surge_cheer}
	stopsoundevent \{medium_crowd_applause}
	stopsoundevent \{audio_star_power_release_front_p1}
	stopsoundevent \{audio_star_power_release_front_p2}
	stopsoundevent \{audio_star_power_deployed_lfe_p1}
	stopsoundevent \{audio_star_power_deployed_front_p1}
	stopsoundevent \{audio_star_power_deployed_back_p1}
	stopsoundevent \{audio_star_power_deployed_front_p2}
	stopsoundevent \{audio_star_power_deployed_back_p2}
	stopsoundevent \{audio_star_power_available_p2}
	stopsoundevent \{audio_star_power_available_p1}
	stopsoundevent \{audio_ui_generic_warning}
	stopsoundevent \{audio_ui_gameplay_ripple_up}
	stopsoundevent \{audio_ui_gameplay_highway_up}
	stopsoundevent \{audio_ui_gameplay_vocal_highway_appear}
	stopsoundevent \{ui_sfx_rewind_highway}
	stopsound \{shredfest_momentum_difficulty_down}
	stopsound \{$g_current_crowd_transition_neutral_to_positive}
	stopsound \{shredfest_player_dropout}
	stopsound \{point_awarded}
	stopsound \{shredfest_momentum_difficulty_up}
	stopsoundevent \{audio_multiplayer_sudden_death_dropped}
	stopsoundevent \{audio_star_power_awarded}
	stopsoundevent \{audio_star_power_awarded_p1}
	stopsoundevent \{audio_star_power_awarded_p2}
	stopsoundevent \{audio_star_power_available}
	stopsoundevent \{audio_star_power_release_front}
	stopsoundevent \{audio_star_power_cheer_deployed}
	stopsoundevent \{audio_star_power_cheer_deployed_p1}
	stopsoundevent \{audio_star_power_cheer_deployed_p2}
	stopsoundevent \{audio_star_power_cheer_deployed_p3}
	stopsoundevent \{$g_current_crowd_clap_normal_soundevent}
	stopsoundevent \{$g_current_crowd_clap_middle_soundevent}
	stopsoundevent \{$g_current_crowd_clap_left_soundevent}
	stopsoundevent \{$g_current_crowd_clap_right_soundevent}
	stopsoundevent \{$g_current_crowd_clap_left_middle_soundevent}
	stopsoundevent \{$g_current_crowd_clap_right_middle_soundevent}
	stopsoundevent \{audio_star_power_deployed_back}
	stopsoundevent \{audio_star_power_deployed_lfe}
	stopsoundevent \{audio_star_power_deployed_front}
	stopsoundsbybuss \{practice_band_playback}
	stopsoundevent \{audio_ui_gameplay_lose_multiplier_2x}
	stopsoundevent \{audio_ui_gameplay_lose_multiplier_3x}
	stopsoundevent \{audio_ui_gameplay_lose_multiplier_4x}
	stopsoundevent \{audio_star_power_deployed_back_p3}
	stopsoundevent \{audio_star_power_deployed_front_p3}
	stopsoundevent \{audio_star_power_available_p3}
	stopsoundevent \{audio_star_power_awarded_p3}
	stopsoundevent \{audio_star_power_release_front_p3}
	stopsoundsbybuss \{drums_ingame}
	stopsoundsbybuss \{drums_jammode}
	stopsoundsbybuss \{guitar_jammode}
	stopsoundsbybuss \{bass_jammode}
	stopsoundsbybuss \{wrong_notes_guitar}
	stopsoundsbybuss \{wrong_notes_bass}
	stopsoundsbybuss \{wrong_notes_drums}
	stopsoundsbybuss \{sfx}
	stopsoundsbybuss \{countoffs}
	stopsoundevent \{audio_powers_generic_electricity_bolt}
	stopsoundevent \{audio_powers_generic_electricity_bolt_left}
	stopsoundevent \{audio_powers_generic_electricity_bolt_right}
	stopsoundevent \{audio_powers_resurrection_sfx}
	stopsoundevent \{audio_powers_generic_power_up_lvl1}
	stopsoundevent \{audio_powers_generic_power_up_lvl2}
	stopsoundevent \{audio_powers_johnny_power_lvl_1}
	stopsoundevent \{audio_powers_johnny_power_lvl_2}
	stopsoundevent \{audio_powers_judy_power_lvl_1}
	stopsoundevent \{audio_powers_judy_power_lvl_2}
	stopsoundevent \{audio_powers_pandora_power_lvl_1}
	stopsoundevent \{audio_powers_pandora_power_lvl_2}
	stopsoundevent \{audio_powers_axel_power_lvl_1}
	stopsoundevent \{audio_powers_axel_use_resurrection}
	stopsoundevent \{audio_powers_lars_power_lvl_1}
	stopsoundevent \{audio_powers_lars_power_lvl_2}
	stopsoundevent \{audio_powers_axel_power_lvl_1_softer}
	stopsoundevent \{audio_powers_generic_electricity_bolt_softer}
	stopsoundevent \{audio_powers_generic_electricity_bolt_left_softer}
	stopsoundevent \{audio_powers_generic_electricity_bolt_right_softer}
	stopsoundevent \{audio_powers_generic_power_up_lvl1_softer}
	stopsoundevent \{audio_powers_generic_power_up_lvl2_softer}
	stopsoundevent \{audio_powers_johnny_power_lvl_1_softer}
	stopsoundevent \{audio_powers_johnny_power_lvl_2_softer}
	stopsoundevent \{audio_powers_judy_power_lvl_1_softer}
	stopsoundevent \{audio_powers_judy_power_lvl_2_softer}
	stopsoundevent \{audio_powers_lars_power_lvl_1_softer}
	stopsoundevent \{audio_powers_lars_power_lvl_2_softer}
	stopsoundevent \{audio_powers_pandora_power_lvl_1_softer}
	stopsoundevent \{audio_powers_pandora_power_lvl_2_softer}
	stopsoundevent \{endofsong_camera_cheer}
	stopsoundevent \{endofsong_camera_quiet}
	stopsoundevent \{endofsong_camera_softer}
	stopsoundevent \{z_finalbattle_hita}
	stopsoundevent \{z_finalbattle_hw_attack_drummer}
	stopsoundevent \{z_finalbattle_hw_attack_vocalist}
	stopsoundevent \{z_finalbattle_hw_attack_guitarist}
	stopsoundevent \{z_finalbattle_hw_attack_sword}
	stopsoundevent \{fb_success_part3}
	stopsoundevent \{fb_success_scream}
	killspawnedscript \{name = z_finalbattle_fast_restart_wait_then_play_scream_sfx}
	killspawnedscript \{name = audio_play_career_power_up_sfx}
	stopsound \{$g_current_crowd_anticipation}
endscript

script audio_tutorial_tuning_strings 
	switch <note_played>
		case 0
		switch <tutorial_notes_strummed>
			case 1
			playsound \{e_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{e_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{e_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 1
		switch <tutorial_notes_strummed>
			case 1
			playsound \{a_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{a_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{a_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 2
		switch <tutorial_notes_strummed>
			case 1
			playsound \{d_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{d_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{d_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 3
		switch <tutorial_notes_strummed>
			case 1
			playsound \{g_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{g_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{g_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 4
		switch <tutorial_notes_strummed>
			case 1
			playsound \{b_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{b_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{b_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
	endswitch
endscript

script audio_tutorial_hammer_on_lesson_2 
	switch <note_played>
		case 0
		switch <tutorial_notes_strummed>
			case 1
			playsound \{e_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{e_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{e_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 1
		switch <tutorial_notes_strummed>
			case 1
			playsound \{a_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{a_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{a_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 2
		switch <tutorial_notes_strummed>
			case 1
			playsound \{d_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{d_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{d_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 3
		switch <tutorial_notes_strummed>
			case 1
			playsound \{g_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{g_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{g_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
		case 4
		switch <tutorial_notes_strummed>
			case 1
			playsound \{b_tuning
				vol_percent = 90
				pitch_percent = 80
				buss = tutorial_vo}
			case 2
			playsound \{b_tuning
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
			case 3
			playsound \{b_string
				vol_percent = 90
				pitch_percent = 90
				buss = tutorial_vo}
		endswitch
	endswitch
endscript

script audio_tutorial_stop_notes_01 
	if issoundeventplaying \{tutorial_string_1_strum_free}
		setsoundparams \{tutorial_string_1_strum_free
			vol_percent = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_1_strum_free
			vol_percent = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_1_strum_free
			vol_percent = 10}
		stopsoundevent \{tutorial_string_1_strum_free}
	endif
endscript

script audio_tutorial_stop_notes_02 
	if issoundeventplaying \{tutorial_string_2_hopo_free}
		setsoundparams \{tutorial_string_2_hopo_free
			vol_percent = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_2_hopo_free
			vol_percent = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_2_hopo_free
			vol_percent = 10}
		stopsoundevent \{tutorial_string_2_hopo_free}
	endif
endscript

script audio_tutorial_stop_notes_03 
	if issoundeventplaying \{tutorial_string_3_hopo_free}
		setsoundparams \{tutorial_string_3_hopo_free
			vol_percent = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_3_hopo_free
			vol_percent = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_3_hopo_free
			vol_percent = 10}
		stopsoundevent \{tutorial_string_3_hopo_free}
	endif
endscript

script audio_tutorial_stop_notes_04 
	if issoundeventplaying \{tutorial_string_3_strum_free}
		setsoundparams \{tutorial_string_3_strum_free
			vol_percent = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_3_strum_free
			vol_percent = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_3_strum_free
			vol_percent = 10}
		stopsoundevent \{tutorial_string_3_strum_free}
	endif
endscript

script audio_tutorial_stop_notes_05 
	if issoundeventplaying \{tutorial_string_2_hopo_free}
		setsoundparams \{tutorial_string_2_hopo_free
			vol_percent = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_2_hopo_free
			vol_percent = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_2_hopo_free
			vol_percent = 10}
		stopsoundevent \{tutorial_string_2_hopo_free}
	endif
endscript

script audio_tutorial_stop_notes_06 
	if issoundeventplaying \{tutorial_string_1_hopo_free}
		setsoundparams \{tutorial_string_1_hopo_free
			vol_percent = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_1_hopo_free
			vol_percent = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_1_hopo_free
			vol_percent = 10}
		stopsoundevent \{tutorial_string_1_hopo_free}
	endif
endscript

script audio_tutorial_finish_chord_02 
	wait \{1
		seconds}
	soundevent \{event = tutorial_mode_finish_chord}
endscript

script audio_tutorial_finish_chord_03 
	wait \{0.3
		seconds}
	soundevent \{event = tutorial_mode_finish_chord}
endscript

script audio_gameplay_guitar_wrong_note_sound_logic \{vol = 0.0
		pitch = 0.0
		soundasset = `default`
		buss = front_end
		pan1x = 0.0
		pan1y = 0.0
		pan2x = 0.0
		pan2y = 0.0}
	playlist_getcurrentsong
	if arraycontains array = ($g_transformation_dummy_songs) contains = <current_song>
		return
	endif
	getplayerinfo <player> highway_position
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
		if issingleplayergame
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
	getplayerinfo <player> part
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
	playsound <soundasset> vol = <vol> pitch = <pitch> buss = <newbuss> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y> priority = 90 panremovecenter = true
endscript

script audio_ui_play_playlist_scroll_sfx 
	soundevent \{event = audio_ui_setlist_playlist_scroll}
endscript

script audio_ui_play_songlist_scroll_sfx 
	soundevent \{event = audio_ui_setlist_scroll}
endscript

script audio_ui_play_songlist_playlist_switch_sfx 
	soundevent \{event = audio_ui_setlist_switch}
endscript

script audio_ui_play_sort_songlist_sfx 
	ui_sfx \{menustate = setlist
		uitype = select}
endscript

script audio_gameplay_play_revive_or_kill_player_sfx \{player = 1
		vocalist = 0
		cheer = 0}
	audio_gameplay_multiplayer_get_sfx_pan_values player = <player> vocalist = <vocalist>
	transitionevent = $g_current_crowd_transition_neutral_to_positive
	if (<cheer> = 1)
		stopsound \{$g_current_crowd_transition_neutral_to_positive}
		printf \{channel = sfx
			qs(0xacd1e525)}
		playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	else
		stopsound \{shredfest_momentum_difficulty_up}
		printf \{channel = sfx
			qs(0xe1577cb8)}
		playsound shredfest_player_dropout vol = -12.0 buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script audio_gameplay_play_momentum_difficulty_up_sfx 
	audio_gameplay_multiplayer_get_sfx_pan_values player = <player>
	transitionevent = $g_current_crowd_transition_neutral_to_positive
	if NOT issoundplaying \{shredfest_momentum_difficulty_up}
		stopsound \{shredfest_momentum_difficulty_up}
		stopsound \{$g_current_crowd_transition_neutral_to_positive}
		switch <highway_position>
			case left
			printf \{channel = sfx
				qs(0xba999941)}
			playsound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case right
			printf \{channel = sfx
				qs(0x8f7647cd)}
			playsound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case leftcenter
			printf \{channel = sfx
				qs(0x3069704d)}
			playsound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case rightcenter
			printf \{channel = sfx
				qs(0xaac242f0)}
			playsound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case center
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			playsound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal1
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			playsound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal2
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			playsound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal3
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			playsound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal4
			printf \{channel = sfx
				qs(0xd7eabcbd)}
			playsound shredfest_momentum_difficulty_up buss = ui_ingame vol = -13 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			playsound <transitionevent> buss = crowd_transitions vol = -8 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case `default`
			printf \{channel = sfx
				qs(0x578d9ab3)}
		endswitch
	else
		if issoundplaying <transitionevent>
			setsoundparams <transitionevent> pan1x = -1 pan2x = 1 pan1y = 1 pan2y = 1
		endif
		setsoundparams \{shredfest_momentum_difficulty_up
			pan1x = -1
			pan2x = 1
			pan1y = 1
			pan2y = 1}
	endif
endscript

script audio_gameplay_play_momentum_difficulty_down_sfx 
	if NOT issoundplaying \{shredfest_momentum_difficulty_down}
		audio_gameplay_multiplayer_get_sfx_pan_values player = <player>
		switch <highway_position>
			case left
			printf \{channel = sfx
				qs(0x40cf2783)}
			playsound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case right
			printf \{channel = sfx
				qs(0x5a6396dc)}
			playsound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case leftcenter
			printf \{channel = sfx
				qs(0x36d9dc4c)}
			playsound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case rightcenter
			printf \{channel = sfx
				qs(0x6cb99ac2)}
			playsound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case center
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			playsound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal1
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			playsound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal2
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			playsound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal3
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			playsound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocal4
			printf \{channel = sfx
				qs(0x75e7a8fa)}
			playsound shredfest_momentum_difficulty_down buss = ui_ingame vol = -11.5 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case `default`
			printf \{channel = sfx
				qs(0x578d9ab3)}
		endswitch
	else
		setsoundparams \{shredfest_momentum_difficulty_down
			pan1x = -1
			pan2x = 1
			pan1y = 1
			pan2y = 1}
	endif
endscript

script audio_gameplay_play_momentum_plus_attack_sfx 
	audio_gameplay_multiplayer_get_sfx_pan_values player = <player>
	stopsound \{shredfest_momentum_plus_attack}
	<volume> = 2
	switch <highway_position>
		case left
		printf \{channel = sfx
			qs(0xc4e238d1)}
		playsound shredfest_momentum_plus_attack buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case right
		printf \{channel = sfx
			qs(0x5fe620d2)}
		playsound shredfest_momentum_plus_attack buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case leftcenter
		printf \{channel = sfx
			qs(0x5a8df1f1)}
		playsound shredfest_momentum_plus_attack buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case rightcenter
		printf \{channel = sfx
			qs(0x780d7a16)}
		playsound shredfest_momentum_plus_attack buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case center
		printf \{channel = sfx
			qs(0xc9669648)}
		playsound shredfest_momentum_plus_attack buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case vocal1
		printf \{channel = sfx
			qs(0xc9669648)}
		playsound shredfest_momentum_plus_attack buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case vocal2
		printf \{channel = sfx
			qs(0xc9669648)}
		playsound shredfest_momentum_plus_attack buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case vocal3
		printf \{channel = sfx
			qs(0xc9669648)}
		playsound shredfest_momentum_plus_attack buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case vocal4
		printf \{channel = sfx
			qs(0xc9669648)}
		playsound shredfest_momentum_plus_attack buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case `default`
		printf \{channel = sfx
			qs(0x578d9ab3)}
	endswitch
endscript

script audio_gameplay_play_momentum_plus_blocked_sfx 
	audio_gameplay_multiplayer_get_sfx_pan_values player = <player>
	stopsound \{shredfest_momentum_plus_attack_blocked}
	<volume> = 2
	switch <highway_position>
		case left
		printf \{channel = sfx
			qs(0x01749d5f)}
		playsound shredfest_momentum_plus_attack_blocked buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case right
		printf \{channel = sfx
			qs(0x5c5a07e6)}
		playsound shredfest_momentum_plus_attack_blocked buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case leftcenter
		printf \{channel = sfx
			qs(0x6db4e5ac)}
		playsound shredfest_momentum_plus_attack_blocked buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case rightcenter
		printf \{channel = sfx
			qs(0x6dc2ba4b)}
		playsound shredfest_momentum_plus_attack_blocked buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case center
		printf \{channel = sfx
			qs(0xd746d368)}
		playsound shredfest_momentum_plus_attack_blocked buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case vocal1
		printf \{channel = sfx
			qs(0xd746d368)}
		playsound shredfest_momentum_plus_attack_blocked buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case vocal2
		printf \{channel = sfx
			qs(0xd746d368)}
		playsound shredfest_momentum_plus_attack_blocked buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case vocal3
		printf \{channel = sfx
			qs(0xd746d368)}
		playsound shredfest_momentum_plus_attack_blocked buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case vocal4
		printf \{channel = sfx
			qs(0xd746d368)}
		playsound shredfest_momentum_plus_attack_blocked buss = ui_ingame vol = <volume> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		case `default`
		printf \{channel = sfx
			qs(0x578d9ab3)}
	endswitch
endscript

script audio_gameplay_elimination_sfx_logic 
	if NOT issoundplaying \{shredfest_player_dropout}
		audio_gameplay_multiplayer_get_sfx_pan_values player = <player>
		switch <highway_position>
			case left
			printf \{channel = sfx
				qs(0x28e32290)}
			playsound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case right
			printf \{channel = sfx
				qs(0x4be64bed)}
			playsound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case leftcenter
			printf \{channel = sfx
				qs(0x8ed28fe0)}
			playsound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case rightcenter
			printf \{channel = sfx
				qs(0x9c69d162)}
			playsound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case center
			printf \{channel = sfx
				qs(0x4bd810a4)}
			playsound shredfest_player_dropout buss = ui_ingame vol = -15 pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case `default`
			printf \{channel = sfx
				qs(0xdb59d86c)}
		endswitch
	else
		setsoundparams \{shredfest_player_dropout
			pan1x = -1
			pan2x = 1
			pan1y = 1
			pan2y = 1}
	endif
endscript

script audio_ui_play_cast_vote_sfx 
	switch <option>
		case 0
		soundevent \{event = gameplay_vote_hell_sfx}
		case 1
		soundevent \{event = gameplay_vote_heaven_sfx}
		default
		printf \{channel = sfx
			qs(0x8f74c921)}
	endswitch
endscript

script audio_ui_play_kill_voting_screen_sfx 
	if issoundeventplaying \{vote_hell_crowd_swell}
		stopsoundevent \{vote_hell_crowd_swell}
	endif
	if issoundeventplaying \{vote_heaven_crowd_swell}
		stopsoundevent \{vote_heaven_crowd_swell}
	endif
	if issoundeventplaying \{vote_tie_crowd_swell}
		stopsoundevent \{vote_tie_crowd_swell}
	endif
endscript

script audio_ui_voting_screen_timer 
	spawnscriptnow \{audio_gameplay_counter_play_beep_spawn
		params = {
			time = 2.5
		}}
	wait \{2.5
		seconds}
	killspawnedscript \{name = audio_gameplay_counter_play_beep_spawn}
endscript

script audio_ui_play_tie_breaker_sfx 
	printf channel = sfx qs(0x00c56ec0) s = <count>
	volume = -25
	pluspitch = -1.0
	switch <count>
		case 1
		playsound menu_gameplay_spin vol = <volume> pitch = (1.0 + <pluspitch>) buss = front_end
		case 2
		playsound menu_gameplay_spin vol = <volume> pitch = (1.05 + <pluspitch>) buss = front_end
		case 3
		playsound menu_gameplay_spin vol = <volume> pitch = (1.1 + <pluspitch>) buss = front_end
		case 4
		playsound menu_gameplay_spin vol = <volume> pitch = (1.15 + <pluspitch>) buss = front_end
		case 5
		playsound menu_gameplay_spin vol = <volume> pitch = (1.1 + <pluspitch>) buss = front_end
		case 6
		playsound menu_gameplay_spin vol = <volume> pitch = (1.0 + <pluspitch>) buss = front_end
		case 7
		playsound menu_gameplay_spin vol = <volume> pitch = (0.9 + <pluspitch>) buss = front_end
		case 8
		playsound menu_gameplay_spin vol = <volume> pitch = (0.75 + <pluspitch>) buss = front_end
		case 9
		playsound menu_gameplay_spin vol = <volume> pitch = (0.65000004 + <pluspitch>) buss = front_end
		case 10
		playsound menu_gameplay_spin vol = <volume> pitch = (0.5 + <pluspitch>) buss = front_end
		case 11
		playsound menu_gameplay_spin vol = <volume> pitch = (0.4 + <pluspitch>) buss = front_end
		case 12
		playsound menu_gameplay_spin vol = <volume> pitch = (0.3 + <pluspitch>) buss = front_end
		case 13
		playsound menu_gameplay_spin vol = <volume> pitch = (0.25 + <pluspitch>) buss = front_end
		case 14
		playsound menu_gameplay_spin vol = <volume> pitch = (0.2 + <pluspitch>) buss = front_end
		case 15
		playsound menu_gameplay_spin vol = <volume> pitch = (0.16 + <pluspitch>) buss = front_end
		case 16
		playsound menu_gameplay_spin vol = <volume> pitch = (0.14 + <pluspitch>) buss = front_end
		case 17
		playsound menu_gameplay_spin vol = <volume> pitch = (0.120000005 + <pluspitch>) buss = front_end
		default
		playsound menu_gameplay_spin vol = <volume> pitch = 0.120000005 buss = front_end
		printf \{channel = sfx
			qs(0x9716a790)}
	endswitch
endscript

script audio_ui_play_voting_outcome_result_sfx 
	switch <winner>
		case 0
		soundevent \{event = vote_hell_crowd_swell}
		case 1
		soundevent \{event = vote_heaven_crowd_swell}
		case 2
		soundevent \{event = vote_tie_crowd_swell}
		default
		printf \{channel = sfx
			qs(0x8e2e0ea8)}
	endswitch
endscript

script audio_gameplay_spawned_point_awarded_waiting \{pan_wide = 0}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{channel = sfx
		qs(0x046b774e)}
	if (<pan_wide> = 1)
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
	else
		audio_gameplay_multiplayer_get_sfx_pan_values player = <player>
	endif
	wait \{0.08
		seconds}
	playsound point_awarded vol = -11 buss = ui_ingame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script audio_gameplay_spawned_point_awarded_perfectionist_sfx \{pan_wide = 0}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{channel = sfx
		qs(0x046b774e)}
	if (<pan_wide> = 1)
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
	else
		audio_gameplay_multiplayer_get_sfx_pan_values player = <player>
	endif
	playsound point_awarded vol = -11 buss = ui_ingame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script audio_ui_play_switch_teams_sfx \{type = request
		direction = left}
	request_vol = -8
	resend_vol = -8
	if gotparam \{type}
		switch <type>
			case request
			switch <direction>
				case left
				playsound team_switch_request vol = <request_vol> buss = front_end pan1x = -1 pan1y = 1 pan2x = -0.25 pan2y = 1
				case right
				playsound team_switch_request vol = <request_vol> buss = front_end pan1x = 0.25 pan1y = 1 pan2x = 1 pan2y = 1
				default
				playsound team_switch_request vol = <request_vol> buss = front_end pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1
			endswitch
			case resend
			switch <direction>
				case left
				playsound team_switch_resend vol = <resend_vol> buss = front_end pan1x = -1 pan1y = 1 pan2x = -0.25 pan2y = 1
				case right
				playsound team_switch_resend vol = <resend_vol> buss = front_end pan1x = 0.25 pan1y = 1 pan2x = 1 pan2y = 1
				default
				playsound team_switch_resend vol = <resend_vol> buss = front_end pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1
			endswitch
			case swap
			soundevent \{event = audio_ui_online_team_switch}
			default
			printf \{channel = sfx
				qs(0x4e2b9495)}
		endswitch
	endif
endscript

script audio_ui_play_car_scroll_widget_sfx 
	setspawnedscriptnorepeatfor \{time = 0.07}
	playsound car_widget_scroll vol = -10 pitch_percent = ((<fill_perc> * 6.0) + 90) buss = front_end
endscript

script audio_ui_play_highway_ripple_sfx 
	if (<type> = freeplay)
		if NOT playerinfoequals <player> freeplay_state = dropped
			if NOT playerinfoequals <player> part = vocals
				soundevent \{event = audio_ui_gameplay_ripple_up}
			endif
		endif
	else
		if NOT playerinfoequals <player> part = vocals
			soundevent \{event = audio_ui_gameplay_ripple_up}
		endif
	endif
endscript

script audio_ui_play_unlock_item_sfx 
	soundevent \{event = audio_ui_song_complete_unlock_item}
endscript

script testtonesoundevent \{type = `default`}
	printf channel = sfx qs(0x7a0099b8) s = <type>
	switch <type>
		case guitar
		printf \{channel = sfx
			qs(0x3d4d753d)}
		playsound \{testtones_guitar
			buss = master}
		case bass
		printf \{channel = sfx
			qs(0x3d4d753d)}
		playsound \{testtones_bass
			buss = master}
		case kick
		printf \{channel = sfx
			qs(0x3d4d753d)}
		playsound \{testtones_kickdrum
			buss = master}
		case snare
		printf \{channel = sfx
			qs(0x3d4d753d)}
		playsound \{testtones_snaredrum
			buss = master}
		case tom
		printf \{channel = sfx
			qs(0x3d4d753d)}
		playsound \{testtones_toms
			buss = master}
		case cymbal
		printf \{channel = sfx
			qs(0x3d4d753d)}
		playsound \{testtones_cymbals
			buss = master}
		case vox
		printf \{channel = sfx
			qs(0x982ddb54)}
		playsound \{testtones_vocals
			buss = master}
		case band
		printf \{channel = sfx
			qs(0x3d4d753d)}
		playsound \{testtones_band
			buss = master}
		case crowd
		printf \{channel = sfx
			qs(0x3d4d753d)}
		playsound \{testtones_crowd
			buss = master}
		default
		printf channel = sfx qs(0x7a0099b8) s = <type>
	endswitch
endscript

script audio_play_pink_noise_loop_for_calibrate_lag_screen 
	playsound \{pinknoise_minnus_20
		buss = `default`
		vol = -70
		num_loops = -1}
endscript

script audio_stop_pink_noise_loop_for_calibrate_lag_screen 
	stopsound \{pinknoise_minnus_20}
endscript

script testtoneenterscript 
	setsoundbussparams {sfx_balance = {vol = (($default_bussset.sfx_balance.vol) - 100)}}
endscript

script testtoneexitscript 
	setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)}}
endscript

script audio_muting_test_setup_script 
	setsoundbussparams \{ui = {
			vol = -100.0
		}}
	change \{crowd_debug_mode = 1}
endscript

script audio_sync_test_disable_highway 
	disable_bg_viewport
	change \{g_save_check_time_early = $check_time_early}
	change \{g_save_check_time_late = $check_time_late}
	change \{check_time_early = 1.0}
	change \{check_time_late = 1.0}
endscript

script audio_sync_test_enable_highway 
	enable_bg_viewport
	change \{check_time_early = $g_save_check_time_early}
	change \{check_time_late = $g_save_check_time_late}
endscript

script audio_profiling_fmod_effects 
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

script audio_gameplay_star_power_deployed_logic \{player = 1}
	printf \{channel = sfx
		qs(0x1731e460)}
	getplayerinfo <player> highway_position
	getpakmancurrentname \{map = zones}
	printf channel = sfx qs(0x39116743) s = <highway_position>
	if NOT issoundplaying \{star_deployed_back}
		printf \{channel = sfx
			qs(0x33be8dbf)}
		if (<highway_position> = left)
			printf \{channel = sfx
				qs(0x0c362bcf)}
			soundevent \{event = audio_star_power_deployed_lfe_p1}
			soundevent \{event = audio_star_power_deployed_back_p1}
			soundevent \{event = audio_star_power_deployed_front_p1}
			soundevent \{event = audio_star_power_cheer_deployed_p1}
		else
			if (<highway_position> = right)
				printf \{channel = sfx
					qs(0xe7802ff6)}
				soundevent \{event = audio_star_power_deployed_lfe_p1}
				soundevent \{event = audio_star_power_deployed_back_p2}
				soundevent \{event = audio_star_power_deployed_front_p2}
				soundevent \{event = audio_star_power_cheer_deployed_p2}
			else
				printf \{channel = sfx
					qs(0x21730a2e)}
				soundevent \{event = audio_star_power_deployed_lfe_p1}
				soundevent \{event = audio_star_power_deployed_back_p3}
				soundevent \{event = audio_star_power_deployed_front_p3}
				soundevent \{event = audio_star_power_cheer_deployed_p3}
			endif
		endif
		printf \{channel = sfx
			qs(0x5c01b82f)}
		change \{g_star_power_deployed_flag = 1}
		wait \{0.9
			seconds}
		printf \{channel = sfx
			qs(0x682127d4)}
		change \{g_star_power_deployed_flag = 0}
	else
		printf \{channel = sfx
			qs(0x2ee2205e)}
		if ($g_star_power_deployed_flag = 1)
			printf \{channel = sfx
				qs(0x7320b431)}
			setsoundparams \{star_deployed_front
				pan1x = -1
				pan1y = 1
				pan2x = 1
				pan2y = 1}
			setsoundparams \{star_deployed_back
				pan1x = -1
				pan1y = 1
				pan2x = 1
				pan2y = -1}
			setsoundparams \{sp_cheer1
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
				soundevent \{event = audio_star_power_deployed_lfe_p1}
				soundevent \{event = audio_star_power_deployed_back_p1}
				soundevent \{event = audio_star_power_deployed_front_p1}
				soundevent \{event = audio_star_power_cheer_deployed_p1}
			else
				if (<highway_position> = right)
					printf \{channel = sfx
						qs(0xe7802ff6)}
					soundevent \{event = audio_star_power_deployed_lfe_p1}
					soundevent \{event = audio_star_power_deployed_back_p2}
					soundevent \{event = audio_star_power_deployed_front_p2}
					soundevent \{event = audio_star_power_cheer_deployed_p2}
				else
					printf \{channel = sfx
						qs(0x21730a2e)}
					soundevent \{event = audio_star_power_deployed_lfe_p1}
					soundevent \{event = audio_star_power_deployed_back_p3}
					soundevent \{event = audio_star_power_deployed_front_p3}
					soundevent \{event = audio_star_power_cheer_deployed_p3}
				endif
			endif
		endif
	endif
endscript

script audio_gameplay_star_power_ready_logic \{player = 1}
	getplayerinfo <player> highway_position
	if NOT issoundplaying \{star_available}
		if (<highway_position> = left)
			soundevent \{event = audio_star_power_available_p1}
		elseif (<highway_position> = right)
			soundevent \{event = audio_star_power_available_p2}
		else
			soundevent \{event = audio_star_power_available_p3}
		endif
		change \{g_star_power_ready_flag = 1}
		wait \{0.9
			second}
		change \{g_star_power_ready_flag = 0}
	else
		if ($g_star_power_ready_flag = 1)
			setsoundparams \{star_available
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				soundevent \{event = audio_star_power_available_p1}
			elseif (<highway_position> = right)
				soundevent \{event = audio_star_power_available_p2}
			else
				soundevent \{event = audio_star_power_available_p3}
			endif
		endif
	endif
endscript

script audio_gameplay_star_power_awarded_logic \{player = 1}
	getplayerinfo <player> highway_position
	if NOT issoundplaying \{sp_awarded1}
		if (<highway_position> = left)
			soundevent \{event = audio_star_power_awarded_p1}
		elseif (<highway_position> = right)
			soundevent \{event = audio_star_power_awarded_p2}
		else
			soundevent \{event = audio_star_power_awarded_p3}
		endif
		change \{g_star_power_awarded_flag = 1}
		wait \{0.3
			second}
		change \{g_star_power_awarded_flag = 0}
	else
		if ($g_star_power_awarded_flag = 1)
			setsoundparams \{sp_awarded1
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				soundevent \{event = audio_star_power_awarded_p1}
			elseif (<highway_position> = right)
				soundevent \{event = audio_star_power_awarded_p2}
			else
				soundevent \{event = audio_star_power_awarded_p3}
			endif
		endif
	endif
endscript

script audio_gameplay_star_power_release_logic \{player = 1}
	getplayerinfo <player> highway_position
	if NOT issoundplaying \{star_release_front}
		if (<highway_position> = left)
			soundevent \{event = audio_star_power_release_front_p1}
		elseif (<highway_position> = right)
			soundevent \{event = audio_star_power_release_front_p2}
		else
			soundevent \{event = audio_star_power_release_front_p3}
		endif
		change \{g_star_power_deployed_flag = 1}
		wait \{0.9
			second}
		change \{g_star_power_deployed_flag = 0}
	else
		if ($g_star_power_deployed_flag = 1)
			setsoundparams \{star_release_front
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
			setsoundparams \{star_release_center
				pan1x = 0.2392232
				pan1y = 0.97096455}
		else
			if (<highway_position> = left)
				soundevent \{event = audio_star_power_release_front_p1}
			elseif (<highway_position> = right)
				soundevent \{event = audio_star_power_release_front_p2}
			else
				soundevent \{event = audio_star_power_release_front_p3}
			endif
		endif
	endif
endscript

script audio_crowd_stop_all_cheering_sounds 
	stopsoundevent \{$g_current_crowd_swell_short_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$g_current_crowd_applause_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$g_current_crowd_swell_short_soft_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$g_current_crowd_swell_med_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$g_current_crowd_swell_long_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	change \{g_turn_off_oneshot_cheers = 1}
	wait \{8
		seconds}
	change \{g_turn_off_oneshot_cheers = 0}
endscript

script audio_crowd_fading_claps 
	change \{g_clap_fade = 1}
	setsoundbussparams \{crowd_star_power = {
			vol = -100
		}
		time = 5}
	wait \{5
		seconds}
	change \{g_clap_fade = 0}
	change \{g_star_clap_left = 0}
	change \{g_star_clap_right = 0}
	change \{g_star_clap_left_middle = 0}
	change \{g_star_clap_right_middle = 0}
	change \{g_star_clap_middle = 0}
	change \{g_star_clap_normal = 0}
	stopsoundsbybuss \{crowd_star_power}
	setsoundbussparams {crowd_star_power = {vol = ($default_bussset.crowd_star_power.vol)} time = 0.1}
endscript

script audio_crowd_kill_clap_fade 
	killspawnedscript \{name = audio_crowd_fading_claps}
	setsoundbussparams {crowd_star_power = {vol = ($default_bussset.crowd_star_power.vol)} time = 0.1}
endscript

script audio_crowd_star_power_clap_panning \{player = 1}
	if NOT issingleplayergame
		getplayerinfo <player> highway_position
		if (<highway_position> = left)
			change \{g_star_clap_left = 1}
			change \{g_star_clap_right = 0}
			change \{g_star_clap_left_middle = 0}
			change \{g_star_clap_right_middle = 0}
			change \{g_star_clap_middle = 0}
			change \{g_star_clap_normal = 0}
			change \{g_star_clap_leftcenterright = 0}
		elseif (<highway_position> = right)
			change \{g_star_clap_right = 1}
			change \{g_star_clap_left = 0}
			change \{g_star_clap_left_middle = 0}
			change \{g_star_clap_right_middle = 0}
			change \{g_star_clap_middle = 0}
			change \{g_star_clap_normal = 0}
			change \{g_star_clap_leftcenterright = 0}
		else
			change \{g_star_clap_middle = 1}
			change \{g_star_clap_left = 0}
			change \{g_star_clap_right = 0}
			change \{g_star_clap_left_middle = 0}
			change \{g_star_clap_right_middle = 0}
			change \{g_star_clap_normal = 0}
			change \{g_star_clap_leftcenterright = 0}
		endif
	else
		change \{g_star_clap_normal = 1}
		change \{g_star_clap_left = 0}
		change \{g_star_clap_right = 0}
		change \{g_star_clap_left_middle = 0}
		change \{g_star_clap_right_middle = 0}
		change \{g_star_clap_middle = 0}
		change \{g_star_clap_leftcenterright = 0}
	endif
endscript

script audio_crowd_star_power_clap_panning_multiple \{player = 1}
	printf \{channel = sfx
		qs(0xea38b5f9)}
	if NOT issingleplayergame
		printf \{channel = sfx
			qs(0x7bf0f48c)}
		getplayerinfo <player> highway_position
		printf channel = sfx qs(0x197ff74a) s = <highway_position>
		if (<highway_position> = left)
			if (($g_star_clap_right = 1))
				change \{g_star_clap_normal = 1}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_right_middle = 1)
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 1}
			elseif ($g_star_clap_middle = 1)
				change \{g_star_clap_left_middle = 1}
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			endif
		elseif (<highway_position> = right)
			if (($g_star_clap_left = 1))
				change \{g_star_clap_normal = 1}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_left_middle = 1)
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 1}
			elseif ($g_star_clap_middle = 1)
				change \{g_star_clap_right_middle = 1}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			endif
		else
			if ($g_star_clap_left = 1)
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 1}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_right = 1)
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 1}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_normal = 1)
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 1}
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

script audio_crowd_end_star_clap \{player = 1}
	if NOT issingleplayergame
		getplayerinfo <player> highway_position
		if (<highway_position> = left)
			if (($g_star_clap_left_middle = 1))
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 1}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_normal = 1)
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 1}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_leftcenterright = 1)
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_right_middle = 1}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			endif
		elseif (<highway_position> = right)
			if (($g_star_clap_right_middle = 1))
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 1}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_normal = 1)
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 1}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_leftcenterright = 1)
				change \{g_star_clap_left_middle = 1}
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			endif
		else
			if ($g_star_clap_left_middle = 1)
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 1}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_right_middle = 1)
				change \{g_star_clap_normal = 0}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 1}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			elseif ($g_star_clap_leftcenterright = 1)
				change \{g_star_clap_normal = 1}
				change \{g_star_clap_left = 0}
				change \{g_star_clap_right = 0}
				change \{g_star_clap_left_middle = 0}
				change \{g_star_clap_right_middle = 0}
				change \{g_star_clap_middle = 0}
				change \{g_star_clap_leftcenterright = 0}
			endif
		endif
	endif
endscript

script start_auto_calibrate_looping_sound 
endscript

script stop_auto_calibrate_looping_sound 
endscript

script fire_off_one_shot_blip 
endscript

script run_through_auto_audio_lag_calibration 
endscript

script audio_jam_play_metronome_sfx 
	setspawnedscriptnorepeatfor \{time = 0.1}
	setspawninstancelimits \{max = 2
		management = kill_oldest}
	if gotparam \{downbeat}
		if (<downbeat> = 1)
			playsound stickclickmed buss = practice_band_playback vol = RandomFloat (12.5, 13.0)
		endif
	else
		playsound stickclickmed buss = practice_band_playback vol = RandomFloat (7.5, 8.0)
	endif
endscript

script audio_ui_menu_music_se 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{channel = sfx
		qs(0x44f09774)}
	getarraysize \{$menu_music_songs}
	begin
	getrandomvalue name = index integer a = 0 b = (<array_size> -1)
	if NOT (<index> = $g_menu_music_last_song_index)
		if NOT (<index> = $g_menu_music_last_last_song_index)
			if NOT (<index> = $g_menu_music_last_last_last_song_index)
				if NOT (<index> = $g_menu_music_last_last_last_last_song_index)
					change \{g_menu_music_last_last_last_last_song_index = $g_menu_music_last_song_index}
					change \{g_menu_music_last_last_last_song_index = $g_menu_music_last_song_index}
					change \{g_menu_music_last_last_song_index = $g_menu_music_last_song_index}
					change g_menu_music_last_song_index = <index>
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
	if ($g_menu_music_map_screen = 1)
		printf \{channel = sfx
			qs(0xe911e28a)}
		killspawnedscript \{name = stop_menu_ambience_then_kill_spawned_script}
		printf \{channel = sfx
			qs(0xd998edbc)}
		killspawnedscript \{name = audio_ui_menu_ambience_sfx_spawn}
		printf \{channel = sfx
			qs(0xd4dd7ef6)}
		spawnscriptnow \{audio_ui_menu_ambience_sfx_spawn}
		if ($g_menu_music_ambient_hack = 1)
			<stream> = Random (
				@ gh6_menu_music_proto_1
				@*2 gh6_menu_music_proto_2
				@*2 gh6_menu_music_proto_3
				@*2 gh6_menu_music_proto_4
				@*2 gh6_menu_music_proto_5
				)
			printf channel = sfx qs(0xa29f6899) s = <stream>
			change \{g_menu_music_ambient_hack = 0}
		else
			<stream> = gh6_menu_music_proto_1
		endif
		switch <stream>
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
		<stream> = fb_power_select_screen_music
		vol = -6
	endif
	spawnscriptnow audio_ui_menu_music_se_spawned params = {stream = <stream> array = <array> delay = <delay> vol = <vol> offset = <offset>}
endscript

script audio_ui_menu_music_se_spawned \{vol = 0}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	change \{g_menu_music_preloading = 1}
	change g_menu_music_stream = <stream>
	preloadstream <stream>
	begin
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
	startpreloadedstream <unique_id> buss = music_frontend forcesafepreload = 1 vol = (<vol> + 2.5) pan1x = -1 pan1y = 0.7 pan2x = 1 pan2y = 0.7
	change \{g_menu_music_preloading = 0}
	change g_current_menu_song = <stream>
	if globalexists name = <array> type = array
		if (<delay> > 0.0)
			wait <delay> seconds
		endif
		getarraysize $<array>
		index = 0
		getstarttime
		<starttime> = (<starttime> + <offset>)
		pulse = 1
		begin
		begin
		getelapsedtime starttime = <starttime>
		if (<elapsedtime> >= $<array> [<index>])
			break
		endif
		wait \{1
			gameframe}
		repeat
		formattext checksumname = event 'frontend_speaker_pulse%d' d = <pulse>
		broadcastevent type = <event>
		<pulse> = (3 - <pulse>)
		<index> = (<index> + 1)
		repeat <array_size>
	endif
endscript

script audio_ui_kill_menu_music 
	printf \{channel = sfx
		qs(0x1ec63c36)}
	killspawnedscript \{name = audio_ui_menu_music_se_spawned}
	change \{g_menu_music_preloading = 0}
	stopsound \{$g_menu_music_stream
		fade_time = 1.0
		fade_type = linear}
	audio_ui_kill_menu_ambience_sfx
endscript

script stop_all_menu_music_streams_in_order_to_change_states 
	killspawnedscript \{name = audio_ui_menu_music_on}
	killspawnedscript \{name = audio_ui_menu_music_on_spawned}
	change \{g_menu_music_on_flag = 0}
	killspawnedscript \{name = audio_ui_menu_music_se}
	killspawnedscript \{name = audio_ui_menu_music_se_spawned}
	change \{g_menu_music_preloading = 0}
	stopsound \{$g_menu_music_stream
		fade_time = 1.0
		fade_type = linear}
	audio_ui_kill_menu_ambience_sfx
endscript

script audio_ui_enter_quest_map 
	change \{g_menu_music_map_screen = 1}
	change \{g_menu_music_ambient_hack = 1}
	stop_all_menu_music_streams_in_order_to_change_states
endscript

script audio_ui_exit_quest_map 
	printf \{channel = sfx
		qs(0x075fb6f3)}
	change \{g_menu_music_map_screen = 0}
	change \{g_menu_music_ambient_hack = 0}
	stop_all_menu_music_streams_in_order_to_change_states
	audio_ui_menu_music_on
endscript

script audio_ui_enter_band_select 
	printf \{channel = sfx
		qs(0xec055e5d)}
	change \{g_menu_music_band_select_screen = 1}
	stop_all_menu_music_streams_in_order_to_change_states
	audio_ui_menu_music_on
endscript

script audio_ui_exit_band_select 
	printf \{channel = sfx
		qs(0x7ec15a74)}
	change \{g_menu_music_band_select_screen = 0}
	stop_all_menu_music_streams_in_order_to_change_states
	audio_ui_menu_music_on
endscript

script audio_ui_menu_ambience_sfx_spawn 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	wait RandomNoRepeat (@ 8.0 @ 8.5 @ 9.0 @ 9.5 @ 10.0 )seconds
	soundevent \{event = audio_ui_main_menu_ambience}
	repeat
endscript

script stop_menu_ambience_then_kill_spawned_script 
	printf \{channel = sfx
		qs(0xed430806)}
	stopsoundevent \{audio_ui_main_menu_ambience
		fade_time = 0.7
		fade_type = log_slow}
	wait \{0.7
		seconds}
	printf \{channel = sfx
		qs(0xe8e4ad76)}
	killspawnedscript \{name = audio_ui_menu_ambience_sfx_spawn}
endscript

script audio_ui_kill_menu_ambience_sfx 
	spawnscriptnow \{stop_menu_ambience_then_kill_spawned_script}
endscript

script audio_crowd_anticipation_logic 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gamemode_gettype
	if NOT ((<type> = freeplay) || (<type> = tutorial) || $in_sing_a_long = true)
		if ($current_crowd >= 1.3399999)
			if issoundplaying \{$g_current_crowd_anticipation}
				stopsound \{$g_current_crowd_anticipation
					fade_time = 3
					fade_type = linear}
			endif
		elseif ($current_crowd >= 1.3)
			if issoundplaying \{$g_current_crowd_anticipation}
				setsoundparams \{$g_current_crowd_anticipation
					vol = 3
					pitch = 0.3
					time = 0.5}
			else
				playsound \{$g_current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					priority = 100
					buss = crowd_beds
					attack_length = 1
					decay_length = 1
					release_length = 1
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2700001)
			if issoundplaying \{$g_current_crowd_anticipation}
				setsoundparams \{$g_current_crowd_anticipation
					vol = 1
					pitch = 0.2
					time = 0.5}
			else
				playsound \{$g_current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					priority = 100
					buss = crowd_beds
					attack_length = 1
					decay_length = 1
					release_length = 1
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.25)
			if issoundplaying \{$g_current_crowd_anticipation}
				setsoundparams \{$g_current_crowd_anticipation
					vol = -1
					pitch = 0.1
					time = 0.5}
			else
				playsound \{$g_current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					priority = 100
					buss = crowd_beds
					attack_length = 1
					decay_length = 1
					release_length = 1
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2)
			if NOT issoundplaying \{$g_current_crowd_anticipation}
				playsound \{$g_current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					priority = 100
					buss = crowd_beds
					attack_length = 1
					decay_length = 1
					release_length = 1
					attack_function = log_fast
					num_loops = -1}
			else
				setsoundparams \{$g_current_crowd_anticipation
					vol = -3
					time = 0.5}
			endif
		else
			if issoundplaying \{$g_current_crowd_anticipation}
				stopsound \{$g_current_crowd_anticipation
					fade_time = 3
					fade_type = linear}
			endif
		endif
	endif
endscript

script audio_crowd_anticipation_flag_logic 
endscript

script audio_crowd_play_one_shots_between_songs 
	setspawnedscriptnorepeatfor \{time = 0.1}
	setspawninstancelimits \{max = 2
		management = ignore_spawn_request}
	begin
	soundevent \{event = $g_current_crowd_whistle_soundevent}
	wait (RandomFloat (0.1, 1.2)) seconds
	repeat
endscript

script audio_crowd_play_surge_between_songs 
	setspawnedscriptnorepeatfor \{time = 0.1}
	setspawninstancelimits \{max = 2
		management = kill_oldest}
	begin
	soundevent \{event = $g_current_crowd_oneshot_positive_soundevent}
	wait (RandomFloat (0.3, 1.2)) seconds
	repeat
endscript

script audio_crowd_kill_surging_scripts 
	wait \{2
		seconds}
	killspawnedscript \{name = audio_crowd_play_one_shots_between_songs}
	killspawnedscript \{name = audio_crowd_play_surge_between_songs}
endscript

script audio_crowd_play_surge_after_explosion 
	wait \{2
		seconds}
	soundevent \{event = $g_current_crowd_swell_med_soundevent}
endscript

script audio_crowd_play_cheer_before_explosion 
	wait \{1
		second}
	soundevent \{event = $g_current_crowd_swell_short_soundevent}
endscript

script audio_ui_play_colorwheel_up_down_sfx 
	printstruct <...>
	if gotparam \{current_ring}
		switch <current_ring>
			case 1
			soundevent \{event = audio_ui_car_colorwheel_highlight_1}
			case 2
			soundevent \{event = audio_ui_car_colorwheel_highlight_2}
			case 3
			soundevent \{event = audio_ui_car_colorwheel_highlight_3}
			case 4
			soundevent \{event = audio_ui_car_colorwheel_highlight_4}
			case 5
			soundevent \{event = audio_ui_car_colorwheel_highlight_5}
		endswitch
	endif
endscript

script audio_crowd_play_loading_screen_swell 
endscript

script audio_crowd_kill_surging_scripts_faster 
	killspawnedscript \{name = audio_crowd_play_one_shots_between_songs}
	killspawnedscript \{name = audio_crowd_play_surge_between_songs}
endscript

script audio_crowd_loading_whistle 
endscript

script audio_crowd_metalfest_intro 
	wait \{1
		second}
	soundevent \{event = $g_current_crowd_swell_med_soundevent}
	wait \{1
		second}
	soundevent \{event = $g_current_crowd_swell_short_soundevent}
	wait \{1
		second}
	soundevent \{event = $g_current_crowd_swell_long_soundevent}
	wait \{1
		second}
	audio_crowd_kill_surging_scripts
endscript

script audio_ui_jam_ghtunes_scroll_pan 
	setspawnedscriptnorepeatfor \{time = 0.01}
	setspawninstancelimits \{max = 6
		management = kill_oldest}
	sfx_pan = (<sfx_pan> * 0.1)
	playsound ghtunes_menu_scroll vol = -2 pitch = 4 pan1x = <sfx_pan> pan1y = 1.0
endscript

script audio_null_sound 
endscript

script audio_ui_jam_play_ghmix_scroll_sfx 
	if gotparam \{adv_record}
		soundevent \{event = audio_ui_ghtunes_scroll}
	else
		if gotparam \{up}
			ui_sfx \{params = {
					menustate = ghmix
					uitype = scrollup
				}}
		else
			ui_sfx \{params = {
					menustate = ghmix
					uitype = scrolldown
				}}
		endif
	endif
endscript

script audio_ui_jam_play_ghtunes_scroll_sfx 
	soundevent \{event = audio_ui_ghtunes_scroll}
endscript

script audio_animevent_play_win_lose_sound \{skip = 0}
	obj_getid
	i = 1
	if NOT ($g_dont_play_win_anim_sfx = 1)
		begin
		if playerinfoequals <i> band_member = <objid>
			getplayerinfo <i> part
			skip = 1
			break
		endif
		i = (<i> + 1)
		repeat 5
		if NOT (<skip> = 1)
			switch <objid>
				case guitarist
				part = guitar
				case bassist
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
		getpakmancurrent \{map = zones}
		if gotparam \{event}
			switch <event>
				case mic_feedback
				soundevent \{event = audio_winloseanims_mic_feedback}
				case mic_grab
				soundevent \{event = audio_winloseanims_mic_grab}
				case mic_hit
				soundevent \{event = audio_winloseanims_mic_hit}
				case drummer_sticks_throw
				soundevent \{event = audio_winloseanims_sticks_throw}
				case large_smash
				if gotparam \{part}
					switch <part>
						case bass
						soundevent \{event = audio_winloseanims_large_bass_smash}
						case guitar
						soundevent \{event = audio_winloseanims_large_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case medium_smash
				if gotparam \{part}
					switch <part>
						case bass
						soundevent \{event = audio_winloseanims_medium_bass_smash}
						case guitar
						soundevent \{event = audio_winloseanims_medium_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case small_smash
				if gotparam \{part}
					switch <part>
						case bass
						soundevent \{event = audio_winloseanims_small_bass_smash}
						case guitar
						soundevent \{event = audio_winloseanims_small_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case drummer_tom_hit
				soundevent \{event = audio_winloseanims_tom_hit}
				case drummer_snare_hit
				soundevent \{event = audio_winloseanims_snare_hit}
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
		soundevent \{event = gameplay_vote_countdown}
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
	soundevent \{event = gameplay_vote_countdown}
	wait (0.07 + <count_x>) seconds
	count_x = (<count_x> * 0.85)
	repeat
endscript

script audio_gameplay_counter_play_beep \{time = 10}
	spawnscriptnow audio_gameplay_counter_play_beep_spawn params = {time = <time>}
	wait <time> seconds
	killspawnedscript \{name = audio_gameplay_counter_play_beep_spawn}
endscript

script audio_audiooptions_stop_dolby_digital_sounds 
	if issoundeventplaying \{audio_ui_audio_options_dolby_off}
		stopsoundevent \{audio_ui_audio_options_dolby_off
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

script audio_gameplay_vocal_sidechain 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf channel = sfx qs(0xc4a9a039) s = <player>
	change \{g_stop_vocal_sidechain = 0}
	g_global_rms_value = 0
	begin
	if ($g_stop_vocal_sidechain = 1)
		break
	endif
	if NOT scriptisrunning \{fretbar_update_tempo}
		break
	endif
	vocals_getcuramplitude player = <player>
	if gotparam \{current_amplitude}
		change g_global_rms_value = (($g_global_rms_value + <current_amplitude>) / 2)
		if ($g_global_rms_value < 0.5)
			setsoundbussparams {vocals_balance = {vol = ($default_bussset.vocals_balance.vol)} time = 0.1}
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
	wait \{3
		gameframe}
	repeat
endscript

script audio_gameplay_vocal_sidechain_logic 
	if (<muting> = false)
		change \{g_stop_vocal_sidechain = 0}
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
				if scriptisrunning \{audio_gameplay_vocal_sidechain}
					killspawnedscript \{name = audio_gameplay_vocal_sidechain}
				endif
			else
				spawnscriptnow audio_gameplay_vocal_sidechain params = {player = <player>}
			endif
		else
			spawnscriptnow audio_gameplay_vocal_sidechain params = {player = <player>}
			spawnscriptnow audio_gameplay_detect_phoneme params = {player = <player>}
		endif
	else
		change \{g_stop_vocal_sidechain = 1}
	endif
endscript

script audio_effects_set_effects_by_venue_type \{time = 1}
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	if scriptexists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'nothing'
	endif
	printf channel = sfx qs(0x817bfec0) s = <pakname>
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		printf \{channel = sfx
			qs(0x40b15020)}
		switch <venuesize>
			case large_ext
			setsoundbusseffects effects = [{name = venueverb $large_ext_reverb}] time = <time>
			case large_int
			setsoundbusseffects effects = [{name = venueverb $large_int_reverb}] time = <time>
			case medium_int
			setsoundbusseffects effects = [{name = venueverb $medium_int_reverb}] time = <time>
			case medium_ext
			setsoundbusseffects effects = [{name = venueverb $medium_ext_reverb}] time = <time>
			case small_int
			setsoundbusseffects effects = [{name = venueverb $small_int_reverb}] time = <time>
			case small_ext
			setsoundbusseffects effects = [{name = venueverb $small_ext_reverb}] time = <time>
			default
			setsoundbusseffects effects = [{name = venueverb $medium_int_reverb}] time = <time>
		endswitch
	else
		printf \{channel = sfx
			qs(0xc391b4fa)}
		setsoundbusseffects effects = [{name = venueverb $no_crowd_reverb}] time = <time>
	endif
endscript

script audio_ui_outro_stars_logic 
	stream = none
	vol = 0
	wait_time = 0
	switch <num_stars>
		case 1
		stream = outro_one_star
		vol = -3.5
		wait_time = 0
		case 2
		stream = outro_two_stars
		vol = -3.5
		wait_time = 0.1
		case 3
		stream = outro_three_stars
		vol = -3.5
		wait_time = 0.03
		case 4
		stream = outro_four_stars
		vol = -3.5
		wait_time = 0.08
		case 5
		stream = outro_five_stars
		vol = -3.5
		wait_time = 0.08
		case 6
		stream = outro_six_stars
		vol = -2.5
		wait_time = 0.15
		default
		stream = outro_one_star
		vol = -3.5
	endswitch
	preloadstream <stream>
	begin
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
	spawnscriptnow audio_ui_spawning_outro_stars params = {<...>}
endscript

script audio_ui_spawning_outro_stars 
	wait <wait_time> seconds
	printf channel = sfx qs(0x9231b06a) s = <vol>
	startpreloadedstream <unique_id> buss = front_end forcesafepreload = 1 vol = <vol>
endscript

script audio_ui_kill_outro_stars 
	killspawnedscript \{name = audio_ui_spawning_outro_stars}
	stopsound \{outro_one_star}
	stopsound \{outro_two_stars}
	stopsound \{outro_three_stars}
	stopsound \{outro_four_stars}
	stopsound \{outro_five_stars}
	stopsound \{outro_six_stars}
endscript

script audio_song_break_down_whoosh \{whoosh = 1
		delay = 0.0}
	wait <delay> seconds
	switch <whoosh>
		case 1
		playsound \{song_break_down_whoosh_01
			vol = -3.0
			buss = front_end}
		case 2
		playsound \{song_break_down_whoosh_02
			vol = -5.0
			buss = front_end}
		default
		printf \{channel = sfx
			qs(0xa711cb5d)}
	endswitch
endscript

script audio_crowd_kill_only_one_shots 
	one_shot_soundevent \{soundevent = audio_crowd_oneshots_do_nothing}
endscript

script audio_ui_gameplay_play_camera_win_sfx 
	soundevent \{event = audio_ui_song_complete_camera_movement}
	soundevent \{event = endofsong_camera_cheer}
endscript

script audio_crowd_play_swells_during_stats_screen 
endscript

script audio_ui_kill_menu_music_slowly 
	killspawnedscript \{name = audio_ui_menu_music_on}
	killspawnedscript \{name = audio_ui_menu_music_on_spawned}
	change \{g_menu_music_on_flag = 0}
	killspawnedscript \{name = audio_ui_menu_music_se}
	killspawnedscript \{name = audio_ui_menu_music_se_spawned}
	change \{g_menu_music_preloading = 0}
	stopsound \{$g_menu_music_stream
		fade_time = 1.5
		fade_type = linear}
	audio_ui_kill_menu_ambience_sfx
endscript

script audio_cutscene_get_vol_tweak_of_preloaded_stream \{streamname = `default`}
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
		case 'Pandora_Outro'
		case 'Lars_Outro'
		case 'Casey_Outro'
		case 'Axel_Outro'
		case 'Map_Intro'
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
		case 'Rush_Outro'
		volumetweak = 7
		case 'Map_Unlock_2nd_Tier'
		wait \{1
			second}
		volumetweak = 5
		case 'UI_Band_Chosen'
		case 'UI_Band_Choose'
		volumetweak = 0
		case 'UI_Demigod_Complete'
		volumetweak = 3
		default
		volumetweak = -3
		printf channel = sfx qs(0x92919cd1) s = <volumetweak>
	endswitch
	printf channel = sfx qs(0x40a231ed) s = <volumetweak>
	return volumetweak = <volumetweak>
endscript

script audio_ui_gameplay_play_you_rock_sfx 
	soundevent \{event = you_rock_front}
	soundevent \{event = you_rock_back}
	soundevent \{event = you_rock_lfe}
	wait \{2
		seconds}
	soundevent \{event = $g_current_crowd_swell_short_soundevent}
	soundevent \{event = $g_current_crowd_swell_med_soundevent}
	soundevent \{event = $g_current_crowd_applause_soundevent}
endscript

script audio_crowd_fail_song_logic 
	printf \{channel = sfx
		qs(0x1c27b1a9)}
	sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
		fadeintime = 10
		fadeintype = linear
		fadeouttime = 10
		fadeouttype = linear}
	spawnscriptnow \{audio_crowd_neutral_crowd_wait_to_lower_stats}
	printf \{channel = sfx
		qs(0x85e2e392)}
	spawnscriptnow \{audio_crowd_play_swells_during_stats_screen}
endscript

script audio_crowd_game_start_cheer 
	if ($g_not_start_of_game = 0)
		printf \{channel = sfx
			qs(0x9e96eedb)}
		spawnscriptnow \{sfx_backgrounds_new_area
			params = {
				bg_sfx_area = $g_current_crowd_looping_bg_area_good
				fadeintime = 10.0
				fadeintype = linear
			}}
		wait \{8
			seconds}
		setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) -10) pitch = 0.0} time = 20}
		wait \{2.5
			second}
		soundevent \{event = beginning_crowd_swell}
		change \{g_not_start_of_game = 1}
	endif
endscript

script audio_crowd_play_surge_from_main_menu_to_freeplay 
	wait \{1
		seconds}
	soundevent \{event = surge_from_main_to_freeplay}
endscript

script audio_crowd_play_intro_applause_and_swell 
	getpakmancurrentname \{map = zones}
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		gamemode_gettype
		if NOT (<type> = tutorial || <type> = freeplay || $calibrate_lag_enabled = 1)
			soundevent \{event = $g_current_crowd_applause_soundevent}
			soundevent \{event = $g_current_crowd_swell_short_soundevent}
			if issoundplaying \{silence_front_end_crowd_loop_ft}
				if ((<type> = competitive))
					printf \{channel = sfx
						qs(0x96fcdc42)}
					sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
						fadeintime = 2.0
						fadeintype = linear
						fadeouttime = 2
						fadeouttype = linear}
					one_shot_soundevent \{soundevent = $g_current_crowd_oneshot_positive_soundevent
						waittime = 5}
				else
					sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
						fadeintime = 2.0
						fadeintype = linear
						fadeouttime = 2
						fadeouttype = linear}
					one_shot_soundevent \{soundevent = $g_current_crowd_oneshot_positive_soundevent
						waittime = 5}
				endif
			endif
		endif
	endif
endscript

script audio_crowd_play_intro_applause_and_swell_fast 
	getpakmancurrentname \{map = zones}
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		gamemode_gettype
		if NOT (<type> = tutorial || <type> = freeplay || $calibrate_lag_enabled = 1)
			soundevent \{event = $g_current_crowd_applause_soundevent}
			soundevent \{event = $g_current_crowd_swell_short_soundevent}
			if issoundplaying \{silence_front_end_crowd_loop_ft}
				if ((<type> = competitive))
					printf \{channel = sfx
						qs(0x2826d0c9)}
					sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
						fadeintime = 2.0
						fadeintype = linear
						fadeouttime = 2
						fadeouttype = linear}
					one_shot_soundevent \{soundevent = $g_current_crowd_oneshot_positive_soundevent
						waittime = 5}
				else
					sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
						fadeintime = 2.0
						fadeintype = linear
						fadeouttime = 2
						fadeouttype = linear}
					one_shot_soundevent \{soundevent = $g_current_crowd_oneshot_positive_soundevent
						waittime = 5}
				endif
			endif
		endif
	endif
endscript

script audio_practice_fade_in_drums 
	setsoundbussparams {practicemode_drums = {vol = (($default_bussset.practicemode_drums.vol) - 100)}}
	wait \{3.5
		seconds}
	setsoundbussparams {practicemode_drums = {vol = (($default_bussset.practicemode_drums.vol))} time = 3.5}
endscript

script audio_practice_fade_out_drums 
	setsoundbussparams {practicemode_drums = {vol = (($default_bussset.practicemode_drums.vol) - 100)} time = 2.0}
endscript

script audio_crowd_neutral_crowd_wait_to_lower_stats 
	setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) -20) pitch = 0.0} time = 7}
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
	stopsoundevent \{audio_crowd_lg_ext_oneshot_positive}
	stopsoundevent \{audio_crowd_lg_int_oneshot_positive}
	stopsoundevent \{audio_crowd_md_ext_oneshot_positive}
	stopsoundevent \{audio_crowd_md_ext_oneshot_positive_01}
	stopsoundevent \{audio_crowd_md_int_oneshot_positive}
	stopsoundevent \{audio_crowd_sm_ext_oneshot_positive}
	stopsoundevent \{audio_crowd_sm_int_oneshot_positive}
	stopsoundevent \{audio_crowd_lg_ext_oneshot_negative}
	stopsoundevent \{audio_crowd_lg_int_oneshot_negative}
	stopsoundevent \{audio_crowd_md_ext_oneshot_negative}
	stopsoundevent \{audio_crowd_md_int_oneshot_negative}
	stopsoundevent \{audio_crowd_sm_ext_oneshot_negative}
	stopsoundevent \{audio_crowd_sm_int_oneshot_negative}
	killspawnedscript \{name = audio_crowd_kill_quiet_crowd_one_shots_fast}
endscript

script audio_gameplay_effects_update_vocal_echo 
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
			change g_current_echo_bpm = <tempo>
			vocaldspsetparams effect = echo delay = <echotime> wetmix = 0.25
		endif
	endif
endscript

script ui_sfx 
	printscriptinfo \{'UI_SFX'
		channel = sfx}
	if NOT gotparam \{menustate}
		menustate = generic
		printf \{channel = sfx
			qs(0x2790bc50)}
	endif
	if NOT gotparam \{uitype}
		uitype = select
		printf \{channel = sfx
			qs(0xf070c84f)}
	endif
	printf channel = sfx qs(0xf996531a) s = <menustate> p = <uitype>
	if gotparam \{mode}
		if (<mode> = music_store)
			menustate = musicstore
		else
			menustate = setlist
		endif
	endif
	if ($disable_menu_sounds = 0)
		if gotparam \{menustate}
			switch <menustate>
				case generic
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_generic_select}
						case back
						soundevent \{event = audio_ui_generic_back}
						case scrollup
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollleft
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollright
						soundevent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						soundevent \{event = audio_ui_generic_select}
						case selectalt2
						soundevent \{event = audio_ui_generic_select}
						case toggleon
						soundevent \{event = audio_ui_generic_box_check}
						case toggleoff
						soundevent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						soundevent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						soundevent \{event = audio_ui_generic_scroll_end}
						case animatein
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						soundevent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						soundevent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						soundevent \{event = audio_ui_text_entry_scroll_down}
						case warningmessage
						if issoundeventplaying \{jm_menu_back}
							stopsoundevent \{jm_menu_back
								fade_type = log_slow
								fade_time = 0.001}
						endif
						soundevent \{event = audio_ui_generic_warning}
						case complete
						soundevent \{event = audio_ui_setlist_complete}
						soundevent \{event = audio_ui_setlist_complete_guitar}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case audio_options
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_audio_options_select}
						case back
						soundevent \{event = audio_ui_audio_options_back}
						case scrollup
						soundevent \{event = audio_ui_audio_options_scroll}
						case scrolldown
						soundevent \{event = audio_ui_audio_options_scroll}
						case scrollleft
						soundevent \{event = audio_ui_audio_options_scroll}
						case scrollright
						soundevent \{event = audio_ui_audio_options_scroll}
						case selectalt1
						soundevent \{event = audio_ui_generic_select}
						case selectalt2
						soundevent \{event = audio_ui_generic_select}
						case toggleon
						soundevent \{event = audio_ui_audio_options_eq_on}
						case toggleoff
						soundevent \{event = audio_ui_audio_options_eq_off}
						case negativeselect
						soundevent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						soundevent \{event = audio_ui_generic_scroll_end}
						case animatein
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						soundevent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						soundevent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						soundevent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case career_map
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_career_map_select_sound}
						case back
						soundevent \{event = audio_career_map_back_sound}
						case scrollup
						soundevent \{event = audio_career_map_scroll_sound}
						case scrolldown
						soundevent \{event = audio_career_map_scroll_sound}
						case scrollleft
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollright
						soundevent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						soundevent \{event = audio_ui_generic_select}
						case selectalt2
						soundevent \{event = audio_ui_generic_select}
						case toggleon
						soundevent \{event = audio_ui_generic_box_check}
						case toggleoff
						soundevent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						soundevent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						soundevent \{event = audio_ui_generic_scroll_end}
						case animatein
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						soundevent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						soundevent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						soundevent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case jammode
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_jam_select}
						case back
						soundevent \{event = audio_ui_jam_back}
						case scrollup
						soundevent \{event = audio_ui_jam_scroll}
						case scrolldown
						soundevent \{event = audio_ui_jam_scroll}
						case scrollleft
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollright
						soundevent \{event = audio_ui_generic_scroll_downs}
						case selectalt1
						soundevent \{event = audio_ui_generic_select}
						case selectalt2
						soundevent \{event = audio_ui_generic_select}
						case toggleon
						soundevent \{event = audio_ui_generic_box_check}
						case toggleoff
						soundevent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						soundevent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						soundevent \{event = audio_ui_generic_scroll_end}
						case toggle
						soundevent \{event = audio_ui_setlist_switch}
						case animatein
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						soundevent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						soundevent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						soundevent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case freeplay
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_generic_select}
						case back
						soundevent \{event = audio_ui_generic_back}
						case scrollup
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollleft
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollright
						soundevent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						soundevent \{event = audio_ui_generic_select}
						case selectalt2
						soundevent \{event = audio_ui_generic_select}
						case toggleon
						soundevent \{event = audio_ui_generic_box_check}
						case toggleoff
						soundevent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						soundevent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						soundevent \{event = audio_ui_generic_scroll_end}
						case toggle
						soundevent \{event = audio_ui_setlist_switch}
						case animatein
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						soundevent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						soundevent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						soundevent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case setlist
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_setlist_select}
						case back
						soundevent \{event = audio_ui_setlist_back}
						case scrollup
						soundevent \{event = audio_ui_setlist_scroll}
						case scrolldown
						soundevent \{event = audio_ui_setlist_scroll}
						case scrollleft
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollright
						soundevent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						soundevent \{event = audio_ui_generic_select}
						case selectalt2
						soundevent \{event = audio_ui_generic_select}
						case toggleon
						soundevent \{event = audio_ui_generic_box_check}
						case toggleoff
						soundevent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						soundevent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						soundevent \{event = audio_ui_generic_scroll_end}
						case toggle
						soundevent \{event = audio_ui_setlist_switch}
						case animatein
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						soundevent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						soundevent \{event = audio_ui_text_entry_scroll_up}
						case complete
						soundevent \{event = audio_ui_setlist_complete}
						soundevent \{event = audio_ui_setlist_complete_guitar}
						case remove
						soundevent \{event = audio_ui_setlist_remove}
						case switchtostore
						soundevent \{event = audio_ui_setlist_music_store_select}
						case addtoplaylist
						soundevent \{event = audio_ui_setlist_add_to_playlist}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case musicstore
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_generic_select}
						case back
						soundevent \{event = audio_ui_generic_back}
						case scrollup
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollleft
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollright
						soundevent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						soundevent \{event = audio_ui_generic_select}
						case selectalt2
						soundevent \{event = audio_ui_generic_select}
						case toggleon
						soundevent \{event = audio_ui_generic_box_check}
						case toggleoff
						soundevent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						soundevent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						soundevent \{event = audio_ui_generic_scroll_end}
						case toggle
						soundevent \{event = audio_ui_setlist_switch}
						case animatein
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						soundevent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						soundevent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						soundevent \{event = audio_ui_text_entry_scroll_down}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case leaderboard
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_leaderboard_select}
						case back
						soundevent \{event = audio_ui_leaderboard_back}
						case scrollup
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollupbig
						soundevent \{event = audio_ui_leaderboard_scroll_big}
						case scrolldownbig
						soundevent \{event = audio_ui_leaderboard_scroll_big}
						case toggleon
						soundevent \{event = audio_ui_generic_box_check}
						case negativeselect
						soundevent \{event = audio_ui_band_lobby_negative_select}
						case stats_on
						soundevent \{event = audio_ui_song_stats_open}
						case stats_off
						soundevent \{event = audio_ui_song_stats_close}
						default
						printf \{channel = sfx
							qs(0x4f3a153b)}
					endswitch
				endif
				case car
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_generic_select}
						case back
						soundevent \{event = audio_ui_generic_back}
						case scrollup
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrolldown
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollleft
						soundevent \{event = audio_ui_generic_scroll_up}
						case scrollright
						soundevent \{event = audio_ui_generic_scroll_down}
						case selectalt1
						soundevent \{event = audio_ui_generic_select}
						case selectalt2
						soundevent \{event = audio_ui_generic_select}
						case toggleon
						soundevent \{event = audio_ui_generic_box_check}
						case toggleoff
						soundevent \{event = audio_ui_generic_box_uncheck}
						case negativeselect
						soundevent \{event = audio_ui_generic_negative_select}
						case scrollendwarning
						soundevent \{event = audio_ui_generic_scroll_end}
						case toggle
						soundevent \{event = audio_ui_setlist_switch}
						case animatein
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case animateout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerazoomin
						soundevent \{event = audio_ui_car_zoom_in}
						case camerazoomout
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case camerarotate
						soundevent \{event = audio_ui_song_complete_camera_movement}
						case slidermoveup
						soundevent \{event = audio_ui_text_entry_scroll_up}
						case slidermovedown
						soundevent \{event = audio_ui_text_entry_scroll_down}
						case popup
						soundevent \{event = audio_ui_generic_popup}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case calibrate
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_generic_select}
						case back
						soundevent \{event = audio_ui_generic_back}
						case scrollup
						soundevent \{event = audio_calibrate_scroll_up}
						case scrolldown
						soundevent \{event = audio_calibrate_scroll_down}
						default
						printf \{channel = sfx
							qs(0xb1fefd92)}
					endswitch
				endif
				case rewards
				if gotparam \{uitype}
					switch <uitype>
						case select
						spawnscriptnow \{audio_wait_to_play_unlock_sfx}
						case award
						soundevent \{event = audio_ui_song_complete_unlock_new_item}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case transformationinfo
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_career_map_select_sound}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case songcomplete
				if gotparam \{uitype}
					switch <uitype>
						case animatein
						soundevent \{event = audio_ui_song_complete_menu_in}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case gamerules
				if gotparam \{uitype}
					switch <uitype>
						case toggleon
						soundevent \{event = audio_ui_song_stats_open}
						case toggleoff
						soundevent \{event = audio_ui_song_stats_close}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case universalpopup
				if gotparam \{uitype}
					switch <uitype>
						case animatein
						soundevent \{event = audio_ui_universal_popup_text_animate_in}
						case select
						soundevent \{event = audio_ui_generic_popup}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case questgiglist
				if gotparam \{uitype}
					switch <uitype>
						case animatein
						soundevent \{event = audio_ui_quest_giglist_animate_in}
						soundevent \{event = audio_ui_quest_giglist_animate_in_2}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case recruitwarrior
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_recruit_warrior_select}
						case back
						soundevent \{event = audio_ui_recruit_warrior_back}
						case scrollup
						soundevent \{event = audio_ui_recruit_warrior_scroll}
						case scrolldown
						soundevent \{event = audio_ui_recruit_warrior_scroll}
						case complete
						soundevent \{event = audio_ui_setlist_complete}
						soundevent \{event = audio_ui_setlist_complete_guitar}
						case remove
						soundevent \{event = audio_ui_recruit_warrior_remove}
						case addtoplaylist
						soundevent \{event = audio_ui_recruit_warrior_add_to_playlist}
						default
						printf \{channel = sfx
							qs(0x4dc65b79)}
					endswitch
				endif
				case friendfeed
				if gotparam \{uitype}
					switch <uitype>
						case select
						soundevent \{event = audio_ui_generic_select}
						case negativeselect
						soundevent \{event = audio_ui_generic_negative_select}
						case animateinslide
						soundevent \{event = audio_ui_friend_feed_animate_in_slide}
						case animateoutslide
						soundevent \{event = audio_ui_friend_feed_animate_out_slide}
						case animateopen
						ui_event_get_top
						if (<base_name> = 'mainmenu')
							soundevent \{event = audio_ui_friend_feed_animate_in_open}
						else
							setsoundbussparams \{music_setlist = {
									vol = -3
								}
								time = 1}
							soundevent \{event = audio_ui_friend_feed_animate_in_open}
							setsoundparams \{friend_feed_animate_in_open
								vol = -4.5}
						endif
						case animateclose
						ui_event_get_top
						if (<base_name> = 'mainmenu')
							soundevent \{event = audio_ui_friend_feed_animate_out_close}
						else
							setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)} time = 1}
							soundevent \{event = audio_ui_friend_feed_animate_out_close}
							setsoundparams \{friend_feed_animate_out_close
								vol = -5.5}
						endif
						case scrollup
						soundevent \{event = audio_ui_friend_feed_scroll}
						case scrolldown
						soundevent \{event = audio_ui_friend_feed_scroll}
						case gotogameplay
						soundevent \{event = audio_ui_setlist_complete}
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
	if gotparam \{play_text_whoosh}
		soundevent \{event = audio_ui_rewards_quest_text_animate_in}
		wait \{0.2
			seconds}
		stopsoundevent \{audio_ui_rewards_quest_text_animate_in
			fade_type = linear
			fade_time = 0.5}
	else
		wait \{0.6
			seconds}
		ui_sfx \{menustate = rewards
			uitype = select}
	endif
endscript

script audio_set_microphone_eq 
	if (<effect> = on)
		printf \{channel = sfx
			qs(0xc8691231)}
		vocaldspsetparams \{effect = nxmultibandeq
			band1_filter_type = parameq
			band1_freq = 1100
			band1_gain = -9
			band1_q = 1.75
			band1_order = 1
			band2_filter_type = highshelf
			band2_freq = 2500
			band2_gain = 6
			band2_q = 0.7
			band2_order = 1}
	else
		printf \{channel = sfx
			qs(0xc3f75a5d)}
		vocaldspsetparams \{effect = nxmultibandeq
			name = vocal_eq
			band1_filter_type = none
			band1_order = 1
			band2_filter_type = none
			band2_order = 1}
	endif
endscript

script audio_ui_band_lobby_sfx_logic \{player_num = 2}
	setspawninstancelimits \{max = 6
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
	if gotparam \{up}
		printf \{channel = sfx
			qs(0x33228a6e)}
		stopsound \{band_lobby_scroll
			fade_time = 0.1
			fade_type = linear}
		playsound band_lobby_scroll vol = -16 pitch = 0.08 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{down}
		printf \{channel = sfx
			qs(0x603e66a7)}
		stopsound \{band_lobby_scroll
			fade_time = 0.1
			fade_type = linear}
		playsound band_lobby_scroll vol = -16 pitch = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{choose}
		printf \{channel = sfx
			qs(0x03d77756)}
		stopsound \{lobbyselecta
			fade_time = 0.2
			fade_type = linear}
		playsound lobbyselecta vol = -6 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		stopsound \{lobbyback06}
	endif
	if gotparam \{back}
		printf \{channel = sfx
			qs(0x3e573add)}
		stopsound \{lobbyback06
			fade_time = 0.2
			fade_type = linear}
		playsound lobbyback06 vol = -6 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{generic_back}
		printf \{channel = sfx
			qs(0xffb7ef45)}
		stopsound \{lobbyselecta
			fade_time = 0.05
			fade_type = linear}
		stopsound \{lobbyback06
			fade_time = 0.05
			fade_type = linear}
		soundevent \{event = audio_ui_generic_back}
	endif
	if gotparam \{error}
		printf \{channel = sfx
			qs(0x6504f146)}
		stopsound \{lobbyback0
			fade_time = 0.1
			fade_type = linear6}
		stopsound \{menu_select_negative
			fade_time = 0.1
			fade_type = linear}
		playsound menu_select_negative vol = -8 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{toggleon}
		printf \{channel = sfx
			qs(0x1ef25b2d)}
		stopsound \{lobbyback06
			fade_time = 0.1
			fade_type = linear}
		stopsound \{lobbyselecta
			fade_time = 0.1
			fade_type = linear}
		playsound checkbox_check_sfx pitch = 0 vol = -8.929999 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{toggleoff}
		printf \{channel = sfx
			qs(0x2a8028af)}
		stopsound \{lobbyback06
			fade_time = 0.1
			fade_type = linear}
		stopsound \{lobbyselecta
			fade_time = 0.1
			fade_type = linear}
		playsound checkbox_uncheck_sfx pitch = 0 vol = -8.929999 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script audio_options_crowd_fader_loop 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	if ($g_audio_options_crowd_fader_state = looping)
		soundevent \{event = audio_ui_audio_options_crowd}
	else
		stopsoundevent \{audio_ui_audio_options_crowd
			fade_time = 0.3
			fade_type = linear}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script audio_crowd_jam_ghtunes_adjust_crowd_from_track_levels 
	<db_per_tick> = 2
	<scale_amount> = 0.75
	<center_vol> = 8
	<track_vol> = 0.0
	getarraysize ($jam_tracks)
	i = 0
	begin
	gettracksize track = ($jam_tracks [<i>].id)
	if (<track_size> > 0)
		gettrackinfo track = ($jam_tracks [<i>].id)
		<track_vol> = (<track_vol> + <volume>)
	else
		<track_vol> = (<track_vol> + 0.0)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<average_vol> = (<track_vol> / <array_size>)
	<vol_adjustment> = ((<average_vol> - <center_vol>) * <db_per_tick>)
	<vol_scale> = (<vol_adjustment> * <scale_amount>)
	<vol_scale> = (<vol_scale> - 4)
	setsoundbussparams {sfx_balance = {vol = (($default_bussset.sfx_balance.vol) + <vol_scale>)} time = 1.0}
	setsoundbussparams {crowd = {vol = (($game_bussset.crowd.vol) + <vol_scale>)} time = 1.0}
endscript

script audio_gameplay_check_song_rms 
	gamemode_gettype
	playlist_getcurrentsong
	<songname> = <current_song>
	get_song_prefix song = <current_song>
	get_song_struct song = <current_song>
	<oldarraynum> = -1
	songfilemanager func = get_song_end_time song_name = <current_song>
	setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)} time = 0.01}
	change \{g_current_vol_crowd_amount = 0.5}
	change \{g_current_vol_sfx_amount = 0.5}
	<center_rms> = -18
	<vol_offset> = (<song_struct>.overall_song_volume)
	getrmsdata song_prefix = <song_prefix> song = <songname>
	if (<array_size> > 0)
		if NOT (<current_song> = jamsession || $game_mode = practice)
			spawnscriptnow \{audio_gameplay_look_for_song_end}
			spawnscriptnow audio_gameplay_find_song_start_end_triggers params = {<...>}
			begin
			getsongtimems
			casttointeger \{time}
			<arraynum> = (<time> / 50)
			if NOT (<arraynum> > <array_size> || <time> > (<total_end_time> - 50))
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
							change \{g_current_vol_sfx_amount = 0.2}
							change \{g_current_vol_crowd_amount = 0.25}
						else
							change \{g_current_vol_sfx_amount = 0.7}
							change \{g_current_vol_crowd_amount = 0.6}
						endif
						<scaleamountsfx> = $g_current_vol_sfx_amount
						<scaleamountcrowd> = $g_current_vol_crowd_amount
						<scalevolsfx> = ((<rmsvalue> - <center_rms>) * <scaleamountsfx>)
						<scalevolcrowd> = ((<rmsvalue> - <center_rms>) * <scaleamountcrowd>)
						if ($rmsdebugprinttoscreen = 1)
							formattext textname = my_text qs(0x721d3088) n = <scalevolsfx> dontassertforchecksums
							create_panel_message {text = <my_text>
								pos = (100.0, 30.0)
								rgba = [255 255 255 255]
								font_face = fontgrid_text_a3
								time = 180000
								just = [left left]
								id = sfx_rms_panel_message
							}
							formattext textname = my_text qs(0x8059f7fa) n = <scalevolcrowd> dontassertforchecksums
							create_panel_message {text = <my_text>
								pos = (100.0, 60.0)
								rgba = [255 255 255 255]
								font_face = fontgrid_text_a3
								time = 180000
								just = [left left]
								id = crowd_rms_panel_message
							}
						endif
						setsoundbussparams {sfx = {vol = (($default_bussset.sfx.vol) + <scalevolsfx>)} time = 0.05}
						setsoundbussparams {crowd = {vol = (($game_bussset.crowd.vol) + <scalevolcrowd>)} time = 1.0}
						wait \{2
							gameframes}
					else
						wait \{2
							gameframes}
					endif
				else
					wait \{1
						gameframe}
				endif
			else
				setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)} time = 0.5}
				killspawnedscript \{name = audio_gameplay_look_for_song_end}
				break
			endif
			<oldarraynum> = <arraynum>
			repeat
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
		getsongtimems
		<song_time_ms> = <time>
		if (<current_intensity> < 0)
			change \{g_current_vol_crowd_amount = 0.0}
			break
		endif
		if (<song_time_ms> > <seconds_before>)
			change g_current_vol_crowd_amount = <current_intensity>
			current_intensity = (<current_intensity> - <i>)
			printf channel = sfx qs(0x010a461a) s = <current_intensity>
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script audio_gameplay_kill_check_rms 
	gamemode_gettype
	killspawnedscript \{name = audio_gameplay_look_for_song_end}
	killspawnedscript \{name = audio_gameplay_check_song_rms}
	setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)} time = 0.2}
	if (<type> = competitive)
		spawnscriptnow \{audio_waiting_for_crowd_to_fade}
	elseif (<type> = career)
		spawnscriptnow \{audio_waiting_for_crowd_to_fade}
	else
		setsoundbussparams {crowd = {vol = ($game_bussset.crowd.vol)} time = 1.0}
	endif
endscript

script audio_gameplay_detect_phoneme 
endscript

script audio_gameplay_call_rms 
	if ($g_prototypes_off = 0)
		getplayeraudiodata \{player_number = 1
			is_local = 1
			part = `default`}
		printf channel = sfx qs(0x71507b77) s = <rms_db>
	endif
endscript

script audio_gameplay_find_song_start_end_triggers 
endscript

script audio_gameplay_wait_to_play_song_start_trigger 
endscript

script audio_gameplay_wait_to_play_song_end_trigger 
endscript

script audio_effects_create_dynamic_effects 
endscript

script audio_effects_change_dynamic_effects 
endscript

script audio_ui_create_dynamic_audio_modes 
endscript

script audio_ui_audio_modes_pad_back_script 
endscript

script audio_gameplay_auto_calibration \{player = 1}
endscript

script play_pink_noise_audio_calibration 
endscript

script audio_gameplay_practice_play_project_dependent_drum_sample 
	playlist_getcurrentsong
	song_name = <current_song>
	get_song_source song_name = <song_name>
	<floor_tom_pitch> = -2
	<high_tom_pitch> = 2
	if ((<source> = gh4) || (<source> = gh4_1) || (<source> = gh4_2) || (<source> = gh4_3) || (<source> = gh4_dlc) || (<source> = gh5) || (<source> = gh5_1) || (<source> = gh5_dlc))
		if (<midinote> = 65)
			play_drum_sample pad = <pad> buss = <buss> velocity = 50
		elseif (<midinote> = 66)
			play_drum_sample pad = <pad> buss = <buss>
		elseif (<midinote> = 67)
			play_drum_sample pad = <pad> buss = <buss> velocity = 50
		elseif (<midinote> = 68)
			play_drum_sample pad = <pad> buss = <buss>
		elseif (<midinote> = 69)
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
			spawnscriptnow audio_gameplay_practice_play_snare_flam params = {pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>}
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
			stopsoundsbybuss \{drums_practicemode_cymbals
				fade_time = 0.5
				fade_type = log_fast}
			stopsoundsbybuss \{drums_practicemode_hats
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
	wait \{0.025
		seconds}
	play_drum_sample pad = <pad> buss = <buss> percussion = 0 velocity = <velocity>
endscript

script audio_crowd_start_inner_perspective 
	getpakmancurrentname \{map = zones}
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		setsoundbussparams {inner_crowd_one_shots = {vol = ($default_bussset.inner_crowd_one_shots.vol)} time = 0.01}
		if ($current_crowd >= 1.3333)
			printf \{channel = sfx
				qs(0x836afb86)}
			spawnscriptnow \{audio_crowd_start_inner_one_shots}
			spawnscriptnow \{audio_crowd_start_inner_whistles_only}
		elseif ($current_crowd <= 0.6)
			printf \{channel = sfx
				qs(0x913cd171)}
			spawnscriptnow \{audio_crowd_start_inner_one_shots_negative}
			spawnscriptnow \{audio_crowd_start_inner_whistles_only}
		else
			printf \{channel = sfx
				qs(0x4f5c8729)}
		endif
	endif
endscript

script audio_crowd_kill_inner_perspective 
	printf \{channel = sfx
		qs(0x0430b48d)}
	setsoundbussparams \{inner_crowd_one_shots = {
			vol = -100
		}
		time = 2}
	killspawnedscript \{name = audio_crowd_start_inner_one_shots}
	killspawnedscript \{name = audio_crowd_start_inner_whistles_only}
	killspawnedscript \{name = audio_crowd_play_single_inner_one_shots}
	killspawnedscript \{name = audio_crowd_play_group_inner_one_shots}
	killspawnedscript \{name = audio_crowd_play_inner_whistle_one_shots}
endscript

script audio_crowd_kill_inner_crowd_perspective_fast 
	killspawnedscript \{name = audio_crowd_start_inner_one_shots}
	killspawnedscript \{name = audio_crowd_start_inner_whistles_only}
	killspawnedscript \{name = audio_crowd_play_single_inner_one_shots}
	killspawnedscript \{name = audio_crowd_play_group_inner_one_shots}
	killspawnedscript \{name = audio_crowd_play_inner_whistle_one_shots}
	stopsoundsbybuss \{crowd_one_shots}
endscript

script audio_crowd_kill_sounds_at_highway_destroy 
	printf \{channel = sfx
		qs(0x7998b944)}
	killspawnedscript \{name = audio_find_rms}
	spawnscriptnow \{audio_crowd_kill_inner_perspective}
	spawnscriptnow \{audio_crowd_kill_quiet_crowd_one_shots_fast}
endscript

script printoutthing 
	printf \{channel = sfx
		qs(0x33afa4fe)}
endscript

script audio_crowd_start_inner_one_shots 
	begin
	spawnscriptnow \{audio_crowd_play_single_inner_one_shots}
	spawnscriptnow \{audio_crowd_play_group_inner_one_shots}
	wait (RandomFloat (1.5, 2.5)) seconds
	repeat
endscript

script audio_crowd_start_inner_one_shots_negative 
	begin
	spawnscriptnow \{audio_crowd_play_single_inner_crowd_one_shots_negative}
	spawnscriptnow \{audio_crowd_play_group_inner_one_shots_negative}
	wait (RandomFloat (1.5, 2.5)) seconds
	repeat
endscript

script audio_crowd_start_inner_whistles_only 
	begin
	spawnscriptnow \{audio_crowd_play_inner_whistle_one_shots}
	wait (RandomFloat (1.5, 2.5)) seconds
	repeat
endscript

script audio_crowd_play_single_inner_one_shots 
	soundevent \{event = close_crowd_individual}
	soundevent \{event = close_crowd_individual_new}
	wait (RandomFloat (0.4, 1.0)) seconds
	soundevent \{event = close_crowd_individual}
	soundevent \{event = close_crowd_individual_new}
endscript

script audio_crowd_play_group_inner_one_shots 
	soundevent \{event = close_crowd_group}
	wait (RandomFloat (0.4, 1.0)) seconds
	soundevent \{event = close_crowd_group}
endscript

script audio_crowd_play_single_inner_crowd_one_shots_negative 
	soundevent \{event = close_crowd_individual_negative}
	wait (RandomFloat (0.4, 1.0)) seconds
	soundevent \{event = close_crowd_individual_negative}
endscript

script audio_crowd_play_group_inner_one_shots_negative 
	soundevent \{event = close_crowd_group_negative}
	wait (RandomFloat (0.4, 1.0)) seconds
	soundevent \{event = close_crowd_group_negative}
endscript

script audio_crowd_play_inner_whistle_one_shots 
	soundevent \{event = close_crowd_whistle}
	wait (RandomFloat (0.4, 1.0)) seconds
	soundevent \{event = close_crowd_whistle}
endscript

script audio_crowd_play_quiet_crowd_one_shots 
	getpakmancurrentname \{map = zones}
	spawnscriptnow \{audio_crowd_gameplay_change_background_to_quiet}
	begin
	soundevent \{event = audio_crowd_play_quiet_crowd_one_shots}
	wait (RandomFloat (0.5, 1.5)) seconds
	repeat
endscript

script audio_crowd_gameplay_change_background_to_quiet 
	sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
		fadeintime = 5.0
		fadeintype = linear}
endscript

script audio_crowd_gameplay_change_background_out_of_quiet 
	if ($current_crowd >= 1.3333)
		sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
			fadeintime = 5.0
			fadeintype = linear
			fadeouttime = 5
			fadeouttype = linear}
	endif
endscript

script audio_crowd_kill_quiet_crowd_one_shots 
	spawnscriptnow \{audio_crowd_gameplay_change_background_out_of_quiet}
	killspawnedscript \{name = audio_crowd_play_quiet_crowd_one_shots}
endscript

script audio_crowd_kill_quiet_crowd_one_shots_fast 
	killspawnedscript \{name = audio_crowd_play_quiet_crowd_one_shots}
	stopsoundsbybuss \{crowd_one_shots}
endscript

script audio_crowd_trigger_logic 
endscript

script audio_crowd_get_trigger_type 
endscript

script getoffset 
endscript

script audio_crowd_trigger_search 
endscript

script audio_crowd_play_swells_based_on_current_transition 
endscript

script audio_crowd_gap_trigger_search 
endscript

script audio_crowd_get_next_gap_trigger 
endscript

script audio_find_rms 
	playlist_getcurrentsong
	if (<current_song> = debug_testmixlevels)
		setsoundbussparams \{sfx_balance = {
				vol = -100
			}
			time = 0.6}
		setsoundbussparams \{misc_balance = {
				vol = -100
			}
			time = 0.6}
		setsoundbussparams \{crowd_balance = {
				vol = -100
			}
			time = 0.6}
		timecheck = 1100
		<playerpart> = [none none none none]
		<numplayersperpart> = [0 0 0 0]
		<finalvalues> = [0.0 0.0 0.0 0.0]
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 1)
			audio_gameplay_figure_out_instruments_and_players playerpart = <playerpart> numplayersperpart = <numplayersperpart> num_players_shown = <num_players_shown> finalvalues = <finalvalues>
		endif
		begin
		getsongtimems
		casttointeger \{time}
		sap_getmainaudiopeak
		if (<time> > <timecheck>)
			audio_gameplay_check_instrument time = <time> song_peak_db = <song_peak_db> playerpart = <playerpart> numplayersperpart = <numplayersperpart> num_players_shown = <num_players_shown> finalvalues = <finalvalues>
			timecheck = (<timecheck> + 2000)
		endif
		if (<timecheck> > 16000)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script audio_gameplay_check_instrument 
	instrumenttime = none
	audio_gameplay_get_instrument_timing_check time = <time> instrumenttime = <instrumenttime>
	if (<num_players_shown> > 1)
		audio_gameplay_check_multiplayer_mix time = <time> song_peak_db = <song_peak_db> instrumenttime = <instrumenttime> finalvalues = <finalvalues> num_players_shown = <num_players_shown> playerpart = <playerpart>
	else
		audio_gameplay_check_single_player_mix time = <time> song_peak_db = <song_peak_db> instrumenttime = <instrumenttime>
	endif
endscript

script audio_gameplay_check_single_player_mix 
	getplayerinfo \{1
		part}
	if (<instrumenttime> = <part>)
		switch <part>
			case guitar
			if (((<song_peak_db> + 27.08) > (($songaudioplayerpanningconfigurations.singleinstrument.guitar.guitar_vol_on) - 0.1)) && ((<song_peak_db> + 27.08) < (($songaudioplayerpanningconfigurations.singleinstrument.guitar.guitar_vol_on) + 0.1)))
				printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
			else
				printf \{channel = sfx
					qs(0x826ca62c)}
				printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
				printf channel = sfx qs(0xf5d192d2) s = <time>
				printf \{channel = sfx
					qs(0x751f9865)}
			endif
			case bass
			if (((<song_peak_db> + 27.08) > (($songaudioplayerpanningconfigurations.singleinstrument.bass.bass_vol_on) - 0.1)) && ((<song_peak_db> + 27.08) < (($songaudioplayerpanningconfigurations.singleinstrument.bass.bass_vol_on) + 0.1)))
				printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
			else
				printf \{channel = sfx
					qs(0xec55f51b)}
				printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
				printf channel = sfx qs(0xf5d192d2) s = <time>
				printf \{channel = sfx
					qs(0x09f13092)}
			endif
			case drum
			if (((<song_peak_db> + 27.08) > (($songaudioplayerpanningconfigurations.singleinstrument.drums.drums_vol_on) - 0.1)) && ((<song_peak_db> + 27.08) < (($songaudioplayerpanningconfigurations.singleinstrument.drums.drums_vol_on) + 0.1)))
				printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
			else
				printf \{channel = sfx
					qs(0x5e52ecaa)}
				printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
				printf channel = sfx qs(0xf5d192d2) s = <time>
				printf \{channel = sfx
					qs(0x0096529b)}
			endif
			case vocals
			if (((<song_peak_db> + 27.08) > (($songaudioplayerpanningconfigurations.singleinstrument.vocals.vocal_vol) - 0.1)) && ((<song_peak_db> + 27.08) < (($songaudioplayerpanningconfigurations.singleinstrument.vocals.vocal_vol) + 0.1)))
				printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
			else
				printf \{channel = sfx
					qs(0x0cf770e2)}
				printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
				printf channel = sfx qs(0xf5d192d2) s = <time>
				printf \{channel = sfx
					qs(0x34ea760b)}
			endif
			default
			printf \{channel = sfx
				qs(0xd07f9f29)}
		endswitch
	else
		if (((<song_peak_db> + 27.08) > (0 - 0.1)) && ((<song_peak_db> + 27.08) < (0 + 0.1)))
			printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
		else
			printf \{channel = sfx
				qs(0x4c7fabfd)}
			printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
			printf channel = sfx qs(0xf5d192d2) s = <time>
		endif
	endif
endscript

script audio_gameplay_check_multiplayer_mix 
	switch <instrumenttime>
		case guitar
		if (((<song_peak_db> + 27.08) > ((<finalvalues> [0]) - 0.1)) && ((<song_peak_db> + 27.08) < ((<finalvalues> [0]) + 0.1)))
			printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
		else
			printf \{channel = sfx
				qs(0x826ca62c)}
			printf channel = sfx qs(0x12dee788) s = (<finalvalues> [0])
			printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
			printf channel = sfx qs(0xf5d192d2) s = <time>
			printf channel = sfx qs(0x132d6c06) a = (<playerpart> [0]) b = (<playerpart> [1]) c = (<playerpart> [2]) d = (<playerpart> [3])
		endif
		case bass
		if (((<song_peak_db> + 27.08) > ((<finalvalues> [1]) - 0.1)) && ((<song_peak_db> + 27.08) < ((<finalvalues> [1]) + 0.1)))
			printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
		else
			printf \{channel = sfx
				qs(0xec55f51b)}
			printf channel = sfx qs(0x12dee788) s = (<finalvalues> [1])
			printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
			printf channel = sfx qs(0xf5d192d2) s = <time>
			printf channel = sfx qs(0x132d6c06) a = (<playerpart> [0]) b = (<playerpart> [1]) c = (<playerpart> [2]) d = (<playerpart> [3])
		endif
		case drum
		if (((<song_peak_db> + 27.08) > ((<finalvalues> [2]) - 0.1)) && ((<song_peak_db> + 27.08) < ((<finalvalues> [2]) + 0.1)))
			printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
		else
			printf \{channel = sfx
				qs(0x5e52ecaa)}
			printf channel = sfx qs(0x12dee788) s = (<finalvalues> [2])
			printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
			printf channel = sfx qs(0xf5d192d2) s = <time>
			printf channel = sfx qs(0x132d6c06) a = (<playerpart> [0]) b = (<playerpart> [1]) c = (<playerpart> [2]) d = (<playerpart> [3])
		endif
		case vocals
		if (((<song_peak_db> + 27.08) > ((<finalvalues> [3]) - 0.1)) && ((<song_peak_db> + 27.08) < ((<finalvalues> [3]) + 0.1)))
			printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
		else
			printf \{channel = sfx
				qs(0x0cf770e2)}
			printf channel = sfx qs(0x12dee788) s = (<finalvalues> [3])
			printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
			printf channel = sfx qs(0xf5d192d2) s = <time>
			printf channel = sfx qs(0x132d6c06) a = (<playerpart> [0]) b = (<playerpart> [1]) c = (<playerpart> [2]) d = (<playerpart> [3])
		endif
		default
		if (((<song_peak_db> + 27.08) > (0 - 0.1)) && ((<song_peak_db> + 27.08) < (0 + 0.1)))
			printf channel = sfx qs(0x79b805b1) s = <song_peak_db>
		else
			printf \{channel = sfx
				qs(0xd07f9f29)}
			printf channel = sfx qs(0xa0caec2d) s = <song_peak_db>
			printf channel = sfx qs(0xf5d192d2) s = <time>
			printf channel = sfx qs(0x132d6c06) a = (<playerpart> [0]) b = (<playerpart> [1]) c = (<playerpart> [2]) d = (<playerpart> [3])
		endif
	endswitch
endscript

script audio_gameplay_get_instrument_timing_check 
	if (<time> > 15000)
		instrumenttime = band
	elseif (<time> > 13000)
		instrumenttime = drum
	elseif (<time> > 11000)
		instrumenttime = drum
	elseif (<time> > 9000)
		instrumenttime = guitar
	elseif (<time> > 7000)
		instrumenttime = drum
	elseif (<time> > 5000)
		instrumenttime = drum
	elseif (<time> > 3000)
		instrumenttime = vocals
	elseif (<time> > 1000)
		instrumenttime = bass
	endif
	return instrumenttime = <instrumenttime>
endscript

script audio_gameplay_figure_out_final_values 
	x = 0
	guitar = 'guitar'
	bass = 'bass'
	drums = 'drums'
	vocals = 'vocals'
	none = 'none'
	multipleguitar = 0
	multiplebass = 0
	multipledrum = 0
	formattext checksumname = combiningnames '%s' s = <none> addtostringlookup = true
	begin
	if ((<numplayersperpart> [<x>]) > 1)
		printf \{channel = sfx
			qs(0x2a8868de)}
		switch <x>
			case 0
			setarrayelement {
				arrayname = finalvalues
				index = 0
				newvalue = (6 + ($songaudioplayerpanningconfigurations.doubleinstrument.guitar.left_on_right_on.stream1_vol))
			}
			multipleguitar = 1
			case 1
			setarrayelement {
				arrayname = finalvalues
				index = 1
				newvalue = (6 + ($songaudioplayerpanningconfigurations.doubleinstrument.bass.left_on_right_on.stream1_vol))
			}
			multiplebass = 1
			case 2
			setarrayelement {
				arrayname = finalvalues
				index = 2
				newvalue = ($songaudioplayerpanningconfigurations.doubleinstrument.drums.left_on_right_on.kick_vol)
			}
			multipledrum = 1
			case 3
			printf \{channel = sfx
				qs(0x7e9eeac4)}
			default
			printf \{channel = sfx
				qs(0x73ffc0e7)}
		endswitch
		if ((<numplayersperpart> [<x>]) > 2)
			printf \{channel = sfx
				qs(0x6c5a5dba)}
			switch <x>
				case 0
				setarrayelement {
					arrayname = finalvalues
					index = 0
					newvalue = (6 + ($songaudioplayerpanningconfigurations.tripleinstrument.guitar.left_on_middle_on_right_on.stream1_vol))
				}
				case 1
				setarrayelement {
					arrayname = finalvalues
					index = 1
					newvalue = (6 + ($songaudioplayerpanningconfigurations.tripleinstrument.bass.left_on_middle_on_right_on.stream1_vol))
				}
				case 2
				setarrayelement {
					arrayname = finalvalues
					index = 2
					newvalue = ($songaudioplayerpanningconfigurations.tripleinstrument.drums.left_on_middle_on_right_on.kick_vol)
				}
				case 3
				printf \{channel = sfx
					qs(0x7e9eeac4)}
				default
				printf \{channel = sfx
					qs(0x73ffc0e7)}
			endswitch
			if ((<numplayersperpart> [<x>]) > 3)
				printf \{channel = sfx
					qs(0x51ebb166)}
				switch <x>
					case 0
					setarrayelement {
						arrayname = finalvalues
						index = 0
						newvalue = (6 + ($songaudioplayerpanningconfigurations.quadrupleinstrument.guitar.left_on_leftmiddle_on_rightmiddle_on_right_on.stream1_vol))
					}
					case 1
					setarrayelement {
						arrayname = finalvalues
						index = 1
						newvalue = (6 + ($songaudioplayerpanningconfigurations.quadrupleinstrument.bass.left_on_leftmiddle_on_rightmiddle_on_right_on.stream1_vol))
					}
					case 2
					setarrayelement {
						arrayname = finalvalues
						index = 2
						newvalue = ($songaudioplayerpanningconfigurations.quadrupleinstrument.drums.left_on_leftmiddle_on_rightmiddle_on_right_on.kick_vol)
					}
					case 3
					printf \{channel = sfx
						qs(0x7e9eeac4)}
					default
					printf \{channel = sfx
						qs(0x73ffc0e7)}
				endswitch
			endif
		endif
	endif
	x = (<x> + 1)
	if (<x> > 3)
		break
	endif
	repeat
	if (<multipleguitar> > 0)
		setarrayelement \{arrayname = numplayersperpart
			index = 0
			newvalue = 0}
	endif
	if (<multiplebass> > 0)
		setarrayelement \{arrayname = numplayersperpart
			index = 1
			newvalue = 0}
	endif
	if (<multipledrum> > 0)
		setarrayelement \{arrayname = numplayersperpart
			index = 2
			newvalue = 0}
	endif
	if ((<numplayersperpart> [0]) > 0)
		formattext checksumname = combiningnames '%a' a = <guitar> addtostringlookup = true
		if ((<numplayersperpart> [1]) > 0)
			formattext checksumname = combiningnames '%a%b' a = <guitar> b = <bass> addtostringlookup = true
			if ((<numplayersperpart> [2]) > 0)
				formattext checksumname = combiningnames '%a%b%c' a = <guitar> b = <bass> c = <drums> addtostringlookup = true
				if ((<numplayersperpart> [3]) > 0)
					formattext checksumname = combiningnames '%a%b%c%d' a = <guitar> b = <bass> c = <drums> d = <vocals> addtostringlookup = true
				endif
			endif
		else
			if ((<numplayersperpart> [2]) > 0)
				formattext checksumname = combiningnames '%a%b' a = <guitar> b = <drums> addtostringlookup = true
				if ((<numplayersperpart> [3]) > 0)
					formattext checksumname = combiningnames '%a%b%c' a = <guitar> b = <drums> c = <vocals> addtostringlookup = true
				endif
			else
				if ((<numplayersperpart> [3]) > 0)
					formattext checksumname = combiningnames '%a%b' a = <guitar> b = <vocals> addtostringlookup = true
				endif
			endif
		endif
	elseif ((<numplayersperpart> [1]) > 0)
		formattext checksumname = combiningnames '%a' a = <bass> addtostringlookup = true
		if ((<numplayersperpart> [2]) > 0)
			formattext checksumname = combiningnames '%a%b' a = <bass> b = <drums> addtostringlookup = true
			if ((<numplayersperpart> [3]) > 0)
				formattext checksumname = combiningnames '%a%b%c' a = <bass> b = <drums> c = <vocals> addtostringlookup = true
			endif
		else
			if ((<numplayersperpart> [3]) > 0)
				formattext checksumname = combiningnames '%a%b' a = <bass> b = <vocals> addtostringlookup = true
			endif
		endif
	elseif ((<numplayersperpart> [2]) > 0)
		formattext checksumname = combiningnames '%a' a = <drums> addtostringlookup = true
		if ((<numplayersperpart> [3]) > 0)
			formattext checksumname = combiningnames '%a%b' a = <drums> b = <vocals> addtostringlookup = true
		endif
	elseif ((<numplayersperpart> [3]) > 0)
		formattext checksumname = combiningnames '%a' a = <vocals> addtostringlookup = true
	else
		printf \{channel = sfx
			qs(0xb3733b81)}
	endif
	audio_gameplay_set_final_numbers finalvalues = <finalvalues> combiningnames = <combiningnames>
	return finalvalues = <finalvalues>
endscript

script audio_gameplay_set_final_numbers 
	switch <combiningnames>
		case guitar
		setarrayelement {
			arrayname = finalvalues
			index = 0
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitar.guitar_vol_on)
		}
		case bass
		setarrayelement {
			arrayname = finalvalues
			index = 1
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.bass.bass_vol_on)
		}
		case drums
		setarrayelement {
			arrayname = finalvalues
			index = 2
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.drums.drums_vol_on)
		}
		case vocals
		setarrayelement {
			arrayname = finalvalues
			index = 3
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.vocals.vocal_vol)
		}
		case guitarbass
		setarrayelement {
			arrayname = finalvalues
			index = 0
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbass.guitar_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 1
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbass.bass_vol_on)
		}
		case guitardrums
		setarrayelement {
			arrayname = finalvalues
			index = 0
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitardrums.guitar_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 2
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitardrums.drums_vol_on)
		}
		case guitarvocals
		setarrayelement {
			arrayname = finalvalues
			index = 0
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarvocals.guitar_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 3
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarvocals.vocal_vol)
		}
		case bassdrums
		setarrayelement {
			arrayname = finalvalues
			index = 1
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.bassdrums.bass_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 2
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.bassdrums.drums_vol_on)
		}
		case bassvocals
		setarrayelement {
			arrayname = finalvalues
			index = 1
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.bassvocals.bass_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 3
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.bassvocals.vocal_vol)
		}
		case drumsvocals
		setarrayelement {
			arrayname = finalvalues
			index = 2
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.drumsvocals.drums_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 3
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.drumsvocals.vocal_vol)
		}
		case guitarbassdrums
		setarrayelement {
			arrayname = finalvalues
			index = 0
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbass.guitar_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 1
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbass.bass_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 2
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbass.drums_vol_on)
		}
		case guitarbassvocals
		setarrayelement {
			arrayname = finalvalues
			index = 0
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbassvocals.guitar_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 1
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbassvocals.bass_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 3
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbassvocals.vocal_vol)
		}
		case guitardrumsvocals
		setarrayelement {
			arrayname = finalvalues
			index = 0
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitardrumsvocals.guitar_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 2
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitardrumsvocals.drums_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 3
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitardrumsvocals.vocal_vol)
		}
		case guitarbassdrumsvocals
		setarrayelement {
			arrayname = finalvalues
			index = 0
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbassvocals.guitar_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 1
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbassvocals.bass_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 2
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbassvocals.drums_vol_on)
		}
		setarrayelement {
			arrayname = finalvalues
			index = 3
			newvalue = ($songaudioplayerpanningconfigurations.singleinstrument.guitarbassvocals.vocal_vol)
		}
		default
		printf \{channel = sfx
			qs(0x5b0a197e)}
	endswitch
	return finalvalues = <finalvalues>
endscript

script audio_gameplay_figure_out_instruments_and_players 
	x = 1
	begin
	getplayerinfo <x> part
	switch <part>
		case guitar
		setarrayelement {
			arrayname = playerpart
			index = (<x> -1)
			newvalue = guitar
		}
		setarrayelement {
			arrayname = numplayersperpart
			index = 0
			newvalue = ((<numplayersperpart> [0]) + 1)
		}
		case bass
		setarrayelement {
			arrayname = playerpart
			index = (<x> -1)
			newvalue = bass
		}
		setarrayelement {
			arrayname = numplayersperpart
			index = 1
			newvalue = ((<numplayersperpart> [1]) + 1)
		}
		case drum
		setarrayelement {
			arrayname = playerpart
			index = (<x> -1)
			newvalue = drums
		}
		setarrayelement {
			arrayname = numplayersperpart
			index = 2
			newvalue = ((<numplayersperpart> [2]) + 1)
		}
		case vocals
		setarrayelement {
			arrayname = playerpart
			index = (<x> -1)
			newvalue = vocals
		}
		setarrayelement {
			arrayname = numplayersperpart
			index = 3
			newvalue = ((<numplayersperpart> [3]) + 1)
		}
		default
		setarrayelement {
			arrayname = playerpart
			index = (<x> -1)
			newvalue = none
		}
	endswitch
	x = (<x> + 1)
	if (<x> > <num_players_shown>)
		break
	endif
	repeat
	audio_gameplay_figure_out_final_values playerpart = <playerpart> numplayersperpart = <numplayersperpart> finalvalues = <finalvalues>
	return finalvalues = <finalvalues> playerpart = <playerpart>
endscript

script audio_play_test_song 
	playlist_getcurrentsong
	if issoundplaying \{fortunateson_mix}
		stopsound \{fortunateson_mix
			fade_time = 0.5
			fade_type = log_slow}
	endif
	if (<current_song> = fortunateson)
		playsound \{fortunateson_mix
			buss = sfx_balance
			vol = 6}
	endif
endscript

script audio_jam_effects_destroy_jam_mode_effects 
	destroysoundbusseffects \{user_jammode = [
			all
		]}
endscript

script audio_jam_effects_create_jam_mode_effects 
	effect = [
		{
			effect = nxmultibandeq
			name = jammode_mode_eq
			band1_filter_type = none
			band1_freq = 0
			band1_q = 0
			band1_gain = 0
			band2_filter_type = none
			band2_freq = 0
			band2_q = 0
			band2_gain = 0
			band3_filter_type = none
			band3_freq = 0
			band3_q = 0
			band3_gain = 0
			band4_filter_type = none
			band4_freq = 0
			band4_q = 0
			band4_gain = 0
		}
	]
	createsoundbusseffects buss = user_jammode effect = <effect>
endscript

script musicstudio_eq_settings_flat 
	setsoundbusseffects \{effects = [
			{
				name = jammode_mode_eq
				$jammode_mode_flat_eq
			}
		]
		time = 0.5}
endscript

script musicstudio_eq_settings_mastering 
	setsoundbusseffects \{effects = [
			{
				name = jammode_mode_eq
				$jammode_mastering_eq
			}
		]
		time = 0.5}
endscript

script audio_revival_meter_anticipation_sound 
	gamemode_gettype
	printf channel = sfx qs(0x927fd511) s = <percent_full>
	<loudest_vol> = 3
	<highest_pitch> = 0.3
	if NOT ((<type> = freeplay) || (<type> = tutorial) || $in_sing_a_long = true)
		if (<percent_full> = 1)
			stopsound \{$g_current_crowd_anticipation
				fade_time = 3
				fade_type = linear}
		else
			if issoundplaying \{$g_current_crowd_anticipation}
				setsoundparams $g_current_crowd_anticipation vol = (<percent_full> * <loudest_vol>) pitch = (<percent_full> * <highest_pitch>) time = 0.1
				printf channel = sfx qs(0x4e286360) s = (<percent_full> * <loudest_vol>)
				printf channel = sfx qs(0x364ccded) s = (<percent_full> * <highest_pitch>)
			else
				playsound $g_current_crowd_anticipation vol = (<percent_full> * <loudest_vol>) pitch = (<percent_full> * <highest_pitch>) pan1x = 0 pan1y = 0.59 panremovecenter = true priority = 100 buss = crowd_beds attack_length = 1 decay_length = 1 release_length = 1 attack_function = log_fast num_loops = -1
			endif
		endif
	endif
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
			killspawnedscript \{name = audio_microphone_auto_gain}
		else
			spawnscriptnow \{audio_microphone_auto_gain}
		endif
	endif
endscript

script audio_microphone_auto_gain 
	setspawninstancelimits \{max = 1
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
	setspawninstancelimits \{max = 1
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
	wait \{1
		gameframe}
	repeat
endscript

script audio_microphone_levels 
	setspawninstancelimits \{max = 1
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
	<threshold> = 1.9
	<overall_amplitude> = 0
	<counter> = 1
	<new_amplitude_mic_1> = 0
	<new_amplitude_mic_2> = 0
	<new_amplitude_mic_3> = 0
	<new_amplitude_mic_4> = 0
	<audio_getting_mic_device_info> = true
	if ((<amplitude_mic_1> + <amplitude_mic_2> + <amplitude_mic_3> + <amplitude_mic_4>) > <threshold>)
		printf \{channel = sfx
			qs(0x1a5bd505)}
		<overall_amplitude> = (<amplitude_mic_1> + <amplitude_mic_2> + <amplitude_mic_3> + <amplitude_mic_4>)
		begin
		getplayerinfo <counter> part
		if (<part> = vocals)
			switch <counter>
				case 1
				<new_amplitude_mic_1> = ((<amplitude_mic_1> / <overall_amplitude>) * <threshold>)
				case 2
				<new_amplitude_mic_2> = ((<amplitude_mic_2> / <overall_amplitude>) * <threshold>)
				case 3
				<new_amplitude_mic_3> = ((<amplitude_mic_3> / <overall_amplitude>) * <threshold>)
				case 4
				<new_amplitude_mic_4> = ((<amplitude_mic_4> / <overall_amplitude>) * <threshold>)
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
			threshold = <threshold>
		}
	else
		begin
		switch <counter>
			case 1
			if (<amplitude_mic_1> > 0)
				ui_options_audio_update_mic_volume {
					audio_getting_mic_device_info = <audio_getting_mic_device_info>
					player = <counter>
				}
				getplayerinfo <counter> controller
				if gotparam \{micvolume}
					setmicvolume controller = <controller> vol = <micvolume>
				endif
			endif
			case 2
			if (<amplitude_mic_2> > 0)
				ui_options_audio_update_mic_volume {
					audio_getting_mic_device_info = <audio_getting_mic_device_info>
					player = <counter>
				}
				getplayerinfo <counter> controller
				if gotparam \{micvolume}
					setmicvolume controller = <controller> vol = <micvolume>
				endif
			endif
			case 3
			if (<amplitude_mic_3> > 0)
				ui_options_audio_update_mic_volume {
					audio_getting_mic_device_info = <audio_getting_mic_device_info>
					player = <counter>
				}
				getplayerinfo <counter> controller
				if gotparam \{micvolume}
					setmicvolume controller = <controller> vol = <micvolume>
				endif
			endif
			case 4
			if (<amplitude_mic_4> > 0)
				ui_options_audio_update_mic_volume {
					audio_getting_mic_device_info = <audio_getting_mic_device_info>
					player = <counter>
				}
				getplayerinfo <counter> controller
				if gotparam \{micvolume}
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
			<temp_db_value> = ((<new_amplitude_mic_1> / <threshold>) * <temp_db_value>)
			ui_options_audio_update_mic_volume {
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
				player = <counter>
			}
			getplayerinfo <counter> controller
			if gotparam \{micvolume}
				setmicvolume controller = <controller> vol = (<micvolume> + <temp_db_value>)
			endif
		endif
		case 2
		if (<amplitude_mic_2> > 0)
			convertamplitudetodb amplitude = <amplitude_mic_2>
			<temp_db_value> = <db>
			convertamplitudetodb amplitude = <new_amplitude_mic_2>
			<temp_db_value> = ((<db> - <temp_db_value>))
			<temp_db_value> = ((<new_amplitude_mic_2> / <threshold>) * <temp_db_value>)
			ui_options_audio_update_mic_volume {
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
				player = <counter>
			}
			getplayerinfo <counter> controller
			if gotparam \{micvolume}
				setmicvolume controller = <controller> vol = (<micvolume> + <temp_db_value>)
			endif
		endif
		case 3
		if (<amplitude_mic_3> > 0)
			convertamplitudetodb amplitude = <amplitude_mic_3>
			<temp_db_value> = <db>
			convertamplitudetodb amplitude = <new_amplitude_mic_3>
			<temp_db_value> = ((<db> - <temp_db_value>))
			<temp_db_value> = ((<new_amplitude_mic_3> / <threshold>) * <temp_db_value>)
			ui_options_audio_update_mic_volume {
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
				player = <counter>
			}
			getplayerinfo <counter> controller
			if gotparam \{micvolume}
				setmicvolume controller = <controller> vol = (<micvolume> + <temp_db_value>)
			endif
		endif
		case 4
		if (<amplitude_mic_4> > 0)
			convertamplitudetodb amplitude = <amplitude_mic_4>
			<temp_db_value> = <db>
			convertamplitudetodb amplitude = <new_amplitude_mic_4>
			<temp_db_value> = ((<db> - <temp_db_value>))
			<temp_db_value> = ((<new_amplitude_mic_4> / <threshold>) * <temp_db_value>)
			ui_options_audio_update_mic_volume {
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
				player = <counter>
			}
			getplayerinfo <counter> controller
			if gotparam \{micvolume}
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

script audio_kill_microphone_auto_gain 
	killspawnedscript \{name = audio_microphone_auto_gain}
endscript

script audio_check_for_celeb_intro_encore 
	if ($g_celeb_intro = 1)
		if NOT ($game_mode = practice)
			if issoundplaying \{silence_front_end_crowd_loop_ft}
				sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
					fadeintime = 2.0
					fadeintype = linear
					fadeouttime = 2
					fadeouttype = linear}
				one_shot_soundevent \{soundevent = $g_current_crowd_oneshot_positive_soundevent
					waittime = 5}
			endif
		endif
	elseif ($g_celeb_encore = 1)
		if NOT ($game_mode = practice)
			if issoundplaying \{silence_front_end_crowd_loop_ft}
				sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good
					fadeintime = 2.0
					fadeintype = linear
					fadeouttime = 2
					fadeouttype = linear}
				one_shot_soundevent \{soundevent = $g_current_crowd_oneshot_positive_soundevent
					waittime = 5}
			endif
		endif
	endif
	audio_change_celeb_globals_to_zero
endscript

script audio_change_crowd_to_celeb_state 
	if (<celeb_state> = intro)
		change \{g_celeb_intro = 1}
	elseif (<celeb_state> = encore)
		change \{g_celeb_encore = 1}
	endif
	sfx_backgrounds_new_area \{bg_sfx_area = frontend
		fadeintime = 1.0
		fadeintype = linear
		fadeouttime = 1
		fadeouttype = linear}
	one_shot_soundevent \{soundevent = audio_crowd_oneshots_do_nothing}
endscript

script audio_change_celeb_globals_to_zero 
	change \{g_celeb_encore = 0}
	change \{g_celeb_intro = 0}
endscript

script audio_medallion_status_logic \{percentage = 6}
endscript

script audio_medallion_status_logic_fast \{percentage = 6}
	soundevent \{event = audio_ui_career_medallion_fill_fast}
endscript

script locked_item_negative_select_sfx 
	stopsoundevent \{audio_ui_generic_select}
	soundevent \{event = audio_ui_generic_negative_select}
endscript

script audio_menu_music_duck_volume 
	printf channel = sfx qs(0x73307931) s = <outro_vo>
	if isusermusicplaying
		printf \{channel = sfx
			qs(0x68e5ed39)}
		printf \{channel = sfx
			qs(0x712dd3b4)}
		disableusermusic
	else
		printf \{channel = sfx
			qs(0x5249fb91)}
	endif
	switch <outro_vo>
		case 'Johnny_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{6
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{1.5
			seconds}
		case 'Newgirl_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{6.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{1.5
			seconds}
		case 'Newgirl_Outro_Generic'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{12.0
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Johnny_Outro_Generic'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{9.25
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Judy_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{7.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{1.5
			seconds}
		case 'Newmale_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{8.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Pandora_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{8.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Lars_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{10.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Casey_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{6
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{1.5
			seconds}
		case 'Axel_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -100)} time = 0.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{8.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 6}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Map_Intro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{12
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 3}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{2.0
			seconds}
		case 'Map_Unlock_2nd_Tier'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -6)} time = 1}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{3
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Map_Unlock_Rush'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{8.0
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 3}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{1.5
			seconds}
		case 'Rush_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{1.5
			seconds}
		case 'Map_Unlock_3rd_Tier'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{7
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Map_FB_Intro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -6)} time = 1.5}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{3.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Map_FB_Outro'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{4.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Map_Unlock_Demigod'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{5.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		case 'Map_Demigod_Complete'
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) -6)} time = 2}
		printf \{channel = sfx
			qs(0xe4e917da)}
		wait \{6.5
			seconds}
		printf \{channel = sfx
			qs(0xbe845104)}
		setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = 2}
		printf \{channel = sfx
			qs(0xc779e734)}
		wait \{0.5
			seconds}
		default
		printf \{channel = sfx
			qs(0x3753d878)}
	endswitch
	printf \{channel = sfx
		qs(0xf5814c6c)}
	enableusermusic
endscript

script audio_kill_cutscene_audio 
	stopsoundsbybuss \{encore_events}
	stopsoundsbybuss \{binkcutscenes}
endscript

script audio_play_loc_vo_manually \{volumetweak = 3}
	printf \{channel = sfx
		qs(0xa24bd2b5)}
	<lang_crc> = null
	if english
		<lang_crc> = en_
	elseif german
		<lang_crc> = gr_
	elseif french
		<lang_crc> = fr_
	elseif italian
		<lang_crc> = it_
	elseif spanish
		<lang_crc> = sp_
	endif
	if gotparam \{stream_to_stop}
		extendcrc <lang_crc> (<stream_to_stop>) out = full_stream_name_to_stop
		stopsound <full_stream_name_to_stop>
		wait \{0.8
			seconds}
	endif
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	if gotparam \{stream_name}
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <stream_name>
		extendcrc <lang_crc> (<stream_name>) out = full_stream_name
		playsound <full_stream_name> buss = encore_events vol = <volumetweak>
		if gotparam \{unique_id}
			printf \{channel = sfx
				qs(0x7a29502f)}
			change celeb_intro_stream_id = <unique_id>
		else
			printf \{channel = sfx
				qs(0xfd95dc12)}
		endif
	endif
endscript

script audio_kill_crowds_during_stats_screen 
	if scriptexists \{audio_crowd_play_swells_during_stats_screen}
		killspawnedscript \{name = audio_crowd_play_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
endscript

script audio_final_battle_outro_preload_stream 
	tutorial_system_get_language_prefix
	formattext checksumname = localized_stream '%l_%s' l = <language_prefix> s = 'FB_Outro' addtostringlookup = true
	preloadstream <localized_stream>
	change g_career_movie_stream = <unique_id>
	begin
	if preloadstreamdone \{$g_career_movie_stream}
		printf \{qs(0xa0d116d1)
			s = $g_career_movie_stream}
		break
	endif
	printf \{qs(0xcfa0d6c1)
		s = $g_career_movie_stream}
	wait \{1
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
			@ preloadstream \{en_fb_fail_02}
			@ preloadstream \{en_fb_fail_03}
			@ preloadstream \{en_fb_fail_07}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'GR'
		RandomNoRepeat (
			@ preloadstream \{gr_fb_fail_02}
			@ preloadstream \{gr_fb_fail_03}
			@ preloadstream \{gr_fb_fail_07}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'FR'
		RandomNoRepeat (
			@ preloadstream \{fr_fb_fail_02}
			@ preloadstream \{fr_fb_fail_03}
			@ preloadstream \{fr_fb_fail_07}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'IT'
		RandomNoRepeat (
			@ preloadstream \{it_fb_fail_02}
			@ preloadstream \{it_fb_fail_03}
			@ preloadstream \{it_fb_fail_07}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'SP'
		RandomNoRepeat (
			@ preloadstream \{sp_fb_fail_02}
			@ preloadstream \{sp_fb_fail_03}
			@ preloadstream \{sp_fb_fail_07}
			)
		change celeb_intro_stream_id = <unique_id>
		default
		printf \{channel = sfx
			qs(0x5d69bfc9)}
	endswitch
	wait \{2.5
		seconds}
	if issoundplaying \{ampzilla_fail_attack_back}
		setsoundparams \{ampzilla_fail_attack_back
			vol = -10
			time = 1.5}
		setsoundparams \{ampzilla_fail_attack_front
			vol = -10
			time = 1.5}
	elseif issoundplaying \{ampzilla_fail_attack_2_back}
		setsoundparams \{ampzilla_fail_attack_2_back
			vol = -10
			time = 1.5}
		setsoundparams \{ampzilla_fail_attack_2_front
			vol = -10
			time = 1.5}
	elseif issoundplaying \{ampzilla_fail_attack_3_back}
		setsoundparams \{ampzilla_fail_attack_3_back
			vol = -10
			time = 1.5}
		setsoundparams \{ampzilla_fail_attack_3_front
			vol = -10
			time = 1.5}
	endif
	wait \{1.5
		seconds}
	if NOT ($celeb_intro_stream_id = none)
		startpreloadedstream <unique_id> buss = encore_events forcesafepreload = 1 vol = 0 priority = 1
		change \{celeb_intro_stream_id = none}
	endif
endscript

script audio_fail_endofsong_vo_line_selection 
	printf \{channel = sfx
		qs(0x9da2a941)}
	tutorial_system_get_language_prefix
	switch <language_prefix>
		case 'EN'
		RandomNoRepeat (
			@ preloadstream \{en_fb_fail_01}
			@ preloadstream \{en_fb_fail_04}
			@ preloadstream \{en_fb_fail_05}
			@ preloadstream \{en_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'GR'
		RandomNoRepeat (
			@ preloadstream \{gr_fb_fail_01}
			@ preloadstream \{gr_fb_fail_04}
			@ preloadstream \{gr_fb_fail_05}
			@ preloadstream \{gr_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'FR'
		RandomNoRepeat (
			@ preloadstream \{fr_fb_fail_01}
			@ preloadstream \{fr_fb_fail_04}
			@ preloadstream \{fr_fb_fail_05}
			@ preloadstream \{fr_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'IT'
		RandomNoRepeat (
			@ preloadstream \{it_fb_fail_01}
			@ preloadstream \{it_fb_fail_04}
			@ preloadstream \{it_fb_fail_05}
			@ preloadstream \{it_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'SP'
		RandomNoRepeat (
			@ preloadstream \{sp_fb_fail_01}
			@ preloadstream \{sp_fb_fail_04}
			@ preloadstream \{sp_fb_fail_05}
			@ preloadstream \{sp_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		default
		printf \{channel = sfx
			qs(0x5d69bfc9)}
	endswitch
	wait \{2.5
		seconds}
	if issoundplaying \{ampzilla_fail_attack_back}
		setsoundparams \{ampzilla_fail_attack_back
			vol = -10
			time = 1.5}
		setsoundparams \{ampzilla_fail_attack_front
			vol = -10
			time = 1.5}
	elseif issoundplaying \{ampzilla_fail_attack_2_back}
		setsoundparams \{ampzilla_fail_attack_2_back
			vol = -10
			time = 1.5}
		setsoundparams \{ampzilla_fail_attack_2_front
			vol = -10
			time = 1.5}
	elseif issoundplaying \{ampzilla_fail_attack_3_back}
		setsoundparams \{ampzilla_fail_attack_3_back
			vol = -10
			time = 1.5}
		setsoundparams \{ampzilla_fail_attack_3_front
			vol = -10
			time = 1.5}
	endif
	wait \{1.5
		seconds}
	if NOT ($celeb_intro_stream_id = none)
		startpreloadedstream <unique_id> buss = encore_events forcesafepreload = 1 vol = 0 priority = 1
		change \{celeb_intro_stream_id = none}
	endif
endscript

script audio_fail_demigod_vo_line_selection 
	printf \{channel = sfx
		qs(0x80e0937b)}
	tutorial_system_get_language_prefix
	switch <language_prefix>
		case 'EN'
		RandomNoRepeat (
			@ preloadstream \{en_fb_demigod_fail_01}
			@ preloadstream \{en_fb_demigod_fail_02}
			@ preloadstream \{en_fb_demigod_fail_03}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'GR'
		RandomNoRepeat (
			@ preloadstream \{gr_fb_demigod_fail_01}
			@ preloadstream \{gr_fb_demigod_fail_02}
			@ preloadstream \{gr_fb_demigod_fail_03}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'FR'
		RandomNoRepeat (
			@ preloadstream \{fr_fb_demigod_fail_01}
			@ preloadstream \{fr_fb_demigod_fail_02}
			@ preloadstream \{fr_fb_demigod_fail_03}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'IT'
		RandomNoRepeat (
			@ preloadstream \{it_fb_demigod_fail_01}
			@ preloadstream \{it_fb_demigod_fail_02}
			@ preloadstream \{it_fb_demigod_fail_03}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'SP'
		RandomNoRepeat (
			@ preloadstream \{sp_fb_demigod_fail_01}
			@ preloadstream \{sp_fb_demigod_fail_02}
			@ preloadstream \{sp_fb_demigod_fail_03}
			)
		change celeb_intro_stream_id = <unique_id>
		default
		printf \{channel = sfx
			qs(0x5d69bfc9)}
	endswitch
	wait \{2.5
		seconds}
	if issoundplaying \{ampzilla_fail_attack_back}
		setsoundparams \{ampzilla_fail_attack_back
			vol = -10
			time = 1.5}
		setsoundparams \{ampzilla_fail_attack_front
			vol = -10
			time = 1.5}
	elseif issoundplaying \{ampzilla_fail_attack_2_back}
		setsoundparams \{ampzilla_fail_attack_2_back
			vol = -10
			time = 1.5}
		setsoundparams \{ampzilla_fail_attack_2_front
			vol = -10
			time = 1.5}
	elseif issoundplaying \{ampzilla_fail_attack_3_back}
		setsoundparams \{ampzilla_fail_attack_3_back
			vol = -10
			time = 1.5}
		setsoundparams \{ampzilla_fail_attack_3_front
			vol = -10
			time = 1.5}
	endif
	wait \{1.5
		seconds}
	if NOT ($celeb_intro_stream_id = none)
		startpreloadedstream <unique_id> buss = encore_events forcesafepreload = 1 vol = 0 priority = 1
		change \{celeb_intro_stream_id = none}
	endif
endscript

script audio_fail_demigod_endofsong_vo_line_selection 
	printf \{channel = sfx
		qs(0x80e0937b)}
	tutorial_system_get_language_prefix
	switch <language_prefix>
		case 'EN'
		RandomNoRepeat (
			@ preloadstream \{en_fb_fail_01}
			@ preloadstream \{en_fb_fail_05}
			@ preloadstream \{en_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'GR'
		RandomNoRepeat (
			@ preloadstream \{gr_fb_fail_01}
			@ preloadstream \{gr_fb_fail_05}
			@ preloadstream \{gr_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'FR'
		RandomNoRepeat (
			@ preloadstream \{fr_fb_fail_01}
			@ preloadstream \{fr_fb_fail_05}
			@ preloadstream \{fr_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'IT'
		RandomNoRepeat (
			@ preloadstream \{it_fb_fail_01}
			@ preloadstream \{it_fb_fail_05}
			@ preloadstream \{it_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		case 'SP'
		RandomNoRepeat (
			@ preloadstream \{sp_fb_fail_01}
			@ preloadstream \{sp_fb_fail_05}
			@ preloadstream \{sp_fb_fail_06}
			)
		change celeb_intro_stream_id = <unique_id>
		default
		printf \{channel = sfx
			qs(0x490ec7ca)}
	endswitch
	wait \{2.5
		seconds}
	if issoundplaying \{ampzilla_fail_attack_back}
		setsoundparams \{ampzilla_fail_attack_back
			vol = -10
			time = 3.5}
		setsoundparams \{ampzilla_fail_attack_front
			vol = -10
			time = 3.5}
	elseif issoundplaying \{ampzilla_fail_attack_2_back}
		setsoundparams \{ampzilla_fail_attack_2_back
			vol = -10
			time = 3.5}
		setsoundparams \{ampzilla_fail_attack_2_front
			vol = -10
			time = 3.5}
	elseif issoundplaying \{ampzilla_fail_attack_3_back}
		setsoundparams \{ampzilla_fail_attack_3_back
			vol = -10
			time = 3.5}
		setsoundparams \{ampzilla_fail_attack_3_front
			vol = -10
			time = 3.5}
	endif
	wait \{1.5
		seconds}
	if NOT ($celeb_intro_stream_id = none)
		startpreloadedstream <unique_id> buss = encore_events forcesafepreload = 1 vol = 0 priority = 1
		change \{celeb_intro_stream_id = none}
	endif
endscript

script preload_fb_scene_2_stream 
	printf \{channel = sfx
		qs(0x9e15fdb9)}
	if ($game_mode = career)
		tutorial_system_get_language_prefix
		formattext checksumname = stream_checksum '%l_FB_Success_1st_Song' l = <language_prefix>
		preloadstream <stream_checksum>
		change celeb_intro_stream_id = <unique_id>
	endif
endscript

script audio_play_preloaded_fb_scene_2_stream 
	if ($game_mode = career)
		if NOT ($celeb_intro_stream_id = none)
			startpreloadedstream \{$celeb_intro_stream_id
				buss = encore_events
				forcesafepreload = 1
				vol = 0
				priority = 1}
			change \{celeb_intro_stream_id = none}
		endif
	endif
endscript

script preload_fb_scene_3_stream 
	printf \{channel = sfx
		qs(0x307d6c28)}
	if ($game_mode = career)
		tutorial_system_get_language_prefix
		formattext checksumname = stream_checksum '%l_FB_Success_2nd_Song' l = <language_prefix>
		preloadstream <stream_checksum>
		change celeb_intro_stream_id = <unique_id>
	endif
endscript

script audio_play_preloaded_fb_scene_3_stream 
	if ($game_mode = career)
		if NOT ($celeb_intro_stream_id = none)
			startpreloadedstream \{$celeb_intro_stream_id
				buss = encore_events
				forcesafepreload = 1
				vol = 0
				priority = 1}
			change \{celeb_intro_stream_id = none}
		endif
	endif
endscript

script audio_quiet_crowd_quickly_to_change_venue_freeplay 
	printf \{channel = sfx
		qs(0x603f9850)}
	stopsoundsbybuss \{crowd
		fade_time = 0.6
		fade_type = linear}
endscript

script audio_delay_icon_appear 
	wait \{0.15}
	soundevent \{event = stats_screen_stars_dropping}
	soundevent \{event = audio_songcomplete_display_item}
endscript

script audio_wait_to_play_unlock_sfx 
	wait \{0.2
		seconds}
	soundevent \{event = audio_ui_song_complete_unlock_new_item}
endscript

script audio_animate_in_competitive_mode_sfx 
	playsound \{stats_screen_stars_loop
		num_loops = -1
		attack_length = 0.4
		sustain_level = 0
		decay_length = 0.2
		release_length = 0.2
		attack_function = linear
		decay_function = log_fast
		release_function = linear
		buss = band_balance}
	wait \{0.2
		seconds}
	soundevent \{event = stats_screen_star_whoosh}
	wait \{0.1
		seconds}
	soundevent \{event = stats_screen_last_star_hit}
	stopsound \{stats_screen_stars_loop}
	wait \{0.5
		seconds}
	playsound \{universal_popup_text_animate_in
		vol = -20
		buss = front_end}
	soundevent \{event = stats_screen_stars_dropping}
endscript

script audio_waiting_for_crowd_to_fade 
	wait \{2
		seconds}
	setsoundbussparams {crowd = {vol = ($game_bussset.crowd.vol)} time = 1.0}
endscript

script audio_red_medallion_change_loop_sfx 
	printf \{channel = sfx
		qs(0xb70b5f17)}
endscript

script audio_play_surges_during_encore_waiting_screen 
	getpakmancurrentname \{map = zones}
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		printf \{channel = sfx
			qs(0xd9df487d)}
		soundevent \{event = $g_current_crowd_swell_long_soundevent}
		wait (RandomFloat (4.0, 6.0)) seconds
		soundevent \{event = $g_current_crowd_swell_med_soundevent}
		wait (RandomFloat (3.0, 4.0)) seconds
		soundevent \{event = $g_current_crowd_swell_long_soundevent}
		wait (RandomFloat (3.0, 4.0)) seconds
		soundevent \{event = $g_current_crowd_swell_med_soundevent}
		wait (RandomFloat (3.0, 4.0)) seconds
		soundevent \{event = $g_current_crowd_swell_long_soundevent}
	endif
endscript

script audio_kill_play_surges_during_encore_waiting_screen 
	printf \{channel = sfx
		qs(0xbf0214a0)}
	killspawnedscript \{name = audio_play_surges_during_encore_waiting_screen}
	stopsoundevent \{$g_current_crowd_swell_med_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$g_current_crowd_swell_short_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$g_current_crowd_swell_long_soundevent
		fade_time = 0.8
		fade_type = log_slow}
endscript

script audio_skip_song_in_freeplay_sfx 
	soundevent \{event = $g_current_crowd_swell_med_soundevent}
	wait (RandomFloat (1.0, 3.0)) seconds
	soundevent \{event = $g_current_crowd_swell_long_soundevent}
	wait (RandomFloat (1.0, 3.0)) seconds
	soundevent \{event = $g_current_crowd_swell_short_soundevent}
	wait (RandomFloat (1.0, 3.0)) seconds
	soundevent \{event = $g_current_crowd_swell_med_soundevent}
endscript

script audio_ampzilla_scream 
	printf \{channel = sfx
		qs(0x49e7521d)}
	soundevent \{event = fb_success_scream}
endscript

script z_finalbattle_dg_swordhit 
	soundevent \{event = z_finalbattle_hw_attack_sword}
endscript

script z_finalbattle_success_part3 
	wait \{0.4
		seconds}
	soundevent \{event = fb_success_part3}
endscript

script audio_play_fail_sound_to_animation 
	stopsoundevent \{z_finalbattle_hita}
	stopsoundevent \{z_finalbattle_hw_attack_drummer}
	stopsoundevent \{z_finalbattle_hw_attack_vocalist}
	stopsoundevent \{z_finalbattle_hw_attack_guitarist}
	stopsoundevent \{z_finalbattle_hw_attack_sword}
	stopsoundevent \{fb_success_part3}
	gamemode_gettype
	if (<type> = career)
		if quest_progression_is_chapter_finale
			<first> = ($quest_chapter_finale.songs [0])
			<second> = ($quest_chapter_finale.songs [1])
			<third> = ($quest_chapter_finale.songs [2])
			playlist_getcurrentsong
			switch <current_song>
				case <first>
				soundevent \{event = fb_fail_ampzilla_attack}
				case <second>
				soundevent \{event = ampzilla_fail_attack_2}
				case <third>
				soundevent \{event = ampzilla_fail_attack_3}
			endswitch
			return
		endif
	endif
endscript

script scream_sfx_between_song_1_and_2 
	gamemode_gettype
	if (<type> = career)
		if quest_progression_is_chapter_finale
			<second> = ($quest_chapter_finale.songs [1])
			playlist_getcurrentsong
			if (<current_song> = <second>)
				soundevent \{event = fb_success_scream}
			endif
		endif
	endif
endscript
