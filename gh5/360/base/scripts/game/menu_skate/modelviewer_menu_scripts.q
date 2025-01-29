max_wheel_speed = 16.0
resetcameratoviewerobject = 1
useplayerposforviewerobjpos = 1
applyviewerobjmodeltoplayer = 0
defaultviewerobjpos = (0.0, 0.0, 0.0)
viewerautorepeattime = 30
viewerautorepeatspeed = 0

script add_view_models_to_menu 
	if GotParam \{array}
		if GlobalExists Name = <array> Type = array
			GetArraySize <array>
			if (<array_Size> > 0)
				ForEachIn (<array>) do = make_select_view_model_line
			endif
		endif
	else
		ForEachIn \{$modelviewer_categories
			do = make_select_view_model_category}
	endif
endscript

script draw_viewer_object_panel 
	viewer_obj_get_panel_info
	if ObjectExists \{id = vo_line1}
		SetScreenElementProps {id = vo_line1 text = <line1>}
		SetScreenElementProps {id = vo_line2 text = <line2>}
		SetScreenElementProps {id = vo_line3 text = <line3>}
		SetScreenElementProps {id = vo_line4 text = <line4>}
	else
		create_panel_message id = vo_line1 text = <line1> style = panel_message_viewobj_line params = {xy = (40.0, 380.0)}
		create_panel_message id = vo_line2 text = <line2> style = panel_message_viewobj_line params = {xy = (40.0, 400.0)}
		create_panel_message id = vo_line3 text = <line3> style = panel_message_viewobj_line params = {xy = (40.0, 420.0)}
		create_panel_message id = vo_line4 text = <line4> style = panel_message_viewobj_line params = {xy = (40.0, 440.0)}
	endif
endscript

