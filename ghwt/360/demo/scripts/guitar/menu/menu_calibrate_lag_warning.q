calibrate_lag_warning_menu_font = fontgrid_title_a1

script create_calibrate_lag_warning_menu \{body = qs(0xfbf3b293)
		cancel_script = generic_event_back
		yes_func_params = {
		}}
	disable_pause
	if NOT gotparam \{controller}
		<controller> = $primary_controller
	endif
	create_popup_warning_menu {
		textblock = {
			text = <body>
			dims = (800.0, 400.0)
			scale = 0.55
		}
		player_device = <controller>
		no_background
		menu_pos = (640.0, 480.0)
		options = [
			{
				func = <cancel_script>
				text = qs(0xf7723015)
			}
			{
				func = menu_calibrate_lag_warning_select_yes
				func_params = <yes_func_params>
				text = qs(0x0e56c83c)
			}
		]
	}
endscript

script destroy_calibrate_lag_warning_menu 
	destroy_popup_warning_menu
	enable_pause
endscript

script menu_calibrate_lag_warning_select_yes 
	kill_intro_celeb_ui
	resetscoreupdateready
	gh3_sfx_fail_song_stop_sounds
	stopsoundsbybuss \{encore_events}
	generic_event_choose event = menu_replace state = uistate_options_calibrate_lag data = {from_in_game = 1 <...>}
endscript
