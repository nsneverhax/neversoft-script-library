
script ui_create_generic_alert_popup pad_choose_script = generic_event_back player_device = ($primary_controller)
	0x68f07e06 = {
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
	if GotParam \{use_all_controllers}
		appendstruct \{struct = 0x68f07e06
			Field = use_all_controllers
			params = {
				1
			}}
	endif
	printstruct <...>
	create_popup_warning_menu {<0x68f07e06>}
endscript

script ui_destroy_generic_alert_popup 
	destroy_popup_warning_menu
endscript
