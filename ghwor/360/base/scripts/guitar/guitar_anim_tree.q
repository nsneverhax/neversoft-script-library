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
	vocalist_pose_node
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
	lipflap
	heel
	fat
	autovocals_switch
	autovocals_mouth_idle
	db_phonemes
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

script unload_band_song_anims \{song = unknown}
	printf \{qs(0xaf472415)}
	band_stop_anims
	band_unload_song_anim_paks song = <song> async = <async>
endscript

script EmptyScript 
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

script hero_add_clothing_difference_anim \{heel_anim = 0
		fat_anim = 0}
	if (<heel_anim> != 0)
		Anim_Command target = heel Command = applyheeldifference_setanim params = {anim = <heel_anim>}
	endif
	if (<fat_anim> != 0)
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

script hide_drumkit 
	SwitchOffAtomic \{cas_drums}
endscript

script show_drumkit 
	SwitchOnAtomic \{cas_drums}
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
			Type = avatarface
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
	]
}
frontend_static_tree = {
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
vocalist_static_tree = $vocalist_static_tree_poselog
vocalist_static_tree_poselog = {
	Type = poselog
	start_recording = FALSE
	output_space = Model
	id = vocalist_pose_node
	[
		{
			$vocalist_static_tree_standard
		}
	]
}
vocalist_static_tree_standard = {
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
																					state = OFF
																					id = autovocals_switch
																					[
																						{
																							Type = ApplyDifference
																							Strength = 1.0
																							[
																								{
																									Type = add
																									[
																										{
																											Type = cycle
																											anim_events = OFF
																											[
																												{
																													Type = Source
																													anim = gh_av_male_blinks
																												}
																											]
																										}
																										{
																											Type = modulateonactivevalue
																											active_value_source = av_brow_mod
																											[
																												{
																													Type = timeonactivevalue
																													active_value_source = av_brow_scrub
																													anim_events = OFF
																													[
																														{
																															Type = blendonactivevalue
																															active_value_source = av_brow_emot
																															[
																																{
																																	Type = Source
																																	anim = gh_av_male_brow_inner
																																}
																																{
																																	Type = Source
																																	anim = gh_av_male_brow_outter
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
																									Type = PartialSwitch
																									state = On
																									id = autovocals_mouth_idle
																									[
																										{
																											Type = cycle
																											anim = gh_av_male_mouth_idle
																											[
																												{
																													Type = Source
																													anim = gh_av_male_mouth_idle
																												}
																											]
																										}
																										{
																											Type = DegenerateBlend
																											id = db_phonemes
																											default_degeneration_duration = 0.0
																										}
																									]
																								}
																							]
																						}
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
vocal_tree0 = {
	Type = cycleonactivevalue
	active_value_source = av_vocal_cycle_0
	anim_events = OFF
	[
		{
			Type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					Type = Source
					anim = anim_closed
				}
				{
					Type = Source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree1 = {
	Type = cycleonactivevalue
	active_value_source = av_vocal_cycle_1
	anim_events = OFF
	[
		{
			Type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					Type = Source
					anim = anim_closed
				}
				{
					Type = Source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree2 = {
	Type = cycleonactivevalue
	active_value_source = av_vocal_cycle_2
	anim_events = OFF
	[
		{
			Type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					Type = Source
					anim = anim_closed
				}
				{
					Type = Source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree3 = {
	Type = cycleonactivevalue
	active_value_source = av_vocal_cycle_3
	anim_events = OFF
	[
		{
			Type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					Type = Source
					anim = anim_closed
				}
				{
					Type = Source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree4 = {
	Type = cycleonactivevalue
	active_value_source = av_vocal_cycle_4
	anim_events = OFF
	[
		{
			Type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					Type = Source
					anim = anim_closed
				}
				{
					Type = Source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree5 = {
	Type = cycleonactivevalue
	active_value_source = av_vocal_cycle_5
	anim_events = OFF
	[
		{
			Type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					Type = Source
					anim = anim_closed
				}
				{
					Type = Source
					anim = anim_open
				}
			]
		}
	]
}
new_drummer_static_tree = {
	Type = avatarface
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
