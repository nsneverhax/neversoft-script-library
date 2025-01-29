musician1_info = {
	anim_set = judy_animations
	facial_anims = None
	facial_anims_default = None
	stance = Stance_FrontEnd
	finger_anims = guitarist_finger_anims_large
	lefty_chords = false
	large_chords = false
	fret_anims = fret_anims_rocker
	Strum = Normal
	guitar_model = None
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = false
	last_strum_length = short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = Stance_FrontEnd
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = None
	allow_movement = true
	target_node = None
	facial_anim = Idle
	scale = 1.0
	playing = true
	part = guitar
	position = Vocalist
	anim_struct = None
	win_anim_name = None
	lose_anim_name = None
	intro_anim_name = None
	playing_special_anim = false
}
musician2_info = {
	anim_set = judy_animations
	facial_anims = None
	facial_anims_default = None
	stance = Stance_FrontEnd
	finger_anims = guitarist_finger_anims_large
	lefty_chords = false
	large_chords = false
	fret_anims = fret_anims_rocker
	Strum = Normal
	guitar_model = None
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = false
	last_strum_length = short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = Stance_FrontEnd
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = None
	allow_movement = true
	target_node = None
	facial_anim = Idle
	scale = 1.0
	playing = true
	part = guitar
	position = Drummer
	anim_struct = None
	win_anim_name = None
	lose_anim_name = None
	intro_anim_name = None
	playing_special_anim = false
}
musician3_info = {
	anim_set = judy_animations
	facial_anims = None
	facial_anims_default = None
	stance = Stance_FrontEnd
	finger_anims = guitarist_finger_anims_large
	lefty_chords = false
	large_chords = false
	fret_anims = fret_anims_rocker
	Strum = Normal
	guitar_model = None
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = false
	last_strum_length = short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = Stance_FrontEnd
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = None
	allow_movement = true
	target_node = None
	facial_anim = Idle
	scale = 1.0
	playing = true
	part = guitar
	position = Guitarist
	anim_struct = None
	win_anim_name = None
	lose_anim_name = None
	intro_anim_name = None
	playing_special_anim = false
}
musician4_info = {
	anim_set = judy_animations
	facial_anims = None
	facial_anims_default = None
	stance = Stance_FrontEnd
	finger_anims = guitarist_finger_anims_large
	lefty_chords = false
	large_chords = false
	fret_anims = fret_anims_rocker
	Strum = Normal
	guitar_model = None
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = false
	last_strum_length = short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = Stance_FrontEnd
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = None
	allow_movement = true
	target_node = None
	facial_anim = Idle
	scale = 1.0
	playing = true
	part = guitar
	position = Bassist
	anim_struct = None
	win_anim_name = None
	lose_anim_name = None
	intro_anim_name = None
	playing_special_anim = false
}

script create_band \{async = 0}
	persistent_band_prepare_for_song async = <async>
	return \{true}
endscript

script set_guitar_string_properties 
	RequireParams \{[
			appearance
			info_struct
			name
		]
		all}
	if get_part_key_from_appearance key = guitar_string_start appearance = <appearance> part = CAS_Guitar_Bridges
		printf channel = AnimInfo qs(0xa5e6723d) a = <name>
		Change structurename = <info_struct> string_start_properties = <guitar_string_start>
	else
		printf channel = AnimInfo qs(0x95a4b190) a = <name>
		Change structurename = <info_struct> string_start_properties = default_guitar_string_start_properties
	endif
	if get_part_key_from_appearance key = guitar_string_end appearance = <appearance> part = CAS_Guitar_Bridges
		printf channel = AnimInfo qs(0xa4714cd4) a = <name>
		Change structurename = <info_struct> string_end_properties = <guitar_string_end>
	else
		printf channel = AnimInfo qs(0x1f376d79) a = <name>
		Change structurename = <info_struct> string_end_properties = default_guitar_string_end_properties
	endif
endscript

script set_bass_string_properties 
	RequireParams \{[
			appearance
			info_struct
			name
		]
		all}
	if get_part_key_from_appearance key = bass_string_start appearance = <appearance> part = CAS_bass_Bridges
		printf channel = AnimInfo qs(0x8b6be807) a = <name>
		Change structurename = <info_struct> string_start_properties = <bass_string_start>
	else
		printf channel = AnimInfo qs(0x0970b810) a = <name>
		Change structurename = <info_struct> string_start_properties = default_bass_string_start_properties
	endif
	if get_part_key_from_appearance key = bass_string_end appearance = <appearance> part = CAS_bass_Bridges
		printf channel = AnimInfo qs(0x26832880) a = <name>
		Change structurename = <info_struct> string_end_properties = <bass_string_end>
	else
		printf channel = AnimInfo qs(0x7e4aa083) a = <name>
		Change structurename = <info_struct> string_end_properties = default_bass_string_end_properties
	endif
endscript
testing_strings = false

script test_guitar_strings 
	Change \{testing_strings = true}
	BandManager_SetPart \{name = musician1
		part = guitar}
	BandManager_CreateStrings \{name = musician1}
endscript

script test_bass_strings 
	Change \{testing_strings = true}
	BandManager_SetPart \{name = musician1
		part = bass}
	BandManager_CreateStrings \{name = musician1}
endscript

script band_member_start_anims \{async = 0}
	RequireParams \{[
			name
			instrument
		]
		all}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	ExtendCrc <name> '_Info' out = info_struct
	setup_character_anims {
		info_struct = <info_struct>
		name = <name>
		instrument = <instrument>
		loading_into_song = <loading_into_song>
	}
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	switch (<instrument>)
		case guitar
		case guitar_and_vocals
		guitarist_start_anims name = <name> info_struct = <info_struct>
		case bass
		bassist_start_anims name = <name> info_struct = <info_struct>
		case Drum
		drummer_start_anims name = <name> info_struct = <info_struct>
		case vocals
		vocalist_start_anims name = <name> info_struct = <info_struct>
		case None
		no_instrument_start_anims name = <name> info_struct = <info_struct>
		default
		ScriptAssert 'unknown instrument %i' i = <instrument>
	endswitch
	if (<instrument> != Drum)
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		stance = ($<info_struct>.stance)
		if ($is_in_cas = 1)
			if ($is_in_gender_select = 1 || $is_in_genre_select = 1)
				stance = Stance_Old
			else
				stance = Stance_FrontEnd
			endif
		endif
		bandmanager_changestance name = <name> stance = <stance> no_wait
		Band_SetIKChain name = <name> Chain = slave
	endif
	<name> :Obj_SpawnScriptNow facial_anim_loop
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	<name> :Obj_ForceUpdate
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	<name> :Ragdoll_MarkForReset
endscript

script no_instrument_start_anims 
	BandManager_AddGuitarist name = <name>
endscript

