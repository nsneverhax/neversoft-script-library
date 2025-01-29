
script YouRock_Explosions_ComboCombo 
	wait \{0.75
		seconds}
	spawnscriptlater \{YouRock_Lightning_01}
	spawnscriptlater \{YouRock_Explosions_01_Combo}
	wait \{0.4
		seconds}
	spawnscriptlater \{YouRock_Explosions_02_Combo}
	spawnscriptlater \{YouRock_Lightning_02}
	wait \{0.2
		seconds}
	spawnscriptlater \{YouRock_Explosions_03_Combo}
	wait \{0.1
		seconds}
	spawnscriptlater \{YouRock_Explosions_04_Combo}
	spawnscriptlater \{YouRock_Lightning_04}
	spawnscriptlater \{YouRock_Explosions_06_Combo}
	wait \{0.2
		seconds}
	spawnscriptlater \{YouRock_Explosions_05_Combo}
	spawnscriptlater \{YouRock_Lightning_05}
	spawnscriptlater \{YouRock_Explosions_02_Combo}
	wait \{0.2
		seconds}
	spawnscriptlater \{YouRock_Explosions_01_Combo}
	spawnscriptlater \{YouRock_Explosions_03_Combo}
	spawnscriptlater \{YouRock_Lightning_03}
	wait \{0.4
		seconds}
	spawnscriptlater \{YouRock_Explosions_02_BigCenter_Combo}
endscript

script YouRock_Explosions_AfterSparks_01 
	Destroy2DParticleSystem \{id = AfterSparks_01}
	wait \{1
		frame}
	Create2DParticleSystem \{id = AfterSparks_01
		Pos = (640.0, 300.0)
		z_priority = 100.0
		material = Mat_YouRock_Sparks
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
	wait \{5
		seconds}
	Destroy2DParticleSystem \{id = AfterSparks_01
		kill_when_empty}
endscript

script YouRock_Explosions_01_Combo 
	begin
	SpawnScript \{YouRock_Explosions_Glow_01}
	wait \{0.4
		seconds}
	SpawnScript \{YouRock_Explosions_Smoke_01}
	SpawnScript \{YouRock_Explosions_Splat_01_01}
	SpawnScript \{YouRock_Explosions_Splat_02_01}
	SpawnScript \{YouRock_Explosions_ASec_01}
	SpawnScript \{YouRock_Explosions_stars_01}
	SpawnScript \{YouRock_Explosions_RadialSparks_01}
	SpawnScript \{YouRock_Explosions_Flare_01}
	SpawnScript \{YouRock_Explosions_CartoonFlare_01}
	wait \{0.05
		seconds}
	repeat 1
endscript

script YouRock_Lightning_01 
	DestroyScreenElement \{id = Lightning01}
	wait \{0.03
		seconds}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Lightning01
		alpha = 0.95
		scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (105.0, 150.0)
		rot_angle = -35
		material = sys_GH5_1_Big_Bolt01_sys_GH5_1_Big_Bolt01
		z_priority = 110}
	wait \{0.4
		second}
	DestroyScreenElement \{id = Lightning01}
endscript

script YouRock_Explosions_Glow_01 
	DestroyScreenElement \{id = Glow_01}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Glow_01
		texture = PH_RadialGlow_01
		alpha = 0.0
		scale = (2.0, 2.0)
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
	Glow_01 :Obj_SpawnScript \{YouRock_Explosions_Glow_01_Anim}
endscript

script YouRock_Explosions_Glow_01_Anim 
	if ScreenElementExists \{id = Glow_01}
		begin
		Glow_01 :SE_SetProps \{scale = (0.5, 0.5)
			alpha = 0}
		Glow_01 :SE_SetProps \{scale = (1.0, 1.0)
			alpha = 0.3
			time = 0.1}
		Glow_01 :SE_WaitProps
		Glow_01 :SE_SetProps \{scale = (1.0, 1.0)
			alpha = 0.0
			time = 0.01}
		Glow_01 :SE_WaitProps
		repeat 2
		wait \{0.01
			seconds}
		begin
		Glow_01 :SE_SetProps \{scale = (0.5, 0.5)
			alpha = 0}
		Glow_01 :SE_SetProps \{scale = (5.0, 5.0)
			alpha = 0.5
			time = 0.05}
		Glow_01 :SE_WaitProps
		Glow_01 :SE_SetProps \{scale = (5.0, 5.0)
			alpha = 0.0
			time = 0.5}
		repeat 1
	endif
endscript

