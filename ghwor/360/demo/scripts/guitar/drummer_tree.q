drumdroid_animnode_ids = [
	body
	bodytimer
	facialtimer
	ik
	lefthandpartial
	leftarm
	lefthand
	rightarm
	face
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
	db_drum_hit_ant_l
	db_drum_hit_ant_r
	db_drum_ant_r_1
	db_drum_ant_r_2
	db_drum_ant_l_1
	db_drum_ant_l_2
	db_drum_hh
	db_drum_cymbal_1
	db_drum_cymbal_2
	db_drum_cymbal_3
	db_eye_lookat
	db_head_lookat
	eye_lookat_switch
	eye_lookat_type
]
drumdroid_tree = {
	type = ikonactivevalue
	id = ik_drum_feet
	two_bone_chains = drummer_ik_feet_params
	active_value_source = av_drum_ik_feet
	active_value_lower_bound = 0.0
	active_value_upper_bound = 1.0
	[
		{
			type = ikonactivevalue
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
					type = ikonactivevalue
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
							type = applyheeldifference
							id = heel
							[
								{
									type = applyfemaledrummerdifference
									id = femalediff
									[
										{
											type = applydifference
											strength = 1.0
											[
												{
													$drum_kit_branch
												}
												{
													type = applydifference
													strength = 1.0
													[
														{
															type = mergen
															[
																{
																	type = modulateonactivevalue
																	active_value_source = av_drum_mod_hand_r
																	active_value_lower_bound = 0.0
																	active_value_upper_bound = 1.0
																	[
																		{
																			type = cycleonactivevalue
																			timing_track = standard
																			active_value_source = av_drum_anim_hand_r
																			active_value_lower_bound = 0.0
																			active_value_upper_bound = 1.0
																			[
																				{
																					type = blendnactive
																					active_value_source = av_drum_blend_hand_r
																					active_value_lower_bound = 0.0
																					active_value_upper_bound = 1.0
																					[
																						{
																							type = degenerateblend
																							id = db_drum_qhit_r_anim
																						}
																						{
																							type = degenerateblend
																							id = db_drum_mhit_r_anim
																						}
																						{
																							type = degenerateblend
																							id = db_drum_shit_r_anim
																						}
																					]
																				}
																			]
																		}
																	]
																}
																{
																	type = modulateonactivevalue
																	active_value_source = av_drum_mod_hand_l
																	active_value_lower_bound = 0.0
																	active_value_upper_bound = 1.0
																	[
																		{
																			type = cycleonactivevalue
																			timing_track = standard
																			active_value_source = av_drum_anim_hand_l
																			active_value_lower_bound = 0.0
																			active_value_upper_bound = 1.0
																			[
																				{
																					type = blendnactive
																					active_value_source = av_drum_blend_hand_l
																					active_value_lower_bound = 0.0
																					active_value_upper_bound = 1.0
																					[
																						{
																							type = degenerateblend
																							id = db_drum_qhit_l_anim
																						}
																						{
																							type = degenerateblend
																							id = db_drum_mhit_l_anim
																						}
																						{
																							type = degenerateblend
																							id = db_drum_shit_l_anim
																						}
																					]
																				}
																			]
																		}
																	]
																}
																{
																	type = degenerateblend
																	id = db_drum_loop_anim_tempo
																}
																{
																	type = modulateonactivevalue
																	active_value_source = av_drum_mod_foot_r
																	active_value_lower_bound = 0.0
																	active_value_upper_bound = 1.0
																	[
																		{
																			type = cycleonactivevalue
																			timing_track = standard
																			active_value_source = av_drum_anim_foot_r
																			active_value_lower_bound = 0.0
																			active_value_upper_bound = 1.0
																			[
																				{
																					type = blendnactive
																					active_value_source = av_drum_blend_foot_r
																					active_value_lower_bound = 0.0
																					active_value_upper_bound = 1.0
																					[
																						{
																							type = source
																							anim = drum_foot_qhit_r
																							timing_track = standard
																						}
																						{
																							type = source
																							anim = drum_foot_mhit_r
																							timing_track = standard
																						}
																						{
																							type = source
																							anim = drum_foot_shit_r
																							timing_track = standard
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
															type = applypartial
															strength = 1.0
															[
																{
																	type = source
																	anim = drum_fingers
																}
																{
																	type = applypartial
																	strength = 1.0
																	[
																		{
																			type = degenerateblend
																			id = db_drum_transition_baseik_anim
																			default_degeneration_duration = 0.0
																		}
																		{
																			type = degenerateblend
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
sorce_mod_branch = {
	type = modulate
	strength = strength
	[
		{
			type = source
			anim = drum_t3t3_r
		}
	]
}
sorce_mod_branch_blank = {
	type = source
	anim = drum_t3t3_r
}
drum_ant_branch_r_1 = {
	type = degenerateblend
	id = db_drum_ant_r_1
	default_degeneration_duration = 0.0
}
drum_ant_branch_r_2 = {
	type = degenerateblend
	id = db_drum_ant_r_2
	default_degeneration_duration = 0.0
}
drum_ant_branch_l_1 = {
	type = degenerateblend
	id = db_drum_ant_l_1
	default_degeneration_duration = 0.0
}
drum_ant_branch_l_2 = {
	type = degenerateblend
	id = db_drum_ant_l_2
	default_degeneration_duration = 0.0
}
drum_base_branch_master1 = {
	type = degenerateblend
	id = db_drum_base_master1
	default_degeneration_duration = 0.0
}
drum_base_branch_master2 = {
	type = degenerateblend
	id = db_drum_base_master2
	default_degeneration_duration = 0.0
}
drum_base_branch_master3 = {
	type = degenerateblend
	id = db_drum_base_master3
	default_degeneration_duration = 0.0
}
drum_base_branch_master4 = {
	type = degenerateblend
	id = db_drum_base_master4
	default_degeneration_duration = 0.0
}
drum_base_branch_old1 = {
	type = degenerateblend
	id = db_drum_base_anim_old1
	default_degeneration_duration = 0.0
}
drum_base_branch_new1 = {
	type = degenerateblend
	id = db_drum_base_anim_new1
	default_degeneration_duration = 0.0
}
drum_base_branch_old2 = {
	type = degenerateblend
	id = db_drum_base_anim_old2
	default_degeneration_duration = 0.0
}
drum_base_branch_new2 = {
	type = degenerateblend
	id = db_drum_base_anim_new2
	default_degeneration_duration = 0.0
}
drum_base_branch_old3 = {
	type = degenerateblend
	id = db_drum_base_anim_old3
	default_degeneration_duration = 0.0
}
drum_base_branch_new3 = {
	type = degenerateblend
	id = db_drum_base_anim_new3
	default_degeneration_duration = 0.0
}
drum_base_branch_old4 = {
	type = degenerateblend
	id = db_drum_base_anim_old4
	default_degeneration_duration = 0.0
}
drum_base_branch_new4 = {
	type = degenerateblend
	id = db_drum_base_anim_new4
	default_degeneration_duration = 0.0
}
drum_baseik_branch_master1 = {
	type = degenerateblend
	id = db_drum_baseik_master1
	default_degeneration_duration = 0.0
}
drum_baseik_branch_master2 = {
	type = degenerateblend
	id = db_drum_baseik_master2
	default_degeneration_duration = 0.0
}
drum_baseik_branch_master3 = {
	type = degenerateblend
	id = db_drum_baseik_master3
	default_degeneration_duration = 0.0
}
drum_baseik_branch_master4 = {
	type = degenerateblend
	id = db_drum_baseik_master4
	default_degeneration_duration = 0.0
}
drum_baseik_branch_old1 = {
	type = degenerateblend
	id = db_drum_baseik_anim_old1
	default_degeneration_duration = 0.0
}
drum_baseik_branch_new1 = {
	type = degenerateblend
	id = db_drum_baseik_anim_new1
	default_degeneration_duration = 0.0
}
drum_baseik_branch_old2 = {
	type = degenerateblend
	id = db_drum_baseik_anim_old2
	default_degeneration_duration = 0.0
}
drum_baseik_branch_new2 = {
	type = degenerateblend
	id = db_drum_baseik_anim_new2
	default_degeneration_duration = 0.0
}
drum_baseik_branch_old3 = {
	type = degenerateblend
	id = db_drum_baseik_anim_old3
	default_degeneration_duration = 0.0
}
drum_baseik_branch_new3 = {
	type = degenerateblend
	id = db_drum_baseik_anim_new3
	default_degeneration_duration = 0.0
}
drum_baseik_branch_old4 = {
	type = degenerateblend
	id = db_drum_baseik_anim_old4
	default_degeneration_duration = 0.0
}
drum_baseik_branch_new4 = {
	type = degenerateblend
	id = db_drum_baseik_anim_new4
	default_degeneration_duration = 0.0
}
single_source_tree = {
	type = source
	anim = use_anim
}
single_source_anim_event_tree = {
	type = source
	anim = use_anim
	timing_track = standard
}
drum_loop_anim_tempo = {
	type = tempocycle
	allow_beat_skipping = true
	start = start
	anim = loop_tempo_anim
	[
		{
			type = source
			anim = loop_anim_body
		}
	]
}
drum_loop_anim_notempo = {
	type = cycle
	start = start
	anim = loop_tempo_anim
	[
		{
			type = source
			anim = loop_anim_body
		}
	]
}
drum_kit_branch = {
	type = addn
	num_inputs = 4
	[
		{
			type = degenerateblend
			id = db_drum_cymbal_1
			default_degeneration_duration = 0.2
		}
		{
			type = degenerateblend
			id = db_drum_cymbal_2
			default_degeneration_duration = 0.2
		}
		{
			type = degenerateblend
			id = db_drum_cymbal_3
			default_degeneration_duration = 0.2
		}
		{
			type = degenerateblend
			id = db_drum_hh
			default_degeneration_duration = 0.2
		}
	]
}
gh_drum_cymbal_1_branch = {
	type = play
	anim = gh_drum_cymbal_1
	[
		{
			type = modulate
			strength = strength
			[
				{
					type = source
					anim = gh_drum_cymbal_1
				}
			]
		}
	]
}
gh_drum_cymbal_2_branch = {
	type = play
	anim = gh_drum_cymbal_2
	[
		{
			type = modulate
			strength = strength
			[
				{
					type = source
					anim = gh_drum_cymbal_2
				}
			]
		}
	]
}
gh_drum_cymbal_3_branch = {
	type = play
	anim = anim
	[
		{
			type = modulate
			strength = strength
			[
				{
					type = source
					anim = anim
				}
			]
		}
	]
}
gh_drum_hh_branch = {
	type = modulate
	strength = strength
	[
		{
			type = blendonactivevalue
			active_value_source = av_drum_blend_hh_kit
			active_value_lower_bound = 0.0
			active_value_upper_bound = 1.0
			[
				{
					type = play
					anim = gh_drum_cymbal_hh_closed
					[
						{
							type = source
							anim = gh_drum_cymbal_hh_closed
						}
					]
				}
				{
					type = play
					anim = gh_drum_cymbal_hh_open
					[
						{
							type = source
							anim = gh_drum_cymbal_hh_open
						}
					]
				}
			]
		}
	]
}
