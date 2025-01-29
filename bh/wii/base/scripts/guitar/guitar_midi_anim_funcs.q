vv_loseanimparams = {
	clip = generic_lose
}
vv_winanimparams = {
	clip = generic_win
}
vv_introanimparams = {
	clip = generic_intro
}

script transition_playsimpleanim 
	Band_PlaySimpleAnim <...>
endscript

script play_facial_anim_on_character \{Name = GUITARIST}
	if CompositeObjectExists Name = <Name>
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = <anim>}
	endif
endscript

script Band_PlayFacialAnim \{Name = GUITARIST}
	if GotParam \{Name}
		if (<Name> = vocalist)
			i = 0
			begin
			switch <i>
				case 0
				musician = musician1
				info_struct = musician1_info
				case 1
				musician = musician2
				info_struct = musician2_info
				case 2
				musician = musician3
				info_struct = musician3_info
				case 3
				musician = musician4
				info_struct = musician4_info
			endswitch
			if ((($<info_struct>.position) = vocalist) || (($<info_struct>.part) = vocals))
				play_facial_anim_on_character Name = <musician> anim = <anim>
			endif
			i = (<i> + 1)
			repeat 4
		else
			get_musician_id Name = <Name>
			ExtendCrc <Name> '_info' out = info_struct
			if (($<info_struct>.part) != vocals)
				play_facial_anim_on_character Name = <Name> anim = <anim>
			endif
		endif
	elseif GotParam \{part}
		i = 0
		begin
		switch <i>
			case 0
			musician = musician1
			info_struct = musician1_info
			case 1
			musician = musician2
			info_struct = musician2_info
			case 2
			musician = musician3
			info_struct = musician3_info
			case 3
			musician = musician4
			info_struct = musician4_info
		endswitch
		if (($<info_stuct>.part) = <part>)
			play_facial_anim_on_character Name = <musician> anim = <anim>
		endif
		i = (<i> + 1)
		repeat 4
	endif
endscript

script band_playrockinfacialanim \{Name = GUITARIST}
	get_musician_id Name = <Name>
	if CompositeObjectExists Name = <Name>
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		if band_isfemale Name = <Name>
			printf \{qs(0xc85f8d07)}
			<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = gh_rocker_female_hardrockface_4}
		else
			printf \{qs(0xeda94c27)}
			<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = gh_rocker_male_hardrockface_4}
		endif
	endif
endscript

script band_changefacialanims \{Name = GUITARIST
		blend_duration = 0.3}
	original_name = <Name>
	get_musician_id Name = <Name>
	ExtendCrc <Name> '_Info' out = info_struct
	switch <original_name>
		case GUITARIST
		case BASSIST
		case drummer
		if ($<info_struct>.part = vocals)
			return
		endif
	endswitch
	printf \{qs(0x940afbfa)
		channel = AnimInfo}
	if CompositeObjectExists Name = <Name>
		printf \{qs(0x85140bfa)
			channel = AnimInfo}
		ExtendCrc <Name> '_Info' out = info_struct
		if ((GotParam ff_anims) || (GotParam mf_anims))
			if band_isfemale Name = <Name>
				printf \{qs(0xc85f8d07)
					channel = AnimInfo}
				Change structurename = <info_struct> facial_anims = <ff_anims>
			else
				printf \{qs(0xeda94c27)
					channel = AnimInfo}
				Change structurename = <info_struct> facial_anims = <mf_anims>
			endif
		else
			fa_default = ($<info_struct>.facial_anims_default)
			if GotParam \{fa_type}
				ExtendCrc <fa_default> <fa_type> out = fa_anims
				printf qs(0x3bb16ef0) a = <fa_anims> channel = AnimInfo
			else
				fa_anims = <fa_default>
			endif
			printf qs(0x2e7a2b8a) a = <fa_anims>
			Change structurename = <info_struct> facial_anims = <fa_anims>
		endif
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_KillSpawnedScript Name = facial_anim_loop
		<Name> :Obj_SpawnScriptNow facial_anim_loop params = {blend_duration = <blend_duration>}
	else
		printf qs(0x7eb6ba00) a = <Name> channel = AnimInfo
	endif
