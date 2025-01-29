jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 
	printf \{qs(0x18876fca)
		channel = JOW}
	printstruct <...> channel = JOW
	printf \{qs(0x18876fca)
		channel = JOW}
endscript

script SafeGetUniqueCompositeObjectID \{preferredID = safeFXID01}
	if NOT GotParam \{objID}
		GetUniqueCompositeObjectID preferredID = <preferredID>
		return uniqueID = <uniqueID>
	endif
	i = 0
	FormatText TextName = index '%i' i = <i>
	ExtendCrc <preferredID> <index> out = preferredID
	begin
	MangleChecksums a = <preferredID> b = <objID>
	if NOT ObjectExists id = <mangled_ID>
		return uniqueID = <preferredID>
	else
		i = (<i> + 1)
		FormatText TextName = index '%i' i = <i>
		ExtendCrc <preferredID> <index> out = preferredID
	endif
	repeat
endscript

script SetLightIntensityOverTime \{i = 1.0
		time = 2.0
		StepTime = 0.05}
	targetI = <i>
	GetLightIntensity name = <name>
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepSize = ((<targetI> - <i>) / <numSteps>)
	begin
	i = (<i> + <stepSize>)
	SetLightIntensity name = <name> Intensity = <i>
	wait <StepTime> seconds
	repeat (<numSteps> -1)
	SetLightIntensity name = <name> Intensity = <targetI>
endscript

script anim_key 
	Obj_MovetoPos (<mov>) time = <time>
	Obj_Rotate absolute = <rot> time = <time>
	obj_waitmove
endscript

script ChangePassColor \{parameter = m_psPass0MaterialColor
		time = 1.0
		StepTime = 0.05}
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepR = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepG = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepB = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepA = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement arrayName = startcolor index = 0 newValue = (<startcolor> [0] + <stepR>)
	SetArrayElement arrayName = startcolor index = 1 newValue = (<startcolor> [1] + <stepG>)
	SetArrayElement arrayName = startcolor index = 2 newValue = (<startcolor> [2] + <stepB>)
	SetArrayElement arrayName = startcolor index = 3 newValue = (<startcolor> [3] + <stepA>)
	UpdateMaterialProperty {
		Object = <objID>
		material = <material>
		parameter = <parameter>
		value = <startcolor>
	}
	wait <StepTime> seconds
	repeat (<numSteps> -1)
	UpdateMaterialProperty {
		Object = <objID>
		material = <material>
		parameter = <parameter>
		value = <endcolor>
	}
endscript

script Light_UpdatePosition \{offset = (0.0, 0.0, 0.0)}
	Obj_GetID
	begin
	if NOT IsCreated <attachObjId>
		Die
	endif
	<attachObjId> :Obj_GetPosition
	MoveLight name = <objID> Pos = (<Pos> + <offset>)
	wait \{1
		frame}
	repeat
endscript

script SetLightPosTime \{time = 1.0
		updateTime = 0.0333}
	endpos = <Pos>
	<name> :Obj_GetPosition
	numSteps = (<time> / <updateTime>)
	stepSize = ((<endpos> - <Pos>) / <numSteps>)
	f = <numSteps>
	CastToInteger \{f}
	begin
	Pos = (<Pos> + <stepSize>)
	SetLightPos name = <name> Pos = <Pos>
	wait <updateTime> seconds
	repeat (<f> -1)
	SetLightPos name = <name> Pos = <endpos>
endscript

script Obj_Scale \{scale = (2.0, 2.0, 2.0)
		time = 2.0}
	if GotParam \{Cycle}
		begin
		Obj_MorphScaling target_Scale = <scale> blend_duration = <time>
		wait <time> seconds
		Obj_MorphScaling target_Scale = (1.0, 1.0, 1.0) blend_duration = <time>
		wait <time> seconds
		repeat
	else
		Obj_MorphScaling target_Scale = <scale> blend_duration = <time>
	endif
endscript

