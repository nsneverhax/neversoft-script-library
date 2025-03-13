musician1_info = {
	anim_set = judy_animations
	facial_anims = none
	facial_anims_default = none
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	lefty_chords = false
	large_chords = false
	fret_anims = fret_anims_rocker
	strum = normal
	guitar_model = none
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
	playing = true
	part = guitar
	position = vocalist
	anim_struct = none
	win_anim_name = none
	lose_anim_name = none
	intro_anim_name = none
	playing_special_anim = false
}
musician2_info = {
	anim_set = judy_animations
	facial_anims = none
	facial_anims_default = none
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	lefty_chords = false
	large_chords = false
	fret_anims = fret_anims_rocker
	strum = normal
	guitar_model = none
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
	playing = true
	part = guitar
	position = drummer
	anim_struct = none
	win_anim_name = none
	lose_anim_name = none
	intro_anim_name = none
	playing_special_anim = false
}
musician3_info = {
	anim_set = judy_animations
	facial_anims = none
	facial_anims_default = none
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	lefty_chords = false
	large_chords = false
	fret_anims = fret_anims_rocker
	strum = normal
	guitar_model = none
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
	playing = true
	part = guitar
	position = guitarist
	anim_struct = none
	win_anim_name = none
	lose_anim_name = none
	intro_anim_name = none
	playing_special_anim = false
}
musician4_info = {
	anim_set = judy_animations
	facial_anims = none
	facial_anims_default = none
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	lefty_chords = false
	large_chords = false
	fret_anims = fret_anims_rocker
	strum = normal
	guitar_model = none
	string_start_properties = default_guitar_string_start_properties
	string_end_properties = default_guitar_string_end_properties
	playing_missed_note = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
	playing = true
	part = guitar
	position = bassist
	anim_struct = none
	win_anim_name = none
	lose_anim_name = none
	intro_anim_name = none
	playing_special_anim = false
}

script create_band \{async = 0}
	persistent_band_prepare_for_song async = <async>
	return \{true}
endscript

script set_guitar_string_properties 
	requireparams \{[
			appearance
			info_struct
			name
		]
		all}
	if get_part_key_from_appearance key = guitar_string_start appearance = <appearance> part = cas_guitar_bridges
		printf channel = animinfo qs(0xa5e6723d) a = <name>
		change structurename = <info_struct> string_start_properties = <guitar_string_start>
	else
		printf channel = animinfo qs(0x95a4b190) a = <name>
		change structurename = <info_struct> string_start_properties = default_guitar_string_start_properties
	endif
	if get_part_key_from_appearance key = guitar_string_end appearance = <appearance> part = cas_guitar_bridges
		printf channel = animinfo qs(0xa4714cd4) a = <name>
		change structurename = <info_struct> string_end_properties = <guitar_string_end>
	else
		printf channel = animinfo qs(0x1f376d79) a = <name>
		change structurename = <info_struct> string_end_properties = default_guitar_string_end_properties
	endif
endscript

script set_bass_string_properties 
	requireparams \{[
			appearance
			info_struct
			name
		]
		all}
	if get_part_key_from_appearance key = bass_string_start appearance = <appearance> part = cas_bass_bridges
		printf channel = animinfo qs(0x8b6be807) a = <name>
		change structurename = <info_struct> string_start_properties = <bass_string_start>
	else
		printf channel = animinfo qs(0x0970b810) a = <name>
		change structurename = <info_struct> string_start_properties = default_bass_string_start_properties
	endif
	if get_part_key_from_appearance key = bass_string_end appearance = <appearance> part = cas_bass_bridges
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
			if ($is_in_gender_select = 1 || $is_in_genre_select = 1)
				stance = stance_old
			else
				stance = stance_frontend
			endif
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
	<name> :ragdoll_markforreset
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
	<name> :obj_killspawnedscript name = preparebandmemberforrenderupdateloop
	<name> :obj_spawnscriptnow preparebandmemberforrenderupdateloop
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
	<name> :obj_killspawnedscript name = preparebandmemberforrenderupdateloop
	<name> :obj_spawnscriptnow preparebandmemberforrenderupdateloop
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
	bandmanager_addvocalist name = <name>
