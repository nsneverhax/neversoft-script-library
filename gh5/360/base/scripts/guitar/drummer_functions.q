drumtest = 1

script drummer_kill_spawnscripts 
	KillSpawnedScript \{Name = drumdroid_timers}
	KillSpawnedScript \{Name = hide_non_drummers}
	KillSpawnedScript \{Name = hit_drumkit_piece}
	KillSpawnedScript \{Name = default_kit_anims}
	KillSpawnedScript \{Name = default_drummer_state}
	KillSpawnedScript \{Name = drummer_controlscript}
	KillSpawnedScript \{Name = drummer_transit_base_short}
	KillSpawnedScript \{Name = drummer_transit_base_long}
	KillSpawnedScript \{Name = drummer_transit_arm_r}
	KillSpawnedScript \{Name = drummer_transit_arm_l}
	KillSpawnedScript \{Name = drummer_transit_loops}
	KillSpawnedScript \{Name = drummer_transit_idles}
	KillSpawnedScript \{Name = drummer_current_tempo}
	KillSpawnedScript \{Name = set_drummer_active_values}
	KillSpawnedScript \{Name = hold_transit_requests}
	KillSpawnedScript \{Name = hold_transit_arms}
	KillSpawnedScript \{Name = hold_active_values}
	KillSpawnedScript \{Name = drummer_anticipation_arms}
	KillSpawnedScript \{Name = hold_drummer_anticipation_arms}
	KillSpawnedScript \{Name = hold_drumkit_piece}
	KillSpawnedScript \{Name = hold_body_trans}
	KillSpawnedScript \{Name = hold_body_loops}
	KillSpawnedScript \{Name = idle_check}
endscript

script drummer_reset_globals 
	Change \{last_time_to_hit_r = 1000.0}
	Change \{last_time_to_hit_l = 1000.0}
	Change \{use_db_branch_l = 1}
	Change \{use_db_branch_r = 1}
	Change \{use_db_base = 1}
	Change \{current_db_base = 1}
	Change \{drummer_idle = true}
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
		shift_notes <...>
		update_notehit_data current_song = <current_song>
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
		shift_notes <...>
		update_notehit_data current_song = <current_song>
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
		shift_notes <...>
		update_notehit_data current_song = <current_song>
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
		update_notehit_data current_song = <current_song>
		time_to_hit_6 = (<time_to_hit_6> + <offset>)
	endif
	return <...>
	current_song = None
	offset = 0.0
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
endscript

script shift_notes 
	if (<shift_from> = 3)
		time_to_hit_3 = <time_to_hit_4>
		hit_velocity_3_1 = <hit_velocity_4_1>
		hit_velocity_3_2 = <hit_velocity_4_2>
		num_pieces_hit_3 = <num_pieces_hit_4>
		pieces_value_3_1 = <pieces_value_4_1>
		pieces_value_3_2 = <pieces_value_4_2>
		old_time = ($drumnote_times [3])
		SetArrayElement ArrayName = drumnote_times globalarray index = 2 NewValue = <old_time>
	endif
	if (<shift_from> <= 4)
		time_to_hit_4 = <time_to_hit_5>
		hit_velocity_4_1 = <hit_velocity_5_1>
		hit_velocity_4_2 = <hit_velocity_5_2>
		num_pieces_hit_4 = <num_pieces_hit_5>
		pieces_value_4_1 = <pieces_value_5_1>
		pieces_value_4_2 = <pieces_value_5_2>
		old_time = ($drumnote_times [4])
		SetArrayElement ArrayName = drumnote_times globalarray index = 3 NewValue = <old_time>
	endif
	if (<shift_from> <= 5)
		time_to_hit_5 = <time_to_hit_6>
		hit_velocity_5_1 = <hit_velocity_6_1>
		hit_velocity_5_2 = <hit_velocity_6_2>
		num_pieces_hit_5 = <num_pieces_hit_6>
		pieces_value_5_1 = <pieces_value_6_1>
		pieces_value_5_2 = <pieces_value_6_2>
		old_time = ($drumnote_times [5])
		SetArrayElement ArrayName = drumnote_times globalarray index = 4 NewValue = <old_time>
	endif
	return <...>
	time_to_hit_3 = 0.0
	time_to_hit_4 = 0.0
	time_to_hit_5 = 0.0
	time_to_hit_6 = 0.0
	hit_velocity_3_1 = 0
	hit_velocity_3_2 = 0
	num_pieces_hit_3 = 0
	pieces_value_3_1 = 0
	pieces_value_3_2 = 0
	hit_velocity_4_1 = 0
	hit_velocity_4_2 = 0
	num_pieces_hit_4 = 0
	pieces_value_4_1 = 0
	pieces_value_4_2 = 0
	hit_velocity_5_1 = 0
	hit_velocity_5_2 = 0
	num_pieces_hit_5 = 0
	pieces_value_5_1 = 0
	pieces_value_5_2 = 0
	hit_velocity_6_1 = 0
	hit_velocity_6_2 = 0
	num_pieces_hit_6 = 0
	pieces_value_6_1 = 0
	pieces_value_6_2 = 0
