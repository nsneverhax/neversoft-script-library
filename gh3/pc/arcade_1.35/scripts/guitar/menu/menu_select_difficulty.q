menu_select_difficulty_p1_difficulty_index = 0
menu_select_difficulty_p2_difficulty_index = 0
menu_select_difficulty_first_time = 0
sd_highlight_time = 0.05
menu_difficulty_fade_text = "Song will fade after:"

script create_select_difficulty_menu 
	disable_pause
	if ($current_num_players = 2)
		if NOT ($game_mode = p2_pro_faceoff)
			create_mp_select_difficulty_menu
			return
		endif
	endif
	SpawnScriptNow \{menu_music_on}
	base_menu_pos = (280.0, 235.0)
	main_menu_font = fontgrid_title_gh3
	menu_vspacing = 20
	completion_scale = 0.5
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
			printf "create_select_difficulty_menu: setting exclusive_device to %d (primary_controller=%e)" d = <exclusive_device> e = ($primary_controller)
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
		no_wrap = 1
	}
	if ($game_mode = p1_career || $game_mode = $p2_career)
	else
		if GotParam \{song}
			Change current_song = <song>
		endif
	endif
	set_focus_color \{rgba = [
			175
			0
			0
			250
		]}
	set_unfocus_color \{rgba = [
			210
			210
			210
			250
		]}
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
	p1_diff_index = 10
	displaySprite id = sd_white_p1 parent = sd_container tex = white Pos = ($g_sd_hilite_props [<p1_diff_index>].Pos) dims = (300.0, 37.0) rgba = [225 120 60 255]
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
	GetGlobalTags \{arcade_adjustments}
	if (<arcade_song_fading_enabled> = 0)
		displaySprite \{parent = sd_container
			tex = Toprockers_Tape_2
			Pos = (260.0, 550.0)
			z = 50
			rot_angle = 90
			dims = (212.0, 128.0)}
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
			dims = (212.0, 128.0)}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = sd_container
		id = balloon_container
		Pos = (215.0, 170.0)
		just = [
			center
			center
		]}
	displaySprite \{parent = balloon_container
		tex = Encore_Balloon
		Pos = (0.0, 0.0)
		z = 65
		flip_v
		Scale = (2.125, 2.0)
		rgba = [
			223
			223
			223
			255
		]
		just = [
			center
			center
		]}
	displayText \{parent = balloon_container
		font = text_a4
		Pos = (0.0, -30.0)
		z = 66
		Scale = 0.7
		noshadow
		rgba = [
			0
			0
			0
			255
		]
		text = "No need to fret,"
		just = [
			center
			center
		]}
	displayText \{parent = balloon_container
		font = text_a4
		Pos = (0.0, 0.0)
		z = 66
		Scale = 0.7
		noshadow
		rgba = [
			0
			0
			0
			255
		]
		text = "just strum!"
		just = [
			center
			center
		]}
	if ($menu_select_difficulty_p1_difficulty_index != 0)
		balloon_container :SetProps \{alpha = 0}
	endif
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		get_diff_completion_text
	endif
	if (<arcade_song_fading_enabled> != 0)
		CreateScreenElement \{Type = ContainerElement
			parent = sd_container
			id = hardexp_container
			Pos = (188.0, 620.0)
			just = [
				center
				center
			]}
		displaySprite \{parent = hardexp_container
			tex = Encore_Balloon
			Pos = (0.0, 0.0)
			Scale = (3.0, 2.0)
			z = 65
			rot_angle = 180
			rgba = [
				223
				223
				223
				255
			]
			just = [
				center
				center
			]}
		formatText \{TextName = encore_text_1
			"%s"
			s = $menu_difficulty_fade_text}
		get_song_fade_time_idx val = <arcade_beginner_fade_time>
		beginner_fade_idx = <fade_time_idx>
		get_song_fade_time_idx val = <arcade_easy_fade_time>
		easy_fade_idx = <fade_time_idx>
		get_song_fade_time_idx val = <arcade_medium_fade_time>
		medium_fade_idx = <fade_time_idx>
		get_song_fade_time_idx val = <arcade_hard_fade_time>
		hard_fade_idx = <fade_time_idx>
		get_song_fade_time_idx val = <arcade_expert_fade_time>
		expert_fade_idx = <fade_time_idx>
		formatText TextName = encore_text_2 "beginner: %s" s = ($shorter_fade_default_time_choice_strings [<beginner_fade_idx>])
		formatText TextName = encore_text_3 "easy: %s" s = ($shorter_fade_default_time_choice_strings [<easy_fade_idx>])
		formatText TextName = encore_text_4 "medium: %s" s = ($shorter_fade_default_time_choice_strings [<medium_fade_idx>])
		formatText TextName = encore_text_5 "hard: %s" s = ($shorter_fade_default_time_choice_strings [<hard_fade_idx>])
		formatText TextName = encore_text_6 "expert: %s" s = ($shorter_fade_default_time_choice_strings [<expert_fade_idx>])
		displayText {
			parent = hardexp_container
			id = encore_balloon_text_1
			font = text_a4
			Pos = (0.0, -35.0)
			z = 66
			Scale = 0.7
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_1>
			just = [center center]
		}
		displayText {
			parent = hardexp_container
			id = encore_balloon_text_2
			font = text_a4
			Pos = (0.0, -11.0)
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_2>
			just = [center center]
		}
		displayText {
			parent = hardexp_container
			id = encore_balloon_text_3
			font = text_a4
			Pos = (0.0, 3.0)
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_3>
			just = [center center]
		}
		displayText {
			parent = hardexp_container
			id = encore_balloon_text_4
			font = text_a4
			Pos = (0.0, 17.0)
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_4>
			just = [center center]
		}
		displayText {
			parent = hardexp_container
			id = encore_balloon_text_5
			font = text_a4
			Pos = (0.0, 31.0)
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_5>
			just = [center center]
		}
		displayText {
			parent = hardexp_container
			id = encore_balloon_text_6
			font = text_a4
			Pos = (0.0, 45.0)
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_6>
			just = [center center]
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		id = beginner_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "BEGINNER"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = 10 difficulty_index = 0}}
			{pad_choose selected_difficulty params = {diff = beginner}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	completion_pos = (490.0, 290.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		CreateScreenElement {
			Type = TextElement
			parent = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [right center]
			Pos = <completion_pos>
			text = (<diff_completion_text> [0])
			rgba = [175 100 55 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		id = easy_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "EASY"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = 11 difficulty_index = 1}}
			{pad_choose selected_difficulty params = {diff = easy}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	completion_pos = (490.0, 360.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		CreateScreenElement {
			Type = TextElement
			parent = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [right center]
			Pos = <completion_pos>
			text = (<diff_completion_text> [0])
			rgba = [175 100 55 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		id = medium_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "MEDIUM"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = 12 difficulty_index = 2}}
			{pad_choose selected_difficulty params = {diff = medium}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	<completion_pos> = (490.0, 430.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		CreateScreenElement {
			Type = TextElement
			parent = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [right center]
			Pos = <completion_pos>
			text = (<diff_completion_text> [1])
			rgba = [175 100 55 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		id = hard_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "HARD"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = 13 difficulty_index = 3}}
			{pad_choose selected_difficulty params = {diff = hard}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	<completion_pos> = (490.0, 500.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		CreateScreenElement {
			Type = TextElement
			parent = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [right center]
			Pos = <completion_pos>
			text = (<diff_completion_text> [2])
			rgba = [175 100 55 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		id = expert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "EXPERT"
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = 14 difficulty_index = 4}}
			{pad_choose selected_difficulty params = {diff = expert}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (210.0, 50.0)
	<completion_pos> = (490.0, 570.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		CreateScreenElement {
			Type = TextElement
			parent = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [right center]
			Pos = <completion_pos>
			text = (<diff_completion_text> [3])
			rgba = [175 100 55 255]
			z_priority = 100
		}
	endif
	Change \{disable_menu_sounds = 1}
	Change \{sd_highlight_time = 0.0}
	Change \{sd_highlight_menuitem_morph = 0}
	if ($right_player_continue = 1 && $multiplayer_continue_flag = 1)
		Change \{current_difficulty = $current_difficulty2}
	endif
	if ($left_player_continue = 0 && $right_player_continue = 0)
		Change \{current_difficulty = beginner}
	endif
	Change \{current_difficulty2 = beginner}
	if ($menu_select_difficulty_first_time = 1)
		if isXenon
			if GetGameProfileSetting \{gsid = 1}
				begin
				if (<game_setting> < 3)
					break
				endif
				if ScreenElementExists \{id = vmenu_select_difficulty}
					LaunchEvent \{Type = pad_down
						target = vmenu_select_difficulty}
				endif
				<game_setting> = (<game_setting> - 1)
				repeat
			endif
		endif
		Change \{menu_select_difficulty_first_time = 0}
	else
		launch_num = 0
		switch ($current_difficulty)
			case easy
			<launch_num> = 1
			case medium
			<launch_num> = 2
			case hard
			<launch_num> = 3
			case expert
			<launch_num> = 4
		endswitch
		if (<launch_num>)
			begin
			if ScreenElementExists \{id = vmenu_select_difficulty}
				LaunchEvent \{Type = pad_down
					target = vmenu_select_difficulty}
			endif
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
	elseif korean
		select_diff_tex = difficulty_title_en
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
	displaySprite \{parent = sd_container
		tex = Instrument_2p_Overlay
		Pos = (0.0, 0.0)
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
		z = 100
		pill_color = [
			0
			255
			0
			255
		]}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	SpawnScriptNow \{sd_watch_timer}
endscript

script destroy_select_difficulty_menu 
	KillSpawnedScript \{Name = sd_watch_timer}
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

script sd_watch_timer 
	SpawnScriptNow \{set_countdown_timer}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		break
	endif
	Wait \{1
		Second}
	repeat
	if ($current_num_players = 2)
		if ($game_mode = p2_pro_faceoff)
			Change \{menu_select_difficulty_p2_difficulty_index = $menu_select_difficulty_p1_difficulty_index}
		endif
		switch $menu_select_difficulty_p1_difficulty_index
			case 0
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 1
					diff = beginner
				}}
			case 1
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 1
					diff = easy
				}}
			case 2
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 1
					diff = medium
				}}
			case 3
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 1
					diff = hard
				}}
			case 4
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 1
					diff = expert
				}}
			default
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 1
					diff = easy
				}}
		endswitch
		switch $menu_select_difficulty_p2_difficulty_index
			case 0
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 2
					diff = beginner
				}}
			case 1
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 2
					diff = easy
				}}
			case 2
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 2
					diff = medium
				}}
			case 3
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 2
					diff = hard
				}}
			case 4
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 2
					diff = expert
				}}
			default
			SpawnScriptNow \{temp_selected_difficulty
				params = {
					Player = 2
					diff = easy
				}}
		endswitch
	else
		switch $menu_select_difficulty_p1_difficulty_index
			case 0
			SpawnScriptNow \{selected_difficulty
				params = {
					diff = beginner
				}}
			case 1
			SpawnScriptNow \{selected_difficulty
				params = {
					diff = easy
				}}
			case 2
			SpawnScriptNow \{selected_difficulty
				params = {
					diff = medium
				}}
			case 3
			SpawnScriptNow \{selected_difficulty
				params = {
					diff = hard
				}}
			case 4
			SpawnScriptNow \{selected_difficulty
				params = {
					diff = expert
				}}
			default
			SpawnScriptNow \{selected_difficulty
				params = {
					diff = easy
				}}
		endswitch
	endif
