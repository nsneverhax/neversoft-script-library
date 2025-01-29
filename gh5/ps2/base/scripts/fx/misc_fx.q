jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 



endscript

script SafeGetUniqueCompositeObjectID \{preferredID = safeFXID01}
	if NOT GotParam \{objID}
		GetUniqueCompositeobjectID preferredID = <preferredID>
		return uniqueID = <uniqueID>
	endif
	i = 0
	formatText TextName = index '%i' i = <i>
	ExtendCrc <preferredID> <index> out = preferredID
	begin
	MangleChecksums a = <preferredID> b = <objID>
	if NOT ObjectExists id = <mangled_ID>
		return uniqueID = <preferredID>
	else
		i = (<i> + 1)
		formatText TextName = index '%i' i = <i>
		ExtendCrc <preferredID> <index> out = preferredID
	endif
	repeat
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
	Obj_GetID
	begin
	if NOT IsCreated <attachObjId>
		Die
	endif
	<attachObjId> :Obj_GetPosition
	MoveLight Name = <objID> Pos = (<Pos> + <offset>)
	Wait \{1
		Frame}
	repeat
endscript

script obj_scale \{Scale = (2.0, 2.0, 2.0)
		time = 2.0}
	if GotParam \{cycle}
		begin
		Obj_MorphScaling target_scale = <Scale> blend_duration = <time>
		Wait <time> Seconds
		Obj_MorphScaling target_scale = (1.0, 1.0, 1.0) blend_duration = <time>
		Wait <time> Seconds
		repeat
	else
		Obj_MorphScaling target_scale = <Scale> blend_duration = <time>
	endif
endscript

script obj_setmaterialcolor_spawner 
	Obj_KillSpawnedScript \{Name = obj_setmaterialcolor}
	Obj_SpawnScriptLater obj_setmaterialcolor params = {<...>}
endscript

script blend_rgba 
	linearmap Result = br from = (<a> [0]) to = (<b> [0]) basedon = <i> lowerbound = 0 upperbound = 1
	linearmap Result = bg from = (<a> [1]) to = (<b> [1]) basedon = <i> lowerbound = 0 upperbound = 1
	linearmap Result = bb from = (<a> [2]) to = (<b> [2]) basedon = <i> lowerbound = 0 upperbound = 1
	linearmap Result = ba from = (<a> [3]) to = (<b> [3]) basedon = <i> lowerbound = 0 upperbound = 1
	rgba = [0.0 0.0 0.0 0.0]
	SetArrayElement ArrayName = rgba index = 0 NewValue = <br>
	SetArrayElement ArrayName = rgba index = 1 NewValue = <bg>
	SetArrayElement ArrayName = rgba index = 2 NewValue = <bb>
	SetArrayElement ArrayName = rgba index = 3 NewValue = <ba>
	return rgba = <rgba>
endscript

script create_avedit_fx \{viewport = bg_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		BlendMode = blend
		alphafromgray = 1}
	ScreenFX_ClearFXInstances viewport = <viewport>
	Change \{visualizer_events_enabled = FALSE}
	if GotParam \{primitives}
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = avfx01
			scefName = avfx01
			Type = audiovisualize
			On = 1
			primitives = <primitives>
			clearcolor = <clearcolor>
			BlendMode = <BlendMode>
			alphafromgrayscale = <alphafromgray>
			audio_params = $default_visualizer_audio_params
		}
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = avfx_bloom01
			scefName = avfx_bloom01
			Type = Bloom2
			On = 1
			MaterialFilter = 0
			fullscreen = 1
			subtract = [0 0 0 0]
			colormodulate = [1.0 1.0 1.0 1.0]
			Saturation = 1.0
			equation = eq2
		}
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
			On = 1
		}
	endif
endscript

