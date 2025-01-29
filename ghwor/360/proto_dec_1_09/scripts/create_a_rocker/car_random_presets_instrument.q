cas_preset_guitars = [
	{
		genre = [
			rock
			punk
			`classic	rock`
			goth
			`black	metal`
			`heavy	metal`
			`glam	rock`
			pop
		]
		cas_guitar_body = {
			desc_id = gtr9_esp_ax
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_esp_ax_d`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr9_esp_eclipse_ld_11`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		cas_guitar_neck = {
			desc_id = cag_22fret_esp03
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr_fretboard_d3_01`
					pre_layer = [
						{
							Color = grey_5
							texture = `tex/models/characters/layers/cag/gh5/22fret_ld105_esp_updots`
							flags = 36
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = gtr9_neckhead_01
			chosen_materials = {
				material1 = grey_2guitar
			}
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/esp/gtr9_neckhead_d_01`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/esp/gtr9_neckhead_ld_11`
							flags = 36
							Color = red_1
						}
					]
				}
			]
		}
		cas_guitar_pickguards = {
			desc_id = None
		}
		cas_guitar_bridges = {
			desc_id = gtr9_esp_bridge_03
			chosen_materials = {
				material1 = grey_2guitar
			}
		}
		cas_guitar_knobs = {
			desc_id = gtr9_esp_knob_10_02
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
		cas_guitar_misc = {
			desc_id = None
		}
	}
]
cas_preset_basses = [
	{
		genre = [
			rock
			punk
			`classic	rock`
			goth
			`black	metal`
			`heavy	metal`
			`glam	rock`
			pop
		]
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
	}
]
cas_preset_drums = [
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld16`
							flags = 32
							Color = blue_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld09`
							flags = 4
							Color = navy_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = orange_4
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld43`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld69`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_49`
							flags = 32
							Color = orange_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld92`
							flags = 4
							Color = yellow_orange_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = yellow_2guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld95`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = doublebass
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = grey_4guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_06`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld94`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			punk
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_04`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = grey_4guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_53`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld05`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld01`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld07`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld01`
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
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld03`
							flags = 32
							Color = purple_blue_2
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld12`
							flags = 4
							Color = navy_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld06`
							flags = 32
							Color = grey_3guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld15`
							Color = red_1
							flags = 4
							a = 100
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
							flags = 32
							Color = teal_2
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld16`
							flags = 4
							Color = violet_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld39`
							flags = 32
							Color = grey_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld33`
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
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
							flags = 32
							Color = black_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = doublebass
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld01`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_gk_02`
							flags = 4
							Color = purple_blue_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam	rock`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld11`
							flags = 32
							Color = red_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld34`
							flags = 4
							Color = green_3guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam	rock`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld15`
							flags = 32
							Color = orange_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld45`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld23`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld46`
							flags = 4
							Color = teal_2
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			goth
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld25`
							flags = 32
							Color = yellow_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld56`
							flags = 4
							Color = orange_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam	rock`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld28`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld65`
							flags = 4
							Color = teal_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam	rock`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld38`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld66`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam	rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld34`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld98`
							flags = 4
							Color = red_2
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`glam	rock`
		]
		cas_drums = {
			desc_id = doublebass
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld37`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_22`
							flags = 4
							Color = violet_3
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld01`
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
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld11`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
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
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_04`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld01`
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
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld64`
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
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_49`
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
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_32`
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
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_13`
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
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
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
	}
	{
		genre = [
			`black	metal`
		]
		cas_drums = {
			desc_id = doublebass
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
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
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld15`
							flags = 32
							Color = red_2
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld34`
							flags = 4
							Color = green_3guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = red_2
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld22`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld42`
							flags = 4
							Color = red_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld44`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld42`
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
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld48`
							flags = 4
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld48`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			pop
		]
		cas_drums = {
			desc_id = doublebass
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld38`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld66`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							Color = black_1guitar
							y_trans = -41
							x_scale = 3
							flags = 3
							x_trans = -17
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							Color = black_1guitar
							y_trans = -41
							x_scale = 3
							flags = 3
							x_trans = -26
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							Color = black_1guitar
							y_trans = 38
							x_scale = 3
							y_scale = 49
							flags = 3
							x_trans = -18
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_006`
							Color = black_1guitar
							x_trans = -26
							x_scale = 3
							y_scale = 49
							flags = 3
							y_trans = 38
						}
						{
							texture = `tex/models/characters/skater_male/decals/cag_icons055`
							x_trans = -20
							x_scale = 32
							y_scale = 41
							flags = 3
							y_trans = 7
						}
					]
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld09`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_23`
							flags = 32
							Color = green_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_25`
							flags = 4
							Color = green_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = newtamatriple
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld52`
							flags = 32
							Color = orange_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld28`
							flags = 4
							Color = red_orange_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = doublebass
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = yellow_green_2guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_30`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld20`
							flags = 4
							Color = green_3guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = orange_3
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_42`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld07`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			rock
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld05`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy	metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = red_3
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_18`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld09`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy	metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_17`
							flags = 32
							Color = red_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld16`
							flags = 4
							Color = red_2
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy	metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld30`
							flags = 4
						}
					]
					layers = [
						{
							texture = `tex/models/characters/skater_male/decals/cag_icon022`
							x_scale = 82
							y_scale = 79
							flags = 3
							Color = red_orange_2
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = yellow_2guitar
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_21`
							flags = 32
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy	metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld46`
							flags = 32
							Color = black_1guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_31`
							flags = 4
							Color = green_1guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy	metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld39`
							flags = 32
							Color = yellow_2guitar
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_78`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy	metal`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld36`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld95`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy	metal`
		]
		cas_drums = {
			desc_id = doublebass
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
							flags = 32
							Color = red_1
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld68`
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
	}
	{
		genre = [
			`heavy	metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld29`
							flags = 32
							Color = yellow_orange_2
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld64`
							flags = 4
							Color = yellow_orange_1
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`heavy	metal`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld25`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld35`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic	rock`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld04`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							Color = grey_4guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic	rock`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld14`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							Color = grey_4guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic	rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld31`
							flags = 32
							Color = orange_3
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
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
	}
	{
		genre = [
			`classic	rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld49`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
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
	}
	{
		genre = [
			`classic	rock`
		]
		cas_drums = {
			desc_id = basic
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							Color = yellow_orange_4
							texture = `tex/models/characters/layers/cadrm/drumshell_ds_07`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_skin_ld65`
							flags = 4
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic	rock`
		]
		cas_drums = {
			desc_id = newtamadouble
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_tamashell_ld05`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
	{
		genre = [
			`classic	rock`
		]
		cas_drums = {
			desc_id = doublebass
			cap = [
				{
					base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/gh5_shell_ld01`
							flags = 32
						}
					]
				}
				{
					base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
							flags = 4
							Color = grey_5guitar
						}
					]
				}
			]
		}
		cas_drums_sticks = {
			desc_id = drumsticks1
		}
	}
]
cas_preset_female_vocals = [
	{
		genre = [
			`glam	rock`
			rock
			goth
			pop
			punk
			`black	metal`
			`heavy	metal`
			`classic	rock`
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = `classic	rock`
		}
	}
	{
		cas_mic = {
			desc_id = `black	metal`
		}
		cas_mic_stand = {
			desc_id = `classic	rock`
		}
	}
	{
		cas_mic = {
			desc_id = `glam	rock`
		}
		cas_mic_stand = {
			desc_id = `classic	rock`
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = `classic	rock`
		}
	}
	{
		cas_mic = {
			desc_id = `classic	rock`
		}
		cas_mic_stand = {
			desc_id = `classic	rock`
		}
	}
	{
		genre = [
			`glam	rock`
			rock
			`black	metal`
			goth
			pop
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = `black	metal`
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = `glam	rock`
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		cas_mic = {
			desc_id = `classic	rock`
		}
		cas_mic_stand = {
			desc_id = glam
		}
	}
	{
		genre = [
			`glam	rock`
			rock
			pop
			punk
			`classic	rock`
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = `black	metal`
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = `glam	rock`
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		cas_mic = {
			desc_id = `classic	rock`
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
	}
	{
		genre = [
			rock
			goth
			`black	metal`
			`heavy	metal`
		]
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = `black	metal`
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = `glam	rock`
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = punk
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
	{
		cas_mic = {
			desc_id = `classic	rock`
		}
		cas_mic_stand = {
			desc_id = rock
		}
	}
]
cas_preset_male_vocals = [
	{
		cas_mic = {
			desc_id = rock
		}
		cas_mic_stand = {
			desc_id = rock
		}
		genre = [
			rock
		]
	}
	{
		cas_mic = {
			desc_id = goth
		}
		cas_mic_stand = {
			desc_id = goth
		}
		genre = [
			goth
		]
	}
	{
		cas_mic = {
			desc_id = pop
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
		genre = [
			pop
		]
	}
	{
		cas_mic = {
			desc_id = metal
		}
		cas_mic_stand = {
			desc_id = goth
		}
		genre = [
			`glam	rock`
			`classic	rock`
			punk
		]
	}
	{
		cas_mic = {
			desc_id = mic_standard
		}
		cas_mic_stand = {
			desc_id = mic_stand_metal
		}
		genre = [
			`heavy	metal`
			`black	metal`
		]
	}
]
