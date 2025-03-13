current_crowd = 1.0
average_crowd = 1.0
total_crowd = 0.0
max_crowd = 0.0
crowd_scale = 2.0
health_scale = 2.0
crowd_debug_mode = 0
viewercam_nofail = 0
crowd_ped_camera_dist = 3.5
crowd_ped_camera_height = 1.07
crowd_ped_camera_fov = 21
crowd_rotate_param = 25.0
crowd_base_viewport_id = crowd_base_viewport
crowd_base_viewport_texture = `tex/models/real_crowd/crowd_atlas0.dds`
crowd_config_xenon = crowd_config_4x1_nojiggle_1024x512
crowd_config_ps3 = crowd_config_4x1_nojiggle_1024x512
crowd_config_windx = crowd_config_4x1_nojiggle_1024x512
g_crowd_audio_anim_cues_enabled = 0

script crowd_reset \{loading_transition = 0
		restarting = 0}
	if ($game_mode = tutorial)
		return
	endif
	desired_health = 1.0
	change current_crowd = <desired_health>
	change average_crowd = <desired_health>
	change \{total_crowd = 0.0}
	change \{max_crowd = 0.0}
	getfirstplayer \{out = first_player}
	if (<player> = <first_player>)
		stopsoundevent \{$currentlyplayingoneshotsoundevent}
		if ($current_playing_transition = loading)
			if NOT (getnodeflag ls_encore_post)
			endif
		elseif ($game_mode = practice)
		elseif (<restarting> = 1)
			if ($calibrate_lag_enabled = 0)
				spawnscriptnow \{sfx_backgrounds_new_area
					params = {
						bg_sfx_area = $g_current_crowd_looping_bg_area_neutral
						fadeintime = 10
						fadeintype = linear
						fadeouttime = 10
						fadeouttype = linear
					}}
			else
				spawnscriptnow \{sfx_backgrounds_new_area
					params = {
						bg_sfx_area = frontend
						fadeintime = 10
						fadeintype = linear
						fadeouttime = 10
						fadeouttype = linear
					}}
			endif
		elseif ($end_credits = 1 ||
				getnodeflag ls_encore_post)
			if scriptexists \{audio_crowd_play_loading_screen_swell}
				killspawnedscript \{name = audio_crowd_play_loading_screen_swell}
				setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol)} time = 1}
			endif
		else
		endif
	endif
	getplayerinfo <player> band
	setplayerinfo <player> current_health = <desired_health>
	setbandinfo <band> current_health = <desired_health>
	crowdreset
	playlist_getcurrentsong
	get_song_prefix song = <current_song>
	formattext checksumname = scriptevents '%s_scriptevents' s = <song_prefix> addtostringlookup = true
	change \{g_crowd_audio_anim_cues_enabled = 1}
	if songglobalexists name = <scriptevents>
		if checkscriptevents name = <scriptevents> event = change_crowd_state
			killspawnedscript \{name = crowd_playanim_spawned}
			change \{g_crowd_audio_anim_cues_enabled = 0}
		endif
	endif
endscript

script forcescore 
	switch $debug_forcescore
		case poor
		health = ($health_poor_medium / 2)
		case medium
		health = (($health_poor_medium + $health_medium_good) / 2)
		case good
		health = (($health_medium_good + $health_scale) / 2)
		default
		health = ($health_poor_medium / 2)
	endswitch
	setplayerinfo <player> current_health = <health>
	change current_crowd = <health>
endscript
base_resolve_priority = 7

