
script stars 
	printf \{channel = sfx
		"*******************************************************"}
	printf \{channel = sfx
		"*******************************************************"}
	printf \{channel = sfx
		"*******************************************************"}
	printf \{channel = sfx
		"*******************************************************"}
	printf \{channel = sfx
		"*******************************************************"}
endscript
interiorpanningradius = 10
global_user_sfx_number = 10
guitar_always_volume_100 = 0
star_power_verb_is_on = 0
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
star_power_deployed_flag = 0
star_power_ready_flag = 0
star_power_awarded_flag = 0
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
guitarvolumefullstereolevel = 100
guitarvolumepartialstereolevel = 85
guitarvolumeramptimeup = 0.0
guitarvolumeramptimedown = 0.02
player1pan = {
	panlcr1 = -100
	panlcr2 = -100
}
player2pan = {
	panlcr1 = 100
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
	createbusssystem \{$busstree}
	setsoundbussparams \{$default_bussset}
	setsoundbussparams \{$default_bussset
		time = 0.5}
	soundbusslock \{master}
	soundbusslock \{user_guitar}
	soundbusslock \{user_band}
	soundbusslock \{user_sfx}
	soundbusslock \{user_music}
	soundbusslock \{crowd_beds}
	soundbusslock \{crowd_singalong}
	soundbusslock \{band_balance}
	soundbusslock \{guitar_balance}
	soundbusslock \{music_setlist}
	createsoundbusseffects \{guitar_balance = {
			effect = $echo_guitar_buss_dry
			effect2 = $reverb_guitar_buss_dry
		}}
	createsoundbusseffects \{crowd_w_reverb = {
			effect = $echo_crowd_buss
			effect2 = $reverb_crowd_buss
		}}
endscript

script gh3_change_crowd_reverb_settings_by_venue 
	getpakmancurrent \{map = zones}
	printf channel = sfx "*************************************changing reverb settings to %s zone" s = <pak>
	switch <pak>
		case z_party
		setsoundbusseffects \{effect = $reverb_crowd_buss_z_party}
		setsoundbusseffects \{effect = $echo_crowd_buss_z_party}
		case z_dive
		setsoundbusseffects \{effect = $reverb_crowd_buss_z_dive}
		setsoundbusseffects \{effect = $echo_crowd_buss_z_dive}
		case z_soundcheck
		setsoundbusseffects \{effect = $reverb_crowd_buss_z_dive}
		setsoundbusseffects \{effect = $echo_crowd_buss_z_dive}
		case z_prison
		setsoundbusseffects \{effect = $reverb_crowd_buss_z_prison}
		setsoundbusseffects \{effect = $echo_crowd_buss_z_prison}
		case z_artdeco
		setsoundbusseffects \{effect = $reverb_crowd_buss_z_artdeco}
		setsoundbusseffects \{effect = $echo_crowd_buss_z_artdeco}
		case z_video
		setsoundbusseffects \{effect = $reverb_crowd_buss_z_video}
		setsoundbusseffects \{effect = $echo_crowd_buss_z_video}
		case z_wikker
		setsoundbusseffects \{effect = $reverb_crowd_buss_z_wikker}
		setsoundbusseffects \{effect = $echo_crowd_buss_z_wikker}
		case z_budokan
		setsoundbusseffects \{effect = $reverb_crowd_buss_z_budokan}
		setsoundbusseffects \{effect = $echo_crowd_buss_z_budokan}
		case z_hell
		setsoundbusseffects \{effect = $reverb_crowd_buss_z_hell}
		setsoundbusseffects \{effect = $echo_crowd_buss_z_hell}
		default
		setsoundbusseffects \{effect = $reverb_crowd_buss}
		setsoundbusseffects \{effect = $echo_crowd_buss}
	endswitch
endscript

script printpushpopdebuginfo 
	if NOT gotparam \{push}
		if NOT gotparam \{pop}
			printf \{"Did not specify push or pop!"}
			return
		endif
	endif
	if gotparam \{push}
		pushpop = "push"
	else
		pushpop = "pop"
	endif
	if NOT gotparam \{name}
		printf \{"Did not specify script name!"}
		return
	endif
	printf "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= %a %b" a = <name> b = <pushpop>
endscript

script generic_reverb_functionality_script \{newechosettings = $echo_generic_outside_slap
		echofadetime = 0.5
		newreverbsettings = $reverb_generic_outside_verb
		reverbfadetime = 0.5}
	if inside
		if gotparam \{newechosettings}
			if gotparam \{echofadetime}
				setsoundbusseffects effect = <newechosettings> time = <echofadetime>
			else
				setsoundbusseffects effect = <newechosettings>
			endif
		endif
		if gotparam \{newreverbsettings}
			if gotparam \{reverbfadetime}
				setsoundbusseffects effect = <newreverbsettings> time = <reverbfadetime>
			else
				setsoundbusseffects effect = <newreverbsettings>
			endif
		endif
	else
		if gotparam \{destroyed}
		else
			if gotparam \{created}
			else
				if gotparam \{exitechosettings}
					if gotparam \{exitechofadetime}
						setsoundbusseffects effect = <exitechosettings> time = <exitechofadetime>
					else
						setsoundbusseffects effect = <exitechosettings>
					endif
				endif
				if gotparam \{exitreverbsettings}
					if gotparam \{exitreverbfadetime}
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
		printf \{channel = sfx
			"setting to doublenote flange"}
		setsoundbusseffects \{effect = $flange_doublenotes1}
		printf \{channel = sfx
			"changing p1 balance buss"}
		setsoundbussparams \{guitar_balance_first_player = {
				vol = 2
			}}
		case overload_highpass
		printf \{channel = sfx
			"setting to overload highpass"}
		setsoundbusseffects \{effect = $highpass_thin1}
		printf \{channel = sfx
			"changing p1 balance buss"}
		setsoundbussparams \{guitar_balance_first_player = {
				vol = 3
			}}
		case brokenstring_chorus
		printf \{channel = sfx
			"setting to broken string chorus"}
		setsoundbusseffects \{effect = $chorus_generic1}
		printf \{channel = sfx
			"changing p1 balance buss"}
		setsoundbussparams \{guitar_balance_first_player = {
				vol = 0
			}}
		case lefty_eq
		printf \{channel = sfx
			"setting to lefty eq"}
		setsoundbusseffects \{effect = $lowpass_muffled1}
		printf \{channel = sfx
			"changing p1 balance buss"}
		setsoundbussparams \{guitar_balance_first_player = {
				vol = 6
			}}
		case diffup_eq
		printf \{channel = sfx
			"setting to diffup eq"}
		setsoundbusseffects \{effect = $eq_wah1}
		printf \{channel = sfx
			"changing p1 balance buss"}
		setsoundbussparams \{guitar_balance_first_player = {
				vol = -6
			}}
		default
		printf \{channel = sfx
			"default"}
	endswitch
endscript

script gh_guitar_battle_dsp_effects_player2 
	switch <attack_effect>
		case double_note_flange
		printf \{channel = sfx
			"setting to doublenote flange"}
		setsoundbusseffects \{effect = $flange_doublenotes2}
		printf \{channel = sfx
			"changing p2 balance buss"}
		setsoundbussparams \{guitar_balance_second_player = {
				vol = 2
			}}
		case overload_highpass
		printf \{channel = sfx
			"setting to overload highpass"}
		setsoundbusseffects \{effect = $highpass_thin2}
		printf \{channel = sfx
			"changing p2 balance buss"}
		setsoundbussparams \{guitar_balance_second_player = {
				vol = 3
			}}
		case brokenstring_chorus
		printf \{channel = sfx
			"setting to broken string chorus"}
		setsoundbusseffects \{effect = $chorus_generic2}
		printf \{channel = sfx
			"changing p2 balance buss"}
		setsoundbussparams \{guitar_balance_second_player = {
				vol = 0
			}}
		case lefty_eq
		printf \{channel = sfx
			"setting to lefty eq"}
		setsoundbusseffects \{effect = $lowpass_muffled2}
		printf \{channel = sfx
			"changing p2 balance buss"}
		setsoundbussparams \{guitar_balance_second_player = {
				vol = 6
			}}
		case diffup_eq
		printf \{channel = sfx
			"setting to diffup eq"}
		setsoundbusseffects \{effect = $eq_wah2}
		printf \{channel = sfx
			"changing p2 balance buss"}
		setsoundbussparams \{guitar_balance_second_player = {
				vol = -6
			}}
		default
		printf \{channel = sfx
			"default"}
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

script gh_star_power_verb_on \{which_player = 1}
	if ($star_power_verb_is_on = 1)
		if NOT issingleplayergame
			spawnscriptnow star_power_deployed_sfx_multiplayer params = {the_player = <which_player>}
		endif
		return
	endif
	change \{star_power_verb_is_on = 1}
	if issingleplayergame
		soundevent \{event = star_power_deployed_sfx}
	else
		spawnscriptnow star_power_deployed_sfx_multiplayer params = {the_player = <which_player>}
	endif
	if ($game_mode != tutorial)
		if NOT issoundeventplaying \{star_power_deployed_cheer_sfx}
			soundevent \{event = star_power_deployed_cheer_sfx}
		endif
	endif
	pushsoundbussparams
	setsoundbussparams \{$star_power_bussset
		time = 0.5}
	get_song_tempo_cfunc
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
	setsoundbusseffects effect = {effect = echo name = guitarecho1 delay = <beat_duration>}
	setsoundbusseffects \{effect = {
			effect = echo
			name = guitarecho1
			drymix = 1.0
			wetmix = 0.5
		}
		time = 0.1}
	setsoundbusseffects \{effect = {
			effect = sfxreverb
			name = guitarreverb1
			reflectionslevel = -1200.0
			reverblevel = -550.0
		}
		time = 0.1}
endscript

script gh_star_power_verb_off 
	if ($star_power_verb_is_on = 1)
		popsoundbussparams
	endif
	setsoundbusseffects \{effect = {
			effect = echo
			name = guitarecho1
			wetmix = 0.0
		}
		time = 0.1}
	setsoundbusseffects \{effect = {
			effect = sfxreverb
			name = guitarreverb1
			reflectionslevel = -10000.0
			reverblevel = -10000.0
		}
		time = 0.5}
	change \{star_power_verb_is_on = 0}
endscript

script gh3_set_guitar_verb_and_echo_to_dry 
	setsoundbusseffects \{effect = $echo_guitar_buss_dry}
	setsoundbusseffects \{effect = $reverb_guitar_buss_dry}
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

script gh_battlemode_player1_sfx_death_drain 
	soundevent \{event = gh_sfx_battlemode_death_drain_p1}
endscript

script gh_battlemode_player2_sfx_death_drain 
	soundevent \{event = gh_sfx_battlemode_death_drain_p2}
endscript

script gh_battlemode_start_heartbeat_p1 
	soundevent \{event = battlemode_heartbeat_p1}
endscript

script gh_battlemode_stop_heartbeat_p1 
	stopsoundevent \{battlemode_heartbeat_p1}
endscript

script gh_battlemode_start_heartbeat_p2 
	soundevent \{event = battlemode_heartbeat_p2}
endscript

script gh_battlemode_stop_heartbeat_p2 
	stopsoundevent \{battlemode_heartbeat_p2}
endscript

script gh_battlemode_sfx_sudden_death 
	soundevent \{event = gh_sfx_battlemode_sudden_death}
endscript

script gh3_battle_play_crowd_reaction_sfx 
	if (<receiving_player> = 1)
		battle_attack_cheer_based_on_venue_p2
	else
		battle_attack_cheer_based_on_venue_p1
	endif
endscript

script battle_attack_cheer_based_on_venue_p1 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = battle_attack_small_crowd_cheer_p1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = battle_attack_medium_crowd_cheer_p1}
		case z_budokan
		case z_wikker
		soundevent \{event = battle_attack_large_crowd_cheer_p1}
		case z_hell
		soundevent \{event = battle_attack_hell_crowd_cheer_p1}
		default
		soundevent \{event = battle_attack_medium_crowd_cheer_p1}
	endswitch
