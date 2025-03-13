drums_autonotemapping = [
	{
		midinote = 108
		scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_sticks_tiny
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		midinote = 109
		scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_sticks_normal
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		midinote = 110
		scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_sticks_huge
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		midinote = 111
		scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_hhpedal
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		midinote = 112
		scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_hhclosed
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		midinote = 113
		scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_hhopen
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		midinote = 70
		scr = countoff_notemap
		params = {
		}
	}
]
crowd_autonotemapping = [
	{
		midinote = 82
		scr = audio_crowd_event_listener
		params = {
			event_type = 1
		}
	}
	{
		midinote = 83
		scr = audio_crowd_event_listener
		params = {
			event_type = 2
		}
	}
	{
		midinote = 84
		scr = audio_crowd_event_listener
		params = {
			event_type = 3
		}
	}
	{
		midinote = 85
		scr = audio_crowd_event_listener
		params = {
			event_type = 4
		}
	}
	{
		midinote = 86
		scr = audio_crowd_event_listener
		params = {
			event_type = 5
		}
	}
	{
		midinote = 87
		scr = audio_crowd_event_listener
		params = {
			event_type = 6
		}
	}
	{
		midinote = 88
		scr = audio_crowd_event_listener
		params = {
			event_type = 7
		}
	}
	{
		midinote = 89
		scr = audio_crowd_event_listener
		params = {
			event_type = 8
		}
	}
	{
		midinote = 90
		scr = band_performancecrowdreaction
		params = {
			positive
		}
	}
	{
		midinote = 91
		scr = trigger_performancecrowdreaction
		params = {
			part = guitar
			negative
		}
	}
	{
		midinote = 92
		scr = trigger_performancecrowdreaction
		params = {
			part = bass
			negative
		}
	}
	{
		midinote = 93
		scr = trigger_performancecrowdreaction
		params = {
			part = drum
			negative
		}
	}
	{
		midinote = 94
		scr = audio_crowd_event_listener
		params = {
			event_type = 9
		}
	}
	{
		midinote = 95
		scr = audio_crowd_event_listener
		params = {
			event_type = 10
		}
	}
	{
		midinote = 96
		scr = audio_crowd_event_listener
		params = {
			event_type = 11
		}
	}
]
triggers_autonotemapping = [
	{
		midinote = 101
		scr = trigger_performancecrowdreaction
		params = {
			part = guitar
			positive
		}
	}
	{
		midinote = 102
		scr = trigger_performancecrowdreaction
		params = {
			part = guitar
			negative
		}
	}
	{
		midinote = 103
		scr = trigger_performancecrowdreaction
		params = {
			part = guitar
			positive
			negative
		}
	}
	{
		midinote = 104
		scr = trigger_performancecrowdreaction
		params = {
			part = bass
			positive
		}
	}
	{
		midinote = 105
		scr = trigger_performancecrowdreaction
		params = {
			part = bass
			negative
		}
	}
	{
		midinote = 106
		scr = trigger_performancecrowdreaction
		params = {
			part = bass
			positive
			negative
		}
	}
	{
		midinote = 107
		scr = trigger_performancecrowdreaction
		params = {
			part = drum
			positive
		}
	}
	{
		midinote = 108
		scr = trigger_performancecrowdreaction
		params = {
			part = drum
			negative
		}
	}
	{
		midinote = 109
		scr = trigger_performancecrowdreaction
		params = {
			part = drum
			positive
			negative
		}
	}
	{
		midinote = 110
		scr = band_performancecrowdreaction
		params = {
			positive
		}
	}
]

script notemap_dummy 
	printf \{qs(0xa9b4ece2)}
endscript

script countoff_notemap 
	printf \{channel = sfx
		qs(0x750207eb)}
	printstruct <...>
	spawnscriptnow audio_gameplay_countoff_logic params = {<...>}
endscript

script notemap_startiterator 
	formattext checksumname = global_notemapping '%s_AutoNoteMapping' s = <event_string>
	if NOT globalexists name = <global_notemapping> type = array
		return
	endif
	formattext checksumname = event_checksum '%s' s = <event_string>
	setnotemappings section = <event_checksum> mapping = $<global_notemapping>
	spawnscriptnow notemap_iterator params = {<...>}
endscript

script notemap_deinit 
	clearnotemappings \{section = all}
	killspawnedscript \{name = notemap_iterator}
	killspawnedscript \{name = notemap_startiterator}