script create_crowd_models 
	if ($disable_crowd = 1)
		return
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = crowd_models '%s_2D_crowd_models' s = <pakname>
	if NOT globalexists name = <crowd_models>
		return
	endif
	mempushcontext \{heap_crowd}
	change crowd_model_array = $<crowd_models>
	getplatform
	if (<platform> = xenon)
		crowd_config = $crowd_config_xenon
	elseif (<platform> = windx)
		crowd_config = $crowd_config_windx
	elseif (<platform> = ps3)
		crowd_config = $crowd_config_ps3
	else
		scriptassert \{qs(0x34a7da06)}
	endif
	base_style = ($<crowd_config>.base_viewport_params.style)
	createviewport {
		priority = ($base_resolve_priority)
		id = ($crowd_base_viewport_id)
		texture = ($crowd_base_viewport_texture)
		style = <base_style>
	}
	setviewportproperties {
		viewport = ($crowd_base_viewport_id)
		no_resolve_colorbuffer = ($<crowd_config>.base_viewport_params.no_resolve_color_buffer)
		resolve_invalidated = ($<crowd_config>.base_viewport_params.resolve_invalidated)
		no_resolve_depthstencilbuffer = true
		clear_colorbuffer = false
		clear_depthstencilbuffer = false
		crowd_impostor = true
	}
	getarraysize $<crowd_models>
	getarraysize param = config_num_viewports ($<crowd_config>.ped_viewport_params)
	if (<array_size> > <config_num_viewports>)
		scriptassert 'Crowd models array has %a, but there are only %b viewports in the viewport configuration' a = <array_size> b = <config_num_viewports>
	endif
	crowd_bb_mesh_idx = 0
	begin
	bb_base_sector_name = ($<crowd_models> [<crowd_bb_mesh_idx>].bb_mesh_id)
	addcrowdtovisibilitytest crowdnode = <bb_base_sector_name>
	<crowd_bb_mesh_idx> = (<crowd_bb_mesh_idx> + 1)
	repeat <array_size>
	array_count = 0
	begin
	pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	viewport = ($<crowd_models> [<array_count>].id)
	camera = ($<crowd_models> [<array_count>].camera)
	bb_sector_name = ($<crowd_models> [<array_count>].bb_mesh_id)
	if NOT structurecontains structure = ($<crowd_models> [<array_count>]) remap_only
		if isps3
			mempushcontext \{bottomupheap}
		endif
		createfromstructure {
			pos = <pos>
			quat = (0.0, 1.0, 0.0)
			class = gameobject
			type = ghost
			createdatstart
			($<crowd_models> [<array_count>])
			suspenddistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			profile = $profile_ped_crowd_obj
			lightgroup = crowd
			interleave_animations
			object_type = crowd
			profilecolor = 49344
			profilebudget = 200
			use_jq
			viewports = [all]
		}
		model_id = ($<crowd_models> [<array_count>].name)
		extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
		<model_id> :addgeom lhand_rock model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
		<model_id> :addgeom lhand_clap model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Fist.skin'
		<model_id> :addgeom lhand_fist model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Rock.skin'
		<model_id> :addgeom rhand_rock model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Clap.skin'
		<model_id> :addgeom rhand_clap model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Fist.skin'
		<model_id> :addgeom rhand_fist model = <extra_model> lightgroup = crowd
		<model_id> :switchoffatomic lhand_rock
		<model_id> :switchoffatomic lhand_fist
		<model_id> :switchonatomic lhand_clap
		<model_id> :switchoffatomic rhand_rock
		<model_id> :switchoffatomic rhand_fist
		<model_id> :switchonatomic rhand_clap
		<model_id> :obj_setnoquadcull
		roty = 0
		if structurecontains structure = ($<crowd_models> [<array_count>]) roty
			roty = ($<crowd_models> [<array_count>].roty)
		endif
		if (<roty> = 0)
			apply_correction = 1
		else
			apply_correction = 0
			($<crowd_models> [<array_count>].name) :obj_setorientation y = (180 + <roty>)
		endif
		if NOT (<bb_sector_name> = 0)
			toggleintrameshsorting on = 1 objid = <bb_sector_name>
		endif
		if isps3
			mempopcontext \{bottomupheap}
		endif
		style = 0x00000000
		use_resource = 0x00000000
		if structurecontains structure = ($<crowd_models> [<array_count>]) resourceviewport
			<use_resource> = ($<crowd_models> [<array_count>].resourceviewport)
		endif
		printstruct <...>
		createviewport {
			priority = ($base_resolve_priority + 1 + <array_count>)
			id = <viewport>
			texture = ($<crowd_models> [<array_count>].texture)
			style = ($<crowd_config>.ped_viewport_params [<array_count>].style)
			use_resource = <use_resource>
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
				profilecolor = 12632064
				profilebudget = 10
				use_jq
				far_clip = 20
			}
		}
		jiggle = ($<crowd_config>.jiggle)
		if (<jiggle> != 0)
			jiggle_index = ($<crowd_config>.index [<array_count>])
		else
			jiggle_index = 0
		endif
		no_resolve_colorbuffer = ($<crowd_config>.ped_viewport_params [<array_count>].no_resolve_color_buffer)
		setactivecamera viewport = <viewport> id = <camera>
		<camera> :sethfov hfov = $crowd_ped_camera_fov
		setviewportproperties viewport = <viewport> no_resolve_colorbuffer = <no_resolve_colorbuffer> no_resolve_depthstencilbuffer = true crowd_impostor = true jiggle_rendering = <jiggle> jiggle_count = <jiggle_index>
		addcrowdmodelcam camera = <camera> pos = <pos> viewport = <viewport> apply_correction = <apply_correction>
	endif
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = <viewport>
		viewportid = <viewport>
		texture = ($<crowd_models> [<array_count>].textureasset)
		texdict = ($<crowd_models> [<array_count>].texdict)
	}
	setsearchallassetcontexts \{off}
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	mempopcontext \{heap_crowd}
	setspecificrendertargetheap
