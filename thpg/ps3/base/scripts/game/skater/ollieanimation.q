
script Skater_PlayOllieAnim sync = 0
	handlefliporboardrotateafter
	if NOT gotparam pose_capture
		pose_capture = 1
	endif
	if (<pose_capture> = 1)
		if anim_animnodeexists id = BodyPoseCapture
			anim_command {
				target = BodyPoseCapture
				command = posecapture_capture
			}
		endif
	endif
	if innollie
		flipandrotate
	endif
	if gotparam boneless
		settags UsingBonelessAnims
	else
		removetags tags = [UsingBonelessAnims]
	endif
	setvertcorrectiontime <blendduration>
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $Ollie_AnimBranch
			blendduration = <blendduration>
			params = {
				<...>
			}
		}
	}
	if (<sync> = 0)
		anim_command {
			target = body
			command = degenerateblend_skipnextupdate
		}
	endif
	if gotparam groundgone
		anim_command {
			target = olliemod_fake_ground
			command = modulate_setstrength
			params = {
				strength = 0.0
			}
		}
		if anim_animnodeexists id = groundmod_fake_ground
			anim_command {
				target = groundmod_fake_ground
				command = modulate_setstrength
				params = {
					strength = 0.0
				}
			}
		endif
	endif
endscript

script Skater_PlayFlipTrickAnim 
	if gotparam isextra
		sync = 1
		blendduration = 0.1
	else
		sync = 0
		blendduration = 0.2
	endif
	if isboardrotateafterset
		always = on
	else
		always = off
	endif
	if NOT anim_animnodeexists id = airtrick_takeoff
		Skater_PlayOllieAnim $Ollie_data sync = 1
	endif
	static_tree_ik_off
	if getsingletag UsingBonelessAnims
		Skater_PlayOllieAnim $Ollie_data sync = 1
	endif
	anim_command {
		target = airtrick_takeoff
		command = degenerateblend_addbranch
		params = {
			tree = $FlipTrick_AnimBranch
			blendduration = <blendduration>
			params = {
				anim = <tricktakeoff_anim>
				timerid = FliptrickTimer
				sync = <sync>
				always = <always>
			}
		}
	}
	anim_command {
		target = airtrick_apex
		command = degenerateblend_addbranch
		params = {
			tree = $FlipTrick_AnimBranch
			blendduration = <blendduration>
			params = {
				anim = <trickapex_anim>
				timerid = FliptrickApexTimer
				sync = <sync>
				always = <always>
			}
		}
	}
	anim_command {
		target = airtrick_land
		command = degenerateblend_addbranch
		params = {
			tree = $FlipTrick_AnimBranch
			blendduration = <blendduration>
			params = {
				anim = <trickland_anim>
				timerid = FliptrickLandTimer
				sync = <sync>
				always = <always>
			}
		}
	}
	Skater_HandleOllieModulation <...> anim = <tricktakeoff_anim>
endscript

script Skater_PlayGrabTrickAnim 
	if gotparam isextra
		sync = 1
	else
		sync = 0
	endif
	blendduration = <blendintime>
	blendcurve = <BlendInCurve>
	if isboardrotateafterset
		always = on
	else
		always = off
	endif
	if NOT anim_animnodeexists id = airtrick_takeoff
		Skater_PlayOllieAnim $Ollie_data sync = 1
	else
		if lastwasjumpboneless
			Skater_PlayOllieAnim $Ollie_data sync = 1
		endif
	endif
	anim_command {
		target = airtrick_takeoff
		command = degenerateblend_addbranch
		params = {
			tree = $GrabTrick_AnimBranchNoIdle
			blendduration = <blendduration>
			params = {
				init = <takeoff_init>
				out = <takeoff_out>
				intimerid = grabtrickintimer
				outtimerid = GrabtrickTimer
				sync = <sync>
				always = <always>
			}
		}
	}
	anim_command {
		target = airtrick_apex
		command = degenerateblend_addbranch
		params = {
			tree = $GrabTrick_AnimBranch
			blendduration = <blendduration>
			params = {
				init = <apex_init>
				out = <apex_out>
				idle = <apex_idle>
				intimerid = GrabtrickApexInTimer
				outtimerid = GrabtrickApexTimer
				sync = <sync>
				always = <always>
			}
		}
	}
	anim_command {
		target = airtrick_land
		command = degenerateblend_addbranch
		params = {
			tree = $GrabTrick_AnimBranchNoIdle
			blendduration = <blendduration>
			params = {
				init = <land_init>
				out = <land_out>
				intimerid = GrabtrickLandInTimer
				outtimerid = GrabtrickLandTimer
				sync = <sync>
				always = <always>
			}
		}
	}
	if innollie
		Nollie = 1
	endif
	anim_command {
		target = airtrick_spin
		command = degenerateblend_addbranch
		params = {
			tree = $OllieSpin_AnimBranch
			blendduration = 0
			params = {
				spinlook_anim = <spin_look>
				spinleft_anim = <spin_left>
				spinright_anim = <spin_right>
				vert_lr_mod_id = grabmod_spinlr_vert
				flat_lr_mod_id = grabmod_spinlr_flat
				vert_look_mod_id = grabmod_spinlook_vert
				flat_look_mod_id = grabmod_spinlook_flat
				sync = 1
				Nollie = <Nollie>
			}
		}
	}
	Skater_GrabHandleOllieModulation {
		blendtime = <blendduration>
		blendcurve = <blendcurve>
	}
