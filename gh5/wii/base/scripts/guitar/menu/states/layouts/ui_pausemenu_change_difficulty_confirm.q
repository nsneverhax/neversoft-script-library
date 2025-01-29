
script ui_create_pausemenu_change_difficulty_confirm 
	create_pausemenu_change_difficulty_confirm <...>
endscript

script ui_destroy_pausemenu_change_difficulty_confirm 
	destroy_dialog_box
endscript

script create_pausemenu_change_difficulty_confirm 
	player_device = ($last_start_pressed_device)
	create_dialog_box {
		body_text = qs(0xd3a2145f)
		player_device = <player_device>
		no_background
		options = [
			{
				func = pausemenu_change_difficulty_confirm_ok
				func_params = {<...>}
				text = qs(0x0e41fe46)
			}
		]
	}
endscript

script pausemenu_change_difficulty_confirm_ok 
	getfirstplayer \{out = player_selected}
	if NOT isSinglePlayerGame
		player_device = ($last_start_pressed_device)
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <Player> controller
			if (<controller> = <player_device>)
				<player_selected> = <Player>
				break
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
	endif
	<Player> = <player_selected>
	setplayerinfo <Player> difficulty = <difficulty>
	getplayerinfo <Player> part
	save_progression_instrument_user_option part = <part> controller = ($last_start_pressed_device) option = 'difficulty' new_value = <difficulty>
	if GotParam \{expert_plus}
		setplayerinfo <Player> double_kick_drum = 1
		save_progression_instrument_user_option part = <part> controller = ($last_start_pressed_device) option = 'double_kick_drum' new_value = 1
	elseif (<part> = drum)
		setplayerinfo <Player> double_kick_drum = 0
		save_progression_instrument_user_option part = <part> controller = ($last_start_pressed_device) option = 'double_kick_drum' new_value = 0
	endif
	SetArrayElement ArrayName = default_difficulty globalarray index = ($last_start_pressed_device) NewValue = <difficulty>
	restart_warning_select_restart Player = <Player>
endscript