script create_avfx \{viewport = bg_viewport}
	if NOT ViewportExists id = <viewport>
		return
	endif
	if screenFX_FXInstanceExists viewport = <viewport> Name = bloom__simplified_
		ScreenFX_RemoveFXInstance viewport = <viewport> Name = bloom__simplified_
	endif
	if screenFX_FXInstanceExists viewport = <viewport> Name = godray
		ScreenFX_RemoveFXInstance viewport = <viewport> Name = godray
	endif
	if screenFX_FXInstanceExists viewport = <viewport> Name = noise_lite Type = noise2
		ScreenFX_RemoveFXInstance viewport = <viewport> Name = noise_lite Type = noise2
	endif
	if GotParam \{primitives}
		if NOT screenFX_FXInstanceExists viewport = <viewport> Name = avfx01
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = avfx01
				scefName = avfx01
				Type = audiovisualize
				On = 1
				primitives = <primitives>
				clearcolor = [0 , 0 , 0 , 255]
				audio_params = $default_visualizer_audio_params
			}
		else
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				Name = avfx01
				scefName = avfx01
				Type = audiovisualize
				On = 1
				primitives = <primitives>
				clearcolor = [0 , 0 , 0 , 255]
				audio_params = $default_visualizer_audio_params
			}
		endif
		if NOT screenFX_FXInstanceExists viewport = <viewport> Name = avfx_bloom01
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = avfx_bloom01
				scefName = avfx_bloom01
				Type = Bloom2
				On = 1
				MaterialFilter = 0
				fullscreen = 1
				subtract = [0 0 0 0]
				colormodulate = [1.0 1.0 1.0 0.8]
				Saturation = 1.0
				equation = eq2
			}
		endif
	elseif GotParam \{Profile}
		ScreenFX_ClearFXInstances viewport = <viewport>
		avpreset = ($Default_TOD_Manager.avpreset)
		fxParam = ($Default_TOD_Manager.fxParam)
		if StructureContains \{structure = Profile
				avpreset}
			avpreset = (<Profile>.avpreset)
		endif
		i = 0
		GetArraySize <avpreset>
		begin
		formatText checksumName = avname 'AVFX_%i' i = <i> DontAssertForChecksums
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = <avname>
			scefName = <avname>
			Type = audiovisualize
			On = 1
			primitives = (<avpreset> [<i>])
			clearcolor = [0 , 0 , 0 , 255]
			audio_params = $default_visualizer_audio_params
		}
		i = (<i> + 1)
		repeat <array_Size>
		if StructureContains \{structure = Profile
				fxParam}
			fxParam = (<Profile>.fxParam)
		endif
		if StructureContains \{structure = fxParam
				screen_FX}
			begin
			if GetNextArrayElement (<fxParam>.screen_FX)
				ScreenFX_AddFXInstance {
					viewport = <viewport>
					<element>
				}
			else
				break
			endif
			repeat
		endif
	endif
endscript

script destroy_avfx \{primitives = $og_bluephoenix
		viewport = bg_viewport}
	ScreenFX_ClearFXInstances viewport = <viewport>
	if ViewportExists id = <viewport>
		if screenFX_FXInstanceExists viewport = <viewport> Name = avfx01
			ScreenFX_RemoveFXInstance viewport = <viewport> Name = avfx01
		endif
	endif
endscript

