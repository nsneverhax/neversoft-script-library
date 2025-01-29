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
	IK
	righthandik
	lefthandik
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
	MaleAnimAdjust
	MaleAnimAdjust_Moment
	TweakBonesNode
	MirrorNode
	FemaleDiff
	vocal_face_mod
	lipflap
	Heel
	Enable_New_Strum
	Dynamic_strums
	RightHandPartial
	Dynamic_Strum_Base
	Dynamic_Strum_Roll_High
	Dynamic_Strum_Roll_Mid
	Dynamic_Strum_Roll_Low
]
drummer_anim_node_ids = [
	Body
	BodyTimer
	FacialTimer
	IK
	LeftHandPartial
	LeftArm
	LeftHand
	RightArm
	Face
	FemaleDiff
	DrumKit
	moment_branch
	moment_blend
	momenttimer
	faceoff_blend
	faceoff_branch
	faceoff_timer
	TweakBonesNode
	MirrorNode
	Heel
]

script get_anim_struct_member 
	if GotParam \{loading_into_song}
		if SongFileManager func = has_perf_file song_name = <loading_into_song>
			get_song_prefix song = <loading_into_song>
			GameMode_GetType
			if (<type> = career)
				if NOT StructureContains structure = $download_songlist_props <loading_into_song>
					get_band_configuration song = <loading_into_song>
					if (<Band> != default_band)
						if ShouldUseSongPerformance song = <loading_into_song>
							if (<anim_struct> = car_female_anim_struct)
								anim_struct = car_female_alt_anim_struct
							else
								anim_struct = car_male_alt_anim_struct
							endif
						endif
					endif
				endif
			endif
			ExtendCrc <anim_struct> '_' out = song_anim_struct_name
			ExtendCrc <song_anim_struct_name> <song_prefix> out = song_anim_struct_name
			if SongFileManager func = get_song_anim_struct song_name = <loading_into_song> anim_struct_name = <song_anim_struct_name>
				if StructureContains structure = <song_anim_struct> <member>
					printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct_name> DoNotResolve
					printstruct <...>
					return true anim_struct_member = (<song_anim_struct>.<member>)
				elseif (<member> = bass)
					printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
					if StructureContains structure = <song_anim_struct> guitar
						printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct_name> DoNotResolve
						return true anim_struct_member = (<song_anim_struct>.guitar)
					endif
				endif
			endif
		endif
	endif
	if GlobalExists name = <anim_struct> type = structure
		if StructureContains structure = ($<anim_struct>) <member>
			printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> DoNotResolve
			printstruct <...>
			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = bass)
			printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
			if StructureContains structure = ($<anim_struct>) guitar
				printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> DoNotResolve
				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif
	printf 'get_anim_struct_member - Failed! : %s' s = <anim_struct> DoNotResolve
	printstruct <...>
	return \{false}
endscript

script unload_band_anims 
	printf \{qs(0xa3779ec3)}
	band_stop_anims
	band_unload_anim_paks async = <async>
endscript

script unload_band_song_anims \{song = unknown}
	printf \{qs(0xaf472415)}
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
	if Anim_AnimNodeExists \{id = MirrorNode}
		Anim_Command \{target = MirrorNode
			Command = Mirror_SetState
			params = {
				on
			}}
	endif
endscript

script hero_disable_mirroring 
	if Anim_AnimNodeExists \{id = MirrorNode}
		Anim_Command \{target = MirrorNode
			Command = Mirror_SetState
			params = {
				off
			}}
	endif
endscript

script hero_play_strum_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = RightArm}
		Anim_Command {
			target = RightArm
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_strumming_branch
				BlendDuration = $strum_anim_blend_time
				params = {
					strum_name = <anim>
				}
			}
		}
	endif
endscript

script band_play_strum_anim 
	if CompositeObjectExists name = <name>
		<name> :hero_play_strum_anim anim = <anim>
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

script band_play_fret_anim 
	if CompositeObjectExists name = <name>
		<name> :hero_play_fret_anim anim = <anim>
	endif
endscript

