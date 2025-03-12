jowblue = 717488127
jowgreen = 771697407
joworange = -6149377
jowred = -15061505
jowyellow = -3267073

script jow_stars 
	printf \{qs(0x18876fca)
		channel = jow}
	printstruct <...> channel = jow
	printf \{qs(0x18876fca)
		channel = jow}
endscript

script safegetuniquecompositeobjectid \{preferredid = safefxid01}
	if NOT gotparam \{objid}
		getuniquecompositeobjectid preferredid = <preferredid>
		return uniqueid = <uniqueid>
	endif
	i = 0
	formattext textname = index '%i' i = <i>
	extendcrc <preferredid> <index> out = preferredid
	begin
	manglechecksums a = <preferredid> b = <objid>
	if NOT objectexists id = <mangled_id>
		return uniqueid = <preferredid>
	else
		i = (<i> + 1)
		formattext textname = index '%i' i = <i>
		extendcrc <preferredid> <index> out = preferredid
	endif
	repeat
endscript

script setlightintensityovertime \{i = 1.0
		time = 2.0
		steptime = 0.05}
	targeti = <i>
	getlightintensity name = <name>
	numsteps = (<time> / <steptime>)
	casttointeger \{numsteps}
	stepsize = ((<targeti> - <i>) / <numsteps>)
	begin
	i = (<i> + <stepsize>)
	setlightintensity name = <name> intensity = <i>
	wait <steptime> seconds
	repeat (<numsteps> -1)
	setlightintensity name = <name> intensity = <targeti>
endscript

script anim_key 
	obj_movetopos (<mov>) time = <time>
	obj_rotate absolute = <rot> time = <time>
	obj_waitmove
endscript

script changepasscolor \{parameter = m_pspass0materialcolor
		time = 1.0
		steptime = 0.05}
	numsteps = (<time> / <steptime>)
	casttointeger \{numsteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numsteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numsteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numsteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numsteps>)
	begin
	setarrayelement arrayname = startcolor index = 0 newvalue = (<startcolor> [0] + <stepr>)
	setarrayelement arrayname = startcolor index = 1 newvalue = (<startcolor> [1] + <stepg>)
	setarrayelement arrayname = startcolor index = 2 newvalue = (<startcolor> [2] + <stepb>)
	setarrayelement arrayname = startcolor index = 3 newvalue = (<startcolor> [3] + <stepa>)
	updatematerialproperty {
		object = <objid>
		material = <material>
		parameter = <parameter>
		value = <startcolor>
	}
	wait <steptime> seconds
	repeat (<numsteps> -1)
	updatematerialproperty {
		object = <objid>
		material = <material>
		parameter = <parameter>
		value = <endcolor>
	}
endscript

script light_updateposition \{offset = (0.0, 0.0, 0.0)}
	obj_getid
	begin
	if NOT iscreated <attachobjid>
		die
	endif
	<attachobjid> :obj_getposition
	movelight name = <objid> pos = (<pos> + <offset>)
	wait \{1
		frame}
	repeat
endscript

script obj_scale \{scale = (2.0, 2.0, 2.0)
		time = 2.0}
	if gotparam \{cycle}
		begin
		obj_morphscaling target_scale = <scale> blend_duration = <time>
		wait <time> seconds
		obj_morphscaling target_scale = (1.0, 1.0, 1.0) blend_duration = <time>
		wait <time> seconds
		repeat
	else
		obj_morphscaling target_scale = <scale> blend_duration = <time>
	endif
endscript

script obj_setmaterialcolor_spawner 
	obj_killspawnedscript \{name = obj_setmaterialcolor}
	obj_spawnscriptlater obj_setmaterialcolor params = {<...>}
endscript

script obj_setmaterialcolor \{shader_var = m_pspass0materialcolor
		endcolor = [
			1.0
			1.0
			1.0
			1.0
		]
		time = 1.0
		steptime = 0.1
		unique = true}
	if (<unique> = true)
		obj_makematerialunique
	endif
	obj_getmaterialvector material = <material> shader_var = <sharder_var>
	startcolor = <material_value>
	if (<steptime> > <time>)
		steptime = <time>
	endif
	if ((<time> > 0) && (<steptime> > 0))
		numsteps = (<time> / <steptime>)
		casttointeger \{numsteps}
		stepsize = (1.0 / <numsteps>)
		curstep = 0.0
		begin
		wait <steptime> seconds
		curstep = (<curstep> + <stepsize>)
		blend_rgba a = <startcolor> b = <endcolor> i = <curstep>
		obj_setmaterialvector material = <material> shader_var = <shader_var> value = <rgba>
		repeat <numsteps>
	endif
	setarrayelement \{arrayname = material_value
		index = 3
		newvalue = 0}
	obj_setmaterialvector material = <material> shader_var = <shader_var> value = <endcolor>
endscript

script blend_rgba 
	linearmap result = br from = (<a> [0]) to = (<b> [0]) basedon = <i> lowerbound = 0 upperbound = 1
	linearmap result = bg from = (<a> [1]) to = (<b> [1]) basedon = <i> lowerbound = 0 upperbound = 1
	linearmap result = bb from = (<a> [2]) to = (<b> [2]) basedon = <i> lowerbound = 0 upperbound = 1
	linearmap result = ba from = (<a> [3]) to = (<b> [3]) basedon = <i> lowerbound = 0 upperbound = 1
	rgba = [0.0 0.0 0.0 0.0]
	setarrayelement arrayname = rgba index = 0 newvalue = <br>
	setarrayelement arrayname = rgba index = 1 newvalue = <bg>
	setarrayelement arrayname = rgba index = 2 newvalue = <bb>
	setarrayelement arrayname = rgba index = 3 newvalue = <ba>
	return rgba = <rgba>
endscript

