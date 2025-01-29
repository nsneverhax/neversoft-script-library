
script 0xefa229a7 
	Wait \{0.75
		Seconds}
	SpawnScriptLater \{0x1c08fce3}
	SpawnScriptLater \{0xb31261d1}
	Wait \{0.4
		Seconds}
	SpawnScriptLater \{0x82fa7b4c}
	SpawnScriptLater \{0x8501ad59}
	Wait \{0.2
		Seconds}
	SpawnScriptLater \{0x248d70f8}
	Wait \{0.1
		Seconds}
	SpawnScriptLater \{0xe12a4e76}
	SpawnScriptLater \{0x6c62086c}
	SpawnScriptLater \{0x76b55f5f}
	Wait \{0.2
		Seconds}
	SpawnScriptLater \{0x475d45c2}
	SpawnScriptLater \{0x1b6538fa}
	SpawnScriptLater \{0x82fa7b4c}
	Wait \{0.2
		Seconds}
	SpawnScriptLater \{0xb31261d1}
	SpawnScriptLater \{0x248d70f8}
	SpawnScriptLater \{0xf2069dcf}
	Wait \{0.4
		Seconds}
	SpawnScriptLater \{0x8e651f5e}
endscript

script 0xefda844d 
	Destroy2DParticleSystem \{id = 0x15b6abc1}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = 0x15b6abc1
		Pos = (640.0, 300.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			225
			251
			251
			220
		]
		end_color = [
			225
			251
			251
			0
		]
		start_scale = (0.4, 0.4)
		end_scale = (0.3, 0.3)
		start_angle_spread = 0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 100
		emit_radius = 200
		Emit_Rate = 0.003
		emit_dir = 0
		emit_spread = 180
		velocity = 10
		friction = (0.0, 10.0)
		time = 5}
	Wait \{5
		Seconds}
	Destroy2DParticleSystem \{id = 0x15b6abc1
		kill_when_empty}
endscript

script 0xb31261d1 
	begin
	spawnscript \{0x853f8d0e}
	Wait \{0.4
		Seconds}
	spawnscript \{0x8873f9cf}
	spawnscript \{0xc44d49ec}
	spawnscript \{0xd6f8e602}
	spawnscript \{0x81a4d013}
	spawnscript \{0x58bdbc12}
	spawnscript \{0x22a58278}
	spawnscript \{0x4da559b7}
	spawnscript \{0xfb64b200}
	Wait \{0.05
		Seconds}
	repeat 1
endscript

script 0x1c08fce3 
	DestroyScreenElement \{id = lightning01}
	Wait \{0.03
		Seconds}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = lightning01
		alpha = 0.95
		Scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (105.0, 150.0)
		rot_angle = -35
		material = 0x5d6f67fb
		blend = add
		use_animated_uvs = true
		frame_length = 0.067
		num_uv_frames = (4.0, 1.0)
		rgba = [
			255
			255
			255
			255
		]
		z_priority = 110}
	Wait \{0.4
		Second}
	DestroyScreenElement \{id = lightning01}
endscript

script 0x853f8d0e 
	DestroyScreenElement \{id = 0x5746ba36}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x5746ba36
		texture = ph_radialglow_01
		alpha = 0.0
		Scale = (8.0, 8.0)
		just = [
			center
			center
		]
		Pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0x5746ba36 :obj_spawnscript \{0x356cfd79}
endscript

script 0x356cfd79 
	if ScreenElementExists \{id = 0x5746ba36}
		begin
		0x5746ba36 :se_setprops \{Scale = (0.5, 0.5)
			alpha = 0}
		0x5746ba36 :se_setprops \{Scale = (1.0, 1.0)
			alpha = 0.3
			time = 0.1}
		0x5746ba36 :se_waitprops
		0x5746ba36 :se_setprops \{Scale = (1.0, 1.0)
			alpha = 0.0
			time = 0.01}
		0x5746ba36 :se_waitprops
		repeat 2
		Wait \{0.01
			Seconds}
		begin
		0x5746ba36 :se_setprops \{Scale = (0.5, 0.5)
			alpha = 0}
		0x5746ba36 :se_setprops \{Scale = (5.0, 5.0)
			alpha = 0.5
			time = 0.05}
		0x5746ba36 :se_waitprops
		0x5746ba36 :se_setprops \{Scale = (5.0, 5.0)
			alpha = 0.0
			time = 0.5}
		repeat 1
	endif
endscript

