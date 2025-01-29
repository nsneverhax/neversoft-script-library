g_hub_destroy = 0
g_hub_created = 0
g_hub_helpers_created = 0

script create_character_hub_menu player = 1
	if (<player> = 1)
		change p1_ready = 0
	else
		change p2_ready = 0
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
			add_user_control_helper text = "SELECT" button = green z = 100
			add_user_control_helper text = "BACK" button = red z = 100
			add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
			change g_hub_helpers_created = 1
		endif
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back character_hub_go_back params = {player = <player>}}
		{pad_start menu_show_gamercard}
	]
	if (<player> = 1)
		if ($current_num_players = 2)
			new_menu scrollid = scrolling_character_hub_p1 vmenuid = vmenu_character_hub_p1 use_backdrop = 0 menu_pos = (360.0, 490.0) exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		else
			new_menu scrollid = scrolling_character_hub_p1 vmenuid = vmenu_character_hub_p1 use_backdrop = 0 menu_pos = (350.0, 172.0) event_handlers = <event_handlers>
		endif
		vparent = vmenu_character_hub_p1
		continue_id = character_hub_p1_continue
		createscreenelement {
			type = containerelement
			parent = root_window
			id = character_hub_p1_container
			just = [left top]
			pos = (0.0, 0.0)
		}
		create_ready_icons pos1 = (400.0, 500.0) parent1 = character_hub_p1_container
	else
		new_menu scrollid = scrolling_character_hub_p2 vmenuid = vmenu_character_hub_p2 use_backdrop = 0 menu_pos = (710.0, 490.0) exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		vparent = vmenu_character_hub_p2
		continue_id = character_hub_p2_continue
		if (($is_network_game) = 1)
			launchevent type = unfocus target = vmenu_character_hub_p2
		endif
		createscreenelement {
			type = containerelement
			parent = root_window
			id = character_hub_p2_container
			just = [left top]
			pos = (0.0, 0.0)
		}
		create_ready_icons pos2 = (746.0, 500.0) parent2 = character_hub_p2_container
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
		set_focus_color rgba = [125 0 0 255]
		set_unfocus_color rgba = [180 100 60 255]
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
			dims = (224.0, 32.0)
			pos = (226.0, 136.0)
			z = 2
		}
		<whitetexhighlightid> = <id>
		<brown_window_color> = [170 90 35 255]
		<window_fill_color> = [0 0 0 200]
		if (<player> = 1)
			<hub_menu_starting_pos> = (460.0, 478.0)
		else
			<hub_menu_starting_pos> = (810.0, 478.0)
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
			rgba = <brown_window_color>
			z = 1
		}
		if (<show_change_outfit>)
			<mid_section_dims> = (256.0, 108.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (1.0, 128.0))
		else
			<mid_section_dims> = (256.0, 68.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (0.0, 88.0))
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
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_play_show params = {player = <player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		if (($is_network_game) = 1)
			<continue_id> :setprops text = "Ready" rgba = [128 128 128 255] block_events
			if (($player2_present) = 1)
				<continue_id> :setprops rgba = [180 100 60 255] unblock_events
			endif
		endif
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
							chh_mp = 1
							chh_player = <player>
						}
					}
					{unfocus retail_menu_unfocus}
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
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_change_guitar params = {player = <player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuitemselected> = (<ch_menuitemselected> + 1)
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
	else
		set_focus_color rgba = [125 0 0 255]
		set_unfocus_color rgba = [180 100 60 255]
		displaysprite {
			parent = character_hub_p1_container
			tex = character_hub_hilite_bookend
			pos = (320.0, 175.0)
			dims = (24.0, 24.0)
			just = [left top]
			rgba = [255 255 205 255]
			z = 4
		}
		<bookend1id> = <id>
		displaysprite {
			parent = character_hub_p1_container
			tex = character_hub_hilite_bookend
			pos = (588.0, 175.0)
			dims = (24.0, 24.0)
			just = [right top]
			rgba = [255 255 205 255]
			z = 4
		}
		<bookend2id> = <id>
		displaysprite {
			parent = character_hub_p1_container
			tex = white
			rgba = [255 255 205 255]
			pos = (339.0, 171.0)
			dims = (224.0, 32.0)
			just = [left top]
			z = 2
		}
		<whitetexhighlightid> = <id>
		<brown_window_color> = [170 90 35 255]
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
			rgba = <brown_window_color>
			z = 1
		}
		if (<show_change_outfit>)
			<mid_section_dims> = (256.0, 236.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (1.0, 268.0))
		else
			<mid_section_dims> = (256.0, 190.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (1.0, 222.0))
		endif
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
		displaysprite {
			parent = character_hub_p1_container
			tex = window_frame_cap
			pos = <bottom_cap_pos>
			dims = (256.0, 64.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
			flip_h
		}
		displaysprite {
			parent = character_hub_p1_container
			tex = window_fill_cap
			pos = <bottom_cap_pos>
			dims = (256.0, 64.0)
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
				{pad_choose character_hub_select_change_guitar params = {player = <player>}}
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
			type = spriteelement
			parent = <vparent>
			texture = logo_guitarcenter_128
			rgba = [180 100 60 255]
			just = [center top]
			dims = (192.0, 96.0)
			z = 0
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuitemnum = <ch_menuitemselected>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_the_store params = {player = <player>}}
				{pad_start menu_show_gamercard}
			]
			<demo_mode_disable>
		}
	endif
	change g_hub_destroy = 0
	if ($using_guitar_select_camera = 1)
		change using_guitar_select_camera = 0
		playigccam {
			id = gs_view_cam_id
			name = gs_view_cam
			viewport = bg_viewport
			controlscript = guitar_select_exit_camera_morph
			play_hold = 1
			interrupt_current
		}
		wait_for_guitar_select_exit_camera
		killcamanim name = gs_view_cam
	endif
	if compositeobjectexists name = guitarist
		if NOT ($guitarist_info.stance = stance_frontend)
			change structurename = guitarist_info current_anim = idle
			change structurename = guitarist_info cycle_anim = true
			change structurename = guitarist_info next_anim = none
			guitarist :handle_change_stance stance = stance_frontend no_wait
		endif
	endif
	if compositeobjectexists name = bassist
		if NOT ($bassist_info.stance = stance_frontend)
			if compositeobjectexists name = bassist
				bassist :handle_change_stance stance = stance_frontend no_wait
			endif
		endif
	endif