endscript

script selected_difficulty \{diff = beginner}
	printf "selected_difficulty: entered, diff=%s" s = <diff>
	if ($transitions_locked = 0)
		if ScreenElementExists \{id = vmenu_select_difficulty}
			LaunchEvent \{Type = unfocus
				target = vmenu_select_difficulty}
		endif
	endif
	Change current_difficulty = <diff>
	Change current_difficulty2 = <diff>
	if ($coop_dlc_active = 1)
		printf "selected_difficulty: %s, continuing with coop" s = <diff>
		ui_flow_manager_respond_to_action \{action = continue_coop}
	else
		printf "selected_difficulty: %s, continuing" s = <diff>
		ui_flow_manager_respond_to_action \{action = continue}
	endif
endscript
player_selecting_difficulty = 1
g_sd_hilite_props = [
	{
		Pos = (224.0, 275.0)
	}
	{
		Pos = (224.0, 325.0)
	}
	{
		Pos = (224.0, 375.0)
	}
	{
		Pos = (224.0, 425.0)
	}
	{
		Pos = (224.0, 475.0)
	}
	{
		Pos = (830.0, 275.0)
	}
	{
		Pos = (830.0, 325.0)
	}
	{
		Pos = (830.0, 375.0)
	}
	{
		Pos = (830.0, 425.0)
	}
	{
		Pos = (830.0, 475.0)
	}
	{
		Pos = (216.0, 235.0)
	}
	{
		Pos = (216.0, 305.0)
	}
	{
		Pos = (216.0, 375.0)
	}
	{
		Pos = (216.0, 445.0)
	}
	{
		Pos = (216.0, 515.0)
	}
]
g_sd_p1_ready = 0
g_sd_p2_ready = 0

