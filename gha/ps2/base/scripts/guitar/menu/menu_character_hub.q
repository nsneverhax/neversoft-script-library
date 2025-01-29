g_hub_destroy = 0
g_hub_created = 0
g_hub_helpers_created = 0
g_hub_characters_dirty = 1

script set_character_hub_dirty 
	Change \{g_hub_characters_dirty = 1}
endscript

script do_character_hub_dirty 
	<Player> = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if find_profile_by_id id = ($<player_status>.character_id)
		get_musician_profile_struct index = <index>
		formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
		if GetGlobalTags <characterguitartags> noassert = 1


			if (<current_instrument> = guitar)
				<inst_ID> = <current_selected_guitar>
			else
				SetGlobalTags <characterguitartags> params = {current_instrument = guitar}
				<inst_ID> = <current_selected_guitar>
			endif
			Change structurename = <player_status> instrument_id = <inst_ID>
			Change structurename = <player_status> outfit = <current_outfit>
			Change structurename = <player_status> style = <current_style>
		endif
	endif
	<Player> = 2
	repeat 2
	if ($current_num_players = 2)
		create_guitarist \{Name = BASSIST
			UseOldPos
			no_strum}
	endif
	create_guitarist \{Name = GUITARIST
		UseOldPos
		no_strum}
	if ($current_num_players = 1)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :Hide
		endif
	endif
	if (($is_network_game = 1) && ($player2_present = 0))
		if CompositeObjectExists Name = ($player2_status.band_member)
			($player2_status.band_member) :Hide
		endif
	endif
	Change \{g_hub_characters_dirty = 0}
endscript

