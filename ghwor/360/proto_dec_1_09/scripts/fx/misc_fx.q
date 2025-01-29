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

script create_avui_fx \{viewport = ui_visualizer_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		BlendMode = diffuse
		alphafromgray = 1
		audio_params = $default_visualizer_audio_params}
	if NOT ViewportExists id = <viewport>
		return
	endif
	if GotParam \{Profile}
		if StructureContains \{structure = Profile
				primitives}
			primitives = (<Profile>.primitives)
		endif
		if StructureContains \{structure = Profile
				audio_params}
			audio_params = (<Profile>.audio_params)
		endif
		if StructureContains \{structure = Profile
				bloom_params}
			bloom_params = (<Profile>.bloom_params)
		endif
		if StructureContains \{structure = Profile
				color_params}
			color_params = (<Profile>.color_params)
		endif
		if StructureContains \{structure = Profile
				viewport_params}
			clearcolor = (<Profile>.viewport_params.clearcolor)
			BlendMode = (<Profile>.viewport_params.BlendMode)
			alphafromgray = (<Profile>.viewport_params.alphafromgray)
		endif
	endif
	if GotParam \{primitives}
		if screenFX_FXInstanceExists viewport = <viewport> Name = <id>
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				Name = <id>
				scefName = <id>
				Type = audiovisualize
				On = 1
				primitives = <primitives>
				clearcolor = <clearcolor>
				BlendMode = <BlendMode>
				alphafromgrayscale = <alphafromgray>
				audio_params = <audio_params>
			}
		else
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = <id>
				scefName = <id>
				Type = audiovisualize
				On = 1
				primitives = <primitives>
				clearcolor = <clearcolor>
				BlendMode = <BlendMode>
				alphafromgrayscale = <alphafromgray>
				audio_params = <audio_params>
			}
		endif
		if NOT GotParam \{bloom_params}
			bloom_params = $default_visualizer_bloom_params
		endif
		if screenFX_FXInstanceExists viewport = <viewport> Name = av_bloom01
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				Name = avui_bloom01
				scefName = avui_bloom01
				Type = Bloom2
				<bloom_params>
			}
		else
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = avui_bloom01
				scefName = avui_bloom01
				Type = Bloom2
				<bloom_params>
			}
		endif
		if GotParam \{color_params}
			if screenFX_FXInstanceExists viewport = <viewport> Name = avui_color01
				ScreenFX_UpdateFXInstanceParams {
					viewport = <viewport>
					Name = avui_color01
					scefName = avui_color01
					Type = Bright_Sat
					(<color_params>)
				}
			else
				ScreenFX_AddFXInstance {
					viewport = <viewport>
					Name = avui_color01
					scefName = avui_color01
					Type = Bright_Sat
					(<color_params>)
				}
			endif
		else
			if screenFX_FXInstanceExists viewport = <viewport> Name = avui_color01
				ScreenFX_UpdateFXInstanceParams {
					viewport = <viewport>
					Name = avui_color01
					scefName = avui_color01
					Type = Bright_Sat
					On = 0
				}
			endif
		endif
		if NOT screenFX_FXInstanceExists viewport = <viewport> Name = avui_uber01
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = avui_uber01
				scefName = avui_uber01
				Type = uberscreenfx
			}
		endif
	endif
endscript

script create_avedit_fx \{viewport = fullscreen_visualizer_viewport}
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
	create_avfx <...>
endscript

script create_avfx \{viewport = fullscreen_visualizer_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		BlendMode = diffuse
		alphafromgray = 1
		audio_params = $default_visualizer_audio_params}
	if NOT ViewportExists id = <viewport>
		return
	endif
	if GotParam \{Profile}
		if StructureContains \{structure = Profile
				primitives}
			primitives = (<Profile>.primitives)
		endif
		if StructureContains \{structure = Profile
				audio_params}
			audio_params = (<Profile>.audio_params)
		endif
		if StructureContains \{structure = Profile
				bloom_params}
			bloom_params = (<Profile>.bloom_params)
		endif
		if StructureContains \{structure = Profile
				color_params}
			color_params = (<Profile>.color_params)
		endif
		if StructureContains \{structure = Profile
				viewport_params}
			clearcolor = (<Profile>.viewport_params.clearcolor)
			BlendMode = (<Profile>.viewport_params.BlendMode)
			alphafromgray = (<Profile>.viewport_params.alphafromgray)
		endif
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
		if screenFX_FXInstanceExists viewport = <viewport> Name = avfx01
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				Name = avfx01
				scefName = avfx01
				Type = audiovisualize
				On = 1
				primitives = <primitives>
				clearcolor = <clearcolor>
				BlendMode = <BlendMode>
				alphafromgrayscale = <alphafromgray>
				audio_params = <audio_params>
			}
		else
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
				audio_params = <audio_params>
			}
		endif
		if NOT GotParam \{bloom_params}
			bloom_params = $default_visualizer_bloom_params
		endif
		if screenFX_FXInstanceExists viewport = <viewport> Name = avfx_bloom01
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				Name = avfx_bloom01
				scefName = avfx_bloom01
				Type = Bloom2
				<bloom_params>
			}
		else
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = avfx_bloom01
				scefName = avfx_bloom01
				Type = Bloom2
				<bloom_params>
			}
		endif
		if GotParam \{color_params}
			if screenFX_FXInstanceExists viewport = <viewport> Name = avfx_color01
				ScreenFX_UpdateFXInstanceParams {
					viewport = <viewport>
					Name = avfx_color01
					scefName = avfx_color01
					Type = Bright_Sat
					(<color_params>)
				}
			else
				ScreenFX_AddFXInstance {
					viewport = <viewport>
					Name = avfx_color01
					scefName = avfx_color01
					Type = Bright_Sat
					(<color_params>)
				}
			endif
		else
			if screenFX_FXInstanceExists viewport = <viewport> Name = avfx_color01
				ScreenFX_UpdateFXInstanceParams {
					viewport = <viewport>
					Name = avfx_color01
					scefName = avfx_color01
					Type = Bright_Sat
					On = 0
				}
			endif
		endif
		if NOT screenFX_FXInstanceExists viewport = <viewport> Name = avfx_uber01
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = avfx_uber01
				scefName = avfx_uber01
				Type = uberscreenfx
			}
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

