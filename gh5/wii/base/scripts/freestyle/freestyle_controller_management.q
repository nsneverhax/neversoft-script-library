freestyle_manage_controllers = FALSE
freestyle_manage_controllers_delay = 1
freestyle_disconnected_players = [
	0
	0
	0
]

script freestyle_controller_manager 
	setscriptcannotpause
	freestyle_toggle_controller_manager \{On}
	if (($freestyle_game_mode) = tutorial)
		Wait \{1
			Seconds}
	endif
	begin
	if NOT (($allow_controller_for_all_instruments) = 1)
		GetArraySize ($freestyle_disconnected_players)
		array = ($freestyle_disconnected_players)
		counter = 0
		begin
		if NOT freestyle_validate_player_controller Player = <counter>
			SetArrayElement ArrayName = array index = <counter> NewValue = 1
		else
			SetArrayElement ArrayName = array index = <counter> NewValue = 0
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
		Change freestyle_disconnected_players = <array>
		freestyle_get_disconnected_controller_count
		if (<count> > 0)
			if (($freestyle_manage_controllers) = true)
				freestyle_controller_manager_create_prompt
			endif
		endif
	endif
	Wait ($freestyle_manage_controllers_delay) Seconds
	repeat
endscript

script freestyle_controller_manager_create_prompt 
	freestyle_pause
	kill_start_key_binding
	if ($freestyle_game_mode = tutorial)
		end_text = qs(0x67d9c56d)
		freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
		LaunchEvent Type = unfocus target = <resolved_id>
		on_destroy_script = LaunchEvent
		on_destroy_script_params = {Type = focus target = <resolved_id>}
	else
		end_text = qs(0x502d0838)
		on_destroy_script = nullscript
		on_destroy_script_params = {}
	endif
	destroy_dialog_box
	freestyle_toggle_controller_manager \{OFF}
	freestyle_get_disconnected_controller_array
	GetArraySize <controller_array>
	if (<array_Size> > 0)
		Change primary_controller = (<controller_array> [0])
		Change last_start_pressed_device = (<controller_array> [0])
	endif
	create_dialog_box {
		use_all_controllers
		template = extended
		heading_text = qs(0xaa163738)
		body_text = qs(0x03ac90f0)
		options = [
			{
				func = freestyle_controller_disconnect_continue
				text = qs(0x182f0173)
				sound_func = nullscript
			}
			{
				func = freestyle_controller_disconnect_quit
				text = <end_text>
				sound_func = nullscript
			}
		]
		dlg_z_priority = ($ps3_fade_overlay_z + 100)
		on_destroy_script = <on_destroy_script>
		on_destroy_script_params = <on_destroy_script_params>
	}
	dialog_box_desc_id :obj_spawnscript freestyle_update_controller_manager params = {button_controller = <button_controller>}
endscript

script freestyle_controller_disconnect_continue 
	freestyle_get_disconnected_controller_count
	if (<count> <= 0)
		freestyle_toggle_controller_manager \{On}
		destroy_dialog_box
		freestyle_set_start_key_binding
		freestyle_unpause
	endif
endscript