script guitarist_start_anims 
	finger_anims = ($<info_struct>.finger_anims)
	fret_anims = ($<info_struct>.fret_anims)
	strum_type = ($<info_struct>.Strum)
	ExtendCrc <strum_type> '_Strums' out = strum_anims
	<name> :GetSingleTag lefty
	if (<lefty> = 1)
		Change structurename = <info_struct> fret_anims = fret_anims_rocker_lefty
	endif
	<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
	<name> :hero_play_fret_anim anim = ($<fret_anims>.track_119)
	<name> :SetTags LastBasePose = 'Strum_String_1'
	<name> :SetTags LastType = null
	<name> :SetTags LastNoteValue = 0
	<name> :GetSingleTag is_female
	<name> :GetSingleTag large_hands
	if (<is_female> = 1)
		gender = 'GH_Female'
	elseif (<large_hands> = 1)
		gender = 'GH_Large'
	else
		gender = 'GH_Male'
	endif
	strumtype = 'G'
	if (<lefty> = 1)
		gender = 'GH_Male'
		strumtype = 'GL'
	endif
	Initialize_Strum_anims strumtype = <strumtype> gender = <gender> name = <name>
	<name> :Obj_KillSpawnedScript name = PrepareBandMemberForRenderUpdateLoop
	<name> :Obj_SpawnScriptNow PrepareBandMemberForRenderUpdateLoop
	BandManager_AddGuitarist name = <name>
endscript

script bassist_start_anims 
	finger_anims = ($<info_struct>.finger_anims)
	fret_anims = ($<info_struct>.fret_anims)
	strum_type = ($<info_struct>.Strum)
	ExtendCrc <strum_type> '_Strums' out = strum_anims
	<name> :GetSingleTag lefty
	if (<lefty> = 1)
		Change structurename = <info_struct> fret_anims = fret_anims_rocker_lefty
	endif
	<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
	<name> :hero_play_fret_anim anim = ($<fret_anims>.track_96)
	<name> :SetTags LastBasePose = 'Strum_String_1'
	<name> :SetTags LastType = null
	<name> :SetTags LastNoteValue = 0
	<name> :GetSingleTag is_female
	<name> :GetSingleTag large_hands
	if (<is_female> = 1)
		gender = 'GH_Female'
	elseif (<large_hands> = 1)
		gender = 'GH_Large'
	else
		gender = 'GH_Male'
	endif
	strumtype = 'B'
	if (<lefty> = 1)
		gender = 'GH_Male'
		strumtype = 'GL'
	endif
	Initialize_Strum_anims strumtype = <strumtype> gender = <gender> name = <name>
	<name> :Obj_KillSpawnedScript name = PrepareBandMemberForRenderUpdateLoop
	<name> :Obj_SpawnScriptNow PrepareBandMemberForRenderUpdateLoop
	BandManager_AddBassist name = <name>
endscript

script Initialize_Strum_anims 
	GetRandomFloat \{a = 0.0
		b = 1.0}
	startanim = <random_float>
	FormatText checksumname = Baseanim '%a_%b_Strum_Base' a = <gender> b = <strumtype>
	FormatText checksumname = BaseanimHigh '%a_%b_Strum_Base_High' a = <gender> b = <strumtype>
	FormatText checksumname = BaseanimMid '%a_%b_Strum_Base_Mid' a = <gender> b = <strumtype>
	FormatText checksumname = BaseanimLow '%a_%b_Strum_Base_Low' a = <gender> b = <strumtype>
	FormatText checksumname = IdleBase '%a_%b_Strum_String_1' a = <gender> b = <strumtype>
	FormatText checksumname = Idleanim '%a_%b_Strum_Idle_Rest' a = <gender> b = <strumtype>
	<name> :Anim_Command target = Dynamic_Strum_Base Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $Dynamic_Strum_Source
		params = {
			anim = <Baseanim>
		}
	}
	<name> :Anim_Command target = Dynamic_Strum_Roll_High Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $Dynamic_Strum_Source
		params = {
			anim = <BaseanimHigh>
		}
	}
	<name> :Anim_Command target = Dynamic_Strum_Roll_Mid Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $Dynamic_Strum_Source
		params = {
			anim = <BaseanimMid>
		}
	}
	<name> :Anim_Command target = Dynamic_Strum_Roll_Low Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $Dynamic_Strum_Source
		params = {
			anim = <BaseanimLow>}
	}
	<name> :Anim_Command target = Dynamic_strums Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blend>
		blendcurve = $Idle_Blend_curve
		Tree = $Dynamic_Strum_Idle_Branch
		params = {
			startanim = <startanim>
			Baseanim = <IdleBase>
			Strumanim = <Idleanim>
		}
	}
endscript

script vocalist_start_anims 
	BandManager_AddVocalist name = <name>
endscript
use_drummer_events = 0

script drummer_start_anims 
	if ($DrumTest = 1)
		Drummer_Reset_Globals
		<name> :AnimInfo_GetAllActiveValueSources
		AV_Drum_Anim_Hand_L = $Drum_Idlepoint_Arm_SHit
		AV_Drum_Anim_Hand_R = $Drum_Idlepoint_Arm_SHit
		AV_Drum_Anim_Foot_R = $Drum_Idlepoint_Foot_Hit
		AV_Drum_Blend_Hand_L = 1.0
		AV_Drum_Blend_Hand_R = 1.0
		AV_Drum_Blend_Foot_R = 1.0
		AV_Drum_Mod_Loop_Body = 1.0
		AV_Drum_Mod_Hand_R = 1.0
		AV_Drum_Mod_Hand_L = 1.0
		AV_Drum_Mod_Foot_R = 1.0
		AV_Drum_IK_Hand_L = 0.0
		AV_Drum_IK_Hand_R = 0.0
		<AV_Drum_IK_Feet> = 1.0
		<AV_Drum_Blend_HH_Kit> = 1.0
		<name> :AnimPreview_SetSourceValues <...>
		<name> :SetTags Idle = true
		<name> :SetTags tap = true
		<name> :Obj_SpawnScriptNow drummer_transit_base_long params = {
			node = Body
			Drum_Old_Long_String = 'S1T3'
			Drum_New_Long_String = 'S1T3'
			time_to_trans_Base = 0.0
			time_to_trans = 0.0
			currentset = 1
		}
		<name> :Obj_SpawnScriptNow drummer_transit_base_long params = {
			node = IK
			Drum_Old_Long_String = 'S1T3'
			Drum_New_Long_String = 'S1T3'
			time_to_trans_Base = 0.0
			time_to_trans = 0.0
			currentset = 1
		}
		<name> :Obj_SpawnScriptNow default_drummer_state params = {time_to_trans = 0.0 currentset = 1}
		<name> :Obj_SpawnScriptNow drummer_transit_idles params = {state = in tapin = true currentset = 1 Last_Hit = false}
		Default_Kit_anims name = <name>
	endif
	BandManager_AddDrummer name = <name>
endscript

