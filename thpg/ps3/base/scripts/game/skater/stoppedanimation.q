
script Skater_PlayStoppedAnim sync = 0
	handlefliporboardrotateafter
	if anim_animnodeexists id = BodyPoseCapture
		anim_command {
			target = BodyPoseCapture
			command = posecapture_capture
		}
	endif
	if NOT gotparam blendduration
		blendduration = ($Stopped_data.blendduration)
	endif
	get_strongest_lifestyle {ignore_spread}
	if gotparam strongest_lifestyle
		switch <strongest_lifestyle>
			case rigger
			<class_idle> = Sk8_Gnd_Stop_Rigger_Idle_D
			case career
			<class_idle> = Sk8_Gnd_Stop_Career_Idle_D
			case hardcore
			<class_idle> = Sk8_Gnd_Stop_Hardcore_Idle_D
		endswitch
	endif
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $Stopped_AnimBranch
			blendduration = <blendduration>
			params = {$Stopped_data $stopped_init_data idle_anim = <class_idle>}
		}
	}
	if gotparam no_init
		anim_command {
			target = stopped_init
			command = modulate_setstrength
			params = {strength = 0.0}
		}
	endif
endscript
Stopped_AnimBranch = {
	type = ik
	id = ik
	two_bone_chains = Skater_IK_Params
	[
		{
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
									type = applydifference
									[
										{
											type = add
											[
												{
													type = add
													[
														{
															type = add
															[
																{
																	type = add
																	[
																		{
																			type = skatermodulate
																			timertype = turn
																			turn_dir = left
																			blendtime = 0.1
																			[
																				{
																					type = skatertimer
																					timertype = turn
																					dir = left
																					anim = left_level_anim
																					cycle = 1
																					[
																						{
																							type = nestedtree
																							tree = stopped_slope_branch
																							user_params = {
																								level_anim = left_level_anim
																								forward_anim = left_forward_anim
																								back_anim = left_back_anim
																								left_anim = left_left_anim
																								right_anim = left_right_anim
																							}
																						}
																					]
																				}
																			]
																		}
																		{
																			type = skatermodulate
																			timertype = turn
																			turn_dir = right
																			blendtime = 0.1
																			[
																				{
																					type = skatertimer
																					timertype = turn
																					dir = right
																					anim = right_level_anim
																					cycle = 1
																					[
																						{
																							type = nestedtree
																							tree = stopped_slope_branch
																							user_params = {
																								level_anim = right_level_anim
																								forward_anim = right_forward_anim
																								back_anim = right_back_anim
																								left_anim = right_left_anim
																								right_anim = right_right_anim
																							}
																						}
																					]
																				}
																			]
																		}
																	]
																}
																{
																	type = modulate
																	strength = 1.0
																	id = stopped_init
																	[
																		{
																			type = play
																			anim = init_anim
																			[
																				{
																					type = skatermodulate
																					timertype = offwhenfinished
																					anim = init_anim
																					[
																						{
																							type = nestedtree
																							tree = stopped_slope_branch
																							user_params = {
																								level_anim = init_anim
																								forward_anim = init_forward_anim
																								back_anim = init_back_anim
																								left_anim = init_left_anim
																								right_anim = init_right_anim
																							}
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
															type = modulate
															strength = 0
															blendcurve = [
																1.0
																0.0
															]
															anim = init_anim
															[
																{
																	type = skatermodulate
																	timertype = turn
																	turn_dir = any
																	invert = 1
																	blendtime = 0.1
																	[
																		{
																			type = cycle
																			anim = idle_anim
																			[
																				{
																					type = source
																					anim = idle_anim
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
													type = nestedtree
													tree = stopped_slope_sub_branch
													user_params = {
														forward_anim = base_forward_anim
														back_anim = base_back_anim
														left_anim = base_left_anim
														right_anim = base_right_anim
													}
												}
											]
										}
										{
											type = source
											anim = base_anim
											id = bodysource
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
stopped_slope_branch = {
	type = add
	[
		{
			type = skatermodulate
			timertype = slope
			slope_dir = any
			max_slope = 45
			invert = 1
			[
				{
					type = source
					anim = level_anim
				}
			]
		}
		{
			type = nestedtree
			tree = stopped_slope_sub_branch
		}
	]
}
stopped_slope_sub_branch = {
	type = add
	[
		{
			type = add
			[
				{
					type = skatermodulate
					timertype = slope
					slope_dir = forward
					max_slope = 45
					[
						{
							type = source
							anim = forward_anim
						}
					]
				}
				{
					type = skatermodulate
					timertype = slope
					slope_dir = back
					max_slope = 45
					[
						{
							type = source
							anim = back_anim
						}
					]
				}
			]
		}
		{
			type = add
			[
				{
					type = skatermodulate
					timertype = slope
					slope_dir = left
					max_slope = 45
					[
						{
							type = source
							anim = left_anim
						}
					]
				}
				{
					type = skatermodulate
					timertype = slope
					slope_dir = right
					max_slope = 45
					[
						{
							type = source
							anim = right_anim
						}
					]
				}
			]
		}
	]
}
