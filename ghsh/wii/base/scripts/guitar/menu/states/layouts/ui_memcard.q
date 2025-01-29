ps3_autosave_warning_shown = 0
memcard_state_active = 0
0xcb35682e = FALSE
memcard_initial_boot = 0
save_message_start_time = -1

script ui_init_memcard 
	memcard_controller_reset
	if (<Type> = autosave)
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
	get_home_button_allowed
	if (<disabled> = 1)
		Change \{0xcb35682e = FALSE}
	else
		Change \{0xcb35682e = true}
		set_home_button_notallowed
	endif
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
	printscriptinfo \{'ui_create_memcard dump'}
	call = NULL
	save_or_load = NULL
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
	0xa28ac281 = 0
	switch <Type>
		case boot
		Change \{memcard_initial_boot = 1}
		printf \{qs(0x142a9fd4)}
		call = wii_memcard_sequence_begin_bootup
		StorageSelectorForce = 1
		<save_or_load> = loading
		case autosave
		printf \{qs(0xf82e74dc)}
		if ($enable_saving = 0)
			SetGlobalTags \{user_options
				params = {
					autosave = $enable_saving
				}}
		endif
		getsavegamefromcontroller controller = ($primary_controller)
		if is_autosave_on savegame = <savegame>
			call = wii_memcard_sequence_begin_autosave
		else
			call = NULL
			ui_event_wait <event_params>
			<0xa28ac281> = 1
		endif
		<save_or_load> = saving
		case autoload
		printf \{qs(0x9d6ee9cd)}
		call = wii_memcard_sequence_begin_autoload
		<save_or_load> = loading
		case save
		printf \{qs(0x05b00499)}
		call = wii_memcard_sequence_begin_save
		<save_or_load> = saving
		case load
		printf \{qs(0x60f09988)}
		call = wii_memcard_sequence_begin_load
		<save_or_load> = loading
		case replace
		printf \{qs(0x57265051)}
		call = 0x83865a30
		<save_or_load> = saving
		case save_jam
		printf \{qs(0x3e382643)}
		call = wii_memcard_sequence_begin_save_jam
		<save_or_load> = saving
		case load_jam
		printf \{qs(0x5ebcf25b)}
		call = wii_memcard_sequence_begin_load_jam
		<save_or_load> = loading
		case delete_jam
		printf \{qs(0xa07fe43f)}
		call = wii_memcard_sequence_begin_delete_jam
		<save_or_load> = deleting
		case rename_jam
		printf \{qs(0x627810d6)}
		call = wii_memcard_sequence_begin_rename_jam
		<save_or_load> = saving
	endswitch
	if (<Type> = autosave)
		if NOT memcard_controller_get_next
			if StructureContains structure = <event_params> data
				if StructureContains structure = (<event_params>.data) 0x6d221ff1
					SpawnScriptNow 0xaf1dfe34 params = {<event_params>}
					return
				endif
				if StructureContains structure = (<event_params>.data) 0x05e47ace
					if ($memcard_after_func != None)
						SpawnScriptNow ($memcard_after_func) params = {success}
						Change \{memcard_after_func = None}
					endif
				endif
			endif
			hide_glitch \{num_frames = 4}
			if (<0xa28ac281> = 0)
				SpawnScriptNow ui_memcard_finish params = {<...> success}
			else
				SpawnScriptNow ui_memcard_finish params = {<...> success 0x8c5ef959}
			endif
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
	if (<Type> = load)
		if GotParam \{0x6d221ff1}
			create_wii_saveload_screen header = qs(0xaa163738) message = 0x04e32910 option1_text = qs(0xf7723015) option2_text = qs(0xc2993a50) option1_script = ui_wii_trc_handle_action option2_script = display_and_continue_access option1_params = {action = leave_saveload_flow 0x6d221ff1} option2_params = {<...>}
		else
			create_wii_saveload_screen header = qs(0xaa163738) message = 0x04e32910 option1_text = qs(0xf7723015) option2_text = qs(0xc2993a50) option1_script = ui_wii_trc_handle_action option2_script = display_and_continue_access option1_params = {action = leave_saveload_flow} option2_params = {<...>}
		endif
	elseif (<Type> = save)
		if GotParam \{0x6d221ff1}
			create_wii_saveload_screen header = qs(0xaa163738) message = 0xd4b8e2fa option1_text = qs(0xf7723015) option2_text = qs(0xc2993a50) option1_script = ui_wii_trc_handle_action option2_script = display_and_continue_access option1_params = {action = leave_saveload_flow 0x6d221ff1} option2_params = {<...>}
		else
			create_wii_saveload_screen header = qs(0xaa163738) message = 0xd4b8e2fa option1_text = qs(0xf7723015) option2_text = qs(0xc2993a50) option1_script = ui_wii_trc_handle_action option2_script = display_and_continue_access option1_params = {action = leave_saveload_flow} option2_params = {<...>}
		endif
	else
		SpawnScriptNow display_and_continue_access params = {<...>}
	endif
