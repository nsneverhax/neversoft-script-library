
script ui_create_leaderboard_timeout 
	if isxenon
		text = qs(0x417d33b3)
	else
		text = qs(0xcb2a97e7)
	endif
	if gotparam \{cable_unplugged}
		text = (<text> + qs(0x713755f7) + qs(0x0df6659c))
	elseif gotparam \{lost_lobby_connection}
		text = (<text> + qs(0x713755f7) + qs(0x474948fe))
	endif
	text = (<text> + qs(0x713755f7) + qs(0x0205395b))
	create_popup_warning_menu {
		player_device = ($lb_controller)
		title = qs(0xaa163738)
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

script ui_destroy_leaderboard_timeout 
	destroy_popup_warning_menu
endscript