script display_avfx_message \{text = qs(0x7223952e)
		time = 10
		Pos = (640.0, 640.0)}
	formatText TextName = newtext qs(0x0204c31d) t = <text>
	if ScreenElementExists \{id = mb_text_container}
		DestroyScreenElement \{id = mb_text_container}
	endif
	CreateScreenElement \{id = mb_text_container
		Type = ContainerElement
		parent = root_window}
	CreateScreenElement {
		id = mb_text
		Type = TextElement
		parent = mb_text_container
		font = debug
		text = <newtext>
		Scale = 1.5
		Pos = <Pos>
		just = [center center]
		rgba = [150 185 200 255]
		z_priority = 80
	}
	CreateScreenElement {
		id = mb_text_shadow
		Type = TextElement
		parent = mb_text_container
		font = debug
		text = <newtext>
		Scale = 1.5
		Pos = (<Pos> + (1.0, 1.0))
		just = [center center]
		rgba = [0 0 0 255]
		z_priority = 79
	}
	mb_text :se_setprops \{alpha = 0}
	mb_text_shadow :se_setprops \{alpha = 0}
	mb_text :se_setprops \{alpha = 1
		time = 0.1}
	mb_text_shadow :se_setprops \{alpha = 1
		time = 0.1}
	mb_text :se_waitprops
	Wait <time> Seconds
	mb_text :se_setprops \{alpha = 0
		time = 0.1}
	mb_text_shadow :se_setprops \{alpha = 0
		time = 0.1}
	mb_text :se_waitprops
	if ScreenElementExists \{id = mb_text_container}
		DestroyScreenElement \{id = mb_text_container}
	endif
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
		Pos = (640.0, 120.0)
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
		Pos = (640.0, 120.0)
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
		Pos = (640.0, 120.0)
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
		Pos = (640.0, 120.0)
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
		texture = JOW_ButtonFlare01
		alpha = 1
		Scale = (1.0, 1.0)
		dims = (20.0, 20.0)
		just = [
			center
			center
		]
		Pos = (640.0, 120.0)
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
		Pos = (640.0, 120.0)
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
		Pos = (640.0, 120.0)
		rot_angle = 45
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
	handofgod_electriccenter_anim_scale_02
endscript

script handofgod_electriccenter_glow_anim 
	handofgod_electriccenter_glow
	begin
	hog_electriccenter_glow :se_setprops Scale = (2.2, 2.2) alpha = 0.4 time = 0.05 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	hog_electriccenter_glow :se_setprops Scale = (2.0, 2.0) alpha = 0.6 time = 0.1 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	repeat 8
	DestroyScreenElement \{id = hog_electriccenter_glow}
endscript

script handofgod_electriccenter_glow_anim_02 
	begin
	hog_electriccenter_glow_02 :se_setprops \{Scale = (0.5, 0.5)
		alpha = 1}
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
	hog_electriccenter :se_setprops \{Scale = (1.0, 1.0)
		alpha = 0.3
		time = 0.1}
	hog_electriccenter :se_waitprops
	hog_electriccenter :se_setprops \{Scale = (1.3, 1.3)
		alpha = 1
		time = 0.1}
	hog_electriccenter :se_waitprops
	repeat 4
	DestroyScreenElement \{id = hog_electriccenter}
endscript

script handofgod_electriccenter_anim_scale_02 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter_02 :se_setprops rot_angle = <rot>
	hog_electriccenter_02 :se_setprops \{Scale = (1.0, 1.0)
		alpha = 1}
	hog_electriccenter_02 :se_waitprops
	hog_electriccenter_02 :se_setprops \{Scale = (2.0, 2.0)
		alpha = 0
		time = 0.2}
	hog_electriccenter_02 :se_waitprops
	repeat 4
	DestroyScreenElement \{id = hog_electriccenter_02}
endscript

script handofgod_electriccenter_flare_02_anim 
	hog_electriccenter_flare_02 :se_setprops \{Scale = (200.0, 200.0)
		rot_angle = -360
		alpha = 0.5
		time = 0.1}
	hog_electriccenter_flare_02 :se_waitprops
	DestroyScreenElement \{id = hog_electriccenter_flare_02}
endscript

script handofgod_electriccenter_combo 
	SpawnScriptNow \{handofgod_electriccenter_glow_anim}
	SpawnScriptNow \{handofgod_electriccenter}
	SpawnScriptNow \{handofgod_electriccenter_02}
	SpawnScriptNow \{handofgod_electriccenter_flare}
	SpawnScriptNow \{handofgod_smoke_01}
	SpawnScriptNow \{handofgod_electriccenter_sparks_01}
endscript

script handofgod_fx_01 
	Wait \{2.0
		Second}
	SpawnScriptNow \{handofgod_electriccenter_glow_anim}
	SpawnScriptNow \{handofgod_electriccenter}
	SpawnScriptNow \{handofgod_electriccenter_02}
	SpawnScriptNow \{handofgod_electriccenter_flare}
	SpawnScriptNow \{handofgod_smoke_01}
	SpawnScriptNow \{handofgod_electriccenter_sparks_01}
	SpawnScriptNow \{handofgod_lightning_combo}
	Wait \{1.0
		Second}
	handofgod_electriccenter_flare_02
