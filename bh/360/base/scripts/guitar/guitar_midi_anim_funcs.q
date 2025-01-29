
script Transition_PlaySimpleAnim 
	Band_PlaySimpleAnim <...>
	BandManager_SetPlayingIntroAnims name = <name>
endscript

script play_facial_anim_on_character \{name = Guitarist}
	if CompositeObjectExists name = <name>
		<name> :Obj_KillSpawnedScript name = play_special_facial_anim
		<name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = <anim>}
	endif
endscript

script band_PlayfacialAnim \{name = Guitarist}
	GameMode_GetType
	switch <type>
		case training
		case practice
		case tutorial
		return \{false}
	endswitch
	if GotParam \{name}
		if (<name> = Vocalist)
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
			if ((($<info_struct>.position) = Vocalist) || (($<info_struct>.part) = vocals))
				play_facial_anim_on_character name = <musician> anim = <anim>
			endif
			i = (<i> + 1)
			repeat 4
		else
			get_musician_id name = <name>
			ExtendCrc <name> '_info' out = info_struct
			if (($<info_struct>.part) != vocals)
				play_facial_anim_on_character name = <name> anim = <anim>
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
			play_facial_anim_on_character name = <musician> anim = <anim>
		endif
		i = (<i> + 1)
		repeat 4
	endif
endscript

script Band_PlayRockinFacialAnim \{name = Guitarist}
	get_musician_id name = <name>
	if CompositeObjectExists name = <name>
		<name> :Obj_KillSpawnedScript name = play_special_facial_anim
		if Band_IsFemale name = <name>
			printf \{qs(0xc85f8d07)}
			<name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = gh_rocker_female_HardRockFace_4}
		else
			printf \{qs(0xeda94c27)}
			<name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = gh_rocker_male_HardRockFace_4}
		endif
	endif
endscript

script Band_ChangeFacialAnims \{name = Guitarist
		blend_duration = 0.3}
	original_name = <name>
	get_musician_id name = <name>
	ExtendCrc <name> '_Info' out = info_struct
	switch <original_name>
		case Guitarist
		case Bassist
		case Drummer
		if ($<info_struct>.part = vocals)
			return
		endif
	endswitch
	printf \{qs(0x940afbfa)
		channel = AnimInfo}
	if CompositeObjectExists name = <name>
		printf \{qs(0x85140bfa)
			channel = AnimInfo}
		ExtendCrc <name> '_Info' out = info_struct
		if ((GotParam ff_anims) || (GotParam Mf_anims))
			if Band_IsFemale name = <name>
				if GotParam \{ff_anims}
					printf \{qs(0xc85f8d07)
						channel = AnimInfo}
					Change structurename = <info_struct> facial_anims = <ff_anims>
				endif
			else
				if GotParam \{Mf_anims}
					printf \{qs(0xeda94c27)
						channel = AnimInfo}
					Change structurename = <info_struct> facial_anims = <Mf_anims>
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
		<name> :Obj_KillSpawnedScript name = play_special_facial_anim
		<name> :Obj_KillSpawnedScript name = facial_anim_loop
		<name> :Obj_SpawnScriptNow facial_anim_loop params = {blend_duration = <blend_duration>}
	else
		printf qs(0x7eb6ba00) a = <name> channel = AnimInfo
	endif
endscript

script AE_ChangeFacialAnims \{blend_duration = 0.3}
	Obj_GetID
	if NOT ((GotParam ff_anims) || (GotParam Mf_anims) || (GotParam fa_type))
		ScriptAssert \{qs(0x1ea5580d)}
	endif
	Band_ChangeFacialAnims name = <objID> blend_duration = <blend_duration> <...>
endscript

script Band_StopStrumming \{name = Guitarist}
	Band_SetStrumStyle name = <name> male_type = None female_type = None
endscript

script Band_EnableAutoStrums 
	Band_EnableAutoStrums_CFunc name = <name>
endscript

script Band_DisableAutoStrums 
	Band_DisableAutoStrums_CFunc name = <name>
endscript

script Band_EnableAutoFret 
	Band_EnableAutoFret_CFunc name = <name>
endscript

