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
	if (<node> = Body)
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
	Anim_Command target = <target> Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans_base>
		BlendCurve = <smooth_transit_curve>
		Tree = <master_tree>
		params = {
		}
	}
	Anim_Command target = <master_node> Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		BlendCurve = <smooth_transit_curve>
		Tree = <tree1>
		params = {
		}
	}
	if Anim_AnimNodeExists id = <target1>
		Anim_Command target = <target1> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = 0.0
			Tree = $single_source_tree
			params = {
				use_anim = <oldbase>
			}
		}
	endif
	Anim_Command target = <master_node> Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = <tree2>
		params = {
		}
	}
	if Anim_AnimNodeExists id = <target2>
		Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = 0.0
			Tree = $single_source_tree
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
	extendedchecksum = NULL
endscript

script drummer_anticipation_arms 
	smooth_in = [1.0 , 0.99024594 , 0.95976996 , 0.906626 , 0.82877296 , 0.724314 , 0.59211797 , 0.43345502 , 0.256324 , 0.0871634 , 0.0]
	if (<blendtime> < 0.0)
		blendtime = 0.0
	endif
	Anim_Command target = <target> Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blendtime>
		BlendCurve = <smooth_in>
		Tree = <Tree>
		params = {
		}
	}
	if Anim_AnimNodeExists id = <target2>
		Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = 0.0
			Tree = $sorce_mod_branch
			params = {
				Strength = <Strength>
				use_anim = <anim>
			}
		}
	endif
endscript

script drummer_anticipation_arms_out 
	smooth_out = [1.0 , 0.970518 , 0.86650604 , 0.68276 , 0.471731 , 0.296009 , 0.17043701 , 0.086863294 , 0.0352961 , 0.0081358 , 0.0]
	if Anim_AnimNodeExists id = <target2>
		Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
			BlendCurve = <smooth_out>
			BlendDuration = <blendtime>
			Tree = $sorce_mod_branch_blank
			params = {
			}
		}
	endif
endscript

script drummer_transit_idles 
	smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
	Obj_GetID
	switch <objID>
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
	BlendDuration = (($drum_idlepoint_arm_shit * $drum_slowest_arm_hit) / 1000.0)
	if (<tapin> = FALSE)
		Obj_SpawnScriptNow default_drummer_state params = {time_to_trans = <BlendDuration> currentset = <currentset>}
	endif
	begin
	if (<last_hit> = true)
		GetRandomValue \{Name = randomanim
			integer
			a = 1
			b = 4}
		switch <randomanim>
			case 1
			anim = drumdroid_peerintocrowd_inout
			case 2
			anim = drumdroid_fistpump_inout
			case 3
			anim = drumdroid_outro_02
			case 4
			anim = drumdroid_outro_05
		endswitch
	else
		GetRandomValue \{Name = randomanim
			integer
			a = 1
			b = 6}
		switch <randomanim>
			case 1
			anim = drumdroid_loosenup_in
			case 2
			anim = drumdroid_peerintocrowd_inout
			case 3
			anim = drumdroid_fistpump_inout
			case 4
			anim = drumdroid_armatready_in
			case 5
			anim = drumdroid_littlechairtwist_in
			case 6
			anim = drumdroid_pointcenter_in
		endswitch
	endif
	SetSearchAllAssetContexts
	if Anim_AnimExists anim = <anim>
		Anim_GetAnimLength anim = <anim>
	else
		length = 5.0
	endif
	SetSearchAllAssetContexts \{OFF}
	length = (<length> - <BlendDuration>)
	if (<length> < 0)
		length = 0
	endif
	if (<BlendDuration> < 0.0)
		BlendDuration = 0.0
	endif
	Anim_Command target = db_drum_loop_anim_tempo Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <BlendDuration>
		Tree = $drum_loop_anim_notempo
		params = {
			start = <start>
			loop_tempo_anim = <anim>
			loop_anim_body = <anim>
		}
	}
	BlendDuration = 0.6
	Wait <length> Seconds
	last_hit = FALSE
	repeat
	currentset = 0
	objID = musician1
	randomanim = 0
endscript