script Obj_SetMaterialColor_Spawner 
	Obj_KillSpawnedScript \{name = Obj_SetMaterialColor}
	Obj_SpawnScriptLater Obj_SetMaterialColor params = {<...>}
endscript

script Obj_SetMaterialColor \{shader_Var = m_psPass0MaterialColor
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
		Obj_MakeMaterialUnique
	endif
	Obj_GetMaterialVector material = <material> shader_Var = <sharder_Var>
	startcolor = <material_Value>
	if (<StepTime> > <time>)
		StepTime = <time>
	endif
	if ((<time> > 0) && (<StepTime> > 0))
		numSteps = (<time> / <StepTime>)
		CastToInteger \{numSteps}
		stepSize = (1.0 / <numSteps>)
		curStep = 0.0
		begin
		wait <StepTime> seconds
		curStep = (<curStep> + <stepSize>)
		Blend_RGBA a = <startcolor> b = <endcolor> i = <curStep>
		Obj_SetMaterialVector material = <material> shader_Var = <shader_Var> value = <rgba>
		repeat <numSteps>
	endif
	SetArrayElement \{arrayName = material_Value
		index = 3
		newValue = 0}
	Obj_SetMaterialVector material = <material> shader_Var = <shader_Var> value = <endcolor>
endscript

script Blend_RGBA 
	LinearMap result = BR from = (<a> [0]) to = (<b> [0]) basedOn = <i> lowerBound = 0 upperBound = 1
	LinearMap result = Bg from = (<a> [1]) to = (<b> [1]) basedOn = <i> lowerBound = 0 upperBound = 1
	LinearMap result = bB from = (<a> [2]) to = (<b> [2]) basedOn = <i> lowerBound = 0 upperBound = 1
	LinearMap result = ba from = (<a> [3]) to = (<b> [3]) basedOn = <i> lowerBound = 0 upperBound = 1
	rgba = [0.0 0.0 0.0 0.0]
	SetArrayElement arrayName = rgba index = 0 newValue = <BR>
	SetArrayElement arrayName = rgba index = 1 newValue = <Bg>
	SetArrayElement arrayName = rgba index = 2 newValue = <bB>
	SetArrayElement arrayName = rgba index = 3 newValue = <ba>
	return rgba = <rgba>
endscript

script Create_AVEdit_FX \{viewport = fullscreen_visualizer_viewport}
	if NOT ViewportExists id = <viewport>
		JOW_Stars qs(0x2d9c3b7e) <viewport>
		CreateScreenElement {
			parent = root_window
			type = viewportelement
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
	Change \{visualizer_events_enabled = false}
	Create_AVFX <...>
endscript

script Create_AVFX \{viewport = fullscreen_visualizer_viewport
		clearColor = [
			0
			0
			0
			255
		]
		BlendMode = diffuse
		alphaFromGray = 1
		audio_Params = $Default_Visualizer_Audio_Params}
	if NOT ViewportExists id = <viewport>
		return
	endif
	if GotParam \{Profile}
		if StructureContains \{structure = Profile
				primitives}
			primitives = (<Profile>.primitives)
		endif
		if StructureContains \{structure = Profile
				audio_Params}
			audio_Params = (<Profile>.audio_Params)
		endif
		if StructureContains \{structure = Profile
				bloom_Params}
			bloom_Params = (<Profile>.bloom_Params)
		endif
		if StructureContains \{structure = Profile
				color_Params}
			color_Params = (<Profile>.color_Params)
		endif
		if StructureContains \{structure = Profile
				viewport_Params}
			clearColor = (<Profile>.viewport_Params.clearColor)
			BlendMode = (<Profile>.viewport_Params.BlendMode)
			alphaFromGray = (<Profile>.viewport_Params.alphaFromGray)
		endif
	endif
	if ScreenFX_FXInstanceExists viewport = <viewport> name = Bloom__simplified_
		ScreenFX_RemoveFXInstance viewport = <viewport> name = Bloom__simplified_
	endif
	if ScreenFX_FXInstanceExists viewport = <viewport> name = GodRay
		ScreenFX_RemoveFXInstance viewport = <viewport> name = GodRay
	endif
	if ScreenFX_FXInstanceExists viewport = <viewport> name = Noise_Lite type = noise2
		ScreenFX_RemoveFXInstance viewport = <viewport> name = Noise_Lite type = noise2
	endif
	if GotParam \{primitives}
		if ScreenFX_FXInstanceExists viewport = <viewport> name = AVFX01
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				name = AVFX01
				scefName = AVFX01
				type = AudioVisualize
				on = 1
				primitives = <primitives>
				clearColor = <clearColor>
				BlendMode = <BlendMode>
				AlphaFromGrayScale = <alphaFromGray>
				audio_Params = <audio_Params>
			}
		else
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				name = AVFX01
				scefName = AVFX01
				type = AudioVisualize
				on = 1
				primitives = <primitives>
				clearColor = <clearColor>
				BlendMode = <BlendMode>
				AlphaFromGrayScale = <alphaFromGray>
				audio_Params = <audio_Params>
			}
		endif
		if NOT GotParam \{bloom_Params}
			bloom_Params = $Default_Visualizer_Bloom_Params
		endif
		if ScreenFX_FXInstanceExists viewport = <viewport> name = AVFX_Bloom01
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				name = AVFX_Bloom01
				scefName = AVFX_Bloom01
				type = bloom2
				<bloom_Params>
			}
		else
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				name = AVFX_Bloom01
				scefName = AVFX_Bloom01
				type = bloom2
				<bloom_Params>
			}
		endif
		if GotParam \{color_Params}
			if ScreenFX_FXInstanceExists viewport = <viewport> name = AVFX_Color01
				ScreenFX_UpdateFXInstanceParams {
					viewport = <viewport>
					name = AVFX_Color01
					scefName = AVFX_Color01
					type = bright_Sat
					(<color_Params>)
				}
			else
				ScreenFX_AddFXInstance {
					viewport = <viewport>
					name = AVFX_Color01
					scefName = AVFX_Color01
					type = bright_Sat
					(<color_Params>)
				}
			endif
		else
			if ScreenFX_FXInstanceExists viewport = <viewport> name = AVFX_Color01
				ScreenFX_UpdateFXInstanceParams {
					viewport = <viewport>
					name = AVFX_Color01
					scefName = AVFX_Color01
					type = bright_Sat
					on = 0
				}
			endif
		endif
		if NOT ScreenFX_FXInstanceExists viewport = <viewport> name = AVFX_Uber01
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				name = AVFX_Uber01
				scefName = AVFX_Uber01
				type = UberScreenFX
			}
		endif
	endif
