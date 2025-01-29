nondrummer_anim_node_ids = [
	Body
	BodyTimer
	moment_blend
	moment_branch
	momenttimer
	StrumTimer
	FretTimer
	FingerTimer
	FacialTimer
	Ik
	LeftHandPartial
	LeftArm
	LeftHand
	RightArm
	Face
	strum_anim_mod
	fret_anim_mod
	chord_anim_mod
	chordhandnode
	strumhandnode
	low_chord
	med_chord
	high_chord
	maleanimadjust
	maleanimadjust_moment
	tweakbonesnode
	mirrornode
	femalediff
	vocal_face_mod
	lipflap
	heel
	enable_new_strum
	dynamic_strums
	righthandpartial
	dynamic_strum_base
	dynamic_strum_roll_high
	dynamic_strum_roll_mid
	dynamic_strum_roll_low
]
drummer_anim_node_ids = [
	Body
	BodyTimer
	FacialTimer
	Ik
	LeftArmPartial
	LeftHandPartial
	RightArmPartial
	LeftArm
	LeftHand
	RightArm
	Face
	femalediff
	drumkit
	kick
	snare
	tom1
	tom2
	crash1
	crash2
	hihat
	moment_branch
	moment_blend
	moment_timer
	faceoff_blend
	faceoff_branch
	faceoff_timer
	tweakbonesnode
	mirrornode
	drumtimer
	drumtimerright
	drumtimerleft
	heel
]
guitarist_appearance = {
}
bassist_appearance = {
}
vocalist_appearance = {
}
drummer_appearance = {
}

script get_anim_struct_member 
	if ($freestyle_active = 1)
		return \{FALSE}
	endif
	if GotParam \{loading_into_song}
		if songfilemanager func = has_perf_file song_name = <loading_into_song>
			get_song_prefix song = <loading_into_song>
			ExtendCrc <anim_struct> '_' out = song_anim_struct_name
			ExtendCrc <song_anim_struct_name> <song_prefix> out = song_anim_struct_name
			if songfilemanager func = get_song_anim_struct song_name = <loading_into_song> anim_struct_name = <song_anim_struct_name>
				if StructureContains structure = <song_anim_struct> <member>
					printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct_name> donotresolve
					printstruct <...>
					return true anim_struct_member = (<song_anim_struct>.<member>)
				elseif (<member> = bass)
					printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
					if StructureContains structure = <song_anim_struct> guitar
						printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct_name> donotresolve
						return true anim_struct_member = (<song_anim_struct>.guitar)
					endif
				endif
			endif
		endif
	endif
	if GlobalExists Name = <anim_struct> Type = structure
		if StructureContains structure = ($<anim_struct>) <member>
			printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = bass)
			printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
			if StructureContains structure = ($<anim_struct>) guitar
				printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif
	printf 'get_anim_struct_member - Failed! : %s' s = <anim_struct> donotresolve
	printstruct <...>
	return \{FALSE}
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

script hero_enable_mirroring 
	if Anim_AnimNodeExists \{id = mirrornode}
		Anim_Command \{target = mirrornode
			Command = mirror_setstate
			params = {
				On
			}}
	endif
endscript

script hero_disable_mirroring 
	if Anim_AnimNodeExists \{id = mirrornode}
		Anim_Command \{target = mirrornode
			Command = mirror_setstate
			params = {
				OFF
			}}
	endif
endscript

script band_play_strum_anim 
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_strum_anim anim = <anim>
	endif
endscript

script band_play_fret_anim 
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_fret_anim anim = <anim>
	endif
endscript

script band_play_finger_anim 
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_finger_anim anim = <anim>
	endif
endscript

