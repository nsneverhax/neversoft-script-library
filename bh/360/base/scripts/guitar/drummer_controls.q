Drum_Idlepoint_Arm_SHit = 0.4521
Drum_Idlepoint_Arm_MHit = 0.125
Drum_Idlepoint_Foot_Hit = 0.391
Drum_Slowest_Arm_Hit = 2433.33
Drum_Medium_Arm_Hit = 533.33
Drum_Fastest_Arm_Hit = 166.66
Drummer_Offset = 0.3
Last_Time_To_Hit_R = 1000.0
Last_Time_To_Hit_L = 1000.0
Use_DB_Branch_L = 1
Use_DB_Branch_R = 1
Use_DB_Base = 1
Current_DB_Base = 1
Drummer_Idle = true
longest_Transit = 5000.0
Number_drummers_Created = 4

script drummer_controlscript 
	Last_Hit = false
	First_Hit = true
	target = 0
	drum_target_r = 0
	drum_target_l = 0
	PL = 0.0
	PR = 0.0
	Priority = 0.0
	time_to_Hit_1 = 0.0
	time_to_Hit_2 = 0.0
	Time_to_Hit_3 = 0.0
	Time_to_Hit_4 = 0.0
	Time_to_Hit_5 = 0.0
	Time_to_Hit_6 = 0.0
	hit_velocity_1_1 = 0
	Hit_Velocity_2_1 = 0
	Hit_Velocity_3_1 = 0
	Hit_Velocity_4_1 = 0
	Hit_Velocity_5_1 = 0
	Hit_Velocity_6_1 = 0
	hit_velocity_1_2 = 0
	Hit_Velocity_2_2 = 0
	Hit_Velocity_3_2 = 0
	Hit_Velocity_4_2 = 0
	Hit_Velocity_5_2 = 0
	Hit_Velocity_6_2 = 0
	num_pieces_hit_1 = 0
	Num_Pieces_Hit_2 = 0
	Num_Pieces_Hit_3 = 0
	Num_Pieces_Hit_4 = 0
	Num_Pieces_Hit_5 = 0
	Num_Pieces_Hit_6 = 0
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
	Drum_New_State_String = ''
	random_mod_foot_r = 0.0
	velocity = 72.0
	Drum_Slowest_Arm_Hit = $Drum_Slowest_Arm_Hit
	Drum_Medium_Arm_Hit = $Drum_Medium_Arm_Hit
	Drum_Fastest_Arm_Hit = $Drum_Fastest_Arm_Hit
	Drum_Idlepoint_Arm_SHit = ($Drum_Idlepoint_Arm_SHit)
	Drum_Idlepoint_Arm_MHit = ($Drum_Idlepoint_Arm_MHit)
	Drum_Apex_Arm_SHit = 0.9041
	Drum_Apex_Arm_MHit = 0.68
	Drum_Idlepoint_Arm_L = <Drum_Idlepoint_Arm_SHit>
	Drum_Idlepoint_Arm_R = <Drum_Idlepoint_Arm_SHit>
	Drum_Apex_Arm_L = <Drum_Apex_Arm_SHit>
	Drum_Apex_Arm_R = <Drum_Apex_Arm_SHit>
	random_hit_mod_vary_Foot = 0.08
	Drum_Slowest_Foot_Hit_R = 1533.3301
	Drum_Medium_Foot_Hit_R = 766.66
	Drum_Fastest_Foot_Hit_R = 200.0
	Drum_Idlepoint_Foot_Hit = ($Drum_Idlepoint_Foot_Hit)
	Drum_Slowest_Foot_Hit_L = 320.0
	Drum_Current_Value_L = 1
	Drum_Current_Value_R = 7
	Drum_Target_Value_L = 1
	Drum_Target_Value_R = 7
	Start_Hit_R = false
	Start_Hit_L = false
	Start_Hit_Foot_R = false
	Drum_Target_Distance_L = 0
	Drum_Target_Distance_R = 0
	GetNumFrames_Hand_R = 1.0
	Timer_Base_Hand_R = <Drum_Idlepoint_Arm_SHit>
	Old_Timer_Base_Hand_R = <Drum_Idlepoint_Arm_SHit>
	Timer_MS_Hand_R = 1000000.0
	Target_MS_Hand_R = 1000000.0
	AnimStep_Hand_R = 0.0
	NewMod_Hand_R = 0.7
	GetNumFrames_Hand_L = 1.0
	Timer_Base_Hand_L = <Drum_Idlepoint_Arm_SHit>
	Old_Timer_Base_Hand_L = <Drum_Idlepoint_Arm_SHit>
	Timer_MS_Hand_L = 1000000.0
	Target_MS_Hand_L = 1000000.0
	AnimStep_Hand_L = 0.0
	NewMod_Hand_L = 0.7
	GetNumFrames_Foot_R = 1.0
	Timer_Base_Foot_R = <Drum_Idlepoint_Foot_Hit>
	Old_Timer_Base_Foot_R = <Drum_Idlepoint_Foot_Hit>
	Timer_MS_Foot_R = 1000000.0
	Target_MS_Foot_R = 1000000.0
	AnimStep_Foot_R = 0.0
	NewMod_Foot_R = 1.0
	OldUnmod_Body = 1.0
	Timer_Base_Foot_L = 1000000.0
	Timer_MS_Foot_L = 1000000.0
	Drum_Foot_Index_L = close
	frame_length = 33.369
	Old_Frame_length = 33.369
	Drum_Anim_Foot_L = 0.0
	Drummer_IdlePoint_Arm_MS = ((<Drum_Slowest_Arm_Hit> * (1 - <Drum_Idlepoint_Arm_SHit>)) - <frame_length>)
	Drummer_IdlePoint_Foot_MS = ((<Drum_Slowest_Foot_Hit_R> * (1 - <Drum_Idlepoint_Foot_Hit>)) - <frame_length>)
	Drum_Pattern_Exists = false
	Drum_Pattern_Start = 0
	Drum_Pattern_End = 0
	Drum_Pattern_Value_L = 1
	Drum_Pattern_Value_R = 1
	time_to_Hit_1 = -1.0
	Time_to_hit_foot_L = -1.0
	time_to_hit_foot_r = -1.0
	Drum_Was_Patterned = false
	Drum_hit = -1
	longest_Transit = $longest_Transit
	long_arm = None
	Drummer_Offset = ($Drummer_Offset * 1000.0)
	drummer_Ids = []
	Num_Drummers = 0
	if NOT check_for_drummers
		return
	endif
	current_song = None
	GMan_SongTool_GetCurrentSong
	song_prefix = ''
	get_song_prefix song = <current_song>
	ExtendCRCWithString checksum = `` string = <song_prefix>
	ArrayPrefix = <ExtendedChecksum>
	ExtendCRCWithString checksum = <ArrayPrefix> string = '_drums_notes'
	event_array = <ExtendedChecksum>
	if NOT GlobalExists name = <event_array> type = array
		return
	endif
	FastGetArraySize array = $<event_array>
	if (<array_size> = 0)
		return
	endif
	spawnscriptnow \{Drummer_Current_Tempo}
	intialize_notehit_data current_song = <current_song>
	prep_notehit_data <...>
	Change \{last_drumnote_rightfoot_time = 0}
	Change \{last_drumnote_leftfoot_time = 0}
	Change \{next_drumnote_leftfoot_entry = 0}
	Change \{next_drumnote_rightfoot_entry = 0}
	begin
	GetSongTimeMs time_offset = <Drummer_Offset>
	if (<time> >= -2000.0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	flamfinder <...>
	begin
	if (<Time_to_hit_foot_L> <= 0.0)
		update_notehit_data_left_foot current_song = <current_song>
		pieces_hit_foot_l = <pieces_hit_foot_l>
		Time_to_hit_foot_L = <Time_to_hit_foot_L>
		if (<pieces_hit_foot_l> = H1o)
			if (<Drum_Foot_Index_L> = open)
			else
				Drum_Foot_Index_L = open
				Timer_Base_Foot_L = 0.0
			endif
		endif
		if (<pieces_hit_foot_l> = H1c)
			if (<Drum_Foot_Index_L> = close)
			else
				Drum_Foot_Index_L = close
				Timer_Base_Foot_L = 0.0
			endif
		endif
		if (<Time_to_hit_foot_L> <= 0.0)
			Time_to_hit_foot_L = 1.0
		endif
		Timer_MS_Foot_L = <Time_to_hit_foot_L>
	endif
	if (<time_to_hit_foot_r> <= 0.0)
		missfoot2 = (<Old_Frame_length> - (<time_to_hit_foot_r> + <Old_Frame_length>))
		update_notehit_data_right_foot current_song = <current_song>
		if (<time_to_hit_foot_r> <= 0.0)
			time_to_hit_foot_r = 1.0
		endif
		Start_Hit_Foot_R = true
	endif
	if (<time_to_Hit_1> <= 0.0)
		Drum_hit = (<Drum_hit> + 1)
		miss2 = (<Old_Frame_length> - (<time_to_Hit_1> + <Old_Frame_length>))
		GetSongTimeMs time_offset = <Drummer_Offset>
		miss = (<time> - ($drumnote_times [0]))
		time_to_Hit_1 = <time_to_Hit_2>
		time_to_Hit_2 = <Time_to_Hit_3>
		Time_to_Hit_3 = <Time_to_Hit_4>
		Time_to_Hit_4 = <Time_to_Hit_5>
		Time_to_Hit_5 = <Time_to_Hit_6>
		hit_velocity_1_1 = <Hit_Velocity_2_1>
		Hit_Velocity_2_1 = <Hit_Velocity_3_1>
		Hit_Velocity_3_1 = <Hit_Velocity_4_1>
		Hit_Velocity_4_1 = <Hit_Velocity_5_1>
		Hit_Velocity_5_1 = <Hit_Velocity_6_1>
		hit_velocity_1_2 = <Hit_Velocity_2_2>
		Hit_Velocity_2_2 = <Hit_Velocity_3_2>
		Hit_Velocity_3_2 = <Hit_Velocity_4_2>
		Hit_Velocity_4_2 = <Hit_Velocity_5_2>
		Hit_Velocity_5_2 = <Hit_Velocity_6_2>
		num_pieces_hit_1 = <Num_Pieces_Hit_2>
		Num_Pieces_Hit_2 = <Num_Pieces_Hit_3>
		Num_Pieces_Hit_3 = <Num_Pieces_Hit_4>
		Num_Pieces_Hit_4 = <Num_Pieces_Hit_5>
		Num_Pieces_Hit_5 = <Num_Pieces_Hit_6>
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
		SetArrayElement arrayName = drumnote_times GlobalArray index = 0 newValue = <old_time>
		old_time = ($drumnote_times [2])
		SetArrayElement arrayName = drumnote_times GlobalArray index = 1 newValue = <old_time>
		old_time = ($drumnote_times [3])
		SetArrayElement arrayName = drumnote_times GlobalArray index = 2 newValue = <old_time>
		old_time = ($drumnote_times [4])
		SetArrayElement arrayName = drumnote_times GlobalArray index = 3 newValue = <old_time>
		old_time = ($drumnote_times [5])
		SetArrayElement arrayName = drumnote_times GlobalArray index = 4 newValue = <old_time>
		update_notehit_data current_song = <current_song>
		if ((<Time_to_Hit_6> < 50.0) && (<Num_Pieces_Hit_5> = 1) && (<Num_Pieces_Hit_6> = 1))
			offset = <Time_to_Hit_6>
			Num_Pieces_Hit_5 = 2
			if (<pieces_value_5_1> <= <pieces_value_6_1>)
				pieces_value_5_2 = <pieces_value_6_1>
			else
				pieces_value_5_1 = <pieces_value_6_1>
			endif
			update_notehit_data current_song = <current_song>
			Time_to_Hit_6 = (<Time_to_Hit_6> + <offset>)
		endif
		if (<time_to_Hit_1> = 1000000.0)
			Last_Hit = true
		endif
		time_to_Hit_1 = (<time_to_Hit_1> - <miss>)
		if (<time_to_Hit_1> <= 0.0)
			time_to_Hit_1 = 1.0
		endif
		if (<pieces_value_1_1> = 0)
			hit_velocity_1_1 = 127.0
			hit_velocity_1_2 = 127.0
			num_pieces_hit_1 = 2
			tapin = true
		else
			tapin = false
		endif
		if (<Drum_Target_Distance_L> > 0)
			Drum_Target_Distance_L = (<Drum_Target_Distance_L> - 1)
		endif
		if (<Drum_Target_Distance_R> > 0)
			Drum_Target_Distance_R = (<Drum_Target_Distance_R> - 1)
		endif
		if (<Drum_Target_Distance_R> = 0 && <Drum_Target_Distance_L> = 0)
			resetlogic = true
		else
			resetlogic = false
		endif
		if (<Drum_Target_Distance_L> = 0)
			Start_Hit_L = true
			Drum_Current_Value_L = <Drum_Target_Value_L>
		else
			Start_Hit_L = false
		endif
		if (<Drum_Target_Distance_R> = 0)
			Start_Hit_R = true
			Drum_Current_Value_R = <Drum_Target_Value_R>
		else
			Start_Hit_R = false
		endif
		order_Priority = 0.3
		Drummer_Priority_Init {
			strength = 1.0
			num = <num_pieces_hit_1>
			l = <pieces_value_1_1>
			r = <pieces_value_1_2>
		}
		Priority_1_L = <PL>
		Priority_1_R = <PR>
		Drummer_Priority_Init {
			strength = (1.0 - ((1.0 - <order_Priority>) * 0.2))
			num = <Num_Pieces_Hit_2>
			l = <pieces_value_2_1>
			r = <pieces_value_2_2>
		}
		Priority_2_L = <PL>
		Priority_2_R = <PR>
		Drummer_Priority_Init {
			strength = (1.0 - ((1.0 - <order_Priority>) * 0.4))
			num = <Num_Pieces_Hit_3>
			l = <pieces_value_3_1>
			r = <pieces_value_3_2>
		}
		Priority_3_L = <PL>
		Priority_3_R = <PR>
		Drummer_Priority_Init {
			strength = (1.0 - ((1.0 - <order_Priority>) * 0.6))
			num = <Num_Pieces_Hit_4>
			l = <pieces_value_4_1>
			r = <pieces_value_4_2>
		}
		Priority_4_L = <PL>
		Priority_4_R = <PR>
		Drummer_Priority_Init {
			strength = (1.0 - ((1.0 - <order_Priority>) * 0.8))
			num = <Num_Pieces_Hit_5>
			l = <pieces_value_5_1>
			r = <pieces_value_5_2>
		}
		Priority_5_L = <PL>
		Priority_5_R = <PR>
		Drummer_Priority_Init {
			strength = <order_Priority>
			num = <Num_Pieces_Hit_6>
			l = <pieces_value_6_1>
			r = <pieces_value_6_2>
		}
		Priority_6_L = <PL>
		Priority_6_R = <PR>
		Check_Furthest_possible_L {
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
			Priority_2_L = <Priority_2_L>
			Priority_3_L = <Priority_3_L>
			Priority_4_L = <Priority_4_L>
			Priority_5_L = <Priority_5_L>
			Priority_6_L = <Priority_6_L>
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
			Priority_2_L = <Priority_2_L>
			Priority_3_L = <Priority_3_L>
			Priority_4_L = <Priority_4_L>
			Priority_5_L = <Priority_5_L>
			Priority_6_L = <Priority_6_L>
		}
		Prioritize_Time_To_hit_Slow {
			Priority_2_R = <Priority_2_R>
			Priority_3_R = <Priority_3_R>
			Priority_4_R = <Priority_4_R>
			Priority_5_R = <Priority_5_R>
			Priority_6_R = <Priority_6_R>
			Priority_2_L = <Priority_2_L>
			Priority_3_L = <Priority_3_L>
			Priority_4_L = <Priority_4_L>
			Priority_5_L = <Priority_5_L>
			Priority_6_L = <Priority_6_L>
			time2 = <time_to_Hit_2>
			Time3 = <Time_to_Hit_3>
			Time4 = <Time_to_Hit_4>
			Time5 = <Time_to_Hit_5>
			Time6 = <Time_to_Hit_6>
		}
		Prioritize_Time_To_hit_Fast {
			Priority_1_R = <Priority_1_R>
			Priority_2_R = <Priority_2_R>
			Priority_3_R = <Priority_3_R>
			Priority_4_R = <Priority_4_R>
			Priority_5_R = <Priority_5_R>
			Priority_6_R = <Priority_6_R>
			Priority_1_L = <Priority_1_L>
			Priority_2_L = <Priority_2_L>
			Priority_3_L = <Priority_3_L>
			Priority_4_L = <Priority_4_L>
			Priority_5_L = <Priority_5_L>
			Priority_6_L = <Priority_6_L>
			time1 = <time_to_Hit_1>
			time2 = <time_to_Hit_2>
			Time3 = <Time_to_Hit_3>
			Time4 = <Time_to_Hit_4>
			Time5 = <Time_to_Hit_5>
			Time6 = <Time_to_Hit_6>
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
		Prioritize_Piece_Value {
			hand = r
			Priority_1 = <Priority_1_R>
			Priority_2 = <Priority_2_R>
			Priority_3 = <Priority_3_R>
			Priority_4 = <Priority_4_R>
			Priority_5 = <Priority_5_R>
			Priority_6 = <Priority_6_R>
			value_1 = <pieces_value_1_2>
			value_2 = <pieces_value_2_2>
			value_3 = <pieces_value_3_2>
			value_4 = <pieces_value_4_2>
			value_5 = <pieces_value_5_2>
			value_6 = <pieces_value_6_2>
			Test_Value = <Drum_Target_Value_R>
		}
		Prioritize_Piece_Value {
			hand = l
			Priority_1 = <Priority_1_L>
			Priority_2 = <Priority_2_L>
			Priority_3 = <Priority_3_L>
			Priority_4 = <Priority_4_L>
			Priority_5 = <Priority_5_L>
			Priority_6 = <Priority_6_L>
			value_1 = <pieces_value_1_1>
			value_2 = <pieces_value_2_1>
			value_3 = <pieces_value_3_1>
			value_4 = <pieces_value_4_1>
			value_5 = <pieces_value_5_1>
			value_6 = <pieces_value_6_1>
			Test_Value = <Drum_Target_Value_L>
		}
		if (<resetlogic> = true)
		elseif (<Drum_Target_Distance_R> > 1)
			Priority_1_L = 1000000.0
		elseif (<Drum_Target_Distance_L> > 1)
			Priority_1_R = 1000000.0
		elseif (<Drum_Target_Distance_R> = 1)
			if (<num_pieces_hit_1> = 1)
				Priority_1_L = 0.0
			endif
		elseif (<Drum_Target_Distance_L> = 1)
			if (<num_pieces_hit_1> = 1)
				Priority_1_R = 0.0
			endif
		endif
		if (<num_pieces_hit_1> = 2)
			Priority_2_L = 0.0
			Priority_2_R = 0.0
			Priority_3_L = 0.0
			Priority_3_R = 0.0
			Priority_4_L = 0.0
			Priority_4_R = 0.0
			Priority_5_L = 0.0
			Priority_5_R = 0.0
			Priority_6_L = 0.0
			Priority_6_R = 0.0
		elseif (<Num_Pieces_Hit_2> = 2)
			Priority_3_L = 0.0
			Priority_3_R = 0.0
			Priority_4_L = 0.0
			Priority_4_R = 0.0
			Priority_5_L = 0.0
			Priority_5_R = 0.0
			Priority_6_L = 0.0
			Priority_6_R = 0.0
		elseif (<Num_Pieces_Hit_3> = 2)
			Priority_4_L = 0.0
			Priority_4_R = 0.0
			Priority_5_L = 0.0
			Priority_5_R = 0.0
			Priority_6_L = 0.0
			Priority_6_R = 0.0
		elseif (<Num_Pieces_Hit_4> = 2)
			Priority_5_L = 0.0
			Priority_5_R = 0.0
			Priority_6_L = 0.0
			Priority_6_R = 0.0
		elseif (<Num_Pieces_Hit_5> = 2)
			Priority_6_L = 0.0
			Priority_6_R = 0.0
		endif
		if (<Start_Hit_R> = true)
			Choose_Highest_Priority {
				p1 = <Priority_1_R>
				p2 = <Priority_2_R>
				p3 = <Priority_3_R>
				p4 = <Priority_4_R>
				p5 = <Priority_5_R>
				p6 = <Priority_6_R>
			}
			drum_target_r = <target>
			Extract_Target_Info {
				target = <drum_target_r>
				p1 = <Priority_1_R>
				p2 = <Priority_2_R>
				p3 = <Priority_3_R>
				p4 = <Priority_4_R>
				p5 = <Priority_5_R>
				p6 = <Priority_6_R>
				pieces_Value_1 = <pieces_value_1_2>
				pieces_Value_2 = <pieces_value_2_2>
				pieces_Value_3 = <pieces_value_3_2>
				pieces_value_4 = <pieces_value_4_2>
				pieces_value_5 = <pieces_value_5_2>
				pieces_value_6 = <pieces_value_6_2>
			}
			Drum_Target_Distance_R = <distance>
			Drum_Target_Value_R = <value>
			Drum_Target_Priority_R = <Priority>
		endif
		if (<Start_Hit_L> = true)
			Choose_Highest_Priority {
				p1 = <Priority_1_L>
				p2 = <Priority_2_L>
				p3 = <Priority_3_L>
				p4 = <Priority_4_L>
				p5 = <Priority_5_L>
				p6 = <Priority_6_L>
			}
			drum_target_l = <target>
			Extract_Target_Info {
				target = <drum_target_l>
				p1 = <Priority_1_L>
				p2 = <Priority_2_L>
				p3 = <Priority_3_L>
				p4 = <Priority_4_L>
				p5 = <Priority_5_L>
				p6 = <Priority_6_L>
				pieces_Value_1 = <pieces_value_1_1>
				pieces_Value_2 = <pieces_value_2_1>
				pieces_Value_3 = <pieces_value_3_1>
				pieces_value_4 = <pieces_value_4_1>
				pieces_value_5 = <pieces_value_5_1>
				pieces_value_6 = <pieces_value_6_1>
			}
			Drum_Target_Distance_L = <distance>
			Drum_Target_Value_L = <value>
			Drum_Target_Priority_L = <Priority>
		endif
		if (<resetlogic> = true)
			if (<Drum_Target_Priority_L> > <Drum_Target_Priority_R>)
				if (<Drum_Target_Distance_L> = 1)
					if (<num_pieces_hit_1> = 1)
						Priority_1_R = 0.0
						Choose_Highest_Priority {
							p1 = <Priority_1_R>
							p2 = <Priority_2_R>
							p3 = <Priority_3_R>
							p4 = <Priority_4_R>
							p5 = <Priority_5_R>
							p6 = <Priority_6_R>
						}
						drum_target_r = <target>
						Extract_Target_Info {
							target = <drum_target_r>
							p1 = <Priority_1_R>
							p2 = <Priority_2_R>
							p3 = <Priority_3_R>
							p4 = <Priority_4_R>
							p5 = <Priority_5_R>
							p6 = <Priority_6_R>
							pieces_Value_1 = <pieces_value_1_2>
							pieces_Value_2 = <pieces_value_2_2>
							pieces_Value_3 = <pieces_value_3_2>
							pieces_value_4 = <pieces_value_4_2>
							pieces_value_5 = <pieces_value_5_2>
							pieces_value_6 = <pieces_value_6_2>
						}
						Drum_Target_Distance_R = <distance>
						Drum_Target_Value_R = <value>
						Drum_Target_Priority_R = <Priority>
					endif
				else
					Drum_Target_Distance_R = 1
					Drum_Target_Value_R = <pieces_value_1_2>
					Drum_Target_Priority_R = <Priority_1_R>
				endif
			else
				if (<Drum_Target_Distance_R> = 1)
					if (<num_pieces_hit_1> = 1)
						Priority_1_L = 0.0
						Choose_Highest_Priority {
							p1 = <Priority_1_L>
							p2 = <Priority_2_L>
							p3 = <Priority_3_L>
							p4 = <Priority_4_L>
							p5 = <Priority_5_L>
							p6 = <Priority_6_L>
						}
						drum_target_l = <target>
						Extract_Target_Info {
							target = <drum_target_l>
							p1 = <Priority_1_L>
							p2 = <Priority_2_L>
							p3 = <Priority_3_L>
							p4 = <Priority_4_L>
							p5 = <Priority_5_L>
							p6 = <Priority_6_L>
							pieces_Value_1 = <pieces_value_1_1>
							pieces_Value_2 = <pieces_value_2_1>
							pieces_Value_3 = <pieces_value_3_1>
							pieces_value_4 = <pieces_value_4_1>
							pieces_value_5 = <pieces_value_5_1>
							pieces_value_6 = <pieces_value_6_1>
						}
						Drum_Target_Distance_L = <distance>
						Drum_Target_Value_L = <value>
						Drum_Target_Priority_L = <Priority>
					endif
				else
					Drum_Target_Distance_L = 1
					if (<Priority_1_L> > <Priority_1_L>)
						Drum_Target_Value_L = <pieces_value_1_2>
						Drum_Target_Priority_L = <Priority_1_L>
					else
						Drum_Target_Value_L = <pieces_value_1_1>
						Drum_Target_Priority_L = <Priority_1_L>
					endif
				endif
			endif
		endif
		begin_transition_R = false
		begin_transition_L = false
		if (<Start_Hit_R> = true)
			switch (<Drum_Target_Distance_R>)
				case 1
				time_to_hit_R = <time_to_Hit_1>
				Drum_Target_Velocity_R = <hit_velocity_1_2>
				case 2
				time_to_hit_R = (<time_to_Hit_1> + <time_to_Hit_2>)
				Drum_Target_Velocity_R = <Hit_Velocity_2_2>
				case 3
				time_to_hit_R = (<time_to_Hit_1> + <time_to_Hit_2> + <Time_to_Hit_3>)
				Drum_Target_Velocity_R = <Hit_Velocity_3_2>
				case 4
				time_to_hit_R = (<time_to_Hit_1> + <time_to_Hit_2> + <Time_to_Hit_3> + <Time_to_Hit_4>)
				Drum_Target_Velocity_R = <Hit_Velocity_4_2>
				case 5
				time_to_hit_R = (<time_to_Hit_1> + <time_to_Hit_2> + <Time_to_Hit_3> + <Time_to_Hit_4> + <Time_to_Hit_5>)
				Drum_Target_Velocity_R = <Hit_Velocity_5_2>
				case 6
				time_to_hit_R = (<time_to_Hit_1> + <time_to_Hit_2> + <Time_to_Hit_3> + <Time_to_Hit_4> + <Time_to_Hit_5> + <Time_to_Hit_6>)
				Drum_Target_Velocity_R = <Hit_Velocity_6_2>
				default
				time_to_hit_R = 100000000.0
				Drum_Target_Velocity_R = 100
			endswitch
			if (<Drum_Target_Value_R> != <Drum_Current_Value_R>)
				begin_transition_R = true
			else
			endif
		else
			time_to_hit_R = 0.0
		endif
		if (<Start_Hit_L> = true)
			switch (<Drum_Target_Distance_L>)
				case 1
				time_to_hit_L = (<time_to_Hit_1>)
				Drum_Target_Velocity_L = <hit_velocity_1_1>
				case 2
				time_to_hit_L = (<time_to_Hit_1> + <time_to_Hit_2>)
				Drum_Target_Velocity_L = <Hit_Velocity_2_1>
				case 3
				time_to_hit_L = (<time_to_Hit_1> + <time_to_Hit_2> + <Time_to_Hit_3>)
				Drum_Target_Velocity_L = <Hit_Velocity_3_1>
				case 4
				time_to_hit_L = (<time_to_Hit_1> + <time_to_Hit_2> + <Time_to_Hit_3> + <Time_to_Hit_4>)
				Drum_Target_Velocity_L = <Hit_Velocity_4_1>
				case 5
				time_to_hit_L = (<time_to_Hit_1> + <time_to_Hit_2> + <Time_to_Hit_3> + <Time_to_Hit_4> + <Time_to_Hit_5>)
				Drum_Target_Velocity_L = <Hit_Velocity_5_1>
				case 6
				time_to_hit_L = (<time_to_Hit_1> + <time_to_Hit_2> + <Time_to_Hit_3> + <Time_to_Hit_4> + <Time_to_Hit_5> + <Time_to_Hit_6>)
				Drum_Target_Velocity_L = <Hit_Velocity_6_1>
				default
				time_to_hit_L = 100000000.0
				Drum_Target_Velocity_L = 100
			endswitch
			if (<Drum_Target_Value_L> != <Drum_Current_Value_L>)
				begin_transition_L = true
			else
			endif
		else
			time_to_hit_L = 0.0
		endif
		if ((<time_to_Hit_1> > <longest_Transit>) || (<First_Hit> = true))
			Should_Idle = true
		else
			Should_Idle = false
		endif
		create_target_state Value_L = <Drum_Target_Value_L> Value_R = <Drum_Target_Value_R>
		Drum_New_State_String = <State_String>
		Drum_Old_Long_String = 'S1T3'
		Drum_New_Long_String = 'S1T3'
		Drum_New_Short_String = 'S1T3'
		Drum_Old_Short_String = 'S1T3'
		if (<Drum_Target_Distance_R> = <Drum_Target_Distance_L>)
			Drum_New_State_String_R = <Drum_New_State_String>
			Drum_New_State_String_L = <Drum_New_State_String>
			if (<long_arm> = None)
				create_target_state_full Value_L = <Drum_Current_Value_L> Value_R = <Drum_Current_Value_R>
				Drum_Old_Long_String = <State_String>
				Transit_type = Long
				time_to_trans_Long = <time_to_Hit_1>
				Drum_New_Long_String = <Drum_New_State_String>
			elseif (<long_arm> = l)
				create_target_state_full Value_L = <Drum_Current_Value_L> Value_R = <Drum_Target_Value_R>
				Drum_Old_Short_String = <State_String>
				Transit_type = short
				Drum_New_Short_String = <Drum_New_State_String>
			elseif (<long_arm> = r)
				create_target_state_full Value_L = <Drum_Target_Value_L> Value_R = <Drum_Current_Value_R>
				Drum_Old_Short_String = <State_String>
				Transit_type = short
				Drum_New_Short_String = <Drum_New_State_String>
			endif
			long_arm = None
		elseif (<Drum_Target_Distance_R> > <Drum_Target_Distance_L>)
			switch ((<Drum_Target_Distance_R> -1))
				case 0
				note = <Drum_Target_Value_L>
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
			create_target_state Value_L = <note> Value_R = <Drum_Target_Value_R>
			Drum_New_State_String_R = <State_String>
			Drum_New_State_String_L = <Drum_New_State_String>
			if (<resetlogic> = true)
				create_target_state_full Value_L = <Drum_Target_Value_L> Value_R = <Drum_Current_Value_R>
				Drum_Old_Long_String = <State_String>
				Transit_type = Long
				time_to_trans_Long = <time_to_hit_R>
				Drum_New_Long_String = <Drum_New_State_String>
			elseif (<Start_Hit_R> = true)
				create_target_state_full Value_L = <Drum_Target_Value_L> Value_R = <Drum_Current_Value_R>
				Drum_Old_Long_String = <State_String>
				Transit_type = Long
				time_to_trans_Long = <time_to_hit_R>
				Drum_New_Long_String = <Drum_New_State_String>
			elseif (<Start_Hit_L> = true)
				create_target_state_full Value_L = <Drum_Target_Value_L> Value_R = <Drum_Current_Value_R>
				Drum_Old_Short_String = <State_String>
				Transit_type = short
				Drum_New_Short_String = <Drum_New_State_String>
			endif
			long_arm = r
		elseif (<Drum_Target_Distance_R> < <Drum_Target_Distance_L>)
			switch ((<Drum_Target_Distance_L> -1))
				case 0
				note = <Drum_Target_Value_R>
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
			create_target_state Value_L = <Drum_Target_Value_L> Value_R = <note>
			Drum_New_State_String_L = <State_String>
			Drum_New_State_String_R = <Drum_New_State_String>
			if (<resetlogic> = true)
				create_target_state_full Value_L = <Drum_Current_Value_L> Value_R = <Drum_Target_Value_R>
				Drum_Old_Long_String = <State_String>
				Transit_type = Long
				time_to_trans_Long = <time_to_hit_L>
				Drum_New_Long_String = <Drum_New_State_String>
			elseif (<Start_Hit_L> = true)
				create_target_state_full Value_L = <Drum_Current_Value_L> Value_R = <Drum_Target_Value_R>
				Drum_Old_Long_String = <State_String>
				Transit_type = Long
				time_to_trans_Long = <time_to_hit_L>
				Drum_New_Long_String = <Drum_New_State_String>
			elseif (<Start_Hit_R> = true)
				create_target_state_full Value_L = <Drum_Current_Value_L> Value_R = <Drum_Target_Value_R>
				Drum_Old_Short_String = <State_String>
				Transit_type = short
				Drum_New_Short_String = <Drum_New_State_String>
			endif
			long_arm = l
		endif
		spawnscriptnow hold_transit_requests params = {
			l = <Start_Hit_L>
			r = <Start_Hit_R>
			type = <Transit_type>
			Last_Hit = <Last_Hit>
			Num_Drummers = <Num_Drummers>
			drummer_Ids = <drummer_Ids>
			time_to_hit_R = <time_to_hit_R>
			time_to_hit_L = <time_to_hit_L>
			Drum_New_State_String_R = <Drum_New_State_String_R>
			Drum_New_State_String_L = <Drum_New_State_String_L>
			tapin = <tapin>
			Should_Idle = <Should_Idle>
			time_to_Hit_1 = <time_to_Hit_1>
			time_to_trans_Long = <time_to_trans_Long>
			time_to_trans_short = <time_to_Hit_1>
			Drum_Old_Long_String = <Drum_Old_Long_String>
			Drum_New_Long_String = <Drum_New_State_String>
			Drum_New_Short_String = <Drum_New_State_String>
			Drum_Old_Short_String = <Drum_Old_Short_String>
		}
	endif
	GetFrameLength
	frame_length1 = (<frame_length> * 1000.0)
	wait \{1
		frame}
	GetFrameLength
	frame_length = ((<frame_length> * 1000.0) + <frame_length1>)
	if (<Drum_Foot_Index_L> = open)
		AV_Drum_Blend_HH_Kit = <Timer_Base_Foot_L>
	else
		AV_Drum_Blend_HH_Kit = (1 - <Timer_Base_Foot_L>)
	endif
	if (<Start_Hit_R> = true)
		spawnscriptnow Hold_DrumKit_Piece params = {drummer_Ids = <drummer_Ids> Num_Drummers = <Num_Drummers> strength = <NewMod_Hand_R> pieces_hit = <Drum_Current_Value_R>}
		OldMod_Hand_R = <NewMod_Hand_R>
		normalize_velocities value = <Drum_Target_Value_R> velocity = <Drum_Target_Velocity_R>
		NewMod_Hand_R = <velocity>
		Timer_MS_Hand_R = <time_to_hit_R>
		Target_MS_Hand_R = <time_to_hit_R>
		if (<First_Hit> = false)
			fractional_AnimStep = (1 - <GetNumFrames_Hand_R>)
			GetNumFrames_Hand_R = ((<Timer_MS_Hand_R> + <miss2>) / <Old_Frame_length>)
			Timer_Base_Hand_R = (1 / <GetNumFrames_Hand_R>)
			if (<Timer_Base_Hand_R> < (<Old_Frame_length> / <Drum_Slowest_Arm_Hit>))
				Timer_Base_Hand_R = (<Old_Frame_length> / <Drum_Slowest_Arm_Hit>)
			endif
			Timer_Base_Hand_R = (<Timer_Base_Hand_R> * <fractional_AnimStep>)
		endif
		if (<time_to_hit_R> < <Drum_Fastest_Arm_Hit>)
			Blend_Hand_R = 0.0
			mod_overdrive_Hand_R = (<time_to_hit_R> / <Drum_Fastest_Arm_Hit>)
		else
			mod_overdrive_Hand_R = 1.0
			if (<time_to_hit_R> < <Drum_Medium_Arm_Hit>)
				Blend_Hand_R = ((<time_to_hit_R> - <Drum_Fastest_Arm_Hit>) / (<Drum_Medium_Arm_Hit> - <Drum_Fastest_Arm_Hit>))
				Blend_Hand_R = (<Blend_Hand_R> * 0.5)
			else
				if (<time_to_hit_R> < <Drum_Slowest_Arm_Hit>)
					Blend_Hand_R = ((<time_to_hit_R> - <Drum_Medium_Arm_Hit>) / (<Drum_Slowest_Arm_Hit> - <Drum_Medium_Arm_Hit>))
					Blend_Hand_R = (0.5 + (<Blend_Hand_R> * 0.5))
				else
					Blend_Hand_R = 1.0
				endif
			endif
		endif
		Start_Hit_R = false
	endif
	if (<Start_Hit_L> = true)
		spawnscriptnow Hold_DrumKit_Piece params = {drummer_Ids = <drummer_Ids> Num_Drummers = <Num_Drummers> strength = <NewMod_Hand_L> pieces_hit = <Drum_Current_Value_L>}
		OldMod_Hand_L = <NewMod_Hand_L>
		normalize_velocities value = <Drum_Target_Value_L> velocity = <Drum_Target_Velocity_L>
		NewMod_Hand_L = <velocity>
		Timer_MS_Hand_L = <time_to_hit_L>
		Target_MS_Hand_L = <time_to_hit_L>
		if (<First_Hit> = false)
			fractional_AnimStep = (1.0 - <GetNumFrames_Hand_L>)
			GetNumFrames_Hand_L = ((<Timer_MS_Hand_L> + <miss2>) / <Old_Frame_length>)
			Timer_Base_Hand_L = (1.0 / <GetNumFrames_Hand_L>)
			if (<Timer_Base_Hand_L> < (<Old_Frame_length> / <Drum_Slowest_Arm_Hit>))
				Timer_Base_Hand_L = (<Old_Frame_length> / <Drum_Slowest_Arm_Hit>)
			endif
			Timer_Base_Hand_L = (<Timer_Base_Hand_L> * <fractional_AnimStep>)
		endif
		if (<time_to_hit_L> < <Drum_Fastest_Arm_Hit>)
			Blend_Hand_L = 0.0
			mod_overdrive_Hand_L = (<time_to_hit_L> / <Drum_Fastest_Arm_Hit>)
		else
			mod_overdrive_Hand_L = 1.0
			if (<time_to_hit_L> < <Drum_Medium_Arm_Hit>)
				Blend_Hand_L = ((<time_to_hit_L> - <Drum_Fastest_Arm_Hit>) / (<Drum_Medium_Arm_Hit> - <Drum_Fastest_Arm_Hit>))
				Blend_Hand_L = (<Blend_Hand_L> * 0.5)
			else
				if (<time_to_hit_L> < <Drum_Slowest_Arm_Hit>)
					Blend_Hand_L = ((<time_to_hit_L> - <Drum_Medium_Arm_Hit>) / (<Drum_Slowest_Arm_Hit> - <Drum_Medium_Arm_Hit>))
					Blend_Hand_L = (0.5 + (<Blend_Hand_L> * 0.5))
				else
					Blend_Hand_L = 1.0
				endif
			endif
		endif
		Start_Hit_L = false
	endif
	if (<Start_Hit_Foot_R> = true)
		random_float = 0.0
		GetRandomFloat a = (0.0 - <random_hit_mod_vary_Foot>) b = <random_hit_mod_vary_Foot>
		random_mod_foot_r = <random_float>
		NewMod_Foot_R = 0.91999996
		NewMod_Foot_R = (<NewMod_Foot_R> + <random_mod_foot_r>)
		mod_Foot_R = <NewMod_Foot_R>
		Timer_MS_Foot_R = <time_to_hit_foot_r>
		Target_MS_Foot_R = <time_to_hit_foot_r>
		if (<First_Hit> = false)
			fractional_AnimStep = (1.0 - <GetNumFrames_Foot_R>)
			GetNumFrames_Foot_R = ((<Timer_MS_Foot_R> + <missfoot2>) / <Old_Frame_length>)
			Timer_Base_Foot_R = (1.0 / <GetNumFrames_Foot_R>)
			if (<Timer_Base_Foot_R> < (<Old_Frame_length> / <Drum_Slowest_Foot_Hit_R>))
				Timer_Base_Foot_R = (<Old_Frame_length> / <Drum_Slowest_Foot_Hit_R>)
			endif
			Timer_Base_Foot_R = (<Timer_Base_Foot_R> * <fractional_AnimStep>)
		endif
		if (<time_to_hit_foot_r> < <Drum_Fastest_Foot_Hit_R>)
			Blend_Foot_R = 0.0
			mod_overdrive_Foot_R = (<time_to_hit_foot_r> / <Drum_Fastest_Foot_Hit_R>)
		else
			mod_overdrive_Foot_R = 1.0
			if (<time_to_hit_foot_r> < <Drum_Medium_Foot_Hit_R>)
				Blend_Foot_R = ((<time_to_hit_foot_r> - <Drum_Fastest_Foot_Hit_R>) / (<Drum_Medium_Foot_Hit_R> - <Drum_Fastest_Foot_Hit_R>))
				Blend_Foot_R = (<Blend_Foot_R> * 0.5)
			else
				if (<time_to_hit_foot_r> < <Drum_Slowest_Foot_Hit_R>)
					Blend_Foot_R = ((<time_to_hit_foot_r> - <Drum_Medium_Foot_Hit_R>) / (<Drum_Slowest_Foot_Hit_R> - <Drum_Medium_Foot_Hit_R>))
					Blend_Foot_R = (0.5 + (<Blend_Foot_R> * 0.5))
				else
					Blend_Foot_R = 1.0
				endif
			endif
		endif
		Start_Hit_Foot_R = false
	endif
	GetNumFrames_Hand_R = (<Timer_MS_Hand_R> / <frame_length>)
	if (<GetNumFrames_Hand_R> < 1E-06)
		GetNumFrames_Hand_R = 1E-06
	endif
	GetNumFrames_Hand_L = (<Timer_MS_Hand_L> / <frame_length>)
	if (<GetNumFrames_Hand_L> < 1E-06)
		GetNumFrames_Hand_L = 1E-06
	endif
	GetNumFrames_Foot_R = (<Timer_MS_Foot_R> / <frame_length>)
	if (<GetNumFrames_Foot_R> < 1E-06)
		GetNumFrames_Foot_R = 1E-06
	endif
	AnimStep_Hand_R = ((1 - <Timer_Base_Hand_R>) / <GetNumFrames_Hand_R>)
	AnimStep_Hand_L = ((1 - <Timer_Base_Hand_L>) / <GetNumFrames_Hand_L>)
	AnimStep_Foot_R = ((1 - <Timer_Base_Foot_R>) / <GetNumFrames_Foot_R>)
	if (<Timer_Base_Hand_R> < <Drum_Idlepoint_Arm_SHit>)
		if (<AnimStep_Hand_R> < (<frame_length> / <Drum_Slowest_Arm_Hit>))
			AnimStep_Hand_R = (<frame_length> / <Drum_Slowest_Arm_Hit>)
		endif
	endif
	if (<Timer_Base_Hand_L> < <Drum_Idlepoint_Arm_SHit>)
		if (<AnimStep_Hand_L> < (<frame_length> / <Drum_Slowest_Arm_Hit>))
			AnimStep_Hand_L = (<frame_length> / <Drum_Slowest_Arm_Hit>)
		endif
	endif
	if (<Timer_Base_Foot_R> < <Drum_Idlepoint_Foot_Hit>)
		if (<AnimStep_Foot_R> < (<frame_length> / <Drum_Slowest_Foot_Hit_R>))
			AnimStep_Foot_R = (<frame_length> / <Drum_Slowest_Foot_Hit_R>)
		endif
	endif
	if (<Blend_Hand_R> > 0.5)
		Drum_Idlepoint_Arm_R = ((((<Blend_Hand_R> -0.5) * 2.0) * <Drum_Idlepoint_Arm_SHit>) + ((1 - ((<Blend_Hand_R> -0.5) * 2.0)) * <Drum_Idlepoint_Arm_MHit>))
		Drum_Apex_Arm_R = ((((<Blend_Hand_R> -0.5) * 2.0) * <Drum_Apex_Arm_SHit>) + ((1.0 - ((<Blend_Hand_R> -0.5) * 2.0)) * <Drum_Apex_Arm_MHit>))
	else
		Drum_Idlepoint_Arm_R = <Drum_Idlepoint_Arm_MHit>
		Drum_Apex_Arm_R = <Drum_Apex_Arm_MHit>
	endif
	if (<Blend_Hand_L> > 0.5)
		Drum_Idlepoint_Arm_L = ((((<Blend_Hand_L> -0.5) * 2.0) * <Drum_Idlepoint_Arm_SHit>) + ((1 - ((<Blend_Hand_L> -0.5) * 2.0)) * <Drum_Idlepoint_Arm_MHit>))
		Drum_Apex_Arm_L = ((((<Blend_Hand_L> -0.5) * 2.0) * <Drum_Apex_Arm_SHit>) + ((1.0 - ((<Blend_Hand_L> -0.5) * 2.0)) * <Drum_Apex_Arm_MHit>))
	else
		Drum_Idlepoint_Arm_L = <Drum_Idlepoint_Arm_MHit>
		Drum_Apex_Arm_L = <Drum_Apex_Arm_MHit>
	endif
	if (<Blend_Hand_R> < 0.5)
		UnMod_Hit_Hand_R = 1.0
	else
		if (<Timer_Base_Hand_R> < <Drum_Idlepoint_Arm_R>)
			UnMod_Hit_Hand_R = (1.0 - (<Timer_Base_Hand_R> / <Drum_Idlepoint_Arm_R>))
			UnMod_Hit_Hand_R = (<UnMod_Hit_Hand_R> + ((1.0 - <UnMod_Hit_Hand_R>) * (1.0 - ((<Blend_Hand_R> -0.5) * 2.0))))
			UnMod_Hit_Hand_R = (<UnMod_Hit_Hand_R> + ((1.0 - <UnMod_Hit_Hand_R>) * (1.0 - ((<Blend_Hand_R> -0.5) * 2.0))))
		else
			if (<Timer_Base_Hand_R> < <Drum_Apex_Arm_R>)
				UnMod_Hit_Hand_R = (1.0 - ((<Drum_Apex_Arm_R> - <Timer_Base_Hand_R>) / (<Drum_Apex_Arm_R> - <Drum_Idlepoint_Arm_R>)))
				UnMod_Hit_Hand_R = (<UnMod_Hit_Hand_R> + ((1.0 - <UnMod_Hit_Hand_R>) * (1.0 - ((<Blend_Hand_R> -0.5) * 2.0))))
				UnMod_Hit_Hand_R = (<UnMod_Hit_Hand_R> + ((1.0 - <UnMod_Hit_Hand_R>) * (1.0 - ((<Blend_Hand_R> -0.5) * 2.0))))
			else
				UnMod_Hit_Hand_R = 1.0
			endif
		endif
	endif
	if (<Blend_Hand_L> < 0.5)
		UnMod_Hit_Hand_L = 1.0
	else
		if (<Timer_Base_Hand_L> < <Drum_Idlepoint_Arm_L>)
			UnMod_Hit_Hand_L = (1.0 - (<Timer_Base_Hand_L> / <Drum_Idlepoint_Arm_L>))
			UnMod_Hit_Hand_L = (<UnMod_Hit_Hand_L> + ((1 - <UnMod_Hit_Hand_L>) * (1.0 - ((<Blend_Hand_L> -0.5) * 2.0))))
			UnMod_Hit_Hand_L = (<UnMod_Hit_Hand_L> + ((1 - <UnMod_Hit_Hand_L>) * (1.0 - ((<Blend_Hand_L> -0.5) * 2.0))))
		else
			if (<Timer_Base_Hand_L> < <Drum_Apex_Arm_L>)
				UnMod_Hit_Hand_L = (1.0 - ((<Drum_Apex_Arm_L> - <Timer_Base_Hand_L>) / (<Drum_Apex_Arm_L> - <Drum_Idlepoint_Arm_L>)))
				UnMod_Hit_Hand_L = (<UnMod_Hit_Hand_L> + ((1.0 - <UnMod_Hit_Hand_L>) * (1.0 - ((<Blend_Hand_L> -0.5) * 2.0))))
				UnMod_Hit_Hand_L = (<UnMod_Hit_Hand_L> + ((1.0 - <UnMod_Hit_Hand_L>) * (1.0 - ((<Blend_Hand_L> -0.5) * 2.0))))
			else
				UnMod_Hit_Hand_L = 1.0
			endif
		endif
	endif
	if (<Timer_Base_Hand_R> < <Drum_Apex_Arm_R>)
		UnIK_Hand_Med_R = (1.0 - (((<Timer_Base_Hand_R> / <Drum_Apex_Arm_R>) * <NewMod_Hand_R>)))
	else
		UnIK_Hand_Med_R = (1.0 - ((1.0 - ((<Timer_Base_Hand_R> - <Drum_Apex_Arm_R>) / (1.0 - <Drum_Apex_Arm_R>))) * <NewMod_Hand_R>))
	endif
	if (<Blend_Hand_R> < 0.5)
		<AV_Drum_IK_Hand_R> = ((1.0 * (1.0 - (<Blend_Hand_R> * 2.0))) + (<UnIK_Hand_Med_R> * (<Blend_Hand_R> * 2.0)))
	else
		if (<Timer_Base_Hand_R> < <Drum_Idlepoint_Arm_R>)
			UnIK_Hand_Slow_R = (1.0 - ((<Timer_Base_Hand_R> / <Drum_Idlepoint_Arm_R>)))
		else
			if (<Timer_Base_Hand_R> < <Drum_Apex_Arm_R>)
				UnIK_Hand_Slow_R = ((1 - ((<Drum_Apex_Arm_R> - <Timer_Base_Hand_R>) / (<Drum_Apex_Arm_R> - <Drum_Idlepoint_Arm_R>))) * (1.0 - <NewMod_Hand_R>))
			else
				UnIK_Hand_Slow_R = <UnIK_Hand_Med_R>
			endif
		endif
		<AV_Drum_IK_Hand_R> = ((<UnIK_Hand_Med_R> * (1.0 - ((<Blend_Hand_R> -0.5) * 2.0))) + (<UnIK_Hand_Slow_R> * ((<Blend_Hand_R> -0.5) * 2.0)))
	endif
	if (<Timer_Base_Hand_L> < <Drum_Apex_Arm_L>)
		UnIK_Hand_Med_L = (1.0 - (((<Timer_Base_Hand_L> / <Drum_Apex_Arm_L>) * <NewMod_Hand_L>)))
	else
		UnIK_Hand_Med_L = (1.0 - ((1.0 - ((<Timer_Base_Hand_L> - <Drum_Apex_Arm_L>) / (1.0 - <Drum_Apex_Arm_L>))) * <NewMod_Hand_L>))
	endif
	if (<Blend_Hand_L> < 0.5)
		<AV_Drum_IK_Hand_L> = ((1.0 * (1.0 - (<Blend_Hand_L> * 2.0))) + (<UnIK_Hand_Med_L> * (<Blend_Hand_L> * 2.0)))
	else
		if (<Timer_Base_Hand_L> < <Drum_Idlepoint_Arm_L>)
			UnIK_Hand_Slow_L = (1.0 - ((<Timer_Base_Hand_L> / <Drum_Idlepoint_Arm_L>)))
		else
			if (<Timer_Base_Hand_L> < <Drum_Apex_Arm_L>)
				UnIK_Hand_Slow_L = ((1.0 - ((<Drum_Apex_Arm_L> - <Timer_Base_Hand_L>) / (<Drum_Apex_Arm_L> - <Drum_Idlepoint_Arm_L>))) * (1.0 - <NewMod_Hand_L>))
			else
				UnIK_Hand_Slow_L = <UnIK_Hand_Med_L>
			endif
		endif
		<AV_Drum_IK_Hand_L> = ((<UnIK_Hand_Med_L> * (1.0 - ((<Blend_Hand_L> -0.5) * 2.0))) + (<UnIK_Hand_Slow_L> * ((<Blend_Hand_L> -0.5) * 2.0)))
	endif
	if (<Blend_Hand_R> < 0.5)
		UnMod_Body_R = ((1.0 * (1.0 - (<Blend_Hand_R> * 2.0))) + ((1.0 - <NewMod_Hand_R>) * (<Blend_Hand_R> * 2.0)))
	else
		if (<Timer_Base_Hand_R> < <Drum_Idlepoint_Arm_R>)
			UnMod_Body_Slow_R = ((1.0 - <NewMod_Hand_R>) + (<NewMod_Hand_R> * (<Timer_Base_Hand_R> / <Drum_Idlepoint_Arm_R>)))
		else
			if (<Timer_Base_Hand_R> < <Drum_Apex_Arm_R>)
				UnMod_Body_Slow_R = ((1.0 - <NewMod_Hand_R>) + (<NewMod_Hand_R> * (1.0 - ((<Timer_Base_Hand_R> - <Drum_Idlepoint_Arm_R>) / (<Drum_Apex_Arm_R> - <Drum_Idlepoint_Arm_R>)))))
			else
				UnMod_Body_Slow_R = (1.0 - <NewMod_Hand_R>)
			endif
		endif
		UnMod_Body_R = (((1.0 - <NewMod_Hand_R>) * (1.0 - ((<Blend_Hand_R> -0.5) * 2.0))) + (<UnMod_Body_Slow_R> * ((<Blend_Hand_R> -0.5) * 2.0)))
	endif
	if (<Blend_Hand_L> < 0.5)
		UnMod_Body_L = ((1.0 * (1.0 - (<Blend_Hand_L> * 2.0))) + ((1.0 - <NewMod_Hand_L>) * (<Blend_Hand_L> * 2.0)))
	else
		if (<Timer_Base_Hand_L> < <Drum_Idlepoint_Arm_L>)
			UnMod_Body_Slow_L = ((1.0 - <NewMod_Hand_L>) + (<NewMod_Hand_L> * (<Timer_Base_Hand_L> / <Drum_Idlepoint_Arm_L>)))
		else
			if (<Timer_Base_Hand_L> < <Drum_Apex_Arm_L>)
				UnMod_Body_Slow_L = ((1.0 - <NewMod_Hand_L>) + (<NewMod_Hand_L> * (1.0 - ((<Timer_Base_Hand_L> - <Drum_Idlepoint_Arm_L>) / (<Drum_Apex_Arm_L> - <Drum_Idlepoint_Arm_L>)))))
			else
				UnMod_Body_Slow_L = (1.0 - <NewMod_Hand_L>)
			endif
		endif
		UnMod_Body_L = (((1.0 - <NewMod_Hand_L>) * (1.0 - ((<Blend_Hand_L> -0.5) * 2.0))) + (<UnMod_Body_Slow_L> * ((<Blend_Hand_L> -0.5) * 2.0)))
	endif
	UnMod_Body_R = (1.0 - ((1.0 - <UnMod_Body_R>) * <NewMod_Hand_R>))
	UnMod_Body_L = (1.0 - ((1.0 - <UnMod_Body_L>) * <NewMod_Hand_L>))
	Unmod_body = (1.0 - ((1.0 - (<UnMod_Body_R> * <UnMod_Body_L>)) * 0.5))
	Unmod_body = (<OldUnmod_Body> + ((<Unmod_body> - <OldUnmod_Body>) * 0.05))
	OldUnmod_Body = <Unmod_body>
	mod_hand_R = ((<OldMod_Hand_R> * (1.0 - <Timer_Base_Hand_R>)) + (<NewMod_Hand_R> * <Timer_Base_Hand_R>))
	mod_hand_R = ((<mod_hand_R> * <UnMod_Hit_Hand_R>) + (1.0 * (1.0 - <UnMod_Hit_Hand_R>)))
	mod_hand_L = ((<OldMod_Hand_L> * (1.0 - <Timer_Base_Hand_L>)) + (<NewMod_Hand_L> * <Timer_Base_Hand_L>))
	mod_hand_L = ((<mod_hand_L> * <UnMod_Hit_Hand_L>) + (1.0 * (1.0 - <UnMod_Hit_Hand_L>)))
	mod_hand_R = (<mod_hand_R> * <mod_overdrive_Hand_R>)
	mod_hand_L = (<mod_hand_L> * <mod_overdrive_Hand_L>)
	spawnscriptnow hold_active_values params = {
		Num_Drummers = <Num_Drummers>
		drummer_Ids = <drummer_Ids>
		AV_Drum_Anim_Hand_L = <Timer_Base_Hand_L>
		AV_Drum_Anim_Hand_R = <Timer_Base_Hand_R>
		AV_Drum_Anim_Foot_R = <Timer_Base_Foot_R>
		AV_Drum_Blend_Hand_L = <Blend_Hand_L>
		AV_Drum_Blend_Hand_R = <Blend_Hand_R>
		AV_Drum_Blend_Foot_R = <Blend_Foot_R>
		AV_Drum_Blend_HH_Kit = <AV_Drum_Blend_HH_Kit>
		AV_Drum_Mod_Loop_Body = <Unmod_body>
		AV_Drum_Mod_Hand_R = <mod_hand_R>
		AV_Drum_Mod_Hand_L = <mod_hand_L>
		AV_Drum_Mod_Foot_R = <mod_Foot_R>
		AV_Drum_IK_Hand_L = <AV_Drum_IK_Hand_L>
		AV_Drum_IK_Hand_R = <AV_Drum_IK_Hand_R>
	}
	GetSongTimeMs time_offset = <Drummer_Offset>
	if ((<Timer_MS_Foot_L> / <frame_length>) < 1E-06)
		GetNumFrames_Foot_L = 1E-06
	else
		GetNumFrames_Foot_L = (<Timer_MS_Foot_L> / <frame_length>)
	endif
	AnimStep_Foot_L = ((1 - <Timer_Base_Foot_L>) / <GetNumFrames_Foot_L>)
	if (<Timer_MS_Foot_L> > <Drum_Slowest_Foot_Hit_L>)
		Timer_Base_Foot_L = <Timer_Base_Foot_L>
	else
		Timer_Base_Foot_L = (<Timer_Base_Foot_L> + <AnimStep_Foot_L>)
	endif
	if (<Timer_Base_Foot_L> > 1.0)
		Timer_Base_Foot_L = 1.0
	endif
	Old_Timer_Base_Hand_R = <Timer_Base_Hand_R>
	Old_Timer_Base_Hand_L = <Timer_Base_Hand_L>
	Old_Timer_Base_Foot_R = <Timer_Base_Foot_R>
	Old_Frame_length = <frame_length>
	time_to_Hit_1 = (<time_to_Hit_1> - <frame_length>)
	Time_to_hit_foot_L = (<Time_to_hit_foot_L> - <frame_length>)
	time_to_hit_foot_r = (<time_to_hit_foot_r> - <frame_length>)
	Timer_MS_Hand_R = (<Timer_MS_Hand_R> - <frame_length>)
	Timer_MS_Hand_L = (<Timer_MS_Hand_L> - <frame_length>)
	Timer_MS_Foot_R = (<Timer_MS_Foot_R> - <frame_length>)
	Timer_MS_Foot_L = (<Timer_MS_Foot_L> - <frame_length>)
	if ((<Timer_Base_Hand_R> >= (<Drum_Idlepoint_Arm_SHit>)) && (<Timer_MS_Hand_R> > <Drummer_IdlePoint_Arm_MS>))
		Timer_Base_Hand_R = <Timer_Base_Hand_R>
	else
		Timer_Base_Hand_R = (<Timer_Base_Hand_R> + <AnimStep_Hand_R>)
	endif
	if ((<Timer_Base_Hand_L> >= (<Drum_Idlepoint_Arm_SHit>)) && (<Timer_MS_Hand_L> > <Drummer_IdlePoint_Arm_MS>))
		Timer_Base_Hand_L = <Timer_Base_Hand_L>
	else
		Timer_Base_Hand_L = (<Timer_Base_Hand_L> + <AnimStep_Hand_L>)
	endif
	if ((<Timer_Base_Foot_R> >= (<Drum_Idlepoint_Foot_Hit>)) && (<Timer_MS_Foot_R> > <Drummer_IdlePoint_Foot_MS>))
		Timer_Base_Foot_R = <Timer_Base_Foot_R>
	else
		Timer_Base_Foot_R = (<Timer_Base_Foot_R> + <AnimStep_Foot_R>)
	endif
	wait \{1
		frame}
	First_Hit = false
	repeat
endscript

script check_for_drummers 
	array = []
	Num_Drummers = 0
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
	if ($<musician_info>.part = Drum)
		AddChecksumArrayElement array = <array> element = <musician_id>
		Num_Drummers = (<Num_Drummers> + 1)
		if (<Num_Drummers> >= $Number_drummers_Created)
			break
		endif
	endif
	index = (<index> + 1)
	repeat 4
	if (<Num_Drummers> > 0)
		return true drummer_Ids = <array> Num_Drummers = <Num_Drummers>
	else
		return \{false}
	endif
endscript
