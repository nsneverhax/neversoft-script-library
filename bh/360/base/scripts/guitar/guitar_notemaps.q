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
		Scr = Band_PerformanceCrowdReaction
		params = {
			Positive
		}
	}
	{
		MidiNote = 91
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = guitar
			negative
		}
	}
	{
		MidiNote = 92
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = bass
			negative
		}
	}
	{
		MidiNote = 93
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = Drum
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
Triggers_AutoNoteMapping = [
	{
		MidiNote = 101
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = guitar
			Positive
		}
	}
	{
		MidiNote = 102
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = guitar
			negative
		}
	}
	{
		MidiNote = 103
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = guitar
			Positive
			negative
		}
	}
	{
		MidiNote = 104
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = bass
			Positive
		}
	}
	{
		MidiNote = 105
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = bass
			negative
		}
	}
	{
		MidiNote = 106
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = bass
			Positive
			negative
		}
	}
	{
		MidiNote = 107
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = Drum
			Positive
		}
	}
	{
		MidiNote = 108
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = Drum
			negative
		}
	}
	{
		MidiNote = 109
		Scr = Trigger_PerformanceCrowdReaction
		params = {
			part = Drum
			Positive
			negative
		}
	}
	{
		MidiNote = 110
		Scr = Band_PerformanceCrowdReaction
		params = {
			Positive
		}
	}
]

script NoteMap_Dummy 
	printf \{qs(0xa9b4ece2)}
endscript

script Countoff_NoteMap 
	spawnscriptnow GH_SFX_Countoff_Logic params = {<...>}
endscript

script notemap_startiterator 
	FormatText checksumname = global_notemapping '%s_AutoNoteMapping' s = <event_string>
	if NOT GlobalExists name = <global_notemapping> type = array
		return
	endif
	FormatText checksumname = event_checksum '%s' s = <event_string>
	SetNoteMappings section = <event_checksum> mapping = $<global_notemapping>
	spawnscriptnow notemap_iterator params = {<...>}
endscript

script notemap_deinit 
	ClearNoteMappings \{section = all}
	killspawnedscript \{name = notemap_iterator}
	killspawnedscript \{name = notemap_startiterator}
endscript

script notemap_iterator 
	Notemap_iterator_CFunc_Setup
	begin
	if Notemap_iterator_CFunc
		break
	endif
	repeat
	Notemap_iterator_CFunc_Cleanup
endscript

script Band_PerformanceCrowdReaction 
	if NOT ($game_mode = practice)
		error = 0
		Trigger_PerformanceCrowdReactionGet <...> part = Drum
		notes_hitd = <notes_hit>
		total_notesd = <total_notes>
		playerd = <player>
		Trigger_PerformanceCrowdReactionGet <...> part = bass
		notes_hitr = <notes_hit>
		total_notesr = <total_notes>
		playerr = <player>
		Trigger_PerformanceCrowdReactionGet <...> part = guitar
		if (<error> = 1)
			return
		endif
		GetSongTimeMs
		target = (<time> + <length>)
		begin
		wait \{1
			gameframe}
		GetSongTimeMs
		if (<time> >= <target>)
			break
		endif
		repeat
		GetPlayerInfo <player> notes_hit out = player_notes_hit
		GetPlayerInfo <player> total_notes out = player_total_notes
		notes_hit_count = (<notes_hit> - <player_notes_hit>)
		total_notes_count = (<total_notes> - <player_total_notes>)
		if (<notes_hit_count> = <total_notes_count>)
			if GotParam \{Positive}
				Trigger_PositiveCrowdReaction
			endif
		else
			if GotParam \{negative}
				Trigger_NegativeCrowdReaction
			endif
		endif
		succeed = 0
		if Trigger_PerformanceCrowdReactionCheck notes_hit = <notes_hitd> total_notes = <total_notesd> player = <playerd>
			if Trigger_PerformanceCrowdReactionCheck notes_hit = <notes_hitr> total_notes = <total_notesr> player = <playerr>
				if Trigger_PerformanceCrowdReactionCheck notes_hit = <notes_hit> total_notes = <total_notes> player = <player>
					succeed = 1
				endif
			endif
		endif
		if (<succeed> = 1)
			if GotParam \{Positive}
				Trigger_PositiveCrowdReaction
			endif
		else
			if GotParam \{negative}
				Trigger_NegativeCrowdReaction
			endif
		endif
	endif
endscript

script Trigger_PerformanceCrowdReactionGet 
	error = 1
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> part out = player_part
		if (<player_part> = <part>)
			<error> = 0
			break
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	if (<error> = 1)
		return \{error = 1}
	endif
	GetPlayerInfo <player> notes_hit
	GetPlayerInfo <player> total_notes
	return notes_hit = <notes_hit> total_notes = <total_notes> player = <player>
endscript

script Trigger_PerformanceCrowdReactionCheck 
	GetPlayerInfo <player> notes_hit out = notes_hit_count
	GetPlayerInfo <player> total_notes out = total_notes_count
	if (<notes_hit_count> = <total_notes_count>)
		return \{true}
	else
		return \{false}
	endif
endscript

script Trigger_PerformanceCrowdReaction 
	error = 0
	Trigger_PerformanceCrowdReactionGet <...>
	if (<error> = 1)
		return
	endif
	GetSongTimeMs
	target = (<time> + <length>)
	begin
	wait \{1
		gameframe}
	GetSongTimeMs
	if (<time> >= <target>)
		break
	endif
	repeat
	if Trigger_PerformanceCrowdReactionCheck <...>
		if GotParam \{Positive}
			Trigger_PositiveCrowdReaction
		endif
	else
		if GotParam \{negative}
			Trigger_NegativeCrowdReaction
		endif
	endif
endscript

script Trigger_PositiveCrowdReaction 
	GetPakManCurrent \{map = zones}
	AppendSuffixToChecksum base = <pak> SuffixString = '_sfx_Crowd_Middle_Left'
	middleleftobjectname = <appended_id>
	AppendSuffixToChecksum base = <pak> SuffixString = '_sfx_Crowd_Middle_Right'
	middlerightobjectname = <appended_id>
	switch <pak>
		case z_metalfest
		if CompositeObjectExists name = <middleleftobjectname>
			SoundEvent event = LG_EXT_Crowd_Trigger_Short_Positive_L Object = <middleleftobjectname>
		endif
		if CompositeObjectExists name = <middlerightobjectname>
			SoundEvent event = LG_EXT_Crowd_Trigger_Short_Positive_R Object = <middlerightobjectname>
		endif
		default
		SoundEvent \{event = Medium_Crowd_Swell}
	endswitch
	SoundEvent \{event = Large_EXT_Crowd_Positive_Swell_Layer}
endscript

script Trigger_NegativeCrowdReaction 
endscript
