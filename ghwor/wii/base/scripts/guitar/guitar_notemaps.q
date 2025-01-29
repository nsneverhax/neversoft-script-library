Drums_AutoNoteMapping = [
	{
		MidiNote = 108
		Scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_sticks_tiny
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		MidiNote = 109
		Scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_sticks_normal
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		MidiNote = 110
		Scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_sticks_huge
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		MidiNote = 111
		Scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_hhpedal
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		MidiNote = 112
		Scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_hhclosed
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		MidiNote = 113
		Scr = audio_gameplay_practice_play_project_dependent_drum_sample
		params = {
			pad = countin
			sfxtype = countin_hhopen
			buss = drums_practicemode_cymbals_crash
		}
	}
	{
		MidiNote = 70
		Scr = Countoff_NoteMap
		params = {
		}
	}
]
Crowd_AutoNoteMapping = [
	{
		MidiNote = 82
		Scr = audio_crowd_event_listener
		params = {
			event_type = 1
		}
	}
	{
		MidiNote = 83
		Scr = audio_crowd_event_listener
		params = {
			event_type = 2
		}
	}
	{
		MidiNote = 84
		Scr = audio_crowd_event_listener
		params = {
			event_type = 3
		}
	}
	{
		MidiNote = 85
		Scr = audio_crowd_event_listener
		params = {
			event_type = 4
		}
	}
	{
		MidiNote = 86
		Scr = audio_crowd_event_listener
		params = {
			event_type = 5
		}
	}
	{
		MidiNote = 87
		Scr = audio_crowd_event_listener
		params = {
			event_type = 6
		}
	}
	{
		MidiNote = 88
		Scr = audio_crowd_event_listener
		params = {
			event_type = 7
		}
	}
	{
		MidiNote = 89
		Scr = audio_crowd_event_listener
		params = {
			event_type = 8
		}
	}
	{
		MidiNote = 90
		Scr = band_performancecrowdreaction
		params = {
			positive
		}
	}
	{
		MidiNote = 91
		Scr = trigger_performancecrowdreaction
		params = {
			part = guitar
			negative
		}
	}
	{
		MidiNote = 92
		Scr = trigger_performancecrowdreaction
		params = {
			part = bass
			negative
		}
	}
	{
		MidiNote = 93
		Scr = trigger_performancecrowdreaction
		params = {
			part = drum
			negative
		}
	}
	{
		MidiNote = 94
		Scr = audio_crowd_event_listener
		params = {
			event_type = 9
		}
	}
	{
		MidiNote = 95
		Scr = audio_crowd_event_listener
		params = {
			event_type = 10
		}
	}
	{
		MidiNote = 96
		Scr = audio_crowd_event_listener
		params = {
			event_type = 11
		}
	}
]
triggers_autonotemapping = [
	{
		MidiNote = 101
		Scr = trigger_performancecrowdreaction
		params = {
			part = guitar
			positive
		}
	}
	{
		MidiNote = 102
		Scr = trigger_performancecrowdreaction
		params = {
			part = guitar
			negative
		}
	}
	{
		MidiNote = 103
		Scr = trigger_performancecrowdreaction
		params = {
			part = guitar
			positive
			negative
		}
	}
	{
		MidiNote = 104
		Scr = trigger_performancecrowdreaction
		params = {
			part = bass
			positive
		}
	}
	{
		MidiNote = 105
		Scr = trigger_performancecrowdreaction
		params = {
			part = bass
			negative
		}
	}
	{
		MidiNote = 106
		Scr = trigger_performancecrowdreaction
		params = {
			part = bass
			positive
			negative
		}
	}
	{
		MidiNote = 107
		Scr = trigger_performancecrowdreaction
		params = {
			part = drum
			positive
		}
	}
	{
		MidiNote = 108
		Scr = trigger_performancecrowdreaction
		params = {
			part = drum
			negative
		}
	}
	{
		MidiNote = 109
		Scr = trigger_performancecrowdreaction
		params = {
			part = drum
			positive
			negative
		}
	}
	{
		MidiNote = 110
		Scr = band_performancecrowdreaction
		params = {
			positive
		}
	}
]

script Countoff_NoteMap 
	printf \{channel = sfx
		qs(0x750207eb)}
	printstruct <...>
	SpawnScriptNow audio_gameplay_countoff_logic params = {<...>}
endscript

