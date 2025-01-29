
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
	create_popup_warning_menu {
		title = qs(0x3add9c72)
		textblock = {
			text = <text>
		}
		options = [
			{
				func = tutorial_prompt_easy_continue
				text = qs(0x182f0173)
			}
		]
		no_background
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back tutorial_prompt_easy_continue}]
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	SetGlobalTags \{training
		params = {
			has_prompt_easy_tutorial = complete
		}}
endscript

script ui_destroy_tutorial_prompt_easy 
	destroy_popup_warning_menu
endscript

script tutorial_prompt_easy_continue 
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_gig_posters
		}}
endscript