script 0x8873f9cf 
	Destroy2DParticleSystem \{id = 0xa0a33866}
	Create2DParticleSystem \{id = 0xa0a33866
		Pos = (260.0, 320.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		Emit_Rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.2}
	Wait \{0.4
		Second}
	Destroy2DParticleSystem \{id = 0xa0a33866
		kill_when_empty}
endscript

script 0x22a58278 
	DestroyScreenElement \{id = 0xc651215c}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xc651215c
		texture = 0xf86604e5
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xc651215c :obj_spawnscript \{0x0a5fef48}
endscript

script 0x0a5fef48 
	0xc651215c :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xc651215c :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0xc651215c :se_waitprops
	0xc651215c :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x81a4d013 
	DestroyScreenElement \{id = 0x53dde72b}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x53dde72b
		texture = 0xa51a5a40
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (320.0, 450.0)
		rot_angle = 280
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x53dde72b :obj_spawnscript \{0x0151eb20}
endscript

script 0x0151eb20 
	0x53dde72b :se_setprops \{Scale = (1.5, 1.5)
		alpha = 0}
	0x53dde72b :se_setprops \{Scale = (1.5, 1.5)
		alpha = 0.5
		time = 0.05}
	0x53dde72b :se_waitprops
	Wait \{0.1
		Seconds}
	0x53dde72b :se_setprops \{Scale = (1.5, 1.5)
		alpha = 0.0
		time = 0.3}
endscript

script 0xc44d49ec 
	DestroyScreenElement \{id = 0x46d61bf0}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x46d61bf0
		texture = ph_multiconfetti_02
		alpha = 0.0
		Scale = (1.5, 1.5)
		just = [
			center
			center
		]
		Pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x46d61bf0 :obj_spawnscript \{0x2040d2ed}
endscript

script 0x2040d2ed 
	0x46d61bf0 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x46d61bf0 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0x46d61bf0 :se_waitprops
	0x46d61bf0 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0x46d61bf0 :se_waitprops
	0x46d61bf0 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0x46d61bf0 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0x46d61bf0 :se_waitprops
	0x46d61bf0 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0xd6f8e602 
	DestroyScreenElement \{id = 0x5463b41e}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x5463b41e
		texture = 0xea99e289
		alpha = 0.0
		Scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x5463b41e :obj_spawnscript \{0x19cdee28}
endscript

script 0x19cdee28 
	0x5463b41e :se_setprops \{Scale = (0.3, 0.3)
		alpha = 0}
	0x5463b41e :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.05}
	0x5463b41e :se_waitprops
	0x5463b41e :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0x4da559b7 
	DestroyScreenElement \{id = flare_01}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = flare_01
		texture = 0x5d3f0efd
		alpha = 0.0
		Scale = (10.0, 10.0)
		just = [
			center
			center
		]
		Pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	flare_01 :obj_spawnscript \{0x722ad9b2}
endscript

