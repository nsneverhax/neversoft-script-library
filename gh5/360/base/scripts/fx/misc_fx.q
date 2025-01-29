jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 
	printf \{qs(0x18876fca)
		channel = jow}
	printstruct <...> channel = jow
	printf \{qs(0x18876fca)
		channel = jow}
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

script obj_setmaterialcolor \{shader_var = m_psPass0MaterialColor
		endcolor = [
			1.0
			1.0
			1.0
			1.0
		]
		time = 1.0
		StepTime = 0.1
		unique = true}
	if (<unique> = true)
		obj_makematerialunique
	endif
	obj_getmaterialvector material = <material> shader_var = <sharder_var>
	startcolor = <material_value>
	if (<StepTime> > <time>)
		StepTime = <time>
	endif
	if ((<time> > 0) && (<StepTime> > 0))
		numSteps = (<time> / <StepTime>)
		CastToInteger \{numSteps}
		stepsize = (1.0 / <numSteps>)
		curstep = 0.0
		begin
		Wait <StepTime> Seconds
		curstep = (<curstep> + <stepsize>)
		blend_rgba a = <startcolor> b = <endcolor> i = <curstep>
		obj_setmaterialvector material = <material> shader_var = <shader_var> value = <rgba>
		repeat <numSteps>
	endif
	SetArrayElement \{ArrayName = material_value
		index = 3
		NewValue = 0}
	obj_setmaterialvector material = <material> shader_var = <shader_var> value = <endcolor>
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

script create_avedit_fx \{viewport = fullscreen_visualizer_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		BlendMode = diffuse
		alphafromgray = 1}
	if NOT ViewportExists id = <viewport>
		JOW_Stars qs(0x2d9c3b7e) <viewport>
		CreateScreenElement {
			parent = root_window
			Type = ViewportElement
			id = <id>
			texture = fullscreen_visualizer
			viewport_priority = 1
			Pos = (0.0, 0.0)
			just = [left top]
			dims = (1280.0, 720.0)
			rgba = [255 255 255 255]
			alpha = 1
			style = visualizer_rendering_hires
			color_only
			rect = [0.0 , 0.0 , 1.0 , 1.0]
			width = 1280
			height = 720
			resolve_to_prev_texture_with_alpha
			render_to_texture
			managed
			framerate = 60
			framemask = 3
			resolution = 1.0
			uidims = (1280.0, 720.0)
		}
		if ViewportExists id = <viewport>
			JOW_Stars \{qs(0xb5746191)}
		else
			JOW_Stars \{qs(0x93833032)}
			return
		endif
	endif
	Change \{visualizer_events_enabled = FALSE}
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
				clearcolor = <clearcolor>
				BlendMode = <BlendMode>
				alphafromgrayscale = <alphafromgray>
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
	endif
endscript

script create_avfx \{viewport = fullscreen_visualizer_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		BlendMode = diffuse
		alphafromgray = 1}
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
				clearcolor = <clearcolor>
				BlendMode = <BlendMode>
				alphafromgrayscale = <alphafromgray>
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
	if ScreenElementExists \{id = mb_text}
		mb_text :se_setprops \{alpha = 0}
	endif
	mb_text_shadow :se_setprops \{alpha = 0}
	if ScreenElementExists \{id = mb_text}
		mb_text :se_setprops \{alpha = 1
			time = 0.1}
	endif
	mb_text_shadow :se_setprops \{alpha = 1
		time = 0.1}
	if ScreenElementExists \{id = mb_text}
		mb_text :se_waitprops
	endif
	Wait <time> Seconds
	if ScreenElementExists \{id = mb_text}
		mb_text :se_setprops \{alpha = 0
			time = 0.1}
	endif
	mb_text_shadow :se_setprops \{alpha = 0
		time = 0.1}
	if ScreenElementExists \{id = mb_text}
		mb_text :se_waitprops
	endif
	if ScreenElementExists \{id = mb_text_container}
		DestroyScreenElement \{id = mb_text_container}
	endif
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

