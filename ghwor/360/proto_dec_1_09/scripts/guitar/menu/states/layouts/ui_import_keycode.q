
script ui_create_import_keycode 
	destroy_dialog_box
	if (<Result> = already_used)
		formatText TextName = body_text qs(0x4214802c) s = <display_name>
	elseif (<Result> = key_invalid)
		formatText TextName = body_text qs(0x4633761d) s = <display_name>
	elseif (<Result> = error)
		formatText TextName = body_text qs(0x4080e4a8) s = <display_name>
	else
		formatText TextName = body_text qs(0x4080e4a8) s = <display_name>
	endif
	create_dialog_box {
		heading_text = qs(0xaa163738)
		body_text = <body_text>
		player_device = ($primary_controller)
		options = [
			{
				text = qs(0x4c731a2a)
				func = ui_event
				func_params = {event = menu_back state = uistate_import_edit_name}
			}
			{
				text = qs(0xf7723015)
				func = ui_event
				func_params = {event = menu_back state = uistate_import}
			}
		]
	}
endscript

script ui_destroy_import_keycode 
	destroy_dialog_box
endscript

script ui_import_keycode_confirm 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = edit_name_menu}
		LaunchEvent \{Type = unfocus
			target = edit_name_menu}
	endif
	if NOT CD
		if (<text> = qs(0x00000000))
			printf \{'ui_import_keycode_confirm use the hack to get back the key code validation'}
			ui_import_keycode_unlock Result = success code = <code> display_name = <display_name> ignore_match_fail
			return
		endif
	endif
	StringToCharArray string = <text>
	GetArraySize <char_array>
	if (<array_Size> < 20)
		ui_sfx \{menustate = Generic
			uitype = negativeselect}
		generic_event_choose state = uistate_import_keycode data = {Result = key_invalid code = <code> license_code = <license_code> offeringid = <offeringid> display_name = <display_name>}
		return
	endif
	license_code = ''
	i = 0
	begin
	letter = (<char_array> [<i>])
	if (<letter> = qs(0xc9c7beca))
		letter = qs(0x6160dbf3)
	endif
	formatText TextName = license_code '%t%a' t = <license_code> a = <letter>
	if ((<i> = 3) || (<i> = 7) || (<i> = 11) || (<i> = 15))
		formatText TextName = license_code '%t%a' t = <license_code> a = '-'
	endif
	i = (<i> + 1)
	repeat <array_Size>
	ui_import_check_content code = <code> license_code = <license_code> offeringid = <offeringid> display_name = <display_name> controller_index = ($primary_controller)
endscript

script ui_import_keycode_cancel 
	ui_sfx \{menustate = Generic
		uitype = select}
	destroy_dialog_box
	generic_event_back \{state = uistate_import}
endscript

script ui_import_create_validating_dialogue 
	destroy_dialog_box
	create_dialog_box \{heading_text = qs(0xaa163738)
		body_text = qs(0x76df99a3)}
endscript

script ui_import_keycode_unlock 
	if (<Result> = success)
		if NOT GotParam \{ignore_match_fail}
			if NOT import_match_single_key offeringid = <offeringid> content_key = <content_key>
				Result = key_invalid
			endif
		endif
		destroy_dialog_box
		generic_event_choose state = uistate_import_post_legal data = {code = <code> display_name = <display_name>}
	else
		generic_event_choose state = uistate_import_keycode data = {Result = <Result> display_name = <display_name>}
	endif
endscript

script ui_import_try_unlock 
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	ui_import_create_validating_dialogue
	NetSessionFunc {
		Obj = content_unlock
		func = unlock_content
		params = {
			controller_index = ($primary_controller)
			callback = ui_import_keycode_unlock
			callback_params = {code = <code> offeringid = <offeringid> display_name = <display_name>}
			license_code = <license_code>
		}
	}
endscript

script ui_import_check_content 
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	ui_import_create_validating_dialogue
	NetSessionFunc {
		Obj = content_unlock
		func = check_content
		params = {
			controller_index = ($primary_controller)
			callback = ui_import_check_content_callback
			callback_params = {code = <code> offeringid = <offeringid> display_name = <display_name> license_code = <license_code>}
			license_code = <license_code>
		}
	}
endscript

script ui_import_check_content_callback 
	if (<Result> = success)
		if NOT GotParam \{ignore_match_fail}
			if NOT import_match_single_key offeringid = <offeringid> content_key = <content_key>
				Result = key_invalid
				generic_event_choose state = uistate_import_keycode data = {Result = <Result> display_name = <display_name>}
				return
			endif
		endif
		destroy_dialog_box
		ui_import_try_unlock code = <code> offeringid = <offeringid> display_name = <display_name> license_code = <license_code>
	else
		generic_event_choose state = uistate_import_keycode data = {Result = <Result> display_name = <display_name>}
	endif
endscript
