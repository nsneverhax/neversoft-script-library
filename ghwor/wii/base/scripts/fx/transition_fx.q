
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
