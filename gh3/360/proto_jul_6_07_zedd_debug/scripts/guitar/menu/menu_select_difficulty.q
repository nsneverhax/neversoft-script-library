menu_select_difficulty_p1_difficulty_index = 0
menu_select_difficulty_p2_difficulty_index = 0
menu_select_difficulty_first_time = 1
sd_highlight_time = 0.05

script create_select_difficulty_menu 
	if ($current_num_players = 2)
		if NOT ($game_mode = p2_pro_faceoff)
			create_mp_select_difficulty_menu
			return
		endif
	endif
	spawnscriptnow menu_music_on
	base_menu_pos = (280.0, 145.0)
	main_menu_font = fontgrid_title_gh3
	menu_vspacing = 30
	completion_scale = 0.5
	menu_font = text_a6
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_pro_faceoff)
			exclusive_mp_controllers = [0 , 0]
			setarrayelement arrayname = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
			setarrayelement arrayname = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	new_menu {
		scrollid = scrolling_select_difficulty
		vmenuid = vmenu_select_difficulty
		menu_pos = <base_menu_pos>
		use_backdrop = 0
		spacing = <menu_vspacing>
		exclusive_device = <exclusive_device>
	}
	if ($game_mode = p1_career || $game_mode = $p2_career)
	else
		if gotparam song
			change current_song = <song>
		endif
	endif
	set_focus_color rgba = [175 0 0 250]
	set_unfocus_color rgba = [210 210 210 250]
	setscreenelementprops {
		id = vmenu_select_difficulty
		internal_just = [left top]
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = sd_container
		pos = (0.0, 0.0)
	}
	create_menu_backdrop texture = venue_bg
	displaysprite parent = sd_container tex = difficulty_1p_bg pos = (640.0, 0.0) just = [center top] dims = (920.0, 720.0) z = 1
	p1_diff_index = 8
	displaysprite id = sd_white_p1 parent = sd_container tex = white pos = ($g_sd_hilite_props [<p1_diff_index>].pos) dims = (300.0, 48.0) rgba = [225 120 60 255]
	displaysprite {
		parent = sd_container
		tex = toprockers_tape_1
		pos = (1150.0, 0.0)
		dims = (212.0, 128.0)
		z = 50
		rot_angle = 90
	}
	displaysprite {
		parent = sd_container
		tex = toprockers_tape_2
		pos = (260.0, 550.0)
		z = 50
		rot_angle = 90
		dims = (212.0, 128.0)
	}
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		get_diff_completion_text
	endif
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		id = easy_title_text
		font = <menu_font>
		scale = (2.3, 1.6)
		rgba = [60 35 20 255]
		text = "easy"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = 8 difficulty_index = 0}}
			{pad_choose selected_difficulty params = {diff = easy}}
		]
	}
	completion_pos = (500.0, 225.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [0])
			rgba = [0 0 0 255]
			z_priority = 100
		}
	endif
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		id = medium_title_text
		font = <menu_font>
		scale = (1.25, 1.3499999)
		rgba = [60 35 20 255]
		text = "medium"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = 9 difficulty_index = 1}}
			{pad_choose selected_difficulty params = {diff = medium}}
		]
	}
	<completion_pos> = (500.0, 325.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [1])
			rgba = [0 0 0 255]
			z_priority = 100
		}
	endif
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		id = hard_title_text
		font = <menu_font>
		scale = (2.1, 1.3)
		rgba = [60 35 20 255]
		text = "hard"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = 10 difficulty_index = 2}}
			{pad_choose selected_difficulty params = {diff = hard}}
		]
	}
	<completion_pos> = (500.0, 415.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [2])
			rgba = [0 0 0 255]
			z_priority = 100
		}
	endif
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		id = expert_title_text
		font = <menu_font>
		scale = 1.15
		rgba = [60 35 20 255]
		text = "EXPERT"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = 11 difficulty_index = 3}}
			{pad_choose selected_difficulty params = {diff = expert}}
		]
	}
	<completion_pos> = (500.0, 505.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [3])
			rgba = [0 0 0 255]
			z_priority = 100
		}
	endif
	change disable_menu_sounds = 1
	change sd_highlight_time = 0.0
	change sd_highlight_menuitem_morph = 0
	if ($menu_select_difficulty_first_time = 1)
		if isxenon
			if getgameprofilesetting gsid = 1
				begin
				if (<game_setting> < 3)
					break
				endif
				launchevent type = pad_down target = vmenu_select_difficulty
				<game_setting> = (<game_setting> - 1)
				repeat
			endif
		endif
		change menu_select_difficulty_first_time = 0
	else
		launch_num = 0
		switch ($current_difficulty)
			case medium
			<launch_num> = 1
			case hard
			<launch_num> = 2
			case expert
			<launch_num> = 3
		endswitch
		if (<launch_num>)
			begin
			launchevent type = pad_down target = vmenu_select_difficulty
			repeat <launch_num>
		endif
	endif
	change sd_highlight_menuitem_morph = 1
	change disable_menu_sounds = 0
	change sd_highlight_time = 0.05
	displaysprite parent = sd_container tex = instrument_2p_overlay pos = (0.0, 0.0) dims = (1280.0, 720.0) z = 50 rgba = [105 56 7 160]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