script initial_drummer_anim 
	if is_current_song_a_jam_session
		hero_play_anim \{anim = Drum_Andy_StandardLP_HS_100_01
			Cycle}
	else
		hero_play_anim \{anim = Drum_Andy_StandardLP_NoTempo
			Cycle}
	endif
endscript

script should_display_debug_info 
	Obj_GetID
	display_info = false
	switch (<objID>)
		case Guitarist
		if ($display_guitarist_anim_info = true)
			display_info = true
		endif
		case Bassist
		if ($display_bassist_anim_info = true)
			display_info = true
		endif
		case Vocalist
		if ($display_vocalist_anim_info = true)
			display_info = true
		endif
		case Drummer
		if ($display_drummer_anim_info = true)
			display_info = true
		endif
	endswitch
	return <display_info>
endscript

script crowd_play_adjusting_random_anims \{anim = Idle
		blend_time = 0.2
		startwithnoblend = 0
		playonce = false}
	Obj_GetID
	old_speed = undefined
	previous_anim_name = no_anim
	begin
	hero_get_skill_level_cfunc
	get_anim_speed_for_tempo_cfunc
	if GotParam \{anim_set}
		Anims = ($<anim_set>.<anim>.<skill>.<anim_speed>)
	else
		Anims = ($crowd_animations.<anim>.<skill>.<anim_speed>)
	endif
	GetArraySize <Anims>
	GetRandomValue name = newIndex integer a = 0 b = (<array_size> - 1)
	anim_name = (<Anims> [<newIndex>])
	if (<startwithnoblend> = 1)
		blend_time = 0.0
		startwithnoblend = 0
	elseif (<anim_speed> != <old_speed>)
		blend_time = $Crowd_BlendTime_TempoChange
	elseif (<skill> = bad)
		blend_time = $Crowd_BlendTime_Bad
	elseif (<anim> = special)
		blend_time = $Crowd_BlendTime_Special
	elseif (<anim_speed> = slow)
		blend_time = $Crowd_BlendTime_Slow
	elseif (<anim_speed> = med)
		blend_time = $Crowd_BlendTime_Med
	elseif (<anim_speed> = FAST)
		blend_time = $Crowd_BlendTime_Fast
	else
		blend_time = -1.0
	endif
	if ($display_crowd_anim_info = true)
		printf channel = Crowd qs(0x0a0eb2da) a = <objID> b = <anim> c = <anim_name> d = <blend_time>
	endif
	if NOT (<anim_name> = <previous_anim_name>)
		GameObj_PlayAnim anim = <anim_name> BlendDuration = <blend_time> TimerType = tempoCycle AnimEvents = on
		previous_anim_name = <anim_name>
	else
		Anim_Command \{target = BodyTimer
			Command = Timer_ResetAnimCompleteFlag}
	endif
	GameObj_WaitAnimFinished
	if (<playonce> = true)
		anim = Idle
	endif
	old_speed = <anim_speed>
	repeat
endscript

script setup_character_anims 
	RequireParams \{[
			instrument
			name
			info_struct
		]
		all}
	printf 'setup_character_anims : %n %s' n = <name> s = <instrument>
	anim_struct = ($<info_struct>.anim_struct)
	if (<instrument> = None)
		instrument = guitar
	endif
	if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		if NOT GotParam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> member = FrontEnd
			if NOT StructureContains structure = <anim_struct_member> finger_anims
				use_default_finger_fret_strum = 1
			endif
		endif
		if StructureContains structure = <anim_struct_member> anim_set
			printf 'Using anim_set : %s' s = (<anim_struct_member>.anim_set) DoNotResolve
			Change structurename = <info_struct> anim_set = (<anim_struct_member>.anim_set)
			if ((<instrument> = guitar) || (<instrument> = bass))
				if GotParam \{use_default_finger_fret_strum}
					Change structurename = <info_struct> finger_anims = guitarist_finger_anims_car_female
					Change structurename = <info_struct> fret_anims = fret_anims_rocker
					Change structurename = <info_struct> Strum = CAR_Female_Normal
				else
					Change structurename = <info_struct> finger_anims = (<anim_struct_member>.finger_anims)
					Change structurename = <info_struct> fret_anims = (<anim_struct_member>.fret_anims)
					Change structurename = <info_struct> Strum = (<anim_struct_member>.strum_anims)
				endif
			endif
		else
			printf 'Anim_set not found for %s' s = <name>
			Change structurename = <info_struct> anim_set = car_female_animations
		endif
		if StructureContains structure = <anim_struct_member> facial_anims
			printf channel = AnimInfo qs(0x01e34256) s = <name>
			Change structurename = <info_struct> facial_anims = (<anim_struct_member>.facial_anims)
			Change structurename = <info_struct> facial_anims_default = (<anim_struct_member>.facial_anims)
		else
			printf channel = AnimInfo qs(0x578cc9b0) s = <name>
			Change structurename = <info_struct> facial_anims = None
			Change structurename = <info_struct> facial_anims_default = None
			printstruct <anim_struct_member>
		endif
	endif
	Change structurename = <info_struct> allow_movement = true
	Change structurename = <info_struct> arms_disabled = 0
	Change structurename = <info_struct> disable_arms = 0
	Change structurename = <info_struct> playing_special_anim = false
	Change structurename = <info_struct> next_stance = ($<info_struct>.stance)
endscript

script get_start_node_id \{character = qs(0x5c2c7d0c)}
	GetStartNodeID member = <member>
	return waypoint_id = <waypoint_id> waypoint_name = <waypoint_name>
endscript

script get_skill_level 
	GetFirstPlayer
	GetPlayerInfo <player> current_health out = health
	skill = Normal
	if (<health> < 0.66)
		skill = bad
	elseif (<health> > 1.3299999)
		skill = good
	endif
	return skill = <skill>
endscript

script get_target_node 
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	return target_node = ($<info_struct>.target_node)
endscript

script play_special_facial_anim 
	if NOT GotParam \{anim}
		return
	endif
	Obj_KillSpawnedScript \{name = facial_anim_loop}
	Obj_GetID
	if (<objID> = Guitarist)
		printf \{channel = AnimInfo
			qs(0x95f334b8)}
	endif
	hero_play_facial_anim anim = <anim>
	hero_wait_until_anim_finished \{timer = FacialTimer}
	if (<objID> = Guitarist)
		printf \{channel = AnimInfo
			qs(0x07754075)}
	endif
	Obj_SpawnScriptNow \{facial_anim_loop}
endscript

