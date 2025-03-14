
script Skater_PlayManualAnim sync = 0 max_land_vel = -12.0 blendduration = 0.6
	if gotparam no_land
		skip = 1
		land_strength = 0.0
	else
		skip = 0
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
		if gotparam min_land_strength
			if (<land_strength> < <min_land_strength>)
				land_strength = <min_land_strength>
			endif
		endif
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
	if gotparam force_land_strength
		if NOT (<force_land_strength> = 0.0)
			<land_strength> = <force_land_strength>
		endif
	endif
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $Manual_AnimBranch
			blendduration = <blendduration>
			params = {
				<...>
			}
		}
	}
endscript

script Skater_PlayManualTransitionAnim 
	if NOT anim_animnodeexists id = manualbalancemod
		return
	endif
	if structurecontains structure = <data> use_anim_length
		length_anim = (<data>.anim)
	endif
	anim_command {
		target = manualbalancemod
		command = modulate_startblend
		params = {
			blendcurve = (<data>.balance_blend_curve)
			blendtime = (<data>.balance_blend_time)
			anim = <length_anim>
		}
	}
	anim_command {
		target = manuallandmod
		command = modulate_startblend
		params = {
			blendcurve = (<data>.balance_blend_curve)
			blendtime = (<data>.balance_blend_time)
			anim = <length_anim>
		}
	}
	anim_command {
		target = manualslopemod
		command = modulate_startblend
		params = {
			blendcurve = (<data>.slope_blend_curve)
			blendtime = (<data>.slope_blend_time)
			anim = <length_anim>
		}
	}
	InverseBlendCurve = (<data>.slope_blend_curve)
	getarraysize <InverseBlendCurve>
	i = 0
	begin
	value = (1.0 - (<data>.slope_blend_curve [<i>]))
	setarrayelement arrayname = InverseBlendCurve index = <i> newvalue = <value>
	i = (<i> + 1)
	repeat <array_size>
	anim_command {
		target = manualfakeslopemod
		command = modulate_startblend
		params = {
			blendcurve = <InverseBlendCurve>
			blendtime = (<data>.slope_blend_time)
			anim = <length_anim>
		}
	}
	if NOT gotparam blendduration
		anim_getanimlength anim = (<data>.anim)
		blendduration = (<length> / 2)
	endif
	anim_command {
		target = manualextras
		command = degenerateblend_addbranch
		params = {
			tree = $ManualExtras_AnimBranch
			blendduration = <blendduration>
			params = {
				anim = (<data>.anim)
			}
		}
	}
endscript

script Skater_PlayManualExtraAnim \{blendduration = 0}
	anim_command {
		target = manualextras
		command = degenerateblend_addbranch
		params = {
			tree = $ManualExtras_AnimBranch
			blendduration = <blendduration>
			params = {
				<...>
			}
		}
	}
endscript

script Skater_BlankManualExtraAnim 
	if NOT anim_animnodeexists \{id = manualextras}
		return
	endif
	anim_command \{target = manualextras
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = 0
			params = {
			}
		}}
	handlefliporboardrotateafter
	anim_command \{target = boardrotate
		command = boardrotate_update
		params = {
		}}
