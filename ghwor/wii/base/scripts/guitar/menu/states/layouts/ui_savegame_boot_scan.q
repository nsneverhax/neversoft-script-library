initial_load_done = 0

script ui_init_savegame_boot_scan 
	disablereset
	if isps3
		Change \{please_dont_turn_off_text = qs(0x7174fcf9)}
		Change \{please_dont_turn_off_text_1 = qs(0xf5011a39)}
		Change \{please_dont_turn_off_text_2 = qs(0xc664f254)}
	else
		Change \{please_dont_turn_off_text = qs(0x55bd9e8f)}
		Change \{please_dont_turn_off_text_1 = qs(0x8fdf9acc)}
		Change \{please_dont_turn_off_text_2 = qs(0xb5ebc165)}
	endif
	savegame_set_ui_state \{state = boot}
	Change \{initial_load_done = 1}
endscript

script ui_deinit_savegame_boot_scan 
	savegame_set_ui_state \{state = fullscreen}
	set_home_button_allowed
	enablereset
endscript

script ui_create_savegame_boot_scan 
	printscriptinfo \{'ui_create_savegame_boot_scan'}
	if NOT GotParam \{finished_scan}
		set_home_button_notallowed
		SpawnScriptNow \{ui_create_savegame_boot_scan_spawned}
	else
		output_status_end \{prefix = 'boots'}
		interlock \{lock_name = lock_freeplay}
	endif
endscript

script ui_create_savegame_boot_scan_spawned 
	if demobuild
		interlock \{lock_name = lock_savegame}
		interlock \{lock_name = lock_freeplay}
		return
	endif
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
	hide_glitch \{num_frames = 5}
	printscriptinfo \{'ui_destroy_savegame_boot_scan'}
endscript