script YouRock_Explosions_Smoke_01 
	Destroy2DParticleSystem \{id = Smoke_01}
	Create2DParticleSystem \{id = Smoke_01
		Pos = (260.0, 320.0)
		z_priority = 98.0
		material = Mat_HOG_Smoke
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
	wait \{0.4
		second}
	Destroy2DParticleSystem \{id = Smoke_01
		kill_when_empty}
endscript

script YouRock_Explosions_RadialSparks_01 
	DestroyScreenElement \{id = RadialSparks_01}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = RadialSparks_01
		texture = PH_ExplosionTex_RadialSparks_01
		alpha = 0.0
		scale = (1.5, 1.5)
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
	RadialSparks_01 :Obj_SpawnScript \{YouRock_Explosions_RadialSparks_01_Anim}
endscript

script YouRock_Explosions_RadialSparks_01_Anim 
	RadialSparks_01 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	RadialSparks_01 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	RadialSparks_01 :SE_WaitProps
	RadialSparks_01 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_ASec_01 
	DestroyScreenElement \{id = ASec_01}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = ASec_01
		texture = PH_ExplosionTex_ASec_02
		alpha = 0.0
		scale = (1.5, 1.5)
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
	ASec_01 :Obj_SpawnScript \{YouRock_Explosions_ASec_01_Anim}
endscript

script YouRock_Explosions_ASec_01_Anim 
	ASec_01 :SE_SetProps \{scale = (1.5, 1.5)
		alpha = 0}
	ASec_01 :SE_SetProps \{scale = (1.5, 1.5)
		alpha = 0.5
		time = 0.05}
	ASec_01 :SE_WaitProps
	wait \{0.1
		seconds}
	ASec_01 :SE_SetProps \{scale = (1.5, 1.5)
		alpha = 0.0
		time = 0.3}
endscript

script YouRock_Explosions_Splat_01_01 
	DestroyScreenElement \{id = Splat_01_01}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_01_01
		texture = PH_MultiConfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
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
	Splat_01_01 :Obj_SpawnScript \{YouRock_Explosions_Splat_01_01_Anim}
endscript

script YouRock_Explosions_Splat_01_01_Anim 
	Splat_01_01 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Splat_01_01 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	Splat_01_01 :SE_WaitProps
	Splat_01_01 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	Splat_01_01 :SE_WaitProps
	Splat_01_01 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	Splat_01_01 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	Splat_01_01 :SE_WaitProps
	Splat_01_01 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script YouRock_Explosions_Splat_02_01 
	DestroyScreenElement \{id = Splat_02_01}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_02_01
		texture = PH_ExplosionTex_Splat_02
		alpha = 0.0
		scale = (0.5, 0.5)
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
	Splat_02_01 :Obj_SpawnScript \{YouRock_Explosions_Splat_02_01_Anim}
endscript

script YouRock_Explosions_Splat_02_01_Anim 
	Splat_02_01 :SE_SetProps \{scale = (0.3, 0.3)
		alpha = 0}
	Splat_02_01 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.05}
	Splat_02_01 :SE_WaitProps
	Splat_02_01 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Flare_01 
	DestroyScreenElement \{id = Flare_01}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Flare_01
		texture = PH_Flare03
		alpha = 0.0
		scale = (5.0, 5.0)
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
	Flare_01 :Obj_SpawnScript \{YouRock_Explosions_Flare_01_Anim}
endscript

