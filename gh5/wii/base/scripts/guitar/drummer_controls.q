drum_idlepoint_arm_shit = 0.4521
drum_idlepoint_arm_mhit = 0.125
drum_idlepoint_foot_hit = 0.391
drum_slowest_arm_hit = 2433.33
drum_medium_arm_hit = 533.33
drum_fastest_arm_hit = 166.66
longest_transit = 5000.0
number_drummers_created = 4

script drummer_controlscript 
	first_hit = true
	time_to_hit_1 = 0.0
	time_to_hit_2 = 0.0
	time_to_hit_3 = 0.0
	time_to_hit_4 = 0.0
	time_to_hit_5 = 0.0
	time_to_hit_6 = 0.0
	hit_velocity_1 = 0
	hit_velocity_2 = 0
	hit_velocity_3 = 0
	hit_velocity_4 = 0
	hit_velocity_5 = 0
	hit_velocity_6 = 0
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
	pieces_value_6_2 = 0
	note_ascend_2 = None
	note_ascend_3 = None
	note_ascend_4 = None
	note_ascend_5 = None
	note_descend_2 = None
	note_descend_3 = None
	note_descend_4 = None
	note_descend_5 = None
	drum_target_hit_string_l = ''
	drum_target_hit_string_r = ''
	drum_target_state_string = ''
	random_mod_foot_r = 0.0
	velocity = 72.0
	drum_slowest_arm_hit = $drum_slowest_arm_hit
	drum_medium_arm_hit = $drum_medium_arm_hit
	drum_fastest_arm_hit = $drum_fastest_arm_hit
	drum_idlepoint_arm_shit = ($drum_idlepoint_arm_shit)
	drum_idlepoint_arm_mhit = ($drum_idlepoint_arm_mhit)
	drum_apex_arm_shit = 0.9041
	drum_apex_arm_mhit = 0.68
	drum_idlepoint_arm_l = <drum_idlepoint_arm_shit>
	drum_idlepoint_arm_r = <drum_idlepoint_arm_shit>
	drum_apex_arm_l = <drum_apex_arm_shit>
	drum_apex_arm_r = <drum_apex_arm_shit>
	random_hit_mod_vary_foot = 0.08
	drum_slowest_foot_hit_r = 1533.3301
	drum_medium_foot_hit_r = 766.66
	drum_fastest_foot_hit_r = 200.0
	drum_idlepoint_foot_hit = ($drum_idlepoint_foot_hit)
	drum_slowest_foot_hit_l = 320.0
	drum_current_value_l = 1
	drum_current_value_r = 7
	drum_target_value_l = 1
	drum_target_value_r = 7
	allow_pattern_seek = true
	start_hit_r = FALSE
	start_hit_l = FALSE
	start_hit_foot_r = FALSE
	drum_target_distance_l = 0
	drum_target_distance_r = 0
	getnumframes_hand_r = 1.0
	timer_base_hand_r = <drum_idlepoint_arm_shit>
	old_timer_base_hand_r = <drum_idlepoint_arm_shit>
	timer_ms_hand_r = 1000000.0
	target_ms_hand_r = 1000000.0
	animstep_hand_r = 0.0
	newmod_hand_r = 0.7
	getnumframes_hand_l = 1.0
	timer_base_hand_l = <drum_idlepoint_arm_shit>
	old_timer_base_hand_l = <drum_idlepoint_arm_shit>
	timer_ms_hand_l = 1000000.0
	target_ms_hand_l = 1000000.0
	animstep_hand_l = 0.0
	newmod_hand_l = 0.7
	getnumframes_foot_r = 1.0
	timer_base_foot_r = <drum_idlepoint_foot_hit>
	old_timer_base_foot_r = <drum_idlepoint_foot_hit>
	timer_ms_foot_r = 1000000.0
	target_ms_foot_r = 1000000.0
	animstep_foot_r = 0.0
	newmod_foot_r = 1.0
	oldunmod_body = 1.0
	timer_base_foot_l = 1000000.0
	timer_ms_foot_l = 1000000.0
	drum_foot_index_l = close
	frame_length = 33.369
	old_frame_length = 33.369
	drum_anim_foot_l = 0.0
	drummer_idlepoint_arm_ms = ((<drum_slowest_arm_hit> * (1 - <drum_idlepoint_arm_shit>)) - <frame_length>)
	drummer_idlepoint_foot_ms = ((<drum_slowest_foot_hit_r> * (1 - <drum_idlepoint_foot_hit>)) - <frame_length>)
	drum_pattern_exists = FALSE
	drum_pattern_start = 0
	drum_pattern_end = 0
	drum_pattern_value_l = 1
	drum_pattern_value_r = 1
	time_to_hit_1 = -1.0
	time_to_hit_foot_l = -1.0
	time_to_hit_foot_r = -1.0
	drum_was_patterned = FALSE
	drum_hit = -1
	longest_transit = $longest_transit
	drummer_ids = []
	num_drummers = 0
	if NOT check_for_drummers
		return
	endif
	current_song = None
	gman_songtool_getcurrentsong
	song_prefix = ''
	get_song_prefix song = <current_song>
	formatText checksumName = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	fastgetarraysize array = $<event_array>
	if (<array_Size> = 0)
		return
	endif
	SpawnScriptNow \{drummer_current_tempo}
	intialize_notehit_data current_song = <current_song>
	prep_notehit_data <...>
	Change \{last_drumnote_rightfoot_time = 0}
	Change \{last_drumnote_leftfoot_time = 0}
	Change \{next_drumnote_leftfoot_entry = 0}
	Change \{next_drumnote_rightfoot_entry = 0}
	begin
	GetSongTimeMs \{time_offset = 0.0}
	if (<time> >= -2000.0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	flamfinder <...>
	begin
	if (<time_to_hit_foot_l> <= 0.0)
		update_notehit_data_left_foot current_song = <current_song>
		pieces_hit_foot_l = <pieces_hit_foot_l>
		time_to_hit_foot_l = <time_to_hit_foot_l>
		if (<pieces_hit_foot_l> = h1o)
			if (<drum_foot_index_l> = open)
			else
				drum_foot_index_l = open
				timer_base_foot_l = 0.0
			endif
		endif
		if (<pieces_hit_foot_l> = h1c)
			if (<drum_foot_index_l> = close)
			else
				drum_foot_index_l = close
				timer_base_foot_l = 0.0
			endif
		endif
		if (<time_to_hit_foot_l> <= 0.0)
			time_to_hit_foot_l = 1.0
		endif
		timer_ms_foot_l = <time_to_hit_foot_l>
	endif
	if (<time_to_hit_foot_r> <= 0.0)
		missfoot2 = (<old_frame_length> - (<time_to_hit_foot_r> + <old_frame_length>))
		update_notehit_data_right_foot current_song = <current_song>
		time_to_hit_foot_r = (<time_to_hit_foot_r> - <missfoot2>)
		if (<time_to_hit_foot_r> <= 0.0)
			time_to_hit_foot_r = 1.0
		endif
		start_hit_foot_r = true
	endif
	if (<time_to_hit_1> <= 0.0)
		drum_hit = (<drum_hit> + 1)
		miss2 = (<old_frame_length> - (<time_to_hit_1> + <old_frame_length>))
		GetSongTimeMs \{time_offset = 0.0}
		miss = (<time> - ($drumnote_times [0]))
		time_to_hit_1 = <time_to_hit_2>
		time_to_hit_2 = <time_to_hit_3>
		time_to_hit_3 = <time_to_hit_4>
		time_to_hit_4 = <time_to_hit_5>
		time_to_hit_5 = <time_to_hit_6>
		hit_velocity_1_1 = <hit_velocity_2_1>
		hit_velocity_2_1 = <hit_velocity_3_1>
		hit_velocity_3_1 = <hit_velocity_4_1>
		hit_velocity_4_1 = <hit_velocity_5_1>
		hit_velocity_5_1 = <hit_velocity_6_1>
		hit_velocity_1_2 = <hit_velocity_2_2>
		hit_velocity_2_2 = <hit_velocity_3_2>
		hit_velocity_3_2 = <hit_velocity_4_2>
		hit_velocity_4_2 = <hit_velocity_5_2>
		hit_velocity_5_2 = <hit_velocity_6_2>
		num_pieces_hit_1 = <num_pieces_hit_2>
		num_pieces_hit_2 = <num_pieces_hit_3>
		num_pieces_hit_3 = <num_pieces_hit_4>
		num_pieces_hit_4 = <num_pieces_hit_5>
		num_pieces_hit_5 = <num_pieces_hit_6>
		pieces_value_1_1 = <pieces_value_2_1>
		pieces_value_2_1 = <pieces_value_3_1>
		pieces_value_3_1 = <pieces_value_4_1>
		pieces_value_4_1 = <pieces_value_5_1>
		pieces_value_5_1 = <pieces_value_6_1>
		pieces_value_1_2 = <pieces_value_2_2>
		pieces_value_2_2 = <pieces_value_3_2>
		pieces_value_3_2 = <pieces_value_4_2>
		pieces_value_4_2 = <pieces_value_5_2>
		pieces_value_5_2 = <pieces_value_6_2>
		old_time = ($drumnote_times [1])
		SetArrayElement ArrayName = drumnote_times globalarray index = 0 NewValue = <old_time>
		old_time = ($drumnote_times [2])
		SetArrayElement ArrayName = drumnote_times globalarray index = 1 NewValue = <old_time>
		old_time = ($drumnote_times [3])
		SetArrayElement ArrayName = drumnote_times globalarray index = 2 NewValue = <old_time>
		old_time = ($drumnote_times [4])
		SetArrayElement ArrayName = drumnote_times globalarray index = 3 NewValue = <old_time>
		old_time = ($drumnote_times [5])
		SetArrayElement ArrayName = drumnote_times globalarray index = 4 NewValue = <old_time>
		update_notehit_data current_song = <current_song>
		if ((<time_to_hit_6> < 50.0) && (<num_pieces_hit_5> = 1) && (<num_pieces_hit_6> = 1))
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
		time_to_hit_1 = (<time_to_hit_1> - <miss>)
		if (<time_to_hit_1> <= 0.0)
			time_to_hit_1 = 1.0
		endif
		if (<time_to_hit_6> = 1000000.0)
			allow_pattern_seek = FALSE
		endif
		if (<drum_pattern_exists> = FALSE)
			if (<allow_pattern_seek> = true)
				search_pattern_note_1 {
					num_pieces_hit_1 = <num_pieces_hit_1>
					num_pieces_hit_2 = <num_pieces_hit_2>
					num_pieces_hit_3 = <num_pieces_hit_3>
					num_pieces_hit_4 = <num_pieces_hit_4>
					num_pieces_hit_5 = <num_pieces_hit_5>
					num_pieces_hit_6 = <num_pieces_hit_6>
					pieces_value_1_1 = <pieces_value_1_1>
					pieces_value_2_1 = <pieces_value_2_1>
					pieces_value_3_1 = <pieces_value_3_1>
					pieces_value_4_1 = <pieces_value_4_1>
					pieces_value_5_1 = <pieces_value_5_1>
					pieces_value_6_1 = <pieces_value_6_1>
					pieces_value_1_2 = <pieces_value_1_2>
					pieces_value_2_2 = <pieces_value_2_2>
					pieces_value_3_2 = <pieces_value_3_2>
					pieces_value_4_2 = <pieces_value_4_2>
					pieces_value_5_2 = <pieces_value_5_2>
					pieces_value_6_2 = <pieces_value_6_2>
				}
			endif
		else
			if (<drum_pattern_end> = 6)
				check_new_note_for_pattern new_note_1 = <pieces_value_6_1> new_note_2 = <pieces_value_6_2> num_pieces = <num_pieces_hit_6> drum_pattern_value_l = <drum_pattern_value_l> drum_pattern_value_r = <drum_pattern_value_r>
			else
				continue_pattern = FALSE
			endif
			if (<continue_pattern> = FALSE)
				if (<drum_pattern_end> > 0)
					drum_pattern_end = (<drum_pattern_end> - 1)
					if (<drum_pattern_end> = 0)
						drum_pattern_exists = FALSE
					endif
				endif
				check_final_note_volatility {
					drum_pattern_exists = <drum_pattern_exists>
					drum_pattern_end = <drum_pattern_end>
					drum_pattern_value_l = <drum_pattern_value_l>
					drum_pattern_value_r = <drum_pattern_value_r>
					num_pieces_hit_1 = <num_pieces_hit_1>
					num_pieces_hit_2 = <num_pieces_hit_2>
					num_pieces_hit_3 = <num_pieces_hit_3>
					num_pieces_hit_4 = <num_pieces_hit_4>
					num_pieces_hit_5 = <num_pieces_hit_5>
					num_pieces_hit_6 = <num_pieces_hit_6>
					pieces_value_1_1 = <pieces_value_1_1>
					pieces_value_2_1 = <pieces_value_2_1>
					pieces_value_3_1 = <pieces_value_3_1>
					pieces_value_4_1 = <pieces_value_4_1>
					pieces_value_5_1 = <pieces_value_5_1>
					pieces_value_6_1 = <pieces_value_6_1>
					pieces_value_1_2 = <pieces_value_1_2>
					pieces_value_2_2 = <pieces_value_2_2>
					pieces_value_3_2 = <pieces_value_3_2>
					pieces_value_4_2 = <pieces_value_4_2>
					pieces_value_5_2 = <pieces_value_5_2>
					pieces_value_6_2 = <pieces_value_6_2>
				}
			endif
			if (<drum_pattern_start> > 0)
				drum_pattern_start = (<drum_pattern_start> - 1)
			endif
			if (<drum_pattern_exists> = true)
				if (<drum_pattern_value_l> != <drum_pattern_value_r>)
					test_note = (<drum_pattern_value_l>)
					find_first_note_in_pattern {
						test_note = <test_note>
						drum_pattern_end = <drum_pattern_end>
						pieces_value_1_1 = <pieces_value_1_1>
						pieces_value_2_1 = <pieces_value_2_1>
						pieces_value_3_1 = <pieces_value_3_1>
						pieces_value_4_1 = <pieces_value_4_1>
						pieces_value_5_1 = <pieces_value_5_1>
						pieces_value_6_1 = <pieces_value_6_1>
						pieces_value_1_2 = <pieces_value_1_2>
						pieces_value_2_2 = <pieces_value_2_2>
						pieces_value_3_2 = <pieces_value_3_2>
						pieces_value_4_2 = <pieces_value_4_2>
						pieces_value_5_2 = <pieces_value_5_2>
						pieces_value_6_2 = <pieces_value_6_2>
					}
					if (<note_exists> = 0)
						drum_pattern_value_l = (<drum_pattern_value_r>)
						test_note = (<drum_pattern_value_r>)
						find_first_note_in_pattern {
							test_note = <test_note>
							drum_pattern_end = <drum_pattern_end>
							pieces_value_1_1 = <pieces_value_1_1>
							pieces_value_2_1 = <pieces_value_2_1>
							pieces_value_3_1 = <pieces_value_3_1>
							pieces_value_4_1 = <pieces_value_4_1>
							pieces_value_5_1 = <pieces_value_5_1>
							pieces_value_6_1 = <pieces_value_6_1>
							pieces_value_1_2 = <pieces_value_1_2>
							pieces_value_2_2 = <pieces_value_2_2>
							pieces_value_3_2 = <pieces_value_3_2>
							pieces_value_4_2 = <pieces_value_4_2>
							pieces_value_5_2 = <pieces_value_5_2>
							pieces_value_6_2 = <pieces_value_6_2>
						}
						if (<note_exists> = 0)
							drum_pattern_exists = FALSE
							drum_pattern_start = 0
							drum_pattern_end = 0
						endif
					else
						test_note = (<drum_pattern_value_r>)
						find_first_note_in_pattern {
							test_note = <test_note>
							drum_pattern_end = <drum_pattern_end>
							pieces_value_1_1 = <pieces_value_1_1>
							pieces_value_2_1 = <pieces_value_2_1>
							pieces_value_3_1 = <pieces_value_3_1>
							pieces_value_4_1 = <pieces_value_4_1>
							pieces_value_5_1 = <pieces_value_5_1>
							pieces_value_6_1 = <pieces_value_6_1>
							pieces_value_1_2 = <pieces_value_1_2>
							pieces_value_2_2 = <pieces_value_2_2>
							pieces_value_3_2 = <pieces_value_3_2>
							pieces_value_4_2 = <pieces_value_4_2>
							pieces_value_5_2 = <pieces_value_5_2>
							pieces_value_6_2 = <pieces_value_6_2>
						}
						if (<note_exists> = 0)
							drum_pattern_value_r = (<drum_pattern_value_l>)
						else
						endif
					endif
				endif
			endif
		endif
		if (<drum_pattern_value_l> = <drum_pattern_value_r>)
			if (<drum_pattern_end> < 3)
				drum_pattern_exists = FALSE
				drum_pattern_start = 0
				drum_pattern_end = 0
			endif
		endif
		if (<drum_target_distance_l> > 0)
			drum_target_distance_l = (<drum_target_distance_l> - 1)
		endif
		if (<drum_target_distance_r> > 0)
			drum_target_distance_r = (<drum_target_distance_r> - 1)
		endif
		if ((<drum_pattern_end> > 0) && (<drum_pattern_start> < 2))
			patternactive = true
		else
			patternactive = FALSE
		endif
		if (<drum_target_distance_r> = 0 && <drum_target_distance_l> = 0)
			resetlogic = true
		else
			resetlogic = FALSE
			if (<patternactive> = true)
				if (<drum_pattern_start> = 0.0)
					if (<drum_target_distance_r> > 0)
						if (<drum_target_value_r> != <drum_pattern_value_r>)
							patternactive = FALSE
						endif
					elseif (<drum_target_distance_l> > 0)
						if (<drum_target_value_l> != <drum_pattern_value_l>)
							patternactive = FALSE
						endif
					endif
				endif
			endif
		endif
		if (<drum_target_distance_l> = 0)
			start_hit_l = true
			drum_current_value_l = <drum_target_value_l>
		else
			start_hit_l = FALSE
		endif
		if (<drum_target_distance_r> = 0)
			start_hit_r = true
			drum_current_value_r = <drum_target_value_r>
		else
			start_hit_r = FALSE
		endif
		if (<pieces_value_1_1> = 0)
			drum_target_value_l = <pieces_value_1_1>
			drum_target_distance_l = 1
			drum_target_value_r = <pieces_value_1_1>
			drum_target_distance_r = 1
			hit_velocity_1_1 = 127.0
			hit_velocity_1_2 = 127.0
			tapin = true
		else
			tapin = FALSE
			if (<resetlogic> = true)
				if (<num_pieces_hit_1> = 2)
					drum_target_value_l = <pieces_value_1_1>
					drum_target_distance_l = 1
					drum_target_value_r = <pieces_value_1_2>
					drum_target_distance_r = 1
				else
					if (<drum_pattern_exists> = true)
						if (<drum_pattern_start> < 2)
							if (<drum_pattern_value_l> = <drum_pattern_value_r>)
								compare_values note1_1 = <drum_pattern_value_l> note2_1 = <drum_current_value_l> note2_2 = <drum_current_value_r>
								if (<closer_note> = l)
									drum_target_value_l = <pieces_value_1_1>
									drum_target_distance_l = 1
									drum_target_value_r = <pieces_value_2_1>
									drum_target_distance_r = 2
								else
									drum_target_value_l = <pieces_value_2_1>
									drum_target_distance_l = 2
									drum_target_value_r = <pieces_value_1_1>
									drum_target_distance_r = 1
								endif
							else
								test_note = (<drum_pattern_value_l>)
								find_first_note_in_queue {
									test_note = <test_note>
									pieces_value_1_1 = <pieces_value_1_1>
									pieces_value_1_2 = <pieces_value_1_2>
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
								}
								drum_target_value_l = (<drum_pattern_value_l>)
								drum_target_distance_l = <note_exists>
								test_note = (<drum_pattern_value_r>)
								find_first_note_in_queue {
									test_note = <test_note>
									pieces_value_1_1 = <pieces_value_1_1>
									pieces_value_1_2 = <pieces_value_1_2>
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
								}
								drum_target_value_r = (<drum_pattern_value_r>)
								drum_target_distance_r = <note_exists>
							endif
						elseif (<drum_pattern_start> = 2)
							if (<num_pieces_hit_1> = 2)
								drum_target_value_l = <pieces_value_1_1>
								drum_target_distance_l = 1
								drum_target_value_r = <pieces_value_1_2>
								drum_target_distance_r = 1
							else
								compare_values note1_1 = <pieces_value_1_1> note2_1 = <drum_pattern_value_l> note2_2 = <drum_pattern_value_r>
								if (<closer_note> = l)
									compare_values note1_1 = <pieces_value_1_1> note2_1 = <drum_current_value_r> note2_2 = <drum_pattern_value_l>
									if ((<closer_note> = l) && (<time_to_hit_1> < (<time_to_hit_2> * 1.6)))
										drum_target_value_r = <pieces_value_1_1>
										drum_target_distance_r = 1
										test_note = (<drum_pattern_value_l>)
										find_first_note_in_queue {
											test_note = <test_note>
											pieces_value_1_1 = <pieces_value_1_1>
											pieces_value_1_2 = <pieces_value_1_2>
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
										}
										drum_target_value_l = (<drum_pattern_value_l>)
										drum_target_distance_l = <note_exists>
									else
										drum_target_value_l = <pieces_value_1_1>
										drum_target_distance_l = 1
										test_note = (<drum_pattern_value_r>)
										find_first_note_in_queue {
											test_note = <test_note>
											pieces_value_1_1 = <pieces_value_1_1>
											pieces_value_1_2 = <pieces_value_1_2>
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
										}
										drum_target_value_r = (<drum_pattern_value_r>)
										drum_target_distance_r = <note_exists>
									endif
								else
									compare_values note1_1 = <pieces_value_1_1> note2_1 = <drum_current_value_l> note2_2 = <drum_pattern_value_r>
									if ((<closer_note> = l) && (<time_to_hit_1> < (<time_to_hit_2> * 1.6)))
										drum_target_value_l = <pieces_value_1_1>
										drum_target_distance_l = 1
										test_note = (<drum_pattern_value_r>)
										find_first_note_in_queue {
											test_note = <test_note>
											pieces_value_1_1 = <pieces_value_1_1>
											pieces_value_1_2 = <pieces_value_1_2>
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
										}
										drum_target_value_r = (<drum_pattern_value_r>)
										drum_target_distance_r = <note_exists>
									else
										drum_target_value_r = <pieces_value_1_1>
										drum_target_distance_r = 1
										test_note = (<drum_pattern_value_l>)
										find_first_note_in_queue {
											test_note = <test_note>
											pieces_value_1_1 = <pieces_value_1_1>
											pieces_value_1_2 = <pieces_value_1_2>
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
										}
										drum_target_value_l = (<drum_pattern_value_l>)
										drum_target_distance_l = <note_exists>
									endif
								endif
							endif
						elseif (<drum_pattern_start> = 3)
							if (<num_pieces_hit_1> = 2)
								drum_target_value_l = <pieces_value_1_1>
								drum_target_distance_l = 1
								drum_target_value_r = <pieces_value_1_2>
								drum_target_distance_r = 1
							else
								if (<num_pieces_hit_2> = 2)
									compare_values note1_1 = <pieces_value_1_1> note2_1 = <pieces_value_2_1> note2_2 = <pieces_value_2_2>
									if (<closer_note> = l)
										drum_target_value_l = <pieces_value_1_1>
										drum_target_distance_l = 1
										drum_target_value_r = <pieces_value_2_2>
										drum_target_distance_r = 2
									else
										drum_target_value_l = <pieces_value_2_1>
										drum_target_distance_l = 2
										drum_target_value_r = <pieces_value_1_1>
										drum_target_distance_r = 1
									endif
								else
									compare_values note1_1 = <pieces_value_1_1> note2_1 = <drum_pattern_value_l> note2_2 = <drum_pattern_value_r>
									if (<closer_note> = l)
										drum_target_value_l = <pieces_value_1_1>
										drum_target_distance_l = 1
										compare_values note1_1 = <pieces_value_2_1> note2_1 = <drum_pattern_value_l> note2_2 = <drum_pattern_value_r>
										if (<closer_note> = l)
											test_note = (<drum_pattern_value_r>)
											find_first_note_in_queue {
												test_note = <test_note>
												pieces_value_1_1 = <pieces_value_1_1>
												pieces_value_1_2 = <pieces_value_1_2>
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
											}
											drum_target_value_r = (<drum_pattern_value_r>)
											drum_target_distance_r = <note_exists>
										else
											drum_target_value_r = <pieces_value_2_1>
											drum_target_distance_r = 2
										endif
									elseif (<closer_note> = r)
										drum_target_value_r = <pieces_value_1_1>
										drum_target_distance_r = 1
										compare_values note1_1 = <pieces_value_2_1> note2_1 = <drum_pattern_value_l> note2_2 = <drum_pattern_value_r>
										if (<closer_note> = r)
											test_note = (<drum_pattern_value_l>)
											find_first_note_in_queue {
												test_note = <test_note>
												pieces_value_1_1 = <pieces_value_1_1>
												pieces_value_1_2 = <pieces_value_1_2>
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
											}
											drum_target_value_l = (<drum_pattern_value_l>)
											drum_target_distance_l = <note_exists>
										else
											drum_target_value_l = <pieces_value_2_1>
											drum_target_distance_l = 2
										endif
									elseif (<closer_note> = neither)
										if (<pieces_value_1_1> < <drum_pattern_value_l>)
											drum_target_value_l = <pieces_value_1_1>
											drum_target_distance_l = 1
											if (<pieces_value_2_1> < <drum_pattern_value_l>)
												drum_target_value_r = <pieces_value_3_1>
												drum_target_distance_r = 3
											else
												drum_target_value_r = <pieces_value_2_1>
												drum_target_distance_r = 2
											endif
										elseif (<pieces_value_1_1> > <drum_pattern_value_l>)
											drum_target_value_r = <pieces_value_1_1>
											drum_target_distance_r = 1
											if (<pieces_value_2_1> > <drum_pattern_value_l>)
												drum_target_value_l = <pieces_value_3_1>
												drum_target_distance_l = 3
											else
												drum_target_value_l = <pieces_value_2_1>
												drum_target_distance_l = 2
											endif
										elseif (<pieces_value_1_1> = <drum_pattern_value_l>)
											if (<pieces_value_2_1> < <drum_pattern_value_l>)
												drum_target_value_l = <pieces_value_2_1>
												drum_target_distance_l = 2
												drum_target_value_r = <pieces_value_1_1>
												drum_target_distance_r = 1
											else
												drum_target_value_l = <pieces_value_1_1>
												drum_target_distance_l = 1
												drum_target_value_r = <pieces_value_2_1>
												drum_target_distance_r = 2
											endif
										endif
									endif
								endif
							endif
						endif
					else
						if (<num_pieces_hit_2> = 2)
							compare_values note1_1 = <pieces_value_1_1> note2_1 = <pieces_value_2_1> note2_2 = <pieces_value_2_2>
							if (<closer_note> = l)
								drum_target_value_l = <pieces_value_1_1>
								drum_target_distance_l = 1
								drum_target_value_r = <pieces_value_2_2>
								drum_target_distance_r = 2
							elseif (<closer_note> = r)
								drum_target_value_l = <pieces_value_2_1>
								drum_target_distance_l = 2
								drum_target_value_r = <pieces_value_1_1>
								drum_target_distance_r = 1
							elseif (<closer_note> = neither)
								compare_values note1_1 = <pieces_value_1_1> note2_1 = <drum_current_value_l> note2_2 = <drum_current_value_r>
								if (<closer_note> = l)
									drum_target_value_l = <pieces_value_1_1>
									drum_target_distance_l = 1
									drum_target_value_r = <pieces_value_2_2>
									drum_target_distance_r = 2
								else
									drum_target_value_l = <pieces_value_2_1>
									drum_target_distance_l = 2
									drum_target_value_r = <pieces_value_1_1>
									drum_target_distance_r = 1
								endif
							endif
						else
							if (<num_pieces_hit_3> = 2)
								compare_values note1_1 = <pieces_value_1_1> note2_1 = <pieces_value_3_1> note2_2 = <pieces_value_3_2>
								if (<closer_note> = l)
									drum_target_value_l = <pieces_value_1_1>
									drum_target_distance_l = 1
									compare_values note1_1 = <pieces_value_2_1> note2_1 = <pieces_value_3_1> note2_2 = <pieces_value_3_2>
									if (<closer_note> = l)
										drum_target_value_r = <pieces_value_3_2>
										drum_target_distance_r = 3
									else
										drum_target_value_r = <pieces_value_2_1>
										drum_target_distance_r = 2
									endif
								elseif (<closer_note> = r)
									drum_target_value_r = <pieces_value_1_1>
									drum_target_distance_r = 1
									compare_values note1_1 = <pieces_value_2_1> note2_1 = <pieces_value_3_1> note2_2 = <pieces_value_3_2>
									if (<closer_note> = r)
										drum_target_value_l = <pieces_value_3_1>
										drum_target_distance_l = 3
									else
										drum_target_value_l = <pieces_value_2_1>
										drum_target_distance_l = 2
									endif
								elseif (<closer_note> = neither)
									compare_values note1_1 = <pieces_value_2_1> note2_1 = <pieces_value_3_1> note2_2 = <pieces_value_3_2>
									if (<closer_note> = l)
										drum_target_value_l = <pieces_value_2_1>
										drum_target_distance_l = 2
										drum_target_value_r = <pieces_value_1_1>
										drum_target_distance_r = 1
									else
										drum_target_value_l = <pieces_value_1_1>
										drum_target_distance_l = 1
										drum_target_value_r = <pieces_value_2_1>
										drum_target_distance_r = 2
									endif
								endif
							else
								if (<num_pieces_hit_4> = 2)
									compare_values note1_1 = <pieces_value_1_1> note2_1 = <pieces_value_4_1> note2_2 = <pieces_value_4_2>
									if (<closer_note> = l)
										drum_target_value_l = <pieces_value_1_1>
										drum_target_distance_l = 1
										compare_values note1_1 = <pieces_value_2_1> note2_1 = <pieces_value_4_1> note2_2 = <pieces_value_4_2>
										if (<closer_note> = l)
											compare_values note1_1 = <pieces_value_3_1> note2_1 = <pieces_value_4_1> note2_2 = <pieces_value_4_2>
											if (<closer_note> = l)
												drum_target_value_r = <pieces_value_4_2>
												drum_target_distance_r = 4
											else
												drum_target_value_r = <pieces_value_3_1>
												drum_target_distance_r = 3
											endif
										else
											drum_target_value_r = <pieces_value_2_1>
											drum_target_distance_r = 2
										endif
									elseif (<closer_note> = r)
										drum_target_value_r = <pieces_value_1_1>
										drum_target_distance_r = 1
										compare_values note1_1 = <pieces_value_2_1> note2_1 = <pieces_value_4_1> note2_2 = <pieces_value_4_2>
										if (<closer_note> = r)
											compare_values note1_1 = <pieces_value_3_1> note2_1 = <pieces_value_4_1> note2_2 = <pieces_value_4_2>
											if (<closer_note> = r)
												drum_target_value_l = <pieces_value_4_1>
												drum_target_distance_l = 4
											else
												drum_target_value_l = <pieces_value_3_1>
												drum_target_distance_l = 3
											endif
										else
											drum_target_value_l = <pieces_value_2_1>
											drum_target_distance_l = 2
										endif
									elseif (<closer_note> = neither)
										compare_values note1_1 = <pieces_value_2_1> note2_1 = <pieces_value_4_1> note2_2 = <pieces_value_4_2>
										if (<closer_note> = l)
											drum_target_value_l = <pieces_value_2_1>
											drum_target_distance_l = 2
											drum_target_value_r = <pieces_value_1_1>
											drum_target_distance_r = 1
										elseif (<closer_note> = r)
											drum_target_value_l = <pieces_value_1_1>
											drum_target_distance_l = 1
											drum_target_value_r = <pieces_value_2_1>
											drum_target_distance_r = 2
										elseif (<closer_note> = neither)
											compare_values note1_1 = <pieces_value_3_1> note2_1 = <pieces_value_4_1> note2_2 = <pieces_value_4_2>
											if (<closer_note> = l)
												drum_target_value_l = <pieces_value_3_1>
												drum_target_distance_l = 3
												drum_target_value_r = <pieces_value_1_1>
												drum_target_distance_r = 1
											elseif (<closer_note> = r)
												drum_target_value_l = <pieces_value_1_1>
												drum_target_distance_l = 1
												drum_target_value_r = <pieces_value_3_1>
												drum_target_distance_r = 3
											elseif (<closer_note> = neither)
												if (<drum_current_value_l> = <pieces_value_4_1>)
													if (<drum_current_value_r> = <pieces_value_4_2>)
													else
														drum_target_value_l = <pieces_value_4_1>
														drum_target_distance_l = 4
														drum_target_value_r = <pieces_value_1_1>
														drum_target_distance_r = 1
													endif
												elseif (<drum_current_value_r> = <pieces_value_4_2>)
													drum_target_value_l = <pieces_value_1_1>
													drum_target_distance_l = 1
													drum_target_value_r = <pieces_value_4_2>
													drum_target_distance_r = 4
												else
													if (<time_to_hit_1> > <time_to_hit_4>)
														compare_values note1_1 = <pieces_value_1_1> note2_1 = <drum_current_value_l> note2_2 = <drum_current_value_r>
														if (<closer_note> = l)
															drum_target_value_l = <pieces_value_1_1>
															drum_target_distance_l = 1
															drum_target_value_r = <pieces_value_4_2>
															drum_target_distance_r = 4
														else
															drum_target_value_l = <pieces_value_4_1>
															drum_target_distance_l = 4
															drum_target_value_r = <pieces_value_1_1>
															drum_target_distance_r = 1
														endif
													else
														compare_values note1_1 = <pieces_value_1_1> note2_1 = <pieces_value_4_1> note2_2 = <pieces_value_4_2>
														if (<closer_note> = l)
															drum_target_value_l = <pieces_value_1_1>
															drum_target_distance_l = 1
															drum_target_value_r = <pieces_value_4_2>
															drum_target_distance_r = 4
														else
															drum_target_value_l = <pieces_value_4_1>
															drum_target_distance_l = 4
															drum_target_value_r = <pieces_value_1_1>
															drum_target_distance_r = 1
														endif
													endif
												endif
											endif
										endif
									endif
								else
									if (<pieces_value_2_1> < <pieces_value_1_1>)
										drum_target_value_r = <pieces_value_1_1>
										drum_target_distance_r = 1
										check_descending_note_saftey {
											pieces_value_2_1 = <pieces_value_2_1>
											pieces_value_3_1 = <pieces_value_3_1>
											pieces_value_4_1 = <pieces_value_4_1>
											pieces_value_5_1 = <pieces_value_5_1>
											pieces_value_6_1 = <pieces_value_6_1>
										}
										if (<note_descend_2> = safe)
											drum_target_value_l = <pieces_value_2_1>
											drum_target_distance_l = 2
										elseif (<note_descend_3> = safe)
											drum_target_value_l = <pieces_value_3_1>
											drum_target_distance_l = 3
										else
											drum_target_value_l = <pieces_value_4_1>
											drum_target_distance_l = 4
										endif
									elseif (<pieces_value_2_1> > <pieces_value_1_1>)
										drum_target_value_l = <pieces_value_1_1>
										drum_target_distance_l = 1
										check_ascending_note_saftey {
											pieces_value_2_1 = <pieces_value_2_1>
											pieces_value_3_1 = <pieces_value_3_1>
											pieces_value_4_1 = <pieces_value_4_1>
											pieces_value_5_1 = <pieces_value_5_1>
											pieces_value_6_1 = <pieces_value_6_1>
										}
										if (<note_ascend_2> = safe)
											drum_target_value_r = <pieces_value_2_1>
											drum_target_distance_r = 2
										elseif (<note_ascend_3> = safe)
											drum_target_value_r = <pieces_value_3_1>
											drum_target_distance_r = 3
										else
											drum_target_value_r = <pieces_value_4_1>
											drum_target_distance_r = 4
										endif
									elseif (<pieces_value_2_1> = <pieces_value_1_1>)
										if (<pieces_value_3_1> < <pieces_value_2_1>)
											if ((<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3>) < (<drum_slowest_arm_hit> - 10))
												drum_target_value_l = <pieces_value_3_1>
												drum_target_distance_l = 3
												drum_target_value_r = <pieces_value_1_1>
												drum_target_distance_r = 1
											else
												drum_target_value_l = <pieces_value_1_1>
												drum_target_distance_l = 1
												drum_target_value_r = <pieces_value_2_1>
												drum_target_distance_r = 2
											endif
										elseif (<pieces_value_3_1> > <pieces_value_2_1>)
											if ((<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3>) < (<drum_slowest_arm_hit> - 10))
												drum_target_value_l = <pieces_value_1_1>
												drum_target_distance_l = 1
												drum_target_value_r = <pieces_value_3_1>
												drum_target_distance_r = 3
											else
												drum_target_value_l = <pieces_value_2_1>
												drum_target_distance_l = 2
												drum_target_value_r = <pieces_value_1_1>
												drum_target_distance_r = 1
											endif
										elseif (<pieces_value_3_1> = <pieces_value_2_1>)
											if (<pieces_value_4_1> < <pieces_value_3_1>)
												if ((<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4>) < (<drum_slowest_arm_hit> - 10))
													drum_target_value_l = <pieces_value_4_1>
													drum_target_distance_l = 4
													drum_target_value_r = <pieces_value_1_1>
													drum_target_distance_r = 1
												else
													drum_target_value_l = <pieces_value_2_1>
													drum_target_distance_l = 2
													drum_target_value_r = <pieces_value_1_1>
													drum_target_distance_r = 1
												endif
											elseif (<pieces_value_4_1> > <pieces_value_3_1>)
												if ((<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4>) < (<drum_slowest_arm_hit> - 10))
													drum_target_value_l = <pieces_value_1_1>
													drum_target_distance_l = 1
													drum_target_value_r = <pieces_value_4_1>
													drum_target_distance_r = 4
												else
													drum_target_value_l = <pieces_value_1_1>
													drum_target_distance_l = 1
													drum_target_value_r = <pieces_value_2_1>
													drum_target_distance_r = 2
												endif
											elseif (<pieces_value_4_1> = <pieces_value_3_1>)
												compare_values note1_1 = <pieces_value_1_1> note2_1 = <drum_current_value_l> note2_2 = <drum_current_value_r>
												if (<closer_note> = l)
													drum_target_value_l = <pieces_value_1_1>
													drum_target_distance_l = 1
													drum_target_value_r = <pieces_value_2_1>
													drum_target_distance_r = 2
												else
													drum_target_value_l = <pieces_value_2_1>
													drum_target_distance_l = 2
													drum_target_value_r = <pieces_value_1_1>
													drum_target_distance_r = 1
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			else
				if (<drum_target_distance_r> = 0)
					if (<num_pieces_hit_1> = 2)
						if (<patternactive> = true)
							drum_target_value_r = (<drum_pattern_value_r>)
							drum_target_distance_r = 1
						else
							drum_target_value_r = <pieces_value_1_2>
							drum_target_distance_r = 1
						endif
					else
						if (<drum_pattern_exists> = true)
							if (<drum_pattern_start> < 2)
								if (<drum_pattern_value_l> = <drum_pattern_value_r>)
									if (<drum_target_distance_l> > 1)
										drum_target_value_r = <pieces_value_1_1>
										drum_target_distance_r = 1
									else
										drum_target_value_r = <pieces_value_2_1>
										drum_target_distance_r = 2
									endif
								else
									test_note = (<drum_pattern_value_r>)
									find_first_note_in_pattern {
										test_note = <test_note>
										drum_pattern_end = <drum_pattern_end>
										pieces_value_1_1 = <pieces_value_1_1>
										pieces_value_2_1 = <pieces_value_2_1>
										pieces_value_3_1 = <pieces_value_3_1>
										pieces_value_4_1 = <pieces_value_4_1>
										pieces_value_5_1 = <pieces_value_5_1>
										pieces_value_6_1 = <pieces_value_6_1>
										pieces_value_1_2 = <pieces_value_1_2>
										pieces_value_2_2 = <pieces_value_2_2>
										pieces_value_3_2 = <pieces_value_3_2>
										pieces_value_4_2 = <pieces_value_4_2>
										pieces_value_5_2 = <pieces_value_5_2>
										pieces_value_6_2 = <pieces_value_6_2>
									}
									assign_hand_from_pattern_r {
										note_exists = <note_exists>
										num_pieces_hit_1 = <num_pieces_hit_1>
										num_pieces_hit_2 = <num_pieces_hit_2>
										num_pieces_hit_3 = <num_pieces_hit_3>
										num_pieces_hit_4 = <num_pieces_hit_4>
										num_pieces_hit_5 = <num_pieces_hit_5>
										num_pieces_hit_6 = <num_pieces_hit_6>
										pieces_value_1_1 = <pieces_value_1_1>
										pieces_value_2_1 = <pieces_value_2_1>
										pieces_value_3_1 = <pieces_value_3_1>
										pieces_value_4_1 = <pieces_value_4_1>
										pieces_value_5_1 = <pieces_value_5_1>
										pieces_value_6_1 = <pieces_value_6_1>
										pieces_value_1_2 = <pieces_value_1_2>
										pieces_value_2_2 = <pieces_value_2_2>
										pieces_value_3_2 = <pieces_value_3_2>
										pieces_value_4_2 = <pieces_value_4_2>
										pieces_value_5_2 = <pieces_value_5_2>
										pieces_value_6_2 = <pieces_value_6_2>
									}
								endif
							elseif (<drum_pattern_start> = 2)
								if (<drum_target_distance_l> > 1)
									drum_target_value_r = <pieces_value_1_1>
									drum_target_distance_r = 1
								else
									test_note = (<drum_pattern_value_r>)
									find_first_note_in_pattern {
										test_note = <test_note>
										drum_pattern_end = <drum_pattern_end>
										pieces_value_1_1 = <pieces_value_1_1>
										pieces_value_2_1 = <pieces_value_2_1>
										pieces_value_3_1 = <pieces_value_3_1>
										pieces_value_4_1 = <pieces_value_4_1>
										pieces_value_5_1 = <pieces_value_5_1>
										pieces_value_6_1 = <pieces_value_6_1>
										pieces_value_1_2 = <pieces_value_1_2>
										pieces_value_2_2 = <pieces_value_2_2>
										pieces_value_3_2 = <pieces_value_3_2>
										pieces_value_4_2 = <pieces_value_4_2>
										pieces_value_5_2 = <pieces_value_5_2>
										pieces_value_6_2 = <pieces_value_6_2>
									}
									assign_hand_from_pattern_r {
										note_exists = <note_exists>
										num_pieces_hit_1 = <num_pieces_hit_1>
										num_pieces_hit_2 = <num_pieces_hit_2>
										num_pieces_hit_3 = <num_pieces_hit_3>
										num_pieces_hit_4 = <num_pieces_hit_4>
										num_pieces_hit_5 = <num_pieces_hit_5>
										num_pieces_hit_6 = <num_pieces_hit_6>
										pieces_value_1_1 = <pieces_value_1_1>
										pieces_value_2_1 = <pieces_value_2_1>
										pieces_value_3_1 = <pieces_value_3_1>
										pieces_value_4_1 = <pieces_value_4_1>
										pieces_value_5_1 = <pieces_value_5_1>
										pieces_value_6_1 = <pieces_value_6_1>
										pieces_value_1_2 = <pieces_value_1_2>
										pieces_value_2_2 = <pieces_value_2_2>
										pieces_value_3_2 = <pieces_value_3_2>
										pieces_value_4_2 = <pieces_value_4_2>
										pieces_value_5_2 = <pieces_value_5_2>
										pieces_value_6_2 = <pieces_value_6_2>
									}
								endif
							elseif (<drum_pattern_start> = 3)
								if (<drum_target_distance_l> > 2)
									drum_target_value_r = <pieces_value_1_1>
									drum_target_distance_r = 1
								else
									if (<drum_target_distance_l> > 1)
										drum_target_value_r = <pieces_value_1_1>
										drum_target_distance_r = 1
									else
										if (<num_pieces_hit_2> = 2)
											drum_target_value_r = <pieces_value_2_2>
											drum_target_distance_r = 2
										else
											compare_values note1_1 = <pieces_value_2_1> note2_1 = <drum_pattern_value_l> note2_2 = <drum_pattern_value_r>
											if ((<closer_note> = l) || (<pieces_value_2_1> < <drum_current_value_l>))
												test_note = (<drum_pattern_value_r>)
												find_first_note_in_pattern {
													test_note = <test_note>
													drum_pattern_end = <drum_pattern_end>
													pieces_value_1_1 = <pieces_value_1_1>
													pieces_value_2_1 = <pieces_value_2_1>
													pieces_value_3_1 = <pieces_value_3_1>
													pieces_value_4_1 = <pieces_value_4_1>
													pieces_value_5_1 = <pieces_value_5_1>
													pieces_value_6_1 = <pieces_value_6_1>
													pieces_value_1_2 = <pieces_value_1_2>
													pieces_value_2_2 = <pieces_value_2_2>
													pieces_value_3_2 = <pieces_value_3_2>
													pieces_value_4_2 = <pieces_value_4_2>
													pieces_value_5_2 = <pieces_value_5_2>
													pieces_value_6_2 = <pieces_value_6_2>
												}
												assign_hand_from_pattern_r {
													note_exists = <note_exists>
													num_pieces_hit_1 = <num_pieces_hit_1>
													num_pieces_hit_2 = <num_pieces_hit_2>
													num_pieces_hit_3 = <num_pieces_hit_3>
													num_pieces_hit_4 = <num_pieces_hit_4>
													num_pieces_hit_5 = <num_pieces_hit_5>
													num_pieces_hit_6 = <num_pieces_hit_6>
													pieces_value_1_1 = <pieces_value_1_1>
													pieces_value_2_1 = <pieces_value_2_1>
													pieces_value_3_1 = <pieces_value_3_1>
													pieces_value_4_1 = <pieces_value_4_1>
													pieces_value_5_1 = <pieces_value_5_1>
													pieces_value_6_1 = <pieces_value_6_1>
													pieces_value_1_2 = <pieces_value_1_2>
													pieces_value_2_2 = <pieces_value_2_2>
													pieces_value_3_2 = <pieces_value_3_2>
													pieces_value_4_2 = <pieces_value_4_2>
													pieces_value_5_2 = <pieces_value_5_2>
													pieces_value_6_2 = <pieces_value_6_2>
												}
											else
												drum_target_value_r = <pieces_value_2_1>
												drum_target_distance_r = 2
											endif
										endif
									endif
								endif
							endif
						else
							if (<drum_target_distance_l> > 1)
								drum_target_value_r = <pieces_value_1_1>
								drum_target_distance_r = 1
							else
								find_next_double_in_queue {
									num_pieces_hit_1 = <num_pieces_hit_1>
									num_pieces_hit_2 = <num_pieces_hit_2>
									num_pieces_hit_3 = <num_pieces_hit_3>
									num_pieces_hit_4 = <num_pieces_hit_4>
									num_pieces_hit_5 = <num_pieces_hit_5>
									num_pieces_hit_6 = <num_pieces_hit_6>
								}
								switch <next_double>
									case 2
									drum_target_value_r = <pieces_value_2_2>
									drum_target_distance_r = 2
									case 3
									if ((<pieces_value_3_1> > <pieces_value_2_1>) || (<pieces_value_3_1> = <pieces_value_2_1>))
										drum_target_value_r = <pieces_value_3_2>
										drum_target_distance_r = 3
									else
										drum_target_value_r = <pieces_value_2_1>
										drum_target_distance_r = 2
									endif
									case 4
									if (<pieces_value_3_1> < <pieces_value_4_2>)
										if (<pieces_value_2_1> < <pieces_value_4_2>)
											drum_target_value_r = <pieces_value_4_2>
											drum_target_distance_r = 4
										else
											if ((<pieces_value_2_1> < <pieces_value_3_1>) || (<pieces_value_2_1> = <pieces_value_3_1>))
												drum_target_value_r = <pieces_value_2_1>
												drum_target_distance_r = 2
											else
												drum_target_value_r = <pieces_value_2_1>
												drum_target_distance_r = 2
											endif
										endif
									else
										if ((<pieces_value_2_1> < <pieces_value_3_1>) || (<pieces_value_2_1> = <pieces_value_3_1>))
											drum_target_value_r = <pieces_value_2_1>
											drum_target_distance_r = 2
										else
											drum_target_value_r = <pieces_value_2_1>
											drum_target_distance_r = 2
										endif
									endif
									default
									check_ascending_note_saftey {
										pieces_value_2_1 = <pieces_value_2_1>
										pieces_value_3_1 = <pieces_value_3_1>
										pieces_value_4_1 = <pieces_value_4_1>
										pieces_value_5_1 = <pieces_value_5_1>
										pieces_value_6_1 = <pieces_value_6_1>
									}
									if ((<pieces_value_2_1> > <pieces_value_1_1>) && (<note_ascend_2> = safe))
										drum_target_value_r = <pieces_value_2_1>
										drum_target_distance_r = 2
									elseif ((<pieces_value_3_1> > <pieces_value_1_1>) && (<note_ascend_3> = safe))
										drum_target_value_r = <pieces_value_3_1>
										drum_target_distance_r = 3
									elseif ((<pieces_value_2_1> = <pieces_value_1_1>) && (<note_ascend_2> = safe))
										drum_target_value_r = <pieces_value_2_1>
										drum_target_distance_r = 2
									elseif ((<pieces_value_3_1> = <pieces_value_1_1>) && (<note_ascend_3> = safe))
										drum_target_value_r = <pieces_value_3_1>
										drum_target_distance_r = 3
									elseif ((<pieces_value_4_1> >= <pieces_value_1_1>) && (<note_ascend_4> = safe))
										drum_target_value_r = <pieces_value_4_1>
										drum_target_distance_r = 4
									elseif (<next_double> = 5)
										drum_target_value_r = <pieces_value_5_2>
										drum_target_distance_r = 5
									elseif ((<pieces_value_5_1> >= <pieces_value_1_1>) && (<note_ascend_5> = safe))
										drum_target_value_r = <pieces_value_5_1>
										drum_target_distance_r = 5
									elseif (<next_double> = 6)
										drum_target_value_r = <pieces_value_6_2>
										drum_target_distance_r = 6
									elseif (<pieces_value_6_1> >= <pieces_value_1_1>)
										drum_target_value_r = <pieces_value_6_1>
										drum_target_distance_r = 6
									else
									endif
								endswitch
							endif
						endif
					endif
				elseif (<drum_target_distance_l> = 0)
					if (<num_pieces_hit_1> = 2)
						if (<patternactive> = true)
							drum_target_value_l = <drum_pattern_value_l>
							drum_target_distance_l = 1
						else
							drum_target_value_l = <pieces_value_1_1>
							drum_target_distance_l = 1
						endif
					else
						if (<drum_pattern_exists> = true)
							if (<drum_pattern_start> < 2)
								if (<drum_pattern_value_l> = <drum_pattern_value_r>)
									if (<drum_target_distance_r> > 1)
										drum_target_value_l = <pieces_value_1_1>
										drum_target_distance_l = 1
									else
										drum_target_value_l = <pieces_value_2_1>
										drum_target_distance_l = 2
									endif
								else
									test_note = (<drum_pattern_value_l>)
									find_first_note_in_queue {
										test_note = <test_note>
										pieces_value_1_1 = <pieces_value_1_1>
										pieces_value_1_2 = <pieces_value_1_2>
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
									}
									drum_target_value_l = (<drum_pattern_value_l>)
									drum_target_distance_l = <note_exists>
								endif
							elseif (<drum_pattern_start> = 2)
								if (<drum_target_distance_r> > 1)
									drum_target_value_l = <pieces_value_1_1>
									drum_target_distance_l = 1
								else
									test_note = (<drum_pattern_value_l>)
									find_first_note_in_pattern {
										test_note = <test_note>
										drum_pattern_end = <drum_pattern_end>
										pieces_value_1_1 = <pieces_value_1_1>
										pieces_value_2_1 = <pieces_value_2_1>
										pieces_value_3_1 = <pieces_value_3_1>
										pieces_value_4_1 = <pieces_value_4_1>
										pieces_value_5_1 = <pieces_value_5_1>
										pieces_value_6_1 = <pieces_value_6_1>
										pieces_value_1_2 = <pieces_value_1_2>
										pieces_value_2_2 = <pieces_value_2_2>
										pieces_value_3_2 = <pieces_value_3_2>
										pieces_value_4_2 = <pieces_value_4_2>
										pieces_value_5_2 = <pieces_value_5_2>
										pieces_value_6_2 = <pieces_value_6_2>
									}
									assign_hand_from_pattern_l {
										note_exists = <note_exists>
										pieces_value_1_1 = <pieces_value_1_1>
										pieces_value_2_1 = <pieces_value_2_1>
										pieces_value_3_1 = <pieces_value_3_1>
										pieces_value_4_1 = <pieces_value_4_1>
										pieces_value_5_1 = <pieces_value_5_1>
										pieces_value_6_1 = <pieces_value_6_1>
									}
								endif
							elseif (<drum_pattern_start> = 3)
								if (<drum_target_distance_r> > 2)
									drum_target_value_l = <pieces_value_1_1>
									drum_target_distance_l = 1
								else
									if (<drum_target_distance_r> > 1)
										drum_target_value_l = <pieces_value_1_1>
										drum_target_distance_l = 1
									else
										if (<num_pieces_hit_2> = 2)
											drum_target_value_l = <pieces_value_2_2>
											drum_target_distance_l = 2
										else
											compare_values note1_1 = <pieces_value_2_1> note2_1 = <drum_pattern_value_l> note2_2 = <drum_pattern_value_r>
											if ((<closer_note> = r) || (<pieces_value_2_1> > <drum_current_value_r>))
												test_note = (<drum_pattern_value_l>)
												find_first_note_in_pattern {
													test_note = <test_note>
													drum_pattern_end = <drum_pattern_end>
													pieces_value_1_1 = <pieces_value_1_1>
													pieces_value_2_1 = <pieces_value_2_1>
													pieces_value_3_1 = <pieces_value_3_1>
													pieces_value_4_1 = <pieces_value_4_1>
													pieces_value_5_1 = <pieces_value_5_1>
													pieces_value_6_1 = <pieces_value_6_1>
													pieces_value_1_2 = <pieces_value_1_2>
													pieces_value_2_2 = <pieces_value_2_2>
													pieces_value_3_2 = <pieces_value_3_2>
													pieces_value_4_2 = <pieces_value_4_2>
													pieces_value_5_2 = <pieces_value_5_2>
													pieces_value_6_2 = <pieces_value_6_2>
												}
												assign_hand_from_pattern_l {
													note_exists = <note_exists>
													pieces_value_1_1 = <pieces_value_1_1>
													pieces_value_2_1 = <pieces_value_2_1>
													pieces_value_3_1 = <pieces_value_3_1>
													pieces_value_4_1 = <pieces_value_4_1>
													pieces_value_5_1 = <pieces_value_5_1>
													pieces_value_6_1 = <pieces_value_6_1>
												}
											else
												drum_target_value_l = <pieces_value_2_1>
												drum_target_distance_l = 2
											endif
										endif
									endif
								endif
							endif
						else
							if (<drum_target_distance_r> > 1)
								drum_target_value_l = <pieces_value_1_1>
								drum_target_distance_l = 1
							else
								find_next_double_in_queue {
									num_pieces_hit_1 = <num_pieces_hit_1>
									num_pieces_hit_2 = <num_pieces_hit_2>
									num_pieces_hit_3 = <num_pieces_hit_3>
									num_pieces_hit_4 = <num_pieces_hit_4>
									num_pieces_hit_5 = <num_pieces_hit_5>
									num_pieces_hit_6 = <num_pieces_hit_6>
								}
								switch <next_double>
									case 2
									drum_target_value_l = <pieces_value_2_1>
									drum_target_distance_l = 2
									case 3
									if ((<pieces_value_3_2> < <pieces_value_2_1>) || (<pieces_value_3_2> = <pieces_value_2_1>))
										drum_target_value_l = <pieces_value_3_1>
										drum_target_distance_l = 3
									else
										drum_target_value_l = <pieces_value_2_1>
										drum_target_distance_l = 2
									endif
									case 4
									if (<pieces_value_3_1> > <pieces_value_4_1>)
										if (<pieces_value_2_1> > <pieces_value_4_1>)
											drum_target_value_l = <pieces_value_4_1>
											drum_target_distance_l = 4
										else
											if ((<pieces_value_2_1> > <pieces_value_3_1>) || (<pieces_value_2_1> = <pieces_value_3_1>))
												drum_target_value_l = <pieces_value_2_1>
												drum_target_distance_l = 2
											else
												drum_target_value_l = <pieces_value_2_1>
												drum_target_distance_l = 2
											endif
										endif
									else
										if ((<pieces_value_2_1> > <pieces_value_3_1>) || (<pieces_value_2_1> = <pieces_value_3_1>))
											drum_target_value_l = <pieces_value_2_1>
											drum_target_distance_l = 2
										else
											drum_target_value_l = <pieces_value_2_1>
											drum_target_distance_l = 2
										endif
									endif
									default
									check_descending_note_saftey {
										pieces_value_2_1 = <pieces_value_2_1>
										pieces_value_3_1 = <pieces_value_3_1>
										pieces_value_4_1 = <pieces_value_4_1>
										pieces_value_5_1 = <pieces_value_5_1>
										pieces_value_6_1 = <pieces_value_6_1>
									}
									if ((<pieces_value_2_1> < <pieces_value_1_1>) && (<note_descend_2> = safe))
										drum_target_value_l = <pieces_value_2_1>
										drum_target_distance_l = 2
									elseif ((<pieces_value_3_1> < <pieces_value_1_1>) && (<note_descend_3> = safe))
										drum_target_value_l = <pieces_value_3_1>
										drum_target_distance_l = 3
									elseif ((<pieces_value_2_1> = <pieces_value_1_1>) && (<note_descend_2> = safe))
										drum_target_value_l = <pieces_value_2_1>
										drum_target_distance_l = 2
									elseif ((<pieces_value_3_1> = <pieces_value_1_1>) && (<note_descend_3> = safe))
										drum_target_value_l = <pieces_value_3_1>
										drum_target_distance_l = 3
									elseif ((<pieces_value_4_1> <= <pieces_value_1_1>) && (<note_descend_4> = safe))
										drum_target_value_l = <pieces_value_4_1>
										drum_target_distance_l = 4
									elseif (<next_double> = 5)
										drum_target_value_l = <pieces_value_5_1>
										drum_target_distance_l = 5
									elseif ((<pieces_value_5_1> <= <pieces_value_1_1>) && (<note_descend_5> = safe))
										drum_target_value_l = <pieces_value_5_1>
										drum_target_distance_l = 5
									elseif (<next_double> = 6)
										drum_target_value_l = <pieces_value_6_1>
										drum_target_distance_l = 6
									elseif (<pieces_value_6_1> <= <pieces_value_1_1>)
										drum_target_value_l = <pieces_value_6_1>
										drum_target_distance_l = 6
									else
									endif
								endswitch
							endif
						endif
					endif
				endif
			endif
		endif
		begin_transition_r = FALSE
		begin_transition_l = FALSE
		if (<start_hit_r> = true)
			switch (<drum_target_distance_r>)
				case 1
				time_to_hit_r = <time_to_hit_1>
				drum_target_velocity_r = <hit_velocity_1_2>
				case 2
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2>)
				drum_target_velocity_r = <hit_velocity_2_2>
				case 3
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3>)
				drum_target_velocity_r = <hit_velocity_3_2>
				case 4
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4>)
				drum_target_velocity_r = <hit_velocity_4_2>
				case 5
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4> + <time_to_hit_5>)
				drum_target_velocity_r = <hit_velocity_5_2>
				case 6
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4> + <time_to_hit_5> + <time_to_hit_6>)
				drum_target_velocity_r = <hit_velocity_6_2>
				default
				time_to_hit_r = 100000000.0
				drum_target_velocity_r = 100
			endswitch
			if (<drum_target_value_r> != <drum_current_value_r>)
				begin_transition_r = true
			else
			endif
		else
			time_to_hit_r = 0.0
		endif
		if (<start_hit_l> = true)
			switch (<drum_target_distance_l>)
				case 1
				time_to_hit_l = (<time_to_hit_1>)
				drum_target_velocity_l = <hit_velocity_1_1>
				case 2
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2>)
				drum_target_velocity_l = <hit_velocity_2_1>
				case 3
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3>)
				drum_target_velocity_l = <hit_velocity_3_1>
				case 4
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4>)
				drum_target_velocity_l = <hit_velocity_4_1>
				case 5
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4> + <time_to_hit_5>)
				drum_target_velocity_l = <hit_velocity_5_1>
				case 6
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4> + <time_to_hit_5> + <time_to_hit_6>)
				drum_target_velocity_l = <hit_velocity_6_1>
				default
				time_to_hit_l = 100000000.0
				drum_target_velocity_l = 100
			endswitch
			if (<drum_target_value_l> != <drum_current_value_l>)
				begin_transition_l = true
			else
			endif
		else
			time_to_hit_l = 0.0
		endif
		if ((<time_to_hit_1> > <longest_transit>) || (<first_hit> = true))
			should_idle = true
		else
			should_idle = FALSE
		endif
		if ((<begin_transition_r> = true) && (<begin_transition_l> = true))
			create_target_state drum_target_value_l = <drum_target_value_l> drum_target_value_r = <drum_target_value_r>
			if (<time_to_hit_r> < <time_to_hit_l>)
				index = 0
				begin
				(<drummer_ids> [<index>]) :Obj_SpawnScriptNow drummer_transit params = {should_idle = <should_idle> time_to_hit_1 = <time_to_hit_1> time_to_trans = <time_to_hit_r> drum_target_hit_string_l = <drum_target_hit_string_l> drum_target_hit_string_r = <drum_target_hit_string_r> drum_target_state_string = <drum_target_state_string> tapin = <tapin>}
				index = (<index> + 1)
				repeat <num_drummers>
			else
				index = 0
				begin
				(<drummer_ids> [<index>]) :Obj_SpawnScriptNow drummer_transit params = {should_idle = <should_idle> time_to_hit_1 = <time_to_hit_1> time_to_trans = <time_to_hit_l> drum_target_hit_string_l = <drum_target_hit_string_l> drum_target_hit_string_r = <drum_target_hit_string_r> drum_target_state_string = <drum_target_state_string> tapin = <tapin>}
				index = (<index> + 1)
				repeat <num_drummers>
			endif
		elseif (<begin_transition_r> = true)
			create_target_state drum_target_value_l = <drum_target_value_l> drum_target_value_r = <drum_target_value_r>
			index = 0
			begin
			(<drummer_ids> [<index>]) :Obj_SpawnScriptNow drummer_transit params = {should_idle = <should_idle> time_to_hit_1 = <time_to_hit_1> time_to_trans = <time_to_hit_r> drum_target_hit_string_l = <drum_target_hit_string_l> drum_target_hit_string_r = <drum_target_hit_string_r> drum_target_state_string = <drum_target_state_string> tapin = <tapin>}
			index = (<index> + 1)
			repeat <num_drummers>
		elseif (<begin_transition_l> = true)
			create_target_state drum_target_value_l = <drum_target_value_l> drum_target_value_r = <drum_target_value_r>
			index = 0
			begin
			(<drummer_ids> [<index>]) :Obj_SpawnScriptNow drummer_transit params = {should_idle = <should_idle> time_to_hit_1 = <time_to_hit_1> time_to_trans = <time_to_hit_l> drum_target_hit_string_l = <drum_target_hit_string_l> drum_target_hit_string_r = <drum_target_hit_string_r> drum_target_state_string = <drum_target_state_string> tapin = <tapin>}
			index = (<index> + 1)
			repeat <num_drummers>
		elseif (<should_idle> = true)
			create_target_state drum_target_value_l = <drum_current_value_l> drum_target_value_r = <drum_current_value_r>
			index = 0
			begin
			(<drummer_ids> [<index>]) :Obj_SpawnScriptNow drummer_transit params = {should_idle = <should_idle> time_to_hit_1 = <time_to_hit_1> time_to_trans = <time_to_hit_l> drum_target_hit_string_l = <drum_target_hit_string_l> drum_target_hit_string_r = <drum_target_hit_string_r> drum_target_state_string = <drum_target_state_string> tapin = <tapin>}
			index = (<index> + 1)
			repeat <num_drummers>
		endif
		if (<patternactive> = true)
			drum_was_patterned = true
		else
			drum_was_patterned = FALSE
		endif
	endif
	getframelength
	frame_length1 = (<frame_length> * 1000.0)
	Wait \{1
		gameframe}
	getframelength
	frame_length = ((<frame_length> * 1000.0) + <frame_length1>)
	if (<drum_foot_index_l> = open)
		av_drum_blend_hh_kit = <timer_base_foot_l>
	else
		av_drum_blend_hh_kit = (1 - <timer_base_foot_l>)
	endif
	if (<start_hit_r> = true)
		index = 0
		begin
		(<drummer_ids> [<index>]) :hit_drumkit_piece Strength = <newmod_hand_r> pieces_hit = <drum_current_value_r> channel = drum_arms_r
		index = (<index> + 1)
		repeat <num_drummers>
		oldmod_hand_r = <newmod_hand_r>
		normalize_velocities value = <drum_target_value_r> velocity = <drum_target_velocity_r>
		newmod_hand_r = <velocity>
		timer_ms_hand_r = <time_to_hit_r>
		target_ms_hand_r = <time_to_hit_r>
		if (<first_hit> = FALSE)
			fractional_animstep = (1 - <getnumframes_hand_r>)
			getnumframes_hand_r = ((<timer_ms_hand_r> + <miss2>) / <old_frame_length>)
			timer_base_hand_r = (1 / <getnumframes_hand_r>)
			if (<timer_base_hand_r> < (<old_frame_length> / <drum_slowest_arm_hit>))
				timer_base_hand_r = (<old_frame_length> / <drum_slowest_arm_hit>)
			endif
			timer_base_hand_r = (<timer_base_hand_r> * <fractional_animstep>)
		endif
		if (<time_to_hit_r> < <drum_fastest_arm_hit>)
			blend_hand_r = 0.0
			mod_overdrive_hand_r = (<time_to_hit_r> / <drum_fastest_arm_hit>)
		else
			mod_overdrive_hand_r = 1.0
			if (<time_to_hit_r> < <drum_medium_arm_hit>)
				blend_hand_r = ((<time_to_hit_r> - <drum_fastest_arm_hit>) / (<drum_medium_arm_hit> - <drum_fastest_arm_hit>))
				blend_hand_r = (<blend_hand_r> * 0.5)
			else
				if (<time_to_hit_r> < <drum_slowest_arm_hit>)
					blend_hand_r = ((<time_to_hit_r> - <drum_medium_arm_hit>) / (<drum_slowest_arm_hit> - <drum_medium_arm_hit>))
					blend_hand_r = (0.5 + (<blend_hand_r> * 0.5))
				else
					blend_hand_r = 1.0
				endif
			endif
		endif
		start_hit_r = FALSE
	endif
	if (<start_hit_l> = true)
		index = 0
		begin
		(<drummer_ids> [<index>]) :hit_drumkit_piece Strength = <newmod_hand_l> pieces_hit = <drum_current_value_l> channel = drum_arms_l
		index = (<index> + 1)
		repeat <num_drummers>
		oldmod_hand_l = <newmod_hand_l>
		normalize_velocities value = <drum_target_value_l> velocity = <drum_target_velocity_l>
		newmod_hand_l = <velocity>
		timer_ms_hand_l = <time_to_hit_l>
		target_ms_hand_l = <time_to_hit_l>
		if (<first_hit> = FALSE)
			fractional_animstep = (1.0 - <getnumframes_hand_l>)
			getnumframes_hand_l = ((<timer_ms_hand_l> + <miss2>) / <old_frame_length>)
			timer_base_hand_l = (1.0 / <getnumframes_hand_l>)
			if (<timer_base_hand_l> < (<old_frame_length> / <drum_slowest_arm_hit>))
				timer_base_hand_l = (<old_frame_length> / <drum_slowest_arm_hit>)
			endif
			timer_base_hand_l = (<timer_base_hand_l> * <fractional_animstep>)
		endif
		if (<time_to_hit_l> < <drum_fastest_arm_hit>)
			blend_hand_l = 0.0
			mod_overdrive_hand_l = (<time_to_hit_l> / <drum_fastest_arm_hit>)
		else
			mod_overdrive_hand_l = 1.0
			if (<time_to_hit_l> < <drum_medium_arm_hit>)
				blend_hand_l = ((<time_to_hit_l> - <drum_fastest_arm_hit>) / (<drum_medium_arm_hit> - <drum_fastest_arm_hit>))
				blend_hand_l = (<blend_hand_l> * 0.5)
			else
				if (<time_to_hit_l> < <drum_slowest_arm_hit>)
					blend_hand_l = ((<time_to_hit_l> - <drum_medium_arm_hit>) / (<drum_slowest_arm_hit> - <drum_medium_arm_hit>))
					blend_hand_l = (0.5 + (<blend_hand_l> * 0.5))
				else
					blend_hand_l = 1.0
				endif
			endif
		endif
		start_hit_l = FALSE
	endif
	if (<start_hit_foot_r> = true)
		random_float = 0.0
		getrandomfloat a = (0.0 - <random_hit_mod_vary_foot>) b = <random_hit_mod_vary_foot>
		random_mod_foot_r = <random_float>
		newmod_foot_r = 0.91999996
		newmod_foot_r = (<newmod_foot_r> + <random_mod_foot_r>)
		mod_foot_r = <newmod_foot_r>
		timer_ms_foot_r = <time_to_hit_foot_r>
		target_ms_foot_r = <time_to_hit_foot_r>
		if (<first_hit> = FALSE)
			fractional_animstep = (1.0 - <getnumframes_foot_r>)
			getnumframes_foot_r = ((<timer_ms_foot_r> + <missfoot2>) / <old_frame_length>)
			timer_base_foot_r = (1.0 / <getnumframes_foot_r>)
			if (<timer_base_foot_r> < (<old_frame_length> / <drum_slowest_foot_hit_r>))
				timer_base_foot_r = (<old_frame_length> / <drum_slowest_foot_hit_r>)
			endif
			timer_base_foot_r = (<timer_base_foot_r> * <fractional_animstep>)
		endif
		if (<time_to_hit_foot_r> < <drum_fastest_foot_hit_r>)
			blend_foot_r = 0.0
			mod_overdrive_foot_r = (<time_to_hit_foot_r> / <drum_fastest_foot_hit_r>)
		else
			mod_overdrive_foot_r = 1.0
			if (<time_to_hit_foot_r> < <drum_medium_foot_hit_r>)
				blend_foot_r = ((<time_to_hit_foot_r> - <drum_fastest_foot_hit_r>) / (<drum_medium_foot_hit_r> - <drum_fastest_foot_hit_r>))
				blend_foot_r = (<blend_foot_r> * 0.5)
			else
				if (<time_to_hit_foot_r> < <drum_slowest_foot_hit_r>)
					blend_foot_r = ((<time_to_hit_foot_r> - <drum_medium_foot_hit_r>) / (<drum_slowest_foot_hit_r> - <drum_medium_foot_hit_r>))
					blend_foot_r = (0.5 + (<blend_foot_r> * 0.5))
				else
					blend_foot_r = 1.0
				endif
			endif
		endif
		start_hit_foot_r = FALSE
	endif
	getnumframes_hand_r = (<timer_ms_hand_r> / <frame_length>)
	if (<getnumframes_hand_r> < 1E-06)
		getnumframes_hand_r = 1E-06
	endif
	getnumframes_hand_l = (<timer_ms_hand_l> / <frame_length>)
	if (<getnumframes_hand_l> < 1E-06)
		getnumframes_hand_l = 1E-06
	endif
	getnumframes_foot_r = (<timer_ms_foot_r> / <frame_length>)
	if (<getnumframes_foot_r> < 1E-06)
		getnumframes_foot_r = 1E-06
	endif
	animstep_hand_r = ((1 - <timer_base_hand_r>) / <getnumframes_hand_r>)
	animstep_hand_l = ((1 - <timer_base_hand_l>) / <getnumframes_hand_l>)
	animstep_foot_r = ((1 - <timer_base_foot_r>) / <getnumframes_foot_r>)
	if (<timer_base_hand_r> < <drum_idlepoint_arm_shit>)
		if (<animstep_hand_r> < (<frame_length> / <drum_slowest_arm_hit>))
			animstep_hand_r = (<frame_length> / <drum_slowest_arm_hit>)
		endif
	endif
	if (<timer_base_hand_l> < <drum_idlepoint_arm_shit>)
		if (<animstep_hand_l> < (<frame_length> / <drum_slowest_arm_hit>))
			animstep_hand_l = (<frame_length> / <drum_slowest_arm_hit>)
		endif
	endif
	if (<timer_base_foot_r> < <drum_idlepoint_foot_hit>)
		if (<animstep_foot_r> < (<frame_length> / <drum_slowest_foot_hit_r>))
			animstep_foot_r = (<frame_length> / <drum_slowest_foot_hit_r>)
		endif
	endif
	if (<blend_hand_r> > 0.5)
		drum_idlepoint_arm_r = ((((<blend_hand_r> -0.5) * 2.0) * <drum_idlepoint_arm_shit>) + ((1 - ((<blend_hand_r> -0.5) * 2.0)) * <drum_idlepoint_arm_mhit>))
		drum_apex_arm_r = ((((<blend_hand_r> -0.5) * 2.0) * <drum_apex_arm_shit>) + ((1.0 - ((<blend_hand_r> -0.5) * 2.0)) * <drum_apex_arm_mhit>))
	else
		drum_idlepoint_arm_r = <drum_idlepoint_arm_mhit>
		drum_apex_arm_r = <drum_apex_arm_mhit>
	endif
	if (<blend_hand_l> > 0.5)
		drum_idlepoint_arm_l = ((((<blend_hand_l> -0.5) * 2.0) * <drum_idlepoint_arm_shit>) + ((1 - ((<blend_hand_l> -0.5) * 2.0)) * <drum_idlepoint_arm_mhit>))
		drum_apex_arm_l = ((((<blend_hand_l> -0.5) * 2.0) * <drum_apex_arm_shit>) + ((1.0 - ((<blend_hand_l> -0.5) * 2.0)) * <drum_apex_arm_mhit>))
	else
		drum_idlepoint_arm_l = <drum_idlepoint_arm_mhit>
		drum_apex_arm_l = <drum_apex_arm_mhit>
	endif
	if (<blend_hand_r> < 0.5)
		unmod_hit_hand_r = 1.0
	else
		if (<timer_base_hand_r> < <drum_idlepoint_arm_r>)
			unmod_hit_hand_r = (1.0 - (<timer_base_hand_r> / <drum_idlepoint_arm_r>))
			unmod_hit_hand_r = (<unmod_hit_hand_r> + ((1.0 - <unmod_hit_hand_r>) * (1.0 - ((<blend_hand_r> -0.5) * 2.0))))
			unmod_hit_hand_r = (<unmod_hit_hand_r> + ((1.0 - <unmod_hit_hand_r>) * (1.0 - ((<blend_hand_r> -0.5) * 2.0))))
		else
			if (<timer_base_hand_r> < <drum_apex_arm_r>)
				unmod_hit_hand_r = (1.0 - ((<drum_apex_arm_r> - <timer_base_hand_r>) / (<drum_apex_arm_r> - <drum_idlepoint_arm_r>)))
				unmod_hit_hand_r = (<unmod_hit_hand_r> + ((1.0 - <unmod_hit_hand_r>) * (1.0 - ((<blend_hand_r> -0.5) * 2.0))))
				unmod_hit_hand_r = (<unmod_hit_hand_r> + ((1.0 - <unmod_hit_hand_r>) * (1.0 - ((<blend_hand_r> -0.5) * 2.0))))
			else
				unmod_hit_hand_r = 1.0
			endif
		endif
	endif
	if (<blend_hand_l> < 0.5)
		unmod_hit_hand_l = 1.0
	else
		if (<timer_base_hand_l> < <drum_idlepoint_arm_l>)
			unmod_hit_hand_l = (1.0 - (<timer_base_hand_l> / <drum_idlepoint_arm_l>))
			unmod_hit_hand_l = (<unmod_hit_hand_l> + ((1 - <unmod_hit_hand_l>) * (1.0 - ((<blend_hand_l> -0.5) * 2.0))))
			unmod_hit_hand_l = (<unmod_hit_hand_l> + ((1 - <unmod_hit_hand_l>) * (1.0 - ((<blend_hand_l> -0.5) * 2.0))))
		else
			if (<timer_base_hand_l> < <drum_apex_arm_l>)
				unmod_hit_hand_l = (1.0 - ((<drum_apex_arm_l> - <timer_base_hand_l>) / (<drum_apex_arm_l> - <drum_idlepoint_arm_l>)))
				unmod_hit_hand_l = (<unmod_hit_hand_l> + ((1.0 - <unmod_hit_hand_l>) * (1.0 - ((<blend_hand_l> -0.5) * 2.0))))
				unmod_hit_hand_l = (<unmod_hit_hand_l> + ((1.0 - <unmod_hit_hand_l>) * (1.0 - ((<blend_hand_l> -0.5) * 2.0))))
			else
				unmod_hit_hand_l = 1.0
			endif
		endif
	endif
	if (<timer_base_hand_r> < <drum_apex_arm_r>)
		unik_hand_med_r = (1.0 - (((<timer_base_hand_r> / <drum_apex_arm_r>) * <newmod_hand_r>)))
	else
		unik_hand_med_r = (1.0 - ((1.0 - ((<timer_base_hand_r> - <drum_apex_arm_r>) / (1.0 - <drum_apex_arm_r>))) * <newmod_hand_r>))
	endif
	if (<blend_hand_r> < 0.5)
		<av_drum_ik_hand_r> = ((1.0 * (1.0 - (<blend_hand_r> * 2.0))) + (<unik_hand_med_r> * (<blend_hand_r> * 2.0)))
	else
		if (<timer_base_hand_r> < <drum_idlepoint_arm_r>)
			unik_hand_slow_r = (1.0 - ((<timer_base_hand_r> / <drum_idlepoint_arm_r>)))
		else
			if (<timer_base_hand_r> < <drum_apex_arm_r>)
				unik_hand_slow_r = ((1 - ((<drum_apex_arm_r> - <timer_base_hand_r>) / (<drum_apex_arm_r> - <drum_idlepoint_arm_r>))) * (1.0 - <newmod_hand_r>))
			else
				unik_hand_slow_r = <unik_hand_med_r>
			endif
		endif
		<av_drum_ik_hand_r> = ((<unik_hand_med_r> * (1.0 - ((<blend_hand_r> -0.5) * 2.0))) + (<unik_hand_slow_r> * ((<blend_hand_r> -0.5) * 2.0)))
	endif
	if (<timer_base_hand_l> < <drum_apex_arm_l>)
		unik_hand_med_l = (1.0 - (((<timer_base_hand_l> / <drum_apex_arm_l>) * <newmod_hand_l>)))
	else
		unik_hand_med_l = (1.0 - ((1.0 - ((<timer_base_hand_l> - <drum_apex_arm_l>) / (1.0 - <drum_apex_arm_l>))) * <newmod_hand_l>))
	endif
	if (<blend_hand_l> < 0.5)
		<av_drum_ik_hand_l> = ((1.0 * (1.0 - (<blend_hand_l> * 2.0))) + (<unik_hand_med_l> * (<blend_hand_l> * 2.0)))
	else
		if (<timer_base_hand_l> < <drum_idlepoint_arm_l>)
			unik_hand_slow_l = (1.0 - ((<timer_base_hand_l> / <drum_idlepoint_arm_l>)))
		else
			if (<timer_base_hand_l> < <drum_apex_arm_l>)
				unik_hand_slow_l = ((1.0 - ((<drum_apex_arm_l> - <timer_base_hand_l>) / (<drum_apex_arm_l> - <drum_idlepoint_arm_l>))) * (1.0 - <newmod_hand_l>))
			else
				unik_hand_slow_l = <unik_hand_med_l>
			endif
		endif
		<av_drum_ik_hand_l> = ((<unik_hand_med_l> * (1.0 - ((<blend_hand_l> -0.5) * 2.0))) + (<unik_hand_slow_l> * ((<blend_hand_l> -0.5) * 2.0)))
	endif
	if (<blend_hand_r> < 0.5)
		unmod_body_r = ((1.0 * (1.0 - (<blend_hand_r> * 2.0))) + ((1.0 - <newmod_hand_r>) * (<blend_hand_r> * 2.0)))
	else
		if (<timer_base_hand_r> < <drum_idlepoint_arm_r>)
			unmod_body_slow_r = ((1.0 - <newmod_hand_r>) + (<newmod_hand_r> * (<timer_base_hand_r> / <drum_idlepoint_arm_r>)))
		else
			if (<timer_base_hand_r> < <drum_apex_arm_r>)
				unmod_body_slow_r = ((1.0 - <newmod_hand_r>) + (<newmod_hand_r> * (1.0 - ((<timer_base_hand_r> - <drum_idlepoint_arm_r>) / (<drum_apex_arm_r> - <drum_idlepoint_arm_r>)))))
			else
				unmod_body_slow_r = (1.0 - <newmod_hand_r>)
			endif
		endif
		unmod_body_r = (((1.0 - <newmod_hand_r>) * (1.0 - ((<blend_hand_r> -0.5) * 2.0))) + (<unmod_body_slow_r> * ((<blend_hand_r> -0.5) * 2.0)))
	endif
	if (<blend_hand_l> < 0.5)
		unmod_body_l = ((1.0 * (1.0 - (<blend_hand_l> * 2.0))) + ((1.0 - <newmod_hand_l>) * (<blend_hand_l> * 2.0)))
	else
		if (<timer_base_hand_l> < <drum_idlepoint_arm_l>)
			unmod_body_slow_l = ((1.0 - <newmod_hand_l>) + (<newmod_hand_l> * (<timer_base_hand_l> / <drum_idlepoint_arm_l>)))
		else
			if (<timer_base_hand_l> < <drum_apex_arm_l>)
				unmod_body_slow_l = ((1.0 - <newmod_hand_l>) + (<newmod_hand_l> * (1.0 - ((<timer_base_hand_l> - <drum_idlepoint_arm_l>) / (<drum_apex_arm_l> - <drum_idlepoint_arm_l>)))))
			else
				unmod_body_slow_l = (1.0 - <newmod_hand_l>)
			endif
		endif
		unmod_body_l = (((1.0 - <newmod_hand_l>) * (1.0 - ((<blend_hand_l> -0.5) * 2.0))) + (<unmod_body_slow_l> * ((<blend_hand_l> -0.5) * 2.0)))
	endif
	unmod_body_r = (1.0 - ((1.0 - <unmod_body_r>) * <newmod_hand_r>))
	unmod_body_l = (1.0 - ((1.0 - <unmod_body_l>) * <newmod_hand_l>))
	unmod_body = (1.0 - ((1.0 - (<unmod_body_r> * <unmod_body_l>)) * 0.5))
	unmod_body = (<oldunmod_body> + ((<unmod_body> - <oldunmod_body>) * 0.05))
	oldunmod_body = <unmod_body>
	mod_hand_r = ((<oldmod_hand_r> * (1.0 - <timer_base_hand_r>)) + (<newmod_hand_r> * <timer_base_hand_r>))
	mod_hand_r = ((<mod_hand_r> * <unmod_hit_hand_r>) + (1.0 * (1.0 - <unmod_hit_hand_r>)))
	mod_hand_l = ((<oldmod_hand_l> * (1.0 - <timer_base_hand_l>)) + (<newmod_hand_l> * <timer_base_hand_l>))
	mod_hand_l = ((<mod_hand_l> * <unmod_hit_hand_l>) + (1.0 * (1.0 - <unmod_hit_hand_l>)))
	mod_hand_r = (<mod_hand_r> * <mod_overdrive_hand_r>)
	mod_hand_l = (<mod_hand_l> * <mod_overdrive_hand_l>)
	index = 0
	begin
	(<drummer_ids> [<index>]) :Obj_SpawnScriptNow set_drummer_active_values params = {
		av_drum_anim_hand_l = <timer_base_hand_l>
		av_drum_anim_hand_r = <timer_base_hand_r>
		av_drum_anim_foot_r = <timer_base_foot_r>
		av_drum_blend_hand_l = <blend_hand_l>
		av_drum_blend_hand_r = <blend_hand_r>
		av_drum_blend_foot_r = <blend_foot_r>
		av_drum_blend_hh_kit = <av_drum_blend_hh_kit>
		av_drum_mod_loop_body = <unmod_body>
		av_drum_mod_hand_r = <mod_hand_r>
		av_drum_mod_hand_l = <mod_hand_l>
		av_drum_mod_foot_r = <mod_foot_r>
		av_drum_ik_hand_l = <av_drum_ik_hand_l>
		av_drum_ik_hand_r = <av_drum_ik_hand_r>
	}
	index = (<index> + 1)
	repeat <num_drummers>
	GetSongTimeMs \{time_offset = 0.0}
	if ((<timer_ms_foot_l> / <frame_length>) < 1E-06)
		getnumframes_foot_l = 1E-06
	else
		getnumframes_foot_l = (<timer_ms_foot_l> / <frame_length>)
	endif
	animstep_foot_l = ((1 - <timer_base_foot_l>) / <getnumframes_foot_l>)
	if (<timer_ms_foot_l> > <drum_slowest_foot_hit_l>)
		timer_base_foot_l = <timer_base_foot_l>
	else
		timer_base_foot_l = (<timer_base_foot_l> + <animstep_foot_l>)
	endif
	if (<timer_base_foot_l> > 1.0)
		timer_base_foot_l = 1.0
	endif
	old_timer_base_hand_r = <timer_base_hand_r>
	old_timer_base_hand_l = <timer_base_hand_l>
	old_timer_base_foot_r = <timer_base_foot_r>
	old_frame_length = <frame_length>
	time_to_hit_1 = (<time_to_hit_1> - <frame_length>)
	time_to_hit_foot_l = (<time_to_hit_foot_l> - <frame_length>)
	time_to_hit_foot_r = (<time_to_hit_foot_r> - <frame_length>)
	timer_ms_hand_r = (<timer_ms_hand_r> - <frame_length>)
	timer_ms_hand_l = (<timer_ms_hand_l> - <frame_length>)
	timer_ms_foot_r = (<timer_ms_foot_r> - <frame_length>)
	timer_ms_foot_l = (<timer_ms_foot_l> - <frame_length>)
	if ((<timer_base_hand_r> >= (<drum_idlepoint_arm_shit>)) && (<timer_ms_hand_r> > <drummer_idlepoint_arm_ms>))
		timer_base_hand_r = <timer_base_hand_r>
	else
		timer_base_hand_r = (<timer_base_hand_r> + <animstep_hand_r>)
	endif
	if ((<timer_base_hand_l> >= (<drum_idlepoint_arm_shit>)) && (<timer_ms_hand_l> > <drummer_idlepoint_arm_ms>))
		timer_base_hand_l = <timer_base_hand_l>
	else
		timer_base_hand_l = (<timer_base_hand_l> + <animstep_hand_l>)
	endif
	if ((<timer_base_foot_r> >= (<drum_idlepoint_foot_hit>)) && (<timer_ms_foot_r> > <drummer_idlepoint_foot_ms>))
		timer_base_foot_r = <timer_base_foot_r>
	else
		timer_base_foot_r = (<timer_base_foot_r> + <animstep_foot_r>)
	endif
	Wait \{1
		gameframe}
	first_hit = FALSE
	repeat
endscript

script check_for_drummers 
	array = []
	num_drummers = 0
	musician_id = musician1
	musician_info = musician1_info
	index = 0
	begin
	switch <index>
		case 0
		musician_id = musician1
		musician_info = musician1_info
		case 1
		musician_id = musician2
		musician_info = musician2_info
		case 2
		musician_id = musician3
		musician_info = musician3_info
		case 3
		musician_id = musician4
		musician_info = musician4_info
	endswitch
	if ($<musician_info>.part = drum)
		addchecksumarrayelement array = <array> element = <musician_id>
		num_drummers = (<num_drummers> + 1)
		if (<num_drummers> >= $number_drummers_created)
			break
		endif
	endif
	index = (<index> + 1)
	repeat 4
	if (<num_drummers> > 0)
		return true drummer_ids = <array> num_drummers = <num_drummers>
	else
		return \{FALSE}
	endif
endscript