endscript

script ae_changefacialanims \{ff_anims = facial_anims_female_rocker
		mf_anims = facial_anims_male_rocker
		blend_duration = 0.3}
	Obj_GetID
	band_changefacialanims Name = <objID> ff_anims = <ff_anims> mf_anims = <mf_anims> blend_duration = <blend_duration>
endscript

script Band_StopStrumming \{Name = GUITARIST}
	Band_SetStrumStyle Name = <Name> male_type = None female_type = None
endscript

script band_enableautostrums 
	band_enableautostrums_cfunc Name = <Name>
endscript

script band_disableautostrums 
	band_disableautostrums_cfunc Name = <Name>
endscript

script band_enableautofret 
	band_enableautofret_cfunc Name = <Name>
endscript

script band_disableautofret 
	band_disableautofret_cfunc Name = <Name>
endscript

script band_enableautochords 
	band_enableautochords_cfunc Name = <Name>
endscript

script band_disableautochords 
	band_disableautochords_cfunc Name = <Name>
endscript

script band_setikchain 
	if (<Chain> = guitar)
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Guitar_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Guitar_L
		band_enableautofret Name = <Name>
		band_enableautochords Name = <Name>
		band_enableautostrums Name = <Name>
	elseif (<Chain> = slave)
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Slave_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Slave_L
		band_disableautofret Name = <Name>
		band_disableautochords Name = <Name>
		band_disableautostrums Name = <Name>
	else
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Slave_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Slave_L
		band_disableautofret Name = <Name>
		band_disableautochords Name = <Name>
		band_disableautostrums Name = <Name>
	endif
endscript

script ae_setik_guitarl_off 
	Obj_GetID
	band_disableautochords Name = <objID>
endscript

script ae_setik_guitarr_off 
	Obj_GetID
	band_disableautostrums Name = <objID>
endscript

script ae_setik_slavel_off 
endscript

script ae_setik_slaver_off 
endscript

script ae_setik_guitarl_on 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 1 target = Bone_IK_Hand_Guitar_L BlendDuration = 0.3
	band_enableautochords Name = <objID>
endscript

script ae_setik_guitarr_on 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 0 target = Bone_IK_Hand_Guitar_R BlendDuration = 0.3
	band_enableautostrums Name = <objID>
endscript

script ae_setik_slavel_on 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 1 target = Bone_IK_Hand_Slave_L BlendDuration = 0.3
	band_disableautochords Name = <objID>
endscript

script ae_setik_slaver_on 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 0 target = Bone_IK_Hand_Slave_R BlendDuration = 0.3
	band_disableautostrums Name = <objID>
endscript

script ae_setik_to_fk_l 
	Obj_GetID
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Guitar_L Strength = 0
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Slave_L Strength = 0
endscript

script ae_setik_to_fk_r 
	Obj_GetID
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Guitar_R Strength = 0
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Slave_R Strength = 0
endscript

script ae_setik_to_ik_l 
	Obj_GetID
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Guitar_L Strength = 1
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Slave_L Strength = 1
endscript

script ae_setik_to_ik_r 
	Obj_GetID
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Guitar_R Strength = 1
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Slave_R Strength = 1
endscript

script ae_disableautofret 
	Obj_GetID
	band_disableautofret Name = <objID>
endscript

script ae_enableautofret 
	Obj_GetID
	band_enableautofret Name = <objID>
endscript

script ik_fk_switch_override 
	gman_songtool_getcurrentsong
	if (<current_song> = bandontherun)
		return
	endif
	ae_setik_slaver_on
endscript

script band_setikchaintarget \{BlendDuration = 0.0}
	if 0x1469760b
		return
	endif
	band_setikchaintarget_cfunc Name = <Name> target = <target> index = <index> BlendDuration = <BlendDuration>
endscript

