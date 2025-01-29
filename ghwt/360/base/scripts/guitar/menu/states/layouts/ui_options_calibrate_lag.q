
script ui_init_options_calibrate_lag 
	setup_calibration_lag_none <...>
endscript

script ui_create_options_calibrate_lag \{from_in_game = 0}
	SpawnScriptNow create_calibrate_lag_menu params = <...>
endscript

script ui_destroy_options_calibrate_lag 
	Change \{allow_console_pause_for_cal_lag = 0}
	destroy_calibrate_lag_menu
endscript
