next_drumnote_entry = 0
last_drumnote_time = 0
drumnote_times = [
	0
	0
	0
	0
	0
	0
]
next_drumnote_rightfoot_entry = 0
last_drumnote_rightfoot_time = 0
next_drumnote_leftfoot_entry = 0
last_drumnote_leftfoot_time = 0
g_drum_remapping_values = [
	73
	74
	74
	75
	76
	77
	77
	77
	77
	78
	79
	78
	80
	80
	81
	82
	82
	81
	82
	0
	0
	0
]
g_old_drum_start_note = 74
g_old_drum_end_note = 83
g_left_hand_start_note = 0
g_left_hand_end_note = 21
g_right_hand_start_note = 30
g_right_hand_end_note = 51
g_count_in_sticks_start_note = 108
g_count_in_sticks_num_types = 3
g_count_in_hh_start_note = 111
g_count_in_hh_num_types = 3

script drummer_kill_spawnscripts 
	killspawnedscriptsbyname \{name = drumdroid_timers}
	killspawnedscriptsbyname \{name = hide_non_drummers}
	killspawnedscriptsbyname \{name = hit_drumkit_piece}
	killspawnedscriptsbyname \{name = default_kit_anims}
	killspawnedscriptsbyname \{name = default_drummer_state}
	killspawnedscriptsbyname \{name = drummer_controlscript}
	killspawnedscriptsbyname \{name = drummer_transit_base_short}
	killspawnedscriptsbyname \{name = drummer_transit_base_long}
	killspawnedscriptsbyname \{name = drummer_transit_arm_r}
	killspawnedscriptsbyname \{name = drummer_transit_arm_l}
	killspawnedscriptsbyname \{name = drummer_transit_loops}
	killspawnedscriptsbyname \{name = drummer_transit_idles}
	killspawnedscriptsbyname \{name = drummer_current_tempo}
	killspawnedscriptsbyname \{name = set_drummer_active_values}
	killspawnedscriptsbyname \{name = hold_transit_requests}
	killspawnedscriptsbyname \{name = hold_transit_arms}
	killspawnedscriptsbyname \{name = hold_active_values}
	killspawnedscriptsbyname \{name = hold_drumkit_piece}
	killspawnedscriptsbyname \{name = hold_body_trans}
	killspawnedscriptsbyname \{name = hold_body_loops}
	killspawnedscriptsbyname \{name = idle_check}
	killspawnedscriptsbyname \{name = drummer_head_look}
	killspawnedscriptsbyname \{name = hold_drummer_lookat_on_request}
	killspawnedscriptsbyname \{name = hold_drummer_lookat_off_request}
	destroystructurequeue \{queue_name = drum_lookat_queue}
endscript

script drummer_reset_globals 
	change \{last_time_to_hit_r = 1000.0}
	change \{last_time_to_hit_l = 1000.0}
	change \{use_db_branch_l = 1}
	change \{use_db_branch_r = 1}
	change \{use_db_base = 1}
	change \{current_db_base = 1}
	change \{drummer_idle = true}
	change \{g_drummer_lookat_control_priority_hijacked = 0}
	change \{g_autodrummer_active = 0}
	drummer_kill_spawnscripts
endscript

script flamfinder 
	if ((<time_to_hit_3> < 50.0) && (<num_pieces_hit_3> = 1) && (<num_pieces_hit_2> = 1))
		offset = <time_to_hit_3>
		num_pieces_hit_2 = 2
		if (<pieces_value_2_1> <= <pieces_value_3_1>)
			pieces_value_2_2 = <pieces_value_3_1>
		else
			pieces_value_2_1 = <pieces_value_3_1>
		endif
		shift_from = 3
		shift_notes {
			shift_from = <shift_from>
			drummer_choose_hand_3 = <drummer_choose_hand_3>
			time_to_hit_3 = <time_to_hit_3>
			hit_velocity_3_1 = <hit_velocity_3_1>
			hit_velocity_3_2 = <hit_velocity_3_2>
			num_pieces_hit_3 = <num_pieces_hit_3>
			pieces_value_3_1 = <pieces_value_3_1>
			pieces_value_3_2 = <pieces_value_3_2>
			drummer_choose_hand_4 = <drummer_choose_hand_4>
			time_to_hit_4 = <time_to_hit_4>
			hit_velocity_4_1 = <hit_velocity_4_1>
			hit_velocity_4_2 = <hit_velocity_4_2>
			num_pieces_hit_4 = <num_pieces_hit_4>
			pieces_value_4_1 = <pieces_value_4_1>
			pieces_value_4_2 = <pieces_value_4_2>
			drummer_choose_hand_5 = <drummer_choose_hand_5>
			time_to_hit_5 = <time_to_hit_5>
			hit_velocity_5_1 = <hit_velocity_5_1>
			hit_velocity_5_2 = <hit_velocity_5_2>
			num_pieces_hit_5 = <num_pieces_hit_5>
			pieces_value_5_1 = <pieces_value_5_1>
			pieces_value_5_2 = <pieces_value_5_2>
			drummer_choose_hand_6 = <drummer_choose_hand_6>
			time_to_hit_6 = <time_to_hit_6>
			hit_velocity_6_1 = <hit_velocity_6_1>
			hit_velocity_6_2 = <hit_velocity_6_2>
			num_pieces_hit_6 = <num_pieces_hit_6>
			pieces_value_6_1 = <pieces_value_6_1>
			pieces_value_6_2 = <pieces_value_6_2>
		}
		updatenotehitdatafast arrayprefix = <arrayprefix> event_array = <event_array>
		time_to_hit_3 = (<time_to_hit_3> + <offset>)
	endif
	if ((<time_to_hit_4> < 50.0) && (<num_pieces_hit_4> = 1) && (<num_pieces_hit_3> = 1))
		offset = <time_to_hit_4>
		num_pieces_hit_3 = 2
		if (<pieces_value_3_1> <= <pieces_value_4_1>)
			pieces_value_3_2 = <pieces_value_4_1>
		else
			pieces_value_3_1 = <pieces_value_4_1>
		endif
		shift_from = 4
		shift_notes {
			shift_from = <shift_from>
			drummer_choose_hand_3 = <drummer_choose_hand_3>
			time_to_hit_3 = <time_to_hit_3>
			hit_velocity_3_1 = <hit_velocity_3_1>
			hit_velocity_3_2 = <hit_velocity_3_2>
			num_pieces_hit_3 = <num_pieces_hit_3>
			pieces_value_3_1 = <pieces_value_3_1>
			pieces_value_3_2 = <pieces_value_3_2>
			drummer_choose_hand_4 = <drummer_choose_hand_4>
			time_to_hit_4 = <time_to_hit_4>
			hit_velocity_4_1 = <hit_velocity_4_1>
			hit_velocity_4_2 = <hit_velocity_4_2>
			num_pieces_hit_4 = <num_pieces_hit_4>
			pieces_value_4_1 = <pieces_value_4_1>
			pieces_value_4_2 = <pieces_value_4_2>
			drummer_choose_hand_5 = <drummer_choose_hand_5>
			time_to_hit_5 = <time_to_hit_5>
			hit_velocity_5_1 = <hit_velocity_5_1>
			hit_velocity_5_2 = <hit_velocity_5_2>
			num_pieces_hit_5 = <num_pieces_hit_5>
			pieces_value_5_1 = <pieces_value_5_1>
			pieces_value_5_2 = <pieces_value_5_2>
			drummer_choose_hand_6 = <drummer_choose_hand_6>
			time_to_hit_6 = <time_to_hit_6>
			hit_velocity_6_1 = <hit_velocity_6_1>
			hit_velocity_6_2 = <hit_velocity_6_2>
			num_pieces_hit_6 = <num_pieces_hit_6>
			pieces_value_6_1 = <pieces_value_6_1>
			pieces_value_6_2 = <pieces_value_6_2>
		}
		updatenotehitdatafast arrayprefix = <arrayprefix> event_array = <event_array>
		time_to_hit_4 = (<time_to_hit_4> + <offset>)
	endif
	if ((<time_to_hit_5> < 50.0) && (<num_pieces_hit_5> = 1) && (<num_pieces_hit_4> = 1))
		offset = <time_to_hit_5>
		num_pieces_hit_4 = 2
		if (<pieces_value_4_1> <= <pieces_value_5_1>)
			pieces_value_4_2 = <pieces_value_5_1>
		else
			pieces_value_4_1 = <pieces_value_5_1>
		endif
		shift_from = 5
		shift_notes {
			shift_from = <shift_from>
			drummer_choose_hand_3 = <drummer_choose_hand_3>
			time_to_hit_3 = <time_to_hit_3>
			hit_velocity_3_1 = <hit_velocity_3_1>
			hit_velocity_3_2 = <hit_velocity_3_2>
			num_pieces_hit_3 = <num_pieces_hit_3>
			pieces_value_3_1 = <pieces_value_3_1>
			pieces_value_3_2 = <pieces_value_3_2>
			drummer_choose_hand_4 = <drummer_choose_hand_4>
			time_to_hit_4 = <time_to_hit_4>
			hit_velocity_4_1 = <hit_velocity_4_1>
			hit_velocity_4_2 = <hit_velocity_4_2>
			num_pieces_hit_4 = <num_pieces_hit_4>
			pieces_value_4_1 = <pieces_value_4_1>
			pieces_value_4_2 = <pieces_value_4_2>
			drummer_choose_hand_5 = <drummer_choose_hand_5>
			time_to_hit_5 = <time_to_hit_5>
			hit_velocity_5_1 = <hit_velocity_5_1>
			hit_velocity_5_2 = <hit_velocity_5_2>
			num_pieces_hit_5 = <num_pieces_hit_5>
			pieces_value_5_1 = <pieces_value_5_1>
			pieces_value_5_2 = <pieces_value_5_2>
			drummer_choose_hand_6 = <drummer_choose_hand_6>
			time_to_hit_6 = <time_to_hit_6>
			hit_velocity_6_1 = <hit_velocity_6_1>
			hit_velocity_6_2 = <hit_velocity_6_2>
			num_pieces_hit_6 = <num_pieces_hit_6>
			pieces_value_6_1 = <pieces_value_6_1>
			pieces_value_6_2 = <pieces_value_6_2>
		}
		updatenotehitdatafast arrayprefix = <arrayprefix> event_array = <event_array>
		time_to_hit_5 = (<time_to_hit_5> + <offset>)
	endif
	if ((<time_to_hit_6> < 50.0) && (<num_pieces_hit_6> = 1) && (<num_pieces_hit_5> = 1))
		offset = <time_to_hit_6>
		num_pieces_hit_5 = 2
		if (<pieces_value_5_1> <= <pieces_value_6_1>)
			pieces_value_5_2 = <pieces_value_6_1>
		else
			pieces_value_5_1 = <pieces_value_6_1>
		endif
		updatenotehitdatafast arrayprefix = <arrayprefix> event_array = <event_array>
		time_to_hit_6 = (<time_to_hit_6> + <offset>)
	endif
	return {
		drummer_choose_hand_2 = <drummer_choose_hand_2>
		time_to_hit_2 = <time_to_hit_2>
		hit_velocity_2_1 = <hit_velocity_2_1>
		hit_velocity_2_2 = <hit_velocity_2_2>
		num_pieces_hit_2 = <num_pieces_hit_2>
		pieces_value_2_1 = <pieces_value_2_1>
		pieces_value_2_2 = <pieces_value_2_2>
		drummer_choose_hand_3 = <drummer_choose_hand_3>
		time_to_hit_3 = <time_to_hit_3>
		hit_velocity_3_1 = <hit_velocity_3_1>
		hit_velocity_3_2 = <hit_velocity_3_2>
		num_pieces_hit_3 = <num_pieces_hit_3>
		pieces_value_3_1 = <pieces_value_3_1>
		pieces_value_3_2 = <pieces_value_3_2>
		drummer_choose_hand_4 = <drummer_choose_hand_4>
		time_to_hit_4 = <time_to_hit_4>
		hit_velocity_4_1 = <hit_velocity_4_1>
		hit_velocity_4_2 = <hit_velocity_4_2>
		num_pieces_hit_4 = <num_pieces_hit_4>
		pieces_value_4_1 = <pieces_value_4_1>
		pieces_value_4_2 = <pieces_value_4_2>
		drummer_choose_hand_5 = <drummer_choose_hand_5>
		time_to_hit_5 = <time_to_hit_5>
		hit_velocity_5_1 = <hit_velocity_5_1>
		hit_velocity_5_2 = <hit_velocity_5_2>
		num_pieces_hit_5 = <num_pieces_hit_5>
		pieces_value_5_1 = <pieces_value_5_1>
		pieces_value_5_2 = <pieces_value_5_2>
		drummer_choose_hand_6 = <drummer_choose_hand_6>
		time_to_hit_6 = <time_to_hit_6>
		hit_velocity_6_1 = <hit_velocity_6_1>
		hit_velocity_6_2 = <hit_velocity_6_2>
		num_pieces_hit_6 = <num_pieces_hit_6>
		pieces_value_6_1 = <pieces_value_6_1>
		pieces_value_6_2 = <pieces_value_6_2>
	}
	arrayprefix = none
	event_array = none
	offset = 0.0
	time_to_hit_2 = 0.0
	time_to_hit_4 = 0.0
	time_to_hit_3 = 0.0
	time_to_hit_5 = 0.0
	time_to_hit_6 = 0.0
	pieces_value_2_1 = 0
	pieces_value_3_1 = 0
	pieces_value_4_1 = 0
	pieces_value_5_1 = 0
	num_pieces_hit_2 = 0
	num_pieces_hit_3 = 0
	num_pieces_hit_4 = 0
	num_pieces_hit_5 = 0
	num_pieces_hit_6 = 0
	pieces_value_6_1 = 0
	pieces_value_2_2 = 0
	pieces_value_3_2 = 0
	pieces_value_4_2 = 0
	pieces_value_5_2 = 0
	pieces_value_6_2 = 0
	hit_velocity_2_1 = 0.0
	hit_velocity_2_2 = 0.0
	hit_velocity_3_1 = 0.0
	hit_velocity_3_2 = 0.0
	hit_velocity_4_1 = 0.0
	hit_velocity_4_2 = 0.0
	hit_velocity_5_1 = 0.0
	hit_velocity_5_2 = 0.0
	hit_velocity_6_1 = 0.0
	hit_velocity_6_2 = 0.0
	drummer_choose_hand_4 = none
	drummer_choose_hand_5 = none
	drummer_choose_hand_6 = none
	drummer_choose_hand_3 = none
	drummer_choose_hand_2 = none
