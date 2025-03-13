
script create_band \{async = 0}
	persistent_band_prepare_for_song async = <async>
	return \{true}
endscript

script set_guitar_string_properties \{appearance = 0x69696969
		info_struct = !q1768515945
		name = !q1768515945}
	if get_part_key_from_appearance key = guitar_string_start appearance = <appearance> part = cas_guitar_bridges
		printf channel = animinfo qs(0xa5e6723d) a = <name>
		change structurename = <info_struct> string_start_properties = <guitar_string_start>
	elseif get_part_key_from_appearance key = guitar_string_start appearance = <appearance> part = cas_full_guitar
		printf channel = animinfo qs(0xa5e6723d) a = <name>
		change structurename = <info_struct> string_start_properties = <guitar_string_start>
	else
		printf channel = animinfo qs(0x95a4b190) a = <name>
		change structurename = <info_struct> string_start_properties = default_guitar_string_start_properties
	endif
	if get_part_key_from_appearance key = guitar_string_end appearance = <appearance> part = cas_guitar_bridges
		printf channel = animinfo qs(0xa4714cd4) a = <name>
		change structurename = <info_struct> string_end_properties = <guitar_string_end>
	elseif get_part_key_from_appearance key = guitar_string_end appearance = <appearance> part = cas_full_guitar
		printf channel = animinfo qs(0xa4714cd4) a = <name>
		change structurename = <info_struct> string_end_properties = <guitar_string_end>
	else
		printf channel = animinfo qs(0x1f376d79) a = <name>
		change structurename = <info_struct> string_end_properties = default_guitar_string_end_properties
	endif
endscript

script set_bass_string_properties \{appearance = 0x69696969
		info_struct = !q1768515945
		name = !q1768515945}
	if get_part_key_from_appearance key = bass_string_start appearance = <appearance> part = cas_bass_bridges
		printf channel = animinfo qs(0x8b6be807) a = <name>
		change structurename = <info_struct> string_start_properties = <bass_string_start>
	elseif get_part_key_from_appearance key = bass_string_start appearance = <appearance> part = cas_full_bass
		printf channel = animinfo qs(0x8b6be807) a = <name>
		change structurename = <info_struct> string_start_properties = <bass_string_start>
	else
		printf channel = animinfo qs(0x0970b810) a = <name>
		change structurename = <info_struct> string_start_properties = default_bass_string_start_properties
	endif
	if get_part_key_from_appearance key = bass_string_end appearance = <appearance> part = cas_bass_bridges
		printf channel = animinfo qs(0x26832880) a = <name>
		change structurename = <info_struct> string_end_properties = <bass_string_end>
	elseif get_part_key_from_appearance key = bass_string_end appearance = <appearance> part = cas_full_bass
		printf channel = animinfo qs(0x26832880) a = <name>
		change structurename = <info_struct> string_end_properties = <bass_string_end>
	else
		printf channel = animinfo qs(0x7e4aa083) a = <name>
		change structurename = <info_struct> string_end_properties = default_bass_string_end_properties
	endif
endscript
testing_strings = false

script test_guitar_strings 
	change \{testing_strings = true}
	bandmanager_setpart \{name = musician1
		part = guitar}
	bandmanager_createstrings \{name = musician1}
endscript

script test_bass_strings 
	change \{testing_strings = true}
	bandmanager_setpart \{name = musician1
		part = bass}
	bandmanager_createstrings \{name = musician1}
endscript

script band_member_start_anims \{async = 0}
	requireparams \{[
			name
			instrument
		]
		all}
	if NOT compositeobjectexists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	setup_character_anims {
		info_struct = <info_struct>
		name = <name>
		instrument = <instrument>
		loading_into_song = <loading_into_song>
	}
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	switch (<instrument>)
		case guitar
		case guitar_and_vocals
		guitarist_start_anims name = <name> info_struct = <info_struct>
		case bass
		bassist_start_anims name = <name> info_struct = <info_struct>
		case drum
		drummer_start_anims name = <name> info_struct = <info_struct>
		case vocals
		vocalist_start_anims name = <name> info_struct = <info_struct>
		case none
		no_instrument_start_anims name = <name> info_struct = <info_struct>
		default
		scriptassert 'unknown instrument %i' i = <instrument>
	endswitch
	if (<instrument> != drum)
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		stance = ($<info_struct>.stance)
		if ($is_in_cas = 1)
			stance = stance_frontend
		endif
		bandmanager_changestance name = <name> stance = <stance> no_wait
		band_setikchain name = <name> chain = slave
	endif
	<name> :obj_spawnscriptnow facial_anim_loop
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	<name> :obj_forceupdate
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	<name> :obj_teleport
endscript

