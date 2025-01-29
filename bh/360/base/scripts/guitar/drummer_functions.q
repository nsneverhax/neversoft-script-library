DrumTest = 1

script Drummer_Kill_Spawnscripts 
	killspawnedscript \{name = DrumDroid_Timers}
	killspawnedscript \{name = hide_Non_Drummers}
	killspawnedscript \{name = hit_drumkit_piece}
	killspawnedscript \{name = Default_Kit_anims}
	killspawnedscript \{name = default_drummer_state}
	killspawnedscript \{name = drummer_controlscript}
	killspawnedscript \{name = Drummer_Transit_Base_Short}
	killspawnedscript \{name = drummer_transit_base_long}
	killspawnedscript \{name = Drummer_Transit_Arm_R}
	killspawnedscript \{name = Drummer_Transit_Arm_L}
	killspawnedscript \{name = drummer_transit_loops}
	killspawnedscript \{name = drummer_transit_idles}
	killspawnedscript \{name = Drummer_Current_Tempo}
	killspawnedscript \{name = Set_drummer_Active_Values}
	killspawnedscript \{name = hold_transit_requests}
	killspawnedscript \{name = hold_transit_arms}
	killspawnedscript \{name = hold_active_values}
	killspawnedscript \{name = Drummer_Anticipation_Arms}
	killspawnedscript \{name = hold_drummer_anticipation_arms}
	killspawnedscript \{name = Hold_DrumKit_Piece}
	killspawnedscript \{name = hold_body_trans}
	killspawnedscript \{name = hold_body_loops}
	killspawnedscript \{name = idle_check}
endscript

script Drummer_Reset_Globals 
	Change \{Last_Time_To_Hit_R = 1000.0}
	Change \{Last_Time_To_Hit_L = 1000.0}
	Change \{Use_DB_Branch_L = 1}
	Change \{Use_DB_Branch_R = 1}
	Change \{Use_DB_Base = 1}
	Change \{Current_DB_Base = 1}
	Change \{Drummer_Idle = true}
	Drummer_Kill_Spawnscripts
endscript

script flamfinder 
	if ((<Time_to_Hit_3> < 50.0) && (<Num_Pieces_Hit_3> = 1) && (<Num_Pieces_Hit_2> = 1))
		offset = <Time_to_Hit_3>
		Num_Pieces_Hit_2 = 2
		if (<pieces_value_2_1> <= <pieces_value_3_1>)
			pieces_value_2_2 = <pieces_value_3_1>
		else
			pieces_value_2_1 = <pieces_value_3_1>
		endif
		shift_From = 3
		Shift_Notes <...>
		update_notehit_data current_song = <current_song>
		Time_to_Hit_3 = (<Time_to_Hit_3> + <offset>)
	endif
	if ((<Time_to_Hit_4> < 50.0) && (<Num_Pieces_Hit_4> = 1) && (<Num_Pieces_Hit_3> = 1))
		offset = <Time_to_Hit_4>
		Num_Pieces_Hit_3 = 2
		if (<pieces_value_3_1> <= <pieces_value_4_1>)
			pieces_value_3_2 = <pieces_value_4_1>
		else
			pieces_value_3_1 = <pieces_value_4_1>
		endif
		shift_From = 4
		Shift_Notes <...>
		update_notehit_data current_song = <current_song>
		Time_to_Hit_4 = (<Time_to_Hit_4> + <offset>)
	endif
	if ((<Time_to_Hit_5> < 50.0) && (<Num_Pieces_Hit_5> = 1) && (<Num_Pieces_Hit_4> = 1))
		offset = <Time_to_Hit_5>
		Num_Pieces_Hit_4 = 2
		if (<pieces_value_4_1> <= <pieces_value_5_1>)
			pieces_value_4_2 = <pieces_value_5_1>
		else
			pieces_value_4_1 = <pieces_value_5_1>
		endif
		shift_From = 5
		Shift_Notes <...>
		update_notehit_data current_song = <current_song>
		Time_to_Hit_5 = (<Time_to_Hit_5> + <offset>)
	endif
	if ((<Time_to_Hit_6> < 50.0) && (<Num_Pieces_Hit_6> = 1) && (<Num_Pieces_Hit_5> = 1))
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
	return <...>
	current_song = None
	offset = 0.0
	Time_to_Hit_4 = 0.0
	Time_to_Hit_3 = 0.0
	Time_to_Hit_5 = 0.0
	Time_to_Hit_6 = 0.0
	pieces_value_2_1 = 0
	pieces_value_3_1 = 0
	pieces_value_4_1 = 0
	pieces_value_5_1 = 0
	Num_Pieces_Hit_2 = 0
	Num_Pieces_Hit_3 = 0
	Num_Pieces_Hit_4 = 0
	Num_Pieces_Hit_5 = 0
	Num_Pieces_Hit_6 = 0
	pieces_value_6_1 = 0
	pieces_value_2_2 = 0
	pieces_value_3_2 = 0
	pieces_value_4_2 = 0
	pieces_value_5_2 = 0
endscript

script Shift_Notes 
	if (<shift_From> = 3)
		Time_to_Hit_3 = <Time_to_Hit_4>
		Hit_Velocity_3_1 = <Hit_Velocity_4_1>
		Hit_Velocity_3_2 = <Hit_Velocity_4_2>
		Num_Pieces_Hit_3 = <Num_Pieces_Hit_4>
		pieces_value_3_1 = <pieces_value_4_1>
		pieces_value_3_2 = <pieces_value_4_2>
		old_time = ($drumnote_times [3])
		SetArrayElement arrayName = drumnote_times GlobalArray index = 2 newValue = <old_time>
	endif
	if (<shift_From> <= 4)
		Time_to_Hit_4 = <Time_to_Hit_5>
		Hit_Velocity_4_1 = <Hit_Velocity_5_1>
		Hit_Velocity_4_2 = <Hit_Velocity_5_2>
		Num_Pieces_Hit_4 = <Num_Pieces_Hit_5>
		pieces_value_4_1 = <pieces_value_5_1>
		pieces_value_4_2 = <pieces_value_5_2>
		old_time = ($drumnote_times [4])
		SetArrayElement arrayName = drumnote_times GlobalArray index = 3 newValue = <old_time>
	endif
	if (<shift_From> <= 5)
		Time_to_Hit_5 = <Time_to_Hit_6>
		Hit_Velocity_5_1 = <Hit_Velocity_6_1>
		Hit_Velocity_5_2 = <Hit_Velocity_6_2>
		Num_Pieces_Hit_5 = <Num_Pieces_Hit_6>
		pieces_value_5_1 = <pieces_value_6_1>
		pieces_value_5_2 = <pieces_value_6_2>
		old_time = ($drumnote_times [5])
		SetArrayElement arrayName = drumnote_times GlobalArray index = 4 newValue = <old_time>
	endif
	return <...>
	Time_to_Hit_3 = 0.0
	Time_to_Hit_4 = 0.0
	Time_to_Hit_5 = 0.0
	Time_to_Hit_6 = 0.0
	Hit_Velocity_3_1 = 0
	Hit_Velocity_3_2 = 0
	Num_Pieces_Hit_3 = 0
	pieces_value_3_1 = 0
	pieces_value_3_2 = 0
	Hit_Velocity_4_1 = 0
	Hit_Velocity_4_2 = 0
	Num_Pieces_Hit_4 = 0
	pieces_value_4_1 = 0
	pieces_value_4_2 = 0
	Hit_Velocity_5_1 = 0
	Hit_Velocity_5_2 = 0
	Num_Pieces_Hit_5 = 0
	pieces_value_5_1 = 0
	pieces_value_5_2 = 0
	Hit_Velocity_6_1 = 0
	Hit_Velocity_6_2 = 0
	Num_Pieces_Hit_6 = 0
	pieces_value_6_1 = 0
	pieces_value_6_2 = 0
