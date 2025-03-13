reskintree = {
	type = degenerateblend
	id = rootnode
}
reskinanimbranch = {
	type = param_timer_type
	id = timernode
	speed = param_speed
	start = param_start
	anim = param_anim
	[
		{
			type = tweakbones
			id = tweakbonesnode
			[
				{
					type = source
					id = sourcenode
					anim = param_anim
				}
			]
		}
	]
}

script cas_get_bone_slider_value 
	requireparams \{[
			part
			group_name
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert 'Part %s not found' s = <part>
	else
		if gotparam \{bones}
			if structurecontains structure = <bones> <group_name>
				slider = (<bones>.<group_name>)
			else
				printf 'Bone %s missing in part, will devise a default setting' s = <group_name>
			endif
		else
		endif
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	getarraysize <deform_bones> globalarray
	i = 0
	begin
	deform_info = ($<deform_bones> [<i>])
	if (<group_name> = (<deform_info>.group_name))
		if NOT gotparam \{slider}
			cas_get_default_slider_value deform_info = <deform_info>
		endif
		cas_get_min_bone_slider deform_info = <deform_info>
		cas_get_max_bone_slider deform_info = <deform_info>
		if (<slider> < <min_slider>)
			slider = (<min_slider>)
		endif
		if (<slider> > <max_slider>)
			slider = (<max_slider>)
		endif
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT gotparam \{slider}
		slider = 0.0
	endif
	return {slider = <slider> min_slider = <min_slider> max_slider = <max_slider>}
endscript

script cas_set_bone_slider 
	requireparams \{[
			part
			group_name
			slider
		]
		all}
	getcasappearancepart part = <part>
	if NOT gotparam \{bones}
		bones = {}
	endif
	updatestructelement struct = <bones> element = <group_name> value = <slider>
	setcasappearancebones part = <part> bones = <newstruct>
endscript

script cas_part_reskin_create_object 
	if compositeobjectexists name = <id>
		if ($cas_reskin_preview = none)
			scriptassert 'Name clash on %s when reskinning' s = <id> donotresolve
		else
			return
		endif
	endif
	if NOT gotparam \{deform_mesh}
		scriptassert \{'deform_mesh missing'}
	endif
	if NOT gotparam \{deform_skel}
		scriptassert \{'deform_mesh missing'}
	endif
	extendcrc <deform_skel> '_default' out = deform_anim
	mempushcontext \{topdownheap}
	formattext checksumname = modelcsum '%s' s = <deform_mesh>
	if ($cas_reskin_debug = 1)
		if getcurrentcasobject
			<cas_object> :obj_getposition
		endif
		pos = (<pos> + (-0.45000002, 0.0, 0.0))
	endif
	mempushcontext \{heap_cas}
	pushassetcontext
	unpackrawcasasset asset = <modelcsum> type = skin
	popassetcontext
	mempopcontext \{heap_cas}
	createcompositeobject {
		params = {
			name = <id>
			skeletonname = <deform_skel>
			modelchecksum = <modelcsum>
			geomname = <part>
			pos = <pos>
			allow_reset
		}
		components = [
			{component = skeleton}
			{component = model}
			{component = animtree}
		]
	}
	<id> :anim_inittree {
		tree = $reskintree
		nodeiddeclaration = [
			rootnode
			timernode
			sourcenode
			flipnode
			tweakbonesnode
		]
	}
	<id> :anim_command {
		target = rootnode
		command = degenerateblend_addbranch
		params = {
			blendduration = 0.0
			tree = $reskinanimbranch
			params = {
				param_timer_type = cycle
				param_anim = <deform_anim>
				param_speed = 1.0
			}
		}
	}
	if ($cas_reskin_debug = 0)
		<id> :hide
	endif
	mempopcontext
endscript

script cas_apply_bone_group_settings 
	requireparams \{[
			bone_settings
			deform_bones
		]
		all}
	getarraysize <deform_bones> globalarray
	num_groups = <array_size>
	igroup = 0
	begin
	deform_info = ($<deform_bones> [<igroup>])
	group_name = (<deform_info>.group_name)
	if structurecontains structure = <bone_settings> <group_name>
		slider = (<bone_settings>.<group_name>)
		getarraysize (<deform_info>.bones)
		ibone = 0
		begin
		cas_apply_bone_transforms {
			bone_info = (<deform_info>.bones [<ibone>])
			slider = <slider>
			deform_info = <deform_info>
			main_skeleton = <main_skeleton>
			lowres_rig = <lowres_rig>
			deform_skel = <deform_skel>
		}
		ibone = (<ibone> + 1)
		repeat <array_size>
	endif
	igroup = (<igroup> + 1)
	repeat <num_groups>
endscript

script cas_apply_bone_transforms_lowres 
	if skeleton_hasbone bone = <bone_name>
		<transform_script> transform_data = <transform_data> amount = <amount> bone_name = <bone_name>
	endif
	if gotparam \{no_recurse}
		return
	endif
	getskeletonchildbones bone = <bone_name> skeleton = <deform_skel>
	getarraysize <child_bones>
	i = 0
	if (<array_size> > 0)
		begin
		cas_apply_bone_transforms_lowres {
			transform_script = <transform_script>
			transform_data = <transform_data>
			amount = <amount>
			bone_name = (<child_bones> [<i>])
			deform_skel = <deform_skel>
		}
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script cas_apply_bone_transforms 
	if getbonemappedvalue \{name = scaling}
		if gotparam \{lowres_rig}
			cas_apply_bone_transforms_lowres {
				transform_script = cas_bone_scaling
				transform_data = (<bone_info>.scaling)
				amount = <mapped_value>
				bone_name = (<bone_info>.bone)
				deform_skel = <deform_skel>
				no_recurse
			}
		else
			cas_bone_scaling transform_data = (<bone_info>.scaling) amount = <mapped_value> bone_name = (<bone_info>.bone)
		endif
	endif
	if getbonemappedvalue \{name = translation}
		if gotparam \{lowres_rig}
			cas_apply_bone_transforms_lowres {
				transform_script = cas_bone_translation
				transform_data = (<bone_info>.translation)
				amount = <mapped_value>
				bone_name = (<bone_info>.bone)
				deform_skel = <deform_skel>
			}
		else
			cas_bone_translation transform_data = (<bone_info>.translation) amount = <mapped_value> bone_name = (<bone_info>.bone)
		endif
	endif
	if getbonemappedvalue \{name = rotation}
		if gotparam \{lowres_rig}
			cas_apply_bone_transforms_lowres {
				transform_script = cas_bone_rotation
				transform_data = (<bone_info>.rotation)
				amount = <mapped_value>
				bone_name = (<bone_info>.bone)
				deform_skel = <deform_skel>
			}
		else
			cas_bone_rotation transform_data = (<bone_info>.rotation) amount = <mapped_value> bone_name = (<bone_info>.bone)
		endif
	endif
endscript

script cas_bone_translation 
	if structurecontains structure = <transform_data> bone_space
		amount = (<amount>.(1.0, 0.0, 0.0))
	endif
	if structurecontains structure = <transform_data> no_propagate
		if structurecontains structure = <transform_data> model_space
			flags = {model_space}
		endif
		obj_addbonetranslation bone = <bone_name> <amount> <flags>
	else
		anim_command {
			target = tweakbonesnode
			command = tweakbones_translatebone
			params = {
				bone = <bone_name>
				<amount>
			}
		}
	endif
endscript

script cas_bone_scaling 
	requireparams \{[
			transform_data
			amount
			bone_name
		]}
	if NOT structurecontains structure = <transform_data> no_propagate
		flags = {propagate}
	endif
	if structurecontains structure = <transform_data> stop_propagate
		flags = {stop_propagate}
	endif
	obj_addbonescale bone = <bone_name> <amount> <flags>
endscript

script cas_bone_rotation 
	if structurecontains structure = <transform_data> no_propagate
		if structurecontains structure = <transform_data> model_space
			flags = {model_space}
		endif
		obj_addbonerotation bone = <bone_name> <amount> <flags>
	else
		anim_command {
			target = tweakbonesnode
			command = tweakbones_rotatebone
			params = {
				bone = <bone_name>
				<amount>
			}
		}
	endif
endscript

script cas_reset_bones 
	obj_resetbones
	if anim_animnodeexists \{id = tweakbonesnode}
		anim_command \{target = tweakbonesnode
			command = tweakbones_reset}
	endif
endscript

script cas_get_default_slider_value 
	slider_sum = 0.0
	sliders_checked = 0.0
	if structurecontains structure = <deform_info> bones
		getarraysize (<deform_info>.bones)
		i = 0
		if (<array_size> > 0)
			begin
			cas_get_default_slider_value_struct {
				deform_info = <deform_info>
				deform_map = ((<deform_info>.bones) [<i>])
				group_name = (<deform_info>.group_name)
			}
			slider_sum = (<slider_sum> + <slider>)
			sliders_checked = (<sliders_checked> + 1.0)
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if (<sliders_checked> > 0.0)
		slider_sum = (<slider_sum> / <sliders_checked>)
	endif
	printf 'avg of %s %v' s = (<deform_info>.group_name) v = <slider_sum>
	return slider = <slider_sum>
endscript

script cas_get_default_slider_value_struct 
	slider_sum = 0.0
	sliders_checked = 0.0
	if structurecontains structure = <deform_map> rotation
		cas_get_default_slider_value_entry deform_info = <deform_info> map = (<deform_map>.rotation)
		slider_sum = (<slider_sum> + <slider>)
		sliders_checked = (<sliders_checked> + 1.0)
	endif
	if structurecontains structure = <deform_map> translation
		cas_get_default_slider_value_entry deform_info = <deform_info> map = (<deform_map>.translation)
		slider_sum = (<slider_sum> + <slider>)
		sliders_checked = (<sliders_checked> + 1.0)
	endif
	if structurecontains structure = <deform_map> scaling
		cas_get_default_slider_value_entry deform_info = <deform_info> map = (<deform_map>.scaling)
		slider_sum = (<slider_sum> + <slider>)
		sliders_checked = (<sliders_checked> + 1.0)
	endif
	if (<sliders_checked> > 0.0)
		slider_sum = (<slider_sum> / <sliders_checked>)
	endif
	return slider = <slider_sum>
endscript

script cas_get_default_slider_value_entry 
	cas_get_slider_linearmap_values map = <map> deform_info = <deform_info>
	if isvector <from_bone>
		linearmap result = x from = <min_slider> to = <max_slider> basedon = 0.0 lowerbound = (<from_bone>.(1.0, 0.0, 0.0)) upperbound = (<to_bone>.(1.0, 0.0, 0.0))
		linearmap result = y from = <min_slider> to = <max_slider> basedon = 0.0 lowerbound = (<from_bone>.(0.0, 1.0, 0.0)) upperbound = (<to_bone>.(0.0, 1.0, 0.0))
		linearmap result = z from = <min_slider> to = <max_slider> basedon = 0.0 lowerbound = (<from_bone>.(0.0, 0.0, 1.0)) upperbound = (<to_bone>.(0.0, 0.0, 1.0))
		return slider = ((<x> + <y> + <z>) / 3.0)
	else
		linearmap result = slider from = <min_slider> to = <max_slider> basedon = 0.0 lowerbound = <from_bone> upperbound = <to_bone>
		return slider = <slider>
	endif
endscript

script cas_get_slider_linearmap_values 
	requireparams \{[
			map
			deform_info
		]
		all}
	if NOT structurecontains structure = <map> to
		printf 'Missing \'to\' entry for %s-%t!' s = (<deform_info>.frontend_desc) t = (<deform_info>.group_name) donotresolve
		return \{from_bone = 0.0
			to_bone = 0.0
			min_slider = 0.0
			max_slider = 1.0}
	endif
	if structurecontains structure = <map> from
		from_bone = (<map>.from)
	else
		if isvector (<map>.to)
			from_bone = (0.0, 0.0, 0.0)
		else
			from_bone = 0
		endif
	endif
	to_bone = (<map>.to)
	if structurecontains structure = <map> min
		min_slider = (<map>.min)
	else
		cas_get_min_bone_slider deform_info = <deform_info>
	endif
	if structurecontains structure = <map> max
		max_slider = (<map>.max)
	else
		cas_get_max_bone_slider deform_info = <deform_info>
	endif
	return from_bone = <from_bone> to_bone = <to_bone> min_slider = <min_slider> max_slider = <max_slider>
endscript

script cas_get_min_bone_slider 
	if structurecontains structure = <deform_info> min
		return min_slider = (<deform_info>.min)
	else
		return \{min_slider = 0.0}
	endif
endscript

script cas_get_max_bone_slider 
	if structurecontains structure = <deform_info> max
		return max_slider = (<deform_info>.max)
	else
		return \{max_slider = 1.0}
	endif
endscript

script cas_part_reskin 
	if NOT gotparam \{bone_settings}
		bone_settings = {}
	endif
	cas_part_reskin_create_object id = <reskin_object> part = <part> pos = (0.0, 0.0, 0.0) deform_mesh = <deform_mesh> deform_skel = <deform_skel>
	<reskin_object> :cas_reset_bones
	if gotparam \{bone_settings}
		<reskin_object> :cas_apply_bone_group_settings bone_settings = <bone_settings> deform_bones = <deform_bones>
	endif
	if gotparam \{additional_bone_transforms}
		printf 'Doing additional transforms for %s' s = <part> donotresolve
		<reskin_object> :cas_apply_additional_bone_transforms additional_bone_transforms = <additional_bone_transforms>
	endif
	<reskin_object> :anim_updatepose
	return \{true}
endscript

script cas_main_skel_scale 
	if NOT gotparam \{bone_settings}
		bone_settings = {}
	endif
	if gotparam \{bone_settings}
		cas_apply_bone_group_settings bone_settings = <bone_settings> deform_bones = <deform_bones> main_skeleton = 1
	endif
	if gotparam \{additional_bone_transforms}
		printf 'Doing additional transforms for %s' s = <part> donotresolve
		cas_apply_additional_bone_transforms additional_bone_transforms = <additional_bone_transforms> main_skeleton = 1
	endif
endscript

script cas_apply_additional_bone_transforms 
	getarraysize <additional_bone_transforms>
	i = 0
	if (<array_size> > 0)
		begin
		transform = (<additional_bone_transforms> [<i>])
		cas_apply_bone_transforms {
			bone_info = <transform>
			slider = value_only
			main_skeleton = <main_skeleton>
			lowres_rig = <lowres_rig>
			deform_skel = <deform_skel>
		}
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script cas_lowres_rig_reskin 
	if gotparam \{bone_settings}
		cas_apply_bone_group_settings bone_settings = <bone_settings> deform_bones = <deform_bones> deform_skel = <deform_skel> lowres_rig = 1
	endif
	if gotparam \{additional_bone_transforms}
		cas_apply_additional_bone_transforms additional_bone_transforms = <additional_bone_transforms> deform_skel = <deform_skel> lowres_rig = 1
	endif
	anim_updatepose
	return \{true}
endscript
