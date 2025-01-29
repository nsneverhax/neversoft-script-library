
script ui_create_leaderboard_empty 
	<text> = qs(0xfab51260)
	if NOT NetSessionFunc \{func = is_lobby_available}
		<text> = qs(0x0f686da5)
	endif
	if NetSessionFunc \{func = iscableunplugged}
		<text> = qs(0x0df6659c)
	endif
	create_dialog_box {
		exclusive_device = ($lb_controller)
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

script ui_destroy_leaderboard_empty 
	destroy_dialog_box
endscript
