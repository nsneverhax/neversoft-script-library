drumtest = 1

script drummer_kill_spawnscripts 
	KillSpawnedScript \{Name = drumdroid_timers}
	KillSpawnedScript \{Name = hide_non_drummers}
	KillSpawnedScript \{Name = hit_drumkit_piece}
	KillSpawnedScript \{Name = default_kit_anims}
	KillSpawnedScript \{Name = default_drummer_state}
	KillSpawnedScript \{Name = drummer_controlscript}
	KillSpawnedScript \{Name = drummer_transit}
	KillSpawnedScript \{Name = drummer_transit_loops}
	KillSpawnedScript \{Name = drummer_transit_idles}
	KillSpawnedScript \{Name = create_trans_diff}
	KillSpawnedScript \{Name = drummer_current_tempo}
	KillSpawnedScript \{Name = set_drummer_active_values}
	KillSpawnedScript \{Name = drummer_offset_anims}
endscript

script drummer_reset_globals 
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
endscript

script check_new_note_for_pattern \{new_note_1 = 0
		new_note_2 = 0
		drum_pattern_value_l = 0
		drum_pattern_value_r = 0
		num_pieces = 0}
	if ((<new_note_1> = <drum_pattern_value_l>) || (<new_note_1> = <drum_pattern_value_r>))
		if (<num_pieces> = 1)
			continue_pattern = true
		else
			if ((<new_note_2> = <drum_pattern_value_l>) || (<new_note_2> = <drum_pattern_value_r>))
				continue_pattern = true
			else
				continue_pattern = FALSE
			endif
		endif
	else
		continue_pattern = FALSE
	endif
	return continue_pattern = <continue_pattern>
endscript

script compare_values \{note1_1 = 0
		note2_1 = 0
		note2_2 = 0}
	sum_l = (<note1_1> - <note2_1>)
	sum_r = (<note1_1> - <note2_2>)
	if (<sum_l> < 0)
		sum_l = (<sum_l> * (0 -1))
	endif
	if (<sum_r> < 0)
		sum_r = (<sum_r> * (0 -1))
	endif
	if (<sum_l> < <sum_r>)
		closer_note = l
	elseif (<sum_l> > <sum_r>)
		closer_note = r
	elseif (<sum_l> = <sum_r>)
		closer_note = neither
	endif
	return closer_note = <closer_note>
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

script create_target_state \{drum_target_value_l = 0
		drum_target_value_r = 0}
	switch (<drum_target_value_l>)
		case 0
		state = 'S1T3'
		hit_r = 'S1T3'
		hit_l = 'S1T3'
		case 1
		hit_l = 'S1T3'
		switch (<drum_target_value_r>)
			case 1
			state = 'S1S1'
			hit_r = 'S1S1'
			case 2
			state = 'S1H1'
			hit_r = 'S1H1'
			hit_l = 'S1H1'
			case 3
			state = 'S1C1'
			hit_r = 'S1C1'
			case 4
			state = 'S1T1'
			hit_r = 'S1T1'
			case 5
			state = 'S1T2'
			hit_r = 'S1T2'
			case 6
			state = 'S1C2'
			hit_r = 'S1C2'
			case 7
			state = 'S1T3'
			hit_r = 'S1T3'
			case 8
			state = 'S1C3'
			hit_r = 'S1C3'
			default
			hit_l = 'S1T3'
			hit_r = 'S1T3'
			state = 'S1T3'
		endswitch
		case 2
		hit_l = 'H1T3'
		switch (<drum_target_value_r>)
			case 2
			state = 'H1H1'
			hit_r = 'S1H1'
			case 3
			state = 'H1C1'
			hit_r = 'S1C1'
			case 4
			state = 'H1T1'
			hit_r = 'S1T1'
			case 5
			state = 'H1T2'
			hit_r = 'S1T2'
			case 6
			state = 'H1C2'
			hit_r = 'S1C2'
			case 7
			state = 'H1T3'
			hit_r = 'S1T3'
			case 8
			state = 'H1C3'
			hit_r = 'S1C3'
			default
			hit_l = 'S1T3'
			hit_r = 'S1T3'
			state = 'S1T3'
		endswitch
		case 3
		hit_l = 'C1T3'
		switch (<drum_target_value_r>)
			case 3
			state = 'C1C1'
			hit_r = 'S1C1'
			case 4
			state = 'C1T1'
			hit_r = 'S1T1'
			case 5
			state = 'C1T2'
			hit_r = 'S1T2'
			case 6
			state = 'C1C2'
			hit_r = 'S1C2'
			case 7
			state = 'C1T3'
			hit_r = 'S1T3'
			case 8
			state = 'C1C3'
			hit_r = 'S1C3'
			default
			hit_l = 'S1T3'
			hit_r = 'S1T3'
			state = 'S1T3'
		endswitch
		case 4
		hit_l = 'T1T3'
		switch (<drum_target_value_r>)
			case 4
			state = 'T1T1'
			hit_r = 'S1T1'
			case 5
			state = 'T1T2'
			hit_r = 'S1T2'
			case 6
			state = 'T1C2'
			hit_r = 'S1C2'
			case 7
			state = 'T1T3'
			hit_r = 'S1T3'
			case 8
			state = 'T1C3'
			hit_r = 'S1C3'
			default
			hit_l = 'S1T3'
			hit_r = 'S1T3'
			state = 'S1T3'
		endswitch
		case 5
		hit_l = 'T2T3'
		switch (<drum_target_value_r>)
			case 5
			state = 'T2T2'
			hit_r = 'S1T2'
			case 6
			state = 'T2C2'
			hit_r = 'S1C2'
			case 7
			state = 'T2T3'
			hit_r = 'S1T3'
			case 8
			state = 'T2C3'
			hit_r = 'S1C3'
			default
			hit_l = 'S1T3'
			hit_r = 'S1T3'
			state = 'S1T3'
		endswitch
		case 6
		hit_l = 'C2T3'
		switch (<drum_target_value_r>)
			case 6
			state = 'C2C2'
			hit_r = 'S1C2'
			case 7
			state = 'C2T3'
			hit_r = 'S1T3'
			case 8
			state = 'C2C3'
			hit_r = 'S1C3'
			default
			hit_l = 'S1T3'
			hit_r = 'S1T3'
			state = 'S1T3'
		endswitch
		case 7
		hit_l = 'T3T3'
		switch (<drum_target_value_r>)
			case 7
			state = 'T3T3'
			hit_r = 'S1T3'
			case 8
			state = 'T3C3'
			hit_r = 'S1C3'
			default
			hit_l = 'S1T3'
			hit_r = 'S1T3'
			state = 'S1T3'
		endswitch
		case 8
		hit_l = 'C3C3'
		switch (<drum_target_value_r>)
			case 8
			state = 'C3C3'
			hit_r = 'S1C3'
			default
			hit_l = 'S1T3'
			hit_r = 'S1T3'
			state = 'S1T3'
		endswitch
		default
		hit_l = 'S1T3'
		hit_r = 'S1T3'
		state = 'S1T3'
	endswitch
	return drum_target_state_string = <state> drum_target_hit_string_l = <hit_l> drum_target_hit_string_r = <hit_r>