script 0x722ad9b2 
	flare_01 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	flare_01 :se_setprops \{Scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.1}
	flare_01 :se_waitprops
	flare_01 :se_setprops \{Scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0xfb64b200 
	DestroyScreenElement \{id = 0x1f901124}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x1f901124
		texture = JOW_ButtonFlare01
		alpha = 0.0
		Scale = (5.0, 5.0)
		just = [
			center
			center
		]
		Pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x1f901124 :obj_spawnscript \{0xf3413ec6}
endscript

script 0xf3413ec6 
	0x1f901124 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0x1f901124 :se_setprops \{Scale = (3.0, 3.0)
		alpha = 1
		time = 0.05}
	0x1f901124 :se_waitprops
	0x1f901124 :se_setprops \{Scale = (3.0, 3.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0x58bdbc12 
	Destroy2DParticleSystem \{id = stars_01}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = stars_01
		Pos = (260.0, 320.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			225
			251
			251
			220
		]
		end_color = [
			225
			251
			251
			0
		]
		start_scale = (0.4, 0.4)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 0
		emit_radius = 5
		Emit_Rate = 0.009
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 35
		friction = (0.0, 60.0)
		time = 0.2}
	Wait \{0.3
		Seconds}
	Destroy2DParticleSystem \{id = stars_01
		kill_when_empty}
endscript

script 0x82fa7b4c 
	begin
	spawnscript \{0x1c36dcb4}
	Wait \{0.4
		Seconds}
	spawnscript \{0x117aa875}
	spawnscript \{0x5d441856}
	spawnscript \{0x4ff1b7b8}
	spawnscript \{0x18ad81a9}
	spawnscript \{0xc1b4eda8}
	spawnscript \{0xd4ac080d}
	Wait \{0.5
		Seconds}
	repeat 1
endscript

script 0x8501ad59 
	DestroyScreenElement \{id = lightning02}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = lightning02
		alpha = 0.95
		Scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (1075.0, 160.0)
		rot_angle = 35
		material = 0x5d6f67fb
		blend = add
		use_animated_uvs = true
		frame_length = 0.067
		num_uv_frames = (4.0, 1.0)
		rgba = [
			255
			255
			255
			255
		]
		z_priority = 110}
	Wait \{0.4
		Second}
	DestroyScreenElement \{id = lightning02}
endscript

script 0x117aa875 
	Destroy2DParticleSystem \{id = 0x39aa69dc}
	Create2DParticleSystem \{id = 0x39aa69dc
		Pos = (950.0, 340.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		Emit_Rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	Wait \{0.4
		Second}
	Destroy2DParticleSystem \{id = 0x39aa69dc
		kill_when_empty}
endscript

script 0x1c36dcb4 
	DestroyScreenElement \{id = 0xce4feb8c}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xce4feb8c
		texture = ph_radialglow_01
		alpha = 0.0
		Scale = (8.0, 8.0)
		just = [
			center
			center
		]
		Pos = (950.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0xce4feb8c :obj_spawnscript \{0xb3f88fd7}
endscript

script 0xb3f88fd7 
	begin
	0xce4feb8c :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xce4feb8c :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.4
		time = 0.1}
	0xce4feb8c :se_waitprops
	0xce4feb8c :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0xce4feb8c :se_waitprops
	repeat 2
	Wait \{0.05
		Seconds}
	begin
	0xce4feb8c :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xce4feb8c :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0xce4feb8c :se_waitprops
	0xce4feb8c :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0xbbacd3c2 
	DestroyScreenElement \{id = 0x5f5870e6}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x5f5870e6
		texture = 0xf86604e5
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (950.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x5f5870e6 :obj_spawnscript \{0x8ccb9de6}
endscript

script 0x8ccb9de6 
	0x5f5870e6 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x5f5870e6 :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0x5f5870e6 :se_waitprops
	0x5f5870e6 :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x18ad81a9 
	DestroyScreenElement \{id = 0xcad4b691}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xcad4b691
		texture = 0xa51a5a40
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (810.0, 440.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xcad4b691 :obj_spawnscript \{0x87c5998e}
endscript

script 0x87c5998e 
	0xcad4b691 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0}
	0xcad4b691 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.5
		rot_angle = 0
		time = 0.05}
	0xcad4b691 :se_waitprops
	Wait \{0.1
		Seconds}
	0xcad4b691 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.0
		rot_angle = 0
		time = 0.8}
endscript

script 0x5d441856 
	DestroyScreenElement \{id = 0xdfdf4a4a}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xdfdf4a4a
		texture = ph_multiconfetti_02
		alpha = 0.0
		Scale = (1.5, 1.5)
		just = [
			center
			center
		]
		Pos = (950.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xdfdf4a4a :obj_spawnscript \{0xa6d4a043}
endscript

script 0xa6d4a043 
	0xdfdf4a4a :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xdfdf4a4a :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0xdfdf4a4a :se_waitprops
	0xdfdf4a4a :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0xdfdf4a4a :se_waitprops
	0xdfdf4a4a :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0xdfdf4a4a :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0xdfdf4a4a :se_waitprops
	0xdfdf4a4a :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0x4ff1b7b8 
	DestroyScreenElement \{id = 0xcd6ae5a4}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xcd6ae5a4
		texture = 0xea99e289
		alpha = 0.0
		Scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (1000.0, 250.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xcd6ae5a4 :obj_spawnscript \{0x9f599c86}
endscript

script 0x9f599c86 
	0xcd6ae5a4 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0xcd6ae5a4 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0xcd6ae5a4 :se_waitprops
	0xcd6ae5a4 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0xd4ac080d 
	DestroyScreenElement \{id = 0xfc7cc9a4}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xfc7cc9a4
		texture = 0x5d3f0efd
		alpha = 0.0
		Scale = (10.0, 10.0)
		just = [
			center
			center
		]
		Pos = (950.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xfc7cc9a4 :obj_spawnscript \{0xf4beab1c}
endscript

script 0xf4beab1c 
	0xfc7cc9a4 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0xfc7cc9a4 :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.6
		time = 0.1}
	0xfc7cc9a4 :se_waitprops
	0xfc7cc9a4 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x6d4c5b2d 
	DestroyScreenElement \{id = 0xefd70931}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xefd70931
		texture = ph_smoke_singlepuff_blend_02
		alpha = 0.0
		Scale = (2.6, 2.6)
		just = [
			center
			center
		]
		Pos = (1105.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xefd70931 :obj_spawnscript \{0x7022e105}
endscript

script 0x7022e105 
	0xefd70931 :se_setprops \{Scale = (1.0, 1.0)
		alpha = 0}
	0xefd70931 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.3
		rot_angle = 10
		time = 0.1}
	0xefd70931 :se_waitprops
	0xefd70931 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.0
		rot_angle = 10
		time = 1}
endscript

script 0xc1b4eda8 
	Destroy2DParticleSystem \{id = 0xe9642c01}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = 0xe9642c01
		Pos = (950.0, 340.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		Emit_Rate = 0.009
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 20
		friction = (0.0, 60.0)
		time = 0.2}
	Wait \{0.3
		Seconds}
	Destroy2DParticleSystem \{id = 0xe9642c01
		kill_when_empty}
endscript

script 0x248d70f8 
	begin
	spawnscript \{0x6b31ec22}
	Wait \{0.4
		Seconds}
	spawnscript \{0x667d98e3}
	spawnscript \{0x2a4328c0}
	spawnscript \{0x38f6872e}
	spawnscript \{0x6faab13f}
	spawnscript \{0xb6b3dd3e}
	spawnscript \{0xccabe354}
	spawnscript \{0xa3ab389b}
	repeat 1
endscript

script 0x6b31ec22 
	DestroyScreenElement \{id = 0xb948db1a}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xb948db1a
		texture = ph_radialglow_01
		alpha = 0.0
		Scale = (4.0, 4.0)
		just = [
			center
			center
		]
		Pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0xb948db1a :obj_spawnscript \{0x78a45c72}
endscript

script 0x78a45c72 
	begin
	0xb948db1a :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xb948db1a :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	0xb948db1a :se_waitprops
	0xb948db1a :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0xb948db1a :se_waitprops
	repeat 2
	Wait \{0.05
		Seconds}
	begin
	0xb948db1a :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xb948db1a :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0xb948db1a :se_waitprops
	0xb948db1a :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0xf2069dcf 
	DestroyScreenElement \{id = 0x9044b76b}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x9044b76b
		alpha = 0.95
		Scale = (0.8, 0.8)
		just = [
			center
			center
		]
		Pos = (550.0, 110.0)
		rot_angle = -30
		material = 0x5d6f67fb
		blend = add
		use_animated_uvs = true
		frame_length = 0.067
		num_uv_frames = (4.0, 1.0)
		rgba = [
			255
			255
			255
			255
		]
		z_priority = 110}
	Wait \{0.4
		Second}
	DestroyScreenElement \{id = 0x9044b76b}
endscript

script 0xccabe354 
	DestroyScreenElement \{id = 0x285f4070}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x285f4070
		texture = 0xf86604e5
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x285f4070 :obj_spawnscript \{0x47974e43}
endscript

script 0x47974e43 
	0x285f4070 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x285f4070 :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0x285f4070 :se_waitprops
	0x285f4070 :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x667d98e3 
	Destroy2DParticleSystem \{id = 0x4ead594a}
	Create2DParticleSystem \{id = 0x4ead594a
		Pos = (620.0, 260.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		Emit_Rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	Wait \{0.4
		Second}
	Destroy2DParticleSystem \{id = 0x4ead594a
		kill_when_empty}
endscript

script 0x6faab13f 
	DestroyScreenElement \{id = 0xbdd38607}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xbdd38607
		texture = 0xa51a5a40
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (540.0, 110.0)
		rot_angle = 100
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xbdd38607 :obj_spawnscript \{0x4c994a2b}
endscript

script 0x4c994a2b 
	0xbdd38607 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0
		rot_angle = 100}
	0xbdd38607 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.05}
	0xbdd38607 :se_waitprops
	Wait \{0.1
		Seconds}
	0xbdd38607 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.3}
endscript

script 0x2a4328c0 
	DestroyScreenElement \{id = 0xa8d87adc}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xa8d87adc
		texture = ph_multiconfetti_02
		alpha = 0.0
		Scale = (1.5, 1.5)
		just = [
			center
			center
		]
		Pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xa8d87adc :obj_spawnscript \{0x6d8873e6}
endscript

script 0x6d8873e6 
	0xa8d87adc :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xa8d87adc :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0xa8d87adc :se_waitprops
	0xa8d87adc :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0xa8d87adc :se_waitprops
	0xa8d87adc :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0xa8d87adc :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	0xa8d87adc :se_waitprops
	0xa8d87adc :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0x38f6872e 
	DestroyScreenElement \{id = 0xba6dd532}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xba6dd532
		texture = 0xea99e289
		alpha = 0.0
		Scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xba6dd532 :obj_spawnscript \{0x54054f23}
endscript

script 0x54054f23 
	0xba6dd532 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0xba6dd532 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0xba6dd532 :se_waitprops
	0xba6dd532 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0xa3ab389b 
	DestroyScreenElement \{id = 0x8b7bf932}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x8b7bf932
		texture = 0x5d3f0efd
		alpha = 0.0
		Scale = (10.0, 10.0)
		just = [
			center
			center
		]
		Pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x8b7bf932 :obj_spawnscript \{0x3fe278b9}
endscript

script 0x3fe278b9 
	0x8b7bf932 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0x8b7bf932 :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.6
		time = 0.1}
	0x8b7bf932 :se_waitprops
	0x8b7bf932 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0xb6b3dd3e 
	Destroy2DParticleSystem \{id = 0x9e631c97}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = 0x9e631c97
		Pos = (620.0, 260.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		Emit_Rate = 0.009
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 20
		friction = (0.0, 60.0)
		time = 0.2}
	Wait \{0.3
		Seconds}
	Destroy2DParticleSystem \{id = 0x9e631c97
		kill_when_empty}
