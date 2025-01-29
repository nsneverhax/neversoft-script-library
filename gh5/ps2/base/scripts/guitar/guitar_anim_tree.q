cache_build_band_members = 0
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
	LeftHandPartial
	LeftArm
	LeftHand
	RightArm
	Face
	femalediff
	drumkit
	moment_branch
	moment_blend
	momenttimer
	faceoff_blend
	faceoff_branch
	faceoff_timer
	tweakbonesnode
	mirrornode
	heel
]

script get_anim_struct_member 
	if GotParam \{loading_into_song}
		get_song_prefix song = <loading_into_song>
		ExtendCrc <anim_struct> '_' out = song_anim_struct
		ExtendCrc <song_anim_struct> <song_prefix> out = song_anim_struct
		if (<member> = vocals_and_guitar)
			member = guitar
		endif
		if GlobalExists Name = <song_anim_struct> Type = structure
			if StructureContains structure = ($<song_anim_struct>) <member>


				return true anim_struct_member = (($<song_anim_struct>).<member>)
			elseif (<member> = bass || <member> = rhythm)

				if StructureContains structure = ($<song_anim_struct>) guitar

					return true anim_struct_member = (($<song_anim_struct>).guitar)
				endif
			endif
		endif
	endif
	if GlobalExists Name = <anim_struct> Type = structure
		if StructureContains structure = ($<anim_struct>) <member>


			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = bass)

			if StructureContains structure = ($<anim_struct>) guitar

				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif


	return \{FALSE}
endscript

script unload_band_anims 

	band_stop_anims
	band_unload_anim_paks async = <async>
endscript

script unload_band_song_anims \{song = unknown}

	band_stop_anims
	band_unload_song_anim_paks song = <song> async = <async>
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
	Anim_Command target = <Timer> Command = Timer_WaitAnimComplete
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
	Anim_Command \{target = momenttimer
		Command = Timer_WaitAnimComplete}
	if GlobalExists \{Name = 0x9f26bd2b
			Type = int}
		if ($0x9f26bd2b = 1)
			GetSongTimeMs
			CastToInteger \{time}
			finalprintf qs(0x26d868fe) a = <time> b = <objID>
		endif
	endif
	Wait \{2
		gameframes}
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
	ExtendCrc <objID> '_Info' out = info_struct
	part = ($<info_struct>.part)
	if (<part> = guitar || <part> = bass || <part> = rhythm)
		Chain = guitar
	else
		Chain = slave
	endif
	band_setikchain Name = <objID> Chain = <Chain>
	increase_band_bounding_spheres
	Wait \{1
		gameframe}
	GetPakManCurrent \{map = zones}
	if NOT 0x078ad386 venue = <pak>
		band_movetostartnode Name = <objID>
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
	Anim_Command \{target = momenttimer
		Command = Timer_WaitAnimComplete}
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			OFF
			BlendDuration = 0.1
		}}
endscript

script end_drummer_moment_anim 
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
generic_static_tree = {
	Type = DegenerateBlend
	id = Body
}
guitarist_static_tree = {
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
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
	]
}
0xb67a972f = {
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
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
							min_twist = 40.0
							max_twist = 150.0
							min_roll = -0.0
							max_roll = 65.0
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
																	min_twist = 17.62
																	max_twist = 145.40999
																	min_roll = -7.3700004
																	max_roll = 169.1
																	negate_rolls = 1
																	hand_bone = bone_guitar_body
																	elbow_bone = elbow_bone_strum
																	[
																		{
																			Type = Ik
																			two_bone_chains = 0x055926f9
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
	]
}
frontend_static_tree = {
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
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
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = Ik
			two_bone_chains = Singer_IK_Params
			id = Ik
			[
				{
					Type = applyheeldifference
					id = heel
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
									Type = applyfemaledrummerdifference
									id = femalediff
									[
										{
											Type = applyheeldifference
											id = heel
											[
												{
													Type = switch
													state = On
													id = moment_blend_inner
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
	id = momenttimer
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
		stretch = 0.0
	}
]
0x055926f9 = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
		newTarget = Bone_IK_Hand_Slave_R
		stretch = 0.0
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
		stretch = 0.0
	}
]
0xf56342fc = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.25, 0.0, -0.968246)
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
hero_feet_ik_params = [
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
Singer_IK_Params = [
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
]

script ps2_get_musician_context_data 
	switch (<Name>)
		case GUITARIST
		case cas_musician1
		case bassist2
		case vocalist2
		case drummer2
		asset_heap = heap_musician1
		bandmember_appearance = guitarist_appearance
		asset_slot_num = 0
		case BASSIST
		case cas_musician2
		case guitarist2
		asset_heap = heap_musician2
		bandmember_appearance = bassist_appearance
		asset_slot_num = 1
		case vocalist
		case cas_musician3
		asset_heap = heap_musician3
		bandmember_appearance = vocalist_appearance
		asset_slot_num = 2
		case drummer
		case cas_musician4
		asset_heap = heap_musician4
		bandmember_appearance = drummer_appearance
		asset_slot_num = 3
		default

		asset_heap = heap_musician1
		bandmember_appearance = guitarist_appearance
		asset_slot_num = 0
	endswitch
	return <...>
endscript
