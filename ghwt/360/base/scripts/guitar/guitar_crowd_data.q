z_dive_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = Z_Dive_Crowd_Billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
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
		bb_mesh_id = Z_Dive_Crowd_Billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = Z_Dive_Crowd_Billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = Z_Dive_Crowd_Billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = Z_Dive_Crowd_Billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = Z_Dive_Crowd_Billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
		params = {
			Name = crowd6
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
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
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
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
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
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_template_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
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
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_template_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_template/z_template.tex`
		AssetContext = z_template
		TriggerScript = z_template_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_template_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_template/z_template.tex`
		AssetContext = z_template
		TriggerScript = z_template_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_template_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_template/z_template.tex`
		AssetContext = z_template
		TriggerScript = z_template_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_bayou_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01B.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_bayou_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_bayou/z_bayou.tex`
		AssetContext = z_bayou
		TriggerScript = z_bayou_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_02B.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_bayou_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_bayou/z_bayou.tex`
		AssetContext = z_bayou
		TriggerScript = z_bayou_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03B.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_bayou_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_bayou/z_bayou.tex`
		AssetContext = z_bayou
		TriggerScript = z_bayou_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04B.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_bayou_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_bayou/z_bayou.tex`
		AssetContext = z_bayou
		TriggerScript = z_bayou_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1B.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_bayou_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_bayou/z_bayou.tex`
		AssetContext = z_bayou
		TriggerScript = z_bayou_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2B.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_bayou_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_bayou/z_bayou.tex`
		AssetContext = z_bayou
		TriggerScript = z_bayou_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_castle_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01C.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_castle_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_castle/z_castle.tex`
		AssetContext = z_castle
		TriggerScript = z_castle_crowd_peds
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
		bb_mesh_id = z_castle_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_castle/z_castle.tex`
		AssetContext = z_castle
		TriggerScript = z_castle_crowd_peds
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
		bb_mesh_id = z_castle_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_castle/z_castle.tex`
		AssetContext = z_castle
		TriggerScript = z_castle_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04C.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_castle_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_castle/z_castle.tex`
		AssetContext = z_castle
		TriggerScript = z_castle_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1C.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_castle_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_castle/z_castle.tex`
		AssetContext = z_castle
		TriggerScript = z_castle_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2C.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_castle_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_castle/z_castle.tex`
		AssetContext = z_castle
		TriggerScript = z_castle_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_fairgrounds_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_fairgrounds_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_fairgrounds/z_fairgrounds.tex`
		AssetContext = z_fairgrounds
		TriggerScript = z_fairgrounds_crowd_peds
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
		bb_mesh_id = z_fairgrounds_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_fairgrounds/z_fairgrounds.tex`
		AssetContext = z_fairgrounds
		TriggerScript = z_fairgrounds_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_fairgrounds_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_fairgrounds/z_fairgrounds.tex`
		AssetContext = z_fairgrounds
		TriggerScript = z_fairgrounds_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_fairgrounds_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_fairgrounds/z_fairgrounds.tex`
		AssetContext = z_fairgrounds
		TriggerScript = z_fairgrounds_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_fairgrounds_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_fairgrounds/z_fairgrounds.tex`
		AssetContext = z_fairgrounds
		TriggerScript = z_fairgrounds_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_fairgrounds_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_fairgrounds/z_fairgrounds.tex`
		AssetContext = z_fairgrounds
		TriggerScript = z_fairgrounds_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_frathouse_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01B.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_frathouse_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_frathouse/z_frathouse.tex`
		AssetContext = z_frathouse
		TriggerScript = z_frathouse_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_02B.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_frathouse_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_frathouse/z_frathouse.tex`
		AssetContext = z_frathouse
		TriggerScript = z_frathouse_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03B.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_frathouse_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_frathouse/z_frathouse.tex`
		AssetContext = z_frathouse
		TriggerScript = z_frathouse_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04B.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_frathouse_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_frathouse/z_frathouse.tex`
		AssetContext = z_frathouse
		TriggerScript = z_frathouse_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1B.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_frathouse_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_frathouse/z_frathouse.tex`
		AssetContext = z_frathouse
		TriggerScript = z_frathouse_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2B.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_frathouse_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_frathouse/z_frathouse.tex`
		AssetContext = z_frathouse
		TriggerScript = z_frathouse_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_goth_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01C.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_goth_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_goth/z_goth.tex`
		AssetContext = z_goth
		TriggerScript = z_goth_crowd_peds
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
		bb_mesh_id = z_goth_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_goth/z_goth.tex`
		AssetContext = z_goth
		TriggerScript = z_goth_crowd_peds
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
		bb_mesh_id = z_goth_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_goth/z_goth.tex`
		AssetContext = z_goth
		TriggerScript = z_goth_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04C.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_goth_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_goth/z_goth.tex`
		AssetContext = z_goth
		TriggerScript = z_goth_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1C.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_goth_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_goth/z_goth.tex`
		AssetContext = z_goth
		TriggerScript = z_goth_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2C.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_goth_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_goth/z_goth.tex`
		AssetContext = z_goth
		TriggerScript = z_goth_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_newyork_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_newyork_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_newyork/z_newyork.tex`
		AssetContext = z_newyork
		TriggerScript = z_newyork_crowd_peds
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
		bb_mesh_id = z_newyork_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_newyork/z_newyork.tex`
		AssetContext = z_newyork
		TriggerScript = z_newyork_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_newyork_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_newyork/z_newyork.tex`
		AssetContext = z_newyork
		TriggerScript = z_newyork_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_newyork_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_newyork/z_newyork.tex`
		AssetContext = z_newyork
		TriggerScript = z_newyork_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_newyork_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_newyork/z_newyork.tex`
		AssetContext = z_newyork
		TriggerScript = z_newyork_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_newyork_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_newyork/z_newyork.tex`
		AssetContext = z_newyork
		TriggerScript = z_newyork_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_recordstore_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01C.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_recordstore_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_recordstore/z_recordstore.tex`
		AssetContext = z_recordstore
		TriggerScript = z_recordstore_crowd_peds
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
		bb_mesh_id = z_recordstore_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_recordstore/z_recordstore.tex`
		AssetContext = z_recordstore
		TriggerScript = z_recordstore_crowd_peds
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
		bb_mesh_id = z_recordstore_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_recordstore/z_recordstore.tex`
		AssetContext = z_recordstore
		TriggerScript = z_recordstore_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04C.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_recordstore_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_recordstore/z_recordstore.tex`
		AssetContext = z_recordstore
		TriggerScript = z_recordstore_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1C.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_recordstore_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_recordstore/z_recordstore.tex`
		AssetContext = z_recordstore
		TriggerScript = z_recordstore_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2C.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_recordstore_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_recordstore/z_recordstore.tex`
		AssetContext = z_recordstore
		TriggerScript = z_recordstore_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_metalfest_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01B.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_metalfest_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_metalfest/z_metalfest.tex`
		AssetContext = z_metalfest
		TriggerScript = z_metalfest_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_02B.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_metalfest_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_metalfest/z_metalfest.tex`
		AssetContext = z_metalfest
		TriggerScript = z_metalfest_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03B.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_metalfest_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_metalfest/z_metalfest.tex`
		AssetContext = z_metalfest
		TriggerScript = z_metalfest_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04B.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_metalfest_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_metalfest/z_metalfest.tex`
		AssetContext = z_metalfest
		TriggerScript = z_metalfest_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1B.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_metalfest_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_metalfest/z_metalfest.tex`
		AssetContext = z_metalfest
		TriggerScript = z_metalfest_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2B.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_metalfest_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_metalfest/z_metalfest.tex`
		AssetContext = z_metalfest
		TriggerScript = z_metalfest_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_ballpark_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_ballpark_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_ballpark/z_ballpark.tex`
		AssetContext = z_ballpark
		TriggerScript = z_ballpark_crowd_peds
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
		bb_mesh_id = z_ballpark_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_ballpark/z_ballpark.tex`
		AssetContext = z_ballpark
		TriggerScript = z_ballpark_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_ballpark_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_ballpark/z_ballpark.tex`
		AssetContext = z_ballpark
		TriggerScript = z_ballpark_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_ballpark_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_ballpark/z_ballpark.tex`
		AssetContext = z_ballpark
		TriggerScript = z_ballpark_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_ballpark_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_ballpark/z_ballpark.tex`
		AssetContext = z_ballpark
		TriggerScript = z_ballpark_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_ballpark_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_ballpark/z_ballpark.tex`
		AssetContext = z_ballpark
		TriggerScript = z_ballpark_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_military_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_military_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_military/z_military.tex`
		AssetContext = z_military
		TriggerScript = z_military_crowd_peds
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
		bb_mesh_id = z_military_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_military/z_military.tex`
		AssetContext = z_military
		TriggerScript = z_military_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_military_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_military/z_military.tex`
		AssetContext = z_military
		TriggerScript = z_military_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_military_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_military/z_military.tex`
		AssetContext = z_military
		TriggerScript = z_military_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_military_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_military/z_military.tex`
		AssetContext = z_military
		TriggerScript = z_military_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_military_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_military/z_military.tex`
		AssetContext = z_military
		TriggerScript = z_military_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_hotel_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01C.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_hotel_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hotel/z_hotel.tex`
		AssetContext = z_hotel
		TriggerScript = z_hotel_crowd_peds
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
		bb_mesh_id = z_hotel_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hotel/z_hotel.tex`
		AssetContext = z_hotel
		TriggerScript = z_hotel_crowd_peds
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
		bb_mesh_id = z_hotel_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hotel/z_hotel.tex`
		AssetContext = z_hotel
		TriggerScript = z_hotel_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04C.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_hotel_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hotel/z_hotel.tex`
		AssetContext = z_hotel
		TriggerScript = z_hotel_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1C.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_hotel_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hotel/z_hotel.tex`
		AssetContext = z_hotel
		TriggerScript = z_hotel_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2C.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_hotel_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hotel/z_hotel.tex`
		AssetContext = z_hotel
		TriggerScript = z_hotel_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_cathedral_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		id = crowd1_cam_viewport
		bb_mesh_id = z_cathedral_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_cathedral/z_cathedral.tex`
		AssetContext = z_cathedral
		TriggerScript = z_cathedral_crowd_peds
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
		bb_mesh_id = z_cathedral_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_cathedral/z_cathedral.tex`
		AssetContext = z_cathedral
		TriggerScript = z_cathedral_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_cathedral_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_cathedral/z_cathedral.tex`
		AssetContext = z_cathedral
		TriggerScript = z_cathedral_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_cathedral_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_cathedral/z_cathedral.tex`
		AssetContext = z_cathedral
		TriggerScript = z_cathedral_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_cathedral_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_cathedral/z_cathedral.tex`
		AssetContext = z_cathedral
		TriggerScript = z_cathedral_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_cathedral_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_cathedral/z_cathedral.tex`
		AssetContext = z_cathedral
		TriggerScript = z_cathedral_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_harbor_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_harbor_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_harbor/z_harbor.tex`
		AssetContext = Z_Harbor
		TriggerScript = z_harbor_crowd_peds
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
		bb_mesh_id = z_harbor_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_harbor/z_harbor.tex`
		AssetContext = Z_Harbor
		TriggerScript = z_harbor_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_harbor_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_harbor/z_harbor.tex`
		AssetContext = Z_Harbor
		TriggerScript = z_harbor_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_harbor_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_harbor/z_harbor.tex`
		AssetContext = Z_Harbor
		TriggerScript = z_harbor_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_harbor_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_harbor/z_harbor.tex`
		AssetContext = Z_Harbor
		TriggerScript = z_harbor_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_harbor_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_harbor/z_harbor.tex`
		AssetContext = Z_Harbor
		TriggerScript = z_harbor_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_scifi_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01C.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_scifi_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_scifi/z_scifi.tex`
		AssetContext = z_scifi
		TriggerScript = z_scifi_crowd_peds
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
		bb_mesh_id = z_scifi_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_scifi/z_scifi.tex`
		AssetContext = z_scifi
		TriggerScript = z_scifi_crowd_peds
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
		bb_mesh_id = z_scifi_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_scifi/z_scifi.tex`
		AssetContext = z_scifi
		TriggerScript = z_scifi_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04C.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_scifi_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_scifi/z_scifi.tex`
		AssetContext = z_scifi
		TriggerScript = z_scifi_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1C.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_scifi_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_scifi/z_scifi.tex`
		AssetContext = z_scifi
		TriggerScript = z_scifi_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2C.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_scifi_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_scifi/z_scifi.tex`
		AssetContext = z_scifi
		TriggerScript = z_scifi_crowd_peds
		params = {
			Name = crowd6
		}
		no_resolve_colorbuffer = 1
	}
]
z_hob_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01B.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_hob_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hob/z_hob.tex`
		AssetContext = z_hob
		TriggerScript = z_hob_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_02B.skin'
		id = crowd2_cam_viewport
		bb_mesh_id = z_hob_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hob/z_hob.tex`
		AssetContext = z_hob
		TriggerScript = z_hob_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_03B.skin'
		id = crowd3_cam_viewport
		bb_mesh_id = z_hob_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hob/z_hob.tex`
		AssetContext = z_hob
		TriggerScript = z_hob_crowd_peds
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
		Model = 'Real_Crowd\\Crowd_Ped_04B.skin'
		id = crowd4_cam_viewport
		bb_mesh_id = z_hob_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hob/z_hob.tex`
		AssetContext = z_hob
		TriggerScript = z_hob_crowd_peds
		params = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		viewportparams = imposter_rendering_quad4
		hrviewportparams = imposter_rendering_highres_quad4
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_1B.skin'
		id = crowd5_cam_viewport
		bb_mesh_id = z_hob_crowd_billboard_01
		texture = viewport5
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hob/z_hob.tex`
		AssetContext = z_hob
		TriggerScript = z_hob_crowd_peds
		params = {
			Name = crowd5
		}
		no_resolve_colorbuffer = 1
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		viewportparams = imposter_rendering_quad5
		hrviewportparams = imposter_rendering_highres_quad5
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\crowd_pedF_2B.skin'
		id = crowd6_cam_viewport
		bb_mesh_id = z_hob_crowd_billboard_01
		texture = viewport6
		textureasset = `tex/models/real_crowd/crowd_atlas0.dds`
		texdict = `zones/z_hob/z_hob.tex`
		AssetContext = z_hob
		TriggerScript = z_hob_crowd_peds
		params = {
			Name = crowd6
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
