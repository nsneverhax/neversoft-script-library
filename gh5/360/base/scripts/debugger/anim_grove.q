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

script AnimTreePreview_NxCommon \{modelbuilderheap = debugheap}
	LoadPak \{'pak/animgrove_preview.pak'
		Heap = heap_debug}
	GetArraySize <trees>
	if (<array_Size> > 0)
		index = 0
		begin
		tree_info = (<trees> [<index>])
		SetSearchAllAssetContexts
		CreateFakePlayer PositionFrom = (<tree_info>.target_object) cloneFrom = (<tree_info>.target_object) active_value_sources = (<tree_info>.active_value_sources) id = (<tree_info>.Name) modelbuilderheap = <modelbuilderheap>
		if NOT CompositeObjectExists (<tree_info>.Name)
			printf qs(0x5e6d9208) v = (<tree_info>.Name)
			return
		endif
		(<tree_info>.Name) :Anim_InitTree Tree = $AnimPreviewBaseTree NodeIdDeclaration = [PreviewTreeAnimNode]
		(<tree_info>.Name) :AnimPreview_SetSourceValues (<tree_info>.blend_values)
		if (<tree_info>.Name) :Anim_LoadAnims Tree = (<tree_info>.Tree) params = (<tree_info>.Tree_Params)
			(<tree_info>.Name) :Obj_SwitchScript TestAnimScript params = {Tree = (<tree_info>.Tree) Tree_Params = (<tree_info>.Tree_Params)}
			(<tree_info>.target_object) :Hide
			(<tree_info>.target_object) :Pause
			(<tree_info>.Name) :Unpause
		else
			(<tree_info>.Name) :Die
			return
		endif
		array = []
		addstructurearrayelement array = $ganimtreepreviewobjects element = <tree_info>
		Change ganimtreepreviewobjects = <array>
		index = (<index> + 1)
		repeat <array_Size>
	endif
endscript

script animtreepreviewrestore_nxcommon 
	GetArraySize ($ganimtreepreviewobjects)
	if (<array_Size> > 0)
		index = 0
		begin
		(($ganimtreepreviewobjects [<index>]).Name) :Die
		(($ganimtreepreviewobjects [<index>]).target_object) :unhide
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
			LightGroup = [Band drummer GUITARIST vocalist BASSIST Alt_Band]
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
