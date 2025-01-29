CAS_Drums = [
	{
		desc_id = basic
		frontend_desc = qs(0xad046885)
		sponsor_id = Tama
		mesh = `models\CAR_Instruments\Drums\SingleBassKit`
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
				material = CAD_Drums_01_Primary
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $CADrm_01_Finishes
					}
				]
			}
			{
				base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
				material = CAD_Drums_01_Bassdrum
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $CADrm_01_Finishes_Bassdrum
					}
				]
				$car_rocker_drums_factoredGlobal_0
			}
		]
	}
	{
		desc_id = newtamaDouble
		frontend_desc = qs(0x887993b5)
		sponsor_id = Tama
		mesh = `models\CAR_Instruments\Drums\newtamaDouble`
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
				material = newtamaDouble_Primary1
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $CADrm_01_Finishes
					}
				]
			}
			{
				base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
				material = newtamaDouble_Bassdrum
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $CADrm_01_Finishes_Bassdrum
					}
				]
				$car_rocker_drums_factoredGlobal_0
			}
		]
	}
	{
		desc_id = newtamaTriple
		frontend_desc = qs(0x9ab8ccce)
		sponsor_id = Tama
		mesh = `models\CAR_Instruments\Drums\newtamaTriple`
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
				material = newtamaTriple_Primary1
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $CADrm_01_Finishes
					}
				]
			}
			{
				base_tex = `tex\models\CAR_Instruments\Drums\bass_skin_DS_15a`
				material = newtamaTriple_Bassdrum
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $CADrm_01_Finishes_Bassdrum
					}
				]
				$car_rocker_drums_factoredGlobal_0
			}
		]
	}
	{
		desc_id = DoubleBass
		frontend_desc = qs(0x42c9d1d2)
		sponsor_id = `Pork	Pie`
		mesh = `models\CAR_Instruments\Drums\DoubleBassKit`
		polaroid = Drum_Rewards_Porkpie
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
				material = PorkPie_Kit_Primary
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $CADrm_02_Finishes
					}
				]
			}
			{
				base_tex = `tex/models/CAR_Instruments/Drums/bass_skin_DS_Pork3`
				material = PorkPie_Kit_Bassdrum1
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $CADrm_02_Finishes_Bassdrum
					}
				]
				$car_rocker_drums_factoredGlobal_0
			}
		]
	}
	{
		desc_id = NoDoubt_Drums
		frontend_desc = qs(0xc25cc925)
		mesh = `models\CAR_Instruments\Drums\NoDoubt_Drums`
		cap_textures = [
			{
				base_tex = `tex/models/CAR_Instruments/Drums/drumshell_nodoubt`
				material = NoDoubt_Drums_Primary
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $CADrm_01_Finishes
					}
				]
			}
			{
				base_tex = `tex/models/CAR_Instruments/Drums/bass_skin_ocdp_d`
				material = NoDoubt_Drums_Bassdrum
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $CADrm_01_Finishes_Bassdrum
					}
				]
				$car_rocker_drums_factoredGlobal_0
			}
		]
		locked
		hidden
	}
	{
		desc_id = SingleBassKit_Swift
		frontend_desc = qs(0x2f98c35a)
		mesh = `models\CAR_Instruments\Drums\SingleBassKit_Swift`
		cap_textures = [
			{
				base_tex = `tex\models\CAR_Instruments\Drums\drumshell_ds_pork1`
				material = SingleBassKit_Swift_Primary
				preset_layers = [
					{
						$preset_layer_drum_shell
						mask = $CADrm_01_Finishes
					}
				]
			}
			{
				base_tex = `tex/models/CAR_Instruments/Drums/bass_skin_swift`
				material = SingleBassKit_Swift_Bassdrum
				preset_layers = [
					{
						$preset_layer_bass_skins
						mask = $CADrm_01_Finishes_Bassdrum
					}
				]
				$car_rocker_drums_factoredGlobal_0
			}
		]
		hidden
	}
]
CAS_Drums_Sticks = [
	{
		desc_id = Drumsticks1
		frontend_desc = qs(0x5201c4e5)
		mesh = `models\CAR_Instruments\Drums\CAD_Sticks_01`
		bake_transform = {
			materials = [
				CAD_Sticks_01_Primary1
				CAD_Sticks_01_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_Adrian
		frontend_desc = qs(0x9b6ef4df)
		sponsor_id = Zildjian
		mesh = `models\CAR_Instruments\Drums\Drumsticks_Adrian`
		bake_transform = {
			materials = [
				Drumsticks_Adrian_Primary1
				Drumsticks_Adrian_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_Ronnie
		frontend_desc = qs(0x3530ab6f)
		sponsor_id = Zildjian
		mesh = `models\CAR_Instruments\Drums\Drumsticks_Ronnie`
		bake_transform = {
			materials = [
				Drumsticks_Ronnie_Primary1
				Drumsticks_Ronnie_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_travis
		frontend_desc = qs(0x48f1e77c)
		sponsor_id = Zildjian
		mesh = `models\CAR_Instruments\Drums\Drumsticks_travis`
		bake_transform = {
			materials = [
				Drumsticks_travis_Primary1
				Drumsticks_travis_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_travis2
		frontend_desc = qs(0x7f440168)
		sponsor_id = Zildjian
		mesh = `models\CAR_Instruments\Drums\Drumsticks_travis2`
		bake_transform = {
			materials = [
				Drumsticks_travis2_Primary1
				Drumsticks_travis2_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_DLP
		frontend_desc = qs(0x026288df)
		sponsor_id = Zildjian
		mesh = `models\CAR_Instruments\Drums\Drumsticks_DLP`
		locked
		bake_transform = {
			materials = [
				Drumsticks_DLP_Primary1
				Drumsticks_DLP_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_Zildjian1
		frontend_desc = qs(0xad57e8cc)
		sponsor_id = Zildjian
		mesh = `models\CAR_Instruments\Drums\Drumsticks_zildj`
		polaroid = Drum_Rewards_stix_zildjian
		locked
		bake_transform = {
			materials = [
				Drumsticks_zildj_Primary1
				Drumsticks_zildj_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_Regal
		frontend_desc = qs(0x73e510b6)
		sponsor_id = Regal
		mesh = `models\CAR_Instruments\Drums\Drumsticks_Regal`
		polaroid = Drum_Rewards_stix_regal
		locked
		bake_transform = {
			materials = [
				Drumsticks_Regal_Primary1
				Drumsticks_Regal_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_AHEAD
		frontend_desc = qs(0x75fbbdb9)
		sponsor_id = Ahead
		mesh = `models\CAR_Instruments\Drums\Drumsticks_AHEAD`
		locked
		bake_transform = {
			materials = [
				Drumsticks_AHEAD_Primary1
				Drumsticks_AHEAD_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_AHEAD_5AB
		frontend_desc = qs(0x8a5a831e)
		sponsor_id = Ahead
		mesh = `models\CAR_Instruments\Drums\Drumsticks_AHEAD_5AB`
		locked
		bake_transform = {
			materials = [
				Drumsticks_AHEAD_5AB_Primary1
				Drumsticks_AHEAD_5AB_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_AHEAD_5A
		frontend_desc = qs(0xfff4c6e4)
		sponsor_id = Ahead
		mesh = `models\CAR_Instruments\Drums\Drumsticks_AHEAD_5A`
		locked
		bake_transform = {
			materials = [
				Drumsticks_AHEAD_5A_Primary1
				Drumsticks_AHEAD_5A_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_AHEAD_5B
		frontend_desc = qs(0xd4d99527)
		sponsor_id = Ahead
		mesh = `models\CAR_Instruments\Drums\Drumsticks_AHEAD_5B`
		locked
		bake_transform = {
			materials = [
				Drumsticks_AHEAD_5B_Primary1
				Drumsticks_AHEAD_5B_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
	{
		desc_id = Drumsticks_AHEAD_Rock
		frontend_desc = qs(0xd9ffd0cc)
		sponsor_id = Ahead
		mesh = `models\CAR_Instruments\Drums\Drumsticks_AHEAD_Rock`
		locked
		bake_transform = {
			materials = [
				Drumsticks_AHEAD_Rock_Primary1
				Drumsticks_AHEAD_Rock_Primary2
			]
			$drum_stick_bake_transform_settings
		}
	}
]
car_rocker_drums_factoredGlobal_0 = {
	user_layer_settings = {
		diffuse
		initial_values = {
			x_scale = 72
			y_scale = 72
		}
	}
}
preset_layer_bass_skins = {
	desc_id = Details
	frontend_desc = qs(0x50a6f3e5)
	diffuse
	pre_userlayer
}
drum_stick_bake_transform_settings = {
	dependent_parts = [
		CAS_Body
		CAS_Full_Body
	]
	run_script = cas_drum_stick_bake_transforms
}
preset_layer_drum_shell = {
	desc_id = Finishes
	frontend_desc = qs(0x9f20f698)
	diffuse
	pre_userlayer
}
