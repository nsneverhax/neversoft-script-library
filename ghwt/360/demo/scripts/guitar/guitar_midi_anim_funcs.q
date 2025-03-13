
script transition_playsimpleanim 
	band_playsimpleanim <...>
	bandmanager_setplayingintroanims name = <name>
endscript

script band_playfacialanim \{name = guitarist}
	if compositeobjectexists name = <name>
		<name> :obj_killspawnedscript name = play_special_facial_anim
		<name> :obj_spawnscriptnow play_special_facial_anim params = {anim = <anim>}
	endif
	if (<name> = vocalist)
		if compositeobjectexists \{name = vocalist2}
			vocalist2 :obj_killspawnedscript \{name = play_special_facial_anim}
			vocalist2 :obj_spawnscriptnow play_special_facial_anim params = {anim = <anim>}
		endif
	endif
endscript

script band_playrockinfacialanim \{name = guitarist}
	if compositeobjectexists name = <name>
		<name> :obj_killspawnedscript name = play_special_facial_anim
		if band_isfemale name = <name>
			printf \{qs(0xc85f8d07)}
			<name> :obj_spawnscriptnow play_special_facial_anim params = {anim = gh_rocker_female_hardrockface_4}
		else
			printf \{qs(0xeda94c27)}
			<name> :obj_spawnscriptnow play_special_facial_anim params = {anim = gh_rocker_male_hardrockface_4}
		endif
	endif
endscript

script band_changefacialanims \{name = guitarist
		ff_anims = facial_anims_female_rocker
		mf_anims = facial_anims_male_rocker
		blend_duration = 0.3}
	if compositeobjectexists name = <name>
		extendcrc <name> '_Info' out = info_struct
		if band_isfemale name = <name>
			change structurename = <info_struct> facial_anims = <ff_anims>
		else
			change structurename = <info_struct> facial_anims = <mf_anims>
		endif
		<name> :obj_killspawnedscript name = play_special_facial_anim
		<name> :obj_killspawnedscript name = facial_anim_loop
		<name> :obj_spawnscriptnow facial_anim_loop params = {blend_duration = <blend_duration>}
	else
		printf qs(0x7eb6ba00) a = <name>
	endif
endscript

script ae_changefacialanims \{ff_anims = facial_anims_female_rocker
		mf_anims = facial_anims_male_rocker
		blend_duration = 0.3}
	obj_getid
	band_changefacialanims name = <objid> ff_anims = <ff_anims> mf_anims = <mf_anims> blend_duration = <blend_duration>
endscript

script band_changestance \{name = guitarist
		stance = stance_a}
	if ($use_drummer_events = 0)
		if (<name> = drummer)
			return
		endif
	endif
	if NOT compositeobjectexists name = <name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<name> = guitarist)
			if compositeobjectexists \{name = bassist}
				launchevent type = change_stance target = bassist data = {<...>}
			endif
		elseif (<name> = bassist)
			return
		endif
	endif
	launchevent type = change_stance target = <name> data = {<...>}
endscript

script band_stopstrumming \{name = guitarist}
	band_setstrumstyle name = <name> male_type = none female_type = none
endscript

script band_enableautostrums 
	band_enableautostrums_cfunc name = <name>
endscript

script band_disableautostrums 
	band_disableautostrums_cfunc name = <name>
endscript

script band_enableautofret 
	band_enableautofret_cfunc name = <name>
endscript

script band_disableautofret 
	band_disableautofret_cfunc name = <name>
endscript

script band_enableautochords 
	band_enableautochords_cfunc name = <name>
endscript

script band_disableautochords 
	band_disableautochords_cfunc name = <name>
endscript