script autocapturesnp 
	spawnscript \{autocapturesnpcore}
endscript

script autocapturesnpcore 
	Change \{debug_forcescore_dir = up}
	Change \{debug_forcescore = good}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras'
		changenow
		Type = cameras_debug_lightshow}
	Change \{CameraCuts_AllowNoteScripts = FALSE}
	enablescreenhistogram \{mode = 3
		colors = 0}
	getbuildversion
	StringToCharArray string = <build_version_string>
	curbuild = ((<char_array> [4]) + (<char_array> [5]) + (<char_array> [6]) + (<char_array> [7]) + (<char_array> [8]) + (<char_array> [9]))
	curlevelname = (($LevelZones.$current_level).Name)
	debug_menu_turn_off_highway_visibility
	Change \{lightshow_debugcycle_index = 0}
	lightshow_debugcycle
	GetArraySize \{$lightshow_available_snapshot_names}
	snpnum = <array_Size>
	formatText checksumName = camera_fullname '%p_cameras_debug_lightshow' p = (($LevelZones.$current_level).Name)
	if GlobalExists Name = <camera_fullname>
		CameraCuts_SetArrayPrefix \{prefix = 'cameras_debug_lightshow'
			changenow}
		Change \{CameraCuts_AllowNoteScripts = FALSE}
	endif
	if (<snpnum> > 10)
		Wait \{2
			Seconds}
		curnum = -1
		index = ($lightshow_debugcycle_index)
		begin
		if (<curnum> != <index>)
			PauseGame
			lightshow_debugcycle
			Wait \{0.25
				Seconds}
			snpnum = ($lightshow_debugcycle_index)
			ScreenShot FileName = (<curlevelname> + '_' + ($lightshow_available_snapshot_names [<snpnum> -1]) + '_' + <curbuild> + '_')
			<curnum> = $lightshow_debugcycle_index
			UnPauseGame
		else
			break
		endif
		Wait \{0.05
			Seconds}
		repeat
		outputtxt_autocapturesnp
	else
		outputtxt_autocapturesnp_none
	endif
	enablescreenhistogram \{mode = 0
		colors = 0}
	debug_menu_turn_on_highway_visibility
endscript

script outputtxt_autocapturesnp 
	TextOutputStart \{FileName = 'autocaptureSNP_done'}
	formatText \{TextName = text
		qs(0x00000000)}
	TextOutput text = <text>
	TextOutputEnd \{output_text
		FileName = 'autocaptureSNP_done'}
endscript

script outputtxt_autocapturesnp_none 
	TextOutputStart \{FileName = 'autocaptureSNP_none'}
	formatText \{TextName = text
		qs(0x00000000)}
	TextOutput text = <text>
	TextOutputEnd \{output_text
		FileName = 'autocaptureSNP_none'}
endscript

script gpuspikecapture 
endscript

script random_lightning 
	return
endscript

script random_lightning2 
	return
endscript

script random_lightning_spawner 
	spawnscript \{random_lightning}
endscript

script lightning_color_black 
	changepasscolor {
		objID = <nodeName>
		material = fx_geolightning
		parameter = m_psPass0MaterialColor
		startcolor = [255 255 255 128]
		endcolor = [0 0 0 0]
		time = 0.2
	}
endscript

script lightning_color_white 
	changepasscolor {
		objID = <nodeName>
		material = fx_geolightning
		parameter = m_psPass0MaterialColor
		startcolor = [0 0 0 0]
		endcolor = [200 155 255 128]
		time = 0.2
	}
endscript

script lightning_color_black2 
	changepasscolor {
		objID = <nodeName>
		material = fx_geolightning2
		parameter = m_psPass0MaterialColor
		startcolor = [255 255 255 128]
		endcolor = [0 0 0 0]
		time = 0.2
	}
endscript

script lightning_color_white2 
	changepasscolor {
		objID = <nodeName>
		material = fx_geolightning2
		parameter = m_psPass0MaterialColor
		startcolor = [0 0 0 0]
		endcolor = [200 155 255 128]
		time = 0.2
	}
endscript