endscript

script display_and_continue_access 
	if (<call> != NULL)
		if 0x8658e568
			destroy_loading_screen
		endif
		fadetoblack \{OFF
			time = 0
			no_wait}
		destroy_wii_saveload_screen
		GetStartTime
		Change save_message_start_time = <starttime>
		if NOT progressfileexists
			<save_or_load> = saving
		endif
		if NOT ($enable_saving = 0)
			if NOT (<Type> = replace)
				create_wii_saveload_screen header = qs(0x0bc7ea42) message = <save_or_load>
			endif
			0x928a98c9
			Wait \{15
				gameframes}
		endif
	endif
	<call> <...>
	if isngc
		memcard_sequence_reset_flags
		if GotParam \{0x6d221ff1}
			show_wii_handle_trc event_params = {memcard_status = <memcard_status> event_params = <event_params> Type = <Type>} 0x6d221ff1
		else
			show_wii_handle_trc event_params = {memcard_status = <memcard_status> event_params = <event_params> Type = <Type>}
		endif
	endif
endscript

script ui_destroy_memcard 
	if ScreenElementExists \{id = wii_trc_container}
		destroy_wii_trc_menu
	endif
	if ($0xcb35682e = true)
		set_home_button_allowed
	endif
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
	Change \{memcard_initial_boot = 0}
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
	if GotParam \{0x6d221ff1}
		0xf7e0f992 \{Wait}
	elseif GotParam \{event_params}
		if StructureContains structure = <event_params> data
			if StructureContains structure = (<event_params>.data) 0x6d221ff1
				0xf7e0f992 \{Wait
					0xdf3c5641}
			endif
		endif
	endif
	if GotParam \{success}
		if NOT current_band_save_created
			if NOT GotParam \{controller}
				controller = ($primary_controller)
			endif
			if GotParam \{controller}
				get_savegame_from_controller controller = <controller>
				get_current_band_info
				SetGlobalTags savegame = <savegame> <band_info> params = {save_created = 1}
			else
			endif
		endif
	endif
	switch <Type>
		case boot
		if current_band_has_band_name
			hide_glitch \{num_frames = 5}
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_mainmenu_intro
				}}
		else
			if NOT GotParam \{boot_disable_saveload}
				hide_glitch \{num_frames = 5}
				ui_event_wait \{event = menu_replace
					data = {
						state = uistate_band_name_logo
						from_boot = 1
					}}
			else
				hide_glitch \{num_frames = 5}
				ui_event_wait \{event = menu_replace
					data = {
						state = uistate_mainmenu_intro
					}}
			endif
		endif
		case autosave
		if ScriptIsRunning \{handle_signin_changed}
			mark_safe_for_shutdown
			return
		endif
		if NOT GotParam \{0x8c5ef959}
			if GotParam \{success}
				ui_event_wait <event_params>
			elseif GotParam \{failed}
				ui_event_wait <event_params>
			endif
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
		case replace
		if GotParam \{success}
			generic_event_choose \{no_sound
				state = uistate_boot_iis
				data = {
					clear_previous_stack
					0x6d221ff1
				}}
		elseif GotParam \{failed}
			ui_event_wait <event_params>
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
			Change \{jam_selected_song = $memcard_jamsession_file_name}
		elseif GotParam \{failed}
			ui_event \{event = menu_back}
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
		default
		printf qs(0x6c0b4ff6) t = <Type>
		ScriptAssert \{qs(0x68b00d96)}
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
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if ScreenElementExists \{id = menu_backdrop_container}
		DestroyScreenElement \{id = menu_backdrop_container}
	endif
	generic_event_choose no_sound state = uistate_memcard data = {Type = autosave event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_autosave_replace \{event = menu_back
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if ScreenElementExists \{id = menu_backdrop_container}
		DestroyScreenElement \{id = menu_backdrop_container}
	endif
	ui_event event = menu_replace data = {state = uistate_memcard Type = autosave event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_autoload \{this_event = menu_change
		event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound event = <this_event> state = uistate_memcard data = {Type = autoload event_params = {event = <event> data = <data>} controller = <controller>}
endscript

script ui_memcard_save \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {Type = save event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_load \{this_event = menu_change
		event = menu_replace
		data = {
		}}
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
	generic_event_choose state = <state>
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
