
script ui_init_song_breakdown_shreddfest_match_complete 
	Change \{song_breakdown_countdown_time_added = 0}
	Change \{ui_song_breakdown_continuing_from_sb = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{song_breakdown_countdown_time = -1}
	Change \{ui_song_breakdown_players_rdy = [
			0
			0
			0
			0
		]}
endscript

script ui_create_song_breakdown_shreddfest_match_complete 
	ngc_clean_up_exploding_text
	SoundEvent \{event = menu_song_complete_in}
	Change \{ui_song_breakdown_continuing_from_sb = 0}
	session_finished = 0
	gman_songfunc \{func = get_current_song_playlist_index}
	gman_songfunc \{func = get_playlist_size}
	song_num = <current_song_index>
	if ((GotParam continue_setlist_transition) || (GotParam add_setlist_continue_handlers))
		song_num = (<current_song_index> - 1)
	endif
	if (<song_num> != <playlist_size>)
		formatText \{TextName = title_text
			qs(0xc4e0b900)}
		<session_finished> = 0
	else
		formatText \{TextName = title_text
			qs(0xb2e8bd3f)}
		<session_finished> = 1
	endif
	formatText \{TextName = title_text
		qs(0xb2e8bd3f)}
	formatText TextName = game_tally_text qs(0xc39c5fc2) X = <song_num> y = <playlist_size>
	if NOT gamemode_isteamgame
		CreateScreenElement {
			parent = root_window
			id = song_complete_shreddfest_id
			Type = descinterface
			desc = 'vs_summary'
			headline_text = <title_text>
			tally_text = <game_tally_text>
			song_summary_badge_winner_alpha = 0
			tags = {
				transition_param = None
			}
		}
		if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_diamondbling
				param = diamondbling_id}
			<diamondbling_id> :obj_spawnscript anim_bling_horizontal_02 params = {minwidth = 100 maxwidth = 125 maxtime = 0.5}
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_diamondbling2
				param = diamondbling_id2}
			<diamondbling_id2> :obj_spawnscript anim_bling_horizontal_02 params = {minwidth = 100 maxwidth = 125 maxtime = 0.5}
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_complete_shreddfest_id :desc_resolvealias \{Name = 0x8856cf6f
				param = skull_frame_id}
			<skull_frame_id> :obj_spawnscript 0x69816eb6
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_complete_shreddfest_id :desc_resolvealias \{Name = 0x0b4063c4
				param = 0x227b4b79}
			<0x227b4b79> :obj_spawnscript 0x69816eb6
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_message
				param = message_id}
			<message_id> :obj_spawnscript ui_frazzmatazz_03
		else
			ScriptAssert \{'UI_art'}
		endif
	else
		CreateScreenElement {
			parent = root_window
			id = song_complete_shreddfest_id
			Type = descinterface
			desc = 'vs_summary_team'
			headline_text = <title_text>
			tally_text = <game_tally_text>
			song_summary_badge_winner_alpha = 0
			tags = {
				transition_param = None
			}
		}
		if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_bkg_anim
				param = 0xda1265c9}
			<0xda1265c9> :obj_spawnscript ui_alphablast
		else
			ScriptAssert \{'UI_art'}
		endif
	endif
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices
		if ScreenElementExists \{id = song_complete_shreddfest_id}
			song_complete_shreddfest_id :se_setprops {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	if ScreenElementExists \{id = song_complete_shreddfest_id}
		if NOT gamemode_isteamgame
			ui_song_breakdown_smc_populate_for_single
		else
			ui_song_breakdown_smc_populate_for_teams
		endif
		ui_song_breakdown_smc_setup_handler_scripts <...>
		LaunchEvent \{Type = focus
			target = song_complete_shreddfest_id}
	endif
endscript

script ui_song_breakdown_smc_populate_for_single 
	ui_song_breakdown_determine_order_from_session_points
	GetArraySize <order>
	order_idx = 0
	if ScreenElementExists \{id = song_complete_shreddfest_id}
		if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_player_stack
				param = player_menu_id}
			winning_strip_pos = (0.0, 0.0)
			song_breakdown_smc_single_check_for_tie_winner order = <order>
			begin
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <Player> Band
				if (<Band> = (<order> [<order_idx>].band_num))
					ui_song_breakdown_get_basic_player_data player_index = <Player>
					if ((<order_idx> = 0) && (<is_tie> = 0))
						formatText checksumName = player_text_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
						formatText checksumName = player_position_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
						player_points_rgba = <player_position_rgba>
						player_units_rgba = <player_position_rgba>
						formatText checksumName = player_bg_rgba 'p%i_dk' i = (<order> [<order_idx>].band_num)
						icon_instrument_alpha = 0.3
						icon_instrument_dims = (112.0, 112.0)
						winning_player = 1
					else
						formatText checksumName = player_text_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
						formatText checksumName = player_position_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
						player_points_rgba = <player_position_rgba>
						player_units_rgba = <player_position_rgba>
						formatText checksumName = player_bg_rgba 'p%i_dk' i = (<order> [<order_idx>].band_num)
						icon_instrument_alpha = 0.3
						icon_instrument_dims = (112.0, 112.0)
						winning_player = 0
					endif
					CreateScreenElement {
						parent = <player_menu_id>
						Type = ContainerElement
						dims = (100.0, 55.0)
						pos_anchor = [left , top]
						just = [center , center]
					}
					if (<order_idx> = 0)
						if (<is_tie> = 0)
							formatText TextName = winner_text qs(0x8113e038) p = <player_name_text>
							position_text = qs(0x03ac90f0)
						else
							formatText \{TextName = winner_text
								qs(0xa7139a53)}
							formatText TextName = position_text qs(0x66680619) p = (<order_idx> + 1)
						endif
						song_complete_shreddfest_id :se_setprops {
							message_text = <winner_text>
						}
					else
						formatText TextName = position_text qs(0x66680619) p = (<order_idx> + 1)
					endif
					formatText TextName = points_text qs(0x66680619) p = (<order> [<order_idx>].session_points) usecommas
					CreateScreenElement {
						parent = <id>
						Type = descinterface
						desc = 'vs_summary_player_x8'
						dims = (508.0, 120.0)
						pos_anchor = [center , center]
						just = [center , center]
						Pos = (0.0, 20.0)
						Scale = (1.0, 1.0)
						player_name_text = <player_name_text>
						player_name_rgba = <player_text_rgba>
						player_position_text = <position_text>
						player_position_rgba = <player_position_rgba>
						player_points_text = <points_text>
						player_points_rgba = <player_points_rgba>
						player_units_rgba = <player_units_rgba>
						song_summary_playerheading_bg_rgba = <player_bg_rgba>
						icon_instrument_texture = <icon_texture>
						icon_instrument_rgba = <player_text_rgba>
						icon_instrument_alpha = <icon_instrument_alpha>
						icon_instrument_dims = (112.0, 112.0)
						autosizedims = true
						tags = {
							player_num = <Player>
							winning_player = <winning_player>
						}
					}
				endif
				getnextplayer Player = <Player>
				repeat <num_players>
			endif
			<order_idx> = (<order_idx> + 1)
			repeat <array_Size>
			<player_menu_id> :se_setprops alpha = 1
			if (<is_tie> = 0)
				if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_song_summary_badge_winner
						param = song_summary_badge_winner_id}
					<song_summary_badge_winner_id> :obj_spawnscript 0xba71ccc6
				else
					ScriptAssert \{'dschorn1'}
				endif
				if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_diamondbling3
						param = 0x8a27e96d}
					<0x8a27e96d> :obj_spawnscript anim_bling_small params = {minradius = 10 maxradius = 40 maxtime = 0.5}
				else
					ScriptAssert \{'UI_art'}
				endif
				if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_diamondbling4
						param = 0x14437cce}
					<0x14437cce> :obj_spawnscript anim_bling_small params = {minradius = 10 maxradius = 40 maxtime = 0.5}
				else
					ScriptAssert \{'UI_art'}
				endif
			else
				song_complete_shreddfest_id :se_setprops \{song_summary_badge_winner_alpha = 0}
			endif
		endif
	endif