script hero_play_finger_anim \{BlendDuration = 0.2}
	if Anim_AnimNodeExists \{id = LeftHand}
		Anim_Command {
			target = LeftHand
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_finger_branch
				BlendDuration = <BlendDuration>
				params = {
					finger_anim = <anim>
				}
			}
		}
	endif
endscript

script band_play_finger_anim 
	if CompositeObjectExists name = <name>
		<name> :hero_play_finger_anim anim = <anim>
	endif
endscript

script hero_play_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Obj_GetID
		ExtendCrc <objID> '_Info' out = info_struct
		part = ($<info_struct>.part)
		if (<part> = vocals)
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
	Anim_Command target = Heel Command = ApplyHeelDifference_SetAnim params = {anim = <anim>}
endscript

script hero_wait_until_anim_finished \{timer = BodyTimer}
	begin
	if hero_anim_complete timer = <timer>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script hero_anim_complete \{timer = BodyTimer}
	if NOT Anim_AnimNodeExists id = <timer>
		return \{true}
	else
		if Anim_Command target = <timer> Command = Timer_IsAnimComplete
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script hero_wait_until_anim_near_end \{timer = BodyTimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end timer = <timer> time_from_end = <time_from_end>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script hero_anim_near_end \{timer = BodyTimer}
	if NOT Anim_AnimNodeExists id = <timer>
		return \{true}
	else
		if Anim_Command target = <timer> Command = Timer_Wait params = {SecondsFromEnd = <time_from_end>}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script killanim 
	obj_killallspawnedscripts
	Skeleton_GetSkeletonName
	ExtendCrc <skeletonName> '_default' out = anim
	hero_play_anim anim = <anim> BlendDuration = 0.0
endscript

script handle_moment_anim_blending 
	Obj_GetID
	Anim_Command \{target = moment_blend
		Command = PartialSwitch_SetState
		params = {
			on
			BlendDuration = 0.0
		}}
	Ragdoll_MarkForReset
	Anim_Command \{target = momenttimer
		Command = Timer_WaitAnimComplete}
	wait \{2
		gameframes}
	end_moment_anim
endscript

script end_moment_anim 
	Obj_GetID
	Obj_KillSpawnedScript \{name = handle_drummer_moment_anim_blending}
	if Anim_AnimNodeExists \{id = moment_blend}
		Anim_Command \{target = moment_blend
			Command = PartialSwitch_SetState
			params = {
				off
				BlendDuration = 0.0
			}}
		Anim_Command \{target = moment_branch
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_empty_branch
				BlendDuration = 0.0
			}}
	endif
	ExtendCrc <objID> '_Info' out = info_struct
	part = ($<info_struct>.part)
	if (<part> = guitar || <part> = bass || <part> = rhythm)
		Chain = guitar
	else
		Chain = slave
	endif
	Band_SetIKChain name = <objID> Chain = <Chain>
	Ragdoll_MarkForReset
	increase_band_bounding_spheres
	wait \{1
		gameframe}
	GetSingleTag \{frontend_character}
	if (<frontend_character> = 0)
		Band_MoveToStartNode name = <objID>
	endif
endscript

script stop_loop_cameras 
	if (<name> = Drummer)
		return
	endif
	ExtendCrc <name> '_mocap_lock_target_01' out = camera1
	if CompositeObjectExists name = <camera1>
		if <camera1> :Anim_AnimNodeExists id = BodyTimer
			<camera1> :Anim_Command target = BodyTimer Command = TempoMatch_Pause
		endif
	endif
	ExtendCrc <name> '_mocap_lock_target_02' out = camera2
	if CompositeObjectExists name = <camera2>
		if <camera2> :Anim_AnimNodeExists id = BodyTimer
			<camera2> :Anim_Command target = BodyTimer Command = TempoMatch_Pause
		endif
	endif
endscript

script start_loop_cameras 
	ExtendCrc <name> '_mocap_lock_target_01' out = camera1
	if CompositeObjectExists name = <camera1>
		if <camera1> :Anim_AnimNodeExists id = BodyTimer
			<camera1> :Anim_Command target = BodyTimer Command = TempoMatch_Unpause
		endif
	endif
	ExtendCrc <name> '_mocap_lock_target_02' out = camera2
	if CompositeObjectExists name = <camera2>
		if <camera2> :Anim_AnimNodeExists id = BodyTimer
			<camera2> :Anim_Command target = BodyTimer Command = TempoMatch_Unpause
		endif
	endif
