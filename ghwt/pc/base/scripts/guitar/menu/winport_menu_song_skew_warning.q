winport_calibrate_lag_warning_menu_font = fontgrid_title_gh3

script winport_create_calibrate_lag_warning_menu 
	disable_pause
	player_device = ($last_start_pressed_device)
	create_popup_warning_menu {
		textblock = {
			text = qs(0x0a3798b8)
			dims = (800.0, 400.0)
			scale = 0.55
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 480.0)
		dialog_dims = (600.0, 80.0)
		options = [
			{
				func = menu_flow_go_back
				text = qs(0xf7723015)
			}
			{
				func = winport_menu_calibrate_lag_warning_select_yes
				text = qs(0x0e56c83c)
			}
		]
	}
endscript

script winport_destroy_calibrate_lag_warning_menu 
	destroy_popup_warning_menu
endscript

script winport_menu_calibrate_lag_warning_select_yes 
	gh3_sfx_fail_song_stop_sounds
	ui_flow_manager_respond_to_action \{action = continue}
endscript
