AnimPreviewBaseTree = {
	Type = DegenerateBlend
	id = PreviewTreeAnimNode
}

script AnimTreePreview_UpdateBlendValues 
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewObject :AnimPreview_SetSourceValues <...>
	endif
endscript

script TestAnimScript 
	Anim_Command target = PreviewTreeAnimNode Command = DegenerateBlend_AddBranch params = {Tree = <Tree> params = <Tree_Params>}
	Obj_ForceUpdate
endscript

script AnimTreePreview_NxCommon \{targetObject = skater}
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewRestore
	endif
	dump <Tree>
	if NOT GotParam \{Skeleton}
		<targetObject> :Skeleton_GetSkeletonName
		Skeleton = <skeletonname>
	endif
	if NOT GotParam \{ragdoll}
		if <targetObject> :ContainsComponent ragdoll
			if <targetObject> :Ragdoll_GetRagdollName
				ragdoll = <ragdollName>
			endif
		endif
	endif
	SetSearchAllAssetContexts
	CreateFakePlayer PositionFrom = <targetObject> cloneFrom = <targetObject> Model = <Model> ragdoll = <ragdoll> Skeleton = <Skeleton> appearance = <appearance> active_value_sources = <active_value_sources>
	AnimTreePreviewObject :Anim_InitTree \{Tree = $AnimPreviewBaseTree
		NodeIdDeclaration = [
			PreviewTreeAnimNode
		]}
	if AnimTreePreviewObject :Anim_LoadAnims Tree = <Tree> params = <Tree_Params>
		AnimTreePreviewObject :Obj_SwitchScript TestAnimScript params = {Tree = <Tree> Tree_Params = <Tree_Params>}
		<targetObject> :Hide
		<targetObject> :Pause
	else
		AnimTreePreviewObject :Die
	endif
	dump <Tree>
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
	endif
	<PositionFrom> :Obj_GetPosition
	<PositionFrom> :Obj_GetQuat
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
			component = AnimPreview
			active_value_source_list = <active_value_sources>
			preload_model = <Model>
		}
		{
			component = AnimInfo
			active_value_set = preview
		}
		{
			component = AnimTree
			ReferenceChecksum = <Skeleton>
			animEventTableName = SkaterAnimEventTable
		}
		{
			component = Skeleton
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
			<appearance>
		}
	}
endscript
