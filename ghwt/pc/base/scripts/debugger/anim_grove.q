animpreviewbasetree = {
	type = degenerateblend
	id = previewtreeanimnode
}

script animgrove_control_script 
	printf \{qs(0x4f175157)}
	begin
	animinfo_getallactivevaluesources
	if scriptexists \{animgrove_user_generated_control_script}
		animgrove_user_generated_control_script <...>
	endif
	animpreview_setsourcevalues <...>
	wait \{1
		gameframe}
	repeat
	printf \{qs(0x2d5a982c)}
endscript

script animtreepreview_updateblendvalues 
	if compositeobjectexists \{name = animtreepreviewobject}
		animtreepreviewobject :animpreview_setsourcevalues <...>
	endif
endscript

script testanimscript 
	anim_command target = previewtreeanimnode command = degenerateblend_addbranch params = {tree = <tree> params = <tree_params>}
	obj_forceupdate
	animgrove_control_script
endscript

script animtreepreview_nxcommon \{targetobject = skater
		modelbuilderheap = debugheap}
	if compositeobjectexists \{name = animtreepreviewobject}
		animtreepreviewrestore
	endif
	dump <tree>
	loadpak \{'pak/animgrove_preview.pak'
		heap = heap_debug}
	if NOT gotparam \{skeleton}
		<targetobject> :skeleton_getskeletonname
		skeleton = <skeletonname>
	endif
	if NOT gotparam \{ragdoll}
		if <targetobject> :containscomponent name = ragdoll
			if <targetobject> :ragdoll_getragdollname
				ragdoll = <ragdollname>
			endif
		endif
	endif
	setsearchallassetcontexts
	createfakeplayer positionfrom = <targetobject> clonefrom = <targetobject> model = <model> ragdoll = <ragdoll> skeleton = <skeleton> active_value_sources = <active_value_sources> modelbuilderheap = <modelbuilderheap>
	animtreepreviewobject :anim_inittree \{tree = $animpreviewbasetree
		nodeiddeclaration = [
			previewtreeanimnode
		]}
	if gotparam \{blend_values}
		animtreepreviewobject :animpreview_setsourcevalues <blend_values>
	endif
	if animtreepreviewobject :anim_loadanims tree = <tree> params = <tree_params>
		animtreepreviewobject :obj_switchscript testanimscript params = {tree = <tree> tree_params = <tree_params>}
		<targetobject> :hide
		<targetobject> :pause
	else
		animtreepreviewobject :die
	endif
	dump <tree>
endscript

script animtreepreviewrestore_nxcommon 
	unloadpak \{'pak/animgrove_preview.pak'}
endscript

script animtreepreview_reregisteranimevents 
	printf \{qs(0xa2fc79d0)}
	initanimeventmap
	i = 0
	getarraysize \{track_names}
	begin
	track_name = (<track_globals> [<i>])
	track_global = (<track_globals> [<i>])
	registeranimevents track = <track_name> anim_events = $<track_global>
	i = (<i> + 1)
	repeat <array_size>
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
		flushdeadobjects
	endif
	<positionfrom> :obj_getposition
	<positionfrom> :obj_getquat
	formattext checksumname = appearance '%s' s = <model>
	if globalexists name = <appearance> type = structure
		removeparameter \{model}
	else
		removeparameter \{appearance}
	endif
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
			component = modelbuilder
			allocator = simple
			heap = <modelbuilderheap>
		}
		{
			component = input
			controller = 1
			dontusedpadasleftanalog
		}
		{
			component = animpreview
			active_value_source_list = <active_value_sources>
			preload_model = <model>
			geom_heap = <modelbuilderheap>
		}
		{
			component = animinfo
			active_value_set = preview
		}
		{
			component = animtree
			referencechecksum = <skeleton>
		}
		{
			component = skeleton
			allow_reset
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
	elseif gotparam \{appearance}
		modelcomponent = [
			{
				component = model
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
			$<appearance>
		}
	}
	if gotparam \{appearance}
		if NOT structurecontains structure = $<appearance> model
			build_params = {appearance = $<appearance> buildscriptparams = {$<appearance> async = 0}}
			animtreepreviewobject :modelbuilder_preload <build_params>
			animtreepreviewobject :modelbuilder_loadassets <build_params>
			animtreepreviewobject :modelbuilder_build <build_params>
		endif
	endif
endscript
