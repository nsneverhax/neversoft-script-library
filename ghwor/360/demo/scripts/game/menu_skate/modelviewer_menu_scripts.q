max_wheel_speed = 16.0
resetcameratoviewerobject = 1
useplayerposforviewerobjpos = 1
applyviewerobjmodeltoplayer = 0
defaultviewerobjpos = (0.0, 0.0, 0.0)
viewerautorepeattime = 30
viewerautorepeatspeed = 0

script add_view_models_to_menu 
	if gotparam \{array}
		if globalexists name = <array> type = array
			getarraysize <array>
			if (<array_size> > 0)
				foreachin (<array>) do = make_select_view_model_line
			endif
		endif
	else
		foreachin \{$modelviewer_categories
			do = make_select_view_model_category}
	endif
endscript

script draw_viewer_object_panel 
	viewer_obj_get_panel_info
	if objectexists \{id = vo_line1}
		setscreenelementprops {id = vo_line1 text = <line1>}
		setscreenelementprops {id = vo_line2 text = <line2>}
		setscreenelementprops {id = vo_line3 text = <line3>}
		setscreenelementprops {id = vo_line4 text = <line4>}
	else
		create_panel_message id = vo_line1 text = <line1> style = panel_message_viewobj_line params = {xy = (40.0, 380.0)}
		create_panel_message id = vo_line2 text = <line2> style = panel_message_viewobj_line params = {xy = (40.0, 400.0)}
		create_panel_message id = vo_line3 text = <line3> style = panel_message_viewobj_line params = {xy = (40.0, 420.0)}
		create_panel_message id = vo_line4 text = <line4> style = panel_message_viewobj_line params = {xy = (40.0, 440.0)}
	endif
endscript

script kill_viewer_object_panel 
	if objectexists \{id = vo_line1}
		runscriptonscreenelement \{id = vo_line1
			kill_panel_message}
	endif
	if objectexists \{id = vo_line2}
		runscriptonscreenelement \{id = vo_line2
			kill_panel_message}
	endif
	if objectexists \{id = vo_line3}
		runscriptonscreenelement \{id = vo_line3
			kill_panel_message}
	endif
	if objectexists \{id = vo_line4}
		runscriptonscreenelement \{id = vo_line4
			kill_panel_message}
	endif
endscript

script panel_message_viewobj_line 
	se_setprops \{just = [
			left
			center
		]
		rgba = [
			10
			128
			10
			115
		]}
	legacydomorph pos = <xy> alpha = 1 scale = 0.6
endscript

script viewerobj_add_components 
	printf \{'viewerobj_add_components'}
	obj_setorientation \{dir = (0.0, 0.0, 1.0)}
	if gotparam \{skeletonname}
		if NOT (<skeletonname> = car)
			createcomponentfromstructure {
				component = animtree
				<...>
				defaultcommandtarget = modelviewernode
			}
		endif
	endif
	if gotparam \{skeletonname}
		createcomponentfromstructure {
			component = skeleton
			<...>
			skeleton = <skeletonname>
			max_bone_skip_lod = 0
		}
	endif
	createcomponentfromstructure component = model <...> usemodellights
endscript

script viewerobj_init_model \{buildscript = modelbuilder_build_model}
	printf \{'viewerobj_init_model'}
	if gotparam \{profile}
		scriptassert \{qs(0xe737a7c0)}
	else
		if gotparam \{modelname}
			obj_initmodel <...>
		else
			if gotparam \{model}
				obj_initmodel <...>
			else
				script_assert \{qs(0xb303b84e)}
			endif
		endif
	endif
	obj_getid
	runscriptonobject id = <objid> set_viewerobj_anim_handlers
	obj_rotate \{relative = 0}
endscript

script launch_view_models_menu 
	create_view_models_menu <...>
endscript

script make_select_view_model_category 
	add_generic_menu_text_item {
		scale = 0.6
		rot = 0
		text = <text>
		pad_choose_script = launch_view_models_menu
		pad_choose_params = {array = <array>}
	}
endscript

script make_select_view_model_line \{buildscript = modelbuilder_build_model}
	add_generic_menu_text_item {
		scale = 0.6
		rot = 0
		text = <text>
		pad_choose_script = view_model
		pad_choose_params = {<...>}
	}
endscript

script simple_focus 
	obj_getid
	<id> = <objid>
	setscreenelementprops id = <id> rgba = [128 128 128 128]
endscript

