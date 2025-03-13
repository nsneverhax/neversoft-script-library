
script ui_create_generic_dialog_box {
		template = cancel_confirm
		confirm_func = generic_event_back
		confirm_func_params = {nosound}
		cancel_func = generic_event_back
		cancel_func_params = {nosound}
		player_device = ($primary_controller)
		show_mainmenu_bg = 0
	}
	if (<show_mainmenu_bg> = 1)
		create_mainmenu_bg
	endif
	cleanup_cas_menu_handlers
	switch <template>
		case cancel_confirm
		generic_dialog_box_create_cancel_confirm_template <...>
		case continue
		generic_dialog_box_create_continue_template <...>
	endswitch
endscript

script generic_dialog_box_create_cancel_confirm_template \{confirm_text = qs(0x326e2d2f)
		cancel_text = qs(0xf7723015)}
	if NOT gotparam \{options}
		<options> = [
			{
				func = <cancel_func>
				func_params = <cancel_func_params>
				text = <cancel_text>
			}
			{
				func = <confirm_func>
				func_params = <confirm_func_params>
				text = <confirm_text>
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
			dlg_z_priority = <dlg_z_priority>
		}
	else
		create_dialog_box {
			no_background
			player_device = <player_device>
			heading_text = <heading_text>
			body_text = <body_text>
			options = <options>
			dlg_z_priority = <dlg_z_priority>
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

script ui_destroy_generic_dialog_box \{show_mainmenu_bg = 0}
	if (<show_mainmenu_bg> = 1)
		destroy_mainmenu_bg
	endif
	destroy_dialog_box
endscript
