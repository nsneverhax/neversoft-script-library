ntm_min_body_spin_control_flip = 100
ntm_no_bail_range_angle = 0.8
ntm_normal_lerp_speed = 0.3
ntm_force_land = 0
ntm_perfect_manual = 0
ntm_mode_limit_top_speed = 8.0
ntm_mode_limit_adj_speed = 0.025
ntm_score_speed = 0.0
ntm_fliptrick_ollie_time = 0.5
ntm_casper_friction = 0.1
ntm_override_base_pos_and_focus = 1
ntm_max_gravity_change_height = 10.0
ntm_min_gravity_change_height = 2.0
ntm_max_gravity = 4.0
ntm_min_gravity = 2.0
ntm_smooth_cam_min_speed = 8.0
ntm_smooth_cam_max_speed = 30.0
ntm_smooth_cam_transition_speed = 15.0
ntm_trucks_up_grabs = 1
ntm_foot_grab_blend_duration = 0.0
ntm_foot_grab_speed_manual = 4.0
ntm_foot_grab_speed_casper = 4.0
ntm_transition_blendduration = 0.05
ntm_transition_speed = 4.0
ntm_casper_transition_range = 0.4
ntm_anticasper_transition_range = 0.6
ntm_perfect_ollie_height = 6.0
ntm_ollie_height = 4.0
ntm_release_rt_ollie = 1
ntm_release_rt_perfect_ollie = 0.1
ntm_ollie_control_buffer_time = 0.2
ntm_min_idle_length = 120.0
ntm_ollie_press_since_idle = 0.2
ntm_considered_idle_time = 0.0
ntm_time_before_valid_debounce = 10000.0
ntm_debounce_idle_time = 0.1
ntm_perfect_ollie_dot = 0.95
ntm_ollie_to_ntt_delay = 0.2
ntm_use_balace = 1
ntg_auto_drop_balance = 0
ntm_right_stick_speed = -0.15
ntm_left_stick_speed = 0.15
ntm_dual_stick_multiplier = 0.5
ntm_max_balance_speed = 0.5
ntm_max_balance_speed_both_sticks = 0.5
ntm_max_velocity = 0.5
ntm_max_velocity_both_sticks = 0.5
ntm_max_velocity_lerp_speed = 4.0
ntm_land_dead_zone_time = 0.75
ntm_tilt_help_speed = 1.0
ntm_safe_bail_time = 0.5
ntm_safe_skate_out_time = 0.1
ntm_land_range_air = 0.2
ntm_bail_range_air = 0.8
ntm_land_range = 0.1
ntm_bail_range = 0.98999995
ntm_camera_entry_lerp_time = 0.7
ntm_cam_rot_around_focus = (-15.0, 75.0, 0.0)
ntm_cam_pos_offset = (0.0, -0.0, -0.3)
ntm_cam_focus_offset = (0.0, -0.4, 0.0)
ntm_cam_pos_offset_vert = (2.5, 0.4, 0.5)
ntm_cam_focus_offset_vert = (0.0, 0.4, 0.0)
ntm_ground_camera_entry_lerp_time = 0.6
ntm_ground_cam_rot_around_focus = (-10.0, 65.0, 0.0)
ntm_ground_cam_pos_offset = (0.0, 0.0, -0.7)
ntm_ground_cam_focus_offset = (0.0, -0.3, 0.0)
ntm_ground_cam_pos_offset_vert = (2.0, 0.4, 1.0)
ntm_ground_cam_focus_offset_vert = (0.0, 0.4, 0.0)

script ntm_blend_out_anims 
	ntm_add_ollie_extra_anim {
		target = <target>
		blendduration = 0.2
		my_anim = Ska8_zacs_empty_anim_D
		my_trans_anim_front = Ska8_zacs_empty_anim_D
		my_trans_anim_neutral = Ska8_zacs_empty_anim_D
		my_trans_anim_back = Ska8_zacs_empty_anim_D
	}
