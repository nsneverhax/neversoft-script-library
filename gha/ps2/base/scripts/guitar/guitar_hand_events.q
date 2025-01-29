
script Strum_iterator \{song_name = 'test'
		difficulty = 'easy'
		array_type = 'song'
		part = ''}
	strum_iterator_cfunc_setup
	begin
	if strum_iterator_cfunc
		break
	endif
	WaitOneGameFrame
	repeat
	strum_iterator_cfunc_cleanup
endscript

script FretPos_iterator 
	if NOT GotParam \{target}

		return
	endif
	if ($disable_band = 1)
		return
	endif
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_anim_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array

		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if (<array_Size> = 0)
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
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> ArrayOfArrays
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			break
		endif
		WaitOneGameFrame
		repeat
		TimeMarkerReached_ClearParams
		note = ($<event_array> [<array_entry>] [1])
		length = ($<event_array> [<array_entry>] [2])
		if ((<note> >= <min_note>) && (<note> <= <max_note>))
			if CompositeObjectExists Name = <target>
				LaunchEvent Type = pose_fret target = <target> data = {note = <note> note_length = <note_length>}
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	endif
endscript

script FretFingers_iterator \{part = ''}
	FretFingers_iterator_CFunc_Setup
	begin
	if FretFingers_iterator_CFunc
		break
	endif
	WaitOneGameFrame
	repeat
	FretFingers_iterator_CFunc_Cleanup
endscript

script WatchForStartPlaying_iterator 
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_song_expert' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	song_array_size = (<array_Size> / $num_song_columns)
	GetSongTimeMs time_offset = <time_offset>
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
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			break
		endif
		WaitOneGameFrame
		repeat
		TimeMarkerReached_ClearParams
		broadcastevent \{Type = start_playing}
	endif
endscript

script Drum_iterator 
	Drum_iterator_CFunc_Setup
	begin
	if Drum_iterator_CFunc
		break
	endif
	WaitOneGameFrame
	repeat
	Drum_iterator_CFunc_Cleanup
endscript

script Drum_cymbal_iterator 
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = array

		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if (<array_Size> = 0)
			return
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> ArrayOfArrays
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			break
		endif
		WaitOneGameFrame
		repeat
		TimeMarkerReached_ClearParams
		if CompositeObjectExists \{Name = drummer}
			note = ($<event_array> [<array_entry>] [1])
			length = ($<event_array> [<array_entry>] [2])
			if ((<note> >= 37) && (<note> <= 45))
				switch (<note>)
					case 44
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal1 timerId = CymbalTimer1 anim = ($cymbal_anims [0]) BlendDuration = $cymbal_blend_time
					case 45
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal2 timerId = CymbalTimer2 anim = ($cymbal_anims [1]) BlendDuration = $cymbal_blend_time
					case 43
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal3 timerId = CymbalTimer3 anim = ($cymbal_anims [2]) BlendDuration = $cymbal_blend_time
					case 41
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal4 timerId = CymbalTimer4 anim = ($cymbal_anims [3]) BlendDuration = $cymbal_blend_time
					case 42
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal4 timerId = CymbalTimer4 anim = ($cymbal_anims [3]) BlendDuration = $cymbal_blend_time
				endswitch
			elseif ((<note> >= 49) && (<note> <= 57))
				switch (<note>)
					case 56
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal1 timerId = CymbalTimer1 anim = ($cymbal_anims [0]) BlendDuration = $cymbal_blend_time
					case 57
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal2 timerId = CymbalTimer2 anim = ($cymbal_anims [1]) BlendDuration = $cymbal_blend_time
					case 55
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal3 timerId = CymbalTimer3 anim = ($cymbal_anims [2]) BlendDuration = $cymbal_blend_time
					case 53
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal4 timerId = CymbalTimer4 anim = ($cymbal_anims [3]) BlendDuration = $cymbal_blend_time
					case 54
					drummer :hero_play_anim Tree = $hero_drumming_branch target = cymbal4 timerId = CymbalTimer4 anim = ($cymbal_anims [3]) BlendDuration = $cymbal_blend_time
				endswitch
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	endif
endscript

script handle_strum_event 
	Obj_GetID
	0x0666218b id = <objID>
	Obj_KillSpawnedScript \{Name = hero_strum_guitar}
	Obj_SpawnScriptNow hero_strum_guitar params = {note_length = <note_length>}