script hero_play_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Obj_GetID
		formatText checksumName = animdebug_checksum '%s' s = ($debug_animdebug)
		if (($debug_camanimdebug) = 0)
			if (<objID> = <animdebug_checksum>)
				y = 8
				if (debug_animdebug = 'vocalist' || debug_animdebug = 'drummer')
					<y> = 5
				endif
				printdebugtext X = 0 y = <y> str = qs(0x42fe08d6)
				printdebugtext X = 2 y = <y> str = qs(0x10839713)
				printdebugtext X = 32 y = <y> str = <anim>
			endif
		endif
		Obj_GetID
		if ((<objID> = vocalist) || (<objID> = vocalist2))
			Tree = $vocalist_face_branch
		else
			Tree = $hero_face_branch
		endif
		Anim_Command {
			target = Face
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = <Tree>
				BlendDuration = <BlendDuration>
				params = {
					facial_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_clear_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Anim_Command {
			target = Face
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_empty_branch
				BlendDuration = <BlendDuration>
			}
		}
	endif
endscript

script hero_add_clothing_difference_anim 
	if NOT GotParam \{anim}
		return
	endif
	Anim_Command target = heel Command = applyheeldifference_setanim params = {anim = <anim>}
endscript

script hero_wait_until_anim_finished \{Timer = BodyTimer}
	begin
	if hero_anim_complete Timer = <Timer>
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script hero_wait_until_anim_near_end \{Timer = BodyTimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end Timer = <Timer> time_from_end = <time_from_end>
		break
	endif
	WaitOneGameFrame
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

script hero_disable_arms \{blend_time = 0.0}
	Obj_GetID
	band_setikchain Name = <objID> Chain = slave
endscript

script hero_enable_arms \{blend_time = 0.0}
	Obj_GetID
	band_setikchain Name = <objID> Chain = guitar
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
	if Anim_AnimNodeExists \{id = Ik}
		if Anim_Command \{target = Ik
				Command = ik_haschain
				params = {
					Chain = Bone_IK_Hand_Slave_L
				}}
			left_hand_bone = Bone_IK_Hand_Slave_L
			right_hand_bone = Bone_IK_Hand_Slave_R
		elseif Anim_Command \{target = Ik
				Command = ik_haschain
				params = {
					Chain = Bone_IK_Hand_Guitar_L
				}}
			left_hand_bone = Bone_IK_Hand_Guitar_L
			right_hand_bone = Bone_IK_Hand_Guitar_R
		else
			ScriptAssert \{'No valid IK chain to work with'}
		endif
	endif
	if (<disable_left_arm> = true)
		printf \{channel = newdebug
			qs(0xf9e6434b)}
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
				qs(0x3e3968e0)}
		endif
	endif
	if (<disable_right_arm> = true)
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

script killanim 
	obj_killallspawnedscripts
	Skeleton_GetSkeletonName
	ExtendCrc <skeletonname> '_default' out = anim
	hero_play_anim anim = <anim> BlendDuration = 0.0
endscript

script handle_moment_anim_blending 
	Obj_GetID
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			On
			BlendDuration = 0.0
		}}
	Anim_Command \{target = BodyTimer
		Command = tempomatch_pause}
	stop_loop_cameras Name = <objID>
	Anim_Command \{target = momenttimer
		Command = Timer_WaitAnimComplete}
	end_moment_anim
endscript

script end_moment_anim 
	Obj_GetID
	Obj_KillSpawnedScript \{Name = handle_drummer_moment_anim_blending}
	if Anim_AnimNodeExists \{id = moment_blend}
		Anim_Command \{target = moment_blend
			Command = partialswitch_setstate
			params = {
				OFF
				BlendDuration = 0.0
			}}
		Anim_Command \{target = moment_branch
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_empty_branch
				BlendDuration = 0.0
			}}
	endif
	Anim_Command \{target = BodyTimer
		Command = tempomatch_unpause}
	start_loop_cameras Name = <objID>
	ExtendCrc <objID> '_Info' out = info_struct
	part = ($<info_struct>.part)
	if (<part> = guitar || <part> = bass)
		band_setikchain Name = <objID> Chain = guitar
	else
		band_setikchain Name = <objID> Chain = slave
	endif
	GetSingleTag \{frontend_character}
	if (<frontend_character> = 0)
		band_movetostartnode Name = <objID>
	endif
