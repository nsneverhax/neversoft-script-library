os_made_first_selection_bool_p1 = 0
os_made_first_selection_bool_p2 = 0
os_selected_outfit_p1 = 1
os_selected_outfit_old_p1 = 1
os_selected_outfit_p2 = 1
os_selected_outfit_old_p2 = 1
os_selected_style_p1 = 1
os_selected_style_old_p1 = 0
os_selected_style_p2 = 1
os_selected_style_old_p2 = 0
os_menu_start_pos_p1 = (0.0, 110.0)

script create_select_outfit_menu \{Player = 1}
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if (<Player> = 1)
		Change \{os_made_first_selection_bool_p1 = 0}
	else
		Change \{os_made_first_selection_bool_p2 = 0}
	endif
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<Player> = 1))
		pad_back_script = net_outfit_menu_flow_go_back
	else
		pad_back_script = menu_flow_go_back
	endif
	event_handlers = [
		{pad_up os_scroll_up_or_down params = {
				Player = <Player>
				Dir = up
			}
		}
		{pad_down os_scroll_up_or_down params = {
				Player = <Player>
				Dir = down
			}
		}
		{pad_back select_outfit_go_back params = {
				Player = <Player>
			}
		}
		{pad_choose select_outfit_choose params = {
				Player = <Player>
			}
		}
	]
	if (<Player> = 1)
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_select_outfit_p1
				vmenuid = vmenu_select_outfit_p1
				menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
			}
			vparent = vmenu_select_outfit_p1
		else
			new_menu {
				scrollid = scrolling_select_outfit_p1
				vmenuid = vmenu_select_outfit_p1
				menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
				exclusive_device = <exclusive_dev>
			}
			vparent = vmenu_select_outfit_p1
		endif
	else
		new_menu {
			scrollid = scrolling_select_outfit_p2
			vmenuid = vmenu_select_outfit_p2
			menu_pos = (700.0, 120.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_dev>
		}
		if ($is_network_game = 1)
			vmenu_select_outfit_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				target = vmenu_select_outfit_p2}
		endif
		vparent = vmenu_select_outfit_p2
	endif
	if ($current_num_players = 1)
		formatText checksumName = player_status 'player%i_status' i = <Player>
		if find_profile_by_id id = ($<player_status>.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
			if GetGlobalTags <default_characterguitartag> noassert = 1
				Change os_selected_outfit_p1 = (<current_outfit>)
				Change os_selected_outfit_old_p1 = (<current_outfit>)
				Change os_selected_style_p1 = (<current_style> - 1)
				Change os_selected_style_old_p1 = (<current_style> - 1)
			endif
		endif
		CreateScreenElement \{Type = ContainerElement
			id = select_outfit_container_p1
			parent = root_window
			Pos = (386.0, 0.0)}
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		<os_menu_starting_pos> = $os_menu_start_pos_p1
		displaySprite {
			parent = select_outfit_container_p1
			tex = window_frame_cap
			Pos = <os_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <brown_window_color>
			z = 0
		}
		displaySprite {
			parent = select_outfit_container_p1
			tex = window_fill_cap
			Pos = <os_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <window_fill_color>
			z = 0
		}
		displaySprite {
			parent = select_outfit_container_p1
			tex = window_header_01
			Pos = (<os_menu_starting_pos> + (0.0, -40.0))
			dims = (256.0, 64.0)
			just = [center center]
			rgba = [200 200 200 255]
			z = 1
		}
		displaySprite {
			id = os_mid_frame_ID
			parent = select_outfit_container_p1
			tex = window_frame_body_tall
			Pos = (<os_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 144.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
		}
		displaySprite {
			id = os_mid_fill_ID
			parent = select_outfit_container_p1
			tex = window_fill_body_large
			Pos = (<os_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 144.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
		}
		displaySprite {
			id = os_bottom_cap_ID
			parent = select_outfit_container_p1
			tex = window_frame_cap
			Pos = (<os_menu_starting_pos> + (0.0, 144.0))
			dims = (256.0, 64.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
			flip_h
		}
		displaySprite {
			id = os_bottom_fill_ID
			parent = select_outfit_container_p1
			tex = window_fill_cap
			Pos = (<os_menu_starting_pos> + (0.0, 144.0))
			dims = (256.0, 64.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
			flip_h
		}
		displayText {
			parent = select_outfit_container_p1
			text = "SELECT OUTFIT"
			Pos = ($gs_element_offsets [0])
			Scale = (0.6, 0.55)
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [185 100 60 255]
			z = 1
		}
		displaySprite {
			id = os_name_background
			parent = select_outfit_container_p1
			tex = Char_Select_Frame_BG
			Pos = ($gs_element_offsets [2])
			dims = (266.0, 128.0)
			just = [center center]
			rgba = [250 250 200 255]
			z = 1
		}
		get_character_outfits Player = <Player>
		<curr_outfit> = $os_selected_outfit_p1
		styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
		curr_style = (<styles> [($os_selected_style_p1)])
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		displayText {
			id = os_outfit_name_ID_p1
			parent = select_outfit_container_p1
			text = <UppercaseString>
			Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
			Scale = 1
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [160 80 30 255]
			z = 2
		}
		GetScreenElementDims \{id = os_outfit_name_ID_p1}
		if (<width> > 260)
			SetScreenElementProps \{id = os_outfit_name_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		GetUpperCaseString <curr_style>
		CreateScreenElement {
			id = os_outfit_style_ID_p1
			Type = TextBlockElement
			parent = select_outfit_container_p1
			text = <UppercaseString>
			Pos = ($gs_element_offsets [3])
			Scale = (0.55, 0.55)
			dims = (440.0, 300.0)
			font = text_a4
			just = [center center]
			rgba = [255 255 200 255]
			z = 2
		}
		GetScreenElementDims \{id = os_outfit_style_ID_p1}
		if (<width> > 256)
			fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3])
		endif
	else
		if (<Player> = 1)
			formatText checksumName = player_status 'player%i_status' i = <Player>
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
				if GetGlobalTags <default_characterguitartag> noassert = 1
					Change os_selected_outfit_p1 = (<current_outfit>)
					Change os_selected_outfit_old_p1 = (<current_outfit>)
					Change os_selected_style_p1 = (<current_style> - 1)
					Change os_selected_style_old_p1 = (<current_style> - 1)
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				id = select_outfit_container_p1
				parent = root_window
				Pos = (460.0, 500.0)}
			displaySprite \{parent = select_outfit_container_p1
				tex = guitar_select_2p_frame
				just = [
					center
					center
				]
				dims = (256.0, 432.0)
				Pos = (0.0, 40.0)
				z = 0}
			displaySprite \{parent = select_outfit_container_p1
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				Pos = (140.0, -24.0)
				z = 0}
			displaySprite \{parent = select_outfit_container_p1
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				Pos = (-140.0, -24.0)
				z = 0
				flip_v}
			displayText \{id = os_select_outfit_text_p1
				parent = select_outfit_container_p1
				text = "SELECT OUTFIT"
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [
					center
					center
				]
				rgba = [
					175
					105
					40
					255
				]
				z = 1}
			displaySprite \{id = os_name_background_p1
				parent = select_outfit_container_p1
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [
					center
					center
				]
				rgba = [
					250
					250
					200
					255
				]
				z = 1}
			displaySprite \{id = os_style_background_p1
				parent = select_outfit_container_p1
				tex = white
				Pos = (0.0, 88.0)
				dims = (266.0, 32.0)
				just = [
					center
					center
				]
				rgba = [
					120
					0
					0
					255
				]
				z = 1}
			get_character_outfits Player = <Player>
			<curr_outfit> = $os_selected_outfit_p1
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [($os_selected_style_p1)])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			displayText {
				id = os_outfit_name_ID_p1
				parent = select_outfit_container_p1
				text = <UppercaseString>
				Pos = (0.0, 20.0)
				Scale = 1
				font = text_a4
				just = [center center]
				rgba = [80 0 10 255]
				z = 2
				noshadow
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_name_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			displayText {
				id = os_outfit_style_ID_p1
				parent = select_outfit_container_p1
				text = <UppercaseString>
				Pos = (0.0, 83.0)
				Scale = (0.75, 0.5)
				font = text_a4
				just = [center center]
				rgba = [250 250 200 255]
				z = 2
				noshadow
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p1}
			if (<width> > 256)
				fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 83.0)
			endif
		else
			if NOT ($is_network_game)
				formatText checksumName = player_status 'player%i_status' i = <Player>
				if find_profile_by_id id = ($<player_status>.character_id)
					get_musician_profile_struct index = <index>
					formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
					if GetGlobalTags <default_characterguitartag> noassert = 1
						Change os_selected_outfit_p2 = (<current_outfit>)
						Change os_selected_outfit_old_p2 = (<current_outfit>)
						Change os_selected_style_p2 = (<current_style> - 1)
						Change os_selected_style_old_p2 = (<current_style> - 1)
					endif
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				id = select_outfit_container_p2
				parent = root_window
				Pos = (810.0, 500.0)}
			displaySprite \{parent = select_outfit_container_p2
				tex = guitar_select_2p_frame
				just = [
					center
					center
				]
				dims = (256.0, 432.0)
				Pos = (0.0, 40.0)
				z = 0}
			displaySprite \{parent = select_outfit_container_p2
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				Pos = (140.0, -24.0)
				z = 0}
			displaySprite \{parent = select_outfit_container_p2
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				Pos = (-140.0, -24.0)
				z = 0
				flip_v}
			displayText \{id = os_select_outfit_text_p2
				parent = select_outfit_container_p2
				text = "SELECT OUTFIT"
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [
					center
					center
				]
				rgba = [
					140
					110
					150
					255
				]
				z = 1}
			displaySprite \{id = os_name_background_p2
				parent = select_outfit_container_p2
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [
					center
					center
				]
				rgba = [
					240
					210
					250
					255
				]
				z = 1}
			displaySprite \{id = os_style_background_p2
				parent = select_outfit_container_p2
				tex = white
				Pos = (0.0, 88.0)
				dims = (266.0, 32.0)
				just = [
					center
					center
				]
				rgba = [
					110
					0
					90
					255
				]
				z = 1}
			get_character_outfits Player = <Player>
			<curr_outfit> = $os_selected_outfit_p2
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [($os_selected_style_p2)])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			displayText {
				id = os_outfit_name_ID_p2
				parent = select_outfit_container_p2
				text = <UppercaseString>
				Pos = (0.0, 20.0)
				Scale = 1
				font = text_a4
				just = [center center]
				rgba = [80 0 10 255]
				z = 2
				noshadow
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_name_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_name_ID_p2 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			displayText {
				id = os_outfit_style_ID_p2
				parent = select_outfit_container_p2
				text = <UppercaseString>
				Pos = (0.0, 83.0)
				Scale = (0.75, 0.5)
				font = text_a4
				just = [center center]
				rgba = [250 250 200 255]
				z = 2
				noshadow
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p2}
			if (<width> > 256)
				fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 83.0)
			endif
		endif
	endif