endscript

script shift_notes 
	if (<shift_from> = 3)
		drummer_choose_hand_3 = <drummer_choose_hand_4>
		time_to_hit_3 = <time_to_hit_4>
		hit_velocity_3_1 = <hit_velocity_4_1>
		hit_velocity_3_2 = <hit_velocity_4_2>
		num_pieces_hit_3 = <num_pieces_hit_4>
		pieces_value_3_1 = <pieces_value_4_1>
		pieces_value_3_2 = <pieces_value_4_2>
		old_time = ($drumnote_times [3])
		setglobalintegerarrayelement global_array_name = drumnote_times index = 2 new_value = <old_time>
	endif
	if (<shift_from> <= 4)
		drummer_choose_hand_4 = <drummer_choose_hand_5>
		time_to_hit_4 = <time_to_hit_5>
		hit_velocity_4_1 = <hit_velocity_5_1>
		hit_velocity_4_2 = <hit_velocity_5_2>
		num_pieces_hit_4 = <num_pieces_hit_5>
		pieces_value_4_1 = <pieces_value_5_1>
		pieces_value_4_2 = <pieces_value_5_2>
		old_time = ($drumnote_times [4])
		setglobalintegerarrayelement global_array_name = drumnote_times index = 3 new_value = <old_time>
	endif
	if (<shift_from> <= 5)
		drummer_choose_hand_5 = <drummer_choose_hand_6>
		time_to_hit_5 = <time_to_hit_6>
		hit_velocity_5_1 = <hit_velocity_6_1>
		hit_velocity_5_2 = <hit_velocity_6_2>
		num_pieces_hit_5 = <num_pieces_hit_6>
		pieces_value_5_1 = <pieces_value_6_1>
		pieces_value_5_2 = <pieces_value_6_2>
		old_time = ($drumnote_times [5])
		setglobalintegerarrayelement global_array_name = drumnote_times index = 4 new_value = <old_time>
	endif
	return {
		drummer_choose_hand_3 = <drummer_choose_hand_3>
		time_to_hit_3 = <time_to_hit_3>
		hit_velocity_3_1 = <hit_velocity_3_1>
		hit_velocity_3_2 = <hit_velocity_3_2>
		num_pieces_hit_3 = <num_pieces_hit_3>
		pieces_value_3_1 = <pieces_value_3_1>
		pieces_value_3_2 = <pieces_value_3_2>
		drummer_choose_hand_4 = <drummer_choose_hand_4>
		time_to_hit_4 = <time_to_hit_4>
		hit_velocity_4_1 = <hit_velocity_4_1>
		hit_velocity_4_2 = <hit_velocity_4_2>
		num_pieces_hit_4 = <num_pieces_hit_4>
		pieces_value_4_1 = <pieces_value_4_1>
		pieces_value_4_2 = <pieces_value_4_2>
		drummer_choose_hand_5 = <drummer_choose_hand_5>
		time_to_hit_5 = <time_to_hit_5>
		hit_velocity_5_1 = <hit_velocity_5_1>
		hit_velocity_5_2 = <hit_velocity_5_2>
		num_pieces_hit_5 = <num_pieces_hit_5>
		pieces_value_5_1 = <pieces_value_5_1>
		pieces_value_5_2 = <pieces_value_5_2>
	}
	time_to_hit_3 = 0.0
	time_to_hit_4 = 0.0
	time_to_hit_5 = 0.0
	time_to_hit_6 = 0.0
	hit_velocity_3_1 = 0.0
	hit_velocity_3_2 = 0.0
	num_pieces_hit_3 = 0
	pieces_value_3_1 = 0
	pieces_value_3_2 = 0
	hit_velocity_4_1 = 0.0
	hit_velocity_4_2 = 0.0
	num_pieces_hit_4 = 0
	pieces_value_4_1 = 0
	pieces_value_4_2 = 0
	hit_velocity_5_1 = 0.0
	hit_velocity_5_2 = 0.0
	num_pieces_hit_5 = 0
	pieces_value_5_1 = 0
	pieces_value_5_2 = 0
	hit_velocity_6_1 = 0.0
	hit_velocity_6_2 = 0.0
	num_pieces_hit_6 = 0
	pieces_value_6_1 = 0
	pieces_value_6_2 = 0
	drummer_choose_hand_4 = none
	drummer_choose_hand_5 = none
	drummer_choose_hand_6 = none
	drummer_choose_hand_3 = none
	drummer_choose_hand_2 = none
endscript