endscript

script notemap_iterator 
	notemap_iterator_cfunc_setup
	begin
	if notemap_iterator_cfunc
		break
	endif
	repeat
	notemap_iterator_cfunc_cleanup
endscript

script band_performancecrowdreaction 
	if NOT ($game_mode = practice)
		error = 0
		trigger_performancecrowdreactionget <...> part = drum
		notes_hitd = <notes_hit>
		total_notesd = <total_notes>
		playerd = <player>
		trigger_performancecrowdreactionget <...> part = bass
		notes_hitr = <notes_hit>
		total_notesr = <total_notes>
		playerr = <player>
		trigger_performancecrowdreactionget <...> part = guitar
		if (<error> = 1)
			return
		endif
		getsongtimems
		target = (<time> + <length>)
		begin
		wait \{1
			gameframe}
		getsongtimems
		if (<time> >= <target>)
			break
		endif
		repeat
		getplayerinfo <player> notes_hit out = player_notes_hit
		getplayerinfo <player> total_notes out = player_total_notes
		notes_hit_count = (<notes_hit> - <player_notes_hit>)
		total_notes_count = (<total_notes> - <player_total_notes>)
		if (<notes_hit_count> = <total_notes_count>)
			if gotparam \{positive}
				trigger_positivecrowdreaction
			endif
		else
			if gotparam \{negative}
				trigger_negativecrowdreaction
			endif
		endif
		succeed = 0
		if trigger_performancecrowdreactioncheck notes_hit = <notes_hitd> total_notes = <total_notesd> player = <playerd>
			if trigger_performancecrowdreactioncheck notes_hit = <notes_hitr> total_notes = <total_notesr> player = <playerr>
				if trigger_performancecrowdreactioncheck notes_hit = <notes_hit> total_notes = <total_notes> player = <player>
					succeed = 1
				endif
			endif
		endif
		if (<succeed> = 1)
			if gotparam \{positive}
				trigger_positivecrowdreaction
			endif
		else
			if gotparam \{negative}
				trigger_negativecrowdreaction
			endif
		endif
	endif
endscript

script trigger_performancecrowdreactionget 
	error = 1
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part out = player_part
		if (<player_part> = <part>)
			<error> = 0
			break
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	if (<error> = 1)
		return \{error = 1}
	endif
	getplayerinfo <player> notes_hit
	getplayerinfo <player> total_notes
	return notes_hit = <notes_hit> total_notes = <total_notes> player = <player>
endscript

script trigger_performancecrowdreactioncheck 
	getplayerinfo <player> notes_hit out = notes_hit_count
	getplayerinfo <player> total_notes out = total_notes_count
	if (<notes_hit_count> = <total_notes_count>)
		return \{true}
	else
		return \{false}
	endif
endscript

script trigger_performancecrowdreaction 
	error = 0
	trigger_performancecrowdreactionget <...>
	if (<error> = 1)
		return
	endif
	getsongtimems
	target = (<time> + <length>)
	begin
	wait \{1
		gameframe}
	getsongtimems
	if (<time> >= <target>)
		break
	endif
	repeat
	if trigger_performancecrowdreactioncheck <...>
		if gotparam \{positive}
			trigger_positivecrowdreaction
		endif
	else
		if gotparam \{negative}
			trigger_negativecrowdreaction
		endif
	endif
endscript

script trigger_positivecrowdreaction 
	getpakmancurrent \{map = zones}
	appendsuffixtochecksum base = <pak> suffixstring = '_sfx_Crowd_Middle_Left'
	middleleftobjectname = <appended_id>
	appendsuffixtochecksum base = <pak> suffixstring = '_sfx_Crowd_Middle_Right'
	middlerightobjectname = <appended_id>
	switch <pak>
		case z_metalfest
		if compositeobjectexists name = <middleleftobjectname>
			soundevent event = lg_ext_crowd_trigger_short_positive_l object = <middleleftobjectname>
		endif
		if compositeobjectexists name = <middlerightobjectname>
			soundevent event = lg_ext_crowd_trigger_short_positive_r object = <middlerightobjectname>
		endif
		default
		soundevent \{event = medium_crowd_swell}
	endswitch
	soundevent \{event = large_ext_crowd_positive_swell_layer}
endscript

script trigger_negativecrowdreaction 
endscript