endscript

script scale_outfit_select_menu 
	if GotParam \{make_big}
		SetScreenElementProps \{id = os_mid_frame_ID
			dims = (256.0, 300.0)}
		SetScreenElementProps \{id = os_mid_fill_ID
			dims = (256.0, 300.0)}
		SetScreenElementProps id = os_bottom_cap_ID Pos = ($os_menu_start_pos_p1 + (0.0, 332.0)) flip_h
		SetScreenElementProps id = os_bottom_fill_ID Pos = ($os_menu_start_pos_p1 + (0.0, 332.0)) flip_h
	elseif GotParam \{make_small}
		SetScreenElementProps \{id = os_mid_frame_ID
			dims = (256.0, 144.0)}
		SetScreenElementProps \{id = os_mid_fill_ID
			dims = (256.0, 144.0)}
		SetScreenElementProps id = os_bottom_cap_ID Pos = ($os_menu_start_pos_p1 + (0.0, 144.0)) flip_h
		SetScreenElementProps id = os_bottom_fill_ID Pos = ($os_menu_start_pos_p1 + (0.0, 144.0)) flip_h
	endif
endscript

script destroy_select_outfit_menu \{Player = 1}
	formatText checksumName = scrolling_select_outfit 'scrolling_select_outfit_p%i' i = <Player>
	formatText checksumName = select_outfit_container 'select_outfit_container_p%i' i = <Player>
	formatText checksumName = scrolling_select_style 'scrolling_outfit_style_menu_p%i' i = <Player>
	formatText checksumName = select_style_container 'select_style_container_p%i' i = <Player>
	destroy_menu menu_id = <scrolling_select_outfit>
	destroy_menu menu_id = <select_outfit_container>
	destroy_menu menu_id = <scrolling_select_style>
	destroy_menu menu_id = <select_style_container>
