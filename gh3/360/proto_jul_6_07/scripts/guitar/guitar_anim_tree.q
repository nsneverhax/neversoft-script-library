
script create_band_member name = guitarist lightgroup = band async = 0 animpak = 1
	create_band_member_wait_for_lock
	printf "Create_Band_Member name=%a............." a = <name>
	formattext checksumname = bandmember_body_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.body)
	formattext checksumname = bandmember_anim_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.anim)
	formattext checksumname = bandmember_instrument_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.instrument)
	pos = (0.0, 0.0, 0.0)
	dir = (0.0, 0.0, 1.0)
	if gotparam start_node
		if doeswaypointexist name = <start_node>
			getwaypointpos name = <start_node>
			getwaypointdir name = <start_node>
		endif
	endif
	if compositeobjectexists <name>
		if gotparam useoldpos
			<name> :obj_getposition
			<name> :obj_getorientation
			dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
		endif
		<name> :die
	endif
	unload_musician_pak_file desc_id = ($<bandmember_body_pak>) async = <async> type = body
	unload_musician_pak_file desc_id = ($<bandmember_anim_pak>) async = <async> type = anim
	unload_musician_pak_file desc_id = ($<bandmember_instrument_pak>) async = <async> type = instrument
	change globalname = <bandmember_body_pak> newvalue = no_pak_id
	change globalname = <bandmember_anim_pak> newvalue = no_pak_id
	change globalname = <bandmember_instrument_pak> newvalue = no_pak_id
	if (<name> = guitarist || <name> = bassist)
		startslot = 0
	else
		startslot = 2
	endif
	body_asset_context = 0
	if structurecontains structure = <profile> musician_body
		load_musician_pak_file profile = <profile> async = <async> type = body
		change globalname = <bandmember_body_pak> newvalue = <filename_crc>
		body_asset_context = <assetcontext>
		if (<animpak> = 1)
			load_musician_pak_file profile = <profile> async = <async> type = anim startslot = <startslot>
			change globalname = <bandmember_anim_pak> newvalue = <filename_crc>
		endif
	endif
	if structurecontains structure = <profile> musician_instrument
		load_musician_pak_file profile = <profile> async = <async> type = instrument
		change globalname = <bandmember_instrument_pak> newvalue = <filename_crc>
	endif
	dump_pak_info
	getpakmancurrent map = zones
	switch <pak>
		case z_training
		case z_viewer
		lightgroup = none
		default
		if (<name> = guitarist)
			lightgroup = alt_band
		endif
	endswitch
	if ($soundcheck_in_store = 1)
		<lightgroup> = guitar_center_band
	endif
	skeleton_name = (<profile>.skeleton)
	ragdoll_name = (<profile>.ragdoll)
	collision_group = (<profile>.ragdoll_collision_group)
	if structurecontains structure = <profile> outfit
		if (<profile>.outfit = 2)
			skeleton_name = (<profile>.skeleton2)
			ragdoll_name = (<profile>.ragdoll2)
			collision_group = (<profile>.ragdoll_collision_group2)
		endif
	endif
	if structurecontains structure = <profile> ik_params
		ik_params = (<profile>.ik_params)
	else
		ik_params = hero_ik_params
	endif
	createcompositeobject {
		components = [
			{
				component = ragdoll
				initialize_empty = false
				disable_collision_callbacks
				skeletonname = <skeleton_name>
				ragdollname = <ragdoll_name>
				ragdollcollisiongroup = $<collision_group>
			}
			{
				component = setdisplaymatrix
			}
			{
				component = animtree
				animeventtablename = ped_animevents
			}
			{
				component = skeleton
				skeletonname = <skeleton_name>
			}
			{
				component = model
				lightgroup = <lightgroup>
			}
			{
				component = motion
			}
		]
		params = {
			name = <name>
			pos = <pos>
			assetcontext = <body_asset_context>
			<profile>
			object_type = bandmember
			profilebudget = 800
		}
	}
	<name> :obj_setorientation dir = <dir>
	<name> :obj_initmodelfromprofile struct = <profile> buildscript = create_ped_model_from_appearance params = {lightgroup = <lightgroup>}
	switch (<name>)
		case vocalist
		desired_tree = vocalist_static_tree
		case drummer
		desired_tree = drummer_static_tree
		default
		desired_tree = guitarist_static_tree
		case
	endswitch
	<name> :anim_inittree {
		tree = $<desired_tree>
		animeventtablename = ped_animevents
		nodeiddeclaration = [
			base
			body
			bodytimer
			strumtimer
			frettimer
			fingertimer
			facialtimer
			ik
			standard_branch
			turn_branch
			leftarmpartial
			lefthandpartial
			rightarmpartial
			drummerleftarm
			drummerrightarm
			leftarm_timer
			rightarm_timer
			leftarm
			lefthand
			rightarm
			face
			cymbal1
			cymbal2
			cymbal3
			cymbal4
			cymbaltimer1
			cymbaltimer2
			cymbaltimer3
			cymbaltimer4
			leftfoot
			leftfoot_timer
			rightfoot
			rightfoot_timer
			bodytwist
			bodytwist_timer
			bodytwist_branch
			arm_branch
		]
		params = {
			ik_params = <ik_params>
		}
	}
	create_band_member_unlock
