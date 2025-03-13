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

script create_avui_fx \{viewport = ui_visualizer_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		blendmode = diffuse
		alphafromgray = 1
		audio_params = $default_visualizer_audio_params}
	if NOT viewportexists id = <viewport>
		return
	endif
	if gotparam \{profile}
		if structurecontains \{structure = profile
				primitives}
			primitives = (<profile>.primitives)
		endif
		if structurecontains \{structure = profile
				audio_params}
			audio_params = (<profile>.audio_params)
		endif
		if structurecontains \{structure = profile
				bloom_params}
			bloom_params = (<profile>.bloom_params)
		endif
		if structurecontains \{structure = profile
				color_params}
			color_params = (<profile>.color_params)
		endif
		if structurecontains \{structure = profile
				viewport_params}
			clearcolor = (<profile>.viewport_params.clearcolor)
			blendmode = (<profile>.viewport_params.blendmode)
			alphafromgray = (<profile>.viewport_params.alphafromgray)
		endif
	endif
	if gotparam \{primitives}
		if screenfx_fxinstanceexists viewport = <viewport> name = <id>
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = <id>
				scefname = <id>
				type = audiovisualize
				on = 1
				primitives = <primitives>
				clearcolor = <clearcolor>
				blendmode = <blendmode>
				alphafromgrayscale = <alphafromgray>
				audio_params = <audio_params>
			}
		else
			screenfx_addfxinstance {
				viewport = <viewport>
				name = <id>
				scefname = <id>
				type = audiovisualize
				on = 1
				primitives = <primitives>
				clearcolor = <clearcolor>
				blendmode = <blendmode>
				alphafromgrayscale = <alphafromgray>
				audio_params = <audio_params>
			}
		endif
		if NOT gotparam \{bloom_params}
			bloom_params = $default_visualizer_bloom_params
		endif
		if screenfx_fxinstanceexists viewport = <viewport> name = av_bloom01
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = avui_bloom01
				scefname = avui_bloom01
				type = bloom2
				<bloom_params>
			}
		else
			screenfx_addfxinstance {
				viewport = <viewport>
				name = avui_bloom01
				scefname = avui_bloom01
				type = bloom2
				<bloom_params>
			}
		endif
		if gotparam \{color_params}
			if screenfx_fxinstanceexists viewport = <viewport> name = avui_color01
				screenfx_updatefxinstanceparams {
					viewport = <viewport>
					name = avui_color01
					scefname = avui_color01
					type = bright_sat
					(<color_params>)
				}
			else
				screenfx_addfxinstance {
					viewport = <viewport>
					name = avui_color01
					scefname = avui_color01
					type = bright_sat
					(<color_params>)
				}
			endif
		else
			if screenfx_fxinstanceexists viewport = <viewport> name = avui_color01
				screenfx_updatefxinstanceparams {
					viewport = <viewport>
					name = avui_color01
					scefname = avui_color01
					type = bright_sat
					on = 0
				}
			endif
		endif
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = avui_uber01
			screenfx_addfxinstance {
				viewport = <viewport>
				name = avui_uber01
				scefname = avui_uber01
				type = uberscreenfx
			}
		endif
	endif
endscript

script create_avedit_fx \{viewport = fullscreen_visualizer_viewport}
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
			blend = diffuse
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
	create_avfx <...>
endscript

