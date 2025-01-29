notetracker_main_menu_state = {
	name_text = qs(0xce8d9fe9)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 1
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 0
	}
	green = {
		name_text = qs(0x0b3b9a25)
		tool_tip = qs(0x6dfe0ef8)
		musicstudio_state = notetracker_selection_state
	}
	red = {
		name_text = qs(0x3fc15f39)
		tool_tip = qs(0x5ebbeee4)
		musicstudio_state = notetracker_quickedit_state
	}
	yellow = {
		name_text = qs(0x24941c1a)
		tool_tip = qs(0xea5d3153)
		musicstudio_state = notetracker_select_paste_state
	}
	blue = {
		name_text = qs(0xb16b2822)
		tool_tip = qs(0x601a02b5)
		musicstudio_state = notetracker_gameedit_state
	}
	orange = {
		name_text = qs(0x82f03531)
		tool_tip = qs(0xc200ea17)
		musicstudio_state = notetracker_quickplay_menu_state
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
		musicstudio_popup_state = 0xbaaf9a76
	}
	start = {
		name_text = qs(0x46f2d221)
		tool_tip = qs(0x8979ad29)
		choose_script = notetracker_playback
		musicstudio_state = notetracker_main_menu_play_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_main_menu_play_state = {
	name_text = qs(0x6eaaa70d)
	tool_tip = qs(0xc0b86cd1)
	num_tabs = 1
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 10
	}
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
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x89690c76)
		choose_script = notetracker_playback_stop
		musicstudio_state = notetracker_main_menu_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}

script 0xfa6351c0 
	musicstudio_save \{from_notetracker = 1}
endscript

script 0x09fb89f7 
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
	jam_publish_update_playback_drumvocal_track
	setsonginfo \{streamfile = $jam_notetracker_mp3}
	setsonginfo usecdn = ($jam_notetracker_usecdn)
	jam_save_song_setup \{from_notetracker = 1
		no_menu}
	jamname = ($jam_notetracker_mp3)
	if stringcontains text = ($jam_notetracker_mp3) substring = '.fsb'
		stringremove text = <jamname> remove = '.fsb' new_string = stemname
	else
		stringremove text = <jamname> remove = '.mp3' new_string = stemname
	endif
	if ($jam_notetracker_usecdn)
		formatText TextName = FileName 'notetracker/%s.jam' s = <stemname>
	else
		formatText TextName = FileName '%s.jam' s = <stemname>
	endif
	printf qs(0xd9833d60) s = <FileName>
	savejamsessiontofile jamname = <FileName>
	formatText TextName = 0xc3430017 'Saved %s.jam' s = <stemname>
	0xff58e205 string = <0xc3430017>
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_popup
			param = ghmix_popup}
		<ghmix_popup> :se_setprops tool_tip_text = <utf16string>
	endif
endscript

script 0x3f0440e1 
endscript
0x772039b8 = qs(0x03ac90f0)

script 0xd93846c8 
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		desc = 'musicstudio_notetracker_file_popup_element'
		just = [left , top]
		pos_anchor = [left , top]
		dims = (350.0, 50.0)
		highlight_alpha = 1
		element_text = (<options>.name_text)
		value_text = (<options>.value_text)
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript
0xc25c13e5 = {
	options = [
		{
			name_text = qs(0x17da7403)
			value_text = $0x772039b8
			tool_tip = qs(0xfedc5a19)
			choose_script = 0x3f0440e1
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0xce9c9f9a)
			value_text = qs(0x93fd906f)
			tool_tip = qs(0x403f03f5)
			choose_script = musicstudio_ghmix_song_mode
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0x0dbfcab9)
			value_text = qs(0x086e46a7)
			tool_tip = qs(0x3f0b1a5c)
			choose_script = 0x3f0440e1
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0xfcc6ced9)
			value_text = qs(0x3f1bbbb1)
			tool_tip = qs(0x08f87e97)
			choose_script = 0x3f0440e1
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0x7702814b)
			value_text = qs(0x03ac90f0)
			tool_tip = qs(0x638df3ff)
			choose_script = 0xfa6351c0
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0xfd24bd4e)
			value_text = qs(0x03ac90f0)
			tool_tip = qs(0xe890e3ce)
			choose_script = 0x09fb89f7
			create_script = 0xd93846c8
		}
	]
}

