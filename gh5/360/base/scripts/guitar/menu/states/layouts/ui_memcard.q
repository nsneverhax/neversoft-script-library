
script ui_init_memcard 
	if savegame_async_is_busy
		ScriptAssert \{'Savegame_async operations are still occuring, cannot do full UI state memcard stuff right now'}
	endif
	if (<Type> = autosave)
		if GotParam \{event_params}
			if StructureContains structure = <event_params> data
				if StructureContains structure = (<event_params>.data) requested_autosave
					requested_autosave = (<event_params>.data.requested_autosave)
				endif
			endif
		endif
	endif
endscript
memcard_after_func = None

script ui_create_memcard \{event_params = {
			event = menu_back
		}}
	Change \{memcard_state_active = 1}
	if ($is_network_game = 1)
		original_type = <Type>
		gamemode_gettype
		if (<Type> = career)
			spawn_player_drop_listeners \{drop_player_script = net_career_memcard_drop_player
				end_game_script = net_career_memcard_end_game}
		endif
		Type = <original_type>
	endif
	StartRendering
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = current_menu
		Pos = (0.0, 0.0)
		just = [left center]
		z_priority = 0
		tags = {
			Type = <Type>
			event_params = <event_params>
			signin_changed = ($respond_to_signin_changed)
		}
	}
	Change \{respond_to_signin_changed = 1}
	switch <Type>
		case boot
		call = memcard_sequence_begin_boot
		case single_signin
		if isxenonorwindx
			if NetSessionFunc \{func = xenonisguest
					params = {
						controller_index = $primary_controller
					}}
				call = memcard_guest_profile_warning
			else
				call = memcard_sequence_begin_single_signin
			endif
		else
			call = memcard_sequence_begin_single_signin
		endif
		case autosave
		call = memcard_sequence_begin_autosave
		requested_autosave = 0
		if GotParam \{event_params}
			if StructureContains \{structure = event_params
					data}
				requested_autosave = (<event_params>.data.requested_autosave)
			endif
		endif
		case save
		call = memcard_sequence_begin_save
		case load
		call = memcard_sequence_begin_load
		case save_jam
		call = memcard_sequence_begin_save_jam
		case load_jam
		call = memcard_sequence_begin_load_jam
		case delete_jam
		call = memcard_sequence_begin_delete_jam
		case rename_jam
		call = memcard_sequence_begin_rename_jam
		case lobby_error
		call = memcard_sequence_begin_lobby_error
		default
		ScriptAssert 'invalid type: %t' t = <Type>
	endswitch
	if (<Type> != boot)
		if isxenonorwindx
			if NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
				printf 'Controller %d is guest, aborting memcard' d = <controller>
				skip_savegame = 1
			endif
			if NOT CheckForSignIn local controller_index = <controller>
				printf 'Controller %d not signed in, aborting' d = <controller>
				skip_savegame = 1
			endif
		endif
		if GotParam \{skip_savegame}
			ui_event_wait <event_params>
			interlock \{lock_name = lock_savegame}
			return
		endif
	endif
	<call> <...>
endscript

script ui_destroy_memcard 
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	update_download_song_killswitch_from_globaltags
	SpawnScriptNow memcard_sequence_cleanup_generic params = {<...>}
	Change \{memcard_state_active = 0}
endscript

script ui_deinit_memcard 
	if GotParam \{Type}
		if (<Type> = boot)
			controller = $primary_controller
		endif
	endif
	if GotParam \{controller}
		if (<controller> = $primary_controller && <controller> >= 0)
			get_savegame_from_controller controller = <controller>
			ui_options_audio_set_dolby_digital savegame = <savegame>
		endif
	endif
endscript

