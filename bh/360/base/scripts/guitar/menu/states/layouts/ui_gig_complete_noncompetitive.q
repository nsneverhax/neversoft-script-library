
script ui_init_gig_complete_noncompetitive 
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
endscript

script ui_create_gig_complete_noncompetitive 
	GameMode_GetType
	if (<type> = career)
		progression_reward_stars
		test_progression_based_achievements
		GMan_ChallengeManagerFunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		GMan_SongFunc \{func = get_songname_by_index
			params = {
				index = 0
			}}
		if ((($gh_songlist_props).<requested_song_name>.original_artist) = 0)
			artist_text = $cover_artist_text
		else
			artist_text = (($gh_songlist_props).<requested_song_name>.artist)
		endif
		song_name_text = (($gh_songlist_props).<requested_song_name>.Title)
		new_career_gig_select_get_gig_display_index_from_current_challenge venue_index = <venue_index>
	else
		gig_name = qs(0x9d9ffad1)
	endif
	get_current_band_name
	GetUpperCaseString <band_name>
	<band_name> = <UpperCaseString>
	CreateScreenElement {
		parent = root_window
		id = gig_complete_noncompetitive_id
		type = DescInterface
		desc = 'gig_summary'
		Pos = (0.0, 0.0)
		artist_text = <artist_text>
		song_name_text = <song_name_text>
		band_name_text = <band_name>
	}
	if gig_complete_noncompetitive_id :Desc_ResolveAlias \{name = alias_diamondBling
			param = diamondBling_id}
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal params = {minwidth = 100 maxwidth = 325 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if gig_complete_noncompetitive_id :Desc_ResolveAlias \{name = alias_diamondBling2
			param = diamondbling_id2}
		<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal params = {minwidth = 100 maxwidth = 325 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if InInternetMode
		event_handlers = [
			{pad_choose net_gig_complete_noncompetitive_continue_to_venue_select params = {autosave = 1}}
			{
				pad_option2
				net_ui_song_breakdown_show_players_list
				params = {
					screen_id = gig_complete_noncompetitive_id
					destroy_players_list_script = net_ui_gig_complete_destroy_players_list
				}
			}
			{pad_back postgame_lobby_quit params = {id = gig_complete_noncompetitive_id}}
		]
	else
		event_handlers = [
			{pad_choose ui_gig_complete_noncompetitive_continue_to_next_screen params = {gig_display_index = <gig_display_index>}}
		]
	endif
	gig_complete_noncompetitive_id :SE_SetProps {
		event_handlers = <event_handlers>
	}
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices \{band_leader_only}
		if ScreenElementExists \{id = gig_complete_noncompetitive_id}
			gig_complete_noncompetitive_id :SE_SetProps {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	if (<type> = career)
		ui_gig_complete_add_gig_data_and_handlers bot_play = <bot_play> current_challenge = <current_challenge>
		ui_gig_complete_handle_unlocked_rewards gig_display_index = <gig_display_index>
		GMan_ChallengeManagerFunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		if (<current_challenge> != None)
			GMan_PassCheckpoint goal = <current_challenge>
		endif
	else
		ui_gig_complete_add_gig_data_and_handlers bot_play = <bot_play>
	endif
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = set_current_challenge
		params = {
			challenge_id = None
		}}
	LaunchEvent \{type = focus
		target = gig_complete_noncompetitive_id}
	if gig_complete_noncompetitive_id :Desc_ResolveAlias \{name = alias_gig_sum_illo_anim
			param = BG1_id}
		<BG1_id> :Obj_SpawnScript ui_shakey
	else
		ScriptAssert \{'UI_art'}
	endif
	if gig_complete_noncompetitive_id :Desc_ResolveAlias \{name = alias_gig_sum_illo_anim
			param = BG1_id}
		<BG1_id> :Obj_SpawnScript ui_frazzmatazz
	else
		ScriptAssert \{'UI_art'}
	endif
	if gig_complete_noncompetitive_id :Desc_ResolveAlias \{name = alias_bkg_anim
			param = bkg_id}
		<bkg_id> :Obj_SpawnScript ui_alphablast
	else
		ScriptAssert \{'UI_art'}
	endif
endscript

script ui_destroy_gig_complete_noncompetitive 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = gig_complete_noncompetitive_id}
		gig_complete_noncompetitive_id :GetSingleTag \{players_list_id}
		if ScreenElementExists id = <players_list_id>
			DestroyScreenElement id = <players_list_id>
		endif
		DestroyScreenElement \{id = gig_complete_noncompetitive_id}
	endif
endscript

script ui_return_gig_complete_noncompetitive 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = gig_complete_noncompetitive_id}
		if NOT ScreenElementExists \{id = band_lobby_popup_menu}
			if InInternetMode
				GetPlayerInfo ($g_net_leader_player_num) is_local_client
				if (<is_local_client> = 1)
					add_user_control_helper \{text = qs(0x182f0173)
						button = green
						z = 100000}
				endif
				add_user_control_helper \{text = qs(0x67d9c56d)
					button = red
					z = 100000}
				add_user_control_helper \{text = qs(0xd16792bf)
					button = yellow
					z = 100000}
			else
				add_user_control_helper \{text = qs(0x182f0173)
					button = green
					z = 100000}
			endif
			ui_gig_complete_handle_unlocked_rewards
			LaunchEvent \{type = focus
				target = gig_complete_noncompetitive_id}
		else
			band_lobby_update_button_helpers controller = ($primary_controller) Menu = playerslist
		endif
	endif