endscript

script orgainize_drum_value \{pieces_value_1 = 0
		pieces_value_2 = 0
		velocity1 = 0
		velocity2 = 0}
	pieces_value_3 = 0
	velocity3 = 0
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
		velocity = 0.0}
	if ((<value> = 2) || (<value> = 6) || (<value> = 8))
		if (<velocity> < 70)
			velocity = (<velocity> / 69.0)
		else
			velocity = ((<velocity> -70.0) / 58.0)
		endif
	else
		velocity = (<velocity> / 127.0)
	endif
	if (<velocity> > 1.0)
		velocity = 1.0
	elseif (<velocity> < 0.1)
		velocity = 0.1
	endif
	return velocity = <velocity>
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
	pl = (<pl> * <Strength>)
	pr = (<pr> * <Strength>)
	return pl = <pl> pr = <pr>
	l = 0
	r = 0
	Strength = 0.0
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
	Max = 200.0
	multiplier = 1.0
	if (<time1> < <Max>)
		if (<time1> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time1> - <min>) / (<Max> - <min>)))))
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_1_r = (<priority_1_r> * <multiplier>)
		priority_1_l = (<priority_1_l> * <multiplier>)
	endif
	if (<time2> < <Max>)
		if (<time2> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time2> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_2_1>) || (<pieces_value_1_2> = <pieces_value_2_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = FALSE
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_2_r = (<priority_2_r> * <multiplier>)
		priority_2_l = (<priority_2_l> * <multiplier>)
		is_unique = true
	endif
	if (<time3> < <Max>)
		if (<time3> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time3> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_3_1>) || (<pieces_value_1_2> = <pieces_value_3_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_2_1> = <pieces_value_3_1>) || (<pieces_value_2_2> = <pieces_value_3_2>))
			priority_2_r = (<priority_2_r> * <multiplier>)
			priority_2_l = (<priority_2_l> * <multiplier>)
			is_unique = FALSE
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_3_r = (<priority_3_r> * <multiplier>)
		priority_3_l = (<priority_3_l> * <multiplier>)
		is_unique = true
	endif
	if (<time4> < <Max>)
		if (<time4> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time4> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_4_1>) || (<pieces_value_1_2> = <pieces_value_4_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_2_1> = <pieces_value_4_1>) || (<pieces_value_2_2> = <pieces_value_4_2>))
			priority_2_r = (<priority_2_r> * <multiplier>)
			priority_2_l = (<priority_2_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_3_1> = <pieces_value_4_1>) || (<pieces_value_3_2> = <pieces_value_4_2>))
			priority_3_r = (<priority_3_r> * <multiplier>)
			priority_3_l = (<priority_3_l> * <multiplier>)
			is_unique = FALSE
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_4_r = (<priority_4_r> * <multiplier>)
		priority_4_l = (<priority_4_l> * <multiplier>)
		is_unique = true
	endif
	if (<time5> < <Max>)
		if (<time5> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time5> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_5_1>) || (<pieces_value_1_2> = <pieces_value_5_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_2_1> = <pieces_value_5_1>) || (<pieces_value_2_2> = <pieces_value_5_2>))
			priority_2_r = (<priority_2_r> * <multiplier>)
			priority_2_l = (<priority_2_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_3_1> = <pieces_value_5_1>) || (<pieces_value_3_2> = <pieces_value_5_2>))
			priority_3_r = (<priority_3_r> * <multiplier>)
			priority_3_l = (<priority_3_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_4_1> = <pieces_value_5_1>) || (<pieces_value_4_2> = <pieces_value_5_2>))
			priority_4_r = (<priority_4_r> * <multiplier>)
			priority_4_l = (<priority_4_l> * <multiplier>)
			is_unique = FALSE
		endif
		if (<is_unique> = true)
			multiplier = (<multiplier> * <unique>)
		endif
		priority_5_r = (<priority_5_r> * <multiplier>)
		priority_5_l = (<priority_5_l> * <multiplier>)
		is_unique = true
	endif
	if (<time6> < <Max>)
		if (<time6> < <min>)
			multiplier = <fast_multiplier>
		else
			multiplier = (1 + (<fast_multiplier> * (1 - ((<time6> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_6_1>) || (<pieces_value_1_2> = <pieces_value_6_2>))
			priority_1_r = (<priority_1_r> * <multiplier>)
			priority_1_l = (<priority_1_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_2_1> = <pieces_value_6_1>) || (<pieces_value_2_2> = <pieces_value_6_2>))
			priority_2_r = (<priority_2_r> * <multiplier>)
			priority_2_l = (<priority_2_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_3_1> = <pieces_value_6_1>) || (<pieces_value_3_2> = <pieces_value_6_2>))
			priority_3_r = (<priority_3_r> * <multiplier>)
			priority_3_l = (<priority_3_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_4_1> = <pieces_value_6_1>) || (<pieces_value_4_2> = <pieces_value_6_2>))
			priority_4_r = (<priority_4_r> * <multiplier>)
			priority_4_l = (<priority_4_l> * <multiplier>)
			is_unique = FALSE
		endif
		if ((<pieces_value_5_1> = <pieces_value_6_1>) || (<pieces_value_5_2> = <pieces_value_6_2>))
			priority_5_r = (<priority_5_r> * <multiplier>)
			priority_5_l = (<priority_5_l> * <multiplier>)
			is_unique = FALSE
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
	Max = 6000.0
	multiplier = 1.0
	if (<time2> > <min>)
		if (<time2> > <Max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time2> - <min>) / (<Max> - <min>))))
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
		if (<time3> > <Max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time3> - <min>) / (<Max> - <min>))))
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
		if (<time4> > <Max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time4> - <min>) / (<Max> - <min>))))
		endif
		priority_4_r = (<priority_4_r> * <multiplier>)
		priority_5_r = (<priority_5_r> * <multiplier>)
		priority_6_r = (<priority_6_r> * <multiplier>)
		priority_4_l = (<priority_4_l> * <multiplier>)
		priority_5_l = (<priority_5_l> * <multiplier>)
		priority_6_l = (<priority_6_l> * <multiplier>)
	endif
	if (<time5> > <min>)
		if (<time5> > <Max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time5> - <min>) / (<Max> - <min>))))
		endif
		priority_5_r = (<priority_5_r> * <multiplier>)
		priority_6_r = (<priority_6_r> * <multiplier>)
		priority_5_l = (<priority_5_l> * <multiplier>)
		priority_6_l = (<priority_6_l> * <multiplier>)
	endif
	if (<time6> > <min>)
		if (<time6> > <Max>)
			multiplier = <slow_multiplier>
		else
			multiplier = (1 - ((1 - <slow_multiplier>) * ((<time6> - <min>) / (<Max> - <min>))))
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