endscript
use_drummer_events = 0

script drummer_start_anims 
	if ($drumtest = 1)
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
		<name> :obj_spawnscriptnow default_drummer_state params = {time_to_trans = 0.0 currentset = 1}
		<name> :obj_spawnscriptnow drummer_transit_idles params = {state = in tapin = true currentset = 1 last_hit = false}
		default_kit_anims name = <name>
	endif
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
	printf 'setup_character_anims : %n %s' n = <name> s = <instrument>
	anim_struct = ($<info_struct>.anim_struct)
	if (<instrument> = none)
		instrument = guitar
	endif
	if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		if NOT gotparam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> member = frontend
			if NOT structurecontains structure = <anim_struct_member> finger_anims
				use_default_finger_fret_strum = 1
			endif
		endif
		if structurecontains structure = <anim_struct_member> anim_set
			printf 'Using anim_set : %s' s = (<anim_struct_member>.anim_set) donotresolve
			change structurename = <info_struct> anim_set = (<anim_struct_member>.anim_set)
			if ((<instrument> = guitar) || (<instrument> = bass))
				if gotparam \{use_default_finger_fret_strum}
					change structurename = <info_struct> finger_anims = guitarist_finger_anims_car_female
					change structurename = <info_struct> fret_anims = fret_anims_rocker
					change structurename = <info_struct> strum = car_female_normal
				else
					change structurename = <info_struct> finger_anims = (<anim_struct_member>.finger_anims)
					change structurename = <info_struct> fret_anims = (<anim_struct_member>.fret_anims)
					change structurename = <info_struct> strum = (<anim_struct_member>.strum_anims)
				endif
			endif
		else
			printf 'Anim_set not found for %s' s = <name>
			change structurename = <info_struct> anim_set = car_female_animations
		endif
		if structurecontains structure = <anim_struct_member> facial_anims
			printf channel = animinfo qs(0x01e34256) s = <name>
			change structurename = <info_struct> facial_anims = (<anim_struct_member>.facial_anims)
			change structurename = <info_struct> facial_anims_default = (<anim_struct_member>.facial_anims)
		else
			printf channel = animinfo qs(0x578cc9b0) s = <name>
			change structurename = <info_struct> facial_anims = none
			change structurename = <info_struct> facial_anims_default = none
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
	if (<objid> = guitarist)
		printf \{channel = animinfo
			qs(0x95f334b8)}
	endif
	hero_play_facial_anim anim = <anim>
	hero_wait_until_anim_finished \{timer = facialtimer}
	if (<objid> = guitarist)
		printf \{channel = animinfo
			qs(0x07754075)}
	endif
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
		printf \{channel = animinfo
			qs(0x989b10a0)}
		return
	endif
	if NOT structurecontains structure = $<facial_anims> name = idle
		return
	endif
	begin
	anim = ($<info_struct>.facial_anim)
	if NOT structurecontains structure = $<facial_anims> name = <anim>
		if ($display_facial_anim_info = true)
			printf channel = animinfo qs(0x88ae47d6) a = <anim>
		endif
		anim = idle
	endif
	anims = ($<facial_anims>.<anim>)
	getarraysize <anims>
	getrandomvalue name = index integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<index>])
	if ($display_facial_anim_info = true)
		printf channel = animinfo qs(0xab9f8ab8) a = <anim> b = <anim_name> c = <objid>
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
	cleareventhandlergroup \{hand_events}
endscript
band_character_names = [
	musician1
	musician2
	musician3
	musician4
]