script YouRock_Explosions_Flare_01_Anim 
	Flare_01 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Flare_01 :SE_SetProps \{scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.1}
	Flare_01 :SE_WaitProps
	Flare_01 :SE_SetProps \{scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_CartoonFlare_01 
	DestroyScreenElement \{id = CartoonFlare_01}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = CartoonFlare_01
		texture = JOW_ButtonFlare01
		alpha = 0.0
		scale = (5.0, 5.0)
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
	CartoonFlare_01 :Obj_SpawnScript \{YouRock_Explosions_CartoonFlare_01_Anim}
endscript

script YouRock_Explosions_CartoonFlare_01_Anim 
	CartoonFlare_01 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	CartoonFlare_01 :SE_SetProps \{scale = (3.0, 3.0)
		alpha = 1
		time = 0.05}
	CartoonFlare_01 :SE_WaitProps
	CartoonFlare_01 :SE_SetProps \{scale = (3.0, 3.0)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_stars_01 
	Destroy2DParticleSystem \{id = stars_01}
	wait \{1
		frame}
	Create2DParticleSystem \{id = stars_01
		Pos = (260.0, 320.0)
		z_priority = 100.0
		material = Mat_YouRock_Sparks
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
	wait \{0.3
		seconds}
	Destroy2DParticleSystem \{id = stars_01
		kill_when_empty}
endscript

script YouRock_Explosions_02_Combo 
	begin
	SpawnScript \{YouRock_Explosions_Glow_02}
	wait \{0.4
		seconds}
	SpawnScript \{YouRock_Explosions_Smoke_02}
	SpawnScript \{YouRock_Explosions_Splat_01_02}
	SpawnScript \{YouRock_Explosions_Splat_02_02}
	SpawnScript \{YouRock_Explosions_ASec_02}
	SpawnScript \{YouRock_Explosions_stars_02}
	SpawnScript \{YouRock_Explosions_Flare_02}
	wait \{0.5
		seconds}
	repeat 1
endscript

script YouRock_Lightning_02 
	DestroyScreenElement \{id = Lightning02}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Lightning02
		alpha = 0.95
		scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (1075.0, 160.0)
		rot_angle = 35
		material = sys_GH5_1_Big_Bolt01_sys_GH5_1_Big_Bolt01
		z_priority = 110}
	wait \{0.4
		second}
	DestroyScreenElement \{id = Lightning02}
endscript

script YouRock_Explosions_Smoke_02 
	Destroy2DParticleSystem \{id = Smoke_02}
	Create2DParticleSystem \{id = Smoke_02
		Pos = (950.0, 340.0)
		z_priority = 98.0
		material = Mat_HOG_Smoke
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
	wait \{0.4
		second}
	Destroy2DParticleSystem \{id = Smoke_02
		kill_when_empty}
endscript

script YouRock_Explosions_Glow_02 
	DestroyScreenElement \{id = Glow_02}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Glow_02
		texture = PH_RadialGlow_01
		alpha = 0.0
		scale = (2.0, 2.0)
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
	Glow_02 :Obj_SpawnScript \{YouRock_Explosions_Glow_02_Anim}
endscript

script YouRock_Explosions_Glow_02_Anim 
	begin
	Glow_02 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_02 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.4
		time = 0.1}
	Glow_02 :SE_WaitProps
	Glow_02 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	Glow_02 :SE_WaitProps
	repeat 2
	wait \{0.05
		seconds}
	begin
	Glow_02 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_02 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	Glow_02 :SE_WaitProps
	Glow_02 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script YouRock_Explosions_RadialSparks_02 
	DestroyScreenElement \{id = RadialSparks_02}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = RadialSparks_02
		texture = PH_ExplosionTex_RadialSparks_01
		alpha = 0.0
		scale = (1.5, 1.5)
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
	RadialSparks_02 :Obj_SpawnScript \{YouRock_Explosions_RadialSparks_02_Anim}
endscript

script YouRock_Explosions_RadialSparks_02_Anim 
	RadialSparks_02 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	RadialSparks_02 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	RadialSparks_02 :SE_WaitProps
	RadialSparks_02 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_ASec_02 
	DestroyScreenElement \{id = ASec_02}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = ASec_02
		texture = PH_ExplosionTex_ASec_02
		alpha = 0.0
		scale = (1.5, 1.5)
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
	ASec_02 :Obj_SpawnScript \{YouRock_Explosions_ASec_02_Anim}
endscript

script YouRock_Explosions_ASec_02_Anim 
	ASec_02 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0}
	ASec_02 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.5
		rot_angle = 0
		time = 0.05}
	ASec_02 :SE_WaitProps
	wait \{0.1
		seconds}
	ASec_02 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.0
		rot_angle = 0
		time = 0.8}
endscript

script YouRock_Explosions_Splat_01_02 
	DestroyScreenElement \{id = Splat_01_02}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_01_02
		texture = PH_MultiConfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
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
	Splat_01_02 :Obj_SpawnScript \{YouRock_Explosions_Splat_01_02_Anim}
endscript

script YouRock_Explosions_Splat_01_02_Anim 
	Splat_01_02 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Splat_01_02 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	Splat_01_02 :SE_WaitProps
	Splat_01_02 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	Splat_01_02 :SE_WaitProps
	Splat_01_02 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	Splat_01_02 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	Splat_01_02 :SE_WaitProps
	Splat_01_02 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script YouRock_Explosions_Splat_02_02 
	DestroyScreenElement \{id = Splat_02_02}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_02_02
		texture = PH_ExplosionTex_Splat_02
		alpha = 0.0
		scale = (0.5, 0.5)
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
	Splat_02_02 :Obj_SpawnScript \{YouRock_Explosions_Splat_02_02_Anim}
endscript

script YouRock_Explosions_Splat_02_02_Anim 
	Splat_02_02 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Splat_02_02 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	Splat_02_02 :SE_WaitProps
	Splat_02_02 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Flare_02 
	DestroyScreenElement \{id = Flare_02}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Flare_02
		texture = PH_Flare03
		alpha = 0.0
		scale = (5.0, 5.0)
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
	Flare_02 :Obj_SpawnScript \{YouRock_Explosions_Flare_02_Anim}
endscript

script YouRock_Explosions_Flare_02_Anim 
	Flare_02 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Flare_02 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.6
		time = 0.1}
	Flare_02 :SE_WaitProps
	Flare_02 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Smoke_02_01 
	DestroyScreenElement \{id = Smoke_02_01}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Smoke_02_01
		texture = PH_Smoke_SinglePuff_Blend_02
		alpha = 0.0
		scale = (1.3, 1.3)
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
	Smoke_02_01 :Obj_SpawnScript \{YouRock_Explosions_Smoke_02_01_Anim}
endscript

script YouRock_Explosions_Smoke_02_01_Anim 
	Smoke_02_01 :SE_SetProps \{scale = (1.0, 1.0)
		alpha = 0}
	Smoke_02_01 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.3
		rot_angle = 10
		time = 0.1}
	Smoke_02_01 :SE_WaitProps
	Smoke_02_01 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.0
		rot_angle = 10
		time = 1}
endscript