endscript

script ui_gig_complete_add_gig_data_and_handlers 
	RequireParams \{[
			bot_play
		]
		all}
	max_song_stars = 6
	max_song_stars_no_fc = ($max_song_stars)
	if GotParam \{current_challenge}
		ui_gig_complete_handle_challenge_strip current_challenge = <current_challenge>
	else
		ui_gig_complete_handle_challenge_strip
	endif
	if ScreenElementExists \{id = gig_complete_noncompetitive_id}
		GMan_SongFunc \{func = get_playlist_size}
		if (<playlist_size> > 0)
			total_stars_earned = 0
			GameMode_GetType
			if (<type> = career)
				songs_menu_alias = alias_gig_summary_career_list
			else
				songs_menu_alias = alias_gig_summary_qp_list
				gig_complete_noncompetitive_id :SE_SetProps \{gig_summary_line_challenge_alpha = 0}
			endif
			if gig_complete_noncompetitive_id :Desc_ResolveAlias name = <songs_menu_alias>
				songs_menu_id = <resolved_id>
				GetSongStatsHistory
				if GotParam \{song_stats_history}
					get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
					GetPlayerInfo <player_num> Band
					i = 0
					num_bonus_stars_earned = 0
					begin
					GMan_SongFunc func = get_songname_by_index params = {index = <i>}
					<score> = (<song_stats_history> [<i>] [(<Band> - 1)].band_score)
					<num_stars> = (<song_stats_history> [<i>] [(<Band> - 1)].band_stars)
					if (<num_stars> = <max_song_stars>)
						<num_bonus_stars_earned> = (<num_bonus_stars_earned> + 1)
					endif
					<total_stars_earned> = (<total_stars_earned> + <num_stars>)
					CastToInteger \{score}
					FormatText TextName = score_text qs(0x4d4555da) s = <score> UseCommas
					CreateScreenElement {
						parent = <songs_menu_id>
						type = DescInterface
						desc = 'gig_summary_line_song'
						song_name_text = (($gh_songlist_props).<requested_song_name>.Title)
						song_score_text = <score_text>
						autoSizeDims = true
					}
					star_rgba = [255 255 255 255]
					if ((<song_stats_history> [<i>] [(<Band> - 1)].is_gold_stars) = 1)
						star_rgba = GH5_gold_md
					endif
					if <id> :Desc_ResolveAlias name = alias_song_stars
						GetScreenElementChildren id = <resolved_id>
						GetArraySize <children>
						stars_size = <array_size>
						if (<stars_size> > 0)
							j = 0
							begin
							GetRandomValue \{a = 15
								b = 15
								name = star_rotation
								integer}
							(<children> [<j>]) :SE_SetProps rot_angle = <star_rotation>
							<j> = (<j> + 1)
							repeat <stars_size>
						endif
						if (<num_stars> < <max_song_stars>)
							<j> = 0
							begin
							(<children> [<j>]) :SE_SetProps alpha = 0
							<j> = (<j> + 1)
							repeat (<max_song_stars> - <num_stars>)
						endif
						<j> = 0
						begin
						(<children> [<j>]) :SE_SetProps rgba = <star_rgba>
						<j> = (<j> + 1)
						repeat <max_song_stars>
					endif
					<i> = (<i> + 1)
					repeat <playlist_size>
				endif
				if (<bot_play> = 0)
					song_breakdown_get_exclusive_devices \{band_leader_only}
					<songs_menu_id> :SE_SetProps {
						exclusive_device = <exclusive_devices>
					}
				endif
				total_stars_possible = ((<max_song_stars_no_fc> * <playlist_size>) + <num_bonus_stars_earned>)
				localized_of = qs(0x8e590b97)
				if ((GotParam max_challenge_stars) && (GotParam earned_challenge_stars))
					<total_stars_earned> = (<total_stars_earned> + <earned_challenge_stars>)
					<total_stars_possible> = (<total_stars_possible> + <max_challenge_stars>)
					FormatText TextName = total_text qs(0x15c1b436) e = <total_stars_earned> t = <total_stars_possible> o = <localized_of>
				else
					FormatText TextName = total_text qs(0x15c1b436) e = <total_stars_earned> t = <total_stars_possible> o = <localized_of>
				endif
				total_number_rgba = [255 255 255 255]
				if (<num_bonus_stars_earned> > 0)
					total_number_rgba = [207 159 43 255]
				endif
				gig_complete_noncompetitive_id :SE_SetProps {
					total_number_text = <total_text>
					total_number_rgba = <total_number_rgba>
				}
				ui_gig_complete_noncompetitive_add_player_data {
					stars_earned = <total_stars_earned>
				}
				if InInternetMode
					GetPlayerInfo ($g_net_leader_player_num) is_local_client
					if (<is_local_client> = 1)
						add_user_control_helper \{text = qs(0x182f0173)
							button = green
							z = 100000}
					endif
					add_user_control_helper \{text = qs(0x67d9c56d)
						button = red
						z = 100000}
					add_user_control_helper \{text = qs(0xd16792bf)
						button = yellow
						z = 100000}
				else
					add_user_control_helper \{text = qs(0x182f0173)
						button = green
						z = 100000}
				endif
				LaunchEvent type = focus target = <songs_menu_id>
			endif
		endif
	endif