script orgainize_drum_value \{pieces_value_1 = 0
		pieces_value_2 = 0
		velocity1 = 0.0
		velocity2 = 0.0}
	pieces_value_3 = 0
	velocity3 = 0.0
	if (<pieces_value_1> > <pieces_value_2>)
		pieces_value_3 = <pieces_value_1>
		velocity3 = <velocity1>
		pieces_value_1 = <pieces_value_2>
		velocity1 = <velocity2>
		pieces_value_2 = <pieces_value_3>
		velocity2 = <velocity3>
	endif
	return pieces_value_1 = <pieces_value_1> pieces_value_2 = <pieces_value_2> velocity1 = <velocity1> velocity2 = <velocity2>
endscript

script normalize_velocities \{value = 0
		velocity_to_normalize = 0.0}
	if ((<value> = 2) || (<value> = 6) || (<value> = 8))
		if (<velocity_to_normalize> < 70)
			velocity = (<velocity_to_normalize> / 69.0)
		else
			velocity = ((<velocity_to_normalize> -70.0) / 58.0)
		endif
	else
		velocity = (<velocity_to_normalize> / 127.0)
	endif
	if (<velocity> > 1.0)
		velocity = 1.0
	elseif (<velocity> < 0.1)
		velocity = 0.1
	endif
	velocity = (<velocity> * <velocity> * <velocity>)
	return normalized_velocity = <velocity>
endscript

script create_target_state \{value_l = 0
		value_r = 0}
	switch (<value_l>)
		case 0
		state = 'S1T3'
		case 1
		switch (<value_r>)
			case 1
			state = 'S1S1'
			case 2
			state = 'S1H1'
			case 3
			state = 'S1C1'
			case 4
			state = 'S1T1'
			case 5
			state = 'S1T2'
			case 6
			state = 'S1C2'
			case 7
			state = 'S1T3'
			case 8
			state = 'S1C3'
			default
			state = 'S1T3'
		endswitch
		case 2
		switch (<value_r>)
			case 2
			state = 'H1H1'
			case 3
			state = 'H1C1'
			case 4
			state = 'H1T1'
			case 5
			state = 'H1T2'
			case 6
			state = 'H1C2'
			case 7
			state = 'H1T3'
			case 8
			state = 'H1C3'
			default
			state = 'S1T3'
		endswitch
		case 3
		switch (<value_r>)
			case 1
			state = 'C1S1'
			case 3
			state = 'C1C1'
			case 4
			state = 'C1T1'
			case 5
			state = 'C1T2'
			case 6
			state = 'C1C2'
			case 7
			state = 'C1T3'
			case 8
			state = 'C1C3'
			default
			state = 'S1T3'
		endswitch
		case 4
		switch (<value_r>)
			case 4
			state = 'T1T1'
			case 5
			state = 'T1T2'
			case 6
			state = 'T1C2'
			case 7
			state = 'T1T3'
			case 8
			state = 'T1C3'
			default
			state = 'S1T3'
		endswitch
		case 5
		switch (<value_r>)
			case 5
			state = 'T2T2'
			case 6
			state = 'T2C2'
			case 7
			state = 'T2T3'
			case 8
			state = 'T2C3'
			default
			state = 'S1T3'
		endswitch
		case 6
		switch (<value_r>)
			case 6
			state = 'C2C2'
			case 7
			state = 'C2T3'
			case 8
			state = 'C2C3'
			default
			state = 'S1T3'
		endswitch
		case 7
		switch (<value_r>)
			case 7
			state = 'T3T3'
			case 8
			state = 'T3C3'
			default
			state = 'S1T3'
		endswitch
		case 8
		switch (<value_r>)
			case 8
			state = 'C3C3'
			default
			state = 'S1T3'
		endswitch
		default
		state = 'S1T3'
	endswitch
	return state_string = <state>
endscript

script create_target_state_full \{value_l = 0
		value_r = 0}
	switch (<value_l>)
		case 0
		state = 'S1T3'
		case 1
		switch (<value_r>)
			case 1
			state = 'S1S1'
			case 2
			state = 'S1H1'
			case 3
			state = 'S1C1'
			case 4
			state = 'S1T1'
			case 5
			state = 'S1T2'
			case 6
			state = 'S1C2'
			case 7
			state = 'S1T3'
			case 8
			state = 'S1C3'
			default
			state = 'S1T3'
		endswitch
		case 2
		switch (<value_r>)
			case 1
			state = 'H1S1'
			case 2
			state = 'H1H1'
			case 3
			state = 'H1C1'
			case 4
			state = 'H1T1'
			case 5
			state = 'H1T2'
			case 6
			state = 'H1C2'
			case 7
			state = 'H1T3'
			case 8
			state = 'H1C3'
			default
			state = 'S1T3'
		endswitch
		case 3
		switch (<value_r>)
			case 1
			state = 'C1S1'
			case 2
			state = 'C1H1'
			case 3
			state = 'C1C1'
			case 4
			state = 'C1T1'
			case 5
			state = 'C1T2'
			case 6
			state = 'C1C2'
			case 7
			state = 'C1T3'
			case 8
			state = 'C1C3'
			default
			state = 'S1T3'
		endswitch
		case 4
		switch (<value_r>)
			case 1
			state = 'T1S1'
			case 2
			state = 'T1H1'
			case 3
			state = 'T1C1'
			case 4
			state = 'T1T1'
			case 5
			state = 'T1T2'
			case 6
			state = 'T1C2'
			case 7
			state = 'T1T3'
			case 8
			state = 'T1C3'
			default
			state = 'S1T3'
		endswitch
		case 5
		switch (<value_r>)
			case 1
			state = 'T2S1'
			case 2
			state = 'T2H1'
			case 3
			state = 'T2C1'
			case 4
			state = 'T2T1'
			case 5
			state = 'T2T2'
			case 6
			state = 'T2C2'
			case 7
			state = 'T2T3'
			case 8
			state = 'T2C3'
			default
			state = 'S1T3'
		endswitch
		case 6
		switch (<value_r>)
			case 1
			state = 'C2S1'
			case 2
			state = 'C2H1'
			case 3
			state = 'C2C1'
			case 4
			state = 'C2T1'
			case 5
			state = 'C2T2'
			case 6
			state = 'C2C2'
			case 7
			state = 'C2T3'
			case 8
			state = 'C2C3'
			default
			state = 'S1T3'
		endswitch
		case 7
		switch (<value_r>)
			case 1
			state = 'T3S1'
			case 2
			state = 'T3H1'
			case 3
			state = 'T3C1'
			case 4
			state = 'T3T1'
			case 5
			state = 'T3T2'
			case 6
			state = 'T3C2'
			case 7
			state = 'T3T3'
			case 8
			state = 'T3C3'
			default
			state = 'S1T3'
		endswitch
		case 8
		switch (<value_r>)
			case 1
			state = 'C3S1'
			case 2
			state = 'C3H1'
			case 3
			state = 'C3C1'
			case 4
			state = 'C3T1'
			case 5
			state = 'C3T2'
			case 6
			state = 'C3C2'
			case 7
			state = 'C3T3'
			case 8
			state = 'C3C3'
			default
			state = 'S1T3'
		endswitch
		default
		state = 'S1T3'
	endswitch
	return state_string = <state>
endscript

script drummer_priority_init 
	pl = 1.0
	pr = 1.0
	piece_diff_spead = 1.0
	switch <l>
		case 0
		pl = 10000.0
		case 1
		pl = (1.0 + (<piece_diff_spead> * 0.5))
		case 2
		pl = 1.0
		case 3
		pl = 1.0
		case 4
		pl = (1.0 + (<piece_diff_spead> * 0.2))
		case 5
		pl = (1.0 + (<piece_diff_spead> * 0.2))
		case 6
		pl = (1.0 - (<piece_diff_spead> * 0.3))
		case 7
		pl = 1.0
		case 8
		pl = (1.0 - (<piece_diff_spead> * 0.3))
		default
	endswitch
	switch <r>
		case 0
		pr = 10000.0
		case 1
		pr = 1.0
		case 2
		pr = 1.0
		case 3
		pr = (1.0 + (<piece_diff_spead> * 0.7))
		case 4
		pr = 1.0
		case 5
		pr = 1.0
		case 6
		pr = (1.0 + (<piece_diff_spead> * 0.7))
		case 7
		pr = (1.0 + (<piece_diff_spead> * 0.5))
		case 8
		pr = (1.0 + (<piece_diff_spead> * 0.7))
		default
	endswitch
	pl = (<pl> * <strength>)
	pr = (<pr> * <strength>)
	return pl = <pl> pr = <pr>
	l = 0
	r = 0
	strength = 0.0
endscript

