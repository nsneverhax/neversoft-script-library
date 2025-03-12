
script ui_create_options_controller_whammy 
	if gotparam \{popup}
		controller = ($last_start_pressed_device)
	else
		controller = ($primary_controller)
	endif
	createscreenelement {
		parent = root_window
		id = calibratewhammyinterface
		type = descinterface
		desc = 'calibrate_whammy'
		event_handlers = [
			{pad_back generic_event_back}
			{pad_choose menu_whammy_bar_calibration_enter_sample}
		]
		exclusive_device = <controller>
	}
	launchevent \{type = focus
		target = calibratewhammyinterface}
	menu_finish
	spawnscriptnow menu_whammy_bar_update_current_menu params = {controller = <controller>}
endscript

script ui_destroy_options_controller_whammy 
	clean_up_user_control_helpers
	killspawnedscript \{name = menu_whammy_bar_update_current_menu}
	destroy_menu \{menu_id = calibratewhammyinterface}
endscript

script menu_whammy_bar_calibration_enter_sample 
	if guitargetanalogueinfo controller = <device_num>
		if (<rightx> = 0)
			<rightx> = 0.0001
		elseif (<rightx> = 1)
			<rightx> = 0.9998999
		endif
		switch (<device_num>)
			case 0
			setglobaltags user_options params = {resting_whammy_position_device_0 = <rightx>}
			case 1
			setglobaltags user_options params = {resting_whammy_position_device_1 = <rightx>}
			case 2
			setglobaltags user_options params = {resting_whammy_position_device_2 = <rightx>}
			case 3
			setglobaltags user_options params = {resting_whammy_position_device_3 = <rightx>}
			case 4
			setglobaltags user_options params = {resting_whammy_position_device_4 = <rightx>}
			case 5
			setglobaltags user_options params = {resting_whammy_position_device_5 = <rightx>}
			case 6
			setglobaltags user_options params = {resting_whammy_position_device_6 = <rightx>}
		endswitch
		get_resting_whammy_position controller = <device_num>
		i = 1
		begin
		if playerinfoequals <i> controller = <device_num>
			setplayerinfo <i> resting_whammy_position = <resting_whammy_position>
			break
		endif
		i = (<i> + 1)
		repeat 4
	endif
endscript

script menu_whammy_bar_update_current_menu 
	begin
	if is_whammy_resting controller = <controller>
		if ($should_we_play_whammy_sound = 0)
			soundevent \{event = whammy_test_sfx}
			change \{should_we_play_whammy_sound = 1}
		endif
		if calibratewhammyinterface :desc_resolvealias \{name = alias_resting_position_text}
			setscreenelementprops id = <resolved_id> unhide
		endif
		if calibratewhammyinterface :desc_resolvealias \{name = alias_bg2}
			setscreenelementprops id = <resolved_id> alpha = 1
		endif
		if calibratewhammyinterface :desc_resolvealias \{name = alias_portrait}
			setscreenelementprops id = <resolved_id> alpha = 1
		endif
	else
		change \{should_we_play_whammy_sound = 0}
		if calibratewhammyinterface :desc_resolvealias \{name = alias_resting_position_text}
			setscreenelementprops id = <resolved_id> hide
		endif
		menu_whammy_bar_do_poster_morph controller = <controller>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script menu_whammy_bar_do_poster_morph 
	if guitargetanalogueinfo controller = <controller>
		printf 'rightx = %d' d = <rightx>
		if (<rightx> >= 0)
			if calibratewhammyinterface :desc_resolvealias \{name = alias_bg2}
				setscreenelementprops id = <resolved_id> alpha = ((1 - <rightx>) * 0.5)
			endif
			if calibratewhammyinterface :desc_resolvealias \{name = alias_portrait}
				setscreenelementprops id = <resolved_id> alpha = ((1 - <rightx>) * 0.5)
			endif
		else
			if calibratewhammyinterface :desc_resolvealias \{name = alias_bg2}
				setscreenelementprops id = <resolved_id> alpha = ((0.5 * (<rightx> * -1)) + 0.5)
			endif
			if calibratewhammyinterface :desc_resolvealias \{name = alias_portrait}
				setscreenelementprops id = <resolved_id> alpha = ((0.5 * (<rightx> * -1)) + 0.5)
			endif
		endif
	endif
endscript
