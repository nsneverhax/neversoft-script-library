
script hud_recreate_rockmeter_judy_hilight_hack 
	RequireParams \{[
			desc_id
		]
		all}
	<desc_id> :desc_resolvealias Name = alias_judy_overhealth param = judy_overhealth
	ResolveScreenElementID id = {
		<judy_overhealth> child = {
			lightning_master_cont child = lightning_cont01
		}
	} param = lightning_cont01
	ResolveScreenElementID id = {
		<lightning_cont01> child = lightning01
	} param = lightning01
	DestroyScreenElement id = <lightning01>
	CreateScreenElement {
		Type = SpriteElement
		id = <lightning01>
		parent = <lightning_cont01>
		Scale = (0.0625, 1.0)
		texture = mat_lightning_arc_anim01
		use_animated_uvs = true
		frame_length = 0.05
		num_uv_frames = (1.0, 16.0)
		blend = add
		top_down_v
		loop_animated_uvs = true
		rgba = [0 190 0 255]
		dims = (128.0, 64.0)
		z_priority = 2
	}
	ResolveScreenElementID id = {
		<lightning_cont01> child = lightning02
	} param = lightning02
	DestroyScreenElement id = <lightning02>
	CreateScreenElement {
		Type = SpriteElement
		id = <lightning02>
		parent = <lightning_cont01>
		Scale = (0.0625, 1.0)
		texture = mat_lightning_arc_anim01
		use_animated_uvs = true
		frame_length = 0.05
		num_uv_frames = (1.0, 16.0)
		current_frames = (0.0, 1.0)
		blend = add
		top_down_v
		loop_animated_uvs = true
		rgba = [0 190 0 255]
		dims = (128.0, 64.0)
		z_priority = 2
	}
endscript

script hud_recreate_vocals_rp_tesla_fx_hack 
	RequireParams \{[
			desc_id
		]
		all}
	ResolveScreenElementID id = {
		<desc_id> child = {
			star_Power child = rp_telsa_fx_lv1_cont
		}
	} param = rp_telsa_fx_lv1_cont
	ResolveScreenElementID id = {
		<rp_telsa_fx_lv1_cont> child = `rp_telsa	_starpower_fx01`
	} param = rp_telsa_starpower_fx01
	DestroyScreenElement id = <rp_telsa_starpower_fx01>
	CreateScreenElement {
		Type = SpriteElement
		id = <rp_telsa_starpower_fx01>
		parent = <rp_telsa_fx_lv1_cont>
		Scale = (0.0625, 1.0)
		texture = mat_lightning_arc_anim01
		use_animated_uvs = true
		frame_length = 0.05
		num_uv_frames = (1.0, 16.0)
		current_frames = (0.0, 1.0)
		blend = add
		top_down_v
		loop_animated_uvs = true
		rgba = [156 255 122 255]
		dims = (115.0, 64.0)
		z_priority = 0.2
	}
	ResolveScreenElementID id = {
		<rp_telsa_fx_lv1_cont> child = `rp_telsa	_starpower_fx02`
	} param = rp_telsa_starpower_fx02
	DestroyScreenElement id = <rp_telsa_starpower_fx02>
	CreateScreenElement {
		Type = SpriteElement
		id = <rp_telsa_starpower_fx02>
		parent = <rp_telsa_fx_lv1_cont>
		Scale = (0.0625, 1.0)
		texture = mat_lightning_arc_anim01
		use_animated_uvs = true
		frame_length = 0.05
		num_uv_frames = (1.0, 16.0)
		current_frames = (0.0, 1.0)
		blend = add
		top_down_v
		loop_animated_uvs = true
		rgba = [255 255 255 255]
		dims = (115.0, 64.0)
		z_priority = 0.2
	}
	ResolveScreenElementID id = {
		<desc_id> child = {
			star_Power child = rp_telsa_fx_lv2_cont
		}
	} param = rp_telsa_fx_lv2_cont
	ResolveScreenElementID id = {
		<rp_telsa_fx_lv2_cont> child = `rp_telsa	_starpower_fx01`
	} param = rp_telsa_starpower_fx01
	DestroyScreenElement id = <rp_telsa_starpower_fx01>
	CreateScreenElement {
		Type = SpriteElement
		id = <rp_telsa_starpower_fx01>
		parent = <rp_telsa_fx_lv2_cont>
		Scale = (0.0625, 1.0)
		texture = mat_lightning_arc_anim01
		use_animated_uvs = true
		frame_length = 0.05
		num_uv_frames = (1.0, 16.0)
		current_frames = (0.0, 1.0)
		blend = add
		top_down_v
		loop_animated_uvs = true
		rgba = [156 255 122 255]
		dims = (115.0, 64.0)
		z_priority = 0.2
	}
	ResolveScreenElementID id = {
		<rp_telsa_fx_lv2_cont> child = `rp_telsa	_starpower_fx02`
	} param = rp_telsa_starpower_fx02
	DestroyScreenElement id = <rp_telsa_starpower_fx02>
	CreateScreenElement {
		Type = SpriteElement
		id = <rp_telsa_starpower_fx02>
		parent = <rp_telsa_fx_lv2_cont>
		Scale = (0.0625, 1.0)
		texture = mat_lightning_arc_anim01
		use_animated_uvs = true
		frame_length = 0.05
		num_uv_frames = (1.0, 16.0)
		current_frames = (0.0, 1.0)
		blend = add
		top_down_v
		loop_animated_uvs = true
		rgba = [255 255 255 255]
		dims = (115.0, 64.0)
		z_priority = 0.2
	}
endscript