endscript

script orgainize_drum_value \{pieces_Value_1 = 0
		pieces_Value_2 = 0
		velocity1 = 0
		velocity2 = 0}
	pieces_Value_3 = 0
	velocity3 = 0
	if (<pieces_Value_1> > <pieces_Value_2>)
		pieces_Value_3 = <pieces_Value_1>
		velocity3 = <velocity1>
		pieces_Value_1 = <pieces_Value_2>
		velocity1 = <velocity2>
		pieces_Value_2 = <pieces_Value_3>
		velocity2 = <velocity3>
	endif
	return pieces_Value_1 = <pieces_Value_1> pieces_Value_2 = <pieces_Value_2> velocity1 = <velocity1> velocity2 = <velocity2>
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

script create_target_state \{Value_L = 0
		Value_R = 0}
	switch (<Value_L>)
		case 0
		state = 'S1T3'
		case 1
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
			case 7
			state = 'T3T3'
			case 8
			state = 'T3C3'
			default
			state = 'S1T3'
		endswitch
		case 8
		switch (<Value_R>)
			case 8
			state = 'C3C3'
			default
			state = 'S1T3'
		endswitch
		default
		state = 'S1T3'
	endswitch
	return State_String = <state>
endscript

script create_target_state_full \{Value_L = 0
		Value_R = 0}
	switch (<Value_L>)
		case 0
		state = 'S1T3'
		case 1
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
		switch (<Value_R>)
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
	return State_String = <state>
endscript

script Drummer_Priority_Init 
	PL = 1.0
	PR = 1.0
	Piece_Diff_Spead = 1.0
	switch <l>
		case 0
		PL = 10000.0
		case 1
		PL = (1.0 + (<Piece_Diff_Spead> * 0.5))
		case 2
		PL = 1.0
		case 3
		PL = 1.0
		case 4
		PL = (1.0 + (<Piece_Diff_Spead> * 0.2))
		case 5
		PL = (1.0 + (<Piece_Diff_Spead> * 0.2))
		case 6
		PL = (1.0 - (<Piece_Diff_Spead> * 0.3))
		case 7
		PL = 1.0
		case 8
		PL = (1.0 - (<Piece_Diff_Spead> * 0.3))
		default
	endswitch
	switch <r>
		case 0
		PR = 10000.0
		case 1
		PR = 1.0
		case 2
		PR = 1.0
		case 3
		PR = (1.0 + (<Piece_Diff_Spead> * 0.7))
		case 4
		PR = 1.0
		case 5
		PR = 1.0
		case 6
		PR = (1.0 + (<Piece_Diff_Spead> * 0.7))
		case 7
		PR = (1.0 + (<Piece_Diff_Spead> * 0.5))
		case 8
		PR = (1.0 + (<Piece_Diff_Spead> * 0.7))
		default
	endswitch
	PL = (<PL> * <strength>)
	PR = (<PR> * <strength>)
	return PL = <PL> PR = <PR>
	l = 0
	r = 0
	strength = 0.0
endscript

script Compare_Note_Values 
	Global_multiplier = 1.0
	if (<note1> < <note2>)
		lower = <note1>
		Higher = <note2>
	else
		lower = <note2>
		Higher = <note1>
	endif
	switch <lower>
		case 0
		Multiplier = 1.0
		case 1
		switch <Higher>
			case 1
			Multiplier = 1.0
			case 2
			Multiplier = 0.8
			case 3
			Multiplier = 0.6
			case 4
			Multiplier = 0.9
			case 5
			Multiplier = 0.8
			case 6
			Multiplier = 0.3
			case 7
			Multiplier = 0.7
			case 8
			Multiplier = 0.5
			default
			Multiplier = 1.0
		endswitch
		case 2
		switch <Higher>
			case 2
			Multiplier = 1.0
			case 3
			Multiplier = 0.8
			case 4
			Multiplier = 0.8
			case 5
			Multiplier = 0.6
			case 6
			Multiplier = 0.4
			case 7
			Multiplier = 0.6
			case 8
			Multiplier = 0.3
			default
			Multiplier = 1.0
		endswitch
		case 3
		switch <Higher>
			case 3
			Multiplier = 1.0
			case 4
			Multiplier = 0.6
			case 5
			Multiplier = 0.5
			case 6
			Multiplier = 0.8
			case 7
			Multiplier = 0.4
			case 8
			Multiplier = 0.7
			default
			Multiplier = 1.0
		endswitch
		case 4
		switch <Higher>
			case 4
			Multiplier = 1.0
			case 5
			Multiplier = 0.9
			case 6
			Multiplier = 0.6
			case 7
			Multiplier = 0.8
			case 8
			Multiplier = 0.5
			default
			Multiplier = 1.0
		endswitch
		case 5
		switch <Higher>
			case 5
			Multiplier = 1.0
			case 6
			Multiplier = 0.6
			case 7
			Multiplier = 0.9
			case 8
			Multiplier = 0.6
			default
			Multiplier = 1.0
		endswitch
		case 6
		switch <Higher>
			case 6
			Multiplier = 1.0
			case 7
			Multiplier = 0.5
			case 8
			Multiplier = 0.8
			default
			Multiplier = 1.0
		endswitch
		case 7
		switch <Higher>
			case 7
			Multiplier = 1.0
			case 8
			Multiplier = 0.6
			default
			Multiplier = 1.0
		endswitch
		case 8
		switch <Higher>
			case 8
			Multiplier = 1.0
			default
			Multiplier = 1.0
		endswitch
		default
		Multiplier = 1.0
	endswitch
	Multiplier = (1 - ((1 - <Multiplier>) * <Global_multiplier>))
	return Multiplier = <Multiplier>
	note1 = 0
	note2 = 0
	lower = 0
	Higher = 0