script drummer_transit_loops 
	Obj_GetID
	smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
	switch <objID>
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
	if (<BlendDuration> < 0.0)
		BlendDuration = 0.0
	endif
	current_tempo = $current_tempo
	if (<current_tempo> < 85.0)
		loop_body = drum_loop_highenergy_075
	elseif (<current_tempo> > 115.0)
		loop_body = drum_loop_highenergy_120
	else
		loop_body = drum_loop_highenergy_100
	endif
	begin
	Anim_Command target = db_drum_loop_anim_tempo Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <BlendDuration>
		BlendCurve = <smooth_transit_curve>
		Tree = $drum_loop_anim_tempo
		params = {
			start = <start>
			loop_tempo_anim = <loop_body>
			loop_anim_body = <loop_body>
		}
	}
	Wait <blend_duration> Seconds
	0x1f3e70c8
	repeat
endscript

script drummer_current_tempo 
	tempo_change_threshold = 10.0
	begin
	floatvalue = 0.0
	getplayerfloat \{Player = 1
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
		Change current_tempo = <tempo_bpm>
		Wait \{2
			Seconds}
	endif
	Wait \{1
		gameframe}
	repeat
	current_song_beat_time = 0
endscript

script set_drummer_active_values 
	Obj_GetID
	<objID> :AnimPreview_SetSourceValues {
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
	objID = musician0
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

script hit_drumkit_piece \{Strength = 0.0}
	BlendDuration = 0.25
	if (<pieces_hit> = 2)
		Anim_Command \{target = db_drum_hh
			Command = DegenerateBlend_AddBranch
			params = {
				BlendDuration = 0.2
				Tree = $gh_drum_hh_branch
				params = {
					Strength = 1.0
				}
			}}
	elseif (<pieces_hit> = 3)
		Anim_Command target = db_drum_cymbal_1 Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <BlendDuration>
			Tree = $gh_drum_cymbal_1_branch
			params = {
				Strength = <Strength>
			}
		}
	elseif (<pieces_hit> = 6)
		Anim_Command target = db_drum_cymbal_2 Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <BlendDuration>
			Tree = $gh_drum_cymbal_2_branch
			params = {
				Strength = <Strength>
			}
		}
	elseif (<pieces_hit> = 8)
		Anim_Command target = db_drum_cymbal_3 Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <BlendDuration>
			Tree = $gh_drum_cymbal_3_branch
			params = {
				Strength = <Strength>
				anim = Random (@ gh_drum_cymbal_3_1 @ gh_drum_cymbal_3_2 @ gh_drum_cymbal_3_3 )
			}
		}
	endif
endscript

script default_kit_anims 
	<Name> :Anim_Command target = db_drum_cymbal_1 Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $gh_drum_cymbal_1_branch
		params = {
			Strength = 0.0
		}
	}
	<Name> :Anim_Command target = db_drum_cymbal_2 Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $gh_drum_cymbal_2_branch
		params = {
			Strength = 0.0
		}
	}
	<Name> :Anim_Command target = db_drum_cymbal_3 Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $gh_drum_cymbal_3_branch
		params = {
			Strength = 0.0
			anim = gh_drum_cymbal_3_1
		}
	}
	<Name> :Anim_Command target = db_drum_hh Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $gh_drum_hh_branch
		params = {
			Strength = 0.0
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
	Anim_Command target = db_drum_shit_r_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_shit_r
		}
	}
	Anim_Command target = db_drum_mhit_r_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_mhit_r
		}
	}
	Anim_Command target = db_drum_qhit_r_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_qhit_r
		}
	}
	Anim_Command target = db_drum_shit_l_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_shit_l
		}
	}
	Anim_Command target = db_drum_mhit_l_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_mhit_l
		}
	}
	Anim_Command target = db_drum_qhit_l_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = drum_s1t3_qhit_l
		}
	}
	if Anim_AnimNodeExists id = <target1>
		Anim_Command target = <target1> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			BlendCurve = <smooth_transit_curve>
			Tree = $single_source_tree
			params = {
				use_anim = drum_s1t3
			}
		}
	endif
	if Anim_AnimNodeExists id = <target2>
		Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			BlendCurve = <smooth_transit_curve>
			Tree = $single_source_tree
			params = {
				use_anim = drum_s1t3
			}
		}
	endif
	if Anim_AnimNodeExists id = <targetik1>
		Anim_Command target = <targetik1> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			BlendCurve = <smooth_transit_curve>
			Tree = $single_source_tree
			params = {
				use_anim = drum_s1t3_ik
			}
		}
	endif
	if Anim_AnimNodeExists id = <targetik2>
		Anim_Command target = <targetik2> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			BlendCurve = <smooth_transit_curve>
			Tree = $single_source_tree
			params = {
				use_anim = drum_s1t3_ik
			}
		}
	endif
	currentset = 0
	time_to_trans = 0.0
endscript
