reskintree = {
	Type = DegenerateBlend
	id = RootNode
}
reskinanimbranch = {
	Type = param_timer_type
	id = TimerNode
	speed = param_speed
	start = param_start
	anim = param_anim
	[
		{
			Type = tweakbones
			id = tweakbonesnode
			[
				{
					Type = Source
					id = SourceNode
					anim = param_anim
				}
			]
		}
	]
}

script cas_get_bone_slider_value 

	if NOT getcasappearancepart part = <part>

	else
		if GotParam \{bones}
			if StructureContains structure = <bones> <group_name>
				slider = (<bones>.<group_name>)
			else

			endif
		else
		endif
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>

	endif
	GetArraySize <deform_bones> globalarray
	i = 0
	begin
	deform_info = ($<deform_bones> [<i>])
	if (<group_name> = (<deform_info>.group_name))
		if NOT GotParam \{slider}
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
	repeat <array_Size>
	if NOT GotParam \{slider}
		slider = 0.0
	endif
	return {slider = <slider> min_slider = <min_slider> max_slider = <max_slider>}
endscript

script cas_set_bone_slider 

	getcasappearancepart part = <part>
	if NOT GotParam \{bones}
		bones = {}
	endif
	updatestructelement struct = <bones> element = <group_name> value = <slider>
	setcasappearancebones part = <part> bones = <newstruct>
endscript

script cas_part_reskin_create_object 
	if CompositeObjectExists Name = <id>
		if ($cas_reskin_preview = None)

		else
			return
		endif
	endif
	if NOT GotParam \{deform_mesh}

	endif
	if NOT GotParam \{deform_skel}

	endif
	ExtendCrc <deform_skel> '_default' out = deform_anim
	MemPushContext \{TopDownHeap}
	formatText checksumName = modelcsum '%s' s = <deform_mesh>
	if ($cas_reskin_debug = 1)
		if getcurrentcasobject
			<cas_object> :Obj_GetPosition
		endif
		Pos = (<Pos> + (-0.45000002, 0.0, 0.0))
	endif
	MemPushContext \{heap_cas}
	PushAssetContext
	unpackrawcasasset asset = <modelcsum> Type = skin
	PopAssetContext
	MemPopContext \{heap_cas}
	CreateCompositeObject {
		params = {
			Name = <id>
			skeletonname = <deform_skel>
			modelchecksum = <modelcsum>
			geomname = <part>
			Pos = <Pos>
			allow_reset
		}
		components = [
			{component = Skeleton}
			{component = Model}
			{component = AnimTree}
		]
	}
	<id> :Anim_InitTree {
		Tree = $reskintree
		NodeIdDeclaration = [
			RootNode
			TimerNode
			SourceNode
			FlipNode
			tweakbonesnode
		]
	}
	<id> :Anim_Command {
		target = RootNode
		Command = DegenerateBlend_AddBranch
		params = {
			BlendDuration = 0.0
			Tree = $reskinanimbranch
			params = {
				param_timer_type = cycle
				param_anim = <deform_anim>
				param_speed = 1.0
			}
		}
	}
	if ($cas_reskin_debug = 0)
		<id> :Hide
	endif
	MemPopContext
endscript

script cas_apply_bone_group_settings 

	GetArraySize <deform_bones> globalarray
	num_groups = <array_Size>
	igroup = 0
	begin
	deform_info = ($<deform_bones> [<igroup>])
	group_name = (<deform_info>.group_name)
	if StructureContains structure = <bone_settings> <group_name>
		slider = (<bone_settings>.<group_name>)
		GetArraySize (<deform_info>.bones)
		ibone = 0
		begin
		if (<array_Size> < 1)
			break
		endif
		cas_apply_bone_transforms {
			bone_info = (<deform_info>.bones [<ibone>])
			slider = <slider>
			deform_info = <deform_info>
			main_skeleton = <main_skeleton>
			lowres_rig = <lowres_rig>
			deform_skel = <deform_skel>
		}
		ibone = (<ibone> + 1)
		repeat <array_Size>
	endif
	igroup = (<igroup> + 1)
	repeat <num_groups>