endscript

script character_hub_highlighter comi = 0 chh_mp = 0 chh_player = 1
	retail_menu_focus
	if (<chh_mp> = 0)
		switch <menuitemnum>
			case 0
			setscreenelementprops id = <be1id> pos = (320.0, 176.0)
			setscreenelementprops id = <be2id> pos = (588.0, 176.0)
			setscreenelementprops id = <wthlid> pos = (340.0, 171.0) dims = (224.0, 32.0)
			case 1
			setscreenelementprops id = <be1id> pos = (320.0, 222.0)
			setscreenelementprops id = <be2id> pos = (588.0, 222.0)
			setscreenelementprops id = <wthlid> pos = (340.0, 217.0) dims = (224.0, 32.0)
			case 2
			if (<comi>)
				setscreenelementprops id = <be1id> pos = (320.0, 271.0)
				setscreenelementprops id = <be2id> pos = (588.0, 271.0)
				setscreenelementprops id = <wthlid> pos = (340.0, 265.0) dims = (224.0, 32.0)
			elseif (<comi> = 0)
				setscreenelementprops id = <be1id> pos = (320.0, 300.0)
				setscreenelementprops id = <be2id> pos = (588.0, 300.0)
				setscreenelementprops id = <wthlid> pos = (340.0, 262.0) dims = (224.0, 108.0)
			endif
			case 3
			setscreenelementprops id = <be1id> pos = (320.0, 347.0)
			setscreenelementprops id = <be2id> pos = (588.0, 347.0)
			setscreenelementprops id = <wthlid> pos = (340.0, 309.0) dims = (224.0, 108.0)
		endswitch
	elseif (<chh_mp> = 1)
		if (<chh_player> = 1)
			<offset_pos> = (0.0, 0.0)
		else
			<offset_pos> = (350.0, 0.0)
		endif
		<initial_pos> = (330.0, 494.0)
		<r_bookend_offset> = (268.0, 0.0)
		<vertical_offset> = (0.0, 47.0)
		<highlight_offset> = (19.0, -5.0)
		switch <menuitemnum>
			case 0
			setscreenelementprops id = <be1id> pos = (<initial_pos> + <offset_pos>)
			setscreenelementprops id = <be2id> pos = (<initial_pos> + <r_bookend_offset> + <offset_pos>)
			setscreenelementprops id = <wthlid> pos = (<initial_pos> + <highlight_offset> + <offset_pos>) dims = (224.0, 32.0)
			case 1
			setscreenelementprops id = <be1id> pos = (<initial_pos> + <vertical_offset> + <offset_pos>)
			setscreenelementprops id = <be2id> pos = (<initial_pos> + <vertical_offset> + <r_bookend_offset> + <offset_pos>)
			setscreenelementprops id = <wthlid> pos = (<initial_pos> + <vertical_offset> + <highlight_offset> + <offset_pos>) dims = (224.0, 32.0)
			case 2
			if (<comi>)
				setscreenelementprops id = <be1id> pos = (<initial_pos> + (2 * <vertical_offset>) + <offset_pos>)
				setscreenelementprops id = <be2id> pos = (<initial_pos> + (2 * <vertical_offset>) + <r_bookend_offset> + <offset_pos>)
				setscreenelementprops id = <wthlid> pos = (<initial_pos> + (2 * <vertical_offset>) + <highlight_offset> + <offset_pos>) dims = (224.0, 32.0)
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

