
script create_venue_effects_settings 
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
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
		case 'Large_EXT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $large_ext_reverb}]
		case 'Large_INT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $large_int_reverb}]
		case 'Medium_INT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $medium_int_reverb}]
		case 'Medium_EXT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $medium_ext_reverb}]
		case 'Small_INT'
		printf channel = sfx qs(0x00bcbb5a) s = <venuesize>
		createeffectsendstack slot = ($venue_sendeffect_slot) effects = [{name = venueverb $small_int_reverb}]
		case 'Small_EXT'
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

script soundevent 
	soundeventfast <...>
endscript

script registersoundevent 
	addsoundeventscript soundevent_eventid = <soundevent_eventid>
	onexitrun deregistersoundevent params = {soundevent_eventid = <soundevent_eventid>}
	<event> <...>
endscript

script deregistersoundevent 
	removesoundeventscript soundevent_eventid = <soundevent_eventid>
endscript

script master_sfx_adding_sound_busses 
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

script printpushpopdebuginfo 
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

script generic_reverb_functionality_script \{newechosettings = $echo_dry
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

script gh_star_power_verb_on 
	printf \{channel = sfx
		qs(0x9892061a)}
	getplayerinfo <player> part
	printf channel = sfx qs(0xbaecfbed) s = <player>
	if ($star_power_verb_is_on = 1)
		printf \{channel = sfx
			qs(0xf3504361)}
		if NOT issingleplayergame
			printf \{channel = sfx
				qs(0x4292e934)}
			spawnscriptnow star_power_clap_panning_multiple params = {player = <player>}
			spawnscriptnow star_power_deployed_sfx_multiplayer params = {player = <player>}
		endif
	else
		printf \{channel = sfx
			qs(0xd6de249a)}
		spawnscriptnow star_power_clap_panning params = {player = <player>}
		printf \{channel = sfx
			qs(0xc8d90171)}
		change \{star_power_verb_is_on = 1}
		gman_songtool_getcurrentsong
		if isps3
			if NOT (<current_song> = jamsession)
				if issingleplayergame
					soundevent \{event = star_power_deployed_lfe_gh4}
					soundevent \{event = star_power_deployed_back_gh4}
					soundevent \{event = star_power_deployed_front_gh4}
					if ($game_mode != tutorial)
						if NOT issoundeventplaying \{star_power_deployed_cheer_sfx}
							soundevent \{event = star_power_deployed_cheer_sfx}
						endif
					endif
				else
					spawnscriptnow star_power_deployed_sfx_multiplayer params = {player = <player>}
				endif
			endif
		else
			if issingleplayergame
				soundevent \{event = star_power_deployed_lfe_gh4}
				soundevent \{event = star_power_deployed_back_gh4}
				soundevent \{event = star_power_deployed_front_gh4}
				if ($game_mode != tutorial)
					if NOT issoundeventplaying \{star_power_deployed_cheer_sfx}
						soundevent \{event = star_power_deployed_cheer_sfx}
					endif
				endif
			else
				spawnscriptnow star_power_deployed_sfx_multiplayer params = {player = <player>}
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
			songsetvenueeffectsendvolume player = <player> vol = 0
		endif
		case bass
		printf \{channel = sfx
			qs(0xf7672ca5)}
		if NOT (<current_song> = jamsession)
			songsetvenueeffectsendvolume player = <player> vol = -10
		endif
		case drum
		printf \{channel = sfx
			qs(0x45603514)}
		if NOT (<current_song> = jamsession)
			songsetvenueeffectsendvolume player = <player> vol = -3
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
			wetmix = 0.5
			delay = 100}
		default
		printf \{channel = sfx
			qs(0xacc915b2)}
	endswitch
endscript

script gh_star_power_verb_off 
	printf \{channel = sfx
		qs(0xfa676f80)}
	if ($star_power_verb_is_on = 1)
	endif
	printf channel = sfx qs(0x149d7db3) s = <player>
	spawnscriptnow star_clap_end params = {player = <player>}
	spawnscriptnow \{clap_fading}
	change \{star_power_verb_is_on = 0}
	gman_songtool_getcurrentsong
	if NOT (<current_song> = jamsession)
		songsetvenueeffectsendvolume player = <player> vol = -100
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
			wetmis = 0.25
			delay = 100}
	endif
endscript

script gh3_set_guitar_verb_and_echo_to_dry 
endscript

