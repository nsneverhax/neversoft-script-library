ntg_trucks_up_grabs = 1
ntg_trucks_up_tweak_delay = 0.3
ntg_default_trucks_up_rot_start = 0.4
ntg_default_trucks_up_rot_time = 0.6
ntg_default_trucks_up_rot_dir = cw
ntg_default_offset = 70.0
ntg_default_offset_shoveit = 70.0
ntg_finger_flip_branch_angle = 70.0
ntg_show_branch_window = 0
ntg_max_branch_point = 666.0
ntg_clean_finger_regrab = 20.0
ntg_sloppy_finger_regrab = 40.0
ntg_bail_fall_speed = -1.5
ntg_use_all_grab_directions = 1
ntg_use_finger_flips = 1
ntg_lock_clockwise_spin = 0
ntg_tweak_return_length = 40.0
ntg_ring_blend_in_curve = [
	0.0
	1.0
]
ntg_speed_reblend_adj = 5.0
ntg_analog_blend_speed = 2.5
ntg_analog_blend_speed_curve = [
	1.0
	0.1
]
ntg_analog_blend_speed_mini = 3.5
ntg_analog_blend_speed_curve_mini = [
	1.0
]
ntg_analog_return_blend_speed = 4.0
ntg_use_inward_pull = 0
ntg_shake_curve = [
	0.0
	0.0017026401
	0.00709305
	0.0170518
	0.032807395
	0.0561418
	0.08977
	0.138089
	0.208782
	0.31646502
	0.489548
	0.75872207
	0.98160493
	1.0
]
ntg_mod_blend_idle_dampen = 0.5
ntg_mod_blend_mini_dampen = 0.5
ntg_flip_sticks = 1
ntg_considered_idle_time = 0.075
ntg_bail_on_grab_button_over_anim = 1
ntg_speed_adj_decelerate_adj = 2.0
ntg_stop_rotation_past_branch = 1
ntg_stop_rotation_past_branch_speed_adj = 2.0
ntg_blend_out_board_speed = 25.0
ntg_use_ik = 1
ntg_max_origin_offset = 0.5
ntg_land_offset_bone = control_root
ntg_land_offset_bone_board = bone_board_180
ntg_land_offset_blend_curve = [
	0.0
	0.1
	0.2
	0.4
	0.8
	1.0
]
ntg_blend_in_land_offset_speed = 2.0
ntg_analog_change_length_check = 10.0
ntg_use_primary_analog_stick_system = 0
ntg_finger_flip_bail_rot_adj = 90.0
ntg_random_bail_rotation_speed = 10.0
ntg_fing_flip_stick = full
ntg_start_finger_flip_control_type = quarter_circle_release
ntg_stop_finger_flip_control_type = direction
finger_flip_rot_speed = 4.0
ntg_finger_flip_anim_speed = 7.0
ntg_finger_flip_control_buffer_time_qc = 0.1
ntg_release_qc_buffer_time = 0.5
ntg_finger_flip_control_buffer_time_bf = 0.5
ntg_quarter_circle_angle = 25.0
ntg_min_qc_length = 0.0
ntg_finger_flip_button = r3
ntg_show_qc_data = 0
ntg_tweak_speed_adj = 2.0
ntg_tweak_speed_adj_buffer = 2.0
ntg_turn_delay_min_mag = 1.99
ntg_use_qc_rotation_directions = 1
ntg_camera_entry_lerp_time = 0.7
ntg_cam_rot_around_focus = (-20.0, 65.0, 0.0)
ntg_cam_pos_offset = (0.0, 0.35000002, -0.3)
ntg_cam_focus_offset = (0.0, -0.05, 0.0)
ntg_cam_pos_offset_vert = (3.0, 1.0, 0.5)
ntg_cam_focus_offset_vert = (0.0, 1.0, 0.0)
ntg_inward_pull_angle_change_speed = 0.5
ntg_inward_pull_angle_stoped_speed = 0.5
ntg_inward_pull_deceleration = 0.1
ntg_inward_pull_return_speed = 0.5
ntg_inward_pull_return_speed_curve = [
	1.0
	5.0
	10.0
	20.0
]
ntg_inward_pull_min_speed = 1.0
ntg_inward_pull_max = 10.0
ntg_perfect_grab_bonus_range_x = 0.98999995
ntg_perfect_grab_bonus_range_y = 0.98999995
ntg_shake_lerp_speed = 3.0
ntt_maintain_board_rotation = 1
ntg_vibration_max = 75.0
ntg_pre_sweet_spot_vibration_adj = 0.2
ntg_message_pause_time = 1.0
ntg_mini_tweak_multiplier = 1.0

script ntg_state_exit 
	if isinnailthegrab
		nttss_landed_state_default_exit
	else
		nailthetrickscore_getscoreinfo
		if NOT (<ntg_score> = 0)
			nailthetrick_checkclosecall
		endif
		ntg_start_hand_placement_anim \{no_ik
			blendduration = 0.2}
		obj_spawnscriptnow \{ntg_sound_camera_out}
		ntt_camera_entry \{lerp_time = $ntg_camera_entry_lerp_time
			ignore_super_slomo
			change_offsets}
	endif
	nailthegrab_settweakactive \{value = 0}
	nailthegrab_setgrabactive \{value = 0}
	nailthegrab_setinfingerflip \{value = 0}
	setinnailthegrab \{value = 0}
