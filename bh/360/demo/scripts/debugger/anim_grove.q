animpreviewbasetree = {
	type = degenerateblend
	id = previewtreeanimnode
}
ganimtreepreviewobjects = [
]

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
	getarraysize ($ganimtreepreviewobjects)
	if (<array_size> > 0)
		index = 0
		begin
		(($ganimtreepreviewobjects [<index>]).name) :animpreview_setsourcevalues <...>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script testanimscript 
	anim_command target = previewtreeanimnode command = degenerateblend_addbranch params = {tree = <tree> params = <tree_params>}
	obj_forceupdate
	animgrove_control_script
endscript

script animtreepreview_nxcommon \{modelbuilderheap = debugheap}
	loadpak \{'pak/animgrove_preview.pak'
		heap = heap_debug}
	getarraysize <trees>
	if (<array_size> > 0)
		index = 0
		begin
		tree_info = (<trees> [<index>])
		setsearchallassetcontexts
		createfakeplayer positionfrom = (<tree_info>.target_object) clonefrom = (<tree_info>.target_object) active_value_sources = (<tree_info>.active_value_sources) id = (<tree_info>.name) modelbuilderheap = <modelbuilderheap>
		if NOT compositeobjectexists (<tree_info>.name)
			printf qs(0x5e6d9208) v = (<tree_info>.name)
			return
		endif
		(<tree_info>.name) :anim_inittree tree = $animpreviewbasetree nodeiddeclaration = [previewtreeanimnode]
		(<tree_info>.name) :animpreview_setsourcevalues (<tree_info>.blend_values)
		if (<tree_info>.name) :anim_loadanims tree = (<tree_info>.tree) params = (<tree_info>.tree_params)
			(<tree_info>.name) :obj_switchscript testanimscript params = {tree = (<tree_info>.tree) tree_params = (<tree_info>.tree_params)}
			(<tree_info>.target_object) :hide
			(<tree_info>.target_object) :pause
			(<tree_info>.name) :unpause
		else
			(<tree_info>.name) :die
			return
		endif
		array = []
		addstructurearrayelement array = $ganimtreepreviewobjects element = <tree_info>
		change ganimtreepreviewobjects = <array>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script animtreepreviewrestore_nxcommon 
	getarraysize ($ganimtreepreviewobjects)
	if (<array_size> > 0)
		index = 0
		begin
		(($ganimtreepreviewobjects [<index>]).name) :die
		(($ganimtreepreviewobjects [<index>]).target_object) :unhide
		index = (<index> + 1)
		repeat <array_size>
	endif
	array = []
	change ganimtreepreviewobjects = <array>
	pushassetcontext \{context = animgrove_preview}
	setsearchallassetcontexts \{off}
	unloadpak \{'pak/animgrove_preview.pak'}
	setsearchallassetcontexts \{on}
	popassetcontext
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
	if compositeobjectexists <id>
		<id> :die
		flushdeadobjects
	endif
	<clonefrom> :skeleton_getskeletonname
	<clonefrom> :skeleton_getuniqueassetcontext
	if <clonefrom> :containscomponent name = ragdoll
		<clonefrom> :ragdoll_getragdollname
	endif
	<positionfrom> :obj_getposition
	<positionfrom> :obj_getquat
	components = []
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
			geom_heap = <modelbuilderheap>
		}
		{
			component = animinfo
			active_value_set = preview
		}
		{
			component = animtree
			referencechecksum = <skeletonname>
		}
		{
			component = skeleton
			skeletonassetcontext = <unique_asset_context>
			allow_reset
		}
		{
			component = setdisplaymatrix
		}
	]
	modelcomponent = [
		{
			component = model
			clonefrom = <clonefrom>
			lightgroup = [band drummer guitarist vocalist bassist alt_band]
		}
	]
	components = (<components> + <basiccomponents> + <modelcomponent>)
	if gotparam \{ragdollname}
		ragdollcomponents = [
			{
				component = ragdoll
				ragdollname = <ragdollname>
				initialize_empty = false
			}
		]
		components = (<components> + <ragdollcomponents>)
	endif
	createcompositeobject {
		components = <components>
		params = {
			name = <id>
			pos = <pos>
			orientation = <quat>
			skeletonname = <skeletonname>
			assetcontext = animpreviewobject
		}
	}
endscript