script no_instrument_start_anims 
	bandmanager_addguitarist name = <name>
endscript

script guitarist_start_anims 
	finger_anims = ($<info_struct>.finger_anims)
	fret_anims = ($<info_struct>.fret_anims)
	strum_type = ($<info_struct>.strum)
	extendcrc <strum_type> '_Strums' out = strum_anims
	<name> :getsingletag lefty
	if (<lefty> = 1)
		change structurename = <info_struct> fret_anims = fret_anims_rocker_lefty
	endif
	<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
	<name> :hero_play_fret_anim anim = ($<fret_anims>.track_119)
	<name> :settags lastbasepose = 'Strum_String_1'
	<name> :settags lasttype = null
	<name> :settags lastnotevalue = 0
	<name> :getsingletag is_female
	<name> :getsingletag large_hands
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
	initialize_strum_anims strumtype = <strumtype> gender = <gender> name = <name>
	<name> :settags lookat_av = 1
	band_lookat_off \{name = guitarist}
	bandmanager_addguitarist name = <name>
endscript

script bassist_start_anims 
	finger_anims = ($<info_struct>.finger_anims)
	fret_anims = ($<info_struct>.fret_anims)
	strum_type = ($<info_struct>.strum)
	extendcrc <strum_type> '_Strums' out = strum_anims
	<name> :getsingletag lefty
	if (<lefty> = 1)
		change structurename = <info_struct> fret_anims = fret_anims_rocker_lefty
	endif
	<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
	<name> :hero_play_fret_anim anim = ($<fret_anims>.track_96)
	<name> :settags lastbasepose = 'Strum_String_1'
	<name> :settags lasttype = null
	<name> :settags lastnotevalue = 0
	<name> :getsingletag is_female
	<name> :getsingletag large_hands
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
	initialize_strum_anims strumtype = <strumtype> gender = <gender> name = <name>
	<name> :settags lookat_av = 1
	band_lookat_off \{name = bassist}
	bandmanager_addbassist name = <name>
endscript

script initialize_strum_anims 
	getrandomfloat \{a = 0.0
		b = 1.0}
	startanim = <random_float>
	formattext checksumname = baseanim '%a_%b_Strum_Base' a = <gender> b = <strumtype>
	formattext checksumname = baseanimhigh '%a_%b_Strum_Base_High' a = <gender> b = <strumtype>
	formattext checksumname = baseanimmid '%a_%b_Strum_Base_Mid' a = <gender> b = <strumtype>
	formattext checksumname = baseanimlow '%a_%b_Strum_Base_Low' a = <gender> b = <strumtype>
	formattext checksumname = idlebase '%a_%b_Strum_String_1' a = <gender> b = <strumtype>
	formattext checksumname = idleanim '%a_%b_Strum_Idle_Rest' a = <gender> b = <strumtype>
	<name> :anim_command target = dynamic_strum_base command = degenerateblend_addbranch params = {
		blendduration = 0.0
		tree = $dynamic_strum_source
		params = {
			anim = <baseanim>
		}
	}
	<name> :anim_command target = dynamic_strum_roll_high command = degenerateblend_addbranch params = {
		blendduration = 0.0
		tree = $dynamic_strum_source
		params = {
			anim = <baseanimhigh>
		}
	}
	<name> :anim_command target = dynamic_strum_roll_mid command = degenerateblend_addbranch params = {
		blendduration = 0.0
		tree = $dynamic_strum_source
		params = {
			anim = <baseanimmid>
		}
	}
	<name> :anim_command target = dynamic_strum_roll_low command = degenerateblend_addbranch params = {
		blendduration = 0.0
		tree = $dynamic_strum_source
		params = {
			anim = <baseanimlow>}
	}
	<name> :anim_command target = dynamic_strums command = degenerateblend_addbranch params = {
		blendduration = <blend>
		blendcurve = $idle_blend_curve
		tree = $dynamic_strum_idle_branch
		params = {
			startanim = <startanim>
			baseanim = <idlebase>
			strumanim = <idleanim>
		}
	}