endscript

script ntm_state_exit 
	if anim_animnodeexists id = ollieextras_takeoff
		ntm_blend_out_anims target = ollieextras_takeoff
		ntm_blend_out_anims target = ollieextras_apex
		ntm_blend_out_anims target = ollieextras_land
	endif
	if isinnailthemanual
		nailthemanual_getlastlandtype
		if nailthetrick_hadbail
			nttss_landed_state_default_exit
		elseif (<land_type> = Manual)
			ntt_exit exit_to_nail_sub_state
			return
		else
			nttss_landed_state_default_exit
		endif
	else
		ntt_camera_entry {
			lerp_time = $ntm_camera_entry_lerp_time
			ignore_super_slomo
			change_offsets
		}
	endif
	nailthetrick_setinnailthemanual value = 0
endscript
NtmExceptions = [
	{
		response = switch_script
		event = NailTheTrick
		scr = nail_the_trick
	}
	{
		response = switch_script
		event = landed
		scr = ntm_land
		params = {
		}
	}
	{
		response = switch_script
		event = pointrail
		scr = pointrail
	}
	{
		response = switch_script
		event = pointrailspin
		scr = pointrailspin
	}
	{
		response = switch_script
		event = groundgone
		scr = ntm_ground_gone
	}
	{
		response = switch_script
		event = skatercollidebail
		scr = skatercollidebail
	}
]

script nail_the_manual_state 
	nailthetrick_runscorescript goalscript = startntm
	ntt_reblend_default_tree blendduration = 0.075
	nailthemanual_setbodyspincontrolfixup value = 1
	nttss_start_sub_state
	reseteventhandlersfromtable NtmExceptions
	onexitrun ntm_state_exit
	ntt_camera_entry {
		lerp_time = $ntm_camera_entry_lerp_time
		rot_offset = $ntm_cam_rot_around_focus
		pos_offset = $ntm_cam_pos_offset
		focus_offset = $ntm_cam_focus_offset
		pos_offset_vert = $ntm_cam_pos_offset_vert
		focus_offset_vert = $ntm_cam_focus_offset_vert
		change_offsets
		ignore_super_slomo
	}
	nailthetrick_trucksup
	if (<trucks_up> = 0)
		settags nail_lock_legs
		wait 0.3 seconds ignoreslomo
		ntm_start_air_anims trucks_up = <trucks_up>
	else
		ntm_start_air_anims trucks_up = <trucks_up>
		wait 0.3 seconds ignoreslomo
	endif
	nailthetrick_blendout speed = 50.0 trucks_up
	nailthemanual_allowtilt value = 1
	begin
	DoNextTrick
	nailthemanual_getgravityvalue
	ntt_adjust_gravity gravity = <gravity_value>
	if nailthemanual_checkcaspertransition
		ntm_start_air_range_anim {
			anim_range_type = <transition_type>
			blendduration = $ntm_transition_blendduration
			speed = $ntm_transition_speed
			transition
		}
	endif
	ntm_upd_manual_land_type land_range = $ntm_land_range_air bail_range = $ntm_bail_range_air
	wait 1 gameframe
	repeat
endscript

script ntm_start_nail_the_manual 
	MakeSkaterGoto \{nail_the_manual_state}
endscript
ntm_air_branch = {
	type = addn
	[
		{
			type = nailthemanual
			anim = my_anim
			sub_type = transition
			[
				{
					type = play
					anim = my_trans_anim_front
					speed = my_speed
					[
						{
							id = bodysource
							type = source
							anim = my_trans_anim_front
						}
					]
				}
				{
					type = play
					anim = my_trans_anim_neutral
					speed = my_speed
					[
						{
							id = bodysource
							type = source
							anim = my_trans_anim_neutral
						}
					]
				}
				{
					type = play
					anim = my_trans_anim_back
					speed = my_speed
					[
						{
							id = bodysource
							type = source
							anim = my_trans_anim_back
						}
					]
				}
			]
		}
		{
			type = nailthemanual
			anim = my_anim
			[
				{
					id = bodysource
					type = source
					anim = my_anim
				}
			]
		}
	]
}