script play_intro_anims 
	band_restartidles
	printf \{channel = pop
		qs(0xcebd4098)}
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
				if ($current_band != band_nodoubt_dontspeak &&
						$current_band != band_nodoubt_justagirl)
					return
				endif
			endif
			start = 0.0
			if (<position> = vocalist)
				if using_singing_guitarist
					start = 0.5
				endif
			endif
			intro_anim = ($<info_struct>.intro_anim_name)
			if (<intro_anim> != none)
				printf channel = marc qs(0x4817379c) a = <intro_anim> b = <checksum>
				band_playsimpleanim {name = <checksum> anim = <intro_anim> blendduration = 0.3 start = <start>}
				if (<part> = guitar || <part> = bass)
					0x9d82f6c5 = 0
					if (<intro_anim> = 0x5d15ec08)
						0x9d82f6c5 = 1
					endif
					<checksum> :gettags lefty
					if (<lefty> = 1 || <0x9d82f6c5> = 1)
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
	printf \{channel = band
		qs(0xd0b94ba9)}
	killspawnedscript \{name = return_characters_to_idle_at_song_time}
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
				printf channel = marc 'Playing %a on %b' a = <win_anim> b = <checksum> donotresolve
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
	printf \{channel = band
		qs(0xfd1cde30)}
	band_showmic_stand \{name = vocalist}
	killspawnedscript \{name = return_characters_to_idle_at_song_time}
	getarraysize \{$band_character_names}
	i = 0
	begin
	name = ($band_character_names [<i>])
	spawnscriptnow play_lose_anims_foreach params = {checksum = <name>}
	i = (<i> + 1)
	repeat <array_size>
	return
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
				printf channel = animinfo 'Playing %a on %b' a = <lose_anim> b = <checksum> donotresolve
			else
				printf channel = animinfo qs(0x283913b7) a = <checksum>
			endif
			wait \{1
				gameframe}
			band_movetostartnode name = <checksum> allow_in_2player = true
		endif
	endif
endscript
g_song_outro_anims_current_player = 1
g_song_outro_anims_initial_speed = 1.0

script play_song_outro_anims 
	setpakmancurrent \{map = ui_paks
		pakname = 'song_breakdown'}
	change \{g_song_outro_anims_initial_speed = 1.0}
	change \{g_song_outro_anims_current_player = 1}
	used_anim_camera_pairs = []
	createscreenelement \{parent = root_window
		id = song_outro_anims_container
		type = containerelement
		alpha = 1
		pos_anchor = [
			left
			top
		]
		just = [
			left
			top
		]
		pos = (0.0, 0.0)
		z_priority = 400
		dims = (100.0, 100.0)}
	start_skip_id = <id>
	if NOT ininternetmode
		<start_skip_id> :se_setprops {
			event_handlers = [
				{pad_start song_outro_anims_skip_anims params = {start_skip_id = <start_skip_id>}}
			]
		}
		launchevent type = focus target = <start_skip_id>
		add_user_control_helper \{text = qs(0x784c64ff)
			button = start
			z = 100000}
	endif
	song_outro_determine_camera_cut_order
	getarraysize <order>
	getnumplayersingame \{on_screen}
	order_idx = 0
	begin
	getplayerinfo (<order> [<order_idx>].player_num) part
	begin
	song_outro_get_random_animation_for_part part = <part>
	if NOT ((gotparam anim) || (gotparam anim_index))
		scriptassert \{qs(0x4ecdbc6c)}
	endif
	song_outro_get_random_camera_for_anim part = <part> anim_index = <anim_index>
	if NOT ((gotparam cam) || (gotparam cam_index) || (gotparam cam_initial_speed))
		scriptassert \{qs(0x0f075f55)}
	endif
	song_outro_anims_check_if_used anim_cam_pair_array = <used_anim_camera_pairs> anim_index = <anim_index> cam_index = <cam_index> part = <part>
	if (<is_used> = 0)
		if (<part> = bass)
			<part> = guitar
		endif
		addarrayelement array = <used_anim_camera_pairs> element = {anim = <anim_index> cam = <cam_index> part = <part>}
		<used_anim_camera_pairs> = <array>
		printstruct <anim_camera_pairs>
		break
	endif
	repeat
	getplayerinfo (<order> [<order_idx>].player_num) band_member
	if compositeobjectexists name = <band_member>
		extendcrc <band_member> '_Info' out = info_struct
		band_movetostartnode name = <band_member>
		band_changefacialanims name = <band_member>
		if (<anim> != none)
			spawnscriptnow \{playcamerawinsfx}
			bandmanager_changeik name = <band_member> enabled = false
			band_playsimpleanim {name = <band_member> anim = <anim> blendduration = 0.3}
			<band_member> :ragdoll_markforreset
			getstartnodeid member = <band_member>
			getwaypointpos name = <waypoint_id>
			getwaypointdir name = <waypoint_id>
			moment_cam_lock_target_01 :obj_setposition position = <pos>
			moment_cam_lock_target_01 :obj_setorientation dir = <dir>
			change g_song_outro_anims_current_player = (<order> [<order_idx>].player_num)
			chain_part = slave
			band_setikchain name = <band_member> chain = <chain_part>
			change g_song_outro_anims_initial_speed = <cam_initial_speed>
			setslomo <cam_initial_speed>
			spawnscript \{songwon_fx}
			momentcamera_playanim_spawned name = moment_cam_lock_target_01 anim = <cam> tempoanim = <cam> cycle = 0 start = 0 blendduration = 0
		endif
	endif
	<order_idx> = (<order_idx> + 1)
	repeat <array_size>
	killspawnedscript \{name = reset_ragdoll_hack_for_playday}
	song_outro_anims_skip_anims start_skip_id = <start_skip_id>
