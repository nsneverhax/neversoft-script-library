
script ui_create_setlist_prompt 
	create_dialog_box {
		heading_text = qs(0xcf5deb58)
		body_text $wii_create_a_setlist_intro
		options = [
			{
				func = setlist_prompt_continue
				func_params = {<...>}
				text = qs(0x494b4d7f)
			}
		]
		no_background
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
endscript

script ui_destroy_setlist_prompt 
	destroy_dialog_box
endscript

script setlist_prompt_continue 
	RemoveParameter \{base_name}
	SetGlobalTags \{progression_band_info
		params = {
			first_quickplay_setlist = 0
		}}
	ui_event_wait event = menu_replace data = {state = uistate_songlist <...>}
endscript
