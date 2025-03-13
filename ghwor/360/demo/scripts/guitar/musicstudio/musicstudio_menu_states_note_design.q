musicstudio_note_sound_design_rhythm_state = {
	name_text = qs(0x6521a457)
	tool_tip = ms_tool_tip_bottom_note_sound_edit
	init_script = musicstudio_skip_closest_note
	init_params = {
		mode = guitar_sound_edit
	}
	deinit_script = musicstudio_note_edit_mode_deinit
	num_tabs = 3
	green = {
		musicstudio_get_active = musicstudio_note_get_active
		name_text_script = musicstudio_note_name_text
		tool_tip = ms_tool_tip_note
		musicstudio_scrolling_state = musicstudio_scrolling_note_select_state
	}
	red = {
		name_text_script = musicstudio_chord_name_text
		tool_tip = ms_tool_tip_chord
		musicstudio_scrolling_state = musicstudio_scrolling_chord_select_state
	}
	yellow = {
		name_text_script = musicstudio_velocity_name_text
		tool_tip = ms_tool_tip_velocity
		musicstudio_change_value_state = musicstudio_change_value_velocity
	}
	blue = {
		name_text_script = musicstudio_expressive_type_name_text
		tool_tip = ms_tool_tip_expressive_type
		musicstudio_scrolling_state = musicstudio_scrolling_expressive_type_select_state
	}
	orange = {
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x34fde7af)
		choose_script = musicstudio_skip_next_note_forward
		choose_params = {
			mode = guitar_sound_edit
		}
	}
	down = {
		choose_script = musicstudio_skip_next_note_backward
		choose_params = {
			mode = guitar_sound_edit
		}
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_note_edit_enable_whammy_skip
	}
	whammy = {
	}
}
musicstudio_note_sound_design_state = {
	name_text = qs(0x6521a457)
	tool_tip = ms_tool_tip_bottom_note_sound_edit
	init_script = musicstudio_skip_closest_note
	init_params = {
		mode = guitar_sound_edit
	}
	deinit_script = musicstudio_note_edit_mode_deinit
	num_tabs = 3
	green = {
		name_text_script = musicstudio_note_name_text
		tool_tip = ms_tool_tip_note
		musicstudio_scrolling_state = musicstudio_scrolling_note_select_state
	}
	red = {
		name_text_script = musicstudio_strum_type_name_text
		tool_tip = ms_tool_tip_type
		choose_script = musicstudio_strum_type_choose_script
		musicstudio_get_active = musicstudio_strum_type_get_active
	}
	yellow = {
		name_text_script = musicstudio_velocity_name_text
		tool_tip = ms_tool_tip_velocity
		musicstudio_change_value_state = musicstudio_change_value_velocity
	}
	blue = {
		name_text_script = musicstudio_expressive_type_name_text
		tool_tip = ms_tool_tip_expressive_type
		musicstudio_scrolling_state = musicstudio_scrolling_expressive_type_select_state
	}
	orange = {
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x34fde7af)
		choose_script = musicstudio_skip_next_note_forward
		choose_params = {
			mode = guitar_sound_edit
		}
	}
	down = {
		choose_script = musicstudio_skip_next_note_backward
		choose_params = {
			mode = guitar_sound_edit
		}
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_note_edit_enable_whammy_skip
	}
	whammy = {
	}
}

script musicstudio_note_sound_design_drums_init 
	musicstudio_preview_closest_drum_note
	musicstudio_skip_closest_note