script create_mp_select_difficulty_menu 
	printf ($net_can_send_approval = 1)
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = difficulty
		}
	endif
	SpawnScriptNow \{menu_music_on}
	printf \{"--- create_mp_select_difficulty_menu"}
	if ($game_mode = p2_career)
		Change \{rich_presence_context = presence_main_menu}
	endif
	create_menu_backdrop \{texture = Venue_BG}
	menu_pos_p1 = (240.0, 280.0)
	menu_pos_p2 = (850.0, 280.0)
	menu_font = text_a6
	if ($is_network_game = 1)
		event_handlers_p1 = [
			{pad_up select_difficulty_generic_sound params = {Player = 1 up}}
			{pad_down select_difficulty_generic_sound params = {Player = 1 down}}
			{pad_start menu_show_gamercard}
		]
	else
		event_handlers_p1 = [
			{pad_up select_difficulty_generic_sound params = {Player = 1 up}}
			{pad_down select_difficulty_generic_sound params = {Player = 1 down}}
		]
	endif
	event_handlers_p2 = [
		{pad_up select_difficulty_generic_sound params = {Player = 2 up}}
		{pad_down select_difficulty_generic_sound params = {Player = 2 down}}
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
		no_wrap = 1
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
		no_wrap = 1
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
	p2_diff_index = 5
	if ($is_network_game = 1)
		ui_print_gamertags \{pos1 = (380.0, 200.0)
			pos2 = (930.0, 200.0)
			dims = (350.0, 43.0)
			just1 = [
				center
				top
			]
			just2 = [
				center
				top
			]}
	else
		displayText parent = sd_container text = "player" font = <menu_font> Pos = (260.0, 160.0) Scale = 1 rgba = [205 105 50 255] noshadow
		GetScreenElementDims id = <id>
		if (<width> > 150)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) Pos = (260.0, 160.0)
		endif
		displayText parent = sd_container text = "player" font = <menu_font> Pos = (860.0, 160.0) Scale = 1 rgba = [205 105 50 255] noshadow
		GetScreenElementDims id = <id>
		if (<width> > 150)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) Pos = (860.0, 160.0)
		endif
		displayText \{parent = sd_container
			text = "1"
			font = text_a11_Large
			Pos = (320.0, 180.0)
			Scale = 1
			rgba = [
				205
				105
				50
				255
			]
			noshadow}
		displayText \{parent = sd_container
			text = "2"
			font = text_a11_Large
			Pos = (920.0, 180.0)
			Scale = 1
			rgba = [
				205
				105
				50
				255
			]
			noshadow}
	endif
	displaySprite id = sd_white_p1 parent = sd_container tex = white Pos = ($g_sd_hilite_props [<p1_diff_index>].Pos) dims = (228.0, 48.0) rgba = [225 120 60 255]
	displaySprite id = sd_white_p2 parent = sd_container tex = white Pos = ($g_sd_hilite_props [<p2_diff_index>].Pos) dims = (228.0, 48.0) rgba = [225 120 60 255]
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
	GetGlobalTags \{arcade_adjustments}
	if (<arcade_song_fading_enabled> = 0)
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
	endif
	if ($game_mode = p2_career)
		get_diff_completion_text \{for_p2_career = 1}
		initial_pos = (635.0, 592.0)
		rot = 0
		displayText {
			id = sd_songs_completed_p1
			parent = sd_container
			Pos = <initial_pos>
			Scale = 0.75
			font = text_a6
			rgba = [240 220 175 255]
			rot = <rot>
			just = [center center]
			noshadow
			z = 15
		}
		displaySprite {
			parent = sd_container
			id = diff_select_completed_bg
			tex = Control_pill_body
			Pos = (<initial_pos> + (0.0, -3.0))
			just = [center center]
			rgba = [225 120 60 255]
			z = 10
		}
		sd_songs_completed_p1 :SetTags diff_completion_text = <diff_completion_text>
		<width> = 500
		completed_dims = (<width> * (1.0, 0.0) + (20.0, 32.0))
		diff_select_completed_bg :SetProps dims = <completed_dims>
		displaySprite {
			parent = sd_container
			tex = Control_pill_end
			Pos = ((625.0, 589.0) - <width> * (0.5, 0.0))
			rgba = [225 120 60 255]
			just = [right center]
			flip_v
			z = 10
		}
		displaySprite {
			parent = sd_container
			tex = Control_pill_end
			Pos = ((645.0, 589.5) + <width> * (0.5, 0.0))
			rgba = [225 120 60 255]
			just = [left center]
			z = 10
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
				225
				120
				60
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
		text = "BEGINNER"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {Player = 1 index = 0 difficulty_index = 0}}
			{pad_choose <choose_script> params = {Player = 1 diff = beginner}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "EASY"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {Player = 1 index = 1 difficulty_index = 1}}
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
		text = "MEDIUM"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {Player = 1 index = 2 difficulty_index = 2}}
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
		text = "HARD"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {Player = 1 index = 3 difficulty_index = 3}}
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
		text = "EXPERT"
		just = [left top]
		event_handlers = [
			{focus <highlight_script> params = {Player = 1 index = 4 difficulty_index = 4}}
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
		text = "BEGINNER"
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 5 difficulty_index = 0}}
			{pad_choose temp_selected_difficulty params = {Player = 2 diff = beginner}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = "EASY"
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 6 difficulty_index = 1}}
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
		text = "MEDIUM"
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 7 difficulty_index = 2}}
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
		text = "HARD"
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 8 difficulty_index = 3}}
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
		text = "EXPERT"
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 9 difficulty_index = 4}}
			{pad_choose temp_selected_difficulty params = {Player = 2 diff = expert}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	displaySprite \{parent = sd_container
		tex = Instrument_2p_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50
		rgba = [
			105
			56
			7
			160
		]}
	if ($is_network_game = 1)
		create_ready_icons \{pos1 = (260.0, 150.0)
			pos2 = (880.0, 130.0)}
	else
		create_ready_icons \{pos1 = (260.0, 200.0)
			pos2 = (880.0, 180.0)}
	endif
	if ($game_mode = p2_career)
		displaySprite \{parent = sd_container
			id = diff_select_helper
			tex = white
			Pos = (640.0, 620.0)
			just = [
				center
				center
			]
			rgba = [
				240
				215
				175
				255
			]
			z = 10}
		displayText \{parent = sd_container
			Pos = (640.0, 622.0)
			just = [
				center
				center
			]
			text = "Don't wimp out! Lowest difficulty determines cash and unlocks!"
			rgba = [
				225
				120
				60
				255
			]
			Scale = (0.5, 0.6)
			z = 11
			font = text_a6
			noshadow}
		GetScreenElementDims id = <id>
		if (<width> > 400)
			SetScreenElementProps id = <id> Scale = (0.5, 0.6)
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 0.6))
		endif
		GetScreenElementDims id = <id>
		bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
		diff_select_helper :SetProps dims = <bg_dims>
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = sd_container
		id = balloon_container_left
		Pos = (170.0, 210.0)
		just = [
			center
			center
		]}
	displaySprite \{parent = balloon_container_left
		tex = Encore_Balloon
		Pos = (0.0, 0.0)
		z = 65
		flip_v
		Scale = (2.125, 2.0)
		rgba = [
			223
			223
			223
			255
		]
		just = [
			center
			center
		]}
	displayText \{parent = balloon_container_left
		font = text_a4
		Pos = (0.0, -30.0)
		z = 66
		Scale = 0.7
		noshadow
		rgba = [
			0
			0
			0
			255
		]
		text = "No need to fret,"
		just = [
			center
			center
		]}
	displayText \{parent = balloon_container_left
		font = text_a4
		Pos = (0.0, 0.0)
		z = 66
		Scale = 0.7
		noshadow
		rgba = [
			0
			0
			0
			255
		]
		text = "just strum!"
		just = [
			center
			center
		]}
	if ($menu_select_difficulty_p1_difficulty_index != 0)
		balloon_container_left :SetProps \{alpha = 0}
	endif
	if (<arcade_song_fading_enabled> != 0)
		CreateScreenElement \{Type = ContainerElement
			parent = sd_container
			id = hardexp_container_left
			Pos = (348.0, 75.0)
			just = [
				center
				center
			]}
		displaySprite \{parent = hardexp_container_left
			tex = Encore_Balloon
			Pos = (0.0, 0.0)
			Scale = (3.0, 2.0)
			z = 65
			rot_angle = 180
			rgba = [
				223
				223
				223
				255
			]
			just = [
				center
				center
			]
			flip_h
			flip_v}
		formatText \{TextName = encore_text_1
			"%s"
			s = $menu_difficulty_fade_text}
		get_song_fade_time_idx val = <arcade_beginner_fade_time>
		beginner_fade_idx = <fade_time_idx>
		get_song_fade_time_idx val = <arcade_easy_fade_time>
		easy_fade_idx = <fade_time_idx>
		get_song_fade_time_idx val = <arcade_medium_fade_time>
		medium_fade_idx = <fade_time_idx>
		get_song_fade_time_idx val = <arcade_hard_fade_time>
		hard_fade_idx = <fade_time_idx>
		get_song_fade_time_idx val = <arcade_expert_fade_time>
		expert_fade_idx = <fade_time_idx>
		formatText TextName = encore_text_2 "beginner: %s" s = ($shorter_fade_default_time_choice_strings [<beginner_fade_idx>])
		formatText TextName = encore_text_3 "easy: %s" s = ($shorter_fade_default_time_choice_strings [<easy_fade_idx>])
		formatText TextName = encore_text_4 "medium: %s" s = ($shorter_fade_default_time_choice_strings [<medium_fade_idx>])
		formatText TextName = encore_text_5 "hard: %s" s = ($shorter_fade_default_time_choice_strings [<hard_fade_idx>])
		formatText TextName = encore_text_6 "expert: %s" s = ($shorter_fade_default_time_choice_strings [<expert_fade_idx>])
		root_text_pos = (0.0, -50.0)
		text_pos_offset1 = (0.0, 24.0)
		text_pos_offset2 = (0.0, 14.0)
		cur_pos = <root_text_pos>
		displayText {
			parent = hardexp_container_left
			id = encore_balloon_left_text_1
			font = text_a4
			Pos = <cur_pos>
			z = 66
			Scale = 0.7
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_1>
			just = [center center]
		}
		<cur_pos> = (<cur_pos> + <text_pos_offset1>)
		displayText {
			parent = hardexp_container_left
			id = encore_balloon_left_text_2
			font = text_a4
			Pos = <cur_pos>
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_2>
			just = [center center]
		}
		<cur_pos> = (<cur_pos> + <text_pos_offset2>)
		displayText {
			parent = hardexp_container_left
			id = encore_balloon_left_text_3
			font = text_a4
			Pos = <cur_pos>
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_3>
			just = [center center]
		}
		<cur_pos> = (<cur_pos> + <text_pos_offset2>)
		displayText {
			parent = hardexp_container_left
			id = encore_balloon_left_text_4
			font = text_a4
			Pos = <cur_pos>
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_4>
			just = [center center]
		}
		<cur_pos> = (<cur_pos> + <text_pos_offset2>)
		displayText {
			parent = hardexp_container_left
			id = encore_balloon_left_text_5
			font = text_a4
			Pos = <cur_pos>
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_5>
			just = [center center]
		}
		<cur_pos> = (<cur_pos> + <text_pos_offset2>)
		displayText {
			parent = hardexp_container_left
			id = encore_balloon_left_text_6
			font = text_a4
			Pos = <cur_pos>
			z = 66
			Scale = 0.4
			noshadow
			rgba = [0 0 0 255]
			text = <encore_text_6>
			just = [center center]
		}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = sd_container
		id = balloon_container_right
		Pos = (1090.0, 210.0)
		just = [
			center
			center
		]}
	displaySprite \{parent = balloon_container_right
		tex = Encore_Balloon
		Pos = (0.0, 0.0)
		z = 65
		Scale = (2.125, 2.0)
		rgba = [
			223
			223
			223
			255
		]
		just = [
			center
			center
		]}
	displayText \{parent = balloon_container_right
		font = text_a4
		Pos = (0.0, -30.0)
		z = 66
		Scale = 0.7
		noshadow
		rgba = [
			0
			0
			0
			255
		]
		text = "No need to fret,"
		just = [
			center
			center
		]}
	displayText \{parent = balloon_container_right
		font = text_a4
		Pos = (0.0, 0.0)
		z = 66
		Scale = 0.7
		noshadow
		rgba = [
			0
			0
			0
			255
		]
		text = "just strum!"
		just = [
			center
			center
		]}
	if ($menu_select_difficulty_p2_difficulty_index != 0)
		balloon_container_right :SetProps \{alpha = 0}
	endif
	if ($right_player_continue = 1 && $multiplayer_continue_flag = 0)
		Change \{current_difficulty2 = $current_difficulty}
	endif
	if ($left_player_continue = 0)
		Change \{current_difficulty = beginner}
	endif
	if ($right_player_continue = 0)
		Change \{current_difficulty2 = beginner}
	endif
	Change \{disable_menu_sounds = 1}
	Change \{sd_highlight_menuitem_morph = 0}
	if ($is_network_game = 0)
		launch_num = 0
		switch ($current_difficulty)
			case easy
			<launch_num> = 1
			case medium
			<launch_num> = 2
			case hard
			<launch_num> = 3
			case expert
			<launch_num> = 4
		endswitch
		if (<launch_num>)
			begin
			if ScreenElementExists \{id = vmenu_select_difficulty}
				LaunchEvent \{Type = pad_down
					target = vmenu_select_difficulty}
			endif
			repeat <launch_num>
		endif
		<launch_num> = 0
		switch ($current_difficulty2)
			case easy
			<launch_num> = 1
			case medium
			<launch_num> = 2
			case hard
			<launch_num> = 3
			case expert
			<launch_num> = 4
		endswitch
		if (<launch_num>)
			begin
			if ScreenElementExists \{id = vmenu_select_difficulty}
				LaunchEvent \{Type = pad_down
					target = vmenu_select_difficulty2}
			endif
			repeat <launch_num>
		endif
	endif
	if NOT ($game_mode = p2_career)
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
		elseif korean
			select_diff_tex = difficulty_title_en
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
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message \{current_state = difficulty
			action = approval}
		Change \{net_can_send_approval = 0}
	endif
	SpawnScriptNow \{sd_watch_timer}
