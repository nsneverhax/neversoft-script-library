Current_Tempo = 100
drummer_active_values = [
	AV_Drum_Anim_Hand_L
	AV_Drum_Anim_Hand_R
	AV_Drum_Anim_Foot_R
	AV_Drum_Anim_Transit
	AV_Drum_Blend_Hand_L
	AV_Drum_Blend_Hand_R
	AV_Drum_Blend_Foot_R
	AV_Drum_Blend_HH_Kit
	AV_Drum_Mod_Loop_Body
	AV_Drum_Mod_Hand_R
	AV_Drum_Mod_Hand_L
	AV_Drum_Mod_Foot_R
	AV_Drum_IK_Hand_L
	AV_Drum_IK_Hand_R
	AV_Drum_IK_Feet
]

script drummer_transit_base_long 
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
	Anim_Command target = <target> Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans_Base>
		blendcurve = <smooth_transit_curve>
		Tree = <master_tree>
		params = {
		}
	}
	Anim_Command target = <master_node> Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		blendcurve = <smooth_transit_curve>
		Tree = <tree1>
		params = {
		}
	}
	if Anim_AnimNodeExists id = <Target1>
		Anim_Command target = <Target1> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = 0.0
			Tree = $Single_Source_tree
			params = {
				Use_Anim = <OldBase>
			}
		}
	endif
	Anim_Command target = <master_node> Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		Tree = <tree2>
		params = {
		}
	}
	if Anim_AnimNodeExists id = <target2>
		Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = 0.0
			Tree = $Single_Source_tree
			params = {
				Use_Anim = <Newbase>
			}
		}
	endif
	Drum_Old_Long_String = 'S1T3'
	Drum_New_Long_String = 'S1T3'
	currentset = 0
	OldBase = Drum_S1T3
	Newbase = Drum_S1T3
	ExtendedChecksum = null
endscript

script Drummer_Anticipation_Arms 
	smooth_In = [1.0 , 0.99024594 , 0.95976996 , 0.906626 , 0.82877296 , 0.724314 , 0.59211797 , 0.43345502 , 0.256324 , 0.0871634 , 0.0]
	if (<BlendTime> < 0.0)
		BlendTime = 0.0
	endif
	Anim_Command target = <target> Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <BlendTime>
		blendcurve = <smooth_In>
		Tree = <Tree>
		params = {
		}
	}
	if Anim_AnimNodeExists id = <target2>
		Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = 0.0
			Tree = $Sorce_Mod_Branch
			params = {
				strength = <strength>
				Use_Anim = <anim>
			}
		}
	endif
endscript

