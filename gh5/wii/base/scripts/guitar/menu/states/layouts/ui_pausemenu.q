pause_menu_no_bg = 0
g_pausemenu_selected_index = 0

script ui_init_pausemenu 
	Change \{g_pausemenu_selected_index = 0}
	if ($is_network_game)
		enableallinput \{OFF}
	endif
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		celeb_intro_ui_cont :se_setprops \{alpha = 0.0
			time = 0.1}
	endif
	if is_roadie_battle_mode
		getfaceoffratio
		if (<faceoff_ratio> > 0)
			SoundEvent \{event = roadie_battle_roadie1_sabotaged1}
			SoundEvent \{event = pause_menu_sfx}
		elseif (<faceoff_ratio> = 0)
			SoundEvent \{event = pause_menu_sfx}
		else
			SoundEvent \{event = roadie_battle_roadie2_aww}
			SoundEvent \{event = pause_menu_sfx}
		endif
	else
		SoundEvent \{event = pause_menu_sfx}
	endif
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
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> controller
		if (<controller> = <player_device>)
			<player_selected> = <Player>
			break
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	<Player> = <player_selected>
	vocals_mute_all_mics \{mute = true}
	if (<controller> >= 4)
		<title_text> = qs(0xc1230ff4)
	else
		if NOT isSinglePlayerGame
			formatText TextName = title_text qs(0x6caaee30) p = <Player>
		endif
	endif
	pause_menu_create_desc pad_back_script = <pad_back_script> pad_back_params = <pad_back_params>
	gamemode_gettype
	game_mode_type = <Type>
	if (<game_mode_type> = tutorial)
		Change \{tutorial_paused = 1}
	else
		gman_songfunc \{func = get_current_song}
		get_song_title song = <current_song>
		pause_menu_desc_id :se_setprops {
			song_name_text = <song_title>
		}
		if pause_menu_desc_id :desc_resolvealias \{Name = alias_pause_menu_cont}
			AssignAlias id = <resolved_id> alias = pause_menu_cont
			<resolved_id> :se_getprops
			<z> = <z_priority>
		endif
		if (<game_mode_type> = freeplay)
			CreateScreenElement {
				id = generic_barrel_menu
				Type = ContainerElement
				parent = root_window
				event_handlers = [
					{pad_back generic_menu_pad_back_sound}
					{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {<pad_back_params>}}}
				]
			}
			LaunchEvent \{Type = focus
				target = generic_barrel_menu}
		else
			if is_roadie_battle_mode
				pause_menu_desc_id :se_setprops \{pause_texture = menu_pause_roadiebattle_bg}
				<bg_props> = {
					dims = (590.0, 630.0)
					Pos = (75.0, 0.0)
					z_priority = 600
					rgba = [231 231 230 255]
				}
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_menu_pause_bg1}
					<resolved_id> :se_setprops {<bg_props> alpha = 0.7}
				endif
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_menu_pause_bg2}
					<resolved_id> :se_setprops {<bg_props> alpha = 0.5}
				endif
				<barrel_menu_pos> = (1150.0, 570.0)
			else
				<barrel_menu_pos> = (950.0, 530.0)
			endif
			make_generic_barrel_menu {
				title = <title_text>
				pad_back_script = <pad_back_script>
				pad_back_params = <pad_back_params>
				exclusive_device = <player_device>
				z_priority = (<z> + 1)
				Pos = <barrel_menu_pos>
			}
			create_2d_spring_system \{desc_id = pause_menu_desc_id
				num_springs = 1
				stiffness = 50
				rest_length = 1}
			if ($pause_menu_no_bg = 0)
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_bkg_anim
						param = bkg_anim_id}
					<bkg_anim_id> :obj_spawnscript ui_shakey
				else
					ScriptAssert \{'UIart'}
				endif
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_bkg_anim
						param = bkg_anim_id}
					<bkg_anim_id> :obj_spawnscript ui_frazzmatazz_02
				else
					ScriptAssert \{'UIart'}
				endif
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_clown2_container
						param = clown2_id}
					<clown2_id> :obj_spawnscript ui_shakey
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_clown2_container
						param = clown2_id}
					<clown2_id> :obj_spawnscript ui_frazzmatazz
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_lil_skull_container
						param = lil_skull_id}
					<lil_skull_id> :obj_spawnscript ui_frazzmatazz
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_lil_skull_container
						param = lil_skull_id}
					<lil_skull_id> :obj_spawnscript ui_shakey
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_lil_skull2_container
						param = lil_skull2_id}
					<lil_skull2_id> :obj_spawnscript ui_frazzmatazz
				else
					ScriptAssert \{'drose1'}
				endif
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_lil_skull2_container
						param = lil_skull2_id}
					<lil_skull2_id> :obj_spawnscript ui_shakey
				else
					ScriptAssert \{'drose1'}
				endif
			else
				pause_menu_desc_id :se_setprops \{alpha = 0}
			endif
		endif
		if NOT GotParam \{no_helpers}
			clean_up_user_control_helpers
			if GotParam \{player_device}
				add_gamertag_helper exclusive_device = <player_device>
			endif
		endif
	endif
	if NOT (<game_mode_type> = freeplay)
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
				if NOT ininternetmode
					if StructureContains \{structure = default_options
							restart}
						new_option = {
							text = qs(0xb8790f2f)
							func = ui_event
							func_params = {event = menu_change data = {state = uistate_pausemenu_restart_warning}}
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					endif
					if StructureContains \{structure = default_options
							difficulty}
						new_option = {
							text = qs(0x9f281c76)
							func = ui_event
							func_params = {event = menu_change data = {state = uistate_pausemenu_change_difficulty player_device = <player_device> Player = <Player>}}
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					endif
					if isSinglePlayerGame
						if ($end_credits = 0)
							getplayerinfo <Player> difficulty
							if (<difficulty> != beginner)
								new_option = {
									text = qs(0x3ea7dec9)
									func = ui_event
									func_params = {event = menu_change data = {state = uistate_practice_warning}}
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
							func_params = {event = menu_change data = {state = uistate_pause_options player_device = <player_device> Player = <Player>}}
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					endif
				endif
				GetArraySize <custom_options>
				if (<array_Size> > 0)
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
					repeat <array_Size>
				endif
				if StructureContains \{structure = default_options
						gig_info}
					if ($end_credits = 0)
						gman_challengemanagerfunc \{goal = career
							tool = challenges
							func = get_current_challenge}
						new_option = {
							text = qs(0xee9409ca)
							func = ui_event
							func_params = {
								event = menu_change
								data = {
									state = uistate_career_gig_info
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
					if ininternetmode
						new_option = {
							text = qs(0x67d9c56d)
							func = select_quit_network_game
							func_params = {from_pause_menu = 1}
						}
					else
						new_option = {
							text = qs(0x67d9c56d)
							func = ui_event
							func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning}}
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
					if NOT ininternetmode
						if ($end_credits = 0)
							if (<game_mode_type> = tutorial)
								<text> = qs(0x9c8bd769)
								warn_state = uistate_tutorial_pausemenu_restart_warning
							else
								<text> = qs(0xb8790f2f)
								warn_state = uistate_pausemenu_restart_warning
							endif
							new_option = {
								text = <text>
								func = ui_event
								func_params = {event = menu_change data = {state = <warn_state>}}
							}
							AddArrayElement array = <options> element = <new_option>
							<options> = <array>
							if (<game_mode_type> = tutorial)
								new_option = {
									text = qs(0xfceafb8f)
									func = ui_event
									func_params = {event = menu_change data = {state = uistate_tutorial_pausemenu_quit_warning option2_text = qs(0xfceafb8f) option2_func = tutorial_system_pausemenu_skip_lesson}}
								}
								AddArrayElement array = <options> element = <new_option>
								<options> = <array>
							endif
						endif
					endif
					if (<for_practice> = 1 || $game_mode = practice)
						if NOT playerinfoequals \{1
								part = vocals}
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
										state = uistate_pausemenu_quit_warning
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
							func_params = {event = menu_change data = {state = uistate_pause_options player_device = <player_device> Player = <Player>}}
						}
						AddArrayElement array = <options> element = <new_option>
						<options> = <array>
					else
						if ($is_network_game = 0)
							gamemode_gettype
							if is_current_song_a_jam_session
								if NOT ui_event_exists_in_stack \{Name = 'jam'}
									if NOT ininternetmode
										if (<Type> = quickplay)
											GetArraySize \{$current_playlist}
											if (<array_Size> > 1)
												new_option = {
													text = qs(0xef74f7d2)
													func = ui_event
													func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xef74f7d2) option2_func = quickplay_skip_song failed_song}}
												}
												AddArrayElement array = <options> element = <new_option>
												<options> = <array>
											endif
											if (<array_Size> > 1)
												new_option = {
													text = qs(0xecf12cac)
													func = ui_event
													func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xecf12cac) option2_func = quickplay_select_new_playlist}}
												}
											else
												new_option = {
													text = qs(0x3e482764)
													func = ui_event
													func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0x3e482764) option2_func = quickplay_select_new_song}}
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
												func_params = {event = menu_change data = {state = uistate_pausemenu_change_difficulty player_device = <player_device> Player = <Player>}}
											}
											AddArrayElement array = <options> element = <new_option>
											<options> = <array>
										endif
									endif
								endif
								if NOT ininternetmode
									if (<Type> = quickplay)
										GetArraySize \{$current_playlist}
										if (<array_Size> > 1)
											new_option = {
												text = qs(0xef74f7d2)
												func = ui_event
												func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xef74f7d2) option2_func = quickplay_skip_song failed_song}}
											}
											AddArrayElement array = <options> element = <new_option>
											<options> = <array>
										endif
										new_option = {
											text = qs(0xa8f207af)
											func = ui_event
											func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xa8f207af) option2_func = quickplay_select_edit_playlist}}
										}
										AddArrayElement array = <options> element = <new_option>
										<options> = <array>
										if (<array_Size> > 1)
											new_option = {
												text = qs(0xecf12cac)
												func = ui_event
												func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xecf12cac) option2_func = quickplay_select_new_playlist}}
											}
										else
											new_option = {
												text = qs(0x3e482764)
												func = ui_event
												func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0x3e482764) option2_func = quickplay_select_new_song}}
											}
										endif
										AddArrayElement array = <options> element = <new_option>
										<options> = <array>
									endif
								endif
								if isSinglePlayerGame
									if ($end_credits = 0)
										if (<game_mode_type> != tutorial)
											getplayerinfo <Player> difficulty
											if (<difficulty> != beginner)
												new_option = {
													text = qs(0x3ea7dec9)
													func = ui_event
													func_params = {event = menu_change data = {state = uistate_practice_warning}}
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
										func_params = {event = menu_change data = {state = uistate_pause_options player_device = <player_device> Player = <Player>}}
									}
									AddArrayElement array = <options> element = <new_option>
									<options> = <array>
								endif
							endif
						endif
					endif
					quit_script = generic_event_choose
					no_sound = no_sound
					quit_script_params = {state = uistate_pausemenu_quit_warning}
					if ($is_in_debug && $game_mode != whiteboard_team)
						if ($end_credits > 0)
							quit_script = debug_quitcredits
							quit_script_params = {}
						else
							quit_script = generic_event_back
							quit_script_params = {state = uistate_debug}
						endif
					elseif ($is_network_game = 1)
						quit_script = select_quit_network_game
						quit_script_params = {from_pause_menu = 1}
					elseif ($notetracker_quickplay_active = 1)
						quit_script = notetracker_quickplay_quit
						quit_script_params = {}
					elseif (<game_mode_type> = tutorial)
						quit_script_params = {state = uistate_tutorial_pausemenu_quit_warning}
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
		if ($enable_button_cheats = 1)
			if (<game_mode_type> != tutorial)
				debug_option = {
					text = qs(0x49a0d144)
					func = ui_event
					func_params = {event = menu_change data = {state = uistate_debug from_gameplay = 1}}
				}
				AddArrayElement array = <options> element = <debug_option>
				<options> = <array>
			endif
		endif
		pause_menu_create_menu_options <...>
		if (<game_mode_type> = tutorial)
			menu_finish
		else
			GetArraySize <options>
			if (<array_Size> < 5)
				generic_barrel_menu_set_max_expansion max_expansion = <array_Size>
			endif
			generic_barrel_menu_finish index = <focus_index>
		endif
	endif
	if (<game_mode_type> != freeplay)
		add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
	endif
	add_user_control_helper controller = <controller> text = qs(0xaf4d5dd2) button = red z = 100000