script gh5_music_change_dsp_snapshot \{time = 4
		scriptname = none}
	printf channel = sfx qs(0x71489f1f) s = <scriptname>
	singalong_effect_send = -6
	singalong_buss = -3
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	if scriptexists <scriptgetvenuesize>
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
	if gotparam \{snapshot}
		switch <snapshot>
			case 'house'
			printf \{channel = sfx
				qs(0xc5ba5694)}
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
			change current_eq_kick_gain = ($eq_house_kick.gain)
			change current_delay_kick_wetmix = ($echo_house_kick.wetmix)
			change current_eq_snare_gain = ($eq_house_snare.gain)
			change current_delay_snare_wetmix = ($echo_house_snare.wetmix)
			change current_eq_cymbal_gain = ($eq_house_cymbal.gain)
			change current_comp_guitar_threshold = ($compressor_house_guitar.threshold)
			change current_eq_guitar_gain = ($eq_house_guitar.gain)
			change current_comp_bass_threshold = ($compressor_house_bass.threshold)
			change current_eq_bass_gain = ($eq_house_bass.gain)
			change current_eq_vocals_gain = ($eq_house_vocal.gain)
			change current_delay_vocals_wetmix = ($echo_house_vocal.wetmix)
			venuetypedecision params = {time = <time>}
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
			songsetvenueeffectsendvolume \{track = band
				vol = -6}
			getpakmancurrent \{map = zones}
			if (<pak> = z_visualizer)
				songsetvenueeffectsendvolume \{track = crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				songsetvenueeffectsendvolume \{track = crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			endif
			case 'stage'
			printf \{channel = sfx
				qs(0x7c1981b3)}
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
			change current_eq_kick_gain = ($eq_stage_kick.gain)
			change current_delay_kick_wetmix = ($echo_stage_kick.wetmix)
			change current_eq_snare_gain = ($eq_stage_snare.gain)
			change current_delay_snare_wetmix = ($echo_stage_snare.wetmix)
			change current_eq_cymbal_gain = ($eq_stage_cymbal.gain)
			change current_comp_guitar_threshold = ($compressor_stage_guitar.threshold)
			change current_eq_guitar_gain = ($eq_stage_guitar.gain)
			change current_comp_bass_threshold = ($compressor_stage_bass.threshold)
			change current_eq_bass_gain = ($eq_stage_bass.gain)
			change current_eq_vocals_gain = ($eq_stage_vocal.gain)
			change current_delay_vocals_wetmix = ($echo_stage_vocal.wetmix)
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
			songsetvenueeffectsendvolume \{track = band
				vol = -7}
			getpakmancurrent \{map = zones}
			if (<pak> = z_visualizer)
				songsetvenueeffectsendvolume \{track = crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				songsetvenueeffectsendvolume track = crowd vol = (<singalong_effect_send> - 4)
				setsoundbussparams {crowdsingalong_stream = {vol = (<singalong_buss> - 13.5)} time = <time>}
			endif
			change \{current_send_vol = 6}
			case 'game'
			printf \{channel = sfx
				qs(0x0735013e)}
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
			change current_eq_kick_gain = ($eq_game_kick.gain)
			change current_delay_kick_wetmix = ($echo_game_kick.wetmix)
			change current_eq_snare_gain = ($eq_game_snare.gain)
			change current_delay_snare_wetmix = ($echo_game_snare.wetmix)
			change current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			change current_comp_guitar_threshold = ($compressor_game_guitar.threshold)
			change current_eq_guitar_gain = ($eq_game_guitar.gain)
			change current_comp_bass_threshold = ($compressor_game_bass.threshold)
			change current_eq_bass_gain = ($eq_game_bass.gain)
			change current_eq_vocals_gain = ($eq_game_vocal.gain)
			change current_delay_vocals_wetmix = ($echo_game_vocal.wetmix)
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
			songsetvenueeffectsendvolume \{track = band
				vol = -100}
			gamemode_gettype
			getpakmancurrent \{map = zones}
			if (<type> = freeplay)
				if (<pak> = z_visualizer)
					songsetvenueeffectsendvolume \{track = crowd
						vol = -100}
					setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
				else
					songsetvenueeffectsendvolume track = crowd vol = <singalong_effect_send>
					setsoundbussparams {crowdsingalong_stream = {vol = <singalong_buss>} time = <time>}
				endif
			else
				if (<pak> = z_visualizer)
					songsetvenueeffectsendvolume \{track = crowd
						vol = -100}
					setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
				else
					songsetvenueeffectsendvolume \{track = crowd
						vol = -100}
					setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
				endif
			endif
			change \{current_send_vol = 0}
			case 'join'
			printf \{channel = sfx
				qs(0xcaac3b03)}
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
			change current_eq_kick_gain = ($eq_game_kick.gain)
			change current_delay_kick_wetmix = ($echo_game_kick.wetmix)
			change current_eq_snare_gain = ($eq_game_snare.gain)
			change current_delay_snare_wetmix = ($echo_game_snare.wetmix)
			change current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			change current_comp_guitar_threshold = ($compressor_game_guitar.threshold)
			change current_eq_guitar_gain = ($eq_game_guitar.gain)
			change current_comp_bass_threshold = ($compressor_game_bass.threshold)
			change current_eq_bass_gain = ($eq_game_bass.gain)
			change current_eq_vocals_gain = ($eq_game_vocal.gain)
			change current_delay_vocals_wetmix = ($echo_game_vocal.wetmix)
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
			songsetvenueeffectsendvolume \{track = band
				vol = -6}
			getpakmancurrent \{map = zones}
			if (<pak> = z_visualizer)
				songsetvenueeffectsendvolume \{track = crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				songsetvenueeffectsendvolume track = crowd vol = (<singalong_effect_send> - 3)
				setsoundbussparams {crowdsingalong_stream = {vol = (<singalong_buss> - 9.5)} time = <time>}
			endif
			change \{current_send_vol = 6}
			case 'pause'
			printf \{channel = sfx
				qs(0xe44985ba)}
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
			change current_eq_kick_gain = ($eq_game_kick.gain)
			change current_delay_kick_wetmix = ($echo_game_kick.wetmix)
			change current_eq_snare_gain = ($eq_game_snare.gain)
			change current_delay_snare_wetmix = ($echo_game_snare.wetmix)
			change current_eq_cymbal_gain = ($eq_game_cymbal.gain)
			change current_comp_guitar_threshold = ($compressor_game_guitar.threshold)
			change current_eq_guitar_gain = ($eq_game_guitar.gain)
			change current_comp_bass_threshold = ($compressor_game_bass.threshold)
			change current_eq_bass_gain = ($eq_game_bass.gain)
			change current_eq_vocals_gain = ($eq_game_vocal.gain)
			change current_delay_vocals_wetmix = ($echo_game_vocal.wetmix)
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
			songsetvenueeffectsendvolume \{track = band
				vol = -100}
			getpakmancurrent \{map = zones}
			if (<pak> = z_visualizer)
				songsetvenueeffectsendvolume \{track = crowd
					vol = -100}
				setsoundbussparams {crowdsingalong_stream = {vol = -100} time = <time>}
			else
				songsetvenueeffectsendvolume track = crowd vol = (<singalong_effect_send> - 1)
				setsoundbussparams {crowdsingalong_stream = {vol = (<singalong_buss> - 9)} time = <time>}
			endif
			change \{current_send_vol = 6}
		endswitch
	endif
endscript

script setup_all_crowd_sounds_based_on_zone 
	venuesize = 'Medium_EXT'
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	if scriptexists <scriptgetvenuesize>
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
	formattext checksumname = whistletemp '%s_Crowd_Whistle_Positive' s = <newvenuesize> addtostringlookup = true
	change current_crowd_whistle_soundevent = <whistletemp>
	formattext checksumname = oneshotgoodtemp '%s_Crowd_OneShot_Positive' s = <newvenuesize> addtostringlookup = true
	change current_crowd_oneshot_positive_soundevent = <oneshotgoodtemp>
	formattext checksumname = oneshotbadtemp '%s_Crowd_OneShot_Negative' s = <newvenuesize> addtostringlookup = true
	change current_crowd_oneshot_negative_soundevent = <oneshotbadtemp>
	formattext checksumname = loopgoodtemp 'Crowd_Loop_%s_Good' s = <venuesize> addtostringlookup = true
	change current_crowd_looping_bg_area_good = <loopgoodtemp>
	formattext checksumname = loopneutraltemp 'Crowd_Loop_%s_Neutral' s = <venuesize> addtostringlookup = true
	change current_crowd_looping_bg_area_neutral = <loopneutraltemp>
	formattext checksumname = loopbadtemp 'Crowd_Loop_%s_Bad' s = <venuesize> addtostringlookup = true
	change current_crowd_looping_bg_area_bad = <loopbadtemp>
	crowdtransitionchecksum = crowd_transition
	formattext checksumname = claptemp '%s_Crowd_Clap_To_Beat_Normal' s = <newvenuesize> addtostringlookup = true
	change current_crowd_clap_normal_soundevent = <claptemp>
	formattext checksumname = claptemp '%s_Crowd_Clap_To_Beat_Middle' s = <newvenuesize> addtostringlookup = true
	change current_crowd_clap_middle_soundevent = <claptemp>
	formattext checksumname = claptemp '%s_Crowd_Clap_To_Beat_Left_Middle' s = <newvenuesize> addtostringlookup = true
	change current_crowd_clap_left_middle_soundevent = <claptemp>
	formattext checksumname = claptemp '%s_Crowd_Clap_To_Beat_Right_Middle' s = <newvenuesize> addtostringlookup = true
	change current_crowd_clap_right_middle_soundevent = <claptemp>
	formattext checksumname = claptemp '%s_Crowd_Clap_To_Beat_Left' s = <newvenuesize> addtostringlookup = true
	change current_crowd_clap_left_soundevent = <claptemp>
	formattext checksumname = claptemp '%s_Crowd_Clap_To_Beat_Right' s = <newvenuesize> addtostringlookup = true
	change current_crowd_clap_right_soundevent = <claptemp>
	formattext checksumname = transitiontemp '%s_Crowd_Negative_To_Neutral' s = <venuetype> addtostringlookup = true
	change current_crowd_transition_negative_to_neutral = <transitiontemp>
	formattext checksumname = transitiontemp '%s_Crowd_Neutral_To_Negative' s = <venuetype> addtostringlookup = true
	change current_crowd_transition_neutral_to_negative = <transitiontemp>
	formattext checksumname = transitiontemp '%s_Crowd_Neutral_To_Positive' s = <venuetype> addtostringlookup = true
	change current_crowd_transition_neutral_to_positive = <transitiontemp>
	formattext checksumname = transitiontemp '%s_Crowd_Positive_To_Neutral' s = <venuetype> addtostringlookup = true
	change current_crowd_transition_positive_to_neutral = <transitiontemp>
	formattext checksumname = swelltemp '%s_Crowd_Swell_Short' s = <newvenuesize> addtostringlookup = true
	change current_crowd_swell_short_soundevent = <swelltemp>
	formattext checksumname = swelltemp '%s_Crowd_Swell_Short_Soft' s = <newvenuesize> addtostringlookup = true
	change current_crowd_swell_short_soft_soundevent = <swelltemp>
	formattext checksumname = swelltemp '%s_Crowd_Swell_Med' s = <newvenuesize> addtostringlookup = true
	change current_crowd_swell_med_soundevent = <swelltemp>
	formattext checksumname = swelltemp '%s_Crowd_Swell_Long' s = <newvenuesize> addtostringlookup = true
	change current_crowd_swell_long_soundevent = <swelltemp>
	formattext checksumname = encoretemp '%s_Encore_Crowd' s = <newvenuesize> addtostringlookup = true
	change current_crowd_encore = <encoretemp>
	formattext checksumname = anticipationtemp '%s_Crowd_Anticipation_Loop' s = <newvenuesize> addtostringlookup = true
	change current_crowd_anticipation = <anticipationtemp>
	formattext checksumname = applausetemp '%s_Crowd_Applause' s = <newvenuesize> addtostringlookup = true
	change current_crowd_applause_soundevent = <applausetemp>
	formattext checksumname = introtemp '%s_Crowd_Venue_Intro' s = <pakname> addtostringlookup = true
	change current_crowd_venue_intro_soundevent = <introtemp>
	formattext checksumname = preencoretemp '%s_Crowd_PreEncore_Looping_SoundEvent' s = <newvenuesize> addtostringlookup = true
	change current_crowd_preencore_looping_soundevent = <preencoretemp>
	formattext checksumname = tempvenuesize '%s' s = <newvenuesize> addtostringlookup = true
	change current_venue_size = <tempvenuesize>
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

script gh3_crowd_event_listener 
	if NOT ($crowd_in_jam_mode_song_state = 1)
		if gotparam \{pak}
		endif
		if NOT ($game_mode = practice)
			if gotparam \{event_type}
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
	soundevent \{event = $current_crowd_whistle_soundevent}
endscript

script play_a_short_crowd_swell_for_this_venue 
	printf \{channel = sfx
		qs(0x32f04896)
		s = $current_crowd_swell_short_soundevent}
	soundevent \{event = $current_crowd_swell_short_soundevent}
	crowd_allplayanim \{anim = swellsh
		playonce = true}
endscript

script play_a_short_crowd_swell_for_this_venue_softer 
	soundevent \{event = $current_crowd_swell_short_soft_soundevent}
	crowd_allplayanim \{anim = swellsh
		playonce = true}
endscript

script play_a_med_crowd_swell_for_this_venue 
	soundevent \{event = $current_crowd_swell_med_soundevent}
	crowd_allplayanim \{anim = swellmd
		playonce = true}
endscript

script play_a_long_crowd_swell_for_this_venue 
	soundevent \{event = $current_crowd_swell_long_soundevent}
	crowd_allplayanim \{anim = swelllg
		playonce = true}
endscript

script play_a_crowd_applause_for_this_venue 
	soundevent \{event = $current_crowd_applause_soundevent}
endscript

script gh3_play_a_crowd_oneshot_positive_based_on_venue 
endscript

script gh3_play_a_crowd_oneshot_negative_based_on_venue 
endscript

script gh3_adjustcrowdloopbacktodefault \{restarting = 0
		normal = 0}
	if ($current_playing_transition = loading)
	else
		printf \{channel = sfx
			qs(0x569ef608)}
		if (<restarting> = 1)
			if gotparam \{time}
				setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol) pitch = 0.0} time = 1.5}
			else
				setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol) pitch = 0.0} time = 1.5}
			endif
		else
			if (<normal> = 1)
				if gotparam \{time}
					setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol) pitch = 0.0} time = 1.5}
				else
					setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol) pitch = 0.0} time = 1.5}
				endif
			else
			endif
		endif
	endif
endscript

script gh3_adjustcrowdfastsmallsurge 
	if gotparam \{pak}
		printf channel = sfx qs(0x4d995118) s = <pak>
	endif
	printf \{channel = sfx
		qs(0xf2c3f029)}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 2)} time = 0.08}
	wait \{1.5
		seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		normal = 1}
endscript

script gh3_adjustcrowdfastbigsurge 
	if gotparam \{pak}
		printf channel = sfx qs(0xff61e7c6) s = <pak>
	endif
	printf \{channel = sfx
		qs(0x71cbe9dd)}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 4)} time = 0.08}
	wait \{1.5
		seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		normal = 1}
endscript

script gh3_adjustcrowdmedsurge 
	if gotparam \{pak}
		printf channel = sfx qs(0x0d163bb8) s = <pak>
	endif
	printf \{channel = sfx
		qs(0x07ac0c0b)}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 4)} time = 2}
	wait \{4
		seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		normal = 1}
endscript

script gh3_adjustcrowdslowbigsurge 
	if gotparam \{pak}
		printf channel = sfx qs(0xe0d3da54) s = <pak>
	endif
	printf \{channel = sfx
		qs(0xcd3ff7f4)}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 4)} time = 3}
	wait \{8
		seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		normal = 1}
endscript

script song_quiet_adjust_all_sfx_down \{sfxbalancetime = 4
		crowdbalancetime = 8
		sfxvolsub = 4.0
		crowdvolsub = 5.0}
	gamemode_gettype
	printf \{channel = sfx
		qs(0xfa5455b6)}
	setsoundbussparams {sfx_balance = {vol = (($default_bussset.sfx_balance.vol) - <sfxvolsub>)} time = <sfxbalancetime>}
	setsoundbussparams {crowd_balance = {vol = (($default_bussset.crowd_balance.vol) - <crowdvolsub>)} time = <crowdbalancetime>}
endscript

script song_quiet_over_adjust_all_sfx_to_normal \{sfxbalancetime = 8
		crowdbalancetime = 4}
	gamemode_gettype
	printf \{channel = sfx
		qs(0x1c6b884d)}
	setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)} time = <sfxbalancetime>}
	setsoundbussparams {crowd_balance = {vol = ($default_bussset.crowd_balance.vol)} time = <crowdbalancetime>}
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
			setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)}}
			setsoundbussparams {crowd_balance = {vol = ($default_bussset.crowd_balance.vol)}}
		else
			printf \{channel = sfx
				qs(0xd4c3161a)}
			change \{crowd_transition_start_of_song_normal = 1}
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
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 4)} time = 3.5}
endscript

