menu_select_difficulty_p1_difficulty_index = 0
menu_select_difficulty_p2_difficulty_index = 0
menu_select_difficulty_first_time = 1
sd_highlight_time = 0.05

script create_select_difficulty_menu_for_practice 
	create_select_difficulty_menu \{practice = 1}
endscript

script create_select_difficulty_menu \{practice = 0}
	disable_pause
	Change \{rich_presence_context = presence_menus}
	if NOT ($game_mode = p2_pro_faceoff)
		if (($current_num_players = 2) || ($menu_mp_select_mode_is_friendly_faceoff = 1))
			if (($is_network_game) = 1)
				exclusive_device = ($primary_controller)
				create_mp_select_difficulty_menu
				return
			else
				create_mp_select_difficulty_menu
				return
			endif
		endif
	endif
	frontend_load_soundcheck
	setup_bg_viewport
	restore_dummy_bg_camera
	if NOT (<practice> = 1)
		SpawnScriptNow \{menu_music_on}
	endif
	base_menu_pos = (500.0, 375.0)
	main_menu_font = fontgrid_title_a1
	menu_vspacing = 20
	completion_scale = 0.5
	menu_font = fontgrid_text_a6
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_pro_faceoff)
			RemoveParameter \{exclusive_device}
			get_all_exclusive_devices
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	new_menu {
		scrollid = scrolling_select_difficulty
		vmenuid = current_menu
		menu_pos = <base_menu_pos>
		use_backdrop = 0
		spacing = <menu_vspacing>
		exclusive_device = <exclusive_device>
		use_all_controllers
	}
	create_menu_backdrop \{texture = menu_bg_1}
	if ($game_mode = gh4_p1_career || $game_mode = gh4_p2_career)
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
	SetScreenElementProps \{id = current_menu
		internal_just = [
			left
			top
		]}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = sd_container
		Pos = (220.0, 130.0)}
	p1_diff_index = 8
	displaySprite id = sd_white_p1 parent = sd_container tex = white Pos = ($g_sd_hilite_props [<p1_diff_index>].Pos) dims = (300.0, 37.0) rgba = [225 120 60 255]
	if (($game_mode = gh4_p1_career) || ($game_mode = gh4_p2_career))
		get_diff_completion_text
	endif
	getplayerinfo \{1
		part}
	if NOT (($game_mode = gh4_p1_career) || ($game_mode = gh4_p2_career) || <part> = drum || <part> = vocals)
		diff_dims = (210.0, 38.0)
		sd_highlight_index = 12
		CreateScreenElement {
			Type = TextElement
			parent = current_menu
			id = rhythm_title_text
			font = <menu_font>
			rgba = [60 35 20 255]
			text = qs(0x74d6a0a0)
			just = [left top]
			font_spacing = 0
			event_handlers = [
				{focus sd_highlight_menuitem params = {Player = 1 index = (<sd_highlight_index> + 4) difficulty_index = 4}}
				{pad_choose selected_difficulty params = {diff = beginner}}
			]
		}
		fit_text_in_rectangle id = <id> dims = <diff_dims>
	else
		diff_dims = (210.0, 50.0)
		sd_highlight_index = 8
	endif
	CreateScreenElement {
		Type = TextElement
		parent = current_menu
		id = easy_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x8d657387)
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = <sd_highlight_index> difficulty_index = 0}}
			{pad_choose selected_difficulty params = {diff = easy}}
		]
	}
	fit_text_in_rectangle id = <id> dims = <diff_dims>
	completion_pos = (490.0, 290.0)
	if (($game_mode = gh4_p1_career) || ($game_mode = gh4_p2_career))
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
		parent = current_menu
		id = medium_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x6ef11a01)
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = (<sd_highlight_index> + 1) difficulty_index = 1}}
			{pad_choose selected_difficulty params = {diff = medium}}
		]
	}
	fit_text_in_rectangle id = <id> dims = <diff_dims>
	<completion_pos> = (490.0, 360.0)
	if (($game_mode = gh4_p1_career) || ($game_mode = gh4_p2_career))
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
		parent = current_menu
		id = hard_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x51b06d2f)
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = (<sd_highlight_index> + 2) difficulty_index = 2}}
			{pad_choose selected_difficulty params = {diff = hard}}
		]
	}
	fit_text_in_rectangle id = <id> dims = <diff_dims>
	<completion_pos> = (490.0, 430.0)
	if (($game_mode = gh4_p1_career) || ($game_mode = gh4_p2_career))
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
		parent = current_menu
		id = expert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x334908ac)
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 1 index = (<sd_highlight_index> + 3) difficulty_index = 3}}
			{pad_choose selected_difficulty params = {diff = expert}}
		]
	}
	fit_text_in_rectangle id = <id> dims = <diff_dims>
	<completion_pos> = (490.0, 500.0)
	if (($game_mode = gh4_p1_career) || ($game_mode = gh4_p2_career))
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
	if ($menu_select_difficulty_first_time = 1)
		if isXenon
			if GetGameProfileSetting \{gsid = 1}
				begin
				if (<game_setting> < 3)
					break
				endif
				LaunchEvent \{Type = pad_down
					target = current_menu}
				<game_setting> = (<game_setting> - 1)
				repeat
			endif
		endif
		Change \{menu_select_difficulty_first_time = 0}
	else
		launch_num = 0
		switch ($player1_status.difficulty)
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
				target = current_menu}
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
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = current_menu}
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
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($top_rockers_enabled = 0)
		if ui_event_exists_in_stack \{above = 'select_instrument'
				Name = 'setlist'}
			0xf7e0f992 \{Wait}
		endif
	endif
	if ($transitions_locked = 0)
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	Change structurename = player1_status difficulty = <diff>
	Change structurename = player2_status difficulty = <diff>
	if GotParam \{double_kick}
		setplayerinfo 1 double_kick_drum = <double_kick>
		setplayerinfo 2 double_kick_drum = <double_kick>
	endif
	if ($player1_status.controller < 4)
		SetArrayElement ArrayName = default_difficulty globalarray index = ($player1_status.controller) NewValue = <diff>
	endif
	if ($0xc7e670d7 = 1)
		generic_event_choose \{state = uistate_play_song}
		return
	elseif ($top_rockers_enabled)
		generic_event_replace \{state = uistate_top_rockers
			data = {
				for_options = 1
			}}
	elseif ($coop_dlc_active = 1)
		generic_event_replace \{state = uistate_choose_part
			no_sound}
	elseif ($practice_enabled)
		generic_event_choose \{state = uistate_select_song_section
			no_sound}
	else
		switch ($game_mode)
			case p1_quickplay
			SoundEvent \{event = song_affirmation}
			generic_event_replace state = uistate_play_song no_sound data = {can_change_level = <can_change_level>}
			case gh4_p1_career
			career_select_difficulty_flow_state_func
			case p2_pro_faceoff
			case p2_coop
			generic_event_choose \{state = uistate_play_song
				no_sound}
		endswitch
	endif
	if ScreenElementExists \{id = difficultyinterface}
		difficultyinterface :se_setprops \{alpha = 0.0}
	endif