endscript

script set_timer_node_speed 
endscript

script handle_drummer_moment_anim_blending 
	Anim_Command \{target = moment_blend
		Command = PartialSwitch_SetState
		params = {
			on
			BlendDuration = 0.1
		}}
	Anim_Command \{target = momenttimer
		Command = Timer_WaitAnimComplete}
	Anim_Command \{target = moment_blend
		Command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.1
		}}
endscript

script end_drummer_moment_anim 
endscript

script drummer_faceoff_rest 
	anim = Drum_HTH_Loop_NoTempo
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
		Command = PartialSwitch_SetState
		params = {
			on
			BlendDuration = 0.3
		}}
endscript

script drummer_faceoff_play 
	Anim_Command \{target = faceoff_blend
		Command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.3
		}}
endscript
faceoff_drummer_notempo = {
	type = Cycle
	id = faceoff_timer
	anim = anim
	[
		{
			type = Source
			anim = anim
		}
	]
}

script hide_mic 
	SwitchOffAtomic \{CAS_Mic}
	SwitchOffAtomic \{CAS_Mic_Stand}
endscript

script show_mic 
	SwitchOnAtomic \{CAS_Mic}
	SwitchOnAtomic \{CAS_Mic_Stand}
endscript

script hide_mic_stand 
	SwitchOffAtomic \{CAS_Mic_Stand}
endscript

script show_mic_stand 
	SwitchOnAtomic \{CAS_Mic_Stand}
endscript

script hide_mic_microphone 
	SwitchOffAtomic \{CAS_Mic}
endscript

script show_mic_microphone 
	SwitchOnAtomic \{CAS_Mic}
endscript

script hide_Drumkit 
	SwitchOffAtomic \{CAS_Drums}
endscript

script show_drumkit 
	SwitchOnAtomic \{CAS_Drums}
endscript

script vocalist_facial_animations_start \{BlendTime = 0.3}
	Anim_Command target = vocal_face_mod Command = Modulate_StartBlend params = {BlendTime = <BlendTime> blendcurve = [1 0]}
endscript

script vocalist_facial_animations_stop \{BlendTime = 0.3}
	Anim_Command target = vocal_face_mod Command = Modulate_StartBlend params = {BlendTime = <BlendTime> blendcurve = [0 1]}