endscript
musicstudio_note_sound_design_drums_state = {
	name_text = qs(0x6521a457)
	tool_tip = ms_tool_tip_bottom_note_sound_edit
	init_script = musicstudio_note_sound_design_drums_init
	deinit_script = musicstudio_note_edit_mode_deinit
	num_tabs = 3
	green = {
		name_text = qs(0x7fe519ce)
		tool_tip = ms_tool_tip_drums_note_edit
		musicstudio_state = musicstudio_note_sound_design_track_edit_drums_state
	}
	red = {
		name_text = qs(0xb04c8694)
		tool_tip = ms_tool_tip_toggle_drum_percussion
		musicstudio_state = musicstudio_note_sound_design_drums_perc_toggle_state
	}
	yellow = {
		name_text = qs(0xd6ab4c96)
		tool_tip = ms_tool_tip_drum_velocity
		musicstudio_state = musicstudio_note_sound_design_drums_velocity_state
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
		name_text = qs(0x34fde7af)
		choose_script = musicstudio_skip_next_note_forward
	}
	down = {
		choose_script = musicstudio_skip_next_note_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_note_edit_enable_whammy_skip
	}
	whammy = {
	}
}
musicstudio_note_sound_design_track_edit_drums_state = {
	swap_colors_for_lefty_drum
	name_text = qs(0xe294659e)
	tool_tip = ms_tool_tip_bottom_note_track_design
	init_script = musicstudio_skip_closest_note
	init_params = {
		mode = toggle_pattern
	}
	deinit_script = musicstudio_note_edit_mode_deinit
	num_tabs = 4
	green = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 1
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 1
			color_index = 0
		}
		sound_script = nullscript
	}
	red = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 65536
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 65536
			color_index = 1
		}
		sound_script = nullscript
	}
	yellow = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 4096
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 4096
			color_index = 2
		}
		sound_script = nullscript
	}
	blue = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 256
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 256
			color_index = 3
		}
		sound_script = nullscript
	}
	orange = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 16
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 16
			color_index = 4
		}
		sound_script = nullscript
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x34fde7af)
		choose_script = musicstudio_skip_next_note_forward
		choose_params = {
			mode = toggle_pattern
		}
	}
	down = {
		choose_script = musicstudio_skip_next_note_backward
		choose_params = {
			mode = toggle_pattern
		}
	}
	back = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 1048576
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 1048576
			color_index = 5
		}
		sound_script = nullscript
	}
	start = {
		name_text = qs(0x1821d84e)
		musicstudio_state = musicstudio_note_sound_design_drums_state
		sound_script = nullscript
	}
	whammy = {
	}
}
musicstudio_note_sound_design_drums_perc_toggle_state = {
	swap_colors_for_lefty_drum
	name_text = qs(0xb04c8694)
	tool_tip = ms_tool_tip_bottom_toggle_drum_percussion
	init_script = musicstudio_skip_closest_note
	init_params = {
		mode = drum_toggle_perc
	}
	deinit_script = musicstudio_note_edit_mode_deinit
	num_tabs = 4
	green = {
		name_text_script = musicstudio_edit_drum_perc_toggle_name_text
		tool_tip = ms_tool_tip_toggle_drum_percussion_detail
		name_text_script_params = {
			color_pattern = 1
			color_index = 0
			drum_name = qs(0x5c69e467)
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		get_active_params = {
			color_pattern = 1
			color_index = 0
		}
		choose_script = musicstudio_drum_perc_toggle
		choose_params = {
			color_pattern = 1
			color_index = 0
		}
		sound_script = nullscript
	}
	red = {
		name_text_script = musicstudio_edit_drum_perc_toggle_name_text
		tool_tip = ms_tool_tip_toggle_drum_percussion_detail
		name_text_script_params = {
			color_pattern = 65536
			color_index = 1
			drum_name = qs(0x91233341)
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		get_active_params = {
			color_pattern = 65536
			color_index = 1
		}
		choose_script = musicstudio_drum_perc_toggle
		choose_params = {
			color_pattern = 65536
			color_index = 1
		}
		sound_script = nullscript
	}
	yellow = {
		name_text_script = musicstudio_edit_drum_perc_toggle_name_text
		tool_tip = ms_tool_tip_toggle_drum_percussion_detail
		name_text_script_params = {
			color_pattern = 4096
			color_index = 2
			drum_name = qs(0x4d0311e7)
		}
		get_active_params = {
			color_pattern = 4096
			color_index = 2
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		choose_script = musicstudio_drum_perc_toggle
		choose_params = {
			color_pattern = 4096
			color_index = 2
		}
		sound_script = nullscript
	}
	blue = {
		name_text_script = musicstudio_edit_drum_perc_toggle_name_text
		tool_tip = ms_tool_tip_toggle_drum_percussion_detail
		name_text_script_params = {
			color_pattern = 256
			color_index = 3
			drum_name = qs(0x7744b7a4)
		}
		get_active_params = {
			color_pattern = 256
			color_index = 3
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		choose_script = musicstudio_drum_perc_toggle
		choose_params = {
			color_pattern = 256
			color_index = 3
		}
		sound_script = nullscript
	}
	orange = {
		name_text_script = musicstudio_edit_drum_perc_toggle_name_text
		tool_tip = ms_tool_tip_toggle_drum_percussion_detail
		name_text_script_params = {
			color_pattern = 16
			color_index = 4
			drum_name = qs(0x908b8fe5)
		}
		get_active_params = {
			color_pattern = 16
			color_index = 4
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		choose_script = musicstudio_drum_perc_toggle
		choose_params = {
			color_pattern = 16
			color_index = 4
		}
		sound_script = nullscript
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x34fde7af)
		choose_script = musicstudio_skip_next_note_forward
		choose_params = {
			mode = drum_toggle_perc
		}
	}
	down = {
		choose_script = musicstudio_skip_next_note_backward
		choose_params = {
			mode = drum_toggle_perc
		}
	}
	back = {
		name_text_script = musicstudio_edit_drum_perc_toggle_name_text
		tool_tip = ms_tool_tip_toggle_drum_percussion_detail
		name_text_script_params = {
			color_pattern = 1048576
			color_index = 5
			drum_name = qs(0x6e4b4a3e)
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		get_active_params = {
			color_pattern = 1048576
			color_index = 5
		}
		choose_script = musicstudio_drum_perc_toggle
		choose_params = {
			color_pattern = 1048576
			color_index = 5
		}
		sound_script = nullscript
	}
	start = {
		name_text = qs(0x1821d84e)
		musicstudio_state = musicstudio_note_sound_design_drums_state
		sound_script = nullscript
	}
	whammy = {
	}
}
musicstudio_note_sound_design_drums_velocity_state = {
	swap_colors_for_lefty_drum
	name_text = qs(0x41ad38ca)
	tool_tip = ms_tool_tip_bottom_note_sound_edit
	init_script = musicstudio_edit_drum_velocity_init
	init_params = {
		mode = drum_velocity
	}
	num_tabs = 4
	green = {
		name_text_script = musicstudio_edit_drum_velocity_name_text
		name_text_script_params = {
			color_pattern = 1
			color_index = 0
			drum_name = qs(0x7744b7a4)
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		get_active_params = {
			color_pattern = 1
			color_index = 0
		}
		musicstudio_change_value_state = musicstudio_change_value_drum_velocity
		choose_script = musicstudio_edit_drum_velocity_choose
		choose_params = {
			color_pattern = 1
			color_index = 0
		}
	}
	red = {
		name_text_script = musicstudio_edit_drum_velocity_name_text
		name_text_script_params = {
			color_pattern = 65536
			color_index = 1
			drum_name = qs(0x91233341)
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		get_active_params = {
			color_pattern = 65536
			color_index = 1
		}
		musicstudio_change_value_state = musicstudio_change_value_drum_velocity
		choose_script = musicstudio_edit_drum_velocity_choose
		choose_params = {
			color_pattern = 65536
			color_index = 1
		}
	}
	yellow = {
		name_text_script = musicstudio_edit_drum_velocity_name_text
		name_text_script_params = {
			color_pattern = 4096
			color_index = 2
			drum_name = qs(0x4d0311e7)
		}
		get_active_params = {
			color_pattern = 4096
			color_index = 2
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		musicstudio_change_value_state = musicstudio_change_value_drum_velocity
		choose_script = musicstudio_edit_drum_velocity_choose
		choose_params = {
			color_pattern = 4096
			color_index = 2
		}
	}
	blue = {
		name_text_script = musicstudio_edit_drum_velocity_name_text
		name_text_script_params = {
			color_pattern = 256
			color_index = 3
			drum_name = qs(0x5c69e467)
		}
		get_active_params = {
			color_pattern = 256
			color_index = 3
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		musicstudio_change_value_state = musicstudio_change_value_drum_velocity
		choose_script = musicstudio_edit_drum_velocity_choose
		choose_params = {
			color_pattern = 256
			color_index = 3
		}
	}
	orange = {
		name_text_script = musicstudio_edit_drum_velocity_name_text
		name_text_script_params = {
			color_pattern = 16
			color_index = 4
			drum_name = qs(0x908b8fe5)
		}
		get_active_params = {
			color_pattern = 16
			color_index = 4
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		musicstudio_change_value_state = musicstudio_change_value_drum_velocity
		choose_script = musicstudio_edit_drum_velocity_choose
		choose_params = {
			color_pattern = 16
			color_index = 4
		}
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x34fde7af)
		choose_script = musicstudio_skip_next_note_forward
		choose_params = {
			mode = drum_velocity
		}
	}
	down = {
		choose_script = musicstudio_skip_next_note_backward
		choose_params = {
			mode = drum_velocity
		}
	}
	back = {
		name_text_script = musicstudio_edit_drum_velocity_name_text
		name_text_script_params = {
			color_pattern = 1048576
			color_index = 5
			drum_name = qs(0x6e4b4a3e)
		}
		musicstudio_get_active = musicstudio_edit_drum_perc_toggle_get_active
		get_active_params = {
			color_pattern = 1048576
			color_index = 5
		}
		musicstudio_change_value_state = musicstudio_change_value_drum_velocity
		choose_script = musicstudio_edit_drum_velocity_choose
		choose_params = {
			color_pattern = 1048576
			color_index = 5
		}
	}
	start = {
		name_text = qs(0x1821d84e)
		musicstudio_state = musicstudio_note_sound_design_drums_state
		sound_script = nullscript
	}
	whammy = {
	}
}
musicstudio_track_design_state = {
	name_text = qs(0x14291e8f)
	tool_tip = ms_tool_tip_bottom_track_design_menu
	num_tabs = 3
	green = {
		name_text = qs(0xfb7894ac)
		tool_tip = ms_tool_note_track_design
		musicstudio_get_active = musicstudio_track_design_get_active
		musicstudio_get_state = musicstudio_track_design_get_state
	}
	red = {
		name_text = qs(0x61d38b50)
		tool_tip = ms_tool_star_power_design
		musicstudio_state = musicstudio_star_power_design_state
	}
	yellow = {
		name_text = qs(0xc0f45338)
		tool_tip = ms_tool_set_playable_track
		musicstudio_get_state = musicstudio_edit_playable_get_state
		musicstudio_get_active = musicstudio_edit_playable_get_active
		musicstudio_unactive_warning = ghmix_warning_set_playable_fail_1
	}
	blue = {
	}
	orange = {
	}
	left = {
		tool_tip = ms_tool_tip_change_snap_left
		name_text_script = ghmix_menu_update_snap_text
		choose_script = musicstudio_change_snap_left
	}
	right = {
		tool_tip = ms_tool_tip_change_snap_right
		name_text_script = ghmix_menu_update_snap_text
		choose_script = musicstudio_change_snap_right
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
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_note_edit_enable_whammy_skip
	}
	whammy = {
	}
}
musicstudio_note_track_design_state = {
	name_text = qs(0xfb7894ac)
	tool_tip = ms_tool_tip_bottom_note_track_design
	init_script = musicstudio_skip_closest_note
	init_params = {
		mode = toggle_pattern
	}
	deinit_script = musicstudio_note_edit_mode_deinit
	num_tabs = 4
	green = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 65536
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 65536
		}
	}
	red = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 4096
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 4096
		}
	}
	yellow = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 256
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 256
		}
	}
	blue = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 16
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 16
		}
	}
	orange = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 1
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 1
		}
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x34fde7af)
		choose_script = musicstudio_skip_next_note_forward
		choose_params = {
			mode = toggle_pattern
		}
	}
	down = {
		choose_script = musicstudio_skip_next_note_backward
		choose_params = {
			mode = toggle_pattern
		}
	}
	back = {
		name_text = qs(0xb452cf58)
		tool_tip = ms_tool_tip_clear_pattern
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_clear_pattern
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_note_edit_enable_whammy_skip
	}
	whammy = {
	}
}
musicstudio_note_track_design_drums_state = {
	name_text = qs(0x02cdf7ec)
	tool_tip = ms_tool_tip_bottom_note_track_design
	init_script = musicstudio_skip_closest_note
	init_params = {
		mode = toggle_pattern
	}
	deinit_script = musicstudio_note_edit_mode_deinit
	num_tabs = 3
	green = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 1
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 1
		}
	}
	red = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 65536
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 65536
		}
	}
	yellow = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 4096
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 4096
		}
	}
	blue = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 256
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 256
		}
	}
	orange = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 16
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 16
		}
	}
	left = {
	}
	right = {
	}
	up = {
		name_text = qs(0x34fde7af)
		choose_script = musicstudio_skip_next_note_forward
		choose_params = {
			mode = toggle_pattern
		}
	}
	down = {
		choose_script = musicstudio_skip_next_note_backward
		choose_params = {
			mode = toggle_pattern
		}
	}
	back = {
		name_text_script = musicstudio_toggle_pattern_name_text
		name_text_script_params = {
			color_pattern = 1048576
		}
		musicstudio_get_active = musicstudio_toggle_pattern_is_active
		choose_script = musicstudio_toggle_pattern
		choose_params = {
			color_pattern = 1048576
		}
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_note_edit_enable_whammy_skip
	}
	whammy = {
	}
}
musicstudio_star_power_design_state = {
	name_text = qs(0x61d38b50)
	tool_tip = ms_tool_tip_bottom_star_power
	num_tabs = 4
	init_script = musicstudio_set_star_power_init
	deinit_script = musicstudio_set_star_power_deinit
	green = {
		name_text = qs(0x404829c6)
		tool_tip = ms_tool_tip_set_star_power
		choose_script = musicstudio_set_star_power
	}
	red = {
		name_text_script = musicstudio_toggle_select_get_name_text
		tool_tip = ms_tool_tip_select_all_one_star_power
		choose_script = musicstudio_toggle_star_design_select
	}
	yellow = {
		name_text = qs(0x38fbaba2)
		tool_tip = ms_tool_tip_remove_star_power
		choose_script = musicstudio_remove_star_power
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
		name_text = qs(0xfadd6bd7)
		choose_script = musicstudio_skip_forward_measure_select_area
	}
	down = {
		choose_script = musicstudio_skip_backward_measure_select_area
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_note_edit_enable_whammy_skip
	}
	whammy = {
	}
}
musicstudio_guitar_edit_playable_state = {
	name_text = qs(0x0f2c0020)
	tool_tip = ms_tool_tip_bottom_set_playable
	num_tabs = 4
	init_script = musicstudio_edit_playable_init
	deinit_script = musicstudio_edit_playable_deinit
	green = {
		name_text = qs(0x36bae7ad)
		tool_tip = ms_tool_tip_remove_set_lead
		choose_script = musicstudio_set_playable_lead
	}
	red = {
		name_text = qs(0x50a28307)
		tool_tip = ms_tool_tip_remove_set_rhythm
		choose_script = musicstudio_set_playable_rhythm
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
		name_text = qs(0xfadd6bd7)
		choose_script = musicstudio_skip_forward_measure_select_area
	}
	down = {
		choose_script = musicstudio_skip_backward_measure_select_area
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_note_edit_enable_whammy_skip
	}
	whammy = {
	}
}
musicstudio_bass_edit_playable_state = {
	name_text = qs(0x537b3f00)
	tool_tip = ms_tool_tip_bottom_set_playable
	num_tabs = 4
	init_script = musicstudio_edit_playable_init
	deinit_script = musicstudio_edit_playable_deinit
	green = {
		name_text = qs(0x4732ac0b)
		tool_tip = ms_tool_tip_remove_set_bass
		choose_script = musicstudio_set_playable_bass
	}
	red = {
		name_text = qs(0x9248ac9d)
		tool_tip = ms_tool_tip_remove_set_keyboard
		choose_script = musicstudio_set_playable_keyboard
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
		name_text = qs(0xfadd6bd7)
		choose_script = musicstudio_skip_forward_measure_select_area
	}
	down = {
		choose_script = musicstudio_skip_backward_measure_select_area
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_note_edit_enable_whammy_skip
	}
	whammy = {
	}
}