endscript

script 0xe12a4e76 
	begin
	spawnscript \{0xf5557981}
	Wait \{0.4
		Seconds}
	spawnscript \{0xf8190d40}
	spawnscript \{0xb427bd63}
	spawnscript \{0xa692128d}
	spawnscript \{0xf1ce249c}
	spawnscript \{0x28d7489d}
	spawnscript \{0x52cf76f7}
	spawnscript \{0x3dcfad38}
	repeat 1
endscript

script 0xf5557981 
	DestroyScreenElement \{id = 0x272c4eb9}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x272c4eb9
		texture = ph_radialglow_01
		alpha = 0.0
		Scale = (4.0, 4.0)
		just = [
			center
			center
		]
		Pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0x272c4eb9 :obj_spawnscript \{0x65a16cca}
endscript

script 0x65a16cca 
	begin
	0x272c4eb9 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x272c4eb9 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	0x272c4eb9 :se_waitprops
	0x272c4eb9 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0x272c4eb9 :se_waitprops
	repeat 2
	Wait \{0.05
		Seconds}
	begin
	0x272c4eb9 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x272c4eb9 :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0x272c4eb9 :se_waitprops
	0x272c4eb9 :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0x6c62086c 
	DestroyScreenElement \{id = 0x0e2022c8}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x0e2022c8
		alpha = 0.95
		Scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (240.0, 450.0)
		rot_angle = 240
		material = 0x5d6f67fb
		blend = add
		use_animated_uvs = true
		frame_length = 0.067
		num_uv_frames = (4.0, 1.0)
		rgba = [
			255
			255
			255
			255
		]
		z_priority = 110}
	Wait \{0.4
		Second}
	DestroyScreenElement \{id = 0x0e2022c8}