endscript

script battle_attack_cheer_based_on_venue_p2 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = battle_attack_small_crowd_cheer_p2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = battle_attack_medium_crowd_cheer_p2}
		case z_budokan
		case z_wikker
		soundevent \{event = battle_attack_large_crowd_cheer_p2}
		case z_hell
		soundevent \{event = battle_attack_hell_crowd_cheer_p2}
		default
		soundevent \{event = battle_attack_medium_crowd_cheer_p2}
	endswitch
endscript

script gh3_battle_play_whammy_pitch_up_sound 
	num_strums = ($<other_player_status>.whammy_attack)
	player_pan = ($<other_player_status>.player)
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
		printf \{"moron"}
	endswitch
	<change_pitch> = (1.3 * <num_strums> / <total_strums>)
	<local_pitch> = (100.0 - (10.0 * <change_pitch>))
	playsound gh3_battlemode_whammyattack_received vol = 50 pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script gh3_crowd_manipulate_sfx 
endscript

script gh3_crowd_event_listener \{event_type = surge_fast}
	if NOT ($game_mode = training)
		if gotparam \{event_type}
			if ($current_crowd > $crowdlevelforsurges)
				switch <event_type>
					case sing
					printf \{" "}
					spawnscriptnow \{gh3_adjustcrowdsingingvolumeup}
					case surge_fast
					gh3_adjustcrowdfastsurge <...>
					case surge_slow
					gh3_adjustcrowdslowsurge <...>
					case applause
					gh3_play_a_crowd_applause_based_on_venue
					default
					printf \{"idiot"}
				endswitch
			else
				if gotparam \{override_state}
					switch <event_type>
						case sing
						printf \{" "}
						spawnscriptnow \{gh3_adjustcrowdsingingvolumeup}
						case surge_fast
						gh3_play_a_fast_crowd_swell_based_on_venue
						case surge_slow
						gh3_play_a_crowd_applause_based_on_venue
						gh3_play_a_crowd_oneshot_positive_based_on_venue
						case applause
						gh3_play_a_crowd_applause_based_on_venue
						default
						printf \{"idiot"}
					endswitch
				endif
			endif
		endif
	endif
endscript

script gh3_play_a_fast_crowd_swell_based_on_venue 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		soundevent \{event = small_crowd_swell}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_swell}
		case z_prison
		case z_artdeco
		case z_video
		soundevent \{event = medium_crowd_swell}
		case z_wikker
		case z_budokan
		soundevent \{event = crowd_fast_surge_cheer}
		case z_hell
		soundevent \{event = hell_crowd_swell}
		default
		soundevent \{event = medium_crowd_swell}
	endswitch
endscript

script gh3_play_a_crowd_applause_based_on_venue 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		soundevent \{event = small_crowd_applause_se}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_applause_se}
		case z_prison
		case z_artdeco
		case z_video
		soundevent \{event = medium_crowd_applause}
		case z_wikker
		case z_budokan
		soundevent \{event = large_crowd_applause_sfx}
		case z_hell
		soundevent \{event = medium_crowd_applause}
		default
		soundevent \{event = medium_crowd_applause}
	endswitch
endscript