script character_hub_select_play_show 
	if (($is_network_game = 1) && (<player> = 1))
		network_player_lobby_message {
			type = ready_up
			action = select
			checksum = hub
		}
	endif
	if (($current_num_players) = 2)
		if ((<player> = 1) && ($p1_ready = 0))
			setscreenelementprops id = vmenu_character_hub_p1 disable_pad_handling
			change p1_ready = 1
			drop_in_ready_sign player = 1
		endif
		if ((<player> = 2) && ($p2_ready = 0))
			setscreenelementprops id = vmenu_character_hub_p2 disable_pad_handling
			change p2_ready = 1
			if (($is_network_game) = 1)
				if screenelementexists id = ready_container_p2
					runscriptonscreenelement id = ready_container_p2 drop_in_ready_sign params = {player = 2}
				endif
			else
				drop_in_ready_sign player = 2
			endif
		endif
	endif
	if ((($p1_ready = 1) && ($p2_ready = 1)) || ($current_num_players = 1))
		clean_up_user_control_helpers
		shut_down_flow_manager player = 2
		shut_down_character_hub
		if (($is_network_game) = 1)
			ui_flow_manager_respond_to_action action = select_ready player = 1 create_params = {player = 1}
		else
			ui_flow_manager_respond_to_action action = select_play_show player = 1 create_params = {player = 1}
		endif
		change p1_ready = 0
		change p2_ready = 0
	endif
endscript

script character_hub_select_the_store 
	clean_up_user_control_helpers
	shut_down_flow_manager \{player = 2}
	shut_down_character_hub
	ui_flow_manager_respond_to_action action = select_the_store create_params = {player = <player>}
endscript

script character_hub_select_change_outfit 
	if ((($is_network_game) = 1) && (<player> = 1))
		network_player_lobby_message \{type = character_hub_select
			action = select
			value1 = 1}
	endif
	ui_flow_manager_respond_to_action action = select_change_outfit player = <player> create_params = {player = <player>}
endscript

script character_hub_select_change_guitar 
	if ((($is_network_game) = 1) && (<player> = 1))
		network_player_lobby_message \{type = character_hub_select
			action = select
			value1 = 2}
	endif
	ui_flow_manager_respond_to_action action = select_change_guitar player = <player> create_params = {player = <player>}
endscript

