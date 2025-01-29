
script quickplay_start_song \{device_num = 0}
	printf \{qs(0x8c9f7873)}
	if ($autolaunch_startnow = 0 &&
			$autotest_on = 0 &&
			$end_credits = 0)
		Change current_level = ($g_band_lobby_current_level)
	endif
	start_song {device_num = <device_num> starttime = <starttime> uselaststarttime = <uselaststarttime>}
endscript
g_levels_to_remove_from_random_rotation = {
}

script quickplay_choose_random_venue \{allow_current_venue = true
		keep_current_if_none_available = FALSE}
	if NOT GotParam \{can_change_level}
		can_change_level = 1
	endif
	if demobuild
		Change current_level = ($g_demo_venue_load)
	elseif GlobalExists \{Name = force_random_venue}
		Change current_level = ($force_random_venue)
	else
		unlocked_levels = []
		GetArraySize \{$LevelZoneArray}
		level_zone_array_size = <array_Size>
		index = 0
		begin
		get_LevelZoneArray_checksum index = <index>
		if is_venue_unlocked venue = <level_checksum> savegame = <savegame>
			<add_venue> = 1
			if StructureContains structure = $g_levels_to_remove_from_random_rotation ($LevelZones.<level_checksum>.zone)
				<add_venue> = 0
			endif
		else
			<add_venue> = 0
		endif
		if (<allow_current_venue> = FALSE)
			if (<add_venue> = 1)
				if ($current_level = <level_checksum>)
					add_venue = 0
				endif
			endif
		endif
		if (<add_venue> = 1)
			AddArrayElement array = <unlocked_levels> element = <level_checksum>
			<unlocked_levels> = <array>
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
		randomize
		printf 'Picking from these venues - rand seed = %r' r = <rand_seed>
		printstruct <unlocked_levels>
		GetArraySize <unlocked_levels>
		if (<can_change_level> = 1)
			if (<array_Size> != 0)
				GetRandomValue a = 0 b = (<array_Size> - 1) integer Name = random_int
				Change current_level = (<unlocked_levels> [<random_int>])
			elseif (<keep_current_if_none_available> = FALSE)
				Change current_level = ($default_venue)
			endif
		endif
	endif
endscript