script 0x660a9629 
	0xff58e205 \{string = $jam_notetracker_mp3}
	Change 0x772039b8 = <utf16string>
endscript
0xbaaf9a76 = {
	options = [
		{
			name_text = qs(0x0a59a215)
			tool_tip = qs(0x2360a8cf)
			choose_script = musicstudio_menu_unused_button
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0xd3363cbc)
			tool_tip = qs(0x2ea8d1e9)
			choose_script = 0x660a9629
			musicstudio_popup_state = 0x3e158d51
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0x3babc0b5)
			tool_tip = qs(0x0bc56ca8)
			choose_script = 0x660a9629
			musicstudio_popup_state = 0xc25c13e5
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0xf6c3a262)
			tool_tip = qs(0xf6c3a262)
			choose_script = generic_event_back
			create_script = 0xd93846c8
		}
	]
}
notetracker_selection_state = {
	name_text = qs(0xcb127764)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 2
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 1
	}
	deinit_script = notetracker_deinit_song_mode
	green = {
		name_text = qs(0x71fabb68)
		tool_tip = qs(0x3535e3ba)
		musicstudio_state = 0x2d9f3e3b
	}
	red = {
		name_text = qs(0x92d19a76)
		tool_tip = qs(0xa7b3f0d7)
		choose_script = musicstudio_notetracker_toggle_strum
	}
	yellow = {
		name_text = qs(0x2fb80d18)
		tool_tip = qs(0xa47746d8)
		musicstudio_state = 0x79fe5ddf
	}
	blue = {
		name_text = qs(0x74c8ec05)
		tool_tip = qs(0x6effc8b8)
		choose_script = musicstudio_notetracker_cycle_instrument
	}
	orange = {
		name_text = qs(0x7e666e59)
		tool_tip = qs(0xb0c40300)
		choose_script = musicstudio_notetracker_toggle_click
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
		name_text = qs(0xb85a48cb)
		musicstudio_state = notetracker_main_menu_state
	}
	start = {
		name_text = qs(0x31dbe920)
		tool_tip = qs(0x8979ad29)
		choose_script = notetracker_playback
		musicstudio_state = notetracker_selection_state_play_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_selection_state_play_state = {
	name_text = qs(0x6eaaa70d)
	tool_tip = qs(0xc0b86cd1)
	num_tabs = 1
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 11
	}
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
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x89690c76)
		choose_script = notetracker_playback_stop
		musicstudio_state = notetracker_selection_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
