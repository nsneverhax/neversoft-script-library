ntg_force_grab_type = 0
ntg_blend_out_ik_finger_flip = 0
ntg_base_branch = {
	id = bodysource
	type = source
	anim = base_anim
}
ntg_main_branch = {
	type = applydifference
	[
		{
			type = nailthetrickboardrotate
			sub_type = ntg
			[
				{
					type = addn
					[
						{
							type = degenerateblend
							id = ntg_grab_hook
						}
						{
							type = degenerateblend
							id = ntg_tweak_hook
						}
						{
							type = degenerateblend
							id = ntg_mini_tweak_hook
						}
						{
							type = degenerateblend
							id = ntg_idle_hook
						}
						{
							type = degenerateblend
							id = ntg_shake_hook
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
Ntg_IK_Params_Feet = [
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Board_L
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Board_R
	}
]
Ntg_IK_Params_Hands = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Hand_Board_R
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Hand_Board_L
	}
]
ntg_tree = {
	type = nailthegrab
	id = ntg_land_offset_id
	sub_type = land_offset
	[
		{
			type = skaterflip
			[
				{
					type = boardrotate
					id = boardrotate
					[
						{
							type = ik
							id = IK_Hands
							two_bone_chains = Ntg_IK_Params_Hands
							[
								{
									type = nestedtree
									tree = ntg_main_branch
								}
							]
						}
					]
				}
			]
		}
	]
}
ntg_tree_no_ik = {
	type = skaterflip
	[
		{
			type = boardrotate
			id = boardrotate
			[
				{
					type = nailthegrab
					id = ntg_land_offset_id
					sub_type = land_offset
					[
						{
							type = nestedtree
							tree = ntg_main_branch
						}
					]
				}
			]
		}
	]
}
ntg_angleblend_branch = {
	type = angleblend
	sub_type = my_sub_type
	speed = my_speed
	id = my_id
	blend_in = my_blend_in_speed
	play_type = my_play_type
	closest_pose = 0
	anim = my_front_anim
	start = my_start
	[
		{
			type = source
			anim = my_front_anim
		}
		{
			type = source
			anim = my_back_anim
		}
		{
			type = source
			anim = my_left_anim
		}
		{
			type = source
			anim = my_right_anim
		}
		{
			type = source
			anim = my_center_anim
		}
	]
}
ntg_mini_tweak_branch = {
	type = angleblend
	sub_type = mini
	blend_in = my_blend_in_speed
	[
		{
			type = ringblend
			sub_type = mini
			anim_array = my_animarray_front
			blend_in = my_blend_in_speed
		}
		{
			type = ringblend
			sub_type = mini
			anim_array = my_animarray_back
			blend_in = my_blend_in_speed
		}
		{
			type = ringblend
			sub_type = mini
			anim_array = my_animarray_left
			blend_in = my_blend_in_speed
		}
		{
			type = ringblend
			sub_type = mini
			anim_array = my_animarray_right
			blend_in = my_blend_in_speed
		}
		{
			type = ringblend
			sub_type = mini
			anim_array = my_animarray_center
			blend_in = my_blend_in_speed
		}
	]
}
ntg_grab_branch = {
	type = play
	id = my_id
	anim = my_anim
	speed = my_speed
	start = my_start
	[
		{
			id = bodysource
			type = source
			anim = my_anim
		}
	]
}
ntg_ringblend_branch = {
	type = my_type
	id = my_id
	sub_type = my_sub_type
	anim_array = my_animarray
	blend_in = my_blend_in_speed
}
ntg_finger_flip_tree = {
	type = play
	id = my_id
	anim = my_anim
	speed = my_speed
	[
		{
			id = bodysource
			type = source
			anim = my_anim
		}
	]
}

script ntg_start_idle 
	anim_command {
		target = ntg_idle_hook
		command = degenerateblend_addbranch
		params = {
			tree = $ntg_angleblend_branch
			blendduration = 0.2
			params = {
				my_speed = 4.0
				my_sub_type = idle
				my_id = ntg_angle_blend
				my_blend_in_speed = 0.5
				my_play_type = cycle
				my_front_anim = (<data>.<quadrant>.idle_front)
				my_back_anim = (<data>.<quadrant>.idle_back)
				my_left_anim = (<data>.<quadrant>.idle_left)
				my_right_anim = (<data>.<quadrant>.idle_right)
				my_center_anim = (<data>.<quadrant>.idle_center)
			}
		}
	}
endscript

script ntg_start_grab_release 
	nailthegrab_getlastquadrantdata
	ntg_get_quadrant_and_data <...>
	anim_command {
		target = ntg_grab_hook
		command = degenerateblend_addbranch
		params = {
			tree = $ntg_grab_branch
			blendduration = <blendduration>
			params = {
				my_type = play
				my_id = ntg_grab_id
				my_anim = (<data>.<quadrant>.grab_release)
				my_speed = 5.0
				my_start = 0.0
			}
		}
	}
	anim_command {
		target = ntg_idle_hook
		command = degenerateblend_addbranch
		params = {
			tree = $ntg_angleblend_branch
			blendduration = <idleblend>
			params = {
				my_speed = 0.0
				my_id = ntg_angle_blend
				my_front_anim = Ska8_zacs_empty_anim_D
				my_back_anim = Ska8_zacs_empty_anim_D
				my_left_anim = Ska8_zacs_empty_anim_D
				my_right_anim = Ska8_zacs_empty_anim_D
				my_center_anim = Ska8_zacs_empty_anim_D
			}
		}
	}
	nailthegrab_forcelerpouttweak value = 1
	wait 0.2 seconds ignoreslomo
	nailthegrab_forcelerpouttweak value = 0
endscript

script ntg_update_finger_flip_reflick 
	getstarttime
	begin
	if nailthegrab_hadcontrolpress \{control = $ntg_start_finger_flip_control_type
			check_all_sticks}
		return \{true
			new_finger_flick}
	endif
	getelapsedtime starttime = <starttime>
	if (<elapsedtime> >= <milliseconds>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	return \{false}
endscript

script ntg_finger_flip_update_loop 
	begin
	if gotparam wait_for_anim
		if anim_command {target = <wait_for_anim> command = animcomplete}
			return false
		endif
	endif
	if nailthegrab_hadcontrolpress control = $ntg_stop_finger_flip_control_type check_all_sticks
		nailthegrab_forceexitfingerflip
	endif
	if nailthegrab_shouldexitfingerflip
		if NOT nailthegrab_isbranchpoint
			nailthetrick_setintrick value = 0
			nailthegrab_getlastquadrantdata
			ntg_get_quadrant_and_data <...>
			ntg_start_finger_flip_regrab {
				<...>
				regrabblend = 0.05
				regrabspeed = 7.0
				my_start = 0.0
			}
			wait 0.4 seconds ignoreslomo
			nailthegrab_setfingerflipbail value = 1
			set_ntt_slomo time = 0.3 speed = 1.0 wait
			ntg_start_finger_flip_bail speed = 1.0 blendduration = 0.5
			nailthegrab_setfingerflipbail value = 1
			begin
			wait 1 gameframe
			repeat
			break
		endif
		nailthegrab_decelerateboardroatation decelerate_adj = 0.05
		soundevent event = NTG_Grab_Board_SFX object = skater
		ntg_start_finger_flip_regrab <...> regrabblend = 0.05 regrabspeed = 5.5
		if ntg_update_finger_flip_reflick milliseconds = 50
			break
		endif
		nailthegrab_blendoutfingerflip value = 1 speed = 25.0
		if ntg_update_finger_flip_reflick milliseconds = 65
			break
		endif
		break
	endif
	wait 1 gameframe
	repeat
	return true <...>
endscript
ntg_finger_flip_bail_tree = {
	type = skaterflip
	[
		{
			type = boardrotate
			id = boardrotate
			[
				{
					type = nailthetrickboardrotate
					sub_type = ntg
					[
						{
							type = cycle
							anim = my_anim
							speed = my_speed
							[
								{
									type = source
									anim = my_anim
								}
							]
						}
					]
				}
			]
		}
	]
}

script ntg_start_finger_flip_bail 
	ntt_kill_panel
	default_vibrate_effect
	nailthetrick_setollietreevalid \{value = 0}
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $ntg_finger_flip_bail_tree
			blendduration = <blendduration>
			params = {
				my_anim = NTG_MissFingerFlip_Bail_F
				my_speed = <speed>
			}
		}
	}
endscript

script ntg_start_finger_flip_idle idleblend = 0.0 idlespeed = 7.0
	anim_command {
		target = ntg_idle_hook
		command = degenerateblend_addbranch
		params = {
			tree = $ntg_angleblend_branch
			blendduration = <idleblend>
			params = {
				my_speed = <idlespeed>
				my_sub_type = finger_flip
				my_id = ntg_finger_flip_id
				my_play_type = cycle
				my_front_anim = (<data>.<quadrant>.finger_front.<finger_dir>.idle)
				my_back_anim = (<data>.<quadrant>.finger_back.<finger_dir>.idle)
				my_left_anim = (<data>.<quadrant>.finger_left.<finger_dir>.idle)
				my_right_anim = (<data>.<quadrant>.finger_right.<finger_dir>.idle)
				my_center_anim = (<data>.<quadrant>.finger_center.<finger_dir>.idle)
			}
		}
	}
endscript

script ntg_ik_blend \{blendduration = 0.1}
	anim_command {
		target = IK_Hands
		command = ik_setchainstrength
		params = {
			strength = <strength>
			blendduration = <blendduration>
			chain = <chain>
		}
	}
endscript

script ntg_start_finger_flip_regrab my_start = 0.1
	default_vibrate_effect percent = 100 duration = 0.02 delay = 0.05
	anim_command {
		target = ntg_idle_hook
		command = degenerateblend_addbranch
		params = {
			tree = $ntg_angleblend_branch
			blendduration = <regrabblend>
			params = {
				my_speed = <regrabspeed>
				my_sub_type = finger_flip
				my_id = ntg_finger_flip_id
				my_play_type = play
				my_start = <my_start>
				my_front_anim = (<data>.<quadrant>.finger_front.<finger_dir>.regrab)
				my_back_anim = (<data>.<quadrant>.finger_back.<finger_dir>.regrab)
				my_left_anim = (<data>.<quadrant>.finger_left.<finger_dir>.regrab)
				my_right_anim = (<data>.<quadrant>.finger_right.<finger_dir>.regrab)
				my_center_anim = (<data>.<quadrant>.finger_center.<finger_dir>.regrab)
			}
		}
	}
	if ($ntg_blend_out_ik_finger_flip = 1)
		if ($ntg_use_ik = 1)
			ntg_ik_blend chain = Bone_IK_Foot_Board_L strength = 1.0
			ntg_ik_blend chain = Bone_IK_Foot_Board_R strength = 1.0
		endif
	endif
endscript

script ntg_start_finger_flip blendduration = 0.05
	default_vibrate_effect percent = 100 duration = 0.02
	if ($ntg_use_finger_flips = 0)
		return
	endif
	obj_spawnscriptnow ntg_sound_start_finger_flip
	nailthegrab_getlastquadrantdata
	ntg_get_quadrant_and_data <...>
	nailthegrab_getlastqcdirection
	finger_dir = <qc_dir>
	nailthegrab_setfingerfliprotationtype type = (<data>.<quadrant>.finger_flip_rot_type)
	if ($ntg_blend_out_ik_finger_flip = 1)
		if ($ntg_use_ik = 1)
			ntg_ik_blend chain = Bone_IK_Foot_Board_L strength = 0.0
			ntg_ik_blend chain = Bone_IK_Foot_Board_R strength = 0.0
		endif
	endif
	anim_command {
		target = ntg_idle_hook
		command = degenerateblend_addbranch
		params = {
			tree = $ntg_angleblend_branch
			blendduration = <blendduration>
			params = {
				my_speed = (<data>.<quadrant>.finger_flip_play_speed)
				my_sub_type = finger_flip
				my_id = ntg_finger_flip_id
				my_play_type = play
				my_front_anim = (<data>.<quadrant>.finger_front.<finger_dir>.init)
				my_back_anim = (<data>.<quadrant>.finger_back.<finger_dir>.init)
				my_left_anim = (<data>.<quadrant>.finger_left.<finger_dir>.init)
				my_right_anim = (<data>.<quadrant>.finger_right.<finger_dir>.init)
				my_center_anim = (<data>.<quadrant>.finger_center.<finger_dir>.init)
			}
		}
	}
	wait 0.1 seconds ignoreslomo
	nailthegrab_setinfingerflip value = 1
	wait 0.5 seconds ignoreslomo
	anim_command {target = ntg_finger_flip_id command = primarydirection}
	offset = 0.0
	switch <direction>
		case 0
		<offset> = (<data>.<quadrant>.finger_front.branch_offset)
		case 1
		<offset> = (<data>.<quadrant>.finger_back.branch_offset)
		case 2
		<offset> = (<data>.<quadrant>.finger_left.branch_offset)
		case 3
		<offset> = (<data>.<quadrant>.finger_right.branch_offset)
		case 4
		<offset> = (<data>.<quadrant>.finger_center.branch_offset)
	endswitch
	nailthegrab_setfingerbranchvalid offset = <offset>
	if NOT ntg_finger_flip_update_loop <...> wait_for_anim = ntg_finger_flip_id
		ntg_start_finger_flip_idle <...>
		ntg_finger_flip_update_loop <...>
	endif
	if gotparam new_finger_flick
		nailthegrab_startreflick
		return new_finger_flick = 1
	endif
	nailthegrab_setinfingerflip value = 0
	obj_spawnscriptnow ntg_sound_stop_finger_flip
endscript

script ntg_get_quadrant_and_data 
	if (<grab_stick> = 0)
		data = ntg_right_stick_anim_data
	else
		data = ntg_left_stick_anim_data
	endif
	if ($ntg_use_all_grab_directions = 0)
		if (<grab_stick> = 0)
			<quadrant> = right
		else
			<quadrant> = front
		endif
	endif
	return quadrant = <quadrant> data = <data>
endscript

script ntg_start_board_grab_anim 
	nailthegrab_settweakactive value = 0
	nailthegrab_pauseanalogupdate type = full value = 1
	nailthegrab_setgrabactive value = 1
	if (<spinning_first_trick> = 1)
		grab_anim = (<data>.<quadrant>.grab_spinning)
	else
		grab_anim = (<data>.<quadrant>.Grab)
	endif
	if ($ntg_force_grab_type = 1)
		printf "force spinning!!!!!!!"
		grab_anim = (<data>.<quadrant>.grab_spinning)
	elseif ($ntg_force_grab_type = 2)
		printf "force NON spinning!!!!!!!"
		grab_anim = (<data>.<quadrant>.Grab)
	endif
	nailthetrick_trucksup
	if (<trucks_up> = 1)
		grab_anim = (<data>.<quadrant>.grab_trucks_up)
		start_time = (<data>.<quadrant>.trucks_up_rot_start)
		rot_time = (<data>.<quadrant>.trucks_up_rot_time)
		rot_dir = (<data>.<quadrant>.trucks_up_rot_dir)
		time = (<start_time> + <rot_time>)
		nailthegrab_starttrucksupblend start_time = <start_time> rot_time = <rot_time> rot_dir = <rot_dir>
	endif
	ntg_start_hand_placement_anim {
		blendduration = 0.075
		base_anim = (<data>.<quadrant>.grab_base)
		first_trick = <first_trick>
	}
	obj_spawnscriptnow ntg_sound_start_grab
	anim_command {
		target = ntg_grab_hook
		command = degenerateblend_addbranch
		params = {
			tree = $ntg_grab_branch
			blendduration = 0.0
			params = {
				my_type = play
				my_id = ntg_grab_id
				my_anim = <grab_anim>
				my_speed = <grab_speed>
				my_start = <start>
			}
		}
	}
	if ($ntg_use_ik = 1)
		ntg_ik_blend chain = (<data>.blend_out_ik_grab) strength = 0.0 blendduration = 0.0
	endif
	wait_time = 0.5
	if (<trucks_up> = 1)
		<wait_time> = (<wait_time> + $ntg_trucks_up_tweak_delay)
	endif
	if (<spinning_first_trick> = 1)
		temp_wait = 0.55
		wait <temp_wait> seconds ignoreslomo
		nailthetrick_blendout speed = $ntg_blend_out_board_speed trucks_up
		<wait_time> = (<wait_time> - <temp_wait>)
		if (<wait_time> < 0.0)
			<wait_time> = 0.0
		endif
		if ($ntg_bail_on_grab_button_over_anim = 0)
			if NOT nailthetrick_isinvalidbranchpoint trucks_up = 0
				nailthetrick_setforcedbail value = 1
			endif
		endif
	endif
	default_vibrate_effect percent = 100 duration = 0.02 delay = 0.08
	wait <wait_time> seconds ignoreslomo
	nailthegrab_settweakactive value = 1
	nailthegrab_pauseanalogupdate type = full value = 0
	anim_command {
		target = ntg_tweak_hook
		command = degenerateblend_addbranch
		params = {
			tree = $ntg_ringblend_branch
			blendduration = 0.0
			params = {
				my_type = ringblend
				my_id = ntg_tweak_id
				my_sub_type = full
				my_animarray = (<data>.<quadrant>.tweak_rings)
				my_blend_in_speed = 1.1
			}
		}
	}
	ntg_start_idle <...>
endscript
NtgBaseTree = {
	type = ik
	id = ik
	two_bone_chains = Ntg_IK_Params_Feet
	[
		{
			type = degenerateblend
			id = ntg_base_hook
		}
	]
}

script ntg_start_hand_placement_anim {
		blendduration = 0.1
		base_anim = Sk8_Ollie_Ollie_Base_F
		first_trick = 0
	}
	if gotparam no_ik
		tree = ntg_tree_no_ik
	else
		if ($ntg_use_ik = 1)
			tree = ntg_tree
		else
			tree = ntg_tree_no_ik
		endif
	endif
	nailthetrick_setollietreevalid value = 0
	if (<first_trick> = 1)
		blend_in_below_body_ik blendduration = 0.0 strength = 0.0
		anim_command {
			target = body
			command = degenerateblend_addbranch
			params = {
				tree = $NtgBaseTree
				blendduration = <blendduration>
				params = {}
			}
		}
	endif
	if anim_animnodeexists id = ntg_base_hook
		anim_command {
			target = ntg_base_hook
			command = degenerateblend_addbranch
			params = {
				tree = $<tree>
				blendduration = <blendduration>
				params = {
					base_anim = <base_anim>
				}
			}
		}
	endif
	if invertair
		if anim_animnodeexists id = ntg_land_offset_id
			anim_command {
				target = ntg_land_offset_id
				command = pause_land_offset
				params = {pause = 1}
			}
			getskatercam
			<skatercam> :nailthetrickcamera_applycameradipnearground value = 1
		endif
	endif
endscript
