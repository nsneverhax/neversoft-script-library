block_2p_select_choose = 0

script cs_2p_go_back \{Player = 1}
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

script create_2p_net_game_info_panel \{parent = user_control_container
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

script create_2p_character_select_menu 
	printf \{"create_2p_character_select_menu: start"}
	Change \{block_2p_select_choose = 0}
	SpawnScriptNow \{menu_music_on}
	Change \{menu_flow_locked = 1}
	cur_player_num = 1
	if ($right_player_continue = 1 && $multiplayer_continue_flag = 0)
		if find_profile_by_id id = ($player1_status.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = 1
			printf <default_characterguitartag>
			if GetGlobalTags <default_characterguitartag> noassert = 1
				if (($player1_status.band_member) = GUITARIST)
					printf "2p: old: csg %a ii %b" a = <current_selected_guitar> b = ($player1_status.instrument_id)
					SetGlobalTags <default_characterguitartag> params = {current_selected_guitar = ($player1_status.instrument_id)}
				else
					printf "2p: old: csb %a ii %b" a = <current_selected_bass> b = ($player1_status.instrument_id)
					SetGlobalTags <default_characterguitartag> params = {current_selected_bass = ($player1_status.instrument_id)}
				endif
				printf "2p: old: co %a o %b cs %c s %d" a = <current_outfit> b = ($player1_status.outfit) c = <current_style> d = ($player1_status.style)
				SetGlobalTags <default_characterguitartag> params = {current_outfit = ($player1_status.outfit) current_style = ($player1_status.style)}
				if GetGlobalTags <default_characterguitartag> noassert = 1
					if (<current_instrument> = guitar)
						printf "2p: new: csg %a ii %b" a = <current_selected_guitar> b = ($player1_status.instrument_id)
					else
						printf "2p: new: csb %a ii %b" a = <current_selected_bass> b = ($player1_status.instrument_id)
					endif
					printf "2p: new: co %a o %b cs %c s %d" a = <current_outfit> b = ($player1_status.outfit) c = <current_style> d = ($player1_status.style)
				endif
			endif
		endif
		if find_profile_by_id id = ($player1_status.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = 2
			printf <default_characterguitartag>
			if GetGlobalTags <default_characterguitartag> noassert = 1
				if (($player1_status.band_member) = GUITARIST)
					printf "2p: old: csg %a ii %b" a = <current_selected_guitar> b = ($player1_status.instrument_id)
					SetGlobalTags <default_characterguitartag> params = {current_selected_guitar = ($player1_status.instrument_id)}
				else
					printf "2p: old: csb %a ii %b" a = <current_selected_bass> b = ($player1_status.instrument_id)
					SetGlobalTags <default_characterguitartag> params = {current_selected_bass = ($player1_status.instrument_id)}
				endif
				printf "2p: old: co %a o %b cs %c s %d" a = <current_outfit> b = ($player1_status.outfit) c = <current_style> d = ($player1_status.style)
				SetGlobalTags <default_characterguitartag> params = {current_outfit = ($player1_status.outfit) current_style = ($player1_status.style)}
				if GetGlobalTags <default_characterguitartag> noassert = 1
					if (<current_instrument> = guitar)
						printf "2p: new: csg %a ii %b" a = <current_selected_guitar> b = ($player1_status.instrument_id)
					else
						printf "2p: new: csb %a ii %b" a = <current_selected_bass> b = ($player1_status.instrument_id)
					endif
					printf "2p: new: co %a o %b cs %c s %d" a = <current_outfit> b = ($player1_status.outfit) c = <current_style> d = ($player1_status.style)
				endif
			endif
		endif
		printf "2p: old: c %a o %b s %c i %d" a = ($player2_status.character_id) b = ($player2_status.outfit) c = ($player2_status.style) d = ($player2_status.instrument_id)
		Change structurename = player2_status character_id = ($player1_status.character_id)
		Change structurename = player2_status outfit = ($player1_status.outfit)
		Change structurename = player2_status style = ($player1_status.style)
		Change structurename = player2_status instrument_id = ($player1_status.instrument_id)
		printf "2p: new: c %a o %b s %c i %d" a = ($player2_status.character_id) b = ($player2_status.outfit) c = ($player2_status.style) d = ($player2_status.instrument_id)
		GetArraySize \{$Attract_Mode_Info}
		if (<array_Size> = 1)
			swap_index = 0
		else
			GetRandomValue Name = swap_index integer a = 0 b = (<array_Size> - 1)
		endif
		Change structurename = player1_status character_id = ($Attract_Mode_Info [<swap_index>].p1_character_id)
		Change structurename = player1_status outfit = ($Attract_Mode_Info [<swap_index>].p1_outfit)
		Change structurename = player1_status style = ($Attract_Mode_Info [<swap_index>].p1_style)
		Change structurename = player1_status instrument_id = ($Attract_Mode_Info [<swap_index>].p1_instrument_id)
		if find_profile_by_id id = ($player1_status.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = 1
			printf <default_characterguitartag>
			if GetGlobalTags <default_characterguitartag> noassert = 1
				printf "2p: old: csg %a ii %b" a = <current_selected_guitar> b = ($player1_status.instrument_id)
				SetGlobalTags <default_characterguitartag> params = {current_selected_guitar = ($player1_status.instrument_id)}
				printf "2p: old: co %a o %b cs %c s %d" a = <current_outfit> b = ($player1_status.outfit) c = <current_style> d = ($player1_status.style)
				SetGlobalTags <default_characterguitartag> params = {current_outfit = ($player1_status.outfit) current_style = ($player1_status.style)}
				if GetGlobalTags <default_characterguitartag> noassert = 1
					printf "2p: new: csg %a ii %b" a = <current_selected_guitar> b = ($player1_status.instrument_id)
					printf "2p: new: co %a o %b cs %c s %d" a = <current_outfit> b = ($player1_status.outfit) c = <current_style> d = ($player1_status.style)
				endif
			endif
		endif
	endif
	begin
	printf "create_2p_character_select_menu: creating player %d" d = <cur_player_num>
	if (<cur_player_num> = 1)
		if ($num_user_control_helpers = 0)
			printf \{"create_2p_character_select_menu: adding user control helpers"
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
	formatText checksumName = safe_to_scroll 'g_cs_safe_to_scroll_p%d' d = <cur_player_num>
	Change GlobalName = <safe_to_scroll> NewValue = 0
	Change \{rich_presence_context = presence_character_select}
	exclusive_dev = $player1_device
	printf \{"create_2p_character_select_menu: exclusive_dev initializing exclusive_dev to %d"
		d = $player1_device}
	if (($is_network_game) = 1)
		NetSessionFunc \{Obj = voice
			func = entering_free_skate}
		<exclusive_dev> = $primary_controller
	else
		if (<cur_player_num> = 2)
			printf \{"create_2p_character_select_menu: player 2, setting exclusive_dev to %d"
				d = $player2_device}
			<exclusive_dev> = $player2_device
		endif
	endif
	printf "create_2p_character_select_menu: exclusive_dev is now %d" d = <exclusive_dev>
	cs_menu_pos = (400.0, 120.0)
	if (($is_network_game) = 1)
		cs_event_handlers = [
			{pad_up cs_scroll_up_or_down params = {Player = <cur_player_num> Dir = up}}
			{pad_down cs_scroll_up_or_down params = {Player = <cur_player_num> Dir = down}}
			{pad_choose character_2p_select_choose params = {Player = <cur_player_num>}}
			{pad_L1 rtlefty_toggle_flip params = {which_player = <cur_player_num>}}
		]
	else
		cs_event_handlers = [
			{pad_up cs_scroll_up_or_down params = {Player = <cur_player_num> Dir = up}}
			{pad_down cs_scroll_up_or_down params = {Player = <cur_player_num> Dir = down}}
			{pad_choose character_2p_select_choose params = {Player = <cur_player_num>}}
			{pad_L1 rtlefty_toggle_flip params = {which_player = <cur_player_num>}}
		]
	endif
	if (<cur_player_num> = 2)
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
	if (<cur_player_num> = 1)
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
	formatText checksumName = highlighted_char 'character_select_highlighted_character_p%i' i = <cur_player_num>
	printf \{"create_2p_character_select_menu: forcing a highlight"}
	character_select_menu_highlight_name Player = <cur_player_num> musician_index = ($<highlighted_char>)
	formatText checksumName = player_status 'player%i_status' i = <cur_player_num>
	char_name = ($<player_status>.band_member)
	ExtendCrc <char_name> '_Info' out = info_struct
	Change structurename = <info_struct> current_anim = Idle
	Change structurename = <info_struct> cycle_anim = true
	Change structurename = <info_struct> next_anim = None
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	find_profile_by_id id = ($player1_status.character_id)
	get_musician_profile_struct index = <index>
	formatText checksumName = default_characterguitartag1 'character_%c_player_1_guitar_tags' c = (<profile_struct>.Name)
	GetGlobalTags <default_characterguitartag1> noassert = 1
	Change structurename = player1_status instrument_id = <current_selected_guitar>
	SetGlobalTags <default_characterguitartag1> params = {current_instrument = guitar}
	find_profile_by_id id = ($player2_status.character_id)
	get_musician_profile_struct index = <index>
	formatText checksumName = default_characterguitartag2 'character_%c_player_2_guitar_tags' c = (<profile_struct>.Name)
	GetGlobalTags <default_characterguitartag2> noassert = 1
	Change structurename = player2_status instrument_id = <current_selected_guitar>
	SetGlobalTags <default_characterguitartag2> params = {current_instrument = guitar}
	printf \{"create_2p_character_select_menu: part=guitar"}
	if ($g_hub_characters_dirty)
		do_character_hub_dirty Player = <cur_player_num>
	endif
	setup_character_hub Player = <cur_player_num>
	if CompositeObjectExists Name = <char_name>
		if NOT ($<info_struct>.stance = stance_frontend)
			<char_name> :handle_change_stance stance = stance_frontend no_wait
		endif
	endif
	formatText checksumName = char_select_parent_container 'char_select_container_p%p' p = <cur_player_num>
	formatText checksumName = char_select_character_container 'char_select_character_container_p%p' p = <cur_player_num>
	formatText checksumName = char_select_next_icon 'cs_icon_id_next_p%p' p = <cur_player_num>
	formatText checksumName = icon_id_prev 'cs_icon_id_prev_p%p' p = <cur_player_num>
	formatText checksumName = char_select_icon 'g_character_select_icon_index_p%p' p = <cur_player_num>
	formatText checksumName = cs_jumped 'g_cs_jumped_p%p' p = <cur_player_num>
	formatText checksumName = hilite_container 'char_select_hilite_container_p%p' p = <cur_player_num>
	formatText checksumName = cs_name_text 'cs_name_text_p%p' p = <cur_player_num>
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
	<icon_dims> = (48.0, 96.0)
	<icon_scale> = 0.75
	<next_icon_pos> = (210.0, 160.0)
	Change \{g_cs_select_extra_w = 67}
	Change \{g_cs_select_extra_h = 134}
	Change \{g_cs_select_normal_w = 48}
	Change \{g_cs_select_normal_h = 96}
	if (<cur_player_num> = 2)
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
		formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <cur_player_num> d = <i>
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
		if (<cur_player_num> = 2)
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
		if (<cur_player_num> = 2)
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
	cs_load_characters starting_index = $<cs_jumped> Player = <cur_player_num>
	purpley = [240 220 255 255]
	orangey = [250 225 200 255]
	purpley_spotlight = [240 220 255 64]
	orangey_spotlight = [250 225 200 64]
	hilite_container_pos = (160.0, 50.0)
	if ($current_num_players = 2)
		if (<cur_player_num> = 1)
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
	formatText checksumName = cs_jumped 'g_cs_jumped_p%d' d = <cur_player_num>
	flags = {}
	if (<cur_player_num> = 2)
		<flags> = {flip_v}
	endif
	formatText checksumName = icon_id 'cs_icon_p%p_id_%d' p = <cur_player_num> d = $<char_select_icon>
	get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon>) Player = <cur_player_num>
	get_musician_profile_struct index = <index>
	SetScreenElementProps id = <icon_id> texture = (<profile_struct>.icon_on)
	GetScreenElementDims id = <icon_id>
	<icon_id> :SetProps dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
	GetScreenElementProps id = <icon_id>
	<icon_id> :SetProps Pos = (<Pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	<i> = 1
	begin
	formatText checksumName = hilite_id 'cs_hilite%d_p%p' d = <i> p = <cur_player_num>
	if (<i> = 3)
		<i> = 2
	endif
	formatText checksumName = hilite_tex 'Char_Select_Hilite%d' d = <i>
	hilite_rgba = [200 90 40 255]
	if (<cur_player_num> = 2)
		<hilite_rgba> = [180 130 220 255]
	endif
	displaySprite id = <hilite_id> parent = <hilite_container> Pos = (80.0, 40.0) tex = <hilite_tex> dims = (<icon_scale> * (220.0, 220.0)) just = 0 z = 49
	if (<i> = 1)
		<id> :SetProps rgba = <hilite_rgba> alpha = 0.66 dims = (<icon_scale> * (180.0, 180.0))
	endif
	<i> = (<i> + 1)
	repeat 3
	if (<cur_player_num> = 1)
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
	name_just = [left center]
	if (<cur_player_num> = 2)
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
	formatText checksumName = player_text_id 'player%a_text' a = <cur_player_num>
	player_text_just = [left top]
	if (<cur_player_num> = 2)
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
	if (<cur_player_num> = 1)
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
	if (<cur_player_num> = 2)
		GetScreenElementDims id = <id>
		SetScreenElementProps id = <player_text_id> Pos = (<player_title_num_pos> - <width> * (1.0, 0.0) - (10.0, 0.0))
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
	formatText checksumName = spawnedscript 'cs_rotate_hilites_p%d' d = <cur_player_num>
	SpawnScriptNow <spawnedscript>
	cs_get_total_guitarists Player = <cur_player_num>
	formatText checksumName = total_guitarists 'cs_total_guitarists_p%i' i = <cur_player_num>
	Change GlobalName = <total_guitarists> NewValue = <num_guitarists>
	Change GlobalName = <safe_to_scroll> NewValue = 1
	Change \{menu_flow_locked = 0}
	if (<cur_player_num> = 1)
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
			if ($is_network_game = 1 && <cur_player_num> = 1)
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
	<cur_player_num> = (<cur_player_num> + 1)
	repeat ($current_num_players)
	SpawnScriptNow \{cs_2p_watch_timer}
endscript

script destroy_2p_character_select_menu 
	Change \{menu_flow_locked = 1}
	printf \{"destroy_2p_character_select_menu: exiting"}
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
	shut_down_character_hub
	KillSpawnedScript \{Name = cs_rotate_hilites_p2}
	Change \{g_cs_scroll_ready_p2 = 1}
	Change \{g_cs_choose_ready_p2 = 0}
	destroy_menu \{menu_id = char_select_character_container_p2}
	destroy_menu \{menu_id = char_select_container_p2}
	destroy_menu \{menu_id = char_select_hilite_container_p2}
	destroy_menu \{menu_id = scrolling_character_select_p2}
	clean_up_user_control_helpers
	shut_down_character_hub
	Change \{menu_flow_locked = 0}
endscript

script cs_2p_watch_timer 
	printf \{"cs_2p_watch_timer: spawn"}
	SpawnScriptNow \{set_countdown_timer}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{block_2p_select_choose = 1}
	if ($g_cs_choose_ready_p1 = 0)
		printf \{"cs_2p_watch_timer: p1 not chosen, selecting"}
		SpawnScriptNow \{character_2p_select_choose
			params = {
				Player = 1
				timeout = 1
			}}
	endif
	Wait \{0.5
		Seconds}
	if ($g_cs_choose_ready_p2 = 0)
		printf \{"cs_2p_watch_timer: p2 not chosen, selecting"}
		SpawnScriptNow \{character_2p_select_choose
			params = {
				Player = 2
				timeout = 1
			}}
	endif
endscript

script character_2p_select_choose \{Player = 1
		timeout = 0}
	if ($block_2p_select_choose = 1 && <timeout> = 0)
		printf "character_2p_select_choose blocked on player %a" a = <Player>
		return
	endif
	if (<Player> = 1)
		if ($g_cs_choose_ready_p1 = 0)
			printf \{"character_2p_select_choose: chose p1"}
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
			Change \{g_cs_scroll_ready_p1 = 0}
			Change \{g_cs_choose_ready_p1 = 1}
			drop_in_ready_sign \{Player = 1}
			if ScreenElementExists \{id = vmenu_character_select_p1}
				SetScreenElementProps \{id = vmenu_character_select_p1
					disable_pad_handling}
			endif
		endif
	else
		if ($g_cs_choose_ready_p2 = 0)
			printf \{"character_2p_select_choose: chose p2"}
			char_index = ($g_cs_jumped_p2 + $g_character_select_icon_index_p2)
			get_valid_character_index char_index = <char_index> Player = <Player>
			get_musician_profile_struct index = <index>
			formatText checksumName = character_id '%s' s = (<profile_struct>.Name)
			Change structurename = player2_status character_id = <character_id>
			Change \{g_cs_scroll_ready_p2 = 0}
			Change \{g_cs_choose_ready_p2 = 1}
			drop_in_ready_sign \{Player = 2}
			if ScreenElementExists \{id = vmenu_character_select_p2}
				SetScreenElementProps \{id = vmenu_character_select_p2
					disable_pad_handling}
			endif
		endif
	endif
	if ($g_cs_choose_ready_p1 = 1 && $g_cs_choose_ready_p2 = 1)
		KillSpawnedScript \{Name = cs_2p_watch_timer}
		printf \{"character_2p_select_choose: both players chosen, we are out of here"}
		ui_flow_manager_respond_to_action \{action = continue}
	endif
endscript
