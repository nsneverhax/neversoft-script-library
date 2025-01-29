
script create_wuss_out_menu 
	Change \{boss_wuss_out = 0}
	player_device = ($last_start_pressed_device)
	if ($current_song = bosstom)
		warning_text = qs(0x4b62c0f9)
	elseif ($current_song = bossslash)
		warning_text = qs(0x497bd4be)
	endif
	disable_pause
	create_popup_warning_menu {
		title = qs(0xb0799d7a)
		textblock = {
			text = <warning_text>
			dims = (880.0, 600.0)
			Pos = (640.0, 387.0)
			Scale = 0.55
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 470.0)
		options = [
			{
				func = wuss_out_menu_continue
				text = qs(0x182f0173)
			}
			{
				func = wuss_out_menu_wuss_out
				text = qs(0xb9f629d3)
			}
		]
	}
endscript

script destroy_wuss_out_menu 
	destroy_popup_warning_menu
endscript

script wuss_out_menu_continue 
	generic_event_choose \{event = menu_replace
		state = uistate_fail_song}
endscript

script wuss_out_menu_wuss_out 
	generic_event_back \{state = uistate_setlist
		data = {
			no_jamsession
		}}
endscript
