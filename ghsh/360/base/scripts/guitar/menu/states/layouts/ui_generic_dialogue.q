
script ui_create_generic_dialogue \{choose_yes_func = nullscript
		choose_no_func = generic_event_back}
	create_popup_warning_menu {
		title = <title>
		textblock = {
			text = <text>
		}
		options = [
			{
				func = <choose_no_func>
				func_params = <choose_no_params>
				text = qs(0x47157885)
			}
			{
				func = <choose_yes_func>
				func_params = <choose_yes_params>
				text = qs(0x6d562a67)
			}
		]
		no_background
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_event_back}]
	}
	clean_up_user_control_helpers
	if GotParam \{highlight_no}
		LaunchEvent \{Type = unfocus
			target = pu_warning_vmenu}
		LaunchEvent \{Type = focus
			target = pu_warning_vmenu
			data = {
				child_index = 0
			}}
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	SoundEvent \{event = ui_sfx_select}
endscript

script ui_destroy_generic_dialogue 
	destroy_popup_warning_menu
endscript
