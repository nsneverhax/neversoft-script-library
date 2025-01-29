
script ui_create_boot_download_scan \{show_mainmenu_bg = 0}
	SpawnScriptNow boot_download_sync_sd_and_continue params = <...>
endscript

script ui_destroy_boot_download_scan \{show_mainmenu_bg = 0}
	if (<show_mainmenu_bg> = 1)
		destroy_mainmenu_bg
	endif
endscript

script ui_deinit_boot_download_scan 
endscript

script boot_download_sync_sd_and_continue 
	if (<show_mainmenu_bg> = 1)
		create_mainmenu_bg
	endif
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