endscript
sd_highlight_menuitem_morph = 0

script sd_highlight_menuitem \{Player = 1
		index = 0
		time = 0.05}
	time = ($sd_highlight_time)
	if (<Player> = 1)
		old_index = $menu_select_difficulty_p1_difficulty_index
		Change menu_select_difficulty_p1_difficulty_index = <difficulty_index>
	else
		old_index = $menu_select_difficulty_p2_difficulty_index
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
	if ($game_mode = p2_career)
		if ScreenElementExists \{id = sd_songs_completed_p1}
			sd_songs_completed_p1 :GetTags
		endif
		if ScreenElementExists \{id = sd_combined_diff_text}
			my_diff = ($difficulty_list [<difficulty_index>])
			get_difficulty_text difficulty = <my_diff>
			if English
				<difficulty_text> = (<difficulty_text> + "!")
			endif
			SetScreenElementProps id = sd_combined_diff_text text = <difficulty_text> Scale = 1
			fit_text_in_rectangle \{id = sd_combined_diff_text
				dims = (165.0, 50.0)
				keep_ar = 1}
			sd_songs_completed_p1 :GetTags
			SetScreenElementProps id = sd_songs_completed_p1 text = (<diff_completion_text> [<difficulty_index>])
			GetScreenElementDims \{id = sd_songs_completed_p1}
			if (<width> > 350)
				SetScreenElementProps \{id = sd_songs_completed_p1
					Scale = 0.75}
				fit_text_in_rectangle id = sd_songs_completed_p1 dims = ((350.0, 0.0) + <height> * (0.0, 0.75))
			endif
		endif
	endif
	if ($current_num_players = 2 && $game_mode != p2_pro_faceoff)
		if (<Player> = 1)
			if (<old_index> != $menu_select_difficulty_p1_difficulty_index)
				if ($menu_select_difficulty_p1_difficulty_index = 0)
					balloon_container_left :SetProps \{Scale = 0.125
						alpha = 0}
					balloon_container_left :DoMorph \{Scale = 1
						alpha = 1
						time = 0.1}
				else
					balloon_container_left :SetProps \{alpha = 0}
				endif
			endif
		else
			if (<old_index> != $menu_select_difficulty_p2_difficulty_index)
				if ($menu_select_difficulty_p2_difficulty_index = 0)
					balloon_container_right :SetProps \{Scale = 0.125
						alpha = 0}
					balloon_container_right :DoMorph \{Scale = 1
						alpha = 1
						time = 0.1}
				else
					balloon_container_right :SetProps \{alpha = 0}
				endif
			endif
		endif
	else
		if (<old_index> != $menu_select_difficulty_p1_difficulty_index)
			if ($menu_select_difficulty_p1_difficulty_index = 0)
				balloon_container :SetProps \{Scale = 0.125
					alpha = 0}
				balloon_container :DoMorph \{Scale = 1
					alpha = 1
					time = 0.1}
			else
				balloon_container :SetProps \{alpha = 0}
			endif
		endif
	endif
