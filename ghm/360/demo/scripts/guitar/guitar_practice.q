practice_notemapping = [
	{
		midinote = 60
		scr = play_drum_sample_randomized
		params = {
			pad = kick
			buss = practicemode_drums
		}
	}
	{
		midinote = 61
		scr = play_drum_sample_randomized
		params = {
			pad = tom2
			buss = practicemode_drums
		}
	}
	{
		midinote = 62
		scr = play_drum_sample_randomized
		params = {
			pad = tom2
			buss = practicemode_drums
		}
	}
	{
		midinote = 63
		scr = play_drum_sample_randomized
		params = {
			pad = tom1
			buss = practicemode_drums
		}
	}
	{
		midinote = 64
		scr = play_drum_sample_randomized
		params = {
			pad = snare
			buss = practicemode_drums
		}
	}
	{
		midinote = 65
		scr = play_drum_sample_randomized
		params = {
			pad = hihat
			buss = practicemode_drums
			chh_ride
			velocity = 50
		}
	}
	{
		midinote = 66
		scr = play_drum_sample_randomized
		params = {
			pad = hihat
			buss = practicemode_drums
		}
	}
	{
		midinote = 67
		scr = play_drum_sample_randomized
		params = {
			pad = cymbal
			buss = practicemode_drums
			velocity = 50
			chh_ride
		}
	}
	{
		midinote = 68
		scr = play_drum_sample_randomized
		params = {
			pad = cymbal
			buss = practicemode_drums
		}
	}
	{
		midinote = 69
		scr = play_drum_sample_randomized
		params = {
			pad = cymbal
			buss = practicemode_drums
			velocity = 90
		}
	}
]
practice_slomo_drum_notemapping = [
	{
		midinote = 60
		scr = play_drum_sample
		params = {
			pad = kick
			buss = drums_ingame_kick
		}
	}
	{
		midinote = 61
		scr = play_drum_sample
		params = {
			pad = tom2
			buss = drums_ingame_toms
		}
	}
	{
		midinote = 62
		scr = play_drum_sample
		params = {
			pad = tom2
			buss = drums_ingame_toms
		}
	}
	{
		midinote = 63
		scr = play_drum_sample
		params = {
			pad = tom1
			buss = drums_ingame_toms
		}
	}
	{
		midinote = 64
		scr = play_drum_sample
		params = {
			pad = snare
			buss = drums_ingame_snare
		}
	}
	{
		midinote = 65
		scr = play_drum_sample
		params = {
			pad = hihat
			buss = drums_ingame_cymbals
			velocity = 50
		}
	}
	{
		midinote = 66
		scr = play_drum_sample
		params = {
			pad = hihat
			buss = drums_ingame_cymbals
		}
	}
	{
		midinote = 67
		scr = play_drum_sample
		params = {
			pad = cymbal
			buss = drums_ingame_cymbals
			velocity = 50
		}
	}
	{
		midinote = 68
		scr = play_drum_sample
		params = {
			pad = cymbal
			buss = drums_ingame_cymbals
		}
	}
	{
		midinote = 69
		scr = play_drum_sample
		params = {
			pad = cymbal
			buss = drums_ingame_cymbals
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
		else
			setnotemappings \{section = drums
				mapping = $practice_slomo_drum_notemapping}
		endif
	endif
	if playerinfoequals \{1
			part = bass}
		setsoundbussparams {leadgtr_balance = {vol = (($default_bussset.leadgtr_balance.vol) -3.5)} time = 0.1}
		setsoundbussparams {bass_balance = {vol = (($default_bussset.bass_balance.vol) + 2)} time = 0.1}
	endif
	if playerinfoequals \{1
			part = drum}
		setsoundbussparams {drums_ingame = {vol = (($default_bussset.drums_ingame.vol) - 2.5)} time = 0.1}
	else
		setsoundbussparams {drums_ingame = {vol = (($default_bussset.drums_ingame.vol) - 4)} time = 0.1}
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
		pos = (640.0, 100.0)
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 0
		just = [center top]
		z_priority = 3
	}
	spawnscriptnow \{practicemode_section}
endscript

script practicemode_section 
	practicedrums_fadein
	if ($special_event_stage != 0)
		return
	endif
	if playerinfoequals \{1
			part = vocals}
		return
	endif
	get_song_section_array
	getmarkerarraysize array = <song_section_array>
	current_section_index = 0
	begin
	if ($current_section_array_entry >= <array_size>)
		break
	endif
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
	if ($current_section_array_entry >= <array_size>)
		break
	endif
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
	if playerinfoequals \{1
			part = bass}
		setsoundbussparams {leadgtr_balance = {vol = ($default_bussset.leadgtr_balance.vol)} time = 0.1}
		setsoundbussparams {bass_balance = {vol = ($default_bussset.bass_balance.vol)} time = 0.1}
	endif
	setsoundbussparams {drums_ingame = {vol = ($default_bussset.drums_ingame.vol)} time = 0.1}
endscript

script play_drum_sample_randomized \{pad = hihat
		velocity = 90}
	if gotparam \{chh_ride}
		v = RandomInteger (30.0, 45.0)
		play_drum_sample velocity = <v> pad = <pad>
	else
		p = RandomInteger (75.0, 110.0)
		play_drum_sample velocity = <p> pad = <pad>
	endif
endscript
