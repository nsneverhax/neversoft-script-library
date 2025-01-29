
script ui_create_tutorial_prompt_easy 
	switch ($current_progression_flag)
		case career_guitar
		text = qs(0xb2850a7d)
		case career_bass
		text = qs(0xb2850a7d)
		case career_drum
		text = qs(0x2a7104c0)
		case career_vocals
		text = qs(0x3dce49dd)
	endswitch
	create_dialog_box {
		heading_text = qs(0x3add9c72)
		body_text = <text>
		options = [
			{
				func = tutorial_prompt_easy_continue
				text = qs(0x182f0173)
			}
		]
		back_button_script = tutorial_prompt_easy_continue
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	SetGlobalTags \{practice
		params = {
			has_prompt_easy_tutorial = complete
		}}
endscript

script ui_destroy_tutorial_prompt_easy 
	destroy_dialog_box
endscript

script tutorial_prompt_easy_continue 
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_gig_posters
		}}
endscript
