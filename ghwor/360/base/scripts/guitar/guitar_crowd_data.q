default_3d_crowd_models = [
	{
		Model = 'Real_Crowd\\Crowd_Ped_01_3d.skin'
	}
	{
		Model = 'Real_Crowd\\Crowd_Ped_02_3d.skin'
	}
	{
		Model = 'Real_Crowd\\Crowd_Ped_03_3d.skin'
	}
	{
		Model = 'Real_Crowd\\Crowd_Pedf_1_3d.skin'
	}
]
z_epicstage_2d_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01C.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_epicstage_ven_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_epicstage/z_epicstage.tex`
		AssetContext = z_epicstage
		TriggerScript = z_epicstage_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_02C.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_epicstage_ven_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_epicstage/z_epicstage.tex`
		AssetContext = z_epicstage
		TriggerScript = z_epicstage_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03C.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_epicstage_ven_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_epicstage/z_epicstage.tex`
		AssetContext = z_epicstage
		TriggerScript = z_epicstage_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Pedf_2C.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_epicstage_ven_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_epicstage/z_epicstage.tex`
		AssetContext = z_epicstage
		TriggerScript = z_epicstage_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_epicstage_3d_crowd_models = $default_3d_crowd_models
z_houseband_3d_crowd_models = $default_3d_crowd_models
z_punkstage_3d_crowd_models = $default_3d_crowd_models
z_riothouse_3d_crowd_models = $default_3d_crowd_models
z_egypt_2d_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01C.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_egypt_ven_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_egypt/z_egypt.tex`
		AssetContext = z_egypt
		TriggerScript = z_egypt_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_02C.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_egypt_ven_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_egypt/z_egypt.tex`
		AssetContext = z_egypt
		TriggerScript = z_egypt_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03C.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_egypt_ven_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_egypt/z_egypt.tex`
		AssetContext = z_egypt
		TriggerScript = z_egypt_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Pedf_2C.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_egypt_ven_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_egypt/z_egypt.tex`
		AssetContext = z_egypt
		TriggerScript = z_egypt_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_egypt_3d_crowd_models = $default_3d_crowd_models
z_festival_2d_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01C.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_festival_ven_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_festival/z_festival.tex`
		AssetContext = z_festival
		TriggerScript = z_festival_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_02C.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_festival_ven_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_festival/z_festival.tex`
		AssetContext = z_festival
		TriggerScript = z_festival_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03C.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_festival_ven_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_festival/z_festival.tex`
		AssetContext = z_festival
		TriggerScript = z_festival_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Pedf_2C.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_festival_ven_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_festival/z_festival.tex`
		AssetContext = z_festival
		TriggerScript = z_festival_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_festival_3d_crowd_models = $default_3d_crowd_models
z_modular_2d_crowd_models_disabled = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_Monk.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_modular_tem_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_modular/z_modular.tex`
		AssetContext = z_modular
		TriggerScript = z_modular_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_Monk.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_modular_tem_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_modular/z_modular.tex`
		AssetContext = z_modular
		TriggerScript = z_modular_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_Monk.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_modular_tem_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_modular/z_modular.tex`
		AssetContext = z_modular
		TriggerScript = z_modular_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_Monk.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_modular_tem_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_modular/z_modular.tex`
		AssetContext = z_modular
		TriggerScript = z_modular_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_modular_3d_crowd_models = [
	{
		Model = 'Real_Crowd\\Crowd_Ped_Monk_3d.skin'
	}
]
z_barbarian_2d_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01C.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_barbarian_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_barbarian/z_barbarian.tex`
		AssetContext = z_barbarian
		TriggerScript = z_barbarian_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_02C.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_barbarian_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_barbarian/z_barbarian.tex`
		AssetContext = z_barbarian
		TriggerScript = z_barbarian_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03C.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_barbarian_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_barbarian/z_barbarian.tex`
		AssetContext = z_barbarian
		TriggerScript = z_barbarian_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Pedf_2C.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_barbarian_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_barbarian/z_barbarian.tex`
		AssetContext = z_barbarian
		TriggerScript = z_barbarian_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_barbarian_3d_crowd_models = $default_3d_crowd_models