script spit_vocalist_large 
	if CompositeObjectExists \{vocalist}
		GetUniqueCompositeobjectID \{preferredID = jamesspit_01}
		CreateParticleSystem Name = <uniqueID> objID = vocalist bone = Bone_Tongue params_Script = $gp_fx_spit_01 groupID = zoneparticles
	endif
endscript

script spit_vocalist_small 
	if CompositeObjectExists \{vocalist}
		GetUniqueCompositeobjectID \{preferredID = jamesspit_02}
		CreateParticleSystem Name = <uniqueID> objID = vocalist bone = Bone_Tongue params_Script = $gp_fx_spit_small_01 groupID = zoneparticles
	endif
endscript

script mouthfog_vocalist 
	if CompositeObjectExists \{vocalist}
		GetUniqueCompositeobjectID \{preferredID = jamesmouthfog_01}
		CreateParticleSystem Name = <uniqueID> objID = vocalist bone = Bone_Tongue params_Script = $gp_fx_mouthfog_01 groupID = zoneparticles
	endif
endscript

script mouthfog_guitarist 
	if CompositeObjectExists \{GUITARIST}
		GetUniqueCompositeobjectID \{preferredID = jamesmouthfog_02}
		CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = Bone_Tongue params_Script = $gp_fx_mouthfog_01 groupID = zoneparticles
	endif
endscript

script mouthfog_bassist 
	if CompositeObjectExists \{BASSIST}
		GetUniqueCompositeobjectID \{preferredID = jamesmouthfog_03}
		CreateParticleSystem Name = <uniqueID> objID = BASSIST bone = Bone_Tongue params_Script = $gp_fx_mouthfog_01 groupID = zoneparticles
	endif
endscript

script mouthfog_drummer 
	if CompositeObjectExists \{drummer}
		GetUniqueCompositeobjectID \{preferredID = jamesmouthfog_04}
		CreateParticleSystem Name = <uniqueID> objID = drummer bone = Bone_Tongue params_Script = $gp_fx_mouthfog_01 groupID = zoneparticles
	endif
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

script camerablur_focusout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.6}
endscript

script camerafx_whiteflash 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_whiteflash \{appendbrightness = 100
		time = 0}
	Wait \{0.06
		Second}
	if ViewportExists \{id = bg_viewport}
		bg_fx_set_brightness_whiteflash effectparams = <startvalue> time = 0.06
	endif
endscript

script camerafx_blackfadein 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	OnExitRun camerafx_blackfadein_cleanup params = {startvalue = <startvalue>}
	bg_fx_set_brightness_blackfade appendbrightness = 0 time = (<length> * 0.001)
	Block
endscript

script camerafx_blackfadein_cleanup 
	if ViewportExists \{id = bg_viewport}
		bg_fx_set_brightness_blackfade effectparams = <startvalue>
	endif
endscript

script camerafx_blackfadeout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_blackfade \{appendbrightness = 0
		time = 0}
	Wait \{1
		Frame}
	bg_fx_set_brightness_blackfade effectparams = <startvalue> time = 0.75
endscript

script camerafx_blackfadeout_careerintro 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_blackfade \{appendbrightness = 0
		time = 0}
	Wait \{1
		Frame}
	bg_fx_set_brightness_blackfade effectparams = <startvalue> time = 0.5
endscript

