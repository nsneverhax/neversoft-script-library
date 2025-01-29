guitar_hand_event_time_offset = -100

script WatchForStartPlaying_iterator 
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= 0)
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
		if NOT quest_progression_check_for_demigod_playing
			Unhide_Band
		endif
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script end_song_after_transformation 
	GuitarEvent_SongWon
endscript

script drumkit_input_playanim 
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
	formatText checksumName = baseanim '%a_%b_%c' a = <gender> b = <strumtype> c = <newbaseanim> AddToStringLookup = true
	formatText checksumName = strumanim '%a_%b_%c' a = <gender> b = <strumtype> c = <newstrumanim> AddToStringLookup = true
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
