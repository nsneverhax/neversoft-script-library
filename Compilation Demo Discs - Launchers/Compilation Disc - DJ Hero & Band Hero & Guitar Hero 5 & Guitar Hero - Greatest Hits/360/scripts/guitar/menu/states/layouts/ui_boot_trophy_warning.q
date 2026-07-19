
script ui_create_boot_trophy_warning 
	create_popup_warning_menu {
		player_device = <controller>
		title = qs("WARNING")
		textblock = {
			text = qs("Insufficient HDD space to create trophy data. You will not be able to unlock trophies if you continue without the necessary free space.")
		}
		options = [
			{
				func = generic_event_replace
				func_params = {state = uistate_boot_download_scan data = {controller = <controller> boot}}
				text = qs("CONTINUE")
				sound_func = nullscript
			}
		]
	}
endscript

script ui_destroy_boot_trophy_warning 
	destroy_popup_warning_menu
endscript
