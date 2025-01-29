
script stars 
	printf channel = sfx "*******************************************************"
	printf channel = sfx "*******************************************************"
	printf channel = sfx "*******************************************************"
	printf channel = sfx "*******************************************************"
	printf channel = sfx "*******************************************************"
endscript
0xabd4a575 = 0
0x73f8e03b = 100
0xf198502f = 100
0xf18ab1f9 = 0
0x450bae2d = 0
0xe3c22b01 = 30.0
0xe52d5df8 = 30.0
0x2968f804 = 0
0xb061a9be = 0
0xc7669928 = 0
0xd426dad9 = 0
0x5a66117d = 0
interiorpanningradius = 10
global_user_sfx_number = 10
guitar_always_volume_100 = 0
sfx_adjusted_guitar_volume = 100
highpass_cutoff_freq_modulated = 2000
lowpass_cutoff_freq_modulated = 1000
phaser_delay_time_modulated = 10
auto_wah_is_on = 0
wah_cutoff_freq_modulated = 900
current_audio_effect_type = highpass
guitar_audio_effects_are_on = 0
guitar_audio_effects_are_on_p1 = 0
guitar_audio_effects_are_on_p2 = 0
debug_audible_downbeat = 0
debug_audible_open = 0
debug_audible_close = 0
debug_audible_hitnote = 0
crowdlistenerstateclapon1234 = 0
crowdlevelforsurges = 1.66
temp_language_hack = lang_english
streamprioritylow = 10
streamprioritylowmid = 30
streamprioritymid = 50
streamprioritymidhigh = 70
streampriorityhigh = 90
streampriorityhighest = 95
streamprioritysystem = 109
global_soundevent_default_priority = 50
global_soundevent_default_buss = `default`
global_soundevent_norepeatfor = 0.1
global_soundevent_instancemanagement = stop_furthest
global_soundevent_instancelimit = 1
player1pan = {
	panlcr1 = -100
	panlcr2 = -75
}
player2pan = {
	panlcr1 = 75
	panlcr2 = 100
}

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
	createbusssystem $busstree
	setsoundbussparams $default_bussset
	setsoundbussparams $default_bussset time = 0.5
	soundbusslock user_guitar
	soundbusslock user_band
	soundbusslock user_sfx
	soundbusslock user_music
	soundbusslock crowd_beds
	soundbusslock crowd_singalong
	soundbusslock band_balance
	soundbusslock guitar_balance
	soundbusslock music_setlist
	createsoundbusseffects 0x71e20262 = {
		effect = $echo_guitar_buss_dry
		effect2 = $reverb_guitar_buss_dry
	}
	createsoundbusseffects crowd_w_reverb = {
		effect = $echo_crowd_buss
		effect2 = $reverb_crowd_buss
	}
endscript

script printpushpopdebuginfo 
	if NOT gotparam push
		if NOT gotparam pop
			printf "Did not specify push or pop!"
			return
		endif
	endif
	if gotparam push
		pushpop = "push"
	else
		pushpop = "pop"
	endif
	if NOT gotparam name
		printf "Did not specify script name!"
		return
	endif
	printf "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= %a %b" a = <name> b = <pushpop>
endscript

script generic_reverb_functionality_script newechosettings = $echo_generic_outside_slap echofadetime = 0.5 newreverbsettings = $reverb_generic_outside_verb reverbfadetime = 0.5
	if inside
		if gotparam newechosettings
			if gotparam echofadetime
				setsoundbusseffects effect = <newechosettings> time = <echofadetime>
			else
				setsoundbusseffects effect = <newechosettings>
			endif
		endif
		if gotparam newreverbsettings
			if gotparam reverbfadetime
				setsoundbusseffects effect = <newreverbsettings> time = <reverbfadetime>
			else
				setsoundbusseffects effect = <newreverbsettings>
			endif
		endif
	else
		if gotparam destroyed
		else
			if gotparam created
			else
				if gotparam exitechosettings
					if gotparam exitechofadetime
						setsoundbusseffects effect = <exitechosettings> time = <exitechofadetime>
					else
						setsoundbusseffects effect = <exitechosettings>
					endif
				endif
				if gotparam exitreverbsettings
					if gotparam exitreverbfadetime
						setsoundbusseffects effect = <exitreverbsettings> time = <exitreverbfadetime>
					else
						setsoundbusseffects effect = <exitreverbsettings>
					endif
				endif
			endif
		endif
	endif
