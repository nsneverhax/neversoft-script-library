animgrove_node_declaration = [
	previewtreeanimnode
	db_av_lite
	db_av_big
	db_gped
	bodytimer
	tweakbones
]
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

script animtreepreview_nxcommon \{modelbuilderheap = heap_debug}
	loadpak \{'pak/animgrove_preview.pak'
		heap = heap_debug}
	getarraysize <trees>
	if (<array_size> > 0)
		index = 0
		begin
		tree_info = (<trees> [<index>])
		setsearchallassetcontexts
		name = (<tree_info>.name)
		target_object = (<tree_info>.target_object)
		camera_reference_object = none
		is_3d_crowd = false
		is_camera = false
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
			name = <target_object>
			<is_3d_crowd> = true
		endswitch
		if (<is_3d_crowd> = false)
			if (<camera_reference_object> != none)
				is_camera = true
				pos = (0.0, 0.0, 0.0)
				dir = (0.0, 1.0, 0.0)
				if compositeobjectexists name = <camera_reference_object>
					<camera_reference_object> :obj_getposition
					<camera_reference_object> :obj_getquat
				endif
				createcameratarget id = <name> active_value_sources = (<tree_info>.active_value_sources) modelbuilderheap = <modelbuilderheap> pos = <pos> quat = <quat>
				createanimgrovepreviewcamera lock_to = <name>
			else
				createfakeplayer positionfrom = <target_object> clonefrom = <target_object> active_value_sources = (<tree_info>.active_value_sources) id = <name> modelbuilderheap = <modelbuilderheap>
			endif
		endif
		if NOT compositeobjectexists <name>
			printf qs(0x5e6d9208) v = <name>
			return
		endif
		<name> :anim_inittree tree = $animpreviewbasetree nodeiddeclaration = $animgrove_node_declaration
		<name> :animpreview_setsourcevalues (<tree_info>.blend_values)
		if <name> :anim_loadanims tree = (<tree_info>.tree) params = (<tree_info>.tree_params)
			<name> :obj_switchscript testanimscript params = {tree = (<tree_info>.tree) tree_params = (<tree_info>.tree_params)}
			if (<is_camera> = false)
				<target_object> :hide
				<target_object> :pause
			endif
			<name> :unpause
		else
			<name> :die
			return
		endif
		array = []
		addstructurearrayelement array = $ganimtreepreviewobjects element = <tree_info>
		change ganimtreepreviewobjects = <array>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script is_crowd3d_anim_instance 
	switch <name>
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
	return \{false}
endscript

script animtreepreviewrestore_nxcommon 
	getarraysize ($ganimtreepreviewobjects)
	if (<array_size> > 0)
		index = 0
		begin
		<target> = (($ganimtreepreviewobjects [<index>]).target_object)
		if NOT is_crowd3d_anim_instance name = <target>
			<name> = (($ganimtreepreviewobjects [<index>]).name)
			<name> :die
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
			lightgroup = [band drummer guitarist vocalist bassist alt_band crowd]
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

script createcameratarget 
	if NOT gotparam \{id}
		scriptassert \{'id not given'}
		return
	endif
	if compositeobjectexists <id>
		<id> :die
		flushdeadobjects
	endif
	components = [
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
		}
		{
			component = skeleton
			allow_reset
		}
	]
	createcompositeobject {
		components = <components>
		params = {
			name = <id>
			pos = <pos>
			orientation = <quat>
			skeletonname = gh4_camera
			assetcontext = animpreviewobject
		}
	}
endscript

script createanimgrovepreviewcamera 
	if NOT gotparam \{lock_to}
		scriptassert \{'lock_to target required'}
	endif
	if compositeobjectexists \{name = animgrovepreviewcamera}
		animgrovepreviewcamera :die
	endif
	<camera_object_params> = {
		params = {
			name = animgrovepreviewcamera
		}
		components = [
			{
				component = cinematiccamera
				updatewhengamepaused = true
				enabled = true
			}
			{
				component = camera
				far_clip = $camera_default_far_clip
			}
		]
	}
	if iscompositeobjectmanagerenabled
		createcompositeobject <camera_object_params>
	else
		createcompositeobjectinstance <camera_object_params> priority = coim_priority_permanent heap = generic oldheap = com
	endif
	animgrovepreviewcamera :ccam_domorph {
		lockto = <lock_to>
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	setactivecamera \{id = animgrovepreviewcamera
		viewport = bg_viewport}
	animgrovepreviewcamera :unpause
endscript