script create_select_outfit_menu player = 1
	formattext checksumname = player_status 'player%i_status' i = <player>
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<player> = 1))
		pad_back_script = net_outfit_menu_flow_go_back
	else
		pad_back_script = menu_flow_go_back
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back <pad_back_script> params = {player = <player>}}
		{pad_start menu_show_gamercard}
	]
	if (<player> = 1)
		container_id = 0xd145cfac
		vparent = vmenu_select_outfit_p1
		scrollid = scrolling_select_outfit_p1
		if ($current_num_players = 2)
			menu_pos = (93.0, 560.0)
			container_pos = (220.0, 290.0)
		else
			menu_pos = (155.0, 340.0)
			container_pos = (252.0, 180.0)
		endif
	else
		menu_pos = (487.0, 560.0)
		vparent = vmenu_select_outfit_p2
		scrollid = scrolling_select_outfit_p2
		container_pos = (418.0, 290.0)
		container_id = 0x484c9e16
	endif
	if ($current_num_players = 2)
		new_menu scrollid = <scrollid> vmenuid = <vparent> use_backdrop = 0 menu_pos = <menu_pos> event_handlers = <event_handlers> exclusive_device = <exclusive_dev>
		if ((($is_network_game) = 1) && (<player> = 2))
			launchevent type = unfocus target = vmenu_select_outfit_p2
		endif
	else
		new_menu scrollid = <scrollid> vmenuid = <vparent> use_backdrop = 0 menu_pos = <menu_pos> event_handlers = <event_handlers>
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		pos = <container_pos>
		just = [center top]
		id = <container_id>
	}
	if (<player> = 1)
		outfit = ($player1_status.outfit)
	else
		outfit = ($player2_status.outfit)
	endif
	<container_id> :settags 0xb429f602 = <outfit>
	setscreenelementprops {
		id = <vparent>
		dims = (700.0, 700.0)
		internal_just = [center top]
		just = [center top]
	}
	set_focus_color rgba = [130 40 40 250]
	set_unfocus_color rgba = [60 60 60 250]
	text_params = {type = textelement parent = <vparent> font = <font> scale = (1.0, 0.8) rgba = ($menu_unfocus_color) just = [center top]}
	get_character_outfits player = <player>
	getarraysize <character_outfits>
	0x5cc38b34 = "OUTFIT 1"
	0xda57f99a = "OUTFIT 2"
	0xe8c59bae = 1
	if (<array_size> > 1)
		<0x5cc38b34> = (<character_outfits> [0].name)
		<0xda57f99a> = (<character_outfits> [1].name)
		get_character_name player = <player>
		formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' n = <character_name>
		getglobaltags <outfit_2_checksum>
		if (<unlocked> = 0)
			<0xe8c59bae> = 0
		endif
	else
		<0x5cc38b34> = (<character_outfits> [0].name)
		<0xe8c59bae> = 0
	endif
	if ($current_num_players = 2)
		createscreenelement {
			<text_params>
			text = <0x5cc38b34>
			event_handlers = [
				{focus 0x720c8447 params = {player = <player> player_status = <player_status> 0x296a29c3 = <container_id> outfit = 1}}
				{unfocus retail_menu_unfocus}
				{pad_choose 0x96e1c669 params = {player = <player> player_status = <player_status> 0x296a29c3 = <container_id> outfit = 1}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		if (<0xe8c59bae>)
			createscreenelement {
				<text_params>
				text = <0xda57f99a>
				event_handlers = [
					{focus 0x720c8447 params = {player = <player> player_status = <player_status> 0x296a29c3 = <container_id> outfit = 2}}
					{unfocus retail_menu_unfocus}
					{pad_choose 0x96e1c669 params = {player = <player> player_status = <player_status> 0x296a29c3 = <container_id> outfit = 2}}
					{pad_start menu_show_gamercard}
				]
				exclusive_device = <exclusive_dev>
			}
		endif
	else
		createscreenelement {
			<text_params>
			text = <0x5cc38b34>
			event_handlers = [
				{focus 0x720c8447 params = {player = <player> player_status = <player_status> 0x296a29c3 = <container_id> outfit = 1}}
				{unfocus retail_menu_unfocus}
				{pad_choose 0x96e1c669 params = {player = <player> player_status = <player_status> 0x296a29c3 = <container_id> outfit = 1}}
				{pad_start menu_show_gamercard}
			]
		}
		if (<0xe8c59bae>)
			createscreenelement {
				<text_params>
				text = <0xda57f99a>
				event_handlers = [
					{focus 0x720c8447 params = {player = <player> player_status = <player_status> 0x296a29c3 = <container_id> outfit = 2}}
					{unfocus retail_menu_unfocus}
					{pad_choose 0x96e1c669 params = {player = <player> player_status = <player_status> 0x296a29c3 = <container_id> outfit = 2}}
					{pad_start menu_show_gamercard}
				]
			}
		endif
	endif
	createscreenelement {
		type = textelement
		parent = <container_id>
		font = <font>
		text = "SELECT OUTFIT"
		scale = (0.6, 0.5)
		pos = (<container_pos> + (0.0, -33.0))
		rgba = ($menu_unfocus_color)
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		just = [center center]
		pos = <container_pos>
		texture = unlock_dialog_bg
		dims = ((256.0, 128.0) * 1.2)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		just = [center bottom]
		pos = <container_pos>
		texture = dialog_bg
		z_priority = 3
		dims = ((256.0, 64.0) * 1)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		just = [center top]
		pos = <container_pos>
		texture = dialog_bg
		z_priority = 3
		dims = ((256.0, 64.0) * 1)
		flip_h
	}
endscript

script destroy_select_outfit_menu \{player = 1}
	formattext checksumname = scrolling_select_outfit 'scrolling_select_outfit_p%i' i = <player>
	formattext checksumname = s_container 's_container_p%i' i = <player>
	formattext checksumname = player_status 'player%i_status' i = <player>
	destroy_menu menu_id = <scrolling_select_outfit>
	<s_container> :gettags
	change structurename = <player_status> outfit = <0xb429f602>
	destroy_menu menu_id = <s_container>
endscript

script create_select_style_menu player = 1
	formattext checksumname = player_status 'player%i_status' i = <player>
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<player> = 1))
		pad_back_script = net_style_menu_flow_go_back
	else
		pad_back_script = menu_flow_go_back
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back <pad_back_script> params = {player = <player>}}
		{pad_start menu_show_gamercard}
	]
	if (<player> = 1)
		container_id = 0xd145cfac
		vparent = 0x7b613217
		scrollid = 0x8cd6c1d9
		if ($current_num_players = 2)
			menu_pos = (93.0, 460.0)
			container_pos = (220.0, 260.0)
		else
			menu_pos = (155.0, 300.0)
			container_pos = (252.0, 180.0)
		endif
	else
		menu_pos = (487.0, 460.0)
		vparent = 0xe26863ad
		scrollid = 0x15df9063
		container_pos = (418.0, 260.0)
		container_id = 0x484c9e16
	endif
	if ($current_num_players = 2)
		new_menu scrollid = <scrollid> vmenuid = <vparent> use_backdrop = 0 menu_pos = <menu_pos> event_handlers = <event_handlers> exclusive_device = <exclusive_dev>
	else
		new_menu scrollid = <scrollid> vmenuid = <vparent> use_backdrop = 0 menu_pos = <menu_pos> event_handlers = <event_handlers>
	endif
	if ((($is_network_game) = 1) && (<player> = 2))
		launchevent type = unfocus target = 0xe26863ad
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		pos = <container_pos>
		just = [center top]
		id = <container_id>
	}
	if (<player> = 1)
		style = ($player1_status.style)
	else
		style = ($player2_status.style)
	endif
	<container_id> :settags 0xc4651f9c = <style>
	setscreenelementprops {
		id = <vparent>
		dims = (700.0, 700.0)
		internal_just = [center top]
		just = [center top]
	}
	set_focus_color rgba = [130 40 40 250]
	set_unfocus_color rgba = [60 60 60 250]
	text_params = {type = textelement parent = <vparent> font = <font> scale = (1.0, 0.8) rgba = ($menu_unfocus_color) just = [center top]}
	get_character_outfits player = <player>
	if (<player> = 1)
		outfit = ($player1_status.outfit)
	else
		outfit = ($player2_status.outfit)
	endif
	styles = (<character_outfits> [(<outfit> - 1)].styles)
	getarraysize <styles>
	0xf08452b2 = <array_size>
	if ($current_num_players = 2)
		0x0fbdaecc = {exclusive_device = <exclusive_dev>}
	else
		0x0fbdaecc = {}
	endif
	index = 0
	begin
	add_style = 1
	if NOT (<index> = 0)
		get_character_name player = <player>
		formattext checksumname = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = (<index> + 1)
		getglobaltags <outfit_style_cs>
		if (<unlocked> = 0)
			<add_style> = 0
		endif
	endif
	if (<add_style>)
		createscreenelement {
			<text_params>
			text = (<styles> [<index>])
			event_handlers = [
				{focus 0xc8793904 params = {player = <player> player_status = <player_status> 0x296a29c3 = <container_id> style = (<index> + 1)}}
				{unfocus retail_menu_unfocus}
				{pad_choose 0xdb682cbd params = {0x296a29c3 = <container_id> style = (<index> + 1) player = <player>}}
				{pad_start menu_show_gamercard}
			]
			<0x0fbdaecc>
		}
	endif
	<index> = (<index> + 1)
	repeat <0xf08452b2>
	createscreenelement {
		type = textelement
		parent = <container_id>
		font = <font>
		text = "SELECT STYLE"
		scale = (0.6, 0.5)
		pos = (<container_pos> + (0.0, -77.0))
		rgba = ($menu_unfocus_color)
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		just = [center center]
		pos = <container_pos>
		texture = unlock_dialog_bg
		dims = ((256.0, 230.0) * 1.2)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		just = [center bottom]
		pos = <container_pos>
		texture = dialog_bg
		z_priority = 3
		dims = ((256.0, 114.0) * 1)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		just = [center top]
		pos = <container_pos>
		texture = dialog_bg
		z_priority = 3
		dims = ((256.0, 114.0) * 1)
		flip_h
	}