script Drummer_Anticipation_Arms_out 
	smooth_Out = [1.0 , 0.970518 , 0.86650604 , 0.68276 , 0.471731 , 0.296009 , 0.17043701 , 0.086863294 , 0.0352961 , 0.0081358 , 0.0]
	if Anim_AnimNodeExists id = <target2>
		Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
			blendcurve = <smooth_Out>
			BlendDuration = <BlendTime>
			Tree = $Sorce_Mod_Branch_blank
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
	BlendDuration = (($Drum_Idlepoint_Arm_SHit * $Drum_Slowest_Arm_Hit) / 1000.0)
	if (<tapin> = false)
		Obj_SpawnScriptNow default_drummer_state params = {time_to_trans = <BlendDuration> currentset = <currentset>}
	endif
	begin
	if (<Last_Hit> = true)
		GetRandomValue \{name = randomanim
			integer
			a = 0
			b = 8}
		switch <randomanim>
			case 0
			anim = DrumDroid_ArmsWidePoint_InOut
			case 1
			anim = DrumDroid_PeerIntoCrowd_InOut
			case 2
			anim = DrumDroid_PointAtCrowd_InOut
			case 3
			anim = DrumDroid_FistPump_InOut
			case 4
			anim = DrumDroid_Outro_01
			case 5
			anim = DrumDroid_Outro_02
			case 6
			anim = DrumDroid_Outro_03
			case 7
			anim = DrumDroid_Outro_04
			case 8
			anim = DrumDroid_Outro_05
		endswitch
	else
		GetRandomValue \{name = randomanim
			integer
			a = 0
			b = 8}
		switch <randomanim>
			case 0
			anim = DrumDroid_LoosenUp_In
			case 1
			anim = DrumDroid_ArmsWidePoint_InOut
			case 2
			anim = DrumDroid_PeerIntoCrowd_InOut
			case 3
			anim = DrumDroid_PointAtCrowd_InOut
			case 4
			anim = DrumDroid_FistPump_InOut
			case 5
			anim = DrumDroid_ArmAtReady_In
			case 6
			anim = DrumDroid_ArmsStretch_In
			case 7
			anim = DrumDroid_LittleChairTwist_In
			case 8
			anim = DrumDroid_PointCenter_In
		endswitch
	endif
	SetSearchAllAssetContexts
	if Anim_AnimExists anim = <anim>
		Anim_GetAnimLength anim = <anim>
	else
		length = 5.0
	endif
	SetSearchAllAssetContexts \{off}
	length = (<length> - <BlendDuration>)
	if (<length> < 0)
		length = 0
	endif
	if (<BlendDuration> < 0.0)
		BlendDuration = 0.0
	endif
	Anim_Command target = DB_Drum_Loop_Anim_Tempo Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <BlendDuration>
		Tree = $Drum_Loop_Anim_NoTempo
		params = {
			start = <start>
			Loop_Tempo_Anim = <anim>
			Loop_Anim_Body = <anim>
		}
	}
	BlendDuration = 0.6
	wait <length> seconds
	Last_Hit = false
	repeat
	currentset = 0
	objID = musician1
	randomanim = 0
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
	Current_Tempo = $Current_Tempo
	if (<Current_Tempo> < 85.0)
		Set = a
	elseif (<Current_Tempo> > 115.0)
		Set = c
	else
		Set = b
	endif
	GetRandomValue \{name = randomanim
		integer
		a = 0
		b = 1}
	if (<oldset> != <Set>)
		if (<Set> = a)
			Loop_Body = Drum_Loop_HighEnergy_075
			oldset = a
		elseif (<Set> = b)
			Loop_Body = Drum_Loop_HighEnergy_100
			oldset = b
		elseif (<Set> = c)
			Loop_Body = Drum_Loop_HighEnergy_120
			oldset = c
		endif
		if (<BlendDuration> < 0.0)
			BlendDuration = 0.0
		endif
		Anim_Command target = DB_Drum_Loop_Anim_Tempo Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <BlendDuration>
			blendcurve = <smooth_transit_curve>
			Tree = $Drum_Loop_Anim_Tempo
			params = {
				start = <start>
				Loop_Tempo_Anim = <Loop_Body>
				Loop_Anim_Body = <Loop_Body>
			}
		}
	endif
	wait <blend_duration> seconds
	BlendDuration = 0.6
	begin
	if (<Current_Tempo> = $Current_Tempo)
		wait \{1
			gameframe}
	else
		break
	endif
	repeat
	repeat
	objID = musician1
	blend_duration = 0.0
endscript

script Drummer_Current_Tempo 
	tempo_change_threshold = 10.0
	begin
	floatvalue = 0.0
	GetPlayerFloat \{player = 1
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
	tempodiff = (<tempo_bpm> - $Current_Tempo)
	if (<tempodiff> < 0.0)
		tempodiff = (<tempodiff> * (0.0 -1.0))
	endif
	if (<tempodiff> > <tempo_change_threshold>)
		Change Current_Tempo = <tempo_bpm>
		wait \{2
			seconds}
	endif
	wait \{1
		gameframe}
	repeat
	current_song_beat_time = 0
endscript

script Set_drummer_Active_Values 
	Obj_GetID
	<objID> :AnimPreview_SetSourceValues {
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
	objID = musician0
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

script hit_drumkit_piece \{strength = 0.0}
	BlendDuration = 0.25
	if (<pieces_hit> = 2)
		Anim_Command \{target = DB_Drum_HH
			Command = DegenerateBlend_AddBranch
			params = {
				BlendDuration = 0.2
				Tree = $GH_Drum_HH_Branch
				params = {
					strength = 1.0
				}
			}}
	elseif (<pieces_hit> = 3)
		Anim_Command target = DB_Drum_Cymbal_1 Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <BlendDuration>
			Tree = $GH_Drum_Cymbal_1_Branch
			params = {
				strength = <strength>
			}
		}
	elseif (<pieces_hit> = 6)
		Anim_Command target = DB_Drum_Cymbal_2 Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <BlendDuration>
			Tree = $GH_Drum_Cymbal_2_Branch
			params = {
				strength = <strength>
			}
		}
	elseif (<pieces_hit> = 8)
		Anim_Command target = DB_Drum_Cymbal_3 Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <BlendDuration>
			Tree = $GH_Drum_Cymbal_3_Branch
			params = {
				strength = <strength>
				anim = Random (@ GH_Drum_Cymbal_3_1 @ GH_Drum_Cymbal_3_2 @ GH_Drum_Cymbal_3_3 )
			}
		}
	endif
endscript

