
script ui_init_song_breakdown_shreddfest_match_complete 
	KillSpawnedScript \{Name = net_ui_song_breakdown_competitive_start_timer_spawned}
	Change \{song_breakdown_countdown_time_added = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{song_breakdown_countdown_time = -1}
	Change \{ui_song_breakdown_already_animated_stats = 0}
endscript

script ui_create_song_breakdown_shreddfest_match_complete 
	if inroadiebattlemode
		LoadPak \{'pak\\roadie_battle\\roadie_battle_song_breakdown.pak'
			Heap = quota_misc}
		Change \{ui_song_breakdown_already_animated_stats = 1}
	endif
	ngc_clean_up_exploding_text
	SoundEvent \{event = audio_ui_song_complete_menu_in}
	session_finished = 0
	playlist_getcurrentsongindex
	playlist_getsize
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
	if ($g_songlist_infinite_playlist = 1)
		formatText TextName = game_tally_text qs(0x0ab3784b) X = <song_num>
	else
		formatText TextName = game_tally_text qs(0xc39c5fc2) X = <song_num> y = <playlist_size>
	endif
	playlist_getcurrentsong
	my_song = <current_song>
	if NOT ($last_song_played = None)
		my_song = ($last_song_played)
	endif
	if (($last_song_played) = jamsession)
		<song_title> = (($last_jam_song_props).jam_display_name)
		<band_name> = (($last_jam_song_props).jam_artist_name)
	else
		get_song_title song = <my_song>
		get_song_original_artist song = <my_song>
		if (<original_artist> = 0)
			<band_name> = qs(0x13c0666a)
		else
			get_song_artist song = <my_song> with_year = 0
			<band_name> = <song_artist>
		endif
	endif
	if NOT teammodeequals \{team_mode = two_teams}
		CreateScreenElement {
			parent = root_window
			id = song_complete_shreddfest_id
			Type = descinterface
			desc = 'vs_summary'
			headline_text = <title_text>
			band_name_text = <band_name>
			song_text = <song_title>
			tally_text = <game_tally_text>
			mode_alpha = 0
			tally_alpha = 0
			headline_alpha = 0
			song_summary_badge_winner_alpha = 1
			song_summary_badge_winner_scale = 0.7
			song_summary_badge_winner_pos = (-210.0, 30.0)
			winner_container_alpha = 0
			tags = {
				transition_param = None
			}
		}
		if ($ui_song_breakdown_already_animated_stats = 0)
			song_complete_shreddfest_id :se_setprops \{winner_container_alpha = 1
				time = 0.5}
			Wait \{0.15
				Seconds}
			song_complete_shreddfest_id :se_setprops \{mode_alpha = 1
				time = 0.5}
			song_complete_shreddfest_id :se_setprops \{tally_alpha = 1
				time = 0.3}
			song_complete_shreddfest_id :se_setprops \{headline_alpha = 1
				time = 1}
			ui_sfx \{menustate = songcomplete
				uitype = animatein}
		else
			song_complete_shreddfest_id :se_setprops \{winner_container_alpha = 1
				mode_alpha = 1
				tally_alpha = 1
				headline_alpha = 1}
		endif
		if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_player_stack
				param = player_stack_id}
			<player_stack_id> :obj_spawnscript ui_jerky2
		else
			ScriptAssert \{'wwu_jerky2'}
		endif
		if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_highlight_sparkle
				param = highlight_sparkle_id}
			<highlight_sparkle_id> :obj_spawnscript ui_rotate
		else
			ScriptAssert \{'dschorn3'}
		endif
		if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_glow_anim
				param = glow_anim_id}
			<glow_anim_id> :obj_spawnscript ui_alphablink_02
		else
			ScriptAssert \{'dschorn4'}
		endif
		Change \{ui_song_breakdown_already_animated_stats = 1}
	else
		CreateScreenElement {
			parent = root_window
			id = song_complete_shreddfest_id
			Type = descinterface
			desc = 'vs_summary_team'
			headline_text = <title_text>
			headline_alpha = 0
			tally_text = <game_tally_text>
			song_summary_badge_winner_alpha = 0
			songcomplete_bord_mode_alpha = 0
			tally_alpha = 0
			tags = {
				transition_param = None
			}
		}
		if ($ui_song_breakdown_already_animated_stats = 0)
			song_complete_shreddfest_id :se_setprops \{tally_alpha = 1
				time = 0.5
				motion = ease_in}
			song_complete_shreddfest_id :se_setprops \{songcomplete_bord_mode_alpha = 1
				time = 0.5
				motion = ease_in}
			song_complete_shreddfest_id :se_setprops \{headline_alpha = 1
				time = 0.5
				motion = ease_in}
			ui_sfx \{menustate = songcomplete
				uitype = animatein}
		else
			song_complete_shreddfest_id :se_setprops \{tally_alpha = 1
				songcomplete_bord_mode_alpha = 1
				headline_alpha = 1}
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
		if NOT teammodeequals \{team_mode = two_teams}
			ui_song_breakdown_smc_populate_for_single
		else
			ui_song_breakdown_smc_populate_for_teams
		endif
		Change \{net_song_breakdown_timer_screen_id = song_complete_shreddfest_id}
		ui_song_breakdown_smc_setup_handler_scripts <...>
		LaunchEvent \{Type = focus
			target = song_complete_shreddfest_id}
	endif
	display_rival_add_available_notification
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
			<current_position> = 1
			begin
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <Player> Band
				if (<Band> = (<order> [<order_idx>].band_num))
					ui_song_breakdown_get_basic_player_data player_index = <Player>
					if ((<order_idx> = 0) && (<is_tie> = 0))
						player_text_rgba = [255 240 133 255]
						player_bg_rgba = gh5_gold_md
						player_position_rgba = gh5_gold_md
						player_points_rgba = <player_position_rgba>
						player_units_rgba = <player_position_rgba>
						icon_instrument_alpha = 0.8
						icon_instrument_dims = (50.0, 50.0)
						icon_instrument_rgba = <player_position_rgba>
						winning_player = 1
					else
						formatText checksumName = player_text_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
						formatText checksumName = player_position_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
						player_points_rgba = <player_position_rgba>
						player_units_rgba = <player_position_rgba>
						formatText checksumName = player_bg_rgba 'p%i_dk' i = (<order> [<order_idx>].band_num)
						icon_instrument_alpha = 0.8
						icon_instrument_dims = (50.0, 50.0)
						icon_instrument_rgba = <player_position_rgba>
						winning_player = 0
					endif
					CreateScreenElement {
						parent = <player_menu_id>
						Type = ContainerElement
						dims = (100.0, 75.0)
						pos_anchor = [left , top]
						just = [center , center]
					}
					<order_session_points> = (<order> [<order_idx>].session_points)
					formatText TextName = points_text qs(0x66680619) p = <order_session_points> usecommas
					if (<order_idx> = 0)
						if (<is_tie> = 0)
							formatText TextName = winner_text qs(0x8113e038) p = <player_name_text>
							if inroadiebattlemode
								if roadie_battle_find_roadie_for_player Player = <Player>
									formatText TextName = winner_text qs(0x8c74893f) p = <player_name_text>
								endif
							endif
							position_text = qs(0x03ac90f0)
						else
							formatText \{TextName = winner_text
								qs(0x238e0b78)}
							formatText TextName = position_text qs(0x66680619) p = (<order_idx> + 1)
						endif
						if inroadiebattlemode
							if NOT ResolveScreenElementID \{id = {
										song_complete_shreddfest_id
										child = song_summary_master
									}}
								ScriptAssert \{'Can\'t find ScreenElement song_summary_master'}
							endif
							if NOT ResolveScreenElementID id = {<resolved_id> child = background}
								ScriptAssert \{'Can\'t find ScreenElement background'}
							endif
							if NOT ResolveScreenElementID id = {<resolved_id> child = song_summary_illo}
								ScriptAssert \{'Can\'t find ScreenElement song_summary_illo'}
							endif
							getplayerinfo Player = <Player> roadie_battle_roadie_index
							roadie_battle_get_roadie_info roadie = <roadie_battle_roadie_index> param = avatar
							formatText checksumName = roadie_tex 'SongSummary_Roadie%d' d = (<avatar> + 1)
							<resolved_id> :se_setprops texture = <roadie_tex>
						endif
						song_complete_shreddfest_id :se_setprops {
							message_text = <winner_text>
						}
					else
						<previous_session_points> = (<order> [(<order_idx> - 1)].session_points)
						if (<order_session_points> < <previous_session_points>)
							<current_position> = (<current_position> + 1)
						endif
						formatText TextName = position_text qs(0x66680619) p = <current_position>
					endif
					if (<points_text> = 1)
						units_text = (qs(0x058b313c))
					else
						units_text = (qs(0x01991b09))
					endif
					CreateScreenElement {
						parent = <id>
						Type = descinterface
						desc = 'vs_summary_player_x8'
						dims = (508.0, 140.0)
						pos_anchor = [center , center]
						just = [center , center]
						Pos = (70.0, 0.0)
						Scale = (1.0, 1.0)
						player_name_text = <player_name_text>
						player_name_rgba = <player_text_rgba>
						player_position_text = <position_text>
						player_position_rgba = <player_position_rgba>
						player_points_text = <points_text>
						player_units_text = <units_text>
						player_points_rgba = <player_points_rgba>
						player_units_rgba = <player_units_rgba>
						song_summary_playerheading_bg_rgba = <player_bg_rgba>
						player_name_bg_rgba = <player_bg_rgba>
						player_position_fill_rgba = <player_bg_rgba>
						icon_instrument_texture = <icon_texture>
						icon_instrument_rgba = <icon_instrument_rgba>
						icon_instrument_alpha = <icon_instrument_alpha>
						icon_instrument_dims = <icon_instrument_dims>
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
				song_complete_shreddfest_id :se_setprops \{song_summary_badge_winner_pos = (-210.0, 30.0)
					time = 0.2}
			else
				song_complete_shreddfest_id :se_setprops \{song_summary_badge_winner_alpha = 0}
			endif
		endif
	endif
endscript

script ui_song_breakdown_smc_populate_for_teams 
	song_breakdown_smc_get_band_num_order
	GetArraySize <order>
	order_idx = 0
	if ScreenElementExists \{id = song_complete_shreddfest_id}
		if (<array_Size> > 0)
			begin
			song_breakdown_smc_check_if_team_is_winner bands = <order> band_to_check = <order_idx>
			if (<order_idx> = 0)
				alias_to_resolve = alias_vs_summary_team_info_left
			else
				alias_to_resolve = alias_vs_summary_team_info_right
			endif
			if (<is_winner> = 1)
				formatText checksumName = band_name_rgba 'p%b_lt' b = (<order> [<order_idx>])
				wins_circle_rgba = yellow_md
				formatText checksumName = wins_text_rgba 'p%b_lt' b = (<order> [<order_idx>])
				song_number_rgba = yellow_lt
				badge_alpha = 1
				vs_summary_session_fx_alpha = 1
				formatText checksumName = masthead_bg_rgba 'p%b_xdk' b = (<order> [<order_idx>])
				song_summary_team_player_bg_rgba = <masthead_bg_rgba>
				vs_summary_session_bandname_bg_rgba = <song_summary_team_player_bg_rgba>
			else
				formatText checksumName = masthead_bg_rgba 'p%b_xdk' b = (<order> [<order_idx>])
				formatText checksumName = band_name_rgba 'p%b_lt' b = (<order> [<order_idx>])
				formatText checksumName = wins_circle_rgba 'p%b_md' b = (<order> [<order_idx>])
				formatText checksumName = wins_text_rgba 'p%b_lt' b = (<order> [<order_idx>])
				song_number_rgba = <wins_text_rgba>
				badge_alpha = 0
				vs_summary_session_fx_alpha = 0
				song_summary_team_player_bg_rgba = <masthead_bg_rgba>
				vs_summary_session_bandname_bg_rgba = <masthead_bg_rgba>
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
					if (<order_idx> = 0)
						<song_summary_badge_winner_pos> = (-200.0, -1200.0)
					else
						<song_summary_badge_winner_pos> = (1500.0, 180.0)
					endif
					<team_panel_id> :se_setprops {
						band_name_text = <band_name>
						band_name_rgba = <band_name_rgba>
						song_number_rgba = <song_number_rgba>
						song_summary_badge_winner_alpha = <badge_alpha>
						song_summary_badge_winner_pos = <song_summary_badge_winner_pos>
						team_position_text = <position_text>
						team_position_rgba = <wins_text_rgba>
						vs_summary_session_fx_alpha = <vs_summary_session_fx_alpha>
						vs_summary_session_bandname_bg_rgba = <vs_summary_session_bandname_bg_rgba>
					}
					if ($ui_song_breakdown_already_animated_stats = 0)
						if (<order_idx> = 0)
							if <team_panel_id> :desc_resolvealias Name = alias_team_info_stack param = team_info_stack_id
								<team_info_stack_id> :obj_spawnscript ui_jerky_team_session1
							else
								ScriptAssert \{'wwu_jerky_team_session1'}
							endif
						else
							if <team_panel_id> :desc_resolvealias Name = alias_team_info_stack param = team_info_stack_id
								<team_info_stack_id> :obj_spawnscript ui_jerky_team_session2
							else
								ScriptAssert \{'wwu_jerky_team_session2'}
							endif
						endif
						if (<is_winner> = 1)
							if <team_panel_id> :desc_resolvealias Name = alias_song_summary_badge_winner param = song_summary_badge_winner_id
								<song_summary_badge_winner_id> :obj_spawnscript ui_winnericon_team_session
							else
								ScriptAssert \{'wwu_winnericon_team_session'}
							endif
						endif
					else
						if <team_panel_id> :desc_resolvealias Name = alias_song_summary_badge_winner param = song_summary_badge_winner_id
							<song_summary_badge_winner_id> :se_setprops {
								Pos = (-188.0, -170.0)
								Scale = 0.8
							}
						endif
					endif
					if (<is_winner> = 1)
						if <team_panel_id> :desc_resolvealias Name = alias_highlight_sparkle param = highlight_id
							<highlight_id> :obj_spawnscript ui_rotate
						else
							ScriptAssert \{'dschorn5'}
						endif
						if <team_panel_id> :desc_resolvealias Name = alias_glow_anim param = glow_anim_id
							<glow_anim_id> :obj_spawnscript ui_alphablink_02
						else
							ScriptAssert \{'dschorn6'}
						endif
						if <team_panel_id> :desc_resolvealias Name = alias_winner_shine param = winner_shine_id
							<winner_shine_id> :obj_spawnscript ui_pulse3
						else
							ScriptAssert \{'IMAstinker'}
						endif
						if <team_panel_id> :desc_resolvealias Name = alias_song_number param = song_number_id
							<song_number_id> :obj_spawnscript ui_pulse3
						else
							ScriptAssert \{'IMAstinker'}
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
								pos_anchor = [left , center]
								just = [left , center]
								Pos = (8.0, -210.0)
								Scale = (1.0, 1.0)
								player_bar_rgba = <masthead_bg_rgba>
								player_name_text = <player_name_text>
								player_name_rgba = <wins_text_rgba>
								icon_instrument_texture = <icon_texture>
								icon_instrument_rgba = <player_text_rgba>
								song_summary_team_player_bg_rgba = <song_summary_team_player_bg_rgba>
								autosizedims = true
								tags = {
									player_num = <Player>
								}
							}
						endif
						getnextplayer Player = <Player>
						repeat <num_players>
					endif
				endif
				<order_idx> = (<order_idx> + 1)
				repeat <array_Size>
				if (<array_Size> = 1)
					if song_complete_shreddfest_id :desc_resolvealias \{Name = alias_vs_summary_team_info_right
							param = team_panel_id}
						if <team_panel_id> :desc_resolvealias Name = alias_team_info_stack param = player_menu_id
							<team_panel_id> :se_setprops {
								band_name_text = qs(0x03ac90f0)
								song_number_text = qs(0x3bf547a6)
								song_summary_badge_winner_alpha = 0
							}
						endif
					endif
				endif
			endif
		endif
	endif
	Change \{ui_song_breakdown_already_animated_stats = 1}