endscript

script search_pattern_note_1 \{pieces_value_1_1 = 0
		pieces_value_1_2 = 0
		pieces_value_2_1 = 0
		pieces_value_2_2 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		num_pieces_hit_1 = 0
		num_pieces_hit_2 = 0
		num_pieces_hit_3 = 0
		num_pieces_hit_4 = 0
		num_pieces_hit_5 = 0
		num_pieces_hit_6 = 0}
	notea = <pieces_value_1_1>
	noteb = 0
	start = 1
	if (<num_pieces_hit_1> = 2)
		noteb = <pieces_value_1_2>
		if (<num_pieces_hit_2> = 2)
			if (<notea> = <pieces_value_2_1>)
				if (<noteb> = <pieces_value_2_2>)
					keep_searching_from_2 <...>
				else
					drum_pattern_exists = FALSE
				endif
			else
				drum_pattern_exists = FALSE
			endif
		else
			if (<notea> = <pieces_value_2_1>)
				keep_searching_from_2 <...>
			else
				if (<noteb> = <pieces_value_2_1>)
					keep_searching_from_2 <...>
				else
					drum_pattern_exists = FALSE
				endif
			endif
		endif
	else
		if (<num_pieces_hit_2> = 2)
			if (<notea> = <pieces_value_2_1>)
				noteb = <pieces_value_2_2>
				keep_searching_from_2 <...>
			else
				if (<notea> = <pieces_value_2_2>)
					noteb = <notea>
					notea = <pieces_value_2_1>
					keep_searching_from_2 <...>
				else
					drum_pattern_exists = FALSE
				endif
			endif
		else
			if (<notea> = <pieces_value_2_1>)
				keep_searching_from_2 <...>
			else
				if (<notea> < <pieces_value_2_1>)
					noteb = <pieces_value_2_1>
					keep_searching_from_2 <...>
				else
					noteb = <notea>
					notea = <pieces_value_2_1>
					keep_searching_from_2 <...>
				endif
			endif
		endif
	endif
	if (<drum_pattern_exists> = FALSE)
		notea = <pieces_value_2_1>
		noteb = 0
		start = 2
		if (<num_pieces_hit_2> = 2)
			noteb = <pieces_value_2_2>
			keep_searching_from_2 <...>
		else
			keep_searching_from_2 <...>
		endif
	endif
	if (<drum_pattern_exists> = FALSE)
		notea = <pieces_value_3_1>
		noteb = 0
		start = 3
		if (<num_pieces_hit_3> = 2)
			noteb = <pieces_value_3_2>
			keep_searching_from_3 <...>
		else
			keep_searching_from_3 <...>
		endif
	endif
	if (<drum_pattern_exists> = FALSE)
		start = 0
		drum_pattern_end = 0
	else
		if ((<drum_pattern_end> - (<start> - 1)) < 4)
			drum_pattern_exists = FALSE
			start = 0
			drum_pattern_end = 0
		endif
	endif
	return drum_pattern_value_r = <noteb> drum_pattern_value_l = <notea> drum_pattern_start = <start> drum_pattern_end = <drum_pattern_end> drum_pattern_exists = <drum_pattern_exists>