endscript

script reset_ragdoll_hack_for_playday 
	begin
	if compositeobjectexists \{name = musician1}
		musician1 :ragdoll_markforreset
	endif
	if compositeobjectexists \{name = musician2}
		musician2 :ragdoll_markforreset
	endif
	if compositeobjectexists \{name = musician3}
		musician3 :ragdoll_markforreset
	endif
	if compositeobjectexists \{name = musician4}
		musician4 :ragdoll_markforreset
	endif
	wait \{1
		gameframe}
	repeat
endscript

script song_outro_get_random_animation_for_part 
	requireparams \{[
			part
		]
		all}
	if (<part> = bass)
		<part> = guitar
	endif
	getarraysize (($song_outro_anims).<part>)
	if (<array_size> > 0)
		getrandomvalue a = 0 b = (<array_size> - 1) name = i integer
		return {
			anim = ((($song_outro_anims).<part>) [<i>].anim)
			anim_index = <i>
		}
	endif
endscript

script song_outro_get_random_camera_for_anim 
	requireparams \{[
			part
			anim_index
		]
		all}
	if (<part> = bass)
		<part> = guitar
	endif
	getarraysize ((($song_outro_anims).<part>) [<anim_index>].cameras)
	if (<array_size> > 0)
		getrandomvalue a = 0 b = (<array_size> - 1) name = i integer
		return {
			cam = ((((($song_outro_anims).<part>) [<anim_index>].cameras) [<i>]).camera)
			cam_initial_speed = ((((($song_outro_anims).<part>) [<anim_index>].cameras) [<i>]).initial_speed)
			cam_index = <i>
		}
	endif
endscript

script song_outro_anims_check_if_used 
	requireparams \{[
			anim_cam_pair_array
			anim_index
			cam_index
			part
		]}
	getarraysize <anim_cam_pair_array>
	if (<part> = bass)
		<part> = guitar
	endif
	if (<array_size> > 0)
		i = 0
		begin
		if (<anim_cam_pair_array> [<i>].part = <part>)
			if ((<anim_cam_pair_array> [<i>].anim = <anim_index>))
				return \{is_used = 1}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{is_used = 0}
endscript

