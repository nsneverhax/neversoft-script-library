jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 
	printf \{qs(0x18876fca)}
	printf <...>
	printf \{qs(0x18876fca)}
endscript

script SafeGetUniqueCompositeObjectID \{preferredID = safeFXID01}
	ScriptAssert \{'SafeGetUniqueCompositeObjectID: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script setlightintensityovertime \{i = 1.0
		time = 2.0
		StepTime = 0.05}
	targeti = <i>
	getlightintensity Name = <Name>
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepsize = ((<targeti> - <i>) / <numSteps>)
	begin
	i = (<i> + <stepsize>)
	setlightintensity Name = <Name> Intensity = <i>
	Wait <StepTime> Seconds
	repeat (<numSteps> -1)
	setlightintensity Name = <Name> Intensity = <targeti>
endscript

script anim_key 
	Obj_MoveToPos (<mov>) time = <time>
	Obj_Rotate absolute = <rot> time = <time>
	Obj_WaitMove
endscript

script changepasscolor \{parameter = m_psPass0MaterialColor
		time = 1.0
		StepTime = 0.05}
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement ArrayName = startcolor index = 0 NewValue = (<startcolor> [0] + <stepr>)
	SetArrayElement ArrayName = startcolor index = 1 NewValue = (<startcolor> [1] + <stepg>)
	SetArrayElement ArrayName = startcolor index = 2 NewValue = (<startcolor> [2] + <stepb>)
	SetArrayElement ArrayName = startcolor index = 3 NewValue = (<startcolor> [3] + <stepa>)
	UpdateMaterialProperty {
		object = <objID>
		material = <material>
		parameter = <parameter>
		value = <startcolor>
	}
	Wait <StepTime> Seconds
	repeat (<numSteps> -1)
	UpdateMaterialProperty {
		object = <objID>
		material = <material>
		parameter = <parameter>
		value = <endcolor>
	}
endscript

script light_updateposition \{offset = (0.0, 0.0, 0.0)}
	ScriptAssert \{'Light_UpdatePosition: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

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
		texture = ph_electricity_02
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
		texture = ph_electricity_02
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
		texture = ph_electricity_02
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
		texture = ph_electricity_02
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
		texture = ph_electricity_02
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
	SpawnScriptNow \{qg}
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
		Scale = (0.55, 0.65000004)
		just = [
			center
			center
		]
		Pos = (1025.0, 170.0)
		rot_angle = 70
		material = sys_Big_Bolt01_sys_Big_Bolt01
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.005
		num_uv_frames = (8.0, 1.0)
		rgba = [
			255
			255
			255
			255
		]
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
		Scale = (0.55, 0.65000004)
		just = [
			center
			center
		]
		Pos = (295.0, 160.0)
		rot_angle = 285
		material = sys_Big_Bolt01_sys_Big_Bolt01
		blend = add
		rgba = [
			255
			255
			255
			255
		]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.005
		num_uv_frames = (8.0, 1.0)
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
		blend = add
		parent = root_window
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
		blend = add
		parent = root_window
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
		blend = add
		parent = root_window
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
		blend = add
		parent = root_window
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

script credits_screenfx 
	begin
	if ViewportExists \{id = bg_viewport}
		break
	endif
	Wait \{1
		Frame}
	repeat
	if screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = bloom__simplified_}
		ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			MaterialFilter = 1
			subtract = [
				0.41176498
				0.41176498
				0.41176498
				1.0
			]
			colormodulate = [
				0.878431
				0.878431
				0.878431
				1.0
			]
			Saturation = 1.0
			thickness = 40.0
			equation = eq2}
	endif
	if screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = godray}
		ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
			Name = godray
			scefName = godray
			Type = godray
			On = 1
			colormodulate = [
				1.0
				0.964706
				0.87843204
				3.0
			]
			depthmodulate = 0.0
			steps = 100.0
			Range = 1.0
			fadeout_begin = 90.0
			fadeout_end = 120.0
			skycolor = [
				0.94117695
				0.75294095
				0.611765
				5.0
			]
			lightposition = [
				-100.00001
				30.000004
				60.0
				1.0
			]
			cliplightposition = 0
			lightsource = object}
	endif
endscript

