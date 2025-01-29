g_cs_jumped_p1 = 0
g_cs_jumped_p2 = 0
g_character_select_icon_index_p1 = 0
g_character_select_icon_index_p2 = 0
0x59070ac3 = 0
0xc00e5b79 = 0
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
g_cs_num_icons = 13
character_select_highlighted_character_p1 = 0
character_select_highlighted_character_p2 = 0

script cs_go_back \{player = 1}
	clean_up_user_control_helpers
	shut_down_character_hub
	destroy_gamertags
	if (<player> = 1)
		shut_down_flow_manager \{player = 2}
		ui_flow_manager_respond_to_action \{action = go_back}
	else
		shut_down_flow_manager \{player = 1}
		shut_down_flow_manager \{player = 2}
		if ($game_mode = p2_career)
			progression_push_current
			start_flow_manager \{flow_state = coop_career_select_difficulty_fs}
		else
			start_flow_manager \{flow_state = mp_select_mode_fs}
		endif
	endif
endscript

script create_character_select_menu player = 1
	change rich_presence_context = presence_character_select
	if (<player> = 1)
		if ($num_user_control_helpers = 0)
			add_user_control_helper text = "SELECT" button = green z = 100
			add_user_control_helper text = "BACK" button = red z = 100
			add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
		endif
	endif
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		netsessionfunc obj = voice func = entering_free_skate
		<exclusive_dev> = $primary_controller
	else
		if (<player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	cs_menu_pos = (400.0, 120.0)
	if (($is_network_game) = 1)
		cs_event_handlers = [
			{pad_up cs_scroll_up_or_down params = {player = <player> dir = up}}
			{pad_down cs_scroll_up_or_down params = {player = <player> dir = down}}
			{pad_back net_cs_go_back params = {player = <player>}}
			{pad_choose character_select_choose params = {player = <player>}}
			{pad_start menu_show_gamercard}
		]
	else
		cs_event_handlers = [
			{pad_up cs_scroll_up_or_down params = {player = <player> dir = up}}
			{pad_down cs_scroll_up_or_down params = {player = <player> dir = down}}
			{pad_back cs_go_back params = {player = <player>}}
			{pad_choose character_select_choose params = {player = <player>}}
		]
	endif
	if (<player> = 2)
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
		}
		if (($is_network_game) = 1)
			launchevent type = unfocus target = vmenu_character_select_p2
		endif
	else
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_character_select_p1
				vmenuid = vmenu_character_select_p1
				name = <menu_title_text>
				menu_pos = <cs_menu_pos>
				use_backdrop = (0)
				font = fontgrid_title_gh3
				font_size = 1.0
				event_handlers = <cs_event_handlers>
				no_wrap
			}
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
			}
		endif
	endif
	if find_profile_by_id id = ($player1_status.character_id)
		get_valid_character_index_reverse index = <index>
		change character_select_highlighted_character_p1 = <char_index>
	endif
	if find_profile_by_id id = ($player2_status.character_id)
		get_valid_character_index_reverse index = <index>
		change character_select_highlighted_character_p2 = <char_index>
	endif
	if (<player> = 1)
		mod a = $character_select_highlighted_character_p1 b = $g_cs_num_icons
		change g_cs_jumped_p1 = (($character_select_highlighted_character_p1 / $g_cs_num_icons) * $g_cs_num_icons)
		change g_character_select_icon_index_p1 = <mod>
	else
		mod a = $character_select_highlighted_character_p2 b = $g_cs_num_icons
		change g_cs_jumped_p2 = (($character_select_highlighted_character_p2 / $g_cs_num_icons) * $g_cs_num_icons)
		change g_character_select_icon_index_p2 = <mod>
	endif
	character_select_menu_highlight_name player = 1 musician_index = ($character_select_highlighted_character_p1)
	character_select_menu_highlight_name player = 2 musician_index = ($character_select_highlighted_character_p2)
	formattext checksumname = player_status 'player%i_status' i = <player>
	char_name = ($<player_status>.band_member)
	extendcrc <char_name> '_Info' out = info_struct
	change structurename = <info_struct> current_anim = idle
	change structurename = <info_struct> cycle_anim = true
	change structurename = <info_struct> next_anim = none
	change structurename = player1_status part = guitar
	change structurename = player2_status part = guitar
	setup_character_hub player = <player>
	if 0x37682df8 name = <char_name>
		if NOT ($<info_struct>.stance = stance_frontend)
			<char_name> :handle_change_stance stance = stance_frontend no_wait
		endif
	endif
	outfit = ($player1_status.outfit)
	if NOT ($player1_status.outfit = 1 && $player1_status.style = 1)
		change structurename = player1_status outfit = 1
		change structurename = player1_status style = 1
		change globalname = generic_select_monitor_p1_changed newvalue = 1
	endif
	if NOT ($player2_status.outfit = 1 && $player2_status.style = 1)
		change structurename = player2_status outfit = 1
		change structurename = player2_status style = 1
		change globalname = generic_select_monitor_p2_changed newvalue = 1
	endif
	if find_profile_by_id id = ($<player_status>.character_id)
		get_musician_profile_struct index = <index>
		change structurename = <player_status> instrument_id = (<profile_struct>.musician_instrument.desc_id)
		formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
		change globalname = <change_flag> newvalue = 1
	endif
	playigccam {
		id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (2.503113, 1.0385579, 2.869411)
		quat = (0.028074998, -0.999026, 0.020287)
		fov = 78.0
		play_hold = 1
		interrupt_current
	}
	formattext checksumname = char_select_parent_container 'char_select_container_p%p' p = <player>
	formattext checksumname = char_select_character_container 'char_select_character_container_p%p' p = <player>
	formattext checksumname = char_select_next_icon 'cs_icon_id_next_p%p' p = <player>
	formattext checksumname = icon_id_prev 'cs_icon_id_prev_p%p' p = <player>
	formattext checksumname = char_select_icon 'g_character_select_icon_index_p%p' p = <player>
	formattext checksumname = cs_jumped 'g_cs_jumped_p%p' p = <player>
	formattext checksumname = hilite_container 'char_select_hilite_container_p%p' p = <player>
	formattext checksumname = cs_name_text 'cs_name_text_p%p' p = <player>
	createscreenelement {
		type = containerelement
		id = <char_select_parent_container>
		parent = root_window
		pos = (0.0, 0.0)
	}
	<char_select_parent_container> :settags pos = (0.0, 0.0)
	get_musician_profile_size
	next_icon_pos = (210.0, 70.0)
	left = 0
	icon_dims = (64.0, 128.0)
	icon_scale = 1
	if ($current_num_players = 2)
		<icon_dims> = (48.0, 96.0)
		<icon_scale> = 0.75
		<next_icon_pos> = (210.0, 160.0)
		change g_cs_select_extra_w = 67
		change g_cs_select_extra_h = 134
		change g_cs_select_normal_w = 48
		change g_cs_select_normal_h = 96
	else
		change g_cs_select_extra_w = 89
		change g_cs_select_extra_h = 179
		change g_cs_select_normal_w = 64
		change g_cs_select_normal_h = 128
	endif
	if (<player> = 2)
		<next_icon_pos> = (1020.0, 160.0)
		<prev_pos> = ((-80.0, -90.0) * <icon_scale>)
	else
		<prev_pos> = ((80.0, -90.0) * <icon_scale>)
	endif
	displaysprite {
		id = <icon_id_prev>
		parent = <char_select_parent_container>
		tex = char_select_menu_arrow
		pos = (<next_icon_pos> + <prev_pos>)
		dims = <icon_dims>
		flip_h
	}
	doscreenelementmorph id = <icon_id_prev> alpha = 0
	hilight_pos = (0.0, 0.0)
	num_hilite_add = 0
	i = 0
	begin
	if (<i> < $g_cs_num_icons)
		formattext checksumname = icon_id 'cs_icon_p%p_id_%d' p = <player> d = <i>
		displaysprite {
			id = <icon_id>
			parent = <char_select_parent_container>
			tex = char_select_default
			pos = (<next_icon_pos> + ((32.0, 64.0) * <icon_scale>))
			dims = <icon_dims>
			just = [center center]
			z = 5
		}
		<icon_id> :settags selectable = 0 pos = <next_icon_pos>
		displaysprite {
			parent = <char_select_parent_container>
			tex = white
			rgba = [0 0 0 255]
			pos = (<next_icon_pos> - (5.0, 5.0))
			scale = ((19 * <icon_scale> * (1.0, 0.0)) + (21 * <icon_scale> * (0.0, 1.0)))
		}
	else
		displaysprite {
			id = <char_select_next_icon>
			parent = <char_select_parent_container>
			tex = char_select_menu_arrow
			pos = <next_icon_pos>
			dims = <icon_dims>
		}
		if (<array_size> > $g_cs_num_icons)
		else
			doscreenelementmorph id = <char_select_next_icon> alpha = 0
		endif
	endif
	if (<left>)
		if (<player> = 2)
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
		if (<player> = 2)
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
	cs_load_characters starting_index = $<cs_jumped> player = <player>
	purpley = [240 220 255 255]
	orangey = [250 225 200 255]
	purpley_spotlight = [240 220 255 64]
	orangey_spotlight = [250 225 200 64]
	hilite_container_pos = (160.0, 50.0)
	if ($current_num_players = 2)
		if (<player> = 1)
			<hilite_container_pos> = (160.0, 120.0)
		else
			<hilite_container_pos> = (955.0, 120.0)
		endif
	endif
	<hilite_container_pos> = (<hilite_container_pos> + <hilight_pos>)
	createscreenelement {
		type = containerelement
		id = <hilite_container>
		parent = root_window
		pos = <hilite_container_pos>
	}
	<hilite_container> :settags pos = <hilite_container_pos>
	formattext checksumname = cs_jumped 'g_cs_jumped_p%d' d = <player>
	flags = {}
	if (<player> = 2)
		<flags> = {flip_v}
	endif
	formattext checksumname = icon_id 'cs_icon_p%p_id_%d' p = <player> d = $<char_select_icon>
	get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon>)
	get_musician_profile_struct index = <index>
	setscreenelementprops id = <icon_id> texture = (<profile_struct>.icon_on)
	getscreenelementdims id = <icon_id>
	<icon_id> :setprops dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
	getscreenelementprops id = <icon_id>
	<icon_id> :setprops pos = (<pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	<i> = 1
	begin
	formattext checksumname = hilite_id 'cs_hilite%d_p%p' d = <i> p = <player>
	if (<i> = 3)
		<i> = 2
	endif
	formattext checksumname = hilite_tex 'Char_Select_Hilite%d' d = <i>
	hilite_rgba = [200 90 40 255]
	if (<player> = 2)
		<hilite_rgba> = [180 130 220 255]
	endif
	displaysprite id = <hilite_id> parent = <hilite_container> pos = (80.0, 40.0) tex = <hilite_tex> dims = (<icon_scale> * (220.0, 220.0)) just = 0 z = 49
	if (<i> = 1)
		<id> :setprops rgba = <hilite_rgba> alpha = 0.66 dims = (<icon_scale> * (180.0, 180.0))
	endif
	<i> = (<i> + 1)
	repeat 3
	if (<player> = 1)
		player_number = "1"
		player_name_pos = (<cs_menu_pos> + (-180.0, -40.0))
		player_title_pos = (<cs_menu_pos> + (-180.0, 0.0))
		player_title_num_pos = (<cs_menu_pos> + (-70.0, 15.0))
	else
		player_number = "2"
		player_name_pos = (<cs_menu_pos> + (675.0, -40.0))
		player_title_pos = (<cs_menu_pos> + (540.0, 0.0))
		player_title_num_pos = (<cs_menu_pos> + (650.0, 15.0))
	endif
	<icon_id> :gettags
	getuppercasestring <char_name>
	if ($current_num_players = 1)
		<brown_window_color> = [170 90 35 255]
		<window_fill_color> = [0 0 0 200]
		<cs_menu_starting_pos> = (512.0, 110.0)
		displaysprite {
			parent = <char_select_parent_container>
			tex = window_frame_cap
			pos = <cs_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <brown_window_color>
			z = 0
		}
		displaysprite {
			parent = <char_select_parent_container>
			tex = window_fill_cap
			pos = <cs_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <window_fill_color>
			z = 0
		}
		displaysprite {
			parent = <char_select_parent_container>
			tex = window_header_01
			pos = (<cs_menu_starting_pos> + (0.0, -40.0))
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <brown_window_color>
			z = 1
		}
		displaysprite {
			parent = <char_select_parent_container>
			tex = window_frame_body_tall
			pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 434.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
		}
		displaysprite {
			parent = <char_select_parent_container>
			tex = window_fill_body_large
			pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 434.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
		}
		displaysprite {
			parent = <char_select_parent_container>
			tex = window_frame_cap
			pos = (<cs_menu_starting_pos> + (0.0, 466.0))
			dims = (256.0, 64.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
			flip_h
		}
		displaysprite {
			parent = <char_select_parent_container>
			tex = window_fill_cap
			pos = (<cs_menu_starting_pos> + (0.0, 466.0))
			dims = (256.0, 64.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
			flip_h
		}
		displaysprite {
			parent = <char_select_parent_container>
			tex = char_select_frame_bg
			pos = (507.0, 210.0)
			dims = (266.0, 128.0)
			just = [center center]
			rgba = [250 250 200 255]
			z = 1
		}
		displaytext {
			parent = <char_select_parent_container>
			text = "SELECT YOUR HERO"
			pos = (<cs_menu_starting_pos> + (0.0, 20.0))
			scale = (0.55, 0.55)
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [180 100 60 255]
			z = 1
		}
		createscreenelement {
			type = textelement
			id = <cs_name_text>
			parent = <char_select_parent_container>
			just = [center center]
			pos = (506.0, 220.0)
			scale = 1
			text = <uppercasestring>
			font = fontgrid_title_gh3
			rgba = [140 50 7 255]
			z_priority = 30
		}
		getscreenelementdims id = <cs_name_text>
		if (<width> > 256)
			fit_text_in_rectangle id = <cs_name_text> dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) pos = (506.0, 220.0)
		endif
		displaytext parent = <char_select_parent_container> text = "Bio:" pos = (405.0, 280.0) rgba = [200 90 40 255] scale = 0.7 z = 1
		createscreenelement {
			type = containerelement
			parent = root_window
			id = select_guitar_container
			pos = (510.0, 0.0)
		}
		get_valid_character_index char_index = ($g_character_select_icon_index_p1)
		get_musician_profile_struct index = <index>
		select_guitar_change_blurb_text {
			text = (<profile_struct>.blurb)
			dims = (388.0, 270.0)
			z = 3
		}
	else
		name_just = [left center]
		if (<player> = 2)
			<name_just> = [right center]
		endif
		displaytext {
			id = <cs_name_text>
			parent = <char_select_parent_container>
			text = <uppercasestring>
			font = text_a5
			just = <name_just>
			pos = <player_name_pos>
			scale = 1
			rgba = [233 233 233 255]
			z_priority = 3
		}
		getscreenelementdims id = <cs_name_text>
		if (<width> > 400)
			fit_text_in_rectangle id = <cs_name_text> dims = (400.0, 50.0) pos = (<cs_menu_pos> + (274.0, -14.0)) just = left
		endif
		if ($is_network_game)
			if (<player> = 1)
				netsessionfunc obj = match func = get_gamertag
				<player_identifier> = <name>
				color = ($player1_color)
				gt_pos = (235.0, 105.0)
				gt_just = [left top]
			else
				<player_identifier> = ($opponent_gamertag)
				color = ($player2_color)
				gt_pos = (1065.0, 105.0)
				gt_just = [right top]
			endif
			ui_print_gamertag name = <player_identifier> start_pos = <gt_pos> color = <color> player = <player> just = (<gt_just>) dims = (450.0, 35.0)
		else
			displaytext {
				parent = <char_select_parent_container>
				text = "PLAYER"
				font = fontgrid_title_gh3
				just = [left center]
				internal_just = [left left]
				pos = <player_title_pos>
				scale = 0.75
				rgba = <purpley>
				z_priority = 3
			}
			displaytext {
				parent = <char_select_parent_container>
				text = <player_number>
				font = fontgrid_title_gh3
				just = [left center]
				internal_just = [left left]
				pos = <player_title_num_pos>
				scale = (1.0, 1.25)
				rgba = <purpley>
				z_priority = 3
			}
		endif
	endif
	createscreenelement {
		type = containerelement
		id = <char_select_character_container>
		parent = root_window
		pos = (0.0, 0.0)
	}
	if compositeobjectexists name = guitarist
		guitarist :handle_change_stance stance = stance_frontend
	endif
	if compositeobjectexists name = bassist
		bassist :handle_change_stance stance = stance_frontend
	endif
	formattext checksumname = spawnedscript 'cs_rotate_hilites_p%d' d = <player>
	spawnscriptnow <spawnedscript>
endscript

script destroy_character_select_menu 
	if (<player> = 1)
		killspawnedscript name = cs_rotate_hilites_p1
		change g_cs_scroll_ready_p1 = 1
		change g_cs_choose_ready_p1 = 0
		destroy_menu menu_id = char_select_character_container_p1
		destroy_menu menu_id = char_select_container_p1
		destroy_menu menu_id = char_select_hilite_container_p1
		destroy_menu menu_id = scrolling_character_select_p1
		killspawnedscript name = select_guitar_scroll_instrument_info
		destroy_menu menu_id = gs_instrument_info_scroll_window
		destroy_menu menu_id = select_guitar_container
	else
		killspawnedscript name = cs_rotate_hilites_p2
		change g_cs_scroll_ready_p2 = 1
		change g_cs_choose_ready_p2 = 0
		destroy_menu menu_id = char_select_character_container_p2
		destroy_menu menu_id = char_select_container_p2
		destroy_menu menu_id = char_select_hilite_container_p2
		destroy_menu menu_id = scrolling_character_select_p2
	endif
endscript

script cs_check_if_new_page \{dir = down}
	if (<dir> = down)
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

script cs_scroll_up_or_down player = 1 dir = down
	formattext checksumname = scroll_ready 'g_cs_scroll_ready_p%d' d = <player>
	formattext checksumname = char_select_icon_index 'g_character_select_icon_index_p%d' d = <player>
	formattext checksumname = cs_jumped 'g_cs_jumped_p%d' d = <player>
	formattext checksumname = hilite_container 'char_select_hilite_container_p%d' d = <player>
	formattext checksumname = cs_name_text 'cs_name_text_p%d' d = <player>
	formattext checksumname = cs_last_guitarist 'g_cs_last_guitarist_p%d' d = <player>
	cs_get_total_guitarists
	if NOT ($<scroll_ready>)
		return
	endif
	if (<player> = 1)
		if ($g_cs_choose_ready_p1)
			return
		endif
	else
		if ($g_cs_choose_ready_p2)
			return
		endif
	endif
	change g_cs_hilite_rot1 = 360.0
	change g_cs_hilite_rot2 = 180.0
	cs_check_if_new_page dir = <dir> icon_index = $<char_select_icon_index> total_guitarists = <num_guitarists>
	if (<dir> = down)
		pos_or_neg_one = 1
	else
		pos_or_neg_one = -1
	endif
	flags = {}
	if (<player> = 2)
		<flags> = {flip_v}
	endif
	if (<cs_go_new_page>)
		old_icon_index = $<char_select_icon_index>
		old_jumped = $<cs_jumped>
		if (<dir> = up)
			if ($<cs_jumped> > 0)
				change globalname = <cs_jumped> newvalue = ($<cs_jumped> - $g_cs_num_icons)
				change globalname = <char_select_icon_index> newvalue = 12
			else
				return
			endif
		else
			change globalname = <cs_jumped> newvalue = ($<cs_jumped> + $g_cs_num_icons)
			change globalname = <char_select_icon_index> newvalue = 0
		endif
		formattext checksumname = icon_id 'cs_icon_p%p_id_%d' p = <player> d = <old_icon_index>
		if screenelementexists id = <icon_id>
			get_valid_character_index char_index = (<old_jumped> + <old_icon_index>)
			get_musician_profile_struct index = <index>
			setscreenelementprops id = <icon_id> texture = (<profile_struct>.icon_off)
			getscreenelementdims id = <icon_id>
			<icon_id> :setprops dims = (($g_cs_select_normal_w * (1.0, 0.0)) + ($g_cs_select_normal_h * (0.0, 1.0))) z_priority = 5
			getscreenelementprops id = <icon_id>
			<icon_id> :setprops pos = (<pos> - ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
		endif
		generic_menu_up_or_down_sound <dir>
		cs_load_characters starting_index = $<cs_jumped> player = <player>
		formattext checksumname = icon_id 'cs_icon_p%p_id_%d' p = <player> d = $<char_select_icon_index>
		if screenelementexists id = <icon_id>
			get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon_index>)
			get_musician_profile_struct index = <index>
			setscreenelementprops id = <icon_id> texture = (<profile_struct>.icon_on)
			getscreenelementdims id = <icon_id>
			<icon_id> :setprops dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
			getscreenelementprops id = <icon_id>
			<icon_id> :setprops pos = (<pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
		endif
		formattext checksumname = icon_id 'cs_icon_p%p_id_%d' p = <player> d = ($<char_select_icon_index>)
		if screenelementexists id = <icon_id>
			<icon_id> :gettags
		endif
		<pos> = (<pos> - (50.0, 10.0))
		setscreenelementprops id = <hilite_container> pos = <pos>
		<hilite_container> :settags pos = <pos>
		getuppercasestring <char_name>
		setscreenelementprops id = <cs_name_text> text = <uppercasestring>
		getscreenelementdims id = <cs_name_text>
		if (<width> > 256)
			if ($current_num_players = 1)
				fit_text_in_rectangle id = <cs_name_text> dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) pos = (506.0, 220.0)
			endif
		else
			<cs_name_text> :setprops scale = 1
		endif
		character_select_menu_highlight_name player = <player> musician_index = <char_array_index>
		if ($current_num_players = 1)
			get_valid_character_index char_index = ($g_character_select_icon_index_p1)
			get_musician_profile_struct index = <index>
			select_guitar_change_blurb_text {
				text = (<profile_struct>.blurb)
				dims = (388.0, 270.0)
				z = 3
			}
		endif
		formattext checksumname = killedscript 'cs_rotate_hilites_p%d' d = <player>
		killspawnedscript name = <killedscript>
		spawnscriptnow <killedscript>
		if ((($is_network_game) = 1) && (<player> = 1))
			network_player_lobby_message {
				type = character_select
				action = update
				value1 = (<pos_or_neg_one> + 1)
				checksum = ($player1_status.character_id)
			}
		endif
		return
	endif
	if (<dir> = down)
		if (($<char_select_icon_index> + $<cs_jumped>) >= (<num_guitarists> -1))
			return
		endif
	else
		if (($<char_select_icon_index>) < 1)
			return
		endif
	endif
	generic_menu_up_or_down_sound <dir>
	formattext checksumname = icon_id 'cs_icon_p%p_id_%d' p = <player> d = $<char_select_icon_index>
	if screenelementexists id = <icon_id>
		get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon_index>)
		get_musician_profile_struct index = <index>
		setscreenelementprops id = <icon_id> texture = (<profile_struct>.icon_off)
		getscreenelementdims id = <icon_id>
		<icon_id> :setprops dims = (($g_cs_select_normal_w * (1.0, 0.0)) + ($g_cs_select_normal_h * (0.0, 1.0))) z_priority = 5
		getscreenelementprops id = <icon_id>
		<icon_id> :setprops pos = (<pos> - ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	endif
	formattext checksumname = icon_id 'cs_icon_p%p_id_%d' p = <player> d = ($<char_select_icon_index> + <pos_or_neg_one>)
	if screenelementexists id = <icon_id>
		<icon_id> :gettags
	endif
	if ((($is_network_game) = 1) && (<player> = 1))
		network_player_lobby_message {
			type = character_select
			action = update
			value1 = (<pos_or_neg_one> + 1)
			checksum = ($player1_status.character_id)
		}
	endif
	change globalname = <char_select_icon_index> newvalue = ($<char_select_icon_index> + <pos_or_neg_one>)
	<pos> = (<pos> - (50.0, 10.0))
	setscreenelementprops id = <hilite_container> pos = <pos>
	<hilite_container> :settags pos = <pos>
	formattext checksumname = icon_id 'cs_icon_p%p_id_%d' p = <player> d = $<char_select_icon_index>
	if screenelementexists id = <icon_id>
		get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon_index>)
		get_musician_profile_struct index = <index>
		setscreenelementprops id = <icon_id> texture = (<profile_struct>.icon_on)
		getscreenelementdims id = <icon_id>
		<icon_id> :setprops dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
		getscreenelementprops id = <icon_id>
		<icon_id> :setprops pos = (<pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	endif
	getuppercasestring <char_name>
	setscreenelementprops id = <cs_name_text> text = <uppercasestring>
	getscreenelementdims id = <cs_name_text>
	if (<width> > 256)
		if ($current_num_players = 1)
			fit_text_in_rectangle id = <cs_name_text> dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) pos = (506.0, 220.0)
		endif
	else
		<cs_name_text> :setprops scale = 1
	endif
	if screenelementexists id = <icon_id>
		<icon_id> :gettags
	endif
	character_select_menu_highlight_name player = <player> musician_index = <char_array_index>
	if ($current_num_players = 1)
		get_valid_character_index char_index = ($g_character_select_icon_index_p1)
		get_musician_profile_struct index = <index>
		select_guitar_change_blurb_text {
			text = (<profile_struct>.blurb)
			dims = (388.0, 270.0)
			z = 3
		}
	endif
	formattext checksumname = killedscript 'cs_rotate_hilites_p%d' d = <player>
	killspawnedscript name = <killedscript>
	spawnscriptnow <killedscript>
endscript

script cs_rotate_hilites_p1 time = 3.0
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	setscreenelementprops id = cs_hilite2_p1 rot_angle = 0 alpha = 0
	setscreenelementprops id = cs_hilite3_p1 rot_angle = 0 alpha = 0
	begin
	i = 1
	begin
	if screenelementexists id = cs_hilite2_p1
		doscreenelementmorph id = cs_hilite2_p1 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if screenelementexists id = cs_hilite3_p1
		doscreenelementmorph id = cs_hilite3_p1 rot_angle = <rot2> alpha = <alpha2> time = <time>
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
	wait <time> seconds
	repeat
endscript

script cs_rotate_hilites_p2 time = 3.0
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	setscreenelementprops id = cs_hilite2_p2 rot_angle = 0 alpha = 0
	setscreenelementprops id = cs_hilite3_p2 rot_angle = 0 alpha = 0
	begin
	i = 1
	begin
	if screenelementexists id = cs_hilite2_p2
		doscreenelementmorph id = cs_hilite2_p2 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if screenelementexists id = cs_hilite3_p2
		doscreenelementmorph id = cs_hilite3_p2 rot_angle = <rot2> alpha = <alpha2> time = <time>
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
	wait <time> seconds
	repeat
endscript

script get_valid_character_index_reverse \{index = 0}
	search_index = <index>
	char_index = 0
	begin
	if NOT get_valid_character_index char_index = <char_index>
		break
	endif
	if (<search_index> = <index>)
		return char_index = <char_index> true
	endif
	char_index = (<char_index> + 1)
	repeat
	return \{char_index = 0
		false}
endscript

script get_valid_character_index char_index = 0
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	valid = 1
	if NOT is_musician_profile_downloaded index = <index>
		valid = 0
	endif
	if structurecontains structure = (<profile_struct>) debug_only
		valid = 0
	endif
	if NOT (<profile_struct>.type = guitarist)
		valid = 0
	endif
	if getglobaltags (<profile_struct>.musician_body.desc_id) noassert = 1
		if (<unlocked> = 0)
			valid = 0
		endif
	endif
	if (<valid> = 1)
		if (<char_index> = 0)
			return index = <index> true
		endif
		char_index = (<char_index> - 1)
	endif
	index = (<index> + 1)
	repeat <array_size>
	return false
endscript

script character_select_choose 
	if (<player> = 1)
		char_index = ($g_cs_jumped_p1 + $g_character_select_icon_index_p1)
		get_valid_character_index char_index = <char_index>
		get_musician_profile_struct index = <index>
		formattext checksumname = character_id '%s' s = (<profile_struct>.name)
		change structurename = player1_status character_id = <character_id>
		if (($is_network_game) = 1)
			network_player_lobby_message {
				type = character_select
				action = select
				checksum = <character_id>
			}
		endif
	else
		char_index = ($g_cs_jumped_p2 + $g_character_select_icon_index_p2)
		get_valid_character_index char_index = <char_index>
		get_musician_profile_struct index = <index>
		formattext checksumname = character_id '%s' s = (<profile_struct>.name)
		change structurename = player2_status character_id = <character_id>
	endif
	ui_flow_manager_respond_to_action action = continue create_params = {player = <player>} player = <player>
endscript

script cs_load_characters starting_index = $g_cs_jumped_p1 player = 1
	cs_get_total_guitarists
	remaining = (<num_guitarists> - <starting_index>)
	if (<remaining> > $g_cs_num_icons)
		<remaining> = $g_cs_num_icons
		if (<player> = 2)
			doscreenelementmorph id = cs_icon_id_next_p2 alpha = 1
		else
			doscreenelementmorph id = cs_icon_id_next_p1 alpha = 1
		endif
	else
		if (<player> = 2)
			doscreenelementmorph id = cs_icon_id_next_p2 alpha = 0
		else
			doscreenelementmorph id = cs_icon_id_next_p1 alpha = 0
		endif
	endif
	if (<starting_index> > 0)
		if (<player> = 2)
			doscreenelementmorph id = cs_icon_id_prev_p2 alpha = 1
		else
			doscreenelementmorph id = cs_icon_id_prev_p1 alpha = 1
		endif
	else
		if (<player> = 2)
			doscreenelementmorph id = cs_icon_id_prev_p2 alpha = 0
		else
			doscreenelementmorph id = cs_icon_id_prev_p1 alpha = 0
		endif
	endif
	cs_reset_selectables player = <player>
	char_index = 0
	begin
	get_valid_character_index char_index = (<char_index> + <starting_index>)
	get_musician_profile_struct index = <index>
	if (<player> = 1)
		formattext checksumname = icon_id 'cs_icon_p1_id_%d' d = <char_index>
	elseif (<player> = 2)
		formattext checksumname = icon_id 'cs_icon_p2_id_%d' d = <char_index>
	endif
	if screenelementexists id = <icon_id>
		flags = {}
		if (<player> = 2)
			<flags> = {flip_v}
		endif
		setscreenelementprops id = <icon_id> texture = (<profile_struct>.icon_off) <flags>
		if structurecontains structure = (<profile_struct>) fullname
			character_name = (<profile_struct>.fullname)
		else
			character_name = (<profile_struct>.name)
		endif
		<icon_id> :settags {
			selectable = 1
			char_name = <character_name>
			char_array_index = (<char_index> + <starting_index>)
		}
	endif
	char_index = (<char_index> + 1)
	repeat <remaining>
endscript

script cs_reset_selectables player = 1
	i = 0
	begin
	if (<player> = 1)
		formattext checksumname = icon_id 'cs_icon_p1_id_%d' d = <i>
		if screenelementexists id = <icon_id>
			setscreenelementprops id = <icon_id> texture = char_select_default
			<icon_id> :settags selectable = 0
		endif
	else
		formattext checksumname = icon_id 'cs_icon_p2_id_%d' d = <i>
		if screenelementexists id = <icon_id>
			setscreenelementprops id = <icon_id> texture = char_select_default
			<icon_id> :settags selectable = 0
		endif
	endif
	<i> = (<i> + 1)
	repeat $g_cs_num_icons
endscript

script cs_set_containers_above_or_below player = 1
	formattext checksumname = next_icon_pos 'next_icon_pos_p%d' d = <player>
	formattext checksumname = hilite_container 'char_select_hilite_container_p%d' d = <player>
	formattext checksumname = char_select_container 'char_select_container_p%d' d = <player>
	if gotparam above
		if (<player> = 1)
			<next_icon_pos> = (155.0, 540.0)
		else
			<next_icon_pos> = (960.0, 550.0)
		endif
		setscreenelementprops id = <char_select_container> pos = (0.0, -720.0)
		<char_select_container> :settags pos = (0.0, -720.0)
		setscreenelementprops id = <hilite_container> pos = (<next_icon_pos> - (0.0, 720.0))
		<hilite_container> :settags pos = (<next_icon_pos> - (0.0, 720.0))
	else
		if (<player> = 1)
			<next_icon_pos> = (155.0, 50.0)
		else
			<next_icon_pos> = (955.0, 60.0)
		endif
		setscreenelementprops id = <char_select_container> pos = (0.0, 720.0)
		<char_select_container> :settags pos = (0.0, 720.0)
		setscreenelementprops id = <hilite_container> pos = (<next_icon_pos> + (0.0, 720.0))
		<hilite_container> :settags pos = (<next_icon_pos> + (0.0, 720.0))
	endif
endscript

script cs_get_total_guitarists 
	array_entry = 0
	begin
	if NOT get_valid_character_index char_index = <array_entry>
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat
	return num_guitarists = <array_entry>
endscript

script character_select_menu_highlight_name player = 1
	if (<player> = 1)
		change character_select_highlighted_character_p1 = <musician_index>
		get_valid_character_index char_index = <musician_index>
		get_musician_profile_struct index = <index>
		formattext checksumname = character_id '%s' s = (<profile_struct>.name)
	else
		change character_select_highlighted_character_p2 = <musician_index>
		get_valid_character_index char_index = <musician_index>
		get_musician_profile_struct index = <index>
		formattext checksumname = character_id '%s' s = (<profile_struct>.name)
	endif
	formattext checksumname = player_status 'player%i_status' i = <player>
	if NOT (<character_id> = $<player_status>.character_id)
		change structurename = <player_status> character_id = <character_id>
		if find_profile_by_id id = <character_id>
			get_musician_profile_struct index = <index>
			0xc7bf5f1a = (<profile_struct>.musician_instrument.desc_id)
			change structurename = <player_status> instrument_id = <0xc7bf5f1a>
		endif
		formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
		change globalname = <change_flag> newvalue = 1
	endif
endscript
