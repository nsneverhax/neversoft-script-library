
script ui_create_setlist_prompt 
	create_popup_warning_menu {
		title = qs(0xcf5deb58)
		textblock = {
			text = qs(0x10d8e2ac)
		}
		options = [
			{
				func = setlist_prompt_continue
				func_params = {<...>}
				text = qs(0x182f0173)
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
	destroy_popup_warning_menu
endscript

script setlist_prompt_continue 
	removeparameter \{base_name}
	get_current_band_info
	setglobaltags <band_info> params = {first_quickplay_setlist = 0}
	ui_event_wait event = menu_replace data = {state = uistate_setlist <...>}
endscript
