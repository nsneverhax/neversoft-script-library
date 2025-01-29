
script 0x587a82d3 
	begin
	getrandomarrayelement \{$gh5_songlist}
	<current_song> = <element>
	if ($current_song != <current_song>)
		break
	endif
	repeat
	Change current_song = <current_song>
	get_song_struct song = ($current_song)
	if StructureContains structure = <song_struct> Name = 0x59cb4f1c
		0x59cb4f1c = (<song_struct>.0x59cb4f1c)
		level_checksum = ($current_level)
		formatText checksumName = venue_checksum 'load_%s' s = ($LevelZones.<level_checksum>.Name)
		if NOT ArrayContains array = $<0x59cb4f1c> contains = <venue_checksum>
			quickplay_choose_random_venue
		endif
	endif
	return 0x72fa1922 = <current_song>
endscript

script quickplay_go_to_practice_setup 
	Change \{came_to_practice_from = quickplay}
	Change came_to_practice_difficulty = ($player1_status.difficulty)
	kill_gem_scroller
	Change \{game_mode = practice}
endscript

script quickplay_song_select_quit 
	GH3_SFX_fail_song_stop_sounds
	kill_gem_scroller
endscript
force_quickplay_guitarist = None

script quickplay_start_song \{device_num = 0}

	if (($current_num_players) = 1)
		Change \{structurename = player1_status
			character_id = randomcharacter}
		if NOT ($force_quickplay_guitarist = None)
			Change structurename = player1_status character_id = ($force_quickplay_guitarist)
		endif
	endif
	if ($autolaunch_startnow = 0 &&
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

	endif
	cas_reset_random_human_picking
	i = 0
	begin
	<player_status> = ($0x2994109a [<i> + 1])
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
g_levels_to_remove_from_random_rotation = {
}

script quickplay_choose_random_venue 
	if NOT GotParam \{can_change_level}
		can_change_level = 1
	endif
	if ($current_song = jamsession)
		Change \{current_level = load_z_studio}
	else
		if ($0x1fac9708 != None)
			0x8dbdaee4 \{qs(0xb84deb68)}
			Change current_level = ($0x1fac9708)
		else
			get_song_struct song = ($current_song)
			if StructureContains structure = <song_struct> Name = 0x59cb4f1c
				0x59cb4f1c = (<song_struct>.0x59cb4f1c)
				GetArraySize $<0x59cb4f1c>
				GetRandomValue a = 0 b = (<array_Size> -1) Name = random_venue_index integer
				Change current_level = (($<0x59cb4f1c>) [<random_venue_index>])
				song = ($current_song)
				begin
				level_checksum = ($current_level)
				formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
				GetGlobalTags <venue_checksum> param = unlocked
				if (<unlocked> = 1)
					break
				endif
				GetArraySize $<0x59cb4f1c>
				GetRandomValue a = 0 b = (<array_Size> -1) Name = random_venue_index integer
				Change current_level = (($<0x59cb4f1c>) [<random_venue_index>])
				repeat
			else
				Change \{current_level = load_z_subway}
			endif
		endif
	endif
endscript