script crowd_singalong_volume_up 
	getpakmancurrent \{map = zones}
	gman_songtool_getcurrentsong
	gamemode_gettype
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	if scriptexists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		printf \{channel = sfx
			qs(0x9733853e)}
		venuesize = 'nothing'
	endif
	if NOT (<type> = freeplay)
		if NOT ((<pak> = z_visualizer) || (<pak> = z_cube))
			if NOT (<current_song> = jamsession)
				if NOT ($crowd_is_singing = 1)
					switch <venuesize>
						case 'Large_EXT'
						printf \{channel = sfx
							qs(0xd7731e55)}
						songsetvenueeffectsendvolume \{track = crowd
							vol = -1}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -3
							}
							time = 4}
						case 'Large_INT'
						printf \{channel = sfx
							qs(0xd5c3d66d)}
						songsetvenueeffectsendvolume \{track = crowd
							vol = -2}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -3
							}
							time = 4}
						case 'Medium_INT'
						printf \{channel = sfx
							qs(0x89bdc134)}
						songsetvenueeffectsendvolume \{track = crowd
							vol = -6}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -3
							}
							time = 4}
						case 'Medium_EXT'
						printf \{channel = sfx
							qs(0x8b0d090c)}
						songsetvenueeffectsendvolume \{track = crowd
							vol = -6}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -2
							}
							time = 4}
						case 'Small_INT'
						printf \{channel = sfx
							qs(0x3d696ba6)}
						songsetvenueeffectsendvolume \{track = crowd
							vol = -6.5}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -4
							}
							time = 4}
						case 'Small_EXT'
						printf \{channel = sfx
							qs(0x3fd9a39e)}
						songsetvenueeffectsendvolume \{track = crowd
							vol = -6}
						setsoundbussparams \{crowdsingalong_stream = {
								vol = -2
							}
							time = 4}
						default
						printf \{channel = sfx
							qs(0x79963774)}
						songsetvenueeffectsendvolume \{track = crowd
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
	change \{crowd_is_singing = 1}
endscript

script crowd_singalong_volume_down 
	gamemode_gettype
	if NOT (<type> = freeplay)
		gman_songtool_getcurrentsong
		if NOT (<current_song> = jamsession)
			if ($crowd_is_singing = 1)
				songsetvenueeffectsendvolume \{track = crowd
					vol = -100}
				setsoundbussparams \{crowdsingalong_stream = {
						vol = -100.0
					}
					time = 4}
			endif
		endif
	endif
	change \{crowd_is_singing = 0}
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
	if ($game_mode = p2_pro_faceoff)
		do_actual_changing_of_looping_sound crowd_looping_state = good loading_transition = <loading_transition> restarting = <restarting>
	else
		do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state> loading_transition = <loading_transition> restarting = <restarting>
	endif
endscript

script do_actual_changing_of_looping_sound \{loading_transition = 0
		restarting = 0}
	if gotparam \{crowd_looping_state}
		getpakmancurrent \{map = zones}
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
		new_oneshots = donothing_oneshot
	endif
	printf \{channel = sfx
		qs(0x2eecfe07)}
	if ($calibrate_lag_enabled = 0)
		skate8_sfx_backgrounds_new_area bg_sfx_area = <new_bg_area> loading_transition = <loading_transition> restarting = <restarting>
	else
		skate8_sfx_backgrounds_new_area bg_sfx_area = frontend loading_transition = <loading_transition> restarting = <restarting>
	endif
	one_shot_soundevent soundevent = <new_oneshots> waittime = 5
endscript

script bg_crowd_front_end_silence \{immediate = 0}
	skate8_sfx_backgrounds_new_area bg_sfx_area = frontend immediate = <immediate>
	one_shot_soundevent soundevent = donothing_oneshot waittime = 5 immediate = <immediate>
endscript

script crowd_transition_sfx_poor_to_medium 
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x3da6f454)}
		crowd_generic_transition_sfx state = negative_to_neutral player = <player>
	endif
endscript

script crowd_transition_sfx_medium_to_good 
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x7ba459ad)}
		crowd_generic_transition_sfx state = neutral_to_positive player = <player>
	endif
endscript

script crowd_transition_sfx_medium_to_poor 
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x73ffdd74)}
		crowd_generic_transition_sfx state = neutral_to_negative player = <player>
	endif
endscript

script crowd_transition_sfx_good_to_medium 
	gh3_adjustcrowdloopbacktodefault \{time = 1
		normal = 1}
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x713e8a0b)}
		crowd_generic_transition_sfx state = positive_to_neutral player = <player>
	endif
endscript

script crowd_generic_transition_sfx \{state = neutral_to_positive}
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
			stopsound \{$current_crowd_transition_neutral_to_negative
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $current_crowd_transition_negative_to_neutral
			if ((<venuesize> = 'Large_EXT') || (<venuesize> = 'Large_INT'))
				volume = 11
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				volume = 8
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				volume = 6
			endif
			case neutral_to_positive
			stopsound \{$current_crowd_transition_positive_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $current_crowd_transition_neutral_to_positive
			if (<venuesize> = 'Large_EXT')
				volume = 1.5
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				volume = 6
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				volume = 2
			endif
			case positive_to_neutral
			stopsound \{$current_crowd_transition_neutral_to_positive
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $current_crowd_transition_positive_to_neutral
			if (<venuesize> = 'Large_EXT')
				volume = 3
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				volume = 0.5
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				volume = 1.5
			endif
			case neutral_to_negative
			stopsound \{$current_crowd_transition_negative_to_neutral
				fade_time = 0.5
				fade_type = log_slow}
			transitionevent = $current_crowd_transition_neutral_to_negative
			if (<venuesize> = 'Large_EXT')
				volume = 5
			elseif ((<venuesize> = 'Medium_EXT') || (<venuesize> = 'Medium_INT'))
				volume = 0
			elseif ((<venuesize> = 'Small_EXT') || (<venuesize> = 'Small_INT'))
				volume = 3
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
		wait \{1
			gameframe}
		if gotparam \{left}
			if gotparam \{right}
				printf \{channel = sfx
					qs(0x0316271d)}
				get_multiplayer_sfx_pan_values \{crowd_meter_transition
					wide}
				playsound <transitionevent> vol = <volume> buss = crowd_transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
				printf \{channel = sfx
					qs(0x58436b7c)}
				get_multiplayer_sfx_pan_values \{crowd_meter_transition
					left}
				playsound <transitionevent> buss = crowd_transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		else
			if gotparam \{right}
				printf \{channel = sfx
					qs(0x0e3be335)}
				get_multiplayer_sfx_pan_values \{crowd_meter_transition
					right}
				playsound <transitionevent> buss = crowd_transitions pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			else
				printf \{channel = sfx
					qs(0xdf6ecc9d)}
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
		crowd_generic_transition_sfx state = negative_to_neutral player = <player>
	endif
endscript

script crowd_transition_sfx_neutral_to_positive 
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x7ba459ad)}
		crowd_generic_transition_sfx state = neutral_to_positive player = <player>
	endif
endscript

script crowd_transition_sfx_neutral_to_negative 
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x73ffdd74)}
		crowd_generic_transition_sfx state = neutral_to_negative player = <player>
	endif
endscript

script crowd_transition_sfx_positive_to_neutral 
	gh3_adjustcrowdloopbacktodefault \{time = 1
		normal = 1}
	if gotparam \{player}
		wait \{1
			gameframe}
		printf \{channel = sfx
			qs(0x713e8a0b)}
		crowd_generic_transition_sfx state = positive_to_neutral player = <player>
	endif
endscript

script menu_music_on 
	spawnscriptnow menu_music_on_spawned params = {<...>}
endscript

script menu_music_on_spawned 
	if ($menu_music_on_flag = 1)
		return
	else
		change \{menu_music_on_flag = 1}
	endif
	if gotparam \{waitforguitarlick}
		wait \{4
			seconds}
		soundevent \{event = guitar_lick_crowd_swell}
	endif
	enableusermusic
	begin
	soundevent \{event = menu_music_se}
	if ($menu_music_pan_right = 1)
		setsoundparams \{$current_menu_song
			pan1x = -1
			pan1y = 1
			pan2x = -0.4
			pan2y = 1}
	endif
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = frontend
		fadeintime = 2.0
		fadeintype = linear
		fadeouttime = 2
		fadeouttype = linear}
	one_shot_soundevent soundevent = donothing_oneshot waittime = 5 immediate = <immediate>
	wait \{2
		seconds}
	menu_music_checking
	wait \{1
		second}
	repeat
endscript

script menu_music_panning_vol 
	if (issoundplaying $current_menu_song)
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

script menu_music_pan_reset 
	if ($menu_music_pan_right = 1)
		change \{menu_music_pan_right = 0}
		i = -0.4
		begin
		setsoundparams $current_menu_song pan1x = -1 pan1y = 1 pan2x = <i> pan2y = 1
		i = (<i> + 0.0077770003)
		wait \{1
			gameframe}
		repeat 180
	endif
endscript

script menu_music_pan 
	if ($menu_music_pan_right = 0)
		change \{menu_music_pan_right = 1}
		i = 1
		begin
		setsoundparams $current_menu_song pan1x = -1 pan1y = 1 pan2x = <i> pan2y = 1
		i = (<i> -0.0077770003)
		wait \{1
			gameframe}
		repeat 180
	endif
endscript

script menu_music_checking 
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

script menu_music_off 
	disableusermusic
	killspawnedscript \{name = menu_music_on}
	killspawnedscript \{name = menu_music_on_spawned}
	change \{menu_music_on_flag = 0}
	killmenumusic
endscript

script gh5_band_screen_ui_sound \{player_num = 2}
	setspawninstancelimits \{max = 6
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
	if gotparam \{up}
		printf \{channel = sfx
			qs(0x33228a6e)}
		stopsound \{lobbyscroll01}
		playsound lobbyscroll01 vol = -9 pitch = 1 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{down}
		printf \{channel = sfx
			qs(0x603e66a7)}
		stopsound \{lobbyscroll01}
		playsound lobbyscroll01 vol = -9 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{choose}
		printf \{channel = sfx
			qs(0x03d77756)}
		stopsound \{lobbyselecta}
		playsound lobbyselecta vol = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{back}
		printf \{channel = sfx
			qs(0x3e573add)}
		stopsound \{lobbyback06}
		playsound lobbyback06 vol = -8 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{generic_back}
		printf \{channel = sfx
			qs(0xffb7ef45)}
		stopsound \{ui_sound_09}
		playsound ui_sound_09 vol = -5.5 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
	if gotparam \{error}
		printf \{channel = sfx
			qs(0x6504f146)}
		stopsound \{menu_select_negative}
		playsound menu_select_negative vol = -4 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script game_rules_sfx 
	if gotparam \{scroll}
		switch <scroll>
			case up
			soundevent \{event = ui_sfx_scroll_up}
			case down
			soundevent \{event = ui_sfx_scroll_up}
			default
			soundevent \{event = ui_sfx_scroll_up}
		endswitch
	elseif gotparam \{choose}
		soundevent \{event = ui_sfx_select}
	elseif gotparam \{negative}
		soundevent \{event = ui_sfx_negative_select}
	endif
endscript

script attract_mode_start_sound_script 
	printf \{channel = sfx
		qs(0xa66c98f7)}
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

script attract_mode_ends_sound_script 
	printf \{channel = sfx
		qs(0x2023477e)}
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

script sound_options_scroll 
	soundevent \{event = audio_options_up_down}
endscript

script playing_sound_fader \{time = 2.102}
endscript

script playing_sound_knob 
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

script menu_music_fade \{wait = 0
		volume = 100
		time = 0}
	wait <wait> seconds
	if gotparam \{out}
		setsoundbussparams {music_frontend = {vol = (($default_bussset.music_frontend.vol) - <volume>)} time = <time>}
		if NOT gotparam \{dont_fade_crowd}
			printf \{channel = sfx
				qs(0x66d4f019)}
			setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) - <volume>)} time = <time>}
		endif
	else
		if gotparam \{in}
			setsoundbussparams {music_frontend = {vol = ($default_bussset.music_frontend.vol)} time = <time>}
			printf \{channel = sfx
				qs(0xd3aa811b)}
			setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)} time = <time>}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = frontend
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 2
				fadeouttype = linear}
			one_shot_soundevent soundevent = donothing_oneshot waittime = 5 immediate = <immediate>
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
	printf channel = sfx qs(0x368ed67a) s = <pan1x> p = <pan2x>
	return <...>