script Band_DisableAutoFret 
	Band_DisableAutoFret_CFunc name = <name>
endscript

script Band_EnableAutoChords 
	Band_EnableAutoChords_CFunc name = <name>
endscript

script Band_DisableAutoChords 
	Band_DisableAutoChords_CFunc name = <name>
endscript

script Band_SetIKChain 
	if (<Chain> = guitar)
		Band_SetIKChainTarget name = <name> index = 0 target = BONE_IK_HAND_GUITAR_R
		Band_SetIKChainTarget name = <name> index = 1 target = BONE_IK_HAND_GUITAR_L
		Band_EnableAutoFret name = <name>
		Band_EnableAutoChords name = <name>
		Band_EnableAutoStrums name = <name>
		Bandmanager_setIKchainStrength name = <name> Chain = BONE_IK_HAND_GUITAR_L strength = 1
		Bandmanager_setIKchainStrength name = <name> Chain = BONE_IK_HAND_GUITAR_R strength = 1
	elseif (<Chain> = slave)
		Band_SetIKChainTarget name = <name> index = 0 target = Bone_IK_Hand_Slave_R
		Band_SetIKChainTarget name = <name> index = 1 target = Bone_IK_Hand_Slave_L
		Band_DisableAutoFret name = <name>
		Band_DisableAutoChords name = <name>
		Band_DisableAutoStrums name = <name>
		Bandmanager_setIKchainStrength name = <name> Chain = Bone_IK_Hand_Slave_L strength = 1
		Bandmanager_setIKchainStrength name = <name> Chain = Bone_IK_Hand_Slave_R strength = 1
	elseif (<Chain> = fk)
		Bandmanager_setIKchainStrength name = <name> Chain = BONE_IK_HAND_GUITAR_L strength = 0
		Bandmanager_setIKchainStrength name = <name> Chain = BONE_IK_HAND_GUITAR_R strength = 0
		Bandmanager_setIKchainStrength name = <name> Chain = Bone_IK_Hand_Slave_L strength = 0
		Bandmanager_setIKchainStrength name = <name> Chain = Bone_IK_Hand_Slave_R strength = 0
		Bandmanager_setIKchainStrength name = <name> node = lefthandik Chain = BONE_IK_HAND_GUITAR_L strength = 0
		Bandmanager_setIKchainStrength name = <name> node = lefthandik Chain = Bone_IK_Hand_Slave_L strength = 0
		Bandmanager_setIKchainStrength name = <name> node = righthandik Chain = BONE_IK_HAND_GUITAR_R strength = 0
		Bandmanager_setIKchainStrength name = <name> node = righthandik Chain = Bone_IK_Hand_Slave_R strength = 0
	else
		Band_SetIKChainTarget name = <name> index = 0 target = Bone_IK_Hand_Slave_R
		Band_SetIKChainTarget name = <name> index = 1 target = Bone_IK_Hand_Slave_L
		Band_DisableAutoFret name = <name>
		Band_DisableAutoChords name = <name>
		Band_DisableAutoStrums name = <name>
	endif
endscript

script AE_SetIK_GuitarL_Off 
	Obj_GetID
	Band_DisableAutoChords name = <objID>
endscript

script AE_SetIK_GuitarR_Off 
	Obj_GetID
	Band_DisableAutoStrums name = <objID>
endscript

script AE_SetIK_SlaveL_Off 
endscript

script AE_SetIK_SlaveR_Off 
endscript

script AE_SetIK_GuitarL_On 
	Obj_GetID
	Band_SetIKChainTarget name = <objID> index = 1 target = BONE_IK_HAND_GUITAR_L BlendDuration = 0.3
	Band_EnableAutoChords name = <objID>
endscript

script AE_SetIK_GuitarR_On 
	Obj_GetID
	Band_SetIKChainTarget name = <objID> index = 0 target = BONE_IK_HAND_GUITAR_R BlendDuration = 0.3
	Band_EnableAutoStrums name = <objID>
endscript

script AE_SetIK_SlaveL_On 
	Obj_GetID
	Band_SetIKChainTarget name = <objID> index = 1 target = Bone_IK_Hand_Slave_L BlendDuration = 0.3
	Band_DisableAutoChords name = <objID>
