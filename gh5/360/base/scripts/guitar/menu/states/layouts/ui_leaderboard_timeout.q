
script ui_create_leaderboard_timeout 
	if isxenonorwindx
		text = qs(0x417d33b3)
	else
		text = qs(0x18d469e3)
	endif
	if GotParam \{cable_unplugged}
		text = (<text> + qs(0x713755f7) + qs(0x0df6659c))
	elseif GotParam \{lost_lobby_connection}
		text = (<text> + qs(0x713755f7) + qs(0x474948fe))
	endif
	text = (<text> + qs(0x713755f7) + qs(0x0205395b))
	create_dialog_box {
		player_device = ($lb_controller)
		heading_text = qs(0xaa163738)
		body_text = <text>
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0x182f0173)
				sound_func = nullscript
			}
		]
	}
endscript

script ui_destroy_leaderboard_timeout 
	destroy_dialog_box
endscript
