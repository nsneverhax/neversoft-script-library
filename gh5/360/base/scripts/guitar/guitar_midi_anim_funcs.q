
script transition_playsimpleanim 
	Band_PlaySimpleAnim <...>
	bandmanager_setplayingintroanims Name = <Name>
endscript

script play_facial_anim_on_character \{Name = GUITARIST}
	if CompositeObjectExists Name = <Name>
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = <anim>}
	endif
endscript

script Band_PlayFacialAnim \{Name = GUITARIST}
	gamemode_gettype
	switch <Type>
		case training
		case practice
		case tutorial
		return \{FALSE}
	endswitch
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
	get_musician_id Name = <Name>
	printf \{qs(0x940afbfa)
		channel = AnimInfo}
	if CompositeObjectExists Name = <Name>
		printf \{qs(0x85140bfa)
			channel = AnimInfo}
		ExtendCrc <Name> '_Info' out = info_struct
		if ((GotParam ff_anims) || (GotParam mf_anims))
			if band_isfemale Name = <Name>
				if GotParam \{ff_anims}
					printf \{qs(0xc85f8d07)
						channel = AnimInfo}
					Change structurename = <info_struct> facial_anims = <ff_anims>
				endif
			else
				if GotParam \{mf_anims}
					printf \{qs(0xeda94c27)
						channel = AnimInfo}
					Change structurename = <info_struct> facial_anims = <mf_anims>
				endif
			endif
		else
			fa_default = ($<info_struct>.facial_anims_default)
			if GotParam \{fa_type}
				ExtendCrc <fa_default> <fa_type> out = fa_anims
				printf qs(0x3bb16ef0) a = <fa_anims> channel = AnimInfo
			else
				fa_anims = <fa_default>
			endif
			Change structurename = <info_struct> facial_anims = <fa_anims>
		endif
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_KillSpawnedScript Name = facial_anim_loop
		<Name> :Obj_SpawnScriptNow facial_anim_loop params = {blend_duration = <blend_duration>}
	else
		printf qs(0x7eb6ba00) a = <Name> channel = AnimInfo
	endif
endscript

script ae_changefacialanims \{blend_duration = 0.3}
	Obj_GetID
	if NOT ((GotParam ff_anims) || (GotParam mf_anims) || (GotParam fa_type))
		ScriptAssert \{qs(0x1ea5580d)}
	endif
	band_changefacialanims Name = <objID> blend_duration = <blend_duration> <...>
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
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_L Strength = 1
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_R Strength = 1
	elseif (<Chain> = slave)
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Slave_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Slave_L
		band_disableautofret Name = <Name>
		band_disableautochords Name = <Name>
		band_disableautostrums Name = <Name>
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_L Strength = 1
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_R Strength = 1
	elseif (<Chain> = fk)
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_L Strength = 0
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_R Strength = 0
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_L Strength = 0
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_R Strength = 0
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

script ae_setik_guitarl_on_stranglehold 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 1 target = Bone_IK_Hand_Guitar_L BlendDuration = 0.3
endscript

script ae_setik_guitarr_on_stranglehold 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 0 target = Bone_IK_Hand_Guitar_R BlendDuration = 0.3
endscript

script ae_setik_slavel_on_stranglehold 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 1 target = Bone_IK_Hand_Slave_L BlendDuration = 0.3
endscript

script ae_setik_slaver_on_stranglehold 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 0 target = Bone_IK_Hand_Slave_R BlendDuration = 0.3
endscript

script ae_setik_slaves_on_jimi 
	if ($game_mode = p2_pro_faceoff)
		Obj_GetID
		band_setikchaintarget Name = <objID> index = 0 target = Bone_IK_Hand_Slave_R BlendDuration = 0
		band_setikchaintarget Name = <objID> index = 1 target = Bone_IK_Hand_Slave_L BlendDuration = 0
	endif
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

script ae_disableautostrums 
	Obj_GetID
	band_disableautostrums Name = <objID>
endscript

script ae_enableautostrums 
	Obj_GetID
	band_enableautostrums Name = <objID>
endscript

script ae_disableautochords 
	Obj_GetID
	band_disableautochords Name = <objID>
endscript

script ae_enableautochords 
	Obj_GetID
	band_enableautochords Name = <objID>
endscript

script ik_fk_switch_override 
	gman_songtool_getcurrentsong
	if (<current_song> = bandontherun)
		return
	endif
	ae_setik_slaver_on
