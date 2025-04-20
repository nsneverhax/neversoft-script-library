
script Skater_PlayOnGroundAnim sync = 0
	cleareventhandlergroup OngroundAnims
	if NOT gotparam no_idles
		seteventhandler event = playidleanim scr = playidleanim group = OngroundAnims response = call_script
	endif
	if NOT gotparam revert
		if NOT gotparam no_events
			seteventhandler event = playkickanim scr = playkickanim group = OngroundAnims response = call_script
			seteventhandler event = PlayBrakeAnim scr = PlayBrakeAnim group = OngroundAnims response = call_script
		endif
	endif
	finishedkick
	if NOT gotparam data
		data = $OnGround_data
	endif
	if NOT gotparam blendduration
		if structurecontains structure = <data> blendduration
			blendduration = (<data>.blendduration)
		else
			blendduration = 0
		endif
	endif
	if landedfromvert
		slope_blend_time = 0.25
	else
		slope_blend_time = 0.0
	endif
	handlefliporboardrotateafter
	if anim_animnodeexists id = BodyPoseCapture
		anim_command {
			target = BodyPoseCapture
			command = posecapture_capture
		}
	endif
	if gotparam mirror
		tree = $Mirrored_AnimBranch
		subtree = OnGround_AnimBranch
	else
		tree = $OnGround_AnimBranch
	endif
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = <tree>
			blendduration = <blendduration>
			params = {<data>
				sync = <sync>
				subtree = <subtree>
				mirror = <mirror>
				slope_blend_time = <slope_blend_time>
			}
		}
	}
	if gotparam no_land
		obj_getid
		launchevent type = playidleanim target = <objid>
		return
	endif
	if NOT gotparam extradata
		if gotparam stopped_out
			<extradata> = ($StoppedOut_Data)
		elseif gotparam revert
			if gotparam Cess
				if NOT gotparam backside
					<extradata> = ($Cess_Data)
				else
					<extradata> = ($BSCess_Data)
				endif
			else
				if NOT gotparam backside
					<extradata> = ($Revert_Data)
				else
					<extradata> = ($BSRevert_Data)
				endif
			endif
		elseif gotparam enter_nollie
			<extradata> = ($ollie_to_nollie_data)
		elseif gotparam was_backward
			<extradata> = ($Slope_Turnaround_Data)
		else
			<extradata> = ($land_data)
			if anim_animnodeexists id = slopeblend
				Skater_PlayOllieSideLandAnims
			endif
		endif
	endif
	if gotparam percent
		dont_spawn = 1
	endif
	if gotparam dont_spawn
		Skater_PlayExtraOnGroundBranch {data = <extradata> percent = <percent> sync = <sync> blendduration = <blendduration> reverse_turns = <mirror>}
	else
		obj_spawnscriptnow Skater_PlayExtraOnGroundBranch params = {data = <extradata> sync = <sync> blendduration = <blendduration> reverse_turns = <mirror>}
	endif
