
script ui_create_import_keycode 
	destroy_dialog_box
	if (<Result> = already_used)
		formatText TextName = body_text qs(0x4214802c) s = <song_title>
	elseif (<Result> = key_invalid)
		formatText TextName = body_text qs(0x4633761d) s = <song_title>
	elseif (<Result> = error)
		formatText TextName = body_text qs(0x4080e4a8) s = <song_title>
	else
		formatText TextName = body_text qs(0x4080e4a8) s = <song_title>
	endif
	create_dialog_box {
		heading_text = qs(0xaa163738)
		body_text = <body_text>
		player_device = ($primary_controller)
		options = [
			{
				text = qs(0x4c731a2a)
				func = ui_event
				func_params = {event = menu_replace data = {
						state = uistate_import_edit_name
						default_name = qs(0x00000000)
						char_limit = 20
						title = qs(0x1c4e5be1)
						allowed_sets = [upper number]
						accept_script = ui_import_keycode_confirm
						accept_params = {
							code = <code>
							offeringid = <offeringid>
							display_name = <display_name>
							purchase_struct = <purchase_struct>
						}
						cancel_script = ui_import_keycode_cancel
						device_num = ($primary_controller)
						show_gamertag = ($primary_controller)
						is_popup
					}
				}
			}
			{
				text = qs(0xf7723015)
				func = songlist_music_store_return_to_special_offers
			}
		]
	}
endscript

script ui_destroy_import_keycode 
	destroy_dialog_box
endscript

script ui_import_keycode_confirm \{purchase_struct = 0x69696969
		offeringid = !i1768515945}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = edit_name_menu}
		LaunchEvent \{Type = unfocus
			target = edit_name_menu}
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	if NOT CD
		if (<text> = qs(0x00000000))
			printf \{'ui_import_keycode_confirm use the hack to get back the key code validation'}
			ui_import_keycode_unlock Result = success purchase_struct = <purchase_struct> ignore_match_fail
			return
		endif
	endif
	StringToCharArray string = <text>
	GetArraySize <char_array>
	<license_code> = ''
	<i> = 0
	begin
	if (<i> < <array_Size>)
		<letter> = (<char_array> [<i>])
	else
		<letter> = qs(0x6160dbf3)
	endif
	if (<letter> = qs(0xc9c7beca))
		<letter> = qs(0x6160dbf3)
	endif
	formatText TextName = license_code '%t%a' t = <license_code> a = <letter>
	if ((<i> = 3) || (<i> = 7) || (<i> = 11) || (<i> = 15))
		formatText TextName = license_code '%t%a' t = <license_code> a = '-'
	endif
	<i> = (<i> + 1)
	repeat 20
	ui_import_check_content license_code = <license_code> purchase_struct = <purchase_struct> controller_index = ($primary_controller) offeringid = <offeringid>
endscript

script ui_import_keycode_cancel 
	ui_sfx \{menustate = Generic
		uitype = select}
	destroy_dialog_box
	songlist_music_store_return_to_special_offers
endscript

script ui_import_create_validating_dialogue 
	destroy_dialog_box
	create_dialog_box \{heading_text = qs(0xaa163738)
		body_text = qs(0x76df99a3)}
endscript

script ui_import_keycode_unlock 
	if (<Result> = success)
		if NOT GotParam \{ignore_match_fail}
			if NOT (<offeringid> = <content_key>)
				<Result> = key_invalid
			endif
		endif
		destroy_dialog_box
		generic_event_replace state = uistate_import_post_legal data = {is_popup purchase_struct = <purchase_struct>}
	else
		generic_event_choose state = uistate_import_keycode data = {is_popup Result = <Result> song_title = (<purchase_struct>.song_title) code = (<purchase_struct>.song_checksum) offeringid = <offeringid>}
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
			callback_params = {purchase_struct = <purchase_struct> offeringid = <offeringid>}
			license_code = <license_code>
		}
	}
endscript

script ui_import_check_content \{purchase_struct = 0x69696969
		offeringid = !i1768515945}
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
			callback_params = {purchase_struct = <purchase_struct> license_code = <license_code> offeringid = <offeringid>}
			license_code = <license_code>
		}
	}
endscript

script ui_import_check_content_callback 
	if (<Result> = success)
		if NOT GotParam \{ignore_match_fail}
			if NOT (<offeringid> = <content_key>)
				<Result> = key_invalid
				generic_event_replace state = uistate_import_keycode data = {is_popup Result = <Result> song_title = (<purchase_struct>.song_title) code = <code> offeringid = <offeringid>}
				return
			endif
		endif
		destroy_dialog_box
		ui_import_try_unlock purchase_struct = <purchase_struct> license_code = <license_code> offeringid = <offeringid>
	else
		generic_event_replace state = uistate_import_keycode data = {is_popup Result = <Result> song_title = (<purchase_struct>.song_title) code = <code> offeringid = <offeringid> purchase_struct = <purchase_struct>}
	endif
endscript
