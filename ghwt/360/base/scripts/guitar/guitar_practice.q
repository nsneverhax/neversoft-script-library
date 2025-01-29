Practice_NoteMapping = [
	{
		MidiNote = 60
		Scr = play_drum_sample
		params = {
			pad = kick
			buss = practicemode_drums
		}
	}
	{
		MidiNote = 61
		Scr = play_drum_sample
		params = {
			pad = floortom
			buss = practicemode_drums
		}
	}
	{
		MidiNote = 62
		Scr = play_drum_sample
		params = {
			pad = floortom
			buss = practicemode_drums
		}
	}
	{
		MidiNote = 63
		Scr = play_drum_sample
		params = {
			pad = hitom
			buss = practicemode_drums
		}
	}
	{
		MidiNote = 64
		Scr = play_drum_sample
		params = {
			pad = snare
			buss = practicemode_drums
		}
	}
	{
		MidiNote = 65
		Scr = play_drum_sample
		params = {
			pad = hihat
			buss = practicemode_drums
			velocity = 50
		}
	}
	{
		MidiNote = 66
		Scr = play_drum_sample
		params = {
			pad = hihat
			buss = practicemode_drums
		}
	}
	{
		MidiNote = 67
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = practicemode_drums
			velocity = 50
		}
	}
	{
		MidiNote = 68
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = practicemode_drums
		}
	}
	{
		MidiNote = 69
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = practicemode_drums
			velocity = 90
		}
	}
]

script Practice_DummyFunction 
	printf \{qs(0x65bbc7fe)}
endscript
practice_font = fontgrid_title_a1

script practicemode_init 
	<start_index> = $practice_start_index
	if (<start_index> > 0)
		Change \{structurename = player1_status
			gem_filler_first_note = 1}
	endif
	if NOT ($current_speedfactor = 1.0)
		if NOT playerinfoequals \{1
				part = drum}
			SetNoteMappings \{section = drums
				mapping = $Practice_NoteMapping}
		endif
	endif
	Hide_Band
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = practice_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = TextElement
		parent = practice_container
		id = practice_sectiontext
		Scale = (1.1, 0.9)
		Pos = (640.0, 160.0)
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 0
		just = [center top]
		z_priority = 3
	}
	SpawnScriptNow \{practicemode_section}
endscript

script practicemode_section 
	if ($special_event_stage != 0)
		return
	endif
	if playerinfoequals \{1
			part = vocals}
		return
	endif
	current_section_index = 0
	begin
	GetSongTimeMs
	if (<time> > $current_starttime)
		practice_sectiontext :se_setprops text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :legacydomorph \{alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	begin
	GetSongTimeMs
	if (<time> > $current_endtime)
		practice_sectiontext :legacydomorph \{alpha = 0.0
			time = 0.5}
		break
	elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :legacydomorph \{alpha = 0.0
			time = 0.5}
		Wait \{0.5
			Second}
		practice_sectiontext :se_setprops text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :legacydomorph \{alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script practicemode_deinit 
	ClearNoteMappings \{section = practice}
	KillSpawnedScript \{Name = practicemode_section}
	if ScreenElementExists \{id = practice_container}
		DestroyScreenElement \{id = practice_container}
	endif
	StopSoundsByBuss \{practicemode_drums}
endscript
