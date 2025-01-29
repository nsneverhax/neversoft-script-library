practice_notemapping = [
	{
		midinote = 60
		scr = soundevent
		params = {
			event = practice_mode_kick
		}
	}
	{
		midinote = 61
		scr = soundevent
		params = {
			event = practice_mode_tom3
		}
	}
	{
		midinote = 62
		scr = soundevent
		params = {
			event = practice_mode_tom2
		}
	}
	{
		midinote = 63
		scr = soundevent
		params = {
			event = practice_mode_tom1
		}
	}
	{
		midinote = 64
		scr = soundevent
		params = {
			event = practice_mode_snare
		}
	}
	{
		midinote = 65
		scr = soundevent
		params = {
			event = practice_mode_hihatclosed
		}
	}
	{
		midinote = 66
		scr = soundevent
		params = {
			event = practice_mode_hihatopen
		}
	}
	{
		midinote = 67
		scr = soundevent
		params = {
			event = practice_mode_ride
		}
	}
	{
		midinote = 68
		scr = soundevent
		params = {
			event = practice_mode_crash1
		}
	}
	{
		midinote = 69
		scr = soundevent
		params = {
			event = practice_mode_crash2
		}
	}
]

script practice_dummyfunction 
	printf \{"Practice_DummyFunction"}
endscript
practice_font = fontgrid_title_gh3

script practicemode_init 
	if NOT ($current_speedfactor = 1.0)
		setnotemappings \{section = drums
			mapping = $practice_notemapping}
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
	current_section_index = 0
	begin
	getsongtimems
	if (<time> > $current_starttime)
		practice_sectiontext :setprops text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :domorph \{alpha = 1.0
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
		practice_sectiontext :domorph \{alpha = 0.0
			time = 0.5}
		break
	elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :domorph \{alpha = 0.0
			time = 0.5}
		wait \{0.5
			second}
		practice_sectiontext :setprops text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :domorph \{alpha = 1.0
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
endscript
