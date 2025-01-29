
script hold_body_loops 
	wait \{$Drummer_Offset
		seconds}
	if (<Body_type> = Idle)
		killspawnedscript \{name = drummer_transit_loops}
		index = 0
		begin
		(<drummer_Ids> [<index>]) :Obj_SpawnScriptNow drummer_transit_idles params = {state = <state> tapin = <tapin> currentset = <currentset> Last_Hit = <Last_Hit>}
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <Num_Drummers>
	else
		killspawnedscript \{name = drummer_transit_idles}
		index = 0
		begin
		(<drummer_Ids> [<index>]) :Obj_SpawnScriptNow drummer_transit_loops params = {state = <state> BlendDuration = <BlendDuration>}
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <Num_Drummers>
	endif
	drummer_Ids = [musician1]
	state = in
	tapin = false
	Last_Hit = false
	currentset = 0
	BlendDuration = 0.0
endscript

script idle_check 
	Time_From_Idle = (((1 - $Drum_Idlepoint_Arm_SHit) * $Drum_Slowest_Arm_Hit) / 1000.0)
	time_to_Hit_1 = (<time_to_Hit_1> / 1000.0)
	waittime = 0.0
	if ($Drummer_Idle = true)
		Change \{Drummer_Idle = false}
		if (<time_to_Hit_1> > <Time_From_Idle>)
			waittime = (<time_to_Hit_1> - <Time_From_Idle>)
			wait <waittime> seconds
			spawnscriptnow hold_body_loops params = {
				Body_type = loop
				Num_Drummers = <Num_Drummers>
				drummer_Ids = <drummer_Ids>
				state = in
				BlendDuration = <Time_From_Idle>
			}
		else
			spawnscriptnow hold_body_loops params = {
				Body_type = loop
				Num_Drummers = <Num_Drummers>
				drummer_Ids = <drummer_Ids>
				state = in
				BlendDuration = <time_to_Hit_1>
			}
		endif
	else
		if (<Should_Idle> = true)
			spawnscriptnow hold_body_loops params = {
				Body_type = Idle
				Last_Hit = <Last_Hit>
				currentset = <currentset>
				Num_Drummers = <Num_Drummers>
				drummer_Ids = <drummer_Ids>
				state = in
				tapin = <tapin>
			}
			waittime = (<time_to_Hit_1> - <Time_From_Idle>)
			wait <waittime> seconds
			spawnscriptnow hold_body_loops params = {
				Body_type = loop
				Num_Drummers = <Num_Drummers>
				drummer_Ids = <drummer_Ids>
				state = in
				BlendDuration = <Time_From_Idle>
			}
		endif
	endif
	return lost_time = (<waittime> * 1000.0)
	Num_Drummers = 0
	drummer_Ids = [musician2]
	Last_Hit = false
	currentset = 0
	tapin = false
endscript