endscript

script ui_gig_complete_noncompetitive_add_player_data 
	RequireParams \{[
			stars_earned
		]
		all}
	if ScreenElementExists \{id = gig_complete_noncompetitive_id}
		if gig_complete_noncompetitive_id :Desc_ResolveAlias \{name = alias_player_info
				param = player_menu_id}
			GameMode_GetType
			GetNumPlayersInGame \{on_screen
				local}
			if (<num_players_shown> > 0)
				if IsPS3
					<num_players_shown> = 1
				endif
				GetFirstPlayer \{on_screen
					local}
				begin
				GetPlayerInfo <player> part
				ui_song_breakdown_get_player_instrument_texture part = <part>
				ui_song_breakdown_get_player_display_name player_index = <player>
				challenge_icon_alpha = 0
				if (<type> = career)
					GetPlayerInfo <player> is_local_client
					if (<is_local_client> = 1)
						GetPlayerInfo <player> bot_play
						if (<bot_play> = 1)
							GetPlayerInfo <player> bot_original_controller
							controller = <bot_original_controller>
						else
							GetPlayerInfo <player> controller
						endif
						get_savegame_from_controller controller = <controller>
						get_current_progression_stars savegame = <savegame>
						if ((<total_stars> - <stars_earned>) <= 0)
							stars_text = qs(0x3bf547a6)
						else
							FormatText TextName = stars_text qs(0x73307931) s = (<total_stars> - <stars_earned>) UseCommas
						endif
					else
						FormatText \{TextName = stars_text
							qs(0x3bf547a6)
							UseCommas}
					endif
				else
					FormatText \{TextName = stars_text
						qs(0x3bf547a6)
						UseCommas}
				endif
				CreateScreenElement {
					parent = <player_menu_id>
					type = ContainerElement
					pos_anchor = [left , top]
					just = [center , center]
					dims = (280.0, 185.0)
				}
				CreateScreenElement {
					parent = <id>
					type = DescInterface
					desc = 'gig_summary_player'
					pos_anchor = [center , center]
					just = [center , center]
					Pos = (0.0, 15.0)
					autoSizeDims = true
					player_name_text = <player_name_text>
					icon_instrument_texture = <icon_texture>
					stars_number_text = <stars_text>
				}
				if <id> :Desc_ResolveAlias name = alias_diamondBling3 param = diamondbling_id3
					<diamondbling_id3> :Obj_SpawnScript anim_bling_small params = {minradius = 10 maxradius = 50 maxtime = 0.5}
				else
					ScriptAssert \{'UI_art'}
				endif
				if <id> :Desc_ResolveAlias name = alias_diamondBling4 param = diamondbling_id4
					<diamondbling_id4> :Obj_SpawnScript anim_bling_small params = {minradius = 10 maxradius = 50 maxtime = 0.5}
				else
					ScriptAssert \{'UI_art'}
				endif
				GetNextPlayer on_screen local player = <player>
				repeat <num_players_shown>
			endif
		endif
		gig_complete_noncompetitive_id :Obj_SpawnScriptNow {
			ui_gig_complete_animate_player_stars_total
			params = {
				gig_stars_earned = <stars_earned>
			}
		}
	endif