endscript

script band_setikchaintarget \{BlendDuration = 0.0}
	band_setikchaintarget_cfunc Name = <Name> target = <target> index = <index> BlendDuration = <BlendDuration>
endscript

script band_movetonode \{allow_in_2player = FALSE}
	band_movetonode_cfunc allow_in_2player = <allow_in_2player> Name = <Name> node = <node>
endscript

script band_movetostartnode \{allow_in_2player = FALSE}
	band_movetostartnode_cfunc Name = <Name> allow_in_2player = <allow_in_2player>
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

script band_playtransitionidles \{from_restart = FALSE}
	printf \{channel = pop
		qs(0xf9078adf)}
	gman_songtool_getcurrentsong
	band_builder_get_band_global song = <current_song>
	Wait \{2
		gameframes}
	play_intro_anims
	bandmanager_turnoffallarmanims
	Wait \{1
		gameframes}
	bandmanager_setplayingintroanims
endscript

script bandmanager_turnoffarmanims 
	band_disableautostrums Name = <Name>
	band_disableautofret Name = <Name>
	band_disableautochords Name = <Name>
endscript

script bandmanager_turnoffallarmanims 
	bandmanager_turnoffarmanims \{Name = musician1}
	bandmanager_turnoffarmanims \{Name = musician2}
	bandmanager_turnoffarmanims \{Name = musician3}
	bandmanager_turnoffarmanims \{Name = musician4}
	band_setdrumkitstate \{Name = drummer
		state = OFF}
	band_setdrumkitstate \{Name = drummer2
		state = OFF}
endscript

script bandmanager_turnonarmanims 
	band_enableautostrums Name = <Name>
	band_enableautofret Name = <Name>
	band_enableautochords Name = <Name>
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

script band_setarmanimstrength 
	band_setarmanimstrength_cfunc Name = <Name> target = <target> Strength = <Strength>
endscript

script band_setdrumkitstate 
	if ($test_four_guitarists = true || $test_four_vocalists = true)
		return
	endif
	if CompositeObjectExists Name = <Name>
		if (<state> = On)
		else
		endif
	endif
endscript

script Band_PlayIdle 
	if NOT GotParam \{no_wait}
		Wait \{1
			gameframe}
	endif
	bandmanager_playidle <...>
endscript

script band_playloop 
	wait_for_next_even_frame
	Wait \{1
		gameframe}
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
	new_tempo = ((1000.0 / <current_song_beat_time>) * 60.0)
	Change tempo_for_anims = <new_tempo>
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
	GetSongTimeMs
	CastToInteger \{time}
	if NOT GotParam \{allgamemodes}
		if ($game_mode = p2_pro_faceoff)
			return
		endif
	endif
	if NOT should_play_moments
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
	if NOT GotParam \{no_wait}
		wait_for_next_even_frame
	endif
	clip_get_time_and_frame
	GetSongTimeMs
	CastToInteger \{time}
	if GotParam \{no_wait}
	else
	endif
	initial_delay = 1
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
endscript

script increase_band_bounding_spheres 
	return
	if CompositeObjectExists \{Name = musician1}
		musician1 :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{Name = musician2}
		musician2 :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{Name = musician3}
		musician3 :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{Name = musician4}
		musician4 :Obj_SetBoundingSphere \{10}
	endif
endscript

script band_forcetoidle \{all_modes = FALSE}
	if GotParam \{Name}
		if CompositeObjectExists Name = <Name>
			bandmanager_changeik Name = <Name> Enabled = true
			bandmanager_playidle Name = <Name> BlendDuration = 0.0 all_modes = <all_modes>
		endif
	endif
endscript

script band_forcealltoidle \{all_modes = FALSE}
	if NOT GotParam \{no_wait}
		Wait \{1
			gameframe}
	endif
	band_forcetoidle Name = GUITARIST all_modes = <all_modes> <...>
	band_forcetoidle Name = BASSIST all_modes = <all_modes> <...>
	band_forcetoidle Name = vocalist all_modes = <all_modes> <...>
	band_forcetoidle Name = drummer all_modes = <all_modes> <...>
endscript

script band_movealltostartnodes 
	band_movetostartnode \{Name = GUITARIST}
	band_movetostartnode \{Name = BASSIST}
	band_movetostartnode \{Name = vocalist}
	band_movetostartnode \{Name = drummer}