endscript

script AE_SetIK_SlaveR_On 
	Obj_GetID
	Band_SetIKChainTarget name = <objID> index = 0 target = Bone_IK_Hand_Slave_R BlendDuration = 0.3
	Band_DisableAutoStrums name = <objID>
endscript

script AE_SetIK_GuitarL_On_STRANGLEHOLD 
	Obj_GetID
	Band_SetIKChainTarget name = <objID> index = 1 target = BONE_IK_HAND_GUITAR_L BlendDuration = 0.3
endscript

script AE_SetIK_GuitarR_On_STRANGLEHOLD 
	Obj_GetID
	Band_SetIKChainTarget name = <objID> index = 0 target = BONE_IK_HAND_GUITAR_R BlendDuration = 0.3
endscript

script AE_SetIK_SlaveL_On_STRANGLEHOLD 
	Obj_GetID
	Band_SetIKChainTarget name = <objID> index = 1 target = Bone_IK_Hand_Slave_L BlendDuration = 0.3
endscript

script AE_SetIK_SlaveR_On_STRANGLEHOLD 
	Obj_GetID
	Band_SetIKChainTarget name = <objID> index = 0 target = Bone_IK_Hand_Slave_R BlendDuration = 0.3
endscript

script AE_SetIK_Slaves_On_Jimi 
	if ($game_mode = p2_pro_faceoff)
		Obj_GetID
		Band_SetIKChainTarget name = <objID> index = 0 target = Bone_IK_Hand_Slave_R BlendDuration = 0
		Band_SetIKChainTarget name = <objID> index = 1 target = Bone_IK_Hand_Slave_L BlendDuration = 0
	endif
endscript

script AE_SetIK_to_FK_L 
	Obj_GetID
	Bandmanager_setIKchainStrength name = <objID> Chain = BONE_IK_HAND_GUITAR_L strength = 0
	Bandmanager_setIKchainStrength name = <objID> Chain = Bone_IK_Hand_Slave_L strength = 0
	Bandmanager_setIKchainStrength node = lefthandik name = <objID> Chain = BONE_IK_HAND_GUITAR_L strength = 0
	Bandmanager_setIKchainStrength node = lefthandik name = <objID> Chain = Bone_IK_Hand_Slave_L strength = 0
endscript

script AE_SetIK_to_FK_R 
	Obj_GetID
	Bandmanager_setIKchainStrength name = <objID> Chain = BONE_IK_HAND_GUITAR_R strength = 0
	Bandmanager_setIKchainStrength name = <objID> Chain = Bone_IK_Hand_Slave_R strength = 0
	Bandmanager_setIKchainStrength node = righthandik name = <objID> Chain = BONE_IK_HAND_GUITAR_R strength = 0
	Bandmanager_setIKchainStrength node = righthandik name = <objID> Chain = Bone_IK_Hand_Slave_R strength = 0
endscript

script AE_SetIK_to_IK_L 
	Obj_GetID
	Bandmanager_setIKchainStrength name = <objID> Chain = BONE_IK_HAND_GUITAR_L strength = 1
	Bandmanager_setIKchainStrength name = <objID> Chain = Bone_IK_Hand_Slave_L strength = 1
	Bandmanager_setIKchainStrength node = lefthandik name = <objID> Chain = BONE_IK_HAND_GUITAR_L strength = 1
	Bandmanager_setIKchainStrength node = lefthandik name = <objID> Chain = Bone_IK_Hand_Slave_L strength = 1
endscript

script AE_SetIK_to_IK_R 
	Obj_GetID
	Bandmanager_setIKchainStrength name = <objID> Chain = BONE_IK_HAND_GUITAR_R strength = 1
	Bandmanager_setIKchainStrength name = <objID> Chain = Bone_IK_Hand_Slave_R strength = 1
	Bandmanager_setIKchainStrength node = righthandik name = <objID> Chain = BONE_IK_HAND_GUITAR_R strength = 1
	Bandmanager_setIKchainStrength node = righthandik name = <objID> Chain = Bone_IK_Hand_Slave_R strength = 1