script Default_Kit_anims 
	<name> :Anim_Command target = DB_Drum_Cymbal_1 Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $GH_Drum_Cymbal_1_Branch
		params = {
			strength = 0.0
		}
	}
	<name> :Anim_Command target = DB_Drum_Cymbal_2 Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $GH_Drum_Cymbal_2_Branch
		params = {
			strength = 0.0
		}
	}
	<name> :Anim_Command target = DB_Drum_Cymbal_3 Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $GH_Drum_Cymbal_3_Branch
		params = {
			strength = 0.0
			anim = GH_Drum_Cymbal_3_1
		}
	}
	<name> :Anim_Command target = DB_Drum_HH Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $GH_Drum_HH_Branch
		params = {
			strength = 0.0
		}
	}
endscript

script default_drummer_state 
	smooth_transit_curve = [1.0 , 0.9927499 , 0.97199994 , 0.93924993 , 0.89599997 , 0.84375006 , 0.784 , 0.71825 , 0.64800006 , 0.57475 , 0.5 , 0.42525002 , 0.35200003 , 0.28175 , 0.216 , 0.15625 , 0.104 , 0.0607499 , 0.027999999 , 0.00725001 , 0.0]
	switch <currentset>
		case 1
		TargetIK1 = DB_Drum_BaseIK_Anim_Old1
		targetIK2 = DB_Drum_BaseIK_Anim_New1
		Target1 = DB_Drum_Base_Anim_Old1
		target2 = DB_Drum_Base_Anim_New1
		case 2
		TargetIK1 = DB_Drum_BaseIK_Anim_Old2
		targetIK2 = DB_Drum_BaseIK_Anim_New2
		Target1 = DB_Drum_Base_Anim_Old2
		target2 = DB_Drum_Base_Anim_New2
		case 3
		TargetIK1 = DB_Drum_BaseIK_Anim_Old3
		targetIK2 = DB_Drum_BaseIK_Anim_New3
		Target1 = DB_Drum_Base_Anim_Old3
		target2 = DB_Drum_Base_Anim_New3
		case 4
		TargetIK1 = DB_Drum_BaseIK_Anim_Old4
		targetIK2 = DB_Drum_BaseIK_Anim_New4
		Target1 = DB_Drum_Base_Anim_Old4
		target2 = DB_Drum_Base_Anim_New4
	endswitch
	Anim_Command target = DB_Drum_SHit_R_Anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		Tree = $Single_Source_Anim_Event_tree
		params = {
			Use_Anim = Drum_S1T3_SHit_R
		}
	}
	Anim_Command target = DB_Drum_MHit_R_Anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		Tree = $Single_Source_Anim_Event_tree
		params = {
			Use_Anim = Drum_S1T3_MHit_R
		}
	}
	Anim_Command target = DB_Drum_QHit_R_Anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		Tree = $Single_Source_Anim_Event_tree
		params = {
			Use_Anim = Drum_S1T3_QHit_R
		}
	}
	Anim_Command target = DB_Drum_SHit_L_Anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		Tree = $Single_Source_Anim_Event_tree
		params = {
			Use_Anim = Drum_S1T3_SHit_L
		}
	}
	Anim_Command target = DB_Drum_MHit_L_Anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		Tree = $Single_Source_Anim_Event_tree
		params = {
			Use_Anim = Drum_S1T3_MHit_L
		}
	}
	Anim_Command target = DB_Drum_QHit_L_Anim Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <time_to_trans>
		blendcurve = <smooth_transit_curve>
		Tree = $Single_Source_Anim_Event_tree
		params = {
			Use_Anim = Drum_S1T3_QHit_L
		}
	}
	if Anim_AnimNodeExists id = <Target1>
		Anim_Command target = <Target1> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_tree
			params = {
				Use_Anim = Drum_S1T3
			}
		}
	endif
	if Anim_AnimNodeExists id = <target2>
		Anim_Command target = <target2> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_tree
			params = {
				Use_Anim = Drum_S1T3
			}
		}
	endif
	if Anim_AnimNodeExists id = <TargetIK1>
		Anim_Command target = <TargetIK1> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_tree
			params = {
				Use_Anim = Drum_S1T3_IK
			}
		}
	endif
	if Anim_AnimNodeExists id = <targetIK2>
		Anim_Command target = <targetIK2> Command = DegenerateBlend_AddBranch params = {
			BlendDuration = <time_to_trans>
			blendcurve = <smooth_transit_curve>
			Tree = $Single_Source_tree
			params = {
				Use_Anim = Drum_S1T3_IK
			}
		}
	endif
	currentset = 0
	time_to_trans = 0.0
endscript
