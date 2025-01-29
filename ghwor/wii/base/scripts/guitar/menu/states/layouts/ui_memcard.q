g_memcard_state_active = 0
ps3_autosave_warning_shown = 0
save_message_start_time = -1

script ui_init_memcard 
	Change \{g_memcard_state_active = 1}
	sdcardmanagerfunc \{func = push_lock_card}
	if savegame_async_is_busy
		ScriptAssert \{'Savegame_async operations are still occuring, cannot do full UI state memcard stuff right now'}
	endif
	memcard_controller_reset
	if (<Type> = autosave)
		stars
		if isps3
			printf \{'Regular PS3 save'}
			memcard_controller_add controller = ($primary_controller)
		else
			if GotParam \{event_params}
				if StructureContains structure = <event_params> data
					if StructureContains structure = (<event_params>.data) savegame
						printf 'Saving specific savegame %d' d = ((<event_params>.data).savegame)
						memcard_controller_add controller = ((<event_params>.data).savegame)
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
memcard_hide_flares = 0

script ui_create_memcard \{event_params = {
			event = menu_back
		}
		show_mainmenu_bg = 0}
	SpawnScriptNow ui_create_memcard_spawned params = <...>
endscript

script ui_create_memcard_spawned 
	if ($memcard_hide_flares = 0)
		push_hide_flares
		Change \{memcard_hide_flares = 1}
	endif
	set_home_button_notallowed
	StartRendering
	if (<show_mainmenu_bg> = 1)
		create_mainmenu_bg
	endif
	printscriptinfo \{qs(0x2dee5317)}
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
	if ($g_boot_sysnotify_wait = FALSE)
		Change \{respond_to_signin_changed = 1}
	endif
	Change \{memcardcontroller = $primary_controller}
	cas_queue_wait
	switch <Type>
		case boot
		printf \{channel = clayton
			qs(0xb22fb964)}
		Change \{memcardcontroller = 0}
		call = wii_memcard_sequence_begin_bootup
		StorageSelectorForce = 1
		<save_or_load> = loading
		case autosave
		printf \{channel = clayton
			qs(0x0c2015f1)}
		if ($enable_saving = 0)
			SetGlobalTags \{user_options
				params = {
					autosave = $enable_saving
				}}
		endif
		call = wii_memcard_sequence_begin_autosave
		<save_or_load> = saving
		case autoload
		printf \{channel = clayton
			qs(0x696088e0)}
		call = wii_memcard_sequence_begin_autoload
		<save_or_load> = loading
		case save
		printf \{channel = clayton
			qs(0x7e56dd9d)}
		call = wii_memcard_sequence_begin_save
		<save_or_load> = saving
		case load
		printf \{channel = clayton
			qs(0x1b16408c)}
		call = wii_memcard_sequence_begin_load
		<save_or_load> = loading
		case save_jam
		printf \{channel = clayton
			qs(0xca36476e)}
		call = wii_memcard_sequence_begin_save_jam
		<save_or_load> = saving
		<OverwriteConfirmed> = 1
		case load_jam
		printf \{channel = clayton
			qs(0xaab29376)}
		call = wii_memcard_sequence_begin_load_jam
		<save_or_load> = loading
		<OverwriteConfirmed> = 1
		case delete_jam
		printf \{channel = clayton
			qs(0x9f612940)}
		call = wii_memcard_sequence_begin_delete_jam
		<save_or_load> = deleting
		case rename_jam
		printf \{channel = clayton
			qs(0x5d66dda9)}
		call = wii_memcard_sequence_begin_rename_jam
		<save_or_load> = saving
	endswitch
	if (<Type> = autosave)
		if NOT memcard_controller_get_next
			ScriptAssert \{'This should never happen, there should always be a controller to use here'}
		endif
	endif
	if demobuild
		skip_savegame = 1
	endif
	if GotParam \{skip_savegame}
		ui_event_wait <event_params>
		interlock \{lock_name = lock_savegame}
		return
	endif
	SpawnScriptNow display_and_continue_access params = {<...>}
endscript

script display_and_continue_access \{OverwriteConfirmed = 0}
	if (<call> != NULL)
		destroy_wii_saveload_screen
		GetStartTime
		Change save_message_start_time = <starttime>
		if NOT progressfileexists
			<save_or_load> = saving
		endif
		if NOT ($enable_saving = 0)
			if (<OverwriteConfirmed> = 1)
				set_home_button_notallowed
				memcard_cleanup_messages
				text = qs(0xe75bbd7c)
				if (<save_or_load> = loading)
					text = qs(0xc368df8a)
				endif
				savegame_ui_begin savegame = 0 text = <text>
				Wait \{3
					frames}
			else
				Change \{MemcardDoneScript = memcard_sequence_generic_done}
				if ((<save_or_load> = loading) && (<call> != wii_memcard_sequence_begin_bootup) && (<call> != wii_memcard_sequence_begin_autoload) && (<call> != memcard_sequence_begin_load_jam))
					Goto create_confirm_load_menu params = <...>
				elseif (<save_or_load> = saving && (<call> != wii_memcard_sequence_begin_bootup) && (<call> != wii_memcard_sequence_begin_autosave) && (<call> != memcard_sequence_begin_save_jam))
					Goto create_confirm_overwrite_menu params = <...>
				endif
			endif
		endif
	endif
	<call> <...>
	if isngc
		memcard_sequence_reset_flags
		show_wii_handle_trc event_params = {memcard_status = <memcard_status> event_params = <event_params> Type = <Type>}
	endif
endscript