endscript

script ui_sfx_freeplay 
	getplayerinfo <player> part
	get_multiplayer_sfx_pan_values player = <player>
	switch <type>
		case jump
		playsound freeplay_enter_sfx vol = 2 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x676c844f)}
		case start
		playsound freeplay_enter_sfx vol = 3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x896c91fb)}
		case select
		playsound ui_sound_05 vol = 3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x0ae2d889)}
		case instrument
		playsound ui_sound_05 vol = 3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xf7571e78)}
		case up
		playsound menu_scroll_up vol = 3 pitch = 1 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xcac0cdfe)}
		case down
		playsound menu_scroll_down vol = 3 pitch = 3 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xafc32f0f)}
		case drop
		playsound freeplay_drop_sfx vol = 6 pitch = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0x43aa5374)}
		case back
		playsound ui_sound_09 vol = 0.5 pitch = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		printf \{channel = sfx
			qs(0xfa648a70)}
		case `default`
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
	if gotparam \{transition}
		printf channel = sfx qs(0x72f3cb1c) s = <transition>
		switch <transition>
			case 'Start_Of_Game_Setup_Immediate'
			change \{current_music_dsp_snapshot_setting = 'house'}
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
			songsetvenueeffectsendvolume \{track = band
				vol = -100}
			case 'Start_Of_Game_Fade_In_To_House'
			change \{current_music_dsp_snapshot_setting = 'house'}
			setsoundbussparams \{$house_bussset
				time = 0.5}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 0.5}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			setsoundbussparams \{$house_crowd_bussset
				time = 0.15}
			case 'Fade_Out_House_Music_To_Start_A_Stage_Song'
			setsoundbussparams \{$music_stream_quiet_bussset
				time = 5.0}
			setsoundbussparams \{$prestage_crowd_bussset
				time = 8}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good
				fadeintime = 6
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			wait \{2.5
				seconds}
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
			songsetvenueeffectsendvolume \{track = band
				vol = -100}
			change \{current_music_dsp_snapshot_setting = 'stage'}
			gh5_music_change_dsp_snapshot \{snapshot = 'stage'
				time = 0.0}
			setsoundbussparams \{$stage_crowd_bussset
				time = 15}
			case 'End_Of_Stage_Song_Fade_Out_Crowd'
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
				fadeintime = 20
				fadeintype = linear
				fadeouttime = 20
				fadeouttype = linear}
			setsoundbussparams \{$house_bussset
				time = 25}
			case 'End_Of_Stage_Song_Setup_House_Immediate'
			change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 0}
			setsoundbussparams \{$house_3db_bussset
				time = 0.0}
			case 'Stage_To_Join'
			soundevent \{event = $current_crowd_swell_short_soundevent}
			soundevent \{event = $current_crowd_swell_med_soundevent}
			change \{current_music_dsp_snapshot_setting = 'join'}
			gh5_music_change_dsp_snapshot \{snapshot = 'join'
				time = 2}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good
				fadeintime = 2.0
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			case 'House_To_Join'
			soundevent \{event = $current_crowd_swell_short_soundevent}
			soundevent \{event = $current_crowd_swell_med_soundevent}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			change \{current_music_dsp_snapshot_setting = 'join'}
			gh5_music_change_dsp_snapshot \{snapshot = 'join'
				time = 2}
			case 'Join_To_Game'
			printf \{channel = sfx
				qs(0x15aab6d4)}
			change \{current_music_dsp_snapshot_setting = 'game'}
			gh5_music_change_dsp_snapshot \{snapshot = 'game'
				time = 4.0}
			case 'Join_To_House'
			change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Join_To_Stage'
			change \{current_music_dsp_snapshot_setting = 'stage'}
			setsoundbussparams \{$stage_crowd_bussset
				time = 2}
			gh5_music_change_dsp_snapshot \{snapshot = 'stage'
				time = 1.0}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good
				fadeintime = 3
				fadeintype = linear
				fadeouttime = 10
				fadeouttype = linear}
			case 'Game_To_Pause'
			setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) - 3)} time = 2}
			change \{current_music_dsp_snapshot_setting = 'pause'}
			gh5_music_change_dsp_snapshot \{snapshot = 'pause'
				time = 1.0}
			case 'Pause_To_Game'
			printf \{channel = sfx
				qs(0xee66b36a)}
			setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)} time = 2}
			change \{current_music_dsp_snapshot_setting = 'game'}
			gh5_music_change_dsp_snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = freeplay_music_crowd_transitions_pause_to_game}
			case 'Pause_To_Setlist'
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
				fadeintime = 2.5
				fadeintype = linear
				fadeouttime = 2.5
				fadeouttype = linear}
			setsoundbussparams \{$music_stream_quiet_bussset
				time = 0.3}
			case 'Pause_To_MainMenu'
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
				fadeintime = 2
				fadeintype = linear
				fadeouttime = 3.5
				fadeouttype = linear}
			change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			one_shot_soundevent soundevent = donothing_oneshot waittime = 5 immediate = <immediate>
			case 'Pause_To_House'
			change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Pause_To_Stage'
			change \{current_music_dsp_snapshot_setting = 'stage'}
			gh5_music_change_dsp_snapshot \{snapshot = 'stage'
				time = 1.0}
			setsoundbussparams \{$prestage_crowd_bussset
				time = 1}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
				fadeintime = 0.2
				fadeintype = linear}
			case 'Setlist_To_Pause'
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good
				fadeintime = 1.5}
			setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) - 3)} time = 2}
			change \{current_music_dsp_snapshot_setting = 'pause'}
			gh5_music_change_dsp_snapshot \{snapshot = 'pause'
				time = 0.5}
			case 'Setlist_To_Game'
			printf \{channel = sfx
				qs(0x58ccbfbe)}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good
				fadeintime = 4.5
				fadeintype = linear
				fadeouttime = 6
				fadeouttype = linear}
			change \{current_music_dsp_snapshot_setting = 'game'}
			gh5_music_change_dsp_snapshot \{snapshot = 'game'
				time = 0.5
				scriptname = freeplay_music_crowd_transitions_setlist_to_game}
			case 'Game_To_House'
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good
				fadeintime = 3
				volpercentincrease = 20}
			change \{current_music_dsp_snapshot_setting = 'house'}
			gh5_music_change_dsp_snapshot \{snapshot = 'house'
				time = 1.0}
			wait \{4
				seconds}
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
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

script song_intro_kick_sfx_waiting 
	gamemode_gettype
	if NOT (<type> = freeplay)
		wait ($current_intro.hud_move_time / 1000.0) seconds
		soundevent \{event = song_intro_kick_sfx}
	endif
endscript

script song_intro_highway_up_sfx_waiting 
	gamemode_gettype
	if NOT (<type> = freeplay)
		waittime = (($current_intro.highway_move_time / 1000.0) - 1.5)
		if (<waittime> < 0)
			waittime = 0
		endif
		wait <waittime> seconds
		soundevent \{event = song_intro_highway_up}
		getpakmancurrent \{map = zones}
	else
		if ($beginning_of_freeplay_highway_up = 1)
			change \{beginning_of_freeplay_highway_up = 0}
			soundevent \{event = song_intro_highway_up}
		endif
	endif
endscript

script song_intro_highway_up_vocals_sfx_waiting 
	soundevent \{event = vocal_highway_appear}
endscript

script gh_sfx_intro_warmup 
	killspawnedscript \{name = loading_screen_crowd_swell}
	killspawnedscript \{name = crowd_loading_whistle}
	printf \{channel = sfx
		qs(0xa4fa756e)}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol))} time = 2}
endscript

