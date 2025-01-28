
script strum_iterator \{song_name = 'test'
		difficulty = 'easy'
		array_type = 'song'
		part = ''}
	strum_iterator_cfunc_setup
	begin
	if strum_iterator_cfunc
		break
	endif
	waitonegameframe
	repeat
	strum_iterator_cfunc_cleanup
endscript

script fretpos_iterator 
	if NOT gotparam \{target}

		return
	endif
	if ($disable_band = 1)
		return
	endif
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_anim_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array

		return
	endif
	array_entry = 0
	getarraysize $<event_array>
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
		array_size = (<array_size> - <array_entry>)
		if (<array_size> = 0)
			return
		endif
		begin
		timemarkerreached_setparams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> arrayofarrays
		begin
		if timemarkerreached
			getsongtimems time_offset = <time_offset>
			break
		endif
		waitonegameframe
		repeat
		timemarkerreached_clearparams
		note = ($<event_array> [<array_entry>] [1])
		length = ($<event_array> [<array_entry>] [2])
		if compositeobjectexists name = <target>
			if (<part> = guitar)
				if ((<note> >= 118) && (<note> <= 127))
					launchevent type = pose_fret target = <target> data = {note = <note> note_length = <note_length>}
				endif
			else
				if ((<note> >= 101) && (<note> <= 110))
					launchevent type = pose_fret target = <target> data = {note = <note> note_length = <note_length>}
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
	endif
endscript

script fretfingers_iterator \{part = ''}
	fretfingers_iterator_cfunc_setup
	begin
	if fretfingers_iterator_cfunc
		break
	endif
	waitonegameframe
	repeat
	fretfingers_iterator_cfunc_cleanup
endscript

script watchforstartplaying_iterator 
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_song_expert' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		return
	endif
	array_entry = 0
	getarraysize $<event_array>
	song_array_size = (<array_size> / $num_song_columns)
	getsongtimems time_offset = <time_offset>
	if NOT (<song_array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + $num_song_columns)
		repeat <song_array_size>
		song_array_size = (<song_array_size> - (<array_entry> / $num_song_columns))
		if (<song_array_size> = 0)
			return
		endif
		timemarkerreached_setparams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
		begin
		if timemarkerreached
			getsongtimems time_offset = <time_offset>
			break
		endif
		waitonegameframe
		repeat
		timemarkerreached_clearparams
		broadcastevent \{type = start_playing}
	endif
endscript

script drum_iterator 
	drum_iterator_cfunc_setup
	begin
	if drum_iterator_cfunc
		break
	endif
	waitonegameframe
	repeat
	drum_iterator_cfunc_cleanup
endscript

script drum_cymbal_iterator 
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_drums_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array

		return
	endif
	array_entry = 0
	getarraysize $<event_array>
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
		array_size = (<array_size> - <array_entry>)
		if (<array_size> = 0)
			return
		endif
		begin
		timemarkerreached_setparams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> arrayofarrays
		begin
		if timemarkerreached
			getsongtimems time_offset = <time_offset>
			break
		endif
		waitonegameframe
		repeat
		timemarkerreached_clearparams
		if compositeobjectexists \{name = drummer}
			note = ($<event_array> [<array_entry>] [1])
			length = ($<event_array> [<array_entry>] [2])
			if ((<note> >= 37) && (<note> <= 45))
				switch (<note>)
					case 44
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal1 timerid = cymbaltimer1 anim = ($cymbal_anims [0]) blendduration = $drum_blend_time
					case 45
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal2 timerid = cymbaltimer2 anim = ($cymbal_anims [1]) blendduration = $drum_blend_time
					case 43
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal3 timerid = cymbaltimer3 anim = ($cymbal_anims [2]) blendduration = $drum_blend_time
					case 41
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal4 timerid = cymbaltimer4 anim = ($cymbal_anims [3]) blendduration = $drum_blend_time
					case 42
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal4 timerid = cymbaltimer4 anim = ($cymbal_anims [3]) blendduration = $drum_blend_time
				endswitch
			elseif ((<note> >= 49) && (<note> <= 57))
				switch (<note>)
					case 56
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal1 timerid = cymbaltimer1 anim = ($cymbal_anims [0]) blendduration = $drum_blend_time
					case 57
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal2 timerid = cymbaltimer2 anim = ($cymbal_anims [1]) blendduration = $drum_blend_time
					case 55
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal3 timerid = cymbaltimer3 anim = ($cymbal_anims [2]) blendduration = $drum_blend_time
					case 53
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal4 timerid = cymbaltimer4 anim = ($cymbal_anims [3]) blendduration = $drum_blend_time
					case 54
					drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal4 timerid = cymbaltimer4 anim = ($cymbal_anims [3]) blendduration = $drum_blend_time
				endswitch
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
	endif
