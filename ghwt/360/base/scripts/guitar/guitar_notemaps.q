Drums_AutoNoteMapping = [
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
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = 1
		}
	}
	{
		MidiNote = 83
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = 2
		}
	}
	{
		MidiNote = 84
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = 3
		}
	}
	{
		MidiNote = 85
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = 4
		}
	}
	{
		MidiNote = 86
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = 5
		}
	}
	{
		MidiNote = 87
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = 6
		}
	}
	{
		MidiNote = 88
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = 7
		}
	}
	{
		MidiNote = 89
		Scr = GH3_Crowd_Event_Listener
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
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = 9
		}
	}
	{
		MidiNote = 95
		Scr = GH3_Crowd_Event_Listener
		params = {
			event_type = 10
		}
	}
	{
		MidiNote = 96
		Scr = GH3_Crowd_Event_Listener
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

script NoteMap_Dummy 
	printf \{qs(0xa9b4ece2)}
endscript

script Countoff_NoteMap 
	SpawnScriptNow GH_SFX_Countoff_Logic params = {<...>}
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
	if NOT ($game_mode = training)
		error = 0
		trigger_performancecrowdreactionget <...> part = drum
		notes_hitd = <notes_hit>
		total_notesd = <total_notes>
		player_statusd = <player_status>
		trigger_performancecrowdreactionget <...> part = bass
		notes_hitr = <notes_hit>
		total_notesr = <total_notes>
		player_statusr = <player_status>
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
		notes_hit_count = (<notes_hit> - $<player_status>.notes_hit)
		total_notes_count = (<total_notes> - $<player_status>.total_notes)
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
		if trigger_performancecrowdreactioncheck notes_hit = <notes_hitd> total_notes = <total_notesd> player_status = <player_statusd>
			if trigger_performancecrowdreactioncheck notes_hit = <notes_hitr> total_notes = <total_notesr> player_status = <player_statusr>
				if trigger_performancecrowdreactioncheck notes_hit = <notes_hit> total_notes = <total_notes> player_status = <player_status>
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
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if ($<player_status>.part = <part>)
		break
	endif
	Player = (<Player> + 1)
	if (<Player> > $current_num_players)
		return \{error = 1}
	endif
	repeat
	notes_hit = ($<player_status>.notes_hit)
	total_notes = ($<player_status>.total_notes)
	return notes_hit = <notes_hit> total_notes = <total_notes> player_status = <player_status>
endscript

script trigger_performancecrowdreactioncheck 
	notes_hit_count = (<notes_hit> - $<player_status>.notes_hit)
	total_notes_count = (<total_notes> - $<player_status>.total_notes)
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
