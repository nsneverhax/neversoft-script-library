
script quickplay_start_song \{device_num = 0}
	printf \{qs(0x8c9f7873)}
	if ($autolaunch_startnow = 0 &&
			$autotest_on = 0 &&
			$end_credits = 0)
		change current_level = ($g_band_lobby_current_level)
	endif
	start_song {device_num = <device_num> starttime = <starttime> uselaststarttime = <uselaststarttime>}
endscript
g_levels_to_remove_from_random_rotation = {
}

script quickplay_choose_random_venue \{allow_current_venue = true
		keep_current_if_none_available = false}
	if NOT gotparam \{can_change_level}
		can_change_level = 1
	endif
	if demobuild
		change current_level = ($g_demo_venue_load)
	elseif globalexists \{name = force_random_venue}
		change current_level = ($force_random_venue)
	else
		unlocked_levels = []
		getarraysize \{$levelzonearray}
		level_zone_array_size = <array_size>
		index = 0
		begin
		get_levelzonearray_checksum index = <index>
		if is_venue_unlocked venue = <level_checksum> savegame = <savegame>
			<add_venue> = 1
			if structurecontains structure = $g_levels_to_remove_from_random_rotation ($levelzones.<level_checksum>.zone)
				<add_venue> = 0
			endif
		else
			<add_venue> = 0
		endif
		if (<allow_current_venue> = false)
			if (<add_venue> = 1)
				if ($current_level = <level_checksum>)
					add_venue = 0
				endif
			endif
		endif
		if (<add_venue> = 1)
			addarrayelement array = <unlocked_levels> element = <level_checksum>
			<unlocked_levels> = <array>
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		randomize
		printf 'Picking from these venues - rand seed = %r' r = <rand_seed>
		printstruct <unlocked_levels>
		getarraysize <unlocked_levels>
		if (<can_change_level> = 1)
			if (<array_size> != 0)
				getrandomvalue a = 0 b = (<array_size> - 1) integer name = random_int
				change current_level = (<unlocked_levels> [<random_int>])
			elseif (<keep_current_if_none_available> = false)
				change current_level = ($default_venue)
			endif
		endif
	endif
endscript
