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

script spit_vocalist_large 
	if CompositeObjectExists \{vocalist}
		GetUniqueCompositeobjectID \{preferredID = jamesspit_01}
		CreateParticleSystem Name = <uniqueID> objID = vocalist bone = Bone_Tongue params_Script = $gp_fx_spit_01 groupID = zoneparticles
	endif
endscript

script spit_vocalist_small 
	if CompositeObjectExists \{vocalist}
		GetUniqueCompositeobjectID \{preferredID = jamesspit_01}
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
		GetUniqueCompositeobjectID \{preferredID = jamesmouthfog_01}
		CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = Bone_Tongue params_Script = $gp_fx_mouthfog_01 groupID = zoneparticles
	endif
endscript

script mouthfog_bassist 
	if CompositeObjectExists \{BASSIST}
		GetUniqueCompositeobjectID \{preferredID = jamesmouthfog_01}
		CreateParticleSystem Name = <uniqueID> objID = BASSIST bone = Bone_Tongue params_Script = $gp_fx_mouthfog_01 groupID = zoneparticles
	endif
endscript

script mouthfog_drummer 
	if CompositeObjectExists \{drummer}
		GetUniqueCompositeobjectID \{preferredID = jamesmouthfog_01}
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

script one_introfx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_justice
		one_introfx_justice
		case z_donnington
		one_introfx_donnington
		case z_forum
		one_introfx_forum
		case z_icecave
		one_introfx_icecave
		case z_meadowlands
		one_introfx_meadowlands
		case z_mop
		one_introfx_mop
		case z_stone
		one_introfx_stone
		case z_tushino
		one_introfx_tushino
	endswitch
endscript