script compare_note_values 
	global_multiplier = 1.0
	if (<note1> < <note2>)
		lower = <note1>
		higher = <note2>
	else
		lower = <note2>
		higher = <note1>
	endif
	switch <lower>
		case 0
		multiplier = 1.0
		case 1
		switch <higher>
			case 1
			multiplier = 1.0
			case 2
			multiplier = 0.8
			case 3
			multiplier = 0.6
			case 4
			multiplier = 0.9
			case 5
			multiplier = 0.8
			case 6
			multiplier = 0.3
			case 7
			multiplier = 0.7
			case 8
			multiplier = 0.5
			default
			multiplier = 1.0
		endswitch
		case 2
		switch <higher>
			case 2
			multiplier = 1.0
			case 3
			multiplier = 0.8
			case 4
			multiplier = 0.8
			case 5
			multiplier = 0.6
			case 6
			multiplier = 0.4
			case 7
			multiplier = 0.6
			case 8
			multiplier = 0.3
			default
			multiplier = 1.0
		endswitch
		case 3
		switch <higher>
			case 3
			multiplier = 1.0
			case 4
			multiplier = 0.6
			case 5
			multiplier = 0.5
			case 6
			multiplier = 0.8
			case 7
			multiplier = 0.4
			case 8
			multiplier = 0.7
			default
			multiplier = 1.0
		endswitch
		case 4
		switch <higher>
			case 4
			multiplier = 1.0
			case 5
			multiplier = 0.9
			case 6
			multiplier = 0.6
			case 7
			multiplier = 0.8
			case 8
			multiplier = 0.5
			default
			multiplier = 1.0
		endswitch
		case 5
		switch <higher>
			case 5
			multiplier = 1.0
			case 6
			multiplier = 0.6
			case 7
			multiplier = 0.9
			case 8
			multiplier = 0.6
			default
			multiplier = 1.0
		endswitch
		case 6
		switch <higher>
			case 6
			multiplier = 1.0
			case 7
			multiplier = 0.5
			case 8
			multiplier = 0.8
			default
			multiplier = 1.0
		endswitch
		case 7
		switch <higher>
			case 7
			multiplier = 1.0
			case 8
			multiplier = 0.6
			default
			multiplier = 1.0
		endswitch
		case 8
		switch <higher>
			case 8
			multiplier = 1.0
			default
			multiplier = 1.0
		endswitch
		default
		multiplier = 1.0
	endswitch
	multiplier = (1 - ((1 - <multiplier>) * <global_multiplier>))
	return multiplier = <multiplier>
	note1 = 0
	note2 = 0
	lower = 0
	higher = 0
endscript

script prioritize_piece_value 
	compare_note_values note1 = <test_value> note2 = <value_1>
	priority_1 = (<priority_1> * <multiplier>)
	compare_note_values note1 = <test_value> note2 = <value_2>
	priority_2 = (<priority_2> * <multiplier>)
	compare_note_values note1 = <test_value> note2 = <value_3>
	priority_3 = (<priority_3> * <multiplier>)
	compare_note_values note1 = <test_value> note2 = <value_4>
	priority_4 = (<priority_4> * <multiplier>)
	compare_note_values note1 = <test_value> note2 = <value_5>
	priority_5 = (<priority_5> * <multiplier>)
	compare_note_values note1 = <test_value> note2 = <value_6>
	priority_6 = (<priority_6> * <multiplier>)
	if (<hand> = r)
		return {
			priority_1_r = <priority_1>
			priority_2_r = <priority_2>
			priority_3_r = <priority_3>
			priority_4_r = <priority_4>
			priority_5_r = <priority_5>
			priority_6_r = <priority_6>
		}
	else
		return {
			priority_1_l = <priority_1>
			priority_2_l = <priority_2>
			priority_3_l = <priority_3>
			priority_4_l = <priority_4>
			priority_5_l = <priority_5>
			priority_6_l = <priority_6>
		}
	endif
	test_value = 0
	value_1 = 0
	priority_1 = 0.0
	multiplier = 0.0
	value_2 = 0
	priority_2 = 0.0
	value_3 = 0
	priority_3 = 0.0
	value_4 = 0
	priority_4 = 0.0
	value_5 = 0
	priority_5 = 0.0
	value_6 = 0
	priority_6 = 0.0
endscript

script prioritize_time_to_hit_fast 
	fast_multiplier = 4.0
	unique = 1.5
	is_unique = true
	min = 50.0
	max = 200.0
	multiplier = 1.0
	if (<time1> < <max>)
		if (<time1> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time1> - <min>) / (<max> - <min>)))))
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_1_r = (<priority_1_r> * <multiplier>)
		priority_1_l = (<priority_1_l> * <multiplier>)
	endif
	if (<time2> < <max>)
		if (<time2> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time2> - <min>) / (<max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_2_1>) || (<pieces_value_1_2> = <pieces_value_2_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_2_r = (<priority_2_r> * <multiplier>)
		priority_2_l = (<priority_2_l> * <multiplier>)
		is_unique = true
	endif
	if (<time3> < <max>)
		if (<time3> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time3> - <min>) / (<max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_3_1>) || (<pieces_value_1_2> = <pieces_value_3_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_2_1> = <pieces_value_3_1>) || (<pieces_value_2_2> = <pieces_value_3_2>))
			priority_2_r = (<priority_2_r> * <multiplier>)
			priority_2_l = (<priority_2_l> * <multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_3_r = (<priority_3_r> * <multiplier>)
		priority_3_l = (<priority_3_l> * <multiplier>)
		is_unique = true
	endif
	if (<time4> < <max>)
		if (<time4> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time4> - <min>) / (<max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_4_1>) || (<pieces_value_1_2> = <pieces_value_4_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_2_1> = <pieces_value_4_1>) || (<pieces_value_2_2> = <pieces_value_4_2>))
			priority_2_r = (<priority_2_r> * <multiplier>)
			priority_2_l = (<priority_2_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_3_1> = <pieces_value_4_1>) || (<pieces_value_3_2> = <pieces_value_4_2>))
			priority_3_r = (<priority_3_r> * <multiplier>)
			priority_3_l = (<priority_3_l> * <multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_4_r = (<priority_4_r> * <multiplier>)
		priority_4_l = (<priority_4_l> * <multiplier>)
		is_unique = true
	endif
	if (<time5> < <max>)
		if (<time5> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time5> - <min>) / (<max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_5_1>) || (<pieces_value_1_2> = <pieces_value_5_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_2_1> = <pieces_value_5_1>) || (<pieces_value_2_2> = <pieces_value_5_2>))
			priority_2_r = (<priority_2_r> * <multiplier>)
			priority_2_l = (<priority_2_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_3_1> = <pieces_value_5_1>) || (<pieces_value_3_2> = <pieces_value_5_2>))
			priority_3_r = (<priority_3_r> * <multiplier>)
			priority_3_l = (<priority_3_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_4_1> = <pieces_value_5_1>) || (<pieces_value_4_2> = <pieces_value_5_2>))
			priority_4_r = (<priority_4_r> * <multiplier>)
			priority_4_l = (<priority_4_l> * <multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_5_r = (<priority_5_r> * <multiplier>)
		priority_5_l = (<priority_5_l> * <multiplier>)
		is_unique = true
	endif
	if (<time6> < <max>)
		if (<time6> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time6> - <min>) / (<max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_6_1>) || (<pieces_value_1_2> = <pieces_value_6_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_2_1> = <pieces_value_6_1>) || (<pieces_value_2_2> = <pieces_value_6_2>))
			priority_2_r = (<priority_2_r> * <multiplier>)
			priority_2_l = (<priority_2_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_3_1> = <pieces_value_6_1>) || (<pieces_value_3_2> = <pieces_value_6_2>))
			priority_3_r = (<priority_3_r> * <multiplier>)
			priority_3_l = (<priority_3_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_4_1> = <pieces_value_6_1>) || (<pieces_value_4_2> = <pieces_value_6_2>))
			priority_4_r = (<priority_4_r> * <multiplier>)
			priority_4_l = (<priority_4_l> * <multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_5_1> = <pieces_value_6_1>) || (<pieces_value_5_2> = <pieces_value_6_2>))
			priority_5_r = (<priority_5_r> * <multiplier>)
			priority_5_l = (<priority_5_l> * <multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_6_r = (<priority_6_r> * <multiplier>)
		priority_6_l = (<priority_6_l> * <multiplier>)
	endif
	return {
		priority_1_r = <priority_1_r>
		priority_2_r = <priority_2_r>
		priority_3_r = <priority_3_r>
		priority_4_r = <priority_4_r>
		priority_5_r = <priority_5_r>
		priority_6_r = <priority_6_r>
		priority_1_l = <priority_1_l>
		priority_2_l = <priority_2_l>
		priority_3_l = <priority_3_l>
		priority_4_l = <priority_4_l>
		priority_5_l = <priority_5_l>
		priority_6_l = <priority_6_l>
	}
	pieces_value_1_1 = 0
	pieces_value_2_1 = 0
	pieces_value_1_2 = 0
	pieces_value_2_2 = 0
	pieces_value_3_1 = 0
	pieces_value_3_2 = 0
	pieces_value_4_1 = 0
	pieces_value_4_2 = 0
	pieces_value_5_1 = 0
	pieces_value_5_2 = 0
	pieces_value_6_1 = 0
	pieces_value_6_2 = 0
	priority_1_r = 0.0
	priority_1_l = 0.0
	priority_2_r = 0.0
	priority_2_l = 0.0
	priority_3_r = 0.0
	priority_3_l = 0.0
	priority_4_r = 0.0
	priority_4_l = 0.0
	priority_5_r = 0.0
	priority_5_l = 0.0
	priority_6_r = 0.0
	priority_6_l = 0.0
endscript

script prioritize_time_to_hit_slow 
	slow_multiplier = 0.1
	min = 10.0
	max = 6000.0
	multiplier = 1.0
	if (<time2> > <min>)
		if (<time2> > <max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time2> - <min>) / (<max> - <min>))))
		endif
		priority_2_r = (<priority_2_r> * <multiplier>)
		priority_3_r = (<priority_3_r> * <multiplier>)
		priority_4_r = (<priority_4_r> * <multiplier>)
		priority_5_r = (<priority_5_r> * <multiplier>)
		priority_6_r = (<priority_6_r> * <multiplier>)
		priority_2_l = (<priority_2_l> * <multiplier>)
		priority_3_l = (<priority_3_l> * <multiplier>)
		priority_4_l = (<priority_4_l> * <multiplier>)
		priority_5_l = (<priority_5_l> * <multiplier>)
		priority_6_l = (<priority_6_l> * <multiplier>)
	endif
	if (<time3> > <min>)
		if (<time3> > <max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time3> - <min>) / (<max> - <min>))))
		endif
		priority_3_r = (<priority_3_r> * <multiplier>)
		priority_4_r = (<priority_4_r> * <multiplier>)
		priority_5_r = (<priority_5_r> * <multiplier>)
		priority_6_r = (<priority_6_r> * <multiplier>)
		priority_3_l = (<priority_3_l> * <multiplier>)
		priority_4_l = (<priority_4_l> * <multiplier>)
		priority_5_l = (<priority_5_l> * <multiplier>)
		priority_6_l = (<priority_6_l> * <multiplier>)
	endif
	if (<time4> > <min>)
		if (<time4> > <max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time4> - <min>) / (<max> - <min>))))
		endif
		priority_4_r = (<priority_4_r> * <multiplier>)
		priority_5_r = (<priority_5_r> * <multiplier>)
		priority_6_r = (<priority_6_r> * <multiplier>)
		priority_4_l = (<priority_4_l> * <multiplier>)
		priority_5_l = (<priority_5_l> * <multiplier>)
		priority_6_l = (<priority_6_l> * <multiplier>)
	endif
	if (<time5> > <min>)
		if (<time5> > <max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time5> - <min>) / (<max> - <min>))))
		endif
		priority_5_r = (<priority_5_r> * <multiplier>)
		priority_6_r = (<priority_6_r> * <multiplier>)
		priority_5_l = (<priority_5_l> * <multiplier>)
		priority_6_l = (<priority_6_l> * <multiplier>)
	endif
	if (<time6> > <min>)
		if (<time6> > <max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time6> - <min>) / (<max> - <min>))))
		endif
		priority_6_r = (<priority_6_r> * <multiplier>)
		priority_6_r = (<priority_6_r> * <multiplier>)
		priority_6_l = (<priority_6_l> * <multiplier>)
		priority_6_l = (<priority_6_l> * <multiplier>)
	endif
	return {
		priority_2_r = <priority_2_r>
		priority_3_r = <priority_3_r>
		priority_4_r = <priority_4_r>
		priority_5_r = <priority_5_r>
		priority_6_r = <priority_6_r>
		priority_2_l = <priority_2_l>
		priority_3_l = <priority_3_l>
		priority_4_l = <priority_4_l>
		priority_5_l = <priority_5_l>
		priority_6_l = <priority_6_l>
	}
	priority_2_r = 0.0
	priority_3_r = 0.0
	priority_4_r = 0.0
	priority_5_r = 0.0
	priority_6_r = 0.0
	priority_2_l = 0.0
	priority_3_l = 0.0
	priority_4_l = 0.0
	priority_5_l = 0.0
	priority_6_l = 0.0