script ntm_add_ollie_extra_anim 
	anim_command {
		target = <target>
		command = degenerateblend_addbranch
		params = {
			tree = $ntm_air_branch
			blendduration = <blendduration>
			params = {
				my_anim = <my_anim>
				my_trans_anim_front = <my_trans_anim_front>
				my_trans_anim_neutral = <my_trans_anim_neutral>
				my_trans_anim_back = <my_trans_anim_back>
				my_speed = <my_speed>
			}
		}
	}
endscript

script ntm_start_air_range_anim 
	if NOT gotparam anim_range_type
		nailthetrick_trucksup
		nailthetrick_getlastxrotdir
		anim_range_type = Manual
		if (<trucks_up> = 1)
			if (<last_rot_dir> = 0)
				<anim_range_type> = casper
			else
				<anim_range_type> = anticasper
			endif
		endif
	endif
	data = Manual
	switch <anim_range_type>
		case casper
		<data> = casper
		nailthemanual_setanimatedmanualtype type = casper
		case anticasper
		<data> = anticasper
		nailthemanual_setanimatedmanualtype type = anticasper
	endswitch
	takeoff = ($NTM_Air_Data.<data>.takeoff)
	apex = ($NTM_Air_Data.<data>.apex)
	land = ($NTM_Air_Data.<data>.land)
	if gotparam transition
		my_trans_anim_front_TO = ($NTM_Air_Data.<data>.trans_takeoff_f)
		my_trans_anim_neutral_TO = ($NTM_Air_Data.<data>.trans_takeoff_n)
		my_trans_anim_back_TO = ($NTM_Air_Data.<data>.trans_takeoff_b)
		my_trans_anim_front_Apex = ($NTM_Air_Data.<data>.trans_apex_f)
		my_trans_anim_neutral_Apex = ($NTM_Air_Data.<data>.trans_apex_n)
		my_trans_anim_back_Apex = ($NTM_Air_Data.<data>.trans_apex_b)
		my_trans_anim_front_Land = ($NTM_Air_Data.<data>.trans_land_f)
		my_trans_anim_neutral_Land = ($NTM_Air_Data.<data>.trans_land_n)
		my_trans_anim_back_Land = ($NTM_Air_Data.<data>.trans_land_b)
	else
		my_trans_anim_front_TO = ($NTM_Air_Data.<data>.catch_takeoff_f)
		my_trans_anim_neutral_TO = ($NTM_Air_Data.<data>.catch_takeoff_n)
		my_trans_anim_back_TO = ($NTM_Air_Data.<data>.catch_takeoff_b)
		my_trans_anim_front_Apex = ($NTM_Air_Data.<data>.catch_apex_f)
		my_trans_anim_neutral_Apex = ($NTM_Air_Data.<data>.catch_apex_n)
		my_trans_anim_back_Apex = ($NTM_Air_Data.<data>.catch_apex_b)
		my_trans_anim_front_Land = ($NTM_Air_Data.<data>.catch_land_f)
		my_trans_anim_neutral_Land = ($NTM_Air_Data.<data>.catch_land_n)
		my_trans_anim_back_Land = ($NTM_Air_Data.<data>.catch_land_b)
	endif
	ntm_add_ollie_extra_anim {
		target = ollieextras_takeoff
		my_anim = <takeoff>
		my_trans_anim_front = <my_trans_anim_front_TO>
		my_trans_anim_neutral = <my_trans_anim_neutral_TO>
		my_trans_anim_back = <my_trans_anim_back_TO>
		blendduration = <blendduration>
		my_speed = <speed>
	}
	ntm_add_ollie_extra_anim {
		target = ollieextras_apex
		my_anim = <apex>
		my_trans_anim_front = <my_trans_anim_front_Apex>
		my_trans_anim_neutral = <my_trans_anim_neutral_Apex>
		my_trans_anim_back = <my_trans_anim_back_Apex>
		blendduration = <blendduration>
		my_speed = <speed>
	}
	ntm_add_ollie_extra_anim {
		target = ollieextras_land
		my_anim = <land>
		my_trans_anim_front = <my_trans_anim_front_Land>
		my_trans_anim_neutral = <my_trans_anim_neutral_Land>
		my_trans_anim_back = <my_trans_anim_back_Land>
		blendduration = <blendduration>
		my_speed = <speed>
	}
