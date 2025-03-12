
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
	change current_song = <song>
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
	assign_rockers
	p1_difficulty = easy
	p2_difficulty = easy
	destroy_band
	mark_unsafe_for_shutdown
	unpausegame
	load_venue
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
	stoprendering
	destroy_loading_screen
	get_handlers_for_all_buttons \{event_script = ui_boot_attract_wait_for_input}
	isgreatesthits
	if (<is_greatest_hits>)
		tex = gh_spirit_logo_eu
	else
		tex = gh_spirit_logo
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		just = [left center]
		z_priority = 0
		event_handlers = <event_handlers>
	}
	createscreenelement {
		type = textelement
		text = qs(0xea5afc2b)
		pos = (640.0, 647.0)
		parent = current_menu
		rgba = (($g_menu_colors).menu_white)
		font = fontgrid_bordello
		just = [center bottom]
		scale = 0.45000002
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).menu_shadow)}
	createscreenelement {
		type = spriteelement
		parent = current_menu
		texture = <tex>
		dims = (512.0, 256.0)
		pos = (640.0, 470.0)
		scale = 1.0
		just = [center center]
	}
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

script assign_rockers 
	current_rocker = [matty shirley marcus riki]
	getarraysize <current_rocker>
	i = 0
	begin
	begin
	valid_name = true
	rand_name = Random (@ axel @ casey @ izzy @ judy @ johnny @ lars @ midori @ clive @ pandora @ eddie )
	rand_name_singer = Random (@ axel @ izzy @ johnny @ lars @ clive @ eddie )
	j = 0
	begin
	if (<i> = 3)
		if ((<current_rocker> [<j>]) = <rand_name_singer>)
			<valid_name> = false
		endif
	else
		if ((<current_rocker> [<j>]) = <rand_name>)
			<valid_name> = false
		endif
	endif
	if (<i> = 0)
		break
	endif
	<j> = (<j> + 1)
	repeat <i>
	if (<valid_name> = true)
		if (<i> = 3)
			setarrayelement arrayname = current_rocker index = <i> newvalue = <rand_name_singer>
		else
			setarrayelement arrayname = current_rocker index = <i> newvalue = <rand_name>
		endif
		break
	endif
	repeat
	<i> = (<i> + 1)
	repeat <array_size>
	change structurename = player1_status character_id = (<current_rocker> [0])
	change structurename = player2_status character_id = (<current_rocker> [1])
	change structurename = player3_status character_id = (<current_rocker> [2])
	change structurename = player4_status character_id = (<current_rocker> [3])
endscript
attract_mode_info = [
	{
		level = load_z_icecap
		song = takemeout
		mode = p4_quickplay
	}
	{
		level = load_z_icecap
		song = woman
		mode = p4_quickplay
	}
	{
		level = load_z_icecap
		song = rockandrollallnite
		mode = p4_quickplay
	}
]
last_attract_mode = -1
is_attract_mode = 0