script create_avedit_fx \{viewport = fullscreen_visualizer_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		blendmode = diffuse
		alphafromgray = 1}
	if NOT viewportexists id = <viewport>
		jow_stars qs(0x2d9c3b7e) <viewport>
		createscreenelement {
			parent = root_window
			type = viewportelement
			id = <id>
			texture = fullscreen_visualizer
			viewport_priority = 1
			pos = (0.0, 0.0)
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
		if viewportexists id = <viewport>
			jow_stars \{qs(0xb5746191)}
		else
			jow_stars \{qs(0x93833032)}
			return
		endif
	endif
	change \{visualizer_events_enabled = false}
	if screenfx_fxinstanceexists viewport = <viewport> name = bloom__simplified_
		screenfx_removefxinstance viewport = <viewport> name = bloom__simplified_
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = godray
		screenfx_removefxinstance viewport = <viewport> name = godray
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = noise_lite type = noise2
		screenfx_removefxinstance viewport = <viewport> name = noise_lite type = noise2
	endif
	if gotparam \{primitives}
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = avfx01
			screenfx_addfxinstance {
				viewport = <viewport>
				name = avfx01
				scefname = avfx01
				type = audiovisualize
				on = 1
				primitives = <primitives>
				clearcolor = <clearcolor>
				blendmode = <blendmode>
				alphafromgrayscale = <alphafromgray>
				audio_params = $default_visualizer_audio_params
			}
		else
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = avfx01
				scefname = avfx01
				type = audiovisualize
				on = 1
				primitives = <primitives>
				clearcolor = [0 , 0 , 0 , 255]
				audio_params = $default_visualizer_audio_params
			}
		endif
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = avfx_bloom01
			screenfx_addfxinstance {
				viewport = <viewport>
				name = avfx_bloom01
				scefname = avfx_bloom01
				type = bloom2
				on = 1
				materialfilter = 0
				fullscreen = 1
				subtract = [0 0 0 0]
				colormodulate = [1.0 1.0 1.0 0.8]
				saturation = 1.0
				equation = eq2
			}
		endif
	endif
endscript

script create_avfx \{viewport = fullscreen_visualizer_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		blendmode = diffuse
		alphafromgray = 1}
	if NOT viewportexists id = <viewport>
		return
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = bloom__simplified_
		screenfx_removefxinstance viewport = <viewport> name = bloom__simplified_
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = godray
		screenfx_removefxinstance viewport = <viewport> name = godray
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = noise_lite type = noise2
		screenfx_removefxinstance viewport = <viewport> name = noise_lite type = noise2
	endif
	if gotparam \{primitives}
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = avfx01
			screenfx_addfxinstance {
				viewport = <viewport>
				name = avfx01
				scefname = avfx01
				type = audiovisualize
				on = 1
				primitives = <primitives>
				clearcolor = <clearcolor>
				blendmode = <blendmode>
				alphafromgrayscale = <alphafromgray>
				audio_params = $default_visualizer_audio_params
			}
		else
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = avfx01
				scefname = avfx01
				type = audiovisualize
				on = 1
				primitives = <primitives>
				clearcolor = [0 , 0 , 0 , 255]
				audio_params = $default_visualizer_audio_params
			}
		endif
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = avfx_bloom01
			screenfx_addfxinstance {
				viewport = <viewport>
				name = avfx_bloom01
				scefname = avfx_bloom01
				type = bloom2
				on = 1
				materialfilter = 0
				fullscreen = 1
				subtract = [0 0 0 0]
				colormodulate = [1.0 1.0 1.0 0.8]
				saturation = 1.0
				equation = eq2
			}
		endif
	elseif gotparam \{profile}
		screenfx_clearfxinstances viewport = <viewport>
		avpreset = ($default_tod_manager.avpreset)
		fxparam = ($default_tod_manager.fxparam)
		if structurecontains \{structure = profile
				avpreset}
			avpreset = (<profile>.avpreset)
		endif
		i = 0
		getarraysize <avpreset>
		begin
		formattext checksumname = avname 'AVFX_%i' i = <i> dontassertforchecksums
		screenfx_addfxinstance {
			viewport = <viewport>
			name = <avname>
			scefname = <avname>
			type = audiovisualize
			on = 1
			primitives = (<avpreset> [<i>])
			clearcolor = [0 , 0 , 0 , 255]
			audio_params = $default_visualizer_audio_params
		}
		i = (<i> + 1)
		repeat <array_size>
		if structurecontains \{structure = profile
				fxparam}
			fxparam = (<profile>.fxparam)
		endif
		if structurecontains \{structure = fxparam
				screen_fx}
			begin
			if getnextarrayelement (<fxparam>.screen_fx)
				screenfx_addfxinstance {
					viewport = <viewport>
					<element>
				}
			else
				break
			endif
			repeat
		endif
	endif
endscript

script destroy_avfx \{primitives = $og_bluephoenix
		viewport = bg_viewport}
	screenfx_clearfxinstances viewport = <viewport>
	if viewportexists id = <viewport>
		if screenfx_fxinstanceexists viewport = <viewport> name = avfx01
			screenfx_removefxinstance viewport = <viewport> name = avfx01
		endif
	endif
endscript

