guitar_hand_event_time_offset = -100

script WatchForStartPlaying_iterator 
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= 0)
		if ($poselog_vocalist = true)
			gamemode_gettype
			if (<Type> = quickplay)
				printf \{channel = AnimInfo
					qs(0xff78e4b1)}
				vocalist :Anim_Command \{target = vocalist_pose_node
					Command = poselog_startrecording}
			endif
		endif
		wait_for_next_even_frame
		Wait \{1
			gameframe}
		bandmanager_endintroanims
		bandmanager_startallfacialanims
		SpawnScriptNow \{Crowd_AllPlayAnim
			params = {
				anim = Idle
			}}
		Wait \{1
			gameframe}
		musician1 :Anim_UpdatePose
		musician2 :Anim_UpdatePose
		Wait \{1
			gameframe}
		musician3 :Anim_UpdatePose
		musician4 :Anim_UpdatePose
		Unhide_Band
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script end_song_after_transformation 
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= 0)
		GuitarEvent_SongWon
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drumkit_anim_iterator 
	if ($test_four_guitarists = true || $test_four_vocalists = true)
		return
	endif
	ExtendCrc <id> '_Info' out = info_struct
	get_song_prefix song = <song_name>
	formatText checksumName = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists Name = <event_array> Type = array
		printf \{qs(0x85088784)}
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	array_Size = (<array_Size> / 2)
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_Size>
		array_Size = (<array_Size> - (<array_entry> / 2))
		if (<array_Size> = 0)
			return
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		TimeMarkerReached_ClearParams
		<playing> = true
		if CompositeObjectExists Name = <id>
			if (<playing> = true)
				decompressnotevalue note_value = ($<event_array> [(<array_entry> + 1)])
				if (<note_value> >= 73 && <note_value> <= 82)
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_Size>
	endif
endscript

script drumkit_input_playanim 
	if ($test_four_guitarists = true || $test_four_vocalists = true)
		return
	endif
endscript

script ae_drumkit_play_hihat 
endscript

script ae_drumkit_play_snare 
endscript

script ae_drumkit_play_crash1 
endscript

script ae_drumkit_play_crash2 
endscript

script ae_drumkit_play_tom1 
endscript

script ae_drumkit_play_tom2 
endscript

script ae_drumkit_play_ride 
endscript

script ae_drumkit_stop_crash1 
endscript

script ae_drumkit_stop_crash2 
endscript

script output_camera_sync_warnings 
	playlist_getcurrentsong
	printf \{qs(0x1037ac58)}
	printf qs(0xc99410ae) a = <current_song>
	get_song_prefix song = <current_song>
	formatText checksumName = event_array '%s_cameras_notes' s = <song_prefix> AddToStringLookup = true
	sync_cameras_to_performance song_name = <current_song> Camera_Array = <event_array> output_results = 1
endscript

script print_camera_sync_warning 
	if NOT GotParam \{output_results}
		return
	endif
	if (<output_results> = 1)
		TextOutput text = <warning>
	endif
	printf channel = camera_warnings <warning>
endscript

script show_playclip_time 
	if (<playclip_time_displayed> = 1)
		return
	endif
	if (<end_frame> = -1)
		formatText TextName = warning qs(0x3e77c172) a = <next_anim_time>
	else
		length_in_frames = (<end_frame> - <start_frame>)
		formatText TextName = warning qs(0xc191d5ab) a = <next_anim_time> b = <start_frame> c = <end_frame> d = <length_in_frames>
	endif
	print_camera_sync_warning <...>
	return \{playclip_time_displayed = 1}
endscript

script show_camera_warnings_found 
	if (<warnings> = 0)
		text = qs(0x383ac615)
		if (<output_results> = 1)
			TextOutput text = <text>
		endif
		printf channel = camera_warnings <text>
	endif
endscript