endscript

script Prioritize_Piece_Value 
	Compare_Note_Values note1 = <Test_Value> note2 = <value_1>
	Priority_1 = (<Priority_1> * <Multiplier>)
	Compare_Note_Values note1 = <Test_Value> note2 = <value_2>
	Priority_2 = (<Priority_2> * <Multiplier>)
	Compare_Note_Values note1 = <Test_Value> note2 = <value_3>
	Priority_3 = (<Priority_3> * <Multiplier>)
	Compare_Note_Values note1 = <Test_Value> note2 = <value_4>
	Priority_4 = (<Priority_4> * <Multiplier>)
	Compare_Note_Values note1 = <Test_Value> note2 = <value_5>
	Priority_5 = (<Priority_5> * <Multiplier>)
	Compare_Note_Values note1 = <Test_Value> note2 = <value_6>
	Priority_6 = (<Priority_6> * <Multiplier>)
	if (<hand> = r)
		return {
			Priority_1_R = <Priority_1>
			Priority_2_R = <Priority_2>
			Priority_3_R = <Priority_3>
			Priority_4_R = <Priority_4>
			Priority_5_R = <Priority_5>
			Priority_6_R = <Priority_6>
		}
	else
		return {
			Priority_1_L = <Priority_1>
			Priority_2_L = <Priority_2>
			Priority_3_L = <Priority_3>
			Priority_4_L = <Priority_4>
			Priority_5_L = <Priority_5>
			Priority_6_L = <Priority_6>
		}
	endif
	Test_Value = 0
	value_1 = 0
	Priority_1 = 0.0
	Multiplier = 0.0
	value_2 = 0
	Priority_2 = 0.0
	value_3 = 0
	Priority_3 = 0.0
	value_4 = 0
	Priority_4 = 0.0
	value_5 = 0
	Priority_5 = 0.0
	value_6 = 0
	Priority_6 = 0.0
endscript

