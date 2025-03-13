
script ui_create_debug_brightness_calibration 
	createscreenelement \{parent = root_window
		id = brightnesscalibrationscreen
		type = descinterface
		desc = 'brightness_calibration'
		z_priority = 15000
		event_handlers = [
			{
				pad_back
				ui_sfx
				params = {
					menustate = generic
					uitype = back
				}
			}
			{
				pad_back
				generic_event_back
			}
		]}
	launchevent type = focus target = <id>
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_debug_brightness_calibration 
	clean_up_user_control_helpers
	if screenelementexists \{id = brightnesscalibrationscreen}
		destroyscreenelement \{id = brightnesscalibrationscreen}
	endif
endscript