endscript

script setdrumplayers 
	Player = 1
	begin
	getplayerinfo <Player> controller
	if isdrumcontroller controller = <controller>
		setplayerinfo <Player> part = drum
	endif
	Player = (<Player> + 1)
	repeat $current_num_players
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
		Pos = (216.0, 295.0)
	}
	{
		Pos = (216.0, 352.0)
	}
	{
		Pos = (216.0, 410.0)
	}
	{
		Pos = (216.0, 468.0)
	}
	{
		Pos = (216.0, 236.0)
	}
]
g_sd_p1_ready = 0
g_sd_p2_ready = 0

script create_mp_select_difficulty_menu 
	SpawnScriptNow \{menu_music_on}

	if ($game_mode = gh4_p2_career)
		Change \{rich_presence_context = presence_menus}
	endif
	create_menu_backdrop \{texture = menu_venue_bg}
	menu_pos_p1 = (240.0, 280.0)
	menu_pos_p2 = (850.0, 280.0)
	menu_font = fontgrid_text_a6
	if ($is_network_game = 1)
		event_handlers_p1 = [
			{pad_up select_difficulty_generic_sound params = {Player = 1 up}}
			{pad_down select_difficulty_generic_sound params = {Player = 1 down}}
			{pad_back net_difficulty_go_back params = {Player = 1 index = menu_select_difficulty_p1_difficulty_index}}
			{pad_start menu_show_gamercard}
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
		vmenuid = current_menu
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
		vmenuid = current_menu2
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
		tex = 2p_difficulty_poster
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
		displayText parent = sd_container text = qs(0x4a26bcf3) font = <menu_font> Pos = (260.0, 160.0) Scale = 1 rgba = [205 105 50 255] noshadow
		GetScreenElementDims id = <id>
		if (<width> > 150)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) Pos = (260.0, 160.0)
		endif
		displayText parent = sd_container text = qs(0x4a26bcf3) font = <menu_font> Pos = (860.0, 160.0) Scale = 1 rgba = [205 105 50 255] noshadow
		GetScreenElementDims id = <id>
		if (<width> > 150)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) Pos = (860.0, 160.0)
		endif
		displayText \{parent = sd_container
			text = qs(0x22ee76e7)
			font = fontgrid_text_a11_large
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
			text = qs(0x09c32524)
			font = fontgrid_text_a11_large
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
		tex = tape_01
		Pos = (1150.0, 0.0)
		dims = (212.0, 128.0)
		z = 50
		rot_angle = 90}
	displaySprite \{parent = sd_container
		tex = tape_01
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
		tex = tape_02
		Pos = (230.0, 550.0)
		z = 50
		rot_angle = 90
		dims = (212.0, 128.0)}
	displaySprite \{parent = sd_container
		tex = tape_02
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
	if ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
		if ($game_mode = gh4_p2_career)
			get_diff_completion_text \{for_p2_career = 1}
		endif
		initial_pos = (635.0, 592.0)
		rot = 0
		displayText {
			id = sd_songs_completed_p1
			parent = sd_container
			Pos = <initial_pos>
			Scale = 0.75
			font = fontgrid_text_a6
			rgba = [240 220 175 255]
			rot = <rot>
			just = [center center]
			noshadow
			z = 15
		}
		if ($game_mode = gh4_p2_career)
			displaySprite {
				parent = sd_container
				id = diff_select_completed_bg
				tex = helper_pill_body
				Pos = (<initial_pos> + (0.0, -3.0))
				just = [center center]
				rgba = [225 120 60 255]
				z = 10
			}
			sd_songs_completed_p1 :SetTags diff_completion_text = <diff_completion_text>
			<width> = 500
			completed_dims = (<width> * (1.0, 0.0) + (20.0, 32.0))
			diff_select_completed_bg :se_setprops dims = <completed_dims>
			displaySprite {
				parent = sd_container
				tex = helper_pill_end
				Pos = ((625.0, 589.0) - <width> * (0.5, 0.0))
				rgba = [225 120 60 255]
				just = [right center]
				flip_v
				z = 10
			}
			displaySprite {
				parent = sd_container
				tex = helper_pill_end
				Pos = ((645.0, 589.5) + <width> * (0.5, 0.0))
				rgba = [225 120 60 255]
				just = [left center]
				z = 10
			}
		endif
		displayText \{parent = sd_container
			id = sd_combined_diff_text
			Pos = (640.0, 500.0)
			just = [
				center
				center
			]
			font = fontgrid_text_a6
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
		parent = current_menu
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x8d657387)
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
		parent = current_menu
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x6ef11a01)
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
		parent = current_menu
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x51b06d2f)
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
		parent = current_menu
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x334908ac)
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
		parent = current_menu2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x8d657387)
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
		parent = current_menu2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x6ef11a01)
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
		parent = current_menu2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x51b06d2f)
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
		parent = current_menu2
		id = elxpert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x334908ac)
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {Player = 2 index = 7 difficulty_index = 3}}
			{pad_choose temp_selected_difficulty params = {Player = 2 diff = expert}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	if ($is_network_game = 1)
		create_ready_icons \{pos1 = (260.0, 150.0)
			pos2 = (880.0, 130.0)}
	else
		create_ready_icons \{pos1 = (260.0, 200.0)
			pos2 = (880.0, 180.0)}
	endif
	if ($game_mode = gh4_p2_career)
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
			text = qs(0xde58cc84)
			rgba = [
				225
				120
				60
				255
			]
			Scale = (0.5, 0.6)
			z = 11
			font = fontgrid_text_a6
			noshadow}
		GetScreenElementDims id = <id>
		if (<width> > 400)
			SetScreenElementProps id = <id> Scale = (0.5, 0.6)
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 0.6))
		endif
		GetScreenElementDims id = <id>
		bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
		diff_select_helper :se_setprops dims = <bg_dims>
	endif
	Change \{disable_menu_sounds = 1}
	Change \{sd_highlight_menuitem_morph = 0}
	if ($is_network_game = 0)
		launch_num = 0
		switch ($player1_status.difficulty)
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
				target = current_menu}
			repeat <launch_num>
		endif
		<launch_num> = 0
		switch ($player2_status.difficulty)
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
				target = current_menu2}
			repeat <launch_num>
		endif
	endif
	if NOT ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
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
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	if ScreenElementExists \{id = current_menu2}
		LaunchEvent \{Type = focus
			target = current_menu2}
	endif