script one_introfx_justice 
	tod_proxim_apply_careerintrofx
	LightShow_SetTime \{time = 1.5}
	LightShow_PlaySnapshot \{Name = ffwf
		UseSnapshotPositions = true
		save = true}
	SafeKill \{nodeName = z_justice_gfx_fx_sunflare_01}
	SafeKill \{nodeName = z_justice_gfx_fx_sunflare_01}
	kill \{prefix = z_justice_gfx_fx_oneintro}
	Wait \{1
		Frame}
	create \{prefix = z_justice_gfx_fx_oneintro}
	SafeCreate \{nodeName = z_justice_gfx_fx_ffwf_introsmoke_01}
	Wait \{2.5
		Seconds}
	SafeCreate \{nodeName = z_justice_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_justice_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{3.6
		Seconds}
	SafeCreate \{nodeName = z_justice_gfx_fx_oneintrorightflash_01}
	SafeCreate \{nodeName = z_justice_gfx_fx_oneintrorightflash_02}
	SpawnScriptNow \{one_introfx_explosions_02}
	Wait \{2.2
		Seconds}
	SafeCreate \{nodeName = z_justice_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_justice_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{1.3
		Seconds}
	kill \{prefix = z_justice_gfx_fx_oneintro}
	create \{prefix = z_justice_gfx_fx_ffwf_introflare}
	enablelight \{Name = z_justice_gfx_fx_oneintrojamesomni_01}
	Wait \{18.5
		Seconds}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare}
	SafeKill \{nodeName = z_justice_gfx_fx_ffwf_introsmoke_01}
	disablelight \{Name = z_donnington_gfx_fx_oneintrojamesomni_01}
	LightShow_SetTime \{time = 2}
	LightShow_PlaySnapshot \{Name = tension_02
		UseSnapshotPositions = true
		save = true}
endscript

script one_introfx_donnington 
	tod_proxim_apply_careerintrofx
	LightShow_SetTime \{time = 1.5}
	LightShow_PlaySnapshot \{Name = silhouette01
		UseSnapshotPositions = true
		save = true}
	kill \{prefix = z_donnington_gfx_fx_oneintro}
	Wait \{1
		Frame}
	create \{prefix = z_donnington_gfx_fx_oneintro}
	SafeCreate \{nodeName = z_donnington_gfx_fx_ffwf_introsmoke_01}
	Wait \{2.5
		Seconds}
	SafeCreate \{nodeName = z_donnington_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_donnington_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{3.6
		Seconds}
	SafeCreate \{nodeName = z_donnington_gfx_fx_oneintrorightflash_01}
	SafeCreate \{nodeName = z_donnington_gfx_fx_oneintrorightflash_02}
	SpawnScriptNow \{one_introfx_explosions_02}
	Wait \{2.2
		Seconds}
	SafeCreate \{nodeName = z_donnington_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_donnington_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{1.3
		Seconds}
	kill \{prefix = z_donnington_gfx_fx_oneintro}
	create \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	enablelight \{Name = z_donnington_gfx_fx_oneintrojamesomni_01}
	Wait \{18.5
		Seconds}
	SafeKill \{nodeName = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	disablelight \{Name = z_donnington_gfx_fx_oneintrojamesomni_01}
	LightShow_SetTime \{time = 2}
	LightShow_PlaySnapshot \{Name = Blackout01
		UseSnapshotPositions = true
		save = true}
endscript

script one_introfx_forum 
	tod_proxim_apply_careerintrofx
	LightShow_SetTime \{time = 1.5}
	LightShow_PlaySnapshot \{Name = strobe03
		UseSnapshotPositions = true
		save = true}
	kill \{prefix = z_forum_gfx_fx_oneintro}
	Wait \{1
		Frame}
	create \{prefix = z_forum_gfx_fx_oneintro}
	SafeCreate \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	Wait \{2.5
		Seconds}
	SafeCreate \{nodeName = z_forum_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_forum_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{3.6
		Seconds}
	SafeCreate \{nodeName = z_forum_gfx_fx_oneintrorightflash_01}
	SafeCreate \{nodeName = z_forum_gfx_fx_oneintrorightflash_02}
	SpawnScriptNow \{one_introfx_explosions_02}
	Wait \{2.2
		Seconds}
	SafeCreate \{nodeName = z_forum_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_forum_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{1.3
		Seconds}
	kill \{prefix = z_forum_gfx_fx_oneintro}
	create \{prefix = z_forum_gfx_fx_ffwf_introflare}
	enablelight \{Name = z_forum_gfx_fx_oneintrojamesomni_01}
	Wait \{18.5
		Seconds}
	SafeKill \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare}
	LightShow_SetTime \{time = 2}
	LightShow_PlaySnapshot \{Name = blackout
		UseSnapshotPositions = true
		save = true}
	disablelight \{Name = z_forum_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_icecave 
	tod_proxim_apply_careerintrofx
	LightShow_SetTime \{time = 1.5}
	LightShow_PlaySnapshot \{Name = strobe_03
		UseSnapshotPositions = true
		save = true}
	kill \{prefix = z_icecave_gfx_fx_oneintro}
	Wait \{1
		Frame}
	create \{prefix = z_icecave_gfx_fx_oneintro}
	SafeCreate \{nodeName = z_icecave_gfx_fx_ffwf_introsmoke_01}
	Wait \{2.5
		Seconds}
	SafeCreate \{nodeName = z_icecave_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_icecave_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{3.6
		Seconds}
	SafeCreate \{nodeName = z_icecave_gfx_fx_oneintrorightflash_01}
	SafeCreate \{nodeName = z_icecave_gfx_fx_oneintrorightflash_02}
	SpawnScriptNow \{one_introfx_explosions_02}
	Wait \{2.2
		Seconds}
	SafeCreate \{nodeName = z_icecave_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_icecave_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{1.3
		Seconds}
	kill \{prefix = z_icecave_gfx_fx_oneintro}
	create \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	enablelight \{Name = z_icecave_gfx_fx_oneintrojamesomni_01}
	Wait \{18.5
		Seconds}
	LightShow_SetTime \{time = 2}
	LightShow_PlaySnapshot \{Name = blackout_01
		UseSnapshotPositions = true
		save = true}
	SafeKill \{nodeName = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	disablelight \{Name = z_icecave_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_meadowlands 
	tod_proxim_apply_careerintrofx
	LightShow_SetTime \{time = 1.5}
	LightShow_PlaySnapshot \{Name = encore_cut01
		UseSnapshotPositions = true
		save = true}
	kill \{prefix = z_meadowlands_gfx_fx_oneintro}
	Wait \{1
		Frame}
	create \{prefix = z_meadowlands_gfx_fx_oneintro}
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	Wait \{2.5
		Seconds}
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{3.6
		Seconds}
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_oneintrorightflash_01}
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_oneintrorightflash_02}
	SpawnScriptNow \{one_introfx_explosions_02}
	Wait \{2.2
		Seconds}
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{1.3
		Seconds}
	kill \{prefix = z_meadowlands_gfx_fx_oneintro}
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_oneintrosunflare_01}
	create \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	enablelight \{Name = z_meadowlands_gfx_fx_oneintrojamesomni_01}
	Wait \{18.5
		Seconds}
	SafeKill \{nodeName = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	SafeKill \{nodeName = z_meadowlands_gfx_fx_oneintrosunflare_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	disablelight \{Name = z_meadowlands_gfx_fx_oneintrojamesomni_01}
	LightShow_SetTime \{time = 2}
	LightShow_PlaySnapshot \{Name = resolution02
		UseSnapshotPositions = true
		save = true}
endscript

script one_introfx_mop 
	tod_proxim_apply_careerintrofx
	LightShow_SetTime \{time = 1.5}
	LightShow_PlaySnapshot \{Name = ffwf
		UseSnapshotPositions = true
		save = true}
	kill \{prefix = z_mop_gfx_fx_oneintro}
	Wait \{1
		Frame}
	create \{prefix = z_mop_gfx_fx_oneintro}
	SafeCreate \{nodeName = z_mop_gfx_fx_ffwf_introsmoke_01}
	Wait \{2.5
		Seconds}
	SafeCreate \{nodeName = z_mop_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_mop_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{3.6
		Seconds}
	SafeCreate \{nodeName = z_mop_gfx_fx_oneintrorightflash_01}
	SafeCreate \{nodeName = z_mop_gfx_fx_oneintrorightflash_02}
	SpawnScriptNow \{one_introfx_explosions_02}
	Wait \{2.2
		Seconds}
	SafeCreate \{nodeName = z_mop_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_mop_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{1.3
		Seconds}
	kill \{prefix = z_mop_gfx_fx_oneintro}
	create \{prefix = z_mop_gfx_fx_ffwf_introflare}
	enablelight \{Name = z_mop_gfx_fx_oneintrojamesomni_01}
	Wait \{18.6
		Seconds}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare}
	SafeKill \{nodeName = z_mop_gfx_fx_ffwf_introsmoke_01}
	disablelight \{Name = z_mop_gfx_fx_oneintrojamesomni_01}
	LightShow_SetTime \{time = 2}
	LightShow_PlaySnapshot \{Name = climax01
		UseSnapshotPositions = true
		save = true}
endscript

script one_introfx_stone 
	tod_proxim_apply_careerintrofx
	kill \{prefix = z_stone_gfx_fx_oneintro}
	Wait \{0.2
		Second}
	create \{prefix = z_stone_gfx_fx_oneintro}
	SafeCreate \{nodeName = z_stone_gfx_fx_ffwf_introsmoke_01}
	LightShow_SetTime \{time = 1.3}
	LightShow_PlaySnapshot \{Name = ffwf
		UseSnapshotPositions = true
		save = true}
	Wait \{2.5
		Seconds}
	SafeCreate \{nodeName = z_stone_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_stone_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{3.6
		Seconds}
	SafeCreate \{nodeName = z_stone_gfx_fx_oneintrorightflash_01}
	SafeCreate \{nodeName = z_stone_gfx_fx_oneintrorightflash_02}
	SpawnScriptNow \{one_introfx_explosions_02}
	Wait \{2.2
		Seconds}
	SafeCreate \{nodeName = z_stone_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_stone_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{1.4
		Seconds}
	kill \{prefix = z_stone_gfx_fx_oneintro}
	create \{prefix = z_stone_gfx_fx_ffwf_introflare}
	enablelight \{Name = z_stone_gfx_fx_oneintrojamesomni_01}
	Wait \{18.3
		Seconds}
	SafeKill \{nodeName = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare}
	LightShow_SetTime \{time = 2}
	LightShow_PlaySnapshot \{Name = blackout
		UseSnapshotPositions = true
		save = true}
	disablelight \{Name = z_stone_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_tushino 
	tod_proxim_apply_careerintrofx
	LightShow_SetTime \{time = 1.5}
	LightShow_PlaySnapshot \{Name = ffwf
		UseSnapshotPositions = true
		save = true}
	kill \{prefix = z_tushino_gfx_fx_oneintro}
	Wait \{1
		Frame}
	create \{prefix = z_tushino_gfx_fx_oneintro}
	SafeCreate \{nodeName = z_tushino_gfx_fx_ffwf_introsmoke_01}
	Wait \{2.5
		Seconds}
	SafeCreate \{nodeName = z_tushino_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_tushino_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{3.6
		Seconds}
	SafeCreate \{nodeName = z_tushino_gfx_fx_oneintrorightflash_01}
	SafeCreate \{nodeName = z_tushino_gfx_fx_oneintrorightflash_02}
	SpawnScriptNow \{one_introfx_explosions_02}
	Wait \{2.2
		Seconds}
	SafeCreate \{nodeName = z_tushino_gfx_fx_oneintroleftflash_01}
	SafeCreate \{nodeName = z_tushino_gfx_fx_oneintroleftflash_02}
	SpawnScriptNow \{one_introfx_explosions_01}
	Wait \{1.3
		Seconds}
	kill \{prefix = z_tushino_gfx_fx_oneintro}
	create \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	enablelight \{Name = z_tushino_gfx_fx_oneintrojamesomni_01}
	Wait \{18.4
		Seconds}
	SafeKill \{nodeName = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	LightShow_SetTime \{time = 2}
	LightShow_PlaySnapshot \{Name = strobe09
		UseSnapshotPositions = true
		save = true}
	disablelight \{Name = z_tushino_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_explosions_01 
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_left_01}
	CreateParticleSystem Name = <uniqueID> Pos = (-3.84608, 0.0, 0.77381605) params_Script = $gp_fx_sparkfountain_big_sparks_01 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_left_02}
	CreateParticleSystem Name = <uniqueID> Pos = (-3.84608, 0.0, 0.77381605) params_Script = $gp_fx_sparkfountain_frontflash_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_left_03}
	CreateParticleSystem Name = <uniqueID> Pos = (-3.84608, 0.0, 0.77381605) params_Script = $gp_fx_sparkfountain_frontglow_01 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_left_04}
	CreateParticleSystem Name = <uniqueID> Pos = (-3.84608, 0.0, 0.77381605) params_Script = $gp_fx_sparkfountain_sparks_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_left_05}
	CreateParticleSystem Name = <uniqueID> Pos = (-3.84608, 0.0, 0.77381605) params_Script = $gp_fx_encore_es_sparks_01 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_left_06}
	CreateParticleSystem Name = <uniqueID> Pos = (-3.84608, 0.0, 0.77381605) params_Script = $gp_fx_encore_es_smoke_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_left_07}
	CreateParticleSystem Name = <uniqueID> Pos = (-3.84608, 0.0, 0.77381605) params_Script = $gp_fx_encore_es_pulseglow_01 groupID = zoneparticles
endscript

script one_introfx_explosions_02 
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_right_01}
	CreateParticleSystem Name = <uniqueID> Pos = (3.64269, 0.0, 0.28839597) params_Script = $gp_fx_sparkfountain_big_sparks_01 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_right_02}
	CreateParticleSystem Name = <uniqueID> Pos = (3.64269, 0.0, 0.28839597) params_Script = $gp_fx_sparkfountain_frontflash_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_right_03}
	CreateParticleSystem Name = <uniqueID> Pos = (3.64269, 0.0, 0.28839597) params_Script = $gp_fx_sparkfountain_frontglow_01 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_right_04}
	CreateParticleSystem Name = <uniqueID> Pos = (3.64269, 0.0, 0.28839597) params_Script = $gp_fx_sparkfountain_sparks_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_right_05}
	CreateParticleSystem Name = <uniqueID> Pos = (3.64269, 0.0, 0.28839597) params_Script = $gp_fx_encore_es_sparks_01 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_right_06}
	CreateParticleSystem Name = <uniqueID> Pos = (3.64269, 0.0, 0.28839597) params_Script = $gp_fx_encore_es_smoke_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = one_introfx_explosions_right_07}
	CreateParticleSystem Name = <uniqueID> Pos = (3.64269, 0.0, 0.28839597) params_Script = $gp_fx_encore_es_pulseglow_01 groupID = zoneparticles
endscript

script one_introfx_kill 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_justice
		one_introfx_justice_kill
		case z_donnington
		one_introfx_donnington_kill
		case z_forum
		one_introfx_forum_kill
		case z_icecave
		one_introfx_icecave_kill
		case z_meadowlands
		one_introfx_meadowlands_kill
		case z_mop
		one_introfx_mop_kill
		case z_stone
		one_introfx_stone_kill
		case z_tushino
		one_introfx_tushino_kill
	endswitch
endscript

script one_introfx_justice_kill 
	SafeKill \{nodeName = z_justice_gfx_fx_oneintro2_james_lh_05}
	SafeKill \{nodeName = z_justice_gfx_fx_sunflare_01}
	kill \{prefix = z_justice_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{Name = z_justice_gfx_fx_oneintrojamesomni_01}
	SafeKill \{nodeName = z_justice_gfx_fx_encore_lh_01}
endscript

script one_introfx_donnington_kill 
	kill \{prefix = z_donnington_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{Name = z_donnington_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_forum_kill 
	SafeKill \{nodeName = z_forum_gfx_careerintro_ground}
	SafeCreate \{nodeName = z_forum_js_ground}
	SafeCreate \{nodeName = z_forum_js_walkway_pipes_intro}
	kill \{prefix = z_forum_gfx_fx_careerintrosunflare
		noprefixwarning}
	SafeKill \{nodeName = z_forum_gfx_careerintro_smoke_01}
	SafeCreate \{nodeName = z_forum_tunnel_light}
	SafeKill \{nodeName = z_forum_gfx_fx_oneintro2_james_lh_06}
	kill \{prefix = z_forum_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{Name = z_forum_gfx_fx_oneintrojamesomni_01}
	disablelight \{Name = z_forum_gfx_careerintro_pyrolight_01}
	disablelight \{Name = z_forum_gfx_careerintro_pyrolight_front_01}
	z_forum_gfx_fx_fireworks_launchbox_01 :Obj_MoveToPos \{(10.9505, -1.54822, -17.6067)}
	z_forum_gfx_fx_fireworks_launchbox_02 :Obj_MoveToPos \{(13.5096, -1.54822, -16.870998)}
	z_forum_gfx_fx_fireworks_launchbox_05 :Obj_MoveToPos \{(12.0577, -1.54822, -17.229101)}
	z_forum_gfx_fx_fireworks_launchbox_06 :Obj_MoveToPos \{(13.2939005, -1.54822, -17.7289)}
	z_forum_gfx_fx_fireworks_launchbox_07 :Obj_MoveToPos \{(12.162201, -1.54822, -17.9999)}
	SafeKill \{nodeName = z_forum_gfx_careerintro_dust_01}
	kill \{prefix = z_forum_gfx_fx_careerintrosunflare02
		noprefixwarning}
	kill \{prefix = z_forum_gfx_fx_encore_smoke
		noprefixwarning}
	kill \{prefix = z_forum_gfx_fx_encore_lh_snakes
		noprefixwarning}
	SafeKill \{nodeName = z_forum_gfx_fx_careerintro_drumlh}
endscript

script one_introfx_icecave_kill 
	kill \{prefix = z_icecave_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{Name = z_icecave_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_meadowlands_kill 
	kill \{prefix = z_meadowlands_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{Name = z_meadowlands_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_mop_kill 
	kill \{prefix = z_mop_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{Name = z_mop_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_stone_kill 
	kill \{prefix = z_stone_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{Name = z_stone_gfx_fx_oneintrojamesomni_01}
endscript

script one_introfx_tushino_kill 
	kill \{prefix = z_tushino_gfx_fx_oneintro
		noprefixwarning}
	disablelight \{Name = z_tushino_gfx_fx_oneintrojamesomni_01}
endscript

script ffwf_introfx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_justice
		ffwf_introfx_justice
		case z_donnington
		ffwf_introfx_donnington
		case z_forum
		ffwf_introfx_forum
		case z_icecave
		ffwf_introfx_icecave
		case z_meadowlands
		ffwf_introfx_meadowlands
		case z_mop
		ffwf_introfx_mop
		case z_stone
		ffwf_introfx_stone
		case z_tushino
		ffwf_introfx_tushino
	endswitch
endscript

script ffwf_introfx_justice 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_justice_gfx_fx_smoke
		noprefixwarning}
	SafeKill \{nodeName = z_justice_gfx_fx_crowdfog_01}
	Wait \{1
		Second}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = ffwf
		UseSnapshotPositions = true
		save = true}
	SafeCreate \{nodeName = z_justice_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_justice_gfx_fx_ffwf_introflare}
	Wait \{38
		Seconds}
	LightShow_SetTime \{time = 7}
	LightShow_PlaySnapshot \{Name = tension_02
		UseSnapshotPositions = true
		save = true}
	Wait \{20
		Seconds}
	create \{prefix = z_justice_gfx_fx_smoke}
	SafeKill \{nodeName = z_justice_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_donnington 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_donnington_gfx_fx_smoke
		noprefixwarning}
	SafeKill \{nodeName = z_donnington_gfx_fx_crowdfog_01}
	Wait \{1
		Second}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = silhouette01
		UseSnapshotPositions = true
		save = true}
	SafeCreate \{nodeName = z_donnington_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	Wait \{38
		Seconds}
	LightShow_SetTime \{time = 7}
	LightShow_PlaySnapshot \{Name = climax02
		UseSnapshotPositions = true
		save = true}
	Wait \{20
		Seconds}
	create \{prefix = z_donnington_gfx_fx_smoke}
	SafeKill \{nodeName = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_forum 
	LightShow_SetTime \{time = 0}
	LightShow_PlaySnapshot \{Name = strobe03
		UseSnapshotPositions = true
		save = true}
	tod_proxim_apply_careerintrofx
	kill \{prefix = z_forum_gfx_fx_smoke
		noprefixwarning}
	SafeCreate \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_forum_gfx_fx_ffwf_introflare}
	Wait \{39
		Seconds}
	LightShow_SetTime \{time = 7}
	LightShow_PlaySnapshot \{Name = exposition04
		UseSnapshotPositions = true
		save = true}
	Wait \{20
		Seconds}
	create \{prefix = z_forum_gfx_fx_smoke}
	SafeKill \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_icecave 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_icecave_gfx_fx_smoke
		noprefixwarning}
	Wait \{1
		Second}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = strobe_03
		UseSnapshotPositions = true
		save = true}
	SafeCreate \{nodeName = z_icecave_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	Wait \{38
		Seconds}
	LightShow_SetTime \{time = 7}
	LightShow_PlaySnapshot \{Name = pyro
		UseSnapshotPositions = true
		save = true}
	Wait \{20
		Seconds}
	create \{prefix = z_icecave_gfx_fx_smoke}
	SafeKill \{nodeName = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_meadowlands 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_meadowlands_gfx_fx_smoke
		noprefixwarning}
	Wait \{1
		Second}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = encore_cut01
		UseSnapshotPositions = true
		save = true}
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	Wait \{38
		Seconds}
	LightShow_SetTime \{time = 7}
	LightShow_PlaySnapshot \{Name = exposition02
		UseSnapshotPositions = true
		save = true}
	Wait \{20
		Seconds}
	create \{prefix = z_meadowlands_gfx_fx_smoke}
	SafeKill \{nodeName = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_mop 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_mop_gfx_fx_smoke
		noprefixwarning}
	SafeKill \{nodeName = z_mop_gfx_fx_crowdfog_01}
	Wait \{1
		Second}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = ffwf
		UseSnapshotPositions = true
		save = true}
	SafeCreate \{nodeName = z_mop_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_mop_gfx_fx_ffwf_introflare}
	Wait \{38
		Seconds}
	LightShow_SetTime \{time = 7}
	LightShow_PlaySnapshot \{Name = rising06
		UseSnapshotPositions = true
		save = true}
	Wait \{20
		Seconds}
	create \{prefix = z_mop_gfx_fx_smoke}
	SafeKill \{nodeName = z_mop_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_stone 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_stone_gfx_fx_smoke
		noprefixwarning}
	SafeKill \{nodeName = z_stone_gfx_fx_crowdfog_01}
	Wait \{1
		Second}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = ffwf
		UseSnapshotPositions = true
		save = true}
	SafeCreate \{nodeName = z_stone_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_stone_gfx_fx_ffwf_introflare}
	Wait \{38
		Seconds}
	LightShow_SetTime \{time = 7}
	LightShow_PlaySnapshot \{Name = exposition05
		UseSnapshotPositions = true
		save = true}
	Wait \{20
		Seconds}
	create \{prefix = z_stone_gfx_fx_smoke}
	SafeKill \{nodeName = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_tushino 
	tod_proxim_apply_careerintro_cut1_fx
	kill \{prefix = z_tushino_gfx_fx_smoke
		noprefixwarning}
	SafeKill \{nodeName = z_tushino_gfx_fx_crowdfog_01}
	Wait \{1
		Second}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = ffwf
		UseSnapshotPositions = true
		save = true}
	SafeCreate \{nodeName = z_tushino_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	Wait \{38
		Seconds}
	LightShow_SetTime \{time = 7}
	LightShow_PlaySnapshot \{Name = climax02
		UseSnapshotPositions = true
		save = true}
	Wait \{20
		Seconds}
	create \{prefix = z_tushino_gfx_fx_smoke}
	SafeKill \{nodeName = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare}
endscript

script ffwf_introfx_kill 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_justice
		ffwf_introfx_justice_kill
		case z_donnington
		ffwf_introfx_donnington_kill
		case z_forum
		ffwf_introfx_forum_kill
		case z_icecave
		ffwf_introfx_icecave_kill
		case z_meadowlands
		ffwf_introfx_meadowlands_kill
		case z_mop
		ffwf_introfx_mop_kill
		case z_stone
		ffwf_introfx_stone_kill
		case z_tushino
		ffwf_introfx_tushino_kill
	endswitch
endscript

script ffwf_introfx_justice_kill 
	SafeKill \{nodeName = z_justice_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_donnington_kill 
	SafeKill \{nodeName = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_forum_kill 
	SafeKill \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_icecave_kill 
	SafeKill \{nodeName = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_meadowlands_kill 
	SafeKill \{nodeName = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_mop_kill 
	SafeKill \{nodeName = z_mop_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_stone_kill 
	SafeKill \{nodeName = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script ffwf_introfx_tushino_kill 
	SafeKill \{nodeName = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare
		noprefixwarning}
endscript

script lemmy_introfx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_justice
		lemmy_introfx_justice
		case z_donnington
		lemmy_introfx_donnington
		case z_forum
		lemmy_introfx_forum
		case z_icecave
		lemmy_introfx_icecave
		case z_meadowlands
		lemmy_introfx_meadowlands
		case z_mop
		lemmy_introfx_mop
		case z_stone
		lemmy_introfx_stone
		case z_tushino
		lemmy_introfx_tushino
	endswitch
endscript

script lemmy_introfx_justice 
	SafeCreate \{nodeName = z_justice_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_justice_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = intro_01
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_donnington 
	SafeCreate \{nodeName = z_donnington_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro01
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_forum 
	SafeCreate \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_forum_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_icecave 
	SafeCreate \{nodeName = z_icecave_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = intro_01
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_meadowlands 
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_mop 
	SafeCreate \{nodeName = z_mop_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_mop_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_stone 
	SafeCreate \{nodeName = z_stone_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_stone_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_tushino 
	SafeCreate \{nodeName = z_tushino_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_kill 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_justice
		lemmy_introfx_justice_kill
		case z_donnington
		lemmy_introfx_donnington_kill
		case z_forum
		lemmy_introfx_forum_kill
		case z_icecave
		lemmy_introfx_icecave_kill
		case z_meadowlands
		lemmy_introfx_meadowlands_kill
		case z_mop
		lemmy_introfx_mop_kill
		case z_stone
		lemmy_introfx_stone_kill
		case z_tushino
		lemmy_introfx_tushino_kill
	endswitch
endscript

script lemmy_introfx_justice_kill 
	SafeKill \{nodeName = z_justice_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_donnington_kill 
	SafeKill \{nodeName = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_forum_kill 
	SafeKill \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_icecave_kill 
	SafeKill \{nodeName = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_meadowlands_kill 
	SafeKill \{nodeName = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_mop_kill 
	SafeKill \{nodeName = z_mop_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_stone_kill 
	SafeKill \{nodeName = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script lemmy_introfx_tushino_kill 
	SafeKill \{nodeName = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_justice
		kingdiamond_introfx_justice
		case z_donnington
		kingdiamond_introfx_donnington
		case z_forum
		kingdiamond_introfx_forum
		case z_icecave
		kingdiamond_introfx_icecave
		case z_meadowlands
		kingdiamond_introfx_meadowlands
		case z_mop
		kingdiamond_introfx_mop
		case z_stone
		kingdiamond_introfx_stone
		case z_tushino
		kingdiamond_introfx_tushino
	endswitch
endscript

script kingdiamond_introfx_justice 
	SafeCreate \{nodeName = z_justice_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_justice_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = intro_01
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_donnington 
	SafeCreate \{nodeName = z_donnington_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_donnington_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro01
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_forum 
	SafeCreate \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_forum_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_icecave 
	SafeCreate \{nodeName = z_icecave_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_icecave_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = intro_01
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_meadowlands 
	SafeCreate \{nodeName = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_meadowlands_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_mop 
	SafeCreate \{nodeName = z_mop_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_mop_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_stone 
	SafeCreate \{nodeName = z_stone_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_stone_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_tushino 
	SafeCreate \{nodeName = z_tushino_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_tushino_gfx_fx_ffwf_introflare}
	LightShow_PlaySnapshot \{Name = Intro
		UseSnapshotPositions = true
		save = true}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_kill 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_justice
		kingdiamond_introfx_justice_kill
		case z_donnington
		kingdiamond_introfx_donnington_kill
		case z_forum
		kingdiamond_introfx_forum_kill
		case z_icecave
		kingdiamond_introfx_icecave_kill
		case z_meadowlands
		kingdiamond_introfx_meadowlands_kill
		case z_mop
		kingdiamond_introfx_mop_kill
		case z_stone
		kingdiamond_introfx_stone_kill
		case z_tushino
		kingdiamond_introfx_tushino_kill
	endswitch
endscript

script kingdiamond_introfx_justice_kill 
	SafeKill \{nodeName = z_justice_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_justice_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_donnington_kill 
	SafeKill \{nodeName = z_donnington_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_donnington_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_forum_kill 
	SafeKill \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_icecave_kill 
	SafeKill \{nodeName = z_icecave_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_icecave_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_meadowlands_kill 
	SafeKill \{nodeName = z_meadowlands_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_meadowlands_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_mop_kill 
	SafeKill \{nodeName = z_mop_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_mop_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_stone_kill 
	SafeKill \{nodeName = z_stone_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_stone_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script kingdiamond_introfx_tushino_kill 
	SafeKill \{nodeName = z_tushino_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_tushino_gfx_fx_ffwf_introflare
		noprefixwarning}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript

script fwtbt_introsnapshot 
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = strobe03
		UseSnapshotPositions = true
		save = true}
	kill \{prefix = z_forum_gfx_fx_smoke
		noprefixwarning}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare}
	SafeCreate \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	create \{prefix = z_forum_gfx_fx_ffwf_introflare}
	Wait \{7
		Seconds}
	LightShow_SetTime \{time = 1}
	create \{prefix = z_forum_gfx_fx_smoke}
	SafeKill \{nodeName = z_forum_gfx_fx_ffwf_introsmoke_01}
	kill \{prefix = z_forum_gfx_fx_ffwf_introflare}
endscript
