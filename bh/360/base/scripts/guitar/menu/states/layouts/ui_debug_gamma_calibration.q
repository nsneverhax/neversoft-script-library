gamma_calibration_bar_width = 0
gamma_calibration_bar_start_x = 0
gamma_calibration_change_increment = 0.01

script ui_create_debug_gamma_calibration 
	CreateScreenElement \{parent = root_window
		id = GammaCalibrationScreen
		type = DescInterface
		desc = 'gamma_calibration'
		z_priority = 15000
		event_handlers = [
			{
				pad_back
				save_gamma_correction
			}
			{
				pad_choose
				reset_gamma_correction
			}
			{
				pad_left
				gamma_calibration_arrow_change
				params = {
					direction = -1
				}
			}
			{
				pad_right
				gamma_calibration_arrow_change
				params = {
					direction = 1
				}
			}
		]}
	if ScreenElementExists \{id = GammaCalibrationScreen}
		if GammaCalibrationScreen :Desc_ResolveAlias \{name = alias_gamma_calibration_bar
				param = bar_id}
			GetScreenElementDims id = <bar_id>
			Change gamma_calibration_bar_width = <width>
			GetScreenElementPosition id = <bar_id> local
			Change gamma_calibration_bar_start_x = (<ScreenElementPos> [0])
		endif
		place_arrow_relative_to_bar
	endif
	add_user_control_helper \{text = qs(0x38ee4773)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent type = focus target = <id>
endscript

script ui_destroy_debug_gamma_calibration 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = GammaCalibrationScreen}
		DestroyScreenElement \{id = GammaCalibrationScreen}
	endif
endscript

script place_arrow_relative_to_bar 
	gamma_max_value = 1.2
	gamma_min_value = 0.8
	gamma_calibration_range = (<gamma_max_value> - <gamma_min_value>)
	gamma_calibration_arrow_x_pos = $gamma_calibration_bar_start_x
	if GotParam \{x_pos_change}
		gamma_calibration_arrow_x_pos = (<gamma_calibration_arrow_x_pos> + <x_pos_change>)
		SetGammaCorrection gamma = (((<gamma_calibration_arrow_x_pos> / $gamma_calibration_bar_width) * <gamma_calibration_range>) + <gamma_min_value>)
	else
		get_savegame_from_controller controller = ($primary_controller)
		GetGlobalTags savegame = <savegame> user_options param = gamma_correction
		SetGammaCorrection gamma = <gamma_correction>
		gamma_calibration_arrow_x_pos = ($gamma_calibration_bar_start_x + (((<gamma_correction> - <gamma_min_value>) / <gamma_calibration_range>) * $gamma_calibration_bar_width))
	endif
	if GammaCalibrationScreen :Desc_ResolveAlias \{name = alias_gamma_calibration_arrow
			param = arrow_id}
		GetScreenElementPosition id = <arrow_id> local
		<arrow_id> :SE_SetProps Pos = (((1.0, 0.0) * <gamma_calibration_arrow_x_pos>) + ((0.0, 1.0) * <ScreenElementPos> [1]))
	endif
	GetGammaCorrection
	FormatText TextName = text qs(0xcd6274e9) a = <gamma>
	GammaCalibrationScreen :SE_SetProps gamma_calibration_value_text = <text>
endscript

script gamma_calibration_arrow_change \{direction = 0}
	gamma_calibration_arrow_change_increments = ($gamma_calibration_change_increment * $gamma_calibration_bar_width)
	if GammaCalibrationScreen :Desc_ResolveAlias \{name = alias_gamma_calibration_arrow
			param = arrow_id}
		GetScreenElementPosition id = <arrow_id> local
		if (<direction> = -1)
			if NOT ((<ScreenElementPos> [0]) = 0)
				if NOT ((<ScreenElementPos> [0]) < 0)
					x_pos_change = ((<ScreenElementPos> [0]) - <gamma_calibration_arrow_change_increments>)
					place_arrow_relative_to_bar x_pos_change = <x_pos_change>
				endif
			endif
		elseif (<direction> = 1)
			if NOT ((<ScreenElementPos> [0]) > $gamma_calibration_bar_width)
				if NOT ((<ScreenElementPos> [0]) = $gamma_calibration_bar_width)
					x_pos_change = ((<ScreenElementPos> [0]) + <gamma_calibration_arrow_change_increments>)
					place_arrow_relative_to_bar x_pos_change = <x_pos_change>
				endif
			endif
		endif
	endif
endscript

script save_gamma_correction 
	GetGammaCorrection
	get_savegame_from_controller controller = ($primary_controller)
	SetGlobalTags savegame = <savegame> user_options params = {gamma_correction = <gamma>}
	ui_memcard_autosave event = menu_back state = UIstate_debug data = {savegame = <savegame> requested_autosave = 1}
endscript

script reset_gamma_correction 
	default_gamma_correction_value = 1.0
	SetGlobalTags savegame = <savegame> user_options params = {gamma_correction = <default_gamma_correction_value>}
	place_arrow_relative_to_bar
endscript
