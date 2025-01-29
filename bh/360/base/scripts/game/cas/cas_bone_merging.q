cas_all_merged_skeleton_bones = [
	Bone_ACC_Head_01
	Bone_ACC_Head_02
	Bone_ACC_Head_03
	Bone_ACC_Head_04
	Bone_ACC_Head_05
	Bone_ACC_Head_06
	Bone_ACC_Head_07
	Bone_ACC_Head_08
	Bone_ACC_Head_09
	Bone_ACC_Torso_01
	Bone_ACC_Torso_02
	Bone_ACC_Torso_03
	Bone_ACC_Torso_04
	Bone_ACC_Legs_01
	Bone_ACC_Legs_02
	Bone_ACC_Legs_03
	Bone_ACC_Legs_04
	bone_guitar_body
	BONE_GUITAR_FRET_POS
	BONE_IK_HAND_GUITAR_L
	BONE_IK_HAND_GUITAR_R
	BONE_GUITAR_STRING_1
	Bone_Guitar_String_2
	Bone_Guitar_String_3
	Bone_Guitar_String_4
	Bone_Guitar_String_5
	Bone_Guitar_String_6
	BONE_MIC_STAND
	BONE_MIC_ADJUST_HEIGHT
	Bone_Mic_Adjust_Angle
	Bone_Mic_Microphone
	Bone_IK_Hand_Slave_L
	Bone_IK_Hand_Slave_R
]
cas_all_merged_radgoll_bones = [
	Bone_ACC_Head_01
	Bone_ACC_Head_02
	Bone_ACC_Head_03
	Bone_ACC_Head_04
	Bone_ACC_Head_05
	Bone_ACC_Head_06
	Bone_ACC_Head_07
	Bone_ACC_Head_08
	Bone_ACC_Head_09
	Bone_ACC_Torso_01
	Bone_ACC_Torso_02
	Bone_ACC_Torso_03
	Bone_ACC_Torso_04
	Bone_ACC_Legs_01
	Bone_ACC_Legs_02
	Bone_ACC_Legs_03
	Bone_ACC_Legs_04
]
cas_drummer_bones = [
	bone_guitar_body
	BONE_GUITAR_FRET_POS
	BONE_IK_HAND_GUITAR_L
	BONE_IK_HAND_GUITAR_R
	BONE_GUITAR_STRING_1
	Bone_Guitar_String_2
	Bone_Guitar_String_3
	Bone_Guitar_String_4
	Bone_Guitar_String_5
	Bone_Guitar_String_6
	BONE_MIC_STAND
	BONE_MIC_ADJUST_HEIGHT
	Bone_Mic_Adjust_Angle
	Bone_Mic_Microphone
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
	repeat <array_size>
endscript

script cas_skeleton_reset 
	printf \{'cas_skeleton_reset'}
	if GetSingleTag \{no_bone_work}
		return
	endif
	ExtendCrc <Skeleton> '_original' out = Skeleton
	printf 'Resetting %s' s = <Skeleton>
	Skeleton_MergeSkeleton skeletonName = <Skeleton> bones = $cas_all_merged_skeleton_bones
endscript

script cas_ragdoll_reset 
	printf \{'cas_ragdoll_reset'}
	if GetSingleTag \{no_bone_work}
		return
	endif
	ExtendCrc <Skeleton> '_original' out = Skeleton
	ExtendCrc <Ragdoll> '_original' out = Ragdoll
	printf 'Resetting %r' r = <Ragdoll>
	Ragdoll_MergeRagdoll skeletonName = <Skeleton> RagdollName = <Ragdoll> bones = $cas_all_merged_radgoll_bones
endscript

script cas_process_accessory_part 
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if GotParam \{acc_bones}
		printf 'cas_process_accessory_part %p' p = <desc_id> DoNotResolve
		if GotParam \{acc_skeleton}
			ExtendCrc <acc_skeleton> '.ske' out = acc_skeleton
			Skeleton_MergeSkeleton skeletonName = <acc_skeleton> bones = <acc_bones> AssetContext = cas_temporaries
		else
			ScriptAssert \{'acc_skeleton missing from part!'}
		endif
		if (<do_ragdoll> = 1)
			if GotParam \{acc_ragdoll}
				ExtendCrc <acc_ragdoll> '.rag' out = acc_ragdoll
				Ragdoll_MergeRagdoll skeletonName = <acc_skeleton> RagdollName = <acc_ragdoll> bones = <acc_bones> AssetContext = cas_temporaries
			else
				ScriptAssert \{'acc_ragdoll missing from part. Comment out this assert if it\'s okay to leave out the ragdoll'}
			endif
		endif
	endif
endscript

script cas_merge_in_guitar_ragdoll 
	return
	printf \{'cas_merge_in_guitar_ragdoll'}
	Ragdoll_MergeRagdoll skeletonName = <Skeleton> RagdollName = GH_Rocker_Guitar_Ragdoll bones = ($cas_drummer_bones)
endscript

script cas_merge_in_drummer_bones 
	printf \{'cas_merge_in_drummer_bones'}
	ExtendCrc <Skeleton> '_drummer' out = Skeleton
	printf 'Merging in %s' s = <Skeleton>
	Skeleton_MergeSkeleton skeletonName = <Skeleton> bones = $cas_drummer_bones
endscript