script display_avfx_message \{text = qs(0x7223952e)
		time = 10
		pos = (640.0, 640.0)}
	formattext textname = newtext qs(0x0204c31d) t = <text>
	if screenelementexists \{id = mb_text_container}
		destroyscreenelement \{id = mb_text_container}
	endif
	createscreenelement \{id = mb_text_container
		type = containerelement
		parent = root_window}
	createscreenelement {
		id = mb_text
		type = textelement
		parent = mb_text_container
		font = debug
		text = <newtext>
		scale = 1.5
		pos = <pos>
		just = [center center]
		rgba = [150 185 200 255]
		z_priority = 80
	}
	createscreenelement {
		id = mb_text_shadow
		type = textelement
		parent = mb_text_container
		font = debug
		text = <newtext>
		scale = 1.5
		pos = (<pos> + (1.0, 1.0))
		just = [center center]
		rgba = [0 0 0 255]
		z_priority = 79
	}
	if screenelementexists \{id = mb_text}
		mb_text :se_setprops \{alpha = 0}
	endif
	mb_text_shadow :se_setprops \{alpha = 0}
	if screenelementexists \{id = mb_text}
		mb_text :se_setprops \{alpha = 1
			time = 0.1}
	endif
	mb_text_shadow :se_setprops \{alpha = 1
		time = 0.1}
	if screenelementexists \{id = mb_text}
		mb_text :se_waitprops
	endif
	wait <time> seconds
	if screenelementexists \{id = mb_text}
		mb_text :se_setprops \{alpha = 0
			time = 0.1}
	endif
	mb_text_shadow :se_setprops \{alpha = 0
		time = 0.1}
	if screenelementexists \{id = mb_text}
		mb_text :se_waitprops
	endif
	if screenelementexists \{id = mb_text_container}
		destroyscreenelement \{id = mb_text_container}
	endif
endscript

script handofgod_sparkle 
	destroyscreenelement \{id = hog_sparkle}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_sparkle
		texture = ph_radialglow_01
		alpha = 1
		scale = (1.0, 1.0)
		dims = (200.0, 200.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 1050
		rgba = [
			255
			255
			255
			255
		]}
	handofgod_sparkle_anim
endscript

script handofgod_electriccenter_glow 
	destroyscreenelement \{id = hog_electriccenter_glow}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_glow
		texture = ph_radialglow_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
endscript

script handofgod_electriccenter_glow_02 
	destroyscreenelement \{id = hog_electriccenter_glow_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_glow_02
		texture = ph_radialglow_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
	handofgod_electriccenter_glow_anim_02
endscript

script handofgod_electriccenter_glow_03 
	destroyscreenelement \{id = hog_electriccenter_glow_03}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_glow_03
		texture = ph_radialglow_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
	handofgod_electriccenter_glow_anim_03
endscript

script handofgod_electriccenter_flare 
	destroyscreenelement \{id = hog_electriccenter_flare}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_flare
		texture = jow_flare02
		alpha = 1
		scale = (1.0, 1.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 220.0)
		blend = add
		rot_angle = 45
		z_priority = 3
		rgba = [
			120
			200
			255
			255
		]}
	wait \{1.0
		second}
	destroyscreenelement \{id = hog_electriccenter_flare}
endscript

script handofgod_electriccenter_flare_02 
	destroyscreenelement \{id = hog_electriccenter_flare_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_flare_02
		texture = jow_flare02
		alpha = 1
		scale = (1.0, 1.0)
		dims = (20.0, 20.0)
		just = [
			center
			center
		]
		pos = (640.0, 220.0)
		blend = add
		z_priority = 3
		rgba = [
			220
			240
			255
			255
		]}
	handofgod_electriccenter_flare_02_anim
endscript

script handofgod_electriccenter_flare_03 
	destroyscreenelement \{id = hog_electriccenter_flare_03}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_flare_03
		texture = jow_flare02
		alpha = 1
		scale = (1.0, 1.0)
		dims = (1800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 220.0)
		blend = add
		rot_angle = 0
		z_priority = 3
		rgba = [
			120
			200
			255
			255
		]}
	handofgod_electriccenter_flare_03_anim
endscript

script handofgod_electriccenter 
	destroyscreenelement \{id = hog_electriccenter}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter
		texture = ph_electricity_02
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 2000
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	spawnscriptnow \{handofgod_electriccenter_anim_scale}
endscript

script handofgod_electriccenter_02 
	destroyscreenelement \{id = hog_electriccenter_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_02
		texture = ph_electricity_02
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		rot_angle = 45
		blend = add
		z_priority = 2000
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	handofgod_electriccenter_anim_scale_02
endscript

script handofgod_electriccenter_03 
	destroyscreenelement \{id = hog_electriccenter_03}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_03
		texture = ph_electricity_02
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (640.0, 110.0)
		blend = add
		z_priority = 2
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	spawnscriptnow \{handofgod_electriccenter_anim_scale_03}
endscript

script handofgod_electriccenter_04 
	destroyscreenelement \{id = hog_electriccenter_04}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_04
		texture = ph_electricity_02
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (420.0, 230.0)
		blend = add
		z_priority = 5000
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	spawnscriptnow \{handofgod_electriccenter_anim_scale_04}
endscript

script handofgod_electriccenter_05 
	destroyscreenelement \{id = hog_electriccenter_05}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_05
		texture = ph_electricity_02
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (910.0, 200.0)
		blend = add
		z_priority = 5000
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	spawnscriptnow \{handofgod_electriccenter_anim_scale_05}
endscript

script handofgod_sparkle_anim 
	hog_sparkle :se_setprops \{alpha = 0
		scale = 0.1
		rot_angle = 0
		time = 0}
	hog_sparkle :se_setprops \{alpha = 1
		scale = 6.0
		rot_angle = 180
		time = 0.1}
	hog_sparkle :se_setprops \{alpha = 0
		scale = 0.1
		rot_angle = 360
		time = 0.15}
endscript

script handofgod_electriccenter_glow_anim 
	handofgod_electriccenter_glow
	begin
	hog_electriccenter_glow :se_setprops scale = (0.1, 0.1) alpha = 0.4 time = 0 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	hog_electriccenter_glow :se_setprops scale = (2.0, 2.0) alpha = 0.6 time = 0.5 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	repeat 3
	destroyscreenelement \{id = hog_electriccenter_glow}
endscript

script handofgod_electriccenter_glow_anim_02 
	begin
	hog_electriccenter_glow_02 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0.5}
	hog_electriccenter_glow_02 :se_setprops \{scale = (3.0, 3.0)
		alpha = 0
		time = 0.2}
	hog_electriccenter_glow_02 :se_waitprops
	repeat 7
	destroyscreenelement \{id = hog_electriccenter_glow_02}
