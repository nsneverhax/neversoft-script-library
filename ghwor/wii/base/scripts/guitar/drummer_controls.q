drum_idlepoint_arm_shit = 0.4521
drum_idlepoint_arm_mhit = 0.125
drum_idlepoint_foot_hit = 0.391
g_drum_hit_heavy_slowest = 2433.33
g_drum_hit_heavy_medium = 533.33
g_drum_hit_heavy_fastest = 166.66
g_drum_soft_hit_percent_of_heavy_hit = 0.5
drummer_offset = 0.3
last_time_to_hit_r = 1000.0
last_time_to_hit_l = 1000.0
use_db_branch_l = 1
use_db_branch_r = 1
use_db_base = 1
current_db_base = 1
drummer_idle = true
longest_transit = 5000.0
g_drummer_lookat_control_priority_hijacked = 0
g_drummer_target_lookat_fastest = 200.0
g_drummer_target_lookat_slowest = 550.0
g_drummer_target_lookat_before_hitting_target = 150.0
number_drummers_created = 4
g_autodrummer_active = FALSE

script drummer_controlscript 
	av_drum_face_rock = 0.0
	smooth_drum_face_rock = 0.0
	old_smooth_drum_face_rock = 0.0
	drum_face_rock_target = 0.0
	current_facial_max_ascent_time = 0.0
	createstructurequeue \{queue_name = drum_lookat_queue}
	last_hit = FALSE
	first_hit = true
	target = 0
	pl = 0.0
	pr = 0.0
	Priority = 0.0
	time_to_hit_1 = 0.0
	time_to_hit_2 = 0.0
	time_to_hit_3 = 0.0
	time_to_hit_4 = 0.0
	time_to_hit_5 = 0.0
	time_to_hit_6 = 0.0
	drummer_choose_hand_1 = None
	drummer_choose_hand_2 = None
	drummer_choose_hand_3 = None
	drummer_choose_hand_4 = None
	drummer_choose_hand_5 = None
	drummer_choose_hand_6 = None
	hit_velocity_1_1 = 0.0
	hit_velocity_2_1 = 0.0
	hit_velocity_3_1 = 0.0
	hit_velocity_4_1 = 0.0
	hit_velocity_5_1 = 0.0
	hit_velocity_6_1 = 0.0
	hit_velocity_1_2 = 0.0
	hit_velocity_2_2 = 0.0
	hit_velocity_3_2 = 0.0
	hit_velocity_4_2 = 0.0
	hit_velocity_5_2 = 0.0
	hit_velocity_6_2 = 0.0
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
	drum_new_state_string = ''
	random_mod_foot_r = 0.0
	velocity = 72.0
	old_lookat_target1 = 0
	old_lookat_target2 = 0
	hit_info = []
	drum_hit_heavy_slowest = ($g_drum_hit_heavy_slowest)
	drum_hit_heavy_medium = ($g_drum_hit_heavy_medium)
	drum_hit_heavy_fastest = ($g_drum_hit_heavy_fastest)
	drum_hit_soft_slowest = ($g_drum_hit_heavy_slowest)
	drum_hit_soft_medium = ($g_drum_hit_heavy_medium * (1 / ($g_drum_soft_hit_percent_of_heavy_hit)))
	drum_hit_soft_fastest = ($g_drum_hit_heavy_fastest * (1 / ($g_drum_soft_hit_percent_of_heavy_hit)))
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
	timer_base_foot_l = 1000000.0
	timer_ms_foot_l = 1000000.0
	drum_foot_index_l = close
	frame_length = 33.369
	old_frame_length = 33.369
	drum_anim_foot_l = 0.0
	drummer_idlepoint_arm_ms = ((<drum_hit_heavy_slowest> * (1 - <drum_idlepoint_arm_shit>)) - <frame_length>)
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
	long_arm = None
	drummer_offset = ($drummer_offset * 1000.0)
	drummer_ids = []
	num_drummers = 0
	if NOT check_for_drummers
		return
	endif
	index = 0
	begin
	(<drummer_ids> [<index>]) :Obj_SpawnScriptNow default_drummer_state params = {time_to_trans = 0.0 currentset = 1}
	(<drummer_ids> [<index>]) :Obj_SpawnScriptNow drummer_transit_idles params = {state = in tapin = true currentset = 1 last_hit = FALSE BlendDuration = 0.0}
	repeat <num_drummers>
	current_song = None
	playlist_getcurrentsong
	song_prefix = ''
	get_song_prefix song = <current_song>
	extendcrcwithstring checksum = `` string = <song_prefix>
	arrayprefix = <extended_checksum>
	extendcrcwithstring checksum = <arrayprefix> string = '_drums_notes'
	event_array = <extended_checksum>
	if NOT songglobalexists Name = <event_array>
		return
	endif
	getsongarraysize <event_array>
	if (<array_Size> = 0)
		return
	endif
	initialize_notehit_data current_song = <current_song>
	prep_notehit_data {
		hit_info = <hit_info>
	}
	changeglobalinteger \{global_name = last_drumnote_rightfoot_time
		new_value = 0}
	changeglobalinteger \{global_name = last_drumnote_leftfoot_time
		new_value = 0}
	changeglobalinteger \{global_name = next_drumnote_leftfoot_entry
		new_value = 0}
	changeglobalinteger \{global_name = next_drumnote_rightfoot_entry
		new_value = 0}
	begin
	GetSongTimeMs time_offset = <drummer_offset>
	if (<time> >= -2000.0)
		break
	endif
	WaitOneGameFrame
	repeat
	flamfinder {
		arrayprefix = <arrayprefix>
		event_array = <event_array>
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
	begin
	if ($pause_grace_period > 0.0)
		begin
		if ($pause_grace_period <= 0.0)
			break
		endif
		WaitOneGameFrame
		repeat
	endif
	if (<time_to_hit_foot_l> <= 0.0)
		updatenotehitdataleftfootfast arrayprefix = <arrayprefix> event_array = <event_array>
		pieces_hit_foot_l = <pieces_hit_foot_l>
		time_to_hit_foot_l = <time_to_hit_foot_l>
		if (<pieces_hit_foot_l> = nothing)
		else
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
		endif
		if (<time_to_hit_foot_l> <= 0.0)
			time_to_hit_foot_l = 1.0
		endif
		timer_ms_foot_l = <time_to_hit_foot_l>
	endif
	if (<time_to_hit_foot_r> <= 0.0)
		missfoot2 = (<time_to_hit_foot_r> * (0 -1))
		updatenotehitdatarightfootfast arrayprefix = <arrayprefix> event_array = <event_array>
		if (<time_to_hit_foot_r> <= 0.0)
			time_to_hit_foot_r = 1.0
		endif
	endif
	if (<time_to_hit_1> <= 0.0)
		drum_hit = (<drum_hit> + 1)
		miss2 = (<time_to_hit_1> * (0 -1))
		GetSongTimeMs time_offset = <drummer_offset>
		miss = (<time> - ($drumnote_times [0]))
		time_to_hit_1 = <time_to_hit_2>
		time_to_hit_2 = <time_to_hit_3>
		time_to_hit_3 = <time_to_hit_4>
		time_to_hit_4 = <time_to_hit_5>
		time_to_hit_5 = <time_to_hit_6>
		drummer_choose_hand_1 = <drummer_choose_hand_2>
		drummer_choose_hand_2 = <drummer_choose_hand_3>
		drummer_choose_hand_3 = <drummer_choose_hand_4>
		drummer_choose_hand_4 = <drummer_choose_hand_5>
		drummer_choose_hand_5 = <drummer_choose_hand_6>
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
		setglobalintegerarrayelement global_array_name = drumnote_times index = 0 new_value = <old_time>
		old_time = ($drumnote_times [2])
		setglobalintegerarrayelement global_array_name = drumnote_times index = 1 new_value = <old_time>
		old_time = ($drumnote_times [3])
		setglobalintegerarrayelement global_array_name = drumnote_times index = 2 new_value = <old_time>
		old_time = ($drumnote_times [4])
		setglobalintegerarrayelement global_array_name = drumnote_times index = 3 new_value = <old_time>
		old_time = ($drumnote_times [5])
		setglobalintegerarrayelement global_array_name = drumnote_times index = 4 new_value = <old_time>
		updatenotehitdatafast arrayprefix = <arrayprefix> event_array = <event_array>
		if ((<time_to_hit_6> < 50.0) && (<num_pieces_hit_5> = 1) && (<num_pieces_hit_6> = 1))
			offset = <time_to_hit_6>
			num_pieces_hit_5 = 2
			drummer_choose_hand_5 = both
			if (<pieces_value_5_1> <= <pieces_value_6_1>)
				pieces_value_5_2 = <pieces_value_6_1>
				hit_velocity_5_2 = <hit_velocity_6_1>
			else
				pieces_value_5_1 = <pieces_value_6_1>
				hit_velocity_5_1 = <hit_velocity_6_1>
			endif
			updatenotehitdatafast arrayprefix = <arrayprefix> event_array = <event_array>
			time_to_hit_6 = (<time_to_hit_6> + <offset>)
		endif
		if (<time_to_hit_1> = 1000000.0)
			last_hit = true
		endif
		if (<hit_velocity_1_2> > <hit_velocity_1_1>)
			facial_velocity = <hit_velocity_1_2>
		else
			facial_velocity = <hit_velocity_1_1>
		endif
		time_to_hit_1 = (<time_to_hit_1> - <miss>)
		if (<time_to_hit_1> <= 0.0)
			time_to_hit_1 = 1.0
		endif
		if (<pieces_value_1_1> = 0)
			hit_velocity_1_1 = 1.0
			hit_velocity_1_2 = 1.0
			num_pieces_hit_1 = 2
			tapin = true
		else
			tapin = FALSE
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
			resetlogic = FALSE
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
		order_priority = 0.3
		drummer_priority_init {
			Strength = 1.0
			num = <num_pieces_hit_1>
			l = <pieces_value_1_1>
			r = <pieces_value_1_2>
		}
		priority_1_l = <pl>
		priority_1_r = <pr>
		drummer_priority_init {
			Strength = (1.0 - ((1.0 - <order_priority>) * 0.2))
			num = <num_pieces_hit_2>
			l = <pieces_value_2_1>
			r = <pieces_value_2_2>
		}
		priority_2_l = <pl>
		priority_2_r = <pr>
		drummer_priority_init {
			Strength = (1.0 - ((1.0 - <order_priority>) * 0.4))
			num = <num_pieces_hit_3>
			l = <pieces_value_3_1>
			r = <pieces_value_3_2>
		}
		priority_3_l = <pl>
		priority_3_r = <pr>
		drummer_priority_init {
			Strength = (1.0 - ((1.0 - <order_priority>) * 0.6))
			num = <num_pieces_hit_4>
			l = <pieces_value_4_1>
			r = <pieces_value_4_2>
		}
		priority_4_l = <pl>
		priority_4_r = <pr>
		drummer_priority_init {
			Strength = (1.0 - ((1.0 - <order_priority>) * 0.8))
			num = <num_pieces_hit_5>
			l = <pieces_value_5_1>
			r = <pieces_value_5_2>
		}
		priority_5_l = <pl>
		priority_5_r = <pr>
		drummer_priority_init {
			Strength = <order_priority>
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
			priority_2_r = <priority_2_r>
			priority_3_r = <priority_3_r>
			priority_4_r = <priority_4_r>
			priority_5_r = <priority_5_r>
			priority_6_r = <priority_6_r>
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
		if (<drummer_choose_hand_6> = left)
			if (<priority_6_l> = 0.0)
				priority_6_l = 0.01
			endif
			priority_6_r = 0.0
		elseif (<drummer_choose_hand_6> = right)
			priority_6_l = 0.0
			if (<priority_6_r> = 0.0)
				priority_6_r = 0.01
			endif
		endif
		if (<drummer_choose_hand_5> = left)
			if (<priority_5_l> = 0.0)
				priority_5_l = 0.01
			endif
			priority_6_l = 0.0
			priority_5_r = 0.0
		elseif (<drummer_choose_hand_5> = right)
			priority_5_l = 0.0
			if (<priority_5_r> = 0.0)
				priority_5_r = 0.01
			endif
			priority_6_r = 0.0
		endif
		if (<drummer_choose_hand_4> = left)
			if (<priority_4_l> = 0.0)
				priority_4_l = 0.01
			endif
			priority_5_l = 0.0
			priority_6_l = 0.0
			priority_4_r = 0.0
		elseif (<drummer_choose_hand_4> = right)
			priority_4_l = 0.0
			if (<priority_4_r> = 0.0)
				priority_4_r = 0.01
			endif
			priority_5_r = 0.0
			priority_6_r = 0.0
		endif
		if (<drummer_choose_hand_3> = left)
			if (<priority_3_l> = 0.0)
				priority_3_l = 0.01
			endif
			priority_4_l = 0.0
			priority_5_l = 0.0
			priority_6_l = 0.0
			priority_3_r = 0.0
		elseif (<drummer_choose_hand_3> = right)
			priority_3_l = 0.0
			if (<priority_3_r> = 0.0)
				priority_3_r = 0.01
			endif
			priority_4_r = 0.0
			priority_5_r = 0.0
			priority_6_r = 0.0
		endif
		if (<drummer_choose_hand_2> = left)
			if (<priority_2_l> = 0.0)
				priority_2_l = 0.01
			endif
			priority_3_l = 0.0
			priority_4_l = 0.0
			priority_5_l = 0.0
			priority_6_l = 0.0
			priority_2_r = 0.0
		elseif (<drummer_choose_hand_2> = right)
			priority_2_l = 0.0
			if (<priority_2_r> = 0.0)
				priority_2_r = 0.01
			endif
			priority_3_r = 0.0
			priority_4_r = 0.0
			priority_5_r = 0.0
			priority_6_r = 0.0
		endif
		if (<drummer_choose_hand_1> = left)
			priority_1_r = 0.0
			if (<priority_1_l> = 0.0)
				priority_1_l = 0.01
			endif
			priority_2_l = 0.0
			priority_3_l = 0.0
			priority_4_l = 0.0
			priority_5_l = 0.0
			priority_6_l = 0.0
		elseif (<drummer_choose_hand_1> = right)
			priority_1_l = 0.0
			if (<priority_1_r> = 0.0)
				priority_1_r = 0.01
			endif
			priority_2_r = 0.0
			priority_3_r = 0.0
			priority_4_r = 0.0
			priority_5_r = 0.0
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
			drum_target_priority_r = <Priority>
			drum_target_distance_r = <target>
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
			drum_target_priority_l = <Priority>
			drum_target_distance_l = <target>
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
						drum_target_distance_r = <target>
					endif
				else
					drum_target_distance_r = 1
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
						drum_target_distance_l = <target>
					endif
				else
					drum_target_distance_l = 1
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
				drum_target_value_r = <pieces_value_1_2>
				case 2
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2>)
				drum_target_velocity_r = <hit_velocity_2_2>
				drum_target_value_r = <pieces_value_2_2>
				case 3
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3>)
				drum_target_velocity_r = <hit_velocity_3_2>
				drum_target_value_r = <pieces_value_3_2>
				case 4
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4>)
				drum_target_velocity_r = <hit_velocity_4_2>
				drum_target_value_r = <pieces_value_4_2>
				case 5
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4> + <time_to_hit_5>)
				drum_target_velocity_r = <hit_velocity_5_2>
				drum_target_value_r = <pieces_value_5_2>
				case 6
				time_to_hit_r = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4> + <time_to_hit_5> + <time_to_hit_6>)
				drum_target_velocity_r = <hit_velocity_6_2>
				drum_target_value_r = <pieces_value_6_2>
				default
				time_to_hit_r = 100000000.0
				drum_target_velocity_r = 1.0
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
				drum_target_value_l = <pieces_value_1_1>
				case 2
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2>)
				drum_target_velocity_l = <hit_velocity_2_1>
				drum_target_value_l = <pieces_value_2_1>
				case 3
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3>)
				drum_target_velocity_l = <hit_velocity_3_1>
				drum_target_value_l = <pieces_value_3_1>
				case 4
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4>)
				drum_target_velocity_l = <hit_velocity_4_1>
				drum_target_value_l = <pieces_value_4_1>
				case 5
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4> + <time_to_hit_5>)
				drum_target_velocity_l = <hit_velocity_5_1>
				drum_target_value_l = <pieces_value_5_1>
				case 6
				time_to_hit_l = (<time_to_hit_1> + <time_to_hit_2> + <time_to_hit_3> + <time_to_hit_4> + <time_to_hit_5> + <time_to_hit_6>)
				drum_target_velocity_l = <hit_velocity_6_1>
				drum_target_value_l = <pieces_value_6_1>
				default
				time_to_hit_l = 100000000.0
				drum_target_velocity_l = 1.0
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
		create_target_state value_l = <drum_target_value_l> value_r = <drum_target_value_r>
		drum_new_state_string = <state_string>
		drum_old_long_string = 'S1T3'
		drum_new_long_string = 'S1T3'
		drum_new_short_string = 'S1T3'
		drum_old_short_string = 'S1T3'
		if (<drum_target_distance_r> = <drum_target_distance_l>)
			drum_new_state_string_r = <drum_new_state_string>
			drum_new_state_string_l = <drum_new_state_string>
			if (<long_arm> = None)
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
			long_arm = None
		elseif (<drum_target_distance_r> > <drum_target_distance_l>)
			switch ((<drum_target_distance_r> -1))
				case 0
				note_value = <drum_target_value_l>
				case 1
				note_value = <pieces_value_1_2>
				case 2
				note_value = <pieces_value_2_2>
				case 3
				note_value = <pieces_value_3_2>
				case 4
				note_value = <pieces_value_4_2>
				case 5
				note_value = <pieces_value_5_2>
			endswitch
			create_target_state value_l = <note_value> value_r = <drum_target_value_r>
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
				note_value = <drum_target_value_r>
				case 1
				note_value = <pieces_value_1_2>
				case 2
				note_value = <pieces_value_2_2>
				case 3
				note_value = <pieces_value_3_2>
				case 4
				note_value = <pieces_value_4_2>
				case 5
				note_value = <pieces_value_5_2>
			endswitch
			create_target_state value_l = <drum_target_value_l> value_r = <note_value>
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
		fastspawnscriptnow script_name = hold_transit_requests params = {
			l = <start_hit_l>
			r = <start_hit_r>
			Type = <transit_type>
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
	WaitOneGameFrame
	getframelength
	frame_length = ((<frame_length> * 1000.0) + <frame_length1>)
	if (<drum_foot_index_l> = open)
		av_drum_blend_hh_kit = <timer_base_foot_l>
	else
		av_drum_blend_hh_kit = (1 - <timer_base_foot_l>)
	endif
	if (<start_hit_r> = true)
		fastspawnscriptnow script_name = hold_drumkit_piece params = {drummer_ids = <drummer_ids> num_drummers = <num_drummers> Strength = <newmod_hand_r> pieces_hit = <drum_current_value_r>}
		oldmod_hand_r = <newmod_hand_r>
		newmod_hand_r = <drum_target_velocity_r>
		timer_ms_hand_r = <time_to_hit_r>
		target_ms_hand_r = <time_to_hit_r>
		new_drum_hit_slowest_r = ((<drum_hit_heavy_slowest> * <newmod_hand_r>) + (<drum_hit_soft_slowest> * (1 - <newmod_hand_r>)))
		new_drum_hit_medium_r = ((<drum_hit_heavy_medium> * <newmod_hand_r>) + (<drum_hit_soft_medium> * (1 - <newmod_hand_r>)))
		new_drum_hit_fastest_r = ((<drum_hit_heavy_fastest> * <newmod_hand_r>) + (<drum_hit_soft_fastest> * (1 - <newmod_hand_r>)))
		if (<first_hit> = FALSE)
			fractional_animstep = (1 - <getnumframes_hand_r>)
			getnumframes_hand_r = ((<timer_ms_hand_r> + <miss2>) / <old_frame_length>)
			timer_base_hand_r = (1 / <getnumframes_hand_r>)
			if (<timer_base_hand_r> < (<old_frame_length> / <new_drum_hit_slowest_r>))
				timer_base_hand_r = (<old_frame_length> / <new_drum_hit_slowest_r>)
			endif
			timer_base_hand_r = (<timer_base_hand_r> * <fractional_animstep>)
		endif
		if (<time_to_hit_r> < <new_drum_hit_fastest_r>)
			blend_hand_r = 0.0
			mod_overdrive_hand_r = (<time_to_hit_r> / <new_drum_hit_fastest_r>)
		else
			mod_overdrive_hand_r = 1.0
			if (<time_to_hit_r> < <new_drum_hit_medium_r>)
				blend_hand_r = ((<time_to_hit_r> - <new_drum_hit_fastest_r>) / (<new_drum_hit_medium_r> - <new_drum_hit_fastest_r>))
				blend_hand_r = (<blend_hand_r> * 0.5)
			else
				if (<time_to_hit_r> < <new_drum_hit_slowest_r>)
					blend_hand_r = ((<time_to_hit_r> - <new_drum_hit_medium_r>) / (<new_drum_hit_slowest_r> - <new_drum_hit_medium_r>))
					blend_hand_r = (0.5 + (<blend_hand_r> * 0.5))
				else
					blend_hand_r = 1.0
				endif
			endif
		endif
		start_hit_r = FALSE
	endif
	if (<start_hit_l> = true)
		fastspawnscriptnow script_name = hold_drumkit_piece params = {drummer_ids = <drummer_ids> num_drummers = <num_drummers> Strength = <newmod_hand_l> pieces_hit = <drum_current_value_l>}
		oldmod_hand_l = <newmod_hand_l>
		newmod_hand_l = <drum_target_velocity_l>
		timer_ms_hand_l = <time_to_hit_l>
		target_ms_hand_l = <time_to_hit_l>
		new_drum_hit_slowest_l = ((<drum_hit_heavy_slowest> * <newmod_hand_l>) + (<drum_hit_soft_slowest> * (1 - <newmod_hand_l>)))
		new_drum_hit_medium_l = ((<drum_hit_heavy_medium> * <newmod_hand_l>) + (<drum_hit_soft_medium> * (1 - <newmod_hand_l>)))
		new_drum_hit_fastest_l = ((<drum_hit_heavy_fastest> * <newmod_hand_l>) + (<drum_hit_soft_fastest> * (1 - <newmod_hand_l>)))
		if (<first_hit> = FALSE)
			fractional_animstep = (1.0 - <getnumframes_hand_l>)
			getnumframes_hand_l = ((<timer_ms_hand_l> + <miss2>) / <old_frame_length>)
			timer_base_hand_l = (1.0 / <getnumframes_hand_l>)
			if (<timer_base_hand_l> < (<old_frame_length> / <new_drum_hit_slowest_l>))
				timer_base_hand_l = (<old_frame_length> / <new_drum_hit_slowest_l>)
			endif
			timer_base_hand_l = (<timer_base_hand_l> * <fractional_animstep>)
		endif
		if (<time_to_hit_l> < <new_drum_hit_fastest_l>)
			blend_hand_l = 0.0
			mod_overdrive_hand_l = (<time_to_hit_l> / <new_drum_hit_fastest_l>)
		else
			mod_overdrive_hand_l = 1.0
			if (<time_to_hit_l> < <new_drum_hit_medium_l>)
				blend_hand_l = ((<time_to_hit_l> - <new_drum_hit_fastest_l>) / (<new_drum_hit_medium_l> - <new_drum_hit_fastest_l>))
				blend_hand_l = (<blend_hand_l> * 0.5)
			else
				if (<time_to_hit_l> < <new_drum_hit_slowest_l>)
					blend_hand_l = ((<time_to_hit_l> - <new_drum_hit_medium_l>) / (<new_drum_hit_slowest_l> - <new_drum_hit_medium_l>))
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
	else
		blend_foot_r = 0.0
		mod_foot_r = 0.91999996
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
		if (<animstep_hand_r> < (<frame_length> / <new_drum_hit_slowest_r>))
			animstep_hand_r = (<frame_length> / <new_drum_hit_slowest_r>)
		endif
	endif
	if (<timer_base_hand_l> < <drum_idlepoint_arm_shit>)
		if (<animstep_hand_l> < (<frame_length> / <new_drum_hit_slowest_r>))
			animstep_hand_l = (<frame_length> / <new_drum_hit_slowest_r>)
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
	mod_hand_r = ((<oldmod_hand_r> * (1.0 - <timer_base_hand_r>)) + (<newmod_hand_r> * <timer_base_hand_r>))
	mod_hand_r = ((<mod_hand_r> * <unmod_hit_hand_r>) + (1.0 * (1.0 - <unmod_hit_hand_r>)))
	mod_hand_l = ((<oldmod_hand_l> * (1.0 - <timer_base_hand_l>)) + (<newmod_hand_l> * <timer_base_hand_l>))
	mod_hand_l = ((<mod_hand_l> * <unmod_hit_hand_l>) + (1.0 * (1.0 - <unmod_hit_hand_l>)))
	if (<blend_hand_r> < 0.5)
		mod_hand_r = (<mod_overdrive_hand_r> * ((<mod_hand_r> * ((<blend_hand_r> -0.5) * 2.0)) + (1.0 - ((<blend_hand_r> -0.5) * 2.0))))
	else
		mod_hand_r = <mod_overdrive_hand_r>
	endif
	if (<blend_hand_l> < 0.5)
		mod_hand_l = (<mod_overdrive_hand_l> * ((<mod_hand_l> * ((<blend_hand_l> -0.5) * 2.0)) + (1.0 - ((<blend_hand_l> -0.5) * 2.0))))
	else
		mod_hand_l = <mod_overdrive_hand_l>
	endif
	facial_degrade_rate = 0.09
	facial_max_ascent_time = 400.0
	facial_ascend_rate = (<frame_length> / <facial_max_ascent_time>)
	if (<time_to_hit_1> < <current_facial_max_ascent_time>)
		if (<av_drum_face_rock> < <drum_face_rock_target>)
			av_drum_face_rock = (<av_drum_face_rock> + <facial_ascend_rate>)
			if (<av_drum_face_rock> > <drum_face_rock_target>)
				av_drum_face_rock = <drum_face_rock_target>
			endif
		else
			drum_face_rock_target = 0.0
			av_drum_face_rock = (<av_drum_face_rock> - <facial_degrade_rate>)
		endif
	else
		av_drum_face_rock = (<av_drum_face_rock> - <facial_degrade_rate>)
		current_facial_max_ascent_time = ((<drum_face_rock_target> - <av_drum_face_rock>) * <facial_max_ascent_time>)
	endif
	if (<av_drum_face_rock> < 0.0)
		av_drum_face_rock = 0.0
	endif
	if (<facial_velocity> > 0.0)
		facial_velocity = (<facial_velocity> * <facial_velocity>)
		drum_face_rock_diff = (1.0 - <av_drum_face_rock>)
		drum_face_rock_diff = (<drum_face_rock_diff> * <facial_velocity>)
		drum_face_rock_target = (<av_drum_face_rock> + <drum_face_rock_diff>)
		facial_velocity = 0.0
	endif
	smooth_drum_face_rock_lerp_rate = 0.4
	smooth_drum_face_rock = (<smooth_drum_face_rock> + ((<av_drum_face_rock> - <old_smooth_drum_face_rock>) * <smooth_drum_face_rock_lerp_rate>))
	old_smooth_drum_face_rock = <smooth_drum_face_rock>
	av_drum_face_rock_final = (<smooth_drum_face_rock> * 1.2)
	fastspawnscriptnow script_name = hold_active_values params = {
		num_drummers = <num_drummers>
		drummer_ids = <drummer_ids>
		av_drum_anim_hand_l = <timer_base_hand_l>
		av_drum_anim_hand_r = <timer_base_hand_r>
		av_drum_anim_foot_r = <timer_base_foot_r>
		av_drum_blend_hand_l = <blend_hand_l>
		av_drum_blend_hand_r = <blend_hand_r>
		av_drum_blend_foot_r = <blend_foot_r>
		av_drum_blend_hh_kit = <av_drum_blend_hh_kit>
		av_drum_mod_hand_r = <mod_hand_r>
		av_drum_mod_hand_l = <mod_hand_l>
		av_drum_mod_foot_r = <mod_foot_r>
		av_drum_ik_hand_l = <av_drum_ik_hand_l>
		av_drum_ik_hand_r = <av_drum_ik_hand_r>
		av_drum_face_rock = <av_drum_face_rock_final>
	}
	GetSongTimeMs time_offset = <drummer_offset>
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
	WaitOneGameFrame
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
