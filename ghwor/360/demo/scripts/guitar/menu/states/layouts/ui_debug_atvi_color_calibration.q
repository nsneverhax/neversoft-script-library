
script ui_create_debug_atvi_color_calibration 
	createscreenelement \{parent = root_window
		id = atvicolorcalibrationscreen
		type = descinterface
		desc = 'atvi_color_calibration'
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

script ui_destroy_debug_atvi_color_calibration 
	clean_up_user_control_helpers
	if screenelementexists \{id = atvicolorcalibrationscreen}
		destroyscreenelement \{id = atvicolorcalibrationscreen}
	endif
endscript
