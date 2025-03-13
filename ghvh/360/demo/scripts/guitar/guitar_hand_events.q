guitar_hand_event_time_offset = -100

script strum_iterator \{song_name = qs(0x7b277b30)
		difficulty = qs(0xe50976de)
		array_type = qs(0x13e59f9f)
		part = ''}
	if NOT gotparam \{target}
		printf \{qs(0x624b4bef)}
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
	note_value = ($<song> [(<array_entry> + 1)])
	note_length = (<note_value> && 65535)
	if (<note_length> > 0)
		launchevent type = strum_guitar target = <target> data = {note_length = <note_length>}
	endif
	<array_entry> = (<array_entry> + $num_song_columns)
	repeat <song_array_size>
endscript

script fretpos_iterator 
	if NOT gotparam \{target}
		printf \{qs(0xaa5a03bd)}
		return
	endif
	if ($disable_band = 1)
		return
	endif
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_anim_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		printf \{qs(0x85088784)}
		return
	endif
	array_entry = 0
	getarraysize $<event_array>
	array_size = (<array_size> / 2)
	getsongtimems time_offset = <time_offset>
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
		decompressnotevalue note_value = ($<event_array> [(<array_entry> + 1)])
		if compositeobjectexists name = <target>
			if (<part> = guitar)
				if ((<note> >= 118) && (<note> <= 127))
					launchevent type = pose_fret target = <target> data = {note = <note> note_length = <length>}
				endif
			else
				if ((<note> >= 101) && (<note> <= 110))
					launchevent type = pose_fret target = <target> data = {note = <note> note_length = <length>}
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
	begin
	getsongtimems time_offset = <time_offset>
	if (<time> >= 0)
		wait \{1
			gameframe}
		bandmanager_endintroanims
		bandmanager_startallfacialanims
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script faceoff_anim_iterator \{song_name = qs(0x7b277b30)
		difficulty = qs(0xe50976de)
		array_type = qs(0x13e59f9f)
		part = ''}
	if NOT gotparam \{player}
		printf \{qs(0xe010aef4)}
		return
	endif
	get_song_prefix song = <song_name>
	get_notetrack_part_text player_status = <player_status> song_name = <song_name>
	formattext checksumname = event_array '%s_%ifaceoff%p' s = <song_prefix> i = <part> p = <player_text> addtostringlookup
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
	if ($player1_status.part = vocals)
		is_singing = true
	else
		is_singing = false
	endif
	target = ($<player_status>.band_member)
	extendcrc <target> '_Info' out = info_struct
	change structurename = <info_struct> playing = false
	begin
	begin
	getsongtimems time_offset = <time_offset>
	if (<time> >= $<event_array> [<array_entry>] [0])
		break
	endif
	wait \{1
		gameframe}
	repeat
	change structurename = <info_struct> playing = true
	if (<is_singing> = true)
	else
		band_changefacialanims name = <target> ff_anims = facial_anims_female_rocker_rocking mf_anims = facial_anims_male_rocker_rocking
	endif
	play_time = ($<event_array> [<array_entry>] [1])
	stop_playing_time = (($<event_array> [<array_entry>] [0]) + ($<event_array> [<array_entry>] [1]))
	begin
	getsongtimems time_offset = <time_offset>
	if (<time> >= <stop_playing_time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change structurename = <info_struct> playing = false
	if (<is_singing> = true)
	else
		band_changefacialanims name = <target> ff_anims = facial_anims_female_rocker mf_anims = facial_anims_male_rocker
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script drumkit_anim_iterator 
	<id> :anim_command target = drumkit command = applydrumkitdifference_prepareanims params = {anims = [
			gh_drum_tom_1
			gh_drum_tom_2
			gh_drum_snare
			gh_drum_cymbal_1
			gh_drum_cymbal_2
			gh_drum_cymbal_3
			gh_drum_cymbal_4
			gh_drum_kick
			gh_drum_cymbal_hh_open
			gh_drum_cymbal_hh_closed
		] hold_list = [gh_drum_cymbal_hh_closed]}
	extendcrc <id> '_Info' out = info_struct
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_drums_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		printf \{qs(0x85088784)}
		return
	endif
	if is_current_band_vanhalen
		getarraysize \{$drumkit_snare_ignore_songs}
		index = 0
		if (<array_size> > 0)
			begin
			if ($current_song = $drumkit_snare_ignore_songs [<index>])
				no_snare_for_drum_kit = 1
				break
			endif
			index = (<index> + 1)
			repeat <array_size>
		endif
	endif
	low_note = 73
	high_note = 85
	if is_vanhalen_song
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
			low_note = 90
			high_note = 99
		endif
	endif
	array_entry = 0
	getarraysize $<event_array>
	array_size = (<array_size> / 2)
	getsongtimems time_offset = <time_offset>
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
		if ($game_mode = p2_faceoff)
			<playing> = (($<info_struct>).playing)
		else
			<playing> = true
		endif
		if compositeobjectexists name = <id>
			if (<playing> = true)
				decompressnotevalue note_value = ($<event_array> [(<array_entry> + 1)])
				if (<note> >= <low_note> && <note> <= <high_note>)
					switch (<note>)
						case 90
						case 73
						<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [0]) blend_period = $drum_kit_blend_time}
						case 92
						case 75
						<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [2]) blend_period = $drum_kit_blend_time}
						case 93
						case 76
						<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [3]) blend_period = $drum_kit_blend_time}
						case 94
						case 77
						if NOT gotparam \{no_snare_for_drum_kit}
							<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [4]) blend_period = $drum_kit_blend_time}
						endif
						case 95
						case 78
						<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [5]) blend_period = $drum_kit_blend_time}
						case 96
						case 79
						<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [6]) blend_period = $drum_kit_blend_time}
						case 97
						case 80
						<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [7]) blend_period = $drum_kit_blend_time}
						case 98
						case 81
						<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [8]) blend_period = $drum_kit_blend_time}
						case 99
						case 82
						<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [9]) blend_period = $drum_kit_blend_time}
						case 84
						<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [12]) blend_period = $drum_kit_blend_time}
						case 85
						if is_current_band_vanhalen
							<id> :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [13]) blend_period = $drum_kit_blend_time}
						endif
					endswitch
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
	endif
