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
	intro_anim_name = None
	win_anim_name = None
	lose_anim_name = None
	outro_anim_name = None
	outro_anim_index = 0
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
	intro_anim_name = None
	win_anim_name = None
	lose_anim_name = None
	outro_anim_name = None
	outro_anim_index = 0
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
	intro_anim_name = None
	win_anim_name = None
	lose_anim_name = None
	outro_anim_name = None
	outro_anim_index = 0
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
	intro_anim_name = None
	win_anim_name = None
	lose_anim_name = None
	outro_anim_name = None
	outro_anim_index = 0
	playing_special_anim = FALSE
}

script create_band \{async = 0}
	persistent_band_prepare_for_song async = <async>
	return \{true}
endscript

script set_guitar_string_properties 
endscript

script set_bass_string_properties 
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
endscript

script no_instrument_start_anims 
	bandmanager_addguitarist Name = <Name>
endscript

script temp_hero_pause_script 
	ScriptAssert \{'temp_hero_pause_script: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	<Name> :Obj_KillSpawnedScript Name = preparebandmemberforrenderupdateloop
	<Name> :Obj_SpawnScriptNow preparebandmemberforrenderupdateloop
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
	<Name> :Obj_KillSpawnedScript Name = preparebandmemberforrenderupdateloop
	<Name> :Obj_SpawnScriptNow preparebandmemberforrenderupdateloop
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
	bandmanager_addvocalist Name = <Name>
endscript
use_drummer_events = 0

script drummer_start_anims 
	if ($drumtest = 1 && CompositeObjectExists Name = <Name>)
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
		<Name> :Obj_SpawnScriptNow default_drummer_state params = {BlendDuration = 0.0}
		<Name> :Obj_SpawnScriptNow drummer_transit_idles params = {state = in tap = true}
		default_kit_anims Name = <Name>
	endif
	bandmanager_adddrummer Name = <Name>
endscript

script initial_drummer_anim 
endscript

script hero_play_random_anim \{BlendDuration = 0.2}
	GetArraySize <anims>
	GetRandomValue Name = newindex integer a = 0 b = (<array_Size> - 1)
	anim_name = (<anims> [<newindex>])
	if GotParam \{cycle}
		hero_play_anim anim = <anim_name> BlendDuration = <BlendDuration> cycle
	else
		hero_play_anim anim = <anim_name> BlendDuration = <BlendDuration>
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

script hero_play_adjusting_random_anims \{blend_time = 0.2
		random_start_time = FALSE}
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	count = 0
	begin
	anim = ($<info_struct>.current_anim)
	cycle = ($<info_struct>.cycle_anim)
	repeat_count = ($<info_struct>.anim_repeat_count)
	if (<objID> = GUITARIST || <objID> = BASSIST)
		if (($<info_struct>.disable_arms) = 2)
			if ($<info_struct>.arms_disabled != 2)
				printf channel = AnimInfo qs(0x6c19ede3) a = ($<info_struct>.arms_disabled)
				hero_toggle_arms num_arms = 0 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				Change structurename = <info_struct> arms_disabled = 2
			endif
		elseif (($<info_struct>.disable_arms) = 1)
			if ($<info_struct>.arms_disabled != 1)
				hero_toggle_arms num_arms = 1 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				Change structurename = <info_struct> arms_disabled = 1
			endif
		else
			if ($<info_struct>.arms_disabled != 0)
				hero_toggle_arms num_arms = 2 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				Change structurename = <info_struct> arms_disabled = 0
			endif
		endif
	endif
	if (<objID> = GUITARIST)
		if NOT (<anim> = Idle)
			Change structurename = <info_struct> facial_anim = <anim>
		endif
	endif
	if hero_play_tempo_anim_cfunc anim = <anim> BlendDuration = <blend_time>
		start = 0.0
		if Anim_AnimExists anim = <anim_to_run>
			Anim_GetAnimLength anim = <anim_to_run>
			if (<random_start_time> = true)
				GetRandomValue a = 0.0 b = <length> Name = start
				printf channel = clip qs(0xe9495cae) a = <objID> b = <start> c = <length>
			endif
		else
			printf channel = AnimInfo qs(0xe32a6fe1) a = <anim_to_run>
		endif
		random_start_time = FALSE
		if (($freestyle_in_flow) = 1)
			hero_play_anim anim = <anim_to_run> BlendDuration = <blend_time> UseMotionExtraction = <use_motion_extraction> start = <start> tempomatching = 0
		else
			hero_play_anim anim = <anim_to_run> BlendDuration = <blend_time> UseMotionExtraction = <use_motion_extraction> start = <start>
		endif
		hero_wait_until_anim_finished
		blend_time = 0.2
	else
		WaitOneGameFrame
	endif
	display_debug_info = FALSE
	if (should_display_debug_info)
		display_debug_info = true
	endif
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	next_stance = ($<info_struct>.next_stance)
	stance_changed = FALSE
	if NOT (<next_stance> = <stance>)
		if (<display_debug_info> = true)
			printf channel = AnimInfo qs(0x6ad5be49) c = <objID> a = <stance> b = <next_stance>
		endif
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <stance> new_stance = <next_stance>
			if (($freestyle_in_flow) = 1)
				hero_play_anim anim = <anim_to_run> tempomatching = 0
			else
				hero_play_anim anim = <anim_to_run>
			endif
			hero_wait_until_anim_finished
		endif
		Change structurename = <info_struct> stance = <next_stance>
		stance = <next_stance>
		stance_changed = true
	endif
	next_anim = ($<info_struct>.next_anim)
	if (<next_anim> = None && <stance_changed> = FALSE)
		if (<cycle> = FALSE)
			repeat_count = (<repeat_count> - 1)
			if (<repeat_count> < 1)
				if (<display_debug_info> = true)
					printf channel = AnimInfo qs(0x89bd16bc) a = <objID> b = <anim>
				endif
				repeat_count = 0
			endif
		endif
		Change structurename = <info_struct> anim_repeat_count = <repeat_count>
		if (<cycle> = FALSE && <repeat_count> <= 0)
			Change structurename = <info_struct> current_anim = Idle
			Change structurename = <info_struct> cycle_anim = true
			if (<next_stance> = Intro || <next_stance> = intro_smStg || <next_stance> = stance_frontend || <next_stance> = stance_frontend_guitar)
			else
				Change structurename = <info_struct> disable_arms = 0
			endif
			blend_time = 0.2
			if (<display_debug_info> = true)
				printf channel = AnimInfo qs(0x26553816) a = <objID>
			endif
		else
			blend_time = 0.2
			if (<display_debug_info> = true)
				if (<cycle> = FALSE)
					printf channel = AnimInfo qs(0x7bc6a2eb) c = <anim> a = <objID> b = <repeat_count>
				else
					printf channel = AnimInfo qs(0x71a75032) a = <objID> b = <anim>
				endif
			endif
		endif
	else
		repeat_count = ($<info_struct>.next_anim_repeat_count)
		if ((<display_debug_info> = true) && (<next_anim> != None))
			if (<repeat_count> > 1)
				printf channel = AnimInfo qs(0x34368870) a = <objID> b = <next_anim> c = <repeat_count>
			else
			endif
		endif
		if (<next_anim> = None)
			if (<display_debug_info> = true)
				printf channel = AnimInfo qs(0x26553816) a = <objID>
			endif
			next_anim = Idle
			cycle_next_anim = true
		else
			cycle_next_anim = ($<info_struct>.cycle_next_anim)
		endif
		if (<next_stance> = Intro || <next_stance> = intro_smStg || <next_stance> = stance_frontend || <next_stance> = stance_frontend_guitar)
			disable_arms_next_anim = 2
		else
			disable_arms_next_anim = ($<info_struct>.next_anim_disable_arms)
		endif
		Change structurename = <info_struct> stance = <next_stance>
		Change structurename = <info_struct> current_anim = <next_anim>
		Change structurename = <info_struct> cycle_anim = <cycle_next_anim>
		Change structurename = <info_struct> disable_arms = <disable_arms_next_anim>
		Change structurename = <info_struct> next_anim = None
		Change structurename = <info_struct> cycle_next_anim = true
		Change structurename = <info_struct> anim_repeat_count = <repeat_count>
		Change structurename = <info_struct> next_anim_disable_arms = 0
		blend_time = 0.2
	endif
	repeat
endscript

script crowd_play_adjusting_random_anims \{anim = Idle
		blend_time = 0.2
		startwithnoblend = 0
		playonce = FALSE}
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

script hero_strum_guitar \{note_length = 150}
	hero_strum_guitar_cfunc_setup
	begin
	if hero_strum_guitar_cfunc
		break
	endif
	WaitOneGameFrame
	repeat
	hero_strum_guitar_cfunc_cleanup
endscript

script setup_character_anims 
	RequireParams \{[
			instrument
			Name
			info_struct
		]
		all}
	printf 'setup_character_anims : %n %s' n = <Name> s = <instrument>
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
			printf 'Using anim_set : %s' s = (<anim_struct_member>.anim_set) donotresolve
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
			printf qs(0x01e34256) s = <Name>
			Change structurename = <info_struct> facial_anims = (<anim_struct_member>.facial_anims)
			Change structurename = <info_struct> facial_anims_default = (<anim_struct_member>.facial_anims)
		else
			printf qs(0x578cc9b0) s = <Name>
			Change structurename = <info_struct> facial_anims = None
			Change structurename = <info_struct> facial_anims_default = None
		endif
	endif
	Change structurename = <info_struct> allow_movement = true
	Change structurename = <info_struct> arms_disabled = 0
	Change structurename = <info_struct> disable_arms = 0
	Change structurename = <info_struct> playing_special_anim = FALSE
	Change structurename = <info_struct> next_stance = ($<info_struct>.stance)
endscript

script get_start_node_id \{character = qs(0x5c2c7d0c)}
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

script load_frontend_anim_paks 
	guitar_force_unload_anim_paks
endscript
BandMember_Idle_EventTable = [
	{
		response = call_script
		event = play_anim
		Scr = handle_play_anim
	}
	{
		response = call_script
		event = change_stance
		Scr = handle_change_stance
	}
]

script bandmember_idle \{blend_time = 0.2
		random_start_time = FALSE}
	ResetEventHandlersFromTable \{BandMember_Idle_EventTable
		group = hand_events}
	Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
	Obj_SpawnScriptNow hero_play_adjusting_random_anims params = {anim = Idle blend_time = <blend_time> random_start_time = <random_start_time>}
	Block
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
		printf channel = AnimInfo qs(0x86d9843c) a = <objID> donotresolve
		return
	endif
	if NOT GlobalExists Name = <facial_anims> Type = structure
		printf \{qs(0x989b10a0)}
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
		printf channel = AnimInfo qs(0xab9f8ab8) a = <anim> b = <anim_name> c = <objID> donotresolve
	endif
	Change structurename = <info_struct> facial_anim = Idle
	hero_play_facial_anim anim = <anim_name> BlendDuration = <blend_duration>
	blend_duration = 0
	hero_wait_until_anim_finished \{Timer = FacialTimer}
	WaitOneGameFrame
	repeat
endscript
Guitarist_Idle_EventTable = [
	{
		response = call_script
		event = strum_guitar
		Scr = handle_strum_event
	}
	{
		response = call_script
		event = pose_fret
		Scr = handle_fret_event
	}
	{
		response = call_script
		event = pose_fingers
		Scr = handle_finger_event
	}
	{
		response = call_script
		event = Anim_MissedNote
		Scr = handle_missed_note
	}
	{
		response = call_script
		event = Anim_HitNote
		Scr = handle_hit_note
	}
	{
		response = call_script
		event = play_anim
		Scr = handle_play_anim
	}
	{
		response = call_script
		event = play_battle_anim
		Scr = handle_play_anim
	}
	{
		response = call_script
		event = change_stance
		Scr = handle_change_stance
	}
]

script guitarist_idle \{blend_time = 0.2
		random_start_time = FALSE}
	if ($game_mode = practice)
		return
	endif
	ResetEventHandlersFromTable \{Guitarist_Idle_EventTable
		group = hand_events}
	Obj_GetID
	getplayerinfo \{1
		band_member
		out = p1_character}
	getplayerinfo \{2
		band_member
		out = p2_character}
	if ((<p1_character>) = <objID>)
		SetEventHandler \{response = call_script
			event = star_power_onp1
			Scr = handle_star_power
			group = hand_events}
	else ((<p2_character>) = <objID>)
		SetEventHandler \{response = call_script
			event = star_power_onp2
			Scr = handle_star_power
			group = hand_events}
	endif
	Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
	Obj_SpawnScriptNow hero_play_adjusting_random_anims params = {anim = Idle blend_time = <blend_time> random_start_time = <random_start_time> cycle}
	Block
endscript

script guitarist_idle_animpreview 
	ClearEventHandlerGroup \{hand_events}
endscript
Guitarist_Walking_EventTable = [
	{
		response = call_script
		event = strum_guitar
		Scr = handle_strum_event
	}
	{
		response = call_script
		event = pose_fret
		Scr = handle_fret_event
	}
	{
		response = call_script
		event = pose_fingers
		Scr = handle_finger_event
	}
	{
		response = call_script
		event = Anim_MissedNote
		Scr = handle_missed_note
	}
	{
		response = call_script
		event = Anim_HitNote
		Scr = handle_hit_note
	}
	{
		response = call_script
		event = change_stance
		Scr = queue_change_stance
	}
]

script guitarist_walking 
	ScriptAssert \{'guitarist_walking: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script play_special_anim \{stance = Stance_A
		disable_arms = 2
		BlendDuration = 0.2}
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	ClearEventHandlerGroup \{hand_events}
	if GotParam \{respond_to_hand_events}
		ResetEventHandlersFromTable \{Guitarist_Walking_EventTable
			group = hand_events}
	else
		SetEventHandler \{response = call_script
			event = change_stance
			Scr = queue_change_stance
			group = hand_events}
	endif
	Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
	if GotParam \{Wait}
		hero_wait_until_anim_finished
	endif
	if (<disable_arms> = 0)
		if (<info_struct>.arms_disabled = 2)
			hero_toggle_arms \{prev_num_arms = 0
				num_arms = 2}
			Change structurename = <info_struct> arms_disabled = 0
			Change structurename = <info_struct> disable_arms = 0
			Change structurename = <info_struct> next_anim_disable_arms = 0
			Change structurename = <info_struct> current_anim = Idle
			Change structurename = <info_struct> cycle_anim = Idle
			Change structurename = <info_struct> next_anim = Idle
			Change structurename = <info_struct> cycle_next_anim = true
		endif
	endif
	if (<disable_arms> = 2)
		if (<objID> = GUITARIST || <objID> = BASSIST || <objID> = drummer)
			hero_disable_arms \{blend_time = 0.0}
		endif
	endif
	Change structurename = <info_struct> stance = <stance>
	if hero_play_tempo_anim_cfunc anim = <anim> BlendDuration = <BlendDuration>
		if NOT (<unique_id> = None)
			Change winlose_sfx_unique_id = <unique_id>
			Change \{winlose_sfx_loaded = 1}
		endif
		hero_play_anim anim = <anim_to_run> BlendDuration = <blend_duration> UseMotionExtraction = <use_motion_extraction>
	endif
	if (<objID> = GUITARIST || <objID> = BASSIST)
		if (<disable_arms> = 2)
			hero_wait_until_anim_near_end \{time_from_end = 0.25}
			hero_enable_arms \{blend_time = 0.25}
		endif
	endif
	hero_wait_until_anim_finished
	Change structurename = <info_struct> stance = Stance_A
	if (<objID> = GUITARIST || <objID> = BASSIST)
		Obj_SwitchScript \{guitarist_idle}
	else
		Obj_SwitchScript \{bandmember_idle}
	endif
endscript

script play_simple_anim \{disable_arms = 2
		BlendDuration = 0.0
		blendoutduration = 0.2
		start = 0.0
		end = 0.0}
	ScriptAssert \{'play_simple_anim: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script handle_star_power 
	return
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	if NOT (<objID> = GUITARIST || <objID> = BASSIST)
		return
	endif
	Change structurename = <info_struct> waiting_for_cameracut = true
	begin
	if ($<info_struct>.waiting_for_cameracut = FALSE)
		break
	endif
	WaitOneGameFrame
	repeat
	Obj_SwitchScript \{play_special_anim
		params = {
			stance = Stance_A
			anim = starpower
			BlendDuration = 0.0
			disable_arms = 0
			respond_to_hand_events = 1
		}}
endscript

script handle_song_won 
	ScriptAssert \{'handle_song_won: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script handle_song_failed 
	ScriptAssert \{'handle_song_failed: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
band_character_names = [
	musician1
	musician2
	musician3
	musician4
]

script play_intro_anims 
	bandmanager_turnoffallarmanims
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
				printf channel = AnimInfo 'Playing %a on %b' a = ($<info_struct>.intro_anim_name) b = <checksum> donotresolve
			else
				printf channel = AnimInfo 'intro anim not set on character %a' a = <checksum>
			endif
		else
		endif
	endif
endscript

script UseSmallVenueAnims 
	ScriptAssert \{'UseSmallVenueAnims: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script play_win_anims 
	KillSpawnedScript \{Name = return_characters_to_idle_at_song_time}
	bandmanager_turnoffallarmanims
	if NOT ($game_mode = p2_pro_faceoff || $game_mode = p2_roadie_battle)
		ForEachIn \{$band_character_names
			do = play_win_anims_foreach}
		return
	endif
	p1_won = true
	getplayerinfo \{1
		score
		out = score1}
	getplayerinfo \{2
		score
		out = score2}
	if (<score2> > <score1>)
		p1_won = FALSE
	endif
	getplayerinfo \{1
		band_member
		out = p1_character}
	getplayerinfo \{2
		band_member
		out = p2_character}
	if (<p1_won> = true)
		play_win_anims_foreach checksum = <p1_character>
		play_lose_anims_foreach checksum = <p2_character>
	else
		play_lose_anims_foreach checksum = <p1_character>
		play_win_anims_foreach checksum = <p2_character>
	endif
	if NOT (<p1_character> = vocalist || <p1_character> = vocalist2)
		play_win_anims_foreach \{checksum = vocalist}
	endif
	if NOT (<p1_character> = drummer || <p1_character> = drummer2)
		play_win_anims_foreach \{checksum = drummer}
	else
		<p1_character> :Anim_Command target = faceoff_blend Command = partialswitch_setstate params = {OFF BlendDuration = 0.1}
	endif
	if (<p2_character> = drummer || <p2_character> = drummer2)
		<p2_character> :Anim_Command target = faceoff_blend Command = partialswitch_setstate params = {OFF BlendDuration = 0.1}
	endif
endscript

script play_win_anims_foreach 
	if CompositeObjectExists Name = <checksum>
		ExtendCrc <checksum> '_Info' out = info_struct
		band_changefacialanims Name = <band_member>
		win_anim = ($<info_struct>.win_anim_name)
		if (<win_anim> != None)
			band_movetostartnode Name = <checksum>
			bandmanager_changeik Name = <checksum> Enabled = FALSE
			Band_PlaySimpleAnim {Name = <checksum> anim = <win_anim> BlendDuration = 0.3}
			printf channel = AnimInfo 'Playing %a on %b' a = <win_anim> b = <checksum> donotresolve
		else
			printf channel = AnimInfo qs(0x553d6959) a = <checksum>
		endif
	endif
endscript

script play_lose_anims 
	KillSpawnedScript \{Name = return_characters_to_idle_at_song_time}
	band_showmic_stand \{Name = vocalist}
	bandmanager_turnoffallarmanims
	if NOT ($game_mode = p2_pro_faceoff || $game_mode = p2_roadie_battle)
		ForEachIn \{$band_character_names
			do = play_lose_anims_foreach}
		return
	endif
	printf \{channel = AnimInfo
		qs(0x1c24c037)}
	p1_won = true
	getplayerinfo \{1
		score
		out = score1}
	getplayerinfo \{2
		score
		out = score2}
	if (<score2> > <score1>)
		p1_won = FALSE
	endif
	getplayerinfo \{1
		band_member
		out = p1_character}
	getplayerinfo \{2
		band_member
		out = p2_character}
	if (<p1_won> = true)
		play_win_anims_foreach checksum = <p1_character>
		play_lose_anims_foreach checksum = <p2_character>
	else
		play_win_anims_foreach checksum = <p2_character>
		play_lose_anims_foreach checksum = <p1_character>
	endif
	if NOT (<p1_character> = vocalist || <p1_character> = vocalist2)
		play_lose_anims_foreach \{checksum = vocalist}
	endif
	if NOT (<p1_character> = drummer || <p1_character> = drummer2)
		play_lose_anims_foreach \{checksum = drummer}
	else
		<p1_character> :Anim_Command target = faceoff_blend Command = partialswitch_setstate params = {OFF BlendDuration = 0.1}
	endif
	if (<p2_character> = drummer || <p2_character> = drummer2)
		<p2_character> :Anim_Command target = faceoff_blend Command = partialswitch_setstate params = {OFF BlendDuration = 0.1}
	endif
endscript

script play_lose_anims_foreach 
	if CompositeObjectExists Name = <checksum>
		ExtendCrc <checksum> '_Info' out = info_struct
		lose_anim = ($<info_struct>.lose_anim_name)
		band_changefacialanims Name = <band_member>
		if (<lose_anim> != None)
			band_movetostartnode Name = <checksum>
			bandmanager_changeik Name = <checksum> Enabled = FALSE
			Band_PlaySimpleAnim {Name = <checksum> anim = <lose_anim> BlendDuration = 0.3}
			printf channel = AnimInfo 'Playing %a on %b' a = <lose_anim> b = <checksum> donotresolve
		else
			printf channel = AnimInfo qs(0x283913b7) a = <checksum>
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
	getplayerinfo (<order> [<order_idx>].player_num) character_id
	getplayerinfo (<order> [<order_idx>].player_num) character_savegame
	getplayerinfo (<order> [<order_idx>].player_num) band_member
	characterprofilegetstruct Name = <character_id> savegame = <character_savegame>
	ExtendCrc <band_member> '_Info' out = info_struct
	begin
	anim = ($<info_struct>.outro_anim_name)
	anim_index = ($<info_struct>.outro_anim_index)
	song_outro_get_random_camera_for_anim part = <part> anim_index = <anim_index>
	if NOT ((GotParam cam) || (GotParam cam_index) || (GotParam cam_initial_speed))
		ScriptAssert \{qs(0x0f075f55)}
	endif
	break
	repeat
	getplayerinfo (<order> [<order_idx>].player_num) band_member
	if CompositeObjectExists Name = <band_member>
		ExtendCrc <band_member> '_Info' out = info_struct
		band_movetostartnode Name = <band_member>
		band_changefacialanims Name = <band_member>
		if (<anim> != None)
			SpawnScriptNow \{playcamerawinsfx}
			bandmanager_changeik Name = <band_member> Enabled = FALSE
			Band_PlaySimpleAnim {Name = <band_member> anim = <anim> BlendDuration = 0.3}
			getstartnodeid member = <band_member>
			GetWaypointPos Name = <waypoint_id>
			GetWaypointDir Name = <waypoint_id>
			moment_cam_lock_target_01 :Obj_SetPosition position = <Pos>
			moment_cam_lock_target_01 :Obj_SetOrientation Dir = <Dir>
			Change g_song_outro_anims_current_player = (<order> [<order_idx>].player_num)
			chain_part = slave
			band_setikchain Name = <band_member> Chain = <chain_part>
			Change g_song_outro_anims_initial_speed = <cam_initial_speed>
			setslomo <cam_initial_speed>
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
	if (<array_Size> > 0)
		i = 0
		begin
		if (<anim_cam_pair_array> [<i>].part = <part>)
			if ((<anim_cam_pair_array> [<i>].anim = <anim_index>) && (<anim_cam_pair_array> [<i>].cam = <cam_index>))
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
			percent_notes_hit = 0
			getplayerinfo <Player> part
			if (<part> = vocals)
				getplayerinfo <Player> vocal_phrase_quality
				getplayerinfo <Player> vocal_phrase_max_qual
				if (<vocal_phrase_max_qual> > 0.1)
					percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
				else
					<percent_notes_hit> = 0
				endif
				if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
					<percent_notes_hit> = 1
				endif
			else
				getplayerinfo <Player> notes_hit
				getplayerinfo <Player> max_notes
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

script manual_trigger_song_outro_anims_display_stats 
	Wait \{0.76666
		Seconds}
	song_outro_anims_display_stats \{parent = song_outro_anims_container
		stats_display_secs = 2.0
		slomo_speed = 0.1}
endscript

script song_outro_anims_display_stats 
	printf \{qs(0xe991899a)}
	RequireParams \{[
			parent
			stats_display_secs
			slomo_speed
		]
		all}
	KillSpawnedScript \{Name = song_outro_anims_display_stats_spawned}
	SpawnScriptNow song_outro_anims_display_stats_spawned params = {parent = <parent> stats_display_secs = <stats_display_secs> slomo_speed = <slomo_speed>}
endscript

script song_outro_anims_display_stats_spawned 
	RequireParams \{[
			parent
			stats_display_secs
			slomo_speed
		]
		all}
	Player = ($g_song_outro_anims_current_player)
	ui_song_breakdown_get_player_display_name player_index = <Player>
	name_text = <player_name_text>
	getplayerinfo <Player> part
	getplayerinfo <Player> difficulty
	percent_container_alpha = 1
	percent_stacker_pos = (0.0, 0.0)
	if NOT (<part> = vocals)
		getplayerinfo <Player> best_run
		getplayerinfo <Player> max_notes
		getplayerinfo <Player> notes_hit
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		if (<percent_notes_hit> = 0 && <notes_hit> > 0)
			percent_notes_hit = 1
		endif
		formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit>
		formatText TextName = streak_text qs(0x8c5c152d) n = <best_run> DecimalPlaces = 0
		formatText \{TextName = streak_unit_text
			qs(0x6036c2d7)}
	else
		getplayerinfo <Player> vocal_streak_phrases
		getplayerinfo <Player> vocal_phrase_quality
		getplayerinfo <Player> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			MathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				percent_notes_hit = 1
			endif
			formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit> DecimalPlaces = 0
		else
			<percent_text> = qs(0x6a5cf46c)
			<percent_container_alpha> = 0
			<percent_stacker_pos> = (25.0, 0.0)
		endif
		formatText TextName = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> DecimalPlaces = 0
		formatText \{TextName = streak_unit_text
			qs(0x4ac2a4de)}
	endif
	switch (<part>)
		case guitar
		icon_texture = mixer_icon_guitar
		case bass
		icon_texture = mixer_icon_bass
		case drum
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
		if (<part> = drum)
			getplayerinfo <Player> double_kick_drum
			if (<double_kick_drum> = 1)
				diff_texture = icon_difficulty_expert_plus
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
		<id> :se_setprops {
			Pos = (-10.0, -10.0)
			alpha = 1
			time = 0.2
			anim = ease_out
		}
	endif
	Wait <stats_display_secs> Seconds ignoreslomo
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
	setslomo ($g_song_outro_anims_initial_speed)
endscript

script song_outro_anims_skip_anims 
	KillSpawnedScript \{Name = reset_ragdoll_hack_for_playday}
	if ScreenElementExists id = <start_skip_id>
		DestroyScreenElement id = <start_skip_id>
	endif
	clean_up_user_control_helpers
	Change \{g_song_outro_anims_initial_speed = 1.0}
	setslomo ($g_song_outro_anims_initial_speed)
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_no_band'
		changenow
		transition_time = 5}
	restore_idle_faces
	SpawnScriptNow \{id = not_transitions
		Transition_KillAll}
endscript

script restore_idle_faces 
	if CompositeObjectExists \{Name = musician1}
		musician1 :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		musician1 :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{Name = musician2}
		musician2 :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		musician2 :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{Name = musician3}
		musician3 :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		musician3 :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{Name = musician4}
		musician4 :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		musician4 :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
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
		musician1 :unhide
	endif
	if CompositeObjectExists \{musician2}
		musician2 :unhide
	endif
	if CompositeObjectExists \{musician3}
		musician3 :unhide
	endif
	if CompositeObjectExists \{musician4}
		musician4 :unhide
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
	printf \{channel = Band
		qs(0xd3661dee)}
	i = 1
	begin
	formatText checksumName = info_struct 'musician%a_info' a = <i>
	if ($<info_struct>.part = drum)
		formatText checksumName = lock_target_01 'musician%a_mocap_lock_target_01' a = <i>
		formatText checksumName = lock_target_02 'musician%a_mocap_lock_target_02' a = <i>
		start = 0.0
		position = ($<info_struct>.position)
		switch <position>
			case vocalist
			start_node = '_TRG_Waypoint_Vocalist_Start'
			start_pct = 0.5
			case drummer
			start_node = '_TRG_Waypoint_Drummer_Start'
			start_pct = 0.0
			case GUITARIST
			start_node = '_TRG_Waypoint_Guitarist_Start'
			start_pct = 0.25
			case BASSIST
			start_node = '_TRG_Waypoint_Bassist_Start'
			start_pct = 0.75
		endswitch
		printf qs(0x97a15241) a = <i> b = <lock_target_01>
		momentcamera_playanim anim = drumdroid_standardlp_c01 start_node = <start_node> lock_target = <lock_target_01> cycle = 1 start = <start_pct>
		momentcamera_playanim anim = drumdroid_standardlp_c02 start_node = <start_node> lock_target = <lock_target_02> cycle = 1 start = <start_pct>
	else
		printf qs(0x173efbf1) a = (<i> + 1)
	endif
	i = (<i> + 1)
	repeat 4
endscript

script preparebandmemberforrenderupdateloop 
	begin
	bandmanager_preparebandforrender
	Wait \{1
		gameframe}
	repeat
endscript

script all_players_using_starpower 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if playerinfoequals <Player> star_power_used = 0
			return \{FALSE}
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return \{true}
endscript
playing_group_starpower_anim = FALSE

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

script kill_group_starpower_anim \{changecamera = 1}
	if ($playing_group_starpower_anim = FALSE)
		return
	endif
	KillSpawnedScript \{Name = play_group_star_power_animation}
	if (<changecamera> = 1)
		CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	endif
	Change \{CameraCuts_AllowNoteScripts = true}
	Change \{playing_group_starpower_anim = FALSE}
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

script is_head_to_head_mode 
	switch $game_mode
		case p2_pro_faceoff
		return \{true}
	endswitch
	return \{FALSE}
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
	decompressnotevalue note_value = ($<event_array> [(<next_array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		switch (<note>)
			case 73
			Name = kick
			value = 0
			case 74
			Name = t3
			value = 7
			case 75
			Name = t2
			value = 5
			case 76
			Name = t1
			value = 4
			case 77
			Name = s1
			value = 1
			case 78
			Name = h1c
			value = 2
			case 79
			Name = h1o
			value = 2
			case 80
			Name = c3
			value = 8
			case 81
			Name = c1
			value = 3
			case 82
			Name = c2
			value = 6
			case 83
			Name = countin
			value = 0
		endswitch
		AddArrayElement array = <piece_array> element = <Name>
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

script drumcontrolscript_iterator 
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
	gman_songtool_getcurrentsong
	get_song_prefix song = <current_song>
	formatText checksumName = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists Name = <event_array> Type = array
		printf \{channel = mydebug
			qs(0xce6b470a)}
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	note_array_size = <array_Size>
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
	Wait \{1
		gameframe}
	repeat
	current_time = 0
	if CompositeObjectExists \{Name = musician2}
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
	Wait \{1
		gameframe}
	repeat
	TimeMarkerReached_ClearParams
	current_time = ($<event_array> [<array_entry>])
	decompressnotevalue note_value = ($<event_array> [(<array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		build_notehit_data <...>
		if CompositeObjectExists \{Name = musician2}
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
	animinfo_getallactivevaluesources
	<control_script> hit_info = <hit_info> <...>
	AnimPreview_SetSourceValues <...>
endscript

script prepare_band_for_main_menu 
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
		case drummer
		Change structurename = <info_struct> anim_set = main_menu_loops_drummer
		bandmanager_adddrummer Name = <Name>
		default
	endswitch
	if <Name> :Anim_AnimNodeExists id = moment_blend
		<Name> :Anim_Command target = moment_bend Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
	endif
	if <Name> :Anim_AnimNodeExists id = BodyTimer
		<Name> :Anim_Command target = BodyTimer Command = tempomatch_unpause
	endif
	index = (<index> + 1)
	repeat 4
	bandmanager_updateallanimsets
	bandmanager_allchangestance \{stance = Stance_A}
	band_restartidles
endscript
