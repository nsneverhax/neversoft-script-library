max_wheel_speed = 16.0
resetcameratoviewerobject = 1
useplayerposforviewerobjpos = 1
applyviewerobjmodeltoplayer = 0
defaultviewerobjpos = (0.0, 0.0, 0.0)
viewerautorepeattime = 30
viewerautorepeatspeed = 0
ModelViewerHeap = bottomupheap

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
	if objectexists id = vo_line1
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
	setprops \{just = [
			left
			center
		]
		rgba = [
			10
			128
			10
			115
		]}
	domorph pos = <xy> alpha = 1 scale = 0.6
endscript

script viewerobj_add_components 
	if gotparam skeletonname
		if NOT gotparam animeventtablename
			GetAnimEventTableName AnimType = <skeletonname>
		endif
		if NOT (<skeletonname> = car)
			createcomponentfromstructure {
				component = animtree
				animeventtablename = <animeventtablename>
				<...>
				defaultcommandtarget = modelviewernode
			}
		endif
	endif
	if gotparam skeletonname
		createcomponentfromstructure {
			component = skeleton
			<...>
			skeleton = <skeletonname>
			max_bone_skip_lod = 0
		}
	endif
	createcomponentfromstructure component = model <...> usemodellights
	createcomponentfromstructure component = skatersound
	createcomponentfromstructure component = skaterloopingsound
endscript

script viewerobj_init_model \{buildscript = create_model_from_appearance}
	if gotparam \{profile}
		scriptassert \{"this should be done in code"}
	else
		if gotparam \{modelname}
			obj_initmodel <...>
		else
			if gotparam \{model}
				obj_initmodel <...>
			else
				script_assert \{"no model name!"}
			endif
		endif
	endif
	obj_getid
	runscriptonobject id = <objid> set_viewerobj_anim_handlers
endscript

script launch_view_models_menu 
	runscriptonscreenelement id = current_menu_anchor animate_out callback = create_view_models_menu callback_params = <...>
endscript

script make_select_view_model_category 
	add_cas_menu_item {
		scale = 0.6
		rot = 0
		text = <text>
		pad_choose_script = launch_view_models_menu
		pad_choose_params = {array = <array>}
	}
endscript

script make_select_view_model_line \{buildscript = create_model_from_appearance}
	add_cas_menu_item {
		scale = 0.6
		rot = 0
		text = <text>
		pad_choose_script = view_model
		pad_choose_params = {<...>}
	}
endscript

script simple_focus 
	gettags
	setscreenelementprops id = <id> rgba = [128 128 128 128]
endscript

script simple_unfocus 
	gettags
	setscreenelementprops id = <id> rgba = [70 70 70 128]
endscript

script create_view_models_menu 
	if screenelementexists id = view_models_menu
		destroyscreenelement id = view_models_menu
	endif
	make_cas_menu {
		menu_id = view_models_menu
		vmenu_id = view_models_vmenu
		title = "MODELS"
		scrolling
	}
	setanalogstickactiveformenus 0
	SetPositionalSoundSilenceOverrideMode 1
	setscreenelementprops {
		id = view_models_vmenu
		event_handlers = [
			{pad_back exit_view_models_menu params = {array = <array>}}
		]
	}
	add_view_models_to_menu <...>
	runscriptonscreenelement id = current_menu_anchor animate_in
endscript

script view_models_menu_cleanup 
	setanalogstickactiveformenus \{1}
	SetPositionalSoundSilenceOverrideMode \{0}
	if screenelementexists \{id = view_models_menu}
		destroyscreenelement \{id = view_models_menu}
	endif
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
	buildscript = create_model_from_appearance
}
last_profile_valid = false

script setreferencechecksum 
	printf \{"'SetReferenceChecksum' is deprecated"}
endscript

script view_model 
	printf "View Model here"
	if gotextramemory
		mempushcontext $ModelViewerHeap
	endif
	lock = off
	if areassetslocked
		allowassetloading on
		lock = on
	endif
	if gotparam animloadscript
		if scriptexists <animloadscript>
			<animloadscript>
		endif
	endif
	if gotparam extraanim
		if scriptexists <extraanim>
			<extraanim>
		endif
	endif
	if gotextramemory
		mempopcontext
	endif
	if (istrue $useplayerposforviewerobjpos)
		skater :obj_getposition
		<viewerobjpos> = <pos>
		skater :hide
	else
		<viewerobjpos> = <defaultviewerobjpos>
	endif
	if gotparam use_last_model_viewed
		if ($last_profile_valid = false)
			GetPlayerAppearance player = 0
			buildscript = create_model_from_appearance
		else
			profile = ($last_profile_viewed.profile)
			buildscript = ($last_profile_viewed.buildscript)
		endif
	endif
	if gotparam body_shape
		setviewermodel <...> profile = {<profile> body_shape = <body_shape>} scale = (<body_shape>.scale)
	else
		setviewermodel <...>
	endif
	if gotparam profile
		change last_profile_valid = true
		change last_profile_viewed = {profile = <profile> buildscript = <buildscript>}
	endif
	if gotparam defaultanim
		setvieweranim <defaultanim>
	endif
	if (<lock> = on)
		allowassetloading off
	endif
	if istrue $applyviewerobjmodeltoplayer
		set_player_to_model no_exit
	endif
