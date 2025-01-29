
script ui_create_debug_atvi_color_calibration 
	CreateScreenElement \{parent = root_window
		id = ATVIColorCalibrationScreen
		type = DescInterface
		desc = 'atvi_color_calibration'
		z_priority = 15000
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
		]}
	LaunchEvent type = focus target = <id>
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_debug_atvi_color_calibration 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = ATVIColorCalibrationScreen}
		DestroyScreenElement \{id = ATVIColorCalibrationScreen}
	endif
endscript