endscript

script ntm_start_air_anims 
	if NOT nailthetrick_isollietreevalid
		ntt_ollie_anim \{$Ollie_data
			groundgone = 1
			blendduration = 0.075
			sync = 1}
	endif
	ntt_blend_out_non_nail_animation
	if (<trucks_up> = 1)
		foot_grab_blend_time = $ntm_foot_grab_speed_casper
	else
		foot_grab_blend_time = $ntm_foot_grab_speed_manual
	endif
	ntm_start_air_range_anim {
		blendduration = $ntm_foot_grab_blend_duration
		speed = <foot_grab_blend_time>
	}
endscript

script ntm_upd_manual_land_type 
	nailthemanual_gettilt
	if gotparam ground
		switch (<type>)
			case Manual
			<biased_tilt> = (1.0 - <tilt>)
			case nose_manual
			<biased_tilt> = <tilt>
			case casper
			<biased_tilt> = (1.0 - <tilt>)
			case anticasper
			<biased_tilt> = <tilt>
		endswitch
	endif
	if ($ntm_force_land = 1)
		nailthemanual_setlastlandtype land_type = land
		return type = <type>
	endif
	<stop_bail> = 0
	if ($ntm_perfect_manual = 1)
		<stop_bail> = 1
	endif
	if NOT nailthemanual_allowbail
		<stop_bail> = 1
	endif
	if (<stop_bail> = 1)
		nailthemanual_setlastlandtype land_type = Manual
		return type = <type>
	endif
	if (<biased_tilt> < <land_range>)
		land_type = land
		if (<type> = casper)
			<land_type> = bail
		endif
		if (<type> = anticasper)
			<land_type> = bail
		endif
		nailthemanual_setlastlandtype land_type = <land_type>
	else
		if (<biased_tilt> < <bail_range>)
			nailthemanual_setlastlandtype land_type = Manual
		else
			nailthemanual_setlastlandtype land_type = bail
		endif
	endif
	return type = <type>
endscript

script ntm_goto_land 
	nail_add_score_to_main_combo_score
	if gotparam \{no_shake}
		MakeSkaterGoto \{land
			params = {
				no_shake
			}}
	else
		MakeSkaterGoto \{land}
	endif
endscript

script ntm_general_bail 
	if NOT istrue \{$ntt_ragdoll_bails}
		ntm_goto_land
	endif
	nailthex_onbail
	GeneralBail {
		Anim1 = human_default
		ForcedBail
		NoInit
		pedhit = <pedhit>
		nttbail
	}
endscript

script ntm_land 
	nailthemanual_getlastlandtype
	if (<land_type> = land)
		ntm_goto_land
	else
		soundevent event = nail_the_manual_land_sfx
		if (<land_type> = Manual)
			nailthemanual_gettilt
			switch (<type>)
				case Manual
				AnimData = $NTM_Manual_Data
				case nose_manual
				AnimData = $NTM_NoseManual_Data
				case casper
				AnimData = $NTM_Casper_Data
				case anticasper
				AnimData = $NTM_AntiCasper_Data
			endswitch
			goto ntm_manual_ground_state params = {
				AnimData = <AnimData>
				range_anim = <range_anim>
				type = <type>
			}
		endif
	endif
	goto ntm_general_bail
endscript

