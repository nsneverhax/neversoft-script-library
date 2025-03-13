
script ui_create_generic_dialog_box template = cancel_confirm confirm_func = generic_event_back confirm_func_params = {nosound} cancel_func = generic_event_back cancel_func_params = {nosound} player_device = ($primary_controller)
	switch <template>
		case cancel_confirm
		generic_dialog_box_create_cancel_confirm_template <...>
		case continue
		generic_dialog_box_create_continue_template <...>
	endswitch
endscript

script generic_dialog_box_create_cancel_confirm_template 
	if NOT gotparam \{options}
		<options> = [
			{
				func = <cancel_func>
				func_params = <cancel_func_params>
				text = qs(0xf7723015)
			}
			{
				func = <confirm_func>
				func_params = <confirm_func_params>
				text = qs(0x326e2d2f)
			}
		]
	endif
	if gotparam \{back_button_script}
		if NOT gotparam \{back_button_params}
			<back_button_params> = {}
		endif
		create_dialog_box {
			no_background
			player_device = <player_device>
			heading_text = <heading_text>
			body_text = <body_text>
			options = <options>
			back_button_script = <back_button_script>
			back_button_params = <back_button_params>
		}
	else
		create_dialog_box {
			no_background
			player_device = <player_device>
			heading_text = <heading_text>
			body_text = <body_text>
			options = <options>
		}
	endif
endscript

script generic_dialog_box_create_continue_template 
	create_dialog_box {
		heading_text = <heading_text>
		body_text = <body_text>
		options = [
			{
				func = <confirm_func>
				func_params = <confirm_func_params>
				text = qs(0x182f0173)
			}
		]
		player_device = <player_device>
		no_background
	}
endscript

script ui_destroy_generic_dialog_box 
	destroy_dialog_box
endscript