script sync_cameras_to_performance \{output_results = 0}
	if NOT GotParam \{Camera_Array}
		return
	endif
	if NOT GlobalExists Name = <Camera_Array> Type = array
		return
	endif
	GetArraySize $<Camera_Array>
	if (<array_Size> = 0)
		printf \{channel = clip
			qs(0xe6cf20ae)}
		return
	endif
	camera_array_size = <array_Size>
	get_song_prefix song = <song_name>
	formatText checksumName = anim_array '%s_performance' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists Name = <anim_array> Type = array
		return
	endif
	GetArraySize $<anim_array>
	if (<array_Size> = 0)
		printf \{channel = clip
			qs(0x7d03b8a6)}
		return
	endif
	anim_array_size = <array_Size>
	camera_index = 0
	next_camera_time = 0
	anim_index = 0
	next_anim_time = 0
	last_end_frame_time = -1
	last_camera_adjusted_index = -1
	print_camera_sync_warning warning = qs(0x1f54751f) output_results = <output_results>
	warnings = 0
	THRESHOLD = $camera_snap_threshold
	begin
	start_frame = 0
	end_frame = -1
	playclip_time_displayed = 0
	begin
	if ((($<anim_array> [<anim_index>]).Scr) = band_playclip)
		next_anim_time = (($<anim_array> [<anim_index>]).time)
		params = (($<anim_array> [<anim_index>]).params)
		clip = (<params>.clip)
		if StructureContains structure = <params> Name = startframe
			start_frame = (<params>.startframe)
		endif
		if StructureContains structure = <params> Name = endframe
			end_frame = (<params>.endframe)
		endif
		break
	endif
	anim_index = (<anim_index> + 1)
	if (<anim_index> = <anim_array_size>)
		show_camera_warnings_found output_results = <output_results> warnings = <warnings>
		return
	endif
	repeat
	saved_camera_index = <camera_index>
	begin
	next_camera_time = ($<Camera_Array> [<camera_index>])
	time_diff = (<next_anim_time> - <next_camera_time>)
	if (<time_diff> < 0)
		time_diff = (<time_diff> * -1)
	endif
	if (<time_diff> < <THRESHOLD>)
		if (<time_diff> = 0)
		else
			if (<camera_index> = <last_camera_adjusted_index>)
				show_playclip_time {
					output_results = <output_results>
					playclip_time_displayed = <playclip_time_displayed>
					start_frame = <start_frame>
					end_frame = <end_frame>
					next_anim_time = <next_anim_time>
				}
				formatText \{TextName = warning
					qs(0x053d4951)}
				print_camera_sync_warning warning = <warning> output_results = <output_results>
				warnings = (<warnings> + 1)
			endif
			camera_time_difference = (<next_anim_time> - <next_camera_time>)
			SetArrayElement ArrayName = <Camera_Array> globalarray index = <camera_index> NewValue = <next_anim_time>
			decompressnotevalue note_value = ($<Camera_Array> [(<camera_index> + 1)])
			length = (<length> - <camera_time_difference>)
			compressnotevalue length = <length> note_value = <note_value> velocity = <velocity>
			SetArrayElement ArrayName = <Camera_Array> globalarray index = (<camera_index> + 1) NewValue = <note_value>
			last_camera_adjusted_index = <camera_index>
		endif
		break
	endif
	camera_index = (<camera_index> + 2)
	if (<camera_index> >= <camera_array_size>)
		show_playclip_time {
			output_results = <output_results>
			playclip_time_displayed = <playclip_time_displayed>
			start_frame = <start_frame>
			end_frame = <end_frame>
			next_anim_time = <next_anim_time>
		}
		formatText TextName = warning qs(0x68233f30) a = <THRESHOLD>
		print_camera_sync_warning warning = <warning> output_results = <output_results>
		warnings = (<warnings> + 1)
		break
	endif
	repeat
	camera_index = <saved_camera_index>
	if (<end_frame> != -1)
		length_in_frames = (<end_frame> - <start_frame>)
		length_in_ms = ((<length_in_frames> / 30.0) * 1000)
		CastToInteger \{length_in_ms}
		end_time = (<next_anim_time> + <length_in_ms>)
		if check_for_short_anims_in_clip clip = <clip> endtime = (<length_in_frames> / 30.0) <...>
			playclip_time_displayed = 1
			warnings = (<warnings> + 1)
		endif
		begin
		next_camera_time = ($<Camera_Array> [<camera_index>])
		time_diff = (<end_time> - <next_camera_time>)
		if (<time_diff> < 0)
			time_diff = (<time_diff> * -1)
		endif
		if (<time_diff> < <THRESHOLD>)
			if (<time_diff> = 0)
			else
				camera_time_difference = (<end_time> - <next_camera_time>)
				SetArrayElement ArrayName = <Camera_Array> globalarray index = <camera_index> NewValue = <end_time>
				decompressnotevalue note_value = ($<Camera_Array> [(<camera_index> + 1)])
				length = (<length> - <camera_time_difference>)
				compressnotevalue length = <length> note_value = <note_value> velocity = <velocity>
				SetArrayElement ArrayName = <Camera_Array> globalarray index = (<camera_index> + 1) NewValue = <note_value>
				last_camera_adjusted_index = <camera_index>
			endif
			break
		endif
		camera_index = (<camera_index> + 2)
		if (<camera_index> >= <camera_array_size>)
			show_playclip_time {
				output_results = <output_results>
				playclip_time_displayed = <playclip_time_displayed>
				start_frame = <start_frame>
				end_frame = <end_frame>
				next_anim_time = <next_anim_time>
			}
			formatText TextName = warning qs(0x41e5dd6f) a = <THRESHOLD>
			print_camera_sync_warning warning = <warning> output_results = <output_results>
			warnings = (<warnings> + 1)
			break
		endif
		repeat
		camera_index = <saved_camera_index>
	else
	endif
	camera_index = <saved_camera_index>
	anim_index = (<anim_index> + 1)
	if (<anim_index> = <anim_array_size>)
		show_camera_warnings_found output_results = <output_results> warnings = <warnings>
		return
	endif
	repeat