endscript

script 0x52cf76f7 
	DestroyScreenElement \{id = 0xb63bd5d3}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xb63bd5d3
		texture = 0xf86604e5
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xb63bd5d3 :obj_spawnscript \{0x5a927efb}
endscript

script 0x5a927efb 
	0xb63bd5d3 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xb63bd5d3 :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0xb63bd5d3 :se_waitprops
	0xb63bd5d3 :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0xf8190d40 
	Destroy2DParticleSystem \{id = 0xd0c9cce9}
	Create2DParticleSystem \{id = 0xd0c9cce9
		Pos = (465.0, 320.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		Emit_Rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	Wait \{0.4
		Second}
	Destroy2DParticleSystem \{id = 0xd0c9cce9
		kill_when_empty}
endscript

script 0xf1ce249c 
	DestroyScreenElement \{id = 0x23b713a4}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x23b713a4
		texture = 0xa51a5a40
		alpha = 0.0
		Scale = (4.0, 4.0)
		just = [
			center
			center
		]
		Pos = (340.0, 420.0)
		rot_angle = 2
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x23b713a4 :obj_spawnscript \{0x519c7a93}
endscript

script 0x519c7a93 
	0x23b713a4 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0}
	0x23b713a4 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.05}
	0x23b713a4 :se_waitprops
	Wait \{0.1
		Seconds}
	0x23b713a4 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.3}
endscript

script 0xb427bd63 
	DestroyScreenElement \{id = 0x36bcef7f}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x36bcef7f
		texture = ph_multiconfetti_02
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x36bcef7f :obj_spawnscript \{0x708d435e}
endscript

script 0x708d435e 
	0x36bcef7f :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x36bcef7f :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0x36bcef7f :se_waitprops
	0x36bcef7f :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0x36bcef7f :se_waitprops
	0x36bcef7f :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0x36bcef7f :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	0x36bcef7f :se_waitprops
	0x36bcef7f :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0xa692128d 
	DestroyScreenElement \{id = 0x24094091}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x24094091
		texture = 0xea99e289
		alpha = 0.0
		Scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x24094091 :obj_spawnscript \{0x49007f9b}
endscript

script 0x49007f9b 
	0x24094091 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0x24094091 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0x24094091 :se_waitprops
	0x24094091 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0x3dcfad38 
	DestroyScreenElement \{id = 0x151f6c91}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x151f6c91
		texture = 0x5d3f0efd
		alpha = 0.0
		Scale = (10.0, 10.0)
		just = [
			center
			center
		]
		Pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x151f6c91 :obj_spawnscript \{0x22e74801}
endscript