script gh_sfx_countoff_logic 
	gamemode_gettype
	getnumplayersingame \{local}
	getfirstplayer \{local}
	gman_songtool_getcurrentsong
	get_song_struct song = <current_song>
	if structurecontains structure = <song_struct> name = countoff
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
				playsound \{stickclickmed
					buss = countoffs
					send_vol1 = $current_send_vol
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
				case 'hihat01'
				playsound \{hihatclosed01
					buss = countoffs
					send_vol1 = $current_send_vol
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
				case 'sticks_tiny'
				playsound \{stickclicksmall
					buss = countoffs
					send_vol1 = $current_send_vol
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
				case 'sticks_huge'
				playsound \{stickclicklarge
					buss = countoffs
					send_vol1 = $current_send_vol
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
				case 'hihat02'
				playsound \{hihatopen02
					buss = countoffs
					send_vol1 = $current_send_vol
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
				case 'hihat03'
				playsound \{hihatpedal02
					buss = countoffs
					send_vol1 = $current_send_vol
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
					send_vol1 = $current_send_vol
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
					case 'sticks_normal'
					playsound \{stickclickmed
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'hihat01'
					playsound \{hihatclosed01
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'Sticks_Tiny'
					playsound \{stickclicksmall
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'sticks_huge'
					playsound \{stickclicklarge
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'Hihat02'
					playsound \{hihatopen02
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'Hihat03'
					playsound \{hihatpedal02
						buss = countoffs
						send_vol1 = $current_send_vol
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
						send_vol1 = $current_send_vol
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
					case 'sticks_normal'
					playsound \{stickclickmed
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'hihat01'
					playsound \{hihatclosed01
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'Sticks_Tiny'
					playsound \{stickclicksmall
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'sticks_huge'
					playsound \{stickclicklarge
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'Hihat02'
					playsound \{hihatopen02
						buss = countoffs
						send_vol1 = $current_send_vol
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
					case 'Hihat03'
					playsound \{hihatpedal02
						buss = countoffs
						send_vol1 = $current_send_vol
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
						send_vol1 = $current_send_vol
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
		printf \{channel = sfx
			qs(0xc53b1018)}
		if (<velocity> > 99)
			switch <countoff_sound>
				case 'sticks_normal'
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
				case 'hihat01'
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
				case 'Sticks_Tiny'
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
				case 'sticks_huge'
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
				case 'Hihat02'
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
				case 'Hihat03'
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
					case 'sticks_normal'
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
					case 'hihat01'
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
					case 'Sticks_Tiny'
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
					case 'sticks_huge'
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
					case 'Hihat02'
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
					case 'Hihat03'
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
					case 'sticks_normal'
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
					case 'hihat01'
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
					case 'Sticks_Tiny'
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
					case 'sticks_huge'
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
					case 'Hihat02'
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
					case 'Hihat03'
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

script you_rock_waiting_crowd_sfx 
	wait \{2
		seconds}
	soundevent \{event = medium_crowd_applause}
endscript

script gh3_sfx_fail_song_stop_sounds 
	stopsoundsbybuss \{crowd}
	stopsoundsbybuss \{ui_star_power}
	stopsoundsbybuss \{practice_band_playback}
	stopsoundsbybuss \{wrong_notes_bass}
	stopsoundsbybuss \{wrong_notes_drums}
	stopsoundsbybuss \{wrong_notes_guitar}
	stopsoundsbybuss \{binkcutscenes}
endscript

script gh3_sfx_stop_sounds_for_killsong \{loading_transition = 0}
	setsoundbussparams {`default` = {vol = ($default_bussset.`default`.vol)} time = 0.02}
	stopsoundevent \{song_intro_kick_sfx}
	stopsoundevent \{pyro}
	stopsoundevent \{notes_ripple_up_sfx}
	stopsoundevent \{song_intro_highway_up}
	stopsoundevent \{crowd_fast_surge_cheer}
	stopsoundevent \{medium_crowd_applause}
	stopsoundevent \{lose_multiplier_crowd}
	stopsoundevent \{star_power_release_front_p1_gh4}
	stopsoundevent \{star_power_release_center_p1_gh4}
	stopsoundevent \{star_power_release_center_p2_gh4}
	stopsoundevent \{star_power_release_front_p2_gh4}
	stopsoundevent \{star_power_deployed_lfe_p1_gh4}
	stopsoundevent \{star_power_deployed_lfe_p2_gh4}
	stopsoundevent \{star_power_deployed_front_p1_gh4}
	stopsoundevent \{star_power_deployed_back_p1_gh4}
	stopsoundevent \{star_power_deployed_front_p2_gh4}
	stopsoundevent \{star_power_deployed_back_p2_gh4}
	stopsoundevent \{star_power_available_p2_gh4}
	stopsoundevent \{star_power_available_p1_gh4}
	stopsound \{shredfest_momentum_difficulty_down}
	stopsound \{$current_crowd_transition_neutral_to_positive}
	stopsound \{shredfest_player_dropout}
	stopsound \{point_awarded}
	stopsound \{shredfest_momentum_difficulty_up}
	stopsoundevent \{shredfest_play_suddendeath_dropped}
	stopsoundevent \{star_power_awarded_sfx}
	stopsoundevent \{star_power_awarded_sfx_p1}
	stopsoundevent \{star_power_awarded_sfx_p2}
	stopsoundevent \{star_power_ready_sfx}
	stopsoundevent \{star_power_available_gh4}
	stopsoundevent \{star_power_release_center_gh4}
	stopsoundevent \{star_power_release_front_gh4}
	stopsoundevent \{star_power_deployed_sfx}
	stopsoundevent \{star_power_deployed_cheer_sfx}
	stopsoundevent \{star_power_deployed_cheer_sfx_p1}
	stopsoundevent \{star_power_deployed_cheer_sfx_p2}
	stopsoundevent \{star_power_deployed_cheer_sfx_p3}
	stopsoundevent \{$current_crowd_clap_normal_soundevent}
	stopsoundevent \{$current_crowd_clap_middle_soundevent}
	stopsoundevent \{$current_crowd_clap_left_middle_soundevent}
	stopsoundevent \{$current_crowd_clap_right_middle_soundevent}
	stopsoundevent \{$current_crowd_clap_left_soundevent}
	stopsoundevent \{$current_crowd_clap_right_soundevent}
	stopsoundevent \{star_power_deployed_back_gh4}
	stopsoundevent \{star_power_deployed_lfe_gh4}
	stopsoundevent \{star_power_deployed_front_gh4}
	stopsoundsbybuss \{practice_band_playback}
	stopsoundevent \{ui_sfx_lose_multiplier_2x}
	stopsoundevent \{ui_sfx_lose_multiplier_3x}
	stopsoundevent \{ui_sfx_lose_multiplier_4x}
	stopsoundevent \{lose_multiplier_crowd}
	stopsoundevent \{star_power_deployed_back_p3_gh4}
	stopsoundevent \{star_power_deployed_front_p3_gh4}
	stopsoundevent \{star_power_available_p3_gh4}
	stopsoundevent \{star_power_awarded_sfx_p3}
	stopsoundevent \{star_power_release_center_p3_gh4}
	stopsoundevent \{star_power_release_front_p3_gh4}
	stopsoundevent \{ui_sfx_50_note_streak_singleplayer}
	stopsoundevent \{ui_sfx_50_note_streak_p1}
	stopsoundevent \{ui_sfx_50_note_streak_p2}
	stopsoundevent \{ui_sfx_100_note_streak_singleplayer}
	stopsoundevent \{ui_sfx_100_note_streak_p1}
	stopsoundevent \{ui_sfx_100_note_streak_p2}
	stopsoundsbybuss \{drums_ingame}
	stopsoundsbybuss \{drums_jammode}
	stopsoundsbybuss \{guitar_jammode}
	stopsoundsbybuss \{bass_jammode}
	stopsoundsbybuss \{wrong_notes_guitar}
	stopsoundsbybuss \{wrong_notes_bass}
	stopsoundsbybuss \{wrong_notes_drums}
	if (<type> = normal)
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

script gh_sfx_tutorial_hammer_on_lesson_2 
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

script stopnotes_01 
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

script stopnotes_02 
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

script stopnotes_03 
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

script stopnotes_04 
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

script stopnotes_05 
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

script stopnotes_06 
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

script tutorial_mode_finish_chord_02 
	wait \{1
		seconds}
	soundevent \{event = tutorial_mode_finish_chord}
endscript

script tutorial_mode_finish_chord_03 
	wait \{0.3
		seconds}
	soundevent \{event = tutorial_mode_finish_chord}
endscript

script gh_sfx_note_streak_singleplayer 
	if NOT (($crowd_in_jam_mode_song_state = 1))
		if ((<combo> = 1000) || (<combo> = 500))
			soundevent \{event = ui_sfx_100_note_streak_singleplayer}
		else
			soundevent \{event = ui_sfx_50_note_streak_singleplayer}
		endif
	endif
endscript

script gh_sfx_note_streak_p1 
	if NOT (($crowd_in_jam_mode_song_state = 1))
		if ((<combo> = 1000) || (<combo> = 500))
			soundevent \{event = ui_sfx_100_note_streak_p1}
		else
			soundevent \{event = ui_sfx_50_note_streak_p1}
		endif
	endif
endscript

script gh_sfx_note_streak_p2 
	if NOT (($crowd_in_jam_mode_song_state = 1))
		if ((<combo> = 1000) || (<combo> = 500))
			soundevent \{event = ui_sfx_100_note_streak_p2}
		else
			soundevent \{event = ui_sfx_50_note_streak_p2}
		endif
	endif
endscript

script guitar_wrong_note_sound_logic \{vol = 0.0
		pitch = 0.0
		soundasset = `default`
		buss = `default`
		pan1x = 0.0
		pan1y = 0.0
		pan2x = 0.0
		pan2y = 0.0}
	getplayerinfo <player> highway_position
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

script playlist_scroll_sfx 
	soundevent \{event = playlist_scroll_sound}
endscript

script songlist_scroll_sfx 
	soundevent \{event = songlist_scroll_sound}
endscript

script songlist_playlist_switch_sfx 
	soundevent \{event = songlist_to_playlist_switch_sfx}
endscript

script sort_songlist_sfx 
	soundevent \{event = sort_songlist}
endscript

script revive_or_kill_player_sfx \{player = 1
		vocalist = 0
		cheer = 0}
	get_multiplayer_sfx_pan_values player = <player> vocalist = <vocalist>
	transitionevent = $current_crowd_transition_neutral_to_positive
	if (<cheer> = 1)
		stopsound \{$current_crowd_transition_neutral_to_positive}
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

script momentum_difficulty_up_sfx 
	get_multiplayer_sfx_pan_values player = <player>
	transitionevent = $current_crowd_transition_neutral_to_positive
	stopsound \{shredfest_momentum_difficulty_up}
	stopsound \{$current_crowd_transition_neutral_to_positive}
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
		case `default`
		printf \{channel = sfx
			qs(0x578d9ab3)}
	endswitch
endscript

script momentum_difficulty_down_sfx 
	get_multiplayer_sfx_pan_values player = <player>
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
		case `default`
		printf \{channel = sfx
			qs(0x578d9ab3)}
	endswitch
endscript

script elimination_sfx_logic 
	if NOT issoundplaying \{shredfest_player_dropout}
		get_multiplayer_sfx_pan_values player = <player>
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

script cast_vote_ui_sfx 
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

script kill_voting_screen_sfx 
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

script voting_screen_timer 
	spawnscriptnow \{counter_play_beep_spawn
		params = {
			time = 2.5
		}}
	wait \{2.5
		seconds}
	killspawnedscript \{name = counter_play_beep_spawn}
endscript

script tie_breaker_sfx 
	printf channel = sfx qs(0x00c56ec0) s = <count>
	volume = -13
	switch <count>
		case 1
		playsound menu_gameplay_spin vol = <volume> pitch = 1.0 buss = front_end
		case 2
		playsound menu_gameplay_spin vol = <volume> pitch = 1.05 buss = front_end
		case 3
		playsound menu_gameplay_spin vol = <volume> pitch = 1.1 buss = front_end
		case 4
		playsound menu_gameplay_spin vol = <volume> pitch = 1.15 buss = front_end
		case 5
		playsound menu_gameplay_spin vol = <volume> pitch = 1.1 buss = front_end
		case 6
		playsound menu_gameplay_spin vol = <volume> pitch = 1.0 buss = front_end
		case 7
		playsound menu_gameplay_spin vol = <volume> pitch = 0.9 buss = front_end
		case 8
		playsound menu_gameplay_spin vol = <volume> pitch = 0.75 buss = front_end
		case 9
		playsound menu_gameplay_spin vol = <volume> pitch = 0.65000004 buss = front_end
		case 10
		playsound menu_gameplay_spin vol = <volume> pitch = 0.5 buss = front_end
		case 11
		playsound menu_gameplay_spin vol = <volume> pitch = 0.4 buss = front_end
		case 12
		playsound menu_gameplay_spin vol = <volume> pitch = 0.3 buss = front_end
		case 13
		playsound menu_gameplay_spin vol = <volume> pitch = 0.25 buss = front_end
		case 14
		playsound menu_gameplay_spin vol = <volume> pitch = 0.2 buss = front_end
		case 15
		playsound menu_gameplay_spin vol = <volume> pitch = 0.16 buss = front_end
		case 16
		playsound menu_gameplay_spin vol = <volume> pitch = 0.14 buss = front_end
		case 17
		playsound menu_gameplay_spin vol = <volume> pitch = 0.120000005 buss = front_end
		default
		playsound menu_gameplay_spin vol = <volume> pitch = 0.120000005 buss = front_end
		printf \{channel = sfx
			qs(0x9716a790)}
	endswitch
endscript

script voting_outcome_result_sfx 
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

script spawned_point_awarded_waiting \{pan_wide = 0}
	printf \{channel = sfx
		qs(0x046b774e)}
	if (<pan_wide> = 1)
		<pan1x> = -1
		<pan1y> = 1
		<pan2x> = 1
		<pan2y> = 1
	else
		get_multiplayer_sfx_pan_values player = <player>
	endif
	wait \{0.08
		seconds}
	playsound point_awarded vol = -7.5 buss = ui_ingame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
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
		get_multiplayer_sfx_pan_values player = <player>
	endif
	playsound point_awarded vol = -7.5 buss = ui_ingame pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script switch_teams_sfx \{type = request
		direction = left}
	request_vol = -6
	resend_vol = -6
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
			soundevent \{event = online_team_switch_affirmation_sfx}
			default
			printf \{channel = sfx
				qs(0x5d4ccbf4)}
		endswitch
	endif
endscript

script car_scroll_widget_sfx 
	setspawnedscriptnorepeatfor \{time = 0.07}
	playsound car_widget_scroll vol = -10 pitch_percent = ((<fill_perc> * 6.0) + 90) buss = front_end
endscript

script highway_ripple_ui_sfx 
	if (<type> = freeplay)
		if NOT playerinfoequals <player> freeplay_state = dropped
			if NOT playerinfoequals <player> part = vocals
				soundevent \{event = notes_ripple_up_sfx}
			endif
		endif
	else
		if NOT playerinfoequals <player> part = vocals
			soundevent \{event = notes_ripple_up_sfx}
		endif
	endif
endscript

script ui_venue_unlock_sfx 
	wait \{0.05
		seconds}
	soundevent \{event = venue_unlock_sfx}
endscript

script unlock_item_ui_sfx 
	soundevent \{event = ui_unlock_item_sfx}
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

script startpinknoiseloopforcaliratelagscreen 
	playsound \{pinknoise_minnus_20
		buss = `default`
		vol = -70
		num_loops = -1}
endscript

script stoppinknoiseloopforcaliratelagscreen 
	stopsound \{pinknoise_minnus_20}
endscript

script testtoneenterscript 
	setsoundbussparams {sfx_balance = {vol = (($default_bussset.sfx_balance.vol) - 100)}}
endscript

script testtoneexitscript 
	setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)}}
endscript

script muting_test_setup_script 
	setsoundbussparams \{ui = {
			vol = -100.0
		}}
	change \{crowd_debug_mode = 1}
endscript

script audio_sync_test_disable_highway 
	disable_bg_viewport
	change \{save_check_time_early = $check_time_early}
	change \{save_check_time_late = $check_time_late}
	change \{check_time_early = 1.0}
	change \{check_time_late = 1.0}
endscript

script audio_sync_test_enable_highway 
	enable_bg_viewport
	change \{check_time_early = $save_check_time_early}
	change \{check_time_late = $save_check_time_late}
endscript

script profiling_fmod_effects 
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

script star_power_deployed_sfx_multiplayer \{player = 1}
	printf \{channel = sfx
		qs(0x9e86cd69)}
	getplayerinfo <player> highway_position
	printf channel = sfx qs(0x3c9d8c67) s = <highway_position>
	if NOT issoundplaying \{star_deployed_back}
		printf \{channel = sfx
			qs(0xc62aa5dd)}
		if (<highway_position> = left)
			printf \{channel = sfx
				qs(0x4dfd5b77)}
			soundevent \{event = star_power_deployed_lfe_p1_gh4}
			soundevent \{event = star_power_deployed_back_p1_gh4}
			soundevent \{event = star_power_deployed_front_p1_gh4}
			soundevent \{event = star_power_deployed_cheer_sfx_p1}
		else
			if (<highway_position> = right)
				printf \{channel = sfx
					qs(0x290badee)}
				soundevent \{event = star_power_deployed_lfe_p1_gh4}
				soundevent \{event = star_power_deployed_back_p2_gh4}
				soundevent \{event = star_power_deployed_front_p2_gh4}
				soundevent \{event = star_power_deployed_cheer_sfx_p2}
			else
				printf \{channel = sfx
					qs(0xb3f669ca)}
				soundevent \{event = star_power_deployed_lfe_p1_gh4}
				soundevent \{event = star_power_deployed_back_p3_gh4}
				soundevent \{event = star_power_deployed_front_p3_gh4}
				soundevent \{event = star_power_deployed_cheer_sfx_p3}
			endif
		endif
		printf \{channel = sfx
			qs(0xe6e95e4d)}
		change \{star_power_deployed_flag = 1}
		wait \{0.9
			seconds}
		printf \{channel = sfx
			qs(0x0a5c5d52)}
		change \{star_power_deployed_flag = 0}
	else
		printf \{channel = sfx
			qs(0xe4f96e42)}
		if ($star_power_deployed_flag = 1)
			printf \{channel = sfx
				qs(0xbf9f78e2)}
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
				qs(0x181f2540)}
			if (<highway_position> = left)
				printf \{channel = sfx
					qs(0x4dfd5b77)}
				soundevent \{event = star_power_deployed_lfe_p1_gh4}
				soundevent \{event = star_power_deployed_back_p1_gh4}
				soundevent \{event = star_power_deployed_front_p1_gh4}
				soundevent \{event = star_power_deployed_cheer_sfx_p1}
			else
				if (<highway_position> = right)
					printf \{channel = sfx
						qs(0x290badee)}
					soundevent \{event = star_power_deployed_lfe_p1_gh4}
					soundevent \{event = star_power_deployed_back_p2_gh4}
					soundevent \{event = star_power_deployed_front_p2_gh4}
					soundevent \{event = star_power_deployed_cheer_sfx_p2}
				else
					printf \{channel = sfx
						qs(0xb3f669ca)}
					soundevent \{event = star_power_deployed_lfe_p1_gh4}
					soundevent \{event = star_power_deployed_back_p3_gh4}
					soundevent \{event = star_power_deployed_front_p3_gh4}
					soundevent \{event = star_power_deployed_cheer_sfx_p3}
				endif
			endif
		endif
	endif
endscript

script star_power_ready_sfx_multiplayer \{player = 1}
	getplayerinfo <player> highway_position
	if NOT issoundplaying \{star_available}
		if (<highway_position> = left)
			soundevent \{event = star_power_available_p1_gh4}
		elseif (<highway_position> = right)
			soundevent \{event = star_power_available_p2_gh4}
		else
			soundevent \{event = star_power_available_p3_gh4}
		endif
		change \{star_power_ready_flag = 1}
		wait \{0.9
			second}
		change \{star_power_ready_flag = 0}
	else
		if ($star_power_ready_flag = 1)
			setsoundparams \{star_available
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				soundevent \{event = star_power_available_p1_gh4}
			elseif (<highway_position> = right)
				soundevent \{event = star_power_available_p2_gh4}
			else
				soundevent \{event = star_power_available_p3_gh4}
			endif
		endif
	endif
endscript

script star_power_awarded_sfx_multiplayer \{player = 1}
	getplayerinfo <player> highway_position
	if NOT issoundplaying \{sp_awarded1}
		if (<highway_position> = left)
			soundevent \{event = star_power_awarded_sfx_p1}
		elseif (<highway_position> = right)
			soundevent \{event = star_power_awarded_sfx_p2}
		else
			soundevent \{event = star_power_awarded_sfx_p3}
		endif
		change \{star_power_awarded_flag = 1}
		wait \{0.3
			second}
		change \{star_power_awarded_flag = 0}
	else
		if ($star_power_awarded_flag = 1)
			setsoundparams \{sp_awarded1
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<highway_position> = left)
				soundevent \{event = star_power_awarded_sfx_p1}
			elseif (<highway_position> = right)
				soundevent \{event = star_power_awarded_sfx_p2}
			else
				soundevent \{event = star_power_awarded_sfx_p3}
			endif
		endif
	endif
endscript

script star_power_release_sfx_multiplayer \{player = 1}
	getplayerinfo <player> highway_position
	if NOT issoundplaying \{star_release_front}
		if (<highway_position> = left)
			soundevent \{event = star_power_release_center_p1_gh4}
			soundevent \{event = star_power_release_front_p1_gh4}
		elseif (<highway_position> = right)
			soundevent \{event = star_power_release_center_p2_gh4}
			soundevent \{event = star_power_release_front_p2_gh4}
		else
			soundevent \{event = star_power_release_center_p3_gh4}
			soundevent \{event = star_power_release_front_p3_gh4}
		endif
		change \{star_power_deployed_flag = 1}
		wait \{0.9
			second}
		change \{star_power_deployed_flag = 0}
	else
		if ($star_power_deployed_flag = 1)
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
				soundevent \{event = star_power_release_center_p1_gh4}
				soundevent \{event = star_power_release_front_p1_gh4}
			elseif (<highway_position> = right)
				soundevent \{event = star_power_release_center_p2_gh4}
				soundevent \{event = star_power_release_front_p2_gh4}
			else
				soundevent \{event = star_power_release_center_p3_gh4}
				soundevent \{event = star_power_release_front_p3_gh4}
			endif
		endif
	endif
endscript

script stopallcheeringsounds 
	stopsoundevent \{$current_crowd_swell_short_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$current_crowd_applause_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$current_crowd_swell_short_soft_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$current_crowd_swell_med_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	stopsoundevent \{$current_crowd_swell_long_soundevent
		fade_time = 0.8
		fade_type = log_slow}
	change \{turn_off_oneshot_cheers = 1}
	wait \{8
		seconds}
	change \{turn_off_oneshot_cheers = 0}
endscript

script clap_fading 
	change \{clap_fade = 1}
	setsoundbussparams \{crowd_star_power = {
			vol = -100
		}
		time = 5}
	wait \{5
		seconds}
	change \{clap_fade = 0}
	change \{star_clap_left = 0}
	change \{star_clap_right = 0}
	change \{star_clap_left_middle = 0}
	change \{star_clap_right_middle = 0}
	change \{star_clap_middle = 0}
	change \{star_clap_normal = 0}
	setsoundbussparams {crowd_star_power = {vol = ($default_bussset.crowd_star_power.vol)} time = 0.1}
endscript

script clap_fade_kill 
	killspawnedscript \{name = clap_fading}
	setsoundbussparams {crowd_star_power = {vol = ($default_bussset.crowd_star_power.vol)} time = 0.1}
endscript

script star_power_clap_panning \{player = 1}
	if NOT issingleplayergame
		getplayerinfo <player> highway_position
		if (<highway_position> = left)
			change \{star_clap_left = 1}
			change \{star_clap_right = 0}
			change \{star_clap_left_middle = 0}
			change \{star_clap_right_middle = 0}
			change \{star_clap_middle = 0}
			change \{star_clap_normal = 0}
			change \{star_clap_leftcenterright = 0}
		elseif (<highway_position> = right)
			change \{star_clap_right = 1}
			change \{star_clap_left = 0}
			change \{star_clap_left_middle = 0}
			change \{star_clap_right_middle = 0}
			change \{star_clap_middle = 0}
			change \{star_clap_normal = 0}
			change \{star_clap_leftcenterright = 0}
		else
			change \{star_clap_middle = 1}
			change \{star_clap_left = 0}
			change \{star_clap_right = 0}
			change \{star_clap_left_middle = 0}
			change \{star_clap_right_middle = 0}
			change \{star_clap_normal = 0}
			change \{star_clap_leftcenterright = 0}
		endif
	else
		change \{star_clap_normal = 1}
		change \{star_clap_left = 0}
		change \{star_clap_right = 0}
		change \{star_clap_left_middle = 0}
		change \{star_clap_right_middle = 0}
		change \{star_clap_middle = 0}
		change \{star_clap_leftcenterright = 0}
	endif
endscript

script star_power_clap_panning_multiple \{player = 1}
	printf \{channel = sfx
		qs(0xd4253830)}
	if NOT issingleplayergame
		printf \{channel = sfx
			qs(0xfae4d235)}
		getplayerinfo <player> highway_position
		printf channel = sfx qs(0x1fc7622c) s = <highway_position>
		if (<highway_position> = left)
			if (($star_clap_right = 1))
				change \{star_clap_normal = 1}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_right_middle = 1)
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 1}
			elseif ($star_clap_middle = 1)
				change \{star_clap_left_middle = 1}
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			endif
		elseif (<highway_position> = right)
			if (($star_clap_left = 1))
				change \{star_clap_normal = 1}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_left_middle = 1)
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 1}
			elseif ($star_clap_middle = 1)
				change \{star_clap_right_middle = 1}
				change \{star_clap_left_middle = 0}
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			endif
		else
			if ($star_clap_left = 1)
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 1}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_right = 1)
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 1}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_normal = 1)
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 1}
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

script star_clap_end \{player = 1}
	if NOT issingleplayergame
		getplayerinfo <player> highway_position
		if (<highway_position> = left)
			if (($star_clap_left_middle = 1))
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 1}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_normal = 1)
				change \{star_clap_left_middle = 0}
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 1}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_leftcenterright = 1)
				change \{star_clap_left_middle = 0}
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_right_middle = 1}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			endif
		elseif (<highway_position> = right)
			if (($star_clap_right_middle = 1))
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 1}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_normal = 1)
				change \{star_clap_right_middle = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_normal = 0}
				change \{star_clap_left = 1}
				change \{star_clap_right = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_leftcenterright = 1)
				change \{star_clap_left_middle = 1}
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			endif
		else
			if ($star_clap_left_middle = 1)
				change \{star_clap_normal = 0}
				change \{star_clap_left = 1}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_right_middle = 1)
				change \{star_clap_normal = 0}
				change \{star_clap_left = 0}
				change \{star_clap_right = 1}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			elseif ($star_clap_leftcenterright = 1)
				change \{star_clap_normal = 1}
				change \{star_clap_left = 0}
				change \{star_clap_right = 0}
				change \{star_clap_left_middle = 0}
				change \{star_clap_right_middle = 0}
				change \{star_clap_middle = 0}
				change \{star_clap_leftcenterright = 0}
			endif
		endif
	endif
