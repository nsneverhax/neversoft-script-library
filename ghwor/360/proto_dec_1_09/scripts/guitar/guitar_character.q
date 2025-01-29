musician1_info = {
	anim_set = judy_animations
	facial_anims = None
	facial_anims_default = None
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	lefty_chords = FALSE
	large_chords = FALSE
	fret_anims = fret_anims_rocker
	strum = Normal
	guitar_model = None
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = FALSE
	last_strum_length = short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = stance_frontend
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	allow_movement = true
	target_node = None
	facial_anim = Idle
	Scale = 1.0
	playing = true
	part = guitar
	position = vocalist
	anim_struct = None
	win_anim_name = None
	lose_anim_name = None
	intro_anim_name = None
	playing_special_anim = FALSE
}
musician2_info = {
	anim_set = judy_animations
	facial_anims = None
	facial_anims_default = None
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	lefty_chords = FALSE
	large_chords = FALSE
	fret_anims = fret_anims_rocker
	strum = Normal
	guitar_model = None
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = FALSE
	last_strum_length = short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = stance_frontend
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	allow_movement = true
	target_node = None
	facial_anim = Idle
	Scale = 1.0
	playing = true
	part = guitar
	position = drummer
	anim_struct = None
	win_anim_name = None
	lose_anim_name = None
	intro_anim_name = None
	playing_special_anim = FALSE
}
musician3_info = {
	anim_set = judy_animations
	facial_anims = None
	facial_anims_default = None
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	lefty_chords = FALSE
	large_chords = FALSE
	fret_anims = fret_anims_rocker
	strum = Normal
	guitar_model = None
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = FALSE
	last_strum_length = short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = stance_frontend
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	allow_movement = true
	target_node = None
	facial_anim = Idle
	Scale = 1.0
	playing = true
	part = guitar
	position = GUITARIST
	anim_struct = None
	win_anim_name = None
	lose_anim_name = None
	intro_anim_name = None
	playing_special_anim = FALSE
}
musician4_info = {
	anim_set = judy_animations
	facial_anims = None
	facial_anims_default = None
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	lefty_chords = FALSE
	large_chords = FALSE
	fret_anims = fret_anims_rocker
	strum = Normal
	guitar_model = None
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = FALSE
	last_strum_length = short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = stance_frontend
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	allow_movement = true
	target_node = None
	facial_anim = Idle
	Scale = 1.0
	playing = true
	part = guitar
	position = BASSIST
	anim_struct = None
	win_anim_name = None
	lose_anim_name = None
	intro_anim_name = None
	playing_special_anim = FALSE
}

script create_band \{async = 0}
	persistent_band_prepare_for_song async = <async>
	return \{true}
endscript

script set_guitar_string_properties \{appearance = 0x69696969
		info_struct = !q1768515945
		Name = !q1768515945}
	if get_part_key_from_appearance key = guitar_string_start appearance = <appearance> part = cas_guitar_bridges
		printf channel = AnimInfo qs(0xa5e6723d) a = <Name>
		Change structurename = <info_struct> string_start_properties = <guitar_string_start>
	elseif get_part_key_from_appearance key = guitar_string_start appearance = <appearance> part = cas_full_guitar
		printf channel = AnimInfo qs(0xa5e6723d) a = <Name>
		Change structurename = <info_struct> string_start_properties = <guitar_string_start>
	else
		printf channel = AnimInfo qs(0x95a4b190) a = <Name>
		Change structurename = <info_struct> string_start_properties = default_guitar_string_start_properties
	endif
	if get_part_key_from_appearance key = guitar_string_end appearance = <appearance> part = cas_guitar_bridges
		printf channel = AnimInfo qs(0xa4714cd4) a = <Name>
		Change structurename = <info_struct> string_end_properties = <guitar_string_end>
	elseif get_part_key_from_appearance key = guitar_string_end appearance = <appearance> part = cas_full_guitar
		printf channel = AnimInfo qs(0xa4714cd4) a = <Name>
		Change structurename = <info_struct> string_end_properties = <guitar_string_end>
	else
		printf channel = AnimInfo qs(0x1f376d79) a = <Name>
		Change structurename = <info_struct> string_end_properties = default_guitar_string_end_properties
	endif
endscript

script set_bass_string_properties \{appearance = 0x69696969
		info_struct = !q1768515945
		Name = !q1768515945}
	if get_part_key_from_appearance key = bass_string_start appearance = <appearance> part = cas_bass_bridges
		printf channel = AnimInfo qs(0x8b6be807) a = <Name>
		Change structurename = <info_struct> string_start_properties = <bass_string_start>
	elseif get_part_key_from_appearance key = bass_string_start appearance = <appearance> part = cas_full_bass
		printf channel = AnimInfo qs(0x8b6be807) a = <Name>
		Change structurename = <info_struct> string_start_properties = <bass_string_start>
	else
		printf channel = AnimInfo qs(0x0970b810) a = <Name>
		Change structurename = <info_struct> string_start_properties = default_bass_string_start_properties
	endif
	if get_part_key_from_appearance key = bass_string_end appearance = <appearance> part = cas_bass_bridges
		printf channel = AnimInfo qs(0x26832880) a = <Name>
		Change structurename = <info_struct> string_end_properties = <bass_string_end>
	elseif get_part_key_from_appearance key = bass_string_end appearance = <appearance> part = cas_full_bass
		printf channel = AnimInfo qs(0x26832880) a = <Name>
		Change structurename = <info_struct> string_end_properties = <bass_string_end>
	else
		printf channel = AnimInfo qs(0x7e4aa083) a = <Name>
		Change structurename = <info_struct> string_end_properties = default_bass_string_end_properties
	endif
endscript
testing_strings = FALSE

script test_guitar_strings 
	Change \{testing_strings = true}
	bandmanager_setpart \{Name = musician1
		part = guitar}
	bandmanager_createstrings \{Name = musician1}
endscript

script test_bass_strings 
	Change \{testing_strings = true}
	bandmanager_setpart \{Name = musician1
		part = bass}
	bandmanager_createstrings \{Name = musician1}
endscript