script YouRock_Explosions_stars_02 
	Destroy2DParticleSystem \{id = stars_02}
	wait \{1
		frame}
	Create2DParticleSystem \{id = stars_02
		Pos = (950.0, 340.0)
		z_priority = 100.0
		material = Mat_YouRock_Sparks
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
	wait \{0.3
		seconds}
	Destroy2DParticleSystem \{id = stars_02
		kill_when_empty}
endscript

script YouRock_Explosions_03_Combo 
	begin
	SpawnScript \{YouRock_Explosions_Glow_03}
	wait \{0.4
		seconds}
	SpawnScript \{YouRock_Explosions_Smoke_03}
	SpawnScript \{YouRock_Explosions_Splat_01_03}
	SpawnScript \{YouRock_Explosions_Splat_02_03}
	SpawnScript \{YouRock_Explosions_ASec_03}
	SpawnScript \{YouRock_Explosions_stars_03}
	SpawnScript \{YouRock_Explosions_RadialSparks_03}
	SpawnScript \{YouRock_Explosions_Flare_03}
	repeat 1
endscript

script YouRock_Explosions_Glow_03 
	DestroyScreenElement \{id = Glow_03}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Glow_03
		texture = PH_RadialGlow_01
		alpha = 0.0
		scale = (2.0, 2.0)
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
	Glow_03 :Obj_SpawnScript \{YouRock_Explosions_Glow_03_Anim}
endscript

script YouRock_Explosions_Glow_03_Anim 
	begin
	Glow_03 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_03 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	Glow_03 :SE_WaitProps
	Glow_03 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	Glow_03 :SE_WaitProps
	repeat 2
	wait \{0.05
		seconds}
	begin
	Glow_03 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_03 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	Glow_03 :SE_WaitProps
	Glow_03 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script YouRock_Lightning_03 
	DestroyScreenElement \{id = Lightning03}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Lightning03
		alpha = 0.95
		scale = (0.8, 0.8)
		just = [
			center
			center
		]
		Pos = (550.0, 110.0)
		rot_angle = -30
		material = sys_GH5_1_Big_Bolt01_sys_GH5_1_Big_Bolt01
		z_priority = 110}
	wait \{0.4
		second}
	DestroyScreenElement \{id = Lightning03}
endscript

script YouRock_Explosions_RadialSparks_03 
	DestroyScreenElement \{id = RadialSparks_03}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = RadialSparks_03
		texture = PH_ExplosionTex_RadialSparks_01
		alpha = 0.0
		scale = (1.5, 1.5)
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
	RadialSparks_03 :Obj_SpawnScript \{YouRock_Explosions_RadialSparks_03_Anim}
endscript

script YouRock_Explosions_RadialSparks_03_Anim 
	RadialSparks_03 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	RadialSparks_03 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	RadialSparks_03 :SE_WaitProps
	RadialSparks_03 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Smoke_03 
	Destroy2DParticleSystem \{id = Smoke_03}
	Create2DParticleSystem \{id = Smoke_03
		Pos = (620.0, 260.0)
		z_priority = 98.0
		material = Mat_HOG_Smoke
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
	wait \{0.4
		second}
	Destroy2DParticleSystem \{id = Smoke_03
		kill_when_empty}
endscript

script YouRock_Explosions_ASec_03 
	DestroyScreenElement \{id = ASec_03}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = ASec_03
		texture = PH_ExplosionTex_ASec_02
		alpha = 0.0
		scale = (1.5, 1.5)
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
	ASec_03 :Obj_SpawnScript \{YouRock_Explosions_ASec_03_Anim}
endscript

script YouRock_Explosions_ASec_03_Anim 
	ASec_03 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0
		rot_angle = 100}
	ASec_03 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.05}
	ASec_03 :SE_WaitProps
	wait \{0.1
		seconds}
	ASec_03 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.3}
endscript

script YouRock_Explosions_Splat_01_03 
	DestroyScreenElement \{id = Splat_01_03}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_01_03
		texture = PH_MultiConfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
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
	Splat_01_03 :Obj_SpawnScript \{YouRock_Explosions_Splat_01_03_Anim}
endscript

script YouRock_Explosions_Splat_01_03_Anim 
	Splat_01_03 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Splat_01_03 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	Splat_01_03 :SE_WaitProps
	Splat_01_03 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	Splat_01_03 :SE_WaitProps
	Splat_01_03 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	Splat_01_03 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	Splat_01_03 :SE_WaitProps
	Splat_01_03 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script YouRock_Explosions_Splat_02_03 
	DestroyScreenElement \{id = Splat_02_03}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_02_03
		texture = PH_ExplosionTex_Splat_02
		alpha = 0.0
		scale = (0.5, 0.5)
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
	Splat_02_03 :Obj_SpawnScript \{YouRock_Explosions_Splat_02_03_Anim}
endscript

script YouRock_Explosions_Splat_02_03_Anim 
	Splat_02_03 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Splat_02_03 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	Splat_02_03 :SE_WaitProps
	Splat_02_03 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Flare_03 
	DestroyScreenElement \{id = Flare_03}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Flare_03
		texture = PH_Flare03
		alpha = 0.0
		scale = (5.0, 5.0)
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
	Flare_03 :Obj_SpawnScript \{YouRock_Explosions_Flare_03_Anim}