endscript

script handle_missed_strum_event 
	Obj_KillSpawnedScript \{Name = hero_strum_guitar}
	Obj_SpawnScriptNow hero_strum_guitar params = {note_length = <note_length>}
endscript

script handle_start_playing 
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	if (<info_struct>.stance = Intro || <info_struct>.stance = intro_smStg)
		handle_change_stance \{stance = Stance_A}
	endif
endscript

script handle_fret_event 
	Obj_GetID
	0x0666218b id = <objID>
	handle_fret_event_cfunc note = <note>
endscript

script handle_finger_event 
	Obj_GetID
	0x0666218b id = <objID>
	hero_play_chord chord = <chord>
endscript

script handle_missed_note 
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	if ($<info_struct>.playing_missed_note = FALSE)
		Change structurename = <info_struct> playing_missed_note = true
		strum_anims = $bad_strums
		anim_length = ($<info_struct>.last_strum_length)
		strum_anim = (<strum_anims>.<anim_length> [0])
		hero_play_strum_anim anim = <strum_anim> BlendDuration = 0.1
	endif
endscript

script handle_hit_note 
	Obj_GetID
	handle_hit_note_CFunc
endscript

script handle_change_stance \{speed = 1.0}
	Obj_GetID
	0x0666218b id = <objID>
	ExtendCrc <objID> '_Info' out = info_struct
	display_debug_info = FALSE
	if (should_display_debug_info)
		display_debug_info = true
	endif
	if GotParam \{no_wait}
		anim_set = ($<info_struct>.anim_set)
		old_stance = ($<info_struct>.stance)
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <old_stance> new_stance = <stance>
			hero_play_anim anim = <anim_to_run> speed = <speed>
			hero_wait_until_anim_finished
		else
		endif
		Change structurename = <info_struct> stance = <stance>
		Change structurename = <info_struct> next_stance = <stance>
		if (<display_debug_info> = true)

		endif
		if (<objID> = GUITARIST || <objID> = BASSIST || <objID> = rhythm)
			if (<stance> = Intro || <stance> = intro_smStg || <stance> = stance_frontend || <stance> = stance_frontend_guitar)
				Change structurename = <info_struct> disable_arms = 2
				Change structurename = <info_struct> next_anim_disable_arms = 2
			else
				Change structurename = <info_struct> disable_arms = 0
				Change structurename = <info_struct> next_anim_disable_arms = 0
			endif
			Obj_SwitchScript \{guitarist_idle}
		else
			Obj_SwitchScript \{bandmember_idle}
		endif
	else
		if (<display_debug_info> = true)

		endif
		Change structurename = <info_struct> next_stance = <stance>
		if (<objID> = GUITARIST || <objID> = BASSIST || <objID> = rhythm)
			if (<stance> = Intro || <stance> = intro_smStg || <stance> = stance_frontend || <stance> = stance_frontend_guitar)
				Change structurename = <info_struct> next_anim_disable_arms = 2
			else
				Change structurename = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
	return
endscript

script queue_change_stance 
	Obj_GetID
	ExtendCrc <objID> '_Info' out = info_struct
	Change structurename = <info_struct> next_stance = <stance>
endscript