script kill_viewer_object_panel 
	if ObjectExists \{id = vo_line1}
		RunScriptOnScreenElement \{id = vo_line1
			kill_panel_message}
	endif
	if ObjectExists \{id = vo_line2}
		RunScriptOnScreenElement \{id = vo_line2
			kill_panel_message}
	endif
	if ObjectExists \{id = vo_line3}
		RunScriptOnScreenElement \{id = vo_line3
			kill_panel_message}
	endif
	if ObjectExists \{id = vo_line4}
		RunScriptOnScreenElement \{id = vo_line4
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
	legacydomorph Pos = <xy> alpha = 1 Scale = 0.6
endscript

script viewerobj_add_components 
	printf \{'viewerobj_add_components'}
	Obj_SetOrientation \{Dir = (0.0, 0.0, 1.0)}
	if GotParam \{skeletonname}
		if NOT (<skeletonname> = car)
			CreateComponentFromStructure {
				component = AnimTree
				<...>
				DefaultCommandTarget = ModelViewerNode
			}
		endif
	endif
	if GotParam \{skeletonname}
		CreateComponentFromStructure {
			component = Skeleton
			<...>
			Skeleton = <skeletonname>
			max_bone_skip_lod = 0
		}
	endif
	CreateComponentFromStructure component = Model <...> usemodellights
endscript

script viewerobj_init_model \{buildscript = create_model_from_appearance}
	printf \{'viewerobj_init_model'}
	if GotParam \{Profile}
		ScriptAssert \{qs(0xe737a7c0)}
	else
		if GotParam \{modelName}
			obj_initmodel <...>
		else
			if GotParam \{Model}
				obj_initmodel <...>
			else
				script_assert \{qs(0xb303b84e)}
			endif
		endif
	endif
	Obj_GetID
	runscriptonobject id = <objID> set_viewerobj_anim_handlers
	Obj_Rotate \{relative = 0}
endscript

script launch_view_models_menu 
	create_view_models_menu <...>
endscript

script make_select_view_model_category 
	add_generic_menu_text_item {
		Scale = 0.6
		rot = 0
		text = <text>
		pad_choose_script = launch_view_models_menu
		pad_choose_params = {array = <array>}
	}
endscript

script make_select_view_model_line \{buildscript = create_model_from_appearance}
	add_generic_menu_text_item {
		Scale = 0.6
		rot = 0
		text = <text>
		pad_choose_script = view_model
		pad_choose_params = {<...>}
	}
endscript

script simple_focus 
	Obj_GetID
	<id> = <objID>
	SetScreenElementProps id = <id> rgba = [128 128 128 128]
endscript

script simple_unfocus 
	Obj_GetID
	<id> = <objID>
	SetScreenElementProps id = <id> rgba = [70 70 70 128]
endscript

script create_view_models_menu 
	generic_ui_destroy
	if ScreenElementExists \{id = view_models_menu}
		DestroyScreenElement \{id = view_models_menu}
	endif
	PlayIGCCam \{id = modelview_view_cam_id
		Name = modelview_view_cam
		viewport = bg_viewport
		LockTo = World
		Pos = (-1.068807, 1.299001, 3.7975957)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		play_hold = 1
		interrupt_current}
	make_generic_menu \{menu_id = view_models_menu
		vmenu_id = view_models_vmenu
		title = qs(0x64189d33)
		scrolling}
	SetAnalogStickActiveForMenus \{0}
	SetScreenElementProps {
		id = view_models_vmenu
		event_handlers = [
			{pad_back exit_view_models_menu params = {array = <array>}}
		]
	}
	add_view_models_to_menu <...>
endscript

script view_models_menu_cleanup 
	SetAnalogStickActiveForMenus \{1}
	if ScreenElementExists \{id = view_models_menu}
		DestroyScreenElement \{id = view_models_menu}
	endif
	KillCamAnim \{Name = modelview_view_cam}
	SetScreenElementProps \{id = root_window
		tags = {
			menu_state = OFF
		}}
endscript

script exit_view_models_menu 
	if GotParam \{array}
		view_models_menu_cleanup
		create_view_models_menu
	else
		toggle_model_viewer
	endif
endscript
last_profile_viewed = {
	Profile = no_profile
	buildscript = create_model_from_appearance
}
last_profile_valid = FALSE

script setreferencechecksum 
	printf \{qs(0xaf299c39)}
endscript

script view_model 
	printf \{qs(0x3e39e076)}
	if ((isXenon) && (GotExtraMemory))
		MemPushContext \{debugheap}
	else
		MemPushContext \{BottomUpHeap}
	endif
	lock = OFF
	if AreAssetsLocked
		AllowAssetLoading \{On}
		lock = On
	endif
	if GotParam \{animLoadScript}
		if ScriptExists <animLoadScript>
			<animLoadScript>
		endif
	endif
	if GotParam \{extraAnim}
		if ScriptExists <extraAnim>
			<extraAnim>
		endif
	endif
	MemPopContext
	if NOT CompositeObjectExists \{GUITARIST}
		create_guitarist
	endif
	if (IsTrue $useplayerposforviewerobjpos)
		GUITARIST :Obj_GetPosition
		<viewerobjpos> = <Pos>
		GUITARIST :Hide
	else
		<viewerobjpos> = <defaultviewerobjpos>
	endif
	if GotParam \{use_last_model_viewed}
		if ($last_profile_valid = FALSE)
			getcasappearance \{Player = 0}
			Profile = <appearance>
			buildscript = create_model_from_appearance
		else
			Profile = ($last_profile_viewed.Profile)
			buildscript = ($last_profile_viewed.buildscript)
		endif
	endif
	if GotParam \{body_shape}
		setviewermodel <...> Profile = {<Profile> body_shape = <body_shape>} Scale = (<body_shape>.Scale)
	else
		setviewermodel <...>
	endif
	if GotParam \{Profile}
		Change \{last_profile_valid = true}
		Change last_profile_viewed = {Profile = <Profile> buildscript = <buildscript>}
	endif
	if GotParam \{Defaultanim}
		setvieweranim <Defaultanim>
	endif
	if (<lock> = On)
		AllowAssetLoading \{OFF}
	endif
	if IsTrue \{$applyviewerobjmodeltoplayer}
		set_player_to_model \{no_exit}
	endif
endscript

script set_player_to_model 
	printf \{qs(0x121b3d41)}
	if ($last_profile_valid = true)
		setcasappearance appearance = ($last_profile_viewed.Profile)
		editcasappearance \{target = setpart
			targetparams = {
				part = cas_board
				desc_id = Default
			}}
		updatecurrentcasmodel buildscript = ($last_profile_viewed.buildscript)
	else
		printf \{qs(0x274e5097)}
	endif
	if NOT GotParam \{no_exit}
		toggle_model_viewer
	endif
endscript

script toggle_model_viewer \{Skeleton = GH3_guitarist_axel}
	if NOT ScreenElementExists \{id = view_models_menu}
		view_model {
			use_last_model_viewed
			skeletonname = <Skeleton>
			Defaultanim = Ped_M_Idle1
		}
		create_view_models_menu
	else
		Change \{view_mode = 0}
		ToggleViewMode
		ToggleViewMode
		ToggleViewMode
		GUITARIST :unhide
		view_models_menu_cleanup
	endif
endscript