endscript

script keep_searching_from_2 \{start = 0
		drum_pattern_end = 0
		notea = 0
		noteb = 0
		pieces_value_1_1 = 0
		pieces_value_1_2 = 0
		pieces_value_2_1 = 0
		pieces_value_2_2 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		num_pieces_hit_1 = 0
		num_pieces_hit_2 = 0
		num_pieces_hit_3 = 0
		num_pieces_hit_4 = 0
		num_pieces_hit_5 = 0
		num_pieces_hit_6 = 0}
	if (<noteb> = 0)
		if (<num_pieces_hit_3> = 2)
			if (<notea> = <pieces_value_3_1>)
				noteb = <pieces_value_3_2>
				keep_searching_from_3 <...>
			else
				if (<notea> = <pieces_value_3_2>)
					noteb = <notea>
					notea = <pieces_value_3_1>
					keep_searching_from_3 <...>
				else
					drum_pattern_exists = FALSE
				endif
			endif
		else
			if (<notea> = <pieces_value_3_1>)
				keep_searching_from_3 <...>
			else
				if (<notea> < <pieces_value_3_1>)
					noteb = <pieces_value_3_1>
					keep_searching_from_3 <...>
				else
					noteb = <notea>
					notea = <pieces_value_3_1>
					keep_searching_from_3 <...>
				endif
			endif
		endif
	else
		if (<num_pieces_hit_3> = 2)
			if (<notea> = <pieces_value_3_1>)
				if (<noteb> = <pieces_value_3_2>)
					keep_searching_from_3 <...>
				else
					drum_pattern_exists = FALSE
				endif
			else
				drum_pattern_exists = FALSE
			endif
		else
			if (<notea> = <pieces_value_3_1>)
				keep_searching_from_3 <...>
			else
				if (<noteb> = <pieces_value_3_1>)
					keep_searching_from_3 <...>
				else
					drum_pattern_exists = FALSE
				endif
			endif
		endif
	endif
	return noteb = <noteb> notea = <notea> start = <start> drum_pattern_end = <drum_pattern_end> drum_pattern_exists = <drum_pattern_exists>
endscript

script keep_searching_from_3 \{start = 0
		drum_pattern_end = 0
		notea = 0
		noteb = 0
		pieces_value_1_1 = 0
		pieces_value_1_2 = 0
		pieces_value_2_1 = 0
		pieces_value_2_2 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		num_pieces_hit_1 = 0
		num_pieces_hit_2 = 0
		num_pieces_hit_3 = 0
		num_pieces_hit_4 = 0
		num_pieces_hit_5 = 0
		num_pieces_hit_6 = 0}
	if (<noteb> = 0)
		if (<num_pieces_hit_4> = 2)
			if (<notea> = <pieces_value_4_1>)
				noteb = <pieces_value_4_2>
				keep_searching_from_4 <...>
			else
				if (<notea> = <pieces_value_4_2>)
					noteb = <notea>
					notea = <pieces_value_4_1>
					keep_searching_from_4 <...>
				else
					drum_pattern_exists = FALSE
				endif
			endif
		else
			if (<notea> = <pieces_value_4_1>)
				keep_searching_from_4 <...>
			else
				if (<notea> < <pieces_value_4_1>)
					noteb = <pieces_value_4_1>
					keep_searching_from_4 <...>
				else
					noteb = <notea>
					notea = <pieces_value_4_1>
					keep_searching_from_4 <...>
				endif
			endif
		endif
	else
		if (<num_pieces_hit_4> = 2)
			if (<notea> = <pieces_value_4_1>)
				if (<noteb> = <pieces_value_4_2>)
					keep_searching_from_4 <...>
				else
					drum_pattern_exists = FALSE
				endif
			else
				drum_pattern_exists = FALSE
			endif
		else
			if (<notea> = <pieces_value_4_1>)
				keep_searching_from_4 <...>
			else
				if (<noteb> = <pieces_value_4_1>)
					keep_searching_from_4 <...>
				else
					drum_pattern_exists = FALSE
				endif
			endif
		endif
	endif
	return noteb = <noteb> notea = <notea> start = <start> drum_pattern_end = <drum_pattern_end> drum_pattern_exists = <drum_pattern_exists>
endscript

