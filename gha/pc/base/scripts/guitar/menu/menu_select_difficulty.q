menu_select_difficulty_p1_difficulty_index = 0
menu_select_difficulty_p2_difficulty_index = 0
menu_select_difficulty_first_time_p1 = 1
menu_select_difficulty_first_time_p2 = 1
sd_highlight_time = 0.05
g_showing_multiplayer_sd_screen = 0

script create_select_difficulty_menu 
	disable_pause
	if (($current_num_players = 2))
		if (($is_network_game) = 1)
			exclusive_device = ($primary_controller)
		endif
		create_mp_select_difficulty_menu
		return
	endif
	change \{g_showing_multiplayer_sd_screen = 0}
	spawnscriptnow \{menu_music_on}
	base_menu_pos = (260.0, 235.0)
	main_menu_font = fontgrid_title_gh3
	menu_vspacing = 20
	completion_scale = 0.5
	menu_font = text_a6
	if (($player1_status.bot_play = 1) || ($is_network_game))
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
	change \{rich_presence_context = presence_song_list}
	new_menu {
		scrollid = scrolling_select_difficulty
		vmenuid = vmenu_select_difficulty
		menu_pos = <base_menu_pos>
		use_backdrop = 0
		spacing = <menu_vspacing>
		exclusive_device = <exclusive_device>
	}
	if ($game_mode = p1_career)
	else
		if gotparam \{song}
			change current_song = <song>
		endif
	endif
	setscreenelementprops \{id = vmenu_select_difficulty
		internal_just = [
			left
			top
		]}
	createscreenelement \{type = containerelement
		parent = root_window
		id = sd_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = venue_bg}
	displaysprite \{parent = sd_container
		tex = difficulty_1p_bg
		pos = (640.0, 0.0)
		just = [
			center
			top
		]
		dims = (920.0, 720.0)
		z = 1}
	p1_diff_index = 8
	createscreenelement {
		type = spriteelement
		id = sd_white_p1
		parent = sd_container
		texture = white
		pos = ($g_sd_hilite_props [<p1_diff_index>].pos)
		just = [top left]
		dims = (285.0, 37.0)
		rgba = [171 189 177 255]
		alpha = 0.9
	}
	displaysprite \{parent = sd_container
		tex = toprockers_tape_1
		pos = (1150.0, 0.0)
		dims = (180.0, 128.0)
		z = 50
		rot_angle = 90}
	displaysprite \{parent = sd_container
		tex = toprockers_tape_1
		pos = (1155.0, 3.0)
		dims = (180.0, 128.0)
		rgba = [
			0
			0
			0
			100
		]
		z = 49
		rot_angle = 90}
	displaysprite \{parent = sd_container
		tex = toprockers_tape_2
		pos = (260.0, 550.0)
		z = 50
		rot_angle = 90
		dims = (180.0, 128.0)}
	displaysprite \{parent = sd_container
		tex = toprockers_tape_2
		pos = (264.0, 555.0)
		rgba = [
			0
			0
			0
			100
		]
		z = 49
		rot_angle = 90
		dims = (180.0, 128.0)}
	if ($game_mode = p1_career)
		get_diff_completion_text
	endif
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		id = easy_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "EASY"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = 8 difficulty_index = 0}}
			{pad_choose selected_difficulty params = {diff = easy}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	completion_pos = (465.0, 290.0)
	if ($game_mode = p1_career)
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [0])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		id = medium_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "MEDIUM"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = 9 difficulty_index = 1}}
			{pad_choose selected_difficulty params = {diff = medium}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	<completion_pos> = (465.0, 360.0)
	if ($game_mode = p1_career)
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [1])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		id = hard_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "HARD"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = 10 difficulty_index = 2}}
			{pad_choose selected_difficulty params = {diff = hard}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	<completion_pos> = (465.0, 430.0)
	if ($game_mode = p1_career)
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [2])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		id = expert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "EXPERT"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = 11 difficulty_index = 3}}
			{pad_choose selected_difficulty params = {diff = expert}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	<completion_pos> = (465.0, 500.0)
	if ($game_mode = p1_career)
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [3])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	change \{disable_menu_sounds = 1}
	change \{sd_highlight_time = 0.0}
	change \{sd_highlight_menuitem_morph = 0}
	if ($menu_select_difficulty_first_time_p1 = 1)
		if isxenon
			if getgameprofilesetting \{gsid = 1}
				begin
				if (<game_setting> < 3)
					break
				endif
				launchevent \{type = pad_down
					target = vmenu_select_difficulty}
				<game_setting> = (<game_setting> - 1)
				repeat
			endif
		endif
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
			launchevent \{type = pad_down
				target = vmenu_select_difficulty}
			repeat <launch_num>
		endif
	endif
	change \{sd_highlight_menuitem_morph = 1}
	change \{disable_menu_sounds = 0}
	change \{sd_highlight_time = 0.05}
	if english
		select_diff_tex = difficulty_title_en
	elseif french
		select_diff_tex = difficulty_title_fr
	elseif spanish
		select_diff_tex = difficulty_title_sp
	elseif german
		select_diff_tex = difficulty_title_de
	elseif italian
		select_diff_tex = difficulty_title_it
	endif
	createscreenelement {
		type = spriteelement
		parent = sd_container
		texture = <select_diff_tex>
		pos = (757.0, 491.0)
		dims = (192.0, 192.0)
		rgba = [255 255 255 255]
		just = [center center]
		z_priority = 80
	}
	displaysprite \{parent = sd_container
		tex = instrument_2p_overlay
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50
		rgba = [
			105
			56
			7
			160
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
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
	if ($transitions_locked = 0)
		launchevent \{type = unfocus
			target = vmenu_select_difficulty}
	endif
	change current_difficulty = <diff>
	change current_difficulty2 = <diff>
	change \{menu_select_difficulty_first_time_p1 = 0}
	if ($coop_dlc_active = 1)
		ui_flow_manager_respond_to_action \{action = continue_coop}
	else
		ui_flow_manager_respond_to_action \{action = continue}
	endif
endscript
player_selecting_difficulty = 1
g_sd_hilite_props = [
	{
		pos = (224.0, 275.0)
	}
	{
		pos = (224.0, 325.0)
	}
	{
		pos = (224.0, 375.0)
	}
	{
		pos = (224.0, 425.0)
	}
	{
		pos = (830.0, 275.0)
	}
	{
		pos = (830.0, 325.0)
	}
	{
		pos = (830.0, 375.0)
	}
	{
		pos = (830.0, 425.0)
	}
	{
		pos = (216.0, 235.0)
	}
	{
		pos = (216.0, 305.0)
	}
	{
		pos = (216.0, 375.0)
	}
	{
		pos = (216.0, 445.0)
	}
]
g_sd_p1_ready = 0
g_sd_p2_ready = 0

script create_mp_select_difficulty_menu 
	change \{g_showing_multiplayer_sd_screen = 1}
	change \{g_sd_p1_ready = 0}
	change \{g_sd_p2_ready = 0}
	printf ($net_can_send_approval = 1)
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = difficulty
		}
	endif
	spawnscriptnow \{menu_music_on}
	printf \{"--- create_mp_select_difficulty_menu"}
	create_menu_backdrop \{texture = venue_bg}
	menu_pos_p1 = (240.0, 280.0)
	menu_pos_p2 = (850.0, 280.0)
	menu_font = text_a6
	if ($is_network_game = 1)
		event_handlers_p1 = [
			{pad_up select_difficulty_generic_sound params = {player = 1 up}}
			{pad_down select_difficulty_generic_sound params = {player = 1 down}}
			{pad_back net_difficulty_go_back params = {player = 1 index = menu_select_difficulty_p1_difficulty_index}}
			{pad_start menu_show_gamercard}
		]
	else
		event_handlers_p1 = [
			{pad_up select_difficulty_generic_sound params = {player = 1 up}}
			{pad_down select_difficulty_generic_sound params = {player = 1 down}}
			{pad_back menu_sd_back_up params = {player = 1}}
		]
	endif
	event_handlers_p2 = [
		{pad_up select_difficulty_generic_sound params = {player = 2 up}}
		{pad_down select_difficulty_generic_sound params = {player = 2 down}}
		{pad_back menu_sd_back_up params = {player = 2}}
	]
	if ($is_network_game = 1)
		<exclusive_dev> = $player1_device
	else
		<exclusive_dev> = $player2_device
	endif
	if ($is_network_game = 1)
		no_focus_value = 1
	else
		no_focus_value = 0
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
		no_focus = <no_focus_value>
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
		no_focus = <no_focus_value>
	}
	createscreenelement \{type = containerelement
		parent = root_window
		id = sd_container
		pos = (0.0, 0.0)}
	displaysprite \{parent = sd_container
		tex = difficulty_2p_bg
		pos = (640.0, 0.0)
		just = [
			center
			top
		]
		dims = (915.0, 720.0)
		z = 1}
	p1_diff_index = 0
	p2_diff_index = 4
	if ($is_network_game = 1)
		ui_print_gamertags \{pos1 = (270.0, 95.0)
			pos2 = (1010.0, 95.0)
			just1 = [
				left
				top
			]
			just2 = [
				right
				top
			]}
	else
		displaytext parent = sd_container text = "player" font = <menu_font> pos = (260.0, 160.0) scale = 1 rgba = [171 189 177 255] noshadow
		getscreenelementdims id = <id>
		if (<width> > 150)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) pos = (260.0, 160.0)
		endif
		displaytext parent = sd_container text = "player" font = <menu_font> pos = (870.0, 160.0) scale = 1 rgba = [171 189 177 255] noshadow
		getscreenelementdims id = <id>
		if (<width> > 150)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) pos = (860.0, 160.0)
		endif
		displaytext \{parent = sd_container
			text = "1"
			font = text_a11_large
			pos = (320.0, 180.0)
			scale = 1
			rgba = [
				171
				189
				177
				255
			]
			noshadow}
		displaytext \{parent = sd_container
			text = "2"
			font = text_a11_large
			pos = (930.0, 180.0)
			scale = 1
			rgba = [
				171
				189
				177
				255
			]
			noshadow}
	endif
	createscreenelement {
		type = spriteelement
		id = sd_white_p1
		parent = sd_container
		texture = white
		pos = ($g_sd_hilite_props [<p1_diff_index>].pos)
		just = [left top]
		dims = (215.0, 48.0)
		rgba = [171 189 177 240]
		alpha = 0.9
	}
	createscreenelement {
		type = spriteelement
		id = sd_white_p2
		parent = sd_container
		texture = white
		pos = ($g_sd_hilite_props [<p2_diff_index>].pos)
		just = [left top]
		dims = (215.0, 48.0)
		rgba = [171 189 177 240]
		alpha = 0.9
	}
	displaysprite \{parent = sd_container
		tex = toprockers_tape_1
		pos = (1150.0, 0.0)
		dims = (212.0, 128.0)
		z = 50
		rot_angle = 90}
	displaysprite \{parent = sd_container
		tex = toprockers_tape_1
		pos = (1155.0, 3.0)
		dims = (212.0, 128.0)
		rgba = [
			0
			0
			0
			100
		]
		z = 49
		rot_angle = 90}
	displaysprite \{parent = sd_container
		tex = toprockers_tape_2
		pos = (230.0, 550.0)
		z = 50
		rot_angle = 90
		dims = (212.0, 128.0)}
	displaysprite \{parent = sd_container
		tex = toprockers_tape_2
		pos = (235.0, 553.0)
		rgba = [
			0
			0
			0
			100
		]
		z = 49
		rot_angle = 90
		dims = (212.0, 128.0)}
	if ($game_mode = p2_quickplay)
		initial_pos = (635.0, 592.0)
		rot = 0
		displaytext {
			id = sd_songs_completed_p1
			parent = sd_container
			pos = <initial_pos>
			scale = 0.75
			font = text_a6
			rgba = [220 180 90 255]
			rot = <rot>
			just = [center center]
			noshadow
			z = 15
		}
		displaytext \{parent = sd_container
			id = sd_combined_diff_text
			pos = (640.0, 500.0)
			just = [
				center
				center
			]
			font = text_a6
			rgba = [
				200
				160
				70
				255
			]
			scale = 1.25
			noshadow
			z = 15}
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
		rgba = [60 35 20 255]
		text = "EASY"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 1 index = 0 difficulty_index = 0}}
			{pad_choose <choose_script> params = {player = 1 diff = easy}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "MEDIUM"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 1 index = 1 difficulty_index = 1}}
			{pad_choose <choose_script> params = {player = 1 diff = medium}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "HARD"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 1 index = 2 difficulty_index = 2}}
			{pad_choose <choose_script> params = {player = 1 diff = hard}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "EXPERT"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {player = 1 index = 3 difficulty_index = 3}}
			{pad_choose <choose_script> params = {player = 1 diff = expert}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "EASY"
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 2 index = 4 difficulty_index = 0}}
			{pad_choose temp_selected_difficulty params = {player = 2 diff = easy}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "MEDIUM"
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 2 index = 5 difficulty_index = 1}}
			{pad_choose temp_selected_difficulty params = {player = 2 diff = medium}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "HARD"
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 2 index = 6 difficulty_index = 2}}
			{pad_choose temp_selected_difficulty params = {player = 2 diff = hard}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	createscreenelement {
		type = textelement
		parent = vmenu_select_difficulty2
		id = elxpert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "EXPERT"
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 2 index = 7 difficulty_index = 3}}
			{pad_choose temp_selected_difficulty params = {player = 2 diff = expert}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	displaysprite \{parent = sd_container
		tex = instrument_2p_overlay
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50
		rgba = [
			105
			56
			7
			160
		]}
	if ($is_network_game = 1)
		create_ready_icons \{pos1 = (260.0, 200.0)
			pos2 = (880.0, 190.0)}
	else
		create_ready_icons \{pos1 = (260.0, 200.0)
			pos2 = (880.0, 180.0)}
	endif
	change \{disable_menu_sounds = 1}
	change \{sd_highlight_menuitem_morph = 0}
	if ($is_network_game = 0)
		change \{disable_menu_sounds = 1}
		change \{sd_highlight_time = 0.0}
		change \{sd_highlight_menuitem_morph = 0}
		if ($menu_select_difficulty_first_time_p1 = 1)
			if isxenon
				if getgameprofilesetting \{gsid = 1}
					begin
					if (<game_setting> < 3)
						break
					endif
					launchevent \{type = pad_down
						target = vmenu_select_difficulty}
					<game_setting> = (<game_setting> - 1)
					repeat
				endif
			endif
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
				launchevent \{type = pad_down
					target = vmenu_select_difficulty}
				repeat <launch_num>
			endif
		endif
		if ($menu_select_difficulty_first_time_p2 = 1)
			if isxenon
				if getgameprofilesetting \{gsid = 2}
					begin
					if (<game_setting> < 3)
						break
					endif
					launchevent \{type = pad_down
						target = vmenu_select_difficulty2}
					<game_setting> = (<game_setting> - 1)
					repeat
				endif
			endif
		else
			launch_num = 0
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
				launchevent \{type = pad_down
					target = vmenu_select_difficulty2}
				repeat <launch_num>
			endif
		endif
		change \{sd_highlight_menuitem_morph = 1}
		change \{disable_menu_sounds = 0}
		change \{sd_highlight_time = 0.05}
	else
		change \{menu_select_difficulty_p1_difficulty_index = 0}
		change \{menu_select_difficulty_p2_difficulty_index = 0}
	endif
	if NOT ($game_mode = p2_quickplay)
		if english
			select_diff_tex = difficulty_title_en
		elseif french
			select_diff_tex = difficulty_title_fr
		elseif spanish
			select_diff_tex = difficulty_title_sp
		elseif german
			select_diff_tex = difficulty_title_de
		elseif italian
			select_diff_tex = difficulty_title_it
		endif
		createscreenelement {
			type = spriteelement
			parent = sd_container
			texture = <select_diff_tex>
			pos = (640.0, 491.0)
			dims = (160.0, 160.0)
			rgba = [255 255 255 255]
			just = [center center]
			z_priority = 80
		}
	endif
	change \{sd_highlight_menuitem_morph = 1}
	change \{disable_menu_sounds = 0}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message \{current_state = difficulty
			action = approval}
		change \{net_can_send_approval = 0}
	endif
endscript
sd_highlight_menuitem_morph = 0

script sd_highlight_menuitem \{player = 1
		index = 0
		time = 0.05}
	time = ($sd_highlight_time)
	if (<player> = 1)
		change menu_select_difficulty_p1_difficulty_index = <difficulty_index>
	else
		change menu_select_difficulty_p2_difficulty_index = <difficulty_index>
	endif
	min = ($menu_select_difficulty_p1_difficulty_index)
	mathmin a = ($menu_select_difficulty_p1_difficulty_index) b = ($menu_select_difficulty_p2_difficulty_index)
	casttointeger \{min}
	difficulty_index = <min>
	if (<player> = 1)
		if (g_sd_p1_ready = 1)
			return
		endif
		if screenelementexists \{id = sd_white_p1}
			runscriptonscreenelement id = sd_white_p1 menu_sd_move_highlight params = {player = <player> time = <time> pos = ($g_sd_hilite_props [<index>].pos)}
		endif
	else
		if (g_sd_p2_ready = 1)
			return
		endif
		if screenelementexists \{id = sd_white_p2}
			runscriptonscreenelement id = sd_white_p2 menu_sd_move_highlight params = {player = <player> time = <time> pos = ($g_sd_hilite_props [<index>].pos)}
		endif
	endif
	if ($game_mode = p2_quickplay)
		if screenelementexists \{id = sd_songs_completed_p1}
			sd_songs_completed_p1 :gettags
		endif
		if screenelementexists \{id = sd_combined_diff_text}
			my_diff = ($difficulty_list [<difficulty_index>])
			get_difficulty_text difficulty = <my_diff>
			if english
				<difficulty_text> = (<difficulty_text> + "!")
			endif
			setscreenelementprops id = sd_combined_diff_text text = <difficulty_text> scale = 1
			fit_text_in_rectangle \{id = sd_combined_diff_text
				dims = (165.0, 50.0)
				keep_ar = 1}
			sd_songs_completed_p1 :gettags
			if gotparam \{diff_completion_text}
				setscreenelementprops id = sd_songs_completed_p1 text = (<diff_completion_text> [<difficulty_index>])
				getscreenelementdims \{id = sd_songs_completed_p1}
				if (<width> > 350)
					setscreenelementprops \{id = sd_songs_completed_p1
						scale = 0.75}
					fit_text_in_rectangle id = sd_songs_completed_p1 dims = ((350.0, 0.0) + <height> * (0.0, 0.75))
				endif
			endif
		endif
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		if (($menu_select_difficulty_p1_difficulty_index != $menu_select_difficulty_p2_difficulty_index) && ($g_showing_multiplayer_sd_screen = 1))
			sd_create_score_balancing_notice
		else
			if screenelementexists \{id = score_balancing_container}
				destroyscreenelement \{id = score_balancing_container}
			endif
		endif
	endif
endscript

script sd_create_score_balancing_notice 
	<one> = $menu_select_difficulty_p1_difficulty_index
	<two> = $menu_select_difficulty_p2_difficulty_index
	if ($is_network_game = 1)
		<two> = (<two> - 4)
		if (<one> = <two>)
			if screenelementexists \{id = score_balancing_container}
				destroyscreenelement \{id = score_balancing_container}
			endif
			return
		endif
	endif
	if ((<one> = 0 && <two> = 1) || (<one> = 1 && <two> = 0))
		<average_diff> = "MEDIUM-EASY"
	elseif ((<one> = 0 && <two> = 2) || (<one> = 2 && <two> = 0))
		<average_diff> = "MEDIUM"
	elseif ((<one> = 0 && <two> = 3) || (<one> = 3 && <two> = 0))
		<average_diff> = "MEDIUM-HARD"
	elseif ((<one> = 1 && <two> = 2) || (<one> = 2 && <two> = 1))
		<average_diff> = "MEDIUM-HARD"
	elseif ((<one> = 1 && <two> = 3) || (<one> = 3 && <two> = 1))
		<average_diff> = "HARD"
	elseif ((<one> = 2 && <two> = 3) || (<one> = 3 && <two> = 2))
		<average_diff> = "EXPERT-HARD"
	endif
	formattext textname = score_balancing_text "SCORE BALANCING IS ON---BASED ON %a DIFFICULTY" a = <average_diff>
	if screenelementexists \{id = score_balancing_container}
		destroyscreenelement \{id = score_balancing_container}
	endif
	createscreenelement \{type = containerelement
		parent = sd_container
		id = score_balancing_container
		pos = (0.0, 0.0)}
	<z> = 20
	<pos> = (640.0, 556.0)
	createscreenelement {
		type = spriteelement
		parent = score_balancing_container
		id = score_balancing_text_bg
		texture = control_pill_body
		pos = <pos>
		just = [center center]
		rgba = (($g_menu_colors).dk_violet_grey)
		z_priority = <z>
	}
	createscreenelement {
		type = textelement
		parent = score_balancing_container
		pos = (<pos> + (0.0, 3.0))
		just = [center center]
		text = <score_balancing_text>
		rgba = (($g_menu_colors).lt_violet_grey)
		scale = (0.45000002, 0.6)
		z_priority = (<z> + 1)
		font = text_a6
	}
	getscreenelementdims id = <id>
	bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
	score_balancing_text_bg :setprops dims = <bg_dims>
	createscreenelement {
		type = spriteelement
		parent = score_balancing_container
		texture = control_pill_end
		pos = (<pos> - <width> * (0.5, 0.0))
		rgba = (($g_menu_colors).dk_violet_grey)
		just = [right center]
		flip_v
		z_priority = <z>
	}
	createscreenelement {
		type = spriteelement
		parent = score_balancing_container
		texture = control_pill_end
		pos = (<pos> + <width> * (0.5, 0.0))
		rgba = (($g_menu_colors).dk_violet_grey)
		just = [left center]
		z_priority = <z>
	}
endscript

script select_difficulty_generic_sound 
	if (<player> = 1)
		if ($g_sd_p1_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	else
		if ($g_sd_p2_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	endif
endscript

script temp_selected_difficulty \{player = 1}
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if (<player> = 1)
		if ($g_sd_p1_ready = 0)
			setscreenelementprops \{id = vmenu_select_difficulty
				disable_pad_handling}
			change current_difficulty = <diff>
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				drop_in_ready_sign player = <player> from_sd = 1
			endif
		endif
	else
		if ($g_sd_p2_ready = 0)
			setscreenelementprops \{id = vmenu_select_difficulty2
				disable_pad_handling}
			change current_difficulty2 = <diff>
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				drop_in_ready_sign player = <player> from_sd = 1
			endif
		endif
	endif
	wait \{0.3
		seconds}
	if (($g_sd_p1_ready) && ($g_sd_p2_ready))
		change \{menu_flow_locked = 1}
		wait \{0.5
			seconds}
		change \{menu_flow_locked = 0}
		diff_index_p1 = ($difficulty_list_props.($current_difficulty).index)
		diff_index_p2 = ($difficulty_list_props.($current_difficulty2).index)
		min = <diff_index_p1>
		mathmin a = <diff_index_p1> b = <diff_index_p2>
		casttointeger \{min}
		difficulty_index = <min>
		change current_difficulty_coop = ($difficulty_list [<difficulty_index>])
		change \{menu_select_difficulty_first_time_p1 = 0}
		change \{menu_select_difficulty_first_time_p2 = 0}
		if ($coop_dlc_active = 1)
			ui_flow_manager_respond_to_action \{action = continue_coop
				create_params = {
					player = 2
				}}
		else
			ui_flow_manager_respond_to_action \{action = continue
				create_params = {
					player = 2
				}}
		endif
	endif
	change \{transitions_locked = 0}
endscript

script menu_sd_back_up \{player = 1}
	if ($menu_flow_locked = 1)
		return
	endif
	if (<player> = 1)
		if ($g_sd_p1_ready = 1)
			setscreenelementprops \{id = vmenu_select_difficulty
				enable_pad_handling}
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				drop_out_ready_sign player = <player> from_sd = 1
			endif
		else
			menu_flow_go_back
		endif
	else
		if ($g_sd_p2_ready = 1)
			setscreenelementprops \{id = vmenu_select_difficulty2
				enable_pad_handling}
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				drop_out_ready_sign player = <player> from_sd = 1
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