script song_outro_determine_camera_cut_order 
	gamemode_gettype
	player_order = []
	if ((<type> = career) || (<type> = quickplay))
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen}
			begin
			percent_notes_hit = 0
			getplayerinfo <player> part
			if (<part> = vocals)
				getplayerinfo <player> vocal_phrase_quality
				getplayerinfo <player> vocal_phrase_max_qual
				if (<vocal_phrase_max_qual> > 0.1)
					percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
				else
					<percent_notes_hit> = 0
				endif
				if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
					<percent_notes_hit> = 1
				endif
			else
				getplayerinfo <player> notes_hit
				getplayerinfo <player> max_notes
				if (<max_notes> > 0)
					<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
				else
					<percent_notes_hit> = 0
				endif
				if (<percent_notes_hit> = 0 && <notes_hit> > 0)
					<percent_notes_hit> = 1
				endif
			endif
			addarrayelement {
				array = <player_order>
				element = {
					player_num = <player>
					percent_notes_hit = <percent_notes_hit>
				}
			}
			<player_order> = <array>
			getnextplayer on_screen player = <player>
			repeat <num_players_shown>
			getarraysize <player_order>
			if (<array_size> > 1)
				begin
				<i> = 0
				begin
				left_accuracy = (<player_order> [<i>].percent_notes_hit)
				right_accuracy = (<player_order> [(<i> + 1)].percent_notes_hit)
				if (<right_accuracy> > <left_accuracy>)
					left_score_band_idx = (<player_order> [<i>])
					setarrayelement arrayname = player_order index = <i> newvalue = (<player_order> [(<i> + 1)])
					setarrayelement arrayname = player_order index = (<i> + 1) newvalue = <left_score_band_idx>
				endif
				<i> = (<i> + 1)
				repeat (<array_size> - 1)
				repeat <array_size>
			endif
		endif
	else
		song_breakdown_competitive_determine_order_from_score
		getarraysize <order>
		if (<array_size> > 0)
			getnumplayersingame \{on_screen}
			if (<num_players_shown> > 0)
				getfirstplayer \{on_screen}
				begin
				getplayerinfo <player> band
				if (<band> = (<order> [0].band_num))
					addarrayelement {
						array = player_order
						element = {
							player_num = <player>
						}
					}
					<player_order> = <array>
				endif
				getnextplayer on_screen player = <player>
				repeat <num_players_shown>
			endif
		endif
	endif
	return order = <player_order>
endscript

script song_outro_anims_display_stats 
	requireparams \{[
			parent
			stats_display_secs
			slomo_speed
		]
		all}
	killspawnedscript \{name = song_outro_anims_display_stats_spawned}
	spawnscriptnow song_outro_anims_display_stats_spawned params = {parent = <parent> stats_display_secs = <stats_display_secs> slomo_speed = <slomo_speed>}
endscript

