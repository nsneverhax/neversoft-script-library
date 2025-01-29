ghmix_song_transport_state = {
	name_text = qs(0x894e1bd6)
	tool_tip = ms_tool_tip_bottom_main
	num_tabs = 1
	green = {
		name_text = qs(0xcdaa4ea8)
		tool_tip = ms_tool_tip_song_play
		musicstudio_state = ghmix_song_play_state
		sound_script = musicstudio_ghmix_menu_sound_play
	}
	red = {
		name_text = qs(0x01fec975)
		tool_tip = ms_tool_tip_song_record_pattern
		musicstudio_state = ghmix_song_step_record_pattern_state
		sound_script = musicstudio_ghmix_menu_sound_play
		musicstudio_get_active = musicstudio_recording_get_active
	}
	yellow = {
		name_text = qs(0x65b8a528)
		tool_tip = ms_tool_tip_song_edit
		musicstudio_state = ghmix_song_edit_state
	}
	blue = {
		name_text = qs(0x015eb69c)
		tool_tip = ms_tool_tip_song_assign_patterns
		musicstudio_state = ghmix_song_assign_pattern_state
	}
	orange = {
		name_text_script = musicstudio_save_pattern_get_name_text
		tool_tip = ms_tool_tip_song_save_pattern_menu
		choose_script = save_pattern_init
		musicstudio_state = ghmix_song_save_pattern_state
		musicstudio_get_active = musicstudio_save_pattern_get_active
	}
	left = {
		name_text = qs(0x81bf948c)
		musicstudio_scrolling_state = musicstudio_song_scrolling_track_select_state
		musicstudio_get_active = musicstudio_track_select_get_active
	}
	right = {
		name_text = qs(0x81bf948c)
		musicstudio_scrolling_state = musicstudio_song_scrolling_track_select_state
		musicstudio_get_active = musicstudio_track_select_get_active
	}
	up = {
		name_text = qs(0x4a56ea55)
		choose_script = musicstudio_skip_forward
	}
	down = {
		choose_script = musicstudio_skip_backward
	}
	back = {
		name_text = qs(0xdfb2b37f)
		tool_tip = ms_tool_tip_song_preview
		musicstudio_state = ghmix_song_preview_state
	}
	start = {
		name_text = qs(0x8200b5ff)
		musicstudio_popup_state = ghmix_song_popup_mode_select
	}
	whammy = {
	}
}
ghmix_song_preview_state = {
	name_text = qs(0xdfb2b37f)
	tool_tip = ms_tool_tip_bottom_preview
	tool_tip_ps3 = ms_tool_tip_bottom_preview_ps3
	num_tabs = 2
	green = {
		name_text_script = musicstudio_get_pattern_text_green
		musicstudio_get_active = musicstudio_preview_curr_pattern_get_active
		get_active_params = {
			Color = green
		}
		choose_script = ghmix_preview_curr_pattern
		choose_params = {
			Color = green
		}
	}
	red = {
		name_text_script = musicstudio_get_pattern_text_red
		musicstudio_get_active = musicstudio_preview_curr_pattern_get_active
		get_active_params = {
			Color = red
		}
		choose_script = ghmix_preview_curr_pattern
		choose_params = {
			Color = red
		}
	}
	yellow = {
		name_text_script = musicstudio_get_pattern_text_yellow
		musicstudio_get_active = musicstudio_preview_curr_pattern_get_active
		get_active_params = {
			Color = yellow
		}
		choose_script = ghmix_preview_curr_pattern
		choose_params = {
			Color = yellow
		}
	}
	blue = {
		name_text_script = musicstudio_get_pattern_text_blue
		musicstudio_get_active = musicstudio_preview_curr_pattern_get_active
		get_active_params = {
			Color = blue
		}
		choose_script = ghmix_preview_curr_pattern
		choose_params = {
			Color = blue
		}
	}
	orange = {
		name_text_script = musicstudio_get_pattern_text_orange
		musicstudio_get_active = musicstudio_preview_curr_pattern_get_active
		get_active_params = {
			Color = orange
		}
		choose_script = ghmix_preview_curr_pattern
		choose_params = {
			Color = orange
		}
	}
	left = {
		name_text = qs(0x81bf948c)
		musicstudio_scrolling_state = musicstudio_song_scrolling_preview_track_select_state
		musicstudio_get_active = musicstudio_track_select_get_active
	}
	right = {
		name_text = qs(0x81bf948c)
		musicstudio_scrolling_state = musicstudio_song_scrolling_preview_track_select_state
		musicstudio_get_active = musicstudio_track_select_get_active
	}
	up = {
		choose_script = notetracker_whammy_set_fast_forward
	}
	down = {
		choose_script = notetracker_whammy_set_rewind
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = ghmix_song_transport_state
	}
	whammy = {
	}
}
ghmix_song_play_state = {
	name_text = qs(0xcdaa4ea8)
	tool_tip = ms_tool_tip_bottom_play
	tool_tip_ps3 = ms_tool_tip_bottom_play_ps3
	num_tabs = 2
	init_script = musicstudio_ghmix_song_playback
	deinit_script = musicstudio_ghmix_song_playback_stop
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
		choose_script = notetracker_whammy_set_fast_forward
	}
	down = {
		choose_script = notetracker_whammy_set_rewind
	}
	back = {
	}
	start = {
		name_text = qs(0x2742f662)
		musicstudio_state = ghmix_song_transport_state
		sound_script = musicstudio_ghmix_menu_sound_stop
	}
	whammy = {
	}
}
ghmix_song_record_pattern_state = {
	name_text = qs(0x4d78affe)
	tool_tip = ms_tool_tip_bottom_record
	num_tabs = 2
	green = {
		name_text = qs(0xc0ec0a91)
		tool_tip = ms_tool_tip_live_record
		musicstudio_state = ghmix_song_live_record_pattern_state
	}
	red = {
		name_text = qs(0x3d9f3aa6)
		tool_tip = ms_tool_tip_step_record
		musicstudio_state = ghmix_song_step_record_pattern_state
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
		name_text = qs(0x4a56ea55)
		choose_script = musicstudio_skip_forward
	}
	down = {
		choose_script = musicstudio_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = ghmix_song_transport_state
	}
	whammy = {
	}
}
ghmix_song_live_record_pattern_state = {
	name_text = qs(0xc0ec0a91)
	tool_tip = ms_tool_tip_bottom_live_record
	tool_tip_ps3 = ms_tool_tip_bottom_live_record_ps3
	num_tabs = 2
	init_script = musicstudio_playback
	deinit_script = musicstudio_ghmix_song_playback_stop
	green = {
		name_text_script = musicstudio_get_pattern_text_green
		choose_script = musicstudio_record_pattern_green
	}
	red = {
		name_text_script = musicstudio_get_pattern_text_red
		choose_script = musicstudio_record_pattern_red
	}
	yellow = {
		name_text_script = musicstudio_get_pattern_text_yellow
		choose_script = musicstudio_record_pattern_yellow
	}
	blue = {
		name_text_script = musicstudio_get_pattern_text_blue
		choose_script = musicstudio_record_pattern_blue
	}
	orange = {
		name_text_script = musicstudio_get_pattern_text_orange
		choose_script = musicstudio_record_pattern_orange
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
		name_text = qs(0x894e1bd6)
		musicstudio_state = ghmix_song_transport_state
		sound_script = musicstudio_ghmix_menu_sound_stop
	}
	whammy = {
	}
}
ghmix_song_step_record_pattern_state = {
	name_text = qs(0x01fec975)
	tool_tip = ms_tool_tip_bottom_step_record_pattern
	num_tabs = 2
	init_script = musicstudio_update_undo_clipboard
	green = {
		name_text_script = musicstudio_get_pattern_text_green
		choose_script = musicstudio_record_pattern_green
		get_active_params = {
			Color = green
		}
		musicstudio_get_active = musicstudio_record_pattern_get_active
	}
	red = {
		name_text_script = musicstudio_get_pattern_text_red
		choose_script = musicstudio_record_pattern_red
		get_active_params = {
			Color = red
		}
		musicstudio_get_active = musicstudio_record_pattern_get_active
	}
	yellow = {
		name_text_script = musicstudio_get_pattern_text_yellow
		choose_script = musicstudio_record_pattern_yellow
		get_active_params = {
			Color = yellow
		}
		musicstudio_get_active = musicstudio_record_pattern_get_active
	}
	blue = {
		name_text_script = musicstudio_get_pattern_text_blue
		choose_script = musicstudio_record_pattern_blue
		get_active_params = {
			Color = blue
		}
		musicstudio_get_active = musicstudio_record_pattern_get_active
	}
	orange = {
		name_text_script = musicstudio_get_pattern_text_orange
		choose_script = musicstudio_record_pattern_orange
		get_active_params = {
			Color = orange
		}
		musicstudio_get_active = musicstudio_record_pattern_get_active
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x4a56ea55)
		choose_script = musicstudio_skip_forward
	}
	down = {
		choose_script = musicstudio_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = ghmix_song_transport_state
		sound_script = musicstudio_ghmix_menu_sound_stop
	}
	whammy = {
	}
}
ghmix_song_edit_state = {
	name_text = qs(0x65b8a528)
	tool_tip = ms_tool_tip_bottom_song_edit
	num_tabs = 2
	green = {
		name_text = qs(0x900b7dde)
		tool_tip = ms_tool_tip_song_delete_copy_cut
		musicstudio_state = ghmix_song_delete_copy_cut_state
		musicstudio_get_active = musicstudio_track_has_notes_get_active
	}
	red = {
		name_text = qs(0xc84166a2)
		tool_tip = ms_tool_tip_song_paste
		musicstudio_state = ghmix_song_paste_state
		musicstudio_get_active = musicstudio_recording_get_active
	}
	yellow = {
		name_text = qs(0x55a8227a)
		tool_tip = ms_tool_tip_song_nudge
		musicstudio_state = ghmix_song_nudge_state
		musicstudio_get_active = musicstudio_track_has_notes_get_active
	}
	blue = {
		name_text = qs(0xe3c4a422)
		tool_tip = ms_tool_tip_undo
		choose_script = musicstudio_undo
		musicstudio_state = ghmix_song_transport_state
		musicstudio_get_active = musicstudio_undo_get_active
	}
	orange = {
		name_text = qs(0x4ea29f94)
		tool_tip = ms_tool_tip_manage_patterns
		musicstudio_get_active = musicstudio_manage_patterns_get_active
		musicstudio_scrolling_state = musicstudio_scrolling_manage_patterns
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x4a56ea55)
		choose_script = musicstudio_skip_forward
	}
	down = {
		choose_script = musicstudio_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = ghmix_song_transport_state
	}
	whammy = {
	}
}
ghmix_song_delete_copy_cut_state = {
	name_text = qs(0x1b7123e7)
	tool_tip = ms_tool_tip_bottom_song_delete_copy_cut
	num_tabs = 3
	init_script = musicstudio_delete_area_init
	deinit_script = musicstudio_select_area_deinit
	green = {
		name_text = qs(0xef465145)
		tool_tip = ms_tool_tip_delete
		choose_script = musicstudio_delete_area
		musicstudio_state = ghmix_song_transport_state
	}
	red = {
		name_text = qs(0xe94026a5)
		tool_tip = ms_tool_tip_copy
		choose_script = musicstudio_copy_area
		musicstudio_state = ghmix_song_edit_state
	}
	yellow = {
		name_text = qs(0x97c3f3ce)
		tool_tip = ms_tool_tip_cut
		choose_script = musicstudio_cut_area
		musicstudio_state = ghmix_song_edit_state
	}
	blue = {
		name_text = qs(0xed42927e)
		tool_tip = ms_tool_tip_clear
		musicstudio_popup_state = musicstudio_popup_clear_track
	}
	orange = {
		name_text_script = musicstudio_toggle_select_get_name_text
		tool_tip = ms_tool_tip_toggle_select
		choose_script = musicstudio_toggle_select
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0xfadd6bd7)
		choose_script = musicstudio_skip_forward_select_area
	}
	down = {
		choose_script = musicstudio_skip_backward_select_area
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = ghmix_song_transport_state
	}
	whammy = {
	}
}
ghmix_song_paste_state = {
	name_text = qs(0xc84166a2)
	tool_tip = ms_tool_tip_bottom_song_paste
	num_tabs = 3
	init_script = musicstudio_paste_init
	deinit_script = musicstudio_paste_deinit
	green = {
		name_text = qs(0xc84166a2)
		tool_tip = ms_tool_tip_paste
		choose_script = musicstudio_paste
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
		name_text = qs(0x4a56ea55)
		choose_script = musicstudio_paste_skip_forward
	}
	down = {
		choose_script = musicstudio_paste_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = ghmix_song_transport_state
	}
	whammy = {
	}
}
ghmix_song_nudge_state = {
	name_text = qs(0x55a8227a)
	tool_tip = ms_tool_tip_bottom_song_nudge
	num_tabs = 3
	green = {
		name_text = qs(0x88275ff3)
		tool_tip = ms_tool_tip_nudge_all
		choose_params = {
			direction = 1
		}
		choose_script = musicstudio_nudge_all
	}
	red = {
		name_text = qs(0xae4d59f9)
		tool_tip = ms_tool_tip_nudge_all_back
		choose_params = {
			direction = -1
		}
		choose_script = musicstudio_nudge_all
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
		name_text = qs(0x4a56ea55)
		choose_script = musicstudio_paste_skip_forward
	}
	down = {
		choose_script = musicstudio_paste_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = ghmix_song_transport_state
	}
	whammy = {
	}
}
ghmix_song_assign_pattern_state = {
	name_text = qs(0x015eb69c)
	tool_tip = ms_tool_tip_bottom_song_assign
	num_tabs = 2
	green = {
		name_text_script = musicstudio_get_pattern_text_green
		choose_script = musicstudio_scrolling_reset_sort
		musicstudio_scrolling_state = musicstudio_scrolling_assign_pattern_green
	}
	red = {
		name_text_script = musicstudio_get_pattern_text_red
		choose_script = musicstudio_scrolling_reset_sort
		musicstudio_scrolling_state = musicstudio_scrolling_assign_pattern_red
	}
	yellow = {
		name_text_script = musicstudio_get_pattern_text_yellow
		choose_script = musicstudio_scrolling_reset_sort
		musicstudio_scrolling_state = musicstudio_scrolling_assign_pattern_yellow
	}
	blue = {
		name_text_script = musicstudio_get_pattern_text_blue
		choose_script = musicstudio_scrolling_reset_sort
		musicstudio_scrolling_state = musicstudio_scrolling_assign_pattern_blue
	}
	orange = {
		name_text_script = musicstudio_get_pattern_text_orange
		choose_script = musicstudio_scrolling_reset_sort
		musicstudio_scrolling_state = musicstudio_scrolling_assign_pattern_orange
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x4a56ea55)
		choose_script = musicstudio_skip_forward
	}
	down = {
		choose_script = musicstudio_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = ghmix_song_transport_state
	}
	whammy = {
	}
}
ghmix_song_save_pattern_state = {
	name_text = qs(0x76b43939)
	num_tabs = 2
	init_script = save_pattern_update_name
	deinit_script = save_pattern_deinit
	tool_tip = ms_tool_tip_bottom_song_save_pattern
	green = {
		name_text = qs(0x9207b087)
		tool_tip = ms_tool_tip_song_set_category
		musicstudio_scrolling_state = musicstudio_scrolling_set_category_state
	}
	red = {
		name_text = qs(0xebc257fc)
		tool_tip = ms_tool_tip_song_set_subcategory
		musicstudio_scrolling_state = musicstudio_scrolling_set_sub_category_state
	}
	yellow = {
		name_text = qs(0x1c4e0e68)
		tool_tip = ms_tool_tip_song_set_type
		musicstudio_scrolling_state = musicstudio_scrolling_set_type_state
	}
	blue = {
		name_text = qs(0x76b43939)
		tool_tip = ms_tool_tip_song_save_pattern
		choose_script = save_pattern
		musicstudio_state = ghmix_song_transport_state
	}
	orange = {
		name_text = qs(0x289437bb)
		tool_tip = ms_tool_tip_bottom_song_save_and_dump
		choose_script = save_pattern_and_dump
		musicstudio_state = ghmix_song_transport_state
		debug
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0xfadd6bd7)
		choose_script = musicstudio_skip_forward_select_area_save_pattern
	}
	down = {
		choose_script = musicstudio_skip_backward_select_area_save_pattern
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		choose_script = musicstudio_select_area_deinit
		musicstudio_state = ghmix_song_transport_state
	}
	whammy = {
	}
}