script changescreenelementcolor Name = m_pulsecolor id = <highway_name> time = 1.0 StepTime = 0.05
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement ArrayName = startcolor index = 0 NewValue = (<startcolor> [0] + <stepr>)
	SetArrayElement ArrayName = startcolor index = 1 NewValue = (<startcolor> [1] + <stepg>)
	SetArrayElement ArrayName = startcolor index = 2 NewValue = (<startcolor> [2] + <stepb>)
	SetArrayElement ArrayName = startcolor index = 3 NewValue = (<startcolor> [3] + <stepa>)
	SetScreenElementProps {
		id = <id>
		MaterialProps = [{Name = <Name> vectorproperty = <startcolor>}]
	}
	Wait <StepTime> Seconds
	repeat (<numSteps> -1)
	SetScreenElementProps {
		id = <id>
		MaterialProps = [{Name = <Name> vectorproperty = <endcolor>}]
	}
endscript

script changescreenelementcolorbygfs Name = m_pulsecolor id = <highway_name> frames = 25 stepframes = 5
	numSteps = (<frames> / <stepframes>)
	CastToInteger \{numSteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement ArrayName = startcolor index = 0 NewValue = (<startcolor> [0] + <stepr>)
	SetArrayElement ArrayName = startcolor index = 1 NewValue = (<startcolor> [1] + <stepg>)
	SetArrayElement ArrayName = startcolor index = 2 NewValue = (<startcolor> [2] + <stepb>)
	SetArrayElement ArrayName = startcolor index = 3 NewValue = (<startcolor> [3] + <stepa>)
	if NOT ScreenElementExists id = <id>
		return
	endif
	SetScreenElementProps {
		id = <id>
		rgba = <startcolor>
	}
	Wait <stepframes> gameframes
	repeat (<numSteps> -1)
	if NOT ScreenElementExists id = <highway_name>
		return
	endif
	SetScreenElementProps {
		id = <id>
		rgba = <endcolor>
	}
endscript

script venueintro_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_cairo
		spawnscript \{venueintro_fx_cairo}
		case z_sanfrancisco
		spawnscript \{venueintro_fx_sanfrancisco}
		case z_carhenge
		spawnscript \{venueintro_fx_carhenge}
		case z_dragrace
		spawnscript \{venueintro_fx_dragrace}
		case z_dublin
		spawnscript \{venueintro_fx_dublin}
		case z_freakshow
		spawnscript \{venueintro_fx_freakshow}
		case z_mexicocity
		spawnscript \{venueintro_fx_mexicocity}
		case z_nashville
		spawnscript \{venueintro_fx_nashville}
		case z_neworleans
		spawnscript \{venueintro_fx_neworleans}
		case z_norway
		spawnscript \{venueintro_fx_norway}
		case z_subway
		spawnscript \{venueintro_fx_subway}
		case z_vegas
		spawnscript \{venueintro_fx_vegas}
		case z_montreux
		venueintro_fx_temp
		case z_paris
		venueintro_fx_temp
		case z_lhc
		spawnscript \{venueintro_fx_lhc}
	endswitch
endscript

script venueintro_fx_spawn 
	spawnscript \{venueintro_fx}
endscript

script venueintro_fx_cairo 
	LightShow_SetParams \{mood = Intro}
	Wait \{5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = blackout}
	Wait \{1
		Second}
	spawnscript \{z_cairo_pyro_intro}
endscript

script venueintro_fx_freakshow 
	LightShow_SetParams \{mood = Intro}
	Wait \{6
		Seconds}
	LightShow_SetTime \{time = 0.4}
	LightShow_SetParams \{mood = silhouette}
	spawnscript \{z_freakshow_intro_tesla}
	Wait \{2
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = Intro}
endscript

script venueintro_fx_lhc 
	LightShow_SetParams \{mood = Intro}
	spawnscript \{z_lhc_intro_fx}
endscript

script venueintro_fx_nashville 
	SafeKill \{nodeName = z_nashville_gfx_fx_intro_crowdlighting_01}
	LightShow_SetParams \{mood = Intro}
	Wait \{4
		Seconds}
	spawnscript \{venueintro_fx_nashville_strobe}
endscript

script venueintro_fx_nashville_strobe 
	kill \{prefix = z_nashville_gfx_fx_intro_lensflare
		noprefixwarning}
	SafeCreate \{nodeName = z_nashville_gfx_fx_intro_crowdlighting_01}
	create \{prefix = z_nashville_gfx_fx_intro_lensflare}
	LightShow_SetParams \{mood = strobe}
	begin
	LightShow_PlaySnapshot \{Name = strobe_01
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe_02
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe_03
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe_04
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe_05
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe_01
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe_06
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe_07
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe_08
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe_09
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	repeat 3
	kill \{prefix = z_nashville_gfx_fx_intro_lensflare}
	LightShow_PlaySnapshot \{Name = silhouette
		UseSnapshotPositions = true
		save = true}
	spawnscript \{z_nashville_pyro_moments_front_1}
	spawnscript \{z_nashville_pyro_moments_back_1}
	Wait \{0.5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = resolution}
	SafeKill \{nodeName = z_nashville_gfx_fx_encore_crowdlighting_01}
endscript

script venueintro_fx_vegas 
	LightShow_SetParams \{mood = Intro}
	Wait \{5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = strobe}
	LightShow_PlaySnapshot \{Name = strobe_02
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Second}
	spawnscript \{z_vegas_pyro_intro}
endscript

script venueintro_fx_dublin 
	LightShow_SetParams \{mood = Intro}
	spawnscript \{z_dublin_pyro_intro}
	Wait \{5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = blackout}
	Wait \{1
		Second}
endscript

script venueintro_fx_carhenge 
	kill \{prefix = z_carhenge_gfx_fx_encoresmoke}
	create \{prefix = z_carhenge_gfx_fx_encoresmoke}
	SafeCreate \{nodeName = z_carhenge_gfx_fx_intro_godray_01}
	spawnscript \{z_carhenge_intro_godray_start}
	Wait \{3
		Second}
	spawnscript \{venueintro_fx_carhenge_strobe}
	Wait \{2
		Seconds}
	spawnscript \{z_carhenge_pyro_intro}
	Wait \{4
		Seconds}
	SafeKill \{nodeName = z_carhenge_gfx_fx_intro_godray_01}
	z_carhenge_intro_godray_end
endscript

script venueintro_fx_carhenge_strobe 
	LightShow_SetParams \{mood = strobe}
	begin
	LightShow_PlaySnapshot \{Name = strobe01
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe02
		UseSnapshotPositions = true
		save = true}
	Wait \{0.3
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe03
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe04
		UseSnapshotPositions = true
		save = true}
	Wait \{0.3
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe05
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe06
		UseSnapshotPositions = true
		save = true}
	Wait \{0.1
		Seconds}
	LightShow_PlaySnapshot \{Name = strobe07
		UseSnapshotPositions = true
		save = true}
	Wait \{0.3
		Seconds}
	repeat 4
endscript

script venueintro_fx_mexicocity 
	LightShow_SetParams \{mood = Intro}
	Wait \{5.0
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = blackout}
	Wait \{0.5
		Seconds}
	spawnscript \{z_mexicocity_pyro_intro}
endscript

script venueintro_fx_norway 
	LightShow_SetParams \{mood = Intro}
	Wait \{5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = blackout}
	LightShow_PlaySnapshot \{Name = blackout
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Second}
	spawnscript \{z_norway_pyro_intro}
endscript

script venueintro_fx_dragrace 
	spawnscript \{z_dragrace_introcar}
endscript

script venueintro_fx_temp 
	return
endscript

script venueintro_fx_subway 
	LightShow_SetParams \{mood = Intro}
	spawnscript \{z_subway_trainintro}
	Wait \{5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = starpower}
	LightShow_PlaySnapshot \{Name = starpower01
		UseSnapshotPositions = true
		save = true}
	LightShow_SetTime \{time = 1}
	Wait \{0.3
		Seconds}
	spawnscript \{z_subway_pyro_intro}
endscript

script venueintro_fx_neworleans 
	ChangeNodeFlag \{ls_mood_intro
		0}
	kill \{prefix = z_neworleans_gfx_fx_introsmoke
		noprefixwarning}
	kill \{prefix = z_neworleans_gfx_fx_introfog
		noprefixwarning}
	create \{prefix = z_neworleans_gfx_fx_introfog
		noprefixwarning}
	Wait \{3.5
		Seconds}
	LightShow_SetTime \{time = 2}
	LightShow_SetParams \{mood = tension}
	LightShow_PlaySnapshot \{Name = tension01
		UseSnapshotPositions = true
		save = true}
	Wait \{1.5
		Seconds}
	spawnscript \{z_neworleans_pyro_moments_front_3}
	spawnscript \{z_neworleans_pyro_moments_back_3}
	Wait \{3.0
		Seconds}
	spawnscript \{z_neworleans_pyro_moments_front_3}
	Wait \{0.2
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = Intro}
endscript

script venueintro_fx_sanfrancisco 
	LightShow_SetParams \{mood = Intro}
	Wait \{6
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = blackout}
	Wait \{0.5
		Second}
	spawnscript \{z_sanfrancisco_pyro_intro}
endscript
