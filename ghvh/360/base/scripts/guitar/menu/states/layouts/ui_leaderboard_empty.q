
script ui_create_leaderboard_empty 
	<text> = qs(0x0f686da5)
	if NOT CheckForSignIn network_platform_only controller_index = ($lb_controller)
		if isXenon
			<text> = qs(0x3a2c3ac0)
		elseif isps3
			<text> = qs(0x4b8fed68)
		else
			<text> = qs(0xdfc4f475)
		endif
	else
	endif
	if NetSessionFunc \{func = iscableunplugged}
		<text> = qs(0x0df6659c)
	endif
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
	SetButtonEventMappings \{unblock_menu_input}
	destroy_loading_screen
endscript

script ui_destroy_leaderboard_empty 
	destroy_popup_warning_menu
endscript