endscript

script select_difficulty_generic_sound 
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

script increment_difficulty_audit 
	printf "increment_difficulty_audit: called with song = %s, diff = %t" s = <song> t = <diff>
	GetArraySize \{$gh3_arcade_tier_songs}
	array_count = 0
	begin
	if (<song> = ($gh3_arcade_tier_songs [<array_count>]))
		printf "increment_difficulty_audit: song found, %s = %t" s = <song> t = ($gh3_arcade_tier_songs [<array_count>])
		temp_song_name = ($gh3_arcade_tier_songs [<array_count>])
		break
	endif
	Increment \{array_count}
	repeat <array_Size>
	printf "increment_difficulty_audit: getting songname ($permanent_songlist_props.<temp_song_name>.name)=%s" s = ($permanent_songlist_props.<temp_song_name>.Name)
	formatText checksumName = song_stats 'arcade_song_stats_%s' s = ($permanent_songlist_props.<temp_song_name>.Name)
	GetGlobalTags <song_stats>
	GetGlobalTags \{arcade_audits}
	switch (<diff>)
		case beginner
		printf "beginner_played = %d" d = <beginner_played>
		Increment \{beginner_played}
		Increment \{arcade_total_beginner}
		case easy
		printf "easy_played = %d" d = <easy_played>
		Increment \{easy_played}
		Increment \{arcade_total_easy}
		case medium
		printf "medium_played = %d" d = <medium_played>
		Increment \{medium_played}
		Increment \{arcade_total_medium}
		case hard
		printf "hard_played = %d" d = <hard_played>
		Increment \{hard_played}
		Increment \{arcade_total_hard}
		case expert
		printf "<expert_played> = %d" d = <expert_played>
		Increment \{expert_played}
		Increment \{arcade_total_expert}
	endswitch
	SetGlobalTags <song_stats> params = {
		beginner_played = <beginner_played>
		easy_played = <easy_played>
		medium_played = <medium_played>
		hard_played = <hard_played>
		expert_played = <expert_played>
	}
	SetGlobalTags arcade_audits params = {
		arcade_total_beginner = <arcade_total_beginner>
		arcade_total_easy = <arcade_total_easy>
		arcade_total_medium = <arcade_total_medium>
		arcade_total_hard = <arcade_total_hard>
		arcade_total_expert = <arcade_total_expert>
	}
