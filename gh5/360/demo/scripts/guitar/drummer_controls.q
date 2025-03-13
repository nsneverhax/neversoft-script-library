drum_idlepoint_arm_shit = 0.4521
drum_idlepoint_arm_mhit = 0.125
drum_idlepoint_foot_hit = 0.391
drum_slowest_arm_hit = 2433.33
drum_medium_arm_hit = 533.33
drum_fastest_arm_hit = 166.66
drummer_offset = 0.3
last_time_to_hit_r = 1000.0
last_time_to_hit_l = 1000.0
use_db_branch_l = 1
use_db_branch_r = 1
use_db_base = 1
current_db_base = 1
drummer_idle = true
longest_transit = 5000.0
number_drummers_created = 4

script drummer_controlscript 
	last_hit = false
	first_hit = true
	target = 0
	drum_target_r = 0
	drum_target_l = 0
	pl = 0.0
	pr = 0.0
	priority = 0.0
	time_to_hit_1 = 0.0
	time_to_hit_2 = 0.0
	time_to_hit_3 = 0.0
	time_to_hit_4 = 0.0
	time_to_hit_5 = 0.0
	time_to_hit_6 = 0.0
	hit_velocity_1_1 = 0
	hit_velocity_2_1 = 0
	hit_velocity_3_1 = 0
	hit_velocity_4_1 = 0
	hit_velocity_5_1 = 0
	hit_velocity_6_1 = 0
	hit_velocity_1_2 = 0
	hit_velocity_2_2 = 0
	hit_velocity_3_2 = 0
	hit_velocity_4_2 = 0
	hit_velocity_5_2 = 0
	hit_velocity_6_2 = 0
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
	note_ascend_2 = none
	note_ascend_3 = none
	note_ascend_4 = none
	note_ascend_5 = none
	note_descend_2 = none
	note_descend_3 = none
	note_descend_4 = none
	note_descend_5 = none
	drum_target_hit_string_l = ''
	drum_target_hit_string_r = ''
	drum_new_state_string = ''
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
	start_hit_r = false
	start_hit_l = false
	start_hit_foot_r = false
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
	drum_pattern_exists = false
	drum_pattern_start = 0
	drum_pattern_end = 0
	drum_pattern_value_l = 1
	drum_pattern_value_r = 1
	time_to_hit_1 = -1.0
	time_to_hit_foot_l = -1.0
	time_to_hit_foot_r = -1.0
	drum_was_patterned = false
	drum_hit = -1
	longest_transit = $longest_transit
	long_arm = none
	drummer_offset = ($drummer_offset * 1000.0)
	drummer_ids = []
	num_drummers = 0
	if NOT check_for_drummers
		return
	endif
	current_song = none
	gman_songtool_getcurrentsong
	song_prefix = ''
	get_song_prefix song = <current_song>
	extendcrcwithstring checksum = `` string = <song_prefix>
	arrayprefix = <extendedchecksum>
	extendcrcwithstring checksum = <arrayprefix> string = '_drums_notes'
	event_array = <extendedchecksum>
	if NOT globalexists name = <event_array> type = array
		return
	endif
	fastgetarraysize array = $<event_array>
	if (<array_size> = 0)
		return
	endif
	spawnscriptnow \{drummer_current_tempo}
	intialize_notehit_data current_song = <current_song>
	prep_notehit_data <...>
	change \{last_drumnote_rightfoot_time = 0}
	change \{last_drumnote_leftfoot_time = 0}
	change \{next_drumnote_leftfoot_entry = 0}
	change \{next_drumnote_rightfoot_entry = 0}
	begin
	getsongtimems time_offset = <drummer_offset>
	if (<time> >= -2000.0)
		break
	endif
	wait \{1
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
		if (<time_to_hit_foot_r> <= 0.0)
			time_to_hit_foot_r = 1.0
		endif
		start_hit_foot_r = true
	endif
	if (<time_to_hit_1> <= 0.0)
		drum_hit = (<drum_hit> + 1)
		miss2 = (<old_frame_length> - (<time_to_hit_1> + <old_frame_length>))
		getsongtimems time_offset = <drummer_offset>
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
		setarrayelement arrayname = drumnote_times globalarray index = 0 newvalue = <old_time>
		old_time = ($drumnote_times [2])
		setarrayelement arrayname = drumnote_times globalarray index = 1 newvalue = <old_time>
		old_time = ($drumnote_times [3])
		setarrayelement arrayname = drumnote_times globalarray index = 2 newvalue = <old_time>
		old_time = ($drumnote_times [4])
		setarrayelement arrayname = drumnote_times globalarray index = 3 newvalue = <old_time>
		old_time = ($drumnote_times [5])
		setarrayelement arrayname = drumnote_times globalarray index = 4 newvalue = <old_time>
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
		if (<time_to_hit_1> = 1000000.0)
			last_hit = true
		endif
		time_to_hit_1 = (<time_to_hit_1> - <miss>)
		if (<time_to_hit_1> <= 0.0)
			time_to_hit_1 = 1.0
		endif
		if (<pieces_value_1_1> = 0)
			hit_velocity_1_1 = 127.0
			hit_velocity_1_2 = 127.0
			num_pieces_hit_1 = 2
			tapin = true
		else
			tapin = false
		endif
		if (<drum_target_distance_l> > 0)
			drum_target_distance_l = (<drum_target_distance_l> - 1)
		endif
		if (<drum_target_distance_r> > 0)
			drum_target_distance_r = (<drum_target_distance_r> - 1)
		endif
		if (<drum_target_distance_r> = 0 && <drum_target_distance_l> = 0)
			resetlogic = true
		else
			resetlogic = false
		endif
		if (<drum_target_distance_l> = 0)
			start_hit_l = true
			drum_current_value_l = <drum_target_value_l>
		else
			start_hit_l = false
		endif
		if (<drum_target_distance_r> = 0)
			start_hit_r = true
			drum_current_value_r = <drum_target_value_r>
		else
			start_hit_r = false
		endif
		order_priority = 0.3
		drummer_priority_init {
			strength = 1.0
			num = <num_pieces_hit_1>
			l = <pieces_value_1_1>
			r = <pieces_value_1_2>
		}
		priority_1_l = <pl>
		priority_1_r = <pr>
		drummer_priority_init {
			strength = (1.0 - ((1.0 - <order_priority>) * 0.2))
			num = <num_pieces_hit_2>
			l = <pieces_value_2_1>
			r = <pieces_value_2_2>
		}
		priority_2_l = <pl>
		priority_2_r = <pr>
		drummer_priority_init {
			strength = (1.0 - ((1.0 - <order_priority>) * 0.4))
			num = <num_pieces_hit_3>
			l = <pieces_value_3_1>
			r = <pieces_value_3_2>
		}
		priority_3_l = <pl>
		priority_3_r = <pr>
		drummer_priority_init {
			strength = (1.0 - ((1.0 - <order_priority>) * 0.6))
			num = <num_pieces_hit_4>
			l = <pieces_value_4_1>
			r = <pieces_value_4_2>
		}
		priority_4_l = <pl>
		priority_4_r = <pr>
		drummer_priority_init {
			strength = (1.0 - ((1.0 - <order_priority>) * 0.8))
			num = <num_pieces_hit_5>
			l = <pieces_value_5_1>
			r = <pieces_value_5_2>
		}
		priority_5_l = <pl>
		priority_5_r = <pr>
		drummer_priority_init {
			strength = <order_priority>
			num = <num_pieces_hit_6>
			l = <pieces_value_6_1>
			r = <pieces_value_6_2>
		}
		priority_6_l = <pl>
		priority_6_r = <pr>
		check_furthest_possible_l {
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
			priority_2_l = <priority_2_l>
			priority_3_l = <priority_3_l>
			priority_4_l = <priority_4_l>
			priority_5_l = <priority_5_l>
			priority_6_l = <priority_6_l>
		}
		check_furthest_possible_r {
			pieces_value_2_2 = <pieces_value_2_2>
			pieces_value_3_2 = <pieces_value_3_2>
			pieces_value_4_2 = <pieces_value_4_2>
			pieces_value_5_2 = <pieces_value_5_2>
			pieces_value_6_2 = <pieces_value_6_2>
			pieces_value_1_1 = <pieces_value_1_1>
			pieces_value_2_1 = <pieces_value_2_1>
			pieces_value_3_1 = <pieces_value_3_1>
			pieces_value_4_1 = <pieces_value_4_1>
			pieces_value_5_1 = <pieces_value_5_1>
			priority_2_l = <priority_2_l>
			priority_3_l = <priority_3_l>
			priority_4_l = <priority_4_l>
			priority_5_l = <priority_5_l>
			priority_6_l = <priority_6_l>
		}
		prioritize_time_to_hit_slow {
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
			time2 = <time_to_hit_2>
			time3 = <time_to_hit_3>
			time4 = <time_to_hit_4>
			time5 = <time_to_hit_5>
			time6 = <time_to_hit_6>
		}
		prioritize_time_to_hit_fast {
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
			time1 = <time_to_hit_1>
			time2 = <time_to_hit_2>
			time3 = <time_to_hit_3>
			time4 = <time_to_hit_4>
			time5 = <time_to_hit_5>
			time6 = <time_to_hit_6>
			pieces_value_1_2 = <pieces_value_1_2>
			pieces_value_2_2 = <pieces_value_2_2>
			pieces_value_3_2 = <pieces_value_3_2>
			pieces_value_4_2 = <pieces_value_4_2>
			pieces_value_5_2 = <pieces_value_5_2>
			pieces_value_6_2 = <pieces_value_6_2>
			pieces_value_1_1 = <pieces_value_1_1>
			pieces_value_2_1 = <pieces_value_2_1>
			pieces_value_3_1 = <pieces_value_3_1>
			pieces_value_4_1 = <pieces_value_4_1>
			pieces_value_5_1 = <pieces_value_5_1>
			pieces_value_6_1 = <pieces_value_6_1>
		}
		prioritize_piece_value {
			hand = r
			priority_1 = <priority_1_r>
			priority_2 = <priority_2_r>
			priority_3 = <priority_3_r>
			priority_4 = <priority_4_r>
			priority_5 = <priority_5_r>
			priority_6 = <priority_6_r>
			value_1 = <pieces_value_1_2>
			value_2 = <pieces_value_2_2>
			value_3 = <pieces_value_3_2>
			value_4 = <pieces_value_4_2>
			value_5 = <pieces_value_5_2>
			value_6 = <pieces_value_6_2>
			test_value = <drum_target_value_r>
		}
		prioritize_piece_value {
			hand = l
			priority_1 = <priority_1_l>
			priority_2 = <priority_2_l>
			priority_3 = <priority_3_l>
			priority_4 = <priority_4_l>
			priority_5 = <priority_5_l>
			priority_6 = <priority_6_l>
			value_1 = <pieces_value_1_1>
			value_2 = <pieces_value_2_1>
			value_3 = <pieces_value_3_1>
			value_4 = <pieces_value_4_1>
			value_5 = <pieces_value_5_1>
			value_6 = <pieces_value_6_1>
			test_value = <drum_target_value_l>
		}
		if (<resetlogic> = true)
		elseif (<drum_target_distance_r> > 1)
			priority_1_l = 1000000.0
		elseif (<drum_target_distance_l> > 1)
			priority_1_r = 1000000.0
		elseif (<drum_target_distance_r> = 1)
			if (<num_pieces_hit_1> = 1)
				priority_1_l = 0.0
			endif
		elseif (<drum_target_distance_l> = 1)
			if (<num_pieces_hit_1> = 1)
				priority_1_r = 0.0
			endif
		endif
		if (<num_pieces_hit_1> = 2)
			priority_2_l = 0.0
			priority_2_r = 0.0
			priority_3_l = 0.0
			priority_3_r = 0.0
			priority_4_l = 0.0
			priority_4_r = 0.0
			priority_5_l = 0.0
			priority_5_r = 0.0
			priority_6_l = 0.0
			priority_6_r = 0.0
		elseif (<num_pieces_hit_2> = 2)
			priority_3_l = 0.0
			priority_3_r = 0.0
			priority_4_l = 0.0
			priority_4_r = 0.0
			priority_5_l = 0.0
			priority_5_r = 0.0
			priority_6_l = 0.0
			priority_6_r = 0.0
		elseif (<num_pieces_hit_3> = 2)
			priority_4_l = 0.0
			priority_4_r = 0.0
			priority_5_l = 0.0
			priority_5_r = 0.0
			priority_6_l = 0.0
			priority_6_r = 0.0
		elseif (<num_pieces_hit_4> = 2)
			priority_5_l = 0.0
			priority_5_r = 0.0
			priority_6_l = 0.0
			priority_6_r = 0.0
		elseif (<num_pieces_hit_5> = 2)
			priority_6_l = 0.0
			priority_6_r = 0.0
		endif
		if (<start_hit_r> = true)
			choose_highest_priority {
				p1 = <priority_1_r>
				p2 = <priority_2_r>
				p3 = <priority_3_r>
				p4 = <priority_4_r>
				p5 = <priority_5_r>
				p6 = <priority_6_r>
			}
			drum_target_r = <target>
			extract_target_info {
				target = <drum_target_r>
				p1 = <priority_1_r>
				p2 = <priority_2_r>
				p3 = <priority_3_r>
				p4 = <priority_4_r>
				p5 = <priority_5_r>
				p6 = <priority_6_r>
				pieces_value_1 = <pieces_value_1_2>
				pieces_value_2 = <pieces_value_2_2>
				pieces_value_3 = <pieces_value_3_2>
				pieces_value_4 = <pieces_value_4_2>
				pieces_value_5 = <pieces_value_5_2>
				pieces_value_6 = <pieces_value_6_2>
			}
			drum_target_distance_r = <distance>
			drum_target_value_r = <value>
			drum_target_priority_r = <priority>
		endif
		if (<start_hit_l> = true)
			choose_highest_priority {
				p1 = <priority_1_l>
				p2 = <priority_2_l>
				p3 = <priority_3_l>
				p4 = <priority_4_l>
				p5 = <priority_5_l>
				p6 = <priority_6_l>
			}
			drum_target_l = <target>
			extract_target_info {
				target = <drum_target_l>
				p1 = <priority_1_l>
				p2 = <priority_2_l>
				p3 = <priority_3_l>
				p4 = <priority_4_l>
				p5 = <priority_5_l>
				p6 = <priority_6_l>
				pieces_value_1 = <pieces_value_1_1>
				pieces_value_2 = <pieces_value_2_1>
				pieces_value_3 = <pieces_value_3_1>
				pieces_value_4 = <pieces_value_4_1>
				pieces_value_5 = <pieces_value_5_1>
				pieces_value_6 = <pieces_value_6_1>
			}
			drum_target_distance_l = <distance>
			drum_target_value_l = <value>
			drum_target_priority_l = <priority>
		endif
		if (<resetlogic> = true)
			if (<drum_target_priority_l> > <drum_target_priority_r>)
				if (<drum_target_distance_l> = 1)
					if (<num_pieces_hit_1> = 1)
						priority_1_r = 0.0
						choose_highest_priority {
							p1 = <priority_1_r>
							p2 = <priority_2_r>
							p3 = <priority_3_r>
							p4 = <priority_4_r>
							p5 = <priority_5_r>
							p6 = <priority_6_r>
						}
						drum_target_r = <target>
						extract_target_info {
							target = <drum_target_r>
							p1 = <priority_1_r>
							p2 = <priority_2_r>
							p3 = <priority_3_r>
							p4 = <priority_4_r>
							p5 = <priority_5_r>
							p6 = <priority_6_r>
							pieces_value_1 = <pieces_value_1_2>
							pieces_value_2 = <pieces_value_2_2>
							pieces_value_3 = <pieces_value_3_2>
							pieces_value_4 = <pieces_value_4_2>
							pieces_value_5 = <pieces_value_5_2>
							pieces_value_6 = <pieces_value_6_2>
						}
						drum_target_distance_r = <distance>
						drum_target_value_r = <value>
						drum_target_priority_r = <priority>
					endif
				else
					drum_target_distance_r = 1
					drum_target_value_r = <pieces_value_1_2>
					drum_target_priority_r = <priority_1_r>
				endif
			else
				if (<drum_target_distance_r> = 1)
					if (<num_pieces_hit_1> = 1)
						priority_1_l = 0.0
						choose_highest_priority {
							p1 = <priority_1_l>
							p2 = <priority_2_l>
							p3 = <priority_3_l>
							p4 = <priority_4_l>
							p5 = <priority_5_l>
							p6 = <priority_6_l>
						}
						drum_target_l = <target>
						extract_target_info {
							target = <drum_target_l>
							p1 = <priority_1_l>
							p2 = <priority_2_l>
							p3 = <priority_3_l>
							p4 = <priority_4_l>
							p5 = <priority_5_l>
							p6 = <priority_6_l>
							pieces_value_1 = <pieces_value_1_1>
							pieces_value_2 = <pieces_value_2_1>
							pieces_value_3 = <pieces_value_3_1>
							pieces_value_4 = <pieces_value_4_1>
							pieces_value_5 = <pieces_value_5_1>
							pieces_value_6 = <pieces_value_6_1>
						}
						drum_target_distance_l = <distance>
						drum_target_value_l = <value>
						drum_target_priority_l = <priority>
					endif
				else
					drum_target_distance_l = 1
					if (<priority_1_l> > <priority_1_l>)
						drum_target_value_l = <pieces_value_1_2>
						drum_target_priority_l = <priority_1_l>
					else
						drum_target_value_l = <pieces_value_1_1>
						drum_target_priority_l = <priority_1_l>
					endif
				endif
			endif
		endif
		begin_transition_r = false
		begin_transition_l = false
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
			should_idle = false
		endif
		create_target_state value_l = <drum_target_value_l> value_r = <drum_target_value_r>
		drum_new_state_string = <state_string>
		drum_old_long_string = 'S1T3'
		drum_new_long_string = 'S1T3'
		drum_new_short_string = 'S1T3'
		drum_old_short_string = 'S1T3'
		if (<drum_target_distance_r> = <drum_target_distance_l>)
			drum_new_state_string_r = <drum_new_state_string>
			drum_new_state_string_l = <drum_new_state_string>
			if (<long_arm> = none)
				create_target_state_full value_l = <drum_current_value_l> value_r = <drum_current_value_r>
				drum_old_long_string = <state_string>
				transit_type = long
				time_to_trans_long = <time_to_hit_1>
				drum_new_long_string = <drum_new_state_string>
			elseif (<long_arm> = l)
				create_target_state_full value_l = <drum_current_value_l> value_r = <drum_target_value_r>
				drum_old_short_string = <state_string>
				transit_type = short
				drum_new_short_string = <drum_new_state_string>
			elseif (<long_arm> = r)
				create_target_state_full value_l = <drum_target_value_l> value_r = <drum_current_value_r>
				drum_old_short_string = <state_string>
				transit_type = short
				drum_new_short_string = <drum_new_state_string>
			endif
			long_arm = none
		elseif (<drum_target_distance_r> > <drum_target_distance_l>)
			switch ((<drum_target_distance_r> -1))
				case 0
				note = <drum_target_value_l>
				case 1
				note = <pieces_value_1_2>
				case 2
				note = <pieces_value_2_2>
				case 3
				note = <pieces_value_3_2>
				case 4
				note = <pieces_value_4_2>
				case 5
				note = <pieces_value_5_2>
			endswitch
			create_target_state value_l = <note> value_r = <drum_target_value_r>
			drum_new_state_string_r = <state_string>
			drum_new_state_string_l = <drum_new_state_string>
			if (<resetlogic> = true)
				create_target_state_full value_l = <drum_target_value_l> value_r = <drum_current_value_r>
				drum_old_long_string = <state_string>
				transit_type = long
				time_to_trans_long = <time_to_hit_r>
				drum_new_long_string = <drum_new_state_string>
			elseif (<start_hit_r> = true)
				create_target_state_full value_l = <drum_target_value_l> value_r = <drum_current_value_r>
				drum_old_long_string = <state_string>
				transit_type = long
				time_to_trans_long = <time_to_hit_r>
				drum_new_long_string = <drum_new_state_string>
			elseif (<start_hit_l> = true)
				create_target_state_full value_l = <drum_target_value_l> value_r = <drum_current_value_r>
				drum_old_short_string = <state_string>
				transit_type = short
				drum_new_short_string = <drum_new_state_string>
			endif
			long_arm = r
		elseif (<drum_target_distance_r> < <drum_target_distance_l>)
			switch ((<drum_target_distance_l> -1))
				case 0
				note = <drum_target_value_r>
				case 1
				note = <pieces_value_1_2>
				case 2
				note = <pieces_value_2_2>
				case 3
				note = <pieces_value_3_2>
				case 4
				note = <pieces_value_4_2>
				case 5
				note = <pieces_value_5_2>
			endswitch
			create_target_state value_l = <drum_target_value_l> value_r = <note>
			drum_new_state_string_l = <state_string>
			drum_new_state_string_r = <drum_new_state_string>
			if (<resetlogic> = true)
				create_target_state_full value_l = <drum_current_value_l> value_r = <drum_target_value_r>
				drum_old_long_string = <state_string>
				transit_type = long
				time_to_trans_long = <time_to_hit_l>
				drum_new_long_string = <drum_new_state_string>
			elseif (<start_hit_l> = true)
				create_target_state_full value_l = <drum_current_value_l> value_r = <drum_target_value_r>
				drum_old_long_string = <state_string>
				transit_type = long
				time_to_trans_long = <time_to_hit_l>
				drum_new_long_string = <drum_new_state_string>
			elseif (<start_hit_r> = true)
				create_target_state_full value_l = <drum_current_value_l> value_r = <drum_target_value_r>
				drum_old_short_string = <state_string>
				transit_type = short
				drum_new_short_string = <drum_new_state_string>
			endif
			long_arm = l
		endif
		spawnscriptnow hold_transit_requests params = {
			l = <start_hit_l>
			r = <start_hit_r>
			type = <transit_type>
			last_hit = <last_hit>
			num_drummers = <num_drummers>
			drummer_ids = <drummer_ids>
			time_to_hit_r = <time_to_hit_r>
			time_to_hit_l = <time_to_hit_l>
			drum_new_state_string_r = <drum_new_state_string_r>
			drum_new_state_string_l = <drum_new_state_string_l>
			tapin = <tapin>
			should_idle = <should_idle>
			time_to_hit_1 = <time_to_hit_1>
			time_to_trans_long = <time_to_trans_long>
			time_to_trans_short = <time_to_hit_1>
			drum_old_long_string = <drum_old_long_string>
			drum_new_long_string = <drum_new_state_string>
			drum_new_short_string = <drum_new_state_string>
			drum_old_short_string = <drum_old_short_string>
		}
	endif
	getframelength
	frame_length1 = (<frame_length> * 1000.0)
	wait \{1
		frame}
	getframelength
	frame_length = ((<frame_length> * 1000.0) + <frame_length1>)
	if (<drum_foot_index_l> = open)
		av_drum_blend_hh_kit = <timer_base_foot_l>
	else
		av_drum_blend_hh_kit = (1 - <timer_base_foot_l>)
	endif
	if (<start_hit_r> = true)
		spawnscriptnow hold_drumkit_piece params = {drummer_ids = <drummer_ids> num_drummers = <num_drummers> strength = <newmod_hand_r> pieces_hit = <drum_current_value_r>}
		oldmod_hand_r = <newmod_hand_r>
		normalize_velocities value = <drum_target_value_r> velocity = <drum_target_velocity_r>
		newmod_hand_r = <velocity>
		timer_ms_hand_r = <time_to_hit_r>
		target_ms_hand_r = <time_to_hit_r>
		if (<first_hit> = false)
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
		start_hit_r = false
	endif
	if (<start_hit_l> = true)
		spawnscriptnow hold_drumkit_piece params = {drummer_ids = <drummer_ids> num_drummers = <num_drummers> strength = <newmod_hand_l> pieces_hit = <drum_current_value_l>}
		oldmod_hand_l = <newmod_hand_l>
		normalize_velocities value = <drum_target_value_l> velocity = <drum_target_velocity_l>
		newmod_hand_l = <velocity>
		timer_ms_hand_l = <time_to_hit_l>
		target_ms_hand_l = <time_to_hit_l>
		if (<first_hit> = false)
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
		start_hit_l = false
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
		if (<first_hit> = false)
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
		start_hit_foot_r = false
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
	spawnscriptnow hold_active_values params = {
		num_drummers = <num_drummers>
		drummer_ids = <drummer_ids>
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
	getsongtimems time_offset = <drummer_offset>
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
	wait \{1
		frame}
	first_hit = false
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
		return \{false}
	endif
endscript
