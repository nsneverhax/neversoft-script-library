drumdroid_animnode_ids = [
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
	Cycle_Drum_Loop_Body
	Cycle_Drum_Arm_R
	Cycle_Drum_Arm_L
	Cycle_Drum_Foot_R
	Cycle_Tempo_Drum_Body
	Mod_Drum_Loop_Body
	Mod_Drum_Arm_R
	Mod_Drum_Arm_L
	Mod_Kit_Cymbal_1
	Mod_Kit_Cymbal_2
	Mod_Kit_Cymbal_3
	Mod_Kit_HH
	Add_Drum_Kit
	Blend_Drum_Arm_R
	Blend_Drum_Arm_L
	Blend_Drum_Foot_R
	Blend_Kit_HH
	Apply_Drum_Foot_R
	Apply_Drum_Fingers
	Apply_Drum_Base_Arm
	Apply_Drum_Base_IK
	Apply_Drum_Kit
	IK_Drum_Hand_R
	IK_Drum_Hand_L
	IK_Drum_Feet
	DB_Drum_Loop_Anim_Tempo
	DB_Drum_QHit_R_Anim
	DB_Drum_MHit_R_Anim
	DB_Drum_SHit_R_Anim
	DB_Drum_QHit_L_Anim
	DB_Drum_MHit_L_Anim
	DB_Drum_SHit_L_Anim
	DB_Drum_Hit_Ant_L
	DB_Drum_Hit_Ant_R
	DB_Drum_Transition_Base_Anim
	DB_Drum_Base_Anim_Old1
	DB_Drum_Base_Anim_New1
	DB_Drum_Base_Anim_Old2
	DB_Drum_Base_Anim_New2
	DB_Drum_Base_Anim_Old3
	DB_Drum_Base_Anim_New3
	DB_Drum_Base_Anim_Old4
	DB_Drum_Base_Anim_New4
	DB_Drum_Transition_BaseIK_Anim
	DB_Drum_BaseIK_Anim_Old1
	DB_Drum_BaseIK_Anim_New1
	DB_Drum_BaseIK_Anim_Old2
	DB_Drum_BaseIK_Anim_New2
	DB_Drum_BaseIK_Anim_Old3
	DB_Drum_BaseIK_Anim_New3
	DB_Drum_BaseIK_Anim_Old4
	DB_Drum_BaseIK_Anim_New4
	DB_Drum_Base_Master1
	DB_Drum_Base_Master2
	DB_Drum_Base_Master3
	DB_Drum_Base_Master4
	DB_Drum_BaseIK_Master1
	DB_Drum_BaseIK_Master2
	DB_Drum_BaseIK_Master3
	DB_Drum_BaseIK_Master4
	DB_Drum_Ant_R_1
	DB_Drum_Ant_R_2
	DB_Drum_Ant_L_1
	DB_Drum_Ant_L_2
	DB_Drum_HH
	DB_Drum_Cymbal_1
	DB_Drum_Cymbal_2
	DB_Drum_Cymbal_3
	Source_Drum_Loop_Anim_Body
]
drumdroid_tree = {
	type = ikonactivevalue
	id = IK_Drum_Feet
	two_bone_chains = drummer_IK_Feet_Params
	active_value_source = AV_Drum_IK_Feet
	active_value_lower_bound = 0.0
	active_value_upper_bound = 1.0
	[
		{
			type = ikonactivevalue
			id = IK_Drum_Hand_L
			two_bone_chains = drummer_IK_Hand_L_Params
			active_value_source = AV_Drum_IK_Hand_L
			active_value_lower_bound = 0.0
			active_value_upper_bound = 1.0
			active_value_curve = [
				1.0
				0.9975
				0.98999995
				0.9775
				0.96
				0.9375
				0.90999997
				0.87750006
				0.84000003
				0.7975
				0.75
				0.69750005
				0.64000005
				0.57750005
				0.51
				0.4375
				0.36
				0.2775
				0.19
				0.097500004
				0.0
			]
			[
				{
					type = ikonactivevalue
					id = IK_Drum_Hand_R
					two_bone_chains = drummer_IK_Hand_R_Params
					active_value_source = AV_Drum_IK_Hand_R
					active_value_lower_bound = 0.0
					active_value_upper_bound = 1.0
					active_value_curve = [
						1.0
						0.9975
						0.98999995
						0.9775
						0.96
						0.9375
						0.90999997
						0.87750006
						0.84000003
						0.7975
						0.75
						0.69750005
						0.64000005
						0.57750005
						0.51
						0.4375
						0.36
						0.2775
						0.19
						0.097500004
						0.0
					]
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
											type = ApplyDifference
											id = Apply_Drum_Kit
											strength = 1.0
											[
												{
													$Drum_Kit_Branch
												}
												{
													type = applydifferenceonactivevalue
													id = Apply_Drum_Foot_R
													active_value_source = AV_Drum_Mod_Foot_R
													active_value_lower_bound = 0.0
													active_value_upper_bound = 1.0
													[
														{
															type = cycleonactivevalue
															id = Cycle_Drum_Foot_R
															timing_track = standard
															active_value_source = AV_Drum_Anim_Foot_R
															active_value_lower_bound = 0.0
															active_value_upper_bound = 1.0
															[
																{
																	type = blendNactive
																	id = Blend_Drum_Foot_R
																	active_value_source = AV_Drum_Blend_Foot_R
																	active_value_lower_bound = 0.0
																	active_value_upper_bound = 1.0
																	[
																		{
																			type = Source
																			anim = drum_foot_qhit_r
																			timing_track = standard
																		}
																		{
																			type = Source
																			anim = drum_foot_mhit_r
																			timing_track = standard
																		}
																		{
																			type = Source
																			anim = drum_foot_shit_r
																			timing_track = standard
																		}
																	]
																}
															]
														}
														{
															type = ApplyDifference
															strength = 1.0
															[
																{
																	type = addn
																	[
																		{
																			type = DegenerateBlend
																			id = DB_Drum_Hit_Ant_R
																			default_degeneration_duration = 0.0
																		}
																		{
																			type = DegenerateBlend
																			id = DB_Drum_Hit_Ant_L
																			default_degeneration_duration = 0.0
																		}
																	]
																}
																{
																	type = ApplyDifference
																	strength = 1.0
																	[
																		{
																			type = addn
																			[
																				{
																					type = modulateonactivevalue
																					id = Mod_Drum_Arm_R
																					active_value_source = AV_Drum_Mod_Hand_R
																					active_value_lower_bound = 0.0
																					active_value_upper_bound = 1.0
																					[
																						{
																							type = cycleonactivevalue
																							id = Cycle_Drum_Arm_R
																							timing_track = standard
																							active_value_source = AV_Drum_Anim_Hand_R
																							active_value_lower_bound = 0.0
																							active_value_upper_bound = 1.0
																							[
																								{
																									type = blendNactive
																									id = Blend_Drum_Arm_R
																									active_value_source = AV_Drum_Blend_Hand_R
																									active_value_lower_bound = 0.0
																									active_value_upper_bound = 1.0
																									[
																										{
																											type = DegenerateBlend
																											id = DB_Drum_QHit_R_Anim
																										}
																										{
																											type = DegenerateBlend
																											id = DB_Drum_MHit_R_Anim
																										}
																										{
																											type = DegenerateBlend
																											id = DB_Drum_SHit_R_Anim
																										}
																									]
																								}
																							]
																						}
																					]
																				}
																				{
																					type = modulateonactivevalue
																					id = Mod_Drum_Arm_L
																					active_value_source = AV_Drum_Mod_Hand_L
																					active_value_lower_bound = 0.0
																					active_value_upper_bound = 1.0
																					[
																						{
																							type = cycleonactivevalue
																							id = Cycle_Drum_Arm_L
																							timing_track = standard
																							active_value_source = AV_Drum_Anim_Hand_L
																							active_value_lower_bound = 0.0
																							active_value_upper_bound = 1.0
																							[
																								{
																									type = blendNactive
																									id = Blend_Drum_Arm_L
																									active_value_source = AV_Drum_Blend_Hand_L
																									active_value_lower_bound = 0.0
																									active_value_upper_bound = 1.0
																									[
																										{
																											type = DegenerateBlend
																											id = DB_Drum_QHit_L_Anim
																										}
																										{
																											type = DegenerateBlend
																											id = DB_Drum_MHit_L_Anim
																										}
																										{
																											type = DegenerateBlend
																											id = DB_Drum_SHit_L_Anim
																										}
																									]
																								}
																							]
																						}
																					]
																				}
																				{
																					type = modulateonactivevalue
																					id = Mod_Drum_Loop_Body
																					active_value_source = AV_Drum_Mod_Loop_Body
																					active_value_lower_bound = 0.0
																					active_value_upper_bound = 1.0
																					[
																						{
																							type = DegenerateBlend
																							id = DB_Drum_Loop_Anim_Tempo
																						}
																					]
																				}
																			]
																		}
																		{
																			type = applypartial
																			id = Apply_Drum_Fingers
																			strength = 1.0
																			[
																				{
																					type = Source
																					anim = drum_fingers
																				}
																				{
																					type = applypartial
																					strength = 1.0
																					[
																						{
																							type = DegenerateBlend
																							id = DB_Drum_Transition_BaseIK_Anim
																							default_degeneration_duration = 0.0
																						}
																						{
																							type = DegenerateBlend
																							id = DB_Drum_Transition_Base_Anim
																							default_degeneration_duration = 0.0
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
Sorce_Mod_Branch = {
	type = modulate
	strength = strength
	[
		{
			type = Source
			anim = Drum_T3T3_R
		}
	]
}
Sorce_Mod_Branch_blank = {
	type = Source
	anim = Drum_T3T3_R
}
Drum_Ant_Branch_R_1 = {
	type = DegenerateBlend
	id = DB_Drum_Ant_R_1
	default_degeneration_duration = 0.0
}
Drum_Ant_Branch_R_2 = {
	type = DegenerateBlend
	id = DB_Drum_Ant_R_2
	default_degeneration_duration = 0.0
}
Drum_Ant_Branch_L_1 = {
	type = DegenerateBlend
	id = DB_Drum_Ant_L_1
	default_degeneration_duration = 0.0
}
Drum_Ant_Branch_L_2 = {
	type = DegenerateBlend
	id = DB_Drum_Ant_L_2
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_Master1 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Master1
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_Master2 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Master2
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_Master3 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Master3
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_Master4 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Master4
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_Old1 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Anim_Old1
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_New1 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Anim_New1
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_Old2 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Anim_Old2
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_New2 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Anim_New2
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_Old3 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Anim_Old3
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_New3 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Anim_New3
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_Old4 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Anim_Old4
	default_degeneration_duration = 0.0
}
Drum_Base_Branch_New4 = {
	type = DegenerateBlend
	id = DB_Drum_Base_Anim_New4
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_Master1 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Master1
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_Master2 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Master2
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_Master3 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Master3
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_Master4 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Master4
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_Old1 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Anim_Old1
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_New1 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Anim_New1
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_Old2 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Anim_Old2
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_New2 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Anim_New2
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_Old3 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Anim_Old3
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_New3 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Anim_New3
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_Old4 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Anim_Old4
	default_degeneration_duration = 0.0
}
Drum_BaseIK_Branch_New4 = {
	type = DegenerateBlend
	id = DB_Drum_BaseIK_Anim_New4
	default_degeneration_duration = 0.0
}
Single_Source_tree = {
	type = Source
	anim = Use_Anim
}
Single_Source_Anim_Event_tree = {
	type = Source
	anim = Use_Anim
	timing_track = standard
}
Drum_Loop_Anim_Tempo = {
	type = tempoCycle
	id = Cycle_Tempo_Drum_Body
	allow_beat_skipping = true
	start = start
	anim = Loop_Tempo_Anim
	[
		{
			type = Source
			id = Source_Drum_Loop_Anim_Body
			anim = Loop_Anim_Body
		}
	]
}
Drum_Loop_Anim_NoTempo = {
	type = Cycle
	start = start
	anim = Loop_Tempo_Anim
	[
		{
			type = Source
			id = Source_Drum_Loop_Anim_Body
			anim = Loop_Anim_Body
		}
	]
}
Drum_Kit_Branch = {
	type = addn
	num_inputs = 4
	[
		{
			type = DegenerateBlend
			id = DB_Drum_Cymbal_1
			default_degeneration_duration = 0.2
		}
		{
			type = DegenerateBlend
			id = DB_Drum_Cymbal_2
			default_degeneration_duration = 0.2
		}
		{
			type = DegenerateBlend
			id = DB_Drum_Cymbal_3
			default_degeneration_duration = 0.2
		}
		{
			type = DegenerateBlend
			id = DB_Drum_HH
			default_degeneration_duration = 0.2
		}
	]
}
GH_Drum_Cymbal_1_Branch = {
	type = Play
	anim = GH_Drum_Cymbal_1
	[
		{
			type = modulate
			strength = strength
			id = Mod_Kit_Cymbal_1
			[
				{
					type = Source
					anim = GH_Drum_Cymbal_1
				}
			]
		}
	]
}
GH_Drum_Cymbal_2_Branch = {
	type = Play
	anim = GH_Drum_Cymbal_2
	[
		{
			type = modulate
			strength = strength
			id = Mod_Kit_Cymbal_2
			[
				{
					type = Source
					anim = GH_Drum_Cymbal_2
				}
			]
		}
	]
}
GH_Drum_Cymbal_3_Branch = {
	type = Play
	anim = anim
	[
		{
			type = modulate
			strength = strength
			id = Mod_Kit_Cymbal_3
			[
				{
					type = Source
					anim = anim
				}
			]
		}
	]
}
GH_Drum_HH_Branch = {
	type = modulate
	strength = strength
	id = Mod_Kit_HH
	[
		{
			type = blendonactivevalue
			id = Blend_Kit_HH
			active_value_source = AV_Drum_Blend_HH_Kit
			active_value_lower_bound = 0.0
			active_value_upper_bound = 1.0
			[
				{
					type = Play
					anim = GH_Drum_Cymbal_HH_Closed
					[
						{
							type = Source
							anim = GH_Drum_Cymbal_HH_Closed
						}
					]
				}
				{
					type = Play
					anim = GH_Drum_Cymbal_HH_Open
					[
						{
							type = Source
							anim = GH_Drum_Cymbal_HH_Open
						}
					]
				}
			]
		}
	]
}