script keep_searching_from_4 \{start = 0
		drum_pattern_end = 0
		notea = 0
		noteb = 0
		pieces_value_1_1 = 0
		pieces_value_1_2 = 0
		pieces_value_2_1 = 0
		pieces_value_2_2 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		num_pieces_hit_1 = 0
		num_pieces_hit_2 = 0
		num_pieces_hit_3 = 0
		num_pieces_hit_4 = 0
		num_pieces_hit_5 = 0
		num_pieces_hit_6 = 0}
	if (<noteb> = 0)
		if (<num_pieces_hit_5> = 2)
			if (<notea> = <pieces_value_5_1>)
				noteb = <pieces_value_5_2>
				keep_searching_from_5 <...>
			else
				if (<notea> = <pieces_value_5_2>)
					noteb = <notea>
					notea = <pieces_value_5_1>
					keep_searching_from_5 <...>
				else
					noteb = <notea>
					drum_pattern_end = 4
					drum_pattern_exists = true
				endif
			endif
		else
			if (<notea> = <pieces_value_5_1>)
				keep_searching_from_5 <...>
			else
				if (<notea> < <pieces_value_5_1>)
					noteb = <pieces_value_5_1>
					keep_searching_from_5 <...>
				else
					noteb = <notea>
					notea = <pieces_value_5_1>
					keep_searching_from_5 <...>
				endif
			endif
		endif
	else
		if (<num_pieces_hit_5> = 2)
			if (<notea> = <pieces_value_5_1>)
				if (<noteb> = <pieces_value_5_2>)
					keep_searching_from_5 <...>
				else
					drum_pattern_end = 4
					drum_pattern_exists = true
				endif
			else
				drum_pattern_end = 4
				drum_pattern_exists = true
			endif
		else
			if (<notea> = <pieces_value_5_1>)
				keep_searching_from_5 <...>
			else
				if (<noteb> = <pieces_value_5_1>)
					keep_searching_from_5 <...>
				else
					drum_pattern_end = 4
					drum_pattern_exists = true
				endif
			endif
		endif
	endif
	return noteb = <noteb> notea = <notea> start = <start> drum_pattern_end = <drum_pattern_end> drum_pattern_exists = <drum_pattern_exists>
endscript

script keep_searching_from_5 \{start = 0
		drum_pattern_end = 0
		notea = 0
		noteb = 0
		pieces_value_1_1 = 0
		pieces_value_1_2 = 0
		pieces_value_2_1 = 0
		pieces_value_2_2 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		num_pieces_hit_1 = 0
		num_pieces_hit_2 = 0
		num_pieces_hit_3 = 0
		num_pieces_hit_4 = 0
		num_pieces_hit_5 = 0
		num_pieces_hit_6 = 0}
	if (<noteb> = 0)
		if (<num_pieces_hit_6> = 2)
			if (<notea> = <pieces_value_6_1>)
				noteb = <pieces_value_6_2>
				drum_pattern_end = 6
				drum_pattern_exists = true
			else
				if (<notea> = <pieces_value_6_2>)
					noteb = <notea>
					notea = <pieces_value_6_1>
					drum_pattern_end = 6
					drum_pattern_exists = true
				else
					noteb = <notea>
					drum_pattern_end = 5
					drum_pattern_exists = true
				endif
			endif
		else
			if (<notea> = <pieces_value_6_1>)
				noteb = <notea>
				drum_pattern_end = 6
				drum_pattern_exists = true
			else
				if (<notea> < <pieces_value_6_1>)
					noteb = <pieces_value_6_1>
					drum_pattern_end = 6
					drum_pattern_exists = true
				else
					noteb = <notea>
					notea = <pieces_value_6_1>
					drum_pattern_end = 6
					drum_pattern_exists = true
				endif
			endif
		endif
	else
		if (<num_pieces_hit_6> = 2)
			if (<notea> = <pieces_value_6_1>)
				if (<noteb> = <pieces_value_6_2>)
					drum_pattern_end = 6
					drum_pattern_exists = true
				else
					drum_pattern_end = 5
					drum_pattern_exists = true
				endif
			else
				drum_pattern_end = 5
				drum_pattern_exists = true
			endif
		else
			if (<notea> = <pieces_value_6_1>)
				drum_pattern_end = 6
				drum_pattern_exists = true
			else
				if (<noteb> = <pieces_value_6_1>)
					drum_pattern_end = 6
					drum_pattern_exists = true
				else
					drum_pattern_end = 5
					drum_pattern_exists = true
				endif
			endif
		endif
	endif
	return noteb = <noteb> notea = <notea> start = <start> drum_pattern_end = <drum_pattern_end> drum_pattern_exists = <drum_pattern_exists>
endscript

script find_first_note_in_queue \{pieces_value_1_1 = 0
		pieces_value_1_2 = 0
		pieces_value_2_1 = 0
		pieces_value_2_2 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		test_note = 0}
	if ((<pieces_value_1_1> = <test_note>) || (<pieces_value_1_2> = <test_note>))
		note_exists = 1
	elseif ((<pieces_value_2_1> = <test_note>) || (<pieces_value_2_2> = <test_note>))
		note_exists = 2
	elseif ((<pieces_value_3_1> = <test_note>) || (<pieces_value_3_2> = <test_note>))
		note_exists = 3
	elseif ((<pieces_value_4_1> = <test_note>) || (<pieces_value_4_2> = <test_note>))
		note_exists = 4
	elseif ((<pieces_value_5_1> = <test_note>) || (<pieces_value_5_2> = <test_note>))
		note_exists = 5
	elseif ((<pieces_value_6_1> = <test_note>) || (<pieces_value_6_2> = <test_note>))
		note_exists = 6
	else
		note_exists = 0
	endif
	return note_exists = <note_exists>
endscript

