
script create_band_member \{Name = GUITARIST
		LightGroup = Band
		async = 0
		animpak = 1}
	create_band_member_wait_for_lock
	printf "Create_Band_Member name=%a............." a = <Name>
	formatText checksumName = bandmember_body_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<Name>) p = ($character_pak_crc_to_text.Body)
	formatText checksumName = bandmember_anim_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<Name>) p = ($character_pak_crc_to_text.anim)
	formatText checksumName = bandmember_instrument_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<Name>) p = ($character_pak_crc_to_text.instrument)
	Pos = (0.0, 0.0, 0.0)
	Dir = (0.0, 0.0, 1.0)
	if GotParam \{start_node}
		if DoesWaypointExist Name = <start_node>
			GetWaypointPos Name = <start_node>
			GetWaypointDir Name = <start_node>
		endif
	endif
	if CompositeObjectExists <Name>
		if GotParam \{UseOldPos}
			<Name> :Obj_GetPosition
			<Name> :Obj_GetOrientation
			Dir = ((1.0, 0.0, 0.0) * <X> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
		endif
		<Name> :Die
	endif
	unload_musician_pak_file desc_id = ($<bandmember_body_pak>) async = <async> Type = Body
	unload_musician_pak_file desc_id = ($<bandmember_anim_pak>) async = <async> Type = anim
	unload_musician_pak_file desc_id = ($<bandmember_instrument_pak>) async = <async> Type = instrument
	Change GlobalName = <bandmember_body_pak> NewValue = no_pak_id
	Change GlobalName = <bandmember_anim_pak> NewValue = no_pak_id
	Change GlobalName = <bandmember_instrument_pak> NewValue = no_pak_id
	if (<Name> = GUITARIST || <Name> = BASSIST)
		startslot = 0
	elseif (<Name> = rhythm || <Name> = vocalist2)
		startslot = 2
	else
		startslot = 3
	endif
	body_asset_context = 0
	if (<Name> = GUITARIST)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :hero_pause_anim
		endif
	elseif (<Name> = BASSIST)
		if CompositeObjectExists \{Name = GUITARIST}
			GUITARIST :hero_pause_anim
		endif
	endif
	if StructureContains structure = <Profile> musician_body
		if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = Body
			create_band_member_unlock
			return \{FALSE}
		endif
		Change GlobalName = <bandmember_body_pak> NewValue = <filename_crc>
		if (<Name> = GUITARIST)
			Change guitarist_asset_context = <AssetContext>
		endif
		body_asset_context = <AssetContext>
		if (<animpak> = 1)
			if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = anim startslot = <startslot>
				create_band_member_unlock
				return \{FALSE}
			endif
			Change GlobalName = <bandmember_anim_pak> NewValue = <filename_crc>
		endif
	endif
	if StructureContains structure = <Profile> musician_instrument
		if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = instrument
			create_band_member_unlock
			return \{FALSE}
		endif
		Change GlobalName = <bandmember_instrument_pak> NewValue = <filename_crc>
	endif
	if (<Name> = GUITARIST)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :hero_unpause_anim
		endif
	elseif (<Name> = BASSIST)
		if CompositeObjectExists \{Name = GUITARIST}
			GUITARIST :hero_unpause_anim
		endif
	endif
	dump_pak_info
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_training
		case z_viewer
		LightGroup = None
		default
		if (<Name> = GUITARIST)
			LightGroup = Alt_Band
		endif
	endswitch
	if ($soundcheck_in_store = 1)
		<LightGroup> = Guitar_Center_Band
	endif
	skeleton_name = (<Profile>.Skeleton)
	ragdoll_name = (<Profile>.ragdoll)
	collision_group = (<Profile>.ragdoll_collision_group)
	if StructureContains structure = <Profile> outfit
		if (<Profile>.outfit = 2)
			skeleton_name = (<Profile>.skeleton2)
			ragdoll_name = (<Profile>.ragdoll2)
			collision_group = (<Profile>.ragdoll_collision_group2)
		endif
	endif
	if StructureContains structure = <Profile> ik_params
		ik_params = (<Profile>.ik_params)
	else
		if (<Name> = singer)
			ik_params = Singer_IK_Params
		elseif (<Name> = drummer)
			ik_params = Drummer_IK_Params
		else
			ik_params = Hero_Ik_params
		endif
	endif
	if StructureContains structure = <Profile> constraint_bones
		constraint_bones = (<Profile>.constraint_bones)
	else
		if (<Name> = singer)
			constraint_bones = singer_constraintbones
		else
			constraint_bones = hero_ConstraintBones
		endif
	endif
	if NOT GotParam \{no_interleave}
		<interleave_animations> = interleave_animations
	endif
	CreateCompositeObject {
		components = [
			{
				component = ragdoll
				initialize_empty = FALSE
				disable_collision_callbacks
				skeletonname = <skeleton_name>
				ragdollName = <ragdoll_name>
				RagdollCollisionGroup = $<collision_group>
			}
			{
				component = SetDisplayMatrix
			}
			{
				component = AnimTree
				animEventTableName = ped_animevents
				<interleave_animations>
			}
			{
				component = Skeleton
				skeletonname = <skeleton_name>
			}
			{
				component = Model
				LightGroup = <LightGroup>
			}
			{
				component = motion
			}
		]
		params = {
			Name = <Name>
			Pos = <Pos>
			AssetContext = <body_asset_context>
			<Profile>
			object_type = bandmember
			profilebudget = 800
		}
	}
	<Name> :Obj_SetOrientation Dir = <Dir>
	<Name> :Obj_InitModelFromProfile struct = <Profile> buildscript = create_ped_model_from_appearance params = {LightGroup = <LightGroup>}
	switch (<Name>)
		case vocalist
		desired_tree = vocalist_static_tree
		case drummer
		desired_tree = drummer_static_tree
		default
		desired_tree = guitarist_static_tree
	endswitch
	<Name> :Anim_InitTree {
		Tree = $<desired_tree>
		animEventTableName = ped_animevents
		NodeIdDeclaration = [
			Base
			Body
			BodyTimer
			StrumTimer
			FretTimer
			FingerTimer
			FacialTimer
			Ik
			Standard_Branch
			Turn_Branch
			LeftArmPartial
			LeftHandPartial
			RightArmPartial
			DrummerLeftArm
			DrummerRightArm
			leftarm_timer
			rightarm_timer
			LeftArm
			LeftHand
			RightArm
			Face
			cymbal1
			cymbal2
			cymbal3
			cymbal4
			CymbalTimer1
			CymbalTimer2
			CymbalTimer3
			CymbalTimer4
			leftfoot
			leftfoot_timer
			rightfoot
			rightfoot_timer
			BodyTwist
			bodytwist_timer
			bodytwist_branch
			arm_branch
			left_arm_branch
			right_arm_branch
			whammy
		]
		params = {
			ik_params = <ik_params>
			constraint_bones = <constraint_bones>
		}
	}
	create_band_member_unlock
	return \{true}
endscript

script preload_band_member \{Name = GUITARIST
		async = 0}
	create_band_member_wait_for_lock
	filename_crc = None
	instrument_crc = None
	create_guitarist_profile <...>
	if (<found> = 1)
		if StructureContains structure = <Profile> musician_instrument
			if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = instrument
				create_band_member_unlock
				return \{FALSE}
			endif
			instrument_crc = <filename_crc>
		endif
		if StructureContains structure = <Profile> musician_body
			if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = Body
				create_band_member_unlock
				return \{FALSE}
			endif
		endif
	endif
	create_band_member_unlock
	return filename_crc = <filename_crc> instrument_crc = <instrument_crc> true
endscript

script preload_band_member_finish \{Name = GUITARIST
		async = 0}
	create_band_member_wait_for_lock
	if NOT (<instrument_crc> = None)
		unload_musician_pak_file desc_id = <instrument_crc> async = <async> Type = instrument
	endif
	if NOT (<filename_crc> = None)
		unload_musician_pak_file desc_id = <filename_crc> async = <async> Type = Body
	endif
	create_band_member_unlock
endscript
create_band_member_lock_queue = 0
create_band_member_lock = 0

script create_band_member_unlock 
	Change \{create_band_member_lock = 0}
endscript

script create_band_member_wait_for_lock 
	begin
	if ($create_band_member_lock_queue = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{create_band_member_lock_queue = 0}
	Change \{create_band_member_lock = 1}
endscript

script destroy_band 
	destroy_band_member \{Name = GUITARIST}
	destroy_band_member \{Name = BASSIST}
	destroy_band_member \{Name = rhythm}
	destroy_band_member \{Name = drummer}
	destroy_band_member \{Name = vocalist}
	destroy_band_member \{Name = vocalist2}
	if GotParam \{unload_paks}
		force_unload_all_character_paks
	endif
endscript

script destroy_band_member 
	if CompositeObjectExists Name = <Name>
		<Name> :Die
		formatText checksumName = bandmember_body_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<Name>) p = ($character_pak_crc_to_text.Body)
		formatText checksumName = bandmember_anim_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<Name>) p = ($character_pak_crc_to_text.anim)
		formatText checksumName = bandmember_instrument_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<Name>) p = ($character_pak_crc_to_text.instrument)
		unload_musician_pak_file desc_id = ($<bandmember_body_pak>) async = <async> Type = Body
		unload_musician_pak_file desc_id = ($<bandmember_anim_pak>) async = <async> Type = anim
		unload_musician_pak_file desc_id = ($<bandmember_instrument_pak>) async = <async> Type = instrument
		Change GlobalName = <bandmember_body_pak> NewValue = no_pak_id
		Change GlobalName = <bandmember_anim_pak> NewValue = no_pak_id
		Change GlobalName = <bandmember_instrument_pak> NewValue = no_pak_id
	endif
