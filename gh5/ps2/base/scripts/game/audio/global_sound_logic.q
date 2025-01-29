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
debug_audible_metronome = 0
lagtestpart1 = 0
lagtestpart2 = 0
lagtestpart3 = 0
lagtestpart4 = 0
viewvolumesonscreen = 0
CrowdListenerStateClapOn1234 = 0
CrowdLevelForSurges = 1.66
temp_language_hack = lang_english
crowd_anticipation_flag = 0
clap_fade = 0
0x389366b2 = 1.0
halftime_clapping = 0
crowd_transition_start_of_song_normal = 0
star_clap_left = 0
star_clap_right = 0
star_clap_left_middle = 0
star_clap_right_middle = 0
star_clap_middle = 0
star_clap_normal = 0
star_clap_leftcenterright = 0
StreamPriorityLow = 10
StreamPriorityLowMid = 30
StreamPriorityMid = 50
StreamPriorityMidHigh = 70
StreamPriorityHigh = 90
StreamPriorityHighest = 95
StreamPrioritySystem = 109
star_power_deployed_flag = 0
star_power_ready_flag = 0
star_power_awarded_flag = 0
menu_music_pan_right = 0
Global_SoundEvent_Default_Priority = 50
Global_SoundEvent_Default_Buss = Default
Global_SoundEvent_NoRepeatFor = 0.1
Global_SoundEvent_InstanceManagement = stop_oldest
Global_SoundEvent_InstanceLimit = 1
current_menu_song = Default
guitar_knob_effects_position = 1
bass_knob_effects_position = 1
drum_knob_effects_position = 1
song_guitar_track_buss = leadgtr_balance
song_rhythm_track_buss = bass_balance
song_leadvox_track_buss = lead_vox
song_band_track_buss = band_Balance
song_crowd_track_buss = Crowd_Singalong
song_drum_track_buss = drums_balance
instrument_missed_note_ramp_up_time = 0.0
instrument_missed_note_ramp_down_time = 0.0
starpower_sendeffect_slot = 1
current_crowd_anticipation = Default
current_crowd_whistle_soundevent = Default
current_crowd_oneshot_positive_soundevent = Default
current_crowd_oneshot_negative_soundevent = Default
current_crowd_looping_bg_area_bad = Default
current_crowd_looping_bg_area_neutral = Default
current_crowd_looping_bg_area_good = Default
current_crowd_looping_bg_area = Default
current_crowd_battle_cheer_l_p1 = Default
current_crowd_battle_cheer_r_p1 = Default
current_crowd_battle_cheer_l_p2 = Default
current_crowd_battle_cheer_r_p2 = Default
current_crowd_clap_normal_soundevent = Default
current_crowd_clap_middle_soundevent = Default
current_crowd_clap_right_soundevent = Default
current_crowd_clap_left_soundevent = Default
current_crowd_clap_right_middle_soundevent = Default
current_crowd_clap_left_middle_soundevent = Default
current_crowd_transition_bad_to_neutral = Default
current_crowd_transition_neutral_to_bad = Default
current_crowd_transition_neutral_to_good = Default
current_crowd_transition_good_to_neutral = Default
current_crowd_swell_short_soundevent = Default
current_crowd_swell_short_soft_soundevent = Default
current_crowd_swell_med_soundevent = Default
current_crowd_swell_long_soundevent = Default
current_crowd_applause_soundevent = Default
current_crowd_object_back_left = Default
current_crowd_object_back_right = Default
current_crowd_object_front_left = Default
current_crowd_object_front_right = Default
current_crowd_object_middle_left = Default
current_crowd_object_middle_right = Default
current_crowd_venue_intro_soundevent = Default
current_crowd_preencore_looping_soundevent = Default
current_crowd_encore = Default
current_venue_size = Default
turn_off_oneshot_cheers = 0
crowd_is_singing = 0
crowd_in_jam_mode_song_state = 0
crowd_in_front_end_state = 0
crowd_singalong_pan1x = -1
crowd_singalong_pan1y = 0
crowd_singalong_pan2x = 1
crowd_singalong_pan2y = 0
GuitarVolumeFullStereoLevel = 100
GuitarVolumePartialStereoLevel = 85
GuitarVolumeRamptimeUp = 0.0
GuitarVolumeRamptimeDown = 0.02
all_songs_master_volume = -2.0
cooppanning = {
	guitar = {
		mono_song_stream = FALSE
		vocal_vol = 0
		center_player_pan = [
			-100
			100
		]
		guitar_vol_on = 0.7
		guitar_vol_off = -100
	}
	bass = {
		mono_song_stream = FALSE
		vocal_vol = 0
		center_player_pan = [
			-100
			100
		]
		bass_vol_on = 4.5
		bass_vol_off = -100
	}
	drums = {
		mono_song_stream = FALSE
		vocal_vol = 0
		center_player_pan = [
			-100
			100
		]
		mono_drums_center_pan = [
			0
			0
		]
		drums_vol_on = 2
		drums_vol_off = -100
		mono_drums_vol_on = 2
		mono_drums_vol_off = -100
	}
	vocals = {
		mono_song_stream = FALSE
		vocal_vol = 1.5
	}
	bossbattle = {
		mono_song_stream = true
		vocal_vol = 0
		left_player_pan = [
			-100
			100
		]
		right_player_pan = [
			-100
			100
		]
		guitar_vol_on = 0.7
		guitar_vol_off = -100
		bass_vol_on = 0.7
		bass_vol_off = -100
	}
	guitarbass = {
		mono_song_stream = true
		vocal_vol = 0
		left_player_pan = [
			-100
			-100
		]
		right_player_pan = [
			100
			100
		]
		guitar_vol_on = 0.7
		guitar_vol_off = -100
		bass_vol_on = 3
		bass_vol_off = -100
	}
	guitardrums = {
		mono_song_stream = true
		vocal_vol = 0
		left_player_pan = [
			-100
			50
		]
		right_player_pan = [
			-50
			100
		]
		mono_drums_left_pan = [
			-25
			-25
		]
		mono_drums_right_pan = [
			25
			25
		]
		guitar_vol_on = 0.7
		guitar_vol_off = -100
		drums_vol_on = 1.5
		drums_vol_off = -100
		mono_drums_vol_on = 1.5
		mono_drums_vol_off = -100
	}
	guitarvocals = {
		mono_song_stream = FALSE
		vocal_vol = 1.5
		center_player_pan = [
			-100
			100
		]
		guitar_vol_on = 0.7
		guitar_vol_off = -100
	}
	bassdrums = {
		mono_song_stream = FALSE
		vocal_vol = 0
		left_player_pan = [
			-100
			50
		]
		right_player_pan = [
			-50
			100
		]
		mono_drums_left_pan = [
			-25
			-25
		]
		mono_drums_right_pan = [
			25
			25
		]
		bass_vol_on = 3
		bass_vol_off = -100
		drums_vol_on = 2
		drums_vol_off = -100
		mono_drums_vol_on = 2
		mono_drums_vol_off = -100
	}
	bassvocals = {
		mono_song_stream = FALSE
		vocal_vol = 2
		center_player_pan = [
			-100
			100
		]
		bass_vol_on = 3
		bass_vol_off = -100
	}
	drumsvocals = {
		mono_song_stream = FALSE
		vocal_vol = 2
		left_player_pan = [
			-100
			100
		]
		right_player_pan = [
			-100
			100
		]
		mono_drums_left_pan = [
			0
			0
		]
		mono_drums_right_pan = [
			0
			0
		]
		drums_vol_on = 2
		drums_vol_off = -100
		mono_drums_vol_on = 2
		mono_drums_vol_off = -100
	}
	guitarbassdrums = {
		mono_song_stream = true
		vocal_vol = 0
		left_player_pan = [
			-90
			-25
		]
		center_player_pan = [
			-100
			100
		]
		right_player_pan = [
			25
			90
		]
		mono_drums_center_pan = [
			0
			0
		]
		guitar_vol_on = 0.7
		guitar_vol_off = -100
		bass_vol_on = 2
		bass_vol_off = -100
		drums_vol_on = 1
		drums_vol_off = -100
		mono_drums_vol_on = 1
		mono_drums_vol_off = -100
	}
	guitarbassvocals = {
		mono_song_stream = true
		vocal_vol = 1.5
		left_player_pan = [
			-90
			-25
		]
		right_player_pan = [
			25
			90
		]
		guitar_vol_on = 0.7
		guitar_vol_off = -100
		bass_vol_on = 2
		bass_vol_off = -100
	}
	guitardrumsvocals = {
		mono_song_stream = true
		vocal_vol = 1.5
		left_player_pan = [
			-100
			0
		]
		right_player_pan = [
			0
			100
		]
		mono_drums_left_pan = [
			-50
			-50
		]
		mono_drums_right_pan = [
			50
			50
		]
		guitar_vol_on = 0.7
		guitar_vol_off = -100
		drums_vol_on = 1
		drums_vol_off = -100
		mono_drums_vol_on = 1
		mono_drums_vol_off = -100
	}
	bassdrumsvocals = {
		mono_song_stream = FALSE
		vocal_vol = 1.5
		left_player_pan = [
			-100
			0
		]
		right_player_pan = [
			0
			100
		]
		mono_drums_left_pan = [
			-50
			-50
		]
		mono_drums_right_pan = [
			50
			50
		]
		bass_vol_on = 2
		bass_vol_off = -100
		drums_vol_on = 1
		drums_vol_off = -100
		mono_drums_vol_on = 1
		mono_drums_vol_off = -100
	}
	guitarbassdrumsvocals = {
		mono_song_stream = true
		vocal_vol = 0
		left_player_pan = [
			-90
			-25
		]
		center_player_pan = [
			-100
			100
		]
		right_player_pan = [
			25
			90
		]
		mono_drums_center_pan = [
			0
			0
		]
		guitar_vol_on = 0
		guitar_vol_off = -100
		bass_vol_on = 0
		bass_vol_off = -100
		drums_vol_on = 0
		drums_vol_off = -100
		mono_drums_vol_on = 0
		mono_drums_vol_off = -100
	}
}
faceoffpanning = {
	guitar = {
		mono_song_stream = true
		vocal_vol = 0
		p1_on_p2_on = {
			p1_vol = -2.3
			p2_vol = -2.3
			p1_pan = [
				-70
				-40
			]
			p2_pan = [
				40
				70
			]
		}
		p1_off_p2_on = {
			p1_vol = -100
			p2_vol = -2.3
			p1_pan = [
				-100
				-100
			]
			p2_pan = [
				100
				100
			]
		}
		p1_on_p2_off = {
			p1_vol = -2.3
			p2_vol = -100
			p1_pan = [
				-100
				-100
			]
			p2_pan = [
				100
				100
			]
		}
		p1_off_p2_off = {
			p1_vol = -100
			p2_vol = -100
			p1_pan = [
				-70
				-40
			]
			p2_pan = [
				40
				70
			]
		}
	}
	bass = {
		mono_song_stream = FALSE
		vocal_vol = 0
		p1_on_p2_on = {
			p1_vol = 3
			p2_vol = 3
			p1_pan = [
				-1.0
				-1.0
			]
			p2_pan = [
				1.0
				1.0
			]
		}
		p1_off_p2_on = {
			p1_vol = -100
			p2_vol = 3
			p1_pan = [
				-1.0
				-1.0
			]
			p2_pan = [
				1.0
				1.0
			]
		}
		p1_on_p2_off = {
			p1_vol = 3
			p2_vol = -100
			p1_pan = [
				-1.0
				-1.0
			]
			p2_pan = [
				1.0
				1.0
			]
		}
		p1_off_p2_off = {
			p1_vol = -100
			p2_vol = -100
			p1_pan = [
				-1.0
				-1.0
			]
			p2_pan = [
				1.0
				1.0
			]
		}
	}
	drums = {
		mono_song_stream = FALSE
		vocal_vol = 0
		p1_on_p2_on = {
			kick_vol = 2
			snare_vol = 2
			tom_vol = 2
			cymbal_vol = 2
			kick_pan = [
				-100
				100
			]
			snare_pan = [
				-100
				100
			]
			tom_pan = [
				-100
				100
			]
			cymbal_pan = [
				-100
				100
			]
		}
		p1_off_p2_on = {
			kick_vol = 0
			snare_vol = 0
			tom_vol = 1
			cymbal_vol = 1
			kick_pan = [
				25
				100
			]
			snare_pan = [
				25
				100
			]
			tom_pan = [
				25
				100
			]
			cymbal_pan = [
				25
				100
			]
		}
		p1_on_p2_off = {
			kick_vol = 0
			snare_vol = 0
			tom_vol = 1
			cymbal_vol = 1
			kick_pan = [
				-100
				-25
			]
			snare_pan = [
				-100
				-25
			]
			tom_pan = [
				-100
				-25
			]
			cymbal_pan = [
				-100
				-25
			]
		}
		p1_off_p2_off = {
			kick_vol = -100
			snare_vol = -100
			tom_vol = -100
			cymbal_vol = -100
			kick_pan = [
				-75
				75
			]
			snare_pan = [
				-75
				75
			]
			tom_pan = [
				-75
				75
			]
			cymbal_pan = [
				-75
				75
			]
		}
	}
	monodrums = {
		mono_song_stream = FALSE
		vocal_vol = 0
		p1_on_p2_on = {
			kick_vol = 2
			snare_vol = 2
			tom_vol = 2
			cymbal_vol = 2
			kick_pan = [
				0
				0
			]
			snare_pan = [
				0
				0
			]
			tom_pan = [
				0
				0
			]
			cymbal_pan = [
				0
				0
			]
		}
		p1_off_p2_on = {
			kick_vol = 2
			snare_vol = 2
			tom_vol = 2
			cymbal_vol = 2
			kick_pan = [
				50
				50
			]
			snare_pan = [
				50
				50
			]
			tom_pan = [
				50
				50
			]
			cymbal_pan = [
				50
				50
			]
		}
		p1_on_p2_off = {
			kick_vol = 2
			snare_vol = 2
			tom_vol = 2
			cymbal_vol = 2
			kick_pan = [
				-50
				-50
			]
			snare_pan = [
				-50
				-50
			]
			tom_pan = [
				-50
				-50
			]
			cymbal_pan = [
				-50
				-50
			]
		}
		p1_off_p2_off = {
			kick_vol = -100
			snare_vol = -100
			tom_vol = -100
			cymbal_vol = -100
			kick_pan = [
				0
				0
			]
			snare_pan = [
				0
				0
			]
			tom_pan = [
				0
				0
			]
			cymbal_pan = [
				0
				0
			]
		}
	}
	vocals = {
		mono_song_stream = FALSE
		vocal_vol = 0
		p1_on_p2_on = {
			p1_vol = -6
			p2_vol = -6
			p1_pan = [
				-50
				-14
			]
			p2_pan = [
				14
				50
			]
		}
		p1_off_p2_on = {
			p1_vol = -100
			p2_vol = 0
			p1_pan = [
				-50
				-14
			]
			p2_pan = [
				14
				50
			]
		}
		p1_on_p2_off = {
			p1_vol = 0
			p2_vol = -100
			p1_pan = [
				-50
				-14
			]
			p2_pan = [
				14
				50
			]
		}
		p1_off_p2_off = {
			p1_vol = -100
			p2_vol = -100
			p1_pan = [
				-50
				-14
			]
			p2_pan = [
				14
				50
			]
		}
	}
}

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
	SoundBussLock \{user_leadvox}
	SoundBussLock \{user_drums}
	SoundBussLock \{user_leadgtr}
	SoundBussLock \{user_bass}
	SoundBussLock \{user_rhythmgtr}
	SoundBussLock \{user_crowd}
	SoundBussLock \{User_SFX}
	SoundBussLock \{User_Band}
	SoundBussLock \{user_crowdsingalong}
	SoundBussLock \{user_misc}