script ntm_ground_state_exit 
	ntm_kill_scrape_effect
	if isinnailthemanual
		soundevent \{event = nail_the_trick_do_trick}
		if NOT invertair
			ntt_camera_entry \{lerp_time = $ntm_camera_entry_lerp_time
				ignore_super_slomo
				change_offsets}
		endif
	else
		nttss_landed_state_default_exit
	endif
	nailthetrick_setinnailthemanual \{value = 0}
	nailthemanual_setgroundstate \{value = 0}
	SetRollingFriction \{`default`}
endscript

script ntm_ground_release_command 
	launchevent type = NTMReleaseCommand target = <objid> data = {<...> no_shake}
endscript

script ntm_play_ollie_anim \{sync = 0
		groundgone = 1}
	ntt_ollie_anim {
		<...>
		groundgone = <groundgone>
		blendduration = 0.1
		skip_blend_out_non_nail
	}
endscript

script ntm_ground_gone_exit 
	nailthetrick_setinnailthemanual \{value = 0}
endscript

script ntm_ground_gone 
	nailthetrick_setinnailthemanual \{value = 1}
	onexitrun \{ntm_ground_gone_exit}
	wait \{1
		gameframe}
	nailthemanual_getanimatedmanualtype
	ntm_ollie <...> roll_off_ledge = 1
endscript

script ntm_add_in_trucks_up_board_for_blend 
	nailthetrick_setstarttrucksup \{value = 1}
	anim_command \{target = ollieextras
		command = degenerateblend_addbranch
		params = {
			tree = $ntt_board_animbranch
			blendduration = 0.0
			params = {
			}
		}}
endscript

script ntm_ollie roll_off_ledge = 0
	default_vibrate_effect percent = 100 duration = 0.02
	nailthemanual_debounceentry
	LaunchStateChangeEvent state = Skater_InAir
	start_trucks_up = 0
	switch (<type>)
		case Manual
		ntm_play_ollie_anim $NTM_Ollie_data <...>
		case nose_manual
		if NOT gotparam skip_flip_and_rot
			flipandrotate
		endif
		ntm_play_ollie_anim $NTM_Nollie_data <...>
		case casper
		<start_trucks_up> = 1
		ntm_play_ollie_anim $NTM_Casper_Ollie_data <...>
		if NOT gotparam skip_trucks_up_board_for_blend
			ntm_add_in_trucks_up_board_for_blend
		endif
		case anticasper
		<start_trucks_up> = 1
		if NOT gotparam skip_flip_and_rot
			flipandrotate
		endif
		ntm_play_ollie_anim $NTM_Anticasper_Nollie_data <...>
		if NOT gotparam skip_trucks_up_board_for_blend
			ntm_add_in_trucks_up_board_for_blend
		endif
	endswitch
	if gotparam anim_only
		return
	endif
	if (<roll_off_ledge> = 0)
		if gotparam perfect
			jump speed = $ntm_perfect_ollie_height
		else
			jump speed = $ntm_ollie_height
		endif
	else
		if invertair
			jump speed = $ntm_ollie_height
		endif
	endif
	if ($ntm_release_rt_ollie = 0)
		wait $ntm_ollie_to_ntt_delay seconds ignoreslomo
	endif
	wait 0.1 seconds ignoreslomo
	if invertair
		ntm_reblend_ntt_camera stop_vert_cam_flip = 0
	endif
	nailthetrick_setautoexitdelay time = 1.0
	StartNtt {
		from_nail_the_manual
		from_ntm_ground_state
		ntm_ollie_type = <type>
		start_trucks_up = <start_trucks_up>
		ntm_roll_off_ledge = <roll_off_ledge>
	}
endscript

