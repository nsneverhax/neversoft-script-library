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
	fat
	enable_new_strum
	dynamic_strums
	righthandpartial
	dynamic_strum_base
	dynamic_strum_roll_high
	dynamic_strum_roll_mid
	dynamic_strum_roll_low
	db_eye_lookat
	db_head_lookat
	eye_lookat_switch
	eye_lookat_type
]
vocalist_anim_node_ids = [
	Body
	BodyTimer
	moment_blend
	moment_branch
	momenttimer
	FacialTimer
	Ik
	righthandik
	lefthandik
	Face
	maleanimadjust
	maleanimadjust_moment
	tweakbonesnode
	mirrornode
	femalediff
	vocal_face_mod
	heel
	fat
	db_eye_lookat
	db_head_lookat
	eye_lookat_switch
	eye_lookat_type
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
	fat
	db_eye_lookat
	db_head_lookat
	eye_lookat_switch
	eye_lookat_type
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
	if GotParam \{loading_into_song}
		if songfilemanager func = has_perf_file song_name = <loading_into_song>
			get_song_prefix song = <loading_into_song>
			gamemode_gettype
			if (<Type> = career)
				if NOT StructureContains structure = $download_songlist_props <loading_into_song>
					get_band_configuration song = <loading_into_song>
					if (<Band> != default_band)
						if venue_should_use_song_performance song = <loading_into_song>
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
			if songfilemanager func = get_song_anim_struct song_name = <loading_into_song> anim_struct_name = <song_anim_struct_name>
				if StructureContains structure = <song_anim_struct> <member>
					return true anim_struct_member = (<song_anim_struct>.<member>)
				elseif (<member> = bass)
					if StructureContains structure = <song_anim_struct> guitar
						return true anim_struct_member = (<song_anim_struct>.guitar)
					endif
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

script EmptyScript 
endscript

script hero_play_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Obj_GetID
		ExtendCrc <objID> '_Info' out = info_struct
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

script hero_add_clothing_difference_anim \{heel_anim = None
		fat_anim = None}
	if (<heel_anim> != None)
		Anim_Command target = heel Command = applyheeldifference_setanim params = {anim = <heel_anim>}
	endif
	if (<fat_anim> != None)
		if Anim_AnimNodeExists \{id = fat}
			Anim_Command target = fat Command = applyfatdifference_setanim params = {anim = <fat_anim>}
		endif
	endif
endscript

script hero_wait_until_anim_finished \{Timer = BodyTimer}
	begin
	if hero_anim_complete Timer = <Timer>
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script handle_moment_anim_blending 
	Obj_GetID
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			On
			BlendDuration = 0.0
		}}
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
	if (<part> = guitar || <part> = bass)
		Chain = guitar
	else
		Chain = slave
	endif
	band_setikchain Name = <objID> Chain = <Chain>
	obj_teleport
	Wait \{1
		gameframe}
	GetSingleTag \{frontend_character}
	if (<frontend_character> = 0)
		band_movetostartnode Name = <objID>
	endif
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
disable_tempo_matching_for_guitarist = 0
disable_tempo_matching_for_bassist = 0
disable_tempo_matching_for_vocalist = 0
disable_tempo_matching_for_drummer = 0

script disable_tempo \{Name = None}
	switch <Name>
		case all
		Change \{disable_tempo_matching_for_guitarist = 1}
		Change \{disable_tempo_matching_for_bassist = 1}
		Change \{disable_tempo_matching_for_vocalist = 1}
		Change \{disable_tempo_matching_for_drummer = 1}
		case GUITARIST
		Change \{disable_tempo_matching_for_guitarist = 1}
		case BASSIST
		Change \{disable_tempo_matching_for_bassist = 1}
		case vocalist
		Change \{disable_tempo_matching_for_vocalist = 1}
		case drummer
		Change \{disable_tempo_matching_for_drummer = 1}
		default
		ScriptAssert
	endswitch
endscript