endscript

script check_for_short_anims_in_clip 
	if NOT GlobalExists Name = <clip> Type = structure
		return
	endif
	if NOT StructureContains structure = $<clip> Name = anims
		return
	endif
	found_problem = FALSE
	check_anim_length clip = <clip> Name = GUITARIST endtime = <endtime> <...>
	check_anim_length clip = <clip> Name = BASSIST endtime = <endtime> <...>
	check_anim_length clip = <clip> Name = vocalist endtime = <endtime> <...>
	check_anim_length clip = <clip> Name = drummer endtime = <endtime> <...>
	if (<found_problem> = true)
		return \{true}
	endif
	return \{FALSE}
endscript

script check_anim_length 
	if StructureContains structure = ($<clip>.anims) Name = <Name>
		anim = ($<clip>.anims.<Name>)
		if Anim_AnimExists anim = <anim>
			Anim_GetAnimLength anim = <anim>
			if (<length> < <endtime>)
				show_playclip_time {
					output_results = <output_results>
					playclip_time_displayed = <playclip_time_displayed>
					start_frame = <start_frame>
					end_frame = <end_frame>
					next_anim_time = <next_anim_time>
				}
				formatText TextName = warning qs(0xd2acb46c) a = <anim> b = <length> c = <endtime>
				print_camera_sync_warning warning = <warning> output_results = <output_results>
				found_problem = true
			endif
		endif
	endif
	return found_problem = <found_problem>
endscript
use_guitar_strum_script = true
short_strum = 800
short_pick = 666
init_blend_curve = [
	1.0
	0.9936329
	0.97541296
	0.94665694
	0.908686
	0.862818
	0.81037295
	0.75266796
	0.691025
	0.626761
	0.561195
	0.495648
	0.431438
	0.36988303
	0.312304
	0.260019
	0.214348
	0.176609
	0.14523199
	0.117623
	0.0935624
	0.072831795
	0.055212397
	0.0404852
	0.028431498
	0.0188325
	0.0114694005
	0.0061233295
	0.0025756303
	0.000607445
	0.0
]
idle_blend_curve = [
	1.0
	0.9916719
	0.967925
	0.9302049
	0.879517
	0.816499
	0.741457
	0.65434504
	0.557258
	0.472638
	0.401996
	0.342054
	0.290639
	0.246221
	0.20767501
	0.17414398
	0.144956
	0.119572
	0.0975515
	0.0785257
	0.062184203
	0.048259903
	0.0365202
	0.026759999
	0.0187951
	0.012458201
	0.0075944406
	0.0040576695
	0.0017067901
	0.000401919
	0.0
]