endscript

script GH3_Change_crowd_reverb_settings_by_Venue 
	GetPakManCurrent \{map = zones}

	switch <pak>
		case z_bayou
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_bayou
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_bayou
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_goth
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_goth
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_goth
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_hotel
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_hotel
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_hotel
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_cathedral
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_cathedral
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_cathedral
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_recordstore
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_recordstore
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_recordstore
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_frathouse
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_frathouse
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_frathouse
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_metalfest
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_metalfest
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_metalfest
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_fairgrounds
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_fairgrounds
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_fairgrounds
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_newyork
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_newyork
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_newyork
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_ballpark
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_ballpark
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_ballpark
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_castle
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_castle
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_castle
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_military
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_military
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_military
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case Z_Harbor
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_harbor
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_harbor
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_scifi
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_scifi
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_scifi
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_submarine
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_submarine
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_submarine
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_justice
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_justice
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_justice
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_mop
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_mop
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_mop
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_donnington
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_justice
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_justice
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_forum
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_forum
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_forum
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_meadowlands
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_meadowlands
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_meadowlands
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_tushino
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_tushino
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_tushino
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_stone
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_stone
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_stone
					Name = crowd_w_reverb_buss_echo
				}
			]}
		case z_icecave
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_z_icecave
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_z_icecave
					Name = crowd_w_reverb_buss_echo
				}
			]}
		default
		setsoundbusseffects \{effects = [
				{
					$reverb_crowd_buss_default_semiwet
					Name = crowd_w_reverb_buss_reverb
				}
			]}
		setsoundbusseffects \{effects = [
				{
					$echo_crowd_buss_default_semiwet
					Name = crowd_w_reverb_buss_echo
				}
			]}
	endswitch
endscript

script GH_Star_Power_Verb_On 
	getplayerinfo <Player> part
	if ($Star_power_verb_is_on = 1)
		if NOT isSinglePlayerGame
			SpawnScriptNow star_power_clap_panning_multiple params = {Player = <Player>}
			SpawnScriptNow star_power_deployed_sfx_multiplayer params = {Player = <Player>}
			get_song_tempo_cfunc
			oneandahalfbeats = (<beat_duration> * 1.5)
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
			if (<part> = vocals)
				vocaldspsetparams \{effect = sfxreverb
					ReverbLevel = 200
					RoomHF = 1000
					Diffusion = 1200
					DryLevel = -2000.0}
				vocaldspsetparams \{effect = echo
					Drymix = 0.0
					Wetmix = 0.5
					delay = 100}
			endif
		endif
		return
	endif
	get_song_tempo_cfunc
	if (<tempo> > 175)
		Change \{halftime_clapping = 1}
	elseif (<tempo> < 176)
		Change \{halftime_clapping = 0}
	endif
	SpawnScriptNow star_power_clap_panning params = {Player = <Player>}
	Change \{Star_power_verb_is_on = 1}
	if isSinglePlayerGame
		SoundEvent \{event = Star_Power_Deployed_SFX}
		SoundEvent \{event = star_power_deployed_lfe_gh4}
		if ($game_mode != tutorial)
			if NOT IsSoundEventPlaying \{Star_Power_Deployed_Cheer_SFX}
				SoundEvent \{event = Star_Power_Deployed_Cheer_SFX}
			endif
		endif
	else
		SpawnScriptNow star_power_deployed_sfx_multiplayer params = {Player = <Player>}
	endif
	get_song_tempo_cfunc
	oneandahalfbeats = (<beat_duration> * 1.5)
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
	if (<part> = vocals)
		vocaldspsetparams \{effect = sfxreverb
			ReverbLevel = 200
			RoomHF = 1000
			Diffusion = 1200
			DryLevel = -1300.0}
		vocaldspsetparams \{effect = echo
			Drymix = 0.0
			Wetmix = 0.5
			delay = 100}
	else
		songsetstarpowereffectssendvolume Player = <Player> vol = 4
	endif