script venueintro_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_cairo
		spawnscript \{venueintro_fx_cairo
			id = venuepyrofxkill}
		case z_sanfrancisco
		spawnscript \{venueintro_fx_sanfrancisco
			id = venuepyrofxkill}
		case z_carhenge
		spawnscript \{venueintro_fx_carhenge
			id = venuepyrofxkill}
		case z_dragrace
		spawnscript \{venueintro_fx_dragrace
			id = venuepyrofxkill}
		case z_dublin
		spawnscript \{venueintro_fx_dublin
			id = venuepyrofxkill}
		case z_freakshow
		spawnscript \{venueintro_fx_freakshow
			id = venuepyrofxkill}
		case z_mexicocity
		spawnscript \{venueintro_fx_mexicocity
			id = venuepyrofxkill}
		case z_nashville
		spawnscript \{venueintro_fx_nashville
			id = venuepyrofxkill}
		case z_neworleans
		spawnscript \{venueintro_fx_neworleans
			id = venuepyrofxkill}
		case z_norway
		spawnscript \{venueintro_fx_norway
			id = venuepyrofxkill}
		case z_subway
		spawnscript \{venueintro_fx_subway
			id = venuepyrofxkill}
		case z_vegas
		spawnscript \{venueintro_fx_vegas
			id = venuepyrofxkill}
		case z_montreux
		venueintro_fx_temp
		case z_paris
		venueintro_fx_temp
		case z_lhc
		spawnscript \{venueintro_fx_lhc
			id = venuepyrofxkill}
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
	spawnscript \{z_cairo_pyro_intro
		id = venuepyrofxkill}
endscript

script venueintro_fx_freakshow 
	LightShow_SetParams \{mood = Intro}
	Wait \{6
		Seconds}
	LightShow_SetTime \{time = 0.4}
	LightShow_SetParams \{mood = silhouette}
	spawnscript \{z_freakshow_intro_tesla
		id = venuepyrofxkill}
	Wait \{2
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = Intro}
endscript

script venueintro_fx_lhc 
	LightShow_SetParams \{mood = Intro}
	spawnscript \{z_lhc_intro_fx
		id = venuepyrofxkill}
endscript

script venueintro_fx_nashville 
	SafeKill \{nodeName = z_nashville_gfx_fx_intro_crowdlighting_01}
	LightShow_SetParams \{mood = Intro}
	Wait \{4
		Seconds}
	spawnscript \{venueintro_fx_nashville_strobe
		id = venuepyrofxkill}
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
	spawnscript \{z_nashville_pyro_moments_front_1
		id = venuepyrofxkill}
	spawnscript \{z_nashville_pyro_moments_back_1
		id = venuepyrofxkill}
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
	spawnscript \{z_vegas_pyro_intro
		id = venuepyrofxkill}
endscript

script venueintro_fx_dublin 
	LightShow_SetParams \{mood = Intro}
	spawnscript \{z_dublin_pyro_intro
		id = venuepyrofxkill}
	Wait \{5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_SetParams \{mood = blackout}
endscript

script venueintro_fx_carhenge 
	kill \{prefix = z_carhenge_gfx_fx_encoresmoke}
	create \{prefix = z_carhenge_gfx_fx_encoresmoke}
	SafeCreate \{nodeName = z_carhenge_gfx_fx_intro_godray_01}
	spawnscript \{z_carhenge_intro_godray_start
		id = venuepyrofxkill}
	Wait \{3
		Second}
	spawnscript \{venueintro_fx_carhenge_strobe
		id = venuepyrofxkill}
	Wait \{2
		Seconds}
	spawnscript \{z_carhenge_pyro_intro
		id = venuepyrofxkill}
	Wait \{3
		Seconds}
	spawnscript \{z_carhenge_intro_godray_end
		id = venuepyrofxkill}
	Wait \{1
		Seconds}
	SafeKill \{nodeName = z_carhenge_gfx_fx_intro_godray_01}
endscript

script venueintro_fx_carhenge_strobe 
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
	spawnscript \{z_mexicocity_pyro_intro
		id = venuepyrofxkill}
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
	spawnscript \{z_norway_pyro_intro
		id = venuepyrofxkill}
endscript

script venueintro_fx_dragrace 
	spawnscript \{z_dragrace_introcar
		id = venuepyrofxkill}
endscript

script venueintro_fx_temp 
	return
endscript

script venueintro_fx_subway 
	LightShow_SetParams \{mood = Intro}
	spawnscript \{z_subway_trainintro
		id = venuepyrofxkill}
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
	spawnscript \{z_subway_pyro_intro
		id = venuepyrofxkill}
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
	spawnscript \{z_neworleans_pyro_moments_front_3
		id = venuepyrofxkill}
	spawnscript \{z_neworleans_pyro_moments_back_3
		id = venuepyrofxkill}
	Wait \{3.0
		Seconds}
	spawnscript \{z_neworleans_pyro_moments_front_3
		id = venuepyrofxkill}
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
	spawnscript \{z_sanfrancisco_pyro_intro
		id = venuepyrofxkill}
endscript

script turnoffnodeflags 
	ChangeNodeFlag \{LS_MOOD_FLARE
		0}
	ChangeNodeFlag \{ls_mood_climax
		0}
	ChangeNodeFlag \{ls_mood_exposition
		0}
	ChangeNodeFlag \{ls_mood_falling
		0}
	ChangeNodeFlag \{ls_mood_prelude
		0}
	ChangeNodeFlag \{ls_mood_rising
		0}
	ChangeNodeFlag \{ls_mood_starpower
		0}
	ChangeNodeFlag \{ls_mood_resolution
		0}
	ChangeNodeFlag \{ls_mood_pyro
		0}
	ChangeNodeFlag \{LS_MOOD_BLACKOUT
		0}
	ChangeNodeFlag \{ls_mood_intro
		0}
	ChangeNodeFlag \{ls_mood_silhouette
		0}
	ChangeNodeFlag \{ls_mood_tension
		0}
	ChangeNodeFlag \{ls_mood_wash
		0}
	ChangeNodeFlag \{LS_MOOD_STROBE
		0}
	ChangeNodeFlag \{ls_mood_menu
		0}
endscript

script turnoffencoregodray 
	if screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = godray}
		ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
			Name = godray
			scefName = godray
			Type = godray
			On = 0
			lightsource = object}
	endif
