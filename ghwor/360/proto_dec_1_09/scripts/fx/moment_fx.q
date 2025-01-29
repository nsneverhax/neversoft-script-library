
script bandmember_sillhouette \{bandmember = vocalist
		flarepos = backleft
		flarecolor = [
			255
			255
			255
			128
		]}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = venue_bm_flare '%s_GFX_BM_Sill_Flare_01' s = <pakname> AddToStringLookup = true
	switch <bandmember>
		case GUITARIST
		formatText checksumName = startnode '%s_GFX_StartNodeRef_guitarist' s = <pakname> AddToStringLookup = true
		case vocalist
		formatText checksumName = startnode '%s_GFX_StartNodeRef_vocalist' s = <pakname> AddToStringLookup = true
		case BASSIST
		formatText checksumName = startnode '%s_GFX_StartNodeRef_bassist' s = <pakname> AddToStringLookup = true
		case drummer
		formatText checksumName = startnode '%s_GFX_StartNodeRef_drummer' s = <pakname> AddToStringLookup = true
	endswitch
	if NOT IsCreated <startnode>
		return
	endif
	if NOT IsCreated <venue_bm_flare>
		return
	endif
	switch <flarepos>
		case backleft
		<venue_bm_flare> :Obj_LockToObject objectName = <startnode> (-1.66, 1.938, -0.73199993)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		case backcenter
		<venue_bm_flare> :Obj_LockToObject objectName = <startnode> (0.0, 2.2, -1.0)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		case backright
		<venue_bm_flare> :Obj_LockToObject objectName = <startnode> (2.0609999, 1.8449999, -0.953)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		case frontleft
		<venue_bm_flare> :Obj_LockToObject objectName = <startnode> (-1.66, 0.64400005, 1.423)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		case frontright
		<venue_bm_flare> :Obj_LockToObject objectName = <startnode> (2.0609999, 0.73899996, 1.806)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		default
		spawnscript bandmember_sillhouette_turnoffflare params = {venueflare = <venue_bm_flare>}
	endswitch
endscript

script bandmember_sillhouette_turnonflare 
	changepasscolor {
		objID = <venueflare>
		material = bm_silhouetteflares_sub_backleft
		parameter = m_psPass0MaterialColor
		startcolor = [0 0 0 0]
		endcolor = [255 255 255 128]
		time = 0.2
	}
endscript

script bandmember_sillhouette_flarecolor 
	changepasscolor {
		objID = <venueflare>
		material = bm_silhouetteflares_sub_backleft
		parameter = m_psPass0MaterialColor
		startcolor = [0 0 0 0]
		endcolor = <flarecolor>
		time = 0.2
	}
endscript

script bandmember_sillhouette_turnoffflare 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = venue_bm_flare '%s_GFX_BM_Sill_Flare_01' s = <pakname> AddToStringLookup = true
	if NOT IsCreated <venue_bm_flare>
		return
	endif
	changepasscolor {
		objID = <venue_bm_flare>
		material = bm_silhouetteflares_sub_backleft
		parameter = m_psPass0MaterialColor
		startcolor = [255 255 255 128]
		endcolor = [0 0 0 0]
		time = 0.1
	}
endscript

