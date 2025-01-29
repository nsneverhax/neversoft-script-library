
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
			stance = stance_frontend
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
	<Name> :GetSingleTag is_female
	<Name> :GetSingleTag large_hands
	if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		if NOT GotParam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> member = FrontEnd
			if NOT StructureContains structure = <anim_struct_member> finger_anims
				use_default_finger_fret_strum = 1
			endif
		endif
		if ((<instrument> = guitar) || (<instrument> = bass))
			use_default_finger_fret_strum = 1
		endif
		if StructureContains structure = <anim_struct_member> anim_set
			Change structurename = <info_struct> anim_set = (<anim_struct_member>.anim_set)
		else
			if (<is_female> = 1)
				Change structurename = <info_struct> anim_set = car_female_animations
			else
				Change structurename = <info_struct> anim_set = car_male_animations
			endif
		endif
		if GotParam \{use_default_finger_fret_strum}
			if (<is_female> = 1)
				Change structurename = <info_struct> finger_anims = guitarist_finger_anims_car_female
				Change structurename = <info_struct> fret_anims = fret_anims_rocker
				Change structurename = <info_struct> strum = car_female_normal
			else
				Change structurename = <info_struct> finger_anims = guitarist_finger_anims_car_male
				Change structurename = <info_struct> fret_anims = fret_anims_rocker
				Change structurename = <info_struct> strum = car_male_normal
			endif
		endif
		if StructureContains structure = <anim_struct_member> facial_anims
			Change structurename = <info_struct> facial_anims = (<anim_struct_member>.facial_anims)
			Change structurename = <info_struct> facial_anims_default = (<anim_struct_member>.facial_anims)
		else
			if (<is_female> = 1)
				Change structurename = <info_struct> facial_anims = facial_anims_female_rocker
				Change structurename = <info_struct> facial_anims_default = facial_anims_female_rocker
			else
				Change structurename = <info_struct> facial_anims = facial_anims_male_rocker
				Change structurename = <info_struct> facial_anims_default = facial_anims_male_rocker
			endif
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

script play_special_facial_anim 
	if NOT GotParam \{anim}
		return
	endif
	Obj_KillSpawnedScript \{Name = facial_anim_loop}
	Obj_GetID
	hero_play_facial_anim anim = <anim>
	hero_wait_until_anim_finished \{Timer = FacialTimer}
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
		return
	endif
	if NOT StructureContains structure = $<facial_anims> Name = Idle
		return
	endif
	begin
	anim = ($<info_struct>.facial_anim)
	if NOT StructureContains structure = $<facial_anims> Name = <anim>
		if ($display_facial_anim_info = true)
		endif
		anim = Idle
	endif
	anims = ($<facial_anims>.<anim>)
	GetArraySize <anims>
	GetRandomValue Name = index integer a = 0 b = (<array_Size> - 1)
	anim_name = (<anims> [<index>])
	if ($display_facial_anim_info = true)
	endif
	Change structurename = <info_struct> facial_anim = Idle
	hero_play_facial_anim anim = <anim_name> BlendDuration = <blend_duration>
	blend_duration = 0
	hero_wait_until_anim_finished \{Timer = FacialTimer}
	WaitOneGameFrame
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
		endif
	endif
endscript