script band_setikchain 
	if (<chain> = guitar)
		printf channel = anim_info qs(0x8af0dabb) s = <name>
		band_setikchaintarget name = <name> index = 0 target = bone_ik_hand_guitar_r
		band_setikchaintarget name = <name> index = 1 target = bone_ik_hand_guitar_l
		band_enableautofret name = <name>
		band_enableautochords name = <name>
		band_enableautostrums name = <name>
	elseif (<chain> = slave)
		printf channel = anim_info qs(0xdb054b27) s = <name>
		band_setikchaintarget name = <name> index = 0 target = bone_ik_hand_slave_r
		band_setikchaintarget name = <name> index = 1 target = bone_ik_hand_slave_l
		band_disableautofret name = <name>
		band_disableautochords name = <name>
		band_disableautostrums name = <name>
	else
		printf channel = anim_info qs(0xab63139d) s = <name>
		band_setikchaintarget name = <name> index = 0 target = bone_ik_hand_slave_r
		band_setikchaintarget name = <name> index = 1 target = bone_ik_hand_slave_l
		band_disableautofret name = <name>
		band_disableautochords name = <name>
		band_disableautostrums name = <name>
	endif
	bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_guitar_l strength = 1
	bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_guitar_r strength = 1
	bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_slave_l strength = 1
	bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_slave_r strength = 1
endscript

script ae_setik_guitarl_off 
	obj_getid
	band_disableautochords name = <objid>
endscript

script ae_setik_guitarr_off 
	obj_getid
	band_disableautostrums name = <objid>
endscript

script ae_setik_slavel_off 
endscript

script ae_setik_slaver_off 
endscript

script ae_setik_guitarl_on 
	obj_getid
	band_setikchaintarget name = <objid> index = 1 target = bone_ik_hand_guitar_l blendduration = 0.3
	band_enableautochords name = <objid>
endscript

script ae_setik_guitarr_on 
	obj_getid
	band_setikchaintarget name = <objid> index = 0 target = bone_ik_hand_guitar_r blendduration = 0.3
	band_enableautostrums name = <objid>
endscript

script ae_setik_slavel_on 
	obj_getid
	band_setikchaintarget name = <objid> index = 1 target = bone_ik_hand_slave_l blendduration = 0.3
	band_disableautochords name = <objid>
endscript

script ae_setik_slaver_on 
	obj_getid
	band_setikchaintarget name = <objid> index = 0 target = bone_ik_hand_slave_r blendduration = 0.3
	band_disableautostrums name = <objid>
endscript

script ae_setik_guitarl_on_stranglehold 
	obj_getid
	band_setikchaintarget name = <objid> index = 1 target = bone_ik_hand_guitar_l blendduration = 0.3
endscript

script ae_setik_guitarr_on_stranglehold 
	obj_getid
	band_setikchaintarget name = <objid> index = 0 target = bone_ik_hand_guitar_r blendduration = 0.3
endscript

script ae_setik_slavel_on_stranglehold 
	obj_getid
	band_setikchaintarget name = <objid> index = 1 target = bone_ik_hand_slave_l blendduration = 0.3
endscript

script ae_setik_slaver_on_stranglehold 
	obj_getid
	band_setikchaintarget name = <objid> index = 0 target = bone_ik_hand_slave_r blendduration = 0.3
endscript

script ae_setik_slaves_on_jimi 
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		obj_getid
		band_setikchaintarget name = <objid> index = 0 target = bone_ik_hand_slave_r blendduration = 0
		band_setikchaintarget name = <objid> index = 1 target = bone_ik_hand_slave_l blendduration = 0
	endif
endscript

script ae_setik_to_fk_l 
	obj_getid
	bandmanager_setikchainstrength name = <objid> chain = bone_ik_hand_guitar_l strength = 0
	bandmanager_setikchainstrength name = <objid> chain = bone_ik_hand_slave_l strength = 0
endscript

script ae_setik_to_fk_r 
	obj_getid
	bandmanager_setikchainstrength name = <objid> chain = bone_ik_hand_guitar_r strength = 0
	bandmanager_setikchainstrength name = <objid> chain = bone_ik_hand_slave_r strength = 0
endscript

