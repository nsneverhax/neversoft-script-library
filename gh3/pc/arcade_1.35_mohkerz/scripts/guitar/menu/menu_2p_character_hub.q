g_hub_created_p = [
	0
	0
]

script create_2p_character_hub_menu 
	printf \{"create_2p_character_hub_menu: begin"}
	if ($g_hub_characters_dirty)
		printf \{"create_character_hub_menu: hub is dirty"}
		do_character_hub_dirty
	endif
	GetArraySize \{$g_hub_created_p}
	i = 0
	begin
	printf "before g_hub_created_p[%d] = %e" d = <i> e = ($g_hub_created_p [<i>])
	<i> = (<i> + 1)
	repeat <array_Size>
	Change \{menu_flow_locked = 1}
	cur_player_num = 1
	begin
	if (($g_hub_created_p [(<cur_player_num> - 1)]) = 0)
		if (<cur_player_num> = 1)
			Change \{p1_ready = 0}
		else
			Change \{p2_ready = 0}
		endif
		if (<cur_player_num> = 1)
			if ($num_user_control_helpers = 0)
				add_user_control_helper \{text = "SELECT"
					button = green
					z = 100}
				add_user_control_helper \{text = "UP/DOWN"
					button = strumbar
					z = 100}
				Change \{g_hub_helpers_created = 1}
			endif
		endif
		exclusive_dev = $player1_device
		if (<cur_player_num> = 2)
			<exclusive_dev> = $player2_device
		endif
		event_handlers = [
			{pad_up character_hub_generic_sound params = {Player = <cur_player_num> up}}
			{pad_down character_hub_generic_sound params = {Player = <cur_player_num> down}}
		]
		menu_pos_tweak = (0.0, 0.0)
		if (<cur_player_num> = 1)
			<menu_pos> = (360.0, 444.0)
			if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
				<menu_pos> = (<menu_pos> + (0.0, -46.0))
			endif
			new_menu scrollid = scrolling_character_hub_p1 vmenuid = vmenu_character_hub_p1 use_backdrop = 0 menu_pos = (<menu_pos> + <menu_pos_tweak>) exclusive_device = <exclusive_dev> event_handlers = <event_handlers> no_focus = 1
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
		setup_character_hub Player = <cur_player_num>
		show_change_outfit = 1
		if (<cur_player_num> = 1)
			find_profile_by_id id = ($player1_status.character_id)
		else
			find_profile_by_id id = ($player2_status.character_id)
		endif
		get_musician_profile_struct index = <index>
		if NOT StructureContains structure = (<profile_struct>) outfits
			<show_change_outfit> = 0
		endif
		if (<cur_player_num> = 1)
			myParent = character_hub_p1_container
		else
			myParent = character_hub_p2_container
		endif
		<ch_focus_color> = [125 0 0 255]
		<ch_unfocus_color> = [180 100 60 255]
		displaySprite {
			parent = <myParent>
			tex = character_hub_hilite_bookend
			dims = (24.0, 24.0)
			just = [left top]
			rgba = [255 255 205 255]
			z = 4
		}
		<bookEnd1ID> = <id>
		displaySprite {
			parent = <myParent>
			tex = character_hub_hilite_bookend
			dims = (24.0, 24.0)
			just = [right top]
			rgba = [255 255 205 255]
			z = 4
		}
		<bookEnd2ID> = <id>
		displaySprite {
			parent = <myParent>
			tex = white
			just = [left top]
			rgba = [255 255 205 255]
			dims = (264.0, 32.0)
			Pos = (226.0, 136.0)
			z = 2
		}
		<whiteTexHighlightID> = <id>
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		if (<cur_player_num> = 1)
			<hub_menu_starting_pos> = (460.0, 432.0)
		else
			<hub_menu_starting_pos> = (810.0, 432.0)
		endif
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			<hub_menu_starting_pos> = (<hub_menu_starting_pos> + (0.0, -46.0))
		endif
		printf "hub_menu_starting_pos for player %d = %e" d = <cur_player_num> e = <hub_menu_starting_pos>
		displaySprite {
			parent = <myParent>
			tex = window_frame_cap
			Pos = <hub_menu_starting_pos>
			dims = (256.0, 40.0)
			just = [center center]
			rgba = <brown_window_color>
			z = 0
		}
		displaySprite {
			parent = <myParent>
			tex = window_fill_cap
			Pos = <hub_menu_starting_pos>
			dims = (256.0, 40.0)
			just = [center center]
			rgba = <window_fill_color>
			z = 0
		}
		displaySprite {
			parent = <myParent>
			tex = window_header_01
			Pos = (<hub_menu_starting_pos> + (0.0, -40.0))
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
		displaySprite {
			parent = <myParent>
			tex = window_frame_body_short
			Pos = (<hub_menu_starting_pos> + (0.0, 20.0))
			dims = <mid_section_dims>
			just = [center top]
			rgba = <brown_window_color>
			z = 0
		}
		displaySprite {
			parent = <myParent>
			tex = window_fill_body_short
			Pos = (<hub_menu_starting_pos> + (0.0, 20.0))
			dims = <mid_section_dims>
			just = [center top]
			rgba = <window_fill_color>
			z = 0
		}
		displaySprite {
			parent = <myParent>
			tex = window_frame_cap
			Pos = <bottom_cap_pos>
			dims = (256.0, 40.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
			flip_h
		}
		displaySprite {
			parent = <myParent>
			tex = window_fill_cap
			Pos = <bottom_cap_pos>
			dims = (256.0, 40.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
			flip_h
		}
		<ch_menuItemSelected> = 0
		<ch_show_change_outfit> = 0
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			id = <continue_id>
			font = fontgrid_title_gh3
			Scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			text = "PLAY SHOW"
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						chh_mp = 1
						chh_player = <cur_player_num>
					}
				}
				{focus SetScreenElementProps params = {id = <continue_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps params = {id = <continue_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_2p_select_play_show params = {Player = <cur_player_num>}}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		if (<show_change_outfit>)
			<ch_show_change_outfit> = 1
			CreateScreenElement {
				Type = TextElement
				parent = <vparent>
				id = <ch_change_outfit_id>
				font = fontgrid_title_gh3
				Scale = (0.8, 0.75)
				rgba = [180 100 60 255]
				text = "CHANGE OUTFIT"
				just = [center top]
				event_handlers = [
					{focus character_hub_highlighter params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <ch_show_change_outfit>
							chh_mp = 1
							chh_player = <cur_player_num>
						}
					}
					{focus SetScreenElementProps params = {id = <ch_change_outfit_id> rgba = <ch_focus_color>}}
					{unfocus SetScreenElementProps params = {id = <ch_change_outfit_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_outfit params = {Player = <cur_player_num>}}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		endif
		CreateScreenElement {
			Type = TextElement
			parent = <vparent>
			id = <ch_change_guitar_id>
			font = fontgrid_title_gh3
			Scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			text = "CHANGE GUITAR"
			just = [center top]
			event_handlers = [
				{focus character_hub_highlighter params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <ch_show_change_outfit>
						chh_mp = 1
						chh_player = <cur_player_num>
					}
				}
				{focus SetScreenElementProps params = {id = <ch_change_guitar_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps params = {id = <ch_change_guitar_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_select_change_guitar params = {Player = <cur_player_num> vparent = <vparent>}}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			CreateScreenElement {
				Type = TextElement
				parent = <vparent>
				id = <ch_change_bass_id>
				font = fontgrid_title_gh3
				Scale = (0.8, 0.75)
				rgba = [180 100 60 255]
				text = "CHANGE BASS"
				just = [center top]
				event_handlers = [
					{focus character_hub_highlighter params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <ch_show_change_outfit>
							chh_mp = 1
							chh_player = <cur_player_num>
						}
					}
					{focus SetScreenElementProps params = {id = <ch_change_bass_id> rgba = <ch_focus_color>}}
					{unfocus SetScreenElementProps params = {id = <ch_change_bass_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_guitar params = {Player = <cur_player_num> bass vparent = <vparent>}}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 0.75)))
		endif
		Change \{g_hub_destroy = 0}
		if ($using_guitar_select_camera = 1)
			SetScreenElementProps id = <bookEnd1ID> Hide
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
			printf \{"create_character_hub_menu: waiting for guitar select exit camera"}
			wait_for_guitar_select_exit_camera
			printf \{"create_character_hub_menu: done waiting for guitar select exit camera"}
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
			SetScreenElementProps id = <bookEnd1ID> unhide
			SetScreenElementProps id = <bookEnd2ID> unhide
			SetScreenElementProps id = <whiteTexHighlightID> unhide
		endif
		LaunchEvent Type = focus target = <vparent>
		SetArrayElement ArrayName = g_hub_created_p globalarray index = (<cur_player_num> - 1) NewValue = 1
	endif
	<cur_player_num> = (<cur_player_num> + 1)
	repeat ($current_num_players)
	Change \{menu_flow_locked = 0}
	printf \{"create_character_hub_menu: almost done"}
	GetArraySize \{$g_hub_created_p}
	i = 0
	begin
	printf "after g_hub_created_p[%d] = %e" d = <i> e = ($g_hub_created_p [<i>])
	<i> = (<i> + 1)
	repeat <array_Size>
	if ($g_hub_timer_running = 0)
		printf \{"create_character_hub_menu: spawning watch timer"}
		SpawnScriptNow \{ch_2p_watch_timer}
	endif
	printf \{"create_character_hub_menu: complete"}
	Change \{g_hub_out_of_hub = 0}
endscript

script destroy_2p_character_hub_menu \{Player = 1}
	printf "destroy_2p_character_hub_menu: game_mode=%s for player %d" s = $game_mode d = <Player>
	if (<Player> = 1)
		destroy_menu \{menu_id = scrolling_character_hub_p1}
		destroy_menu \{menu_id = character_hub_p1_container}
	else
		destroy_menu \{menu_id = scrolling_character_hub_p2}
		destroy_menu \{menu_id = character_hub_p2_container}
		Change <g_hub_created_p> [<Player>] = 0
	endif
	SetArrayElement ArrayName = g_hub_created_p globalarray index = (<Player> - 1) NewValue = 0
	KillCamAnim \{Name = gs_view_cam}
	KillSpawnedScript \{Name = ch_2p_watch_timer}
endscript

script ch_2p_watch_timer 
	printf \{"ch_2p_watch_timer: spawn"}
	SpawnScriptNow \{set_countdown_timer}
	Change \{g_hub_timer_running = 1}
	begin
	if ($g_hub_out_of_hub = 0)
		check_countdown_timer
		if (<timer_has_expired> = 1)
			printf \{"ch_watch_timer: hub timer has expired"}
			break
		endif
	endif
	Wait \{1
		Second}
	repeat
	Change \{g_hub_timer_running = 0}
	SpawnScriptNow \{character_hub_2p_select_play_show
		params = {
			Player = 1
		}}
	if (($current_num_players) = 2)
		SpawnScriptNow \{character_hub_2p_select_play_show
			params = {
				Player = 2
			}}
	endif
endscript

script character_hub_2p_select_play_show \{Player = 1}
	Change \{g_hub_timer_running = 0}
	if (($current_num_players) = 2)
		if ((<Player> = 1) && ($p1_ready = 0))
			SetScreenElementProps \{id = vmenu_character_hub_p1
				disable_pad_handling}
			Change \{p1_ready = 1}
			if ($is_network_game = 1)
				if ScreenElementExists \{id = ready_container_p2}
					RunScriptOnScreenElement \{id = ready_container_p2
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
		if ($is_network_game = 1)
			KillSpawnedScript \{Name = net_hub_stream}
			if ScreenElementExists \{id = vmenu_character_hub_p1}
				LaunchEvent \{Type = unfocus
					target = vmenu_character_hub_p1}
			endif
			Wait \{0.4
				Seconds}
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
