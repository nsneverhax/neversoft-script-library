
script hold_body_loops 
	wait \{$drummer_offset
		seconds}
	if (<body_type> = idle)
		killspawnedscript \{name = drummer_transit_loops}
		index = 0
		begin
		(<drummer_ids> [<index>]) :obj_spawnscriptnow drummer_transit_idles params = {state = <state> tapin = <tapin> currentset = <currentset> last_hit = <last_hit>}
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <num_drummers>
	else
		killspawnedscript \{name = drummer_transit_idles}
		index = 0
		begin
		(<drummer_ids> [<index>]) :obj_spawnscriptnow drummer_transit_loops params = {state = <state> blendduration = <blendduration>}
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <num_drummers>
	endif
	drummer_ids = [musician1]
	state = in
	tapin = false
	last_hit = false
	currentset = 0
	blendduration = 0.0
endscript

script idle_check 
	time_from_idle = (((1 - $drum_idlepoint_arm_shit) * $drum_slowest_arm_hit) / 1000.0)
	time_to_hit_1 = (<time_to_hit_1> / 1000.0)
	waittime = 0.0
	if ($drummer_idle = true)
		change \{drummer_idle = false}
		if (<time_to_hit_1> > <time_from_idle>)
			waittime = (<time_to_hit_1> - <time_from_idle>)
			wait <waittime> seconds
			spawnscriptnow hold_body_loops params = {
				body_type = loop
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				blendduration = <time_from_idle>
			}
		else
			spawnscriptnow hold_body_loops params = {
				body_type = loop
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				blendduration = <time_to_hit_1>
			}
		endif
	else
		if (<should_idle> = true)
			spawnscriptnow hold_body_loops params = {
				body_type = idle
				last_hit = <last_hit>
				currentset = <currentset>
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				tapin = <tapin>
			}
			waittime = (<time_to_hit_1> - <time_from_idle>)
			wait <waittime> seconds
			spawnscriptnow hold_body_loops params = {
				body_type = loop
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				blendduration = <time_from_idle>
			}
		endif
	endif
	return lost_time = (<waittime> * 1000.0)
	num_drummers = 0
	drummer_ids = [musician2]
	last_hit = false
	currentset = 0
	tapin = false
endscript