script ae_setik_to_ik_l 
	obj_getid
	bandmanager_setikchainstrength name = <objid> chain = bone_ik_hand_guitar_l strength = 1
	bandmanager_setikchainstrength name = <objid> chain = bone_ik_hand_slave_l strength = 1
endscript

script ae_setik_to_ik_r 
	obj_getid
	bandmanager_setikchainstrength name = <objid> chain = bone_ik_hand_guitar_r strength = 1
	bandmanager_setikchainstrength name = <objid> chain = bone_ik_hand_slave_r strength = 1
endscript

script ae_disableautofret 
	obj_getid
	band_disableautofret name = <objid>
endscript

script ae_enableautofret 
	obj_getid
	band_enableautofret name = <objid>
endscript

script ik_fk_switch_override 
	if ($current_song = bandontherun)
		return
	endif
	ae_setik_slaver_on
endscript

script band_setikchaintarget \{blendduration = 0.0}
	band_setikchaintarget_cfunc name = <name> target = <target> index = <index> blendduration = <blendduration>
endscript

script band_movetonode \{allow_in_2player = false}
	band_movetonode_cfunc allow_in_2player = <allow_in_2player> name = <name> node = <node>
endscript

script band_movetostartnode \{allow_in_2player = false}
	band_movetostartnode_cfunc name = <name> allow_in_2player = <allow_in_2player>
endscript

script band_playattackanim 
	if NOT compositeobjectexists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [<type>].name)
	if (($player1_status.band_member) = <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT structurecontains structure = $<battle_anims> name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.attack_anim)
	if NOT (<anim> = none)
		launchevent type = play_battle_anim target = <name> data = {<...> no_wait}
	endif
endscript

script band_playresponseanim 
	if NOT compositeobjectexists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [<type>].name)
	if (($player1_status.band_member) = <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT structurecontains structure = $<battle_anims> name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.response_anim)
	if NOT (<anim> = none)
		launchevent type = play_battle_anim target = <name> data = {<...>}
	endif
endscript

script bassist_should_use_guitarist_commands 
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if ($boss_battle = 0)
			return \{true}
		endif
	endif
	return \{false}
endscript

script band_restartidles 
	bandmanager_playidle \{name = guitarist
		all_modes = true
		restart}
	bandmanager_playidle \{name = bassist
		all_modes = true
		restart}
	bandmanager_playidle \{name = vocalist
		all_modes = true
		restart}
	bandmanager_playidle \{name = drummer
		all_modes = true
		restart}
endscript

script band_playtransitionidles \{from_restart = false}
	printf \{channel = pop
		qs(0xf9078adf)}
	band_builder_get_band_global
	band_restartidles
	jimi_is_present = false
	if (<band> = band_hendrix)
		if NOT ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
			jimi_is_present = true
		endif
	endif
	if ((<jimi_is_present> = true) && (<from_restart> = true))
		band_playclip \{clip = song_loading_with_jimi
			no_wait
			allgamemodes}
	elseif has_singing_guitarist <...>
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
	wait \{1
		gameframes}
	bandmanager_setplayingintroanims
endscript

script bandmanager_turnoffarmanims 
	band_disableautostrums name = <name>
	band_disableautofret name = <name>
	band_disableautochords name = <name>
endscript

script bandmanager_turnoffallarmanims 
	bandmanager_turnoffarmanims \{name = guitarist}
	bandmanager_turnoffarmanims \{name = guitarist2}
	bandmanager_turnoffarmanims \{name = bassist}
	bandmanager_turnoffarmanims \{name = vocalist}
	band_setdrumkitstate \{name = drummer
		state = off}
	band_setdrumkitstate \{name = drummer2
		state = off}
endscript

script bandmanager_turnonarmanims 
	band_enableautostrums name = <name>
	band_enableautofret name = <name>
	band_enableautochords name = <name>
endscript

