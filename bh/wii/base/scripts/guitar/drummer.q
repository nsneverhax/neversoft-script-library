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

script drummer_transit 
	smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
	smooth_transit_curve_body = [1.0 , 0.99960196 , 0.9982739 , 0.995815 , 0.992026 , 0.98671097 , 0.9796699 , 0.97069895 , 0.95959204 , 0.946134 , 0.93010396 , 0.91126895 , 0.889385 , 0.86419207 , 0.835415 , 0.802758 , 0.76589996 , 0.724496 , 0.6781651 , 0.626492 , 0.569015 , 0.505221 , 0.434534 , 0.35751104 , 0.281412 , 0.20999001 , 0.145196 , 0.0889148 , 0.043468494 , 0.0121238 , 0.0]
	smooth_transit_curve_arm = [1.0 , 0.99872696 , 0.994802 , 0.988059 , 0.978324 , 0.96540695 , 0.949108 , 0.9292079 , 0.905469 , 0.87763 , 0.845403 , 0.80846906 , 0.76646996 , 0.719005 , 0.665619 , 0.605793 , 0.53893197 , 0.464341 , 0.38269204 , 0.30501202 , 0.23405398 , 0.17038701 , 0.114788994 , 0.068295404 , 0.032288197 , 0.00864603 , 0.0]
	smooth_transit_curve_ik = [1.0 , 0.996066 , 0.984568 , 0.96588695 , 0.940315 , 0.90806997 , 0.869298 , 0.82408 , 0.772429 , 0.714292 , 0.6495411 , 0.57796204 , 0.49924302 , 0.413491 , 0.331354 , 0.25736797 , 0.19188 , 0.13525799 , 0.0878982 , 0.050220903 , 0.0226798 , 0.0057634 , 0.0]
	time_to_trans = (<time_to_trans> / 1000.0)
	time_to_hit_1 = (<time_to_hit_1> / 1000.0)
	time_to_trans_ik = <time_to_trans>
	time_to_trans_body = <time_to_trans>
	time_to_trans_arm = <time_to_trans>
	if (<tapin> = true)
		formatText \{checksumName = qhit_r
			'DrumDroid_CountOff_QHit_R'}
		formatText \{checksumName = mhit_r
			'DrumDroid_CountOff_MHit_R'}
		formatText \{checksumName = shit_r
			'DrumDroid_CountOff_SHit_R'}
		formatText \{checksumName = qhit_l
			'DrumDroid_CountOff_QHit_L'}
		formatText \{checksumName = mhit_l
			'DrumDroid_CountOff_MHit_L'}
		formatText \{checksumName = shit_l
			'DrumDroid_CountOff_SHit_L'}
		formatText checksumName = Base 'Drum_%a' a = <drum_target_state_string>
		formatText checksumName = base_ik 'Drum_IK_%a' a = <drum_target_state_string>
		formatText checksumName = base_arm 'Drum_Arm_%a' a = <drum_target_state_string>
	else
		formatText checksumName = qhit_r 'Drum_%a_QHit_R' a = <drum_target_state_string>
		formatText checksumName = mhit_r 'Drum_%a_MHit_R' a = <drum_target_state_string>
		formatText checksumName = shit_r 'Drum_%a_SHit_R' a = <drum_target_state_string>
		formatText checksumName = qhit_l 'Drum_%a_QHit_L' a = <drum_target_state_string>
		formatText checksumName = mhit_l 'Drum_%a_MHit_L' a = <drum_target_state_string>
		formatText checksumName = shit_l 'Drum_%a_SHit_L' a = <drum_target_state_string>
		formatText checksumName = Base 'Drum_%a' a = <drum_target_state_string>
		formatText checksumName = base_ik 'Drum_IK_%a' a = <drum_target_state_string>
		formatText checksumName = base_arm 'Drum_Arm_%a' a = <drum_target_state_string>
	endif
	GetTags \{Idle}
	GetTags \{tap}
	time_from_idle = (((1 - $drum_idlepoint_arm_shit) * $drum_slowest_arm_hit) / 1000.0)
	if (<Idle> = true)
		if (<time_to_hit_1> > <time_from_idle>)
			waitTime = (<time_to_hit_1> - <time_from_idle>)
			Wait <waitTime> Seconds
			Obj_KillSpawnedScript \{Name = drummer_transit_idles}
			time_to_trans = ((<time_to_trans> - <time_to_hit_1>) + <time_from_idle>)
			SetTags \{Idle = FALSE}
			Obj_SpawnScriptNow drummer_transit_loops params = {state = in BlendDuration = <time_to_trans>}
		else
			Obj_KillSpawnedScript \{Name = drummer_transit_idles}
			SetTags \{Idle = FALSE}
			Obj_SpawnScriptNow drummer_transit_loops params = {state = in BlendDuration = <time_to_trans>}
		endif
	else
		if (<should_idle> = true)
			Obj_KillSpawnedScript \{Name = drummer_transit_loops}
			Obj_SpawnScriptNow drummer_transit_idles params = {state = in tap = <tap>}
			waitTime = (<time_to_hit_1> - <time_from_idle>)
			Wait <waitTime> Seconds
			Obj_KillSpawnedScript \{Name = drummer_transit_idles}
			time_to_trans = ((<time_to_trans> - <time_to_hit_1>) + <time_from_idle>)
			Obj_SpawnScriptNow drummer_transit_loops params = {state = in BlendDuration = <time_to_trans>}
		endif
	endif
	if (<time_to_trans> < 0.0)
		time_to_trans = 0.0
	endif
	create_trans_diff time_to_trans = <time_to_trans>
	Anim_Command target = db_drum_shit_r_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = <shit_r>
		}
	}
	Anim_Command target = db_drum_mhit_r_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = <mhit_r>
		}
	}
	Anim_Command target = db_drum_qhit_r_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = <qhit_r>
		}
	}
	Anim_Command target = db_drum_shit_l_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = <shit_l>
		}
	}
	Anim_Command target = db_drum_mhit_l_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = <mhit_l>
		}
	}
	Anim_Command target = db_drum_qhit_l_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		BlendCurve = <smooth_transit_curve>
		Tree = $single_source_anim_event_tree
		params = {
			use_anim = <qhit_l>
		}
	}
	Anim_Command target = db_drum_transition_base_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans_body>
		BlendCurve = <smooth_transit_curve_body>
		Tree = $single_source_tree
		params = {
			use_anim = <Base>
		}
	}
	Anim_Command target = db_drum_transition_arm_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans_arm>
		BlendCurve = <smooth_transit_curve_arm>
		Tree = $single_source_tree
		params = {
			use_anim = <base_arm>
		}
	}
	Anim_Command target = db_drum_transition_ik_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans_ik>
		BlendCurve = <smooth_transit_curve_ik>
		Tree = $single_source_tree
		params = {
			use_anim = <base_ik>
		}
	}
	SetTags tap = <tapin>
