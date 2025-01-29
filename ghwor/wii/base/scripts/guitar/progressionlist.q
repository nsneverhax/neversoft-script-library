unlockable_accessories_text = qs(0xf8718852)
unlockable_bass_text = qs(0x95d1190a)
unlockable_bass_h_text = qs(0x5a149eb5)
unlockable_character_text = qs(0x1d81308c)
unlockable_cheats_text = qs(0xdd806c4f)
unlockable_drumsticks_text = qs(0x3b638909)
unlockable_extras_text = qs(0x4787ae6a)
unlockable_guitar_text = qs(0x30979648)
unlockable_guitar_h_text = qs(0x2caa39ab)
unlockable_venues_text = qs(0x914d1132)
unlockable_songs_text = qs(0x28043063)
unlockable_video_text = qs(0x75dddb61)
unlockable_art_text = qs(0x99ef2ca9)
unlockable_accessories_short_text = qs(0xd31eced0)
unlockable_bass_short_text = qs(0x4f551cbe)
unlockable_character_short_text = qs(0x5920e67a)
unlockable_cheats_short_text = qs(0xfa062259)
unlockable_drumsticks_short_text = qs(0x999c08dd)
unlockable_extras_short_text = qs(0x3630ac6e)
unlockable_guitar_short_text = qs(0x11355666)
unlockable_venues_short_text = qs(0x46e16e3f)
unlockable_video_short_text = qs(0x1a23e703)
unlockable_art_short_text = qs(0x005c5370)
star_reward_gold = 1
star_reward_platinum = 1
star_reward_diamond = 1
award_point_progression = [
	{
		award_points = 10
		Name = nsft_glass
		frontend_desc = qs(0xddedceef)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr136_glass
					}
				]
			}
		]
	}
	{
		award_points = 20
		Name = axel_gallery
		frontend_desc = qs(0x0539af5a)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = axel_gallery
			}
		]
	}
	{
		award_points = 30
		Name = wormhole
		frontend_desc = qs(0xc001117d)
		desc_additional_text = unlockable_venues_short_text
		vague_frontend_desc = unlockable_venues_text
		unlock_icon = unlockable_venues
		rewards = [
			{
				reward_type = venue
				venue_checksum = load_z_visualizer
			}
		]
	}
	{
		award_points = 40
		Name = cbgb_cbgb
		frontend_desc = qs(0x18d3ea59)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_full_guitar
						desc_id = gtr143_cbgb
					}
				]
			}
		]
	}
	{
		award_points = 50
		Name = metalhead
		frontend_desc = qs(0x96d861cd)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		rewards = [
			{
				reward_type = character
				profile_name = gh_rocker_metalhead
			}
		]
	}
	{
		award_points = 60
		Name = angel_wings
		frontend_desc = qs(0xc8fe9880)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_male_torso
						desc_id = m_fun_torso_angelw
					}
					{
						part = cas_female_torso
						desc_id = f_fun_torso_angelw
					}
				]
			}
		]
	}
	{
		award_points = 70
		Name = nsft_resonator
		frontend_desc = qs(0xa46f12b9)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr131_steel
					}
				]
			}
		]
	}
	{
		award_points = 80
		Name = judy_gallery
		frontend_desc = qs(0xa9028c21)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = judy_gallery
			}
		]
	}
	{
		award_points = 90
		Name = colorshuffle
		frontend_desc = qs(0xb6adecd0)
		desc_additional_text = unlockable_extras_short_text
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = cheat_colorshuffle
			}
		]
	}
	{
		award_points = 100
		Name = eb_stingray
		frontend_desc = qs(0xc1df9fd5)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass_mm_stingray
					}
				]
			}
		]
	}
	{
		award_points = 110
		Name = johnny_gallery
		frontend_desc = qs(0x525fe42c)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = johnny_gallery
			}
		]
	}
	{
		award_points = 120
		Name = eddie
		frontend_desc = qs(0x91c2e6b5)
		desc_additional_text = unlockable_character_short_text
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		rewards = [
			{
				reward_type = character
				profile_name = gh_rocker_eddie
			}
		]
	}
	{
		award_points = 130
		Name = ibanez_ict
		frontend_desc = qs(0xb9d7f4c7)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr178_ibz_ict
					}
				]
			}
		]
	}
	{
		award_points = 140
		Name = casey_gallery
		frontend_desc = qs(0xd88aefc7)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = casey_gallery
			}
		]
	}
	{
		award_points = 150
		Name = cat_gorilla
		frontend_desc = qs(0x44098256)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_male_hat
						desc_id = m_hat_gorilla
					}
					{
						part = cas_female_hat
						desc_id = f_pop_acc_catears
					}
				]
			}
		]
	}
	{
		award_points = 160
		Name = dr_wildwood
		frontend_desc = qs(0xb6d12705)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr96_dr_wildwood
					}
				]
			}
		]
	}
	{
		award_points = 170
		Name = pandora1_gallery
		frontend_desc = qs(0x33080fb7)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = pandora1_gallery
			}
		]
	}
	{
		award_points = 180
		Name = air_instruments
		frontend_desc = qs(0x256aa3ef)
		desc_additional_text = unlockable_extras_short_text
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = cheat_airinstruments
			}
		]
	}
	{
		award_points = 190
		Name = prs_305
		frontend_desc = qs(0x15855ff5)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr88_prs_305
					}
				]
			}
		]
	}
	{
		award_points = 200
		Name = pandora2_gallery
		frontend_desc = qs(0x18255c74)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = pandora2_gallery
			}
		]
	}
	{
		award_points = 220
		Name = regal_black
		frontend_desc = qs(0x03444fa5)
		desc_additional_text = unlockable_drumsticks_short_text
		vague_frontend_desc = unlockable_drumsticks_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_drums_sticks
						desc_id = drumsticks_regal
					}
				]
			}
		]
	}
	{
		award_points = 240
		Name = nsft_tiki
		frontend_desc = qs(0x1aa6ccbd)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr133_tiki
					}
				]
			}
		]
	}
	{
		award_points = 260
		Name = lars_gallery
		frontend_desc = qs(0x9dd7644f)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = lars_gallery
			}
		]
	}
	{
		award_points = 280
		Name = all_hopos
		frontend_desc = qs(0x5b7a903c)
		desc_additional_text = unlockable_cheats_short_text
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = cheat_allhopos
			}
		]
	}
	{
		award_points = 300
		Name = nsft_glass2
		frontend_desc = qs(0xddedceef)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass136_glass
					}
				]
			}
		]
	}
	{
		award_points = 320
		Name = clive_gallery
		frontend_desc = qs(0xccb97235)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = clive_gallery
			}
		]
	}
	{
		award_points = 340
		Name = Izzy
		frontend_desc = qs(0x3ba5cbc5)
		desc_additional_text = unlockable_character_short_text
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		rewards = [
			{
				reward_type = character
				profile_name = gh_rocker_izzy
			}
		]
	}
	{
		award_points = 360
		Name = bcrich_eagle
		frontend_desc = qs(0xd5d4b3f2)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr181_eagle
					}
				]
			}
		]
	}
	{
		award_points = 380
		Name = dylan_gallery
		frontend_desc = qs(0xa113847a)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = dylan_gallery
			}
		]
	}
	{
		award_points = 400
		Name = zildjian_red
		frontend_desc = qs(0x4f0a6e6f)
		desc_additional_text = unlockable_drumsticks_short_text
		vague_frontend_desc = unlockable_drumsticks_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_drums_sticks
						desc_id = drumsticks_z_5bred
					}
				]
			}
		]
	}
	{
		award_points = 420
		Name = schecter_riot
		frontend_desc = qs(0x4255ef63)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass276_sch_riot
					}
				]
			}
		]
	}
	{
		award_points = 440
		Name = eddie_gallery
		frontend_desc = qs(0x91c2e6b5)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = eddie_gallery
			}
		]
	}
	{
		award_points = 460
		Name = gas_mask
		frontend_desc = qs(0x0039dd19)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
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
		]
	}
	{
		award_points = 480
		Name = mm_luke
		frontend_desc = qs(0x2183c998)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr85_mm_luke
					}
				]
			}
		]
	}
	{
		award_points = 500
		Name = echo_gallery
		frontend_desc = qs(0xa26ff67a)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = echo_gallery
			}
		]
	}
	{
		award_points = 520
		Name = randomgems
		frontend_desc = qs(0xd7bf4225)
		desc_additional_text = unlockable_cheats_short_text
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = cheat_randomgems
			}
		]
	}
	{
		award_points = 540
		Name = mcswain_nemesis
		frontend_desc = qs(0x1b4e57a4)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_full_guitar
						desc_id = gtr144_nemesis
					}
				]
			}
		]
	}
	{
		award_points = 560
		Name = izzy_gallery
		frontend_desc = qs(0x3ba5cbc5)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = izzy_gallery
			}
		]
	}
	{
		award_points = 580
		Name = hypersphere
		frontend_desc = qs(0x3ee59a14)
		desc_additional_text = unlockable_venues_short_text
		vague_frontend_desc = unlockable_venues_text
		unlock_icon = unlockable_venues
		rewards = [
			{
				reward_type = venue
				venue_checksum = load_z_cube
			}
		]
	}
	{
		award_points = 600
		Name = esp_phoenix
		frontend_desc = qs(0x86345e4f)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr40_px_body
					}
				]
			}
		]
	}
	{
		award_points = 630
		Name = midori_gallery
		frontend_desc = qs(0x4c47fb49)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = midori_gallery
			}
		]
	}
	{
		award_points = 660
		Name = clive
		frontend_desc = qs(0xccb97235)
		desc_additional_text = unlockable_character_short_text
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		rewards = [
			{
				reward_type = character
				profile_name = gh_rocker_clive
			}
		]
	}
	{
		award_points = 690
		Name = bcrich_mockingbird
		frontend_desc = qs(0xf9d67a2b)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr24_bc_rich_mock
					}
				]
			}
		]
	}
	{
		award_points = 720
		Name = quincy_gallery
		frontend_desc = qs(0x960585a9)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = quincy_gallery
			}
		]
	}
	{
		award_points = 750
		Name = mirrorgems
		frontend_desc = qs(0x96017a21)
		desc_additional_text = unlockable_cheats_short_text
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = cheat_mirrorgems
			}
		]
	}
	{
		award_points = 780
		Name = prs_mirax
		frontend_desc = qs(0x85ac6723)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr87_prs_mirax
					}
				]
			}
		]
	}
	{
		award_points = 810
		Name = god_gallery
		frontend_desc = qs(0x7705ed10)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = god_gallery
			}
		]
	}
	{
		award_points = 840
		Name = ww2_helms
		frontend_desc = qs(0x3e67b3aa)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_male_hat
						desc_id = m_fun_hat_ww2helmet
					}
					{
						part = cas_female_hat
						desc_id = f_pop_head_ww2helm
					}
				]
			}
		]
	}
	{
		award_points = 870
		Name = dr_stardust
		frontend_desc = qs(0x07c33ab7)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr95_dr_stardust_elite
					}
				]
			}
		]
	}
	{
		award_points = 900
		Name = lou_gallery
		frontend_desc = qs(0x88f8861c)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = lou_gallery
			}
		]
	}
	{
		award_points = 930
		Name = invisible_rockers
		frontend_desc = qs(0xeb2c1f09)
		desc_additional_text = unlockable_extras_short_text
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = cheat_invisiblecharacters
			}
		]
	}
	{
		award_points = 960
		Name = mcswain_m
		frontend_desc = qs(0x43ce2b25)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr145_mcswain_m
					}
				]
			}
		]
	}
	{
		award_points = 990
		Name = misc_char_gallery
		frontend_desc = qs(0x9437d5c2)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = misc_char_gallery
			}
		]
	}
	{
		award_points = 1020
		Name = zildjian_black
		frontend_desc = qs(0x97523935)
		desc_additional_text = unlockable_drumsticks_short_text
		vague_frontend_desc = unlockable_drumsticks_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_drums_sticks
						desc_id = drumsticks_z_rock
					}
				]
			}
		]
	}
	{
		award_points = 1050
		Name = ibanez_btb
		frontend_desc = qs(0x0246def5)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bas_ibz_btb_body
					}
				]
			}
		]
	}
	{
		award_points = 1080
		Name = gh3_guitar1_gallery
		frontend_desc = qs(0x7ae54ea3)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh3_guitar1_gallery
			}
		]
	}
	{
		award_points = 1110
		Name = minotaur
		frontend_desc = qs(0x5d2e98c4)
		desc_additional_text = unlockable_character_short_text
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		rewards = [
			{
				reward_type = character
				profile_name = gh_rocker_minotaur
			}
		]
	}
	{
		award_points = 1140
		Name = prs_torero
		frontend_desc = qs(0x12950501)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr189_prs_torero
					}
				]
			}
		]
	}
	{
		award_points = 1170
		Name = gh3_guitar2_gallery
		frontend_desc = qs(0x51c81d60)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh3_guitar2_gallery
			}
		]
	}
	{
		award_points = 1200
		Name = always_slide
		frontend_desc = qs(0x2a9644f6)
		desc_additional_text = unlockable_cheats_short_text
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = cheat_alwaysslide
			}
		]
	}
	{
		award_points = 1240
		Name = nsft_casket
		frontend_desc = qs(0xbcf86fa7)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr108_casket
					}
				]
			}
		]
	}
	{
		award_points = 1280
		Name = gh6_guitar_gallery
		frontend_desc = qs(0xeae0a56c)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh6_guitar_gallery
			}
		]
	}
	{
		award_points = 1320
		Name = nsft_elephant
		frontend_desc = qs(0x0d31a834)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass1_nvsft_elephant_body
					}
				]
			}
		]
	}
	{
		award_points = 1360
		Name = schecter_synyster
		frontend_desc = qs(0xd0e04c08)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr277_sch_synyster
					}
				]
			}
		]
	}
	{
		award_points = 1400
		Name = gh3_highway1_gallery
		frontend_desc = qs(0x2cd0d4af)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh3_highway1_gallery
			}
		]
	}
	{
		award_points = 1440
		Name = hud_free_mode
		frontend_desc = qs(0xb627a5d5)
		desc_additional_text = unlockable_extras_short_text
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = cheat_hudfreemode
			}
		]
	}
	{
		award_points = 1480
		Name = schecter_corsair
		frontend_desc = qs(0xffb38f7d)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr275_sch_corsair
					}
				]
			}
		]
	}
	{
		award_points = 1520
		Name = gh3_highway2_gallery
		frontend_desc = qs(0x07fd876c)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh3_highway2_gallery
			}
		]
	}
	{
		award_points = 1560
		Name = ibanez_icb
		frontend_desc = qs(0xa54f4110)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = ibanez_icb_body
					}
				]
			}
		]
	}
	{
		award_points = 1600
		Name = arthas
		frontend_desc = qs(0x260c0454)
		desc_additional_text = unlockable_character_short_text
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		rewards = [
			{
				reward_type = character
				profile_name = gh_rocker_arthas
			}
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_full_guitar
						desc_id = gtr141_frostmourne
					}
				]
			}
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_full_bass
						desc_id = bass141_frostmourne
					}
				]
			}
		]
	}
	{
		award_points = 1640
		Name = nsft_v_twin
		frontend_desc = qs(0xd199fea9)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr142_vtwin
					}
				]
			}
		]
	}
	{
		award_points = 1680
		Name = gh4_highway1_gallery
		frontend_desc = qs(0xc64be763)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh4_highway1_gallery
			}
		]
	}
	{
		award_points = 1720
		Name = focus_mode
		frontend_desc = qs(0xd57d1405)
		desc_additional_text = unlockable_extras_short_text
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = cheat_focusmode
			}
		]
	}
	{
		award_points = 1760
		Name = nsft_aristillus
		frontend_desc = qs(0x5d785663)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bs141_frame
					}
				]
			}
		]
	}
	{
		award_points = 1800
		Name = gh4_highway2_gallery
		frontend_desc = qs(0xed66b4a0)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh4_highway2_gallery
			}
		]
	}
	{
		award_points = 1840
		Name = viking_helm
		frontend_desc = qs(0xbbf00af8)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_male_hat
						desc_id = m_bmtl_hat_viking
					}
					{
						part = cas_female_hat
						desc_id = f_bmtl_head_viking
					}
				]
			}
		]
	}
	{
		award_points = 1880
		Name = prs_swamp
		frontend_desc = qs(0x6a8eacca)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr179_prs_swamp
					}
				]
			}
		]
	}
	{
		award_points = 1920
		Name = gh3_venue_gallery
		frontend_desc = qs(0xee120675)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh3_venue_gallery
			}
		]
	}
	{
		award_points = 1960
		Name = nsft_tiki2
		frontend_desc = qs(0x1aa6ccbd)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass133_tiki
					}
				]
			}
		]
	}
	{
		award_points = 2000
		Name = esp_nv
		frontend_desc = qs(0x2830175d)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr39_esp_nv
					}
				]
			}
		]
	}
	{
		award_points = 2050
		Name = gh4_venue1_gallery
		frontend_desc = qs(0x49495c6d)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh4_venue1_gallery
			}
		]
	}
	{
		award_points = 2100
		Name = slime
		frontend_desc = qs(0xdbfe1db5)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_male_hair
						desc_id = m_funpart_hair_slime
					}
					{
						part = cas_female_hair
						desc_id = f_funpart_hair_slime
					}
				]
			}
		]
	}
	{
		award_points = 2150
		Name = cbgb_customdeluxe
		frontend_desc = qs(0xc1018ac3)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_full_guitar
						desc_id = gtr750_cbgb
					}
				]
			}
		]
	}
	{
		award_points = 2200
		Name = gh4_venue2_gallery
		frontend_desc = qs(0x62640fae)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh4_venue2_gallery
			}
		]
	}
	{
		award_points = 2250
		Name = eb_bigal
		frontend_desc = qs(0x13157883)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass_musicman_bigal
					}
				]
			}
		]
	}
	{
		award_points = 2300
		Name = nsft_acoustic
		frontend_desc = qs(0x6914711a)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr27_nsft_acoustic
					}
				]
			}
		]
	}
	{
		award_points = 2350
		Name = gh5_venue1_gallery
		frontend_desc = qs(0x8566a6e9)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh5_venue1_gallery
			}
		]
	}
	{
		award_points = 2400
		Name = eb_bongo
		frontend_desc = qs(0xd0c98d82)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass_mm_bng
					}
				]
			}
		]
	}
	{
		award_points = 2450
		Name = nsft_banjo
		frontend_desc = qs(0x9af1e7e7)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr110_banjo
					}
				]
			}
		]
	}
	{
		award_points = 2500
		Name = gh5_venue2_gallery
		frontend_desc = qs(0xae4bf52a)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh5_venue2_gallery
			}
		]
	}
	{
		award_points = 2550
		Name = clown_chicken
		frontend_desc = qs(0xf90a4851)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_male_hat
						desc_id = m_funpart_hat_clown
					}
					{
						part = cas_female_hat
						desc_id = f_fun_hat_chickenmask
					}
				]
			}
		]
	}
	{
		award_points = 2600
		Name = bcrich_bich
		frontend_desc = qs(0x9c074f8f)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr180_richbich
					}
				]
			}
		]
	}
	{
		award_points = 2650
		Name = gh6_venue1_gallery
		frontend_desc = qs(0xb00e228a)
		desc_additional_text = unlockable_art_short_text
		vague_frontend_desc = unlockable_art_text
		unlock_icon = unlockable_art
		rewards = [
			{
				reward_type = art_gallery
				gallery_name = gh6_venue1_gallery
			}
		]
	}
	{
		award_points = 2700
		Name = top_hat
		frontend_desc = qs(0xd9f3b456)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_male_hat
						desc_id = m_goth_hat_tophat
					}
					{
						part = cas_female_hat
						desc_id = f_goth_hat_tophat
					}
				]
			}
		]
	}
	{
		award_points = 2750
		Name = ibanez_btb
		frontend_desc = qs(0x8c3d4434)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass135_smoke
					}
				]
			}
		]
	}
	{
		award_points = 2800
		Name = longhorn_succubus
		frontend_desc = qs(0xaa276407)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_male_hat
						desc_id = m_metl_horn
					}
					{
						part = cas_female_hat
						desc_id = f_metl_acc_horn
					}
				]
			}
		]
	}
	{
		award_points = 2850
		Name = nsft_chainsaw
		frontend_desc = qs(0xdacb71d9)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bas143_chainsaw
					}
				]
			}
		]
	}
	{
		award_points = 2900
		Name = performance_mode
		frontend_desc = qs(0x1394b282)
		desc_additional_text = unlockable_extras_short_text
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_cheats
		rewards = [
			{
				reward_type = cheat
				cheat_name = Cheat_PerformanceMode
			}
		]
	}
	{
		award_points = 2950
		Name = nsft_sk8_bass
		frontend_desc = qs(0x430eef3f)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass1b_nvsft_sk8gtr
					}
				]
			}
		]
	}
	{
		award_points = 3000
		Name = smuggypus
		frontend_desc = qs(0x9ea796bc)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_male_hair
						desc_id = m_funpart_hair_octo
					}
					{
						part = cas_female_hair
						desc_id = f_funpart_hair_octo
					}
				]
			}
		]
	}
	{
		award_points = 3075
		Name = nsft_sk8brd
		frontend_desc = qs(0x749ae5a0)
		desc_additional_text = unlockable_guitar_short_text
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr1b_nvsft_sk8gtr
					}
				]
			}
		]
	}
	{
		award_points = 3150
		Name = nsft_claude
		frontend_desc = qs(0xa521f5df)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass120_clawed
					}
				]
			}
		]
	}
	{
		award_points = 3225
		Name = nsft_casket2
		frontend_desc = qs(0xbcf86fa7)
		desc_additional_text = unlockable_bass_short_text
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass108_casket
					}
				]
			}
		]
	}
	{
		award_points = 3300
		Name = eyeball
		frontend_desc = qs(0x3b86ba16)
		desc_additional_text = unlockable_accessories_short_text
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		rewards = [
			{
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
		]
	}
]
