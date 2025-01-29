
script ui_create_invalid_instrument 
	Change \{band_mode_menu_tags = None}
	options = [
		{
			func = generic_event_back
			func_params = {state = uistate_band_mode}
			text = qs(0x320a8d1c)
		}
		{
			func = generic_event_back
			func_params = {state = uistate_mainmenu}
			text = qs(0xd95645dd)
		}
	]
	if GotParam \{from_faceoff}
		options = [
			{
				func = generic_event_back
				func_params = {state = uistate_select_controller}
				text = qs(0x320a8d1c)
			}
			{
				func = generic_event_back
				func_params = {state = uistate_mainmenu}
				text = qs(0xd95645dd)
			}
		]
	endif
	create_popup_warning_menu {
		textblock = {
			text = qs(0xc9f6bdec)
			dims = (800.0, 400.0)
			Scale = 0.55
		}
		player_device = $primary_controller
		no_background
		menu_pos = (640.0, 520.0)
		options = <options>
	}
endscript

script ui_destroy_invalid_instrument 
	destroy_popup_warning_menu
endscript