endscript

script handofgod_electriccenter_glow_anim_03 
	hog_electriccenter_glow_03 :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.4}
	hog_electriccenter_glow_03 :se_setprops \{scale = (1.0, 1.0)
		alpha = 0
		time = 1}
	hog_electriccenter_glow_03 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_glow_03}
endscript

script handofgod_electriccenter_anim_scale 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter :se_setprops \{scale = (0.5, 0.5)
		alpha = 0.3
		time = 0.05}
	hog_electriccenter :se_waitprops
	hog_electriccenter :se_setprops \{scale = (2.0, 2.0)
		alpha = 1
		time = 0.1}
	hog_electriccenter :se_waitprops
	repeat 7
	destroyscreenelement \{id = hog_electriccenter}
endscript

script handofgod_electriccenter_anim_scale_03 
	hog_electriccenter_03 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0
		time = 0}
	hog_electriccenter_03 :se_waitprops
	hog_electriccenter_03 :se_setprops \{scale = (2.5, 2.5)
		alpha = 1
		time = 0.05}
	hog_electriccenter_03 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_03}
endscript

script handofgod_electriccenter_anim_scale_02 
	<rot> = 0
	begin
	<rot> = (<rot> + 10)
	hog_electriccenter_02 :se_setprops rot_angle = <rot>
	hog_electriccenter_02 :se_setprops \{scale = (1.0, 1.0)
		alpha = 1
		time = 0}
	hog_electriccenter_02 :se_waitprops
	hog_electriccenter_02 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0
		time = 0.1}
	hog_electriccenter_02 :se_waitprops
	repeat 6
	destroyscreenelement \{id = hog_electriccenter_02}
endscript

script handofgod_electriccenter_anim_scale_04 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter_04 :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter_04 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0.3
		time = 0.1}
	hog_electriccenter_04 :se_waitprops
	hog_electriccenter_04 :se_setprops \{scale = (1.0, 1.0)
		alpha = 1
		time = 0.2}
	hog_electriccenter_04 :se_waitprops
	repeat 3
	destroyscreenelement \{id = hog_electriccenter_04}
endscript

script handofgod_electriccenter_anim_scale_05 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter_05 :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter_05 :se_setprops \{scale = (0.4, 0.4)
		alpha = 0.3
		time = 0.1}
	hog_electriccenter_05 :se_waitprops
	hog_electriccenter_05 :se_setprops \{scale = (1.0, 1.0)
		alpha = 1
		time = 0.2}
	hog_electriccenter_05 :se_waitprops
	repeat 3
	destroyscreenelement \{id = hog_electriccenter_05}
endscript

script handofgod_electriccenter_flare_02_anim 
	hog_electriccenter_flare_02 :se_setprops \{scale = (200.0, 200.0)
		rot_angle = -360
		alpha = 0.8
		time = 0.1}
	hog_electriccenter_flare_02 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_flare_02}
endscript

script handofgod_electriccenter_flare_03_anim 
	hog_electriccenter_flare_03 :se_setprops \{scale = (1.0, 1.0)
		rot_angle = 0
		alpha = 0.5
		time = 0}
	hog_electriccenter_flare_03 :se_setprops \{scale = (800.0, 200.0)
		rot_angle = 0
		alpha = 2
		time = 4}
	hog_electriccenter_flare_03 :se_setprops \{scale = (1.0, 1.0)
		rot_angle = 0
		alpha = 0
		time = 4.5}
	hog_electriccenter_flare_03 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_flare_03}
endscript

script handofgod_fx_01 
	wait \{1.5
		second}
	spawnscriptnow \{handofgod_lightning_combo}
	spawnscriptnow \{handofgod_electriccenter_glow_anim}
	spawnscriptnow \{handofgod_electriccenter}
	spawnscriptnow \{handofgod_electriccenter_03}
	wait \{0.2
		second}
	spawnscriptnow \{handofgod_electriccenter_02}
	spawnscriptnow \{handofgod_electriccenter_flare_03}
endscript

script handofgod_fx_02 
	wait \{1.5
		second}
	wait \{0.2
		second}
	spawnscriptnow \{handofgod_smoke_02}
	spawnscriptnow \{handofgod_electriccenter_glow_03}
endscript

script hogcombo 
	spawnscriptnow \{handofgod_fx_01}
	spawnscriptnow \{handofgod_fx_02}
endscript

script handofgod_lightning_god 
	destroyscreenelement \{id = hog_lightning_god}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_lightning_god
		alpha = 1
		scale = (1.1, 1.3)
		just = [
			center
			center
		]
		pos = (1025.0, 170.0)
		rot_angle = 70
		material = sys_big_bolt01_sys_big_bolt01
		z_priority = 1}
	wait \{1.5
		second}
	destroyscreenelement \{id = hog_lightning_god}
endscript

script handofgod_lighting_devil_02 
	destroyscreenelement \{id = hog_lighting_devil_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_lighting_devil_02
		alpha = 1
		scale = (1.1, 1.3)
		just = [
			center
			center
		]
		pos = (295.0, 160.0)
		rot_angle = 285
		material = sys_big_bolt01_sys_big_bolt01
		z_priority = 0.5}
	wait \{1.5
		second}
	destroyscreenelement \{id = hog_lighting_devil_02}
endscript

script handofgod_lightning_combo 
	spawnscriptnow \{handofgod_lightning_god}
	spawnscriptnow \{handofgod_lighting_devil_02}
endscript

script handofgod_fx_kill 
	destroyscreenelement \{id = hog_electriccenter_glow}
	destroyscreenelement \{id = hog_electriccenter_flare}
	destroyscreenelement \{id = hog_electriccenter}
	destroyscreenelement \{id = hog_lightning_god}
	destroyscreenelement \{id = hog_lighting_devil}
	destroyscreenelement \{id = hog_lighting_devil_02}