script band_member_start_anims \{async = 0}
	RequireParams \{[
			Name
			instrument
		]
		all}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	setup_character_anims {
		info_struct = <info_struct>
		Name = <Name>
		instrument = <instrument>
		loading_into_song = <loading_into_song>
	}
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	switch (<instrument>)
		case guitar
		case guitar_and_vocals
		guitarist_start_anims Name = <Name> info_struct = <info_struct>
		case bass
		bassist_start_anims Name = <Name> info_struct = <info_struct>
		case drum
		drummer_start_anims Name = <Name> info_struct = <info_struct>
		case vocals
		vocalist_start_anims Name = <Name> info_struct = <info_struct>
		case None
		no_instrument_start_anims Name = <Name> info_struct = <info_struct>
		default
		ScriptAssert 'unknown instrument %i' i = <instrument>
	endswitch
	if (<instrument> != drum)
		if (<async> = 1)
			Wait \{1
				gameframe}
		endif
		stance = ($<info_struct>.stance)
		if ($is_in_cas = 1)
			if ($is_in_gender_select = 1 || $is_in_genre_select = 1)
				stance = stance_old
			else
				stance = stance_frontend
			endif
		endif
		bandmanager_changestance Name = <Name> stance = <stance> no_wait
		band_setikchain Name = <Name> Chain = slave
	endif
	<Name> :Obj_SpawnScriptNow facial_anim_loop
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	<Name> :Obj_ForceUpdate
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	<Name> :obj_teleport
endscript

script no_instrument_start_anims 
	bandmanager_addguitarist Name = <Name>
endscript

script guitarist_start_anims 
	finger_anims = ($<info_struct>.finger_anims)
	fret_anims = ($<info_struct>.fret_anims)
	strum_type = ($<info_struct>.strum)
	ExtendCrc <strum_type> '_Strums' out = strum_anims
	<Name> :GetSingleTag lefty
	if (<lefty> = 1)
		Change structurename = <info_struct> fret_anims = fret_anims_rocker_lefty
	endif
	<Name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
	<Name> :hero_play_fret_anim anim = ($<fret_anims>.track_119)
	<Name> :SetTags lastbasepose = 'Strum_String_1'
	<Name> :SetTags lasttype = NULL
	<Name> :SetTags lastnotevalue = 0
	<Name> :GetSingleTag is_female
	<Name> :GetSingleTag large_hands
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
	initialize_strum_anims strumtype = <strumtype> gender = <gender> Name = <Name>
	<Name> :SetTags lookat_av = 1
	band_lookat_off \{Name = GUITARIST}
	bandmanager_addguitarist Name = <Name>
endscript

script bassist_start_anims 
	finger_anims = ($<info_struct>.finger_anims)
	fret_anims = ($<info_struct>.fret_anims)
	strum_type = ($<info_struct>.strum)
	ExtendCrc <strum_type> '_Strums' out = strum_anims
	<Name> :GetSingleTag lefty
	if (<lefty> = 1)
		Change structurename = <info_struct> fret_anims = fret_anims_rocker_lefty
	endif
	<Name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
	<Name> :hero_play_fret_anim anim = ($<fret_anims>.track_96)
	<Name> :SetTags lastbasepose = 'Strum_String_1'
	<Name> :SetTags lasttype = NULL
	<Name> :SetTags lastnotevalue = 0
	<Name> :GetSingleTag is_female
	<Name> :GetSingleTag large_hands
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
	initialize_strum_anims strumtype = <strumtype> gender = <gender> Name = <Name>
	<Name> :SetTags lookat_av = 1
	band_lookat_off \{Name = BASSIST}
	bandmanager_addbassist Name = <Name>
endscript

script initialize_strum_anims 
	getrandomfloat \{a = 0.0
		b = 1.0}
	startanim = <random_float>
	formatText checksumName = baseanim '%a_%b_Strum_Base' a = <gender> b = <strumtype>
	formatText checksumName = baseanimhigh '%a_%b_Strum_Base_High' a = <gender> b = <strumtype>
	formatText checksumName = baseanimmid '%a_%b_Strum_Base_Mid' a = <gender> b = <strumtype>
	formatText checksumName = baseanimlow '%a_%b_Strum_Base_Low' a = <gender> b = <strumtype>
	formatText checksumName = idlebase '%a_%b_Strum_String_1' a = <gender> b = <strumtype>
	formatText checksumName = idleAnim '%a_%b_Strum_Idle_Rest' a = <gender> b = <strumtype>
	<Name> :Anim_Command target = dynamic_strum_base Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $dynamic_strum_source
		params = {
			anim = <baseanim>
		}
	}
	<Name> :Anim_Command target = dynamic_strum_roll_high Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $dynamic_strum_source
		params = {
			anim = <baseanimhigh>
		}
	}
	<Name> :Anim_Command target = dynamic_strum_roll_mid Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $dynamic_strum_source
		params = {
			anim = <baseanimmid>
		}
	}
	<Name> :Anim_Command target = dynamic_strum_roll_low Command = DegenerateBlend_AddBranch params = {
		BlendDuration = 0.0
		Tree = $dynamic_strum_source
		params = {
			anim = <baseanimlow>}
	}
	<Name> :Anim_Command target = dynamic_strums Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blend>
		BlendCurve = $idle_blend_curve
		Tree = $dynamic_strum_idle_branch
		params = {
			startanim = <startanim>
			baseanim = <idlebase>
			strumanim = <idleAnim>
		}
	}
endscript

script vocalist_start_anims 
	vocalist_reset_globals
	<Name> :Anim_Command target = autovocals_switch Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
	<Name> :animinfo_getallactivevaluesources
	av_brow_scrub = 0.5
	av_brow_emot = 0.5
	av_brow_mod = 0.0
	av_pitch_volume = 0.5
	av_vocal_cycle_0 = 0.0
	av_vocal_cycle_1 = 0.0
	av_vocal_cycle_2 = 0.0
	av_vocal_cycle_3 = 0.0
	av_vocal_cycle_4 = 0.0
	av_vocal_cycle_5 = 0.0
	<Name> :AnimPreview_SetSourceValues <...>
	<Name> :SetTags lookat_av = 1
	band_lookat_off \{Name = vocalist}
	bandmanager_addvocalist Name = <Name>
endscript
use_drummer_events = 0