endscript

script GH_Star_Power_Verb_Off 
	SpawnScriptNow star_clap_end params = {Player = <Player>}
	SpawnScriptNow \{clap_fading}
	songsetstarpowereffectssendvolume Player = <Player> vol = -100
	Change \{Star_power_verb_is_on = 0}
endscript

script GH3_Set_Guitar_Verb_And_Echo_to_Dry 
	0x8dbdaee4 \{'GH3_Set_Guitar_Verb_And_Echo_to_Dry (noop)'}
endscript

script GH3_Battle_Attack_Finished_SFX 
	if (<Player> = 1)
		SoundEvent \{event = GH_SFX_BattleMode_Attack_Over_P1}
	else
		SoundEvent \{event = GH_SFX_BattleMode_Attack_Over_P2}
	endif
endscript

script GH3_Battle_Play_Crowd_Reaction_SFX 
	if (<receiving_player> = 1)
		SoundEvent \{event = $current_crowd_battle_cheer_l_p2}
		SoundEvent \{event = $current_crowd_battle_cheer_r_p2}
	else
		SoundEvent \{event = $current_crowd_battle_cheer_l_p1}
		SoundEvent \{event = $current_crowd_battle_cheer_r_p1}
	endif
endscript

script Battle_SFX_Repair_Broken_String 

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
	endswitch
	<change_pitch> = (1.0 * <num_strums> / <total_strums>)
	<local_pitch> = (100.0 - (10.0 * <change_pitch>))
	PlaySound GH3_Battlemode_StringTune_2 vol_percent = 50 pitch_percent = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y> buss = UI_Battle_Mode
endscript

script setup_all_crowd_sounds_based_on_zone 
	venuesize = 'Medium_EXT'
	GetPakManCurrentName \{map = zones}
	get_band_name song = ($current_song)
	0x8882d576
	formatText checksumName = whistletemp 'Crowd_Whistle_%s_Good' s = <venuesize> AddToStringLookup = true
	Change current_crowd_whistle_soundevent = <whistletemp>
	formatText checksumName = oneshotgoodtemp 'Crowd_OneShot_%s_Good' s = <venuesize> AddToStringLookup = true
	Change current_crowd_oneshot_positive_soundevent = <oneshotgoodtemp>
	formatText checksumName = oneshotbadtemp 'Crowd_OneShot_%s_Bad' s = <venuesize> AddToStringLookup = true
	Change current_crowd_oneshot_negative_soundevent = <oneshotbadtemp>
	formatText checksumName = loopgoodtemp 'Crowd_Loop_%s_Good' s = <venuesize> AddToStringLookup = true
	Change current_crowd_looping_bg_area_good = <loopgoodtemp>
	formatText checksumName = loopneutraltemp 'Crowd_Loop_%s_Neutral' s = <venuesize> AddToStringLookup = true
	Change current_crowd_looping_bg_area_neutral = <loopneutraltemp>
	formatText checksumName = loopbadtemp 'Crowd_Loop_%s_Bad' s = <venuesize> AddToStringLookup = true
	Change current_crowd_looping_bg_area_bad = <loopbadtemp>
	crowdtransitionchecksum = crowd_transition
	state_p_to_m_left = '_poor_to_med_L'
	state_m_to_p_left = '_med_to_poor_L'
	state_m_to_g_left = '_med_to_good_L'
	state_g_to_m_left = '_good_to_med_L'
	state_p_to_m_right = '_poor_to_med_R'
	state_m_to_p_right = '_med_to_poor_R'
	state_m_to_g_right = '_med_to_good_R'
	state_g_to_m_right = '_good_to_med_R'
	Change \{current_crowd_clap_normal_soundevent = 0x964d7365}
	Change \{current_crowd_clap_middle_soundevent = 0x840daf17}
	Change \{current_crowd_clap_left_middle_soundevent = 0xc58856d6}
	Change \{current_crowd_clap_right_middle_soundevent = 0x4895857a}
	Change \{current_crowd_clap_left_soundevent = 0x0f098227}
	Change \{current_crowd_clap_right_soundevent = 0xb4bffcaa}
	if (<pakname> = 'z_tool')
		Change \{current_crowd_clap_normal_soundevent = None}
		Change \{current_crowd_clap_middle_soundevent = None}
		Change \{current_crowd_clap_left_middle_soundevent = None}
		Change \{current_crowd_clap_right_middle_soundevent = None}
		Change \{current_crowd_clap_left_soundevent = None}
		Change \{current_crowd_clap_right_soundevent = None}
	endif
	formatText checksumName = transitiontemp 'Crowd_Transition_%s_Poor_To_Med' s = <venuesize> AddToStringLookup = true
	Change current_crowd_transition_bad_to_neutral = <transitiontemp>
	formatText checksumName = transitiontemp 'Crowd_Transition_%s_Med_To_Poor' s = <venuesize> AddToStringLookup = true
	Change current_crowd_transition_neutral_to_bad = <transitiontemp>
	formatText checksumName = transitiontemp 'Crowd_Transition_%s_Med_To_Good' s = <venuesize> AddToStringLookup = true
	Change current_crowd_transition_neutral_to_good = <transitiontemp>
	formatText checksumName = transitiontemp 'Crowd_Transition_%s_Good_To_Med' s = <venuesize> AddToStringLookup = true
	Change current_crowd_transition_good_to_neutral = <transitiontemp>
	formatText checksumName = swelltemp 'Crowd_Swell_Short_%s' s = <venuesize> AddToStringLookup = true
	Change current_crowd_swell_short_soundevent = <swelltemp>
	formatText checksumName = swelltemp 'Crowd_Swell_Short_Soft_%s' s = <venuesize> AddToStringLookup = true
	Change current_crowd_swell_short_soft_soundevent = <swelltemp>
	formatText checksumName = swelltemp 'Crowd_Swell_Med_%s' s = <venuesize> AddToStringLookup = true
	Change current_crowd_swell_med_soundevent = <swelltemp>
	formatText checksumName = swelltemp 'Crowd_Swell_Long_%s' s = <venuesize> AddToStringLookup = true
	Change current_crowd_swell_long_soundevent = <swelltemp>
	formatText checksumName = applausetemp 'Crowd_Applause_%s' s = <venuesize> AddToStringLookup = true
	Change current_crowd_applause_soundevent = <applausetemp>
	formatText checksumName = introtemp 'Crowd_Venue_Intro_%s' s = <pakname> AddToStringLookup = true
	Change current_crowd_venue_intro_soundevent = <introtemp>
	formatText checksumName = encoretemp '%s_Encore_Crowd' s = <venuesize> AddToStringLookup = true
	Change current_crowd_encore = <encoretemp>
	formatText checksumName = tempvenuesize '%s' s = <venuesize> AddToStringLookup = true
	Change current_venue_size = <tempvenuesize>
	if ((<pakname> = 'z_studio') || (<pakname> = 'z_studio2'))
		Change \{current_crowd_looping_bg_area_bad = musicstudio}
		Change \{current_crowd_looping_bg_area_neutral = musicstudio}
		Change \{current_crowd_looping_bg_area_good = musicstudio}
		Change \{current_crowd_looping_bg_area = musicstudio}
	endif
	if ((<pakname> = 'z_tool'))
		<venuesize> = 'Large_EXT'
		formatText checksumName = transitiontemp 'Crowd_Transition_%s_Poor_To_Med' s = <venuesize> AddToStringLookup = true
		Change current_crowd_transition_bad_to_neutral = <transitiontemp>
		formatText checksumName = transitiontemp 'Crowd_Transition_%s_Med_To_Poor' s = <venuesize> AddToStringLookup = true
		Change current_crowd_transition_neutral_to_bad = <transitiontemp>
		formatText checksumName = transitiontemp 'Crowd_Transition_%s_Med_To_Good' s = <venuesize> AddToStringLookup = true
		Change current_crowd_transition_neutral_to_good = <transitiontemp>
		formatText checksumName = transitiontemp 'Crowd_Transition_%s_Good_To_Med' s = <venuesize> AddToStringLookup = true
		Change current_crowd_transition_good_to_neutral = <transitiontemp>
		formatText checksumName = transitiontemp 'Crowd_Transition_%s_Poor_To_Med' s = <venuesize> AddToStringLookup = true
		Change current_crowd_transition_bad_to_neutral = <transitiontemp>
		formatText checksumName = transitiontemp 'Crowd_Transition_%s_Med_To_Poor' s = <venuesize> AddToStringLookup = true
		Change current_crowd_transition_neutral_to_bad = <transitiontemp>
		formatText checksumName = transitiontemp 'Crowd_Transition_%s_Med_To_Good' s = <venuesize> AddToStringLookup = true
		Change current_crowd_transition_neutral_to_good = <transitiontemp>
		formatText checksumName = transitiontemp 'Crowd_Transition_%s_Good_To_Med' s = <venuesize> AddToStringLookup = true
		Change current_crowd_transition_good_to_neutral = <transitiontemp>
	endif
	0x8dbdaee4 \{channel = sfx
		qs(0xfba306ee)}
	0x8dbdaee4 \{channel = sfx
		qs(0x8d80eacf)
		s = $current_crowd_whistle_soundevent}
	0x8dbdaee4 \{channel = sfx
		qs(0xf1a35267)
		s = $current_crowd_oneshot_positive_soundevent}
	0x8dbdaee4 \{channel = sfx
		qs(0xfe1327ac)
		s = $current_crowd_oneshot_negative_soundevent}
	0x8dbdaee4 \{channel = sfx
		qs(0x713755f7)}
	0x8dbdaee4 \{channel = sfx
		qs(0x77767cd1)
		s = $current_crowd_looping_bg_area_bad}
	0x8dbdaee4 \{channel = sfx
		qs(0x832a45ec)
		s = $current_crowd_looping_bg_area_neutral}
	0x8dbdaee4 \{channel = sfx
		qs(0xf6e25b4b)
		s = $current_crowd_looping_bg_area_good}
	0x8dbdaee4 \{channel = sfx
		qs(0x24ab80a8)
		s = $current_crowd_looping_bg_area}
	0x8dbdaee4 \{channel = sfx
		qs(0x713755f7)}
	0x8dbdaee4 \{channel = sfx
		qs(0xe512b6d5)
		s = $current_crowd_transition_bad_to_neutral}
	0x8dbdaee4 \{channel = sfx
		qs(0xbf1fc790)
		s = $current_crowd_transition_neutral_to_bad}
	0x8dbdaee4 \{channel = sfx
		qs(0x43338762)
		s = $current_crowd_transition_neutral_to_good}
	0x8dbdaee4 \{channel = sfx
		qs(0xb603dab6)
		s = $current_crowd_transition_good_to_neutral}
	0x8dbdaee4 \{channel = sfx
		qs(0x713755f7)}
	0x8dbdaee4 \{channel = sfx
		qs(0xe6bc13b4)
		s = $current_crowd_swell_short_soundevent}
	0x8dbdaee4 \{channel = sfx
		qs(0x5881663d)
		s = $current_crowd_swell_med_soundevent}
	0x8dbdaee4 \{channel = sfx
		qs(0x8f5e027f)
		s = $current_crowd_swell_long_soundevent}
	0x8dbdaee4 \{channel = sfx
		qs(0x713755f7)}
	0x8dbdaee4 \{channel = sfx
		qs(0xec13644d)
		s = $current_crowd_applause_soundevent}
	0x8dbdaee4 \{channel = sfx
		qs(0xfba306ee)}