script hold_transit_requests \{time_to_trans_long = 0.0
		time_to_trans_short = 0.0}
	currentset = $current_db_base
	idle_check {
		last_hit = <last_hit>
		time_to_hit_1 = <time_to_hit_1>
		num_drummers = <num_drummers>
		drummer_ids = <drummer_ids>
		should_idle = <should_idle>
		tapin = <tapin>
		currentset = <currentset>
	}
	time_to_hit_r = (<time_to_hit_r> - <lost_time>)
	time_to_hit_l = (<time_to_hit_l> - <lost_time>)
	time_to_trans_long = (<time_to_trans_long> - <lost_time>)
	time_to_trans_short = (<time_to_trans_short> - <lost_time>)
	time_to_hit_1 = (<time_to_hit_1> - <lost_time>)
	spawnscriptnow hold_transit_arms params = {
		l = <l>
		r = <r>
		num_drummers = <num_drummers>
		drummer_ids = <drummer_ids>
		time_to_hit_r = <time_to_hit_r>
		time_to_hit_l = <time_to_hit_l>
		drum_new_state_string_r = <drum_new_state_string_r>
		drum_new_state_string_l = <drum_new_state_string_l>
		tapin = <tapin>
	}
	body_diff = (($drummer_offset * 1000.0) * 0.5)
	ik_diff = (($drummer_offset * 1000.0) * 0.24000001)
	if (<type> = long)
		switch $use_db_base
			case 1
			currentset = 1
			change \{current_db_base = 1}
			change \{use_db_base = 2}
			case 2
			currentset = 2
			change \{current_db_base = 2}
			change \{use_db_base = 3}
			case 3
			currentset = 3
			change \{current_db_base = 3}
			change \{use_db_base = 4}
			case 4
			currentset = 4
			change \{current_db_base = 4}
			change \{use_db_base = 1}
		endswitch
		time_to_trans_ik = (<time_to_trans_long> + (<ik_diff> * 2))
		time_to_trans_body = (<time_to_trans_long> + (<body_diff> * 2))
		time_to_trans_base_ik = (<time_to_hit_1> + (<ik_diff> * 2))
		time_to_trans_base_body = (<time_to_hit_1> + (<body_diff> * 2))
		waitbody = ($drummer_offset - (<body_diff> / 1000.0))
		waitik = ($drummer_offset - (<ik_diff> / 1000.0))
	else
		time_to_trans_ik = (<time_to_trans_short> + (<ik_diff> * 2))
		time_to_trans_body = (<time_to_trans_short> + (<body_diff> * 2))
		waitbody = ($drummer_offset - (<body_diff> / 1000.0))
		waitik = ($drummer_offset - (<ik_diff> / 1000.0))
	endif
	spawnscriptnow hold_body_trans params = {
		type = <type>
		num_drummers = <num_drummers>
		drummer_ids = <drummer_ids>
		waittime = <waitbody>
		currentset = <currentset>
		node = body
		time_to_trans_base = <time_to_trans_base_body>
		time_to_trans = <time_to_trans_body>
		drum_old_long_string = <drum_old_long_string>
		drum_new_long_string = <drum_new_long_string>
		drum_old_short_string = <drum_old_short_string>
		drum_new_short_string = <drum_new_short_string>
	}
	spawnscriptnow hold_body_trans params = {
		type = <type>
		num_drummers = <num_drummers>
		drummer_ids = <drummer_ids>
		waittime = <waitik>
		currentset = <currentset>
		node = ik
		time_to_trans_base = <time_to_trans_base_body>
		time_to_trans = <time_to_trans_ik>
		drum_old_long_string = <drum_old_long_string>
		drum_new_long_string = <drum_new_long_string>
		drum_old_short_string = <drum_old_short_string>
		drum_new_short_string = <drum_new_short_string>
	}
	last_hit = false
	l = false
	r = false
	should_idle = false
	tapin = false
	drummer_ids = [musician1]
	num_drummers = 0
	time_to_hit_1 = 0.0
	time_to_hit_r = 0.0
	lost_time = 0.0
	time_to_hit_l = 0.0
	time_to_trans_base_ik = 0.0
	time_to_trans_base_body = 0.0
	drum_new_state_string_r = 'S1T3'
	drum_new_state_string_l = 'S1T3'
	drum_old_long_string = 'S1T3'
	drum_new_long_string = 'S1T3'
	drum_old_short_string = 'S1T3'
	drum_new_short_string = 'S1T3'
endscript