endscript

script gh_guitar_battle_dsp_effects_player1 
	switch <attack_effect>
		case double_note_flange
		printf channel = sfx "setting to doublenote flange"
		setsoundbusseffects effect = $flange_doublenotes1
		printf channel = sfx "changing p1 balance buss"
		setsoundbussparams {guitar_balance_first_player = {vol = 2}}
		case overload_highpass
		printf channel = sfx "setting to overload highpass"
		setsoundbusseffects effect = $highpass_thin1
		printf channel = sfx "changing p1 balance buss"
		setsoundbussparams {guitar_balance_first_player = {vol = 3}}
		case brokenstring_chorus
		printf channel = sfx "setting to broken string chorus"
		setsoundbusseffects effect = $chorus_generic1
		printf channel = sfx "changing p1 balance buss"
		setsoundbussparams {guitar_balance_first_player = {vol = 0}}
		case lefty_eq
		printf channel = sfx "setting to lefty eq"
		setsoundbusseffects effect = $lowpass_muffled1
		printf channel = sfx "changing p1 balance buss"
		setsoundbussparams {guitar_balance_first_player = {vol = 6}}
		case diffup_eq
		printf channel = sfx "setting to diffup eq"
		setsoundbusseffects effect = $eq_wah1
		printf channel = sfx "changing p1 balance buss"
		setsoundbussparams {guitar_balance_first_player = {vol = -6}}
		default
		printf channel = sfx "default"
	endswitch
endscript

script gh_guitar_battle_dsp_effects_player2 
	switch <attack_effect>
		case double_note_flange
		printf channel = sfx "setting to doublenote flange"
		setsoundbusseffects effect = $flange_doublenotes2
		printf channel = sfx "changing p2 balance buss"
		setsoundbussparams {guitar_balance_second_player = {vol = 2}}
		case overload_highpass
		printf channel = sfx "setting to overload highpass"
		setsoundbusseffects effect = $highpass_thin2
		printf channel = sfx "changing p2 balance buss"
		setsoundbussparams {guitar_balance_second_player = {vol = 3}}
		case brokenstring_chorus
		printf channel = sfx "setting to broken string chorus"
		setsoundbusseffects effect = $chorus_generic2
		printf channel = sfx "changing p2 balance buss"
		setsoundbussparams {guitar_balance_second_player = {vol = 0}}
		case lefty_eq
		printf channel = sfx "setting to lefty eq"
		setsoundbusseffects effect = $lowpass_muffled2
		printf channel = sfx "changing p2 balance buss"
		setsoundbussparams {guitar_balance_second_player = {vol = 6}}
		case diffup_eq
		printf channel = sfx "setting to diffup eq"
		setsoundbusseffects effect = $eq_wah2
		printf channel = sfx "changing p2 balance buss"
		setsoundbussparams {guitar_balance_second_player = {vol = -6}}
		default
		printf channel = sfx "default"
	endswitch
endscript

script gh3_change_guitar_audio_effects_guitar_single_player \{effect_type = `default`}
endscript

script gh3_guitar_effects_wait 
endscript

script gh3_battle_attack_finished_sfx 
	if (<player> = 1)
		soundevent \{event = gh_sfx_battlemode_attack_over_p1}
	else
		soundevent \{event = gh_sfx_battlemode_attack_over_p2}
	endif
endscript

script reset_battle_dsp_effects 
	if (<player> = 1)
		reset_battle_dsp_effects_player1
	else
		reset_battle_dsp_effects_player2
	endif
endscript

script reset_battle_dsp_effects_player1 
	setsoundbusseffects \{effect = $lowpass_default1
		time = 0.15}
	setsoundbusseffects \{effect = $highpass_default1
		time = 0.15}
	setsoundbusseffects \{effect = $flange_default1
		time = 0.15}
	setsoundbusseffects \{effect = $chorus_default1
		time = 0.15}
	setsoundbusseffects \{effect = $eq_default1
		time = 0.15}
	printf \{channel = sfx
		"RESTTING p1 balance buss"}
	setsoundbussparams \{guitar_balance_first_player = {
			vol = 0
		}}