script drummer_start_anims 
	drummer_reset_globals
	<Name> :animinfo_getallactivevaluesources
	av_drum_anim_hand_l = $drum_idlepoint_arm_shit
	av_drum_anim_hand_r = $drum_idlepoint_arm_shit
	av_drum_anim_foot_r = $drum_idlepoint_foot_hit
	av_drum_blend_hand_l = 1.0
	av_drum_blend_hand_r = 1.0
	av_drum_blend_foot_r = 1.0
	av_drum_mod_loop_body = 1.0
	av_drum_mod_hand_r = 1.0
	av_drum_mod_hand_l = 1.0
	av_drum_mod_foot_r = 1.0
	av_drum_ik_hand_l = 0.0
	av_drum_ik_hand_r = 0.0
	<av_drum_ik_feet> = 1.0
	<av_drum_blend_hh_kit> = 1.0
	<Name> :AnimPreview_SetSourceValues <...>
	<Name> :SetTags Idle = true
	<Name> :SetTags tap = true
	<Name> :Obj_SpawnScriptNow drummer_transit_base_long params = {
		node = Body
		drum_old_long_string = 'S1T3'
		drum_new_long_string = 'S1T3'
		time_to_trans_base = 0.0
		time_to_trans = 0.0
		currentset = 1
	}
	<Name> :Obj_SpawnScriptNow drummer_transit_base_long params = {
		node = Ik
		drum_old_long_string = 'S1T3'
		drum_new_long_string = 'S1T3'
		time_to_trans_base = 0.0
		time_to_trans = 0.0
		currentset = 1
	}
	<Name> :SetTags lookat_av = 1
	band_lookat_off \{Name = drummer}
	default_kit_anims Name = <Name>
	bandmanager_adddrummer Name = <Name>
endscript

script initial_drummer_anim 
	if is_current_song_a_jam_session
		hero_play_anim \{anim = drum_andy_standardlp_hs_100_01
			cycle}
	else
		hero_play_anim \{anim = drum_andy_standardlp_notempo
			cycle}
	endif
endscript

script should_display_debug_info 
	Obj_GetID
	display_info = FALSE
	switch (<objID>)
		case GUITARIST
		if ($display_guitarist_anim_info = true)
			display_info = true
		endif
		case BASSIST
		if ($display_bassist_anim_info = true)
			display_info = true
		endif
		case vocalist
		if ($display_vocalist_anim_info = true)
			display_info = true
		endif
		case drummer
		if ($display_drummer_anim_info = true)
			display_info = true
		endif
	endswitch
	return <display_info>
endscript

script crowd_play_adjusting_random_anims \{anim = Idle
		blend_time = 0.2
		startwithnoblend = 0
		playonce = FALSE}
	return
	Obj_GetID
	old_speed = undefined
	previous_anim_name = no_anim
	begin
	hero_get_skill_level_cfunc
	get_anim_speed_for_tempo_cfunc
	if GotParam \{anim_set}
		anims = ($<anim_set>.<anim>.<skill>.<anim_speed>)
	else
		anims = ($crowd_animations.<anim>.<skill>.<anim_speed>)
	endif
	GetArraySize <anims>
	GetRandomValue Name = newindex integer a = 0 b = (<array_Size> - 1)
	anim_name = (<anims> [<newindex>])
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
		GameObj_PlayAnim anim = <anim_name> BlendDuration = <blend_time> TimerType = tempocycle AnimEvents = On
		previous_anim_name = <anim_name>
	else
		Anim_Command \{target = BodyTimer
			Command = timer_resetanimcompleteflag}
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
			Name
			info_struct
		]
		all}
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
			Change structurename = <info_struct> anim_set = (<anim_struct_member>.anim_set)
			if ((<instrument> = guitar) || (<instrument> = bass))
				if GotParam \{use_default_finger_fret_strum}
					Change structurename = <info_struct> finger_anims = guitarist_finger_anims_car_female
					Change structurename = <info_struct> fret_anims = fret_anims_rocker
					Change structurename = <info_struct> strum = car_female_normal
				else
					Change structurename = <info_struct> finger_anims = (<anim_struct_member>.finger_anims)
					Change structurename = <info_struct> fret_anims = (<anim_struct_member>.fret_anims)
					Change structurename = <info_struct> strum = (<anim_struct_member>.strum_anims)
				endif
			endif
		else
			printf 'Anim_set not found for %s' s = <Name>
			Change structurename = <info_struct> anim_set = car_female_animations
		endif
		if StructureContains structure = <anim_struct_member> facial_anims
			Change structurename = <info_struct> facial_anims = (<anim_struct_member>.facial_anims)
			Change structurename = <info_struct> facial_anims_default = (<anim_struct_member>.facial_anims)
		else
			printf channel = AnimInfo qs(0x578cc9b0) s = <Name>
			Change structurename = <info_struct> facial_anims = None
			Change structurename = <info_struct> facial_anims_default = None
			printstruct <anim_struct_member>
		endif
	endif
	Change structurename = <info_struct> allow_movement = true
	Change structurename = <info_struct> arms_disabled = 0
	Change structurename = <info_struct> disable_arms = 0
	Change structurename = <info_struct> playing_special_anim = FALSE
	Change structurename = <info_struct> next_stance = ($<info_struct>.stance)
endscript

script get_start_node_id \{character = qs(0x5c2c7d0c)}
	getstartnodeid member = <member>
	return waypoint_id = <waypoint_id> waypoint_name = <waypoint_name>
endscript

script get_skill_level 
	getfirstplayer
	getplayerinfo <Player> current_health out = health
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
	Obj_KillSpawnedScript \{Name = facial_anim_loop}
	Obj_GetID
	if (<objID> = GUITARIST)
		printf \{channel = AnimInfo
			qs(0x95f334b8)}
	endif
	hero_play_facial_anim anim = <anim>
	hero_wait_until_anim_finished \{Timer = FacialTimer}
	if (<objID> = GUITARIST)
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
	if NOT GlobalExists Name = <facial_anims> Type = structure
		printf \{channel = AnimInfo
			qs(0x989b10a0)}
		return
	endif
	if NOT StructureContains structure = $<facial_anims> Name = Idle
		return
	endif
	begin
	anim = ($<info_struct>.facial_anim)
	if NOT StructureContains structure = $<facial_anims> Name = <anim>
		if ($display_facial_anim_info = true)
			printf channel = AnimInfo qs(0x88ae47d6) a = <anim>
		endif
		anim = Idle
	endif
	anims = ($<facial_anims>.<anim>)
	GetArraySize <anims>
	GetRandomValue Name = index integer a = 0 b = (<array_Size> - 1)
	anim_name = (<anims> [<index>])
	if ($display_facial_anim_info = true)
		printf channel = AnimInfo qs(0xab9f8ab8) a = <anim> b = <anim_name> c = <objID>
	endif
	Change structurename = <info_struct> facial_anim = Idle
	hero_play_facial_anim anim = <anim_name> BlendDuration = <blend_duration>
	blend_duration = 0
	hero_wait_until_anim_finished \{Timer = FacialTimer}
	Wait \{1
		gameframe}
	repeat
endscript