script 0x22e74801 
	0x151f6c91 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0x151f6c91 :se_setprops \{Scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.05}
	0x151f6c91 :se_waitprops
	0x151f6c91 :se_setprops \{Scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0x28d7489d 
	Destroy2DParticleSystem \{id = 0x00078934}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = 0x00078934
		Pos = (465.0, 320.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		Emit_Rate = 0.004
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 35
		friction = (0.0, 80.0)
		time = 0.4}
	Wait \{0.3
		Seconds}
	Destroy2DParticleSystem \{id = 0x00078934
		kill_when_empty}
endscript

script 0x475d45c2 
	begin
	spawnscript \{0x82524917}
	Wait \{0.4
		Seconds}
	spawnscript \{0x8f1e3dd6}
	spawnscript \{0xc3208df5}
	spawnscript \{0xd195221b}
	spawnscript \{0x86c9140a}
	spawnscript \{0x5fd0780b}
	spawnscript \{0x25c84661}
	spawnscript \{0x4ac89dae}
	repeat 1
endscript

script 0x82524917 
	DestroyScreenElement \{id = 0x502b7e2f}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x502b7e2f
		texture = ph_radialglow_01
		alpha = 0.0
		Scale = (4.0, 4.0)
		just = [
			center
			center
		]
		Pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0x502b7e2f :obj_spawnscript \{0xaefdbf6f}
endscript

script 0xaefdbf6f 
	begin
	0x502b7e2f :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x502b7e2f :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	0x502b7e2f :se_waitprops
	0x502b7e2f :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0x502b7e2f :se_waitprops
	repeat 2
	Wait \{0.05
		Seconds}
	begin
	0x502b7e2f :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x502b7e2f :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0x502b7e2f :se_waitprops
	0x502b7e2f :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0x1b6538fa 
	DestroyScreenElement \{id = 0x7927125e}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x7927125e
		alpha = 0.95
		Scale = (1.0, 1.2)
		just = [
			center
			center
		]
		Pos = (1050.0, 430.0)
		rot_angle = -240
		material = 0x5d6f67fb
		blend = add
		use_animated_uvs = true
		frame_length = 0.067
		num_uv_frames = (4.0, 1.0)
		rgba = [
			255
			255
			255
			255
		]
		z_priority = 110}
	Wait \{0.4
		Second}
	DestroyScreenElement \{id = 0x7927125e}
endscript

script 0x25c84661 
	DestroyScreenElement \{id = 0xc13ce545}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xc13ce545
		texture = 0xf86604e5
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xc13ce545 :obj_spawnscript \{0x91cead5e}
endscript

script 0x91cead5e 
	0xc13ce545 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xc13ce545 :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0xc13ce545 :se_waitprops
	0xc13ce545 :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x8f1e3dd6 
	Destroy2DParticleSystem \{id = 0xa7cefc7f}
	Create2DParticleSystem \{id = 0xa7cefc7f
		Pos = (800.0, 280.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		Emit_Rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	Wait \{0.4
		Second}
	Destroy2DParticleSystem \{id = 0xa7cefc7f
		kill_when_empty}
endscript

script 0x86c9140a 
	DestroyScreenElement \{id = 0x54b02332}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x54b02332
		texture = 0xa51a5a40
		alpha = 0.0
		Scale = (4.0, 4.0)
		just = [
			center
			center
		]
		Pos = (650.0, 420.0)
		rot_angle = 2
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x54b02332 :obj_spawnscript \{0x9ac0a936}
endscript

script 0x9ac0a936 
	0x54b02332 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0}
	0x54b02332 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.05}
	0x54b02332 :se_waitprops
	Wait \{0.1
		Seconds}
	0x54b02332 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.3}
endscript

script 0xc3208df5 
	DestroyScreenElement \{id = 0x41bbdfe9}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x41bbdfe9
		texture = ph_multiconfetti_02
		alpha = 0.0
		Scale = (1.5, 1.5)
		just = [
			center
			center
		]
		Pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x41bbdfe9 :obj_spawnscript \{0xbbd190fb}
endscript

script 0xbbd190fb 
	0x41bbdfe9 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x41bbdfe9 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0x41bbdfe9 :se_waitprops
	0x41bbdfe9 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0x41bbdfe9 :se_waitprops
	0x41bbdfe9 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0x41bbdfe9 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	0x41bbdfe9 :se_waitprops
	0x41bbdfe9 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0xd195221b 
	DestroyScreenElement \{id = 0x530e7007}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x530e7007
		texture = 0xea99e289
		alpha = 0.0
		Scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x530e7007 :obj_spawnscript \{0x825cac3e}
endscript

script 0x825cac3e 
	0x530e7007 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0x530e7007 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0x530e7007 :se_waitprops
	0x530e7007 :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0x4ac89dae 
	DestroyScreenElement \{id = 0x62185c07}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x62185c07
		texture = 0x5d3f0efd
		alpha = 0.0
		Scale = (10.0, 10.0)
		just = [
			center
			center
		]
		Pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x62185c07 :obj_spawnscript \{0xe9bb9ba4}
endscript