script ui_memcard_finish 
	ui_event_get_stack
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	current_menu :GetTags
	Change respond_to_signin_changed = <signin_changed>
	switch <Type>
		case boot
		interlock \{lock_name = lock_savegame}
		output_status \{prefix = 'boots'
			text = 'Download scan'}
		ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan event_params = <event_params> controller = <controller>}
		case single_signin
		ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan event_params = <event_params> controller = <controller>}
		case autosave
		if ScriptIsRunning \{handle_signin_changed}
			mark_safe_for_shutdown
			return
		endif
		if GotParam \{success}
			if StructureContains structure = (<event_params>.data) state
				if ((<event_params>.data.state) = uistate_freeplay)
					create_loading_screen
				endif
			endif
			ui_event_wait <event_params>
		elseif GotParam \{failed}
			ui_event_wait <event_params>
		endif
		case save
		if GotParam \{success}
			ui_event_wait <event_params>
		elseif GotParam \{failed}
			ui_event_wait <event_params>
		endif
		case load
		if GotParam \{success}
			ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan event_params = <event_params> controller = <controller>}
		elseif GotParam \{failed}
			ui_event_wait \{event = menu_back}
		endif
		case save_jam
		if GotParam \{success}
			ui_event <event_params>
		elseif GotParam \{failed}
			ui_event <event_params>
		endif
		case load_jam
		if GotParam \{success}
			ui_event <event_params>
		elseif GotParam \{failed}
			gamemode_gettype
			data = {}
			if (<Type> = quickplay)
				if NOT musicstudio_mainobj :musicstudio_isinmusicstudio
					printf \{channel = bkutcher
						qs(0xccfa34b7)}
					data = {state = uistate_songlist}
				endif
			endif
			ui_event_wait event = menu_back data = <data>
		endif
		case delete_jam
		if GotParam \{success}
			ui_event <event_params>
		elseif GotParam \{failed}
			ui_event \{event = menu_back}
		endif
		case rename_jam
		if GotParam \{success}
			ui_event <event_params>
		elseif GotParam \{failed}
			ui_event \{event = menu_back}
		endif
		case lobby_error
		if GotParam \{success}
			ui_event_wait <event_params>
		elseif GotParam \{failed}
			ui_event_wait <event_params>
		endif
	endswitch
	if ($memcard_after_func != None)
		if GotParam \{success}
			($memcard_after_func) success
		elseif GotParam \{failed}
			($memcard_after_func) failed
		else
			ScriptAssert \{'Yeah, something is wrong'}
		endif
		Change \{memcard_after_func = None}
	endif
endscript