endscript

script kill_character_scripts 
	printf \{"kill character scripts......."}
	if CompositeObjectExists \{Name = GUITARIST}
		GUITARIST :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{Name = vocalist}
		vocalist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{Name = drummer}
		drummer :Obj_SwitchScript \{EmptyScript}
	endif
endscript

script EmptyScript 
endscript

script hero_pause_anim 
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			Command = Timer_SetSpeed
			params = {
				speed = 0.0
			}}
	endif
endscript

script hero_unpause_anim 
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			Command = Timer_SetSpeed
			params = {
				speed = 1.0
			}}
	endif
endscript

script hero_play_turn_anim \{BlendDuration = 0.2
		turnBlend = 1.0}
	Anim_Command {
		target = Body
		Command = DegenerateBlend_AddBranch
		params = {
			Tree = $Hero_turning_tree
			BlendDuration = <BlendDuration>
			params = {
				timer_type = Play
				anim_name = <idleAnim>
				second_anim_name = <turnAnim>
				second_anim_blend = <turnBlend>
			}
		}
	}
endscript

script hero_play_blended_anim \{BlendDuration = 0.2
		blend = 1.0}
	if GotParam \{cycle}
		timer_type = cycle
	else
		timer_type = Play
	endif
	Anim_Command {
		target = Body
		Command = DegenerateBlend_AddBranch
		params = {
			Tree = $Hero_turning_tree
			BlendDuration = <BlendDuration>
			params = {
				timer_type = <timer_type>
				anim_name = <first_anim>
				second_anim_name = <second_anim>
				second_anim_blend = <blend>
			}
		}
	}