endscript

script YouRock_Explosions_Flare_03_Anim 
	Flare_03 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Flare_03 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.6
		time = 0.1}
	Flare_03 :SE_WaitProps
	Flare_03 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_stars_03 
	Destroy2DParticleSystem \{id = stars_03}
	wait \{1
		frame}
	Create2DParticleSystem \{id = stars_03
		Pos = (620.0, 260.0)
		z_priority = 100.0
		material = Mat_YouRock_Sparks
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
	wait \{0.3
		seconds}
	Destroy2DParticleSystem \{id = stars_03
		kill_when_empty}
endscript

script YouRock_Explosions_04_Combo 
	begin
	SpawnScript \{YouRock_Explosions_Glow_04}
	wait \{0.4
		seconds}
	SpawnScript \{YouRock_Explosions_Smoke_04}
	SpawnScript \{YouRock_Explosions_Splat_01_04}
	SpawnScript \{YouRock_Explosions_Splat_02_04}
	SpawnScript \{YouRock_Explosions_ASec_04}
	SpawnScript \{YouRock_Explosions_stars_04}
	SpawnScript \{YouRock_Explosions_RadialSparks_04}
	SpawnScript \{YouRock_Explosions_Flare_04}
	repeat 1
endscript

script YouRock_Explosions_Glow_04 
	DestroyScreenElement \{id = Glow_04}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Glow_04
		texture = PH_RadialGlow_01
		alpha = 0.0
		scale = (2.0, 2.0)
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
	Glow_04 :Obj_SpawnScript \{YouRock_Explosions_Glow_04_Anim}
endscript

script YouRock_Explosions_Glow_04_Anim 
	begin
	Glow_04 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_04 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	Glow_04 :SE_WaitProps
	Glow_04 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	Glow_04 :SE_WaitProps
	repeat 2
	wait \{0.05
		seconds}
	begin
	Glow_04 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_04 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	Glow_04 :SE_WaitProps
	Glow_04 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script YouRock_Lightning_04 
	DestroyScreenElement \{id = Lightning04}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Lightning04
		alpha = 0.95
		scale = (1.0, 1.0)
		just = [
			center
			center
		]
		Pos = (240.0, 450.0)
		rot_angle = 240
		material = sys_GH5_1_Big_Bolt01_sys_GH5_1_Big_Bolt01
		z_priority = 110}
	wait \{0.4
		second}
	DestroyScreenElement \{id = Lightning04}
endscript

script YouRock_Explosions_RadialSparks_04 
	DestroyScreenElement \{id = RadialSparks_04}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = RadialSparks_04
		texture = PH_ExplosionTex_RadialSparks_01
		alpha = 0.0
		scale = (1.5, 1.5)
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
	RadialSparks_04 :Obj_SpawnScript \{YouRock_Explosions_RadialSparks_04_Anim}
endscript

script YouRock_Explosions_RadialSparks_04_Anim 
	RadialSparks_04 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	RadialSparks_04 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	RadialSparks_04 :SE_WaitProps
	RadialSparks_04 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Smoke_04 
	Destroy2DParticleSystem \{id = Smoke_04}
	Create2DParticleSystem \{id = Smoke_04
		Pos = (465.0, 320.0)
		z_priority = 98.0
		material = Mat_HOG_Smoke
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
	wait \{0.4
		second}
	Destroy2DParticleSystem \{id = Smoke_04
		kill_when_empty}
endscript

script YouRock_Explosions_ASec_04 
	DestroyScreenElement \{id = ASec_04}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = ASec_04
		texture = PH_ExplosionTex_ASec_02
		alpha = 0.0
		scale = (2.0, 2.0)
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
	ASec_04 :Obj_SpawnScript \{YouRock_Explosions_ASec_04_Anim}
endscript

script YouRock_Explosions_ASec_04_Anim 
	ASec_04 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0}
	ASec_04 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.05}
	ASec_04 :SE_WaitProps
	wait \{0.1
		seconds}
	ASec_04 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.3}
endscript

script YouRock_Explosions_Splat_01_04 
	DestroyScreenElement \{id = Splat_01_04}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_01_04
		texture = PH_MultiConfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
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
	Splat_01_04 :Obj_SpawnScript \{YouRock_Explosions_Splat_01_04_Anim}
endscript

script YouRock_Explosions_Splat_01_04_Anim 
	Splat_01_04 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Splat_01_04 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	Splat_01_04 :SE_WaitProps
	Splat_01_04 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	Splat_01_04 :SE_WaitProps
	Splat_01_04 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	Splat_01_04 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	Splat_01_04 :SE_WaitProps
	Splat_01_04 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script YouRock_Explosions_Splat_02_04 
	DestroyScreenElement \{id = Splat_02_04}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_02_04
		texture = PH_ExplosionTex_Splat_02
		alpha = 0.0
		scale = (0.5, 0.5)
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
	Splat_02_04 :Obj_SpawnScript \{YouRock_Explosions_Splat_02_04_Anim}