script bandmembermoments_pyro \{bandmember = vocalist
		pyrotype = flames
		pyropos = backleft
		timemultiplier = 1.0}
	GetPakManCurrentName \{map = zones}
	switch <bandmember>
		case GUITARIST
		formatText checksumName = startnode '%s_GFX_StartNodeRef_guitarist' s = <pakname> AddToStringLookup = true
		case vocalist
		formatText checksumName = startnode '%s_GFX_StartNodeRef_vocalist' s = <pakname> AddToStringLookup = true
		case BASSIST
		formatText checksumName = startnode '%s_GFX_StartNodeRef_bassist' s = <pakname> AddToStringLookup = true
		case drummer
		formatText checksumName = startnode '%s_GFX_StartNodeRef_drummer' s = <pakname> AddToStringLookup = true
	endswitch
	if NOT IsCreated <startnode>
		return
	endif
	<front> = 0
	switch <pyropos>
		case backleft
		<pyropos1> = (-2.0, 0.0, 0.0)
		<pyropos2> = (-0.8, 0.0, -1.0)
		<pyropos3> = (-2.0, 0.0, -1.0)
		<pyropos4> = (-0.8, 0.0, -3.0)
		switch <pyrotype>
			case sparks
			spawnscript bandmember_sillhouette_pyro_sparks params = {pos1 = <pyropos1> pos2 = <pyropos2> pos3 = <pyropos3> pos4 = <pyropos4> front = 0 startnode = <startnode>}
			case flames
			spawnscript bandmember_sillhouette_pyro_flames {
				params = {
					pos1 = <pyropos1>
					pos2 = <pyropos2>
					pos3 = <pyropos3>
					pos4 = <pyropos4>
					startnode = <startnode>
					front = 0
					newtime = <timemultiplier>
				}
			}
			case Default
		endswitch
		case backcenter
		<pyropos1> = (1.0, 0.0, -2.0)
		<pyropos2> = (-1.0, 0.0, -2.0)
		<pyropos3> = (0.3, 0.0, -2.0)
		<pyropos4> = (-0.3, 0.0, -2.0)
		switch <pyrotype>
			case sparks
			spawnscript bandmember_sillhouette_pyro_sparks params = {pos1 = <pyropos1> pos2 = <pyropos2> pos3 = <pyropos3> pos4 = <pyropos4> front = 0 startnode = <startnode>}
			case flames
			spawnscript bandmember_sillhouette_pyro_flames {
				params = {
					pos1 = <pyropos1>
					pos2 = <pyropos2>
					pos3 = <pyropos3>
					pos4 = <pyropos4>
					startnode = <startnode>
					front = 0
					newtime = <timemultiplier>
				}
			}
			case Default
		endswitch
		case backright
		<pyropos1> = (2.0, 0.0, 0.0)
		<pyropos2> = (0.8, 0.0, -1.0)
		<pyropos3> = (2.0, 0.0, -1.0)
		<pyropos4> = (0.8, 0.0, -3.0)
		switch <pyrotype>
			case sparks
			spawnscript bandmember_sillhouette_pyro_sparks params = {pos1 = <pyropos1> pos2 = <pyropos2> pos3 = <pyropos3> pos4 = <pyropos4> front = 0 startnode = <startnode>}
			case flames
			spawnscript bandmember_sillhouette_pyro_flames {
				params = {
					pos1 = <pyropos1>
					pos2 = <pyropos2>
					pos3 = <pyropos3>
					pos4 = <pyropos4>
					startnode = <startnode>
					front = 0
					newtime = <timemultiplier>
				}
			}
			case Default
		endswitch
		case front
		<pyropos1> = (-1.0, 0.0, 1.0)
		<pyropos2> = (1.0, 0.0, 1.0)
		switch <pyrotype>
			case sparks
			spawnscript bandmember_sillhouette_pyro_sparks params = {pos1 = <pyropos1> pos2 = <pyropos2> front = 1 newtime = <timemultiplier> startnode = <startnode>}
			case flames
			spawnscript bandmember_sillhouette_pyro_flames params = {pos1 = <pyropos1> pos2 = <pyropos2> front = 1 newtime = <timemultiplier> startnode = <startnode>}
			case Default
		endswitch
		case Default
	endswitch
endscript

script bandmember_sillhouette_pyro_flames 
	<plumetime> = (1.3 * <newtime>)
	<bottomtime> = (1 * <newtime>)
	<glowtime> = ((4.1, 4.1) * <newtime>)
	GetUniqueCompositeobjectID \{preferredID = bmflames_01}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fireplume_attach_01 LifeTime = <plumetime> Pos = <pos1>} groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = bmflames_02}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fireplume_bottom_attach_01 LifeTime = <bottomtime> Pos = <pos1>} groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = bmflames_03}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_dragonfire_glow_attach_01 LifeRange = <glowtime> Pos = <pos1>} groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = bmflames_04}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fireplume_attach_01 LifeTime = <plumetime> Pos = <pos2>} groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = bmflames_05}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fireplume_bottom_attach_01 LifeTime = <bottomtime> Pos = <pos2>} groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = bmflames_06}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_dragonfire_glow_attach_01 LifeRange = <glowtime> Pos = <pos2>} groupID = zoneparticles
	if (<front> = 0)
		GetUniqueCompositeobjectID \{preferredID = bmflames_07}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fireplume_attach_01 LifeTime = <plumetime> Pos = <pos3>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmflames_08}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fireplume_bottom_attach_01 LifeTime = <bottomtime> Pos = <pos3>} groupID = zoneparticles
		Wait \{1
			Frame}
		GetUniqueCompositeobjectID \{preferredID = bmflames_09}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_dragonfire_glow_attach_01 LifeRange = <glowtime> Pos = <pos3>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmflames_10}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fireplume_attach_01 LifeTime = <plumetime> Pos = <pos4>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmflames_11}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fireplume_bottom_attach_01 LifeTime = <bottomtime> Pos = <pos4>} groupID = zoneparticles
		Wait \{1
			Frame}
		GetUniqueCompositeobjectID \{preferredID = bmflames_12}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_dragonfire_glow_attach_01 LifeRange = <glowtime> Pos = <pos4>} groupID = zoneparticles
	endif
