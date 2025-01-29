
script strum_iterator \{song_name = "test"
		difficulty = "easy"
		array_type = "song"
		part = ''}
	if NOT gotparam \{target}
		printf \{"Strum_iterator called without target!"}
		return
	endif
	get_song_prefix song = <song_name>
	formattext checksumname = song '%s_song_%pexpert' s = <song_prefix> p = <part> addtostringlookup
	array_entry = 0
	getarraysize $<song>
	if (<array_size> = 0)
		return
	endif
	song_array_size = (<array_size> / $num_song_columns)
	getsongtimems time_offset = <time_offset>
	if NOT (<song_array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < ($<song> [<array_entry>]))
			break
		endif
		<array_entry> = (<array_entry> + $num_song_columns)
		repeat <song_array_size>
		song_array_size = (<song_array_size> - (<array_entry> / $num_song_columns))
	endif
	extendcrc <target> '_Info' out = info_struct
	begin
	if (<song_array_size> = 0)
		break
	endif
	timemarkerreached_setparams time_offset = <time_offset> array = <song> array_entry = <array_entry>
	begin
	if timemarkerreached
		getsongtimems time_offset = <time_offset>
		break
	endif
	wait \{1
		gameframe}
	repeat
	timemarkerreached_clearparams
	if (($<info_struct>.playing) = true)
		note_length = ($<song> [(<array_entry> + 1)])
		if (<note_length> > 0)
			launchevent type = strum_guitar target = <target> data = {note_length = <note_length>}
		endif
	endif
	<array_entry> = (<array_entry> + $num_song_columns)
	repeat <song_array_size>
endscript

script fretpos_iterator 
	if NOT gotparam \{target}
		printf \{"FretPos_iterator called without target!"}
		return
	endif
	if ($disable_band = 1)
		return
	endif
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_anim_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		printf \{"FRETPOS ANIMS DISABLED: No midi events found for this song"}
		return
	endif
	extendcrc <target> '_Info' out = info_struct
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
		if (<part> = guitar)
			min_note = 118
			max_note = 127
		elseif (<part> = rhythm)
			min_note = 84
			max_note = 93
		else
			min_note = 101
			max_note = 110
		endif
		begin
		timemarkerreached_setparams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> arrayofarrays
		begin
		if timemarkerreached
			getsongtimems time_offset = <time_offset>
			break
		endif
		wait \{1
			gameframe}
		repeat
		timemarkerreached_clearparams
		if (($<info_struct>.playing) = true)
			note = ($<event_array> [<array_entry>] [1])
			length = ($<event_array> [<array_entry>] [2])
			if ((<note> >= <min_note>) && (<note> <= <max_note>))
				if compositeobjectexists name = <target>
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
	wait \{1
		gameframe}
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
		wait \{1
			gameframe}
		repeat
		timemarkerreached_clearparams
		broadcastevent \{type = start_playing}
	endif
endscript

script faceoff_anim_iterator \{song_name = "test"
		difficulty = "easy"
		array_type = "song"
		part = ''}
	printf channel = faceoff "Faceoff_Anim_iterator for player %a " a = <player>
	if NOT gotparam \{player}
		printf \{"Faceoff_Anim_iterator called without param 'player'!"}
		return
	endif
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_faceoff%p' s = <song_prefix> p = <player_text> addtostringlookup
	array_entry = 0
	getarraysize $<event_array>
	if (<array_size> = 0)
		return
	endif
	getsongtimems time_offset = <time_offset>
	begin
	if ((<time> - <skipleadin>) < ($<event_array> [<array_entry>]) [0])
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	array_size = (<array_size> - <array_entry>)
	if (<array_size> = 0)
		return
	endif
	begin
	begin
	getsongtimems time_offset = <time_offset>
	if (<time> >= $<event_array> [<array_entry>] [0])
		break
	endif
	wait \{1
		gameframe}
	repeat
	target = (<player_status>.band_member)
	extendcrc <target> '_Info' out = info_struct
	change structurename = <info_struct> playing = true
	play_time = ($<event_array> [<array_entry>] [1])
	stop_playing_time = (($<event_array> [<array_entry>] [0]) + ($<event_array> [<array_entry>] [1]))
	begin
	getsongtimems time_offset = <time_offset>
	if (<time> >= <stop_playing_time>)
		break
	endif
	wait \{1
		gameframe}
	printf channel = faceoff "%a is playing" a = <player>
	repeat
	change structurename = <info_struct> playing = false
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script drum_iterator 
	drum_iterator_cfunc_setup
	begin
	if drum_iterator_cfunc
		break
	endif
	wait \{1
		gameframe}
	repeat
	drum_iterator_cfunc_cleanup
endscript

