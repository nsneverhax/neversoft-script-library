ps3_autosave_warning_shown = 0
memcard_state_active = 0

script ui_init_memcard 
	memcard_controller_reset
	if (<Type> = autosave)
		if GotParam \{event_params}
			if StructureContains structure = <event_params> data
				if StructureContains structure = (<event_params>.data) requested_autosave
					requested_autosave = (<event_params>.data.requested_autosave)
				endif
			endif
		endif
		stars
		if isps3
			printf \{'Regular PS3 save'}
			memcard_controller_add controller = ($primary_controller) requested_autosave = <requested_autosave>
		else
			if GotParam \{event_params}
				if StructureContains structure = <event_params> data
					if StructureContains structure = (<event_params>.data) savegame
						printf 'Saving specific savegame %d' d = ((<event_params>.data).savegame)
						memcard_controller_add controller = ((<event_params>.data).savegame) requested_autosave = <requested_autosave>
						done_something = 1
					elseif StructureContains structure = (<event_params>.data) all_active_players
						memcard_controller_add_signed_in_and_valid
						done_something = 1
					endif
				endif
			endif
			if NOT GotParam \{done_something}
				printf 'Saving primary controller %d' d = ($primary_controller)
				memcard_controller_add controller = ($primary_controller)
			endif
		endif
		stars
	endif
endscript
memcard_after_func = None

script ui_create_memcard \{event_params = {
			event = menu_back
		}}
	ui_print_states
	printstruct <...>
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
		if isXenon
			if NetSessionFunc \{func = xenonisguest
					params = {
						controller_index = $primary_controller
					}}
				call = memcard_guest_profile_warning
			else
				call = memcard_sequence_begin_bootup
			endif
		else
			call = memcard_sequence_begin_bootup
		endif
		StorageSelectorForce = 1
		case autosave
		call = memcard_sequence_begin_autosave
		requested_autosave = 0
		if GotParam \{event_params}
			if StructureContains \{structure = event_params
					data}
				requested_autosave = (<event_params>.data.requested_autosave)
			endif
		endif
		case autoload
		call = memcard_sequence_begin_autoload
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
		case secondary_signin_load
		ScriptAssert \{qs(0x2c2b1078)}
		call = memcard_sequence_begin_ss_load
		default
		ScriptAssert 'invalid type: %t' t = <Type>
	endswitch
	if (<Type> = autosave)
		if NOT memcard_controller_get_next
			hide_glitch \{num_frames = 4}
			SpawnScriptNow ui_memcard_finish params = {<...> success}
			return
		endif
	endif
	if isXenon
		if NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
			printf 'Controller %d is guest, aborting memcard' d = <controller>
			ui_event_wait <event_params>
			return
		endif
		if NOT CheckForSignIn local controller_index = <controller>
			printf 'Controller %d not signed in, aborting' d = <controller>
			ui_event_wait <event_params>
			return
		endif
	endif
	if isps3
		if is_autosave_on \{savegame = 0}
			if ($ps3_autosave_warning_shown = 0)
				Change \{ps3_autosave_warning_shown = 1}
				do_ps3_memcard_warning func = <call> func_params = <...>
				return
			endif
		endif
	endif
	<call> <...>
endscript

script ui_destroy_memcard 
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	clean_up_user_control_helpers
	SpawnScriptNow \{memcard_sequence_cleanup_generic}
	Change \{memcard_state_active = 0}
endscript

script ui_deinit_memcard 
	ui_options_audio_set_dolby_digital
	update_all_volumes
	refresh_autokick_cheat
endscript

