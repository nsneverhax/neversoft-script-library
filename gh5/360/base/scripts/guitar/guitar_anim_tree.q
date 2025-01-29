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
			printstruct <...>
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
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_strum_anim anim = <anim>
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
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_fret_anim anim = <anim>
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
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_finger_anim anim = <anim>
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
	Anim_Command target = heel Command = applyheeldifference_setanim params = {anim = <anim>}
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
	Ragdoll_MarkForReset
	Anim_Command \{target = momenttimer
		Command = Timer_WaitAnimComplete}
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
	ExtendCrc <objID> '_Info' out = info_struct
	part = ($<info_struct>.part)
	if (<part> = guitar || <part> = bass || <part> = rhythm)
		Chain = guitar
	else
		Chain = slave
	endif
	band_setikchain Name = <objID> Chain = <Chain>
	Ragdoll_MarkForReset
	increase_band_bounding_spheres
	Wait \{1
		gameframe}
	GetSingleTag \{frontend_character}
	if (<frontend_character> = 0)
		band_movetostartnode Name = <objID>
	endif
endscript

script stop_loop_cameras 
	if (<Name> = drummer)
		return
	endif
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
	Type = ragdoll
	[
		{
			Type = ConstraintBones
			ConstraintBones = hero_ConstraintBones
			[
				{
					Type = avatarface
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
																			Type = tensionstorage
																			min_stress_anim = face_tension_min
																			max_stress_anim = face_tension_max
																			Active = use_face_tension
																			[
																				{
																					Type = DegenerateBlend
																					id = Face
																				}
																			]
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
					]
				}
			]
		}
	]
}
frontend_static_tree = {
	Type = ragdoll
	[
		{
			Type = ConstraintBones
			ConstraintBones = hero_ConstraintBones
			[
				{
					Type = avatarface
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
													Type = applyfemaledrummerdifference
													id = femalediff
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
			Type = facialhacksource
			anim = facial_anim
		}
	]
}
vocalist_face_branch = {
	Type = playnodurationblending
	id = FacialTimer
	anim = facial_anim
	[
		{
			Type = facialhacksource
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
	start = start_time
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
	Type = ragdoll
	[
		{
			Type = ConstraintBones
			ConstraintBones = hero_ConstraintBones
			[
				{
					Type = Ik
					two_bone_chains = singer_ik_params_arms
					id = Ik
					[
						{
							Type = avatarface
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
															Type = ApplyDifference
															[
																{
																	Type = lipflap
																	Player = Player
																	Scale = 1.5
																	state = On
																	only_freeform = true
																	id = lipflap
																	[
																		{
																			Type = Source
																			anim = gh_rocker_male_mouthopen
																		}
																	]
																}
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
																					Type = tensionstorage
																					min_stress_anim = face_tension_min
																					max_stress_anim = face_tension_max
																					Active = use_face_tension
																					[
																						{
																							Type = DegenerateBlend
																							id = Face
																						}
																					]
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
							]
						}
					]
				}
			]
		}
	]
}
drummer_static_tree = {
	Type = ragdoll
	[
		{
			Type = ConstraintBones
			ConstraintBones = hero_ConstraintBones
			[
				{
					Type = avatarface
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
											Type = tweakbones
											id = tweakbonesnode
											[
												{
													Type = PartialSwitch
													state = On
													[
														{
															Type = tensionstorage
															min_stress_anim = face_tension_min
															max_stress_anim = face_tension_max
															Active = use_face_tension
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
															id = faceoff_blend
															[
																{
																	Type = DegenerateBlend
																	id = faceoff_branch
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
																					Type = DegenerateBlend
																					id = moment_branch
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
			]
		}
	]
}
new_drummer_static_tree = {
	Type = ragdoll
	[
		{
			Type = avatarface
			[
				{
					Type = ConstraintBones
					ConstraintBones = hero_ConstraintBones
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
											Type = tensionstorage
											min_stress_anim = face_tension_min
											max_stress_anim = face_tension_max
											Active = use_face_tension
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
			bone_mic_stand
		]
	}
	{
		Name = cymbal_hh
		bones = [
			bone_guitar_string_2
			bone_guitar_string_3
			bone_guitar_string_4
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
			Bone_Toe_R
			Bone_IK_Foot_Slave_R
			bone_guitar_string_5
			bone_guitar_string_6
			bone_mic_adjust_height
			bone_mic_adjust_angle
			bone_mic_microphone
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
	}
]
test_ik_hand_r_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
		newTarget = Bone_IK_Hand_Guitar_R
		stretch = 1.0
	}
]
test_ik_hand_l_params = [
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		newTarget = Bone_IK_Hand_Guitar_L
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
guitar_ik_params = [
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
		Type = twistthigh
		bone = Bone_Twist_Thigh_R
		target = Bone_Thigh_R
		amount = 1.0
	}
	{
		Type = twistthigh
		bone = Bone_Twist_Thigh_L
		target = Bone_Thigh_L
		amount = 1.0
	}
]
