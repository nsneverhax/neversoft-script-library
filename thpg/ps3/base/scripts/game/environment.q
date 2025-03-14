oldphysicsexplosionmultiplier = 2.0

script TriggerExplosion magnitude = 2.0 distance = 20.0
	exp_pos = <pos>
	if gotparam includeskater
		if gotparam bail
			skater :obj_getposition
			delta = (<pos> - <exp_pos>)
			vectorlength vector = <delta>
			if (<length> < <BailTolerance>)
				runscriptonobject {id = skater ExplosionBail}
			endif
		endif
		HavokExplosion pos = <exp_pos> magnitude = <magnitude> distance = <distance> includeskater
	else
		HavokExplosion pos = <exp_pos> magnitude = <magnitude> distance = <distance>
	endif
endscript

script ExplosionBail 
	obj_spawnscriptnow \{ForcedBail}
endscript

script fade_in_geom time = 1.0 property = m_pspass0materialcolor
	if (<time> = 0)
		geom_setmaterialalpha 1 property = <property> material = <material>
	else
		alpha = 0.0
		framerate = (1.0 / 30.0)
		begin
		alpha = (<alpha> + (<framerate> / <time>))
		if (<alpha> > 1.0)
			alpha = 1.0
		endif
		wait 1 gameframe
		geom_setmaterialalpha <alpha> property = <property> material = <material>
		if (<alpha> = 1.0)
			return
		endif
		repeat
	endif
endscript

script fade_out_geom time = 1.0 property = m_pspass0materialcolor
	if (<time> = 0)
		geom_setmaterialalpha 0 property = <property> material = <material>
	else
		alpha = 1.0
		framerate = (1.0 / 30.0)
		begin
		alpha = (<alpha> - (<framerate> / <time>))
		if (<alpha> < 0.0)
			alpha = 0.0
		endif
		wait 1 gameframe
		geom_setmaterialalpha <alpha> property = <property> material = <material>
		if (<alpha> = 0.0)
			return
		endif
		repeat
	endif
endscript

script Stop_Rain_and_FreezeWeather 
	printf \{"*** Stop_Rain_and_FreezeWeather ***"}
	change \{FreezeWeather = 1}
	killspawnedscript \{name = Rain_Start_Rain}
	killspawnedscript \{name = Rain_Stop_Rain}
	killspawnedscript \{id = Rain_Transition}
	killspawnedscript \{name = TOD_Manager_Create_Weather_Cycle}
	Rain_Do_Rain_Transition \{i = 0
		time = 0}
	Rain_Do_Puddles_Transition \{i = 0
		time = 3}
	Rain_Do_Lighting_Transition \{i = 0
		time = 2}
endscript

script UnFreezeWeather 
	printf \{"*** UnFreezeWeather ***"}
	change \{FreezeWeather = 0}
	spawnscriptnow \{TOD_Manager_Create_Weather_Cycle
		params = {
			do_initial_setup = false
		}}
endscript

script Update_Wind 
	if NOT gotparam \{wind}
		scriptassert \{"did not get wind parameter"}
	endif
	engineconfig wind = <wind>
endscript