endscript

script vocalist_start_anims 
	vocalist_reset_globals
	<name> :anim_command target = autovocals_switch command = partialswitch_setstate params = {off blendduration = 0.0}
	<name> :animinfo_getallactivevaluesources
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
	<name> :animpreview_setsourcevalues <...>
	<name> :settags lookat_av = 1
	band_lookat_off \{name = vocalist}
	bandmanager_addvocalist name = <name>
endscript
use_drummer_events = 0

script drummer_start_anims 
	drummer_reset_globals
	<name> :animinfo_getallactivevaluesources
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
	<name> :animpreview_setsourcevalues <...>
	<name> :settags idle = true
	<name> :settags tap = true
	<name> :obj_spawnscriptnow drummer_transit_base_long params = {
		node = body
		drum_old_long_string = 'S1T3'
		drum_new_long_string = 'S1T3'
		time_to_trans_base = 0.0
		time_to_trans = 0.0
		currentset = 1
	}
	<name> :obj_spawnscriptnow drummer_transit_base_long params = {
		node = ik
		drum_old_long_string = 'S1T3'
		drum_new_long_string = 'S1T3'
		time_to_trans_base = 0.0
		time_to_trans = 0.0
		currentset = 1
	}
	<name> :settags lookat_av = 1
	band_lookat_off \{name = drummer}
	default_kit_anims name = <name>
	bandmanager_adddrummer name = <name>
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
	obj_getid
	display_info = false
	switch (<objid>)
		case guitarist
		if ($display_guitarist_anim_info = true)
			display_info = true
		endif
		case bassist
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

script crowd_play_adjusting_random_anims \{anim = idle
		blend_time = 0.2
		startwithnoblend = 0
		playonce = false}
	return
	obj_getid
	old_speed = undefined
	previous_anim_name = no_anim
	begin
	hero_get_skill_level_cfunc
	get_anim_speed_for_tempo_cfunc
	if gotparam \{anim_set}
		anims = ($<anim_set>.<anim>.<skill>.<anim_speed>)
	else
		anims = ($crowd_animations.<anim>.<skill>.<anim_speed>)
	endif
	getarraysize <anims>
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<newindex>])
	if (<startwithnoblend> = 1)
		blend_time = 0.0
		startwithnoblend = 0
	elseif (<anim_speed> != <old_speed>)
		blend_time = $crowd_blendtime_tempochange
	elseif (<skill> = bad)
		blend_time = $crowd_blendtime_bad
	elseif (<anim> = special)
		blend_time = $crowd_blendtime_special
	elseif (<anim_speed> = slow)
		blend_time = $crowd_blendtime_slow
	elseif (<anim_speed> = med)
		blend_time = $crowd_blendtime_med
	elseif (<anim_speed> = fast)
		blend_time = $crowd_blendtime_fast
	else
		blend_time = -1.0
	endif
	if ($display_crowd_anim_info = true)
		printf channel = crowd qs(0x0a0eb2da) a = <objid> b = <anim> c = <anim_name> d = <blend_time>
	endif
	if NOT (<anim_name> = <previous_anim_name>)
		gameobj_playanim anim = <anim_name> blendduration = <blend_time> timertype = tempocycle animevents = on
		previous_anim_name = <anim_name>
	else
		anim_command \{target = bodytimer
			command = timer_resetanimcompleteflag}
	endif
	gameobj_waitanimfinished
	if (<playonce> = true)
		anim = idle
	endif
	old_speed = <anim_speed>
	repeat
endscript

