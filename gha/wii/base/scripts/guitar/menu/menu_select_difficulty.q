menu_select_difficulty_p1_difficulty_index = 0
menu_select_difficulty_p2_difficulty_index = 0
menu_select_difficulty_first_time_p1 = 1
menu_select_difficulty_first_time_p2 = 1
sd_highlight_time = 0.05
0x39308823 = 0
g_showing_multiplayer_sd_screen = 0

script create_select_difficulty_menu_for_practice 
	create_select_difficulty_menu \{practice = 1}
endscript

script create_select_difficulty_menu \{practice = 0}
	Change \{0x39308823 = 0}
	disable_pause
	if (($current_num_players = 2))
		if (($is_network_game) = 1)
			exclusive_device = ($primary_controller)
		endif
		create_mp_select_difficulty_menu
		return
	endif
	Change \{g_showing_multiplayer_sd_screen = 0}
	if NOT (<practice> = 1)
		SpawnScriptNow \{menu_music_on
			params = {
				setflag = 1
			}}
	endif
	base_menu_pos = (280.0, 235.0)
	main_menu_font = fontgrid_title_gh3
	menu_vspacing = 20
	completion_scale = 0.66700006
	menu_font = text_a6
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_pro_faceoff)
			exclusive_mp_controllers = [0 , 0]
			SetArrayElement ArrayName = exclusive_mp_controllers index = 0 NewValue = ($player1_device)
			SetArrayElement ArrayName = exclusive_mp_controllers index = 1 NewValue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	Change \{rich_presence_context = presence_song_list}
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
		if GotParam \{song}
			Change current_song = <song>
		endif
	endif
	SetScreenElementProps \{id = vmenu_select_difficulty
		internal_just = [
			left
			top
		]}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = sd_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	displaySprite \{parent = sd_container
		tex = Difficulty_1p_BG
		Pos = (640.0, 0.0)
		just = [
			center
			top
		]
		dims = (920.0, 720.0)
		z = 1}
	p1_diff_index = 8
	CreateScreenElement {
		Type = SpriteElement
		id = sd_white_p1
		parent = sd_container
		texture = white
		Pos = ($g_sd_hilite_props [<p1_diff_index>].Pos)
		just = [top left]
		dims = (285.0, 37.0)
		rgba = [171 189 177 255]
		alpha = 0.9
	}
	displaySprite \{parent = sd_container
		tex = Toprockers_Tape_1
		Pos = (1150.0, 0.0)
		dims = (180.0, 128.0)
		z = 50
		rot_angle = 90}
	displaySprite \{parent = sd_container
		tex = Toprockers_Tape_1
		Pos = (1155.0, 3.0)
		dims = (180.0, 128.0)
		rgba = [
			0
			0
			0
			100
		]
		z = 49
		rot_angle = 90}
	displaySprite \{parent = sd_container
		tex = Toprockers_Tape_2
		Pos = (260.0, 550.0)
		z = 50
		rot_angle = 90
		dims = (180.0, 128.0)}
	displaySprite \{parent = sd_container
		tex = Toprockers_Tape_2
		Pos = (264.0, 555.0)
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
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		id = easy_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'EASY'
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = 8 difficulty_index = 0}}
			{pad_choose selected_difficulty params = {diff = easy}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	completion_pos = (490.0, 290.0)
	if ($game_mode = p1_career)
		CreateScreenElement {
			Type = TextElement
			parent = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [right center]
			Pos = <completion_pos>
			text = (<diff_completion_text> [0])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		id = medium_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'MEDIUM'
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = 9 difficulty_index = 1}}
			{pad_choose selected_difficulty params = {diff = medium}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	<completion_pos> = (490.0, 360.0)
	if ($game_mode = p1_career)
		CreateScreenElement {
			Type = TextElement
			parent = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [right center]
			Pos = <completion_pos>
			text = (<diff_completion_text> [1])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		id = hard_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'HARD'
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = 10 difficulty_index = 2}}
			{pad_choose selected_difficulty params = {diff = hard}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	<completion_pos> = (490.0, 430.0)
	if ($game_mode = p1_career)
		CreateScreenElement {
			Type = TextElement
			parent = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [right center]
			Pos = <completion_pos>
			text = (<diff_completion_text> [2])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		id = expert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'EXPERT'
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = 11 difficulty_index = 3}}
			{pad_choose selected_difficulty params = {diff = expert}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	<completion_pos> = (490.0, 500.0)
	if ($game_mode = p1_career)
		CreateScreenElement {
			Type = TextElement
			parent = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [right center]
			Pos = <completion_pos>
			text = (<diff_completion_text> [3])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	Change \{disable_menu_sounds = 1}
	Change \{sd_highlight_time = 0.0}
	Change \{sd_highlight_menuitem_morph = 0}
	if ($menu_select_difficulty_first_time_p1 = 1)
		if isXenon
			if GetGameProfileSetting \{gsid = 1}
				begin
				if (<game_setting> < 3)
					break
				endif
				LaunchEvent \{Type = pad_down
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
			LaunchEvent \{Type = pad_down
				target = vmenu_select_difficulty}
			repeat <launch_num>
		endif
	endif
	Change \{sd_highlight_menuitem_morph = 1}
	Change \{disable_menu_sounds = 0}
	Change \{sd_highlight_time = 0.05}
	if English
		select_diff_tex = difficulty_title_en
	elseif French
		select_diff_tex = difficulty_title_fr
	elseif Spanish
		select_diff_tex = difficulty_title_sp
	elseif German
		select_diff_tex = difficulty_title_de
	elseif Italian
		select_diff_tex = difficulty_title_it
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = sd_container
		texture = <select_diff_tex>
		Pos = (757.0, 491.0)
		dims = (192.0, 192.0)
		rgba = [255 255 255 255]
		just = [center center]
		z_priority = 80
	}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
endscript

script destroy_select_difficulty_menu 
	destroy_gamertags
	destroy_ready_icons
	Change \{g_sd_p1_ready = 0}
	Change \{g_sd_p2_ready = 0}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_select_difficulty}
	destroy_menu \{menu_id = scrolling_select_difficulty2}
	destroy_menu \{menu_id = sd_container}
	destroy_menu_backdrop
endscript

script selected_difficulty 
	if ($0x39308823 = 1)
		return
	endif
	Change \{0x39308823 = 1}
	if ($transitions_locked = 0)
		LaunchEvent \{Type = unfocus
			target = vmenu_select_difficulty}
	endif
	Change current_difficulty = <diff>
	Change current_difficulty2 = <diff>
	Change \{menu_select_difficulty_first_time_p1 = 0}
	if isngc
		if ($select_diff_to_char_render_stall = 1)
			skiprenderframes \{10}
			Change \{select_diff_to_char_render_stall = 0}
		endif
	endif
	if ($coop_dlc_active = 1)
		ui_flow_manager_respond_to_action \{action = continue_coop}
	else
		ui_flow_manager_respond_to_action \{action = continue}
	endif
endscript
player_selecting_difficulty = 1
g_sd_hilite_props = [
	{
		Pos = (224.0, 285.0)
	}
	{
		Pos = (224.0, 335.0)
	}
	{
		Pos = (224.0, 385.0)
	}
	{
		Pos = (224.0, 435.0)
	}
	{
		Pos = (830.0, 285.0)
	}
	{
		Pos = (830.0, 335.0)
	}
	{
		Pos = (830.0, 385.0)
	}
	{
		Pos = (830.0, 435.0)
	}
	{
		Pos = (216.0, 245.0)
	}
	{
		Pos = (216.0, 315.0)
	}
	{
		Pos = (216.0, 385.0)
	}
	{
		Pos = (216.0, 455.0)
	}
]
g_sd_p1_ready = 0
g_sd_p2_ready = 0

script create_mp_select_difficulty_menu 
	Change \{g_showing_multiplayer_sd_screen = 1}

	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = difficulty
		}
	endif
	SpawnScriptNow \{menu_music_on
		params = {
			setflag = 1
		}}

	create_menu_backdrop \{texture = Venue_BG}
	menu_pos_p1 = (240.0, 280.0)
	menu_pos_p2 = (850.0, 280.0)
	menu_font = text_a6
	if ($is_network_game = 1)
		event_handlers_p1 = [
			{pad_up select_difficulty_generic_sound params = {Player = 1 up}}
			{pad_down select_difficulty_generic_sound params = {Player = 1 down}}
			{pad_back net_difficulty_go_back params = {Player = 1 index = menu_select_difficulty_p1_difficulty_index}}
		]
	else
		event_handlers_p1 = [
			{pad_up select_difficulty_generic_sound params = {Player = 1 up}}
			{pad_down select_difficulty_generic_sound params = {Player = 1 down}}
			{pad_back menu_sd_back_up params = {Player = 1}}
		]
	endif
	event_handlers_p2 = [
		{pad_up select_difficulty_generic_sound params = {Player = 2 up}}
		{pad_down select_difficulty_generic_sound params = {Player = 2 down}}
		{pad_back menu_sd_back_up params = {Player = 2}}
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
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = sd_container
		Pos = (0.0, 0.0)}
	displaySprite \{parent = sd_container
		tex = Difficulty_2p_BG
		Pos = (640.0, 0.0)
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
		displayText parent = sd_container text = 'player' font = <menu_font> Pos = (250.0, 130.0) Scale = 1.5 rgba = [171 189 177 255] noshadow
		GetScreenElementDims id = <id>
		if (<width> > 150)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) Pos = (260.0, 160.0)
		endif
		displayText parent = sd_container text = 'player' font = <menu_font> Pos = (865.0, 130.0) Scale = 1.5 rgba = [171 189 177 255] noshadow
		GetScreenElementDims id = <id>
		if (<width> > 150)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) Pos = (860.0, 160.0)
		endif
		displayText \{parent = sd_container
			text = '1'
			font = text_a11_Large
			Pos = (316.0, 223.0)
			Scale = 1.3
			rgba = [
				171
				189
				177
				255
			]
			noshadow}
		displayText \{parent = sd_container
			text = '2'
			font = text_a11_Large
			Pos = (920.0, 223.0)
			Scale = 1.3
			rgba = [
				171
				189
				177
				255
			]
			noshadow}
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = sd_white_p1
		parent = sd_container
		texture = white
		Pos = ($g_sd_hilite_props [<p1_diff_index>].Pos)
		just = [left top]
		dims = (215.0, 48.0)
		rgba = [171 189 177 240]
		alpha = 0.9
	}
	CreateScreenElement {
		Type = SpriteElement
		id = sd_white_p2
		parent = sd_container
		texture = white
		Pos = ($g_sd_hilite_props [<p2_diff_index>].Pos)
		just = [left top]
		dims = (228.0, 48.0)
		rgba = [171 189 177 240]
		alpha = 0.9
	}
	displaySprite \{parent = sd_container
		tex = Toprockers_Tape_1
		Pos = (1150.0, 0.0)
		dims = (212.0, 128.0)
		z = 50
		rot_angle = 90}
	displaySprite \{parent = sd_container
		tex = Toprockers_Tape_1
		Pos = (1155.0, 3.0)
		dims = (212.0, 128.0)
		rgba = [
			0
			0
			0
			100
		]
		z = 49
		rot_angle = 90}
	displaySprite \{parent = sd_container
		tex = Toprockers_Tape_2
		Pos = (230.0, 550.0)
		z = 50
		rot_angle = 90
		dims = (212.0, 128.0)}
	displaySprite \{parent = sd_container
		tex = Toprockers_Tape_2
		Pos = (235.0, 553.0)
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
		displayText {
			id = sd_songs_completed_p1
			parent = sd_container
			Pos = (<initial_pos> + (0.0, -7.0))
			Scale = 0.75
			font = text_a6
			rgba = [220 180 90 255]
			rot = <rot>
			just = [center center]
			noshadow
			z = 15
		}
		displayText \{parent = sd_container
			id = sd_combined_diff_text
			Pos = (640.0, 500.0)
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
			Scale = 1.25
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
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'EASY'
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {Player = 1 index = 0 difficulty_index = 0}}
			{pad_choose <choose_script> params = {Player = 1 diff = easy}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'MEDIUM'
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {Player = 1 index = 1 difficulty_index = 1}}
			{pad_choose <choose_script> params = {Player = 1 diff = medium}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'HARD'
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {Player = 1 index = 2 difficulty_index = 2}}
			{pad_choose <choose_script> params = {Player = 1 diff = hard}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'EXPERT'
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {Player = 1 index = 3 difficulty_index = 3}}
			{pad_choose <choose_script> params = {Player = 1 diff = expert}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'EASY'
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 4 difficulty_index = 0}}
			{pad_choose temp_selected_difficulty params = {Player = 2 diff = easy}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'MEDIUM'
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 5 difficulty_index = 1}}
			{pad_choose temp_selected_difficulty params = {Player = 2 diff = medium}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'HARD'
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 6 difficulty_index = 2}}
			{pad_choose temp_selected_difficulty params = {Player = 2 diff = hard}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty2
		id = elxpert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = 'EXPERT'
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 7 difficulty_index = 3}}
			{pad_choose temp_selected_difficulty params = {Player = 2 diff = expert}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	if ($is_network_game = 1)
		create_ready_icons \{pos1 = (260.0, 200.0)
			pos2 = (880.0, 190.0)}
	else
		create_ready_icons \{pos1 = (260.0, 200.0)
			pos2 = (880.0, 180.0)}
	endif
	Change \{disable_menu_sounds = 1}
	Change \{sd_highlight_menuitem_morph = 0}
	if ($is_network_game = 0)
		Change \{disable_menu_sounds = 1}
		Change \{sd_highlight_time = 0.0}
		Change \{sd_highlight_menuitem_morph = 0}
		if ($menu_select_difficulty_first_time_p1 = 1)
			if isXenon
				if GetGameProfileSetting \{gsid = 1}
					begin
					if (<game_setting> < 3)
						break
					endif
					LaunchEvent \{Type = pad_down
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
				LaunchEvent \{Type = pad_down
					target = vmenu_select_difficulty}
				repeat <launch_num>
			endif
		endif
		if ($menu_select_difficulty_first_time_p2 = 1)
			if isXenon
				if GetGameProfileSetting \{gsid = 2}
					begin
					if (<game_setting> < 3)
						break
					endif
					LaunchEvent \{Type = pad_down
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
				LaunchEvent \{Type = pad_down
					target = vmenu_select_difficulty2}
				repeat <launch_num>
			endif
		endif
		Change \{sd_highlight_menuitem_morph = 1}
		Change \{disable_menu_sounds = 0}
		Change \{sd_highlight_time = 0.05}
	endif
	if NOT ($game_mode = p2_quickplay)
		if English
			select_diff_tex = difficulty_title_en
		elseif French
			select_diff_tex = difficulty_title_fr
		elseif Spanish
			select_diff_tex = difficulty_title_sp
		elseif German
			select_diff_tex = difficulty_title_de
		elseif Italian
			select_diff_tex = difficulty_title_it
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = sd_container
			texture = <select_diff_tex>
			Pos = (640.0, 491.0)
			dims = (160.0, 160.0)
			rgba = [255 255 255 255]
			just = [center center]
			z_priority = 80
		}
	endif
	Change \{sd_highlight_menuitem_morph = 1}
	Change \{disable_menu_sounds = 0}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message \{current_state = difficulty
			action = approval}
		Change \{net_can_send_approval = 0}
	endif
endscript
sd_highlight_menuitem_morph = 0

script sd_highlight_menuitem \{Player = 1
		index = 0
		time = 0.05}
	if ($0x39308823 = 1)
		return
	endif
	time = ($sd_highlight_time)
	if (<Player> = 1)
		Change menu_select_difficulty_p1_difficulty_index = <difficulty_index>
	else
		Change menu_select_difficulty_p2_difficulty_index = <difficulty_index>
	endif
	min = ($menu_select_difficulty_p1_difficulty_index)
	MathMin a = ($menu_select_difficulty_p1_difficulty_index) b = ($menu_select_difficulty_p2_difficulty_index)
	CastToInteger \{min}
	difficulty_index = <min>
	if (<Player> = 1)
		if (g_sd_p1_ready = 1)
			return
		endif
		if ScreenElementExists \{id = sd_white_p1}
			RunScriptOnScreenElement id = sd_white_p1 menu_sd_move_highlight params = {Player = <Player> time = <time> Pos = ($g_sd_hilite_props [<index>].Pos)}
		endif
	else
		if (g_sd_p2_ready = 1)
			return
		endif
		if ScreenElementExists \{id = sd_white_p2}
			RunScriptOnScreenElement id = sd_white_p2 menu_sd_move_highlight params = {Player = <Player> time = <time> Pos = ($g_sd_hilite_props [<index>].Pos)}
		endif
	endif
	if ($game_mode = p2_quickplay)
		if ScreenElementExists \{id = sd_songs_completed_p1}
			sd_songs_completed_p1 :GetTags
		endif
		if ScreenElementExists \{id = sd_combined_diff_text}
			my_diff = ($difficulty_list [<difficulty_index>])
			get_difficulty_text difficulty = <my_diff>
			if English
				<difficulty_text> = (<difficulty_text> + '!')
			endif
			SetScreenElementProps id = sd_combined_diff_text text = <difficulty_text> Scale = 1
			fit_text_in_rectangle \{id = sd_combined_diff_text
				dims = (165.0, 50.0)
				keep_ar = 1}
			sd_songs_completed_p1 :GetTags
			if GotParam \{diff_completion_text}
				SetScreenElementProps id = sd_songs_completed_p1 text = (<diff_completion_text> [<difficulty_index>])
				GetScreenElementDims \{id = sd_songs_completed_p1}
				if (<width> > 350)
					SetScreenElementProps \{id = sd_songs_completed_p1
						Scale = 0.75}
					fit_text_in_rectangle id = sd_songs_completed_p1 dims = ((350.0, 0.0) + <height> * (0.0, 0.75))
				endif
			endif
		endif
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		if (($menu_select_difficulty_p1_difficulty_index != $menu_select_difficulty_p2_difficulty_index) && ($g_showing_multiplayer_sd_screen = 1))
			sd_create_score_balancing_notice
		else
			if ScreenElementExists \{id = score_balancing_container}
				DestroyScreenElement \{id = score_balancing_container}
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
			if ScreenElementExists \{id = score_balancing_container}
				DestroyScreenElement \{id = score_balancing_container}
			endif
			return
		endif
	endif
	if ((<one> = 0 && <two> = 1) || (<one> = 1 && <two> = 0))
		<average_diff> = 'MEDIUM-EASY'
	elseif ((<one> = 0 && <two> = 2) || (<one> = 2 && <two> = 0))
		<average_diff> = 'MEDIUM'
	elseif ((<one> = 0 && <two> = 3) || (<one> = 3 && <two> = 0))
		<average_diff> = 'MEDIUM-HARD'
	elseif ((<one> = 1 && <two> = 2) || (<one> = 2 && <two> = 1))
		<average_diff> = 'MEDIUM-HARD'
	elseif ((<one> = 1 && <two> = 3) || (<one> = 3 && <two> = 1))
		<average_diff> = 'HARD'
	elseif ((<one> = 2 && <two> = 3) || (<one> = 3 && <two> = 2))
		<average_diff> = 'EXPERT-HARD'
	endif
	formatText TextName = score_balancing_text 'SCORE BALANCING IS ON---BASED ON %a DIFFICULTY' a = <average_diff>
	if ScreenElementExists \{id = score_balancing_container}
		DestroyScreenElement \{id = score_balancing_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = sd_container
		id = score_balancing_container
		Pos = (0.0, 0.0)}
	<z> = 20
	<Pos> = (640.0, 556.0)
	CreateScreenElement {
		Type = SpriteElement
		parent = score_balancing_container
		id = score_balancing_text_bg
		texture = Control_pill_body
		Pos = <Pos>
		just = [center center]
		rgba = (($g_menu_colors).dk_violet_grey)
		z_priority = <z>
	}
	CreateScreenElement {
		Type = TextElement
		parent = score_balancing_container
		Pos = (<Pos> + (0.0, -2.0))
		just = [center center]
		text = <score_balancing_text>
		rgba = (($g_menu_colors).lt_violet_grey)
		Scale = (0.45000002, 0.6)
		z_priority = (<z> + 1)
		font = text_a6
	}
	GetScreenElementDims id = <id>
	bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
	score_balancing_text_bg :SetProps dims = <bg_dims>
	CreateScreenElement {
		Type = SpriteElement
		parent = score_balancing_container
		texture = Control_pill_end
		Pos = (<Pos> - <width> * (0.5, 0.0))
		rgba = (($g_menu_colors).dk_violet_grey)
		just = [right center]
		flip_v
		z_priority = <z>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = score_balancing_container
		texture = Control_pill_end
		Pos = (<Pos> + <width> * (0.5, 0.0))
		rgba = (($g_menu_colors).dk_violet_grey)
		just = [left center]
		z_priority = <z>
	}
endscript

script select_difficulty_generic_sound 
	if ($0x39308823 = 1)
		return
	endif
	if (<Player> = 1)
		if ($g_sd_p1_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	else
		if ($g_sd_p2_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	endif
endscript

script temp_selected_difficulty \{Player = 1}
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if (<Player> = 1)
		if ($g_sd_p1_ready = 0)
			SetScreenElementProps \{id = vmenu_select_difficulty
				disable_pad_handling}
			Change current_difficulty = <diff>
			Change \{g_sd_p1_ready = 1}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				drop_in_ready_sign Player = <Player> from_sd = 1
			endif
		endif
	else
		if ($g_sd_p2_ready = 0)
			SetScreenElementProps \{id = vmenu_select_difficulty2
				disable_pad_handling}
			Change current_difficulty2 = <diff>
			Change \{g_sd_p2_ready = 1}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				drop_in_ready_sign Player = <Player> from_sd = 1
			endif
		endif
	endif
	if (($g_sd_p1_ready) && ($g_sd_p2_ready))
		if ($0x39308823 = 1)
			return
		endif
		Change \{0x39308823 = 1}
		Change \{transitions_locked = 1}
		Change \{menu_flow_locked = 1}
		Wait \{0.5
			Seconds}
		Change \{menu_flow_locked = 0}
		Change \{transitions_locked = 0}
		diff_index_p1 = ($difficulty_list_props.($current_difficulty).index)
		diff_index_p2 = ($difficulty_list_props.($current_difficulty2).index)
		min = <diff_index_p1>
		MathMin a = <diff_index_p1> b = <diff_index_p2>
		CastToInteger \{min}
		difficulty_index = <min>
		Change current_difficulty_coop = ($difficulty_list [<difficulty_index>])
		Change \{menu_select_difficulty_first_time_p1 = 0}
		Change \{menu_select_difficulty_first_time_p2 = 0}
		if ($coop_dlc_active = 1)
			ui_flow_manager_respond_to_action \{action = continue_coop
				create_params = {
					Player = 2
				}}
		else
			ui_flow_manager_respond_to_action \{action = continue
				create_params = {
					Player = 2
				}}
		endif
	endif
	Change \{transitions_locked = 0}
endscript

script menu_sd_back_up \{Player = 1}
	if ($0x39308823 = 1)
		return
	endif
	if ($menu_flow_locked = 1)
		return
	endif
	if (<Player> = 1)
		if ($g_sd_p1_ready = 1)
			SetScreenElementProps \{id = vmenu_select_difficulty
				enable_pad_handling}
			Change \{g_sd_p1_ready = 0}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_out_ready_sign params = {Player = <Player>}
			endif
		else
			Change \{0x39308823 = 1}
			menu_flow_go_back
		endif
	else
		if ($g_sd_p2_ready = 1)
			SetScreenElementProps \{id = vmenu_select_difficulty2
				enable_pad_handling}
			Change \{g_sd_p2_ready = 0}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_out_ready_sign params = {Player = <Player>}
			endif
		else
			Change \{0x39308823 = 1}
			menu_flow_go_back
		endif
	endif
endscript

script menu_sd_move_highlight 
	if ($0x39308823 = 1)
		return
	endif
	formatText checksumName = hilight_container 'sd_white_p%d' d = <Player>
	if ($sd_highlight_menuitem_morph = 1)
		DoScreenElementMorph id = <hilight_container> Pos = <Pos> time = <time>
	else
		DoScreenElementMorph id = <hilight_container> Pos = <Pos>
	endif
endscript
