musicstudio_transport_state = {
	name_text = qs(0x894e1bd6)
	tool_tip = ms_tool_tip_bottom_main
	num_tabs = 1
	green = {
		name_text = qs(0xcdaa4ea8)
		tool_tip = ms_tool_tip_play
		musicstudio_state = musicstudio_play_state
		sound_script = musicstudio_ghmix_menu_sound_play
	}
	red = {
		name_text = qs(0x04c5ee54)
		tool_tip = ms_tool_tip_record
		musicstudio_state = musicstudio_record_state
	}
	yellow = {
		name_text = qs(0x65b8a528)
		tool_tip = ms_tool_tip_edit
		musicstudio_state = musicstudio_edit_state
	}
	blue = {
		name_text = qs(0xf761b100)
		tool_tip = ms_tool_tip_track_settings
		musicstudio_state = musicstudio_track_settings_state
	}
	orange = {
		name_text = qs(0x2901dcad)
		tool_tip = ms_tool_tip_track_tools
		musicstudio_state = musicstudio_tools_state
	}
	left = {
		name_text = qs(0x81bf948c)
		musicstudio_scrolling_state = musicstudio_scrolling_track_select_state
		musicstudio_get_active = musicstudio_track_select_get_active
	}
	right = {
		name_text = qs(0x81bf948c)
		musicstudio_scrolling_state = musicstudio_scrolling_track_select_state
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
		tool_tip = ms_tool_tip_preview
		musicstudio_state = musicstudio_preview_state
		sound_script = musicstudio_ghmix_menu_sound_play
	}
	start = {
		name_text = qs(0x8200b5ff)
		musicstudio_popup_state = musicstudio_popup_mode_select
	}
	whammy = {
	}
}
musicstudio_record_state = {
	name_text = qs(0x04c5ee54)
	tool_tip = ms_tool_tip_bottom_record
	init_script = musicstudio_record_state_init
	num_tabs = 2
	green = {
		name_text = qs(0x66451271)
		tool_tip = ms_tool_tip_live_record
		musicstudio_get_active = musicstudio_recording_get_active
		musicstudio_state = musicstudio_live_record_state
		sound_script = musicstudio_ghmix_menu_sound_play
	}
	red = {
		name_text = qs(0x1de48f0a)
		tool_tip = ms_tool_tip_step_record
		musicstudio_get_active = musicstudio_recording_get_active
		musicstudio_state = musicstudio_step_record_state
		choose_script = musicstudio_step_record_init
		sound_script = musicstudio_ghmix_menu_sound_play
	}
	yellow = {
		name_text = qs(0x8389b370)
		tool_tip = ms_tool_tip_punch_in_record
		musicstudio_get_active = musicstudio_recording_get_active
		musicstudio_state = musicstudio_punch_in_record_state
		sound_script = musicstudio_ghmix_menu_sound_play
	}
	blue = {
		name_text = qs(0x5137d418)
		tool_tip = ms_tool_tip_loop
		musicstudio_state = musicstudio_loop_state
	}
	orange = {
		name_text_script = musicstudio_add_marker_get_name_text
		musicstudio_get_active = musicstudio_add_marker_get_active
		tool_tip = ms_tool_tip_add_marker_menu
		choose_script = musicstudio_add_marker_setup
		musicstudio_get_state = musicstudio_add_marker_get_state
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
		choose_script = musicstudio_skip_forward_record_state
	}
	down = {
		choose_script = musicstudio_skip_backward_record_state
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
	}
	whammy = {
	}
}
musicstudio_live_record_state = {
	name_text = qs(0x66451271)
	tool_tip = ms_tool_tip_bottom_live_record
	tool_tip_ps3 = ms_tool_tip_bottom_live_record_ps3
	num_tabs = 3
	init_script = musicstudio_live_record
	deinit_script = musicstudio_live_record_stop
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
		choose_script = notetracker_whammy_set_fast_forward
	}
	down = {
		choose_script = notetracker_whammy_set_rewind
	}
	back = {
	}
	start = {
		name_text = qs(0x0a46311a)
		musicstudio_state = musicstudio_transport_state
		sound_script = musicstudio_ghmix_menu_sound_stop
	}
	whammy = {
	}
}
musicstudio_step_record_state = {
	name_text = qs(0x1de48f0a)
	tool_tip = ms_tool_tip_bottom_step_record
	num_tabs = 3
	init_script = musicstudio_step_record
	deinit_script = musicstudio_step_record_stop
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
		tool_tip = ms_tool_tip_change_snap_left
		name_text_script = ghmix_menu_update_snap_text
		choose_script = musicstudio_change_step_snap_left
	}
	right = {
		tool_tip = ms_tool_tip_change_snap_right
		name_text_script = ghmix_menu_update_snap_text
		choose_script = musicstudio_change_step_snap_right
	}
	up = {
	}
	down = {
	}
	back = {
	}
	start = {
		name_text = qs(0x0a46311a)
		choose_script = musicstudio_step_record_end
		musicstudio_state = musicstudio_transport_state
		sound_script = musicstudio_ghmix_menu_sound_stop
	}
	whammy = {
	}
}
musicstudio_step_record_whammy_state = {
	name_text = qs(0xa3f145fd)
	tool_tip = ms_tool_tip_bottom_step_record_whammy
	num_tabs = 2
	init_script = musicstudio_step_record_whammy_init
	deinit_script = musicstudio_step_record_whammy_deinit
	green = {
	}
	red = {
		musicstudio_get_active = step_record_whammy_delete_note_get_active
		name_text_script = step_record_whammy_delete_note_name_text
		choose_script = step_record_whammy_delete_note
	}
	yellow = {
	}
	blue = {
	}
	orange = {
	}
	left = {
		tool_tip = ms_tool_tip_change_snap_left
		name_text_script = ghmix_menu_update_snap_text
		choose_script = musicstudio_change_step_snap_left
	}
	right = {
		tool_tip = ms_tool_tip_change_snap_right
		name_text_script = ghmix_menu_update_snap_text
		choose_script = musicstudio_change_step_snap_right
	}
	up = {
		name_text = qs(0xde8e2ce5)
		choose_script = musicstudio_step_record_whammy_skip_forward
	}
	down = {
		choose_script = musicstudio_step_record_whammy_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x0a46311a)
		choose_script = musicstudio_step_record_end
		musicstudio_state = musicstudio_transport_state
		sound_script = musicstudio_ghmix_menu_sound_stop
	}
	whammy = {
	}
}
musicstudio_punch_in_record_state = {
	name_text = qs(0x8389b370)
	tool_tip = ms_tool_tip_bottom_punch_in_record
	num_tabs = 3
	init_script = musicstudio_punch_in_record
	deinit_script = musicstudio_punch_in_record_stop
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
	}
	down = {
	}
	back = {
	}
	start = {
		name_text = qs(0x0a46311a)
		musicstudio_state = musicstudio_transport_state
		sound_script = musicstudio_ghmix_menu_sound_stop
	}
	whammy = {
	}
}
musicstudio_loop_state = {
	name_text = qs(0x5137d418)
	tool_tip = ms_tool_tip_bottom_loop
	num_tabs = 3
	init_script = musicstudio_loop_init
	deinit_script = musicstudio_loop_deinit
	green = {
		name_text = qs(0x595064ad)
		tool_tip = ms_tool_tip_set_loop
		choose_script = musicstudio_set_loop
		musicstudio_state = musicstudio_transport_state
	}
	red = {
		name_text = qs(0x8f45ee0f)
		tool_tip = ms_tool_tip_clear_loop
		musicstudio_get_active = musicstudio_clear_loop_get_active
		choose_script = musicstudio_clear_loop
		musicstudio_state = musicstudio_transport_state
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
	}
	whammy = {
	}
}
musicstudio_add_marker_state = {
	name_text = qs(0x897495f1)
	tool_tip = ms_tool_tip_bottom_marker
	num_tabs = 3
	init_script = musicstudio_add_marker_init
	deinit_script = musicstudio_add_marker_deinit
	green = {
		name_text_script = musicstudio_add_edit_marker_get_name_text
		musicstudio_get_active = musicstudio_add_edit_marker_get_active
		tool_tip = ms_tool_tip_add_marker
		choose_script = musicstudio_check_add_remove_marker
		musicstudio_state = musicstudio_record_state
	}
	red = {
		name_text_script = musicstudio_marker_name_get_name_text
		tool_tip = ms_tool_tip_marker_type
		musicstudio_scrolling_state = musicstudio_scrolling_marker_name_state
	}
	yellow = {
		name_text_script = musicstudio_marker_lightshow_get_name_text
		tool_tip = ms_tool_tip_lightshow
		musicstudio_scrolling_state = musicstudio_scrolling_marker_lightshow_state
	}
	blue = {
		tool_tip = ms_tool_tip_pod_1_effect
		name_text_script = musicstudio_line6_0_get_name_text
		choose_script = musicstudio_line6_0_ab_toggle
	}
	orange = {
		tool_tip = ms_tool_tip_pod_2_effect
		name_text_script = musicstudio_line6_1_get_name_text
		choose_script = musicstudio_line6_1_ab_toggle
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
		musicstudio_state = musicstudio_transport_state
	}
	whammy = {
	}
}
musicstudio_edit_state = {
	name_text = qs(0x65b8a528)
	tool_tip = ms_tool_tip_bottom_edit
	num_tabs = 2
	green = {
		name_text = qs(0x900b7dde)
		tool_tip = ms_tool_tip_delete_copy_cut
		musicstudio_state = musicstudio_delete_copy_cut_state
		musicstudio_get_active = musicstudio_track_has_notes_get_active
	}
	red = {
		name_text = qs(0xc84166a2)
		tool_tip = ms_tool_tip_paste_menu
		musicstudio_state = musicstudio_paste_state
		musicstudio_get_active = musicstudio_recording_get_active
	}
	yellow = {
		name_text = qs(0x6521a457)
		tool_tip = ms_tool_tip_note_sound_edit
		musicstudio_get_state = musicstudio_note_sound_design_get_state
		musicstudio_get_active = musicstudio_track_has_notes_get_active
	}
	blue = {
		name_text = qs(0x7c893a31)
		tool_tip = ms_tool_tip_quantize_menu
		musicstudio_state = musicstudio_quantize_state
		musicstudio_get_active = musicstudio_track_has_notes_get_active
	}
	orange = {
		name_text = qs(0x55a8227a)
		tool_tip = ms_tool_tip_nudge_menu
		musicstudio_state = musicstudio_nudge_state
		musicstudio_get_active = musicstudio_track_has_notes_get_active
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
	}
	whammy = {
	}
}
musicstudio_delete_copy_cut_state = {
	name_text = qs(0x900b7dde)
	tool_tip = ms_tool_tip_bottom_delete
	num_tabs = 3
	init_script = musicstudio_delete_area_init
	deinit_script = musicstudio_select_area_deinit
	green = {
		name_text = qs(0xef465145)
		tool_tip = ms_tool_tip_delete
		choose_script = musicstudio_delete_area
		musicstudio_state = musicstudio_transport_state
	}
	red = {
		name_text = qs(0xe94026a5)
		tool_tip = ms_tool_tip_copy
		choose_script = musicstudio_copy_area
		musicstudio_state = musicstudio_edit_state
	}
	yellow = {
		name_text = qs(0x97c3f3ce)
		tool_tip = ms_tool_tip_cut
		choose_script = musicstudio_cut_area
		musicstudio_state = musicstudio_edit_state
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
		tool_tip = ms_tool_tip_change_snap_left
		name_text_script = ghmix_menu_update_snap_text
		choose_script = musicstudio_change_step_snap_left
	}
	right = {
		tool_tip = ms_tool_tip_change_snap_right
		name_text_script = ghmix_menu_update_snap_text
		choose_script = musicstudio_change_step_snap_right
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
		musicstudio_state = musicstudio_transport_state
	}
	whammy = {
	}
}
musicstudio_paste_state = {
	name_text = qs(0xc84166a2)
	tool_tip = ms_tool_tip_bottom_paste
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
		choose_script = musicstudio_paste_skip_forward
	}
	down = {
		choose_script = musicstudio_paste_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
	}
	whammy = {
	}
}
musicstudio_quantize_state = {
	name_text = qs(0x7c893a31)
	tool_tip = ms_tool_tip_bottom_quantize
	num_tabs = 3
	init_script = musicstudio_select_area_init
	deinit_script = musicstudio_select_area_deinit
	green = {
		name_text = qs(0x401e47d6)
		tool_tip = ms_tool_tip_quantize
		choose_script = musicstudio_quantize_area
		musicstudio_state = musicstudio_transport_state
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
		musicstudio_state = musicstudio_transport_state
	}
	whammy = {
	}
}
musicstudio_nudge_state = {
	name_text = qs(0x55a8227a)
	tool_tip = ms_tool_tip_bottom_nudge
	init_script = musicstudio_nudge_init
	num_tabs = 3
	green = {
		name_text = qs(0x0b4b1671)
		tool_tip = ms_tool_tip_nudge
		choose_params = {
			direction = 1
		}
		choose_script = musicstudio_nudge
	}
	red = {
		name_text = qs(0x88275ff3)
		tool_tip = ms_tool_tip_nudge_all
		choose_params = {
			direction = 1
		}
		choose_script = musicstudio_nudge_all
	}
	yellow = {
		name_text = qs(0x3c00c126)
		tool_tip = ms_tool_tip_nudge_back
		choose_params = {
			direction = -1
		}
		choose_script = musicstudio_nudge
	}
	blue = {
		name_text = qs(0x3ab541b7)
		tool_tip = ms_tool_tip_nudge_all_back
		choose_params = {
			direction = -1
		}
		choose_script = musicstudio_nudge_all
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
	}
	whammy = {
	}
}
musicstudio_track_settings_state = {
	name_text = qs(0xf761b100)
	tool_tip = ms_tool_tip_bottom_track_settings
	num_tabs = 2
	green = {
		name_text = qs(0xbae0063c)
		tool_tip = ms_tool_tip_scale
		musicstudio_get_state = musicstudio_scale_customize_get_state
		musicstudio_get_active = musicstudio_scale_customize_get_active
		musicstudio_unactive_warning = ghmix_warning_customize_scale_fail_1
		choose_script = musicstudio_scale_setup
	}
	red = {
		name_text = qs(0xc61aaa34)
		tool_tip = ms_tool_tip_sound
		musicstudio_get_state = musicstudio_sound_customize_get_state
	}
	yellow = {
		name_text = qs(0xdc6e5e8d)
		tool_tip = ms_tool_tip_effect
		musicstudio_get_active = musicstudio_effect_get_active
		musicstudio_state = musicstudio_effect_settings_state
	}
	blue = {
		name_text = qs(0x55a2acae)
		tool_tip = ms_tool_tip_mixer
		musicstudio_state = musicstudio_mixer_state
		choose_script = musicstudio_mixer_setup
	}
	orange = {
	}
	left = {
		tool_tip = ms_tool_tip_change_snap_right
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
	}
	whammy = {
	}
}
musicstudio_mixer_state = {
	name_text = qs(0x4e1533e0)
	tool_tip = ms_tool_tip_bottom_mixer
	num_tabs = 3
	init_script = musicstudio_mixer_init
	green = {
		name_text_script = musicstudio_mixer_volume_get_name_text
		tool_tip = ms_tool_tip_volume
		musicstudio_change_value_state = musicstudio_mixer_volume_change_value_state
	}
	red = {
		name_text_script = musicstudio_mixer_pan_get_name_text
		tool_tip = ms_tool_tip_pan
		musicstudio_get_active = musicstudio_mixer_pan_get_active
		musicstudio_change_value_state = musicstudio_mixer_pan_change_value_state
	}
	yellow = {
		name_text_script = musicstudio_mixer_effect_get_name_text
		tool_tip = ms_tool_tip_mixer_effect
		choose_script = musicstudio_mixer_effect_toggle
	}
	blue = {
		name_text_script = musicstudio_mixer_input_volume_get_name_text
		tool_tip = ms_tool_tip_mixer_effect_volume
		musicstudio_get_active = musicstudio_mixer_input_volume_get_active
		musicstudio_change_value_state = musicstudio_mixer_input_volume_change_value_state
	}
	orange = {
		name_text_script = musicstudio_mixer_play_stop_get_name_text
		tool_tip = ms_tool_tip_mixer_preview
		choose_script = musicstudio_mixer_play_stop
	}
	left = {
		name_text = qs(0x81bf948c)
		choose_script = musicstudio_mixer_switch_track_left
		musicstudio_get_active = musicstudio_track_select_get_active
	}
	right = {
		name_text = qs(0x81bf948c)
		choose_script = musicstudio_mixer_switch_track_right
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
	}
	start = {
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
		choose_script = musicstudio_mixer_deinit
	}
	whammy = {
	}
}
musicstudio_scale_state = {
	name_text = qs(0xbae0063c)
	tool_tip = ms_tool_tip_bottom_scale
	init_script = musicstudio_scale_state_init
	deinit_script = musicstudio_scale_state_deinit
	num_tabs = 3
	green = {
		tool_tip = ms_tool_tip_scale_root
		name_text_script = musicstudio_get_root_note_text
		musicstudio_scrolling_state = musicstudio_scrolling_sound_root_state
	}
	red = {
		tool_tip = ms_tool_tip_scale_type
		name_text_script = musicstudio_get_scale_text
		musicstudio_scrolling_state = musicstudio_scrolling_sound_scale_state
	}
	yellow = {
		name_text = qs(0x8463b4b5)
		tool_tip = ms_tool_tip_scale_customize
		choose_script = musicstudio_scale_customize
		musicstudio_scrolling_state = musicstudio_scrolling_customize_scale_state
	}
	blue = {
		tool_tip = ms_tool_tip_scale_chord_type_range
		name_text_script = musicstudio_get_range_text
		choose_script = musicstudio_scale_toggle_range
		musicstudio_get_active = musicstudio_scale_range_get_active
		musicstudio_unactive_warning = ghmix_warning_scale_range_fail_1
	}
	orange = {
		name_text_script = musicstudio_get_bend_set_name_text
		tool_tip = ms_tool_tip_bend_set
		musicstudio_scrolling_state = musicstudio_scrolling_bend_set_state
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
		musicstudio_state = musicstudio_transport_state
	}
	whammy = {
	}
}
musicstudio_tools_state = {
	name_text = qs(0x2901dcad)
	tool_tip = ms_tool_tip_bottom_tools
	num_tabs = 2
	green = {
		name_text = qs(0xe3c4a422)
		tool_tip = ms_tool_tip_undo
		choose_script = musicstudio_undo
		musicstudio_state = musicstudio_transport_state
		musicstudio_get_active = musicstudio_undo_get_active
	}
	red = {
		name_text = qs(0x09b1d414)
		tool_tip = ms_tool_tip_tempo
		musicstudio_change_value_state = musicstudio_change_value_tempo
	}
	yellow = {
		name_text = qs(0x14291e8f)
		tool_tip = ms_tool_tip_track_design
		musicstudio_state = musicstudio_track_design_state
		musicstudio_get_active = musicstudio_track_has_notes_get_active
	}
	blue = {
		name_text = qs(0x2ec522ea)
		tool_tip = ms_tool_tip_general_setting
		musicstudio_state = musicstudio_general_settings_state
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
	}
	whammy = {
	}
}
musicstudio_general_settings_state = {
	name_text = qs(0x2ec522ea)
	tool_tip = ms_tool_tip_bottom_general_setting
	num_tabs = 3
	green = {
		tool_tip = ms_tool_tip_scrub
		name_text_script = musicstudio_get_scrub_text
		choose_script = musicstudio_enable_scrub
	}
	red = {
		tool_tip = ms_tool_tip_metronome
		name_text_script = musicstudio_get_metronome_text
		choose_script = musicstudio_enable_metronome
	}
	yellow = {
		tool_tip = ms_tool_tip_menu_sounds
		name_text_script = musicstudio_toggle_menu_sounds_get_name_text
		choose_script = musicstudio_toggle_menu_sounds
	}
	blue = {
		tool_tip = ms_tool_tip_lefty_flip
		name_text_script = musicstudio_toggle_lefty_flip_get_name_text
		choose_script = musicstudio_toggle_lefty_flip
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
	}
	whammy = {
	}
}
musicstudio_play_state = {
	name_text = qs(0xcdaa4ea8)
	tool_tip = ms_tool_tip_bottom_play
	tool_tip_ps3 = ms_tool_tip_bottom_play_ps3
	num_tabs = 2
	init_script = musicstudio_playback
	deinit_script = musicstudio_playback_stop
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
		choose_script = notetracker_whammy_set_fast_forward
	}
	down = {
		choose_script = notetracker_whammy_set_rewind
	}
	back = {
	}
	start = {
		name_text = qs(0x2742f662)
		musicstudio_state = musicstudio_transport_state
		sound_script = musicstudio_ghmix_menu_sound_stop
	}
	whammy = {
	}
}
musicstudio_preview_state = {
	name_text = qs(0xdfb2b37f)
	tool_tip = ms_tool_tip_bottom_preview
	tool_tip_ps3 = ms_tool_tip_bottom_preview_ps3
	num_tabs = 2
	init_script = musicstudio_preview
	deinit_script = musicstudio_preview_stop
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
		name_text = qs(0x81bf948c)
		musicstudio_scrolling_state = musicstudio_scrolling_preview_track_select_state
		musicstudio_get_active = musicstudio_track_select_get_active
	}
	right = {
		name_text = qs(0x81bf948c)
		musicstudio_scrolling_state = musicstudio_scrolling_preview_track_select_state
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
		musicstudio_state = musicstudio_transport_state
		sound_script = musicstudio_ghmix_menu_sound_stop
	}
	whammy = {
	}
}
musicstudio_drum_kit_state = {
	name_text = qs(0x38f0d0d7)
	tool_tip = ms_tool_tip_bottom_drum_kit
	num_tabs = 3
	init_script = musicstudio_drum_kit_menu_enter
	deinit_script = musicstudio_drum_kit_menu_exit
	green = {
		tool_tip = ms_tool_tip_drum_kit
		name_text_script = musicstudio_get_drum_kit_text
		musicstudio_scrolling_state = musicstudio_scrolling_sound_select_dumkit_state
		choose_script = musicstudio_choose_customize
	}
	red = {
		tool_tip = ms_tool_tip_percussion_kit
		name_text_script = musicstudio_get_drum_kit_text
		name_text_script_params = {
			percussion
		}
		musicstudio_scrolling_state = musicstudio_scrolling_sound_select_percussionkit_state
		choose_script = musicstudio_choose_customize
		choose_params = {
			percussion
		}
	}
	yellow = {
		tool_tip = ms_tool_tip_customize_drum_kit
		name_text_script = musicstudio_get_drum_kit_text
		name_text_script_params = {
			custom
		}
		choose_script = musicstudio_choose_customize
		choose_params = {
			custom_kit
		}
		musicstudio_state = musicstudio_drumkit_customize_state
	}
	blue = {
		tool_tip = ms_tool_tip_customize_percussion_kit
		name_text_script = musicstudio_get_drum_kit_text
		name_text_script_params = {
			custom
			percussion
		}
		choose_script = musicstudio_choose_customize
		choose_params = {
			percussion
			custom_kit
		}
		musicstudio_state = musicstudio_drumkit_customize_state
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
		name_text = qs(0x894e1bd6)
		musicstudio_state = musicstudio_transport_state
	}
	whammy = {
	}
}
musicstudio_drumkit_customize_state = {
	swap_colors_for_lefty_drum
	name_text_script = musicstudio_get_customize_drum_kit_text
	tool_tip = ms_tool_tip_bottom_custom_drum
	num_tabs = 4
	init_script = musicstudio_enter_custom
	green = {
		tool_tip = ms_tool_tip_floortom
		name_text_script = musicstudio_get_drum_pad_text
		name_text_script_params = {
			Type = tom2
		}
		choose_script = musicstudio_drumkit_customize_set_pad
		choose_params = {
			Type = tom2
		}
		musicstudio_get_state = musicstudio_get_drum_kit_pad_scrolling_state
	}
	red = {
		tool_tip = ms_tool_tip_snare
		name_text_script = musicstudio_get_drum_pad_text
		name_text_script_params = {
			Type = snare
		}
		choose_script = musicstudio_drumkit_customize_set_pad
		choose_params = {
			Type = snare
		}
		musicstudio_get_state = musicstudio_get_drum_kit_pad_scrolling_state
	}
	yellow = {
		tool_tip = ms_tool_tip_hihat
		name_text_script = musicstudio_get_drum_pad_text
		name_text_script_params = {
			Type = hihat
		}
		choose_script = musicstudio_drumkit_customize_set_pad
		choose_params = {
			Type = hihat
		}
		musicstudio_get_state = musicstudio_get_drum_kit_pad_scrolling_state
	}
	blue = {
		tool_tip = ms_tool_tip_hitom
		name_text_script = musicstudio_get_drum_pad_text
		name_text_script_params = {
			Type = tom1
		}
		choose_script = musicstudio_drumkit_customize_set_pad
		choose_params = {
			Type = tom1
		}
		musicstudio_get_state = musicstudio_get_drum_kit_pad_scrolling_state
	}
	orange = {
		tool_tip = ms_tool_tip_cymbal
		name_text_script = musicstudio_get_drum_pad_text
		name_text_script_params = {
			Type = cymbal
		}
		choose_script = musicstudio_drumkit_customize_set_pad
		choose_params = {
			Type = cymbal
		}
		musicstudio_get_state = musicstudio_get_drum_kit_pad_scrolling_state
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
		tool_tip = ms_tool_tip_kick
		name_text_script = musicstudio_get_drum_pad_text
		name_text_script_params = {
			Type = kick
		}
		choose_script = musicstudio_drumkit_customize_set_pad
		choose_params = {
			Type = kick
		}
		musicstudio_get_state = musicstudio_get_drum_kit_pad_scrolling_state
	}
	start = {
		name_text = qs(0x1821d84e)
		musicstudio_state = musicstudio_drum_kit_state
		choose_script = musicstudio_set_current_kit_to_custom
	}
	whammy = {
	}
}
musicstudio_effect_settings_state = {
	name_text = qs(0xf925618a)
	tool_tip = ms_tool_tip_bottom_effect
	num_tabs = 3
	init_script = musicstudio_init_line6_effects_menu
	green = {
		musicstudio_get_active = musicstudio_effect_select_get_active
		name_text_script = get_current_effect_name_text
		tool_tip = ms_tool_tip_effect_settings
		choose_script = musicstudio_set_gobal_effect_focus
		musicstudio_get_state = musicstudio_get_musicstudio_scrolling_effect_select_state
	}
	red = {
		name_text_script = get_current_effect_line_text
		tool_tip = ms_tool_tip_current_effect
		choose_script = change_current_effect
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
		name_text = qs(0x894e1bd6)
		musicstudio_get_state = musicstudio_get_effect_back_state
		choose_script = musicstudio_back_from_effect_menu
	}
	whammy = {
	}
}