script hold_transit_requests \{time_to_trans_Long = 0.0
		time_to_trans_short = 0.0}
	currentset = $Current_DB_Base
	idle_check {
		Last_Hit = <Last_Hit>
		time_to_Hit_1 = <time_to_Hit_1>
		Num_Drummers = <Num_Drummers>
		drummer_Ids = <drummer_Ids>
		Should_Idle = <Should_Idle>
		tapin = <tapin>
		currentset = <currentset>
	}
	time_to_hit_R = (<time_to_hit_R> - <lost_time>)
	time_to_hit_L = (<time_to_hit_L> - <lost_time>)
	time_to_trans_Long = (<time_to_trans_Long> - <lost_time>)
	time_to_trans_short = (<time_to_trans_short> - <lost_time>)
	time_to_Hit_1 = (<time_to_Hit_1> - <lost_time>)
	spawnscriptnow hold_transit_arms params = {
		l = <l>
		r = <r>
		Num_Drummers = <Num_Drummers>
		drummer_Ids = <drummer_Ids>
		time_to_hit_R = <time_to_hit_R>
		time_to_hit_L = <time_to_hit_L>
		Drum_New_State_String_R = <Drum_New_State_String_R>
		Drum_New_State_String_L = <Drum_New_State_String_L>
		tapin = <tapin>
	}
	body_diff = (($Drummer_Offset * 1000.0) * 0.5)
	IK_diff = (($Drummer_Offset * 1000.0) * 0.24000001)
	if (<type> = Long)
		switch $Use_DB_Base
			case 1
			currentset = 1
			Change \{Current_DB_Base = 1}
			Change \{Use_DB_Base = 2}
			case 2
			currentset = 2
			Change \{Current_DB_Base = 2}
			Change \{Use_DB_Base = 3}
			case 3
			currentset = 3
			Change \{Current_DB_Base = 3}
			Change \{Use_DB_Base = 4}
			case 4
			currentset = 4
			Change \{Current_DB_Base = 4}
			Change \{Use_DB_Base = 1}
		endswitch
		time_to_trans_IK = (<time_to_trans_Long> + (<IK_diff> * 2))
		time_to_trans_Body = (<time_to_trans_Long> + (<body_diff> * 2))
		time_to_trans_Base_IK = (<time_to_Hit_1> + (<IK_diff> * 2))
		time_to_trans_Base_Body = (<time_to_Hit_1> + (<body_diff> * 2))
		waitbody = ($Drummer_Offset - (<body_diff> / 1000.0))
		waitIK = ($Drummer_Offset - (<IK_diff> / 1000.0))
	else
		time_to_trans_IK = (<time_to_trans_short> + (<IK_diff> * 2))
		time_to_trans_Body = (<time_to_trans_short> + (<body_diff> * 2))
		waitbody = ($Drummer_Offset - (<body_diff> / 1000.0))
		waitIK = ($Drummer_Offset - (<IK_diff> / 1000.0))
	endif
	spawnscriptnow hold_body_trans params = {
		type = <type>
		Num_Drummers = <Num_Drummers>
		drummer_Ids = <drummer_Ids>
		waittime = <waitbody>
		currentset = <currentset>
		node = Body
		time_to_trans_Base = <time_to_trans_Base_Body>
		time_to_trans = <time_to_trans_Body>
		Drum_Old_Long_String = <Drum_Old_Long_String>
		Drum_New_Long_String = <Drum_New_Long_String>
		Drum_Old_Short_String = <Drum_Old_Short_String>
		Drum_New_Short_String = <Drum_New_Short_String>
	}
	spawnscriptnow hold_body_trans params = {
		type = <type>
		Num_Drummers = <Num_Drummers>
		drummer_Ids = <drummer_Ids>
		waittime = <waitIK>
		currentset = <currentset>
		node = IK
		time_to_trans_Base = <time_to_trans_Base_Body>
		time_to_trans = <time_to_trans_IK>
		Drum_Old_Long_String = <Drum_Old_Long_String>
		Drum_New_Long_String = <Drum_New_Long_String>
		Drum_Old_Short_String = <Drum_Old_Short_String>
		Drum_New_Short_String = <Drum_New_Short_String>
	}
	Last_Hit = false
	l = false
	r = false
	Should_Idle = false
	tapin = false
	drummer_Ids = [musician1]
	Num_Drummers = 0
	time_to_Hit_1 = 0.0
	time_to_hit_R = 0.0
	lost_time = 0.0
	time_to_hit_L = 0.0
	time_to_trans_Base_IK = 0.0
	time_to_trans_Base_Body = 0.0
	Drum_New_State_String_R = 'S1T3'
	Drum_New_State_String_L = 'S1T3'
	Drum_Old_Long_String = 'S1T3'
	Drum_New_Long_String = 'S1T3'
	Drum_Old_Short_String = 'S1T3'
	Drum_New_Short_String = 'S1T3'
endscript

