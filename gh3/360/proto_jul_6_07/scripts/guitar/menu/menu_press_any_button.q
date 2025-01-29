
script create_press_any_button_menu 
	soundevent \{event = menu_guitar_lick_sfx}
	spawnscriptnow \{menu_music_on
		params = {
			waitforguitarlick = 1
		}}
	create_menu_backdrop \{texture = bootup_copyright_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = pab_container
		pos = (0.0, 0.0)}
	menu_press_any_button_create_obvious_text
	spawnscriptnow \{check_for_any_input}
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	spawnscriptnow \{attract_mode_spawner}
endscript

script destroy_press_any_button_menu 
	destroy_menu \{menu_id = pab_container}
	destroy_menu_backdrop
	killspawnedscript \{name = check_for_any_input}
	killspawnedscript \{name = attract_mode_spawner}
endscript

script attract_mode_spawner 
	if notcd
		wait_time = 5
	else
		wait_time = 110
	endif
	begin
	printf "Wait_time for begin attract %i" i = <wait_time>
	if (<wait_time> = 0)
		break
	endif
	wait \{1
		second}
	wait_time = (<wait_time> - 1)
	repeat
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = enter_attract_mode
			play_sound = 0
		}}
endscript
attract_mode_info = [
	{
		level = load_z_artdeco
		song = paintitblack
		mode = p1_quickplay
		p1_character_id = johnny
		p2_character_id = judy
		p1_instrument_id = instrument_les_paul_black
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
	}
	{
		level = load_z_dive
		song = evenflow
		mode = p2_faceoff
		p1_character_id = axel
		p2_character_id = casey
		p1_instrument_id = instrument_les_paul_black
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
	}
	{
		level = load_z_wikker
		song = mynameisjonas
		mode = p2_faceoff
		p1_character_id = xavier
		p2_character_id = judy
		p1_instrument_id = instrument_les_paul_black
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
	}
]
last_attract_mode = -1
is_attract_mode = 0

script create_attract_mode 
	change is_attract_mode = 1
	create_loading_screen
	kill_start_key_binding
	getarraysize $attract_mode_info
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
	change structurename = player1_status bot_play = 1
	change structurename = player2_status bot_play = 1
	change current_level = <level>
	change game_mode = <mode>
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		change current_num_players = 2
	else
		change current_num_players = 1
	endif
	change structurename = player1_status character_id = <p1_character_id>
	change structurename = player2_status character_id = <p2_character_id>
	change structurename = player1_status instrument_id = <p1_instrument_id>
	change structurename = player2_status instrument_id = <p2_instrument_id>
	change is_shutdown_safe = 0
	unpausegame
	load_venue
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
	create_attract_mode_text
	stoprendering
	destroy_loading_screen
	spawnscriptnow check_for_attract_mode_input
endscript

script create_attract_mode_text 
	createscreenelement {
		type = containerelement
		parent = root_window
		id = am_container
		pos = (0.0, 0.0)
	}
	text = "PRESS ANY BUTTON TO ROCK..."
	text_pos = (640.0, 537.0)
	createscreenelement {
		type = textelement
		text = <text>
		pos = <text_pos>
		parent = am_container
		rgba = [220 220 220 255]
		font = fontgrid_title_gh3
		just = [center bottom]
		scale = 0.9
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [110 20 80 250]
	}
endscript

script destroy_attract_mode_text 
	destroy_menu \{menu_id = am_container}
endscript

script check_for_attract_mode_input 
	begin
	getbuttonspressed
	if NOT (<makes> = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin
	if ($is_shutdown_safe = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = exit_attract_mode
		}}
endscript

script destroy_attract_mode 
	pausegame
	destroy_attract_mode_text
	killspawnedscript \{name = check_for_attract_mode_input}
	kill_gem_scroller
	change \{structurename = player1_status
		bot_play = 0}
	change \{structurename = player2_status
		bot_play = 0}
	unpausegame
	kill_start_key_binding
	change \{is_attract_mode = 0}
endscript

script check_for_any_input 
	begin
	getbuttonspressed
	if (<makes> = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin
	getbuttonspressed
	if NOT (<makes> = 0)
		spawnscriptnow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = <device_num>}}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script menu_press_any_button_create_obvious_text 
	text = "PRESS ANY BUTTON TO ROCK..."
	text_pos = (670.0, 425.0)
	createscreenelement {
		type = textblockelement
		parent = pab_container
		font = text_a6
		text = <text>
		dims = (500.0, 200.0)
		pos = <text_pos>
		just = [left top]
		internal_just = [center top]
		rgba = [215 120 40 255]
		scale = 0.7
		allow_expansion
	}
endscript
