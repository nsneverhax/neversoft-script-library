
script ui_create_boot_attract 
	spawnscriptnow \{ui_boot_attract_spawned}
endscript

script ui_destroy_boot_attract 
	pausegame
	killspawnedscript \{name = ui_boot_attract_spawned}
	if screenelementexists \{id = current_menu}
		current_menu :die
	endif
	spawnscriptnow \{kill_gem_scroller}
	destroy_magazine_viewport
	setup_bg_viewport
	band_builder_clear_random_appearances
	reset_character_ids
	unpausegame
	spawnscriptnow \{attract_mode_ends_sound_script}
	spawnscriptlater \{undo_attract_bots}
	change \{is_attract_mode = 0}
	spawnscriptnow \{menu_music_on}
endscript

script undo_attract_bots 
	wait \{2
		gameframes}
	printf \{'undo_attract_bots'}
	change \{structurename = player1_status
		bot_play = 0}
	change \{structurename = player2_status
		bot_play = 0}
	change \{structurename = player3_status
		bot_play = 0}
	change \{structurename = player4_status
		bot_play = 0}
endscript

script ui_boot_attract_spawned 
	change \{is_attract_mode = 1}
	create_loading_screen
	spawnscriptnow \{attract_mode_start_sound_script}
	getarraysize \{$attract_mode_info}
	if (<array_size> = 1)
		attract_mode_index = 0
	else
		if ($last_attract_mode >= 0)
			getrandomvalue name = attract_mode_index integer a = 0 b = (<array_size> - 2)
			if (<attract_mode_index> >= $last_attract_mode)
				attract_mode_index = (<attract_mode_index> + 1)
			endif
		else
			getrandomvalue name = attract_mode_index integer a = 0 b = (<array_size> - 1)
		endif
		change last_attract_mode = <attract_mode_index>
	endif
	addparams ($attract_mode_info [<attract_mode_index>])
	change \{structurename = player1_status
		bot_play = 1}
	change \{structurename = player2_status
		bot_play = 1}
	change \{structurename = player3_status
		bot_play = 1}
	change \{structurename = player4_status
		bot_play = 1}
	change current_level = <level>
	change game_mode = <mode>
	change \{current_num_players = 4}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = bass}
	change \{structurename = player3_status
		part = drum}
	change \{structurename = player4_status
		part = vocals}
	change structurename = player1_status character_id = <guitar_character_id>
	change structurename = player2_status character_id = <bass_character_id>
	change structurename = player3_status character_id = <drum_character_id>
	change structurename = player4_status character_id = <vocals_character_id>
	p1_difficulty = expert
	p2_difficulty = expert
	destroy_band
	mark_unsafe_for_shutdown
	unpausegame
	load_venue
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
	stoprendering
	destroy_loading_screen
	get_handlers_for_all_buttons \{event_script = ui_boot_attract_wait_for_input}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		just = [left center]
		z_priority = 0
		event_handlers = <event_handlers>
	}
	createscreenelement \{type = textelement
		text = qs(0x71da7fc7)
		pos = (640.0, 637.0)
		parent = current_menu
		rgba = [
			220
			220
			220
			255
		]
		font = fontgrid_title_a1
		just = [
			center
			bottom
		]
		scale = 0.9
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			110
			20
			80
			250
		]}
	createscreenelement \{type = spriteelement
		parent = current_menu
		texture = logo_gh4_lor_256
		dims = (225.0, 225.0)
		pos = (640.0, 490.0)
		just = [
			center
			center
		]}
	launchevent \{type = focus
		target = current_menu}
	fadetoblack \{off
		alpha = 1.0
		time = 0.0
		z_priority = -100
		no_wait}
endscript

script ui_boot_attract_wait_for_input 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	wait_for_safe_shutdown
	ui_event \{event = menu_back}
endscript
0xbab3749d = [
	{
		level = load_z_scifi
		song = rebelyell
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = livingonaprayer
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = shiver
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = everlong
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = areyougonnagomyway
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = whativedone
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = spiderwebs
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = heartbreaker
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = santeria
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = eyeofthetiger
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = loveremovalmachine
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = lovemetwotimes
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
]
0x19e5f234 = [
	{
		level = load_z_scifi
		song = livingonaprayer
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = shiver
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = everlong
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = obstacle1
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = areyougonnagomyway
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = beatit
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = whativedone
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = spiderwebs
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
]
0xce07726c = [
	{
		level = load_z_scifi
		song = livingonaprayer
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = everlong
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = floaton
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = assassin
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = heartbreaker
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = thejoker
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_scifi
		song = lovemetwotimes
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_goth
		song = hotforteacher
		mode = p4_quickplay
		guitar_character_id = guitarist
		bass_character_id = bassist
		drum_character_id = drummer
		vocals_character_id = singer
	}
]
attract_mode_info = $0xbab3749d
last_attract_mode = -1
is_attract_mode = 0