endscript
OnGround_AnimBranch = {
	type = ik
	id = ik
	two_bone_chains = Skater_IK_Params
	[
		{
			type = applydifference
			[
				{
					type = nestedtree
					tree = onground_fakeground_branch
				}
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
													type = degenerateblend
													id = ongroundextras
												}
												{
													type = applydifference
													[
														{
															type = degenerateblend
															id = curbsnapextras
														}
														{
															type = nestedtree
															tree = OnGround_Main_Branch
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
onground_fakeground_branch = {
	type = modulate
	strength = 1.0
	id = groundmod_fake_ground
	[
		{
			type = skatertimer
			timertype = jump
			anim = takeoffground_anim
			[
				{
					type = skatermodulate
					timertype = offwhenfinished
					anim = takeoffground_anim
					[
						{
							type = source
							anim = takeoffground_anim
						}
					]
				}
			]
		}
	]
}
OnGround_Main_Branch = {
	type = slopeblend
	min_slope = 0
	max_slope = 45
	blend_time = slope_blend_time
	[
		{
			type = skaterturntimer
			anim = base_neutral_slow
			blendcurve = turn_blend_curve
			mirror = mirror
			[
				{
					type = speedblend
					speed = speed_threshold
					[
						{
							type = source
							anim = base_neutral_slow
							id = bodysource
						}
						{
							type = source
							anim = base_neutral_fast
						}
					]
				}
			]
		}
		{
			type = sloperingtimer
			anim = base_slope45_slow
			mirror = mirror
			[
				{
					type = slopeblend
					min_slope = 45
					max_slope = 90
					blend_time = slope_blend_time
					[
						{
							type = speedblend
							speed = speed_threshold
							[
								{
									type = source
									anim = base_slope45_slow
								}
								{
									type = source
									anim = base_slope45_fast
								}
							]
						}
						{
							type = speedblend
							speed = speed_threshold
							[
								{
									type = source
									anim = base_slope90_slow
								}
								{
									type = source
									anim = base_slope90_fast
								}
							]
						}
					]
				}
			]
		}
	]
}
onground_diff_blend_main_branch = {
	type = speedblend
	speed = speed_threshold
	[
		{
			type = nestedtree
			tree = onground_diff_blend_sub_branch
			user_params = {
				flat = flat_slow
				partial = partial_slow
				turn_left = turn_left_slow
				turn_right = turn_right_slow
				slope_forward_45 = slope_forward_slow_45
				slope_forward_90 = slope_forward_slow_90
				slope_back_45 = slope_back_slow_45
				slope_back_90 = slope_back_slow_90
				slope_left_45 = slope_left_slow_45
				slope_left_90 = slope_left_slow_90
				slope_right_45 = slope_right_slow_45
				slope_right_90 = slope_right_slow_90
			}
		}
		{
			type = nestedtree
			tree = onground_diff_blend_sub_branch
			user_params = {
				flat = flat_fast
				partial = partial_fast
				turn_left = turn_left_fast
				turn_right = turn_right_fast
				slope_forward_45 = slope_forward_fast_45
				slope_forward_90 = slope_forward_fast_90
				slope_back_45 = slope_back_fast_45
				slope_back_90 = slope_back_fast_90
				slope_left_45 = slope_left_fast_45
				slope_left_90 = slope_left_fast_90
				slope_right_45 = slope_right_fast_45
				slope_right_90 = slope_right_fast_90
			}
		}
	]
}
onground_diff_blend_sub_branch = {
	type = add
	[
		{
			type = source
			anim = partial
		}
		{
			type = blendnactive
			active_value_source = slope_any
			active_value_lower_bound = 0
			active_value_upper_bound = 90
			[
				{
					type = nestedtree
					tree = onground_diff_blend_turn_branch
				}
				{
					type = nestedtree
					tree = onground_diff_blend_slope_branch
					user_params = {
						forward = slope_forward_45
						back = slope_back_45
						left = slope_left_45
						right = slope_right_45
					}
				}
				{
					type = nestedtree
					tree = onground_diff_blend_slope_branch
					user_params = {
						forward = slope_forward_90
						back = slope_back_90
						left = slope_left_90
						right = slope_right_90
					}
				}
			]
		}
	]
}
onground_diff_blend_turn_branch = {
	type = blendnactive
	active_value_source = turn
	active_value_lower_bound = -1
	active_value_upper_bound = 1
	active_value_curve = turn_active_value_curve
	[
		{
			type = source
			anim = turn_left
		}
		{
			type = source
			anim = flat
		}
		{
			type = source
			anim = turn_right
		}
	]
}
onground_diff_blend_turn_idle_branch = {
	type = blendnactive
	active_value_source = turn
	active_value_lower_bound = -1
	active_value_upper_bound = 1
	active_value_curve = turn_active_value_curve
	[
		{
			type = cycle
			anim = turn_left
			[
				{
					type = source
					anim = turn_left
				}
			]
		}
		{
			type = cycle
			anim = flat
			[
				{
					type = source
					anim = flat
				}
			]
		}
		{
			type = cycle
			anim = turn_right
			[
				{
					type = source
					anim = turn_right
				}
			]
		}
	]
}
onground_diff_blend_slope_branch = {
	type = blendnactive
	active_value_source = slope_dir
	active_value_lower_bound = 0
	active_value_upper_bound = 6.2829995
	active_value_curve = turn_active_value_curve
	[
		{
			type = source
			anim = forward
		}
		{
			type = source
			anim = right
		}
		{
			type = source
			anim = back
		}
		{
			type = source
			anim = left
		}
		{
			type = source
			anim = forward
		}
	]
}

script Skater_PlayOnGroundExtraAnim 
	if NOT anim_animnodeexists id = ongroundextras
		return
	endif
	if anim_animnodeexists id = groundlandswitch
		if NOT anim_command command = skatertimedswitchisfinished target = groundlandswitch
			return
		endif
	endif
	removetags [onground_from_index]
	anim_command {
		target = ongroundextras
		command = degenerateblend_addbranch
		params = {
			tree = $OnGroundExtras_AnimBranch
			blendduration = 0.1
			params = {
				anim = <anim>
			}
		}
	}
	skater_waitanimfinished timer = ongroundextrastimer
	if NOT anim_animnodeexists id = ongroundextras
		return
	endif
	anim_command {
		target = ongroundextras
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = 0
			params = {}
		}
	}
endscript
OnGroundExtras_AnimBranch = {
	type = play
	id = ongroundextrastimer
	anim = anim
	[
		{
			type = source
			anim = anim
		}
	]
}

script PlayCurbSnapDownAnim 
	PlayCurbSnapUpAnim \{anim = Sk8_Gnd_Oll_Curb_Up_Pose_D}
endscript

script PlayCurbSnapUpAnim {anim = Sk8_Gnd_Oll_Curb_Up_Pose_D duration = 0.35000002 vibration_time = 0.1}
	cleareventhandler curbsnapup
	cleareventhandler curbsnapdown
	if NOT anim_animnodeexists id = curbsnapextras
		return
	endif
	onexitrun PlayCurbSnapUpAnim_exit
	onexceptionrun PlayCurbSnapUpAnim_exit
	VibrateController port = 0 actuator = 0 percent = 50
	anim_command {
		target = curbsnapextras
		command = degenerateblend_addbranch
		params = {
			tree = $CurbSnap_AnimBranch
			blendduration = 0.1
			params = {
				anim = <anim>
			}
		}
	}
	anim_command {
		target = curbsnapextrastimer
		command = modulate_startblend
		params = {
			blendcurve = [1.0 , 0.5 , 0.0 , 0.5 , 1.0]
			blendduration = <duration>
		}
	}
	wait <vibration_time> seconds
	VibrateController port = 0 actuator = 0 percent = 0
	wait (<duration> - <vibration_time>) seconds
endscript

script PlayCurbSnapUpAnim_exit 
	VibrateController \{port = 0
		actuator = 0
		percent = 0}
	if anim_animnodeexists \{id = curbsnapextras}
		anim_command \{target = curbsnapextras
			command = degenerateblend_addbranch
			params = {
				tree = $blank_animbranch
				blendduration = 0
				params = {
				}
			}}
	endif
endscript
CurbSnap_AnimBranch = {
	type = modulate
	id = curbsnapextrastimer
	[
		{
			type = source
			anim = anim
		}
	]
}

script Skater_PlayExtraOnGroundBranch blendduration = 0.1 sync = 0
	if NOT anim_animnodeexists id = ongroundextras
		return
	endif
	if gotparam mirror
		subtree = OnGround_Land_Branch
		tree = $Mirrored_AnimBranch
	else
		tree = $OnGround_Land_Branch
	endif
	if gotparam reverse_turns
		turn_active_value_curve = [0.0 , 1.0]
	endif
	GetOngroundDiffBlendDuration to = (<data>.struct)
	CaptureOngroundDiff
	anim_command {
		target = ongroundextras
		command = degenerateblend_addbranch
		params = {
			tree = <tree>
			blendduration = <blendduration>
			params = {<data> speed_threshold = $ground_speed_threshold subtree = <subtree> sync = <sync> turn_active_value_curve = <turn_active_value_curve>}
		}
	}
	if anim_animnodeexists id = groundlandtimer
		if NOT gotparam percent
			skater_waitanimfinished timer = groundlandtimer
		else
			Skater_WaitAnim percent = <percent> timer = groundlandtimer
		endif
	endif
	if anim_animnodeexists id = groundlandtimer
		obj_getid
		launchevent type = playidleanim target = <objid>
	endif
endscript
OnGround_Land_Branch = {
	type = skatertimer
	timertype = play
	anim = flat_slow
	id = groundlandtimer
	sync = sync
	anim_events = on
	[
		{
			type = nestedtree
			tree = onground_diff_blend_main_branch
		}
	]
}
Mirrored_AnimBranch = {
	type = mirror
	[
		{
			type = nestedtree
			tree = subtree
			user_params = {
			}
		}
	]
}

script playidleanim 
	finishedkick
	cleareventhandlergroup \{OngroundAnims}
	seteventhandler \{event = playkickanim
		scr = playkickanim
		group = OngroundAnims
		response = call_script}
	seteventhandler \{event = PlayBrakeAnim
		scr = PlayBrakeAnim
		group = OngroundAnims
		response = call_script}
	if ($allow_auto_kick = true)
		seteventhandler \{event = autokick
			scr = playkickanim
			group = OngroundAnims
			response = call_script}
	endif
	obj_spawnscriptlater \{PlayIdleAnim_spawn}
endscript

script PlayIdleAnim_spawn 
	if anim_animnodeexists id = ongroundextras
		if innollie
			data = $nollie_onground_idle_data
		else
			data = $onground_idle_data
			get_strongest_lifestyle {ignore_spread}
			if gotparam strongest_lifestyle
				switch <strongest_lifestyle>
					case rigger
					<class_idle> = Sk8_Gnd_Oll_S_Idle_Rigger_D
					case career
					<class_idle> = Sk8_Gnd_Oll_S_Idle_Career_D
					case hardcore
					<class_idle> = Sk8_Gnd_Oll_S_Idle_Hardcore_D
				endswitch
			endif
		endif
		GetOngroundDiffBlendDuration to = (<data>.struct)
		CaptureOngroundDiff
		anim_command {
			target = ongroundextras
			command = degenerateblend_addbranch
			params = {
				tree = $onground_idle_branch
				blendduration = <blendduration>
				params = {<data> speed_threshold = $ground_speed_threshold sync = 0 flat_slow = <class_idle>}
			}
		}
	endif
endscript

script GetOngroundDiffBlendDuration 
	blendduration = $onground_diff_default_blend
	if gotparam to
		switch <to>
			case land_data
			to_index = 0
			case kick_data
			to_index = 1
			case brake_data
			to_index = 2
			case onground_idle_data
			case nollie_onground_idle_data
			to_index = 3
			case Cess_Data
			case BSCess_Data
			to_index = 4
			case Revert_Data
			case BSRevert_Data
			to_index = 5
			case ollie_to_nollie_data
			to_index = 6
			case BodyCheck_Basic_Data
			case BodyCheck_Charge_Data
			case BodyCheck_Multi_Data
			to_index = 7
			case StoppedOut_Data
			to_index = 8
			case flailright_data
			case flailleft_data
			to_index = 9
			case Carve_Data
			to_index = 10
			case Slope_Turnaround_Data
			to_index = 11
		endswitch
	endif
	if gotparam to_index
		getsingletag onground_from_index
		settags onground_from_index = <to_index>
		if gotparam onground_from_index
			blendduration = (($onground_blend_array [<onground_from_index>]) [<to_index>])
		endif
	else
		removetags [onground_from_index]
	endif
	return blendduration = <blendduration>
endscript

script CaptureOngroundDiff 
	if anim_animnodeexists \{id = OngroundDiffPoseCapture}
		anim_command \{target = OngroundDiffPoseCapture
			command = posecapture_capture}
	endif
endscript
onground_idle_branch = {
	type = posecapture
	id = OngroundDiffPoseCapture
	[
		{
			type = speedblend
			speed = speed_threshold
			[
				{
					type = nestedtree
					tree = onground_diff_blend_sub_idle_branch
					user_params = {
						flat = flat_slow
						partial = partial_slow
						turn_left = turn_left_slow
						turn_right = turn_right_slow
						slope_forward_45 = slope_forward_slow_45
						slope_forward_90 = slope_forward_slow_90
						slope_back_45 = slope_back_slow_45
						slope_back_90 = slope_back_slow_90
						slope_left_45 = slope_left_slow_45
						slope_left_90 = slope_left_slow_90
						slope_right_45 = slope_right_slow_45
						slope_right_90 = slope_right_slow_90
					}
				}
				{
					type = nestedtree
					tree = onground_diff_blend_sub_idle_branch
					user_params = {
						flat = flat_fast
						partial = partial_fast
						turn_left = turn_left_fast
						turn_right = turn_right_fast
						slope_forward_45 = slope_forward_fast_45
						slope_forward_90 = slope_forward_fast_90
						slope_back_45 = slope_back_fast_45
						slope_back_90 = slope_back_fast_90
						slope_left_45 = slope_left_fast_45
						slope_left_90 = slope_left_fast_90
						slope_right_45 = slope_right_fast_45
						slope_right_90 = slope_right_fast_90
					}
				}
			]
		}
	]
}
onground_diff_blend_sub_idle_branch = {
	type = add
	[
		{
			type = source
			anim = partial
		}
		{
			type = blendnactive
			active_value_source = slope_any
			active_value_lower_bound = 0
			active_value_upper_bound = 90
			[
				{
					type = nestedtree
					tree = onground_diff_blend_turn_idle_branch
				}
				{
					type = cycle
					anim = slope_forward_45
					[
						{
							type = nestedtree
							tree = onground_diff_blend_slope_branch
							user_params = {
								forward = slope_forward_45
								back = slope_back_45
								left = slope_left_45
								right = slope_right_45
							}
						}
					]
				}
				{
					type = cycle
					anim = slope_forward_90
					[
						{
							type = nestedtree
							tree = onground_diff_blend_slope_branch
							user_params = {
								forward = slope_forward_90
								back = slope_back_90
								left = slope_left_90
								right = slope_right_90
							}
						}
					]
				}
			]
		}
	]
}

script nollie_exit 
	if innollie
		nollieoff
		Skater_PlayOnGroundAnim \{no_land}
	endif
endscript

script PlayBrakeAnim 
	finishedkick
	nollie_exit
	if anim_animnodeexists id = ongroundextras
		cleareventhandlergroup OngroundAnims
		seteventhandler event = playidleanim scr = playidleanim group = OngroundAnims response = call_script
		seteventhandler event = playkickanim scr = playkickanim group = OngroundAnims response = call_script
		if ($allow_auto_kick = true)
			seteventhandler event = autokick scr = playkickanim group = OngroundAnims response = call_script
		endif
		killspawnedscript name = PlayIdleAnim_spawn
		GetOngroundDiffBlendDuration to = brake_data
		CaptureOngroundDiff
		anim_command {
			target = ongroundextras
			command = degenerateblend_addbranch
			params = {
				tree = $onground_brake_branch
				blendduration = <blendduration>
				params = {speed_threshold = $ground_speed_threshold sync = 0}
			}
		}
	endif
endscript
onground_brake_branch = {
	type = posecapture
	id = OngroundDiffPoseCapture
	[
		{
			type = braketimer
			slow_array = $brake_slow_anims
			fast_array = $brake_fast_anims
			max_speed = speed_threshold
			idle_out_time = brakeidle_out_time
			id = braketimer
			[
				{
					type = nestedtree
					tree = onground_diff_blend_main_branch
					user_params = {
						$brake_in_data
					}
				}
				{
					type = nestedtree
					tree = onground_diff_blend_main_branch
					user_params = {
						$brake_idle_data
					}
				}
				{
					type = nestedtree
					tree = onground_diff_blend_main_branch
					user_params = {
						$brake_out_data
					}
				}
			]
		}
	]
}
allow_auto_kick = true

script playkickanim 
	if anim_animnodeexists id = kicktimer
		return
	endif
	nollie_exit
	if anim_animnodeexists id = ongroundextras
		cleareventhandlergroup OngroundAnims
		seteventhandler event = playidleanim scr = playidleanim group = OngroundAnims response = call_script
		seteventhandler event = PlayBrakeAnim scr = PlayBrakeAnim group = OngroundAnims response = call_script
		killspawnedscript name = PlayIdleAnim_spawn
		GetOngroundDiffBlendDuration to = kick_data
		CaptureOngroundDiff
		anim_command {
			target = ongroundextras
			command = degenerateblend_addbranch
			params = {
				tree = $onground_kick_branch
				blendduration = <blendduration>
				params = {speed_threshold = $ground_speed_threshold sync = 0}
			}
		}
	endif
endscript
onground_kick_branch = {
	type = posecapture
	id = OngroundDiffPoseCapture
	[
		{
			type = kicktimer
			slow_array = $kick_slow_anims
			fast_array = $kick_fast_anims
			max_speed = speed_threshold
			id = kicktimer
			[
				{
					type = nestedtree
					tree = onground_diff_blend_main_branch
					user_params = {
						$kick_in_data
					}
				}
				{
					type = nestedtree
					tree = onground_diff_blend_main_branch
					user_params = {
						$kick_push_data
					}
				}
				{
					type = nestedtree
					tree = onground_diff_blend_main_branch
					user_params = {
						$kick_reset_data
					}
				}
				{
					type = nestedtree
					tree = onground_diff_blend_main_branch
					user_params = {
						$kick_out_data
					}
				}
			]
		}
	]
}

script PlayPumpAnim 
	if anim_animnodeexists id = ongroundextras
		cleareventhandlergroup OngroundAnims
		seteventhandler event = playidleanim scr = playidleanim group = OngroundAnims response = call_script
		seteventhandler event = playkickanim scr = playkickanim group = OngroundAnims response = call_script
		seteventhandler event = PlayBrakeAnim scr = PlayBrakeAnim group = OngroundAnims response = call_script
		if ($allow_auto_kick = true)
			seteventhandler event = autokick scr = playkickanim group = OngroundAnims response = call_script
		endif
		GetOngroundDiffBlendDuration to = pump_data
		CaptureOngroundDiff
		anim_command {
			target = ongroundextras
			command = degenerateblend_addbranch
			params = {
				tree = $pump_branch
				blendduration = <blendduration>
				params = {$pump_anims speed_threshold = $ground_speed_threshold sync = 0}
			}
		}
	endif
endscript
pump_branch = {
	type = posecapture
	id = OngroundDiffPoseCapture
	[
		{
			type = add
			[
				{
					type = add
					[
						{
							type = skatermodulate
							timertype = pump
							dir = up
							blendtime = 0.3
							id = pumpmodup
							[
								{
									type = source
									anim = pump_up
								}
							]
						}
						{
							type = skatermodulate
							timertype = pump
							dir = down
							blendtime = 0.3
							[
								{
									type = source
									anim = pump_down
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
							timertype = pump
							dir = left
							blendtime = 0.3
							[
								{
									type = source
									anim = lean_left
								}
							]
						}
						{
							type = skatermodulate
							timertype = pump
							dir = right
							blendtime = 0.3
							[
								{
									type = source
									anim = lean_right
								}
							]
						}
					]
				}
			]
		}
	]
}

script Skater_PlayOllieSideLandAnims 
	feet_nospeed_anim = Sk8_Ollie_LndCrch_NoSpd_Brd_F
	body_nospeed_anim = Sk8_Ollie_LndCrch_NoSpd_Body_D
	if backwards
		feet_speed_anim = Sk8_Ollie_LndCrch_Spd180_Brd_F
		body_speed_anim = Sk8_Ollie_LndCrch_Spd180_Body_D
	else
		feet_speed_anim = Sk8_Ollie_LndCrch_Speed_Brd_F
		body_speed_anim = Sk8_Ollie_LndCrch_Speed_Body_D
	endif
	if NOT landedfromvert
		anim_command {
			target = slopeblend
			command = degenerateblend_addbranch
			params = {
				tree = $slopeblend_branch
				blendduration = 0
				params = {}
			}
		}
	endif
	if NOT gotparam Grind
		anim_command {
			target = olliesidelandings
			command = degenerateblend_addbranch
			params = {
				tree = $olliesideland_branch
				blendduration = 0
				params = {
					speed_threshold = ($OnGround_data.speed_threshold)
					body_nospeed_anim = <body_nospeed_anim>
					body_speed_anim = <body_speed_anim>
				}
			}
		}
	endif
	anim_command {
		target = landpartialblend
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = 0
			params = {}
		}
	}
	if isboardrotateafterset
		always = on
	else
		always = off
	endif
	handlefliporboardrotateafter
	anim_command {
		target = landpartialblend
		command = degenerateblend_addbranch
		params = {
			tree = $olliesidelandfoot_branch
			blendduration = 0.08
			params = {
				speed_threshold = ($OnGround_data.speed_threshold)
				feet_nospeed_anim = <feet_nospeed_anim>
				feet_speed_anim = <feet_speed_anim>
				always = <always>
			}
		}
	}
endscript
olliesideland_branch = {
	type = play
	anim = body_speed_anim
	[
		{
			type = nestedtree
			tree = onground_speed_branch
			user_params = {
				fast = body_speed_anim
				slow = body_nospeed_anim
			}
		}
	]
}
onground_speed_branch = {
	type = speedadd
	speed = speed_threshold
	[
		{
			type = source
			anim = slow
		}
		{
			type = source
			anim = fast
		}
	]
}
olliesidelandfoot_branch = {
	type = play
	anim = feet_speed_anim
	[
		{
			type = boardrotate
			always = always
			[
				{
					type = nestedtree
					tree = onground_speed_branch
					user_params = {
						fast = feet_speed_anim
						slow = feet_nospeed_anim
					}
				}
			]
		}
	]
}
slopeblend_branch = {
	type = add
	[
		{
			type = add
			[
				{
					type = skatermodulate
					timertype = slope
					slope_dir = forward
					max_slope = 90
					[
						{
							type = source
							anim = Sk8_Root_Slope_90_F_D
						}
					]
				}
				{
					type = skatermodulate
					timertype = slope
					slope_dir = back
					max_slope = 90
					[
						{
							type = source
							anim = Sk8_Root_Slope_90_B_D
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
					max_slope = 90
					dont_flip = 1
					[
						{
							type = source
							anim = Sk8_Root_Slope_90_L_D
						}
					]
				}
				{
					type = skatermodulate
					timertype = slope
					slope_dir = right
					max_slope = 90
					dont_flip = 1
					[
						{
							type = source
							anim = Sk8_Root_Slope_90_R_D
						}
					]
				}
			]
		}
	]
}
