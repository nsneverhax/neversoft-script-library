
script transition_playsimpleanim 
	band_playsimpleanim <...>
	bandmanager_setplayingintroanims name = <name>
endscript

script play_facial_anim_on_character \{name = guitarist}
	if compositeobjectexists name = <name>
		<name> :obj_killspawnedscript name = play_special_facial_anim
		<name> :obj_spawnscriptnow play_special_facial_anim params = {anim = <anim>}
	endif
endscript

script band_playfacialanim \{name = guitarist}
	gamemode_gettype
	switch <type>
		case training
		case practice
		case tutorial
		return \{false}
	endswitch
	if gotparam \{name}
		if (<name> = vocalist)
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
				play_facial_anim_on_character name = <musician> anim = <anim>
			endif
			i = (<i> + 1)
			repeat 4
		else
			get_musician_id name = <name>
			extendcrc <name> '_info' out = info_struct
			if (($<info_struct>.part) != vocals)
				play_facial_anim_on_character name = <name> anim = <anim>
			endif
		endif
	elseif gotparam \{part}
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

script band_playrockinfacialanim \{name = guitarist}
	get_musician_id name = <name>
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
		blend_duration = 0.3}
	get_musician_id name = <name>
	printf \{qs(0x940afbfa)
		channel = animinfo}
	if compositeobjectexists name = <name>
		printf \{qs(0x85140bfa)
			channel = animinfo}
		extendcrc <name> '_Info' out = info_struct
		if ((gotparam ff_anims) || (gotparam mf_anims))
			if band_isfemale name = <name>
				if gotparam \{ff_anims}
					printf \{qs(0xc85f8d07)
						channel = animinfo}
					change structurename = <info_struct> facial_anims = <ff_anims>
				endif
			else
				if gotparam \{mf_anims}
					printf \{qs(0xeda94c27)
						channel = animinfo}
					change structurename = <info_struct> facial_anims = <mf_anims>
				endif
			endif
		else
			fa_default = ($<info_struct>.facial_anims_default)
			if gotparam \{fa_type}
				extendcrc <fa_default> <fa_type> out = fa_anims
				printf qs(0x3bb16ef0) a = <fa_anims> channel = animinfo
			else
				fa_anims = <fa_default>
			endif
			change structurename = <info_struct> facial_anims = <fa_anims>
		endif
		<name> :obj_killspawnedscript name = play_special_facial_anim
		<name> :obj_killspawnedscript name = facial_anim_loop
		<name> :obj_spawnscriptnow facial_anim_loop params = {blend_duration = <blend_duration>}
	else
		printf qs(0x7eb6ba00) a = <name> channel = animinfo
	endif
endscript

script ae_changefacialanims \{blend_duration = 0.3}
	obj_getid
	if NOT ((gotparam ff_anims) || (gotparam mf_anims) || (gotparam fa_type))
		scriptassert \{qs(0x1ea5580d)}
	endif
	band_changefacialanims name = <objid> blend_duration = <blend_duration> <...>
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
		band_setikchaintarget name = <name> index = 0 target = bone_ik_hand_guitar_r
		band_setikchaintarget name = <name> index = 1 target = bone_ik_hand_guitar_l
		band_enableautofret name = <name>
		band_enableautochords name = <name>
		band_enableautostrums name = <name>
		bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_guitar_l strength = 1
		bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_guitar_r strength = 1
	elseif (<chain> = slave)
		band_setikchaintarget name = <name> index = 0 target = bone_ik_hand_slave_r
		band_setikchaintarget name = <name> index = 1 target = bone_ik_hand_slave_l
		band_disableautofret name = <name>
		band_disableautochords name = <name>
		band_disableautostrums name = <name>
		bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_slave_l strength = 1
		bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_slave_r strength = 1
	elseif (<chain> = fk)
		bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_guitar_l strength = 0
		bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_guitar_r strength = 0
		bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_slave_l strength = 0
		bandmanager_setikchainstrength name = <name> chain = bone_ik_hand_slave_r strength = 0
	else
		band_setikchaintarget name = <name> index = 0 target = bone_ik_hand_slave_r
		band_setikchaintarget name = <name> index = 1 target = bone_ik_hand_slave_l
		band_disableautofret name = <name>
		band_disableautochords name = <name>
		band_disableautostrums name = <name>
	endif
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
	if ($game_mode = p2_pro_faceoff)
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

script ae_disableautostrums 
	obj_getid
	band_disableautostrums name = <objid>
endscript

script ae_enableautostrums 
	obj_getid
	band_enableautostrums name = <objid>
endscript

script ae_disableautochords 
	obj_getid
	band_disableautochords name = <objid>
endscript

script ae_enableautochords 
	obj_getid
	band_enableautochords name = <objid>
endscript

script ik_fk_switch_override 
	gman_songtool_getcurrentsong
	if (<current_song> = bandontherun)
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

