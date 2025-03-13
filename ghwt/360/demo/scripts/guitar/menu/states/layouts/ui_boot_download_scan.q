
script ui_create_boot_download_scan 
	spawnscriptnow boot_download_scan params = {controller = <controller> <...>}
endscript

script boot_download_scan \{event_params = {
			event = menu_replace
			data = {
				state = uistate_boot_guitar
			}
		}}
	ui_event_wait <event_params>
endscript

script ui_destroy_boot_download_scan 
	destroy_popup_warning_menu
endscript