endscript
drumkit_snare_ignore_songs = [
]

script drumkit_input_playanim 
	printf qs(0xd41a849a) i = <drum_index>
	if is_current_band_vanhalen
		if (<drum_index> = 1)
			return
		endif
	endif
	switch <drum_index>
		case 0
		anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [2]) blend_period = $drum_kit_blend_time}
		case 1
		anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [4]) blend_period = $drum_kit_blend_time}
		case 2
		anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [6]) blend_period = $drum_kit_blend_time}
		case 3
		anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [3]) blend_period = $drum_kit_blend_time}
		case 4
		anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [9]) blend_period = $drum_kit_blend_time}
	endswitch
endscript

script ae_drumkit_play_hihat 
	drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [5]) blend_period = $drum_kit_blend_time}
endscript

script ae_drumkit_play_snare 
	drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [4]) blend_period = $drum_kit_blend_time}
endscript

script ae_drumkit_play_crash1 
	drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [8]) blend_period = $drum_kit_blend_time}
endscript

script ae_drumkit_play_crash2 
	drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [9]) blend_period = $drum_kit_blend_time}
endscript

script ae_drumkit_play_tom1 
	drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [3]) blend_period = $drum_kit_blend_time}
endscript

script ae_drumkit_play_tom2 
	drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [2]) blend_period = $drum_kit_blend_time}
endscript

script ae_drumkit_play_ride 
	drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [7]) blend_period = $drum_kit_blend_time}
endscript

