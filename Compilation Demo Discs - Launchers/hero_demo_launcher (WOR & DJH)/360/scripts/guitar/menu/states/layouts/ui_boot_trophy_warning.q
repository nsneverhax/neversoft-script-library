
script ui_create_boot_trophy_warning 
	create_popup_warning_menu {
		player_device = <controller>
		title = qs(0xaa163738)
		textblock = {
			text = qs(0xc83e95d0)
		}
		options = [
			{
				func = generic_event_replace
				func_params = {state = uistate_boot_download_scan data = {controller = <controller> boot}}
				text = qs(0x182f0173)
				sound_func = nullscript
			}
		]
	}
endscript

script ui_destroy_boot_trophy_warning 
	destroy_popup_warning_menu
endscript