script gh3_play_a_crowd_oneshot_positive_based_on_venue 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		soundevent \{event = crowd_oneshots_cheer_close}
		case z_prison
		case z_artdeco
		case z_video
		soundevent \{event = crowd_oneshots_cheer_close}
		case z_wikker
		case z_budokan
		soundevent \{event = crowd_oneshots_cheer_close}
		case z_hell
		soundevent \{event = crowd_oneshots_cheer_close}
		default
		soundevent \{event = crowd_oneshots_cheer_close}
	endswitch
endscript

script gh3_play_a_crowd_oneshot_negative_based_on_venue 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		soundevent \{event = crowd_oneshots_boo_close}
		case z_prison
		case z_artdeco
		case z_video
		soundevent \{event = crowd_oneshots_boo_close}
		case z_wikker
		case z_budokan
		soundevent \{event = crowd_oneshots_boo_close}
		case z_hell
		soundevent \{event = crowd_oneshots_boo_close}
		default
		soundevent \{event = crowd_oneshots_boo_close}
	endswitch
endscript

script gh3_sfx_encore_accept 
	do_actual_transition_sfx_medium_to_good
	gh3_play_a_crowd_oneshot_positive_based_on_venue
endscript

script gh3_sfx_encore_decline 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = encore_decline_small_crowd_med_to_bad_sfx}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = encore_decline_medium_crowd_med_to_bad_sfx}
		case z_budokan
		case z_wikker
		soundevent \{event = encore_decline_crowd_med_to_bad_sfx}
		case z_hell
		soundevent \{event = encore_decline_hell_crowd_med_to_bad_sfx}
		default
		soundevent \{event = encore_decline_medium_crowd_med_to_bad_sfx}
	endswitch
	gh3_play_a_crowd_oneshot_negative_based_on_venue
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

script change_crowd_looping_sfx \{crowd_looping_state = good
		player = 1}
	printf channel = sfx "changing crowd looping to %s" s = <crowd_looping_state>
	if ($boss_battle = 1)
		printf \{channel = sfx
			"we're in boss battle - see who requested this crowd loop change - p1 or p2"}
		if (<player> = 1)
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		else
			printf \{channel = sfx
				"do nothing, since it's the boss's health that was requesting a change"}
		endif
	else
		printf \{channel = sfx
			"we're not in boss battle"}
		if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			do_actual_changing_of_looping_sound \{crowd_looping_state = good}
		else
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		endif
	endif
endscript

script do_actual_changing_of_looping_sound 
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
		case z_nipmuc
		bg_crowd_nipmuc_bad
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
		case z_nipmuc
		bg_crowd_nipmuc_neutral
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
		case z_credits
		bg_crowd_large_good
		case z_hell
		bg_crowd_hell_good
		case z_nipmuc
		bg_crowd_nipmuc_good
		default
		bg_crowd_medium_good
	endswitch
endscript

script crowd_transition_sfx_poor_to_medium 
	printf \{channel = sfx
		"poor to med"}
	if gotparam \{player}
		crowd_generic_transition_sfx state = poor_to_med player = <player>
	endif
endscript

script crowd_transition_sfx_medium_to_good 
	printf \{channel = sfx
		"med to good"}
	if gotparam \{player}
		crowd_generic_transition_sfx state = med_to_good player = <player>
	endif
endscript

script crowd_transition_sfx_medium_to_poor 
	printf \{channel = sfx
		"med to poor"}
	if gotparam \{player}
		crowd_generic_transition_sfx state = med_to_poor player = <player>
	endif
endscript

script crowd_transition_sfx_good_to_medium 
	printf \{channel = sfx
		"good to med"}
	if gotparam \{player}
		crowd_generic_transition_sfx state = good_to_med player = <player>
	endif
endscript

script crowd_generic_transition_sfx \{state = med_to_good}
	if ($game_mode = p2_battle)
	else
		if ($boss_battle = 1)
			if (<player> = 1)
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
	if gotparam \{state}
		if (<state> = poor_to_med)
			do_actual_transition_sfx_poor_to_medium_p1
		endif
		if (<state> = med_to_poor)
			do_actual_transition_sfx_medium_to_poor_p1
		endif
		if (<state> = med_to_good)
			do_actual_transition_sfx_medium_to_good_p1
		endif
		if (<state> = good_to_med)
			do_actual_transition_sfx_good_to_medium_p1
		endif
	endif
endscript

script transition_sfx_right_side 
	if gotparam \{state}
		if (<state> = poor_to_med)
			do_actual_transition_sfx_poor_to_medium_p2
		endif
		if (<state> = med_to_poor)
			do_actual_transition_sfx_medium_to_poor_p2
		endif
		if (<state> = med_to_good)
			do_actual_transition_sfx_medium_to_good_p2
		endif
		if (<state> = good_to_med)
			do_actual_transition_sfx_good_to_medium_p2
		endif
	endif
endscript

script transition_sfx_both_sides 
	if gotparam \{state}
		if (<state> = poor_to_med)
			do_actual_transition_sfx_poor_to_medium
		endif
		if (<state> = med_to_poor)
			do_actual_transition_sfx_medium_to_poor
		endif
		if (<state> = med_to_good)
			do_actual_transition_sfx_medium_to_good
		endif
		if (<state> = good_to_med)
			do_actual_transition_sfx_good_to_medium
		endif
	endif
endscript

script do_actual_transition_sfx_poor_to_medium 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_bad_to_med_sfx}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_bad_to_med_sfx}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_bad_to_med_sfx}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_bad_to_med_sfx}
		case z_hell
		soundevent \{event = hell_crowd_bad_to_med_sfx}
		default
		soundevent \{event = medium_crowd_bad_to_med_sfx}
	endswitch
endscript

script do_actual_transition_sfx_poor_to_medium_p1 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_bad_to_med_sfx_p1}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_bad_to_med_sfx_p1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_bad_to_med_sfx_p1}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_bad_to_med_sfx_p1}
		case z_hell
		soundevent \{event = hell_crowd_bad_to_med_sfx_p1}
		default
		soundevent \{event = medium_crowd_bad_to_med_sfx_p1}
	endswitch
endscript

script do_actual_transition_sfx_poor_to_medium_p2 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_bad_to_med_sfx_p2}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_bad_to_med_sfx_p2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_bad_to_med_sfx_p2}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_bad_to_med_sfx_p2}
		case z_hell
		soundevent \{event = hell_crowd_bad_to_med_sfx_p2}
		default
		soundevent \{event = medium_crowd_bad_to_med_sfx_p2}
	endswitch
endscript

script do_actual_transition_sfx_medium_to_good 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_med_to_good_sfx}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_med_to_good_sfx}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_med_to_good_sfx}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_med_to_good_sfx}
		case z_hell
		soundevent \{event = hell_crowd_med_to_good_sfx}
		default
		soundevent \{event = medium_crowd_med_to_good_sfx}
	endswitch
endscript

script do_actual_transition_sfx_medium_to_good_p1 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_med_to_good_sfx_p1}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_med_to_good_sfx_p1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_med_to_good_sfx_p1}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_med_to_good_sfx_p1}
		case z_hell
		soundevent \{event = hell_crowd_med_to_good_sfx_p1}
		default
		soundevent \{event = medium_crowd_med_to_good_sfx_p1}
	endswitch
endscript

script do_actual_transition_sfx_medium_to_good_p2 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_med_to_good_sfx_p2}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_med_to_good_sfx_p2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_med_to_good_sfx_p2}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_med_to_good_sfx_p2}
		case z_hell
		soundevent \{event = hell_crowd_med_to_good_sfx_p2}
		default
		soundevent \{event = medium_crowd_med_to_good_sfx_p2}
	endswitch
endscript