script compare_5_v_6 
	if (<p5> >= <p6>)
		target = 5
	else
		target = 6
	endif
	return target = <target>
	p5 = 0.0
	p6 = 0.0
endscript

script compare_4_v_5 
	if (<p4> >= <p5>)
		if (<p4> >= <p6>)
			target = 4
		else
			target = 6
		endif
	else
		compare_5_v_6 <...>
	endif
	return target = <target>
	p4 = 0.0
	p5 = 0.0
	p6 = 0.0
endscript

script compare_3_v_4 
	if (<p3> >= <p4>)
		if (<p3> >= <p5>)
			if (<p3> >= <p6>)
				target = 3
			else
				target = 6
			endif
		else
			compare_5_v_6 <...>
		endif
	else
		compare_4_v_5 <...>
	endif
	return target = <target>
	p3 = 0.0
	p4 = 0.0
	p5 = 0.0
	p6 = 0.0
endscript

script compare_2_v_3 
	if (<p2> >= <p3>)
		if (<p2> >= <p4>)
			if (<p2> >= <p5>)
				if (<p2> >= <p6>)
					target = 2
				else
					target = 6
				endif
			else
				compare_5_v_6 <...>
			endif
		else
			compare_4_v_5 <...>
		endif
	else
		compare_3_v_4 <...>
	endif
	return target = <target>
	p2 = 0.0
	p3 = 0.0
	p4 = 0.0
	p5 = 0.0
	p6 = 0.0
