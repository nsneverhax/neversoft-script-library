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
	printf \{qs(0x4aac6374)}
endscript

script cas_skeleton_reset 
	printf \{qs(0xc275fdac)}
endscript

script cas_ragdoll_reset 
	printf \{qs(0x85a9d6c1)}
endscript

script cas_process_accessory_part 
	ScriptAssert \{'cas_process_accessory_part: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script cas_merge_in_guitar_ragdoll 
	return
	printf \{'cas_merge_in_guitar_ragdoll'}
	ragdoll_mergeragdoll skeletonname = <Skeleton> ragdollName = gh_rocker_guitar_ragdoll bones = ($cas_drummer_bones)
endscript

script cas_merge_in_drummer_bones 
	printf \{qs(0x4b116f56)}
endscript