script bandmanager_turnonallarmanims 
	bandmanager_turnonarmanims \{name = guitarist}
	bandmanager_turnonarmanims \{name = guitarist2}
	bandmanager_turnonarmanims \{name = bassist}
	bandmanager_turnonarmanims \{name = vocalist}
	band_setdrumkitstate \{name = drummer
		state = on}
	band_setdrumkitstate \{name = drummer2
		state = on}
endscript

script band_setarmanimstrength 
	band_setarmanimstrength_cfunc name = <name> target = <target> strength = <strength>
endscript

script band_setdrumkitstate 
	if compositeobjectexists name = <name>
		if (<state> = on)
			<name> :anim_command target = drumkit command = applydrumkitdifference_enable
		else
			<name> :anim_command target = drumkit command = applydrumkitdifference_disable
		endif
	endif
endscript

script band_playidle 
	if NOT gotparam \{no_wait}
		wait \{1
			gameframe}
	endif
	bandmanager_playidle <...>
endscript

script band_playclip \{startframe = 0.0
		override_intro = true}
	if NOT gotparam \{allgamemodes}
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
			return
		endif
	endif
	clip_get_time_and_frame
	getsongtimems \{time_offset = $time_gem_offset_with_lag}
	casttointeger \{time}
	printf channel = anim_info qs(0x875e8219) b = <clip>
	if gotparam \{no_wait}
		printf channel = pop qs(0x2b19675b) a = <time> b = <clip> donotresolve
	else
		printf channel = pop qs(0xc518c1d7) a = <time> b = <clip> donotresolve
	endif
	initial_delay = 1
	teleport_delay = 1
	if gotparam \{no_wait}
		initial_delay = 0
		teleport_delay = 0
	endif
	if (<initial_delay> > 0)
		wait <initial_delay> gameframes
	endif
	band_playclip_cfunc
	if compositeobjectexists \{name = guitarist}
		guitarist :obj_setboundingsphere \{10}
	endif
	if compositeobjectexists \{name = bassist}
		bassist :obj_setboundingsphere \{10}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_setboundingsphere \{10}
	endif
	if (<teleport_delay> != 0)
		wait <teleport_delay> gameframes
	endif
	band_playclip_finish_cfunc
	printf channel = anim_info qs(0x0910e228) b = <clip>
endscript

script band_forcetoidle \{all_modes = false}
	if gotparam \{name}
		if compositeobjectexists name = <name>
			bandmanager_changeik name = <name> enabled = true
			bandmanager_playidle name = <name> blendduration = 0.0 random_start_time = true all_modes = <all_modes>
		endif
	endif
endscript

script band_forcealltoidle \{all_modes = false}
	if NOT gotparam \{no_wait}
		wait \{1
			gameframe}
	endif
	band_forcetoidle name = guitarist all_modes = <all_modes> <...>
	band_forcetoidle name = bassist all_modes = <all_modes> <...>
	band_forcetoidle name = vocalist all_modes = <all_modes> <...>
	band_forcetoidle name = drummer all_modes = <all_modes> <...>
endscript

script band_movealltostartnodes 
	band_movetostartnode \{name = guitarist}
	band_movetostartnode \{name = bassist}
	band_movetostartnode \{name = vocalist}
	band_movetostartnode \{name = drummer}
endscript
tempo_for_anims = -1
tempo_for_drum_anims = -1

script band_setanimtempo 
	change tempo_for_anims = <tempo>
	if ($tempo_for_drum_anims = -1)
		change tempo_for_drum_anims = <tempo>
	endif
endscript

script band_setdrumanimtempo 
	change tempo_for_drum_anims = <tempo>
endscript

script band_clearanimtempo 
	change \{tempo_for_anims = -1}
	change \{tempo_for_drum_anims = -1}
endscript

