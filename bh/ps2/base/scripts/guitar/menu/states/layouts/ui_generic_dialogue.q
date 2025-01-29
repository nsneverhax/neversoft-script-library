
script ui_create_generic_dialogue \{choose_yes_func = nullscript
		choose_no_func = generic_event_back}
	create_dialog_box {
		heading_text = <title>
		body_text = <text>
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
		back_button_script = generic_event_back
	}
	clean_up_user_control_helpers
	if GotParam \{highlight_no}
		LaunchEvent \{Type = unfocus
			target = dialog_box_vmenu}
		LaunchEvent \{Type = focus
			target = dialog_box_vmenu
			data = {
				child_index = 0
			}}
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	SoundEvent \{0x5ea1b4e0}
endscript

script ui_destroy_generic_dialogue 
	destroy_dialog_box
endscript
