
script ui_create_cas_discard_changes 
	create_popup_warning_menu \{title = qs(0x2352550a)
		textblock = {
			text = qs(0x51b96069)
		}
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
		popup_event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_event_back
			}
		]}
	setup_cas_menu_handlers \{vmenu_id = pu_warning_vmenu}
endscript

script ui_destroy_cas_discard_changes 
	destroy_popup_warning_menu
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