endscript

script cas_apply_bone_transforms_lowres 
	if skeleton_hasbone bone = <bone_name>
		<transform_script> transform_data = <transform_data> amount = <amount> bone_name = <bone_name>
	endif
endscript

script cas_apply_bone_transforms 
	if getbonemappedvalue \{Name = scaling}
		if GotParam \{lowres_rig}
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
	if getbonemappedvalue \{Name = translation}
		if GotParam \{lowres_rig}
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
	if getbonemappedvalue \{Name = rotation}
		if GotParam \{lowres_rig}
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
	if StructureContains structure = <transform_data> bone_space
		amount = (<amount>.(1.0, 0.0, 0.0))
	endif
	if StructureContains structure = <transform_data> no_propagate
		if StructureContains structure = <transform_data> model_space
			flags = {model_space}
		endif
		obj_addbonetranslation bone = <bone_name> <amount> <flags>
	else
		Anim_Command {
			target = tweakbonesnode
			Command = tweakbones_translatebone
			params = {
				bone = <bone_name>
				<amount>
			}
		}
	endif
endscript

script cas_bone_scaling 

	if NOT StructureContains structure = <transform_data> no_propagate
		flags = {propagate}
	endif
	if StructureContains structure = <transform_data> stop_propagate
		flags = {stop_propagate}
	endif
	obj_addbonescale bone = <bone_name> <amount> <flags>
endscript

script cas_bone_rotation 
	if StructureContains structure = <transform_data> no_propagate
		if StructureContains structure = <transform_data> model_space
			flags = {model_space}
		endif
		obj_addbonerotation bone = <bone_name> <amount> <flags>
	else
		Anim_Command {
			target = tweakbonesnode
			Command = tweakbones_rotatebone
			params = {
				bone = <bone_name>
				<amount>
			}
		}
	endif
endscript

script cas_reset_bones 
	obj_resetbones
	if Anim_AnimNodeExists \{id = tweakbonesnode}
		Anim_Command \{target = tweakbonesnode
			Command = tweakbones_reset}
	endif
endscript

script cas_get_default_slider_value 
	slider_sum = 0.0
	sliders_checked = 0.0
	if StructureContains structure = <deform_info> bones
		GetArraySize (<deform_info>.bones)
		i = 0
		if (<array_Size> > 0)
			begin
			cas_get_default_slider_value_struct {
				deform_info = <deform_info>
				deform_map = ((<deform_info>.bones) [<i>])
				group_name = (<deform_info>.group_name)
			}
			slider_sum = (<slider_sum> + <slider>)
			sliders_checked = (<sliders_checked> + 1.0)
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if (<sliders_checked> > 0.0)
		slider_sum = (<slider_sum> / <sliders_checked>)
	endif

	return slider = <slider_sum>
endscript

script cas_get_default_slider_value_struct 
	slider_sum = 0.0
	sliders_checked = 0.0
	if StructureContains structure = <deform_map> rotation
		cas_get_default_slider_value_entry deform_info = <deform_info> map = (<deform_map>.rotation)
		slider_sum = (<slider_sum> + <slider>)
		sliders_checked = (<sliders_checked> + 1.0)
	endif
	if StructureContains structure = <deform_map> translation
		cas_get_default_slider_value_entry deform_info = <deform_info> map = (<deform_map>.translation)
		slider_sum = (<slider_sum> + <slider>)
		sliders_checked = (<sliders_checked> + 1.0)
	endif
	if StructureContains structure = <deform_map> scaling
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
		linearmap Result = X from = <min_slider> to = <max_slider> basedon = 0.0 lowerbound = (<from_bone>.(1.0, 0.0, 0.0)) upperbound = (<to_bone>.(1.0, 0.0, 0.0))
		linearmap Result = y from = <min_slider> to = <max_slider> basedon = 0.0 lowerbound = (<from_bone>.(0.0, 1.0, 0.0)) upperbound = (<to_bone>.(0.0, 1.0, 0.0))
		linearmap Result = z from = <min_slider> to = <max_slider> basedon = 0.0 lowerbound = (<from_bone>.(0.0, 0.0, 1.0)) upperbound = (<to_bone>.(0.0, 0.0, 1.0))
		return slider = ((<X> + <y> + <z>) / 3.0)
	else
		linearmap Result = slider from = <min_slider> to = <max_slider> basedon = 0.0 lowerbound = <from_bone> upperbound = <to_bone>
		return slider = <slider>
	endif