script setup_character_anims 
	requireparams \{[
			instrument
			name
			info_struct
		]
		all}
	anim_struct = ($<info_struct>.anim_struct)
	if (<instrument> = none)
		instrument = guitar
	endif
	<name> :getsingletag is_female
	<name> :getsingletag large_hands
	if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		if NOT gotparam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> member = frontend
			if NOT structurecontains structure = <anim_struct_member> finger_anims
				use_default_finger_fret_strum = 1
			endif
		endif
		if ((<instrument> = guitar) || (<instrument> = bass))
			use_default_finger_fret_strum = 1
		endif
		if structurecontains structure = <anim_struct_member> anim_set
			change structurename = <info_struct> anim_set = (<anim_struct_member>.anim_set)
		else
			if (<is_female> = 1)
				change structurename = <info_struct> anim_set = car_female_animations
			else
				change structurename = <info_struct> anim_set = car_male_animations
			endif
		endif
		if gotparam \{use_default_finger_fret_strum}
			if (<is_female> = 1)
				change structurename = <info_struct> finger_anims = guitarist_finger_anims_car_female
				change structurename = <info_struct> fret_anims = fret_anims_rocker
				change structurename = <info_struct> strum = car_female_normal
			else
				change structurename = <info_struct> finger_anims = guitarist_finger_anims_car_male
				change structurename = <info_struct> fret_anims = fret_anims_rocker
				change structurename = <info_struct> strum = car_male_normal
			endif
		endif
		if structurecontains structure = <anim_struct_member> facial_anims
			change structurename = <info_struct> facial_anims = (<anim_struct_member>.facial_anims)
			change structurename = <info_struct> facial_anims_default = (<anim_struct_member>.facial_anims)
		else
			if (<is_female> = 1)
				change structurename = <info_struct> facial_anims = facial_anims_female_rocker
				change structurename = <info_struct> facial_anims_default = facial_anims_female_rocker
			else
				change structurename = <info_struct> facial_anims = facial_anims_male_rocker
				change structurename = <info_struct> facial_anims_default = facial_anims_male_rocker
			endif
			printstruct <anim_struct_member>
		endif
	endif
	change structurename = <info_struct> allow_movement = true
	change structurename = <info_struct> arms_disabled = 0
	change structurename = <info_struct> disable_arms = 0
	change structurename = <info_struct> playing_special_anim = false
	change structurename = <info_struct> next_stance = ($<info_struct>.stance)
endscript

script get_start_node_id \{character = qs(0x5c2c7d0c)}
	getstartnodeid member = <member>
	return waypoint_id = <waypoint_id> waypoint_name = <waypoint_name>
endscript

script get_skill_level 
	getfirstplayer
	getplayerinfo <player> current_health out = health
	skill = normal
	if (<health> < 0.66)
		skill = bad
	elseif (<health> > 1.3299999)
		skill = good
	endif
	return skill = <skill>
endscript

script get_target_node 
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	return target_node = ($<info_struct>.target_node)
endscript

script play_special_facial_anim 
	if NOT gotparam \{anim}
		return
	endif
	obj_killspawnedscript \{name = facial_anim_loop}
	obj_getid
	hero_play_facial_anim anim = <anim>
	hero_wait_until_anim_finished \{timer = facialtimer}
	obj_spawnscriptnow \{facial_anim_loop}
endscript

script facial_anim_loop \{blend_duration = 0}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	facial_anims = ($<info_struct>.facial_anims)
	if (<facial_anims> = none)
		printf channel = animinfo qs(0x86d9843c) a = <objid>
		return
	endif
	if NOT globalexists name = <facial_anims> type = structure
		return
	endif
	if NOT structurecontains structure = $<facial_anims> name = idle
		return
	endif
	begin
	anim = ($<info_struct>.facial_anim)
	if NOT structurecontains structure = $<facial_anims> name = <anim>
		if ($display_facial_anim_info = true)
		endif
		anim = idle
	endif
	anims = ($<facial_anims>.<anim>)
	getarraysize <anims>
	getrandomvalue name = index integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<index>])
	if ($display_facial_anim_info = true)
	endif
	change structurename = <info_struct> facial_anim = idle
	hero_play_facial_anim anim = <anim_name> blendduration = <blend_duration>
	blend_duration = 0
	hero_wait_until_anim_finished \{timer = facialtimer}
	wait \{1
		gameframe}
	repeat
