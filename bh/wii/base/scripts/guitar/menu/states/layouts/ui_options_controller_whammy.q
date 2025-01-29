
script ui_create_options_controller_whammy 
	if GotParam \{popup}
		controller = ($last_start_pressed_device)
	else
		controller = ($primary_controller)
	endif
	CreateScreenElement {
		parent = root_window
		id = calibratewhammyinterface
		Type = descinterface
		desc = 'calibrate_whammy'
		event_handlers = [
			{pad_back generic_event_back}
			{pad_choose menu_whammy_bar_calibration_enter_sample}
		]
		z_priority = 100
		exclusive_device = <controller>
	}
	LaunchEvent \{Type = focus
		target = calibratewhammyinterface}
	menu_finish
	SpawnScriptNow menu_whammy_bar_update_current_menu params = {controller = <controller>}
endscript

script ui_destroy_options_controller_whammy 
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = menu_whammy_bar_update_current_menu}
	destroy_menu \{menu_id = calibratewhammyinterface}
endscript

script menu_whammy_bar_calibration_enter_sample 
	if GuitarGetAnalogueInfo controller = <device_num>
		if (<rightx> = 0)
			<rightx> = 0.0001
		elseif (<rightx> = 1)
			<rightx> = 0.9998999
		endif
		switch (<device_num>)
			case 0
			SetGlobalTags user_options params = {resting_whammy_position_device_0 = <rightx>}
			case 1
			SetGlobalTags user_options params = {resting_whammy_position_device_1 = <rightx>}
			case 2
			SetGlobalTags user_options params = {resting_whammy_position_device_2 = <rightx>}
			case 3
			SetGlobalTags user_options params = {resting_whammy_position_device_3 = <rightx>}
			case 4
			SetGlobalTags user_options params = {resting_whammy_position_device_4 = <rightx>}
			case 5
			SetGlobalTags user_options params = {resting_whammy_position_device_5 = <rightx>}
			case 6
			SetGlobalTags user_options params = {resting_whammy_position_device_6 = <rightx>}
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
		if ($SHOULD_WE_PLAY_WHAMMY_SOUND = 0)
			SoundEvent \{event = Whammy_Test_SFX}
			Change \{SHOULD_WE_PLAY_WHAMMY_SOUND = 1}
		endif
		if calibratewhammyinterface :desc_resolvealias \{Name = alias_resting_position_text}
			SetScreenElementProps id = <resolved_id> unhide
		endif
		if calibratewhammyinterface :desc_resolvealias \{Name = alias_bg2}
			SetScreenElementProps id = <resolved_id> alpha = 1
		endif
		if calibratewhammyinterface :desc_resolvealias \{Name = alias_portrait}
			SetScreenElementProps id = <resolved_id> alpha = 1
		endif
	else
		Change \{SHOULD_WE_PLAY_WHAMMY_SOUND = 0}
		if calibratewhammyinterface :desc_resolvealias \{Name = alias_resting_position_text}
			SetScreenElementProps id = <resolved_id> Hide
		endif
		menu_whammy_bar_do_poster_morph controller = <controller>
	endif
	WaitOneGameFrame
	repeat
endscript

script menu_whammy_bar_do_poster_morph 
	if GuitarGetAnalogueInfo controller = <controller>
		printf 'rightx = %d' d = <rightx>
		if (<rightx> >= 0)
			if calibratewhammyinterface :desc_resolvealias \{Name = alias_bg2}
				SetScreenElementProps id = <resolved_id> alpha = ((1 - <rightx>) * 0.5)
			endif
			if calibratewhammyinterface :desc_resolvealias \{Name = alias_portrait}
				SetScreenElementProps id = <resolved_id> alpha = ((1 - <rightx>) * 0.5)
			endif
		else
			if calibratewhammyinterface :desc_resolvealias \{Name = alias_bg2}
				SetScreenElementProps id = <resolved_id> alpha = ((0.5 * (<rightx> * -1)) + 0.5)
			endif
			if calibratewhammyinterface :desc_resolvealias \{Name = alias_portrait}
				SetScreenElementProps id = <resolved_id> alpha = ((0.5 * (<rightx> * -1)) + 0.5)
			endif
		endif
	endif
endscript