endscript

script venuefastintro_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_cairo
		venuefastintro_fx_cairo
		case z_sanfrancisco
		venuefastintro_fx_sanfrancisco
		case z_carhenge
		venuefastintro_fx_carhenge
		case z_dragrace
		venuefastintro_fx_temp
		case z_dublin
		venuefastintro_fx_dublin
		case z_freakshow
		venuefastintro_fx_freakshow
		case z_mexicocity
		venuefastintro_fx_mexicocity
		case z_nashville
		venuefastintro_fx_nashville
		case z_neworleans
		venuefastintro_fx_neworleans
		case z_norway
		venuefastintro_fx_norway
		case z_subway
		venuefastintro_fx_subway
		case z_vegas
		venuefastintro_fx_vegas
		case z_lhc
		venuefastintro_fx_lhc
	endswitch
endscript

script venuefastintro_fx_temp 
	return
endscript

script venuefastintro_fx_carhenge 
	kill \{prefix = z_carhenge_gfx_fx_encoresmoke
		noprefixwarning}
	SafeKill \{nodeName = z_carhenge_gfx_fx_intro_godray_01}
	KillSpawnedScript \{Name = venueintro_fx_carhenge}
	KillSpawnedScript \{Name = venueintro_fx_carhenge_strobe}
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	LightShow_SetParams \{mood = Intro}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
endscript

script venuefastintro_fx_cairo 
	KillSpawnedScript \{Name = venueintro_fx_cairo}
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
endscript

script venuefastintro_fx_destroyparticles 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
endscript

script venuefastintro_fx_subway 
	KillSpawnedScript \{Name = venueintro_fx_subway}
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	if NOT ScriptIsRunning \{z_subway_train01}
		z_subway_train01
	endif
endscript

script venuefastintro_fx_lhc 
	z_lhc_intro_fx_kill
endscript

script venuefastintro_fx_sanfrancisco 
	SafeKill \{nodeName = z_sanfrancisco_gfx_fx_sanfranafterburst_01}
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
endscript

script venuefastintro_fx_freakshow 
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_freakshow_gfx_fx_teslasparks
		noprefixwarning}
	kill \{prefix = z_freakshow_gfx_fx_teslaglow
		noprefixwarning}
endscript