script ntm_get_ntt_takeoff_leg_anims 
	if NOT gotparam \{ntm_ollie_type}
		nailthetrick_overridedefaultanims \{value = 0}
		return \{$ntt_TO_anims}
	endif
	nailthetrick_overridedefaultanims \{value = 1}
	switch (<ntm_ollie_type>)
		case Manual
		return \{$NTM_Ollie_ntt_TO_anims}
		case nose_manual
		return \{$NTM_Nollie_ntt_TO_anims}
		case casper
		return \{$NTM_Casper_ntt_TO_anims}
		case anticasper
		return \{$NTM_Anticasper_ntt_TO_anims}
	endswitch
endscript

script ntm_get_ntt_takeoff_flick_anims 
	if NOT gotparam \{ntm_ollie_type}
		return \{$ntt_TO_flicks}
	endif
	switch (<ntm_ollie_type>)
		case Manual
		return \{$NTM_Ollie_ntt_TO_flicks}
		case nose_manual
		return \{$NTM_Nollie_ntt_TO_flicks}
		case casper
		return \{$NTM_Casper_ntt_TO_flicks}
		case anticasper
		return \{$NTM_Anticasper_ntt_TO_flicks}
	endswitch
endscript

script ntm_get_ntt_takeoff_flick_anims_trucks_up 
	if NOT gotparam \{ntm_ollie_type}
		return \{$ntt_TO_flicks_trucks}
	endif
	switch (<ntm_ollie_type>)
		case Manual
		return \{$NTM_Ollie_ntt_TO_flicks_trucks}
		case nose_manual
		return \{$NTM_Nollie_ntt_TO_flicks_trucks}
		case casper
		return \{$NTM_Casper_ntt_TO_flicks_trucks}
		case anticasper
		return \{$NTM_Anticasper_ntt_TO_flicks_trucks}
	endswitch
endscript

script ntm_get_ntt_apex_leg_anims 
	if NOT gotparam \{ntm_ollie_type}
		return \{$ntt_Apex_anims}
	endif
	switch (<ntm_ollie_type>)
		case Manual
		return \{$NTM_Ollie_ntt_Apex_anims}
		case nose_manual
		return \{$NTM_Nollie_ntt_Apex_anims}
		case casper
		return \{$NTM_Casper_ntt_Apex_anims}
		case anticasper
		return \{$NTM_Anticasper_ntt_Apex_anims}
	endswitch
endscript

script ntm_get_ntt_apex_flick_anims 
	if NOT gotparam \{ntm_ollie_type}
		return \{$ntt_Apex_flicks}
	endif
	switch (<ntm_ollie_type>)
		case Manual
		return \{$NTM_Ollie_ntt_Apex_flicks}
		case nose_manual
		return \{$NTM_Nollie_ntt_Apex_flicks}
		case casper
		return \{$NTM_Casper_ntt_Apex_flicks}
		case anticasper
		return \{$NTM_Anticasper_ntt_Apex_flicks}
	endswitch
endscript

script ntm_get_ntt_apex_flick_anims_trucks_up 
	if NOT gotparam \{ntm_ollie_type}
		return \{$ntt_Apex_flicks_trucks}
	endif
	switch (<ntm_ollie_type>)
		case Manual
		return \{$NTM_Ollie_ntt_Apex_flicks_trucks}
		case nose_manual
		return \{$NTM_Nollie_ntt_Apex_flicks_trucks}
		case casper
		return \{$NTM_Casper_ntt_Apex_flicks_trucks}
		case anticasper
		return \{$NTM_Anticasper_ntt_Apex_flicks_trucks}
	endswitch
endscript

script ntm_get_ntt_Land_leg_anims 
	if NOT gotparam \{ntm_ollie_type}
		return \{$ntt_Land_anims}
	endif
	switch (<ntm_ollie_type>)
		case Manual
		return \{$NTM_Ollie_ntt_Land_anims}
		case nose_manual
		return \{$NTM_Nollie_ntt_Land_anims}
		case casper
		return \{$NTM_Casper_ntt_Land_anims}
		case anticasper
		return \{$NTM_Anticasper_ntt_Land_anims}
	endswitch
endscript