endscript

script starttesttones_sine 
	soundbussunlock \{user_vocals}
	setsoundbussparams \{user_vocals = {
			vol = -100.0
		}}
	soundbusslock \{user_vocals}
	soundbussunlock \{user_drums}
	setsoundbussparams \{user_drums = {
			vol = -100.0
		}}
	soundbusslock \{user_drums}
	soundbussunlock \{user_guitar}
	setsoundbussparams \{user_guitar = {
			vol = -100.0
		}}
	soundbusslock \{user_guitar}
	soundbussunlock \{user_bass}
	setsoundbussparams \{user_bass = {
			vol = -100.0
		}}
	soundbusslock \{user_bass}
	soundbussunlock \{user_rhythmgtr}
	setsoundbussparams \{user_rhythmgtr = {
			vol = -100.0
		}}
	soundbusslock \{user_rhythmgtr}
	soundbussunlock \{user_crowd}
	setsoundbussparams \{user_crowd = {
			vol = -100.0
		}}
	soundbusslock \{user_crowd}
	soundbussunlock \{user_sfx}
	setsoundbussparams \{user_sfx = {
			vol = -100.0
		}}
	soundbusslock \{user_sfx}
	soundbussunlock \{user_band}
	setsoundbussparams \{user_band = {
			vol = -100.0
		}}
	soundbusslock \{user_band}
	begin
	playsound \{testtone_sinewav_12db
		pan1x = -1.0
		pan1y = 1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_sinewav_12db
		pan1x = 0.0
		pan1y = 1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_sinewav_12db
		pan1x = 1.0
		pan1y = 1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_sinewav_12db
		pan1x = 1.0
		pan1y = -1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_sinewav_12db
		pan1x = -1.0
		pan1y = -1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_sinewav_12db
		lfeonly = true
		lfe_vol = 0
		buss = master}
	wait \{2
		seconds}
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
	soundbussunlock \{user_vocals}
	setsoundbussparams \{user_vocals = {
			vol = -100.0
		}}
	soundbusslock \{user_vocals}
	soundbussunlock \{user_drums}
	setsoundbussparams \{user_drums = {
			vol = -100.0
		}}
	soundbusslock \{user_drums}
	soundbussunlock \{user_guitar}
	setsoundbussparams \{user_guitar = {
			vol = -100.0
		}}
	soundbusslock \{user_guitar}
	soundbussunlock \{user_bass}
	setsoundbussparams \{user_bass = {
			vol = -100.0
		}}
	soundbusslock \{user_bass}
	soundbussunlock \{user_rhythmgtr}
	setsoundbussparams \{user_rhythmgtr = {
			vol = -100.0
		}}
	soundbusslock \{user_rhythmgtr}
	soundbussunlock \{user_crowd}
	setsoundbussparams \{user_crowd = {
			vol = -100.0
		}}
	soundbusslock \{user_crowd}
	soundbussunlock \{user_sfx}
	setsoundbussparams \{user_sfx = {
			vol = -100.0
		}}
	soundbusslock \{user_sfx}
	soundbussunlock \{user_band}
	setsoundbussparams \{user_band = {
			vol = -100.0
		}}
	soundbusslock \{user_band}
	begin
	playsound \{testtone_pinknoise_12db
		pan1x = -1.0
		pan1y = 1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_pinknoise_12db
		pan1x = 0.0
		pan1y = 1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_pinknoise_12db
		pan1x = 1.0
		pan1y = 1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_pinknoise_12db
		pan1x = 1.0
		pan1y = -1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_pinknoise_12db
		pan1x = -1.0
		pan1y = -1.0
		buss = master}
	wait \{2
		seconds}
	playsound \{testtone_pinknoise_12db
		lfeonly = true
		lfe_vol = 0
		buss = master}
	wait \{2
		seconds}
	repeat
