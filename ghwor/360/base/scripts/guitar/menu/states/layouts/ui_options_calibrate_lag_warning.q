
script ui_create_options_calibrate_lag_warning 
	SpawnScriptNow \{audio_crowd_fail_song_logic}
	if GotParam \{dialog}
		create_calibrate_lag_dialog_menu <...>
		return
	endif
	create_calibrate_lag_warning_menu <...>
endscript

script ui_destroy_options_calibrate_lag_warning \{complete_script = nullscript}
	if GotParam \{dialog}
		printstruct <...>
		<complete_script>
		destroy_calibrate_lag_dialog_menu <...>
		return
	endif
	destroy_calibrate_lag_warning_menu
endscript