endscript

script YouRock_Explosions_Splat_02_04_Anim 
	Splat_02_04 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Splat_02_04 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	Splat_02_04 :SE_WaitProps
	Splat_02_04 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Flare_04 
	DestroyScreenElement \{id = Flare_04}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Flare_04
		texture = PH_Flare03
		alpha = 0.0
		scale = (5.0, 5.0)
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
	Flare_04 :Obj_SpawnScript \{YouRock_Explosions_Flare_04_Anim}
endscript

script YouRock_Explosions_Flare_04_Anim 
	Flare_04 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Flare_04 :SE_SetProps \{scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.05}
	Flare_04 :SE_WaitProps
	Flare_04 :SE_SetProps \{scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_stars_04 
	Destroy2DParticleSystem \{id = stars_04}
	wait \{1
		frame}
	Create2DParticleSystem \{id = stars_04
		Pos = (465.0, 320.0)
		z_priority = 100.0
		material = Mat_YouRock_Sparks
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
	wait \{0.3
		seconds}
	Destroy2DParticleSystem \{id = stars_04
		kill_when_empty}
endscript

script YouRock_Explosions_05_Combo 
	begin
	SpawnScript \{YouRock_Explosions_Glow_05}
	wait \{0.4
		seconds}
	SpawnScript \{YouRock_Explosions_Smoke_05}
	SpawnScript \{YouRock_Explosions_Splat_01_05}
	SpawnScript \{YouRock_Explosions_Splat_02_05}
	SpawnScript \{YouRock_Explosions_ASec_05}
	SpawnScript \{YouRock_Explosions_stars_05}
	SpawnScript \{YouRock_Explosions_RadialSparks_05}
	SpawnScript \{YouRock_Explosions_Flare_05}
	repeat 1
endscript

script YouRock_Explosions_Glow_05 
	DestroyScreenElement \{id = Glow_05}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Glow_05
		texture = PH_RadialGlow_01
		alpha = 0.0
		scale = (2.0, 2.0)
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
	Glow_05 :Obj_SpawnScript \{YouRock_Explosions_Glow_05_Anim}
endscript

script YouRock_Explosions_Glow_05_Anim 
	begin
	Glow_05 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_05 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	Glow_05 :SE_WaitProps
	Glow_05 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	Glow_05 :SE_WaitProps
	repeat 2
	wait \{0.05
		seconds}
	begin
	Glow_05 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_05 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	Glow_05 :SE_WaitProps
	Glow_05 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script YouRock_Lightning_05 
	DestroyScreenElement \{id = Lightning05}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Lightning05
		alpha = 0.95
		scale = (1.0, 1.2)
		just = [
			center
			center
		]
		Pos = (1050.0, 430.0)
		rot_angle = -240
		material = sys_GH5_1_Big_Bolt01_sys_GH5_1_Big_Bolt01
		z_priority = 110}
	wait \{0.4
		second}
	DestroyScreenElement \{id = Lightning05}
endscript

script YouRock_Explosions_RadialSparks_05 
	DestroyScreenElement \{id = RadialSparks_05}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = RadialSparks_05
		texture = PH_ExplosionTex_RadialSparks_01
		alpha = 0.0
		scale = (1.5, 1.5)
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
	RadialSparks_05 :Obj_SpawnScript \{YouRock_Explosions_RadialSparks_05_Anim}
endscript

script YouRock_Explosions_RadialSparks_05_Anim 
	RadialSparks_05 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	RadialSparks_05 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	RadialSparks_05 :SE_WaitProps
	RadialSparks_05 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Smoke_05 
	Destroy2DParticleSystem \{id = Smoke_05}
	Create2DParticleSystem \{id = Smoke_05
		Pos = (800.0, 280.0)
		z_priority = 98.0
		material = Mat_HOG_Smoke
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
	wait \{0.4
		second}
	Destroy2DParticleSystem \{id = Smoke_05
		kill_when_empty}
endscript

script YouRock_Explosions_ASec_05 
	DestroyScreenElement \{id = ASec_05}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = ASec_05
		texture = PH_ExplosionTex_ASec_02
		alpha = 0.0
		scale = (2.0, 2.0)
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
	ASec_05 :Obj_SpawnScript \{YouRock_Explosions_ASec_05_Anim}
endscript

script YouRock_Explosions_ASec_05_Anim 
	ASec_05 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0}
	ASec_05 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.05}
	ASec_05 :SE_WaitProps
	wait \{0.1
		seconds}
	ASec_05 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.3}
endscript

script YouRock_Explosions_Splat_01_05 
	DestroyScreenElement \{id = Splat_01_05}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_01_05
		texture = PH_MultiConfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
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
	Splat_01_05 :Obj_SpawnScript \{YouRock_Explosions_Splat_01_05_Anim}
endscript

