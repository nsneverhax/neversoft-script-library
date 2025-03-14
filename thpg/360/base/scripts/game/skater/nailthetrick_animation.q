ntt_sub_main_anim_branch = {
	type = add
	[
		{
			type = add
			[
				{
					type = NailTheTrick
					algorithm_type = inv_strength
					[
						{
							type = source
							anim = my_neutral_foot_pos_left
						}
					]
				}
				{
					type = addn
					[
						{
							type = NailTheTrick
							stick = left
							dir = left
							algorithm_type = my_algorithm_type
							[
								{
									type = source
									anim = anim_left_left
								}
							]
						}
						{
							type = NailTheTrick
							stick = left
							dir = right
							algorithm_type = my_algorithm_type
							[
								{
									type = source
									anim = anim_left_right
								}
							]
						}
						{
							type = NailTheTrick
							stick = left
							dir = up
							algorithm_type = my_algorithm_type
							[
								{
									type = source
									anim = anim_left_up
								}
							]
						}
						{
							type = NailTheTrick
							stick = left
							dir = down
							algorithm_type = my_algorithm_type
							[
								{
									type = source
									anim = anim_left_down
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
					type = NailTheTrick
					algorithm_type = inv_strength
					[
						{
							type = source
							anim = my_neutral_foot_pos_right
						}
					]
				}
				{
					type = addn
					[
						{
							type = NailTheTrick
							stick = right
							dir = left
							algorithm_type = my_algorithm_type
							[
								{
									type = source
									anim = anim_right_left
								}
							]
						}
						{
							type = NailTheTrick
							stick = right
							dir = right
							algorithm_type = my_algorithm_type
							[
								{
									type = source
									anim = anim_right_right
								}
							]
						}
						{
							type = NailTheTrick
							stick = right
							dir = up
							algorithm_type = my_algorithm_type
							[
								{
									type = source
									anim = anim_right_up
								}
							]
						}
						{
							type = NailTheTrick
							stick = right
							dir = down
							algorithm_type = my_algorithm_type
							[
								{
									type = source
									anim = anim_right_down
								}
							]
						}
					]
				}
			]
		}
	]
}
ntt_sub_playtype_anim_branch = {
	type = my_type
	anim = my_anim
	speed = my_speed
	[
		{
			type = NailTheTrick
			stick = my_stick
			dir = my_dir
			algorithm_type = my_algorithm_type
			[
				{
					type = source
					anim = my_anim
				}
			]
		}
	]
}
ntt_playtype_anim_branch = {
	type = addn
	[
		{
			type = nestedtree
			tree = ntt_sub_playtype_anim_branch
			user_params = {
				my_stick = left
				my_dir = left
				my_anim = anim_left_left
			}
		}
		{
			type = nestedtree
			tree = ntt_sub_playtype_anim_branch
			user_params = {
				my_stick = left
				my_dir = right
				my_anim = anim_left_right
			}
		}
		{
			type = nestedtree
			tree = ntt_sub_playtype_anim_branch
			user_params = {
				my_stick = left
				my_dir = up
				my_anim = anim_left_up
			}
		}
		{
			type = nestedtree
			tree = ntt_sub_playtype_anim_branch
			user_params = {
				my_stick = left
				my_dir = down
				my_anim = anim_left_down
			}
		}
		{
			type = nestedtree
			tree = ntt_sub_playtype_anim_branch
			user_params = {
				my_stick = right
				my_dir = left
				my_anim = anim_right_left
			}
		}
		{
			type = nestedtree
			tree = ntt_sub_playtype_anim_branch
			user_params = {
				my_stick = right
				my_dir = right
				my_anim = anim_right_right
			}
		}
		{
			type = nestedtree
			tree = ntt_sub_playtype_anim_branch
			user_params = {
				my_stick = right
				my_dir = up
				my_anim = anim_right_up
			}
		}
		{
			type = nestedtree
			tree = ntt_sub_playtype_anim_branch
			user_params = {
				my_stick = right
				my_dir = down
				my_anim = anim_right_down
			}
		}
	]
}
ntt_main_anim_branch = {
	type = addn
	[
		{
			type = nestedtree
			tree = ntt_sub_main_anim_branch
			user_params = {
				my_algorithm_type = `default`
				anim_left_left = base_anim_left_left
				anim_left_right = base_anim_left_right
				anim_left_up = base_anim_left_up
				anim_left_down = base_anim_left_down
				anim_right_left = base_anim_right_left
				anim_right_right = base_anim_right_right
				anim_right_up = base_anim_right_up
				anim_right_down = base_anim_right_down
				my_neutral_foot_pos_left = neutral_foot_pos_left
				my_neutral_foot_pos_right = neutral_foot_pos_right
			}
		}
		{
			type = nestedtree
			tree = ntt_playtype_anim_branch
			user_params = {
				my_type = cycle
				my_algorithm_type = strength
				my_speed = 0.7
				anim_left_left = idle_anim_left_left
				anim_left_right = idle_anim_left_right
				anim_left_up = idle_anim_left_up
				anim_left_down = idle_anim_left_down
				anim_right_left = idle_anim_right_left
				anim_right_right = idle_anim_right_right
				anim_right_up = idle_anim_right_up
				anim_right_down = idle_anim_right_down
			}
		}
		{
			type = degenerateblend
			id = my_flick_id
		}
	]
}
ntt_board_animbranch = {
	type = nailthetrickboardrotate
	id = nailthetrickboardrotate
	[
		{
			type = blank
		}
	]
}

script ntt_do_kick_anim_command 
	anim_command {
		target = <target>
		command = degenerateblend_addbranch
		params = {
			tree = $ntt_playtype_anim_branch
			blendduration = 0.05
			params = {
				my_type = play
				my_algorithm_type = play
				my_speed = 2.3
				<...>
			}
		}
	}
endscript

script ntt_do_kick 
	if NOT anim_animnodeexists id = ntt_flick_branch_takeoff
		return
	endif
	if (<had_casper_blend> = 1)
		<ntm_ollie_type> = casper
	endif
	if gotparam branch
		ntm_get_ntt_takeoff_flick_anims_trucks_up <...>
		ntt_do_kick_anim_command {
			target = ntt_flick_branch_takeoff
			<...>
		}
		ntm_get_ntt_apex_flick_anims_trucks_up <...>
		ntt_do_kick_anim_command {
			target = ntt_flick_branch_apex
			<...>
		}
		ntm_get_ntt_Land_flick_anims_trucks_up <...>
		ntt_do_kick_anim_command {
			target = ntt_flick_branch_land
			<...>
		}
	else
		ntm_get_ntt_takeoff_flick_anims <...>
		ntt_do_kick_anim_command {
			target = ntt_flick_branch_takeoff
			<...>
		}
		ntm_get_ntt_apex_flick_anims <...>
		ntt_do_kick_anim_command {
			target = ntt_flick_branch_apex
			<...>
		}
		ntm_get_ntt_Land_flick_anims <...>
		ntt_do_kick_anim_command {
			target = ntt_flick_branch_land
			<...>
		}
	endif
endscript

script ntt_leg_branches 
	anim_command {
		target = <target>
		command = degenerateblend_addbranch
		params = {
			tree = $ntt_main_anim_branch
			blendduration = <blendduration>
			params = {
				<...>
			}
		}
	}
endscript

script add_foot_animation_branch anim_blend_only = 0 blendduration = 0.1
	if (<anim_blend_only> = 0)
		if gotparam enter_from_nail_sub_state
			nailthetrick_resetboardrotaterelated
			nailthetrick_blendout trucks_up
		else
			nailthetrick_resetboardrotaterelated first_trick
		endif
		if NOT anim_animnodeexists id = ollieextras_apex
			return
		endif
	endif
	if gotparam had_casper_blend
		if (<had_casper_blend> = 1)
			return
		endif
	endif
	ntm_get_ntt_takeoff_leg_anims <...>
	ntt_leg_branches {
		target = ollieextras_takeoff
		<...>
		my_flick_id = ntt_flick_branch_takeoff
	}
	ntm_get_ntt_apex_leg_anims <...>
	ntt_leg_branches {
		target = ollieextras_apex
		<...>
		my_flick_id = ntt_flick_branch_apex
	}
	ntm_get_ntt_Land_leg_anims <...>
	ntt_leg_branches {
		target = ollieextras_land
		<...>
		my_flick_id = ntt_flick_branch_land
	}
	anim_command {
		target = ollieextras
		command = degenerateblend_addbranch
		params = {
			tree = $ntt_board_animbranch
			blendduration = 0.0
			params = {
			}
		}
	}
endscript
ntm_blend_out_flick_tree = {
	type = source
	anim = Ska8_zacs_empty_anim_D
}

script ntm_blend_out_flick \{blendduration = 0.1}
	if NOT anim_animnodeexists \{id = ntt_flick_branch_takeoff}
		return
	endif
	anim_command target = ntt_flick_branch_takeoff command = degenerateblend_addbranch params = {tree = $ntm_blend_out_flick_tree blendduration = <blendduration>}
	anim_command target = ntt_flick_branch_apex command = degenerateblend_addbranch params = {tree = $ntm_blend_out_flick_tree blendduration = <blendduration>}
	anim_command target = ntt_flick_branch_land command = degenerateblend_addbranch params = {tree = $ntm_blend_out_flick_tree blendduration = <blendduration>}
endscript