script handle_play_anim 
	Obj_GetID
	0x0666218b id = <objID>
	ExtendCrc <objID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	display_debug_info = FALSE
	if (should_display_debug_info)
		display_debug_info = true
	endif
	if GotParam \{no_wait}
		if (<display_debug_info> = true)

		endif
		Change structurename = <info_struct> current_anim = <anim>
		Change structurename = <info_struct> next_anim = None
		if GotParam \{repeat_count}
			Change structurename = <info_struct> anim_repeat_count = <repeat_count>
		else
			Change structurename = <info_struct> anim_repeat_count = 1
		endif
		if GotParam \{cycle}
			Change structurename = <info_struct> cycle_anim = true
		else
			Change structurename = <info_struct> cycle_anim = FALSE
		endif
		if (<Name> = GUITARIST || <Name> = BASSIST || <objID> = rhythm)
			if GotParam \{disable_auto_arms}
				Change structurename = <info_struct> disable_arms = 2
			elseif GotParam \{disable_auto_strum}
				Change structurename = <info_struct> disable_arms = 1
			else
				Change structurename = <info_struct> disable_arms = 0
			endif
		endif
		Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
		Obj_SpawnScriptNow hero_play_adjusting_random_anims params = {anim = <anim>}
	else
		if (<display_debug_info> = true)
			if (<info_struct>.next_anim != None)

			else

			endif
		endif
		Change structurename = <info_struct> next_anim = <anim>
		if GotParam \{repeat_count}
			Change structurename = <info_struct> next_anim_repeat_count = <repeat_count>
		else
			Change structurename = <info_struct> next_anim_repeat_count = 1
		endif
		if GotParam \{cycle}
			Change structurename = <info_struct> cycle_next_anim = true
		else
			Change structurename = <info_struct> cycle_next_anim = FALSE
		endif
		if (<Name> = GUITARIST || <Name> = BASSIST || <objID> = rhythm)
			if GotParam \{disable_auto_arms}
				Change structurename = <info_struct> next_anim_disable_arms = 2
			elseif GotParam \{disable_auto_strum}
				Change structurename = <info_struct> next_anim_disable_arms = 1
			else
				Change structurename = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
endscript

script handle_walking 
	Obj_GetID
	if (<objID> != <Name>)
		return
	endif
	0x0666218b id = <objID>
	ExtendCrc <objID> '_Info' out = info_struct
	if ($<info_struct>.allow_movement != true)
		return
	endif
	if NOT ($<info_struct>.stance = Stance_A)
		anim_set = ($<info_struct>.anim_set)
		old_stance = ($<info_struct>.stance)
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <old_stance> new_stance = Stance_A
			hero_play_anim anim = <anim_to_run>
			hero_wait_until_anim_finished
		endif
		Change structurename = <info_struct> stance = Stance_A
	endif
	Change structurename = <info_struct> disable_arms = 0
	Obj_SwitchScript guitarist_walking params = {<...>}
endscript

script play_drum_anim \{arm = left
		BlendDuration = $drum_blend_time}
	if NOT GotParam \{anim}
		return
	endif
	if (<arm> = left)
		Obj_KillSpawnedScript \{Name = play_drummer_left_arm_anim}
		Obj_SpawnScriptNow play_drummer_left_arm_anim params = {anim = <anim> BlendDuration = <BlendDuration>}
	else
		Obj_KillSpawnedScript \{Name = play_drummer_right_arm_anim}
		Obj_SpawnScriptNow play_drummer_right_arm_anim params = {anim = <anim>}
	endif
endscript

script delay_play_drummer_left_arm_anim 
	if ($display_drummer_anim_info = true)
	endif
	Wait <delay> Seconds
	Obj_KillSpawnedScript \{Name = play_drummer_left_arm_anim}
	Obj_SpawnScriptNow play_drummer_left_arm_anim params = {anim = <anim> BlendDuration = <BlendDuration>}
endscript

script play_drummer_left_arm_anim 
	hero_play_anim Tree = $hero_drumming_branch timerId = leftarm_timer target = DrummerLeftArm anim = <anim> BlendDuration = <BlendDuration>
	hero_wait_until_anim_finished \{Timer = leftarm_timer}
	Wait \{$drummer_arm_blend_out_delay
		Seconds}
	Wait \{$drummer_clear_arm_twist_value_delay
		Seconds}
	Change \{structurename = drummer_info
		last_left_arm_note = 0}
endscript

script delay_play_drummer_right_arm_anim 
	if ($display_drummer_anim_info = true)

	endif
	Wait <delay> Seconds
	Obj_KillSpawnedScript \{Name = play_drummer_right_arm_anim}
	Obj_SpawnScriptNow play_drummer_right_arm_anim params = {anim = <anim> BlendDuration = <BlendDuration>}
endscript

script play_drummer_right_arm_anim 
	hero_play_anim Tree = $hero_drumming_branch timerId = rightarm_timer target = DrummerRightArm anim = <anim> BlendDuration = <BlendDuration>
	hero_wait_until_anim_finished \{Timer = rightarm_timer}
	Wait \{$drummer_arm_blend_out_delay
		Seconds}
	Wait \{$drummer_clear_arm_twist_value_delay
		Seconds}
	Change \{structurename = drummer_info
		last_right_arm_note = 0}
endscript