endscript
generic_static_tree = {
	type = DegenerateBlend
	id = Body
}
guitarist_static_tree = {
	type = Ragdoll
	[
		{
			type = ConstraintBones
			ConstraintBones = hero_ConstraintBones
			[
				{
					type = AvatarFace
					[
						{
							type = ApplyHeelDifference
							id = Heel
							[
								{
									type = IK
									two_bone_chains = ik_params
									id = IK
									[
										{
											type = chordhand
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
													type = IK
													two_bone_chains = hero_IK_Hand_L_Params
													id = lefthandik
													[
														{
															type = TweakBones
															id = TweakBonesNode
															[
																{
																	type = PartialSwitch
																	state = on
																	[
																		{
																			type = TensionStorage
																			min_stress_anim = face_tension_min
																			max_stress_anim = face_tension_max
																			active = use_face_tension
																			[
																				{
																					type = DegenerateBlend
																					id = Face
																				}
																			]
																		}
																		{
																			type = ApplyDifference
																			id = LeftHandPartial
																			[
																				{
																					$hero_arm_branch
																				}
																				{
																					type = chordhand
																					id = strumhandnode
																					min_twist = 40.0
																					max_twist = 150.0
																					min_roll = -0.0
																					max_roll = 65.0
																					hand_bone = bone_guitar_body
																					elbow_bone = elbow_bone_strum
																					enable_debug_output = false
																					[
																						{
																							type = IK
																							two_bone_chains = hero_IK_Hand_R_Params
																							id = righthandik
																							[
																								{
																									type = applypartial
																									id = RightHandPartial
																									strength = 1.0
																									[
																										{
																											type = DegenerateBlend
																											id = Dynamic_Strum_Base
																										}
																										{
																											type = Switch
																											state = off
																											id = moment_blend
																											[
																												{
																													type = ApplyFemaleDifference
																													id = MaleAnimAdjust_Moment
																													anim = GH_Rocker_Female_GuitarRaise_D
																													[
																														{
																															type = DegenerateBlend
																															id = moment_branch
																														}
																													]
																												}
																												{
																													type = ApplyFemaleDifference
																													id = MaleAnimAdjust
																													anim = GH_Rocker_Female_GuitarRaise_D
																													[
																														{
																															type = DegenerateBlend
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
																							type = DegenerateBlend
																							id = Dynamic_Strum_Roll_High
																						}
																						{
																							type = DegenerateBlend
																							id = Dynamic_Strum_Roll_Mid
																						}
																						{
																							type = DegenerateBlend
																							id = Dynamic_Strum_Roll_Low
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
													type = DegenerateBlend
													id = low_chord
												}
												{
													type = DegenerateBlend
													id = med_chord
												}
												{
													type = DegenerateBlend
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
			]
		}
	]
}
frontend_static_tree = {
	type = Ragdoll
	[
		{
			type = ConstraintBones
			ConstraintBones = hero_ConstraintBones
			[
				{
					type = AvatarFace
					[
						{
							type = ApplyHeelDifference
							id = Heel
							[
								{
									type = IK
									two_bone_chains = ik_params
									id = IK
									[
										{
											type = ApplyFemaleDifference
											id = MaleAnimAdjust
											anim = GH_Rocker_Female_GuitarRaise_D
											[
												{
													type = ApplyFemaleDrummerDifference
													id = FemaleDiff
													[
														{
															type = TweakBones
															id = TweakBonesNode
															[
																{
																	type = PartialSwitch
																	state = on
																	[
																		{
																			type = DegenerateBlend
																			id = Face
																		}
																		{
																			type = ApplyDifference
																			id = LeftHandPartial
																			[
																				{
																					$hero_arm_branch
																				}
																				{
																					type = DegenerateBlend
																					type = PartialSwitch
																					state = off
																					id = moment_blend
																					[
																						{
																							type = DegenerateBlend
																							id = moment_branch
																						}
																						{
																							type = DegenerateBlend
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
					]
				}
			]
		}
	]
}
hero_arm_branch = {
	type = add
	[
		{
			type = modulate
			strength = 1.0
			id = fret_anim_mod
			[
				{
					type = DegenerateBlend
					id = LeftArm
				}
			]
		}
		{
			type = modulate
			strength = 1.0
			id = strum_anim_mod
			[
				{
					type = DegenerateBlend
					id = Dynamic_strums
				}
			]
		}
	]
}
Dynamic_Strum_Source = {
	type = Source
	anim = anim
}
Dynamic_Strum_Branch = {
	type = add
	[
		{
			type = Play
			start = startanim
			[
				{
					type = Source
					anim = Strumanim
				}
			]
		}
		{
			type = Source
			anim = Baseanim
		}
	]
}
Dynamic_Strum_Idle_Branch = {
	type = add
	[
		{
			type = Cycle
			start = startanim
			[
				{
					type = Source
					anim = Strumanim
				}
			]
		}
		{
			type = Source
			anim = Baseanim
		}
	]
}
hero_body_branch = {
	type = timer_type
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
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_moment_branch = {
	type = timer_type
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
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_strumming_branch = {
	type = Play
	id = StrumTimer
	anim = strum_name
	[
		{
			type = Source
			anim = strum_name
		}
	]
}
hero_fret_branch = {
	type = Play
	id = FretTimer
	anim = fret_anim
	[
		{
			type = Source
			anim = fret_anim
		}
	]
}
hero_finger_branch = {
	type = Play
	id = FingerTimer
	anim = finger_anim
	[
		{
			type = Source
			anim = finger_anim
		}
	]
}
hero_face_branch = {
	type = Play
	id = FacialTimer
	anim = facial_anim
	[
		{
			type = FacialHackSource
			anim = facial_anim
		}
	]
}
vocalist_face_branch = {
	type = PlayNoDurationBlending
	id = FacialTimer
	anim = facial_anim
	[
		{
			type = FacialHackSource
			anim = facial_anim
		}
	]
}
hero_play_branch = {
	type = Play
	id = timer_id
	anim = anim_name
	[
		{
			type = Source
			anim = anim_name
		}
	]
}
hero_cycle_branch = {
	type = Cycle
	id = timer_id
	anim = anim_name
	start = start_time
	[
		{
			type = Source
			anim = anim_name
		}
	]
}
hero_empty_branch = {
	type = blank
}
hero_drumming_branch = {
	type = timer_type
	id = timer_id
	anim = anim_name
	speed = speed
	[
		{
			type = Source
			anim = anim_name
		}
	]
}
vocalist_static_tree = {
	type = Ragdoll
	[
		{
			type = ConstraintBones
			ConstraintBones = hero_ConstraintBones
			[
				{
					type = IK
					two_bone_chains = Singer_IK_Params_Arms
					id = IK
					[
						{
							type = AvatarFace
							[
								{
									type = ApplyHeelDifference
									id = Heel
									[
										{
											type = IK
											two_bone_chains = Singer_IK_Params_Legs
											id = IK
											[
												{
													type = TweakBones
													id = TweakBonesNode
													[
														{
															type = ApplyDifference
															[
																{
																	type = lipflap
																	player = player
																	scale = 1.5
																	state = on
																	only_freeform = true
																	id = lipflap
																	[
																		{
																			type = Source
																			anim = GH_Rocker_male_MouthOpen
																		}
																	]
																}
																{
																	type = PartialSwitch
																	state = on
																	[
																		{
																			type = modulate
																			id = vocal_face_mod
																			strength = 1
																			[
																				{
																					type = TensionStorage
																					min_stress_anim = face_tension_min
																					max_stress_anim = face_tension_max
																					active = use_face_tension
																					[
																						{
																							type = DegenerateBlend
																							id = Face
																						}
																					]
																				}
																			]
																		}
																		{
																			type = Switch
																			state = off
																			id = moment_blend
																			[
																				{
																					type = DegenerateBlend
																					id = moment_branch
																				}
																				{
																					type = DegenerateBlend
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
			]
		}
	]
}
drummer_static_tree = {
	type = Ragdoll
	[
		{
			type = ConstraintBones
			ConstraintBones = hero_ConstraintBones
			[
				{
					type = AvatarFace
					[
						{
							type = ApplyHeelDifference
							id = Heel
							[
								{
									type = ApplyFemaleDrummerDifference
									id = FemaleDiff
									[
										{
											type = TweakBones
											id = TweakBonesNode
											[
												{
													type = PartialSwitch
													state = on
													[
														{
															type = TensionStorage
															min_stress_anim = face_tension_min
															max_stress_anim = face_tension_max
															active = use_face_tension
															[
																{
																	type = DegenerateBlend
																	id = Face
																}
															]
														}
														{
															type = Switch
															state = off
															id = faceoff_blend
															[
																{
																	type = DegenerateBlend
																	id = faceoff_branch
																}
																{
																	type = Switch
																	state = off
																	id = moment_blend
																	[
																		{
																			type = IK
																			two_bone_chains = Drummer_IK_Params
																			id = IK
																			[
																				{
																					type = DegenerateBlend
																					id = moment_branch
																				}
																			]
																		}
																		{
																			type = DegenerateBlend
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
	]
}
new_drummer_static_tree = {
	type = Ragdoll
	[
		{
			type = AvatarFace
			[
				{
					type = ConstraintBones
					ConstraintBones = hero_ConstraintBones
					[
						{
							type = TweakBones
							id = TweakBonesNode
							[
								{
									type = PartialSwitch
									state = on
									[
										{
											type = TensionStorage
											min_stress_anim = face_tension_min
											max_stress_anim = face_tension_max
											active = use_face_tension
											[
												{
													type = DegenerateBlend
													id = Face
												}
											]
										}
										{
											type = Switch
											state = off
											id = moment_blend
											[
												{
													type = IK
													two_bone_chains = Drummer_IK_Params
													id = IK
													[
														{
															type = ApplyHeelDifference
															id = Heel
															[
																{
																	type = ApplyFemaleDrummerDifference
																	id = FemaleDiff
																	[
																		{
																			type = DegenerateBlend
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
					]
				}
			]
		}
	]
}
drummer_moment_branch = {
	type = timer_type
	id = momenttimer
	anim = anim_name
	speed = speed
	start = start
	end = end
	skip_beats = skip_beats
	tempo_anim = tempo_anim
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_cymbal_branch = {
	type = Play
	id = cymbal_timer_id
	anim = cymbal_anim
	[
		{
			type = Source
			anim = cymbal_anim
		}
	]
}
hero_simple_source = {
	type = Play
	anim = anim
	[
		{
			type = Source
			anim = anim
		}
	]
}
hero_source_only = {
	type = Source
	anim = anim
}
drum_kit_channel_list = [
	{
		name = tom_1
		bones = [
			BONE_MIC_ADJUST_HEIGHT
		]
	}
	{
		name = tom_2
		bones = [
			Bone_Mic_Adjust_Angle
		]
	}
	{
		name = snare
		bones = [
			BONE_MIC_STAND
		]
	}
	{
		name = cymbal_hh
		bones = [
			Bone_Guitar_String_2
			Bone_Guitar_String_3
			Bone_Guitar_String_4
		]
	}
	{
		name = cymbal_1
		bones = [
			BONE_IK_HAND_GUITAR_L
		]
	}
	{
		name = cymbal_2
		bones = [
			BONE_IK_HAND_GUITAR_R
		]
	}
	{
		name = cymbal_3
		bones = [
			BONE_GUITAR_STRING_1
		]
	}
	{
		name = kick
		bones = [
			Bone_Thigh_R
			Bone_Toe_R
			Bone_IK_Foot_Slave_R
			Bone_Guitar_String_5
			Bone_Guitar_String_6
			BONE_MIC_ADJUST_HEIGHT
			Bone_Mic_Adjust_Angle
			Bone_Mic_Microphone
		]
	}
]
empty_ik_params = [
]
CAR_IK_Params = [
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
hero_IK_Hand_R_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_R
		NewTarget = Bone_IK_Hand_Slave_R
	}
]
hero_IK_Hand_L_Params = [
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_L
		NewTarget = Bone_IK_Hand_Slave_L
	}
]
test_IK_Hand_R_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
		NewTarget = BONE_IK_HAND_GUITAR_R
		stretch = 1.0
	}
]
test_IK_Hand_L_Params = [
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		NewTarget = BONE_IK_HAND_GUITAR_L
		stretch = 1.0
	}
]
hero_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_R
		NewTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_L
		NewTarget = Bone_IK_Hand_Slave_L
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
Hero_Feet_IK_Params = [
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
Singer_IK_Params_Arms = [
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
Singer_IK_Params_Legs = [
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
drummer_IK_Feet_Params = [
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
drummer_IK_Hand_R_Params = [
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
drummer_IK_Hand_L_Params = [
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
Guitar_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_R
		NewTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_L
		NewTarget = Bone_IK_Hand_Slave_L
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
		type = Twistchild
		bone = Bone_Twist_Wrist_L
		target = Bone_Palm_L
		amount = 0.5
	}
	{
		type = Twistchild
		bone = Bone_Twist_Wrist_R
		target = Bone_Palm_R
		amount = 0.5
	}
	{
		type = TWIST
		bone = Bone_Twist_Bicep_Mid_R
		target = Bone_Bicep_R
		amount = 0.5
	}
	{
		type = TWIST
		bone = Bone_Twist_Bicep_Mid_L
		target = Bone_Bicep_L
		amount = 0.5
	}
	{
		type = TWIST
		bone = Bone_Twist_Bicep_Top_R
		target = Bone_Bicep_R
		amount = 1.0
	}
	{
		type = TWIST
		bone = Bone_Twist_Bicep_Top_L
		target = Bone_Bicep_L
		amount = 1.0
	}
	{
		type = TwistThigh
		bone = Bone_Twist_Thigh_R
		target = Bone_Thigh_R
		amount = 1.0
	}
	{
		type = TwistThigh
		bone = Bone_Twist_Thigh_L
		target = Bone_Thigh_L
		amount = 1.0
	}
]