endscript

script guitarist_idle_animpreview 
	cleareventhandlergroup \{group = hand_events}
endscript
band_character_names = [
	musician1
	musician2
	musician3
	musician4
]

script play_intro_anims 
	band_restartidles
	foreachin \{$band_character_names
		do = play_intro_anims_foreach}
	wait \{1
		gameframe}
	bandmanager_setplayingintroanims
endscript

script play_intro_anims_foreach 
	if compositeobjectexists name = <checksum>
		if NOT bandmanager_isplayingsimpleanim name = <checksum>
			extendcrc <checksum> '_Info' out = info_struct
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
			if (<intro_anim> != none)
				band_playsimpleanim {name = <checksum> anim = <intro_anim> blendduration = 0.3 start = <start>}
				if (<part> = guitar || <part> = bass)
					<checksum> :gettags lefty
					if (<lefty> = 1)
						band_setikchain name = <checksum> chain = slave
					else
						band_setikchain name = <checksum> chain = guitar
					endif
				else
					band_setikchain name = <checksum> chain = slave
				endif
				bandmanager_stopfacialanims name = <checksum>
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
		if (<type> = quickplay)
			printf \{channel = animinfo
				qs(0xec02b1ab)}
			vocalist :anim_command \{target = vocalist_pose_node
				command = poselog_stoprecording}
		endif
	endif
	killspawnedscript \{name = return_characters_to_idle_at_song_time}
	if NOT quest_progression_is_chapter_rush
		bandmanager_unhideallinstruments
	endif
	getarraysize \{$band_character_names}
	i = 0
	begin
	name = ($band_character_names [<i>])
	spawnscriptnow play_win_anims_foreach params = {checksum = <name>}
	i = (<i> + 1)
	repeat <array_size>
	return
endscript

script play_win_anims_foreach 
	if gotparam \{checksum}
		if compositeobjectexists name = <checksum>
			extendcrc <checksum> '_Info' out = info_struct
			wait_for_next_even_frame
			wait \{1
				gameframe}
			band_changefacialanims name = <checksum>
			win_anim = ($<info_struct>.win_anim_name)
			if (<win_anim> != none)
				band_setikchain name = <checksum> chain = slave
				band_playsimpleanim {name = <checksum> anim = <win_anim> blendduration = 0.3}
			else
				printf channel = marc qs(0x553d6959) a = <checksum>
			endif
			wait \{1
				gameframe}
			band_movetostartnode name = <checksum> allow_in_2player = true
		else
		endif
	endif
endscript

script play_lose_anims 
	gamemode_gettype
	if (<type> = career)
		if quest_progression_is_chapter_finale
			<first> = ($quest_chapter_finale.songs [0])
			<second> = ($quest_chapter_finale.songs [1])
			<third> = ($quest_chapter_finale.songs [2])
			playlist_getcurrentsong
			switch <current_song>
				case <first>
				spawnscriptnow \{z_finalbattle_play_ampzilla_attack1
					id = transitions}
				spawnscriptnow \{z_finalbattle_lose_anim_fade_to_black_attack1
					id = transitions}
				case <second>
				spawnscriptnow \{z_finalbattle_play_ampzilla_attack2
					id = transitions}
				spawnscriptnow \{z_finalbattle_lose_anim_fade_to_black_attack2
					id = transitions}
				case <third>
				spawnscriptnow \{z_finalbattle_play_ampzilla_attack3
					id = transitions}
				spawnscriptnow \{z_finalbattle_lose_anim_fade_to_black_attack3
					id = transitions}
				disable_lose_anims = 1
			endswitch
			return
		endif
	endif
	if ($poselog_vocalist = true)
		gamemode_gettype
		if (<type> = quickplay)
			printf \{channel = animinfo
				qs(0xec02b1ab)}
			vocalist :anim_command \{target = vocalist_pose_node
				command = poselog_stoprecording}
		endif
	endif
	band_showmic_stand \{name = vocalist}
	bandmanager_unhideallinstruments
	killspawnedscript \{name = return_characters_to_idle_at_song_time}
	if NOT gotparam \{disable_lose_anims}
		getarraysize \{$band_character_names}
		i = 0
		begin
		name = ($band_character_names [<i>])
		spawnscriptnow play_lose_anims_foreach params = {checksum = <name>}
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script play_lose_anims_foreach 
	if gotparam \{checksum}
		if compositeobjectexists name = <checksum>
			extendcrc <checksum> '_Info' out = info_struct
			wait_for_next_even_frame
			wait \{1
				gameframe}
			band_changefacialanims name = <checksum>
			lose_anim = ($<info_struct>.lose_anim_name)
			if (<lose_anim> != none)
				band_setikchain name = <checksum> chain = slave
				band_playsimpleanim {name = <checksum> anim = <lose_anim> blendduration = 0.3}
			else
				printf channel = animinfo qs(0x283913b7) a = <checksum>
			endif
			wait \{1
				gameframe}
			band_movetostartnode name = <checksum> allow_in_2player = true
		endif
	endif