endscript

script GH3_Crowd_Event_Listener 
	return
endscript
0x67e65592 = NULL

script play_a_crowd_whistle_good_based_on_venue 
	0x8dbdaee4 \{'Play_A_Crowd_Whistle_Good_Based_On_Venue (noop)'}
endscript

script 0x8c046839 
	if NOT ($0x67e65592 = NULL)
		0xc7acd659 \{unique_id = $0x67e65592}
	endif
endscript

script play_a_short_crowd_swell_for_this_venue 
	if ($0x7bfc9a26 = 1)
		0x8dbdaee4 \{'Skipping crowd swell.'}
		return
	endif
	SpawnScriptNow \{0x516f97a5}
	SoundEvent \{$current_crowd_swell_short_soundevent}
endscript

script play_a_short_crowd_swell_for_this_venue_softer 
	if ($0x7bfc9a26 = 1)
		0x8dbdaee4 \{'Skipping crowd swell.'}
		return
	endif
	SpawnScriptNow \{0x516f97a5}
	SoundEvent \{$current_crowd_swell_short_soft_soundevent}
endscript

script play_a_med_crowd_swell_for_this_venue 
	if ($0x7bfc9a26 = 1)
		0x8dbdaee4 \{'Skipping crowd swell.'}
		return
	endif
	SpawnScriptNow \{0x516f97a5}
	SoundEvent \{$current_crowd_swell_med_soundevent}
endscript

script play_a_long_crowd_swell_for_this_venue 
	if ($0x7bfc9a26 = 1)
		0x8dbdaee4 \{'Skipping crowd swell.'}
		return
	endif
	SpawnScriptNow \{0x516f97a5}
	SoundEvent \{$current_crowd_swell_long_soundevent}
endscript

script play_a_crowd_applause_for_this_venue 
	if ($0x7bfc9a26 = 1)
		0x8dbdaee4 \{'Skipping crowd applause.'}
		return
	endif
	SpawnScriptNow \{0x516f97a5}
	SoundEvent \{$current_crowd_applause_soundevent}
endscript

script GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue 
	0x8dbdaee4 \{'GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue (noop)'}
endscript

script GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue 
	if ($0x7bfc9a26 = 1)
		0x8dbdaee4 \{'Skipping crowd negative oneshot.'}
		return
	endif
	SpawnScriptNow \{0x516f97a5}
	SoundEvent \{event = crowd_reaction_bad}
	if ($turn_off_oneshot_cheers = 0)
		SpawnScriptNow \{stopallcheeringsounds}
	endif
endscript

script gh3_adjustcrowdloopbacktodefault \{restarting = 0
		Normal = 0}
	if ($current_playing_transition = loading)
		return
	endif
	if ((<restarting> = 1) || (<Normal> = 1))
		if GotParam \{time}
			setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0} time = <time>}
		else
			setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol) pitch = 0.0}}
		endif
	endif
endscript

script gh3_adjustcrowdfastsmallsurge 
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 3)} time = 0.08}
	Wait \{1.5
		Seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		Normal = 1}
endscript

script gh3_adjustcrowdfastbigsurge 
	if ($is_attract_mode = 1)
		return
	endif
	GetPakManCurrent \{map = zones}
	switch <pak>
		default
		setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 5)} time = 0.08}
	endswitch
	Wait \{1.5
		Seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		Normal = 1}
endscript

script gh3_adjustcrowdmedsurge 
	if ($is_attract_mode = 1)
		return
	endif
	GetPakManCurrent \{map = zones}
	switch <pak>
		default
		setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 5)} time = 2}
	endswitch
	Wait \{4.0
		Seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		Normal = 1}
endscript

script gh3_adjustcrowdslowbigsurge 
	if ($is_attract_mode = 1)
		return
	endif
	GetPakManCurrent \{map = zones}
	switch <pak>
		default
		setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 5)} time = 3}
	endswitch
	Wait \{8
		Seconds}
	gh3_adjustcrowdloopbacktodefault \{time = 4
		Normal = 1}
endscript

script song_quiet_adjust_all_sfx_down 
	0x8dbdaee4 \{channel = sfx
		'Quieting SFX due to sound trigger.'}
	setsoundbussparams {sfx_balance = {vol = (($default_BussSet.sfx_balance.vol) - 4.0)} time = 4}
	setsoundbussparams {Front_End = {vol = (($default_BussSet.Front_End.vol) + 4.0)} time = 4}
	setsoundbussparams {pause_menu = {vol = (($default_BussSet.pause_menu.vol) + 4.0)} time = 4}
	setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol) - 4.0)} time = 8}
	setsoundbussparams {drums_ingame = {vol = (($default_BussSet.drums_ingame.vol) - 4.0)} time = 4}
endscript

script remove_song_quiet_setting 
	0x8dbdaee4 \{channel = sfx
		'Unquieting SFX immediately from fail/quit.'}
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)} time = 0.5}
	setsoundbussparams {Front_End = {vol = ($default_BussSet.Front_End.vol)} time = 0.5}
	setsoundbussparams {pause_menu = {vol = ($default_BussSet.pause_menu.vol)} time = 0.5}
	setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)} time = 2}
	setsoundbussparams {drums_ingame = {vol = ($default_BussSet.drums_ingame.vol)}}
endscript

script song_quiet_over_adjust_all_sfx_to_normal 
	0x8dbdaee4 \{channel = sfx
		'Unquieting SFX from song trigger.'}
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)} time = 8}
	setsoundbussparams {Front_End = {vol = ($default_BussSet.Front_End.vol)} time = 4}
	setsoundbussparams {pause_menu = {vol = ($default_BussSet.pause_menu.vol)} time = 4}
	setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)} time = 4}
	setsoundbussparams {drums_ingame = {vol = ($default_BussSet.drums_ingame.vol)} time = 2}
endscript

script song_quiet_reset_sfx_balance \{loading_transition = 0
		restarting = 0}
	if (<loading_transition> = 1)
		return
	endif
	if (<restarting> = 1)
		setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)}}
		setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)}}
	else
		Change \{crowd_transition_start_of_song_normal = 1}
	endif
endscript

script moment_on_stage_crowd_reaction_sfx 
	0x8dbdaee4 \{'Moment_On_Stage_Crowd_Reaction_SFX (noop)'}
endscript

script crowd_surge_and_sustain_at_end_of_song 
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 4)} time = 3.5}
endscript

script Crowd_Singalong_Volume_Up 
	GetPakManCurrent \{map = zones}
	if ((<pak> = z_studio) || (<pak> = z_studio2) || (<pak> = z_training) || (<pak> = z_soundcheck) || (<pak> = z_soundcheck2))
		return
	endif
	if NOT ($crowd_is_singing = 1)
		setsoundbussparams \{Crowd_Singalong = {
				vol = -2
			}
			time = 4}
	endif
	Change \{crowd_is_singing = 1}
endscript

script Crowd_Singalong_Volume_Down 
	if ($crowd_is_singing = 1)
		setsoundbussparams \{Crowd_Singalong = {
				vol = -100.0
			}
			time = 4}
	endif
	Change \{crowd_is_singing = 0}
endscript

