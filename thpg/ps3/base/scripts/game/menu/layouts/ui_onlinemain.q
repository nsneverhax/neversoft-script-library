
script ui_create_onlinemain 
	printf "UI: ui_create_onlinemain"
	pause_menu_fmv_play
	if isxenon
		make_cas_menu {
			title = "Xbox LIVE"
			pausemenu
			back_state = uistate_mainmenu
		}
	else
		make_cas_menu {
			title = "online"
			pausemenu
			back_state = uistate_mainmenu
		}
	endif
	add_cas_menu_item {
		text = "ONLINE PLAY"
		pad_choose_script = ui_onlinemain_destroy_and_signin
	}
	add_next_menu_item {
		text = "LEADERBOARDS"
		choose_state = uistate_leaderboard
	}
	add_cas_menu_item {
		text = "BACK"
		choose_state = uistate_mainmenu
	}
	cas_menu_finish
endscript

script ui_destroy_onlinemain 
	printf \{"UI: ui_destroy_onlinemain"}
	generic_ui_destroy
endscript

script ui_onlinemain_destroy_and_signin 
	generic_ui_destroy
	check_for_signin {
		no_signin_check
		change_gamemode = change_gamemode_net
		do_loading_logo
	}
	if screenelementexists id = online_save_bg
		destroyscreenelement id = online_save_bg
	endif
	createscreenelement {
		type = containerelement
		id = online_save_bg
		parent = root_window
	}
	tilesprite {
		texture = map_bg_news
		parent = online_save_bg
		tile_dims = (1280.0, 720.0)
		dims = (250.0, 250.0)
		pos = (0.0, 0.0)
		sprite_props = {rgba = [150 70 70 255]}
		container_props = {z_priority = -30.0}
	}
	setsearchallassetcontexts
	createscreenelement {
		type = spriteelement
		parent = online_save_bg
		texture = movie_title
		pos = (250.0, 275.0)
		rot_angle = -60
		z_priority = -28
	}
	setsearchallassetcontexts off
endscript
