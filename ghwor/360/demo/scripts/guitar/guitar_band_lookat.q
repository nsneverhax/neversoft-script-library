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
		target_bone = none
		target_offset = (0.0, 0.0, 0.0)}
	gamemode_gettype
	switch <type>
		case training
		case practice
		case tutorial
		return \{false}
	endswitch
	band_lookat_on_hub {
		name = <name>
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
	switch <type>
		case training
		case practice
		case tutorial
		return \{false}
	endswitch
	band_lookat_off_hub {
		name = <name>
		blend_duration = <blend_duration>
	}
endscript

script band_lookat_off_hub 
	get_musician_id name = <name>
	musician = <name>
	<musician> :obj_killspawnedscript name = band_lookat
	<musician> :anim_command target = eye_lookat_switch command = partialswitch_setstate params = {off blendduration = <blend_duration>}
	<musician> :anim_command target = db_eye_lookat command = degenerateblend_addbranch params = {
		blendduration = <blend_duration>
		blendcurve = $g_lookat_smooth_transit_curve
		tree = $eye_lookat_off
		params = {
		}
	}
	<musician> :anim_command target = db_head_lookat command = degenerateblend_addbranch params = {
		blendduration = <blend_duration>
		blendcurve = g_lookat_smooth_transit_curve
		tree = $head_lookat_off
		params = {
		}
	}
	musician = musician
	name = musician
	blend_duration = 0.0
endscript

script band_lookat_on_hub 
	changeglobalinteger \{global_name = g_drummer_lookat_control_priority_hijacked
		new_value = 1}
	part = <name>
	get_musician_id name = <name>
	musician = <name>
	if (<target> = camera)
		cam_check = true
	else
		get_musician_id name = <target>
		target = <name>
		cam_check = false
	endif
	<musician> :anim_command {
		target = eye_lookat_type
		command = switchclearbones_setclearanims
		params = {
			sourceclear0 = gh_male_eye_lookat_base_lids
			sourceclear1 = gh_male_eye_lookat_base
		}
	}
	<musician> :obj_killspawnedscript name = band_lookat
	<musician> :obj_spawnscriptnow band_lookat params = {
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
	name = musician
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
		anim_command \{target = eye_lookat_type
			command = switchclearbones_setstate
			params = {
				off
			}}
	else
		anim_command \{target = eye_lookat_type
			command = switchclearbones_setstate
			params = {
				on
			}}
	endif
	anim_command target = eye_lookat_switch command = partialswitch_setstate params = {on blendduration = (<blend_duration> * 0.5)}
	anim_command target = db_eye_lookat command = degenerateblend_addbranch params = {
		blendduration = (<blend_duration> * 0.5)
		blendcurve = g_lookat_smooth_transit_curve
		tree = $<eye_lookat_tree>
		params = {
		}
	}
	anim_command target = db_head_lookat command = degenerateblend_addbranch params = {
		blendduration = <blend_duration>
		blendcurve = g_lookat_smooth_transit_curve
		tree = $<head_lookat_tree>
		params = {
			strength = <head_strength>
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
	cam_check = false
endscript

script band_av_autolook 
	obj_getid
	begin
	lookat_target = true
	settags lookat_target = <lookat_target>
	eye_limit = false
	settags eye_limit = <eye_limit>
	getrandomfloat \{a = 2.0
		b = 10.0}
	z_offset = <random_float>
	getrandomfloat a = (0.0 - (<z_offset> * 0.7)) b = (<z_offset> * 0.7)
	x_offset = <random_float>
	target_offset = ((1.0, 0.0, 0.0) * <x_offset> + (0.0, 0.0, 1.0) * <z_offset>)
	getrandomfloat \{a = 0.3
		b = 2.0}
	waittime = <random_float>
	getrandomfloat \{a = 0.1
		b = 0.4}
	blend_duration = <random_float>
	obj_spawnscriptnow band_lookat_on params = {target = <objid> target_offset = <target_offset> head_strength = 0.0 blend_duration = <blend_duration>}
	begin
	waitonegameframe
	getframelength
	getsingletag \{lookat_target}
	getsingletag \{eye_limit}
	if (<lookat_target> = false)
		break
	else
		waittime = (<waittime> - <frame_length>)
		if (<waittime> < 0.0)
			break
		endif
	endif
	repeat
	repeat
	target = something
endscript

script test_musician_headlookat_camera \{old_angle = 0.0}
	head_dampen_end = 0.9
	head_dampen_start = 0.85
	eye_up_limit = $eye_up_limit
	eye_left_limit = $eye_left_limit
	eye_down_limit = $eye_down_limit
	eye_right_limit = $eye_right_limit
	getcurrentcameraobject
	target = <camid>
	fastgetarraysize \{array = $ganimtreepreviewobjects}
	if (<array_size> > 0)
		x_offset = (0 -200)
		z_offset = 100
		target_offset = ((1.0, 0.0, 0.0) * <x_offset> + (0.0, 0.0, 1.0) * <z_offset>)
		(($ganimtreepreviewobjects) [0].name) :skeleton_getbonealignedpolarvalues bone = bone_head bone_offset = (0.081, 0.120000005, 0.0) target = (($ganimtreepreviewobjects) [0].name) target_offset = <target_offset>
		av_eyemag = <anglealignvalue>
		av_eyerot = <radialalignvalue>
		(($ganimtreepreviewobjects) [0].name) :skeleton_getbonealignedpolarvalues bone = bone_chest bone_offset = (0.30865002, 0.016189998, 0.0) target = (($ganimtreepreviewobjects) [0].name) target_offset = <target_offset>
		av_headmag = <anglealignvalue>
		av_headrot = <radialalignvalue>
		if (<av_eyerot> > 0.5)
			if (<av_eyerot> > 0.75)
				factor = ((<av_eyerot> -0.75) / 0.25)
				multiplier = (1 / ((<eye_down_limit> * (1 - <factor>)) + (<eye_left_limit> * <factor>)))
			else
				factor = ((<av_eyerot> -0.5) / 0.25)
				multiplier = (1 / ((<eye_right_limit> * (1 - <factor>)) + (<eye_down_limit> * <factor>)))
			endif
		else
			if (<av_eyerot> > 0.25)
				factor = ((<av_eyerot> -0.25) / 0.25)
				multiplier = (1 / ((<eye_up_limit> * (1 - <factor>)) + (<eye_right_limit> * <factor>)))
			else
				factor = (<av_eyerot> / 0.25)
				multiplier = (1 / ((<eye_left_limit> * (1 - <factor>)) + (<eye_up_limit> * <factor>)))
			endif
		endif
		if (<av_headmag> > <head_dampen_start>)
			dampen_factor = ((<av_headmag> - <head_dampen_start>) / (1.0 - <head_dampen_start>))
			av_headmag = ((<head_dampen_end> * <dampen_factor>) + (<av_headmag> * (1.0 - <dampen_factor>)))
		endif
		av_eyemag = (<av_eyemag> * <multiplier>)
		if (<av_eyemag> > 1.0)
			av_eyemag = 1.0
		endif
		printf channel = vocal_pitch qs(0x50cbf621) a = <av_eyemag> b = <av_eyerot> c = <angle_delta>
		(($ganimtreepreviewobjects) [0].name) :animpreview_setsourcevalues {
			demo_00 = <av_headmag>
			demo_01 = <av_headrot>
			demo_02 = <av_eyemag>
			demo_03 = <av_eyerot>
		}
		demo_00 = <av_headmag>
		demo_01 = <av_headrot>
		demo_02 = <av_eyemag>
		demo_03 = <av_eyerot>
		angle_delta = (<old_angle> - <anglealignvalue>)
		if (<angle_delta> < 0.0)
			angle_delta = (<angle_delta> * (0.0 -1.0))
		endif
		old_angle = <anglealignvalue>
	endif
	return <...>
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
	if compositeobjectexists name = (<vocalist_ids> [<index>])
		(<vocalist_ids> [<index>]) :obj_killspawnedscript name = band_lookat
	endif
	index = (<index> + 1)
	repeat 4
endscript