endscript

script compare_5_v_6 \{p5 = !f1768515945
		p6 = !f1768515945}
	if (<p5> >= <p6>)
		target = 5
		priority = <p5>
	else
		target = 6
		priority = <p6>
	endif
	return target = <target> priority = <priority>
endscript

script compare_4_v_5 \{p4 = !f1768515945
		p5 = !f1768515945
		p6 = !f1768515945}
	if (<p4> >= <p5>)
		if (<p4> >= <p6>)
			target = 4
			priority = <p4>
		else
			target = 6
			priority = <p6>
		endif
	else
		compare_5_v_6 p5 = <p5> p6 = <p6>
	endif
	return target = <target> priority = <priority>
endscript

script compare_3_v_4 \{p3 = !f1768515945
		p4 = !f1768515945
		p5 = !f1768515945
		p6 = !f1768515945}
	if (<p3> >= <p4>)
		if (<p3> >= <p5>)
			if (<p3> >= <p6>)
				target = 3
				priority = <p3>
			else
				target = 6
				priority = <p6>
			endif
		else
			compare_5_v_6 p5 = <p5> p6 = <p6>
		endif
	else
		compare_4_v_5 p4 = <p4> p5 = <p5> p6 = <p6>
	endif
	return target = <target> priority = <priority>
endscript

script compare_2_v_3 \{p2 = !f1768515945
		p3 = !f1768515945
		p4 = !f1768515945
		p5 = !f1768515945
		p6 = !f1768515945}
	if (<p2> >= <p3>)
		if (<p2> >= <p4>)
			if (<p2> >= <p5>)
				if (<p2> >= <p6>)
					target = 2
					priority = <p2>
				else
					target = 6
					priority = <p6>
				endif
			else
				compare_5_v_6 p5 = <p5> p6 = <p6>
			endif
		else
			compare_4_v_5 p4 = <p4> p5 = <p5> p6 = <p6>
		endif
	else
		compare_3_v_4 p3 = <p3> p4 = <p4> p5 = <p5> p6 = <p6>
	endif
	return target = <target> priority = <priority>
endscript

script choose_highest_priority \{p1 = !f1768515945
		p2 = !f1768515945
		p3 = !f1768515945
		p4 = !f1768515945
		p5 = !f1768515945
		p6 = !f1768515945}
	if (<p1> >= <p2>)
		if (<p1> >= <p3>)
			if (<p1> >= <p4>)
				if (<p1> >= <p5>)
					if (<p1> >= <p6>)
						target = 1
						priority = <p1>
					else
						target = 6
						priority = <p6>
					endif
				else
					compare_5_v_6 p5 = <p5> p6 = <p6>
				endif
			else
				compare_4_v_5 p4 = <p4> p5 = <p5> p6 = <p6>
			endif
		else
			compare_3_v_4 p3 = <p3> p4 = <p4> p5 = <p5> p6 = <p6>
		endif
	else
		compare_2_v_3 p2 = <p2> p3 = <p3> p4 = <p4> p5 = <p5> p6 = <p6>
	endif
	return target = <target> priority = <priority>
endscript

script check_furthest_possible_l 
	if (<pieces_value_6_1> <= <pieces_value_1_2>)
		if (<pieces_value_6_1> <= <pieces_value_2_2>)
			if (<pieces_value_6_1> <= <pieces_value_3_2>)
				if (<pieces_value_6_1> <= <pieces_value_4_2>)
					if (<pieces_value_6_1> <= <pieces_value_5_2>)
						priority_6_l = <priority_6_l>
					else
						priority_6_l = 0.0
					endif
				else
					priority_6_l = 0.0
				endif
			else
				priority_6_l = 0.0
			endif
		else
			priority_6_l = 0.0
		endif
	else
		priority_6_l = 0.0
	endif
	if (<pieces_value_5_1> <= <pieces_value_1_2>)
		if (<pieces_value_5_1> <= <pieces_value_2_2>)
			if (<pieces_value_5_1> <= <pieces_value_3_2>)
				if (<pieces_value_5_1> <= <pieces_value_4_2>)
					priority_5_l = <priority_5_l>
				else
					priority_5_l = 0.0
				endif
			else
				priority_5_l = 0.0
			endif
		else
			priority_5_l = 0.0
		endif
	else
		priority_5_l = 0.0
	endif
	if (<pieces_value_4_1> <= <pieces_value_1_2>)
		if (<pieces_value_4_1> <= <pieces_value_2_2>)
			if (<pieces_value_4_1> <= <pieces_value_3_2>)
				priority_4_l = <priority_4_l>
			else
				priority_4_l = 0.0
			endif
		else
			priority_4_l = 0.0
		endif
	else
		priority_4_l = 0.0
	endif
	if (<pieces_value_3_1> <= <pieces_value_1_2>)
		if (<pieces_value_3_1> <= <pieces_value_2_2>)
			priority_3_l = <priority_3_l>
		else
			priority_3_l = 0.0
		endif
	else
		priority_3_l = 0.0
	endif
	if (<pieces_value_2_1> <= <pieces_value_1_2>)
		priority_2_l = <priority_2_l>
	else
		priority_2_l = 0.0
	endif
	return {
		priority_2_l = <priority_2_l>
		priority_3_l = <priority_3_l>
		priority_4_l = <priority_4_l>
		priority_5_l = <priority_5_l>
		priority_6_l = <priority_6_l>
	}
	pieces_value_1_2 = 0
	pieces_value_2_2 = 0
	pieces_value_3_2 = 0
	pieces_value_4_2 = 0
	pieces_value_5_2 = 0
	pieces_value_2_1 = 0
	pieces_value_3_1 = 0
	pieces_value_4_1 = 0
	pieces_value_5_1 = 0
	pieces_value_6_1 = 0
endscript

script check_crossover_r 
	if (<val_1> = 3 && <val_2> = 1)
		allowed = true
	else
		allowed = false
	endif
	val_2 = 0
	return allowed = <allowed>
endscript