endscript

script ui_gig_complete_animate_player_stars_total 
	RequireParams \{[
			gig_stars_earned
		]
		all}
	if ScreenElementExists \{id = gig_complete_noncompetitive_id}
		if gig_complete_noncompetitive_id :Desc_ResolveAlias \{name = alias_player_info}
			wait \{1.0
				seconds}
			GetScreenElementChildren id = <resolved_id>
			menu_children = <children>
			GetArraySize <menu_children>
			menu_size = <array_size>
			GameMode_GetType
			GetNumPlayersInGame \{on_screen
				local}
			if IsPS3
				<num_players_shown> = 1
			endif
			if (<menu_size> != <num_players_shown>)
				ScriptAssert \{'num players shown does not match number of player panels!'}
			endif
			if (<num_players_shown> > 0)
				GetFirstPlayer \{on_screen}
				i = 0
				begin
				if (<type> = career)
					GetPlayerInfo <player> is_local_client
					if (<is_local_client> = 1)
						GetPlayerInfo <player> bot_play
						if (<bot_play> = 1)
							GetPlayerInfo <player> bot_original_controller
							controller = <bot_original_controller>
						else
							GetPlayerInfo <player> controller
						endif
						get_savegame_from_controller controller = <controller>
						get_current_progression_stars savegame = <savegame>
						stars_counter = <total_stars>
						if (<stars_counter> > 0)
							<stars_counter> = (<stars_counter> - <gig_stars_earned>)
						endif
					else
						stars_counter = 0
					endif
				else
					stars_counter = 0
				endif
				GetScreenElementChildren id = (<menu_children> [<i>])
				GetArraySize <children>
				if (<array_size> != 1)
					ScriptAssert \{'Player patches in container is not 1!'}
				endif
				if (<gig_stars_earned> > 0)
					<x> = 0
					begin
					<x> = (<x> + 1)
					SoundEvent \{event = Star_Counter_01}
					if (<x> = <gig_stars_earned>)
						SoundEvent \{event = Star_Counter_02}
					endif
					<stars_counter> = (<stars_counter> + 1)
					FormatText TextName = stars_text qs(0x73307931) s = <stars_counter>
					if ScreenElementExists id = (<children> [0])
						(<children> [0]) :SE_SetProps {
							stars_number_text = <stars_text>
							time = 0.08
						}
						(<children> [0]) :SE_WaitProps
					endif
					repeat <gig_stars_earned>
				endif
				GetNextPlayer on_screen player = <player>
				<i> = (<i> + 1)
				repeat <num_players_shown>
			endif
		endif
	endif
endscript

script ui_gig_complete_noncompetitive_continue_to_next_screen 
	RequireParams \{[
			device_num
		]
		all}
	if (<device_num> = ($primary_controller))
		GetPakManCurrent \{map = zones}
		if (<pak> != z_Studio)
			GameMode_GetType
			if (<type> != career)
				spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
					params = {
						BG_SFX_Area = FrontEnd_Menu_Music
					}}
			else
				printf \{channel = sfx
					qs(0x790ef21d)}
			endif
		endif
		GameMode_GetType
		if (<type> = career)
			if GotParam \{go_to_rewards}
				RequireParams \{[
						rewards_just_unlocked
					]
					all}
				ui_gig_complete_find_cas_reward rewards = <rewards_just_unlocked>
				reward_progression_index = ((<rewards_just_unlocked> [<reward_index>]).reward_progression_index)
				unlock_struct = {reward_progression_index = <reward_progression_index>}
				venue_checksum = None
				ui_gig_complete_check_if_venue_unlocked rewards = <rewards_just_unlocked>
				if (<reward_index> != -1)
					venue_checksum = ((<rewards_just_unlocked> [<reward_index>]).venue_checksum)
				endif
				generic_event_choose {
					state = UIstate_rewards_unlocked
					data = {
						unlock_struct = <unlock_struct>
						venue_checksum = <venue_checksum>
						gig_display_index = <gig_display_index>
					}
				}
			else
				gig_complete_noncompetitive_get_venue_index
				if ($end_credits = 1)
					generic_menu_pad_choose_sound
					unlock_and_goto_credits
					return
				endif
				if GotParam \{venue_index}
					generic_menu_pad_choose_sound
					ui_memcard_autosave_all_players event = menu_back state = UIstate_career_gig_select data = {venue_index = <venue_index> gig_display_index = <gig_display_index>}
				else
					generic_menu_pad_choose_sound
					ui_memcard_autosave_all_players \{event = menu_back
						state = UIstate_career_venue_select}
				endif
				if ($end_credits = 2)
					Change \{end_credits = 0}
				endif
			endif
		else
			state = uistate_songlist
			if NOT ui_event_exists_in_stack \{name = 'songlist'}
				state = uistate_mainmenu
			endif
			generic_event_back state = <state>
		endif
	endif