endscript

script ui_song_breakdown_smc_populate_for_teams 
	song_breakdown_smc_get_band_num_order
	GetArraySize <order>
	if (<array_Size> != 2)
		ScriptAssert \{'Incorrect number of teams!'}
	endif
	order_idx = 0
	if ScreenElementExists \{id = song_complete_shreddfest_id}
		begin
		song_breakdown_smc_check_if_team_is_winner bands = <order> band_to_check = <order_idx>
		if (<order_idx> = 0)
			alias_to_resolve = alias_vs_summary_team_info_left
		else
			alias_to_resolve = alias_vs_summary_team_info_right
		endif
		if (<is_winner> = 1)
			formatText checksumName = masthead_bg_rgba 'p%b_lt' b = (<order> [<order_idx>])
			formatText checksumName = band_name_rgba 'p%b_xdk' b = (<order> [<order_idx>])
			formatText checksumName = wins_circle_rgba 'p%b_dk' b = (<order> [<order_idx>])
			formatText checksumName = wins_text_rgba 'p%b_lt' b = (<order> [<order_idx>])
			badge_alpha = 1
		else
			formatText checksumName = masthead_bg_rgba 'p%b_lt' b = (<order> [<order_idx>])
			formatText checksumName = band_name_rgba 'p%b_xdk' b = (<order> [<order_idx>])
			formatText checksumName = wins_circle_rgba 'p%b_dk' b = (<order> [<order_idx>])
			formatText checksumName = wins_text_rgba 'p%b_lt' b = (<order> [<order_idx>])
			badge_alpha = 0
		endif
		getbandinfo (<order> [<order_idx>]) Name
		<band_name> = ($<Name>)
		if (<is_winner> = 1)
			position_text = qs(0x03ac90f0)
		else
			formatText TextName = position_text qs(0x1e9c76ca) b = (<order_idx> + 1)
		endif
		if song_complete_shreddfest_id :desc_resolvealias Name = <alias_to_resolve> param = team_panel_id
			if <team_panel_id> :desc_resolvealias Name = alias_team_info_stack param = player_menu_id
				<team_panel_id> :se_setprops {
					band_name_text = <band_name>
					team_masthead_rgba = <masthead_bg_rgba>
					band_name_rgba = <band_name_rgba>
					circle_song_number_rgba = <wins_circle_rgba>
					song_number_rgba = <wins_text_rgba>
					song_summary_badge_winner_alpha = <badge_alpha>
					team_position_text = <position_text>
				}
				if (<is_winner> = 1)
					if <team_panel_id> :desc_resolvealias Name = alias_song_summary_badge_winner param = song_summary_badge_winner_id
						<song_summary_badge_winner_id> :obj_spawnscript 0xba71ccc6
					else
						ScriptAssert \{'dschorn1'}
					endif
					if <team_panel_id> :desc_resolvealias Name = alias_diamondbling param = diamondbling_id
						<diamondbling_id> :obj_spawnscript anim_bling_small params = {minradius = 10 maxradius = 40 maxtime = 0.5}
					else
						ScriptAssert \{'UI_art'}
					endif
					if <team_panel_id> :desc_resolvealias Name = alias_diamondbling2 param = diamondbling_id2
						<diamondbling_id2> :obj_spawnscript anim_bling_small params = {minradius = 10 maxradius = 40 maxtime = 0.5}
					else
						ScriptAssert \{'UI_art'}
					endif
					if <team_panel_id> :desc_resolvealias Name = 0x32073a9b param = 0x526fcbb5
						<0x526fcbb5> :obj_spawnscript 0x69816eb6
					else
						ScriptAssert \{'dschorn1'}
					endif
					if <team_panel_id> :desc_resolvealias Name = 0x1c92d292
						if ScreenElementExists id = <resolved_id>
							<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
						endif
					else
					endif
				endif
				getbandinfo (<order> [<order_idx>]) session_points
				formatText TextName = wins_text qs(0x292990de) w = <session_points>
				<team_panel_id> :se_setprops {
					song_number_text = <wins_text>
				}
				getnumplayersingame
				if (<num_players> > 0)
					getfirstplayer
					begin
					getplayerinfo <Player> Band
					if (<Band> = (<order> [<order_idx>]))
						ui_song_breakdown_get_basic_player_data player_index = <Player>
						CreateScreenElement {
							parent = <player_menu_id>
							Type = ContainerElement
							pos_anchor = [left , top]
							just = [left , center]
							dims = (395.0, 40.0)
						}
						CreateScreenElement {
							parent = <id>
							Type = descinterface
							desc = 'vs_summary_team_info_player'
							dims = (508.0, 120.0)
							pos_anchor = [left , top]
							just = [left , top]
							Pos = (5.0, -60.0)
							Scale = (1.0, 1.0)
							player_bar_rgba = <masthead_bg_rgba>
							player_name_text = <player_name_text>
							player_name_rgba = <wins_text_rgba>
							icon_instrument_texture = <icon_texture>
							icon_instrument_rgba = <wins_text_rgba>
							autosizedims = true
							tags = {
								player_num = <Player>
							}
						}
						if (<is_winner> = 1)
							if <id> :desc_resolvealias Name = 0x1c92d292
								if ScreenElementExists id = <resolved_id>
									<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.5 Color = [61 218 250 200]}
								endif
							else
							endif
						endif
					endif
					getnextplayer Player = <Player>
					repeat <num_players>
				endif
			endif
			<order_idx> = (<order_idx> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script ui_song_breakdown_shreddfest_match_complete_continue_to_next_screen 
	GetPakManCurrent \{map = zones}
	if (<pak> != z_studio)
		SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = frontend_menu_music
			}}
	endif
	printf \{qs(0x2bd3b055)}
	Change \{songtime_paused = 0}
	if ($is_network_game = 1)
		generic_event_back \{state = uistate_songlist}
	elseif (is_roadie_battle_mode)
		generic_event_back \{state = uistate_band_lobby_setup}
	else
		generic_event_back \{state = uistate_songlist
			data = {
				no_jamsession
			}}
	endif