endscript

script momentfx_pyrolights 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = moment_pyrolight '%s_LFX_MomentPyroLight' s = <pakname> AddToStringLookup = true
	MoveLight Name = <moment_pyrolight> Pos = <newerpyrolightpos>
	CallScriptOnNode Name = <moment_pyrolight> callBack_Script = momentfx_pyrolights_enable params = {}
	Wait \{3
		Seconds}
	CallScriptOnNode Name = <moment_pyrolight> callBack_Script = momentfx_pyrolights_disable params = {}
endscript

script momentfx_modulatepyrolights 
	setlightintensityovertime Name = <nodeName> i = 1.3 time = 0.2
	Wait <lightwaittime> Seconds
	printf 'lightwaittime is %p' p = <lightwaittime>
	setlightintensityovertime Name = <nodeName> i = 0 time = 0.8
endscript

script momentfx_pyrolights_enable 
	enablelight Name = <nodeName>
endscript

script momentfx_pyrolights_disable 
	disablelight Name = <Name>
endscript

script bandmember_sillhouette_pyro_sparks 
	GetUniqueCompositeobjectID \{preferredID = bmsparks_01}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fsc_frontflash_01 Align ApplyPositionOffset EnableRotate Pos = <pos1>} groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = bmsparks_02}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_pyro_baseflashes_01 Align ApplyPositionOffset EnableRotate Pos = <pos1>} groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = bmsparks_03}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_big_02 Align ApplyPositionOffset EnableRotate Pos = <pos1>} groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = bmsparks_04}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_big_03 Align ApplyPositionOffset EnableRotate Pos = <pos1>} groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = bmsparks_05}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_sparkfountain_frontglow_01 Align ApplyPositionOffset EnableRotate Pos = <pos1>} groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = bmsparks_06}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_insideglow_01 Align ApplyPositionOffset EnableRotate Pos = <pos1>} groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = bmsparks_07}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fsc_frontflash_01 Align ApplyPositionOffset EnableRotate Pos = <pos2>} groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = bmsparks_08}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_pyro_baseflashes_01 Align ApplyPositionOffset EnableRotate Pos = <pos2>} groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = bmsparks_09}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_big_02 Align ApplyPositionOffset EnableRotate Pos = <pos2>} groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = bmsparks_10}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_big_03 Align ApplyPositionOffset EnableRotate Pos = <pos2>} groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = bmsparks_11}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_sparkfountain_frontglow_01 Align ApplyPositionOffset EnableRotate Pos = <pos2>} groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = bmsparks_12}
	CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_insideglow_01 Align ApplyPositionOffset EnableRotate Pos = <pos2>} groupID = zoneparticles
	if (<front> = 0)
		GetUniqueCompositeobjectID \{preferredID = bmsparks_107}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fsc_frontflash_01 Align ApplyPositionOffset EnableRotate Pos = <pos3>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmsparks_108}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_pyro_baseflashes_01 Align ApplyPositionOffset EnableRotate Pos = <pos3>} groupID = zoneparticles
		Wait \{1
			Frame}
		GetUniqueCompositeobjectID \{preferredID = bmsparks_109}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_big_02 Align ApplyPositionOffset EnableRotate Pos = <pos3>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmsparks_110}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_big_03 Align ApplyPositionOffset EnableRotate Pos = <pos3>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmsparks_111}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_sparkfountain_frontglow_01 Align ApplyPositionOffset EnableRotate Pos = <pos3>} groupID = zoneparticles
		Wait \{1
			Frame}
		GetUniqueCompositeobjectID \{preferredID = bmsparks_112}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_insideglow_01 Align ApplyPositionOffset EnableRotate Pos = <pos3>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmsparks_1072}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_fsc_frontflash_01 Align ApplyPositionOffset EnableRotate Pos = <pos4>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmsparks_1082}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_pyro_baseflashes_01 Align ApplyPositionOffset EnableRotate Pos = <pos4>} groupID = zoneparticles
		Wait \{1
			Frame}
		GetUniqueCompositeobjectID \{preferredID = bmsparks_1092}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_big_02 Align ApplyPositionOffset EnableRotate Pos = <pos4>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmsparks_1102}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_big_03 Align ApplyPositionOffset EnableRotate Pos = <pos4>} groupID = zoneparticles
		GetUniqueCompositeobjectID \{preferredID = bmsparks_1112}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_sparkfountain_frontglow_01 Align ApplyPositionOffset EnableRotate Pos = <pos4>} groupID = zoneparticles
		Wait \{1
			Frame}
		GetUniqueCompositeobjectID \{preferredID = bmsparks_1122}
		CreateParticleSystem Name = <uniqueID> objID = <startnode> params_Script = {$gp_fx_groundsparks_insideglow_01 Align ApplyPositionOffset EnableRotate Pos = <pos4>} groupID = zoneparticles
	endif
