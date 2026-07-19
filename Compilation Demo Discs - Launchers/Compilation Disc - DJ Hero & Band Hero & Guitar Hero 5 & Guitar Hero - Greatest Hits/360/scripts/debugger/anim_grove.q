AnimPreviewBaseTree = {
	type = DegenerateBlend
	id = PreviewTreeAnimNode
}

script AnimGrove_Control_Script 
	printf \{qs("\LLaunching AnimGrove Control Script.")}
	begin
	AnimInfo_GetAllActiveValueSources
	if ScriptExists \{AnimGrove_user_generated_control_script}
		AnimGrove_user_generated_control_script <...>
	endif
	AnimPreview_SetSourceValues <...>
	Wait \{1
		gameframe}
	repeat
	printf \{qs("\LExiting AnimGrove Control Script.")}
endscript

script AnimTreePreview_UpdateBlendValues 
	if CompositeObjectExists \{name = AnimTreePreviewObject}
		AnimTreePreviewObject :AnimPreview_SetSourceValues <...>
	endif
endscript

script TestAnimScript 
	Anim_Command target = PreviewTreeAnimNode command = DegenerateBlend_AddBranch params = {Tree = <Tree> params = <Tree_Params>}
	Obj_ForceUpdate
	AnimGrove_Control_Script
endscript

script AnimTreePreview_NxCommon \{targetObject = skater
		modelBuilderHeap = DebugHeap}
	if CompositeObjectExists \{name = AnimTreePreviewObject}
		AnimTreePreviewRestore
	endif
	dump <Tree>
	LoadPak \{'pak/animgrove_preview.pak'
		heap = heap_debug}
	if NOT GotParam \{skeleton}
		<targetObject> :Skeleton_GetSkeletonName
		skeleton = <SkeletonName>
	endif
	if NOT GotParam \{ragdoll}
		if <targetObject> :ContainsComponent name = ragdoll
			if <targetObject> :ragdoll_getragdollname
				ragdoll = <ragdollName>
			endif
		endif
	endif
	SetSearchAllAssetContexts
	CreateFakePlayer PositionFrom = <targetObject> CloneFrom = <targetObject> Model = <Model> ragdoll = <ragdoll> skeleton = <skeleton> active_value_sources = <active_value_sources> modelBuilderHeap = <modelBuilderHeap>
	AnimTreePreviewObject :Anim_InitTree \{Tree = $AnimPreviewBaseTree
		NodeIdDeclaration = [
			PreviewTreeAnimNode
		]}
	if GotParam \{blend_values}
		AnimTreePreviewObject :AnimPreview_SetSourceValues <blend_values>
	endif
	if AnimTreePreviewObject :anim_loadanims Tree = <Tree> params = <Tree_Params>
		AnimTreePreviewObject :Obj_SwitchScript TestAnimScript params = {Tree = <Tree> Tree_Params = <Tree_Params>}
		<targetObject> :hide
		<targetObject> :Pause
	else
		AnimTreePreviewObject :Die
	endif
	dump <Tree>
endscript

script AnimTreePreviewRestore_NxCommon 
	UnloadPak \{'pak/animgrove_preview.pak'}
endscript

script AnimTreePreview_ReregisterAnimEvents 
	printf \{qs("\LUpdating anim events.")}
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
	if NOT CompositeObjectExists <CloneFrom>
		return
	endif
	if NOT CompositeObjectExists <PositionFrom>
		return
	endif
	if CompositeObjectExists \{AnimTreePreviewObject}
		AnimTreePreviewObject :Die
		FlushDeadObjects
	endif
	<PositionFrom> :Obj_GetPosition
	<PositionFrom> :Obj_GetQuat
	FormatText checksumname = appearance '%s' s = <Model>
	if GlobalExists name = <appearance> type = Structure
		RemoveParameter \{Model}
	else
		RemoveParameter \{appearance}
	endif
	Components = []
	if GotParam \{ragdoll}
		RagdollComponents = [
			{
				Component = ragdoll
				ragdollName = <ragdoll>
				initialize_empty = false
			}
		]
		Components = (<Components> + <RagdollComponents>)
	endif
	BasicComponents = [
		{
			Component = ModelBuilder
			Allocator = simple
			heap = <modelBuilderHeap>
		}
		{
			Component = Input
			controller = 1
			dontusedpadasleftanalog
		}
		{
			Component = AnimPreview
			active_value_source_list = <active_value_sources>
			preload_model = <Model>
			geom_heap = <modelBuilderHeap>
		}
		{
			Component = AnimInfo
			active_value_set = preview
		}
		{
			Component = AnimTree
			ReferenceChecksum = <skeleton>
		}
		{
			Component = skeleton
			allow_reset
		}
		{
			Component = SetDisplayMatrix
		}
	]
	Components = (<Components> + <BasicComponents>)
	if GotParam \{Model}
		ModelComponent = [
			{
				Component = Model
				Model = <Model>
			}
		]
	elseif GotParam \{appearance}
		ModelComponent = [
			{
				Component = Model
			}
		]
	else
		ModelComponent = [
			{
				Component = Model
				CloneFrom = <CloneFrom>
			}
		]
	endif
	Components = (<Components> + <ModelComponent>)
	CreateCompositeObject {
		Components = <Components>
		params = {
			SkeletonName = <skeleton>
			name = AnimTreePreviewObject
			pos = <pos>
			Orientation = <Quat>
			assetcontext = AnimPreviewObject
			lightgroup = [Band]
			$<appearance>
		}
	}
	if GotParam \{appearance}
		if NOT StructureContains Structure = $<appearance> Model
			build_params = {appearance = $<appearance> buildscriptparams = {$<appearance> async = 0}}
			AnimTreePreviewObject :ModelBuilder_Preload <build_params>
			AnimTreePreviewObject :ModelBuilder_LoadAssets <build_params>
			AnimTreePreviewObject :ModelBuilder_Build <build_params>
		endif
	endif
endscript