endscript

script preload_band_member name = guitarist async = 0
	create_band_member_wait_for_lock
	filename_crc = none
	instrument_crc = none
	create_guitarist_profile <...>
	if (<found> = 1)
		if structurecontains structure = <profile> musician_instrument
			load_musician_pak_file profile = <profile> async = <async> type = instrument
			instrument_crc = <filename_crc>
		endif
		if structurecontains structure = <profile> musician_body
			load_musician_pak_file profile = <profile> async = <async> type = body
		endif
	endif
	create_band_member_unlock
	return filename_crc = <filename_crc> instrument_crc = <instrument_crc>
endscript

script preload_band_member_finish \{name = guitarist
		async = 0}
	create_band_member_wait_for_lock
	if NOT (<instrument_crc> = none)
		unload_musician_pak_file desc_id = <instrument_crc> async = <async> type = instrument
	endif
	if NOT (<filename_crc> = none)
		unload_musician_pak_file desc_id = <filename_crc> async = <async> type = body
	endif
	create_band_member_unlock
endscript
create_band_member_lock_queue = 0
create_band_member_lock = 0

script create_band_member_unlock 
	change \{create_band_member_lock = 0}
endscript

script create_band_member_wait_for_lock 
	begin
	if ($create_band_member_lock_queue = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{create_band_member_lock_queue = 0}
	change \{create_band_member_lock = 1}
endscript

script destroy_band 
	destroy_band_member \{name = guitarist}
	destroy_band_member \{name = bassist}
	destroy_band_member \{name = drummer}
	destroy_band_member \{name = vocalist}
	if gotparam \{unload_paks}
		force_unload_all_character_paks
	endif
endscript

script destroy_band_member 
	if compositeobjectexists name = <name>
		<name> :die
		formattext checksumname = bandmember_body_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.body)
		formattext checksumname = bandmember_anim_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.anim)
		formattext checksumname = bandmember_instrument_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.instrument)
		unload_musician_pak_file desc_id = ($<bandmember_body_pak>) async = <async> type = body
		unload_musician_pak_file desc_id = ($<bandmember_anim_pak>) async = <async> type = anim
		unload_musician_pak_file desc_id = ($<bandmember_instrument_pak>) async = <async> type = instrument
		change globalname = <bandmember_body_pak> newvalue = no_pak_id
		change globalname = <bandmember_anim_pak> newvalue = no_pak_id
		change globalname = <bandmember_instrument_pak> newvalue = no_pak_id
	endif
endscript

