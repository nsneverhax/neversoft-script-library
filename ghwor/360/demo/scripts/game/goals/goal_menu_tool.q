
script goal_menu_tool_create_menu 
	switch <template>
		case dialog_box
		<heading_text> = (<template_settings>.heading_text)
		<body_text> = (<template_settings>.body_text)
		<options> = (<template_settings>.options)
		if gotparam \{new_state}
			generic_event_choose state = uistate_generic_dialog_box data = {heading_text = <heading_text> body_text = <body_text> options = <options>}
		else
			create_dialog_box {
				no_background
				heading_text = <heading_text>
				body_text = <body_text>
				options = <options>
			}
		endif
		default
		script_assert \{qs(0xfa8286c0)}
	endswitch
endscript

script goal_menu_tool_destroy_menu 
	switch <template>
		case dialog_box
		if gotparam \{new_state}
			ui_sfx \{menustate = generic
				uitype = back}
			generic_event_back
		else
			destroy_dialog_box
		endif
		default
		script_assert \{qs(0xfa8286c0)}
	endswitch
endscript