script find_first_note_in_pattern \{pieces_value_1_1 = 0
		pieces_value_1_2 = 0
		pieces_value_2_1 = 0
		pieces_value_2_2 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		drum_pattern_end = 0
		test_note = 0}
	if ((<pieces_value_1_1> = <test_note>) || (<pieces_value_1_2> = <test_note>))
		if (<drum_pattern_end> > 0)
			note_exists = 1
		else
			note_exists = 0
		endif
	elseif ((<pieces_value_2_1> = <test_note>) || (<pieces_value_2_2> = <test_note>))
		if (<drum_pattern_end> > 1)
			note_exists = 2
		else
			note_exists = 0
		endif
	elseif ((<pieces_value_3_1> = <test_note>) || (<pieces_value_3_2> = <test_note>))
		if (<drum_pattern_end> > 2)
			note_exists = 3
		else
			note_exists = 0
		endif
	elseif ((<pieces_value_4_1> = <test_note>) || (<pieces_value_4_2> = <test_note>))
		if (<drum_pattern_end> > 3)
			note_exists = 4
		else
			note_exists = 0
		endif
	elseif ((<pieces_value_5_1> = <test_note>) || (<pieces_value_5_2> = <test_note>))
		if (<drum_pattern_end> > 4)
			note_exists = 5
		else
			note_exists = 0
		endif
	elseif ((<pieces_value_6_1> = <test_note>) || (<pieces_value_6_2> = <test_note>))
		if (<drum_pattern_end> > 5)
			note_exists = 6
		else
			note_exists = 0
		endif
	else
		note_exists = 0
	endif
	return note_exists = <note_exists>
endscript

script assign_hand_from_pattern_l \{pieces_value_1_1 = 0
		pieces_value_2_1 = 0
		pieces_value_3_1 = 0
		pieces_value_4_1 = 0
		pieces_value_5_1 = 0
		pieces_value_6_1 = 0
		note_exists = 0}
	switch <note_exists>
		case 1
		drum_target_value_l = <pieces_value_1_1>
		drum_target_distance_l = 1
		case 2
		drum_target_value_l = <pieces_value_2_1>
		drum_target_distance_l = 2
		case 3
		drum_target_value_l = <pieces_value_3_1>
		drum_target_distance_l = 3
		case 4
		drum_target_value_l = <pieces_value_4_1>
		drum_target_distance_l = 4
		case 5
		drum_target_value_l = <pieces_value_5_1>
		drum_target_distance_l = 5
		case 6
		drum_target_value_l = <pieces_value_6_1>
		drum_target_distance_l = 6
		default
	endswitch
	return drum_target_value_l = <drum_target_value_l> drum_target_distance_l = <drum_target_distance_l>
endscript

script assign_hand_from_pattern_r \{num_pieces_hit_1 = 0
		num_pieces_hit_2 = 0
		num_pieces_hit_3 = 0
		num_pieces_hit_4 = 0
		num_pieces_hit_5 = 0
		num_pieces_hit_6 = 0
		pieces_value_1_1 = 0
		pieces_value_1_2 = 0
		pieces_value_2_1 = 0
		pieces_value_2_2 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		note_exists = 0}
	switch <note_exists>
		case 1
		if (<num_pieces_hit_1> = 2)
			drum_target_value_r = <pieces_value_1_2>
		else
			drum_target_value_r = <pieces_value_1_1>
		endif
		drum_target_distance_r = 1
		case 2
		if (<num_pieces_hit_2> = 2)
			drum_target_value_r = <pieces_value_2_2>
		else
			drum_target_value_r = <pieces_value_2_1>
		endif
		drum_target_distance_r = 2
		case 3
		if (<num_pieces_hit_3> = 2)
			drum_target_value_r = <pieces_value_3_2>
		else
			drum_target_value_r = <pieces_value_3_1>
		endif
		drum_target_distance_r = 3
		case 4
		if (<num_pieces_hit_4> = 2)
			drum_target_value_r = <pieces_value_4_2>
		else
			drum_target_value_r = <pieces_value_4_1>
		endif
		drum_target_distance_r = 4
		case 5
		if (<num_pieces_hit_5> = 2)
			drum_target_value_r = <pieces_value_5_2>
		else
			drum_target_value_r = <pieces_value_5_1>
		endif
		drum_target_distance_r = 5
		case 6
		if (<num_pieces_hit_6> = 2)
			drum_target_value_r = <pieces_value_6_2>
		else
			drum_target_value_r = <pieces_value_6_1>
		endif
		drum_target_distance_r = 6
		default
	endswitch
	return drum_target_distance_r = <drum_target_distance_r> drum_target_value_r = <drum_target_value_r>
endscript

script find_next_double_in_queue \{num_pieces_hit_1 = 0
		num_pieces_hit_2 = 0
		num_pieces_hit_3 = 0
		num_pieces_hit_4 = 0
		num_pieces_hit_5 = 0
		num_pieces_hit_6 = 0}
	if (<num_pieces_hit_1> = 2)
		next_double = 1
	elseif (<num_pieces_hit_2> = 2)
		next_double = 2
	elseif (<num_pieces_hit_3> = 2)
		next_double = 3
	elseif (<num_pieces_hit_4> = 2)
		next_double = 4
	elseif (<num_pieces_hit_5> = 2)
		next_double = 5
	elseif (<num_pieces_hit_6> = 2)
		next_double = 6
	else
		next_double = 0
	endif
	return next_double = <next_double>