script handle_guitar_strum 
	Obj_KillSpawnedScript \{Name = fire_off_idle}
	Obj_GetID
	<objID> :GetSingleTag is_female
	<objID> :GetSingleTag large_hands
	<objID> :GetSingleTag lefty
	ExtendCrc <objID> '_Info' out = info_struct
	part = ($<info_struct>.part)
	if (<is_female> = 1)
		gender = 'GH_Female'
	elseif (<large_hands> = 1)
		gender = 'GH_Large'
	else
		gender = 'GH_Male'
	endif
	if (<part> = guitar)
		strumtype = 'G'
	elseif (<part> = bass)
		strumtype = 'B'
	else
		return
	endif
	if (<lefty> = 1)
		gender = 'GH_Male'
		strumtype = 'GL'
	endif
	<objID> :GetTags lastbasepose
	<objID> :GetTags lasttype
	<objID> :GetTags lastnotevalue
	switch (<color_combo>)
		case green
		Type = pick
		newbaseanim = 'Strum_String_1'
		notevalue = 1
		case red
		Type = pick
		newbaseanim = 'Strum_String_2'
		notevalue = 2
		case yellow
		Type = pick
		newbaseanim = 'Strum_String_3'
		notevalue = 3
		case blue
		Type = pick
		newbaseanim = 'Strum_String_4'
		notevalue = 4
		case orange
		Type = pick
		newbaseanim = 'Strum_String_5'
		notevalue = 5
		default
		Type = strum
	endswitch
	if (<Type> = pick)
		if (<time_to_next_note> < $short_pick)
			if (<lastnotevalue> > <notevalue>)
				Type = uppick
			elseif (<lastnotevalue> = <notevalue>)
				if (<lasttype> = pick)
					Type = uppick
				endif
			endif
		endif
	else
		if (<time_to_next_note> < $short_strum)
			if (<lastnotevalue> > 4)
				Type = upstrum
			endif
		endif
	endif
	switch <Type>
		case pick
		init_length = 1.0
		total_length = 1.7666659
		newstrumanim = Random (@ 'Pick1' @ 'Pick2' )
		case uppick
		init_length = 1.0
		total_length = 1.7666659
		newstrumanim = Random (@ 'upPick1' @ 'upPick2' )
		case strum
		init_length = 1.0
		total_length = 2.333333
		newstrumanim = Random (@ 'Strum1' @ 'Strum2' )
		newbaseanim = 'Strum_String_1'
		notevalue = 6
		case upstrum
		init_length = 1.0
		total_length = 2.333333
		newstrumanim = Random (@ 'UpStrum1' @ 'UpStrum2' )
		newbaseanim = 'Strum_String_5'
		notevalue = 0
		default
		init_length = 1.0
		total_length = 2.333333
		newstrumanim = 'Blank'
		notevalue = 666
	endswitch
	switch <lasttype>
		case pick
		wait_for_idle = 0.3
		idle_blend_time = 0.7
		case uppick
		wait_for_idle = 0.3
		idle_blend_time = 0.7
		case strum
		wait_for_idle = 0.8
		idle_blend_time = 0.7
		case upstrum
		wait_for_idle = 0.8
		idle_blend_time = 0.7
		default
		wait_for_idle = 0.0
		idle_blend_time = 0.0
	endswitch
	if ((<time_to_next_note> / 1000.0) > <init_length>)
		startanim = 0.0
		blend = (<init_length> * 0.8)
		waitTime = ((<time_to_next_note> / 1000.0) - <init_length>)
	else
		blend = (<time_to_next_note> / 1000.0)
		startanim = ((1 - ((<time_to_next_note> / 1000.0) / <init_length>)) * (<init_length> / <total_length>))
		waitTime = 0.0
	endif
	if (<wait_for_idle> < <waitTime>)
		Wait <wait_for_idle> Seconds
		Obj_SpawnScriptNow fire_off_idle params = {idletype = rest waitTime = <wait_for_idle> lastbasepose = <lastbasepose> blend = <idle_blend_time> gender = <gender> strumtype = <strumtype>}
		waitTime = (<waitTime> - <wait_for_idle>)
	endif
	Wait <waitTime> Seconds
	formatText checksumName = baseanim '%a_%b_%c' a = <gender> b = <strumtype> c = <newbaseanim>
	formatText checksumName = strumanim '%a_%b_%c' a = <gender> b = <strumtype> c = <newstrumanim>
	Anim_Command target = dynamic_strums Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blend>
		BlendCurve = $init_blend_curve
		Tree = $dynamic_strum_branch
		params = {
			startanim = <startanim>
			baseanim = <baseanim>
			strumanim = <strumanim>
		}
	}
	<objID> :SetTags lastbasepose = <newbaseanim>
	<objID> :SetTags lasttype = <Type>
	<objID> :SetTags lastnotevalue = <notevalue>
endscript

script fire_off_idle 
	if (<idletype> = rest)
		Idle = 'Strum_Idle_Rest'
	endif
	getrandomfloat \{a = 0.0
		b = 1.0}
	startanim = <random_float>
	formatText checksumName = strumanim '%a_%b_%c' a = <gender> b = <strumtype> c = <Idle>
	formatText checksumName = baseanim '%a_%b_%c' a = <gender> b = <strumtype> c = <lastbasepose>
	Anim_Command target = dynamic_strums Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blend>
		BlendCurve = $idle_blend_curve
		Tree = $dynamic_strum_idle_branch
		params = {
			startanim = <startanim>
			baseanim = <baseanim>
			strumanim = <strumanim>
		}
	}
endscript