endscript

script Create_AVUI_FX \{viewport = ui_visualizer_viewport
		clearColor = [
			0
			0
			0
			255
		]
		BlendMode = diffuse
		alphaFromGray = 1
		audio_Params = $Default_Visualizer_Audio_Params}
	if NOT ViewportExists id = <viewport>
		return
	endif
	if GotParam \{Profile}
		if StructureContains \{structure = Profile
				primitives}
			primitives = (<Profile>.primitives)
		endif
		if StructureContains \{structure = Profile
				audio_Params}
			audio_Params = (<Profile>.audio_Params)
		endif
		if StructureContains \{structure = Profile
				bloom_Params}
			bloom_Params = (<Profile>.bloom_Params)
		endif
		if StructureContains \{structure = Profile
				color_Params}
			color_Params = (<Profile>.color_Params)
		endif
		if StructureContains \{structure = Profile
				viewport_Params}
			clearColor = (<Profile>.viewport_Params.clearColor)
			BlendMode = (<Profile>.viewport_Params.BlendMode)
			alphaFromGray = (<Profile>.viewport_Params.alphaFromGray)
		endif
	endif
	if GotParam \{primitives}
		if ScreenFX_FXInstanceExists viewport = <viewport> name = <id>
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				name = <id>
				scefName = <id>
				type = AudioVisualize
				on = 1
				primitives = <primitives>
				clearColor = <clearColor>
				BlendMode = <BlendMode>
				AlphaFromGrayScale = <alphaFromGray>
				audio_Params = <audio_Params>
			}
		else
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				name = <id>
				scefName = <id>
				type = AudioVisualize
				on = 1
				primitives = <primitives>
				clearColor = <clearColor>
				BlendMode = <BlendMode>
				AlphaFromGrayScale = <alphaFromGray>
				audio_Params = <audio_Params>
			}
		endif
		if NOT GotParam \{bloom_Params}
			bloom_Params = $Default_Visualizer_Bloom_Params
		endif
		if ScreenFX_FXInstanceExists viewport = <viewport> name = AV_Bloom01
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				name = AVUI_Bloom01
				scefName = AVUI_Bloom01
				type = bloom2
				<bloom_Params>
			}
		else
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				name = AVUI_Bloom01
				scefName = AVUI_Bloom01
				type = bloom2
				<bloom_Params>
			}
		endif
		if GotParam \{color_Params}
			if ScreenFX_FXInstanceExists viewport = <viewport> name = AVUI_Color01
				ScreenFX_UpdateFXInstanceParams {
					viewport = <viewport>
					name = AVUI_Color01
					scefName = AVUI_Color01
					type = bright_Sat
					(<color_Params>)
				}
			else
				ScreenFX_AddFXInstance {
					viewport = <viewport>
					name = AVUI_Color01
					scefName = AVUI_Color01
					type = bright_Sat
					(<color_Params>)
				}
			endif
		else
			if ScreenFX_FXInstanceExists viewport = <viewport> name = AVUI_Color01
				ScreenFX_UpdateFXInstanceParams {
					viewport = <viewport>
					name = AVUI_Color01
					scefName = AVUI_Color01
					type = bright_Sat
					on = 0
				}
			endif
		endif
		if NOT ScreenFX_FXInstanceExists viewport = <viewport> name = AVUI_Uber01
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				name = AVUI_Uber01
				scefName = AVUI_Uber01
				type = UberScreenFX
			}
		endif
	endif
