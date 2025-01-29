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

endscript

script cas_skeleton_reset 

endscript

script cas_ragdoll_reset 

endscript

script cas_process_accessory_part 
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if GotParam \{acc_bones}

		MemPushContext \{TopDownHeap}
		PushAssetContext
		unpackrawcasasset asset = <acc_skeleton> Type = Skeleton
		PopAssetContext
		MemPopContext
		if GotParam \{acc_skeleton}
			skeleton_mergeskeleton skeletonname = <acc_skeleton> bones = <acc_bones>
		else

		endif
		if (<do_ragdoll> = 1)
			MemPushContext \{TopDownHeap}
			PushAssetContext
			unpackrawcasasset asset = <acc_ragdoll> Type = ragdoll
			PopAssetContext
			MemPopContext
			if GotParam \{acc_ragdoll}
				ragdoll_mergeragdoll skeletonname = <acc_skeleton> ragdollName = <acc_ragdoll> bones = <acc_bones>
			else

			endif
		endif
	endif
endscript

script cas_merge_in_guitar_ragdoll 
	return

	ragdoll_mergeragdoll skeletonname = <Skeleton> ragdollName = gh_rocker_guitar_ragdoll bones = ($cas_drummer_bones)
endscript

script cas_merge_in_drummer_bones 

endscript