script guitarist_idle_animpreview 
	ClearEventHandlerGroup \{group = hand_events}
endscript
band_character_names = [
	musician1
	musician2
	musician3
	musician4
]

script play_intro_anims 
	band_restartidles
	ForEachIn \{$band_character_names
		do = play_intro_anims_foreach}
	Wait \{1
		gameframe}
	bandmanager_setplayingintroanims
endscript

script play_intro_anims_foreach 
	if CompositeObjectExists Name = <checksum>
		if NOT bandmanager_isplayingsimpleanim Name = <checksum>
			ExtendCrc <checksum> '_Info' out = info_struct
			part = ($<info_struct>.part)
			position = ($<info_struct>.position)
			if (<part> = drum)
				return
			endif
			start = 0.0
			if (<position> = vocalist)
				if using_singing_guitarist
					start = 0.5
				endif
			endif
			intro_anim = ($<info_struct>.intro_anim_name)
			if (<intro_anim> != None)
				Band_PlaySimpleAnim {Name = <checksum> anim = <intro_anim> BlendDuration = 0.3 start = <start>}
				if (<part> = guitar || <part> = bass)
					<checksum> :GetTags lefty
					if (<lefty> = 1)
						band_setikchain Name = <checksum> Chain = slave
					else
						band_setikchain Name = <checksum> Chain = guitar
					endif
				else
					band_setikchain Name = <checksum> Chain = slave
				endif
				bandmanager_stopfacialanims Name = <checksum>
			endif
		else
			printf \{channel = marc
				qs(0xff9a890c)}
		endif
	endif
endscript

script play_win_anims 
	if ($poselog_vocalist = true)
		gamemode_gettype
		if (<Type> = quickplay)
			printf \{channel = AnimInfo
				qs(0xec02b1ab)}
			vocalist :Anim_Command \{target = vocalist_pose_node
				Command = poselog_stoprecording}
		endif
	endif
	KillSpawnedScript \{Name = return_characters_to_idle_at_song_time}
	GetArraySize \{$band_character_names}
	i = 0
	begin
	Name = ($band_character_names [<i>])
	SpawnScriptNow play_win_anims_foreach params = {checksum = <Name>}
	i = (<i> + 1)
	repeat <array_Size>
	return
endscript

script play_win_anims_foreach 
	if GotParam \{checksum}
		if CompositeObjectExists Name = <checksum>
			ExtendCrc <checksum> '_Info' out = info_struct
			wait_for_next_even_frame
			Wait \{1
				gameframe}
			band_changefacialanims Name = <checksum>
			win_anim = ($<info_struct>.win_anim_name)
			if (<win_anim> != None)
				band_setikchain Name = <checksum> Chain = slave
				Band_PlaySimpleAnim {Name = <checksum> anim = <win_anim> BlendDuration = 0.3}
			else
				printf channel = marc qs(0x553d6959) a = <checksum>
			endif
			Wait \{1
				gameframe}
			band_movetostartnode Name = <checksum> allow_in_2player = true
		else
		endif
	endif
endscript

script play_lose_anims 
	if ($poselog_vocalist = true)
		gamemode_gettype
		if (<Type> = quickplay)
			printf \{channel = AnimInfo
				qs(0xec02b1ab)}
			vocalist :Anim_Command \{target = vocalist_pose_node
				Command = poselog_stoprecording}
		endif
	endif
	band_showmic_stand \{Name = vocalist}
	KillSpawnedScript \{Name = return_characters_to_idle_at_song_time}
	GetArraySize \{$band_character_names}
	i = 0
	begin
	Name = ($band_character_names [<i>])
	SpawnScriptNow play_lose_anims_foreach params = {checksum = <Name>}
	i = (<i> + 1)
	repeat <array_Size>
	return
endscript