script Setup_Global_Wind 
	gustThreshold = 0.8
	linearmap result = strength from = $MinWindStrength to = $MaxWindStrength basedon = RandomRange (0.01, 1.01) lowerbound = 0.0 upperbound = 1.0
	wind = (<strength> * (0.5, 0.0, 1.0))
	oldWind = <wind>
	Destroy_GustFX
	if innetgame
		if NOT ishost
			return
		endif
	endif
	begin
	if ($CycleWeather = 0)
		wait 1 gameframe
	else
		spawnscriptlater {
			Update_Wind
			params = {
				wind = <wind>
			}
			netenabled = 1
		}
		useOldWind = 0
		spawnscriptlater {
			Update_WindFX
			params = {
				strength = <strength>
			}
			netenabled = 1
		}
		if (<strength> > <gustThreshold>)
			gustTime = (RandomRange (2.01, 5.01) / <strength>)
			spawnscriptlater {
				Create_GustFX
				params = {
					strength = <strength>
				}
				netenabled = 1
			}
			wait <gustTime> seconds
			spawnscriptlater {
				Destroy_GustFX
				netenabled = 1
			}
			if (RandomRange (0.0, 3.0) = 0)
				useOldWind = 1
			endif
		else
			wait RandomRange (5.0, 45.0) seconds
		endif
		if ($CycleWeather = 1)
			if (<useOldWind> = 1)
				normalizevector <oldWind>
			else
				dirx = RandomRange (0.1, 1.0)
				if (RandomRange (0.0, 1.0) = 0)
					dirx = (-1.0 * <dirx>)
				endif
				dirZ = RandomRange (0.1, 1.0)
				if (RandomRange (0.0, 1.0) = 0)
					dirZ = (-1.0 * <dirx>)
				endif
				normalizevector (<dirx> * (1.0, 0.0, 0.0) + <dirZ> * (0.0, 0.0, 1.0))
			endif
			oldWind = <wind>
			linearmap result = strength from = $MinWindStrength to = $MaxWindStrength basedon = RandomRange (0.01, 1.01) lowerbound = 0.0 upperbound = 1.0
			wind = (<strength> * <norm>)
		endif
	endif
	repeat
endscript

script Update_WindFX 
	get_level_prefix
	if gotparam prefix
		linearmap result = newEmitRate from = 0.5 to = 1.5 basedon = <strength> lowerbound = ($RainWet.WindStrengthX) upperbound = ($RainWet.WindStrengthY)
		i = 1
		begin
		formattext checksumname = leafID '%p_GFX_Wind_FallingLeaves%d' p = <prefix> d = <i>
		if iscreated <leafID>
			<leafID> :emitrate rate = <newEmitRate>
		endif
		i = (<i> + 1)
		repeat 10
	endif
endscript

script Create_GustFX 
	get_level_prefix
	if gotparam prefix
		linearmap result = newEmitRate from = 0.5 to = 7.0 basedon = <strength> lowerbound = ($RainWet.WindStrengthX) upperbound = ($RainWet.WindStrengthY)
		i = 1
		begin
		formattext checksumname = leafID '%p_GFX_Wind_FallingLeaves%d' p = <prefix> d = <i>
		if iscreated <leafID>
			<leafID> :emitrate rate = <newEmitRate>
		endif
		i = (<i> + 1)
		repeat 10
		i = 1
		begin
		formattext checksumname = leafID '%p_GFX_Wind_Leaves%d' p = <prefix> d = <i>
		if iscreated <leafID>
			switch <prefix>
				case 'Z_Monuments'
				case 'Z_Museums'
				<leafID> :emitrate rate = (<strength> * RandomRange (5.0, 10.0))
				default
				<leafID> :emitrate rate = (<strength> * RandomRange (10.0, 20.0))
			endswitch
		endif
		i = (<i> + 1)
		repeat 10
		i = 1
		begin
		formattext checksumname = trashID '%p_GFX_Wind_Trash%d' p = <prefix> d = <i>
		if iscreated <trashID>
			switch <prefix>
				case 'Z_Monuments'
				case 'Z_Museums'
				<trashID> :emitrate rate = (<strength> * RandomRange (1.0, 3.0))
				default
				<trashID> :emitrate rate = (<strength> * RandomRange (3.0, 6.0))
			endswitch
		endif
		i = (<i> + 1)
		repeat 10
	endif
endscript

