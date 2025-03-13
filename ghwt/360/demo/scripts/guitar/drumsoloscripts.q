
script getsolostarttime 
	if gotparam \{song}
		time = 9000000
		if structurecontains structure = $drum_solo_structs name = <song>
			getarraysize ($drum_solo_structs.<song>.events)
			index = 0
			begin
			if structurecontains structure = ($drum_solo_structs.<song>.events [<index>]) name = time
				thistime = ($drum_solo_structs.<song>.events [<index>].time)
				if (<thistime> < <time>)
					time = <thistime>
				endif
			endif
			index = (<index> + 1)
			repeat <array_size>
		endif
		if (<time> < 9000000)
			return starttime = (<time> - 1000)
		endif
	endif
endscript

script drum_solo_fadeout 
	printf \{qs(0x8e5b576f)}
	printstruct <...>
	if gotparam \{target}
		params = {time = (<dur> / 1000.0)}
		addparam structure_name = params name = <target> value = {vol_percent = 0}
		setsoundbussparams <params>
	endif
endscript

script drum_solo_fadein 
	printf \{qs(0xe17504ff)}
	printstruct <...>
	if gotparam \{target}
		params = {time = (<dur> / 1000.0)}
		addparam structure_name = params name = <target> value = {vol_percent = 100}
		setsoundbussparams <params>
	endif
endscript

script drum_solo_crowd 
	printf \{qs(0x1ca809b2)}
	spawnscriptnow \{drum_solo_crowd_spawned}
endscript

script drum_solo_crowd_spawned 
	play_a_short_crowd_swell_for_this_venue
	gh3_adjustcrowdfastbigsurge
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good}
	one_shot_soundevent \{soundevent = $current_crowd_oneshot_positive_soundevent
		waittime = 2}
endscript

script drum_solo_start_crowd_sfx 
	printf \{qs(0xeba6e86a)}
	play_a_short_crowd_swell_for_this_venue
	spawnscriptnow drum_solo_crowd_spawned_building_intensity params = {solo_length = <solo_length>}
	spawnscriptnow \{drum_solo_temp_hack_crowd_claps}
	spawnscriptnow \{drum_solo_random_crowd_swells}
endscript

script drum_solo_random_crowd_swells 
	wait \{0.6
		seconds}
	begin
	Random (
		@ play_a_short_crowd_swell_for_this_venue
		wait \{0.3
			seconds}
		@ play_a_med_crowd_swell_for_this_venue
		wait \{0.7
			seconds}
		@ wait \{0.3
			seconds}
		@ wait \{0.5
			seconds}
		@ wait \{0.2
			seconds}
		)
	repeat
endscript

script drum_solo_crowd_spawned_building_intensity 
	setsoundbussparams {`default` = {vol = (($default_bussset.`default`.vol) + 6.5)} time = 0.5}
	solo_in_seconds = (<solo_length> / 1000.0)
	waittime_to_start_long_surge = (<solo_in_seconds> / 2)
	wait <waittime_to_start_long_surge> seconds
	killspawnedscript \{name = drum_solo_random_crowd_swells}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 8)} time = <waittime_to_start_long_surge>}
endscript

script drum_solo_temp_hack_crowd_claps 
endscript

script drum_solo_crowd_reset 
	printf \{qs(0xfda6f815)}
	setsoundbussparams {`default` = {vol = ($default_bussset.`default`.vol)} time = 0.02}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) + 8)} time = <waittime_to_start_long_surge>}
endscript

script drum_solo_warning 
	hud_create_message \{player = 1
		text = qs(0x9967309b)
		priority = 1}
	wait \{1
		second}
	hud_create_message \{player = 1
		text = qs(0xd626a65c)
		priority = 2}
	wait \{1
		second}
	hud_create_message \{player = 1
		text = qs(0xcf3d971d)
		priority = 3}
	wait \{1
		second}
	hud_create_message \{player = 1
		text = qs(0xe410c4de)
		priority = 4}
	wait \{1
		second}
	hud_create_message \{player = 1
		text = qs(0x00000000)
		priority = 5}
endscript

script drum_solo_start_anim 
	band_playclip \{clip = d_solomoment01_crazytrain
		startframe = 1}
	cameracuts_setarrayprefix \{prefix = 'cameras_moments'
		changenow
		name = moment01}
	change \{cameracuts_allownotescripts = false}
	lightshow_settime \{time = 0}
	lightshow_setparams \{mood = blackout}
	lightshow_spotlightcolor \{color = white}
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
			guitarist
			bassist
			drummer
		]}
	lightshow_enablespotlights \{enabled = true
		spots = [
			drummer
		]}
endscript

script drum_solo_stop_anim 
	change \{cameracuts_allownotescripts = true}
endscript
