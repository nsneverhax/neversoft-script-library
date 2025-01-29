
script handofgod_electriccenter 
	DestroyScreenElement \{id = hog_electriccenter}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter
		texture = ph_electricity_01
		alpha = 1
		Scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		Pos = (640.0, 210.0)
		blend = add
		z_priority = 2000
		rgba = [
			146
			200
			255
			255
		]}
	Wait \{1
		Frame}
	SpawnScriptNow \{handofgod_electriccenter_anim_scale}
endscript

script handofgod_electriccenter_anim_scale 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0.3
		time = 0.05}
	hog_electriccenter :se_waitprops
	hog_electriccenter :se_setprops \{Scale = (2.0, 2.0)
		alpha = 1
		time = 0.1}
	hog_electriccenter :se_waitprops
	repeat 7
	DestroyScreenElement \{id = hog_electriccenter}
endscript

script handofgod_fx_cleanup 
	KillSpawnedScript \{Name = handofgod_fx_01}
	KillSpawnedScript \{Name = handofgod_fx_02}
	KillSpawnedScript \{Name = handofgod_lightning_combo}
	KillSpawnedScript \{Name = handofgod_lightning_god}
	KillSpawnedScript \{Name = handofgod_lighting_devil_02}
	KillSpawnedScript \{Name = handofgod_electriccenter_glow_anim}
	KillSpawnedScript \{Name = handofgod_electriccenter_glow}
	KillSpawnedScript \{Name = handofgod_electriccenter}
	KillSpawnedScript \{Name = handofgod_electriccenter_anim_scale}
	KillSpawnedScript \{Name = handofgod_electriccenter_03}
	KillSpawnedScript \{Name = handofgod_electriccenter_anim_scale_03}
	KillSpawnedScript \{Name = handofgod_electriccenter_02}
	KillSpawnedScript \{Name = handofgod_electriccenter_anim_scale_02}
	KillSpawnedScript \{Name = handofgod_electriccenter_flare_03}
	KillSpawnedScript \{Name = handofgod_electriccenter_flare_03_anim}
	KillSpawnedScript \{Name = handofgod_smoke_02}
	DestroyScreenElement \{id = hog_lightning_god}
	DestroyScreenElement \{id = hog_lighting_devil_02}
	DestroyScreenElement \{id = hog_electriccenter_glow}
	DestroyScreenElement \{id = hog_electriccenter}
	DestroyScreenElement \{id = hog_electriccenter_03}
	DestroyScreenElement \{id = hog_electriccenter_02}
	DestroyScreenElement \{id = hog_electriccenter_flare_03}
	Destroy2DParticleSystem \{id = hog_smoke_02}
endscript