script musicstudio_ghmix_mode_select_item_create 
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		desc = 'musicstudio_ghmix_popup_element'
		just = [left , top]
		pos_anchor = [left , top]
		dims = (350.0, 50.0)
		highlight_alpha = 1
		element_text = (<options>.name_text)
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript
musicstudio_popup_mode_select = {
	name_text = qs(0x48a351fa)
	options = [
		{
			text = qs(0x0d19b409)
			tool_tip = $ms_tool_tip_pause_song
			func = musicstudio_ghmix_song_mode
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0xe618e644)
			tool_tip = $ms_tool_tip_pause_save
			func = musicstudio_save
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0x67d9c56d)
			tool_tip = $ms_tool_tip_pause_quit
			func = musicstudio_sub_popup_save_confirmation
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}

script musicstudio_sub_popup_save_confirmation 
	destroy_dialog_box
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudiomenu_setpopupstate {
			id = <ghmix_menu>
			popup_state = musicstudio_popup_save_confirmation
			no_deinit
		}
	endif
endscript
musicstudio_popup_save_confirmation = {
	name_text = qs(0x48a351fa)
	options = [
		{
			text = qs(0xb2415b7d)
			tool_tip = $ms_tool_tip_pause_quit_and_save
			func = musicstudio_save_and_quit
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0xc4018c33)
			tool_tip = $ms_tool_tip_pause_quit_no_save
			func = musicstudio_quit_without_saving
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}
musicstudio_popup_clear_track = {
	name_text = qs(0xbbcf951c)
	options = [
		{
			text = qs(0xd2915c27)
			tool_tip = qs(0x03ab2b0f)
			func = musicstudio_delete_area_all_continue
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0x58e0a1fb)
			tool_tip = qs(0x03ab2b0f)
			func = musicstudio_delete_area_all
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}

script musicstudio_delete_area_all_continue 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getplayerindex
	if NOT musicstudio_mainobj :musicstudiohighway_issongview
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
				param = ghmix_menu}
			musicstudio_popup_remove id = <ghmix_menu> Player = <Player> prev_state = musicstudio_transport_state
		endif
	else
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
				param = ghmix_menu}
			musicstudio_popup_remove id = <ghmix_menu> Player = <Player> prev_state = ghmix_song_transport_state
		endif
	endif
