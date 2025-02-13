g_cs_jumped_p1 = 0
g_cs_jumped_p2 = 0
g_character_select_icon_index_p1 = 0
g_character_select_icon_index_p2 = 0
g_cs_scroll_ready_p1 = 1
g_cs_scroll_ready_p2 = 1
g_cs_choose_ready_p1 = 0
g_cs_choose_ready_p2 = 0
g_cs_select_normal_w = 64
g_cs_select_normal_h = 128
g_cs_select_extra_w = 89
g_cs_select_extra_h = 179
g_cs_hilite_rot1 = 180
g_cs_hilite_rot2 = 360
g_cs_num_icons = 11
g_cs_safe_to_scroll_p1 = 0
g_cs_safe_to_scroll_p2 = 0
cs_total_guitarists_p1 = 0
cs_total_guitarists_p2 = 0
g_gs_p1_chosen = 0
g_gs_p2_chosen = 0
character_select_highlighted_character_p1 = 0
character_select_highlighted_character_p2 = 0
character_select_highlighted_character_p2_dirty = 0
block_choose_player = 0

script cs_go_back \{Player = 1}
	clean_up_user_control_helpers
	shut_down_character_hub
	destroy_gamertags
	if (<Player> = 1)
		shut_down_flow_manager \{Player = 2}
		ui_flow_manager_respond_to_action \{action = go_back}
	else
		shut_down_flow_manager \{Player = 1}
		shut_down_flow_manager \{Player = 2}
		if ($game_mode = p2_career)
			progression_push_current
			start_flow_manager \{flow_state = coop_career_select_difficulty_fs}
		else
			start_flow_manager \{flow_state = mp_select_mode_fs}
		endif
	endif
endscript