script check_furthest_possible_r 
	if (<pieces_value_6_2> >= <pieces_value_1_1>)
		if (<pieces_value_6_2> >= <pieces_value_2_1>)
			if (<pieces_value_6_2> >= <pieces_value_3_1>)
				if (<pieces_value_6_2> >= <pieces_value_4_1>)
					if (<pieces_value_6_2> >= <pieces_value_5_1>)
						priority_6_r = <priority_6_r>
					else
						check_crossover_r val_1 = <pieces_value_5_1> val_2 = <pieces_value_6_2>
						if (<allowed> = false)
							priority_6_r = 0.0
						endif
					endif
				else
					check_crossover_r val_1 = <pieces_value_4_1> val_2 = <pieces_value_6_2>
					if (<allowed> = false)
						priority_6_r = 0.0
					endif
				endif
			else
				check_crossover_r val_1 = <pieces_value_3_1> val_2 = <pieces_value_6_2>
				if (<allowed> = false)
					priority_6_r = 0.0
				endif
			endif
		else
			check_crossover_r val_1 = <pieces_value_2_1> val_2 = <pieces_value_6_2>
			if (<allowed> = false)
				priority_6_r = 0.0
			endif
		endif
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_6_2>
		if (<allowed> = false)
			priority_6_r = 0.0
		endif
	endif
	if (<pieces_value_5_2> >= <pieces_value_1_1>)
		if (<pieces_value_5_2> >= <pieces_value_2_1>)
			if (<pieces_value_5_2> >= <pieces_value_3_1>)
				if (<pieces_value_5_2> >= <pieces_value_4_1>)
					priority_5_r = <priority_5_r>
				else
					check_crossover_r val_1 = <pieces_value_4_1> val_2 = <pieces_value_5_2>
					if (<allowed> = false)
						priority_5_r = 0.0
					endif
				endif
			else
				check_crossover_r val_1 = <pieces_value_3_1> val_2 = <pieces_value_5_2>
				if (<allowed> = false)
					priority_5_r = 0.0
				endif
			endif
		else
			check_crossover_r val_1 = <pieces_value_2_1> val_2 = <pieces_value_5_2>
			if (<allowed> = false)
				priority_5_r = 0.0
			endif
		endif
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_5_2>
		if (<allowed> = false)
			priority_5_r = 0.0
		endif
	endif
	if (<pieces_value_4_2> >= <pieces_value_1_1>)
		if (<pieces_value_4_2> >= <pieces_value_2_1>)
			if (<pieces_value_4_2> >= <pieces_value_3_1>)
				priority_4_r = <priority_4_r>
			else
				check_crossover_r val_1 = <pieces_value_3_1> val_2 = <pieces_value_4_2>
				if (<allowed> = false)
					priority_4_r = 0.0
				endif
			endif
		else
			check_crossover_r val_1 = <pieces_value_2_1> val_2 = <pieces_value_4_2>
			if (<allowed> = false)
				priority_4_r = 0.0
			endif
		endif
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_4_2>
		if (<allowed> = false)
			priority_4_r = 0.0
		endif
	endif
	if (<pieces_value_3_2> >= <pieces_value_1_1>)
		if (<pieces_value_3_2> >= <pieces_value_2_1>)
			priority_3_r = <priority_3_r>
		else
			check_crossover_r val_1 = <pieces_value_2_1> val_2 = <pieces_value_3_2>
			if (<allowed> = false)
				priority_3_r = 0.0
			endif
		endif
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_3_2>
		if (<allowed> = false)
			priority_3_r = 0.0
		endif
	endif
	if (<pieces_value_2_2> >= <pieces_value_1_1>)
		priority_2_r = <priority_2_r>
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_2_2>
		if (<allowed> = false)
			priority_2_r = 0.0
		endif
	endif
	return {
		priority_2_r = <priority_2_r>
		priority_3_r = <priority_3_r>
		priority_4_r = <priority_4_r>
		priority_5_r = <priority_5_r>
		priority_6_r = <priority_6_r>
	}
	allowed = true
	pieces_value_1_1 = 0
	pieces_value_2_1 = 0
	pieces_value_3_1 = 0
	pieces_value_4_1 = 0
	pieces_value_5_1 = 0
	pieces_value_6_2 = 0
	pieces_value_5_2 = 0
	pieces_value_4_2 = 0
	pieces_value_3_2 = 0
	pieces_value_2_2 = 0
endscript

script get_drum_note_mapping \{note_value = 666}
	if (<note_value> = 666)
		scriptassert \{'requires note param'}
	endif
	<hand_choice> = none
	<using_new_notes> = false
	if ((<note_value> >= $g_left_hand_start_note) && (<note_value> <= $g_left_hand_end_note))
		<using_new_notes> = true
		<hand_choice> = left
	elseif ((<note_value> >= $g_right_hand_start_note) && (<note_value> <= $g_right_hand_end_note))
		<note_value> = (<note_value> - $g_right_hand_start_note)
		<using_new_notes> = true
		<hand_choice> = right
	endif
	if (<using_new_notes> = true)
		<old_note> = <note_value>
		<note_value> = ($g_drum_remapping_values [<note_value>])
	else
	endif
	if (<note_value> >= $g_count_in_sticks_start_note &&
			<note_value> < ($g_count_in_sticks_start_note + $g_count_in_sticks_num_types))
		<old_note> = <note_value>
		<hand_choice> = none
		<note_value> = 83
	elseif (<note_value> >= $g_count_in_hh_start_note &&
			<note_value> < ($g_count_in_hh_start_note + $g_count_in_hh_num_types))
		<old_note> = <note_value>
		<hand_choice> = none
		<note_value> = 78
	endif
	return note_value = <note_value> hand_choice = <hand_choice>
	note_value = 0
	old_note = 0
endscript

script initialize_notehit_data \{start_note = 74
		end_note = 83}
	get_song_prefix song = <current_song>
	extendcrcwithstring checksum = `` string = <song_prefix>
	arrayprefix = <extended_checksum>
	extendcrcwithstring checksum = <arrayprefix> string = '_drums_notes'
	event_array = <extended_checksum>
	if NOT songglobalexists name = <event_array> type = array
		return
	endif
	array_size = 0
	getsongarraysize <event_array>
	note_array_size = <array_size>
	if (<note_array_size> = 0)
		return
	endif
	first_time = 0
	array_entry = 0
	<next_array_entry> = <array_entry>
	hit_info = []
	index = 0
	length = 0
	note_value = 0
	velocity = 0
	begin
	<piece_array2> = []
	<piece_velocities> = []
	<num_pieces_hit> = 0
	<return_hand_choice> = none
	getsongglobal name = <event_array> index = <next_array_entry>
	current_time = <element>
	begin
	getsongglobal name = <event_array> index = (<next_array_entry> + 1)
	decompressnotevalue note_value = <element>
	get_drum_note_mapping note_value = <note_value>
	if (<note_value> >= <start_note> && <note_value> <= <end_note>)
		switch (<note_value>)
			case 73
			value = 0
			case 74
			value = 7
			case 75
			value = 5
			case 76
			value = 4
			case 77
			value = 1
			case 78
			value = 2
			case 79
			value = 2
			case 80
			value = 8
			case 81
			value = 3
			case 82
			value = 6
			case 83
			value = 0
		endswitch
		addintegerarrayelement2 array = <piece_array2> element = <value>
		piece_array2 = <array>
		normalize_velocities value = <value> velocity_to_normalize = <velocity>
		addfloatarrayelement array = <piece_velocities> element = <normalized_velocity>
		piece_velocities = <array>
		<return_hand_choice> = <hand_choice>
		<num_pieces_hit> = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		return hit_info = <hit_info>
	endif
	getsongglobal name = <event_array> index = <next_array_entry>
	next_note_time = <element>
	if (<next_note_time> != <current_time>)
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		time_to_next_note = (<current_time> - <first_time>)
		first_time = <current_time>
		if (<num_pieces_hit> > 1)
			<return_hand_choice> = both
		endif
		new_entry = {
			time = <current_time>
			time_to_hit = <time_to_next_note>
			num_pieces_hit = <num_pieces_hit>
			pieces_value = <piece_array2>
			pieces_velocity = <piece_velocities>
			hand_choice = <return_hand_choice>
		}
		addstructurearrayelement array = <hit_info> element = <new_entry>
		hit_info = <array>
		changeglobalinteger global_name = last_drumnote_time new_value = <current_time>
		setglobalintegerarrayelement global_array_name = drumnote_times index = <index> new_value = <current_time>
		if (<num_pieces_hit> > 1)
			velocity_struct = {
				time = <current_time>
				pieces_value_1 = (<piece_array2> [0])
				pieces_value_2 = (<piece_array2> [1])
			}
		else
			velocity_struct = {
				time = <current_time>
				pieces_value_1 = (<piece_array2> [0])
				pieces_value_2 = (<piece_array2> [0])
			}
		endif
		<index> = (<index> + 1)
		if (<index> > 4)
			break
		endif
	endif
	repeat
	changeglobalinteger global_name = next_drumnote_entry new_value = <next_array_entry>
	return hit_info = <hit_info>
	normalized_velocity = 0.0
	hand_choice = checksum
	current_song = none
	song_prefix = 'none'
	next_note_time = 0
	current_time = 0
	time_to_next_note = 0
endscript