endscript

script destroy_select_difficulty_menu 
	destroy_gamertags
	destroy_ready_icons
	change \{g_sd_p1_ready = 0}
	change \{g_sd_p2_ready = 0}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_select_difficulty}
	destroy_menu \{menu_id = scrolling_select_difficulty2}
	destroy_menu \{menu_id = sd_container}
	destroy_menu_backdrop
endscript

script selected_difficulty 
	change current_difficulty = <diff>
	change current_difficulty2 = <diff>
	ui_flow_manager_respond_to_action \{action = continue}
endscript
player_selecting_difficulty = 1
g_sd_hilite_props = [
	{
		pos = (224.0, 312.0)
	}
	{
		pos = (224.0, 381.0)
	}
	{
		pos = (224.0, 456.0)
	}
	{
		pos = (224.0, 530.0)
	}
	{
		pos = (830.0, 312.0)
	}
	{
		pos = (830.0, 381.0)
	}
	{
		pos = (830.0, 456.0)
	}
	{
		pos = (830.0, 530.0)
	}
	{
		pos = (224.0, 153.0)
	}
	{
		pos = (216.0, 253.0)
	}
	{
		pos = (216.0, 348.0)
	}
	{
		pos = (216.0, 437.0)
	}
]
g_sd_p1_ready = 0
g_sd_p2_ready = 0