endscript

script gig_complete_noncompetitive_continue_to_band_lobby 
	RequireParams \{[
			autosave
		]
		all}
	if (<autosave> = 1)
		ui_memcard_autosave_all_players \{event = menu_back
			state = UIstate_band_lobby_setup}
	else
		generic_event_back \{state = UIstate_band_lobby_setup}
	endif
endscript

script net_gig_complete_noncompetitive_continue_to_band_lobby 
	RequireParams \{[
			autosave
		]
		all}
	if IsHost
		SendStructure callback = gig_complete_noncompetitive_continue_to_band_lobby data_to_send = {autosave = <autosave>}
		gig_complete_noncompetitive_continue_to_band_lobby autosave = <autosave>
	else
		SendStructure callback = net_gig_complete_noncompetitive_continue_to_band_lobby data_to_send = {autosave = <autosave>}
	endif
endscript

script gig_complete_noncompetitive_continue_to_venue_select 
	RequireParams \{[
			autosave
		]
		all}
	if (<autosave> = 1)
		ui_event_wait_for_safe
		if ui_event_is_top_popup
			generic_event_back
			ui_event_wait_for_safe
		endif
		ui_memcard_autosave_all_players \{event = menu_back
			state = UIstate_career_venue_select}
	else
		generic_event_back \{state = UIstate_career_venue_select}
	endif
endscript

script net_gig_complete_noncompetitive_continue_to_venue_select 
	RequireParams \{[
			autosave
			device_num
		]
		all}
	GetPlayerInfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		GetPlayerInfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		GetPlayerInfo ($g_net_leader_player_num) controller
	endif
	if (<device_num> = <controller>)
		SendStructure callback = gig_complete_noncompetitive_continue_to_venue_select data_to_send = {autosave = <autosave>}
		gig_complete_noncompetitive_continue_to_venue_select autosave = <autosave>
	endif
endscript

script gig_complete_noncompetitive_continue_to_rewards 
	RequireParams \{[
			unlock_struct
		]}
	if GotParam \{venue_checksum}
		if ui_event_is_top_popup
			generic_event_replace {
				state = UIstate_rewards_unlocked
				data = {
					unlock_struct = <unlock_struct>
					venue_checksum = <venue_checksum>
				}
			}
		else
			generic_event_choose {
				state = UIstate_rewards_unlocked
				data = {
					unlock_struct = <unlock_struct>
					venue_checksum = <venue_checksum>
				}
			}
		endif
	else
		if ui_event_is_top_popup
			generic_event_replace {
				state = UIstate_rewards_unlocked
				data = {
					unlock_struct = <unlock_struct>
				}
			}
		else
			generic_event_choose {
				state = UIstate_rewards_unlocked
				data = {
					unlock_struct = <unlock_struct>
				}
			}
		endif
	endif
endscript

script net_gig_complete_noncompetitive_continue_to_rewards 
	RequireParams \{[
			unlock_struct
			device_num
		]}
	GetPlayerInfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		GetPlayerInfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		GetPlayerInfo ($g_net_leader_player_num) controller
	endif
	if (<device_num> = <controller>)
		if GotParam \{venue_checksum}
			SendStructure {
				callback = gig_complete_noncompetitive_continue_to_rewards
				data_to_send = {
					unlock_struct = <unlock_struct>
					venue_checksum = <venue_checksum>
				}
			}
			gig_complete_noncompetitive_continue_to_rewards {
				unlock_struct = <unlock_struct>
				venue_checksum = <venue_checksum>
			}
		else
			SendStructure {
				callback = gig_complete_noncompetitive_continue_to_rewards
				data_to_send = {
					unlock_struct = <unlock_struct>
				}
			}
			gig_complete_noncompetitive_continue_to_rewards {
				unlock_struct = <unlock_struct>
			}
		endif
	endif
endscript

script gig_complete_noncompetitive_continue_to_venue_unlock 
	RequireParams \{[
			venue_checksum
		]}
	if NOT InInternetMode
		RequireParams \{[
				device_num
			]
			all}
		if (<device_num> != ($primary_controller))
			return
		endif
	endif
	if ui_event_is_top_popup
		generic_event_replace {
			state = UIstate_unlock_venue
			data = {
				load_venue_checksum = <venue_checksum>
			}
		}
	else
		generic_event_choose {
			state = UIstate_unlock_venue
			data = {
				load_venue_checksum = <venue_checksum>
			}
		}
	endif
