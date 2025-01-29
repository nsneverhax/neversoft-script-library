
script ui_create_band_name_enter 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	disable_pause
	SpawnScriptNow ui_create_band_name_enter_spawned params = <...>
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_create_band_name_enter_spawned 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	frontend_load_soundcheck \{loadingscreen}
	GetWaypointPos \{Name = z_soundcheck_trg_waypoint_car_start}
	cam_pos = (<Pos> + (-0.3, 1.4499999, 1.0))
	PlayIGCCam {
		Name = ui_band_name_enter_camera
		viewport = bg_viewport
		Pos = <cam_pos>
		Quat = (0.0, -1.0, 0.0)
		play_hold = 1
		interrupt_current
	}
	if GotParam \{from_band_logo}
		if Spanish
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript
				title_dims = (350.0, 50.0)
				shift = (-50.0, 0.0)}
		elseif Italian
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript
				title_dims = (280.0, 50.0)
				shift = (-20.0, 0.0)}
		elseif German
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript
				title_dims = (300.0, 50.0)
				shift = (-30.0, 0.0)}
		elseif French
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript
				title_dims = (310.0, 50.0)
				shift = (-30.0, 0.0)}
		else
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript}
		endif
		get_savegame_from_controller controller = <device_num>
		get_current_band_info
		bandname_id = <band_info>
		GetGlobalTags <bandname_id> param = Name savegame = <savegame>
		random_name = <Name>
		skip_deinit = 1
		pad_back_script = generic_event_back
		dims = (1.5 * (350.0, 29.0))
	else
		if Spanish
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript
				title_dims = (350.0, 50.0)
				shift = (-50.0, 0.0)}
		elseif Italian
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript
				title_dims = (280.0, 50.0)
				shift = (-20.0, 0.0)}
		elseif German
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript
				title_dims = (300.0, 50.0)
				shift = (-30.0, 0.0)}
		elseif French
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript
				title_dims = (300.0, 50.0)
				shift = (-30.0, 0.0)}
		else
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript}
		endif
		pad_back_script = nullscript
		dims = (1.0 * (350.0, 37.0))
		cas_random_band_name
		skip_deinit = 1
	endif
	Change \{num_name_size = 15}
	text_entry_add_item {
		pad_choose_script = ui_band_name_confirm
		pad_choose_params = {from_options = <from_options> from_band_logo = <from_band_logo> event_params = <event_params>}
		pad_back_script = nullscript
		linear_flow
		text = <random_name>
		dims = <dims>
		validity_message = qs(0x6d83d9d1)
		skip_deinit = <skip_deinit>
	}
	if IsGuitarController controller = ($primary_controller)
		event_handlers = [
			{pad_option re_randomize_band_name params = {text_entry = <text_entry>}}
			{pad_option generic_menu_pad_choose_sound}
			{pad_square generic_event_back}
		]
	else
		if isdrumcontroller controller = ($primary_controller)
			event_handlers = [
				{pad_option re_randomize_band_name params = {text_entry = <text_entry>}}
				{pad_option generic_menu_pad_choose_sound}
				{pad_L1 generic_event_back}
			]
		else
			event_handlers = [
				{pad_option re_randomize_band_name params = {text_entry = <text_entry>}}
				{pad_option generic_menu_pad_choose_sound}
				{pad_R2 generic_event_back}
			]
		endif
	endif
	SetScreenElementProps {
		id = current_menu
		event_handlers = <event_handlers>
	}
	menu_finish \{no_helper_text}
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	LaunchEvent \{Type = pad_choose}
	ui_band_name_enter_helper_text
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_band_name_enter_helper_text 
	add_user_control_helper \{text = qs(0x2931d48b)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0x271a1633)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0xa3503d64)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0x0b6c701b)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = orange
		z = 100000}
	add_user_control_helper \{text = qs(0x0e41fe46)
		button = start
		z = 100000}
endscript

script ui_return_band_name_enter 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	ui_band_name_enter_helper_text
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_band_name_enter 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	KillCamAnim \{Name = ui_band_name_enter_camera}
	destroy_generic_menu
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_band_name_confirm 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	if NOT ui_band_name_is_valid <...>
		SoundEvent \{event = Menu_Warning_SFX}

		if ($0x238076ba = 0)

			Change menu_flow_locked = ($menu_flow_locked - 1)
			if ScreenElementExists \{id = current_menu}
				LaunchEvent \{Type = unfocus
					target = current_menu}
				create_popup_warning_menu \{textblock = {
						text = qs(0x6d83d9d1)
					}
					options = [
						{
							func = enter_band_remove_warning_refocus
							text = qs(0x182f0173)
						}
					]}
			endif
		endif
	else
		get_current_band_info
		bandname_id = <band_info>
		GetTrueStartTime
		formatText checksumName = band_unique_id 'band_info_%d' d = <starttime>
		SetGlobalTags <bandname_id> params = {Name = <text> band_unique_id = <band_unique_id>}
		agora_update band_id = <band_unique_id> Name = <text> new_band
		SoundEvent \{event = enter_band_name_finish}
		Change menu_flow_locked = ($menu_flow_locked - 1)
		if GotParam \{from_band_logo}
			generic_event_back \{data = {
					supress_model_load
				}}
		elseif ($options_for_manage_band = 1)
			generic_event_choose \{event = menu_change
				state = uistate_options_manage_band_logo}
		else
			if GotParam \{from_options}
				generic_event_choose \{event = menu_replace
					state = uistate_options_manage_band_logo}
			else
				create_loading_screen
				generic_event_replace state = uistate_band_logo_choose data = {event_params = <event_params>}
			endif
		endif
	endif
endscript

script enter_band_remove_warning_refocus 
	destroy_popup_warning_menu
	enter_band_name_reset_user_control_helpers
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	LaunchEvent \{Type = pad_choose}
endscript

script re_randomize_band_name 

	cas_random_band_name
	seed_text_entry text = <random_name> text_entry = <text_entry>
	refresh_text_on_screen text_entry = <text_entry>
endscript

script ui_band_name_is_valid 
	StringRemoveTrailingWhitespace string = <text>
	StringToCharArray string = <new_string>
	GetArraySize <char_array>
	if (<array_Size> = 0)
		return \{FALSE}
	else
		return \{true}
	endif
endscript
