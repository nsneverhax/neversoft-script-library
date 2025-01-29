
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
	Player = 1
	if ($current_num_players > 1)
		player_device = ($last_start_pressed_device)
		i = 1
		begin
		getplayerinfo <i> controller
		if (<controller> = <player_device>)
			Player = <i>
			break
		endif
		i = (<i> + 1)
		repeat ($current_num_players)
	endif
	if NOT (<0x3e8a7a4d> = -1)
		Player = (<0x3e8a7a4d> + 1)
	endif
	setplayerinfo <Player> difficulty = <difficulty>
	setplayerinfo <Player> double_kick_drum = <double_kick>
	if (<0x3e8a7a4d> = -1)
		SetArrayElement ArrayName = default_difficulty globalarray index = ($last_start_pressed_device) NewValue = <difficulty>
	endif
	Change \{should_reset_gig_posters_selection = 1}
	restart_warning_select_restart Player = <Player>
endscript