script hold_body_trans 
	time_to_trans = (<time_to_trans> / 1000.0)
	wait <waittime> seconds
	if (<type> = Long)
		time_to_trans_Base = (<time_to_trans_Base> / 1000.0)
		smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
		if (<time_to_trans> < 0.0)
			time_to_trans = 0.0
		endif
		if (<time_to_trans_Base> < 0.0)
			time_to_trans_Base = 0.0
		endif
		if (<node> = Body)
			target = DB_Drum_Transition_Base_Anim
			ExtendCRCWithString checksum = Drum_ string = <Drum_Old_Long_String>
			OldBase = <ExtendedChecksum>
			ExtendCRCWithString checksum = Drum_ string = <Drum_New_Long_String>
			Newbase = <ExtendedChecksum>
			switch <currentset>
				case 1
				master_node = DB_Drum_Base_Master1
				master_tree = $Drum_Base_Branch_Master1
				tree1 = $Drum_Base_Branch_Old1
				Target1 = DB_Drum_Base_Anim_Old1
				tree2 = $Drum_Base_Branch_New1
				target2 = DB_Drum_Base_Anim_New1
				case 2
				master_node = DB_Drum_Base_Master2
				master_tree = $Drum_Base_Branch_Master2
				tree1 = $Drum_Base_Branch_Old2
				Target1 = DB_Drum_Base_Anim_Old2
				tree2 = $Drum_Base_Branch_New2
				target2 = DB_Drum_Base_Anim_New2
				case 3
				master_node = DB_Drum_Base_Master3
				master_tree = $Drum_Base_Branch_Master3
				tree1 = $Drum_Base_Branch_Old3
				Target1 = DB_Drum_Base_Anim_Old3
				tree2 = $Drum_Base_Branch_New3
				target2 = DB_Drum_Base_Anim_New3
				case 4
				master_node = DB_Drum_Base_Master4
				master_tree = $Drum_Base_Branch_Master4
				tree1 = $Drum_Base_Branch_Old4
				Target1 = DB_Drum_Base_Anim_Old4
				tree2 = $Drum_Base_Branch_New4
				target2 = DB_Drum_Base_Anim_New4
			endswitch
		else
			target = DB_Drum_Transition_BaseIK_Anim
			ExtendCRCWithString checksum = Drum_ string = <Drum_Old_Long_String>
			OldPrefix = <ExtendedChecksum>
			ExtendCRCWithString checksum = <OldPrefix> string = '_IK'
			OldBase = <ExtendedChecksum>
			ExtendCRCWithString checksum = Drum_ string = <Drum_New_Long_String>
			NewPrefix = <ExtendedChecksum>
			ExtendCRCWithString checksum = <NewPrefix> string = '_IK'
			Newbase = <ExtendedChecksum>
			switch <currentset>
				case 1
				master_node = DB_Drum_BaseIK_Master1
				master_tree = $Drum_BaseIK_Branch_Master1
				tree1 = $Drum_BaseIK_Branch_Old1
				Target1 = DB_Drum_BaseIK_Anim_Old1
				tree2 = $Drum_BaseIK_Branch_New1
				target2 = DB_Drum_BaseIK_Anim_New1
				case 2
				master_node = DB_Drum_BaseIK_Master2
				master_tree = $Drum_BaseIK_Branch_Master2
				tree1 = $Drum_BaseIK_Branch_Old2
				Target1 = DB_Drum_BaseIK_Anim_Old2
				tree2 = $Drum_BaseIK_Branch_New2
				target2 = DB_Drum_BaseIK_Anim_New2
				case 3
				master_node = DB_Drum_BaseIK_Master3
				master_tree = $Drum_BaseIK_Branch_Master3
				tree1 = $Drum_BaseIK_Branch_Old3
				Target1 = DB_Drum_BaseIK_Anim_Old3
				tree2 = $Drum_BaseIK_Branch_New3
				target2 = DB_Drum_BaseIK_Anim_New3
				case 4
				master_node = DB_Drum_BaseIK_Master4
				master_tree = $Drum_BaseIK_Branch_Master4
				tree1 = $Drum_BaseIK_Branch_Old4
				Target1 = DB_Drum_BaseIK_Anim_Old4
				tree2 = $Drum_BaseIK_Branch_New4
				target2 = DB_Drum_BaseIK_Anim_New4
			endswitch
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_Ids> [<index>])
		<cur_drummer_id> :Anim_Command target = <target> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans_Base>
			blendcurve = <smooth_transit_curve>
			Tree = <master_tree>
			params = {
			}
		}
		<cur_drummer_id> :Anim_Command target = <master_node> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = 0.0
			blendcurve = <smooth_transit_curve>
			Tree = <tree1>
			params = {
			}
		}
		if <cur_drummer_id> :Anim_AnimNodeExists id = <Target1>
			<cur_drummer_id> :Anim_Command target = <Target1> Command = DegenerateBlend_AddBranch params = {
				BlendDuration = 0.0
				Tree = $Single_Source_tree
				params = {
					Use_Anim = <OldBase>
				}
			}
		endif
		<cur_drummer_id> :Anim_Command target = <master_node> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = <tree2>
			params = {
			}
		}
		if <cur_drummer_id> :Anim_AnimNodeExists id = <target2>
			<cur_drummer_id> :Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
				BlendDuration = 0.0
				Tree = $Single_Source_tree
				params = {
					Use_Anim = <Newbase>
				}
			}
		endif
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <Num_Drummers>
	else
		smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
		time_to_Hit_1 = <time_to_trans>
		if (<node> = Body)
			ExtendCRCWithString checksum = Drum_ string = <Drum_Old_Short_String>
			OldBase = <ExtendedChecksum>
			ExtendCRCWithString checksum = Drum_ string = <Drum_New_Short_String>
			Newbase = <ExtendedChecksum>
			switch <currentset>
				case 1
				Target1 = DB_Drum_Base_Anim_Old1
				target2 = DB_Drum_Base_Anim_New1
				case 2
				Target1 = DB_Drum_Base_Anim_Old2
				target2 = DB_Drum_Base_Anim_New2
				case 3
				Target1 = DB_Drum_Base_Anim_Old3
				target2 = DB_Drum_Base_Anim_New3
				case 4
				Target1 = DB_Drum_Base_Anim_Old4
				target2 = DB_Drum_Base_Anim_New4
			endswitch
		else
			ExtendCRCWithString checksum = Drum_ string = <Drum_Old_Short_String>
			OldPrefix = <ExtendedChecksum>
			ExtendCRCWithString checksum = <OldPrefix> string = '_IK'
			OldBase = <ExtendedChecksum>
			ExtendCRCWithString checksum = Drum_ string = <Drum_New_Short_String>
			NewPrefix = <ExtendedChecksum>
			ExtendCRCWithString checksum = <NewPrefix> string = '_IK'
			Newbase = <ExtendedChecksum>
			switch <currentset>
				case 1
				Target1 = DB_Drum_BaseIK_Anim_Old1
				target2 = DB_Drum_BaseIK_Anim_New1
				case 2
				Target1 = DB_Drum_BaseIK_Anim_Old2
				target2 = DB_Drum_BaseIK_Anim_New2
				case 3
				Target1 = DB_Drum_BaseIK_Anim_Old3
				target2 = DB_Drum_BaseIK_Anim_New3
				case 4
				Target1 = DB_Drum_BaseIK_Anim_Old4
				target2 = DB_Drum_BaseIK_Anim_New4
			endswitch
		endif
		if (<time_to_trans> < 0.0)
			time_to_trans = 0.0
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_Ids> [<index>])
		if <cur_drummer_id> :Anim_AnimNodeExists id = <Target1>
			<cur_drummer_id> :Anim_Command target = <Target1> Command = DegenerateBlend_AddBranch params = {
				BlendDuration = <time_to_trans>
				blendcurve = <smooth_transit_curve>
				Tree = $Single_Source_tree
				params = {
					Use_Anim = <OldBase>
				}
			}
		else
		endif
		if <cur_drummer_id> :Anim_AnimNodeExists id = <target2>
			<cur_drummer_id> :Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
				BlendDuration = <time_to_trans>
				blendcurve = <smooth_transit_curve>
				Tree = $Single_Source_tree
				params = {
					Use_Anim = <Newbase>
				}
			}
		else
		endif
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <Num_Drummers>
	endif
	Should_Idle = false
	time_to_trans = 0.0
	waittime = 0.0
	time_to_trans_Base = 0.0
	drummer_Ids = [musician1]
	currentset = 1
	node = Body
	Drum_Old_Long_String = 'S1T3'
	Drum_New_Long_String = 'S1T3'
	Drum_Old_Short_String = 'S1T3'
	Drum_New_Short_String = 'S1T3'
	ExtendedChecksum = null
	cur_drummer_id = null