script 0xe9bb9ba4 
	0x62185c07 :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0x62185c07 :se_setprops \{Scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.05}
	0x62185c07 :se_waitprops
	0x62185c07 :se_setprops \{Scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0x5fd0780b 
	Destroy2DParticleSystem \{id = 0x7700b9a2}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = 0x7700b9a2
		Pos = (800.0, 280.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		Emit_Rate = 0.004
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 35
		friction = (0.0, 80.0)
		time = 0.4}
	Wait \{0.3
		Seconds}
	Destroy2DParticleSystem \{id = 0x7700b9a2
		kill_when_empty}
endscript

script 0x76b55f5f 
	begin
	spawnscript \{0x1b5b18ad}
	Wait \{0.4
		Seconds}
	spawnscript \{0x16176c6c}
	spawnscript \{0x5a29dc4f}
	spawnscript \{0x489c73a1}
	spawnscript \{0xc6d929b1}
	spawnscript \{0xbcc117db}
	spawnscript \{0xd3c1cc14}
	repeat 1
endscript

script 0x1b5b18ad 
	DestroyScreenElement \{id = 0xc9222f95}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xc9222f95
		texture = ph_radialglow_01
		alpha = 0.0
		Scale = (4.0, 4.0)
		just = [
			center
			center
		]
		Pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0xc9222f95 :obj_spawnscript \{0x2869cdc1}
endscript

script 0x2869cdc1 
	begin
	0xc9222f95 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xc9222f95 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	0xc9222f95 :se_waitprops
	0xc9222f95 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0xc9222f95 :se_waitprops
	repeat 2
	Wait \{0.05
		Seconds}
	begin
	0xc9222f95 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xc9222f95 :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0xc9222f95 :se_waitprops
	0xc9222f95 :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0xbcc117db 
	DestroyScreenElement \{id = 0x5835b4ff}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x5835b4ff
		texture = 0xf86604e5
		alpha = 0.0
		Scale = (3.0, 3.0)
		just = [
			center
			center
		]
		Pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x5835b4ff :obj_spawnscript \{0x175adff0}
endscript

script 0x175adff0 
	0x5835b4ff :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x5835b4ff :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0x5835b4ff :se_waitprops
	0x5835b4ff :se_setprops \{Scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x16176c6c 
	Destroy2DParticleSystem \{id = 0x3ec7adc5}
	Create2DParticleSystem \{id = 0x3ec7adc5
		Pos = (370.0, 270.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		Emit_Rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	Wait \{0.4
		Second}
	Destroy2DParticleSystem \{id = 0x3ec7adc5
		kill_when_empty}
endscript

script 0x5a29dc4f 
	DestroyScreenElement \{id = 0xd8b28e53}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xd8b28e53
		texture = ph_multiconfetti_02
		alpha = 0.0
		Scale = (1.5, 1.5)
		just = [
			center
			center
		]
		Pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xd8b28e53 :obj_spawnscript \{0x3d45e255}
endscript

script 0x3d45e255 
	0xd8b28e53 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0xd8b28e53 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0xd8b28e53 :se_waitprops
	0xd8b28e53 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0xd8b28e53 :se_waitprops
	0xd8b28e53 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0xd8b28e53 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	0xd8b28e53 :se_waitprops
	0xd8b28e53 :se_setprops \{Scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0x489c73a1 
	DestroyScreenElement \{id = 0xca0721bd}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xca0721bd
		texture = 0xea99e289
		alpha = 0.0
		Scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xca0721bd :obj_spawnscript \{0x04c8de90}
endscript

script 0x04c8de90 
	0xca0721bd :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0xca0721bd :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0xca0721bd :se_waitprops
	0xca0721bd :se_setprops \{Scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0xd3c1cc14 
	DestroyScreenElement \{id = 0xfb110dbd}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xfb110dbd
		texture = 0x5d3f0efd
		alpha = 0.0
		Scale = (10.0, 10.0)
		just = [
			center
			center
		]
		Pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xfb110dbd :obj_spawnscript \{0x6f2fe90a}
endscript

script 0x6f2fe90a 
	0xfb110dbd :se_setprops \{Scale = (0.1, 0.1)
		alpha = 0}
	0xfb110dbd :se_setprops \{Scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.05}
	0xfb110dbd :se_waitprops
	0xfb110dbd :se_setprops \{Scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0xc6d929b1 
	Destroy2DParticleSystem \{id = 0xee09e818}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = 0xee09e818
		Pos = (370.0, 270.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		Emit_Rate = 0.004
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 35
		friction = (0.0, 80.0)
		time = 0.4}
	Wait \{0.3
		Seconds}
	Destroy2DParticleSystem \{id = 0xee09e818
		kill_when_empty}
endscript

script 0x8e651f5e 
	spawnscript \{0xdcffc2b5}
	Wait \{0.1
		Seconds}
	spawnscript \{0xa6450ba6}
	spawnscript \{0x96cbfdf1}
endscript

script 0xdcffc2b5 
	DestroyScreenElement \{id = 0x62c835b5}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x62c835b5
		texture = ph_radialglow_01
		alpha = 0.0
		Scale = (12.0, 6.0)
		just = [
			center
			center
		]
		Pos = (640.0, 310.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x62c835b5 :obj_spawnscript \{0x6bdafc4a}
endscript

script 0x6bdafc4a 
	begin
	0x62c835b5 :se_setprops \{Scale = (3.0, 1.0)
		alpha = 0}
	0x62c835b5 :se_setprops \{Scale = (10.0, 7.0)
		alpha = 0.6
		time = 0.05}
	0x62c835b5 :se_waitprops
	0x62c835b5 :se_setprops \{Scale = (10.0, 7.0)
		alpha = 0.0
		time = 0.01}
	0x62c835b5 :se_waitprops
	repeat 1
	Wait \{0.05
		Seconds}
	begin
	0x62c835b5 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0}
	0x62c835b5 :se_setprops \{Scale = (10.0, 7.0)
		alpha = 0.6
		time = 0.05}
	0x62c835b5 :se_waitprops
	0x62c835b5 :se_setprops \{Scale = (10.0, 7.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0xa6450ba6 
	DestroyScreenElement \{id = 0xa6fb3c51}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xa6fb3c51
		texture = 0x5d3f0efd
		alpha = 0.9
		Scale = (10.0, 10.0)
		just = [
			center
			center
		]
		Pos = (640.0, 310.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xa6fb3c51 :obj_spawnscript \{0x5ac65a2e}
endscript

script 0x5ac65a2e 
	0xa6fb3c51 :se_setprops \{Scale = (7.0, 4.0)
		alpha = 0}
	0xa6fb3c51 :se_setprops \{Scale = (15.0, 10.0)
		alpha = 0.6
		time = 0.05}
	0xa6fb3c51 :se_waitprops
	0xa6fb3c51 :se_setprops \{Scale = (15.0, 10.0)
		alpha = 0.0
		time = 0.1}
endscript

script 0x96cbfdf1 
	DestroyScreenElement \{id = 0xcee362be}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0xcee362be
		texture = 0xb506f863
		alpha = 0.0
		Scale = (10.0, 12.5)
		just = [
			center
			center
		]
		Pos = (640.0, 330.0)
		rot_angle = 0
		z_priority = 150
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xcee362be :obj_spawnscript \{0x471500f7}
endscript

script 0x471500f7 
	0xcee362be :se_setprops \{alpha = 0}
	0xcee362be :se_setprops \{alpha = 0.2
		time = 0.1}
	0xcee362be :se_waitprops
	0xcee362be :se_setprops \{alpha = 0.0
		time = 0.1}
endscript

script 0xe7da5108 
	printf \{channel = clayton
		qs(0x3a63c0ec)}
	DestroyScreenElement \{id = 0xcee362be}
	DestroyScreenElement \{id = 0x5746ba36}
	DestroyScreenElement \{id = 0xce4feb8c}
	DestroyScreenElement \{id = 0xb948db1a}
	DestroyScreenElement \{id = 0x272c4eb9}
	DestroyScreenElement \{id = 0x502b7e2f}
	DestroyScreenElement \{id = 0xc9222f95}
	DestroyScreenElement \{id = 0x62c835b5}
	DestroyScreenElement \{id = 0x1f901124}
	DestroyScreenElement \{id = 0x53dde72b}
	DestroyScreenElement \{id = 0xcad4b691}
	DestroyScreenElement \{id = 0xbdd38607}
	DestroyScreenElement \{id = 0x23b713a4}
	DestroyScreenElement \{id = 0x54b02332}
	DestroyScreenElement \{id = 0x5463b41e}
	DestroyScreenElement \{id = 0xcd6ae5a4}
	DestroyScreenElement \{id = 0xba6dd532}
	DestroyScreenElement \{id = 0x24094091}
	DestroyScreenElement \{id = 0x530e7007}
	DestroyScreenElement \{id = 0xca0721bd}
	DestroyScreenElement \{id = 0x46d61bf0}
	DestroyScreenElement \{id = 0xdfdf4a4a}
	DestroyScreenElement \{id = 0xa8d87adc}
	DestroyScreenElement \{id = 0x36bcef7f}
	DestroyScreenElement \{id = 0x41bbdfe9}
	DestroyScreenElement \{id = 0xd8b28e53}
	DestroyScreenElement \{id = 0xc651215c}
	DestroyScreenElement \{id = 0x5f5870e6}
	DestroyScreenElement \{id = 0x285f4070}
	DestroyScreenElement \{id = 0xb63bd5d3}
	DestroyScreenElement \{id = 0xc13ce545}
	DestroyScreenElement \{id = 0x5835b4ff}
	DestroyScreenElement \{id = flare_01}
	DestroyScreenElement \{id = 0xfc7cc9a4}
	DestroyScreenElement \{id = 0x8b7bf932}
	DestroyScreenElement \{id = 0x151f6c91}
	DestroyScreenElement \{id = 0x62185c07}
	DestroyScreenElement \{id = 0xfb110dbd}
	DestroyScreenElement \{id = 0xa6fb3c51}
endscript