0x05d00e3c = {
	name_text = qs(0x5f5f5afb)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 2
	yellow = {
		name_text = qs(0x92d19a76)
		tool_tip = qs(0xa7b3f0d7)
		choose_script = musicstudio_notetracker_toggle_strum
	}
	blue = {
		name_text = qs(0x9654a86b)
		tool_tip = qs(0x1be7e931)
		choose_script = musicstudio_notetracker_change_record_mode
	}
}
0x2d9f3e3b = {
	name_text = qs(0x5d1324a1)
	tool_tip = qs(0x7c535eaa)
	num_tabs = 3
	init_script = notetracker_select_area_init
	deinit_script = notetracker_select_area_deinit
	green = {
		name_text = qs(0xd6e54110)
		choose_script = notetracker_copy_area_and_return
	}
	red = {
		name_text = qs(0x5b3198a1)
		choose_script = notetracker_copy_area_and_return
		choose_params = {
			all
		}
	}
	yellow = {
		choose_script = musicstudio_menu_unused_button
	}
	blue = {
	}
	orange = {
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0x3f6e1848)
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
		choose_script = notetracker_return_to_previous_menu
	}
	start = {
	}
	whammy = {
		name_text = qs(0x4d586b9b)
	}
}
notetracker_quickedit_state = {
	name_text = qs(0xa78c5761)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 2
	init_script = musicstudio_notetracker_mode_change_and_quickedit_init
	init_params = {
		from_menu = 2
	}
	deinit_script = notetracker_quickedit_deinit
	green = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = green
			pad = X
		}
	}
	red = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = red
			pad = circle
		}
	}
	yellow = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = yellow
			pad = Triangle
		}
	}
	blue = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = blue
			pad = Square
		}
	}
	orange = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = orange
			pad = L1
		}
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_quickedit_skip_forward
	}
	down = {
		choose_script = notetracker_quickedit_skip_backward
	}
	back = {
		name_text = qs(0x8f6e49c4)
		musicstudio_state = notetracker_main_menu_state
	}
	start = {
		name_text = qs(0x979c1e1e)
		tool_tip = qs(0xaa287dae)
		musicstudio_state = notetracker_live_record_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_gameedit_state = {
	name_text = qs(0xaa7b588d)
	tool_tip = qs(0x117bcbf3)
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 4
	}
	num_tabs = 2
	green = {
		name_text = qs(0x29844f9a)
		tool_tip = qs(0xd3530793)
		choose_script = musicstudio_menu_unused_button
	}
	red = {
		name_text = qs(0x1a6924a3)
		tool_tip = qs(0x03ac90f0)
		musicstudio_state = 0x0f9bba60
	}
	yellow = {
		name_text = qs(0x570c5aa3)
		tool_tip = qs(0x03ac90f0)
		musicstudio_state = 0xd2832a6b
	}
	blue = {
		name_text = qs(0xadb5349c)
		tool_tip = qs(0x03ac90f0)
		choose_script = musicstudio_menu_unused_button
	}
	orange = {
		name_text = qs(0xcc7cce71)
		tool_tip = qs(0x03ac90f0)
		choose_script = musicstudio_menu_unused_button
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
		musicstudio_state = notetracker_main_menu_state
	}
	start = {
		name_text = qs(0x1b422c1b)
		tool_tip = qs(0x8979ad29)
		choose_script = notetracker_playback
		musicstudio_state = notetracker_gameedit_menu_play_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
0x0f9bba60 = {
	name_text = qs(0x1a6924a3)
	tool_tip = qs(0x117bcbf3)
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 14
	}
	num_tabs = 3
	green = {
		name_text = qs(0xf2a494d9)
		tool_tip = qs(0x42661f8e)
		choose_script = notetracker_selection_area_set_star_power
	}
	red = {
		name_text = qs(0xf509588f)
		tool_tip = qs(0x15566b00)
		choose_script = notetracker_selection_area_clear_star_power
	}
	yellow = {
	}
	blue = {
	}
	orange = {
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
		musicstudio_state = notetracker_gameedit_state
	}
	start = {
		name_text = qs(0x1b422c1b)
		tool_tip = qs(0x8979ad29)
		choose_script = notetracker_playback
		musicstudio_state = notetracker_gameedit_menu_play_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
0xd2832a6b = {
	name_text = qs(0x6ff5fab8)
	tool_tip = qs(0x117bcbf3)
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 14
	}
	num_tabs = 3
	green = {
		name_text = qs(0x6161f4b5)
		tool_tip = qs(0x36dccab7)
		choose_script = notetracker_hopo_edit_select_note
		choose_params = {
			button = green
		}
	}
	red = {
		name_text = qs(0x6161f4b5)
		tool_tip = qs(0x36dccab7)
		choose_script = notetracker_hopo_edit_select_note
		choose_params = {
			button = red
		}
	}
	yellow = {
		name_text = qs(0x6161f4b5)
		tool_tip = qs(0x15566b00)
		choose_script = notetracker_hopo_edit_select_note
		choose_params = {
			button = yellow
		}
	}
	blue = {
		name_text = qs(0x6161f4b5)
		tool_tip = qs(0x15566b00)
		choose_script = notetracker_hopo_edit_select_note
		choose_params = {
			button = blue
		}
	}
	orange = {
		name_text = qs(0x6161f4b5)
		tool_tip = qs(0x15566b00)
		choose_script = notetracker_hopo_edit_select_note
		choose_params = {
			button = orange
		}
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_hopo_edit_skip_forward
	}
	down = {
		choose_script = notetracker_hopo_edit_skip_backward
	}
	back = {
		musicstudio_state = notetracker_gameedit_state
	}
	start = {
		name_text = qs(0x1b422c1b)
		tool_tip = qs(0x8979ad29)
		choose_script = notetracker_playback
		musicstudio_state = notetracker_gameedit_menu_play_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_gameedit_menu_play_state = {
	name_text = qs(0x6eaaa70d)
	tool_tip = qs(0xc0b86cd1)
	num_tabs = 1
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 14
	}
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
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x89690c76)
		choose_script = notetracker_playback_stop
		musicstudio_state = notetracker_gameedit_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_quickplay_menu_state = {
	name_text = qs(0xa242c076)
	tool_tip = qs(0x117bcbf3)
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 5
	}
	num_tabs = 2
	green = {
		name_text = qs(0x4b002275)
		tool_tip = qs(0x2be5cd53)
		choose_script = 0x4ccdabaf
	}
	red = {
		name_text = qs(0x0d0caf9f)
		tool_tip = qs(0xe9943cd7)
		choose_script = musicstudio_menu_unused_button
	}
	yellow = {
		name_text = qs(0xa8ebfa01)
		tool_tip = qs(0x10f6c62b)
		choose_script = musicstudio_menu_unused_button
	}
	blue = {
	}
	orange = {
	}
	right = {
	}
	left = {
	}
	up = {
	}
	down = {
	}
	back = {
		musicstudio_state = notetracker_main_menu_state
	}
	start = {
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
0x3e158d51 = {
	options = [
		{
			name_text = qs(0x4b002275)
			tool_tip = qs(0x2be5cd53)
			choose_script = 0x4ccdabaf
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0x0d0caf9f)
			tool_tip = qs(0xb75e7c89)
			choose_script = musicstudio_menu_unused_button
			create_script = 0xd93846c8
		}
		{
			name_text = qs(0xa8ebfa01)
			tool_tip = qs(0x10f6c62b)
			choose_script = musicstudio_menu_unused_button
			create_script = 0xd93846c8
		}
	]
}
0x89d66397 = {
	name_text = qs(0x6eaaa70d)
	tool_tip = qs(0xc0b86cd1)
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
	right = {
	}
	left = {
	}
	up = {
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x89690c76)
		choose_script = notetracker_playback_stop
		musicstudio_state = 0x0c2d3be3
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_live_record_state = {
	name_text = qs(0x979c1e1e)
	tool_tip = qs(0x377899a3)
	num_tabs = 2
	init_script = musicstudio_notetracker_mode_change_and_live_record
	init_params = {
		from_menu = 12
	}
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
	right = {
	}
	left = {
	}
	up = {
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0xaf0a1e84)
		musicstudio_state = musicstudio_state_jump_back
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_quickedit_taildrag_state = {
	name_text = qs(0xbb532d0c)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 3
	init_script = notetracker_quickedit_hold_sustain
	deinit_script = notetracker_quickedit_hold_sustain_deinit
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
	right = {
	}
	left = {
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_quickedit_taildrag_skip_forward
	}
	down = {
		choose_script = notetracker_quickedit_taildrag_skip_backward
	}
	back = {
	}
	start = {
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_quickedit_taildrag_vocal_state = {
	name_text = qs(0xbb532d0c)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 3
	init_script = notetracker_quickedit_hold_sustain
	deinit_script = notetracker_quickedit_hold_sustain_deinit
	green = {
		name_text = qs(0xef5a7ca0)
	}
	red = {
	}
	yellow = {
	}
	blue = {
	}
	orange = {
	}
	right = {
	}
	left = {
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_quickedit_taildrag_skip_forward
	}
	down = {
		choose_script = notetracker_quickedit_taildrag_skip_backward
	}
	back = {
	}
	start = {
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_quickedit_lyric = {
	name_text = qs(0xf7b65dc1)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 3
	init_script = notetracker_quickedit_lyric_init
	deinit_script = notetracker_quickedit_lyric_deinit
	green = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = green
			pad = X
		}
	}
	red = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = red
			pad = circle
		}
	}
	yellow = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = yellow
			pad = Triangle
		}
	}
	blue = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = blue
			pad = Square
		}
	}
	orange = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = orange
			pad = L1
		}
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_quickedit_skip_forward
	}
	down = {
		choose_script = notetracker_quickedit_skip_backward
	}
	back = {
		musicstudio_state = notetracker_quickedit_state
	}
	start = {
		name_text = qs(0x979c1e1e)
		tool_tip = qs(0xaa287dae)
		musicstudio_state = notetracker_live_record_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_quickedit_pitch = {
	name_text = qs(0xaa95fcef)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 3
	init_script = notetracker_quickedit_pitch_init
	deinit_script = notetracker_quickedit_pitch_deinit
	green = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = green
			pad = X
		}
	}
	red = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = red
			pad = circle
		}
	}
	yellow = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = yellow
			pad = Triangle
		}
	}
	blue = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = blue
			pad = Square
		}
	}
	orange = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = orange
			pad = L1
		}
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_quickedit_skip_forward
	}
	down = {
		choose_script = notetracker_quickedit_skip_backward
	}
	back = {
		musicstudio_state = notetracker_quickedit_state
	}
	start = {
		name_text = qs(0x979c1e1e)
		tool_tip = qs(0xaa287dae)
		musicstudio_state = notetracker_live_record_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_quickedit_settings = {
	name_text = qs(0xae5fe95e)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 3
	init_script = notetracker_quickedit_settings_init
	deinit_script = notetracker_quickedit_settings_deinit
	green = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = green
			pad = X
		}
	}
	red = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = red
			pad = circle
		}
	}
	yellow = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = yellow
			pad = Triangle
		}
	}
	blue = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = blue
			pad = Square
		}
	}
	orange = {
		choose_script = notetracker_quickedit_select_note
		choose_params = {
			button = orange
			pad = L1
		}
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_quickedit_skip_forward
	}
	down = {
		choose_script = notetracker_quickedit_skip_backward
	}
	back = {
		musicstudio_state = notetracker_quickedit_state
	}
	start = {
		name_text = qs(0x979c1e1e)
		tool_tip = qs(0xaa287dae)
		musicstudio_state = notetracker_live_record_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_quickedit_vocal_keyboard = {
	name_text = qs(0xff43d7be)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 3
	init_script = notetracker_quickedit_vocal_keyboard_init
	deinit_script = notetracker_quickedit_vocal_keyboard_deinit
	green = {
		choose_script = notetracker_quickedit_vocal_keyboard_select_note
		choose_params = {
			button = green
			pad = X
		}
	}
	red = {
		choose_script = notetracker_quickedit_vocal_keyboard_select_note
		choose_params = {
			button = red
			pad = circle
		}
	}
	yellow = {
		choose_script = notetracker_quickedit_vocal_keyboard_select_note
		choose_params = {
			button = yellow
			pad = Triangle
		}
	}
	blue = {
		choose_script = notetracker_quickedit_vocal_keyboard_select_note
		choose_params = {
			button = blue
			pad = Square
		}
	}
	orange = {
		choose_script = notetracker_quickedit_vocal_keyboard_select_note
		choose_params = {
			button = orange
			pad = L1
		}
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0xb86709a3)
		choose_script = notetracker_quickedit_vocal_keyboard_skip_forward
	}
	down = {
		choose_script = notetracker_quickedit_vocal_keyboard_skip_backward
	}
	back = {
		musicstudio_state = notetracker_quickedit_pitch
	}
	start = {
		name_text = qs(0x979c1e1e)
		tool_tip = qs(0xaa287dae)
		musicstudio_state = notetracker_live_record_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_select_paste_state = {
	name_text = qs(0x5d1324a1)
	tool_tip = qs(0x7c535eaa)
	num_tabs = 3
	init_script = musicstudio_notetracker_mode_change_and_select_area_init_no_reset
	init_params = {
		from_menu = 3
	}
	green = {
		name_text = qs(0x7de8cbbf)
		choose_script = notetracker_select_area_deinit_reset
		musicstudio_state = 0x2d9f3e3b
	}
	red = {
		name_text = qs(0xed26f5ec)
		choose_script = notetracker_paste_selection
	}
	yellow = {
		name_text = qs(0xefd656a6)
		musicstudio_state = 0xb465f32e
	}
	blue = {
		name_text = qs(0xe7600442)
		choose_script = notetracker_delete_selection
	}
	orange = {
		name_text = qs(0x206e05b7)
		choose_script = notetracker_evenly_space_selection
	}
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		name_text = qs(0x70382e8a)
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
		musicstudio_state = notetracker_main_menu_state
	}
	start = {
		name_text = qs(0x1b422c1b)
		tool_tip = qs(0x8979ad29)
		choose_script = notetracker_playback
		musicstudio_state = notetracker_select_paste_menu_play_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
notetracker_select_paste_menu_play_state = {
	name_text = qs(0x6eaaa70d)
	tool_tip = qs(0xc0b86cd1)
	init_script = musicstudio_notetracker_mode_change
	init_params = {
		from_menu = 13
	}
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
	right = {
		name_text = qs(0x924a09c4)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0xac2c3b87
			pad = right
		}
	}
	left = {
		name_text = qs(0x2b92c6e7)
		choose_script = notetracker_jump_to_menu
		choose_params = {
			musicstudio_state_now = 0x3fb23911
			pad = left
		}
	}
	up = {
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
	}
	start = {
		name_text = qs(0x89690c76)
		choose_script = notetracker_playback_stop
		musicstudio_state = notetracker_select_paste_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
0x79fe5ddf = {
	name_text = qs(0xb78f690d)
	tool_tip = qs(0xb78f690d)
	num_tabs = 1
	green = {
		name_text = qs(0x47591cb2)
		tool_tip = qs(0xe76bb38c)
		choose_script = notetracker_zoom_song
		choose_params = {
			zoom_in
		}
	}
	red = {
		name_text = qs(0xd8e0585d)
		tool_tip = qs(0xdf4c5d6b)
		choose_script = notetracker_zoom_song
		choose_params = {
			zoom_out
		}
	}
	yellow = {
		name_text = qs(0xb9d88662)
		tool_tip = qs(0xebb68f46)
		choose_script = notetracker_zoom_song
	}
	blue = {
	}
	orange = {
	}
	right = {
	}
	left = {
	}
	up = {
		choose_script = notetracker_skip_forward
	}
	down = {
		choose_script = notetracker_skip_backward
	}
	back = {
		musicstudio_state = notetracker_selection_state
	}
	start = {
		name_text = qs(0x89690c76)
		choose_script = notetracker_playback_stop
		musicstudio_state = notetracker_select_paste_state
	}
	whammy = {
		name_text = qs(0x9a62e647)
	}
}
0x3fb23911 = {
	name_text = qs(0x590f121e)
	tool_tip = qs(0x9ee25a97)
	num_tabs = 5
	green = {
		name_text = qs(0x89492745)
		tool_tip = qs(0x03ac90f0)
		choose_script = musicstudio_notetracker_change_speed
		choose_params = {
			nt_speed_change = 0.2
		}
	}
	red = {
		name_text = qs(0x24fa0680)
		tool_tip = qs(0x03ac90f0)
		choose_script = musicstudio_notetracker_change_speed
		choose_params = {
			nt_speed_change = -0.2
		}
	}
	yellow = {
		name_text = qs(0xc7fb6e7c)
		tool_tip = qs(0xb365857a)
		choose_script = notetracker_play_mode_toggle
	}
	blue = {
		name_text = qs(0x8720b75e)
		tool_tip = qs(0x8a23ac5f)
		choose_script = notetracker_vocal_volume_toggle
	}
	orange = {
	}
	right = {
	}
	left = {
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
0xac2c3b87 = {
	name_text = qs(0x924a09c4)
	tool_tip = qs(0x9ee25a97)
	num_tabs = 5
	green = {
		name_text = qs(0xd8e0585d)
		tool_tip = qs(0x03ac90f0)
		choose_script = notetracker_zoom_song
		choose_params = {
			cycle_up
		}
	}
	red = {
		name_text = qs(0x47591cb2)
		tool_tip = qs(0xe76bb38c)
		choose_script = notetracker_zoom_song
		choose_params = {
			cycle_down
		}
	}
	yellow = {
		name_text = qs(0xb9d88662)
		tool_tip = qs(0xe76bb38c)
		choose_script = notetracker_zoom_song
		choose_params = {
			reset
		}
	}
	blue = {
		name_text = qs(0x073b8589)
		tool_tip = qs(0x11d90978)
		choose_script = musicstudio_notetracker_toggle_skip_by_note
	}
	orange = {
		name_text = qs(0x4ca89a2b)
		tool_tip = qs(0x42866896)
		choose_script = musicstudio_notetracker_vocal_instrument_cycle
	}
	right = {
	}
	left = {
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
notetracker_changepitch_quick_state = {
	name_text = qs(0x3e268f43)
	tool_tip = qs(0x9ee25a97)
	num_tabs = 5
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
	right = {
	}
	left = {
	}
	up = {
		name_text = qs(0x3873a5e4)
		choose_script = notetracker_quickedit_autorepeat
		choose_params = {
			action_script = 0xa4e3ebf2
			action_params = {
				action = pitchup
			}
		}
	}
	down = {
		choose_script = notetracker_quickedit_autorepeat
		choose_params = {
			action_script = 0xa4e3ebf2
			action_params = {
				action = pitchdown
			}
		}
	}
	back = {
	}
	start = {
	}
	whammy = {
	}
}
notetracker_changechar_quick_state = {
	name_text = qs(0x58144d31)
	tool_tip = qs(0x9ee25a97)
	num_tabs = 5
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
	right = {
	}
	left = {
	}
	up = {
		name_text = qs(0xce720cdb)
		choose_script = notetracker_quickedit_autorepeat
		choose_params = {
			action_script = 0xa4e3ebf2
			action_params = {
				action = addchar
			}
		}
	}
	down = {
		choose_script = notetracker_quickedit_autorepeat
		choose_params = {
			action_script = 0xa4e3ebf2
			action_params = {
				action = removechar
			}
		}
	}
	back = {
	}
	start = {
	}
	whammy = {
	}
}
0xb465f32e = {
	name_text = qs(0x993388a1)
	tool_tip = qs(0x117bcbf3)
	num_tabs = 3
	green = {
		name_text = qs(0x4111d841)
		tool_tip = qs(0x6a6d6c9f)
		choose_script = notetracker_transpose_selection
		choose_params = {
			direction = up
		}
	}
	red = {
		name_text = qs(0xbd375631)
		tool_tip = qs(0x4f524768)
		choose_script = notetracker_transpose_selection
		choose_params = {
			direction = down
		}
	}
	yellow = {
		name_text = qs(0x03ac90f0)
		tool_tip = qs(0x03ac90f0)
		choose_script = musicstudio_menu_unused_button
	}
	blue = {
		name_text = qs(0x03ac90f0)
		tool_tip = qs(0x03ac90f0)
		choose_script = musicstudio_menu_unused_button
	}
	orange = {
		name_text = qs(0x03ac90f0)
		tool_tip = qs(0x03ac90f0)
		choose_script = musicstudio_menu_unused_button
	}
	right = {
		name_text = qs(0x03ac90f0)
		tool_tip = qs(0x03ac90f0)
		choose_script = musicstudio_menu_unused_button
	}
	left = {
		name_text = qs(0x03ac90f0)
		tool_tip = qs(0x03ac90f0)
		choose_script = musicstudio_menu_unused_button
	}
	up = {
		choose_script = notetracker_move_selection
		choose_params = {
			direction = up
		}
	}
	down = {
		choose_script = notetracker_move_selection
		choose_params = {
			direction = down
		}
	}
	back = {
		musicstudio_state = notetracker_select_paste_state
	}
	start = {
		name_text = qs(0x1b422c1b)
		tool_tip = qs(0x8979ad29)
		choose_script = notetracker_playback
		musicstudio_state = notetracker_select_paste_menu_play_state
	}
	whammy = {
	}
}
