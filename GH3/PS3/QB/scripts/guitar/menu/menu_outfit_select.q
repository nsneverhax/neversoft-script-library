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
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
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
		{pad_up os_scroll_up_or_down Params = {
				Player = <Player>
				Dir = UP
			}
		}
		{pad_down os_scroll_up_or_down Params = {
				Player = <Player>
				Dir = DOWN
			}
		}
		{pad_back select_outfit_go_back Params = {
				Player = <Player>
			}
		}
		{pad_choose select_outfit_choose Params = {
				Player = <Player>
			}
		}
	]
	if (<Player> = 1)
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_select_outfit_p1
				vmenuid = vmenu_select_outfit_p1
				Menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
			}
			vparent = vmenu_select_outfit_p1
		else
			new_menu {
				scrollid = scrolling_select_outfit_p1
				vmenuid = vmenu_select_outfit_p1
				Menu_pos = (120.0, 190.0)
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
			Menu_pos = (700.0, 120.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_dev>
		}
		if ($is_network_game = 1)
			vmenu_select_outfit_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				Target = vmenu_select_outfit_p2}
		endif
		vparent = vmenu_select_outfit_p2
	endif
	if ($current_num_players = 1)
		FormatText ChecksumName = player_status 'player%i_status' I = <Player>
		if find_profile_by_id Id = ($<player_status>.character_id)
			get_musician_profile_struct Index = <Index>
			FormatText ChecksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
			if GetGlobalTags <default_characterguitartag> noassert = 1
				Change os_selected_outfit_p1 = (<current_outfit>)
				Change os_selected_outfit_old_p1 = (<current_outfit>)
				Change os_selected_style_p1 = (<current_style> - 1)
				Change os_selected_style_old_p1 = (<current_style> - 1)
			endif
		endif
		CreateScreenElement \{Type = ContainerElement
			Id = select_outfit_container_p1
			PARENT = root_window
			Pos = (386.0, 0.0)}
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		<os_menu_starting_pos> = $os_menu_start_pos_p1
		displaySprite {
			PARENT = select_outfit_container_p1
			tex = window_frame_cap
			Pos = <os_menu_starting_pos>
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			PARENT = select_outfit_container_p1
			tex = window_fill_cap
			Pos = <os_menu_starting_pos>
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = <window_fill_color>
			Z = 0
		}
		displaySprite {
			PARENT = select_outfit_container_p1
			tex = window_header_01
			Pos = (<os_menu_starting_pos> + (0.0, -40.0))
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = [200 200 200 255]
			Z = 1
		}
		displaySprite {
			Id = os_mid_frame_ID
			PARENT = select_outfit_container_p1
			tex = window_frame_body_tall
			Pos = (<os_menu_starting_pos> + (0.0, 32.0))
			Dims = (256.0, 144.0)
			just = [Center Top]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			Id = os_mid_fill_ID
			PARENT = select_outfit_container_p1
			tex = window_fill_body_large
			Pos = (<os_menu_starting_pos> + (0.0, 32.0))
			Dims = (256.0, 144.0)
			just = [Center Top]
			rgba = <window_fill_color>
			Z = 0
		}
		displaySprite {
			Id = os_bottom_cap_ID
			PARENT = select_outfit_container_p1
			tex = window_frame_cap
			Pos = (<os_menu_starting_pos> + (0.0, 144.0))
			Dims = (256.0, 64.0)
			just = [Center Top]
			rgba = <brown_window_color>
			Z = 0
			flip_h
		}
		displaySprite {
			Id = os_bottom_fill_ID
			PARENT = select_outfit_container_p1
			tex = window_fill_cap
			Pos = (<os_menu_starting_pos> + (0.0, 144.0))
			Dims = (256.0, 64.0)
			just = [Center Top]
			rgba = <window_fill_color>
			Z = 0
			flip_h
		}
		displayText {
			PARENT = select_outfit_container_p1
			Text = "SELECT OUTFIT"
			Pos = ($gs_element_offsets [0])
			Scale = (0.6, 0.55)
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = [185 100 60 255]
			Z = 1
		}
		displaySprite {
			Id = os_name_background
			PARENT = select_outfit_container_p1
			tex = Char_Select_Frame_BG
			Pos = ($gs_element_offsets [2])
			Dims = (266.0, 128.0)
			just = [Center Center]
			rgba = [250 250 200 255]
			Z = 1
		}
		get_character_outfits Player = <Player>
		<curr_outfit> = $os_selected_outfit_p1
		styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
		curr_style = (<styles> [($os_selected_style_p1)])
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		displayText {
			Id = os_outfit_name_ID_p1
			PARENT = select_outfit_container_p1
			Text = <UpperCaseString>
			Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
			Scale = 1
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = [160 80 30 255]
			Z = 2
		}
		GetScreenElementDims \{Id = os_outfit_name_ID_p1}
		if (<width> > 260)
			fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		GetUpperCaseString <curr_style>
		CreateScreenElement {
			Id = os_outfit_style_ID_p1
			Type = TextBlockElement
			PARENT = select_outfit_container_p1
			Text = <UpperCaseString>
			Pos = ($gs_element_offsets [3])
			Scale = (0.55, 0.55)
			Dims = (440.0, 300.0)
			font = text_a4
			just = [Center Center]
			rgba = [255 255 200 255]
			Z = 2
		}
		GetScreenElementDims \{Id = os_outfit_style_ID_p1}
		if (<width> > 256)
			fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3]) start_x_scale = 0.55 start_y_scale = 0.55
		endif
		get_character_name \{Player = 1}
		FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' N = <character_name>
		GetGlobalTags <outfit_2_checksum>
		if NOT (<unlocked>)
			select_outfit_choose \{Player = 1}
		endif
	else
		if (<Player> = 1)
			FormatText ChecksumName = player_status 'player%i_status' I = <Player>
			if find_profile_by_id Id = ($<player_status>.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
				if GetGlobalTags <default_characterguitartag> noassert = 1
					Change os_selected_outfit_p1 = (<current_outfit>)
					Change os_selected_outfit_old_p1 = (<current_outfit>)
					Change os_selected_style_p1 = (<current_style> - 1)
					Change os_selected_style_old_p1 = (<current_style> - 1)
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				Id = select_outfit_container_p1
				PARENT = root_window
				Pos = (460.0, 500.0)}
			displaySprite \{PARENT = select_outfit_container_p1
				tex = guitar_select_2p_frame
				just = [
					Center
					Center
				]
				Dims = (256.0, 432.0)
				Pos = (0.0, 40.0)
				Z = 0}
			displaySprite \{PARENT = select_outfit_container_p1
				tex = guitar_select_2p_wing
				just = [
					Center
					Center
				]
				Pos = (140.0, -24.0)
				Z = 0}
			displaySprite \{PARENT = select_outfit_container_p1
				tex = guitar_select_2p_wing
				just = [
					Center
					Center
				]
				Pos = (-140.0, -24.0)
				Z = 0
				flip_v}
			displayText \{Id = os_select_outfit_text_p1
				PARENT = select_outfit_container_p1
				Text = "SELECT OUTFIT"
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [
					Center
					Center
				]
				rgba = [
					175
					105
					40
					255
				]
				Z = 1}
			displaySprite \{Id = os_name_background_p1
				PARENT = select_outfit_container_p1
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				Dims = (266.0, 128.0)
				just = [
					Center
					Center
				]
				rgba = [
					250
					250
					200
					255
				]
				Z = 1}
			displaySprite \{Id = os_style_background_p1
				PARENT = select_outfit_container_p1
				tex = White
				Pos = (0.0, 88.0)
				Dims = (266.0, 32.0)
				just = [
					Center
					Center
				]
				rgba = [
					120
					0
					0
					255
				]
				Z = 1}
			get_character_outfits Player = <Player>
			<curr_outfit> = $os_selected_outfit_p1
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [($os_selected_style_p1)])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			displayText {
				Id = os_outfit_name_ID_p1
				PARENT = select_outfit_container_p1
				Text = <UpperCaseString>
				Pos = (0.0, 20.0)
				Scale = 1
				font = text_a4
				just = [Center Center]
				rgba = [80 0 10 255]
				Z = 2
				noshadow
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p1}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			displayText {
				Id = os_outfit_style_ID_p1
				PARENT = select_outfit_container_p1
				Text = <UpperCaseString>
				Pos = (0.0, 83.0)
				Scale = (0.75, 0.5)
				font = text_a4
				just = [Center Center]
				rgba = [250 250 200 255]
				Z = 2
				noshadow
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p1}
			if (<width> > 256)
				fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 83.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{Player = 1}
			FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' N = <character_name>
			GetGlobalTags <outfit_2_checksum>
			if NOT (<unlocked>)
				select_outfit_choose \{Player = 1}
			endif
		else
			if NOT ($is_network_game)
				FormatText ChecksumName = player_status 'player%i_status' I = <Player>
				if find_profile_by_id Id = ($<player_status>.character_id)
					get_musician_profile_struct Index = <Index>
					FormatText ChecksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
					if GetGlobalTags <default_characterguitartag> noassert = 1
						Change os_selected_outfit_p2 = (<current_outfit>)
						Change os_selected_outfit_old_p2 = (<current_outfit>)
						Change os_selected_style_p2 = (<current_style> - 1)
						Change os_selected_style_old_p2 = (<current_style> - 1)
					endif
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				Id = select_outfit_container_p2
				PARENT = root_window
				Pos = (810.0, 500.0)}
			displaySprite \{PARENT = select_outfit_container_p2
				tex = guitar_select_2p_frame
				just = [
					Center
					Center
				]
				Dims = (256.0, 432.0)
				Pos = (0.0, 40.0)
				Z = 0}
			displaySprite \{PARENT = select_outfit_container_p2
				tex = guitar_select_2p_wing
				just = [
					Center
					Center
				]
				Pos = (140.0, -24.0)
				Z = 0}
			displaySprite \{PARENT = select_outfit_container_p2
				tex = guitar_select_2p_wing
				just = [
					Center
					Center
				]
				Pos = (-140.0, -24.0)
				Z = 0
				flip_v}
			displayText \{Id = os_select_outfit_text_p2
				PARENT = select_outfit_container_p2
				Text = "SELECT OUTFIT"
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [
					Center
					Center
				]
				rgba = [
					140
					110
					150
					255
				]
				Z = 1}
			displaySprite \{Id = os_name_background_p2
				PARENT = select_outfit_container_p2
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				Dims = (266.0, 128.0)
				just = [
					Center
					Center
				]
				rgba = [
					240
					210
					250
					255
				]
				Z = 1}
			displaySprite \{Id = os_style_background_p2
				PARENT = select_outfit_container_p2
				tex = White
				Pos = (0.0, 88.0)
				Dims = (266.0, 32.0)
				just = [
					Center
					Center
				]
				rgba = [
					110
					0
					90
					255
				]
				Z = 1}
			get_character_outfits Player = <Player>
			<curr_outfit> = $os_selected_outfit_p2
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [($os_selected_style_p2)])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			displayText {
				Id = os_outfit_name_ID_p2
				PARENT = select_outfit_container_p2
				Text = <UpperCaseString>
				Pos = (0.0, 20.0)
				Scale = 1
				font = text_a4
				just = [Center Center]
				rgba = [80 0 10 255]
				Z = 2
				noshadow
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p2 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			displayText {
				Id = os_outfit_style_ID_p2
				PARENT = select_outfit_container_p2
				Text = <UpperCaseString>
				Pos = (0.0, 83.0)
				Scale = (0.75, 0.5)
				font = text_a4
				just = [Center Center]
				rgba = [250 250 200 255]
				Z = 2
				noshadow
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p2}
			if (<width> > 256)
				fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 83.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{Player = 2}
			FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' N = <character_name>
			GetGlobalTags <outfit_2_checksum>
			if NOT (<unlocked>)
				select_outfit_choose \{Player = 2}
			endif
		endif
	endif
endscript

script scale_outfit_select_menu 
	if GotParam \{make_big}
		SetScreenElementProps \{Id = os_mid_frame_ID
			Dims = (256.0, 300.0)}
		SetScreenElementProps \{Id = os_mid_fill_ID
			Dims = (256.0, 300.0)}
		SetScreenElementProps Id = os_bottom_cap_ID Pos = ($os_menu_start_pos_p1 + (0.0, 332.0)) flip_h
		SetScreenElementProps Id = os_bottom_fill_ID Pos = ($os_menu_start_pos_p1 + (0.0, 332.0)) flip_h
	elseif GotParam \{make_small}
		SetScreenElementProps \{Id = os_mid_frame_ID
			Dims = (256.0, 144.0)}
		SetScreenElementProps \{Id = os_mid_fill_ID
			Dims = (256.0, 144.0)}
		SetScreenElementProps Id = os_bottom_cap_ID Pos = ($os_menu_start_pos_p1 + (0.0, 144.0)) flip_h
		SetScreenElementProps Id = os_bottom_fill_ID Pos = ($os_menu_start_pos_p1 + (0.0, 144.0)) flip_h
	endif
endscript

script destroy_select_outfit_menu \{Player = 1}
	FormatText ChecksumName = scrolling_select_outfit 'scrolling_select_outfit_p%i' I = <Player>
	FormatText ChecksumName = select_outfit_container 'select_outfit_container_p%i' I = <Player>
	FormatText ChecksumName = scrolling_select_style 'scrolling_outfit_style_menu_p%i' I = <Player>
	FormatText ChecksumName = select_style_container 'select_style_container_p%i' I = <Player>
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
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	FormatText ChecksumName = this_outfit 'os_selected_outfit_p%i' I = <Player>
	FormatText ChecksumName = old_outfit 'os_selected_outfit_old_p%i' I = <Player>
	FormatText ChecksumName = old_style 'os_selected_style_old_p%i' I = <Player>
	if NOT ($<old_outfit> = ($<player_status>.outfit) && ($<old_style> + 1) = ($<player_status>.style))
		Change StructureName = <player_status> outfit = $<old_outfit>
		Change StructureName = <player_status> style = ($<old_style> + 1)
		FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	if (<Player> = 1)
		Change \{os_selected_outfit_p1 = $os_selected_outfit_old_p1}
	else
		Change \{os_selected_outfit_p2 = $os_selected_outfit_old_p2}
	endif
	if (($is_network_game = 0) || (<Player> = 1))
		if find_profile_by_id Id = ($<player_status>.character_id)
			get_musician_profile_struct Index = <Index>
			FormatText ChecksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
			SetGlobalTags <default_characterguitartag> Params = {current_outfit = ($<old_outfit>)}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back Player = <Player>
endscript

script os_scroll_up_or_down \{Player = 1
		Dir = DOWN}
	generic_menu_up_or_down_sound Params = {<Dir>}
	if (<Player> = 1)
		if ($os_made_first_selection_bool_p1 = 0)
			if ($os_selected_outfit_p1 = 1)
				get_character_name Player = <Player>
				FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' N = <character_name>
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
				Change \{StructureName = player1_status
					outfit = $os_selected_outfit_p1}
				Change \{StructureName = player1_status
					style = 1}
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player1_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				curr_style = (<styles> [0])
				GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
				SetScreenElementProps Id = os_outfit_name_ID_p1 Text = <UpperCaseString>
				GetUpperCaseString <curr_style>
				SetScreenElementProps Id = os_outfit_style_ID_p1 Text = <UpperCaseString>
				if ($current_num_players = 1)
					SetScreenElementProps \{Id = os_outfit_name_ID_p1
						Scale = 1}
					GetScreenElementDims \{Id = os_outfit_name_ID_p1}
					if (<width> > 260)
						fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
					endif
					GetScreenElementDims \{Id = os_outfit_style_ID_p1}
					if (<width> > 256)
						fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((220.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3]) start_x_scale = 0.55 start_y_scale = 0.55
					endif
				else
					SetScreenElementProps \{Id = os_outfit_name_ID_p1
						Scale = 1}
					GetScreenElementDims \{Id = os_outfit_name_ID_p1}
					if (<width> > 260)
						fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 20.0)
					endif
					GetScreenElementDims \{Id = os_outfit_style_ID_p1}
					if (<width> > 256)
						fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 83.0) start_x_scale = 0.75 start_y_scale = 0.5
					endif
				endif
			endif
		endif
	else
		if ($os_made_first_selection_bool_p2 = 0)
			if ($os_selected_outfit_p2 = 1)
				get_character_name Player = <Player>
				FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' N = <character_name>
				GetGlobalTags <outfit_2_checksum>
				if (<unlocked>)
					Change \{os_selected_outfit_p2 = 2}
				endif
			else
				Change \{os_selected_outfit_p2 = 1}
			endif
			if NOT ($os_selected_outfit_p2 = $player2_status.outfit)
				Change \{StructureName = player2_status
					outfit = $os_selected_outfit_p2}
				Change \{StructureName = player2_status
					style = 1}
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player2_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				curr_style = (<styles> [0])
				GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
				SetScreenElementProps Id = os_outfit_name_ID_p2 Text = <UpperCaseString>
				GetUpperCaseString <curr_style>
				SetScreenElementProps Id = os_outfit_style_ID_p2 Text = <UpperCaseString>
				GetScreenElementDims \{Id = os_outfit_name_ID_p2}
				SetScreenElementProps \{Id = os_outfit_name_ID_p2
					Scale = 1}
				if (<width> > 260)
					fit_text_in_rectangle Id = os_outfit_name_ID_p2 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 20.0)
				endif
				GetScreenElementDims \{Id = os_outfit_style_ID_p2}
				if (<width> > 256)
					fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 83.0) start_x_scale = 0.75 start_y_scale = 0.5
				endif
			endif
		endif
	endif