endscript

script temp_selected_difficulty \{Player = 1
		diff = beginner}
	if (<Player> = 1)
		if ($g_sd_p1_ready = 0)
			Change current_difficulty = <diff>
			Change \{g_sd_p1_ready = 1}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_in_ready_sign params = {Player = <Player>}
			endif
			SetScreenElementProps \{id = vmenu_select_difficulty
				disable_pad_handling}
		endif
	else
		if ($g_sd_p2_ready = 0)
			Change current_difficulty2 = <diff>
			Change \{g_sd_p2_ready = 1}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_in_ready_sign params = {Player = <Player>}
			endif
			if NOT ($game_mode = p2_pro_faceoff)
				SetScreenElementProps \{id = vmenu_select_difficulty2
					disable_pad_handling}
			endif
		endif
	endif
	if (($g_sd_p1_ready) && ($g_sd_p2_ready))
		KillSpawnedScript \{Name = sd_watch_timer}
		Change \{menu_flow_locked = 1}
		Wait \{0.5
			Seconds}
		Change \{menu_flow_locked = 0}
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
endscript

script menu_sd_back_up \{Player = 1}
	if ($menu_flow_locked = 1)
		return
	endif
	if (<Player> = 1)
		if ($g_sd_p1_ready = 1)
			Change \{g_sd_p1_ready = 0}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_out_ready_sign params = {Player = <Player>}
			endif
			SetScreenElementProps \{id = vmenu_select_difficulty
				enable_pad_handling}
		else
			menu_flow_go_back
		endif
	else
		if ($g_sd_p2_ready = 1)
			Change \{g_sd_p2_ready = 0}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_out_ready_sign params = {Player = <Player>}
			endif
			SetScreenElementProps \{id = vmenu_select_difficulty2
				enable_pad_handling}
		else
			menu_flow_go_back
		endif
	endif
endscript

script menu_sd_move_highlight 
	formatText checksumName = hilight_container 'sd_white_p%d' d = <Player>
	if ($sd_highlight_menuitem_morph = 1)
		DoScreenElementMorph id = <hilight_container> Pos = <Pos> time = <time>
	else
		DoScreenElementMorph id = <hilight_container> Pos = <Pos>
	endif
endscript