endscript

script Destroy_AVFX \{primitives = $OG_BluePhoenix
		viewport = bg_viewport}
	ScreenFX_ClearFXInstances viewport = <viewport>
	if ViewportExists id = <viewport>
		if ScreenFX_FXInstanceExists viewport = <viewport> name = AVFX01
			ScreenFX_RemoveFXInstance viewport = <viewport> name = AVFX01
		endif
	endif
endscript

script Display_AVFX_Message \{text = qs(0x7223952e)
		time = 10
		Pos = (640.0, 640.0)}
	FormatText TextName = newText qs(0x0204c31d) t = <text>
	if ScreenElementExists \{id = mb_text_container}
		DestroyScreenElement \{id = mb_text_container}
	endif
	CreateScreenElement \{id = mb_text_container
		type = ContainerElement
		parent = root_window}
	CreateScreenElement {
		id = mb_text
		type = TextElement
		parent = mb_text_container
		font = debug
		text = <newText>
		scale = 1.5
		Pos = <Pos>
		just = [center center]
		rgba = [150 185 200 255]
		z_priority = 80
	}
	CreateScreenElement {
		id = mb_text_shadow
		type = TextElement
		parent = mb_text_container
		font = debug
		text = <newText>
		scale = 1.5
		Pos = (<Pos> + (1.0, 1.0))
		just = [center center]
		rgba = [0 0 0 255]
		z_priority = 79
	}
	if ScreenElementExists \{id = mb_text}
		mb_text :SE_SetProps \{alpha = 0}
	endif
	if ScreenElementExists \{id = mb_text_shadow}
		mb_text_shadow :SE_SetProps \{alpha = 0}
		mb_text_shadow :SE_SetProps \{alpha = 1
			time = 0.1}
	endif
	if ScreenElementExists \{id = mb_text}
		mb_text :SE_SetProps \{alpha = 1
			time = 0.1}
		mb_text :SE_WaitProps
	endif
	wait <time> seconds
	if ScreenElementExists \{id = mb_text_shadow}
		mb_text_shadow :SE_SetProps \{alpha = 0
			time = 0.1}
	endif
	if ScreenElementExists \{id = mb_text}
		mb_text :SE_SetProps \{alpha = 0
			time = 0.1}
		mb_text :SE_WaitProps
	endif
	if ScreenElementExists \{id = mb_text_container}
		DestroyScreenElement \{id = mb_text_container}
	endif