crowd_config_nojiggle_1536_xenon = {
	jiggle = 0
	base_viewport_params = {
		style = crowd_jiggle2_base_1536_xenon
		no_resolve_color_buffer = true
		resolve_invalidated = FALSE
	}
	ped_viewport_params = [
		{
			style = crowd_jiggle2_quad0_xenon
			no_resolve_color_buffer = FALSE
		}
		{
			style = crowd_jiggle2_quad1_xenon
			no_resolve_color_buffer = true
		}
		{
			style = crowd_jiggle2_quad2_xenon
			no_resolve_color_buffer = true
		}
		{
			style = crowd_jiggle2_quad3_xenon
			no_resolve_color_buffer = FALSE
		}
		{
			style = crowd_jiggle2_quad4_xenon
			no_resolve_color_buffer = true
		}
		{
			style = crowd_jiggle2_quad5_xenon
			no_resolve_color_buffer = true
		}
	]
}
crowd_config_nojiggle_2x_1536_xenon = {
	jiggle = 0
	base_viewport_params = {
		style = crowd_jiggle3_base_2x_1536_xenon
		no_resolve_color_buffer = true
		resolve_invalidated = FALSE
	}
	ped_viewport_params = [
		{
			style = crowd_jiggle3_quad0_xenon
			no_resolve_color_buffer = FALSE
		}
		{
			style = crowd_jiggle3_quad1_xenon
			no_resolve_color_buffer = true
		}
		{
			style = crowd_jiggle3_quad2_xenon
			no_resolve_color_buffer = FALSE
		}
		{
			style = crowd_jiggle3_quad3_xenon
			no_resolve_color_buffer = true
		}
		{
			style = crowd_jiggle3_quad4_xenon
			no_resolve_color_buffer = FALSE
		}
		{
			style = crowd_jiggle3_quad5_xenon
			no_resolve_color_buffer = true
		}
		{
			style = crowd_jiggle3_quad6_xenon
			no_resolve_color_buffer = FALSE
		}
		{
			style = crowd_jiggle3_quad7_xenon
			no_resolve_color_buffer = true
		}
	]
}
crowd_config_nojiggle_768 = {
	jiggle = 0
	base_viewport_params = {
		style = crowd_base_768
		no_resolve_color_buffer = FALSE
		resolve_invalidated = true
	}
	ped_viewport_params = [
		{
			style = crowd_quad0
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad1
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad2
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad3
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad4
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad5
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad6
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad7
			no_resolve_color_buffer = true
		}
	]
}
crowd_config_nojiggle_1024 = {
	jiggle = 0
	base_viewport_params = {
		style = crowd_base_1024
		no_resolve_color_buffer = FALSE
		resolve_invalidated = true
	}
	ped_viewport_params = [
		{
			style = crowd_quad0
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad1
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad2
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad3
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad4
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad5
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad6
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad7
			no_resolve_color_buffer = true
		}
	]
}
crowd_config_nojiggle_1536_ps3 = {
	jiggle = 0
	base_viewport_params = {
		style = crowd_base_1536
		no_resolve_color_buffer = FALSE
		resolve_invalidated = true
	}
	ped_viewport_params = [
		{
			style = crowd_quad0
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad1
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad2
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad3
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad4
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad5
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad6
			no_resolve_color_buffer = true
		}
		{
			style = crowd_quad7
			no_resolve_color_buffer = true
		}
	]
}
crowd_config_4x1_nojiggle_1536x768 = {
	jiggle = 0
	base_viewport_params = {
		style = crowd_base_1536x768
		no_resolve_color_buffer = FALSE
		resolve_invalidated = true
	}
	ped_viewport_params = [
		{
			style = crowd_4x1_quad0
			no_resolve_color_buffer = true
		}
		{
			style = crowd_4x1_quad1
			no_resolve_color_buffer = true
		}
		{
			style = crowd_4x1_quad2
			no_resolve_color_buffer = true
		}
		{
			style = crowd_4x1_quad3
			no_resolve_color_buffer = true
		}
	]
}
crowd_config_4x1_nojiggle_1024x512 = {
	jiggle = 0
	base_viewport_params = {
		style = crowd_base_1024x512
		no_resolve_color_buffer = FALSE
		resolve_invalidated = true
	}
	ped_viewport_params = [
		{
			style = crowd_4x1_quad0
			no_resolve_color_buffer = true
		}
		{
			style = crowd_4x1_quad1
			no_resolve_color_buffer = true
		}
		{
			style = crowd_4x1_quad2
			no_resolve_color_buffer = true
		}
		{
			style = crowd_4x1_quad3
			no_resolve_color_buffer = true
		}
	]
}
