empty_appearance = {
	cas_body = {
		desc_id = nobody
	}
}
preset_musician_instrument_hack = {
	cas_guitar_body = {
		desc_id = gtr31_horizon
	}
	cas_guitar_finish = {
		desc_id = gtr33_flamed
	}
	cas_guitar_body_detail = {
		desc_id = gtr33_dtl11
		chosen_materials = {
			material1 = black_1guitar
		}
	}
	cas_guitar_neck = {
		desc_id = gtr_24fret_fretboard_03
	}
	cas_guitar_head = {
		desc_id = gtr31c_neckhead_02
	}
	cas_guitar_head_finish = {
		desc_id = espcolor
		chosen_materials = {
			material1 = black_1guitar
		}
	}
	cas_guitar_head_detail = {
		desc_id = gtr37_nekhed_dtl02
		chosen_materials = {
			material1 = red_1
		}
	}
	cas_guitar_pickguards = {
		desc_id = None
	}
	cas_guitar_bridges = {
		desc_id = gtr31_bridge_fr
	}
	cas_guitar_knobs = {
		desc_id = gtr_32_knobs_b
	}
	cas_guitar_pickups = {
		desc_id = gtr31_pickup_gold
	}
	cas_bass_body = {
		desc_id = bass17_esp_ec_01
	}
	cas_bass_finish = {
		desc_id = bass17_esp_ec_ld_12
		chosen_materials = {
			material1 = yellow_1
		}
	}
	cas_bass_neck = {
		desc_id = bass_fretboard_24black
	}
	cas_bass_neck_finish = {
		desc_id = bass_fretboard_inlay_01
	}
	cas_bass_head = {
		desc_id = bass14_neckhead_04
	}
	cas_bass_head_finish = {
		desc_id = esp_solidcolor
		chosen_materials = {
			material1 = black_1guitar
		}
	}
	cas_bass_head_detail = {
		desc_id = none_esp
	}
	cas_bass_pickguards = {
		desc_id = None
	}
	cas_bass_pickups = {
		desc_id = bass9_pkup_type3_blk_2
		chosen_materials = {
			material1 = grey_2guitar
		}
	}
	cas_bass_bridges = {
		desc_id = bass17_bridge_4str_04
	}
	cas_bass_knobs = {
		desc_id = bass17_esp_knob_10
		chosen_materials = {
			material1 = grey_3guitar
		}
	}
	cas_mic = {
		desc_id = mic_standard
	}
	cas_mic_stand = {
		desc_id = mic_stand_female
	}
	cas_drums = {
		desc_id = singlebasskit
	}
	cas_drums_sticks = {
		desc_id = drumsticks1
	}
}
worst_male_appearance_hack = {
	cas_physique = {
		desc_id = malephysique
		bones = {
			height = 1.0
			physique = 1.0
		}
	}
	cas_highway = {
		desc_id = highway
	}
	cas_gems = {
		desc_id = gem_set_01
	}
}
worst_female_appearance_hack = {
	cas_physique = {
		desc_id = femalephysique
		bones = {
			height = 1.0
			physique = 1.0
			chest = 1.0
		}
	}
	cas_highway = {
		desc_id = axelhighway
	}
	cas_gems = {
		desc_id = gem_set_01
	}
}
preset_male_base_parts = {
	cas_male_base_torso = {
		desc_id = car_male_torso
	}
}
preset_female_base_parts = {
	cas_female_base_torso = {
		desc_id = car_female_torso
	}
}
0x6db04597 = [
	{
		Name = 0xda49911d
		fullname = qs(0x45baca00)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xc761419a)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x26d8b3f6
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = 0x7d6570b2
		fullname = qs(0x7c7a9ba2)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x09afd2e4)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x55cfe7e9
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = 0x1d30c836
		fullname = qs(0x07d62cc5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xa12ec20c)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xe1a1eadd
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = 0x61ce8c08
		fullname = qs(0x7c8b8fdb)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xb2da8453)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xc9e14930
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			$preset_musician_instrument_hack
		}
	}
]
preset_musician_profiles_locked = [
	{
		Name = 0xb1e2942d
		fullname = qs(0x1198e746)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x318ad702)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x34ef4e62
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr81_prs_miramt
			}
			cas_guitar_finish = {
				desc_id = gtr81_prs_mt_ld01
				chosen_materials = {
					material1 = teal_5
				}
			}
			cas_guitar_body_fade = {
				desc_id = fade_none
			}
			cas_guitar_body_detail = {
				desc_id = gh5_none
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_02
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld81_prs_dots
			}
			cas_guitar_head = {
				desc_id = gtr81_neckhead01
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = teal_5
				}
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = gtr81_pguard
			}
			cas_guitar_pickguard_finish = {
				desc_id = custom_color_esp
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_guitar_bridges = {
				desc_id = gtr78_bridge01
			}
			cas_guitar_knobs = {
				desc_id = lampshade
			}
			cas_guitar_pickups = {
				desc_id = duncanbodbl
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass_schect_030
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl01
				chosen_materials = {
					material1 = navy_4
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_22c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch22_inl_ld47
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
			}
			cas_bass_head_finish = {
				desc_id = bass_neckhead_mt
			}
			cas_bass_head_detail = {
				desc_id = none_gh5
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = emgj
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = schsimple
			}
			cas_bass_knobs = {
				desc_id = knurled
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_46
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld57
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0x3c17a2c4
		fullname = qs(0x1198e746)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		win_anims = [
			s_jeff_win_waving
		]
		lose_anims = [
			s_jeff_lose_walkoff
		]
		preset_icon = photo_eddie
		blurb = qs(0x318ad702)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x34ef4e62
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr81_prs_miramt
			}
			cas_guitar_finish = {
				desc_id = gtr81_prs_mt_ld01
				chosen_materials = {
					material1 = teal_5
				}
			}
			cas_guitar_body_fade = {
				desc_id = fade_none
			}
			cas_guitar_body_detail = {
				desc_id = gh5_none
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_02
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld81_prs_dots
			}
			cas_guitar_head = {
				desc_id = gtr81_neckhead01
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = teal_5
				}
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = gtr81_pguard
			}
			cas_guitar_pickguard_finish = {
				desc_id = custom_color_esp
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_guitar_bridges = {
				desc_id = gtr78_bridge01
			}
			cas_guitar_knobs = {
				desc_id = lampshade
			}
			cas_guitar_pickups = {
				desc_id = duncanbodbl
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass_schect_030
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl01
				chosen_materials = {
					material1 = navy_4
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_22c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch22_inl_ld47
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
			}
			cas_bass_head_finish = {
				desc_id = bass_neckhead_mt
			}
			cas_bass_head_detail = {
				desc_id = none_gh5
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = emgj
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = schsimple
			}
			cas_bass_knobs = {
				desc_id = knurled
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_46
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld57
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0x89438ada
		fullname = qs(0x3a7cbe0e)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x0d55e394)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x6fa5db01
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = 0x07a1f6b0
			}
			cas_guitar_finish = {
				desc_id = 0xceb81032
			}
			cas_guitar_body_detail = {
				desc_id = 0x7a326c77
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_04
			}
			cas_guitar_neck_finish = {
				desc_id = 0x39aab659
			}
			cas_guitar_head = {
				desc_id = gtr142_neckhead
			}
			cas_guitar_head_finish = {
				desc_id = 0x1d747ba2
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = 0x4d77968c
			}
			cas_guitar_knobs = {
				desc_id = 0xeaa46f70
			}
			cas_guitar_pickups = {
				desc_id = banjo1
			}
			cas_bass_body = {
				desc_id = bass17_esp_ec_01
			}
			cas_bass_finish = {
				desc_id = bass17_esp_ax_d
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = none_esp
			}
			cas_bass_body_fade = {
				desc_id = bass17_esp_ax_dtl_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_inlay_05
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_head = {
				desc_id = bass14_neckhead_03
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = none_gh5
			}
			cas_bass_head_fade = {
				desc_id = bass9_neckhead3_dtl_04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = emgj
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge_4str_04
			}
			cas_bass_knobs = {
				desc_id = bass17_esp_knob_10
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = None
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld42
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0xae5829c0
		fullname = qs(0x5f2add08)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x3de61082)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xbfbfc4cd
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			$preset_musician_instrument_hack
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
		}
	}
	{
		Name = 0xd95f1956
		fullname = qs(0x4631ec49)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x855a77e7)
		intro_anims = [
			0x5d15ec08
		]
		win_anims = [
			0x5d15ec08
		]
		lose_anims = [
			0xf3ed7646
		]
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xc8b8f45b
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			$preset_musician_instrument_hack
			cas_guitar_body = {
				desc_id = 0x07a1f6b0
			}
			cas_guitar_finish = {
				desc_id = None
			}
			cas_guitar_body_detail = {
				desc_id = 0x7a326c77
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_04
			}
			cas_guitar_neck_finish = {
				desc_id = 0x39aab659
			}
			cas_guitar_head = {
				desc_id = gtr142_neckhead
			}
			cas_guitar_head_finish = {
				desc_id = 0x1d747ba2
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = 0x4d77968c
			}
			cas_guitar_knobs = {
				desc_id = 0xeaa46f70
			}
			cas_guitar_pickups = {
				desc_id = banjo1
			}
			cas_mic = {
				desc_id = mic_cash
			}
			cas_mic_stand = {
				desc_id = micstand_cash
			}
		}
	}
	{
		Name = 0x48d89fb1
		fullname = qs(0x3cdee9de)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x7962e47e)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xae3ece6a
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr33_boris
			}
			cas_guitar_finish = {
				desc_id = gtr33_kh2_wood_d_color
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = none_esp
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_01
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld86_esp_dots
			}
			cas_guitar_head = {
				desc_id = gtr33_nekhed_01
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr33_bridge_fr
			}
			cas_guitar_knobs = {
				desc_id = gtr_33_knobs_b
			}
			cas_guitar_pickups = {
				desc_id = gtr30_emg
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
			}
			cas_bass_finish = {
				desc_id = bs_ibz_sr_ld00
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = none_esp
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
			}
			cas_bass_neck_finish = {
				desc_id = bass_ibz24_inlay_62
				chosen_materials = {
					material1 = teal_5
				}
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = bs_ibz_sr_hd_dtl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = emgj
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = ibz01
			}
			cas_bass_knobs = {
				desc_id = speedster
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = None
			}
			cas_drum_detail = {
				desc_id = None
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0x74f90a05
		fullname = qs(0x2b1ddae2)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x0713ea70)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x651ee708
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			$preset_musician_instrument_hack
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0xbb7f03d4
		fullname = qs(0xe7c54951)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x65d18445)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xd3959486
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr73_sch_s1
			}
			cas_guitar_finish = {
				desc_id = gtr73_sch_s1_ld02
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr73_sch_s1_dtl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22_fret_ld49_shctr_block
			}
			cas_guitar_head = {
				desc_id = gtr73_neckhead_04
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = gtr73_pg1
			}
			cas_guitar_bridges = {
				desc_id = gtr72_bridge
			}
			cas_guitar_knobs = {
				desc_id = speedknobs
			}
			cas_guitar_pickups = {
				desc_id = emg81dbl
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass16_esp_surveyor_02
			}
			cas_bass_finish = {
				desc_id = bass14_esp_surveyor_d_color
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = bass14_esp_ax_dtl_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_inlay_05
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_head = {
				desc_id = bass14_neckhead_04
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = bass9_neckhead4_dtl_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type1_blk_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass14_bridge_4str_01
			}
			cas_bass_knobs = {
				desc_id = speedster
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = None
			}
			cas_drum_detail = {
				desc_id = None
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0x35ef70f9
		fullname = qs(0x5cb56267)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xdea1af73)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x5d05e7ab
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr82_prs_se1
			}
			cas_guitar_finish = {
				desc_id = gtr78_prs_sc_ld02
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr78_prs_sc_dtl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr78_prs_sc_dtl04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld114_prs_dots
			}
			cas_guitar_head = {
				desc_id = gtr82_neckhead01
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = gtr82_neckhead_01_dtl04
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr82_pguard
			}
			cas_guitar_pickguard_finish = {
				desc_id = custom_color_esp
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_bridges = {
				desc_id = gtr78_bridge01
			}
			cas_guitar_knobs = {
				desc_id = tophat02
			}
			cas_guitar_pickups = {
				desc_id = chrmhum
			}
			cas_bass_body = {
				desc_id = 0xf086e191
			}
			cas_bass_finish = {
				desc_id = 0xb4e66f46
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_22d
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_22_ld110
			}
			cas_bass_head = {
				desc_id = 0x9efa255a
			}
			cas_bass_head_finish = {
				desc_id = 0x2122cdda
			}
			cas_bass_head_detail = {
				desc_id = bass9_neckhead4_dtl_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = 0xfdd9b49c
			}
			cas_bass_pickups = {
				desc_id = 0xbaf1c67b
			}
			cas_bass_bridges = {
				desc_id = hardtail
			}
			cas_bass_knobs = {
				desc_id = speedster
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = None
			}
			cas_drum_detail = {
				desc_id = None
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0xd813f600
		fullname = qs(0x34c37d34)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x5fd78db6)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x3ef5a7db
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr73_sch_s1
			}
			cas_guitar_finish = {
				desc_id = gtr73_sch_s1_ld02
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr73_sch_s1_dtl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22_fret_ld49_shctr_block
			}
			cas_guitar_head = {
				desc_id = gtr73_neckhead_04
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = gtr73_pg1
			}
			cas_guitar_bridges = {
				desc_id = gtr72_bridge
			}
			cas_guitar_knobs = {
				desc_id = speedknobs
			}
			cas_guitar_pickups = {
				desc_id = emg81dbl
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
			}
			cas_bass_finish = {
				desc_id = bs_ibz_sr_ld00
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = none_esp
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
			}
			cas_bass_neck_finish = {
				desc_id = bass_ibz24_inlay_62
				chosen_materials = {
					material1 = teal_5
				}
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = bs_ibz_sr_hd_dtl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = emgj
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = ibz01
			}
			cas_bass_knobs = {
				desc_id = speedster
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = None
			}
			cas_drum_detail = {
				desc_id = None
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0x26ab6f0d
		fullname = qs(0x24f300ab)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x5c7973e8)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x6eb102a0
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			$preset_musician_instrument_hack
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
		}
	}
	{
		Name = gh_rocker_frankenrocker
		fullname = qs(0x1d374fc1)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x66d06c99)
		no_random_pick
		locked
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = frankenrocker
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						material = gtr22_bc_rich_warlock_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = purple_blue_1
							}
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_fd2`
								Color = black_1guitar
								flags = 4
								a = 80
							}
							{
								texture = `tex/models/characters/layers/cag/all_clear2`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
						material = gtr_fretboard24_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/24fret_ld03_bcr_trance`
								flags = 36
								Color = purple_blue_1
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr20_neckhead_beast03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						material = gtr22_neckhead_beast3_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
								flags = 36
								Color = purple_blue_1
							}
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_fad03`
								Color = black_1guitar
								flags = 36
								a = 100
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr22_bridge_whammy1
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_04
			}
			cas_guitar_pickups = {
				desc_id = gtr_prs_chromehum
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_mcswn_swtch1
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_bass_body = {
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						material = bass63_ex_primary
						diffuse
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_12`
								Color = green_1guitar
								flags = 4
								a = 55
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						material = bass_fretboard_24d_primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_clear`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bass63_neckhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
						material = bass63_neckhead_primary
						diffuse
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_dtl_01`
								flags = 36
								Color = green_1guitar
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type1_blk_02
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge_4str_05
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass63_knob_type1
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = singlebasskit
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/drumshell_ds_09`
								flags = 32
								Color = green_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld96`
								flags = 4
								Color = purple_blue_2
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_blackmetal
			}
			cas_mic_stand = {
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		Name = Skeleton
		fullname = qs(0x998b2c00)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_skeleton
		blurb = qs(0xf1526867)
		polaroid = m_fun_skeleton
		locked
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = Skeleton
			}
			cas_male_physique = {
				desc_id = skeletonphysique
			}
			cas_guitar_body = {
				desc_id = gtr21_bc_rich_warbeast
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr21_bc_rich_warbeast_d`
						material = gtr21_bc_rich_warbeast_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_ld1`
								flags = 4
								Color = grey_5guitar
							}
							{
								Color = blue_2
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_fd4`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warbeast_dtl1`
								flags = 4
								Color = blue_2
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_03
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
						material = gtr_fretboard24_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/24fret_ld03_bcr_trance`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr21_neckhead_beast02
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						material = gtr21_neckhead_beast2_primary
						diffuse
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
								flags = 36
							}
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld03`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_dtl02`
								flags = 36
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_emg_pickup1
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch_m
			}
			cas_bass_body = {
				desc_id = bass63_ex
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass63_ex_d`
						material = bass63_ex_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_ld_01`
								flags = 4
								Color = grey_5guitar
							}
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/esp/bass63_ex_dtl_11`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						material = bass_fretboard_24d_primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_clear`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bass63_neckhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass63_neckhead_d`
						material = bass63_neckhead_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_ld_01`
								flags = 36
								Color = grey_5guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass63_neckhead_dtl_06`
								flags = 36
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type1_blk_02
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge_4str_05
			}
			cas_bass_knobs = {
				desc_id = bass63_knob_type1
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = quadbasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_rock
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = gh_rocker_silhouette_gold
		fullname = qs(0xa9148e1e)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xb0cbd961)
		no_random_pick
		locked
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = silhouette_gold
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr10_mcswain_flame
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_mcswain_flame_d`
						material = gtr10_mcswain_flame_primary
						diffuse
						pre_layer = [
							{
								Color = orange_3
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_ld1`
								flags = 4
							}
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_fd2`
								flags = 4
								Color = yellow_1guitar
							}
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_mcswain_flame_dtl2`
								flags = 4
								Color = yellow_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						material = gtr_fretboard_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld70_mcswn_flame`
								flags = 36
								Color = yellow_2guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr10_neckhead_mcswain1
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/mcswain/gtr10_neckhead_mcswain1_d`
						material = gtr10_neckhead_mcswain_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/mcswain/gtr10_nkhd_mcswain_ld1`
								flags = 36
								Color = yellow_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr_bridge_mcswain_6
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr_emg_pickup2
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch_m
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass16_esp_surveyor_02
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\esp\bass14_esp_surveyor_d`
						material = bass14_esp_surveyor_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_ld_01`
								Color = yellow_1guitar
							}
							{
								texture = `tex/models/characters/layers/cab/esp/bass14_esp_ax_dtl_03`
								flags = 4
								Color = yellow_4guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_22d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_22_d_05`
						material = bass_fretboard_22d_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_inlay_06`
								flags = 4
								Color = yellow_2guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bass14_neckhead_04
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass9_neckhead_d_04`
						material = bass14_neckhead_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/esp/bass9_neckhead4_ld_01`
								flags = 36
								Color = yellow_1guitar
							}
						]
					}
				]
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type3_blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass14_bridge_4str_02
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass14_knob_04
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						material = cad_drums_01_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld18`
								flags = 32
								Color = yellow_2guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld59`
								flags = 4
								Color = yellow_2guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = cad_drumsticks_ahead
			}
			cas_mic = {
				desc_id = mic_frequency
			}
			cas_mic_stand = {
				desc_id = mic_stand_spirals
			}
		}
	}
	{
		Name = gh_rocker_blackout
		fullname = qs(0x12b9e0af)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x83231623)
		no_random_pick
		locked
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = silhouette_m
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr75_ibz_xpt
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_ibz_xpt_d`
						material = gtr75_ibz_xpt_primary
						diffuse
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_ibz_xpt_ld02`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard24_d4_02`
						material = gtr_fretboard24_04_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/all_clear2`
								flags = 4
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr75_neckhead_01
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/ibanez/gtr75_neckhead_d`
						material = gtr75_neckhead_01_primary
						diffuse
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/ibanez/gtr75_neckhead_ld02`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr76_bridge
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr78_pickup1
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch_m
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_body = {
				desc_id = bas_ibz_sr505
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\ibanez\bs_ibz_sr_body`
						material = bs_ibz_sr_body_primary
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_ld00`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						material = bass_fretboard_sr24d_primary
						diffuse
						pre_layer = [
							{
								Color = grey_4
								texture = `tex/models/characters/layers/cab/esp/bass_fretboard_clear`
								flags = 4
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/ibanez/bs_ibz_sr_head`
						material = bass_neckhead_ibz_sr_primary
						diffuse
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/ibanez/bs_ibz_sr_hd_dtl07`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = ibz_type1
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bas_brdg_capsule
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = knurled
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = singlebasskit
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						material = cad_drums_01_bassdrum
						diffuse
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_dark
			}
			cas_mic_stand = {
				desc_id = mic_stand_blackmetal
			}
		}
	}
	{
		Name = 0x47f4d11c
		fullname = qs(0xe7c54951)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		intro_anims = [
			0x38b7f748
		]
		win_anims = [
			0x38b7f748
		]
		lose_anims = [
			0xd9632956
		]
		preset_icon = photo_eddie
		blurb = qs(0x65d18445)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xd3959486
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = 0x9ba6f881
		fullname = qs(0x5cb56267)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		intro_anims = [
			0x133d2757
		]
		win_anims = [
			0x133d2757
		]
		lose_anims = [
			0x3140d22e
		]
		preset_icon = photo_eddie
		blurb = qs(0xdea1af73)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x5d05e7ab
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = 0x49d2384e
		fullname = qs(0xe7c54951)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		intro_anims = [
			0x38b7f748
		]
		win_anims = [
			0x38b7f748
		]
		lose_anims = [
			0xd9632956
		]
		preset_icon = photo_eddie
		blurb = qs(0x65d18445)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0xd3959486
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = 0x0c83f448
		fullname = qs(0x5cb56267)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		intro_anims = [
			0x133d2757
		]
		win_anims = [
			0x133d2757
		]
		lose_anims = [
			0x3140d22e
		]
		preset_icon = photo_eddie
		blurb = qs(0xdea1af73)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x5d05e7ab
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			$preset_musician_instrument_hack
		}
	}
	{
		Name = 0x908cf9f8
		fullname = qs(0x7e29918f)
		allowed_parts = [
			drum
		]
		intro_anims = [
			d_jeff_win_waving
		]
		win_anims = [
			d_jeff_win_waving
		]
		lose_anims = [
			d_jeff_lose_depressed
		]
		preset_icon = photo_eddie
		blurb = qs(0x5fd78db6)
		no_random_pick
		locked
		selection_not_allowed
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = 0x3ef5a7db
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_physique = {
				desc_id = malephysique
			}
			$preset_musician_instrument_hack
			cas_drums = {
				desc_id = 0xb55d6fa6
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = 0xeaeb9e1a
			}
			cas_drum_detail = {
				desc_id = 0x973d4a7d
			}
		}
	}
	{
		Name = 0x6afc4e96
		fullname = qs(0xf4cfe004)
		allowed_parts = [
			guitar
		]
		preset_icon = photo_eddie
		blurb = qs(0xc747b4cc)
		no_random_pick
		locked
		selection_not_allowed
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_body = {
				desc_id = gh4_car_male
			}
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_body = {
				desc_id = gh4_car_male
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						material = car_male_head
						cas_1
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_eyeliner_01`
								flags = 4
							}
						]
					}
				]
				bones = {
					eyeshape = 0.0
					eyecornershape = 0.1
					eyeposition = -0.43
					eyedistance = -0.3
					mouthscale = 0.176
					eyebrowsize = 0.625
					eyebrowdistance = -0.9
					browposition = 0.2
					eyebrowangle = 0.3
					chinwidth = 0.9
					nosewidth = 0.23300001
					mouthposition = 0.237
					eyescale = 0.614
					eyeangle = 0.5
					facefullness = 0.7
				}
			}
			cas_eyes = {
				desc_id = eyes_brown
			}
			cas_male_hair = {
				desc_id = m_glam_hair_izzy1
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_torso = {
				desc_id = m_pop_torso_suit
				chosen_materials = {
					material1 = carblack_1
					material4 = red_2
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_axel_1
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_jcashchelsea
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = None
			}
			$preset_musician_instrument_hack
			cas_guitar_body = {
				desc_id = gtr79_prs_cstm24
			}
			cas_guitar_finish = {
				desc_id = gtr79_prs_ctm24_dtl06
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr79_prs_ctm24_ld01
				chosen_materials = {
					material1 = orange_5
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr79_prs_ctm24_ld03
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld114_prs_dots
			}
			cas_guitar_head = {
				desc_id = gtr82_neckhead01
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = gtr82_neckhead_06
			}
			cas_guitar_head_fade = {
				desc_id = gtr82_neckhead_01_ld03
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr79_whammy
			}
			cas_guitar_knobs = {
				desc_id = lampshade
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_guitar_pickups = {
				desc_id = chrmhum
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_guitar_misc = {
				desc_id = misc_switch
			}
		}
	}
	{
		Name = 0x0e82efc2
		fullname = qs(0x94725ecc)
		allowed_parts = [
			bass
		]
		preset_icon = photo_eddie
		blurb = qs(0x8864aa53)
		no_random_pick
		locked
		selection_not_allowed
		appearance = {
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					nosewidth = 0.2
					noselength = 0.6
					noseangle = 0.367
					nosesize = 0.8
					nosenostrilsize = 0.7
					noseposition = 0.77199996
					mouthposition = 0.3
					mouthdepth = 0.1
					mouthscale = 0.3
					lipshapeupper = 1.0
					lowerlipthickness = 0.0
					mouthangle = 0.6
					eyecornershape = 0.6
					eyeshape = 0.9
					eyescale = 0.514
					eyeposition = -0.13
					eyedistance = -0.414
					eyeangle = 0.561
					eyebrowsize = 0.0
					eyebrowdistance = -0.556
					browposition = 0.0
					eyebrowangle = 0.8
					chinwidth = 0.0
					chinprominence = 0.4
					chinheight = 0.2
					cheekboneprominence = 0.6
					chinangle = 0.5
					cheekbonedepth = 0.1
					browdepth = 0.0
				}
			}
			cas_eyes = {
				desc_id = eyes_hazel
			}
			cas_male_hair = {
				desc_id = m_metl_hair_axel_4
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_stub
			}
			cas_male_torso = {
				desc_id = m_rock_torso_jcashvest
				chosen_materials = {
					material3 = blue_5
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_tooskinny
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_vansh_bw
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			$preset_musician_instrument_hack
			cas_bass_body = {
				desc_id = bas_ibz_sr505
			}
			cas_bass_finish = {
				desc_id = bs_ibz_sr_ld00
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = none_esp
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
			}
			cas_bass_neck_finish = {
				desc_id = bass_ibz24_inlay_62
				chosen_materials = {
					material1 = teal_5
				}
			}
			cas_bass_head = {
				desc_id = bas_ibz_sr_head01
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = bs_ibz_sr_hd_dtl02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = emgj
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = ibz01
			}
			cas_bass_knobs = {
				desc_id = speedster
				chosen_materials = {
					material1 = black_1guitar
				}
			}
		}
	}
	{
		Name = 0x2564c7ff
		fullname = qs(0xcba094fb)
		allowed_parts = [
			drum
		]
		preset_icon = photo_eddie
		blurb = qs(0x63d27e1b)
		no_random_pick
		locked
		selection_not_allowed
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					nosewidth = 0.2
					noselength = 0.6
					nosenostrilsize = 0.7
					eyecornershape = 0.6
					eyeshape = 0.9
					eyebrowsize = 0.0
					eyebrowdistance = -0.556
					browposition = 0.0
					chinwidth = 0.0
					chinprominence = 0.4
					chinheight = 0.2
					cheekboneprominence = 0.6
					chinangle = 0.5
					cheekbonedepth = 0.1
					browdepth = 0.0
					eyeangle = 0.461
					eyedistance = 0.186
					eyescale = 0.7
					nosesize = 0.6
					nosebridge = 0.6
					nosetiplength = 0.167
					nosetipangle = 0.6
					noseangle = 0.467
					lipshapeupper = 0.0
					mouthposition = 0.6
					mouthscale = 0.3
					jawprominence = 0.9
					earsize = 0.333
					earprominence = 0.32600003
					eyebrowangle = 0.4
					mouthangle = 0.6
					lowerlipthickness = 0.5
					mouthdepth = 0.4
					eyeposition = -0.8
					noseposition = 1.0
				}
			}
			cas_eyes = {
				desc_id = eyes_blue
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee01
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_torso = {
				desc_id = m_metl_torso_unbttond
			}
			cas_male_legs = {
				desc_id = m_punk_legs_jny_1
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_conversecs
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lrings
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rrings
			}
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			$preset_musician_instrument_hack
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = None
			}
			cas_drum_detail = {
				desc_id = None
				chosen_materials = {
					material1 = black_1guitar
				}
			}
		}
	}
	{
		Name = 0x01054cb2
		fullname = qs(0xe08151c2)
		allowed_parts = [
			guitar
		]
		preset_icon = photo_eddie
		blurb = qs(0xcd3f49a2)
		no_random_pick
		locked
		selection_not_allowed
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					nosewidth = 0.2
					noselength = 0.6
					noseangle = 0.367
					nosesize = 0.8
					nosenostrilsize = 0.7
					noseposition = 0.77199996
					mouthposition = 0.3
					mouthdepth = 0.1
					mouthscale = 0.3
					lipshapeupper = 1.0
					lowerlipthickness = 0.0
					mouthangle = 0.6
					eyecornershape = 0.6
					eyeshape = 0.9
					eyescale = 0.514
					eyeposition = -0.13
					eyedistance = -0.414
					eyeangle = 0.561
					eyebrowsize = 0.0
					eyebrowdistance = -0.556
					browposition = 0.0
					eyebrowangle = 0.8
					chinwidth = 0.0
					chinprominence = 0.4
					chinheight = 0.2
					cheekboneprominence = 0.6
					chinangle = 0.5
					cheekbonedepth = 0.1
					browdepth = 0.0
				}
			}
			cas_eyes = {
				desc_id = eyes_green
			}
			cas_male_hair = {
				desc_id = m_metl_hair_lars
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_torso = {
				desc_id = m_metl_torso_unbttond
				chosen_materials = {
					material1 = blue_3
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_tooskinny
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_conversecs
			}
			cas_male_acc_left = {
				desc_id = m_rock_acc_lwatch
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rstrap
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			$preset_musician_instrument_hack
			cas_guitar_body = {
				desc_id = gtr38_wv
			}
			cas_guitar_finish = {
				desc_id = gtr37_rw_d_color
				chosen_materials = {
					material1 = yellow_orange_3
				}
			}
			cas_guitar_body_detail = {
				desc_id = gh5_none
			}
			cas_guitar_body_fade = {
				desc_id = fade_none
			}
			cas_guitar_neck = {
				desc_id = gtr_fboard_22
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld86_esp_dots
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head = {
				desc_id = gtr37_neckhead
			}
			cas_guitar_head_finish = {
				desc_id = gtr37_nekhed
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = gtr37_pguard01
			}
			cas_guitar_bridges = {
				desc_id = gtr37_bridge
			}
			cas_guitar_knobs = {
				desc_id = gtr37_knobs01
			}
			cas_guitar_pickups = {
				desc_id = gtr37_pickup1
			}
		}
	}
	{
		Name = 0x8fdc240e
		fullname = qs(0x0a3206ae)
		allowed_parts = [
			bass
		]
		preset_icon = photo_eddie
		blurb = qs(0x2dfc522b)
		no_random_pick
		locked
		selection_not_allowed
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_body = {
				desc_id = gh4_car_male
				chosen_materials = {
					skin = skin_asian3
				}
				bones = {
					nosewidth = 0.2
					noselength = 0.6
					nosenostrilsize = 0.7
					eyecornershape = 0.6
					eyeshape = 0.9
					eyebrowsize = 0.0
					eyebrowdistance = -0.556
					browposition = 0.0
					chinwidth = 0.0
					chinprominence = 0.4
					chinheight = 0.2
					cheekboneprominence = 0.6
					chinangle = 0.5
					cheekbonedepth = 0.1
					browdepth = 0.0
					eyeangle = 0.461
					eyedistance = 0.186
					eyescale = 0.7
					nosesize = 0.6
					nosebridge = 0.6
					nosetiplength = 0.167
					nosetipangle = 0.6
					noseangle = 0.467
					lipshapeupper = 0.0
					mouthposition = 0.6
					mouthscale = 0.3
					jawprominence = 0.9
					earsize = 0.333
					earprominence = 0.32600003
					eyebrowangle = 0.4
					mouthangle = 0.6
					lowerlipthickness = 0.5
					mouthdepth = 0.4
					eyeposition = -0.8
					noseposition = 1.0
				}
			}
			cas_eyes = {
				desc_id = eyes_blue
			}
			cas_male_hair = {
				desc_id = m_punk_hair_jny_2
			}
			cas_male_torso = {
				desc_id = m_torso_tshirt
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_male_legs = {
				desc_id = m_rock_legs_jeans
				chosen_materials = {
					material1 = grey_4
				}
			}
			cas_male_shoes = {
				desc_id = m_metl_shoe_clscrunr
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_acc_left = {
				desc_id = m_rock_acc_lwatch
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rstripe
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			$preset_musician_instrument_hack
			cas_bass_body = {
				desc_id = bass16_esp_surveyor_02
			}
			cas_bass_finish = {
				desc_id = bass14_esp_surveyor_d_color
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_body_detail = {
				desc_id = none_esp
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_inlay_05
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_head = {
				desc_id = bass14_neckhead_04
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = bass9_neckhead4_dtl_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type1_blk_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass14_bridge_4str_01
			}
			cas_bass_knobs = {
				desc_id = speedster
				chosen_materials = {
					material1 = black_1guitar
				}
			}
		}
	}
	{
		Name = 0xa43a0c33
		fullname = qs(0x55e0cc99)
		allowed_parts = [
			drum
		]
		preset_icon = photo_eddie
		blurb = qs(0xc64a8663)
		no_random_pick
		locked
		selection_not_allowed
		appearance = {
			body_preset_index = 0
			genre = pop
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_body = {
				desc_id = gh4_car_male
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						material = car_male_head
						cas_1
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/male/makeup/car_male_eyeliner_01`
								flags = 4
							}
						]
					}
				]
				bones = {
					nosewidth = 0.2
					noselength = 0.6
					nosenostrilsize = 0.7
					eyecornershape = 0.6
					eyebrowsize = 0.0
					eyebrowdistance = -0.556
					browposition = 0.0
					chinwidth = 0.0
					chinheight = 0.2
					cheekboneprominence = 0.6
					chinangle = 0.5
					cheekbonedepth = 0.1
					browdepth = 0.0
					eyedistance = 0.186
					nosetiplength = 0.167
					nosetipangle = 0.6
					noseangle = 0.467
					lipshapeupper = 0.0
					earsize = 0.333
					eyebrowangle = 0.4
					mouthangle = 0.6
					lowerlipthickness = 0.5
					mouthdepth = 0.4
					eyescale = 0.5
					eyeshape = 0.0
					eyeangle = 0.661
					eyeposition = 0.0
					nosesize = 0.4
					nosebridge = 0.0
					noseposition = 0.3
					mouthposition = 0.0
					mouthscale = 0.5
					jawprominence = 0.0
					chinprominence = 0.9
					earprominence = 0.126
				}
				chosen_materials = {
					eyebrows = yellow_4
					skin = skin_asian4
				}
			}
			cas_eyes = {
				desc_id = eyes_hazel
			}
			cas_male_hair = {
				desc_id = m_metl_hair_axel_4
			}
			cas_male_torso = {
				desc_id = m_torso_layered_nostripe
				chosen_materials = {
					material1 = yellow_green_2
					material2 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_jeans
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_vansh_bw
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rstrap
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			$preset_musician_instrument_hack
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_tama03
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_15
				chosen_materials = {
					material1 = black_1guitar
				}
			}
		}
	}
	{
		Name = worstfemalevocalist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_vocals_appearance
			$worst_female_appearance_hack
		}
	}
	{
		Name = worstfemaledrummer
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_drum_appearance
			$worst_female_appearance_hack
		}
	}
	{
		Name = worstfemaleguitarist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_guitar_appearance
			$worst_female_appearance_hack
		}
	}
	{
		Name = worstfemalebassist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_bass_appearance
			$worst_female_appearance_hack
		}
	}
	{
		Name = worstmalevocalist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_vocals_appearance
			$worst_male_appearance_hack
		}
	}
	{
		Name = worstmaledrummer
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_drum_appearance
			$worst_male_appearance_hack
		}
	}
	{
		Name = worstmaleguitarist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_guitar_appearance
			$worst_male_appearance_hack
		}
	}
	{
		Name = worstmalebassist
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_bass_appearance
			$worst_male_appearance_hack
		}
	}
	{
		Name = emptyguy
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = $empty_appearance
	}
]
preset_mii_guitarist_profile = {
	Name = mii
	fullname = qs(0x80b85738)
	allowed_parts = [
		vocals
		vocals
		guitar
		bass
	]
	selection_not_allowed
	appearance = {
		cas_body = {
			desc_id = gh4_mii
		}
		cas_male_base_torso = {
			desc_id = mii_guitarist_male
		}
		cas_guitar_body = {
			desc_id = mii_guitar
		}
		cas_bass_body = {
			desc_id = mii_bass
		}
	}
}
preset_mii_drummer_profile = {
	Name = mii_drummer
	fullname = qs(0x04c7925b)
	allowed_parts = [
		vocals
		drums
		guitar
		bass
	]
	selection_not_allowed
	appearance = {
		cas_body = {
			desc_id = gh4_mii_drummer
		}
		cas_male_base_torso = {
			desc_id = mii_drummer_male
		}
		cas_drums = {
			desc_id = mii_drums
		}
	}
}
preset_musician_profiles_debug = [
	{
		Name = silhouette
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
			cas_full_body = {
				desc_id = silhouette_m
			}
		}
	}
]
