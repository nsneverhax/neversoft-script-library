max_wheel_speed = 16.0
ResetCameraToViewerObject = 1
UsePlayerPosForViewerObjPos = 1
ApplyViewerObjModelToPlayer = 0
DefaultViewerObjPos = (0.0, 0.0, 0.0)
ViewerAutoRepeatTime = 30
ViewerAutoRepeatSpeed = 0

script add_view_models_to_menu 
	if GotParam \{array}
		if GlobalExists name = <array> type = array
			GetArraySize <array>
			if (<array_size> > 0)
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
	SE_SetProps \{just = [
			left
			center
		]
		rgba = [
			10
			128
			10
			115
		]}
	LegacyDoMorph pos = <xy> alpha = 1 scale = 0.6
endscript

script viewerobj_add_components 
	printf \{'viewerobj_add_components'}
	Obj_SetOrientation \{dir = (0.0, 0.0, 1.0)}
	if GotParam \{SkeletonName}
		if NOT (<SkeletonName> = car)
			CreateComponentFromStructure {
				Component = AnimTree
				<...>
				DefaultCommandTarget = ModelViewerNode
			}
		endif
	endif
	if GotParam \{SkeletonName}
		CreateComponentFromStructure {
			Component = skeleton
			<...>
			skeleton = <SkeletonName>
			max_bone_skip_lod = 0
		}
	endif
	CreateComponentFromStructure Component = Model <...> UseModelLights
endscript

script viewerobj_init_model \{buildScript = create_model_from_appearance}
	printf \{'viewerobj_init_model'}
	if GotParam \{profile}
		ScriptAssert \{qs("\Lthis should be done in code")}
	else
		if GotParam \{modelName}
			Obj_InitModel <...>
		else
			if GotParam \{Model}
				Obj_InitModel <...>
			else
				script_assert \{qs("\Lno model name!")}
			endif
		endif
	endif
	Obj_GetID
	RunScriptOnObject id = <ObjID> set_viewerobj_anim_handlers
	Obj_Rotate \{relative = 0}
endscript

script launch_view_models_menu 
	RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_view_models_menu callback_params = <...>
endscript

script make_select_view_model_category 
	add_menu_item {
		scale = 0.6
		rot = 0
		text = <text>
		pad_choose_script = launch_view_models_menu
		pad_choose_params = {array = <array>}
	}
endscript

script make_select_view_model_line \{buildScript = create_model_from_appearance}
	add_menu_item {
		scale = 0.6
		rot = 0
		text = <text>
		pad_choose_script = view_model
		pad_choose_params = {<...>}
	}
endscript

script simple_focus 
	Obj_GetID
	<id> = <ObjID>
	SetScreenElementProps id = <id> rgba = [128 128 128 128]
endscript

script simple_unfocus 
	Obj_GetID
	<id> = <ObjID>
	SetScreenElementProps id = <id> rgba = [70 70 70 128]
endscript

script create_view_models_menu 
	generic_ui_destroy
	shut_down_flow_manager
	if ScreenElementExists \{id = view_models_menu}
		DestroyScreenElement \{id = view_models_menu}
	endif
	PlayIGCCam \{id = modelview_view_cam_id
		name = modelview_view_cam
		viewport = bg_viewport
		LockTo = world
		pos = (-1.068807, 1.299001, 3.7975957)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	make_menu \{menu_id = view_models_menu
		vmenu_id = view_models_vmenu
		title = qs("\LMODELS")
		scrolling}
	SetAnalogStickActiveForMenus \{0}
	SetScreenElementProps {
		id = view_models_vmenu
		event_handlers = [
			{pad_back exit_view_models_menu params = {array = <array>}}
		]
	}
	add_view_models_to_menu <...>
	RunScriptOnScreenElement \{id = current_menu_anchor
		animate_in}
endscript

script view_models_menu_cleanup 
	SetAnalogStickActiveForMenus \{1}
	if ScreenElementExists \{id = view_models_menu}
		DestroyScreenElement \{id = view_models_menu}
	endif
	KillCamAnim \{name = modelview_view_cam}
	SetScreenElementProps \{id = root_window
		tags = {
			menu_state = off
		}}
	start_flow_manager \{flow_state = debug_menu_fs}
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
	profile = no_profile
	buildScript = create_model_from_appearance
}
last_profile_valid = false

script SetReferenceChecksum 
	printf \{qs("\L'SetReferenceChecksum' is deprecated")}
endscript

script view_model 
	printf \{qs("\LView Model here")}
	if ((isXenon) && (GotExtraMemory))
		MemPushContext \{DebugHeap}
	else
		MemPushContext \{BottomUpHeap}
	endif
	lock = off
	if AreAssetsLocked
		AllowAssetLoading \{on}
		lock = on
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
	if NOT CompositeObjectExists \{Guitarist}
		create_guitarist
	endif
	if (IsTrue $UsePlayerPosForViewerObjPos)
		Guitarist :Obj_GetPosition
		<ViewerObjPos> = <pos>
		Guitarist :hide
	else
		<ViewerObjPos> = <DefaultViewerObjPos>
	endif
	if GotParam \{use_last_model_viewed}
		if ($last_profile_valid = false)
			GetCASAppearance \{player = 0}
			profile = <appearance>
			buildScript = create_model_from_appearance
		else
			profile = ($last_profile_viewed.profile)
			buildScript = ($last_profile_viewed.buildScript)
		endif
	endif
	if GotParam \{body_shape}
		SetViewerModel <...> profile = {<profile> body_shape = <body_shape>} scale = (<body_shape>.scale)
	else
		SetViewerModel <...>
	endif
	if GotParam \{profile}
		change \{last_profile_valid = true}
		change last_profile_viewed = {profile = <profile> buildScript = <buildScript>}
	endif
	if GotParam \{defaultAnim}
		SetViewerAnim <defaultAnim>
	endif
	if (<lock> = on)
		AllowAssetLoading \{off}
	endif
	if IsTrue \{$ApplyViewerObjModelToPlayer}
		set_player_to_model \{no_exit}
	endif
endscript

script set_player_to_model 
	printf \{qs("\LSetting player to model")}
	if ($last_profile_valid = true)
		SetCASAppearance appearance = ($last_profile_viewed.profile)
		EditCASAppearance \{target = SetPart
			targetParams = {
				part = cas_board
				desc_id = `default`
			}}
		UpdateCurrentCASModel buildScript = ($last_profile_viewed.buildScript)
	else
		printf \{qs("\LCan't apply explicit models, only profiles")}
	endif
	if NOT GotParam \{no_exit}
		toggle_model_viewer
	endif
endscript

script toggle_model_viewer \{skeleton = GH3_Guitarist_Axel}
	if NOT ScreenElementExists \{id = view_models_menu}
		view_model {
			use_last_model_viewed
			SkeletonName = <skeleton>
			defaultAnim = Ped_M_Idle1
		}
		create_view_models_menu
	else
		change \{view_mode = 0}
		ToggleViewMode
		ToggleViewMode
		ToggleViewMode
		Guitarist :unhide
		view_models_menu_cleanup
	endif
endscript