script play_lose_anims_foreach 
	if GotParam \{checksum}
		if CompositeObjectExists Name = <checksum>
			ExtendCrc <checksum> '_Info' out = info_struct
			wait_for_next_even_frame
			Wait \{1
				gameframe}
			band_changefacialanims Name = <checksum>
			lose_anim = ($<info_struct>.lose_anim_name)
			if (<lose_anim> != None)
				band_setikchain Name = <checksum> Chain = slave
				Band_PlaySimpleAnim {Name = <checksum> anim = <lose_anim> BlendDuration = 0.3}
			else
				printf channel = AnimInfo qs(0x283913b7) a = <checksum>
			endif
			Wait \{1
				gameframe}
			band_movetostartnode Name = <checksum> allow_in_2player = true
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
		Type = ContainerElement
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
	if NOT ininternetmode
		<start_skip_id> :se_setprops {
			event_handlers = [
				{pad_start song_outro_anims_skip_anims params = {start_skip_id = <start_skip_id>}}
			]
		}
		LaunchEvent Type = focus target = <start_skip_id>
		add_user_control_helper \{text = qs(0x784c64ff)
			button = start
			z = 100000}
	endif
	song_outro_determine_camera_cut_order
	GetArraySize <order>
	getnumplayersingame \{on_screen}
	order_idx = 0
	begin
	getplayerinfo (<order> [<order_idx>].player_num) part
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
	getplayerinfo (<order> [<order_idx>].player_num) band_member
	if CompositeObjectExists Name = <band_member>
		ExtendCrc <band_member> '_Info' out = info_struct
		band_movetostartnode Name = <band_member>
		band_changefacialanims Name = <band_member>
		if (<anim> != None)
			SpawnScriptNow \{audio_ui_gameplay_play_camera_win_sfx}
			bandmanager_changeik Name = <band_member> Enabled = FALSE
			Band_PlaySimpleAnim {Name = <band_member> anim = <anim> BlendDuration = 0.3}
			<band_member> :obj_teleport
			getstartnodeid member = <band_member>
			GetWaypointPos Name = <waypoint_id>
			getwaypointquat Name = <waypoint_id>
			moment_cam_lock_target_01 :Obj_SetPosition position = <Pos>
			moment_cam_lock_target_01 :Obj_SetOrientation Quat = <Quat>
			Change g_song_outro_anims_current_player = (<order> [<order_idx>].player_num)
			chain_part = slave
			band_setikchain Name = <band_member> Chain = <chain_part>
			Change g_song_outro_anims_initial_speed = <cam_initial_speed>
			setslomo <cam_initial_speed>
			spawnscript \{songwon_fx}
			momentcamera_playanim_spawned Name = moment_cam_lock_target_01 anim = <cam> tempoanim = <cam> cycle = 0 start = 0 BlendDuration = 0
		endif
	endif
	<order_idx> = (<order_idx> + 1)
	repeat <array_Size>
	song_outro_anims_skip_anims start_skip_id = <start_skip_id>
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
	if (<array_Size> > 0)
		GetRandomValue a = 0 b = (<array_Size> - 1) Name = i integer
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
	GetArraySize ((($song_outro_anims).<part>) [<anim_index>].cameras)
	if (<array_Size> > 0)
		GetRandomValue a = 0 b = (<array_Size> - 1) Name = i integer
		return {
			cam = ((((($song_outro_anims).<part>) [<anim_index>].cameras) [<i>]).Camera)
			cam_initial_speed = ((((($song_outro_anims).<part>) [<anim_index>].cameras) [<i>]).initial_speed)
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
	if (<array_Size> > 0)
		i = 0
		begin
		if (<anim_cam_pair_array> [<i>].part = <part>)
			if ((<anim_cam_pair_array> [<i>].anim = <anim_index>))
				return \{is_used = 1}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{is_used = 0}
endscript

script song_outro_determine_camera_cut_order 
	gamemode_gettype
	player_order = []
	if ((<Type> = career) || (<Type> = quickplay))
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen}
			begin
			get_percent_notes_hit player_index = <Player> use_player_info = 0
			AddArrayElement {
				array = <player_order>
				element = {
					player_num = <Player>
					percent_notes_hit = <percent_notes_hit>
				}
			}
			<player_order> = <array>
			getnextplayer on_screen Player = <Player>
			repeat <num_players_shown>
			GetArraySize <player_order>
			if (<array_Size> > 1)
				begin
				<i> = 0
				begin
				left_accuracy = (<player_order> [<i>].percent_notes_hit)
				right_accuracy = (<player_order> [(<i> + 1)].percent_notes_hit)
				if (<right_accuracy> > <left_accuracy>)
					left_score_band_idx = (<player_order> [<i>])
					SetArrayElement ArrayName = player_order index = <i> NewValue = (<player_order> [(<i> + 1)])
					SetArrayElement ArrayName = player_order index = (<i> + 1) NewValue = <left_score_band_idx>
				endif
				<i> = (<i> + 1)
				repeat (<array_Size> - 1)
				repeat <array_Size>
			endif
		endif
	else
		song_breakdown_competitive_determine_order_from_score
		GetArraySize <order>
		if (<array_Size> > 0)
			getnumplayersingame \{on_screen}
			if (<num_players_shown> > 0)
				getfirstplayer \{on_screen}
				begin
				getplayerinfo <Player> Band
				if (<Band> = (<order> [0].band_num))
					AddArrayElement {
						array = player_order
						element = {
							player_num = <Player>
						}
					}
					<player_order> = <array>
				endif
				getnextplayer on_screen Player = <Player>
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
	KillSpawnedScript \{Name = song_outro_anims_display_stats_spawned}
	SpawnScriptNow song_outro_anims_display_stats_spawned params = {parent = <parent> stats_display_secs = <stats_display_secs> slomo_speed = <slomo_speed>}
endscript

