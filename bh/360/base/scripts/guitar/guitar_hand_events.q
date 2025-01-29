guitar_hand_event_time_offset = -100

script WatchForStartPlaying_iterator 
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= 0)
		wait_for_next_even_frame
		wait \{1
			gameframe}
		BandManager_EndIntroAnims
		BandManager_StartAllFacialAnims
		spawnscriptnow \{Crowd_AllPlayAnim
			params = {
				anim = Idle
			}}
		wait \{1
			gameframe}
		musician1 :anim_updatepose
		musician2 :anim_updatepose
		wait \{1
			gameframe}
		musician3 :anim_updatepose
		musician4 :anim_updatepose
		unhide_band
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script Drumkit_anim_iterator 
	if ($test_four_guitarists = true || $test_four_vocalists = true)
		return
	endif
	ExtendCrc <id> '_Info' out = info_struct
	get_song_prefix song = <song_name>
	FormatText checksumname = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists name = <event_array> type = array
		printf \{qs(0x85088784)}
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	array_size = (<array_size> / 2)
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
		array_size = (<array_size> - (<array_entry> / 2))
		if (<array_size> = 0)
			return
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			break
		endif
		wait \{1
			gameframe}
		repeat
		TimeMarkerReached_ClearParams
		<playing> = true
		if CompositeObjectExists name = <id>
			if (<playing> = true)
				DecompressNoteValue note_value = ($<event_array> [(<array_entry> + 1)])
				if (<note> >= 73 && <note> <= 82)
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
	endif
endscript

script drumkit_input_playanim 
	if ($test_four_guitarists = true || $test_four_vocalists = true)
		return
	endif
endscript

script AE_DrumKit_play_hiHat 
endscript

script AE_DrumKit_play_Snare 
endscript

script AE_DrumKit_play_Crash1 
endscript

script AE_DrumKit_play_Crash2 
endscript

script AE_DrumKit_play_Tom1 
endscript

script AE_DrumKit_play_tom2 
endscript

script AE_DrumKit_play_Ride 
endscript

script AE_DrumKit_Stop_Crash1 
endscript

script AE_DrumKit_Stop_Crash2 
endscript

script Output_Camera_Sync_Warnings 
	GMan_SongTool_GetCurrentSong
	printf \{qs(0x1037ac58)}
	printf qs(0xc99410ae) a = <current_song>
	GMan_SongTool_GetCurrentSong
	get_song_prefix song = <current_song>
	FormatText checksumname = event_array '%s_cameras_notes' s = <song_prefix> AddToStringLookup = true
	Sync_Cameras_To_Performance song_name = <current_song> camera_array = <event_array> output_results = 1
endscript

script Print_Camera_Sync_Warning 
	if NOT GotParam \{output_results}
		return
	endif
	if (<output_results> = 1)
		TextOutput text = <warning>
	endif
	printf channel = camera_warnings <warning>
endscript

script Show_PlayClip_Time 
	if (<playclip_time_displayed> = 1)
		return
	endif
	if (<end_frame> = -1)
		FormatText TextName = warning qs(0x3e77c172) a = <next_anim_time>
	else
		length_in_frames = (<end_frame> - <start_frame>)
		FormatText TextName = warning qs(0xc191d5ab) a = <next_anim_time> b = <start_frame> c = <end_frame> d = <length_in_frames>
	endif
	Print_Camera_Sync_Warning <...>
	return \{playclip_time_displayed = 1}
endscript

script Show_Camera_Warnings_Found 
	if (<warnings> = 0)
		text = qs(0x383ac615)
		if (<output_results> = 1)
			TextOutput text = <text>
		endif
		printf channel = camera_warnings <text>
	endif
endscript

