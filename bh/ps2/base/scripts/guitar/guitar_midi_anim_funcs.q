
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
		get_musician_id Name = <Name>
		play_facial_anim_on_character Name = <Name> anim = <anim>
		if (<Name> = vocalist)
			play_facial_anim_on_character Name = vocalist2 anim = <anim>
		endif
	elseif GotParam \{part}
		if ($guitarist_info.part = <part>)
			play_facial_anim_on_character Name = GUITARIST anim = <anim>
		endif
		if ($bassist_info.part = <part>)
			play_facial_anim_on_character Name = BASSIST anim = <anim>
		endif
		if ($vocalist_info.part = <part>)
			play_facial_anim_on_character Name = vocalist anim = <anim>
		endif
		if ($drummer_info.part = <part>)
			play_facial_anim_on_character Name = drummer anim = <anim>
		endif
	endif
endscript

script band_playrockinfacialanim \{Name = GUITARIST}
	get_musician_id Name = <Name>
	if CompositeObjectExists Name = <Name>
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		if band_isfemale Name = <Name>

			<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = gh_rocker_female_hardrockface_4}
		else

			<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = gh_rocker_male_hardrockface_4}
		endif
	endif
endscript

script band_changefacialanims \{Name = GUITARIST
		blend_duration = 0.3}
	get_musician_id Name = <Name>

	if CompositeObjectExists Name = <Name>

		ExtendCrc <Name> '_Info' out = info_struct
		if ((GotParam ff_anims) || (GotParam mf_anims))
			if band_isfemale Name = <Name>
				if GotParam \{ff_anims}

					Change structurename = <info_struct> facial_anims = <ff_anims>
				endif
			else
				if GotParam \{mf_anims}

					Change structurename = <info_struct> facial_anims = <mf_anims>
				endif
			endif
		else
			fa_default = ($<info_struct>.facial_anims_default)
			if GotParam \{fa_type}
				ExtendCrc <fa_default> <fa_type> out = fa_anims

			else
				fa_anims = <fa_default>
			endif
			Change structurename = <info_struct> facial_anims = <fa_anims>
		endif
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_KillSpawnedScript Name = facial_anim_loop
		<Name> :Obj_SpawnScriptNow facial_anim_loop params = {blend_duration = <blend_duration>}
	else

	endif
endscript

script ae_changefacialanims \{blend_duration = 0.3}
	Obj_GetID
	if NOT ((GotParam ff_anims) || (GotParam mf_anims) || (GotParam fa_type))

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
	bandmanager_playidle \{Name = GUITARIST
		all_modes = true
		restart}
	bandmanager_playidle \{Name = BASSIST
		all_modes = true
		restart}
	bandmanager_playidle \{Name = vocalist
		all_modes = true
		restart}
	bandmanager_playidle \{Name = drummer
		all_modes = true
		restart}
endscript

script band_playtransitionidles \{from_restart = FALSE}

	gman_songtool_getcurrentsong
	band_builder_get_band_global song = <current_song>
	Wait \{2
		gameframes}
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
	bandmanager_turnoffarmanims \{Name = GUITARIST}
	bandmanager_turnoffarmanims \{Name = guitarist2}
	bandmanager_turnoffarmanims \{Name = BASSIST}
	bandmanager_turnoffarmanims \{Name = bassist2}
	bandmanager_turnoffarmanims \{Name = vocalist}
	bandmanager_turnoffarmanims \{Name = vocalist2}
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
	bandmanager_turnonarmanims \{Name = GUITARIST}
	bandmanager_turnonarmanims \{Name = guitarist2}
	bandmanager_turnonarmanims \{Name = BASSIST}
	bandmanager_turnonarmanims \{Name = bassist2}
	bandmanager_turnonarmanims \{Name = vocalist}
	bandmanager_turnonarmanims \{Name = vocalist2}
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
	bandmanager_playidle <...>
endscript

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

	endif
	bandmanager_setoverrideloop Name = <Name> anim = <override_anim>
	bandmanager_restartloop Name = <Name>
endscript

script band_playclip \{startframe = 0.0
		override_intro = true}
	if NOT GotParam \{allgamemodes}
		if ($game_mode = p2_pro_faceoff)
			return
		endif
	endif
	if NOT should_play_moments
		return
	endif
	if NOT GlobalExists Name = <clip> Type = structure

		return
	endif
	clip_get_time_and_frame
	GetSongTimeMs
	CastToInteger \{time}
	if StructureContains structure = $<clip> dataformat
		band_playclip_new_cfunc
		newclipformat = true
	else
		band_playclip_cfunc
		newclipformat = FALSE
	endif
	increase_band_bounding_spheres
	if (<newclipformat> = true)
		band_playclip_finish_new_cfunc
	else
		band_playclip_finish_cfunc
	endif

