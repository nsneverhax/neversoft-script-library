current_tempo = 100
drummer_active_values = [
	av_drum_anim_hand_l
	av_drum_anim_hand_r
	av_drum_anim_foot_r
	av_drum_anim_transit
	av_drum_blend_hand_l
	av_drum_blend_hand_r
	av_drum_blend_foot_r
	av_drum_blend_hh_kit
	av_drum_mod_loop_body
	av_drum_mod_hand_r
	av_drum_mod_hand_l
	av_drum_mod_foot_r
	av_drum_ik_hand_l
	av_drum_ik_hand_r
	av_drum_ik_feet
]

script drummer_transit_base_long 
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
	anim_command target = <target> command = degenerateblend_addbranch params = {
		blendduration = <time_to_trans_base>
		blendcurve = <smooth_transit_curve>
		tree = <master_tree>
		params = {
		}
	}
	anim_command target = <master_node> command = degenerateblend_addbranch params = {
		blendduration = 0.0
		blendcurve = <smooth_transit_curve>
		tree = <tree1>
		params = {
		}
	}
	if anim_animnodeexists id = <target1>
		anim_command target = <target1> command = degenerateblend_addbranch params = {
			blendduration = 0.0
			tree = $single_source_tree
			params = {
				use_anim = <oldbase>
			}
		}
	endif
	anim_command target = <master_node> command = degenerateblend_addbranch params = {
		blendduration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		tree = <tree2>
		params = {
		}
	}
	if anim_animnodeexists id = <target2>
		anim_command target = <target2> command = degenerateblend_addbranch params = {
			blendduration = 0.0
			tree = $single_source_tree
			params = {
				use_anim = <newbase>
			}
		}
	endif
	drum_old_long_string = 'S1T3'
	drum_new_long_string = 'S1T3'
	currentset = 0
	oldbase = drum_s1t3
	newbase = drum_s1t3
	extendedchecksum = null
endscript

script drummer_anticipation_arms 
	smooth_in = [1.0 , 0.99024594 , 0.95976996 , 0.906626 , 0.82877296 , 0.724314 , 0.59211797 , 0.43345502 , 0.256324 , 0.0871634 , 0.0]
	if (<blendtime> < 0.0)
		blendtime = 0.0
	endif
	anim_command target = <target> command = degenerateblend_addbranch params = {
		blendduration = <blendtime>
		blendcurve = <smooth_in>
		tree = <tree>
		params = {
		}
	}
	if anim_animnodeexists id = <target2>
		anim_command target = <target2> command = degenerateblend_addbranch params = {
			blendduration = 0.0
			tree = $sorce_mod_branch
			params = {
				strength = <strength>
				use_anim = <anim>
			}
		}
	endif
endscript

script drummer_anticipation_arms_out 
	smooth_out = [1.0 , 0.970518 , 0.86650604 , 0.68276 , 0.471731 , 0.296009 , 0.17043701 , 0.086863294 , 0.0352961 , 0.0081358 , 0.0]
	if anim_animnodeexists id = <target2>
		anim_command target = <target2> command = degenerateblend_addbranch params = {
			blendcurve = <smooth_out>
			blendduration = <blendtime>
			tree = $sorce_mod_branch_blank
			params = {
			}
		}
	endif
endscript