script facial_anim_loop \{blend_duration = 0}
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	facial_anims = ($<info_struct>.facial_anims)
	if (<facial_anims> = None)
		printf channel = AnimInfo qs(0x86d9843c) a = <objID>
		return
	endif
	if NOT GlobalExists name = <facial_anims> type = structure
		printf \{channel = AnimInfo
			qs(0x989b10a0)}
		return
	endif
	if NOT StructureContains structure = $<facial_anims> name = Idle
		return
	endif
	begin
	anim = ($<info_struct>.facial_anim)
	if NOT StructureContains structure = $<facial_anims> name = <anim>
		if ($display_facial_anim_info = true)
			printf channel = AnimInfo qs(0x88ae47d6) a = <anim>
		endif
		anim = Idle
	endif
	Anims = ($<facial_anims>.<anim>)
	GetArraySize <Anims>
	GetRandomValue name = index integer a = 0 b = (<array_size> - 1)
	anim_name = (<Anims> [<index>])
	if ($display_facial_anim_info = true)
		printf channel = AnimInfo qs(0xab9f8ab8) a = <anim> b = <anim_name> c = <objID>
	endif
	Change structurename = <info_struct> facial_anim = Idle
	hero_play_facial_anim anim = <anim_name> BlendDuration = <blend_duration>
	blend_duration = 0
	hero_wait_until_anim_finished \{timer = FacialTimer}
	wait \{1
		gameframe}
	repeat
endscript

script guitarist_idle_animpreview 
	ClearEventHandlerGroup \{hand_events}
endscript
band_character_names = [
	musician1
	musician2
	musician3
	musician4
]

script play_intro_anims 
	Band_RestartIdles
	printf \{channel = Pop
		qs(0xcebd4098)}
	ForEachIn \{$band_character_names
		do = play_intro_anims_foreach}
	wait \{1
		gameframe}
	BandManager_SetPlayingIntroAnims
endscript

script play_intro_anims_foreach 
	if CompositeObjectExists name = <checksum>
		if NOT BandManager_IsPlayingSimpleAnim name = <checksum>
			ExtendCrc <checksum> '_Info' out = info_struct
			part = ($<info_struct>.part)
			position = ($<info_struct>.position)
			if (<part> = Drum)
				if ($current_band != Band_NoDoubt_DontSpeak &&
						$current_band != Band_NoDoubt_JustAGirl)
					return
				endif
			endif
			start = 0.0
			if (<position> = Vocalist)
				if using_singing_guitarist
					start = 0.5
				endif
			endif
			intro_anim = ($<info_struct>.intro_anim_name)
			if (<intro_anim> != None)
				printf channel = marc qs(0x4817379c) a = <intro_anim> b = <checksum>
				Band_PlaySimpleAnim {name = <checksum> anim = <intro_anim> BlendDuration = 0.3 start = <start>}
				if (<part> = guitar || <part> = bass)
					taylor_hack = 0
					if (<intro_anim> = g_Taylor_win_waving)
						taylor_hack = 1
					endif
					<checksum> :GetTags lefty
					if (<lefty> = 1 || <taylor_hack> = 1)
						Band_SetIKChain name = <checksum> Chain = slave
					else
						Band_SetIKChain name = <checksum> Chain = guitar
					endif
				else
					Band_SetIKChain name = <checksum> Chain = slave
				endif
				BandManager_StopFacialAnims name = <checksum>
			endif
		else
			printf \{channel = marc
				qs(0xff9a890c)}
		endif
	endif
endscript

script play_win_anims 
	printf \{channel = Band
		qs(0xd0b94ba9)}
	killspawnedscript \{name = return_characters_to_idle_at_song_time}
	GetArraySize \{$band_character_names}
	i = 0
	begin
	name = ($band_character_names [<i>])
	spawnscriptnow play_win_anims_foreach params = {checksum = <name>}
	i = (<i> + 1)
	repeat <array_size>
	return
endscript

script play_win_anims_foreach 
	if GotParam \{checksum}
		if CompositeObjectExists name = <checksum>
			ExtendCrc <checksum> '_Info' out = info_struct
			wait_for_next_even_frame
			wait \{1
				gameframe}
			Band_ChangeFacialAnims name = <checksum>
			win_anim = ($<info_struct>.win_anim_name)
			if (<win_anim> != None)
				Band_SetIKChain name = <checksum> Chain = slave
				Band_PlaySimpleAnim {name = <checksum> anim = <win_anim> BlendDuration = 0.3}
				printf channel = marc 'Playing %a on %b' a = <win_anim> b = <checksum> DoNotResolve
			else
				printf channel = marc qs(0x553d6959) a = <checksum>
			endif
			wait \{1
				gameframe}
			Band_MoveToStartNode name = <checksum> allow_in_2player = true
		else
		endif
	endif
endscript

script play_lose_anims 
	printf \{channel = Band
		qs(0xfd1cde30)}
	Band_ShowMic_Stand \{name = Vocalist}
	killspawnedscript \{name = return_characters_to_idle_at_song_time}
	GetArraySize \{$band_character_names}
	i = 0
	begin
	name = ($band_character_names [<i>])
	spawnscriptnow play_lose_anims_foreach params = {checksum = <name>}
	i = (<i> + 1)
	repeat <array_size>
	return
endscript

script play_lose_anims_foreach 
	if GotParam \{checksum}
		if CompositeObjectExists name = <checksum>
			ExtendCrc <checksum> '_Info' out = info_struct
			wait_for_next_even_frame
			wait \{1
				gameframe}
			Band_ChangeFacialAnims name = <checksum>
			lose_anim = ($<info_struct>.lose_anim_name)
			if (<lose_anim> != None)
				Band_SetIKChain name = <checksum> Chain = slave
				Band_PlaySimpleAnim {name = <checksum> anim = <lose_anim> BlendDuration = 0.3}
				printf channel = AnimInfo 'Playing %a on %b' a = <lose_anim> b = <checksum> DoNotResolve
			else
				printf channel = AnimInfo qs(0x283913b7) a = <checksum>
			endif
			wait \{1
				gameframe}
			Band_MoveToStartNode name = <checksum> allow_in_2player = true
		endif
	endif
endscript
g_song_outro_anims_current_player = 1
g_song_outro_anims_initial_speed = 1.0

