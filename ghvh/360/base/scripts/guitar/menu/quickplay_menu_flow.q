
script quickplay_go_to_practice_setup 
	Change \{came_to_practice_from = quickplay}
	Change came_to_practice_difficulty = ($player1_status.difficulty)
	kill_gem_scroller
	Change \{game_mode = training}
endscript

script quickplay_song_select_quit 
	GH3_SFX_fail_song_stop_sounds
	kill_gem_scroller
endscript

script get_total_num_venues 
	printf \{qs(0xd6d5303d)}
	array_entry = 0
	begin
	if NOT get_valid_venue_index venue_index = <array_entry>
		break
	endif
	get_LevelZoneArray_checksum index = <index>
	printf ($LevelZones.<level_checksum>.Name)
	<array_entry> = (<array_entry> + 1)
	repeat
	return num_venues = <array_entry>
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

script quickplay_start_song \{device_num = 0}
	printf \{qs(0x8c9f7873)}
	if ($autolaunch_startnow = 0 &&
			$autotest_on = 0 &&
			$end_credits = 0)
		get_progression_globals game_mode = ($game_mode)
		SongList = <tier_global>
		if ($band_mode_mode = None && $current_num_players = 1)
			set_random_single_player_quickplay
		endif
		quickplay_choose_random_venue <...>
	endif
	start_song {device_num = <device_num> starttime = <starttime> uselaststarttime = <uselaststarttime>}
endscript

script set_random_single_player_quickplay 
	if (($current_num_players) > 1)
		ScriptAssert \{'only meant for singleplayer'}
	endif
	cas_reset_random_human_picking
	i = 0
	begin
	formatText checksumName = player_status 'player%d_status' d = (<i> + 1)
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
	Change structurename = <player_status> character_id = <character_id>
	i = (<i> + 1)
	repeat $current_num_players
	cas_reset_random_human_picking
endscript

script quickplay_choose_random_venue 
	if NOT GotParam \{can_change_level}
		if ($autolaunch_startnow = 0)
			can_change_level = 1
		else
			can_change_level = 0
		endif
	endif
	unlocked_levels = []
	GetArraySize \{$LevelZoneArray}
	level_zone_array_size = <array_Size>
	index = 0
	begin
	get_LevelZoneArray_checksum index = <index>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
		GetGlobalTags <venue_checksum> param = unlocked
		add_venue = 0
		if (<unlocked> = 1)
			add_venue = 1
		endif
		if (<level_checksum> = load_z_studio2)
			add_venue = 0
		endif
		if (<add_venue> = 1)
			AddArrayElement array = <unlocked_levels> element = <level_checksum>
			<unlocked_levels> = <array>
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	GetArraySize <unlocked_levels>
	if (<can_change_level> = 1)
		if (<array_Size> != 0)
			printstruct {} levels = <unlocked_levels> channel = what
			begin
			GetRandomValue a = 0 b = (<array_Size> - 1) integer Name = random_int
			printstruct qs(0x44a00144) a = <random_int> channel = what
			repeat 20
			Change current_level = (<unlocked_levels> [<random_int>])
		else
			Change \{current_level = load_z_s_stage}
		endif
	endif
endscript
