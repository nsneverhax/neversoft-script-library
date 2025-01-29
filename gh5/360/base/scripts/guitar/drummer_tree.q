drumdroid_animnode_ids = [
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
	cycle_drum_loop_body
	cycle_drum_arm_r
	cycle_drum_arm_l
	cycle_drum_foot_r
	cycle_tempo_drum_body
	mod_drum_loop_body
	mod_drum_arm_r
	mod_drum_arm_l
	mod_kit_cymbal_1
	mod_kit_cymbal_2
	mod_kit_cymbal_3
	mod_kit_hh
	add_drum_kit
	blend_drum_arm_r
	blend_drum_arm_l
	blend_drum_foot_r
	blend_kit_hh
	apply_drum_foot_r
	apply_drum_fingers
	apply_drum_base_arm
	apply_drum_base_ik
	apply_drum_kit
	ik_drum_hand_r
	ik_drum_hand_l
	ik_drum_feet
	db_drum_loop_anim_tempo
	db_drum_qhit_r_anim
	db_drum_mhit_r_anim
	db_drum_shit_r_anim
	db_drum_qhit_l_anim
	db_drum_mhit_l_anim
	db_drum_shit_l_anim
	db_drum_hit_ant_l
	db_drum_hit_ant_r
	db_drum_transition_base_anim
	db_drum_base_anim_old1
	db_drum_base_anim_new1
	db_drum_base_anim_old2
	db_drum_base_anim_new2
	db_drum_base_anim_old3
	db_drum_base_anim_new3
	db_drum_base_anim_old4
	db_drum_base_anim_new4
	db_drum_transition_baseik_anim
	db_drum_baseik_anim_old1
	db_drum_baseik_anim_new1
	db_drum_baseik_anim_old2
	db_drum_baseik_anim_new2
	db_drum_baseik_anim_old3
	db_drum_baseik_anim_new3
	db_drum_baseik_anim_old4
	db_drum_baseik_anim_new4
	db_drum_base_master1
	db_drum_base_master2
	db_drum_base_master3
	db_drum_base_master4
	db_drum_baseik_master1
	db_drum_baseik_master2
	db_drum_baseik_master3
	db_drum_baseik_master4
	db_drum_ant_r_1
	db_drum_ant_r_2
	db_drum_ant_l_1
	db_drum_ant_l_2
	db_drum_hh
	db_drum_cymbal_1
	db_drum_cymbal_2
	db_drum_cymbal_3
	source_drum_loop_anim_body
]
drumdroid_tree = {
	Type = ikonactivevalue
	id = ik_drum_feet
	two_bone_chains = drummer_ik_feet_params
	active_value_source = av_drum_ik_feet
	active_value_lower_bound = 0.0
	active_value_upper_bound = 1.0
	[
		{
			Type = ikonactivevalue
			id = ik_drum_hand_l
			two_bone_chains = drummer_ik_hand_l_params
			active_value_source = av_drum_ik_hand_l
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
					Type = ikonactivevalue
					id = ik_drum_hand_r
					two_bone_chains = drummer_ik_hand_r_params
					active_value_source = av_drum_ik_hand_r
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
							Type = applyheeldifference
							id = heel
							[
								{
									Type = applyfemaledrummerdifference
									id = femalediff
									[
										{
											Type = ApplyDifference
											id = apply_drum_kit
											Strength = 1.0
											[
												{
													$drum_kit_branch
												}
												{
													Type = applydifferenceonactivevalue
													id = apply_drum_foot_r
													active_value_source = av_drum_mod_foot_r
													active_value_lower_bound = 0.0
													active_value_upper_bound = 1.0
													[
														{
															Type = cycleonactivevalue
															id = cycle_drum_foot_r
															timing_track = standard
															active_value_source = av_drum_anim_foot_r
															active_value_lower_bound = 0.0
															active_value_upper_bound = 1.0
															[
																{
																	Type = blendnactive
																	id = blend_drum_foot_r
																	active_value_source = av_drum_blend_foot_r
																	active_value_lower_bound = 0.0
																	active_value_upper_bound = 1.0
																	[
																		{
																			Type = Source
																			anim = drum_foot_qhit_r
																			timing_track = standard
																		}
																		{
																			Type = Source
																			anim = drum_foot_mhit_r
																			timing_track = standard
																		}
																		{
																			Type = Source
																			anim = drum_foot_shit_r
																			timing_track = standard
																		}
																	]
																}
															]
														}
														{
															Type = ApplyDifference
															Strength = 1.0
															[
																{
																	Type = addn
																	[
																		{
																			Type = DegenerateBlend
																			id = db_drum_hit_ant_r
																			default_degeneration_duration = 0.0
																		}
																		{
																			Type = DegenerateBlend
																			id = db_drum_hit_ant_l
																			default_degeneration_duration = 0.0
																		}
																	]
																}
																{
																	Type = ApplyDifference
																	Strength = 1.0
																	[
																		{
																			Type = addn
																			[
																				{
																					Type = modulateonactivevalue
																					id = mod_drum_arm_r
																					active_value_source = av_drum_mod_hand_r
																					active_value_lower_bound = 0.0
																					active_value_upper_bound = 1.0
																					[
																						{
																							Type = cycleonactivevalue
																							id = cycle_drum_arm_r
																							timing_track = standard
																							active_value_source = av_drum_anim_hand_r
																							active_value_lower_bound = 0.0
																							active_value_upper_bound = 1.0
																							[
																								{
																									Type = blendnactive
																									id = blend_drum_arm_r
																									active_value_source = av_drum_blend_hand_r
																									active_value_lower_bound = 0.0
																									active_value_upper_bound = 1.0
																									[
																										{
																											Type = DegenerateBlend
																											id = db_drum_qhit_r_anim
																										}
																										{
																											Type = DegenerateBlend
																											id = db_drum_mhit_r_anim
																										}
																										{
																											Type = DegenerateBlend
																											id = db_drum_shit_r_anim
																										}
																									]
																								}
																							]
																						}
																					]
																				}
																				{
																					Type = modulateonactivevalue
																					id = mod_drum_arm_l
																					active_value_source = av_drum_mod_hand_l
																					active_value_lower_bound = 0.0
																					active_value_upper_bound = 1.0
																					[
																						{
																							Type = cycleonactivevalue
																							id = cycle_drum_arm_l
																							timing_track = standard
																							active_value_source = av_drum_anim_hand_l
																							active_value_lower_bound = 0.0
																							active_value_upper_bound = 1.0
																							[
																								{
																									Type = blendnactive
																									id = blend_drum_arm_l
																									active_value_source = av_drum_blend_hand_l
																									active_value_lower_bound = 0.0
																									active_value_upper_bound = 1.0
																									[
																										{
																											Type = DegenerateBlend
																											id = db_drum_qhit_l_anim
																										}
																										{
																											Type = DegenerateBlend
																											id = db_drum_mhit_l_anim
																										}
																										{
																											Type = DegenerateBlend
																											id = db_drum_shit_l_anim
																										}
																									]
																								}
																							]
																						}
																					]
																				}
																				{
																					Type = modulateonactivevalue
																					id = mod_drum_loop_body
																					active_value_source = av_drum_mod_loop_body
																					active_value_lower_bound = 0.0
																					active_value_upper_bound = 1.0
																					[
																						{
																							Type = DegenerateBlend
																							id = db_drum_loop_anim_tempo
																						}
																					]
																				}
																			]
																		}
																		{
																			Type = applypartial
																			id = apply_drum_fingers
																			Strength = 1.0
																			[
																				{
																					Type = Source
																					anim = drum_fingers
																				}
																				{
																					Type = applypartial
																					Strength = 1.0
																					[
																						{
																							Type = DegenerateBlend
																							id = db_drum_transition_baseik_anim
																							default_degeneration_duration = 0.0
																						}
																						{
																							Type = DegenerateBlend
																							id = db_drum_transition_base_anim
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
sorce_mod_branch = {
	Type = modulate
	Strength = Strength
	[
		{
			Type = Source
			anim = drum_t3t3_r
		}
	]
}
sorce_mod_branch_blank = {
	Type = Source
	anim = drum_t3t3_r
}
drum_ant_branch_r_1 = {
	Type = DegenerateBlend
	id = db_drum_ant_r_1
	default_degeneration_duration = 0.0
}
drum_ant_branch_r_2 = {
	Type = DegenerateBlend
	id = db_drum_ant_r_2
	default_degeneration_duration = 0.0
}
drum_ant_branch_l_1 = {
	Type = DegenerateBlend
	id = db_drum_ant_l_1
	default_degeneration_duration = 0.0
}
drum_ant_branch_l_2 = {
	Type = DegenerateBlend
	id = db_drum_ant_l_2
	default_degeneration_duration = 0.0
}
drum_base_branch_master1 = {
	Type = DegenerateBlend
	id = db_drum_base_master1
	default_degeneration_duration = 0.0
}
drum_base_branch_master2 = {
	Type = DegenerateBlend
	id = db_drum_base_master2
	default_degeneration_duration = 0.0
}
drum_base_branch_master3 = {
	Type = DegenerateBlend
	id = db_drum_base_master3
	default_degeneration_duration = 0.0
}
drum_base_branch_master4 = {
	Type = DegenerateBlend
	id = db_drum_base_master4
	default_degeneration_duration = 0.0
}
drum_base_branch_old1 = {
	Type = DegenerateBlend
	id = db_drum_base_anim_old1
	default_degeneration_duration = 0.0
}
drum_base_branch_new1 = {
	Type = DegenerateBlend
	id = db_drum_base_anim_new1
	default_degeneration_duration = 0.0
}
drum_base_branch_old2 = {
	Type = DegenerateBlend
	id = db_drum_base_anim_old2
	default_degeneration_duration = 0.0
}
drum_base_branch_new2 = {
	Type = DegenerateBlend
	id = db_drum_base_anim_new2
	default_degeneration_duration = 0.0
}
drum_base_branch_old3 = {
	Type = DegenerateBlend
	id = db_drum_base_anim_old3
	default_degeneration_duration = 0.0
}
drum_base_branch_new3 = {
	Type = DegenerateBlend
	id = db_drum_base_anim_new3
	default_degeneration_duration = 0.0
}
drum_base_branch_old4 = {
	Type = DegenerateBlend
	id = db_drum_base_anim_old4
	default_degeneration_duration = 0.0
}
drum_base_branch_new4 = {
	Type = DegenerateBlend
	id = db_drum_base_anim_new4
	default_degeneration_duration = 0.0
}
drum_baseik_branch_master1 = {
	Type = DegenerateBlend
	id = db_drum_baseik_master1
	default_degeneration_duration = 0.0
}
drum_baseik_branch_master2 = {
	Type = DegenerateBlend
	id = db_drum_baseik_master2
	default_degeneration_duration = 0.0
}
drum_baseik_branch_master3 = {
	Type = DegenerateBlend
	id = db_drum_baseik_master3
	default_degeneration_duration = 0.0
}
drum_baseik_branch_master4 = {
	Type = DegenerateBlend
	id = db_drum_baseik_master4
	default_degeneration_duration = 0.0
}
drum_baseik_branch_old1 = {
	Type = DegenerateBlend
	id = db_drum_baseik_anim_old1
	default_degeneration_duration = 0.0
}
drum_baseik_branch_new1 = {
	Type = DegenerateBlend
	id = db_drum_baseik_anim_new1
	default_degeneration_duration = 0.0
}
drum_baseik_branch_old2 = {
	Type = DegenerateBlend
	id = db_drum_baseik_anim_old2
	default_degeneration_duration = 0.0
}
drum_baseik_branch_new2 = {
	Type = DegenerateBlend
	id = db_drum_baseik_anim_new2
	default_degeneration_duration = 0.0
}
drum_baseik_branch_old3 = {
	Type = DegenerateBlend
	id = db_drum_baseik_anim_old3
	default_degeneration_duration = 0.0
}
drum_baseik_branch_new3 = {
	Type = DegenerateBlend
	id = db_drum_baseik_anim_new3
	default_degeneration_duration = 0.0
}
drum_baseik_branch_old4 = {
	Type = DegenerateBlend
	id = db_drum_baseik_anim_old4
	default_degeneration_duration = 0.0
}
drum_baseik_branch_new4 = {
	Type = DegenerateBlend
	id = db_drum_baseik_anim_new4
	default_degeneration_duration = 0.0
}
single_source_tree = {
	Type = Source
	anim = use_anim
}
single_source_anim_event_tree = {
	Type = Source
	anim = use_anim
	timing_track = standard
}
drum_loop_anim_tempo = {
	Type = tempocycle
	id = cycle_tempo_drum_body
	allow_beat_skipping = true
	start = start
	anim = loop_tempo_anim
	[
		{
			Type = Source
			id = source_drum_loop_anim_body
			anim = loop_anim_body
		}
	]
}
drum_loop_anim_notempo = {
	Type = cycle
	start = start
	anim = loop_tempo_anim
	[
		{
			Type = Source
			id = source_drum_loop_anim_body
			anim = loop_anim_body
		}
	]
}
drum_kit_branch = {
	Type = addn
	num_inputs = 4
	[
		{
			Type = DegenerateBlend
			id = db_drum_cymbal_1
			default_degeneration_duration = 0.2
		}
		{
			Type = DegenerateBlend
			id = db_drum_cymbal_2
			default_degeneration_duration = 0.2
		}
		{
			Type = DegenerateBlend
			id = db_drum_cymbal_3
			default_degeneration_duration = 0.2
		}
		{
			Type = DegenerateBlend
			id = db_drum_hh
			default_degeneration_duration = 0.2
		}
	]
}
gh_drum_cymbal_1_branch = {
	Type = Play
	anim = gh_drum_cymbal_1
	[
		{
			Type = modulate
			Strength = Strength
			id = mod_kit_cymbal_1
			[
				{
					Type = Source
					anim = gh_drum_cymbal_1
				}
			]
		}
	]
}
gh_drum_cymbal_2_branch = {
	Type = Play
	anim = gh_drum_cymbal_2
	[
		{
			Type = modulate
			Strength = Strength
			id = mod_kit_cymbal_2
			[
				{
					Type = Source
					anim = gh_drum_cymbal_2
				}
			]
		}
	]
}
gh_drum_cymbal_3_branch = {
	Type = Play
	anim = anim
	[
		{
			Type = modulate
			Strength = Strength
			id = mod_kit_cymbal_3
			[
				{
					Type = Source
					anim = anim
				}
			]
		}
	]
}
gh_drum_hh_branch = {
	Type = modulate
	Strength = Strength
	id = mod_kit_hh
	[
		{
			Type = blendonactivevalue
			id = blend_kit_hh
			active_value_source = av_drum_blend_hh_kit
			active_value_lower_bound = 0.0
			active_value_upper_bound = 1.0
			[
				{
					Type = Play
					anim = gh_drum_cymbal_hh_closed
					[
						{
							Type = Source
							anim = gh_drum_cymbal_hh_closed
						}
					]
				}
				{
					Type = Play
					anim = gh_drum_cymbal_hh_open
					[
						{
							Type = Source
							anim = gh_drum_cymbal_hh_open
						}
					]
				}
			]
		}
	]
}