endscript

script select_outfit_go_back \{Player = 1}
	if (($is_network_game) && (<Player> = 1))
		network_player_lobby_message \{Type = outfit_select
			action = deselect}
	endif
	formatText checksumName = player_status 'player%i_status' i = <Player>
	formatText checksumName = this_outfit 'os_selected_outfit_p%i' i = <Player>
	formatText checksumName = old_outfit 'os_selected_outfit_old_p%i' i = <Player>
	formatText checksumName = old_style 'os_selected_style_old_p%i' i = <Player>
	if NOT ($<old_outfit> = ($<player_status>.outfit) && ($<old_style> + 1) = ($<player_status>.style))
		Change structurename = <player_status> outfit = $<old_outfit>
		Change structurename = <player_status> style = ($<old_style> + 1)
		formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	if (<Player> = 1)
		Change \{os_selected_outfit_p1 = $os_selected_outfit_old_p1}
	else
		Change \{os_selected_outfit_p2 = $os_selected_outfit_old_p2}
	endif
	if (($is_network_game = 0) || (<Player> = 1))
		if find_profile_by_id id = ($<player_status>.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
			SetGlobalTags <default_characterguitartag> params = {current_outfit = ($<old_outfit>)}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back Player = <Player>
endscript

script os_scroll_up_or_down \{Player = 1
		Dir = down}
	generic_menu_up_or_down_sound params = {<Dir>}
	if (<Player> = 1)
		if ($os_made_first_selection_bool_p1 = 0)
			if ($os_selected_outfit_p1 = 1)
				get_character_name Player = <Player>
				formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' n = <character_name>
				GetGlobalTags <outfit_2_checksum>
				if (<unlocked>)
					Change \{os_selected_outfit_p1 = 2}
				endif
			else
				Change \{os_selected_outfit_p1 = 1}
			endif
			if ($is_network_game)
				network_player_lobby_message \{Type = outfit_select
					action = update
					value1 = $os_selected_outfit_p1}
			endif
			if NOT ($os_selected_outfit_p1 = ($player1_status.outfit))
				Change \{structurename = player1_status
					outfit = $os_selected_outfit_p1}
				Change \{structurename = player1_status
					style = 1}
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player1_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				curr_style = (<styles> [0])
				GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
				SetScreenElementProps id = os_outfit_name_ID_p1 text = <UppercaseString>
				GetUpperCaseString <curr_style>
				SetScreenElementProps id = os_outfit_style_ID_p1 text = <UppercaseString>
				if ($current_num_players = 1)
					GetScreenElementDims \{id = os_outfit_name_ID_p1}
					if (<width> > 260)
						SetScreenElementProps \{id = os_outfit_name_ID_p1
							Scale = 1}
						fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
					endif
					GetScreenElementDims \{id = os_outfit_style_ID_p1}
					if (<width> > 256)
						fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3])
					endif
				else
					GetScreenElementDims \{id = os_outfit_name_ID_p1}
					if (<width> > 260)
						SetScreenElementProps \{id = os_outfit_name_ID_p1
							Scale = 1}
						fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 20.0)
					endif
					GetScreenElementDims \{id = os_outfit_style_ID_p1}
					if (<width> > 256)
						fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 83.0)
					endif
				endif
			endif
		endif
	else
		if ($os_made_first_selection_bool_p2 = 0)
			if ($os_selected_outfit_p2 = 1)
				get_character_name Player = <Player>
				formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' n = <character_name>
				GetGlobalTags <outfit_2_checksum>
				if (<unlocked>)
					Change \{os_selected_outfit_p2 = 2}
				endif
			else
				Change \{os_selected_outfit_p2 = 1}
			endif
			if NOT ($os_selected_outfit_p2 = $player2_status.outfit)
				Change \{structurename = player2_status
					outfit = $os_selected_outfit_p2}
				Change \{structurename = player2_status
					style = 1}
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player2_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				curr_style = (<styles> [0])
				GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
				SetScreenElementProps id = os_outfit_name_ID_p2 text = <UppercaseString>
				GetUpperCaseString <curr_style>
				SetScreenElementProps id = os_outfit_style_ID_p2 text = <UppercaseString>
				GetScreenElementDims \{id = os_outfit_name_ID_p2}
				if (<width> > 260)
					SetScreenElementProps \{id = os_outfit_name_ID_p2
						Scale = 1}
					fit_text_in_rectangle id = os_outfit_name_ID_p2 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 20.0)
				endif
				GetScreenElementDims \{id = os_outfit_style_ID_p2}
				if (<width> > 256)
					fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 83.0)
				endif
			endif
		endif
	endif
