
script ui_create_options_change_progression_warning 
	<func> = options_progression_set_savegame_progression
	<func_params> = {savegame = <savegame> slot = <slot>}
	if gotparam \{is_reset}
		if (<is_reset> = 1)
			<func> = generic_event_replace
			formattext {
				textname = next_message
				qs(0xb691cab7)
				s = <progression_name>
			}
			<func_params> = {state = uistate_options_change_progression_warning data = {savegame = <savegame> slot = <slot> is_reset = 2 message = <next_message>}}
		else
			<func> = options_progression_reset_savegame_progression
		endif
	endif
	if gotparam \{create_new}
		<func> = options_progression_create_new_progression
		addparam \{structure_name = func_params
			name = event
			value = menu_replace}
	endif
	create_dialog_box {
		heading_text = qs(0xaa163738)
		body_text = <message>
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0xf7723015)
			}
			{
				func = <func>
				func_params = <func_params>
				text = qs(0x182f0173)
			}
		]
	}
endscript

script ui_destroy_options_change_progression_warning 
	destroy_dialog_box
endscript