endscript

script net_gig_complete_noncompetitive_continue_to_venue_unlock 
	RequireParams \{[
			venue_checksum
			device_num
		]}
	GetPlayerInfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		GetPlayerInfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		GetPlayerInfo ($g_net_leader_player_num) controller
	endif
	if (<device_num> = <controller>)
		SendStructure {
			callback = gig_complete_noncompetitive_continue_to_venue_unlock
			data_to_send = {
				venue_checksum = <venue_checksum>
			}
		}
		gig_complete_noncompetitive_continue_to_venue_unlock {
			venue_checksum = <venue_checksum>
		}
	endif
endscript

script gig_complete_noncompetitive_get_venue_index 
	GMan_VenueFunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	GetArraySize ($progression_gig_list)
	if (<array_size> > 0)
		i = 0
		begin
		if ((($progression_gig_list) [<i>]).venue = <current_venue>)
			return venue_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_gig_complete_handle_challenge_strip 
	if ScreenElementExists \{id = gig_complete_noncompetitive_id}
		GameMode_GetType
		if (<type> = career && $end_credits = 0)
			RequireParams \{[
					current_challenge
				]
				all}
			get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
			progression_get_gig_challenge_stars_earned gig_name = <current_challenge> player = <player_num>
			gig_complete_get_challenge_level_text_and_icon level_earned = <highest_earned>
			gig_complete_noncompetitive_id :SE_SetProps {
				gig_summary_line_challenge_alpha = 1
				challenge_name_text = <challenge_text>
				challenge_icon_texture = <challenge_icon>
				zero_stars_alpha = 0
			}
			if (<highest_earned> <= 1)
				gig_complete_noncompetitive_id :SE_SetProps \{challenge_icon_alpha = 0}
				GetRandomValue \{a = 15
					b = 15
					name = star_rotation
					integer}
				gig_complete_noncompetitive_id :SE_SetProps {
					zero_stars_alpha = 1
					zero_star_rot_angle = <star_rotation>
				}
			endif
			progression_get_gig_star_rewards gig_name = <current_challenge>
			max_challenge_stars = 0
			<max_challenge_stars> = (<max_challenge_stars> + (<gig_star_rewards>.gold))
			<max_challenge_stars> = (<max_challenge_stars> + (<gig_star_rewards>.platinum))
			<max_challenge_stars> = (<max_challenge_stars> + (<gig_star_rewards>.diamond))
			if gig_complete_noncompetitive_id :Desc_ResolveAlias \{name = alias_challenge_stars}
				GetScreenElementChildren id = <resolved_id>
				GetArraySize <children>
				if (<array_size> > 0)
					i = 0
					begin
					GetRandomValue \{a = 15
						b = 15
						name = star_rotation
						integer}
					(<children> [<i>]) :SE_SetProps rot_angle = <star_rotation>
					<i> = (<i> + 1)
					repeat <array_size>
				endif
				if (<challenge_stars> < 6)
					<i> = 0
					begin
					(<children> [<i>]) :SE_SetProps alpha = 0
					<i> = (<i> + 1)
					repeat (6 - <challenge_stars>)
				endif
			endif
			return {
				max_challenge_stars = <max_challenge_stars>
				earned_challenge_stars = <challenge_stars>
			}
		else
			gig_complete_noncompetitive_id :SE_SetProps \{gig_summary_line_challenge_alpha = 0}
		endif
	endif
endscript

script ui_gig_complete_handle_unlocked_rewards 
	progression_get_rewards_just_unlocked
	printstruct <rewards_just_unlocked>
	GetArraySize <rewards_just_unlocked>
	if InInternetMode
		if IsHost
			ui_gig_complete_handle_unlocked_rewards_for_local_or_hosts rewards = <rewards_just_unlocked> rewards_size = <array_size>
		else
			ui_gig_complete_find_cas_reward rewards = <rewards_just_unlocked>
			if GotParam \{reward_index}
				reward_progression_index = ((<rewards_just_unlocked> [<reward_index>]).reward_progression_index)
				SendStructure {
					callback = net_gig_complete_handle_unlocked_rewards
					data_to_send = {
						unlock_struct = {reward_progression_index = <reward_progression_index>}
					}
				}
			endif
		endif
	else
		ui_gig_complete_handle_unlocked_rewards_for_local_or_hosts rewards = <rewards_just_unlocked> rewards_size = <array_size> gig_display_index = <gig_display_index>
	endif
endscript