endscript

script stop_loop_cameras 
	ExtendCrc <Name> '_mocap_lock_target_01' out = camera1
	if CompositeObjectExists Name = <camera1>
		if <camera1> :Anim_AnimNodeExists id = BodyTimer
			<camera1> :Anim_Command target = BodyTimer Command = tempomatch_pause
		endif
	endif
	ExtendCrc <Name> '_mocap_lock_target_02' out = camera2
	if CompositeObjectExists Name = <camera2>
		if <camera2> :Anim_AnimNodeExists id = BodyTimer
			<camera2> :Anim_Command target = BodyTimer Command = tempomatch_pause
		endif
	endif
endscript

script start_loop_cameras 
	ExtendCrc <Name> '_mocap_lock_target_01' out = camera1
	if CompositeObjectExists Name = <camera1>
		if <camera1> :Anim_AnimNodeExists id = BodyTimer
			<camera1> :Anim_Command target = BodyTimer Command = tempomatch_unpause
		endif
	endif
	ExtendCrc <Name> '_mocap_lock_target_02' out = camera2
	if CompositeObjectExists Name = <camera2>
		if <camera2> :Anim_AnimNodeExists id = BodyTimer
			<camera2> :Anim_Command target = BodyTimer Command = tempomatch_unpause
		endif
	endif
endscript

script set_timer_node_speed 
endscript

script handle_drummer_moment_anim_blending 
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			On
			BlendDuration = 0.1
		}}
	Anim_Command \{target = moment_timer
		Command = Timer_WaitAnimComplete}
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			OFF
			BlendDuration = 0.1
		}}
endscript

script end_drummer_moment_anim 
	Obj_KillSpawnedScript \{Name = handle_drummer_moment_anim_blending}
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			OFF
			BlendDuration = 0.1
		}}
endscript

script drummer_faceoff_rest 
	anim = drum_hth_loop_notempo
	Anim_Command {
		target = faceoff_branch
		Command = DegenerateBlend_AddBranch
		params = {
			Tree = $faceoff_drummer_notempo
			BlendDuration = 0.0
			params = {
				anim = <anim>
			}
		}
	}
	Anim_Command \{target = faceoff_blend
		Command = partialswitch_setstate
		params = {
			On
			BlendDuration = 0.3
		}}
endscript

script drummer_faceoff_play 
	Anim_Command \{target = faceoff_blend
		Command = partialswitch_setstate
		params = {
			OFF
			BlendDuration = 0.3
		}}
endscript
faceoff_drummer_notempo = {
	Type = cycle
	id = faceoff_timer
	anim = anim
	[
		{
			Type = Source
			anim = anim
		}
	]
}

script hide_mic 
	SwitchOffAtomic \{cas_mic}
	SwitchOffAtomic \{cas_mic_stand}
endscript

script show_mic 
	SwitchOnAtomic \{cas_mic}
	SwitchOnAtomic \{cas_mic_stand}
endscript

script hide_mic_stand 
	SwitchOffAtomic \{cas_mic_stand}
endscript

script show_mic_stand 
	SwitchOnAtomic \{cas_mic_stand}
endscript

script hide_mic_microphone 
	SwitchOffAtomic \{cas_mic}
endscript

script show_mic_microphone 
	SwitchOnAtomic \{cas_mic}
endscript

script hide_drumkit 
	SwitchOffAtomic \{cas_drums}
endscript

script show_drumkit 
	SwitchOnAtomic \{cas_drums}
endscript

script vocalist_facial_animations_start \{blendtime = 0.3}
	Anim_Command target = vocal_face_mod Command = Modulate_StartBlend params = {blendtime = <blendtime> BlendCurve = [1 0]}