script do_actual_transition_sfx_medium_to_poor 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_med_to_bad_sfx}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_med_to_bad_sfx}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_med_to_bad_sfx}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_med_to_bad_sfx}
		case z_hell
		soundevent \{event = hell_crowd_med_to_bad_sfx}
		default
		soundevent \{event = medium_crowd_med_to_bad_sfx}
	endswitch
endscript

script do_actual_transition_sfx_medium_to_poor_p1 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_med_to_bad_sfx_p1}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_med_to_bad_sfx_p1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_med_to_bad_sfx_p1}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_med_to_bad_sfx_p1}
		case z_hell
		soundevent \{event = hell_crowd_med_to_bad_sfx_p1}
		default
		soundevent \{event = medium_crowd_med_to_bad_sfx_p1}
	endswitch
endscript

script do_actual_transition_sfx_medium_to_poor_p2 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_med_to_bad_sfx_p2}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_med_to_bad_sfx_p2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_med_to_bad_sfx_p2}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_med_to_bad_sfx_p2}
		case z_hell
		soundevent \{event = hell_crowd_med_to_bad_sfx_p2}
		default
		soundevent \{event = medium_crowd_med_to_bad_sfx_p2}
	endswitch
endscript

script do_actual_transition_sfx_good_to_medium 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_good_to_med_sfx}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_good_to_med_sfx}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_good_to_med_sfx}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_good_to_med_sfx}
		case z_hell
		soundevent \{event = hell_crowd_good_to_med_sfx}
		default
		soundevent \{event = medium_crowd_good_to_med_sfx}
	endswitch
endscript

script do_actual_transition_sfx_good_to_medium_p1 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_good_to_med_sfx_p1}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_good_to_med_sfx_p1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_good_to_med_sfx_p1}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_good_to_med_sfx_p1}
		case z_hell
		soundevent \{event = hell_crowd_good_to_med_sfx_p1}
		default
		soundevent \{event = medium_crowd_good_to_med_sfx_p1}
	endswitch
endscript