script create_avfx \{viewport = fullscreen_visualizer_viewport
		clearcolor = [
			0
			0
			0
			255
		]
		blendmode = diffuse
		alphafromgray = 1
		audio_params = $default_visualizer_audio_params}
	if NOT viewportexists id = <viewport>
		return
	endif
	if gotparam \{profile}
		if structurecontains \{structure = profile
				primitives}
			primitives = (<profile>.primitives)
		endif
		if structurecontains \{structure = profile
				audio_params}
			audio_params = (<profile>.audio_params)
		endif
		if structurecontains \{structure = profile
				bloom_params}
			bloom_params = (<profile>.bloom_params)
		endif
		if structurecontains \{structure = profile
				color_params}
			color_params = (<profile>.color_params)
		endif
		if structurecontains \{structure = profile
				viewport_params}
			clearcolor = (<profile>.viewport_params.clearcolor)
			blendmode = (<profile>.viewport_params.blendmode)
			alphafromgray = (<profile>.viewport_params.alphafromgray)
		endif
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
		if screenfx_fxinstanceexists viewport = <viewport> name = avfx01
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = avfx01
				scefname = avfx01
				type = audiovisualize
				on = 1
				primitives = <primitives>
				clearcolor = <clearcolor>
				blendmode = <blendmode>
				alphafromgrayscale = <alphafromgray>
				audio_params = <audio_params>
			}
		else
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
				audio_params = <audio_params>
			}
		endif
		if NOT gotparam \{bloom_params}
			bloom_params = $default_visualizer_bloom_params
		endif
		if screenfx_fxinstanceexists viewport = <viewport> name = avfx_bloom01
			screenfx_updatefxinstanceparams {
				viewport = <viewport>
				name = avfx_bloom01
				scefname = avfx_bloom01
				type = bloom2
				<bloom_params>
			}
		else
			screenfx_addfxinstance {
				viewport = <viewport>
				name = avfx_bloom01
				scefname = avfx_bloom01
				type = bloom2
				<bloom_params>
			}
		endif
		if gotparam \{color_params}
			if screenfx_fxinstanceexists viewport = <viewport> name = avfx_color01
				screenfx_updatefxinstanceparams {
					viewport = <viewport>
					name = avfx_color01
					scefname = avfx_color01
					type = bright_sat
					(<color_params>)
				}
			else
				screenfx_addfxinstance {
					viewport = <viewport>
					name = avfx_color01
					scefname = avfx_color01
					type = bright_sat
					(<color_params>)
				}
			endif
		else
			if screenfx_fxinstanceexists viewport = <viewport> name = avfx_color01
				screenfx_updatefxinstanceparams {
					viewport = <viewport>
					name = avfx_color01
					scefname = avfx_color01
					type = bright_sat
					on = 0
				}
			endif
		endif
		if NOT screenfx_fxinstanceexists viewport = <viewport> name = avfx_uber01
			screenfx_addfxinstance {
				viewport = <viewport>
				name = avfx_uber01
				scefname = avfx_uber01
				type = uberscreenfx
			}
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
	if compositeobjectexists \{vocalist}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_01}
		createparticlesystem name = <uniqueid> objid = vocalist bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = zoneparticles
	endif
endscript

script mouthfog_guitarist 
	if compositeobjectexists \{guitarist}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_02}
		createparticlesystem name = <uniqueid> objid = guitarist bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = zoneparticles
	endif
endscript

script mouthfog_bassist 
	if compositeobjectexists \{bassist}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_03}
		createparticlesystem name = <uniqueid> objid = bassist bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = zoneparticles
	endif
endscript

script mouthfog_drummer 
	if compositeobjectexists \{drummer}
		getuniquecompositeobjectid \{preferredid = jamesmouthfog_04}
		createparticlesystem name = <uniqueid> objid = drummer bone = bone_tongue params_script = $gp_fx_mouthfog_01 groupid = zoneparticles
	endif
endscript

script lars_snort \{object_name = !q1768515945}
	<objid> = <object_name>
	begin
	wait RandomFloat (1.0, 5.0) seconds
	safegetuniquecompositeobjectid preferredid = fxid_snortl01 objid = <objid>
	createparticlesystem name = <uniqueid> objid = <objid> bone = bone_head params_script = {$gp_fx_festival_encore_snortl01 color = -2139062095}
	safegetuniquecompositeobjectid preferredid = fxid_snortr01 objid = <objid>
	createparticlesystem name = <uniqueid> objid = <objid> bone = bone_head params_script = {$gp_fx_festival_encore_snortr01 color = -2139062095}
	repeat
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

script autocapturesnp \{curbuild = '-1'}
	spawnscript autocapturesnpcore params = {curbuild = <curbuild>}
endscript