endscript

script hero_play_strum_anim \{BlendDuration = 0.2}
	if Anim_AnimNodeExists \{id = RightArm}
		Anim_Command {
			target = RightArm
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_strumming_branch
				BlendDuration = <BlendDuration>
				params = {
					strum_name = <anim>
				}
			}
		}
	endif
endscript

script hero_play_fret_anim \{BlendDuration = $fret_blend_time}
	if Anim_AnimNodeExists \{id = LeftArm}
		Anim_Command {
			target = LeftArm
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_fret_branch
				BlendDuration = <BlendDuration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_play_finger_anim \{BlendDuration = 0.2}
	if NOT GotParam \{bend_anim}
		bend_anim = <anim>
	endif
	if Anim_AnimNodeExists \{id = LeftHand}
		Anim_Command {
			target = LeftHand
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_finger_branch
				BlendDuration = <BlendDuration>
				params = {
					finger_anim = <anim>
					finger_bend_anim = <bend_anim>
				}
			}
		}
	endif
endscript

script hero_play_drum_anim \{BlendDuration = $drum_blend_time}
	if Anim_AnimNodeExists \{id = cymbal1}
		Anim_Command {
			target = Body
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_cymbal_branch
				BlendDuration = <BlendDuration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_cymbal_anim \{BlendDuration = $fret_blend_time}
	if Anim_AnimNodeExists \{id = cymbal1}
		Anim_Command {
			target = cymbal1
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_cymbal_branch
				BlendDuration = <BlendDuration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_play_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Anim_Command {
			target = Face
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_face_branch
				BlendDuration = <BlendDuration>
				params = {
					facial_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_wait_until_anim_finished \{Timer = BodyTimer}
	begin
	if hero_anim_complete Timer = <Timer>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script hero_anim_complete \{Timer = BodyTimer}
	if NOT Anim_AnimNodeExists id = <Timer>
		return \{true}
	else
		if Anim_Command target = <Timer> Command = Timer_IsAnimComplete
			return \{true}
		else
			return \{FALSE}
		endif
	endif
endscript

script hero_wait_until_anim_near_end \{Timer = BodyTimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end Timer = <Timer> time_from_end = <time_from_end>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script hero_anim_near_end \{Timer = BodyTimer}
	if NOT Anim_AnimNodeExists id = <Timer>
		return \{true}
	else
		if Anim_Command target = <Timer> Command = Timer_Wait params = {SecondsFromEnd = <time_from_end>}
			return \{true}
		else
			return \{FALSE}
		endif
	endif
endscript

script hero_disable_arms \{blend_time = 0.25}
	if Anim_AnimNodeExists \{id = arm_branch}
		if (<blend_time> = 0.0)
			Anim_Command \{target = arm_branch
				Command = Modulate_SetStrength
				params = {
					Strength = 0.0
					BlendDuration = 2.0
				}}
		else
			Anim_Command {
				target = arm_branch
				Command = Modulate_StartBlend
				params = {
					BlendCurve = [0.0 1.0]
					BlendDuration = <blend_time>
				}
			}
		endif
	endif
	if Anim_AnimNodeExists \{id = Ik}
		Obj_GetID
		if (<objID> = drummer)
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 0.0
					BlendDuration = <blend_time>
					Chain = Bone_IK_Hand_Slave_R
				}
			}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 0.0
					BlendDuration = <blend_time>
					Chain = Bone_IK_Hand_Slave_L
				}
			}
		else
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 0.0
					BlendDuration = <blend_time>
					Chain = Bone_IK_Hand_Guitar_R
				}
			}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 0.0
					BlendDuration = <blend_time>
					Chain = Bone_IK_Hand_Guitar_L
				}
			}
		endif
	endif
