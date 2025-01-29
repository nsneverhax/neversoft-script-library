
script ui_init_gig_complete_noncompetitive 
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
endscript

script ui_create_gig_complete_noncompetitive 
	gamemode_gettype
	if (<Type> = career)
		progression_reward_stars
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		gman_songfunc \{func = get_songname_by_index
			params = {
				index = 0
			}}
		if ((($gh_songlist_props).<requested_song_name>.original_artist) = 0)
			artist_text = qs(0x13c0666a)
		else
			artist_text = (($gh_songlist_props).<requested_song_name>.artist)
		endif
		song_name_text = (($gh_songlist_props).<requested_song_name>.title)
		new_career_gig_select_get_gig_display_index_from_current_challenge venue_index = <venue_index>
	else
		gig_name = qs(0x9d9ffad1)
	endif
	get_current_band_name
	GetUpperCaseString <band_name>
	<band_name> = <UppercaseString>
	CreateScreenElement {
		parent = root_window
		id = gig_complete_noncompetitive_id
		Type = descinterface
		desc = 'gig_summary'
		Pos = (0.0, 0.0)
		artist_text = <artist_text>
		song_name_text = <song_name_text>
		band_name_text = <band_name>
	}
	if gig_complete_noncompetitive_id :desc_resolvealias \{Name = alias_diamondbling
			param = diamondbling_id}
		<diamondbling_id> :obj_spawnscript 0x317f8786 params = {minwidth = 100 maxwidth = 325 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if gig_complete_noncompetitive_id :desc_resolvealias \{Name = alias_diamondbling2
			param = diamondbling_id2}
		<diamondbling_id2> :obj_spawnscript 0x317f8786 params = {minwidth = 100 maxwidth = 325 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if ininternetmode
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
	gig_complete_noncompetitive_id :se_setprops {
		event_handlers = <event_handlers>
	}
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices \{band_leader_only}
		if ScreenElementExists \{id = gig_complete_noncompetitive_id}
			gig_complete_noncompetitive_id :se_setprops {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	if (<Type> = career)
		ui_gig_complete_add_gig_data_and_handlers bot_play = <bot_play> current_challenge = <current_challenge>
		ui_gig_complete_handle_unlocked_rewards gig_display_index = <gig_display_index>
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		if (<current_challenge> != None)
			gman_passcheckpoint goal = <current_challenge>
		endif
	else
		ui_gig_complete_add_gig_data_and_handlers bot_play = <bot_play>
	endif
	if (<Type> = career)
		0x9a065b1d
		0xd4b1373a
	endif
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = set_current_challenge
		params = {
			challenge_id = None
		}}
	LaunchEvent \{Type = focus
		target = gig_complete_noncompetitive_id}
	if gig_complete_noncompetitive_id :desc_resolvealias \{Name = alias_gig_sum_illo_anim
			param = bg1_id}
		<bg1_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'UI_art'}
	endif
	if gig_complete_noncompetitive_id :desc_resolvealias \{Name = alias_gig_sum_illo_anim
			param = bg1_id}
		<bg1_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'UI_art'}
	endif
	if gig_complete_noncompetitive_id :desc_resolvealias \{Name = alias_bkg_anim
			param = 0xda1265c9}
		<0xda1265c9> :obj_spawnscript ui_alphablast
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
			if ininternetmode
				getplayerinfo ($g_net_leader_player_num) is_local_client
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
			LaunchEvent \{Type = focus
				target = gig_complete_noncompetitive_id}
		else
			band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
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
		gman_songfunc \{func = get_playlist_size}
		if (<playlist_size> > 0)
			total_stars_earned = 0
			gamemode_gettype
			if (<Type> = career)
				songs_menu_alias = alias_gig_summary_career_list
			else
				songs_menu_alias = alias_gig_summary_qp_list
				gig_complete_noncompetitive_id :se_setprops \{gig_summary_line_challenge_alpha = 0}
			endif
			if gig_complete_noncompetitive_id :desc_resolvealias Name = <songs_menu_alias>
				songs_menu_id = <resolved_id>
				getsongstatshistory
				if GotParam \{song_stats_history}
					get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
					getplayerinfo <player_num> Band
					i = 0
					num_bonus_stars_earned = 0
					begin
					gman_songfunc func = get_songname_by_index params = {index = <i>}
					<score> = (<song_stats_history> [<i>] [(<Band> - 1)].band_score)
					<num_stars> = (<song_stats_history> [<i>] [(<Band> - 1)].band_stars)
					if (<num_stars> = <max_song_stars>)
						<num_bonus_stars_earned> = (<num_bonus_stars_earned> + 1)
					endif
					<total_stars_earned> = (<total_stars_earned> + <num_stars>)
					CastToInteger \{score}
					formatText TextName = score_text qs(0x4d4555da) s = <score> usecommas
					CreateScreenElement {
						parent = <songs_menu_id>
						Type = descinterface
						desc = 'gig_summary_line_song'
						song_name_text = (($gh_songlist_props).<requested_song_name>.title)
						song_score_text = <score_text>
						autosizedims = true
					}
					star_rgba = [255 255 255 255]
					if ((<song_stats_history> [<i>] [(<Band> - 1)].is_gold_stars) = 1)
						star_rgba = gh5_gold_md
					endif
					if <id> :desc_resolvealias Name = alias_song_stars
						GetScreenElementChildren id = <resolved_id>
						GetArraySize <children>
						stars_size = <array_Size>
						if (<stars_size> > 0)
							j = 0
							begin
							GetRandomValue \{a = 15
								b = 15
								Name = star_rotation
								integer}
							(<children> [<j>]) :se_setprops rot_angle = <star_rotation>
							<j> = (<j> + 1)
							repeat <stars_size>
						endif
						if (<num_stars> < <max_song_stars>)
							<j> = 0
							begin
							(<children> [<j>]) :se_setprops alpha = 0
							<j> = (<j> + 1)
							repeat (<max_song_stars> - <num_stars>)
						endif
						<j> = 0
						begin
						(<children> [<j>]) :se_setprops rgba = <star_rgba>
						<j> = (<j> + 1)
						repeat <max_song_stars>
					endif
					<i> = (<i> + 1)
					repeat <playlist_size>
				endif
				if (<bot_play> = 0)
					song_breakdown_get_exclusive_devices \{band_leader_only}
					<songs_menu_id> :se_setprops {
						exclusive_device = <exclusive_devices>
					}
				endif
				total_stars_possible = ((<max_song_stars_no_fc> * <playlist_size>) + <num_bonus_stars_earned>)
				localized_of = qs(0x8e590b97)
				if ((GotParam max_challenge_stars) && (GotParam earned_challenge_stars))
					<total_stars_earned> = (<total_stars_earned> + <earned_challenge_stars>)
					<total_stars_possible> = (<total_stars_possible> + <max_challenge_stars>)
					formatText TextName = total_text qs(0x15c1b436) e = <total_stars_earned> t = <total_stars_possible> o = <localized_of>
				else
					formatText TextName = total_text qs(0x15c1b436) e = <total_stars_earned> t = <total_stars_possible> o = <localized_of>
				endif
				total_number_rgba = [255 255 255 255]
				if (<num_bonus_stars_earned> > 0)
					total_number_rgba = [207 159 43 255]
				endif
				gig_complete_noncompetitive_id :se_setprops {
					total_number_text = <total_text>
					total_number_rgba = <total_number_rgba>
				}
				ui_gig_complete_noncompetitive_add_player_data {
					stars_earned = <total_stars_earned>
				}
				if ininternetmode
					getplayerinfo ($g_net_leader_player_num) is_local_client
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
				LaunchEvent Type = focus target = <songs_menu_id>
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
		if gig_complete_noncompetitive_id :desc_resolvealias \{Name = alias_player_info
				param = player_menu_id}
			gamemode_gettype
			getnumplayersingame \{on_screen
				local}
			if (<num_players_shown> > 0)
				if ((isps3) || (isngc))
					<num_players_shown> = 1
				endif
				getfirstplayer \{on_screen
					local}
				begin
				getplayerinfo <Player> part
				ui_song_breakdown_get_player_instrument_texture part = <part>
				ui_song_breakdown_get_player_display_name player_index = <Player>
				challenge_icon_alpha = 0
				if (<Type> = career)
					getplayerinfo <Player> is_local_client
					if (<is_local_client> = 1)
						getplayerinfo <Player> bot_play
						if (<bot_play> = 1)
							getplayerinfo <Player> bot_original_controller
							controller = <bot_original_controller>
						else
							getplayerinfo <Player> controller
						endif
						get_savegame_from_controller controller = <controller>
						get_current_progression_stars savegame = <savegame>
						if ((<total_stars> - <stars_earned>) <= 0)
							stars_text = qs(0x3bf547a6)
						else
							formatText TextName = stars_text qs(0x73307931) s = (<total_stars> - <stars_earned>) usecommas
						endif
					else
						formatText \{TextName = stars_text
							qs(0x3bf547a6)
							usecommas}
					endif
				else
					formatText \{TextName = stars_text
						qs(0x3bf547a6)
						usecommas}
				endif
				CreateScreenElement {
					parent = <player_menu_id>
					Type = ContainerElement
					pos_anchor = [left , top]
					just = [center , center]
					dims = (280.0, 185.0)
				}
				CreateScreenElement {
					parent = <id>
					Type = descinterface
					desc = 'gig_summary_player'
					pos_anchor = [center , center]
					just = [center , center]
					Pos = (0.0, 15.0)
					autosizedims = true
					player_name_text = <player_name_text>
					icon_instrument_texture = <icon_texture>
					stars_number_text = <stars_text>
				}
				if <id> :desc_resolvealias Name = alias_diamondbling3 param = 0x8a27e96d
					<0x8a27e96d> :obj_spawnscript anim_bling_small params = {minradius = 10 maxradius = 50 maxtime = 0.5}
				else
					ScriptAssert \{'UI_art'}
				endif
				if <id> :desc_resolvealias Name = alias_diamondbling4 param = 0x14437cce
					<0x14437cce> :obj_spawnscript anim_bling_small params = {minradius = 10 maxradius = 50 maxtime = 0.5}
				else
					ScriptAssert \{'UI_art'}
				endif
				getnextplayer on_screen local Player = <Player>
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
		if gig_complete_noncompetitive_id :desc_resolvealias \{Name = alias_player_info}
			Wait \{1.0
				Seconds}
			GetScreenElementChildren id = <resolved_id>
			menu_children = <children>
			GetArraySize <menu_children>
			menu_size = <array_Size>
			gamemode_gettype
			getnumplayersingame \{on_screen
				local}
			if ((isps3) || (isngc))
				<num_players_shown> = 1
			endif
			if (<menu_size> != <num_players_shown>)
				ScriptAssert \{'num players shown does not match number of player panels!'}
			endif
			if (<num_players_shown> > 0)
				getfirstplayer \{on_screen}
				i = 0
				begin
				if (<Type> = career)
					getplayerinfo <Player> is_local_client
					if (<is_local_client> = 1)
						getplayerinfo <Player> bot_play
						if (<bot_play> = 1)
							getplayerinfo <Player> bot_original_controller
							controller = <bot_original_controller>
						else
							getplayerinfo <Player> controller
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
				if (<array_Size> != 1)
					ScriptAssert \{'Player patches in container is not 1!'}
				endif
				if (<gig_stars_earned> > 0)
					<X> = 0
					begin
					<X> = (<X> + 1)
					SoundEvent \{event = star_counter_01}
					if (<X> = <gig_stars_earned>)
						SoundEvent \{event = star_counter_02}
					endif
					<stars_counter> = (<stars_counter> + 1)
					formatText TextName = stars_text qs(0x73307931) s = <stars_counter>
					if ScreenElementExists id = (<children> [0])
						(<children> [0]) :se_setprops {
							stars_number_text = <stars_text>
							time = 0.08
						}
						(<children> [0]) :se_waitprops
					endif
					repeat <gig_stars_earned>
				endif
				getnextplayer on_screen Player = <Player>
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
		if ScreenElementExists \{id = gig_complete_noncompetitive_id}
			LaunchEvent \{Type = unfocus
				target = gig_complete_noncompetitive_id}
		endif
		GetPakManCurrent \{map = zones}
		if (<pak> != z_studio)
			gamemode_gettype
			if (<Type> != career)
				SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
					params = {
						BG_SFX_Area = frontend_menu_music
					}}
			else
				printf \{channel = sfx
					qs(0x790ef21d)}
			endif
		endif
		gamemode_gettype
		if (<Type> = career)
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
					state = uistate_rewards_unlocked
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
					ui_memcard_autosave event = menu_back state = uistate_career_gig_select data = {venue_index = <venue_index>}
				else
					generic_menu_pad_choose_sound
					ui_memcard_autosave \{event = menu_back
						state = uistate_career_venue_select}
				endif
				if ($end_credits = 2)
					Change \{end_credits = 0}
				endif
			endif
		else
			state = uistate_songlist
			if NOT ui_event_exists_in_stack \{Name = 'songlist'}
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
		ui_memcard_autosave \{event = menu_back
			state = uistate_band_lobby_setup}
	else
		generic_event_back \{state = uistate_band_lobby_setup}
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
		ui_memcard_autosave \{event = menu_back
			state = uistate_career_venue_select}
	else
		generic_event_back \{state = uistate_career_venue_select}
	endif