endscript

script reset_battle_dsp_effects_player2 
	setsoundbusseffects \{effect = $lowpass_default2
		time = 0.15}
	setsoundbusseffects \{effect = $highpass_default2
		time = 0.15}
	setsoundbusseffects \{effect = $flange_default2
		time = 0.15}
	setsoundbusseffects \{effect = $chorus_default2
		time = 0.15}
	setsoundbusseffects \{effect = $eq_default2
		time = 0.15}
	printf \{channel = sfx
		"RESTTING p2 balance buss"}
	setsoundbussparams \{guitar_balance_second_player = {
			vol = 0
		}}
endscript

script check_and_reset_effects 
endscript

script cleanup_spawned_scripts_for_effects 
endscript

script turn_off_current_audio_effect 
endscript

script profiling_fmod_effects 
endscript

script gh_star_power_verb_on 
	soundevent \{event = star_power_deployed_sfx}
	soundevent \{event = star_power_deployed_cheer_sfx}
	printpushpopdebuginfo \{push
		name = "Star Power Verb On "}
	pushsoundbussparams
	setsoundbussparams \{$star_power_bussset
		time = 0.5}
	setsoundbusseffects \{effect = $reverb_guitar_buss_wikka
		time = 0.1}
endscript

script gh_star_power_verb_off 
	printpushpopdebuginfo \{pop
		name = "Star Power Verb Off "}
	popsoundbussparams
	setsoundbusseffects \{effect = $reverb_guitar_buss_dry
		time = 0.5}
endscript

script gh_sfx_overloaded_static_player1 
endscript

script gh_sfx_wait_then_kill_overloaded_static_player1 
endscript

script gh_sfx_overloaded_static_player2 
endscript

script gh_sfx_wait_then_kill_overloaded_static_player2 
endscript

script gh_battlemode_modulate_hpf_cutoff 
endscript

script gh_battlemode_modulate_hpf_value 
endscript

script gh_battlemode_modulate_lpf_cutoff 
endscript

script gh_battlemode_modulate_lpf_value 
endscript

script gh_battlemode_modulate_phaser_delay 
endscript

script gh_modulate_phaser_delay_value 
endscript

script gh_battlemode_modulate_wah_value 
endscript

script gh_battlemode_player1_sfx_diffup_start 
	soundevent \{event = gh_sfx_battlemode_diffup_p1}
endscript

script gh_battlemode_player2_sfx_diffup_start 
	soundevent \{event = gh_sfx_battlemode_diffup_p2}
endscript

script gh_battlemode_player1_sfx_doublenotes_start 
	soundevent \{event = gh_sfx_battlemode_doublenote_p1}
endscript

script gh_battlemode_player2_sfx_doublenotes_start 
	soundevent \{event = gh_sfx_battlemode_doublenote_p2}
endscript

script gh_battlemode_player1_sfx_shake_start 
	soundevent \{event = gh_sfx_battlemode_lightning_player1}
endscript

script gh_battlemode_player2_sfx_shake_start 
	soundevent \{event = gh_sfx_battlemode_lightning_player2}
endscript

script gh_battlemode_player1_sfx_leftynotes_start 
	soundevent \{event = gh_sfx_battlemode_lefty_p1}
endscript

script gh_battlemode_player2_sfx_leftynotes_start 
	soundevent \{event = gh_sfx_battlemode_lefty_p2}
endscript

script gh_battlemode_player1_sfx_brokenstring_start 
	soundevent \{event = gh_sfx_battlemode_stringbreak_p1}
endscript

script gh_battlemode_player2_sfx_brokenstring_start 
	soundevent \{event = gh_sfx_battlemode_stringbreak_p2}
endscript

script gh_battlemode_player1_sfx_steal 
	soundevent \{event = gh_sfx_battlemode_steal_p1}
endscript

script gh_battlemode_player2_sfx_steal 
	soundevent \{event = gh_sfx_battlemode_steal_p2}
endscript

script gh_battlemode_player1_sfx_whammy_start 
	soundevent \{event = gh_sfx_battlemode_whammyattack_p1}
endscript