script hold_body_trans 
	time_to_trans = (<time_to_trans> / 1000.0)
	wait <waittime> seconds
	if (<type> = long)
		time_to_trans_base = (<time_to_trans_base> / 1000.0)
		smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
		if (<time_to_trans> < 0.0)
			time_to_trans = 0.0
		endif
		if (<time_to_trans_base> < 0.0)
			time_to_trans_base = 0.0
		endif
		if (<node> = body)
			target = db_drum_transition_base_anim
			extendcrcwithstring checksum = drum_ string = <drum_old_long_string>
			oldbase = <extendedchecksum>
			extendcrcwithstring checksum = drum_ string = <drum_new_long_string>
			newbase = <extendedchecksum>
			switch <currentset>
				case 1
				master_node = db_drum_base_master1
				master_tree = $drum_base_branch_master1
				tree1 = $drum_base_branch_old1
				target1 = db_drum_base_anim_old1
				tree2 = $drum_base_branch_new1
				target2 = db_drum_base_anim_new1
				case 2
				master_node = db_drum_base_master2
				master_tree = $drum_base_branch_master2
				tree1 = $drum_base_branch_old2
				target1 = db_drum_base_anim_old2
				tree2 = $drum_base_branch_new2
				target2 = db_drum_base_anim_new2
				case 3
				master_node = db_drum_base_master3
				master_tree = $drum_base_branch_master3
				tree1 = $drum_base_branch_old3
				target1 = db_drum_base_anim_old3
				tree2 = $drum_base_branch_new3
				target2 = db_drum_base_anim_new3
				case 4
				master_node = db_drum_base_master4
				master_tree = $drum_base_branch_master4
				tree1 = $drum_base_branch_old4
				target1 = db_drum_base_anim_old4
				tree2 = $drum_base_branch_new4
				target2 = db_drum_base_anim_new4
			endswitch
		else
			target = db_drum_transition_baseik_anim
			extendcrcwithstring checksum = drum_ string = <drum_old_long_string>
			oldprefix = <extendedchecksum>
			extendcrcwithstring checksum = <oldprefix> string = '_IK'
			oldbase = <extendedchecksum>
			extendcrcwithstring checksum = drum_ string = <drum_new_long_string>
			newprefix = <extendedchecksum>
			extendcrcwithstring checksum = <newprefix> string = '_IK'
			newbase = <extendedchecksum>
			switch <currentset>
				case 1
				master_node = db_drum_baseik_master1
				master_tree = $drum_baseik_branch_master1
				tree1 = $drum_baseik_branch_old1
				target1 = db_drum_baseik_anim_old1
				tree2 = $drum_baseik_branch_new1
				target2 = db_drum_baseik_anim_new1
				case 2
				master_node = db_drum_baseik_master2
				master_tree = $drum_baseik_branch_master2
				tree1 = $drum_baseik_branch_old2
				target1 = db_drum_baseik_anim_old2
				tree2 = $drum_baseik_branch_new2
				target2 = db_drum_baseik_anim_new2
				case 3
				master_node = db_drum_baseik_master3
				master_tree = $drum_baseik_branch_master3
				tree1 = $drum_baseik_branch_old3
				target1 = db_drum_baseik_anim_old3
				tree2 = $drum_baseik_branch_new3
				target2 = db_drum_baseik_anim_new3
				case 4
				master_node = db_drum_baseik_master4
				master_tree = $drum_baseik_branch_master4
				tree1 = $drum_baseik_branch_old4
				target1 = db_drum_baseik_anim_old4
				tree2 = $drum_baseik_branch_new4
				target2 = db_drum_baseik_anim_new4
			endswitch
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_ids> [<index>])
		<cur_drummer_id> :anim_command target = <target> command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans_base>
			blendcurve = <smooth_transit_curve>
			tree = <master_tree>
			params = {
			}
		}
		<cur_drummer_id> :anim_command target = <master_node> command = degenerateblend_addbranch params = {
			blendduration = 0.0
			blendcurve = <smooth_transit_curve>
			tree = <tree1>
			params = {
			}
		}
		if <cur_drummer_id> :anim_animnodeexists id = <target1>
			<cur_drummer_id> :anim_command target = <target1> command = degenerateblend_addbranch params = {
				blendduration = 0.0
				tree = $single_source_tree
				params = {
					use_anim = <oldbase>
				}
			}
		endif
		<cur_drummer_id> :anim_command target = <master_node> command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = <tree2>
			params = {
			}
		}
		if <cur_drummer_id> :anim_animnodeexists id = <target2>
			<cur_drummer_id> :anim_command target = <target2> command = degenerateblend_addbranch params = {
				blendduration = 0.0
				tree = $single_source_tree
				params = {
					use_anim = <newbase>
				}
			}
		endif
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <num_drummers>
	else
		smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
		time_to_hit_1 = <time_to_trans>
		if (<node> = body)
			extendcrcwithstring checksum = drum_ string = <drum_old_short_string>
			oldbase = <extendedchecksum>
			extendcrcwithstring checksum = drum_ string = <drum_new_short_string>
			newbase = <extendedchecksum>
			switch <currentset>
				case 1
				target1 = db_drum_base_anim_old1
				target2 = db_drum_base_anim_new1
				case 2
				target1 = db_drum_base_anim_old2
				target2 = db_drum_base_anim_new2
				case 3
				target1 = db_drum_base_anim_old3
				target2 = db_drum_base_anim_new3
				case 4
				target1 = db_drum_base_anim_old4
				target2 = db_drum_base_anim_new4
			endswitch
		else
			extendcrcwithstring checksum = drum_ string = <drum_old_short_string>
			oldprefix = <extendedchecksum>
			extendcrcwithstring checksum = <oldprefix> string = '_IK'
			oldbase = <extendedchecksum>
			extendcrcwithstring checksum = drum_ string = <drum_new_short_string>
			newprefix = <extendedchecksum>
			extendcrcwithstring checksum = <newprefix> string = '_IK'
			newbase = <extendedchecksum>
			switch <currentset>
				case 1
				target1 = db_drum_baseik_anim_old1
				target2 = db_drum_baseik_anim_new1
				case 2
				target1 = db_drum_baseik_anim_old2
				target2 = db_drum_baseik_anim_new2
				case 3
				target1 = db_drum_baseik_anim_old3
				target2 = db_drum_baseik_anim_new3
				case 4
				target1 = db_drum_baseik_anim_old4
				target2 = db_drum_baseik_anim_new4
			endswitch
		endif
		if (<time_to_trans> < 0.0)
			time_to_trans = 0.0
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_ids> [<index>])
		if <cur_drummer_id> :anim_animnodeexists id = <target1>
			<cur_drummer_id> :anim_command target = <target1> command = degenerateblend_addbranch params = {
				blendduration = <time_to_trans>
				blendcurve = <smooth_transit_curve>
				tree = $single_source_tree
				params = {
					use_anim = <oldbase>
				}
			}
		else
		endif
		if <cur_drummer_id> :anim_animnodeexists id = <target2>
			<cur_drummer_id> :anim_command target = <target2> command = degenerateblend_addbranch params = {
				blendduration = <time_to_trans>
				blendcurve = <smooth_transit_curve>
				tree = $single_source_tree
				params = {
					use_anim = <newbase>
				}
			}
		else
		endif
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <num_drummers>
	endif
	should_idle = false
	time_to_trans = 0.0
	waittime = 0.0
	time_to_trans_base = 0.0
	drummer_ids = [musician1]
	currentset = 1
	node = body
	drum_old_long_string = 'S1T3'
	drum_new_long_string = 'S1T3'
	drum_old_short_string = 'S1T3'
	drum_new_short_string = 'S1T3'
	extendedchecksum = null
	cur_drummer_id = null
