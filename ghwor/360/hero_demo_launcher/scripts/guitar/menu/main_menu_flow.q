
script main_menu_temp_flow 
	ui_event \{event = menu_choose
		data = {
			state = uistate_mainmenu
			clear_previous_stack
		}}
	wait \{5
		gameframes}
	ui_event \{event = menu_refresh}
endscript

script main_menu_career_flow_state_func 
	main_menu_get_any_band_names_exist
	if (<name_exists> = 0)
		return \{flow_state = career_enter_band_name_fs}
	else
		return \{flow_state = career_choose_band_fs}
	endif
endscript

script main_menu_get_any_band_names_exist 
	formattext checksumname = bandname_id 'band_info' i = <band_index>
	getglobaltags \{band_info
		param = name}
	if NOT (<name> = qs(0x03ac90f0))
		return \{name_exists = 1}
	endif
	return \{name_exists = 0}
endscript

script controller_disconnect_quit_warning_decider 
	fs = none
	switch ($game_mode)
		case p1_career
		<fs> = career_quit_warning_fs
		case p2_career
		<fs> = coop_career_quit_warning_fs
		case p1_quickplay
		<fs> = quickplay_quit_warning_fs
		case p2_quickplay
		<fs> = coop_quickplay_quit_warning_fs
		case p2_faceoff
		case p2_pro_faceoff
		case p2_battle
		<fs> = mp_faceoff_quit_warning_fs
	endswitch
	if ($end_credits = 1)
		change \{end_credits = 0}
		progression_endcredits_done
		career_song_ended_select_quit
		return \{flow_state = main_menu_fs}
	endif
	return flow_state = <fs>
endscript