script Change_Crowd_Looping_SFX \{crowd_looping_state = good
		Player = 1
		loading_transition = 0
		restarting = 0}
	WaitOneGameFrame
	if ($game_mode = p2_pro_faceoff)
		do_actual_changing_of_looping_sound crowd_looping_state = good loading_transition = <loading_transition> restarting = <restarting>
	else
		do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state> loading_transition = <loading_transition> restarting = <restarting>
	endif
endscript

script do_actual_changing_of_looping_sound \{loading_transition = 0
		restarting = 0}

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

		new_bg_area = $current_crowd_looping_bg_area_good
		new_oneshots = $current_crowd_oneshot_positive_soundevent
	endswitch
	if (($crowd_in_jam_mode_song_state = 1) || ($crowd_in_front_end_state = 1) || (<pak> = z_studio) || (<pak> = z_studio2) || (<pak> = z_tool) || (<pak> = z_credits))
		new_oneshots = DoNothing_OneShot
	endif
	Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = <new_bg_area> loading_transition = <loading_transition> restarting = <restarting>
	One_Shot_SoundEvent SoundEvent = <new_oneshots> waitTime = 5
endscript

script BG_Crowd_Front_End_Silence \{immediate = 0}
	Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = FrontEnd immediate = <immediate>
	One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waitTime = 5 immediate = <immediate>
endscript

script Crowd_Transition_SFX_Poor_To_Medium 

	WaitOneGameFrame
	Crowd_generic_transition_sfx state = poor_to_med Player = <Player>
endscript

script Crowd_Transition_SFX_Medium_To_Good 

	WaitOneGameFrame
	Crowd_generic_transition_sfx state = med_to_good Player = <Player>
endscript

script Crowd_Transition_SFX_Medium_To_Poor 

	WaitOneGameFrame
	Crowd_generic_transition_sfx state = med_to_poor Player = <Player>
endscript

script Crowd_Transition_SFX_Good_To_Medium 

	WaitOneGameFrame
	Crowd_generic_transition_sfx state = good_to_med Player = <Player>
endscript

script Crowd_generic_transition_sfx \{state = med_to_good}
	if ($game_mode = p2_pro_faceoff)
		return
	endif
	play_transition_sfx state = <state> left = 1 right = 1
endscript

script transition_sfx_left_side 
	play_transition_sfx state = <state> left = 1
endscript

script transition_sfx_right_side 
	play_transition_sfx state = <state> right = 1
endscript

script play_transition_sfx 

	if ($is_attract_mode = 1)
		return
	endif
	if ($0x7bfc9a26 = 1)
		0x8dbdaee4 \{'Skipping crowd transition'}
		return
	endif
	SpawnScriptNow \{0x516f97a5}
	switch <state>
		case poor_to_med
		transitionevent = $current_crowd_transition_bad_to_neutral
		case med_to_good
		transitionevent = $current_crowd_transition_neutral_to_good
		case good_to_med
		transitionevent = $current_crowd_transition_good_to_neutral
		case med_to_poor
		transitionevent = $current_crowd_transition_neutral_to_bad
		default

		return
	endswitch
	SoundEvent <transitionevent>
endscript
menu_music_on_flag = 0

script menu_music_on 
	SpawnScriptNow menu_music_on_spawned params = {<...>}
endscript

script menu_music_on_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{menu_music_on_flag = 1}
	if GotParam \{waitforguitarlick}
		Wait <guitarwaittime> Seconds
		SoundEvent \{event = guitar_lick_crowd_swell}
	endif
	0xdaee51ef
endscript

script menu_music_off 
	EnableUserMusic \{disable}
	Change \{menu_music_on_flag = 0}
	KillSpawnedScript \{Name = menu_music_on}
	KillSpawnedScript \{Name = menu_music_on_spawned}
	0xdaee51ef \{disable}
endscript

script menu_music_panning_vol 
	return
endscript

script menu_music_pan_reset 
	return
endscript

script menu_music_pan 
	return
endscript

script Menu_music_Checking 
	return
endscript

script band_screen_ui_sound 
	if NOT GotParam \{player_num}
		if GotParam \{up}
			SoundEvent \{ui_sfx_scroll_up
				vol = -10
				pitch = 1}
		else GotParam \{down}
			SoundEvent \{ui_sfx_scroll_down
				vol = -6.5
				pitch = 3}
		endif
		return
	endif
	SetSpawnInstanceLimits \{Max = 6
		management = kill_oldest}
	if ($game_mode = p2_pro_faceoff)
		if (<player_num> = 1)
			<pan1x> = -0.25
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif (<player_num> = 2)
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 0.25
			<pan2y> = 1
		endif
	else
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
	endif
	if GotParam \{up}
		switch <instrument>
			case drum
			SoundEvent ui_sfx_scroll_up vol = -13 pitch = 1 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case guitar
			SoundEvent ui_sfx_scroll_up vol = -13 pitch = 1 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocals
			SoundEvent ui_sfx_scroll_up vol = -13 pitch = 1 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case bass
			SoundEvent ui_sfx_scroll_up vol = -13 pitch = 1 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			default
			SoundEvent ui_sfx_scroll_up vol = -13 pitch = 1 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		endswitch
	else GotParam \{down}
		switch <instrument>
			case drum
			SoundEvent ui_sfx_scroll_down vol = -12 pitch = 3 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case guitar
			SoundEvent ui_sfx_scroll_down vol = -12 pitch = 3 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case vocals
			SoundEvent ui_sfx_scroll_down vol = -12 pitch = 3 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			case bass
			SoundEvent ui_sfx_scroll_down vol = -12 pitch = 3 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			default
			SoundEvent ui_sfx_scroll_down vol = -12 pitch = 3 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
		endswitch
	endif
endscript

script band_screen_scroll 
	0x8dbdaee4 \{'Band_Screen_Scroll (noop)'}
endscript

script band_screen_select 
	0x8dbdaee4 \{'Band_Screen_Select (noop)'}
endscript

script band_screen_back 
	0x8dbdaee4 \{'Band_Screen_Back (noop)'}
endscript

script attract_mode_start_sound_script 
	setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) - 100)} time = 2.5}
	setsoundbussparams {leadvox_balance = {vol = (($default_BussSet.leadvox_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {drums_balance = {vol = (($default_BussSet.drums_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {leadgtr_balance = {vol = (($default_BussSet.leadgtr_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {bass_balance = {vol = (($default_BussSet.bass_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {rhythmgtr_balance = {vol = (($default_BussSet.rhythmgtr_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {band_Balance = {vol = (($default_BussSet.band_Balance.vol) - 11)} time = 1.5}
	setsoundbussparams {sfx_balance = {vol = (($default_BussSet.sfx_balance.vol) - 11)} time = 1.5}
	setsoundbussparams {UI_Star_Power = {vol = (($default_BussSet.UI_Star_Power.vol) - 100)} time = 1.5}
	setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol) - 11)} time = 7}
	setsoundbussparams {crowdsingalong_balance = {vol = (($default_BussSet.crowdsingalong_balance.vol) - 11)} time = 7}
	setsoundbussparams {Crowd_W_Reverb = {vol = (($default_BussSet.Crowd_W_Reverb.vol) - 11)} time = 7}
endscript

script attract_mode_ends_sound_script 
	setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = 2.5}
	setsoundbussparams {leadvox_balance = {vol = ($default_BussSet.leadvox_balance.vol)} time = 1.5}
	setsoundbussparams {drums_balance = {vol = ($default_BussSet.drums_balance.vol)} time = 1.5}
	setsoundbussparams {leadgtr_balance = {vol = ($default_BussSet.leadgtr_balance.vol)} time = 1.5}
	setsoundbussparams {bass_balance = {vol = ($default_BussSet.bass_balance.vol)} time = 1.5}
	setsoundbussparams {rhythmgtr_balance = {vol = ($default_BussSet.rhythmgtr_balance.vol)} time = 1.5}
	setsoundbussparams {band_Balance = {vol = ($default_BussSet.band_Balance.vol)} time = 1.5}
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)} time = 1.5}
	setsoundbussparams {UI_Star_Power = {vol = ($default_BussSet.UI_Star_Power.vol)} time = 1.5}
	setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)} time = 7}
	setsoundbussparams {crowdsingalong_balance = {vol = ($default_BussSet.crowdsingalong_balance.vol)} time = 7}
	setsoundbussparams {Crowd_W_Reverb = {vol = ($default_BussSet.Crowd_W_Reverb.vol)} time = 7}
endscript

script sound_options_scroll 
	SoundEvent \{audio_options_up_down}
endscript

script playing_sound_fader \{time = 2.102}
	setspawnedscriptnorepeatfor time = <time>
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}

	switch <instrument>
		case guitar
		if ($guitar_knob_effects_position = 1)
			SoundEvent \{0x6a88bebd
				vol = -7.0
				buss = options_guitar
				effects = [
					{
						$eq_guitarlead_crisp
						Name = audiooptionssound
					}
				]}
		endif
		if ($guitar_knob_effects_position = 2)
			SoundEvent \{0x6a88bebd
				vol = -7.0
				buss = options_guitar
				effects = [
					{
						$eq_guitarlead_edgy
						Name = audiooptionssound
					}
				]}
		endif
		if ($guitar_knob_effects_position = 3)
			SoundEvent \{0x6a88bebd
				vol = -7.0
				buss = options_guitar
				effects = [
					{
						$eq_guitarlead_fuzz
						Name = audiooptionssound
					}
				]}
		endif
		case bass
		if ($bass_knob_effects_position = 1)
			SoundEvent \{0x44353325
				vol = -9.0
				buss = options_bass
				effects = [
					{
						$eq_bass_bari
						Name = audiooptionssound
					}
				]}
		endif
		if ($bass_knob_effects_position = 2)
			SoundEvent \{0x44353325
				vol = -9.0
				buss = options_bass
				effects = [
					{
						$eq_bass_boomy
						Name = audiooptionssound
					}
				]}
		endif
		if ($bass_knob_effects_position = 3)
			SoundEvent \{0x44353325
				vol = -9.0
				buss = options_bass
				effects = [
					{
						$eq_bass_fretty
						Name = audiooptionssound
					}
				]}
		endif
		case drums
		if ($drum_knob_effects_position = 1)
			SoundEvent \{0x9f6c8f4e
				vol = -2.0
				buss = options_drums
				effects = [
					{
						$eq_drum_punch
						Name = audiooptionssound
					}
				]}
		endif
		if ($drum_knob_effects_position = 2)
			SoundEvent \{0x9f6c8f4e
				vol = -2.0
				buss = options_drums
				effects = [
					{
						$eq_drum_crack
						Name = audiooptionssound
					}
				]}
		endif
		if ($drum_knob_effects_position = 3)
			SoundEvent \{0x9f6c8f4e
				vol = -2.0
				buss = options_drums
				effects = [
					{
						$eq_drum_sizzle
						Name = audiooptionssound
					}
				]}
		endif
		case mic
		PlaySound \{audio_options_mic
			vol = -1
			buss = options_vox
			slot = 3}
		case vocals
		SoundEvent \{0xef2c8b4e
			vol = 0
			buss = lead_vox
			slot = 3}
		case instruments
		PlaySound \{audio_options_instruments
			vol = -6
			buss = Band_Playback
			slot = 3}
		case sfx
		SoundEvent \{audio_options_menu_sfx
			vol = -2
			buss = options_crowd
			slot = 3}
	endswitch
endscript

script playing_sound_knob 

	setspawnedscriptnorepeatfor \{time = 2.256}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	switch <instrument>
		case guitar
		SoundEvent 0x6a88bebd vol = -9.0 buss = options_guitar effects = [{<eq_setting> Name = audiooptionssound}]
		case bass
		SoundEvent 0x44353325 vol = -9.0 buss = options_bass effects = [{<eq_setting> Name = audiooptionssound}]
		case vocals
		SoundEvent 0x3fab2f84 vol = -9.0 buss = options_vocals effects = [{<eq_setting> Name = audiooptionssound}]
		case drums
		SoundEvent 0xd36beb35 vol = -9.0 buss = options_drums effects = [{<eq_setting> Name = audiooptionssound}]
	endswitch
endscript

script menu_music_fade \{Wait = 0
		Volume = 100
		time = 0}

	Wait <Wait> Seconds
	if GotParam \{out}
		setsoundbussparams {Music_FrontEnd = {vol = (($default_BussSet.Music_FrontEnd.vol) - <Volume>)} time = <time>}
		if NOT GotParam \{dont_fade_crowd}
			setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) - <Volume>)} time = <time>}
		endif
	else GotParam \{in}
		setsoundbussparams {Music_FrontEnd = {vol = ($default_BussSet.Music_FrontEnd.vol)} time = <time>}
		setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol)} time = <time>}
		if NOT GotParam \{options_audio}
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = frontend_menu_music}
		endif
	endif