endscript

script handofgod_electriccenter_sparks_01 
	destroy2dparticlesystem \{id = electriccenter_sparks_01}
	wait \{1
		frame}
	create2dparticlesystem \{id = electriccenter_sparks_01
		pos = (640.0, 310.0)
		z_priority = 2
		material = sys_particle_spark01_sys_particle_spark01
		parent = alive_root_particle_container
		start_color = [
			100
			200
			255
			255
		]
		end_color = [
			100
			200
			255
			0
		]
		start_scale = (1.2, 1.2)
		end_scale = (0.6, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.03
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 10
		friction = (0.0, 20.0)
		time = 0.5}
	wait \{1.0
		second}
	destroy2dparticlesystem \{id = electriccenter_sparks_01}
endscript

script handofgod_electriccenter_sparks_02 
	destroy2dparticlesystem \{id = electriccenter_sparks_02}
	wait \{1
		frame}
	create2dparticlesystem \{id = electriccenter_sparks_02
		pos = (640.0, 310.0)
		z_priority = 2
		material = sys_particle_spark01_sys_particle_spark01
		parent = alive_root_particle_container
		start_color = [
			100
			0
			0
			255
		]
		end_color = [
			100
			0
			100
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (0.6, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.02
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 20
		friction = (0.0, 20.0)
		time = 0.5}
	wait \{1.0
		second}
	destroy2dparticlesystem \{id = electriccenter_sparks_02}
endscript

script handofgod_smoke_01 
	destroy2dparticlesystem \{id = hog_smoke_01}
	create2dparticlesystem \{id = hog_smoke_01
		pos = (640.0, 310.0)
		z_priority = 20.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			140
			200
			255
			175
		]
		end_color = [
			140
			200
			255
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (2.0, 2.0)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.5
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 4
		friction = (0.0, 0.0)
		time = 0.25}
	wait \{1
		second}
	destroy2dparticlesystem \{id = hog_smoke_01}
endscript

script handofgod_smoke_02 
	destroy2dparticlesystem \{id = hog_smoke_02}
	create2dparticlesystem \{id = hog_smoke_02
		pos = (640.0, 310.0)
		z_priority = 20.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			180
			200
			250
			80
		]
		end_color = [
			180
			180
			180
			0
		]
		start_scale = (2.0, 2.0)
		end_scale = (6.0, 6.0)
		start_angle_spread = 360.0
		min_rotation = -1000.0
		max_rotation = 900.0
		emit_start_radius = 2.0
		emit_radius = 3.0
		emit_rate = 0.09
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 10
		friction = (0.0, 0.0)
		time = 0.25}
	wait \{1
		second}
	destroy2dparticlesystem \{id = hog_smoke_02
		kill_when_empty}
endscript

script spit_vocalist_large 
	if compositeobjectexists \{vocalist}
		getuniquecompositeobjectid \{preferredid = jamesspit_01}
		createparticlesystem name = <uniqueid> objid = vocalist bone = bone_tongue params_script = $gp_fx_spit_01 groupid = zoneparticles
	endif
endscript

script spit_vocalist_small 
	if compositeobjectexists \{vocalist}
		getuniquecompositeobjectid \{preferredid = jamesspit_02}
		createparticlesystem name = <uniqueid> objid = vocalist bone = bone_tongue params_script = $gp_fx_spit_small_01 groupid = zoneparticles
	endif
endscript

script mouthfog_vocalist 
	if demobuild
		groupid = 0x24562492
	else
		groupid = zoneparticles
	endif
	if compositeobjectexists \{vocalist}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_01}
		createparticlesystem name = <uniqueid> objid = vocalist bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = <groupid>
	endif
endscript

script mouthfog_guitarist 
	if demobuild
		groupid = 0x24562492
	else
		groupid = zoneparticles
	endif
	if compositeobjectexists \{guitarist}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_02}
		createparticlesystem name = <uniqueid> objid = guitarist bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = <groupid>
	endif
endscript

script mouthfog_bassist 
	if demobuild
		groupid = 0x24562492
	else
		groupid = zoneparticles
	endif
	if compositeobjectexists \{bassist}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_03}
		createparticlesystem name = <uniqueid> objid = bassist bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = <groupid>
	endif
endscript

script mouthfog_drummer 
	if demobuild
		groupid = 0x24562492
	else
		groupid = zoneparticles
	endif
	if compositeobjectexists \{drummer}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_04}
		createparticlesystem name = <uniqueid> objid = drummer bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = <groupid>
	endif
endscript

script camerablur_fastzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.1}
	wait \{0.2
		seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.3}
	wait \{0.2
		seconds}
	bg_fx_set_blur \{appendstrength = 0.5
		time = 0.1}
	wait \{0.1
		second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_slowzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.5}
	wait \{0.4
		seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.4}
	wait \{0.5
		seconds}
	bg_fx_set_blur \{appendstrength = 1
		time = 0.3}
	wait \{0.3
		second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_focusin 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0}
	wait \{0.1
		second}
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
	wait \{0.06
		second}
	if viewportexists \{id = bg_viewport}
		bg_fx_set_brightness_whiteflash effectparams = <startvalue> time = 0.06
	endif
endscript

script camerafx_blackfadein 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	onexitrun camerafx_blackfadein_cleanup params = {startvalue = <startvalue>}
	bg_fx_set_brightness_blackfade appendbrightness = 0 time = (<length> * 0.001)
	block
endscript

script camerafx_blackfadein_cleanup 
	if viewportexists \{id = bg_viewport}
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
	wait \{1
		frame}
	bg_fx_set_brightness_blackfade effectparams = <startvalue> time = 0.75
endscript