endscript

script drummer_transit_idles 
	Obj_GetID
	SetTags \{Idle = true}
	smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
	BlendDuration = (($drum_idlepoint_arm_shit * $drum_slowest_arm_hit) / 1000.0)
	if (<tap> = FALSE)
		Obj_SpawnScriptNow default_drummer_state params = {BlendDuration = <BlendDuration>}
	endif
	begin
	anim = safe
	if (<anim> = safe)
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
		GetRandomValue \{Name = randomanim
			integer
			a = 0
			b = 4}
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
		endswitch
	else
		start = 0.0
		anim = drumdroid_pointntwirl_inout
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
	repeat
endscript

script drummer_transit_loops 
	Obj_GetID
	oldset = d
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
	begin
	current_tempo = $current_tempo
	if (<current_tempo> < 85.0)
		Set = a
	elseif (<current_tempo> > 115.0)
		Set = c
	else
		Set = b
	endif
	if (<oldset> != <Set>)
		if (<Set> = a)
			loop_body = drum_loop_highenergy_075
			oldset = a
		elseif (<Set> = b)
			loop_body = drum_loop_loenergy_100
			oldset = b
		elseif (<Set> = c)
			loop_body = drum_loop_highenergy_120
			oldset = c
		endif
		if (<BlendDuration> < 0.0)
			BlendDuration = 0.0
		endif
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
	endif
	Wait <blend_duration> Seconds
	BlendDuration = 0.6
	begin
	if (<current_tempo> = $current_tempo)
		Wait \{1
			gameframe}
	else
		break
	endif
	repeat
	repeat
endscript

script drummer_current_tempo 
	tempo_change_threshold = 10.0
	begin
	getplayerinfo \{1
		part
		current_song_beat_time}
	tempo_bpm = ((1000.0 / <current_song_beat_time>) * 60.0)
	if (<tempo_bpm> > 135.0)
		tempo_bpm = (<tempo_bpm> / 2.0)
	endif
	tempodiff = (<tempo_bpm> - $current_tempo)
	if (<tempodiff> < 0.0)
		tempodiff = (<tempodiff> * (0.0 -1.0))
	endif
	if (<tempodiff> > <tempo_change_threshold>)
		Change current_tempo = <tempo_bpm>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script set_drummer_active_values 
	Obj_GetID
	<objID> :AnimPreview_SetSourceValues {
		av_drum_anim_hand_l = <av_drum_anim_hand_l>
		av_drum_anim_hand_r = <av_drum_anim_hand_r>
		av_drum_anim_foot_r = <av_drum_anim_foot_r>
		av_drum_mod_loop_body = <av_drum_mod_loop_body>
		av_drum_mod_hand_r = <av_drum_mod_hand_r>
		av_drum_mod_hand_l = <av_drum_mod_hand_l>
		av_drum_mod_foot_r = <av_drum_mod_foot_r>
		av_drum_ik_hand_l = <av_drum_ik_hand_l>
		av_drum_ik_hand_r = <av_drum_ik_hand_r>
	}
	Wait \{2
		gameframes}
	<objID> :AnimPreview_SetSourceValues {
		av_drum_blend_hand_l = <av_drum_blend_hand_l>
		av_drum_blend_hand_r = <av_drum_blend_hand_r>
		av_drum_blend_foot_r = <av_drum_blend_foot_r>
		av_drum_blend_hh_kit = <av_drum_blend_hh_kit>
	}