endscript

script choose_highest_priority 
	if (<p1> >= <p2>)
		if (<p1> >= <p3>)
			if (<p1> >= <p4>)
				if (<p1> >= <p5>)
					if (<p1> >= <p6>)
						target = 1
					else
						target = 6
					endif
				else
					compare_5_v_6 <...>
				endif
			else
				compare_4_v_5 <...>
			endif
		else
			compare_3_v_4 <...>
		endif
	else
		compare_2_v_3 <...>
	endif
	return target = <target>
	p1 = 0.0
	p2 = 0.0
	p3 = 0.0
	p4 = 0.0
	p5 = 0.0
	p6 = 0.0
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
		allowed = FALSE
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
						if (<allowed> = FALSE)
							priority_6_r = 0.0
						endif
					endif
				else
					check_crossover_r val_1 = <pieces_value_4_1> val_2 = <pieces_value_6_2>
					if (<allowed> = FALSE)
						priority_6_r = 0.0
					endif
				endif
			else
				check_crossover_r val_1 = <pieces_value_3_1> val_2 = <pieces_value_6_2>
				if (<allowed> = FALSE)
					priority_6_r = 0.0
				endif
			endif
		else
			check_crossover_r val_1 = <pieces_value_2_1> val_2 = <pieces_value_6_2>
			if (<allowed> = FALSE)
				priority_6_r = 0.0
			endif
		endif
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_6_2>
		if (<allowed> = FALSE)
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
					if (<allowed> = FALSE)
						priority_5_r = 0.0
					endif
				endif
			else
				check_crossover_r val_1 = <pieces_value_3_1> val_2 = <pieces_value_5_2>
				if (<allowed> = FALSE)
					priority_5_r = 0.0
				endif
			endif
		else
			check_crossover_r val_1 = <pieces_value_2_1> val_2 = <pieces_value_5_2>
			if (<allowed> = FALSE)
				priority_5_r = 0.0
			endif
		endif
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_5_2>
		if (<allowed> = FALSE)
			priority_5_r = 0.0
		endif
	endif
	if (<pieces_value_4_2> >= <pieces_value_1_1>)
		if (<pieces_value_4_2> >= <pieces_value_2_1>)
			if (<pieces_value_4_2> >= <pieces_value_3_1>)
				priority_4_r = <priority_4_r>
			else
				check_crossover_r val_1 = <pieces_value_3_1> val_2 = <pieces_value_4_2>
				if (<allowed> = FALSE)
					priority_4_r = 0.0
				endif
			endif
		else
			check_crossover_r val_1 = <pieces_value_2_1> val_2 = <pieces_value_4_2>
			if (<allowed> = FALSE)
				priority_4_r = 0.0
			endif
		endif
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_4_2>
		if (<allowed> = FALSE)
			priority_4_r = 0.0
		endif
	endif
	if (<pieces_value_3_2> >= <pieces_value_1_1>)
		if (<pieces_value_3_2> >= <pieces_value_2_1>)
			priority_3_r = <priority_3_r>
		else
			check_crossover_r val_1 = <pieces_value_2_1> val_2 = <pieces_value_3_2>
			if (<allowed> = FALSE)
				priority_3_r = 0.0
			endif
		endif
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_3_2>
		if (<allowed> = FALSE)
			priority_3_r = 0.0
		endif
	endif
	if (<pieces_value_2_2> >= <pieces_value_1_1>)
		priority_2_r = <priority_2_r>
	else
		check_crossover_r val_1 = <pieces_value_1_1> val_2 = <pieces_value_2_2>
		if (<allowed> = FALSE)
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

