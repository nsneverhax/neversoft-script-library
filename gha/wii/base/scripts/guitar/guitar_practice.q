Practice_NoteMapping = [
	{
		MidiNote = 60
		Scr = SoundEvent
		params = {
			event = Practice_Mode_Kick
		}
	}
	{
		MidiNote = 61
		Scr = SoundEvent
		params = {
			event = Practice_Mode_Tom3
		}
	}
	{
		MidiNote = 62
		Scr = SoundEvent
		params = {
			event = Practice_Mode_Tom2
		}
	}
	{
		MidiNote = 63
		Scr = SoundEvent
		params = {
			event = Practice_Mode_Tom1
		}
	}
	{
		MidiNote = 64
		Scr = SoundEvent
		params = {
			event = Practice_Mode_Snare
		}
	}
	{
		MidiNote = 65
		Scr = SoundEvent
		params = {
			event = Practice_Mode_HiHatClosed
		}
	}
	{
		MidiNote = 66
		Scr = SoundEvent
		params = {
			event = Practice_Mode_HiHatOpen
		}
	}
	{
		MidiNote = 67
		Scr = SoundEvent
		params = {
			event = Practice_Mode_Ride
		}
	}
	{
		MidiNote = 68
		Scr = SoundEvent
		params = {
			event = Practice_Mode_Crash1
		}
	}
	{
		MidiNote = 69
		Scr = SoundEvent
		params = {
			event = Practice_Mode_Crash2
		}
	}
]

script Practice_DummyFunction 

endscript

script 0xcabcae7c 
	show_highway
	if ScreenElementExists \{id = practice_sectiontext}
		SetScreenElementProps \{id = practice_sectiontext
			unhide}
	endif
endscript

script 0x0f78e7cf 
	hide_highway
	if ScreenElementExists \{id = practice_sectiontext}
		SetScreenElementProps \{id = practice_sectiontext
			Hide}
	endif
endscript
practice_font = fontgrid_title_gh3

script practicemode_init 
	if NOT ($current_speedfactor = 1.0)
		SetNoteMappings \{section = drums
			mapping = $Practice_NoteMapping}
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
		Scale = (1.4667, 1.2)
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
	current_section_index = 0
	begin
	GetSongTimeMs
	if (<time> > $current_starttime)
		Change \{current_section_array_entry = $0x70f20eb0}
		current_section_index = ($current_section_array_entry)
		practice_sectiontext :SetProps text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :DoMorph \{alpha = 1.0
			time = 0.5}
		break
	endif
	WaitOneGameFrame
	repeat
	begin
	GetSongTimeMs
	if (<time> > $current_endtime)
		practice_sectiontext :DoMorph \{alpha = 0.0
			time = 0.5}
		break
	elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :DoMorph \{alpha = 0.0
			time = 0.5}
		Wait \{0.5
			Second}
		practice_sectiontext :SetProps text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :DoMorph \{alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
	endif
	WaitOneGameFrame
	repeat
endscript

script practicemode_deinit 
	ClearNoteMappings \{section = practice}
	KillSpawnedScript \{Name = practicemode_section}
	if ScreenElementExists \{id = practice_container}
		DestroyScreenElement \{id = practice_container}
	endif
	end_song
endscript
