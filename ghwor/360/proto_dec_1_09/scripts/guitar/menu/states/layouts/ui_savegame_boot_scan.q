
script ui_init_savegame_boot_scan 
	if isps3
		Change \{please_dont_turn_off_text = qs(0x7a729c9b)}
		Change \{please_dont_turn_off_text_2 = qs(0x8663c428)}
		Change \{please_dont_turn_off_text_3 = qs(0x91957535)}
	else
		Change \{please_dont_turn_off_text = qs(0x7ebe519e)}
		Change \{please_dont_turn_off_text_2 = qs(0xd4e68932)}
		Change \{please_dont_turn_off_text_3 = qs(0x97ec71c2)}
	endif
	savegame_set_ui_state \{state = boot}
	Change \{memcard_boot_process = true}
endscript

script ui_deinit_savegame_boot_scan 
	savegame_set_ui_state \{state = fullscreen}
	Change \{memcard_boot_process = FALSE}
endscript

script ui_create_savegame_boot_scan 
	printscriptinfo \{'ui_create_savegame_boot_scan'}
	if NOT GotParam \{finished_scan}
		SpawnScriptNow \{ui_create_savegame_boot_scan_spawned}
	else
		if NOT IsMoviePlaying \{textureSlot = 2}
			SpawnScriptNow \{play_memcard_error_loading_screen}
		endif
		output_status_end \{prefix = 'boots'}
		interlock \{lock_name = lock_freeplay}
	endif
endscript

script play_memcard_error_loading_screen 
	destroy_loading_screen
	Change \{is_changing_levels = 0}
	create_loading_screen
endscript

script ui_create_savegame_boot_scan_spawned 
	if demobuild
		interlock \{lock_name = lock_savegame}
		interlock \{lock_name = lock_freeplay}
		return
	endif
	max_controllers = 4
	i = 0
	begin
	if ControllerPressed X <i>
		interlock \{lock_name = lock_savegame}
		interlock \{lock_name = lock_freeplay}
		return
	endif
	i = (<i> + 1)
	repeat <max_controllers>
	event_params = {event = menu_back data = {state = uistate_savegame_boot_scan finished_scan}}
	if NOT is_anyone_locally_signed_in
		output_status \{prefix = 'boots'
			text = 'Unsigned Download scan'}
		ui_event_wait event = menu_change data = {state = uistate_boot_download_scan event_params = <event_params> controller = -1}
		interlock \{lock_name = lock_savegame}
		return
	endif
	ui_event_wait event = menu_change data = {state = uistate_memcard Type = boot event_params = <event_params>}
endscript

script is_controller_connected 
	RequireParams \{[
			controller
		]
		all}
	GetActiveControllers
	GetArraySize <active_controllers>
	if ((<controller> >= <array_Size>) || (<controller> < 0))
		ScriptAssert 'Controller %s is out of range' s = <controller>
		return \{true}
	endif
	if (<active_controllers> [<controller>] = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script is_anyone_locally_signed_in 
	if isXenon
		getmaxcontrollersignins
		userid = 0
		begin
		if is_controller_connected controller = <userid>
			if islocallysignedin controller = <userid>
				return \{true}
			endif
		endif
		userid = (<userid> + 1)
		repeat <max_signins>
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script ui_destroy_savegame_boot_scan 
	printscriptinfo \{'ui_destroy_savegame_boot_scan'}
endscript
