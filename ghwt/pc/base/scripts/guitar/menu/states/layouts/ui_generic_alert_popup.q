
script ui_create_generic_alert_popup pad_choose_script = generic_event_back player_device = ($primary_controller)
	printstruct <...>
	create_popup_warning_menu {
		title = <title>
		textblock = {
			text = <text>
		}
		options = [
			{
				func = <pad_choose_script>
				func_params = <pad_choose_params>
				text = qs(0x494b4d7f)
			}
		]
		player_device = <player_device>
		no_background
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back nullscript}]
	}
endscript

script ui_destroy_generic_alert_popup 
	destroy_popup_warning_menu
endscript