script band_restartidles 
	bandmanager_playidle \{name = musician1
		all_modes = true
		restart}
	bandmanager_playidle \{name = musician2
		all_modes = true
		restart}
	bandmanager_playidle \{name = musician3
		all_modes = true
		restart}
	bandmanager_playidle \{name = musician4
		all_modes = true
		restart}
endscript

script band_playtransitionidles \{from_restart = false}
	printf \{channel = pop
		qs(0xf9078adf)}
	gman_songtool_getcurrentsong
	band_builder_get_band_global song = <current_song>
	wait \{2
		gameframes}
	play_intro_anims
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
	bandmanager_turnoffarmanims \{name = musician1}
	bandmanager_turnoffarmanims \{name = musician2}
	bandmanager_turnoffarmanims \{name = musician3}
	bandmanager_turnoffarmanims \{name = musician4}
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
	bandmanager_turnonarmanims \{name = musician1}
	bandmanager_turnonarmanims \{name = musician2}
	bandmanager_turnonarmanims \{name = musician3}
	bandmanager_turnonarmanims \{name = musician4}
	band_setdrumkitstate \{name = drummer
		state = on}
	band_setdrumkitstate \{name = drummer2
		state = on}
endscript

script band_setarmanimstrength 
	band_setarmanimstrength_cfunc name = <name> target = <target> strength = <strength>
endscript

script band_setdrumkitstate 
	if ($test_four_guitarists = true || $test_four_vocalists = true)
		return
	endif
	if compositeobjectexists name = <name>
		if (<state> = on)
		else
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

script band_playloop 
	wait_for_next_even_frame
	wait \{1
		gameframe}
	override_anim = none
	if band_isfemale name = <name>
		if gotparam \{female}
			override_anim = <female>
		endif
	else
		if gotparam \{male}
			override_anim = <male>
		endif
	endif
	getplayerinfo \{1
		current_song_beat_time}
	new_tempo = ((1000.0 / <current_song_beat_time>) * 60.0)
	change tempo_for_anims = <new_tempo>
	switch <name>
		case guitarist
		part = guitar
		case bassist
		part = bass
		case drummer
		part = drum
		case vocalist
		part = vocals
		default
		scriptassert \{'Unknown part!'}
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
		bandmanager_setoverrideloop name = <musician> anim = <override_anim>
		bandmanager_restartloop name = <musician> start = <start>
	endif
	i = (<i> + 1)
	repeat 4
endscript

script band_playclip \{startframe = 0.0
		override_intro = true}
	getsongtimems
	casttointeger \{time}
	if NOT gotparam \{allgamemodes}
		if ($game_mode = p2_pro_faceoff)
			return
		endif
	endif
	if NOT should_play_moments
		return
	endif
	if NOT globalexists name = <clip> type = structure
		printf channel = anim_info 'WARNING: Band_PlayClip given unknown clip %c.' c = <clip>
		return
	endif
	if structurecontains structure = $<clip> characters
		getarraysize ($<clip>.characters)
		i = 0
		begin
		if structurecontains structure = ($<clip>.characters [<i>]) anim
			name = ($<clip>.characters [<i>].name)
			get_musician_id name = <name>
			<name> :obj_killspawnedscript name = return_characters_to_idle_at_song_time
		endif
		repeat <array_size>
	endif
	if NOT gotparam \{no_wait}
		wait_for_next_even_frame
	endif
	clip_get_time_and_frame
	getsongtimems
	casttointeger \{time}
	if gotparam \{no_wait}
	else
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
	if structurecontains structure = $<clip> dataformat
		band_playclip_new_cfunc
		newclipformat = true
	else
		band_playclip_cfunc
		newclipformat = false
	endif
	increase_band_bounding_spheres
	if (<teleport_delay> != 0)
		wait <teleport_delay> gameframes
	endif
	if (<newclipformat> = true)
		band_playclip_finish_new_cfunc
	else
		band_playclip_finish_cfunc
	endif
endscript

script increase_band_bounding_spheres 
	return
	if compositeobjectexists \{name = musician1}
		musician1 :obj_setboundingsphere \{10}
	endif
	if compositeobjectexists \{name = musician2}
		musician2 :obj_setboundingsphere \{10}
	endif
	if compositeobjectexists \{name = musician3}
		musician3 :obj_setboundingsphere \{10}
	endif
	if compositeobjectexists \{name = musician4}
		musician4 :obj_setboundingsphere \{10}
	endif
endscript

script band_forcetoidle \{all_modes = false}
	if gotparam \{name}
		if compositeobjectexists name = <name>
			bandmanager_changeik name = <name> enabled = true
			bandmanager_playidle name = <name> blendduration = 0.0 all_modes = <all_modes>
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
	endif
	wait_for_next_even_frame
	wait \{1
		gameframes}
	getsongtimems \{time_offset = $time_gem_offset_with_lag}
	casttointeger \{time}
	printf channel = pop qs(0xa3b676fb) a = <time> b = <name>
	band_forcetoidle name = <name> all_modes = <all_modes> <...>
	wait \{1
		gameframes}
	getsongtimems \{time_offset = $time_gem_offset_with_lag}
	casttointeger \{time}
	printf channel = pop qs(0xa3b3aff3) a = <time> b = <name>
	band_movetostartnode name = <name>
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