script band_movetonode \{allow_in_2player = FALSE}
	if NOT (songhasmoments)
		return
	endif
	if ($game_mode = practice)
		return
	endif
	getnumplayersingame
	if (<num_players> = 2)
		if (<allow_in_2player> = FALSE)
			return
		endif
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	char_name = <Name>
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	formatText TextName = suffix '_TRG_Waypoint_%a' a = <node>
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	waypoint_id = <appended_id>
	if GotParam \{node}
		GetWaypointPos Name = <appended_id>
		GetWaypointDir Name = <appended_id>
		if GlobalExists Name = <info_struct>
			Change structurename = <info_struct> target_node = <appended_id>
		endif
	else
		printf \{qs(0x391cb0aa)}
		return
	endif
	<char_name> :Obj_SetPosition position = <Pos>
	<char_name> :Obj_SetOrientation Dir = <Dir>
endscript

script band_movetostartnode \{allow_in_2player = FALSE}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	get_musician_id Name = <Name>
	getstartnodeid member = <Name>
	GetWaypointPos Name = <waypoint_id>
	GetWaypointDir Name = <waypoint_id>
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> target_node = <waypoint_id>
	<Name> :Obj_SetPosition position = <Pos>
	<Name> :Obj_SetOrientation Dir = <Dir>
endscript

script band_restartidles 
	bandmanager_playidle \{Name = musician1
		all_modes = true
		restart}
	bandmanager_playidle \{Name = musician2
		all_modes = true
		restart}
	bandmanager_playidle \{Name = musician3
		all_modes = true
		restart}
	bandmanager_playidle \{Name = musician4
		all_modes = true
		restart}
endscript

script band_playtransitionidles 
	printf \{channel = pop
		qs(0xf9078adf)}
	gman_songtool_getcurrentsong
	band_builder_get_band_global song = <current_song>
	band_restartidles
	if has_singing_guitarist <...>
		band_playclip \{clip = song_loading_singing_guitarist
			no_wait
			allgamemodes}
	elseif has_singing_bassist <...>
		band_playclip \{clip = song_loading_singing_guitarist
			no_wait
			allgamemodes}
	else
		band_playclip \{clip = song_loading
			no_wait
			allgamemodes}
	endif
	bandmanager_turnoffallarmanims
	Wait \{4
		gameframes}
	bandmanager_setplayingintroanims
endscript

script bandmanager_turnonarmanims 
	band_enableautostrums Name = <Name>
	band_enableautofret Name = <Name>
	band_enableautochords Name = <Name>
endscript

script bandmanager_turnoffarmanims 
	band_disableautostrums Name = <Name>
	band_disableautofret Name = <Name>
	band_disableautochords Name = <Name>
endscript

script bandmanager_turnonallarmanims 
	bandmanager_turnonarmanims \{Name = musician1}
	bandmanager_turnonarmanims \{Name = musician2}
	bandmanager_turnonarmanims \{Name = musician3}
	bandmanager_turnonarmanims \{Name = musician4}
	band_setdrumkitstate \{Name = drummer
		state = On}
	band_setdrumkitstate \{Name = drummer2
		state = On}
endscript

script bandmanager_turnoffallarmanims 
	bandmanager_turnoffarmanims \{Name = musician1
		Strength = 0.0}
	bandmanager_turnoffarmanims \{Name = musician2
		Strength = 0.0}
	bandmanager_turnoffarmanims \{Name = musician3
		Strength = 0.0}
	bandmanager_turnoffarmanims \{Name = musician4
		Strength = 0.0}
	band_setdrumkitstate \{Name = drummer
		state = OFF}
	band_setdrumkitstate \{Name = drummer2
		state = OFF}
endscript

script bandmanager_setallarmanimstrength 
	band_setarmanimstrength Name = <Name> target = strum_anim_mod Strength = <Strength>
	band_setarmanimstrength Name = <Name> target = fret_anim_mod Strength = <Strength>
	band_setarmanimstrength Name = <Name> target = chord_anim_mod Strength = <Strength>
endscript

script band_setarmanimstrength 
	if CompositeObjectExists Name = <Name>
		if <Name> :Anim_AnimNodeExists id = <target>
			<Name> :Anim_Command target = <target> Command = Modulate_SetStrength params = {Strength = <Strength>}
		endif
	endif