endscript
ManualExtras_AnimBranch = {
	type = play
	anim = anim
	id = manualextratimer
	anim_events = on
	[
		{
			type = source
			anim = anim
		}
	]
}
Manual_AnimBranch = {
	type = skaterflip
	[
		{
			type = boardrotate
			id = boardrotate
			[
				{
					type = posecapture
					id = BodyPoseCapture
					[
						{
							type = ik
							id = ik
							two_bone_chains = Skater_IK_Params
							[
								{
									type = applydifference
									[
										{
											type = add
											[
												{
													type = degenerateblend
													id = manualextras
												}
												{
													type = add
													[
														{
															type = modulate
															strength = 1.0
															id = manuallandmod
															sync = sync
															[
																{
																	type = grindlandadd
																	anim = land_anim
																	blendcurve = land_blend_curve
																	blendintime = land_blend_time
																	skip = skip
																	sync = sync
																	[
																		{
																			type = skatermodulate
																			timertype = slope
																			slope_dir = any
																			max_slope = 45
																			invert = 1
																			min = landslope_min_strength
																			[
																				{
																					type = play
																					anim = land_anim
																					sync = sync
																					speed = my_speed
																					[
																						{
																							type = skatermodulate
																							timertype = grindlean
																							min = landing_balance_min_strength
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
																			]
																		}
																		{
																			$ManualSpeed_AnimBranch
																		}
																	]
																}
															]
														}
														{
															type = add
															[
																{
																	type = modulate
																	strength = 1.0
																	id = manualbalancemod
																	sync = sync
																	[
																		{
																			type = add
																			[
																				{
																					type = add
																					[
																						{
																							type = balanceadd
																							side = forward
																							blendcurve = balance_blend_curve
																							[
																								{
																									type = balanceadd
																									side = back
																									blendcurve = balance_blend_curve
																									[
																										{
																											type = wobble
																											anim = range_anim
																											[
																												{
																													type = source
																													anim = range_anim
																												}
																											]
																										}
																										{
																											type = add
																											[
																												{
																													type = cycle
																													anim = back_anim
																													speed = my_speed_idle
																													[
																														{
																															type = source
																															anim = back_anim
																														}
																													]
																												}
																												{
																													$ManualSlope_AnimBranch
																													user_params = {
																														forward_anim = back_slopef
																														back_anim = back_slopeb
																														left_anim = back_slopel
																														right_anim = back_sloper
																													}
																												}
																											]
																										}
																									]
																								}
																								{
																									type = add
																									[
																										{
																											type = cycle
																											anim = forward_anim
																											speed = my_speed_idle
																											[
																												{
																													type = source
																													anim = forward_anim
																												}
																											]
																										}
																										{
																											$ManualSlope_AnimBranch
																											user_params = {
																												forward_anim = forward_slopef
																												back_anim = forward_slopeb
																												left_anim = forward_slopel
																												right_anim = forward_sloper
																											}
																										}
																									]
																								}
																							]
																						}
																						{
																							$ManualTurn_AnimBranch
																						}
																					]
																				}
																				{
																					$ManualCrouch_AnimBranch
																				}
																			]
																		}
																	]
																}
																{
																	type = add
																	[
																		{
																			type = modulate
																			strength = 1.0
																			id = manualslopemod
																			sync = sync
																			[
																				{
																					type = skatermodulate
																					timertype = grindlean
																					blendcurve = balance_blend_curve
																					[
																						{
																							$ManualSlope_AnimBranch
																							user_params = {
																								forward_anim = slopef
																								back_anim = slopeb
																								left_anim = slopel
																								right_anim = sloper
																							}
																						}
																					]
																				}
																			]
																		}
																		{
																			type = modulate
																			strength = 0.0
																			id = manualfakeslopemod
																			sync = sync
																			[
																				{
																					$ManualSlope_AnimBranch
																					user_params = {
																						forward_anim = Sk8_Root_Slope_F_D
																						back_anim = Sk8_Root_Slope_B_D
																						left_anim = Sk8_Root_Slope_L_D
																						right_anim = Sk8_Root_Slope_R_D
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
ManualSpeed_AnimBranch = {
	type = skatermodulate
	timertype = grindlean
	min = speed_min_strength
	blendcurve = speed_blend_curve
	[
		{
			type = speedadd
			speed = speed_threshold
			[
				{
					type = cycle
					id = SlowTimer
					anim = slow_anim
					anim_events = on
					speed = my_speed_idle
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
					speed = my_speed_idle
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
	]
}
ManualCrouch_AnimBranch = {
	type = skatermodulate
	timertype = grindlean
	min = crouch_min_strength
	blendcurve = crouch_blend_curve
	blendintime = crouch_blend_time
	[
		{
			type = skatermodulate
			timertype = slope
			slope_dir = any
			max_slope = 45
			invert = 1
			min = crouchslope_min_strength
			[
				{
					type = skatermodulate
					timertype = crouch
					blend_time = crouch_blend_time
					[
						{
							type = skatertimer
							timertype = crouch
							id = CrouchTimer
							anim = crouch_anim
							sync = 0
							[
								{
									id = CrouchSource
									type = source
									anim = crouch_anim
								}
							]
						}
					]
				}
			]
		}
	]
}
ManualTurn_AnimBranch = {
	type = add
	[
		{
			type = skatermodulate
			timertype = turn
			turn_dir = left
			blendcurve = turn_blend_curve
			blendtime = turn_blend_time
			blendtime2 = turn_blend_out_time
			[
				{
					type = source
					anim = turn_left
				}
			]
		}
		{
			type = skatermodulate
			timertype = turn
			turn_dir = right
			blendcurve = turn_blend_curve
			blendtime = turn_blend_time
			blendtime2 = turn_blend_out_time
			[
				{
					type = source
					anim = turn_right
				}
			]
		}
	]
}
ManualSlope_AnimBranch = {
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