endscript

script stoptesttones 
	if issoundeventplaying \{starttesttones_pink}
		stopsoundevent \{starttesttones_pink}
	endif
	if issoundeventplaying \{starttesttones_sine}
		stopsoundevent \{starttesttones_sine}
	endif
	setsoundbussparams \{user_vocals = {
			vol = 0.0
		}}
	soundbussunlock \{user_drums}
	setsoundbussparams \{user_drums = {
			vol = 0.0
		}}
	soundbusslock \{user_drums}
	setsoundbussparams \{user_guitar = {
			vol = 0.0
		}}
	soundbussunlock \{user_bass}
	setsoundbussparams \{user_bass = {
			vol = 0.0
		}}
	soundbusslock \{user_bass}
	setsoundbussparams \{user_rhythmgtr = {
			vol = 0.0
		}}
	soundbussunlock \{user_crowd}
	setsoundbussparams \{user_crowd = {
			vol = 0.0
		}}
	soundbusslock \{user_crowd}
	soundbussunlock \{user_sfx}
	setsoundbussparams \{user_sfx = {
			vol = 0.0
		}}
	soundbusslock \{user_sfx}
	soundbussunlock \{user_band}
	setsoundbussparams \{user_band = {
			vol = 0.0
		}}
	soundbusslock \{user_band}
endscript

script jam_mode_metronome 
	if gotparam \{downbeat}
		if (<downbeat> = 1)
			playsound stickclickmed vol = RandomFloat (12.5, 13.0)
		endif
	else
		playsound stickclickmed vol = RandomFloat (7.5, 8.0)
	endif
endscript

script menu_music_se 
	printf \{channel = sfx
		qs(0x44f09774)}
	getarraysize \{$menu_music_songs}
	begin
	getrandomvalue name = index integer a = 0 b = (<array_size> -1)
	if NOT (<index> = $menu_music_last_song_index)
		if NOT (<index> = $menu_music_last_last_song_index)
			if NOT (<index> = $menu_music_last_last_last_song_index)
				if NOT (<index> = $menu_music_last_last_last_last_song_index)
					change \{menu_music_last_last_last_last_song_index = $menu_music_last_song_index}
					change \{menu_music_last_last_last_song_index = $menu_music_last_song_index}
					change \{menu_music_last_last_song_index = $menu_music_last_song_index}
					change menu_music_last_song_index = <index>
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
	spawnscriptnow menu_music_se_spawned params = {stream = <stream> array = <array> delay = <delay> vol = <vol> offset = <offset>}
endscript

script menu_music_se_spawned \{vol = 0}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	change \{menu_music_preloading = 1}
	change menu_music_stream = <stream>
	preloadstream <stream>
	begin
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
	startpreloadedstream <unique_id> buss = music_frontend forcesafepreload = 1 vol = (<vol> + 2.5)
	change \{menu_music_preloading = 0}
	change current_menu_song = <stream>
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

script killmenumusic 
	killspawnedscript \{name = menu_music_se_spawned}
	change \{menu_music_preloading = 0}
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
	if NOT ((<type> = freeplay) || (<type> = tutorial))
		if ($current_crowd >= 1.3399999)
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					stopsound \{$current_crowd_anticipation
						fade_time = 3
						fade_type = log_slow}
					spawnscriptnow \{crowd_anticipation_flag_logic}
				endif
			endif
		elseif ($current_crowd >= 1.3)
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					setsoundparams \{$current_crowd_anticipation
						vol = 3
						pitch = 0.3
						time = 0.5}
				endif
			else
				playsound \{$current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					priority = 100
					buss = crowd_beds
					attack_time = 3
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2700001)
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					setsoundparams \{$current_crowd_anticipation
						vol = 1
						pitch = 0.2
						time = 0.5}
				endif
			else
				playsound \{$current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					priority = 100
					buss = crowd_beds
					attack_time = 3
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.25)
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					setsoundparams \{$current_crowd_anticipation
						vol = -1
						pitch = 0.1
						time = 0.5}
				endif
			else
				playsound \{$current_crowd_anticipation
					vol = -3
					pan1x = 0
					pan1y = 0.59
					panremovecenter = true
					priority = 100
					buss = crowd_beds
					attack_time = 3
					attack_function = log_fast
					num_loops = -1}
			endif
		elseif ($current_crowd >= 1.2)
			if NOT issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					playsound \{$current_crowd_anticipation
						vol = -3
						pan1x = 0
						pan1y = 0.59
						panremovecenter = true
						priority = 100
						buss = crowd_beds
						attack_time = 3
						attack_function = log_fast
						num_loops = -1}
				endif
			else
				setsoundparams \{$current_crowd_anticipation
					vol = -3
					time = 0.5}
			endif
		else
			if issoundplaying \{$current_crowd_anticipation}
				if ($crowd_anticipation_flag = 0)
					stopsound \{$current_crowd_anticipation
						fade_time = 3
						fade_type = log_slow}
					spawnscriptnow \{crowd_anticipation_flag_logic}
				endif
			endif
		endif
	endif
endscript

script crowd_anticipation_flag_logic 
	change \{crowd_anticipation_flag = 1}
	wait \{3
		seconds}
	change \{crowd_anticipation_flag = 0}
endscript

script oneshotsbetweensongs 
	begin
	soundevent \{event = $current_crowd_whistle_soundevent}
	wait (RandomFloat (0.1, 1.2)) seconds
	repeat
endscript

script surgebetweensongs 
	begin
	soundevent \{event = $current_crowd_oneshot_positive_soundevent}
	wait (RandomFloat (0.3, 1.2)) seconds
	repeat
endscript

script killsurgingscripts 
	wait \{2
		seconds}
	killspawnedscript \{name = oneshotsbetweensongs}
	killspawnedscript \{name = surgebetweensongs}
endscript

script surge_after_explosion 
	wait \{2
		seconds}
	soundevent \{event = $current_crowd_swell_med_soundevent}
