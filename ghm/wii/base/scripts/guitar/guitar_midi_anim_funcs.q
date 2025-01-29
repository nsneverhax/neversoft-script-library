
script transition_playsimpleanim 
	Band_PlaySimpleAnim <...>
	bandmanager_setplayingintroanims Name = <Name>
endscript

script Band_PlayFacialAnim \{Name = GUITARIST}
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
		return
	endif
	if CompositeObjectExists Name = <Name>
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = <anim>}
	endif
	if (<Name> = vocalist)
		if CompositeObjectExists \{Name = vocalist2}
			vocalist2 :Obj_KillSpawnedScript \{Name = play_special_facial_anim}
			vocalist2 :Obj_SpawnScriptNow play_special_facial_anim params = {anim = <anim>}
		endif
	endif
endscript

script band_playrockinfacialanim \{Name = GUITARIST}
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
	if CompositeObjectExists Name = <Name>
		ExtendCrc <Name> '_Info' out = info_struct
		if ((GotParam ff_anims) || (GotParam mf_anims))
			if band_isfemale Name = <Name>
				Change structurename = <info_struct> facial_anims = <ff_anims>
			else
				Change structurename = <info_struct> facial_anims = <mf_anims>
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
		printf qs(0x7eb6ba00) a = <Name>
	endif
endscript

script ae_changefacialanims \{ff_anims = facial_anims_female_rocker
		mf_anims = facial_anims_male_rocker
		blend_duration = 0.3}
	Obj_GetID
	band_changefacialanims Name = <objID> ff_anims = <ff_anims> mf_anims = <mf_anims> blend_duration = <blend_duration>
endscript

script Band_ChangeStance \{Name = GUITARIST
		stance = Stance_A}
	if ($use_drummer_events = 0)
		if (<Name> = drummer)
			return
		endif
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<Name> = GUITARIST)
			if CompositeObjectExists \{Name = BASSIST}
				LaunchEvent Type = change_stance target = BASSIST data = {<...>}
			endif
		elseif (<Name> = BASSIST)
			return
		endif
	endif
	LaunchEvent Type = change_stance target = <Name> data = {<...>}
endscript

script Band_StopStrumming \{Name = GUITARIST}
	Band_SetStrumStyle Name = <Name> male_type = None female_type = None
endscript

script 0x7ff9249f 
	band_enableautostrums_cfunc Name = <Name>
endscript

script 0xfb703956 
	band_disableautostrums_cfunc Name = <Name>
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

script band_enableautochords \{blendtime = $enable_chord_blend_time}
	band_enableautochords_cfunc Name = <Name> blendtime = <blendtime>
endscript

script band_disableautochords \{blendtime = $enable_chord_blend_time}
	band_disableautochords_cfunc Name = <Name> blendtime = <blendtime>
endscript

script band_setikchain \{chord_blend_time = 0}
	if (<Chain> = guitar)
		printf channel = anim_info qs(0x8af0dabb) s = <Name>
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Guitar_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Guitar_L
		band_enableautofret Name = <Name>
		band_enableautochords Name = <Name> blendtime = <chord_blend_time>
		band_enableautostrums Name = <Name>
	elseif (<Chain> = slave)
		printf channel = anim_info qs(0xdb054b27) s = <Name>
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Slave_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Slave_L
		band_disableautofret Name = <Name>
		band_disableautochords Name = <Name> blendtime = <chord_blend_time>
		band_disableautostrums Name = <Name>
	else
		printf channel = anim_info qs(0xab63139d) s = <Name>
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Slave_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Slave_L
		band_disableautofret Name = <Name>
		band_disableautochords Name = <Name> blendtime = <chord_blend_time>
		band_disableautostrums Name = <Name>
	endif
	bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_L Strength = 1
	bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_R Strength = 1
	bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_L Strength = 1
	bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_R Strength = 1
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
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
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

script ae_disableautochords \{blendtime = $enable_chord_blend_time}
	Obj_GetID
	band_disableautochords Name = <objID> blendtime = <blendtime>
endscript

script ae_enableautochords \{blendtime = $enable_chord_blend_time}
	Obj_GetID
	band_enableautochords Name = <objID> blendtime = <blendtime>
endscript

script ae_disableautostrums 
	Obj_GetID
	band_disableautostrums Name = <objID>
endscript

script ae_enableautostrums 
	Obj_GetID
	band_enableautostrums Name = <objID>
endscript

script ik_fk_switch_override 
	if ($current_song = bandontherun)
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

script Band_PlayAttackAnim 
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	attack_type = ($battlemode_powerups [<Type>].Name)
	if (($player1_status.band_member) = <Name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <Name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains structure = $<battle_anims> Name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.attack_anim)
	if NOT (<anim> = None)
		LaunchEvent Type = play_battle_anim target = <Name> data = {<...> no_wait}
	endif
endscript

script Band_PlayResponseAnim 
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	attack_type = ($battlemode_powerups [<Type>].Name)
	if (($player1_status.band_member) = <Name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <Name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains structure = $<battle_anims> Name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.response_anim)
	if NOT (<anim> = None)
		LaunchEvent Type = play_battle_anim target = <Name> data = {<...>}
	endif
endscript

