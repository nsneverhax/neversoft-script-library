
script quickplay_go_to_practice_setup 
	change \{came_to_practice_from = quickplay}
	getfirstplayer
	getplayerinfo <player> difficulty
	kill_gem_scroller
	change \{game_mode = practice}
endscript

script quickplay_song_select_quit 
	gh3_sfx_fail_song_stop_sounds
	kill_gem_scroller
endscript

script get_total_num_venues 
	printf \{qs(0xd6d5303d)}
	array_entry = 0
	begin
	if NOT get_valid_venue_index venue_index = <array_entry>
		break
	endif
	get_levelzonearray_checksum index = <index>
	printf ($levelzones.<level_checksum>.name)
	<array_entry> = (<array_entry> + 1)
	repeat
	return num_venues = <array_entry>
endscript

script get_valid_venue_index 
	get_levelzonearray_size
	index = 0
	begin
	get_levelzonearray_checksum index = <index>
	valid = 1
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name)
	getglobaltags <venue_checksum>
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
	repeat <array_size>
	return \{false}
endscript

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

script quickplay_choose_random_venue 
	if NOT gotparam \{can_change_level}
		can_change_level = 1
	endif
	if demobuild \{0x52e0628e}
		change current_level = ($0x4ef6283c)
	elseif globalexists \{name = force_random_venue}
		change current_level = ($force_random_venue)
	else
		unlocked_levels = []
		getarraysize \{$levelzonearray}
		level_zone_array_size = <array_size>
		index = 0
		begin
		get_levelzonearray_checksum index = <index>
		if NOT structurecontains structure = ($levelzones.<level_checksum>) debug_only
			formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name)
			if gotparam \{all}
				add_venue = 1
			else
				getglobaltags <venue_checksum> param = unlocked
				add_venue = 0
				if (<unlocked> = 1)
					add_venue = 1
				endif
				if structurecontains structure = $g_levels_to_remove_from_random_rotation ($levelzones.<level_checksum>.zone)
					add_venue = 0
				endif
			endif
			if (<add_venue> = 1)
				addarrayelement array = <unlocked_levels> element = <level_checksum>
				<unlocked_levels> = <array>
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		randomize
		printf \{'Picking from these venues'}
		printstruct <unlocked_levels>
		getarraysize <unlocked_levels>
		if (<can_change_level> = 1)
			if (<array_size> != 0)
				getrandomvalue a = 0 b = (<array_size> - 1) integer name = random_int
				change current_level = (<unlocked_levels> [<random_int>])
			else
				change \{current_level = load_z_cairo}
			endif
		endif
	endif
endscript