endscript

script crowdspots \{angle = (-0.9, 0.0, 0.0)
		speed = 70
		Color = white
		intensitymultiplier = 1.0}
	GetPakManCurrentName \{map = zones}
	<i> = 1
	<valid_lights_list> = []
	begin
	formatText checksumName = object_id '%s_GFX_LH_RotLight_0%i' s = <pakname> i = <i> AddToStringLookup = true
	if IsCreated <object_id>
		formatText checksumName = housing '%s_GFX_LH_RotLight_0%i' s = <pakname> i = (<i>) AddToStringLookup = true
		formatText checksumName = dummy '%s_GFX_LH_RotLightDUMMY_0%i' s = <pakname> i = (<i>) AddToStringLookup = true
		formatText checksumName = vertexspot '%s_GFX_LH_RotLightVS_0%i' s = <pakname> i = (<i>) AddToStringLookup = true
		<light_objects_entry> = {housing = <housing> dummy = <dummy> vertexspot = <vertexspot>}
		<valid_lights_list> = (<valid_lights_list> + <light_objects_entry>)
	else
		break
	endif
	Wait \{1
		gameframe}
	<i> = (<i> + 1)
	repeat
	GetArraySize <valid_lights_list>
	if (<array_Size> = 0)
		return
	endif
	<i> = 0
	begin
	<light_objects> = (<valid_lights_list> [<i>])
	(<light_objects>.housing) :LightVolume_GetParams VolumeDensity = <VolumeDensity> hotspotintensity = <hotspotintensity> projectorintensity = <projectorintensity>
	CallScriptOnNode Name = (<light_objects>.housing) callBack_Script = crowdspots_colorandintensity {
		params = {
			Color = <Color>
			newvolumedensity = (<VolumeDensity> * <intensitymultiplier>)
			newhotspotintensity = (<hotspotintensity> * <intensitymultiplier>)
			newprojectorintensity = (<projectorintensity> * <intensitymultiplier>)
			venue_rotatinglights_lhs = (<light_objects>.housing)
			venue_rotatinglights_vss = (<light_objects>.vertexspot)
		}
	}
	(<light_objects>.housing) :Obj_LockToObject objectName = (<light_objects>.dummy) relangles = <angle>
	<myspeed> = (<speed> * Random (@ 0.75 @ -0.75 @ 1.25 @ -1.25 @ 1.0 @ -1.0 ))
	(<light_objects>.dummy) :Obj_RotY speed = <myspeed>
	CallScriptOnNode Name = (<light_objects>.vertexspot) callBack_Script = crowdspots_dovertexspotrotation {
		params = {
			venue_rotatinglights_lhs = (<light_objects>.housing)
			venue_rotatinglights_vss = (<light_objects>.vertexspot)
		}
	}
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script crowdspots_dovertexspotrotation 
	begin
	if NOT ((IsCreated <venue_rotatinglights_lhs>) && (IsCreated <venue_rotatinglights_vss>))
		break
	endif
	<venue_rotatinglights_lhs> :obj_getorientationvectors
	<direction_vector> = ((0.0, 0.0, 0.0) - <front_vector>)
	setlightdirection Name = <venue_rotatinglights_vss> vector = <direction_vector>
	Wait \{1
		Frame}
	repeat
endscript

