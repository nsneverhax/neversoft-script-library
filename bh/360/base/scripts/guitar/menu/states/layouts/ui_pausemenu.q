pause_menu_no_bg = 0
g_pausemenu_selected_index = 0

script ui_init_pausemenu 
	Change \{g_pausemenu_selected_index = 0}
	if ($is_network_game)
		EnableAllInput \{off}
	endif
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		celeb_intro_ui_cont :SE_SetProps \{alpha = 0.0
			time = 0.1}
	endif
	SoundEvent \{event = Pause_Menu_SFX}
endscript

script ui_create_pausemenu for_practice = 0 title_text = qs(0x662aaaf7) pad_back_script = pause_menu_exit enable_pause = 1 focus_index = ($g_pausemenu_selected_index)
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = pause_drop_player
			end_game_script = pause_end_game}
	endif
	if (<enable_pause> = 1)
		enable_pause
	endif
	player_device = ($last_start_pressed_device)
	player_selected = 1
	controller = 0
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> controller
		if (<controller> = <player_device>)
			<player_selected> = <player>
			break
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	<player> = <player_selected>
	vocals_mute_all_mics \{mute = true}
	if (<controller> >= 4)
		<title_text> = qs(0xc1230ff4)
	else
		if NOT isSinglePlayerGame
			FormatText TextName = title_text qs(0x6caaee30) p = <player>
		endif
	endif
	pause_menu_create_desc pad_back_script = <pad_back_script> pad_back_params = <pad_back_params>
	GameMode_GetType
	game_mode_type = <type>
	if (<type> = competitive || InInternetMode)
		pause_menu_desc_id :SE_SetProps \{menu_padding = (1280.0, 125.0)}
		pause_menu_desc_id :SE_SetProps \{arrows_pos = {
				(0.0, -2.0)
				relative
			}}
		pause_menu_desc_id :SE_SetProps \{options_vmenu_pos = {
				(0.0, 8.0)
				relative
			}}
	endif
	if (<game_mode_type> = tutorial)
		Change \{tutorial_paused = 1}
	else
		GMan_SongFunc \{func = get_current_song}
		get_song_title song = <current_song>
		pause_menu_desc_id :SE_SetProps {
			song_name_text = <song_title>
		}
		if pause_menu_desc_id :Desc_ResolveAlias \{name = alias_pause_menu_cont}
			AssignAlias id = <resolved_id> alias = pause_menu_cont
			<resolved_id> :SE_GetProps
			<z> = <z_priority>
		endif
		if (<game_mode_type> = freeplay)
			CreateScreenElement {
				id = generic_barrel_menu
				type = ContainerElement
				parent = root_window
				event_handlers = [
					{pad_back generic_menu_pad_back_sound}
					{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {<pad_back_params>}}}
				]
			}
			LaunchEvent \{type = focus
				target = generic_barrel_menu}
		else
			if NOT pause_menu_desc_id :Desc_ResolveAlias \{name = alias_options_vmenu}
				softassert \{qs(0xb547c6cd)}
				return
			endif
			AssignAlias id = <resolved_id> alias = current_menu
			current_menu :SetTags \{create_dummy_items = 1
				smooth_morph_time = 0.1}
			current_menu :SE_SetProps {
				exclusive_device = <player_device>
				event_handlers = [
					{pad_up pausemenu_pad_up}
					{pad_down pausemenu_pad_down}
					{pad_left pausemenu_pad_up}
					{pad_right pausemenu_pad_down}
					{pad_back generic_menu_pad_back_sound}
					{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {<pad_back_params>}}}
				]
			}
			if GotParam \{no_loop}
				current_menu :SE_SetProps \{event_handlers = [
						{
							pad_up
							generic_menu_up_or_down_sound
							params = {
								up
							}
						}
						{
							pad_down
							generic_menu_up_or_down_sound
							params = {
								down
							}
						}
						{
							pad_left
							generic_menu_up_or_down_sound
							params = {
								up
							}
						}
						{
							pad_right
							generic_menu_up_or_down_sound
							params = {
								down
							}
						}
					]
					loop_view = false
					loop_center = false}
				pause_menu_desc_id :SE_SetProps \{arrows_alpha = 0}
			else
				current_menu :SE_SetProps \{event_handlers = [
						{
							pad_up
							SmoothMenuScroll
							params = {
								Dir = -1
								isVertical = true
								play_scroll_sound = 1
							}
						}
						{
							pad_down
							SmoothMenuScroll
							params = {
								Dir = 1
								isVertical = true
								play_scroll_sound = 1
							}
						}
						{
							pad_left
							SmoothMenuScroll
							params = {
								Dir = -1
								isVertical = true
								play_scroll_sound = 1
							}
						}
						{
							pad_right
							SmoothMenuScroll
							params = {
								Dir = 1
								isVertical = true
								play_scroll_sound = 1
							}
						}
					]}
			endif
			create_2D_spring_system \{desc_id = pause_menu_desc_id
				num_springs = 1
				stiffness = 50
				rest_length = 1}
			if ($pause_menu_no_bg = 0)
				if pause_menu_desc_id :Desc_ResolveAlias \{name = alias_clown2_container
						param = clown2_id}
					<clown2_id> :Obj_SpawnScript ui_shakey
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :Desc_ResolveAlias \{name = alias_clown2_container
						param = clown2_id}
					<clown2_id> :Obj_SpawnScript ui_frazzmatazz
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :Desc_ResolveAlias \{name = alias_lil_skull_container
						param = lil_skull_id}
					<lil_skull_id> :Obj_SpawnScript ui_frazzmatazz
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :Desc_ResolveAlias \{name = alias_lil_skull_container
						param = lil_skull_id}
					<lil_skull_id> :Obj_SpawnScript ui_shakey
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :Desc_ResolveAlias \{name = alias_lil_skull2_container
						param = lil_skull2_id}
					<lil_skull2_id> :Obj_SpawnScript ui_frazzmatazz
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :Desc_ResolveAlias \{name = alias_lil_skull2_container
						param = lil_skull2_id}
					<lil_skull2_id> :Obj_SpawnScript ui_shakey
				else
					ScriptAssert \{'drose1'}
				endif
			else
				if pause_menu_desc_id :Desc_ResolveAlias \{name = alias_background
						param = background_id}
					<background_id> :SE_SetProps alpha = 0
				endif
			endif
		endif
		if NOT GotParam \{no_helpers}
			clean_up_user_control_helpers
			if GotParam \{player_device}
				add_gamertag_helper exclusive_device = <player_device>
			endif
		endif
	endif
	if (<game_mode_type> = freeplay)
		pause_menu_desc_id :SE_SetProps \{arrows_alpha = 0}
	else
		if NOT GotParam \{options}
			if GMan_HasActiveGoals
				goal_pause_tool_get_default_options
				goal_pause_tool_get_custom_options
				<options> = []
				if StructureContains \{structure = default_options
						resume}
					new_option = {
						text = qs(0x4f636726)
						func = pause_menu_exit
					}
					AddArrayElement array = <options> element = <new_option>
					<options> = <array>
				endif
				if NOT InInternetMode
					if StructureContains \{structure = default_options
							restart}
						new_option = {
							text = qs(0xb8790f2f)
							func = ui_event
							func_params = {event = menu_change data = {state = UIstate_pausemenu_restart_warning}}
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					endif
					if StructureContains \{structure = default_options
							difficulty}
						new_option = {
							text = qs(0x9f281c76)
							func = ui_event
							func_params = {event = menu_change data = {state = UIstate_pausemenu_change_difficulty player_device = <player_device> player = <player>}}
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					endif
					if isSinglePlayerGame
						if ($end_credits = 0)
							GetPlayerInfo <player> difficulty
							if (<difficulty> != beginner)
								new_option = {
									text = qs(0x3ea7dec9)
									func = ui_event
									func_params = {event = menu_change data = {state = UIstate_practice_warning}}
								}
								AddArrayElement array = <options> element = <new_option>
								<options> = <array>
							endif
						endif
					endif
					if StructureContains \{structure = default_options
							options}
						new_option = {
							text = qs(0x976cf9e7)
							func = ui_event
							func_params = {event = menu_change data = {state = UIstate_pause_options player_device = <player_device> player = <player>}}
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					endif
				endif
				GetArraySize <custom_options>
				if (<array_size> > 0)
					<i> = 0
					begin
					if StructureContains structure = (<custom_options> [<i>]) local_only
						if ((<custom_options> [<i>].local_only) = 1)
							if NOT InNetGame
								AddArrayElement array = <options> element = (<custom_options> [<i>])
								<options> = <array>
							endif
						else
							AddArrayElement array = <options> element = (<custom_options> [<i>])
							<options> = <array>
						endif
					else
						AddArrayElement array = <options> element = (<custom_options> [<i>])
						<options> = <array>
					endif
					<i> = (<i> + 1)
					repeat <array_size>
				endif
				if StructureContains \{structure = default_options
						gig_info}
					if ($end_credits = 0)
						GMan_ChallengeManagerFunc \{goal = career
							tool = challenges
							func = get_current_challenge}
						new_option = {
							text = qs(0xee9409ca)
							func = ui_event
							func_params = {
								event = menu_change
								data = {
									state = UIstate_career_gig_info
									from_pause_menu = 1
									gig_global = <current_challenge>
									device_num = <player_device>
								}
							}
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					endif
				endif
				if StructureContains \{structure = default_options
						quit}
					if InInternetMode
						new_option = {
							text = qs(0x67d9c56d)
							func = select_quit_network_game
							func_params = {from_pause_menu = 1}
						}
					else
						new_option = {
							text = qs(0x67d9c56d)
							func = ui_event
							func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning}}
						}
					endif
					AddArrayElement array = <options> element = <new_option>
					<options> = <array>
				endif
			else
				options = [
					{
						text = qs(0x4f636726)
						func = pause_menu_exit
					}
				]
				if ($calibrate_lag_enabled = 1)
					ui_calibrate_pausemenu options = <options>
				else
					if NOT InInternetMode
						if ($end_credits = 0)
							if (<game_mode_type> = tutorial)
								<text> = qs(0x9c8bd769)
							else
								<text> = qs(0xb8790f2f)
							endif
							new_option = {
								text = <text>
								func = ui_event
								func_params = {event = menu_change data = {state = UIstate_pausemenu_restart_warning}}
							}
							AddArrayElement array = <options> element = <new_option>
							<options> = <array>
							if (<game_mode_type> = tutorial)
								new_option = {
									text = qs(0xfceafb8f)
									func = ui_event
									func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning option2_text = qs(0xfceafb8f) option2_func = tutorial_system_pausemenu_skip_lesson}}
								}
								AddArrayElement array = <options> element = <new_option>
								<options> = <array>
							endif
						endif
					endif
					if (<for_practice> = 1 || $game_mode = practice)
						GetFirstPlayer
						if NOT PlayerInfoEquals <player> part = vocals
							menu_pause_get_practice_speed_option
							AddArrayElement array = <options> element = <new_option>
							<options> = <array>
						endif
						menu_pause_get_practice_section_option
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
						if ($came_to_practice_from = main_menu)
							new_option = {
								text = qs(0x3e482764)
								func = ui_event
								func_params = {
									event = menu_change
									data = {
										state = UIstate_pausemenu_quit_warning
										option2_text = qs(0x3e482764)
										option2_func = quit_warning_select_quit
										option2_func_params = {
											callback = song_ended_menu_select_new_song
										}
									}
								}
							}
							AddArrayElement array = <options> element = <new_option>
							<options> = <array>
						endif
						new_option = {
							text = qs(0x976cf9e7)
							func = ui_event
							func_params = {event = menu_change data = {state = UIstate_pause_options player_device = <player_device> player = <player>}}
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					else
						if ($is_network_game = 0)
							GameMode_GetType
							if is_current_song_a_jam_session
								if NOT ui_event_exists_in_stack \{name = 'jam'}
									if NOT InInternetMode
										if (<type> = quickplay)
											GetArraySize \{$current_playlist}
											if (<array_size> > 1)
												new_option = {
													text = qs(0xef74f7d2)
													func = ui_event
													func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning option2_text = qs(0xef74f7d2) option2_func = quickplay_skip_song failed_song}}
												}
												AddArrayElement array = <options> element = <new_option>
												<options> = <array>
											endif
											new_option = {
												text = qs(0xa8f207af)
												func = ui_event
												func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning option2_text = qs(0xa8f207af) option2_func = quickplay_select_edit_playlist}}
											}
											AddArrayElement array = <options> element = <new_option>
											<options> = <array>
											if (<array_size> > 1)
												new_option = {
													text = qs(0xecf12cac)
													func = ui_event
													func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning option2_text = qs(0xecf12cac) option2_func = quickplay_select_new_playlist}}
												}
											else
												new_option = {
													text = qs(0x3e482764)
													func = ui_event
													func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning option2_text = qs(0x3e482764) option2_func = quickplay_select_new_song}}
												}
											endif
											AddArrayElement array = <options> element = <new_option>
											<options> = <array>
										endif
									endif
								endif
							else
								if NOT ($game_mode = p2_pro_faceoff)
									if ($end_credits = 0)
										if (<game_mode_type> != tutorial)
											new_option = {
												text = qs(0x9f281c76)
												func = ui_event
												func_params = {event = menu_change data = {state = UIstate_pausemenu_change_difficulty player_device = <player_device> player = <player>}}
											}
											AddArrayElement array = <options> element = <new_option>
											<options> = <array>
										endif
									endif
								endif
								if NOT InInternetMode
									if (<type> = quickplay)
										GetArraySize \{$current_playlist}
										if (<array_size> > 1)
											new_option = {
												text = qs(0xef74f7d2)
												func = ui_event
												func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning option2_text = qs(0xef74f7d2) option2_func = quickplay_skip_song failed_song}}
											}
											AddArrayElement array = <options> element = <new_option>
											<options> = <array>
										endif
										new_option = {
											text = qs(0xa8f207af)
											func = ui_event
											func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning option2_text = qs(0xa8f207af) option2_func = quickplay_select_edit_playlist}}
										}
										AddArrayElement array = <options> element = <new_option>
										<options> = <array>
										if (<array_size> > 1)
											new_option = {
												text = qs(0xecf12cac)
												func = ui_event
												func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning option2_text = qs(0xecf12cac) option2_func = quickplay_select_new_playlist}}
											}
										else
											new_option = {
												text = qs(0x3e482764)
												func = ui_event
												func_params = {event = menu_change data = {state = UIstate_pausemenu_quit_warning option2_text = qs(0x3e482764) option2_func = quickplay_select_new_song}}
											}
										endif
										AddArrayElement array = <options> element = <new_option>
										<options> = <array>
									endif
								endif
								if isSinglePlayerGame
									if ($end_credits = 0)
										if (<game_mode_type> != tutorial)
											GetPlayerInfo <player> difficulty
											if (<difficulty> != beginner)
												new_option = {
													text = qs(0x3ea7dec9)
													func = ui_event
													func_params = {event = menu_change data = {state = UIstate_practice_warning}}
												}
												AddArrayElement array = <options> element = <new_option>
												<options> = <array>
											endif
										endif
									endif
								endif
							endif
							if ($end_credits = 0)
								if (<game_mode_type> != tutorial)
									new_option = {
										text = qs(0x976cf9e7)
										func = ui_event
										func_params = {event = menu_change data = {state = UIstate_pause_options player_device = <player_device> player = <player>}}
									}
									AddArrayElement array = <options> element = <new_option>
									<options> = <array>
								endif
							endif
						endif
					endif
					quit_script = generic_event_choose
					no_sound = no_sound
					quit_script_params = {state = UIstate_pausemenu_quit_warning}
					if ($is_in_debug && $game_mode != whiteboard_team)
						if ($end_credits > 0)
							quit_script = debug_quitcredits
							quit_script_params = {}
						else
							quit_script = generic_event_back
							quit_script_params = {state = UIstate_debug}
						endif
					elseif ($is_network_game = 1)
						quit_script = select_quit_network_game
						quit_script_params = {from_pause_menu = 1}
					endif
					if ($end_credits = 0 && $calibrate_lag_enabled = 0)
						new_option = {
							text = qs(0x67d9c56d)
							func = <quit_script>
							func_params = <quit_script_params>
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					endif
				endif
			endif
		endif
		<debug_item> = 0
		if ($enable_button_cheats = 1)
			if (<game_mode_type> != tutorial)
				debug_option = {
					text = qs(0x49a0d144)
					func = ui_event
					func_params = {event = menu_change data = {state = UIstate_debug from_gameplay = 1}}
				}
				AddArrayElement array = <options> element = <debug_option>
				<options> = <array>
				<debug_item> = 1
			endif
		endif
		pause_menu_create_menu_options <...>
		CountScreenElementChildren \{id = current_menu}
		if ((<num_children> - <debug_item>) < 3)
			current_menu :SE_SetProps \{loop_view = false
				event_handlers = [
					{
						pad_up
						nullscript
					}
					{
						pad_down
						nullscript
					}
					{
						pad_left
						nullscript
					}
					{
						pad_right
						nullscript
					}
				]
				replace_handlers
				spacing_between = 30}
			pause_menu_desc_id :SE_SetProps \{arrows_alpha = 0
				menu_padding = (1280.0, 225.0)}
		endif
		current_menu :Obj_SpawnScriptLater \{menu_set_alpha_values
			params = {
				instant = 1
			}}
		if (<game_mode_type> = tutorial)
			menu_finish
		else
			GetArraySize <options>
			if (<array_size> < 5)
				generic_barrel_menu_set_max_expansion max_expansion = <array_size>
			endif
			if GotParam \{selected_index}
				focus_index = <selected_index>
			endif
			LaunchEvent \{type = unfocus
				target = current_menu}
			LaunchEvent type = focus target = current_menu data = {child_index = <focus_index>}
		endif
	endif
	if (<game_mode_type> != freeplay)
		add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
	endif
	add_user_control_helper controller = <controller> text = qs(0xaf4d5dd2) button = red z = 100000
	if (<game_mode_type> != tutorial)
		fadetoblack \{off
			time = 0.0
			no_wait}
	endif
endscript

script pausemenu_pad_up 
	current_menu :Obj_SpawnScript \{ui_flash_scroll_arrow
		params = {
			desc_id = pause_menu_desc_id
			up
		}}
	current_menu :Obj_SpawnScript \{menu_set_alpha_values
		params = {
			up
		}}
endscript

script pausemenu_pad_down 
	current_menu :Obj_SpawnScript \{ui_flash_scroll_arrow
		params = {
			desc_id = pause_menu_desc_id
			down
		}}
	current_menu :Obj_SpawnScript \{menu_set_alpha_values
		params = {
			down
		}}
endscript

script pause_menu_create_menu_options 
	GetArraySize <options>
	<i> = 0
	begin
	if GotParam \{from_pause_tool}
		pause_menu_create_menu_option_singular {
			option = (<options> [<i>])
			z = <z>
			from_pause_tool = 1
		}
	else
		pause_menu_create_menu_option_singular {
			option = (<options> [<i>])
			z = <z>
		}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script pause_menu_create_menu_option_singular 
	if StructureContains structure = <option> func_params
		<func_params> = (<option>.func_params)
	endif
	sound_func = generic_menu_pad_choose_sound
	if StructureContains structure = <option> sound_func
		sound_func = (<option>.sound_func)
	endif
	if StructureContains structure = <option> no_sound
		sound_func = nullscript
	endif
	set_unfocus_color
	if NOT GotParam \{from_pause_tool}
		<dont_force_quit> = 1
	else
		<dont_force_quit> = 0
		if StructureContains structure = <option> dont_force_quit
			<dont_force_quit> = 1
		endif
	endif
	if StructureContains structure = <option> texture
		params = {
			text = (<option>.text)
			parent = current_menu
			icon = (<option>.texture)
			pad_choose_script = (<option>.func)
			pad_choose_params = <func_params>
			icon_first = 1
			dont_force_quit = <dont_force_quit>
			pad_choose_sound = NullSound
			additional_focus_script = menu_set_alpha_values
		}
		GameMode_GetType
		if (<type> = tutorial)
			add_generic_tutorial_menu_icon_item <params>
		else
			add_generic_barrel_menu_icon_item <params>
		endif
	else
		params = {
			text = (<option>.text)
			parent = current_menu
			pad_choose_script = (<option>.func)
			pad_choose_params = <func_params>
			dont_force_quit = <dont_force_quit>
			additional_focus_script = menu_set_alpha_values
		}
		GameMode_GetType
		if (<type> = tutorial)
			add_generic_tutorial_menu_text_item <params>
		else
			add_generic_barrel_menu_text_item <params>
		endif
	endif
endscript

script ui_destroy_pausemenu 
	if ScreenElementExists \{id = generic_barrel_vmenu}
		generic_barrel_vmenu :GetSingleTag \{tag_selected_index}
		Change g_pausemenu_selected_index = <tag_selected_index>
	endif
	destroy_generic_barrel_menu
	pause_menu_destroy_desc
	GameMode_GetType
	if (<type> = tutorial)
		Change \{tutorial_paused = 0}
	endif
	clean_up_user_control_helpers
	set_focus_color
	set_unfocus_color
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		celeb_intro_ui_cont :SE_SetProps \{alpha = 1.0
			time = 0.1}
	endif
endscript

script ui_deinit_pausemenu 
	if ($is_network_game)
		EnableAllInput
	endif
endscript

script pause_menu_exit 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if Is_ui_event_running
		return
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :SE_SetProps \{block_events}
	endif
	if ($game_mode = freeplay)
		freeplay_prepare_for_unpause
	endif
	wait \{1
		gameframe}
	handle_pause_event
endscript

script pause_menu_create_desc 
	GameMode_GetType
	if (<type> = tutorial)
		tutorial_system_create_pausemenu_description pad_back_script = <pad_back_script> pad_back_params = <pad_back_params>
	else
		CreateScreenElement \{parent = root_window
			id = pause_menu_desc_id
			type = DescInterface
			desc = 'pause_menu'}
	endif
endscript

script pause_menu_destroy_desc 
	SoundEvent \{event = Pause_Menu_Exit_SFX}
	GameMode_GetType
	if (<type> = tutorial)
		tutorial_system_destroy_pausemenu_description
	else
		if ScreenElementExists \{id = pause_menu_desc_id}
			pause_menu_desc_id :Die
		endif
	endif
endscript

script EnableAllInput 
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> controller
		if GotParam \{off}
			EnableInput controller = <controller> off
		else
			EnableInput controller = <controller>
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript

script ui_return_pausemenu 
	if ($is_network_game)
		if ScreenElementExists \{id = generic_barrel_vmenu}
			generic_barrel_vmenu :SE_SetProps \{unblock_events}
			LaunchEvent \{type = focus
				target = generic_barrel_vmenu}
		endif
		add_gamertag_helper exclusive_device = ($last_start_pressed_device)
	endif
endscript

script pause_drop_player 
	printf \{qs(0x83bab1ce)}
	spawnscriptnow unpause_and_drop_player params = <...>
endscript

script unpause_and_drop_player 
	gameplay_drop_player <...>
endscript

script pause_end_game 
	printf \{qs(0x090e92f1)}
	spawnscriptnow unpause_and_endgame id = ui_player_drop_scripts params = <...>
endscript

script unpause_and_endgame 
	gameplay_end_game no_unpause <...>
endscript

script menu_pause_get_practice_speed_option 
	new_option = {
		text = qs(0xcc2da18b)
		func = ui_event
		func_params = {
			event = menu_change
			data = {
				state = UIstate_pausemenu_quit_warning
				option2_text = qs(0xcc2da18b)
				option2_func = practice_choose_change_speed
				option2_func_params = {from_in_game = 1}
			}
		}
	}
	return new_option = <new_option>
endscript

script menu_pause_get_practice_section_option 
	option2_func_params = {
		callback = practice_choose_change_section
		data = {
			from_in_game = 1
		}
	}
	new_option = {
		text = qs(0x68bd3039)
		func = ui_event
		func_params = {
			event = menu_change
			data = {
				state = UIstate_pausemenu_quit_warning
				option2_text = qs(0x68bd3039)
				option2_func = quit_warning_select_quit
				option2_func_params = <option2_func_params>
			}
		}
	}
	return new_option = <new_option>
endscript