endscript

script Song_Intro_Kick_SFX_Waiting 
	Wait ($current_intro.hud_move_time / 1000.0) Seconds
	SoundEvent \{event = Song_Intro_Kick_SFX}
endscript

script Song_Intro_Highway_Up_SFX_Waiting 
	waitTime = (($current_intro.highway_move_time / 1000.0) - 1.5)
	if (<waitTime> < 0)
		waitTime = 0
	endif
	Wait <waitTime> Seconds
	SoundEvent \{Song_Intro_Highway_Up}
	GetPakManCurrent \{map = zones}
	if (<pak> = z_studio)
		if IsSoundEventPlaying \{z_studio_intro_1}
			StopSoundEvent \{z_studio_intro_1
				fade_time = 0.5
				fade_type = log_slow}
		endif
	endif
endscript

script song_intro_highway_up_vocals_sfx_waiting 
	waitTime = (($current_intro.highway_move_time / 1000.0) - 2.3)
	if (<waitTime> < 0)
		waitTime = 0
	endif
	Wait <waitTime> Seconds
	SoundEvent \{vocal_highway_appear}
endscript

script GH_SFX_Intro_WarmUp 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_justice
		SpawnScriptNow \{metalfest_intro}
		SoundEvent \{event = z_justice_intro}
		case z_donnington
		SpawnScriptNow \{metalfest_intro}
		SoundEvent \{event = z_donington_intro}
		case z_meadowlands
		SpawnScriptNow \{metalfest_intro}
		SoundEvent \{event = z_metalfest_intro}
		case z_studio
		SoundEvent \{event = z_studio_intro}

		case z_studio2
		SoundEvent \{event = z_studio_intro2}

		case z_soundcheck2
		SoundEvent \{event = z_soundcheck2_intro}
		case z_icecave
		SoundEvent \{event = z_icecave_intro}
		case z_mop
		SpawnScriptNow \{med_inside_intro}
		SoundEvent \{event = z_mop_intro}
		case z_tushino
		SpawnScriptNow \{large_outside_intro}
		SoundEvent \{event = z_tushino_intro}
		case z_stone
		SpawnScriptNow \{small_intro}
		SoundEvent \{event = z_stone_intro}
		default
		SpawnScriptNow \{metalfest_intro}
		SoundEvent \{event = z_harbor_intro}
	endswitch
	if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_icecave)
		if ($0x7bfc9a26 = 0)

			SpawnScriptNow \{0x516f97a5}
			SoundEvent \{event = $current_crowd_applause_soundevent}
		else

		endif
	endif
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol))} time = 2}
endscript

script gh_sfx_intro_warmup_fast 
	SoundEvent \{$current_crowd_applause_soundevent}
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol))} time = 2}
endscript

script gh_metallicavo_intro_warmup 
	SoundEvent \{event = $current_crowd_applause_soundevent}
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol))} time = 1.5}
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
	elseif (<velocity> > 74)
		formatText checksumName = sound_event_name 'Countoff_SFX_%s_Med' s = <countoff_sound>
	elseif (<velocity> > 49)
		formatText checksumName = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
	else
		formatText checksumName = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
	endif
	SoundEvent <sound_event_name>
endscript

script You_Rock_Waiting_Crowd_SFX 
	Wait \{2
		Seconds}
	SoundEvent \{Medium_Crowd_Applause}
endscript

script GH3_SFX_fail_song_stop_sounds 
	StopSoundsByBuss \{Crowd}
	StopSoundsByBuss \{UI_Star_Power}
	StopSoundsByBuss \{UI_Battle_Mode}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundsByBuss \{wrong_notes_bass}
	StopSoundsByBuss \{wrong_notes_drums}
	StopSoundsByBuss \{wrong_notes_guitar}
	StopSoundsByBuss \{binkcutscenes}
	BG_Crowd_Front_End_Silence \{immediate = 1}
	remove_song_quiet_setting
endscript

script GH3_SFX_Stop_Sounds_For_KillSong \{loading_transition = 0}
	setsoundbussparams {Default = {vol = ($default_BussSet.Default.vol)} time = 0.02}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundEvent \{Song_Intro_Kick_SFX}
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
	StopSoundEvent \{Star_Power_Awarded_SFX}
	StopSoundEvent \{Star_Power_Ready_SFX}
	StopSoundEvent \{star_power_available_gh4}
	StopSoundEvent \{star_power_release_center_gh4}
	StopSoundEvent \{star_power_release_front_gh4}
	StopSoundEvent \{Star_Power_Deployed_SFX}
	StopSoundEvent \{Star_Power_Deployed_Cheer_SFX}
	StopSoundEvent \{star_power_deployed_back_gh4}
	StopSoundEvent \{star_power_deployed_lfe_gh4}
	StopSoundEvent \{star_power_deployed_front_gh4}
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
	StopSoundEvent \{UI_SFX_Lose_Multiplier_2X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_3X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_4X}
	StopSoundEvent \{Lose_Multiplier_Crowd}
	StopSoundEvent \{star_power_deployed_back_p3_gh4}
	StopSoundEvent \{star_power_deployed_front_p3_gh4}
	StopSoundEvent \{star_power_available_p3_gh4}
	StopSoundEvent \{star_power_awarded_sfx_p3}
	StopSoundEvent \{star_power_release_center_p1_gh4}
	StopSoundEvent \{star_power_release_front_p1_gh4}
	StopSoundEvent \{UI_SFX_50_Note_Streak}
	StopSoundEvent \{UI_SFX_100_Note_Streak}
	stopsound \{0x7b6ab35c}
	stopsound \{0x52ff2c70}
	stopsound \{0x29f7db07}
	stopsound \{0x9f2b0ce3}
	stopsound \{sm_crowd_neutral_to_good_03}
	stopsound \{sm_crowd_good_to_neutral_03}
	stopsound \{sm_crowd_neutral_to_bad_03}
	stopsound \{sm_crowd_bad_to_neutral_01}
	stopsound \{int_sm_crowd_bad_loop}
	stopsound \{int_sm_crowd_good_loop}
	stopsound \{int_sm_crowd_neutral_loop}
	stopsound \{0x92adc9ae}
	stopsound \{0xcc3f6614}
	stopsound \{0xc030a1f5}
	stopsound \{0xefe527ab}
	stopsound \{md_crowd_neutral_to_good_01}
	stopsound \{md_crowd_good_to_neutral_01}
	stopsound \{md_crowd_neutral_to_bad_02}
	stopsound \{md_crowd_bad_to_neutral_01}
	stopsound \{ext_md_crowd_bad_loop}
	stopsound \{ext_md_crowd_good_loop}
	stopsound \{ext_md_crowd_neutral_loop}
	stopsound \{0xcd9525fb}
	stopsound \{0x0a0edbfb}
	stopsound \{0x9f084da0}
	stopsound \{0x29d49a44}
	stopsound \{lg_crowd_neutral_to_good_01}
	stopsound \{lg_crowd_good_to_neutral_01}
	stopsound \{lg_crowd_neutral_to_bad_01}
	stopsound \{lg_crowd_bad_to_neutral_01}
	stopsound \{ext_lg_crowd_bad_loop}
	stopsound \{ext_lg_crowd_good_loop}
	stopsound \{ext_lg_crowd_neutral_loop}
	if (<Type> = Normal)
		if NOT (<loading_transition> = 1)
			BG_Crowd_Front_End_Silence \{immediate = 1}
		endif
	endif