endscript

script ui_destroy_song_breakdown_shreddfest_match_complete 
	hide_glitch \{num_frames = 55}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_complete_shreddfest_id}
		if song_complete_shreddfest_id :GetSingleTag \{players_list_id}
			if ScreenElementExists id = <players_list_id>
				DestroyScreenElement id = <players_list_id>
			endif
		endif
		DestroyScreenElement \{id = song_complete_shreddfest_id}
	endif
endscript

script ui_deinit_song_breakdown_shreddfest_match_complete 
	Change \{song_breakdown_countdown_time_added = 0}
	ui_song_breakdown_clean_up_highest_multipliers
endscript

script ui_song_breakdown_determine_order_from_session_points 
	if is_roadie_battle_mode
		order = []
		i = 1
		begin
		getplayerinfo <i> score
		AddArrayElement array = <order> element = {band_num = <i> session_points = <score>}
		order = <array>
		<i> = (<i> + 1)
		repeat 2
		return order = <order>
	endif
	getbandsstatus
	GetArraySize <bands>
	order = []
	i = 0
	begin
	if (<bands> [<i>].in_game)
		getbandinfo (<i> + 1) session_points
		AddArrayElement {
			array = <order>
			element = {
				band_num = (<i> + 1)
				session_points = <session_points>
			}
		}
		order = <array>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	GetArraySize <order>
	if (<array_Size> > 1)
		begin
		<i> = 0
		begin
		left_score = (<order> [<i>].session_points)
		right_score = (<order> [(<i> + 1)].session_points)
		if (<right_score> > <left_score>)
			left_element = (<order> [<i>])
			SetArrayElement ArrayName = order index = <i> NewValue = (<order> [(<i> + 1)])
			SetArrayElement ArrayName = order index = (<i> + 1) NewValue = <left_element>
		endif
		<i> = (<i> + 1)
		repeat (<array_Size> - 1)
		repeat <array_Size>
	endif
	return order = <order>