endscript

script hold_active_values 
	wait \{$drummer_offset
		seconds}
	index = 0
	begin
	(<drummer_ids> [<index>]) :animpreview_setsourcevalues {
		av_drum_anim_hand_l = <av_drum_anim_hand_l>
		av_drum_anim_hand_r = <av_drum_anim_hand_r>
		av_drum_anim_foot_r = <av_drum_anim_foot_r>
		av_drum_blend_hand_l = <av_drum_blend_hand_l>
		av_drum_blend_hand_r = <av_drum_blend_hand_r>
		av_drum_blend_foot_r = <av_drum_blend_foot_r>
		av_drum_blend_hh_kit = <av_drum_blend_hh_kit>
		av_drum_mod_loop_body = <av_drum_mod_loop_body>
		av_drum_mod_hand_r = <av_drum_mod_hand_r>
		av_drum_mod_hand_l = <av_drum_mod_hand_l>
		av_drum_mod_foot_r = <av_drum_mod_foot_r>
		av_drum_ik_hand_l = <av_drum_ik_hand_l>
		av_drum_ik_hand_r = <av_drum_ik_hand_r>
	}
	wait \{1
		frame}
	index = (<index> + 1)
	repeat <num_drummers>
	drummer_ids = [musician1]
	av_drum_anim_hand_l = 0.0
	av_drum_anim_hand_r = 0.0
	av_drum_anim_foot_r = 0.0
	av_drum_blend_hand_l = 0.0
	av_drum_blend_hand_r = 0.0
	av_drum_blend_foot_r = 0.0
	av_drum_blend_hh_kit = 0.0
	av_drum_mod_loop_body = 0.0
	av_drum_mod_hand_r = 0.0
	av_drum_mod_hand_l = 0.0
	av_drum_mod_foot_r = 0.0
	av_drum_ik_hand_l = 0.0
	av_drum_ik_hand_r = 0.0
