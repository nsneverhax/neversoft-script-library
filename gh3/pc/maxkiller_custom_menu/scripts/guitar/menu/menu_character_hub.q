g_hub_destroy = 0
g_hub_created = 0
g_hub_helpers_created = 0
g_hub_characters_dirty = 1

script set_character_hub_dirty 
	change \{g_hub_characters_dirty = 1}
endscript

script do_character_hub_dirty 
	<player> = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	if find_profile_by_id id = ($<player_status>.character_id)
		get_musician_profile_struct index = <index>
		formattext checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player> addtostringlookup = true
		if getglobaltags <default_characterguitartag> noassert = 1
			printf <current_instrument>
			printf \{$game_mode}
			if (<current_instrument> = guitar)
				<inst_id> = <current_selected_guitar>
			else
				if NOT ($game_mode = p2_career)
					setglobaltags <default_characterguitartag> params = {current_instrument = guitar}
					<inst_id> = <current_selected_guitar>
				else
					<inst_id> = <current_selected_bass>
				endif
			endif
			change structurename = <player_status> instrument_id = <inst_id>
			change structurename = <player_status> outfit = <current_outfit>
			change structurename = <player_status> style = <current_style>
		endif
	endif
	<player> = 2
	repeat 2
	create_guitarist \{name = guitarist
		useoldpos
		no_strum
		animpak = 0}
	create_guitarist \{name = bassist
		useoldpos
		no_strum
		animpak = 0}
	if ($current_num_players = 1)
		if compositeobjectexists \{name = bassist}
			bassist :hide
		endif
	endif
	if (($is_network_game = 1) && ($player2_present = 0))
		if compositeobjectexists name = ($player2_status.band_member)
			($player2_status.band_member) :hide
		endif
	endif
	change \{g_hub_characters_dirty = 0}
endscript

