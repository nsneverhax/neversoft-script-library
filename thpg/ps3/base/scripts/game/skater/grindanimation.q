
script Skater_PlayGrindAnim sync = 0 max_land_vel = -8.0
	if gotparam left_ledge
		subtree = Grind_Ledge_Source_Branch
	else
		subtree = Grind_NoLedge_Source_Branch
	endif
	land_strength = 1.0
	if NOT gotparam isatap
		getlastinairverticalvelocity
		if (<last_vert_vel> > 0.0)
			land_strength = 0.0
		else
			if (<last_vert_vel> < <max_land_vel>)
				land_strength = 1.0
			else
				land_strength = (<last_vert_vel> / <max_land_vel>)
			endif
		endif
		if gotparam isextra
			land_strength = 0.0
		endif
	endif
	if NOT gotparam min_land_strength
		min_land_strength = 0.0
	endif
	if NOT gotparam no_ollie_landings
		if (<land_strength> > 0)
			if anim_animnodeexists id = slopeblend
				Skater_PlayOllieSideLandAnims
			endif
		endif
	endif
	handlefliporboardrotateafter
	if anim_animnodeexists id = BodyPoseCapture
		anim_command {
			target = BodyPoseCapture
			command = posecapture_capture
		}
	endif
	if NOT gotparam blendduration
		blendduration = 0.3
	endif
	if NOT gotparam ik_params
		ik_params = Skater_IK_Params
	endif
	if NOT gotparam arm_tuck_right_anim
		arm_tuck_right_anim = Sk8_Rail_Wall_ArmTuck_R_P
		arm_tuck_left_anim = Sk8_Rail_Wall_ArmTuck_L_P
		arm_tuck_curve = [1.0 1.0]
	endif
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $Grind_AnimBranch
			blendduration = <blendduration>
			params = {
				<...>
			}
		}
	}
endscript

script Skater_PlayGrindExtraAnim blendduration = 0.3 tree = $GrindExtras_AnimBranch
	if NOT anim_animnodeexists id = grindextras
		return
	endif
	if gotparam no_blend
		extra_blend_dur = 0.0
	endif
	anim_command {
		target = grindextras
		command = degenerateblend_addbranch
		params = {
			tree = <tree>
			blendduration = <extra_blend_dur>
			params = {
				anim = <anim>
			}
		}
	}
	anim_command {
		target = grindrangemod
		command = modulate_startblend
		params = {
			blendcurve = <blendcurve>
			blendduration = <blendduration>
		}
	}
endscript

script Skater_BlankGrindExtraAnim \{blendduration = 0.0}
	if NOT anim_animnodeexists \{id = grindextras}
		return
	endif
	anim_command {
		target = grindextras
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = <blendduration>
			params = {}
		}
	}
	anim_command {
		target = grindrangemod
		command = modulate_startblend
		params = {
			blendcurve = [1 , 0]
			blendduration = <blendduration>
		}
	}
endscript
GrindExtras_AnimBranch = {
	type = source
	anim = anim
}
GrindExtrasTimed_AnimBranch = {
	type = play
	id = grindextratimer
	anim = anim
	[
		{
			type = source
			anim = anim
		}
	]
}
Grind_AnimBranch = {
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
							type = ik
							id = ik
							two_bone_chains = ik_params
							[
								{
									type = applypartialonactivevalue
									active_value_source = arm_tuck_right
									active_value_curve = arm_tuck_curve
									[
										{
											type = source
											anim = arm_tuck_right_anim
										}
										{
											type = applypartialonactivevalue
											active_value_source = arm_tuck_left
											active_value_curve = arm_tuck_curve
											[
												{
													type = source
													anim = arm_tuck_left_anim
												}
												{
													type = applydifference
													[
														{
															type = grindlandadd
															anim = land_anim
															blendcurve = land_blend_curve
															blendintime = land_blend_time
															sync = sync
															[
																{
																	type = play
																	id = LandTimer
																	anim = land_anim
																	[
																		{
																			type = skatermodulate
																			timertype = grindlean
																			min = min_land_strength
																			[
																				{
																					type = modulate
																					strength = land_strength
																					[
																						{
																							id = LandSource
																							type = source
																							anim = land_anim
																						}
																					]
																				}
																			]
																		}
																	]
																}
																{
																	type = add
																	[
																		{
																			type = wobble
																			anim = range_anim
																			reversewhenflipped = true
																			[
																				{
																					type = add
																					[
																						{
																							type = degenerateblend
																							id = grindextras
																						}
																						{
																							type = modulate
																							id = grindrangemod
																							[
																								{
																									type = source
																									anim = range_anim
																								}
																							]
																						}
																					]
																				}
																			]
																		}
																		{
																			type = balanceadd
																			side = right
																			update_both = true
																			min_strength = speed_min_strength
																			blendcurve = balance_blend_curve
																			[
																				{
																					type = balanceadd
																					side = left
																					update_both = true
																					min_strength = speed_min_strength
																					blendcurve = balance_blend_curve
																					[
																						{
																							type = speedadd
																							speed = speed_threshold
																							blendcurve = speed_blend_curve
																							[
																								{
																									type = cycle
																									id = SlowTimer
																									anim = slow_anim
																									[
																										{
																											id = SlowSource
																											type = source
																											anim = slow_anim
																										}
																									]
																								}
																								{
																									type = cycle
																									id = FastTimer
																									anim = fast_anim
																									[
																										{
																											id = FastSource
																											type = source
																											anim = fast_anim
																										}
																									]
																								}
																							]
																						}
																						{
																							type = cycle
																							id = LeftTimer
																							anim = left_anim
																							[
																								{
																									type = nestedtree
																									tree = subtree
																									user_params = {
																										source_id = LeftSource
																										anim = left_anim
																										ledge_anim = left_ledge
																										side = left
																									}
																								}
																							]
																						}
																					]
																				}
																				{
																					type = cycle
																					id = RightTimer
																					anim = right_anim
																					[
																						{
																							type = nestedtree
																							tree = subtree
																							user_params = {
																								source_id = RightSource
																								anim = right_anim
																								ledge_anim = right_ledge
																								side = right
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
															id = bodysource
															type = source
															anim = base_anim
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
Grind_NoLedge_Source_Branch = {
	id = source_id
	type = source
	anim = anim
}
Grind_Ledge_Source_Branch = {
	type = ledgeswitch
	side = side
	[
		{
			id = source_id
			type = source
			anim = anim
		}
		{
			type = source
			anim = ledge_anim
		}
	]
}
