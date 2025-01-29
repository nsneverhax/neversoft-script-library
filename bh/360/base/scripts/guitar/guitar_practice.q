Practice_NoteMapping = [
	{
		MidiNote = 60
		Scr = play_drum_sample
		params = {
			pad = kick
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 61
		Scr = play_drum_sample
		params = {
			pad = tom2
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 62
		Scr = play_drum_sample
		params = {
			pad = tom2
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 63
		Scr = play_drum_sample
		params = {
			pad = tom1
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 64
		Scr = play_drum_sample
		params = {
			pad = snare
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 65
		Scr = play_drum_sample
		params = {
			pad = hihat
			buss = PracticeMode_Drums
			velocity = 50
		}
	}
	{
		MidiNote = 66
		Scr = play_drum_sample
		params = {
			pad = hihat
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 67
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = PracticeMode_Drums
			velocity = 50
		}
	}
	{
		MidiNote = 68
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 69
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = PracticeMode_Drums
			velocity = 90
		}
	}
]
Practice_Slomo_Drum_NoteMapping = [
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
			buss = Drums_InGame_Hats
			velocity = 50
		}
	}
	{
		MidiNote = 66
		Scr = play_drum_sample
		params = {
			pad = hihat
			buss = Drums_InGame_Hats
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
		if NOT PlayerInfoEquals \{1
				part = Drum}
			SetNoteMappings \{section = drums
				mapping = $Practice_NoteMapping}
		else
			SetNoteMappings \{section = drums
				mapping = $Practice_Slomo_Drum_NoteMapping}
		endif
	endif
endscript
practice_font = fontgrid_title_a1

script practicemode_init 
	printf \{channel = sfx
		qs(0x57d2e106)}
	SetDSPEffectParams \{effects = [
			{
				Effect = sfxreverb
				name = venueverb
				bypass = true
			}
		]}
	Change \{practice_current_percentage = 0}
	Change \{practice_highest_percentage = 0}
	practice_setup_notemappings
	GMan_SongTool_GetCurrentSong
	LoadDrumKitAll song = <current_song>
	hide_band
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = practice_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{type = DescInterface
		desc = 'practice_section_text'
		parent = practice_container
		id = practice_sectiontext
		text_alpha = 0}
	text_pos = (400.0, 400.0)
	GetPlayerInfo \{1
		part}
	if (<part> = vocals)
		text_pos = (400.0, 400.0)
	endif
	CreateScreenElement {
		type = TextElement
		parent = practice_container
		id = practice_sectionpercentagetext
		scale = (0.8, 0.75)
		Pos = <text_pos>
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 1
		just = [right top]
		z_priority = 3
		text = qs(0xf816244e)
	}
	CreateScreenElement {
		type = TextElement
		parent = practice_container
		id = practice_sectionpercentagetext_highest
		scale = (0.33, 0.33)
		Pos = (<text_pos> + (0.0, 66.0))
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 0
		just = [right top]
		z_priority = 3
		text = qs(0xf816244e)
	}
	spawnscriptnow \{practicemode_section}
	hide_crowd_models
endscript

script practicemode_section 
	PracticeDrums_FadeIn
	GetFirstPlayer
	if PlayerInfoEquals <player> part = vocals
		return
	endif
	current_section_index = 0
	begin
	GetSongTimeMs
	if (<time> > $current_starttime)
		practice_sectiontext :SE_SetProps section_text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :SE_SetProps \{text_alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin
	GetSongTimeMs
	if (<time> > $current_endtime)
		practice_sectiontext :SE_SetProps \{text_alpha = 0.0
			time = 0.5}
		PracticeDrums_FadeOut
		break
	elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :SE_SetProps \{text_alpha = 0.0
			time = 0.5}
		wait \{0.5
			second}
		practice_sectiontext :SE_SetProps section_text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :SE_SetProps \{text_alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
	endif
	wait \{1
		gameframe}
	repeat
endscript

script practicemode_deinit 
	printf \{channel = sfx
		qs(0x933ce655)}
	SetDSPEffectParams \{effects = [
			{
				Effect = sfxreverb
				name = venueverb
				bypass = false
			}
		]}
	ClearNoteMappings \{section = practice}
	killspawnedscript \{name = practicemode_section}
	if ScreenElementExists \{id = practice_container}
		DestroyScreenElement \{id = practice_container}
	endif
	StopSoundsByBuss \{PracticeMode_Drums}
	unhide_band
	hide_crowd_models \{active = false}
endscript

script reset_practice_mode 
	Change \{current_speedfactor = 1.0}
	practicemode_deinit
	shut_down_practice_mode
	enable_crowd_models_cfunc \{active = true}
	Change \{practice_enabled = 0}
	Change \{disable_crowd = 0}
	Change \{practice_start_time = 0}
	Change \{practice_end_time = 0}
	Change \{current_starttime = 0}
endscript