endscript

script hold_drumkit_piece 
	if (<strength> > 1.0)
		strength = 1.0
	elseif (<strength> < 0.3)
		strength = 0.3
	endif
	wait \{$drummer_offset
		seconds}
	index = 0
	begin
	(<drummer_ids> [<index>]) :hit_drumkit_piece strength = <strength> pieces_hit = <pieces_hit>
	index = (<index> + 1)
	wait \{1
		frame}
	repeat <num_drummers>
endscript

script hold_drummer_anticipation_arms 
	if (<arm> = r)
		target = db_drum_hit_ant_r
		arm_string = 'R'
		slowstrength = 0.0
		fastest_trans = 60.0
		slowest_trans = ($drummer_offset * 1000.0)
		if ($last_time_to_hit_r >= <slowest_trans>)
			waittime = 0.0
			blendtime = <slowest_trans>
		else
			waittime = (<slowest_trans> - $last_time_to_hit_r)
			blendtime = ($last_time_to_hit_r)
		endif
		if (<time_to_hit> > <slowest_trans>)
			strength = <slowstrength>
		elseif (<time_to_hit> < <fastest_trans>)
			strength = 1.0
		else
			strength = (1.0 - ((<time_to_hit> - <fastest_trans>) / (<slowest_trans> - <fastest_trans>)))
		endif
		blendtime = (<blendtime> / 1000.0)
		waittime = (<waittime> / 1000.0)
		strength = (<strength> * <strength>)
		if ($use_db_branch_r = 1)
			tree = $drum_ant_branch_r_1
			target2 = db_drum_ant_r_1
			change \{use_db_branch_r = 2}
		else
			tree = $drum_ant_branch_r_2
			target2 = db_drum_ant_r_2
			change \{use_db_branch_r = 1}
		endif
		change last_time_to_hit_r = <time_to_hit>
	else
		target = db_drum_hit_ant_l
		arm_string = 'L'
		slowstrength = 0.0
		fastest_trans = 60.0
		slowest_trans = ($drummer_offset * 1000.0)
		if ($last_time_to_hit_l >= <slowest_trans>)
			waittime = 0.0
			blendtime = <slowest_trans>
		else
			waittime = (<slowest_trans> - $last_time_to_hit_l)
			blendtime = ($last_time_to_hit_l)
		endif
		if (<time_to_hit> > <slowest_trans>)
			strength = <slowstrength>
		elseif (<time_to_hit> < <fastest_trans>)
			strength = 1.0
		else
			strength = (1.0 - ((<time_to_hit> - <fastest_trans>) / (<slowest_trans> - <fastest_trans>)))
		endif
		blendtime = (<blendtime> / 1000.0)
		waittime = (<waittime> / 1000.0)
		strength = (<strength> * <strength>)
		if ($use_db_branch_r = 1)
			tree = $drum_ant_branch_r_1
			target2 = db_drum_ant_r_1
			change \{use_db_branch_r = 2}
		else
			tree = $drum_ant_branch_r_2
			target2 = db_drum_ant_r_2
			change \{use_db_branch_r = 1}
		endif
		change last_time_to_hit_r = <time_to_hit>
	endif
	formattext checksumname = anim 'Drum_%a_%b' a = <trans_string> b = <arm_string>
	wait <waittime> seconds
	index = 0
	begin
	(<drummer_ids> [<index>]) :obj_spawnscriptnow drummer_anticipation_arms params = {tree = <tree> target = <target> target2 = <target2> strength = <strength> blendtime = <blendtime> anim = <anim>}
	index = (<index> + 1)
	repeat <num_drummers>
	wait <blendtime> seconds
	anim = 'Drum_T3T3_R'
	blendtime = (<time_to_hit> / 1000.0)
	index = 0
	begin
	(<drummer_ids> [<index>]) :obj_spawnscriptnow drummer_anticipation_arms_out params = {target2 = <target2> strength = 1.0 blendtime = <blendtime> anim = <anim>}
	index = (<index> + 1)
	repeat <num_drummers>
	trans_string = 'S1T3'
	drummer_ids = [musician1]