endscript

script drummer_offset_anims 
	Obj_GetID
	switch <objID>
		case musician1
		case musician2
		Wait \{6
			gameframes}
		case musician3
		Wait \{2
			gameframes}
		case musician4
		Wait \{4
			gameframes}
	endswitch
endscript

script create_trans_diff 
	short_trans = 0.1
	short_trans_diff = 2.5
	long_trans = 0.9
	long_trans_diff = 1.5
	if (<time_to_trans> > <long_trans>)
		trans_diff = <long_trans_diff>
	elseif (<time_to_trans> < <short_trans>)
		trans_diff = <short_trans_diff>
	else
		trans_diff = (((<long_trans> - <time_to_trans>) / (<long_trans> - <short_trans>)))
		trans_diff = ((<short_trans_diff> * <trans_diff>) + (<long_trans_diff> * (1 - <trans_diff>)))
	endif
	time_to_trans_ik = (<time_to_trans> * 1.1)
	time_to_trans_body = (<time_to_trans_ik> * <trans_diff>)
	time_to_trans_arm = ((<time_to_trans_ik> + <time_to_trans_body>) / 2)
	return time_to_trans_ik = <time_to_trans_ik> time_to_trans_body = <time_to_trans_body> time_to_trans_arm = <time_to_trans_arm>
endscript

script hit_drumkit_piece \{Strength = 0.0}
	if (<Strength> > 1.0)
		Strength = 1.0
	elseif (<Strength> < 0.3)
		Strength = 0.3
	endif
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
			BlendDuration = 0.2
			Tree = $gh_drum_cymbal_1_branch
			params = {
				Strength = <Strength>
			}
		}
	elseif (<pieces_hit> = 6)
		Anim_Command target = db_drum_cymbal_2 Command = DegenerateBlend_AddBranch params = {
			BlendDuration = 0.2
			Tree = $gh_drum_cymbal_2_branch
			params = {
				Strength = <Strength>
			}
		}
	elseif (<pieces_hit> = 8)
		Anim_Command target = db_drum_cymbal_3 Command = DegenerateBlend_AddBranch params = {
			BlendDuration = 0.2
			Tree = $gh_drum_cymbal_3_branch
			params = {
				Strength = <Strength>
				anim = Random (@ gh_drum_cymbal_3_1 @ gh_drum_cymbal_3_2 @ gh_drum_cymbal_3_3 )
			}
		}
	else
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
	smooth_transit_curve_body = [1.0 , 0.99960196 , 0.9982739 , 0.995815 , 0.992026 , 0.98671097 , 0.9796699 , 0.97069895 , 0.95959204 , 0.946134 , 0.93010396 , 0.91126895 , 0.889385 , 0.86419207 , 0.835415 , 0.802758 , 0.76589996 , 0.724496 , 0.6781651 , 0.626492 , 0.569015 , 0.505221 , 0.434534 , 0.35751104 , 0.281412 , 0.20999001 , 0.145196 , 0.0889148 , 0.043468494 , 0.0121238 , 0.0]
	smooth_transit_curve_arm = [1.0 , 0.99872696 , 0.994802 , 0.988059 , 0.978324 , 0.96540695 , 0.949108 , 0.9292079 , 0.905469 , 0.87763 , 0.845403 , 0.80846906 , 0.76646996 , 0.719005 , 0.665619 , 0.605793 , 0.53893197 , 0.464341 , 0.38269204 , 0.30501202 , 0.23405398 , 0.17038701 , 0.114788994 , 0.068295404 , 0.032288197 , 0.00864603 , 0.0]
	smooth_transit_curve_ik = [1.0 , 0.996066 , 0.984568 , 0.96588695 , 0.940315 , 0.90806997 , 0.869298 , 0.82408 , 0.772429 , 0.714292 , 0.6495411 , 0.57796204 , 0.49924302 , 0.413491 , 0.331354 , 0.25736797 , 0.19188 , 0.13525799 , 0.0878982 , 0.050220903 , 0.0226798 , 0.0057634 , 0.0]
	create_trans_diff time_to_trans = <BlendDuration>
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
	Anim_Command target = db_drum_transition_base_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans_body>
		BlendCurve = <smooth_transit_curve_body>
		Tree = $single_source_tree
		params = {
			use_anim = drum_s1t3
		}
	}
	Anim_Command target = db_drum_transition_arm_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans_arm>
		BlendCurve = <smooth_transit_curve_arm>
		Tree = $single_source_tree
		params = {
			use_anim = drum_arm_s1t3
		}
	}
	Anim_Command target = db_drum_transition_ik_anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans_ik>
		BlendCurve = <smooth_transit_curve_ik>
		Tree = $single_source_tree
		params = {
			use_anim = drum_ik_s1t3
		}
	}
endscript