script ui_gig_complete_handle_unlocked_rewards_for_local_or_hosts 
	RequireParams \{[
			rewards
			rewards_size
		]
		all}
	if (<rewards_size> > 0)
		if ScreenElementExists \{id = gig_complete_noncompetitive_id}
			array = []
			ui_gig_complete_find_cas_reward rewards = <rewards>
			if GotParam \{reward_index}
				if InInternetMode
					cas_index = <reward_index>
					state_params = {}
					AddParam {
						structure_name = state_params
						name = unlock_struct
						value = {reward_progression_index = ((<rewards> [<cas_index>]).reward_progression_index)}
					}
					ui_gig_complete_check_if_venue_unlocked rewards = <rewards>
					if GotParam \{reward_index}
						if (<reward_index> != -1)
							AddParam {
								structure_name = state_params
								name = venue_checksum
								value = ((<rewards> [<reward_index>]).venue_checksum)
							}
						endif
					endif
					AddArrayElement {
						array = <array>
						element = {
							pad_choose
							net_gig_complete_noncompetitive_continue_to_rewards
							params = <state_params>
						}
					}
					AddArrayElement {
						array = <array>
						element = {
							pad_back
							postgame_lobby_quit
							params = {id = gig_complete_noncompetitive_id}
						}
					}
					AddArrayElement {
						array = <array>
						element = {
							pad_option2
							net_ui_song_breakdown_show_players_list
							params = {
								screen_id = gig_complete_noncompetitive_id
								destroy_players_list_script = net_ui_gig_complete_destroy_players_list
							}
						}
					}
				else
					AddArrayElement {
						array = <array>
						element = {
							pad_choose
							ui_gig_complete_noncompetitive_continue_to_next_screen
							params = {
								go_to_rewards
								rewards_just_unlocked = <rewards>
								gig_display_index = <gig_display_index>
							}
						}
					}
				endif
				gig_complete_noncompetitive_id :SE_SetProps {
					event_handlers = <array>
					replace_handlers
				}
			else
				ui_gig_complete_handle_unlocked_venue
			endif
		endif
	endif
endscript

script net_gig_complete_handle_unlocked_rewards 
	if ScreenElementExists \{id = gig_complete_noncompetitive_id}
		progression_get_rewards_just_unlocked
		ui_gig_complete_check_if_venue_unlocked rewards = <rewards_just_unlocked>
		if (<reward_index> != -1)
			gig_complete_noncompetitive_id :SE_SetProps {
				event_handlers = [
					{
						pad_choose
						net_gig_complete_noncompetitive_continue_to_rewards
						params = {
							unlock_struct = <unlock_struct>
							venue_checksum = ((<rewards_just_unlocked> [<reward_index>]).venue_checksum)
						}
					}
					{pad_back postgame_lobby_quit params = {id = gig_complete_noncompetitive_id}}
					{
						pad_option2
						net_ui_song_breakdown_show_players_list
						params = {
							screen_id = gig_complete_noncompetitive_id
							destroy_players_list_script = net_ui_gig_complete_destroy_players_list
						}
					}
				]
				replace_handlers
			}
		else
			gig_complete_noncompetitive_id :SE_SetProps {
				event_handlers = [
					{
						pad_choose
						net_gig_complete_noncompetitive_continue_to_rewards
						params = {
							unlock_struct = <unlock_struct>
						}
					}
					{pad_back postgame_lobby_quit params = {id = gig_complete_noncompetitive_id}}
					{
						pad_option2
						net_ui_song_breakdown_show_players_list
						params = {
							screen_id = gig_complete_noncompetitive_id
							destroy_players_list_script = net_ui_gig_complete_destroy_players_list
						}
					}
				]
				replace_handlers
			}
		endif
	endif
endscript