endscript

script 0xa93a70af \{startframe = 0.0
		override_intro = true}
	if NOT GotParam \{allgamemodes}
		if ($game_mode = p2_pro_faceoff)
			return
		endif
	endif
	if NOT should_play_moments
		return
	endif
	clip_get_time_and_frame
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	if StructureContains structure = $<clip> dataformat
		band_playclip_new_cfunc
		newclipformat = true
	else
		band_playclip_cfunc
		newclipformat = FALSE
	endif
	increase_band_bounding_spheres
endscript

script increase_band_bounding_spheres 
	if CompositeObjectExists \{Name = drummer}
		drummer :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{Name = vocalist}
		vocalist :Obj_SetBoundingSphere \{10}
	endif
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

		return
	endif
	if NOT CompositeObjectExists Name = <Name>

		return
	endif
	<Name> :GetSingleTag is_female
	if (<is_female> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
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
	bandmanager_startfacialanims \{Name = GUITARIST}
	bandmanager_startfacialanims \{Name = guitarist2}
	bandmanager_startfacialanims \{Name = BASSIST}
	bandmanager_startfacialanims \{Name = bassist2}
	bandmanager_startfacialanims \{Name = vocalist}
	bandmanager_startfacialanims \{Name = vocalist2}
	bandmanager_startfacialanims \{Name = drummer}
	bandmanager_startfacialanims \{Name = drummer2}
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
	bandmanager_hideinstrument \{Name = GUITARIST}
	bandmanager_hideinstrument \{Name = guitarist2}
	bandmanager_hideinstrument \{Name = BASSIST}
	bandmanager_hideinstrument \{Name = bassist2}
	bandmanager_hideinstrument \{Name = vocalist}
	bandmanager_hideinstrument \{Name = vocalist2}
	bandmanager_hideinstrument \{Name = drummer}
	bandmanager_hideinstrument \{Name = drummer2}
endscript

script bandmanager_unhideallinstruments 
	bandmanager_unhideinstrument \{Name = GUITARIST}
	bandmanager_unhideinstrument \{Name = guitarist2}
	bandmanager_unhideinstrument \{Name = BASSIST}
	bandmanager_unhideinstrument \{Name = bassist2}
	bandmanager_unhideinstrument \{Name = vocalist}
	bandmanager_unhideinstrument \{Name = vocalist2}
	bandmanager_unhideinstrument \{Name = drummer}
	bandmanager_unhideinstrument \{Name = drummer2}
endscript

script bandmanager_hidemusician 
	if CompositeObjectExists <Name>
		<Name> :hidemusician
	endif
endscript

script bandmanager_unhidemusician 
	if CompositeObjectExists <Name>
		<Name> :unhide
	endif
endscript

script bandmanager_hideallmusicians 
	bandmanager_hidemusician \{Name = GUITARIST}
	bandmanager_hidemusician \{Name = guitarist2}
	bandmanager_hidemusician \{Name = BASSIST}
	bandmanager_hidemusician \{Name = bassist2}
	bandmanager_hidemusician \{Name = vocalist}
	bandmanager_hidemusician \{Name = vocalist2}
	bandmanager_hidemusician \{Name = drummer}
	bandmanager_hidemusician \{Name = drummer2}
endscript

script bandmanager_unhideallmusicians 
	bandmanager_unhidemusician \{Name = GUITARIST}
	bandmanager_unhidemusician \{Name = guitarist2}
	bandmanager_unhidemusician \{Name = BASSIST}
	bandmanager_unhidemusician \{Name = bassist2}
	bandmanager_unhidemusician \{Name = vocalist}
	bandmanager_unhidemusician \{Name = vocalist2}
	bandmanager_unhidemusician \{Name = drummer}
	bandmanager_unhidemusician \{Name = drummer2}
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

script should_play_moments 
	gman_songtool_getcurrentsong
	get_band_configuration song = <current_song>
	if (<Band> = default_band)
		return \{true}
	else
		gamemode_gettype
		if (<Type> = career)
			return \{true}
		else
			return \{FALSE}
		endif
	endif
endscript