script kill_character_scripts 
	printf \{"kill character scripts......."}
	if compositeobjectexists \{name = guitarist}
		guitarist :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = bassist}
		bassist :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = drummer}
		drummer :obj_switchscript \{emptyscript}
	endif
endscript

script emptyscript 
endscript

script hero_play_anim target = body timerid = bodytimer tree = $hero_body_branch blendduration = 0.2 speed = 1.0
	if gotparam cycle
		timer_type = cycle
	else
		timer_type = play
	endif
	anim_command {
		target = <target>
		command = degenerateblend_addbranch
		params = {
			tree = <tree>
			blendduration = <blendduration>
			params = {
				timer_type = <timer_type>
				timer_id = <timerid>
				anim_name = <anim>
				speed = <speed>
			}
		}
	}
endscript

script hero_pause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_setspeed
			params = {
				speed = 0.0
			}}
	endif
endscript

script hero_unpause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_setspeed
			params = {
				speed = 1.0
			}}
	endif
endscript

script hero_play_turn_anim \{blendduration = 0.2
		turnblend = 1.0}
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $hero_turning_tree
			blendduration = <blendduration>
			params = {
				timer_type = play
				anim_name = <idleanim>
				second_anim_name = <turnanim>
				second_anim_blend = <turnblend>
			}
		}
	}
endscript

script hero_play_blended_anim \{blendduration = 0.2
		blend = 1.0}
	if gotparam \{cycle}
		timer_type = cycle
	else
		timer_type = play
	endif
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $hero_turning_tree
			blendduration = <blendduration>
			params = {
				timer_type = <timer_type>
				anim_name = <first_anim>
				second_anim_name = <second_anim>
				second_anim_blend = <blend>
			}
		}
	}
endscript

script hero_play_strum_anim \{blendduration = 0.2}
	if anim_animnodeexists \{id = rightarm}
		anim_command {
			target = rightarm
			command = degenerateblend_addbranch
			params = {
				tree = $hero_strumming_branch
				blendduration = <blendduration>
				params = {
					strum_name = <anim>
				}
			}
		}
	endif
endscript