endscript

script update_crowd_model_cam 
	crowd_scaler = 25
	begin
	getviewportcameraorient \{viewport = bg_viewport}
	getvectorcomponents <at>
	angle = (<x> * <crowd_scaler>)
	rotatevector vector = <at> ry = <angle>
	at = <result_vector>
	rotatevector vector = <left> ry = <angle>
	left = <result_vector>
	rotatevector vector = <up> ry = <angle>
	up = <result_vector>
	posdir = (<model_pos> + (0.0, 1.0, 0.0) + (<at> * 3.5))
	<camera> :obj_setposition position = <posdir>
	<camera> :obj_setorientation dir = <at> only handles upright cameras
	setviewportcameraorient viewport = <viewport> at = <at> left = <left> up = <up>
	<camera> :unpause
	wait \{1
		gameframe}
	repeat
endscript
g_old_visibility_mask = 0

script hide_crowd_models \{active = true}
	if gotparam \{from_scriptevent}
		wait_for_next_odd_frame
		wait \{5
			gameframes}
	endif
	crowd_models = $crowd_model_array
	if (<crowd_models> != none)
		getarraysize <crowd_models>
		array_count = 0
		begin
		viewport = (<crowd_models> [<array_count>].id)
		objid = (<crowd_models> [<array_count>].name)
		if objectexists id = <objid>
			if NOT structurecontains structure = (<crowd_models> [<array_count>]) remap_only
				if (<active> = true)
					<objid> :hide
				else
					<objid> :unhide
				endif
			endif
		endif
		<array_count> = (<array_count> + 1)
		repeat <array_size>
	endif
	getrenderbatchsystemvisibility \{name = crowd3d}
	if (<active> = true)
		if (<visibility_mask> != 1)
			change g_old_visibility_mask = <visibility_mask>
			setrenderbatchsystemvisibility \{name = crowd3d
				visibility_mask = 1}
		endif
	else
		if (<visibility_mask> = 1)
			if ($g_old_visibility_mask = 1)
				setrenderbatchsystemvisibility \{name = crowd3d
					visibility_mask = 4}
			else
				setrenderbatchsystemvisibility name = crowd3d visibility_mask = ($g_old_visibility_mask)
				change \{g_old_visibility_mask = 1}
			endif
		endif
	endif
endscript

script destroy_crowd_models 
	clearcrowdmodelcams
	clearcrowdsfromvisibilitytest
	destroycrowd3d
	crowd_models = $crowd_model_array
	if (<crowd_models> = none)
		return
	endif
	getarraysize <crowd_models>
	array_count = 0
	begin
	if NOT structurecontains structure = (<crowd_models> [<array_count>]) remap_only
		killspawnedscript \{name = update_crowd_model_cam}
		if compositeobjectexists name = (<crowd_models> [<array_count>].camera)
			(<crowd_models> [<array_count>].camera) :die
		endif
		if screenelementexists id = (<crowd_models> [<array_count>].id)
			setsearchallassetcontexts
			destroyviewporttextureoverride id = (<crowd_models> [<array_count>].id)
			setsearchallassetcontexts \{off}
			destroyscreenelement id = (<crowd_models> [<array_count>].id)
		endif
		setsearchallassetcontexts
		destroyviewporttextureoverride id = (<crowd_models> [<array_count>].id)
		setsearchallassetcontexts \{off}
		if viewportexists id = (<crowd_models> [<array_count>].id)
			destroyviewport id = (<crowd_models> [<array_count>].id)
		endif
		if compositeobjectexists name = (<crowd_models> [<array_count>].name)
			(<crowd_models> [<array_count>].name) :die
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	destroyviewport id = ($crowd_base_viewport_id)
	change \{crowd_model_array = none}