script gh_battlemode_player2_sfx_whammy_start 
	soundevent \{event = gh_sfx_battlemode_whammyattack_p2}
endscript

script gh3_crowd_manipulate_sfx 
endscript

script gh3_crowd_event_listener event_type = surge_fast
	if gotparam event_type
		if ($current_crowd > $crowdlevelforsurges)
			switch <event_type>
				case sing
				printf " "
				spawnscriptnow gh3_adjustcrowdsingingvolumeup
				case surge_fast
				printf " "
				gh3_adjustcrowdfastsurge <...>
				case surge_slow
				printf " "
				gh3_adjustcrowdslowsurge <...>
				default
				printf "idiot"
			endswitch
		else
			if gotparam override_state
				switch <event_type>
					case sing
					printf " "
					spawnscriptnow gh3_adjustcrowdsingingvolumeup
					case surge_fast
					getpakmancurrent map = zones
					switch <pak>
						case z_hell
						soundevent event = hell_crowd_swell
						case z_budokan
						case z_wikker
						printf " "
						soundevent event = crowd_fast_surge_cheer
						case z_artdeco
						case z_video
						case z_prison
						case z_soundcheck
						soundevent event = medium_crowd_swell
						case z_dive
						soundevent event = small_crowd_swell
						case z_party
						soundevent event = small_crowd_med_to_good
						default
						soundevent event = medium_crowd_swell
					endswitch
					case surge_slow
					printf " "
					default
					printf "idiot"
				endswitch
			endif
		endif
	endif
endscript

script gh3_adjustcrowdsingingvolumeup 
endscript

script gh3_adjustcrowdsingingvolumedown 
endscript

script gh3_adjustcrowdfastsurge 
	soundbussunlock \{crowd_beds}
	setsoundbussparams \{$crowdsurgebig_bussset
		time = 1.2}
	soundbusslock \{crowd_beds}
	wait \{1.5
		seconds}
	soundbussunlock \{crowd_beds}
	setsoundbussparams \{$crowdnormal_bussset
		time = 4}
	soundbusslock \{crowd_beds}
endscript

script gh3_adjustcrowdslowsurge 
	soundbussunlock \{crowd_beds}
	setsoundbussparams \{$crowdsurgesmall_bussset
		time = 4}
	soundbusslock \{crowd_beds}
	wait \{8
		seconds}
	soundbussunlock \{crowd_beds}
	setsoundbussparams \{$crowdnormal_bussset
		time = 4}
	soundbusslock \{crowd_beds}
endscript

script crowd_singalong_volume_up 
	soundbussunlock \{crowd_singalong}
	setsoundbussparams \{$crowdsingingvolup_bussset
		time = 4}
	soundbusslock \{crowd_singalong}
endscript

script crowd_singalong_volume_down 
	soundbussunlock \{crowd_singalong}
	setsoundbussparams \{$crowdsingingvoldown_bussset
		time = 1}
	soundbusslock \{crowd_singalong}
endscript

script menu_music_on 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if gotparam \{waitforguitarlick}
		wait \{3
			seconds}
	endif
	enableusermusic
	begin
	soundevent \{event = menu_music_se}
	wait \{3
		seconds}
	menu_music_checking
	wait \{1
		second}
	repeat
endscript

script menu_music_checking 
	begin
	if NOT issoundeventplaying \{menu_music_se}
		break
	endif
	wait \{1
		second}
	repeat
endscript

script menu_music_off 
	enableusermusic \{disable}
	killspawnedscript \{name = menu_music_on}
	stopsoundevent \{menu_music_se}
endscript

script playencorestreamsfx 
endscript

script song_intro_kick_sfx_waiting 
	printingtext = ($current_intro.hud_move_time)
	wait ($current_intro.hud_move_time / 1000.0) seconds
	soundevent \{event = song_intro_kick_sfx}
endscript

script song_intro_highway_up_sfx_waiting 
	printingtext = ($current_intro.highway_move_time)
	waittime = (($current_intro.highway_move_time / 1000.0) - 1.5)
	if (<waittime> < 0)
		waittime = 0
	endif
	wait <waittime> seconds
	soundevent \{event = song_intro_highway_up}
endscript