script YouRock_Explosions_Splat_01_05_Anim 
	Splat_01_05 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Splat_01_05 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	Splat_01_05 :SE_WaitProps
	Splat_01_05 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	Splat_01_05 :SE_WaitProps
	Splat_01_05 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	Splat_01_05 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	Splat_01_05 :SE_WaitProps
	Splat_01_05 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script YouRock_Explosions_Splat_02_05 
	DestroyScreenElement \{id = Splat_02_05}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_02_05
		texture = PH_ExplosionTex_Splat_02
		alpha = 0.0
		scale = (0.5, 0.5)
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
	Splat_02_05 :Obj_SpawnScript \{YouRock_Explosions_Splat_02_05_Anim}
endscript

script YouRock_Explosions_Splat_02_05_Anim 
	Splat_02_05 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Splat_02_05 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	Splat_02_05 :SE_WaitProps
	Splat_02_05 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Flare_05 
	DestroyScreenElement \{id = Flare_05}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Flare_05
		texture = PH_Flare03
		alpha = 0.0
		scale = (5.0, 5.0)
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
	Flare_05 :Obj_SpawnScript \{YouRock_Explosions_Flare_05_Anim}
endscript

script YouRock_Explosions_Flare_05_Anim 
	Flare_05 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Flare_05 :SE_SetProps \{scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.05}
	Flare_05 :SE_WaitProps
	Flare_05 :SE_SetProps \{scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_stars_05 
	Destroy2DParticleSystem \{id = stars_05}
	wait \{1
		frame}
	Create2DParticleSystem \{id = stars_05
		Pos = (800.0, 280.0)
		z_priority = 100.0
		material = Mat_YouRock_Sparks
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
	wait \{0.3
		seconds}
	Destroy2DParticleSystem \{id = stars_05
		kill_when_empty}
endscript

script YouRock_Explosions_06_Combo 
	begin
	SpawnScript \{YouRock_Explosions_Glow_06}
	wait \{0.4
		seconds}
	SpawnScript \{YouRock_Explosions_Smoke_06}
	SpawnScript \{YouRock_Explosions_Splat_01_06}
	SpawnScript \{YouRock_Explosions_Splat_02_06}
	SpawnScript \{YouRock_Explosions_stars_06}
	SpawnScript \{YouRock_Explosions_RadialSparks_06}
	SpawnScript \{YouRock_Explosions_Flare_06}
	repeat 1
endscript

script YouRock_Explosions_Glow_06 
	DestroyScreenElement \{id = Glow_06}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Glow_06
		texture = PH_RadialGlow_01
		alpha = 0.0
		scale = (2.0, 2.0)
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
	Glow_06 :Obj_SpawnScript \{YouRock_Explosions_Glow_06_Anim}
endscript

script YouRock_Explosions_Glow_06_Anim 
	begin
	Glow_06 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_06 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	Glow_06 :SE_WaitProps
	Glow_06 :SE_SetProps \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	Glow_06 :SE_WaitProps
	repeat 2
	wait \{0.05
		seconds}
	begin
	Glow_06 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_06 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	Glow_06 :SE_WaitProps
	Glow_06 :SE_SetProps \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script YouRock_Explosions_RadialSparks_06 
	DestroyScreenElement \{id = RadialSparks_06}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = RadialSparks_06
		texture = PH_ExplosionTex_RadialSparks_01
		alpha = 0.0
		scale = (1.5, 1.5)
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
	RadialSparks_06 :Obj_SpawnScript \{YouRock_Explosions_RadialSparks_06_Anim}
endscript

script YouRock_Explosions_RadialSparks_06_Anim 
	RadialSparks_06 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	RadialSparks_06 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	RadialSparks_06 :SE_WaitProps
	RadialSparks_06 :SE_SetProps \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Smoke_06 
	Destroy2DParticleSystem \{id = Smoke_06}
	Create2DParticleSystem \{id = Smoke_06
		Pos = (370.0, 270.0)
		z_priority = 98.0
		material = Mat_HOG_Smoke
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
	wait \{0.4
		second}
	Destroy2DParticleSystem \{id = Smoke_06
		kill_when_empty}
endscript

script YouRock_Explosions_Splat_01_06 
	DestroyScreenElement \{id = Splat_01_06}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_01_06
		texture = PH_MultiConfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
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
	Splat_01_06 :Obj_SpawnScript \{YouRock_Explosions_Splat_01_06_Anim}
endscript

script YouRock_Explosions_Splat_01_06_Anim 
	Splat_01_06 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Splat_01_06 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	Splat_01_06 :SE_WaitProps
	Splat_01_06 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	Splat_01_06 :SE_WaitProps
	Splat_01_06 :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	Splat_01_06 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	Splat_01_06 :SE_WaitProps
	Splat_01_06 :SE_SetProps \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script YouRock_Explosions_Splat_02_06 
	DestroyScreenElement \{id = Splat_02_06}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Splat_02_06
		texture = PH_ExplosionTex_Splat_02
		alpha = 0.0
		scale = (0.5, 0.5)
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
	Splat_02_06 :Obj_SpawnScript \{YouRock_Explosions_Splat_02_06_Anim}
endscript

script YouRock_Explosions_Splat_02_06_Anim 
	Splat_02_06 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Splat_02_06 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	Splat_02_06 :SE_WaitProps
	Splat_02_06 :SE_SetProps \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_Flare_06 
	DestroyScreenElement \{id = Flare_06}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Flare_06
		texture = PH_Flare03
		alpha = 0.0
		scale = (5.0, 5.0)
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
	Flare_06 :Obj_SpawnScript \{YouRock_Explosions_Flare_06_Anim}
endscript

script YouRock_Explosions_Flare_06_Anim 
	Flare_06 :SE_SetProps \{scale = (0.1, 0.1)
		alpha = 0}
	Flare_06 :SE_SetProps \{scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.05}
	Flare_06 :SE_WaitProps
	Flare_06 :SE_SetProps \{scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script YouRock_Explosions_stars_06 
	Destroy2DParticleSystem \{id = stars_06}
	wait \{1
		frame}
	Create2DParticleSystem \{id = stars_06
		Pos = (370.0, 270.0)
		z_priority = 100.0
		material = Mat_YouRock_Sparks
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
	wait \{0.3
		seconds}
	Destroy2DParticleSystem \{id = stars_06
		kill_when_empty}
endscript

script YouRock_Explosions_02_BigCenter_Combo 
	SpawnScript \{YouRock_Explosions_Glow_02_BigCenter}
	wait \{0.1
		seconds}
	SpawnScript \{YouRock_Explosions_Flare_02_BigCenter}
	SpawnScript \{YouRock_Explosions_EndStreaks_02_BigCenter}
endscript

script YouRock_Explosions_Glow_02_BigCenter 
	DestroyScreenElement \{id = Glow_02_BigCenter}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Glow_02_BigCenter
		texture = PH_RadialGlow_01
		alpha = 0.0
		scale = (6.0, 3.0)
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
	Glow_02_BigCenter :Obj_SpawnScript \{YouRock_Explosions_Glow_02_BigCenter_Anim}
endscript

script YouRock_Explosions_Glow_02_BigCenter_Anim 
	begin
	Glow_02_BigCenter :SE_SetProps \{scale = (3.0, 1.0)
		alpha = 0}
	Glow_02_BigCenter :SE_SetProps \{scale = (10.0, 7.0)
		alpha = 0.6
		time = 0.05}
	Glow_02_BigCenter :SE_WaitProps
	Glow_02_BigCenter :SE_SetProps \{scale = (10.0, 7.0)
		alpha = 0.0
		time = 0.01}
	Glow_02_BigCenter :SE_WaitProps
	repeat 1
	wait \{0.05
		seconds}
	begin
	Glow_02_BigCenter :SE_SetProps \{scale = (0.5, 0.5)
		alpha = 0}
	Glow_02_BigCenter :SE_SetProps \{scale = (10.0, 7.0)
		alpha = 0.6
		time = 0.05}
	Glow_02_BigCenter :SE_WaitProps
	Glow_02_BigCenter :SE_SetProps \{scale = (10.0, 7.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script YouRock_Explosions_Flare_02_BigCenter 
	DestroyScreenElement \{id = Flare_02_BigCenter}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = Flare_02_BigCenter
		texture = PH_Flare03
		alpha = 0.9
		scale = (5.0, 5.0)
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
	Flare_02_BigCenter :Obj_SpawnScript \{YouRock_Explosions_Flare_02_BigCenter_Anim}
endscript

script YouRock_Explosions_Flare_02_BigCenter_Anim 
	Flare_02_BigCenter :SE_SetProps \{scale = (7.0, 4.0)
		alpha = 0}
	Flare_02_BigCenter :SE_SetProps \{scale = (15.0, 10.0)
		alpha = 0.6
		time = 0.05}
	Flare_02_BigCenter :SE_WaitProps
	Flare_02_BigCenter :SE_SetProps \{scale = (15.0, 10.0)
		alpha = 0.0
		time = 0.1}
endscript

script YouRock_Explosions_EndStreaks_02_BigCenter 
	DestroyScreenElement \{id = EndStreaks_02_BigCenter}
	wait \{1
		frame}
	CreateScreenElement \{type = SpriteElement
		parent = you_rock_effects_root
		id = EndStreaks_02_BigCenter
		texture = YouRock_EndStreaks_01
		alpha = 0.0
		scale = (2.5, 2.8)
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
	EndStreaks_02_BigCenter :Obj_SpawnScript \{YouRock_Explosions_EndStreaks_02_BigCenter_Anim}
endscript

script YouRock_Explosions_EndStreaks_02_BigCenter_Anim 
	EndStreaks_02_BigCenter :SE_SetProps \{alpha = 0}
	EndStreaks_02_BigCenter :SE_SetProps \{alpha = 0.2
		time = 0.1}
	EndStreaks_02_BigCenter :SE_WaitProps
	EndStreaks_02_BigCenter :SE_SetProps \{alpha = 0.0
		time = 0.1}
endscript