endscript

script cas_get_slider_linearmap_values 

	if NOT StructureContains structure = <map> to

		return \{from_bone = 0.0
			to_bone = 0.0
			min_slider = 0.0
			max_slider = 1.0}
	endif
	if StructureContains structure = <map> from
		from_bone = (<map>.from)
	else
		if isvector (<map>.to)
			from_bone = (0.0, 0.0, 0.0)
		else
			from_bone = 0
		endif
	endif
	to_bone = (<map>.to)
	if StructureContains structure = <map> min
		min_slider = (<map>.min)
	else
		cas_get_min_bone_slider deform_info = <deform_info>
	endif
	if StructureContains structure = <map> Max
		max_slider = (<map>.Max)
	else
		cas_get_max_bone_slider deform_info = <deform_info>
	endif
	return from_bone = <from_bone> to_bone = <to_bone> min_slider = <min_slider> max_slider = <max_slider>
endscript

script cas_get_min_bone_slider 
	if StructureContains structure = <deform_info> min
		return min_slider = (<deform_info>.min)
	else
		return \{min_slider = 0.0}
	endif
endscript

script cas_get_max_bone_slider 
	if StructureContains structure = <deform_info> Max
		return max_slider = (<deform_info>.Max)
	else
		return \{max_slider = 1.0}
	endif
endscript

script cas_part_reskin 
	if NOT GotParam \{bone_settings}
		bone_settings = {}
	endif
	cas_part_reskin_create_object id = <reskin_object> part = <part> Pos = (0.0, 0.0, 0.0) deform_mesh = <deform_mesh> deform_skel = <deform_skel>
	<reskin_object> :cas_reset_bones
	if GotParam \{bone_settings}
		<reskin_object> :cas_apply_bone_group_settings bone_settings = <bone_settings> deform_bones = <deform_bones>
	endif
	if GotParam \{additional_bone_transforms}

		<reskin_object> :cas_apply_additional_bone_transforms additional_bone_transforms = <additional_bone_transforms>
	endif
	<reskin_object> :Anim_UpdatePose
	return \{true}
endscript

script cas_main_skel_scale 
	if NOT GotParam \{bone_settings}
		bone_settings = {}
	endif
	if GotParam \{bone_settings}
		cas_apply_bone_group_settings bone_settings = <bone_settings> deform_bones = <deform_bones> main_skeleton = 1
	endif
	if GotParam \{additional_bone_transforms}

		cas_apply_additional_bone_transforms additional_bone_transforms = <additional_bone_transforms> main_skeleton = 1
	endif
endscript

script cas_apply_additional_bone_transforms 
	GetArraySize <additional_bone_transforms>
	i = 0
	if (<array_Size> > 0)
		begin
		transform = (<additional_bone_transforms> [<i>])
		cas_apply_bone_transforms {
			bone_info = <transform>
			slider = value_only
			main_skeleton = <main_skeleton>
			lowres_rig = <lowres_rig>
			deform_skel = <deform_skel>
			deform_info = <deform_info>
		}
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script cas_lowres_rig_reskin 
	if GotParam \{bone_settings}
		cas_apply_bone_group_settings bone_settings = <bone_settings> deform_bones = <deform_bones> deform_skel = <deform_skel> lowres_rig = 1
	endif
	if GotParam \{additional_bone_transforms}
		cas_apply_additional_bone_transforms additional_bone_transforms = <additional_bone_transforms> deform_skel = <deform_skel> lowres_rig = 1
	endif
	Anim_UpdatePose
	return \{true}
endscript
