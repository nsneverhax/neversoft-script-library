lefty_flip_warning_menu_font = fontgrid_title_a1

script create_lefty_flip_warning_menu 
	disable_pause
	player_device = ($last_start_pressed_device)
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> controller
		if (<controller> = <player_device>)
			break
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	<player> = <player_selected>
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
	reset_song_loading_hack_global
	GameMode_GetType
	if (<type> != tutorial)
		StopRendering
	endif
	generic_event_back \{nosound
		state = uistate_gameplay}
	ResetScoreUpdateReady
	GetPlayerInfo <player> lefty_flip
	if (<lefty_flip> = 1)
		new_flip = 0
		if (<player> = 1)
			Change \{pad_event_up_inversion = true}
		endif
	else
		new_flip = 1
		if (<player> = 1)
			Change \{pad_event_up_inversion = false}
		endif
	endif
	SetPlayerInfo <player> lefty_flip = <new_flip>
	<player_num> = 1
	begin
	GetPlayerInfo player = <player_num> controller
	GetPlayerInfo player = <player_num> lefty_flip
	GetPlayerInfo player = <player_num> part
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
	GH3_SFX_fail_song_stop_sounds
	StopSoundsByBuss \{Encore_Events}
	MonitorControllerStates
	spawnscriptnow lefty_flip_func params = {player = <player>}
endscript