script freestyle_controller_disconnect_quit 
	destroy_dialog_box
	freestyle_toggle_controller_manager \{OFF}
	freestyle_pause_tree :desc_resolvealias \{Name = alias_freestyle_pause_menu}
	if (($freestyle_recording_mode) = overdub)
		heading_text = qs(0xaa163738)
		body_text = qs(0x1ccd5a50)
		option_1 = qs(0x502d0838)
		option_2 = qs(0xf7723015)
	elseif (($freestyle_recording_mode) = record)
		heading_text = qs(0xaa163738)
		body_text = qs(0xfa74b319)
		option_1 = qs(0x502d0838)
		option_2 = qs(0xf7723015)
	elseif (($freestyle_recording_mode) = None)
		if (($freestyle_game_mode) = tutorial)
			heading_text = qs(0xcf5deb58)
			body_text = qs(0x13ed4eb2)
			option_1 = qs(0x67d9c56d)
			option_2 = qs(0xf7723015)
		endif
	endif
	if ($freestyle_game_mode = tutorial)
		freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
		LaunchEvent Type = unfocus target = <resolved_id>
	endif
	freestyle_get_disconnected_controller_array
	GetArraySize <controller_array>
	if (<array_Size> > 0)
		Change primary_controller = (<controller_array> [0])
		Change last_start_pressed_device = (<controller_array> [0])
	endif
	create_dialog_box {
		use_all_controllers
		heading_text = <heading_text>
		body_text = <body_text>
		options = [
			{
				func = freestyle_controller_manager_create_prompt
				text = <option_2>
			}
			{
				func = freestyle_pause_end
				text = <option_1>
			}
		]
		dlog_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	LaunchEvent \{Type = focus
		target = dialog_box_vmenu}
endscript

script freestyle_toggle_controller_manager 
	if GotParam \{OFF}
		Change \{freestyle_manage_controllers = FALSE}
	elseif GotParam \{On}
		Change \{freestyle_manage_controllers = true}
	endif
endscript

script freestyle_validate_player_controller 
	RequireParams \{[
			Player
		]
		all}
	if NOT (($freestyle_player_data [<Player>].player_type) = ai)
		instrument = ($freestyle_player_data [<Player>].instrument)
		instrument_handler = ($freestyle_player_data [<Player>].instrument_handler)
		controller = ($freestyle_player_data [<Player>].controller)
		getwiicontrollertype controller = <controller>
		is_valid = true
		if ((<instrument> = guitar) || (<instrument> = bass))
			if NOT (<controller_type> = guitar)
				is_valid = FALSE
			endif
		elseif (<instrument> = drums)
			if (<instrument_handler> = drums_nunchuk)
				if NOT (<controller_type> = nunchuk)
					is_valid = FALSE
				endif
			else
				if NOT (<controller_type> = drumkit)
					is_valid = FALSE
				endif
			endif
		endif
	else
		return \{true}
	endif
	return <is_valid>
endscript

script freestyle_get_disconnected_controller_count 
	GetArraySize ($freestyle_disconnected_players)
	counter = 0
	disconnected_controllers = 0
	if (<array_Size> > 0)
		begin
		if (($freestyle_disconnected_players [<counter>]) = 1)
			disconnected_controllers = (<disconnected_controllers> + 1)
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
	endif
	return count = <disconnected_controllers>
endscript

script freestyle_get_disconnected_controller_array 
	GetArraySize ($freestyle_disconnected_players)
	counter = 0
	disconnected_controllers = []
	if (<array_Size> > 0)
		begin
		if (($freestyle_disconnected_players [<counter>]) = 1)
			temp_array = [0]
			SetArrayElement ArrayName = temp_array index = 0 NewValue = ($freestyle_player_data [<counter>].controller)
			disconnected_controllers = (<disconnected_controllers> + <temp_array>)
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
	endif
	return controller_array = <disconnected_controllers>
endscript

script freestyle_update_controller_manager 
	old_text = qs(0x03ac90f0)
	begin
	freestyle_get_disconnected_controller_count
	if (<count> > 0)
		counter = 0
		text = qs(0xfbc815c6)
		GetArraySize ($freestyle_disconnected_players)
		begin
		if (($freestyle_disconnected_players [<counter>]) = 1)
			Player = <counter>
			instrument = ($freestyle_player_data [<Player>].instrument)
			instrument_handler = ($freestyle_player_data [<Player>].instrument_handler)
			controller = ($freestyle_player_data [<Player>].controller)
			player_display = (<controller> + 1)
			if (<instrument> = drums)
				if (<instrument_handler> = drums_nunchuk)
					instrument = nunchuk
				endif
			endif
			switch (<instrument>)
				case guitar
				case bass
				formatText TextName = text qs(0x2e301f7d) t = <text> j = <player_display>
				case drums
				formatText TextName = text qs(0x91d2ab93) t = <text> j = <player_display>
				case nunchuk
				formatText TextName = text qs(0xcab1782a) t = <text> j = <player_display>
			endswitch
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
	else
		text = qs(0x6c92395c)
	endif
	if NOT (<old_text> = <text>)
		se_setprops {dlog_body_text = <text>}
		old_text = <text>
	endif
	Wait \{1
		gameframe}
	repeat
endscript
