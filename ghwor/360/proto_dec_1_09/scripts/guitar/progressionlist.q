unlockable_accessories_text = qs(0x96d51643)
unlockable_bass_text = qs(0x388e2fb6)
unlockable_bass_h_text = qs(0x40a5a2fa)
unlockable_bass_pieces2_text = qs(0xb82340b7)
unlockable_character_text = qs(0x48ffb2e8)
unlockable_cheats_text = qs(0x188b9a3e)
unlockable_drumset_text = qs(0x116d8740)
unlockable_drumsticks_text = qs(0xc4ab1eab)
0xe109b842 = qs(0xd4bd1409)
unlockable_guitar_text = qs(0x6bb75697)
unlockable_guitar_h_text = qs(0x7b363da6)
unlockable_guitar_pieces2_text = qs(0xf35e4cd9)
unlockable_mic2_text = qs(0x2096090d)
unlockable_mic3_text = qs(0x2096090d)
unlockable_mic_pieces2_text = qs(0x6871393d)
unlockable_options_text = qs(0xd5ccf4fc)
unlockable_outfit_text = qs(0x57f5286a)
unlockable_pack_text = qs(0x3d0167c3)
unlockable_pants2_text = qs(0x891c7a57)
unlockable_shoes2_text = qs(0x5e9d3920)
unlockable_top2_text = qs(0xb06c34c7)
unlockable_venues_text = qs(0xa46cd658)
0xbc2dcef6 = qs(0x3e482764)
unlockable_video_text = qs(0xf8ae5f64)
unlockable_art_text = qs(0x1e4f026e)
star_reward_gold = 1
star_reward_platinum = 1
star_reward_diamond = 1
venue_progression = [
	{
		venue_to_unlock = load_z_egypt
		stars_required = 0
	}
	{
		venue_to_unlock = load_z_punkstage
		stars_required = 6
	}
	{
		venue_to_unlock = load_z_riothouse
		stars_required = 12
	}
]
gig_progression = [
	{
		gig_to_unlock = 0x3196b0ab
		unlocked_with_venue
		current_venue = load_z_egypt
	}
	{
		gig_to_unlock = 0x9fabd723
		unlocked_with_venue
		current_venue = load_z_punkstage
	}
	{
		gig_to_unlock = 0x49517a57
		unlocked_with_venue
		current_venue = load_z_riothouse
	}
	{
		gig_to_unlock = 0x6dfc5795
		unlocked_with_venue
		current_venue = load_z_egypt
	}
	{
		gig_to_unlock = 0x0c34903c
		requires_venue_stars = 3
		current_venue = load_z_egypt
	}
	{
		gig_to_unlock = 0x65224e6d
		requires_venue_stars = 3
		current_venue = load_z_punkstage
	}
	{
		gig_to_unlock = 0x90eeec9b
		requires_venue_stars = 3
		current_venue = load_z_riothouse
	}
]
progression_gig_list = [
	{
		venue = load_z_egypt
		gig_list = 0xd1d17ce1
	}
	{
		venue = load_z_punkstage
		gig_list = 0x4172e27e
	}
	{
		venue = load_z_riothouse
		gig_list = 0xb5ceff92
	}
]
award_point_progression = [
	{
		award_points = 5
		frontend_desc = qs(0x37dfbf18)
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
		award_points = 10
		frontend_desc = qs(0x25f22520)
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
		award_points = 15
		frontend_desc = qs(0x1683afa6)
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
		award_points = 20
		frontend_desc = qs(0xf8113029)
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
		award_points = 25
		frontend_desc = qs(0xb501f36b)
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
		award_points = 30
		frontend_desc = qs(0xbce92eec)
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
		award_points = 35
		frontend_desc = qs(0x5abe2e16)
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
		award_points = 40
		frontend_desc = qs(0xd0d5a7ac)
		vague_frontend_desc = unlockable_guitar_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_guitar_body
						desc_id = gtr109_metal
					}
				]
			}
		]
	}
	{
		award_points = 45
		frontend_desc = qs(0x37dfbf18)
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
		award_points = 50
		frontend_desc = qs(0x0cb9b525)
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
		award_points = 55
		frontend_desc = qs(0x2e062560)
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
		award_points = 60
		frontend_desc = qs(0x65062b05)
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
		award_points = 65
		frontend_desc = qs(0x2b396c0e)
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
		award_points = 70
		frontend_desc = qs(0xd0d5a7ac)
		vague_frontend_desc = unlockable_bass_text
		unlock_icon = unlockable_instrument
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_bass_body
						desc_id = bass109_metal
					}
				]
			}
		]
	}
	{
		award_points = 75
		frontend_desc = qs(0xed39a437)
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
		award_points = 80
		frontend_desc = qs(0xb501f36b)
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
		award_points = 85
		frontend_desc = qs(0xbce92eec)
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
		award_points = 90
		frontend_desc = qs(0xcdd25e5e)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_full_body
						desc_id = Lars_2
					}
				]
			}
		]
	}
	{
		award_points = 95
		frontend_desc = qs(0xd4c96f1f)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_full_body
						desc_id = Lars_2
					}
				]
			}
		]
	}
	{
		award_points = 100
		frontend_desc = qs(0x17be7bb8)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		rewards = [
			{
				reward_type = cas
				car_pieces = [
					{
						part = cas_full_body
						desc_id = Lars_2
					}
				]
			}
		]
	}
]
reward_progression = [
	{
		requires_completed_gig = 0x0c34903c
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x652eeb06)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = cas
		car_pieces = [
			{
				part = cas_mic_stand
				desc_id = vortex
			}
		]
	}
]
