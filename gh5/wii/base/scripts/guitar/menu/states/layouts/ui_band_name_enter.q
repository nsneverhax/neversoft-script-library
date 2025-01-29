
script ui_create_band_name_enter 
	SpawnScriptNow ui_create_band_name_enter_spawned params = <...>
endscript

script ui_create_band_name_enter_spawned 
	frontend_load_soundcheck \{loadingscreen}
	if GotParam \{from_band_logo}
		make_generic_menu \{title = $wii_change_band_name
			pad_back_script = nullscript}
		get_savegame_from_controller controller = <device_num>
		formatText checksumName = bandname_id 'band%i_info' i = ($current_band)
		GetGlobalTags <bandname_id> param = Name savegame = <savegame>
		random_name = <Name>
		skip_deinit = 1
		pad_back_script = generic_event_back
		dims = (1.5 * (350.0, 29.0))
	else
		make_generic_menu \{title = $wii_enter_band_name
			pad_back_script = nullscript}
		pad_back_script = nullscript
		dims = (1.0 * (350.0, 27.0))
		cas_random_band_name
		skip_deinit = 1
	endif
	Change \{num_name_size = 20}
	text_entry_add_item {
		pad_choose_script = ui_band_name_confirm
		pad_choose_params = {from_options = <from_options> from_band_logo = <from_band_logo> event_params = <event_params>}
		pad_back_script = <pad_back_script>
		linear_flow
		text = <random_name>
		dims = <dims>
		validity_message = $wii_must_enter_band
		skip_deinit = <skip_deinit>
	}
	SetScreenElementProps {
		id = current_menu
		event_handlers = [
			{pad_option re_randomize_band_name params = {text_entry = <text_entry>}}
			{pad_option generic_menu_pad_choose_sound}
		]
	}
	menu_finish \{no_helper_text}
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	LaunchEvent \{Type = pad_choose}
	ui_band_name_enter_helper_text
endscript

script ui_band_name_enter_helper_text 
	add_user_control_helper \{text = qs(0x2931d48b)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x271a1633)
		button = red
		z = 100000}
	add_user_control_helper \{text = $wii_caps_lock
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0xec8fbaef)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = start
		z = 100000}
endscript

script ui_return_band_name_enter 
	ui_band_name_enter_helper_text
endscript

script ui_destroy_band_name_enter 
	destroy_generic_menu
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

script ui_band_name_confirm 
	if NOT ui_band_name_is_valid <...>
		SoundEvent \{event = Menu_Warning_SFX}
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			create_dialog_box \{create_dialog_box
				body_text = qs(0x6d83d9d1)
				options = [
					{
						func = enter_band_remove_warning_refocus
						text = qs(0x182f0173)
					}
				]}
		endif
	else
		formatText checksumName = bandname_id 'band%i_info' i = ($current_band)
		GetTrueStartTime
		formatText checksumName = band_unique_id 'band_info_%d' d = <starttime>
		SetGlobalTags <bandname_id> params = {Name = <text> band_unique_id = <band_unique_id> auto_dwc_login = 0}
		agora_update band_id = <band_unique_id> Name = <text> new_band
		SoundEvent \{event = enter_band_name_finish}
		printstruct <...>
		if GotParam \{from_band_logo}
			ui_memcard_autosave \{event = menu_back
				data = {
					num_states = 2
				}}
		elseif ($options_for_manage_band = 1)
			generic_event_choose \{event = menu_change
				state = uistate_options_manage_band_logo}
		else
			if GotParam \{from_options}
				ui_memcard_autosave \{event = menu_replace
					data = {
						state = uistate_options_manage_band_logo
					}}
			else
				generic_event_replace state = uistate_band_logo_choose data = {ignore_camera event_params = <event_params>}
			endif
		endif
	endif
endscript

script enter_band_remove_warning_refocus 
	destroy_dialog_box
	enter_band_name_reset_user_control_helpers
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	LaunchEvent \{Type = pad_choose}
endscript

script re_randomize_band_name 
	printf \{qs(0xd8ab1fc5)}
	cas_random_band_name
	seed_text_entry text = <random_name> text_entry = <text_entry>
	refresh_text_on_screen text_entry = <text_entry>
endscript