script ui_memcard_autosave \{event = menu_back
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if GotParam \{is_popup}
		generic_event_choose no_sound state = uistate_memcard data = {is_popup Type = autosave event_params = {event = <event> data = <data>}}
	else
		generic_event_choose no_sound state = uistate_memcard data = {Type = autosave event_params = {event = <event> data = <data>}}
	endif
endscript

script ui_memcard_autosave_replace \{event = menu_back
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if GotParam \{menu_music}
		switch <menu_music>
			case On
			SpawnScriptNow \{menu_music_on}
			default
			printf \{channel = sfx
				qs(0xf791d105)}
		endswitch
	endif
	if GotParam \{is_popup}
		ui_event event = menu_replace data = {is_popup state = uistate_memcard Type = autosave event_params = {event = <event> data = <data>}}
	else
		ui_event event = menu_replace data = {state = uistate_memcard Type = autosave event_params = {event = <event> data = <data>}}
	endif
endscript

script ui_memcard_save \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {Type = save OverwriteConfirmed = <OverwriteConfirmed> event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_load \{this_event = menu_change
		event = menu_replace
		data = {
		}
		manual_load = 0}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose event = <this_event> state = uistate_memcard data = {
		Type = load show_confirm_dialog = <show_confirm_dialog> event_params = {event = <event> data = <data>}
	}
endscript

script ui_memcard_single_signin event = menu_replace data = {} controller = ($primary_controller)
	RequireParams \{[
			controller
		]
		all}
	printscriptinfo \{'ui_memcard_single_signin'}
	printstruct <...>
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	get_savegame_from_controller controller = <controller>
	if get_savegame_has_saved_game savegame = <savegame>
		ui_event event = <event> data = <data>
		return
	endif
	if NOT is_autosave_on savegame = <savegame>
		ui_event event = <event> data = <data>
		return
	endif
	sound_params = {}
	if StructureContains structure = <data> no_sound
		sound_params = {no_sound}
	endif
	ui_event event = <this_event> <sound_params> state = uistate_memcard data = {Type = single_signin controller = <controller> event_params = {event = <event> data = <data>}}
endscript
jam_memcard_signin_save_after_func = None

script jam_memcard_signin_load_after_func 
	Change \{memcard_after_func = $jam_memcard_signin_save_after_func}
endscript

script ui_memcard_save_jam \{event = menu_replace
		data = {
		}}
	if isxenonorwindx
		if NOT CheckForSignIn local controller_index = <controller>
			Change \{jam_memcard_signin_save_after_func = $memcard_after_func}
			Change \{memcard_after_func = jam_memcard_signin_load_after_func}
			generic_event_choose {
				state = uistate_signin
				data = {
					no_sound
					new_state = uistate_memcard
					new_data = {
						Type = save_jam
						event_params = {
							event = <event>
							data = <data>
						}
					}
				}
			}
			return
		endif
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound state = uistate_memcard data = {Type = save_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_rename_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {Type = rename_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_delete_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {Type = delete_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_lobby_error \{event = menu_back}
	RequireParams \{[
			event
			error
			controller
		]
		all}
	generic_event_choose no_sound state = uistate_memcard data = {Type = lobby_error error = <error> controller = <controller> event_params = {event = <event> data = <data> <error_params>}}
endscript

script ui_memcard_autosave_all_players \{memcard_event = menu_change
		event = menu_back
		data = {
		}}
	if GotParam \{is_popup}
		ScriptAssert \{'This will need to be updated to support popups'}
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	final_event_params = {event = <event> data = <data>}
	get_all_saving_players_controller_list \{reverse_order}
	GetArraySize <controller_list>
	if (<array_Size> = 0)
		ScriptAssert \{'No controllers to save'}
	endif
	current_params = <final_event_params>
	last_index = (<array_Size> -1)
	i = 0
	begin
	controller = (<controller_list> [<i>])
	current_params = {state = uistate_memcard Type = autosave controller = <controller> event_params = <current_params>}
	if (<i> < <last_index>)
		current_params = {event = menu_replace data = <current_params>}
	else
		current_params = {event = <memcard_event> data = <current_params>}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	printf \{'chain of events:'}
	printstruct <...>
	ui_event <current_params>
endscript

script memcard_guest_profile_warning 
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	<options_array> = [
		{
			func = signin_warning_select_signin
			func_params = {allow_back = 1}
			text = qs(0x17df5913)
		}
		{
			func = memcard_disable_saves_and_quit
			text = qs(0x06d0b6b0)
		}
		{
			func = generic_event_replace
			params = {state = uistate_boot_iis}
			text = qs(0xf7723015)
		}
	]
	create_dialog_box {
		body_text = qs(0xe6d4cc00)
		player_device = ($primary_controller)
		options = <options_array>
	}
endscript

script net_career_memcard_end_game 
	printf \{qs(0x4e6b3c84)}
	SpawnScriptNow wait_for_net_career_end_game params = {<...>}
endscript

script net_career_memcard_drop_player 
	printf \{qs(0x62a85a96)}
	SpawnScriptNow songlist_drop_player params = {<...>}
endscript

script wait_for_net_career_end_game 
	printf \{qs(0x0307fc4c)}
	wait_for_safe_shutdown
	ui_event_wait_for_safe
	begin
	if ($memcard_state_active = 0)
		ui_event_get_top
		if (<base_name> = 'band_lobby')
			if ScreenElementExists \{id = band_lobby_desc_id}
				band_lobby_end_game <...>
				break
			endif
		elseif (<base_name> = 'career_venue_select')
			if ScreenElementExists \{id = career_venue_select_screen_id}
				songlist_end_game <...>
				break
			endif
		endif
	endif
	Wait \{1
		Second}
	repeat
endscript