endscript

script AE_DisableAutoFret 
	Obj_GetID
	Band_DisableAutoFret name = <objID>
endscript

script AE_EnableAutofret 
	Obj_GetID
	Band_EnableAutoFret name = <objID>
endscript

script AE_DisableAutoStrums 
	Obj_GetID
	Band_DisableAutoStrums name = <objID>
endscript

script AE_EnableAutoStrums 
	Obj_GetID
	Band_EnableAutoStrums name = <objID>
endscript

script AE_DisableAutoChords 
	Obj_GetID
	Band_DisableAutoChords name = <objID>
endscript

script AE_EnableAutoChords 
	Obj_GetID
	Band_EnableAutoChords name = <objID>
endscript

script IK_FK_Switch_Override 
	GMan_SongTool_GetCurrentSong
	if (<current_song> = BandOnTheRun)
		return
	endif
	AE_SetIK_SlaveR_On
endscript

script Band_SetIKChainTarget \{BlendDuration = 0.0}
	Band_SetIKChainTarget_CFunc name = <name> target = <target> index = <index> BlendDuration = <BlendDuration>
endscript

script Band_MoveToNode \{allow_in_2player = false}
	Band_MoveToNode_CFunc allow_in_2player = <allow_in_2player> name = <name> node = <node>
endscript

script Band_MoveToStartNode \{allow_in_2player = false}
	Band_MoveToStartNode_CFunc name = <name> allow_in_2player = <allow_in_2player>
endscript

script Band_RestartIdles 
	BandManager_PlayIdle \{name = musician1
		all_modes = true
		restart}
	BandManager_PlayIdle \{name = musician2
		all_modes = true
		restart}
	BandManager_PlayIdle \{name = musician3
		all_modes = true
		restart}
	BandManager_PlayIdle \{name = musician4
		all_modes = true
		restart}
endscript

script Band_PlayTransitionIdles \{from_restart = false}
	printf \{channel = Pop
		qs(0xf9078adf)}
	GMan_SongTool_GetCurrentSong
	band_builder_get_band_global song = <current_song>
	wait \{2
		gameframes}
	play_intro_anims
	BandManager_TurnOffAllArmAnims
	wait \{1
		gameframes}
	BandManager_SetPlayingIntroAnims
endscript

script BandManager_TurnOffArmAnims 
	Band_DisableAutoStrums name = <name>
	Band_DisableAutoFret name = <name>
	Band_DisableAutoChords name = <name>
endscript

script BandManager_TurnOffAllArmAnims 
	BandManager_TurnOffArmAnims \{name = musician1}
	BandManager_TurnOffArmAnims \{name = musician2}
	BandManager_TurnOffArmAnims \{name = musician3}
	BandManager_TurnOffArmAnims \{name = musician4}
	Band_SetDrumKitState \{name = Drummer
		state = off}
	Band_SetDrumKitState \{name = drummer2
		state = off}
endscript

script BandManager_TurnOnArmAnims 
	Band_EnableAutoStrums name = <name>
	Band_EnableAutoFret name = <name>
	Band_EnableAutoChords name = <name>
endscript

script BandManager_TurnOnAllArmAnims 
	BandManager_TurnOnArmAnims \{name = musician1}
	BandManager_TurnOnArmAnims \{name = musician2}
	BandManager_TurnOnArmAnims \{name = musician3}
	BandManager_TurnOnArmAnims \{name = musician4}
	Band_SetDrumKitState \{name = Drummer
		state = on}
	Band_SetDrumKitState \{name = drummer2
		state = on}
endscript

script Band_SetArmAnimStrength 
	Band_SetArmAnimStrength_CFunc name = <name> target = <target> strength = <strength>
endscript

script Band_SetDrumKitState 
	if ($test_four_guitarists = true || $test_four_vocalists = true)
		return
	endif
	if CompositeObjectExists name = <name>
		if (<state> = on)
		else
		endif
	endif
endscript

script Band_PlayIdle 
	if NOT GotParam \{no_wait}
		wait \{1
			gameframe}
	endif
	BandManager_PlayIdle <...>
endscript