endscript

script band_setdrumkitstate 
	if CompositeObjectExists Name = <Name>
		<Name> :Anim_Command target = drumkit_mod Command = Modulate_SetStrength params = {Strength = <Strength>}
	endif
endscript
display_clip_info = true

script band_playloop 
	override_anim = None
	if band_isfemale Name = <Name>
		if GotParam \{female}
			override_anim = <female>
		endif
	else
		if GotParam \{male}
			override_anim = <male>
		endif
	endif
	getplayerinfo \{1
		current_song_beat_time}
	if NOT (<current_song_beat_time> = 0)
		new_tempo = ((1000.0 / <current_song_beat_time>) * 60.0)
		Change tempo_for_anims = <new_tempo>
	else
		SoftAssert \{qs(0xdc3efb2d)}
	endif
	switch <Name>
		case GUITARIST
		part = guitar
		case BASSIST
		part = bass
		case drummer
		part = drum
		case vocalist
		part = vocals
		default
		ScriptAssert \{'Unknown part!'}
	endswitch
	start_times = [0.0 0.5 0.25 0.75]
	num_found = 0
	i = 0
	begin
	switch <i>
		case 0
		musician = musician1
		info_struct = musician1_info
		case 1
		musician = musician2
		info_struct = musician2_info
		case 2
		musician = musician3
		info_struct = musician3_info
		case 3
		musician = musician4
		info_struct = musician4_info
	endswitch
	if (($<info_struct>.part) = <part>)
		start = (<start_times> [<num_found>])
		num_found = (<num_found> + 1)
		bandmanager_setoverrideloop Name = <musician> anim = <override_anim>
		bandmanager_restartloop Name = <musician> start = <start>
	endif
	i = (<i> + 1)
	repeat 4
endscript

script band_playclip \{startframe = 0.0
		override_intro = true}
	if NOT GotParam \{allgamemodes}
		if ($game_mode = p2_pro_faceoff)
			return
		endif
	endif
	if ($allow_moments = FALSE)
		printf \{channel = marc
			qs(0xff4e3b1b)}
		return
	endif
	if ($game_mode = practice)
		return
	endif
	if ($test_four_drummers = true || $test_four_guitarists = true || $test_four_vocalists = true)
		return
	endif
	if NOT GlobalExists Name = <clip> Type = structure
		printf channel = anim_info 'WARNING: Band_PlayClip given unknown clip %c.' c = <clip>
		return
	endif
	if StructureContains structure = $<clip> characters
		GetArraySize ($<clip>.characters)
		i = 0
		begin
		if StructureContains structure = ($<clip>.characters [<i>]) anim
			Name = ($<clip>.characters [<i>].Name)
			get_musician_id Name = <Name>
			<Name> :Obj_KillSpawnedScript Name = return_characters_to_idle_at_song_time
		endif
		repeat <array_Size>
	endif
	clip_get_time_and_frame
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	printf channel = anim_info qs(0x875e8219) b = <clip>
	if GotParam \{no_wait}
		printf channel = pop qs(0x2b19675b) a = <time> b = <clip> donotresolve
	else
		printf channel = pop qs(0xc518c1d7) a = <time> b = <clip> donotresolve
	endif
	initial_delay = 0
	teleport_delay = 1
	if GotParam \{no_wait}
		initial_delay = 0
		teleport_delay = 0
	endif
	if (<initial_delay> > 0)
		Wait <initial_delay> gameframes
	endif
	if StructureContains structure = $<clip> dataformat
		band_playclip_new_cfunc
		newclipformat = true
	else
		band_playclip_cfunc
		newclipformat = FALSE
	endif
	increase_band_bounding_spheres
	if (<teleport_delay> != 0)
		Wait <teleport_delay> gameframes
	endif
	if (<newclipformat> = true)
		band_playclip_finish_new_cfunc
	else
		band_playclip_finish_cfunc
	endif
	printf channel = anim_info qs(0x0910e228) b = <clip>
endscript