endscript

script pause_menu_create_menu_options 
	GetArraySize <options>
	<i> = 0
	begin
	if GotParam \{from_pause_tool}
		printf qs(0xc078c8cb) s = (<options> [<i>].text)
		pause_menu_create_menu_option_singular {
			option = (<options> [<i>])
			z = <z>
			from_pause_tool = 1
		}
	else
		printf qs(0x37b6e7f2) s = (<options> [<i>].text)
		pause_menu_create_menu_option_singular {
			option = (<options> [<i>])
			z = <z>
		}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
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
			icon = (<option>.texture)
			pad_choose_script = (<option>.func)
			pad_choose_params = <func_params>
			icon_first = 0
			dont_force_quit = <dont_force_quit>
			pad_choose_sound = nullsound
		}
		gamemode_gettype
		if (<Type> = tutorial)
			add_generic_tutorial_menu_icon_item <params>
		else
			add_generic_barrel_menu_icon_item <params>
		endif
	else
		params = {
			text = (<option>.text)
			pad_choose_script = (<option>.func)
			pad_choose_params = <func_params>
			dont_force_quit = <dont_force_quit>
		}
		gamemode_gettype
		if (<Type> = tutorial)
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
	gamemode_gettype
	if (<Type> = tutorial)
		Change \{tutorial_paused = 0}
	endif
	clean_up_user_control_helpers
	set_focus_color
	set_unfocus_color
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		celeb_intro_ui_cont :se_setprops \{alpha = 1.0
			time = 0.1}
	endif