endscript

script check_ascending_note_saftey \{pieces_value_2_1 = 0
		pieces_value_3_1 = 0
		pieces_value_4_1 = 0
		pieces_value_5_1 = 0
		pieces_value_6_1 = 0}
	if (<pieces_value_2_1> < <pieces_value_3_1>)
		if (<pieces_value_2_1> < <pieces_value_4_1>)
			if (<pieces_value_2_1> < <pieces_value_5_1>)
				if (<pieces_value_2_1> < <pieces_value_6_1>)
					note_ascend_2 = unsafe
				else
					note_ascend_2 = safe
				endif
			else
				note_ascend_2 = safe
			endif
		else
			note_ascend_2 = safe
		endif
	else
		note_ascend_2 = safe
	endif
	if (<pieces_value_3_1> < <pieces_value_4_1>)
		if (<pieces_value_3_1> < <pieces_value_5_1>)
			if (<pieces_value_3_1> < <pieces_value_6_1>)
				note_ascend_3 = unsafe
			else
				note_ascend_3 = safe
			endif
		else
			note_ascend_3 = safe
		endif
	else
		note_ascend_3 = safe
	endif
	if (<pieces_value_4_1> < <pieces_value_5_1>)
		if (<pieces_value_4_1> < <pieces_value_6_1>)
			note_ascend_4 = unsafe
		else
			note_ascend_4 = safe
		endif
	else
		note_ascend_4 = safe
	endif
	if (<pieces_value_5_1> < <pieces_value_6_1>)
		note_ascend_5 = unsafe
	else
		note_ascend_5 = safe
	endif
	return {
		note_ascend_2 = <note_ascend_2>
		note_ascend_3 = <note_ascend_3>
		note_ascend_4 = <note_ascend_4>
		note_ascend_5 = <note_ascend_5>
	}
endscript

script check_descending_note_saftey \{pieces_value_2_1 = 0
		pieces_value_3_1 = 0
		pieces_value_4_1 = 0
		pieces_value_5_1 = 0
		pieces_value_6_1 = 0}
	if (<pieces_value_2_1> > <pieces_value_3_1>)
		if (<pieces_value_2_1> > <pieces_value_4_1>)
			if (<pieces_value_2_1> > <pieces_value_5_1>)
				if (<pieces_value_2_1> > <pieces_value_6_1>)
					note_descend_2 = unsafe
				else
					note_descend_2 = safe
				endif
			else
				note_descend_2 = safe
			endif
		else
			note_descend_2 = safe
		endif
	else
		note_descend_2 = safe
	endif
	if (<pieces_value_3_1> > <pieces_value_4_1>)
		if (<pieces_value_3_1> > <pieces_value_5_1>)
			if (<pieces_value_3_1> > <pieces_value_6_1>)
				note_descend_3 = unsafe
			else
				note_descend_3 = safe
			endif
		else
			note_descend_3 = safe
		endif
	else
		note_descend_3 = safe
	endif
	if (<pieces_value_4_1> > <pieces_value_5_1>)
		if (<pieces_value_4_1> > <pieces_value_6_1>)
			note_descend_4 = unsafe
		else
			note_descend_4 = safe
		endif
	else
		note_descend_4 = safe
	endif
	if (<pieces_value_5_1> > <pieces_value_6_1>)
		note_descend_5 = unsafe
	else
		note_descend_5 = safe
	endif
	return {
		note_descend_2 = <note_descend_2>
		note_descend_3 = <note_descend_3>
		note_descend_4 = <note_descend_4>
		note_descend_5 = <note_descend_5>
	}
endscript