script camerafx_blackfadeout_careerintro 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_blackfade \{appendbrightness = 0
		time = 0}
	wait \{1
		frame}
	bg_fx_set_brightness_blackfade effectparams = <startvalue> time = 0.5
endscript

script venueintro_fx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_cairo
		spawnscript \{venueintro_fx_cairo
			id = venuepyrofxkill}
		case z_sanfrancisco
		spawnscript \{venueintro_fx_sanfrancisco
			id = venuepyrofxkill}
		case z_carhenge
		spawnscript \{venueintro_fx_carhenge
			id = venuepyrofxkill}
		case z_dragrace
		spawnscript \{venueintro_fx_dragrace
			id = venuepyrofxkill}
		case z_dublin
		spawnscript \{venueintro_fx_dublin
			id = venuepyrofxkill}
		case z_freakshow
		spawnscript \{venueintro_fx_freakshow
			id = venuepyrofxkill}
		case z_mexicocity
		spawnscript \{venueintro_fx_mexicocity
			id = venuepyrofxkill}
		case z_nashville
		spawnscript \{venueintro_fx_nashville
			id = venuepyrofxkill}
		case z_neworleans
		spawnscript \{venueintro_fx_neworleans
			id = venuepyrofxkill}
		case z_norway
		spawnscript \{venueintro_fx_norway
			id = venuepyrofxkill}
		case z_subway
		spawnscript \{venueintro_fx_subway
			id = venuepyrofxkill}
		case z_vegas
		spawnscript \{venueintro_fx_vegas
			id = venuepyrofxkill}
		case z_montreux
		venueintro_fx_temp
		case z_paris
		venueintro_fx_temp
		case z_lhc
		spawnscript \{venueintro_fx_lhc
			id = venuepyrofxkill}
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

script venueintro_fx_freakshow 
	lightshow_setparams \{mood = intro}
	wait \{6
		seconds}
	lightshow_settime \{time = 0.4}
	lightshow_setparams \{mood = silhouette}
	spawnscript \{z_freakshow_intro_tesla
		id = venuepyrofxkill}
	wait \{2
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = intro}
endscript

script venueintro_fx_lhc 
	lightshow_setparams \{mood = intro}
	spawnscript \{z_lhc_intro_fx
		id = venuepyrofxkill}
endscript

script venueintro_fx_nashville 
	safekill \{nodename = z_nashville_gfx_fx_intro_crowdlighting_01}
	lightshow_setparams \{mood = intro}
	wait \{4
		seconds}
	spawnscript \{venueintro_fx_nashville_strobe
		id = venuepyrofxkill}
endscript