endscript

script net_gig_complete_noncompetitive_continue_to_venue_select 
	RequireParams \{[
			autosave
			device_num
		]
		all}
	getplayerinfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		getplayerinfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		getplayerinfo ($g_net_leader_player_num) controller
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
				state = uistate_rewards_unlocked
				data = {
					unlock_struct = <unlock_struct>
					venue_checksum = <venue_checksum>
				}
			}
		else
			generic_event_choose {
				state = uistate_rewards_unlocked
				data = {
					unlock_struct = <unlock_struct>
					venue_checksum = <venue_checksum>
				}
			}
		endif
	else
		if ui_event_is_top_popup
			generic_event_replace {
				state = uistate_rewards_unlocked
				data = {
					unlock_struct = <unlock_struct>
				}
			}
		else
			generic_event_choose {
				state = uistate_rewards_unlocked
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
	getplayerinfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		getplayerinfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		getplayerinfo ($g_net_leader_player_num) controller
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
	if NOT ininternetmode
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
			state = uistate_unlock_venue
			data = {
				load_venue_checksum = <venue_checksum>
			}
		}
	else
		generic_event_choose {
			state = uistate_unlock_venue
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
	getplayerinfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		getplayerinfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		getplayerinfo ($g_net_leader_player_num) controller
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
	gman_venuefunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	GetArraySize ($progression_gig_list)
	if (<array_Size> > 0)
		i = 0
		begin
		if ((($progression_gig_list) [<i>]).venue = <current_venue>)
			return venue_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script ui_gig_complete_handle_challenge_strip 
	printf \{channel = clayton
		qs(0x53e5dc29)}
	if ScreenElementExists \{id = gig_complete_noncompetitive_id}
		gamemode_gettype
		if (<Type> = career && $end_credits < 2)
			RequireParams \{[
					current_challenge
				]
				all}
			get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
			progression_get_gig_challenge_stars_earned gig_name = <current_challenge> Player = <player_num>
			gig_complete_get_challenge_level_text_and_icon level_earned = <highest_earned>
			gig_complete_noncompetitive_id :se_setprops {
				gig_summary_line_challenge_alpha = 1
				challenge_name_text = <challenge_text>
				challenge_icon_texture = <challenge_icon>
				0x2ed057f0 = 0
			}
			if (<highest_earned> <= 1)
				gig_complete_noncompetitive_id :se_setprops \{challenge_icon_alpha = 0}
				GetRandomValue \{a = 15
					b = 15
					Name = star_rotation
					integer}
				gig_complete_noncompetitive_id :se_setprops {
					0x2ed057f0 = 1
					0xbb088595 = <star_rotation>
				}
			endif
			0x29c0da71 gig_name = <current_challenge>
			max_challenge_stars = 0
			<max_challenge_stars> = (<max_challenge_stars> + (<gig_star_rewards>.gold))
			<max_challenge_stars> = (<max_challenge_stars> + (<gig_star_rewards>.platinum))
			<max_challenge_stars> = (<max_challenge_stars> + (<gig_star_rewards>.diamond))
			if gig_complete_noncompetitive_id :desc_resolvealias \{Name = alias_challenge_stars}
				GetScreenElementChildren id = <resolved_id>
				GetArraySize <children>
				if (<array_Size> > 0)
					i = 0
					begin
					GetRandomValue \{a = 15
						b = 15
						Name = star_rotation
						integer}
					(<children> [<i>]) :se_setprops rot_angle = <star_rotation>
					<i> = (<i> + 1)
					repeat <array_Size>
				endif
				if (<challenge_stars> < 6)
					<i> = 0
					begin
					(<children> [<i>]) :se_setprops alpha = 0
					<i> = (<i> + 1)
					repeat (6 - <challenge_stars>)
				endif
			endif
			return {
				max_challenge_stars = <max_challenge_stars>
				earned_challenge_stars = <challenge_stars>
			}
		else
			gig_complete_noncompetitive_id :se_setprops \{gig_summary_line_challenge_alpha = 0}
		endif
	endif
endscript

script ui_gig_complete_handle_unlocked_rewards 
	progression_get_rewards_just_unlocked
	printstruct <rewards_just_unlocked>
	GetArraySize <rewards_just_unlocked>
	if ininternetmode
		if IsHost
			ui_gig_complete_handle_unlocked_rewards_for_local_or_hosts rewards = <rewards_just_unlocked> rewards_size = <array_Size>
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
		ui_gig_complete_handle_unlocked_rewards_for_local_or_hosts rewards = <rewards_just_unlocked> rewards_size = <array_Size> gig_display_index = <gig_display_index>
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
				if ininternetmode
					cas_index = <reward_index>
					state_params = {}
					AddParam {
						structure_name = state_params
						Name = unlock_struct
						value = {reward_progression_index = ((<rewards> [<cas_index>]).reward_progression_index)}
					}
					ui_gig_complete_check_if_venue_unlocked rewards = <rewards>
					if GotParam \{reward_index}
						if (<reward_index> != -1)
							AddParam {
								structure_name = state_params
								Name = venue_checksum
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
				gig_complete_noncompetitive_id :se_setprops {
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
			gig_complete_noncompetitive_id :se_setprops {
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
			gig_complete_noncompetitive_id :se_setprops {
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
	if (<array_Size> > 0)
		if ScreenElementExists \{id = gig_complete_noncompetitive_id}
			array = []
			ui_gig_complete_check_if_venue_unlocked rewards = <rewards_just_unlocked>
			if (<reward_index> != -1)
				if ininternetmode
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
				if ininternetmode
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
			gig_complete_noncompetitive_id :se_setprops {
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
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<rewards> [<i>].reward_type) = venue)
			return reward_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
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
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<rewards> [<i>].reward_type) != venue)
			only_venues = 0
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return only_venues = <only_venues>
endscript

script ui_gig_complete_find_cas_reward 
	RequireParams \{[
			rewards
		]
		all}
	GetArraySize <rewards>
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<rewards> [<i>].reward_type) = cas || (<rewards> [<i>].reward_type) = cas_texture || (<rewards> [<i>].reward_type) = character || (<rewards> [<i>].reward_type) = venue_reward || (<rewards> [<i>].reward_type) = cheat)
			return reward_index = <i>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
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
	LaunchEvent \{Type = focus
		target = gig_complete_noncompetitive_id}
	gamemode_gettype
	if (<Type> = career)
		songs_menu_alias = alias_gig_summary_career_list
	else
		songs_menu_alias = alias_gig_summary_qp_list
	endif
	if gig_complete_noncompetitive_id :desc_resolvealias Name = <songs_menu_alias>
		LaunchEvent Type = focus target = <resolved_id>
	endif
	clean_up_user_control_helpers
	if ininternetmode
		getplayerinfo ($g_net_leader_player_num) is_local_client
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