script check_final_note_volatility \{drum_pattern_exists = true
		drum_pattern_end = 0
		drum_pattern_value_l = 0
		drum_pattern_value_r = 0
		num_pieces_hit_1 = 0
		num_pieces_hit_2 = 0
		num_pieces_hit_3 = 0
		num_pieces_hit_4 = 0
		num_pieces_hit_5 = 0
		num_pieces_hit_6 = 0
		pieces_value_1_1 = 0
		pieces_value_2_1 = 0
		pieces_value_3_1 = 0
		pieces_value_4_1 = 0
		pieces_value_5_1 = 0
		pieces_value_6_1 = 0
		pieces_value_1_2 = 0
		pieces_value_2_2 = 0
		pieces_value_3_2 = 0
		pieces_value_4_2 = 0
		pieces_value_5_2 = 0
		pieces_value_6_2 = 0}
	if (<drum_pattern_end> = 5)
		if (<num_pieces_hit_5> = 1)
			if (<pieces_value_1_1> = <pieces_value_5_1>)
			elseif (<pieces_value_2_1> = <pieces_value_5_1>)
			elseif (<pieces_value_3_1> = <pieces_value_5_1>)
			elseif (<pieces_value_4_1> = <pieces_value_5_1>)
			else
				if (<pieces_value_5_1> = <drum_pattern_value_l>)
					if ((<pieces_value_5_1> > <pieces_value_6_1>) && (<pieces_value_5_1> > <pieces_value_6_2>))
						drum_pattern_exists = FALSE
						drum_pattern_start = 0
						drum_pattern_end = 0
					endif
				elseif (<pieces_value_5_1> = <drum_pattern_value_r>)
					if ((<pieces_value_5_1> < <pieces_value_6_1>) && (<pieces_value_5_1> < <pieces_value_6_2>))
						drum_pattern_exists = FALSE
						drum_pattern_start = 0
						drum_pattern_end = 0
					endif
				else
				endif
			endif
		endif
	elseif (<drum_pattern_end> = 4)
		if (<num_pieces_hit_4> = 1)
			if (<pieces_value_1_1> = <pieces_value_4_1>)
			elseif (<pieces_value_2_1> = <pieces_value_4_1>)
			elseif (<pieces_value_3_1> = <pieces_value_4_1>)
			else
				if (<pieces_value_4_1> = <drum_pattern_value_l>)
					if ((<pieces_value_4_1> > <pieces_value_5_1>) && (<pieces_value_4_1> > <pieces_value_5_2>))
						if ((<pieces_value_4_1> > <pieces_value_6_1>) && (<pieces_value_4_1> > <pieces_value_6_2>))
							drum_pattern_exists = FALSE
							drum_pattern_start = 0
							drum_pattern_end = 0
						endif
					endif
				elseif (<pieces_value_4_1> = <drum_pattern_value_r>)
					if ((<pieces_value_4_1> < <pieces_value_5_1>) && (<pieces_value_4_1> < <pieces_value_5_2>))
						if ((<pieces_value_4_1> < <pieces_value_6_1>) && (<pieces_value_4_1> < <pieces_value_6_2>))
							drum_pattern_exists = FALSE
							drum_pattern_start = 0
							drum_pattern_end = 0
						endif
					endif
				else
				endif
			endif
		endif
	elseif (<drum_pattern_end> = 3)
		if (<num_pieces_hit_3> = 1)
			if (<pieces_value_1_1> = <pieces_value_3_1>)
			elseif (<pieces_value_2_1> = <pieces_value_3_1>)
			else
				if (<pieces_value_3_1> = <drum_pattern_value_l>)
					if ((<pieces_value_3_1> > <pieces_value_4_1>) && (<pieces_value_3_1> > <pieces_value_4_2>))
						if ((<pieces_value_3_1> > <pieces_value_5_1>) && (<pieces_value_3_1> > <pieces_value_5_2>))
							if ((<pieces_value_3_1> > <pieces_value_6_1>) && (<pieces_value_3_1> > <pieces_value_6_2>))
								drum_pattern_exists = FALSE
								drum_pattern_start = 0
								drum_pattern_end = 0
							endif
						endif
					endif
				elseif (<pieces_value_3_1> = <drum_pattern_value_r>)
					if ((<pieces_value_3_1> < <pieces_value_4_1>) && (<pieces_value_3_1> < <pieces_value_4_2>))
						if ((<pieces_value_3_1> < <pieces_value_5_1>) && (<pieces_value_3_1> < <pieces_value_5_2>))
							if ((<pieces_value_3_1> < <pieces_value_6_1>) && (<pieces_value_3_1> < <pieces_value_6_2>))
								drum_pattern_exists = FALSE
								drum_pattern_start = 0
								drum_pattern_end = 0
							endif
						endif
					endif
				else
				endif
			endif
		endif
	elseif (<drum_pattern_end> = 2)
		if (<num_pieces_hit_2> = 1)
			if (<pieces_value_1_1> = <pieces_value_2_1>)
			else
				if (<pieces_value_2_1> = <drum_pattern_value_l>)
					if ((<pieces_value_2_1> > <pieces_value_3_1>) && (<pieces_value_2_1> > <pieces_value_3_2>))
						if ((<pieces_value_2_1> > <pieces_value_4_1>) && (<pieces_value_2_1> > <pieces_value_4_2>))
							if ((<pieces_value_2_1> > <pieces_value_5_1>) && (<pieces_value_2_1> > <pieces_value_5_2>))
								if ((<pieces_value_2_1> > <pieces_value_6_1>) && (<pieces_value_2_1> > <pieces_value_6_2>))
									drum_pattern_exists = FALSE
									drum_pattern_start = 0
									drum_pattern_end = 0
								endif
							endif
						endif
					endif
				elseif (<pieces_value_2_1> = <drum_pattern_value_r>)
					if ((<pieces_value_2_1> < <pieces_value_3_1>) && (<pieces_value_2_1> < <pieces_value_3_2>))
						if ((<pieces_value_2_1> < <pieces_value_4_1>) && (<pieces_value_2_1> < <pieces_value_4_2>))
							if ((<pieces_value_2_1> < <pieces_value_5_1>) && (<pieces_value_2_1> < <pieces_value_5_2>))
								if ((<pieces_value_2_1> < <pieces_value_6_1>) && (<pieces_value_2_1> < <pieces_value_6_2>))
									drum_pattern_exists = FALSE
									drum_pattern_start = 0
									drum_pattern_end = 0
								endif
							endif
						endif
					endif
				else
				endif
			endif
		endif
	endif
	return drum_pattern_exists = <drum_pattern_exists> drum_pattern_start = <drum_pattern_start> drum_pattern_end = <drum_pattern_end>
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

