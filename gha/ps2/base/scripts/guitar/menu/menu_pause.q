
script create_pause_menu \{Player = 1
		for_options = 0
		for_practice = 0}
	if GotParam \{device_num}
		player_device = <device_num>
	else
		player_device = ($last_start_pressed_device)
	endif
	exclusive_device = <player_device>
	dont_show_options = 0
	if ($player1_device = <player_device>)
		<Player> = 1
	elseif ($player2_device = <player_device>)
		<Player> = 2
	else
		if NOT isSinglePlayerGame
			if (<player_device> = -1)
				<dont_show_options> = 1
				exclusive_mp_controllers = [0 , 0]
				SetArrayElement ArrayName = exclusive_mp_controllers index = 0 NewValue = ($player1_device)
				SetArrayElement ArrayName = exclusive_mp_controllers index = 1 NewValue = ($player2_device)
				<exclusive_device> = <exclusive_mp_controllers>
			endif
		else
			<dont_show_options> = 1
			<exclusive_device> = ($player1_device)
		endif
	endif
	Change \{user_control_pill_text_color = [
			255
			255
			255
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	if (<for_options> = 0)
		if ($view_mode)
			return
		endif
		enable_pause
		safe_create_gh3_pause_menu
	else
		kill_start_key_binding
		flame_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	endif
	Change \{bunny_flame_index = 1}
	pause_z = 10000
	spacing = -55
	if (<for_options> = 0)
		menu_pos = (740.0, 190.0)
		if (<for_practice> = 1)
			<menu_pos> = (640.0, 165.0)
			<spacing> = -55
		endif
	else
		<spacing> = -55
		if IsGuitarController controller = <player_device>
			menu_pos = (640.0, 265.0)
		else
			menu_pos = (640.0, 300.0)
		endif
	endif
	new_menu {
		scrollid = scrolling_pause
		vmenuid = vmenu_pause
		menu_pos = <menu_pos>
		rot_angle = 2
		event_handlers = <flame_handlers>
		spacing = <spacing>
		use_backdrop = (0)
		exclusive_device = <exclusive_device>
		focus_color = light_brown
		unfocus_color = brown
	}
	create_pause_menu_frame z = (<pause_z> - 10)
	if ($is_network_game = 0)
		if NOT ($current_num_players > 1)
			CreateScreenElement {
				Type = SpriteElement
				parent = pause_menu_frame_container
				texture = menu_pause_frame_banner
				Pos = (640.0, 570.0)
				just = [center center]
				rgba = (($g_menu_colors).lt_violet_grey)
				z_priority = (<pause_z> + 100)
			}
		endif
		if GotParam \{banner_text}
			pause_player_text = <banner_text>
			if GotParam \{banner_scale}
				pause_player_scale = <banner_scale>
			else
				pause_player_scale = (1.0, 1.0)
			endif
		else
			if (<for_options> = 0)
				if (<for_practice> = 1)
					<pause_player_text> = 'PAUSED'
				else
					if ((isSinglePlayerGame))
						<pause_player_text> = 'PAUSED'
					elseif (<dont_show_options> = 1)
						<pause_player_text> = 'PAUSED'
					else
						formatText TextName = pause_player_text 'P%d PAUSED' d = <Player>
					endif
				endif
				pause_player_scale = (0.6, 0.75)
			else
				pause_player_text = 'OPTIONS'
				pause_player_scale = (0.75, 0.75)
			endif
		endif
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <id>
		text = <pause_player_text>
		font = text_a6
		Pos = (125.0, 53.0)
		Scale = <pause_player_scale>
		rgba = (($g_menu_colors).black)
		Scale = 0.8
	}
	text_scale = (1.0, 1.1)
	if (<for_options> = 0 && <for_practice> = 0)
		CreateScreenElement {
			Type = ContainerElement
			parent = pause_menu_frame_container
			id = bunny_container
			Pos = (380.0, 170.0)
			just = [left top]
			z_priority = <pause_z>
		}
		i = 1
		begin
		formatText checksumName = bunny_id 'pause_bunny_flame_%d' d = <i>
		formatText checksumName = bunny_tex 'GH3_Pause_Bunny_Flame%d' d = <i>
		CreateScreenElement {
			Type = SpriteElement
			id = <bunny_id>
			parent = bunny_container
			Pos = (160.0, 170.0)
			texture = <bunny_tex>
			rgba = [255 255 255 255]
			dims = (300.0, 300.0)
			just = [right bottom]
			z_priority = (<pause_z> + 3)
			rot_angle = 5
		}
		if (<i> > 1)
			DoScreenElementMorph id = <bunny_id> alpha = 0
		endif
		<i> = (<i> + 1)
		repeat 7
		CreateScreenElement {
			Type = SpriteElement
			id = pause_bunny_shadow
			parent = bunny_container
			texture = GH3_Pause_Bunny
			rgba = [0 0 0 128]
			Pos = (20.0, -110.0)
			dims = (500.0, 500.0)
			just = [center top]
			z_priority = (<pause_z> + 4)
		}
		CreateScreenElement {
			Type = SpriteElement
			id = pause_bunny
			parent = bunny_container
			texture = GH3_Pause_Bunny
			rgba = [255 255 255 255]
			Pos = (0.0, -130.0)
			dims = (500.0, 500.0)
			just = [center top]
			z_priority = (<pause_z> + 5)
		}
		RunScriptOnScreenElement \{id = bunny_container
			bunny_hover
			params = {
				hover_origin = (380.0, 170.0)
			}}
	endif
	container_params = {Type = ContainerElement parent = vmenu_pause dims = (0.0, 100.0)}
	if (<for_options> = 0)
		if (<for_practice> = 1)
			if English
				text_scale = (0.95, 0.95)
				vmenu_pause :SetProps \{Pos = (0.0, 300.0)
					spacing_between = -60}
			else
				text_scale = (0.71999997, 0.71999997)
				vmenu_pause :SetProps \{spacing_between = -70}
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_resume}}
					{unfocus retail_menu_unfocus params = {id = pause_resume}}
					{pad_choose gh3_start_pressed}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_resume
				text = 'RESUME'
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, -20.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_restart}}
					{unfocus retail_menu_unfocus params = {id = pause_restart}}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_restart}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = 'RESTART'
				id = pause_restart
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, -20.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if (<dont_show_options> = 0)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_options}}
						{unfocus retail_menu_unfocus params = {id = pause_options}}
						{pad_choose ui_flow_manager_respond_to_action params = {action = select_options create_params = {player_device = <player_device>}}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					parent = <id>
					font = fontgrid_title_gh3
					Scale = <text_scale>
					rgba = ($menu_unfocus_color)
					text = 'OPTIONS'
					id = pause_options
					just = [center top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <exclusive_device>
				}
				GetScreenElementDims id = <id>
				fit_text_in_rectangle id = <id> dims = ((300.0, -20.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_change_speed}}
					{unfocus retail_menu_unfocus params = {id = pause_change_speed}}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_change_speed}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = 'CHANGE SPEED'
				id = pause_change_speed
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, -20.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_change_section}}
					{unfocus retail_menu_unfocus params = {id = pause_change_section}}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_change_section}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = 'CHANGE SECTION'
				id = pause_change_section
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, -20.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($came_to_practice_from = main_menu)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_new_song}}
						{unfocus retail_menu_unfocus params = {id = pause_new_song}}
						{pad_choose ui_flow_manager_respond_to_action params = {action = select_new_song}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					parent = <id>
					font = fontgrid_title_gh3
					Scale = <text_scale>
					rgba = ($menu_unfocus_color)
					text = 'NEW SONG'
					id = pause_new_song
					just = [center top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <exclusive_device>
				}
				GetScreenElementDims id = <id>
				fit_text_in_rectangle id = <id> dims = ((300.0, -20.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_quit}}
					{unfocus retail_menu_unfocus params = {id = pause_quit}}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_quit}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = 'QUIT'
				id = pause_quit
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, -20.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			add_user_control_helper \{text = 'SELECT'
				button = green
				z = 100000}
			add_user_control_helper \{text = 'UP/DOWN'
				button = strumbar
				z = 100000}
		else
			if English
			else
				container_params = {Type = ContainerElement parent = vmenu_pause dims = (0.0, 105.0)}
				text_scale = (0.8, 0.8)
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_resume}}
					{unfocus retail_menu_unfocus params = {id = pause_resume}}
					{pad_choose gh3_start_pressed}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = 'RESUME'
				id = pause_resume
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($is_network_game = 0)
				if NOT ($end_credits = 1)
					CreateScreenElement {
						<container_params>
						event_handlers = [
							{focus retail_menu_focus params = {id = pause_restart}}
							{unfocus retail_menu_unfocus params = {id = pause_restart}}
							{pad_choose ui_flow_manager_respond_to_action params = {action = select_restart}}
						]
					}
					CreateScreenElement {
						Type = TextElement
						parent = <id>
						font = fontgrid_title_gh3
						Scale = <text_scale>
						rgba = ($menu_unfocus_color)
						text = 'RESTART'
						id = pause_restart
						just = [center top]
						Shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <exclusive_device>
					}
					GetScreenElementDims id = <id>
					fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					if ($is_demo_mode = 1)
						demo_mode_disable = {rgba = [80 80 80 255] not_focusable}
					else
						demo_mode_disable = {}
					endif
					if (($game_mode = p1_career && $boss_battle = 0) || ($game_mode = p1_quickplay))
						CreateScreenElement {
							<container_params>
							event_handlers = [
								{focus retail_menu_focus params = {id = pause_practice}}
								{unfocus retail_menu_unfocus params = {id = pause_practice}}
								{pad_choose ui_flow_manager_respond_to_action params = {action = select_practice}}
							]
						}
						CreateScreenElement {
							Type = TextElement
							parent = <id>
							font = fontgrid_title_gh3
							Scale = <text_scale>
							rgba = ($menu_unfocus_color)
							text = 'PRACTICE'
							id = pause_practice
							just = [center top]
							Shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							z_priority = <pause_z>
							exclusive_device = <exclusive_device>
							<demo_mode_disable>
						}
						GetScreenElementDims id = <id>
						fit_text_in_rectangle id = <id> dims = ((260.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					endif
					if (<dont_show_options> = 0)
						CreateScreenElement {
							<container_params>
							event_handlers = [
								{focus retail_menu_focus params = {id = pause_options}}
								{unfocus retail_menu_unfocus params = {id = pause_options}}
								{pad_choose ui_flow_manager_respond_to_action params = {action = select_options create_params = {player_device = <player_device>}}}
							]
						}
						CreateScreenElement {
							Type = TextElement
							parent = <id>
							font = fontgrid_title_gh3
							Scale = <text_scale>
							rgba = ($menu_unfocus_color)
							text = 'OPTIONS'
							id = pause_options
							just = [center top]
							Shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							z_priority = <pause_z>
							exclusive_device = <exclusive_device>
						}
						GetScreenElementDims id = <id>
						fit_text_in_rectangle id = <id> dims = ((260.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					endif
					quit_script = ui_flow_manager_respond_to_action
					quit_script_params = {action = select_quit create_params = {Player = <Player>}}
					if ($is_network_game)
						quit_script = create_leaving_lobby_dialog
						quit_script_params = {
							create_pause_menu
							pad_back_script = return_to_pause_menu_from_net_warning
							pad_choose_script = pause_menu_really_quit_net_game
							z = 300
						}
					endif
					CreateScreenElement {
						<container_params>
						event_handlers = [
							{focus retail_menu_focus params = {id = pause_quit}}
							{unfocus retail_menu_unfocus params = {id = pause_quit}}
							{pad_choose <quit_script> params = <quit_script_params>}
						]
					}
					CreateScreenElement {
						Type = TextElement
						parent = <id>
						font = fontgrid_title_gh3
						Scale = <text_scale>
						rgba = ($menu_unfocus_color)
						text = 'QUIT'
						id = pause_quit
						just = [center top]
						Shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <exclusive_device>
					}
					GetScreenElementDims id = <id>
					fit_text_in_rectangle id = <id> dims = ((270.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
				endif
			endif
			if ($enable_button_cheats = 1)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_debug_menu}}
						{unfocus retail_menu_unfocus params = {id = pause_debug_menu}}
						{pad_choose ui_flow_manager_respond_to_action params = {action = select_debug_menu}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					parent = <id>
					font = fontgrid_title_gh3
					Scale = <text_scale>
					rgba = [136 95 50 100]
					text = 'DEBUG'
					id = pause_debug_menu
					just = [center top]
					z_priority = <pause_z>
					exclusive_device = <exclusive_device>
				}
			endif
			add_user_control_helper \{text = 'SELECT'
				button = green
				z = 100000}
			add_user_control_helper \{text = 'UP/DOWN'
				button = strumbar
				z = 100000}
		endif
	else
		<fit_dims> = (400.0, 0.0)
		CreateScreenElement {
			Type = ContainerElement
			parent = vmenu_pause
			dims = (0.0, 100.0)
			Pos = (0.0, 20.0)
			event_handlers = [
				{focus retail_menu_focus params = {id = options_audio}}
				{unfocus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus params = {id = options_audio}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_audio_settings create_params = {Player = <Player>}}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			parent = <id>
			font = fontgrid_title_gh3
			Scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = 'SET AUDIO'
			id = options_audio
			just = [center center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <exclusive_device>
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		CreateScreenElement {
			Type = ContainerElement
			parent = vmenu_pause
			dims = (0.0, 100.0)
			event_handlers = [
				{focus retail_menu_focus params = {id = options_calibrate_lag}}
				{unfocus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus params = {id = options_calibrate_lag}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_calibrate_lag create_params = {Player = <Player>}}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			parent = <id>
			font = fontgrid_title_gh3
			Scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = 'CALIBRATE LAG'
			id = options_calibrate_lag
			just = [center center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <exclusive_device>
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		if IsGuitarController controller = <player_device>
			CreateScreenElement {
				Type = ContainerElement
				parent = vmenu_pause
				dims = (0.0, 100.0)
				event_handlers = [
					{focus retail_menu_focus params = {id = options_calibrate_whammy}}
					{unfocus generic_menu_up_or_down_sound}
					{unfocus retail_menu_unfocus params = {id = options_calibrate_whammy}}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_calibrate_whammy_bar create_params = {Player = <Player> popup = 1}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = 'CALIBRATE WHAMMY'
				id = options_calibrate_whammy
				just = [center center]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		endif
		if isSinglePlayerGame
			lefty_flip_text = 'LEFTY FLIP:'
		else
			if (<Player> = 1)
				lefty_flip_text = 'P1 LEFTY FLIP:'
			else
				lefty_flip_text = 'P2 LEFTY FLIP:'
			endif
		endif
		CreateScreenElement {
			Type = ContainerElement
			parent = vmenu_pause
			dims = (0.0, 100.0)
			event_handlers = [
				{focus retail_menu_focus params = {id = pause_options_lefty}}
				{unfocus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus params = {id = pause_options_lefty}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_lefty_flip create_params = {Player = <Player>}}}
			]
		}
		<lefty_container> = <id>
		CreateScreenElement {
			Type = TextElement
			parent = <lefty_container>
			id = pause_options_lefty
			font = fontgrid_title_gh3
			Scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = <lefty_flip_text>
			just = [center center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <exclusive_device>
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		GetGlobalTags \{user_options}
		if (<Player> = 1)
			if (<lefty_flip_p1> = 1)
				lefty_tex = Options_Controller_Check
			else
				lefty_tex = Options_Controller_X
			endif
		else
			if (<lefty_flip_p2> = 1)
				lefty_tex = Options_Controller_Check
			else
				lefty_tex = Options_Controller_X
			endif
		endif
		displaySprite {
			parent = <lefty_container>
			tex = <lefty_tex>
			just = [center center]
			z = (<pause_z> + 10)
		}
		GetScreenElementDims \{id = pause_options_lefty}
		<id> :SetProps Pos = (<width> * (0.5, 0.0) + (22.0, 0.0))
		add_user_control_helper \{text = 'SELECT'
			button = green
			z = 100000}
		add_user_control_helper \{text = 'BACK'
			button = red
			z = 100000}
		add_user_control_helper \{text = 'UP/DOWN'
			button = strumbar
			z = 100000}
	endif
	if ($is_network_game = 0)
		if NOT isSinglePlayerGame
			if (<for_practice> = 0 && <dont_show_options> = 0)
				formatText TextName = player_paused_text 'PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE.' d = <Player>
				CreateScreenElement {
					Type = SpriteElement
					parent = pause_menu_frame_container
					id = pause_helper_text_bg
					texture = Control_pill_body
					Pos = (640.0, 620.0)
					just = [center center]
					rgba = [90 85 100 255]
					z_priority = (<pause_z> - 8)
				}
				CreateScreenElement {
					Type = TextElement
					parent = pause_menu_frame_container
					Pos = (640.0, 619.0)
					just = [center center]
					text = <player_paused_text>
					rgba = [170 120 100 255]
					Scale = (0.6, 0.6)
					z_priority = (<pause_z> - 0)
					font = text_a6
					Shadow
					shadow_offs = (1.0, 1.0)
				}
				GetScreenElementDims id = <id>
				bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
				pause_helper_text_bg :SetProps dims = <bg_dims>
				CreateScreenElement {
					Type = SpriteElement
					parent = pause_menu_frame_container
					texture = Control_pill_end
					Pos = ((640.0, 620.0) - <width> * (0.5, 0.0))
					rgba = [90 85 100 255]
					just = [right center]
					flip_v
					z_priority = (<pause_z> - 8)
				}
				CreateScreenElement {
					Type = SpriteElement
					parent = pause_menu_frame_container
					texture = Control_pill_end
					Pos = ((640.0, 620.0) + <width> * (0.5, 0.0))
					rgba = [90 85 100 255]
					just = [left center]
					z_priority = (<pause_z> - 8)
				}
			endif
		endif
	endif
	Change \{menu_choose_practice_destroy_previous_menu = 1}
	if (<for_options> = 0 && <for_practice> = 0)
		SpawnScriptNow \{animate_bunny_flame}
	endif
endscript

script animate_bunny_flame 
	begin
	swap_bunny_flame
	Wait \{0.1
		Second}
	repeat
endscript

script bunny_hover 
	if NOT ScreenElementExists \{id = bunny_container}
		return
	endif
	i = 1
	begin
	formatText checksumName = bunnyid 'pause_bunny_flame_%d' d = <i>
	if NOT ScreenElementExists id = <bunnyid>
		return
	else
		SetScreenElementProps id = <bunnyid> Pos = <flame_origin>
	endif
	<i> = (<i> + 1)
	repeat 7
	begin
	bunny_container :DoMorph \{Pos = (360.0, 130.0)
		time = 1
		rot_angle = -25
		Scale = 1.05
		motion = ease_out}
	bunny_container :DoMorph \{Pos = (390.0, 170.0)
		time = 1
		rot_angle = -20
		Scale = 0.95
		motion = ease_in}
	bunny_container :DoMorph \{Pos = (360.0, 130.0)
		time = 1
		rot_angle = -15
		Scale = 1.05
		motion = ease_out}
	bunny_container :DoMorph \{Pos = (390.0, 170.0)
		time = 1
		rot_angle = -20
		Scale = 0.95
		motion = ease_in}
	repeat
endscript

script destroy_pause_menu 
	restore_start_key_binding
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
	KillSpawnedScript \{Name = animate_bunny_flame}
	destroy_popup_warning_menu
endscript

script swap_bunny_flame 
	if GotParam \{up}
		generic_menu_up_or_down_sound \{up}
		Change \{g_anim_flame = -1}
	elseif GotParam \{down}
		generic_menu_up_or_down_sound \{down}
		Change \{g_anim_flame = 1}
	endif
	Change bunny_flame_index = ($bunny_flame_index + $g_anim_flame)
	if ($bunny_flame_index > 7)
		Change \{bunny_flame_index = 1}
	endif
	if ($bunny_flame_index < 1)
		Change \{bunny_flame_index = 7}
	endif
	reset_bunny_alpha
	formatText \{checksumName = bunnyid
		'pause_bunny_flame_%d'
		d = $bunny_flame_index}
	if ScreenElementExists id = <bunnyid>
		DoScreenElementMorph id = <bunnyid> alpha = 1
	endif
endscript

script reset_bunny_alpha 
	i = 1
	begin
	formatText checksumName = bunnyid 'pause_bunny_flame_%d' d = <i>
	if ScreenElementExists id = <bunnyid>
		DoScreenElementMorph id = <bunnyid> alpha = 0
	endif
	<i> = (<i> + 1)
	repeat 7
endscript

script create_pause_menu_frame \{x_scale = 1
		y_scale = 1
		tile_sprite = 1
		container_id = pause_menu_frame_container
		z = 0
		gradient = 1
		parent = root_window
		Scale = 1.2}
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <container_id>
		Pos = (0.0, 0.0)
		just = [left top]
		z_priority = <z>
	}
	<center_pos> = (640.0, 360.0)
	pos_scale_2 = ((0.0, -5.0) * <y_scale>)
	scale_1 = ((1.5, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	scale_2 = ((1.4, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	scale_3 = ((2.8, 0.0) * <x_scale> + (0.0, 2.5) * <y_scale>)
	scale_4 = ((1.575, 0.0) * <x_scale> + (0.0, 1.5) * <y_scale>)
	scale_5 = ((1.5, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		Pos = (<center_pos> + (2.0, 0.0))
		Scale = <scale_3>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		Pos = (<center_pos> - (2.0, 0.0))
		Scale = <scale_3>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		Pos = (<center_pos> - (2.0, 0.0))
		Scale = <scale_3>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		Pos = (<center_pos> + (2.0, 0.0))
		Scale = <scale_3>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
endscript

script create_simple_frame \{center_offset = (0.0, 0.0)
		Scale = 1.2
		z = 0
		texture = frame_pause_a
		container_id = pause_menu_frame_container
		parent = root_window
		gradient = 1}
	center_pos = ((640.0, 360.0) + <center_offset>)
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <container_id>
		Pos = ((0.0, 0.0) + <center_offset>)
		just = [left top]
		z_priority = <z>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = <texture>
		id = graphic_test
		just = [center center]
		Pos = <center_pos>
		Scale = <Scale>
		z_priority = (<z> + 2)
	}
endscript

script destroy_pause_menu_frame \{container_id = pause_menu_frame_container}
	destroy_menu menu_id = <container_id>
endscript
