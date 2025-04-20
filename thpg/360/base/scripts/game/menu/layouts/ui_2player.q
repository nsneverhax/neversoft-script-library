
script ui_create_2player 
	printf "UI: ui_create_2player"
	SetShouldIgnoreUnboundControllers false
	load_level_handle_loading_screen
	killallmovies
	net_view_goals_create_searching_text id = loading_2player text = "Please Wait..." scale = 0.75 parent = root_window
	setsearchallassetcontexts
	if NOT screenelementexists id = movie_title
		createscreenelement {
			type = spriteelement
			parent = main_menu_bg
			id = movie_title
			texture = movie_title
			pos = (250.0, 275.0)
			rot_angle = -60
		}
	endif
	setsearchallassetcontexts off
	if NOT gotparam second_player
		cas_ensure_skater_loaded name = custom_story load_paks
		change_gamemode_freeskate_2p
	endif
	spawnscriptnow ui_create_2player_spawned params = <...>
endscript

script ui_create_2player_spawned 
	skater :SwitchOffBoard
	ui_create_2player_bg
	wait \{20
		gameframes}
	launch_select_skater_menu second_player = <second_player>
	if screenelementexists \{id = main_menu_bg}
		doscreenelementmorph \{id = main_menu_bg
			alpha = 0}
		if screenelementexists \{id = movie_title}
			destroyscreenelement \{id = movie_title}
		endif
	endif
	ui_destroy_background
	runscriptonscreenelement \{id = loading_2player
		net_view_goals_searching_fade_out_and_die}
	hideloadingscreen
endscript

script ui_destroy_2player 
	printf \{"UI: ui_destroy_2player"}
	generic_ui_destroy
endscript

script ui_create_2player_bg 
	printf 'UI: ui_create_2player_bg'
	setspawninstancelimits max = 1 management = ignore_spawn_request
	if viewportexists id = bg_viewport_2player
		ui_restart_2player_bg
		return
	endif
	killallmovies blocking
	createviewport {
		id = bg_viewport_2player
		priority = 5
		style = cutscene_movie_surface
	}
	setactivecamera id = skatercam0 viewport = bg_viewport_2player
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = bg_override_2player
		viewportid = bg_viewport_2player
		texture = `tex\Bink01.dds`
		texdict = `zones/z_mainmenu/z_mainmenu.tex`
	}
	setsearchallassetcontexts off
	playmovie {
		movie = 'skater_select'
		textureslot = 0
		texturepri = 0
		viewport = bg_viewport_2player
		nowait
	}
	playigccam {
		lockto = world
		pos = (-14.0732975, -5.5748167, -30.174664)
		quat = (0.003771, 0.9826829, -0.018605)
		fov = 74.0
		play_hold
	}
	begin
	if ismovieplaying textureslot = 0
		break
	endif
	wait 1 gameframe
	repeat
endscript

script ui_destroy_2player_bg 
	printf \{'UI: ui_destroy_2player_bg'}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if NOT viewportexists \{id = bg_viewport_2player}
		return
	endif
	killallmovies \{blocking}
	setsearchallassetcontexts
	destroyviewporttextureoverride \{id = bg_override_2player}
	setsearchallassetcontexts \{off}
	destroyviewport \{id = bg_viewport_2player}
endscript

script ui_restart_2player_bg 
	if viewportexists \{id = bg_viewport_2player}
		if NOT ismovieplaying \{textureslot = 0}
			if viewportexists \{id = bg_viewport_2player}
				playmovie \{movie = 'skater_select'
					textureslot = 0
					texturepri = 0
					viewport = bg_viewport_2player
					nowait}
			endif
		endif
	endif
endscript
