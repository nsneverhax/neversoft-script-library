musicstudio_jamroom_root_state = {
	name_text = qs(0x428c2b08)
	tool_tip = qs(0x428c2b08)
	num_tabs = 1
	green = {
	}
	red = {
	}
	yellow = {
	}
	blue = {
	}
	orange = {
	}
	left = {
	}
	right = {
	}
	up = {
	}
	down = {
	}
	back = {
	}
	start = {
	}
	whammy = {
	}
}

script musicstudio_jamroom_sound_select_get_state 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		return \{musicstudio_scrolling_state = musicstudio_scrolling_sound_select_dumkit_state}
	endif
	return \{musicstudio_scrolling_state = musicstudio_jamroom_scrolling_sound_select_state}
endscript
musicstudio_jamroom_track_settings_state = {
	name_text = qs(0x92e864f7)
	tool_tip = qs(0x92e864f7)
	num_tabs = 2
	green = {
		name_text = qs(0xbae0063c)
		musicstudio_get_active = musicstudio_scale_customize_get_active
		musicstudio_state = musicstudio_jamroom_scale_state
		choose_script = musicstudio_scale_setup
	}
	red = {
		name_text = qs(0xc61aaa34)
		musicstudio_get_state = musicstudio_jamroom_sound_select_get_state
		tool_tip = ms_tool_tip_drum_kit
	}
	yellow = {
		name_text = qs(0xdc6e5e8d)
		tool_tip = qs(0x4300f5d9)
		musicstudio_get_active = musicstudio_effect_get_active
		musicstudio_state = musicstudio_effect_settings_state
	}
	blue = {
		name_text_script = musicstudio_change_volume_get_name_text
		tool_tip = qs(0x4300f5d9)
		musicstudio_change_value_state = musicstudio_change_value_volume
	}
	orange = {
		name_text = qs(0x0b6ccd33)
		musicstudio_state = musicstudio_jamroom_options_state
	}
	left = {
	}
	right = {
	}
	up = {
	}
	down = {
	}
	back = {
	}
	start = {
		name_text = qs(0x1821d84e)
		musicstudio_scrolling_state = musicstudio_jamroom_scrolling_pause_state
	}
	whammy = {
	}
}
musicstudio_jamroom_options_state = {
	name_text = qs(0x0b6ccd33)
	tool_tip = ms_tool_tip_bottom_general_setting
	num_tabs = 3
	green = {
		tool_tip = ms_tool_tip_menu_sounds
		name_text_script = musicstudio_toggle_menu_sounds_get_name_text
		choose_script = musicstudio_toggle_menu_sounds
	}
	red = {
		tool_tip = ms_tool_tip_lefty_flip
		name_text_script = musicstudio_toggle_lefty_flip_get_name_text
		musicstudio_popup_state = musicstudio_jamroom_lefty_warning
	}
	yellow = {
	}
	blue = {
	}
	orange = {
	}
	left = {
	}
	right = {
	}
	up = {
	}
	down = {
	}
	back = {
	}
	start = {
		name_text = qs(0x1821d84e)
		musicstudio_state = musicstudio_jamroom_track_settings_state
	}
	whammy = {
	}
}
musicstudio_jamroom_scale_state = {
	name_text = qs(0xbae0063c)
	tool_tip = qs(0x4e49fbbb)
	init_script = musicstudio_scale_state_init
	deinit_script = musicstudio_scale_state_deinit
	num_tabs = 3
	green = {
		tool_tip = qs(0x4300f5d9)
		name_text_script = musicstudio_get_root_note_text
		musicstudio_scrolling_state = musicstudio_scrolling_sound_root_state
	}
	red = {
		name_text = qs(0xc7a9b328)
		tool_tip = qs(0x4300f5d9)
		musicstudio_scrolling_state = musicstudio_scrolling_sound_scale_state
	}
	yellow = {
		tool_tip = qs(0x4300f5d9)
		name_text_script = musicstudio_get_range_text
		choose_script = musicstudio_scale_toggle_range
		musicstudio_get_active = musicstudio_scale_range_get_active
		musicstudio_unactive_warning = ghmix_warning_scale_range_fail_1
	}
	blue = {
		name_text = qs(0x9f4c3ea7)
		tool_tip = qs(0x4300f5d9)
		musicstudio_scrolling_state = musicstudio_scrolling_bend_set_state
	}
	orange = {
	}
	left = {
	}
	right = {
	}
	up = {
	}
	down = {
	}
	back = {
	}
	start = {
		name_text = qs(0x1821d84e)
		musicstudio_state = musicstudio_jamroom_track_settings_state
	}
	whammy = {
	}
}
musicstudio_jamroom_live_or_pattern_state = {
	name_text = qs(0xddbf7cfc)
	tool_tip = qs(0xb60d8d37)
	num_tabs = 2
	green = {
		name_text = qs(0x60dc3484)
		choose_script = musicstudio_jam_room_create_instrument_live
		musicstudio_state = musicstudio_jamroom_jamming_state
	}
	red = {
		name_text = qs(0x82cf633d)
		choose_script = musicstudio_jam_room_create_instrument_pattern
		musicstudio_state = musicstudio_jamroom_jamming_state
	}
	yellow = {
	}
	blue = {
	}
	orange = {
	}
	left = {
	}
	right = {
	}
	up = {
	}
	down = {
	}
	back = {
	}
	start = {
	}
	whammy = {
	}
}
musicstudio_jamroom_jamming_state = {
	name_text_script = musicstudio_jamroom_get_inst_name_text
	tool_tip = qs(0xbf74925d)
	init_script = musicstudio_jamroom_jamming_init
	deinit_script = musicstudio_jamroom_jamming_deinit
	num_tabs = 1
	green = {
	}
	red = {
	}
	yellow = {
	}
	blue = {
	}
	orange = {
	}
	left = {
		choose_script = musicstudio_jamroom_transport_left
	}
	right = {
		choose_script = musicstudio_jamroom_transport_right
	}
	up = {
	}
	down = {
	}
	back = {
	}
	start = {
		name_text = qs(0x8200b5ff)
		musicstudio_scrolling_state = musicstudio_jamroom_scrolling_pause_state
		choose_script = musicstudio_jamroom_pause_script
	}
	whammy = {
	}
}

