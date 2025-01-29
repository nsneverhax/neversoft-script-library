cas_male_legs = [
	{
		desc_id = m_legs_boneman
		frontend_desc = qs(0x3e307efe)
		mesh = 0x11f9c7ba
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_legs_capsuleman
		frontend_desc = qs(0xfcda84af)
		mesh = 0x94dbc72b
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_pop_legs_baggy
		frontend_desc = qs(0x505794b0)
		mesh = `models/car/male/m_pop_legs_baggy`
		random_weight = 1.0
		materials = [
			m_pop_legs_baggy_primary
			m_pop_legs_baggy_secondary
		]
		cloth = `models/car/male/m_pop_legs_baggy`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
		]
		genre = [
			pop
		]
	}
	{
		desc_id = m_pop_legs_bjeans
		frontend_desc = qs(0x8501b76d)
		mesh = `models/car/male/m_pop_legs_bjeans`
		materials = [
			m_pop_legs_bjeans_primary
			m_pop_legs_bjeans_secondary
		]
		random_weight = 1.0
		genre = [
			pop
		]
	}
	{
		desc_id = m_pop_legs_jeans
		frontend_desc = qs(0x887f7c74)
		mesh = `models/car/male/m_pop_legs_jeans`
		materials = [
			m_pop_legs_jeans_primary
			m_pop_legs_jeans_secondary
		]
		random_weight = 1.0
		genre = [
			pop
		]
	}
	{
		desc_id = m_pop_legs_pants
		frontend_desc = qs(0x0b725cf9)
		mesh = `models/car/male/m_pop_legs_pants`
		cloth = `models/car/male/m_pop_legs_pants`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		random_weight = 1.0
		genre = [
			pop
		]
		materials = [
			m_pop_legs_pants_primary
		]
		material_groups = [
			{
				materials = [
					m_pop_legs_pants_primary
					m_pop_legs_pants_primary_cloth
				]
				Name = qs(0x44458d9d)
			}
		]
	}
	{
		desc_id = m_pop_legs_slacks
		frontend_desc = qs(0x9b10f031)
		mesh = `models/car/male/m_pop_legs_slacks`
		materials = [
			m_pop_legs_slacks_primary
			m_pop_legs_slacks_secondary
		]
		random_weight = 1.0
		genre = [
			pop
		]
	}
	{
		desc_id = m_punk_legs_jzip
		frontend_desc = qs(0x5cd9241b)
		locked
		mesh = `models/car/male/m_punk_legs_jzip`
		material_groups = [
			{
				materials = [
					m_punk_legs_jzip_primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
	}
	{
		desc_id = m_punk_legs_camo
		frontend_desc = qs(0xcb247ff3)
		mesh = `models/car/male/m_punk_legs_camo`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_list = [
			m_punk_legs_camo_02
			m_punk_legs_camo_03
			m_punk_legs_camo_04
		]
		swatch_texture = `tex/models/characters/car/male/punk/swatch_camo03`
	}
	{
		desc_id = m_punk_legs_camo_02
		frontend_desc = qs(0x8fadbe17)
		mesh = `models/car/male/m_punk_legs_camo_02`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_for = m_punk_torso_camo
		swatch_texture = `tex/models/characters/car/male/punk/swatch_camo01`
	}
	{
		desc_id = m_punk_legs_camo_03
		frontend_desc = qs(0xb5c13c6f)
		mesh = `models/car/male/m_punk_legs_camo_03`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_for = m_punk_torso_camo
		swatch_texture = `tex/models/characters/car/male/punk/swatch_camo02`
	}
	{
		desc_id = m_punk_legs_camo_04
		frontend_desc = qs(0x1009c892)
		mesh = `models/car/male/m_punk_legs_camo_04`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_for = m_punk_torso_camo
		swatch_texture = `tex/models/characters/car/male/punk/swatch_camo04`
	}
	{
		desc_id = m_punk_legs_riding
		frontend_desc = qs(0x103c7f11)
		mesh = `models/car/male/m_punk_legs_riding`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_list = [
			m_punk_legs_riding_02
			m_punk_legs_riding_03
			m_punk_legs_riding_04
		]
		swatch_texture = `tex/models/characters/car/male/punk/swatch_jadpur03`
	}
	{
		desc_id = m_punk_legs_riding_02
		frontend_desc = qs(0x681153df)
		mesh = `models/car/male/m_punk_legs_riding_02`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_for = m_punk_torso_riding
		swatch_texture = `tex/models/characters/car/male/punk/swatch_jadpur01`
	}
	{
		desc_id = m_punk_legs_riding_03
		frontend_desc = qs(0xcd942375)
		mesh = `models/car/male/m_punk_legs_riding_03`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_for = m_punk_torso_riding
		swatch_texture = `tex/models/characters/car/male/punk/swatch_jadpur02`
	}
	{
		desc_id = m_punk_legs_riding_04
		frontend_desc = qs(0xc8b42fbf)
		mesh = `models/car/male/m_punk_legs_riding_04`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_for = m_punk_torso_riding
		swatch_texture = `tex/models/characters/car/male/punk/swatch_jadpur04`
	}
	{
		desc_id = m_punk_legs_cuff
		frontend_desc = qs(0x31368878)
		mesh = `models/car/male/m_punk_legs_cuff`
		materials = [
			m_punk_legs_cuff_primary
		]
		random_weight = 1.0
		genre = [
			punk
		]
	}
	{
		desc_id = m_punk_legs_johnny1
		frontend_desc = qs(0x5b8f114a)
		mesh = `models/car/male/m_punk_legs_johnny1`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_list = [
			m_punk_legs_johnny1_02
			m_punk_legs_johnny1_03
			m_punk_legs_johnny1_04
		]
		swatch_texture = `tex/models/characters/car/male/punk/swatch_jeans01`
	}
	{
		desc_id = m_punk_legs_johnny1_02
		frontend_desc = qs(0x2db9bb22)
		mesh = `models/car/male/m_punk_legs_johnny1_02`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_for = m_punk_torso_johnny1
		swatch_texture = `tex/models/characters/car/male/punk/swatch_jeans02`
	}
	{
		desc_id = m_punk_legs_johnny1_03
		frontend_desc = qs(0x0106b1c4)
		mesh = `models/car/male/m_punk_legs_johnny1_03`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_for = m_punk_torso_johnny1
		swatch_texture = `tex/models/characters/car/male/punk/swatch_jeans03`
	}
	{
		desc_id = m_punk_legs_johnny1_04
		frontend_desc = qs(0xd6684139)
		mesh = `models/car/male/m_punk_legs_johnny1_04`
		random_weight = 1.0
		genre = [
			punk
		]
		swatch_for = m_punk_torso_johnny1
		swatch_texture = `tex/models/characters/car/male/punk/swatch_jeans04`
	}
	{
		desc_id = m_punk_legs_cutoff
		frontend_desc = qs(0x753df1b8)
		mesh = `models/car/male/m_punk_legs_cutoff`
		random_weight = 1.0
		genre = [
			punk
		]
		materials = [
			punk_shortscutoff_primary
		]
	}
	{
		desc_id = m_punk_legs_jny_1
		frontend_desc = qs(0xa8957c60)
		mesh = `models/car/male/m_punk_legs_jny_1`
		cloth = `models/car/male/m_punk_legs_jny_1`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		random_weight = 1.0
		genre = [
			punk
		]
		materials = [
			m_punk_legs_jny_1_primary
			m_punk_legs_jny_1_secondary
		]
	}
	{
		desc_id = m_punk_legs_jny_2
		frontend_desc = qs(0xc0c17ab2)
		mesh = `models/car/male/m_punk_legs_jny_2`
		random_weight = 1.0
		genre = [
			punk
		]
		locked
		materials = [
			m_punk_legs_jny_2_primary
			m_punk_legs_jny_2_secondary
		]
	}
	{
		desc_id = m_punk_legs_jny_3
		frontend_desc = qs(0xe9be97d7)
		mesh = `models/car/male/m_punk_legs_jny_3`
		random_weight = 1.0
		genre = [
			punk
		]
		locked
	}
	{
		desc_id = m_punk_legs_bullet
		frontend_desc = qs(0x64926f7f)
		cloth = `models/car/male/m_punk_legs_bullet`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		mesh = `models/car/male/m_punk_legs_bullet`
		materials = [
			m_punk_legs_bullet_primary
			m_punk_legs_bullet_secondary
		]
		random_weight = 1.0
		genre = [
			punk
		]
	}
	{
		desc_id = m_clsc_legs_whtbells
		frontend_desc = qs(0x6fca794c)
		mesh = `models/car/male/m_clsc_legs_whtbells`
		random_weight = 1.0
		genre = [
			`classic	rock`
		]
		materials = [
			m_clsc_legs_whtbells_primary
		]
	}
	{
		desc_id = m_clsc_legs_ltjeans
		frontend_desc = qs(0x5b5d7626)
		mesh = `models/car/male/m_clsc_legs_ltjeans`
		random_weight = 1.0
		genre = [
			`classic	rock`
		]
		materials = [
			m_clsc_legs_ltjeans_primary
			m_clsc_legs_ltjeans_secondary
		]
	}
	{
		desc_id = m_clsc_legs_scrfpants
		frontend_desc = qs(0x24334767)
		mesh = `models/car/male/m_clsc_legs_scrfpants`
		cloth = `models/car/male/m_clsc_legs_scrfpants`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		random_weight = 1.0
		genre = [
			`classic	rock`
		]
		materials = [
			m_clsc_legs_scrfpants_primary
			m_clsc_legs_scrfpants_secondary
		]
	}
	{
		desc_id = m_clsc_legs_jimi
		frontend_desc = qs(0xd7e377c0)
		mesh = `models/car/male/m_clsc_legs_jimi`
		random_weight = 1.0
		genre = [
			`classic	rock`
		]
		materials = [
			m_clsc_legs_jimi_primary
		]
		hidden
	}
	{
		desc_id = m_clsc_legs_clive
		frontend_desc = qs(0xae76ad9c)
		mesh = `models/car/male/m_clsc_legs_clive`
		random_weight = 1.0
		genre = [
			`classic	rock`
		]
		material_groups = [
			{
				materials = [
					m_clsc_legs_clive_primary
				]
				shader = $cas_shader_skin_masked1
			}
			{
				materials = [
					m_clsc_legs_clive_primary
				]
				shader = $cas_shader_skin_masked2
			}
			{
				materials = [
					m_clsc_legs_clive_secondary
				]
			}
		]
	}
	{
		desc_id = m_clsc_legs_clive2
		frontend_desc = qs(0xb4bfdaee)
		mesh = `models/car/male/m_clsc_legs_clive2`
		random_weight = 1.0
		genre = [
			`classic	rock`
		]
		locked
		materials = [
			m_clsc_legs_clive2_primary
			m_clsc_legs_clive2_secondary
		]
	}
	{
		desc_id = m_clsc_legs_clive3
		frontend_desc = qs(0xa97cf58c)
		mesh = `models/car/male/m_clsc_legs_clive3`
		random_weight = 1.0
		genre = [
			`classic	rock`
		]
		materials = [
			m_clsc_legs_clive3_primary
			m_clsc_legs_clive3_secondary
		]
		locked
	}
	{
		desc_id = m_clsc_legs_clive4
		frontend_desc = qs(0xe6029a15)
		mesh = `models/car/male/m_clsc_legs_clive4`
		random_weight = 1.0
		genre = [
			`classic	rock`
		]
		locked
		materials = [
			m_clsc_legs_clive4_primary
			m_clsc_legs_clive4_secondary
		]
	}
	{
		desc_id = m_goth_legs_strait
		frontend_desc = qs(0x5eeea3b9)
		mesh = `models/car/male/m_goth_legs_strait`
		random_weight = 1.0
		genre = [
			goth
		]
		materials = [
			m_goth_legs_strait_primary
			m_goth_legs_strait_secondary
			m_goth_legs_strait_jock
		]
	}
	{
		desc_id = m_goth_legs_holster
		frontend_desc = qs(0xbeafb309)
		mesh = `models/car/male/m_goth_legs_holster`
		materials = [
			m_goth_legs_holster_jeans
		]
		cloth = `models/car/male/m_goth_legs_holster`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
		]
		random_weight = 1.0
		genre = [
			goth
		]
	}
	{
		desc_id = m_goth_legs_tux
		frontend_desc = qs(0xbb19b927)
		mesh = `models/car/male/m_goth_legs_tux`
		$cas_male_hair_common_settings
		material_groups = [
			{
				materials = [
					m_goth_legs_tux_primary
				]
				shader = $cas_shader_hair
			}
			{
				materials = [
					m_goth_legs_tux_secondary
				]
				shader = $cas_shader_skin
			}
		]
		random_weight = 1.0
		genre = [
			goth
		]
	}
	{
		desc_id = m_goth_legs_skirted
		frontend_desc = qs(0x3c93b51c)
		mesh = `models/car/male/m_goth_legs_skirted`
		cloth = `models/car/male/m_goth_legs_skirted`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		random_weight = 0.25
		material_groups = [
			{
				materials = [
					m_goth_legs_skirted_primary
				]
				shader = $cas_shader_skin_masked2
			}
			{
				materials = [
					m_goth_legs_skirted_secondary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		genre = [
			goth
		]
	}
	{
		desc_id = m_goth_legs_vinyl
		frontend_desc = qs(0xb78e84f3)
		mesh = `models/car/male/m_goth_legs_vinyl`
		materials = [
			m_goth_legs_vinyl_primary
		]
		cloth = `models/car/male/m_goth_legs_vinyl`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
		]
		random_weight = 1.0
		genre = [
			goth
		]
	}
	{
		desc_id = m_legs_ninja
		frontend_desc = qs(0x5f0ba890)
		mesh = `models/car/male/m_legs_ninja`
		materials = [
			m_legs_ninja_primary
			m_legs_ninja_secondary
		]
		cloth = `models/car/male/m_legs_ninja`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
		]
		random_weight = 0.1
		genre = [
			goth
		]
	}
	{
		desc_id = m_rock_legs_eddie2
		frontend_desc = qs(0x6a39cbe0)
		mesh = `models/car/male/m_rock_legs_eddie2`
		materials = [
			m_rock_legs_eddie2_primary
			m_rock_legs_eddie2_secondary
		]
		cloth = `models/car/male/m_rock_legs_eddie2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			Bone_Thigh_L
		]
		random_weight = 1.0
		genre = [
			rock
		]
		locked
	}
	{
		desc_id = m_rock_legs_jeans
		frontend_desc = qs(0x0481cbb8)
		mesh = `models/car/male/m_rock_legs_jeans`
		materials = [
			m_rock_legs_jeans_primary
			m_rock_legs_jeans_secondary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_legs_rings
		frontend_desc = qs(0x38ccca91)
		mesh = `models/car/male/m_rock_legs_rings`
		cloth = `models/car/male/m_rock_legs_rings`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
		]
		materials = [
			m_rock_legs_rings_primary
			m_rock_legs_rings_secondary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_legs_cargoscarf
		frontend_desc = qs(0x6cf75098)
		cloth = `models/car/male/m_rock_legs_cargoscarf`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		mesh = `models/car/male/m_rock_legs_cargoscarf`
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_list = [
			m_rock_legs_cargoscarf2
			m_rock_legs_cargoscarf3
			m_rock_legs_cargoscarf4
		]
		swatch_texture = `tex/models/characters/car/male/rock/swatch_cargo_1`
	}
	{
		desc_id = m_rock_legs_cargoscarf2
		frontend_desc = qs(0x114c7dec)
		mesh = `models/car/male/m_rock_legs_cargoscarf2`
		cloth = `models/car/male/m_rock_legs_cargoscarf2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = m_rock_legs_cargoscarf
		swatch_texture = `tex/models/characters/car/male/rock/swatch_cargo_2`
	}
	{
		desc_id = m_rock_legs_cargoscarf3
		frontend_desc = qs(0x16ed3b37)
		mesh = `models/car/male/m_rock_legs_cargoscarf3`
		cloth = `models/car/male/m_rock_legs_cargoscarf3`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = m_rock_legs_cargoscarf
		swatch_texture = `tex/models/characters/car/male/rock/swatch_cargo_3`
	}
	{
		desc_id = m_rock_legs_cargoscarf4
		frontend_desc = qs(0x02e5982a)
		mesh = `models/car/male/m_rock_legs_cargoscarf4`
		cloth = `models/car/male/m_rock_legs_cargoscarf4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		random_weight = 1.0
		genre = [
			rock
		]
		swatch_for = m_rock_legs_cargoscarf
		swatch_texture = `tex/models/characters/car/male/rock/swatch_cargo_4`
	}
	{
		desc_id = m_rock_legs_ozzypants
		frontend_desc = qs(0x60b69fcf)
		mesh = `models/car/male/m_rock_legs_ozzypants`
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_legs_ripjeans
		frontend_desc = qs(0xf590b4f5)
		mesh = `models/car/male/m_rock_legs_ripjeans`
		cloth = `models/car/male/m_rock_legs_ripjeans`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			Bone_Thigh_L
			Bone_Knee_L
			Bone_Knee_R
		]
		materials = [
			m_rock_legs_ripjeans_primary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_legs_lockpant
		frontend_desc = qs(0xdaed7644)
		mesh = `models/car/male/m_rock_legs_lockpant`
		cloth = `models/car/male/m_rock_legs_lockpant`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			Bone_Thigh_L
		]
		materials = [
			m_rock_legs_lockpant_primary
		]
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_legs_spadesuit
		frontend_desc = qs(0xa4d231f4)
		mesh = `models/car/male/m_rock_legs_spadesuit`
		materials = [
			m_rock_legs_spadesuit_primary
		]
		genre = [
			rock
		]
		locked
	}
	{
		desc_id = m_rock_legs_rolledup
		frontend_desc = qs(0xea315ce4)
		mesh = `models/car/male/m_rock_legs_rolledup`
		cloth = `models/car/male/m_rock_legs_rolledup`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			Bone_Thigh_L
			Bone_Thigh_R
			BONE_PELVIS
		]
		materials = [
			m_rock_legs_rolledup_primary
		]
		genre = [
			rock
		]
		locked
	}
	{
		desc_id = m_rock_legs_cords
		frontend_desc = qs(0x9c29cee6)
		mesh = `models/car/male/m_rock_legs_cords`
		materials = [
			m_rock_legs_cords_primary
			m_rock_legs_cords_secondary
			m_rock_legs_cords_tertiary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_rock_legs_workshorts
		frontend_desc = qs(0xcdf3a728)
		mesh = `models/car/male/m_rock_legs_workshorts`
		materials = [
			m_rock_legs_workshorts_primary
			m_rock_legs_workshorts_secondary
			m_rock_legs_workshorts_tertiary
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_glam_legs_stripes
		frontend_desc = qs(0x46610ad9)
		mesh = `models/car/male/m_glam_legs_stripes`
		random_weight = 1.0
		cloth = `models/car/male/m_glam_legs_stripes`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		genre = [
			`glam	rock`
		]
		swatch_list = [
			m_glam_legs_stripes2
			m_glam_legs_stripes3
			m_glam_legs_stripes4
		]
		swatch_texture = `tex/models/characters/car/male/glam/swatch_stripes_1`
	}
	{
		desc_id = m_glam_legs_stripes2
		frontend_desc = qs(0x1f8b900f)
		mesh = `models/car/male/m_glam_legs_stripes2`
		random_weight = 1.0
		cloth = `models/car/male/m_glam_legs_stripes2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		genre = [
			`glam	rock`
		]
		swatch_for = m_glam_legs_stripes
		swatch_texture = `tex/models/characters/car/male/glam/swatch_stripes_2`
	}
	{
		desc_id = m_glam_legs_stripes3
		frontend_desc = qs(0xca42cdac)
		mesh = `models/car/male/m_glam_legs_stripes3`
		random_weight = 1.0
		cloth = `models/car/male/m_glam_legs_stripes3`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		genre = [
			`glam	rock`
		]
		swatch_for = m_glam_legs_stripes
		swatch_texture = `tex/models/characters/car/male/glam/swatch_stripes_3`
	}
	{
		desc_id = m_glam_legs_stripes4
		frontend_desc = qs(0x5cefb62f)
		mesh = `models/car/male/m_glam_legs_stripes4`
		random_weight = 1.0
		cloth = `models/car/male/m_glam_legs_stripes4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		genre = [
			`glam	rock`
		]
		swatch_for = m_glam_legs_stripes
		swatch_texture = `tex/models/characters/car/male/glam/swatch_stripes_4`
	}
	{
		desc_id = m_glam_legs_spandex
		frontend_desc = qs(0x795add2f)
		mesh = `models/car/male/m_glam_legs_spandex`
		random_weight = 1.0
		genre = [
			`glam	rock`
		]
		materials = [
			m_glam_legs_spandex_primary
		]
	}
	{
		desc_id = m_glam_legs_chaps
		frontend_desc = qs(0xdd7236a9)
		mesh = `models/car/male/m_glam_legs_chaps`
		random_weight = 1.0
		genre = [
			`glam	rock`
		]
		materials = [
			m_glam_legs_chaps_primary
			m_glam_legs_chaps_secondary
		]
	}
	{
		desc_id = m_glam_legs_tiger
		frontend_desc = qs(0x983eff72)
		mesh = `models/car/male/m_glam_legs_tiger`
		random_weight = 1.0
		cloth = `models/car/male/m_glam_legs_tiger`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
			Bone_Ankle_L
			Bone_Ankle_R
			Bone_Knee_L
			Bone_Knee_R
		]
		genre = [
			`glam	rock`
		]
		material_groups = [
			{
				materials = [
					m_glam_legs_tiger_primary
				]
				shader = $cas_shader_skin_masked1
			}
			{
				materials = [
					m_glam_legs_tiger_primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
	}
	{
		desc_id = m_glam_legs_gold
		frontend_desc = qs(0x0ae851ae)
		mesh = `models/car/male/m_glam_legs_gold`
		materials = [
			m_glam_legs_gold_primary
		]
		random_weight = 1.0
		genre = [
			`glam	rock`
		]
	}
	{
		desc_id = m_glam_legs_kiss
		frontend_desc = qs(0x7766603b)
		mesh = `models/car/male/m_glam_legs_kiss`
		materials = [
			m_glam_legs_kiss_primary
			m_glam_legs_kiss_secondary
		]
		random_weight = 1.0
		genre = [
			`glam	rock`
		]
	}
	{
		desc_id = m_glam_legs_snkee
		frontend_desc = qs(0x84a45131)
		mesh = `models/car/male/m_glam_legs_snke`
		cloth = `models/car/male/m_glam_legs_snke`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
		]
		material_groups = [
			{
				materials = [
					m_glam_legs_snke_primary
				]
				shader = $cas_shader_skin
				Name = qs(0x78beb957)
			}
			{
				materials = [
					m_glam_legs_snke_secondary
				]
				shader = $cas_shader_skin
				Name = qs(0x04809f02)
			}
		]
		random_weight = 1.0
		genre = [
			`glam	rock`
		]
	}
	{
		desc_id = m_glam_legs_rose
		frontend_desc = qs(0xef3d7e4d)
		mesh = `models/car/male/m_glam_legs_rose`
		materials = [
			m_glam_legs_rose_primary
		]
		random_weight = 1.0
		genre = [
			`glam	rock`
		]
		cloth = `models/car/male/m_glam_legs_rose`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
	}
	{
		desc_id = m_glam_legs_doublebelt
		frontend_desc = qs(0x0a36be6b)
		mesh = `models/car/male/m_glam_legs_doublebelt`
		materials = [
			m_glam_legs_doublebelt_primary
		]
		random_weight = 1.0
		genre = [
			`glam	rock`
		]
		cloth = `models/car/male/m_glam_legs_doublebelt`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		locked
	}
	{
		desc_id = m_glam_legs_jester
		frontend_desc = qs(0xc37abd18)
		mesh = `models/car/male/m_glam_legs_jester`
		random_weight = 1.0
		genre = [
			`glam	rock`
		]
		cloth = `models/car/male/m_glam_legs_jester`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
		locked
	}
	{
		desc_id = m_glam_legs_dartagnan
		frontend_desc = qs(0xb4d85e67)
		mesh = `models/car/male/m_glam_legs_dartagnan`
		material_groups = [
			{
				materials = [
					m_glam_legs_dartagnan_breeches
					m_glam_legs_dartagnan_breeches_nxa
				]
				shader = $cas_shader_skin
				Name = qs(0x78beb957)
			}
		]
		random_weight = 1.0
		cloth = `models/car/male/m_glam_legs_dartagnan`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			Bone_Knee_R
			Bone_Knee_L
		]
		genre = [
			`glam	rock`
		]
	}
	{
		desc_id = m_bmtl_legs_lars_1
		frontend_desc = qs(0x68bfcb4f)
		mesh = `models/car/male/m_bmtl_legs_lars_1`
		materials = [
			m_bmtl_legs_lars_1_pants
		]
		random_weight = 1.0
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = m_bmtl_legs_lars_2
		frontend_desc = qs(0x15e57c47)
		mesh = `models/car/male/m_bmtl_legs_lars_2`
		cloth = `models/car/male/m_bmtl_legs_lars_2`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_L
			Bone_Thigh_R
			Bone_Knee_L
			Bone_Knee_R
		]
		materials = [
			m_bmtl_legs_lars_2_tabard
			m_bmtl_legs_lars_2_pants
		]
		random_weight = 1.0
		genre = [
			`black	metal`
		]
		locked
	}
	{
		desc_id = m_bmtl_legs_lars_3
		frontend_desc = qs(0x4f8de416)
		mesh = `models/car/male/m_bmtl_legs_lars_3`
		materials = [
			m_bmtl_legs_lars_3_primary
			m_bmtl_legs_lars_3_secondary
			m_bmtl_legs_lars_3_skull
		]
		random_weight = 1.0
		genre = [
			`black	metal`
		]
		locked
	}
	{
		desc_id = m_bmtl_legs_lars4
		frontend_desc = qs(0x0ff0ad29)
		mesh = `models/car/male/m_bmtl_legs_lars4`
		cloth = `models/car/male/m_bmtl_legs_lars4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_L
			Bone_Thigh_R
			Bone_Knee_L
			Bone_Knee_R
		]
		materials = [
			m_bmtl_legs_lars4_primary
		]
		random_weight = 1.0
		genre = [
			`black	metal`
		]
		locked
	}
	{
		desc_id = m_bmtl_legs_lars
		frontend_desc = qs(0x229ff04f)
		mesh = `models/car/male/m_bmtl_legs_lars`
		random_weight = 1.0
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = m_bmtl_legs_netpants
		frontend_desc = qs(0xced5d006)
		mesh = `models/car/male/m_bmtl_legs_netpants`
		materials = [
			m_bmtl_legs_netpants_primary
		]
		random_weight = 1.0
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = m_bmtl_legs_beltpants
		frontend_desc = qs(0x8daa6601)
		mesh = `models/car/male/m_bmtl_legs_beltpants`
		materials = [
			m_bmtl_legs_beltpant_primary
		]
		random_weight = 1.0
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = m_bmtl_legs_plate
		frontend_desc = qs(0xbb025710)
		mesh = `models/car/male/m_bmtl_legs_plate`
		random_weight = 1.0
		materials = [
			m_bmtl_platepants_primary
		]
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = m_bmtl_legs_rippads
		frontend_desc = qs(0xba8ff0c6)
		mesh = `models/car/male/m_bmtl_legs_rippads`
		materials = [
			m_bmtl_legs_ripwpads_primary
			m_bmtl_legs_ripwpads_secondary
		]
		random_weight = 1.0
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = m_bmtl_legs_kdpants
		frontend_desc = qs(0xa4e56a98)
		mesh = `models/car/male/m_bmtl_legs_kdpants`
		materials = [
			m_bmtl_legs_kdpants_pants
		]
		random_weight = 1.0
		genre = [
			`black	metal`
		]
	}
	{
		desc_id = m_metl_legs_zakk
		frontend_desc = qs(0xcc07a679)
		mesh = `models/car/male/m_metl_legs_zakk`
		materials = [
			m_metl_legs_zakk_primary
		]
		random_weight = 0.0
		genre = [
			`heavy	metal`
		]
		cloth = `models/car/male/m_metl_legs_zakk`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_R
			Bone_Thigh_L
		]
	}
	{
		desc_id = m_metl_legs_tooskinny
		frontend_desc = qs(0xe6e32528)
		mesh = `models/car/male/m_metl_legs_tooskinny`
		materials = [
			m_metl_legs_tooskinny_primary
		]
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = m_metl_legs_zippertight
		frontend_desc = qs(0x5d26e419)
		mesh = `models/car/male/m_metl_legs_zippertight`
		materials = [
			m_metl_legs_zippertight_primary
		]
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = m_metl_legs_axel_1
		frontend_desc = qs(0x69bacf99)
		mesh = `models/car/male/m_metl_legs_axel_1`
		cloth = `models/car/male/m_metl_legs_axel_1`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_L
			Bone_Knee_L
		]
		materials = [
			m_metl_legs_axel_1_pants
			m_metl_legs_axel_1_rag
		]
		random_weight = 1.0
		genre = [
			rock
		]
	}
	{
		desc_id = m_metl_legs_axel2
		frontend_desc = qs(0xc629f7b2)
		mesh = `models/car/male/m_metl_legs_camoshorts`
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
		swatch_list = [
			m_metl_legs_camoshorts2
			m_metl_legs_camoshorts3
			m_metl_legs_camoshorts4
		]
		swatch_texture = `tex/models/characters/car/male/metl/swatch_camo_1`
	}
	{
		desc_id = m_metl_legs_camoshorts2
		frontend_desc = qs(0xff23d166)
		mesh = `models/car/male/m_metl_legs_camoshorts4`
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
		swatch_for = m_metl_legs_axel2
		swatch_texture = `tex/models/characters/car/male/metl/swatch_camo_4`
	}
	{
		desc_id = m_metl_legs_camoshorts3
		frontend_desc = qs(0x8ace86e0)
		mesh = `models/car/male/m_metl_legs_camoshorts2`
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
		swatch_for = m_metl_legs_axel2
		swatch_texture = `tex/models/characters/car/male/metl/swatch_camo_2`
	}
	{
		desc_id = m_metl_legs_camoshorts4
		frontend_desc = qs(0x3f441c1b)
		mesh = `models/car/male/m_metl_legs_camoshorts3`
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
		swatch_for = m_metl_legs_axel2
		swatch_texture = `tex/models/characters/car/male/metl/swatch_camo_3`
	}
	{
		desc_id = m_metl_legs_flaplthr
		frontend_desc = qs(0x25206033)
		mesh = `models/car/male/m_metl_legs_flaplthr`
		materials = [
			m_metl_legs_flaplthr_primary
			m_metl_legs_flaplthr_secondary
			m_metl_legs_flaplthr_belt
		]
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = m_metl_legs_armor
		frontend_desc = qs(0x8b74ae61)
		mesh = `models/car/male/m_metl_legs_armor`
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = m_mtl_legs_axel1
		frontend_desc = qs(0x9b2c1509)
		mesh = `models/car/male/m_mtl_legs_axel1`
		materials = [
			m_metl_legs_axel1_primary
		]
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
	}
	{
		desc_id = m_metl_legs_axel2gh5
		frontend_desc = qs(0x429a1330)
		mesh = `models/car/male/m_metl_legs_axel2gh5`
		material_groups = [
			{
				materials = [
					axel2_pants_primary
				]
				shader = $cas_shader_skin_masked1
			}
			{
				materials = [
					axel2_pants_primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
		locked
	}
	{
		desc_id = m_mtl_legs_axel3
		frontend_desc = qs(0x6e10436f)
		mesh = `models/car/male/m_mtl_legs_axel3`
		material_groups = [
			{
				materials = [
					axel3_pants_primary
				]
				shader = $cas_shader_skin_masked1
			}
			{
				materials = [
					axel3_pants_primary
				]
				shader = $cas_shader_skin_masked2
			}
		]
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
		locked
	}
	{
		desc_id = m_mtl_legs_axel4
		frontend_desc = qs(0x2bfe6388)
		mesh = `models/car/male/m_mtl_legs_axel4`
		cloth = `models/car/male/m_mtl_legs_axel4`
		cloth_coll_skeleton = cloth_coll_data_male
		cloth_coll_bones = [
			BONE_PELVIS
			Bone_Thigh_L
			Bone_Thigh_R
			Bone_Knee_L
			Bone_Knee_R
		]
		materials = [
			axel4_legs_primary
			axel4_legs_secondary
		]
		random_weight = 1.0
		genre = [
			`heavy	metal`
		]
		locked
	}
]