script Sync_Cameras_To_Performance \{output_results = 0}
	if NOT GotParam \{camera_array}
		return
	endif
	if NOT GlobalExists name = <camera_array> type = array
		return
	endif
	GetArraySize $<camera_array>
	if (<array_size> = 0)
		printf \{channel = clip
			qs(0xe6cf20ae)}
		return
	endif
	camera_array_size = <array_size>
	get_song_prefix song = <song_name>
	FormatText checksumname = anim_array '%s_performance' s = <song_prefix> AddToStringLookup = true
	if NOT GlobalExists name = <anim_array> type = array
		return
	endif
	GetArraySize $<anim_array>
	if (<array_size> = 0)
		printf \{channel = clip
			qs(0x7d03b8a6)}
		return
	endif
	anim_array_size = <array_size>
	camera_index = 0
	next_camera_time = 0
	anim_index = 0
	next_anim_time = 0
	last_end_frame_time = -1
	last_camera_adjusted_index = -1
	Print_Camera_Sync_Warning warning = qs(0x1f54751f) output_results = <output_results>
	warnings = 0
	threshold = $camera_snap_threshold
	begin
	start_frame = 0
	end_frame = -1
	playclip_time_displayed = 0
	begin
	if ((($<anim_array> [<anim_index>]).Scr) = Band_PlayClip)
		next_anim_time = (($<anim_array> [<anim_index>]).time)
		params = (($<anim_array> [<anim_index>]).params)
		clip = (<params>.clip)
		if StructureContains structure = <params> name = startframe
			start_frame = (<params>.startframe)
		endif
		if StructureContains structure = <params> name = endframe
			end_frame = (<params>.endframe)
		endif
		break
	endif
	anim_index = (<anim_index> + 1)
	if (<anim_index> = <anim_array_size>)
		Show_Camera_Warnings_Found output_results = <output_results> warnings = <warnings>
		return
	endif
	repeat
	saved_camera_index = <camera_index>
	begin
	next_camera_time = ($<camera_array> [<camera_index>])
	time_diff = (<next_anim_time> - <next_camera_time>)
	if (<time_diff> < 0)
		time_diff = (<time_diff> * -1)
	endif
	if (<time_diff> < <threshold>)
		if (<time_diff> = 0)
		else
			if (<camera_index> = <last_camera_adjusted_index>)
				Show_PlayClip_Time {
					output_results = <output_results>
					playclip_time_displayed = <playclip_time_displayed>
					start_frame = <start_frame>
					end_frame = <end_frame>
					next_anim_time = <next_anim_time>
				}
				FormatText \{TextName = warning
					qs(0x053d4951)}
				Print_Camera_Sync_Warning warning = <warning> output_results = <output_results>
				warnings = (<warnings> + 1)
			endif
			camera_time_difference = (<next_anim_time> - <next_camera_time>)
			SetArrayElement arrayName = <camera_array> GlobalArray index = <camera_index> newValue = <next_anim_time>
			DecompressNoteValue note_value = ($<camera_array> [(<camera_index> + 1)])
			length = (<length> - <camera_time_difference>)
			CompressNoteValue length = <length> note = <note> velocity = <velocity>
			SetArrayElement arrayName = <camera_array> GlobalArray index = (<camera_index> + 1) newValue = <note_value>
			last_camera_adjusted_index = <camera_index>
		endif
		break
	endif
	camera_index = (<camera_index> + 2)
	if (<camera_index> >= <camera_array_size>)
		Show_PlayClip_Time {
			output_results = <output_results>
			playclip_time_displayed = <playclip_time_displayed>
			start_frame = <start_frame>
			end_frame = <end_frame>
			next_anim_time = <next_anim_time>
		}
		FormatText TextName = warning qs(0x68233f30) a = <threshold>
		Print_Camera_Sync_Warning warning = <warning> output_results = <output_results>
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
		next_camera_time = ($<camera_array> [<camera_index>])
		time_diff = (<end_time> - <next_camera_time>)
		if (<time_diff> < 0)
			time_diff = (<time_diff> * -1)
		endif
		if (<time_diff> < <threshold>)
			if (<time_diff> = 0)
			else
				camera_time_difference = (<end_time> - <next_camera_time>)
				SetArrayElement arrayName = <camera_array> GlobalArray index = <camera_index> newValue = <end_time>
				DecompressNoteValue note_value = ($<camera_array> [(<camera_index> + 1)])
				length = (<length> - <camera_time_difference>)
				CompressNoteValue length = <length> note = <note> velocity = <velocity>
				SetArrayElement arrayName = <camera_array> GlobalArray index = (<camera_index> + 1) newValue = <note_value>
				last_camera_adjusted_index = <camera_index>
			endif
			break
		endif
		camera_index = (<camera_index> + 2)
		if (<camera_index> >= <camera_array_size>)
			Show_PlayClip_Time {
				output_results = <output_results>
				playclip_time_displayed = <playclip_time_displayed>
				start_frame = <start_frame>
				end_frame = <end_frame>
				next_anim_time = <next_anim_time>
			}
			FormatText TextName = warning qs(0x41e5dd6f) a = <threshold>
			Print_Camera_Sync_Warning warning = <warning> output_results = <output_results>
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
		Show_Camera_Warnings_Found output_results = <output_results> warnings = <warnings>
		return
	endif
	repeat
