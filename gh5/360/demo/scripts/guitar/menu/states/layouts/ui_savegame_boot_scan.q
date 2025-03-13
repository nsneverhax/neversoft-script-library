
script ui_init_savegame_boot_scan 
	if isps3
		change \{please_dont_turn_off_text = qs(0x7a729c9b)}
		change \{please_dont_turn_off_text_2 = qs(0x8663c428)}
		change \{please_dont_turn_off_text_3 = qs(0x91957535)}
	else
		change \{please_dont_turn_off_text = qs(0x7ebe519e)}
		change \{please_dont_turn_off_text_2 = qs(0xd4e68932)}
		change \{please_dont_turn_off_text_3 = qs(0x97ec71c2)}
	endif
	savegame_set_ui_state \{state = boot}
	change \{memcard_boot_process = true}
endscript

script ui_deinit_savegame_boot_scan 
	savegame_set_ui_state \{state = fullscreen}
	change \{memcard_boot_process = false}
endscript

script ui_create_savegame_boot_scan 
	printscriptinfo \{'ui_create_savegame_boot_scan'}
	if NOT gotparam \{finished_scan}
		spawnscriptnow \{ui_create_savegame_boot_scan_spawned}
	else
		if NOT ismovieplaying \{textureslot = 2}
			spawnscriptnow \{play_memcard_error_loading_screen}
		endif
		output_status_end \{prefix = 'boots'}
		interlock \{lock_name = lock_freeplay}
	endif
endscript

script play_memcard_error_loading_screen 
	destroy_loading_screen
	change \{is_changing_levels = 0}
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
	if controllerpressed x <i>
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
	ui_event_wait event = menu_change data = {state = uistate_memcard type = boot event_params = <event_params>}
endscript

script is_controller_connected 
	requireparams \{[
			controller
		]
		all}
	getactivecontrollers
	getarraysize <active_controllers>
	if ((<controller> >= <array_size>) || (<controller> < 0))
		scriptassert 'Controller %s is out of range' s = <controller>
		return \{true}
	endif
	if (<active_controllers> [<controller>] = 1)
		return \{true}
	endif
	return \{false}
endscript

script is_anyone_locally_signed_in 
	if isxenon
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
		return \{false}
	else
		return \{true}
	endif
endscript

script ui_destroy_savegame_boot_scan 
	printscriptinfo \{'ui_destroy_savegame_boot_scan'}
endscript