endscript

script vocalist_facial_animations_stop \{blendtime = 0.3}
	Anim_Command target = vocal_face_mod Command = Modulate_StartBlend params = {blendtime = <blendtime> BlendCurve = [0 1]}
endscript
mii_guitarist_static_tree = {
	Type = Ik
	two_bone_chains = ik_params
	id = Ik
	[
		{
			Type = addn
			[
				{
					Type = DegenerateBlend
					id = LeftArm
				}
				{
					Type = DegenerateBlend
					id = RightArm
				}
				{
					Type = DegenerateBlend
					id = Body
				}
			]
		}
	]
}
mii_crowd_static_tree = {
	Type = addn
	[
		{
			Type = DegenerateBlend
			id = LeftArm
		}
		{
			Type = DegenerateBlend
			id = RightArm
		}
		{
			Type = DegenerateBlend
			id = Body
		}
	]
}
mii_guitarist_play_hand_branch = {
	Type = Play
	id = StrumTimer
	anim = hand_anim
	[
		{
			Type = Source
			anim = hand_anim
		}
	]
}
mii_drummer_static_tree = {
	Type = addn
	[
		{
			Type = DegenerateBlend
			id = Body
		}
		{
			Type = DegenerateBlend
			id = tom1
		}
		{
			Type = DegenerateBlend
			id = tom2
		}
		{
			Type = DegenerateBlend
			id = crash1
		}
		{
			Type = DegenerateBlend
			id = crash2
		}
		{
			Type = DegenerateBlend
			id = kick
		}
		{
			Type = DegenerateBlend
			id = snare
		}
		{
			Type = DegenerateBlend
			id = hihat
		}
		{
			Type = DegenerateBlend
			id = RightArmPartial
		}
		{
			Type = DegenerateBlend
			id = LeftArmPartial
		}
	]
}
mii_drummer_play_drum_branch_none = {
	Type = Play
	id = drumtimer
	anim = drum_anim
	[
		{
			Type = Source
			anim = drum_anim
		}
	]
}
mii_drummer_play_drum_branch_left = {
	Type = Play
	id = drumtimerleft
	anim = drum_anim
	[
		{
			Type = Source
			anim = drum_anim
		}
	]
}
mii_drummer_play_drum_branch_right = {
	Type = Play
	id = drumtimerright
	anim = drum_anim
	[
		{
			Type = Source
			anim = drum_anim
		}
	]
}
generic_static_tree = {
	Type = DegenerateBlend
	id = Body
}
guitarist_static_tree = {
	Type = applyheeldifference
	id = heel
	[
		{
			Type = Ik
			two_bone_chains = ik_params
			id = Ik
			[
				{
					Type = chordhand
					id = chordhandnode
					min_twist = 17.62
					max_twist = 145.40999
					min_roll = -7.3700004
					max_roll = 169.1
					hand_bone = BONE_GUITAR_FRET_POS
					elbow_bone = elbow_bone_chord
					negate_rolls = negate_rolls
					[
						{
							Type = Ik
							two_bone_chains = hero_ik_hand_l_params
							[
								{
									Type = tweakbones
									id = tweakbonesnode
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
															Type = chordhand
															id = strumhandnode
															min_twist = 40.0
															max_twist = 150.0
															min_roll = -0.0
															max_roll = 65.0
															hand_bone = bone_guitar_body
															elbow_bone = elbow_bone_strum
															enable_debug_output = FALSE
															[
																{
																	Type = Ik
																	two_bone_chains = hero_ik_hand_r_params
																	[
																		{
																			Type = applypartial
																			id = righthandpartial
																			Strength = 1.0
																			[
																				{
																					Type = DegenerateBlend
																					id = dynamic_strum_base
																				}
																				{
																					Type = switch
																					state = OFF
																					id = moment_blend
																					[
																						{
																							Type = applyfemaledifference
																							id = maleanimadjust_moment
																							anim = gh_rocker_female_guitarraise_d
																							[
																								{
																									Type = DegenerateBlend
																									id = moment_branch
																								}
																							]
																						}
																						{
																							Type = applyfemaledifference
																							id = maleanimadjust
																							anim = gh_rocker_female_guitarraise_d
																							[
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
																{
																	Type = DegenerateBlend
																	id = dynamic_strum_roll_high
																}
																{
																	Type = DegenerateBlend
																	id = dynamic_strum_roll_mid
																}
																{
																	Type = DegenerateBlend
																	id = dynamic_strum_roll_low
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
						{
							Type = DegenerateBlend
							id = low_chord
						}
						{
							Type = DegenerateBlend
							id = med_chord
						}
						{
							Type = DegenerateBlend
							id = high_chord
						}
					]
				}
			]
		}
	]
}
frontend_static_tree = {
	Type = applyheeldifference
	id = heel
	[
		{
			Type = Ik
			two_bone_chains = ik_params
			id = Ik
			[
				{
					Type = applyfemaledifference
					id = maleanimadjust
					anim = gh_rocker_female_guitarraise_d
					[
						{
							Type = tweakbones
							id = tweakbonesnode
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
													Type = PartialSwitch
													state = OFF
													id = moment_blend
													[
														{
															Type = DegenerateBlend
															id = moment_branch
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
hero_arm_branch = {
	Type = add
	[
		{
			Type = modulate
			Strength = 1.0
			id = fret_anim_mod
			[
				{
					Type = DegenerateBlend
					id = LeftArm
				}
			]
		}
		{
			Type = modulate
			Strength = 1.0
			id = strum_anim_mod
			[
				{
					Type = DegenerateBlend
					id = dynamic_strums
				}
			]
		}
	]
}
dynamic_strum_source = {
	Type = Source
	anim = anim
}
dynamic_strum_branch = {
	Type = add
	[
		{
			Type = Play
			start = startanim
			[
				{
					Type = Source
					anim = strumanim
				}
			]
		}
		{
			Type = Source
			anim = baseanim
		}
	]
}
dynamic_strum_idle_branch = {
	Type = add
	[
		{
			Type = cycle
			start = startanim
			[
				{
					Type = Source
					anim = strumanim
				}
			]
		}
		{
			Type = Source
			anim = baseanim
		}
	]
}
hero_body_branch = {
	Type = timer_type
	id = BodyTimer
	anim = anim_name
	speed = speed
	start = start
	end = end
	tempo_anim = tempo_anim
	min_time_factor = min_time_factor
	max_time_factor = max_time_factor
	allow_beat_skipping = allow_beat_skipping
	allow_tempo_override = allow_tempo_override
	anim_events = On
	[
		{
			Type = source_type
			anim = anim_name
		}
	]
}
hero_moment_branch = {
	Type = timer_type
	id = momenttimer
	anim = anim_name
	speed = speed
	start = start
	end = end
	tempo_anim = tempo_anim
	min_time_factor = min_time_factor
	max_time_factor = max_time_factor
	allow_beat_skipping = allow_beat_skipping
	allow_tempo_override = allow_tempo_override
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
vocalist_face_branch = {
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
hero_play_branch = {
	Type = Play
	id = timer_id
	anim = anim_name
	[
		{
			Type = Source
			anim = anim_name
		}
	]
}
hero_cycle_branch = {
	Type = cycle
	id = timer_id
	anim = anim_name
	[
		{
			Type = Source
			anim = anim_name
		}
	]
}
hero_empty_branch = {
	Type = Blank
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
vocalist_static_tree = {
	Type = Ik
	two_bone_chains = singer_ik_params_arms
	id = Ik
	[
		{
			Type = applyheeldifference
			id = heel
			[
				{
					Type = Ik
					two_bone_chains = singer_ik_params_legs
					id = Ik
					[
						{
							Type = tweakbones
							id = tweakbonesnode
							[
								{
									Type = PartialSwitch
									state = On
									[
										{
											Type = modulate
											id = vocal_face_mod
											Strength = 1
											[
												{
													Type = DegenerateBlend
													id = Face
												}
											]
										}
										{
											Type = switch
											state = OFF
											id = moment_blend
											[
												{
													Type = DegenerateBlend
													id = moment_branch
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
drummer_static_tree = {
	Type = ApplyDifference
	[
		{
			Type = DegenerateBlend
			id = heel
		}
		{
			Type = Ik
			two_bone_chains = Drummer_IK_Params
			id = Ik
			[
				{
					Type = ApplyDifference
					[
						{
							Type = modulate
							id = femalediff
							Strength = 0.0
							[
								{
									Type = Source
									anim = gh_rocker_female_drummer_d
								}
							]
						}
						{
							Type = tweakbones
							id = tweakbonesnode
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
											Type = PartialSwitch
											state = OFF
											id = faceoff_blend
											[
												{
													Type = DegenerateBlend
													id = faceoff_branch
												}
												{
													Type = applydrumkitdifference
													id = drumkit
													drum_kit_channel_list = $drum_kit_channel_list
													[
														{
															Type = PartialSwitch
															state = OFF
															id = moment_blend
															[
																{
																	Type = DegenerateBlend
																	id = moment_branch
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
	]
}
new_drummer_static_tree = {
	Type = tweakbones
	id = tweakbonesnode
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
					Type = switch
					state = OFF
					id = moment_blend
					[
						{
							Type = Ik
							two_bone_chains = Drummer_IK_Params
							id = Ik
							[
								{
									Type = applyheeldifference
									id = heel
									[
										{
											Type = applyfemaledrummerdifference
											id = femalediff
											[
												{
													Type = DegenerateBlend
													id = moment_branch
												}
											]
										}
									]
								}
							]
						}
						{
							$drumdroid_tree
						}
					]
				}
			]
		}
	]
}
drummer_moment_branch = {
	Type = timer_type
	id = moment_timer
	anim = anim_name
	speed = speed
	start = start
	end = end
	skip_beats = skip_beats
	tempo_anim = tempo_anim
	anim_events = On
	[
		{
			Type = source_type
			anim = anim_name
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
hero_simple_source = {
	Type = Play
	anim = anim
	[
		{
			Type = Source
			anim = anim
		}
	]
}
hero_source_only = {
	Type = Source
	anim = anim
}
drum_kit_channel_list = [
	{
		Name = tom_1
		bones = [
			bone_mic_adjust_height
		]
	}
	{
		Name = tom_2
		bones = [
			bone_mic_adjust_angle
		]
	}
	{
		Name = snare
		bones = [
			control_root
		]
	}
	{
		Name = cymbal_hh
		bones = [
			bone_guitar_string_3
		]
	}
	{
		Name = cymbal_1
		bones = [
			Bone_IK_Hand_Guitar_L
		]
	}
	{
		Name = cymbal_2
		bones = [
			Bone_IK_Hand_Guitar_R
		]
	}
	{
		Name = cymbal_3
		bones = [
			bone_guitar_string_1
		]
	}
	{
		Name = kick
		bones = [
			Bone_Thigh_R
			bone_mic_microphone
			bone_mic_adjust_height
			bone_mic_adjust_angle
			Bone_IK_Foot_Slave_R
		]
	}
]
empty_ik_params = [
]
car_ik_params = [
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
		HingeAxis = (0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
hero_ik_hand_r_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
		newTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
]
hero_ik_hand_l_params = [
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_L
		newTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
]
Hero_Ik_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
		newTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_L
		newTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
mii_ik_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_L
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
		stretch = 1.0
	}
]
singer_ik_params_arms = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
]
singer_ik_params_legs = [
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
drummer_ik_feet_params = [
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
drummer_ik_hand_r_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
]
drummer_ik_hand_l_params = [
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
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
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.447, 0.0, 0.894)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.3511, 0.0, 0.9362999)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]

script ps2_get_musician_context_data 
	if NOT GotParam \{Name}
		asset_heap = heap_musician1
		bandmember_appearance = guitarist_appearance
		asset_slot_num = 0
		Name = musician1
		return <...>
	endif
	switch (<Name>)
		case musician1
		asset_heap = heap_musician1
		bandmember_appearance = vocalist_appearance
		asset_slot_num = 0
		return <...>
		case musician2
		asset_heap = heap_musician2
		bandmember_appearance = drummer_appearance
		asset_slot_num = 1
		return <...>
		case musician3
		asset_heap = heap_musician3
		bandmember_appearance = guitarist_appearance
		asset_slot_num = 2
		return <...>
		case musician4
		asset_heap = heap_musician4
		bandmember_appearance = bassist_appearance
		asset_slot_num = 3
		return <...>
		default
		printscriptinfo \{qs(0xb9f0efaf)}
		ScriptAssert qs(0x654293d1) n = <Name>
		asset_heap = heap_musician1
		bandmember_appearance = guitarist_appearance
		asset_slot_num = 0
	endswitch
	return <...>
endscript
anim_debug_targets = [
	Camera
	Face
	LeftArm
	LeftHand
	RightArm
	moment_branch
	Body
	lastbody
]
anim_debug_targets_strings = [
	'Camera'
	'Face'
	'LeftArm'
	'LeftHand'
	'RightArm'
	'Moment_Branch'
	'Body'
	'LastBody'
]
anim_debug_target = None

script set_new_anim_debug_target \{target = None}
	if ($anim_debug_target != None)
		DestroyScreenElement \{id = anim_debug_container}
		($anim_debug_target) :Obj_KillSpawnedScript Name = anim_debug_poller
	endif
	Change \{debug_lastbodyanim = None}
	Change anim_debug_target = <target>
	if (<target> != None)
		anim_debug_pak_toggle \{load}
		CreateScreenElement \{id = anim_debug_container
			parent = root_window
			Type = menuelement
			dims = (1024.0, 700.0)
			Pos = (0.0, -20.0)
			pos_anchor = [
				center
				bottom
			]
			just = [
				center
				bottom
			]
			internal_just = [
				center
				bottom
			]
			isvertical = true
			position_children = true
			fit_major = `fit	content	if	larger`
			fit_minor = `keep	dims`
			spacing_between = 0
			z_priority = 500000}
		GetArraySize ($anim_debug_targets)
		begin
		CreateScreenElement \{Type = TextBlockElement
			font = fontgrid_text_a1
			text = qs(0x00000000)
			just = [
				center
				center
			]
			dims = (1000.0, 30.0)
			parent = anim_debug_container
			internal_scale = (0.5, 0.5)
			rgba = [
				255
				255
				255
				255
			]
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = `per	axis`
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]}
		repeat (<array_Size> + 1)
		<target> :obj_spawnscript anim_debug_poller
	else
		anim_debug_pak_toggle \{unload}
	endif
endscript
debug_last_camera_struct = {
	None
}
debug_lastbodyanim_display = None
debug_lastbodyanim = None

script anim_debug_pak_toggle 
	if NOT GlobalExists \{Name = debug_anim_name_struct
			Type = structure}
		if GotParam \{load}
			LoadPakAsync \{pak_name = 'pak/anims/debug_anim_struct.pak'
				Heap = BottomUpHeap
				async = 0}
		endif
	else
		if GotParam \{unload}
			UnloadPakAsync \{pak_name = 'pak/anims/debug_anim_struct.pak'
				Heap = BottomUpHeap
				async = 0}
		endif
	endif
endscript

script anim_debug_poller 
	begin
	ResolveScreenElementID \{id = {
			anim_debug_container
			child = 0
		}
		param = TextElement}
	<AnimName> = qs(0xae01dcbe)
	<lock_to> = None
	<cam_struct> = ($debug_last_camera_struct)
	if StructureContains structure = <cam_struct> LockToBone
		if (((<cam_struct>).LockToBone) = bone_camera)
			if StructureContains structure = (<cam_struct>) LockTo
				<lock_to> = ((<cam_struct>).LockTo)
			endif
		endif
	endif
	RemoveParameter \{duration_string}
	<timestr> = qs(0x00000000)
	if (<lock_to> = None)
		<AnimName> = qs(0x14fdda0e)
	else
		<lock_to> :Anim_Command target = ($anim_debug_targets [0]) Command = degenerateblend_findsource
		if GotParam \{duration_string}
			if (<isdone> = true)
				formatText TextName = timestr ' DONE (%t/%d)' t = <currenttime_string> d = <duration_string>
			else
				formatText TextName = timestr ' (%t/%d)' t = <currenttime_string> d = <duration_string>
			endif
		endif
	endif
	if NOT GlobalExists \{Name = debug_anim_name_struct
			Type = structure}
		formatText TextName = text '%t: %a %s' t = ($anim_debug_targets_strings [0]) a = (<AnimName>) s = <timestr> DontAssertForChecksums
	else
		formatText TextName = text '%t: %a %s' t = ($anim_debug_targets_strings [0]) a = (<AnimName>) s = <timestr> DontAssertForChecksums
	endif
	<TextElement> :se_setprops {
		text = <text>
	}
	GetArraySize ($anim_debug_targets)
	<i> = 1
	begin
	ResolveScreenElementID id = {anim_debug_container child = <i>} param = TextElement
	<AnimName> = qs(0xae01dcbe)
	<timestr> = qs(0x00000000)
	RemoveParameter \{duration_string}
	Anim_Command target = ($anim_debug_targets [<i>]) Command = degenerateblend_findsource
	if GotParam \{duration_string}
		if (<isdone> = true)
			formatText TextName = timestr ' DONE (%t/%d)' t = <currenttime_string> d = <duration_string>
		else
			formatText TextName = timestr ' (%t/%d)' t = <currenttime_string> d = <duration_string>
		endif
	endif
	if NOT GlobalExists \{Name = debug_anim_name_struct
			Type = structure}
		formatText TextName = text '%t: %a %s' t = ($anim_debug_targets_strings [<i>]) a = (<AnimName>) s = <timestr> DontAssertForChecksums
	else
		formatText TextName = text '%t: %a %s' t = ($anim_debug_targets_strings [<i>]) a = (<AnimName>) s = <timestr> DontAssertForChecksums
	endif
	<TextElement> :se_setprops {
		text = <text>
	}
	<i> = (<i> + 1)
	repeat (<array_Size> -2)
	if ((<AnimName>) != ($debug_lastbodyanim))
		Change debug_lastbodyanim_display = ($debug_lastbodyanim)
		Change debug_lastbodyanim = <AnimName>
	endif
	ResolveScreenElementID id = {anim_debug_container child = <i>} param = TextElement
	<AnimName> = ($debug_lastbodyanim_display)
	if (<AnimName> = None)
		<AnimName> = qs(0xae01dcbe)
	endif
	if NOT GlobalExists \{Name = debug_anim_name_struct
			Type = structure}
		formatText TextName = text '%t: %a' t = ($anim_debug_targets_strings [<i>]) a = (<AnimName>) DontAssertForChecksums
	else
		formatText TextName = text '%t: %a' t = ($anim_debug_targets_strings [<i>]) a = (<AnimName>) DontAssertForChecksums
	endif
	<TextElement> :se_setprops {
		text = <text>
	}
	WaitOneGameFrame
	repeat
endscript
