
script ui_create_import_keycode 
	destroy_dialog_box
	ui_import_disable_edit_names
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
				func_params = {event = menu_back state = uistate_import_edit_name}
			}
			{
				text = qs(0xf7723015)
				func = ui_event
				func_params = {event = menu_back state = uistate_songlist}
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
	if NetSessionFunc {Obj = content_unlock func = is_controller_busy params = {controller_index = ($primary_controller)}}
		return
	endif
	if ScreenElementExists \{id = edit_name_menu}
		LaunchEvent \{Type = unfocus
			target = edit_name_menu}
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	if NOT CD
		if (<text> = qs(0x03ac90f0))
			printf \{'ui_import_keycode_confirm use the hack to get back the key code validation'}
			ui_import_keycode_unlock Result = success purchase_struct = <purchase_struct> ignore_match_fail
			return
		endif
	endif
	StringToCharArray string = <text>
	GetArraySize <char_array>
	if (<array_Size> < 20)
		ui_sfx \{menustate = Generic
			uitype = negativeselect}
		generic_event_choose state = uistate_import_keycode data = {is_popup Result = key_invalid song_title = (<purchase_struct>.song_title)}
		return
	endif
	<license_code> = ''
	<i> = 0
	begin
	<letter> = (<char_array> [<i>])
	if (<letter> = qs(0x9352229f))
		<letter> = qs(0x3bf547a6)
	endif
	formatText TextName = license_code '%t%a' t = <license_code> a = <letter>
	if ((<i> = 3) || (<i> = 7) || (<i> = 11) || (<i> = 15))
		formatText TextName = license_code '%t%a' t = <license_code> a = '-'
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	ui_import_check_content license_code = <license_code> purchase_struct = <purchase_struct> controller_index = ($primary_controller)
endscript

script ui_import_keycode_cancel 
	ui_sfx \{menustate = Generic
		uitype = select}
	destroy_dialog_box
	generic_event_back \{state = uistate_songlist}
endscript

script ui_import_create_validating_dialogue 
	destroy_dialog_box
	ui_import_disable_edit_names
	create_dialog_box \{heading_text = qs(0xaa163738)
		body_text = qs(0x76df99a3)}
endscript

script ui_import_keycode_unlock 
	if (<Result> = success)
		if NOT GotParam \{ignore_match_fail}
			if NOT (<purchase_struct>.offering_id = <content_key>)
				<Result> = key_invalid
			endif
		endif
		destroy_dialog_box
		generic_event_replace state = uistate_import_post_legal data = {is_popup purchase_struct = <purchase_struct>}
	else
		generic_event_choose state = uistate_import_keycode data = {is_popup Result = <Result> song_title = (<purchase_struct>.song_title)}
	endif
endscript

script ui_import_try_unlock 
	if marketplacepersistencefunc \{func = encountered_error}
		return
	endif
	if (($g_marketplace_responding_to_error) = 1)
		return
	endif
	ui_import_create_validating_dialogue
	NetSessionFunc {
		Obj = content_unlock
		func = unlock_content
		params = {
			controller_index = ($primary_controller)
			callback = ui_import_keycode_unlock
			callback_params = {purchase_struct = <purchase_struct>}
			license_code = <license_code>
		}
	}
endscript

script ui_import_check_content 
	if marketplacepersistencefunc \{func = encountered_error}
		return
	endif
	if (($g_marketplace_responding_to_error) = 1)
		return
	endif
	ui_import_create_validating_dialogue
	NetSessionFunc {
		Obj = content_unlock
		func = check_content
		params = {
			controller_index = ($primary_controller)
			callback = ui_import_check_content_callback
			callback_params = {purchase_struct = <purchase_struct> license_code = <license_code>}
			license_code = <license_code>
		}
	}
endscript

script ui_import_check_content_callback 
	if (<Result> = success)
		if NOT GotParam \{ignore_match_fail}
			if NOT ((<purchase_struct>.offering_id) = <content_key>)
				<Result> = key_invalid
				generic_event_choose state = uistate_import_keycode data = {is_popup Result = <Result> song_title = (<purchase_struct>.song_title)}
				return
			endif
		endif
		destroy_dialog_box
		ui_import_try_unlock purchase_struct = <purchase_struct> license_code = <license_code>
	else
		generic_event_choose state = uistate_import_keycode data = {is_popup Result = <Result> song_title = (<purchase_struct>.song_title)}
	endif
endscript

script ui_import_disable_edit_names 
	if ScreenElementExists \{id = edit_name_screen_id}
		LaunchEvent \{Type = unfocus
			target = edit_name_screen_id}
		edit_name_screen_id :se_setprops \{event_handlers = [
			]
			replace_handlers}
	endif
	KillSpawnedScript \{Name = ui_import_edit_name_backspace_spawned}
	KillSpawnedScript \{Name = ui_import_edit_name_enter_character_spawned}
endscript
