
script venueintro_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_cairo
		spawnscript \{venueintro_fx_cairo
			id = venuepyrofxkill}
		case z_mexicocity
		spawnscript \{venueintro_fx_mexicocity
			id = venuepyrofxkill}
		case z_subway
		spawnscript \{venueintro_fx_subway
			id = venuepyrofxkill}
		case z_montreux
		venueintro_fx_temp
		case z_paris
		venueintro_fx_temp
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
		case z_mexicocity
		venuefastintro_fx_mexicocity
		case z_subway
		venuefastintro_fx_subway
	endswitch
endscript

script venuefastintro_fx_temp 
	return
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
		case z_mexicocity
		LightShow_SetParams \{mood = ENCORE}
		LightShow_PlaySnapshot \{Name = encore06
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_mexicocity_pyro_special
			id = venuepyrofxkill}
		case z_subway
		LightShow_SetParams \{mood = exposition}
		LightShow_PlaySnapshot \{Name = exposition01
			UseSnapshotPositions = true
			save = true}
		spawnscript \{z_subway_pyro_special
			id = venuepyrofxkill}
	endswitch
endscript

script celebintro_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_cairo
		celebintro_fx_temp
		case z_easterisland
		celebintro_fx_temp
		case z_mexicocity
		celebintro_fx_mexicocity
		case z_subway
		celebintro_fx_temp
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
