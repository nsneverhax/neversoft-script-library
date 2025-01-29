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
	cas_drums_sticks_l = {
		desc_id = drm_stick_l
	}
	cas_drums_sticks_r = {
		desc_id = drm_stick_r
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
preset_musician_profiles_modifiable = [
	{
		Name = Axel
		fullname = qs(0x0539af5a)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_axel
		blurb = qs(0x187e79b7)
		ghrocker
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = axel_1
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_male_intro_anim = {
				desc_id = intro_pointing
			}
			cas_male_win_anim = {
				desc_id = win_kick
			}
			cas_male_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_guitar_body = {
				desc_id = gtr12_esp_v_01
			}
			cas_guitar_finish = {
				desc_id = gtr12_esp_v_series_ld_01_color
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr12_esp_v_series_dtl_7b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr12_esp_v_series_dtl_7a
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld03_hero_tribal
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head = {
				desc_id = gtr12_neckhead_07
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = gtr33_nhead_dtl03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr12_bridge_1
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr12_esp_knob_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr1_esp_emg_pkup_2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass_schect_030
			}
			cas_bass_finish = {
				desc_id = bs_sch_bod04_ld01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = bs_sch_bod04_dtl21
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_bod04_dtl05
				chosen_materials = {
					material1 = orange_5
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch_inl_ld44
			}
			cas_bass_head = {
				desc_id = bs_sch_030_nhead01
			}
			cas_bass_head_finish = {
				desc_id = gh5_solidcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = bs_sch_04_hd_dtl09
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_030_pga
			}
			cas_bass_pickups = {
				desc_id = basslines1b
			}
			cas_bass_bridges = {
				desc_id = schbb104
			}
			cas_bass_knobs = {
				desc_id = speedster
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_sixties
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld61
				chosen_materials = {
					material1 = yellow_orange_2
				}
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld25
				chosen_materials = {
					material1 = yellow_orange_3
				}
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_bass_highway = {
				desc_id = axelhighway
			}
			cas_guitar_highway = {
				desc_id = axelhighway
			}
			cas_drums_highway = {
				desc_id = axelhighway
			}
		}
	}
	{
		Name = Casey
		fullname = qs(0xd88aefc7)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_casey
		blurb = qs(0x5a515be2)
		ghrocker
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = casey_1
			}
			cas_physique = {
				desc_id = femalephysique
			}
			cas_female_win_anim = {
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
			cas_guitar_body = {
				desc_id = gtr12_esp_v_01
			}
			cas_guitar_finish = {
				desc_id = gtr12_esp_v_series_ld_01_color
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr12_esp_v_series_dtl_19
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr12_esp_v_series_dtl_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld03_hero_tribal
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_head = {
				desc_id = gtr12_neckhead_07
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = gtr33_nhead_dtl03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_fade = {
				desc_id = gtr33_nhead_dtl01
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr12_bridge_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr12_esp_knob_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr1_esp_emg_pkup_2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
			}
			cas_bass_finish = {
				desc_id = bass9_esp_ax_d_color
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_body_detail = {
				desc_id = bass9_esp_ax_dtl_19
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body_fade = {
				desc_id = bass9_esp_ax_dtl_03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24black
			}
			cas_bass_neck_finish = {
				desc_id = neck_inlay_fl_blank
			}
			cas_bass_head = {
				desc_id = bass9_neckhead_01
			}
			cas_bass_head_finish = {
				desc_id = gh5_solidcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = none_esp
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type1_blk_02
			}
			cas_bass_bridges = {
				desc_id = bass9_bridge_4str_01
			}
			cas_bass_knobs = {
				desc_id = bass9_esp_knob_10_04
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_sixties
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld65
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld39
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_bass_highway = {
				desc_id = caseyhighway
			}
			cas_guitar_highway = {
				desc_id = caseyhighway
			}
			cas_drums_highway = {
				desc_id = caseyhighway
			}
		}
	}
	{
		Name = Izzy
		fullname = qs(0x3ba5cbc5)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_izzy
		blurb = qs(0xb689556b)
		ghrocker
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = izzy_1
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_male_intro_anim = {
				desc_id = intro_hype
			}
			cas_male_win_anim = {
				desc_id = win_kungfu
			}
			cas_male_lose_anim = {
				desc_id = lose_tantrum
			}
			cas_guitar_body = {
				desc_id = gtr94_dr_tomboy
			}
			cas_guitar_finish = {
				desc_id = gtr94_dr_tomboy_ld06
			}
			cas_guitar_body_detail = {
				desc_id = gtr94_dr_tomboy_dtl14
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr94_dr_tomboy_dtl03
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld125_dr_elite
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head = {
				desc_id = gtr94_dr_neckhead01
			}
			cas_guitar_head_finish = {
				desc_id = gtr93_neckhead01_ld07
			}
			cas_guitar_head_detail = {
				desc_id = gh5_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr94_bridge
			}
			cas_guitar_knobs = {
				desc_id = starlights
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = hz
			}
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
			}
			cas_bass_finish = {
				desc_id = bass15_mcswain_machine_ld2
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_21a
			}
			cas_bass_neck_finish = {
				desc_id = 22fret_ld06_mcswn_bolts
			}
			cas_bass_head = {
				desc_id = bass15_neckhead_mcswain1
			}
			cas_bass_head_finish = {
				desc_id = bass15_nkhd_mcswain_ld2
			}
			cas_bass_head_detail = {
				desc_id = none_esp
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = basslines1b
			}
			cas_bass_bridges = {
				desc_id = mcswainbullet
			}
			cas_bass_knobs = {
				desc_id = chromedomes
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld21
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld48
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_bass_highway = {
				desc_id = izzyhighway
			}
			cas_guitar_highway = {
				desc_id = izzyhighway
			}
			cas_drums_highway = {
				desc_id = izzyhighway
			}
		}
	}
	{
		Name = Judy
		fullname = qs(0xa9028c21)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_judy
		blurb = qs(0x7dd6fbb1)
		ghrocker
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = Judy_1
			}
			cas_physique = {
				desc_id = femalephysique
			}
			cas_female_win_anim = {
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
			cas_guitar_body = {
				desc_id = gtr73_sch_s1
			}
			cas_guitar_finish = {
				desc_id = 0x798766f6
			}
			cas_guitar_body_detail = {
				desc_id = gh5_none
			}
			cas_guitar_body_fade = {
				desc_id = fade_none
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22_fret_ld34_shctr_ladyluck
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head = {
				desc_id = gtr73_neckhead_01
			}
			cas_guitar_head_finish = {
				desc_id = gtr73_neckhead_ld01
			}
			cas_guitar_head_detail = {
				desc_id = gh5_none
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = gtr73_pg1
			}
			cas_guitar_pickguard_finish = {
				desc_id = black
			}
			cas_guitar_bridges = {
				desc_id = gtr71_bridge
			}
			cas_guitar_knobs = {
				desc_id = speedster
			}
			cas_guitar_pickups = {
				desc_id = emg81dbl
			}
			cas_guitar_misc = {
				desc_id = misc_switch
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl01
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = bs_sch_mt_ld02
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_mt_ld09
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_21a
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch22_inl_ld32
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
				desc_id = none_esp
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = basslines1b
			}
			cas_bass_bridges = {
				desc_id = schbb104
			}
			cas_bass_knobs = {
				desc_id = knurled
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_sixties
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld64
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld53
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_bass_highway = {
				desc_id = judyhighway
			}
			cas_guitar_highway = {
				desc_id = judyhighway
			}
			cas_drums_highway = {
				desc_id = judyhighway
			}
		}
	}
	{
		Name = Johnny
		fullname = qs(0x525fe42c)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_johnny
		blurb = qs(0x3292ac81)
		ghrocker
		appearance = {
			genre = punk
			cas_full_body = {
				desc_id = Johnny_1
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_male_intro_anim = {
				desc_id = intro_generic1
			}
			cas_male_win_anim = {
				desc_id = win_kick
			}
			cas_male_lose_anim = {
				desc_id = lose_kick
			}
			cas_guitar_body = {
				desc_id = gtr33_boris
			}
			cas_guitar_finish = {
				desc_id = gtr_33_snakskul
			}
			cas_guitar_body_detail = {
				desc_id = gh5_none
			}
			cas_guitar_body_fade = {
				desc_id = fade_none
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld103_esp_skulls2
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head = {
				desc_id = gtr33_nekhed_01
			}
			cas_guitar_head_finish = {
				desc_id = gtr4_neckhead_d_06
			}
			cas_guitar_head_detail = {
				desc_id = gh5_none
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
				desc_id = gtr_33_knobs_a
			}
			cas_guitar_pickups = {
				desc_id = gtr30_emg
			}
			cas_bass_body = {
				desc_id = bass63_ex
			}
			cas_bass_finish = {
				desc_id = bass63_ex_ld_09_color
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_bass_body_detail = {
				desc_id = bass63_ex_dtl_7b
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_body_fade = {
				desc_id = bass63_ex_dtl_7a
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_21d
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_inlay_06
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_head = {
				desc_id = bass63_neckhead
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_bass_head_detail = {
				desc_id = none_esp
			}
			cas_bass_head_fade = {
				desc_id = bass9_neckhead5_dtl_04
				chosen_materials = {
					material1 = grey_2guitar
				}
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
				desc_id = bass_bridges_01
			}
			cas_bass_knobs = {
				desc_id = bass63_knob_type1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_13
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld20
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_bass_highway = {
				desc_id = johnnyhighway
			}
			cas_guitar_highway = {
				desc_id = johnnyhighway
			}
			cas_drums_highway = {
				desc_id = johnnyhighway
			}
		}
	}
	{
		Name = Lars
		fullname = qs(0x9dd7644f)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_lars
		blurb = qs(0x3c884eac)
		ghrocker
		appearance = {
			genre = `black	metal`
			cas_full_body = {
				desc_id = Lars_1
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_male_intro_anim = {
				desc_id = intro_scary
			}
			cas_male_win_anim = {
				desc_id = win_scary
			}
			cas_male_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_guitar_body = {
				desc_id = gtr21_bc_rich_warbeast
			}
			cas_guitar_finish = {
				desc_id = gtr_bc_rich_warbeast_ld6
			}
			cas_guitar_body_detail = {
				desc_id = gh5_none
			}
			cas_guitar_body_fade = {
				desc_id = fade_none
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld03_bcr_trance
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head = {
				desc_id = gtr21_neckhead_beast01
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = gtr20_neckhead_dtl01
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_head_fade = {
				desc_id = head_fade_none
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = bcr_thru
			}
			cas_guitar_knobs = {
				desc_id = chromedomes
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = duncan59dbl
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
			}
			cas_bass_finish = {
				desc_id = bass9_esp_ax_d_color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = bass9_esp_ax_dtl_01
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24black
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_24_inlay_05
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_head = {
				desc_id = bass9_neckhead_01
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = bass9_neckhead_dtl_01
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = bass9_bridge_4str_01
			}
			cas_bass_knobs = {
				desc_id = bass9_esp_knob_10_04
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_sixties
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld35
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld43
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_bass_highway = {
				desc_id = larshighway
			}
			cas_guitar_highway = {
				desc_id = larshighway
			}
			cas_drums_highway = {
				desc_id = larshighway
			}
		}
	}
	{
		Name = clive
		fullname = qs(0xccb97235)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_clive
		blurb = qs(0xac8c05ed)
		ghrocker
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = clive_1
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_male_intro_anim = {
				desc_id = intro_generic3
			}
			cas_male_win_anim = {
				desc_id = win_generic2
			}
			cas_male_lose_anim = {
				desc_id = lose_generic
			}
			cas_guitar_body = {
				desc_id = gtr38_wv
			}
			cas_guitar_finish = {
				desc_id = gtr37_rw_d_color
				chosen_materials = {
					material1 = navy_3
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
			cas_bass_body = {
				desc_id = bs_sch_t_body
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl02
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_mt_ld04
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch_inl_ld42
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = emg35double
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_01
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld14
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_bass_highway = {
				desc_id = winstonhighway
			}
			cas_guitar_highway = {
				desc_id = winstonhighway
			}
			cas_drums_highway = {
				desc_id = winstonhighway
			}
		}
	}
	{
		Name = pandora
		fullname = qs(0xd26ebef4)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_pandora
		blurb = qs(0x6b2b1a76)
		ghrocker
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = pandora_1
			}
			cas_physique = {
				desc_id = femalephysique
				bones = {
					physique = 0.0
				}
			}
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
			cas_female_win_anim = {
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_guitar_body = {
				desc_id = gtr75_ibz_xpt
			}
			cas_guitar_finish = {
				desc_id = gtr75_ibz_xpt_ld02
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr75_ibz_xpt_dtl01
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr75_ibz_xpt_dtl03
				chosen_materials = {
					material1 = blue_1
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_02
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld63_ibz_diamond
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head = {
				desc_id = gtr75_neckhead_01
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
				desc_id = gtr75_neckhead_dtl03
				chosen_materials = {
					material1 = blue_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = ibz_pu_edgezero
			}
			cas_guitar_knobs = {
				desc_id = chickenheads
			}
			cas_guitar_pickups = {
				desc_id = humandrail
				chosen_materials = {
					material1 = blue_3
				}
			}
			cas_guitar_misc = {
				desc_id = misc_switch
			}
			cas_bass_body = {
				desc_id = bass17_esp_ec_01
			}
			cas_bass_finish = {
				desc_id = bass17_esp_ec_ld_11
				chosen_materials = {
					material1 = blue_1
				}
			}
			cas_bass_body_detail = {
				desc_id = bass17_esp_ax_dtl_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24black
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_24_inlay_01
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
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = bass9_neckhead3_dtl_01
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
				desc_id = bass9_pkup_type3_blk_2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge_4str_05
			}
			cas_bass_knobs = {
				desc_id = bass17_knob_02
			}
			cas_mic = {
				desc_id = mic_blackmetal
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld11
				chosen_materials = {
					material1 = navy_1
				}
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld31
				chosen_materials = {
					material1 = navy_3
				}
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_bass_highway = {
				desc_id = judyhighway
			}
			cas_guitar_highway = {
				desc_id = judyhighway
			}
			cas_drums_highway = {
				desc_id = judyhighway
			}
		}
	}
	{
		Name = eddie
		fullname = qs(0x91c2e6b5)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_eddie
		blurb = qs(0x1e1ea82c)
		ghrocker
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = eddie_1
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_male_intro_anim = {
				desc_id = intro_elvis
			}
			cas_male_win_anim = {
				desc_id = win_elvis
			}
			cas_male_lose_anim = {
				desc_id = lose_kick
			}
			cas_guitar_body = {
				desc_id = gtr82_prs_se1
			}
			cas_guitar_finish = {
				desc_id = gtr78_prs_sc_ld02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr78_prs_sc_dtl7a
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr78_prs_sc_dtl7b
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld115_prs_bats
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_guitar_head = {
				desc_id = gtr82_neckhead01
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = gtr82_neckhead_01_dtl04
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr82_pguard
			}
			cas_guitar_pickguard_finish = {
				desc_id = custom_color_esp
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_guitar_bridges = {
				desc_id = gtr78_straightbridge
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = dice
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_guitar_pickups = {
				desc_id = soap
			}
			cas_bass_body = {
				desc_id = bass_schect_030
			}
			cas_bass_finish = {
				desc_id = bs_sch_bod04_ld01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = bs_sch_bod04_dtl11
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_21d
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch22_inl_ld47
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_bass_head = {
				desc_id = bs_sch_030_nhead01
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = none_gh5
			}
			cas_bass_head_fade = {
				desc_id = bs_sch_04_hd_dtl05
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_030_pga
			}
			cas_bass_pickups = {
				desc_id = emgj
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_bridges = {
				desc_id = capsule
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_knobs = {
				desc_id = dice
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld46
				chosen_materials = {
					material1 = red_orange_1
				}
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld16
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
			cas_bass_highway = {
				desc_id = caseyhighway
			}
			cas_guitar_highway = {
				desc_id = caseyhighway
			}
			cas_drums_highway = {
				desc_id = caseyhighway
			}
		}
	}
	{
		Name = metalhead
		fullname = qs(0x6fae039b)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = 0x20d5ee57
		blurb = qs(0x00781a77)
		locked
		ghrocker
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = 0xd0228944
			}
			cas_physique = {
				desc_id = malephysique
				additional_bone_transforms = [
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, -0.15, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, -0.15, 0.0)
						}
					}
				]
			}
			cas_bass_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_guitar_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_drums_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_gems = {
				desc_id = gem_set_01
			}
			cas_guitar_body = {
				desc_id = 0xf3275b71
			}
			cas_guitar_neck = {
				desc_id = rocket_fretboard
			}
			cas_guitar_head = {
				desc_id = rocket_neckhead01
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = customnone
			}
			cas_guitar_knobs = {
				desc_id = guitarnone
			}
			cas_guitar_pickups = {
				desc_id = rocket_dome
			}
			cas_bass_body = {
				desc_id = bass16_esp_surveyor_02
			}
			cas_bass_finish = {
				desc_id = bass14_esp_ax_ld_11
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_bass_body_detail = {
				desc_id = bass14_esp_ax_dtl_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_22b
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_inlay_06
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
				desc_id = bass14_bridge_4str_02
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass14_knob_03
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
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
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0xf650b8fb
		fullname = qs(0xd9275462)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = 0xa3efcfd3
		blurb = qs(0x59d77608)
		locked
		ghrocker
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = 0x5e0fb439
			}
			cas_physique = {
				desc_id = femalephysique
				additional_bone_transforms = [
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, -0.1, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, -0.1, 0.0)
						}
					}
				]
			}
			cas_bass_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_guitar_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_drums_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_gems = {
				desc_id = gem_set_01
			}
			cas_guitar_body = {
				desc_id = 0xf3275b71
			}
			cas_guitar_neck = {
				desc_id = rocket_fretboard
			}
			cas_guitar_head = {
				desc_id = rocket_neckhead01
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = customnone
			}
			cas_guitar_knobs = {
				desc_id = guitarnone
			}
			cas_guitar_pickups = {
				desc_id = rocket_dome
			}
			cas_bass_body = {
				desc_id = bass16_esp_surveyor_02
			}
			cas_bass_finish = {
				desc_id = bass14_esp_ax_ld_11
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_bass_body_detail = {
				desc_id = bass14_esp_ax_dtl_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_22b
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_inlay_06
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
				desc_id = bass14_bridge_4str_02
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass14_knob_03
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
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
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0x8a5d6de9
		fullname = qs(0xca13039a)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		locked
		preset_icon = 0x20d5ee57
		blurb = qs(0xc8ba2436)
		ghrocker
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = 0x22c1cb75
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_bass_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_guitar_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_drums_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_gems = {
				desc_id = gem_set_01
			}
			cas_guitar_body = {
				desc_id = gtr82_prs_se1
			}
			cas_guitar_finish = {
				desc_id = gtr78_prs_sc_ld03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr78_prs_sc_dtl20
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_guitar_body_fade = {
				desc_id = fade_none
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld115_prs_bats
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_guitar_head = {
				desc_id = gtr82_neckhead01
			}
			cas_guitar_head_finish = {
				desc_id = gtr82_neckhead_01_ld01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = gtr82_neckhead_06
				chosen_materials = {
					material1 = grey_2guitar
				}
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
				desc_id = shell2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_bridges = {
				desc_id = gtr79_whammy
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = speedknobs
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = dantiqsngl
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
			}
			cas_bass_finish = {
				desc_id = bass15_mcswain_machine_ld4
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24black
			}
			cas_bass_neck_finish = {
				desc_id = 22fret_ld06_mcswn_bolts
			}
			cas_bass_head = {
				desc_id = bass15_neckhead_mcswain1
			}
			cas_bass_head_finish = {
				desc_id = bass15_nkhd_mcswain_ld4
			}
			cas_bass_head_detail = {
				desc_id = none_esp
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = basslines1b
			}
			cas_bass_bridges = {
				desc_id = mcswainbullet
			}
			cas_bass_knobs = {
				desc_id = chromedomes
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld06
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld28
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0xada2d6d1
		fullname = qs(0x97ce23c5)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		locked
		preset_icon = 0x20d5ee57
		blurb = qs(0x45165d26)
		ghrocker
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = 0x36fc4dab
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_bass_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_guitar_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_drums_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_gems = {
				desc_id = gem_set_01
			}
			cas_guitar_body = {
				desc_id = gtr70_sch_ultra
			}
			cas_guitar_finish = {
				desc_id = gtr70_sch_ultra_ld04
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_body_detail = {
				desc_id = gh5_none
			}
			cas_guitar_body_fade = {
				desc_id = gtr70_sch_ultra_dtl05
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld31_shctr_c1
			}
			cas_guitar_head = {
				desc_id = gtr70_neckhead_02
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = gtr70_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr70_bridge
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = starlights
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = duncanbodbl
			}
			cas_bass_body = {
				desc_id = bass17_esp_ec_01
			}
			cas_bass_finish = {
				desc_id = bass14_esp_ax_ld_11
				chosen_materials = {
					material1 = green_2guitar
				}
			}
			cas_bass_body_detail = {
				desc_id = bass17_esp_ax_dtl_13
			}
			cas_bass_body_fade = {
				desc_id = bass17_esp_ax_dtl_04
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24d
			}
			cas_bass_neck_finish = {
				desc_id = None
			}
			cas_bass_head = {
				desc_id = bass14_neckhead_04
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = green_2guitar
				}
			}
			cas_bass_head_fade = {
				desc_id = bass9_neckhead4_dtl_05
				chosen_materials = {
					material1 = yellow_green_2guitar
				}
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type3_blk_2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge_4str_04
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass17_esp_knob_10
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld19
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld94
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		Name = 0xebac72a4
		fullname = qs(0xc195a33d)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		locked
		preset_icon = 0x20d5ee57
		blurb = qs(0x7a4e1608)
		ghrocker
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = 0xb6a77fcb
			}
			cas_physique = {
				desc_id = malephysique
			}
			cas_bass_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_guitar_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_drums_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_highway = {
				desc_id = 0xddb1b5c2
			}
			cas_gems = {
				desc_id = gem_set_01
			}
			cas_guitar_body = {
				desc_id = gtr12_mcswain_minferno
			}
			cas_guitar_finish = {
				desc_id = gtr12_mcswain_minferno_ld4
			}
			cas_guitar_body_detail = {
				desc_id = gtr12_mcswain_minferno_dtl1
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr12_mcswain_minferno_fd2
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = None
			}
			cas_guitar_head = {
				desc_id = gtr12_neckhead_mcswain12
			}
			cas_guitar_head_finish = {
				desc_id = gtr12_nkhd_mcswain_ld4
			}
			cas_guitar_head_detail = {
				desc_id = gtr11_neckhead_dtl_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_fade = {
				desc_id = gtr12_neckhead_dtl_02
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr_brdg_mcswn_inferno_3
			}
			cas_guitar_knobs = {
				desc_id = chromespeedster
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = emg81sngl
			}
			cas_bass_body = {
				desc_id = bass16_esp_surveyor_02
			}
			cas_bass_finish = {
				desc_id = bass14_esp_ax_ld_11
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_bass_body_detail = {
				desc_id = bass14_esp_ax_dtl_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_22b
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_inlay_06
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
				desc_id = bass14_bridge_4str_02
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_bass_knobs = {
				desc_id = bass14_knob_03
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_11
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld92
				chosen_materials = {
					material1 = violet_1
				}
			}
			cas_mic = {
				desc_id = mic_sixties
			}
			cas_mic_stand = {
				desc_id = mic_stand_rock
			}
		}
	}
]
preset_musician_profiles_locked = [
	{
		Name = gh_rocker_johnnycash_car
		fullname = qs(0x3a825a9b)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		locked
		preset_icon = photo_eddie
		blurb = qs(0xa0c0422a)
		no_random_pick
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = johnnycash_car
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr27_nsft_acoustic
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_cash_acoustic
			}
			cas_guitar_head = {
				desc_id = gtr27_neckhead_acoustic
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr27_bridge_acoustic
			}
			cas_guitar_knobs = {
				desc_id = guitarnone
			}
			cas_guitar_pickups = {
				desc_id = banjo1
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl02
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_mt_ld04
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch_inl_ld42
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = emg35double
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
		}
	}
	{
		Name = gh_rocker_santana
		fullname = qs(0xdbed6658)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x2c584f50)
		no_random_pick
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = santana_1
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			$preset_musician_instrument_hack
			cas_guitar_body = {
				desc_id = gtr_santana
			}
			cas_guitar_body_detail = {
				desc_id = None
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_04
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld80_prs_birds02
			}
			cas_guitar_head = {
				desc_id = gtr80_neckhead_01
			}
			cas_guitar_head_finish = {
				desc_id = gtr80_neckhead_ld06
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_guitar_head_detail = {
				desc_id = None
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr79_whammy
			}
			cas_guitar_knobs = {
				desc_id = lampshade
			}
			cas_guitar_pickups = {
				desc_id = banjo1
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl02
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_mt_ld04
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch_inl_ld42
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = emg35double
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
		}
	}
	{
		Name = gh_rocker_mattbellamy
		fullname = qs(0xc1da213f)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		win_anims = [
			g_guitmic_win_waving
		]
		lose_anims = [
			g_guitmic_lose_depressed
		]
		preset_icon = photo_eddie
		blurb = qs(0x12aafb48)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = matt_bellamy
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr25_manson_bellamy
			}
			cas_guitar_finish = {
				desc_id = None
			}
			cas_guitar_body_detail = {
				desc_id = None
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_04
			}
			cas_guitar_neck_finish = {
				desc_id = None
			}
			cas_guitar_head = {
				desc_id = gtr25_neckhead_manson
			}
			cas_guitar_head_detail = {
				desc_id = None
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr_brdg_manson_1
			}
			cas_guitar_knobs = {
				desc_id = chromedomes
			}
			cas_guitar_pickups = {
				desc_id = banjo1
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl02
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_mt_ld04
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch_inl_ld42
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = emg35double
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
			cas_mic = {
				desc_id = mic_cash
			}
			cas_mic_stand = {
				desc_id = micstand_cash
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
		}
	}
	{
		Name = gh_rocker_mattbellamy_car
		fullname = qs(0x0ccbf66e)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbe076cd1)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = matt_bellamy_car
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr25_manson_bellamy
			}
			cas_guitar_finish = {
				desc_id = None
			}
			cas_guitar_body_detail = {
				desc_id = None
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_04
			}
			cas_guitar_neck_finish = {
				desc_id = None
			}
			cas_guitar_head = {
				desc_id = gtr25_neckhead_manson
			}
			cas_guitar_head_detail = {
				desc_id = None
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr_brdg_manson_1
			}
			cas_guitar_knobs = {
				desc_id = chromedomes
			}
			cas_guitar_pickups = {
				desc_id = banjo1
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl02
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_mt_ld04
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch_inl_ld42
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = emg35double
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
		}
	}
	{
		Name = gh_rocker_kurtcobain
		fullname = qs(0xf3647ae9)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xd3764aad)
		no_random_pick
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = kurtcobain
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr78_kurt
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld86_esp_dots
			}
			cas_guitar_head = {
				desc_id = gtr78_neckhead
			}
			cas_guitar_pickguards = {
				desc_id = gtr78_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr78_bridge
			}
			cas_guitar_knobs = {
				desc_id = tophat
			}
			cas_guitar_pickups = {
				desc_id = gtr78_pickup1
			}
			cas_guitar_misc = {
				desc_id = gtr78_misc
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl02
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_mt_ld04
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch_inl_ld42
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = emg35double
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
		}
	}
	{
		Name = gh_rocker_kurtcobain_lefty
		fullname = qs(0x7e77e361)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		win_anims = [
			g_lefty_win_waving
		]
		lose_anims = [
			g_lefty_lose_depressed
		]
		preset_icon = photo_eddie
		blurb = qs(0xd3764aad)
		no_random_pick
		selection_not_allowed
		locked
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = 0x6d7010d8
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr78_kurt
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld86_esp_dots
			}
			cas_guitar_head = {
				desc_id = gtr78_neckhead
			}
			cas_guitar_pickguards = {
				desc_id = gtr78_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr78_bridge
			}
			cas_guitar_knobs = {
				desc_id = tophat
			}
			cas_guitar_pickups = {
				desc_id = gtr78_pickup1
			}
			cas_guitar_misc = {
				desc_id = gtr78_misc
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl02
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_mt_ld04
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch_inl_ld42
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = emg35double
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
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = mic_stand_female
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
		}
	}
	{
		Name = gh_rocker_shirleymanson
		fullname = qs(0x99902597)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		locked
		preset_icon = photo_eddie
		blurb = qs(0x6e250c9f)
		no_random_pick
		locked
		appearance = {
			genre = rock
			cas_full_body = {
				desc_id = shirleymanson
			}
			cas_female_physique = {
				desc_id = femalephysique
			}
			cas_guitar_body = {
				desc_id = gtr12_esp_v_01
			}
			cas_guitar_finish = {
				desc_id = gtr12_esp_v_series_ld_01_color
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr12_esp_v_series_dtl_19
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr12_esp_v_series_dtl_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_24fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 24fret_ld03_hero_tribal
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_head = {
				desc_id = gtr12_neckhead_07
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_detail = {
				desc_id = gtr33_nhead_dtl03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_head_fade = {
				desc_id = gtr33_nhead_dtl01
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr12_bridge_3
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr12_esp_knob_01
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickups = {
				desc_id = gtr1_esp_emg_pkup_2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body = {
				desc_id = bass9_esp_ax_01
			}
			cas_bass_finish = {
				desc_id = bass9_esp_ax_d_color
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_body_detail = {
				desc_id = bass9_esp_ax_dtl_19
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_body_fade = {
				desc_id = bass9_esp_ax_dtl_03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24black
			}
			cas_bass_neck_finish = {
				desc_id = neck_inlay_fl_blank
			}
			cas_bass_head = {
				desc_id = bass9_neckhead_01
			}
			cas_bass_head_finish = {
				desc_id = gh5_solidcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = none_esp
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type1_blk_02
			}
			cas_bass_bridges = {
				desc_id = bass9_bridge_4str_01
			}
			cas_bass_knobs = {
				desc_id = bass9_esp_knob_10_04
			}
			cas_mic = {
				desc_id = mic_shirley
			}
			cas_mic_stand = {
				desc_id = mic_stand_shirley
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
		}
	}
	{
		Name = gh_rocker_johnnycash
		fullname = qs(0x3a825a9b)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		win_anims = [
			g_guitmic_win_waving
		]
		lose_anims = [
			g_guitmic_lose_depressed
		]
		preset_icon = photo_eddie
		blurb = qs(0xb1a58a24)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = johnnycash_1
			}
			cas_male_physique = {
				desc_id = malephysique
			}
			cas_guitar_body = {
				desc_id = gtr27_nsft_acoustic
			}
			cas_guitar_finish = {
				desc_id = gtr27_nsft_acoustic_d
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_cash_acoustic
			}
			cas_guitar_head = {
				desc_id = gtr27_neckhead_acoustic
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr27_bridge_acoustic
			}
			cas_guitar_knobs = {
				desc_id = guitarnone
			}
			cas_guitar_pickups = {
				desc_id = banjo1
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
			}
			cas_bass_finish = {
				desc_id = bs_sch_mt_dtl02
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_mt_ld04
				chosen_materials = {
					material1 = orange_3
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_24c
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch_inl_ld42
				chosen_materials = {
					material1 = grey_5guitar
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
				desc_id = emg35double
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
			cas_mic = {
				desc_id = mic_cash
			}
			cas_mic_stand = {
				desc_id = micstand_cash
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
		}
	}
	{
		Name = gh_rocker_johnnycash_guitarist
		fullname = qs(0x1cb4a259)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbd90ca14)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `classic	rock`
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					facefullness = 0.0
					jawprominence = 0.0
					jawshape = 1.0
					chinprominence = 1.0
					chinwidth = 0.0
					chinheight = 0.9
					chinangle = 1.0
					chincleft = 0.0
					cheekboneprominence = 0.24800001
					cheekbonedepth = 0.0
					earprominence = 0.025999999
					earshape = 0.6
					nosewidth = 0.133
					noselength = 1.0
					noseangle = 0.3
					noseposition = 0.0
					nosetipheight = 0.167
					nosetipwidth = 0.167
					mouthangle = 0.0
					mouthdepth = 0.0
					mouthposition = 0.167
					lipshapelower = 1.0
					lipshapeupper = 1.0
					upperlipthickness = 0.148
					eyebrowdistance = -1.0
					browposition = 0.0
					eyebrowangle = 0.5
					browdepth = 1.0
					eyebrowsize = 1.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique2
			}
			cas_eyes = {
				desc_id = eyes_green
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_rock_hair_midpart
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_rock_torso_jcashvest
				chosen_materials = {
					material2 = carblack_1
					material3 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_pants
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_clive3
				chosen_materials = {
					material1 = carblack_1
					material2 = carblack_1
					material3 = carblack_1
				}
			}
			cas_guitar_body = {
				desc_id = gtr27_nsft_acoustic
			}
			cas_guitar_finish = {
				desc_id = gtr27_nsft_acoustic_d
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_cash_acoustic
			}
			cas_guitar_head = {
				desc_id = gtr27_neckhead_acoustic
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr27_bridge_acoustic
			}
			cas_guitar_knobs = {
				desc_id = guitarnone
			}
			cas_guitar_pickups = {
				desc_id = banjo1
			}
		}
	}
	{
		Name = gh_rocker_johnnycash_bassist
		fullname = qs(0xc4b1d7f5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x5ed07e02)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = rock
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					jawprominence = 1.0
					jawshape = 1.0
					chinprominence = 1.0
					chinwidth = 0.0
					chincleft = 0.8
					waddle = 1.0
					earlobesize = 0.7
					facefullness = 1.0
					headsize = -1.0
					chinangle = 1.0
					nosewidth = 1.0
					browposition = 0.0
					eyebrowangle = 0.29
					eyebrowsize = 1.0
					eyecornershape = 0.337
					eyeangle = 0.6
					eyedistance = -0.414
					mouthscale = 0.9
					lipshapelower = 1.0
					lowerlipthickness = 1.0
					noseangle = 0.0
					noseposition = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique5
				bones = {
					height = -1.0
				}
			}
			cas_eyes = {
				desc_id = eyes_hazel
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_rock_hair_eddie3
				chosen_materials = {
					material2 = carblack_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee01
			}
			cas_male_torso = {
				desc_id = m_pop_torso_suit
				chosen_materials = {
					material1 = grey_1
					material2 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_pants
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_shoes = {
				desc_id = m_rock_shoe_dressboot
			}
			cas_male_acc_left = {
				desc_id = m_clsc_acc_l3rings
			}
			cas_male_acc_right = {
				desc_id = m_clsc_acc_r3rings
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_bass_body = {
				desc_id = bass17_esp_ec_01
			}
			cas_bass_finish = {
				desc_id = bass17_esp_ec_ld_11
				chosen_materials = {
					material1 = teal_2
				}
			}
			cas_bass_body_detail = {
				desc_id = bass17_esp_ax_dtl_02
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_22b
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_inlay_06
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head = {
				desc_id = bass14_neckhead_03
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = none_gh5
			}
			cas_bass_head_fade = {
				desc_id = bass9_neckhead3_ld_02
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_030_pga
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type3_blk_2
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge_4str_05
			}
			cas_bass_knobs = {
				desc_id = bass17_knob_02
			}
		}
	}
	{
		Name = gh_rocker_johnnycash_drummer
		fullname = qs(0x9b631dc2)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x0102b435)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = rock
			cas_male_base_torso = {
				desc_id = male_full
				chosen_materials = {
					skin = skin_black4
				}
			}
			cas_body = {
				desc_id = gh4_car_male
				chosen_materials = {
					skin = skin_black4
				}
			}
			cas_male_physique = {
				desc_id = malephysique4
				bones = {
					height = -0.9
				}
			}
			cas_eyes = {
				desc_id = eyes_violet
			}
			cas_male_eyebrows = {
				desc_id = car_no_brow
			}
			cas_male_hair = {
				desc_id = m_pop_hair_pomp
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_rock_torso_rolledslvs
				chosen_materials = {
					material1 = carblack_3
				}
			}
			cas_male_legs = {
				desc_id = m_punk_legs_cuff
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_converse01
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = None
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_drum_finish = {
				desc_id = drumshell_ds_55
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_drum_detail = {
				desc_id = bass_skin_ds_11
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
		}
	}
	{
		Name = gh_rocker_santana_guitarist
		fullname = qs(0x465865c0)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x91d8999f)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `classic	rock`
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				chosen_materials = {
					eyebrows = yellow_orange_4
					skin = skin_latin2
				}
				bones = {
					headsize = 1.0
					chinprominence = 1.0
					chinangle = 1.0
					earshape = 0.167
					earsize = 0.98599994
					eyebrowsize = 1.0
					jawprominence = 0.6
					cheekboneprominence = 0.0
					cheekbonedepth = 0.4
					browdepth = 0.3
					browposition = 0.4
					eyebrowangle = 0.0
					chinheight = 0.2
					mouthposition = 0.1
					nosetipangle = 0.2
					eyecornershape = 0.9
					eyeshape = 1.0
					facefullness = 0.8
					nosetipwidth = 0.86700004
					eyescale = 0.3
					eyedistance = -0.5
					lipshapeupper = 0.5
					mouthdepth = 0.5
					mouthangle = 0.3
					mouthscale = 0.6
					lowerlipthickness = 1.0
					upperlipthickness = 0.948
					eyeangle = 0.8
					eyeposition = 0.1
					nosesize = 0.6
					nosewidth = 0.4
					noseangle = 0.5
					noseposition = 0.0
					nosenostrilheight = 0.93299997
					nosenostrilsize = 0.7
					chinwidth = 1.0
					chincleft = 0.0
					waddle = 0.2
					nosetipheight = 0.2
					noselength = 0.2
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = eyes_brown
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_clsc_hair_clive4
				chosen_materials = {
					material2 = hairred_3
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_clsc_fhair_country
				chosen_materials = {
					material1 = yellow_orange_2
				}
			}
			cas_male_torso = {
				desc_id = m_clsc_torso_santana_d2
			}
			cas_male_legs = {
				desc_id = m_clsc_legs_clive
				chosen_materials = {
					material1 = red_5
					material2 = teal_3
					material3 = teal_4
				}
			}
			cas_male_shoes = {
				desc_id = m_clsc_shoe_platform
				chosen_materials = {
					material2 = yellow_orange_3
					material1 = orange_3
				}
			}
			cas_male_acc_left = {
				desc_id = m_clsc_acc_lscarf
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rrings
			}
			cas_male_acc_face = {
				desc_id = m_clsc_glasses_avtr
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_old
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_guitar_body = {
				desc_id = gtr93_dr_siren
			}
			cas_guitar_finish = {
				desc_id = gtr93_dr_siren_ld04
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_guitar_body_detail = {
				desc_id = gtr94_dr_tomboy_dtl09
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld86_esp_dots
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_head = {
				desc_id = gtr93_dr_neckhead01
			}
			cas_guitar_head_finish = {
				desc_id = gtr93_neckhead01_ld04
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr_bridge_01daisy
			}
			cas_guitar_knobs = {
				desc_id = speedster
			}
			cas_guitar_pickups = {
				desc_id = rockfadbl
			}
		}
	}
	{
		Name = gh_rocker_santana_bassist
		fullname = qs(0x2db193bf)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xb9db65e7)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `glam	rock`
			cas_female_base_torso = {
				desc_id = female_full
			}
			cas_body = {
				desc_id = gh4_car_female
				random_weight = 1.75
				cas_eyes = {
					desc_id = eyes_blue
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						material = car_female_head
						cas_1
						post_layer = [
							{
								texture = `tex/models/characters/layers/car/female/makeup/car_female_eyeshadow_a01`
								Color = carblack_2
							}
						]
					}
				]
				chosen_materials = {
					skin = skin_white1
					eyebrows = yellow_orange_2
				}
				bones = {
					mouthposition = 0.2
					eyebrowangle = 0.49
					eyebrowsize = 0.0
					browposition = 1.0
					eyebrowdistance = 1.0
					jawprominence = 0.6
					jawshape = 0.7
					chinprominence = 0.0
					lowerlipthickness = 0.79599994
					mouthdepth = 0.0
					facefullness = 0.5
					upperlipthickness = 0.64800006
					nosebridge = 0.1
					eyecornershape = 1.0
					eyeshape = 0.5
					earsize = 1.0
					earshape = 0.56700003
					eartip = 0.0
					noseposition = 0.72199994
					noseangle = 0.7
					browdepth = 0.0
					eyedistance = -0.4
					nosetipwidth = 1.0
					nosesize = 0.5
					nosetiplength = 0.0
					nosetipheight = 0.4
					nosewidth = 0.133
					noselength = 0.6
					eyescale = 0.414
					eyeangle = 0.3
					eyeposition = 1.0
				}
			}
			cas_female_physique = {
				desc_id = femalephysique4
			}
			cas_eyes = {
				desc_id = eyes_brown
			}
			cas_female_eyebrows = {
				desc_id = car_rounded_brow
			}
			cas_female_hair = {
				desc_id = f_rock_hair_wavy
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_female_hat = {
				desc_id = None
			}
			cas_female_facial_hair = {
				desc_id = None
			}
			cas_female_torso = {
				desc_id = f_glam_torso_lacebratop
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_female_legs = {
				desc_id = f_clsc_legs_skrt
				chosen_materials = {
					material1 = yellow_orange_3
				}
			}
			cas_female_shoes = {
				desc_id = f_mtl_shoes_flameb
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_female_acc_left = {
				desc_id = f_glam_l_acc_baggyclobber
			}
			cas_female_acc_right = {
				desc_id = None
			}
			cas_female_acc_face = {
				desc_id = None
			}
			cas_female_acc_ears = {
				desc_id = None
			}
			cas_female_age = {
				desc_id = car_female_teen
			}
			cas_female_teeth = {
				desc_id = car_female_teeth
			}
			cas_bass_body = {
				desc_id = bass_schect_030
			}
			cas_bass_finish = {
				desc_id = bs_sch_bod04_ld01
				chosen_materials = {
					material1 = red_1
				}
			}
			cas_bass_body_fade = {
				desc_id = bs_sch_bod04_dtl20
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_21d
			}
			cas_bass_neck_finish = {
				desc_id = bs_sch22_inl_ld30
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			cas_bass_head = {
				desc_id = bs_sch_030_nhead01
			}
			cas_bass_head_finish = {
				desc_id = bass_neckhead_030
			}
			cas_bass_head_detail = {
				desc_id = none_gh5
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_030_pga
			}
			cas_bass_pickups = {
				desc_id = emgj
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knurled
				chosen_materials = {
					material1 = teal_1
				}
			}
		}
	}
	{
		Name = gh_rocker_santana_drummer
		fullname = qs(0x72635988)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xe609afd0)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = eyes_brown
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				chosen_materials = {
					skin = skin_black3
				}
				cap = [
					{
						base_tex = `tex/models/characters/global/global_blank_head_dnc`
						material = car_male_head
						cas_1
						post_layer = [
							{
								texture = `tex/models/characters/car/car_shared_none2`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\characters\car\female\car_female_armr_tat_o_dnc`
						material = car_male_armr
						cas_1
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics076`
								Color = grey_3guitar
								a = 100
								x_trans = 10
								y_trans = -22
								x_scale = 45
								y_scale = 40
								flags = 3
								x_skew = 0
							}
						]
					}
				]
				bones = {
					chinheight = 0.1
					chincleft = 1.0
					nosenostrilangle = 0.7
					noseangle = 0.267
					mouthscale = 0.367
					eyebrowdistance = -0.256
					eyebrowangle = 0.98999995
					cheekboneprominence = 0.148
					cheekbonedepth = 0.5
					browdepth = 0.4
					headsize = 0.5
					facefullness = 1.0
					jawprominence = 1.0
					chinwidth = 0.3
					chinprominence = 0.2
					jawshape = 0.0
					noselength = 0.3
					nosesize = 0.4
					upperlipthickness = 0.9
					mouthdepth = 0.0
					mouthangle = 0.3
					mouthposition = 0.5
					lipshapelower = 0.6
					lipshapeupper = 1.0
					noseposition = 0.0
					eyescale = 0.414
					eyedistance = -0.8
					eyeshape = 1.0
					nosewidth = 0.8
					nosebridge = 0.6
					lowerlipthickness = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique7
				bones = {
					height = -1.0
				}
			}
			cas_eyes = {
				desc_id = eyes_brown
			}
			cas_male_eyebrows = {
				desc_id = car_no_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_lars_3
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_hat_hair = {
				desc_id = m_bmtl_hathair_lars_3
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_hat = {
				desc_id = m_hat_pimp
				chosen_materials = {
					material1 = yellow_orange_2
					material2 = grey_4
				}
			}
			cas_male_facial_hair = {
				desc_id = m_metl_fhair_zzbeard
			}
			cas_male_torso = {
				desc_id = m_torso_tasselvest
				chosen_materials = {
					material1 = grey_4
					material2 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_zippertight
				chosen_materials = {
					material1 = grey_4
				}
			}
			cas_male_shoes = {
				desc_id = m_flipflops
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lmetalskull
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rchain
			}
			cas_male_acc_face = {
				desc_id = m_pop_glasses_riot
			}
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_02
			}
			cas_male_age = {
				desc_id = car_male_old
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld36
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld95
			}
		}
	}
	{
		Name = gh_rocker_shirleymanson_guitarist
		fullname = qs(0x8e20f18d)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x634edb8d)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 3.0
				bones = {
					jawprominence = 0.0
					jawshape = 0.0
					chinprominence = 1.0
					cheekboneprominence = 0.348
					cheekbonedepth = 0.7
					facefullness = 0.7
					nosewidth = 0.0
					nosetipwidth = 1.0
					nosenostrilangle = 0.6
					nosenostrilheight = 0.4
					nosenostrilsize = 0.7
					noseangle = 0.66700006
					nosetipheight = 1.0
					mouthscale = 0.167
					lipshapeupper = 0.883
					upperlipthickness = 0.64800006
					lowerlipthickness = 1.0
					noselength = 0.767
					mouthdepth = 0.8
					mouthposition = 0.1
					nosesize = 0.5
					noseposition = 0.122
					eyedistance = -0.514
					eyeangle = 0.5
					eyecornershape = 0.0
					eyescale = 0.614
					eyeposition = 1.0
					eyebrowdistance = -0.056
					browposition = 0.0
					eyebrowangle = 0.29
					eyebrowsize = 0.2
				}
				chosen_materials = {
					skin = skin_white4
				}
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = eyes_deepblue
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = eyes_deepblue
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_clsc_hair_clive2
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_pop_torso_openshirt
				chosen_materials = {
					material1 = carblack_1
					material2 = grey_1
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_slacks
				chosen_materials = {
					material1 = grey_1
					material2 = carblack_3
				}
			}
			cas_male_shoes = {
				desc_id = m_metl_shoes_tallplain
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = m_metl_acc_rstuds
			}
			cas_male_acc_face = {
				desc_id = m_pop_glasses_riot
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_guitar_body = {
				desc_id = gtr2_esp_truckster_02
			}
			cas_guitar_finish = {
				desc_id = gtr4_esp_eclipse_d_01_color
				chosen_materials = {
					material1 = red_2
				}
			}
			cas_guitar_body_fade = {
				desc_id = gtr4_esp_eclipse_dtl_03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld86_esp_dots
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			cas_guitar_head = {
				desc_id = gtr62_neckhead01
			}
			cas_guitar_head_finish = {
				desc_id = espcolor
				chosen_materials = {
					material1 = red_4
				}
			}
			cas_guitar_head_detail = {
				desc_id = esp_none
			}
			cas_guitar_head_fade = {
				desc_id = gtr4_neckhead_dtl_03
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr4_esp_bridge_02
			}
			cas_guitar_knobs = {
				desc_id = gtr4_esp_knob_10_03
			}
			cas_guitar_pickups = {
				desc_id = gtr1_esp_emg_pkup_2
			}
		}
	}
	{
		Name = gh_rocker_shirleymanson_bassist
		fullname = qs(0xc01448eb)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xc6aa31ed)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 3.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = eyes_deepblue
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				chosen_materials = {
					skin = skin_asian4
				}
				bones = {
					jawshape = 0.0
					cheekbonedepth = 0.7
					nosenostrilangle = 0.6
					nosenostrilsize = 0.7
					noselength = 0.767
					eyescale = 0.614
					eyebrowangle = 0.29
					eyebrowsize = 0.2
					headsize = -0.2
					facefullness = 0.4
					jawprominence = 0.3
					chinprominence = 0.4
					chinwidth = 0.471
					cheekboneprominence = 0.148
					nosewidth = 0.0
					noseangle = 0.66700006
					noseposition = 0.3
					nosetipheight = 0.3
					nosetipwidth = 0.6
					nosenostrilheight = 1.0
					nosetipangle = 0.3
					nosetiplength = 0.5
					nosesize = 0.6
					mouthscale = 0.367
					mouthangle = 0.0
					mouthdepth = 0.4
					mouthposition = 0.3
					lipshapeupper = 0.4
					lipshapelower = 0.0
					upperlipthickness = 1.0
					lowerlipthickness = 0.7
					eyeshape = 0.405
					eyecornershape = 0.1
					eyeangle = 0.6
					eyeposition = 0.8
					eyedistance = -0.614
					browposition = 0.2
					eyebrowdistance = 0.344
				}
			}
			cas_male_physique = {
				desc_id = malephysique4
				bones = {
					height = 0.5
				}
			}
			cas_eyes = {
				desc_id = eyes_brown
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_pop_hair_buzz
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_stub
			}
			cas_male_torso = {
				desc_id = m_pop_torso_leather
				chosen_materials = {
					material1 = carblack_1
					material2 = blue_4
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_jeans
				chosen_materials = {
					material1 = grey_1
					material2 = carblack_1
				}
			}
			cas_male_shoes = {
				desc_id = m_glam_shoes_mart
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = m_metl_acc_rstuds
			}
			cas_male_acc_face = {
				desc_id = m_clsc_glasses_wtnose
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_bass_body = {
				desc_id = bass17_esp_ec_01
			}
			cas_bass_finish = {
				desc_id = bass17_esp_ec_ld_11
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_bass_body_detail = {
				desc_id = bass17_esp_ax_dtl_13
			}
			cas_bass_body_fade = {
				desc_id = bass17_esp_ax_dtl_05
				chosen_materials = {
					material1 = orange_2
				}
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_22b
			}
			cas_bass_neck_finish = {
				desc_id = bass_fretboard_inlay_06
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head = {
				desc_id = bass14_neckhead_03
			}
			cas_bass_head_finish = {
				desc_id = esp_solidcolor
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_head_detail = {
				desc_id = none_gh5
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = bass9_pkup_type1_blk_02
			}
			cas_bass_bridges = {
				desc_id = bass17_bridge_4str_04
			}
			cas_bass_knobs = {
				desc_id = bass17_esp_knob_10
			}
		}
	}
	{
		Name = gh_rocker_shirleymanson_drummer
		fullname = qs(0x9fc682dc)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x9978fbda)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = pop
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 3.0
			}
			cas_male_physique = {
				desc_id = malephysique2
				bones = {
					height = 0.3
				}
			}
			cas_eyes = {
				desc_id = eyes_hazel
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_pop_hair_emo1
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee03
			}
			cas_male_torso = {
				desc_id = m_rock_torso_tie
				chosen_materials = {
					material2 = grey_1
					material3 = red_2
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_pants
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_conversecs
				chosen_materials = {
					material1 = carblack_1
					material2 = grey_1
					material3 = red_2
				}
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = m_pop_acc_rglove
			}
			cas_male_acc_face = {
				desc_id = m_pop_glasses_riot
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld52
				chosen_materials = {
					material1 = orange_1
				}
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld28
				chosen_materials = {
					material1 = red_orange_1
				}
			}
		}
	}
	{
		Name = gh_rocker_kurtcobain_guitarist
		fullname = qs(0x63bce9cd)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xc2988180)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = rock
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					nosenostrilangle = 0.0
					nosebridge = 0.5
					nosetipwidth = 0.467
					nosetipheight = 1.0
					noselength = 0.4
					noseposition = 0.6
					noseangle = 0.1
					nosetiplength = 0.9
					nosetipangle = 0.0
					nosenostrilsize = 0.9
					eyebrowsize = 1.0
					browdepth = 0.1
					eyebrowdistance = -0.956
					eyebrowangle = 0.8
					lipshapelower = 0.111
					lipshapeupper = 0.083
					mouthdepth = 0.433
					mouthangle = 0.467
					mouthposition = 1.0
					upperlipthickness = 0.5
					lowerlipthickness = 0.39600003
					headsize = 0.0
					jawprominence = 0.0
					jawshape = 1.0
					chinheight = 1.0
					chinangle = 1.0
					chinprominence = 0.6
					facefullness = 0.5
					earlobesize = 0.1
					earlobelength = 1.0
					earshape = 0.067
					chincleft = 1.0
					waddle = 0.7
					chinwidth = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = eyes_brown
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_glam_hair_izzy2
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_torso_tshirt
			}
			cas_male_legs = {
				desc_id = m_rock_legs_ripjeans
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_converse04
			}
			cas_male_acc_left = {
				desc_id = m_rock_acc_lwatch
			}
			cas_male_acc_right = {
				desc_id = None
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_guitar_body = {
				desc_id = gtr33_boris
			}
			cas_guitar_finish = {
				desc_id = gtr33_kh2_wood_d_color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld102_esp_logo
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_guitar_head = {
				desc_id = gtr33_nekhed_01
			}
			cas_guitar_head_finish = {
				desc_id = gtr4_neckhead_d_06
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr33_bridge_fr
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_33_knobs_a
			}
			cas_guitar_pickups = {
				desc_id = gtr30_emg
			}
		}
	}
	{
		Name = gh_rocker_kurtcobain_bassist
		fullname = qs(0x269934c0)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xbcf89d37)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `glam	rock`
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				chosen_materials = {
					eyebrows = carblack_1
					skin = skin_white4
					nails = carblack_1
				}
				bones = {
					eyedistance = -1.0
					eyeposition = -1.0
					eyecornershape = 0.0
					eyeshape = 1.0
					mouthscale = 0.0
					mouthangle = 0.4
					lipshapelower = 1.0
					upperlipthickness = 0.4
					lipshapeupper = 0.8
					nosesize = 0.0
					nosewidth = 0.733
					nosetipheight = 1.0
					nosetipwidth = 0.86700004
					nosenostrilheight = 1.0
					nosenostrilsize = 1.0
					nosetipangle = 1.0
					noseangle = 0.8
					noseposition = 0.5
					noselength = 0.5
					chinwidth = 0.271
					earshape = 0.267
					waddle = 1.0
					chinangle = 0.4
					chincleft = 0.5
					chinheight = 0.0
					chinprominence = 0.0
					jawshape = 0.7
					eyescale = 0.6
					eyeangle = 0.9
					eyebrowsize = 1.0
					eyebrowangle = 0.3
					browdepth = 1.0
					browposition = 0.0
					eyebrowdistance = -0.556
					headsize = 0.6
					facefullness = 0.9
					jawprominence = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = eyes_brown
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_pop_hair_emo1
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_torso_layered
				chosen_materials = {
					material2 = grey_5
					material1 = yellow_green_1
				}
			}
			cas_male_legs = {
				desc_id = m_mtl_legs_axel01
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_vansh_skull
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = None
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
			}
			cas_bass_finish = {
				desc_id = bass15_mcswain_machine_ld2
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_21a
			}
			cas_bass_neck_finish = {
				desc_id = 22fret_ld06_mcswn_bolts
			}
			cas_bass_head = {
				desc_id = bass15_neckhead_mcswain1
			}
			cas_bass_head_finish = {
				desc_id = bass15_nkhd_mcswain_ld2
			}
			cas_bass_head_detail = {
				desc_id = none_esp
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = basslines1b
			}
			cas_bass_bridges = {
				desc_id = mcswainbullet
			}
			cas_bass_knobs = {
				desc_id = chromedomes
			}
		}
	}
	{
		Name = gh_rocker_kurtcobain_drummer
		fullname = qs(0x794bfef7)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xe32a5700)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = punk
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				bones = {
					facefullness = 0.4
					chinheight = 0.2
					waddle = 0.0
					cheekbonedepth = 0.6
					cheekboneprominence = 0.0
					chincleft = 0.6
					chinwidth = 0.6
					chinprominence = 1.0
					jawshape = 1.0
					jawprominence = 1.0
					earprominence = 0.1
					earsize = 0.3
					earlobesize = 0.8
					eyescale = 0.9
					eyeshape = 0.6
					eyecornershape = 0.337
					eyeangle = 0.661
					eyeposition = -0.63
					mouthangle = 1.0
					mouthdepth = 0.833
					mouthposition = 0.4
					mouthscale = 0.66700006
					eyebrowsize = 0.72499996
					browposition = 1.0
					eyebrowdistance = -0.856
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = eyes_hazel
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_bmtl_hair_lars
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = m_rock_fhair_goatee03
			}
			cas_male_torso = {
				desc_id = None
			}
			cas_male_legs = {
				desc_id = m_rock_legs_jeans
				chosen_materials = {
					material1 = carblack_3
					material2 = red_2
				}
			}
			cas_male_shoes = {
				desc_id = m_spnr_shoe_vansh_bw
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_male_acc_left = {
				desc_id = m_punk_accl_jny_2
			}
			cas_male_acc_right = {
				desc_id = m_rock_acc_rstrap
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = m_punk_acc_ring_02
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld16
				chosen_materials = {
					material1 = blue_1
				}
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld09
				chosen_materials = {
					material1 = navy_3
				}
			}
		}
	}
	{
		Name = gh_rocker_mattbellamy_guitarist
		fullname = qs(0x59ef5801)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x5f512107)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = rock
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = eyes_brown
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				cas_male_hair = {
					desc_id = None
				}
				chosen_materials = {
					skin = skin_asian4
					eyebrows = grey_2
				}
				bones = {
					jawprominence = 0.0
					jawshape = 0.0
					chinprominence = 1.0
					chinwidth = 1.0
					chinheight = 0.5
					chinangle = 1.0
					chincleft = 1.0
					waddle = 0.3
					nosesize = 0.1
					nosewidth = 0.4
					noselength = 0.9
					nosenostrilsize = 1.0
					lipshapeupper = 0.783
					lowerlipthickness = 0.8
					upperlipthickness = 1.0
					mouthscale = 0.0
					mouthposition = 0.9
					eyecornershape = 1.0
					eyebrowsize = 0.0
					eyebrowdistance = -0.8
					eyebrowangle = 1.0
					cheekboneprominence = 0.24800001
					cheekbonedepth = 0.4
					facefullness = 0.5
					eyeangle = 0.5
					nosebridge = 0.3
					noseangle = 0.0
					eyeposition = -1.0
					eyescale = 0.7
					eyedistance = -0.5
					noseposition = 0.4
					headsize = -1.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique3
				bones = {
					height = 1.0
				}
			}
			cas_eyes = {
				desc_id = eyes_blue
			}
			cas_male_eyebrows = {
				desc_id = car_rounded
			}
			cas_male_hair = {
				desc_id = m_glam_hair_izzy2
				chosen_materials = {
					material1 = yellow_orange_5
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_rock_torso_jcashvest
				chosen_materials = {
					material3 = red_3
					material1 = grey_5
				}
			}
			cas_male_legs = {
				desc_id = m_metl_legs_tooskinny
				chosen_materials = {
					material1 = grey_5
				}
			}
			cas_male_shoes = {
				desc_id = m_goth_shoes_spats
				chosen_materials = {
					material1 = red_4
					material2 = carblack_3
				}
			}
			cas_male_acc_left = {
				desc_id = m_punk_acc_lleather
			}
			cas_male_acc_right = {
				desc_id = m_punk_acc_rbands
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_guitar_body = {
				desc_id = gtr33_boris
			}
			cas_guitar_finish = {
				desc_id = gtr33_kh2_wood_d_color
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_neck = {
				desc_id = gtr_22fret_fretboard_03
			}
			cas_guitar_neck_finish = {
				desc_id = 22fret_ld102_esp_logo
				chosen_materials = {
					material1 = teal_1
				}
			}
			cas_guitar_head = {
				desc_id = gtr33_nekhed_01
			}
			cas_guitar_head_finish = {
				desc_id = gtr4_neckhead_d_06
			}
			cas_guitar_pickguards = {
				desc_id = None
			}
			cas_guitar_bridges = {
				desc_id = gtr33_bridge_fr
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr_33_knobs_a
			}
			cas_guitar_pickups = {
				desc_id = gtr30_emg
			}
		}
	}
	{
		Name = gh_rocker_mattbellamy_bassist
		fullname = qs(0xcb1cd6df)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x3feb2088)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = pop
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = eyes_brown
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				cas_male_hair = {
					desc_id = None
				}
				chosen_materials = {
					skin = skin_black4
					nails = carblack_1
				}
				bones = {
					facefullness = 0.4
					jawprominence = 0.7
					jawshape = 0.0
					chinangle = 0.8
					lowerlipthickness = 1.0
					nosewidth = 0.7
					nosesize = 0.4
					nosetipwidth = 1.0
					eyescale = 0.514
					eyedistance = -0.8
					eyeangle = 0.7
					eyecornershape = 0.137
					eyeshape = 0.0
					eyebrowdistance = -0.756
					eyebrowangle = 0.9
					eyebrowsize = 0.0
					browdepth = 0.6
					mouthscale = 0.467
					upperlipthickness = 1.0
					lipshapelower = 0.6
					lipshapeupper = 0.4
					browposition = 1.0
					noseposition = 0.0
					mouthdepth = 0.0
					mouthposition = 0.7
					nosebridge = 0.5
					chincleft = 1.0
					chinprominence = 0.5
					chinheight = 0.5
					chinwidth = 0.5
					noselength = 0.5
				}
			}
			cas_male_physique = {
				desc_id = malephysique1
			}
			cas_eyes = {
				desc_id = eyes_brown
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_pop_hair_emo1
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_clsc_torso_confed
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_male_legs = {
				desc_id = m_pop_legs_pants
				chosen_materials = {
					material1 = grey_1
				}
			}
			cas_male_shoes = {
				desc_id = m_mtl_shoes_axel01
				chosen_materials = {
					material2 = red_3
					material1 = grey_5
					material3 = red_3
				}
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = None
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_teen
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_bass_body = {
				desc_id = bass15_mcswain_machine
			}
			cas_bass_finish = {
				desc_id = bass15_mcswain_machine_ld2
			}
			cas_bass_body_detail = {
				desc_id = gh5_none
			}
			cas_bass_body_fade = {
				desc_id = fade_none
			}
			cas_bass_neck = {
				desc_id = bass_fretboard_21a
			}
			cas_bass_neck_finish = {
				desc_id = 22fret_ld06_mcswn_bolts
			}
			cas_bass_head = {
				desc_id = bass15_neckhead_mcswain1
			}
			cas_bass_head_finish = {
				desc_id = bass15_nkhd_mcswain_ld2
			}
			cas_bass_head_detail = {
				desc_id = none_esp
			}
			cas_bass_head_fade = {
				desc_id = bass_head_fade_none
			}
			cas_bass_pickguards = {
				desc_id = None
			}
			cas_bass_pickups = {
				desc_id = basslines1b
			}
			cas_bass_bridges = {
				desc_id = mcswainbullet
			}
			cas_bass_knobs = {
				desc_id = chromedomes
			}
		}
	}
	{
		Name = gh_rocker_mattbellamy_drummer
		fullname = qs(0x94ce1ce8)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x6039eabf)
		no_random_pick
		selection_not_allowed
		appearance = {
			genre = `heavy	metal`
			cas_male_base_torso = {
				desc_id = male_full
			}
			cas_body = {
				desc_id = gh4_car_male
				random_weight = 1.0
				cas_male_physique = {
					desc_id = malephysique1
				}
				cas_eyes = {
					desc_id = eyes_brown
				}
				cas_male_eyebrows = {
					desc_id = car_default_brow
				}
				chosen_materials = {
					skin = skin_white3
				}
				bones = {
					facefullness = 0.0
					jawshape = 0.0
					jawprominence = 0.3
					mouthposition = 0.0
					chinwidth = 1.0
					chincleft = 1.0
					noseangle = 0.5
					nosetipwidth = 0.66700006
					nosetipangle = 0.1
					nosenostrilsize = 0.2
					nosenostrilheight = 0.5
					nosenostrilangle = 1.0
					nosewidth = 0.7
					eyescale = 0.4
					eyeposition = -0.6
					eyeangle = 0.6
					eyecornershape = 0.0
					eyeshape = 0.105000004
					eyedistance = -1.0
					lowerlipthickness = 1.0
					mouthdepth = 0.0
					noseposition = 0.4
					noselength = 0.2
					eyebrowangle = 1.0
					eyebrowdistance = -0.8
					browposition = 0.0
					lipshapeupper = 0.0
					upperlipthickness = 0.5
					earprominence = 0.42600003
					earsize = 0.0
				}
			}
			cas_male_physique = {
				desc_id = malephysique4
			}
			cas_eyes = {
				desc_id = eyes_brown
			}
			cas_male_eyebrows = {
				desc_id = car_default_brow
			}
			cas_male_hair = {
				desc_id = m_metl_hair_lars
				chosen_materials = {
					material1 = carblack_1
				}
			}
			cas_male_hat = {
				desc_id = None
			}
			cas_male_facial_hair = {
				desc_id = None
			}
			cas_male_torso = {
				desc_id = m_punk_torso_beater
			}
			cas_male_legs = {
				desc_id = m_punk_legs_cutoff
				chosen_materials = {
					material1 = red_3
				}
			}
			cas_male_shoes = {
				desc_id = m_metl_shoes_dirtyhightops
			}
			cas_male_acc_left = {
				desc_id = None
			}
			cas_male_acc_right = {
				desc_id = None
			}
			cas_male_acc_face = {
				desc_id = None
			}
			cas_male_acc_ears = {
				desc_id = None
			}
			cas_male_age = {
				desc_id = car_male_mature
			}
			cas_male_teeth = {
				desc_id = car_male_teeth
			}
			cas_drums = {
				desc_id = singlebasskit
			}
			cas_drums_sticks_l = {
				desc_id = drm_stick_l
			}
			cas_drums_sticks_r = {
				desc_id = drm_stick_r
			}
			cas_drum_finish = {
				desc_id = gh5_shell_ld16
				chosen_materials = {
					material1 = blue_1
				}
			}
			cas_drum_detail = {
				desc_id = gh5_skin_ld09
				chosen_materials = {
					material1 = navy_3
				}
			}
		}
	}
	{
		Name = randomappearance0
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		Name = randomappearance1
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		Name = randomappearance2
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		Name = randomappearance3
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
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
		appearance = {
			cas_body = {
				desc_id = nobody
			}
			cas_bass_highway = {
				desc_id = axelhighway
			}
			cas_guitar_highway = {
				desc_id = axelhighway
			}
			cas_drums_highway = {
				desc_id = axelhighway
			}
			cas_female_win_anim = {
				desc_id = win_hype
			}
			cas_female_lose_anim = {
				desc_id = lose_angryatcrowd
			}
			cas_female_intro_anim = {
				desc_id = intro_hype
			}
		}
	}
]