script you_rock_lightning_01 
	Wait \{0.25
		Second}
	source_01_pos = (0.0, 200.0)
	source_02_pos = (1280.0, 0.0)
	source_03_pos = (0.0, 512.0)
	source_04_pos = (1280.0, 650.0)
	source_05_pos = (0.0, 650.0)
	source_06_pos = (1280.0, 320.0)
	source_07_pos = (0.0, 650.0)
	source_08_pos = (300.0, 720.0)
	source_09_pos = (1024.0, 720.0)
	target_01_pos = (740.0, 240.0)
	target_02_pos = (550.0, 200.0)
	target_03_pos = (880.0, 280.0)
	target_04_pos = (480.0, 220.0)
	target_05_pos = (680.0, 300.0)
	target_06_pos = (380.0, 270.0)
	target_07_pos = (0.0, 0.0)
	target_08_pos = (1280.0, 720.0)
	target_09_pos = (0.0, 120.0)
	rgba1 = [180 180 255 255]
	rgba2 = [128 200 255 255]
	p2p_lightning_create source_pos = <source_06_pos> target_pos = <target_01_pos> rgba = <rgba1>
	Wait \{5
		frames}
	p2p_lightning_create source_pos = <source_05_pos> target_pos = <target_02_pos> rgba = <rgba2>
	Wait \{3
		frames}
	p2p_lightning_create source_pos = <source_04_pos> target_pos = <target_03_pos> rgba = <rgba2>
	p2p_lightning_create source_pos = <source_01_pos> target_pos = <target_08_pos> rgba = <rgba2>
	Wait \{12
		frames}
	p2p_lightning_create source_pos = <source_03_pos> target_pos = <target_04_pos> rgba = <rgba1>
	Wait \{14
		frames}
	p2p_lightning_create source_pos = <source_02_pos> target_pos = <target_05_pos> rgba = <rgba2>
	Wait \{4
		frames}
	p2p_lightning_create source_pos = <source_01_pos> target_pos = <target_06_pos> rgba = <rgba2>
	Wait \{22
		frames}
	p2p_lightning_create source_pos = <source_09_pos> target_pos = <target_01_pos> rgba = <rgba1>
	Wait \{5
		frames}
	p2p_lightning_create source_pos = <source_08_pos> target_pos = <target_02_pos> rgba = <rgba2>
	Wait \{3
		frames}
	p2p_lightning_create source_pos = <source_07_pos> target_pos = <target_03_pos> rgba = <rgba2>
	p2p_lightning_create source_pos = <source_04_pos> target_pos = <target_09_pos> rgba = <rgba2>
	Wait \{12
		frames}
	p2p_lightning_create source_pos = <source_03_pos> target_pos = <target_04_pos> rgba = <rgba1>
endscript

script you_rock_text_glow 
	Wait \{0.25
		Second}
	if NOT ScreenElementExists id = <parent>
		return
	endif
	rgba_start = [123 123 123 255]
	rgba_end = [0 64 255 255]
	Emit_Rate = 0.01
	z_priority = 23
endscript

script you_rock_text_glow_cleanup 
	DestroyScreenElement id = <Name>
endscript

script urok_fx_xplosion01 
	rgba = [128 128 255 255]
	z_priority = 22
	you_rock_text_glow_cleanup
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		dims = (10.0, 10.0)
		alpha = 1
		Scale = (2.0, 2.0)
		just = [center center]
		pos_anchor = [center center]
		Pos = <Pos>
		z_priority = 0
		rot_angle = <z_priority>
	}
	<urok_xplosion_fx_cont> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <urok_xplosion_fx_cont>
		dims = (500.0, 550.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center bottom]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 0
		texture = note_hit_xplosion1
		rgba = <rgba>
		use_animated_uvs = true
		frame_length = 0.033
		num_uv_frames = (4.0, 4.0)
		blend = add
		top_down_v
		loop_animated_uvs = FALSE
	}
	<urok_xplosion01> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <urok_xplosion_fx_cont>
		dims = (500.0, 550.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center bottom]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 90
		texture = note_hit_xplosion1
		rgba = <rgba>
		use_animated_uvs = true
		frame_length = 0.033
		num_uv_frames = (4.0, 4.0)
		blend = add
		top_down_v
		loop_animated_uvs = FALSE
	}
	<urok_xplosion02> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <urok_xplosion_fx_cont>
		dims = (500.0, 550.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center bottom]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 180
		texture = note_hit_xplosion1
		rgba = <rgba>
		use_animated_uvs = true
		frame_length = 0.033
		num_uv_frames = (4.0, 4.0)
		blend = add
		top_down_v
		loop_animated_uvs = FALSE
	}
	<urok_xplosion03> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <urok_xplosion_fx_cont>
		dims = (500.0, 550.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center bottom]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 270
		texture = note_hit_xplosion1
		rgba = <rgba>
		use_animated_uvs
		use_animated_uvs = true
		frame_length = 0.033
		num_uv_frames = (4.0, 4.0)
		blend = add
		top_down_v
		loop_animated_uvs = FALSE
	}
	<urok_xplosion04> = <id>
	Wait \{1
		Second}
	urok_fx_xplosion01_cleanup
	you_rock_text_glow_cleanup Name = <parent>
endscript

script urok_fx_xplosion01_cleanup 
	DestroyScreenElement id = <urok_xplosion_fx_cont>
endscript