script ae_drumkit_stop_crash1 
	drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [10]) blend_period = $drum_kit_blend_time}
endscript

script ae_drumkit_stop_crash2 
	drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [11]) blend_period = $drum_kit_blend_time}
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
	if ((<note> >= 109) && (<note> <= 127))
		anim = ($<fret_anims>.<track>)
	elseif ((<note> >= 85) && (<note> <= 103))
		anim = ($<fret_anims>.<track>)
	else
		return
	endif
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
			printf channel = animinfo qs(0x260a7380) a = <objid> b = <stance>
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
			printf channel = animinfo qs(0x508e8bf5) a = <objid> b = <stance>
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

script handle_play_anim \{blend_time = 0.2}
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
			printf channel = animinfo qs(0x01d2a3d5) a = <objid> b = <anim>
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
		ragdoll_markforreset
		obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
		obj_spawnscriptnow hero_play_adjusting_random_anims params = {anim = <anim> blend_time = <blend_time>}
	else
		if (<display_debug_info> = true)
			if (<info_struct>.next_anim != none)
				printf channel = animinfo qs(0x35476340) a = <objid> b = (<info_struct>.next_anim) c = <anim>
			else
				printf channel = animinfo qs(0x54c8d8ad) a = <objid> b = <anim>
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

script output_camera_sync_warnings 
	printf \{qs(0x1037ac58)}
	printf \{qs(0xc99410ae)
		a = $current_song}
	get_song_prefix song = ($current_song)
	formattext checksumname = event_array '%s_cameras_notes' s = <song_prefix> addtostringlookup
	sync_cameras_to_performance song_name = ($current_song) camera_array = <event_array> output_results = 1
endscript

script print_camera_sync_warning 
	if NOT gotparam \{output_results}
		return
	endif
	if (<output_results> = 1)
		textoutput text = <warning>
	endif
	printf channel = camera_warnings <warning>
endscript

script show_playclip_time 
	if (<playclip_time_displayed> = 1)
		return
	endif
	if (<end_frame> = -1)
		formattext textname = warning qs(0x7ed36967) a = <next_anim_time>
	else
		length_in_frames = (<end_frame> - <start_frame>)
		formattext textname = warning qs(0x73ea14fe) a = <next_anim_time> b = <start_frame> c = <end_frame> d = <length_in_frames>
	endif
	print_camera_sync_warning <...>
	return \{playclip_time_displayed = 1}
endscript

script show_camera_warnings_found 
	if (<warnings> = 0)
		text = qs(0x383ac615)
		if (<output_results> = 1)
			textoutput text = <text>
		endif
		printf channel = camera_warnings <text>
	endif
endscript

script sync_cameras_to_performance_getstartindex 
	<i> = 0
	begin
	if (($<camera_array> [<i>]) > 0)
		return camera_index = <i>
	endif
	<i> = (<i> + 2)
	repeat
	return \{camera_index = 0}
endscript