endscript

script ui_song_breakdown_smc_setup_handler_scripts 
	continue_script = nullscript
	back_script = nullscript
	option_script = nullscript
	option2_script = nullscript
	continue_text = qs(0x182f0173)
	back_text = qs(0x3f11367e)
	option_text = qs(0x03ac90f0)
	option2_text = qs(0x03ac90f0)
	back_params = {}
	option_params = {}
	option2_params = {}
	transition_param = None
	start_timer = 0
	gamemode_gettype
	if GotParam \{end_of_setlist_transition}
		transition_param = end_of_setlist_transition
		if ($is_network_game = 1)
			continue_script = net_ui_song_breakdown_continue_to_next_screen_gig_complete
		else
			continue_script = song_breakdown_faceoff_continue_to_next_screen
		endif
		if (($is_network_game = 0) || ($g_lobby_net_state = net_private))
			getplayerinfo ($g_net_leader_player_num) is_local_client
			if (<is_local_client> = 1)
				if NOT is_roadie_battle_mode
					option_script = song_breakdown_shreddfest_change_game_type
					option_params = {transition_param = <transition_param>}
					option_text = qs(0x2ba5d7e6)
				endif
			endif
		endif
		if ininternetmode
			option2_script = net_ui_song_breakdown_show_players_list
			option2_text = qs(0xd16792bf)
			option2_params = {
				screen_id = song_complete_shreddfest_id
				destroy_players_list_script = net_ui_song_breakdown_smc_destroy_players_list
			}
		endif
	elseif ((GotParam continue_setlist_transition) || (GotParam add_setlist_continue_handlers))
		transition_param = continue_setlist_transition
		if ($is_network_game = 1)
			<team_game_can_continue> = 1
			if gamemode_isteamgame
				gamemode_getnumplayers
				<original_num_players> = <num_players>
				GetNumPlayers
				if (<original_num_players> > <num_players>)
					<team_game_can_continue> = 0
				endif
			endif
			GetNumPlayers
			get_local_players_in_game
			if (<num_local_players> >= <num_players> || <team_game_can_continue> = 0)
				back_script = postgame_lobby_quit
				back_params = {id = song_complete_shreddfest_id}
				back_text = qs(0x67d9c56d)
			else
				if NOT (GotParam no_timer)
					if ($song_breakdown_countdown_time_added = 0)
						Change \{song_breakdown_countdown_time = 5}
					endif
					song_complete_shreddfest_id :Obj_SpawnScriptNow \{net_ui_song_breakdown_start_timer_spawned
						params = {
							continue_to_next_song
						}}
				endif
			endif
			option2_script = net_ui_song_breakdown_show_players_list
			option2_text = qs(0xd16792bf)
			option2_params = {
				screen_id = song_complete_shreddfest_id
				destroy_players_list_script = net_ui_song_breakdown_smc_destroy_players_list
			}
		else
			continue_script = song_breakdown_competitive_continue_to_next_song
		endif
		if (($is_network_game = 0) || ($g_lobby_net_state = net_private))
			getplayerinfo ($g_net_leader_player_num) is_local_client
			if NOT is_roadie_battle_mode
				if (<is_local_client> = 1)
					allow_change_game_mode = 1
					if ($g_lobby_net_state = net_private)
						if gamemode_isteamgame
							gamemode_getnumplayers
							<original_num_players> = <num_players>
							GetNumPlayers
							if (<original_num_players> > <num_players>)
								<allow_change_game_mode> = 0
							endif
						endif
						GetNumPlayers
						get_local_players_in_game
						if (<num_local_players> >= <num_players>)
							<allow_change_game_mode> = 0
						endif
					endif
					if (<allow_change_game_mode> = 1)
						option_script = song_breakdown_shreddfest_change_game_type
						option_params = {transition_param = <transition_param>}
						option_text = qs(0x2ba5d7e6)
					endif
				endif
			endif
		endif
	elseif (GotParam net_transition)
		transition_param = net_transition
		<team_game_can_continue> = 1
		if gamemode_isteamgame
			gamemode_getnumplayers
			<original_num_players> = <num_players>
			GetNumPlayers
			if (<original_num_players> > <num_players>)
				<team_game_can_continue> = 0
			endif
		endif
		GetNumPlayers
		get_local_players_in_game
		if (<num_local_players> < <num_players> && <team_game_can_continue> = 1)
			continue_script = net_ui_song_breakdown_go_to_setlist
			continue_text = qs(0xd31dcde6)
		endif
		back_script = postgame_lobby_quit
		back_params = {id = song_complete_shreddfest_id}
		back_text = qs(0x67d9c56d)
		if ($g_lobby_net_state = net_private)
			getplayerinfo ($g_net_leader_player_num) is_local_client
			if (<is_local_client> = 1)
				if NOT is_roadie_battle_mode
					if (<num_local_players> < <num_players> && <team_game_can_continue> = 1)
						option_script = song_breakdown_shreddfest_change_game_type
						option_params = {transition_param = <transition_param>}
						option_text = qs(0x2ba5d7e6)
					endif
				endif
			endif
		endif
		option2_script = net_ui_song_breakdown_show_players_list
		option2_text = qs(0xd16792bf)
		option2_params = {
			screen_id = song_complete_shreddfest_id
			destroy_players_list_script = net_ui_song_breakdown_smc_destroy_players_list
		}
	else
		ScriptAssert \{'Invalid transition from song breakdown'}
	endif
	if (GotParam no_wait)
		SpawnScriptNow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
			screen_element_id = song_complete_shreddfest_id
			continue_script = <continue_script>
			back_script = <back_script>
			option_script = <option_script>
			option2_script = <option2_script>
			continue_text = <continue_text>
			back_text = <back_text>
			option_text = <option_text>
			option2_text = <option2_text>
			back_params = <back_params>
			option_params = <option_params>
			option2_params = <option2_params>
			transition_param = <transition_param>
			can_scroll_stats = 0
			start_timer = <start_timer>
			no_wait
		}
	else
		SpawnScriptNow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
			screen_element_id = song_complete_shreddfest_id
			continue_script = <continue_script>
			back_script = <back_script>
			option_script = <option_script>
			option2_script = <option2_script>
			continue_text = <continue_text>
			back_text = <back_text>
			option_text = <option_text>
			option2_text = <option2_text>
			back_params = <back_params>
			option_params = <option_params>
			option2_params = <option2_params>
			transition_param = <transition_param>
			start_timer = <start_timer>
			can_scroll_stats = 0
		}
	endif