script Prioritize_Time_To_hit_Fast 
	Fast_multiplier = 4.0
	unique = 1.5
	is_unique = true
	min = 50.0
	Max = 200.0
	Multiplier = 1.0
	if (<time1> < <Max>)
		if (<time1> < <min>)
			Multiplier = <Fast_multiplier>
		else
			Multiplier = (1 + (<Fast_multiplier> * (1 - ((<time1> - <min>) / (<Max> - <min>)))))
		endif
		if (<is_unique> = true)
			Multiplier = (<Multiplier> * <unique>)
		endif
		Priority_1_R = (<Priority_1_R> * <Multiplier>)
		Priority_1_L = (<Priority_1_L> * <Multiplier>)
	endif
	if (<time2> < <Max>)
		if (<time2> < <min>)
			Multiplier = <Fast_multiplier>
		else
			Multiplier = (1 + (<Fast_multiplier> * (1 - ((<time2> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_2_1>) || (<pieces_value_1_2> = <pieces_value_2_2>))
			Priority_1_R = (<Priority_1_R> * <Multiplier>)
			Priority_1_L = (<Priority_1_L> * <Multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			Multiplier = (<Multiplier> * <unique>)
		endif
		Priority_2_R = (<Priority_2_R> * <Multiplier>)
		Priority_2_L = (<Priority_2_L> * <Multiplier>)
		is_unique = true
	endif
	if (<Time3> < <Max>)
		if (<Time3> < <min>)
			Multiplier = <Fast_multiplier>
		else
			Multiplier = (1 + (<Fast_multiplier> * (1 - ((<Time3> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_3_1>) || (<pieces_value_1_2> = <pieces_value_3_2>))
			Priority_1_R = (<Priority_1_R> * <Multiplier>)
			Priority_1_L = (<Priority_1_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_2_1> = <pieces_value_3_1>) || (<pieces_value_2_2> = <pieces_value_3_2>))
			Priority_2_R = (<Priority_2_R> * <Multiplier>)
			Priority_2_L = (<Priority_2_L> * <Multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			Multiplier = (<Multiplier> * <unique>)
		endif
		Priority_3_R = (<Priority_3_R> * <Multiplier>)
		Priority_3_L = (<Priority_3_L> * <Multiplier>)
		is_unique = true
	endif
	if (<Time4> < <Max>)
		if (<Time4> < <min>)
			Multiplier = <Fast_multiplier>
		else
			Multiplier = (1 + (<Fast_multiplier> * (1 - ((<Time4> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_4_1>) || (<pieces_value_1_2> = <pieces_value_4_2>))
			Priority_1_R = (<Priority_1_R> * <Multiplier>)
			Priority_1_L = (<Priority_1_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_2_1> = <pieces_value_4_1>) || (<pieces_value_2_2> = <pieces_value_4_2>))
			Priority_2_R = (<Priority_2_R> * <Multiplier>)
			Priority_2_L = (<Priority_2_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_3_1> = <pieces_value_4_1>) || (<pieces_value_3_2> = <pieces_value_4_2>))
			Priority_3_R = (<Priority_3_R> * <Multiplier>)
			Priority_3_L = (<Priority_3_L> * <Multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			Multiplier = (<Multiplier> * <unique>)
		endif
		Priority_4_R = (<Priority_4_R> * <Multiplier>)
		Priority_4_L = (<Priority_4_L> * <Multiplier>)
		is_unique = true
	endif
	if (<Time5> < <Max>)
		if (<Time5> < <min>)
			Multiplier = <Fast_multiplier>
		else
			Multiplier = (1 + (<Fast_multiplier> * (1 - ((<Time5> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_5_1>) || (<pieces_value_1_2> = <pieces_value_5_2>))
			Priority_1_R = (<Priority_1_R> * <Multiplier>)
			Priority_1_L = (<Priority_1_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_2_1> = <pieces_value_5_1>) || (<pieces_value_2_2> = <pieces_value_5_2>))
			Priority_2_R = (<Priority_2_R> * <Multiplier>)
			Priority_2_L = (<Priority_2_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_3_1> = <pieces_value_5_1>) || (<pieces_value_3_2> = <pieces_value_5_2>))
			Priority_3_R = (<Priority_3_R> * <Multiplier>)
			Priority_3_L = (<Priority_3_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_4_1> = <pieces_value_5_1>) || (<pieces_value_4_2> = <pieces_value_5_2>))
			Priority_4_R = (<Priority_4_R> * <Multiplier>)
			Priority_4_L = (<Priority_4_L> * <Multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			Multiplier = (<Multiplier> * <unique>)
		endif
		Priority_5_R = (<Priority_5_R> * <Multiplier>)
		Priority_5_L = (<Priority_5_L> * <Multiplier>)
		is_unique = true
	endif
	if (<Time6> < <Max>)
		if (<Time6> < <min>)
			Multiplier = <Fast_multiplier>
		else
			Multiplier = (1 + (<Fast_multiplier> * (1 - ((<Time6> - <min>) / (<Max> - <min>)))))
		endif
		if ((<pieces_value_1_1> = <pieces_value_6_1>) || (<pieces_value_1_2> = <pieces_value_6_2>))
			Priority_1_R = (<Priority_1_R> * <Multiplier>)
			Priority_1_L = (<Priority_1_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_2_1> = <pieces_value_6_1>) || (<pieces_value_2_2> = <pieces_value_6_2>))
			Priority_2_R = (<Priority_2_R> * <Multiplier>)
			Priority_2_L = (<Priority_2_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_3_1> = <pieces_value_6_1>) || (<pieces_value_3_2> = <pieces_value_6_2>))
			Priority_3_R = (<Priority_3_R> * <Multiplier>)
			Priority_3_L = (<Priority_3_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_4_1> = <pieces_value_6_1>) || (<pieces_value_4_2> = <pieces_value_6_2>))
			Priority_4_R = (<Priority_4_R> * <Multiplier>)
			Priority_4_L = (<Priority_4_L> * <Multiplier>)
			is_unique = false
		endif
		if ((<pieces_value_5_1> = <pieces_value_6_1>) || (<pieces_value_5_2> = <pieces_value_6_2>))
			Priority_5_R = (<Priority_5_R> * <Multiplier>)
			Priority_5_L = (<Priority_5_L> * <Multiplier>)
			is_unique = false
		endif
		if (<is_unique> = true)
			Multiplier = (<Multiplier> * <unique>)
		endif
		Priority_6_R = (<Priority_6_R> * <Multiplier>)
		Priority_6_L = (<Priority_6_L> * <Multiplier>)
	endif
	return {
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
	Priority_1_R = 0.0
	Priority_1_L = 0.0
	Priority_2_R = 0.0
	Priority_2_L = 0.0
	Priority_3_R = 0.0
	Priority_3_L = 0.0
	Priority_4_R = 0.0
	Priority_4_L = 0.0
	Priority_5_R = 0.0
	Priority_5_L = 0.0
	Priority_6_R = 0.0
	Priority_6_L = 0.0
endscript

script Prioritize_Time_To_hit_Slow 
	Slow_multiplier = 0.1
	min = 10.0
	Max = 6000.0
	Multiplier = 1.0
	if (<time2> > <min>)
		if (<time2> > <Max>)
			Multiplier = <Slow_multiplier>
		else
			Multiplier = (1 - ((1 - <Slow_multiplier>) * ((<time2> - <min>) / (<Max> - <min>))))
		endif
		Priority_2_R = (<Priority_2_R> * <Multiplier>)
		Priority_3_R = (<Priority_3_R> * <Multiplier>)
		Priority_4_R = (<Priority_4_R> * <Multiplier>)
		Priority_5_R = (<Priority_5_R> * <Multiplier>)
		Priority_6_R = (<Priority_6_R> * <Multiplier>)
		Priority_2_L = (<Priority_2_L> * <Multiplier>)
		Priority_3_L = (<Priority_3_L> * <Multiplier>)
		Priority_4_L = (<Priority_4_L> * <Multiplier>)
		Priority_5_L = (<Priority_5_L> * <Multiplier>)
		Priority_6_L = (<Priority_6_L> * <Multiplier>)
	endif
	if (<Time3> > <min>)
		if (<Time3> > <Max>)
			Multiplier = <Slow_multiplier>
		else
			Multiplier = (1 - ((1 - <Slow_multiplier>) * ((<Time3> - <min>) / (<Max> - <min>))))
		endif
		Priority_3_R = (<Priority_3_R> * <Multiplier>)
		Priority_4_R = (<Priority_4_R> * <Multiplier>)
		Priority_5_R = (<Priority_5_R> * <Multiplier>)
		Priority_6_R = (<Priority_6_R> * <Multiplier>)
		Priority_3_L = (<Priority_3_L> * <Multiplier>)
		Priority_4_L = (<Priority_4_L> * <Multiplier>)
		Priority_5_L = (<Priority_5_L> * <Multiplier>)
		Priority_6_L = (<Priority_6_L> * <Multiplier>)
	endif
	if (<Time4> > <min>)
		if (<Time4> > <Max>)
			Multiplier = <Slow_multiplier>
		else
			Multiplier = (1 - ((1 - <Slow_multiplier>) * ((<Time4> - <min>) / (<Max> - <min>))))
		endif
		Priority_4_R = (<Priority_4_R> * <Multiplier>)
		Priority_5_R = (<Priority_5_R> * <Multiplier>)
		Priority_6_R = (<Priority_6_R> * <Multiplier>)
		Priority_4_L = (<Priority_4_L> * <Multiplier>)
		Priority_5_L = (<Priority_5_L> * <Multiplier>)
		Priority_6_L = (<Priority_6_L> * <Multiplier>)
	endif
	if (<Time5> > <min>)
		if (<Time5> > <Max>)
			Multiplier = <Slow_multiplier>
		else
			Multiplier = (1 - ((1 - <Slow_multiplier>) * ((<Time5> - <min>) / (<Max> - <min>))))
		endif
		Priority_5_R = (<Priority_5_R> * <Multiplier>)
		Priority_6_R = (<Priority_6_R> * <Multiplier>)
		Priority_5_L = (<Priority_5_L> * <Multiplier>)
		Priority_6_L = (<Priority_6_L> * <Multiplier>)
	endif
	if (<Time6> > <min>)
		if (<Time6> > <Max>)
			Multiplier = <Slow_multiplier>
		else
			Multiplier = (1 - ((1 - <Slow_multiplier>) * ((<Time6> - <min>) / (<Max> - <min>))))
		endif
		Priority_6_R = (<Priority_6_R> * <Multiplier>)
		Priority_6_R = (<Priority_6_R> * <Multiplier>)
		Priority_6_L = (<Priority_6_L> * <Multiplier>)
		Priority_6_L = (<Priority_6_L> * <Multiplier>)
	endif
	return {
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
	}
	Priority_2_R = 0.0
	Priority_3_R = 0.0
	Priority_4_R = 0.0
	Priority_5_R = 0.0
	Priority_6_R = 0.0
	Priority_2_L = 0.0
	Priority_3_L = 0.0
	Priority_4_L = 0.0
	Priority_5_L = 0.0
	Priority_6_L = 0.0
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

script Choose_Highest_Priority 
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

script Check_Furthest_possible_L 
	if (<pieces_value_6_1> <= <pieces_value_1_2>)
		if (<pieces_value_6_1> <= <pieces_value_2_2>)
			if (<pieces_value_6_1> <= <pieces_value_3_2>)
				if (<pieces_value_6_1> <= <pieces_value_4_2>)
					if (<pieces_value_6_1> <= <pieces_value_5_2>)
						Priority_6_L = <Priority_6_L>
					else
						Priority_6_L = 0.0
					endif
				else
					Priority_6_L = 0.0
				endif
			else
				Priority_6_L = 0.0
			endif
		else
			Priority_6_L = 0.0
		endif
	else
		Priority_6_L = 0.0
	endif
	if (<pieces_value_5_1> <= <pieces_value_1_2>)
		if (<pieces_value_5_1> <= <pieces_value_2_2>)
			if (<pieces_value_5_1> <= <pieces_value_3_2>)
				if (<pieces_value_5_1> <= <pieces_value_4_2>)
					Priority_5_L = <Priority_5_L>
				else
					Priority_5_L = 0.0
				endif
			else
				Priority_5_L = 0.0
			endif
		else
			Priority_5_L = 0.0
		endif
	else
		Priority_5_L = 0.0
	endif
	if (<pieces_value_4_1> <= <pieces_value_1_2>)
		if (<pieces_value_4_1> <= <pieces_value_2_2>)
			if (<pieces_value_4_1> <= <pieces_value_3_2>)
				Priority_4_L = <Priority_4_L>
			else
				Priority_4_L = 0.0
			endif
		else
			Priority_4_L = 0.0
		endif
	else
		Priority_4_L = 0.0
	endif
	if (<pieces_value_3_1> <= <pieces_value_1_2>)
		if (<pieces_value_3_1> <= <pieces_value_2_2>)
			Priority_3_L = <Priority_3_L>
		else
			Priority_3_L = 0.0
		endif
	else
		Priority_3_L = 0.0
	endif
	if (<pieces_value_2_1> <= <pieces_value_1_2>)
		Priority_2_L = <Priority_2_L>
	else
		Priority_2_L = 0.0
	endif
	return {
		Priority_2_L = <Priority_2_L>
		Priority_3_L = <Priority_3_L>
		Priority_4_L = <Priority_4_L>
		Priority_5_L = <Priority_5_L>
		Priority_6_L = <Priority_6_L>
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

script Check_Crossover_R 
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
						Priority_6_R = <Priority_6_R>
					else
						Check_Crossover_R val_1 = <pieces_value_5_1> val_2 = <pieces_value_6_2>
						if (<allowed> = false)
							Priority_6_R = 0.0
						endif
					endif
				else
					Check_Crossover_R val_1 = <pieces_value_4_1> val_2 = <pieces_value_6_2>
					if (<allowed> = false)
						Priority_6_R = 0.0
					endif
				endif
			else
				Check_Crossover_R val_1 = <pieces_value_3_1> val_2 = <pieces_value_6_2>
				if (<allowed> = false)
					Priority_6_R = 0.0
				endif
			endif
		else
			Check_Crossover_R val_1 = <pieces_value_2_1> val_2 = <pieces_value_6_2>
			if (<allowed> = false)
				Priority_6_R = 0.0
			endif
		endif
	else
		Check_Crossover_R val_1 = <pieces_value_1_1> val_2 = <pieces_value_6_2>
		if (<allowed> = false)
			Priority_6_R = 0.0
		endif
	endif
	if (<pieces_value_5_2> >= <pieces_value_1_1>)
		if (<pieces_value_5_2> >= <pieces_value_2_1>)
			if (<pieces_value_5_2> >= <pieces_value_3_1>)
				if (<pieces_value_5_2> >= <pieces_value_4_1>)
					Priority_5_R = <Priority_5_R>
				else
					Check_Crossover_R val_1 = <pieces_value_4_1> val_2 = <pieces_value_5_2>
					if (<allowed> = false)
						Priority_5_R = 0.0
					endif
				endif
			else
				Check_Crossover_R val_1 = <pieces_value_3_1> val_2 = <pieces_value_5_2>
				if (<allowed> = false)
					Priority_5_R = 0.0
				endif
			endif
		else
			Check_Crossover_R val_1 = <pieces_value_2_1> val_2 = <pieces_value_5_2>
			if (<allowed> = false)
				Priority_5_R = 0.0
			endif
		endif
	else
		Check_Crossover_R val_1 = <pieces_value_1_1> val_2 = <pieces_value_5_2>
		if (<allowed> = false)
			Priority_5_R = 0.0
		endif
	endif
	if (<pieces_value_4_2> >= <pieces_value_1_1>)
		if (<pieces_value_4_2> >= <pieces_value_2_1>)
			if (<pieces_value_4_2> >= <pieces_value_3_1>)
				Priority_4_R = <Priority_4_R>
			else
				Check_Crossover_R val_1 = <pieces_value_3_1> val_2 = <pieces_value_4_2>
				if (<allowed> = false)
					Priority_4_R = 0.0
				endif
			endif
		else
			Check_Crossover_R val_1 = <pieces_value_2_1> val_2 = <pieces_value_4_2>
			if (<allowed> = false)
				Priority_4_R = 0.0
			endif
		endif
	else
		Check_Crossover_R val_1 = <pieces_value_1_1> val_2 = <pieces_value_4_2>
		if (<allowed> = false)
			Priority_4_R = 0.0
		endif
	endif
	if (<pieces_value_3_2> >= <pieces_value_1_1>)
		if (<pieces_value_3_2> >= <pieces_value_2_1>)
			Priority_3_R = <Priority_3_R>
		else
			Check_Crossover_R val_1 = <pieces_value_2_1> val_2 = <pieces_value_3_2>
			if (<allowed> = false)
				Priority_3_R = 0.0
			endif
		endif
	else
		Check_Crossover_R val_1 = <pieces_value_1_1> val_2 = <pieces_value_3_2>
		if (<allowed> = false)
			Priority_3_R = 0.0
		endif
	endif
	if (<pieces_value_2_2> >= <pieces_value_1_1>)
		Priority_2_R = <Priority_2_R>
	else
		Check_Crossover_R val_1 = <pieces_value_1_1> val_2 = <pieces_value_2_2>
		if (<allowed> = false)
			Priority_2_R = 0.0
		endif
	endif
	return {
		Priority_2_R = <Priority_2_R>
		Priority_3_R = <Priority_3_R>
		Priority_4_R = <Priority_4_R>
		Priority_5_R = <Priority_5_R>
		Priority_6_R = <Priority_6_R>
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

script Extract_Target_Info 
	switch <target>
		case 1
		distance = 1
		value = <pieces_Value_1>
		Priority = <p1>
		case 2
		distance = 2
		value = <pieces_Value_2>
		Priority = <p2>
		case 3
		distance = 3
		value = <pieces_Value_3>
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
	pieces_Value_1 = 0
	p1 = 0.0
	pieces_Value_2 = 0
	p2 = 0.0
	pieces_Value_3 = 0
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
	ExtendCRCWithString checksum = `` string = <song_prefix>
	ArrayPrefix = <ExtendedChecksum>
	ExtendCRCWithString checksum = <ArrayPrefix> string = '_drums_notes'
	event_array = <ExtendedChecksum>
	if NOT GlobalExists name = <event_array> type = array
		return
	endif
	array_size = 0
	FastGetArraySize array = $<event_array>
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
	note = 0
	velocity = 0
	begin
	piece_array = []
	piece_array2 = []
	piece_velocities = []
	num_pieces_hit = 0
	current_time = ($<event_array> [<next_array_entry>])
	begin
	DecompressNoteValue note_value = ($<event_array> [(<next_array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		switch (<note>)
			case 73
			name = kick
			value = 0
			case 74
			name = T3
			value = 7
			case 75
			name = T2
			value = 5
			case 76
			name = t1
			value = 4
			case 77
			name = s1
			value = 1
			case 78
			name = H1c
			value = 2
			case 79
			name = H1o
			value = 2
			case 80
			name = C3
			value = 8
			case 81
			name = C1
			value = 3
			case 82
			name = C2
			value = 6
			case 83
			name = countin
			value = 0
		endswitch
		AddChecksumArrayElement array = <piece_array> element = <name>
		piece_array = <array>
		AddIntegerArrayElement2 array = <piece_array2> element = <value>
		piece_array2 = <array>
		AddIntegerArrayElement2 array = <piece_velocities> element = <velocity>
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
		AddStructureArrayElement array = <hit_info> element = <new_entry>
		hit_info = <array>
		Change last_drumnote_time = <current_time>
		SetArrayElement arrayName = drumnote_times GlobalArray index = <index> newValue = <current_time>
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
	array_size = 0
	FastGetArraySize array = <hit_info>
	if (<array_size> > 0)
		time_to_Hit_2 = (<hit_info> [0].time_to_hit)
		Num_Pieces_Hit_2 = (<hit_info> [0].num_pieces_hit)
		pieces_value_2_1 = (<hit_info> [0].pieces_value [0])
		Hit_Velocity_2_1 = (<hit_info> [0].pieces_velocity [0])
		if (<Num_Pieces_Hit_2> > 1)
			pieces_value_2_2 = (<hit_info> [0].pieces_value [1])
			Hit_Velocity_2_2 = (<hit_info> [0].pieces_velocity [1])
		else
			pieces_value_2_2 = <pieces_value_2_1>
			Hit_Velocity_2_2 = <Hit_Velocity_2_1>
		endif
	else
		time_to_Hit_2 = 10000000.0
		Num_Pieces_Hit_2 = 2
		endofsong = true
		pieces_value_2_1 = 3
		pieces_value_2_2 = 7
		Hit_Velocity_2_1 = 100
		Hit_Velocity_2_2 = 100
	endif
	if (<array_size> > 1)
		Time_to_Hit_3 = (<hit_info> [1].time_to_hit)
		Num_Pieces_Hit_3 = (<hit_info> [1].num_pieces_hit)
		pieces_value_3_1 = (<hit_info> [1].pieces_value [0])
		Hit_Velocity_3_1 = (<hit_info> [1].pieces_velocity [0])
		if (<Num_Pieces_Hit_3> > 1)
			pieces_value_3_2 = (<hit_info> [1].pieces_value [1])
			Hit_Velocity_3_2 = (<hit_info> [1].pieces_velocity [1])
		else
			pieces_value_3_2 = <pieces_value_3_1>
			Hit_Velocity_3_2 = <Hit_Velocity_3_1>
		endif
	else
		Time_to_Hit_3 = 10000000.0
		Num_Pieces_Hit_3 = 0
		pieces_value_3_1 = 0
		pieces_value_3_2 = 0
		Hit_Velocity_3_1 = 100
		Hit_Velocity_3_2 = 100
	endif
	if (<array_size> > 2)
		Time_to_Hit_4 = (<hit_info> [2].time_to_hit)
		Num_Pieces_Hit_4 = (<hit_info> [2].num_pieces_hit)
		pieces_value_4_1 = (<hit_info> [2].pieces_value [0])
		Hit_Velocity_4_1 = (<hit_info> [2].pieces_velocity [0])
		if (<Num_Pieces_Hit_4> > 1)
			pieces_value_4_2 = (<hit_info> [2].pieces_value [1])
			Hit_Velocity_4_2 = (<hit_info> [2].pieces_velocity [1])
		else
			pieces_value_4_2 = <pieces_value_4_1>
			Hit_Velocity_4_2 = <Hit_Velocity_4_1>
		endif
	else
		Time_to_Hit_4 = 10000000.0
		Num_Pieces_Hit_4 = 0
		pieces_value_4_1 = 0
		pieces_value_4_2 = 0
		Hit_Velocity_4_1 = 100
		Hit_Velocity_4_2 = 100
	endif
	if (<array_size> > 3)
		Time_to_Hit_5 = (<hit_info> [3].time_to_hit)
		Num_Pieces_Hit_5 = (<hit_info> [3].num_pieces_hit)
		pieces_value_5_1 = (<hit_info> [3].pieces_value [0])
		Hit_Velocity_5_1 = (<hit_info> [3].pieces_velocity [0])
		if (<Num_Pieces_Hit_5> > 1)
			pieces_value_5_2 = (<hit_info> [3].pieces_value [1])
			Hit_Velocity_5_2 = (<hit_info> [3].pieces_velocity [1])
		else
			pieces_value_5_2 = <pieces_value_5_1>
			Hit_Velocity_5_2 = <Hit_Velocity_5_1>
		endif
	else
		Time_to_Hit_5 = 10000000.0
		Num_Pieces_Hit_5 = 0
		pieces_value_5_1 = 0
		pieces_value_5_2 = 0
		Hit_Velocity_5_1 = 100
		Hit_Velocity_5_2 = 100
	endif
	if (<array_size> > 4)
		Time_to_Hit_6 = (<hit_info> [4].time_to_hit)
		Num_Pieces_Hit_6 = (<hit_info> [4].num_pieces_hit)
		pieces_value_6_1 = (<hit_info> [4].pieces_value [0])
		Hit_Velocity_6_1 = (<hit_info> [4].pieces_velocity [0])
		if (<Num_Pieces_Hit_6> > 1)
			pieces_value_6_2 = (<hit_info> [4].pieces_value [1])
			Hit_Velocity_6_2 = (<hit_info> [4].pieces_velocity [1])
		else
			pieces_value_6_2 = <pieces_value_6_1>
			Hit_Velocity_6_2 = <Hit_Velocity_6_1>
		endif
	else
		Time_to_Hit_6 = 10000000.0
		Num_Pieces_Hit_6 = 0
		pieces_value_6_1 = 0
		pieces_value_6_2 = 0
		Hit_Velocity_6_1 = 100
		Hit_Velocity_6_2 = 100
	endif
	orgainize_drum_value pieces_Value_1 = <pieces_value_2_1> pieces_Value_2 = <pieces_value_2_2> velocity1 = <Hit_Velocity_2_1> velocity2 = <Hit_Velocity_2_2>
	pieces_value_2_1 = <pieces_Value_1>
	pieces_value_2_2 = <pieces_Value_2>
	Hit_Velocity_2_1 = <velocity1>
	Hit_Velocity_2_2 = <velocity2>
	orgainize_drum_value pieces_Value_1 = <pieces_value_3_1> pieces_Value_2 = <pieces_value_3_2> velocity1 = <Hit_Velocity_3_1> velocity2 = <Hit_Velocity_3_2>
	pieces_value_3_1 = <pieces_Value_1>
	pieces_value_3_2 = <pieces_Value_2>
	Hit_Velocity_3_1 = <velocity1>
	Hit_Velocity_3_2 = <velocity2>
	orgainize_drum_value pieces_Value_1 = <pieces_value_4_1> pieces_Value_2 = <pieces_value_4_2> velocity1 = <Hit_Velocity_4_1> velocity2 = <Hit_Velocity_4_2>
	pieces_value_4_1 = <pieces_Value_1>
	pieces_value_4_2 = <pieces_Value_2>
	Hit_Velocity_4_1 = <velocity1>
	Hit_Velocity_4_2 = <velocity2>
	orgainize_drum_value pieces_Value_1 = <pieces_value_5_1> pieces_Value_2 = <pieces_value_5_2> velocity1 = <Hit_Velocity_5_1> velocity2 = <Hit_Velocity_5_2>
	pieces_value_5_1 = <pieces_Value_1>
	pieces_value_5_2 = <pieces_Value_2>
	Hit_Velocity_5_1 = <velocity1>
	Hit_Velocity_5_2 = <velocity2>
	orgainize_drum_value pieces_Value_1 = <pieces_value_6_1> pieces_Value_2 = <pieces_value_6_2> velocity1 = <Hit_Velocity_6_1> velocity2 = <Hit_Velocity_6_2>
	pieces_value_6_1 = <pieces_Value_1>
	pieces_value_6_2 = <pieces_Value_2>
	Hit_Velocity_6_1 = <velocity1>
	Hit_Velocity_6_2 = <velocity2>
	old_time = ($drumnote_times [4])
	SetArrayElement arrayName = drumnote_times GlobalArray index = 5 newValue = <old_time>
	old_time = ($drumnote_times [3])
	SetArrayElement arrayName = drumnote_times GlobalArray index = 4 newValue = <old_time>
	old_time = ($drumnote_times [2])
	SetArrayElement arrayName = drumnote_times GlobalArray index = 3 newValue = <old_time>
	old_time = ($drumnote_times [1])
	SetArrayElement arrayName = drumnote_times GlobalArray index = 2 newValue = <old_time>
	old_time = ($drumnote_times [0])
	SetArrayElement arrayName = drumnote_times GlobalArray index = 1 newValue = <old_time>
	SetArrayElement \{arrayName = drumnote_times
		GlobalArray
		index = 0
		newValue = 0}
	return {
		Num_Pieces_Hit_2 = <Num_Pieces_Hit_2>
		Num_Pieces_Hit_3 = <Num_Pieces_Hit_3>
		Num_Pieces_Hit_4 = <Num_Pieces_Hit_4>
		Num_Pieces_Hit_5 = <Num_Pieces_Hit_5>
		Num_Pieces_Hit_6 = <Num_Pieces_Hit_6>
		time_to_Hit_1 = 0
		time_to_Hit_2 = <time_to_Hit_2>
		Time_to_Hit_3 = <Time_to_Hit_3>
		Time_to_Hit_4 = <Time_to_Hit_4>
		Time_to_Hit_5 = <Time_to_Hit_5>
		Time_to_Hit_6 = <Time_to_Hit_6>
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
		Hit_Velocity_2_1 = <Hit_Velocity_2_1>
		Hit_Velocity_3_1 = <Hit_Velocity_3_1>
		Hit_Velocity_4_1 = <Hit_Velocity_4_1>
		Hit_Velocity_5_1 = <Hit_Velocity_5_1>
		Hit_Velocity_6_1 = <Hit_Velocity_6_1>
		Hit_Velocity_2_2 = <Hit_Velocity_2_2>
		Hit_Velocity_3_2 = <Hit_Velocity_3_2>
		Hit_Velocity_4_2 = <Hit_Velocity_4_2>
		Hit_Velocity_5_2 = <Hit_Velocity_5_2>
		Hit_Velocity_6_2 = <Hit_Velocity_6_2>
	}
endscript

script update_notehit_data \{start_note = 74
		end_note = 83}
	get_song_prefix song = <current_song>
	ExtendCRCWithString checksum = `` string = <song_prefix>
	ArrayPrefix = <ExtendedChecksum>
	ExtendCRCWithString checksum = <ArrayPrefix> string = '_drums_notes'
	event_array = <ExtendedChecksum>
	if NOT GlobalExists name = <event_array> type = array
		return
	endif
	array_size = 0
	FastGetArraySize array = $<event_array>
	note_array_size = <array_size>
	next_array_entry = $next_drumnote_entry
	if (<next_array_entry> >= <array_size>)
		return \{Time_to_Hit_6 = 1000000.0
			num_pieces_hit = 2
			pieces_value_6_1 = 1
			pieces_value_6_2 = 7
			Hit_Velocity_6_1 = 100
			Hit_Velocity_6_2 = 100}
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
	DecompressNoteValue note_value = ($<event_array> [(<next_array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		switch (<note>)
			case 73
			name = kick
			value = 0
			case 74
			name = T3
			value = 7
			case 75
			name = T2
			value = 5
			case 76
			name = t1
			value = 4
			case 77
			name = s1
			value = 1
			case 78
			name = H1c
			value = 2
			case 79
			name = H1o
			value = 2
			case 80
			name = C3
			value = 8
			case 81
			name = C1
			value = 3
			case 82
			name = C2
			value = 6
			case 83
			name = countin
			value = 0
		endswitch
		AddIntegerArrayElement2 array = <piece_array2> element = <value>
		piece_array2 = <array>
		AddIntegerArrayElement2 array = <piece_velocities> element = <velocity>
		piece_velocities = <array>
		num_pieces_hit = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		if (<num_pieces_hit> = 0)
			return \{Time_to_Hit_6 = 1000000.0
				Num_Pieces_Hit_6 = 2
				pieces_value_6_1 = 1
				pieces_value_6_2 = 7
				Hit_Velocity_6_1 = 100
				Hit_Velocity_6_2 = 100}
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
		Time_to_Hit_6 = <time_to_next_note>
		Num_Pieces_Hit_6 = <num_pieces_hit>
		if (<num_pieces_hit> = 1)
			pieces_value_6_1 = (<piece_array2> [0])
			pieces_value_6_2 = <pieces_value_6_1>
			Hit_Velocity_6_1 = (<piece_velocities> [0])
			Hit_Velocity_6_2 = <Hit_Velocity_6_1>
		else
			piece1 = (<piece_array2> [0])
			piece2 = (<piece_array2> [1])
			velocity1 = (<piece_velocities> [0])
			velocity2 = (<piece_velocities> [1])
			if (<piece2> > <piece1>)
				pieces_value_6_1 = <piece1>
				pieces_value_6_2 = <piece2>
				Hit_Velocity_6_1 = <velocity1>
				Hit_Velocity_6_2 = <velocity2>
			else
				pieces_value_6_1 = <piece2>
				pieces_value_6_2 = <piece1>
				Hit_Velocity_6_1 = <velocity2>
				Hit_Velocity_6_2 = <velocity1>
			endif
		endif
		Change last_drumnote_time = <current_time>
		Change next_drumnote_entry = <next_array_entry>
		SetArrayElement arrayName = drumnote_times GlobalArray index = 5 newValue = <current_time>
		break
	endif
	repeat
	return {
		Time_to_Hit_6 = <Time_to_Hit_6>
		Num_Pieces_Hit_6 = <Num_Pieces_Hit_6>
		pieces_value_6_1 = <pieces_value_6_1>
		pieces_value_6_2 = <pieces_value_6_2>
		Hit_Velocity_6_1 = <Hit_Velocity_6_1>
		Hit_Velocity_6_2 = <Hit_Velocity_6_2>
	}
	current_song = None
	song_prefix = 'none'
	next_note_time = 0
	current_time = 0
	time_to_next_note = 0
	pieces_value_6_1 = 0
	Hit_Velocity_6_1 = 0
	piece2 = 0
	piece1 = 0
	velocity1 = 0
	velocity2 = 0
	Time_to_Hit_6 = 0
	pieces_value_6_2 = 0
	Hit_Velocity_6_2 = 0
	first_time = 0
endscript
next_drumnote_leftfoot_entry = 0
last_drumnote_leftfoot_time = 0

script update_notehit_data_left_foot \{start_note = 78
		end_note = 79}
	get_song_prefix song = <current_song>
	ExtendCRCWithString checksum = `` string = <song_prefix>
	ArrayPrefix = <ExtendedChecksum>
	ExtendCRCWithString checksum = <ArrayPrefix> string = '_drums_notes'
	event_array = <ExtendedChecksum>
	if NOT GlobalExists name = <event_array> type = array
		return
	endif
	next_array_entry = $next_drumnote_leftfoot_entry
	array_size = 0
	FastGetArraySize array = $<event_array>
	note_array_size = <array_size>
	if (<next_array_entry> >= <array_size>)
		return \{Time_to_hit_foot_L = 1000000.0
			pieces_hit_foot_l = H1c
			num_pieces_hit_foot_l = 1}
	endif
	length = 0
	note = 0
	velocity = 0
	begin
	num_pieces_hit = 0
	current_time = ($<event_array> [<next_array_entry>])
	begin
	DecompressNoteValue note_value = ($<event_array> [(<next_array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		if (<note> = 78)
			pieces_hit_foot_l = H1c
		else
			pieces_hit_foot_l = H1o
		endif
		num_pieces_hit = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		return \{Time_to_hit_foot_L = 1000000.0
			pieces_hit_foot_l = H1o
			num_pieces_hit_foot_l = 1}
	endif
	next_note_time = ($<event_array> [<next_array_entry>])
	if (<next_note_time> != <current_time>)
		break
	endif
	repeat
	if (<num_pieces_hit> > 0)
		time = 0.0
		GetSongTimeMs time_offset = ($Drummer_Offset * 1000.0)
		Time_to_hit_foot_L = (<current_time> - <time>)
		Change last_drumnote_leftfoot_time = <current_time>
		Change next_drumnote_leftfoot_entry = <next_array_entry>
		break
	endif
	repeat
	return {
		Time_to_hit_foot_L = <Time_to_hit_foot_L>
		pieces_hit_foot_l = <pieces_hit_foot_l>
		num_pieces_hit_foot_l = 1
	}
	current_song = None
	song_prefix = 'none'
	next_note_time = 0
	current_time = 0
	Time_to_hit_foot_L = 0.0
endscript
next_drumnote_rightfoot_entry = 0
last_drumnote_rightfoot_time = 0

script update_notehit_data_right_foot \{start_note = 73
		end_note = 73}
	get_song_prefix song = <current_song>
	ExtendCRCWithString checksum = `` string = <song_prefix>
	ArrayPrefix = <ExtendedChecksum>
	ExtendCRCWithString checksum = <ArrayPrefix> string = '_drums_notes'
	event_array = <ExtendedChecksum>
	if NOT GlobalExists name = <event_array> type = array
		return
	endif
	next_array_entry = $next_drumnote_rightfoot_entry
	array_size = 0
	FastGetArraySize array = $<event_array>
	note_array_size = <array_size>
	if (<next_array_entry> >= <array_size>)
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
	DecompressNoteValue note_value = ($<event_array> [(<next_array_entry> + 1)])
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
		GetSongTimeMs time_offset = ($Drummer_Offset * 1000.0)
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