script play_song_outro_anims 
	SetPakManCurrent \{map = ui_paks
		pakname = 'song_breakdown'}
	Change \{g_song_outro_anims_initial_speed = 1.0}
	Change \{g_song_outro_anims_current_player = 1}
	used_anim_camera_pairs = []
	CreateScreenElement \{parent = root_window
		id = song_outro_anims_container
		type = ContainerElement
		alpha = 1
		pos_anchor = [
			left
			top
		]
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		z_priority = 400
		dims = (100.0, 100.0)}
	start_skip_id = <id>
	if NOT InInternetMode
		<start_skip_id> :SE_SetProps {
			event_handlers = [
				{pad_start song_outro_anims_skip_anims params = {start_skip_id = <start_skip_id>}}
			]
		}
		LaunchEvent type = focus target = <start_skip_id>
		add_user_control_helper \{text = qs(0x784c64ff)
			button = start
			z = 100000}
	endif
	song_outro_determine_camera_cut_order
	GetArraySize <order>
	GetNumPlayersInGame \{on_screen}
	order_idx = 0
	begin
	GetPlayerInfo (<order> [<order_idx>].player_num) part
	begin
	song_outro_get_random_animation_for_part part = <part>
	if NOT ((GotParam anim) || (GotParam anim_index))
		ScriptAssert \{qs(0x4ecdbc6c)}
	endif
	song_outro_get_random_camera_for_anim part = <part> anim_index = <anim_index>
	if NOT ((GotParam cam) || (GotParam cam_index) || (GotParam cam_initial_speed))
		ScriptAssert \{qs(0x0f075f55)}
	endif
	song_outro_anims_check_if_used anim_cam_pair_array = <used_anim_camera_pairs> anim_index = <anim_index> cam_index = <cam_index> part = <part>
	if (<is_used> = 0)
		if (<part> = bass)
			<part> = guitar
		endif
		AddArrayElement array = <used_anim_camera_pairs> element = {anim = <anim_index> cam = <cam_index> part = <part>}
		<used_anim_camera_pairs> = <array>
		printstruct <anim_camera_pairs>
		break
	endif
	repeat
	GetPlayerInfo (<order> [<order_idx>].player_num) band_member
	if CompositeObjectExists name = <band_member>
		ExtendCrc <band_member> '_Info' out = info_struct
		Band_MoveToStartNode name = <band_member>
		Band_ChangeFacialAnims name = <band_member>
		if (<anim> != None)
			spawnscriptnow \{PlayCameraWinSFX}
			BandManager_ChangeIK name = <band_member> enabled = false
			Band_PlaySimpleAnim {name = <band_member> anim = <anim> BlendDuration = 0.3}
			<band_member> :Ragdoll_MarkForReset
			GetStartNodeID member = <band_member>
			GetWaypointPos name = <waypoint_id>
			GetWaypointDir name = <waypoint_id>
			moment_cam_lock_target_01 :Obj_SetPosition position = <Pos>
			moment_cam_lock_target_01 :Obj_SetOrientation Dir = <Dir>
			Change g_song_outro_anims_current_player = (<order> [<order_idx>].player_num)
			chain_part = slave
			Band_SetIKChain name = <band_member> Chain = <chain_part>
			Change g_song_outro_anims_initial_speed = <cam_initial_speed>
			setslomo <cam_initial_speed>
			SpawnScript \{SongWon_FX}
			MomentCamera_PlayAnim_Spawned name = moment_cam_lock_target_01 anim = <cam> TempoAnim = <cam> Cycle = 0 start = 0 BlendDuration = 0
		endif
	endif
	<order_idx> = (<order_idx> + 1)
	repeat <array_size>
	killspawnedscript \{name = reset_ragdoll_hack_for_playday}
	song_outro_anims_skip_anims start_skip_id = <start_skip_id>
endscript

script reset_ragdoll_hack_for_playday 
	begin
	if CompositeObjectExists \{name = musician1}
		musician1 :Ragdoll_MarkForReset
	endif
	if CompositeObjectExists \{name = musician2}
		musician2 :Ragdoll_MarkForReset
	endif
	if CompositeObjectExists \{name = musician3}
		musician3 :Ragdoll_MarkForReset
	endif
	if CompositeObjectExists \{name = musician4}
		musician4 :Ragdoll_MarkForReset
	endif
	wait \{1
		gameframe}
	repeat
endscript

script song_outro_get_random_animation_for_part 
	RequireParams \{[
			part
		]
		all}
	if (<part> = bass)
		<part> = guitar
	endif
	GetArraySize (($song_outro_anims).<part>)
	if (<array_size> > 0)
		GetRandomValue a = 0 b = (<array_size> - 1) name = i integer
		return {
			anim = ((($song_outro_anims).<part>) [<i>].anim)
			anim_index = <i>
		}
	endif
endscript

script song_outro_get_random_camera_for_anim 
	RequireParams \{[
			part
			anim_index
		]
		all}
	if (<part> = bass)
		<part> = guitar
	endif
	GetArraySize ((($song_outro_anims).<part>) [<anim_index>].Cameras)
	if (<array_size> > 0)
		GetRandomValue a = 0 b = (<array_size> - 1) name = i integer
		return {
			cam = ((((($song_outro_anims).<part>) [<anim_index>].Cameras) [<i>]).Camera)
			cam_initial_speed = ((((($song_outro_anims).<part>) [<anim_index>].Cameras) [<i>]).initial_speed)
			cam_index = <i>
		}
	endif
endscript

script song_outro_anims_check_if_used 
	RequireParams \{[
			anim_cam_pair_array
			anim_index
			cam_index
			part
		]}
	GetArraySize <anim_cam_pair_array>
	if (<part> = bass)
		<part> = guitar
	endif
	if (<array_size> > 0)
		i = 0
		begin
		if (<anim_cam_pair_array> [<i>].part = <part>)
			if ((<anim_cam_pair_array> [<i>].anim = <anim_index>))
				return \{is_used = 1}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{is_used = 0}
endscript

script song_outro_determine_camera_cut_order 
	GameMode_GetType
	player_order = []
	if ((<type> = career) || (<type> = quickplay))
		GetNumPlayersInGame \{on_screen}
		if (<num_players_shown> > 0)
			GetFirstPlayer \{on_screen}
			begin
			percent_notes_hit = 0
			GetPlayerInfo <player> part
			if (<part> = vocals)
				GetPlayerInfo <player> vocal_phrase_quality
				GetPlayerInfo <player> vocal_phrase_max_qual
				if (<vocal_phrase_max_qual> > 0.1)
					percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
				else
					<percent_notes_hit> = 0
				endif
				if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
					<percent_notes_hit> = 1
				endif
			else
				GetPlayerInfo <player> notes_hit
				GetPlayerInfo <player> max_notes
				if (<max_notes> > 0)
					<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
				else
					<percent_notes_hit> = 0
				endif
				if (<percent_notes_hit> = 0 && <notes_hit> > 0)
					<percent_notes_hit> = 1
				endif
			endif
			AddArrayElement {
				array = <player_order>
				element = {
					player_num = <player>
					percent_notes_hit = <percent_notes_hit>
				}
			}
			<player_order> = <array>
			GetNextPlayer on_screen player = <player>
			repeat <num_players_shown>
			GetArraySize <player_order>
			if (<array_size> > 1)
				begin
				<i> = 0
				begin
				left_accuracy = (<player_order> [<i>].percent_notes_hit)
				right_accuracy = (<player_order> [(<i> + 1)].percent_notes_hit)
				if (<right_accuracy> > <left_accuracy>)
					left_score_band_idx = (<player_order> [<i>])
					SetArrayElement arrayName = player_order index = <i> newValue = (<player_order> [(<i> + 1)])
					SetArrayElement arrayName = player_order index = (<i> + 1) newValue = <left_score_band_idx>
				endif
				<i> = (<i> + 1)
				repeat (<array_size> - 1)
				repeat <array_size>
			endif
		endif
	else
		song_breakdown_competitive_determine_order_from_score
		GetArraySize <order>
		if (<array_size> > 0)
			GetNumPlayersInGame \{on_screen}
			if (<num_players_shown> > 0)
				GetFirstPlayer \{on_screen}
				begin
				GetPlayerInfo <player> Band
				if (<Band> = (<order> [0].band_num))
					AddArrayElement {
						array = player_order
						element = {
							player_num = <player>
						}
					}
					<player_order> = <array>
				endif
				GetNextPlayer on_screen player = <player>
				repeat <num_players_shown>
			endif
		endif
	endif
	return order = <player_order>