endscript

script hold_active_values 
	wait \{$Drummer_Offset
		seconds}
	index = 0
	begin
	(<drummer_Ids> [<index>]) :AnimPreview_SetSourceValues {
		AV_Drum_Anim_Hand_L = <AV_Drum_Anim_Hand_L>
		AV_Drum_Anim_Hand_R = <AV_Drum_Anim_Hand_R>
		AV_Drum_Anim_Foot_R = <AV_Drum_Anim_Foot_R>
		AV_Drum_Blend_Hand_L = <AV_Drum_Blend_Hand_L>
		AV_Drum_Blend_Hand_R = <AV_Drum_Blend_Hand_R>
		AV_Drum_Blend_Foot_R = <AV_Drum_Blend_Foot_R>
		AV_Drum_Blend_HH_Kit = <AV_Drum_Blend_HH_Kit>
		AV_Drum_Mod_Loop_Body = <AV_Drum_Mod_Loop_Body>
		AV_Drum_Mod_Hand_R = <AV_Drum_Mod_Hand_R>
		AV_Drum_Mod_Hand_L = <AV_Drum_Mod_Hand_L>
		AV_Drum_Mod_Foot_R = <AV_Drum_Mod_Foot_R>
		AV_Drum_IK_Hand_L = <AV_Drum_IK_Hand_L>
		AV_Drum_IK_Hand_R = <AV_Drum_IK_Hand_R>
	}
	wait \{1
		frame}
	index = (<index> + 1)
	repeat <Num_Drummers>
	drummer_Ids = [musician1]
	AV_Drum_Anim_Hand_L = 0.0
	AV_Drum_Anim_Hand_R = 0.0
	AV_Drum_Anim_Foot_R = 0.0
	AV_Drum_Blend_Hand_L = 0.0
	AV_Drum_Blend_Hand_R = 0.0
	AV_Drum_Blend_Foot_R = 0.0
	AV_Drum_Blend_HH_Kit = 0.0
	AV_Drum_Mod_Loop_Body = 0.0
	AV_Drum_Mod_Hand_R = 0.0
	AV_Drum_Mod_Hand_L = 0.0
	AV_Drum_Mod_Foot_R = 0.0
	AV_Drum_IK_Hand_L = 0.0
	AV_Drum_IK_Hand_R = 0.0