script band_isfemale 
	if NOT gotparam \{name}
		printf \{qs(0x50e85932)}
		return
	endif
	if NOT compositeobjectexists name = <name>
		printf qs(0x4594890c) a = <name>
		return
	endif
	<name> :getsingletag is_female
	if (<is_female> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script return_characters_to_idle_after_delay 
	wait <delay> seconds
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
	return_to_idle_time = <time>
	begin
	getsongtimems \{time_offset = $time_gem_offset_with_lag}
	if (<time> >= <return_to_idle_time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($display_clip_info = true)
		clip_get_time_and_frame
		printf channel = clip qs(0x9d885cfe) b = <time_string>
	endif
	wait \{1
		gameframes}
	getsongtimems \{time_offset = $time_gem_offset_with_lag}
	casttointeger \{time}
	printf channel = pop qs(0xa394d873) a = <time>
	band_forcealltoidle \{all_modes = true
		no_wait}
	wait \{1
		gameframes}
	getsongtimems \{time_offset = $time_gem_offset_with_lag}
	casttointeger \{time}
	printf channel = pop qs(0x8b4aceb9) a = <time>
	band_movealltostartnodes
endscript

script clip_get_time_and_frame 
	getsongtimems \{time_offset = $time_gem_offset_with_lag}
	seconds = (<time> / 1000.0)
	if (<seconds> < 0)
		seconds = 0
	endif
	minutes = (<seconds> / 60.0)
	casttointeger \{minutes}
	seconds = (<seconds> - (<minutes> * 60))
	seconds_float = <seconds>
	casttointeger \{seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <seconds>)
	frame = (<fraction_of_second> * <fps>)
	casttointeger \{frame}
	if (<seconds> < 10)
		if (<frame> < 10)
			formattext textname = time_string qs(0x593819d8) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			formattext textname = time_string qs(0xac471e75) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	else
		if (<frame> < 10)
			formattext textname = time_string qs(0x31aec87f) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			formattext textname = time_string qs(0xcacc8b50) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	endif
	formattext textname = time_string qs(0x67b7904f) a = <minutes> b = <seconds> c = <frame> d = <time>
	return time_string = <time_string>
endscript

script debug_print_frame_time 
	seconds = (<time> / 1000.0)
	if (<seconds> < 0)
		seconds = 0
	endif
	minutes = (<seconds> / 60.0)
	casttointeger \{minutes}
	seconds = (<seconds> - (<minutes> * 60))
	seconds_float = <seconds>
	casttointeger \{seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <seconds>)
	frame = (<fraction_of_second> * <fps>)
	casttointeger \{frame}
	if (<seconds> < 10)
		if (<frame> < 10)
			formattext textname = time_string qs(0x593819d8) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			formattext textname = time_string qs(0xac471e75) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	else
		if (<frame> < 10)
			formattext textname = time_string qs(0x31aec87f) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			formattext textname = time_string qs(0xcacc8b50) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	endif
	printf channel = animinfo <time_string>
endscript

script test_all_cameras 
	test_cameras \{name = guitarist}
	test_cameras \{name = bassist}
	test_cameras \{name = vocalist}
endscript

script test_cameras 
	printf \{channel = testcameras
		qs(0x86fbe77a)}
	if NOT gotparam \{name}
		printf \{channel = testcameras
			qs(0x4ca06177)}
		return
	endif
	print_obj_info name = <name>
	extendcrc <name> '_mocap_lock_target_01' out = camera1
	print_obj_info name = <camera1> name_string = <name_string>
	extendcrc <name> '_mocap_lock_target_02' out = camera2
	print_obj_info name = <camera2> name_string = <name_string>
	printf \{channel = testcameras
		qs(0x86fbe77a)}
endscript

script print_obj_info 
	if NOT compositeobjectexists name = <name>
		printf channel = testcameras qs(0x68673a19) a = <name>
		return
	endif
	printf channel = testcameras qs(0x0bc409e2) a = <name>
	if <name> :anim_animnodeexists id = bodytimer
		<name> :anim_command target = bodytimer command = timer_getframefactor
		<name> :anim_command target = bodytimer command = timer_getanimduration
		printf channel = testcameras qs(0x61b2abb6) a = (<framefactor>) b = <duration> c = (<framefactor> * <duration>)
	else
		printf \{channel = testcameras
			qs(0x6255a299)}
	endif
	<name> :obj_getposition
	printf channel = testcameras qs(0x795dba52) a = <pos>
	<name> :obj_getorientation
	dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
	printf channel = testcameras qs(0x27ca0b4f) a = <dir>
endscript

script band_showmic \{name = guitarist}
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	if NOT compositeobjectexists name = <name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<name> :show_mic
	endif
endscript

script band_hidemic \{name = guitarist}
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :hide_mic
endscript

script band_showmic_stand \{name = guitarist}
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	if NOT compositeobjectexists name = <name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<name> :show_mic_stand
	endif
endscript

script band_hidemic_stand \{name = guitarist}
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :hide_mic_stand
endscript

script band_showmic_microphone \{name = guitarist}
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	if NOT compositeobjectexists name = <name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<name> :show_mic_microphone
	endif
endscript

script band_hidemic_microphone \{name = guitarist}
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :hide_mic_microphone
endscript

script band_showdrumkit \{name = drummer}
	if NOT compositeobjectexists name = <name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<name> :show_drumkit
	endif
endscript

script band_hidedrumkit \{name = drummer}
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :hide_drumkit
endscript

script band_hide 
	if compositeobjectexists name = <name>
		<name> :hide
	endif
	bandmanager_hidestrings name = <name>
endscript

script band_unhide 
	if compositeobjectexists name = <name>
		if ($cheat_invisiblecharacters != 1)
			<name> :unhide
			<name> :ragdoll_markforreset
		endif
	endif
	if ($cheat_airinstruments != 1)
		bandmanager_showstrings name = <name>
	endif
endscript
enable_guitarist_camera_swapping = false

script band_enableguitaristcameraswapping 
	change \{enable_guitarist_camera_swapping = true}
endscript

script band_disableguitaristcameraswapping 
	change \{enable_guitarist_camera_swapping = false}
endscript

script transition_changeik 
	bandmanager_changeik <...>
endscript

script bandmanager_stopfacialanims 
	<name> :obj_killspawnedscript name = play_special_facial_anim
	<name> :obj_killspawnedscript name = facial_anim_loop
	<name> :hero_clear_facial_anim
endscript

script bandmanager_startfacialanims 
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :obj_killspawnedscript name = play_special_facial_anim
	<name> :obj_killspawnedscript name = facial_anim_loop
	<name> :obj_spawnscriptnow facial_anim_loop
endscript

script bandmanager_startallfacialanims 
	bandmanager_startfacialanims \{name = guitarist}
	bandmanager_startfacialanims \{name = guitarist2}
	bandmanager_startfacialanims \{name = bassist}
	bandmanager_startfacialanims \{name = vocalist}
	bandmanager_startfacialanims \{name = vocalist2}
	bandmanager_startfacialanims \{name = drummer}
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
	if compositeobjectexists <name>
		<name> :hideinstrument
		bandmanager_hidestrings name = <name>
	endif
endscript

script bandmanager_hideallinstruments 
	bandmanager_hideinstrument \{name = guitarist}
	bandmanager_hideinstrument \{name = guitarist2}
	bandmanager_hideinstrument \{name = bassist}
	bandmanager_hideinstrument \{name = vocalist}
	bandmanager_hideinstrument \{name = vocalist2}
	bandmanager_hideinstrument \{name = drummer}
endscript

script bandmanager_hidemusician 
	if compositeobjectexists <name>
		<name> :hidemusician
	endif
endscript

script bandmanager_hideallmusicians 
	bandmanager_hidemusician \{name = guitarist}
	bandmanager_hidemusician \{name = guitarist2}
	bandmanager_hidemusician \{name = bassist}
	bandmanager_hidemusician \{name = vocalist}
	bandmanager_hidemusician \{name = vocalist2}
	bandmanager_hidemusician \{name = drummer}
endscript