script create_mp_select_difficulty_menu 
	spawnscriptnow menu_music_on
	create_menu_backdrop texture = venue_bg
	menu_pos_p1 = (220.0, 300.0)
	menu_pos_p2 = (840.0, 300.0)
	menu_font = text_a6
	if ($is_network_game = 1)
		event_handlers_p1 = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back net_difficulty_go_back params = {player = 1 index = menu_select_difficulty_p1_difficulty_index}}
			{pad_start menu_show_gamercard}
		]
	else
		event_handlers_p1 = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back menu_sd_back_up params = {player = 1}}
		]
	endif
	event_handlers_p2 = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back menu_sd_back_up params = {player = 2}}
	]
	if ($is_network_game = 1)
		<exclusive_dev> = $player1_device
	else
		<exclusive_dev> = $player2_device
	endif
	new_menu {
		scrollid = scrolling_select_difficulty
		vmenuid = vmenu_select_difficulty
		menu_pos = <menu_pos_p1>
		use_backdrop = (0)
		font = <menu_font>
		font_size = 1.0
		event_handlers = <event_handlers_p1>
		exclusive_device = $player1_device
	}
	new_menu {
		scrollid = scrolling_select_difficulty2
		vmenuid = vmenu_select_difficulty2
		menu_pos = <menu_pos_p2>
		use_backdrop = (0)
		font = <menu_font>
		font_size = 1.0
		event_handlers = <event_handlers_p2>
		exclusive_device = <exclusive_dev>
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = sd_container
		pos = (0.0, 0.0)
	}
	displaysprite parent = sd_container tex = difficulty_2p_bg pos = (640.0, 0.0) just = [center top] dims = (920.0, 890.0) z = 1
	p1_diff_index = 0
	p2_diff_index = 4
	if ($is_network_game = 1)
		ui_print_gamertags pos1 = (320.0, 250.0) pos2 = (960.0, 250.0) dims = (350.0, 43.0) just1 = [center top] just2 = [center top]
	else
		displaytext parent = sd_container text = "player" font = <menu_font> pos = (250.0, 160.0) scale = 1 rgba = [205 105 50 255]
		displaytext parent = sd_container text = "player" font = <menu_font> pos = (860.0, 160.0) scale = 1 rgba = [205 105 50 255]
		displaytext parent = sd_container text = "1" font = <menu_font> pos = (300.0, 200.0) scale = 2 rgba = [205 105 50 255]
		displaytext parent = sd_container text = "2" font = <menu_font> pos = (910.0, 200.0) scale = 2 rgba = [205 105 50 255]
	endif
	displaysprite id = sd_white_p1 parent = sd_container tex = white pos = ($g_sd_hilite_props [<p1_diff_index>].pos) dims = (228.0, 48.0) rgba = [225 120 60 255]
	displaysprite id = sd_white_p2 parent = sd_container tex = white pos = ($g_sd_hilite_props [<p2_diff_index>].pos) dims = (228.0, 48.0) rgba = [225 120 60 255]
	displaysprite {
		parent = sd_container
		tex = toprockers_tape_1
		pos = (1150.0, 0.0)
		dims = (212.0, 128.0)
		z = 50
		rot_angle = 90
	}
	displaysprite {
		parent = sd_container
		tex = toprockers_tape_2
		pos = (230.0, 550.0)
		z = 50
		rot_angle = 90
		dims = (212.0, 128.0)
	}
	if ($game_mode = p2_career)
		get_diff_completion_text for_p2_career = 1
		initial_pos = (290.0, 80.0)
		rot = -10
		if NOT (<diff_completion_text> [0] = "")
			displaytext {
				id = sd_songs_completed_p1
				parent = sd_container
				pos = <initial_pos>
				scale = 0.75
				text = diff_completion_text [0]
				font = text_a6
				rgba = [60 50 100 255]
				rot = <rot>
				just = [center top]
			}
			sd_songs_completed_p1 :settags diff_completion_text = <diff_completion_text>
			displaytext parent = sd_container pos = (295.0, 105.0) scale = 0.7 text = "songs" font = text_a6 rgba = [60 50 100 255] just = [center top] rot = <rot>
			displaytext parent = sd_container pos = (305.0, 130.0) scale = 0.7 text = "completed" font = text_a6 rgba = [60 50 100 255] just = [center top] rot = <rot>
			displaysprite parent = sd_container tex = difficulty_2p_underline pos = (330.0, 630.0) scale = 3 rgba = [60 50 100 255] rot_angle = 10 just = [center top]
		endif
	endif
	if ($is_network_game = 1)
		<choose_script> = net_request_difficulty
		<highlight_script> = net_sd_highlight_menuitem
	else
		<choose_script> = temp_selected_difficulty
		<highlight_script> = sd_highlight_menuitem
	endif
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		font = <menu_font>
		scale = 1.75
		rgba = [60 35 20 255]
		text = "easy"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 1 index = 0 difficulty_index = 0}}
			{pad_choose <choose_script> params = {player = 1 diff = easy}}
		]
		exclusive_device = $player1_device
	}
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		font = <menu_font>
		scale = (1.0, 1.25)
		rgba = [60 35 20 255]
		text = "medium"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 1 index = 1 difficulty_index = 1}}
			{pad_choose <choose_script> params = {player = 1 diff = medium}}
		]
		exclusive_device = $player1_device
	}
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		font = <menu_font>
		scale = 1.75
		rgba = [60 35 20 255]
		text = "hard"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 1 index = 2 difficulty_index = 2}}
			{pad_choose <choose_script> params = {player = 1 diff = hard}}
		]
		exclusive_device = $player1_device
	}
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		font = <menu_font>
		scale = 1.25
		rgba = [60 35 20 255]
		text = "expert"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 1 index = 3 difficulty_index = 3}}
			{pad_choose <choose_script> params = {player = 1 diff = expert}}
		]
		exclusive_device = $player1_device
	}
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		scale = 1.75
		rgba = [60 35 20 255]
		text = "easy"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 2 index = 4 difficulty_index = 0}}
			{pad_choose <choose_script> params = {player = 2 diff = easy}}
		]
		exclusive_device = $player2_device
	}
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		scale = (1.0, 1.25)
		rgba = [60 35 20 255]
		text = "medium"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 2 index = 5 difficulty_index = 1}}
			{pad_choose <choose_script> params = {player = 2 diff = medium}}
		]
		exclusive_device = $player2_device
	}
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		scale = 1.75
		rgba = [60 35 20 255]
		text = "hard"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 2 index = 6 difficulty_index = 2}}
			{pad_choose <choose_script> params = {player = 2 diff = hard}}
		]
		exclusive_device = $player2_device
	}
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty2
		id = elxpert_title_text
		font = <menu_font>
		scale = 1.25
		rgba = [60 35 20 255]
		text = "expert"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 2 index = 7 difficulty_index = 3}}
			{pad_choose <choose_script> params = {player = 2 diff = expert}}
		]
		exclusive_device = $player2_device
	}
	displaysprite parent = sd_container tex = instrument_2p_overlay pos = (0.0, 0.0) dims = (1280.0, 720.0) z = 50 rgba = [105 56 7 160]
	if ($is_network_game = 1)
		create_ready_icons pos1 = (260.0, 150.0) pos2 = (880.0, 150.0)
	else
		create_ready_icons pos1 = (260.0, 200.0) pos2 = (880.0, 180.0)
	endif
	if ($game_mode = p2_career)
		displaysprite {
			parent = sd_container
			id = diff_select_helper
			tex = control_pill_body
			pos = (640.0, 600.0)
			just = [center center]
			rgba = [96 0 0 255]
			z = 100
		}
		displaytext {
			parent = sd_container
			pos = (640.0, 602.0)
			just = [center center]
			text = "The lowest difficulty determines what level you're playing at!"
			rgba = [186 105 0 255]
			scale = (0.45000002, 0.6)
			z = 101
			font = text_a6
		}
		getscreenelementdims id = <id>
		bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
		diff_select_helper :setprops dims = <bg_dims>
		displaysprite {
			parent = sd_container
			tex = control_pill_end
			pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
			rgba = [96 0 0 255]
			just = [right center]
			flip_v
			z = 100
		}
		displaysprite {
			parent = sd_container
			tex = control_pill_end
			pos = ((640.0, 601.0) + <width> * (0.5, 0.0))
			rgba = [96 0 0 255]
			just = [left center]
			z = 100
		}
	endif
	change sd_highlight_menuitem_morph = 0
	launch_num = 0
	switch ($current_difficulty)
		case medium
		<launch_num> = 1
		case hard
		<launch_num> = 2
		case expert
		<launch_num> = 3
	endswitch
	if (<launch_num>)
		begin
		launchevent type = pad_down target = vmenu_select_difficulty
		repeat <launch_num>
	endif
	<launch_num> = 0
	switch ($current_difficulty2)
		case medium
		<launch_num> = 1
		case hard
		<launch_num> = 2
		case expert
		<launch_num> = 3
	endswitch
	if (<launch_num>)
		begin
		launchevent type = pad_down target = vmenu_select_difficulty2
		repeat <launch_num>
	endif
	change sd_highlight_menuitem_morph = 1
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
endscript
sd_highlight_menuitem_morph = 0