script bassist_should_use_guitarist_commands 
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if ($boss_battle = 0)
			return \{true}
		endif
	endif
	return \{FALSE}
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
	printf \{channel = pop
		qs(0xf9078adf)}
	band_builder_get_band_global
	band_restartidles
	get_band_name song = ($current_song)
	if is_current_band_metallica
		clip = song_loading_metallica
	elseif (<Band> = band_lemmy)
		clip = song_loading_lemmy
	elseif (<Band> = band_kingdiamond)
		clip = song_loading_kingd
	elseif has_singing_guitarist <...>
		clip = song_loading_singing_guitarist
	elseif has_singing_bassist <...>
		clip = song_loading_singing_guitarist
	else
		clip = song_loading
	endif
	band_playclip clip = <clip> no_wait allgamemodes
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
	bandmanager_turnoffarmanims \{Name = vocalist}
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
	bandmanager_turnonarmanims \{Name = vocalist}
	band_setdrumkitstate \{Name = drummer
		state = On}
	band_setdrumkitstate \{Name = drummer2
		state = On}
endscript

script band_setarmanimstrength \{blend_time = 0.0}
	band_setarmanimstrength_cfunc Name = <Name> target = <target> Strength = <Strength> blend_time = <blend_time>
endscript

script band_setdrumkitstate 
	if CompositeObjectExists Name = <Name>
		if (<state> = On)
			<Name> :Anim_Command target = drumkit Command = applydrumkitdifference_enable
		else
			<Name> :Anim_Command target = drumkit Command = applydrumkitdifference_disable
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

script band_playclip \{startframe = 0.0
		override_intro = true
		0xddceec2a = 4}
	if NOT GotParam \{allgamemodes}
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
			return
		endif
	endif
	clip_get_time_and_frame
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	initial_delay = 1
	teleport_delay = 1
	if GotParam \{no_wait}
		initial_delay = 0
		teleport_delay = 0
	endif
	if NOT GotParam \{no_wait}
		if ($0x1bbd2941 = 1 && $current_song != forwhomthebelltolls)
			getlogicframe
			start_frame = <logicframe>
			Change \{0x1bbd2941 = 0}
			begin
			if ($0x1bbd2941 = 1)
				break
			endif
			getlogicframe
			if (<logicframe> - <start_frame> > <0xddceec2a>)
				printf \{qs(0x415efab7)}
				break
			endif
			WaitOneGameFrame
			repeat
		endif
	endif
	band_playclip_cfunc
	if CompositeObjectExists \{Name = GUITARIST}
		GUITARIST :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{Name = vocalist}
		vocalist :Obj_SetBoundingSphere \{10}
	endif
	if (<teleport_delay> != 0)
		Wait <teleport_delay> gameframes
	endif
	band_playclip_finish_cfunc
endscript

script band_forcetoidle \{all_modes = FALSE}
	if GotParam \{Name}
		if CompositeObjectExists Name = <Name>
			bandmanager_changeik Name = <Name> Enabled = true
			bandmanager_playidle Name = <Name> BlendDuration = 0.0 random_start_time = true all_modes = <all_modes>
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

script return_characters_to_idle_after_delay 
	Wait <delay> Seconds
	if ($display_clip_info = true)
		clip_get_time_and_frame
		printf channel = clip qs(0x9d885cfe) b = <time_string>
	endif
	clip_get_time_and_frame
	band_movealltostartnodes
	band_forcealltoidle \{all_modes = true
		no_wait}
endscript

script return_characters_to_idle_at_song_time 
	return_to_idle_time = (<time> -166.667)
	printf qs(0x22877929) f = <return_to_idle_time>
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
		printf channel = clip qs(0x014d1b39) b = <time_string> f = <return_to_idle_time>
	endif
	Wait \{1
		gameframes}
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	printf channel = pop qs(0xe245cd70) a = <time>
	Change \{0x8b7966da = 0}
	begin
	if ($0x8b7966da = 1)
		GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
		CastToInteger \{time}
		printf qs(0x90dd958c) a = <time>
		break
	endif
	WaitOneGameFrame
	repeat
	band_forcetoidle Name = <Name> all_modes = <all_modes> <...>
	Wait \{1
		gameframes}
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	printf channel = pop qs(0x7c0066d4) a = <time>
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

script band_showmic \{Name = GUITARIST}
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
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
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic
endscript

script band_showmic_stand \{Name = GUITARIST}
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
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
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic_stand
endscript

script band_showmic_microphone \{Name = GUITARIST}
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
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
	bandmanager_startfacialanims \{Name = vocalist}
	bandmanager_startfacialanims \{Name = vocalist2}
	bandmanager_startfacialanims \{Name = drummer}
endscript

script bandmanager_airguitarcheat 
	if ($cheat_airinstruments = 1)
		bandmanager_hideallinstruments
	endif
endscript

script bandmanager_invisiblecharacterscheat 
	if ($cheat_invisiblecharacters = 1)
		bandmanager_hideallmusicians
	endif
endscript

script bandmanager_hideinstrument 
	if CompositeObjectExists <Name>
		<Name> :hideinstrument
		bandmanager_hidestrings Name = <Name>
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

script bandmanager_hidemusician 
	if CompositeObjectExists <Name>
		<Name> :hidemusician
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