endscript
tempo_for_anims = -1
tempo_for_drum_anims = -1

script band_setanimtempo 
	Change tempo_for_anims = <tempo>
	if ($tempo_for_drum_anims = -1)
		Change tempo_for_drum_anims = <tempo>
	endif
endscript

script band_setdrumanimtempo 
	Change tempo_for_drum_anims = <tempo>
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

script return_characters_to_idle_at_song_time 
	return_to_idle_time = <time>
	begin
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	if (<time> >= <return_to_idle_time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($display_clip_info = true)
		clip_get_time_and_frame
	endif
	wait_for_next_even_frame
	Wait \{1
		gameframes}
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	printf channel = pop qs(0xa3b676fb) a = <time> b = <Name>
	band_forcetoidle Name = <Name> all_modes = <all_modes> <...>
	Wait \{1
		gameframes}
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
			formatText TextName = time_string qs(0x593819d8) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string qs(0xac471e75) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	else
		if (<Frame> < 10)
			formatText TextName = time_string qs(0x31aec87f) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string qs(0xcacc8b50) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	endif
	formatText TextName = time_string qs(0x67b7904f) a = <minutes> b = <Seconds> c = <Frame> d = <time>
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
			formatText TextName = time_string qs(0x593819d8) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string qs(0xac471e75) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	else
		if (<Frame> < 10)
			formatText TextName = time_string qs(0x31aec87f) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string qs(0xcacc8b50) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	endif
	printf channel = AnimInfo <time_string>
endscript

script band_showmic \{Name = GUITARIST}
	if NOT should_play_moments
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
	if NOT should_play_moments
		return
	endif
	get_musician_id Name = <Name>
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic
endscript

script band_showmic_stand \{Name = GUITARIST}
	if NOT should_play_moments
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
	if NOT should_play_moments
		return
	endif
	get_musician_id Name = <Name>
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic_stand
endscript

script band_showmic_microphone \{Name = GUITARIST}
	if NOT should_play_moments
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
	if NOT should_play_moments
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
	if ($cheat_airinstruments != 1)
		<Name> :show_drumkit
	endif
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
	bandmanager_hidestrings Name = <Name>
endscript

script band_unhide 
	if CompositeObjectExists Name = <Name>
		if ($cheat_invisiblecharacters != 1)
			<Name> :unhide
			<Name> :Ragdoll_MarkForReset
		endif
	endif
	if ($cheat_airinstruments != 1)
		bandmanager_showstrings Name = <Name>
	endif
endscript
enable_guitarist_camera_swapping = FALSE

script band_enableguitaristcameraswapping 
	Change \{enable_guitarist_camera_swapping = true}
endscript

script band_disableguitaristcameraswapping 
	Change \{enable_guitarist_camera_swapping = FALSE}
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

script test_all_cameras 
	test_cameras \{Name = GUITARIST}
	test_cameras \{Name = BASSIST}
	test_cameras \{Name = vocalist}
endscript

script test_cameras 
	printf \{channel = testcameras
		qs(0x86fbe77a)}
	if NOT GotParam \{Name}
		printf \{channel = testcameras
			qs(0x4ca06177)}
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
		printf channel = testcameras qs(0x68673a19) a = <Name>
		return
	endif
	printf channel = testcameras qs(0x0bc409e2) a = <Name>
	if <Name> :Anim_AnimNodeExists id = BodyTimer
		<Name> :Anim_Command target = BodyTimer Command = Timer_GetFrameFactor
		<Name> :Anim_Command target = BodyTimer Command = Timer_GetAnimDuration
		printf channel = testcameras qs(0x61b2abb6) a = (<framefactor>) b = <Duration> c = (<framefactor> * <Duration>)
	else
		printf \{channel = testcameras
			qs(0x6255a299)}
	endif
	<Name> :Obj_GetPosition
	printf channel = testcameras qs(0x795dba52) a = <Pos>
	<Name> :Obj_GetOrientation
	Dir = ((1.0, 0.0, 0.0) * <X> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
	printf channel = testcameras qs(0x27ca0b4f) a = <Dir>
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
		if CompositeObjectExists Name = <Name>
			<Name> :Obj_GetID
			Name = <objID>
		endif
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
	if ($allow_moments = true)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script wait_for_next_even_frame 
	if isprimaryframe
		Wait \{2
			gameframes}
	else
		Wait \{1
			gameframes}
	endif
endscript