endscript

script handle_strum_event 
	obj_getid
	0x0666218b id = <objid>
	obj_killspawnedscript \{name = hero_strum_guitar}
	obj_spawnscriptnow hero_strum_guitar params = {note_length = <note_length>}
endscript

script handle_missed_strum_event 
	obj_killspawnedscript \{name = hero_strum_guitar}
	obj_spawnscriptnow hero_strum_guitar params = {note_length = <note_length>}
endscript

script handle_start_playing 

	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	if (<info_struct>.stance = intro || <info_struct>.stance = intro_smstg)
		handle_change_stance \{stance = stance_a}
	endif
endscript

script handle_fret_event 
	obj_getid
	0x0666218b id = <objid>
	handle_fret_event_cfunc note = <note>
endscript

script handle_finger_event 
	obj_getid
	0x0666218b id = <objid>
	hero_play_chord chord = <chord>
endscript

script handle_missed_note 
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	if ($<info_struct>.playing_missed_note = false)
		change structurename = <info_struct> playing_missed_note = true
		strum_anims = $bad_strums
		anim_length = ($<info_struct>.last_strum_length)
		strum_anim = (<strum_anims>.<anim_length> [0])
		hero_play_strum_anim anim = <strum_anim> blendduration = 0.1
	endif
endscript

script handle_hit_note 
	obj_getid
	handle_hit_note_cfunc
endscript

script handle_change_stance \{speed = 1.0}
	obj_getid
	0x0666218b id = <objid>
	extendcrc <objid> '_Info' out = info_struct
	display_debug_info = false
	if (should_display_debug_info)
		display_debug_info = true
	endif
	if gotparam \{no_wait}
		anim_set = ($<info_struct>.anim_set)
		old_stance = ($<info_struct>.stance)
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <old_stance> new_stance = <stance>
			hero_play_anim anim = <anim_to_run> speed = <speed>
			hero_wait_until_anim_finished
		else
		endif
		change structurename = <info_struct> stance = <stance>
		change structurename = <info_struct> next_stance = <stance>
		if (<display_debug_info> = true)

		endif
		if (<objid> = guitarist || <objid> = bassist)
			if (<stance> = intro || <stance> = intro_smstg || <stance> = stance_frontend || <stance> = stance_frontend_guitar)
				change structurename = <info_struct> disable_arms = 2
				change structurename = <info_struct> next_anim_disable_arms = 2
			else
				change structurename = <info_struct> disable_arms = 0
				change structurename = <info_struct> next_anim_disable_arms = 0
			endif
			obj_switchscript \{guitarist_idle}
		else
			obj_switchscript \{bandmember_idle}
		endif
	else
		if (<display_debug_info> = true)

		endif
		change structurename = <info_struct> next_stance = <stance>
		if (<objid> = guitarist || <objid> = bassist)
			if (<stance> = intro || <stance> = intro_smstg || <stance> = stance_frontend || <stance> = stance_frontend_guitar)
				change structurename = <info_struct> next_anim_disable_arms = 2
			else
				change structurename = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
	return
endscript

script queue_change_stance 
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	change structurename = <info_struct> next_stance = <stance>
endscript

