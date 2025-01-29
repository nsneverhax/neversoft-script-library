AnimPreviewBaseTree = {
	type = DegenerateBlend
	id = PreviewTreeAnimNode
}
gAnimTreePreviewObjects = [
]

script AnimGrove_Control_Script 
	printf \{qs(0x4f175157)}
	begin
	AnimInfo_GetAllActiveValueSources
	if ScriptExists \{AnimGrove_user_generated_control_script}
		AnimGrove_user_generated_control_script <...>
	endif
	AnimPreview_SetSourceValues <...>
	wait \{1
		gameframe}
	repeat
	printf \{qs(0x2d5a982c)}
endscript

script AnimTreePreview_UpdateBlendValues 
	GetArraySize ($gAnimTreePreviewObjects)
	if (<array_size> > 0)
		index = 0
		begin
		(($gAnimTreePreviewObjects [<index>]).name) :AnimPreview_SetSourceValues <...>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script TestAnimScript 
	Anim_Command target = PreviewTreeAnimNode Command = DegenerateBlend_AddBranch params = {Tree = <Tree> params = <Tree_Params>}
	Obj_ForceUpdate
	AnimGrove_Control_Script
endscript

script AnimTreePreview_NxCommon \{modelBuilderHeap = debugheap}
	LoadPak \{'pak/animgrove_preview.pak'
		heap = heap_debug}
	GetArraySize <trees>
	if (<array_size> > 0)
		index = 0
		begin
		tree_info = (<trees> [<index>])
		SetSearchAllAssetContexts
		CreateFakePlayer PositionFrom = (<tree_info>.target_object) cloneFrom = (<tree_info>.target_object) active_value_sources = (<tree_info>.active_value_sources) id = (<tree_info>.name) modelBuilderHeap = <modelBuilderHeap>
		if NOT CompositeObjectExists (<tree_info>.name)
			printf qs(0x5e6d9208) v = (<tree_info>.name)
			return
		endif
		(<tree_info>.name) :Anim_InitTree Tree = $AnimPreviewBaseTree NodeIdDeclaration = [PreviewTreeAnimNode]
		(<tree_info>.name) :AnimPreview_SetSourceValues (<tree_info>.blend_values)
		if (<tree_info>.name) :Anim_LoadAnims Tree = (<tree_info>.Tree) params = (<tree_info>.Tree_Params)
			(<tree_info>.name) :Obj_SwitchScript TestAnimScript params = {Tree = (<tree_info>.Tree) Tree_Params = (<tree_info>.Tree_Params)}
			(<tree_info>.target_object) :hide
			(<tree_info>.target_object) :Pause
			(<tree_info>.name) :UnPause
		else
			(<tree_info>.name) :Die
			return
		endif
		array = []
		AddStructureArrayElement array = $gAnimTreePreviewObjects element = <tree_info>
		Change gAnimTreePreviewObjects = <array>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script AnimTreePreviewRestore_NxCommon 
	GetArraySize ($gAnimTreePreviewObjects)
	if (<array_size> > 0)
		index = 0
		begin
		(($gAnimTreePreviewObjects [<index>]).name) :Die
		(($gAnimTreePreviewObjects [<index>]).target_object) :unhide
		index = (<index> + 1)
		repeat <array_size>
	endif
	array = []
	Change gAnimTreePreviewObjects = <array>
	PushAssetContext \{context = animgrove_preview}
	SetSearchAllAssetContexts \{off}
	UnLoadPak \{'pak/animgrove_preview.pak'}
	SetSearchAllAssetContexts \{on}
	PopAssetContext
endscript

script AnimTreePreview_ReregisterAnimEvents 
	printf \{qs(0xa2fc79d0)}
	InitAnimEventMap
	i = 0
	GetArraySize \{track_names}
	begin
	track_name = (<track_globals> [<i>])
	track_global = (<track_globals> [<i>])
	RegisterAnimEvents track = <track_name> anim_events = $<track_global>
	i = (<i> + 1)
	repeat <array_size>
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
		FlushDeadObjects
	endif
	<cloneFrom> :Skeleton_GetSkeletonName
	<cloneFrom> :Skeleton_GetUniqueAssetContext
	if <cloneFrom> :ContainsComponent name = Ragdoll
		<cloneFrom> :Ragdoll_GetRagdollName
	endif
	<PositionFrom> :Obj_GetPosition
	<PositionFrom> :Obj_GetQuat
	components = []
	BasicComponents = [
		{
			component = ModelBuilder
			Allocator = Simple
			heap = <modelBuilderHeap>
		}
		{
			component = Input
			controller = 1
			dontUseDPadAsLeftAnalog
		}
		{
			component = AnimPreview
			active_value_source_list = <active_value_sources>
			geom_heap = <modelBuilderHeap>
		}
		{
			component = AnimInfo
			active_value_set = preview
		}
		{
			component = AnimTree
			ReferenceChecksum = <skeletonName>
		}
		{
			component = Skeleton
			SkeletonAssetContext = <unique_asset_context>
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
			LightGroup = [Band Drummer Guitarist Vocalist Bassist Alt_Band]
		}
	]
	components = (<components> + <BasicComponents> + <ModelComponent>)
	if GotParam \{RagdollName}
		RagdollComponents = [
			{
				component = Ragdoll
				RagdollName = <RagdollName>
				initialize_empty = false
			}
		]
		components = (<components> + <RagdollComponents>)
	endif
	CreateCompositeObject {
		components = <components>
		params = {
			name = <id>
			Pos = <Pos>
			Orientation = <Quat>
			skeletonName = <skeletonName>
			AssetContext = AnimPreviewObject
		}
	}
endscript