endscript

script song_breakdown_smc_get_band_num_order 
	getbandsstatus
	GetArraySize <bands>
	order = []
	i = 0
	begin
	if (<bands> [<i>].in_game)
		AddArrayElement {
			array = <order>
			element = (<i> + 1)
		}
		order = <array>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return order = <order>
endscript

script song_breakdown_smc_check_if_team_is_winner 
	RequireParams \{[
			bands
			band_to_check
		]
		all}
	getbandinfo (<bands> [0]) session_points
	band1_points = <session_points>
	getbandinfo (<bands> [1]) session_points
	band2_points = <session_points>
	winner_order_idx = -1
	if (<band1_points> != <band2_points>)
		if (<band1_points> > <band2_points>)
			winner_order_idx = 0
		else
			winner_order_idx = 1
		endif
	else
		return \{is_winner = 0
			is_tie = 1}
	endif
	if (<band_to_check> = <winner_order_idx>)
		return \{is_winner = 1
			is_tie = 0}
	else
		return \{is_winner = 0
			is_tie = 0}
	endif
endscript

script song_breakdown_smc_single_check_for_tie_winner 
	RequireParams \{[
			order
		]
		all}
	is_tie_winner = 0
	GetArraySize <order>
	if (<array_Size> > 1)
		if ((<order> [0].session_points) = (<order> [1].session_points))
			is_tie_winner = 1
		endif
	endif
	return is_tie = <is_tie_winner>
endscript

script ui_return_song_breakdown_shreddfest_match_complete 
	if ScreenElementExists \{id = song_complete_shreddfest_id}
		if NOT ScreenElementExists \{id = band_lobby_popup_menu}
			song_complete_shreddfest_id :GetSingleTag \{transition_param}
			ui_song_breakdown_smc_setup_handler_scripts <transition_param> no_wait
		else
			band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
		endif
	endif
endscript

script net_ui_song_breakdown_smc_destroy_players_list 
	RequireParams \{[
			players_list_id
		]
		all}
	if GotParam \{play_back_sfx}
		if (<play_back_sfx> = 1)
			generic_menu_pad_back_sound
		endif
	endif
	DestroyScreenElement id = <players_list_id>
	LaunchEvent \{Type = focus
		target = song_complete_shreddfest_id}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_complete_shreddfest_id}
		if song_complete_shreddfest_id :GetSingleTag \{transition_param}
			ui_song_breakdown_smc_setup_handler_scripts <transition_param> no_wait no_timer
		endif
	endif
endscript