endscript

script select_outfit_choose \{Player = 1
		needs_net_message = 1}
	SoundEvent \{event = ui_sfx_select}
	if (<Player> = 1)
		if ($os_made_first_selection_bool_p1 = 1)
			Change \{structurename = player1_status
				outfit = $os_selected_outfit_p1}
			Change structurename = player1_status style = ($os_selected_style_p1 + 1)
			if find_profile_by_id id = ($player1_status.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
				SetGlobalTags <default_characterguitartag> params = {current_outfit = ($os_selected_outfit_p1) current_style = ($os_selected_style_p1 + 1)}
			endif
			Change \{os_selected_outfit_old_p1 = $os_selected_outfit_p1}
			Change \{os_selected_style_old_p1 = $os_selected_style_p1}
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = style_select
					action = select
					value1 = $os_selected_style_p1}
			endif
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		else
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = outfit_select
					action = select
					checksum = $os_selected_outfit_p1}
			endif
			select_outfit_create_style_menu Player = <Player>
			Change \{os_made_first_selection_bool_p1 = 1}
		endif
	else
		if ($os_made_first_selection_bool_p2 = 1)
			Change \{structurename = player2_status
				outfit = $os_selected_outfit_p2}
			Change structurename = player2_status style = ($os_selected_style_p2 + 1)
			if NOT ($is_network_game)
				if find_profile_by_id id = ($player2_status.character_id)
					get_musician_profile_struct index = <index>
					formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
					SetGlobalTags <default_characterguitartag> params = {current_outfit = $os_selected_outfit_p2 current_style = ($os_selected_style_p2 + 1)}
				endif
			endif
			Change \{os_selected_outfit_old_p2 = $os_selected_outfit_p2}
			Change \{os_selected_style_old_p2 = $os_selected_style_p2}
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		else
			select_outfit_create_style_menu Player = <Player>
			Change \{os_made_first_selection_bool_p2 = 1}
		endif
	endif