endscript

script song_outro_anims_display_stats 
	RequireParams \{[
			parent
			stats_display_secs
			slomo_speed
		]
		all}
	killspawnedscript \{name = song_outro_anims_display_stats_spawned}
	spawnscriptnow song_outro_anims_display_stats_spawned params = {parent = <parent> stats_display_secs = <stats_display_secs> slomo_speed = <slomo_speed>}
endscript

script song_outro_anims_display_stats_spawned 
	RequireParams \{[
			parent
			stats_display_secs
			slomo_speed
		]
		all}
	player = ($g_song_outro_anims_current_player)
	ui_song_breakdown_get_player_display_name player_index = <player>
	name_text = <player_name_text>
	GetPlayerInfo <player> part
	GetPlayerInfo <player> difficulty
	percent_container_alpha = 1
	percent_stacker_pos = (0.0, 0.0)
	if NOT (<part> = vocals)
		GetPlayerInfo <player> best_run
		GetPlayerInfo <player> max_notes
		GetPlayerInfo <player> notes_hit
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		mathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		if (<percent_notes_hit> = 0 && <notes_hit> > 0)
			percent_notes_hit = 1
		endif
		FormatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit>
		FormatText TextName = streak_text qs(0x8c5c152d) n = <best_run> DecimalPlaces = 0
		FormatText \{TextName = streak_unit_text
			qs(0x6036c2d7)}
	else
		GetPlayerInfo <player> vocal_streak_phrases
		GetPlayerInfo <player> vocal_phrase_quality
		GetPlayerInfo <player> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			mathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				percent_notes_hit = 1
			endif
			FormatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit> DecimalPlaces = 0
		else
			<percent_text> = qs(0x6a5cf46c)
			<percent_container_alpha> = 0
			<percent_stacker_pos> = (25.0, 0.0)
		endif
		FormatText TextName = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> DecimalPlaces = 0
		FormatText \{TextName = streak_unit_text
			qs(0x4ac2a4de)}
	endif
	switch (<part>)
		case guitar
		icon_texture = mixer_icon_guitar
		case bass
		icon_texture = mixer_icon_bass
		case Drum
		icon_texture = mixer_icon_drums
		case vocals
		icon_texture = mixer_icon_vox
	endswitch
	switch (<difficulty>)
		case beginner
		diff_texture = icon_difficulty_beginner
		case easy
		diff_texture = icon_difficulty_easy
		case medium
		diff_texture = icon_difficulty_medium
		case hard
		diff_texture = icon_difficulty_hard
		case expert
		diff_texture = icon_difficulty_expert
		if (<part> = Drum)
			GetPlayerInfo <player> double_kick_drum
			if (<double_kick_drum> = 1)
				diff_texture = icon_difficulty_expert_plus
			endif
		endif
	endswitch
	if ScreenElementExists id = <parent>
		setslomo <slomo_speed>
		CreateScreenElement {
			parent = <parent>
			type = DescInterface
			desc = 'song_outro_anim_stats'
			pos_anchor = [left , top]
			just = [left , top]
			Pos = (-300.0, 130.0)
			alpha = 1
			character_name_text = <name_text>
			note_percentage_text = <percent_text>
			note_streak_text = <streak_text>
			streak_unit_text_text = <streak_unit_text>
			instrument_icon_texture = <icon_texture>
			difficulty_icon_texture = <diff_texture>
			percent_container_alpha = <percent_container_alpha>
			percent_stacker_pos = <percent_stacker_pos>
			z_priority = 400
		}
		<id> :SE_SetProps {
			Pos = (-10.0, -10.0)
			alpha = 1
			time = 0.2
			anim = ease_out
		}
	endif
	wait <stats_display_secs> seconds ignoreslomo
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
	setslomo ($g_song_outro_anims_initial_speed)
endscript

script song_outro_anims_skip_anims 
	killspawnedscript \{name = reset_ragdoll_hack_for_playday}
	if ScreenElementExists id = <start_skip_id>
		DestroyScreenElement id = <start_skip_id>
	endif
	clean_up_user_control_helpers
	Change \{g_song_outro_anims_initial_speed = 1.0}
	setslomo ($g_song_outro_anims_initial_speed)
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_no_band'
		length = 5
		changenow
		extra_params = {
			force_time = 5
		}
		Play_hold = 1}
	spawnscriptnow \{switch_off_cameracuts_delayed}
	restore_idle_faces
	spawnscriptnow \{id = not_transitions
		Transition_KillAll}
endscript

script switch_off_cameracuts_delayed 
	wait \{2
		gameframes}
	CameraCuts_EnableChangeCam \{enable = false}
endscript

script restore_idle_faces 
	printf \{channel = marc
		qs(0x448c7e93)}
	i = 1
	begin
	FormatText checksumname = musician 'musician%a' a = <i>
	FormatText checksumname = info_struct 'musician%a_info' a = <i>
	fa_anims = ($<info_struct>.facial_anims_default)
	Change structurename = <info_struct> facial_anims = <fa_anims>
	if CompositeObjectExists name = <musician>
		<musician> :Obj_KillSpawnedScript name = facial_anim_loop
		<musician> :Obj_SpawnScriptNow facial_anim_loop
	endif
	i = (<i> + 1)
	repeat 4
endscript

script hide_band 
	if CompositeObjectExists \{musician1}
		musician1 :hide
	endif
	if CompositeObjectExists \{musician2}
		musician2 :hide
	endif
	if CompositeObjectExists \{musician3}
		musician3 :hide
	endif
	if CompositeObjectExists \{musician4}
		musician4 :hide
	endif
endscript

script unhide_band 
	if CompositeObjectExists \{musician1}
		Band_UnHide \{name = musician1}
	endif
	if CompositeObjectExists \{musician2}
		Band_UnHide \{name = musician2}
	endif
	if CompositeObjectExists \{musician3}
		Band_UnHide \{name = musician3}
	endif
	if CompositeObjectExists \{musician4}
		Band_UnHide \{name = musician4}
	endif
endscript

script create_vocalist_dummy 
	return
endscript

script destroy_vocalist_dummy 
	if CompositeObjectExists \{vocalist_dummy}
		vocalist_dummy :Die
	endif
	if CompositeObjectExists \{vocalist_head_dummy}
		vocalist_head_dummy :Die
	endif