script musicstudio_skip_forward_select_area_save_pattern 
	musicstudio_mainobj :musicstudioghmix_getselectarea
	select_area_length = (<select_area_end> - <select_area_start>)
	musicstudio_mainobj :musicstudioghmix_getsongtime
	if (<select_area_length> > 20000)
		if ((<song_time> < (<select_area_end> + 100)) && (<song_time> > (<select_area_end> - 100)))
			return
		endif
	endif
	musicstudio_skip_forward_select_area
endscript

script musicstudio_skip_backward_select_area_save_pattern 
	musicstudio_mainobj :musicstudioghmix_getselectarea
	select_area_length = (<select_area_end> - <select_area_start>)
	musicstudio_mainobj :musicstudioghmix_getsongtime
	if (<select_area_length> > 20000)
		if ((<song_time> < (<select_area_start> + 100)) && (<song_time> > (<select_area_start> - 100)))
			return
		endif
	endif
	musicstudio_skip_backward_select_area
endscript
ghmix_song_popup_mode_select = {
	name_text = qs(0x48a351fa)
	options = [
		{
			text = qs(0x67740975)
			tool_tip = $ms_tool_tip_pause_track
			func = musicstudio_ghmix_track_mode
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0xd40268ee)
			tool_tip = $ms_tool_tip_pause_save
			func = musicstudio_save
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0x55c34bc7)
			tool_tip = $ms_tool_tip_pause_quit
			func = musicstudio_sub_popup_save_confirmation
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}
musicstudio_song_scrolling_track_select_state = {
	name_text = qs(0x81bf948c)
	tool_tip = ms_tool_tip_scroll_track
	num_tabs = 1
	init_script = musicstudio_select_track_init
	deinit_script = musicstudio_song_select_track_deinit
	choose_script = musicstudio_menu_unused_button
	get_selected_script = musicstudio_select_track_get_selected
	get_list_checksum_script = musicstudio_get_list_checksum_tracks
	focus_script = musicstudio_select_track_focus
	musicstudio_state = ghmix_song_transport_state
}
musicstudio_song_scrolling_preview_track_select_state = {
	name_text = qs(0x81bf948c)
	tool_tip = ms_tool_tip_scroll_track
	num_tabs = 1
	init_script = musicstudio_select_track_init
	deinit_script = musicstudio_song_select_track_deinit
	choose_script = musicstudio_menu_unused_button
	get_selected_script = musicstudio_select_track_get_selected
	get_list_checksum_script = musicstudio_get_list_checksum_tracks
	focus_script = musicstudio_select_track_focus
	musicstudio_state = ghmix_song_preview_state
}
musicstudio_scrolling_set_category_state = {
	name_text = qs(0x9207b087)
	tool_tip = ms_tool_tip_scroll_category
	num_tabs = 3
	choose_script = ghmix_set_pattern_category
	get_selected_script = ghmix_get_selected_category
	get_list_checksum_script = ghmix_get_category_list_checksum
}
musicstudio_scrolling_set_sub_category_state = {
	name_text = qs(0xebc257fc)
	tool_tip = ms_tool_tip_scroll_sub_category
	num_tabs = 3
	choose_script = ghmix_set_pattern_sub_category
	get_selected_script = ghmix_get_selected_sub_category
	get_list_checksum_script = ghmix_get_sub_category_list_checksum
}
musicstudio_scrolling_set_type_state = {
	name_text = qs(0x1c4e0e68)
	tool_tip = ms_tool_tip_scroll_type
	num_tabs = 3
	choose_script = ghmix_set_pattern_type
	get_selected_script = ghmix_get_selected_type
	get_list_checksum_script = ghmix_get_type_list_checksum
}
musicstudio_scrolling_manage_patterns = {
	name_text = qs(0x80ce5b6c)
	tool_tip = ms_tool_tip_scroll_manage_pattern
	num_tabs = 3
	choose_script = nullscript
	get_selected_script = ghmix_get_user_pattern_selected
	get_list_script = ghmix_get_user_pattern_list
	get_name_text_script = ghmix_get_user_pattern_list_name_text
	yellow = {
		name_text = qs(0x4cecbf1d)
		tool_tip = ms_tool_tip_delete_pattern
		choose_script = ghmix_song_delete_pattern
	}
}
musicstudio_scrolling_assign_pattern_green = {
	name_text = qs(0x7a00bdfe)
	tool_tip = ms_tool_tip_scroll_assign_pattern
	num_tabs = 3
	choose_script = ghmix_assign_pattern
	focus_script = ghmix_focus_pattern
	get_selected_script = ghmix_get_selected_pattern
	get_list_script = ghmix_get_pattern_list
	get_name_text_script = ghmix_get_pattern_list_name_text
	params = {
		Color = green
	}
	sort_by_blue = qs(0xc2dd1154)
	sort_by_orange = qs(0x256076bc)
	yellow = {
		name_text = qs(0xb380dd40)
		tool_tip = ms_tool_tip_preview_pattern
		choose_script = ghmix_preview_pattern
	}
}
musicstudio_scrolling_assign_pattern_red = {
	name_text = qs(0x95520b1f)
	tool_tip = ms_tool_tip_scroll_assign_pattern
	num_tabs = 3
	choose_script = ghmix_assign_pattern
	focus_script = ghmix_focus_pattern
	get_selected_script = ghmix_get_selected_pattern
	get_list_script = ghmix_get_pattern_list
	get_name_text_script = ghmix_get_pattern_list_name_text
	params = {
		Color = red
	}
	sort_by_blue = qs(0xc2dd1154)
	sort_by_orange = qs(0x256076bc)
	yellow = {
		name_text = qs(0xb380dd40)
		tool_tip = ms_tool_tip_preview_pattern
		choose_script = ghmix_preview_pattern
	}
}
musicstudio_scrolling_assign_pattern_yellow = {
	name_text = qs(0x7fd4d67d)
	tool_tip = ms_tool_tip_scroll_assign_pattern
	num_tabs = 3
	choose_script = ghmix_assign_pattern
	focus_script = ghmix_focus_pattern
	get_selected_script = ghmix_get_selected_pattern
	get_list_script = ghmix_get_pattern_list
	get_name_text_script = ghmix_get_pattern_list_name_text
	params = {
		Color = yellow
	}
	sort_by_blue = qs(0xc2dd1154)
	sort_by_orange = qs(0x256076bc)
	yellow = {
		name_text = qs(0xb380dd40)
		tool_tip = ms_tool_tip_preview_pattern
		choose_script = ghmix_preview_pattern
	}
}
musicstudio_scrolling_assign_pattern_blue = {
	name_text = qs(0x9086609c)
	tool_tip = ms_tool_tip_scroll_assign_pattern
	num_tabs = 3
	choose_script = ghmix_assign_pattern
	focus_script = ghmix_focus_pattern
	get_selected_script = ghmix_get_selected_pattern
	get_list_script = ghmix_get_pattern_list
	get_name_text_script = ghmix_get_pattern_list_name_text
	params = {
		Color = blue
	}
	sort_by_blue = qs(0xc2dd1154)
	sort_by_orange = qs(0x256076bc)
	yellow = {
		name_text = qs(0xb380dd40)
		tool_tip = ms_tool_tip_preview_pattern
		choose_script = ghmix_preview_pattern
	}
}
musicstudio_scrolling_assign_pattern_orange = {
	name_text = qs(0x66f9c4f4)
	tool_tip = ms_tool_tip_scroll_assign_pattern
	num_tabs = 3
	choose_script = ghmix_assign_pattern
	focus_script = ghmix_focus_pattern
	get_selected_script = ghmix_get_selected_pattern
	get_list_script = ghmix_get_pattern_list
	get_name_text_script = ghmix_get_pattern_list_name_text
	params = {
		Color = orange
	}
	sort_by_blue = qs(0xc2dd1154)
	sort_by_orange = qs(0x256076bc)
	yellow = {
		name_text = qs(0xb380dd40)
		tool_tip = ms_tool_tip_preview_pattern
		choose_script = ghmix_preview_pattern
	}
}
ghmix_warning_save_pattern_fail = qs(0x2a1cf9dc)
ghmix_warning_record_pattern_fail = qs(0xec3a5c68)
