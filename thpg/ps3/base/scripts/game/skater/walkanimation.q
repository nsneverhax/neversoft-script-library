slow_walk_speed = 2
med_walk_speed = 3.6
fast_walk_speed = 7

script Skater_PlayWalkAnim sync = 0 blendduration = ($Walking_data.blendduration)
	handlefliporboardrotateafter
	get_strongest_lifestyle {ignore_spread}
	if gotparam strongest_lifestyle
		switch <strongest_lifestyle>
			case rigger
			<class_idle> = Sk8_W_idle_rigger_F
			case career
			<class_idle> = Sk8_W_idle_career_F
			case hardcore
			<class_idle> = Sk8_W_idle_hardcore_F
		endswitch
	endif
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $Walking_Main_Branch
			blendduration = <blendduration>
			params = {$Walking_data
				walk_idle_standard = <class_idle>
				sync = <sync>
			}
		}
	}
	if anim_animnodeexists id = switchboard
		anim_command {
			target = switchboard
			command = degenerateblend_addbranch
			params = {
				tree = $Empty_Branch
				blendduration = 0.0
			}
		}
	endif
endscript

script Skater_PlaySwitchBoard_Idle 
	if anim_animnodeexists \{id = switchboard}
		anim_command \{target = switchboard
			command = degenerateblend_addbranch
			params = {
				tree = $SwitchBoard_Idle_Branch
				blendduration = 0.0
			}}
	endif
	begin
	if Skater_AnimComplete \{timer = SwitchBoardTimer}
		break
	endif
	DoNextTrick
	wait \{1
		gameframe}
	repeat
endscript

script Skater_PlaySwitchBoard 
	if anim_animnodeexists \{id = switchboard}
		anim_command \{target = switchboard
			command = degenerateblend_addbranch
			params = {
				tree = $SwitchBoard_Branch
				blendduration = 0.0
			}}
	endif
	begin
	if Skater_AnimComplete \{timer = SwitchBoardTimer}
		break
	endif
	DoNextTrick
	wait \{1
		gameframe}
	repeat
endscript

script Skater_TurnOffSwitchBoard 
	if anim_animnodeexists \{id = switchboard}
		anim_command \{target = switchboard
			command = degenerateblend_addbranch
			params = {
				tree = $Empty_Branch
				blendduration = 0.2
			}}
	endif
endscript

script Skate_StartWalkSpeedBranch 
	if anim_animnodeexists \{id = walkspeed}
		anim_command {
			target = walkspeed
			command = degenerateblend_addbranch
			params = {
				tree = $Walking_Speed_Branch_Play_Once
				blendduration = <blendduration>
				params = {$Walking_Start_data
				}
			}
		}
		begin
		if Skater_AnimComplete \{timer = startwalktimer}
			break
		endif
		DoNextTrick
		wait \{1
			gameframe}
		repeat
		AllowStandIdleAnim
		Skate_GotoWalkSpeedCycleBranch
	endif
endscript

script Skate_GotoWalkSpeedCycleBranch \{sync = 0}
	if anim_animnodeexists \{id = walkspeed}
		anim_command {
			target = walkspeed
			command = degenerateblend_addbranch
			params = {
				tree = $Walking_Moving_Branch
				blendduration = 0.0
				params = {$Walking_Cycle_data
					sync = <sync>
				}
			}
		}
	endif
	DontAllowStandIdleAnim
endscript

script Skater_PlaySkateToWalkAnim \{sync = 0
		blendperiod = 0
		speed = 1.0}
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $Skate_To_Stand_Branch
			blendduration = <blendperiod>
			params = {
				skate_to_stand_anim = <anim>
				speed = <speed>
				sync = <sync>
			}
		}
	}
endscript