endscript

script create_all_camera_lock_targets 
	destroy_all_camera_lock_targets
	create_camera_lock_target \{name = moment_cam_lock_target_01
		only_anim_if_locked = false}
	create_camera_lock_target \{name = moment_cam_lock_target_02}
	create_camera_lock_target \{name = moment_cam_lock_target_03}
	create_camera_lock_target \{name = moment_cam_lock_target_04}
	create_camera_lock_target \{name = moment_cam_lock_target_05}
	create_camera_lock_target \{name = moment_cam_lock_target_06}
	create_camera_lock_target \{name = moment_cam_lock_target_07}
	create_camera_lock_target \{name = moment_cam_lock_target_08}
	create_camera_lock_target \{name = moment_cam_lock_target_09}
	create_camera_lock_target \{name = moment_cam_lock_target_10}
	create_camera_lock_target \{name = musician1_mocap_lock_target_01}
	create_camera_lock_target \{name = musician1_mocap_lock_target_02}
	create_camera_lock_target \{name = musician2_mocap_lock_target_01}
	create_camera_lock_target \{name = musician2_mocap_lock_target_02}
	create_camera_lock_target \{name = musician3_mocap_lock_target_01}
	create_camera_lock_target \{name = musician3_mocap_lock_target_02}
	create_camera_lock_target \{name = musician4_mocap_lock_target_01}
	create_camera_lock_target \{name = musician4_mocap_lock_target_02}
endscript

script create_frontend_lock_targets 
	destroy_frontend_lock_targets
	printf \{channel = AnimInfo
		qs(0xc22b676e)}
	create_camera_lock_target \{name = frontend_mocap_lock_target_01}
	create_camera_lock_target \{name = frontend_mocap_lock_target_02}
endscript

script create_camera_lock_target \{only_anim_if_locked = true}
	CreateFromStructure {
		name = <name>
		Pos = (0.0, 0.0, 0.0)
		Angles = (0.0, 1.0, 0.0)
		Class = GameObject
		type = Ghost
		CreatedAtStart
		DisableShadowCasting = false
		Profile = $Profile_Ven_Camera_Obj
		only_animate_if_locked_to_by_active_cinematic_camera = <only_anim_if_locked>
	}
endscript

script destroy_all_camera_lock_targets 
	destroy_camera_lock_target \{name = moment_cam_lock_target_01}
	destroy_camera_lock_target \{name = moment_cam_lock_target_02}
	destroy_camera_lock_target \{name = moment_cam_lock_target_03}
	destroy_camera_lock_target \{name = moment_cam_lock_target_04}
	destroy_camera_lock_target \{name = moment_cam_lock_target_05}
	destroy_camera_lock_target \{name = moment_cam_lock_target_06}
	destroy_camera_lock_target \{name = moment_cam_lock_target_07}
	destroy_camera_lock_target \{name = moment_cam_lock_target_08}
	destroy_camera_lock_target \{name = moment_cam_lock_target_09}
	destroy_camera_lock_target \{name = moment_cam_lock_target_10}
	destroy_camera_lock_target \{name = musician1_mocap_lock_target_01}
	destroy_camera_lock_target \{name = musician1_mocap_lock_target_02}
	destroy_camera_lock_target \{name = musician2_mocap_lock_target_01}
	destroy_camera_lock_target \{name = musician2_mocap_lock_target_02}
	destroy_camera_lock_target \{name = musician3_mocap_lock_target_01}
	destroy_camera_lock_target \{name = musician3_mocap_lock_target_02}
	destroy_camera_lock_target \{name = musician4_mocap_lock_target_01}
	destroy_camera_lock_target \{name = musician4_mocap_lock_target_02}
endscript

script destroy_frontend_lock_targets 
	printf \{channel = AnimInfo
		qs(0xb86dea08)}
	destroy_camera_lock_target \{name = frontend_mocap_lock_target_01}
	destroy_camera_lock_target \{name = frontend_mocap_lock_target_02}
endscript

script destroy_camera_lock_target 
	if CompositeObjectExists <name>
		<name> :Die
	endif
endscript

script start_drummer_cameras 
	printf \{channel = Band
		qs(0xd3661dee)}
	i = 1
	begin
	FormatText checksumname = info_struct 'musician%a_info' a = <i>
	if ($<info_struct>.part = Drum)
		FormatText checksumname = lock_target_01 'musician%a_mocap_lock_target_01' a = <i>
		FormatText checksumname = lock_target_02 'musician%a_mocap_lock_target_02' a = <i>
		start = 0.0
		position = ($<info_struct>.position)
		GetPakManCurrent \{map = zones}
		switch <position>
			case Vocalist
			found = 0
			if ($use_alt_positions = 1)
				ExtendCrc <pak> '_TRG_Waypoint_Vocalist_Alt_Start' out = start_node_crc
				if DoesWaypointExists Waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				ExtendCrc <pak> '_TRG_Waypoint_Vocalist_Start' out = start_node_crc
			endif
			start_pct = 0.5
			case Drummer
			found = 0
			if ($use_alt_positions = 1)
				ExtendCrc <pak> '_TRG_Waypoint_Drummer_Alt_Start' out = start_node_crc
				if DoesWaypointExists Waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				ExtendCrc <pak> '_TRG_Waypoint_Drummer_Start' out = start_node_crc
			endif
			start_pct = 0.0
			case Guitarist
			found = 0
			if ($use_alt_positions = 1)
				ExtendCrc <pak> '_TRG_Waypoint_Guitarist_Alt_Start' out = start_node_crc
				if DoesWaypointExists Waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				ExtendCrc <pak> '_TRG_Waypoint_Guitarist_Start' out = start_node_crc
			endif
			start_pct = 0.25
			case Bassist
			found = 0
			if ($use_alt_positions = 1)
				ExtendCrc <pak> '_TRG_Waypoint_Bassist_Alt_Start' out = start_node_crc
				if DoesWaypointExists Waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				ExtendCrc <pak> '_TRG_Waypoint_Bassist_Start' out = start_node_crc
			endif
			start_pct = 0.75
		endswitch
		printf qs(0x97a15241) a = <i> b = <lock_target_01>
		MomentCamera_PlayAnim anim = DrumDroid_StandardLP_C01 start_node_crc = <start_node_crc> lock_target = <lock_target_01> Cycle = 1 start = <start_pct>
		MomentCamera_PlayAnim anim = DrumDroid_StandardLP_C02 start_node_crc = <start_node_crc> lock_target = <lock_target_02> Cycle = 1 start = <start_pct>
	else
		printf qs(0x173efbf1) a = (<i> + 1)
	endif
	i = (<i> + 1)
	repeat 4
endscript

script PrepareBandMemberForRenderUpdateLoop 
	begin
	BandManager_PrepareBandMemberForRender
	wait \{1
		gameframe}
	repeat