script drum_cymbal_iterator 
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_drums_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		printf \{"FRETPOS ANIMS DISABLED: No midi events found for this song"}
		return
	endif
	array_entry = 0
	getarraysize $<event_array>
	cymbal_anims = ($drummer_info.cymbal_anims)
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
		wait \{1
			gameframe}
		repeat
		timemarkerreached_clearparams
		if compositeobjectexists \{name = drummer}
			if ($drummer_info.playing_special_anim = false)
				note = ($<event_array> [<array_entry>] [1])
				length = ($<event_array> [<array_entry>] [2])
				if ((<note> >= 37) && (<note> <= 45))
					switch (<note>)
						case 44
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal1 timerid = cymbaltimer1 anim = ($<cymbal_anims> [0]) blendduration = $cymbal_blend_time
						case 45
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal2 timerid = cymbaltimer2 anim = ($<cymbal_anims> [1]) blendduration = $cymbal_blend_time
						case 43
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal3 timerid = cymbaltimer3 anim = ($<cymbal_anims> [2]) blendduration = $cymbal_blend_time
						case 41
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal4 timerid = cymbaltimer4 anim = ($<cymbal_anims> [3]) blendduration = $cymbal_blend_time
						case 42
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal4 timerid = cymbaltimer4 anim = ($<cymbal_anims> [3]) blendduration = $cymbal_blend_time
					endswitch
				elseif ((<note> >= 49) && (<note> <= 57))
					switch (<note>)
						case 56
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal1 timerid = cymbaltimer1 anim = ($<cymbal_anims> [0]) blendduration = $cymbal_blend_time
						case 57
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal2 timerid = cymbaltimer2 anim = ($<cymbal_anims> [1]) blendduration = $cymbal_blend_time
						case 55
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal3 timerid = cymbaltimer3 anim = ($<cymbal_anims> [2]) blendduration = $cymbal_blend_time
						case 53
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal4 timerid = cymbaltimer4 anim = ($<cymbal_anims> [3]) blendduration = $cymbal_blend_time
						case 54
						drummer :hero_play_anim tree = $hero_drumming_branch target = cymbal4 timerid = cymbaltimer4 anim = ($<cymbal_anims> [3]) blendduration = $cymbal_blend_time
					endswitch
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
	endif
endscript
first_countoff_note = true

script drum_countoff_iterator 
	get_song_struct song = <song_name>
	if structurecontains structure = <song_struct> name = countoff
		if ((<song_struct>.countoff) = 'hihat01' || (<song_struct>.countoff) = 'hihat02')
			return
		endif
	endif
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_drums_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		printf \{"FRETPOS ANIMS DISABLED: No midi events found for this song"}
		return
	endif
	array_entry = 0
	getarraysize $<event_array>
	change \{first_countoff_note = true}
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
		wait \{1
			gameframe}
		repeat
		timemarkerreached_clearparams
		if compositeobjectexists \{name = drummer}
			note = ($<event_array> [<array_entry>] [1])
			length = ($<event_array> [<array_entry>] [2])
			if (<note> = 70)
				next_note = ($<event_array> [(<array_entry> + 1)] [1])
				if (<next_note> = 70)
					drummer :obj_spawnscript \{play_countoff_anim}
				else
					drummer :obj_spawnscript \{play_countoff_anim
						params = {
							last_countoff
						}}
					return
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
	endif
endscript

script play_countoff_anim 
	arm_anims = ($drummer_info.arm_anims)
	blend_time = 0.2
	if ($first_countoff_note = true)
		band_playsimpleanim name = drummer anim = ($<arm_anims>.sticktap_into_l)
		change \{first_countoff_note = false}
		if compositeobjectexists \{name = drummer}
			drummer :hero_wait_until_anim_finished
		endif
		blend_time = 0.0
	else
		delay = (12.0 / 30.0)
		wait <delay> seconds
	endif
	band_playsimpleanim name = drummer anim = ($<arm_anims>.sticktap_l) blendduration = <blend_time>
endscript

script delay_drumkick_broadcast 
	wait <delay> seconds
	broadcastevent type = <type>
endscript

script play_delayed_right_foot_anim 
	wait <delay> seconds
	hero_play_anim tree = $hero_drumming_branch target = rightfoot timerid = rightfoot_timer anim = <anim_name> blendduration = $drum_blend_time_kick
endscript

script handle_strum_event 
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
	extendcrc <objid> '_Info' out = info_struct
	formattext checksumname = track 'track_%n' n = <note>
	fret_anims = ($<info_struct>.fret_anims)
	if NOT structurecontains structure = $<fret_anims> name = <track>
		return
	endif
	anim = (<fret_anims>.<track>)
	obj_killspawnedscript \{name = hero_play_fret_anim}
	obj_spawnscriptnow hero_play_fret_anim params = {anim = <anim>}
endscript