endscript

script play_lose_camera 
	gamemode_gettype
	if (<type> = career)
		if quest_progression_is_chapter_finale
			transition_cameracut \{prefix = 'cameras_moments'
				changenow
				name = moment01}
			return
		endif
	endif
	transition_cameracut prefix = 'cameras_lose' transition_time = <transition_time> changenow
endscript

script hide_band 
	if compositeobjectexists \{musician1}
		band_hide \{name = musician1}
	endif
	if compositeobjectexists \{musician2}
		band_hide \{name = musician2}
	endif
	if compositeobjectexists \{musician3}
		band_hide \{name = musician3}
	endif
	if compositeobjectexists \{musician4}
		band_hide \{name = musician4}
	endif
endscript

script unhide_band 
	if compositeobjectexists \{musician1}
		band_unhide \{name = musician1}
	endif
	if compositeobjectexists \{musician2}
		band_unhide \{name = musician2}
	endif
	if compositeobjectexists \{musician3}
		band_unhide \{name = musician3}
	endif
	if compositeobjectexists \{musician4}
		band_unhide \{name = musician4}
	endif
endscript

script create_all_camera_lock_targets 
	destroy_all_camera_lock_targets
	wait \{1
		gameframe}
	create_camera_lock_target \{name = moment_cam_lock_target_01
		only_anim_if_locked = false}
	create_camera_lock_target \{name = moment_cam_lock_target_02}
	create_camera_lock_target \{name = moment_cam_lock_target_03}
	create_camera_lock_target \{name = moment_cam_lock_target_04}
	create_camera_lock_target \{name = moment_cam_lock_target_05}
	create_camera_lock_target \{name = moment_cam_lock_target_06}
	create_camera_lock_target \{name = moment_cam_lock_target_07}
	create_camera_lock_target \{name = moment_cam_lock_target_08}
	create_camera_lock_target \{name = moment_cam_lock_target_09}
	create_camera_lock_target \{name = moment_cam_lock_target_10}
	create_camera_lock_target \{name = musician1_mocap_lock_target_01}
	create_camera_lock_target \{name = musician1_mocap_lock_target_02}
	create_camera_lock_target \{name = musician2_mocap_lock_target_01}
	create_camera_lock_target \{name = musician2_mocap_lock_target_02}
	create_camera_lock_target \{name = musician3_mocap_lock_target_01}
	create_camera_lock_target \{name = musician3_mocap_lock_target_02}
	create_camera_lock_target \{name = musician4_mocap_lock_target_01}
	create_camera_lock_target \{name = musician4_mocap_lock_target_02}
endscript

script create_frontend_lock_targets 
	destroy_frontend_lock_targets
	printf \{channel = animinfo
		qs(0xc22b676e)}
	create_camera_lock_target \{name = frontend_mocap_lock_target_01}
	create_camera_lock_target \{name = frontend_mocap_lock_target_02}
endscript

script create_camera_lock_target \{only_anim_if_locked = true}
	createfromstructure {
		name = <name>
		pos = (0.0, 0.0, 0.0)
		angles = (0.0, 1.0, 0.0)
		class = gameobject
		type = ghost
		createdatstart
		disableshadowcasting = false
		profile = $profile_ven_camera_obj
		only_animate_if_locked_to_by_active_cinematic_camera = <only_anim_if_locked>
	}