script venueintro_fx_nashville_strobe 
	kill \{prefix = z_nashville_gfx_fx_intro_lensflare
		noprefixwarning}
	safecreate \{nodename = z_nashville_gfx_fx_intro_crowdlighting_01}
	create \{prefix = z_nashville_gfx_fx_intro_lensflare}
	lightshow_setparams \{mood = strobe}
	begin
	lightshow_playsnapshot \{name = strobe_01
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe_02
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe_03
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe_04
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe_05
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe_01
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe_06
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe_07
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe_08
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe_09
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	repeat 3
	kill \{prefix = z_nashville_gfx_fx_intro_lensflare}
	lightshow_playsnapshot \{name = silhouette
		usesnapshotpositions = true
		save = true}
	spawnscript \{z_nashville_pyro_moments_front_1
		id = venuepyrofxkill}
	spawnscript \{z_nashville_pyro_moments_back_1
		id = venuepyrofxkill}
	wait \{0.5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = resolution}
	safekill \{nodename = z_nashville_gfx_fx_encore_crowdlighting_01}
endscript

script venueintro_fx_vegas 
	lightshow_setparams \{mood = intro}
	wait \{5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = strobe}
	lightshow_playsnapshot \{name = strobe_02
		usesnapshotpositions = true
		save = true}
	wait \{1
		second}
	spawnscript \{z_vegas_pyro_intro
		id = venuepyrofxkill}
endscript

script venueintro_fx_dublin 
	lightshow_setparams \{mood = intro}
	spawnscript \{z_dublin_pyro_intro
		id = venuepyrofxkill}
	wait \{5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = blackout}
endscript

script venueintro_fx_carhenge 
	kill \{prefix = z_carhenge_gfx_fx_encoresmoke}
	create \{prefix = z_carhenge_gfx_fx_encoresmoke}
	safecreate \{nodename = z_carhenge_gfx_fx_intro_godray_01}
	spawnscript \{z_carhenge_intro_godray_start
		id = venuepyrofxkill}
	wait \{3
		second}
	spawnscript \{venueintro_fx_carhenge_strobe
		id = venuepyrofxkill}
	wait \{2
		seconds}
	spawnscript \{z_carhenge_pyro_intro
		id = venuepyrofxkill}
	wait \{3
		seconds}
	spawnscript \{z_carhenge_intro_godray_end
		id = venuepyrofxkill}
	wait \{1
		seconds}
	safekill \{nodename = z_carhenge_gfx_fx_intro_godray_01}
endscript

script venueintro_fx_carhenge_strobe 
	begin
	lightshow_playsnapshot \{name = strobe01
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe02
		usesnapshotpositions = true
		save = true}
	wait \{0.3
		seconds}
	lightshow_playsnapshot \{name = strobe03
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe04
		usesnapshotpositions = true
		save = true}
	wait \{0.3
		seconds}
	lightshow_playsnapshot \{name = strobe05
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe06
		usesnapshotpositions = true
		save = true}
	wait \{0.1
		seconds}
	lightshow_playsnapshot \{name = strobe07
		usesnapshotpositions = true
		save = true}
	wait \{0.3
		seconds}
	repeat 4
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

script venueintro_fx_norway 
	lightshow_setparams \{mood = intro}
	wait \{5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = blackout}
	lightshow_playsnapshot \{name = blackout
		usesnapshotpositions = true
		save = true}
	wait \{1
		second}
	spawnscript \{z_norway_pyro_intro
		id = venuepyrofxkill}
endscript

script venueintro_fx_dragrace 
	spawnscript \{z_dragrace_introcar
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

script venueintro_fx_neworleans 
	changenodeflag \{ls_mood_intro
		0}
	kill \{prefix = z_neworleans_gfx_fx_introsmoke
		noprefixwarning}
	kill \{prefix = z_neworleans_gfx_fx_introfog
		noprefixwarning}
	create \{prefix = z_neworleans_gfx_fx_introfog
		noprefixwarning}
	wait \{3.5
		seconds}
	lightshow_settime \{time = 2}
	lightshow_setparams \{mood = tension}
	lightshow_playsnapshot \{name = tension01
		usesnapshotpositions = true
		save = true}
	wait \{1.5
		seconds}
	spawnscript \{z_neworleans_pyro_moments_front_3
		id = venuepyrofxkill}
	spawnscript \{z_neworleans_pyro_moments_back_3
		id = venuepyrofxkill}
	wait \{3.0
		seconds}
	spawnscript \{z_neworleans_pyro_moments_front_3
		id = venuepyrofxkill}
	wait \{0.2
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = intro}
endscript

script venueintro_fx_sanfrancisco 
	lightshow_setparams \{mood = intro}
	wait \{6
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_setparams \{mood = blackout}
	wait \{0.5
		second}
	spawnscript \{z_sanfrancisco_pyro_intro
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
		case z_sanfrancisco
		venuefastintro_fx_sanfrancisco
		case z_carhenge
		venuefastintro_fx_carhenge
		case z_dragrace
		venuefastintro_fx_temp
		case z_dublin
		venuefastintro_fx_dublin
		case z_freakshow
		venuefastintro_fx_freakshow
		case z_mexicocity
		venuefastintro_fx_mexicocity
		case z_nashville
		venuefastintro_fx_nashville
		case z_neworleans
		venuefastintro_fx_neworleans
		case z_norway
		venuefastintro_fx_norway
		case z_subway
		venuefastintro_fx_subway
		case z_vegas
		venuefastintro_fx_vegas
		case z_lhc
		venuefastintro_fx_lhc
	endswitch
endscript

script venuefastintro_fx_temp 
	return
endscript

script venuefastintro_fx_carhenge 
	kill \{prefix = z_carhenge_gfx_fx_encoresmoke
		noprefixwarning}
	safekill \{nodename = z_carhenge_gfx_fx_intro_godray_01}
	killspawnedscript \{name = venueintro_fx_carhenge}
	killspawnedscript \{name = venueintro_fx_carhenge_strobe}
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	lightshow_setparams \{mood = intro}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
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

script venuefastintro_fx_lhc 
	z_lhc_intro_fx_kill
endscript

script venuefastintro_fx_sanfrancisco 
	safekill \{nodename = z_sanfrancisco_gfx_fx_sanfranafterburst_01}
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
endscript

script venuefastintro_fx_freakshow 
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_freakshow_gfx_fx_teslasparks
		noprefixwarning}
	kill \{prefix = z_freakshow_gfx_fx_teslaglow
		noprefixwarning}
endscript

script venuefastintro_fx_neworleans 
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_neworleans_gfx_fx_introsmoke
		noprefixwarning}
	kill \{prefix = z_neworleans_gfx_fx_introfog
		noprefixwarning}
endscript

script venuefastintro_fx_dublin 
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_dublin_gfx_fx_lh_cloverlight
		noprefixwarning}
	kill \{prefix = z_dublin_gfx_fx_confetti
		noprefixwarning}
endscript

script venuefastintro_fx_vegas 
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
endscript

script venuefastintro_fx_nashville 
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_nashville_gfx_fx_intro_lensflare
		noprefixwarning}
	safekill \{nodename = z_nashville_gfx_fx_intro_crowdlighting_01}
	lightshow_setparams \{mood = intro}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
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

script venuefastintro_fx_norway 
	killspawnedscript \{name = venueintro_fx_norway}
	killspawnedscript \{id = venuepyrofxkill}
	venuefastintro_fx_destroyparticles
	kill \{prefix = z_norway_gfx_fx_norwayintro
		noprefixwarning}
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
		case z_sanfrancisco
		lightshow_setparams \{mood = exposition}
		lightshow_playsnapshot \{name = exposition01
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_sanfrancisco_pyro_special
			id = venuepyrofxkill}
		case z_carhenge
		lightshow_setparams \{mood = blackout}
		lightshow_playsnapshot \{name = blackout
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_carhenge_pyro_special
			id = venuepyrofxkill}
		case z_dragrace
		lightshow_setparams \{mood = exposition}
		lightshow_playsnapshot \{name = exposition01
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_dragrace_pyro_special
			id = venuepyrofxkill}
		case z_dublin
		lightshow_setparams \{mood = pyro}
		lightshow_playsnapshot \{name = pyro01
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_dublin_pyro_special
			id = venuepyrofxkill}
		case z_freakshow
		lightshow_setparams \{mood = silhouette}
		lightshow_playsnapshot \{name = silhouette_01
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_freakshow_pyro_special
			id = venuepyrofxkill}
		case z_mexicocity
		lightshow_setparams \{mood = encore}
		lightshow_playsnapshot \{name = encore06
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_mexicocity_pyro_special
			id = venuepyrofxkill}
		case z_nashville
		lightshow_setparams \{mood = blackout}
		lightshow_playsnapshot \{name = blackout
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_nashville_pyro_special
			id = venuepyrofxkill}
		case z_neworleans
		lightshow_setparams \{mood = tension}
		lightshow_playsnapshot \{name = tension02
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_neworleans_pyro_special
			id = venuepyrofxkill}
		case z_norway
		lightshow_setparams \{mood = blackout}
		lightshow_playsnapshot \{name = blackout
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_norway_pyro_moments_front_2
			id = venuepyrofxkill}
		spawnscript \{z_norway_pyro_moments_back_2
			id = venuepyrofxkill}
		spawnscript \{z_norway_pyro_moments_mid_1
			id = venuepyrofxkill}
		case z_subway
		lightshow_setparams \{mood = exposition}
		lightshow_playsnapshot \{name = exposition01
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_subway_pyro_special
			id = venuepyrofxkill}
		case z_vegas
		lightshow_setparams \{mood = exposition}
		lightshow_playsnapshot \{name = exposition01
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_vegas_pyro_special
			id = venuepyrofxkill}
		case z_lhc
		lightshow_setparams \{mood = resolution}
		lightshow_playsnapshot \{name = resolution01
			usesnapshotpositions = true
			save = true}
		spawnscript \{z_lhc_pyro_special
			id = venuepyrofxkill}
	endswitch
