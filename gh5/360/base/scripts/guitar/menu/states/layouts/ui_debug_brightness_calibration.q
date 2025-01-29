
script ui_create_debug_brightness_calibration 
	CreateScreenElement \{parent = root_window
		id = brightnesscalibrationscreen
		Type = descinterface
		desc = 'brightness_calibration'
		z_priority = 15000
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
		]}
	LaunchEvent Type = focus target = <id>
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_debug_brightness_calibration 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = brightnesscalibrationscreen}
		DestroyScreenElement \{id = brightnesscalibrationscreen}
	endif
endscript