script enable_tempo \{Name = all}
	switch <Name>
		case all
		Change \{disable_tempo_matching_for_guitarist = 0}
		Change \{disable_tempo_matching_for_bassist = 0}
		Change \{disable_tempo_matching_for_vocalist = 0}
		Change \{disable_tempo_matching_for_drummer = 0}
		case GUITARIST
		Change \{disable_tempo_matching_for_guitarist = 0}
		case BASSIST
		Change \{disable_tempo_matching_for_bassist = 0}
		case vocalist
		Change \{disable_tempo_matching_for_vocalist = 0}
		case drummer
		Change \{disable_tempo_matching_for_drummer = 0}
		default
		ScriptAssert
	endswitch
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
			Type = ApplyDifference
			[
				{
					Type = DegenerateBlend
					id = db_eye_lookat
					default_degeneration_duration = 0.0
				}
				{
					Type = PartialSwitch
					state = OFF
					id = eye_lookat_switch
					[
						{
							Type = switchclearbones
							state = OFF
							id = eye_lookat_type
						}
						{
							Type = applypartial
							[
								{
									Type = DegenerateBlend
									id = db_head_lookat
									default_degeneration_duration = 0.0
								}
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
															id = lefthandik
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
																									id = righthandik
																									[
																										{
																											Type = applyfatdifference
																											id = fat
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
							Type = applyfatdifference
							id = fat
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
hero_face_branch_cycle = {
	Type = cycle
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
drummer_face_branch_blend = {
	Type = cycle
	id = FacialTimer
	anim = idle_anim
	[
		{
			Type = blendonactivevalue
			active_value_source = av_drum_face_rock
			[
				{
					Type = facialhacksource
					anim = idle_anim
				}
				{
					Type = facialhacksource
					anim = rocking_anim
				}
			]
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
									Type = applyfatdifference
									id = fat
									[
										{
											Type = tweakbones
											id = tweakbonesnode
											[
												{
													Type = ApplyDifference
													[
														{
															Type = DegenerateBlend
															id = db_eye_lookat
															default_degeneration_duration = 0.0
														}
														{
															Type = PartialSwitch
															state = OFF
															id = eye_lookat_switch
															[
																{
																	Type = switchclearbones
																	state = OFF
																	id = eye_lookat_type
																}
																{
																	Type = applypartial
																	[
																		{
																			Type = DegenerateBlend
																			id = db_head_lookat
																			default_degeneration_duration = 0.0
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
eye_lookat_off = {
	Type = Source
	anim = gh_male_eye_lookat_center
}
head_lookat_off = {
	Type = modulate
	Strength = 0.0
	[
		{
			Type = Source
			anim = gh_male_head_center
		}
	]
}
eye_lookat_tree1 = {
	Type = timeonactivevalue
	active_value_source = av_eyerot_1
	anim_events = OFF
	[
		{
			Type = modulateonactivevalue
			active_value_source = av_eyemag_1
			[
				{
					Type = Source
					anim = gh_male_eye_lookat_outer
				}
			]
		}
	]
}
eye_lookat_tree2 = {
	Type = timeonactivevalue
	active_value_source = av_eyerot_2
	anim_events = OFF
	[
		{
			Type = modulateonactivevalue
			active_value_source = av_eyemag_2
			[
				{
					Type = Source
					anim = gh_male_eye_lookat_outer
				}
			]
		}
	]
}
head_lookat_tree1 = {
	Type = modulate
	Strength = Strength
	[
		{
			Type = timeonactivevalue
			active_value_source = av_headrot_1
			anim_events = OFF
			[
				{
					Type = blendonactivevalue
					active_value_source = av_headmag_1
					[
						{
							Type = Source
							anim = gh_male_head_center
						}
						{
							Type = Source
							anim = gh_male_head_lookat
						}
					]
				}
			]
		}
	]
}
head_lookat_tree2 = {
	Type = modulate
	Strength = Strength
	[
		{
			Type = timeonactivevalue
			active_value_source = av_headrot_2
			anim_events = OFF
			[
				{
					Type = blendonactivevalue
					active_value_source = av_headmag_2
					[
						{
							Type = Source
							anim = gh_male_head_center
						}
						{
							Type = Source
							anim = gh_male_head_lookat
						}
					]
				}
			]
		}
	]
}
new_drummer_static_tree = {
	Type = ApplyDifference
	[
		{
			Type = DegenerateBlend
			id = db_eye_lookat
			default_degeneration_duration = 0.0
		}
		{
			Type = PartialSwitch
			state = OFF
			id = eye_lookat_switch
			[
				{
					Type = switchclearbones
					state = OFF
					id = eye_lookat_type
				}
				{
					Type = applypartial
					[
						{
							Type = DegenerateBlend
							id = db_head_lookat
							default_degeneration_duration = 0.0
						}
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
hero_ConstraintBones = [
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