endscript

script check_for_short_anims_in_clip 
	if NOT GlobalExists name = <clip> type = structure
		return
	endif
	if NOT StructureContains structure = $<clip> name = Anims
		return
	endif
	found_problem = false
	check_anim_length clip = <clip> name = Guitarist endtime = <endtime> <...>
	check_anim_length clip = <clip> name = Bassist endtime = <endtime> <...>
	check_anim_length clip = <clip> name = Vocalist endtime = <endtime> <...>
	check_anim_length clip = <clip> name = Drummer endtime = <endtime> <...>
	if (<found_problem> = true)
		return \{true}
	endif
	return \{false}
endscript

script check_anim_length 
	if StructureContains structure = ($<clip>.Anims) name = <name>
		anim = ($<clip>.Anims.<name>)
		if Anim_AnimExists anim = <anim>
			Anim_GetAnimLength anim = <anim>
			if (<length> < <endtime>)
				Show_PlayClip_Time {
					output_results = <output_results>
					playclip_time_displayed = <playclip_time_displayed>
					start_frame = <start_frame>
					end_frame = <end_frame>
					next_anim_time = <next_anim_time>
				}
				FormatText TextName = warning qs(0xd2acb46c) a = <anim> b = <length> c = <endtime>
				Print_Camera_Sync_Warning warning = <warning> output_results = <output_results>
				found_problem = true
			endif
		endif
	endif
	return found_problem = <found_problem>
