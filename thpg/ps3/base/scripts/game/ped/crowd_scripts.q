
script create_crowd_models 
	if NOT gotparam crowd_models
		scriptassert "crowd_models array not found"
	endif
	if NOT globalexists name = <crowd_models>
		scriptassert "crowd_models array not found"
	endif
	getarraysize $<crowd_models>
	<array_count> = 0
	begin
	<pos> = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	formattext checksumname = name '%a_crowd_ped_%c' a = ($<crowd_models> [<array_count>].prefix) c = <array_count>
	formattext checksumname = bgname '%a_crowd_ped_bg%c' a = ($<crowd_models> [<array_count>].prefix) c = <array_count>
	formattext checksumname = camera '%a_crowd_camera_%c' a = ($<crowd_models> [<array_count>].prefix) c = <array_count>
	formattext checksumname = viewport '%a_crowd_viewport_%c' a = ($<crowd_models> [<array_count>].prefix) c = <array_count>
	mempushcontext bottomupheap
	createfromstructure {
		class = gameobject
		createdatstart
		name = <name>
		pos = <pos>
		quat = ($<crowd_models> [<array_count>].quat)
		lightgroup = outdoor
		model = 'Skater_Pro/pro_hawk.skin'
		skeletonname = Sk9_PED_Regular
		tree = $gameobj_animtree
		animtargets = [body , bodytimer]
		neversuspend
		triggerscript = ($<crowd_models> [<array_count>].triggerscript)
	}
	CreateRandomAppearance profile = ($<crowd_models> [<array_count>].profile)
	<name> :obj_initmodelfromprofile {
		struct = <profile>
		buildscript = create_ped_model_from_appearance
	}
	mempopcontext bottomupheap
	createcompositeobject {
		components = [{component = model} {component = motion}]
		params = {
			name = <bgname>
			model = 'Props\\crowd_ped_bg\\crowd_ped_bg.mdl'
			pos = <pos>
		}
	}
	createscreenelement {
		parent = root_window
		just = [center center]
		type = viewportelement
		id = <viewport>
		texture = ($<crowd_models> [<array_count>].texture)
		pos = (2000.0, 200.0)
		dims = (64.0, 64.0)
		alpha = 1
		style = imposter_rendering
	}
	createcompositeobjectinstance {
		priority = $coim_priority_permanent
		heap = generic
		components = [
			{component = camera}
		]
		params = {
			name = <camera>
			viewport = <viewport>
			object_type = crowd
			use_jq
			far_clip = 20
		}
	}
	setactivecamera viewport = <viewport> id = <camera>
	<camera> :sethfov hfov = 20.0
	setviewportproperties viewport = <viewport> no_resolve_depthstencilbuffer = true
	spawnscriptnow update_crowd_model_cam params = {
		camera = <camera>
		pos = <pos>
		viewport = <viewport>
	}
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = <viewport>
		viewportid = <viewport>
		texture = ($<crowd_models> [<array_count>].textureasset)
		texdict = ($<crowd_models> [<array_count>].texdict)
	}
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script update_crowd_model_cam 
	begin
	getviewportcameraorient \{viewport = 0}
	posdir = (<pos> + (0.0, 1.2, 0.0) + (<at> * 3.5))
	<camera> :obj_setposition position = <posdir>
	setviewportcameraorient viewport = <viewport> at = <at> left = <left> up = <up>
	<camera> :sethfov hfov = 20.0
	<camera> :unpause
	wait \{1
		gameframe}
	repeat
endscript

script destroy_crowd_models 
	if NOT gotparam crowd_models
		scriptassert "crowd_models array not found"
	endif
	if NOT globalexists name = <crowd_models>
		scriptassert "crowd_models array not found"
	endif
	getarraysize $<crowd_models>
	array_count = 0
	begin
	formattext checksumname = name '%a_crowd_ped_%c' a = ($<crowd_models> [<array_count>].prefix) c = <array_count>
	formattext checksumname = bgname '%a_crowd_ped_bg%c' a = ($<crowd_models> [<array_count>].prefix) c = <array_count>
	formattext checksumname = camera '%a_crowd_camera_%c' a = ($<crowd_models> [<array_count>].prefix) c = <array_count>
	formattext checksumname = viewport '%a_crowd_viewport_%c' a = ($<crowd_models> [<array_count>].prefix) c = <array_count>
	if screenelementexists id = <viewport>
		destroyviewporttextureoverride id = <viewport>
	endif
	killspawnedscript name = update_crowd_model_cam
	if compositeobjectexists name = <camera>
		<camera> :die
	endif
	if screenelementexists id = <viewport>
		destroyscreenelement id = <viewport>
	endif
	if compositeobjectexists name = <name>
		<name> :die
	endif
	if compositeobjectexists name = <bgname>
		<bgname> :die
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript
