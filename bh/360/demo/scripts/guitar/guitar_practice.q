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
			pad = tom2
			buss = practicemode_drums
		}
	}
	{
		midinote = 62
		scr = play_drum_sample
		params = {
			pad = tom2
			buss = practicemode_drums
		}
	}
	{
		midinote = 63
		scr = play_drum_sample
		params = {
			pad = tom1
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
			buss = drums_ingame_hats
			velocity = 50
		}
	}
	{
		midinote = 66
		scr = play_drum_sample
		params = {
			pad = hihat
			buss = drums_ingame_hats
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
practice_current_percentage = 0
practice_highest_percentage = 0

script practice_dummyfunction 
	printf \{qs(0x65bbc7fe)}
endscript

script practice_setup_notemappings 
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
endscript
practice_font = fontgrid_title_a1

script practicemode_init 
	printf \{channel = sfx
		qs(0x57d2e106)}
	setdspeffectparams \{effects = [
			{
				effect = sfxreverb
				name = venueverb
				bypass = true
			}
		]}
	change \{practice_current_percentage = 0}
	change \{practice_highest_percentage = 0}
	practice_setup_notemappings
	gman_songtool_getcurrentsong
	loaddrumkitall song = <current_song>
	hide_band
	createscreenelement \{type = containerelement
		parent = root_window
		id = practice_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = descinterface
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
	createscreenelement {
		type = textelement
		parent = practice_container
		id = practice_sectionpercentagetext
		scale = (0.8, 0.75)
		pos = <text_pos>
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 1
		just = [right top]
		z_priority = 3
		text = qs(0xf816244e)
	}
	createscreenelement {
		type = textelement
		parent = practice_container
		id = practice_sectionpercentagetext_highest
		scale = (0.33, 0.33)
		pos = (<text_pos> + (0.0, 66.0))
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
	practicedrums_fadein
	getfirstplayer
	if playerinfoequals <player> part = vocals
		return
	endif
	current_section_index = 0
	begin
	getsongtimems
	if (<time> > $current_starttime)
		practice_sectiontext :se_setprops section_text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :se_setprops \{text_alpha = 1.0
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
		practice_sectiontext :se_setprops \{text_alpha = 0.0
			time = 0.5}
		practicedrums_fadeout
		break
	elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :se_setprops \{text_alpha = 0.0
			time = 0.5}
		wait \{0.5
			second}
		practice_sectiontext :se_setprops section_text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :se_setprops \{text_alpha = 1.0
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
	setdspeffectparams \{effects = [
			{
				effect = sfxreverb
				name = venueverb
				bypass = false
			}
		]}
	clearnotemappings \{section = practice}
	killspawnedscript \{name = practicemode_section}
	if screenelementexists \{id = practice_container}
		destroyscreenelement \{id = practice_container}
	endif
	stopsoundsbybuss \{practicemode_drums}
	unhide_band
	hide_crowd_models \{active = false}
endscript

script reset_practice_mode 
	change \{current_speedfactor = 1.0}
	practicemode_deinit
	shut_down_practice_mode
	enable_crowd_models_cfunc \{active = true}
	change \{practice_enabled = 0}
	change \{disable_crowd = 0}
	change \{practice_start_time = 0}
	change \{practice_end_time = 0}
	change \{current_starttime = 0}
endscript
