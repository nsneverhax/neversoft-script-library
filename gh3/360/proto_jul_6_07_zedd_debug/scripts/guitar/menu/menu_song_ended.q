
script create_song_ended_menu player = 1
	if ismovieplaying textureslot = 1
		pausemovie textureslot = 1
	endif
	disable_pause
	menu_font = fontgrid_title_gh3
	menu_pos = (535.0, 474.0)
	completion = 0
	if ($player1_status.max_notes > 0)
		completion = (100 * $player1_status.total_notes / $player1_status.max_notes)
	endif
	casttointeger completion
	get_difficulty_text_upper difficulty = ($current_difficulty)
	get_song_title song = ($current_song)
	getuppercasestring <song_title>
	formattext textname = completion_text "%d" d = <completion>
	song_ended_off = (645.0, 177.0)
	song_name_off = (695.0, 460.0)
	z = 100.0
	offwhite = [223 223 223 255]
	new_menu scrollid = song_ended_scrolling_menu vmenuid = song_ended_vmenu use_backdrop = 0 spacing = -23 menu_pos = <menu_pos> exclusive_device = ($last_start_pressed_device)
	create_pause_menu_frame z = (<z> - 10)
	setscreenelementprops {
		id = song_ended_vmenu
		internal_just = [center center]
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = song_ended_static_text_container
		internal_just = [center center]
		pos = (0.0, 0.0)
		z_priority = 2
	}
	displaysprite parent = song_ended_static_text_container tex = dialog_title_bg flip_v pos = (416.0, 100.0) scale = (1.75, 1.75) z = <z>
	displaysprite parent = song_ended_static_text_container tex = dialog_title_bg pos = (640.0, 100.0) scale = (1.75, 1.75) z = <z>
	createscreenelement {
		type = textelement
		parent = song_ended_static_text_container
		font = <menu_font>
		text = "SONG ENDED"
		just = [center top]
		pos = {<song_ended_off> relative}
		rgba = [223 223 223 250]
		scale = (1.2, 1.3499999)
		z_priority = (<z> + 0.1)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		parent = song_ended_static_text_container
		id = 0x789f2e83
		font = <menu_font>
		just = [center bottom]
		text = <uppercasestring>
		pos = {<song_name_off> relative}
		rgba = [210 130 0 250]
		scale = 1
		z_priority = (<z> + 0.1)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		parent = song_ended_static_text_container
		id = 0xc54b0670
		font = <menu_font>
		just = [center bottom]
		text = <completion_text>
		pos = {<song_name_off> relative}
		rgba = [210 130 0 250]
		scale = 1
		z_priority = (<z> + 0.1)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle id = 0x789f2e83 dims = (400.0, 65.0) pos = (640.0, 370.0)
	displaytext font = <menu_font> parent = song_ended_static_text_container rgba = [210 130 0 250] pos = (420.0, 380.0) scale = (0.75, 0.9) text = "COMPLETED" z = (<z> + 0.1)
	fit_text_in_rectangle id = 0xc54b0670 dims = (80.0, 60.0) pos = (630.0, 430.0)
	displaytext font = <menu_font> parent = song_ended_static_text_container rgba = [210 130 0 250] pos = (670.0, 365.0) scale = (1.0, 1.0) text = "%" z = (<z> + 0.1)
	displaytext font = <menu_font> parent = song_ended_static_text_container rgba = [210 130 0 250] pos = (710.0, 380.0) scale = (0.8, 0.9) text = "ON" z = (<z> + 0.1)
	formattext textname = diff_text "%s" s = <difficulty_text>
	displaytext id = 0xeb4a4cbf font = <menu_font> parent = song_ended_static_text_container rgba = [210 130 0 250] scale = (1.0, 1.0) text = <diff_text> z = (<z> + 0.1)
	fit_text_in_rectangle id = 0xeb4a4cbf dims = (110.0, 60.0) pos = (755.0, 370.0)
	change menu_focus_color = [180 50 50 255]
	change menu_unfocus_color = [0 0 0 255]
	text_scale = (0.9, 1.0)
	displaysprite parent = song_ended_static_text_container tex = white pos = (492.0, 517.0) scale = (75.0, 6.0) z = (<z> + 0.1) rgba = <offwhite>
	displaysprite parent = song_ended_static_text_container tex = dialog_frame_joiner pos = (480.0, 510.0) rot_angle = 5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite parent = song_ended_static_text_container tex = dialog_frame_joiner pos = (750.0, 514.0) flip_v rot_angle = -5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite id = hi_right parent = song_ended_static_text_container tex = dialog_highlight pos = (770.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	displaysprite id = hi_left parent = song_ended_static_text_container tex = dialog_highlight flip_v pos = (500.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	displaysprite parent = song_ended_static_text_container tex = dialog_bg pos = (480.0, 450.0) scale = (1.25, 1.25) z = <z>
	displaysprite parent = song_ended_static_text_container tex = dialog_bg flip_h pos = (480.0, 530.0) scale = (1.25, 1.25) z = <z>
	createscreenelement {
		type = textelement
		parent = song_ended_vmenu
		font = <menu_font>
		text = "RETRY SONG"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus menu_se_retry_highlight_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose song_ended_menu_select_retry_song}
		]
	}
	createscreenelement {
		type = textelement
		parent = song_ended_vmenu
		font = <menu_font>
		text = "NEW SONG"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus menu_se_newsong_highlight_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose song_ended_menu_select_new_song params = {player = <player>}}
		]
	}
	createscreenelement {
		type = textelement
		parent = song_ended_vmenu
		font = <menu_font>
		text = "QUIT"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus menu_se_quit_highlight_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose song_ended_menu_select_quit}
		]
	}
endscript

script destroy_song_ended_menu 
	if ismovieplaying \{textureslot = 1}
		resumemovie \{textureslot = 1}
	endif
	enable_pause
	destroy_menu \{menu_id = song_ended_scrolling_menu}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = song_ended_static_text_container}
endscript

script song_ended_menu_select_retry_song 
	ui_flow_manager_respond_to_action \{action = select_retry}
	restart_song
endscript

script song_ended_menu_select_new_song 
	if gotparam \{player}
		ui_flow_manager_respond_to_action action = select_new_song create_params = {player = <player>}
	else
		ui_flow_manager_respond_to_action \{action = select_new_song}
	endif
endscript

script song_ended_menu_select_quit 
	ui_flow_manager_respond_to_action \{action = select_quit}
endscript

script menu_se_retry_highlight_focus 
	retail_menu_focus
	setscreenelementprops \{id = hi_left
		pos = (470.0, 480.0)
		flip_v}
	setscreenelementprops \{id = hi_right
		pos = (750.0, 480.0)}
endscript

script menu_se_newsong_highlight_focus 
	retail_menu_focus
	setscreenelementprops \{id = hi_left
		pos = (485.0, 515.0)
		flip_v}
	setscreenelementprops \{id = hi_right
		pos = (735.0, 515.0)}
endscript

script menu_se_quit_highlight_focus 
	retail_menu_focus
	setscreenelementprops \{id = hi_left
		pos = (535.0, 555.0)
		flip_v}
	setscreenelementprops \{id = hi_right
		pos = (680.0, 555.0)}
endscript