script sd_highlight_menuitem player = 1 index = 0 time = 0.05
	time = ($sd_highlight_time)
	if (<player> = 1)
		change menu_select_difficulty_p1_difficulty_index = <difficulty_index>
	else
		change menu_select_difficulty_p2_difficulty_index = <difficulty_index>
	endif
	min = ($menu_select_difficulty_p1_difficulty_index)
	mathmin a = ($menu_select_difficulty_p1_difficulty_index) b = ($menu_select_difficulty_p2_difficulty_index)
	casttointeger min
	difficulty_index = <min>
	if (<player> = 1)
		if (g_sd_p1_ready = 1)
			return
		endif
		if screenelementexists id = sd_white_p1
			runscriptonscreenelement id = sd_white_p1 menu_sd_move_highlight params = {player = <player> time = <time> pos = ($g_sd_hilite_props [<index>].pos)}
		endif
	else
		if (g_sd_p2_ready = 1)
			return
		endif
		if screenelementexists id = sd_white_p2
			runscriptonscreenelement id = sd_white_p2 menu_sd_move_highlight params = {player = <player> time = <time> pos = ($g_sd_hilite_props [<index>].pos)}
		endif
	endif
	if ($game_mode = p2_career)
		if screenelementexists id = sd_songs_completed_p1
			sd_songs_completed_p1 :gettags
			if NOT (<diff_completion_text> [<difficulty_index>] = "")
				setscreenelementprops id = sd_songs_completed_p1 text = (<diff_completion_text> [<difficulty_index>])
			else
				setscreenelementprops id = sd_songs_completed_p1 text = "0"
			endif
		endif
	endif
endscript

script temp_selected_difficulty player = 1
	if (<player> = 1)
		if ($g_sd_p1_ready = 0)
			change current_difficulty = <diff>
			change g_sd_p1_ready = 1
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				runscriptonscreenelement id = <ready_container> drop_in_ready_sign params = {player = <player>}
			endif
		endif
	else
		if ($g_sd_p2_ready = 0)
			change current_difficulty2 = <diff>
			change g_sd_p2_ready = 1
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				runscriptonscreenelement id = <ready_container> drop_in_ready_sign params = {player = <player>}
			endif
		endif
	endif
	if (($g_sd_p1_ready) && ($g_sd_p2_ready))
		wait 0.5 seconds
		ui_flow_manager_respond_to_action action = continue create_params = {player = 2}
	endif
endscript

script menu_sd_back_up player = 1
	if (<player> = 1)
		if ($g_sd_p1_ready = 1)
			change g_sd_p1_ready = 0
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				runscriptonscreenelement id = <ready_container> drop_out_ready_sign params = {player = <player>}
			endif
		else
			menu_flow_go_back
		endif
	else
		if ($g_sd_p2_ready = 1)
			change g_sd_p2_ready = 0
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				runscriptonscreenelement id = <ready_container> drop_out_ready_sign params = {player = <player>}
			endif
		else
			menu_flow_go_back
		endif
	endif
endscript

script menu_sd_move_highlight 
	formattext checksumname = hilight_container 'sd_white_p%d' d = <player>
	if ($sd_highlight_menuitem_morph = 1)
		doscreenelementmorph id = <hilight_container> pos = <pos> time = <time>
	else
		doscreenelementmorph id = <hilight_container> pos = <pos>
	endif
endscript