script handle_play_anim 
	obj_getid
	0x0666218b id = <objid>
	extendcrc <objid> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	display_debug_info = false
	if (should_display_debug_info)
		display_debug_info = true
	endif
	if gotparam \{no_wait}
		if (<display_debug_info> = true)

		endif
		change structurename = <info_struct> current_anim = <anim>
		change structurename = <info_struct> next_anim = none
		if gotparam \{repeat_count}
			change structurename = <info_struct> anim_repeat_count = <repeat_count>
		else
			change structurename = <info_struct> anim_repeat_count = 1
		endif
		if gotparam \{cycle}
			change structurename = <info_struct> cycle_anim = true
		else
			change structurename = <info_struct> cycle_anim = false
		endif
		if (<name> = guitarist || <name> = bassist)
			if gotparam \{disable_auto_arms}
				change structurename = <info_struct> disable_arms = 2
			elseif gotparam \{disable_auto_strum}
				change structurename = <info_struct> disable_arms = 1
			else
				change structurename = <info_struct> disable_arms = 0
			endif
		endif
		obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
		obj_spawnscriptnow hero_play_adjusting_random_anims params = {anim = <anim>}
	else
		if (<display_debug_info> = true)
			if (<info_struct>.next_anim != none)

			else

			endif
		endif
		change structurename = <info_struct> next_anim = <anim>
		if gotparam \{repeat_count}
			change structurename = <info_struct> next_anim_repeat_count = <repeat_count>
		else
			change structurename = <info_struct> next_anim_repeat_count = 1
		endif
		if gotparam \{cycle}
			change structurename = <info_struct> cycle_next_anim = true
		else
			change structurename = <info_struct> cycle_next_anim = false
		endif
		if (<name> = guitarist || <name> = bassist)
			if gotparam \{disable_auto_arms}
				change structurename = <info_struct> next_anim_disable_arms = 2
			elseif gotparam \{disable_auto_strum}
				change structurename = <info_struct> next_anim_disable_arms = 1
			else
				change structurename = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
endscript

script handle_walking 
	obj_getid
	if (<objid> != <name>)
		return
	endif
	0x0666218b id = <objid>
	extendcrc <objid> '_Info' out = info_struct
	if ($<info_struct>.allow_movement != true)
		return
	endif
	if NOT ($<info_struct>.stance = stance_a)
		anim_set = ($<info_struct>.anim_set)
		old_stance = ($<info_struct>.stance)
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <old_stance> new_stance = stance_a
			hero_play_anim anim = <anim_to_run>
			hero_wait_until_anim_finished
		endif
		change structurename = <info_struct> stance = stance_a
	endif
	change structurename = <info_struct> disable_arms = 0
	obj_switchscript guitarist_walking params = {<...>}
endscript

script play_drum_anim \{arm = left
		blendduration = $drum_blend_time}
	if NOT gotparam \{anim}
		return
	endif
	if (<arm> = left)
		obj_killspawnedscript \{name = play_drummer_left_arm_anim}
		obj_spawnscriptnow play_drummer_left_arm_anim params = {anim = <anim> blendduration = <blendduration>}
	else
		obj_killspawnedscript \{name = play_drummer_right_arm_anim}
		obj_spawnscriptnow play_drummer_right_arm_anim params = {anim = <anim>}
	endif
endscript

script play_drummer_left_arm_anim 
	hero_play_anim tree = $hero_drumming_branch timerid = leftarm_timer target = drummerleftarm anim = <anim> blendduration = <blendduration>
	hero_wait_until_anim_finished \{timer = leftarm_timer}
	wait \{$drummer_arm_blend_out_delay
		seconds}
	wait \{$drummer_clear_arm_twist_value_delay
		seconds}
	change \{structurename = drummer_info
		last_left_arm_note = 0}
endscript

script play_drummer_right_arm_anim 
	hero_play_anim tree = $hero_drumming_branch timerid = rightarm_timer target = drummerrightarm anim = <anim> blendduration = <blendduration>
	hero_wait_until_anim_finished \{timer = rightarm_timer}
	wait \{$drummer_arm_blend_out_delay
		seconds}
	wait \{$drummer_clear_arm_twist_value_delay
		seconds}
	change \{structurename = drummer_info
		last_right_arm_note = 0}
endscript