endscript

script GH_SFX_Training_Tuning_Strings 

	switch <note_played>
		case 0
		Sound = E_Tuning
		case 1
		Sound = A_Tuning
		case 2
		Sound = D_Tuning
		case 3
		Sound = G_Tuning
		case 4
		Sound = B_Tuning
	endswitch
	switch <training_notes_strummed>
		case 1
		pitch_percent = 80
		default
		pitch_percent = 90
	endswitch
	PlaySound <Sound> vol_percent = 90 pitch_percent = <pitch_percent> buss = Training_VO
endscript

script GH_SFX_Training_Hammer_On_Lesson_2 
	GH_SFX_Training_Tuning_Strings <...>
endscript

script 0xa44f76c6 

	if NOT IsSoundEventPlaying <Sound>
		return
	endif
	SetSoundParams <Sound> vol_percent = 100
	Wait \{0.05
		Seconds}
	SetSoundParams <Sound> vol_percent = 50
	Wait \{0.05
		Seconds}
	SetSoundParams <Sound> vol_percent = 10
	StopSoundEvent <Sound>
endscript

script StopNotes_01 
	0xa44f76c6 \{Sound = Tutorial_String_1_Strum_Free}
endscript

script StopNotes_02 
	0xa44f76c6 \{Sound = Tutorial_String_2_HOPO_Free}
endscript

script StopNotes_03 
	0xa44f76c6 \{Sound = Tutorial_String_3_HOPO_Free}
endscript

script StopNotes_04 
	0xa44f76c6 \{Sound = Tutorial_String_3_Strum_Free}
endscript

script StopNotes_05 
	0xa44f76c6 \{Sound = Tutorial_String_2_HOPO_Free}
endscript

script StopNotes_06 
	0xa44f76c6 \{Sound = Tutorial_String_1_HOPO_Free}
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
	if (($is_attract_mode = 1) || ($crowd_in_jam_mode_song_state = 1))
		return
	endif
	if (<combo> < 100)
		SoundEvent \{event = UI_SFX_50_Note_Streak}
	else
		SoundEvent \{event = UI_SFX_100_Note_Streak}
	endif
endscript

script GH_SFX_Note_Streak_P1 
	GH_SFX_Note_Streak_SinglePlayer <...>
endscript

script GH_SFX_Note_Streak_P2 
	GH_SFX_Note_Streak_SinglePlayer <...>
endscript

script gh_sfx_hotstart_singleplayer 
	SoundEvent \{0x6dd33db0}
endscript

script gh_sfx_hotstart_p1 
	gh_sfx_hotstart_singleplayer
endscript

script gh_sfx_hotstart_p2 
	gh_sfx_hotstart_singleplayer
endscript

script Guitar_Wrong_Note_Sound_Logic \{vol = 0.0
		pitch = 0.0
		soundasset = Default
		buss = Default
		pan1x = 0.0
		pan1y = 0.0
		pan2x = 0.0
		pan2y = 0.0}
	if ($is_attract_mode = 1)
		return
	endif
	switch ($<player_status>.highway_position)
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
		if ($current_num_players < 2)
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
	switch ($<player_status>.part)
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

	endswitch
	gamemode_getnumplayersshown
	if (<num_players_shown> > 1)
		vol = (<vol> - 2)
	endif
	PlaySound <soundasset> vol = <vol> pitch = <pitch> buss = <newbuss> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y> Priority = 90 panremovecenter = true slot = 2
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

script play_instrument_sound_with_panning \{vol = 0.0
		pitch = 0.0
		soundasset = Default
		buss = Default
		pan1x = 0.0
		pan1y = 0.0
		pan2x = 0.0
		pan2y = 0.0}
	if ($is_attract_mode = 1)
		return
	endif
	switch ($<player_status>.highway_position)
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
		if ($current_num_players < 2)

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
	switch ($<player_status>.part)
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
		switch <drum_index>
			case 0
			case 1
			case 3
			soundasset = bad_note_tom1
			vol = -6
			pitch = RandomFloat (-2.0, 0.0)
			case 2
			case 4
			soundasset = bad_note_hihat1
			vol = -2
			pitch = -4
			case 5
			soundasset = bad_note_kick1
			vol = -1
			pitch = 4
		endswitch
		newbuss = wrong_notes_drums

		default

	endswitch

	PlaySound <soundasset> vol = <vol> pitch = <pitch> buss = <newbuss> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y> Priority = 90 panremovecenter = true slot = 2
endscript

script z_metalfest_sfx_proxim_test 
	if inside

	else
		if GotParam \{Destroyed}

		else
			if GotParam \{Created}

			else

			endif
		endif
	endif
endscript

script testtonesoundevent \{Type = Default}

	switch <Type>
		case guitar

		PlaySound \{testtones_guitar
			buss = Master}
		case bass

		PlaySound \{testtones_bass
			buss = Master}
		case kick

		PlaySound \{testtones_kickdrum
			buss = Master}
		case snare

		PlaySound \{testtones_snaredrum
			buss = Master}
		case tom

		PlaySound \{testtones_toms
			buss = Master}
		case cymbal

		PlaySound \{testtones_cymbals
			buss = Master}
		case voxlead

		PlaySound \{testtones_leadvocals
			buss = Master}
		case voxbackup

		PlaySound \{testtones_backupvocals
			buss = Master}
		case Band

		PlaySound \{testtones_band
			buss = Master}
		case Crowd

		PlaySound \{testtones_crowd
			buss = Master}
		default

	endswitch
endscript

script startpinknoiseloopforcaliratelagscreen 
	PlaySound \{pinknoise_minnus_20
		buss = Default
		vol = -70
		num_loops = -1
		slot = 3}
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

script Profiling_FMOD_EFFECTS 
endscript

script stars 





endscript

script star_power_deployed_sfx_multiplayer \{Player = 1}
	SoundEvent \{event = Star_Power_Deployed_SFX}
	SoundEvent \{event = star_power_deployed_lfe_gh4}
	if ($game_mode != tutorial)
		if NOT IsSoundEventPlaying \{Star_Power_Deployed_Cheer_SFX}
			SoundEvent \{event = Star_Power_Deployed_Cheer_SFX}
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
	Change \{turn_off_oneshot_cheers = 1}
	Wait \{8
		Seconds}
	Change \{turn_off_oneshot_cheers = 0}
endscript

script clap_fading 
	Change \{clap_fade = 1}
	Change \{0x389366b2 = 1
		0xf16b0586}
	begin
	setsoundbussparams {Crowd_Star_Power = {vol = <vol>}}
	Change 0x389366b2 = ($0x389366b2 - 0.003)
	WaitOneGameFrame
	repeat 300
	Change \{clap_fade = 0}
	Change \{0x389366b2 = 1}
	Change \{star_clap_left = 0}
	Change \{star_clap_right = 0}
	Change \{star_clap_left_middle = 0}
	Change \{star_clap_right_middle = 0}
	Change \{star_clap_middle = 0}
	Change \{star_clap_normal = 0}
	setsoundbussparams {Crowd_Star_Power = {vol = ($default_BussSet.Crowd_Star_Power.vol)} time = 0.5}
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

	if NOT isSinglePlayerGame

		getplayerinfo <Player> highway_position

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
	SoundBussUnlock \{user_leadvox}
	setsoundbussparams \{user_leadvox = {
			vol = -100.0
		}}
	SoundBussLock \{user_leadvox}
	SoundBussUnlock \{user_drums}
	setsoundbussparams \{user_drums = {
			vol = -100.0
		}}
	SoundBussLock \{user_drums}
	SoundBussUnlock \{user_leadgtr}
	setsoundbussparams \{user_leadgtr = {
			vol = -100.0
		}}
	SoundBussLock \{user_leadgtr}
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
		vol = -2
		pan1x = -1.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		vol = -2
		pan1x = 0.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		vol = -2
		pan1x = 1.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		vol = -2
		pan1x = 1.0
		pan1y = -1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		vol = -2
		pan1x = -1.0
		pan1y = -1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_sinewav_12db
		vol = -2
		lfeonly = true
		lfe_vol = 0
		buss = Master}
	Wait \{2
		Seconds}
	repeat
endscript