endscript

script Skater_HandleOllieModulation 
	if NOT anim_animnodeexists id = olliemod_apex_foot
		return
	endif
	if gotparam no_apex_foot
		anim_command {
			target = olliemod_apex_foot
			command = modulate_startblend
			params = {
				blendcurve = <no_apex_foot>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
	endif
	if lastwasjumpboneless
		anim_command {
			target = olliemod_takeoff_foot
			command = modulate_startblend
			params = {
				blendcurve = [0.0 , 1.0]
				blendtime = 0.1
			}
		}
		anim_command {
			target = olliemod_takeoff_lr
			command = modulate_startblend
			params = {
				blendcurve = [0.0 , 1.0]
				blendtime = 0.1
			}
		}
	else
		if gotparam no_takeoff_foot
			anim_command {
				target = olliemod_takeoff_foot
				command = modulate_startblend
				params = {
					blendcurve = <no_takeoff_foot>
					anim = <anim>
					blendtime = <blendtime>
				}
			}
		endif
		if gotparam no_takeoff_lr
			anim_command {
				target = olliemod_takeoff_lr
				command = modulate_startblend
				params = {
					blendcurve = <no_takeoff_lr>
					anim = <anim>
					blendtime = <blendtime>
				}
			}
		endif
	endif
	if gotparam no_takeoff_arm
		anim_command {
			target = olliemod_takeoff_arm
			command = modulate_startblend
			params = {
				blendcurve = <no_takeoff_arm>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
	endif
	if gotparam no_spin_lr
		anim_command {
			target = olliemod_apex_spinlr_vert
			command = modulate_startblend
			params = {
				blendcurve = <no_spin_lr>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
		anim_command {
			target = olliemod_takeoff_spinlr_vert
			command = modulate_startblend
			params = {
				blendcurve = <no_spin_lr>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
		anim_command {
			target = olliemod_land_spinlr_vert
			command = modulate_startblend
			params = {
				blendcurve = <no_spin_lr>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
		anim_command {
			target = olliemod_apex_spinlr_flat
			command = modulate_startblend
			params = {
				blendcurve = <no_spin_lr>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
		anim_command {
			target = olliemod_takeoff_spinlr_flat
			command = modulate_startblend
			params = {
				blendcurve = <no_spin_lr>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
		anim_command {
			target = olliemod_land_spinlr_flat
			command = modulate_startblend
			params = {
				blendcurve = <no_spin_lr>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
	endif
	if gotparam no_land_spinlook
		anim_command {
			target = olliemod_land_spinlook_vert
			command = modulate_startblend
			params = {
				blendcurve = <no_land_spinlook>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
		anim_command {
			target = olliemod_land_spinlook_flat
			command = modulate_startblend
			params = {
				blendcurve = <no_land_spinlook>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
	endif
	if gotparam no_takeoff_spinlook
		anim_command {
			target = olliemod_takeoff_spinlook_vert
			command = modulate_startblend
			params = {
				blendcurve = <no_takeoff_spinlook>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
		anim_command {
			target = olliemod_takeoff_spinlook_flat
			command = modulate_startblend
			params = {
				blendcurve = <no_takeoff_spinlook>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
	endif
	if gotparam no_apex_spinlook
		anim_command {
			target = olliemod_apex_spinlook_vert
			command = modulate_startblend
			params = {
				blendcurve = <no_apex_spinlook>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
		anim_command {
			target = olliemod_apex_spinlook_flat
			command = modulate_startblend
			params = {
				blendcurve = <no_apex_spinlook>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
	endif
	if gotparam no_apex_arm
		anim_command {
			target = olliemod_apex_arm
			command = modulate_startblend
			params = {
				blendcurve = <no_apex_arm>
				anim = <anim>
				blendtime = <blendtime>
			}
		}
	endif
endscript

script Skater_GrabHandleOllieModulation 
	Skater_HandleOllieModulation {
		blendtime = <blendtime>
		no_apex_foot = <blendcurve>
		no_takeoff_foot = <blendcurve>
		no_takeoff_arm = <blendcurve>
		no_spin_lr = <blendcurve>
		no_takeoff_lr = <blendcurve>
		no_land_spinlook = <blendcurve>
		no_takeoff_spinlook = <blendcurve>
		no_apex_spinlook = <blendcurve>
		no_apex_arm = <blendcurve>
	}
	InverseBlendCurve = <blendcurve>
	getarraysize <blendcurve>
	i = 0
	begin
	value = (1.0 - (<blendcurve> [<i>]))
	setarrayelement arrayname = InverseBlendCurve index = <i> newvalue = <value>
	i = (<i> + 1)
	repeat <array_size>
	if NOT anim_animnodeexists id = grabmod_spinlr_vert
		return
	endif
	anim_command {
		target = grabmod_spinlr_vert
		command = modulate_startblend
		params = {
			blendcurve = <InverseBlendCurve>
			blendtime = <blendtime>
		}
	}
	anim_command {
		target = grabmod_spinlr_flat
		command = modulate_startblend
		params = {
			blendcurve = <InverseBlendCurve>
			blendtime = <blendtime>
		}
	}
	anim_command {
		target = grabmod_spinlook_vert
		command = modulate_startblend
		params = {
			blendcurve = <InverseBlendCurve>
			blendtime = <blendtime>
		}
	}
	anim_command {
		target = grabmod_spinlook_flat
		command = modulate_startblend
		params = {
			blendcurve = <InverseBlendCurve>
			blendtime = <blendtime>
		}
	}
	anim_command {
		target = grabmod_idle
		command = modulate_startblend
		params = {
			blendcurve = <InverseBlendCurve>
			blendtime = <blendtime>
		}
	}
endscript

script Skater_ClearAirtrickAnims blendduration = 0
	if NOT anim_animnodeexists id = airtrick_takeoff
		return
	endif
	anim_command {
		target = airtrick_takeoff
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = <blendduration>
			params = {}
		}
	}
	anim_command {
		target = airtrick_apex
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = <blendduration>
			params = {}
		}
	}
	anim_command {
		target = airtrick_land
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = <blendduration>
			params = {}
		}
	}
	anim_command {
		target = airtrick_spin
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = <blendduration>
			params = {}
		}
	}
	if NOT onground
		anim_command {
			target = boardrotate
			command = boardrotate_update
			params = {}
		}
	endif
endscript
Ollie_AnimBranch = {
	type = applydifference
	[
		{
			type = degenerateblend
			id = slopeblend
		}
		{
			type = skaterflip
			[
				{
					type = boardrotate
					id = boardrotate
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
											id = landpartialblend
										}
										{
											type = applydifference
											[
												{
													type = degenerateblend
													id = olliesidelandings
												}
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
																			$OllieUpper_AnimBranch
																		}
																		{
																			type = degenerateblend
																			id = ollieextras
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
	]
}
OllieUpper_AnimBranch = {
	type = add
	[
		{
			type = add
			[
				{
					type = add
					[
						{
							type = ollielandblend
							blendcurve = land_blend_curve
							blendintime = land_blend_time
							maxblendtime = land_blend_max
							blendthreshold = land_blend_threshold
							holdtime = land_hold_time
							id = ollielandblend
							sync = sync
							[
								{
									type = takeoffblend
									blendcurve = takeoff_blend_curve
									blendintime = takeoff_blend_time
									id = takeoffblend
									sync = sync
									strength = takeoffblendstart
									[
										{
											type = add
											[
												{
													$OllieTakeOff_AnimBranch
												}
												{
													type = degenerateblend
													id = ollieextras_takeoff
												}
											]
										}
										{
											type = add
											[
												{
													type = add
													[
														{
															$OllieApex_AnimBranch
														}
														{
															type = degenerateblend
															id = ollieextras_apex
														}
													]
												}
												{
													$OllieArmApex_AnimBranch
												}
											]
										}
									]
								}
								{
									type = add
									[
										{
											$OllieLand_AnimBranch
										}
										{
											type = degenerateblend
											id = ollieextras_land
										}
									]
								}
							]
						}
						{
							$OllieArmTakeoff_AnimBranch
						}
					]
				}
				{
					type = degenerateblend
					id = airtrick_spin
				}
			]
		}
		{
			$OllieFakeGround_AnimBranch
		}
	]
}
OllieFakeGround_AnimBranch = {
	type = modulate
	id = olliemod_fake_ground
	strength = 1.0
	[
		{
			type = skatermodulate
			timertype = vert
			invert = 1
			[
				{
					type = skatertimer
					timertype = play
					id = takeofftimer
					sync = sync
					anim = takeoff_ground_anim
					[
						{
							type = source
							anim = takeoff_ground_anim
						}
					]
				}
			]
		}
	]
}
OllieArmTakeoff_AnimBranch = {
	type = add
	[
		{
			type = modulate
			strength = 1.0
			id = olliemod_takeoff_foot
			[
				{
					type = skatertimer
					timertype = play
					id = foottakeofftimer
					sync = sync
					anim = takeoff_feet_anim
					[
						{
							type = source
							anim = takeoff_feet_anim
						}
					]
				}
			]
		}
		{
			type = modulate
			strength = 1.0
			id = olliemod_takeoff_arm
			[
				{
					type = skatertimer
					timertype = play
					id = armtakeofftimer
					sync = sync
					anim = takeoff_arm_anim
					[
						{
							type = source
							anim = takeoff_arm_anim
						}
					]
				}
			]
		}
	]
}
OllieSpin_AnimBranch = {
	type = add
	[
		{
			type = skatertimer
			timertype = spin
			anim = spinlook_anim
			Nollie = Nollie
			[
				{
					type = skatermodulate
					timertype = vert
					invert = 1
					[
						{
							$OllieSpinSub_AnimBranch
							user_params = {
								look_mod_id = vert_look_mod_id
								lr_mod_id = vert_lr_mod_id
							}
						}
					]
				}
			]
		}
		{
			type = skatertimer
			timertype = vertspin
			anim = spinlook_anim
			[
				{
					type = skatermodulate
					timertype = vert
					[
						{
							$OllieSpinSub_AnimBranch
							user_params = {
								look_mod_id = flat_look_mod_id
								lr_mod_id = flat_lr_mod_id
							}
						}
					]
				}
			]
		}
	]
}
OllieSpinSub_AnimBranch = {
	type = add
	[
		{
			type = modulate
			strength = 1.0
			id = look_mod_id
			sync = sync
			[
				{
					type = skatermodulate
					timertype = speed
					speed = Land_speed_threshold
					min = 0.1
					[
						{
							type = source
							anim = spinlook_anim
						}
					]
				}
			]
		}
		{
			type = modulate
			strength = 1.0
			id = lr_mod_id
			sync = sync
			[
				{
					type = spinleftrightadd
					induration = Spin_in_duration
					outduration = Spin_out_duration
					[
						{
							type = source
							anim = spinleft_anim
						}
						{
							type = source
							anim = spinright_anim
						}
					]
				}
			]
		}
	]
}
OllieTakeOff_AnimBranch = {
	type = add
	[
		{
			type = add
			[
				{
					type = add
					[
						{
							id = TakeoffSource
							type = source
							anim = takeoff_anim
						}
						{
							type = modulate
							strength = 1.0
							id = olliemod_takeoff_lr
							[
								{
									type = spinleftrighttimer
									anim = takeoff_LR_anim
									[
										{
											type = source
											anim = takeoff_LR_anim
										}
									]
								}
							]
						}
					]
				}
				{
					$OllieSpin_AnimBranch
					user_params = {
						spinlook_anim = takeoff_spinlook_anim
						spinleft_anim = takeoff_spinleft_anim
						spinright_anim = takeoff_spinright_anim
						vert_lr_mod_id = olliemod_takeoff_spinlr_vert
						vert_look_mod_id = olliemod_takeoff_spinlook_vert
						flat_lr_mod_id = olliemod_takeoff_spinlr_flat
						flat_look_mod_id = olliemod_takeoff_spinlook_flat
					}
				}
			]
		}
		{
			type = degenerateblend
			id = airtrick_takeoff
		}
	]
}
OllieApex_AnimBranch = {
	type = add
	[
		{
			type = add
			[
				{
					type = modulate
					strength = 1.0
					id = olliemod_apex_foot
					[
						{
							type = skatermodulate
							timertype = speed
							speed = Land_speed_threshold
							min = 0.1
							[
								{
									type = apextimer
									anim = apex_foot_anim
									[
										{
											type = add
											[
												{
													type = add
													[
														{
															type = skatermodulate
															timertype = spin
															angle = 0
															range = 90
															[
																{
																	type = source
																	anim = apex_foot_anim
																}
															]
														}
														{
															type = skatermodulate
															timertype = spin
															angle = 90
															range = 90
															[
																{
																	type = source
																	anim = apex_foot90_anim
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
															timertype = spin
															angle = 180
															range = 90
															[
																{
																	type = source
																	anim = apex_foot180_anim
																}
															]
														}
														{
															type = skatermodulate
															timertype = spin
															angle = 270
															range = 90
															[
																{
																	type = source
																	anim = apex_foot270_anim
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
				{
					$OllieSpin_AnimBranch
					user_params = {
						spinlook_anim = apex_spinlook_anim
						spinleft_anim = apex_spinleft_anim
						spinright_anim = apex_spinright_anim
						vert_lr_mod_id = olliemod_apex_spinlr_vert
						vert_look_mod_id = olliemod_apex_spinlook_vert
						flat_lr_mod_id = olliemod_apex_spinlr_flat
						flat_look_mod_id = olliemod_apex_spinlook_flat
					}
				}
			]
		}
		{
			type = degenerateblend
			id = airtrick_apex
		}
	]
}
OllieArmApex_AnimBranch = {
	type = modulate
	strength = 1.0
	id = olliemod_apex_arm
	[
		{
			type = apextimer
			anim = apex_arm_anim
			[
				{
					type = source
					anim = apex_arm_anim
				}
			]
		}
	]
}
OllieLand_AnimBranch = {
	type = add
	[
		{
			type = add
			[
				{
					id = LandSource
					type = source
					anim = land_anim
				}
				{
					$OllieSpin_AnimBranch
					user_params = {
						spinlook_anim = land_spinlook_anim
						spinleft_anim = land_spinleft_anim
						spinright_anim = land_spinright_anim
						vert_lr_mod_id = olliemod_land_spinlr_vert
						vert_look_mod_id = olliemod_land_spinlook_vert
						flat_lr_mod_id = olliemod_land_spinlr_flat
						flat_look_mod_id = olliemod_land_spinlook_flat
					}
				}
			]
		}
		{
			type = degenerateblend
			id = airtrick_land
		}
	]
}
FlipTrick_AnimBranch = {
	type = boardrotate
	always = always
	[
		{
			type = skatertimer
			timertype = play
			id = timerid
			anim = anim
			sync = sync
			anim_events = on
			[
				{
					type = source
					anim = anim
				}
			]
		}
	]
}
GrabTrick_AnimBranch = {
	type = boardrotate
	always = always
	[
		{
			type = add
			[
				{
					type = skateridleswitch
					input = Grab
					[
						{
							type = skatertimer
							timertype = play
							anim = init
							id = intimerid
							sync = sync
							[
								{
									type = source
									anim = init
								}
							]
						}
						{
							type = skatertimer
							timertype = grabout
							anim = out
							id = outtimerid
							sync = sync
							[
								{
									type = source
									anim = out
								}
							]
						}
					]
				}
				{
					type = modulate
					strength = 0.0
					id = grabmod_idle
					sync = sync
					[
						{
							type = cycle
							anim = idle
							[
								{
									type = source
									anim = idle
								}
							]
						}
					]
				}
			]
		}
	]
}
GrabTrick_AnimBranchNoIdle = {
	type = boardrotate
	always = always
	[
		{
			type = skateridleswitch
			input = Grab
			[
				{
					type = skatertimer
					timertype = play
					anim = init
					id = intimerid
					sync = sync
					[
						{
							type = source
							anim = init
						}
					]
				}
				{
					type = skatertimer
					timertype = grabout
					anim = out
					id = outtimerid
					sync = sync
					[
						{
							type = source
							anim = out
						}
					]
				}
			]
		}
	]
}