script ui_gig_complete_handle_unlocked_venue 
	progression_get_rewards_just_unlocked
	GetArraySize <rewards_just_unlocked>
	if (<array_size> > 0)
		if ScreenElementExists \{id = gig_complete_noncompetitive_id}
			array = []
			ui_gig_complete_check_if_venue_unlocked rewards = <rewards_just_unlocked>
			if (<reward_index> != -1)
				if InInternetMode
					AddArrayElement {
						array = <array>
						element = {
							pad_choose
							net_gig_complete_noncompetitive_continue_to_venue_unlock
							params = {
								venue_checksum = (<rewards_just_unlocked> [<reward_index>].venue_checksum)
							}
						}
					}
					AddArrayElement {
						array = <array>
						element = {
							pad_back
							postgame_lobby_quit
							params = {id = gig_complete_noncompetitive_id}
						}
					}
					AddArrayElement {
						array = <array>
						element = {
							pad_option2
							net_ui_song_breakdown_show_players_list
							params = {
								screen_id = gig_complete_noncompetitive_id
								destroy_players_list_script = net_ui_gig_complete_destroy_players_list
							}
						}
					}
				else
					AddArrayElement {
						array = <array>
						element = {
							pad_choose
							gig_complete_noncompetitive_continue_to_venue_unlock
							params = {
								venue_checksum = (<rewards_just_unlocked> [<reward_index>].venue_checksum)
							}
						}
					}
				endif
			else
				if InInternetMode
					AddArrayElement {
						array = <array>
						element = {pad_choose net_gig_complete_noncompetitive_continue_to_venue_select params = {autosave = 1}}
					}
					AddArrayElement {
						array = <array>
						element = {
							pad_back
							postgame_lobby_quit
							params = {id = gig_complete_noncompetitive_id}
						}
					}
					AddArrayElement {
						array = <array>
						element = {
							pad_option2
							net_ui_song_breakdown_show_players_list
							params = {
								screen_id = gig_complete_noncompetitive_id
								destroy_players_list_script = net_ui_gig_complete_destroy_players_list
							}
						}
					}
				else
					AddArrayElement {
						array = <array>
						element = {pad_choose ui_gig_complete_noncompetitive_continue_to_next_screen}
					}
				endif
			endif
			gig_complete_noncompetitive_id :SE_SetProps {
				event_handlers = <array>
				replace_handlers
			}
		endif
	endif
endscript

script ui_gig_complete_check_if_venue_unlocked 
	RequireParams \{[
			rewards
		]
		all}
	GetArraySize <rewards>
	if (<array_size> > 0)
		i = 0
		begin
		if ((<rewards> [<i>].reward_type) = venue)
			return reward_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{reward_index = -1}
endscript

script ui_gig_complete_check_if_only_rewards_are_venues 
	RequireParams \{[
			rewards
		]
		all}
	only_venues = 1
	GetArraySize <rewards>
	if (<array_size> > 0)
		i = 0
		begin
		if ((<rewards> [<i>].reward_type) != venue)
			only_venues = 0
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return only_venues = <only_venues>
endscript

script ui_gig_complete_find_cas_reward 
	RequireParams \{[
			rewards
		]
		all}
	GetArraySize <rewards>
	if (<array_size> > 0)
		i = 0
		begin
		if ((<rewards> [<i>].reward_type) = CAS || (<rewards> [<i>].reward_type) = CAS_texture || (<rewards> [<i>].reward_type) = character || (<rewards> [<i>].reward_type) = venue_reward || (<rewards> [<i>].reward_type) = cheat)
			return reward_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script gig_complete_get_challenge_level_text_and_icon 
	RequireParams \{[
			level_earned
		]
		all}
	switch <level_earned>
		case 0
		challenge_text = qs(0x03ac90f0)
		challenge_icon = icon_difficulty_vinyl
		case 1
		challenge_text = qs(0xe78ba1cb)
		challenge_icon = icon_difficulty_vinyl
		case 2
		challenge_text = qs(0xf1d0061a)
		challenge_icon = icon_difficulty_gold
		case 3
		challenge_text = qs(0x4235551d)
		challenge_icon = icon_difficulty_platinum
		case 4
		challenge_text = qs(0xa0f57e4b)
		challenge_icon = icon_difficulty_diamond
		default
		challenge_text = qs(0x03ac90f0)
		challenge_icon = icon_difficulty_vinyl
	endswitch
	return {
		challenge_text = <challenge_text>
		challenge_icon = <challenge_icon>
	}
endscript

script net_ui_gig_complete_destroy_players_list 
	RequireParams \{[
			players_list_id
		]
		all}
	DestroyScreenElement id = <players_list_id>
	LaunchEvent \{type = focus
		target = gig_complete_noncompetitive_id}
	GameMode_GetType
	if (<type> = career)
		songs_menu_alias = alias_gig_summary_career_list
	else
		songs_menu_alias = alias_gig_summary_qp_list
	endif
	if gig_complete_noncompetitive_id :Desc_ResolveAlias name = <songs_menu_alias>
		LaunchEvent type = focus target = <resolved_id>
	endif
	clean_up_user_control_helpers
	if InInternetMode
		GetPlayerInfo ($g_net_leader_player_num) is_local_client
		if (<is_local_client> = 1)
			add_user_control_helper \{text = qs(0x182f0173)
				button = green
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0x67d9c56d)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0xd16792bf)
			button = yellow
			z = 100000}
	else
		add_user_control_helper \{text = qs(0x182f0173)
			button = green
			z = 100000}
	endif
endscript