script change_crowd_looping_sfx \{crowd_looping_state = good}
	if gotparam \{crowd_looping_state}
		switch <crowd_looping_state>
			case bad
			change_crowd_looping_sfx_bad
			case neutral
			change_crowd_looping_sfx_neutral
			case good
			change_crowd_looping_sfx_good
			default
			change_crowd_looping_sfx_good
		endswitch
	endif
endscript

script change_crowd_looping_sfx_bad 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		bg_crowd_small_bad
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		bg_crowd_medium_bad
		case z_budokan
		case z_wikker
		bg_crowd_large_bad
		case z_hell
		bg_crowd_hell_bad
		default
		bg_crowd_medium_bad
	endswitch
endscript

script change_crowd_looping_sfx_neutral 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		bg_crowd_small_neutral
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		bg_crowd_medium_neutral
		case z_budokan
		case z_wikker
		bg_crowd_large_neutral
		case z_hell
		bg_crowd_hell_neutral
		default
		bg_crowd_medium_neutral
	endswitch
endscript

script change_crowd_looping_sfx_good 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		bg_crowd_small_good
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		bg_crowd_medium_good
		case z_budokan
		case z_wikker
		bg_crowd_large_good
		case z_hell
		bg_crowd_hell_good
		default
		bg_crowd_medium_good
	endswitch
endscript

script crowd_transition_sfx_poor_to_medium 
	getpakmancurrent map = zones
	switch <pak>
		case z_dive
		case z_party
		soundevent event = small_crowd_bad_to_med_sfx
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent event = medium_crowd_bad_to_med_sfx
		case z_budokan
		case z_wikker
		soundevent event = crowd_bad_to_med_sfx
		case z_hell
		soundevent event = hell_crowd_bad_to_med_sfx
		default
		soundevent event = medium_crowd_bad_to_med_sfx
	endswitch
endscript

script crowd_transition_sfx_medium_to_good 
	getpakmancurrent map = zones
	switch <pak>
		case z_dive
		case z_party
		soundevent event = small_crowd_med_to_good_sfx
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent event = medium_crowd_med_to_good_sfx
		case z_budokan
		case z_wikker
		soundevent event = crowd_med_to_good_sfx
		case z_hell
		soundevent event = hell_crowd_med_to_good_sfx
		default
		soundevent event = medium_crowd_med_to_good_sfx
	endswitch
endscript

script crowd_transition_sfx_medium_to_poor 
	getpakmancurrent map = zones
	switch <pak>
		case z_dive
		case z_party
		soundevent event = small_crowd_med_to_bad_sfx
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent event = small_crowd_med_to_bad_sfx
		case z_budokan
		case z_wikker
		soundevent event = crowd_med_to_bad_sfx
		case z_hell
		soundevent event = hell_crowd_med_to_bad_sfx
		default
		soundevent event = small_crowd_med_to_bad_sfx
	endswitch
endscript

script crowd_transition_sfx_good_to_medium 
	getpakmancurrent map = zones
	switch <pak>
		case z_dive
		case z_party
		soundevent event = small_crowd_good_to_med_sfx
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent event = medium_crowd_good_to_med_sfx
		case z_budokan
		case z_wikker
		soundevent event = crowd_good_to_med_sfx
		case z_hell
		soundevent event = hell_crowd_good_to_med_sfx
		default
		soundevent event = medium_crowd_good_to_med_sfx
	endswitch
endscript

script you_rock_waiting_crowd_sfx 
	wait \{2
		seconds}
	soundevent \{event = crowd_fast_surge_cheer}
	soundevent \{event = medium_crowd_applause}
endscript
save_check_time_early = 0.0
save_check_time_late = 0.0

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

script gh_sfx_intro_warmup 
	getpakmancurrent map = zones
	switch <pak>
		case z_party
		playsound z_party_intro vol = 100 buss = crowd_presong_intro
		case z_dive
		playsound z_dive_intro vol = 100 buss = crowd_presong_intro
		case z_artdeco
		playsound z_artdeco_intro vol = 100 buss = crowd_presong_intro
		case z_video
		playsound z_video_intro vol = 100 buss = crowd_presong_intro
		case z_prison
		playsound z_prison_intro vol = 100 buss = crowd_presong_intro
		case z_budokan
		playsound z_budokan_intro vol = 100 buss = crowd_presong_intro
		case z_wikker
		playsound z_wikker_intro vol = 100 buss = crowd_presong_intro
		case z_hell
		playsound z_hell_intro vol = 45 buss = crowd_presong_intro
		case z_soundcheck
		playsound z_party_intro vol = 100 buss = crowd_presong_intro
		default
		playsound z_party_intro vol = 100 buss = crowd_presong_intro
	endswitch
