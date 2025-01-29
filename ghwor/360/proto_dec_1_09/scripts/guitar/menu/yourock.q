
script handofgod_sparkle 
	DestroyScreenElement \{id = hog_sparkle}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_sparkle
		texture = ph_radialglow_01
		alpha = 1
		Scale = (1.0, 1.0)
		dims = (200.0, 200.0)
		just = [
			center
			center
		]
		Pos = (640.0, 210.0)
		blend = add
		z_priority = 1050
		rgba = [
			255
			255
			255
			255
		]}
	handofgod_sparkle_anim
endscript

script handofgod_electriccenter_glow 
	DestroyScreenElement \{id = hog_electriccenter_glow}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_glow
		texture = ph_radialglow_01
		alpha = 1
		Scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		Pos = (640.0, 210.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
endscript

script handofgod_electriccenter_glow_02 
	DestroyScreenElement \{id = hog_electriccenter_glow_02}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_glow_02
		texture = ph_radialglow_01
		alpha = 1
		Scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		Pos = (640.0, 210.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
	handofgod_electriccenter_glow_anim_02
endscript

script handofgod_electriccenter_glow_03 
	DestroyScreenElement \{id = hog_electriccenter_glow_03}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_glow_03
		texture = ph_radialglow_01
		alpha = 1
		Scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		Pos = (640.0, 210.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
	handofgod_electriccenter_glow_anim_03
endscript

script handofgod_electriccenter_flare 
	DestroyScreenElement \{id = hog_electriccenter_flare}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_flare
		texture = jow_flare02
		alpha = 1
		Scale = (1.0, 1.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		Pos = (640.0, 220.0)
		blend = add
		rot_angle = 45
		z_priority = 3
		rgba = [
			120
			200
			255
			255
		]}
	Wait \{1.0
		Second}
	DestroyScreenElement \{id = hog_electriccenter_flare}
endscript

script handofgod_electriccenter_flare_02 
	DestroyScreenElement \{id = hog_electriccenter_flare_02}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_flare_02
		texture = jow_flare02
		alpha = 1
		Scale = (1.0, 1.0)
		dims = (20.0, 20.0)
		just = [
			center
			center
		]
		Pos = (640.0, 220.0)
		blend = add
		z_priority = 3
		rgba = [
			220
			240
			255
			255
		]}
	handofgod_electriccenter_flare_02_anim
endscript

script handofgod_electriccenter_flare_03 
	DestroyScreenElement \{id = hog_electriccenter_flare_03}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_flare_03
		texture = jow_flare02
		alpha = 1
		Scale = (1.0, 1.0)
		dims = (1800.0, 800.0)
		just = [
			center
			center
		]
		Pos = (640.0, 220.0)
		blend = add
		rot_angle = 0
		z_priority = 3
		rgba = [
			120
			200
			255
			255
		]}
	handofgod_electriccenter_flare_03_anim
endscript

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

script handofgod_electriccenter_02 
	DestroyScreenElement \{id = hog_electriccenter_02}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_02
		texture = ph_electricity_01
		alpha = 1
		Scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		Pos = (640.0, 210.0)
		rot_angle = 45
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
	handofgod_electriccenter_anim_scale_02
endscript

script handofgod_electriccenter_03 
	DestroyScreenElement \{id = hog_electriccenter_03}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_03
		texture = ph_electricity_01
		alpha = 1
		Scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		Pos = (640.0, 110.0)
		blend = add
		z_priority = 2
		rgba = [
			146
			200
			255
			255
		]}
	Wait \{1
		Frame}
	SpawnScriptNow \{handofgod_electriccenter_anim_scale_03}
endscript

script handofgod_electriccenter_04 
	DestroyScreenElement \{id = hog_electriccenter_04}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_04
		texture = ph_electricity_01
		alpha = 1
		Scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		Pos = (420.0, 230.0)
		blend = add
		z_priority = 5000
		rgba = [
			146
			200
			255
			255
		]}
	Wait \{1
		Frame}
	SpawnScriptNow \{handofgod_electriccenter_anim_scale_04}
endscript

script handofgod_electriccenter_05 
	DestroyScreenElement \{id = hog_electriccenter_05}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_electriccenter_05
		texture = ph_electricity_01
		alpha = 1
		Scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		Pos = (910.0, 200.0)
		blend = add
		z_priority = 5000
		rgba = [
			146
			200
			255
			255
		]}
	Wait \{1
		Frame}
	SpawnScriptNow \{handofgod_electriccenter_anim_scale_05}
endscript

script handofgod_sparkle_anim 
	hog_sparkle :se_setprops \{alpha = 0
		Scale = 0.1
		rot_angle = 0
		time = 0}
	hog_sparkle :se_setprops \{alpha = 1
		Scale = 6.0
		rot_angle = 180
		time = 0.1}
	hog_sparkle :se_setprops \{alpha = 0
		Scale = 0.1
		rot_angle = 360
		time = 0.15}