script create_character_hub_menu \{player = 1}
	if ($g_hub_characters_dirty)
		do_character_hub_dirty
	endif
	change \{menu_flow_locked = 1}
	if (<player> = 1)
		change \{p1_ready = 0}
	else
		change \{p2_ready = 0}
	endif
	exclusive_dev = $player1_device
	if (<player> = 2)
		if (($is_network_game) = 0)
			<exclusive_dev> = $player2_device
		else
			<exclusive_dev> = $primary_controller
		endif
	else
		if (($is_network_game) = 1)
			<exclusive_dev> = $primary_controller
		endif
		if ($num_user_control_helpers = 0)
			add_user_control_helper \{text = "SELECT"
				button = green
				z = 100}
			add_user_control_helper \{text = "BACK"
				button = red
				z = 100}
			add_user_control_helper \{text = "UP/DOWN"
				button = strumbar
				z = 100}
			change \{g_hub_helpers_created = 1}
		endif
	endif
	event_handlers = [
		{pad_up character_hub_generic_sound params = {player = <player> up}}
		{pad_down character_hub_generic_sound params = {player = <player> down}}
		{pad_back character_hub_go_back params = {player = <player>}}
		{pad_start menu_show_gamercard}
	]
	if ($is_network_game)
		event_handlers = [
			{pad_up character_hub_generic_sound params = {player = <player> up}}
			{pad_down character_hub_generic_sound params = {player = <player> down}}
			{pad_back net_request_play_show params = {action = 0}}
			{pad_start menu_show_gamercard}
		]
		net_info_panel_show
	endif
	menu_pos_tweak = (0.0, 0.0)
	if (<player> = 1)
		if (($is_network_game) = 1)
			menu_pos_tweak = (-65.0, 0.0)
		endif
		if ($current_num_players = 2)
			<menu_pos> = (360.0, 444.0)
			if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
				<menu_pos> = (<menu_pos> + (0.0, -46.0))
			endif
			new_menu scrollid = scrolling_character_hub_p1 vmenuid = vmenu_character_hub_p1 use_backdrop = 0 menu_pos = (<menu_pos> + <menu_pos_tweak>) exclusive_device = <exclusive_dev> event_handlers = <event_handlers> no_focus = 1
		else
			new_menu scrollid = scrolling_character_hub_p1 vmenuid = vmenu_character_hub_p1 use_backdrop = 0 menu_pos = (350.0, 172.0) event_handlers = <event_handlers> no_focus = 1
		endif
		vparent = vmenu_character_hub_p1
		continue_id = character_hub_p1_continue
		ch_change_char_id = ch_change_char_id_p1
		ch_change_outfit_id = ch_change_outfit_id_p1
		ch_change_guitar_id = ch_change_guitar_id_p1
		ch_change_bass_id = ch_change_bass_id_p1
		createscreenelement {
			type = containerelement
			parent = root_window
			id = character_hub_p1_container
			just = [left top]
			pos = ((0.0, 0.0) + <menu_pos_tweak>)
		}
		create_ready_icons \{pos1 = (400.0, 500.0)
			parent1 = character_hub_p1_container}
		if ($is_network_game)
			if NOT (screenelementexists id = ready_container_p2)
				create_ready_icons \{pos2 = (825.0, 450.0)
					parent2 = root_window}
			endif
		endif
	else
		<menu_pos> = (710.0, 444.0)
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			<menu_pos> = (<menu_pos> + (0.0, -46.0))
		endif
		if (($is_network_game) = 1)
			menu_pos_tweak = (75.0, 0.0)
		endif
		new_menu scrollid = scrolling_character_hub_p2 vmenuid = vmenu_character_hub_p2 use_backdrop = 0 menu_pos = (<menu_pos> + <menu_pos_tweak>) exclusive_device = <exclusive_dev> event_handlers = <event_handlers> no_focus = 1
		vparent = vmenu_character_hub_p2
		continue_id = character_hub_p2_continue
		ch_change_char_id = ch_change_char_id_p2
		ch_change_outfit_id = ch_change_outfit_id_p2
		ch_change_guitar_id = ch_change_guitar_id_p2
		ch_change_bass_id = ch_change_bass_id_p2
		if (($is_network_game) = 1)
			launchevent \{type = unfocus
				target = vmenu_character_hub_p2}
		endif
		createscreenelement {
			type = containerelement
			parent = root_window
			id = character_hub_p2_container
			just = [left top]
			pos = ((0.0, 0.0) + <menu_pos_tweak>)
		}
		create_ready_icons \{pos2 = (746.0, 500.0)
			parent2 = character_hub_p2_container}
	endif
	setup_character_hub player = <player>
	show_change_outfit = 1
	if (<player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
	else
		find_profile_by_id id = ($player2_status.character_id)
	endif
	get_musician_profile_struct index = <index>
	if NOT structurecontains structure = (<profile_struct>) outfits
		<show_change_outfit> = 0
	endif
	if ($current_num_players = 2)
		if (<player> = 1)
			myparent = character_hub_p1_container
		else
			myparent = character_hub_p2_container
		endif
		<ch_focus_color> = [125 0 0 255]
		<ch_unfocus_color> = [180 100 60 255]
		displaysprite {
			parent = <myparent>
			tex = character_hub_hilite_bookend
			dims = (24.0, 24.0)
			just = [left top]
			rgba = [255 255 205 255]
			z = 4
		}
		<bookend1id> = <id>
		displaysprite {
			parent = <myparent>
			tex = character_hub_hilite_bookend
			dims = (24.0, 24.0)
			just = [right top]
			rgba = [255 255 205 255]
			z = 4
		}
		<bookend2id> = <id>
		displaysprite {
			parent = <myparent>
			tex = white
			just = [left top]
			rgba = [255 255 205 255]
			dims = (264.0, 32.0)
			pos = (226.0, 136.0)
			z = 2
		}
		<whitetexhighlightid> = <id>
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		if (<player> = 1)
			<hub_menu_starting_pos> = (460.0, 432.0)
		else
			<hub_menu_starting_pos> = (810.0, 432.0)
		endif
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			<hub_menu_starting_pos> = (<hub_menu_starting_pos> + (0.0, -46.0))
		endif
		displaysprite {
			parent = <myparent>
			tex = window_frame_cap
			pos = <hub_menu_starting_pos>
			dims = (256.0, 40.0)
			just = [center center]
			rgba = <brown_window_color>
			z = 0
		}
		displaysprite {
			parent = <myparent>
			tex = window_fill_cap
			pos = <hub_menu_starting_pos>
			dims = (256.0, 40.0)
			just = [center center]
			rgba = <window_fill_color>
			z = 0
		}
		displaysprite {
			parent = <myparent>
			tex = window_header_01
			pos = (<hub_menu_starting_pos> + (0.0, -40.0))
			dims = (256.0, 64.0)
			just = [center center]
			rgba = [200 200 200 255]
			z = 1
		}
		if (<show_change_outfit>)
			<mid_section_dims> = (256.0, 154.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (1.0, 174.0))
		else
			<mid_section_dims> = (256.0, 114.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (0.0, 134.0))
		endif
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			<mid_section_dims> = (<mid_section_dims> + (0.0, 46.0))
			<bottom_cap_pos> = (<bottom_cap_pos> + (0.0, 46.0))
		endif
		displaysprite {
			parent = <myparent>
			tex = window_frame_body_short
			pos = (<hub_menu_starting_pos> + (0.0, 20.0))
			dims = <mid_section_dims>
			just = [center top]
			rgba = <brown_window_color>
			z = 0
		}
		displaysprite {
			parent = <myparent>
			tex = window_fill_body_short
			pos = (<hub_menu_starting_pos> + (0.0, 20.0))
			dims = <mid_section_dims>
			just = [center top]
			rgba = <window_fill_color>
			z = 0
		}
		displaysprite {
			parent = <myparent>
			tex = window_frame_cap
			pos = <bottom_cap_pos>
			dims = (256.0, 40.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
			flip_h
		}
		displaysprite {
			parent = <myparent>
			tex = window_fill_cap
			pos = <bottom_cap_pos>
			dims = (256.0, 40.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
			flip_h
		}
		<ch_menuitemselected> = 0
		<ch_show_change_outfit> = 0
		createscreenelement {
			type = textelement
			parent = <vparent>
			id = <continue_id>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			text = "PLAY SHOW"
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuitemnum = <ch_menuitemselected>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
						chh_mp = 1
						chh_player = <player>
					}
				}
				{focus setscreenelementprops params = {id = <continue_id> rgba = <ch_focus_color>}}
				{unfocus setscreenelementprops params = {id = <continue_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_select_play_show params = {player = <player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		if (($is_network_game) = 1)
			net_event_handlers = [
				{focus character_hub_highlighter params = {
						menuitemnum = <ch_menuitemselected>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
						chh_mp = 1
						chh_player = <player>
					}
				}
				{focus setscreenelementprops params = {id = <continue_id> rgba = <ch_focus_color>}}
				{unfocus setscreenelementprops params = {id = <continue_id> rgba = <ch_unfocus_color>}}
				{pad_choose net_request_play_show params = {action = 1}}
				{pad_start menu_show_gamercard}
			]
			<continue_id> :setprops text = "Ready" rgba = [128 128 128 255] event_handlers = <net_event_handlers> replace_handlers block_events
			if (($player2_present) = 1)
				<continue_id> :setprops rgba = [180 100 60 255] unblock_events
			endif
		endif
		<ch_menuitemselected> = (<ch_menuitemselected> + 1)
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		createscreenelement {
			type = textelement
			parent = <vparent>
			id = <ch_change_char_id>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			text = "CHANGE CHARACTER"
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuitemnum = <ch_menuitemselected>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
						comi = <ch_show_change_outfit>
						chh_mp = 1
						chh_player = <player>
					}
				}
				{focus setscreenelementprops params = {id = <ch_change_char_id> rgba = <ch_focus_color>}}
				{unfocus setscreenelementprops params = {id = <ch_change_char_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_go_back params = {player = <player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuitemselected> = (<ch_menuitemselected> + 1)
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		if (<show_change_outfit>)
			<ch_show_change_outfit> = 1
			createscreenelement {
				type = textelement
				parent = <vparent>
				id = <ch_change_outfit_id>
				font = fontgrid_title_gh3
				scale = (0.8, 0.75)
				rgba = [180 100 60 255]
				text = "CHANGE OUTFIT"
				just = [center top]
				event_handlers = [
					{focus character_hub_highlighter params = {
							menuitemnum = <ch_menuitemselected>
							be1id = <bookend1id>
							be2id = <bookend2id>
							wthlid = <whitetexhighlightid>
							comi = <ch_show_change_outfit>
							chh_mp = 1
							chh_player = <player>
						}
					}
					{focus setscreenelementprops params = {id = <ch_change_outfit_id> rgba = <ch_focus_color>}}
					{unfocus setscreenelementprops params = {id = <ch_change_outfit_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_outfit params = {player = <player>}}
					{pad_start menu_show_gamercard}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuitemselected> = (<ch_menuitemselected> + 1)
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		endif
		createscreenelement {
			type = textelement
			parent = <vparent>
			id = <ch_change_guitar_id>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			text = "CHANGE GUITAR"
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuitemnum = <ch_menuitemselected>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
						comi = <ch_show_change_outfit>
						chh_mp = 1
						chh_player = <player>
					}
				}
				{focus setscreenelementprops params = {id = <ch_change_guitar_id> rgba = <ch_focus_color>}}
				{unfocus setscreenelementprops params = {id = <ch_change_guitar_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_select_change_guitar params = {player = <player> vparent = <vparent>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuitemselected> = (<ch_menuitemselected> + 1)
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			createscreenelement {
				type = textelement
				parent = <vparent>
				id = <ch_change_bass_id>
				font = fontgrid_title_gh3
				scale = (0.8, 0.75)
				rgba = [180 100 60 255]
				text = "CHANGE BASS"
				just = [center top]
				event_handlers = [
					{focus character_hub_highlighter params = {
							menuitemnum = <ch_menuitemselected>
							be1id = <bookend1id>
							be2id = <bookend2id>
							wthlid = <whitetexhighlightid>
							comi = <ch_show_change_outfit>
							chh_mp = 1
							chh_player = <player>
						}
					}
					{focus setscreenelementprops params = {id = <ch_change_bass_id> rgba = <ch_focus_color>}}
					{unfocus setscreenelementprops params = {id = <ch_change_bass_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_guitar params = {player = <player> bass vparent = <vparent>}}
					{pad_start menu_show_gamercard}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuitemselected> = (<ch_menuitemselected> + 1)
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		endif
	else
		set_focus_color \{rgba = [
				125
				0
				0
				255
			]}
		set_unfocus_color \{rgba = [
				180
				100
				60
				255
			]}
		displaysprite \{parent = character_hub_p1_container
			tex = character_hub_hilite_bookend
			pos = (320.0, 175.0)
			dims = (24.0, 24.0)
			just = [
				left
				top
			]
			rgba = [
				255
				255
				205
				255
			]
			z = 4}
		<bookend1id> = <id>
		displaysprite \{parent = character_hub_p1_container
			tex = character_hub_hilite_bookend
			pos = (588.0, 175.0)
			dims = (24.0, 24.0)
			just = [
				right
				top
			]
			rgba = [
				255
				255
				205
				255
			]
			z = 4}
		<bookend2id> = <id>
		displaysprite \{parent = character_hub_p1_container
			tex = white
			rgba = [
				255
				255
				205
				255
			]
			pos = (339.0, 171.0)
			dims = (264.0, 32.0)
			just = [
				left
				top
			]
			z = 2}
		<whitetexhighlightid> = <id>
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		<hub_menu_starting_pos> = (450.0, 140.0)
		displaysprite {
			parent = character_hub_p1_container
			tex = window_frame_cap
			pos = <hub_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <brown_window_color>
			z = 0
		}
		displaysprite {
			parent = character_hub_p1_container
			tex = window_fill_cap
			pos = <hub_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <window_fill_color>
			z = 0
		}
		displaysprite {
			parent = character_hub_p1_container
			tex = window_header_01
			pos = (<hub_menu_starting_pos> + (0.0, -40.0))
			dims = (256.0, 64.0)
			just = [center center]
			rgba = [200 200 200 255]
			z = 1
		}
		if (<show_change_outfit>)
			<mid_section_dims> = (256.0, 328.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (1.0, 360.0))
		else
			<mid_section_dims> = (256.0, 282.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (1.0, 314.0))
		endif
		<mid_section_dims> = (<mid_section_dims> + (0.0, 100.0))
		displaysprite {
			parent = character_hub_p1_container
			tex = window_frame_body_short
			pos = (<hub_menu_starting_pos> + (0.0, 32.0))
			dims = <mid_section_dims>
			just = [center top]
			rgba = <brown_window_color>
			z = 0
		}
		displaysprite {
			parent = character_hub_p1_container
			tex = window_fill_body_short
			pos = (<hub_menu_starting_pos> + (0.0, 32.0))
			dims = <mid_section_dims>
			just = [center top]
			rgba = <window_fill_color>
			z = 0
		}
		createscreenelement {
			type = spriteelement
			parent = character_hub_p1_container
			pos = <bottom_cap_pos>
			dims = (242.0, 128.0)
			just = [center top]
			texture = store_frame_bottom_bg
			z_priority = 1
			rgba = <brown_window_color>
			flip_h
			flip_v
		}
		get_current_band_info
		getglobaltags <band_info>
		formattext textname = user_cash_amount "$%d" d = (<cash>) usecommas
		createscreenelement {
			type = textelement
			parent = character_hub_p1_container
			pos = (<bottom_cap_pos> + (0.0, 53.0))
			font = text_a4
			text = <user_cash_amount>
			rgba = [255 255 205 250]
			z_priority = 2
			just = [center center]
		}
		<ch_menuitemselected> = 0
		<ch_show_change_outfit> = 0
		createscreenelement {
			type = textelement
			parent = <vparent>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			text = "PLAY SHOW"
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuitemnum = <ch_menuitemselected>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_play_show params = {player = <player>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuitemselected> = (<ch_menuitemselected> + 1)
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		createscreenelement {
			type = textelement
			parent = <vparent>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			text = "CHANGE CHARACTER"
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuitemnum = <ch_menuitemselected>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_go_back params = {player = <player>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuitemselected> = (<ch_menuitemselected> + 1)
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		if (<show_change_outfit>)
			<ch_show_change_outfit> = 1
			createscreenelement {
				type = textelement
				parent = <vparent>
				font = fontgrid_title_gh3
				scale = (0.8, 0.75)
				rgba = [180 100 60 255]
				text = "CHANGE OUTFIT"
				just = [center top]
				event_handlers = [
					{focus character_hub_highlighter params = {
							menuitemnum = <ch_menuitemselected>
							be1id = <bookend1id>
							be2id = <bookend2id>
							wthlid = <whitetexhighlightid>
							comi = <ch_show_change_outfit>
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose character_hub_select_change_outfit params = {player = <player>}}
					{pad_start menu_show_gamercard}
				]
			}
			<ch_menuitemselected> = (<ch_menuitemselected> + 1)
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		endif
		createscreenelement {
			type = textelement
			parent = <vparent>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			text = "CHANGE GUITAR"
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuitemnum = <ch_menuitemselected>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
						comi = <ch_show_change_outfit>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_change_guitar params = {player = <player> vparent = <vparent>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuitemselected> = (<ch_menuitemselected> + 1)
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		if ($is_demo_mode = 1)
			demo_mode_disable = {rgba = [80 80 80 255] not_focusable}
		else
			demo_mode_disable = {}
		endif
		createscreenelement {
			type = textelement
			parent = <vparent>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			text = "VISIT STORE"
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuitemnum = <ch_menuitemselected>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
					}
				}
				{focus setscreenelementprops params = {id = ch_gc_logo rgba = [255 255 205 255]}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = ch_gc_logo rgba = ($menu_unfocus_color)}}
				{pad_choose character_hub_select_the_store params = {player = <player>}}
				{pad_start menu_show_gamercard}
			]
			<demo_mode_disable>
		}
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		if (<show_change_outfit>)
			<logo_pos> = (450.0, 410.0)
		else
			<logo_pos> = (450.0, 365.0)
		endif
		createscreenelement {
			type = spriteelement
			id = ch_gc_logo
			parent = character_hub_p1_container
			pos = <logo_pos>
			texture = logo_guitarcenter_128
			rgba = [180 100 60 255]
			just = [center top]
			dims = (192.0, 96.0)
			z = 0
		}
	endif
	change \{g_hub_destroy = 0}
	if ($using_guitar_select_camera = 1)
		setscreenelementprops id = <bookend1id> hide
		setscreenelementprops id = <bookend2id> hide
		setscreenelementprops id = <whitetexhighlightid> hide
		launchevent type = unfocus target = <vparent>
		change \{using_guitar_select_camera = 0}
		playigccam \{id = gs_view_cam_id
			name = gs_view_cam
			viewport = bg_viewport
			controlscript = guitar_select_exit_camera_morph
			play_hold = 1
			interrupt_current}
		wait_for_guitar_select_exit_camera
		killcamanim \{name = gs_view_cam}
		if compositeobjectexists \{name = guitarist}
			if NOT ($guitarist_info.stance = stance_frontend)
				change \{structurename = guitarist_info
					current_anim = idle}
				change \{structurename = guitarist_info
					cycle_anim = true}
				change \{structurename = guitarist_info
					next_anim = none}
				guitarist :handle_change_stance \{stance = stance_frontend
					speed = 2.0
					no_wait}
			endif
		endif
		if compositeobjectexists \{name = bassist}
			if NOT ($bassist_info.stance = stance_frontend)
				if compositeobjectexists \{name = bassist}
					bassist :handle_change_stance \{stance = stance_frontend
						speed = 2.0
						no_wait}
				endif
			endif
		endif
		setscreenelementprops id = <bookend1id> unhide
		setscreenelementprops id = <bookend2id> unhide
		setscreenelementprops id = <whitetexhighlightid> unhide
	endif
	launchevent type = focus target = <vparent>
	change \{menu_flow_locked = 0}
endscript

script character_hub_highlighter \{comi = 0
		chh_mp = 0
		chh_player = 1}
	if ($current_num_players = 1)
		retail_menu_focus
	endif
	if (<chh_mp> = 0)
		switch <menuitemnum>
			case 0
			setscreenelementprops id = <be1id> pos = (303.0, 175.0)
			setscreenelementprops id = <be2id> pos = (602.0, 175.0)
			setscreenelementprops id = <wthlid> pos = (317.0, 171.0)
			case 1
			setscreenelementprops id = <be1id> pos = (303.0, 222.0)
			setscreenelementprops id = <be2id> pos = (602.0, 222.0)
			setscreenelementprops id = <wthlid> pos = (317.0, 218.0)
			case 2
			setscreenelementprops id = <be1id> pos = (303.0, 269.0)
			setscreenelementprops id = <be2id> pos = (602.0, 269.0)
			setscreenelementprops id = <wthlid> pos = (317.0, 265.0)
			case 3
			if (<comi>)
				setscreenelementprops id = <be1id> pos = (303.0, 317.0)
				setscreenelementprops id = <be2id> pos = (602.0, 317.0)
				setscreenelementprops id = <wthlid> pos = (317.0, 313.0)
			elseif (<comi> = 0)
				setscreenelementprops id = <be1id> pos = (303.0, 317.0)
				setscreenelementprops id = <be2id> pos = (602.0, 317.0)
				setscreenelementprops id = <wthlid> pos = (317.0, 313.0)
			endif
			case 4
			setscreenelementprops id = <be1id> pos = (303.0, 364.0)
			setscreenelementprops id = <be2id> pos = (602.0, 364.0)
			setscreenelementprops id = <wthlid> pos = (317.0, 360.0)
		endswitch
	elseif (<chh_mp> = 1)
		if (<chh_player> = 1)
			<offset_pos> = (0.0, 0.0)
		else
			<offset_pos> = (350.0, 0.0)
		endif
		<initial_pos> = (310.0, 446.0)
		<r_bookend_offset> = (302.0, 0.0)
		<vertical_offset> = (0.0, 47.25)
		<highlight_offset> = (17.0, -3.0)
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			<initial_pos> = (<initial_pos> + (0.0, -46.0))
		endif
		switch <menuitemnum>
			case 0
			setscreenelementprops id = <be1id> pos = (<initial_pos> + <offset_pos>)
			setscreenelementprops id = <be2id> pos = (<initial_pos> + <r_bookend_offset> + <offset_pos>)
			setscreenelementprops id = <wthlid> pos = (<initial_pos> + <highlight_offset> + <offset_pos>)
			case 1
			setscreenelementprops id = <be1id> pos = (<initial_pos> + <vertical_offset> + <offset_pos>)
			setscreenelementprops id = <be2id> pos = (<initial_pos> + <vertical_offset> + <r_bookend_offset> + <offset_pos>)
			setscreenelementprops id = <wthlid> pos = (<initial_pos> + <vertical_offset> + <highlight_offset> + <offset_pos>)
			case 2
			setscreenelementprops id = <be1id> pos = (<initial_pos> + (2 * <vertical_offset>) + <offset_pos>)
			setscreenelementprops id = <be2id> pos = (<initial_pos> + (2 * <vertical_offset>) + <r_bookend_offset> + <offset_pos>)
			setscreenelementprops id = <wthlid> pos = (<initial_pos> + (2 * <vertical_offset>) + <highlight_offset> + <offset_pos>)
			case 3
			setscreenelementprops id = <be1id> pos = (<initial_pos> + (3 * <vertical_offset>) + <offset_pos>)
			setscreenelementprops id = <be2id> pos = (<initial_pos> + (3 * <vertical_offset>) + <r_bookend_offset> + <offset_pos>)
			setscreenelementprops id = <wthlid> pos = (<initial_pos> + (3 * <vertical_offset>) + <highlight_offset> + <offset_pos>)
			case 4
			if (<comi>)
				setscreenelementprops id = <be1id> pos = (<initial_pos> + (4 * <vertical_offset>) + <offset_pos>)
				setscreenelementprops id = <be2id> pos = (<initial_pos> + (4 * <vertical_offset>) + <r_bookend_offset> + <offset_pos>)
				setscreenelementprops id = <wthlid> pos = (<initial_pos> + (4 * <vertical_offset>) + <highlight_offset> + <offset_pos>)
			endif
		endswitch
	endif
endscript

script destroy_character_hub_menu \{player = 1
		destroy = 0}
	if (<player> = 1)
		destroy_menu \{menu_id = scrolling_character_hub_p1}
		destroy_menu \{menu_id = character_hub_p1_container}
	else
		destroy_menu \{menu_id = scrolling_character_hub_p2}
		destroy_menu \{menu_id = character_hub_p2_container}
	endif
	killcamanim \{name = gs_view_cam}
endscript

script character_hub_generic_sound 
	if (<player> = 1)
		if ($p1_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	else
		if ($p2_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	endif
endscript

script character_hub_select_play_show 
	if (($current_num_players) = 2)
		if ((<player> = 1) && ($p1_ready = 0))
			setscreenelementprops \{id = vmenu_character_hub_p1
				disable_pad_handling}
			change \{p1_ready = 1}
			if ($is_network_game = 1)
				if screenelementexists \{id = ready_container_p2}
					runscriptonscreenelement \{id = ready_container_p2
						pos2 = (825.0, 450.0)
						drop_in_ready_sign
						params = {
							player = 1
						}}
				endif
			else
				drop_in_ready_sign \{player = 1}
			endif
		endif
		if ((<player> = 2) && ($p2_ready = 0))
			setscreenelementprops \{id = vmenu_character_hub_p2
				disable_pad_handling}
			change \{p2_ready = 1}
			drop_in_ready_sign \{player = 2}
		endif
	endif
	if ((($p1_ready = 1) && ($p2_ready = 1)) || ($current_num_players = 1))
		if ($is_network_game = 1)
			killspawnedscript \{name = net_hub_stream}
			if screenelementexists \{id = vmenu_character_hub_p1}
				launchevent \{type = unfocus
					target = vmenu_character_hub_p1}
			endif
			wait \{0.4
				seconds}
		endif
		clean_up_user_control_helpers
		shut_down_flow_manager \{player = 2}
		shut_down_character_hub
		if (($is_network_game) = 1)
			ui_flow_manager_respond_to_action \{action = select_ready
				player = 1
				create_params = {
					player = 1
				}}
		else
			ui_flow_manager_respond_to_action \{action = select_play_show
				player = 1
				create_params = {
					player = 1
				}}
		endif
		change \{p1_ready = 0}
		change \{p2_ready = 0}
	endif
endscript

script character_hub_select_the_store 
	clean_up_user_control_helpers
	shut_down_flow_manager \{player = 2}
	shut_down_character_hub
	ui_flow_manager_respond_to_action action = select_the_store create_params = {player = <player>}
endscript

script character_hub_select_change_outfit 
	if ($is_network_game)
		net_info_panel_hide
	endif
	ui_flow_manager_respond_to_action action = select_change_outfit player = <player> create_params = {player = <player>}
endscript

script net_info_panel_hide 
	if screenelementexists \{id = net_game_info_panel}
		doscreenelementmorph \{id = net_game_info_panel
			alpha = 0.5
			time = 0}
	endif
endscript

script net_info_panel_show 
	if NOT screenelementexists \{id = net_game_info_panel}
		return
	endif
	can_show = 1
	if screenelementexists \{id = scrolling_select_outfit_p1}
		can_show = 0
	elseif screenelementexists \{id = scrolling_select_outfit_p2}
		can_show = 0
	elseif screenelementexists \{id = scrolling_select_guitar_p1}
		can_show = 0
	elseif screenelementexists \{id = scrolling_select_guitar_p2}
		can_show = 0
	endif
	if (<can_show> = 1)
		doscreenelementmorph \{id = net_game_info_panel
			alpha = 1
			time = 0}
	endif
endscript

script character_hub_select_change_guitar 
	launchevent type = unfocus target = <vparent>
	if ($is_network_game)
		net_info_panel_hide
	endif
	if ($current_num_players = 1)
		generic_select_monitor_wait
	endif
	if gotparam \{bass}
		ui_flow_manager_respond_to_action action = select_change_bass player = <player> create_params = {player = <player>}
	else
		ui_flow_manager_respond_to_action action = select_change_guitar player = <player> create_params = {player = <player>}
	endif
endscript

script generic_select_monitor_wait 
	unpausespawnedscript \{generic_select_monitor}
	formattext \{checksumname = change_flag
		'generic_select_monitor_p%i_changed'
		i = 1}
	formattext \{checksumname = change_flag2
		'generic_select_monitor_p%i_changed'
		i = 2}
	begin
	printf "Waiting for %i %s" i = <change_flag> s = $<change_flag>
	if ($<change_flag> = 0)
		if ($current_num_players = 1 || $<change_flag2> = 0)
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script generic_select_monitor_finish 
	printf \{"generic_select_monitor_finish"}
	generic_select_monitor_wait
	killspawnedscript \{name = generic_select_monitor}
endscript
generic_select_monitor_p1_changed = 0
generic_select_monitor_p2_changed = 0

script generic_select_monitor \{initial_load = 1
		node_flags = {
		}}
	async = 1
	if (<initial_load> = 1)
		change globalname = <change_flag> newvalue = 1
	endif
	begin
	if ($<change_flag> = 1)
		change globalname = <change_flag> newvalue = 2
		if NOT preload_band_member name = <name> useoldpos async = <async> animpak = 0
			change globalname = <change_flag> newvalue = 0
			downloadcontentlost
			return
		endif
		printf "preload_band_member %i" i = <name>
		if ($<change_flag> = 2)
			if NOT create_guitarist name = <name> useoldpos no_strum async = <async> animpak = 0 <node_flags>
				change globalname = <change_flag> newvalue = 0
				downloadcontentlost
				return
			endif
			printf "create_guitarist %i" i = <name>
		endif
		preload_band_member_finish name = <name> useoldpos async = <async> animpak = 0 filename_crc = <filename_crc> instrument_crc = <instrument_crc>
		if ($<change_flag> = 2 &&
				<async> = 1)
			<name> :obj_getposition
			<name> :obj_setposition position = (0.0, -200.0, 0.0)
			wait \{1
				gameframe}
			<name> :obj_setposition position = <pos>
			change \{store_shadow_change = 1}
		endif
		if ($<change_flag> = 2)
			change globalname = <change_flag> newvalue = 0
		endif
	else
		wait \{1
			gameframe}
	endif
	async = 1
	repeat
endscript

script create_select_guitar_finish_menu \{player = 1}
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back menu_flow_go_back params = {player = <player>}}
		{pad_start menu_show_gamercard}
	]
	if (<player> = 1)
		if ($current_num_players = 2)
			new_menu scrollid = scrolling_select_finish_p1 vmenuid = vmenu_select_finish_p1 name = "Select Guitar Finish" use_backdrop = 0 exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		else
			new_menu scrollid = scrolling_select_finish_p1 vmenuid = vmenu_select_finish_p1 name = "Select Guitar Finish" use_backdrop = 0 event_handlers = <event_handlers>
		endif
		vparent = vmenu_select_finish_p1
	else
		new_menu scrollid = scrolling_select_finish_p2 vmenuid = vmenu_select_finish_p2 name = "Select Guitar Finish" use_backdrop = 0 exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		vparent = vmenu_select_finish_p2
	endif
	if ($current_num_players = 2)
		createscreenelement {
			type = textelement
			parent = <vparent>
			font = text_a1
			scale = 0.75
			rgba = [210 130 0 250]
			text = ("Finish 1")
			just = [left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_character_hub player = <player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		createscreenelement {
			type = textelement
			parent = <vparent>
			font = text_a1
			scale = 0.75
			rgba = [210 130 0 250]
			text = ("Finish 2")
			just = [left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_character_hub player = <player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
	else
		createscreenelement {
			type = textelement
			parent = <vparent>
			font = text_a1
			scale = 0.75
			rgba = [210 130 0 250]
			text = ("Finish 1")
			just = [left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_character_hub player = <player>}}
				{pad_start menu_show_gamercard}
			]
		}
		createscreenelement {
			type = textelement
			parent = <vparent>
			font = text_a1
			scale = 0.75
			rgba = [210 130 0 250]
			text = ("Finish 2")
			just = [left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_character_hub player = <player>}}
				{pad_start menu_show_gamercard}
			]
		}
	endif
endscript

script destroy_select_guitar_finish_menu \{player = 1}
	formattext checksumname = scrolling_select_finish 'scrolling_select_finish_p%i' i = <player>
	destroy_menu menu_id = <scrolling_select_finish>
endscript

script finish_select_highlight 
	retail_menu_focus
endscript
default_character_hub_pos = {
	p1_pos = (3.0, 0.0, 0.0)
	p1_2ppos = (1.75, 0.0, 0.0)
	p2_2ppos = (3.0, 0.0, 0.0)
}

script setup_character_hub 
	if ($g_hub_created = 1)
		set_character_hub_dirty
		return
	endif
	character_hub_pos = default_character_hub_pos
	destroy_bg_viewport
	setup_bg_viewport
	destroy_crowd_models
	getpakmancurrentname \{map = zones}
	if gotparam \{pakname}
		if NOT (<pakname> = "z_soundcheck")
			resetwaypoints
			setpakmancurrentblock \{map = zones
				pak = z_soundcheck
				block_scripts = 1}
		endif
	else
		resetwaypoints
		setpakmancurrentblock \{map = zones
			pak = z_soundcheck
			block_scripts = 1}
	endif
	player2_spotlight = z_soundcheck_gfx_trg_lh_hotspot_p2
	if ($current_num_players = 2)
		safecreate nodename = <player2_spotlight>
	else
		safekill nodename = <player2_spotlight>
	endif
	unpausegame
	disable_pause
	destroy_band
	printf \{"Creating generic_select_monitor"}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
	if (<player> = 1)
		name = ($player1_status.band_member)
	else
		name = ($player2_status.band_member)
	endif
	spawnscriptnow generic_select_monitor params = {player = <player> player_status = <player_status> change_flag = <change_flag> name = <name>}
	player = (<player> + 1)
	repeat ($current_num_players)
	stoprendering
	generic_select_monitor_wait
	startrendering
	if compositeobjectexists \{name = drummer}
		drummer :hide
	endif
	if compositeobjectexists \{name = guitarist2}
		guitarist2 :hide
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :hide
	endif
	if ($current_num_players = 1)
		if compositeobjectexists \{name = bassist}
			bassist :hide
		endif
	else
		if compositeobjectexists \{name = bassist}
			bassist :unhide
			bassist :ragdoll_markforreset
		endif
		if (($is_network_game = 1) && ($player2_present = 0))
			if compositeobjectexists \{name = bassist}
				bassist :hide
			endif
		endif
	endif
	printf \{"Moving guitarist to correct position"}
	if compositeobjectexists \{name = guitarist}
		printf \{"Moving guitarist to correct position2"}
		if ($current_num_players = 1)
			printf \{"Moving guitarist to correct position3"}
			guitarist :obj_setposition position = ($<character_hub_pos>.p1_pos)
		endif
	endif
	if ($current_num_players = 2)
		($player1_status.band_member) :obj_setposition position = ($<character_hub_pos>.p1_2ppos)
		($player2_status.band_member) :obj_setposition position = ($<character_hub_pos>.p2_2ppos)
	endif
	playigccam \{id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (2.503113, 1.0385579, 2.869411)
		quat = (0.028074998, -0.999026, 0.020287)
		fov = 78.0
		play_hold = 1
		interrupt_current}
	change \{g_hub_created = 1}
	setshadowdirfromlight \{name = z_soundcheck_gfx_char_front01}
endscript

script shut_down_character_hub 
	if ($g_hub_created = 0)
		return
	endif
	change \{p1_ready = 0}
	change \{p2_ready = 0}
	if ($shutdown_game_for_signin_change_flag = 1)
		killspawnedscript \{name = setup_character_hub}
		change \{using_guitar_select_camera = 0}
	endif
	generic_select_monitor_finish
	killcamanim \{name = ch_view_cam}
	killcamanim \{name = gs_view_cam}
	destroy_bg_viewport
	disable_pause
	if compositeobjectexists \{name = drummer}
		drummer :unhide
	endif
	if compositeobjectexists \{name = guitarist2}
		guitarist2 :unhide
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :unhide
	endif
	if compositeobjectexists \{name = bassist}
		bassist :unhide
	endif
	destroy_band
	change \{g_hub_created = 0}
endscript

script character_hub_go_back 
	if ($current_num_players = 2)
		leaving_character_hub = 1
		if ($game_mode = p2_career || $game_mode = p2_coop)
			find_coop_career_character_hub_ancestor
			if checksumequals a = <flow_state> b = coop_career_character_select_fs
				leaving_character_hub = 0
			endif
		elseif ($current_num_players = 2)
			leaving_character_hub = 0
		endif
		if (<leaving_character_hub> = 0)
			if (<player> = 1)
				setscreenelementprops \{id = vmenu_character_hub_p1
					enable_pad_handling}
				change \{p1_ready = 0}
				if ($is_network_game = 1)
					if screenelementexists \{id = ready_container_p1}
						runscriptonscreenelement \{id = ready_container_p1
							drop_out_ready_sign
							params = {
								player = 1
							}}
					endif
				else
					drop_out_ready_sign \{player = 1}
				endif
			else
				setscreenelementprops \{id = vmenu_character_hub_p2
					enable_pad_handling}
				change \{p2_ready = 0}
				drop_out_ready_sign \{player = 2}
			endif
			ui_flow_manager_respond_to_action action = go_back create_params = {player = <player>} player = <player>
		endif
	else
		clean_up_user_control_helpers
		ui_flow_manager_respond_to_action player = <player> action = go_back
	endif
endscript

script get_num_character_outfits 
	if (<player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
	else
		find_profile_by_id id = ($player2_status.character_id)
	endif
	get_musician_profile_struct index = <index>
	name = (<profile_struct>.name)
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<profile_struct>.name = <name>)
		getarraysize (<profile_struct>.outfits)
		return num_character_outfits = <array_size>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script get_num_outfit_styles \{outfit = 1}
	if (<player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
	else
		find_profile_by_id id = ($player2_status.character_id)
	endif
	get_musician_profile_struct index = <index>
	name = (<profile_struct>.name)
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<profile_struct>.name = <name>)
		outfits = (<profile_struct>.outfits)
		getarraysize (<outfits> [(<outfit> -1)].styles)
		return num_outfit_styles = <array_size>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script get_character_outfits \{player = 1}
	if (<player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
	else
		find_profile_by_id id = ($player2_status.character_id)
	endif
	get_musician_profile_struct index = <index>
	name = (<profile_struct>.name)
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<profile_struct>.name = <name>)
		return character_outfits = (<profile_struct>.outfits)
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script get_character_name \{player = 1}
	if (<player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
	else
		find_profile_by_id id = ($player2_status.character_id)
	endif
	get_musician_profile_struct index = <index>
	return character_name = (<profile_struct>.name) display_name = (<profile_struct>.fullname)
endscript

script get_character_outfit_name \{player = 1}
	if (<player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
		outfit_index = ($player1_status.outfit - 1)
	else
		find_profile_by_id id = ($player2_status.character_id)
		outfit_index = ($player2_status.outfit - 1)
	endif
	get_musician_profile_struct index = <index>
	if structurecontains structure = <profile_struct> name = outfits
		return outfit_name = (<profile_struct>.outfits [<outfit_index>].id)
	else
		return outfit_name = (<profile_struct>.name)
	endif
endscript

script get_character_style_name \{player = 1}
	if (<player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
		outfit_index = ($player1_status.outfit - 1)
		style_index = ($player1_status.style - 1)
	else
		find_profile_by_id id = ($player2_status.character_id)
		outfit_index = ($player2_status.outfit - 1)
		style_index = ($player1_status.style - 1)
	endif
	get_musician_profile_struct index = <index>
	return style_name = (<profile_struct>.outfits [<outfit_index>].styleids [<style_index>])
endscript

script net_outfit_menu_flow_go_back 
	menu_flow_go_back player = <player>
endscript

script net_style_menu_flow_go_back 
	menu_flow_go_back player = <player>
endscript