script crowdspots_colorandintensity 
	switch <Color>
		case white
		<lhcolor> = [255 , 255 , 255]
		<vscolor> = (0.7, 0.7, 0.7)
		case red
		<lhcolor> = [251 , 134 , 134]
		<vscolor> = (0.8, 0.52, 0.52)
		case green
		<lhcolor> = [121 , 255 , 118]
		<vscolor> = (0.47, 0.8, 0.46)
		case blue
		<lhcolor> = [146 , 213 , 252]
		<vscolor> = (0.57, 0.83, 0.97999996)
		case yellow
		<lhcolor> = [250 , 255 , 101]
		<vscolor> = (0.85, 0.8, 0.29)
		case black
		<lhcolor> = [0 , 0 , 0]
		<vscolor> = (0.0, 0.0, 0.0)
		default
		return
	endswitch
	<venue_rotatinglights_lhs> :LightVolume_SetParams {
		VolumeColor = <lhcolor>
		ProjectorColor = <lhcolor>
		VolumeDensity = <newvolumedensity>
		hotspotintensity = <newhotspotintensity>
		projectorintensity = <newhotspotintensity>
	}
	SetLightColor Name = <venue_rotatinglights_vss> {
		LightColor = <vscolor>
	}
endscript

script crowdspots_off 
	GetPakManCurrentName \{map = zones}
	<i> = 1
	<valid_lights_list> = []
	begin
	formatText checksumName = object_id '%s_GFX_LH_RotLight_0%i' s = <pakname> i = <i> AddToStringLookup = true
	if IsCreated <object_id>
		formatText checksumName = housing '%s_GFX_LH_RotLight_0%i' s = <pakname> i = (<i>) AddToStringLookup = true
		formatText checksumName = dummy '%s_GFX_LH_RotLightDUMMY_0%i' s = <pakname> i = (<i>) AddToStringLookup = true
		formatText checksumName = vertexspot '%s_GFX_LH_RotLightVS_0%i' s = <pakname> i = (<i>) AddToStringLookup = true
		<light_objects_entry> = {housing = <housing> dummy = <dummy> vertexspot = <vertexspot>}
		<valid_lights_list> = (<valid_lights_list> + <light_objects_entry>)
	else
		break
	endif
	Wait \{1
		gameframe}
	<i> = (<i> + 1)
	repeat
	GetArraySize <valid_lights_list>
	if (<array_Size> = 0)
		return
	endif
	<i> = 0
	begin
	<light_objects> = (<valid_lights_list> [<i>])
	CallScriptOnNode Name = (<light_objects>.housing) callBack_Script = crowdspots_colorandintensity {
		params = {
			Color = black
			venue_rotatinglights_lhs = (<light_objects>.housing)
			venue_rotatinglights_vss = (<light_objects>.vertexspot)
		}
	}
	(<light_objects>.housing) :Obj_LockToObject objectName = (<light_objects>.dummy) relangles = <angle>
	(<light_objects>.dummy) :Obj_RotY speed = 0
	CallScriptOnNode Name = (<light_objects>.vertexspot) callBack_Script = crowdspots_dovertexspotrotation {
		params = {
			venue_rotatinglights_lhs = (<light_objects>.housing)
			venue_rotatinglights_vss = (<light_objects>.vertexspot)
		}
	}
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script momentfx_singlefrontspot \{bandmember = vocalist
		smoke = 0}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = frontspot '%s_GFX_LH_FrontSpot' s = <pakname> AddToStringLookup = true
	if NOT IsCreated <frontspot>
		return
	endif
	<frontspot> :LightVolume_SetParams {
		VolumeColor = [255 , 255 , 255]
		ProjectorColor = [255 , 255 , 255]
	}
	if NOT (<smoke> = 0)
		GetUniqueCompositeobjectID \{preferredID = momentsmoke_01}
		CreateParticleSystem Name = <uniqueID> objID = <bandmember> params_Script = $gp_p_momentsmoke_01 groupID = zoneparticles
	endif
endscript

script momentfx_singlefrontspot_off 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = frontspot '%s_GFX_LH_FrontSpot' s = <pakname> AddToStringLookup = true
	if NOT IsCreated <frontspot>
		return
	endif
	<frontspot> :LightVolume_SetParams {
		VolumeColor = [0 , 0 , 0]
		ProjectorColor = [0 , 0 , 0]
	}
endscript

script bandmembersillhouette_getoffset 
	vocalist :Obj_GetPosition
	printf 'vocalist pos is %p' p = <Pos>
	bandmemberpos = <Pos>
	z_subway_gfx_bm_sill_flare_frontright :Obj_GetPosition
	printf 'flare pos is %p' p = <Pos>
	flarepos = <Pos>
	newflarepos = (<flarepos> - <bandmemberpos>)
	printf 'newflarepos is %p' p = <newflarepos>
endscript

script bandmembermoments_setdarksnapshot 
	LightShow_PlaySnapshot \{Name = strobe01
		UseSnapshotPositions = true
		save = true}
endscript