script venuefastintro_fx_neworleans 
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_neworleans_gfx_fx_introsmoke
		noprefixwarning}
	kill \{prefix = z_neworleans_gfx_fx_introfog
		noprefixwarning}
endscript

script venuefastintro_fx_dublin 
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_dublin_gfx_fx_lh_cloverlight
		noprefixwarning}
	kill \{prefix = z_dublin_gfx_fx_confetti
		noprefixwarning}
endscript

script venuefastintro_fx_vegas 
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
endscript

script venuefastintro_fx_nashville 
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_nashville_gfx_fx_intro_lensflare
		noprefixwarning}
	SafeKill \{nodeName = z_nashville_gfx_fx_intro_crowdlighting_01}
	LightShow_SetParams \{mood = Intro}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
endscript

script venuefastintro_fx_mexicocity 
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	SafeKill \{nodeName = z_mexicocity_gfx_fx_spinnerwheel_01}
	SafeKill \{nodeName = z_mexicocity_gfx_fx_spinnerwheel_02}
	SafeKill \{nodeName = z_mexicocity_gfx_fx_spinnersmoke_01}
	SafeKill \{nodeName = z_mexicocity_gfx_fx_spinnersmoke_02}
	SafeKill \{nodeName = z_mexicocity_gfx_fx_staticspinnersparks_01}
	SafeKill \{nodeName = z_mexicocity_gfx_fx_staticspinnersparks_02}
endscript

script venuefastintro_fx_norway 
	KillSpawnedScript \{Name = venueintro_fx_norway}
	KillSpawnedScript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_norway_gfx_fx_norwayintro
		noprefixwarning}
endscript

script songwon_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_cairo
		LightShow_SetParams \{mood = resolution}
		LightShow_PlaySnapshot \{Name = resolution01
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_cairo_pyro_moments_front_2
			id = venuepyrofxkill}
		spawnscript \{z_cairo_pyro_moments_mid_1
			id = venuepyrofxkill}
		spawnscript \{z_cairo_pyro_moments_back_2
			id = venuepyrofxkill}
		case z_sanfrancisco
		LightShow_SetParams \{mood = exposition}
		LightShow_PlaySnapshot \{Name = exposition01
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_sanfrancisco_pyro_special
			id = venuepyrofxkill}
		case z_carhenge
		LightShow_SetParams \{mood = blackout}
		LightShow_PlaySnapshot \{Name = blackout
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_carhenge_pyro_special
			id = venuepyrofxkill}
		case z_dragrace
		LightShow_SetParams \{mood = exposition}
		LightShow_PlaySnapshot \{Name = exposition01
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_dragrace_pyro_special
			id = venuepyrofxkill}
		case z_dublin
		LightShow_SetParams \{mood = pyro}
		LightShow_PlaySnapshot \{Name = pyro01
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_dublin_pyro_special
			id = venuepyrofxkill}
		case z_freakshow
		LightShow_SetParams \{mood = silhouette}
		LightShow_PlaySnapshot \{Name = silhouette_01
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_freakshow_pyro_special
			id = venuepyrofxkill}
		case z_mexicocity
		LightShow_SetParams \{mood = ENCORE}
		LightShow_PlaySnapshot \{Name = encore06
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_mexicocity_pyro_special
			id = venuepyrofxkill}
		case z_nashville
		LightShow_SetParams \{mood = blackout}
		LightShow_PlaySnapshot \{Name = blackout
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_nashville_pyro_special
			id = venuepyrofxkill}
		case z_neworleans
		LightShow_SetParams \{mood = tension}
		LightShow_PlaySnapshot \{Name = tension02
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_neworleans_pyro_special
			id = venuepyrofxkill}
		case z_norway
		LightShow_SetParams \{mood = blackout}
		LightShow_PlaySnapshot \{Name = blackout
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_norway_pyro_moments_front_2
			id = venuepyrofxkill}
		spawnscript \{z_norway_pyro_moments_back_2
			id = venuepyrofxkill}
		spawnscript \{z_norway_pyro_moments_mid_1
			id = venuepyrofxkill}
		case z_subway
		LightShow_SetParams \{mood = exposition}
		LightShow_PlaySnapshot \{Name = exposition01
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_subway_pyro_special
			id = venuepyrofxkill}
		case z_vegas
		LightShow_SetParams \{mood = exposition}
		LightShow_PlaySnapshot \{Name = exposition01
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_vegas_pyro_special
			id = venuepyrofxkill}
		case z_lhc
		LightShow_SetParams \{mood = resolution}
		LightShow_PlaySnapshot \{Name = resolution01
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_lhc_pyro_special
			id = venuepyrofxkill}
	endswitch