script autocapturesnpcore 
	change \{debug_forcescore_dir = up}
	change \{debug_forcescore = good}
	cameracuts_setarrayprefix \{prefix = 'cameras'
		changenow
		type = cameras_debug_lightshow}
	change \{cameracuts_allownotescripts = false}
	enablescreenhistogram \{mode = 3
		colors = 0}
	if (<curbuild> = '-1')
		getbuildversion
		stringtochararray string = <build_version_string>
		printf <build_version_string>
		curbuild = ((<char_array> [4]) + (<char_array> [5]) + (<char_array> [6]) + (<char_array> [7]) + (<char_array> [8]) + (<char_array> [9]))
	endif
	curlevelname = (($levelzones.$current_level).name)
	debug_menu_turn_off_highway_visibility
	getarraysize \{$lightshow_available_snapshot_names}
	<snpcount> = <array_size>
	change lightshow_debugcycle_index = (<array_size> - 1)
	formattext checksumname = camera_fullname '%p_cameras_debug_lightshow' p = (($levelzones.$current_level).name)
	if globalexists name = <camera_fullname>
		cameracuts_setarrayprefix \{prefix = 'cameras_debug_lightshow'
			changenow}
		change \{cameracuts_allownotescripts = false}
	endif
	if (<snpcount> >= 10)
		wait \{2
			seconds}
		curnum = -1
		pausegame
		begin
		lightshow_debugcycle \{restore = 0}
		wait \{0.15
			seconds}
		<snpnum> = ($lightshow_debugcycle_index)
		<snapname> = ($lightshow_available_snapshot_names [<snpnum>])
		<pngname> = (<curlevelname> + '_' + <snapname> + '_' + <curbuild> + '_')
		stringtochararray string = <pngname>
		getarraysize <char_array>
		if (<array_size> > 35)
			diff = (<array_size> -35)
			<snapindex> = 0
			<tempsnap> = ''
			stringtochararray string = <snapname>
			getarraysize <char_array>
			begin
			<tempsnap> = (<tempsnap> + <char_array> [<snapindex>])
			<snapindex> = (<snapindex> + 1)
			repeat (<array_size> - <diff>)
			pngname = (<curlevelname> + '_' + <tempsnap> + '_' + <curbuild> + '_')
		endif
		screenshot filename = <pngname>
		wait \{0.15
			seconds}
		repeat (<snpcount> -9)
		unpausegame
		outputtxt_autocapturesnp
	else
		outputtxt_autocapturesnp_none
	endif
	enablescreenhistogram \{mode = 0
		colors = 0}
	debug_menu_turn_on_highway_visibility
endscript

script outputtxt_autocapturesnp 
	textoutputstart \{filename = 'autocaptureSNP_done'}
	formattext \{textname = text
		qs(0x00000000)}
	textoutput text = <text>
	textoutputend \{output_text
		filename = 'autocaptureSNP_done'}
endscript

script outputtxt_autocapturesnp_none 
	textoutputstart \{filename = 'autocaptureSNP_none'}
	formattext \{textname = text
		qs(0x00000000)}
	textoutput text = <text>
	textoutputend \{output_text
		filename = 'autocaptureSNP_none'}
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
		objid = <nodename>
		material = fx_geolightning
		parameter = m_pspass0materialcolor
		startcolor = [255 255 255 128]
		endcolor = [0 0 0 0]
		time = 0.2
	}
endscript

script lightning_color_white 
	changepasscolor {
		objid = <nodename>
		material = fx_geolightning
		parameter = m_pspass0materialcolor
		startcolor = [0 0 0 0]
		endcolor = [200 155 255 128]
		time = 0.2
	}
endscript

script lightning_color_black2 
	changepasscolor {
		objid = <nodename>
		material = fx_geolightning2
		parameter = m_pspass0materialcolor
		startcolor = [255 255 255 128]
		endcolor = [0 0 0 0]
		time = 0.2
	}
endscript

script lightning_color_white2 
	changepasscolor {
		objid = <nodename>
		material = fx_geolightning2
		parameter = m_pspass0materialcolor
		startcolor = [0 0 0 0]
		endcolor = [200 155 255 128]
		time = 0.2
	}
endscript
