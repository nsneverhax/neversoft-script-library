
script ui_create_select_instrument_warning controller = ($primary_controller)
	set_focus_color
	set_unfocus_color
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
			text = qs(0x588788f4)
		endif
	endswitch
	create_popup_warning_menu {
		textblock = {
			text = <text>
			dims = (800.0, 400.0)
			Scale = 0.55
		}
		player_device = <controller>
		no_background
		menu_pos = (640.0, 520.0)
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
	}
endscript

script ui_destroy_select_instrument_warning 
	destroy_popup_warning_menu
endscript