endscript

script ui_deinit_pausemenu 
	if ($is_network_game)
		enableallinput
	endif
endscript

script pause_menu_exit 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	if ($game_mode = freeplay)
		freeplay_prepare_for_unpause
	endif
	Wait \{1
		gameframe}
	handle_pause_event
endscript

script pause_menu_create_desc 
	gamemode_gettype
	if (<Type> = tutorial)
		tutorial_system_create_pausemenu_description pad_back_script = <pad_back_script> pad_back_params = <pad_back_params>
	else
		CreateScreenElement \{parent = root_window
			id = pause_menu_desc_id
			Type = descinterface
			desc = 'pause_menu'}
	endif
endscript

script pause_menu_destroy_desc 
	SoundEvent \{event = pause_menu_exit_sfx}
	gamemode_gettype
	if (<Type> = tutorial)
		tutorial_system_destroy_pausemenu_description
	else
		if ScreenElementExists \{id = pause_menu_desc_id}
			pause_menu_desc_id :Die
		endif
	endif
endscript

script enableallinput 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> controller
		if GotParam \{OFF}
			EnableInput controller = <controller> OFF
		else
			EnableInput controller = <controller>
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script ui_return_pausemenu 
	if ($is_network_game)
		if ScreenElementExists \{id = generic_barrel_vmenu}
			generic_barrel_vmenu :se_setprops \{unblock_events}
			LaunchEvent \{Type = focus
				target = generic_barrel_vmenu}
		endif
		add_gamertag_helper exclusive_device = ($last_start_pressed_device)
	endif
endscript

script pause_drop_player 
	printf \{qs(0x83bab1ce)}
	SpawnScriptNow unpause_and_drop_player params = <...>
endscript

script unpause_and_drop_player 
	gameplay_drop_player <...>
endscript

script pause_end_game 
	printf \{qs(0x090e92f1)}
	SpawnScriptNow unpause_and_endgame id = ui_player_drop_scripts params = <...>
endscript

script unpause_and_endgame 
	gameplay_end_game no_unpause <...>
endscript

script menu_pause_get_practice_speed_option 
	option2_func_params = {
		callback = practice_choose_change_speed
		data = {
			from_in_game = 1
		}
	}
	new_option = {
		text = qs(0xcc2da18b)
		func = ui_event
		func_params = {
			event = menu_change
			data = {
				state = uistate_pausemenu_quit_warning
				option2_text = qs(0xcc2da18b)
				option2_func = quit_warning_select_quit
				option2_func_params = <option2_func_params>
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
				state = uistate_pausemenu_quit_warning
				option2_text = qs(0x68bd3039)
				option2_func = quit_warning_select_quit
				option2_func_params = <option2_func_params>
			}
		}
	}
	return new_option = <new_option>
endscript