endscript

script preencore_crowd_build_sfx 
	getpakmancurrent map = zones
	switch <pak>
		case z_party
		printf channel = sfx "playing party build"
		soundevent event = preencore_crowd_build_sfx_backyard
		case z_dive
		soundevent event = preencore_crowd_build_sfx_dive
		case z_artdeco
		soundevent event = preencore_crowd_build_sfx_deco
		case z_video
		soundevent event = preencore_crowd_build_sfx_video
		case z_prison
		soundevent event = preencore_crowd_build_sfx_prison
		case z_budokan
		soundevent event = preencore_crowd_build_sfx_budokan
		case z_wikker
		soundevent event = preencore_crowd_build_sfx_wikker
		case z_hell
		soundevent event = preencore_crowd_build_sfx_hell
		case z_soundcheck
		soundevent event = preencore_crowd_build_sfx_backyard
		default
		soundevent event = preencore_crowd_build_sfx_backyard
	endswitch
endscript

script preencore_crowd_build_sfx_stop 
	stopsoundevent \{preencore_crowd_build_sfx_backyard}
	stopsoundevent \{preencore_crowd_build_sfx_dive}
	stopsoundevent \{preencore_crowd_build_sfx_deco}
	stopsoundevent \{preencore_crowd_build_sfx_video}
	stopsoundevent \{preencore_crowd_build_sfx_prison}
	stopsoundevent \{preencore_crowd_build_sfx_budokan}
	stopsoundevent \{preencore_crowd_build_sfx_wikker}
	stopsoundevent \{preencore_crowd_build_sfx_hell}
	stopsoundevent \{preencore_crowd_build_sfx_backyard}
	stopsoundevent \{preencore_crowd_build_sfx_backyard}
endscript

script gh_bossdevil_death_transition_sfx 
	soundevent \{event = devil_die_transition_sfx}
endscript

script battle_sfx_repair_broken_string 
	if gotparam num_strums
		if gotparam player_pan
			if gotparam difficulty
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
					printf "moron"
				endswitch
				<change_pitch> = (1.0 * <num_strums> / <total_strums>)
				<local_pitch> = (100.0 - (10.0 * <change_pitch>))
				playsound gh3_battlemode_stringtune_2 vol = 50 pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		endif
	endif
endscript