endscript

script select_outfit_create_style_menu \{Player = 1}
	formatText checksumName = player_status 'player%i_status' i = <Player>
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<Player> = 1))
		pad_back_script = net_destroy_select_style_menu
	else
		pad_back_script = destroy_select_style_menu
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back <pad_back_script> params = {Player = <Player>}}
		{pad_start menu_show_gamercard}
	]
	<p1_menu_pos> = (566.0, 480.0)
	<p2_menu_pos> = (786.0, 490.0)
	<menu_offset> = (-270.0, -160.0)
	if (<Player> = 1)
		if ($current_num_players = 2)
			new_menu {
				scrollid = scrolling_outfit_style_menu_p1
				vmenuid = vmenu_outfit_style_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				menu_pos = (<p1_menu_pos> + (-178.0, -210.0))
				exclusive_device = <exclusive_dev>
				internal_just = [center top]
			}
		else
			new_menu {
				scrollid = scrolling_outfit_style_menu_p1
				vmenuid = vmenu_outfit_style_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				menu_pos = (<p1_menu_pos> + <menu_offset>)
				internal_just = [center top]
				text_left
			}
		endif
		vparent = vmenu_outfit_style_menu_p1
	else
		new_menu {
			scrollid = scrolling_outfit_style_menu_p2
			vmenuid = vmenu_outfit_style_menu_p2
			use_backdrop = 0
			event_handlers = <event_handlers>
			menu_pos = <p2_menu_pos>
			exclusive_device = <exclusive_dev>
			internal_just = [center top]
		}
		if ($is_network_game = 1)
			vmenu_outfit_style_menu_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				target = vmenu_outfit_style_menu_p2}
		endif
		vparent = vmenu_outfit_style_menu_p2
	endif
	if (<Player> = 1)
		LaunchEvent \{Type = unfocus
			target = scrolling_select_outfit_p1}
	else
		LaunchEvent \{Type = unfocus
			target = scrolling_select_outfit_p2}
	endif
	if ($current_num_players = 1)
		CreateScreenElement {
			Type = ContainerElement
			id = select_style_container
			parent = root_window
			Pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [center top]
		}
		scale_outfit_select_menu \{make_big}
		<brown_window_color> = [120 60 10 255]
		SetScreenElementProps {
			id = os_name_background
			texture = store_frame_bottom_bg
			dims = (242.0, 128.0)
			rgba = <brown_window_color>
		}
		SetScreenElementProps \{id = os_outfit_name_ID_p1
			rgba = [
				250
				250
				200
				255
			]
			Scale = 0.8}
		GetScreenElementDims \{id = os_outfit_name_ID_p1}
		if (<width> > 260)
			SetScreenElementProps \{id = os_outfit_name_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((215.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		displaySprite \{id = os_bookend1_ID
			parent = select_style_container
			tex = character_hub_hilite_bookend
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
			Pos = (-64.0, 11.0)
			z = 4}
		displaySprite \{id = os_bookend2_ID
			parent = select_style_container
			tex = character_hub_hilite_bookend
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
			Pos = (238.0, 11.0)
			z = 4}
		displaySprite \{id = os_whiteTexHighlight_ID
			parent = select_style_container
			tex = white
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
			dims = (264.0, 32.0)
			Pos = (-47.0, 8.0)
			z = 2}
		set_focus_color \{rgba = [
				130
				40
				40
				250
			]}
		set_unfocus_color \{rgba = [
				180
				100
				60
				250
			]}
		get_character_outfits Player = <Player>
		outfit = ($player1_status.outfit)
		styles = (<character_outfits> [(<outfit> - 1)].styles)
		GetArraySize <styles>
		<num_in_list> = 0
		<i> = 0
		begin
		<add_style> = 1
		if NOT (<i> = 0)
			get_character_name Player = <Player>
			formatText checksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = (<i> + 1)
			GetGlobalTags <outfit_style_cs>
			if (<unlocked> = 0)
				<add_style> = 0
			endif
		endif
		if (<add_style>)
			<num_in_list> = (<num_in_list> + 1)
			formatText checksumName = os_style_menu_item_id 'os_style_menu_item_%n' n = <i>
			GetUpperCaseString (<styles> [<i>])
			CreateScreenElement {
				id = <os_style_menu_item_id>
				Type = TextElement
				parent = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [center top]
				text = <UppercaseString>
				event_handlers = [
					{focus retail_menu_focus}
					{focus select_outfit_style_highlight params = {Player = <Player>
							index = <i>
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_outfit_style_choose params = {Player = <Player>}}
				]
			}
			GetScreenElementDims id = <id>
			if (<width> > 180)
				SetScreenElementProps id = <id> Scale = 1
				fit_text_in_rectangle id = <id> dims = ((180.0, 34.0))
			endif
		else
			CreateScreenElement {
				Type = TextElement
				parent = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [center top]
				text = ""
				not_focusable
			}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<num_in_list> = 1)
			Change \{os_made_first_selection_bool_p1 = 1}
			select_outfit_style_highlight {
				Player = <Player>
			}
			select_outfit_style_choose {
				Player = <Player>
			}
		endif
	else
		if (<Player> = 1)
			LaunchEvent \{Type = unfocus
				target = scrolling_select_outfit_p1}
			LaunchEvent Type = focus target = <vparent>
			SetScreenElementProps \{id = os_select_outfit_text_p1
				text = "SELECT STYLE"}
			SetScreenElementProps \{id = os_name_background_p1
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{id = os_style_background_p1
				Pos = (0.0, 0.0)}
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player1_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [(($player1_status.style) - 1)])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				id = os_outfit_name_ID_p1
				text = <UppercaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, -6.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_name_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p1
				text = <UppercaseString>
				Scale = (1.0, 0.8)
				Pos = (0.0, 52.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 52.0)
			endif
			GetArraySize <styles>
			<num_in_list> = 0
			<i> = 0
			begin
			<add_style> = 1
			if NOT (<i> = 0)
				get_character_name Player = <Player>
				formatText checksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <curr_outfit> s = (<i> + 1)
				GetGlobalTags <outfit_style_cs>
				if (<unlocked> = 0)
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				GetUpperCaseString (<styles> [<i>])
				CreateScreenElement {
					Type = TextElement
					parent = <vparent>
					font = text_a4
					Scale = (0.7, 0.7)
					rgba = ($menu_unfocus_color)
					just = [center top]
					text = <UppercaseString>
					event_handlers = [
						{focus retail_menu_focus}
						{focus select_outfit_style_highlight params = {Player = <Player>
								index = <i>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose params = {
								Player = <Player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					Hide
				}
				GetScreenElementDims id = <id>
				if (<width> > 180)
					fit_text_in_rectangle id = <id> dims = (0.7 * ((160.0, 0.0) + (<height> * (0.0, 1.0)))) Pos = (<p1_menu_pos> + <menu_offset>)
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			if (<num_in_list> = 1)
				Change \{os_made_first_selection_bool_p1 = 1}
				select_outfit_style_highlight {
					needs_net_message = 0
					Player = <Player>
				}
				select_outfit_style_choose {
					needs_net_message = 0
					Player = <Player>
				}
			endif
		else
			LaunchEvent \{Type = unfocus
				target = scrolling_select_outfit_p2}
			if ($is_network_game = 0)
				LaunchEvent Type = focus target = <vparent>
			endif
			SetScreenElementProps \{id = os_select_outfit_text_p2
				text = "SELECT STYLE"}
			SetScreenElementProps \{id = os_name_background_p2
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{id = os_style_background_p2
				Pos = (0.0, 0.0)}
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [(($player2_status.style) - 1)])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				id = os_outfit_name_ID_p2
				text = <UppercaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, -6.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_name_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_name_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p2
				text = <UppercaseString>
				Scale = (1.0, 0.8)
				Pos = (0.0, 52.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 52.0)
			endif
			GetArraySize <styles>
			<num_in_list> = 0
			<i> = 0
			begin
			<add_style> = 1
			if NOT (<i> = 0)
				get_character_name Player = <Player>
				formatText checksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <curr_outfit> s = (<i> + 1)
				GetGlobalTags <outfit_style_cs>
				if (<unlocked> = 0)
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				GetUpperCaseString (<styles> [<i>])
				CreateScreenElement {
					Type = TextElement
					parent = <vparent>
					font = text_a4
					Scale = (0.7, 0.7)
					rgba = ($menu_unfocus_color)
					just = [center top]
					text = <UppercaseString>
					event_handlers = [
						{focus retail_menu_focus}
						{focus select_outfit_style_highlight params = {Player = <Player>
								index = <i>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose params = {
								Player = <Player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					Hide
				}
				GetScreenElementDims id = <id>
				if (<width> > 180)
					fit_text_in_rectangle id = <id> dims = (0.7 * ((160.0, 0.0) + (<height> * (0.0, 1.0)))) Pos = (<p2_menu_pos> + <menu_offset>)
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			if (<num_in_list> = 1)
				Change \{os_made_first_selection_bool_p2 = 1}
				select_outfit_style_highlight {
					Player = <Player>
				}
				select_outfit_style_choose {
					Player = <Player>
				}
			endif
		endif
	endif
endscript

script net_destroy_select_style_menu \{Player = 1}
	if ($is_network_game)
		network_player_lobby_message \{Type = style_select
			action = deselect}
	endif
	destroy_select_style_menu Player = <Player>
endscript

script destroy_select_style_menu \{Player = 1}
	SoundEvent \{event = Generic_Menu_Back_SFX}
	if ($current_num_players = 1)
		LaunchEvent \{Type = focus
			target = scrolling_select_outfit_p1}
		LaunchEvent \{Type = unfocus
			target = scrolling_outfit_style_menu_p1}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
		Change \{os_made_first_selection_bool_p1 = 0}
		destroy_menu \{menu_id = select_style_container}
		formatText checksumName = old_outfit 'os_selected_outfit_old_p%i' i = <Player>
		formatText checksumName = old_style 'os_selected_style_old_p%i' i = <Player>
		if NOT ($<old_outfit> = ($player1_status.outfit) && ($<old_style> + 1) = ($player1_status.style))
			Change structurename = player1_status outfit = $<old_outfit>
			Change structurename = player1_status style = ($<old_style> + 1)
			formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
			Change GlobalName = <change_flag> NewValue = 1
		endif
		Change os_selected_outfit_p1 = $<old_outfit>
		scale_outfit_select_menu \{make_small}
		SetScreenElementProps \{id = os_name_background
			texture = Char_Select_Frame_BG
			dims = (266.0, 128.0)
			rgba = [
				250
				250
				200
				255
			]}
		SetScreenElementProps \{id = os_outfit_name_ID_p1
			rgba = [
				160
				80
				30
				255
			]}
		get_character_outfits Player = <Player>
		<curr_outfit> = ($player1_status.outfit)
		styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
		curr_style = (<styles> [(($player1_status.style) - 1)])
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		SetScreenElementProps id = os_outfit_name_ID_p1 text = <UppercaseString>
		GetUpperCaseString <curr_style>
		SetScreenElementProps id = os_outfit_style_ID_p1 text = <UppercaseString>
		SetScreenElementProps \{id = os_outfit_name_ID_p1
			Scale = 1}
		GetScreenElementDims \{id = os_outfit_name_ID_p1}
		if (<width> > 260)
			SetScreenElementProps \{id = os_outfit_name_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
	else
		if (<Player> = 1)
			SetScreenElementProps \{id = os_select_outfit_text_p1
				text = "SELECT OUTFIT"}
			LaunchEvent \{Type = focus
				target = scrolling_select_outfit_p1}
			LaunchEvent \{Type = unfocus
				target = scrolling_outfit_style_menu_p1}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
			Change \{os_made_first_selection_bool_p1 = 0}
			formatText checksumName = old_outfit 'os_selected_outfit_old_p%i' i = <Player>
			formatText checksumName = old_style 'os_selected_style_old_p%i' i = <Player>
			if NOT ($<old_outfit> = ($player1_status.outfit) && ($<old_style> + 1) = ($player1_status.style))
				Change structurename = player1_status outfit = $<old_outfit>
				Change structurename = player1_status style = ($<old_style> + 1)
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			Change os_selected_outfit_p1 = $<old_outfit>
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player1_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [(($player1_status.style) - 1)])
			SetScreenElementProps \{id = os_name_background_p1
				Pos = (0.0, 30.0)}
			SetScreenElementProps \{id = os_style_background_p1
				Pos = (0.0, 88.0)}
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				id = os_outfit_name_ID_p1
				text = <UppercaseString>
				Scale = 1
				Pos = (0.0, 20.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_name_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p1
				text = <UppercaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, 83.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 83.0)
			endif
		else
			SetScreenElementProps \{id = os_select_outfit_text_p2
				text = "SELECT OUTFIT"}
			LaunchEvent \{Type = focus
				target = scrolling_select_outfit_p2}
			LaunchEvent \{Type = unfocus
				target = scrolling_outfit_style_menu_p2}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p2}
			Change \{os_made_first_selection_bool_p2 = 0}
			formatText checksumName = old_outfit 'os_selected_outfit_old_p%i' i = <Player>
			formatText checksumName = old_style 'os_selected_style_old_p%i' i = <Player>
			if NOT ($<old_outfit> = ($player2_status.outfit) && ($<old_style> + 1) = ($player2_status.style))
				Change structurename = player2_status outfit = $<old_outfit>
				Change structurename = player2_status style = ($<old_style> + 1)
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			Change os_selected_outfit_p2 = $<old_outfit>
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [(($player2_status.style) - 1)])
			SetScreenElementProps \{id = os_name_background_p2
				Pos = (0.0, 30.0)}
			SetScreenElementProps \{id = os_style_background_p2
				Pos = (0.0, 88.0)}
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				id = os_outfit_name_ID_p2
				text = <UppercaseString>
				Scale = 1
				Pos = (0.0, 20.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_name_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_name_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p2
				text = <UppercaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, 83.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 83.0)
			endif
		endif
	endif
	if (<Player> = 1)
		destroy_menu \{menu_id = select_style_container}
	else
		destroy_menu \{menu_id = select_style_container_p2}
	endif
endscript

script select_outfit_style_highlight \{Player = 1
		index = 0
		needs_net_message = 1}
	formatText checksumName = player_status 'player%i_status' i = <Player>
	formatText checksumName = selected_outfit 'os_selected_outfit_p%i' i = <Player>
	if NOT ($<selected_outfit> = ($<player_status>.outfit) && (<index> + 1) = ($<player_status>.style))
		Change structurename = <player_status> style = (<index> + 1)
		formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	if (<Player> = 1)
		Change os_selected_style_p1 = <index>
	else
		Change os_selected_style_p2 = <index>
	endif
	get_character_outfits Player = <Player>
	if (<Player> = 1)
		<curr_outfit> = ($player1_status.outfit)
	else
		<curr_outfit> = ($player2_status.outfit)
	endif
	styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
	curr_style = (<styles> [(<index>)])
	if ($current_num_players = 1)
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		SetScreenElementProps id = os_outfit_name_ID_p1 text = <UppercaseString>
		GetUpperCaseString <curr_style>
		SetScreenElementProps id = os_outfit_style_ID_p1 text = <UppercaseString>
		<offset> = (<index> * (0.0, 33.5))
		<l_pos> = ((-64.0, 11.0) + <offset>)
		<r_pos> = ((238.0, 11.0) + <offset>)
		<hl_pos> = ((-47.0, 8.0) + <offset>)
		SetScreenElementProps id = os_bookend1_ID Pos = <l_pos>
		SetScreenElementProps id = os_bookend2_ID Pos = <r_pos>
		SetScreenElementProps id = os_whiteTexHighlight_ID Pos = <hl_pos>
	else
		if (<Player> = 1)
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p1
				text = <UppercaseString>
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 52.0)
			endif
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = style_select
					action = update
					value1 = $os_selected_style_p1}
			endif
		else
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p2
				text = <UppercaseString>
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 52.0)
			endif
		endif
	endif
endscript

script select_outfit_style_choose \{Player = 1
		needs_net_message = 1}
	if (<Player> = 1)
		select_outfit_choose {
			Player = <Player>
			needs_net_message = <needs_net_message>
		}
	else
		select_outfit_choose {
			Player = <Player>
		}
	endif
	if (<Player> = 1)
		destroy_menu \{menu_id = select_style_container}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
	else
		destroy_menu \{menu_id = select_style_container_p2}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p2}
	endif
endscript