script song_outro_anims_display_stats_spawned \{parent = !q1768515945
		stats_display_secs = !f1768515945
		slomo_speed = !f1768515945}
	<Player> = ($g_song_outro_anims_current_player)
	ui_song_breakdown_get_player_display_name player_index = <Player>
	<name_text> = <player_name_text>
	getplayerinfo <Player> part
	getplayerinfo <Player> difficulty
	<percent_alpha> = 1
	<percent_stacker_pos> = (5.0, -97.0)
	get_percent_notes_hit player_index = <Player> use_player_info = 0
	if NOT (<part> = vocals)
		getplayerinfo <Player> best_run
		formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit>
		formatText TextName = streak_text qs(0x8c5c152d) n = <best_run> DecimalPlaces = 0
		formatText \{TextName = streak_unit_text
			qs(0x6036c2d7)}
	else
		getplayerinfo <Player> vocal_streak_phrases
		getplayerinfo <Player> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit> DecimalPlaces = 0
		else
			<percent_text> = qs(0x6a5cf46c)
			<percent_alpha> = 0
			<percent_stacker_pos> = (30.0, -97.0)
		endif
		formatText TextName = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> DecimalPlaces = 0
		formatText \{TextName = streak_unit_text
			qs(0x4ac2a4de)}
	endif
	switch <part>
		case guitar
		<icon_texture> = mixer_icon_guitar
		case bass
		<icon_texture> = mixer_icon_bass
		case drum
		<icon_texture> = mixer_icon_drums
		case vocals
		<icon_texture> = mixer_icon_vox
	endswitch
	switch <difficulty>
		case beginner
		<diff_texture> = icon_difficulty_beginner
		case easy
		<diff_texture> = icon_difficulty_easy
		case medium
		<diff_texture> = icon_difficulty_medium
		case hard
		<diff_texture> = icon_difficulty_hard
		case expert
		<diff_texture> = icon_difficulty_expert
		if (<part> = drum)
			getplayerinfo <Player> double_kick_drum
			if (<double_kick_drum> = 1)
				<diff_texture> = icon_difficulty_expert_plus
			endif
		endif
	endswitch
	if ScreenElementExists id = <parent>
		setslomo <slomo_speed>
		CreateScreenElement {
			parent = <parent>
			Type = descinterface
			desc = 'song_outro_anim_stats'
			pos_anchor = [left , top]
			just = [left , top]
			Pos = (-300.0, 130.0)
			alpha = 1
			player_name_text = <name_text>
			note_percentage_text = <percent_text>
			note_streak_text = <streak_text>
			streak_unit_text_text = <streak_unit_text>
			instrument_icon_texture = <icon_texture>
			difficulty_icon_texture = <diff_texture>
			percent_alpha = <percent_alpha>
			percent_stacker_pos = <percent_stacker_pos>
			targeted_challenge_alpha = 0.0
			z_priority = 400
		}
		<stats_desc_id> = <id>
		<is_targeting_challenge> = 0
		gamemode_gettype
		if (<Type> = quickplay)
			if <stats_desc_id> :desc_resolvealias Name = alias_hud_meter_challenge param = challenge_meter_id
				if GMan_GoalIsActive \{goal = quickplay}
					gman_getdata \{goal = quickplay
						Name = targeted_challenge}
					gman_getdata \{goal = quickplay
						Name = targeted_challenge_inst_config}
					getplayerinfo <Player> part
					if (<targeted_challenge> != NULL && <targeted_challenge_inst_config> = <part>)
						if NOT <challenge_meter_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
							ScriptAssert \{'Assert'}
						endif
						<dx> = (360.0 / ($challange_meter_num_ticks))
						<degree> = 0
						<cnt> = 0
						begin
						CreateScreenElement {
							Type = SpriteElement
							parent = <led_container>
							alpha = 0.0
							pos_anchor = [center center]
							rot_angle = <degree>
							Pos = (0.0, 0.0)
							texture = meter_challenge_led
						}
						<degree> = (<degree> + <dx>)
						<cnt> = (<cnt> + 1)
						repeat ($challange_meter_num_ticks)
						ExtendCrc <targeted_challenge> '_info' out = targeted_challenge_info
						formatText checksumName = player_challenge_id '%n_p%p' n = ($<targeted_challenge_info>.Name) p = <Player>
						if GMan_GoalIsActive goal = <player_challenge_id>
							<is_targeting_challenge> = 1
							gman_getdata goal = <player_challenge_id> Player = <Player> Name = current_progress
							gman_getdata goal = <player_challenge_id> Player = <Player> Name = calculated_targets
							GetArraySize <calculated_targets>
							if (<array_Size> != 3)
								ScriptAssert 'Incorrect number of challenge levels for challenge %t' t = <targeted_challenge>
							endif
							gman_getdata \{goal = quickplay
								Name = targeted_challenge_friend_scores}
							gman_getdata \{goal = quickplay
								Name = targeted_challenge_friend_index}
							<is_targeting_friend> = 0
							<friend_params> = {}
							if (<targeted_challenge_friend_index> >= 0)
								<is_targeting_friend> = 1
							endif
							song_breakdown_get_highest_completed_challenge_level {
								gold_level = ((<calculated_targets> [0]) * 1.0)
								platinum_level = ((<calculated_targets> [1]) * 1.0)
								diamond_level = ((<calculated_targets> [2]) * 1.0)
								current_progress = (<current_progress> * 1.0)
								is_targeting_friend = <is_targeting_friend>
								player_challenge_id = <player_challenge_id>
							}
							<targeted_challenge_props> = {}
							if (<is_targeting_friend> = 1)
								<friend_params> = {
									use_friend_target
									friend_level = 0
									friend_name = qs(0x03ac90f0)
								}
								if (<current_progress> > (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].score))
									formatText \{TextName = player_top_text
										qs(0x7adaa795)}
								elseif (<current_progress> < (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].score))
									formatText \{TextName = player_top_text
										qs(0x22b394fa)}
								else
									formatText \{TextName = player_top_text
										qs(0xcc4d56fc)}
								endif
								formatText TextName = player_mid_text qs(0x63eb828f) g = (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].gamer_tag)
								AddParam structure_name = targeted_challenge_props Name = player_top_text value = <player_top_text>
								AddParam structure_name = targeted_challenge_props Name = player_mid_text value = <player_mid_text>
								AddParam \{structure_name = targeted_challenge_props
									Name = player_bottom_alpha
									value = 0.0}
							else
								GetArraySize <targeted_challenge_friend_scores>
								if (<array_Size> > 0)
									song_outro_anims_find_self_within_friend_scores {
										current_progress = <current_progress>
										targeted_challenge_friend_scores = <targeted_challenge_friend_scores>
									}
									if (<above_friend_index> = -1)
										formatText TextName = player_mid_text qs(0x843e4550) g = <name_text>
										formatText TextName = player_bottom_text qs(0x5d4bacd3) g = (<targeted_challenge_friend_scores> [<below_friend_index>].gamer_tag)
										AddParam \{structure_name = targeted_challenge_props
											Name = player_top_alpha
											value = 0.0}
										AddParam structure_name = targeted_challenge_props Name = player_mid_text value = <player_mid_text>
										AddParam structure_name = targeted_challenge_props Name = player_bottom_text value = <player_bottom_text>
									elseif (<below_friend_index> = -1)
										song_outro_anim_stats_get_rank_text rank = (<above_friend_index> + 1)
										formatText TextName = player_top_text qs(0xe1886eaa) r = <rank_text> g = (<targeted_challenge_friend_scores> [<above_friend_index>].gamer_tag)
										song_outro_anim_stats_get_rank_text rank = (<self_index> + 1)
										formatText TextName = player_mid_text qs(0xe1886eaa) r = <rank_text> g = <name_text>
										AddParam structure_name = targeted_challenge_props Name = player_top_text value = <player_top_text>
										AddParam structure_name = targeted_challenge_props Name = player_mid_text value = <player_mid_text>
										AddParam \{structure_name = targeted_challenge_props
											Name = player_bottom_alpha
											value = 0.0}
									else
										song_outro_anim_stats_get_rank_text rank = (<above_friend_index> + 1)
										formatText TextName = player_top_text qs(0xe1886eaa) r = <rank_text> g = (<targeted_challenge_friend_scores> [<above_friend_index>].gamer_tag)
										song_outro_anim_stats_get_rank_text rank = (<self_index> + 1)
										formatText TextName = player_mid_text qs(0xe1886eaa) r = <rank_text> g = <name_text>
										song_outro_anim_stats_get_rank_text rank = (<below_friend_index> + 1)
										formatText TextName = player_bottom_text qs(0xe1886eaa) r = <rank_text> g = (<targeted_challenge_friend_scores> [<below_friend_index>].gamer_tag)
										AddParam structure_name = targeted_challenge_props Name = player_top_text value = <player_top_text>
										AddParam structure_name = targeted_challenge_props Name = player_mid_text value = <player_mid_text>
										AddParam structure_name = targeted_challenge_props Name = player_bottom_text value = <player_bottom_text>
									endif
								else
									AddParam \{structure_name = targeted_challenge_props
										Name = player_top_alpha
										value = 0.0}
									AddParam \{structure_name = targeted_challenge_props
										Name = player_mid_alpha
										value = 0.0}
									AddParam \{structure_name = targeted_challenge_props
										Name = player_bottom_alpha
										value = 0.0}
								endif
							endif
							fill_challenge_meter_to {
								percent = <percent_to_next>
								Player = <Player>
								level = <highest_completed>
								challenge_meter_id = <challenge_meter_id>
								<friend_params>
							}
							quickplay_get_challenge_icon base_name = <targeted_challenge>
							<challenge_meter_id> :se_setprops challenge_icon_texture = <icon_name> challenge_icon_alpha = 1.0
							<stats_desc_id> :se_setprops {
								alpha = 1
								targeted_challenge_alpha = 1.0
								<targeted_challenge_props>
							}
						endif
					endif
				endif
			endif
		endif
		if (<is_targeting_challenge> = 1)
			<flyby_pos> = (-10.0, -10.0)
		else
			<flyby_pos> = (-10.0, 50.0)
		endif
		<stats_desc_id> :se_setprops {
			Pos = <flyby_pos>
			alpha = 1
			time = 0.2
			anim = ease_out
		}
	endif
	Wait <stats_display_secs> Seconds ignoreslomo
	if ScreenElementExists id = <stats_desc_id>
		DestroyScreenElement id = <stats_desc_id>
	endif
	setslomo ($g_song_outro_anims_initial_speed)
