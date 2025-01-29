
script ui_create_optimal_drum 
	create_popup_warning_menu {
		textblock = {
			text = qs(0xcf21663e)
		}
		player_device = $primary_controller
		options = [
			{
				func = ui_optimal_drum_continue
				func_params = {event_params = <event_params>}
				text = qs(0x182f0173)
			}
		]
	}
endscript

script ui_destroy_optimal_drum 
	destroy_popup_warning_menu
endscript

script ui_optimal_drum_continue 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_event_wait <event_params>
endscript
