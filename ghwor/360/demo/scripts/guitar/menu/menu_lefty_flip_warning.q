lefty_flip_warning_menu_font = fontgrid_title_a1

script create_lefty_flip_warning_menu 
	disable_pause
	player_device = ($last_start_pressed_device)
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> controller
		if (<controller> = <player_device>)
			break
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	<player> = <player_selected>
	create_dialog_box {
		body_text = qs(0x380c84a8)
		player_device = <player_device>
		no_background
		options = [
			{
				func = lefty_flip_warning_go_back
				text = qs(0xf7723015)
			}
			{
				func = menu_lefty_flip_warning_select_yes
				func_params = {player = <player>}
				text = qs(0xb8790f2f)
			}
		]
	}
endscript

script lefty_flip_warning_go_back 
	enable_pause
	generic_event_back \{nosound}
endscript

script destroy_lefty_flip_warning_menu 
	destroy_dialog_box
endscript

script menu_lefty_flip_warning_select_yes 
	gamemode_gettype
	if (<type> != tutorial)
		stoprendering
	endif
	generic_event_back \{nosound
		state = uistate_gameplay}
	resetscoreupdateready
	gamemode_gettype
	if (<type> = quickplay)
		quickplay_unload_challenges
	endif
	getplayerinfo <player> lefty_flip
	if (<lefty_flip> = 1)
		new_flip = 0
		if (<player> = 1)
			change \{pad_event_up_inversion = true}
		endif
	else
		new_flip = 1
		if (<player> = 1)
			change \{pad_event_up_inversion = false}
		endif
	endif
	setplayerinfo <player> lefty_flip = <new_flip>
	<player_num> = 1
	begin
	getplayerinfo player = <player_num> controller
	getplayerinfo player = <player_num> lefty_flip
	getplayerinfo player = <player_num> part
	if (<part> != vocals)
		if ((<part> = guitar) || (<part> = bass))
			save_progression_instrument_user_option part = guitar controller = <controller> option = 'lefty_flip' new_value = <lefty_flip>
			save_progression_instrument_user_option part = bass controller = <controller> option = 'lefty_flip' new_value = <lefty_flip>
		else
			save_progression_instrument_user_option part = <part> controller = <controller> option = 'lefty_flip' new_value = <lefty_flip>
		endif
	endif
	<player_num> = (<player_num> + 1)
	repeat 4
	audio_gameplay_fail_song_stop_sounds
	audio_stopping_sounds_killsong_lite
	stopsoundsbybuss \{encore_events}
	monitorcontrollerstates
	spawnscriptnow lefty_flip_func params = {player = <player>}
endscript