script sync_cameras_to_performance \{output_results = 0}
	if NOT gotparam \{camera_array}
		return
	endif
	if NOT globalexists name = <camera_array> type = array
		return
	endif
	getarraysize $<camera_array>
	if (<array_size> < 2)
		printf \{channel = clip
			qs(0x11e689ed)}
		return
	endif
	camera_array_size = <array_size>
	get_song_prefix song = <song_name>
	formattext checksumname = anim_array '%s_performance' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <anim_array> type = array
		return
	endif
	getarraysize $<anim_array>
	if (<array_size> = 0)
		printf \{channel = clip
			qs(0x7d03b8a6)}
		return
	endif
	anim_array_size = <array_size>
	sync_cameras_to_performance_getstartindex camera_array = <camera_array>
	next_camera_time = ($<camera_array> [<camera_index>])
	anim_index = 0
	next_anim_time = 0
	last_end_frame_time = -1
	last_camera_adjusted_index = -1
	print_camera_sync_warning warning = qs(0x1f54751f) output_results = <output_results>
	warnings = 0
	threshold = $camera_snap_threshold
	begin
	start_frame = 0
	end_frame = -1
	playclip_time_displayed = 0
	begin
	if ((($<anim_array> [<anim_index>]).scr) = band_playclip)
		next_anim_time = (($<anim_array> [<anim_index>]).time)
		params = (($<anim_array> [<anim_index>]).params)
		clip = (<params>.clip)
		if structurecontains structure = <params> name = startframe
			start_frame = (<params>.startframe)
		endif
		if structurecontains structure = <params> name = endframe
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
	next_camera_time = ($<camera_array> [<camera_index>])
	time_diff = (<next_anim_time> - <next_camera_time>)
	if (<time_diff> < 0)
		time_diff = (<time_diff> * -1)
	endif
	if (<time_diff> < <threshold>)
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
				formattext \{textname = warning
					qs(0x053d4951)}
				print_camera_sync_warning warning = <warning> output_results = <output_results>
				warnings = (<warnings> + 1)
			endif
			camera_time_difference = (<next_anim_time> - <next_camera_time>)
			setarrayelement arrayname = <camera_array> globalarray index = <camera_index> newvalue = <next_anim_time>
			decompressnotevalue note_value = ($<camera_array> [(<camera_index> + 1)])
			length = (<length> - <camera_time_difference>)
			compressnotevalue length = <length> note = <note> velocity = <velocity>
			setarrayelement arrayname = <camera_array> globalarray index = (<camera_index> + 1) newvalue = <note_value>
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
		formattext textname = warning qs(0x68233f30) a = <threshold>
		print_camera_sync_warning warning = <warning> output_results = <output_results>
		warnings = (<warnings> + 1)
		break
	endif
	repeat
	camera_index = <saved_camera_index>
	if (<end_frame> != -1)
		length_in_frames = (<end_frame> - <start_frame>)
		length_in_ms = ((<length_in_frames> / 30.0) * 1000)
		casttointeger \{length_in_ms}
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
				setarrayelement arrayname = <camera_array> globalarray index = <camera_index> newvalue = <end_time>
				decompressnotevalue note_value = ($<camera_array> [(<camera_index> + 1)])
				length = (<length> - <camera_time_difference>)
				compressnotevalue length = <length> note = <note> velocity = <velocity>
				setarrayelement arrayname = <camera_array> globalarray index = (<camera_index> + 1) newvalue = <note_value>
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
			formattext textname = warning qs(0x41e5dd6f) a = <threshold>
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
	if NOT globalexists name = <clip> type = structure
		return
	endif
	if NOT structurecontains structure = $<clip> name = anims
		return
	endif
	found_problem = false
	check_anim_length clip = <clip> name = guitarist endtime = <endtime> <...>
	check_anim_length clip = <clip> name = bassist endtime = <endtime> <...>
	check_anim_length clip = <clip> name = vocalist endtime = <endtime> <...>
	check_anim_length clip = <clip> name = drummer endtime = <endtime> <...>
	if (<found_problem> = true)
		return \{true}
	endif
	return \{false}
endscript

script check_anim_length 
	if structurecontains structure = ($<clip>.anims) name = <name>
		anim = ($<clip>.anims.<name>)
		if anim_animexists anim = <anim>
			anim_getanimlength anim = <anim>
			if (<length> < <endtime>)
				show_playclip_time {
					output_results = <output_results>
					playclip_time_displayed = <playclip_time_displayed>
					start_frame = <start_frame>
					end_frame = <end_frame>
					next_anim_time = <next_anim_time>
				}
				formattext textname = warning qs(0xd2acb46c) a = <anim> b = <length> c = <endtime>
				print_camera_sync_warning warning = <warning> output_results = <output_results>
				found_problem = true
			endif
		endif
	endif
	return found_problem = <found_problem>
endscript
