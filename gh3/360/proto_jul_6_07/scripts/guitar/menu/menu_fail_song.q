
script create_fail_song_menu 
	menu_font = fontgrid_title_gh3
	menu_pos = (535.0, 474.0)
	completion = 0
	get_song_end_time song = ($player1_status.current_song_gem_array)
	if ($current_num_players = 2)
		0xb7bd0adc = <total_end_time>
		get_song_end_time song = ($player2_status.current_song_gem_array)
		if (<0xb7bd0adc> > <total_end_time>)
			total_end_time = <0xb7bd0adc>
		endif
	endif
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
	endif
	casttointeger completion
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		if ($is_demo_mode = 1)
			<menu_pos> = (534.0, 430.0)
		else
			<menu_pos> = (534.0, 455.0)
		endif
	endif
	get_difficulty_text_upper difficulty = ($current_difficulty)
	get_song_title song = ($current_song)
	getuppercasestring <song_title>
	formattext textname = completion_text "%d" d = <completion>
	song_failed_off = (645.0, 177.0)
	song_name_off = (695.0, 460.0)
	z = 100.0
	offwhite = [223 223 223 255]
	new_menu scrollid = fail_song_scrolling_menu vmenuid = fail_song_vmenu_id use_backdrop = 0 spacing = -23 menu_pos = <menu_pos>
	create_pause_menu_frame z = (<z> - 10)
	setscreenelementprops {
		id = fail_song_vmenu_id
		internal_just = [center center]
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = fail_song_static_text_container
		internal_just = [center center]
		pos = (0.0, 0.0)
		z_priority = 2
	}
	displaysprite parent = fail_song_static_text_container tex = dialog_title_bg flip_v pos = (416.0, 100.0) scale = (1.75, 1.75) z = <z>
	displaysprite parent = fail_song_static_text_container tex = dialog_title_bg pos = (640.0, 100.0) scale = (1.75, 1.75) z = <z>
	createscreenelement {
		type = textelement
		parent = fail_song_static_text_container
		font = <menu_font>
		text = "SONG FAILED"
		just = [center top]
		pos = {<song_failed_off> relative}
		rgba = [223 223 223 250]
		scale = (1.2, 1.3499999)
		z_priority = (<z> + 0.1)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		parent = fail_song_static_text_container
		id = fail_song_song_name
		font = <menu_font>
		just = [center bottom]
		text = <uppercasestring>
		pos = {<song_name_off> relative}
		rgba = [210 130 0 250]
		scale = 1
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<z> + 0.1)
	}
	createscreenelement {
		type = textelement
		parent = fail_song_static_text_container
		id = 0x40a3ba40
		font = <menu_font>
		just = [center bottom]
		text = <completion_text>
		pos = {<song_name_off> relative}
		rgba = [210 130 0 250]
		scale = 1
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<z> + 0.1)
	}
	fit_text_in_rectangle id = fail_song_song_name dims = (400.0, 65.0) pos = (640.0, 370.0)
	displaytext font = <menu_font> parent = fail_song_static_text_container rgba = [210 130 0 250] pos = (420.0, 380.0) scale = (0.75, 0.9) text = "COMPLETED" z = (<z> + 0.1)
	fit_text_in_rectangle id = 0x40a3ba40 dims = (80.0, 60.0) pos = (630.0, 430.0)
	displaytext font = <menu_font> parent = fail_song_static_text_container rgba = [210 130 0 250] pos = (670.0, 365.0) scale = (1.0, 1.0) text = "%" z = (<z> + 0.1)
	displaytext font = <menu_font> parent = fail_song_static_text_container rgba = [210 130 0 250] pos = (710.0, 380.0) scale = (0.8, 0.9) text = "ON" z = (<z> + 0.1)
	formattext textname = diff_text "%s" s = <difficulty_text>
	displaytext id = 0x9a6dd5c1 font = <menu_font> parent = fail_song_static_text_container rgba = [210 130 0 250] scale = (1.0, 1.0) text = <diff_text> z = (<z> + 0.1)
	fit_text_in_rectangle id = 0x9a6dd5c1 dims = (110.0, 60.0) pos = (755.0, 370.0)
	change menu_focus_color = [180 50 50 255]
	change menu_unfocus_color = [0 0 0 255]
	text_scale = (0.9, 0.95)
	displaysprite parent = fail_song_static_text_container tex = white pos = (492.0, 517.0) scale = (75.0, 6.0) z = (<z> + 0.1) rgba = <offwhite>
	displaysprite parent = fail_song_static_text_container tex = dialog_frame_joiner pos = (480.0, 510.0) rot_angle = 5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite parent = fail_song_static_text_container tex = dialog_frame_joiner pos = (750.0, 514.0) flip_v rot_angle = -5 scale = (1.575, 1.5) z = (<z> + 0.2)
	displaysprite id = hi_right parent = fail_song_static_text_container tex = dialog_highlight pos = (770.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	displaysprite id = hi_left parent = fail_song_static_text_container tex = dialog_highlight flip_v pos = (500.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3)
	if NOT gotparam exclusive_device
		exclusive_device = ($primary_controller)
	endif
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [80 80 80 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	if (($game_mode = p1_career && $boss_battle = 0) || ($game_mode = p2_career))
		createscreenelement {
			type = textelement
			parent = fail_song_vmenu_id
			font = <menu_font>
			text = "PRACTICE"
			rgba = ($menu_unfocus_color)
			scale = <text_scale>
			just = [center top]
			z_priority = (<z> + 0.1)
			event_handlers = [
				{focus practice_highlight_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose fail_song_menu_select_practice}
			]
			<demo_mode_disable>
		}
		setscreenelementprops {
			id = <id>
			exclusive_device = <exclusive_device>
		}
		displaysprite parent = fail_song_static_text_container tex = dialog_bg pos = (480.0, 428.0) scale = (1.25, 1.6) z = <z>
		displaysprite parent = fail_song_static_text_container tex = dialog_bg flip_h pos = (480.0, 530.0) scale = (1.25, 1.6) z = <z>
	else
		displaysprite parent = fail_song_static_text_container tex = dialog_bg pos = (480.0, 450.0) scale = (1.25, 1.25) z = <z>
		displaysprite parent = fail_song_static_text_container tex = dialog_bg flip_h pos = (480.0, 530.0) scale = (1.25, 1.25) z = <z>
	endif
	createscreenelement {
		type = textelement
		parent = fail_song_vmenu_id
		font = <menu_font>
		text = "RETRY SONG"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus retry_highlight_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose fail_song_menu_select_retry_song}
		]
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	createscreenelement {
		type = textelement
		parent = fail_song_vmenu_id
		font = <menu_font>
		text = "NEW SONG"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus newsong_highlight_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose fail_song_menu_select_new_song}
		]
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	createscreenelement {
		type = textelement
		parent = fail_song_vmenu_id
		font = <menu_font>
		text = "QUIT"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
		z_priority = (<z> + 0.1)
		event_handlers = [
			{focus quit_highlight_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose fail_song_menu_select_quit}
		]
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	pausegame
	kill_start_key_binding
endscript

script destroy_fail_song_menu 
	stopsoundevent \{crowd_fail_song_sfx}
	restore_start_key_binding
	destroy_menu \{menu_id = fail_song_scrolling_menu}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = fail_song_static_text_container}