script Skate_AddSkateToWalkBranch \{sync = 0}
	if anim_animnodeexists \{id = walkspeed}
		anim_command {
			target = walkspeed
			command = degenerateblend_addbranch
			params = {
				tree = $Skate_To_Walk_Speed_Branch
				blendduration = 0.0
				params = {
					sync = <sync>
				}
			}
		}
		begin
		if Skater_AnimComplete \{timer = bodytimer}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script Skate_AddLandBranch 
	if NOT anim_animnodeexists id = walkspeed
		return
	endif
	anim_command {
		target = walkspeed
		command = degenerateblend_addbranch
		params = {
			tree = $Walking_Speed_Branch_Play_Once
			blendduration = <blendduration>
			params = {$Walking_Land_data
			}
		}
	}
	begin
	DoNextTrick
	if Skater_AnimComplete timer = startwalktimer
		break
	endif
	wait 1 gameframe
	repeat
	if NOT anim_animnodeexists id = walkspeed
		return
	endif
	anim_command {
		target = walkspeed
		command = degenerateblend_addbranch
		params = {
			tree = $Walking_Speed_Branch_Cycling
			blendduration = 0.0
			params = {$Walking_Cycle_data
			}
		}
	}
	AllowStandIdleAnim
endscript

script AllowStandIdleAnim 
	if anim_animnodeexists \{id = idle_branch}
		anim_command \{command = modulate_startblend
			target = idle_branch
			params = {
				blendcurve = [
					1.0
					0.0
				]
				blendtime = 2.0
			}}
	endif
endscript

script DontAllowStandIdleAnim 
	if anim_animnodeexists \{id = idle_branch}
		anim_command \{target = idle_branch
			command = modulate_setstrength
			params = {
				strength = 0.0
			}}
	endif
endscript

script Skate_AddStandLandBranch 
	if anim_animnodeexists \{id = walkspeed}
		anim_command {
			target = walkspeed
			command = degenerateblend_addbranch
			params = {
				tree = $Walking_Stand_Land_Branch_Play_Once
				blendduration = <blendduration>
			}
		}
		DontAllowStandIdleAnim
		begin
		DoNextTrick
		if Skater_AnimComplete \{timer = stopwalktimer}
			break
		endif
		wait \{1
			gameframe}
		repeat
		AllowStandIdleAnim
	endif
endscript

script Skate_PlayStopAnim 
	if anim_animnodeexists id = walkspeed
		DontAllowStandIdleAnim
		if anim_animnodeexists id = walkspeed
			walk_getrecenttopspeed
			if (<top_speed> < 6.5)
				walk_which_foot_is_forward
				if gotparam foot
					if (<foot> = right)
						data = $Walking_Stop_Right_Foot_data
						blendduration = 0.3
					else
						data = $Walking_Stop_Left_Foot_data
						blendduration = 0.3
					endif
				endif
			elseif (<top_speed> < 7.0)
				data = $Walking_Stop_Med_data
				blendduration = 0.6
			else
				data = $Walking_Stop_Fast_data
				blendduration = 1.0
			endif
			if gotparam data
				anim_command {
					target = walkspeed
					command = degenerateblend_addbranch
					params = {
						tree = $Walking_Stop_Branch
						blendduration = <blendduration>
						params = {<data>}
					}
				}
			endif
			begin
			if Skater_AnimComplete timer = stopwalktimer
				break
			endif
			DontAllowStandIdleAnim
			DoNextTrick
			wait 1 gameframe
			repeat
		endif
	endif
endscript

script Skate_RemoveWalkSpeedBranch 
	Skate_PlayStopAnim
	if anim_animnodeexists \{id = walkspeed}
		anim_command \{target = walkspeed
			command = degenerateblend_addbranch
			params = {
				tree = $Empty_Branch
				blendduration = 0.0
				params = {
					$Walking_Stop_data
				}
			}}
	endif
	AllowStandIdleAnim
endscript

script Skate_PlayWalkToSkate 
	if anim_animnodeexists \{id = body}
		anim_command \{target = body
			command = degenerateblend_addbranch
			params = {
				tree = $Walk_To_Skate_Branch
				blendduration = 0.0
				params = {
					$Walking_To_Skate_Idle_Data
					sync = 0
				}
			}}
	endif