endscript

script song_outro_anims_skip_anims 
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
		play_hold = 1}
	SpawnScriptNow \{switch_off_cameracuts_delayed}
	restore_idle_faces
	SpawnScriptNow \{id = not_transitions
		Transition_KillAll}
endscript

script song_outro_anims_find_self_within_friend_scores \{current_progress = !i1768515945
		targeted_challenge_friend_scores = !a1768515945}
	<above_friend_index> = -1
	<below_friend_index> = -1
	<self_index> = -1
	GetArraySize <targeted_challenge_friend_scores>
	if (<array_Size> > 0)
		<i> = 0
		begin
		if ((<targeted_challenge_friend_scores> [<i>].score) <= <current_progress>)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	<self_index> = <i>
	if (<i> = <array_Size>)
		<above_friend_index> = (<i> - 1)
	elseif (<i> = 0)
		<below_friend_index> = (<i> + 1)
	else
		<above_friend_index> = (<i> - 1)
		<below_friend_index> = (<i> + 1)
	endif
	if ((<above_friend_index> = -1) && (<below_friend_index> = -1))
		ScriptAssert \{'Could not find ranking amongst friends!'}
	endif
	return {
		self_index = <self_index>
		above_friend_index = <above_friend_index>
		below_friend_index = <below_friend_index>
	}
endscript

script song_outro_anim_stats_get_rank_text \{rank = !i1768515945}
	if (<rank> = 1)
		<rank_text> = qs(0xb3c239d4)
	elseif (<rank> = 2)
		<rank_text> = qs(0xdde7d669)
	elseif (<rank> = 3)
		<rank_text> = qs(0x0c74edeb)
	else
		formatText TextName = rank_text qs(0x4dc9c452) i = (<above_friend_index> + 1)
	endif
	return rank_text = <rank_text>
endscript

script switch_off_cameracuts_delayed 
	Wait \{2
		gameframes}
	CameraCuts_EnableChangeCam \{enable = FALSE}
endscript

script restore_idle_faces 
	i = 1
	begin
	formatText checksumName = musician 'musician%a' a = <i>
	formatText checksumName = info_struct 'musician%a_info' a = <i>
	fa_anims = ($<info_struct>.facial_anims_default)
	Change structurename = <info_struct> facial_anims = <fa_anims>
	if CompositeObjectExists Name = <musician>
		<musician> :Obj_KillSpawnedScript Name = facial_anim_loop
		<musician> :Obj_SpawnScriptNow facial_anim_loop
	endif
	i = (<i> + 1)
	repeat 4
endscript

script Hide_Band 
	if CompositeObjectExists \{musician1}
		musician1 :Hide
	endif
	if CompositeObjectExists \{musician2}
		musician2 :Hide
	endif
	if CompositeObjectExists \{musician3}
		musician3 :Hide
	endif
	if CompositeObjectExists \{musician4}
		musician4 :Hide
	endif
endscript

script Unhide_Band 
	if CompositeObjectExists \{musician1}
		band_unhide \{Name = musician1}
	endif
	if CompositeObjectExists \{musician2}
		band_unhide \{Name = musician2}
	endif
	if CompositeObjectExists \{musician3}
		band_unhide \{Name = musician3}
	endif
	if CompositeObjectExists \{musician4}
		band_unhide \{Name = musician4}
	endif
endscript

script create_all_camera_lock_targets 
	destroy_all_camera_lock_targets
	Wait \{1
		gameframe}
	create_camera_lock_target \{Name = moment_cam_lock_target_01
		only_anim_if_locked = FALSE}
	create_camera_lock_target \{Name = moment_cam_lock_target_02}
	create_camera_lock_target \{Name = moment_cam_lock_target_03}
	create_camera_lock_target \{Name = moment_cam_lock_target_04}
	create_camera_lock_target \{Name = moment_cam_lock_target_05}
	create_camera_lock_target \{Name = moment_cam_lock_target_06}
	create_camera_lock_target \{Name = moment_cam_lock_target_07}
	create_camera_lock_target \{Name = moment_cam_lock_target_08}
	create_camera_lock_target \{Name = moment_cam_lock_target_09}
	create_camera_lock_target \{Name = moment_cam_lock_target_10}
	create_camera_lock_target \{Name = musician1_mocap_lock_target_01}
	create_camera_lock_target \{Name = musician1_mocap_lock_target_02}
	create_camera_lock_target \{Name = musician2_mocap_lock_target_01}
	create_camera_lock_target \{Name = musician2_mocap_lock_target_02}
	create_camera_lock_target \{Name = musician3_mocap_lock_target_01}
	create_camera_lock_target \{Name = musician3_mocap_lock_target_02}
	create_camera_lock_target \{Name = musician4_mocap_lock_target_01}
	create_camera_lock_target \{Name = musician4_mocap_lock_target_02}
endscript

script create_frontend_lock_targets 
	destroy_frontend_lock_targets
	printf \{channel = AnimInfo
		qs(0xc22b676e)}
	create_camera_lock_target \{Name = frontend_mocap_lock_target_01}
	create_camera_lock_target \{Name = frontend_mocap_lock_target_02}
endscript

script create_camera_lock_target \{only_anim_if_locked = true}
	CreateFromStructure {
		Name = <Name>
		Pos = (0.0, 0.0, 0.0)
		Angles = (0.0, 1.0, 0.0)
		Class = GameObject
		Type = Ghost
		CreatedAtStart
		DisableShadowCasting = FALSE
		Profile = $profile_ven_camera_obj
		only_animate_if_locked_to_by_active_cinematic_camera = <only_anim_if_locked>
	}
endscript