endscript

script set_crowd_hand \{hand = left
		type = clap}
	obj_getid
	name = <objid>
	if (<hand> = left)
		switch (<type>)
			case rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			part = lhand_fist
		endswitch
		<name> :switchoffatomic lhand_rock
		<name> :switchoffatomic lhand_clap
		<name> :switchoffatomic lhand_fist
		<name> :switchonatomic <part>
	else
		switch (<type>)
			case rock
			part = rhand_rock
			case clap
			part = rhand_clap
			case fist
			part = rhand_fist
		endswitch
		<name> :switchoffatomic rhand_rock
		<name> :switchoffatomic rhand_clap
		<name> :switchoffatomic rhand_fist
		<name> :switchonatomic <part>
	endif
endscript

script crowd_allplayanim \{playonce = false}
	if ($g_crowd_audio_anim_cues_enabled = 0)
		return
	endif
	if compositeobjectexists \{crowd3d_model1}
		name = crowd3d_model1
	else
		if compositeobjectexists \{crowd1}
			name = crowd1
		else
			return
		endif
	endif
	<name> :obj_killspawnedscript name = crowd_playanim_spawned
	<name> :obj_spawnscriptnow crowd_playanim_spawned params = {anim = <anim> playonce = <playonce>}
endscript

script crowd_playanim_spawned \{playonce = false}
	enable_swell = 1
	switch <anim>
		case swellsh
		peak_time = 2.5
		fade_time = 6.5
		case swellmd
		peak_time = 4.0
		fade_time = 8.0
		case swelllg
		peak_time = 0.5
		fade_time = 7.0
		case idle
		enable_swell = 0
		change_crowd_state \{new_state = mellow}
		wait \{5
			seconds}
	endswitch
	if (<enable_swell> = 1)
		hero_get_skill_level_cfunc
		switch <skill>
			case bad
			change_crowd_state \{new_state = mellow}
			wait (<peak_time> / 2) seconds
			change_crowd_state \{new_state = interested}
			wait (<peak_time> / 2) seconds
			wait (<fade_time> / 2) seconds
			change_crowd_state \{new_state = mellow}
			wait (<fade_time> / 2) seconds
			case normal
			change_crowd_state \{new_state = interested}
			wait (<peak_time> / 2) seconds
			change_crowd_state \{new_state = stoked}
			wait (<peak_time> / 2) seconds
			wait (<fade_time> / 2) seconds
			change_crowd_state \{new_state = interested}
			wait (<fade_time> / 2) seconds
			case good
			change_crowd_state \{new_state = stoked}
			wait (<peak_time> / 2) seconds
			change_crowd_state \{new_state = insane}
			wait (<peak_time> / 2) seconds
			wait (<fade_time> / 2) seconds
			change_crowd_state \{new_state = stoked}
			wait (<fade_time> / 2) seconds
		endswitch
	endif
	begin
	hero_get_skill_level_cfunc
	switch <skill>
		case bad
		change_crowd_state \{new_state = mellow}
		case normal
		change_crowd_state \{new_state = interested}
		case good
		change_crowd_state \{new_state = stoked}
	endswitch
	wait \{4
		seconds}
	repeat
endscript

script crowd_stagediver_hide \{index = 1}
	getpakmancurrentname \{map = zones}
	formattext checksumname = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if compositeobjectexists name = <stagediver>
		<stagediver> :hide
	endif
endscript

script crowd_stagediver_jump \{index = 1}
	getpakmancurrentname \{map = zones}
	formattext checksumname = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if compositeobjectexists name = <stagediver>
		<stagediver> :unhide
		getpakmancurrent \{map = zones}
		if structurecontains structure = ($stagediver_anims) name = <pak>
			anims = ($stagediver_anims.<pak>)
		else
			anims = ($stagediver_anims.`default`)
		endif
		getarraysize <anims>
		getrandomvalue name = anim_index integer a = 0 b = (<array_size> - 1)
		anim_name = (<anims> [<anim_index>])
		printf channel = crowd qs(0xb75db1d6) a = <anim_name>
		<stagediver> :gameobj_playanim anim = <anim_name>
		<stagediver> :gameobj_waitanimfinished
		<stagediver> :hide
	else
		printf \{channel = crowd
			qs(0x7797b93e)}
	endif
