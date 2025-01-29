
script getsolostarttime 
	if GotParam \{song}
		time = 9000000
		if StructureContains structure = $drum_solo_structs Name = <song>
			GetArraySize ($drum_solo_structs.<song>.events)
			index = 0
			begin
			if StructureContains structure = ($drum_solo_structs.<song>.events [<index>]) Name = time
				thistime = ($drum_solo_structs.<song>.events [<index>].time)
				if (<thistime> < <time>)
					time = <thistime>
				endif
			endif
			index = (<index> + 1)
			repeat <array_Size>
		endif
		if (<time> < 9000000)
			return starttime = (<time> - 1000)
		endif
	endif
endscript

script drum_solo_fadeout 
	printf \{qs(0x8e5b576f)}
	printstruct <...>
	if GotParam \{target}
		params = {time = (<dur> / 1000.0)}
		AddParam structure_name = params Name = <target> value = {vol_percent = 0}
		setsoundbussparams <params>
	endif
endscript

script drum_solo_fadein 
	printf \{qs(0xe17504ff)}
	printstruct <...>
	if GotParam \{target}
		params = {time = (<dur> / 1000.0)}
		AddParam structure_name = params Name = <target> value = {vol_percent = 100}
		setsoundbussparams <params>
	endif
endscript

script drum_solo_crowd 
	printf \{qs(0x1ca809b2)}
	SpawnScriptNow \{drum_solo_crowd_spawned}
endscript

script drum_solo_crowd_spawned 
	play_a_short_crowd_swell_for_this_venue
	gh3_adjustcrowdfastbigsurge
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good}
	One_Shot_SoundEvent \{SoundEvent = $current_crowd_oneshot_positive_soundevent
		waitTime = 2}
endscript

script drum_solo_start_crowd_sfx 
	printf \{qs(0xeba6e86a)}
	play_a_short_crowd_swell_for_this_venue
	SpawnScriptNow drum_solo_crowd_spawned_building_intensity params = {solo_length = <solo_length>}
	SpawnScriptNow \{drum_solo_temp_hack_crowd_claps}
	SpawnScriptNow \{drum_solo_random_crowd_swells}
endscript

script drum_solo_random_crowd_swells 
	Wait \{0.6
		Seconds}
	begin
	Random (
		@ play_a_short_crowd_swell_for_this_venue
		Wait \{0.3
			Seconds}
		@ play_a_med_crowd_swell_for_this_venue
		Wait \{0.7
			Seconds}
		@ Wait \{0.3
			Seconds}
		@ Wait \{0.5
			Seconds}
		@ Wait \{0.2
			Seconds}
		)
	repeat
endscript

script drum_solo_crowd_spawned_building_intensity 
	setsoundbussparams {Default = {vol = (($default_BussSet.Default.vol) + 6.5)} time = 0.5}
	solo_in_seconds = (<solo_length> / 1000.0)
	waittime_to_start_long_surge = (<solo_in_seconds> / 2)
	Wait <waittime_to_start_long_surge> Seconds
	KillSpawnedScript \{Name = drum_solo_random_crowd_swells}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 8)} time = <waittime_to_start_long_surge>}
endscript

script drum_solo_temp_hack_crowd_claps 
endscript

script drum_solo_crowd_reset 
	printf \{qs(0xfda6f815)}
	setsoundbussparams {Default = {vol = ($default_BussSet.Default.vol)} time = 0.02}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) + 8)} time = <waittime_to_start_long_surge>}
endscript

script drum_solo_warning 
	hud_create_message \{Player = 1
		text = qs(0x9967309b)
		Priority = 1}
	Wait \{1
		Second}
	hud_create_message \{Player = 1
		text = qs(0xd626a65c)
		Priority = 2}
	Wait \{1
		Second}
	hud_create_message \{Player = 1
		text = qs(0xcf3d971d)
		Priority = 3}
	Wait \{1
		Second}
	hud_create_message \{Player = 1
		text = qs(0xe410c4de)
		Priority = 4}
	Wait \{1
		Second}
	hud_create_message \{Player = 1
		text = qs(0x00000000)
		Priority = 5}
endscript

script drum_solo_start_anim 
	band_playclip \{clip = d_solomoment01_crazytrain
		startframe = 1}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_moments'
		changenow
		Name = moment01}
	Change \{CameraCuts_AllowNoteScripts = FALSE}
	LightShow_SetTime \{time = 0}
	LightShow_SetParams \{mood = blackout}
	lightshow_spotlightcolor \{Color = white}
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
			GUITARIST
			BASSIST
			drummer
		]}
	LightShow_EnableSpotlights \{Enabled = true
		spots = [
			drummer
		]}
endscript

script drum_solo_stop_anim 
	Change \{CameraCuts_AllowNoteScripts = true}
endscript