script musicstudio_jamroom_update_drum_text 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		musicstudio_jamroom_drum_get_name_text
		musicstudio_jamroom_set_title_text text = <name_text> player = <player>
	endif
endscript

script musicstudio_jamroom_drum_get_name_text 
	if ($is_percussion_kit = 1)
		return \{name_text = qs(0x096d7e02)}
	else
		return \{name_text = qs(0xf3e03f27)}
	endif
endscript
musicstudio_jamroom_drop_out = {
	name_text = qs(0x5e4f396d)
	tool_tip = qs(0x00000000)
	init_script = musicstudio_jamroom_drop_out_init
	green = {
	}
	red = {
	}
	yellow = {
	}
	blue = {
	}
	orange = {
	}
	left = {
	}
	right = {
	}
	up = {
	}
	down = {
	}
	back = {
	}
	start = {
	}
	whammy = {
	}
}
musicstudio_jamroom_quit_state = {
	name_text = qs(0x48a351fa)
	options = [
		{
			text = qs(0xb2415b7d)
			tool_tip = $ms_tool_tip_pause_quit_and_save
			func = jam_band_pause_save_and_quit
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0xc4018c33)
			tool_tip = $ms_tool_tip_pause_quit_no_save
			func = jam_band_pause_quit
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}
musicstudio_jamroom_quit_state_signed_out = {
	name_text = qs(0x48a351fa)
	options = [
		{
			text = qs(0x67d9c56d)
			tool_tip = $ms_tool_tip_pause_quit_no_save_no_signin
			func = jam_band_pause_quit
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}
musicstudio_jamroom_lefty_warning = {
	name_text = qs(0xaa163738)
	options = [
		{
			text = qs(0x58e0a1fb)
			tool_tip = $ms_tool_tip_jamroom_lefty_warning
			func = musicstudio_jamroom_lefty_warning_toggle
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0xd2915c27)
			tool_tip = $ms_tool_tip_jamroom_lefty_warning
			func = musicstudio_jamroom_lefty_warning_destroy
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}
musicstudio_jamroom_scrolling_track_select_state = {
	name_text = qs(0x428c2b08)
	tool_tip = qs(0x428c2b08)
	num_tabs = 1
	init_script = musicstudio_jamroom_instrument_init
	update_script = musicstudio_jamroom_scrolling_menu_update
	get_update_script_data = musicstudio_jamroom_instrument_select_update_data
	choose_script = musicstudio_jamroom_select_track
	get_selected_script = musicstudio_menu_unused_button
	get_focusable_script = musicstudio_track_select_starting_focus
	get_list_size_script = musicstudio_jamroom_get_list_checksum_tracks_size
	get_list_checksum_script = musicstudio_jamroom_get_list_checksum_tracks
	deinit_script = musicstudio_jamroom_track_select_deinit
	musicstudio_state = musicstudio_jamroom_jamming_state
	no_back
}
musicstudio_jamroom_scrolling_sound_select_state = {
	name_text = qs(0x38f0d0d7)
	tool_tip = qs(0x2fa8eab5)
	num_tabs = 2
	choose_script = musicstudio_change_sound
	update_script = musicstudio_jamroom_scrolling_menu_update
	get_update_script_data = musicstudio_jamroom_sound_select_update_data
	get_selected_script = musicstudio_get_selected_sound
	get_focusable_script = musicstudio_get_selected_sound_focusable
	get_list_checksum_script = musicstudio_get_list_checksum_sound
	deinit_script = musicstudio_change_sound_go_back
	ghjam_pause_text = qs(0x1821d84e)
	yellow = {
		name_text = qs(0xdfb2b37f)
		choose_script = musicstudio_preview_sound
	}
}
musicstudio_jamroom_scrolling_pause_state = {
	name_text_script = musicstudio_jamroom_get_inst_name_text
	tool_tip = qs(0x2fa8eab5)
	num_tabs = 2
	choose_script = musicstudio_menu_unused_button
	get_selected_script = musicstudio_jamroom_pause_get_selected
	get_list_checksum_script = musicstudio_jamroom_pause_get_list_checksum
	deinit_script = musicstudio_menu_unused_button
	musicstudio_state_go_back = musicstudio_jamroom_jamming_state
	musicstudio_get_state = musicstudio_jamroom_pause_get_state
	ghjam_pause_text = qs(0xaa383254)
}
musicstudio_jamroom_pause = [
	{
		name_text = qs(0x51ac30cf)
		musicstudio_state = musicstudio_jamroom_scrolling_track_select_state
		musicstudio_state_type = musicstudio_scrolling_state
	}
	{
		name_text = qs(0x92e864f7)
		musicstudio_state = musicstudio_jamroom_track_settings_state
		musicstudio_state_type = musicstudio_state
	}
	{
		name_text = qs(0x55c34bc7)
		musicstudio_state = musicstudio_jamroom_quit_state
		signed_out_state = musicstudio_jamroom_quit_state_signed_out
		musicstudio_state_type = musicstudio_popup_state
	}
]
musicstudio_jamroom_pause_non_main_player = [
	{
		name_text = qs(0x51ac30cf)
		musicstudio_state = musicstudio_jamroom_scrolling_track_select_state
		musicstudio_state_type = musicstudio_scrolling_state
	}
	{
		name_text = qs(0x92e864f7)
		musicstudio_state = musicstudio_jamroom_track_settings_state
		musicstudio_state_type = musicstudio_state
	}
	{
		name_text = qs(0x5e4f396d)
		musicstudio_state = musicstudio_jamroom_drop_out
		musicstudio_state_type = musicstudio_state
	}
]
musicstudio_state_jump_back = {
}

script musicstudio_jamroom_pause_get_selected 
	return \{selected = 0}
endscript

script musicstudio_jamroom_pause_get_state 
	if (<player> = 1)
		<state_list> = musicstudio_jamroom_pause
	else
		<state_list> = musicstudio_jamroom_pause_non_main_player
	endif
	<the_struct> = (($<state_list>) [<index>])
	musicstudio_state = (<the_struct>.musicstudio_state)
	musicstudio_state_type = (<the_struct>.musicstudio_state_type)
	if NOT checkforsignin controller_index = ($primary_controller) dont_set_primary local
		if structurecontains structure = <the_struct> signed_out_state
			musicstudio_state = (<the_struct>.signed_out_state)
		endif
	endif
	return musicstudio_state = <musicstudio_state> musicstudio_state_type = <musicstudio_state_type>
endscript

script musicstudio_jamroom_pause_get_list_checksum 
	if (<player> = 1)
		<state_list> = musicstudio_jamroom_pause
	else
		<state_list> = musicstudio_jamroom_pause_non_main_player
	endif
	return list_checksum = <state_list>
endscript

script musicstudio_track_select_starting_focus 
	if (<index> = 0)
		return \{focusable = focusable}
	else
		return \{focusable = not_focusable}
	endif
endscript

script musicstudio_jamroom_lefty_warning_destroy 
	if NOT musicstudio_mainobj :musicstudio_getplayerfromcontroller controller = <device_num>
		return
	endif
	<player_object> :musicstudioplayer_getplayerindex
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
	if NOT screenelementexists id = <musicstudio_menu>
		return
	endif
	if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
		musicstudio_popup_remove id = <jamroom_player_menu> player = <player> prev_state = musicstudio_jamroom_options_state
	endif
endscript

script musicstudio_jamroom_lefty_warning_toggle 
	if NOT musicstudio_mainobj :musicstudio_getplayerfromcontroller controller = <device_num>
		return
	endif
	<player_object> :musicstudioplayer_getplayerindex
	destroy_dialog_box
	musicstudio_toggle_lefty_flip <...>
endscript