script prep_notehit_data \{hit_info = [
		]}
	array_size = 0
	fastgetarraysize array = <hit_info>
	if (<array_size> > 0)
		time_to_hit_2 = (<hit_info> [0].time_to_hit)
		num_pieces_hit_2 = (<hit_info> [0].num_pieces_hit)
		pieces_value_2_1 = (<hit_info> [0].pieces_value [0])
		hit_velocity_2_1 = (<hit_info> [0].pieces_velocity [0])
		drummer_choose_hand_2 = (<hit_info> [0].hand_choice)
		if (<num_pieces_hit_2> > 1)
			pieces_value_2_2 = (<hit_info> [0].pieces_value [1])
			hit_velocity_2_2 = (<hit_info> [0].pieces_velocity [1])
		else
			pieces_value_2_2 = <pieces_value_2_1>
			hit_velocity_2_2 = <hit_velocity_2_1>
		endif
	else
		time_to_hit_2 = 10000000.0
		num_pieces_hit_2 = 2
		endofsong = true
		pieces_value_2_1 = 3
		pieces_value_2_2 = 7
		hit_velocity_2_1 = 1.0
		hit_velocity_2_2 = 1.0
		drummer_choose_hand_2 = none
	endif
	if (<array_size> > 1)
		time_to_hit_3 = (<hit_info> [1].time_to_hit)
		num_pieces_hit_3 = (<hit_info> [1].num_pieces_hit)
		pieces_value_3_1 = (<hit_info> [1].pieces_value [0])
		hit_velocity_3_1 = (<hit_info> [1].pieces_velocity [0])
		drummer_choose_hand_3 = (<hit_info> [1].hand_choice)
		if (<num_pieces_hit_3> > 1)
			pieces_value_3_2 = (<hit_info> [1].pieces_value [1])
			hit_velocity_3_2 = (<hit_info> [1].pieces_velocity [1])
		else
			pieces_value_3_2 = <pieces_value_3_1>
			hit_velocity_3_2 = <hit_velocity_3_1>
		endif
	else
		time_to_hit_3 = 10000000.0
		num_pieces_hit_3 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		hit_velocity_3_1 = 1.0
		hit_velocity_3_2 = 1.0
		drummer_choose_hand_3 = none
	endif
	if (<array_size> > 2)
		time_to_hit_4 = (<hit_info> [2].time_to_hit)
		num_pieces_hit_4 = (<hit_info> [2].num_pieces_hit)
		pieces_value_4_1 = (<hit_info> [2].pieces_value [0])
		hit_velocity_4_1 = (<hit_info> [2].pieces_velocity [0])
		drummer_choose_hand_4 = (<hit_info> [2].hand_choice)
		if (<num_pieces_hit_4> > 1)
			pieces_value_4_2 = (<hit_info> [2].pieces_value [1])
			hit_velocity_4_2 = (<hit_info> [2].pieces_velocity [1])
		else
			pieces_value_4_2 = <pieces_value_4_1>
			hit_velocity_4_2 = <hit_velocity_4_1>
		endif
	else
		time_to_hit_4 = 10000000.0
		num_pieces_hit_4 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		hit_velocity_4_1 = 1.0
		hit_velocity_4_2 = 1.0
		drummer_choose_hand_4 = none
	endif
	if (<array_size> > 3)
		time_to_hit_5 = (<hit_info> [3].time_to_hit)
		num_pieces_hit_5 = (<hit_info> [3].num_pieces_hit)
		pieces_value_5_1 = (<hit_info> [3].pieces_value [0])
		hit_velocity_5_1 = (<hit_info> [3].pieces_velocity [0])
		drummer_choose_hand_5 = (<hit_info> [3].hand_choice)
		if (<num_pieces_hit_5> > 1)
			pieces_value_5_2 = (<hit_info> [3].pieces_value [1])
			hit_velocity_5_2 = (<hit_info> [3].pieces_velocity [1])
		else
			pieces_value_5_2 = <pieces_value_5_1>
			hit_velocity_5_2 = <hit_velocity_5_1>
		endif
	else
		time_to_hit_5 = 10000000.0
		num_pieces_hit_5 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		hit_velocity_5_1 = 1.0
		hit_velocity_5_2 = 1.0
		drummer_choose_hand_5 = none
	endif
	if (<array_size> > 4)
		time_to_hit_6 = (<hit_info> [4].time_to_hit)
		num_pieces_hit_6 = (<hit_info> [4].num_pieces_hit)
		pieces_value_6_1 = (<hit_info> [4].pieces_value [0])
		hit_velocity_6_1 = (<hit_info> [4].pieces_velocity [0])
		drummer_choose_hand_6 = (<hit_info> [4].hand_choice)
		if (<num_pieces_hit_6> > 1)
			pieces_value_6_2 = (<hit_info> [4].pieces_value [1])
			hit_velocity_6_2 = (<hit_info> [4].pieces_velocity [1])
		else
			pieces_value_6_2 = <pieces_value_6_1>
			hit_velocity_6_2 = <hit_velocity_6_1>
		endif
	else
		time_to_hit_6 = 10000000.0
		num_pieces_hit_6 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		hit_velocity_6_1 = 1.0
		hit_velocity_6_2 = 1.0
		drummer_choose_hand_6 = none
	endif
	orgainize_drum_value pieces_value_1 = <pieces_value_2_1> pieces_value_2 = <pieces_value_2_2> velocity1 = <hit_velocity_2_1> velocity2 = <hit_velocity_2_2>
	pieces_value_2_1 = <pieces_value_1>
	pieces_value_2_2 = <pieces_value_2>
	hit_velocity_2_1 = <velocity1>
	hit_velocity_2_2 = <velocity2>
	orgainize_drum_value pieces_value_1 = <pieces_value_3_1> pieces_value_2 = <pieces_value_3_2> velocity1 = <hit_velocity_3_1> velocity2 = <hit_velocity_3_2>
	pieces_value_3_1 = <pieces_value_1>
	pieces_value_3_2 = <pieces_value_2>
	hit_velocity_3_1 = <velocity1>
	hit_velocity_3_2 = <velocity2>
	orgainize_drum_value pieces_value_1 = <pieces_value_4_1> pieces_value_2 = <pieces_value_4_2> velocity1 = <hit_velocity_4_1> velocity2 = <hit_velocity_4_2>
	pieces_value_4_1 = <pieces_value_1>
	pieces_value_4_2 = <pieces_value_2>
	hit_velocity_4_1 = <velocity1>
	hit_velocity_4_2 = <velocity2>
	orgainize_drum_value pieces_value_1 = <pieces_value_5_1> pieces_value_2 = <pieces_value_5_2> velocity1 = <hit_velocity_5_1> velocity2 = <hit_velocity_5_2>
	pieces_value_5_1 = <pieces_value_1>
	pieces_value_5_2 = <pieces_value_2>
	hit_velocity_5_1 = <velocity1>
	hit_velocity_5_2 = <velocity2>
	orgainize_drum_value pieces_value_1 = <pieces_value_6_1> pieces_value_2 = <pieces_value_6_2> velocity1 = <hit_velocity_6_1> velocity2 = <hit_velocity_6_2>
	pieces_value_6_1 = <pieces_value_1>
	pieces_value_6_2 = <pieces_value_2>
	hit_velocity_6_1 = <velocity1>
	hit_velocity_6_2 = <velocity2>
	old_time = ($drumnote_times [4])
	setglobalintegerarrayelement global_array_name = drumnote_times index = 5 new_value = <old_time>
	old_time = ($drumnote_times [3])
	setglobalintegerarrayelement global_array_name = drumnote_times index = 4 new_value = <old_time>
	old_time = ($drumnote_times [2])
	setglobalintegerarrayelement global_array_name = drumnote_times index = 3 new_value = <old_time>
	old_time = ($drumnote_times [1])
	setglobalintegerarrayelement global_array_name = drumnote_times index = 2 new_value = <old_time>
	old_time = ($drumnote_times [0])
	setglobalintegerarrayelement global_array_name = drumnote_times index = 1 new_value = <old_time>
	setglobalintegerarrayelement \{global_array_name = drumnote_times
		index = 0
		new_value = 0}
	return {
		num_pieces_hit_2 = <num_pieces_hit_2>
		num_pieces_hit_3 = <num_pieces_hit_3>
		num_pieces_hit_4 = <num_pieces_hit_4>
		num_pieces_hit_5 = <num_pieces_hit_5>
		num_pieces_hit_6 = <num_pieces_hit_6>
		time_to_hit_1 = 0
		time_to_hit_2 = <time_to_hit_2>
		time_to_hit_3 = <time_to_hit_3>
		time_to_hit_4 = <time_to_hit_4>
		time_to_hit_5 = <time_to_hit_5>
		time_to_hit_6 = <time_to_hit_6>
		drummer_choose_hand_2 = <drummer_choose_hand_2>
		drummer_choose_hand_3 = <drummer_choose_hand_3>
		drummer_choose_hand_4 = <drummer_choose_hand_4>
		drummer_choose_hand_5 = <drummer_choose_hand_5>
		drummer_choose_hand_6 = <drummer_choose_hand_6>
		pieces_value_2_1 = <pieces_value_2_1>
		pieces_value_2_2 = <pieces_value_2_2>
		pieces_value_3_1 = <pieces_value_3_1>
		pieces_value_3_2 = <pieces_value_3_2>
		pieces_value_4_1 = <pieces_value_4_1>
		pieces_value_4_2 = <pieces_value_4_2>
		pieces_value_5_1 = <pieces_value_5_1>
		pieces_value_5_2 = <pieces_value_5_2>
		pieces_value_6_1 = <pieces_value_6_1>
		pieces_value_6_2 = <pieces_value_6_2>
		hit_velocity_2_1 = <hit_velocity_2_1>
		hit_velocity_3_1 = <hit_velocity_3_1>
		hit_velocity_4_1 = <hit_velocity_4_1>
		hit_velocity_5_1 = <hit_velocity_5_1>
		hit_velocity_6_1 = <hit_velocity_6_1>
		hit_velocity_2_2 = <hit_velocity_2_2>
		hit_velocity_3_2 = <hit_velocity_3_2>
		hit_velocity_4_2 = <hit_velocity_4_2>
		hit_velocity_5_2 = <hit_velocity_5_2>
		hit_velocity_6_2 = <hit_velocity_6_2>
	}
	velocity1 = 0.0
	velocity2 = 0.0
endscript