script ntm_get_ntt_Land_flick_anims 
	if NOT gotparam \{ntm_ollie_type}
		return \{$ntt_Land_flicks}
	endif
	switch (<ntm_ollie_type>)
		case Manual
		return \{$NTM_Ollie_ntt_Land_flicks}
		case nose_manual
		return \{$NTM_Nollie_ntt_Land_flicks}
		case casper
		return \{$NTM_Casper_ntt_Land_flicks}
		case anticasper
		return \{$NTM_Anticasper_ntt_Land_flicks}
	endswitch
endscript

script ntm_get_ntt_Land_flick_anims_trucks_up 
	if NOT gotparam \{ntm_ollie_type}
		return \{$ntt_Land_flicks_trucks}
	endif
	switch (<ntm_ollie_type>)
		case Manual
		return \{$NTM_Ollie_ntt_Land_flicks_trucks}
		case nose_manual
		return \{$NTM_Nollie_ntt_Land_flicks_trucks}
		case casper
		return \{$NTM_Casper_ntt_Land_flicks_trucks}
		case anticasper
		return \{$NTM_Anticasper_ntt_Land_flicks_trucks}
	endswitch
endscript

script ntm_reblend_ntt_camera \{stop_vert_cam_flip = 0
		try_to_use_frontside_camera = 0}
	ntt_camera_entry {
		lerp_time = 0.0001
		ignore_super_slomo
		stop_vert_cam_flip = <stop_vert_cam_flip>
		try_to_use_frontside_camera = <try_to_use_frontside_camera>
	}
endscript

script ntm_manual_ground_state 
	nailthemanual_setbodyspincontrolfixup value = 1
	nailthemanual_getbodyspincontrolfixup
	nailthemanual_setbodyspincontrolfixup value = 0
	ntm_reblend_ntt_camera try_to_use_frontside_camera = <fixup>
	ntm_setup_scrape_effect
	if nailthetrick_isboard180rotate
		boardrotateafter
	endif
	nailthemanual_setgroundstate value = 1
	LaunchStateChangeEvent state = Skater_OnGround
	default_vibrate_effect percent = 75 duration = 0.03
	land_effect_play_dust
	ShakeCamera duration = 0.1 vert_amp = 0.08 vert_vel = 40.0
	onexitrun ntm_ground_state_exit
	killextratricks
	if ($ntm_release_rt_ollie = 0)
		seteventhandler event = NTMReleaseCommand scr = land params = {<...>}
	endif
	setqueuetricks NoTricks
	setmanualtricks NoTricks
	if landedfromvert
		Revert_ScuffSpeed
		Skater_PlayManualAnim {
			<AnimData>
			blendduration = 0.1
			my_speed = $ntm_land_play_speed
			my_speed_idle = $ntm_idle_play_speed
			force_land_strength = $ntm_force_land_strength
			no_land
		}
	else
		Skater_PlayManualAnim {
			<AnimData>
			blendduration = 0.1
			my_speed = $ntm_land_play_speed
			my_speed_idle = $ntm_idle_play_speed
			force_land_strength = $ntm_force_land_strength
		}
	endif
	ntt_camera_entry {
		lerp_time = $ntm_ground_camera_entry_lerp_time
		rot_offset = $ntm_ground_cam_rot_around_focus
		pos_offset = $ntm_ground_cam_pos_offset
		focus_offset = $ntm_ground_cam_focus_offset
		pos_offset_vert = $ntm_ground_cam_pos_offset_vert
		focus_offset_vert = $ntm_ground_cam_focus_offset_vert
		change_offsets
		ignore_super_slomo
	}
	nailthemanual_startgroundstate
	if (<type> = casper)
		SetRollingFriction $ntm_casper_friction
	elseif (<type> = anticasper)
		SetRollingFriction $ntm_casper_friction
	endif
	getstarttime
	begin
	edge_help = 0
	ntm_upd_manual_land_type land_range = $ntm_land_range bail_range = $ntm_bail_range ground
	nailthemanual_getlastlandtype
	if gotparam edge_help
		if (<edge_help> = 1)
			ntm_play_scrape_effect type = <type>
			vibrate actuator = 0 percent = 100 duration = 0.02
			vibrate actuator = 1 percent = 100 duration = 0.02
		endif
		if NOT (<edge_help> = 1)
			soundevent event = NTM_scrape_SFX_off
		endif
	endif
	if (<land_type> = land)
		getspeed
		if (<speed> < 5)
			setspeed 5.0
		endif
		nailthetrick_setinnailthemanual value = 0
		ntm_goto_land no_shake
	endif
	if (<land_type> = bail)
		nailthetrick_setinnailthemanual value = 0
		goto ntm_general_bail
	endif
	if ($ntm_release_rt_ollie = 0)
		if nailthemanual_hadcontrolpress control = down_up
			soundevent event = NTM_scrape_SFX_off
			ntm_ollie <...>
		endif
	else
		if NOT nailthemanual_ismodecontrolheld
			soundevent event = NTM_scrape_SFX_off
			ntm_ollie <...>
		endif
	endif
	if (<edge_help> = 0)
		getelapsedtime starttime = <starttime>
		if (<elapsedtime> > 50)
			nailthemanual_getanimatedmanualtype
			if (<type> = casper)
				default_vibrate_effect percent = 15
			elseif (<type> = anticasper)
				default_vibrate_effect percent = 15
			endif
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script ntm_kill_scrape_effect 
	gettags
	if gotparam \{backManualFXID01}
		if iscreated <backManualFXID01>
			<backManualFXID01> :destroy ifempty = 1
			removetags \{[
					backManualFXID01
				]}
		endif
	endif
	if gotparam \{noseManualFXID01}
		if iscreated <noseManualFXID01>
			<noseManualFXID01> :destroy ifempty = 1
			removetags \{[
					noseManualFXID01
				]}
		endif
	endif
