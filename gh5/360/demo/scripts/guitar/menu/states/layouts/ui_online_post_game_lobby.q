network_game_postgame_lobby = 0

script postgame_lobby_quit 
	if gotparam \{device_num}
		if (<device_num> = $primary_controller)
			if gotparam \{id}
				launchevent type = unfocus target = <id>
			endif
			ui_event_wait_for_safe
			ui_event_get_top
			if gotparam \{is_popup}
				generic_event_replace \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
			else
				generic_event_choose \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
			endif
		endif
	endif
endscript