endscript

script set_player_to_model 
	printf "Setting player to model"
	if ($last_profile_valid = true)
		GetCurrentSkaterProfileIndex
		SetPlayerAppearance player = <currentskaterprofileindex> appearance_structure = ($last_profile_viewed.profile)
		EditPlayerAppearance profile = <currentskaterprofileindex> target = setpart targetparams = {part = cas_board desc_id = `default`}
		RefreshSkaterModel profile = <currentskaterprofileindex> skater = 0 buildscript = ($last_profile_viewed.buildscript)
	else
		printf "Can't apply explicit models, only profiles"
	endif
	if NOT gotparam no_exit
		toggle_model_viewer
	endif
endscript

script unhideplayeranddestroyfakes 
	killspawnedscript \{name = _testanimsequence}
	if compositeobjectexists \{name = fakeskater}
		fakeskater :die
	endif
	if compositeobjectexists \{name = animtreepreviewobject}
		animtreepreviewobject :die
	endif
	if compositeobjectexists \{name = skater}
		skater :unhide
	endif
endscript

script testanim \{skeleton = sk9_skater}
	if gotparam \{off}
		unhideplayeranddestroyfakes
	else
		reloadandtestanim <...> skeleton = <skeleton>
	endif
endscript

script reloadandtestanim 
	killspawnedscript name = _testanimsequence
	launchevent type = drawrequested data = {cycledown}
	formattext checksumname = animname '%s' s = <anim> dontassertforchecksums
	if gotparam differenceanim
		if (<differenceanim> = "")
		else
			formattext checksumname = differenceanimname '%s' s = <differenceanim>
		endif
	endif
	skater :hide
	createfake original = skater Fake = fakeskater skeleton = sk9_skater
	if gotparam cycle
		fakeskater :modelviewer_playanim anim = <animname> blendperiod = 0 speed = <speed> cycle
	else
		fakeskater :modelviewer_playanim anim = <animname> blendperiod = 0 speed = <speed>
	endif
	if gotparam differenceanim
		fakeskater :obj_posecontrollercommand command = playsequence differenceanimname = <differenceanimname> differenceanimamount = <differenceanimamount>
	endif
	fakeskater :obj_forceupdate
endscript

script createfake 
	if NOT compositeobjectexists name = <original>
		return
	endif
	if compositeobjectexists name = <Fake>
		<Fake> :die
	endif
	updateanimcache clear
	<original> :obj_getposition
	<original> :obj_getquat
	createcompositeobject {
		components = [
			{
				component = suspend
			}
			{
				component = animtree
			}
			{
				component = skeleton
			}
			{
				component = setdisplaymatrix
			}
			{
				component = model
				clonefrom = <original>
				usemodellights
			}
		]
		params = {
			skeletonname = <skeleton>
			name = <Fake>
			pos = <pos>
			orientation = <quat>
		}
	}
	<Fake> :modelviewer_initanimtree
endscript

script updateherodifferenceanim 
	if (<differenceanim> = "")
	else
		formattext checksumname = differenceanimname '%s' s = <differenceanim>
		if compositeobjectexists \{name = FakeHero}
			FakeHero :updatedifferenceanim differenceanimname = <differenceanimname> differenceanimamount = <differenceanimamount>
		endif
	endif
endscript

script _testanimsequence 
	if gotparam animations
		createfake original = skater Fake = fakeskater skeleton = sk9_skater
		skater :hide
		begin
		getarraysize <animations>
		<index> = 0
		begin
		formattext checksumname = animname '%s' s = (<animations> [<index>].anim) dontassertforchecksums
		fakeskater :modelviewer_playanim {
			anim = <animname>
			speed = (<animations> [<index>].speed)
			blendperiod = (<animations> [<index>].blendperiod)
		}
		if (<index> = 0)
			fakeskater :obj_forceupdate
		endif
		fakeskater :modelviewer_waitanimfinished
		<index> = (<index> + 1)
		repeat <array_size>
		if NOT gotparam cycle
			break
		endif
		repeat
		wait 1 second
		spawnscriptlater unhideplayeranddestroyfakes
	endif
endscript

script testanimsequence 
	killspawnedscript \{name = _testanimsequence}
	spawnscriptlater _testanimsequence params = <...>
endscript

script toggle_model_viewer 
	if NOT screenelementexists \{id = view_models_menu}
		view_model \{use_last_model_viewed
			skeletonname = sk9_skater
			animeventtablename = skateranimeventtable
			defaultanim = ped_m_idle1}
		create_view_models_menu
	else
		unpauseskaters \{0}
		change \{view_mode = 0}
		toggleviewmode
		toggleviewmode
		toggleviewmode
		skater :unhide
		view_models_menu_cleanup
	endif
endscript

script killanimpreviewrefs 
	unhideplayeranddestroyfakes
endscript
