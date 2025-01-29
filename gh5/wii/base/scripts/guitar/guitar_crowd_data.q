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
z_sanfrancisco_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_frathouse_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_sanfrancisco/z_sanfrancisco.tex`
		AssetContext = z_sanfrancisco
		TriggerScript = z_sanfrancisco_crowd_peds
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
		bb_mesh_id = z_sanfrancisco_crowd_billboard_01
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_sanfrancisco/z_sanfrancisco.tex`
		AssetContext = z_sanfrancisco
		TriggerScript = z_sanfrancisco_crowd_peds
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
		bb_mesh_id = z_sanfrancisco_crowd_billboard_01
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_sanfrancisco/z_frathouse.tex`
		AssetContext = z_sanfrancisco
		TriggerScript = z_sanfrancisco_crowd_peds
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
		bb_mesh_id = z_sanfrancisco_crowd_billboard_01
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_sanfrancisco/z_frathouse.tex`
		AssetContext = z_sanfrancisco
		TriggerScript = z_sanfrancisco_crowd_peds
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
z_cairo_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_cairo_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_cairo/z_cairo.tex`
		AssetContext = z_cairo
		TriggerScript = z_cairo_crowd_peds
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
		bb_mesh_id = z_cairo_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_cairo/z_cairo.tex`
		AssetContext = z_cairo
		TriggerScript = z_cairo_crowd_peds
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
		bb_mesh_id = z_cairo_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_cairo/z_cairo.tex`
		AssetContext = z_cairo
		TriggerScript = z_cairo_crowd_peds
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
		bb_mesh_id = z_cairo_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_cairo/z_cairo.tex`
		AssetContext = z_cairo
		TriggerScript = z_cairo_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_neworleans_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_neworleans_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_neworleans/z_neworleans.tex`
		AssetContext = z_neworleans
		TriggerScript = z_neworleans_crowd_peds
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
		bb_mesh_id = z_neworleans_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_neworleans/z_neworleans.tex`
		AssetContext = z_neworleans
		TriggerScript = z_neworleans_crowd_peds
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
		bb_mesh_id = z_neworleans_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_neworleans/z_neworleans.tex`
		AssetContext = z_neworleans
		TriggerScript = z_neworleans_crowd_peds
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
		bb_mesh_id = z_neworleans_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_neworleans/z_neworleans.tex`
		AssetContext = z_neworleans
		TriggerScript = z_neworleans_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_mexicocity_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_mexicocity_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_mexicocity/z_mexicocity.tex`
		AssetContext = z_mexicocity
		TriggerScript = z_mexicocity_crowd_peds
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
		bb_mesh_id = z_mexicocity_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_mexicocity/z_mexicocity.tex`
		AssetContext = z_mexicocity
		TriggerScript = z_mexicocity_crowd_peds
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
		bb_mesh_id = z_mexicocity_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_mexicocity/z_mexicocity.tex`
		AssetContext = z_mexicocity
		TriggerScript = z_mexicocity_crowd_peds
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
		bb_mesh_id = z_mexicocity_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_mexicocity/z_mexicocity.tex`
		AssetContext = z_mexicocity
		TriggerScript = z_mexicocity_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_nashville_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_nashville_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_nashville/z_nashville.tex`
		AssetContext = z_nashville
		TriggerScript = z_nashville_crowd_peds
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
		bb_mesh_id = z_nashville_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_nashville/z_nashville.tex`
		AssetContext = z_nashville
		TriggerScript = z_nashville_crowd_peds
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
		bb_mesh_id = z_nashville_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_nashville/z_nashville.tex`
		AssetContext = z_nashville
		TriggerScript = z_nashville_crowd_peds
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
		bb_mesh_id = z_nashville_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_nashville/z_nashville.tex`
		AssetContext = z_nashville
		TriggerScript = z_nashville_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_norway_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_norway_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_norway/z_norway.tex`
		AssetContext = z_norway
		TriggerScript = z_norway_crowd_peds
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
		bb_mesh_id = z_norway_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_norway/z_norway.tex`
		AssetContext = z_norway
		TriggerScript = z_norway_crowd_peds
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
		bb_mesh_id = z_norway_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_norway/z_norway.tex`
		AssetContext = z_norway
		TriggerScript = z_norway_crowd_peds
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
		bb_mesh_id = z_norway_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_norway/z_norway.tex`
		AssetContext = z_norway
		TriggerScript = z_norway_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_dublin_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_dublin_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_dublin/z_dublin.tex`
		AssetContext = z_dublin
		TriggerScript = z_dublin_crowd_peds
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
		bb_mesh_id = z_dublin_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_dublin/z_dublin.tex`
		AssetContext = z_dublin
		TriggerScript = z_dublin_crowd_peds
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
		bb_mesh_id = z_dublin_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_dublin/z_dublin.tex`
		AssetContext = z_dublin
		TriggerScript = z_dublin_crowd_peds
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
		bb_mesh_id = z_dublin_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_dublin/z_dublin.tex`
		AssetContext = z_dublin
		TriggerScript = z_dublin_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_vegas_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_vegas_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_vegas/z_vegas.tex`
		AssetContext = z_vegas
		TriggerScript = z_vegas_crowd_peds
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
		bb_mesh_id = z_vegas_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_vegas/z_vegas.tex`
		AssetContext = z_vegas
		TriggerScript = z_vegas_crowd_peds
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
		bb_mesh_id = z_vegas_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_vegas/z_vegas.tex`
		AssetContext = z_vegas
		TriggerScript = z_vegas_crowd_peds
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
		bb_mesh_id = z_vegas_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_vegas/z_vegas.tex`
		AssetContext = z_vegas
		TriggerScript = z_vegas_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_subway_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_subway_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_subway/z_subway.tex`
		AssetContext = z_subway
		TriggerScript = z_subway_crowd_peds
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
		bb_mesh_id = z_subway_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_subway/z_subway.tex`
		AssetContext = z_subway
		TriggerScript = z_subway_crowd_peds
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
		bb_mesh_id = z_subway_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_subway/z_subway.tex`
		AssetContext = z_subway
		TriggerScript = z_subway_crowd_peds
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
		bb_mesh_id = z_subway_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_subway/z_subway.tex`
		AssetContext = z_subway
		TriggerScript = z_subway_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_carhenge_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_carhenge_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_carhenge/z_carhenge.tex`
		AssetContext = z_carhenge
		TriggerScript = z_carhenge_crowd_peds
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
		bb_mesh_id = z_carhenge_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_carhenge/z_carhenge.tex`
		AssetContext = z_carhenge
		TriggerScript = z_carhenge_crowd_peds
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
		bb_mesh_id = z_carhenge_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_carhenge/z_carhenge.tex`
		AssetContext = z_carhenge
		TriggerScript = z_carhenge_crowd_peds
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
		bb_mesh_id = z_carhenge_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_carhenge/z_carhenge.tex`
		AssetContext = z_carhenge
		TriggerScript = z_carhenge_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_freakshow_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_freakshow_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_freakshow/z_freakshow.tex`
		AssetContext = z_freakshow
		TriggerScript = z_freakshow_crowd_peds
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
		bb_mesh_id = z_freakshow_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_freakshow/z_freakshow.tex`
		AssetContext = z_freakshow
		TriggerScript = z_freakshow_crowd_peds
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
		bb_mesh_id = z_freakshow_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_freakshow/z_freakshow.tex`
		AssetContext = z_freakshow
		TriggerScript = z_freakshow_crowd_peds
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
		bb_mesh_id = z_freakshow_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_freakshow/z_freakshow.tex`
		AssetContext = z_freakshow
		TriggerScript = z_freakshow_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_dragrace_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_dragrace_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_dragrace/z_dragrace.tex`
		AssetContext = z_dragrace
		TriggerScript = z_dragrace_crowd_peds
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
		bb_mesh_id = z_dragrace_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_dragrace/z_dragrace.tex`
		AssetContext = z_dragrace
		TriggerScript = z_dragrace_crowd_peds
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
		bb_mesh_id = z_dragrace_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_dragrace/z_dragrace.tex`
		AssetContext = z_dragrace
		TriggerScript = z_dragrace_crowd_peds
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
		bb_mesh_id = z_dragrace_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_dragrace/z_dragrace.tex`
		AssetContext = z_dragrace
		TriggerScript = z_dragrace_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
	}
]
z_lhc_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		viewportparams = imposter_rendering_quad0
		hrviewportparams = imposter_rendering_highres_quad0
		resourceviewport = crowd_base_viewport
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		bb_mesh_id = z_lhc_crowd_billboard_01
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_lhc/z_lhc.tex`
		AssetContext = z_lhc
		TriggerScript = z_lhc_crowd_peds
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
		bb_mesh_id = z_lhc_crowd_billboard_02
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_lhc/z_lhc.tex`
		AssetContext = z_lhc
		TriggerScript = z_lhc_crowd_peds
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
		bb_mesh_id = z_lhc_crowd_billboard_03
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_lhc/z_lhc.tex`
		AssetContext = z_lhc
		TriggerScript = z_lhc_crowd_peds
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
		bb_mesh_id = z_lhc_crowd_billboard_04
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_lhc/z_lhc.tex`
		AssetContext = z_lhc
		TriggerScript = z_lhc_crowd_peds
		param = {
			Name = crowd4
		}
		no_resolve_colorbuffer = 1
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
