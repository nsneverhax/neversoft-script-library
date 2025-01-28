AnimPreviewBaseTree = {
	Type = DegenerateBlend
	Id = PreviewTreeAnimNode
}

script AnimTreePreview_UpdateBlendValues 
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewObject :AnimPreview_SetSourceValues <...>
	endif
endscript

script TestAnimScript 
	Anim_Command Target = PreviewTreeAnimNode Command = DegenerateBlend_AddBranch Params = {Tree = <Tree> Params = <Tree_Params>}
	Obj_ForceUpdate
endscript

script AnimTreePreview_NxCommon \{targetObject = Skater}
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewRestore
	endif
	dump <Tree>
	if NOT GotParam \{Skeleton}
		<targetObject> :Skeleton_GetSkeletonName
		Skeleton = <SkeletonName>
	endif
	if NOT GotParam \{Ragdoll}
		if <targetObject> :ContainsComponent Ragdoll
			if <targetObject> :Ragdoll_GetRagdollName
				Ragdoll = <RagdollName>
			endif
		endif
	endif
	SetSearchAllAssetContexts
	CreateFakePlayer PositionFrom = <targetObject> CloneFrom = <targetObject> Model = <Model> Ragdoll = <Ragdoll> Skeleton = <Skeleton> appearance = <appearance> active_value_sources = <active_value_sources>
	AnimTreePreviewObject :Anim_InitTree \{Tree = $AnimPreviewBaseTree
		NodeIdDeclaration = [
			PreviewTreeAnimNode
		]}
	if AnimTreePreviewObject :Anim_LoadAnims Tree = <Tree> Params = <Tree_Params>
		AnimTreePreviewObject :Obj_SwitchScript TestAnimScript Params = {Tree = <Tree> Tree_Params = <Tree_Params>}
		<targetObject> :Hide
		<targetObject> :Pause
	else
		AnimTreePreviewObject :DIE
	endif
	dump <Tree>
endscript

script CreateFakePlayer 
	if NOT CompositeObjectExists <CloneFrom>
		return
	endif
	if NOT CompositeObjectExists <PositionFrom>
		return
	endif
	if CompositeObjectExists \{AnimTreePreviewObject}
		AnimTreePreviewObject :DIE
	endif
	<PositionFrom> :Obj_GetPosition
	<PositionFrom> :Obj_GetQuat
	Components = []
	if GotParam \{Ragdoll}
		RagdollComponents = [
			{
				Component = Ragdoll
				RagdollName = <Ragdoll>
				initialize_empty = FALSE
			}
		]
		Components = (<Components> + <RagdollComponents>)
	endif
	BasicComponents = [
		{
			Component = AnimPreview
			active_value_source_list = <active_value_sources>
			preload_model = <Model>
		}
		{
			Component = AnimInfo
			active_value_set = preview
		}
		{
			Component = AnimTree
			ReferenceChecksum = <Skeleton>
			AnimEventTableName = SkaterAnimEventTable
		}
		{
			Component = Skeleton
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
		Params = {
			SkeletonName = <Skeleton>
			Name = AnimTreePreviewObject
			Pos = <Pos>
			Orientation = <Quat>
			AssetContext = AnimPreviewObject
			<appearance>
		}
	}
endscript
