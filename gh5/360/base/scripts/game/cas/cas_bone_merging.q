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
	BONE_GUITAR_FRET_POS
	Bone_IK_Hand_Guitar_L
	Bone_IK_Hand_Guitar_R
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
	Bone_IK_Hand_Slave_L
	Bone_IK_Hand_Slave_R
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
	BONE_GUITAR_FRET_POS
	Bone_IK_Hand_Guitar_L
	Bone_IK_Hand_Guitar_R
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
	Bone_IK_Hand_Slave_L
	Bone_IK_Hand_Slave_R
]

script cas_update_accessory_bones \{do_ragdoll = 1}
	if GetSingleTag \{no_bone_work}
		return
	endif
	i = 0
	GetArraySize \{$master_editable_list}
	begin
	partname = (($master_editable_list) [<i>].part)
	if StructureContains structure = <appearance> <partname>
		if NOT StructureContains structure = (<appearance>.<partname>) desc_id
			printstruct <appearance>
			ScriptAssert 'desc_id missing from %s struct printed just above this assert' s = <partname>
		endif
		cas_process_accessory_part {part = <partname> desc_id = ((<appearance>.<partname>).desc_id) do_ragdoll = <do_ragdoll>}
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script cas_skeleton_reset 
	printf \{'cas_skeleton_reset'}
	if GetSingleTag \{no_bone_work}
		return
	endif
	ExtendCrc <Skeleton> '_original' out = Skeleton
	printf 'Resetting %s' s = <Skeleton>
	skeleton_mergeskeleton skeletonname = <Skeleton> bones = $cas_all_merged_skeleton_bones
endscript

script cas_ragdoll_reset 
	printf \{'cas_ragdoll_reset'}
	if GetSingleTag \{no_bone_work}
		return
	endif
	ExtendCrc <Skeleton> '_original' out = Skeleton
	ExtendCrc <ragdoll> '_original' out = ragdoll
	printf 'Resetting %r' r = <ragdoll>
	ragdoll_mergeragdoll skeletonname = <Skeleton> ragdollName = <ragdoll> bones = $cas_all_merged_radgoll_bones
endscript

script cas_process_accessory_part 
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if GotParam \{acc_bones}
		printf 'cas_process_accessory_part %p' p = <desc_id> donotresolve
		if GotParam \{acc_skeleton}
			ExtendCrc <acc_skeleton> '.ske' out = acc_skeleton
			skeleton_mergeskeleton skeletonname = <acc_skeleton> bones = <acc_bones> AssetContext = cas_temporaries
		else
			ScriptAssert \{'acc_skeleton missing from part!'}
		endif
		if (<do_ragdoll> = 1)
			if GotParam \{acc_ragdoll}
				ExtendCrc <acc_ragdoll> '.rag' out = acc_ragdoll
				ragdoll_mergeragdoll skeletonname = <acc_skeleton> ragdollName = <acc_ragdoll> bones = <acc_bones> AssetContext = cas_temporaries
			else
				ScriptAssert \{'acc_ragdoll missing from part. Comment out this assert if it\'s okay to leave out the ragdoll'}
			endif
		endif
	endif
endscript

script cas_merge_in_guitar_ragdoll 
	return
	printf \{'cas_merge_in_guitar_ragdoll'}
	ragdoll_mergeragdoll skeletonname = <Skeleton> ragdollName = gh_rocker_guitar_ragdoll bones = ($cas_drummer_bones)
endscript

script cas_merge_in_drummer_bones 
	printf \{'cas_merge_in_drummer_bones'}
	ExtendCrc <Skeleton> '_drummer' out = Skeleton
	printf 'Merging in %s' s = <Skeleton>
	skeleton_mergeskeleton skeletonname = <Skeleton> bones = $cas_drummer_bones
endscript