endscript

script Hold_DrumKit_Piece 
	if (<strength> > 1.0)
		strength = 1.0
	elseif (<strength> < 0.3)
		strength = 0.3
	endif
	wait \{$Drummer_Offset
		seconds}
	index = 0
	begin
	(<drummer_Ids> [<index>]) :hit_drumkit_piece strength = <strength> pieces_hit = <pieces_hit>
	index = (<index> + 1)
	wait \{1
		frame}
	repeat <Num_Drummers>
endscript

script hold_drummer_anticipation_arms 
	if (<Arm> = r)
		target = DB_Drum_Hit_Ant_R
		arm_String = 'R'
		slowstrength = 0.0
		fastest_trans = 60.0
		Slowest_trans = ($Drummer_Offset * 1000.0)
		if ($Last_Time_To_Hit_R >= <Slowest_trans>)
			waittime = 0.0
			BlendTime = <Slowest_trans>
		else
			waittime = (<Slowest_trans> - $Last_Time_To_Hit_R)
			BlendTime = ($Last_Time_To_Hit_R)
		endif
		if (<time_to_hit> > <Slowest_trans>)
			strength = <slowstrength>
		elseif (<time_to_hit> < <fastest_trans>)
			strength = 1.0
		else
			strength = (1.0 - ((<time_to_hit> - <fastest_trans>) / (<Slowest_trans> - <fastest_trans>)))
		endif
		BlendTime = (<BlendTime> / 1000.0)
		waittime = (<waittime> / 1000.0)
		strength = (<strength> * <strength>)
		if ($Use_DB_Branch_R = 1)
			Tree = $Drum_Ant_Branch_R_1
			target2 = DB_Drum_Ant_R_1
			Change \{Use_DB_Branch_R = 2}
		else
			Tree = $Drum_Ant_Branch_R_2
			target2 = DB_Drum_Ant_R_2
			Change \{Use_DB_Branch_R = 1}
		endif
		Change Last_Time_To_Hit_R = <time_to_hit>
	else
		target = DB_Drum_Hit_Ant_L
		arm_String = 'L'
		slowstrength = 0.0
		fastest_trans = 60.0
		Slowest_trans = ($Drummer_Offset * 1000.0)
		if ($Last_Time_To_Hit_L >= <Slowest_trans>)
			waittime = 0.0
			BlendTime = <Slowest_trans>
		else
			waittime = (<Slowest_trans> - $Last_Time_To_Hit_L)
			BlendTime = ($Last_Time_To_Hit_L)
		endif
		if (<time_to_hit> > <Slowest_trans>)
			strength = <slowstrength>
		elseif (<time_to_hit> < <fastest_trans>)
			strength = 1.0
		else
			strength = (1.0 - ((<time_to_hit> - <fastest_trans>) / (<Slowest_trans> - <fastest_trans>)))
		endif
		BlendTime = (<BlendTime> / 1000.0)
		waittime = (<waittime> / 1000.0)
		strength = (<strength> * <strength>)
		if ($Use_DB_Branch_R = 1)
			Tree = $Drum_Ant_Branch_R_1
			target2 = DB_Drum_Ant_R_1
			Change \{Use_DB_Branch_R = 2}
		else
			Tree = $Drum_Ant_Branch_R_2
			target2 = DB_Drum_Ant_R_2
			Change \{Use_DB_Branch_R = 1}
		endif
		Change Last_Time_To_Hit_R = <time_to_hit>
	endif
	FormatText checksumname = anim 'Drum_%a_%b' a = <Trans_String> b = <arm_String>
	wait <waittime> seconds
	index = 0
	begin
	(<drummer_Ids> [<index>]) :Obj_SpawnScriptNow Drummer_Anticipation_Arms params = {Tree = <Tree> target = <target> target2 = <target2> strength = <strength> BlendTime = <BlendTime> anim = <anim>}
	index = (<index> + 1)
	repeat <Num_Drummers>
	wait <BlendTime> seconds
	anim = 'Drum_T3T3_R'
	BlendTime = (<time_to_hit> / 1000.0)
	index = 0
	begin
	(<drummer_Ids> [<index>]) :Obj_SpawnScriptNow Drummer_Anticipation_Arms_out params = {target2 = <target2> strength = 1.0 BlendTime = <BlendTime> anim = <anim>}
	index = (<index> + 1)
	repeat <Num_Drummers>
	Trans_String = 'S1T3'
	drummer_Ids = [musician1]