endscript

script destroy_all_camera_lock_targets 
	destroy_camera_lock_target \{name = moment_cam_lock_target_01}
	destroy_camera_lock_target \{name = moment_cam_lock_target_02}
	destroy_camera_lock_target \{name = moment_cam_lock_target_03}
	destroy_camera_lock_target \{name = moment_cam_lock_target_04}
	destroy_camera_lock_target \{name = moment_cam_lock_target_05}
	destroy_camera_lock_target \{name = moment_cam_lock_target_06}
	destroy_camera_lock_target \{name = moment_cam_lock_target_07}
	destroy_camera_lock_target \{name = moment_cam_lock_target_08}
	destroy_camera_lock_target \{name = moment_cam_lock_target_09}
	destroy_camera_lock_target \{name = moment_cam_lock_target_10}
	destroy_camera_lock_target \{name = musician1_mocap_lock_target_01}
	destroy_camera_lock_target \{name = musician1_mocap_lock_target_02}
	destroy_camera_lock_target \{name = musician2_mocap_lock_target_01}
	destroy_camera_lock_target \{name = musician2_mocap_lock_target_02}
	destroy_camera_lock_target \{name = musician3_mocap_lock_target_01}
	destroy_camera_lock_target \{name = musician3_mocap_lock_target_02}
	destroy_camera_lock_target \{name = musician4_mocap_lock_target_01}
	destroy_camera_lock_target \{name = musician4_mocap_lock_target_02}
endscript

script destroy_frontend_lock_targets 
	printf \{channel = animinfo
		qs(0xb86dea08)}
	destroy_camera_lock_target \{name = frontend_mocap_lock_target_01}
	destroy_camera_lock_target \{name = frontend_mocap_lock_target_02}
endscript

script destroy_camera_lock_target 
	if compositeobjectexists <name>
		<name> :die
	endif
endscript

script start_drummer_cameras 
	i = 1
	begin
	formattext checksumname = info_struct 'musician%a_info' a = <i>
	if ($<info_struct>.part = drum)
		formattext checksumname = lock_target_01 'musician%a_mocap_lock_target_01' a = <i>
		formattext checksumname = lock_target_02 'musician%a_mocap_lock_target_02' a = <i>
		start = 0.0
		position = ($<info_struct>.position)
		getpakmancurrent \{map = zones}
		switch <position>
			case vocalist
			found = 0
			if ($g_band_use_alt_positions = 1)
				extendcrc <pak> '_TRG_Waypoint_Vocalist_Alt_Start' out = start_node_crc
				if doeswaypointexists waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				extendcrc <pak> '_TRG_Waypoint_Vocalist_Start' out = start_node_crc
			endif
			start_pct = 0.5
			case drummer
			found = 0
			if ($g_band_use_alt_positions = 1)
				extendcrc <pak> '_TRG_Waypoint_Drummer_Alt_Start' out = start_node_crc
				if doeswaypointexists waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				extendcrc <pak> '_TRG_Waypoint_Drummer_Start' out = start_node_crc
			endif
			start_pct = 0.0
			case guitarist
			found = 0
			if ($g_band_use_alt_positions = 1)
				extendcrc <pak> '_TRG_Waypoint_Guitarist_Alt_Start' out = start_node_crc
				if doeswaypointexists waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				extendcrc <pak> '_TRG_Waypoint_Guitarist_Start' out = start_node_crc
			endif
			start_pct = 0.25
			case bassist
			found = 0
			if ($g_band_use_alt_positions = 1)
				extendcrc <pak> '_TRG_Waypoint_Bassist_Alt_Start' out = start_node_crc
				if doeswaypointexists waypoint = <start_node_crc>
					found = 1
				endif
			endif
			if (<found> = 0)
				extendcrc <pak> '_TRG_Waypoint_Bassist_Start' out = start_node_crc
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
	debug_toggle_character_visiblity \{name = guitarist}
	debug_toggle_character_visiblity \{name = bassist}
	debug_toggle_character_visiblity \{name = drummer}
	debug_toggle_character_visiblity \{name = vocalist}
endscript