script create_character_hub_menu \{Player = 1}
	0x3f6d13fa = 0
	0x4c00d006 = ($menu_flow_locked + 1)
	Change menu_flow_locked = (<0x4c00d006>)
	GetPakManCurrent \{map = zones}
	if (<pak> != z_soundcheck)
		create_loading_screen
		<0x3f6d13fa> = 1
	endif
	if ($g_hub_characters_dirty)
		do_character_hub_dirty
	endif
	if (<Player> = 1)
		Change \{p1_ready = 0}
	else
		Change \{p2_ready = 0}
	endif
	exclusive_dev = $player1_device
	if (<Player> = 2)
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
			add_user_control_helper \{text = 'SELECT'
				button = green
				z = 100}
			add_user_control_helper \{text = 'BACK'
				button = red
				z = 100}
			add_user_control_helper \{text = 'UP/DOWN'
				button = strumbar
				z = 100}
			Change \{g_hub_helpers_created = 1}
		endif
	endif
	event_handlers = [
		{pad_up character_hub_generic_sound params = {Player = <Player> up}}
		{pad_down character_hub_generic_sound params = {Player = <Player> down}}
		{pad_back character_hub_go_back params = {Player = <Player>}}
		{pad_start menu_show_gamercard}
	]
	if ($is_network_game)
		event_handlers = [
			{pad_up character_hub_generic_sound params = {Player = <Player> up}}
			{pad_down character_hub_generic_sound params = {Player = <Player> down}}
			{pad_back net_request_play_show params = {action = 0}}
			{pad_start menu_show_gamercard}
		]
		net_info_panel_show
	endif
	show_change_outfit = 1
	if (<Player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
	else
		find_profile_by_id id = ($player2_status.character_id)
	endif
	get_musician_profile_struct index = <index>
	if NOT StructureContains structure = (<profile_struct>) outfits
		<show_change_outfit> = 0
	endif
	<menu_pos_tweak> = (0.0, 0.0)
	<co_tweak> = (0.0, 0.0)
	if (<Player> = 1)
		if (($is_network_game) = 1)
			menu_pos_tweak = (-65.0, 0.0)
		endif
		if ($current_num_players = 2)
			if NOT (<show_change_outfit>)
				<co_tweak> = (0.0, 40.0)
			endif
			<menu_pos> = (356.0, 426.0)
			if ($game_mode = p2_quickplay || $game_mode = p2_coop)
				<menu_pos> = (<menu_pos> + (0.0, -47.0))
			endif
			new_menu {
				scrollid = scrolling_character_hub_p1
				vmenuid = vmenu_character_hub_p1
				use_backdrop = 0
				menu_pos = (<menu_pos> + <menu_pos_tweak> + <co_tweak>)
				exclusive_device = <exclusive_dev>
				event_handlers = <event_handlers>
				no_focus = 1
			}
		else
			new_menu {
				scrollid = scrolling_character_hub_p1
				vmenuid = vmenu_character_hub_p1
				use_backdrop = 0
				menu_pos = (235.0, 159.0)
				event_handlers = <event_handlers>
				no_focus = 1
				spacing = 8
			}
		endif
		vparent = vmenu_character_hub_p1
		continue_id = character_hub_p1_continue
		ch_change_char_id = ch_change_char_id_p1
		ch_change_outfit_id = ch_change_outfit_id_p1
		ch_change_guitar_id = ch_change_guitar_id_p1
		ch_change_bass_id = ch_change_bass_id_p1
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = character_hub_p1_container
			just = [left top]
			Pos = ((0.0, 0.0) + <menu_pos_tweak>)
		}
		create_ready_icons \{pos1 = (400.0, 500.0)
			parent1 = character_hub_p1_container}
		if ($is_network_game)
			if NOT (ScreenElementExists id = ready_container_p2)
				create_ready_icons \{pos2 = (825.0, 450.0)
					parent2 = root_window}
			endif
		endif
	else
		<menu_pos> = (706.0, 426.0)
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			<menu_pos> = (<menu_pos> + (0.0, -47.0))
		endif
		if (($is_network_game) = 1)
			menu_pos_tweak = (75.0, 0.0)
		endif
		if NOT (<show_change_outfit>)
			<co_tweak> = (0.0, 40.0)
		endif
		new_menu {
			scrollid = scrolling_character_hub_p2
			vmenuid = vmenu_character_hub_p2
			use_backdrop = 0
			menu_pos = (<menu_pos> + <menu_pos_tweak> + <co_tweak>)
			exclusive_device = <exclusive_dev>
			event_handlers = <event_handlers>
			no_focus = 1
		}
		vparent = vmenu_character_hub_p2
		continue_id = character_hub_p2_continue
		ch_change_char_id = ch_change_char_id_p2
		ch_change_outfit_id = ch_change_outfit_id_p2
		ch_change_guitar_id = ch_change_guitar_id_p2
		ch_change_bass_id = ch_change_bass_id_p2
		if (($is_network_game) = 1)
			LaunchEvent \{Type = unfocus
				target = vmenu_character_hub_p2}
		endif
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = character_hub_p2_container
			just = [left top]
			Pos = ((0.0, 0.0) + <menu_pos_tweak>)
		}
		create_ready_icons \{pos2 = (746.0, 500.0)
			parent2 = character_hub_p2_container}
	endif
	setup_character_hub Player = <Player>
	if ($current_num_players = 2)
		if (<Player> = 1)
			myParent = character_hub_p1_container
			<highlight_color> = (($g_menu_colors).light_brown)
		else
			myParent = character_hub_p2_container
			<highlight_color> = (($g_menu_colors).lt_violet_bar)
		endif
		<ch_focus_color> = (($g_menu_colors).black)
		<ch_unfocus_color> = (($g_menu_colors).dk_violet_grey)
		displaySprite {
			parent = <myParent>
			tex = character_hub_hilite_bookend
			dims = (30.0, 40.0)
			just = [left top]
			rgba = <highlight_color>
			z = 4
			flip_v
		}
		<bookEnd1ID> = <id>
		displaySprite {
			parent = <myParent>
			tex = character_hub_hilite_bookend
			dims = (30.0, 40.0)
			just = [right top]
			rgba = <highlight_color>
			z = 4
		}
		<bookEnd2ID> = <id>
		displaySprite {
			parent = <myParent>
			tex = hilite_bar_01
			just = [left top]
			rgba = <highlight_color>
			dims = (264.0, 40.0)
			Pos = (226.0, 136.0)
			z = 2
		}
		<whiteTexHighlightID> = <id>
		<window_frame_color> = (($g_menu_colors).frame_rgba)
		<window_fill_color> = (($g_menu_colors).fill_rgba)
		if (<Player> = 1)
			<hub_menu_center_pos> = (460.0, 516.0)
		else
			<hub_menu_center_pos> = (810.0, 516.0)
		endif
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			<hub_menu_center_pos> = (<hub_menu_center_pos> + (0.0, -46.0))
		endif
		if (<show_change_outfit>)
			frame_dims = (280.0, 320.0)
			center_pos = <hub_menu_center_pos>
		else
			frame_dims = (280.0, 280.0)
			<hub_menu_center_pos> = (<hub_menu_center_pos> + (0.0, 20.0))
			center_pos = <hub_menu_center_pos>
		endif
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			frame_dims = (280.0, 380.0)
		endif
		create_ui_frame {
			parent = <myParent>
			frame_dims = <frame_dims>
			center_pos = <center_pos>
			frame_rgba = (($g_menu_colors).frame_rgba)
			fill_rgba = (($g_menu_colors).fill_rgba)
			z_priority = 0
			suffix = <Player>
		}
		displaySprite {
			parent = <myParent>
			tex = window_header_01
			Pos = (<hub_menu_center_pos> + (0.0, -120.0))
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <highlight_color>
			z = 1
		}
		<ch_menuItemSelected> = 0
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			id = <continue_id>
			font = fontgrid_title_gh3
			Scale = 1.333
			rgba = (($g_menu_colors).dk_violet_grey)
			text = 'PLAY SHOW'
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						chh_mp = 1
						chh_player = <Player>
						comi = <show_change_outfit>
					}
				}
				{focus SetScreenElementProps params = {id = <continue_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps params = {id = <continue_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_select_play_show params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		if (($is_network_game) = 1)
			net_event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						chh_mp = 1
						chh_player = <Player>
						comi = <show_change_outfit>
					}
				}
				{focus SetScreenElementProps params = {id = <continue_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps params = {id = <continue_id> rgba = <ch_unfocus_color>}}
				{pad_choose net_request_play_show params = {action = 1}}
				{pad_start menu_show_gamercard}
			]
			<continue_id> :SetProps text = 'READY' rgba = [128 128 128 75] event_handlers = <net_event_handlers> replace_handlers block_events
			if (($player2_present) = 1)
				<continue_id> :SetProps rgba = <ch_unfocus_color> unblock_events
			endif
		endif
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((280.0, 0.0) + (<height> * (0.0, 1.0)))
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			id = <ch_change_char_id>
			font = fontgrid_title_gh3
			Scale = 1.333
			rgba = (($g_menu_colors).dk_violet_grey)
			text = 'CHANGE CHARACTER'
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
						chh_mp = 1
						chh_player = <Player>
					}
				}
				{focus SetScreenElementProps params = {id = <ch_change_char_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps params = {id = <ch_change_char_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_go_back params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((280.0, 0.0) + (<height> * (0.0, 1.0)))
		if (<show_change_outfit>)
			CreateScreenElement {
				Type = TextElement
				parent = <vparent>
				id = <ch_change_outfit_id>
				font = fontgrid_title_gh3
				Scale = 1.333
				rgba = (($g_menu_colors).dk_violet_grey)
				text = 'CHANGE OUTFIT'
				just = [center top]
				event_handlers = [
					{focus character_hub_highlighter params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <show_change_outfit>
							chh_mp = 1
							chh_player = <Player>
						}
					}
					{focus SetScreenElementProps params = {id = <ch_change_outfit_id> rgba = <ch_focus_color>}}
					{unfocus SetScreenElementProps params = {id = <ch_change_outfit_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_outfit params = {Player = <Player>}}
					{pad_start menu_show_gamercard}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((280.0, 0.0) + (<height> * (0.0, 1.0)))
		endif
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			id = <ch_change_guitar_id>
			font = fontgrid_title_gh3
			Scale = 1.333
			rgba = (($g_menu_colors).dk_violet_grey)
			text = 'CHANGE GUITAR'
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
						chh_mp = 1
						chh_player = <Player>
					}
				}
				{focus SetScreenElementProps params = {id = <ch_change_guitar_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps params = {id = <ch_change_guitar_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_select_change_guitar params = {Player = <Player> vparent = <vparent>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((280.0, 0.0) + (<height> * (0.0, 1.0)))
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			CreateScreenElement {
				Type = TextElement
				parent = <vparent>
				id = <ch_change_bass_id>
				font = fontgrid_title_gh3
				Scale = 1.333
				rgba = (($g_menu_colors).dk_violet_grey)
				text = 'CHANGE BASS'
				just = [center top]
				event_handlers = [
					{focus character_hub_highlighter params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <show_change_outfit>
							chh_mp = 1
							chh_player = <Player>
						}
					}
					{focus SetScreenElementProps params = {id = <ch_change_bass_id> rgba = <ch_focus_color>}}
					{unfocus SetScreenElementProps params = {id = <ch_change_bass_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_guitar params = {Player = <Player> bass vparent = <vparent>}}
					{pad_start menu_show_gamercard}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((280.0, 0.0) + (<height> * (0.0, 1.0)))
		endif
	else
		set_focus_color \{Color = black}
		set_unfocus_color \{Color = dk_violet_grey}
		frame_dims = (320.0, 600.0)
		center_pos = (352.0, 341.0)
		create_ui_frame {
			parent = character_hub_p1_container
			frame_dims = <frame_dims>
			center_pos = <center_pos>
			frame_rgba = (($g_menu_colors).frame_rgba)
			fill_rgba = (($g_menu_colors).fill_rgba)
			z_priority = 0
		}
		header_pos = (<center_pos> - ((<frame_dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 80.0)))
		CreateScreenElement {
			Type = SpriteElement
			parent = character_hub_p1_container
			Pos = <header_pos>
			id = hub_frame_header_01
			just = [center bottom]
			texture = window_header_01
			rgba = (($g_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = character_hub_p1_container
			Pos = (<center_pos> + (0.0, 175.0))
			dims = (242.0, 128.0)
			just = [center top]
			texture = store_frame_bottom_bg
			z_priority = 4
			rgba = (($g_menu_colors).lt_violet_grey)
		}
		displaySprite {
			parent = character_hub_p1_container
			tex = character_hub_hilite_bookend
			Pos = (325.0, 175.0)
			dims = (40.0, 43.0)
			just = [left top]
			rgba = (($g_menu_colors).md_violet_grey)
			z = 4
			flip_v
		}
		<bookEnd1ID> = <id>
		displaySprite {
			parent = character_hub_p1_container
			tex = character_hub_hilite_bookend
			Pos = (588.0, 175.0)
			dims = (40.0, 43.0)
			just = [right top]
			rgba = (($g_menu_colors).md_violet_grey)
			z = 4
		}
		<bookEnd2ID> = <id>
		displaySprite {
			parent = character_hub_p1_container
			tex = hilite_bar_01
			rgba = (($g_menu_colors).md_violet_grey)
			Pos = (339.0, 176.0)
			dims = (310.0, 44.0)
			just = [left top]
			z = 2
		}
		<whiteTexHighlightID> = <id>
		get_current_band_info
		GetGlobalTags <band_info>
		formatText TextName = user_cash_amount '$%d' d = (<cash>) usecommas
		CreateScreenElement {
			Type = TextElement
			parent = character_hub_p1_container
			Pos = (350.0, 572.0)
			font = text_a4
			text = <user_cash_amount>
			Scale = 1.2
			rgba = (($g_menu_colors).lt_violet_grey)
			z_priority = 5
			just = [center center]
			Shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = (($g_menu_colors).black)
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((190.0, 0.0) + (<height> * (0.0, 1.0))) only_if_larger_x = 1
		<ch_menuItemSelected> = 0
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			font = fontgrid_title_gh3
			Scale = 1.333
			rgba = ($menu_unfocus_color)
			text = 'PLAY SHOW'
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_play_show params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((320.0, 0.0) + (<height> * (0.0, 1.0)))
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			font = fontgrid_title_gh3
			Scale = 1.333
			rgba = ($menu_unfocus_color)
			text = 'CHANGE CHARACTER'
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_go_back params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((320.0, 0.0) + (<height> * (0.0, 1.0)))
		if (<show_change_outfit>)
			CreateScreenElement {
				Type = TextElement
				parent = <vparent>
				font = fontgrid_title_gh3
				Scale = 1.333
				rgba = ($menu_unfocus_color)
				text = 'CHANGE OUTFIT'
				just = [center top]
				event_handlers = [
					{focus character_hub_highlighter params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <show_change_outfit>
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose character_hub_select_change_outfit params = {Player = <Player>}}
					{pad_start menu_show_gamercard}
				]
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((320.0, 0.0) + (<height> * (0.0, 1.0)))
		endif
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			font = fontgrid_title_gh3
			Scale = 1.333
			rgba = ($menu_unfocus_color)
			text = 'CHANGE GUITAR'
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_change_guitar params = {Player = <Player> vparent = <vparent>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((320.0, 0.0) + (<height> * (0.0, 1.0)))
		if ($is_demo_mode = 1)
			demo_mode_disable = {rgba = [80 80 80 255] not_focusable}
		else
			demo_mode_disable = {}
		endif
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			font = fontgrid_title_gh3
			Scale = 1.333
			rgba = ($menu_unfocus_color)
			text = 'ENTER VAULT'
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
					}
				}
				{focus SetScreenElementProps params = {id = ch_gc_logo rgba = (($g_menu_colors).md_violet_grey)}}
				{unfocus retail_menu_unfocus}
				{unfocus SetScreenElementProps params = {id = ch_gc_logo rgba = ($menu_unfocus_color)}}
				{pad_choose character_hub_select_the_store params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			<demo_mode_disable>
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((320.0, 0.0) + (<height> * (0.0, 1.0)))
		if (<show_change_outfit>)
			<logo_pos> = (360.0, 430.0)
		else
			<logo_pos> = (360.0, 365.0)
		endif
		CreateScreenElement {
			Type = SpriteElement
			id = ch_gc_logo
			parent = character_hub_p1_container
			Pos = <logo_pos>
			texture = logo_guitarcenter_128
			rgba = ($menu_unfocus_color)
			just = [center top]
			dims = (192.0, 96.0)
			z = 0
		}
	endif
	Change \{g_hub_destroy = 0}
	if ($using_guitar_select_camera = 1)
		SetScreenElementProps id = <bookEnd1ID> Hide preserve_flip
		SetScreenElementProps id = <bookEnd2ID> Hide
		SetScreenElementProps id = <whiteTexHighlightID> Hide
		LaunchEvent Type = unfocus target = <vparent>
		Change \{using_guitar_select_camera = 0}
		PlayIGCCam \{id = gs_view_cam_id
			Name = gs_view_cam
			viewport = bg_viewport
			controlscript = guitar_select_exit_camera_morph
			play_hold = 1
			interrupt_current}
		wait_for_guitar_select_exit_camera
		KillCamAnim \{Name = gs_view_cam}
		if CompositeObjectExists \{Name = GUITARIST}
			if NOT ($guitarist_info.stance = stance_frontend)
				Change \{structurename = guitarist_info
					current_anim = Idle}
				Change \{structurename = guitarist_info
					cycle_anim = true}
				Change \{structurename = guitarist_info
					next_anim = None}
				GUITARIST :handle_change_stance \{stance = stance_frontend
					speed = 2.0
					no_wait}
			endif
		endif
		if CompositeObjectExists \{Name = BASSIST}
			if NOT ($bassist_info.stance = stance_frontend)
				if CompositeObjectExists \{Name = BASSIST}
					BASSIST :handle_change_stance \{stance = stance_frontend
						speed = 2.0
						no_wait}
				endif
			endif
		endif
		SetScreenElementProps id = <bookEnd1ID> unhide preserve_flip
		SetScreenElementProps id = <bookEnd2ID> unhide
		SetScreenElementProps id = <whiteTexHighlightID> unhide
	endif
	LaunchEvent Type = focus target = <vparent>
	if ((GotParam 0x3f6d13fa) && (<0x3f6d13fa> = 1))
		0x3f6d13fa = 0
		destroy_loading_screen
		time = 1.0
		Wait <time> Seconds
		SpawnScriptNow \{menu_music_on}
	endif
	0x4c00d006 = ($menu_flow_locked - 1)
	Change menu_flow_locked = (<0x4c00d006>)
endscript

script character_hub_highlighter \{comi = 1
		chh_mp = 0
		chh_player = 1}
	if ($current_num_players = 1)
		retail_menu_focus
	endif
	if (<chh_mp> = 0)
		<y> = (170 + (50 * <menuItemNum>))
		SetScreenElementProps id = <be1ID> Pos = ((165.0, -3.0) + (<y> * (0.0, 1.0))) preserve_flip
		SetScreenElementProps id = <be2ID> Pos = ((534.0, -3.0) + (<y> * (0.0, 1.0)))
		SetScreenElementProps id = <wthlID> Pos = ((195.0, 0.0) + (<y> * (0.0, 1.0)) + (0.0, -4.0))
	elseif (<chh_mp> = 1)
		if (<chh_player> = 1)
			<offset_pos> = (0.0, -5.0)
		else
			<offset_pos> = (350.0, -5.0)
		endif
		if NOT (<comi>)
			<initial_pos> = (310.0, 486.0)
		else
			<initial_pos> = (310.0, 446.0)
		endif
		<r_bookend_offset> = (308.0, -6.0)
		<0xf0aea2ce> = (-6.0, -6.0)
		<vertical_offset> = (0.0, 42.5)
		<highlight_offset> = (17.0, -5.0)
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			<initial_pos> = (<initial_pos> + (0.0, -46.0))
		endif
		SetScreenElementProps id = <be1ID> Pos = (<initial_pos> + (<menuItemNum> * <vertical_offset>) + <0xf0aea2ce> + <offset_pos>) flip_v
		SetScreenElementProps id = <be2ID> Pos = (<initial_pos> + (<menuItemNum> * <vertical_offset>) + <r_bookend_offset> + <offset_pos>)
		SetScreenElementProps id = <wthlID> Pos = (<initial_pos> + (<menuItemNum> * <vertical_offset>) + <highlight_offset> + <offset_pos>)
	endif
endscript

script destroy_character_hub_menu \{Player = 1
		Destroy = 0}

	if (<Player> = 1)
		destroy_menu \{menu_id = scrolling_character_hub_p1}
		destroy_menu \{menu_id = character_hub_p1_container}
	else
		destroy_menu \{menu_id = scrolling_character_hub_p2}
		destroy_menu \{menu_id = character_hub_p2_container}
	endif
	KillCamAnim \{Name = gs_view_cam}
endscript

script character_hub_generic_sound 
	if (<Player> = 1)
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
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if (($current_num_players) = 2)
		if ((<Player> = 1) && ($p1_ready = 0))
			SetScreenElementProps \{id = vmenu_character_hub_p1
				disable_pad_handling}
			Change \{p1_ready = 1}
			if ($is_network_game = 1)
				if ScreenElementExists \{id = ready_container_p1}
					RunScriptOnScreenElement \{id = ready_container_p1
						pos2 = (825.0, 450.0)
						drop_in_ready_sign
						params = {
							Player = 1
						}}
				endif
			else
				drop_in_ready_sign \{Player = 1}
			endif
		endif
		if ((<Player> = 2) && ($p2_ready = 0))
			SetScreenElementProps \{id = vmenu_character_hub_p2
				disable_pad_handling}
			Change \{p2_ready = 1}
			drop_in_ready_sign \{Player = 2}
		endif
	endif
	if ((($p1_ready = 1) && ($p2_ready = 1)) || ($current_num_players = 1))
		if ($current_num_players = 2)
			Wait \{1
				Seconds}
			if NOT (($p1_ready = 1) && ($p2_ready = 1))
				return
			endif
		endif
		if ($is_network_game = 1)
			KillSpawnedScript \{Name = net_hub_stream}
			Wait \{0.4
				Seconds}
		endif
		if ScreenElementExists \{id = vmenu_character_hub_p1}
			LaunchEvent \{Type = unfocus
				target = vmenu_character_hub_p1}
		endif
		if ScreenElementExists \{id = vmenu_character_hub_p2}
			LaunchEvent \{Type = unfocus
				target = vmenu_character_hub_p2}
		endif
		clean_up_user_control_helpers
		shut_down_flow_manager \{Player = 2}
		shut_down_character_hub
		if (($is_network_game) = 1)
			ui_flow_manager_respond_to_action \{action = select_ready
				Player = 1
				create_params = {
					Player = 1
				}}
		else
			ui_flow_manager_respond_to_action \{action = select_play_show
				Player = 1
				create_params = {
					Player = 1
				}}
		endif
		Change \{p1_ready = 0}
		Change \{p2_ready = 0}
	endif
endscript

script character_hub_select_the_store 
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	clean_up_user_control_helpers
	shut_down_flow_manager \{Player = 2}
	shut_down_character_hub
	ui_flow_manager_respond_to_action action = select_the_store create_params = {Player = <Player>}
endscript

script character_hub_select_change_outfit 
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if ($is_network_game)
		net_info_panel_hide
	endif
	ui_flow_manager_respond_to_action action = select_change_outfit Player = <Player> create_params = {Player = <Player>}
endscript

script net_info_panel_hide 
	if ScreenElementExists \{id = net_game_info_panel}
		DoScreenElementMorph \{id = net_game_info_panel
			alpha = 0.0
			time = 0.1}
	endif
endscript

script net_info_panel_show 
	if NOT ScreenElementExists \{id = net_game_info_panel}
		return
	endif
	can_show = 1
	if ScreenElementExists \{id = scrolling_select_outfit_p1}
		can_show = 0
	elseif ScreenElementExists \{id = scrolling_select_outfit_p2}
		can_show = 0
	elseif ScreenElementExists \{id = scrolling_select_guitar_p1}
		can_show = 0
	elseif ScreenElementExists \{id = scrolling_select_guitar_p2}
		can_show = 0
	endif
	if (<can_show> = 1)
		DoScreenElementMorph \{id = net_game_info_panel
			alpha = 1.0
			time = 0.1}
	endif
endscript

script character_hub_select_change_guitar 
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	LaunchEvent Type = unfocus target = <vparent>
	if ($is_network_game)
		net_info_panel_hide
	endif
	if ($current_num_players = 1)
		generic_select_monitor_wait
	endif
	if GotParam \{bass}
		ui_flow_manager_respond_to_action action = select_change_bass Player = <Player> create_params = {Player = <Player>}
	else
		ui_flow_manager_respond_to_action action = select_change_guitar Player = <Player> create_params = {Player = <Player>}
	endif
endscript

script generic_select_monitor_wait 
	unpausespawnedscript \{generic_select_monitor}
	formatText \{checksumName = change_flag
		'generic_select_monitor_p%i_changed'
		i = 1}
	formatText \{checksumName = change_flag2
		'generic_select_monitor_p%i_changed'
		i = 2}
	begin

	if ($<change_flag> = 0)
		if ($current_num_players = 1 || $<change_flag2> = 0)
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script generic_select_monitor_finish 

	generic_select_monitor_wait
	KillSpawnedScript \{Name = generic_select_monitor}
endscript
generic_select_monitor_p1_changed = 0
generic_select_monitor_p2_changed = 0

script generic_select_monitor \{initial_load = 1
		node_flags = {
		}}
	async = 1
	if (<initial_load> = 1)
		Change GlobalName = <change_flag> NewValue = 1
	endif
	begin
	if ($<change_flag> = 1)
		Change GlobalName = <change_flag> NewValue = 2

		if ($<change_flag> = 2)
			<Name> :Obj_GetPosition
			0x9b5c3e5b = (<Pos>)
			if (<async> = 1)
				<Name> :Obj_SetPosition position = (0.0, -200.0, 0.0)
			endif
			if NOT create_guitarist Name = <Name> UseOldPos no_strum async = <async> animpak = 1 <node_flags>
				Change GlobalName = <change_flag> NewValue = 0
				DownloadContentLost
				return
			endif

			if (<async> = 1)
				loop_count = 0
				begin
				if ($0x652da952 = 1)
					break
				endif
				Wait \{1
					gameframe}
				loop_count = (<loop_count> + 1)
				if (<loop_count> > 60)
					break
				endif
				repeat
				<Name> :Obj_SetPosition position = <0x9b5c3e5b>
				Change \{store_shadow_change = 1}
			endif
		endif
		if ($<change_flag> = 2)
			Change GlobalName = <change_flag> NewValue = 0
		endif
	else
		WaitOneGameFrame
	endif
	async = 1
	repeat
endscript

script create_select_guitar_finish_menu \{Player = 1}
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back menu_flow_go_back params = {Player = <Player>}}
		{pad_start menu_show_gamercard}
	]
	if (<Player> = 1)
		if ($current_num_players = 2)
			new_menu scrollid = scrolling_select_finish_p1 vmenuid = vmenu_select_finish_p1 Name = 'Select Guitar Finish' use_backdrop = 0 exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		else
			new_menu scrollid = scrolling_select_finish_p1 vmenuid = vmenu_select_finish_p1 Name = 'Select Guitar Finish' use_backdrop = 0 event_handlers = <event_handlers>
		endif
		vparent = vmenu_select_finish_p1
	else
		new_menu scrollid = scrolling_select_finish_p2 vmenuid = vmenu_select_finish_p2 Name = 'Select Guitar Finish' use_backdrop = 0 exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		vparent = vmenu_select_finish_p2
	endif
	if ($current_num_players = 2)
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			font = text_a1
			Scale = 0.75
			rgba = [210 130 0 250]
			text = ('Finish 1')
			just = [left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			font = text_a1
			Scale = 0.75
			rgba = [210 130 0 250]
			text = ('Finish 2')
			just = [left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
	else
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			font = text_a1
			Scale = 0.75
			rgba = [210 130 0 250]
			text = ('Finish 1')
			just = [left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			font = text_a1
			Scale = 0.75
			rgba = [210 130 0 250]
			text = ('Finish 2')
			just = [left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
	endif
endscript

script destroy_select_guitar_finish_menu \{Player = 1}
	formatText checksumName = scrolling_select_finish 'scrolling_select_finish_p%i' i = <Player>
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
		return
	endif
	character_hub_pos = default_character_hub_pos
	destroy_bg_viewport
	setup_bg_viewport
	destroy_crowd_models
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		if NOT (<pakname> = 'z_soundcheck')
			ResetWaypoints
			SetPakManCurrentBlock \{map = zones
				pak = z_soundcheck
				block_scripts = 1}
		endif
	else
		ResetWaypoints
		SetPakManCurrentBlock \{map = zones
			pak = z_soundcheck
			block_scripts = 1}
	endif
	SafeCreate \{nodeName = Z_SoundCheck_GFX_TRG_LH_HotSpot01}
	player2_spotlight = Z_SoundCheck_GFX_TRG_LH_HotSpot_P2
	if ($current_num_players = 2)
		SafeCreate nodeName = <player2_spotlight>
	else
		SafeKill nodeName = <player2_spotlight>
	endif
	UnPauseGame
	disable_pause
	destroy_band

	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player>
	formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
	if (<Player> = 1)
		Name = ($player1_status.band_member)
	else
		Name = ($player2_status.band_member)
	endif
	SpawnScriptNow generic_select_monitor params = {Player = <Player> player_status = <player_status> change_flag = <change_flag> Name = <Name>}
	Player = (<Player> + 1)
	repeat ($current_num_players)
	StopRendering
	generic_select_monitor_wait
	StartRendering
	if CompositeObjectExists \{Name = drummer}
		drummer :Hide
	endif
	if CompositeObjectExists \{Name = guitarist2}
		guitarist2 :Hide
	endif
	if CompositeObjectExists \{Name = rhythm}
		rhythm :Hide
	endif
	if CompositeObjectExists \{Name = vocalist}
		vocalist :Hide
	endif
	if ($current_num_players = 1)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :Hide
		endif
	else
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :unhide
		endif
		if (($is_network_game = 1) && ($player2_present = 0))
			if CompositeObjectExists \{Name = BASSIST}
				BASSIST :Hide
			endif
		endif
	endif

	if CompositeObjectExists \{Name = GUITARIST}

		if ($current_num_players = 1)

			GUITARIST :Obj_SetPosition position = ($<character_hub_pos>.p1_pos)
		endif
	endif
	if ($current_num_players = 2)
		($player1_status.band_member) :Obj_SetPosition position = ($<character_hub_pos>.p1_2ppos)
		($player2_status.band_member) :Obj_SetPosition position = ($<character_hub_pos>.p2_2ppos)
	endif
	PlayIGCCam \{id = cs_view_cam_id
		Name = ch_view_cam
		viewport = bg_viewport
		LockTo = World
		Pos = (2.503113, 1.0385579, 2.869411)
		Quat = (0.028074998, -0.999026, 0.020287)
		FOV = 86.0
		play_hold = 1
		interrupt_current}
	showstencilshadow
	if ViewportExists \{id = UI}
		SetViewportProperties \{viewport = UI
			Active = FALSE}
	endif
	Change \{g_hub_created = 1}
	SetShadowDirFromLight \{Name = Z_SoundCheck_GFX_GC_SpotC_Top}
endscript

script shut_down_character_hub 
	if ($g_hub_created = 0)
		return
	endif
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	if ($shutdown_game_for_signin_change_flag = 1)
		KillSpawnedScript \{Name = setup_character_hub}
		Change \{using_guitar_select_camera = 0}
	endif
	generic_select_monitor_finish
	KillCamAnim \{Name = ch_view_cam}
	KillCamAnim \{Name = gs_view_cam}
	destroy_bg_viewport
	unpausespawnedscript \{menu_music_on}
	disable_pause
	if CompositeObjectExists \{Name = drummer}
		drummer :unhide
	endif
	if CompositeObjectExists \{Name = guitarist2}
		guitarist2 :unhide
	endif
	if CompositeObjectExists \{Name = vocalist}
		vocalist :unhide
	endif
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :unhide
	endif
	destroy_band
	if ViewportExists \{id = UI}
		SetViewportProperties \{viewport = UI
			Active = true}
	endif
	Change \{g_hub_created = 0}
	0x6bd4f3d9
endscript

script character_hub_go_back 
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if ($current_num_players = 2)
		leaving_character_hub = 1
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			leaving_character_hub = 0
		elseif ($current_num_players = 2)
			leaving_character_hub = 0
		endif
		if (<leaving_character_hub> = 0)
			if (<Player> = 1)
				SetScreenElementProps \{id = vmenu_character_hub_p1
					enable_pad_handling}
				Change \{p1_ready = 0}
				if ($is_network_game = 1)
					if ScreenElementExists \{id = ready_container_p1}
						RunScriptOnScreenElement \{id = ready_container_p1
							drop_out_ready_sign
							params = {
								Player = 1
							}}
					endif
				else
					drop_out_ready_sign \{Player = 1}
				endif
			else
				SetScreenElementProps \{id = vmenu_character_hub_p2
					enable_pad_handling}
				Change \{p2_ready = 0}
				drop_out_ready_sign \{Player = 2}
			endif
			ui_flow_manager_respond_to_action action = go_back create_params = {Player = <Player>} Player = <Player>
		endif
	else
		clean_up_user_control_helpers
		ui_flow_manager_respond_to_action Player = <Player> action = go_back
	endif
endscript

script get_num_character_outfits 
	if (<Player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
	else
		find_profile_by_id id = ($player2_status.character_id)
	endif
	get_musician_profile_struct index = <index>
	Name = (<profile_struct>.Name)
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<profile_struct>.Name = <Name>)
		GetArraySize (<profile_struct>.outfits)
		return num_character_outfits = <array_Size>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script get_num_outfit_styles \{outfit = 1}
	if (<Player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
	else
		find_profile_by_id id = ($player2_status.character_id)
	endif
	get_musician_profile_struct index = <index>
	Name = (<profile_struct>.Name)
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<profile_struct>.Name = <Name>)
		outfits = (<profile_struct>.outfits)
		GetArraySize (<outfits> [(<outfit> -1)].styles)
		return num_outfit_styles = <array_Size>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script get_character_outfits \{Player = 1}
	if GotParam \{character_id}
		find_profile_by_id id = <character_id>
	else
		if (<Player> = 1)
			find_profile_by_id id = ($player1_status.character_id)
		else
			find_profile_by_id id = ($player2_status.character_id)
		endif
	endif
	get_musician_profile_struct index = <index>
	Name = (<profile_struct>.Name)
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<profile_struct>.Name = <Name>)
		if StructureContains structure = <profile_struct> Name = outfits
			return character_outfits = (<profile_struct>.outfits)
		else
			return \{no_outfits}
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{no_outfits}
endscript

script get_character_name \{Player = 1}
	if (<Player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
	else
		find_profile_by_id id = ($player2_status.character_id)
	endif
	get_musician_profile_struct index = <index>
	return character_name = (<profile_struct>.Name) display_name = (<profile_struct>.fullname)
endscript

script get_character_outfit_name \{Player = 1}
	if (<Player> = 1)
		find_profile_by_id id = ($player1_status.character_id)
		outfit_index = ($player1_status.outfit - 1)
	else
		find_profile_by_id id = ($player2_status.character_id)
		outfit_index = ($player2_status.outfit - 1)
	endif
	get_musician_profile_struct index = <index>
	if StructureContains structure = <profile_struct> Name = outfits
		return outfit_name = (<profile_struct>.outfits [<outfit_index>].id)
	else
		return outfit_name = (<profile_struct>.Name)
	endif
endscript

script get_character_style_name \{Player = 1}
	if (<Player> = 1)
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
	menu_flow_go_back Player = <Player>
endscript

script net_style_menu_flow_go_back 
	menu_flow_go_back Player = <Player>
endscript
