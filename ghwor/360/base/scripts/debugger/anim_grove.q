animgrove_node_declaration = [
	PreviewTreeAnimNode
	db_av_lite
	db_av_big
	db_gped
	BodyTimer
	tweakbones
]
AnimPreviewBaseTree = {
	Type = DegenerateBlend
	id = PreviewTreeAnimNode
}
ganimtreepreviewobjects = [
]

script animgrove_control_script 
	printf \{qs(0x4f175157)}
	begin
	animinfo_getallactivevaluesources
	if ScriptExists \{animgrove_user_generated_control_script}
		animgrove_user_generated_control_script <...>
	endif
	AnimPreview_SetSourceValues <...>
	Wait \{1
		gameframe}
	repeat
	printf \{qs(0x2d5a982c)}
endscript

script AnimTreePreview_UpdateBlendValues 
	GetArraySize ($ganimtreepreviewobjects)
	if (<array_Size> > 0)
		index = 0
		begin
		(($ganimtreepreviewobjects [<index>]).Name) :AnimPreview_SetSourceValues <...>
		index = (<index> + 1)
		repeat <array_Size>
	endif
endscript

script TestAnimScript 
	Anim_Command target = PreviewTreeAnimNode Command = DegenerateBlend_AddBranch params = {Tree = <Tree> params = <Tree_Params>}
	Obj_ForceUpdate
	animgrove_control_script
endscript

script AnimTreePreview_NxCommon \{modelbuilderheap = heap_debug}
	LoadPak \{'pak/animgrove_preview.pak'
		Heap = heap_debug}
	GetArraySize <trees>
	if (<array_Size> > 0)
		index = 0
		begin
		tree_info = (<trees> [<index>])
		SetSearchAllAssetContexts
		Name = (<tree_info>.Name)
		target_object = (<tree_info>.target_object)
		camera_reference_object = None
		is_3d_crowd = FALSE
		is_camera = FALSE
		switch <target_object>
			case musician1_camera
			camera_reference_object = musician1
			case musician2_camera
			camera_reference_object = musician2
			case musician3_camera
			camera_reference_object = musician3
			case musician4_camera
			camera_reference_object = musician4
			case crowd3d_model1_anim1
			case crowd3d_model1_anim2
			case crowd3d_model1_anim3
			case crowd3d_model1_anim4
			case crowd3d_model2_anim1
			case crowd3d_model2_anim2
			case crowd3d_model2_anim3
			case crowd3d_model2_anim4
			case crowd3d_model3_anim1
			case crowd3d_model3_anim2
			case crowd3d_model3_anim3
			case crowd3d_model3_anim4
			case crowd3d_model4_anim1
			case crowd3d_model4_anim2
			case crowd3d_model4_anim3
			case crowd3d_model4_anim4
			Name = <target_object>
			<is_3d_crowd> = true
		endswitch
		if (<is_3d_crowd> = FALSE)
			if (<camera_reference_object> != None)
				is_camera = true
				Pos = (0.0, 0.0, 0.0)
				Dir = (0.0, 1.0, 0.0)
				if CompositeObjectExists Name = <camera_reference_object>
					<camera_reference_object> :Obj_GetPosition
					<camera_reference_object> :Obj_GetQuat
				endif
				createcameratarget id = <Name> active_value_sources = (<tree_info>.active_value_sources) modelbuilderheap = <modelbuilderheap> Pos = <Pos> Quat = <Quat>
				createanimgrovepreviewcamera lock_to = <Name>
			else
				CreateFakePlayer PositionFrom = <target_object> cloneFrom = <target_object> active_value_sources = (<tree_info>.active_value_sources) id = <Name> modelbuilderheap = <modelbuilderheap>
			endif
		endif
		if NOT CompositeObjectExists <Name>
			printf qs(0x5e6d9208) v = <Name>
			return
		endif
		<Name> :Anim_InitTree Tree = $AnimPreviewBaseTree NodeIdDeclaration = $animgrove_node_declaration
		<Name> :AnimPreview_SetSourceValues (<tree_info>.blend_values)
		if <Name> :Anim_LoadAnims Tree = (<tree_info>.Tree) params = (<tree_info>.Tree_Params)
			<Name> :Obj_SwitchScript TestAnimScript params = {Tree = (<tree_info>.Tree) Tree_Params = (<tree_info>.Tree_Params)}
			if (<is_camera> = FALSE)
				<target_object> :Hide
				<target_object> :Pause
			endif
			<Name> :Unpause
		else
			<Name> :Die
			return
		endif
		array = []
		addstructurearrayelement array = $ganimtreepreviewobjects element = <tree_info>
		Change ganimtreepreviewobjects = <array>
		index = (<index> + 1)
		repeat <array_Size>
	endif
endscript

script is_crowd3d_anim_instance 
	switch <Name>
		case crowd3d_model1_anim1
		case crowd3d_model1_anim2
		case crowd3d_model1_anim3
		case crowd3d_model1_anim4
		case crowd3d_model2_anim1
		case crowd3d_model2_anim2
		case crowd3d_model2_anim3
		case crowd3d_model2_anim4
		case crowd3d_model3_anim1
		case crowd3d_model3_anim2
		case crowd3d_model3_anim3
		case crowd3d_model3_anim4
		case crowd3d_model4_anim1
		case crowd3d_model4_anim2
		case crowd3d_model4_anim3
		case crowd3d_model4_anim4
		return \{true}
	endswitch
	return \{FALSE}