script debug_toggle_character_visiblity 
	printf channel = animinfo qs(0xa418ab1c) a = <name>
	if NOT gotparam \{name}
		printf \{channel = animinfo
			qs(0x2b50edbe)}
		return
	endif
	switch (<name>)
		case guitarist
		debug_hide = hide_guitarist
		case bassist
		debug_hide = hide_bassist
		case vocalist
		debug_hide = hide_vocalist
		case drummer
		debug_hide = hide_drummer
		default
		printf \{channel = animinfo
			qs(0x45f3f560)}
		return
	endswitch
	get_musician_id name = <name>
	if NOT compositeobjectexists name = <name>
		printf channel = animinfo qs(0xd9dcffd1) a = <name>
		return
	endif
	if ($<debug_hide> = true)
		printf channel = animinfo qs(0xfacf2177) a = <name>
		bandmanager_removecharacter name = <name>
		<name> :hide
	else
		printf channel = animinfo qs(0x758bccc3) a = <name>
		<name> :unhide
	endif
endscript

script prepare_band_for_main_menu 
	should_use_alt_positions
	index = 0
	begin
	switch <index>
		case 0
		info_struct = musician1_info
		name = musician1
		case 1
		info_struct = musician2_info
		name = musician2
		case 2
		info_struct = musician3_info
		name = musician3
		case 3
		info_struct = musician4_info
		name = musician4
	endswitch
	if compositeobjectexists name = <name>
		part = ($<info_struct>.part)
		switch <part>
			case guitar
			change structurename = <info_struct> anim_set = main_menu_loops_guitarist
			bandmanager_addguitarist name = <name>
			case bass
			change structurename = <info_struct> anim_set = main_menu_loops_bassist
			bandmanager_addbassist name = <name>
			case vocals
			change structurename = <info_struct> anim_set = main_menu_loops_vocalist
			bandmanager_addvocalist name = <name>
			default
		endswitch
		<name> :obj_teleport
	endif
	index = (<index> + 1)
	repeat 4
	bandmanager_updateallanimsets
	bandmanager_allchangestance \{stance = stance_a}
	band_restartidles
endscript

script hide_mic_if_not_vocalist \{name = !q1768515945}
	if compositeobjectexists name = <name>
		<name> :getsingletag instrument
		if (<instrument> != vocals)
			<name> :hide_mic
		endif
	endif
endscript

script unhide_mic_if_vocalist \{name = !q1768515945}
	if compositeobjectexists name = <name>
		<name> :getsingletag instrument
		if (<instrument> = vocals)
			<name> :show_mic
		endif
	endif
endscript

script reset_stances_for_frontend 
	change \{structurename = musician1_info
		stance = stance_old}
	change \{structurename = musician1_info
		next_stance = stance_frontend}
	change \{structurename = musician1_info
		current_anim = idle}
	change \{structurename = musician1_info
		cycle_anim = true}
	change \{structurename = musician1_info
		next_anim = none}
	change \{structurename = musician1_info
		playing_missed_note = false}
	change \{structurename = musician2_info
		stance = stance_old}
	change \{structurename = musician2_info
		next_stance = stance_frontend}
	change \{structurename = musician2_info
		current_anim = idle}
	change \{structurename = musician2_info
		cycle_anim = true}
	change \{structurename = musician2_info
		next_anim = none}
	change \{structurename = musician2_info
		playing_missed_note = false}
	change \{structurename = musician3_info
		stance = stance_old}
	change \{structurename = musician3_info
		next_stance = stance_frontend}
	change \{structurename = musician3_info
		current_anim = idle}
	change \{structurename = musician3_info
		cycle_anim = true}
	change \{structurename = musician3_info
		next_anim = none}
	change \{structurename = musician3_info
		playing_missed_note = false}
	change \{structurename = musician4_info
		stance = stance_old}
	change \{structurename = musician4_info
		next_stance = stance_frontend}
	change \{structurename = musician4_info
		current_anim = idle}
	change \{structurename = musician4_info
		cycle_anim = true}
	change \{structurename = musician4_info
		next_anim = none}
	change \{structurename = musician4_info
		playing_missed_note = false}
endscript