endscript

script fail_song_menu_select_practice 
	ui_flow_manager_respond_to_action \{action = select_practice}
endscript

script fail_song_menu_select_retry_song 
	unpausegame
	ui_flow_manager_respond_to_action \{action = select_retry}
	restart_song
endscript

script fail_song_menu_select_new_song 
	ui_flow_manager_respond_to_action \{action = select_new_song}
endscript

script fail_song_menu_select_quit 
	ui_flow_manager_respond_to_action \{action = select_quit}
endscript

script retry_highlight_focus 
	retail_menu_focus
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			if (($game_mode = p1_career) || ($game_mode = p2_career))
				setscreenelementprops \{id = hi_left
					pos = (470.0, 495.0)
					flip_v}
				setscreenelementprops \{id = hi_right
					pos = (750.0, 495.0)}
			else
				setscreenelementprops \{id = hi_left
					pos = (470.0, 480.0)
					flip_v}
				setscreenelementprops \{id = hi_right
					pos = (750.0, 480.0)}
			endif
		endif
	endif
endscript

script practice_highlight_focus 
	retail_menu_focus
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			setscreenelementprops \{id = hi_left
				pos = (495.0, 460.0)
				flip_v}
			setscreenelementprops \{id = hi_right
				pos = (725.0, 460.0)}
		endif
	endif
endscript

script newsong_highlight_focus 
	retail_menu_focus
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			if (($game_mode = p1_career) || ($game_mode = p2_career))
				setscreenelementprops \{id = hi_left
					pos = (485.0, 532.0)
					flip_v}
				setscreenelementprops \{id = hi_right
					pos = (735.0, 532.0)}
			else
				setscreenelementprops \{id = hi_left
					pos = (485.0, 515.0)
					flip_v}
				setscreenelementprops \{id = hi_right
					pos = (735.0, 515.0)}
			endif
		endif
	endif
endscript

script quit_highlight_focus 
	retail_menu_focus
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			if (($game_mode = p1_career) || ($game_mode = p2_career))
				setscreenelementprops \{id = hi_left
					pos = (533.0, 570.0)
					flip_v}
				setscreenelementprops \{id = hi_right
					pos = (679.0, 570.0)}
			else
				setscreenelementprops \{id = hi_left
					pos = (535.0, 552.0)
					flip_v}
				setscreenelementprops \{id = hi_right
					pos = (680.0, 552.0)}
			endif
		endif
	endif
endscript
