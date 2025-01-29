
script ui_create_select_instrument_warning \{addmainmenu = 1}
	switch (<instrument>)
		case guitar
		case bass
		text = qs(0x9aef203e)
		case drum
		text = qs(0x514a4c71)
		case vocals
		if isXenon
			text = qs(0xec4dbd17)
		else
			text = $wii_connect_logitech
		endif
	endswitch
	ui_event_exists_in_stack \{Name = 'band_mode'}
	printstruct <...>
	if ui_event_exists_in_stack \{Name = 'band_mode'}
		if ($is_network_game = 1)
			if (<addmainmenu> = 1)
				options = [
					{
						func = check_for_guitar
						func_params = {controller = controller}
						text = qs(0x182f0173)
					}
					{
						func = generic_event_back
						func_params = {state = uistate_mainmenu}
						text = qs(0xd95645dd)
					}
				]
			else
				options = [
					{
						func = check_for_guitar
						func_params = {controller = controller}
						text = qs(0x182f0173)
					}
				]
			endif
		else
			if (<addmainmenu> = 1)
				options = [
					{
						func = generic_event_back
						text = qs(0x320a8d1c)
					}
					{
						func = generic_event_back
						func_params = {state = uistate_mainmenu}
						text = qs(0xd95645dd)
					}
				]
			else
				options = [
					{
						func = generic_event_back
						text = qs(0x320a8d1c)
					}
				]
			endif
		endif
	else
		if (<addmainmenu> = 1)
			options = [
				{
					func = generic_event_back
					text = qs(0x320a8d1c)
				}
				{
					func = generic_event_back
					func_params = {state = uistate_mainmenu}
					text = qs(0xd95645dd)
				}
			]
		else
			options = [
				{
					func = generic_event_back
					text = qs(0x320a8d1c)
				}
			]
		endif
	endif
	create_dialog_box {
		body_text = <text>
		player_device = ($primary_controller)
		no_background
		options = <options>
	}
endscript

script ui_destroy_select_instrument_warning 
	destroy_dialog_box
endscript

script check_for_guitar 
	get_controller_type controller_index = <controller>
	if (<controller_type> = guitar)
		generic_event_back
	endif
endscript
