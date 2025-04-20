
script land_effect_shake_and_vibrate \{frac = 1.0}
	return
	duration = (<frac> * $land_effect_shake_vibrate_duration)
	vibrate_percent = (<frac> * $land_effect_vibration_percent)
	shake_amp = (<frac> * $land_effect_shake_amplitude)
	shake_speed = (<frac> * $land_effect_shake_speed)
	ShakeCamera duration = <duration> vert_amp = <shake_amp> vert_vel = <shake_speed>
	vibrate actuator = 1 percent = <vibrate_percent> duration = <duration>
	vibrate actuator = 0 percent = <vibrate_percent> duration = <duration>
endscript

script land_effect_display_info_script 
	if NOT istrue \{$land_effect_display_info}
		return
	endif
	printf "Land effect *%a*: speed=%b" a = <text> b = <impact_speed>
endscript

script land_effect_play_dust 
	obj_getid
	obj_getposition
	getuniquecompositeobjectid preferredid = LandImpactDust01
	if <objid> :profileequals is_named = GrimRipper
		if gotparam medium
			getuniquecompositeobjectid preferredid = LandImpactBurst01
			createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Medium_Burst_Grim
			getuniquecompositeobjectid preferredid = LandImpactSmoke01
			createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Medium_Smoke_Grim
		else
			getuniquecompositeobjectid preferredid = LandImpactBurst01
			createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Large_Burst_Grim
			getuniquecompositeobjectid preferredid = LandImpactSmoke01
			createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Large_Smoke_Grim
		endif
	else
		FeelerCheck start_pos = (<pos> + (0.0, 1.0, 0.0)) end_pos = (<pos> - (0.0, 1.0, 0.0))
		getuniquecompositeobjectid preferredid = LandImpactDust01
		if gotparam medium
			if gotparam hit_terrain
				switch <hit_terrain>
					case
					terrain_shallowwaterpooltile
					terrain_water
					terrain_waterpuddle
					terrain_watershallow
					createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Medium_Water01
					default
					createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Medium_Dust01
				endswitch
			else
				createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Medium_Dust01
			endif
		else
			printstruct <...>
			if gotparam hit_terrain
				switch <hit_terrain>
					case
					terrain_shallowwaterpooltile
					terrain_water
					terrain_waterpuddle
					terrain_watershallow
					createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Large_Water01
					default
					createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Large_Dust01
				endswitch
			else
				createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Large_Dust01
			endif
		endif
	endif
	if gotparam medium
		TriggerExplosion pos = <pos> magnitude = 50 distance = 50
	else
		TriggerExplosion pos = <pos> magnitude = 1050 distance = 100
	endif
endscript

script land_effect_play_wave 
	obj_getid
	getuniquecompositeobjectid \{preferredid = LandImpactFX01}
	if <objid> :profileequals is_named = GrimRipper
		createflexibleparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_LandImpact_Large_Shockwave_Grim
	else
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = bone_ankle_l params_script = $GP_LandImpact_Large
	endif
endscript

script land_effect_fire 
	if landedfromvert
		return
	endif
	medium_frac = ($land_effect_medium_percent / 100.0)
	small_frac = ($land_effect_small_percent / 100.0)
	getgroundimpactspeed
	land_type = `default`
	if (<impact_speed> > ($land_effect_impact_speed * <medium_frac>))
		<land_type> = medium
	endif
	if (<impact_speed> > $land_effect_impact_speed)
		<land_type> = large
	endif
	if gotparam force_type
		<land_type> = <force_type>
	endif
	switch <land_type>
		case medium
		land_effect_display_info_script text = "Medium" impact_speed = <impact_speed>
		land_effect_play_dust medium
		land_effect_shake_and_vibrate frac = <medium_frac>
		case large
		land_effect_display_info_script text = "Large" impact_speed = <impact_speed>
		land_effect_play_dust
		land_effect_play_wave
		land_effect_shake_and_vibrate frac = 1.0
		default
		land_effect_display_info_script text = "Small" impact_speed = <impact_speed>
		land_effect_shake_and_vibrate frac = <small_frac>
	endswitch
	sound_mod = (0.125 * <impact_speed>)
	soundevent event = Skater_landing_Explosion_SFX airtime = <sound_mod>
endscript
