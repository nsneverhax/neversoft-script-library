
script venueintro_fx 
	getpakmancurrent \{map = zones}
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
	lightshow_setparams \{mood = intro}
	wait \{5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = blackout}
	wait \{1
		second}
	spawnscript \{z_cairo_pyro_intro
		id = venuepyrofxkill}
endscript

script venueintro_fx_mexicocity 
	lightshow_setparams \{mood = intro}
	wait \{5.0
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = blackout}
	wait \{0.5
		seconds}
	spawnscript \{z_mexicocity_pyro_intro
		id = venuepyrofxkill}
endscript

script venueintro_fx_temp 
	return
endscript

script venueintro_fx_subway 
	lightshow_setparams \{mood = intro}
	spawnscript \{z_subway_trainintro
		id = venuepyrofxkill}
	wait \{5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = starpower}
	lightshow_playsnapshot \{name = starpower01
		usesnapshotpositions = true
		save = true}
	lightshow_settime \{time = 1}
	wait \{0.3
		seconds}
	spawnscript \{z_subway_pyro_intro
		id = venuepyrofxkill}
endscript

script turnoffnodeflags 
	changenodeflag \{ls_mood_flare
		0}
	changenodeflag \{ls_mood_climax
		0}
	changenodeflag \{ls_mood_exposition
		0}
	changenodeflag \{ls_mood_falling
		0}
	changenodeflag \{ls_mood_prelude
		0}
	changenodeflag \{ls_mood_rising
		0}
	changenodeflag \{ls_mood_starpower
		0}
	changenodeflag \{ls_mood_resolution
		0}
	changenodeflag \{ls_mood_pyro
		0}
	changenodeflag \{ls_mood_blackout
		0}
	changenodeflag \{ls_mood_intro
		0}
	changenodeflag \{ls_mood_silhouette
		0}
	changenodeflag \{ls_mood_tension
		0}
	changenodeflag \{ls_mood_wash
		0}
	changenodeflag \{ls_mood_strobe
		0}
	changenodeflag \{ls_mood_menu
		0}
endscript

script turnoffencoregodray 
	if screenfx_fxinstanceexists \{viewport = bg_viewport
			name = godray}
		screenfx_updatefxinstanceparams \{viewport = bg_viewport
			name = godray
			scefname = godray
			type = godray
			on = 0
			lightsource = object}
	endif
endscript

script venuefastintro_fx 
	getpakmancurrent \{map = zones}
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
	killspawnedscript \{name = venueintro_fx_cairo}
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
endscript

script venuefastintro_fx_destroyparticles 
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
endscript

script venuefastintro_fx_subway 
	killspawnedscript \{name = venueintro_fx_subway}
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	if NOT scriptisrunning \{z_subway_train01}
		z_subway_train01
	endif
endscript

script venuefastintro_fx_mexicocity 
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	safekill \{nodename = z_mexicocity_gfx_fx_spinnerwheel_01}
	safekill \{nodename = z_mexicocity_gfx_fx_spinnerwheel_02}
	safekill \{nodename = z_mexicocity_gfx_fx_spinnersmoke_01}
	safekill \{nodename = z_mexicocity_gfx_fx_spinnersmoke_02}
	safekill \{nodename = z_mexicocity_gfx_fx_staticspinnersparks_01}
	safekill \{nodename = z_mexicocity_gfx_fx_staticspinnersparks_02}
endscript

script songwon_fx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_cairo
		lightshow_setparams \{mood = resolution}
		lightshow_playsnapshot \{name = resolution01
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_cairo_pyro_moments_front_2
			id = venuepyrofxkill}
		spawnscript \{z_cairo_pyro_moments_mid_1
			id = venuepyrofxkill}
		spawnscript \{z_cairo_pyro_moments_back_2
			id = venuepyrofxkill}
		case z_mexicocity
		lightshow_setparams \{mood = encore}
		lightshow_playsnapshot \{name = encore06
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_mexicocity_pyro_special
			id = venuepyrofxkill}
		case z_subway
		lightshow_setparams \{mood = exposition}
		lightshow_playsnapshot \{name = exposition01
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_subway_pyro_special
			id = venuepyrofxkill}
	endswitch
endscript

script celebintro_fx 
	getpakmancurrent \{map = zones}
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
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript

script celebintro_fx_temp 
	return
endscript

script celebintro_fx_mexicocity 
	lightshow_setparams \{mood = exposition}
	lightshow_playsnapshot \{name = exposition02
		usesnapshotpositions = true
		save = true}
	wait \{3
		seconds}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = exposition01
		usesnapshotpositions = true
		save = true}
endscript
