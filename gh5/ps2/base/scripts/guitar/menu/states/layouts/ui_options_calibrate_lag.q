
script ui_init_options_calibrate_lag 
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	setup_calibration_lag_none <...>
endscript

script ui_create_options_calibrate_lag \{from_in_game = 0}
	SpawnScriptNow create_calibrate_lag_menu params = <...>
endscript

script ui_destroy_options_calibrate_lag 
	Change \{allow_console_pause_for_cal_lag = 0}
	destroy_calibrate_lag_menu
endscript

script ui_deinit_options_calibrate_lag 
	setslomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	if ($playing_song = 0)
		menu_music_on
	endif
endscript