endscript

script celebintro_fx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_cairo
		celebintro_fx_temp
		case z_sanfrancisco
		celebintro_fx_temp
		case z_carhenge
		celebintro_fx_carhenge
		case z_dragrace
		celebintro_fx_temp
		case z_dublin
		celebintro_fx_dublin
		case z_easterisland
		celebintro_fx_temp
		case z_freakshow
		celebintro_fx_temp
		case z_mexicocity
		celebintro_fx_mexicocity
		case z_nashville
		celebintro_fx_nashville
		case z_neworleans
		celebintro_fx_temp
		case z_norway
		celebintro_fx_temp
		case z_subway
		celebintro_fx_temp
		case z_vegas
		celebintro_fx_temp
		case z_lhc
		spawnscript \{celebintro_fx_lhc}
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

script celebintro_fx_nashville 
	lightshow_setparams \{mood = strobe}
	lightshow_playsnapshot \{name = strobe_03
		usesnapshotpositions = true
		save = true}
	wait \{6
		seconds}
	z_nashville_pyro_moments_front_2
	wait \{0.5
		second}
	z_nashville_pyro_moments_mid_2
	lightshow_settime \{time = 1}
	lightshow_setparams \{mood = intro}
	lightshow_playsnapshot \{name = intro
		usesnapshotpositions = true
		save = true}
	wait \{0.5
		second}
	z_nashville_pyro_moments_back_2
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

script celebintro_fx_carhenge 
	lightshow_setparams \{mood = strobe}
	lightshow_playsnapshot \{name = strobe08
		usesnapshotpositions = true
		save = true}
	wait \{1
		seconds}
	lightshow_settime \{time = 5}
	lightshow_playsnapshot \{name = exposition04
		usesnapshotpositions = true
		save = true}
endscript

script celebintro_fx_lhc 
	lightshow_setparams \{mood = blackout}
	lightshow_playsnapshot \{name = blackout
		usesnapshotpositions = true
		save = true}
	lightshow_spotlightcolor \{color = red}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
	wait \{6
		seconds}
	lightshow_settime \{time = 3}
	lightshow_playsnapshot \{name = prelude03
		usesnapshotpositions = true
		save = true}
endscript

script celebintro_fx_dublin 
	lightshow_setparams \{mood = pyro}
	lightshow_playsnapshot \{name = pyro01
		usesnapshotpositions = true
		save = true}
	lightshow_spotlightcolor \{color = blue}
	lightshow_enablespotlights \{enabled = true
		spots = [
			vocalist
		]}
	wait \{5
		seconds}
	lightshow_settime \{time = 2}
	lightshow_setparams \{mood = resolution}
	lightshow_playsnapshot \{name = resolution01
		usesnapshotpositions = true
		save = true}
endscript

script changescreenelementcolor name = m_pulsecolor id = <highway_name> time = 1.0 steptime = 0.05
	numsteps = (<time> / <steptime>)
	casttointeger \{numsteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numsteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numsteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numsteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numsteps>)
	begin
	setarrayelement arrayname = startcolor index = 0 newvalue = (<startcolor> [0] + <stepr>)
	setarrayelement arrayname = startcolor index = 1 newvalue = (<startcolor> [1] + <stepg>)
	setarrayelement arrayname = startcolor index = 2 newvalue = (<startcolor> [2] + <stepb>)
	setarrayelement arrayname = startcolor index = 3 newvalue = (<startcolor> [3] + <stepa>)
	setscreenelementprops {
		id = <id>
		materialprops = [{name = <name> vectorproperty = <startcolor>}]
	}
	wait <steptime> seconds
	repeat (<numsteps> -1)
	setscreenelementprops {
		id = <id>
		materialprops = [{name = <name> vectorproperty = <endcolor>}]
	}
endscript

script changescreenelementcolorbygfs name = m_pulsecolor id = <highway_name> frames = 25 stepframes = 5
	numsteps = (<frames> / <stepframes>)
	casttointeger \{numsteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numsteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numsteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numsteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numsteps>)
	begin
	setarrayelement arrayname = startcolor index = 0 newvalue = (<startcolor> [0] + <stepr>)
	setarrayelement arrayname = startcolor index = 1 newvalue = (<startcolor> [1] + <stepg>)
	setarrayelement arrayname = startcolor index = 2 newvalue = (<startcolor> [2] + <stepb>)
	setarrayelement arrayname = startcolor index = 3 newvalue = (<startcolor> [3] + <stepa>)
	if NOT screenelementexists id = <id>
		return
	endif
	setscreenelementprops {
		id = <id>
		materialprops = [{name = <name> vectorproperty = <startcolor>}]
	}
	wait <stepframes> gameframes
	repeat (<numsteps> -1)
	if NOT screenelementexists id = <id>
		return
	endif
	setscreenelementprops {
		id = <id>
		materialprops = [{name = <name> vectorproperty = <endcolor>}]
	}
endscript
