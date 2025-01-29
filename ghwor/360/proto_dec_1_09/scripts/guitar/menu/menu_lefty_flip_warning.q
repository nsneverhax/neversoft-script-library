lefty_flip_warning_menu_font = fontgrid_title_a1

script create_lefty_flip_warning_menu 
	disable_pause
	player_device = ($last_start_pressed_device)
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> controller
		if (<controller> = <player_device>)
			break
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	<Player> = <player_selected>
	create_dialog_box {
		body_text = qs(0x2ba14213)
		player_device = <player_device>
		no_background
		options = [
			{
				func = lefty_flip_warning_go_back
				text = qs(0xf7723015)
			}
			{
				func = menu_lefty_flip_warning_select_yes
				func_params = {Player = <Player>}
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
	reset_song_loading_hack_global
	gamemode_gettype
	if (<Type> != tutorial)
		StopRendering
	endif
	generic_event_back \{nosound
		state = Uistate_gameplay}
	resetscoreupdateready
	getplayerinfo <Player> lefty_flip
	if (<lefty_flip> = 1)
		new_flip = 0
		if (<Player> = 1)
			Change \{pad_event_up_inversion = true}
		endif
	else
		new_flip = 1
		if (<Player> = 1)
			Change \{pad_event_up_inversion = FALSE}
		endif
	endif
	setplayerinfo <Player> lefty_flip = <new_flip>
	<player_num> = 1
	begin
	getplayerinfo Player = <player_num> controller
	getplayerinfo Player = <player_num> lefty_flip
	getplayerinfo Player = <player_num> part
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
	StopSoundsByBuss \{Encore_Events}
	monitorcontrollerstates
	SpawnScriptNow lefty_flip_func params = {Player = <Player>}
endscript
