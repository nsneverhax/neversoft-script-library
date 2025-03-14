ntt_exploit_time = 5.0
ntt_exploit_dist = 0.5
ntx_delay_substate_exit_time = 0.3
ntx_perfect_branch_cheat = 0
ntt_camera_max_height_for_dip = 4.0
ntt_camera_height_adj = 0.2
ntx_cam_collision_offset = 0.0
ntt_blend_out_child_camera_time = 1.0
ntt_use_sloopy_landing = 1
ntt_dyn_camera_lerp_out_speed = 300.0
ntt_adjust_focus = 1
ntt_camera_default_offset_active = 1
ntt_allow_trucks_up_branching = 1
ntt_any_time_branching = 0
ntt_easy_branching_control = 1
ntt_enter_snap_after_idle_time = 0.0
ntt_ragdoll_bails = 1
ntt_allow_stick_movement_bails = 1
ntt_branch_window = 0.35000002
ntt_land_window = 0.5
nail_show_score_updates = 1
nail_the_trick_pause_rotation_time_first_trick = 0.2
nail_the_trick_pause_rotation_time = 0.32000002
nail_the_trick_pause_rotation_time_bonus_adj = 0.31
ntt_future_matrix_check = 0.15
ntt_land_window_clean = 0.05
ntt_land_window_sloppy = 0.1
ntt_rotation_speed_bonus_range_x = 0.98999995
ntt_rotation_speed_bonus_range_y = 0.98999995
ntt_rotation_speed_bonus = 10.0
ntt_rotation_speed_bonus_pitch = 7.0
ntt_controller_adj = 0.0
ntt_show_branch_window = 0
ntt_show_panel_distance_on_goal = 1
ntt_allow_when_vert = 1
ntt_body_spin_starting_degrees = 60
ntt_zero_velocity_hack_timer = 1.0
ntt_zero_velocity_hack_min_vel = 0.35000002
ntt_zero_gravity = 0
ntt_return_to_real_time_time = 0.2
ntt_board_rotation_bone_id = bone_board_180
ntt_close_call_height = 0.3
ntt_camera_default_offset_focus_y = -0.0
ntt_camera_default_offset_pos_y = 1.0
ntt_camera_default_offset_pos_xz = -3.1
ntt_camera_default_offset_bone_xz = control_root
ntt_camera_default_offset_bone_height = bone_pelvis
ntt_camera_entry_lerp_time = 0.8
ntt_camera_exit_lerp_time = 0.8
nail_cam_fov = 50.0
nail_cam_rot_around_focus = (-20.0, 65.0, 0.0)
nail_cam_pos_offset = (0.0, 0.1, -0.3)
nail_cam_focus_offset = (0.0, -0.4, 0.0)
nail_cam_pos_offset_vert = (2.5, 0.4, 0.5)
nail_cam_focus_offset_vert = (0.0, 0.4, 0.0)
nail_cam_fov_vert = 50.0
ntt_camera_entry_lerp_time_vert = 0.8
ntt_use_wave = 0
nail_the_trick_camera_end_transition_time = 0.4
ntt_use_focus_effect = 1
NTT_Use_M_CU_FX = 0
ntt_board_offset_max = 0.1
ntt_board_offset_speed_adj = 1.5
ntt_board_rot_speed = 15.0
ntt_bail_delay = 0.1
ntt_bail_fall_speed = -0.5
ntt_bail_side_fall_speed = 0.0
ntt_bail_rot_speed_adj = -25.0
ntt_foot_radius = 0.05
ntt_wheel_radius = 0.08
nail_the_trick_foot_lerp = 7.0
nail_the_trick_foot_lerp_return = 15.0
nail_the_trick_foot_lerp_special_fast = 7.0
ntt_min_idle_for_landing_time = 0.3
ntt_easy_branch_movement_time = 0.05
ntt_allow_stick_movement = 0.9
ntt_stick_movement_bail_time = 0.15
ntt_blend_out_translation_speed = 5.0
ntt_blend_out_rotation_speed = 60.0
ntt_blend_out_wait_time = 0.15
ntt_accumulator_bias = 1.15
ntt_message_q_pause = 0.5
ntt_hold_exit_cam = 0
ntt_allow_inside_impossibles = 1
nail_spin_score = 1000
ntt_force_vert_cam = 0
ntt_use_angle_for_branch_dots = 0
ntt_matrix_smoother = 1.0
ntt_body_spin_offset_speed = 3.0
ntt_body_spin_offset = 0.65000004
ntt_use_camera = 1
ntt_use_rotation_noise = 0
ntt_rotation_noise_debug = 0
ntt_rotation_noise_bias = 0.2
ntt_rotation_noise_speed = 4.0
ntt_rotation_noise_time_multiplier = 4.0
ntt_post_branch_bail_forgiveness = 0.3