endscript

script hero_enable_arms \{blend_time = 0.25}
	if Anim_AnimNodeExists \{id = arm_branch}
		Anim_Command {
			target = arm_branch
			Command = Modulate_StartBlend
			params = {
				BlendCurve = [1.0 0.0]
				BlendDuration = <blend_time>
			}
		}
	endif
	if Anim_AnimNodeExists \{id = Ik}
		Obj_GetID
		if (<objID> = drummer)
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 1.0
					BlendDuration = <blend_time>
					Chain = Bone_IK_Hand_Slave_R
				}
			}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 1.0
					BlendDuration = <blend_time>
					Chain = Bone_IK_Hand_Slave_L
				}
			}
		else
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 1.0
					BlendDuration = <blend_time>
					Chain = Bone_IK_Hand_Guitar_R
				}
			}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 1.0
					BlendDuration = <blend_time>
					Chain = Bone_IK_Hand_Guitar_L
				}
			}
		endif
	endif
endscript

script hero_toggle_arms \{num_arms = 2
		prev_num_arms = 0
		blend_time = 0.25}
	disable_left_arm = FALSE
	enable_left_arm = FALSE
	disable_right_arm = FALSE
	enable_right_arm = FALSE
	if (<num_arms> = 0)
		if (<prev_num_arms> = 1)
			disable_right_arm = true
		elseif (<prev_num_arms> = 2)
			disable_left_arm = true
			disable_right_arm = true
		endif
	elseif (<num_arms> = 1)
		if (<prev_num_arms> = 2)
			disable_right_arm = true
			enable_left_arm = true
		endif
	elseif (<num_arms> = 2)
		if (<prev_num_arms> = 0)
			enable_left_arm = true
			enable_right_arm = true
		elseif (<prev_num_arms> = 1)
			enable_right_arm = true
		endif
	endif
	Obj_GetID
	if (<objID> = drummer)
		left_hand_bone = Bone_IK_Hand_Slave_L
		right_hand_bone = Bone_IK_Hand_Slave_R
	else
		left_hand_bone = Bone_IK_Hand_Guitar_L
		right_hand_bone = Bone_IK_Hand_Guitar_R
	endif
	if (<disable_left_arm> = true)
		printf \{channel = newdebug
			"disable_left_arm is true "}
		if Anim_AnimNodeExists \{id = left_arm_branch}
			if (<blend_time> = 0.0)
				Anim_Command \{target = left_arm_branch
					Command = Modulate_SetStrength
					params = {
						Strength = 0.0
						BlendDuration = 2.0
					}}
			else
				Anim_Command {
					target = left_arm_branch
					Command = Modulate_StartBlend
					params = {
						BlendCurve = [0.0 1.0]
						BlendDuration = <blend_time>
					}
				}
			endif
		else
			printf \{channel = newdebug
				"left_arm_branch doesn't exist......."}
		endif
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 0.0
					BlendDuration = <blend_time>
					Chain = <left_hand_bone>
				}
			}
		else
			printf \{channel = newdebug
				"ik node doesn't exist......."}
		endif
	endif
	if (<disable_right_arm> = true)
		if Anim_AnimNodeExists \{id = right_arm_branch}
			if (<blend_time> = 0.0)
				Anim_Command \{target = right_arm_branch
					Command = Modulate_SetStrength
					params = {
						Strength = 0.0
						BlendDuration = 2.0
					}}
			else
				Anim_Command {
					target = right_arm_branch
					Command = Modulate_StartBlend
					params = {
						BlendCurve = [0.0 1.0]
						BlendDuration = <blend_time>
					}
				}
			endif
		endif
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 0.0
					BlendDuration = <blend_time>
					Chain = <right_hand_bone>
				}
			}
		endif
	endif
	if (<enable_left_arm> = true)
		if Anim_AnimNodeExists \{id = left_arm_branch}
			Anim_Command {
				target = left_arm_branch
				Command = Modulate_StartBlend
				params = {
					BlendCurve = [1.0 0.0]
					BlendDuration = <blend_time>
				}
			}
		endif
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 1.0
					BlendDuration = <blend_time>
					Chain = <left_hand_bone>
				}
			}
		endif
	endif
	if (<enable_right_arm> = true)
		if Anim_AnimNodeExists \{id = right_arm_branch}
			Anim_Command {
				target = right_arm_branch
				Command = Modulate_StartBlend
				params = {
					BlendCurve = [1.0 0.0]
					BlendDuration = <blend_time>
				}
			}
		endif
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 1.0
					BlendDuration = <blend_time>
					Chain = <right_hand_bone>
				}
			}
		endif
	endif