endscript

script handofgod_fx_02 
	Wait \{2.0
		Second}
	SpawnScriptNow \{handofgod_electriccenter_glow_02}
	SpawnScriptNow \{handofgod_electriccenter_sparks_02}
	Wait \{0.0
		Second}
	handofgod_smoke_02
	handofgod_electriccenter_glow_03
endscript

script handofgod_lightning_god 
	DestroyScreenElement \{id = hog_lightning_god}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_lightning_god
		alpha = 1
		Scale = (1.1, 1.1)
		just = [
			center
			center
		]
		Pos = (1000.0, 140.0)
		rot_angle = 80
		material = sys_Big_Bolt01_sys_Big_Bolt01
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.08
		num_uv_frames = (8.0, 1.0)
		z_priority = 1}
	Wait \{1.0
		Second}
	DestroyScreenElement \{id = hog_lightning_god}
endscript

script handofgod_lighting_devil 
	DestroyScreenElement \{id = hog_lighting_devil}
	Wait \{1
		Frame}
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = hog_lighting_devil
		alpha = 1
		Scale = (1.1, 1.1)
		just = [
			center
			center
		]
		Pos = (210.0, 70.0)
		rot_angle = 280
		material = sys_Big_Bolt01_sys_Big_Bolt01
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.08
		num_uv_frames = (8.0, 1.0)
		z_priority = 1}
	Wait \{1.0
		Second}
	DestroyScreenElement \{id = hog_lighting_devil}
endscript

script handofgod_lightning_combo 
	SpawnScriptNow \{handofgod_lightning_god}
	SpawnScriptNow \{handofgod_lighting_devil}
endscript

script handofgod_fx_kill 
	DestroyScreenElement \{id = hog_electriccenter_glow}
	DestroyScreenElement \{id = hog_electriccenter_flare}
	DestroyScreenElement \{id = hog_electriccenter}
	DestroyScreenElement \{id = hog_lightning_god}
	DestroyScreenElement \{id = hog_lighting_devil}
endscript

script handofgod_electriccenter_sparks_01 
	Destroy2DParticleSystem \{id = electriccenter_sparks_01}
	Wait \{1
		Frame}
	Create2DParticleSystem \{id = electriccenter_sparks_01
		Pos = (640.0, 260.0)
		z_priority = 2
		material = sys_Particle_Spark01_sys_Particle_Spark01
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
		Pos = (640.0, 260.0)
		z_priority = 2
		material = sys_Particle_Spark01_sys_Particle_Spark01
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
		Pos = (640.0, 260.0)
		z_priority = 20.0
		material = mat_hog_smoke
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
		time = 0.5}
	Wait \{1.0
		Second}
	Destroy2DParticleSystem \{id = hog_smoke_01}
endscript

script handofgod_smoke_02 
	Destroy2DParticleSystem \{id = hog_smoke_02}
	Create2DParticleSystem \{id = hog_smoke_02
		Pos = (640.0, 260.0)
		z_priority = 20.0
		material = mat_hog_smoke
		parent = root_window
		start_color = [
			140
			200
			255
			40
		]
		end_color = [
			140
			200
			255
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
		time = 1}
	Wait \{1.0
		Second}
	Destroy2DParticleSystem \{id = hog_smoke_02
		kill_when_empty}
endscript

script camerablur_fastzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.1}
	Wait \{0.2
		Seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.3}
	Wait \{0.2
		Seconds}
	bg_fx_set_blur \{appendstrength = 0.5
		time = 0.1}
	Wait \{0.1
		Second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_slowzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.5}
	Wait \{0.4
		Seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.4}
	Wait \{0.5
		Seconds}
	bg_fx_set_blur \{appendstrength = 1
		time = 0.3}
	Wait \{0.3
		Second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_focusin 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0}
	Wait \{0.1
		Second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.5
endscript