script Band_PlayLoop 
	wait_for_next_odd_frame
	wait \{2
		gameframes}
	override_anim = None
	if Band_IsFemale name = <name>
		if GotParam \{female}
			override_anim = <female>
		endif
	else
		if GotParam \{male}
			override_anim = <male>
		endif
	endif
	GetPlayerInfo \{1
		current_song_beat_time}
	if NOT (<current_song_beat_time> = 0)
		new_tempo = ((1000.0 / <current_song_beat_time>) * 60.0)
		Change tempo_for_anims = <new_tempo>
	else
	endif
	switch <name>
		case Guitarist
		part = guitar
		case Bassist
		part = bass
		case Drummer
		part = Drum
		case Vocalist
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
		BandManager_SetOverrideLoop name = <musician> anim = <override_anim>
		BandManager_RestartLoop name = <musician> start = <start>
	endif
	i = (<i> + 1)
	repeat 4
endscript

script Band_PlayClip \{startframe = 0.0
		override_intro = true}
	GetSongTimeMs
	CastToInteger \{time}
	if NOT GotParam \{AllGameModes}
		if ($game_mode = p2_pro_faceoff)
			return
		endif
	endif
	if NOT should_play_moments
		return
	endif
	if NOT GlobalExists name = <clip> type = structure
		printf channel = anim_info 'WARNING: Band_PlayClip given unknown clip %c.' c = <clip>
		return
	endif
	if StructureContains structure = $<clip> Characters
		GetArraySize ($<clip>.Characters)
		i = 0
		begin
		if StructureContains structure = ($<clip>.Characters [<i>]) anim
			name = ($<clip>.Characters [<i>].name)
			get_musician_id name = <name>
			<name> :Obj_KillSpawnedScript name = return_characters_to_idle_at_song_time
		endif
		repeat <array_size>
	endif
	if NOT GotParam \{no_wait}
		wait_for_next_odd_frame
	endif
	clip_get_time_and_frame
	GetSongTimeMs
	CastToInteger \{time}
	if GotParam \{no_wait}
	else
	endif
	initial_delay = 2
	teleport_delay = 2
	if GotParam \{no_wait}
		initial_delay = 0
		teleport_delay = 0
	endif
	if (<initial_delay> > 0)
		wait <initial_delay> gameframes
	endif
	if StructureContains structure = $<clip> DataFormat
		Band_PlayClip_New_CFunc
		newclipformat = true
	else
		Band_PlayClip_CFunc
		newclipformat = false
	endif
	increase_band_bounding_spheres
	if (<teleport_delay> != 0)
		wait <teleport_delay> gameframes
	endif
	if (<newclipformat> = true)
		Band_PlayClip_Finish_New_CFunc
	else
		Band_PlayClip_Finish_CFunc
	endif
endscript

script increase_band_bounding_spheres 
	return
	if CompositeObjectExists \{name = musician1}
		musician1 :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{name = musician2}
		musician2 :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{name = musician3}
		musician3 :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{name = musician4}
		musician4 :Obj_SetBoundingSphere \{10}
	endif
endscript

script Band_ForceToIdle \{all_modes = false}
	if GotParam \{name}
		if CompositeObjectExists name = <name>
			BandManager_ChangeIK name = <name> enabled = true
			BandManager_PlayIdle name = <name> BlendDuration = 0.0 all_modes = <all_modes>
		endif
	endif
endscript

script Band_ForceAllToIdle \{all_modes = false}
	if NOT GotParam \{no_wait}
		wait \{1
			gameframe}
	endif
	Band_ForceToIdle name = Guitarist all_modes = <all_modes> <...>
	Band_ForceToIdle name = Bassist all_modes = <all_modes> <...>
	Band_ForceToIdle name = Vocalist all_modes = <all_modes> <...>
	Band_ForceToIdle name = Drummer all_modes = <all_modes> <...>
endscript

script Band_MoveAllToStartNodes 
	Band_MoveToStartNode \{name = Guitarist}
	Band_MoveToStartNode \{name = Bassist}
	Band_MoveToStartNode \{name = Vocalist}
	Band_MoveToStartNode \{name = Drummer}
