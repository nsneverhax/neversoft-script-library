calibrate_lag_warning_menu_font = fontgrid_title_a1

script create_calibrate_lag_warning_menu \{body = qs(0x0a3798b8)
		cancel_script = generic_event_back
		cancel_func_params = {
			nosound
		}
		yes_func_params = {
		}}
	disable_pause
	if NOT gotparam \{controller}
		<controller> = $primary_controller
	endif
	create_dialog_box {
		body_text = <body>
		player_device = <controller>
		no_background
		options = [
			{
				func = <cancel_script>
				func_params = <cancel_func_params>
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
	destroy_dialog_box
	enable_pause
endscript

script menu_calibrate_lag_warning_select_yes 
	kill_intro_celeb_ui
	resetscoreupdateready
	gh3_sfx_fail_song_stop_sounds
	if scriptexists \{crowd_swells_during_stats_screen}
		killspawnedscript \{name = crowd_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	stopsoundsbybuss \{encore_events}
	choose_calibrate_lag
endscript