script Destroy_GustFX 
	get_level_prefix
	if gotparam prefix
		i = 1
		begin
		formattext checksumname = leafID '%p_GFX_Wind_FallingLeaves%d' p = <prefix> d = <i>
		if iscreated <leafID>
			<leafID> :emitrate rate = 0.5
		endif
		i = (<i> + 1)
		repeat 10
		i = 1
		begin
		formattext checksumname = leafID '%p_GFX_Wind_Leaves%d' p = <prefix> d = <i>
		if iscreated <leafID>
			<leafID> :emitrate rate = 0
		endif
		i = (<i> + 1)
		repeat 10
		i = 1
		begin
		formattext checksumname = trashID '%p_GFX_Wind_Trash%d' p = <prefix> d = <i>
		if iscreated <trashID>
			<trashID> :emitrate rate = 0
		endif
		i = (<i> + 1)
		repeat 10
	endif
endscript

script Setup_Skater_Wind 
	windTime = 0.05
	getuniquecompositeobjectid \{preferredid = skaterWind01}
	begin
	if iscreated \{skater}
		skater :obj_getvelocity
		skater :obj_getposition
		enginewind create = {
			name = <uniqueid>
			type = direction
			pos = (<pos> + (0.0, 1.0, 0.0))
			velocity = (5 * <vel>)
			range = 1
			attenuation = inv_distance
			time = <windTime>
		}
	endif
	wait <windTime> seconds
	repeat
endscript
FreezeWeather = 0
CycleWeather = 1
RainChance = 10
CurRainIntensity = 0.0
currainpuddlesintensity = 0.0
CurRainLightingIntensity = 0.0
CurMidDomeIntensity = 0.0
CurInnerDomeIntensity = 0.0
MinWindStrength = 0.1
MaxWindStrength = 2.2
CurZone = 'unset'

script TOD_Manager_Create_Weather_Cycle do_initial_setup = true
	if (<do_initial_setup> = true)
		spawnscriptlater Setup_Global_Wind
		Rain_Do_Rain_Transition start = $RainDry end = $RainWet i = ($CurRainIntensity) time = 0
		Rain_Do_Lighting_Transition start = $RainDry end = $RainWet i = ($CurRainLightingIntensity) time = 0
	endif
	if innetgame
		if NOT ishost
			return
		endif
	endif
	get_level_prefix
	if gotparam prefix
		change CurZone = <prefix>
	endif
	begin
	if ($FreezeWeather = 1)
		wait 1 gameframe
	elseif ($CycleWeather = 0)
		wait 1 gameframe
	else
		Rain_Update_RainChance
		raining = 0
		if (RandomRange (1.0, 100.0) < $RainChance)
			raining = 1
			intensity = RandomRange (0.5, 1.0)
			time = RandomRange (20.0, 30.0)
			killspawnedscript name = Rain_Start_Rain
			killspawnedscript name = Rain_Stop_Rain
			killspawnedscript id = Rain_Transition
			spawnscriptlater {
				Rain_Start_Rain
				params = {
					intensity = <intensity>
					time = <time>
				}
				netenabled = 1
			}
		elseif NOT ($CurRainIntensity = 0)
			raining = 0
			time = RandomRange (15.0, 30.0)
			killspawnedscript name = Rain_Start_Rain
			killspawnedscript name = Rain_Stop_Rain
			killspawnedscript id = Rain_Transition
			spawnscriptlater {
				Rain_Stop_Rain
				params = {
					time = <time>
				}
				netenabled = 1
			}
		endif
		if (<raining> = 0)
			waittime = RandomRange (60.0, 90.0)
		else
			waittime = RandomRange (90.0, 120.0)
		endif
		begin
		wait 1 second
		get_level_prefix
		if gotparam prefix
			if NOT (<prefix> = $CurZone)
				change CurZone = <prefix>
				killspawnedscript name = Rain_Start_Rain
				killspawnedscript name = Rain_Stop_Rain
				killspawnedscript id = Rain_Transition
				if (<raining> = 0)
					time = RandomRange (7.0, 15.0)
					spawnscriptlater {
						Rain_Stop_Rain
						params = {
							time = <time>
						}
						netenabled = 1
					}
				else
					time = RandomRange (10.0, 15.0)
					spawnscriptlater {
						Rain_Start_Rain
						params = {
							intensity = <intensity>
							time = <time>
						}
						netenabled = 1
					}
				endif
			endif
		endif
		repeat <waittime>
		wait 1 second
	endif
	repeat
