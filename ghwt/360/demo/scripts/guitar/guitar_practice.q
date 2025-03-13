practice_notemapping = [
	{
		midinote = 60
		scr = play_drum_sample
		params = {
			pad = kick
			buss = practicemode_drums
		}
	}
	{
		midinote = 61
		scr = play_drum_sample
		params = {
			pad = floortom
			buss = practicemode_drums
		}
	}
	{
		midinote = 62
		scr = play_drum_sample
		params = {
			pad = floortom
			buss = practicemode_drums
		}
	}
	{
		midinote = 63
		scr = play_drum_sample
		params = {
			pad = hitom
			buss = practicemode_drums
		}
	}
	{
		midinote = 64
		scr = play_drum_sample
		params = {
			pad = snare
			buss = practicemode_drums
		}
	}
	{
		midinote = 65
		scr = play_drum_sample
		params = {
			pad = hihat
			buss = practicemode_drums
			velocity = 50
		}
	}
	{
		midinote = 66
		scr = play_drum_sample
		params = {
			pad = hihat
			buss = practicemode_drums
		}
	}
	{
		midinote = 67
		scr = play_drum_sample
		params = {
			pad = cymbal
			buss = practicemode_drums
			velocity = 50
		}
	}
	{
		midinote = 68
		scr = play_drum_sample
		params = {
			pad = cymbal
			buss = practicemode_drums
		}
	}
	{
		midinote = 69
		scr = play_drum_sample
		params = {
			pad = cymbal
			buss = practicemode_drums
			velocity = 90
		}
	}
]

script practice_dummyfunction 
	printf \{qs(0x65bbc7fe)}
endscript
practice_font = fontgrid_title_a1

script practicemode_init 
	<start_index> = $practice_start_index
	if (<start_index> > 0)
		change \{structurename = player1_status
			gem_filler_first_note = 1}
	endif
	if NOT ($current_speedfactor = 1.0)
		if NOT playerinfoequals \{1
				part = drum}
			setnotemappings \{section = drums
				mapping = $practice_notemapping}
		endif
	endif
	hide_band
	createscreenelement \{type = containerelement
		parent = root_window
		id = practice_container
		pos = (0.0, 0.0)}
	createscreenelement {
		type = textelement
		parent = practice_container
		id = practice_sectiontext
		scale = (1.1, 0.9)
		pos = (640.0, 160.0)
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 0
		just = [center top]
		z_priority = 3
	}
	spawnscriptnow \{practicemode_section}
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
	getsongtimems
	if (<time> > $current_starttime)
		practice_sectiontext :se_setprops text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :legacydomorph \{alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin
	getsongtimems
	if (<time> > $current_endtime)
		practice_sectiontext :legacydomorph \{alpha = 0.0
			time = 0.5}
		break
	elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :legacydomorph \{alpha = 0.0
			time = 0.5}
		wait \{0.5
			second}
		practice_sectiontext :se_setprops text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :legacydomorph \{alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
	endif
	wait \{1
		gameframe}
	repeat
endscript

script practicemode_deinit 
	clearnotemappings \{section = practice}
	killspawnedscript \{name = practicemode_section}
	if screenelementexists \{id = practice_container}
		destroyscreenelement \{id = practice_container}
	endif
	stopsoundsbybuss \{practicemode_drums}
endscript