script nail_default_start_callback 
endscript

script nail_default_start_callback_failed 
endscript

script StartNtt gravity = 0.5 slomospeed = 0.15 start_script = nail_default_start_callback start_script_failed = nail_default_start_callback_failed
	perfect_nail_branch_cheat
	<slomospeed> = 0.15
	nttss_get_enter_from_nail_sub_state <...>
	if NOT gotparam enter_from_nail_sub_state
		killspecial during_bail
		if invertair
			if NOT istrue $ntt_allow_when_vert
				if NOT gotparam NTT_Goal_Trigger
					goto Airborne
				endif
			endif
		endif
		if invertair
			gravity = 1.0
		endif
		if gotparam start_script
			settags nail_start_script = <start_script>
		endif
		nailthetrick_setnailslomospeed slomo = <slomospeed>
		nailthetrick_setnailgravity gravity_adj = <gravity>
		getcurrskaterscript
	endif
	obj_getid
	launchevent type = NailTheTrick target = <objid> data = {<...>}
	if NOT gotparam enter_from_nail_sub_state
		getsingletag nail_started
		if gotparam nail_started
			removetags tags = [nail_started]
		else
			<start_script_failed>
		endif
	endif
endscript
NttExceptionTable = [
	{
		response = switch_script
		event = landed
		scr = nail_bail_forced_bail
		params = {
			BoardAlwaysOn = 0
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
		event = skatercollidebail
		scr = skatercollidebail
	}
]
NttExceptionTable_FromSubState = [
	{
		response = switch_script
		event = landed
		scr = nail_bail_forced_bail
		params = {
			BoardAlwaysOn = 0
			from_sub_state_in_ntt
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
		event = skatercollidebail
		scr = skatercollidebail
	}
]
NttExceptionTablePostComplete = [
	{
		response = switch_script
		event = landed
		scr = ntt_direct_land
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
		event = skatercollidebail
		scr = skatercollidebail
	}
]
NttAbortCommand = [
	{
		trigger = {
			PressTwoAnyOrder
			l3
			r3
			500
		}
		scr = Airborne
		params = {
			no_anim
		}
	}
]

script ntt_ollie_anim 
	nailthetrick_setollietreevalid \{value = 1}
	nailthetrick_olliemoddataremoved \{value = 0}
	Skater_PlayOllieAnim <...>
	if NOT gotparam \{skip_blend_out_non_nail}
		ntt_blend_out_non_nail_animation \{new_ollie
			blendtime = 0.01}
	endif
endscript

script nail_the_trick 
	if NOT gotparam enter_from_nail_sub_state
		script_reset_nail_the_X
		nailthetrick_resetnailthex
		nailthetrick_scorepotwaszero set
	endif
	if gotparam start_trucks_up
		if (<start_trucks_up> = 0)
			nailthetrick_setstarttrucksup value = 0
			nailthetrick_resetboardtransforms
		endif
	endif
	if NOT gotparam enter_from_nail_sub_state
		if NOT inair
			return
		endif
		if NOT skating
			return
		endif
	endif
	if NOT gotparam enter_from_nail_sub_state
		getsingletag nail_start_script
		if gotparam nail_start_script
			settags nail_started
			<nail_start_script>
		endif
		reseteventhandlersfromtable NttExceptionTable
	else
		reseteventhandlersfromtable NttExceptionTable_FromSubState
	endif
	nailthetrick_sethadbailflag value = 0
	nailthetrick_settrickcompleteormodefinished value = 1
	onexitrun ntt_exit
	blend_in_below_body_ik blendduration = 0.05 strength = 1.0
	nailthetrick_setstate value = 1
	nailthetrick_runscorescript goalscript = StartNtt
	if NOT gotparam enter_from_nail_sub_state
		nailthetrick_runscorescript goalscript = startntx
	endif
	had_nollie = 0
	had_casper_blend = 0
	ntt_check_for_ollie_blend <...>
	if lastwasjumpboneless
		ntt_blend_out_non_nail_animation
	endif
	if NOT gotparam enter_from_nail_sub_state
		ntt_clear_tricks
		smoothspin type = on adj = 10.0
		nailthetrick_setresetlateolliehackset value = 0
		if gotparam NTT_Goal_Trigger
			if (<curr_script> = WaitAnimWhilstCheckingLateOllie)
				seteventhandler event = Ollied scr = ntt_jump response = call_script
				obj_spawnscriptnow ntt_late_ollie
			endif
		endif
		wait 0.05 seconds
	endif
	obj_spawnscriptlater ntt_main params = <...>
	begin
	if nailthetrick_isresetexceptionhackset
		nailthetrick_setresetexceptionhackset value = 0
		reseteventhandlersfromtable NttExceptionTablePostComplete
	endif
	if nailthetrick_isresetlateolliehackset
		nailthetrick_setresetlateolliehackset value = 0
		cleareventhandler Ollied
		onexceptionrun
	endif
	wait 1 gameframe
	repeat
endscript

script ntt_main 
	if gotparam ntm_roll_off_ledge
		if (<ntm_roll_off_ledge> = 1)
			nailthemanual_debounceentry reset
		endif
	endif
	if NOT gotparam enter_from_nail_sub_state
		ntt_start_focus_effect
		ntt_entry
		ntt_camera_entry had_nollie = <had_nollie>
	else
		nailthetrick_getnailgravity
		ntt_adjust_gravity gravity = <gravity_adj>
	endif
	nailthetrick_setresetexceptionhackset value = 0
	nailthetrick_setintrick value = 0
	nailthetrick_setcanbailflag value = 0
	nailthetrick_setfootlerpmodulate modulate = 1.0
	if gotparam force_exit_from_sub
		settags nail_lock_legs
	else
		removetags tags = [nail_lock_legs]
	endif
	add_foot_animation_branch <...>
	ntt_native_reset
	ntt_update_loop <...>
	if NOT nailthetrick_hadbail
		ntt_complete_exit blend_wait no_anim
	endif
endscript

script ntt_entry 
	skater_ntt_begin
	ntt_hide_panel_stuff
	settags \{nail_last_score = 0}
	killspawnedscript \{name = sk8_CAS_Focus_Breaths}
	ShakeCamera \{duration = 0
		vert_amp = 0
		horiz_amp = 0
		vert_vel = 0
		horiz_vel = 0}
	setqueuetricks \{NttAbortCommand}
	disableanalogturning
	getskatercam
	<skatercam> :lookaroundondpad_on
endscript

script ntt_camera_entry {
		lerp_time = $ntt_camera_entry_lerp_time
		rot_offset = $nail_cam_rot_around_focus
		pos_offset = $nail_cam_pos_offset
		focus_offset = $nail_cam_focus_offset
		pos_offset_vert = $nail_cam_pos_offset_vert
		focus_offset_vert = $nail_cam_focus_offset_vert
		stop_vert_cam_flip = 0
		try_to_use_frontside_camera = 0
		had_nollie = 0
	}
	if gotparam ignore_super_slomo
		nailthetrick_getnailslomospeed
		set_ntt_slomo speed = <slomo>
		nailthetrick_getnailgravity
		ntt_adjust_gravity gravity = <gravity_adj>
	else
		set_ntt_slomo speed = 0.065
		ntt_adjust_gravity gravity = 0.2
		wait 1 gameframes
	endif
	getskatercam
	if gotparam change_offsets
		<skatercam> :nailthetrickcamera_changeoffsets {
			lerp_time = <lerp_time>
			rot_offset = <rot_offset>
			pos_offset = <pos_offset>
			focus_offset = <focus_offset>
			pos_offset_vert = <pos_offset_vert>
			focus_offset_vert = <focus_offset_vert>
		}
	else
		<skatercam> :nailthetrickstartcamera {
			lerp_time = $ntt_camera_entry_lerp_time
			rot_offset = <rot_offset>
			pos_offset = <pos_offset>
			focus_offset = <focus_offset>
			pos_offset_vert = <pos_offset_vert>
			focus_offset_vert = <focus_offset_vert>
			stop_vert_cam_flip = <stop_vert_cam_flip>
			try_to_use_frontside_camera = <try_to_use_frontside_camera>
			had_nollie = <had_nollie>
		}
	endif
	if NOT gotparam ignore_super_slomo
		nailthetrick_getnailslomospeed
		set_ntt_slomo time = 0.8 speed = <slomo> no_lerp = 1
		wait 4 gameframes
		nailthetrick_getnailgravity
		ntt_adjust_gravity time = 0.5 gravity = <gravity_adj>
	endif
endscript

script main_loop_bail 
	soundevent \{event = nail_the_trick_negative_sfx}
	ntt_do_bail
	nailthetrick_setfootlerpmodulate \{modulate = 0.3}
endscript

script ntt_sub_state_exit_hack 
	if gotparam \{with_slomo}
		set_ntt_slomo \{time = 0.7
			speed = 1.0
			wait}
	endif
	if nailthetrick_isintrick
		was_in_trick = 1
	else
		was_in_trick = 0
	endif
	nailthetrick_setintrick \{value = 1}
	ntt_complete_exit <...> no_land_sound
	if (<was_in_trick> = 0)
		nailthetrick_setintrick \{value = 0}
	endif
endscript

script ntt_update_loop 
	wait 0.015999999 seconds
	if gotparam force_exit_from_sub
		ntt_sub_state_exit_hack no_anim with_slomo
	endif
	begin
	if nttss_should_update_for_sub_state
		ntt_hide_panel_stuff
		skatercorephysics_stopgrab
		if NOT nailthetrick_hadbail
			if NOT nailthetrick_isintrick
				DoNextTrick
				if nailthetrick_isinforcedbail
					ntt_enter_trick <...>
					main_loop_bail
					settags nail_lock_legs
				else
					nailthetrick_hasdirection
					if istrue <has_direction>
						nttss_trick_from_sub_state <...>
						ntt_blend_out_non_nail_animation
						ntt_enter_trick <...>
						<had_casper_blend> = 0
						soundevent event = nail_the_trick_do_trick object = skater
						if gotparam enter_from_nail_sub_state
							nailthemanual_fliptrickollie
						endif
					endif
				endif
				if NOT nailthetrick_isintrick
					if gotparam enter_from_nail_sub_state
						if NOT gotparam from_ntm_ground_state
							if NOT gotparam stop_auto_exit
								ntt_sub_state_exit_hack no_anim with_slomo
							endif
						endif
					endif
				endif
			else
				NoRailTricks
				ntt_clear_tricks
				ntt_can_bail_script
				nailthetrick_iscomplete
				nailthetrick_branchtrick
				if istrue <new_trick>
					soundevent event = nail_the_trick_do_trick object = skater
					soundevent event = Crowd_Cheer_NTT
					if gotparam enter_from_nail_sub_state
						if gotparam ntm_ollie_type
							ntt_reblend_default_tree flick branch <...>
						endif
					endif
					ntt_enter_trick branch <...>
					set_ntt_slomo speed = 0.05
					wait 0.02 seconds ignoreslomo
					nailthetrick_getnailslomospeed
					set_ntt_slomo speed = <slomo>
				else
					if istrue <complete>
						break
					endif
					if istrue <can_bail>
						if (<bail_type> = stick)
							nailthetrick_runscorescript goalscript = missedbranchtime
						else
							nailthetrick_runscorescript goalscript = missedlandtime
						endif
						main_loop_bail
					endif
				endif
			endif
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script ntt_reset_speed 
	set_ntt_slomo \{speed = 1.0}
	ntt_adjust_gravity \{gravity = 0.0}
endscript

script ntt_primary_exit_logic 
	if NOT gotparam \{exit_to_nail_sub_state}
		getskatercam
		<skatercam> :lookaroundondpad_off
		enableanalogturning
		ntt_show_panel_stuff
		nailthetrick_settrickcompleteormodefinished \{value = 0}
	endif
	obj_killspawnedscript \{name = ntt_main}
	obj_killspawnedscript \{name = ntt_camera_exit}
	obj_killspawnedscript \{name = ntt_lerp_slomo}
	obj_killspawnedscript \{name = ntt_late_ollie}
endscript

script ntt_complete_exit 
	ntm_blend_out_flick
	if nailthetrick_aredefaultanimsoverridden
		ntt_reblend_default_tree
	endif
	addtocumulativerecord ability = total_landings score = 1
	AllowRailTricks
	ntt_activate_goal_landing_flag
	nailthetrick_setresetexceptionhackset value = 1
	ntt_kill_panel
	nailthetrick_oncomplete
	if NOT gotparam no_land_sound
		soundevent event = nail_the_trick_land_sfx object = skater
	endif
	settags nail_lock_legs
	nail_add_score_to_main_combo_score
	ntt_primary_exit_logic <...>
	nailthetrick_blendout speed = 40.0
	set_ntt_slomo speed = 0.2
	obj_spawnscriptnow ntt_camera_exit
	if gotparam blend_wait
		wait 0.2 seconds ignoreslomo
	endif
	set_ntt_slomo time = 0.1 speed = 1.0 wait
	ntt_reset_speed
	nailthetrick_setbranchwindowactive value = 0
	if gotparam no_exit
		return
	endif
	if nailthetrick_isboard180rotate
		boardrotate
	endif
	if gotparam no_anim
		MakeSkaterGoto Airborne params = {no_anim}
	else
		MakeSkaterGoto Airborne params = {}
	endif
endscript

script ntt_cam_exit 
	getskatercam
	<skatercam> :nailthetrickendcamera lerp_time = $ntt_camera_exit_lerp_time
endscript

script ntt_safe_anim_command 
	anim_command {
		target = <target>
		command = <command>
		params = <params>
	}
	return \{true}
endscript

script ntt_activate_goal_landing_flag 
	nailthetrick_setsendlandgoalmessage \{value = 1}
endscript

script ntt_reset_for_skater_init 
	nailthetrick_setsendlandgoalmessage \{value = 0}
endscript

script ntt_send_land_goal_message_spawned 
	wait \{1
		gameframe}
	if NOT isinbail
		nailthetrick_landgoalmessage
	else
		nailthetrick_bailgoalmessage
	endif
endscript

script ntt_send_land_goal_message 
	if nailthetrick_shouldsendlandgoalmessage
		obj_spawnscriptnow \{ntt_send_land_goal_message_spawned}
	endif
	nailthetrick_setsendlandgoalmessage \{value = 0}
endscript

script ntt_send_state_change_message 
	if NOT nailthetrick_isinnailthex
		if NOT (<newstate> = Skater_InAir)
			ntt_send_land_goal_message
		endif
	endif
endscript

script ntt_fail_safe_cleanup 
	ntt_exit \{force_full_exit
		no_goal_notify
		from_skater_init}
	getskatercam
	<skatercam> :nailthetrickcamera_instantendallcameras
	nailthetrickscore_reset
	setinnailthegrab \{value = 0}
	nailthetrick_setinnailthemanual \{value = 0}
	removetags \{tags = [
			nail_the_trick_bailed
		]}
endscript

script ntt_exit 
	if NOT gotparam force_full_exit
		nttss_get_exit_to_nail_sub_state
	endif
	if NOT gotparam exit_to_nail_sub_state
		nail_add_score_to_main_combo_score
		skater_ntt_end
		ntt_clear_tricks
		killspawnedscript name = sk8_CAS_Focus_Breaths
		ntt_end_focus_effect
		if nailthetrick_istrickcompleteormodefinished
			ntt_cam_exit
			if nailthetrick_isintrick
				if NOT nailthetrick_hadbail
					nailthetrick_runscorescript goalscript = neverlandedtrick
				endif
				if NOT gotparam from_sub_state
					ntt_do_bail
				endif
			else
				nailthetrick_runscorescript goalscript = neverstartedtrick
			endif
		endif
		if nailthetrick_hadbail
			bailed = 1
		else
			bailed = 0
		endif
		if istrue <bailed>
			nailthetrick_runscorescript goalscript = nail_bail
		else
			ntt_activate_goal_landing_flag
		endif
		nailthetrick_blendout
	endif
	ntt_primary_exit_logic <...>
	if NOT gotparam exit_to_nail_sub_state
		ntt_native_reset
	endif
	if NOT gotparam exit_to_nail_sub_state
		ntt_reset_speed
		if NOT gotparam from_skater_init
			if istrue <bailed>
				nail_add_score_to_main_combo_score
			endif
		endif
		removetags tags = [nail_start_script]
		settags nail_lock_legs
		ntt_kill_panel
		DoNextTrick
		obj_killspawnedscript name = ntt_spawned_gravity
		smoothspin type = off
		nailthetrick_runscorescript goalscript = nail_goal_reset
		AllowRailTricks
		nailthetrick_setresetexceptionhackset value = 0
	endif
	nailthetrick_setforcedbail value = 0
	nailthetrick_setstate value = 0
	blockfocuscommand
	nailthetrick_setautoexitdelay time = 0.0
	if NOT gotparam no_goal_notify
		nailthetrick_runscorescript goalscript = endntt
		if NOT gotparam exit_to_nail_sub_state
			nailthetrick_runscorescript goalscript = endntx landed = (1 - <bailed>)
			exitnailthex
			blend_in_below_body_ik blendduration = 0.05 strength = 0.0
		endif
	endif
endscript

script ntt_teleport_player 
	if isdoingragdollbail
		return
	endif
	TeleportSkaterToNode nodename = <nodename>
endscript

script ntt_native_reset 
	nailthetrick_resetboardanimation
endscript

script ntt_can_bail_script 
	if NOT nailthetrick_canbail_legacy
		return \{can_bail = 0}
	endif
	nailthetrick_canbail
	return can_bail = <can_bail> bail_type = <bail_type>
endscript

script ntt_upd_bail_delay 
	nailthetrick_setcanbailflag \{value = 0}
	wait \{$ntt_bail_delay
		seconds}
	nailthetrick_setcanbailflag \{value = 1}
endscript

script ntt_enter_trick 
	nailthetrick_blendout \{off}
	nailthetrick_locktrickdirections
	ntt_do_kick <...>
	obj_spawnscriptnow \{ntt_upd_bail_delay}
	wait \{0.015999999
		seconds}
	nailthetrick_locktrickdirections \{only_update_non_zero}
	nailthetrick_starttrick
	nailthetrick_setintrick \{value = 1}
endscript

script ntt_do_bail 
	vibrate \{actuator = 0
		percent = 50
		duration = 1.0}
	vibrate \{actuator = 1
		percent = 50
		duration = 1.0}
	nailthetrick_bailed
	set_ntt_slomo \{speed = 1.0}
	if NOT istrue \{$ntt_ragdoll_bails}
		ntt_debug_message \{text = "BAILED!"}
	endif
	nailthetrick_sethadbailflag \{value = 1}
	ntt_kill_panel
endscript

script ntt_add_flipper_rotation 
	nailthetrick_addflipperrot <...>
endscript

script ntt_camera_exit 
	ntt_cam_exit
	local_time = ($nail_the_trick_camera_end_transition_time - 0.05)
	wait \{local_time
		seconds}
endscript

script nail_vibrate 
	if gotparam \{right}
		vibrate \{actuator = 1
			percent = 100
			duration = 0.02}
	endif
	if gotparam \{left}
		vibrate \{actuator = 0
			percent = 100
			duration = 0.02}
	endif
endscript

script nail_complete 
endscript

script nail_rotate_sound 
endscript

script ntt_close_call_landing 
	if NOT hide_any_hud_display
		ui_display_message \{type = alert
			text = "Close Call! +5000 Points"
			color = bluelt}
	endif
	settrickname \{""}
	<bonus> = $ntt_close_call_bonus
	casttointeger \{bonus}
	settrickscore <bonus>
	display \{nodegrade}
	soundevent \{event = play_perfect_landing_sound_sfx}
endscript

script nail_clean_landing 
	AwardPerfect \{NoBlockSpin = 1}
endscript

script nail_sloppy_landing 
	SloppyLandingEvent \{NoBlockSpin = 1}
endscript

script startBranchWindow_Spawned 
	nailthetrick_setbranchwindowactive \{value = 1}
	begin
	if ($ntt_show_branch_window = 1)
		ntt_debug_message \{text = "BRANCH WINDOW"
			id = ntt_branch_window}
	endif
	if NOT nailthetrick_isbranchwindowactive
		ntt_clear_message \{id = ntt_branch_window}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script startbranchwindow 
	killspawnedscript \{name = nail_the_trick_Board_Rotate_SFX}
	soundevent \{event = nail_the_trick_Board_Rotate_SFX
		object = skater
		rotations_per_second = 0.0}
	obj_spawnscriptnow \{startBranchWindow_Spawned}
endscript

script endbranchwindow 
	nailthetrick_setbranchwindowactive \{value = 0}
	ntt_clear_message \{id = ntt_branch_window}
endscript

script ntt_adjust_gravity \{time = 0.0
		gravity = 0.666}
	if ($ntt_zero_gravity = 1)
		<gravity> = 0.001
	endif
	obj_killspawnedscript \{name = ntt_spawned_gravity}
	if (<time> = 0.0)
		adjustgravity gravity = <gravity>
	else
		obj_spawnscriptnow {
			ntt_spawned_gravity
			params = {
				time = <time>
				gravity = <gravity>
			}
		}
	endif
endscript

script ntt_spawned_gravity 
	wait <time> seconds ignoreslomo
	adjustgravity gravity = <gravity>
endscript

script ntt_blend_out_non_nail_animation_target 
	anim_command {
		target = <target>
		command = modulate_startblend
		params = {
			blendcurve = [0.0 , 1.0]
			blendtime = <blendtime>
		}
	}
endscript

script ntt_blend_out_non_nail_animation blendtime = 0.2
	if NOT gotparam new_ollie
		if nailthetrick_isolliemoddataremoved
			return
		endif
	endif
	getspeed
	if (<speed> < 5.0)
		return
	endif
	nailthetrick_olliemoddataremoved value = 1
	ntt_blend_out_non_nail_animation_target target = olliemod_apex_foot blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_apex_arm blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_takeoff_foot blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_takeoff_arm blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_apex_spinlr_vert blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_apex_spinlr_flat blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_takeoff_spinlr_vert blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_takeoff_spinlr_flat blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_land_spinlr_vert blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_land_spinlr_flat blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_takeoff_lr blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_land_spinlook_vert blendtime = <blendtime>
	ntt_blend_out_non_nail_animation_target target = olliemod_land_spinlook_flat blendtime = <blendtime>
endscript

script ntt_direct_land 
	if nailthetrick_isboard180rotate
		boardrotateafter
	endif
	MakeSkaterGoto \{land}
endscript

script nail_bail_forced_bail 
	nttss_bail_exit_logic <...>
	if nailthetrick_isboard180rotate
		boardrotateafter
	endif
	if NOT istrue $ntt_ragdoll_bails
		MakeSkaterGoto land
	endif
	if NOT gotparam sub_state
		if NOT nailthetrick_isintrick
			nailthetrick_trucksup
			if (<trucks_up> = 0)
				MakeSkaterGoto land
			endif
		endif
	endif
	settags nail_the_trick_bailed
	nailthex_onbail
	removetags tags = [nail_the_trick_bailed]
	GeneralBail {
		Anim1 = human_default
		ForcedBail
		NoInit
		pedhit = <pedhit>
		nttbail
	}
endscript

script ntt_should_move_leg 
	nailthetrick_didstickhavemovementatbranchtime stick = <stick>
	return movement = <movement>
endscript

script ntt_should_move_left_leg 
	ntt_should_move_leg \{stick = left}
	if (<movement> = 1)
		return \{true}
	endif
	return \{false}
endscript

script ntt_should_move_right_leg 
	ntt_should_move_leg \{stick = right}
	if (<movement> = 1)
		return \{true}
	endif
	return \{false}
endscript

script ntt_clear_tricks 
	ClearTrickQueues
	setqueuetricks \{NoTricks}
	killextratricks
endscript

script ntt_jump 
	jump
	cleareventhandler \{Ollied}
	onexceptionrun
endscript

script ntt_late_ollie 
	WaitFramesLateOllie \{frames = 15}
	nailthetrick_setresetlateolliehackset \{value = 1}
endscript

script script_reset_nail_the_X 
	nailthetrickscore_reset
endscript

script ntt_auto_nail 
	obj_getid
	launchevent type = Ollied target = <objid>
	<objid> :StartNtt
endscript

script ntt_default_ollie \{pose_capture = 1
		blendduration = 0.075}
	ntt_ollie_anim {
		$Ollie_data
		groundgone = 1
		blendduration = <blendduration>
		sync = 1
		pose_capture = <pose_capture>
	}
endscript

script ntt_reblend_default_tree \{blendduration = 0.05}
	ntt_default_ollie pose_capture = 0 blendduration = <blendduration>
	add_foot_animation_branch \{blendduration = 0.0
		anim_blend_only = 1}
	if gotparam \{flick}
		ntt_do_kick <...>
	endif
endscript

script ntt_do_casper_blend 
	nailthemanual_getanimatedmanualtype
	if (<type> = Manual)
		return
	endif
	if (<type> = nose_manual)
		return
	endif
	if (<type> = anticasper)
		ntm_start_air_range_anim {
			anim_range_type = casper
			blendduration = $ntm_transition_blendduration
			speed = $ntm_transition_speed
			transition
		}
		wait 0.5 seconds ignoreslomo
	endif
	<type> = casper
	ntm_ollie_type = <type>
	ntm_ollie type = <type> anim_only blendduration = 0.05 sync = 1 skip_flip_and_rot skip_trucks_up_board_for_blend
	add_foot_animation_branch anim_blend_only = 1 blendduration = 0.0 ntm_ollie_type = <ntm_ollie_type>
	return had_casper_blend = 1 ntm_ollie_type = <type>
endscript

script ntt_check_for_ollie_blend 
	blend_in_full_tree = 0
	if NOT anim_animnodeexists id = ollieextras
		<blend_in_full_tree> = 1
		force_tree = 1
	endif
	if innollie
		<blend_in_full_tree> = 1
	endif
	if gotparam enter_from_nail_sub_state
		if NOT gotparam from_ntm_ground_state
			<blend_in_full_tree> = 1
		endif
	endif
	if (<blend_in_full_tree> = 1)
		if innollie
			nollieoff
			wait 1 gameframe
			<type> = nose_manual
			<ntm_ollie_type> = <type>
			ntm_ollie type = <type> anim_only blendduration = 0.1 sync = 1 skip_flip_and_rot skip_trucks_up_board_for_blend
			add_foot_animation_branch anim_blend_only = 1 blendduration = 0.0 ntm_ollie_type = <ntm_ollie_type>
			<had_nollie> = 1
			return <...>
		endif
		allow = 1
		if gotparam enter_from_nail_sub_state
			nailthetrick_trucksup
			if (<trucks_up> = 1)
				<allow> = 0
				stop_auto_exit = 1
				ntt_do_casper_blend
			else
				if nailthetrick_arerawanalogsticksidle
					<allow> = 0
					force_exit_from_sub = 1
				endif
			endif
		endif
		if gotparam force_tree
			<allow> = 1
		endif
		if (<allow> = 1)
			ntt_default_ollie
		endif
	endif
	return <...>
endscript

script start_ntt_condition 
	if skaterprofile_isabilityactive \{ability = ntt_on}
		return \{true}
	endif
	return \{false}
endscript

script nail_do_trick 
	animsave_timestamp event = {type = ntt num_branches = <num_branches>}
endscript

script perfect_nail_branch_cheat 
	if getglobalflag \{flag = $CHEAT_PERFECT_NAIL}
		change \{ntt_allow_stick_movement_bails = 0}
		change \{ntx_perfect_branch_cheat = 1}
		change \{ntm_perfect_manual = 1}
	else
		change \{ntt_allow_stick_movement_bails = 1}
		change \{ntx_perfect_branch_cheat = 0}
		change \{ntm_perfect_manual = 0}
	endif
endscript