script ui_memcard_finish 
	ui_event_get_stack
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	current_menu :GetTags
	if NOT (<Type> = boot)
		Change respond_to_signin_changed = <signin_changed>
	endif
	if (<Type> = autosave)
		if memcard_controller_has_next
			MC_WaitAsyncOpsFinished
			memcard_cleanup_messages
			if ScreenElementExists \{id = current_menu}
				current_menu :Die
			endif
			ui_create_memcard {
				controller = <controller>
				Type = <Type>
				event_params = <event_params>
			}
			return
		endif
	endif
	if GotParam \{success}
		if NOT current_band_save_created
			if GotParam \{controller}
				get_savegame_from_controller controller = <controller>
				get_current_band_info
				SetGlobalTags savegame = <savegame> <band_info> params = {save_created = 1}
			else
			endif
		endif
	endif
	if ($signin_change_happening = 1)
		mark_safe_for_shutdown
		return
	endif
	switch <Type>
		case boot
		ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan controller = <controller> boot}
		case autosave
		if GotParam \{success}
			ui_event_wait <event_params>
		elseif GotParam \{failed}
			ui_event_wait <event_params>
		endif
		case autoload
		if GotParam \{success}
			ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan event_params = <event_params> controller = <controller>}
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
			ui_event_wait <event_params>
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
			if StructureContains structure = <event_params> quickplay_next_song_flow
				Change \{songtime_paused = 0}
				generic_event_back \{state = uistate_setlist}
			else
				ui_event \{event = menu_back}
			endif
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
		case secondary_signin_load
		ScriptAssert \{qs(0x2c2b1078)}
		if GotParam \{success}
			ui_event_wait <event_params>
		elseif GotParam \{failed}
			ui_event_wait \{event = menu_back}
		endif
	endswitch
	if GlobalExists \{Name = debug_unlockall}
		if ((<Type> = boot) || (<Type> = autoload) || (<Type> = load))
			playday_unlockall
		endif
	endif
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
	if ($signin_change_happening = 1)
		return
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound state = uistate_memcard data = {Type = autosave event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_autosave_replace \{event = menu_back
		data = {
		}}
	if ($signin_change_happening = 1)
		return
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	ui_event event = menu_replace data = {state = uistate_memcard Type = autosave event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_autoload \{this_event = menu_change
		event = menu_replace
		data = {
		}}
	if ($signin_change_happening = 1)
		return
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound event = <this_event> state = uistate_memcard data = {Type = autoload event_params = {event = <event> data = <data>} controller = <controller>}
endscript

script ui_memcard_save \{event = menu_replace
		data = {
		}}
	if ($signin_change_happening = 1)
		return
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {Type = save event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_load \{this_event = menu_change
		event = menu_replace
		data = {
		}}
	if ($signin_change_happening = 1)
		return
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose event = <this_event> state = uistate_memcard data = {Type = load event_params = {event = <event> data = <data>}}
endscript
jam_memcard_signin_save_after_func = None

script jam_memcard_signin_load_after_func 
	Change \{memcard_after_func = $jam_memcard_signin_save_after_func}
endscript

script ui_memcard_save_jam \{event = menu_replace
		data = {
		}}
	if isXenon
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

script ui_memcard_secondary_siginin_load \{event = menu_replace
		data = {
		}}
	ScriptAssert \{qs(0x2c2b1078)}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {Type = secondary_signin_load event_params = {event = <event> data = <data>}}
endscript
memcard_controller_iterator = 0
memcard_controller_list = [
]

script memcard_controller_reset 
	Change \{memcard_controller_iterator = 0}
	Change \{memcard_controller_list = [
		]}
endscript

script memcard_controller_add \{requested_autosave = 0}
	if isXenon
		if NOT CheckForSignIn local controller_index = <controller>
			printf qs(0x637aadd2) d = <controller>
			return
		endif
		if NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
			printf qs(0xb916c871) d = <controller>
			return
		endif
	endif
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options
	if (<requested_autosave> = 0)
		if (<autosave> = 0)
			printf qs(0xee8ab3f5) i = <controller>
			return
		endif
	endif
	if NOT ArrayContains array = $memcard_controller_list contains = <controller>
		AddArrayElement array = $memcard_controller_list element = <controller>
		Change memcard_controller_list = <array>
	endif
endscript

script memcard_controller_add_signed_in_and_valid 
	memcard_controller_add controller = ($primary_controller)
	printf 'memcard_controller_add_signed_in_and_valid - Saving %d' d = ($primary_controller)
	if isXenon
		gamemode_getnumplayersshown
		if (($current_num_players) > 0)
			i = 0
			begin
			formatText checksumName = player_status 'player%d_status' d = (<i> + 1)
			controller = ($<player_status>.controller)
			getsavegamefromcontroller controller = <controller>
			if CheckForSignIn local controller_index = <savegame>
				printf 'memcard_controller_add_signed_in_and_valid - Saving %d' d = <savegame>
				memcard_controller_add controller = <savegame>
			endif
			i = (<i> + 1)
			repeat <num_players_shown>
		endif
	endif
endscript

script memcard_controller_has_next 
	GetArraySize \{$memcard_controller_list}
	if ($memcard_controller_iterator < <array_Size>)
		return \{true}
	endif
	return \{FALSE}
endscript

script memcard_controller_get_next 
	GetArraySize \{$memcard_controller_list}
	if ($memcard_controller_iterator < <array_Size>)
		ctl = ($memcard_controller_list [($memcard_controller_iterator)])
		Change memcard_controller_iterator = ($memcard_controller_iterator + 1)
		return true controller = <ctl>
	endif
	return \{FALSE}
endscript

script memcard_guest_profile_warning 
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	<options_array> = [
		{
			func = {signin_warning_select_signin params = {allow_back = 1}}
			text = qs(0x17df5913)
		}
		{
			func = memcard_disable_saves_and_quit
			text = qs(0x06d0b6b0)
		}
		{
			func = {generic_event_replace params = {state = uistate_boot_iis}}
			text = qs(0xf7723015)
		}
	]
	create_popup_warning_menu {
		textblock = {
			text = qs(0xe6d4cc00)
			Pos = (640.0, 380.0)
			Scale = 0.6
		}
		player_device = ($primary_controller)
		menu_pos = (640.0, 465.0)
		dialog_pos = (640.0, 455.0)
		options = <options_array>
	}
endscript