endscript

script ntm_setup_scrape_effect 
	obj_getid
	getuniquecompositeobjectid \{preferredid = BackManualFX01}
	createparticlesystem name = <uniqueid> objid = <objid> bone = Bone_board_Wheel_Back params_script = $GP_NTM_WoodBits01
	manglechecksums a = <uniqueid> b = <objid>
	settags backManualFXID01 = <mangled_id>
	getuniquecompositeobjectid \{preferredid = NoseManualFX01}
	createparticlesystem name = <uniqueid> objid = <objid> bone = Bone_board_Wheel_Nose params_script = $GP_NTM_WoodBits01
	manglechecksums a = <uniqueid> b = <objid>
	settags noseManualFXID01 = <mangled_id>
endscript

script ntx_flip_effect_bone 
	if NOT isinnailthemanual
		return \{false}
	endif
	nailthemanual_getanimatedmanualtype
	do_flip = 0
	if (<type> = nose_manual)
		<do_flip> = (1 - <do_flip>)
	elseif (<type> = anticasper)
		<do_flip> = (1 - <do_flip>)
	endif
	if boardisrotated
		<do_flip> = (1 - <do_flip>)
	endif
	if (<do_flip> = 0)
		return \{false}
	endif
	return \{true}
endscript

script ntm_play_scrape_effect 
	gettags
	if NOT gotparam backManualFXID01
		return
	endif
	if NOT gotparam noseManualFXID01
		return
	endif
	if (<type> = casper)
		return
	elseif (<type> = anticasper)
		return
	endif
	if ntx_flip_effect_bone
		id = <noseManualFXID01>
	else
		id = <backManualFXID01>
	endif
	if iscreated <id>
		obj_getvelocity
		normalizevector <vel>
		<id> :setemittarget target = (-1.0 * <norm>)
		<id> :emit num = RandomRange (0.0, 1.0)
		soundevent event = NTM_scrape_SFX
	endif
endscript
