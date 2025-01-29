g_lookat_smooth_transit_curve = [
	1.0
	0.99438995
	0.97565895
	0.9399669
	0.881404
	0.790321
	0.650385
	0.43963802
	0.18898101
	0.0377895
	0.0
]

script band_lookat_on \{blend_duration = 0.6
		head_strength = 0.7
		eye_type = standard
		target_bone = None
		target_offset = (0.0, 0.0, 0.0)}
	gamemode_gettype
	switch <Type>
		case training
		case practice
		case tutorial
		return \{FALSE}
	endswitch
	band_lookat_on_hub {
		Name = <Name>
		blend_duration = <blend_duration>
		head_strength = <head_strength>
		eye_type = <eye_type>
		target = <target>
		target_bone = <target_bone>
		target_offset = <target_offset>
	}
endscript

script band_lookat_off \{blend_duration = 0.6}
	gamemode_gettype
	switch <Type>
		case training
		case practice
		case tutorial
		return \{FALSE}
	endswitch
	band_lookat_off_hub {
		Name = <Name>
		blend_duration = <blend_duration>
	}
endscript

script band_lookat_off_hub 
	get_musician_id Name = <Name>
	musician = <Name>
	<musician> :Obj_KillSpawnedScript Name = band_lookat
	<musician> :Anim_Command target = eye_lookat_switch Command = partialswitch_setstate params = {OFF BlendDuration = <blend_duration>}
	<musician> :Anim_Command target = db_eye_lookat Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blend_duration>
		BlendCurve = $g_lookat_smooth_transit_curve
		Tree = $eye_lookat_off
		params = {
		}
	}
	<musician> :Anim_Command target = db_head_lookat Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blend_duration>
		BlendCurve = g_lookat_smooth_transit_curve
		Tree = $head_lookat_off
		params = {
		}
	}
	musician = musician
	Name = musician
	blend_duration = 0.0
endscript

script band_lookat_on_hub 
	changeglobalinteger \{global_name = g_drummer_lookat_control_priority_hijacked
		new_value = 1}
	part = <Name>
	get_musician_id Name = <Name>
	musician = <Name>
	if (<target> = Camera)
		cam_check = true
	else
		get_musician_id Name = <target>
		target = <Name>
		cam_check = FALSE
	endif
	<musician> :Anim_Command {
		target = eye_lookat_type
		Command = switchclearbones_setclearanims
		params = {
			sourceclear0 = gh_male_eye_lookat_base_lids
			sourceclear1 = gh_male_eye_lookat_base
		}
	}
	<musician> :Obj_KillSpawnedScript Name = band_lookat
	<musician> :Obj_SpawnScriptNow band_lookat params = {
		blend_duration = <blend_duration>
		head_strength = <head_strength>
		target = <target>
		target_bone = <target_bone>
		target_offset = <target_offset>
		eye_type = <eye_type>
		part = <part>
		cam_check = <cam_check>
	}
	target = something
	musician = musician
	target_bone = bone
	target_offset = (0.0, 0.0, 0.0)
	Name = musician
	blend_duration = 0.0
	head_strength = 0.7
	eye_type = standard
endscript