script starttesttones_pink 
	SoundBussUnlock \{user_leadvox}
	setsoundbussparams \{user_leadvox = {
			vol = -100.0
		}}
	SoundBussLock \{user_leadvox}
	SoundBussUnlock \{user_drums}
	setsoundbussparams \{user_drums = {
			vol = -100.0
		}}
	SoundBussLock \{user_drums}
	SoundBussUnlock \{user_leadgtr}
	setsoundbussparams \{user_leadgtr = {
			vol = -100.0
		}}
	SoundBussLock \{user_leadgtr}
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
		vol = -2
		pan1x = -1.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		vol = -2
		pan1x = 0.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		vol = -2
		pan1x = 1.0
		pan1y = 1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		vol = -2
		pan1x = 1.0
		pan1y = -1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		vol = -2
		pan1x = -1.0
		pan1y = -1.0
		buss = Master}
	Wait \{2
		Seconds}
	PlaySound \{testtone_pinknoise_12db
		vol = -2
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
	setsoundbussparams \{user_leadvox = {
			vol = 0.0
		}}
	SoundBussUnlock \{user_drums}
	setsoundbussparams \{user_drums = {
			vol = 0.0
		}}
	SoundBussLock \{user_drums}
	setsoundbussparams \{user_leadgtr = {
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
menu_music_stream = blah
menu_music_preloading = 0
menu_music_last_song_index = -1
menu_music_last_last_song_index = -1
menu_music_last_last_last_song_index = -1
menu_music_last_last_last_last_song_index = -1
menu_music_songs = [
	{
		Stream = menu_music_entersandman
		array = heartbreaker_menumusic_fretbars
		delay = 0.0
		vol = -9
		offset = 0
	}
	{
		Stream = menu_music_sadbuttrue
		array = nosleeptillbrooklyn_menumusic_fretbars
		delay = 12.083
		vol = -9
		offset = 0
	}
	{
		Stream = menu_music_wheneverimay
		array = stranglehold_menumusic_fretbars
		delay = 5.638
		vol = -11
		offset = 0
	}
	{
		Stream = menu_music_battery
		array = today_menumusic_fretbars
		delay = 11.701
		vol = -9
		offset = 0
	}
	{
		Stream = menu_music_creepingdeath
		array = today_menumusic_fretbars
		delay = 11.701
		vol = -9
		offset = 0
	}
	{
		Stream = menu_music_memory
		array = today_menumusic_fretbars
		delay = 11.701
		vol = -12
		offset = 0
	}
	{
		Stream = menu_music_noleaf
		array = today_menumusic_fretbars
		delay = 11.701
		vol = -12
		offset = 0
	}
	{
		Stream = menu_music_kingnothing
		array = today_menumusic_fretbars
		delay = 11.701
		vol = -12
		offset = 0
	}
	{
		Stream = menu_music_belltoll
		array = today_menumusic_fretbars
		delay = 11.701
		vol = -12
		offset = 0
	}
]

script menu_music_se_spawned 
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
	StartPreLoadedStream <unique_id> buss = Music_FrontEnd forcesafepreload = 1 vol = -5 pitch = 100
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
	stopsound \{$menu_music_stream}
endscript

script crowd_anticipation 
	return
	if ($0x7bfc9a26 = 1)

		return
	else

	endif
	SpawnScriptNow \{0x516f97a5}
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

script large_outside_intro 
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	Wait \{1
		Second}
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_long_soundevent}
	Wait \{1
		Second}
	killsurgingscripts
endscript

script metalfest_intro 
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	Wait \{1
		Second}
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_long_soundevent}
	Wait \{1
		Second}
	killsurgingscripts
endscript

script military_intro 
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	Wait \{1
		Second}
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_long_soundevent}
	Wait \{1.3
		Seconds}
	Wait \{1
		Second}
	killsurgingscripts
endscript

script fair_intro 
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	Wait \{1
		Second}
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_long_soundevent}
	Wait \{2.3
		Seconds}
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	Wait \{1
		Second}
	killsurgingscripts
endscript

script small_intro 
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	Wait \{1
		Second}
	SoundEvent \{event = $current_crowd_swell_long_soundevent}
	Wait \{1
		Second}
	killsurgingscripts
endscript

script med_inside_intro 
	Wait \{1
		Seconds}
	SoundEvent \{event = $current_crowd_swell_med_soundevent}
	Wait \{1
		Seconds}
	SoundEvent \{event = $current_crowd_swell_long_soundevent}
	Wait \{1
		Seconds}
	killsurgingscripts
endscript

script ghtunes_ui_scroll_pan 
	if (<sfx_pan> > 0)
		0xcf43facc = (<sfx_pan> * 5 + 50)
		0x354cc7af = (100 - <0xcf43facc>)
	else
		0x354cc7af = (<sfx_pan> * -5 + 50)
		0xcf43facc = (100 - <0x354cc7af>)
	endif
	SoundEvent ghtunes_ui_scroll pitch = 4 voll_percent = (<0x354cc7af> -15) volr_percent = (<0xcf43facc> -15)
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
	begin
	<player_status> = ($0x2994109a [<i>])
	if (($<player_status>.band_member) = <objID>)
		part = ($<player_status>.part)
		skip = 1
		break
	endif
	i = (<i> + 1)
	repeat 4
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
	song = ($current_song)
	if (<song> = dlc1 || <song> = dlc2)
		part = guitar
	endif
	if ($game_mode = gh4_p1_career)
		if (<song> = stillborn || <song> = stranglehold)
			part = guitar
		endif
	endif
	part = <part>

	GetPakManCurrent \{map = zones}
	if NOT (<pak> = z_tool)
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

					endswitch
				endif
				case drummer_tom_hit
				SoundEvent \{event = drummer_tom_hit}
				case drummer_snare_hit
				SoundEvent \{event = drummer_snare_hit}
				default

			endswitch
		endif
	endif
endscript

script stopplay_win_lose_anim_sound 
endscript

script boss_battle_whoosh_sound 
	SoundEvent \{event = battle_boss_flyin}
	Wait \{0.03
		Seconds}
	SoundEvent \{event = battle_boss_whoosh2}
endscript

script crowd_sustain_boss_battle 
	if ($0x7bfc9a26 = 1)

		return
	else

	endif
	SpawnScriptNow \{0x516f97a5}
	SoundEvent \{event = $current_crowd_applause_soundevent}
endscript

script you_rock_sfx_end 
	Wait \{0.1
		Seconds}
	SoundEvent \{event = You_Rock_End_SFX}
endscript

script menu_guitar_lick_sfx 
	PlaySound ($0xf7bea20b)
	begin
	if NOT issoundplaying ($0xf7bea20b)
		break
	endif
	WaitOneGameFrame
	repeat
	ui_event_get_top
	if (<base_name> = 'boot_iis')
		menu_music_on
	endif
endscript

script clapping_logic 
	get_song_tempo_cfunc
	song = ($current_song)
	if (<song> = nothingelsematters)
		if NOT ((<beat> = 0) || (<beat> = 3))
			return
		endif
	endif
	if ($halftime_clapping = 1)
		if NOT ((<beat> = 0) || (<beat> = 2))
			return
		endif
	endif
	if (($player1_status.star_power_used = 1) || ($player2_status.star_power_used = 1) || ($player3_status.star_power_used = 1) || ($player4_status.star_power_used = 1))
		if ($clap_fade = 1)

			Change \{clap_fade = 0}
			SpawnScriptNow \{clap_fade_kill}
		endif
		if ($game_mode != tutorial)
			0x9c2773ec
		endif
	elseif ($clap_fade = 1)
		0x9c2773ec
	else
		if ($CrowdListenerStateClapOn1234 = 1)
			0x9c2773ec
		endif
	endif
endscript

script metallica_encore_crowd 
	SoundEvent \{event = $current_crowd_encore}
	Wait \{0.5
		Seconds}
	<i> = 0
	begin
	SoundEvent \{event = metallica_encore_oneshots}
	p = (RandomFloat (0.5, 0.7) * 2)
	Wait <p> Seconds
	i = (<p> + <i>)
	if (<i> > 9)
		break
	endif
	repeat
	play_a_short_crowd_swell_for_this_venue
	play_a_long_crowd_swell_for_this_venue
endscript

script play_pre_cutscene_sfx 
endscript

script save_confirmed_sfx 
	Wait \{0.1
		Seconds}
	SoundEvent \{0x0a25701e
		vol = -7}
endscript
0x7bfc9a26 = 0

script 0x516f97a5 
	Change \{0x7bfc9a26 = 1}
	Wait \{2.5
		Seconds}
	Change \{0x7bfc9a26 = 0}
endscript

script resetpracticesoundbusses 
	setsoundbussparams {leadvox_balance = {vol = (($default_BussSet.leadvox_balance.vol))} time = 1}
	setsoundbussparams {drums_balance = {vol = (($default_BussSet.drums_balance.vol))} time = 1}
	setsoundbussparams {leadgtr_balance = {vol = (($default_BussSet.leadgtr_balance.vol))} time = 1}
	setsoundbussparams {bass_balance = {vol = (($default_BussSet.bass_balance.vol))} time = 1}
	setsoundbussparams {rhythmgtr_balance = {vol = (($default_BussSet.rhythmgtr_balance.vol))} time = 1}
	setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol) - 100)} time = 1}
	setsoundbussparams {crowdsingalong_balance = {vol = (($default_BussSet.crowdsingalong_balance.vol) - 100)} time = 1}
	setsoundbussparams {band_Balance = {vol = (($default_BussSet.band_Balance.vol))} time = 1}
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

script outro_stars 

	0x8dbdaee4 'Outro_Stars: %i' i = <num_stars>
	switch <num_stars>
		case 5
		SoundEvent \{outro_five_stars}
		case 4
		SoundEvent \{outro_four_stars}
		case 3
		SoundEvent \{outro_three_stars}
		case 2
		SoundEvent \{outro_two_stars}
		case 1
		default
		SoundEvent \{outro_one_star}
	endswitch
endscript