script song_outro_anims_display_stats_spawned 
	requireparams \{[
			parent
			stats_display_secs
			slomo_speed
		]
		all}
	player = ($g_song_outro_anims_current_player)
	ui_song_breakdown_get_player_display_name player_index = <player>
	name_text = <player_name_text>
	getplayerinfo <player> part
	getplayerinfo <player> difficulty
	percent_container_alpha = 1
	percent_stacker_pos = (0.0, 0.0)
	if NOT (<part> = vocals)
		getplayerinfo <player> best_run
		getplayerinfo <player> max_notes
		getplayerinfo <player> notes_hit
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		mathfloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		if (<percent_notes_hit> = 0 && <notes_hit> > 0)
			percent_notes_hit = 1
		endif
		formattext textname = percent_text qs(0x581d2af2) p = <percent_notes_hit>
		formattext textname = streak_text qs(0x8c5c152d) n = <best_run> decimalplaces = 0
		formattext \{textname = streak_unit_text
			qs(0x6036c2d7)}
	else
		getplayerinfo <player> vocal_streak_phrases
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			mathfloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				percent_notes_hit = 1
			endif
			formattext textname = percent_text qs(0x581d2af2) p = <percent_notes_hit> decimalplaces = 0
		else
			<percent_text> = qs(0x6a5cf46c)
			<percent_container_alpha> = 0
			<percent_stacker_pos> = (25.0, 0.0)
		endif
		formattext textname = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> decimalplaces = 0
		formattext \{textname = streak_unit_text
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
			getplayerinfo <player> double_kick_drum
			if (<double_kick_drum> = 1)
				diff_texture = icon_difficulty_expert_plus
			endif
		endif
	endswitch
	if screenelementexists id = <parent>
		setslomo <slomo_speed>
		createscreenelement {
			parent = <parent>
			type = descinterface
			desc = 'song_outro_anim_stats'
			pos_anchor = [left , top]
			just = [left , top]
			pos = (-300.0, 130.0)
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
			pos = (-10.0, -10.0)
			alpha = 1
			time = 0.2
			anim = ease_out
		}
	endif
	wait <stats_display_secs> seconds ignoreslomo
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
	setslomo ($g_song_outro_anims_initial_speed)
endscript

script song_outro_anims_skip_anims 
	killspawnedscript \{name = reset_ragdoll_hack_for_playday}
	if screenelementexists id = <start_skip_id>
		destroyscreenelement id = <start_skip_id>
	endif
	clean_up_user_control_helpers
	change \{g_song_outro_anims_initial_speed = 1.0}
	setslomo ($g_song_outro_anims_initial_speed)
	cameracuts_setarrayprefix \{prefix = 'cameras_no_band'
		length = 5
		changenow
		extra_params = {
			force_time = 5
		}
		play_hold = 1}
	spawnscriptnow \{switch_off_cameracuts_delayed}
	restore_idle_faces
	spawnscriptnow \{id = not_transitions
		transition_killall}
endscript

script switch_off_cameracuts_delayed 
	wait \{2
		gameframes}
	cameracuts_enablechangecam \{enable = false}
endscript

script restore_idle_faces 
	printf \{channel = marc
		qs(0x448c7e93)}
	i = 1
	begin
	formattext checksumname = musician 'musician%a' a = <i>
	formattext checksumname = info_struct 'musician%a_info' a = <i>
	fa_anims = ($<info_struct>.facial_anims_default)
	change structurename = <info_struct> facial_anims = <fa_anims>
	if compositeobjectexists name = <musician>
		<musician> :obj_killspawnedscript name = facial_anim_loop
		<musician> :obj_spawnscriptnow facial_anim_loop
	endif
	i = (<i> + 1)
	repeat 4
endscript

script hide_band 
	if compositeobjectexists \{musician1}
		musician1 :hide
	endif
	if compositeobjectexists \{musician2}
		musician2 :hide
	endif
	if compositeobjectexists \{musician3}
		musician3 :hide
	endif
	if compositeobjectexists \{musician4}
		musician4 :hide
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

script create_vocalist_dummy 
	return
endscript

script destroy_vocalist_dummy 
	if compositeobjectexists \{vocalist_dummy}
		vocalist_dummy :die
	endif
	if compositeobjectexists \{vocalist_head_dummy}
		vocalist_head_dummy :die
	endif
endscript

script create_all_camera_lock_targets 
	destroy_all_camera_lock_targets
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
	printf \{channel = band
		qs(0xd3661dee)}
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
			if ($use_alt_positions = 1)
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
			if ($use_alt_positions = 1)
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
			if ($use_alt_positions = 1)
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
			if ($use_alt_positions = 1)
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
		printf qs(0x97a15241) a = <i> b = <lock_target_01>
		momentcamera_playanim anim = drumdroid_standardlp_c01 start_node_crc = <start_node_crc> lock_target = <lock_target_01> cycle = 1 start = <start_pct>
		momentcamera_playanim anim = drumdroid_standardlp_c02 start_node_crc = <start_node_crc> lock_target = <lock_target_02> cycle = 1 start = <start_pct>
	else
		printf qs(0x173efbf1) a = (<i> + 1)
	endif
	i = (<i> + 1)
	repeat 4
endscript

script preparebandmemberforrenderupdateloop 
	begin
	bandmanager_preparebandmemberforrender
	wait \{1
		gameframe}
	repeat
endscript

script all_players_using_starpower 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if playerinfoequals <player> star_power_used = 0
			return \{false}
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return \{true}
endscript
playing_group_starpower_anim = false

script play_group_star_power_animation 
	return
	printf \{channel = animinfo
		qs(0x8772e70c)}
	band_builder_get_band_global
	if (<band> != default_band)
		return
	endif
	if ($playing_group_starpower_anim = true)
		printf \{channel = animinfo
			qs(0x65c79e61)}
		return
	endif
	printf \{channel = animinfo
		qs(0x70a89b40)}
	printf \{channel = animinfo
		qs(0xdf4c1b2b)}
	return
endscript

script kill_group_starpower_anim \{changecamera = 1}
	if ($playing_group_starpower_anim = false)
		return
	endif
	killspawnedscript \{name = play_group_star_power_animation}
	if (<changecamera> = 1)
		cameracuts_setarrayprefix \{prefix = 'cameras'}
	endif
	change \{cameracuts_allownotescripts = true}
	change \{playing_group_starpower_anim = false}
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

script is_head_to_head_mode 
	switch $game_mode
		case p2_pro_faceoff
		return \{true}
	endswitch
	return \{false}
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
			name = kick
			value = 0
			case 74
			name = t3
			value = 7
			case 75
			name = t2
			value = 5
			case 76
			name = t1
			value = 4
			case 77
			name = s1
			value = 1
			case 78
			name = h1c
			value = 2
			case 79
			name = h1o
			value = 2
			case 80
			name = c3
			value = 8
			case 81
			name = c1
			value = 3
			case 82
			name = c2
			value = 6
			case 83
			name = countin
			value = 0
		endswitch
		addarrayelement array = <piece_array> element = <name>
		piece_array = <array>
		addarrayelement array = <piece_array2> element = <value>
		piece_array2 = <array>
		addarrayelement array = <piece_velocities> element = <velocity>
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
		addarrayelement array = <hit_info> element = <new_entry>
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
	if NOT gotparam \{start_note}
		script_assert \{qs(0x24d20e06)}
	endif
	if NOT gotparam \{end_note}
		script_assert \{qs(0x2225c368)}
	endif
	if NOT gotparam \{control_script}
		script_assert \{qs(0x72d1918d)}
		return
	endif
	gman_songtool_getcurrentsong
	get_song_prefix song = <current_song>
	formattext checksumname = event_array '%s_drums_notes' s = <song_prefix> addtostringlookup = true
	if NOT globalexists name = <event_array> type = array
		printf \{channel = mydebug
			qs(0xce6b470a)}
		return
	endif
	array_entry = 0
	getarraysize $<event_array>
	note_array_size = <array_size>
	time_offset = 0
	skipleadin = 0
	if (<note_array_size> = 0)
		return
	endif
	begin
	getsongtimems time_offset = <time_offset>
	if (<time> >= 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	current_time = 0
	if compositeobjectexists \{name = musician2}
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
	timemarkerreached_setparams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
	begin
	if timemarkerreached
		break
	endif
	wait \{1
		gameframe}
	repeat
	timemarkerreached_clearparams
	current_time = ($<event_array> [<array_entry>])
	decompressnotevalue note_value = ($<event_array> [(<array_entry> + 1)])
	if (<note> >= <start_note> && <note> <= <end_note>)
		build_notehit_data <...>
		if compositeobjectexists \{name = musician2}
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
	if NOT gotparam \{hit_info}
	endif
	animinfo_getallactivevaluesources
	<control_script> hit_info = <hit_info> <...>
	animpreview_setsourcevalues <...>
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
		<name> :ragdoll_markforreset
	endif
	index = (<index> + 1)
	repeat 4
	bandmanager_updateallanimsets
	bandmanager_allchangestance \{stance = stance_a}
	band_restartidles
endscript