endscript

script hold_transit_arms 
	wait \{$drummer_offset
		seconds}
	if (<l> = true)
		smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
		time_to_trans = (<time_to_hit_l> / 1000.0)
		if (<time_to_trans> < 0.0)
			time_to_trans = 0.0
		endif
		if (<tapin> = true)
			qhit_l = drumdroid_countoff_qhit_l
			mhit_l = drumdroid_countoff_mhit_l
			shit_l = drumdroid_countoff_shit_l
		else
			extendcrcwithstring checksum = drum_ string = <drum_new_state_string_l>
			prefix = <extendedchecksum>
			extendcrcwithstring checksum = <prefix> string = '_QHit_L'
			qhit_l = <extendedchecksum>
			extendcrcwithstring checksum = <prefix> string = '_MHit_L'
			mhit_l = <extendedchecksum>
			extendcrcwithstring checksum = <prefix> string = '_SHit_L'
			shit_l = <extendedchecksum>
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_ids> [<index>])
		<cur_drummer_id> :anim_command target = db_drum_shit_l_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <shit_l>
			}
		}
		<cur_drummer_id> :anim_command target = db_drum_mhit_l_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <mhit_l>
			}
		}
		<cur_drummer_id> :anim_command target = db_drum_qhit_l_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <qhit_l>
			}
		}
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <num_drummers>
	endif
	if (<r> = true)
		smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
		time_to_trans = (<time_to_hit_r> / 1000.0)
		if (<time_to_trans> < 0.0)
			time_to_trans = 0.0
		endif
		if (<tapin> = true)
			qhit_r = drumdroid_countoff_qhit_r
			mhit_r = drumdroid_countoff_mhit_r
			shit_r = drumdroid_countoff_shit_r
		else
			extendcrcwithstring checksum = drum_ string = <drum_new_state_string_r>
			prefix = <extendedchecksum>
			extendcrcwithstring checksum = <prefix> string = '_QHit_R'
			qhit_r = <extendedchecksum>
			extendcrcwithstring checksum = <prefix> string = '_MHit_R'
			mhit_r = <extendedchecksum>
			extendcrcwithstring checksum = <prefix> string = '_SHit_R'
			shit_r = <extendedchecksum>
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_ids> [<index>])
		<cur_drummer_id> :anim_command target = db_drum_shit_r_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <shit_r>
			}
		}
		<cur_drummer_id> :anim_command target = db_drum_mhit_r_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <mhit_r>
			}
		}
		<cur_drummer_id> :anim_command target = db_drum_qhit_r_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <qhit_r>
			}
		}
		index = (<index> + 1)
		wait \{1
			frame}
		repeat <num_drummers>
	endif
	drummer_ids = [musician1]
	time_to_hit_l = 0.0
	time_to_hit_r = 0.0
	tapin = false
	drum_new_state_string_r = 'S1T3'
	drum_new_state_string_l = 'S1T3'
	extendedchecksum = null
	cur_drummer_id = null
endscript
