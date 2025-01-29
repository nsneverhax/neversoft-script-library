
script ui_create_options_calibrate_lag_warning 
	fadetoblack \{OFF
		no_wait}
	if GotParam \{dialog}
		create_calibrate_lag_dialog_menu <...>
		return
	endif
	create_calibrate_lag_warning_menu <...>
endscript

script ui_destroy_options_calibrate_lag_warning \{complete_script = nullscript}
	if ui_event_exists_in_stack \{Name = 'options_calibrate_lag'}
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = 100011}
	endif
	if GotParam \{dialog}

		<complete_script>
		destroy_calibrate_lag_dialog_menu <...>
		return
	endif
	destroy_calibrate_lag_warning_menu
endscript