endscript
tempo_for_anims = -1
tempo_for_drum_anims = -1

script Band_SetAnimTempo 
	Change tempo_for_anims = <tempo>
	if ($tempo_for_drum_anims = -1)
		Change tempo_for_drum_anims = <tempo>
	endif
endscript

script Band_SetDrumAnimTempo 
	Change tempo_for_drum_anims = <tempo>
endscript

script Band_ClearAnimTempo 
	Change \{tempo_for_anims = -1}
	Change \{tempo_for_drum_anims = -1}
endscript

script Band_IsFemale 
	if NOT GotParam \{name}
		printf \{qs(0x50e85932)}
		return
	endif
	if NOT CompositeObjectExists name = <name>
		printf qs(0x4594890c) a = <name>
		return
	endif
	<name> :GetSingleTag is_female
	if (<is_female> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script return_characters_to_idle_at_song_time 
	return_to_idle_time = <time>
	begin
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	if (<time> >= <return_to_idle_time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($display_clip_info = true)
		clip_get_time_and_frame
	endif
	wait_for_next_odd_frame
	wait \{2
		gameframes}
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	printf channel = Pop qs(0xa3b676fb) a = <time> b = <name>
	Band_ForceToIdle name = <name> all_modes = <all_modes> <...>
	wait \{2
		gameframes}
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	printf channel = Pop qs(0xa3b3aff3) a = <time> b = <name>
	Band_MoveToStartNode name = <name>
endscript

script clip_get_time_and_frame 
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	seconds = (<time> / 1000.0)
	if (<seconds> < 0)
		seconds = 0
	endif
	minutes = (<seconds> / 60.0)
	CastToInteger \{minutes}
	seconds = (<seconds> - (<minutes> * 60))
	seconds_float = <seconds>
	CastToInteger \{seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <seconds>)
	frame = (<fraction_of_second> * <fps>)
	CastToInteger \{frame}
	if (<seconds> < 10)
		if (<frame> < 10)
			FormatText TextName = time_string qs(0x593819d8) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			FormatText TextName = time_string qs(0xac471e75) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	else
		if (<frame> < 10)
			FormatText TextName = time_string qs(0x31aec87f) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			FormatText TextName = time_string qs(0xcacc8b50) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	endif
	FormatText TextName = time_string qs(0x67b7904f) a = <minutes> b = <seconds> c = <frame> d = <time>
	return time_string = <time_string>
endscript

script debug_print_frame_time 
	seconds = (<time> / 1000.0)
	if (<seconds> < 0)
		seconds = 0
	endif
	minutes = (<seconds> / 60.0)
	CastToInteger \{minutes}
	seconds = (<seconds> - (<minutes> * 60))
	seconds_float = <seconds>
	CastToInteger \{seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <seconds>)
	frame = (<fraction_of_second> * <fps>)
	CastToInteger \{frame}
	if (<seconds> < 10)
		if (<frame> < 10)
			FormatText TextName = time_string qs(0x593819d8) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			FormatText TextName = time_string qs(0xac471e75) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	else
		if (<frame> < 10)
			FormatText TextName = time_string qs(0x31aec87f) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			FormatText TextName = time_string qs(0xcacc8b50) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	endif
	printf channel = AnimInfo <time_string>
endscript

script Band_ShowMic \{name = Guitarist}
	if NOT should_play_moments
		return
	endif
	if ($game_mode = p2_pro_faceoff)
		return
	endif
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if ($Cheat_AirInstruments != 1)
		<name> :show_mic
	endif
endscript

script Band_HideMic \{name = Guitarist}
	if NOT should_play_moments
		return
	endif
	get_musician_id name = <name>
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :hide_mic
endscript

script Band_ShowMic_Stand \{name = Guitarist}
	if NOT should_play_moments
		return
	endif
	if ($game_mode = p2_pro_faceoff)
		return
	endif
	get_musician_id name = <name>
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if ($Cheat_AirInstruments != 1)
		<name> :show_mic_stand
	endif
endscript

script Band_HideMic_Stand \{name = Guitarist}
	if NOT should_play_moments
		return
	endif
	get_musician_id name = <name>
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :hide_mic_stand
endscript

script Band_ShowMic_Microphone \{name = Guitarist}
	if NOT should_play_moments
		return
	endif
	if ($game_mode = p2_pro_faceoff)
		return
	endif
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if ($Cheat_AirInstruments != 1)
		<name> :show_mic_microphone
	endif
endscript

script Band_HideMic_Microphone \{name = Guitarist}
	if NOT should_play_moments
		return
	endif
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :hide_mic_microphone
endscript

script Band_ShowDrumkit \{name = Drummer}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if ($Cheat_AirInstruments != 1)
		<name> :show_drumkit
	endif
endscript

script Band_HideDrumkit \{name = Drummer}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :hide_Drumkit
endscript

script Band_Hide 
	if CompositeObjectExists name = <name>
		<name> :hide
	endif
	BandManager_HideStrings name = <name>
endscript

script Band_UnHide 
	if CompositeObjectExists name = <name>
		if ($Cheat_InvisibleCharacters != 1)
			<name> :unhide
			<name> :Ragdoll_MarkForReset
		endif
	endif
	if ($Cheat_AirInstruments != 1)
		BandManager_ShowStrings name = <name>
	endif
endscript
enable_guitarist_camera_swapping = false

script Band_EnableGuitaristCameraSwapping 
	Change \{enable_guitarist_camera_swapping = true}
endscript

script Band_DisableGuitaristCameraSwapping 
	Change \{enable_guitarist_camera_swapping = false}
endscript

script Transition_ChangeIK 
	BandManager_ChangeIK <...>
endscript

script BandManager_StopFacialAnims 
	<name> :Obj_KillSpawnedScript name = play_special_facial_anim
	<name> :Obj_KillSpawnedScript name = facial_anim_loop
	<name> :hero_clear_facial_anim
endscript

script BandManager_StartFacialAnims 
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :Obj_KillSpawnedScript name = play_special_facial_anim
	<name> :Obj_KillSpawnedScript name = facial_anim_loop
	<name> :Obj_SpawnScriptNow facial_anim_loop
endscript

script BandManager_StartAllFacialAnims 
	BandManager_StartFacialAnims \{name = musician1}
	BandManager_StartFacialAnims \{name = musician2}
	BandManager_StartFacialAnims \{name = musician3}
	BandManager_StartFacialAnims \{name = musician4}
endscript

script BandManager_AirGuitarCheat 
	if ($Cheat_AirInstruments = 1)
		BandManager_HideAllInstruments
	else
		BandManager_UnHideAllInstruments
	endif
endscript

script BandManager_InvisibleCharactersCheat 
	if ($Cheat_InvisibleCharacters = 1)
		BandManager_HideAllMusicians
	else
		BandManager_UnHideAllMusicians
	endif
endscript

script BandManager_HideInstrument 
	if CompositeObjectExists <name>
		<name> :HideInstrument
		BandManager_HideStrings name = <name>
	endif
endscript

script BandManager_UnHideInstrument 
	if CompositeObjectExists <name>
		<name> :UnHideInstrument
		BandManager_ShowStrings name = <name>
	endif
endscript

script BandManager_HideAllInstruments 
	BandManager_HideInstrument \{name = musician1}
	BandManager_HideInstrument \{name = musician2}
	BandManager_HideInstrument \{name = musician3}
	BandManager_HideInstrument \{name = musician4}
endscript

script BandManager_UnHideAllInstruments 
	BandManager_UnHideInstrument \{name = musician1}
	BandManager_UnHideInstrument \{name = musician2}
	BandManager_UnHideInstrument \{name = musician3}
	BandManager_UnHideInstrument \{name = musician4}
endscript

script BandManager_HideMusician 
	if CompositeObjectExists <name>
		<name> :HideMusician
	endif
endscript

script BandManager_UnHideMusician 
	if CompositeObjectExists <name>
		<name> :UnHideMusician
	endif
endscript

script BandManager_HideAllMusicians 
	BandManager_HideMusician \{name = musician1}
	BandManager_HideMusician \{name = musician2}
	BandManager_HideMusician \{name = musician3}
	BandManager_HideMusician \{name = musician4}
endscript

script BandManager_UnHideAllMusicians 
	BandManager_UnHideMusician \{name = musician1}
	BandManager_UnHideMusician \{name = musician2}
	BandManager_UnHideMusician \{name = musician3}
	BandManager_UnHideMusician \{name = musician4}
endscript

script test_all_cameras 
	test_cameras \{name = Guitarist}
	test_cameras \{name = Bassist}
	test_cameras \{name = Vocalist}
endscript

script test_cameras 
	printf \{channel = testcameras
		qs(0x86fbe77a)}
	if NOT GotParam \{name}
		printf \{channel = testcameras
			qs(0x4ca06177)}
		return
	endif
	print_obj_info name = <name>
	ExtendCrc <name> '_mocap_lock_target_01' out = camera1
	print_obj_info name = <camera1> name_string = <name_string>
	ExtendCrc <name> '_mocap_lock_target_02' out = camera2
	print_obj_info name = <camera2> name_string = <name_string>
	printf \{channel = testcameras
		qs(0x86fbe77a)}
endscript

script print_obj_info 
	if NOT CompositeObjectExists name = <name>
		printf channel = testcameras qs(0x68673a19) a = <name>
		return
	endif
	printf channel = testcameras qs(0x0bc409e2) a = <name>
	if <name> :Anim_AnimNodeExists id = BodyTimer
		<name> :Anim_Command target = BodyTimer Command = Timer_GetFrameFactor
		<name> :Anim_Command target = BodyTimer Command = Timer_GetAnimDuration
		printf channel = testcameras qs(0x61b2abb6) a = (<framefactor>) b = <Duration> c = (<framefactor> * <Duration>)
	else
		printf \{channel = testcameras
			qs(0x6255a299)}
	endif
	<name> :Obj_GetPosition
	printf channel = testcameras qs(0x795dba52) a = <Pos>
	<name> :Obj_GetOrientation
	Dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
	printf channel = testcameras qs(0x27ca0b4f) a = <Dir>
endscript

script Band_SimulateTempo 
	switch <name>
		case Guitarist
		Change musician3_tempo = <tempo>
		case Bassist
		Change musician4_tempo = <tempo>
		case Vocalist
		Change musician1_tempo = <tempo>
		case Drummer
		Change musician2_tempo = <tempo>
	endswitch
endscript

script Band_StopSimulateTempo 
	switch <name>
		case Guitarist
		Change \{musician3_tempo = -1}
		case Bassist
		Change \{musician4_tempo = -1}
		case Vocalist
		Change \{musician1_tempo = -1}
		case Drummer
		Change \{musician2_tempo = -1}
	endswitch
endscript

script get_musician_id 
	switch <name>
		case Guitarist
		case Bassist
		case Vocalist
		case Drummer
		if CompositeObjectExists name = <name>
			<name> :Obj_GetID
			name = <objID>
		endif
	endswitch
	return name = <name>
endscript
allow_moments = true

script determine_if_moments_should_play 
	GameMode_GetType
	switch <type>
		case training
		case practice
		case tutorial
		Change \{allow_moments = false}
		return
	endswitch
	GMan_SongTool_GetCurrentSong
	get_band_configuration song = <current_song> skip_dlc_check
	if (<Band> = default_band)
		if is_standard_band_setup
			allowed = true
		else
			allowed = false
		endif
	else
		GameMode_GetType
		if (<type> = career)
			if StructureContains structure = $download_songlist_props <current_song>
				allowed = false
			elseif NOT ShouldUseSongPerformance song = <current_song>
				allowed = false
			else
				allowed = true
			endif
		else
			allowed = false
		endif
	endif
	Change allow_moments = <allowed>
endscript

script should_play_moments 
	if ($allow_moments = true)
		return \{true}
	else
		return \{false}
	endif
endscript

script wait_for_next_even_frame 
	if IsPrimaryFrame
		wait \{2
			gameframes}
	else
		wait \{1
			gameframes}
	endif
endscript

script wait_for_next_odd_frame 
	if IsPrimaryFrame
		wait \{1
			gameframes}
	endif
endscript
