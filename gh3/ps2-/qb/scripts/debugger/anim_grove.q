animpreviewbasetree = {
	type = degenerateblend
	id = previewtreeanimnode
}

script animtreepreview_updateblendvalues 
	if compositeobjectexists \{name = animtreepreviewobject}
		animtreepreviewobject :animpreview_setsourcevalues <...>
	endif
endscript

script testanimscript 
	anim_command target = previewtreeanimnode command = degenerateblend_addbranch params = {tree = <tree> params = <tree_params>}
	obj_forceupdate
endscript

script animtreepreview_nxcommon \{targetobject = skater}
	if compositeobjectexists \{name = animtreepreviewobject}
		animtreepreviewrestore
	endif
	dump <tree>
	if NOT gotparam \{skeleton}
		<targetobject> :skeleton_getskeletonname
		skeleton = <skeletonname>
	endif
	if NOT gotparam \{ragdoll}
		if <targetobject> :containscomponent ragdoll
			if <targetobject> :ragdoll_getragdollname
				ragdoll = <ragdollname>
			endif
		endif
	endif
	setsearchallassetcontexts
	createfakeplayer positionfrom = <targetobject> clonefrom = <targetobject> model = <model> ragdoll = <ragdoll> skeleton = <skeleton> appearance = <appearance> active_value_sources = <active_value_sources>
	animtreepreviewobject :anim_inittree \{tree = $animpreviewbasetree
		nodeiddeclaration = [
			previewtreeanimnode
		]}
	if animtreepreviewobject :anim_loadanims tree = <tree> params = <tree_params>
		animtreepreviewobject :obj_switchscript testanimscript params = {tree = <tree> tree_params = <tree_params>}
		<targetobject> :hide
		<targetobject> :pause
	else
		animtreepreviewobject :die
	endif
	dump <tree>
endscript

script createfakeplayer 
	if NOT compositeobjectexists <clonefrom>
		return
	endif
	if NOT compositeobjectexists <positionfrom>
		return
	endif
	if compositeobjectexists \{animtreepreviewobject}
		animtreepreviewobject :die
	endif
	<positionfrom> :obj_getposition
	<positionfrom> :obj_getquat
	components = []
	if gotparam \{ragdoll}
		ragdollcomponents = [
			{
				component = ragdoll
				ragdollname = <ragdoll>
				initialize_empty = false
			}
		]
		components = (<components> + <ragdollcomponents>)
	endif
	basiccomponents = [
		{
			component = animpreview
			active_value_source_list = <active_value_sources>
			preload_model = <model>
		}
		{
			component = animinfo
			active_value_set = preview
		}
		{
			component = animtree
			referencechecksum = <skeleton>
			animeventtablename = skateranimeventtable
		}
		{
			component = skeleton
		}
		{
			component = setdisplaymatrix
		}
	]
	components = (<components> + <basiccomponents>)
	if gotparam \{model}
		modelcomponent = [
			{
				component = model
				model = <model>
			}
		]
	else
		modelcomponent = [
			{
				component = model
				clonefrom = <clonefrom>
			}
		]
	endif
	components = (<components> + <modelcomponent>)
	createcompositeobject {
		components = <components>
		params = {
			skeletonname = <skeleton>
			name = animtreepreviewobject
			pos = <pos>
			orientation = <quat>
			assetcontext = animpreviewobject
			<appearance>
		}
	}
endscript