script drummer_transit_idles 
	smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
	obj_getid
	switch <objid>
		case musician1
		start = 0.0
		case musician2
		start = 0.25
		case musician3
		start = 0.5
		case musician4
		start = 0.75
		default
		start = 0.0
	endswitch
	blendduration = (($drum_idlepoint_arm_shit * $drum_slowest_arm_hit) / 1000.0)
	if (<tapin> = false)
		obj_spawnscriptnow default_drummer_state params = {time_to_trans = <blendduration> currentset = <currentset>}
	endif
	begin
	if (<last_hit> = true)
		getrandomvalue \{name = randomanim
			integer
			a = 0
			b = 8}
		switch <randomanim>
			case 0
			anim = drumdroid_armswidepoint_inout
			case 1
			anim = drumdroid_peerintocrowd_inout
			case 2
			anim = drumdroid_pointatcrowd_inout
			case 3
			anim = drumdroid_fistpump_inout
			case 4
			anim = drumdroid_outro_01
			case 5
			anim = drumdroid_outro_02
			case 6
			anim = drumdroid_outro_03
			case 7
			anim = drumdroid_outro_04
			case 8
			anim = drumdroid_outro_05
		endswitch
	else
		getrandomvalue \{name = randomanim
			integer
			a = 0
			b = 8}
		switch <randomanim>
			case 0
			anim = drumdroid_loosenup_in
			case 1
			anim = drumdroid_armswidepoint_inout
			case 2
			anim = drumdroid_peerintocrowd_inout
			case 3
			anim = drumdroid_pointatcrowd_inout
			case 4
			anim = drumdroid_fistpump_inout
			case 5
			anim = drumdroid_armatready_in
			case 6
			anim = drumdroid_armsstretch_in
			case 7
			anim = drumdroid_littlechairtwist_in
			case 8
			anim = drumdroid_pointcenter_in
		endswitch
	endif
	setsearchallassetcontexts
	if anim_animexists anim = <anim>
		anim_getanimlength anim = <anim>
	else
		length = 5.0
	endif
	setsearchallassetcontexts \{off}
	length = (<length> - <blendduration>)
	if (<length> < 0)
		length = 0
	endif
	if (<blendduration> < 0.0)
		blendduration = 0.0
	endif
	anim_command target = db_drum_loop_anim_tempo command = degenerateblend_addbranch params = {
		blendduration = <blendduration>
		tree = $drum_loop_anim_notempo
		params = {
			start = <start>
			loop_tempo_anim = <anim>
			loop_anim_body = <anim>
		}
	}
	blendduration = 0.6
	wait <length> seconds
	last_hit = false
	repeat
	currentset = 0
	objid = musician1
	randomanim = 0
endscript

script drummer_transit_loops 
	obj_getid
	oldset = d
	smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
	switch <objid>
		case musician1
		start = 0.0
		case musician2
		start = 0.25
		case musician3
		start = 0.5
		case musician4
		start = 0.75
		default
		start = 0.0
	endswitch
	begin
	current_tempo = $current_tempo
	if (<current_tempo> < 85.0)
		set = a
	elseif (<current_tempo> > 115.0)
		set = c
	else
		set = b
	endif
	getrandomvalue \{name = randomanim
		integer
		a = 0
		b = 1}
	if (<oldset> != <set>)
		if (<set> = a)
			loop_body = drum_loop_highenergy_075
			oldset = a
		elseif (<set> = b)
			loop_body = drum_loop_highenergy_100
			oldset = b
		elseif (<set> = c)
			loop_body = drum_loop_highenergy_120
			oldset = c
		endif
		if (<blendduration> < 0.0)
			blendduration = 0.0
		endif
		anim_command target = db_drum_loop_anim_tempo command = degenerateblend_addbranch params = {
			blendduration = <blendduration>
			blendcurve = <smooth_transit_curve>
			tree = $drum_loop_anim_tempo
			params = {
				start = <start>
				loop_tempo_anim = <loop_body>
				loop_anim_body = <loop_body>
			}
		}
	endif
	wait <blend_duration> seconds
	blendduration = 0.6
	begin
	if (<current_tempo> = $current_tempo)
		wait \{1
			gameframe}
	else
		break
	endif
	repeat
	repeat
	objid = musician1
	blend_duration = 0.0
endscript

script drummer_current_tempo 
	tempo_change_threshold = 10.0
	begin
	floatvalue = 0.0
	getplayerfloat \{player = 1
		checksum = current_song_beat_time}
	current_song_beat_time = <floatvalue>
	tempo_bpm = ((1000.0 / <current_song_beat_time>) * 60.0)
	if (<tempo_bpm> > 202.5)
		tempo_bpm = (<tempo_bpm> / 3.0)
	elseif (<tempo_bpm> > 135.0)
		tempo_bpm = (<tempo_bpm> / 2.0)
	elseif (<tempo_bpm> < 67.5)
		tempo_bpm = (<tempo_bpm> * 2.0)
	endif
	tempodiff = (<tempo_bpm> - $current_tempo)
	if (<tempodiff> < 0.0)
		tempodiff = (<tempodiff> * (0.0 -1.0))
	endif
	if (<tempodiff> > <tempo_change_threshold>)
		change current_tempo = <tempo_bpm>
		wait \{2
			seconds}
	endif
	wait \{1
		gameframe}
	repeat
	current_song_beat_time = 0
endscript