script destroy_all_camera_lock_targets 
	destroy_camera_lock_target \{Name = moment_cam_lock_target_01}
	destroy_camera_lock_target \{Name = moment_cam_lock_target_02}
	destroy_camera_lock_target \{Name = moment_cam_lock_target_03}
	destroy_camera_lock_target \{Name = moment_cam_lock_target_04}
	destroy_camera_lock_target \{Name = moment_cam_lock_target_05}
	destroy_camera_lock_target \{Name = moment_cam_lock_target_06}
	destroy_camera_lock_target \{Name = moment_cam_lock_target_07}
	destroy_camera_lock_target \{Name = moment_cam_lock_target_08}
	destroy_camera_lock_target \{Name = moment_cam_lock_target_09}
	destroy_camera_lock_target \{Name = moment_cam_lock_target_10}
	destroy_camera_lock_target \{Name = musician1_mocap_lock_target_01}
	destroy_camera_lock_target \{Name = musician1_mocap_lock_target_02}
	destroy_camera_lock_target \{Name = musician2_mocap_lock_target_01}
	destroy_camera_lock_target \{Name = musician2_mocap_lock_target_02}
	destroy_camera_lock_target \{Name = musician3_mocap_lock_target_01}
	destroy_camera_lock_target \{Name = musician3_mocap_lock_target_02}
	destroy_camera_lock_target \{Name = musician4_mocap_lock_target_01}
	destroy_camera_lock_target \{Name = musician4_mocap_lock_target_02}
endscript

script destroy_frontend_lock_targets 
	printf \{channel = AnimInfo
		qs(0xb86dea08)}
	destroy_camera_lock_target \{Name = frontend_mocap_lock_target_01}
	destroy_camera_lock_target \{Name = frontend_mocap_lock_target_02}
endscript

script destroy_camera_lock_target 
	if CompositeObjectExists <Name>
		<Name> :Die
	endif
endscript

script start_drummer_cameras 
	i = 1
	begin
	formatText checksumName = info_struct 'musician%a_info' a = <i>
	if ($<info_struct>.part = drum)
		formatText checksumName = lock_target_01 'musician%a_mocap_lock_target_01' a = <i>
		formatText checksumName = lock_target_02 'musician%a_mocap_lock_target_02' a = <i>
		start = 0.0
		position = ($<info_struct>.position)
		GetPakManCurrent \{map = zones}
		switch <position>
			case vocalist
			found = 0
			if ($g_band_use_alt_positions = 1)
				ExtendCrc <pak> '_TRG_Waypoint_Vocalist_Alt_Start' out = start_node_crc
				if doeswaypointexists Waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				ExtendCrc <pak> '_TRG_Waypoint_Vocalist_Start' out = start_node_crc
			endif
			start_pct = 0.5
			case drummer
			found = 0
			if ($g_band_use_alt_positions = 1)
				ExtendCrc <pak> '_TRG_Waypoint_Drummer_Alt_Start' out = start_node_crc
				if doeswaypointexists Waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				ExtendCrc <pak> '_TRG_Waypoint_Drummer_Start' out = start_node_crc
			endif
			start_pct = 0.0
			case GUITARIST
			found = 0
			if ($g_band_use_alt_positions = 1)
				ExtendCrc <pak> '_TRG_Waypoint_Guitarist_Alt_Start' out = start_node_crc
				if doeswaypointexists Waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				ExtendCrc <pak> '_TRG_Waypoint_Guitarist_Start' out = start_node_crc
			endif
			start_pct = 0.25
			case BASSIST
			found = 0
			if ($g_band_use_alt_positions = 1)
				ExtendCrc <pak> '_TRG_Waypoint_Bassist_Alt_Start' out = start_node_crc
				if doeswaypointexists Waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				ExtendCrc <pak> '_TRG_Waypoint_Bassist_Start' out = start_node_crc
			endif
			start_pct = 0.75
		endswitch
		momentcamera_playanim anim = drumdroid_standardlp_c01 start_node_crc = <start_node_crc> lock_target = <lock_target_01> cycle = 1 start = <start_pct>
		momentcamera_playanim anim = drumdroid_standardlp_c02 start_node_crc = <start_node_crc> lock_target = <lock_target_02> cycle = 1 start = <start_pct>
	else
	endif
	i = (<i> + 1)
	repeat 4
endscript

script debug_toggle_band_visiblity 
	debug_toggle_character_visiblity \{Name = GUITARIST}
	debug_toggle_character_visiblity \{Name = BASSIST}
	debug_toggle_character_visiblity \{Name = drummer}
	debug_toggle_character_visiblity \{Name = vocalist}
endscript

script debug_toggle_character_visiblity 
	printf channel = AnimInfo qs(0xa418ab1c) a = <Name>
	if NOT GotParam \{Name}
		printf \{channel = AnimInfo
			qs(0x2b50edbe)}
		return
	endif
	switch (<Name>)
		case GUITARIST
		debug_hide = hide_guitarist
		case BASSIST
		debug_hide = hide_bassist
		case vocalist
		debug_hide = hide_vocalist
		case drummer
		debug_hide = hide_drummer
		default
		printf \{channel = AnimInfo
			qs(0x45f3f560)}
		return
	endswitch
	get_musician_id Name = <Name>
	if NOT CompositeObjectExists Name = <Name>
		printf channel = AnimInfo qs(0xd9dcffd1) a = <Name>
		return
	endif
	if ($<debug_hide> = true)
		printf channel = AnimInfo qs(0xfacf2177) a = <Name>
		bandmanager_removecharacter Name = <Name>
		<Name> :Hide
	else
		printf channel = AnimInfo qs(0x758bccc3) a = <Name>
		<Name> :unhide
	endif
endscript

script prepare_band_for_main_menu 
	should_use_alt_positions
	index = 0
	begin
	switch <index>
		case 0
		info_struct = musician1_info
		Name = musician1
		case 1
		info_struct = musician2_info
		Name = musician2
		case 2
		info_struct = musician3_info
		Name = musician3
		case 3
		info_struct = musician4_info
		Name = musician4
	endswitch
	if CompositeObjectExists Name = <Name>
		part = ($<info_struct>.part)
		switch <part>
			case guitar
			Change structurename = <info_struct> anim_set = main_menu_loops_guitarist
			bandmanager_addguitarist Name = <Name>
			case bass
			Change structurename = <info_struct> anim_set = main_menu_loops_bassist
			bandmanager_addbassist Name = <Name>
			case vocals
			Change structurename = <info_struct> anim_set = main_menu_loops_vocalist
			bandmanager_addvocalist Name = <Name>
			default
		endswitch
		<Name> :obj_teleport
	endif
	index = (<index> + 1)
	repeat 4
	bandmanager_updateallanimsets
	bandmanager_allchangestance \{stance = Stance_A}
	band_restartidles
endscript