endscript

script drummer_twist 
	if Anim_AnimNodeExists \{id = bodytwist_branch}
		Anim_Command {
			target = bodytwist_branch
			Command = Modulate_SetStrength
			params = {
				Strength = <Strength>
			}
		}
	endif
endscript
generic_static_tree = {
	Type = DegenerateBlend
	id = Body
}
guitarist_static_tree = {
	Type = ConstraintBones
	ConstraintBones = constraint_bones
	[
		{
			Type = ragdoll
			[
				{
					Type = Ik
					two_bone_chains = ik_params
					id = Ik
					[
						{
							Type = PartialSwitch
							state = On
							[
								{
									Type = DegenerateBlend
									id = Face
								}
								{
									Type = ApplyDifference
									id = LeftHandPartial
									[
										{
											$hero_arm_branch
										}
										{
											Type = DegenerateBlend
											id = Body
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
hero_arm_branch = {
	Type = modulate
	Strength = 1.0
	id = arm_branch
	[
		{
			Type = add
			[
				{
					Type = modulate
					Strength = 1.0
					id = left_arm_branch
					[
						{
							Type = add
							[
								{
									Type = DegenerateBlend
									id = LeftArm
								}
								{
									Type = DegenerateBlend
									id = LeftHand
								}
							]
						}
					]
				}
				{
					Type = modulate
					Strength = 1.0
					id = right_arm_branch
					[
						{
							Type = DegenerateBlend
							id = RightArm
						}
					]
				}
			]
		}
	]
}
hero_body_branch = {
	Type = timer_type
	id = BodyTimer
	anim = anim_name
	speed = speed
	anim_events = On
	[
		{
			Type = source_type
			anim = anim_name
		}
	]
}
hero_strumming_branch = {
	Type = Play
	id = StrumTimer
	anim = strum_name
	[
		{
			Type = Source
			anim = strum_name
		}
	]
}
hero_fret_branch = {
	Type = Play
	id = FretTimer
	anim = fret_anim
	[
		{
			Type = Source
			anim = fret_anim
		}
	]
}
hero_finger_branch = {
	Type = whammyblend
	id = whammy
	[
		{
			Type = Play
			id = FingerTimer
			anim = finger_anim
			[
				{
					Type = Source
					anim = finger_anim
				}
			]
		}
		{
			Type = Source
			anim = finger_bend_anim
		}
	]
}
hero_face_branch = {
	Type = Play
	id = FacialTimer
	anim = facial_anim
	[
		{
			Type = Source
			anim = facial_anim
		}
	]
}
hero_drumming_branch = {
	Type = timer_type
	id = timer_id
	anim = anim_name
	speed = speed
	[
		{
			Type = Source
			anim = anim_name
		}
	]
}
drummer_twist_branch = {
	Type = timeonscriptglobal
	id = bodytwist_timer
	anim = anim_name
	script_global = drummer_twist_factor
	[
		{
			Type = Source
			anim = anim_name
		}
	]
}
Hero_turning_tree = {
	Type = timer_type
	id = BodyTimer
	anim = anim_name
	[
		{
			Type = blend
			blend_factor = second_anim_blend
			[
				{
					Type = MotionExtractedSource
					anim = anim_name
				}
				{
					Type = MotionExtractedSource
					anim = second_anim_name
				}
			]
		}
	]
}
vocalist_static_tree = {
	Type = ConstraintBones
	ConstraintBones = constraint_bones
	[
		{
			Type = ragdoll
			[
				{
					Type = Ik
					two_bone_chains = ik_params
					[
						{
							Type = PartialSwitch
							state = On
							[
								{
									Type = DegenerateBlend
									id = Face
								}
								{
									Type = DegenerateBlend
									id = Body
								}
							]
						}
					]
				}
			]
		}
	]
}
drummer_static_tree = {
	Type = ConstraintBones
	ConstraintBones = constraint_bones
	[
		{
			Type = ragdoll
			[
				{
					Type = Ik
					two_bone_chains = ik_params
					id = Ik
					[
						{
							Type = PartialSwitch
							state = On
							[
								{
									$drummer_cymbals_branch
								}
								{
									Type = PartialSwitch
									state = On
									[
										{
											Type = DegenerateBlend
											id = Face
										}
										{
											Type = ApplyDifference
											[
												{
													Type = DegenerateBlend
													id = BodyTwist
												}
												{
													Type = PartialSwitch
													state = On
													[
														{
															Type = modulate
															Strength = 1.0
															id = arm_branch
															[
																{
																	Type = applypartial
																	[
																		{
																			Type = applypartial
																			[
																				{
																					Type = DegenerateBlend
																					id = DrummerLeftArm
																				}
																				{
																					Type = DegenerateBlend
																					id = DrummerRightArm
																				}
																			]
																		}
																		{
																			Type = applypartial
																			[
																				{
																					Type = DegenerateBlend
																					id = leftfoot
																				}
																				{
																					Type = DegenerateBlend
																					id = rightfoot
																				}
																			]
																		}
																	]
																}
															]
														}
														{
															Type = DegenerateBlend
															id = Body
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
hero_cymbal_branch = {
	Type = Play
	id = cymbal_timer_id
	anim = cymbal_anim
	[
		{
			Type = Source
			anim = cymbal_anim
		}
	]
}
drummer_cymbals_branch = {
	Type = applypartial
	[
		{
			Type = applypartial
			[
				{
					Type = DegenerateBlend
					id = cymbal1
				}
				{
					Type = DegenerateBlend
					id = cymbal2
				}
			]
		}
		{
			Type = applypartial
			[
				{
					Type = DegenerateBlend
					id = cymbal3
				}
				{
					Type = DegenerateBlend
					id = cymbal4
				}
			]
		}
	]
}
Hero_Ik_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_L
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
Satan_Ik_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_L
	}
	{
		bone0 = Bone_Knee_L
		bone1 = Bone_Ankle_L
		bone2 = Bone_Toe_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Knee_R
		bone1 = Bone_Ankle_R
		bone2 = Bone_Toe_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
Singer_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
Drummer_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
hero_ConstraintBones = [
	{
		Type = Twistchild
		bone = Bone_Twist_Wrist_L
		target = Bone_Palm_L
		amount = 0.5
	}
	{
		Type = Twistchild
		bone = Bone_Twist_Wrist_R
		target = Bone_Palm_R
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Mid_R
		target = Bone_Bicep_R
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Mid_L
		target = Bone_Bicep_L
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Top_R
		target = Bone_Bicep_R
		amount = 1.0
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Top_L
		target = Bone_Bicep_L
		amount = 1.0
	}
	{
		Type = TWIST
		bone = Bone_Twist_Thigh_R
		target = Bone_Thigh_R
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Thigh_L
		target = Bone_Thigh_L
		amount = 0.5
	}
	{
		Type = Split
		bone = Bone_Split_Knee_R
		target = Bone_Knee_R
		amount = 0.5
	}
	{
		Type = Split
		bone = Bone_Split_Knee_L
		target = Bone_Knee_L
		amount = 0.5
	}
	{
		Type = SplitR
		bone = Bone_Split_Ass_R
		target = Bone_Twist_Thigh_R
		amount = 0.5
	}
	{
		Type = SplitR
		bone = Bone_Split_Ass_L
		target = Bone_Twist_Thigh_L
		amount = 0.5
	}
	{
		Type = Split
		bone = Bone_Split_Elbow_R
		target = Bone_Forearm_R
		amount = 0.5
	}
	{
		Type = Split
		bone = Bone_Split_Elbow_L
		target = Bone_Forearm_L
		amount = 0.5
	}
]
singer_constraintbones = [
	{
		Type = Twistchild
		bone = Bone_Twist_Wrist_L
		target = Bone_Palm_L
		amount = 0.5
	}
	{
		Type = Twistchild
		bone = Bone_Twist_Wrist_R
		target = Bone_Palm_R
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Mid_R
		target = Bone_Bicep_R
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Mid_L
		target = Bone_Bicep_L
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Top_R
		target = Bone_Bicep_R
		amount = 1.0
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Top_L
		target = Bone_Bicep_L
		amount = 1.0
	}
	{
		Type = TWIST
		bone = Bone_Twist_Thigh_R
		target = Bone_Thigh_R
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Thigh_L
		target = Bone_Thigh_L
		amount = 0.5
	}
	{
		Type = Split
		bone = Bone_Split_Knee_R
		target = Bone_Knee_R
		amount = 0.5
	}
	{
		Type = Split
		bone = Bone_Split_Knee_L
		target = Bone_Knee_L
		amount = 0.5
	}
	{
		Type = SplitR
		bone = Bone_Split_Ass_R
		target = Bone_Twist_Thigh_R
		amount = 0.5
	}
	{
		Type = SplitR
		bone = Bone_Split_Ass_L
		target = Bone_Twist_Thigh_L
		amount = 0.5
	}
]
hero_leg_ik_params = [
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
satan_ik_leg_params = [
	{
		bone0 = Bone_Knee_L
		bone1 = Bone_Ankle_L
		bone2 = Bone_Toe_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Knee_R
		bone1 = Bone_Ankle_R
		bone2 = Bone_Toe_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