script do_actual_transition_sfx_good_to_medium_p2 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		soundevent \{event = small_crowd_good_to_med_sfx_p2}
		case z_nipmuc
		soundevent \{event = nipmuc_crowd_good_to_med_sfx_p2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		soundevent \{event = medium_crowd_good_to_med_sfx_p2}
		case z_budokan
		case z_wikker
		soundevent \{event = crowd_good_to_med_sfx_p2}
		case z_hell
		soundevent \{event = hell_crowd_good_to_med_sfx_p2}
		default
		soundevent \{event = medium_crowd_good_to_med_sfx_p2}
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
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_nipmuc
		playsound \{z_nipmuc_intro
			vol = 150
			buss = crowd_presong_intro}
		case z_maxskc
		playsound \{z_maxskc_intro
			vol = 150
			buss = crowd_presong_intro}
		case z_fenway
		playsound \{z_fenway_intro
			vol = 150
			buss = crowd_presong_intro}
		case z_nine_lives
		playsound \{z_nine_lives_intro
			vol = 150
			buss = crowd_presong_intro}
		case z_jpplay
		playsound \{z_jpplay_intro
			vol = 150
			buss = crowd_presong_intro}
		case z_hof
		playsound \{z_hof_intro
			vol = 150
			buss = crowd_presong_intro}
		default
		playsound \{z_nipmuc_intro
			vol = 150
			buss = crowd_presong_intro}
	endswitch
endscript

script preencore_crowd_build_sfx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		printf \{channel = sfx
			"playing party build"}
		soundevent \{event = preencore_crowd_build_sfx_backyard}
		case z_dive
		soundevent \{event = preencore_crowd_build_sfx_dive}
		case z_artdeco
		soundevent \{event = preencore_crowd_build_sfx_deco}
		case z_video
		soundevent \{event = preencore_crowd_build_sfx_video}
		case z_prison
		soundevent \{event = preencore_crowd_build_sfx_prison}
		case z_budokan
		soundevent \{event = preencore_crowd_build_sfx_budokan}
		case z_wikker
		soundevent \{event = preencore_crowd_build_sfx_wikker}
		case z_hell
		soundevent \{event = preencore_crowd_build_sfx_hell}
		case z_soundcheck
		soundevent \{event = preencore_crowd_build_sfx_backyard}
		case z_nipmuc
		soundevent \{event = aerosmithencore_crowd_build_sfx_nipmuc}
		case z_maxskc
		soundevent \{event = aerosmithencore_crowd_build_sfx_maxskc}
		case z_fenway
		soundevent \{event = aerosmithencore_crowd_build_sfx_fenway}
		case z_nine_lives
		soundevent \{event = aerosmithencore_crowd_build_sfx_ninelives}
		case z_jpplay
		soundevent \{event = aerosmithencore_crowd_build_sfx_jpplay}
		case z_hof
		soundevent \{event = aerosmithencore_crowd_build_sfx_hof}
		default
		soundevent \{event = aerosmithencore_crowd_build_sfx_nipmuc}
	endswitch
endscript

script preaerosmith_crowd_build_sfx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		printf \{channel = sfx
			"playing party build"}
		soundevent \{event = preencore_crowd_build_sfx_backyard}
		case z_dive
		soundevent \{event = preencore_crowd_build_sfx_dive}
		case z_artdeco
		soundevent \{event = preencore_crowd_build_sfx_deco}
		case z_video
		soundevent \{event = preencore_crowd_build_sfx_video}
		case z_prison
		soundevent \{event = preencore_crowd_build_sfx_prison}
		case z_budokan
		soundevent \{event = preencore_crowd_build_sfx_budokan}
		case z_wikker
		soundevent \{event = preencore_crowd_build_sfx_wikker}
		case z_hell
		soundevent \{event = preencore_crowd_build_sfx_hell}
		case z_soundcheck
		soundevent \{event = preencore_crowd_build_sfx_backyard}
		case z_nipmuc
		soundevent \{event = aerosmithencore_crowd_build_sfx_nipmuc}
		case z_maxskc
		soundevent \{event = aerosmithencore_crowd_build_sfx_maxskc}
		case z_fenway
		soundevent \{event = aerosmithencore_crowd_build_sfx_fenway}
		case z_nine_lives
		soundevent \{event = aerosmithencore_crowd_build_sfx_ninelives}
		case z_jpplay
		soundevent \{event = aerosmithencore_crowd_build_sfx_jpplay}
		case z_hof
		soundevent \{event = aerosmithencore_crowd_build_sfx_hof}
		default
		soundevent \{event = aerosmithencore_crowd_build_sfx_nipmuc}
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
	stopsoundevent \{aerosmithencore_crowd_build_sfx_hof}
	stopsoundevent \{aerosmithencore_crowd_build_sfx_nipmuc}
	stopsoundevent \{aerosmithencore_crowd_build_sfx_ninelives}
	stopsoundevent \{aerosmithencore_crowd_build_sfx_jpplay}
	stopsoundevent \{aerosmithencore_crowd_build_sfx_fenway}
	stopsoundevent \{aerosmithencore_crowd_build_sfx_maxskc}
endscript

script gh_bossdevil_death_transition_sfx 
	soundevent \{event = devil_die_transition_sfx}
endscript

script battle_sfx_repair_broken_string 
	if gotparam \{num_strums}
		if gotparam \{player_pan}
			if gotparam \{difficulty}
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
					printf \{"moron"}
				endswitch
				<change_pitch> = (1.0 * <num_strums> / <total_strums>)
				<local_pitch> = (100.0 - (10.0 * <change_pitch>))
				playsound gh3_battlemode_stringtune_2 vol = 50 pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		endif
	endif
endscript

script gh_sfx_play_aerosmith_entrance_audio_from_zone_memory 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_video
		case z_nine_lives
		playsound \{z_nine_lives_aerosmith_intro
			vol = 100
			buss = encore_events}
		playsound \{medium_crowd_swell_03
			vol = 100
			buss = encore_events
			pan1x = -0.87
			pan1y = -0.5
			pan2x = 0.87
			pan2y = -0.5}
		playsound \{large_crowd_applause
			vol = 100
			buss = encore_events
			pan1x = -0.87
			pan1y = -0.5
			pan2x = 0.87
			pan2y = -0.5}
		case z_hof
		playsound \{z_hof_aerosmith_intro
			vol = 100
			buss = encore_events}
		playsound \{medium_crowd_swell_03
			vol = 100
			buss = encore_events
			pan1x = -0.87
			pan1y = -0.5
			pan2x = 0.87
			pan2y = -0.5}
		playsound \{large_crowd_applause
			vol = 100
			buss = encore_events
			pan1x = -0.87
			pan1y = -0.5
			pan2x = 0.87
			pan2y = -0.5}
		case z_nipmuc
		playsound \{z_nipmuc_aerosmith_intro
			vol = 80
			buss = encore_events}
		soundevent \{event = z_nipmuc_aerosmith_into_back_speakers}
		case z_prison
		case z_wikker
		case z_budokan
		case z_fenway
		playsound \{z_fenway_aerosmith_intro
			vol = 120
			buss = encore_events}
		soundevent \{event = z_fenway_aerosmith_into_back_speakers}
		case z_jpplay
		playsound \{z_jpplay_aerosmith_intro
			vol = 90
			buss = encore_events}
		soundevent \{event = z_jpplay_aerosmith_into_back_speakers}
		case z_maxskc
		playsound \{z_maxskc_aerosmith_intro
			vol = 110
			buss = encore_events}
		playsound \{small_crowd_swell
			vol = 70
			buss = encore_events
			pan1x = -0.87
			pan1y = -0.5
			pan2x = 0.87
			pan2y = -0.5}
		soundevent \{event = z_maxskc_aerosmith_into_back_speakers}
		default
		printf \{"do nothing - default case"}
	endswitch
endscript

script gh_sfx_play_dmcintro_audio_from_zone_memory 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_video
		case z_nine_lives
		playsound \{z_nine_lives_dmc_intro
			vol = 135
			buss = encore_events}
		playsound \{medium_crowd_swell_03
			vol = 80
			buss = encore_events
			pan1x = -0.87
			pan1y = -0.5
			pan2x = 0.87
			pan2y = -0.5}
		playsound \{large_crowd_applause
			vol = 80
			buss = encore_events
			pan1x = -0.87
			pan1y = -0.5
			pan2x = 0.87
			pan2y = -0.5}
		soundevent \{event = dmc_intro_rear_speakers}
		case z_hof
		case z_nipmuc
		case z_prison
		case z_wikker
		case z_budokan
		case z_fenway
		case z_jpplay
		case z_maxskc
		default
		printf \{"do nothing - default case"}
	endswitch
endscript

script gh_sfx_play_encore_audio_from_zone_memory 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		playsound \{z_party_encore_l
			vol = 130
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_party_encore_r
			vol = 130
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_party_encore_ls
			vol = 130
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_party_encore_rs
			vol = 130
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_dive
		playsound \{z_dive_encore_l
			vol = 130
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_dive_encore_r
			vol = 130
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_dive_encore_ls
			vol = 130
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_dive_encore_rs
			vol = 130
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_video
		playsound \{z_video_encore_l
			vol = 150
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_video_encore_r
			vol = 150
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_video_encore_ls
			vol = 150
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_video_encore_rs
			vol = 150
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_nine_lives
		playsound \{z_nine_lives_encore_l
			vol = 250
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_nine_lives_encore_r
			vol = 250
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_nine_lives_encore_c
			vol = 250
			buss = encore_events
			pan1x = 0.0
			pan1y = 1.0}
		playsound \{z_nine_lives_encore_ls
			vol = 250
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_nine_lives_encore_rs
			vol = 250
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_hof
		playsound \{z_hof_encore_l
			vol = 100
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_hof_encore_r
			vol = 100
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_hof_encore_c
			vol = 100
			buss = encore_events
			pan1x = 0.0
			pan1y = 1.0}
		playsound \{z_hof_encore_ls
			vol = 100
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_hof_encore_rs
			vol = 100
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_nipmuc
		playsound \{z_nipmuc_encore_l
			vol = 250
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_nipmuc_encore_r
			vol = 250
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_nipmuc_encore_c
			vol = 250
			buss = encore_events
			pan1x = 0.0
			pan1y = 1.0}
		playsound \{z_nipmuc_encore_ls
			vol = 250
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_nipmuc_encore_rs
			vol = 250
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_prison
		playsound \{z_prison_encore_l
			vol = 150
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_prison_encore_r
			vol = 150
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_prison_encore_ls
			vol = 150
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_prison_encore_rs
			vol = 150
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_wikker
		playsound \{z_wikker_encore_l
			vol = 140
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_wikker_encore_r
			vol = 140
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_wikker_encore_ls
			vol = 140
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_wikker_encore_rs
			vol = 140
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_budokan
		playsound \{z_budokan_encore_l
			vol = 130
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_budokan_encore_r
			vol = 130
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_budokan_encore_ls
			vol = 130
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_budokan_encore_rs
			vol = 130
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_fenway
		playsound \{z_fenway_encore_l
			vol = 70
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_fenway_encore_r
			vol = 70
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_fenway_encore_ls
			vol = 70
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_fenway_encore_rs
			vol = 70
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_jpplay
		playsound \{z_jpplay_encore_c
			vol = 70
			buss = encore_events
			pan1x = 0.0
			pan1y = 1}
		playsound \{z_jpplay_encore_l
			vol = 70
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_jpplay_encore_r
			vol = 70
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_jpplay_encore_ls
			vol = 70
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_jpplay_encore_rs
			vol = 70
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_maxskc
		playsound \{z_maxskc_encore_c
			vol = 250
			buss = encore_events
			pan1x = 0.0
			pan1y = 1}
		playsound \{z_maxskc_encore_l
			vol = 250
			buss = encore_events
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_maxskc_encore_r
			vol = 250
			buss = encore_events
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_maxskc_encore_ls
			vol = 250
			buss = encore_events
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_maxskc_encore_rs
			vol = 250
			buss = encore_events
			pan1x = 0.86602545
			pan1y = -0.5000001}
		default
		printf \{"do nothing - default case"}
	endswitch
endscript
tom_intro_front_speakers_unique_id = null
tom_intro_back_speakers_unique_id = null
joe_intro_front_speakers_unique_id = null
joe_intro_back_speakers_unique_id = null
slash_intro_front_speakers_unique_id = null
slash_intro_back_speakers_unique_id = null
lou_intro_front_speakers_unique_id = null
lou_intro_back_speakers_unique_id = null

script gh_sfx_preload_boss_intro_audio 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_hof
		if ($current_song = bossjoe)
			printf \{channel = sfx
				"Preload z_hof intro boss sounds"}
			change \{joe_intro_front_speakers_unique_id = null}
			change \{joe_intro_back_speakers_unique_id = null}
			if preloadstream \{joe_intro_front_speakers
					buss = master}
				change joe_intro_front_speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = joe_intro_front_speakers_unique_id}
			else
				printf \{channel = sfx
					"Failed preload Joe_Intro_Front_Speakers"}
			endif
			if preloadstream \{joe_intro_back_speakers
					buss = master}
				change joe_intro_back_speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = joe_intro_back_speakers_unique_id}
			else
				printf \{channel = sfx
					"Failed preload Joe_Intro_Back_Speakers"}
			endif
			startpreloadedstream \{startpaused = 1
				$joe_intro_front_speakers_unique_id
				vol = 75
				pan1x = -0.5
				pan1y = 0.86
				pan2x = 0.5
				pan2y = 0.86
				buss = encore_events}
			startpreloadedstream \{startpaused = 1
				$joe_intro_back_speakers_unique_id
				vol = 75
				pan1x = -0.86
				pan1y = -0.49
				pan2x = 0.86
				pan2y = -0.5
				buss = encore_events}
		endif
		case z_dive
		if ($current_song = bosstom)
			printf \{channel = sfx
				"Preload z_dive intro boss sounds"}
			change \{tom_intro_front_speakers_unique_id = null}
			change \{tom_intro_back_speakers_unique_id = null}
			if preloadstream \{tom_intro_front_speakers
					buss = master}
				change tom_intro_front_speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = tom_intro_front_speakers_unique_id}
			else
				printf \{channel = sfx
					"Failed preload Tom_Intro_Front_Speakers"}
			endif
			if preloadstream \{tom_intro_back_speakers
					buss = master}
				change tom_intro_back_speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = tom_intro_back_speakers_unique_id}
			else
				printf \{channel = sfx
					"Failed preload Tom_Intro_Back_Speakers"}
			endif
			startpreloadedstream \{startpaused = 1
				$tom_intro_front_speakers_unique_id
				vol = 80
				pan1x = -0.5
				pan1y = 0.86
				pan2x = 0.5
				pan2y = 0.86
				buss = encore_events}
			startpreloadedstream \{startpaused = 1
				$tom_intro_back_speakers_unique_id
				vol = 80
				pan1x = -0.86
				pan1y = -0.49
				pan2x = 0.86
				pan2y = -0.5
				buss = encore_events}
		endif
		case z_prison
		if ($current_song = bossslash)
			printf \{channel = sfx
				"Preload z_prison intro boss sounds"}
			change \{slash_intro_front_speakers_unique_id = null}
			change \{slash_intro_back_speakers_unique_id = null}
			if preloadstream \{slash_intro_front_speakers
					buss = master}
				change slash_intro_front_speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = slash_intro_front_speakers_unique_id}
			else
				printf \{channel = sfx
					"Failed preload Slash_Intro_Back_Speakers"}
			endif
			if preloadstream \{slash_intro_back_speakers
					buss = master}
				change slash_intro_back_speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = slash_intro_back_speakers_unique_id}
			else
				printf \{channel = sfx
					"Failed preload Slash_Intro_Back_Speakers"}
			endif
			startpreloadedstream \{startpaused = 1
				$slash_intro_front_speakers_unique_id
				vol = 80
				pan1x = -0.5
				pan1y = 0.86
				pan2x = 0.5
				pan2y = 0.86
				buss = encore_events}
			startpreloadedstream \{startpaused = 1
				$slash_intro_back_speakers_unique_id
				vol = 80
				pan1x = -0.86
				pan1y = -0.49
				pan2x = 0.86
				pan2y = -0.5
				buss = encore_events}
		endif
		case z_hell
		if ($current_song = bossdevil)
			printf \{channel = sfx
				"Preload z_hell intro boss sounds"}
			change \{lou_intro_front_speakers_unique_id = null}
			change \{lou_intro_back_speakers_unique_id = null}
			if preloadstream \{lou_intro_front_speakers
					buss = master}
				change lou_intro_front_speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = lou_intro_front_speakers_unique_id}
			else
				printf \{channel = sfx
					"Failed preload Lou_Intro_Front_Speakers"}
			endif
			if preloadstream \{lou_intro_back_speakers
					buss = master}
				change lou_intro_back_speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = lou_intro_back_speakers_unique_id}
			else
				printf \{channel = sfx
					"Failed preload Lou_Intro_Back_Speakers"}
			endif
			startpreloadedstream \{startpaused = 1
				$lou_intro_front_speakers_unique_id
				vol = 120
				pan1x = -0.5
				pan1y = 0.86
				pan2x = 0.5
				pan2y = 0.86
				buss = encore_events}
			startpreloadedstream \{startpaused = 1
				$lou_intro_back_speakers_unique_id
				vol = 120
				pan1x = -0.86
				pan1y = -0.49
				pan2x = 0.86
				pan2y = -0.5
				buss = encore_events}
		endif
		case z_nipmuc
		playsound \{z_nipmuc_intro
			vol = 150
			buss = crowd_presong_intro}
		case z_maxskc
		playsound \{z_maxskc_intro
			vol = 150
			buss = crowd_presong_intro}
		case z_fenway
		playsound \{z_fenway_intro
			vol = 150
			buss = crowd_presong_intro}
		case z_nine_lives
		playsound \{z_nine_lives_intro
			vol = 150
			buss = crowd_presong_intro}
		case z_jpplay
		playsound \{z_jpplay_intro
			vol = 150
			buss = crowd_presong_intro}
		default
		printf \{"do nothing - default case"}
	endswitch
endscript

script gh_sfx_play_boss_audio_from_zone_memory 
	getpakmancurrent \{map = zones}
	switch <pak>
		default
		printf \{"do nothing - default case"}
	endswitch
endscript

script gh3_sfx_fail_song_stop_sounds 
	stopsoundsbybuss \{crowd}
	stopsoundsbybuss \{ui_star_power}
	stopsoundsbybuss \{ui_battle_mode}
	stopsoundsbybuss \{wrong_notes_player1}
	stopsoundsbybuss \{wrong_notes_player2}
	stopsoundsbybuss \{practice_band_playback}
	stopsoundsbybuss \{binkcutscenes}
	stopsoundsbybuss \{encore_events}
	bg_crowd_front_end_silence \{immediate = 1}
endscript

script gh3_sfx_stop_sounds_for_killsong 
	stopsoundevent \{song_intro_kick_sfx}
	stopsoundevent \{notes_ripple_up_sfx}
	stopsoundevent \{song_intro_highway_up}
	stopsoundevent \{crowd_low_to_med_sfx}
	stopsoundevent \{crowd_good_to_med_sfx}
	stopsoundevent \{crowd_med_to_bad_sfx}
	stopsoundevent \{crowd_med_to_good_sfx}
	stopsoundevent \{crowd_oneshots_cheer_close}
	stopsoundevent \{crowd_fast_surge_cheer}
	stopsoundevent \{crowd_oneshots_boo_close}
	stopsoundevent \{medium_crowd_bad_to_med_sfx}
	stopsoundevent \{medium_crowd_med_to_bad_sfx}
	stopsoundevent \{medium_crowd_swell}
	stopsoundevent \{medium_crowd_applause}
	stopsoundevent \{large_crowd_applause_sfx}
	stopsoundevent \{small_crowd_bad_to_med}
	stopsoundevent \{small_crowd_med_to_bad_sfx}
	stopsoundevent \{small_crowd_med_to_good}
	stopsoundevent \{small_crowd_good_to_med_sfx}
	stopsoundevent \{small_crowd_oneshots_boo}
	stopsoundevent \{small_crowd_oneshots_cheer}
	stopsoundevent \{hell_crowd_good_to_med}
	stopsoundevent \{hell_crowd_good_to_med_sfx}
	stopsoundevent \{lose_multiplier_crowd}
	stopsoundevent \{star_power_awarded_sfx}
	stopsoundevent \{star_power_ready_sfx}
	stopsoundevent \{star_power_deployed_sfx}
	stopsoundevent \{star_power_deployed_cheer_sfx}
	stopsoundevent \{single_player_bad_note_guitar}
	stopsoundevent \{midori_win_1}
	stopsoundevent \{midori_lose_1}
	stopsoundevent \{lars_win_3}
	stopsoundevent \{lars_lose_1}
	stopsoundevent \{johnny_lose_1}
	stopsoundevent \{izzy_lose_2}
	stopsoundevent \{izzy_lose_1}
	stopsoundevent \{axel_win_4}
	stopsoundevent \{axel_win_1}
	stopsoundevent \{axel_lose_2}
	stopsoundevent \{axel_lose_1}
	stopsoundevent \{small_crowd_applause_se}
	stopsoundevent \{nipmuc_crowd_applause_se}
	stopsoundevent \{slash_outro}
	stopsoundevent \{gh_sfx_battlemode_lightning_player1}
	stopsoundevent \{gh_sfx_battlemode_lightning_player2}
	stopsoundevent \{gh_sfx_battlemode_deathof_p1}
	stopsoundevent \{gh_sfx_battlemode_deathof_p2}
	stopsoundevent \{gh_sfx_battlemode_diffup_p1}
	stopsoundevent \{gh_sfx_battlemode_diffup_p2}
	stopsoundevent \{gh_sfx_battlemode_doublenote_p1}
	stopsoundevent \{gh_sfx_battlemode_doublenote_p2}
	stopsoundevent \{gh_sfx_battlemode_lefty_p1}
	stopsoundevent \{gh_sfx_battlemode_lefty_p2}
	stopsoundevent \{gh_sfx_battlemode_steal_p1}
	stopsoundevent \{gh_sfx_battlemode_steal_p2}
	stopsoundevent \{gh_sfx_battlemode_stringbreak_p1}
	stopsoundevent \{gh_sfx_battlemode_stringbreak_p2}
	stopsoundevent \{gh_sfx_battlemode_whammyattack_p1}
	stopsoundevent \{gh_sfx_battlemode_whammyattack_p2}
	stopsoundevent \{gh_sfx_bossbattle_playerdies}
	stopsoundevent \{gh_sfx_battlemode_attack_over_p1}
	stopsoundevent \{gh_sfx_battlemode_attack_over_p2}
	stopsoundevent \{battle_power_awarded_sfx_p1}
	stopsoundevent \{battle_power_awarded_sfx_p2}
	stopsoundevent \{gh_sfx_battlemode_whammyattack_received_p1}
	stopsoundevent \{gh_sfx_battlemode_whammyattack_received_p2}
	stopsoundevent \{gh3_battle_play_whammy_pitch_up_sound}
	stopsoundevent \{battle_sfx_repair_broken_string}
	stopsoundevent \{gh_sfx_battlemode_death_drain_p1}
	stopsoundevent \{gh_sfx_battlemode_death_drain_p2}
	stopsoundevent \{battle_attack_small_crowd_cheer_p1}
	stopsoundevent \{battle_attack_small_crowd_cheer_p2}
	stopsoundevent \{battle_attack_medium_crowd_cheer_p1}
	stopsoundevent \{battle_attack_medium_crowd_cheer_p2}
	stopsoundevent \{battle_attack_large_crowd_cheer_p1}
	stopsoundevent \{battle_attack_large_crowd_cheer_p2}
	stopsoundevent \{battle_attack_hell_crowd_cheer_p1}
	stopsoundevent \{battle_attack_hell_crowd_cheer_p2}
	stopsoundevent \{battlemode_heartbeat_p1}
	stopsoundevent \{battlemode_heartbeat_p2}
	stopsoundsbybuss \{practice_band_playback}
	stopsoundsbybuss \{encore_events}
	stopsoundsbybuss \{crowd_beds}
	stopsoundevent \{ui_sfx_lose_multiplier_2x}
	stopsoundevent \{ui_sfx_lose_multiplier_3x}
	stopsoundevent \{ui_sfx_lose_multiplier_4x}
	stopsoundevent \{lose_multiplier_crowd}
	stopsound \{tom_intro_front_speakers}
	stopsound \{tom_intro_back_speakers}
	stopsound \{joe_intro_front_speakers}
	stopsound \{joe_intro_back_speakers}
	stopsound \{slash_intro_front_speakers}
	stopsound \{slash_intro_back_speakers}
	stopsound \{lou_intro_front_speakers}
	stopsound \{lou_intro_back_speakers}
	if NOT (($current_transition = preencore) || ($current_playing_transition = songlost))
		printf \{channel = sfx
			"changing bg to silence"}
		bg_crowd_front_end_silence \{immediate = 1}
	endif
endscript

script gh_sfx_countoff_logic 
	get_song_struct song = ($current_song)
	if structurecontains structure = <song_struct> name = countoff
		countoff_sound = (<song_struct>.countoff)
	else
		countoff_sound = 'sticks_normal'
	endif
	if (<velocity> > 99)
		formattext checksumname = sound_event_name 'Countoff_SFX_%s_Hard' s = <countoff_sound>
	else
		if (<velocity> > 74)
			formattext checksumname = sound_event_name 'Countoff_SFX_%s_Med' s = <countoff_sound>
		else
			if (<velocity> > 49)
				formattext checksumname = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
			else
				formattext checksumname = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
			endif
		endif
	endif
	soundevent event = <sound_event_name>
endscript

script gh_sfx_training_tuning_strings 
	switch <note_played>
		case 0
		switch <training_notes_strummed>
			case 1
			playsound \{e_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{e_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{e_string
				vol = 90
				pitch = 90}
		endswitch
		case 1
		switch <training_notes_strummed>
			case 1
			playsound \{a_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{a_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{a_string
				vol = 90
				pitch = 90}
		endswitch
		case 2
		switch <training_notes_strummed>
			case 1
			playsound \{d_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{d_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{d_string
				vol = 90
				pitch = 90}
		endswitch
		case 3
		switch <training_notes_strummed>
			case 1
			playsound \{g_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{g_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{g_string
				vol = 90
				pitch = 90}
		endswitch
		case 4
		switch <training_notes_strummed>
			case 1
			playsound \{b_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{b_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{b_string
				vol = 90
				pitch = 90}
		endswitch
	endswitch
endscript

script gh_sfx_note_streak_singleplayer 
	if (<combo> = 50)
		soundevent \{event = ui_sfx_50_note_streak_singleplayer}
	else
		soundevent \{event = ui_sfx_100_note_streak_singleplayer}
	endif
endscript

script gh_sfx_note_streak_p1 
	if (<combo> = 50)
		soundevent \{event = ui_sfx_50_note_streak_p1}
	else
		soundevent \{event = ui_sfx_100_note_streak_p1}
	endif
endscript

script gh_sfx_note_streak_p2 
	if (<combo> = 50)
		soundevent \{event = ui_sfx_50_note_streak_p2}
	else
		soundevent \{event = ui_sfx_100_note_streak_p2}
	endif
endscript

script gh_sfx_training_hammer_on_lesson_2 
	switch <note_played>
		case 0
		switch <training_notes_strummed>
			case 1
			playsound \{e_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{e_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{e_string
				vol = 90
				pitch = 90}
		endswitch
		case 1
		switch <training_notes_strummed>
			case 1
			playsound \{a_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{a_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{a_string
				vol = 90
				pitch = 90}
		endswitch
		case 2
		switch <training_notes_strummed>
			case 1
			playsound \{d_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{d_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{d_string
				vol = 90
				pitch = 90}
		endswitch
		case 3
		switch <training_notes_strummed>
			case 1
			playsound \{g_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{g_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{g_string
				vol = 90
				pitch = 90}
		endswitch
		case 4
		switch <training_notes_strummed>
			case 1
			playsound \{b_tuning
				vol = 90
				pitch = 80}
			case 2
			playsound \{b_tuning
				vol = 90
				pitch = 90}
			case 3
			playsound \{b_string
				vol = 90
				pitch = 90}
		endswitch
	endswitch
endscript

script stopnotes_01 
	if issoundeventplaying \{tutorial_string_1_strum_free}
		setsoundparams \{tutorial_string_1_strum_free
			vol = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_1_strum_free
			vol = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_1_strum_free
			vol = 10}
		stopsoundevent \{tutorial_string_1_strum_free}
	endif
endscript

script stopnotes_02 
	if issoundeventplaying \{tutorial_string_2_hopo_free}
		setsoundparams \{tutorial_string_2_hopo_free
			vol = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_2_hopo_free
			vol = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_2_hopo_free
			vol = 10}
		stopsoundevent \{tutorial_string_2_hopo_free}
	endif
endscript

script stopnotes_03 
	if issoundeventplaying \{tutorial_string_3_hopo_free}
		setsoundparams \{tutorial_string_3_hopo_free
			vol = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_3_hopo_free
			vol = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_3_hopo_free
			vol = 10}
		stopsoundevent \{tutorial_string_3_hopo_free}
	endif
endscript

script stopnotes_04 
	if issoundeventplaying \{tutorial_string_3_strum_free}
		setsoundparams \{tutorial_string_3_strum_free
			vol = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_3_strum_free
			vol = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_3_strum_free
			vol = 10}
		stopsoundevent \{tutorial_string_3_strum_free}
	endif
endscript

script stopnotes_05 
	if issoundeventplaying \{tutorial_string_2_hopo_free}
		setsoundparams \{tutorial_string_2_hopo_free
			vol = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_2_hopo_free
			vol = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_2_hopo_free
			vol = 10}
		stopsoundevent \{tutorial_string_2_hopo_free}
	endif
endscript

script stopnotes_06 
	if issoundeventplaying \{tutorial_string_1_hopo_free}
		setsoundparams \{tutorial_string_1_hopo_free
			vol = 100}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_1_hopo_free
			vol = 50}
		wait \{0.05
			seconds}
		setsoundparams \{tutorial_string_1_hopo_free
			vol = 10}
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

script star_power_deployed_sfx_multiplayer \{the_player = 1}
	if NOT issoundplaying \{sp_deployed}
		if (<the_player> = 1)
			soundevent \{event = star_power_deployed_sfx_p1}
		else
			soundevent \{event = star_power_deployed_sfx_p2}
		endif
		change \{star_power_deployed_flag = 1}
		wait \{0.5
			second}
		change \{star_power_deployed_flag = 0}
	else
		if ($star_power_deployed_flag = 1)
			setsoundparams \{sp_deployed
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<the_player> = 1)
				soundevent \{event = star_power_deployed_sfx_p1}
			else
				soundevent \{event = star_power_deployed_sfx_p2}
			endif
		endif
	endif
endscript

script star_power_ready_sfx_multiplayer \{which_player = 1}
	if NOT issoundplaying \{sp_available1}
		if (<which_player> = 1)
			soundevent \{event = star_power_ready_sfx_p1}
		else
			soundevent \{event = star_power_ready_sfx_p2}
		endif
		change \{star_power_ready_flag = 1}
		wait \{0.5
			second}
		change \{star_power_ready_flag = 0}
	else
		if ($star_power_ready_flag = 1)
			setsoundparams \{sp_available1
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<which_player> = 1)
				soundevent \{event = star_power_ready_sfx_p1}
			else
				soundevent \{event = star_power_ready_sfx_p2}
			endif
		endif
	endif
endscript

script star_power_awarded_sfx_multiplayer \{player = 1}
	if NOT issoundplaying \{sp_awarded1}
		if (<player> = 1)
			soundevent \{event = star_power_awarded_sfx_p1}
		else
			soundevent \{event = star_power_awarded_sfx_p2}
		endif
		change \{star_power_awarded_flag = 1}
		wait \{0.3
			second}
		change \{star_power_awarded_flag = 0}
	else
		if ($star_power_awarded_flag = 1)
			stars
			stars
			setsoundparams \{sp_awarded1
				pan1x = -0.5
				pan1y = 0.87
				pan2x = 0.5
				pan2y = 0.87}
		else
			if (<player> = 1)
				soundevent \{event = star_power_awarded_sfx_p1}
			else
				soundevent \{event = star_power_awarded_sfx_p2}
			endif
		endif
	endif
endscript

script z_fenway_aerosmith_into_back_speakers 
	x = 0
	playsound \{heavy_crowd_loop_good_01
		buss = encore_events
		vol = 0
		num_loops = -1
		pan1x = -0.86602545
		pan1y = -0.4999999
		pan2x = 0.86602545
		pan2y = -0.5000001}
	begin
	setsoundparams heavy_crowd_loop_good_01 vol = <x>
	<x> = (<x> + 2)
	if (<x> = 60)
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait \{11
		seconds}
	begin
	setsoundparams heavy_crowd_loop_good_01 vol = <x>
	<x> = (<x> - 2)
	if (<x> = -2)
		stopsound \{heavy_crowd_loop_good_01}
		break
	endif
	wait \{8
		gameframe}
	repeat
endscript

script z_nipmuc_aerosmith_into_back_speakers 
	x = 0
	playsound \{nipmuc_crowd_loop_good
		buss = encore_events
		vol = 0
		num_loops = -1
		pan1x = -0.86602545
		pan1y = -0.4999999
		pan2x = 0.86602545
		pan2y = -0.5000001}
	begin
	setsoundparams nipmuc_crowd_loop_good vol = <x>
	<x> = (<x> + 2)
	if (<x> = 60)
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait \{9
		seconds}
	begin
	setsoundparams nipmuc_crowd_loop_good vol = <x>
	<x> = (<x> - 2)
	if (<x> = -2)
		stopsound \{nipmuc_crowd_loop_good}
		break
	endif
	wait \{10
		gameframe}
	repeat
endscript

script z_jpplay_aerosmith_into_back_speakers 
	x = 0
	playsound \{heavy_crowd_loop_good_02
		buss = encore_events
		vol = 0
		num_loops = -1
		pan1x = -0.86602545
		pan1y = -0.4999999
		pan2x = 0.86602545
		pan2y = -0.5000001}
	begin
	setsoundparams heavy_crowd_loop_good_02 vol = <x>
	<x> = (<x> + 2)
	if (<x> = 60)
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait \{11
		seconds}
	begin
	setsoundparams heavy_crowd_loop_good_02 vol = <x>
	<x> = (<x> - 2)
	if (<x> = -2)
		stopsound \{heavy_crowd_loop_good_02}
		break
	endif
	wait \{8
		gameframe}
	repeat
endscript

script z_maxskc_aerosmith_into_back_speakers 
	x = 80
	playsound \{medium_crowd_loop_good_01
		buss = encore_events
		vol = 80
		num_loops = -1
		pan1x = -0.86602545
		pan1y = -0.4999999
		pan2x = 0.86602545
		pan2y = -0.5000001}
	wait \{8
		seconds}
	begin
	setsoundparams medium_crowd_loop_good_01 vol = <x>
	<x> = (<x> - 2)
	if (<x> = -2)
		stopsound \{medium_crowd_loop_good_01}
		break
	endif
	wait \{8
		gameframe}
	repeat
endscript

script dmc_intro_rear_speakers 
	wait \{9.57
		seconds}
	playsound \{medium_crowd_swell_03
		buss = encore_events
		vol = 100
		pan1x = -0.87
		pan1y = -0.5
		pan2x = 0.87
		pan2y = -0.5}
endscript

script you_rock_explosion 
	playsound \{you_rock_explosion
		vol = 100}
endscript