script band_showmic \{name = guitarist}
	if NOT should_play_moments
		return
	endif
	if ($game_mode = p2_pro_faceoff)
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
	if NOT should_play_moments
		return
	endif
	get_musician_id name = <name>
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :hide_mic
endscript

script band_showmic_stand \{name = guitarist}
	if NOT should_play_moments
		return
	endif
	if ($game_mode = p2_pro_faceoff)
		return
	endif
	get_musician_id name = <name>
	if NOT compositeobjectexists name = <name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<name> :show_mic_stand
	endif
endscript

script band_hidemic_stand \{name = guitarist}
	if NOT should_play_moments
		return
	endif
	get_musician_id name = <name>
	if NOT compositeobjectexists name = <name>
		return
	endif
	<name> :hide_mic_stand
endscript

script band_showmic_microphone \{name = guitarist}
	if NOT should_play_moments
		return
	endif
	if ($game_mode = p2_pro_faceoff)
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
	if NOT should_play_moments
		return
	endif
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
	bandmanager_startfacialanims \{name = musician1}
	bandmanager_startfacialanims \{name = musician2}
	bandmanager_startfacialanims \{name = musician3}
	bandmanager_startfacialanims \{name = musician4}
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
	if compositeobjectexists <name>
		<name> :hideinstrument
		bandmanager_hidestrings name = <name>
	endif
endscript

script bandmanager_unhideinstrument 
	if compositeobjectexists <name>
		<name> :unhideinstrument
		bandmanager_showstrings name = <name>
	endif
endscript

script bandmanager_hideallinstruments 
	bandmanager_hideinstrument \{name = musician1}
	bandmanager_hideinstrument \{name = musician2}
	bandmanager_hideinstrument \{name = musician3}
	bandmanager_hideinstrument \{name = musician4}
endscript

script bandmanager_unhideallinstruments 
	bandmanager_unhideinstrument \{name = musician1}
	bandmanager_unhideinstrument \{name = musician2}
	bandmanager_unhideinstrument \{name = musician3}
	bandmanager_unhideinstrument \{name = musician4}
endscript

script bandmanager_hidemusician 
	if compositeobjectexists <name>
		<name> :hidemusician
	endif
endscript

script bandmanager_unhidemusician 
	if compositeobjectexists <name>
		<name> :unhidemusician
	endif
endscript

script bandmanager_hideallmusicians 
	bandmanager_hidemusician \{name = musician1}
	bandmanager_hidemusician \{name = musician2}
	bandmanager_hidemusician \{name = musician3}
	bandmanager_hidemusician \{name = musician4}
endscript

script bandmanager_unhideallmusicians 
	bandmanager_unhidemusician \{name = musician1}
	bandmanager_unhidemusician \{name = musician2}
	bandmanager_unhidemusician \{name = musician3}
	bandmanager_unhidemusician \{name = musician4}
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

script band_simulatetempo 
	switch <name>
		case guitarist
		change musician3_tempo = <tempo>
		case bassist
		change musician4_tempo = <tempo>
		case vocalist
		change musician1_tempo = <tempo>
		case drummer
		change musician2_tempo = <tempo>
	endswitch
endscript

script band_stopsimulatetempo 
	switch <name>
		case guitarist
		change \{musician3_tempo = -1}
		case bassist
		change \{musician4_tempo = -1}
		case vocalist
		change \{musician1_tempo = -1}
		case drummer
		change \{musician2_tempo = -1}
	endswitch
endscript

script get_musician_id 
	switch <name>
		case guitarist
		case bassist
		case vocalist
		case drummer
		if compositeobjectexists name = <name>
			<name> :obj_getid
			name = <objid>
		endif
	endswitch
	return name = <name>
endscript
allow_moments = true

script determine_if_moments_should_play 
	gamemode_gettype
	switch <type>
		case training
		case practice
		case tutorial
		change \{allow_moments = false}
		return
	endswitch
	gman_songtool_getcurrentsong
	get_band_configuration song = <current_song> skip_dlc_check
	if (<band> = default_band)
		if is_standard_band_setup
			allowed = true
		else
			allowed = false
		endif
	else
		gamemode_gettype
		if (<type> = career)
			if structurecontains structure = $download_songlist_props <current_song>
				allowed = false
			else
				allowed = true
			endif
		else
			allowed = false
		endif
	endif
	change allow_moments = <allowed>
endscript

script should_play_moments 
	if ($allow_moments = true)
		return \{true}
	else
		return \{false}
	endif
endscript

script wait_for_next_even_frame 
	if isprimaryframe
		wait \{2
			gameframes}
	else
		wait \{1
			gameframes}
	endif
endscript