script handle_finger_event 
	obj_killspawnedscript \{name = hero_play_chord}
	obj_spawnscriptnow hero_play_chord params = {chord = <chord>}
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
			ragdoll_markforreset
			hero_wait_until_anim_finished
		else
			ragdoll_markforreset
		endif
		change structurename = <info_struct> stance = <stance>
		change structurename = <info_struct> next_stance = <stance>
		if (<display_debug_info> = true)
			printf channel = animinfo "%a stance is immediately changing to %b ...." a = <objid> b = <stance>
		endif
		if (<objid> = guitarist || <objid> = bassist || <objid> = rhythm)
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
			printf channel = animinfo "%a is queuing stance change to %b............." a = <objid> b = <stance>
		endif
		change structurename = <info_struct> next_stance = <stance>
		if (<objid> = guitarist || <objid> = bassist || <objid> = rhythm)
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
	extendcrc <objid> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	display_debug_info = false
	if (should_display_debug_info)
		display_debug_info = true
	endif
	if gotparam \{no_wait}
		if (<display_debug_info> = true)
			printf channel = animinfo "%a will immediately start the %b anim........" a = <objid> b = <anim>
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
		if (<name> = guitarist || <name> = bassist || <objid> = rhythm)
			if gotparam \{disable_auto_arms}
				change structurename = <info_struct> disable_arms = 2
			elseif gotparam \{disable_auto_strum}
				change structurename = <info_struct> disable_arms = 1
			else
				change structurename = <info_struct> disable_arms = 0
			endif
		endif
		ragdoll_markforreset
		obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
		obj_spawnscriptnow hero_play_adjusting_random_anims params = {anim = <anim>}
	else
		if (<display_debug_info> = true)
			if (<info_struct>.next_anim != none)
				printf channel = animinfo "******* %a is replacing queued anim %b with %c ******* " a = <objid> b = (<info_struct>.next_anim) c = <anim>
			else
				printf channel = animinfo "%a is queueing the %b anim........" a = <objid> b = <anim>
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
		if (<name> = guitarist || <name> = bassist || <objid> = rhythm)
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
		obj_spawnscriptnow play_drummer_left_arm_anim params = {anim = <anim> note = <note> blendduration = <blendduration>}
	else
		obj_killspawnedscript \{name = play_drummer_right_arm_anim}
		obj_spawnscriptnow play_drummer_right_arm_anim params = {anim = <anim> note = <note> blendduration = <blendduration>}
	endif
endscript

script delay_play_drummer_left_arm_anim 
	if ($display_drummer_anim_info = true)
	endif
	wait <delay> seconds
	obj_killspawnedscript \{name = play_drummer_left_arm_anim}
	obj_spawnscriptnow play_drummer_left_arm_anim params = {anim = <anim> note = <note> blendduration = <blendduration>}
endscript

script play_drummer_left_arm_anim 
	if gotparam \{note}
		change structurename = drummer_info last_left_arm_note = <note>
	endif
	hero_play_anim tree = $hero_drumming_branch timerid = leftarm_timer target = drummerleftarm anim = <anim> blendduration = <blendduration>
	hero_wait_until_anim_finished \{timer = leftarm_timer}
	wait \{$drummer_arm_blend_out_delay
		seconds}
	anim_set = ($drummer_info.arm_anims)
	hero_play_anim tree = $hero_drumming_branch timerid = leftarm_timer target = drummerleftarm anim = ($<anim_set>.stickdown_l) blendduration = $drum_blend_out_time cycle
	wait \{$drummer_clear_arm_twist_value_delay
		seconds}
	change \{structurename = drummer_info
		last_left_arm_note = 0}
endscript

script delay_play_drummer_right_arm_anim 
	if ($display_drummer_anim_info = true)
		printf channel = drummer "delaying drum right by %a seconds" a = <delay>
	endif
	wait <delay> seconds
	obj_killspawnedscript \{name = play_drummer_right_arm_anim}
	obj_spawnscriptnow play_drummer_right_arm_anim params = {anim = <anim> note = <note> blendduration = <blendduration>}
endscript

script play_drummer_right_arm_anim 
	if gotparam \{note}
		change structurename = drummer_info last_right_arm_note = <note>
	endif
	hero_play_anim tree = $hero_drumming_branch timerid = rightarm_timer target = drummerrightarm anim = <anim> blendduration = <blendduration>
	hero_wait_until_anim_finished \{timer = rightarm_timer}
	wait \{$drummer_arm_blend_out_delay
		seconds}
	anim_set = ($drummer_info.arm_anims)
	hero_play_anim tree = $hero_drumming_branch timerid = rightarm_timer target = drummerrightarm anim = ($<anim_set>.stickdown_r) blendduration = $drum_blend_out_time cycle
	wait \{$drummer_clear_arm_twist_value_delay
		seconds}
	change \{structurename = drummer_info
		last_right_arm_note = 0}
endscript