endscript

script animtreepreviewrestore_nxcommon 
	GetArraySize ($ganimtreepreviewobjects)
	if (<array_Size> > 0)
		index = 0
		begin
		<target> = (($ganimtreepreviewobjects [<index>]).target_object)
		if NOT is_crowd3d_anim_instance Name = <target>
			<Name> = (($ganimtreepreviewobjects [<index>]).Name)
			<Name> :Die
			target_object = (($ganimtreepreviewobjects [<index>]).target_object)
			switch <target_object>
				case musician1_camera
				case musician2_camera
				case musician3_camera
				case musician4_camera
				nullscript
				default
				<target_object> :unhide
			endswitch
		endif
		index = (<index> + 1)
		repeat <array_Size>
	endif
	array = []
	Change ganimtreepreviewobjects = <array>
	PushAssetContext \{context = animgrove_preview}
	SetSearchAllAssetContexts \{OFF}
	UnLoadPak \{'pak/animgrove_preview.pak'}
	SetSearchAllAssetContexts \{On}
	PopAssetContext
endscript

script animtreepreview_reregisteranimevents 
	printf \{qs(0xa2fc79d0)}
	initanimeventmap
	i = 0
	GetArraySize \{track_names}
	begin
	track_name = (<track_globals> [<i>])
	track_global = (<track_globals> [<i>])
	registeranimevents track = <track_name> anim_events = $<track_global>
	i = (<i> + 1)
	repeat <array_Size>
endscript

script CreateFakePlayer 
	if NOT CompositeObjectExists <cloneFrom>
		return
	endif
	if NOT CompositeObjectExists <PositionFrom>
		return
	endif
	if CompositeObjectExists <id>
		<id> :Die
		flushdeadobjects
	endif
	<cloneFrom> :Skeleton_GetSkeletonName
	<cloneFrom> :skeleton_getuniqueassetcontext
	if <cloneFrom> :ContainsComponent Name = ragdoll
		<cloneFrom> :Ragdoll_GetRagdollName
	endif
	<PositionFrom> :Obj_GetPosition
	<PositionFrom> :Obj_GetQuat
	components = []
	BasicComponents = [
		{
			component = modelbuilder
			allocator = simple
			Heap = <modelbuilderheap>
		}
		{
			component = Input
			controller = 1
			dontusedpadasleftanalog
		}
		{
			component = AnimPreview
			active_value_source_list = <active_value_sources>
			geom_heap = <modelbuilderheap>
		}
		{
			component = AnimInfo
			active_value_set = preview
		}
		{
			component = AnimTree
			ReferenceChecksum = <skeletonname>
		}
		{
			component = Skeleton
			skeletonassetcontext = <unique_asset_context>
			allow_reset
		}
		{
			component = SetDisplayMatrix
		}
	]
	ModelComponent = [
		{
			component = Model
			cloneFrom = <cloneFrom>
			LightGroup = [Band drummer GUITARIST vocalist BASSIST Alt_Band Crowd]
		}
	]
	components = (<components> + <BasicComponents> + <ModelComponent>)
	if GotParam \{ragdollName}
		RagdollComponents = [
			{
				component = ragdoll
				ragdollName = <ragdollName>
				initialize_empty = FALSE
			}
		]
		components = (<components> + <RagdollComponents>)
	endif
	CreateCompositeObject {
		components = <components>
		params = {
			Name = <id>
			Pos = <Pos>
			orientation = <Quat>
			skeletonname = <skeletonname>
			AssetContext = AnimPreviewObject
		}
	}
endscript

script createcameratarget 
	if NOT GotParam \{id}
		ScriptAssert \{'id not given'}
		return
	endif
	if CompositeObjectExists <id>
		<id> :Die
		flushdeadobjects
	endif
	components = [
		{
			component = AnimPreview
			active_value_source_list = <active_value_sources>
			geom_heap = <modelbuilderheap>
		}
		{
			component = AnimInfo
			active_value_set = preview
		}
		{
			component = AnimTree
		}
		{
			component = Skeleton
			allow_reset
		}
	]
	CreateCompositeObject {
		components = <components>
		params = {
			Name = <id>
			Pos = <Pos>
			orientation = <Quat>
			skeletonname = gh4_camera
			AssetContext = AnimPreviewObject
		}
	}
endscript

script createanimgrovepreviewcamera 
	if NOT GotParam \{lock_to}
		ScriptAssert \{'lock_to target required'}
	endif
	if CompositeObjectExists \{Name = animgrovepreviewcamera}
		animgrovepreviewcamera :Die
	endif
	<camera_object_params> = {
		params = {
			Name = animgrovepreviewcamera
		}
		components = [
			{
				component = CinematicCamera
				updatewhengamepaused = true
				Enabled = true
			}
			{
				component = Camera
				far_clip = $camera_default_far_clip
			}
		]
	}
	if IsCompositeObjectManagerEnabled
		CreateCompositeObject <camera_object_params>
	else
		CreateCompositeObjectInstance <camera_object_params> Priority = COIM_Priority_Permanent Heap = Generic OldHeap = COM
	endif
	animgrovepreviewcamera :CCam_DoMorph {
		LockTo = <lock_to>
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	SetActiveCamera \{id = animgrovepreviewcamera
		viewport = bg_viewport}
	animgrovepreviewcamera :Unpause
endscript