endscript

script destroy_select_style_menu \{player = 1}
	formattext checksumname = scrolling_select_style 'scrolling_select_style_p%i' i = <player>
	formattext checksumname = s_container 's_container_p%i' i = <player>
	formattext checksumname = player_status 'player%i_status' i = <player>
	destroy_menu menu_id = <scrolling_select_style>
	<s_container> :gettags
	change structurename = <player_status> style = <0xc4651f9c>
	destroy_menu menu_id = <s_container>
endscript

script generic_select_monitor_wait 
	player = 1
	begin
	formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
	begin
	printf "Waiting for %i %s" i = <change_flag> s = $<change_flag>
	if ($<change_flag> = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	player = (<player> + 1)
	repeat ($current_num_players)
endscript

script generic_select_monitor_finish 
	printf \{"generic_select_monitor_finish"}
	generic_select_monitor_wait
	killspawnedscript \{name = generic_select_monitor}
endscript
generic_select_monitor_p1_changed = 0
generic_select_monitor_p2_changed = 0

script generic_select_monitor initial_load = 1 node_flags = {}
	async = 1
	if (<initial_load> = 1)
		change globalname = <change_flag> newvalue = 1
		async = 0
	endif
	begin
	if ($<change_flag> = 1)
		change globalname = <change_flag> newvalue = 2
		preload_band_member name = <name> useoldpos async = <async> animpak = 0
		printf "preload_band_member %i" i = <name>
		if ($<change_flag> = 2)
			create_guitarist name = <name> useoldpos no_strum async = <async> animpak = 0 <node_flags>
			printf "create_guitarist %i" i = <name>
		endif
		preload_band_member_finish name = <name> useoldpos async = <async> animpak = 0 filename_crc = <filename_crc> instrument_crc = <instrument_crc>
		if ($<change_flag> = 2 &&
				<async> = 1)
			<name> :obj_getposition
			<name> :obj_setposition position = (0.0, -200.0, 0.0)
			wait 1 gameframe
			<name> :obj_setposition position = <pos>
		endif
		if ($<change_flag> = 2)
			change globalname = <change_flag> newvalue = 0
		endif
	else
		wait 1 gameframe
	endif
	async = 1
	repeat
endscript

script 0x720c8447 
	if ((($is_network_game) = 1) && (<player> = 1))
		network_player_lobby_message {
			type = outfit_select
			action = update
			value1 = <outfit>
		}
	endif
	if ((($is_network_game) = 0) || (<player> = 1))
		retail_menu_focus
	endif
	change structurename = <player_status> outfit = <outfit>
	formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
	change globalname = <change_flag> newvalue = 1
endscript

script 0xc8793904 
	retail_menu_focus
	change structurename = <player_status> style = <style>
	formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
	change globalname = <change_flag> newvalue = 1
endscript

script create_select_guitar_finish_menu player = 1
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
		if ((($is_network_game) = 1) && (<player> = 2))
			if compositeobjectexists name = bassist
				bassist :unhide
			endif
		endif
		return
	endif
	character_hub_pos = default_character_hub_pos
	destroy_bg_viewport
	setup_bg_viewport
	getpakmancurrentname map = zones
	if gotparam pakname
		if NOT (<pakname> = "z_soundcheck")
			resetwaypoints
			setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = 1
		endif
	else
		resetwaypoints
		setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = 1
	endif
	disable_pause
	destroy_band
	printf "Creating generic_select_monitor"
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
	if (<player> = 1)
		name = guitarist
	else
		name = bassist
	endif
	spawnscriptnow generic_select_monitor params = {player = <player> player_status = <player_status> change_flag = <change_flag> name = <name>}
	player = (<player> + 1)
	repeat ($current_num_players)
	generic_select_monitor_wait
	if compositeobjectexists name = drummer
		drummer :hide
	endif
	if compositeobjectexists name = guitarist2
		guitarist2 :hide
	endif
	if compositeobjectexists name = vocalist
		vocalist :hide
	endif
	if ($current_num_players = 1)
		if compositeobjectexists name = bassist
			bassist :hide
		endif
	else
		if compositeobjectexists name = bassist
			bassist :unhide
		endif
		if (($is_network_game) = 1)
			if (($player2_present) = 1)
				if compositeobjectexists name = bassist
					bassist :unhide
				endif
			else
				if compositeobjectexists name = bassist
					bassist :hide
				endif
			endif
		endif
	endif
	printf "Moving guitarist to correct position"
	if compositeobjectexists name = guitarist
		printf "Moving guitarist to correct position2"
		if ($current_num_players = 1)
			printf "Moving guitarist to correct position3"
			guitarist :obj_setposition position = ($<character_hub_pos>.p1_pos)
		else
			guitarist :obj_setposition position = ($<character_hub_pos>.p1_2ppos)
		endif
	endif
	if compositeobjectexists name = bassist
		bassist :obj_setposition position = ($<character_hub_pos>.p2_2ppos)
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
	change g_hub_created = 1
	setshadowdirfromlight name = z_soundcheck_gfx_char_front01
endscript

script shut_down_character_hub 
	if ($g_hub_created = 0)
		return
	endif
	change p1_ready = 0
	change p2_ready = 0
	generic_select_monitor_finish
	killcamanim name = ch_view_cam
	destroy_bg_viewport
	disable_pause
	if compositeobjectexists name = drummer
		drummer :unhide
	endif
	if compositeobjectexists name = guitarist2
		guitarist2 :unhide
	endif
	if compositeobjectexists name = vocalist
		vocalist :unhide
	endif
	if compositeobjectexists name = bassist
		bassist :unhide
	endif
	destroy_band
	change g_hub_created = 0
endscript

script character_hub_go_back 
	if ($current_num_players = 2)
		leaving_character_hub = 1
		if ($game_mode = p2_career)
			find_coop_career_character_hub_ancestor
			if checksumequals a = <flow_state> b = coop_career_character_select_fs
				leaving_character_hub = 0
			endif
		elseif ($current_num_players = 2)
			leaving_character_hub = 0
		endif
		if (<leaving_character_hub> = 0)
			if (<player> = 1)
				if ($is_network_game = 1)
					network_player_lobby_message {
						type = character_hub_select
						action = deselect
					}
				endif
				setscreenelementprops id = vmenu_character_hub_p1 enable_pad_handling
				change p1_ready = 0
				drop_out_ready_sign player = 1
			else
				setscreenelementprops id = vmenu_character_hub_p2 enable_pad_handling
				change p2_ready = 0
				if (($is_network_game) = 1)
					formattext checksumname = ready_container 'ready_container_p%d' d = <player>
					if screenelementexists id = <ready_container>
						runscriptonscreenelement id = <ready_container> drop_out_ready_sign params = {player = 2}
					endif
				else
					drop_out_ready_sign player = 2
				endif
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

script get_num_outfit_styles outfit = 1
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

script get_character_outfits player = 1
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
	return character_name = (<profile_struct>.name)
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
	return outfit_name = (<profile_struct>.outfits [<outfit_index>].id)
endscript

script get_character_style_name player = 1
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

script 0x96e1c669 
	if ((($is_network_game) = 1) && (<player> = 1))
		network_player_lobby_message {
			type = outfit_select
			action = select
			value1 = <outfit>
		}
	endif
	<0x296a29c3> :settags 0xb429f602 = <outfit>
	ui_flow_manager_respond_to_action action = select_select_style player = <player>
endscript

script 0xdb682cbd 
	if ((($is_network_game) = 1) && (<player> = 1))
		network_player_lobby_message {
			type = style_select
			action = select
			value1 = <style>
		}
	endif
	<0x296a29c3> :settags 0xc4651f9c = <style>
	ui_flow_manager_respond_to_action action = select_character_hub player = <player>
endscript

script net_outfit_menu_flow_go_back 
	network_player_lobby_message \{type = outfit_select
		action = deselect}
	menu_flow_go_back player = <player>
endscript

script net_style_menu_flow_go_back 
	network_player_lobby_message \{type = style_select
		action = deselect}
	menu_flow_go_back player = <player>
endscript