script notemap_startiterator 
	formatText checksumName = global_notemapping '%s_AutoNoteMapping' s = <event_string>
	if NOT GlobalExists Name = <global_notemapping> Type = array
		return
	endif
	formatText checksumName = event_checksum '%s' s = <event_string>
	SetNoteMappings section = <event_checksum> mapping = $<global_notemapping>
	SpawnScriptNow notemap_iterator params = {<...>}
endscript

script notemap_deinit 
	ClearNoteMappings \{section = all}
	KillSpawnedScript \{Name = notemap_iterator}
	KillSpawnedScript \{Name = notemap_startiterator}
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
		playerd = <Player>
		trigger_performancecrowdreactionget <...> part = bass
		notes_hitr = <notes_hit>
		total_notesr = <total_notes>
		playerr = <Player>
		trigger_performancecrowdreactionget <...> part = guitar
		if (<error> = 1)
			return
		endif
		GetSongTimeMs
		target = (<time> + <length>)
		begin
		Wait \{1
			gameframe}
		GetSongTimeMs
		if (<time> >= <target>)
			break
		endif
		repeat
		getplayerinfo <Player> notes_hit out = player_notes_hit
		getplayerinfo <Player> total_notes out = player_total_notes
		notes_hit_count = (<notes_hit> - <player_notes_hit>)
		total_notes_count = (<total_notes> - <player_total_notes>)
		if (<notes_hit_count> = <total_notes_count>)
			if GotParam \{positive}
				trigger_positivecrowdreaction
			endif
		else
			if GotParam \{negative}
				trigger_negativecrowdreaction
			endif
		endif
		succeed = 0
		if trigger_performancecrowdreactioncheck notes_hit = <notes_hitd> total_notes = <total_notesd> Player = <playerd>
			if trigger_performancecrowdreactioncheck notes_hit = <notes_hitr> total_notes = <total_notesr> Player = <playerr>
				if trigger_performancecrowdreactioncheck notes_hit = <notes_hit> total_notes = <total_notes> Player = <Player>
					succeed = 1
				endif
			endif
		endif
		if (<succeed> = 1)
			if GotParam \{positive}
				trigger_positivecrowdreaction
			endif
		else
			if GotParam \{negative}
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
		getplayerinfo <Player> part out = player_part
		if (<player_part> = <part>)
			<error> = 0
			break
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	if (<error> = 1)
		return \{error = 1}
	endif
	getplayerinfo <Player> notes_hit
	getplayerinfo <Player> total_notes
	return notes_hit = <notes_hit> total_notes = <total_notes> Player = <Player>
endscript

script trigger_performancecrowdreactioncheck 
	getplayerinfo <Player> notes_hit out = notes_hit_count
	getplayerinfo <Player> total_notes out = total_notes_count
	if (<notes_hit_count> = <total_notes_count>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script trigger_performancecrowdreaction 
	error = 0
	trigger_performancecrowdreactionget <...>
	if (<error> = 1)
		return
	endif
	GetSongTimeMs
	target = (<time> + <length>)
	begin
	Wait \{1
		gameframe}
	GetSongTimeMs
	if (<time> >= <target>)
		break
	endif
	repeat
	if trigger_performancecrowdreactioncheck <...>
		if GotParam \{positive}
			trigger_positivecrowdreaction
		endif
	else
		if GotParam \{negative}
			trigger_negativecrowdreaction
		endif
	endif
endscript

script trigger_positivecrowdreaction 
	GetPakManCurrent \{map = zones}
	AppendSuffixToChecksum Base = <pak> SuffixString = '_sfx_Crowd_Middle_Left'
	middleleftobjectname = <appended_id>
	AppendSuffixToChecksum Base = <pak> SuffixString = '_sfx_Crowd_Middle_Right'
	middlerightobjectname = <appended_id>
	switch <pak>
		case z_metalfest
		if CompositeObjectExists Name = <middleleftobjectname>
			SoundEvent event = lg_ext_crowd_trigger_short_positive_l object = <middleleftobjectname>
		endif
		if CompositeObjectExists Name = <middlerightobjectname>
			SoundEvent event = lg_ext_crowd_trigger_short_positive_r object = <middlerightobjectname>
		endif
		default
		SoundEvent \{event = Medium_Crowd_Swell}
	endswitch
	SoundEvent \{event = large_ext_crowd_positive_swell_layer}
endscript

script trigger_negativecrowdreaction 
endscript