script play_win_anims 
	KillSpawnedScript \{Name = return_characters_to_idle_at_song_time}
	bandmanager_unhideallinstruments
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
	gamemode_gettype
	if (<Type> = career)
		if quest_progression_is_chapter_finale
			<first> = ($quest_chapter_finale.songs [0])
			<Second> = ($quest_chapter_finale.songs [1])
			<third> = ($quest_chapter_finale.songs [2])
			playlist_getcurrentsong
			switch <current_song>
				case <first>
				SpawnScriptNow \{z_finalbattle_play_ampzilla_attack1
					id = transitions}
				SpawnScriptNow \{z_finalbattle_lose_anim_fade_to_black_attack1
					id = transitions}
				case <Second>
				SpawnScriptNow \{z_finalbattle_play_ampzilla_attack2
					id = transitions}
				SpawnScriptNow \{z_finalbattle_lose_anim_fade_to_black_attack2
					id = transitions}
				case <third>
				SpawnScriptNow \{z_finalbattle_play_ampzilla_attack3
					id = transitions}
				SpawnScriptNow \{z_finalbattle_lose_anim_fade_to_black_attack3
					id = transitions}
				disable_lose_anims = 1
			endswitch
			return
		endif
	endif
	band_showmic_stand \{Name = vocalist}
	bandmanager_unhideallinstruments
	KillSpawnedScript \{Name = return_characters_to_idle_at_song_time}
	if NOT GotParam \{disable_lose_anims}
		GetArraySize \{$band_character_names}
		i = 0
		begin
		Name = ($band_character_names [<i>])
		SpawnScriptNow play_lose_anims_foreach params = {checksum = <Name>}
		i = (<i> + 1)
		repeat <array_Size>
	endif
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

script play_lose_camera 
	gamemode_gettype
	if (<Type> = career)
		if quest_progression_is_chapter_finale
			Transition_CameraCut \{prefix = 'cameras_moments'
				changenow
				Name = moment01}
			return
		endif
	endif
	Transition_CameraCut prefix = 'cameras_lose' transition_time = <transition_time> changenow
endscript

script Hide_Band 
	if CompositeObjectExists \{musician1}
		band_hide \{Name = musician1}
	endif
	if CompositeObjectExists \{musician2}
		band_hide \{Name = musician2}
	endif
	if CompositeObjectExists \{musician3}
		band_hide \{Name = musician3}
	endif
	if CompositeObjectExists \{musician4}
		band_hide \{Name = musician4}
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

script hide_mic_if_not_vocalist \{Name = !q1768515945}
	if CompositeObjectExists Name = <Name>
		<Name> :GetSingleTag instrument
		if (<instrument> != vocals)
			<Name> :hide_mic
		endif
	endif
endscript

script unhide_mic_if_vocalist \{Name = !q1768515945}
	if CompositeObjectExists Name = <Name>
		<Name> :GetSingleTag instrument
		if (<instrument> = vocals)
			<Name> :show_mic
		endif
	endif
endscript

script reset_stances_for_frontend 
	Change \{structurename = musician1_info
		stance = stance_old}
	Change \{structurename = musician1_info
		next_stance = stance_frontend}
	Change \{structurename = musician1_info
		current_anim = Idle}
	Change \{structurename = musician1_info
		cycle_anim = true}
	Change \{structurename = musician1_info
		next_anim = None}
	Change \{structurename = musician1_info
		playing_missed_note = FALSE}
	Change \{structurename = musician2_info
		stance = stance_old}
	Change \{structurename = musician2_info
		next_stance = stance_frontend}
	Change \{structurename = musician2_info
		current_anim = Idle}
	Change \{structurename = musician2_info
		cycle_anim = true}
	Change \{structurename = musician2_info
		next_anim = None}
	Change \{structurename = musician2_info
		playing_missed_note = FALSE}
	Change \{structurename = musician3_info
		stance = stance_old}
	Change \{structurename = musician3_info
		next_stance = stance_frontend}
	Change \{structurename = musician3_info
		current_anim = Idle}
	Change \{structurename = musician3_info
		cycle_anim = true}
	Change \{structurename = musician3_info
		next_anim = None}
	Change \{structurename = musician3_info
		playing_missed_note = FALSE}
	Change \{structurename = musician4_info
		stance = stance_old}
	Change \{structurename = musician4_info
		next_stance = stance_frontend}
	Change \{structurename = musician4_info
		current_anim = Idle}
	Change \{structurename = musician4_info
		cycle_anim = true}
	Change \{structurename = musician4_info
		next_anim = None}
	Change \{structurename = musician4_info
		playing_missed_note = FALSE}
endscript
