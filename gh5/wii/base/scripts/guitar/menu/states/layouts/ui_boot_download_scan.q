
script ui_init_boot_download_scan 
endscript

script ui_create_boot_download_scan 
	SpawnScriptNow boot_download_sync_sd_and_continue params = <...>
	return
	Change store_respond_to_signin_changed = ($respond_to_signin_changed)
	Change \{respond_to_signin_changed = 1}
	get_savegame_from_controller controller = <controller>
	savegame_ui_begin savegame = <savegame> text = qs(0x16e12c9c)
	SpawnScriptNow boot_download_scan params = {controller = <controller> <...>}
endscript

script boot_download_sync_sd_and_continue 
	push_block_home_button
	EnumContentFiles
	WaitOneGameFrame
	dlccatalogmanagerfunc \{func = sync_and_load_catalogs}
	begin
	if NOT dlccatalogmanagerfunc \{func = is_busy}
		break
	endif
	WaitOneGameFrame
	repeat
	pop_block_home_button
	SpawnScriptNow ui_event_wait params = <event_params>
endscript

script boot_download_scan 
	RequireParams \{[
			event_params
			savegame
		]
		all}
	setscriptcannotpause
	Wait \{1
		gameframes}
	if NOT ui_event_exists_in_stack \{Name = 'mainmenu'}
		if ControllerPressed X <controller>
			if ControllerPressed circle <controller>
				if ControllerPressed Square <controller>
					if ControllerPressed Triangle <controller>
						printf \{qs(0xa1f3a821)}
						removecontentfiles \{playerid = -1
							clear_cache}
					endif
				endif
			endif
		endif
	endif
	GetTrueStartTime
	Downloads_EnumContent controller = <controller>
	begin
	GetTrueElapsedTime starttime = <starttime>
	if (<ElapsedTime> > 1000)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	savegame_ui_end savegame = <savegame>
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	ui_event_wait <event_params>
	Change respond_to_signin_changed = ($store_respond_to_signin_changed)
endscript

script ui_destroy_boot_download_scan 
endscript

script ui_deinit_boot_download_scan 
endscript