script musicstudio_preview_velocity 
	<menu_id> :gettags
	musicstudio_preview_closest_note velocity = <curr_value>
endscript
musicstudio_change_value_velocity = {
	name_text = qs(0xe67986a4)
	tool_tip = ms_tool_tip_scroll_velocity
	append_text = qs(0xe67986a4)
	num_tabs = 4
	change_value_script = musicstudio_velocity_change_value
	up_down_script = musicstudio_velocity_up_down
	get_curr_value_script = musicstudio_velocity_get_curr_value
	get_value_bounds_script = musicstudio_velocity_get_value_bounds
	deinit_script = musicstudio_menu_unused_button
	yellow = {
		name_text = qs(0xdfb2b37f)
		choose_script = musicstudio_preview_velocity
	}
	blue = {
		name_text = qs(0xb487029e)
		choose_script = musicstudio_velocity_add_10
	}
	orange = {
		name_text = qs(0x62dee183)
		choose_script = musicstudio_velocity_subtract_10
	}
}
musicstudio_change_value_drum_velocity = {
	name_text = qs(0xe67986a4)
	tool_tip = ms_tool_tip_scroll_velocity
	append_text = qs(0xe67986a4)
	num_tabs = 5
	change_value_script = musicstudio_drum_velocity_change_value_confirm
	up_down_script = musicstudio_drum_velocity_change_value
	get_curr_value_script = musicstudio_drum_velocity_get_curr_value
	get_value_bounds_script = musicstudio_drum_velocity_get_value_bounds
	deinit_script = musicstudio_menu_unused_button
	no_scrolling_sound
}
musicstudio_scrolling_chord_select_state = {
	name_text = qs(0xcf0365e8)
	tool_tip = ms_tool_tip_scroll_chord_select
	num_tabs = 4
	choose_script = musicstudio_change_chord
	get_selected_script = musicstudio_get_selected_chord
	get_list_checksum_script = musicstudio_get_list_checksum_chord
	deinit_script = musicstudio_menu_unused_button
	focus_script = musicstudio_preview_chord
	no_scrolling_sound
}
musicstudio_scrolling_expressive_type_select_state = {
	name_text = qs(0xfd7aab8d)
	tool_tip = ms_tool_tip_scroll_note_type
	num_tabs = 4
	choose_script = musicstudio_change_expressive_type
	get_selected_script = musicstudio_get_selected_expressive_type
	get_list_checksum_script = musicstudio_get_list_checksum_expressive_type
	deinit_script = musicstudio_menu_unused_button
	focus_script = musicstudio_preview_expressive_type
	no_scrolling_sound
}
musicstudio_scrolling_note_select_state = {
	name_text = qs(0x889b72a9)
	tool_tip = ms_tool_tip_scroll_note_select
	num_tabs = 4
	choose_script = musicstudio_change_note
	get_selected_script = musicstudio_get_selected_chromatic_note
	get_list_size_script = musicstudio_notes_get_list_size
	get_name_text_script = musicstudio_notes_get_name_text
	focus_script = musicstudio_preview_note
	deinit_script = musicstudio_menu_unused_button
	no_scrolling_sound
}