script update_notehit_data \{start_note = 74
		end_note = 83}
	if NOT songglobalexists name = <event_array> type = array
		return
	endif
	array_size = 0
	getsongarraysize <event_array>
	note_array_size = <array_size>
	next_array_entry = $next_drumnote_entry
	if (<next_array_entry> >= <array_size>)
		return \{time_to_hit_6 = 1000000.0
			num_pieces_hit = 2
			pieces_value_6_1 = 1
			pieces_value_6_2 = 7
			hit_velocity_6_1 = 1.0
			hit_velocity_6_2 = 1.0
			drummer_choose_hand_6 = none}
	endif
	length = 0
	note_value = 0
	velocity = 0
	begin
	piece_array2 = []
	piece_velocities = []
	num_pieces_hit = 0
	<return_hand_choice> = none
	getsongglobal name = <event_array> index = <next_array_entry>
	current_time = <element>
	begin
	getsongglobal name = <event_array> index = (<next_array_entry> + 1)
	decompressnotevalue note_value = <element>
	get_drum_note_mapping note_value = <note_value>
	if (<note_value> >= <start_note> && <note_value> <= <end_note>)
		switch (<note_value>)
			case 73
			value = 0
			case 74
			value = 7
			case 75
			value = 5
			case 76
			value = 4
			case 77
			value = 1
			case 78
			value = 2
			case 79
			value = 2
			case 80
			value = 8
			case 81
			value = 3
			case 82
			value = 6
			case 83
			value = 0
		endswitch
		addintegerarrayelement2 array = <piece_array2> element = <value>
		piece_array2 = <array>
		addintegerarrayelement2 array = <piece_velocities> element = <velocity>
		piece_velocities = <array>
		<return_hand_choice> = <hand_choice>
		num_pieces_hit = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		if (<num_pieces_hit> = 0)
			return \{time_to_hit_6 = 1000000.0
				num_pieces_hit_6 = 2
				pieces_value_6_1 = 1
				pieces_value_6_2 = 7
				hit_velocity_6_1 = 1.0
				hit_velocity_6_2 = 1.0
				drummer_choose_hand_6 = none}
		endif
		break
	endif
	getsongglobal name = <event_array> index = <next_array_entry>
	next_note_time = <element>
	if (<next_note_time> != <current_time>)
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		if (<num_pieces_hit> > 1)
			<return_hand_choice> = both
		endif
		time_to_next_note = (<current_time> - $last_drumnote_time)
		first_time = <current_time>
		time_to_hit_6 = <time_to_next_note>
		num_pieces_hit_6 = <num_pieces_hit>
		if (<num_pieces_hit> = 1)
			pieces_value_6_1 = (<piece_array2> [0])
			pieces_value_6_2 = <pieces_value_6_1>
			velocity1 = (<piece_velocities> [0])
			normalize_velocities value = <pieces_value_6_1> velocity_to_normalize = <velocity1>
			hit_velocity_6_1 = <normalized_velocity>
			hit_velocity_6_2 = <hit_velocity_6_1>
		else
			piece1 = (<piece_array2> [0])
			piece2 = (<piece_array2> [1])
			velocity1 = (<piece_velocities> [0])
			velocity2 = (<piece_velocities> [1])
			if (<piece2> > <piece1>)
				pieces_value_6_1 = <piece1>
				pieces_value_6_2 = <piece2>
				normalize_velocities value = <pieces_value_6_1> velocity_to_normalize = <velocity1>
				hit_velocity_6_1 = <normalized_velocity>
				normalize_velocities value = <pieces_value_6_2> velocity_to_normalize = <velocity2>
				hit_velocity_6_2 = <normalized_velocity>
			else
				pieces_value_6_1 = <piece2>
				pieces_value_6_2 = <piece1>
				normalize_velocities value = <pieces_value_6_1> velocity_to_normalize = <velocity2>
				hit_velocity_6_1 = <normalized_velocity>
				normalize_velocities value = <pieces_value_6_2> velocity_to_normalize = <velocity1>
				hit_velocity_6_2 = <normalized_velocity>
			endif
		endif
		changeglobalinteger global_name = last_drumnote_time new_value = <current_time>
		changeglobalinteger global_name = next_drumnote_entry new_value = <next_array_entry>
		setglobalintegerarrayelement global_array_name = drumnote_times index = 5 new_value = <current_time>
		break
	endif
	repeat
	velocity_struct = {
		time = <current_time>
		pieces_value_1 = <pieces_value_6_1>
		pieces_value_2 = <pieces_value_6_2>
	}
	getstructurequeuesize \{queue_name = drum_lookat_queue}
	if (<size> > 6)
		getfromstructurequeue \{queue_name = drum_lookat_queue}
	endif
	return {
		time_to_hit_6 = <time_to_hit_6>
		num_pieces_hit_6 = <num_pieces_hit_6>
		pieces_value_6_1 = <pieces_value_6_1>
		pieces_value_6_2 = <pieces_value_6_2>
		hit_velocity_6_1 = <hit_velocity_6_1>
		hit_velocity_6_2 = <hit_velocity_6_2>
		drummer_choose_hand_6 = <return_hand_choice>
	}
	arrayprefix = none
	event_array = none
	normalized_velocity = 0.0
	normalized_velocity = 0.0
	normalized_velocity = 0.0
	next_note_time = 0
	current_time = 0
	time_to_next_note = 0
	pieces_value_6_1 = 0
	hit_velocity_6_1 = 0.0
	piece2 = 0
	piece1 = 0
	velocity1 = 0
	velocity2 = 0
	time_to_hit_6 = 0
	pieces_value_6_2 = 0
	hit_velocity_6_2 = 0.0
	first_time = 0
endscript
drummer_foot_search_ahead = 5000.0
drummer_foot_search_return = 3000.0

script update_notehit_data_left_foot \{start_note = 78
		end_note = 79}
	if NOT songglobalexists name = <event_array> type = array
		return
	endif
	next_array_entry = $next_drumnote_leftfoot_entry
	array_size = 0
	getsongarraysize <event_array>
	note_array_size = <array_size>
	if (<next_array_entry> >= <array_size>)
		return \{time_to_hit_foot_l = 1000000.0
			pieces_hit_foot_l = h1c
			num_pieces_hit_foot_l = 1}
	endif
	length = 0
	note_value = 0
	velocity = 0
	time = 0.0
	getsongtimems time_offset = ($drummer_offset * 1000.0)
	begin
	num_pieces_hit = 0
	getsongglobal name = <event_array> index = <next_array_entry>
	current_time = <element>
	begin
	getsongglobal name = <event_array> index = (<next_array_entry> + 1)
	decompressnotevalue note_value = <element>
	get_drum_note_mapping note_value = <note_value>
	if (<note_value> >= <start_note> && <note_value> <= <end_note>)
		if (<note_value> = 78)
			pieces_hit_foot_l = h1c
		else
			pieces_hit_foot_l = h1o
		endif
		num_pieces_hit = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		return \{time_to_hit_foot_l = 1000000.0
			pieces_hit_foot_l = h1o
			num_pieces_hit_foot_l = 1}
	endif
	getsongglobal name = <event_array> index = <next_array_entry>
	next_note_time = <element>
	if (<next_note_time> != <current_time>)
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		time_to_hit_foot_l = (<current_time> - <time>)
		changeglobalinteger global_name = last_drumnote_leftfoot_time new_value = <current_time>
		changeglobalinteger global_name = next_drumnote_leftfoot_entry new_value = <next_array_entry>
		break
	endif
	search_ahead_time = (<current_time> - <time>)
	if (<search_ahead_time> >= $drummer_foot_search_ahead)
		changeglobalinteger global_name = next_drumnote_leftfoot_entry new_value = <next_array_entry>
		return {
			time_to_hit_foot_l = ($drummer_foot_search_return)
			pieces_hit_foot_l = nothing
			num_pieces_hit_foot_l = 0
		}
	endif
	repeat
	return {
		time_to_hit_foot_l = <time_to_hit_foot_l>
		pieces_hit_foot_l = <pieces_hit_foot_l>
		num_pieces_hit_foot_l = 1
	}
	arrayprefix = none
	event_array = none
	next_note_time = 0
	current_time = 0
	time_to_hit_foot_l = 0.0
endscript

script update_notehit_data_right_foot \{start_note = 73
		end_note = 73}
	if NOT songglobalexists name = <event_array> type = array
		return
	endif
	next_array_entry = $next_drumnote_rightfoot_entry
	array_size = 0
	getsongarraysize <event_array>
	note_array_size = <array_size>
	if (<next_array_entry> >= <array_size>)
		return \{time_to_hit_foot_r = 1000000.0
			start_hit_foot_r = false}
	endif
	length = 0
	note_value = 0
	velocity = 0
	time = 0.0
	getsongtimems time_offset = ($drummer_offset * 1000.0)
	begin
	num_pieces_hit = 0
	getsongglobal name = <event_array> index = <next_array_entry>
	current_time = <element>
	begin
	getsongglobal name = <event_array> index = (<next_array_entry> + 1)
	decompressnotevalue note_value = <element>
	get_drum_note_mapping note_value = <note_value>
	if (<note_value> >= <start_note> && <note_value> <= <end_note>)
		num_pieces_hit = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		return \{time_to_hit_foot_r = 1000000.0
			start_hit_foot_r = false}
	endif
	getsongglobal name = <event_array> index = <next_array_entry>
	next_note_time = <element>
	if (<next_note_time> != <current_time>)
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		time_to_hit_foot_r = (<current_time> - <time>)
		changeglobalinteger global_name = last_drumnote_rightfoot_time new_value = <current_time>
		changeglobalinteger global_name = next_drumnote_rightfoot_entry new_value = <next_array_entry>
		break
	endif
	search_ahead_time = (<current_time> - <time>)
	if (<search_ahead_time> >= $drummer_foot_search_ahead)
		changeglobalinteger global_name = next_drumnote_rightfoot_entry new_value = <next_array_entry>
		return {
			time_to_hit_foot_r = ($drummer_foot_search_return)
			start_hit_foot_r = false
		}
	endif
	repeat
	return {
		time_to_hit_foot_r = <time_to_hit_foot_r>
		start_hit_foot_r = true
	}
	arrayprefix = none
	event_array = none
	next_note_time = 0
	current_time = 0
	time_to_hit_foot_r = 0.0
endscript