endscript

script cheer_before_explosion 
	wait \{1
		second}
	soundevent \{event = $current_crowd_swell_short_soundevent}
endscript

script colorwheel_increment_up_down 
	printstruct <...>
	if gotparam \{current_ring}
		switch <current_ring>
			case 1
			soundevent \{event = colorwheel_highlight_1}
			case 2
			soundevent \{event = colorwheel_highlight_2}
			case 3
			soundevent \{event = colorwheel_highlight_3}
			case 4
			soundevent \{event = colorwheel_highlight_4}
			case 5
			soundevent \{event = colorwheel_highlight_5}
		endswitch
	endif
endscript

script loading_screen_crowd_swell 
endscript

script killsurgingscripts_faster 
	killspawnedscript \{name = oneshotsbetweensongs}
	killspawnedscript \{name = surgebetweensongs}
endscript

script crowd_loading_whistle 
endscript

script metalfest_intro 
	wait \{1
		second}
	soundevent \{event = $current_crowd_swell_med_soundevent}
	wait \{1
		second}
	soundevent \{event = $current_crowd_swell_short_soundevent}
	wait \{1
		second}
	soundevent \{event = $current_crowd_swell_long_soundevent}
	wait \{1
		second}
	killsurgingscripts
endscript

script ghtunes_ui_scroll_pan 
	sfx_pan = (<sfx_pan> * 0.1)
	playsound ghtunes_menu_scroll vol = -2 pitch = 4 pan1x = <sfx_pan> pan1y = 1.0
endscript

script nullsound 
endscript

script ghmix_scroll 
	if gotparam \{adv_record}
		soundevent \{event = ghtunes_ui_scroll}
	else
		if gotparam \{up}
			generic_menu_up_or_down_sound \{up}
		else
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script ghtunes_scroll 
	soundevent \{event = ghtunes_ui_scroll}
endscript

script play_win_lose_anim_sound \{skip = 0}
	obj_getid
	i = 1
	if NOT ($dont_play_win_amim_sfx = 1)
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
		gman_songtool_getcurrentsong
		part = <part>
		printf channel = sfx qs(0xafa59a93) s = <part>
		getpakmancurrent \{map = zones}
		if gotparam \{event}
			switch <event>
				case mic_feedback
				soundevent \{event = mic_feedback}
				case mic_grab
				soundevent \{event = mic_grab}
				case mic_hit
				soundevent \{event = mic_hit}
				case drummer_sticks_throw
				soundevent \{event = drummer_sticks_throw}
				case large_smash
				if gotparam \{part}
					switch <part>
						case bass
						soundevent \{event = large_bass_smash}
						case guitar
						soundevent \{event = large_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case medium_smash
				if gotparam \{part}
					switch <part>
						case bass
						soundevent \{event = medium_bass_smash}
						case guitar
						soundevent \{event = medium_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case small_smash
				if gotparam \{part}
					switch <part>
						case bass
						soundevent \{event = small_bass_smash}
						case guitar
						soundevent \{event = small_guitar_smash}
						default
						printf \{channel = sfx
							qs(0x02f51c1f)}
					endswitch
				endif
				case drummer_tom_hit
				soundevent \{event = drummer_tom_hit}
				case drummer_snare_hit
				soundevent \{event = drummer_snare_hit}
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

script counter_play_beep \{time = 10}
	spawnscriptnow counter_play_beep_spawn params = {time = <time>}
	wait <time> seconds
	killspawnedscript \{name = counter_play_beep_spawn}
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
	if issoundeventplaying \{dolby_off}
		stopsoundevent \{dolby_off
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
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf channel = sfx qs(0xc4a9a039) s = <player>
	change \{stop_vocal_sidechain = 0}
	global_rms_value = 0
	begin
	if ($stop_vocal_sidechain = 1)
		break
	endif
	if NOT scriptisrunning \{fretbar_update_tempo}
		break
	endif
	vocals_getcuramplitude player = <player>
	if gotparam \{current_amplitude}
		change global_rms_value = (($global_rms_value + <current_amplitude>) / 2)
		if ($global_rms_value < 0.5)
			setsoundbussparams {vocals_balance = {vol = ($default_bussset.vocals_balance.vol)} time = 0.1}
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
	wait \{3
		gameframe}
	repeat
endscript

script vocal_sidechain_logic 
	printf channel = sfx qs(0xc4a9a039) s = <player>
	printf channel = sfx qs(0x7013df09) s = <muting>
	if (<muting> = false)
		change \{stop_vocal_sidechain = 0}
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
				if scriptisrunning \{vocal_sidechain}
					killspawnedscript \{name = vocal_sidechain}
				endif
			else
				printf \{channel = sfx
					qs(0x5dfd0eb3)}
				spawnscriptnow vocal_sidechain params = {player = <player>}
			endif
		else
			printf \{channel = sfx
				qs(0x0b018b40)}
			spawnscriptnow vocal_sidechain params = {player = <player>}
		endif
	else
		change \{stop_vocal_sidechain = 1}
	endif
endscript

script venuetypedecision \{time = 1}
	printf channel = sfx qs(0x7a6fe640) s = <time>
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	if scriptexists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'nothing'
	endif
	printf channel = sfx qs(0x23e3eeff) s = <venuesize>
	switch <venuesize>
		case 'Large_EXT'
		setsoundbusseffects effects = [{name = venueverb $large_ext_reverb}] time = <time>
		case 'Large_INT'
		setsoundbusseffects effects = [{name = venueverb $large_int_reverb}] time = <time>
		case 'Medium_INT'
		setsoundbusseffects effects = [{name = venueverb $medium_int_reverb}] time = <time>
		case 'Medium_EXT'
		setsoundbusseffects effects = [{name = venueverb $medium_ext_reverb}] time = <time>
		case 'Small_INT'
		setsoundbusseffects effects = [{name = venueverb $small_int_reverb}] time = <time>
		case 'Small_EXT'
		setsoundbusseffects effects = [{name = venueverb $small_ext_reverb}] time = <time>
		default
		printf \{channel = sfx
			qs(0xf9889ab0)}
		setsoundbusseffects effects = [{name = venueverb $medium_int_reverb}] time = <time>
	endswitch
endscript

script outro_stars 
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
	spawnscriptnow spawning_outro_stars params = {<...>}
endscript

script spawning_outro_stars 
	wait <wait_time> seconds
	printf channel = sfx qs(0x9231b06a) s = <vol>
	startpreloadedstream <unique_id> buss = front_end forcesafepreload = 1 vol = <vol>
endscript

script kill_outro_stars 
	killspawnedscript \{name = spawning_outro_stars}
	stopsound \{outro_one_star}
	stopsound \{outro_two_stars}
	stopsound \{outro_three_stars}
	stopsound \{outro_four_stars}
	stopsound \{outro_five_stars}
	stopsound \{outro_six_stars}
endscript

script kill_only_oneshots 
	one_shot_soundevent \{soundevent = donothing_oneshot}
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
	soundevent \{event = end_of_song_camera_movement_sound}
	soundevent \{event = endofsong_camera_cheer}
endscript

script crowd_swells_during_stats_screen 
	begin
	wait RandomFloat (30.0, 50.0) seconds
	printf \{channel = sfx
		qs(0xd1248a93)}
	soundevent \{event = surge_during_stats_screen}
	repeat
endscript

script killmenumusicslowly 
	killspawnedscript \{name = menu_music_on}
	killspawnedscript \{name = menu_music_on_spawned}
	change \{menu_music_on_flag = 0}
	stopsoundevent \{menu_music_se}
	killspawnedscript \{name = menu_music_se_spawned}
	change \{menu_music_preloading = 0}
	stopsound \{$menu_music_stream
		fade_time = 2.4
		fade_type = linear}
endscript

script getvolumetweakofpreloadedstream \{streamname = `default`}
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
	soundevent \{event = you_rock_front}
	soundevent \{event = you_rock_back}
	soundevent \{event = you_rock_lfe}
	wait \{2
		seconds}
	soundevent \{event = $current_crowd_swell_short_soundevent}
	soundevent \{event = $current_crowd_swell_med_soundevent}
	soundevent \{event = $current_crowd_applause_soundevent}
endscript

script fail_song_crowd_logic 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_neutral
		fadeintime = 10
		fadeintype = linear
		fadeouttime = 10
		fadeouttype = linear}
	spawnscriptnow \{neutral_crowd_wait_to_lower_stats}
	printf \{channel = sfx
		qs(0x85e2e392)}
	spawnscriptnow \{crowd_swells_during_stats_screen}
endscript

script game_start_crowd_cheer 
	if ($not_start_of_game = 0)
		wait \{8
			seconds}
		setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) -10) pitch = 0.0} time = 20}
		wait \{2.5
			second}
		soundevent \{event = beginning_crowd_swell}
		change \{not_start_of_game = 1}
	endif
endscript

script going_into_freeplay_from_main_menu 
	wait \{1
		seconds}
	soundevent \{event = surge_from_main_to_freeplay}
endscript

script intro_crowds 
	printf \{channel = sfx
		qs(0x6020d865)}
	gamemode_gettype
	if NOT (<type> = tutorial || <type> = freeplay || $calibrate_lag_enabled = 1)
		soundevent \{event = $current_crowd_applause_soundevent}
		soundevent \{event = $current_crowd_swell_short_soundevent}
	endif
endscript

script intro_crowds_fast 
	printf \{channel = sfx
		qs(0x89152bc9)}
	gamemode_gettype
	if NOT (<type> = tutorial || <type> = freeplay || $calibrate_lag_enabled = 1)
		soundevent \{event = $current_crowd_applause_soundevent}
		soundevent \{event = $current_crowd_swell_short_soundevent}
	endif
endscript

script practicedrums_fadein 
	setsoundbussparams {practicemode_drums = {vol = (($default_bussset.practicemode_drums.vol) - 100)}}
	wait \{3.5
		seconds}
	setsoundbussparams {practicemode_drums = {vol = (($default_bussset.practicemode_drums.vol))} time = 3.5}
endscript

script practicedrums_fadeout 
	setsoundbussparams {practicemode_drums = {vol = (($default_bussset.practicemode_drums.vol) - 100)} time = 2.0}
endscript

script neutral_crowd_wait_to_lower_stats 
	setsoundbussparams {crowd = {vol = (($default_bussset.crowd.vol) -20) pitch = 0.0} time = 7}
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
	stopsoundevent \{lg_ext_crowd_oneshot_positive}
	stopsoundevent \{lg_int_crowd_oneshot_positive}
	stopsoundevent \{md_ext_crowd_oneshot_positive}
	stopsoundevent \{md_ext_crowd_oneshot_positive_01}
	stopsoundevent \{md_int_crowd_oneshot_positive}
	stopsoundevent \{sm_ext_crowd_oneshot_positive}
	stopsoundevent \{sm_int_crowd_oneshot_positive}
	stopsoundevent \{lg_ext_crowd_oneshot_negative}
	stopsoundevent \{lg_int_crowd_oneshot_negative}
	stopsoundevent \{md_ext_crowd_oneshot_negative}
	stopsoundevent \{md_int_crowd_oneshot_negative}
	stopsoundevent \{sm_ext_crowd_oneshot_negative}
	stopsoundevent \{sm_int_crowd_oneshot_negative}
endscript