script set_drummer_active_values 
	obj_getid
	<objid> :animpreview_setsourcevalues {
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
	objid = musician0
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

script hit_drumkit_piece \{strength = 0.0}
	blendduration = 0.25
	if (<pieces_hit> = 2)
		anim_command \{target = db_drum_hh
			command = degenerateblend_addbranch
			params = {
				blendduration = 0.2
				tree = $gh_drum_hh_branch
				params = {
					strength = 1.0
				}
			}}
	elseif (<pieces_hit> = 3)
		anim_command target = db_drum_cymbal_1 command = degenerateblend_addbranch params = {
			blendduration = <blendduration>
			tree = $gh_drum_cymbal_1_branch
			params = {
				strength = <strength>
			}
		}
	elseif (<pieces_hit> = 6)
		anim_command target = db_drum_cymbal_2 command = degenerateblend_addbranch params = {
			blendduration = <blendduration>
			tree = $gh_drum_cymbal_2_branch
			params = {
				strength = <strength>
			}
		}
	elseif (<pieces_hit> = 8)
		anim_command target = db_drum_cymbal_3 command = degenerateblend_addbranch params = {
			blendduration = <blendduration>
			tree = $gh_drum_cymbal_3_branch
			params = {
				strength = <strength>
				anim = Random (@ gh_drum_cymbal_3_1 @ gh_drum_cymbal_3_2 @ gh_drum_cymbal_3_3 )
			}
		}
	endif
endscript

script default_kit_anims 
	<name> :anim_command target = db_drum_cymbal_1 command = degenerateblend_addbranch params = {
		blendduration = 0.0
		tree = $gh_drum_cymbal_1_branch
		params = {
			strength = 0.0
		}
	}
	<name> :anim_command target = db_drum_cymbal_2 command = degenerateblend_addbranch params = {
		blendduration = 0.0
		tree = $gh_drum_cymbal_2_branch
		params = {
			strength = 0.0
		}
	}
	<name> :anim_command target = db_drum_cymbal_3 command = degenerateblend_addbranch params = {
		blendduration = 0.0
		tree = $gh_drum_cymbal_3_branch
		params = {
			strength = 0.0
			anim = gh_drum_cymbal_3_1
		}
	}
	<name> :anim_command target = db_drum_hh command = degenerateblend_addbranch params = {
		blendduration = 0.0
		tree = $gh_drum_hh_branch
		params = {
			strength = 0.0
		}
	}
endscript

script default_drummer_state 
	smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
	switch <currentset>
		case 1
		targetik1 = db_drum_baseik_anim_old1
		targetik2 = db_drum_baseik_anim_new1
		target1 = db_drum_base_anim_old1
		target2 = db_drum_base_anim_new1
		case 2
		targetik1 = db_drum_baseik_anim_old2
		targetik2 = db_drum_baseik_anim_new2
		target1 = db_drum_base_anim_old2
		target2 = db_drum_base_anim_new2
		case 3
		targetik1 = db_drum_baseik_anim_old3
		targetik2 = db_drum_baseik_anim_new3
		target1 = db_drum_base_anim_old3
		target2 = db_drum_base_anim_new3
		case 4
		targetik1 = db_drum_baseik_anim_old4
		targetik2 = db_drum_baseik_anim_new4
		target1 = db_drum_base_anim_old4
		target2 = db_drum_base_anim_new4
	endswitch
	anim_command target = db_drum_shit_r_anim command = degenerateblend_addbranch params = {
		blendduration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_shit_r
		}
	}
	anim_command target = db_drum_mhit_r_anim command = degenerateblend_addbranch params = {
		blendduration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_mhit_r
		}
	}
	anim_command target = db_drum_qhit_r_anim command = degenerateblend_addbranch params = {
		blendduration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_qhit_r
		}
	}
	anim_command target = db_drum_shit_l_anim command = degenerateblend_addbranch params = {
		blendduration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_shit_l
		}
	}
	anim_command target = db_drum_mhit_l_anim command = degenerateblend_addbranch params = {
		blendduration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_mhit_l
		}
	}
	anim_command target = db_drum_qhit_l_anim command = degenerateblend_addbranch params = {
		blendduration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_qhit_l
		}
	}
	if anim_animnodeexists id = <target1>
		anim_command target = <target1> command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_tree
			params = {
				use_anim = drum_s1t3
			}
		}
	endif
	if anim_animnodeexists id = <target2>
		anim_command target = <target2> command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_tree
			params = {
				use_anim = drum_s1t3
			}
		}
	endif
	if anim_animnodeexists id = <targetik1>
		anim_command target = <targetik1> command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_tree
			params = {
				use_anim = drum_s1t3_ik
			}
		}
	endif
	if anim_animnodeexists id = <targetik2>
		anim_command target = <targetik2> command = degenerateblend_addbranch params = {
			blendduration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			tree = $single_source_tree
			params = {
				use_anim = drum_s1t3_ik
			}
		}
	endif
	currentset = 0
	time_to_trans = 0.0
endscript