endscript

script hold_transit_arms 
	wait \{$Drummer_Offset
		seconds}
	if (<l> = true)
		smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
		time_to_trans = (<time_to_hit_L> / 1000.0)
		if (<time_to_trans> < 0.0)
			time_to_trans = 0.0
		endif
		if (<tapin> = true)
			QHit_L = DrumDroid_CountOff_QHit_L
			MHit_L = DrumDroid_CountOff_MHit_L
			SHit_L = DrumDroid_CountOff_SHit_L
		else
			ExtendCRCWithString checksum = Drum_ string = <Drum_New_State_String_L>
			prefix = <ExtendedChecksum>
			ExtendCRCWithString checksum = <prefix> string = '_QHit_L'
			QHit_L = <ExtendedChecksum>
			ExtendCRCWithString checksum = <prefix> string = '_MHit_L'
			MHit_L = <ExtendedChecksum>
			ExtendCRCWithString checksum = <prefix> string = '_SHit_L'
			SHit_L = <ExtendedChecksum>
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_Ids> [<index>])
		<cur_drummer_id> :Anim_Command target = DB_Drum_SHit_L_Anim Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_Anim_Event_tree
			params = {
				Use_Anim = <SHit_L>
			}
		}
		<cur_drummer_id> :Anim_Command target = DB_Drum_MHit_L_Anim Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_Anim_Event_tree
			params = {
				Use_Anim = <MHit_L>
			}
		}
		<cur_drummer_id> :Anim_Command target = DB_Drum_QHit_L_Anim Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_Anim_Event_tree
			params = {
				Use_Anim = <QHit_L>
			}
		}
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <Num_Drummers>
	endif
	if (<r> = true)
		smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
		time_to_trans = (<time_to_hit_R> / 1000.0)
		if (<time_to_trans> < 0.0)
			time_to_trans = 0.0
		endif
		if (<tapin> = true)
			QHit_R = DrumDroid_CountOff_QHit_R
			MHit_R = DrumDroid_CountOff_MHit_R
			SHit_R = DrumDroid_CountOff_SHit_R
		else
			ExtendCRCWithString checksum = Drum_ string = <Drum_New_State_String_R>
			prefix = <ExtendedChecksum>
			ExtendCRCWithString checksum = <prefix> string = '_QHit_R'
			QHit_R = <ExtendedChecksum>
			ExtendCRCWithString checksum = <prefix> string = '_MHit_R'
			MHit_R = <ExtendedChecksum>
			ExtendCRCWithString checksum = <prefix> string = '_SHit_R'
			SHit_R = <ExtendedChecksum>
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_Ids> [<index>])
		<cur_drummer_id> :Anim_Command target = DB_Drum_SHit_R_Anim Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_Anim_Event_tree
			params = {
				Use_Anim = <SHit_R>
			}
		}
		<cur_drummer_id> :Anim_Command target = DB_Drum_MHit_R_Anim Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_Anim_Event_tree
			params = {
				Use_Anim = <MHit_R>
			}
		}
		<cur_drummer_id> :Anim_Command target = DB_Drum_QHit_R_Anim Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_Anim_Event_tree
			params = {
				Use_Anim = <QHit_R>
			}
		}
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <Num_Drummers>
	endif
	drummer_Ids = [musician1]
	time_to_hit_L = 0.0
	time_to_hit_R = 0.0
	tapin = false
	Drum_New_State_String_R = 'S1T3'
	Drum_New_State_String_L = 'S1T3'
	ExtendedChecksum = null
	cur_drummer_id = null
endscript