endscript

script nail_the_grab_state 
	nailthetrick_runscorescript goalscript = startntg
	nttss_start_sub_state
	onexitrun ntg_state_exit
	obj_spawnscriptnow ntg_sound_camera_in
	ntt_camera_entry {
		lerp_time = $ntg_camera_entry_lerp_time
		rot_offset = $ntg_cam_rot_around_focus
		pos_offset = $ntg_cam_pos_offset
		focus_offset = $ntg_cam_focus_offset
		pos_offset_vert = $ntg_cam_pos_offset_vert
		focus_offset_vert = $ntg_cam_focus_offset_vert
		change_offsets
		ignore_super_slomo
	}
	spinning_first_trick = 0
	force_quad_data = 0
	if nailthetrick_isintrick
		<spinning_first_trick> = 1
		<force_quad_data> = 1
	endif
	first_trick = 1
	new_finger_flick = 0
	begin
	if NOT nailthegrab_isgrabactive
		if nailthegrab_getgrabquadrantdata force = <force_quad_data>
			if NOT nailthegrab_istryingtoexit
				ntg_get_quadrant_and_data <...>
				if (<first_trick> = 1)
					nailthegrab_resetanalogposition mini
					nailthegrab_resetanalogposition full
					settags nail_lock_legs
				else
					nailthegrab_startgrabtransfer
				endif
				start = 0.0
				grab_blend_dur = 0.1
				grab_speed = 4.0
				blend_out_of_rot = 1
				if nailthetrick_gettrickrotationtype
					if (<rot_type> = roll)
						<blend_out_of_rot> = 0
					endif
					if ((<data>.<quadrant>.grab_from_spin) = 1)
						<blend_out_of_rot> = 0
					endif
					nailthetrick_trucksup
					if (<trucks_up> = 1)
						<blend_out_of_rot> = 1
					endif
				endif
				if (<spinning_first_trick> = 1)
					nailthegrab_startfliptricktograb
					if (<blend_out_of_rot> = 1)
						wait 0.3 seconds ignoreslomo
						nailthetrick_blendout speed = 25.0 trucks_up
						<start> = 0.05
						<grab_blend_dur> = 0.05
						<grab_speed> = 5.0
						<spinning_first_trick> = 0
					endif
				endif
				if (<first_trick> = 1)
					nailthegrab_getgrabquadrantdata force = <force_quad_data>
					ntg_get_quadrant_and_data <...>
				endif
				ntg_start_board_grab_anim {
					<...>
					blendinspeed = 1.5
					blendduration = <grab_blend_dur>
				}
				<first_trick> = 0
				<spinning_first_trick> = 0
				<force_quad_data> = 0
			endif
		endif
		if (<first_trick> = 1)
			if nailthetrick_isintrick
				nailthetrick_blendout speed = $ntg_blend_out_board_speed
				<first_trick> = 0
			endif
		endif
	else
		if (<new_finger_flick> = 1)
			ntg_start_finger_flip
			<new_finger_flick> = 0
		endif
		if NOT nailthegrab_isintrucksupblend
			if nailthegrab_hadcontrolpress control = $ntg_start_finger_flip_control_type check_all_sticks
				ntg_start_finger_flip
				if (<new_finger_flick> = 0)
					nailthegrab_reblendtweak
				endif
			endif
		endif
		if (<new_finger_flick> = 0)
			if nailthegrab_isconsideredidle
				ntg_start_grab_release blendduration = 0.1
				nailthegrab_setgrabactive value = 0
			endif
		endif
	endif
	DoNextTrick
	wait 1 gameframe
	repeat
endscript

script ntg_start_nail_the_grab 
	MakeSkaterGoto \{nail_the_grab_state}
endscript

script ntg_sound_start_grab 
	wait \{0.05
		seconds}
	soundevent \{event = NTG_Grab_Board_SFX
		object = skater}
endscript

script ntg_sound_camera_in 
	soundevent \{event = NTG_Camera_Whoosh_In_SFX}
endscript

script ntg_sound_camera_out 
	soundevent \{event = NTG_Camera_Whoosh_In_SFX}
endscript

script ntg_sound_start_tweak 
	if NOT nailthegrab_isinfingerflip \{object = skater}
		soundevent \{event = NTG_Grab_Stretch_SFX}
	endif
endscript

script ntg_sound_stop_tweak 
endscript

script ntg_sound_grab_nailed 
endscript

script ntg_sound_start_finger_flip 
	soundevent \{event = NTG_FingerFlip_Start_SFX
		object = skater}
endscript

script ntg_sound_stop_finger_flip 
	soundevent \{event = nail_the_trick_land_sfx
		object = skater}
endscript

script startfingercatchwindow 
	soundevent \{event = NTG_FingerFlip_SFX
		object = skater}
endscript

script endfingercatchwindow 
endscript

script ntg_finger_branch_point 
	ntt_clear_message \{id = ntt_branch_window}
	ntt_debug_message \{text = "BRANCH WINDOW"
		id = ntt_branch_window
		time = 2000}
endscript

script ntg_no_finger_branch_point 
	ntt_clear_message \{id = ntt_branch_window}
endscript