endscript
Walking_Main_Branch = {
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
							two_bone_chains = Skater_IK_Params
							[
								{
									type = partialswitch
									state = on
									[
										{
											type = degenerateblend
											id = switchboard
										}
										{
											type = applydifference
											[
												{
													type = add
													[
														{
															type = degenerateblend
															id = walkspeed
														}
														{
															type = modulate
															strength = 1.0
															id = idle_branch
															[
																{
																	type = walkmodulate
																	timertype = speed
																	invert = 1
																	speed = walk_speed_threshold
																	[
																		{
																			type = applydifference
																			[
																				{
																					type = nestedtree
																					tree = Walking_Slope_Branch
																					user_params = {
																						slope_default = walk_idle_default
																						slope_forward = walk_idle_forward
																						slope_back = walk_idle_back
																						slope_left = walk_idle_left
																						slope_right = walk_idle_right
																					}
																				}
																				{
																					type = cycle
																					anim = walk_idle_standard
																					[
																						{
																							type = source
																							anim = walk_idle_standard
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
												{
													type = source
													anim = walk_base
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
Walking_Moving_Branch = {
	type = walkingtimer
	id = bodytimer
	anim = walk_slow_straight
	start = my_start
	end = my_end
	[
		{
			type = nestedtree
			tree = Walking_Speed_Branch_Cycling
		}
	]
}
Empty_Branch = {
	type = modulate
	strength = 0
	[
		{
			type = source
			anim = walk_base
		}
	]
}
Walking_Speed_Branch_Play_Once = {
	type = speedtimerthreeway
	id = startwalktimer
	slow_anim = walk_slow_straight
	med_anim = walk_med_straight
	fast_anim = walk_fast_straight
	min_speed = min_walk_speed
	mid_speed = $med_walk_speed
	max_speed = $fast_walk_speed
	slow_speed = 1.0
	med_speed = 1.0
	fast_speed = 1.0
	sync = 0
	[
		{
			type = nestedtree
			tree = Walking_Speed_Branch
		}
	]
}
Walking_Speed_Branch_Cycling = {
	type = speedtimerthreeway
	id = bodytimer
	slow_anim = walk_slow_straight
	med_anim = walk_med_straight
	fast_anim = walk_fast_straight
	min_speed = min_walk_speed
	mid_speed = $med_walk_speed
	max_speed = $fast_walk_speed
	slow_speed = 1.0
	med_speed = 0.9
	fast_speed = 0.8
	cycle = 1
	sync = sync
	[
		{
			type = nestedtree
			tree = Walking_Speed_Branch
		}
	]
}
Walking_Stand_Land_Branch_Play_Once = {
	type = play
	id = stopwalktimer
	anim = sk8_w_jumpidleland_D
	anim_events = on
	[
		{
			type = nestedtree
			tree = Walking_Slope_Branch
			user_params = {
				slope_default = sk8_w_jumpidleland_D
				slope_forward = Sk8_W_JumpIdleLandB_F
				slope_back = Sk8_W_JumpIdleLandF_F
				slope_left = Sk8_W_JumpIdleLandL_F
				slope_right = Sk8_W_JumpIdleLandR_F
			}
		}
	]
}
Walking_Speed_Branch = {
	type = add
	[
		{
			type = walkmodulate
			timertype = speed
			speed = $med_walk_speed
			speed_min = $med_walk_speed
			invert = 1
			[
				{
					type = nestedtree
					tree = Walking_Slow_To_Med_Branch
				}
			]
		}
		{
			type = walkmodulate
			timertype = speed
			speed = $med_walk_speed
			speed_min = $med_walk_speed
			[
				{
					type = nestedtree
					tree = Walking_Med_To_Fast_Branch
				}
			]
		}
	]
}
Walking_Slow_To_Med_Branch = {
	type = add
	[
		{
			type = walkmodulate
			timertype = speed
			speed_min = $slow_walk_speed
			speed = $med_walk_speed
			invert = 1
			[
				{
					type = nestedtree
					tree = Walking_Turn_Branch
					user_params = {
						slope_default_straight = walk_slow_straight
						slope_forward_straight = walk_slow_sloped_forward_straight
						slope_back_straight = walk_slow_sloped_back_straight
						slope_left_straight = walk_slow_sloped_left_straight
						slope_right_straight = walk_slow_sloped_right_straight
						slope_default_turn_left = walk_slow_turn_left
						slope_forward_turn_left = walk_slow_sloped_forward_turn_left
						slope_back_turn_left = walk_slow_sloped_back_turn_left
						slope_left_turn_left = walk_slow_sloped_left_turn_left
						slope_right_turn_left = walk_slow_sloped_right_turn_left
						slope_default_turn_right = walk_slow_turn_right
						slope_forward_turn_right = walk_slow_sloped_forward_turn_right
						slope_back_turn_right = walk_slow_sloped_back_turn_right
						slope_left_turn_right = walk_slow_sloped_left_turn_right
						slope_right_turn_right = walk_slow_sloped_right_turn_right
					}
				}
			]
		}
		{
			type = walkmodulate
			timertype = speed
			speed_min = $slow_walk_speed
			speed = $med_walk_speed
			[
				{
					type = nestedtree
					tree = Walking_Turn_Branch
					user_params = {
						slope_default_straight = walk_med_straight
						slope_forward_straight = walk_med_sloped_forward_straight
						slope_back_straight = walk_med_sloped_back_straight
						slope_left_straight = walk_med_sloped_left_straight
						slope_right_straight = walk_med_sloped_right_straight
						slope_default_turn_left = walk_med_turn_left
						slope_forward_turn_left = walk_med_sloped_forward_turn_left
						slope_back_turn_left = walk_med_sloped_back_turn_left
						slope_left_turn_left = walk_med_sloped_left_turn_left
						slope_right_turn_left = walk_med_sloped_right_turn_left
						slope_default_turn_right = walk_med_turn_right
						slope_forward_turn_right = walk_med_sloped_forward_turn_right
						slope_back_turn_right = walk_med_sloped_back_turn_right
						slope_left_turn_right = walk_med_sloped_left_turn_right
						slope_right_turn_right = walk_med_sloped_right_turn_right
					}
				}
			]
		}
	]
}
Walking_Med_To_Fast_Branch = {
	type = add
	[
		{
			type = walkmodulate
			timertype = speed
			speed_min = $med_walk_speed
			speed = $fast_walk_speed
			invert = 1
			[
				{
					type = nestedtree
					tree = Walking_Turn_Branch
					user_params = {
						slope_default_straight = walk_med_straight
						slope_forward_straight = walk_med_sloped_forward_straight
						slope_back_straight = walk_med_sloped_back_straight
						slope_left_straight = walk_med_sloped_left_straight
						slope_right_straight = walk_med_sloped_right_straight
						slope_default_turn_left = walk_med_turn_left
						slope_forward_turn_left = walk_med_sloped_forward_turn_left
						slope_back_turn_left = walk_med_sloped_back_turn_left
						slope_left_turn_left = walk_med_sloped_left_turn_left
						slope_right_turn_left = walk_med_sloped_right_turn_left
						slope_default_turn_right = walk_med_turn_right
						slope_forward_turn_right = walk_med_sloped_forward_turn_right
						slope_back_turn_right = walk_med_sloped_back_turn_right
						slope_left_turn_right = walk_med_sloped_left_turn_right
						slope_right_turn_right = walk_med_sloped_right_turn_right
					}
				}
			]
		}
		{
			type = walkmodulate
			timertype = speed
			speed_min = $med_walk_speed
			speed = $fast_walk_speed
			[
				{
					type = nestedtree
					tree = Walking_Turn_Branch
					user_params = {
						slope_default_straight = walk_fast_straight
						slope_forward_straight = walk_fast_sloped_forward_straight
						slope_back_straight = walk_fast_sloped_back_straight
						slope_left_straight = walk_fast_sloped_left_straight
						slope_right_straight = walk_fast_sloped_right_straight
						slope_default_turn_left = walk_fast_turn_left
						slope_forward_turn_left = walk_fast_sloped_forward_turn_left
						slope_back_turn_left = walk_fast_sloped_back_turn_left
						slope_left_turn_left = walk_fast_sloped_left_turn_left
						slope_right_turn_left = walk_fast_sloped_right_turn_left
						slope_default_turn_right = walk_fast_turn_right
						slope_forward_turn_right = walk_fast_sloped_forward_turn_right
						slope_back_turn_right = walk_fast_sloped_back_turn_right
						slope_left_turn_right = walk_fast_sloped_left_turn_right
						slope_right_turn_right = walk_fast_sloped_right_turn_right
					}
				}
			]
		}
	]
}
Walking_Turn_Branch = {
	type = add
	[
		{
			type = walkmodulate
			timertype = turn
			turn_dir = any
			blendcurve = turn_blend_curve
			blendtime = turn_blend_time
			invert = 1
			[
				{
					type = nestedtree
					tree = Walking_Slope_Branch
					user_params = {
						slope_default = slope_default_straight
						slope_forward = slope_forward_straight
						slope_back = slope_back_straight
						slope_left = slope_left_straight
						slope_right = slope_right_straight
					}
				}
			]
		}
		{
			type = add
			[
				{
					type = walkmodulate
					timertype = turn
					turn_dir = left
					blendcurve = turn_blend_curve
					blendtime = turn_blend_time
					blendtime2 = turn_blend_out_time
					[
						{
							type = nestedtree
							tree = Walking_Slope_Branch
							user_params = {
								slope_default = slope_default_turn_left
								slope_forward = slope_forward_turn_left
								slope_back = slope_back_turn_left
								slope_left = slope_left_turn_left
								slope_right = slope_right_turn_left
							}
						}
					]
				}
				{
					type = walkmodulate
					timertype = turn
					turn_dir = right
					blendcurve = turn_blend_curve
					blendtime = turn_blend_time
					blendtime2 = turn_blend_out_time
					[
						{
							type = nestedtree
							tree = Walking_Slope_Branch
							user_params = {
								slope_default = slope_default_turn_right
								slope_forward = slope_forward_turn_right
								slope_back = slope_back_turn_right
								slope_left = slope_left_turn_right
								slope_right = slope_right_turn_right
							}
						}
					]
				}
			]
		}
	]
}
Walking_Slope_Branch = {
	type = add
	[
		{
			type = source
			anim = slope_default
		}
		{
			type = add
			[
				{
					type = add
					[
						{
							type = walkmodulate
							timertype = slope
							slope_dir = forward
							max_slope = 45
							[
								{
									type = source
									anim = slope_forward
								}
							]
						}
						{
							type = walkmodulate
							timertype = slope
							slope_dir = back
							max_slope = 45
							[
								{
									type = source
									anim = slope_back
								}
							]
						}
					]
				}
				{
					type = add
					[
						{
							type = walkmodulate
							timertype = slope
							slope_dir = left
							max_slope = 45
							[
								{
									type = source
									anim = slope_left
								}
							]
						}
						{
							type = walkmodulate
							timertype = slope
							slope_dir = right
							max_slope = 45
							[
								{
									type = source
									anim = slope_right
								}
							]
						}
					]
				}
			]
		}
	]
}
Walking_Stop_Branch = {
	type = play
	id = stopwalktimer
	anim = walk_stop_default
	[
		{
			type = nestedtree
			tree = Walking_Slope_Branch
			user_params = {
				slope_default = walk_stop_default
				slope_forward = walk_stop_forward
				slope_back = walk_stop_backward
				slope_left = walk_stop_left
				slope_right = walk_stop_right
			}
		}
	]
}

script HandleFootStepVibration 
	if gotparam \{foot}
		if (<foot> = left)
			vibrate \{actuator = 1
				percent = 10
				duration = 0.1}
		else
			vibrate \{actuator = 0
				percent = 20
				duration = 0.1}
		endif
	endif
endscript
Skate_To_Stand_Branch = {
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
							two_bone_chains = Skater_IK_Params
							[
								{
									type = skatertimer
									timertype = play
									id = bodytimer
									anim = skate_to_stand_anim
									speed = speed
									sync = sync
									anim_events = on
									[
										{
											type = source
											anim = skate_to_stand_anim
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
Skate_To_Walk_Speed_Branch = {
	type = speedtimerthreeway
	id = bodytimer
	slow_anim = Sk8_W_SkToStndWlk_xSlw_Fx
	med_anim = Sk8_W_SkToStndWlk_xMed_Fx
	fast_anim = Sk8_W_SkToStndWlk_xFst_Fx
	min_speed = min_walk_speed
	mid_speed = $med_walk_speed
	max_speed = $fast_walk_speed
	slow_speed = 1.0
	med_speed = 1.0
	fast_speed = 1.0
	sync = sync
	[
		{
			type = add
			[
				{
					type = walkmodulate
					timertype = speed
					speed = $med_walk_speed
					speed_min = $med_walk_speed
					invert = 1
					[
						{
							type = add
							[
								{
									type = walkmodulate
									timertype = speed
									speed_min = $slow_walk_speed
									speed = $med_walk_speed
									invert = 1
									[
										{
											type = source
											anim = Sk8_W_SkToStndWlk_xSlw_Fx
										}
									]
								}
								{
									type = walkmodulate
									timertype = speed
									speed_min = $slow_walk_speed
									speed = $med_walk_speed
									[
										{
											type = source
											anim = Sk8_W_SkToStndWlk_xMed_Fx
										}
									]
								}
							]
						}
					]
				}
				{
					type = walkmodulate
					timertype = speed
					speed = $med_walk_speed
					speed_min = $med_walk_speed
					[
						{
							type = add
							[
								{
									type = walkmodulate
									timertype = speed
									speed_min = $med_walk_speed
									speed = $fast_walk_speed
									invert = 1
									[
										{
											type = source
											anim = Sk8_W_SkToStndWlk_xMed_Fx
										}
									]
								}
								{
									type = walkmodulate
									timertype = speed
									speed_min = $med_walk_speed
									speed = $fast_walk_speed
									[
										{
											type = source
											anim = Sk8_W_SkToStndWlk_xFst_Fx
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
Walk_To_Skate_Branch = {
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
							two_bone_chains = Skater_IK_Params
							[
								{
									type = skatertimer
									timertype = play
									id = bodytimer
									anim = walk_to_skate_default
									speed = speed
									sync = sync
									anim_events = on
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
																	type = skatermodulate
																	timertype = slope
																	slope_dir = forward
																	max_slope = 45
																	[
																		{
																			type = source
																			anim = walk_to_skate_forward
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
																			anim = walk_to_skate_backward
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
																			anim = walk_to_skate_left
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
																			anim = walk_to_skate_right
																		}
																	]
																}
															]
														}
													]
												}
												{
													type = source
													anim = walk_to_skate_default
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
SwitchBoard_Idle_Branch = {
	type = play
	id = SwitchBoardTimer
	anim = sk8_w_switchboard_F
	[
		{
			type = source
			anim = sk8_w_switchboard_F
		}
	]
}
SwitchBoard_Branch = {
	type = speedtimerthreeway
	id = SwitchBoardTimer
	slow_anim = Sk8_W_SwitchBoardWlk_xSlw_Fx
	med_anim = Sk8_W_SwitchBoardWlk_xMed_Fx
	fast_anim = Sk8_W_SwitchBoardWlk_xFst_Fx
	min_speed = min_walk_speed
	mid_speed = $med_walk_speed
	max_speed = $fast_walk_speed
	slow_speed = 1.0
	med_speed = 1.0
	fast_speed = 1.0
	sync = sync
	[
		{
			type = add
			[
				{
					type = walkmodulate
					timertype = speed
					speed = $med_walk_speed
					speed_min = $med_walk_speed
					invert = 1
					[
						{
							type = add
							[
								{
									type = walkmodulate
									timertype = speed
									speed_min = $slow_walk_speed
									speed = $med_walk_speed
									invert = 1
									[
										{
											type = source
											anim = Sk8_W_SwitchBoardWlk_xSlw_Fx
										}
									]
								}
								{
									type = walkmodulate
									timertype = speed
									speed_min = $slow_walk_speed
									speed = $med_walk_speed
									[
										{
											type = source
											anim = Sk8_W_SwitchBoardWlk_xMed_Fx
										}
									]
								}
							]
						}
					]
				}
				{
					type = walkmodulate
					timertype = speed
					speed = $med_walk_speed
					speed_min = $med_walk_speed
					[
						{
							type = add
							[
								{
									type = walkmodulate
									timertype = speed
									speed_min = $med_walk_speed
									speed = $fast_walk_speed
									invert = 1
									[
										{
											type = source
											anim = Sk8_W_SwitchBoardWlk_xMed_Fx
										}
									]
								}
								{
									type = walkmodulate
									timertype = speed
									speed_min = $med_walk_speed
									speed = $fast_walk_speed
									[
										{
											type = source
											anim = Sk8_W_SwitchBoardWlk_xFst_Fx
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

script PlayClimbAnim \{tree = $Climb_Branch}
	if anim_animnodeexists \{id = body}
		anim_command {
			target = body
			command = degenerateblend_addbranch
			params = {
				tree = <tree>
				blendduration = <blendduration>
				params = {<data>
					sync = <sync>
					cycle = <cycle>
					dont_update = <dont_update>
					x_vel = <x_vel>
					y_vel = <y_vel>
				}
			}
		}
	endif
endscript
Climb_Branch = {
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
							two_bone_chains = Skater_IK_with_hands_Params
							[
								{
									type = climbtimer
									id = climbtimer
									v_anim = v_speed_anim
									h_anim = h_speed_anim
									cycle = cycle
									anim_events = on
									[
										{
											type = nestedtree
											tree = Climb_blend_branch
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
Climb_Land_Branch = {
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
							two_bone_chains = Skater_IK_with_hands_Params
							[
								{
									type = play
									anim = center
									id = climbtimer
									[
										{
											type = nestedtree
											tree = Climb_blend_branch
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
Climb_blend_branch = {
	type = climbblend
	x = x_vel
	y = y_vel
	dont_update_xy = dont_update
	[
		{
			type = source
			anim = center
		}
		{
			type = source
			anim = up
		}
		{
			type = source
			anim = upright
		}
		{
			type = source
			anim = right
		}
		{
			type = source
			anim = downright
		}
		{
			type = source
			anim = down
		}
		{
			type = source
			anim = downleft
		}
		{
			type = source
			anim = left
		}
		{
			type = source
			anim = upleft
		}
	]
}
Climb_single_anim_Branch = {
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
							two_bone_chains = Skater_IK_with_hands_Params
							[
								{
									type = cycle
									anim = my_anim
									id = bodytimer
									[
										{
											type = source
											anim = my_anim
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

script PlayHangAnim \{blendduration = 0.1}
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $Hang_AnimBranch
			blendduration = <blendduration>
			params = {<...>}
		}
	}
endscript
Hang_AnimBranch = {
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
							two_bone_chains = Skater_IK_hands_only_Params
							[
								{
									type = cycle
									anim = level
									id = bodytimer
									speed = speed
									anim_events = on
									[
										{
											type = blendnactive
											active_value_source = hang_angle
											active_value_lower_bound = -45
											active_value_upper_bound = 45
											[
												{
													type = source
													anim = right
												}
												{
													type = source
													anim = level
												}
												{
													type = source
													anim = left
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
