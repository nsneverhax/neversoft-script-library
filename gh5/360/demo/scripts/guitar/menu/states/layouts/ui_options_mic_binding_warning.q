
script ui_create_options_mic_binding_warning 
	body = qs(0xadbbe1c7)
	if NOT gotparam \{controller}
		<controller> = $primary_controller
	endif
	create_dialog_box {
		body_text = <body>
		player_device = <controller>
		no_background
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0xf7723015)
			}
			{
				func = ui_event
				func_params = {event = menu_replace data = {state = uistate_mic_binding controller = <controller> from_pause_menu = 1}}
				text = qs(0x4d62e1f6)
			}
		]
	}
endscript

script ui_destroy_options_mic_binding_warning \{complete_script = nullscript}
	destroy_dialog_box
endscript