script simple_unfocus 
	obj_getid
	<id> = <objid>
	setscreenelementprops id = <id> rgba = [70 70 70 128]
endscript

script create_view_models_menu 
	generic_ui_destroy
	if screenelementexists \{id = view_models_menu}
		destroyscreenelement \{id = view_models_menu}
	endif
	playigccam \{id = modelview_view_cam_id
		name = modelview_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (-1.068807, 1.299001, 3.7975957)
		quat = (0.000506, 0.99942994, -0.017537998)
		fov = 72.0
		play_hold = 1
		interrupt_current}
	make_generic_menu \{menu_id = view_models_menu
		vmenu_id = view_models_vmenu
		title = qs(0x64189d33)
		scrolling}
	setanalogstickactiveformenus \{0}
	setscreenelementprops {
		id = view_models_vmenu
		event_handlers = [
			{pad_back exit_view_models_menu params = {array = <array>}}
		]
	}
	add_view_models_to_menu <...>
endscript

script view_models_menu_cleanup 
	setanalogstickactiveformenus \{1}
	if screenelementexists \{id = view_models_menu}
		destroyscreenelement \{id = view_models_menu}
	endif
	killcamanim \{name = modelview_view_cam}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
endscript

script exit_view_models_menu 
	if gotparam \{array}
		view_models_menu_cleanup
		create_view_models_menu
	else
		toggle_model_viewer
	endif
endscript
last_profile_viewed = {
	profile = no_profile
	buildscript = modelbuilder_build_model
}
last_profile_valid = false

script setreferencechecksum 
	printf \{qs(0xaf299c39)}
endscript

script view_model 
	printf \{qs(0x3e39e076)}
	if ((isxenon) && (gotextramemory))
		mempushcontext \{heap_debug}
	else
		mempushcontext \{bottomupheap}
	endif
	lock = off
	if areassetslocked
		allowassetloading \{on}
		lock = on
	endif
	if gotparam \{animloadscript}
		if scriptexists <animloadscript>
			<animloadscript>
		endif
	endif
	if gotparam \{extraanim}
		if scriptexists <extraanim>
			<extraanim>
		endif
	endif
	mempopcontext
	if NOT compositeobjectexists \{guitarist}
		create_guitarist
	endif
	if (istrue $useplayerposforviewerobjpos)
		guitarist :obj_getposition
		<viewerobjpos> = <pos>
		guitarist :hide
	else
		<viewerobjpos> = <defaultviewerobjpos>
	endif
	if gotparam \{use_last_model_viewed}
		if ($last_profile_valid = false)
			getcasappearance \{player = 0}
			profile = <appearance>
			buildscript = modelbuilder_build_model
		else
			profile = ($last_profile_viewed.profile)
			buildscript = ($last_profile_viewed.buildscript)
		endif
	endif
	if gotparam \{body_shape}
		setviewermodel <...> profile = {<profile> body_shape = <body_shape>} scale = (<body_shape>.scale)
	else
		setviewermodel <...>
	endif
	if gotparam \{profile}
		change \{last_profile_valid = true}
		change last_profile_viewed = {profile = <profile> buildscript = <buildscript>}
	endif
	if gotparam \{defaultanim}
		setvieweranim <defaultanim>
	endif
	if (<lock> = on)
		allowassetloading \{off}
	endif
	if istrue \{$applyviewerobjmodeltoplayer}
		set_player_to_model \{no_exit}
	endif
endscript

script set_player_to_model 
	printf \{qs(0x121b3d41)}
	if ($last_profile_valid = true)
		setcasappearance appearance = ($last_profile_viewed.profile)
		editcasappearance \{target = setpart
			targetparams = {
				part = cas_board
				desc_id = `default`
			}}
		updatecurrentcasmodel buildscript = ($last_profile_viewed.buildscript)
	else
		printf \{qs(0x274e5097)}
	endif
	if NOT gotparam \{no_exit}
		toggle_model_viewer
	endif
endscript

script toggle_model_viewer \{skeleton = gh3_guitarist_axel}
	if NOT screenelementexists \{id = view_models_menu}
		view_model {
			use_last_model_viewed
			skeletonname = <skeleton>
			defaultanim = ped_m_idle1
		}
		create_view_models_menu
	else
		change \{view_mode = 0}
		toggleviewmode
		toggleviewmode
		toggleviewmode
		guitarist :unhide
		view_models_menu_cleanup
	endif
endscript
