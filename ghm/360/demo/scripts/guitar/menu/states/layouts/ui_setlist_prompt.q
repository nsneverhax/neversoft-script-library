
script ui_create_setlist_prompt 
	createscreenelement \{type = descinterface
		desc = 'setlist_b_set_pop'
		parent = root_window
		id = set_popup
		event_handlers = [
			{
				pad_choose
				setlist_prompt_continue
			}
		]}
	soundevent \{event = enter_band_name_finish}
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	spawnscriptnow \{ui_set_popup_wait_and_focus}
endscript

script ui_set_popup_wait_and_focus 
	wait \{2
		gameframes}
	launchevent \{type = focus
		target = set_popup}
	setlist_menu :se_setprops \{block_events}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

script ui_destroy_setlist_prompt 
	if screenelementexists \{id = set_popup}
		destroyscreenelement \{id = set_popup}
	endif
	setlist_menu :se_setprops \{unblock_events}
	spawnscriptnow \{setlist_songpreview_monitor}
endscript

script setlist_prompt_continue 
	se_setprops \{block_events}
	get_current_band_info
	getglobaltags <band_info>
	show_doublekick = 0
	i = 1
	begin
	getplayerinfo <i> controller
	getplayerinfo <i> part
	if isdrumcontroller controller = <controller>
		part = drum
	endif
	if (<part> = drum)
		gamemode_gettype
		if (<type> = career)
			getplayerinfo <i> double_kick_drum
			show_doublekick = <double_kick_drum>
		else
			show_doublekick = 1
		endif
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	if (<show_doublekick> = 1)
		getglobaltags <band_info> params = {first_setlist_drum}
		if (<first_setlist_drum> = 1 && (<first_career_setlist> = 0 || <first_quickplay_setlist> = 0))
			change \{ui_gig_posters_skip_helpers = 1}
			generic_event_replace \{state = uistate_double_bass_popup
				data = {
					is_popup
				}}
			setglobaltags <band_info> params = {first_setlist_drum = 0}
			return
		endif
	endif
	ui_setlist_go_back
endscript
