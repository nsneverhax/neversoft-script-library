
script ui_create_new_song_info_popup 
	createscreenelement \{type = descinterface
		desc = 'setlist_b_extras_pop'
		parent = root_window
		id = new_song_info_popup
		event_handlers = [
			{
				pad_choose
				setlist_prompt_continue
			}
		]}
	soundevent \{event = enter_band_name_finish}
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	spawnscriptnow \{ui_new_song_info_wait_and_focus}
endscript

script ui_new_song_info_wait_and_focus 
	launchevent \{type = focus
		target = new_song_info_popup}
	setlist_menu :se_setprops \{block_events}
	wait \{2
		gameframes}
	setbuttoneventmappings \{unblock_menu_input}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

script ui_destroy_new_song_info_popup 
	if screenelementexists \{id = new_song_info_popup}
		destroyscreenelement \{id = new_song_info_popup}
	endif
	setlist_menu :se_setprops \{unblock_events}
	spawnscriptnow \{setlist_songpreview_monitor}
endscript