endscript

script Rain_Start_Rain 
	printf "Start Rain"
	killspawnedscript id = Rain_Transition
	if (<intensity> < $CurRainIntensity)
		spawnscriptlater Rain_Do_Rain_Transition id = Rain_Transition params = {start = $RainDry end = $RainWet i = <intensity> time = (<time> / 2.0)}
		wait (<time> / 2.0) seconds
		spawnscriptlater Rain_Do_Lighting_Transition id = Rain_Transition params = {start = $RainDry end = $RainWet i = <intensity> time = <time>}
	else
		spawnscriptlater Rain_Do_Lighting_Transition params = {start = $RainDry end = $RainWet i = <intensity> time = (<time> / 2.0)}
		wait (<time> / 2.0) seconds
		spawnscriptlater Rain_Do_Rain_Transition params = {start = $RainDry end = $RainWet i = <intensity> time = <time>}
	endif
	wait (<time> / 3.0) seconds
	spawnscriptlater Rain_Do_Puddles_Transition id = Rain_Transition params = {start = $RainDry end = $RainWet i = <intensity> time = <time>}
endscript

script Rain_Stop_Rain 
	printf "Stop Rain"
	killspawnedscript id = Rain_Transition
	spawnscriptlater Rain_Do_Rain_Transition id = Rain_Transition params = {start = $RainDry end = $RainWet i = 0 time = (<time> / 2.0)}
	wait (<time> / 2.0) seconds
	spawnscriptlater Rain_Do_Lighting_Transition id = Rain_Transition params = {start = $RainDry end = $RainWet i = 0 time = <time>}
	wait (<time> / 3.0) seconds
	spawnscriptlater Rain_Do_Puddles_Transition id = Rain_Transition params = {start = $RainDry end = $RainWet i = 0 time = <time>}
endscript

script Rain_Update_RainChance 
	get_level_prefix
	if gotparam prefix
		switch <prefix>
			case 'Z_FDR'
			change RainChance = 20
			case 'Z_Love'
			change RainChance = 15
			case 'Z_Slums'
			change RainChance = 30
			case 'Z_Bell'
			change RainChance = 30
			case 'PB_Bridge'
			change RainChance = 15
			case 'Z_BCity'
			change RainChance = 6
			case 'Z_Harbor'
			change RainChance = 5
			case 'Z_Lansdowne'
			change RainChance = 4
			case 'Z_BW_Bridge'
			change RainChance = 3
			case 'Z_Monuments'
			case 'Z_Museums'
			case 'Z_Museum_Int'
			change RainChance = 3
			case 'Z_WP_Bridge'
			change RainChance = 5
			case 'Z_Crib'
			case 'Z_Secret'
			change RainChance = 0
			case 'Z_Viewer'
			change RainChance = 10
		endswitch
	else
		change RainChance = 0
	endif
