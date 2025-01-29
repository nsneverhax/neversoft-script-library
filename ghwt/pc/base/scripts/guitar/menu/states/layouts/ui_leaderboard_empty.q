
script ui_create_leaderboard_empty 
	<text> = qs(0xf8ff983c)
	<title> = qs(0x93f14ddd)
	if NOT netsessionfunc \{func = is_lobby_available}
		<text> = qs(0x0f686da5)
		<title> = qs(0xaa163738)
	endif
	create_popup_warning_menu {
		exclusive_device = ($lb_controller)
		title = <title>
		textblock = {
			text = <text>
		}
		options = [
			{
				func = generic_event_back
				text = qs(0x182f0173)
				sound_func = nullscript
			}
		]
	}
endscript

script ui_destroy_leaderboard_empty 
	destroy_popup_warning_menu
endscript
