curreviewlighting = 0

script cyclereviewlighting 
	change curreviewlighting = ($curreviewlighting + 1)
	if ($curreviewlighting = 7)
		change \{curreviewlighting = 0}
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = lightprefix '%p_GFX_L' p = <pakname>
	callscriptonnode prefix = <lightprefix> callback_script = cb_cyclereviewlighting params = {}
endscript

script cb_cyclereviewlighting 
	getlightcolor name = <nodename>
	big = <r>
	if (<big> < <g>)
		big = <g>
	endif
	if (<big> < <b>)
		big = <b>
	endif
	switch $curreviewlighting
		case 0
		setlightcolor name = <nodename> r = <big> g = <big> b = <big>
		case 1
		setlightcolor name = <nodename> r = <big> g = (<big> / 6.0) b = (<big> / 6.0)
		case 2
		setlightcolor name = <nodename> r = (<big> / 6.0) g = <big> b = (<big> / 6.0)
		case 3
		setlightcolor name = <nodename> r = (<big> / 6.0) g = (<big> / 6.0) b = <big>
		case 4
		setlightcolor name = <nodename> r = (<big> / 6.0) g = <big> b = <big>
		case 5
		setlightcolor name = <nodename> r = <big> g = (<big> / 6.0) b = <big>
		case 6
		setlightcolor name = <nodename> r = <big> g = <big> b = (<big> / 6.0)
	endswitch
endscript

script safecreate 
	if isinnodearray <nodename>
		if NOT iscreated <nodename>
			create name = <nodename>
		endif
	endif
endscript

script safekill 
	if iscreated <nodename>
		kill name = <nodename>
	endif
endscript

script screenflash \{time = 1}
	killspawnedscript \{id = screenflash}
	spawnscriptlater screenflashon id = screenflash params = {time = <time>}
endscript

script screenflashon 
	if NOT screenfx_fxinstanceexists \{viewport = bg_viewport
			name = flashbs}
		screenfx_addfxinstance {
			viewport = bg_viewport
			name = flashbs
			($screenflash_tod_manager.screen_fx [0])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = bg_viewport
			name = flashbs
			($screenflash_tod_manager.screen_fx [0])
		}
	endif
	wait (0.1 * <time>) seconds
	if screenfx_fxinstanceexists \{viewport = bg_viewport
			name = flashbs}
		screenfx_updatefxinstanceparams {
			viewport = bg_viewport
			name = flashbs
			time = <time>
			($screenflash_tod_manager.screen_fx [0])
			contrast = 1
			brightness = 1
		}
	endif
	wait <time> seconds
	spawnscriptlater \{screenflashoff
		id = screenflash}
endscript

script screenflashoff 
	if viewportexists \{id = bg_viewport}
		if screenfx_fxinstanceexists \{viewport = bg_viewport
				name = flashbs}
			screenfx_removefxinstance \{viewport = bg_viewport
				name = flashbs}
		endif
	endif
endscript

script screentoblack \{time = 0.4
		viewport = ui}
	killspawnedscript \{id = screentoblack}
	spawnscriptlater call_screentoblack id = screentoblack params = {<...>}
endscript

script call_screentoblack 
	time = (0.5 * <time>)
	spawnscriptlater do_screentoblack id = screentoblack params = {on time = <time> <...>}
	wait <time> seconds
	spawnscriptlater do_screentoblack id = screentoblack params = {off time = <time> <...>}
endscript

script do_screentoblack 
	if NOT (<viewport> = 0)
		if NOT viewportexists id = <viewport>
			return
		endif
	endif
	if gotparam \{on}
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = blackfx
			screenfx_addfxinstance {
				viewport = <viewport>
				name = blackfx
				($screentoblack_tod_manager.screen_fx [0])
			}
		endif
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = blackfx
			time = <time>
			($screentoblack_tod_manager.screen_fx [0])
			inner_radius = 0
			outer_radius = 0
			alpha = 1
		}
	else
		if screenfx_fxinstanceexists viewport = <viewport> name = blackfx
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = blackfx
				time = <time>
				($screentoblack_tod_manager.screen_fx [0])
				inner_radius = 1
				outer_radius = 1.5
				alpha = 0
			}
			if gotparam \{off}
				wait <time> seconds
				screenfx_removefxinstance viewport = <viewport> name = blackfx
			endif
		endif
	endif
endscript

script reset_transition_fxandlighting 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_hof
		popworldlights
		disablelightgroup \{name = defaultgroup}
		kill \{prefix = z_hof_gfx_fx_bluesmoke}
		kill \{prefix = z_hof_gfx_fx_greensmoke}
		kill \{prefix = z_hof_gfx_fx_yellowsmoke}
		kill \{name = z_hof_gfx_fx_snow}
		kill \{name = z_hof_gfx_fx_drummerglow_01}
		kill \{name = z_hof_gfx_fx_drummersmoke_02}
		destroyparticlesbygroupid \{groupid = pyrofountains
			ifempty = 0}
		destroyparticlesbygroupid \{groupid = fireworksambient
			ifempty = 0}
		destroyparticlesbygroupid \{groupid = fireworkslaunch
			ifempty = 0}
		destroyparticlesbygroupid \{groupid = fireworkslaunchsmoke
			ifempty = 0}
		destroyparticlesbygroupid \{groupid = fireworkslaunch03
			ifempty = 0}
		destroyparticlesbygroupid \{groupid = fireworkslaunchsmoke03
			ifempty = 0}
		destroyparticlesbygroupid \{groupid = fireworkslaunchsmoke04
			ifempty = 0}
		destroyparticlesbygroupid \{groupid = fireworkslaunchsmoke04
			ifempty = 0}
		setdynamicshadowintensity \{i = 0.35000002}
		case z_fenway
		popworldlights
		disablelightgroup \{name = defaultgroup}
		kill \{prefix = z_fenway_gfx_fx_bandtrans}
		setshadowdirfromlight \{name = z_fenway_gfx_l_band_center_direct01}
		case z_maxskc
		popworldlights
		disablelightgroup \{name = defaultgroup}
		kill \{prefix = z_maxskc_gfx_fx_bandtrans_smoke}
		case z_jpplay
		popworldlights
		disablelightgroup \{name = defaultgroup}
		setshadowdirfromlight \{name = z_jpplay_gfx_l_band_center_direct01}
		destroyparticlesbygroupid \{groupid = ae_pyro
			ifempty = 0}
		destroyparticlesbygroupid \{groupid = pyrofountains
			ifempty = 0}
		case z_soundcheck
		popworldlights
		disablelightgroup \{name = defaultgroup}
		case z_nine_lives
		popworldlights
		disablelightgroup \{name = defaultgroup}
		safekill \{nodename = z_nine_lives_gfx_fx_bandtrasition_smoke_01}
		safekill \{nodename = z_nine_lives_gfx_fx_bandtrasition_glow_01}
		case z_nipmuc
		popworldlights
		disablelightgroup \{name = defaultgroup}
		setshadowdir \{heading = 15
			pitch = 45.0}
		kill \{prefix = z_nipmuc_gfx_fx_fog}
		kill \{prefix = z_nipmuc_gfx_party}
	endswitch
endscript