endscript
sd_highlight_menuitem_morph = 0

script sd_highlight_menuitem \{Player = 1
		index = 0
		time = 0.05}
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
	if ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
		if ScreenElementExists \{id = sd_songs_completed_p1}
			sd_songs_completed_p1 :GetTags
		endif
		if ScreenElementExists \{id = sd_combined_diff_text}
			my_diff = ($difficulty_list [<difficulty_index>])
			get_difficulty_text difficulty = <my_diff>
			if English
				<difficulty_text> = (<difficulty_text> + qs(0x682c64b6))
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

script temp_selected_difficulty \{Player = 1}
	if ($transitions_locked = 1)
		return
	endif
	if (<Player> = 1)
		if ($g_sd_p1_ready = 0)
			Change structurename = player1_status difficulty = <diff>
			Change \{g_sd_p1_ready = 1}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_in_ready_sign params = {Player = <Player>}
			endif
			SetScreenElementProps \{id = current_menu
				disable_pad_handling}
		endif
	else
		if ($g_sd_p2_ready = 0)
			Change structurename = player2_status difficulty = <diff>
			Change \{g_sd_p2_ready = 1}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_in_ready_sign params = {Player = <Player>}
			endif
			SetScreenElementProps \{id = current_menu2
				disable_pad_handling}
		endif
	endif
	if (($g_sd_p1_ready) && ($g_sd_p2_ready))
		Change menu_flow_locked = ($menu_flow_locked + 1)
		Wait \{0.5
			Seconds}
		Change menu_flow_locked = ($menu_flow_locked - 1)
		diff_index_p1 = ($difficulty_list_props.($player1_status.difficulty).index)
		diff_index_p2 = ($difficulty_list_props.($player2_status.difficulty).index)
		min = <diff_index_p1>
		MathMin a = <diff_index_p1> b = <diff_index_p2>
		CastToInteger \{min}
		difficulty_index = <min>
		Change current_difficulty_coop = ($difficulty_list [<difficulty_index>])
		setdrumplayers
		if ($coop_dlc_active = 1)
			generic_event_choose \{state = uistate_select_part
				data = {
					Player = 2
				}
				no_sound}
		else
			switch ($game_mode)
				case p1_quickplay
				generic_event_choose \{state = uistate_setlist
					no_sound}
				case gh4_p1_career
				career_select_difficulty_flow_state_func
				case gh4_p2_career
				case p2_quickplay
				create_coop_split_off_flow_for_character_select
				case p2_pro_faceoff
				case p2_coop
				generic_event_choose \{state = uistate_play_song
					no_sound}
			endswitch
		endif
	endif
endscript

script menu_sd_back_up \{Player = 1}
	if ($menu_flow_locked > 0)
		return
	endif
	if (<Player> = 1)
		if ($g_sd_p1_ready = 1)
			Change \{g_sd_p1_ready = 0}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_out_ready_sign params = {Player = <Player>}
			endif
			SetScreenElementProps \{id = current_menu
				enable_pad_handling}
		else
			generic_event_back
		endif
	else
		if ($g_sd_p2_ready = 1)
			Change \{g_sd_p2_ready = 0}
			formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
			if ScreenElementExists id = <ready_container>
				RunScriptOnScreenElement id = <ready_container> drop_out_ready_sign params = {Player = <Player>}
			endif
			SetScreenElementProps \{id = current_menu2
				enable_pad_handling}
		else
			generic_event_back
		endif
	endif
endscript

script menu_sd_move_highlight 
	formatText checksumName = hilight_container 'sd_white_p%d' d = <Player>
	if ($sd_highlight_menuitem_morph = 1)
		legacydoscreenelementmorph id = <hilight_container> Pos = <Pos> time = <time>
	else
		legacydoscreenelementmorph id = <hilight_container> Pos = <Pos>
	endif
endscript