endscript

script select_outfit_choose \{Player = 1
		needs_net_message = 1}
	SoundEvent \{Event = ui_sfx_select}
	if (<Player> = 1)
		if ($os_made_first_selection_bool_p1 = 1)
			Change \{StructureName = player1_status
				outfit = $os_selected_outfit_p1}
			Change StructureName = player1_status style = ($os_selected_style_p1 + 1)
			if find_profile_by_id Id = ($player1_status.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
				SetGlobalTags <default_characterguitartag> Params = {current_outfit = ($os_selected_outfit_p1) current_style = ($os_selected_style_p1 + 1)}
			endif
			Change \{os_selected_outfit_old_p1 = $os_selected_outfit_p1}
			Change \{os_selected_style_old_p1 = $os_selected_style_p1}
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = style_select
					action = SELECT
					value1 = $os_selected_style_p1}
			endif
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		else
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = outfit_select
					action = SELECT
					Checksum = $os_selected_outfit_p1}
			endif
			select_outfit_create_style_menu Player = <Player>
			Change \{os_made_first_selection_bool_p1 = 1}
		endif
	else
		if ($os_made_first_selection_bool_p2 = 1)
			Change \{StructureName = player2_status
				outfit = $os_selected_outfit_p2}
			Change StructureName = player2_status style = ($os_selected_style_p2 + 1)
			if NOT ($is_network_game)
				if find_profile_by_id Id = ($player2_status.character_id)
					get_musician_profile_struct Index = <Index>
					FormatText ChecksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
					SetGlobalTags <default_characterguitartag> Params = {current_outfit = $os_selected_outfit_p2 current_style = ($os_selected_style_p2 + 1)}
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
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
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
		{pad_up generic_menu_up_or_down_sound Params = {UP}}
		{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		{pad_back <pad_back_script> Params = {Player = <Player>}}
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
				Menu_pos = (<p1_menu_pos> + (-178.0, -210.0))
				exclusive_device = <exclusive_dev>
				internal_just = [Center Top]
			}
		else
			new_menu {
				scrollid = scrolling_outfit_style_menu_p1
				vmenuid = vmenu_outfit_style_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				Menu_pos = (<p1_menu_pos> + <menu_offset>)
				internal_just = [Center Top]
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
			Menu_pos = <p2_menu_pos>
			exclusive_device = <exclusive_dev>
			internal_just = [Center Top]
		}
		if ($is_network_game = 1)
			vmenu_outfit_style_menu_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				Target = vmenu_outfit_style_menu_p2}
		endif
		vparent = vmenu_outfit_style_menu_p2
	endif
	if (<Player> = 1)
		LaunchEvent \{Type = unfocus
			Target = scrolling_select_outfit_p1}
	else
		LaunchEvent \{Type = unfocus
			Target = scrolling_select_outfit_p2}
	endif
	if ($current_num_players = 1)
		CreateScreenElement {
			Type = ContainerElement
			Id = select_style_container
			PARENT = root_window
			Pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [Center Top]
		}
		scale_outfit_select_menu \{make_big}
		<brown_window_color> = [120 60 10 255]
		SetScreenElementProps {
			Id = os_name_background
			texture = store_frame_bottom_bg
			Dims = (242.0, 128.0)
			rgba = <brown_window_color>
		}
		SetScreenElementProps \{Id = os_outfit_name_ID_p1
			rgba = [
				250
				250
				200
				255
			]
			Scale = 0.8}
		GetScreenElementDims \{Id = os_outfit_name_ID_p1}
		if (<width> > 240)
			fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((215.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0)) start_x_scale = 0.8 start_y_scale = 0.8
		endif
		displaySprite \{Id = os_bookend1_ID
			PARENT = select_style_container
			tex = character_hub_hilite_bookend
			Dims = (24.0, 24.0)
			just = [
				LEFT
				Top
			]
			rgba = [
				255
				255
				205
				255
			]
			Pos = (-64.0, 11.0)
			Z = 4}
		displaySprite \{Id = os_bookend2_ID
			PARENT = select_style_container
			tex = character_hub_hilite_bookend
			Dims = (24.0, 24.0)
			just = [
				RIGHT
				Top
			]
			rgba = [
				255
				255
				205
				255
			]
			Pos = (238.0, 11.0)
			Z = 4}
		displaySprite \{Id = os_whiteTexHighlight_ID
			PARENT = select_style_container
			tex = White
			just = [
				LEFT
				Top
			]
			rgba = [
				255
				255
				205
				255
			]
			Dims = (264.0, 32.0)
			Pos = (-47.0, 8.0)
			Z = 2}
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
		<I> = 0
		begin
		<add_style> = 1
		if NOT (<I> = 0)
			get_character_name Player = <Player>
			FormatText ChecksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' N = <character_name> O = <outfit> S = (<I> + 1)
			GetGlobalTags <outfit_style_cs>
			if (<unlocked> = 0)
				<add_style> = 0
			endif
		endif
		if (<add_style>)
			<num_in_list> = (<num_in_list> + 1)
			FormatText ChecksumName = os_style_menu_item_id 'os_style_menu_item_%n' N = <I>
			GetUpperCaseString (<styles> [<I>])
			CreateScreenElement {
				Id = <os_style_menu_item_id>
				Type = TextElement
				PARENT = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [Center Top]
				Text = <UpperCaseString>
				event_handlers = [
					{Focus retail_menu_focus}
					{Focus select_outfit_style_highlight Params = {Player = <Player>
							Index = <I>
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_outfit_style_choose Params = {Player = <Player>}}
				]
			}
			GetScreenElementDims Id = <Id>
			if (<width> > 180)
				SetScreenElementProps Id = <Id> Scale = 1
				fit_text_in_rectangle Id = <Id> Dims = ((180.0, 34.0))
			endif
		else
			CreateScreenElement {
				Type = TextElement
				PARENT = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [Center Top]
				Text = ""
				NOT_FOCUSABLE
			}
		endif
		<I> = (<I> + 1)
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
				Target = scrolling_select_outfit_p1}
			LaunchEvent Type = Focus Target = <vparent>
			SetScreenElementProps \{Id = os_select_outfit_text_p1
				Text = "SELECT STYLE"}
			SetScreenElementProps \{Id = os_name_background_p1
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{Id = os_style_background_p1
				Pos = (0.0, 0.0)}
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player1_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [(($player1_status.style) - 1)])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				Id = os_outfit_name_ID_p1
				Text = <UpperCaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, -6.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p1}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, -6.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p1
				Text = <UpperCaseString>
				Scale = 1
				Pos = (0.0, 48.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p1}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 48.0)
			endif
			GetArraySize <styles>
			<num_in_list> = 0
			<I> = 0
			begin
			<add_style> = 1
			if NOT (<I> = 0)
				get_character_name Player = <Player>
				FormatText ChecksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' N = <character_name> O = <curr_outfit> S = (<I> + 1)
				GetGlobalTags <outfit_style_cs>
				if (<unlocked> = 0)
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				GetUpperCaseString (<styles> [<I>])
				CreateScreenElement {
					Type = TextElement
					PARENT = <vparent>
					font = text_a4
					Scale = (0.7, 0.7)
					rgba = ($menu_unfocus_color)
					just = [Center Top]
					Text = <UpperCaseString>
					event_handlers = [
						{Focus retail_menu_focus}
						{Focus select_outfit_style_highlight Params = {Player = <Player>
								Index = <I>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose Params = {
								Player = <Player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					Hide
				}
				GetScreenElementDims Id = <Id>
				if (<width> > 180)
					fit_text_in_rectangle Id = <Id> Dims = (0.7 * ((160.0, 0.0) + (<Height> * (0.0, 1.0)))) Pos = (<p1_menu_pos> + <menu_offset>)
				endif
			endif
			<I> = (<I> + 1)
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
				Target = scrolling_select_outfit_p2}
			if ($is_network_game = 0)
				LaunchEvent Type = Focus Target = <vparent>
			endif
			SetScreenElementProps \{Id = os_select_outfit_text_p2
				Text = "SELECT STYLE"}
			SetScreenElementProps \{Id = os_name_background_p2
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{Id = os_style_background_p2
				Pos = (0.0, 0.0)}
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [(($player2_status.style) - 1)])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				Id = os_outfit_name_ID_p2
				Text = <UpperCaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, -6.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, -6.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p2
				Text = <UpperCaseString>
				Scale = 1
				Pos = (0.0, 48.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 48.0)
			endif
			GetArraySize <styles>
			<num_in_list> = 0
			<I> = 0
			begin
			<add_style> = 1
			if NOT (<I> = 0)
				get_character_name Player = <Player>
				FormatText ChecksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' N = <character_name> O = <curr_outfit> S = (<I> + 1)
				GetGlobalTags <outfit_style_cs>
				if (<unlocked> = 0)
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				GetUpperCaseString (<styles> [<I>])
				CreateScreenElement {
					Type = TextElement
					PARENT = <vparent>
					font = text_a4
					Scale = (0.7, 0.7)
					rgba = ($menu_unfocus_color)
					just = [Center Top]
					Text = <UpperCaseString>
					event_handlers = [
						{Focus retail_menu_focus}
						{Focus select_outfit_style_highlight Params = {Player = <Player>
								Index = <I>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose Params = {
								Player = <Player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					Hide
				}
				GetScreenElementDims Id = <Id>
				if (<width> > 180)
					fit_text_in_rectangle Id = <Id> Dims = (0.7 * ((160.0, 0.0) + (<Height> * (0.0, 1.0)))) Pos = (<p2_menu_pos> + <menu_offset>)
				endif
			endif
			<I> = (<I> + 1)
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
	SoundEvent \{Event = Generic_Menu_Back_SFX}
	if ($current_num_players = 1)
		LaunchEvent \{Type = Focus
			Target = scrolling_select_outfit_p1}
		LaunchEvent \{Type = unfocus
			Target = scrolling_outfit_style_menu_p1}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
		Change \{os_made_first_selection_bool_p1 = 0}
		destroy_menu \{menu_id = select_style_container}
		FormatText ChecksumName = old_outfit 'os_selected_outfit_old_p%i' I = <Player>
		FormatText ChecksumName = old_style 'os_selected_style_old_p%i' I = <Player>
		if NOT ($<old_outfit> = ($player1_status.outfit) && ($<old_style> + 1) = ($player1_status.style))
			Change StructureName = player1_status outfit = $<old_outfit>
			Change StructureName = player1_status style = ($<old_style> + 1)
			FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
			Change GlobalName = <change_flag> NewValue = 1
		endif
		Change os_selected_outfit_p1 = $<old_outfit>
		scale_outfit_select_menu \{make_small}
		SetScreenElementProps \{Id = os_name_background
			texture = Char_Select_Frame_BG
			Dims = (266.0, 128.0)
			rgba = [
				250
				250
				200
				255
			]}
		SetScreenElementProps \{Id = os_outfit_name_ID_p1
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
		SetScreenElementProps Id = os_outfit_name_ID_p1 Text = <UpperCaseString>
		GetUpperCaseString <curr_style>
		SetScreenElementProps Id = os_outfit_style_ID_p1 Text = <UpperCaseString>
		SetScreenElementProps \{Id = os_outfit_name_ID_p1
			Scale = 1}
		GetScreenElementDims \{Id = os_outfit_name_ID_p1}
		if (<width> > 260)
			fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		get_character_name \{Player = 1}
		FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' N = <character_name>
		GetGlobalTags <outfit_2_checksum>
		if NOT (<unlocked>)
			select_outfit_go_back \{Player = 1}
		endif
	else
		if (<Player> = 1)
			SetScreenElementProps \{Id = os_select_outfit_text_p1
				Text = "SELECT OUTFIT"}
			LaunchEvent \{Type = Focus
				Target = scrolling_select_outfit_p1}
			LaunchEvent \{Type = unfocus
				Target = scrolling_outfit_style_menu_p1}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
			Change \{os_made_first_selection_bool_p1 = 0}
			FormatText ChecksumName = old_outfit 'os_selected_outfit_old_p%i' I = <Player>
			FormatText ChecksumName = old_style 'os_selected_style_old_p%i' I = <Player>
			if NOT ($<old_outfit> = ($player1_status.outfit) && ($<old_style> + 1) = ($player1_status.style))
				Change StructureName = player1_status outfit = $<old_outfit>
				Change StructureName = player1_status style = ($<old_style> + 1)
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			Change os_selected_outfit_p1 = $<old_outfit>
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player1_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [(($player1_status.style) - 1)])
			SetScreenElementProps \{Id = os_name_background_p1
				Pos = (0.0, 30.0)}
			SetScreenElementProps \{Id = os_style_background_p1
				Pos = (0.0, 88.0)}
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				Id = os_outfit_name_ID_p1
				Text = <UpperCaseString>
				Scale = 1
				Pos = (0.0, 20.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p1}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p1
				Text = <UpperCaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, 83.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p1}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 83.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{Player = 1}
			FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' N = <character_name>
			GetGlobalTags <outfit_2_checksum>
			if NOT (<unlocked>)
				select_outfit_go_back \{Player = 1}
			endif
		else
			SetScreenElementProps \{Id = os_select_outfit_text_p2
				Text = "SELECT OUTFIT"}
			LaunchEvent \{Type = Focus
				Target = scrolling_select_outfit_p2}
			LaunchEvent \{Type = unfocus
				Target = scrolling_outfit_style_menu_p2}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p2}
			Change \{os_made_first_selection_bool_p2 = 0}
			FormatText ChecksumName = old_outfit 'os_selected_outfit_old_p%i' I = <Player>
			FormatText ChecksumName = old_style 'os_selected_style_old_p%i' I = <Player>
			if NOT ($<old_outfit> = ($player2_status.outfit) && ($<old_style> + 1) = ($player2_status.style))
				Change StructureName = player2_status outfit = $<old_outfit>
				Change StructureName = player2_status style = ($<old_style> + 1)
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			Change os_selected_outfit_p2 = $<old_outfit>
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			curr_style = (<styles> [(($player2_status.style) - 1)])
			SetScreenElementProps \{Id = os_name_background_p2
				Pos = (0.0, 30.0)}
			SetScreenElementProps \{Id = os_style_background_p2
				Pos = (0.0, 88.0)}
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				Id = os_outfit_name_ID_p2
				Text = <UpperCaseString>
				Scale = 1
				Pos = (0.0, 20.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p2
				Text = <UpperCaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, 83.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 83.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{Player = 2}
			FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style1' N = <character_name>
			GetGlobalTags <outfit_2_checksum>
			if NOT (<unlocked>)
				select_outfit_go_back \{Player = 2}
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
		Index = 0
		needs_net_message = 1}
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	FormatText ChecksumName = selected_outfit 'os_selected_outfit_p%i' I = <Player>
	if NOT ($<selected_outfit> = ($<player_status>.outfit) && (<Index> + 1) = ($<player_status>.style))
		Change StructureName = <player_status> style = (<Index> + 1)
		FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	if (<Player> = 1)
		Change os_selected_style_p1 = <Index>
	else
		Change os_selected_style_p2 = <Index>
	endif
	get_character_outfits Player = <Player>
	if (<Player> = 1)
		<curr_outfit> = ($player1_status.outfit)
	else
		<curr_outfit> = ($player2_status.outfit)
	endif
	styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
	curr_style = (<styles> [(<Index>)])
	if ($current_num_players = 1)
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		SetScreenElementProps Id = os_outfit_name_ID_p1 Text = <UpperCaseString>
		GetUpperCaseString <curr_style>
		SetScreenElementProps Id = os_outfit_style_ID_p1 Text = <UpperCaseString>
		<Offset> = (<Index> * (0.0, 33.5))
		<l_pos> = ((-64.0, 11.0) + <Offset>)
		<r_pos> = ((238.0, 11.0) + <Offset>)
		<hl_pos> = ((-47.0, 8.0) + <Offset>)
		SetScreenElementProps Id = os_bookend1_ID Pos = <l_pos>
		SetScreenElementProps Id = os_bookend2_ID Pos = <r_pos>
		SetScreenElementProps Id = os_whiteTexHighlight_ID Pos = <hl_pos>
	else
		if (<Player> = 1)
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p1
				Text = <UpperCaseString>
			}
			SetScreenElementProps \{Id = os_outfit_style_ID_p1
				Scale = 1}
			GetScreenElementDims \{Id = os_outfit_style_ID_p1}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 48.0)
			endif
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = style_select
					action = update
					value1 = $os_selected_style_p1}
			endif
		else
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p2
				Text = <UpperCaseString>
			}
			SetScreenElementProps \{Id = os_outfit_style_ID_p2
				Scale = 1}
			GetScreenElementDims \{Id = os_outfit_style_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 48.0)
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
