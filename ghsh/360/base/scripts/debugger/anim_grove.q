AnimPreviewBaseTree = {
	Type = DegenerateBlend
	id = PreviewTreeAnimNode
}

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
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewObject :AnimPreview_SetSourceValues <...>
	endif
endscript

script TestAnimScript 
	Anim_Command target = PreviewTreeAnimNode Command = DegenerateBlend_AddBranch params = {Tree = <Tree> params = <Tree_Params>}
	Obj_ForceUpdate
	animgrove_control_script
endscript

script AnimTreePreview_NxCommon \{targetObject = skater
		modelbuilderheap = debugheap}
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewRestore
	endif
	dump <Tree>
	LoadPak \{'pak/animgrove_preview.pak'
		Heap = heap_debug}
	if NOT GotParam \{Skeleton}
		<targetObject> :Skeleton_GetSkeletonName
		Skeleton = <skeletonname>
	endif
	if NOT GotParam \{ragdoll}
		if <targetObject> :ContainsComponent Name = ragdoll
			if <targetObject> :Ragdoll_GetRagdollName
				ragdoll = <ragdollName>
			endif
		endif
	endif
	SetSearchAllAssetContexts
	CreateFakePlayer PositionFrom = <targetObject> cloneFrom = <targetObject> Model = <Model> ragdoll = <ragdoll> Skeleton = <Skeleton> active_value_sources = <active_value_sources> modelbuilderheap = <modelbuilderheap>
	AnimTreePreviewObject :Anim_InitTree \{Tree = $AnimPreviewBaseTree
		NodeIdDeclaration = [
			PreviewTreeAnimNode
		]}
	if GotParam \{blend_values}
		AnimTreePreviewObject :AnimPreview_SetSourceValues <blend_values>
	endif
	if AnimTreePreviewObject :Anim_LoadAnims Tree = <Tree> params = <Tree_Params>
		AnimTreePreviewObject :Obj_SwitchScript TestAnimScript params = {Tree = <Tree> Tree_Params = <Tree_Params>}
		<targetObject> :Hide
		<targetObject> :Pause
	else
		AnimTreePreviewObject :Die
	endif
	dump <Tree>
endscript

script animtreepreviewrestore_nxcommon 
	UnLoadPak \{'pak/animgrove_preview.pak'}
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
	if CompositeObjectExists \{AnimTreePreviewObject}
		AnimTreePreviewObject :Die
		flushdeadobjects
	endif
	<PositionFrom> :Obj_GetPosition
	<PositionFrom> :Obj_GetQuat
	formatText checksumName = appearance '%s' s = <Model>
	if GlobalExists Name = <appearance> Type = structure
		RemoveParameter \{Model}
	else
		RemoveParameter \{appearance}
	endif
	components = []
	if GotParam \{ragdoll}
		RagdollComponents = [
			{
				component = ragdoll
				ragdollName = <ragdoll>
				initialize_empty = FALSE
			}
		]
		components = (<components> + <RagdollComponents>)
	endif
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
			preload_model = <Model>
			geom_heap = <modelbuilderheap>
		}
		{
			component = AnimInfo
			active_value_set = preview
		}
		{
			component = AnimTree
			ReferenceChecksum = <Skeleton>
		}
		{
			component = Skeleton
			allow_reset
		}
		{
			component = SetDisplayMatrix
		}
	]
	components = (<components> + <BasicComponents>)
	if GotParam \{Model}
		ModelComponent = [
			{
				component = Model
				Model = <Model>
			}
		]
	elseif GotParam \{appearance}
		ModelComponent = [
			{
				component = Model
			}
		]
	else
		ModelComponent = [
			{
				component = Model
				cloneFrom = <cloneFrom>
			}
		]
	endif
	components = (<components> + <ModelComponent>)
	CreateCompositeObject {
		components = <components>
		params = {
			skeletonname = <Skeleton>
			Name = AnimTreePreviewObject
			Pos = <Pos>
			orientation = <Quat>
			AssetContext = AnimPreviewObject
			LightGroup = [Band]
			$<appearance>
		}
	}
	if GotParam \{appearance}
		if NOT StructureContains structure = $<appearance> Model
			build_params = {appearance = $<appearance> buildscriptparams = {$<appearance> async = 0}}
			AnimTreePreviewObject :modelbuilder_preload <build_params>
			AnimTreePreviewObject :modelbuilder_loadassets <build_params>
			AnimTreePreviewObject :modelbuilder_build <build_params>
		endif
	endif
endscript
