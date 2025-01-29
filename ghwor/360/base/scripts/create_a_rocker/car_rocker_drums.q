cas_drums = [
	{
		desc_id = basic
		frontend_desc = qs(0xad046885)
		sponsor_id = tama
		mesh = `models\car_instruments\drums\singlebasskit`
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
				material = cad_drums_01_primary
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $cadrm_01_finishes
					}
				]
			}
			{
				base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
				material = cad_drums_01_bassdrum
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $cadrm_01_finishes_bassdrum
					}
				]
				$car_rocker_drums_factoredglobal_0
			}
		]
		default_cap = [
			{
				base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
				layers = [
					{
						texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01c`
						y_trans = 32
						flags = 3
						x_scale = 37
						y_scale = 37
					}
				]
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
						flags = 4
					}
				]
			}
		]
	}
	{
		desc_id = newtamadouble
		frontend_desc = qs(0x887993b5)
		sponsor_id = tama
		mesh = `models\car_instruments\drums\newtamadouble`
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
				material = newtamadouble_primary1
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $cadrm_01_finishes
					}
				]
			}
			{
				base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
				material = newtamadouble_bassdrum
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $cadrm_01_finishes_bassdrum
					}
				]
				$car_rocker_drums_factoredglobal_0
			}
		]
		default_cap = [
			{
				base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
				layers = [
					{
						texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01c`
						y_trans = 32
						flags = 3
						x_scale = 37
						y_scale = 37
					}
				]
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
						flags = 4
					}
				]
			}
		]
	}
	{
		desc_id = newtamatriple
		frontend_desc = qs(0x562ca1bf)
		sponsor_id = tama
		mesh = `models\car_instruments\drums\newtamatriple`
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
				material = newtamatriple_primary1
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $cadrm_01_finishes
					}
				]
			}
			{
				base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
				material = newtamatriple_bassdrum
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $cadrm_01_finishes_bassdrum
					}
				]
				$car_rocker_drums_factoredglobal_0
			}
		]
		default_cap = [
			{
				base_tex = `tex\models\car_instruments\drums\bass_skin_ds_15a`
				layers = [
					{
						texture = `tex/models/characters/skater_male/decals/cag_sponsors_tama_01c`
						y_trans = 32
						flags = 3
						x_scale = 37
						y_scale = 37
					}
				]
				pre_layer = [
					{
						texture = `tex/models/characters/layers/cadrm/bass_skin_ds_15`
						flags = 4
					}
				]
			}
		]
	}
	{
		desc_id = doublebass
		frontend_desc = qs(0x42c9d1d2)
		sponsor_id = `pork	pie`
		mesh = `models\car_instruments\drums\doublebasskit`
		polaroid = drum_rewards_porkpie
		cap_textures = [
			{
				base_tex = `tex\models\car_instruments\drums\drumshell_ds_pork1`
				material = porkpie_kit_primary
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $cadrm_02_finishes
					}
				]
			}
			{
				base_tex = `tex\models\car_instruments\drums\bass_skin_ds_pork3`
				material = porkpie_kit_bassdrum1
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $cadrm_02_finishes_bassdrum
					}
				]
				$car_rocker_drums_factoredglobal_0
			}
		]
	}
]
cas_drums_sticks = [
	{
		desc_id = drumsticks1
		frontend_desc = qs(0x4a301f1d)
		mesh = `models\car_instruments\drums\cad_sticks_01`
		bake_transform = {
			materials = [
				cad_sticks_01_primary1
				cad_sticks_01_primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = drumsticks_dlp
		frontend_desc = qs(0x026288df)
		sponsor_id = zildjian
		mesh = `models\car_instruments\drums\drumsticks_dlp`
		bake_transform = {
			materials = [
				drumsticks_dlp_primary1
				drumsticks_dlp_primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = drumsticks_z_kramer
		frontend_desc = qs(0xe1699028)
		sponsor_id = zildjian
		mesh = `models\car_instruments\drums\drumsticks_z_kramer`
		bake_transform = {
			materials = [
				drumsticks_z_kramer_primary1
				drumsticks_z_kramer_primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = drumsticks_z_hawkins
		frontend_desc = qs(0xd0ad81dd)
		sponsor_id = zildjian
		mesh = `models\car_instruments\drums\drumsticks_z_hawkins`
		bake_transform = {
			materials = [
				drumsticks_z_hawkins_primary1
				drumsticks_z_hawkins_primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = drumsticks_z_singer
		frontend_desc = qs(0xc8e8088f)
		sponsor_id = zildjian
		mesh = `models\car_instruments\drums\drumsticks_z_singer`
		bake_transform = {
			materials = [
				drumsticks_z_singer_primary1
				drumsticks_z_singer_primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = drumsticks_zildjian1
		frontend_desc = qs(0xad57e8cc)
		sponsor_id = zildjian
		mesh = `models\car_instruments\drums\drumsticks_zildj`
		polaroid = drum_rewards_stix_zildjian
		bake_transform = {
			materials = [
				drumsticks_zildj_primary1
				drumsticks_zildj_primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = drumsticks_z_rock
		frontend_desc = qs(0x97523935)
		sponsor_id = zildjian
		mesh = `models\car_instruments\drums\drumsticks_z_rock`
		locked
		bake_transform = {
			materials = [
				drumsticks_z_rock_primary1
				drumsticks_z_rock_primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = drumsticks_z_5bred
		frontend_desc = qs(0x249b4d51)
		sponsor_id = zildjian
		mesh = `models\car_instruments\drums\drumsticks_z_5bred`
		locked
		bake_transform = {
			materials = [
				drumsticks_z_5bred_primary1
				drumsticks_z_5bred_primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = drumsticks_regal
		frontend_desc = qs(0x73e510b6)
		sponsor_id = regal
		mesh = `models\car_instruments\drums\drumsticks_regal`
		polaroid = drum_rewards_stix_regal
		locked
		bake_transform = {
			materials = [
				drumsticks_regal_primary1
				drumsticks_regal_primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
]
car_rocker_drums_factoredglobal_0 = {
	user_layer_settings = {
		diffuse
		initial_values = {
			x_scale = 72
			y_scale = 72
		}
	}
}
preset_layer_bass_skins = {
	desc_id = details
	frontend_desc = qs(0x50a6f3e5)
	diffuse
	pre_userlayer
}
drum_stick_bake_transform_settings = {
	dependent_parts = [
		cas_body
		cas_full_body
	]
	run_script = cas_drum_stick_bake_transforms
}
preset_layer_drum_shell = {
	desc_id = finishes
	frontend_desc = qs(0x9f20f698)
	diffuse
	pre_userlayer
}