endscript
crowd3d_static_tree = {
	id = body
	type = degenerateblend
}

script createcrowd3d 
	if ($disable_crowd = 1)
		return
	endif
	printf \{qs(0x04ac502f)}
	formattext checksumname = crowd_models '%s_3D_crowd_models' s = ($ghzones.<zone_name>.name)
	if NOT globalexists name = <crowd_models>
		printf \{qs(0xa03e6592)}
		return
	endif
	mempushcontext \{heap_crowd}
	if (<zone_name> = z_modular)
		vis_mask = ($g_viewport_visibility.tem)
		vis_viewports = [tem]
	else
		vis_mask = ($g_viewport_visibility.ven)
		vis_viewports = [ven]
	endif
	createrenderbatchsystem name = 'Crowd3D' viewport = bg_viewport visibility_mask = <vis_mask> model_count = 8 instance_count = 512 min = 0.9 max = 1.0
	change crowd_3d_model_array = $<crowd_models>
	getarraysize $<crowd_models>
	array_count = 0
	begin
	pos = ((0.0, 0.0, 0.0) + (0.0, -5.0, 0.0) * <array_count>)
	setsearchallassetcontexts
	if NOT structurecontains structure = ($<crowd_models> [<array_count>]) remap_only
		if isps3
		endif
		formattext textname = array_count_string '%i' i = (<array_count> + 1)
		appendsuffixtochecksum base = crowd3d_model suffixstring = <array_count_string>
		<model_name> = <appended_id>
		createfromdesc {
			name = <model_name>
			pos = <pos>
			quat = (0.0, 1.0, 0.0)
			class = gameobject
			type = ghost
			createdatstart
			model = ($<crowd_models> [<array_count>].model)
			suspenddistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			$profile_ped_crowd_obj
			composite_type = levelinstanceobject
			lightgroup = [crowdcards crowd3d]
			interleave_animations
			profilecolor = 49344
			profilebudget = 200
			use_jq
			viewports = <vis_viewports>
		}
		<anim_index> = 1
		begin
		formattext textname = anim_suffix_string '_anim%i' i = <anim_index>
		appendsuffixtochecksum base = <model_name> suffixstring = <anim_suffix_string>
		<anim_name> = <appended_id>
		createfromdesc {
			name = <anim_name>
			pos = <pos>
			quat = (0.0, 1.0, 0.0)
			class = gameobject
			type = ghost
			createdatstart
			suspenddistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			$profile_ped_crowd_obj
			composite_type = levelinstanceanimation
			interleave_animations
			active_value_set = preview
			active_value_source_list = $default_active_values
			profilecolor = 49344
			profilebudget = 200
			use_jq
			viewports = <vis_viewports>
		}
		<anim_name> :anim_inittree tree = $crowd3d_static_tree nodeiddeclaration = [body bodytimer]
		<anim_index> = (<anim_index> + 1)
		repeat 4
		<model_name> :hide
		if isps3
		endif
	endif
	<array_count> = (<array_count> + 1)
	setsearchallassetcontexts \{off}
	repeat <array_size>
	mempopcontext \{heap_crowd}
	printf \{qs(0xc40a8d79)}
endscript

script destroycrowd3d 
	<crowd_models> = [
		crowd3d_model1
		crowd3d_model1_anim1
		crowd3d_model1_anim2
		crowd3d_model1_anim3
		crowd3d_model1_anim4
		crowd3d_model2
		crowd3d_model2_anim1
		crowd3d_model2_anim2
		crowd3d_model2_anim3
		crowd3d_model2_anim4
		crowd3d_model3
		crowd3d_model3_anim1
		crowd3d_model3_anim2
		crowd3d_model3_anim3
		crowd3d_model3_anim4
		crowd3d_model4
		crowd3d_model4_anim1
		crowd3d_model4_anim2
		crowd3d_model4_anim3
		crowd3d_model4_anim4
	]
	getarraysize <crowd_models>
	i = 0
	begin
	<name> = (<crowd_models> [<i>])
	if compositeobjectexists name = <name>
		<name> :die
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	dumpcompositeobjects
	destroyrenderbatchsystem \{name = crowd3d}
	change \{crowd_3d_model_array = none}
endscript
