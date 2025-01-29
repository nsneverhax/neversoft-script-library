
script quickplay_go_to_practice_setup 
	Change \{came_to_practice_from = quickplay}
	getfirstplayer
	getplayerinfo <Player> difficulty
	Change came_to_practice_difficulty = <difficulty>
	kill_gem_scroller
	Change \{game_mode = practice}
endscript

script quickplay_song_select_quit 
	ScriptAssert \{'quickplay_song_select_quit: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script get_total_num_venues 
	ScriptAssert \{'get_total_num_venues: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script get_valid_venue_index 
	get_LevelZoneArray_size
	index = 0
	begin
	get_LevelZoneArray_checksum index = <index>
	valid = 1
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
	GetGlobalTags <venue_checksum>
	if NOT (<unlocked> = 1)
		valid = 0
	endif
	if (<valid> = 1)
		if (<venue_index> = 0)
			return index = <index> true
		endif
		venue_index = (<venue_index> - 1)
	endif
	index = (<index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript
force_quickplay_guitarist = None

script quickplay_start_song \{device_num = 0}
	printf \{qs(0x8c9f7873)}
	if NOT GotParam \{can_change_level}
		can_change_level = 1
	endif
	if ($autolaunch_startnow = 0 &&
			$end_credits = 0)
		Change current_level = ($g_band_lobby_current_level)
		if ($debug_level_load = 1)
			Change \{current_level = $debug_current_level}
		endif
	endif
	if NOT (($quickplay_venue) = None)
		Change current_level = ($quickplay_venue)
	endif
	if ($current_level = load_z_newyork)
		Change \{current_level = load_z_cathedral}
	endif
	if ($debug_encore)
		Progression_SetProgressionNodeFlags
	endif
	start_song {device_num = <device_num> starttime = <starttime> uselaststarttime = <uselaststarttime>}
endscript
debug_level_load = 0
debug_current_level = None
force_random_venue = None
g_levels_to_remove_from_random_rotation = {
	z_norway
	z_freestyle
	z_visualizer
}

script quickplay_choose_random_venue 
	if ($smoketestisrunning = true)
		Change \{force_random_venue = load_z_paris}
	endif
	if NOT GotParam \{can_change_level}
		can_change_level = 1
	endif
	if (($force_random_venue) != None)
		Change current_level = ($force_random_venue)
	else
		unlocked_levels = []
		GetArraySize \{$LevelZoneArray}
		level_zone_array_size = <array_Size>
		index = 0
		begin
		get_LevelZoneArray_checksum index = <index>
		if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
			formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
			if GotParam \{all}
				add_venue = 1
			else
				GetGlobalTags <venue_checksum> param = unlocked
				add_venue = 0
				if (<unlocked> = 1)
					add_venue = 1
				endif
				if ($LevelZoneArray [<index>] = load_z_freestyle)
					add_venue = 0
				endif
				if StructureContains structure = $g_levels_to_remove_from_random_rotation ($LevelZones.<level_checksum>.zone)
					add_venue = 0
				endif
			endif
			if (<add_venue> = 1)
				AddArrayElement array = <unlocked_levels> element = <level_checksum>
				<unlocked_levels> = <array>
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
		randomize
		printf \{'Picking from these venues'}
		printstruct <unlocked_levels>
		GetArraySize <unlocked_levels>
		if (<can_change_level> = 1)
			if (<array_Size> != 0)
				GetRandomValue a = 0 b = (<array_Size> - 1) integer Name = random_int
				Change current_level = (<unlocked_levels> [<random_int>])
			else
				Change \{current_level = load_z_cairo}
			endif
		endif
	endif
endscript
