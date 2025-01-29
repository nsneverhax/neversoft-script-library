failsafe_car_profile = gh_rocker_judy
preset_musician_profiles_ghrockers = [
	{
		Name = gh_rocker_axel
		fullname = qs(0x0539af5a)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_axel
		blurb = qs(0x187e79b7)
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = axel_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld25`
								flags = 32
								Color = yellow_orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld61`
								flags = 4
								Color = yellow_orange_3
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020`
								flags = 27
								rot = 5413
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020`
								flags = 19
								rot = 900
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_axel_2
		fullname = qs(0x7664c72b)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		preset_icon = photo_axel
		blurb = qs(0x187e79b7)
		appearance = {
			genre = `classic	rock`
			cas_full_body = {
				desc_id = axel_2
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld25`
								flags = 32
								Color = yellow_orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld61`
								flags = 4
								Color = yellow_orange_3
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020`
								flags = 27
								rot = 5413
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics020`
								flags = 19
								rot = 900
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_2009
		fullname = qs(0x7419fe27)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x5a515be2)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = 2009_1
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld65`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld39`
								flags = 32
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_2009_2
		fullname = qs(0x5f34ade4)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x5a515be2)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = 2009_2
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_full_body_acc = {
				desc_id = 2009_2_forearmfx_cyl
			}
			cas_guitar_body = {
				desc_id = gtr130_steampunk
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_sp
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/heroes/gtr_sp_fretboard_d`
						pre_layer = [
							{
								Color = grey_5
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld26_hero_cogs`
								flags = 36
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr130_neckhead
			}
			cas_guitar_pickguards = {
				desc_id = gtr130_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr130_bridge
			}
			cas_guitar_knobs = {
				desc_id = gtr130_knob
			}
			cas_guitar_pickups = {
				desc_id = gtr130_pickup
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr130_misc
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld65`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld39`
								flags = 32
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_newmale
		fullname = qs(0xc52b5247)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xdb4b80bf)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = newmale_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
								flags = 32
								Color = orange_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld16`
								flags = 4
								Color = yellow_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								Color = black_1guitar
								flags = 3
								y_trans = -5
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								Color = black_1guitar
								flags = 3
								y_trans = 4
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								flags = 3
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_newmale_2
		fullname = qs(0x8a9b1a89)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0xdb4b80bf)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = newmale_2
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
								flags = 32
								Color = orange_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld16`
								flags = 4
								Color = yellow_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								Color = black_1guitar
								flags = 3
								y_trans = -5
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								Color = black_1guitar
								flags = 3
								y_trans = 4
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								flags = 3
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_casey
		fullname = qs(0xb4221b9c)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x5a515be2)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = casey_1
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld65`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld39`
								flags = 32
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_casey_2
		fullname = qs(0x7e5e2080)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_casey
		blurb = qs(0x5a515be2)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = casey_3
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld65`
								flags = 4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld39`
								flags = 32
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_judy
		fullname = qs(0xa9028c21)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_judy
		blurb = qs(0x5b674913)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = Judy_1
			}
			cas_female_physique = {
				desc_id = judyphysique
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld64`
								a = 70
								flags = 4
								Color = red_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld53`
								flags = 32
								Color = red_4
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_judy_2
		fullname = qs(0x138318f4)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_judy
		blurb = qs(0x5b674913)
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = Judy_2
			}
			cas_female_physique = {
				desc_id = judyphysique
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld64`
								a = 70
								flags = 4
								Color = red_4
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld53`
								flags = 32
								Color = red_4
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_pandora
		fullname = qs(0xd26ebef4)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_pandora
		blurb = qs(0x6b2b1a76)
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = pandora_1
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld11`
								flags = 4
								Color = navy_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = navy_4
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `black	metal`
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_pandora_2
		fullname = qs(0x2b79ecbe)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_pandora
		blurb = qs(0x6b2b1a76)
		appearance = {
			genre = goth
			cas_full_body = {
				desc_id = pandora_2
			}
			cas_female_physique = {
				desc_id = femalephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld11`
								flags = 4
								Color = navy_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
								flags = 32
								Color = navy_4
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `black	metal`
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_lars
		fullname = qs(0x9dd7644f)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0x3c884eac)
		face_tension = 0
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = Lars_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld43`
								flags = 32
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
								flags = 4
								Color = grey_2guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_lars_2
		fullname = qs(0xb270dc33)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0x3c884eac)
		face_tension = 0
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = Lars_2
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr132_axe
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_hero_axe
			}
			cas_guitar_head = {
				desc_id = gtr132_neckhead
			}
			cas_guitar_pickguards = {
				desc_id = gtr132_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr132_bridge
			}
			cas_guitar_knobs = {
				desc_id = gtr132_knob
			}
			cas_guitar_pickups = {
				desc_id = gtr132_pickup
			}
			cas_guitar_misc = {
				desc_id = None
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld43`
								flags = 32
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
								flags = 4
								Color = grey_2guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_johnny
		fullname = qs(0x525fe42c)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_johnny
		blurb = qs(0x3292ac81)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = Johnny_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_13`
								flags = 4
								Color = red_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld20`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_johnny_2
		fullname = qs(0x8257523c)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_johnny
		blurb = qs(0x3292ac81)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = Johnny_2
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr135_johnny
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_johnny
			}
			cas_guitar_head = {
				desc_id = gtr135_neckhead
			}
			cas_guitar_pickguards = {
				desc_id = gtr135_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr_bridge_johnny
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr135_knob
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_johnny
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr135_misc
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_13`
								flags = 4
								Color = red_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld20`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_johnny_2_ghost
		fullname = qs(0xd866c63d)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_johnny
		blurb = qs(0x3292ac81)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = johnny_2_ghost
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr135_johnny
			}
			cas_guitar_neck = {
				desc_id = gtr_fretboard_johnny
			}
			cas_guitar_head = {
				desc_id = gtr135_neckhead
			}
			cas_guitar_pickguards = {
				desc_id = gtr135_pg
			}
			cas_guitar_bridges = {
				desc_id = gtr_bridge_johnny
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_guitar_knobs = {
				desc_id = gtr135_knob
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_johnny
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr135_misc
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_13`
								flags = 4
								Color = red_1
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld20`
								flags = 32
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_izzy
		fullname = qs(0x3ba5cbc5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_izzy
		blurb = qs(0xf68778fe)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = izzy_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld48`
								flags = 32
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld21`
								flags = 4
								Color = grey_3guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_eddie
		fullname = qs(0x91c2e6b5)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_eddie
		blurb = qs(0x0ff20f3f)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = eddie_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
								flags = 32
								Color = orange_2
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld16`
								flags = 4
								Color = yellow_1guitar
							}
						]
						layers = [
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								Color = black_1guitar
								flags = 3
								y_trans = -5
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								Color = black_1guitar
								flags = 3
								y_trans = 4
							}
							{
								texture = `tex/models/characters/skater_male/decals/cag_graphics037`
								flags = 3
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = mic_standard
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_clive
		fullname = qs(0xccb97235)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_clive
		blurb = qs(0xac376279)
		appearance = {
			genre = classic
			cas_full_body = {
				desc_id = clive_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						layers = [
							{
								font = fontgrid_text_a1
								text = 87
								flags = 3
								x_trans = -31
							}
							{
								font = fontgrid_text_a1
								text = 73
								x_trans = -22
								flags = 3
								y_scale = 125
							}
							{
								font = fontgrid_text_a1
								text = 78
								Color = grey_5
								flags = 3
								x_trans = -14
							}
							{
								font = fontgrid_text_a1
								text = 83
								x_trans = 0
								x_scale = 175
								flags = 3
								y_scale = 185
							}
							{
								font = fontgrid_text_a1
								text = 84
								flags = 3
								x_trans = 12
							}
							{
								font = fontgrid_text_a1
								text = 79
								y_scale = 125
								flags = 3
								x_trans = 21
							}
							{
								font = fontgrid_text_a1
								text = 78
								flags = 3
								x_trans = 30
							}
						]
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/bass_skin_ds_01`
								flags = 4
								Color = yellow_orange_3
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld14`
								flags = 32
								Color = yellow_orange_4
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = rock
			}
			cas_mic_stand = {
				desc_id = rock
			}
		}
	}
	{
		Name = gh_rocker_minotaur
		fullname = qs(0x1e3c77ae)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0x3c884eac)
		face_tension = 0
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = minotaur_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld43`
								flags = 32
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
								flags = 4
								Color = grey_2guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
	{
		Name = gh_rocker_arthas
		fullname = qs(0x053ccfee)
		allowed_parts = [
			bass
			drum
			guitar
			vocals
		]
		preset_icon = photo_lars
		blurb = qs(0x3c884eac)
		face_tension = 0
		appearance = {
			genre = `heavy	metal`
			cas_full_body = {
				desc_id = arthas_1
			}
			cas_male_physique = {
				desc_id = malephysiqueuntouched
			}
			cas_guitar_body = {
				desc_id = gtr22_bc_rich_warlock
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr22_bc_rich_warlock_d`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/bc_rich/gtr_bc_rich_warlock_ld1`
								flags = 4
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_guitar_neck = {
				desc_id = cag_22fret_bcrich04
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d4_01`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cag/gh5/22_fret_ld01_hero_dots`
								flags = 4
								Color = grey_4guitar
							}
						]
					}
				]
			}
			cas_guitar_head = {
				desc_id = gtr22_neckhead_beast3
				cap = [
					{
						base_tex = `tex/models/car_instruments/guitars/bc_rich/gtr20_neckhead_beast1_d`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cag/bc_rich/gtr20_neckhead_ld02`
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
				desc_id = gtr22_bridge_whammy1
			}
			cas_guitar_knobs = {
				desc_id = gtr_knob_01
			}
			cas_guitar_pickups = {
				desc_id = gtr_pickup_type2_paf2
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_guitar_misc = {
				desc_id = gtr_misc_switch
			}
			cas_bass_body = {
				desc_id = bs_sch_t_body
				cap = [
					{
						base_tex = `tex\models\car_instruments\bass\schecter\bs_sch_modelt`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_dtl01`
								Color = black_1guitar
							}
						]
					}
				]
			}
			cas_bass_neck = {
				desc_id = bass_sch_fretboard_24d
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/esp/bass_fretboard_24_d_04`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_inl_ld30`
								flags = 4
								Color = grey_5guitar
							}
						]
					}
				]
			}
			cas_bass_head = {
				desc_id = bs_sch_t_nhead
				cap = [
					{
						base_tex = `tex/models/car_instruments/bass/schecter/bass_neckhead_mt`
						pre_layer = [
							{
								Color = black_1guitar
								texture = `tex/models/characters/layers/cab/schecter/bs_sch_mt_hd_dtl06`
								flags = 36
							}
						]
					}
				]
			}
			cas_bass_pickguards = {
				desc_id = bs_sch_t_pga
			}
			cas_bass_pickups = {
				desc_id = bass_pickup_sd
				chosen_materials = {
					material1 = black_1guitar
				}
			}
			cas_bass_bridges = {
				desc_id = bs_sch_brdg_a
			}
			cas_bass_knobs = {
				desc_id = knob_knurl02
			}
			cas_bass_misc = {
				desc_id = None
			}
			cas_drums = {
				desc_id = basic
				cap = [
					{
						base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_shell_ld43`
								flags = 32
								Color = grey_3guitar
							}
						]
					}
					{
						base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
						pre_layer = [
							{
								texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
								flags = 4
								Color = grey_2guitar
							}
						]
					}
				]
			}
			cas_drums_sticks = {
				desc_id = drumsticks1
			}
			cas_mic = {
				desc_id = `classic	rock`
			}
			cas_mic_stand = {
				desc_id = `classic	rock`
			}
		}
	}
]