script intialize_notehit_data \{start_note = 73
		end_note = 83}
	get_song_prefix song = <current_song>
	formatText checksumName = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	array_Size = 0
	GetArraySize ($<event_array>)
	note_array_size = <array_Size>
	if (<note_array_size> = 0)
		return
	endif
	first_time = 0.0
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
		addintegerarrayelement array = <piece_array2> element = <value>
		piece_array2 = <array>
		addintegerarrayelement array = <piece_velocities> element = <velocity>
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
	Change next_drumnote_entry = <next_array_entry>
	return hit_info = <hit_info>
endscript

script prep_notehit_data \{hit_info = [
		]}
	array_Size = 0
	GetArraySize (<hit_info>)
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

script update_notehit_data 
	get_song_prefix song = <current_song>
	formatText checksumName = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	next_array_entry = $next_drumnote_entry
	length = 0
	note = 0
	velocity = 0
	piece_array2 = []
	piece_velocities = []
	num_pieces_hit = 0
	current_time = 0
	begin
	if findnoteinrange start_note = 74 end_note = 83 next_array_entry = <next_array_entry> array = <event_array>
		if ((<num_pieces_hit> = 0) || (<note_time> = <current_time>))
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
			addintegerarrayelement array = <piece_array2> element = <value>
			piece_array2 = <array>
			addintegerarrayelement array = <piece_velocities> element = <velocity>
			piece_velocities = <array>
			num_pieces_hit = (<num_pieces_hit> + 1)
			Change next_drumnote_entry = <next_array_entry>
			current_time = <note_time>
		else
			break
		endif
	else
		Change next_drumnote_entry = <next_array_entry>
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		time_to_next_note = (<current_time> - $last_drumnote_time)
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
		SetArrayElement ArrayName = drumnote_times globalarray index = 5 NewValue = <current_time>
	else
		time_to_hit_6 = 1000000.0
		num_pieces_hit_6 = 2
		pieces_value_6_1 = 1
		pieces_value_6_2 = 7
		hit_velocity_6_1 = 100
		hit_velocity_6_2 = 100
	endif
	return {
		time_to_hit_6 = <time_to_hit_6>
		num_pieces_hit_6 = <num_pieces_hit_6>
		pieces_value_6_1 = <pieces_value_6_1>
		pieces_value_6_2 = <pieces_value_6_2>
		hit_velocity_6_1 = <hit_velocity_6_1>
		hit_velocity_6_2 = <hit_velocity_6_2>
	}
endscript
next_drumnote_leftfoot_entry = 0
last_drumnote_leftfoot_time = 0

script update_notehit_data_left_foot 
	get_song_prefix song = <current_song>
	formatText checksumName = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	note = 0
	note_time = 0
	next_array_entry = ($next_drumnote_leftfoot_entry)
	begin
	if NOT findnoteinrange start_note = 78 end_note = 79 next_array_entry = <next_array_entry> array = <event_array>
		time_to_hit_foot_l = 1000000.0
		pieces_hit_foot_l = h1c
		break
	elseif (($last_drumnote_leftfoot_time) != <note_time>)
		if (<note> = 78)
			pieces_hit_foot_l = h1c
		else
			pieces_hit_foot_l = h1o
		endif
		time = 0.0
		GetSongTimeMs \{time_offset = 0.0}
		time_to_hit_foot_l = (<note_time> - <time>)
		Change last_drumnote_leftfoot_time = <note_time>
		break
	endif
	repeat
	Change next_drumnote_leftfoot_entry = <next_array_entry>
	return {
		time_to_hit_foot_l = <time_to_hit_foot_l>
		pieces_hit_foot_l = <pieces_hit_foot_l>
		num_pieces_hit_foot_l = 1
	}
endscript
next_drumnote_rightfoot_entry = 0
last_drumnote_rightfoot_time = 0

script update_notehit_data_right_foot 
	get_song_prefix song = <current_song>
	formatText checksumName = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	note = 0
	note_time = 0
	next_array_entry = ($next_drumnote_rightfoot_entry)
	if findnoteinrange start_note = 73 end_note = 73 next_array_entry = <next_array_entry> array = <event_array>
		time = 0.0
		GetSongTimeMs \{time_offset = 0.0}
		time_to_hit_foot_r = (<note_time> - <time>)
		Change last_drumnote_rightfoot_time = <note_time>
	else
		time_to_hit_foot_r = 1000000.0
	endif
	Change next_drumnote_rightfoot_entry = <next_array_entry>
	return {
		time_to_hit_foot_r = <time_to_hit_foot_r>
		num_pieces_hit_foot_r = 1
	}
endscript