endscript
musicstudio_popup_set_playable_all_lead = {
	name_text = qs(0x48a351fa)
	options = [
		{
			text = qs(0x58e0a1fb)
			tool_tip = qs(0x60db3208)
			func = musicstudio_menu_unused_button
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
		{
			text = qs(0xd2915c27)
			tool_tip = qs(0x60db3208)
			func = musicstudio_menu_unused_button
			sound_func = musicstudio_ghmix_menu_sound_choose
		}
	]
}
musicstudio_scrolling_marker_name_state = {
	name_text = qs(0x2b3c6f51)
	tool_tip = ms_tool_tip_scroll_marker
	num_tabs = 4
	choose_script = musicstudio_change_marker_name
	get_selected_script = musicstudio_get_selected_marker_name
	get_list_checksum_script = musicstudio_get_list_checksum_marker_name
	deinit_script = musicstudio_menu_unused_button
}
musicstudio_scrolling_marker_lightshow_state = {
	name_text = qs(0x2705b35c)
	tool_tip = ms_tool_tip_scroll_lightshow
	num_tabs = 4
	choose_script = musicstudio_change_marker_lightshow
	get_selected_script = musicstudio_get_selected_marker_lightshow
	get_list_checksum_script = musicstudio_get_list_checksum_marker_lightshow
	deinit_script = musicstudio_menu_unused_button
}
musicstudio_scrolling_sound_select_state = {
	name_text = qs(0x38f0d0d7)
	tool_tip = ms_tool_tip_scroll_sound
	num_tabs = 3
	choose_script = musicstudio_change_sound
	get_selected_script = musicstudio_get_selected_sound
	get_focusable_script = musicstudio_get_selected_sound_focusable
	get_list_checksum_script = musicstudio_get_list_checksum_sound
	deinit_script = musicstudio_change_sound_go_back
	yellow = {
		name_text = qs(0x135435ae)
		choose_script = musicstudio_preview_sound
	}
}
musicstudio_scrolling_sound_root_state = {
	name_text = qs(0x5fb50d91)
	tool_tip = ms_tool_tip_scroll_root
	num_tabs = 4
	init_script = musicstudio_show_edit_scale_reference
	choose_script = musicstudio_change_root
	focus_script = musicstudio_scale_root_focus
	go_back_script = musicstudio_scale_root_go_back
	get_selected_script = musicstudio_get_selected_root
	get_list_checksum_script = musicstudio_get_list_checksum_root
	deinit_script = musicstudio_menu_unused_button
	ghjam_pause_text = qs(0x1821d84e)
	yellow = {
		name_text = qs(0x6fae99a6)
		choose_script = musicstudio_audible_scale_preview
	}
}
musicstudio_scrolling_sound_scale_state = {
	name_text = qs(0x85db8570)
	tool_tip = ms_tool_tip_scroll_scale
	num_tabs = 4
	init_script = musicstudio_show_edit_scale_reference
	choose_script = musicstudio_change_scale
	focus_script = musicstudio_scale_type_focus
	go_back_script = musicstudio_scale_type_go_back
	get_selected_script = musicstudio_get_selected_scale
	get_list_checksum_script = musicstudio_get_list_checksum_scale
	deinit_script = musicstudio_menu_unused_button
	ghjam_pause_text = qs(0x1821d84e)
	yellow = {
		name_text = qs(0x6fae99a6)
		choose_script = musicstudio_audible_scale_preview
	}
}
musicstudio_scrolling_bend_set_state = {
	name_text = qs(0xa531d394)
	tool_tip = ms_tool_tip_scroll_bend
	num_tabs = 4
	init_script = musicstudio_show_edit_scale_reference
	choose_script = musicstudio_change_bend_set
	focus_script = musicstudio_menu_unused_button
	go_back_script = musicstudio_menu_unused_button
	get_selected_script = musicstudio_get_selected_bend_set
	get_list_checksum_script = musicstudio_get_list_checksum_bend_sets
	deinit_script = musicstudio_change_bend_set_deinit
	ghjam_pause_text = qs(0x1821d84e)
	yellow = {
		name_text = qs(0x49d7551a)
		choose_script = musicstudio_preview_bend_set
	}
}
musicstudio_scrolling_customize_scale_state = {
	name_text = qs(0xbcd28788)
	tool_tip = ms_tool_tip_scroll_custom_scale
	num_tabs = 3
	init_script = musicstudio_show_edit_scale_reference
	choose_script = musicstudio_customize_scale_choose_note
	focus_script = musicstudio_customize_scale_focus
	get_selected_script = musicstudio_get_selected_customize_scale
	get_list_checksum_script = musicstudio_get_list_checksum_buttons
	deinit_script = musicstudio_menu_unused_button
	musicstudio_scrolling_state = musicstudio_scrolling_customize_note_state
	yellow = {
		name_text = qs(0x6fae99a6)
		choose_script = musicstudio_audible_scale_preview
	}
}
musicstudio_scrolling_customize_note_state = {
	name_text = qs(0xbcd28788)
	tool_tip = ms_tool_tip_scroll_custom_scale
	num_tabs = 4
	choose_script = musicstudio_menu_unused_button
	focus_script = musicstudio_customize_note_focus
	get_selected_script = musicstudio_get_selected_note
	get_list_checksum_script = musicstudio_get_list_checksum_notes
	deinit_script = musicstudio_menu_unused_button
	musicstudio_scrolling_get_state = musicstudio_scrolling_customize_scale_get_state
	yellow = {
		name_text = qs(0x6fae99a6)
		choose_script = musicstudio_audible_scale_preview
	}
}
musicstudio_scrolling_customize_chord_state = {
	name_text = qs(0x9ebde63e)
	tool_tip = ms_tool_tip_scroll_custom_chord
	num_tabs = 4
	choose_script = musicstudio_menu_unused_button
	focus_script = musicstudio_customize_chord_focus
	get_selected_script = musicstudio_customize_chord_get_selected_chord
	get_list_checksum_script = musicstudio_get_list_checksum_chords
	deinit_script = musicstudio_menu_unused_button
	musicstudio_scrolling_state = musicstudio_scrolling_customize_scale_state
	yellow = {
		name_text = qs(0x6fae99a6)
		choose_script = musicstudio_audible_scale_preview
	}
}
musicstudio_scrolling_sound_select_dumkit_state = {
	name_text = qs(0x0cc57d1f)
	tool_tip = ms_tool_tip_scroll_drum_kit
	num_tabs = 4
	choose_script = musicstudio_change_drum_kit
	get_selected_script = musicstudio_get_selected_sound
	get_list_checksum_script = musicstudio_get_default_drum_kit_list_checksum
	deinit_script = musicstudio_change_drum_kit_go_back
	init_script = musicstudio_enter_drum_sub_menu
	yellow = {
		name_text = qs(0xf44cc1a8)
		choose_script = musicstudio_preview_drum_kit
	}
}
musicstudio_scrolling_sound_select_percussionkit_state = {
	name_text = qs(0xf8207f2c)
	tool_tip = ms_tool_tip_scroll_percussion_kit
	num_tabs = 4
	choose_script = musicstudio_change_drum_kit
	params = {
		percussion
	}
	get_selected_script = musicstudio_get_selected_sound
	get_list_checksum_script = musicstudio_get_percussion_kit_list_checksum_sound
	deinit_script = musicstudio_change_drum_kit_go_back
	init_script = musicstudio_enter_drum_sub_menu
	yellow = {
		name_text = qs(0x99520856)
		choose_script = musicstudio_preview_drum_kit
		params = {
			percussion
		}
	}
}
musicstudio_scrolling_select_dumkit_pad_state = {
	name_text = qs(0x43eeb58e)
	tool_tip = ms_tool_tip_scroll_drum_pad
	num_tabs = 5
	choose_script = musicstudio_change_drum_kit_pad
	get_selected_script = musicstudio_custom_kit_get_selected_pad
	get_list_checksum_script = musicstudio_get_drum_kit_list_checksum
	get_list_size_script = musicstudio_get_drum_kit_list_size_checksum
	init_script = musicstudio_per_pad_init
	deinit_script = musicstudio_per_pad_deinit
	yellow = {
		name_text = qs(0x1d8cce3c)
		choose_script = musicstudio_preview_drum_kit
		params = {
			per_pad
		}
	}
}
musicstudio_scrolling_select_percussionkit_pad_state = {
	name_text = qs(0x184f8ecc)
	tool_tip = ms_tool_tip_scroll_percussion_pad
	num_tabs = 5
	choose_script = musicstudio_change_drum_kit_pad
	get_selected_script = musicstudio_custom_kit_get_selected_pad
	get_list_checksum_script = musicstudio_get_drum_kit_list_checksum
	get_list_size_script = musicstudio_get_drum_kit_list_size_checksum
	init_script = musicstudio_per_pad_init
	deinit_script = musicstudio_per_pad_deinit
	yellow = {
		name_text = qs(0x0209205d)
		choose_script = musicstudio_preview_drum_kit
		params = {
			percussion
			per_pad
		}
	}
}

script musicstudio_effect_exit_effect_select 
	musicstudio_refresh_current_instrument_effect <...>
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	jam_stop_sound jam_instrument = <instrument>
	KillSpawnedScript \{Name = musicstudio_audible_scale_preview_spawn}
endscript

script musicstudio_get_musicstudio_scrolling_effect_select_state 
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		return \{musicstudio_scrolling_state = musicstudio_scrolling_effect_select_state_ghjam}
	else
		return \{musicstudio_scrolling_state = musicstudio_scrolling_effect_select_state}
	endif
endscript
musicstudio_scrolling_effect_select_state = {
	name_text = qs(0x0f319100)
	tool_tip = ms_tool_tip_scroll_sound
	num_tabs = 4
	choose_script = musicstudio_effect_select_choose
	get_selected_script = musicstudio_get_selected_effect
	get_list_checksum_script = musicstudio_get_effect_list_checksum
	focus_script = musicstudio_effect_focus
	deinit_script = musicstudio_effect_exit_effect_select
	ghjam_pause_text = qs(0x1821d84e)
	yellow = {
		name_text = qs(0xa9501e41)
		choose_script = musicstudio_preview_alternate_effect
	}
}
musicstudio_scrolling_effect_select_state_ghjam = {
	name_text = qs(0x0f319100)
	tool_tip = ms_tool_tip_scroll_sound
	num_tabs = 4
	choose_script = musicstudio_effect_select_choose
	get_selected_script = musicstudio_get_selected_effect
	get_list_checksum_script = musicstudio_get_effect_list_checksum
	focus_script = musicstudio_effect_focus
	deinit_script = musicstudio_effect_exit_effect_select
	ghjam_pause_text = qs(0x1821d84e)
}
musicstudio_scrolling_track_select_state = {
	name_text = qs(0x81bf948c)
	tool_tip = ms_tool_tip_scroll_track
	num_tabs = 1
	init_script = musicstudio_select_track_init
	deinit_script = musicstudio_select_track_deinit
	choose_script = musicstudio_menu_unused_button
	get_selected_script = musicstudio_select_track_get_selected
	get_list_checksum_script = musicstudio_get_list_checksum_tracks
	focus_script = musicstudio_select_track_focus
	musicstudio_state = musicstudio_transport_state
}
musicstudio_scrolling_preview_track_select_state = {
	name_text = qs(0x81bf948c)
	tool_tip = ms_tool_tip_scroll_track
	num_tabs = 1
	init_script = musicstudio_select_track_init
	deinit_script = musicstudio_select_track_deinit
	choose_script = musicstudio_menu_unused_button
	get_selected_script = musicstudio_select_track_get_selected
	get_list_checksum_script = musicstudio_get_list_checksum_tracks
	focus_script = musicstudio_select_track_focus
	musicstudio_state = musicstudio_preview_state
}
musicstudio_change_value_tempo = {
	name_text = qs(0x09b1d414)
	tool_tip = ms_tool_tip_scroll_tempo
	append_text = qs(0x8277cbd1)
	num_tabs = 3
	change_value_script = musicstudio_tempo_change_value
	up_down_script = musicstudio_tempo_deinit
	get_curr_value_script = musicstudio_tempo_get_curr_value
	get_value_bounds_script = musicstudio_tempo_get_value_bounds
	deinit_script = musicstudio_tempo_deinit_exit
	yellow = {
		name_text = qs(0xdcff4b8e)
		choose_script = musicstudio_tempo_preview
	}
	quick_change_value
}
musicstudio_change_value_volume = {
	name_text = qs(0x7aed003b)
	tool_tip = ms_tool_tip_scroll_volume
	append_text = qs(0x7aed003b)
	num_tabs = 3
	change_value_script = musicstudio_volume_change_value
	up_down_script = musicstudio_volume_up_down_script
	get_curr_value_script = musicstudio_volume_get_curr_value
	get_value_bounds_script = musicstudio_volume_get_value_bounds
	deinit_script = musicstudio_volume_deinit
	ghjam_pause_text = qs(0x1821d84e)
	yellow = {
		name_text = qs(0x91f33930)
		choose_script = musicstudio_volume_preview
	}
}
ghmix_warning_set_star_power_fail = qs(0x3464f632)
ghmix_warning_set_playable_fail = qs(0x2efa4406)
ghmix_warning_set_playable_fail_1 = qs(0x1db83b85)
ghmix_warning_set_playable_fail_2 = qs(0x78fe693b)
ghmix_warning_customize_scale_fail_1 = qs(0x5bf611eb)
ghmix_warning_scale_range_fail_1 = qs(0x4165a465)
ghmix_warning_set_loop_fail_1 = qs(0x1904929b)
ghmix_warning_closest_note_fail_1 = qs(0xfbc987c0)
ghmix_warning_clear_track = qs(0x36b57570)
ghmix_step_record_whammy_off_message = qs(0xdc948b92)
ghmix_step_record_whammy_on_message = qs(0x388dd0fc)
