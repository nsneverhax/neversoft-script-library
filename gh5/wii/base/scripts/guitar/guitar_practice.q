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
			pad = tom2
			buss = practicemode_drums
		}
	}
	{
		MidiNote = 62
		Scr = play_drum_sample
		params = {
			pad = tom2
			buss = practicemode_drums
		}
	}
	{
		MidiNote = 63
		Scr = play_drum_sample
		params = {
			pad = tom1
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
practice_slomo_drum_notemapping = [
	{
		MidiNote = 60
		Scr = play_drum_sample
		params = {
			pad = kick
			buss = drums_ingame_kick
		}
	}
	{
		MidiNote = 61
		Scr = play_drum_sample
		params = {
			pad = tom2
			buss = drums_ingame_toms
		}
	}
	{
		MidiNote = 62
		Scr = play_drum_sample
		params = {
			pad = tom2
			buss = drums_ingame_toms
		}
	}
	{
		MidiNote = 63
		Scr = play_drum_sample
		params = {
			pad = tom1
			buss = drums_ingame_toms
		}
	}
	{
		MidiNote = 64
		Scr = play_drum_sample
		params = {
			pad = snare
			buss = drums_ingame_snare
		}
	}
	{
		MidiNote = 65
		Scr = play_drum_sample
		params = {
			pad = hihat
			buss = drums_ingame_cymbals
			velocity = 50
		}
	}
	{
		MidiNote = 66
		Scr = play_drum_sample
		params = {
			pad = hihat
			buss = drums_ingame_cymbals
		}
	}
	{
		MidiNote = 67
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = drums_ingame_cymbals
			velocity = 50
		}
	}
	{
		MidiNote = 68
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = drums_ingame_cymbals
		}
	}
	{
		MidiNote = 69
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = drums_ingame_cymbals
			velocity = 90
		}
	}
]
practice_current_percentage = 0
practice_highest_percentage = 0

script Practice_DummyFunction 
	printf \{qs(0x65bbc7fe)}
endscript

script practice_setup_notemappings 
	if NOT ($current_speedfactor = 1.0)
		if NOT playerinfoequals \{1
				part = drum}
			SetNoteMappings \{section = drums
				mapping = $Practice_NoteMapping}
		else
			SetNoteMappings \{section = drums
				mapping = $practice_slomo_drum_notemapping}
		endif
	endif
endscript
practice_font = fontgrid_title_a1

script practicemode_init 
	printf \{channel = sfx
		qs(0x57d2e106)}
	destroyeffectsendstack slot = ($venue_sendeffect_slot)
	Change \{practice_current_percentage = 0}
	Change \{practice_highest_percentage = 0}
	practice_setup_notemappings
	gman_songtool_getcurrentsong
	loaddrumkitall song = <current_song> async = 0
	Hide_Band
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = practice_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = descinterface
		desc = 'practice_section_text'
		parent = practice_container
		id = practice_sectiontext
		text_alpha = 0}
	text_pos = (400.0, 400.0)
	getplayerinfo \{1
		part}
	if (<part> = vocals)
		text_pos = (400.0, 400.0)
	endif
	CreateScreenElement {
		Type = TextElement
		parent = practice_container
		id = practice_sectionpercentagetext
		Scale = (0.8, 0.75)
		Pos = <text_pos>
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 1
		just = [right top]
		z_priority = 3
		text = qs(0xf816244e)
	}
	CreateScreenElement {
		Type = TextElement
		parent = practice_container
		id = practice_sectionpercentagetext_highest
		Scale = (0.33, 0.33)
		Pos = (<text_pos> + (0.0, 66.0))
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 0
		just = [right top]
		z_priority = 3
		text = qs(0xf816244e)
	}
	SpawnScriptNow \{practicemode_section}
	hide_crowd_models
endscript

script practicemode_section 
	practicedrums_fadein
	if playerinfoequals \{1
			part = vocals}
		return
	endif
	current_section_index = 0
	begin
	GetSongTimeMs
	if (<time> > $current_starttime)
		practice_sectiontext :se_setprops section_text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :se_setprops \{text_alpha = 1.0
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
		practice_sectiontext :se_setprops \{text_alpha = 0.0
			time = 0.5}
		practicedrums_fadeout
		break
	elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :se_setprops \{text_alpha = 0.0
			time = 0.5}
		Wait \{0.5
			Second}
		practice_sectiontext :se_setprops section_text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :se_setprops \{text_alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script practicemode_deinit 
	printf \{channel = sfx
		qs(0x933ce655)}
	create_venue_effects_settings
	ClearNoteMappings \{section = practice}
	KillSpawnedScript \{Name = practicemode_section}
	if ScreenElementExists \{id = practice_container}
		DestroyScreenElement \{id = practice_container}
	endif
	StopSoundsByBuss \{practicemode_drums}
	Unhide_Band
	i = 1
	begin
	formatText checksumName = Name 'musician%i' i = <i>
	if CompositeObjectExists <Name>
		<Name> :Unpause
	endif
	repeat 4
	hide_crowd_models \{Active = FALSE}
endscript

script reset_practice_mode 
	Change \{current_speedfactor = 1.0}
	practicemode_deinit
	shut_down_practice_mode
	enable_crowd_models_cfunc \{Active = true}
	Change \{practice_enabled = 0}
	Change \{disable_crowd = 0}
	Change \{practice_start_time = 0}
	Change \{practice_end_time = 0}
	Change \{current_starttime = 0}
endscript