endscript

script Spit_Vocalist_Large 
	if CompositeObjectExists \{Vocalist}
		GetUniqueCompositeObjectID \{preferredID = JamesSpit_01}
		CreateParticleSystem name = <uniqueID> objID = Vocalist bone = Bone_Tongue params_Script = $GP_FX_Spit_01 groupID = zoneparticles
	endif
endscript

script Spit_Vocalist_Small 
	if CompositeObjectExists \{Vocalist}
		GetUniqueCompositeObjectID \{preferredID = JamesSpit_02}
		CreateParticleSystem name = <uniqueID> objID = Vocalist bone = Bone_Tongue params_Script = $GP_FX_Spit_Small_01 groupID = zoneparticles
	endif
endscript

script MouthFog_Vocalist 
	if CompositeObjectExists \{Vocalist}
		GetUniqueCompositeObjectID \{preferredID = JamesMouthFog_01}
		CreateParticleSystem name = <uniqueID> objID = Vocalist bone = Bone_Tongue params_Script = $GP_FX_MouthFog_01 groupID = zoneparticles
	endif
endscript

script MouthFog_Guitarist 
	if CompositeObjectExists \{Guitarist}
		GetUniqueCompositeObjectID \{preferredID = JamesMouthFog_02}
		CreateParticleSystem name = <uniqueID> objID = Guitarist bone = Bone_Tongue params_Script = $GP_FX_MouthFog_01 groupID = zoneparticles
	endif
endscript

script MouthFog_Bassist 
	if CompositeObjectExists \{Bassist}
		GetUniqueCompositeObjectID \{preferredID = JamesMouthFog_03}
		CreateParticleSystem name = <uniqueID> objID = Bassist bone = Bone_Tongue params_Script = $GP_FX_MouthFog_01 groupID = zoneparticles
	endif
endscript

script MouthFog_Drummer 
	if CompositeObjectExists \{Drummer}
		GetUniqueCompositeObjectID \{preferredID = JamesMouthFog_04}
		CreateParticleSystem name = <uniqueID> objID = Drummer bone = Bone_Tongue params_Script = $GP_FX_MouthFog_01 groupID = zoneparticles
	endif
endscript

script MouthAnimTex_Star_Vocalist 
	if ($allow_moments = false)
		return
	else
		if CompositeObjectExists \{Vocalist}
			GetUniqueCompositeObjectID
			CreateParticleSystem name = <uniqueID> objID = Vocalist bone = Bone_Tongue params_Script = $GP_FX_MouthStar_01 groupID = zoneparticles
		endif
	endif
endscript

script MouthAnimTex_Star_Guitarist 
	if ($allow_moments = false)
		return
	else
		if CompositeObjectExists \{Guitarist}
			GetUniqueCompositeObjectID \{preferredID = MouthAnimTex_02}
			CreateParticleSystem name = <uniqueID> objID = Guitarist bone = Bone_Tongue params_Script = $GP_FX_MouthStar_01 groupID = zoneparticles
		endif
	endif
endscript

script MouthAnimTex_Star_Bassist 
	if ($allow_moments = false)
		return
	else
		if CompositeObjectExists \{Bassist}
			GetUniqueCompositeObjectID \{preferredID = MouthAnimTex_03}
			CreateParticleSystem name = <uniqueID> objID = Bassist bone = Bone_Tongue params_Script = $GP_FX_MouthStar_01 groupID = zoneparticles
		endif
	endif
endscript