script ui_destroy_memcard \{show_mainmenu_bg = 0}
	set_home_button_allowed
	if ScreenElementExists \{id = wii_trc_container}
		destroy_wii_trc_menu
	endif
	if ScreenElementExists \{id = boot_scan_background}
		DestroyScreenElement \{id = boot_scan_background}
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	if (<show_mainmenu_bg> = 1)
		destroy_mainmenu_bg
	endif
	update_download_song_killswitch_from_globaltags
	savegame_ui_end \{savegame = 0}
	SpawnScriptNow \{memcard_sequence_cleanup_generic}
	if ($memcard_hide_flares = 1)
		pop_hide_flares
		Change \{memcard_hide_flares = 0}
	endif
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
		endif
	endif
	sdcardmanagerfunc \{func = pop_lock_card}
endscript

script ui_memcard_finish 
	ui_event_get_stack
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	current_menu :GetTags
	if ($g_boot_sysnotify_wait = FALSE)
		Change respond_to_signin_changed = <signin_changed>
	endif
	printf \{qs(0x885c1b25)}
	printstruct <...>
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
	hide_glitch \{num_frames = 8}
	switch <Type>
		case boot
		interlock \{lock_name = lock_savegame}
		if GotParam \{success}
			output_status \{prefix = 'boots'
				text = 'Download scan'}
			ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan event_params = <event_params> controller = <controller>}
		elseif GotParam \{failed}
			ui_event_wait <event_params>
		endif
		case single_signin
		if GotParam \{success}
			ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan show_mainmenu_bg = 1 event_params = <event_params> controller = <controller>}
		elseif GotParam \{failed}
			ui_event_wait <event_params>
		endif
		case autosave
		if ScriptIsRunning \{handle_signin_changed}
			popunsafeforshutdown \{context = memcard
				Type = unchecked}
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
		default
		printf qs(0x6c0b4ff6) t = <Type>
		ScriptAssert \{qs(0x68b00d96)}
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
		}
		show_mainmenu_bg = 0}
	printscriptinfo \{'ui_memcard_autosave'}
	if ($enable_saving = 0)
		generic_event_back state = <state>
		return
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if GotParam \{is_popup}
		generic_event_choose no_sound state = uistate_memcard data = {is_popup Type = autosave show_mainmenu_bg = <show_mainmenu_bg> event_params = {event = <event> data = <data>} num_players_saving = 1}
	else
		generic_event_choose no_sound state = uistate_memcard data = {Type = autosave show_mainmenu_bg = <show_mainmenu_bg> event_params = {event = <event> data = <data> num_players_saving = 1}}
	endif
endscript

script ui_memcard_autosave_replace \{event = menu_back
		data = {
		}
		show_mainmenu_bg = 0}
	printscriptinfo \{'ui_memcard_autosave_replace'}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if GotParam \{menu_music}
		switch <menu_music>
			case On
			SpawnScriptNow \{audio_ui_menu_music_on}
			default
			printf \{channel = sfx
				qs(0xf791d105)}
		endswitch
	endif
	if GotParam \{is_popup}
		ui_event event = menu_replace data = {is_popup state = uistate_memcard Type = autosave show_mainmenu_bg = <show_mainmenu_bg> event_params = {event = <event> data = <data>}}
	else
		ui_event event = menu_replace data = {state = uistate_memcard Type = autosave show_mainmenu_bg = <show_mainmenu_bg> event_params = {event = <event> data = <data>}}
	endif
endscript

script ui_memcard_save \{event = menu_replace
		data = {
		}
		show_mainmenu_bg = 0}
	printscriptinfo \{'ui_memcard_save'}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {
		Type = save
		show_mainmenu_bg = <show_mainmenu_bg>
		event_params = {event = <event> data = <data>}
	}
endscript

script ui_memcard_load \{this_event = menu_change
		event = menu_replace
		data = {
		}
		manual_load = 0
		show_mainmenu_bg = 0}
	printscriptinfo \{'ui_memcard_load'}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	hide_glitch \{num_frames = 4}
	generic_event_choose event = <this_event> state = uistate_memcard data = {
		Type = load
		show_mainmenu_bg = <show_mainmenu_bg>
		event_params = {event = <event> data = <data>}
	}
endscript

script ui_memcard_save_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	printf \{qs(0x03ac90f0)}
	printf \{'^^^^^^^^^^^^^^^ ui_memcard_save_jam ^^^^^^^^^^^^^^^'}
	printstruct <...>
	printf \{qs(0x03ac90f0)}
	printf \{qs(0x03ac90f0)}
	generic_event_choose no_sound state = uistate_memcard data = {Type = save_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_delete_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {Type = delete_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_autosave_all_players \{memcard_event = menu_change
		event = menu_back
		data = {
		}}
	ui_memcard_autosave <...>
endscript

script ui_memcard_secondary_siginin_load \{event = menu_replace
		data = {
		}}
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

script memcard_controller_add 
	if NOT ArrayContains array = $memcard_controller_list contains = <controller>
		AddArrayElement array = $memcard_controller_list element = <controller>
		Change memcard_controller_list = <array>
	endif
endscript

script memcard_controller_add_signed_in_and_valid 
	memcard_controller_add controller = ($primary_controller)
	printf 'memcard_controller_add_signed_in_and_valid - Saving %d' d = ($primary_controller)
	if isXenon
		getnumplayersingame
		getnumplayersingame \{on_screen}
		if (<num_players> > 0)
			getfirstplayer \{on_screen}
			begin
			getplayerinfo <Player> controller
			getsavegamefromcontroller controller = <controller>
			if CheckForSignIn local controller_index = <savegame>
				printf 'memcard_controller_add_signed_in_and_valid - Saving %d' d = <savegame>
				memcard_controller_add controller = <savegame>
			endif
			getnextplayer on_screen Player = <Player>
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