endscript
use_guitar_strum_script = true
Short_Strum = 800
Short_Pick = 666
Init_Blend_Curve = [
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
Idle_Blend_curve = [
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
	Obj_KillSpawnedScript \{name = fire_off_Idle}
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
	<objID> :GetTags LastBasePose
	<objID> :GetTags LastType
	<objID> :GetTags LastNoteValue
	switch (<color_combo>)
		case green
		type = pick
		newbaseanim = 'Strum_String_1'
		noteValue = 1
		case red
		type = pick
		newbaseanim = 'Strum_String_2'
		noteValue = 2
		case yellow
		type = pick
		newbaseanim = 'Strum_String_3'
		noteValue = 3
		case blue
		type = pick
		newbaseanim = 'Strum_String_4'
		noteValue = 4
		case orange
		type = pick
		newbaseanim = 'Strum_String_5'
		noteValue = 5
		default
		type = Strum
	endswitch
	if (<type> = pick)
		if (<time_to_next_note> < $Short_Pick)
			if (<LastNoteValue> > <noteValue>)
				type = upPick
			elseif (<LastNoteValue> = <noteValue>)
				if (<LastType> = pick)
					type = upPick
				endif
			endif
		endif
	else
		if (<time_to_next_note> < $Short_Strum)
			if (<LastNoteValue> > 4)
				type = upstrum
			endif
		endif
	endif
	switch <type>
		case pick
		Init_Length = 1.0
		total_length = 1.7666659
		NewStrumanim = Random (@ 'Pick1' @ 'Pick2' )
		case upPick
		Init_Length = 1.0
		total_length = 1.7666659
		NewStrumanim = Random (@ 'upPick1' @ 'upPick2' )
		case Strum
		Init_Length = 1.0
		total_length = 2.333333
		NewStrumanim = Random (@ 'Strum1' @ 'Strum2' )
		newbaseanim = 'Strum_String_1'
		noteValue = 6
		case upstrum
		Init_Length = 1.0
		total_length = 2.333333
		NewStrumanim = Random (@ 'UpStrum1' @ 'UpStrum2' )
		newbaseanim = 'Strum_String_5'
		noteValue = 0
		default
		Init_Length = 1.0
		total_length = 2.333333
		NewStrumanim = 'Blank'
		noteValue = 666
	endswitch
	switch <LastType>
		case pick
		Wait_For_Idle = 0.3
		Idle_Blend_Time = 0.7
		case upPick
		Wait_For_Idle = 0.3
		Idle_Blend_Time = 0.7
		case Strum
		Wait_For_Idle = 0.8
		Idle_Blend_Time = 0.7
		case upstrum
		Wait_For_Idle = 0.8
		Idle_Blend_Time = 0.7
		default
		Wait_For_Idle = 0.0
		Idle_Blend_Time = 0.0
	endswitch
	if ((<time_to_next_note> / 1000.0) > <Init_Length>)
		startanim = 0.0
		blend = (<Init_Length> * 0.8)
		waittime = ((<time_to_next_note> / 1000.0) - <Init_Length>)
	else
		blend = (<time_to_next_note> / 1000.0)
		startanim = ((1 - ((<time_to_next_note> / 1000.0) / <Init_Length>)) * (<Init_Length> / <total_length>))
		waittime = 0.0
	endif
	if (<Wait_For_Idle> < <waittime>)
		wait <Wait_For_Idle> seconds
		Obj_SpawnScriptNow fire_off_Idle params = {Idletype = rest waittime = <Wait_For_Idle> LastBasePose = <LastBasePose> blend = <Idle_Blend_Time> gender = <gender> strumtype = <strumtype>}
		waittime = (<waittime> - <Wait_For_Idle>)
	endif
	wait <waittime> seconds
	FormatText checksumname = Baseanim '%a_%b_%c' a = <gender> b = <strumtype> c = <newbaseanim>
	FormatText checksumname = Strumanim '%a_%b_%c' a = <gender> b = <strumtype> c = <NewStrumanim>
	Anim_Command target = Dynamic_strums Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blend>
		blendcurve = $Init_Blend_Curve
		Tree = $Dynamic_Strum_Branch
		params = {
			startanim = <startanim>
			Baseanim = <Baseanim>
			Strumanim = <Strumanim>
		}
	}
	<objID> :SetTags LastBasePose = <newbaseanim>
	<objID> :SetTags LastType = <type>
	<objID> :SetTags LastNoteValue = <noteValue>
endscript

script fire_off_Idle 
	if (<Idletype> = rest)
		Idle = 'Strum_Idle_Rest'
	endif
	GetRandomFloat \{a = 0.0
		b = 1.0}
	startanim = <random_float>
	FormatText checksumname = Strumanim '%a_%b_%c' a = <gender> b = <strumtype> c = <Idle>
	FormatText checksumname = Baseanim '%a_%b_%c' a = <gender> b = <strumtype> c = <LastBasePose>
	Anim_Command target = Dynamic_strums Command = DegenerateBlend_AddBranch params = {
		BlendDuration = <blend>
		blendcurve = $Idle_Blend_curve
		Tree = $Dynamic_Strum_Idle_Branch
		params = {
			startanim = <startanim>
			Baseanim = <Baseanim>
			Strumanim = <Strumanim>
		}
	}
endscript