script MouthAnimTex_Star_Drummer 
	if ($allow_moments = false)
		return
	else
		if CompositeObjectExists \{Drummer}
			GetUniqueCompositeObjectID \{preferredID = MouthAnimTex_04}
			CreateParticleSystem name = <uniqueID> objID = Drummer bone = Bone_Tongue params_Script = $GP_FX_MouthStar_01 groupID = zoneparticles
		endif
	endif
endscript

script LeftHandAnimTex_Star_Vocalist 
	if ($allow_moments = false)
		return
	else
		if CompositeObjectExists \{Vocalist}
			GetUniqueCompositeObjectID \{preferredID = MouthAnimTex_05}
			CreateParticleSystem name = <uniqueID> objID = Vocalist bone = Bone_Palm_L params_Script = $GP_FX_MouthStar_01 groupID = zoneparticles
		endif
	endif
endscript

script RightHandAnimTex_Star_Vocalist 
	if ($allow_moments = false)
		return
	else
		if CompositeObjectExists \{Vocalist}
			GetUniqueCompositeObjectID
			CreateParticleSystem name = <uniqueID> objID = Vocalist bone = Bone_Palm_R params_Script = $GP_FX_MouthStar_01 groupID = zoneparticles
		endif
	endif
endscript

script RightFootAnimTex_Star_Guitarist 
	if ($allow_moments = false)
		return
	else
		if CompositeObjectExists \{Guitarist}
			GetUniqueCompositeObjectID
			CreateParticleSystem name = <uniqueID> objID = Guitarist bone = Bone_Ankle_R params_Script = $GP_FX_MouthStar_01 groupID = zoneparticles
		endif
	endif
endscript

script RightFootAnimTex_Star_Bassist 
	if ($allow_moments = false)
		return
	else
		if CompositeObjectExists \{Bassist}
			GetUniqueCompositeObjectID
			CreateParticleSystem name = <uniqueID> objID = Bassist bone = Bone_Ankle_R params_Script = $GP_FX_MouthStar_01 groupID = zoneparticles
		endif
	endif
endscript

script ChangeScreenElementColor name = m_pulseColor id = <highway_name> time = 1.0 StepTime = 0.05
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepR = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepG = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepB = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepA = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement arrayName = startcolor index = 0 newValue = (<startcolor> [0] + <stepR>)
	SetArrayElement arrayName = startcolor index = 1 newValue = (<startcolor> [1] + <stepG>)
	SetArrayElement arrayName = startcolor index = 2 newValue = (<startcolor> [2] + <stepB>)
	SetArrayElement arrayName = startcolor index = 3 newValue = (<startcolor> [3] + <stepA>)
	SetScreenElementProps {
		id = <id>
		MaterialProps = [{name = <name> VectorProperty = <startcolor>}]
	}
	wait <StepTime> seconds
	repeat (<numSteps> -1)
	SetScreenElementProps {
		id = <id>
		MaterialProps = [{name = <name> VectorProperty = <endcolor>}]
	}
endscript

script ChangeScreenElementColorbygfs name = m_pulseColor id = <highway_name> frames = 25 stepFrames = 5
	numSteps = (<frames> / <stepFrames>)
	CastToInteger \{numSteps}
	stepR = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepG = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepB = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepA = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement arrayName = startcolor index = 0 newValue = (<startcolor> [0] + <stepR>)
	SetArrayElement arrayName = startcolor index = 1 newValue = (<startcolor> [1] + <stepG>)
	SetArrayElement arrayName = startcolor index = 2 newValue = (<startcolor> [2] + <stepB>)
	SetArrayElement arrayName = startcolor index = 3 newValue = (<startcolor> [3] + <stepA>)
	if NOT ScreenElementExists id = <id>
		return
	endif
	SetScreenElementProps {
		id = <id>
		MaterialProps = [{name = <name> VectorProperty = <startcolor>}]
	}
	wait <stepFrames> gameframes
	repeat (<numSteps> -1)
	if NOT ScreenElementExists id = <id>
		return
	endif
	SetScreenElementProps {
		id = <id>
		MaterialProps = [{name = <name> VectorProperty = <endcolor>}]
	}
endscript
