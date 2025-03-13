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
	if getsingletag \{no_bone_work}
		return
	endif
	i = 0
	getarraysize \{$master_editable_list}
	begin
	partname = (($master_editable_list) [<i>].part)
	if structurecontains structure = <appearance> <partname>
		cas_process_accessory_part {part = <partname> desc_id = ((<appearance>.<partname>).desc_id) do_ragdoll = <do_ragdoll>}
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT gotparam \{update_only}
		cleanupunpackedcasassets
	endif
endscript

script cas_skeleton_reset 
	printf \{'cas_skeleton_reset'}
	if getsingletag \{no_bone_work}
		return
	endif
	extendcrc <skeleton> '_original' out = skeleton
	printf 'Resetting %s' s = <skeleton>
	skeleton_mergeskeleton skeletonname = <skeleton> bones = $cas_all_merged_skeleton_bones
endscript

script cas_ragdoll_reset 
	printf \{'cas_ragdoll_reset'}
	if getsingletag \{no_bone_work}
		return
	endif
	extendcrc <skeleton> '_original' out = skeleton
	extendcrc <ragdoll> '_original' out = ragdoll
	printf 'Resetting %r' r = <ragdoll>
	ragdoll_mergeragdoll skeletonname = <skeleton> ragdollname = <ragdoll> bones = $cas_all_merged_radgoll_bones
endscript

script cas_process_accessory_part 
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if gotparam \{acc_bones}
		printf 'cas_process_accessory_part %p' p = <desc_id> donotresolve
		mempushcontext \{topdownheap}
		pushassetcontext
		unpackrawcasasset asset = <acc_skeleton> type = skeleton
		popassetcontext
		mempopcontext
		if gotparam \{acc_skeleton}
			skeleton_mergeskeleton skeletonname = <acc_skeleton> bones = <acc_bones>
		else
			scriptassert \{'acc_skeleton missing from part!'}
		endif
		if (<do_ragdoll> = 1)
			mempushcontext \{topdownheap}
			pushassetcontext
			unpackrawcasasset asset = <acc_ragdoll> type = ragdoll
			popassetcontext
			mempopcontext
			if gotparam \{acc_ragdoll}
				ragdoll_mergeragdoll skeletonname = <acc_skeleton> ragdollname = <acc_ragdoll> bones = <acc_bones>
			else
				scriptassert \{'acc_ragdoll missing from part. Comment out this assert if it\'s okay to leave out the ragdoll'}
			endif
		endif
	endif
endscript

script cas_merge_in_guitar_ragdoll 
	return
	printf \{'cas_merge_in_guitar_ragdoll'}
	ragdoll_mergeragdoll skeletonname = <skeleton> ragdollname = gh_rocker_guitar_ragdoll bones = ($cas_drummer_bones)
endscript

script cas_merge_in_drummer_bones 
	printf \{'cas_merge_in_drummer_bones'}
	extendcrc <skeleton> '_drummer' out = skeleton
	printf 'Merging in %s' s = <skeleton>
	skeleton_mergeskeleton skeletonname = <skeleton> bones = $cas_drummer_bones
endscript
