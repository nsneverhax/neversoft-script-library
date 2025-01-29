unlockable_accessories_text = qs(0x290326a6)
unlockable_bass_text = qs(0xda11c527)
unlockable_bass_h_text = qs(0xd92f56a4)
unlockable_bass_pieces2_text = qs(0x0b254642)
unlockable_character_text = qs(0x36cd37ad)
unlockable_cheats_text = qs(0x01141cc6)
unlockable_drumset_text = qs(0xff9d0283)
unlockable_drumsticks_text = qs(0x1745a4a5)
unlockable_extras_text = qs(0xcd2292f1)
unlockable_guitar_text = qs(0x75228ca3)
unlockable_guitar_h_text = qs(0xad57d918)
unlockable_guitar_pieces2_text = qs(0x20847c62)
unlockable_mic2_text = qs(0xb60c51cf)
unlockable_mic3_text = qs(0xb60c51cf)
unlockable_mic_pieces2_text = qs(0x8828c659)
unlockable_options_text = qs(0x98f68461)
unlockable_outfit_text = qs(0x47ce56b4)
unlockable_pack_text = qs(0x48d09a56)
unlockable_pants2_text = qs(0x982b950e)
unlockable_shoes2_text = qs(0x4faad679)
unlockable_top2_text = qs(0xd2b66773)
unlockable_venues_text = qs(0xbdf350a0)
venue_progression = [
	{
		venue_to_unlock = load_z_subway
		stars_required = 0
	}
	{
		venue_to_unlock = load_z_lhc
		stars_required = 16
	}
	{
		venue_to_unlock = load_z_freakshow
		stars_required = 36
	}
	{
		venue_to_unlock = load_z_neworleans
		stars_required = 60
	}
	{
		venue_to_unlock = load_z_dublin
		stars_required = 79
	}
	{
		venue_to_unlock = load_z_dragrace
		stars_required = 101
	}
	{
		venue_to_unlock = load_z_carhenge
		stars_required = 121
	}
	{
		venue_to_unlock = load_z_vegas
		stars_required = 140
	}
	{
		venue_to_unlock = load_z_nashville
		stars_required = 156
	}
	{
		venue_to_unlock = load_z_mexicocity
		stars_required = 173
	}
	{
		venue_to_unlock = load_z_cairo
		stars_required = 192
	}
	{
		venue_to_unlock = load_z_sanfrancisco
		stars_required = 212
	}
	{
		venue_to_unlock = load_z_norway
		stars_required = 233
	}
]
gig_progression = [
	{
		gig_to_unlock = c_allalongthewatchtower
		requires_venue_stars = 4
		current_venue = load_z_subway
	}
	{
		gig_to_unlock = c_alltheprettyfaces
		requires_venue_stars = 10
		current_venue = load_z_carhenge
	}
	{
		gig_to_unlock = c_americangirl
		unlocked_with_venue
		current_venue = load_z_sanfrancisco
	}
	{
		gig_to_unlock = c_apunk
		unlocked_with_venue
		current_venue = load_z_vegas
	}
	{
		gig_to_unlock = c_backround
		requires_venue_stars = 6
		current_venue = load_z_cairo
	}
	{
		gig_to_unlock = c_bleedamerican
		unlocked_with_venue
		current_venue = load_z_dragrace
	}
	{
		gig_to_unlock = c_blueday
		unlocked_with_venue
		current_venue = load_z_lhc
	}
	{
		gig_to_unlock = c_blueorchid
		requires_venue_stars = 7
		current_venue = load_z_lhc
	}
	{
		gig_to_unlock = c_brianstorm
		requires_venue_stars = 6
		current_venue = load_z_sanfrancisco
	}
	{
		gig_to_unlock = c_bringthenoise
		requires_venue_stars = 6
		current_venue = load_z_vegas
	}
	{
		gig_to_unlock = c_bulletsbutterfly
		unlocked_with_venue
		current_venue = load_z_nashville
	}
	{
		gig_to_unlock = c_cigarettesweddingbands
		unlocked_with_venue
		current_venue = load_z_freakshow
	}
	{
		gig_to_unlock = c_comedown
		unlocked_with_venue
		current_venue = load_z_neworleans
	}
	{
		gig_to_unlock = c_dancingwithmyself
		requires_venue_stars = 6
		current_venue = load_z_neworleans
	}
	{
		gig_to_unlock = c_deadbolt
		unlocked_with_venue
		current_venue = load_z_sanfrancisco
	}
	{
		gig_to_unlock = c_demon
		unlocked_with_venue
		current_venue = load_z_norway
	}
	{
		gig_to_unlock = c_disconnected
		unlocked_with_venue
		current_venue = load_z_nashville
	}
	{
		gig_to_unlock = c_donewitheverything
		unlocked_with_venue
		current_venue = load_z_norway
	}
	{
		gig_to_unlock = c_doyoufeellikewedo
		unlocked_with_venue
		current_venue = load_z_cube
	}
	{
		gig_to_unlock = c_duhast
		requires_venue_stars = 9
		current_venue = load_z_vegas
	}
	{
		gig_to_unlock = c_exgirlfriend
		unlocked_with_venue
		current_venue = load_z_freakshow
	}
	{
		gig_to_unlock = c_fame
		unlocked_with_venue
		current_venue = load_z_freakshow
	}
	{
		gig_to_unlock = c_feelgoodinc
		unlocked_with_venue
		current_venue = load_z_subway
	}
	{
		gig_to_unlock = c_gammaray
		unlocked_with_venue
		current_venue = load_z_subway
	}
	{
		gig_to_unlock = c_gratitude
		unlocked_with_venue
		current_venue = load_z_lhc
	}
	{
		gig_to_unlock = c_hungrylikethewolf
		requires_venue_stars = 6
		current_venue = load_z_dragrace
	}
	{
		gig_to_unlock = c_hurtssogood
		requires_venue_stars = 9
		current_venue = load_z_lhc
	}
	{
		gig_to_unlock = c_incinerate
		unlocked_with_venue
		current_venue = load_z_mexicocity
	}
	{
		gig_to_unlock = c_inmyplace
		unlocked_with_venue
		current_venue = load_z_subway
	}
	{
		gig_to_unlock = c_inthemeantime
		unlocked_with_venue
		current_venue = load_z_dublin
	}
	{
		gig_to_unlock = c_jailbreak
		unlocked_with_venue
		current_venue = load_z_dragrace
	}
	{
		gig_to_unlock = c_judith
		unlocked_with_venue
		current_venue = load_z_sanfrancisco
	}
	{
		gig_to_unlock = c_kryptonite
		unlocked_with_venue
		current_venue = load_z_neworleans
	}
	{
		gig_to_unlock = c_la
		unlocked_with_venue
		current_venue = load_z_dublin
	}
	{
		gig_to_unlock = c_lithium
		requires_completed_gig = c_smellsliketeenspirit
		current_venue = load_z_carhenge
	}
	{
		gig_to_unlock = c_lonelyisthenight
		unlocked_with_venue
		current_venue = load_z_carhenge
	}
	{
		gig_to_unlock = c_looksthatkill
		requires_venue_stars = 9
		current_venue = load_z_dragrace
	}
	{
		gig_to_unlock = c_lovetoken
		unlocked_with_venue
		current_venue = load_z_neworleans
	}
	{
		gig_to_unlock = c_lustforlife
		unlocked_with_venue
		current_venue = load_z_norway
	}
	{
		gig_to_unlock = c_maidenmothercrone
		unlocked_with_venue
		current_venue = load_z_mexicocity
	}
	{
		gig_to_unlock = c_makeitwitchu
		unlocked_with_venue
		current_venue = load_z_dublin
	}
	{
		gig_to_unlock = c_medicate
		requires_venue_stars = 9
		current_venue = load_z_cairo
	}
	{
		gig_to_unlock = c_mirrorpeople
		unlocked_with_venue
		current_venue = load_z_neworleans
	}
	{
		gig_to_unlock = c_nearlylostyou
		unlocked_with_venue
		current_venue = load_z_carhenge
	}
	{
		gig_to_unlock = c_nevermissabeat
		unlocked_with_venue
		current_venue = load_z_neworleans
	}
	{
		gig_to_unlock = c_noonetodependon
		requires_venue_stars = 6
		current_venue = load_z_mexicocity
	}
	{
		gig_to_unlock = c_onebigholiday
		unlocked_with_venue
		current_venue = load_z_nashville
	}
	{
		gig_to_unlock = c_onlyhappywhenitrains
		requires_venue_stars = 4
		current_venue = load_z_lhc
	}
	{
		gig_to_unlock = c_playthatfunkymusic
		unlocked_with_venue
		current_venue = load_z_freakshow
	}
	{
		gig_to_unlock = c_pluginbaby
		requires_venue_stars = 6
		current_venue = load_z_dublin
	}
	{
		gig_to_unlock = c_ringoffire
		unlocked_with_venue
		current_venue = load_z_nashville
	}
	{
		gig_to_unlock = c_rockshow
		unlocked_with_venue
		current_venue = load_z_dragrace
	}
	{
		gig_to_unlock = c_runnindownadream
		requires_venue_stars = 9
		current_venue = load_z_mexicocity
	}
	{
		gig_to_unlock = c_saturdaynightsalright
		unlocked_with_venue
		current_venue = load_z_cairo
	}
	{
		gig_to_unlock = c_scatterbrain
		unlocked_with_venue
		current_venue = load_z_norway
	}
	{
		gig_to_unlock = c_seven
		unlocked_with_venue
		current_venue = load_z_vegas
	}
	{
		gig_to_unlock = c_sexonfire
		requires_venue_stars = 9
		current_venue = load_z_freakshow
	}
	{
		gig_to_unlock = c_shoutitoutloud
		requires_venue_stars = 9
		current_venue = load_z_neworleans
	}
	{
		gig_to_unlock = c_sixdaysaweek
		unlocked_with_venue
		current_venue = load_z_sanfrancisco
	}
	{
		gig_to_unlock = c_smellsliketeenspirit
		requires_venue_stars = 6
		current_venue = load_z_carhenge
	}
	{
		gig_to_unlock = c_sneakout
		unlocked_with_venue
		current_venue = load_z_cairo
	}
	{
		gig_to_unlock = c_solonely
		unlocked_with_venue
		current_venue = load_z_mexicocity
	}
	{
		gig_to_unlock = c_song2
		unlocked_with_venue
		current_venue = load_z_subway
	}
	{
		gig_to_unlock = c_sowingseason
		unlocked_with_venue
		current_venue = load_z_lhc
	}
	{
		gig_to_unlock = c_special_gorfinal
		unlocked_with_venue
		current_venue = load_z_cube
	}
	{
		gig_to_unlock = c_spiritofradio
		requires_venue_stars = 15
		current_venue = load_z_norway
	}
	{
		gig_to_unlock = c_sponsor_ahead
		requires_venue_stars = 12
		current_venue = load_z_cairo
	}
	{
		gig_to_unlock = c_sponsor_audiotechnica
		requires_venue_stars = 11
		current_venue = load_z_lhc
	}
	{
		gig_to_unlock = c_sponsor_bcrich
		requires_venue_stars = 13
		current_venue = load_z_lhc
	}
	{
		gig_to_unlock = c_sponsor_daisyrock
		requires_venue_stars = 12
		current_venue = load_z_dragrace
	}
	{
		gig_to_unlock = c_sponsor_emg
		requires_venue_stars = 15
		current_venue = load_z_freakshow
	}
	{
		gig_to_unlock = c_sponsor_ernieball
		requires_venue_stars = 12
		current_venue = load_z_mexicocity
	}
	{
		gig_to_unlock = c_sponsor_esp
		requires_venue_stars = 9
		current_venue = load_z_subway
	}
	{
		gig_to_unlock = c_sponsor_ibanez
		requires_venue_stars = 12
		current_venue = load_z_vegas
	}
	{
		gig_to_unlock = c_sponsor_mcswain
		requires_venue_stars = 12
		current_venue = load_z_sanfrancisco
	}
	{
		gig_to_unlock = c_sponsor_porkpie
		requires_venue_stars = 15
		current_venue = load_z_dragrace
	}
	{
		gig_to_unlock = c_sponsor_prs
		requires_venue_stars = 15
		current_venue = load_z_dublin
	}
	{
		gig_to_unlock = c_sponsor_schecter
		requires_venue_stars = 12
		current_venue = load_z_neworleans
	}
	{
		gig_to_unlock = c_sponsor_seymourduncan
		requires_venue_stars = 12
		current_venue = load_z_nashville
	}
	{
		gig_to_unlock = c_sponsor_tama
		requires_venue_stars = 13
		current_venue = load_z_carhenge
	}
	{
		gig_to_unlock = c_sponsor_zildjian
		requires_venue_stars = 15
		current_venue = load_z_freakshow
	}
	{
		gig_to_unlock = c_steadyasshegoes
		unlocked_with_venue
		current_venue = load_z_lhc
	}
	{
		gig_to_unlock = c_streamlinewoman
		unlocked_with_venue
		current_venue = load_z_cairo
	}
	{
		gig_to_unlock = c_sultansofswing
		requires_venue_stars = 12
		current_venue = load_z_dublin
	}
	{
		gig_to_unlock = c_superstition
		requires_venue_stars = 9
		current_venue = load_z_dublin
	}
	{
		gig_to_unlock = c_sweatingbullets
		unlocked_with_venue
		current_venue = load_z_norway
	}
	{
		gig_to_unlock = c_sympathyforthedevil
		requires_venue_stars = 7
		current_venue = load_z_subway
	}
	{
		gig_to_unlock = c_theysay
		unlocked_with_venue
		current_venue = load_z_subway
	}
	{
		gig_to_unlock = c_twentiethcenturyboy
		unlocked_with_venue
		current_venue = load_z_vegas
	}
	{
		gig_to_unlock = c_twentyfirstcentury
		unlocked_with_venue
		current_venue = load_z_cube
	}
	{
		gig_to_unlock = c_twominutestomidnight
		requires_venue_stars = 9
		current_venue = load_z_sanfrancisco
	}
	{
		gig_to_unlock = c_underpressure
		requires_venue_stars = 6
		current_venue = load_z_freakshow
	}
	{
		gig_to_unlock = c_wannabeinla
		unlocked_with_venue
		current_venue = load_z_carhenge
	}
	{
		gig_to_unlock = c_wereanamericanband
		requires_venue_stars = 9
		current_venue = load_z_nashville
	}
	{
		gig_to_unlock = c_whatigot
		unlocked_with_venue
		current_venue = load_z_vegas
	}
	{
		gig_to_unlock = c_whybother
		unlocked_with_venue
		current_venue = load_z_dragrace
	}
	{
		gig_to_unlock = c_wolflikeme
		unlocked_with_venue
		current_venue = load_z_mexicocity
	}
	{
		gig_to_unlock = c_womanfromtokyo
		unlocked_with_venue
		current_venue = load_z_freakshow
	}
	{
		gig_to_unlock = c_youandme
		unlocked_with_venue
		current_venue = load_z_dublin
	}
	{
		gig_to_unlock = c_yougivelove
		unlocked_with_venue
		current_venue = load_z_dublin
	}
	{
		gig_to_unlock = c_younkfunk
		unlocked_with_venue
		current_venue = load_z_cairo
	}
]
progression_gig_list = [
	{
		venue = load_z_subway
		gig_list = gig_list_subway
	}
	{
		venue = load_z_lhc
		gig_list = gig_list_lhc
	}
	{
		venue = load_z_freakshow
		gig_list = gig_list_freakshow
	}
	{
		venue = load_z_neworleans
		gig_list = gig_list_neworleans
	}
	{
		venue = load_z_dublin
		gig_list = gig_list_dublin
	}
	{
		venue = load_z_dragrace
		gig_list = gig_list_dragrace
	}
	{
		venue = load_z_carhenge
		gig_list = gig_list_carhenge
	}
	{
		venue = load_z_vegas
		gig_list = gig_list_vegas
	}
	{
		venue = load_z_nashville
		gig_list = gig_list_nashville
	}
	{
		venue = load_z_mexicocity
		gig_list = gig_list_mexicocity
	}
	{
		venue = load_z_cairo
		gig_list = gig_list_cairo
	}
	{
		venue = load_z_sanfrancisco
		gig_list = gig_list_sanfrancisco
	}
	{
		venue = load_z_norway
		gig_list = gig_list_norway
	}
	{
		venue = load_z_cube
		gig_list = gig_list_cube
	}
]
reward_progression = [
	{
		requires_completed_gig = c_allalongthewatchtower
		requires_completed_difficulty = gold
		frontend_desc = qs(0x2f4c9f9c)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = lars_outfit_2
			}
			{
				part = cas_male_base_torso
				desc_id = lars_2_full
			}
			{
				part = cas_male_torso
				desc_id = m_bmtl_torso_lars_2
			}
			{
				part = cas_male_legs
				desc_id = m_bmtl_legs_lars_2
			}
			{
				part = cas_male_shoes
				desc_id = m_bmtl_shoe_lars_2
			}
			{
				part = cas_male_shoes_cutoff
				desc_id = m_bmtl_shoe_lars_2_cutoff
			}
		]
	}
	{
		requires_completed_gig = c_alltheprettyfaces
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x652eeb06)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic_stand
				desc_id = mic_stand_vortex
			}
		]
	}
	{
		requires_completed_gig = c_americangirl
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x8164d2d6)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_rock_hat_cyclops
			}
		]
	}
	{
		requires_completed_gig = c_apunk
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xf68058a5)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 4
	}
	{
		requires_completed_gig = c_backround
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x627a20d5)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = pandora_outfit_4
			}
			{
				part = cas_female_base_torso
				desc_id = pandora_4_full
			}
			{
				part = cas_female_torso
				desc_id = f_goth_torso_pndrtrench
			}
			{
				part = cas_female_shoes
				desc_id = f_goth_shoe_pndrspike
			}
		]
	}
	{
		requires_completed_gig = c_bleedamerican
		requires_completed_difficulty = gold
		frontend_desc = qs(0xe4628005)
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		reward_type = cheat
		cheat_name = Cheat_PerformanceMode
	}
	{
		requires_completed_gig = c_blueday
		requires_completed_difficulty = gold
		frontend_desc = qs(0x1a88fd5d)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_funpart_hat_clown
			}
		]
	}
	{
		requires_completed_gig = c_blueorchid
		requires_completed_difficulty = gold
		frontend_desc = qs(0xded8fa1f)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = clive_outfit_2
			}
			{
				part = cas_male_base_torso
				desc_id = clive_2_full
			}
			{
				part = cas_male_torso
				desc_id = m_clsc_torso_clive2
			}
			{
				part = cas_male_legs
				desc_id = m_clsc_legs_clive2
			}
			{
				part = cas_male_shoes
				desc_id = m_clsc_shoes_clive2
			}
			{
				part = cas_male_acc_left
				desc_id = m_clsc_acc_l3rings
			}
			{
				part = cas_male_acc_right
				desc_id = m_clsc_acc_r3rings
			}
		]
	}
	{
		requires_completed_gig = c_brianstorm
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xe9df2a18)
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_extras
		reward_type = cheat
		cheat_name = cheat_focusmode
	}
	{
		requires_completed_gig = c_bringthenoise
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x83fa3e83)
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_extras
		reward_type = cheat
		cheat_name = cheat_hudfreemode
	}
	{
		requires_completed_gig = c_bulletsbutterfly
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xfeac6847)
		vague_frontend_desc = unlockable_bass_h_text
		unlock_icon = unlockable_bass_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_bass_body
				desc_id = bass102_axe
			}
		]
	}
	{
		requires_completed_gig = c_cigarettesweddingbands
		requires_completed_difficulty = gold
		frontend_desc = qs(0xce45cb83)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_metl_horn
			}
			{
				part = cas_female_hat
				desc_id = f_pop_acc_catears
			}
		]
	}
	{
		requires_completed_gig = c_comedown
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xa32b3537)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic
				desc_id = mic_futuro
			}
		]
	}
	{
		requires_completed_gig = c_dancingwithmyself
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x82770ec9)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_fun_hat_hannya
			}
		]
	}
	{
		requires_completed_gig = c_deadbolt
		requires_completed_difficulty = gold
		frontend_desc = qs(0xccbe8ae7)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_acc_left
				desc_id = m_rock_acc_lcast
			}
		]
	}
	{
		requires_completed_gig = c_demon
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xe6eca0a0)
		vague_frontend_desc = unlockable_bass_h_text
		unlock_icon = unlockable_bass_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_bass_body
				desc_id = bass104_skull
			}
		]
	}
	{
		requires_completed_gig = c_disconnected
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x250a0bee)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 25
	}
	{
		requires_completed_gig = c_donewitheverything
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xb9f05fd1)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_bmtl_hat_skullhelmet
			}
			{
				part = cas_female_hat
				desc_id = f_bmtl_hat_skullhelmet
			}
		]
	}
	{
		requires_completed_gig = c_doyoufeellikewedo
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xc5cde89d)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = guitar_skull_01
			}
		]
	}
	{
		requires_completed_gig = c_duhast
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xa91d296f)
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		reward_type = cheat
		cheat_name = cheat_alwaysslide
	}
	{
		requires_completed_gig = c_exgirlfriend
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xc1696ea2)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_female_acc_face
				desc_id = f_rock_glasses_fly
			}
			{
				part = cas_male_acc_face
				desc_id = m_rock_glasses_fly
			}
		]
	}
	{
		requires_completed_gig = c_fame
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x3173457d)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = johnny_outfit_2
			}
			{
				part = cas_male_base_torso
				desc_id = johnny_2_full
			}
			{
				part = cas_male_torso
				desc_id = m_punk_torso_jny_2
			}
			{
				part = cas_male_legs
				desc_id = m_punk_legs_jny_2
			}
			{
				part = cas_male_hair
				desc_id = m_punk_hair_jny_2
			}
			{
				part = cas_male_acc_right
				desc_id = m_punk_accr_jny_2
			}
		]
	}
	{
		requires_completed_gig = c_feelgoodinc
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xfece0d3b)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = izzy_outfit_2
			}
			{
				part = cas_male_base_torso
				desc_id = izzy_2_full
			}
			{
				part = cas_male_torso
				desc_id = m_glam_torso_mink
			}
			{
				part = cas_male_legs
				desc_id = m_glam_legs_rose
			}
			{
				part = cas_male_shoes
				desc_id = m_glam_shoes_mart
			}
		]
	}
	{
		requires_completed_gig = c_gammaray
		requires_completed_difficulty = gold
		frontend_desc = qs(0xc3e5abae)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = eddie_outfit_2
			}
			{
				part = cas_male_base_torso
				desc_id = eddie_2_full
			}
			{
				part = cas_male_legs
				desc_id = m_rock_legs_eddie2
			}
			{
				part = cas_male_shoes
				desc_id = m_rock_shoe_eddie2
			}
			{
				part = cas_male_acc_left
				desc_id = m_rock_acc_leddie2
			}
		]
	}
	{
		requires_completed_gig = c_gratitude
		requires_completed_difficulty = gold
		frontend_desc = qs(0x46286dc9)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = judy_outfit_1
			}
			{
				part = cas_female_base_torso
				desc_id = judy_1_full
			}
			{
				part = cas_female_torso
				desc_id = f_punk_torso_judynails1
			}
			{
				part = cas_female_legs
				desc_id = f_punk_legs_judynails1
			}
		]
	}
	{
		requires_completed_gig = c_hungrylikethewolf
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xff899bb7)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic
				desc_id = mic_dagger
			}
		]
	}
	{
		requires_completed_gig = c_hurtssogood
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x271a2e03)
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		reward_type = cheat
		cheat_name = cheat_allhopos
	}
	{
		requires_completed_gig = c_incinerate
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xdbfe1db5)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hair
				desc_id = m_funpart_hair_slime
			}
			{
				part = cas_male_hat_hair
				desc_id = m_funpart_hathair_slime
			}
			{
				part = cas_female_hair
				desc_id = f_funpart_hair_slime
			}
			{
				part = cas_female_hat_hair
				desc_id = f_funpart_hathair_slime
			}
		]
	}
	{
		requires_completed_gig = c_inmyplace
		requires_completed_difficulty = gold
		frontend_desc = qs(0x31648098)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = casey_outfit_1
			}
			{
				part = cas_female_base_torso
				desc_id = casey_1_full
			}
			{
				part = cas_female_torso
				desc_id = f_rock_torso_eccorset
			}
			{
				part = cas_female_legs
				desc_id = f_rock_legs_ecchaps
			}
			{
				part = cas_female_shoes
				desc_id = f_rock_shoe_ecbboot
			}
		]
	}
	{
		requires_completed_gig = c_inthemeantime
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xae13af90)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = lars_outfit_3
			}
			{
				part = cas_male_base_torso
				desc_id = lars_3_full
			}
			{
				part = cas_male_torso
				desc_id = m_bmtl_torso_lars_3
			}
			{
				part = cas_male_legs
				desc_id = m_bmtl_legs_lars_3
			}
			{
				part = cas_male_shoes
				desc_id = m_bmtl_shoe_lars_3
			}
			{
				part = cas_male_acc_left
				desc_id = m_bmtl_acc_llars_3
			}
		]
	}
	{
		requires_completed_gig = c_jailbreak
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xc0109cea)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = izzy_outfit_3
			}
			{
				part = cas_male_base_torso
				desc_id = izzy_3_full
			}
			{
				part = cas_male_torso
				desc_id = m_glam_torso_ljacket
			}
			{
				part = cas_male_legs
				desc_id = m_glam_legs_doublebelt
			}
			{
				part = cas_male_shoes
				desc_id = m_glam_shoe_cowboy
			}
			{
				part = cas_male_shoes_cutoff
				desc_id = m_glam_shoe_cowboy_cutoff
			}
		]
	}
	{
		requires_completed_gig = c_judith
		requires_completed_difficulty = gold
		frontend_desc = qs(0x52454c38)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = johnny_outfit_4
			}
			{
				part = cas_male_base_torso
				desc_id = johnny_4_full
			}
			{
				part = cas_male_torso
				desc_id = m_punk_torso_jstripe
			}
			{
				part = cas_male_legs
				desc_id = m_punk_legs_jzip
			}
			{
				part = cas_male_shoes
				desc_id = m_punk_shoe_jzipconv
			}
			{
				part = cas_male_acc_left
				desc_id = m_punk_acc_ljstudband
			}
		]
	}
	{
		requires_completed_gig = c_kryptonite
		requires_completed_difficulty = gold
		frontend_desc = qs(0x76e32e98)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_bmtl_hat_brain
			}
		]
	}
	{
		requires_completed_gig = c_la
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x485695e2)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = pandora_outfit_3
			}
			{
				part = cas_female_base_torso
				desc_id = pandora_3_full
			}
			{
				part = cas_female_torso
				desc_id = f_goth_torso_pndrstraps
			}
			{
				part = cas_female_shoes
				desc_id = f_goth_shoe_pndrplats
			}
			{
				part = cas_female_shoes_cutoff
				desc_id = f_goth_shoe_pndrplats_cutoff
			}
			{
				part = cas_female_legs
				desc_id = f_goth_legs_pndrrose
			}
			{
				part = cas_female_acc_left
				desc_id = f_goth_acc_lpndrbuckles
			}
			{
				part = cas_female_acc_right
				desc_id = f_goth_acc_rpndrbuckles
			}
		]
	}
	{
		requires_completed_gig = c_lithium
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xa33ede92)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_acc_face
				desc_id = m_rock_glasses_monocle
			}
		]
	}
	{
		requires_completed_gig = c_lonelyisthenight
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xd4c1dc99)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = guitar_body20
			}
		]
	}
	{
		requires_completed_gig = c_looksthatkill
		requires_completed_difficulty = gold
		frontend_desc = qs(0x46899a9b)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = johnny_outfit_3
			}
			{
				part = cas_male_base_torso
				desc_id = johnny_3_full
			}
			{
				part = cas_male_legs
				desc_id = m_punk_legs_jny_3
			}
			{
				part = cas_male_acc_left
				desc_id = m_punk_accl_jny_3
			}
		]
	}
	{
		requires_completed_gig = c_lovetoken
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x35cfd256)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = axel_outfit_3
			}
			{
				part = cas_male_base_torso
				desc_id = axel_3_full
			}
			{
				part = cas_male_torso
				desc_id = m_mtl_torso_axel3
			}
			{
				part = cas_male_acc_left
				desc_id = m_mtl_accl_axel3
			}
			{
				part = cas_male_legs
				desc_id = m_mtl_legs_axel3
			}
			{
				part = cas_male_shoes
				desc_id = m_mtl_shoes_axel3
			}
			{
				part = cas_male_shoes_cutoff
				desc_id = m_mtl_shoes_axel3_cutoff
			}
		]
	}
	{
		requires_completed_gig = c_lustforlife
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x40b86135)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 27
	}
	{
		requires_completed_gig = c_lustforlife
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x40b86135)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic
				desc_id = mic_dark
			}
		]
	}
	{
		requires_completed_gig = c_maidenmothercrone
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xd09a20db)
		vague_frontend_desc = unlockable_bass_h_text
		unlock_icon = unlockable_bass_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_bass_body
				desc_id = bass103_cross
			}
		]
	}
	{
		requires_completed_gig = c_makeitwitchu
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xb3b8c989)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = eddie_outfit_4
			}
			{
				part = cas_male_base_torso
				desc_id = eddie_4_full
			}
			{
				part = cas_male_torso
				desc_id = m_rock_torso_leather
			}
			{
				part = cas_male_legs
				desc_id = m_rock_legs_rolledup
			}
		]
	}
	{
		requires_completed_gig = c_medicate
		requires_completed_difficulty = gold
		frontend_desc = qs(0x8c3df94f)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = axel_outfit_4
			}
			{
				part = cas_male_base_torso
				desc_id = axel_4_full
			}
			{
				part = cas_male_torso
				desc_id = m_metl_torso_axel4
			}
			{
				part = cas_male_acc_left
				desc_id = m_mtl_accl_axel4
			}
			{
				part = cas_male_acc_right
				desc_id = m_mtl_accr_axel4
			}
			{
				part = cas_male_legs
				desc_id = m_mtl_legs_axel4
			}
			{
				part = cas_male_shoes
				desc_id = m_mtl_shoes_axel4
			}
		]
	}
	{
		requires_completed_gig = c_mirrorpeople
		requires_completed_difficulty = gold
		frontend_desc = qs(0xd18267e9)
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		reward_type = cheat
		cheat_name = cheat_autokick
	}
	{
		requires_completed_gig = c_nearlylostyou
		requires_completed_difficulty = gold
		frontend_desc = qs(0x8db59eb9)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_fun_hat_ww2helmet
			}
		]
	}
	{
		requires_completed_gig = c_nevermissabeat
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xd7d6cd09)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_torso
				desc_id = m_goth_torso_devilwings
			}
		]
	}
	{
		requires_completed_gig = c_noonetodependon
		requires_completed_difficulty = None
		frontend_desc = qs(0x36aa3be1)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 1
	}
	{
		requires_completed_gig = c_noonetodependon
		requires_completed_difficulty = None
		frontend_desc = qs(0x36aa3be1)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_torso
				desc_id = m_clsc_torso_santana_d1
			}
			{
				part = cas_guitar_body
				desc_id = gtr80_prs_sant
			}
		]
	}
	{
		requires_completed_gig = c_onebigholiday
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x1144ea88)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = guitar_spider_01
			}
		]
	}
	{
		requires_completed_gig = c_onlyhappywhenitrains
		requires_completed_difficulty = None
		frontend_desc = qs(0xa1ae9fd1)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 8
	}
	{
		requires_completed_gig = c_onlyhappywhenitrains
		requires_completed_difficulty = None
		frontend_desc = qs(0xa1ae9fd1)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic
				desc_id = mic_shirley
			}
			{
				part = cas_mic_stand
				desc_id = mic_stand_shirley
			}
		]
	}
	{
		requires_completed_gig = c_playthatfunkymusic
		requires_completed_difficulty = gold
		frontend_desc = qs(0x7120e6a4)
		vague_frontend_desc = unlockable_venues_text
		unlock_icon = unlockable_venues
		reward_type = venue_reward
		venue_checksum = load_z_visualizer
	}
	{
		requires_completed_gig = c_pluginbaby
		requires_completed_difficulty = None
		frontend_desc = qs(0xd16fe3f7)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 3
	}
	{
		requires_completed_gig = c_pluginbaby
		requires_completed_difficulty = None
		frontend_desc = qs(0xd16fe3f7)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr25_manson_bellamy
			}
		]
	}
	{
		requires_completed_gig = c_ringoffire
		requires_completed_difficulty = None
		frontend_desc = qs(0x50ea616f)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 0
	}
	{
		requires_completed_gig = c_ringoffire
		requires_completed_difficulty = None
		frontend_desc = qs(0x50ea616f)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr26_cash_acoustic
			}
			{
				part = cas_guitar_body
				desc_id = gtr27_nsft_acoustic
			}
			{
				part = cas_mic
				desc_id = mic_cash
			}
		]
	}
	{
		requires_completed_gig = c_rockshow
		requires_completed_difficulty = gold
		frontend_desc = qs(0x9d5441b1)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_acc_face
				desc_id = m_rock_glasses_nerd
			}
		]
	}
	{
		requires_completed_gig = c_runnindownadream
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x35615c8d)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = judy_outfit_2
			}
			{
				part = cas_female_base_torso
				desc_id = judy_2_full
			}
			{
				part = cas_female_torso
				desc_id = f_punk_torso_judynails2
			}
			{
				part = cas_female_legs
				desc_id = f_punk_legs_judynails2
			}
		]
	}
	{
		requires_completed_gig = c_saturdaynightsalright
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x2684245b)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_female_hat
				desc_id = f_metl_acc_horn
			}
			{
				part = cas_male_hat
				desc_id = m_hat_pimp
			}
		]
	}
	{
		requires_completed_gig = c_scatterbrain
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x90c112e3)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = izzy_outfit_4
			}
			{
				part = cas_male_base_torso
				desc_id = izzy_4_full
			}
			{
				part = cas_male_torso
				desc_id = m_glam_torso_jester
			}
			{
				part = cas_male_legs
				desc_id = m_glam_legs_jester
			}
			{
				part = cas_male_shoes
				desc_id = m_glam_shoes_jester
			}
			{
				part = cas_male_shoes_cutoff
				desc_id = m_glam_shoes_jester_cutoff
			}
		]
	}
	{
		requires_completed_gig = c_seven
		requires_completed_difficulty = gold
		frontend_desc = qs(0xc03cbe45)
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_cheats
		reward_type = cheat
		cheat_name = cheat_invisiblecharacters
	}
	{
		requires_completed_gig = c_sexonfire
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x6daaa370)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic_stand
				desc_id = mic_stand_hooks
			}
			{
				part = cas_mic_stand
				desc_id = mic_stand_crutch
			}
		]
	}
	{
		requires_completed_gig = c_shoutitoutloud
		requires_completed_difficulty = gold
		frontend_desc = qs(0x10768421)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = clive_outfit_3
			}
			{
				part = cas_male_base_torso
				desc_id = clive_3_full
			}
			{
				part = cas_male_torso
				desc_id = m_clsc_torso_clive3
			}
			{
				part = cas_male_legs
				desc_id = m_clsc_legs_clive3
			}
			{
				part = cas_male_shoes
				desc_id = m_clsc_shoe_clive3
			}
			{
				part = cas_male_hat
				desc_id = m_clsc_hat_clive3
			}
		]
	}
	{
		requires_completed_gig = c_sixdaysaweek
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x976ccded)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = eddie_outfit_3
			}
			{
				part = cas_male_base_torso
				desc_id = eddie_3_full
			}
			{
				part = cas_male_torso
				desc_id = m_rock_torso_spadesuit
			}
			{
				part = cas_male_legs
				desc_id = m_rock_legs_spadesuit
			}
			{
				part = cas_male_shoes
				desc_id = m_rock_shoe_strapboots
			}
		]
	}
	{
		requires_completed_gig = c_smellsliketeenspirit
		requires_completed_difficulty = None
		frontend_desc = qs(0xc7a84591)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 6
	}
	{
		requires_completed_gig = c_smellsliketeenspirit
		requires_completed_difficulty = None
		frontend_desc = qs(0xc7a84591)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr78_kurt
			}
			{
				part = cas_guitar_pickups
				desc_id = gtr78_pickup1
			}
		]
	}
	{
		requires_completed_gig = c_sneakout
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3a86960c)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = clive_outfit_4
			}
			{
				part = cas_male_base_torso
				desc_id = clive_4_full
			}
			{
				part = cas_male_legs
				desc_id = m_clsc_legs_clive4
			}
			{
				part = cas_male_shoes
				desc_id = m_clsc_shoe_clive4
			}
			{
				part = cas_male_shoes_cutoff
				desc_id = m_clsc_shoe_clive4_cutoff
			}
		]
	}
	{
		requires_completed_gig = c_solonely
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x79744504)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = casey_outfit_3
			}
			{
				part = cas_female_base_torso
				desc_id = casey_3_full
			}
			{
				part = cas_female_acc_left
				desc_id = f_rock_acc_lcloth
			}
		]
	}
	{
		requires_completed_gig = c_song2
		requires_completed_difficulty = gold
		frontend_desc = qs(0xde165b67)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_fun_hat_eyeball
			}
			{
				part = cas_female_hat
				desc_id = f_fun_hat_eyeball
			}
		]
	}
	{
		requires_completed_gig = c_sowingseason
		requires_completed_difficulty = gold
		frontend_desc = qs(0x18bef097)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_pop_head_gasmask
			}
		]
	}
	{
		requires_completed_gig = c_sowingseason
		requires_completed_difficulty = gold
		frontend_desc = qs(0x18bef097)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_pop_head_gasmask
			}
			{
				part = cas_female_hat
				desc_id = f_pop_head_gasmask
			}
		]
	}
	{
		requires_completed_gig = c_special_gorfinal
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xe3ae54d7)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 26
	}
	{
		requires_completed_gig = c_special_gorfinal
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xe3ae54d7)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr10_mcswain_flame
			}
			{
				part = cas_bass_body
				desc_id = bass16_esp_surveyor_02
			}
			{
				part = cas_drums_sticks
				desc_id = cad_drumsticks_ahead
			}
			{
				part = cas_mic
				desc_id = mic_frequency
			}
		]
	}
	{
		requires_completed_gig = c_special_gorfinal
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xe3ae54d7)
		unlock_icon = unlockable_drumset
		reward_type = cas_texture
		texture = `tex/models/characters/layers/cadrm/gh5_shell_ld18`
	}
	{
		requires_completed_gig = c_special_gorfinal
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xe3ae54d7)
		unlock_icon = unlockable_drumset
		reward_type = cas_texture
		texture = `tex/models/characters/layers/cadrm/gh5_skin_ld59`
	}
	{
		requires_completed_gig = c_spiritofradio
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xfecca361)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_hat_gorilla
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_ahead
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x1c181ad7)
		unlock_icon = unlockable_drumsticks
		reward_type = cas
		car_pieces = [
			{
				part = cas_drums_sticks
				desc_id = cad_drumsticks_ahead_5ab
			}
			{
				part = cas_drums_sticks
				desc_id = cad_drumsticks_ahead_5a
			}
			{
				part = cas_drums_sticks
				desc_id = cad_drumsticks_ahead_5b
			}
			{
				part = cas_drums_sticks
				desc_id = cad_drumsticks_ahead_rock
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_audiotechnica
		requires_completed_difficulty = gold
		frontend_desc = qs(0xc5482074)
		unlock_icon = unlockable_mic2
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic
				desc_id = mic_standard1
			}
			{
				part = cas_mic
				desc_id = mic_standard2
			}
			{
				part = cas_mic
				desc_id = mic_standard3
			}
			{
				part = cas_mic
				desc_id = mic_standard4
			}
			{
				part = cas_mic
				desc_id = mic_standard5
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_bcrich
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xee465e0b)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr20_bc_rich_beast
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_daisyrock
		requires_completed_difficulty = gold
		frontend_desc = qs(0xd051f361)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr92_dr_star
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_emg
		requires_completed_difficulty = gold
		frontend_desc = qs(0x01129373)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_pickups
				desc_id = gtr_emg_pickup1
			}
			{
				part = cas_guitar_pickups
				desc_id = gtr_emg_pickup2
			}
			{
				part = cas_guitar_pickups
				desc_id = gtr_emg_pickup3
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_ernieball
		requires_completed_difficulty = gold
		frontend_desc = qs(0xf7858073)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_bass_body
				desc_id = bass_mm_stingray
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_esp
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x1394af33)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr_31_viper
			}
			{
				part = cas_guitar_body
				desc_id = gtr36_superv
			}
			{
				part = cas_guitar_body
				desc_id = gtr64_esp_f
			}
			{
				part = cas_guitar_body
				desc_id = gtr66_esp_shini
			}
			{
				part = cas_bass_body
				desc_id = bass64_f405
			}
			{
				part = cas_bass_head
				desc_id = bass64_neckhead_04
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_ibanez
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x9a551aea)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr75_ibz_xpt
			}
			{
				part = cas_bass_body
				desc_id = ibanez_icb_body
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_mcswain
		requires_completed_difficulty = gold
		frontend_desc = qs(0x97f44731)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr13_mcswain_machine
			}
			{
				part = cas_guitar_body
				desc_id = gtr14_mcswain_life
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_porkpie
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3e44759b)
		unlock_icon = unlockable_drumset
		reward_type = cas_texture
		texture = `tex/models/characters/layers/cadrm/drumshell_ds_pork2`
	}
	{
		requires_completed_gig = c_sponsor_porkpie
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3e44759b)
		unlock_icon = unlockable_drumset
		reward_type = cas_texture
		texture = `tex/models/characters/layers/cadrm/drumshell_ds_pork3`
	}
	{
		requires_completed_gig = c_sponsor_porkpie
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3e44759b)
		unlock_icon = unlockable_drumset
		reward_type = cas_texture
		texture = `tex/models/characters/layers/cadrm/drumshell_ds_pork7`
	}
	{
		requires_completed_gig = c_sponsor_prs
		requires_completed_difficulty = gold
		frontend_desc = qs(0xb0233a75)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr83_prs_stla
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_schecter
		requires_completed_difficulty = gold
		frontend_desc = qs(0x672716f3)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = gtr72_sch_devil
			}
			{
				part = cas_bass_body
				desc_id = bas_sch_stil
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_seymourduncan
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x8ec62d02)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_pickups
				desc_id = duncaninvade
			}
			{
				part = cas_guitar_pickups
				desc_id = duncandime59
			}
		]
	}
	{
		requires_completed_gig = c_sponsor_tama
		requires_completed_difficulty = gold
		frontend_desc = qs(0x2de5f5e1)
		unlock_icon = unlockable_drumset
		reward_type = cas_texture
		texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld02`
	}
	{
		requires_completed_gig = c_sponsor_tama
		requires_completed_difficulty = gold
		frontend_desc = qs(0x2de5f5e1)
		unlock_icon = unlockable_drumset
		reward_type = cas_texture
		texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld08`
	}
	{
		requires_completed_gig = c_sponsor_tama
		requires_completed_difficulty = gold
		frontend_desc = qs(0x2de5f5e1)
		unlock_icon = unlockable_drumset
		reward_type = cas_texture
		texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld13`
	}
	{
		requires_completed_gig = c_sponsor_zildjian
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x59519670)
		unlock_icon = unlockable_drumsticks
		reward_type = cas
		car_pieces = [
			{
				part = cas_drums_sticks
				desc_id = cad_drumsticks_travis2
			}
			{
				part = cas_drums_sticks
				desc_id = cad_drumsticks_travis
			}
			{
				part = cas_drums_sticks
				desc_id = cad_drumsticks_adrian
			}
			{
				part = cas_drums_sticks
				desc_id = cad_drumsticks_ronnie
			}
		]
	}
	{
		requires_completed_gig = c_steadyasshegoes
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x37ec47a5)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = pandora_outfit_2
			}
			{
				part = cas_female_base_torso
				desc_id = pandora_2_full
			}
			{
				part = cas_female_torso
				desc_id = f_goth_torso_pndrmaid
			}
			{
				part = cas_female_shoes
				desc_id = f_goth_shoe_pilgrim
			}
			{
				part = cas_female_acc_left
				desc_id = f_goth_acc_llace
			}
			{
				part = cas_female_acc_right
				desc_id = f_goth_acc_rlace
			}
		]
	}
	{
		requires_completed_gig = c_streamlinewoman
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x0ac70893)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_rock_hat_spacehelmet
			}
		]
	}
	{
		requires_completed_gig = c_sultansofswing
		requires_completed_difficulty = gold
		frontend_desc = qs(0x6e49f39a)
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_cheats
		reward_type = cheat
		cheat_name = cheat_airinstruments
	}
	{
		requires_completed_gig = c_superstition
		requires_completed_difficulty = gold
		frontend_desc = qs(0xad85835d)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = casey_outfit_2
			}
			{
				part = cas_female_base_torso
				desc_id = casey_2_full
			}
			{
				part = cas_female_torso
				desc_id = f_rock_torso_metalstud
			}
			{
				part = cas_female_shoes
				desc_id = f_rock_shoe_thighhigh
			}
			{
				part = cas_female_torso
				desc_id = f_rock_torso_ctank
			}
		]
	}
	{
		requires_completed_gig = c_sweatingbullets
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xb0838814)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hair
				desc_id = m_funpart_hair_octo
			}
			{
				part = cas_male_hat_hair
				desc_id = m_funpart_hathair_octo
			}
			{
				part = cas_female_hair
				desc_id = f_funpart_hair_octo
			}
			{
				part = cas_female_hat_hair
				desc_id = f_funpart_hathair_octo
			}
		]
	}
	{
		requires_completed_gig = c_sympathyforthedevil
		requires_completed_difficulty = gold
		frontend_desc = qs(0x72df0e3f)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = axel_outfit_2
			}
			{
				part = cas_male_base_torso
				desc_id = axel_2_full
			}
			{
				part = cas_male_torso
				desc_id = m_metl_torso_axel2gh5
			}
			{
				part = cas_male_acc_left
				desc_id = m_metl_accl_axel2gh5
			}
			{
				part = cas_male_acc_right
				desc_id = m_metl_accr_axel2gh5
			}
			{
				part = cas_male_legs
				desc_id = m_metl_legs_axel2gh5
			}
			{
				part = cas_male_shoes
				desc_id = m_metl_shoes_axel2gh5
			}
			{
				part = cas_male_shoes_cutoff
				desc_id = m_metl_shoes_axel2gh5_cutoff
			}
		]
	}
	{
		requires_completed_gig = c_theysay
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x36f714a7)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_rock_hat_halo
			}
		]
	}
	{
		requires_completed_gig = c_twentiethcenturyboy
		requires_completed_difficulty = gold
		frontend_desc = qs(0xf2cc81b7)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = guitar_body_battleaxe
			}
		]
	}
	{
		requires_completed_gig = c_twentyfirstcentury
		requires_completed_difficulty = gold
		frontend_desc = qs(0x216a6eba)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_rock_hat_pumpkin
			}
		]
	}
	{
		requires_completed_gig = c_twominutestomidnight
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x707d49d3)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic
				desc_id = mic_vocality
			}
		]
	}
	{
		requires_completed_gig = c_underpressure
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xfe48bccf)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic
				desc_id = mic_ice_cream_cone
			}
		]
	}
	{
		requires_completed_gig = c_wannabeinla
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xba084300)
		vague_frontend_desc = unlockable_bass_h_text
		unlock_icon = unlockable_bass_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_bass_body
				desc_id = bass105_pin
			}
		]
	}
	{
		requires_completed_gig = c_wereanamericanband
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x5c7df1ce)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = lars_outfit_4
			}
			{
				part = cas_male_base_torso
				desc_id = lars_4_full
			}
			{
				part = cas_male_torso
				desc_id = m_bmtl_torso_lars4
			}
			{
				part = cas_male_legs
				desc_id = m_bmtl_legs_lars4
			}
			{
				part = cas_male_shoes
				desc_id = m_bmtl_shoe_lars4
			}
			{
				part = cas_male_shoes_cutoff
				desc_id = m_bmtl_shoe_lars4_cutoff
			}
			{
				part = cas_male_acc_right
				desc_id = m_bmtl_acc_rlars4
			}
			{
				part = cas_male_acc_left
				desc_id = m_bmtl_acc_llars4
			}
			{
				part = cas_male_hat
				desc_id = m_bmtl_hat_lars4
			}
		]
	}
	{
		requires_completed_gig = c_whatigot
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xaa5e242b)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_torso
				desc_id = m_goth_torso_sfvest
			}
		]
	}
	{
		requires_completed_gig = c_whybother
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x713f272e)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = cas
		car_pieces = [
			{
				part = cas_guitar_body
				desc_id = guitar_anarchy
			}
		]
	}
	{
		requires_completed_gig = c_wolflikeme
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x7f8ecca9)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_female_hat
				desc_id = f_pop_head_ww2helm
			}
			{
				part = cas_male_hat
				desc_id = m_pop_head_ww2helm
			}
		]
	}
	{
		requires_completed_gig = c_womanfromtokyo
		requires_completed_difficulty = gold
		frontend_desc = qs(0x43d9483f)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_female_torso
				desc_id = f_fun_torso_angelw
			}
			{
				part = cas_male_torso
				desc_id = m_fun_torso_angelw
			}
		]
	}
	{
		requires_completed_gig = c_youandme
		requires_completed_difficulty = gold
		frontend_desc = qs(0x68f2b4f8)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_female_hat
				desc_id = f_fun_hat_chickenmask
			}
		]
	}
	{
		requires_completed_gig = c_yougivelove
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3b769ab3)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = cas
		car_pieces = [
			{
				part = cas_outfit
				desc_id = judy_outfit_4
			}
			{
				part = cas_female_base_torso
				desc_id = judy_4_full
			}
			{
				part = cas_full_body
				desc_id = judy_4
			}
			{
				part = cas_female_torso
				desc_id = f_punk_torso_judynails4
			}
			{
				part = cas_female_legs
				desc_id = f_punk_legs_judynails4
			}
		]
	}
	{
		requires_completed_gig = c_younkfunk
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xaf00387d)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = cas
		car_pieces = [
			{
				part = cas_male_hat
				desc_id = m_rock_hat_retrotv
			}
		]
	}
	{
		requires_completed_gig = c_spiritofradio
		requires_completed_difficulty = None
		frontend_desc = qs(0x09555112)
		unlock_icon = 0x00000000
		reward_type = venue
		venue_checksum = load_z_cube
		run_career_outro_and_credits
	}
]
gig_star_rewards = {
	c_allalongthewatchtower = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_alltheprettyfaces = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_americangirl = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_apunk = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_backround = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_bleedamerican = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_blueday = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_blueorchid = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_brianstorm = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_bringthenoise = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_bulletsbutterfly = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_cigarettesweddingbands = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_comedown = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_dancingwithmyself = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_deadbolt = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_demon = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_disconnected = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_donewitheverything = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_doyoufeellikewedo = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_duhast = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_exgirlfriend = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_fame = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_feelgoodinc = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_gammaray = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_gratitude = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_hungrylikethewolf = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_hurtssogood = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_incinerate = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_inmyplace = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_inthemeantime = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_jailbreak = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_judith = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_kryptonite = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_la = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_lithium = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_lonelyisthenight = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_looksthatkill = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_lovetoken = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_lustforlife = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_maidenmothercrone = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_makeitwitchu = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_medicate = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_mirrorpeople = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_nearlylostyou = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_nevermissabeat = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_noonetodependon = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_onebigholiday = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_onlyhappywhenitrains = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_playthatfunkymusic = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_pluginbaby = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_ringoffire = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_rockshow = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_runnindownadream = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_saturdaynightsalright = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_scatterbrain = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_seven = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sexonfire = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_shoutitoutloud = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sixdaysaweek = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_smellsliketeenspirit = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sneakout = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_solonely = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_song2 = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sowingseason = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_special_gorfinal = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_spiritofradio = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_ahead = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_audiotechnica = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_bcrich = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_daisyrock = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_emg = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_ernieball = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_esp = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_ibanez = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_mcswain = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_porkpie = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_prs = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_schecter = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_seymourduncan = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_tama = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sponsor_zildjian = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_steadyasshegoes = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_streamlinewoman = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sultansofswing = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_superstition = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sweatingbullets = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_sympathyforthedevil = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_theysay = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_twentiethcenturyboy = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_twentyfirstcentury = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_twominutestomidnight = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_underpressure = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_wannabeinla = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_wereanamericanband = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_whatigot = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_whybother = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_wolflikeme = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_womanfromtokyo = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_youandme = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_yougivelove = {
		gold = 1
		platinum = 1
		diamond = 1
	}
	c_younkfunk = {
		gold = 1
		platinum = 1
		diamond = 1
	}
}
