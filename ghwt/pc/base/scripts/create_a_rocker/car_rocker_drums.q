cas_drums = [
	{
		desc_id = basic
		frontend_desc = qs(0xad046885)
		mesh = 'models\\CAR_Instruments\\Drums\\SingleBassKit.skin'
		sections = [
			{
				desc_id = finishes
				frontend_desc = qs(0x9f20f698)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\drumshell_ds_pork1.dds'
				material = cad_drums_01_primary
				mask = $cadrm_01_finishes
				diffuse
				pre_userlayer
			}
			{
				desc_id = details
				frontend_desc = qs(0x50a6f3e5)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $cadrm_01_finishes_bassdrum
				diffuse
				pre_userlayer
			}
			{
				desc_id = car_primitives
				frontend_desc = qs(0x7dc468d3)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_basic_primitives_1
				userlayer
				diffuse
			}
			{
				desc_id = car_outlines_primitives
				frontend_desc = qs(0x955f1285)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_basic_primitives_2
				userlayer
				diffuse
			}
			{
				desc_id = car_tattoo_decal
				frontend_desc = qs(0x80142024)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_gradiant_shapes
				userlayer
				diffuse
			}
			{
				desc_id = car_icon_decals
				frontend_desc = qs(0xcd9be7cd)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_icons
				userlayer
				diffuse
			}
			{
				desc_id = car_living
				frontend_desc = qs(0xac01b8a2)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_living_shapes
				userlayer
				diffuse
			}
			{
				desc_id = car_graphics
				frontend_desc = qs(0xde6cb37a)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_graphics
				userlayer
				diffuse
			}
			{
				desc_id = car_sponsors
				frontend_desc = qs(0xc26f9911)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_sponsors
				userlayer
				diffuse
			}
			{
				desc_id = `font a1`
				frontend_desc = qs(0x1c40b9b0)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_fontgrid_title_a1
				diffuse
				userlayer
			}
			{
				desc_id = `font a3`
				frontend_desc = qs(0x5c8b3f2b)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_fontgrid_text_a3
				diffuse
				userlayer
			}
			{
				desc_id = `font a6`
				frontend_desc = qs(0x16701ac6)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_fontgrid_text_a6
				diffuse
				userlayer
			}
			{
				desc_id = `font a8`
				frontend_desc = qs(0x18698a72)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				mask = $car_fontgrid_text_a8
				diffuse
				userlayer
			}
		]
	}
	{
		desc_id = doublebass
		frontend_desc = qs(0x42c9d1d2)
		mesh = 'models\\CAR_Instruments\\Drums\\DoubleBassKit.skin'
		locked
		polaroid = drum_rewards_porkpie
		price = 1500
		sections = [
			{
				desc_id = finishes
				frontend_desc = qs(0x9f20f698)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\drumshell_ds_pork7.dds'
				material = porkpie_kit_primary
				mask = $cadrm_02_finishes
				diffuse
				pre_userlayer
			}
			{
				desc_id = details
				frontend_desc = qs(0x50a6f3e5)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $cadrm_02_finishes_bassdrum
				diffuse
				pre_userlayer
			}
			{
				desc_id = car_primitives
				frontend_desc = qs(0x7dc468d3)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_basic_primitives_1
				userlayer
				diffuse
			}
			{
				desc_id = car_outlines_primitives
				frontend_desc = qs(0x955f1285)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_basic_primitives_2
				userlayer
				diffuse
			}
			{
				desc_id = car_tattoo_decal
				frontend_desc = qs(0x80142024)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_gradiant_shapes
				userlayer
				diffuse
			}
			{
				desc_id = car_icon_decals
				frontend_desc = qs(0xcd9be7cd)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_icons
				userlayer
				diffuse
			}
			{
				desc_id = car_living
				frontend_desc = qs(0xac01b8a2)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_living_shapes
				userlayer
				diffuse
			}
			{
				desc_id = car_graphics
				frontend_desc = qs(0xde6cb37a)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_graphics
				userlayer
				diffuse
			}
			{
				desc_id = car_sponsors
				frontend_desc = qs(0xc26f9911)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_sponsors
				userlayer
				diffuse
			}
			{
				desc_id = `font a1`
				frontend_desc = qs(0x1c40b9b0)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_fontgrid_title_a1
				diffuse
				userlayer
			}
			{
				desc_id = `font a3`
				frontend_desc = qs(0x5c8b3f2b)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_fontgrid_text_a3
				diffuse
				userlayer
			}
			{
				desc_id = `font a6`
				frontend_desc = qs(0x16701ac6)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_fontgrid_text_a6
				diffuse
				userlayer
			}
			{
				desc_id = `font a8`
				frontend_desc = qs(0x18698a72)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_pork3.dds'
				material = porkpie_kit_bassdrum
				mask = $car_fontgrid_text_a8
				diffuse
				userlayer
			}
		]
	}
	{
		desc_id = monster
		frontend_desc = qs(0x7c08db0d)
		price = 5000
		locked
		polaroid = drum_rewards_oc
		mesh = 'models\\CAR_Instruments\\Drums\\QuadBassKit.skin'
		sections = [
			{
				desc_id = finishes
				frontend_desc = qs(0x9f20f698)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\drumshell_ds_oc1.dds'
				material = quadbasskit_primary
				mask = $cadrm_03_finishes
				diffuse
				pre_userlayer
			}
			{
				desc_id = details
				frontend_desc = qs(0x50a6f3e5)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $cadrm_03_finishes_bassdrum
				diffuse
				pre_userlayer
			}
			{
				desc_id = car_primitives
				frontend_desc = qs(0x7dc468d3)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_basic_primitives_1
				userlayer
				diffuse
			}
			{
				desc_id = car_outlines_primitives
				frontend_desc = qs(0x955f1285)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_basic_primitives_2
				userlayer
				diffuse
			}
			{
				desc_id = car_tattoo_decal
				frontend_desc = qs(0x80142024)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_gradiant_shapes
				userlayer
				diffuse
			}
			{
				desc_id = car_icon_decals
				frontend_desc = qs(0xcd9be7cd)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_icons
				userlayer
				diffuse
			}
			{
				desc_id = car_living
				frontend_desc = qs(0xac01b8a2)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_living_shapes
				userlayer
				diffuse
			}
			{
				desc_id = car_graphics
				frontend_desc = qs(0xde6cb37a)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_graphics
				userlayer
				diffuse
			}
			{
				desc_id = car_sponsors
				frontend_desc = qs(0xc26f9911)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_sponsors
				userlayer
				diffuse
			}
			{
				desc_id = `font a1`
				frontend_desc = qs(0x1c40b9b0)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_fontgrid_title_a1
				diffuse
				userlayer
			}
			{
				desc_id = `font a3`
				frontend_desc = qs(0x5c8b3f2b)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_fontgrid_text_a3
				diffuse
				userlayer
			}
			{
				desc_id = `font a6`
				frontend_desc = qs(0x16701ac6)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_fontgrid_text_a6
				diffuse
				userlayer
			}
			{
				desc_id = `font a8`
				frontend_desc = qs(0x18698a72)
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_ds_oc1.dds'
				material = quadbasskit_bassdrum
				mask = $car_fontgrid_text_a8
				diffuse
				userlayer
			}
		]
	}
]
cas_drums_sticks = [
	{
		desc_id = drumsticks1
		frontend_desc = qs(0x4a301f1d)
		mesh = 'models\\CAR_Instruments\\Drums\\CAD_Sticks_01.skin'
	}
	{
		desc_id = drumsticks_zildjian1
		frontend_desc = qs(0x5c1a7bfd)
		mesh = 'models\\CAR_Instruments\\Drums\\Drumsticks_zildj.skin'
		locked
		polaroid = drum_rewards_stix_zildjian
	}
	{
		desc_id = drumsticks_zildjian2
		frontend_desc = qs(0xdc01aa1e)
		mesh = 'models\\CAR_Instruments\\Drums\\Drumsticks_Zildj2.skin'
		locked
		polaroid = drum_rewards_stix_zildjian
	}
	{
		desc_id = drumsticks_regal
		frontend_desc = qs(0x6c1a557c)
		mesh = 'models\\CAR_Instruments\\Drums\\Drumsticks_Regal.skin'
		locked
		polaroid = drum_rewards_stix_regal
	}
]
