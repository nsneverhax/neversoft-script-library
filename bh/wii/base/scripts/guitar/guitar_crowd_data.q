z_freestyle_crowd_models = [
	{
		Name = mii_crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Mii_Crowd/mii_crowd_male1.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_freestyle_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_freestyle/z_freestyle.tex`
		AssetContext = z_freestyle
		TriggerScript = z_freestyle_crowd_peds
		params = {
			Name = mii_crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = mii_crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Mii_Crowd/mii_crowd_male2.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_freestyle_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_freestyle/z_freestyle.tex`
		AssetContext = z_freestyle
		TriggerScript = z_freestyle_crowd_peds
		params = {
			Name = mii_crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = mii_crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Mii_Crowd/mii_crowd_female1.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_freestyle_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_freestyle/z_freestyle.tex`
		AssetContext = z_freestyle
		TriggerScript = z_freestyle_crowd_peds
		params = {
			Name = mii_crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = mii_crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Mii_Crowd/mii_crowd_female2.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_freestyle_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_freestyle/z_freestyle.tex`
		AssetContext = z_freestyle
		TriggerScript = z_freestyle_crowd_peds
		params = {
			Name = mii_crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_freestyle_skins = {
	male = [
		'Mii_Crowd/mii_crowd_male1.skin'
		'Mii_Crowd/mii_crowd_male2.skin'
	]
	female = [
		'Mii_Crowd/mii_crowd_female1.skin'
		'Mii_Crowd/mii_crowd_female2.skin'
	]
}
z_roadie_battle_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_freestyle_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_sanfrancisco/z_sanfrancisco.tex`
		AssetContext = z_freestyle
		TriggerScript = z_freestyle_crowd_peds
		params = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_freestyle_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_sanfrancisco/z_sanfrancisco.tex`
		AssetContext = z_freestyle
		TriggerScript = z_freestyle_crowd_peds
		params = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_freestyle_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_sanfrancisco/z_sanfrancisco.tex`
		AssetContext = z_freestyle
		TriggerScript = z_freestyle_crowd_peds
		params = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_freestyle_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_sanfrancisco/z_sanfrancisco.tex`
		AssetContext = z_freestyle
		TriggerScript = z_freestyle_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_template_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_template_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_template/z_template.tex`
		AssetContext = z_template
		TriggerScript = z_template_crowd_peds
		params = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad1
		hrviewportparams = imposter_rendering_highres_quad1
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_template_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_template/z_template.tex`
		AssetContext = z_template
		TriggerScript = z_template_crowd_peds
		params = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad2
		hrviewportparams = imposter_rendering_highres_quad2
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Pedf_1.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_template_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_template/z_template.tex`
		AssetContext = z_template
		TriggerScript = z_template_crowd_peds
		params = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad3
		hrviewportparams = imposter_rendering_highres_quad3
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Pedf_2.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_template_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_template/z_template.tex`
		AssetContext = z_template
		TriggerScript = z_template_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_training_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Characters\\Musicians\\Sec_Barker.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = 0
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_training/z_training.tex`
		AssetContext = z_training
		TriggerScript = Z_Training_Crowd_Peds
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad1
		hrviewportparams = imposter_rendering_highres_quad1
		resourceviewport = crowd_base_viewport
		Model = 'Characters\\Musicians\\Sec_Punk.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_training/z_training.tex`
		AssetContext = z_training
		TriggerScript = Z_Training_Crowd_Peds
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad2
		hrviewportparams = imposter_rendering_highres_quad2
		resourceviewport = crowd_base_viewport
		Model = 'Characters\\Musicians\\Sec_Pro_Stabb.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_training/z_training.tex`
		AssetContext = z_training
		TriggerScript = Z_Training_Crowd_Peds
	}
]
z_vvstudio_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_vvstudio_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_vvstudio/z_vvstudio.tex`
		AssetContext = z_vvstudio
		TriggerScript = z_vvstudio_crowd_peds
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_vvstudio_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_vvstudio/z_vvstudio.tex`
		AssetContext = z_vvstudio
		TriggerScript = z_vvstudio_crowd_peds
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_vvstudio_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_vvstudio/z_vvstudio.tex`
		AssetContext = z_vvstudio
		TriggerScript = z_vvstudio_crowd_peds
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_vvstudio_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_vvstudio/z_vvstudio.tex`
		AssetContext = z_vvstudio
		TriggerScript = z_vvstudio_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
0xa292fe11 = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = 0x7f1c8876
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = 0x3727ef64
		AssetContext = 0x53d2aff0
		TriggerScript = 0xdb97b8fe
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0xe615d9cc
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = 0x3727ef64
		AssetContext = 0x53d2aff0
		TriggerScript = 0xdb97b8fe
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0x9112e95a
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = 0x3727ef64
		AssetContext = 0x53d2aff0
		TriggerScript = 0xdb97b8fe
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = 0x0f767cf9
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = 0x3727ef64
		AssetContext = 0x53d2aff0
		TriggerScript = 0xdb97b8fe
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
0xd45f275f = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = 0x1af0dc7b
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = 0x203d0820
		AssetContext = z_montreux
		TriggerScript = 0x4242a425
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0x83f98dc1
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = 0x203d0820
		AssetContext = z_montreux
		TriggerScript = 0x4242a425
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0xf4febd57
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = 0x203d0820
		AssetContext = z_montreux
		TriggerScript = 0x4242a425
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = 0x6a9a28f4
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = 0x203d0820
		AssetContext = z_montreux
		TriggerScript = 0x4242a425
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
0x72a43b29 = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_PedM_Cabo1.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = 0xee09f850
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = 0x3f0c20c3
		AssetContext = z_cabo
		TriggerScript = 0xbb9c7ecb
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_PedM_Cabo2.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0x7700a9ea
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = 0x3f0c20c3
		AssetContext = z_cabo
		TriggerScript = 0xbb9c7ecb
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_PedF_Cabo1.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0x0007997c
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = 0x3f0c20c3
		AssetContext = z_cabo
		TriggerScript = 0xbb9c7ecb
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_PedF_Cabo2.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = 0x9e630cdf
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = 0x3f0c20c3
		AssetContext = z_cabo
		TriggerScript = 0xbb9c7ecb
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
0x34835342 = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = 0x6c8a5db0
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = 0x62c6075c
		AssetContext = z_centralpark
		TriggerScript = 0x690d8529
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0xf5830c0a
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = 0x62c6075c
		AssetContext = z_centralpark
		TriggerScript = 0x690d8529
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0x82843c9c
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = 0x62c6075c
		AssetContext = z_centralpark
		TriggerScript = 0x690d8529
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = 0x1ce0a93f
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = 0x62c6075c
		AssetContext = z_centralpark
		TriggerScript = 0x690d8529
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
0x7c0c49f1 = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = 0x1137c95d
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = 0x60bcbe2f
		AssetContext = z_tokyo
		TriggerScript = 0x9d60f54c
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0x883e98e7
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = 0x60bcbe2f
		AssetContext = z_tokyo
		TriggerScript = 0x9d60f54c
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0xff39a871
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = 0x60bcbe2f
		AssetContext = z_tokyo
		TriggerScript = 0x9d60f54c
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = 0x615d3dd2
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = 0x60bcbe2f
		AssetContext = z_tokyo
		TriggerScript = 0x9d60f54c
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
0x13d7cf8f = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = 0xac67525b
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = 0x4894e112
		AssetContext = z_easterisland
		TriggerScript = 0x07aed71c
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0x356e03e1
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = 0x4894e112
		AssetContext = z_easterisland
		TriggerScript = 0x07aed71c
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0x42693377
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = 0x4894e112
		AssetContext = z_easterisland
		TriggerScript = 0x07aed71c
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = 0xdc0da6d4
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = 0x4894e112
		AssetContext = z_easterisland
		TriggerScript = 0x07aed71c
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
0x6f6e58e5 = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = 0x5bbf1543
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = 0x7b18ae7f
		AssetContext = z_awardshow
		TriggerScript = 0xcfaadf44
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0xc2b644f9
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = 0x7b18ae7f
		AssetContext = z_awardshow
		TriggerScript = 0xcfaadf44
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0xb5b1746f
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = 0x7b18ae7f
		AssetContext = z_awardshow
		TriggerScript = 0xcfaadf44
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = 0x2bd5e1cc
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = 0x7b18ae7f
		AssetContext = z_awardshow
		TriggerScript = 0xcfaadf44
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
0xf853a56a = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = 0xfee0a9ab
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = 0x957627df
		AssetContext = z_gorge
		TriggerScript = 0x3ebdfe07
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0x67e9f811
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = 0x957627df
		AssetContext = z_gorge
		TriggerScript = 0x3ebdfe07
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0x10eec887
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = 0x957627df
		AssetContext = z_gorge
		TriggerScript = 0x3ebdfe07
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = 0x8e8a5d24
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = 0x957627df
		AssetContext = z_gorge
		TriggerScript = 0x3ebdfe07
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_paris_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_paris_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_paris/z_paris.tex`
		AssetContext = z_paris
		TriggerScript = z_paris_crowd_peds
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_paris_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_paris/z_paris.tex`
		AssetContext = z_paris
		TriggerScript = z_paris_crowd_peds
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_paris_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_paris/z_paris.tex`
		AssetContext = z_paris
		TriggerScript = z_paris_crowd_peds
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_paris_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_paris/z_paris.tex`
		AssetContext = z_paris
		TriggerScript = z_paris_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
0x49186bd3 = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_space_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = 0x4c414e5b
		AssetContext = z_space
		TriggerScript = z_space_crowd_peds
		param = {
			Name = crowd1
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = 0x8480a70d
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = 0x4c414e5b
		AssetContext = z_space
		TriggerScript = z_space_crowd_peds
		param = {
			Name = crowd2
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = 0xf387979b
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = 0x4c414e5b
		AssetContext = z_space
		TriggerScript = z_space_crowd_peds
		param = {
			Name = crowd3
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = 0x6de30238
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = 0x4c414e5b
		AssetContext = z_space
		TriggerScript = z_space_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