script hero_play_fret_anim \{blendduration = $fret_blend_time}
	if anim_animnodeexists \{id = leftarm}
		anim_command {
			target = leftarm
			command = degenerateblend_addbranch
			params = {
				tree = $hero_fret_branch
				blendduration = <blendduration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_play_finger_anim \{blendduration = 0.2}
	if anim_animnodeexists \{id = lefthand}
		anim_command {
			target = lefthand
			command = degenerateblend_addbranch
			params = {
				tree = $hero_finger_branch
				blendduration = <blendduration>
				params = {
					finger_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_play_drum_anim \{blendduration = $drum_blend_time}
	if anim_animnodeexists \{id = cymbal1}
		anim_command {
			target = body
			command = degenerateblend_addbranch
			params = {
				tree = $hero_cymbal_branch
				blendduration = <blendduration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_cymbal_anim \{blendduration = $fret_blend_time}
	if anim_animnodeexists \{id = cymbal1}
		anim_command {
			target = cymbal1
			command = degenerateblend_addbranch
			params = {
				tree = $hero_cymbal_branch
				blendduration = <blendduration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_play_facial_anim \{blendduration = 0.0}
	printf "playing facial anim %a ............" a = <anim>
	if anim_animnodeexists \{id = face}
		anim_command {
			target = face
			command = degenerateblend_addbranch
			params = {
				tree = $hero_face_branch
				blendduration = <blendduration>
				params = {
					facial_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_wait_until_anim_finished \{timer = bodytimer}
	begin
	if hero_anim_complete timer = <timer>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script hero_anim_complete \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{true}
	else
		if anim_command target = <timer> command = timer_isanimcomplete
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script hero_wait_until_anim_near_end \{timer = bodytimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end timer = <timer> time_from_end = <time_from_end>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script hero_anim_near_end \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{true}
	else
		if anim_command target = <timer> command = timer_wait params = {secondsfromend = <time_from_end>}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script hero_disable_arms blend_time = 0.25
	if anim_animnodeexists id = arm_branch
		if (<blend_time> = 0.0)
			anim_command {
				target = arm_branch
				command = modulate_setstrength
				params = {
					strength = 0.0
					blendduration = 2.0
				}
			}
		else
			anim_command {
				target = arm_branch
				command = modulate_startblend
				params = {
					blendcurve = [0.0 1.0]
					blendduration = <blend_time>
				}
			}
		endif
	endif
	if anim_animnodeexists id = ik
		anim_command {
			target = ik
			command = ik_setchainstrength
			params = {
				strength = 0.0
				blendduration = <blend_time>
				chain = bone_ik_hand_guitar_r
			}
		}
		anim_command {
			target = ik
			command = ik_setchainstrength
			params = {
				strength = 0.0
				blendduration = <blend_time>
				chain = bone_ik_hand_guitar_l
			}
		}
	endif
endscript

script hero_enable_arms blend_time = 0.25
	if anim_animnodeexists id = arm_branch
		anim_command {
			target = arm_branch
			command = modulate_startblend
			params = {
				blendcurve = [1.0 0.0]
				blendduration = <blend_time>
			}
		}
	endif
	if anim_animnodeexists id = ik
		anim_command {
			target = ik
			command = ik_setchainstrength
			params = {
				strength = 1.0
				blendduration = <blend_time>
				chain = bone_ik_hand_guitar_r
			}
		}
		anim_command {
			target = ik
			command = ik_setchainstrength
			params = {
				strength = 1.0
				blendduration = <blend_time>
				chain = bone_ik_hand_guitar_l
			}
		}
	endif
endscript

script drummer_twist 
	if anim_animnodeexists \{id = bodytwist_branch}
		anim_command {
			target = bodytwist_branch
			command = modulate_setstrength
			params = {
				strength = <strength>
			}
		}
	endif
endscript
generic_static_tree = {
	type = degenerateblend
	id = body
}
guitarist_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ragdoll
			[
				{
					type = ik
					two_bone_chains = ik_params
					id = ik
					[
						{
							type = partialswitch
							state = on
							[
								{
									type = degenerateblend
									id = face
								}
								{
									type = applydifference
									id = lefthandpartial
									[
										{
											$hero_arm_branch
										}
										{
											type = degenerateblend
											id = body
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
	type = modulate
	strength = 1.0
	id = arm_branch
	[
		{
			type = add
			[
				{
					type = add
					[
						{
							type = degenerateblend
							id = leftarm
						}
						{
							type = degenerateblend
							id = lefthand
						}
					]
				}
				{
					type = degenerateblend
					id = rightarm
				}
			]
		}
	]
}
hero_body_branch = {
	type = timer_type
	id = bodytimer
	anim = anim_name
	speed = speed
	anim_events = on
	[
		{
			type = motionextractedsource
			anim = anim_name
		}
	]
}
hero_strumming_branch = {
	type = play
	id = strumtimer
	anim = strum_name
	[
		{
			type = source
			anim = strum_name
		}
	]
}
hero_fret_branch = {
	type = play
	id = frettimer
	anim = fret_anim
	[
		{
			type = source
			anim = fret_anim
		}
	]
}
hero_finger_branch = {
	type = play
	id = fingertimer
	anim = finger_anim
	[
		{
			type = source
			anim = finger_anim
		}
	]
}
hero_face_branch = {
	type = play
	id = facialtimer
	anim = facial_anim
	[
		{
			type = source
			anim = facial_anim
		}
	]
}
hero_drumming_branch = {
	type = timer_type
	id = timer_id
	anim = anim_name
	speed = speed
	[
		{
			type = source
			anim = anim_name
		}
	]
}
drummer_twist_branch = {
	type = play
	id = bodytwist_timer
	anim = anim_name
	[
		{
			type = modulate
			strength = 1.0
			id = bodytwist_branch
			[
				{
					type = source
					anim = anim_name
				}
			]
		}
	]
}
hero_turning_tree = {
	type = timer_type
	id = bodytimer
	anim = anim_name
	[
		{
			type = blend
			blend_factor = second_anim_blend
			[
				{
					type = motionextractedsource
					anim = anim_name
				}
				{
					type = motionextractedsource
					anim = second_anim_name
				}
			]
		}
	]
}
vocalist_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ragdoll
			[
				{
					type = ik
					two_bone_chains = singer_ik_params
					[
						{
							type = partialswitch
							state = on
							[
								{
									type = degenerateblend
									id = face
								}
								{
									type = degenerateblend
									id = body
								}
							]
						}
					]
				}
			]
		}
	]
}
drummer_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ragdoll
			[
				{
					type = ik
					two_bone_chains = drummer_ik_params
					id = ik
					[
						{
							type = partialswitch
							state = on
							[
								{
									$drummer_cymbals_branch
								}
								{
									type = applydifference
									[
										{
											type = degenerateblend
											id = bodytwist
										}
										{
											type = partialswitch
											state = on
											[
												{
													type = add
													[
														{
															type = add
															[
																{
																	type = degenerateblend
																	id = drummerleftarm
																}
																{
																	type = degenerateblend
																	id = drummerrightarm
																}
															]
														}
														{
															type = add
															[
																{
																	type = degenerateblend
																	id = leftfoot
																}
																{
																	type = degenerateblend
																	id = rightfoot
																}
															]
														}
													]
												}
												{
													type = degenerateblend
													id = body
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
hero_cymbal_branch = {
	type = play
	id = cymbal_timer_id
	anim = cymbal_anim
	[
		{
			type = source
			anim = cymbal_anim
		}
	]
}
drummer_cymbals_branch = {
	type = add
	[
		{
			type = add
			[
				{
					type = degenerateblend
					id = cymbal1
				}
				{
					type = degenerateblend
					id = cymbal2
				}
			]
		}
		{
			type = add
			[
				{
					type = degenerateblend
					id = cymbal3
				}
				{
					type = degenerateblend
					id = cymbal4
				}
			]
		}
	]
}
hero_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
satan_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
	}
	{
		bone0 = bone_knee_l
		bone1 = bone_ankle_l
		bone2 = bone_toe_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_knee_r
		bone1 = bone_ankle_r
		bone2 = bone_toe_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
singer_ik_params = [
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
drummer_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
hero_constraintbones = [
	{
		type = twist
		bone = bone_twist_wrist_l
		target = bone_palm_l
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_wrist_r
		target = bone_palm_r
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_mid_r
		target = bone_forearm_r
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_mid_l
		target = bone_forearm_l
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_top_r
		target = bone_forearm_r
		amount = 0.0
	}
	{
		type = twist
		bone = bone_twist_bicep_top_l
		target = bone_forearm_l
		amount = 0.0
	}
	{
		type = twist
		bone = bone_twist_thigh_r
		target = bone_ankle_r
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_thigh_l
		target = bone_ankle_l
		amount = 0.5
	}
	{
		type = split
		bone = bone_split_knee_r
		target = bone_knee_r
		amount = 0.5
	}
	{
		type = split
		bone = bone_split_knee_l
		target = bone_knee_l
		amount = 0.5
	}
	{
		type = splitr
		bone = bone_split_ass_r
		target = bone_twist_thigh_r
		amount = 0.5
	}
	{
		type = splitr
		bone = bone_split_ass_l
		target = bone_twist_thigh_l
		amount = 0.5
	}
	{
		type = split
		bone = bone_split_elbow_r
		target = bone_forearm_r
		amount = 0.5
	}
	{
		type = split
		bone = bone_split_elbow_l
		target = bone_forearm_l
		amount = 0.5
	}
]