script band_lookat 
	target_fail = 0
	eye_up_limit = 0.35000002
	eye_left_limit = 0.7
	eye_down_limit = 0.4
	eye_right_limit = 0.6
	head_up_dampen_end = 1.5
	head_left_dampen_end = 1.5
	head_down_dampen_end = 0.9
	head_right_dampen_end = 1.5
	head_dampen_end = 0.9
	head_dampen_start = 0.85
	obj_getintegertag \{tag_name = lookat_av}
	<lookat_av> = <integer_value>
	if (<lookat_av> = 2)
		eye_lookat_tree = eye_lookat_tree1
		head_lookat_tree = head_lookat_tree1
		lookat_av = 1
		obj_setintegertag tag_name = lookat_av integer_value = <lookat_av>
	else
		eye_lookat_tree = eye_lookat_tree2
		head_lookat_tree = head_lookat_tree2
		lookat_av = 2
		obj_setintegertag tag_name = lookat_av integer_value = <lookat_av>
	endif
	if (<eye_type> = open)
		Anim_Command \{target = eye_lookat_type
			Command = switchclearbones_setstate
			params = {
				OFF
			}}
	else
		Anim_Command \{target = eye_lookat_type
			Command = switchclearbones_setstate
			params = {
				On
			}}
	endif
	Anim_Command target = eye_lookat_switch Command = partialswitch_setstate params = {On BlendDuration = (<blend_duration> * 0.5)}
	Anim_Command target = db_eye_lookat Command = DegenerateBlend_AddBranch params = {
		BlendDuration = (<blend_duration> * 0.5)
		BlendCurve = g_lookat_smooth_transit_curve
		Tree = $<eye_lookat_tree>
		params = {
		}
	}
	Anim_Command target = db_head_lookat Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blend_duration>
		BlendCurve = g_lookat_smooth_transit_curve
		Tree = $<head_lookat_tree>
		params = {
			Strength = <head_strength>
		}
	}
	lookatanim_setdata lookatanimtargets = [
		{
			bone = bone_head
			target = <target>
			bone_offset = (0.081, 0.120000005, 0.0)
			target_offset = <target_offset>
			target_bone = <target_bone>
			eye_down_limit = <eye_down_limit>
			eye_up_limit = <eye_up_limit>
			eye_right_limit = <eye_right_limit>
			eye_left_limit = <eye_left_limit>
			destanglealignvalue = av_eyemag_1
			destradialalignvalue = av_eyerot_1
			enable_tag = lookat_av
			enable_tag_value = 1
		}
		{
			bone = bone_chest
			target = <target>
			bone_offset = (0.30865002, 0.016189998, 0.0)
			target_offset = <target_offset>
			target_bone = <target_bone>
			dampen_start = <head_dampen_start>
			dampen_end = <head_dampen_end>
			dampen_up = <head_up_dampen_end>
			dampen_down = <head_down_dampen_end>
			dampen_left = <head_left_dampen_end>
			dampen_right = <head_right_dampen_end>
			destanglealignvalue = av_headmag_1
			destradialalignvalue = av_headrot_1
			enable_tag = lookat_av
			enable_tag_value = 1
		}
		{
			bone = bone_head
			target = <target>
			bone_offset = (0.081, 0.120000005, 0.0)
			target_offset = <target_offset>
			target_bone = <target_bone>
			eye_down_limit = <eye_down_limit>
			eye_up_limit = <eye_up_limit>
			eye_right_limit = <eye_right_limit>
			eye_left_limit = <eye_left_limit>
			destanglealignvalue = av_eyemag_2
			destradialalignvalue = av_eyerot_2
			enable_tag = lookat_av
			enable_tag_value = 2
		}
		{
			bone = bone_chest
			target = <target>
			bone_offset = (0.30865002, 0.016189998, 0.0)
			target_offset = <target_offset>
			target_bone = <target_bone>
			dampen_start = <head_dampen_start>
			dampen_end = <head_dampen_end>
			dampen_up = <head_up_dampen_end>
			dampen_down = <head_down_dampen_end>
			dampen_left = <head_left_dampen_end>
			dampen_right = <head_right_dampen_end>
			destanglealignvalue = av_headmag_2
			destradialalignvalue = av_headrot_2
			enable_tag = lookat_av
			enable_tag_value = 2
		}
	]
	av_eyemag_1 = 0.0
	av_eyerot_1 = 0.0
	av_eyemag_2 = 0.0
	av_eyerot_2 = 0.0
	camid = somename
	target = somename
	anglealignvalue = 0.0
	radialalignvalue = 0.0
	dampen_factor = 0.0
	blend_duration = 0.0
	head_strength = 0.7
	target_bone = bone
	target_offset = (0.0, 0.0, 0.0)
	part = guitartist
	cam_check = FALSE
endscript

script autolook_kill_spawnscripts 
	vocalist_ids = [
		musician1
		musician2
		musician3
		musician4
	]
	index = 0
	begin
	if CompositeObjectExists Name = (<vocalist_ids> [<index>])
		(<vocalist_ids> [<index>]) :Obj_KillSpawnedScript Name = band_lookat
	endif
	index = (<index> + 1)
	repeat 4
endscript