script create_net_game_info_panel \{parent = user_control_container
		Pos = (520.0, 420.0)
		window_width = 250
		window_body_height = 40
		base_z = -1}
	if NOT GotParam \{parent}
		SoftAssert \{"Did not get a parent for the net_game_info_panel!"}
		return
	endif
	if ScreenElementExists \{id = net_game_info_panel}
		DestroyScreenElement \{id = net_game_info_panel}
	endif
	bg_fill_color = [0 0 0 200]
	CreateScreenElement {
		Type = ContainerElement
		id = net_game_info_panel
		parent = <parent>
		Pos = <Pos>
		just = [left top]
		z_priority = -10000
	}
	cont_id = <id>
	text_scale = 0.5
	side_offset = 25
	text_pos_rt = ((0.0, 25.0) + <side_offset> * (1.0, 0.0))
	text_space = 0
	text_z = 0.1
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		font = fontgrid_title_gh3
		text = "Settings"
		Scale = 0.8
		Pos = (<text_pos_rt> + (<window_width> / 2 - <side_offset>) * (1.0, 0.0))
		just = [center top]
		z_priority = (<base_z> + <text_z>)
	}
	GetScreenElementDims id = <id>
	text_pos_rt = (<text_pos_rt> + (0.0, 1.0) * <height> + (0.0, 1.0) * <text_space>)
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		font = fontgrid_title_gh3
		text = "Mode:"
		Scale = <text_scale>
		Pos = <text_pos_rt>
		just = [left top]
		z_priority = (<base_z> + <text_z>)
	}
	fit_text_into_menu_item id = <id> max_width = 70
	get_game_mode_ui_string game_mode = ($game_mode)
	printstruct <...>
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		font = fontgrid_title_gh3
		text = <ui_string>
		Scale = <text_scale>
		Pos = (<text_pos_rt> + (<window_width> -2 * <side_offset>) * (1.0, 0.0))
		just = [right top]
		z_priority = (<base_z> + <text_z>)
	}
	fit_text_into_menu_item id = <id> max_width = 120
	if checksumequals a = ($game_mode) b = p2_pro_faceoff
		GetScreenElementDims id = <id>
		text_pos_rt = (<text_pos_rt> + (0.0, 1.0) * <height> + (0.0, 1.0) * <text_space>)
		window_body_height = 80
		CreateScreenElement {
			Type = TextElement
			parent = <cont_id>
			font = fontgrid_title_gh3
			text = "Difficulty:"
			Scale = <text_scale>
			Pos = <text_pos_rt>
			just = [left top]
			z_priority = (<base_z> + <text_z>)
		}
		fit_text_into_menu_item id = <id> max_width = 120
		get_difficulty_ui_string difficulty = ($current_difficulty)
		printstruct <...>
		CreateScreenElement {
			Type = TextElement
			parent = <cont_id>
			font = fontgrid_title_gh3
			text = <ui_string>
			Scale = <text_scale>
			Pos = (<text_pos_rt> + (<window_width> -2 * <side_offset>) * (1.0, 0.0))
			just = [right top]
			z_priority = (<base_z> + <text_z>)
		}
		fit_text_into_menu_item id = <id> max_width = 70
	endif
	GetScreenElementDims id = <id>
	text_pos_rt = (<text_pos_rt> + (0.0, 1.0) * <height> + (0.0, 1.0) * <text_space>)
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		font = fontgrid_title_gh3
		text = "Num Songs:"
		Scale = <text_scale>
		Pos = <text_pos_rt>
		just = [left top]
		z_priority = (<base_z> + <text_z>)
	}
	get_number_of_songs
	formatText TextName = num_songs_text "%d" d = <num_songs>
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		font = fontgrid_title_gh3
		text = <num_songs_text>
		Scale = <text_scale>
		Pos = (<text_pos_rt> + (<window_width> -2 * <side_offset>) * (1.0, 0.0))
		just = [right top]
		z_priority = (<base_z> + <text_z>)
	}
	top_dims = ((0.0, 64.0) + <window_width> * (1.0, 0.0))
	top_pos = (0.0, 0.0)
	displaySprite {
		parent = <cont_id>
		tex = window_frame_cap
		rgba = ($online_medium_blue)
		Pos = <top_pos>
		just = [left top]
		z_priority = <base_z>
	}
	scale_element_to_size {
		id = <id>
		target_width = (<top_dims>.(1.0, 0.0))
		target_height = (<top_dims>.(0.0, 1.0))
	}
	displaySprite {
		parent = <cont_id>
		tex = window_fill_cap
		rgba = <bg_fill_color>
		Pos = <top_pos>
		just = [left top]
		z_priority = <base_z>
	}
	scale_element_to_size {
		id = <id>
		target_width = (<top_dims>.(1.0, 0.0))
		target_height = (<top_dims>.(0.0, 1.0))
	}
	GetScreenElementDims id = <id>
	middle_pos = (<top_pos> + <height> * (0.0, 1.0))
	middle_dims = ((0.0, 1.0) * <window_body_height> + <window_width> * (1.0, 0.0))
	displaySprite {
		parent = <cont_id>
		tex = window_frame_body_tall
		rgba = ($online_medium_blue)
		Pos = <middle_pos>
		just = [left top]
		z_priority = <base_z>
		flip_h
	}
	scale_element_to_size {
		id = <id>
		target_width = (<middle_dims>.(1.0, 0.0))
		target_height = (<middle_dims>.(0.0, 1.0))
	}
	displaySprite {
		parent = <cont_id>
		tex = window_fill_body_large
		rgba = <bg_fill_color>
		Pos = <middle_pos>
		just = [left top]
		z_priority = <base_z>
		flip_h
	}
	scale_element_to_size {
		id = <id>
		target_width = (<middle_dims>.(1.0, 0.0))
		target_height = (<middle_dims>.(0.0, 1.0))
	}
	GetScreenElementDims id = <id>
	bottom_pos = (<middle_pos> + <height> * (0.0, 1.0))
	bottom_dims = ((0.0, 64.0) + <window_width> * (1.0, 0.0))
	displaySprite {
		parent = <cont_id>
		tex = window_frame_cap
		rgba = ($online_medium_blue)
		Pos = <bottom_pos>
		just = [left top]
		z_priority = <base_z>
		flip_h
	}
	scale_element_to_size {
		id = <id>
		target_width = (<bottom_dims>.(1.0, 0.0))
		target_height = (<bottom_dims>.(0.0, 1.0))
	}
	displaySprite {
		parent = <cont_id>
		tex = window_fill_cap
		rgba = <bg_fill_color>
		Pos = <bottom_pos>
		just = [left top]
		z_priority = <base_z>
		flip_h
	}
	scale_element_to_size {
		id = <id>
		target_width = (<bottom_dims>.(1.0, 0.0))
		target_height = (<bottom_dims>.(0.0, 1.0))
	}
	GetScreenElementDims id = <id>
	cont_dims = (<bottom_pos> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
	SetScreenElementProps {
		id = <cont_id>
		dims = <cont_dims>
	}
endscript

script create_character_select_menu \{Player = 1}
	printf "create_character_select_menu: player=%d" d = <Player>
	Change \{block_choose_player = 0}
	SpawnScriptNow \{menu_music_on}
	if ($is_network_game)
		mark_unsafe_for_shutdown
		Change \{winport_block_net_pause = 1}
		Change \{gHandlingWindowClosed = 0}
	endif
	if (($is_network_game = 1) && (<Player> = 1) && ($net_can_send_approval = 1))
		if NOT ($net_current_flow_state = character_hub)
			net_lobby_state_message {
				current_state = ($net_current_flow_state)
				action = request
				request_state = character_hub
			}
			blah = 1
		endif
	endif
	Change \{menu_flow_locked = 1}
	destroy_character_select_menu Player = <Player>
	formatText checksumName = safe_to_scroll 'g_cs_safe_to_scroll_p%d' d = <Player>
	Change GlobalName = <safe_to_scroll> NewValue = 0
	Change \{rich_presence_context = presence_character_select}
	if ($is_network_game = 1)
		KillSpawnedScript \{Name = net_hub_stream}
		if ($player2_present)
			SpawnScriptNow \{net_hub_stream}
		endif
		if (<Player> = 2)
			net_match_send_available_items
		endif
	endif
	if ($current_num_players = 1)
		if ($num_user_control_helpers = 0)
			printf \{"create_character_select_menu: adding user control helpers"
				d = $num_user_control_helpers}
			add_user_control_helper \{text = "SELECT"
				button = green
				z = 100}
			add_user_control_helper \{text = "UP/DOWN"
				button = strumbar
				z = 100}
			add_user_control_helper \{text = "TOGGLE LEFTY"
				button = orange
				z = 100}
		endif
	else
		if (<Player> = 2)
			if ($num_user_control_helpers = 0)
				printf \{"create_character_select_menu: adding user control helpers"
					d = $num_user_control_helpers}
				add_user_control_helper \{text = "SELECT"
					button = green
					z = 100}
				add_user_control_helper \{text = "UP/DOWN"
					button = strumbar
					z = 100}
				add_user_control_helper \{text = "TOGGLE LEFTY"
					button = orange
					z = 100}
			endif
		endif
	endif
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		NetSessionFunc \{Obj = voice
			func = entering_free_skate}
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	cs_menu_pos = (400.0, 120.0)
	if (($is_network_game) = 1)
		cs_event_handlers = [
			{pad_up cs_scroll_up_or_down params = {Player = <Player> Dir = up}}
			{pad_down cs_scroll_up_or_down params = {Player = <Player> Dir = down}}
			{pad_choose character_select_choose params = {Player = <Player>}}
			{pad_start menu_show_gamercard}
			{pad_L1 rtlefty_toggle_flip params = {which_player = <Player>}}
		]
	else
		cs_event_handlers = [
			{pad_up cs_scroll_up_or_down params = {Player = <Player> Dir = up}}
			{pad_down cs_scroll_up_or_down params = {Player = <Player> Dir = down}}
			{pad_choose character_select_choose params = {Player = <Player>}}
			{pad_L1 rtlefty_toggle_flip params = {which_player = <Player>}}
		]
	endif
	if (<Player> = 2)
		new_menu {
			scrollid = scrolling_character_select_p2
			vmenuid = vmenu_character_select_p2
			menu_pos = <cs_menu_pos>
			use_backdrop = (0)
			font = fontgrid_title_gh3
			font_size = 1.0
			event_handlers = <cs_event_handlers>
			no_wrap
			exclusive_device = <exclusive_dev>
			no_focus = 1
		}
		if (($is_network_game) = 1)
			if ScreenElementExists \{id = vmenu_character_select_p2}
				LaunchEvent \{Type = unfocus
					target = vmenu_character_select_p2}
			endif
		endif
	else
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_character_select_p1
				vmenuid = vmenu_character_select_p1
				Name = <menu_title_text>
				menu_pos = <cs_menu_pos>
				use_backdrop = (0)
				font = fontgrid_title_gh3
				font_size = 1.0
				event_handlers = <cs_event_handlers>
				no_wrap
				no_focus = 1
			}
			get_current_first_play
			if (<first_play>)
				if ScreenElementExists \{id = vmenu_character_select_p1}
					LaunchEvent \{Type = unfocus
						target = vmenu_character_select_p1}
				endif
			endif
		else
			if ($is_network_game)
				CreateScreenElement \{Type = ContainerElement
					parent = root_window
					id = menu_container
					Pos = (0.0, 0.0)}
			endif
			new_menu {
				scrollid = scrolling_character_select_p1
				vmenuid = vmenu_character_select_p1
				menu_pos = <cs_menu_pos>
				use_backdrop = (0)
				font = fontgrid_title_gh3
				font_size = 1.0
				event_handlers = <cs_event_handlers>
				no_wrap
				exclusive_device = <exclusive_dev>
				no_focus = 1
			}
		endif
	endif
	if ($right_player_continue = 1 && $multiplayer_continue_flag = 1)
		if find_profile_by_id id = ($player2_status.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = 1
			if GetGlobalTags <default_characterguitartag> noassert = 1
				if (($player2_status.band_member) = GUITARIST)
					printf "1p: old: csg %a ii %b" a = <current_selected_guitar> b = ($player2_status.instrument_id)
					SetGlobalTags <default_characterguitartag> params = {current_selected_guitar = ($player2_status.instrument_id)}
				else
					printf "1p: old: csb %a ii %b" a = <current_selected_bass> b = ($player2_status.instrument_id)
					SetGlobalTags <default_characterguitartag> params = {current_selected_bass = ($player2_status.instrument_id)}
				endif
				printf "1p: old: co %a o %b cs %c s %d" a = <current_outfit> b = ($player2_status.outfit) c = <current_style> d = ($player2_status.style)
				SetGlobalTags <default_characterguitartag> params = {current_outfit = ($player2_status.outfit) current_style = ($player2_status.style)}
				if GetGlobalTags <default_characterguitartag> noassert = 1
					if (<current_instrument> = guitar)
						printf "1p: new: csg %a ii %b" a = <current_selected_guitar> b = ($player2_status.instrument_id)
					else
						printf "1p: new: csb %a ii %b" a = <current_selected_bass> b = ($player2_status.instrument_id)
					endif
					printf "1p: new: co %a o %b cs %c s %d" a = <current_outfit> b = ($player2_status.outfit) c = <current_style> d = ($player2_status.style)
				endif
			endif
		endif
		printf "1p: old: c %a o %b s %c i %d" a = ($player1_status.character_id) b = ($player1_status.outfit) c = ($player1_status.style) d = ($player1_status.instrument_id)
		Change structurename = player1_status character_id = ($player2_status.character_id)
		Change structurename = player1_status outfit = ($player2_status.outfit)
		Change structurename = player1_status style = ($player2_status.style)
		Change structurename = player1_status instrument_id = ($player2_status.instrument_id)
		printf "1p: new: c %a o %b s %c i %d" a = ($player1_status.character_id) b = ($player1_status.outfit) c = ($player1_status.style) d = ($player1_status.instrument_id)
	endif
	if find_profile_by_id id = ($player1_status.character_id)
		get_valid_character_index_reverse index = <index> Player = 1
		Change character_select_highlighted_character_p1 = <char_index>
	endif
	if find_profile_by_id id = ($player2_status.character_id)
		if ($is_network_game = 0)
			get_valid_character_index_reverse index = <index> Player = 2
			Change character_select_highlighted_character_p2 = <char_index>
		else
			if (character_select_highlighted_character_p2_dirty = 1)
				get_valid_character_index_reverse index = <index> Player = 2
				Change character_select_highlighted_character_p2 = <char_index>
				Change \{character_select_highlighted_character_p2_dirty = 0}
			endif
		endif
	endif
	printf \{"g_cs_num_icons = %a"
		a = $g_cs_num_icons}
	if (<Player> = 1)
		Mod \{a = $character_select_highlighted_character_p1
			b = $g_cs_num_icons}
		Change g_cs_jumped_p1 = (($character_select_highlighted_character_p1 / $g_cs_num_icons) * $g_cs_num_icons)
		Change g_character_select_icon_index_p1 = <Mod>
	else
		Mod \{a = $character_select_highlighted_character_p2
			b = $g_cs_num_icons}
		Change g_cs_jumped_p2 = (($character_select_highlighted_character_p2 / $g_cs_num_icons) * $g_cs_num_icons)
		Change g_character_select_icon_index_p2 = <Mod>
	endif
	character_select_menu_highlight_name Player = 1 musician_index = ($character_select_highlighted_character_p1)
	character_select_menu_highlight_name Player = 2 musician_index = ($character_select_highlighted_character_p2)
	formatText checksumName = player_status 'player%i_status' i = <Player>
	char_name = ($<player_status>.band_member)
	ExtendCrc <char_name> '_Info' out = info_struct
	Change structurename = <info_struct> current_anim = Idle
	Change structurename = <info_struct> cycle_anim = true
	Change structurename = <info_struct> next_anim = None
	if NOT ($game_mode = p2_career || $game_mode = p2_coop)
		Change \{structurename = player1_status
			part = guitar}
		Change \{structurename = player2_status
			part = guitar}
		printf \{"create_character_select_menu: part=guitar"}
	endif
	if ($g_hub_characters_dirty)
		do_character_hub_dirty
	endif
	setup_character_hub Player = <Player>
	if CompositeObjectExists Name = <char_name>
		if NOT ($<info_struct>.stance = stance_frontend)
			<char_name> :handle_change_stance stance = stance_frontend no_wait
		endif
	endif
	formatText checksumName = char_select_parent_container 'char_select_container_p%p' p = <Player>
	formatText checksumName = char_select_character_container 'char_select_character_container_p%p' p = <Player>
	formatText checksumName = char_select_next_icon 'cs_icon_id_next_p%p' p = <Player>
	formatText checksumName = icon_id_prev 'cs_icon_id_prev_p%p' p = <Player>
	formatText checksumName = char_select_icon 'g_character_select_icon_index_p%p' p = <Player>
	formatText checksumName = cs_jumped 'g_cs_jumped_p%p' p = <Player>
	formatText checksumName = hilite_container 'char_select_hilite_container_p%p' p = <Player>
	formatText checksumName = cs_name_text 'cs_name_text_p%p' p = <Player>
	CreateScreenElement {
		Type = ContainerElement
		id = <char_select_parent_container>
		parent = root_window
		Pos = (0.0, 0.0)
	}
	<char_select_parent_container> :SetTags Pos = (0.0, 0.0)
	if ($is_network_game = 1)
		create_net_game_info_panel \{parent = user_control_container}
	endif
	get_musician_profile_size
	next_icon_pos = (210.0, 70.0)
	left = 0
	icon_dims = (64.0, 128.0)
	icon_scale = 1
	if ($current_num_players = 2)
		<icon_dims> = (48.0, 96.0)
		<icon_scale> = 0.75
		<next_icon_pos> = (210.0, 160.0)
		Change \{g_cs_select_extra_w = 67}
		Change \{g_cs_select_extra_h = 134}
		Change \{g_cs_select_normal_w = 48}
		Change \{g_cs_select_normal_h = 96}
	else
		Change \{g_cs_select_extra_w = 89}
		Change \{g_cs_select_extra_h = 179}
		Change \{g_cs_select_normal_w = 64}
		Change \{g_cs_select_normal_h = 128}
	endif
	if (<Player> = 2)
		<next_icon_pos> = (1020.0, 160.0)
		<prev_pos> = ((-80.0, -90.0) * <icon_scale>)
	else
		<prev_pos> = ((80.0, -90.0) * <icon_scale>)
	endif
	displaySprite {
		id = <icon_id_prev>
		parent = <char_select_parent_container>
		tex = Char_Select_Menu_Arrow
		Pos = (<next_icon_pos> + <prev_pos>)
		dims = <icon_dims>
		flip_h
	}
	DoScreenElementMorph id = <icon_id_prev> alpha = 0
	hilight_pos = (0.0, 0.0)
	num_hilite_add = 0
	i = 0
	begin
	if (<i> < $g_cs_num_icons)
		formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <Player> d = <i>
		displaySprite {
			id = <icon_id>
			parent = <char_select_parent_container>
			tex = Char_Select_Default
			Pos = (<next_icon_pos> + ((32.0, 64.0) * <icon_scale>))
			dims = <icon_dims>
			just = [center center]
			z = 5
		}
		<icon_id> :SetTags selectable = 0 Pos = <next_icon_pos>
		displaySprite {
			parent = <char_select_parent_container>
			tex = white
			rgba = [0 0 0 255]
			Pos = (<next_icon_pos> - (5.0, 5.0))
			Scale = ((19 * <icon_scale> * (1.0, 0.0)) + (21 * <icon_scale> * (0.0, 1.0)))
		}
	else
		displaySprite {
			id = <char_select_next_icon>
			parent = <char_select_parent_container>
			tex = Char_Select_Menu_Arrow
			Pos = <next_icon_pos>
			dims = <icon_dims>
		}
		if (<array_Size> > $g_cs_num_icons)
		else
			DoScreenElementMorph id = <char_select_next_icon> alpha = 0
		endif
	endif
	if (<left>)
		if (<Player> = 2)
			icon_x = 80
			icon_y = 40
		else
			icon_x = -80
			icon_y = 40
		endif
		icon_pair = ((1.0, 0.0) * <icon_x> + (0.0, 1.0) * <icon_y>)
		<next_icon_pos> = (<next_icon_pos> + (<icon_pair> * <icon_scale>))
		if (<num_hilite_add> < $<char_select_icon>)
			<hilight_pos> = (<hilight_pos> + (<icon_pair> * <icon_scale>))
			<num_hilite_add> = (<num_hilite_add> + 1)
		endif
		<left> = 0
	else
		if (<Player> = 2)
			icon_x = -80
			icon_y = 40
		else
			icon_x = 80
			icon_y = 40
		endif
		icon_pair = ((1.0, 0.0) * <icon_x> + (0.0, 1.0) * <icon_y>)
		<next_icon_pos> = (<next_icon_pos> + (<icon_pair> * <icon_scale>))
		if (<num_hilite_add> < $<char_select_icon>)
			<hilight_pos> = (<hilight_pos> + (<icon_pair> * <icon_scale>))
			<num_hilite_add> = (<num_hilite_add> + 1)
		endif
		<left> = 1
	endif
	<i> = (<i> + 1)
	repeat ($g_cs_num_icons + 1)
	cs_load_characters starting_index = $<cs_jumped> Player = <Player>
	purpley = [240 220 255 255]
	orangey = [250 225 200 255]
	purpley_spotlight = [240 220 255 64]
	orangey_spotlight = [250 225 200 64]
	hilite_container_pos = (160.0, 50.0)
	if ($current_num_players = 2)
		if (<Player> = 1)
			<hilite_container_pos> = (160.0, 120.0)
		else
			<hilite_container_pos> = (955.0, 120.0)
		endif
	endif
	<hilite_container_pos> = (<hilite_container_pos> + <hilight_pos>)
	CreateScreenElement {
		Type = ContainerElement
		id = <hilite_container>
		parent = root_window
		Pos = <hilite_container_pos>
	}
	<hilite_container> :SetTags Pos = <hilite_container_pos>
	formatText checksumName = cs_jumped 'g_cs_jumped_p%d' d = <Player>
	flags = {}
	if (<Player> = 2)
		<flags> = {flip_v}
	endif
	formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <Player> d = $<char_select_icon>
	get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon>) Player = <Player>
	get_musician_profile_struct index = <index>
	SetScreenElementProps id = <icon_id> texture = (<profile_struct>.icon_on)
	GetScreenElementDims id = <icon_id>
	<icon_id> :SetProps dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
	GetScreenElementProps id = <icon_id>
	<icon_id> :SetProps Pos = (<Pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	<i> = 1
	begin
	formatText checksumName = hilite_id 'cs_hilite%d_p%p' d = <i> p = <Player>
	if (<i> = 3)
		<i> = 2
	endif
	formatText checksumName = hilite_tex 'Char_Select_Hilite%d' d = <i>
	hilite_rgba = [200 90 40 255]
	if (<Player> = 2)
		<hilite_rgba> = [180 130 220 255]
	endif
	displaySprite id = <hilite_id> parent = <hilite_container> Pos = (80.0, 40.0) tex = <hilite_tex> dims = (<icon_scale> * (220.0, 220.0)) just = 0 z = 49
	if (<i> = 1)
		<id> :SetProps rgba = <hilite_rgba> alpha = 0.66 dims = (<icon_scale> * (180.0, 180.0))
	endif
	<i> = (<i> + 1)
	repeat 3
	if (<Player> = 1)
		player_number = "1"
		player_name_pos = (<cs_menu_pos> + (-180.0, -40.0))
		if ($is_network_game)
			player_name_pos = (<cs_menu_pos> + (-180.0, 0.0))
		endif
		player_title_pos = (<cs_menu_pos> + (-180.0, -30.0))
		player_title_num_pos = (<cs_menu_pos> + (-180.0, -30.0))
	else
		player_number = "2"
		player_name_pos = (<cs_menu_pos> + (655.0, -40.0))
		if ($is_network_game)
			player_name_pos = (<cs_menu_pos> + (655.0, 0.0))
		endif
		player_title_pos = (<cs_menu_pos> + (655.0, -30.0))
		player_title_num_pos = (<cs_menu_pos> + (655.0, -30.0))
	endif
	<icon_id> :GetTags
	GetUpperCaseString <char_name>
	if ($current_num_players = 1)
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		<cs_menu_starting_pos> = (512.0, 110.0)
		displaySprite {
			parent = <char_select_parent_container>
			tex = window_frame_cap
			Pos = <cs_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <brown_window_color>
			z = 0
		}
		displaySprite {
			parent = <char_select_parent_container>
			tex = window_fill_cap
			Pos = <cs_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <window_fill_color>
			z = 0
		}
		displaySprite {
			parent = <char_select_parent_container>
			tex = window_header_01
			Pos = (<cs_menu_starting_pos> + (0.0, -40.0))
			dims = (256.0, 64.0)
			just = [center center]
			rgba = [200 200 200 255]
			z = 1
		}
		displaySprite {
			parent = <char_select_parent_container>
			tex = window_frame_body_tall
			Pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 434.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
		}
		displaySprite {
			parent = <char_select_parent_container>
			tex = window_fill_body_large
			Pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 434.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
		}
		displaySprite {
			parent = <char_select_parent_container>
			tex = window_frame_cap
			Pos = (<cs_menu_starting_pos> + (0.0, 466.0))
			dims = (256.0, 64.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
			flip_h
		}
		displaySprite {
			parent = <char_select_parent_container>
			tex = window_fill_cap
			Pos = (<cs_menu_starting_pos> + (0.0, 466.0))
			dims = (256.0, 64.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
			flip_h
		}
		displaySprite {
			parent = <char_select_parent_container>
			tex = Char_Select_Frame_BG
			Pos = (507.0, 210.0)
			dims = (266.0, 128.0)
			just = [center center]
			rgba = [250 250 200 255]
			z = 1
		}
		displayText {
			parent = <char_select_parent_container>
			text = "SELECT YOUR HERO"
			Pos = (<cs_menu_starting_pos> + (0.0, 20.0))
			Scale = (0.55, 0.55)
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [180 100 60 255]
			z = 1
		}
		CreateScreenElement {
			Type = TextElement
			id = <cs_name_text>
			parent = <char_select_parent_container>
			just = [center center]
			Pos = (506.0, 220.0)
			Scale = 1
			text = <UppercaseString>
			font = fontgrid_title_gh3
			rgba = [140 50 7 255]
			z_priority = 30
		}
		GetScreenElementDims id = <cs_name_text>
		if (<width> > 256)
			fit_text_in_rectangle id = <cs_name_text> dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (506.0, 220.0)
		endif
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = select_guitar_container
			Pos = (510.0, 0.0)}
		get_valid_character_index char_index = ($g_character_select_icon_index_p1) Player = <Player>
		get_musician_profile_struct index = <index>
		select_guitar_change_blurb_text {
			text = (<profile_struct>.blurb)
			dims = (388.0, 260.0)
			z = 3
		}
	else
		name_just = [left center]
		if (<Player> = 2)
			<name_just> = [right center]
		endif
		displayText {
			id = <cs_name_text>
			parent = <char_select_parent_container>
			text = <UppercaseString>
			font = text_a5
			just = <name_just>
			Pos = <player_name_pos>
			Scale = 1
			rgba = [233 233 233 255]
			z_priority = 3
		}
		GetScreenElementDims id = <cs_name_text>
		if (<width> > 400)
			fit_text_in_rectangle id = <cs_name_text> dims = (400.0, 50.0) Pos = (<cs_menu_pos> + (274.0, -14.0)) just = left
		endif
		if ($is_network_game)
			if (<Player> = 1)
				if (NetSessionFunc Obj = match func = get_gamertag)
					<player_identifier> = <Name>
				endif
				Color = ($player1_color)
				gt_pos = (235.0, 50.0)
				gt_just = [left top]
			else
				<player_identifier> = ($opponent_gamertag)
				Color = ($player2_color)
				gt_pos = (1045.0, 50.0)
				gt_just = [right top]
			endif
			if ($player2_present = 1)
				ui_print_gamertags \{pos1 = (235.0, 50.0)
					pos2 = (1045.0, 50.0)
					dims = (450.0, 35.0)
					just1 = [
						left
						top
					]
					just2 = [
						right
						top
					]}
			else
				ui_print_gamertag Name = <player_identifier> start_pos = <gt_pos> Color = <Color> Player = <Player> just = (<gt_just>) dims = (450.0, 35.0)
			endif
		else
			formatText checksumName = player_text_id 'player%a_text' a = <Player>
			player_text_just = [left top]
			if (<Player> = 2)
				<player_text_just> = [right top]
			endif
			displayText {
				id = <player_text_id>
				parent = <char_select_parent_container>
				text = "PLAYER"
				font = fontgrid_title_gh3
				just = <player_text_just>
				Pos = <player_title_pos>
				Scale = 0.75
				rgba = <purpley>
				z_priority = 3
			}
			if (<Player> = 1)
				GetScreenElementDims id = <player_text_id>
				<player_title_num_pos> = (<player_title_num_pos> + <width> * (1.0, 0.0) + (10.0, 0.0))
			endif
			displayText {
				parent = <char_select_parent_container>
				text = <player_number>
				font = fontgrid_title_gh3
				just = <player_text_just>
				Pos = <player_title_num_pos>
				Scale = (1.0, 1.25)
				rgba = <purpley>
				z_priority = 3
			}
			if (<Player> = 2)
				GetScreenElementDims id = <id>
				SetScreenElementProps id = <player_text_id> Pos = (<player_title_num_pos> - <width> * (1.0, 0.0) - (10.0, 0.0))
			endif
		endif
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <char_select_character_container>
		parent = root_window
		Pos = (0.0, 0.0)
	}
	if CompositeObjectExists \{Name = GUITARIST}
		GUITARIST :handle_change_stance \{stance = stance_frontend}
	endif
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :handle_change_stance \{stance = stance_frontend}
	endif
	formatText checksumName = spawnedscript 'cs_rotate_hilites_p%d' d = <Player>
	SpawnScriptNow <spawnedscript>
	cs_get_total_guitarists Player = <Player>
	formatText checksumName = total_guitarists 'cs_total_guitarists_p%i' i = <Player>
	Change GlobalName = <total_guitarists> NewValue = <num_guitarists>
	Change GlobalName = <safe_to_scroll> NewValue = 1
	if ($current_num_players = 1)
		get_current_first_play
		if (<first_play>)
			if ScreenElementExists \{id = vmenu_character_select_p1}
				LaunchEvent \{Type = focus
					target = vmenu_character_select_p1}
			endif
		endif
	endif
	Change \{menu_flow_locked = 0}
	if (<Player> = 1)
		if ScreenElementExists \{id = vmenu_character_select_p1}
			LaunchEvent \{Type = focus
				target = vmenu_character_select_p1}
		endif
	else
		if ScreenElementExists \{id = vmenu_character_select_p2}
			LaunchEvent \{Type = focus
				target = vmenu_character_select_p2}
		endif
	endif
	if GotParam \{blah}
		if ($net_can_send_approval = 1)
			if ($is_network_game = 1 && <Player> = 1)
				net_lobby_state_message \{current_state = character_hub
					action = approval}
			endif
			Change \{net_can_send_approval = 0}
		endif
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
		Change \{gIsInNetGame = 1}
	endif
	formatText checksumName = players_timer_name 'cs_watch_timer_p%d' d = <Player>
	printf "spawning script %s" s = <players_timer_name>
	SpawnScriptNow <players_timer_name> params = {Player = <Player>}
endscript

script destroy_character_select_menu 
	Change \{menu_flow_locked = 1}
	printf "destroy_character_select_menu: exiting for player=%d" d = <Player>
	if (<Player> = 1)
		KillSpawnedScript \{Name = cs_rotate_hilites_p1}
		Change \{g_cs_scroll_ready_p1 = 1}
		Change \{g_cs_choose_ready_p1 = 0}
		destroy_menu \{menu_id = char_select_character_container_p1}
		destroy_menu \{menu_id = char_select_container_p1}
		destroy_menu \{menu_id = char_select_hilite_container_p1}
		destroy_menu \{menu_id = scrolling_character_select_p1}
		KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
		destroy_menu \{menu_id = gs_instrument_info_scroll_window}
		destroy_menu \{menu_id = select_guitar_container}
		if ScreenElementExists \{id = menu_container}
			DestroyScreenElement \{id = menu_container}
		endif
	else
		KillSpawnedScript \{Name = cs_rotate_hilites_p2}
		Change \{g_cs_scroll_ready_p2 = 1}
		Change \{g_cs_choose_ready_p2 = 0}
		destroy_menu \{menu_id = char_select_character_container_p2}
		destroy_menu \{menu_id = char_select_container_p2}
		destroy_menu \{menu_id = char_select_hilite_container_p2}
		destroy_menu \{menu_id = scrolling_character_select_p2}
	endif
	clean_up_user_control_helpers
	shut_down_character_hub
	Change \{menu_flow_locked = 0}
endscript

script cs_watch_timer_p1 
	SpawnScriptNow \{set_countdown_timer}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf "cs_watch_timer: timer expired for player %d" d = <Player>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{block_choose_player = 1}
	SpawnScriptNow character_select_choose params = {Player = <Player> timeout = 1}
endscript

script cs_watch_timer_p2 
	SpawnScriptNow \{set_countdown_timer}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf "cs_watch_timer: timer expired for player %d" d = <Player>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{block_choose_player = 1}
	SpawnScriptNow character_select_choose params = {Player = <Player> timeout = 1}
endscript

script cs_check_if_new_page \{Dir = down}
	if (<Dir> = down)
		if ($<icon_index> + 1 >= $g_cs_num_icons)
			if (<total_guitarists> > $<icon_index> + 1)
				return \{cs_go_new_page = 1}
			endif
		endif
	else
		if ($<icon_index> - 1 < 0)
			return \{cs_go_new_page = 1}
		endif
	endif
	return \{cs_go_new_page = 0}
endscript

script cs_scroll_up_or_down \{Player = 1
		Dir = down}
	formatText checksumName = safe_to_scroll 'g_cs_safe_to_scroll_p%d' d = <Player>
	if (<safe_to_scroll> = 0)
		return
	endif
	formatText checksumName = scroll_ready 'g_cs_scroll_ready_p%d' d = <Player>
	formatText checksumName = char_select_icon_index 'g_character_select_icon_index_p%d' d = <Player>
	formatText checksumName = cs_jumped 'g_cs_jumped_p%d' d = <Player>
	formatText checksumName = hilite_container 'char_select_hilite_container_p%d' d = <Player>
	formatText checksumName = cs_name_text 'cs_name_text_p%d' d = <Player>
	formatText checksumName = cs_last_guitarist 'g_cs_last_guitarist_p%d' d = <Player>
	formatText checksumName = total_num_guitarists 'cs_total_guitarists_p%i' i = <Player>
	if NOT ($<scroll_ready>)
		return
	endif
	if (<Player> = 1)
		if ($g_cs_choose_ready_p1)
			return
		endif
	else
		if ($g_cs_choose_ready_p2)
			return
		endif
	endif
	Change \{g_cs_hilite_rot1 = 360.0}
	Change \{g_cs_hilite_rot2 = 180.0}
	cs_check_if_new_page Dir = <Dir> icon_index = $<char_select_icon_index> total_guitarists = ($<total_num_guitarists>)
	if (<Dir> = down)
		pos_or_neg_one = 1
	else
		pos_or_neg_one = -1
	endif
	flags = {}
	if (<Player> = 2)
		<flags> = {flip_v}
	endif
	if (<cs_go_new_page>)
		old_icon_index = $<char_select_icon_index>
		old_jumped = $<cs_jumped>
		if (<Dir> = up)
			if ($<cs_jumped> > 0)
				Change GlobalName = <cs_jumped> NewValue = ($<cs_jumped> - $g_cs_num_icons)
				Change GlobalName = <char_select_icon_index> NewValue = 12
			else
				return
			endif
		else
			Change GlobalName = <cs_jumped> NewValue = ($<cs_jumped> + $g_cs_num_icons)
			Change GlobalName = <char_select_icon_index> NewValue = 0
		endif
		formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <Player> d = <old_icon_index>
		if ScreenElementExists id = <icon_id>
			get_valid_character_index char_index = (<old_jumped> + <old_icon_index>) Player = <Player>
			get_musician_profile_struct index = <index>
			SetScreenElementProps id = <icon_id> texture = (<profile_struct>.icon_off)
			GetScreenElementDims id = <icon_id>
			<icon_id> :SetProps dims = (($g_cs_select_normal_w * (1.0, 0.0)) + ($g_cs_select_normal_h * (0.0, 1.0))) z_priority = 5
			GetScreenElementProps id = <icon_id>
			<icon_id> :SetProps Pos = (<Pos> - ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
		endif
		generic_menu_up_or_down_sound <Dir>
		cs_load_characters starting_index = $<cs_jumped> Player = <Player>
		formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <Player> d = $<char_select_icon_index>
		if ScreenElementExists id = <icon_id>
			get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon_index>) Player = <Player>
			get_musician_profile_struct index = <index>
			SetScreenElementProps id = <icon_id> texture = (<profile_struct>.icon_on)
			GetScreenElementDims id = <icon_id>
			<icon_id> :SetProps dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
			GetScreenElementProps id = <icon_id>
			<icon_id> :SetProps Pos = (<Pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
		endif
		formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <Player> d = ($<char_select_icon_index>)
		if ScreenElementExists id = <icon_id>
			<icon_id> :GetTags
		endif
		<Pos> = (<Pos> - (50.0, 10.0))
		SetScreenElementProps id = <hilite_container> Pos = <Pos>
		<hilite_container> :SetTags Pos = <Pos>
		GetUpperCaseString <char_name>
		SetScreenElementProps id = <cs_name_text> text = <UppercaseString>
		GetScreenElementDims id = <cs_name_text>
		if (<width> > 256)
			if ($current_num_players = 1)
				fit_text_in_rectangle id = <cs_name_text> dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (506.0, 220.0)
			endif
		else
			<cs_name_text> :SetProps Scale = 1
		endif
		character_select_menu_highlight_name Player = <Player> musician_index = <char_array_index>
		if ($current_num_players = 1)
			get_valid_character_index char_index = ($g_character_select_icon_index_p1) Player = <Player>
			get_musician_profile_struct index = <index>
			select_guitar_change_blurb_text {
				text = (<profile_struct>.blurb)
				dims = (388.0, 260.0)
				z = 3
			}
		endif
		formatText checksumName = killedscript 'cs_rotate_hilites_p%d' d = <Player>
		KillSpawnedScript Name = <killedscript>
		SpawnScriptNow <killedscript>
		if ((($is_network_game) = 1) && (<Player> = 1) && ($player2_present))
			network_player_lobby_message {
				Type = character_select
				action = update
				value1 = (<pos_or_neg_one> + 1)
				checksum = ($player1_status.character_id)
			}
		endif
		return
	endif
	if (<Dir> = down)
		if (($<char_select_icon_index> + $<cs_jumped>) >= (($<total_num_guitarists>) -1))
			return
		endif
	else
		if (($<char_select_icon_index>) < 1)
			return
		endif
	endif
	generic_menu_up_or_down_sound <Dir>
	formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <Player> d = $<char_select_icon_index>
	if ScreenElementExists id = <icon_id>
		get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon_index>) Player = <Player>
		get_musician_profile_struct index = <index>
		SetScreenElementProps id = <icon_id> texture = (<profile_struct>.icon_off)
		GetScreenElementDims id = <icon_id>
		<icon_id> :SetProps dims = (($g_cs_select_normal_w * (1.0, 0.0)) + ($g_cs_select_normal_h * (0.0, 1.0))) z_priority = 5
		GetScreenElementProps id = <icon_id>
		<icon_id> :SetProps Pos = (<Pos> - ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	endif
	formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <Player> d = ($<char_select_icon_index> + <pos_or_neg_one>)
	if ScreenElementExists id = <icon_id>
		<icon_id> :GetTags
	endif
	if ((($is_network_game) = 1) && (<Player> = 1) && ($player2_present))
		network_player_lobby_message {
			Type = character_select
			action = update
			value1 = (<pos_or_neg_one> + 1)
			checksum = ($player1_status.character_id)
		}
	endif
	Change GlobalName = <char_select_icon_index> NewValue = ($<char_select_icon_index> + <pos_or_neg_one>)
	<Pos> = (<Pos> - (50.0, 10.0))
	SetScreenElementProps id = <hilite_container> Pos = <Pos>
	<hilite_container> :SetTags Pos = <Pos>
	formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <Player> d = $<char_select_icon_index>
	if ScreenElementExists id = <icon_id>
		get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon_index>) Player = <Player>
		get_musician_profile_struct index = <index>
		SetScreenElementProps id = <icon_id> texture = (<profile_struct>.icon_on)
		GetScreenElementDims id = <icon_id>
		<icon_id> :SetProps dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
		GetScreenElementProps id = <icon_id>
		<icon_id> :SetProps Pos = (<Pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	endif
	GetUpperCaseString <char_name>
	SetScreenElementProps id = <cs_name_text> text = <UppercaseString>
	GetScreenElementDims id = <cs_name_text>
	if (<width> > 256)
		if ($current_num_players = 1)
			fit_text_in_rectangle id = <cs_name_text> dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (506.0, 220.0)
		endif
	else
		<cs_name_text> :SetProps Scale = 1
	endif
	if ScreenElementExists id = <icon_id>
		<icon_id> :GetTags
	endif
	character_select_menu_highlight_name Player = <Player> musician_index = <char_array_index>
	if ($current_num_players = 1)
		get_valid_character_index char_index = ($g_character_select_icon_index_p1) Player = <Player>
		get_musician_profile_struct index = <index>
		select_guitar_change_blurb_text {
			text = (<profile_struct>.blurb)
			dims = (388.0, 260.0)
			z = 3
		}
	endif
	formatText checksumName = killedscript 'cs_rotate_hilites_p%d' d = <Player>
	KillSpawnedScript Name = <killedscript>
	SpawnScriptNow <killedscript>
endscript

script cs_rotate_hilites_p1 \{time = 3.0}
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	SetScreenElementProps \{id = cs_hilite2_p1
		rot_angle = 0
		alpha = 0}
	SetScreenElementProps \{id = cs_hilite3_p1
		rot_angle = 0
		alpha = 0}
	begin
	i = 1
	begin
	if ScreenElementExists \{id = cs_hilite2_p1}
		DoScreenElementMorph id = cs_hilite2_p1 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if ScreenElementExists \{id = cs_hilite3_p1}
		DoScreenElementMorph id = cs_hilite3_p1 rot_angle = <rot2> alpha = <alpha2> time = <time>
	endif
	<i> = (<i> + 1)
	repeat 2
	<rot1> = (<rot1> + 360)
	<rot2> = (<rot2> + 180)
	if (<alpha1> = 1)
		<alpha1> = 0
	else
		<alpha1> = 1
	endif
	if (<alpha2> = 1)
		<alpha2> = 0
	else
		<alpha2> = 1
	endif
	Wait <time> Seconds
	repeat
endscript

script cs_rotate_hilites_p2 \{time = 3.0}
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	SetScreenElementProps \{id = cs_hilite2_p2
		rot_angle = 0
		alpha = 0}
	SetScreenElementProps \{id = cs_hilite3_p2
		rot_angle = 0
		alpha = 0}
	begin
	i = 1
	begin
	if ScreenElementExists \{id = cs_hilite2_p2}
		DoScreenElementMorph id = cs_hilite2_p2 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if ScreenElementExists \{id = cs_hilite3_p2}
		DoScreenElementMorph id = cs_hilite3_p2 rot_angle = <rot2> alpha = <alpha2> time = <time>
	endif
	<i> = (<i> + 1)
	repeat 2
	<rot1> = (<rot1> + 360)
	<rot2> = (<rot2> + 180)
	if (<alpha1> = 1)
		<alpha1> = 0
	else
		<alpha1> = 1
	endif
	if (<alpha2> = 1)
		<alpha2> = 0
	else
		<alpha2> = 1
	endif
	Wait <time> Seconds
	repeat
endscript

script get_valid_character_index_reverse \{index = 0}
	search_index = <index>
	char_index = 0
	begin
	if NOT get_valid_character_index char_index = <char_index> Player = <Player>
		break
	endif
	if (<search_index> = <index>)
		return char_index = <char_index> true
	endif
	char_index = (<char_index> + 1)
	repeat
	return \{char_index = 0
		FALSE}
endscript

script get_valid_character_index \{char_index = 0
		Player = 1}
	download_characters = 0
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	valid = 1
	if NOT ($is_network_game = 1 && <Player> = 2)
		if NOT is_musician_profile_downloaded index = <index>
			valid = 0
		endif
	else
		if is_musician_profile_downloaded index = <index>
			if (<download> = 1)
				if GetGlobalTags (<profile_struct>.musician_body.desc_id) noassert = 1
					if (<available_on_other_client> = 0)
						printf \{"Not valid because it's download content which isn't available on other client"}
						valid = 0
					else
						download_characters = (<download_characters> + 1)
					endif
				endif
			endif
		endif
	endif
	if StructureContains structure = (<profile_struct>) debug_only
		printf \{"Not valid because it's debug only"}
		valid = 0
	endif
	if NOT (<profile_struct>.Type = GUITARIST)
		printf \{"Not valid because it's no guitarist"}
		valid = 0
	endif
	if ($family_mode_enabled)
		if StructureContains structure = (<profile_struct>) family_disabled
			printf \{"Not valid because it's blocked in family mode"}
			valid = 0
		endif
	endif
	if NOT ($is_network_game = 1 && <Player> = 2)
		unlocked = 1
		if GetGlobalTags (<profile_struct>.musician_body.desc_id) noassert = 1
			if (<unlocked> = 0)
				valid = 0
			endif
		endif
	else
		unlocked_on_other_client = 1
		if GetGlobalTags (<profile_struct>.musician_body.desc_id) noassert = 1
			if (<unlocked_on_other_client> = 0)
				printf \{"Not valid because it's not unlocked on other client"}
				valid = 0
			endif
		endif
	endif
	if (<valid> = 1)
		if (<char_index> = 0)
			if NOT is_musician_profile_downloaded index = <index>
				return \{index = 0
					true}
			else
				return index = <index> true
			endif
		endif
		char_index = (<char_index> - 1)
	endif
	index = (<index> + 1)
	repeat <array_Size>
	if ($is_network_game = 1 && <Player> = 2)
		num_extra_chars = ($download_characters_on_other_client - <download_characters>)
		printf "Additional characters %n" n = <num_extra_chars>
		if (<num_extra_chars> > 0)
			begin
			if (<char_index> = 0)
				return \{index = 0
					true}
			endif
			char_index = (<char_index> - 1)
			repeat (<num_extra_chars>)
		endif
	endif
	printf \{"Not found!"}
	return \{FALSE}
endscript

script character_select_choose \{Player = 1
		timeout = 0}
	if ($block_choose_player = 1 && <timeout> = 0)
		printf "character_select_choose blocked on player %a" a = <Player>
		return
	endif
	printf "character_select_choose: called for player %d" d = <Player>
	if (<Player> = 1)
		char_index = ($g_cs_jumped_p1 + $g_character_select_icon_index_p1)
		get_valid_character_index char_index = <char_index> Player = <Player>
		get_musician_profile_struct index = <index>
		formatText checksumName = character_id '%s' s = (<profile_struct>.Name)
		Change structurename = player1_status character_id = <character_id>
		if (($is_network_game = 1) && ($player2_present))
			network_player_lobby_message {
				Type = character_select
				action = select
				value1 = ($character_select_highlighted_character_p1)
			}
		endif
		Change \{g_gs_p1_chosen = 1}
	else
		char_index = ($g_cs_jumped_p2 + $g_character_select_icon_index_p2)
		get_valid_character_index char_index = <char_index> Player = <Player>
		get_musician_profile_struct index = <index>
		formatText checksumName = character_id '%s' s = (<profile_struct>.Name)
		Change structurename = player2_status character_id = <character_id>
		Change \{g_gs_p2_chosen = 1}
	endif
	formatText checksumName = players_timer_name 'cs_watch_timer_p%d' d = <Player>
	printf "killing script %s" s = <players_timer_name>
	KillSpawnedScript Name = <players_timer_name>
	ui_flow_manager_respond_to_action action = continue create_params = {Player = <Player>} Player = <Player>
endscript

script cs_load_characters \{starting_index = $g_cs_jumped_p1
		Player = 1}
	cs_get_total_guitarists Player = <Player>
	remaining = (<num_guitarists> - <starting_index>)
	if (<remaining> > $g_cs_num_icons)
		<remaining> = $g_cs_num_icons
		if (<Player> = 2)
			DoScreenElementMorph \{id = cs_icon_id_next_p2
				alpha = 1}
		else
			DoScreenElementMorph \{id = cs_icon_id_next_p1
				alpha = 1}
		endif
	else
		if (<Player> = 2)
			DoScreenElementMorph \{id = cs_icon_id_next_p2
				alpha = 0}
		else
			DoScreenElementMorph \{id = cs_icon_id_next_p1
				alpha = 0}
		endif
	endif
	if (<starting_index> > 0)
		if (<Player> = 2)
			DoScreenElementMorph \{id = cs_icon_id_prev_p2
				alpha = 1}
		else
			DoScreenElementMorph \{id = cs_icon_id_prev_p1
				alpha = 1}
		endif
	else
		if (<Player> = 2)
			DoScreenElementMorph \{id = cs_icon_id_prev_p2
				alpha = 0}
		else
			DoScreenElementMorph \{id = cs_icon_id_prev_p1
				alpha = 0}
		endif
	endif
	cs_reset_selectables Player = <Player>
	char_index = 0
	begin
	get_valid_character_index char_index = (<char_index> + <starting_index>) Player = <Player>
	get_musician_profile_struct index = <index>
	if (<Player> = 1)
		formatText checksumName = icon_id 'cs_icon_p1_id_%d' d = <char_index>
	elseif (<Player> = 2)
		formatText checksumName = icon_id 'cs_icon_p2_id_%d' d = <char_index>
	endif
	if ScreenElementExists id = <icon_id>
		flags = {}
		if (<Player> = 2)
			<flags> = {flip_v}
		endif
		SetScreenElementProps id = <icon_id> texture = (<profile_struct>.icon_off) <flags>
		if StructureContains structure = (<profile_struct>) fullname
			character_name = (<profile_struct>.fullname)
		else
			character_name = (<profile_struct>.Name)
		endif
		<icon_id> :SetTags {
			selectable = 1
			char_name = <character_name>
			char_array_index = (<char_index> + <starting_index>)
		}
	endif
	char_index = (<char_index> + 1)
	repeat <remaining>
endscript

script cs_reset_selectables \{Player = 1}
	i = 0
	begin
	if (<Player> = 1)
		formatText checksumName = icon_id 'cs_icon_p1_id_%d' d = <i>
		if ScreenElementExists id = <icon_id>
			SetScreenElementProps id = <icon_id> texture = Char_Select_Default
			<icon_id> :SetTags selectable = 0
		endif
	else
		formatText checksumName = icon_id 'cs_icon_p2_id_%d' d = <i>
		if ScreenElementExists id = <icon_id>
			SetScreenElementProps id = <icon_id> texture = Char_Select_Default
			<icon_id> :SetTags selectable = 0
		endif
	endif
	<i> = (<i> + 1)
	repeat $g_cs_num_icons
endscript

script cs_set_containers_above_or_below \{Player = 1}
	formatText checksumName = next_icon_pos 'next_icon_pos_p%d' d = <Player>
	formatText checksumName = hilite_container 'char_select_hilite_container_p%d' d = <Player>
	formatText checksumName = char_select_container 'char_select_container_p%d' d = <Player>
	if GotParam \{above}
		if (<Player> = 1)
			<next_icon_pos> = (155.0, 540.0)
		else
			<next_icon_pos> = (960.0, 550.0)
		endif
		SetScreenElementProps id = <char_select_container> Pos = (0.0, -720.0)
		<char_select_container> :SetTags Pos = (0.0, -720.0)
		SetScreenElementProps id = <hilite_container> Pos = (<next_icon_pos> - (0.0, 720.0))
		<hilite_container> :SetTags Pos = (<next_icon_pos> - (0.0, 720.0))
	else
		if (<Player> = 1)
			<next_icon_pos> = (155.0, 50.0)
		else
			<next_icon_pos> = (955.0, 60.0)
		endif
		SetScreenElementProps id = <char_select_container> Pos = (0.0, 720.0)
		<char_select_container> :SetTags Pos = (0.0, 720.0)
		SetScreenElementProps id = <hilite_container> Pos = (<next_icon_pos> + (0.0, 720.0))
		<hilite_container> :SetTags Pos = (<next_icon_pos> + (0.0, 720.0))
	endif
endscript

script cs_get_total_guitarists 
	array_entry = 0
	begin
	if NOT get_valid_character_index char_index = <array_entry> Player = <Player>
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat
	return num_guitarists = <array_entry>
endscript

script character_select_menu_highlight_name \{Player = 1}
	printf \{"character_select_menu_highlight_name: start"}
	if (<Player> = 1)
		Change character_select_highlighted_character_p1 = <musician_index>
		get_valid_character_index char_index = <musician_index> Player = <Player>
		get_musician_profile_struct index = <index>
		formatText checksumName = character_id '%s' s = (<profile_struct>.Name)
	else
		Change character_select_highlighted_character_p2 = <musician_index>
		get_valid_character_index char_index = <musician_index> Player = <Player>
		get_musician_profile_struct index = <index>
		formatText checksumName = character_id '%s' s = (<profile_struct>.Name)
	endif
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if NOT (<character_id> = $<player_status>.character_id)
		Change structurename = <player_status> character_id = <character_id>
		if find_profile_by_id id = <character_id>
			get_musician_profile_struct index = <index>
			get_valid_character_index_reverse index = <index> Player = 1
			formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
			if GetGlobalTags <default_characterguitartag> noassert = 1
				if (<current_instrument> = guitar)
					<inst_ID> = <current_selected_guitar>
				else
					if NOT ($game_mode = p2_career)
						SetGlobalTags <default_characterguitartag> params = {current_instrument = guitar}
						<inst_ID> = ($Musician_Profiles [<char_index>].musician_instrument.desc_id)
						printf "character_select_menu_highlight_name: player %d inst_id = %s" d = <Player> s = <inst_ID>
					else
						<inst_ID> = <current_selected_bass>
					endif
				endif
				printf "1p: highlight: old: c %a o %b s %c i %d" a = ($player1_status.character_id) b = ($player1_status.outfit) c = ($player1_status.style) d = ($player1_status.instrument_id)
				Change structurename = <player_status> instrument_id = <inst_ID>
				printf "1p: highlight: new: c %a o %b s %c i %d" a = ($player1_status.character_id) b = ($player1_status.outfit) c = ($player1_status.style) d = ($player1_status.instrument_id)
				SetGlobalTags <default_characterguitartag> params = {current_outfit = 1 , current_style = 1}
				Change structurename = <player_status> outfit = 1
				Change structurename = <player_status> style = 1
			endif
		endif
		formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
endscript