endscript

script handofgod_electriccenter_glow_anim 
	handofgod_electriccenter_glow
	begin
	hog_electriccenter_glow :se_setprops Scale = (0.1, 0.1) alpha = 0.4 time = 0 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	hog_electriccenter_glow :se_setprops Scale = (2.0, 2.0) alpha = 0.6 time = 0.5 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	repeat 3
	DestroyScreenElement \{id = hog_electriccenter_glow}
endscript

script handofgod_electriccenter_glow_anim_02 
	begin
	hog_electriccenter_glow_02 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0.5}
	hog_electriccenter_glow_02 :se_setprops \{Scale = (3.0, 3.0)
		alpha = 0
		time = 0.2}
	hog_electriccenter_glow_02 :se_waitprops
	repeat 7
	DestroyScreenElement \{id = hog_electriccenter_glow_02}
endscript

script handofgod_electriccenter_glow_anim_03 
	hog_electriccenter_glow_03 :se_setprops \{Scale = (5.0, 5.0)
		alpha = 0.4}
	hog_electriccenter_glow_03 :se_setprops \{Scale = (1.0, 1.0)
		alpha = 0
		time = 1}
	hog_electriccenter_glow_03 :se_waitprops
	DestroyScreenElement \{id = hog_electriccenter_glow_03}
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

script handofgod_electriccenter_anim_scale_03 
	hog_electriccenter_03 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0
		time = 0}
	hog_electriccenter_03 :se_waitprops
	hog_electriccenter_03 :se_setprops \{Scale = (2.5, 2.5)
		alpha = 1
		time = 0.05}
	hog_electriccenter_03 :se_waitprops
	DestroyScreenElement \{id = hog_electriccenter_03}
endscript

script handofgod_electriccenter_anim_scale_02 
	<rot> = 0
	begin
	<rot> = (<rot> + 10)
	hog_electriccenter_02 :se_setprops rot_angle = <rot>
	hog_electriccenter_02 :se_setprops \{Scale = (1.0, 1.0)
		alpha = 1
		time = 0}
	hog_electriccenter_02 :se_waitprops
	hog_electriccenter_02 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0
		time = 0.1}
	hog_electriccenter_02 :se_waitprops
	repeat 6
	DestroyScreenElement \{id = hog_electriccenter_02}
endscript

script handofgod_electriccenter_anim_scale_04 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter_04 :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter_04 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 0.3
		time = 0.1}
	hog_electriccenter_04 :se_waitprops
	hog_electriccenter_04 :se_setprops \{Scale = (1.0, 1.0)
		alpha = 1
		time = 0.2}
	hog_electriccenter_04 :se_waitprops
	repeat 3
	DestroyScreenElement \{id = hog_electriccenter_04}
endscript

script handofgod_electriccenter_anim_scale_05 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter_05 :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter_05 :se_setprops \{Scale = (0.4, 0.4)
		alpha = 0.3
		time = 0.1}
	hog_electriccenter_05 :se_waitprops
	hog_electriccenter_05 :se_setprops \{Scale = (1.0, 1.0)
		alpha = 1
		time = 0.2}
	hog_electriccenter_05 :se_waitprops
	repeat 3
	DestroyScreenElement \{id = hog_electriccenter_05}
endscript

script handofgod_electriccenter_flare_02_anim 
	hog_electriccenter_flare_02 :se_setprops \{Scale = (200.0, 200.0)
		rot_angle = -360
		alpha = 0.8
		time = 0.1}
	hog_electriccenter_flare_02 :se_waitprops
	DestroyScreenElement \{id = hog_electriccenter_flare_02}
endscript

script handofgod_electriccenter_flare_03_anim 
	hog_electriccenter_flare_03 :se_setprops \{Scale = (1.0, 1.0)
		rot_angle = 0
		alpha = 0.5
		time = 0}
	hog_electriccenter_flare_03 :se_setprops \{Scale = (800.0, 200.0)
		rot_angle = 0
		alpha = 2
		time = 4}
	hog_electriccenter_flare_03 :se_setprops \{Scale = (1.0, 1.0)
		rot_angle = 0
		alpha = 0
		time = 4.5}
	hog_electriccenter_flare_03 :se_waitprops
	DestroyScreenElement \{id = hog_electriccenter_flare_03}
endscript

script handofgod_fx_01 
	Wait \{1.5
		Second}
	SpawnScriptNow \{handofgod_lightning_combo}
	SpawnScriptNow \{handofgod_electriccenter_glow_anim}
	SpawnScriptNow \{handofgod_electriccenter}
	SpawnScriptNow \{handofgod_electriccenter_03}
	Wait \{0.2
		Second}
	SpawnScriptNow \{handofgod_electriccenter_02}
	SpawnScriptNow \{handofgod_electriccenter_flare_03}