endscript

script ui_destroy_song_breakdown_shreddfest_match_complete 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_complete_shreddfest_id}
		if song_complete_shreddfest_id :GetSingleTag \{players_list_id}
			if ScreenElementExists id = <players_list_id>
				DestroyScreenElement id = <players_list_id>
			endif
		endif
		DestroyScreenElement \{id = song_complete_shreddfest_id}
	endif
	if inroadiebattlemode
		unload_pak_and_wait \{pak = 'pak\\roadie_battle\\roadie_battle_song_breakdown.pak'}
	endif
endscript

script ui_deinit_song_breakdown_shreddfest_match_complete 
	Change \{song_breakdown_countdown_time_added = 0}
	ui_song_breakdown_clean_up_highest_multipliers
	Change \{ui_song_breakdown_already_animated_stats = 0}
	KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
endscript

script ui_song_breakdown_determine_order_from_session_points 
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
	<spawn_net_timer> = 0
	gamemode_gettype
	if GotParam \{end_of_setlist_transition}
		transition_param = end_of_setlist_transition
		if ($is_network_game = 1)
			continue_script = net_ui_song_breakdown_continue_to_next_screen_gig_complete
		else
			continue_script = song_breakdown_faceoff_continue_to_next_screen
		endif
		if (($is_network_game = 0) || ($g_lobby_net_state = net_private))
			if NOT inroadiebattlemode
				getplayerinfo ($g_net_leader_player_num) is_local_client
				if (<is_local_client> = 1)
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
					<spawn_net_timer> = 1
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
			if NOT inroadiebattlemode
				getplayerinfo ($g_net_leader_player_num) is_local_client
				if (<is_local_client> = 1)
					allow_change_game_mode = 1
					if ($g_lobby_net_state = net_private)
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
		GetNumPlayers
		get_local_players_in_game
		if (<num_local_players> < <num_players> && <team_game_can_continue> = 1)
			continue_script = net_ui_song_breakdown_go_to_setlist
			continue_text = qs(0x182f0173)
		endif
		back_script = postgame_lobby_quit
		back_params = {id = song_complete_shreddfest_id}
		back_text = qs(0x67d9c56d)
		if ($g_lobby_net_state = net_private)
			if NOT inroadiebattlemode
				getplayerinfo ($g_net_leader_player_num) is_local_client
				if (<is_local_client> = 1)
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
			spawn_net_timer = <spawn_net_timer>
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
			spawn_net_timer = <spawn_net_timer>
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
	GetArraySize <bands>
	if (<array_Size> != 2)
		return \{is_winner = 1
			is_tie = 0}
	endif
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
		Change \{net_song_breakdown_timer_screen_id = song_complete_shreddfest_id}
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
	DestroyScreenElement id = <players_list_id>
	LaunchEvent \{Type = focus
		target = song_complete_shreddfest_id}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_complete_shreddfest_id}
		Change \{net_song_breakdown_timer_screen_id = song_complete_shreddfest_id}
		if song_complete_shreddfest_id :GetSingleTag \{transition_param}
			ui_song_breakdown_smc_setup_handler_scripts <transition_param> no_wait no_timer
		endif
	endif
endscript
