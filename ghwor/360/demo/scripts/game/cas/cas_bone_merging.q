cas_all_merged_skeleton_bones = [
	bone_acc_head_01
	bone_acc_head_02
	bone_acc_head_03
	bone_acc_head_04
	bone_acc_head_05
	bone_acc_head_06
	bone_acc_head_07
	bone_acc_head_08
	bone_acc_head_09
	bone_acc_torso_01
	bone_acc_torso_02
	bone_acc_torso_03
	bone_acc_torso_04
	bone_acc_legs_01
	bone_acc_legs_02
	bone_acc_legs_03
	bone_acc_legs_04
	bone_guitar_body
	bone_guitar_fret_pos
	bone_ik_hand_guitar_l
	bone_ik_hand_guitar_r
	bone_guitar_string_1
	bone_guitar_string_2
	bone_guitar_string_3
	bone_guitar_string_4
	bone_guitar_string_5
	bone_guitar_string_6
	bone_mic_stand
	bone_mic_adjust_height
	bone_mic_adjust_angle
	bone_mic_microphone
	bone_ik_hand_slave_l
	bone_ik_hand_slave_r
]
cas_all_merged_radgoll_bones = [
	bone_acc_head_01
	bone_acc_head_02
	bone_acc_head_03
	bone_acc_head_04
	bone_acc_head_05
	bone_acc_head_06
	bone_acc_head_07
	bone_acc_head_08
	bone_acc_head_09
	bone_acc_torso_01
	bone_acc_torso_02
	bone_acc_torso_03
	bone_acc_torso_04
	bone_acc_legs_01
	bone_acc_legs_02
	bone_acc_legs_03
	bone_acc_legs_04
]
cas_drummer_bones = [
	bone_guitar_body
	bone_guitar_fret_pos
	bone_ik_hand_guitar_l
	bone_ik_hand_guitar_r
	bone_guitar_string_1
	bone_guitar_string_2
	bone_guitar_string_3
	bone_guitar_string_4
	bone_guitar_string_5
	bone_guitar_string_6
	bone_mic_stand
	bone_mic_adjust_height
	bone_mic_adjust_angle
	bone_mic_microphone
	bone_ik_hand_slave_l
	bone_ik_hand_slave_r
]

script cas_update_accessory_bones \{do_ragdoll = 1}
	scriptassert \{'Disabled for now, go talk to Gavin'}
	return
	i = 0
	getarraysize \{$master_editable_list}
	begin
	partname = (($master_editable_list) [<i>].part)
	if structurecontains structure = <appearance> <partname>
		if NOT structurecontains structure = (<appearance>.<partname>) desc_id
			printstruct <appearance>
			scriptassert 'desc_id missing from %s struct printed just above this assert' s = <partname>
		endif
		cas_process_accessory_part {part = <partname> desc_id = ((<appearance>.<partname>).desc_id) do_ragdoll = <do_ragdoll>}
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script cas_skeleton_reset 
	printf \{'cas_skeleton_reset'}
	scriptassert \{'Disabled for now, go talk to Gavin'}
	return
	extendcrc <skeleton> '_original' out = skeleton
	printf 'Resetting %s' s = <skeleton>
	skeleton_mergeskeleton skeletonname = <skeleton> bones = $cas_all_merged_skeleton_bones
endscript

script cas_ragdoll_reset 
	printf \{'cas_ragdoll_reset'}
	scriptassert \{'Disabled for now, go talk to Gavin'}
	return
	extendcrc <skeleton> '_original' out = skeleton
	extendcrc <ragdoll> '_original' out = ragdoll
	printf 'Resetting %r' r = <ragdoll>
	ragdoll_mergeragdoll skeletonname = <skeleton> ragdollname = <ragdoll> bones = $cas_all_merged_radgoll_bones
endscript

script cas_process_accessory_part 
	scriptassert \{'Disabled for now, go talk to Gavin'}
	return
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if gotparam \{acc_bones}
		printf 'cas_process_accessory_part %p' p = <desc_id> donotresolve
		if gotparam \{acc_skeleton}
			extendcrc <acc_skeleton> '.ske' out = acc_skeleton
			skeleton_mergeskeleton skeletonname = <acc_skeleton> bones = <acc_bones> assetcontext = cas_temporaries
		else
			scriptassert \{'acc_skeleton missing from part!'}
		endif
		if (<do_ragdoll> = 1)
			if gotparam \{acc_ragdoll}
				extendcrc <acc_ragdoll> '.rag' out = acc_ragdoll
				ragdoll_mergeragdoll skeletonname = <acc_skeleton> ragdollname = <acc_ragdoll> bones = <acc_bones> assetcontext = cas_temporaries
			else
				scriptassert \{'acc_ragdoll missing from part. Comment out this assert if it\'s okay to leave out the ragdoll'}
			endif
		endif
	endif
endscript
