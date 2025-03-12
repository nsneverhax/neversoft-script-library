g_drummer_smooth_transit_curve = [
	1.0
	0.9927499
	0.97199994
	0.93924993
	0.89599997
	0.84375006
	0.784
	0.71825
	0.64800006
	0.57475
	0.5
	0.42525002
	0.35200003
	0.28175
	0.216
	0.15625
	0.104
	0.0607499
	0.027999999
	0.00725001
	0.0
]

script hold_body_loops 
	waitseconds \{num_seconds = $drummer_offset}
	if (<body_type> = idle)
		killspawnedscriptsbyname \{name = drummer_transit_loops}
		index = 0
		begin
		(<drummer_ids> [<index>]) :obj_spawnscriptnow drummer_transit_idles params = {state = <state> tapin = <tapin> currentset = <currentset> last_hit = <last_hit>}
		index = (<index> + 1)
		waitonegameframe
		repeat <num_drummers>
	else
		killspawnedscriptsbyname \{name = drummer_transit_idles}
		index = 0
		begin
		(<drummer_ids> [<index>]) :obj_spawnscriptnow drummer_transit_loops params = {state = <state> blendduration = <blendduration>}
		index = (<index> + 1)
		waitonegameframe
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
	time_from_idle = (((1 - $drum_idlepoint_arm_shit) * $g_drum_hit_heavy_slowest) / 1000.0)
	time_to_hit_1 = (<time_to_hit_1> / 1000.0)
	waittime = 0.0
	if ($drummer_idle = true)
		changeglobalchecksum \{global_name = drummer_idle
			new_value = false}
		if (<time_to_hit_1> > <time_from_idle>)
			waittime = (<time_to_hit_1> - <time_from_idle>)
			waitseconds num_seconds = <waittime>
			fastspawnscriptnow script_name = hold_body_loops params = {
				body_type = loop
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				blendduration = <time_from_idle>
			}
		else
			fastspawnscriptnow script_name = hold_body_loops params = {
				body_type = loop
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				blendduration = <time_to_hit_1>
			}
		endif
	else
		if (<should_idle> = true)
			fastspawnscriptnow script_name = hold_body_loops params = {
				body_type = idle
				last_hit = <last_hit>
				currentset = <currentset>
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				tapin = <tapin>
			}
			waittime = (<time_to_hit_1> - <time_from_idle>)
			waitseconds num_seconds = <waittime>
			fastspawnscriptnow script_name = hold_body_loops params = {
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
	fastspawnscriptnow script_name = hold_transit_arms params = {
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
			changeglobalinteger \{global_name = current_db_base
				new_value = 1}
			changeglobalinteger \{global_name = use_db_base
				new_value = 2}
			case 2
			currentset = 2
			changeglobalinteger \{global_name = current_db_base
				new_value = 2}
			changeglobalinteger \{global_name = use_db_base
				new_value = 3}
			case 3
			currentset = 3
			changeglobalinteger \{global_name = current_db_base
				new_value = 3}
			changeglobalinteger \{global_name = use_db_base
				new_value = 4}
			case 4
			currentset = 4
			changeglobalinteger \{global_name = current_db_base
				new_value = 4}
			changeglobalinteger \{global_name = use_db_base
				new_value = 1}
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
	fastspawnscriptnow script_name = hold_body_trans params = {
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
	fastspawnscriptnow script_name = hold_body_trans params = {
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
	waitseconds num_seconds = <waittime>
	if (<type> = long)
		time_to_trans_base = (<time_to_trans_base> / 1000.0)
		if (<time_to_trans> < 0.0)
			time_to_trans = 0.0
		endif
		if (<time_to_trans_base> < 0.0)
			time_to_trans_base = 0.0
		endif
		if (<node> = body)
			target = db_drum_transition_base_anim
			extendcrcwithstring checksum = drum_ string = <drum_old_long_string>
			oldbase = <extended_checksum>
			extendcrcwithstring checksum = drum_ string = <drum_new_long_string>
			newbase = <extended_checksum>
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
			oldprefix = <extended_checksum>
			extendcrcwithstring checksum = <oldprefix> string = '_IK'
			oldbase = <extended_checksum>
			extendcrcwithstring checksum = drum_ string = <drum_new_long_string>
			newprefix = <extended_checksum>
			extendcrcwithstring checksum = <newprefix> string = '_IK'
			newbase = <extended_checksum>
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
			blendcurve = $g_drummer_smooth_transit_curve
			tree = <master_tree>
			params = {
			}
		}
		<cur_drummer_id> :anim_command target = <master_node> command = degenerateblend_addbranch params = {
			blendduration = 0.0
			blendcurve = $g_drummer_smooth_transit_curve
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
			blendcurve = $g_drummer_smooth_transit_curve
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
		waitonegameframe
		repeat <num_drummers>
	else
		time_to_hit_1 = <time_to_trans>
		if (<node> = body)
			extendcrcwithstring checksum = drum_ string = <drum_old_short_string>
			oldbase = <extended_checksum>
			extendcrcwithstring checksum = drum_ string = <drum_new_short_string>
			newbase = <extended_checksum>
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
			oldprefix = <extended_checksum>
			extendcrcwithstring checksum = <oldprefix> string = '_IK'
			oldbase = <extended_checksum>
			extendcrcwithstring checksum = drum_ string = <drum_new_short_string>
			newprefix = <extended_checksum>
			extendcrcwithstring checksum = <newprefix> string = '_IK'
			newbase = <extended_checksum>
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
				blendcurve = $g_drummer_smooth_transit_curve
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
				blendcurve = $g_drummer_smooth_transit_curve
				tree = $single_source_tree
				params = {
					use_anim = <newbase>
				}
			}
		else
		endif
		index = (<index> + 1)
		waitonegameframe
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
	extended_checksum = null
	cur_drummer_id = null
endscript

script hold_active_values \{drummer_ids = !a1768515945
		av_drum_anim_hand_l = !f1768515945
		av_drum_anim_hand_r = !f1768515945
		av_drum_anim_foot_r = !f1768515945
		av_drum_blend_hand_l = !f1768515945
		av_drum_blend_hand_r = !f1768515945
		av_drum_blend_foot_r = !f1768515945
		av_drum_blend_hh_kit = !f1768515945
		av_drum_mod_hand_r = !f1768515945
		av_drum_mod_hand_l = !f1768515945
		av_drum_mod_foot_r = !f1768515945
		av_drum_ik_hand_l = !f1768515945
		av_drum_ik_hand_r = !f1768515945
		av_drum_face_rock = !f1768515945
		num_drummers = !i1768515945}
	waitseconds \{num_seconds = $drummer_offset}
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
		av_drum_mod_hand_r = <av_drum_mod_hand_r>
		av_drum_mod_hand_l = <av_drum_mod_hand_l>
		av_drum_mod_foot_r = <av_drum_mod_foot_r>
		av_drum_ik_hand_l = <av_drum_ik_hand_l>
		av_drum_ik_hand_r = <av_drum_ik_hand_r>
		av_drum_face_rock = <av_drum_face_rock>
	}
	waitonegameframe
	index = (<index> + 1)
	repeat <num_drummers>
endscript

script hold_drummer_lookat_on_request \{drummer_ids = !a1768515945
		blend_duration = !f1768515945
		target_offset = 0x69696969
		num_drummers = !i1768515945}
	waitseconds num_seconds = ($drummer_offset - (($g_drummer_target_lookat_before_hitting_target) / 1000.0))
	index = 0
	begin
	musician = (<drummer_ids> [<index>])
	<musician> :anim_command {
		target = eye_lookat_type
		command = switchclearbones_setclearanims
		params = {
			sourceclear0 = gh_male_eye_lookat_base_lids
			sourceclear1 = gh_male_eye_lookat_base
		}
	}
	<musician> :obj_killspawnedscript name = band_lookat
	<musician> :obj_spawnscriptnow band_lookat params = {
		blend_duration = <blend_duration>
		head_strength = 0.7
		target = drummer
		target_offset = <target_offset>
		eye_type = standard
		part = drummer
		cam_check = false
	}
	index = (<index> + 1)
	repeat <num_drummers>
	musician = checksum
endscript

script hold_drummer_lookat_off_request \{drummer_ids = !a1768515945
		blend_duration = !f1768515945
		num_drummers = !i1768515945}
	waitseconds num_seconds = ($drummer_offset - (($g_drummer_target_lookat_before_hitting_target) / 1000.0))
	index = 0
	begin
	musician = (<drummer_ids> [<index>])
	<musician> :anim_command target = eye_lookat_switch command = partialswitch_setstate params = {off blendduration = <blend_duration>}
	<musician> :anim_command target = db_eye_lookat command = degenerateblend_addbranch params = {
		blendduration = <blend_duration>
		blendcurve = $g_drummer_smooth_transit_curve
		tree = $eye_lookat_off
		params = {
		}
	}
	<musician> :anim_command target = db_head_lookat command = degenerateblend_addbranch params = {
		blendduration = <blend_duration>
		blendcurve = $g_drummer_smooth_transit_curve
		tree = $head_lookat_off
		params = {
		}
	}
	index = (<index> + 1)
	repeat <num_drummers>
	musician = checksum
endscript

script hold_drumkit_piece 
	strength = ((<strength> * 0.5) + 0.5)
	if (<strength> > 1.0)
		strength = 1.0
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

script hold_transit_arms 
	waitseconds \{num_seconds = $drummer_offset}
	if (<l> = true)
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
			prefix = <extended_checksum>
			extendcrcwithstring checksum = <prefix> string = '_QHit_L'
			qhit_l = <extended_checksum>
			extendcrcwithstring checksum = <prefix> string = '_MHit_L'
			mhit_l = <extended_checksum>
			extendcrcwithstring checksum = <prefix> string = '_SHit_L'
			shit_l = <extended_checksum>
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_ids> [<index>])
		<cur_drummer_id> :anim_command target = db_drum_shit_l_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = $g_drummer_smooth_transit_curve
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <shit_l>
			}
		}
		<cur_drummer_id> :anim_command target = db_drum_mhit_l_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = $g_drummer_smooth_transit_curve
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <mhit_l>
			}
		}
		<cur_drummer_id> :anim_command target = db_drum_qhit_l_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = $g_drummer_smooth_transit_curve
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <qhit_l>
			}
		}
		index = (<index> + 1)
		waitonegameframe
		repeat <num_drummers>
	endif
	if (<r> = true)
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
			prefix = <extended_checksum>
			extendcrcwithstring checksum = <prefix> string = '_QHit_R'
			qhit_r = <extended_checksum>
			extendcrcwithstring checksum = <prefix> string = '_MHit_R'
			mhit_r = <extended_checksum>
			extendcrcwithstring checksum = <prefix> string = '_SHit_R'
			shit_r = <extended_checksum>
		endif
		index = 0
		begin
		cur_drummer_id = (<drummer_ids> [<index>])
		<cur_drummer_id> :anim_command target = db_drum_shit_r_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = $g_drummer_smooth_transit_curve
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <shit_r>
			}
		}
		<cur_drummer_id> :anim_command target = db_drum_mhit_r_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = $g_drummer_smooth_transit_curve
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <mhit_r>
			}
		}
		<cur_drummer_id> :anim_command target = db_drum_qhit_r_anim command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = $g_drummer_smooth_transit_curve
			tree = $single_source_anim_event_tree
			params = {
				use_anim = <qhit_r>
			}
		}
		index = (<index> + 1)
		waitonegameframe
		repeat <num_drummers>
	endif
	drummer_ids = [musician1]
	time_to_hit_l = 0.0
	time_to_hit_r = 0.0
	tapin = false
	drum_new_state_string_r = 'S1T3'
	drum_new_state_string_l = 'S1T3'
	extended_checksum = null
	cur_drummer_id = null
endscript