endscript

script handofgod_fx_02 
	Wait \{1.5
		Second}
	Wait \{0.2
		Second}
	SpawnScriptNow \{handofgod_smoke_02}
	SpawnScriptNow \{handofgod_electriccenter_glow_03}
endscript

script hogcombo 
	SpawnScriptNow \{handofgod_fx_01}
	SpawnScriptNow \{handofgod_fx_02}
endscript

script handofgod_lightning_god 
	DestroyScreenElement \{id = hog_lightning_god}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_lightning_god
		alpha = 1
		Scale = (1.1, 1.3)
		just = [
			center
			center
		]
		Pos = (1025.0, 170.0)
		rot_angle = 70
		material = sys_Big_Bolt01_sys_Big_Bolt01
		z_priority = 1}
	Wait \{1.5
		Second}
	DestroyScreenElement \{id = hog_lightning_god}
endscript

script handofgod_lighting_devil_02 
	DestroyScreenElement \{id = hog_lighting_devil_02}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_lighting_devil_02
		alpha = 1
		Scale = (1.1, 1.3)
		just = [
			center
			center
		]
		Pos = (295.0, 160.0)
		rot_angle = 285
		material = sys_Big_Bolt01_sys_Big_Bolt01
		z_priority = 0.5}
	Wait \{1.5
		Second}
	DestroyScreenElement \{id = hog_lighting_devil_02}
endscript

script handofgod_lightning_combo 
	SpawnScriptNow \{handofgod_lightning_god}
	SpawnScriptNow \{handofgod_lighting_devil_02}
endscript

script handofgod_fx_kill 
	DestroyScreenElement \{id = hog_electriccenter_glow}
	DestroyScreenElement \{id = hog_electriccenter_flare}
	DestroyScreenElement \{id = hog_electriccenter}
	DestroyScreenElement \{id = hog_lightning_god}
	DestroyScreenElement \{id = hog_lighting_devil}
	DestroyScreenElement \{id = hog_lighting_devil_02}
endscript

script handofgod_electriccenter_sparks_01 
	Destroy2DParticleSystem \{id = electriccenter_sparks_01}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = electriccenter_sparks_01
		Pos = (640.0, 310.0)
		z_priority = 2
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = alive_root_particle_container
		start_color = [
			100
			200
			255
			255
		]
		end_color = [
			100
			200
			255
			0
		]
		start_scale = (1.2, 1.2)
		end_scale = (0.6, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.03
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 10
		friction = (0.0, 20.0)
		time = 0.5}
	Wait \{1.0
		Second}
	Destroy2DParticleSystem \{id = electriccenter_sparks_01}
endscript

script handofgod_electriccenter_sparks_02 
	Destroy2DParticleSystem \{id = electriccenter_sparks_02}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = electriccenter_sparks_02
		Pos = (640.0, 310.0)
		z_priority = 2
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = alive_root_particle_container
		start_color = [
			100
			0
			0
			255
		]
		end_color = [
			100
			0
			100
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (0.6, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.02
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 20
		friction = (0.0, 20.0)
		time = 0.5}
	Wait \{1.0
		Second}
	Destroy2DParticleSystem \{id = electriccenter_sparks_02}
endscript

script handofgod_smoke_01 
	Destroy2DParticleSystem \{id = hog_smoke_01}
	Create2DParticleSystem \{id = hog_smoke_01
		Pos = (640.0, 310.0)
		z_priority = 20.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			140
			200
			255
			175
		]
		end_color = [
			140
			200
			255
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (2.0, 2.0)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.5
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 4
		friction = (0.0, 0.0)
		time = 0.25}
	Wait \{1
		Second}
	Destroy2DParticleSystem \{id = hog_smoke_01}
endscript

script handofgod_smoke_02 
	Destroy2DParticleSystem \{id = hog_smoke_02}
	Create2DParticleSystem \{id = hog_smoke_02
		Pos = (640.0, 310.0)
		z_priority = 20.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			180
			200
			250
			80
		]
		end_color = [
			180
			180
			180
			0
		]
		start_scale = (2.0, 2.0)
		end_scale = (6.0, 6.0)
		start_angle_spread = 360.0
		min_rotation = -1000.0
		max_rotation = 900.0
		emit_start_radius = 2.0
		emit_radius = 3.0
		Emit_Rate = 0.09
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 10
		friction = (0.0, 0.0)
		time = 0.25}
	Wait \{1
		Second}
	Destroy2DParticleSystem \{id = hog_smoke_02
		kill_when_empty}
endscript
