kickflip_test_anim = 0
debug_skater_anims = 0
NonLocal_Skater_StaticAnimTree = {
	type = constraintbones
	constraintbones = Skater_ConstraintBones
	type = netragdoll
}
Skater_ConstraintBones = [
	{
		type = twistchild
		bone = bone_twist_wrist_l
		target = bone_palm_l
		amount = 0.5
	}
	{
		type = twistchild
		bone = bone_twist_wrist_r
		target = bone_palm_r
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_mid_r
		target = bone_bicep_r
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_mid_l
		target = bone_bicep_l
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_top_r
		target = bone_bicep_r
		amount = 0.9
	}
	{
		type = twist
		bone = bone_twist_bicep_top_l
		target = bone_bicep_l
		amount = 0.9
	}
	{
		type = twist
		bone = bone_twist_thigh_r
		target = bone_thigh_r
		amount = 0.9
	}
	{
		type = twist
		bone = bone_twist_thigh_l
		target = bone_thigh_l
		amount = 0.9
	}
	{
		type = split
		bone = bone_split_knee_r
		target = bone_knee_r
		amount = 0.5
	}
	{
		type = split
		bone = bone_split_knee_l
		target = bone_knee_l
		amount = 0.5
	}
	{
		type = splitr
		bone = bone_split_ass_r
		target = bone_twist_thigh_r
		amount = 0.5
	}
	{
		type = splitr
		bone = bone_split_ass_l
		target = bone_twist_thigh_l
		amount = 0.5
	}
	{
		type = split
		bone = bone_split_elbow_r
		target = bone_forearm_r
		amount = 0.5
	}
	{
		type = split
		bone = bone_split_elbow_l
		target = bone_forearm_l
		amount = 0.5
	}
]
Skater_IK_Params = [
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
Skater_IK_with_hands_Params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
Skater_IK_left_hand_Params = [
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
Skater_IK_right_hand_Params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
Skater_IK_hands_only_Params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
	}
]
blank_animbranch = {
	type = blank
}
Skater_AnimBranch_Standard = {
	type = skaterflip
	[
		{
			type = boardrotate
			[
				{
					type = posecapture
					id = BodyPoseCapture
					[
						{
							id = BodyWalkSpeed
							type = null
							[
								{
									type = my_timer_type
									id = bodytimer
									speed = my_speed
									start = my_start
									end = my_end
									anim = my_anim
									anim_events = on
									[
										{
											type = walkmonitor
											id = BodyMonitor
											[
												{
													id = NoBoardOverlay
													type = overlay
													[
														{
															id = OneFootDifference
															type = differencetoggle
															anim = my_onefoot_anim
															[
																{
																	id = bodysource
																	type = source
																	anim = my_anim
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
	]
}
Skater_AnimBranch_CAS = {
	type = skaterflip
	[
		{
			type = boardrotate
			[
				{
					type = posecapture
					id = BodyPoseCapture
					[
						{
							type = play
							id = bodytimer
							anim = my_anim
							anim_events = on
							[
								{
									type = applydifference
									[
										{
											type = source
											anim = boardanim
										}
										{
											id = bodysource
											type = source
											anim = my_anim
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

script init_skater_anim_tree 
	GetCurrentSkaterHeapId
	formattext checksumname = heap_name 'SkaterHeap%i' i = <heapid>
	mempushcontext <heap_name>
	if NOT gotparam parent
		if islocalskater
			init_local_skater_anim_tree tree = <tree>
		else
			init_nonlocal_skater_anim_tree
		endif
	else
		if <parent> :islocalskater
			init_local_skater_anim_tree tree = <tree>
		else
			init_nonlocal_skater_anim_tree tree = <tree>
		endif
	endif
	mempopcontext <heap_name>
	if gotparam parent
		if <parent> :islocalskater
			blend_in_below_body_ik blendduration = 0.0 strength = 0.0
		endif
	else
		if islocalskater
			blend_in_below_body_ik blendduration = 0.0 strength = 0.0
		endif
	endif
endscript

script static_tree_ik_on \{blendduration = 0.05}
	blend_in_below_body_ik strength = 1.0 blendduration = <blendduration>
endscript

script static_tree_ik_off \{blendduration = 0.05}
	blend_in_below_body_ik strength = 0.0 blendduration = <blendduration>
endscript

script blend_in_below_body_ik \{blendduration = 0.1}
	anim_command {
		target = IK_BelowBodyInTree
		command = ik_setchainstrength
		params = {
			strength = <strength>
			blendduration = <blendduration>
			chain = bone_ik_foot_slave_l
		}
	}
	anim_command {
		target = IK_BelowBodyInTree
		command = ik_setchainstrength
		params = {
			strength = <strength>
			blendduration = <blendduration>
			chain = bone_ik_foot_slave_r
		}
	}
endscript

script init_nonlocal_skater_anim_tree \{tree = $NonLocal_Skater_StaticAnimTree}
	anim_uninittree
	anim_inittree tree = <tree> nodeiddeclaration = [
		netragdoll
	]
endscript

script init_local_skater_anim_tree tree = $Skater_StaticAnimTree
	skeleton_getskeletonname
	appendsuffixtochecksum base = <skeletonname> suffixstring = '_face'
	anim_uninittree
	anim_inittree {
		tree = <tree>
		params = {facefixanim = <appended_id>}
		nodeiddeclaration = [
			SkaterPoseExport
			SkaterCutsceneOverlay
			ik
			IK_Hands
			IK_BelowBodyInTree
			SkaterPartialBody
			SkaterPartialSwitchId
			BodyMonitor
			bodyflip
			bodytimer
			BodyReverse
			body
			bodysource
			BodySource2
			BodyPoseCapture
			BodyWalkSpeed
			NoBoardOverlay
			OneFootDifference
			boardrotate
			nailthetrickboardrotate
			RunningTurnDifference
			LandSource
			LandTimer
			CrouchSource
			CrouchTimer
			BackSource
			ForwardSource
			LeftSource
			LeftTimer
			RightSource
			RightTimer
			SlowSource
			SlowTimer
			FastSource
			FastTimer
			GrindDiff
			TakeoffSource
			ArmApexSource
			SpinSource
			FliptrickTimer
			FliptrickApexTimer
			FliptrickLandTimer
			GrabtrickTimer
			GrabtrickApexTimer
			GrabtrickLandTimer
			grabtrickintimer
			GrabtrickApexInTimer
			GrabtrickLandInTimer
			armtakeofftimer
			foottakeofftimer
			takeofftimer
			ollielandblend
			takeoffblend
			takeoffplay
			ik
			groundlandtimer
			kicktimer
			groundlandswitch
			airtrick_takeoff
			airtrick_apex
			airtrick_land
			airtrick_spin
			olliemod_apex_foot
			olliemod_apex_arm
			olliemod_takeoff_foot
			olliemod_takeoff_arm
			olliemod_takeoff_lr
			olliemod_fake_ground
			groundmod_fake_ground
			olliemod_takeoff_spinlr_vert
			olliemod_takeoff_spinlook_vert
			olliemod_takeoff_spinlr_flat
			olliemod_takeoff_spinlook_flat
			olliemod_apex_spinlr_vert
			olliemod_apex_spinlook_vert
			olliemod_apex_spinlr_flat
			olliemod_apex_spinlook_flat
			olliemod_land_spinlr_vert
			olliemod_land_spinlook_vert
			olliemod_land_spinlr_flat
			olliemod_land_spinlook_flat
			kickmod_onground
			grabmod_spinlr_vert
			grabmod_spinlook_vert
			grabmod_spinlr_flat
			grabmod_spinlook_flat
			grabmod_idle
			ongroundextras
			ongroundextrastimer
			curbsnapextras
			curbsnapextrastimer
			ollieextras
			nail_bail_timer
			ollieextras_takeoff
			ollieextras_apex
			ollieextras_land
			ntt_flick_branch
			ntt_flick_branch_takeoff
			ntt_flick_branch_apex
			ntt_flick_branch_land
			ntg_base_hook
			ntg_grab_hook
			ntg_tweak_hook
			ntg_mini_tweak_hook
			ntg_main_branch_hook
			ntg_idle_hook
			ntg_finger_flip_hook
			ntg_finger_flip_id
			ntg_shake_hook
			ntg_tweak_id
			ntg_grab_id
			ntg_angle_blend
			ntg_land_offset_id
			slopeblend
			olliesidelandings
			landpartialblend
			mod_ground_land
			walkspeed
			startwalktimer
			stopwalktimer
			idle_branch
			switchboard
			SwitchBoardTimer
			inair_takeoff
			inair_apex_cycle
			inair_apex_playonce
			face
			faceidle_timer
			face_timer
			face_source
			manualextras
			manualextratimer
			manualbalancemod
			manualslopemod
			manualfakeslopemod
			manuallandmod
			grindextras
			grindextratimer
			grindrangemod
			invertbalancemod
			kickcatch
			brakecatch
			braketimer
			land_degenerate
			stopped_init
			boardrotate
			TurnLeft
			TurnRight
			climbtimer
			pumpmodup
			OngroundDiffPoseCapture
			hang_diff
		]
	}
endscript

script skater_playanim target = body tree = $Skater_AnimBranch_Standard timer = bodytimer source = bodysource
	if NOT gotparam anim
		scriptassert "Skater_PlayAnim missing anim param"
	endif
	if NOT gotparam not_a_skater
		if gotparam norestart
			if anim_animnodeexists id = <source>
				if anim_command target = <source> command = source_animequals params = {<anim>}
					return
				endif
			endif
		endif
		handlefliporboardrotateafter
	endif
	if gotparam cycle
		timer_type = cycle
	else
		if gotparam wobble
			timer_type = wobble
			SetWobbleDetails <...>
		else
			timer_type = play
		endif
	endif
	if gotparam from
		if (<from> = current)
			SyncToPreviousAnim = 1
		else
			if (<from> = start)
				start = 0
			else
				if (<from> = end)
					start = 1
				else
					if (1 > <from>)
						start = <from>
					else
						printf "skater_playanim received invalid value for param from"
						printstruct <...>
					endif
				endif
			endif
		endif
	endif
	if gotparam to
		if ((<to> < 1) || (<to> = 1))
			end = <to>
		endif
	endif
	if gotparam backwards
		if gotparam speed
			speed = (-1 * <speed>)
		else
			speed = -1
		endif
		if NOT gotparam start
			start = 1
		else
			if NOT gotparam to
				start = 1
			else
				temp = <start>
				start = <to>
				to = <temp>
			endif
		endif
	endif
	if gotparam SyncToPreviousAnim
		anim_command target = <timer> command = timer_getframefactor
		start = <framefactor>
	endif
	if NOT ($kickflip_test_anim = 0)
		if gotparam anim
			if (<anim> = kickflip)
				anim = ($kickflip_test_anim + 0)
			endif
		endif
	endif
	if (<anim> = current)
		anim_command target = bodysource command = source_getanimname
		anim = <animname>
	endif
	if NOT ($debug_skater_anims = 0)
		printf "***************************************"
		printf "Anim ========================= %a" a = <anim>
		printf "***************************************"
	endif
	anim_command {
		not_a_skater = <not_a_skater>
		target = <target>
		command = degenerateblend_addbranch
		params = {
			blendduration = <blendperiod>
			tree = <tree>
			params = {
				my_timer_type = <timer_type>
				my_anim = <anim>
				my_speed = <speed>
				my_start = <start>
				my_end = <end>
				my_turn_anim = <turn_anim>
			}
		}
	}
endscript

script Skater_PlayNoBoardOverlayAnim 
	anim_command target = NoBoardOverlay command = overlay_setanim params = {anim = <anim>}
	anim_command \{target = NoBoardOverlay
		command = overlay_setstate
		params = {
			on
		}}
endscript

script Skater_PlayOneFooterAnim 
	anim_command target = OneFootDifference command = difference_setanim params = {anim = <anim> blend = <blendtime> strength = <strength>}
	anim_command \{target = OneFootDifference
		command = difference_setstate
		params = {
			on
		}}
endscript

script skater_waitanimfinished \{timer = bodytimer}
	if anim_animnodeexists id = <timer>
		anim_command target = <timer> command = timer_wait
	endif
endscript

script Skater_WaitAnim \{timer = bodytimer}
	if anim_animnodeexists id = <timer>
		anim_command target = <timer> command = timer_wait params = {<...>}
	endif
endscript

script Skater_AnimComplete \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{true}
	else
		if anim_command target = <timer> command = timer_isanimcomplete
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script Skater_AnimEquals 
	if NOT anim_animnodeexists \{id = bodysource}
		return \{false}
	else
		if anim_command target = bodysource command = source_animequals params = {<...>}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script Skater_NoBoardOverlayAnimOff 
	if anim_animnodeexists \{id = NoBoardOverlay}
		anim_command \{target = NoBoardOverlay
			command = overlay_setstate
			params = {
				off
			}}
	endif
endscript

script Skater_OneFooterAnimOff 
	if anim_animnodeexists \{id = OneFootDifference}
		anim_command \{target = OneFootDifference
			command = difference_setstate
			params = {
				off
			}}
	endif
endscript

script Skater_RunningTurnAnimOn 
	anim_command \{target = RunningTurnDifference
		command = difference_getstate}
	if (<difference_state> = 1)
		anim_command \{target = RunningTurnDifference
			command = difference_setstate
			params = {
				on
			}}
	endif
endscript

script Skater_RunningTurnAnimOff 
	anim_command \{target = RunningTurnDifference
		command = difference_setstate
		params = {
			off
		}}
endscript

script BlendperiodOut 
	anim_command command = degenerateblend_setnextblendduration params = {<...>}
endscript

script GetCurrentAnimLength \{target = bodytimer}
	if NOT anim_animnodeexists id = <target>
		return \{length = 0.0}
	else
		anim_command target = <target> command = timer_getanimduration
		return length = <duration>
	endif
endscript
skater_pose_store_size = 10
skater_walkinganimspeeds = [
	{
		level = stand
		speed = 0
		forward_cycle_length = 3
		speed_lerp_speed = 10
		forward_anim = WStand
	}
	{
		level = WalkSlow_Lower
		speed = 0.025
		forward_cycle_length = 1.1
		speed_lerp_speed = 10
		forward_anim = walkslow
	}
	{
		level = walkslow
		speed = 0.25
		forward_cycle_length = 1.1
		speed_lerp_speed = 10
		forward_anim = walkslow
	}
	{
		level = WalkFast
		speed = 5.0
		forward_cycle_length = 0.833
		speed_lerp_speed = 10
		forward_anim = WalkFast
	}
	{
		level = Jog
		speed = 8.3
		forward_cycle_length = 0.733
		speed_lerp_speed = 15
		forward_anim = WRun
	}
	{
		level = RunFast
		speed = 13.160001
		forward_cycle_length = 0.5333
		speed_lerp_speed = 15
		forward_anim = fastrun
	}
]
WheelSpin_animbranch = {
	type = add
	[
		{
			type = wheelspeed
			radius = 0.027999999
			decel = 0.0088
			front = true
			[
				{
					type = cycle
					cycle_length = 1.0
					[
						{
							type = bonerotate
							bone = Bone_board_Wheel_Nose
						}
					]
				}
			]
		}
		{
			type = wheelspeed
			radius = 0.027999999
			decel = 0.008
			front = false
			[
				{
					type = cycle
					cycle_length = 1.0
					[
						{
							type = bonerotate
							bone = Bone_board_Wheel_Back
						}
					]
				}
			]
		}
	]
}
WheelSpin_animbranch_old = {
	type = wheelspeed
	radius = 0.027999999
	decel = 0.08
	[
		{
			type = cycle
			anim = sk8_board_wheelrotate_D
			[
				{
					type = source
					anim = sk8_board_wheelrotate_D
				}
			]
		}
	]
}