script extract_target_info 
	switch <target>
		case 1
		distance = 1
		value = <pieces_value_1>
		Priority = <p1>
		case 2
		distance = 2
		value = <pieces_value_2>
		Priority = <p2>
		case 3
		distance = 3
		value = <pieces_value_3>
		Priority = <p3>
		case 4
		distance = 4
		value = <pieces_value_4>
		Priority = <p4>
		case 5
		distance = 5
		value = <pieces_value_5>
		Priority = <p5>
		case 6
		distance = 6
		value = <pieces_value_6>
		Priority = <p6>
		default
	endswitch
	return distance = <distance> value = <value> Priority = <Priority>
	target = 0
	pieces_value_1 = 0
	p1 = 0.0
	pieces_value_2 = 0
	p2 = 0.0
	pieces_value_3 = 0
	p3 = 0.0
	pieces_value_4 = 0
	p4 = 0.0
	pieces_value_5 = 0
	p5 = 0.0
	pieces_value_6 = 0
	p6 = 0.0
	value = 0
	Priority = 0.0
endscript
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

script intialize_notehit_data \{start_note = 74
		end_note = 83}
	get_song_prefix song = <current_song>
	extendcrcwithstring checksum = `` string = <song_prefix>
	arrayprefix = <extendedchecksum>
	extendcrcwithstring checksum = <arrayprefix> string = '_drums_notes'
	event_array = <extendedchecksum>
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	array_Size = 0
	fastgetarraysize array = $<event_array>
	note_array_size = <array_Size>
	if (<note_array_size> = 0)
		return
	endif
	first_time = 0
	array_entry = 0
	<next_array_entry> = <array_entry>
	hit_info = []
	index = 0
	length = 0
	note = 0
	velocity = 0
	begin
	piece_array = []
	piece_array2 = []
	piece_velocities = []
	num_pieces_hit = 0
	current_time = ($<event_array> [<next_array_entry>])
	begin
	decompressnotevalue note_value = ($<event_array> [(<next_array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		switch (<note>)
			case 73
			Name = kick
			value = 0
			case 74
			Name = t3
			value = 7
			case 75
			Name = t2
			value = 5
			case 76
			Name = t1
			value = 4
			case 77
			Name = s1
			value = 1
			case 78
			Name = h1c
			value = 2
			case 79
			Name = h1o
			value = 2
			case 80
			Name = c3
			value = 8
			case 81
			Name = c1
			value = 3
			case 82
			Name = c2
			value = 6
			case 83
			Name = countin
			value = 0
		endswitch
		addchecksumarrayelement array = <piece_array> element = <Name>
		piece_array = <array>
		addintegerarrayelement2 array = <piece_array2> element = <value>
		piece_array2 = <array>
		addintegerarrayelement2 array = <piece_velocities> element = <velocity>
		piece_velocities = <array>
		num_pieces_hit = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		return hit_info = <hit_info>
	endif
	next_note_time = ($<event_array> [<next_array_entry>])
	if (<next_note_time> != <current_time>)
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		time_to_next_note = (<current_time> - <first_time>)
		first_time = <current_time>
		new_entry = {
			time = <current_time>
			time_to_hit = <time_to_next_note>
			num_pieces_hit = <num_pieces_hit>
			pieces_hit = <piece_array>
			pieces_value = <piece_array2>
			pieces_velocity = <piece_velocities>
		}
		addstructurearrayelement array = <hit_info> element = <new_entry>
		hit_info = <array>
		Change last_drumnote_time = <current_time>
		SetArrayElement ArrayName = drumnote_times globalarray index = <index> NewValue = <current_time>
		<index> = (<index> + 1)
		if (<index> > 4)
			break
		endif
	endif
	repeat
	printstruct <...>
	Change next_drumnote_entry = <next_array_entry>
	return hit_info = <hit_info>
	current_song = None
	song_prefix = 'none'
	next_note_time = 0
	current_time = 0
	time_to_next_note = 0
endscript

script prep_notehit_data \{hit_info = [
		]}
	array_Size = 0
	fastgetarraysize array = <hit_info>
	if (<array_Size> > 0)
		time_to_hit_2 = (<hit_info> [0].time_to_hit)
		num_pieces_hit_2 = (<hit_info> [0].num_pieces_hit)
		pieces_value_2_1 = (<hit_info> [0].pieces_value [0])
		hit_velocity_2_1 = (<hit_info> [0].pieces_velocity [0])
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
		hit_velocity_2_1 = 100
		hit_velocity_2_2 = 100
	endif
	if (<array_Size> > 1)
		time_to_hit_3 = (<hit_info> [1].time_to_hit)
		num_pieces_hit_3 = (<hit_info> [1].num_pieces_hit)
		pieces_value_3_1 = (<hit_info> [1].pieces_value [0])
		hit_velocity_3_1 = (<hit_info> [1].pieces_velocity [0])
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
		hit_velocity_3_1 = 100
		hit_velocity_3_2 = 100
	endif
	if (<array_Size> > 2)
		time_to_hit_4 = (<hit_info> [2].time_to_hit)
		num_pieces_hit_4 = (<hit_info> [2].num_pieces_hit)
		pieces_value_4_1 = (<hit_info> [2].pieces_value [0])
		hit_velocity_4_1 = (<hit_info> [2].pieces_velocity [0])
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
		hit_velocity_4_1 = 100
		hit_velocity_4_2 = 100
	endif
	if (<array_Size> > 3)
		time_to_hit_5 = (<hit_info> [3].time_to_hit)
		num_pieces_hit_5 = (<hit_info> [3].num_pieces_hit)
		pieces_value_5_1 = (<hit_info> [3].pieces_value [0])
		hit_velocity_5_1 = (<hit_info> [3].pieces_velocity [0])
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
		hit_velocity_5_1 = 100
		hit_velocity_5_2 = 100
	endif
	if (<array_Size> > 4)
		time_to_hit_6 = (<hit_info> [4].time_to_hit)
		num_pieces_hit_6 = (<hit_info> [4].num_pieces_hit)
		pieces_value_6_1 = (<hit_info> [4].pieces_value [0])
		hit_velocity_6_1 = (<hit_info> [4].pieces_velocity [0])
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
		hit_velocity_6_1 = 100
		hit_velocity_6_2 = 100
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
	SetArrayElement ArrayName = drumnote_times globalarray index = 5 NewValue = <old_time>
	old_time = ($drumnote_times [3])
	SetArrayElement ArrayName = drumnote_times globalarray index = 4 NewValue = <old_time>
	old_time = ($drumnote_times [2])
	SetArrayElement ArrayName = drumnote_times globalarray index = 3 NewValue = <old_time>
	old_time = ($drumnote_times [1])
	SetArrayElement ArrayName = drumnote_times globalarray index = 2 NewValue = <old_time>
	old_time = ($drumnote_times [0])
	SetArrayElement ArrayName = drumnote_times globalarray index = 1 NewValue = <old_time>
	SetArrayElement \{ArrayName = drumnote_times
		globalarray
		index = 0
		NewValue = 0}
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
endscript

script update_notehit_data \{start_note = 74
		end_note = 83}
	get_song_prefix song = <current_song>
	extendcrcwithstring checksum = `` string = <song_prefix>
	arrayprefix = <extendedchecksum>
	extendcrcwithstring checksum = <arrayprefix> string = '_drums_notes'
	event_array = <extendedchecksum>
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	array_Size = 0
	fastgetarraysize array = $<event_array>
	note_array_size = <array_Size>
	next_array_entry = $next_drumnote_entry
	if (<next_array_entry> >= <array_Size>)
		return \{time_to_hit_6 = 1000000.0
			num_pieces_hit = 2
			pieces_value_6_1 = 1
			pieces_value_6_2 = 7
			hit_velocity_6_1 = 100
			hit_velocity_6_2 = 100}
	endif
	length = 0
	note = 0
	velocity = 0
	begin
	piece_array = []
	piece_array2 = []
	piece_velocities = []
	num_pieces_hit = 0
	current_time = ($<event_array> [<next_array_entry>])
	begin
	decompressnotevalue note_value = ($<event_array> [(<next_array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		switch (<note>)
			case 73
			Name = kick
			value = 0
			case 74
			Name = t3
			value = 7
			case 75
			Name = t2
			value = 5
			case 76
			Name = t1
			value = 4
			case 77
			Name = s1
			value = 1
			case 78
			Name = h1c
			value = 2
			case 79
			Name = h1o
			value = 2
			case 80
			Name = c3
			value = 8
			case 81
			Name = c1
			value = 3
			case 82
			Name = c2
			value = 6
			case 83
			Name = countin
			value = 0
		endswitch
		addintegerarrayelement2 array = <piece_array2> element = <value>
		piece_array2 = <array>
		addintegerarrayelement2 array = <piece_velocities> element = <velocity>
		piece_velocities = <array>
		num_pieces_hit = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		if (<num_pieces_hit> = 0)
			return \{time_to_hit_6 = 1000000.0
				num_pieces_hit_6 = 2
				pieces_value_6_1 = 1
				pieces_value_6_2 = 7
				hit_velocity_6_1 = 100
				hit_velocity_6_2 = 100}
		endif
		break
	endif
	next_note_time = ($<event_array> [<next_array_entry>])
	if (<next_note_time> != <current_time>)
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		time_to_next_note = (<current_time> - $last_drumnote_time)
		first_time = <current_time>
		time_to_hit_6 = <time_to_next_note>
		num_pieces_hit_6 = <num_pieces_hit>
		if (<num_pieces_hit> = 1)
			pieces_value_6_1 = (<piece_array2> [0])
			pieces_value_6_2 = <pieces_value_6_1>
			hit_velocity_6_1 = (<piece_velocities> [0])
			hit_velocity_6_2 = <hit_velocity_6_1>
		else
			piece1 = (<piece_array2> [0])
			piece2 = (<piece_array2> [1])
			velocity1 = (<piece_velocities> [0])
			velocity2 = (<piece_velocities> [1])
			if (<piece2> > <piece1>)
				pieces_value_6_1 = <piece1>
				pieces_value_6_2 = <piece2>
				hit_velocity_6_1 = <velocity1>
				hit_velocity_6_2 = <velocity2>
			else
				pieces_value_6_1 = <piece2>
				pieces_value_6_2 = <piece1>
				hit_velocity_6_1 = <velocity2>
				hit_velocity_6_2 = <velocity1>
			endif
		endif
		Change last_drumnote_time = <current_time>
		Change next_drumnote_entry = <next_array_entry>
		SetArrayElement ArrayName = drumnote_times globalarray index = 5 NewValue = <current_time>
		break
	endif
	repeat
	return {
		time_to_hit_6 = <time_to_hit_6>
		num_pieces_hit_6 = <num_pieces_hit_6>
		pieces_value_6_1 = <pieces_value_6_1>
		pieces_value_6_2 = <pieces_value_6_2>
		hit_velocity_6_1 = <hit_velocity_6_1>
		hit_velocity_6_2 = <hit_velocity_6_2>
	}
	current_song = None
	song_prefix = 'none'
	next_note_time = 0
	current_time = 0
	time_to_next_note = 0
	pieces_value_6_1 = 0
	hit_velocity_6_1 = 0
	piece2 = 0
	piece1 = 0
	velocity1 = 0
	velocity2 = 0
	time_to_hit_6 = 0
	pieces_value_6_2 = 0
	hit_velocity_6_2 = 0
	first_time = 0
endscript
next_drumnote_leftfoot_entry = 0
last_drumnote_leftfoot_time = 0

script update_notehit_data_left_foot \{start_note = 78
		end_note = 79}
	get_song_prefix song = <current_song>
	extendcrcwithstring checksum = `` string = <song_prefix>
	arrayprefix = <extendedchecksum>
	extendcrcwithstring checksum = <arrayprefix> string = '_drums_notes'
	event_array = <extendedchecksum>
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	next_array_entry = $next_drumnote_leftfoot_entry
	array_Size = 0
	fastgetarraysize array = $<event_array>
	note_array_size = <array_Size>
	if (<next_array_entry> >= <array_Size>)
		return \{time_to_hit_foot_l = 1000000.0
			pieces_hit_foot_l = h1c
			num_pieces_hit_foot_l = 1}
	endif
	length = 0
	note = 0
	velocity = 0
	begin
	num_pieces_hit = 0
	current_time = ($<event_array> [<next_array_entry>])
	begin
	decompressnotevalue note_value = ($<event_array> [(<next_array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		if (<note> = 78)
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
	next_note_time = ($<event_array> [<next_array_entry>])
	if (<next_note_time> != <current_time>)
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		time = 0.0
		GetSongTimeMs time_offset = ($drummer_offset * 1000.0)
		time_to_hit_foot_l = (<current_time> - <time>)
		Change last_drumnote_leftfoot_time = <current_time>
		Change next_drumnote_leftfoot_entry = <next_array_entry>
		break
	endif
	repeat
	return {
		time_to_hit_foot_l = <time_to_hit_foot_l>
		pieces_hit_foot_l = <pieces_hit_foot_l>
		num_pieces_hit_foot_l = 1
	}
	current_song = None
	song_prefix = 'none'
	next_note_time = 0
	current_time = 0
	time_to_hit_foot_l = 0.0
endscript
next_drumnote_rightfoot_entry = 0
last_drumnote_rightfoot_time = 0

script update_notehit_data_right_foot \{start_note = 73
		end_note = 73}
	get_song_prefix song = <current_song>
	extendcrcwithstring checksum = `` string = <song_prefix>
	arrayprefix = <extendedchecksum>
	extendcrcwithstring checksum = <arrayprefix> string = '_drums_notes'
	event_array = <extendedchecksum>
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	next_array_entry = $next_drumnote_rightfoot_entry
	array_Size = 0
	fastgetarraysize array = $<event_array>
	note_array_size = <array_Size>
	if (<next_array_entry> >= <array_Size>)
		return \{time_to_hit_foot_r = 1000000.0
			num_pieces_hit_foot_r = 1}
	endif
	length = 0
	note = 0
	velocity = 0
	begin
	num_pieces_hit = 0
	current_time = ($<event_array> [<next_array_entry>])
	begin
	decompressnotevalue note_value = ($<event_array> [(<next_array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		num_pieces_hit = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		return \{time_to_hit_foot_r = 1000000.0
			num_pieces_hit_foot_r = 1}
	endif
	next_note_time = ($<event_array> [<next_array_entry>])
	if (<next_note_time> != <current_time>)
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		time = 0.0
		GetSongTimeMs time_offset = ($drummer_offset * 1000.0)
		time_to_hit_foot_r = (<current_time> - <time>)
		Change last_drumnote_rightfoot_time = <current_time>
		Change next_drumnote_rightfoot_entry = <next_array_entry>
		break
	endif
	repeat
	return {
		time_to_hit_foot_r = <time_to_hit_foot_r>
		num_pieces_hit_foot_r = 1
	}
	current_song = None
	song_prefix = 'none'
	next_note_time = 0
	current_time = 0
	time_to_hit_foot_r = 0.0
endscript