endscript

script celebintro_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_cairo
		celebintro_fx_temp
		case z_sanfrancisco
		celebintro_fx_temp
		case z_carhenge
		celebintro_fx_carhenge
		case z_dragrace
		celebintro_fx_temp
		case z_dublin
		celebintro_fx_dublin
		case z_easterisland
		celebintro_fx_temp
		case z_freakshow
		celebintro_fx_temp
		case z_mexicocity
		celebintro_fx_mexicocity
		case z_nashville
		celebintro_fx_nashville
		case z_neworleans
		celebintro_fx_temp
		case z_norway
		celebintro_fx_temp
		case z_subway
		celebintro_fx_temp
		case z_vegas
		celebintro_fx_temp
		case z_lhc
		spawnscript \{celebintro_fx_lhc}
	endswitch
endscript

script turnoffcelebintrospotlight 
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script celebintro_fx_temp 
	return
endscript

script celebintro_fx_nashville 
	LightShow_SetParams \{mood = strobe}
	LightShow_PlaySnapshot \{Name = strobe_03
		UseSnapshotPositions = true
		save = true}
	Wait \{6
		Seconds}
	z_nashville_pyro_moments_front_2
	Wait \{0.5
		Second}
	z_nashville_pyro_moments_mid_2
	LightShow_SetTime \{time = 1}
	LightShow_SetParams \{mood = Intro}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	Wait \{0.5
		Second}
	z_nashville_pyro_moments_back_2
endscript

script celebintro_fx_mexicocity 
	LightShow_SetParams \{mood = exposition}
	LightShow_PlaySnapshot \{Name = exposition02
		UseSnapshotPositions = true
		save = true}
	Wait \{3
		Seconds}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = exposition01
		UseSnapshotPositions = true
		save = true}
endscript

script celebintro_fx_carhenge 
	LightShow_SetParams \{mood = strobe}
	LightShow_PlaySnapshot \{Name = strobe08
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Seconds}
	LightShow_SetTime \{time = 5}
	LightShow_PlaySnapshot \{Name = exposition04
		UseSnapshotPositions = true
		save = true}
endscript

script celebintro_fx_lhc 
	LightShow_SetParams \{mood = blackout}
	LightShow_PlaySnapshot \{Name = blackout
		UseSnapshotPositions = true
		save = true}
	lightshow_spotlightcolor \{Color = red}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
	Wait \{6
		Seconds}
	LightShow_SetTime \{time = 3}
	LightShow_PlaySnapshot \{Name = prelude03
		UseSnapshotPositions = true
		save = true}
endscript

script celebintro_fx_dublin 
	LightShow_SetParams \{mood = pyro}
	LightShow_PlaySnapshot \{Name = pyro01
		UseSnapshotPositions = true
		save = true}
	lightshow_spotlightcolor \{Color = blue}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
	Wait \{5
		Seconds}
	LightShow_SetTime \{time = 2}
	LightShow_SetParams \{mood = resolution}
	LightShow_PlaySnapshot \{Name = resolution01
		UseSnapshotPositions = true
		save = true}
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
		MaterialProps = [{Name = <Name> vectorproperty = <startcolor>}]
	}
	Wait <stepframes> gameframes
	repeat (<numSteps> -1)
	if NOT ScreenElementExists id = <id>
		return
	endif
	SetScreenElementProps {
		id = <id>
		MaterialProps = [{Name = <Name> vectorproperty = <endcolor>}]
	}
endscript
