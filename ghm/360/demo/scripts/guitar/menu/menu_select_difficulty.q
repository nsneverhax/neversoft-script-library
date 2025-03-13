menu_select_difficulty_p1_difficulty_index = 0
menu_select_difficulty_p2_difficulty_index = 0
menu_select_difficulty_first_time = 1
sd_highlight_time = 0.05

script create_select_difficulty_menu 
	disable_pause
	change \{rich_presence_context = presence_menus}
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
	spawnscriptnow \{menu_music_on}
	base_menu_pos = (500.0, 375.0)
	main_menu_font = fontgrid_title_a1
	menu_vspacing = 20
	completion_scale = 0.5
	menu_font = fontgrid_text_a6
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_pro_faceoff)
			removeparameter \{exclusive_device}
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
	if ($game_mode = p1_career || $game_mode = p2_career)
	else
		if gotparam \{song}
			change current_song = <song>
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
	setscreenelementprops \{id = current_menu
		internal_just = [
			left
			top
		]}
	createscreenelement \{type = containerelement
		parent = root_window
		id = sd_container
		pos = (220.0, 130.0)}
	p1_diff_index = 8
	displaysprite id = sd_white_p1 parent = sd_container tex = white pos = ($g_sd_hilite_props [<p1_diff_index>].pos) dims = (300.0, 37.0) rgba = [225 120 60 255]
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		get_diff_completion_text
	endif
	getplayerinfo \{1
		part}
	if NOT (($game_mode = p1_career) || ($game_mode = p2_career) || <part> = drum || <part> = vocals)
		diff_dims = (210.0, 38.0)
		sd_highlight_index = 12
		createscreenelement {
			type = textelement
			parent = current_menu
			id = rhythm_title_text
			font = <menu_font>
			rgba = [60 35 20 255]
			text = qs(0x74d6a0a0)
			just = [left top]
			font_spacing = 0
			event_handlers = [
				{focus sd_highlight_menuitem params = {player = 1 index = (<sd_highlight_index> + 4) difficulty_index = 4}}
				{pad_choose selected_difficulty params = {diff = easy_rhythm}}
			]
		}
		fit_text_in_rectangle id = <id> dims = <diff_dims>
	else
		diff_dims = (210.0, 50.0)
		sd_highlight_index = 8
	endif
	createscreenelement {
		type = textelement
		parent = current_menu
		id = easy_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x8d657387)
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = <sd_highlight_index> difficulty_index = 0}}
			{pad_choose selected_difficulty params = {diff = easy}}
		]
	}
	fit_text_in_rectangle id = <id> dims = <diff_dims>
	completion_pos = (490.0, 290.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [0])
			rgba = [175 100 55 255]
			z_priority = 100
		}
	endif
	createscreenelement {
		type = textelement
		parent = current_menu
		id = medium_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x6ef11a01)
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = (<sd_highlight_index> + 1) difficulty_index = 1}}
			{pad_choose selected_difficulty params = {diff = medium}}
		]
	}
	fit_text_in_rectangle id = <id> dims = <diff_dims>
	<completion_pos> = (490.0, 360.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [1])
			rgba = [175 100 55 255]
			z_priority = 100
		}
	endif
	createscreenelement {
		type = textelement
		parent = current_menu
		id = hard_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x51b06d2f)
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = (<sd_highlight_index> + 2) difficulty_index = 2}}
			{pad_choose selected_difficulty params = {diff = hard}}
		]
	}
	fit_text_in_rectangle id = <id> dims = <diff_dims>
	<completion_pos> = (490.0, 430.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [2])
			rgba = [175 100 55 255]
			z_priority = 100
		}
	endif
	createscreenelement {
		type = textelement
		parent = current_menu
		id = expert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x334908ac)
		just = [left top]
		font_spacing = 0
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 1 index = (<sd_highlight_index> + 3) difficulty_index = 3}}
			{pad_choose selected_difficulty params = {diff = expert}}
		]
	}
	fit_text_in_rectangle id = <id> dims = <diff_dims>
	<completion_pos> = (490.0, 500.0)
	if (($game_mode = p1_career) || ($game_mode = p2_career))
		createscreenelement {
			type = textelement
			parent = sd_container
			font = <main_menu_font>
			scale = <completion_scale>
			just = [right center]
			pos = <completion_pos>
			text = (<diff_completion_text> [3])
			rgba = [175 100 55 255]
			z_priority = 100
		}
	endif
	change \{disable_menu_sounds = 1}
	change \{sd_highlight_time = 0.0}
	change \{sd_highlight_menuitem_morph = 0}
	if ($menu_select_difficulty_first_time = 1)
		if isxenon
			if getgameprofilesetting \{gsid = 1}
				begin
				if (<game_setting> < 3)
					break
				endif
				launchevent \{type = pad_down
					target = current_menu}
				<game_setting> = (<game_setting> - 1)
				repeat
			endif
		endif
		change \{menu_select_difficulty_first_time = 0}
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
			launchevent \{type = pad_down
				target = current_menu}
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
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	launchevent \{type = focus
		target = current_menu}
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
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ($transitions_locked = 0)
		launchevent \{type = unfocus
			target = current_menu}
	endif
	change structurename = player1_status difficulty = <diff>
	change structurename = player2_status difficulty = <diff>
	if gotparam \{double_kick}
		setplayerinfo 1 double_kick_drum = <double_kick>
		setplayerinfo 2 double_kick_drum = <double_kick>
	endif
	if ($player1_status.controller < 4)
		setarrayelement arrayname = default_difficulty globalarray index = ($player1_status.controller) newvalue = <diff>
	endif
	if ($top_rockers_enabled)
		generic_event_replace \{state = uistate_top_rockers
			data = {
				for_options = 1
			}}
	elseif ($coop_dlc_active = 1)
		generic_event_replace \{state = uistate_choose_part}
	elseif ($practice_enabled)
		generic_event_choose \{state = uistate_select_song_section}
	else
		switch ($game_mode)
			case p1_quickplay
			soundevent \{event = song_affirmation}
			generic_event_replace no_sound state = uistate_play_song no_sound data = {can_change_level = <can_change_level>}
			case p1_career
			career_select_difficulty_flow_state_func
			case p2_faceoff
			case p2_pro_faceoff
			case p2_coop
			generic_event_choose \{state = uistate_play_song
				no_sound}
			case p2_battle
			get_current_battle_first_play
			generic_event_choose \{state = uistate_play_song}
		endswitch
	endif
	if screenelementexists \{id = difficultyinterface}
		difficultyinterface :se_setprops \{alpha = 0.0}
	endif
