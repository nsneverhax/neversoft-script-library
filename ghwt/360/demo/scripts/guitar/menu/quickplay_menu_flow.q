
script quickplay_go_to_practice_setup 
	change \{came_to_practice_from = quickplay}
	change came_to_practice_difficulty = ($player1_status.difficulty)
	kill_gem_scroller
	change \{game_mode = training}
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
		get_progression_globals game_mode = ($game_mode)
		songlist = <tier_global>
		if ($band_mode_mode = none)
			set_random_single_player_quickplay
		endif
		quickplay_choose_random_venue <...>
	endif
	start_song {device_num = <device_num> starttime = <starttime> uselaststarttime = <uselaststarttime>}
endscript

script set_random_single_player_quickplay 
	if (($current_num_players) > 1)
		scriptassert \{'only meant for singleplayer'}
	endif
	cas_reset_random_human_picking
	i = 0
	begin
	formattext checksumname = player_status 'player%d_status' d = (<i> + 1)
	choice = Random (@ 0 @ 1 @ 2 )
	controller = ($<player_status>.controller)
	part = ($<player_status>.part)
	get_savegame_from_controller controller = <controller>
	if ((<choice> = 0) || (<part> = vocals))
		character_id = randomcharacter
	elseif (<choice> = 1)
		if NOT cas_get_random_car savegame = <savegame> controller = <controller>
			cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <part>
		endif
	else
		cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <part>
	endif
	change structurename = <player_status> character_id = <character_id>
	i = (<i> + 1)
	repeat $current_num_players
	cas_reset_random_human_picking
endscript

script quickplay_choose_random_venue 
	if NOT gotparam \{can_change_level}
		can_change_level = 1
	endif
	unlocked_levels = [load_z_scifi load_z_goth]
	getarraysize \{$levelzonearray}
	level_zone_array_size = <array_size>
	index = 0
	getarraysize <unlocked_levels>
	if (<can_change_level> = 1)
		if (<array_size> != 0)
			getrandomvalue a = 0 b = (<array_size> - 1) integer name = random_int
			change current_level = (<unlocked_levels> [<random_int>])
		else
			change \{current_level = load_z_bayou}
		endif
	endif
endscript