endscript
RainDry = {
	RainNumber = 0.0
	windmultiplier = 1.0
	RainSizeX = 0.03
	RainSizeY = 0.5
	alphascale = 0.4
	rainripples = 0.0
	WaterNormalMapRangeX = 12.0
	WaterNormalMapRangeY = 12.0
	rainrippleinitialforce = 0.1
	rainrippleinitialsize = 0.3
	refintensity = 0.0
	darkintensity = 0.1
	puddlethresh = 1.0
	waterthresh = 1.0
	SunDirLightIntensity = 1.24
	PRTLightIntensity = 0.3
	AmbientLightIntensity = 0.27
	VCAmbientLightIntensity = 1.0
	LSAmbientLightIntensity = 1.0
	LightShadowIntensity = 1.0
	ShadowBackLightShadowIntensity = 0.368
	ShadowPRTLightShadowIntensity = 0.5398
	SunShadowLightShadowIntensity = 1.1534
	PRTShadowIntensity = 0.8
	DynamicShadowIntensity = 0.6
	WindStrengthX = 0.1
	WindStrengthY = 2.2
}
RainWet = {
	RainNumber = 3000.0
	windmultiplier = 3.0
	RainSizeX = 0.03
	RainSizeY = 0.5
	alphascale = 0.4
	rainripples = 5.0
	WaterNormalMapRangeX = 12.0
	WaterNormalMapRangeY = 12.0
	rainrippleinitialforce = 0.1
	rainrippleinitialsize = 0.3
	refintensity = 0.5
	darkintensity = 0.275
	puddlethresh = 0.35000002
	waterthresh = 0.55
	SunDirLightIntensity = 0.319
	PRTLightIntensity = 0.528
	AmbientLightIntensity = 0.33
	VCAmbientLightIntensity = 0.5
	LSAmbientLightIntensity = 0
	LightShadowIntensity = 0.8
	ShadowBackLightShadowIntensity = 0.184
	ShadowPRTLightShadowIntensity = 0.7361999
	SunShadowLightShadowIntensity = 1.1534
	PRTShadowIntensity = 0.7
	DynamicShadowIntensity = 0.3
	WindStrengthX = 0.2
	WindStrengthY = 3.2
}

script Rain_Do_Rain_Transition start = $RainDry end = $RainWet i = 0.0 time = 30
	linearmap result = newRainNumber from = (<start>.RainNumber) to = (<end>.RainNumber) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	casttointeger newRainNumber
	linearmap result = newWindMultiplier from = (<start>.windmultiplier) to = (<end>.windmultiplier) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newRainSizeX from = (<start>.RainSizeX) to = (<end>.RainSizeX) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newRainSizeY from = (<start>.RainSizeY) to = (<end>.RainSizeY) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newAlphaScale from = (<start>.alphascale) to = (<end>.alphascale) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	gpurain number = <newRainNumber> windmultiplier = <newWindMultiplier> size = (<newRainSizeX> * (1.0, 0.0) + <newRainSizeY> * (0.0, 1.0)) alphascale = <newAlphaScale> time = <time>
	Adjust_Rain_SFX_Intensity intensity = $CurRainIntensity
	if NOT (<time> = 0)
		steptime = 0.1
		numsteps = (<time> / <steptime>)
		stepsize = ((<i> - $CurRainIntensity) / <numsteps>)
		casttointeger numsteps
		curI = $CurRainIntensity
		begin
		curI = (<curI> + <stepsize>)
		Rain_Set_Intensity start = <start> end = <end> i = <curI>
		wait <steptime> seconds
		repeat <numsteps>
	endif
	Rain_Set_Intensity start = <start> end = <end> i = <i>
endscript

script Rain_Set_Intensity start = $RainDry end = $RainWet i = 0
	linearmap result = newRainRipples from = (<start>.rainripples) to = (<end>.rainripples) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newWaterNormalMapRangeX from = (<start>.WaterNormalMapRangeX) to = (<end>.WaterNormalMapRangeY) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newWaterNormalMapRangeY from = (<start>.WaterNormalMapRangeY) to = (<end>.WaterNormalMapRangeY) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newRainRippleInitialForce from = (<start>.rainrippleinitialforce) to = (<end>.rainrippleinitialforce) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newRainRippleInitialSize from = (<start>.rainrippleinitialsize) to = (<end>.rainrippleinitialsize) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	engineconfig rainripples = <newRainRipples> waternormalmaprange = (<newWaterNormalMapRangeX> * (1.0, 0.0) + <newWaterNormalMapRangeY> * (0.0, 1.0)) rainrippleinitialforce = <newRainRippleInitialForce> rainrippleinitialsize = <newRainRippleInitialSize>
	linearmap result = newWindStrengthX from = (<start>.WindStrengthX) to = (<end>.WindStrengthX) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	change MinWindStrength = <newWindStrengthX>
	linearmap result = newWindStrengthY from = (<start>.WindStrengthY) to = (<end>.WindStrengthY) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	change MaxWindStrength = <newWindStrengthY>
	change CurRainIntensity = <i>
	Adjust_Rain_SFX_Intensity intensity = $CurRainIntensity
