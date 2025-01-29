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
	enable_ui_visualizer
	SoundEvent \{event = audio_ui_generic_select}
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
	if ScreenElementExists \{id = pause_menu_barrel_cont}
		pause_menu_barrel_cont :SetTags old_focus_scale = ($g_generic_barrel_menu_focus_scale)
	endif
	Change \{g_generic_barrel_menu_focus_scale = 1.12}
	gamemode_gettype
	game_mode_type = <Type>
	if (<game_mode_type> = tutorial)
		Change \{tutorial_paused = 1}
	else
		playlist_getcurrentsong
		get_song_title song = <current_song>
		pause_menu_desc_id :se_setprops {
			pause_menu_song_name_text = <song_title>
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
					{pad_back ui_sfx params = {menustate = Generic uitype = back}}
					{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {<pad_back_params>}}}
				]
			}
			LaunchEvent \{Type = focus
				target = generic_barrel_menu}
		else
			make_generic_barrel_menu {
				parent = pause_menu_barrel_cont
				Scale = 0.9
				pad_back_script = <pad_back_script>
				pad_back_params = <pad_back_params>
				exclusive_device = <player_device>
				z_priority = (<z> + 1)
			}
			if ($pause_menu_no_bg = 0)
			else
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_pause_menu_bg_cont
						param = pause_menu_bg_cont}
					<pause_menu_bg_cont> :se_setprops alpha = 0
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
		pause_menu_desc_id :se_setprops \{arrows_alpha = 0}
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
						shadow_enabled = true
						func = pause_menu_exit
					}
					AddArrayElement array = <options> element = <new_option>
					<options> = <array>
				endif
				<add_options> = 1
				if (<game_mode_type> = career)
					playlist_getcurrentsong
					if quest_progression_is_song_transformation song = <current_song>
						<add_options> = 0
					endif
				endif
				if NOT ininternetmode
					if (<add_options> = 1)
						if StructureContains \{structure = default_options
								restart}
							new_option = {
								text = qs(0xb8790f2f)
								shadow_enabled = true
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
								shadow_enabled = true
								func = ui_event
								func_params = {event = menu_change data = {state = uistate_pausemenu_change_difficulty player_device = <player_device> Player = <Player>}}
							}
							AddArrayElement array = <options> element = <new_option>
							<options> = <array>
						endif
						if NOT demobuild
							if isSinglePlayerGame
								if ($end_credits = 0)
									getplayerinfo <Player> difficulty
									if (<difficulty> != beginner)
										if NOT is_current_song_a_jam_session
											new_option = {
												text = qs(0x3ea7dec9)
												shadow_enabled = true
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
						if StructureContains \{structure = default_options
								options}
							new_option = {
								text = qs(0x976cf9e7)
								shadow_enabled = true
								func = ui_event
								func_params = {event = menu_change data = {state = uistate_pause_options player_device = <player_device> Player = <Player>}}
							}
							AddArrayElement array = <options> element = <new_option>
							<options> = <array>
						endif
					endif
				endif
				GetArraySize <custom_options>
				<custom_options_size> = <array_Size>
				if (<custom_options_size> > 0)
					<i> = 0
					<include_option> = 0
					begin
					<include_option> = 0
					if StructureContains structure = (<custom_options> [<i>]) inclusion_checks
						GetArraySize (<custom_options> [<i>].inclusion_checks)
						if (<array_Size> > 0)
							<j> = 0
							begin
							<inclusion_check> = (<custom_options> [<i>].inclusion_checks [<j>])
							if (<inclusion_check>)
								<include_option> = 1
							else
								<include_option> = 0
								break
							endif
							<j> = (<j> + 1)
							repeat <array_Size>
						else
							<include_option> = 1
						endif
					else
						<include_option> = 1
					endif
					if (<include_option> = 1)
						AddArrayElement array = <options> element = (<custom_options> [<i>])
						<options> = <array>
					endif
					<i> = (<i> + 1)
					repeat <custom_options_size>
				endif
				if StructureContains \{structure = default_options
						quit}
					if ininternetmode
						new_option = {
							text = qs(0x67d9c56d)
							shadow_enabled = true
							func = select_quit_network_game
							func_params = {from_pause_menu = 1}
						}
					else
						new_option = {
							text = qs(0x67d9c56d)
							shadow_enabled = true
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
						shadow_enabled = true
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
								shadow_enabled = true
							else
								<text> = qs(0xb8790f2f)
								shadow_enabled = true
							endif
							new_option = {
								text = <text>
								func = ui_event
								func_params = {event = menu_change data = {state = uistate_pausemenu_restart_warning}}
							}
							AddArrayElement array = <options> element = <new_option>
							<options> = <array>
							if (<game_mode_type> = tutorial)
								new_option = {
									text = qs(0xfceafb8f)
									shadow_enabled = true
									func = ui_event
									func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xfceafb8f) option2_func = tutorial_system_pausemenu_skip_lesson}}
								}
								AddArrayElement array = <options> element = <new_option>
								<options> = <array>
							endif
						endif
					endif
					if (<for_practice> = 1 || $game_mode = practice)
						getfirstplayer
						if NOT playerinfoequals <Player> part = vocals
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
								shadow_enabled = true
								func = generic_event_choose
								func_params = {
									state = uistate_pausemenu_quit_warning
									data = {
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
							shadow_enabled = true
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
													text = qs(0xea4574ef)
													shadow_enabled = true
													func = ui_event
													func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xea4574ef) option2_func = quickplay_skip_song failed_song}}
												}
												AddArrayElement array = <options> element = <new_option>
												<options> = <array>
											endif
											new_option = {
												text = qs(0xae6cf896)
												shadow_enabled = true
												func = ui_event
												func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xae6cf896) option2_func = quickplay_select_edit_playlist}}
											}
											AddArrayElement array = <options> element = <new_option>
											<options> = <array>
										endif
									endif
								endif
							else
								if ($end_credits = 0)
									if (<game_mode_type> != tutorial)
										new_option = {
											text = qs(0x9f281c76)
											shadow_enabled = true
											func = ui_event
											func_params = {event = menu_change data = {state = uistate_pausemenu_change_difficulty player_device = <player_device> Player = <Player>}}
										}
										AddArrayElement array = <options> element = <new_option>
										<options> = <array>
									endif
								endif
								if NOT ininternetmode
									if (<Type> = quickplay)
										GetArraySize \{$current_playlist}
										if (<array_Size> > 1)
											new_option = {
												text = qs(0xea4574ef)
												shadow_enabled = true
												func = ui_event
												func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xea4574ef) option2_func = quickplay_skip_song failed_song}}
											}
											AddArrayElement array = <options> element = <new_option>
											<options> = <array>
										endif
										if NOT demobuild
											new_option = {
												text = qs(0xae6cf896)
												shadow_enabled = true
												func = ui_event
												func_params = {event = menu_change data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xae6cf896) option2_func = quickplay_select_edit_playlist}}
											}
											AddArrayElement array = <options> element = <new_option>
											<options> = <array>
										endif
									endif
								endif
								if NOT demobuild
									if isSinglePlayerGame
										if ($end_credits = 0)
											if (<game_mode_type> != tutorial)
												getplayerinfo <Player> difficulty
												if (<difficulty> != beginner)
													new_option = {
														text = qs(0x3ea7dec9)
														shadow_enabled = true
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
							endif
							if ($end_credits = 0)
								if (<game_mode_type> != tutorial)
									new_option = {
										text = qs(0x976cf9e7)
										shadow_enabled = true
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
					if ($is_in_debug)
						if ($end_credits > 0)
							quit_script = debug_menu_quit_credits
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
					endif
					if (($end_credits = 0 || $is_in_debug = 1) && $calibrate_lag_enabled = 0)
						new_option = {
							text = qs(0x67d9c56d)
							shadow_enabled = true
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
					shadow_enabled = true
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
	if (<game_mode_type> = quickplay)
		pause_menu_add_quickplay_challenge_icons Player = <Player>
	elseif (<game_mode_type> = career)
		get_savegame_from_player Player = <Player>
		GetGlobalTags savegame = <savegame> career_progression_tags param = current_chapter
		if ((<current_chapter> != quest_chapter_midboss) && (<current_chapter> != quest_chapter_finale))
			pause_menu_add_single_career_power Player = ($g_net_leader_player_num) current_chapter = <current_chapter>
		else
			pause_menu_add_power_info_for_boss_battles current_chapter = <current_chapter>
		endif
	else
		if ScreenElementExists \{id = pause_menu_desc_id}
			pause_menu_desc_id :se_setprops \{power_bg_alpha = 0.0
				career_single_power_menu_alpha = 0.0
				pause_menu_challenges_cont_alpha = 0.0
				challenge_bg_alpha = 0.0
				career_boss_battle_powers_menu_alpha = 0.0}
		endif
	endif
	pause_menu_add_playlist
	if (<game_mode_type> != freeplay)
		add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
	endif
	add_user_control_helper controller = <controller> text = qs(0xaf4d5dd2) button = red z = 100000
	fadetoblack \{OFF
		time = 0.0
		no_wait}
	if (<game_mode_type> = career)
		debug_show_scoring_attributes parent = pause_menu_barrel_cont Player = <Player>
	endif
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
	repeat <array_Size>
endscript

script pause_menu_create_menu_option_singular 
	if StructureContains structure = <option> func_params
		<func_params> = (<option>.func_params)
	endif
	sound_func = audio_null_sound
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
			pad_choose_sound = audio_null_sound
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
	if ScreenElementExists \{id = pause_menu_barrel_cont}
		pause_menu_barrel_cont :GetSingleTag \{old_focus_scale}
	endif
	Change \{g_generic_barrel_menu_focus_scale = 1.5}
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
	disable_ui_visualizer
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
		if pause_menu_desc_id :desc_resolvealias \{Name = alias_pause_menu_barrel_cont}
			AssignAlias id = <resolved_id> alias = pause_menu_barrel_cont
		else
			ScriptAssert \{qs(0x71b1ba98)}
		endif
	endif
endscript

script pause_menu_destroy_desc 
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
	new_option = {
		text = qs(0xcc2da18b)
		func = ui_event
		func_params = {
			event = menu_change
			data = {
				state = uistate_pausemenu_quit_warning
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
				state = uistate_pausemenu_quit_warning
				option2_text = qs(0x68bd3039)
				option2_func = quit_warning_select_quit
				option2_func_params = <option2_func_params>
			}
		}
	}
	return new_option = <new_option>
endscript

script pause_menu_add_playlist 
	if ScreenElementExists \{id = pause_menu_desc_id}
		if pause_menu_desc_id :desc_resolvealias \{Name = alias_pause_menu_playlist_menu
				param = playlist_menu}
			playlist_getsize
			if (<playlist_size> > 0)
				playlist_getcurrentsongindex
				<i> = <current_song_index>
				if (<i> < <playlist_size>)
					<num_loops> = (<playlist_size> - <current_song_index>)
					if (<num_loops> > 1)
						<num_loops> = 1
					endif
					<display_counter> = 1
					begin
					playlist_getsongname index = <i>
					if song_is_jamsession song = <requested_song_name>
						get_jam_filename playlist_index = <i>
						<song_title> = <jam_display_name>
					else
						get_song_title song = <requested_song_name>
					endif
					formatText TextName = entry_text qs(0xda6f2e53) d = <display_counter> s = <song_title>
					CreateScreenElement {
						parent = <playlist_menu>
						Type = TextBlockElement
						dims = (400.0, 50.0)
						internal_just = [center , center]
						rgba = gh6_gold
						font = fontgrid_text_a1
						text = <entry_text>
						autosizedims = true
						fit_width = `scale	each	line	if	larger`
						fit_height = `scale	down	if	larger`
						scale_mode = proportional
						menurow_txt_item_shadow_enabled = true
					}
					<i> = (<i> + 1)
					<display_counter> = (<display_counter> + 1)
					repeat <num_loops>
					pause_menu_desc_id :se_setprops \{pause_menu_playlist_cont_alpha = 1}
				else
					pause_menu_desc_id :se_setprops \{pause_menu_playlist_cont_alpha = 0}
				endif
			endif
		endif
	endif
endscript

script pause_menu_add_quickplay_challenge_icons \{Player = !i1768515945}
	if GMan_GoalIsActive \{goal = quickplay}
		if ScreenElementExists \{id = pause_menu_desc_id}
			if isSinglePlayerGame
				if pause_menu_desc_id :desc_resolvealias \{Name = alias_pause_menu_challenges_menu_top
						param = top_menu_id}
					quickplay_get_challenge_outro_stats Player = <Player>
					GetArraySize <player_challenge_stats>
					if (<array_Size> > 0)
						pause_menu_add_badges_to_qp_challenge_menu {
							Player = <Player>
							challenge_stats = <player_challenge_stats>
							menu_id = <top_menu_id>
						}
						ui_song_breakdown_get_player_display_name player_index = <Player>
						getplayerinfo <Player> part
						ui_song_breakdown_get_player_instrument_texture part = <part>
						formatText TextName = label_text qs(0x09331952) p = <player_name_text>
						pause_menu_desc_id :se_setprops {
							top_instrum_icon_texture = <icon_texture>
							0x8c1a3132 = <label_text>
							pause_menu_challenges_cont_alpha = 1
							pause_menu_challenges_cont_bot_alpha = 0
							power_bg_alpha = 0.0
							career_boss_battle_powers_menu_alpha = 0.0
						}
					endif
				endif
			else
				if NOT pause_menu_desc_id :desc_resolvealias \{Name = alias_pause_menu_challenges_menu_top
						param = top_menu_id}
					ScriptAssert \{'Could not find pause_menu_challenges_menu_top in pause_menu desc'}
				endif
				if NOT pause_menu_desc_id :desc_resolvealias \{Name = alias_pause_menu_challenges_menu_bot
						param = bot_menu_id}
					ScriptAssert \{'Could not find pause_menu_challenges_menu_bot in pause_menu desc'}
				endif
				quickplay_get_challenge_outro_stats \{Player = 0}
				GetArraySize <player_challenge_stats>
				if (<array_Size> > 0)
					pause_menu_add_badges_to_qp_challenge_menu {
						Player = 0
						challenge_stats = <player_challenge_stats>
						menu_id = <top_menu_id>
					}
					pause_menu_desc_id :se_setprops \{top_instrum_icon_texture = icon_band}
				endif
				quickplay_get_challenge_outro_stats Player = <Player>
				GetArraySize <player_challenge_stats>
				if (<array_Size> > 0)
					pause_menu_add_badges_to_qp_challenge_menu {
						Player = <Player>
						challenge_stats = <player_challenge_stats>
						menu_id = <bot_menu_id>
					}
					getplayerinfo <Player> part
					ui_song_breakdown_get_player_instrument_texture part = <part>
					pause_menu_desc_id :se_setprops {
						bot_instrum_icon_texture = <icon_texture>
					}
				endif
				ui_song_breakdown_get_player_display_name player_index = <Player>
				formatText TextName = label_text qs(0xb1183ce5) p = <player_name_text>
				pause_menu_desc_id :se_setprops {
					0x8c1a3132 = qs(0x44c30062)
					0xad5f4b88 = <label_text>
					pause_menu_challenges_cont_alpha = 1
					pause_menu_challenges_cont_bot_alpha = 1
				}
			endif
		endif
	endif
endscript

script pause_menu_add_badges_to_qp_challenge_menu \{Player = !i1768515945
		challenge_stats = !a1768515945
		menu_id = !q1768515945}
	GetArraySize <challenge_stats>
	if (<array_Size> > 0)
		<i> = 0
		begin
		song_breakdown_create_badge_and_apply_progress_to_meter {
			badge_parent_id = <menu_id>
			challenge_stats = (<challenge_stats> [<i>])
			Player = <Player>
			badge_alpha = 1.0
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script pause_menu_add_single_career_power \{Player = !i1768515945
		current_chapter = !q1768515945}
	if ScreenElementExists \{id = pause_menu_desc_id}
		ui_song_breakdown_get_player_display_name player_index = <Player>
		<hero_info_global> = ($<current_chapter>.hero_info)
		<career_single_power_info_text> = qs(0x03ac90f0)
		getplayerinfo <Player> scoring
		if (<scoring> = 1)
			if StructureContains structure = ($<hero_info_global>) power_desc1
				<career_single_power_info_text> = ($<hero_info_global>.power_desc1)
			endif
		else
			if StructureContains structure = ($<hero_info_global>) power_desc2
				<career_single_power_info_text> = ($<hero_info_global>.power_desc2)
			endif
		endif
		pause_menu_desc_id :se_setprops {
			career_single_power_menu_alpha = 1.0
			power_bg_alpha = 0.0
			pause_menu_challenges_cont_alpha = 0.0
			career_boss_battle_powers_menu_alpha = 0.0
			career_single_gamertag_text = <player_name_text>
			career_single_power_title_text = ($<hero_info_global>.character_power)
			career_single_power_info_text = <career_single_power_info_text>
		}
	endif
endscript

script pause_menu_add_power_info_for_boss_battles \{current_chapter = !q1768515945}
	if ScreenElementExists \{id = pause_menu_desc_id}
		if pause_menu_desc_id :desc_resolvealias \{Name = alias_career_boss_battle_powers_menu
				param = powers_menu_id}
			GetScreenElementChildren id = <powers_menu_id>
			GetArraySize <children>
			if (<array_Size> > 0)
				<powers_menu_size> = <array_Size>
				<i> = 0
				<strip_count> = 0
				if (<current_chapter> = quest_chapter_midboss)
					GetArraySize ($quest_progression_unlocks)
					<progression_array_size> = <array_Size>
					if (<progression_array_size> > 0)
						begin
						<j> = 0
						GetArraySize ($quest_progression_unlocks [<i>])
						if (<array_Size> > 0)
							begin
							<quest_chapter_global> = ($quest_progression_unlocks [<i>] [<j>])
							<hero_info_global> = ($<quest_chapter_global>.hero_info)
							(<children> [<strip_count>]) :se_setprops {
								character_power_text = ($<hero_info_global>.character_power)
								alpha = 1.0
							}
							<strip_count> = (<strip_count> + 1)
							if (<strip_count> = <powers_menu_size>)
								break
							endif
							<j> = (<j> + 1)
							repeat <array_Size>
						endif
						if (<strip_count> = <powers_menu_size>)
							break
						endif
						<i> = (<i> + 1)
						repeat <progression_array_size>
					endif
				elseif (<current_chapter> = quest_chapter_finale)
				else
					ScriptAssert 'current chapter %c is not a boss battle!' c = <current_chapter>
				endif
				pause_menu_desc_id :se_setprops \{power_bg_alpha = 1.0
					career_single_power_menu_alpha = 0.0
					pause_menu_challenges_cont_alpha = 0.0
					challenge_bg_alpha = 0.0}
			endif
		endif
	endif
endscript