endscript

script all_players_using_starpower 
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		if PlayerInfoEquals <player> star_power_used = 0
			return \{false}
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	return \{true}
endscript
playing_group_starpower_anim = false

script play_group_star_power_animation 
	return
	printf \{channel = AnimInfo
		qs(0x8772e70c)}
	band_builder_get_band_global
	if (<Band> != default_band)
		return
	endif
	if ($playing_group_starpower_anim = true)
		printf \{channel = AnimInfo
			qs(0x65c79e61)}
		return
	endif
	printf \{channel = AnimInfo
		qs(0x70a89b40)}
	printf \{channel = AnimInfo
		qs(0xdf4c1b2b)}
	return
endscript

script Kill_Group_Starpower_Anim \{changecamera = 1}
	if ($playing_group_starpower_anim = false)
		return
	endif
	killspawnedscript \{name = play_group_star_power_animation}
	if (<changecamera> = 1)
		CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	endif
	Change \{CameraCuts_AllowNoteScripts = true}
	Change \{playing_group_starpower_anim = false}
endscript

script debug_toggle_band_visiblity 
	debug_toggle_character_visiblity \{name = Guitarist}
	debug_toggle_character_visiblity \{name = Bassist}
	debug_toggle_character_visiblity \{name = Drummer}
	debug_toggle_character_visiblity \{name = Vocalist}
endscript

script debug_toggle_character_visiblity 
	printf channel = AnimInfo qs(0xa418ab1c) a = <name>
	if NOT GotParam \{name}
		printf \{channel = AnimInfo
			qs(0x2b50edbe)}
		return
	endif
	switch (<name>)
		case Guitarist
		debug_hide = hide_guitarist
		case Bassist
		debug_hide = hide_bassist
		case Vocalist
		debug_hide = hide_vocalist
		case Drummer
		debug_hide = hide_drummer
		default
		printf \{channel = AnimInfo
			qs(0x45f3f560)}
		return
	endswitch
	get_musician_id name = <name>
	if NOT CompositeObjectExists name = <name>
		printf channel = AnimInfo qs(0xd9dcffd1) a = <name>
		return
	endif
	if ($<debug_hide> = true)
		printf channel = AnimInfo qs(0xfacf2177) a = <name>
		BandManager_RemoveCharacter name = <name>
		<name> :hide
	else
		printf channel = AnimInfo qs(0x758bccc3) a = <name>
		<name> :unhide
	endif
endscript

script is_head_to_head_mode 
	switch $game_mode
		case p2_pro_faceoff
		return \{true}
	endswitch
	return \{false}
endscript

script build_notehit_data 
	first_time = <current_time>
	<next_array_entry> = <array_entry>
	hit_info = []
	begin
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		return hit_info = <hit_info>
	endif
	next_time = ($<event_array> [<next_array_entry>])
	if (<next_time> > <first_time>)
		current_time = <next_time>
		break
	endif
	repeat
	index = 0
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
		AddArrayElement array = <piece_array> element = <name>
		piece_array = <array>
		AddArrayElement array = <piece_array2> element = <value>
		piece_array2 = <array>
		AddArrayElement array = <piece_velocities> element = <velocity>
		piece_velocities = <array>
		num_pieces_hit = (<num_pieces_hit> + 1)
	endif
	<next_array_entry> = (<next_array_entry> + 2)
	if (<next_array_entry> >= <note_array_size>)
		printf \{channel = mydebug
			qs(0x819b879d)}
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
		AddArrayElement array = <hit_info> element = <new_entry>
		hit_info = <array>
		<index> = (<index> + 1)
		if (<index> > 5)
			break
		endif
	endif
	repeat
	return hit_info = <hit_info>
endscript

script DrumControlScript_Iterator 
	return
	if NOT GotParam \{start_note}
		script_assert \{qs(0x24d20e06)}
	endif
	if NOT GotParam \{end_note}
		script_assert \{qs(0x2225c368)}
	endif
	if NOT GotParam \{control_script}
		script_assert \{qs(0x72d1918d)}
		return
	endif
	GMan_SongTool_GetCurrentSong
	get_song_prefix song = <current_song>
	FormatText checksumname = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists name = <event_array> type = array
		printf \{channel = mydebug
			qs(0xce6b470a)}
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	note_array_size = <array_size>
	time_offset = 0
	skipleadin = 0
	if (<note_array_size> = 0)
		return
	endif
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	current_time = 0
	if CompositeObjectExists \{name = musician2}
	endif
	begin
	if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
		break
	endif
	<array_entry> = (<array_entry> + 2)
	repeat (<note_array_size> / 2)
	note_array_size = (<note_array_size> - <array_entry>)
	if (<note_array_size> = 0)
		return
	endif
	begin
	TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
	begin
	if TimeMarkerReached
		break
	endif
	wait \{1
		gameframe}
	repeat
	TimeMarkerReached_ClearParams
	current_time = ($<event_array> [<array_entry>])
	DecompressNoteValue note_value = ($<event_array> [(<array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		build_notehit_data <...>
		if CompositeObjectExists \{name = musician2}
		endif
		begin
		<array_entry> = (<array_entry> + 2)
		if (<array_entry> >= <note_array_size>)
			return
		endif
		next_time = ($<event_array> [(<array_entry>)])
		if (<next_time> > <current_time>)
			break
		endif
		repeat
	else
		<array_entry> = (<array_entry> + 2)
		if (<array_entry> >= <note_array_size>)
			return
		endif
	endif
	repeat
endscript

script pass_data_to_control_script 
	if NOT GotParam \{hit_info}
	endif
	AnimInfo_GetAllActiveValueSources
	<control_script> hit_info = <hit_info> <...>
	AnimPreview_SetSourceValues <...>
endscript

script prepare_band_for_main_menu 
	should_use_alt_positions
	index = 0
	begin
	switch <index>
		case 0
		info_struct = musician1_info
		name = musician1
		case 1
		info_struct = musician2_info
		name = musician2
		case 2
		info_struct = musician3_info
		name = musician3
		case 3
		info_struct = musician4_info
		name = musician4
	endswitch
	if CompositeObjectExists name = <name>
		part = ($<info_struct>.part)
		switch <part>
			case guitar
			Change structurename = <info_struct> anim_set = main_menu_loops_guitarist
			BandManager_AddGuitarist name = <name>
			case bass
			Change structurename = <info_struct> anim_set = main_menu_loops_bassist
			BandManager_AddBassist name = <name>
			case vocals
			Change structurename = <info_struct> anim_set = main_menu_loops_vocalist
			BandManager_AddVocalist name = <name>
			default
		endswitch
		<name> :Ragdoll_MarkForReset
	endif
	index = (<index> + 1)
	repeat 4
	BandManager_UpdateAllAnimSets
	BandManager_AllChangeStance \{stance = stance_a}
	Band_RestartIdles
endscript