endscript

script Rain_Do_Puddles_Transition start = $RainDry end = $RainWet i = 0.0 time = 30
	if NOT (<time> = 0)
		steptime = 0.1
		numsteps = (<time> / <steptime>)
		stepsize = ((<i> - $currainpuddlesintensity) / <numsteps>)
		casttointeger numsteps
		curI = $currainpuddlesintensity
		begin
		curI = (<curI> + <stepsize>)
		Puddles_Set_Intensity start = <start> end = <end> i = <curI>
		wait <steptime> seconds
		repeat <numsteps>
	endif
	Puddles_Set_Intensity start = <start> end = <end> i = <i>
endscript

script Puddles_Set_Intensity start = $RainDry end = $RainWet i = 0
	linearmap result = newRefIntensity from = (<start>.refintensity) to = (<end>.refintensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newDarkIntensity from = (<start>.darkintensity) to = (<end>.darkintensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newPuddleThresh from = (<start>.puddlethresh) to = (<end>.puddlethresh) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newWaterThresh from = (<start>.waterthresh) to = (<end>.waterthresh) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	SetWetEffectParams refintensity = <newRefIntensity> darkintensity = <newDarkIntensity> puddlethresh = <newPuddleThresh> waterthresh = <newWaterThresh>
	change currainpuddlesintensity = <i>
endscript

script Rain_Do_Lighting_Transition start = $RainDry end = $RainWet i = 0.0 time = 30
	targetMidDomeI = 0.0
	targetInnerDomeI = 0.0
	get_level_prefix
	if gotparam prefix
		switch <prefix>
			case 'Z_Love'
			case 'Z_Bell'
			case 'Z_Slums'
			case 'Z_FDR'
			case 'Z_PB_Bridge'
			if (<i> > 0.7)
				targetMidDomeI = 0.0
				targetInnerDomeI = 1.0
			else
				targetMidDomeI = 1.0
				targetInnerDomeI = 0.0
			endif
			case 'Z_Museums'
			case 'Z_Museum_Int'
			case 'Z_Monuments'
			case 'Z_WP_Bridge'
			if (<i> < 0.2)
				targetMidDomeI = 0.0
				targetInnerDomeI = 0.0
			else
				targetMidDomeI = 0.0
				targetInnerDomeI = 1.0
			endif
			default
			if (<i> = 0)
				targetMidDomeI = 0.0
				targetInnerDomeI = 0.0
			elseif (<i> > 0.7)
				targetMidDomeI = 0.0
				targetInnerDomeI = 1.0
			else
				targetMidDomeI = 1.0
				targetInnerDomeI = 0.0
			endif
		endswitch
	endif
	if (<i> <= 0.5)
		tod_proxim_update_lightfx fxparam = default_tod_manager time = <time>
	else
		tod_proxim_update_lightfx fxparam = RAIN2_tod_manager time = <time>
	endif
	if NOT (<time> = 0)
		steptime = 0.1
		numsteps = (<time> / <steptime>)
		stepsize = ((<i> - $CurRainLightingIntensity) / <numsteps>)
		curI = $CurRainLightingIntensity
		midDomeStepSize = ((<targetMidDomeI> - $CurMidDomeIntensity) / <numsteps>)
		curMidDomeI = $CurMidDomeIntensity
		innerDomeStepSize = ((<targetInnerDomeI> - $CurInnerDomeIntensity) / <numsteps>)
		curInnerDomeI = $CurInnerDomeIntensity
		casttointeger numsteps
		begin
		curI = (<curI> + <stepsize>)
		curMidDomeI = (<curMidDomeI> + <midDomeStepSize>)
		curInnerDomeI = (<curInnerDomeI> + <innerDomeStepSize>)
		Rain_Set_Lighting_Intensity start = <start> end = <end> i = <curI> midDomeI = <curMidDomeI> innerDomeI = <curInnerDomeI>
		wait <steptime> seconds
		repeat <numsteps>
	endif
	Rain_Set_Lighting_Intensity start = <start> end = <end> i = <i> midDomeI = <targetMidDomeI> innerDomeI = <targetInnerDomeI>
endscript

script Rain_Set_Lighting_Intensity start = $RainDry end = $RainWet i = 0
	linearmap result = newSunDirLightIntensity from = (<start>.SunDirLightIntensity) to = (<end>.SunDirLightIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newPRTLightIntensity from = (<start>.PRTLightIntensity) to = (<end>.PRTLightIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newAmbientLightIntensity from = (<start>.AmbientLightIntensity) to = (<end>.AmbientLightIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newVCAmbientLightIntensity from = (<start>.VCAmbientLightIntensity) to = (<end>.VCAmbientLightIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newLSAmbientLightIntensity from = (<start>.LSAmbientLightIntensity) to = (<end>.LSAmbientLightIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newLightShadowIntensity from = (<start>.LightShadowIntensity) to = (<end>.LightShadowIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newShadowBackLightShadowIntensity from = (<start>.ShadowBackLightShadowIntensity) to = (<end>.ShadowBackLightShadowIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newShadowPRTLightShadowIntensity from = (<start>.ShadowPRTLightShadowIntensity) to = (<end>.ShadowPRTLightShadowIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newSunShadowLightShadowIntensity from = (<start>.SunShadowLightShadowIntensity) to = (<end>.SunShadowLightShadowIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newPRTShadowIntensity from = (<start>.PRTShadowIntensity) to = (<end>.PRTShadowIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	linearmap result = newDynamicShadowIntensity from = (<start>.DynamicShadowIntensity) to = (<end>.DynamicShadowIntensity) basedon = <i> lowerbound = 0.0 upperbound = 1.0
	setlightintensity name = Z_WORLD_LFX_Sun intensity = <newSunDirLightIntensity>
	setlightintensity name = Z_WORLD_LFX_Prt intensity = <newPRTLightIntensity>
	setlightintensity name = Z_WORLD_LFX_Ambient intensity = <newAmbientLightIntensity>
	setlightintensity name = VCAmbient intensity = <newVCAmbientLightIntensity>
	setlightintensity name = LSAmbient intensity = <newLSAmbientLightIntensity>
	SetLightShadowIntensity name = Z_WORLD_LFX_Sun shadowintensity = <newLightShadowIntensity>
	SetLightShadowIntensity name = Z_WORLD_LFX_Shadow_Back shadowintensity = <newShadowBackLightShadowIntensity>
	SetLightShadowIntensity name = Z_WORLD_LFX_Shadow_PRT shadowintensity = <newShadowPRTLightShadowIntensity>
	SetLightShadowIntensity name = Z_WORLD_LFX_Sun_Shadow shadowintensity = <newSunShadowLightShadowIntensity>
	SetPRTShadowIntensity i = <newPRTShadowIntensity>
	setdynamicshadowintensity i = <newDynamicShadowIntensity>
	if iscreated S_Default_PH_SkyDome
		jow_vectortorgba rgb = (255.0, 255.0, 255.0) a = (255.0 * <midDomeI>)
		updatematerialproperty {
			object = S_Default_PH_SkyDome
			material = Skate9Sky_Skate9Sky
			parameter = m_pspass1materialcolor
			value = <rgba>
		}
		jow_vectortorgba rgb = (255.0, 255.0, 255.0) a = (255.0 * <innerDomeI>)
		updatematerialproperty {
			object = S_Default_PH_SkyDome
			material = Skate9Sky_Skate9Sky
			parameter = m_pspass2materialcolor
			value = <rgba>
		}
	endif
	change CurRainLightingIntensity = <i>
	change CurMidDomeIntensity = <midDomeI>
	change CurInnerDomeIntensity = <innerDomeI>
endscript