script band_forcetoidle 
	if GotParam \{Name}
		if CompositeObjectExists Name = <Name>
			bandmanager_changeik Name = <Name> Enabled = true
			Band_PlayIdle Name = <Name> BlendDuration = 0.0 random_start_time = true no_wait
		endif
	endif
endscript

script band_forcealltoidle 
	band_forcetoidle Name = musician1 <...>
	band_forcetoidle Name = musician2 <...>
	band_forcetoidle Name = musician3 <...>
	band_forcetoidle Name = musician4 <...>
endscript

script band_movealltostartnodes 
	band_movetostartnode \{Name = musician1}
	band_movetostartnode \{Name = musician2}
	band_movetostartnode \{Name = musician3}
	band_movetostartnode \{Name = musician4}
endscript
tempo_for_anims = -1
tempo_for_drum_anims = -1

script band_setanimtempo 
	Change tempo_for_anims = <tempo>
	if ($tempo_for_drum_anims = -1)
		Change tempo_for_drum_anims = <tempo>
	endif
endscript

script band_clearanimtempo 
	Change \{tempo_for_anims = -1}
	Change \{tempo_for_drum_anims = -1}
endscript

script band_isfemale 
	if NOT GotParam \{Name}
		printf \{qs(0x50e85932)}
		return
	endif
	if NOT CompositeObjectExists Name = <Name>
		printf qs(0x4594890c) a = <Name>
		return
	endif
	<Name> :GetSingleTag is_female
	if (<is_female> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script wait_for_skinning_update 
	begin
	if (updatingsubsystem subsystem = skinning)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script wait_for_render_update 
	begin
	if (updatingsubsystem subsystem = render)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script return_characters_to_idle_at_song_time 
	printf channel = pop qs(0xb76f173e) a = <Name> b = <time>
	return_to_idle_time = <time>
	begin
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	if (<time> >= <return_to_idle_time>)
		break
	endif
	Wait \{1
		gameframes}
	repeat
	clip_get_time_and_frame
	if ($display_clip_info = true)
		clip_get_time_and_frame
	endif
	printf channel = timing qs(0x4a201907) a = <time_string>
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	printf channel = pop qs(0xa3b676fb) a = <time> b = <Name>
	band_forcetoidle Name = <Name> all_modes = <all_modes> <...>
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	printf channel = pop qs(0xa3b3aff3) a = <time> b = <Name>
	band_movetostartnode Name = <Name>
endscript

script clip_get_time_and_frame 
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	Seconds = (<time> / 1000.0)
	if (<Seconds> < 0)
		Seconds = 0
	endif
	minutes = (<Seconds> / 60.0)
	CastToInteger \{minutes}
	Seconds = (<Seconds> - (<minutes> * 60))
	seconds_float = <Seconds>
	CastToInteger \{Seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <Seconds>)
	Frame = (<fraction_of_second> * <fps>)
	CastToInteger \{Frame}
	if (<Seconds> < 10)
		if (<Frame> < 10)
			formatText TextName = time_string '%a:0%b:0%c ' a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string '%a:0%b:%c ' a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	else
		if (<Frame> < 10)
			formatText TextName = time_string '%a:%b:0%c ' a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string '%a:%b:%c ' a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	endif
	return time_string = <time_string>
endscript

script debug_print_frame_time 
	Seconds = (<time> / 1000.0)
	if (<Seconds> < 0)
		Seconds = 0
	endif
	minutes = (<Seconds> / 60.0)
	CastToInteger \{minutes}
	Seconds = (<Seconds> - (<minutes> * 60))
	seconds_float = <Seconds>
	CastToInteger \{Seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <Seconds>)
	Frame = (<fraction_of_second> * <fps>)
	CastToInteger \{Frame}
	if (<Seconds> < 10)
		if (<Frame> < 10)
			formatText TextName = time_string '%a:0%b:0%c ' a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string '%a:0%b:%c ' a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	else
		if (<Frame> < 10)
			formatText TextName = time_string '%a:%b:0%c ' a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string '%a:%b:%c ' a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	endif
	printf channel = AnimInfo <time_string>
endscript

script test_all_cameras 
	ScriptAssert \{'test_all_cameras: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script test_cameras 
	printf \{channel = testcameras
		'---------------------------------'}
	if NOT GotParam \{Name}
		printf \{channel = testcameras
			'test_cameras script requires \'name\' parameter'}
		return
	endif
	print_obj_info Name = <Name>
	ExtendCrc <Name> '_mocap_lock_target_01' out = camera1
	print_obj_info Name = <camera1> name_string = <name_string>
	ExtendCrc <Name> '_mocap_lock_target_02' out = camera2
	print_obj_info Name = <camera2> name_string = <name_string>
	printf \{channel = testcameras
		qs(0x86fbe77a)}
endscript

script print_obj_info 
	if NOT CompositeObjectExists Name = <Name>
		printf channel = testcameras 'could not find %a"' a = <Name>
		return
	endif
	printf channel = testcameras '%a' a = <Name>
	if <Name> :Anim_AnimNodeExists id = BodyTimer
		<Name> :Anim_Command target = BodyTimer Command = Timer_GetFrameFactor
		<Name> :Anim_Command target = BodyTimer Command = Timer_GetAnimDuration
		printf channel = testcameras ' length %bs           ...... time %cs (%a)  ' a = (<framefactor>) b = <Duration> c = (<framefactor> * <Duration>)
	else
		printf \{channel = testcameras
			' missing bodytimer!'}
	endif
	<Name> :Obj_GetPosition
	printf channel = testcameras '  position %a' a = <Pos>
	<Name> :Obj_GetOrientation
	Dir = ((1.0, 0.0, 0.0) * <X> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
	printf channel = testcameras '  orientation %a' a = <Dir>
endscript

script band_showmic \{Name = GUITARIST}
	if ($allow_moments = FALSE)
		return
	endif
	if ($game_mode = p2_pro_faceoff)
		return
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<Name> :show_mic
	endif
endscript

script band_hidemic \{Name = GUITARIST}
	if ($allow_moments = FALSE)
		return
	endif
	get_musician_id Name = <Name>
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic
endscript

script band_showmic_stand \{Name = GUITARIST}
	if ($allow_moments = FALSE)
		return
	endif
	if ($game_mode = p2_pro_faceoff)
		return
	endif
	get_musician_id Name = <Name>
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<Name> :show_mic_stand
	endif
endscript

script band_hidemic_stand \{Name = GUITARIST}
	if ($allow_moments = FALSE)
		return
	endif
	get_musician_id Name = <Name>
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic_stand
endscript

script band_showmic_microphone \{Name = GUITARIST}
	if ($allow_moments = FALSE)
		return
	endif
	if ($game_mode = p2_pro_faceoff)
		return
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<Name> :show_mic_microphone
	endif
endscript

script band_hidemic_microphone \{Name = GUITARIST}
	if ($allow_moments = FALSE)
		return
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic_microphone
endscript

script band_showdrumkit \{Name = drummer}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :show_drumkit
endscript

script band_hidedrumkit \{Name = drummer}
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_drumkit
endscript

script band_hide 
	if CompositeObjectExists Name = <Name>
		<Name> :Hide
	endif
endscript

script band_unhide 
	if CompositeObjectExists Name = <Name>
		<Name> :unhide
	endif
endscript
enable_guitarist_camera_swapping = FALSE

script band_enableguitaristcameraswapping 
	ScriptAssert \{'Band_EnableGuitaristCameraSwapping: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script band_disableguitaristcameraswapping 
	ScriptAssert \{'Band_DisableGuitaristCameraSwapping: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script transition_changeik 
	bandmanager_changeik <...>
endscript

script bandmanager_stopfacialanims 
	<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
	<Name> :Obj_KillSpawnedScript Name = facial_anim_loop
	<Name> :hero_clear_facial_anim
endscript

script bandmanager_startfacialanims 
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
	<Name> :Obj_KillSpawnedScript Name = facial_anim_loop
	<Name> :Obj_SpawnScriptNow facial_anim_loop
endscript

script bandmanager_startallfacialanims 
	bandmanager_startfacialanims \{Name = musician1}
	bandmanager_startfacialanims \{Name = musician2}
	bandmanager_startfacialanims \{Name = musician3}
	bandmanager_startfacialanims \{Name = musician4}
endscript

script bandmanager_airguitarcheat 
	if ($cheat_airinstruments = 1)
		bandmanager_hideallinstruments
	else
		bandmanager_unhideallinstruments
	endif
endscript

script bandmanager_invisiblecharacterscheat 
	if ($cheat_invisiblecharacters = 1)
		bandmanager_hideallmusicians
	else
		bandmanager_unhideallmusicians
	endif
endscript

script bandmanager_hideinstrument 
	if CompositeObjectExists <Name>
		<Name> :hideinstrument
		bandmanager_hidestrings Name = <Name>
	endif
endscript

script bandmanager_unhideinstrument 
	if CompositeObjectExists <Name>
		<Name> :unhideinstrument
		bandmanager_showstrings Name = <Name>
	endif
endscript

script bandmanager_hideallinstruments 
	bandmanager_hideinstrument \{Name = musician1}
	bandmanager_hideinstrument \{Name = musician2}
	bandmanager_hideinstrument \{Name = musician3}
	bandmanager_hideinstrument \{Name = musician4}
endscript

script bandmanager_unhideallinstruments 
	bandmanager_unhideinstrument \{Name = musician1}
	bandmanager_unhideinstrument \{Name = musician2}
	bandmanager_unhideinstrument \{Name = musician3}
	bandmanager_unhideinstrument \{Name = musician4}
endscript

script bandmanager_hidemusician 
	if CompositeObjectExists <Name>
		<Name> :hidemusician
	endif
endscript

script bandmanager_unhidemusician 
	if CompositeObjectExists <Name>
		<Name> :unhidemusician
	endif
endscript

script bandmanager_hideallmusicians 
	bandmanager_hidemusician \{Name = musician1}
	bandmanager_hidemusician \{Name = musician2}
	bandmanager_hidemusician \{Name = musician3}
	bandmanager_hidemusician \{Name = musician4}
endscript

script bandmanager_unhideallmusicians 
	bandmanager_unhidemusician \{Name = musician1}
	bandmanager_unhidemusician \{Name = musician2}
	bandmanager_unhidemusician \{Name = musician3}
	bandmanager_unhidemusician \{Name = musician4}
endscript

script band_simulatetempo 
	switch <Name>
		case GUITARIST
		Change musician3_tempo = <tempo>
		case BASSIST
		Change musician4_tempo = <tempo>
		case vocalist
		Change musician1_tempo = <tempo>
		case drummer
		Change musician2_tempo = <tempo>
	endswitch
endscript

script band_stopsimulatetempo 
	switch <Name>
		case GUITARIST
		Change \{musician3_tempo = -1}
		case BASSIST
		Change \{musician4_tempo = -1}
		case vocalist
		Change \{musician1_tempo = -1}
		case drummer
		Change \{musician2_tempo = -1}
	endswitch
endscript

script get_musician_id 
	switch <Name>
		case GUITARIST
		case BASSIST
		case vocalist
		case drummer
		<Name> :Obj_GetID
		Name = <objID>
	endswitch
	return Name = <Name>
endscript
allow_moments = true

script determine_if_moments_should_play 
	gamemode_gettype
	switch <Type>
		case training
		case practice
		case tutorial
		Change \{allow_moments = FALSE}
		return
	endswitch
	gman_songtool_getcurrentsong
	get_band_configuration song = <current_song> skip_dlc_check
	if (<Band> = default_band)
		if is_standard_band_setup
			allowed = true
		else
			allowed = FALSE
		endif
	else
		gamemode_gettype
		if (<Type> = career)
			if StructureContains structure = $download_songlist_props <current_song>
				allowed = FALSE
			elseif NOT 0x34e770c0 song = <current_song>
				allowed = FALSE
			else
				allowed = true
			endif
		else
			allowed = FALSE
		endif
	endif
	Change allow_moments = <allowed>
endscript

script should_play_moments 
	return \{$allow_moments}
endscript
