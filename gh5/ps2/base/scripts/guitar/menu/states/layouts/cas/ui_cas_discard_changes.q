
script ui_create_cas_discard_changes 
	create_dialog_box \{heading_text = qs(0x2352550a)
		body_text = qs(0x51b96069)
		no_background
		options = [
			{
				func = discard_changes_continue
				text = qs(0x6d562a67)
			}
			{
				func = generic_event_back
				text = qs(0x47157885)
			}
		]
		back_button_script = generic_event_back}
	setup_cas_menu_handlers \{vmenu_id = dialog_box_vmenu}
endscript

script ui_destroy_cas_discard_changes 
	destroy_dialog_box
endscript

script discard_changes_continue 
	restoretoptemporarycasappearance
	generic_event_back \{data = {
			num_states = 2
		}}
endscript

script discard_changes_prompt 
	if NOT comparetoptemporarycasappearance
		generic_event_choose \{data = {
				state = uistate_cas_discard_changes
				is_popup
			}}
	else
		generic_event_back
	endif
endscript