endscript

script setdrumplayers 
	player = 1
	begin
	getplayerinfo <player> controller
	if isdrumcontroller controller = <controller>
		setplayerinfo <player> part = drum
	endif
	player = (<player> + 1)
	repeat $current_num_players
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
	{
		pos = (216.0, 295.0)
	}
	{
		pos = (216.0, 352.0)
	}
	{
		pos = (216.0, 410.0)
	}
	{
		pos = (216.0, 468.0)
	}
	{
		pos = (216.0, 236.0)
	}
]
g_sd_p1_ready = 0
g_sd_p2_ready = 0

script create_mp_select_difficulty_menu 
	spawnscriptnow \{menu_music_on}
	printf \{qs(0xaf73f64e)}
	if ($game_mode = p2_career)
		change \{rich_presence_context = presence_menus}
	endif
	create_menu_backdrop \{texture = menu_venue_bg}
	menu_pos_p1 = (240.0, 280.0)
	menu_pos_p2 = (850.0, 280.0)
	menu_font = fontgrid_text_a6
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
	createscreenelement \{type = containerelement
		parent = root_window
		id = sd_container
		pos = (0.0, 0.0)}
	displaysprite \{parent = sd_container
		tex = 2p_difficulty_poster
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
		displaytext parent = sd_container text = qs(0x4a26bcf3) font = <menu_font> pos = (260.0, 160.0) scale = 1 rgba = [205 105 50 255] noshadow
		getscreenelementdims id = <id>
		if (<width> > 150)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) pos = (260.0, 160.0)
		endif
		displaytext parent = sd_container text = qs(0x4a26bcf3) font = <menu_font> pos = (860.0, 160.0) scale = 1 rgba = [205 105 50 255] noshadow
		getscreenelementdims id = <id>
		if (<width> > 150)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> dims = ((150.0, 0.0) + ((0.0, 1.0) * <height>)) pos = (860.0, 160.0)
		endif
		displaytext \{parent = sd_container
			text = qs(0x22ee76e7)
			font = fontgrid_text_a11_large
			pos = (320.0, 180.0)
			scale = 1
			rgba = [
				205
				105
				50
				255
			]
			noshadow}
		displaytext \{parent = sd_container
			text = qs(0x09c32524)
			font = fontgrid_text_a11_large
			pos = (920.0, 180.0)
			scale = 1
			rgba = [
				205
				105
				50
				255
			]
			noshadow}
	endif
	displaysprite id = sd_white_p1 parent = sd_container tex = white pos = ($g_sd_hilite_props [<p1_diff_index>].pos) dims = (228.0, 48.0) rgba = [225 120 60 255]
	displaysprite id = sd_white_p2 parent = sd_container tex = white pos = ($g_sd_hilite_props [<p2_diff_index>].pos) dims = (228.0, 48.0) rgba = [225 120 60 255]
	displaysprite \{parent = sd_container
		tex = tape_01
		pos = (1150.0, 0.0)
		dims = (212.0, 128.0)
		z = 50
		rot_angle = 90}
	displaysprite \{parent = sd_container
		tex = tape_01
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
		tex = tape_02
		pos = (230.0, 550.0)
		z = 50
		rot_angle = 90
		dims = (212.0, 128.0)}
	displaysprite \{parent = sd_container
		tex = tape_02
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
	if ($game_mode = p2_career || $game_mode = p2_quickplay)
		if ($game_mode = p2_career)
			get_diff_completion_text \{for_p2_career = 1}
		endif
		initial_pos = (635.0, 592.0)
		rot = 0
		displaytext {
			id = sd_songs_completed_p1
			parent = sd_container
			pos = <initial_pos>
			scale = 0.75
			font = fontgrid_text_a6
			rgba = [240 220 175 255]
			rot = <rot>
			just = [center center]
			noshadow
			z = 15
		}
		if ($game_mode = p2_career)
			displaysprite {
				parent = sd_container
				id = diff_select_completed_bg
				tex = helper_pill_body
				pos = (<initial_pos> + (0.0, -3.0))
				just = [center center]
				rgba = [225 120 60 255]
				z = 10
			}
			sd_songs_completed_p1 :settags diff_completion_text = <diff_completion_text>
			<width> = 500
			completed_dims = (<width> * (1.0, 0.0) + (20.0, 32.0))
			diff_select_completed_bg :se_setprops dims = <completed_dims>
			displaysprite {
				parent = sd_container
				tex = helper_pill_end
				pos = ((625.0, 589.0) - <width> * (0.5, 0.0))
				rgba = [225 120 60 255]
				just = [right center]
				flip_v
				z = 10
			}
			displaysprite {
				parent = sd_container
				tex = helper_pill_end
				pos = ((645.0, 589.5) + <width> * (0.5, 0.0))
				rgba = [225 120 60 255]
				just = [left center]
				z = 10
			}
		endif
		displaytext \{parent = sd_container
			id = sd_combined_diff_text
			pos = (640.0, 500.0)
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
		parent = current_menu
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x8d657387)
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
		parent = current_menu
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x6ef11a01)
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
		parent = current_menu
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x51b06d2f)
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
		parent = current_menu
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x334908ac)
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
		parent = current_menu2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x8d657387)
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
		parent = current_menu2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x6ef11a01)
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
		parent = current_menu2
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x51b06d2f)
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
		parent = current_menu2
		id = elxpert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		text = qs(0x334908ac)
		just = [left top]
		event_handlers = [
			{focus sd_highlight_menuitem params = {player = 2 index = 7 difficulty_index = 3}}
			{pad_choose temp_selected_difficulty params = {player = 2 diff = expert}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle id = <id> dims = (180.0, 50.0)
	displaysprite \{parent = sd_container
		tex = light_overlay_3spots
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
		create_ready_icons \{pos1 = (260.0, 150.0)
			pos2 = (880.0, 130.0)}
	else
		create_ready_icons \{pos1 = (260.0, 200.0)
			pos2 = (880.0, 180.0)}
	endif
	if ($game_mode = p2_career)
		displaysprite \{parent = sd_container
			id = diff_select_helper
			tex = white
			pos = (640.0, 620.0)
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
		displaytext \{parent = sd_container
			pos = (640.0, 622.0)
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
			scale = (0.5, 0.6)
			z = 11
			font = fontgrid_text_a6
			noshadow}
		getscreenelementdims id = <id>
		if (<width> > 400)
			setscreenelementprops id = <id> scale = (0.5, 0.6)
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 0.6))
		endif
		getscreenelementdims id = <id>
		bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
		diff_select_helper :se_setprops dims = <bg_dims>
	endif
	change \{disable_menu_sounds = 1}
	change \{sd_highlight_menuitem_morph = 0}
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
			launchevent \{type = pad_down
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
			launchevent \{type = pad_down
				target = current_menu2}
			repeat <launch_num>
		endif
	endif
	if NOT ($game_mode = p2_career || $game_mode = p2_quickplay)
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
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	if screenelementexists \{id = current_menu2}
		launchevent \{type = focus
			target = current_menu2}
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
	if ($game_mode = p2_career || $game_mode = p2_quickplay)
		if screenelementexists \{id = sd_songs_completed_p1}
			sd_songs_completed_p1 :gettags
		endif
		if screenelementexists \{id = sd_combined_diff_text}
			my_diff = ($difficulty_list [<difficulty_index>])
			get_difficulty_text difficulty = <my_diff>
			if english
				<difficulty_text> = (<difficulty_text> + qs(0x682c64b6))
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
	endif
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
	if ($transitions_locked = 1)
		return
	endif
	if (<player> = 1)
		if ($g_sd_p1_ready = 0)
			change structurename = player1_status difficulty = <diff>
			change \{g_sd_p1_ready = 1}
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				runscriptonscreenelement id = <ready_container> drop_in_ready_sign params = {player = <player>}
			endif
			setscreenelementprops \{id = current_menu
				disable_pad_handling}
		endif
	else
		if ($g_sd_p2_ready = 0)
			change structurename = player2_status difficulty = <diff>
			change \{g_sd_p2_ready = 1}
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				runscriptonscreenelement id = <ready_container> drop_in_ready_sign params = {player = <player>}
			endif
			setscreenelementprops \{id = current_menu2
				disable_pad_handling}
		endif
	endif
	if (($g_sd_p1_ready) && ($g_sd_p2_ready))
		change \{menu_flow_locked = 1}
		wait \{0.5
			seconds}
		change \{menu_flow_locked = 0}
		diff_index_p1 = ($difficulty_list_props.($player1_status.difficulty).index)
		diff_index_p2 = ($difficulty_list_props.($player2_status.difficulty).index)
		min = <diff_index_p1>
		mathmin a = <diff_index_p1> b = <diff_index_p2>
		casttointeger \{min}
		difficulty_index = <min>
		change current_difficulty_coop = ($difficulty_list [<difficulty_index>])
		setdrumplayers
		if ($coop_dlc_active = 1)
			generic_event_choose \{state = uistate_select_part
				data = {
					player = 2
				}}
		else
			switch ($game_mode)
				case p1_quickplay
				generic_event_choose \{state = uistate_setlist}
				case p1_career
				career_select_difficulty_flow_state_func
				case p2_career
				case p2_quickplay
				create_coop_split_off_flow_for_character_select
				case p2_faceoff
				case p2_pro_faceoff
				case p2_coop
				generic_event_choose \{state = uistate_play_song}
				case p2_battle
				get_current_battle_first_play
				generic_event_choose \{state = uistate_play_song}
			endswitch
		endif
	endif
endscript

script menu_sd_back_up \{player = 1}
	if ($menu_flow_locked = 1)
		return
	endif
	if (<player> = 1)
		if ($g_sd_p1_ready = 1)
			change \{g_sd_p1_ready = 0}
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				runscriptonscreenelement id = <ready_container> drop_out_ready_sign params = {player = <player>}
			endif
			setscreenelementprops \{id = current_menu
				enable_pad_handling}
		else
			generic_event_back
		endif
	else
		if ($g_sd_p2_ready = 1)
			change \{g_sd_p2_ready = 0}
			formattext checksumname = ready_container 'ready_container_p%d' d = <player>
			if screenelementexists id = <ready_container>
				runscriptonscreenelement id = <ready_container> drop_out_ready_sign params = {player = <player>}
			endif
			setscreenelementprops \{id = current_menu2
				enable_pad_handling}
		else
			generic_event_back
		endif
	endif
endscript

script menu_sd_move_highlight 
	formattext checksumname = hilight_container 'sd_white_p%d' d = <player>
	if ($sd_highlight_menuitem_morph = 1)
		legacydoscreenelementmorph id = <hilight_container> pos = <pos> time = <time>
	else
		legacydoscreenelementmorph id = <hilight_container> pos = <pos>
	endif
endscript