script gh_sfx_play_encore_audio_from_zone_memory 
	getpakmancurrent map = zones
	switch <pak>
		case z_party
		playsound z_party_encore_l vol = 90 buss = binkcutscenes pan1x = -0.5000002 pan1y = 0.8660253
		playsound z_party_encore_r vol = 90 buss = binkcutscenes pan1x = 0.5 pan1y = 0.86602545
		playsound 0x4a8520eb vol = 90 buss = binkcutscenes pan1x = 0.0 pan1y = 1
		playsound z_party_encore_ls vol = 90 buss = binkcutscenes pan1x = -0.86602545 pan1y = -0.4999999
		playsound z_party_encore_rs vol = 90 buss = binkcutscenes pan1x = 0.86602545 pan1y = -0.5000001
		case z_dive
		playsound z_dive_encore_l vol = 100 buss = binkcutscenes pan1x = -0.5000002 pan1y = 0.8660253
		playsound z_dive_encore_r vol = 100 buss = binkcutscenes pan1x = 0.5 pan1y = 0.86602545
		playsound 0x7fd10f11 vol = 100 buss = binkcutscenes pan1x = 0.0 pan1y = 1
		playsound z_dive_encore_ls vol = 100 buss = binkcutscenes pan1x = -0.86602545 pan1y = -0.4999999
		playsound z_dive_encore_rs vol = 100 buss = binkcutscenes pan1x = 0.86602545 pan1y = -0.5000001
		case z_video
		playsound z_video_encore_l vol = 90 buss = binkcutscenes pan1x = -0.5000002 pan1y = 0.8660253
		playsound z_video_encore_r vol = 90 buss = binkcutscenes pan1x = 0.5 pan1y = 0.86602545
		playsound 0x4ea91a88 vol = 90 buss = binkcutscenes pan1x = 0.0 pan1y = 1
		playsound z_video_encore_ls vol = 90 buss = binkcutscenes pan1x = -0.86602545 pan1y = -0.4999999
		playsound z_video_encore_rs vol = 90 buss = binkcutscenes pan1x = 0.86602545 pan1y = -0.5000001
		case z_artdeco
		playsound z_artdeco_encore_l vol = 100 buss = binkcutscenes pan1x = -0.5000002 pan1y = 0.8660253
		playsound z_artdeco_encore_r vol = 100 buss = binkcutscenes pan1x = 0.5 pan1y = 0.86602545
		playsound 0x8f147b45 vol = 100 buss = binkcutscenes pan1x = 0.0 pan1y = 1
		playsound z_artdeco_encore_ls vol = 100 buss = binkcutscenes pan1x = -0.86602545 pan1y = -0.4999999
		playsound z_artdeco_encore_rs vol = 100 buss = binkcutscenes pan1x = 0.86602545 pan1y = -0.5000001
		case z_prison
		playsound z_prison_encore_l vol = 90 buss = binkcutscenes pan1x = -0.5000002 pan1y = 0.8660253
		playsound z_prison_encore_r vol = 90 buss = binkcutscenes pan1x = 0.5 pan1y = 0.86602545
		playsound 0xe00f52f0 vol = 90 buss = binkcutscenes pan1x = 0.0 pan1y = 1
		playsound z_prison_encore_ls vol = 90 buss = binkcutscenes pan1x = -0.86602545 pan1y = -0.4999999
		playsound z_prison_encore_rs vol = 90 buss = binkcutscenes pan1x = 0.86602545 pan1y = -0.5000001
		case z_wikker
		playsound z_wikker_encore_l vol = 100 buss = binkcutscenes pan1x = -0.5000002 pan1y = 0.8660253
		playsound z_wikker_encore_r vol = 100 buss = binkcutscenes pan1x = 0.5 pan1y = 0.86602545
		playsound 0xe7f14dc0 vol = 100 buss = binkcutscenes pan1x = 0.0 pan1y = 1
		playsound z_wikker_encore_ls vol = 100 buss = binkcutscenes pan1x = -0.86602545 pan1y = -0.4999999
		playsound z_wikker_encore_rs vol = 100 buss = binkcutscenes pan1x = 0.86602545 pan1y = -0.5000001
		case z_budokan
		playsound z_budokan_encore_l vol = 90 buss = binkcutscenes pan1x = -0.5000002 pan1y = 0.8660253
		playsound z_budokan_encore_r vol = 90 buss = binkcutscenes pan1x = 0.5 pan1y = 0.86602545
		playsound 0xe2394283 vol = 90 buss = binkcutscenes pan1x = 0.0 pan1y = 1
		playsound z_budokan_encore_ls vol = 90 buss = binkcutscenes pan1x = -0.86602545 pan1y = -0.4999999
		playsound z_budokan_encore_rs vol = 90 buss = binkcutscenes pan1x = 0.86602545 pan1y = -0.5000001
		default
		printf "do nothing - default case"
	endswitch
endscript

script gh_sfx_play_boss_audio_from_zone_memory 
	getpakmancurrent map = zones
	switch <pak>
		case z_hell
		playsound 0xc092517f vol = 90 buss = binkcutscenes pan1x = -0.5000002 pan1y = 0.8660253
		playsound 0x3a9d6c1c vol = 90 buss = binkcutscenes pan1x = 0.5 pan1y = 0.86602545
		playsound 0x502d4cee vol = 90 buss = binkcutscenes pan1x = 0.0 pan1y = 1
		playsound 0x0976de7a vol = 90 buss = binkcutscenes pan1x = -0.86602545 pan1y = -0.4999999
		playsound 0xdd37e1a5 vol = 90 buss = binkcutscenes pan1x = 0.86602545 pan1y = -0.5000001
		default
		printf "do nothing - default case"
	endswitch
endscript
