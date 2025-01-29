ui_song_breakdown_competitive_already_updated_session_points = 0
ui_song_breakdown_competitive_order = [
]
ui_song_breakdown_competitive_order_is_tie = 0

script ui_init_song_breakdown_competitive 
	Change \{ui_song_breakdown_competitive_order_is_tie = 0}
	Change \{ui_song_breakdown_competitive_order = [
		]}
	Change \{song_breakdown_countdown_time_added = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{ui_song_breakdown_competitive_already_updated_session_points = 0}
	Change \{ui_song_breakdown_already_animated_stats = 0}
	Change \{song_breakdown_countdown_time = -1}
	spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
			fadeintime = 10
			fadeintype = linear
			fadeouttime = 10
			fadeouttype = linear
		}}
	spawnscriptnow \{Neutral_Crowd_Wait_To_Lower_Stats}
	spawnscriptnow \{Crowd_Swells_During_Stats_Screen}
	Change \{ui_song_breakdown_players_rdy = [
			0
			0
			0
			0
		]}
	Change \{ui_song_breakdown_helper_params = {
		}}
	Change \{song_breakdown_busy_flag = 0}
	Change \{playing_song = 0}
	Change \{sb_trans_flag = 0}
	disable_pause
	GameMode_GetType
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
	endif
endscript

script ui_create_song_breakdown_competitive 
	if InNetGame
		NetSessionFunc \{Obj = voice
			func = TurnTeamTalkOff}
	endif
	Change \{ui_song_breakdown_helper_params = {
		}}
	if should_use_all_buttons
		Change \{ui_song_breakdown_helper_params = {
				all_buttons
			}}
	endif
	Change \{song_breakdown_busy_flag = 1}
	ui_song_breakdown_clear_ready_up_book_keeping
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		DestroyScreenElement \{id = song_breakdown_competitive_id}
	endif
	GMan_SongTool_GetCurrentSong
	my_song = <current_song>
	if NOT ($last_song_played = None)
		my_song = ($last_song_played)
	endif
	get_song_title song = <my_song>
	GameMode_GetType
	if (<type> = pro_faceoff)
		ui_create_song_breakdown_faceoff song_title = <song_title>
	elseif (<type> = competitive)
		ui_create_song_breakdown_shreddfest song_title = <song_title>
	else
		ScriptAssert \{qs(0x7951d5fe)}
	endif
	ui_song_breakdown_competitive_setup_handler_scripts <...>
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		if ($is_network_game = 1)
			if NOT ((GotParam continue_setlist_transition) || (GotParam add_setlist_continue_handlers))
				song_breakdown_competitive_id :Obj_SpawnScriptNow net_ui_song_breakdown_competitive_start_timer_spawned params = {<...>}
			endif
		endif
	endif
endscript

script ui_create_song_breakdown_faceoff 
	SoundEvent \{event = Menu_Song_Complete_In}
	GetNumPlayersInGame
	if NOT GameMode_IsTeamGame
		CreateScreenElement {
			parent = root_window
			id = song_breakdown_competitive_id
			type = DescInterface
			desc = 'song_complete_faceoff'
			title_text = <song_title>
			band_header_container_pos = {(0.0, -300.0) relative}
			tags = {
				player_id_array = []
				player_strips_id = []
				transition_param = None
				came_from_rock_record = 0
			}
		}
	else
		CreateScreenElement {
			parent = root_window
			id = song_breakdown_competitive_id
			type = DescInterface
			desc = 'song_summary_team'
			song_name_text = <song_title>
			band_header_container_pos = {(0.0, -300.0) relative}
			tags = {
				player_id_array = []
				player_strips_id = []
				transition_param = None
				came_from_rock_record = 0
			}
		}
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_bkg_anim
				param = bkg_id}
			<bkg_id> :Obj_SpawnScript ui_alphablast
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_clouds_anim
				param = clouds_anim_id}
			<clouds_anim_id> :Obj_SpawnScript ui_frazzmatazz
		else
			ScriptAssert \{'dschorn1'}
		endif
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_clouds_anim
				param = clouds_anim_id}
			<clouds_anim_id> :Obj_SpawnScript ui_shakey
		else
			ScriptAssert \{'dschorn1'}
		endif
	endif
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices
		if ScreenElementExists \{id = song_breakdown_competitive_id}
			song_breakdown_competitive_id :SE_SetProps {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	song_breakdown_competitive_determine_order_from_score
	GetArraySize <order>
	order_size = <array_size>
	order_idx = 0
	player_idx = 1
	session_stats_update_scores order = <order> size = <order_size>
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		if NOT GameMode_IsTeamGame
			if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_complete_faceoff_players_menu
					param = player_menu_id}
				GetScreenElementChildren id = <player_menu_id>
				(<children> [0]) :SE_SetProps not_focusable
				begin
				if (<num_players> > 0)
					GetFirstPlayer
					strip_idx = 0
					begin
					GetPlayerInfo <player> Band
					if (<Band> = (<order> [<order_idx>].band_num))
						ui_song_breakdown_get_basic_player_data player_index = <player>
						CreateScreenElement {
							parent = <player_menu_id>
							type = DescInterface
							desc = 'song_complete_faceoff_player_stats'
							player_name_text = <player_name_text>
							score_text = <score_text>
							autoSizeDims = true
						}
						<id> :SE_SetProps {
							event_handlers = [
								{pad_back net_ui_song_breakdown_competitive_unfocus_player_strips_menu params = {menu_id = <player_menu_id>}}
								{focus net_ui_song_breakdown_competitive_strips_focus params = {strip_id = <id> strip_idx = <strip_idx>}}
								{unfocus net_ui_song_breakdown_competitive_strips_unfocus params = {strip_id = <id>}}
							]
							replace_handlers
						}
						song_breakdown_competitive_id :GetTags
						AddArrayElement array = <player_id_array> element = <player>
						<player_id_array> = <array>
						AddArrayElement array = <player_strips_id> element = <id>
						<player_strips_id> = <array>
						song_breakdown_competitive_id :SetTags player_id_array = <player_id_array>
						song_breakdown_competitive_id :SetTags player_strips_id = <player_strips_id>
						<strip_idx> = (<strip_idx> + 1)
					endif
					GetNextPlayer player = <player>
					repeat <num_players>
				endif
				<order_idx> = (<order_idx> + 1)
				repeat <order_size>
			endif
			<player_menu_id> :SE_SetProps alpha = 1
		else
			if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_summary_team_stack
					param = team_menu_id}
				begin
				CreateScreenElement {
					parent = <team_menu_id>
					type = ContainerElement
					dims = (450.0, 130.0)
					pos_anchor = [left , top]
					just = [center , center]
					not_focusable
				}
				<score> = (<order> [<order_idx>].band_result)
				CastToInteger \{score}
				FormatText TextName = score_text qs(0x73307931) s = <score> UseCommas
				GetBandInfo (<order> [<order_idx>].band_num) name
				<band_name_text> = ($<name>)
				CreateScreenElement {
					parent = <id>
					type = DescInterface
					desc = 'song_summary_team_masthead'
					dims = (496.0, 157.0)
					pos_anchor = [left , top]
					just = [left , center]
					Pos = (-19.0, 63.0)
					autoSizeDims = true
					score_main_text = <score_text>
					band_name_text = <band_name_text>
					tags = {
						team_strip_index = <order_idx>
						current_focused_strip_idx = -1
					}
				}
				if (<order_idx> = 0)
					FormatText checksumname = masthead_bg_rgba 'p%i_lt' i = (<order> [<order_idx>])
					FormatText checksumname = masthead_text_rgba 'p%i_lt' i = (<order> [<order_idx>])
					masthead_score_BG_rgba = [255 255 255 255]
					song_summary_badge_winner_alpha = 1
					player_text_rgba = [255 255 255 255]
					FormatText checksumname = highlight_film_dk_rgba 'p%i_lt' i = (<order> [<order_idx>])
					winning_player = 1
					if <id> :Desc_ResolveAlias name = alias_headline_magic
						if ScreenElementExists id = <resolved_id>
							<resolved_id> :Obj_SpawnScript ui_anim_glitter params = {max_interval = 0.3 Color = [61 218 250 200]}
						endif
					else
					endif
				else
					FormatText checksumname = masthead_bg_rgba 'p%i_lt' i = (<order> [<order_idx>])
					FormatText checksumname = masthead_text_rgba 'p%i_lt' i = (<order> [<order_idx>])
					FormatText checksumname = masthead_score_BG_rgba 'p%i_lt' i = (<order> [<order_idx>])
					song_summary_badge_winner_alpha = 0
					FormatText checksumname = player_text_rgba 'p%i_lt' i = (<order> [<order_idx>])
					FormatText checksumname = highlight_film_dk_rgba 'p%i_lt' i = (<order> [<order_idx>])
					winning_player = 0
				endif
				<id> :SE_SetProps {
					masthead_bg_rgba = <masthead_bg_rgba>
					team_number_rgba = <masthead_score_BG_rgba>
					masthead_text_rgba = <masthead_text_rgba>
					masthead_score_BG_rgba = <masthead_score_BG_rgba>
					song_summary_badge_winner_alpha = <song_summary_badge_winner_alpha>
				}
				if (<num_players> > 0)
					GetFirstPlayer
					strip_idx = 0
					begin
					GetPlayerInfo <player> Band
					if (<Band> = (<order> [<order_idx>].band_num))
						ui_song_breakdown_get_basic_player_data player_index = <player>
						CreateScreenElement {
							parent = <team_menu_id>
							type = ContainerElement
							dims = (441.0, 40.0)
							pos_anchor = [left , top]
							just = [center , center]
							event_handlers = [
								{
									pad_choose
									net_ui_song_breakdown_launch_rock_record
									params = {
										parent_id = song_breakdown_competitive_id
										player = <player>
										unfocus_id = <team_menu_id>
									}
								}
								{pad_back ui_song_breakdown_competitive_unfocus_player_strips_menu}
								{focus ui_song_breakdown_competitive_player_strip_focus}
								{unfocus ui_song_breakdown_competitive_player_strip_unfocus}
							]
						}
						CreateScreenElement {
							parent = <id>
							type = DescInterface
							desc = 'song_summary_team_player'
							dims = (500.0, 88.0)
							pos_anchor = [left , top]
							just = [left , top]
							Pos = (0.0, 200.0)
							player_name_text = <player_name_text>
							player_name_rgba = <player_text_rgba>
							highlight_film_dk_rgba = <highlight_film_dk_rgba>
							icon_instrument_texture = <icon_texture>
							autoSizeDims = true
							tags = {
								player_num = <player>
								winning_player = <winning_player>
							}
						}
						song_breakdown_competitive_id :GetTags
						AddArrayElement array = <player_id_array> element = <player>
						<player_id_array> = <array>
						AddArrayElement array = <player_strips_id> element = <id>
						<player_strips_id> = <array>
						song_breakdown_competitive_id :SetTags player_id_array = <player_id_array>
						song_breakdown_competitive_id :SetTags player_strips_id = <player_strips_id>
						<strip_idx> = (<strip_idx> + 1)
					endif
					GetNextPlayer player = <player>
					repeat <num_players>
				endif
				<order_idx> = (<order_idx> + 1)
				repeat <order_size>
			endif
		endif
	endif
endscript

script ui_create_song_breakdown_shreddfest 
	SoundEvent \{event = Menu_Song_Complete_In}
	GetNumPlayersInGame
	GetUpperCaseString <goal_results_column_title>
	<goal_results_column_title> = <UpperCaseString>
	if NOT GameMode_IsTeamGame
		CreateScreenElement {
			parent = root_window
			id = song_breakdown_competitive_id
			type = DescInterface
			desc = 'vs_summary'
			tally_text = <song_title>
			shreddfest_winning_criteria_label_text = <goal_results_column_title>
			tags = {
				player_id_array = []
				player_strips_id = []
				transition_param = None
				came_from_rock_record = 0
			}
		}
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_diamondBling
				param = diamondBling_id}
			<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_02 params = {minwidth = 100 maxwidth = 125 maxtime = 0.5}
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_diamondBling2
				param = diamondbling_id2}
			<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal_02 params = {minwidth = 100 maxwidth = 125 maxtime = 0.5}
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_skull_frame_512
				param = skull_frame_id}
			<skull_frame_id> :Obj_SpawnScript ui_blink
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_skull_frame_reflect
				param = skull_frame_reflect_id}
			<skull_frame_reflect_id> :Obj_SpawnScript ui_blink
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_message
				param = message_id}
			<message_id> :Obj_SpawnScript ui_frazzmatazz_03
		else
			ScriptAssert \{'UI_art'}
		endif
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_bkg_anim
				param = bkg_id}
			<bkg_id> :Obj_SpawnScript ui_alphablast
		else
			ScriptAssert \{'UI_art'}
		endif
	else
		ruleset = ($competitive_rules)
		CreateScreenElement {
			parent = root_window
			id = song_breakdown_competitive_id
			type = DescInterface
			desc = 'song_summary_team'
			song_name_text = <song_title>
			game_rules_text = ($<ruleset>.text)
			band_header_container_pos = {(0.0, -300.0) relative}
			tags = {
				player_id_array = []
				player_strips_id = []
				transition_param = None
				came_from_rock_record = 0
			}
		}
	endif
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices
		if ScreenElementExists \{id = song_breakdown_competitive_id}
			song_breakdown_competitive_id :SE_SetProps {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	GetArraySize ($ui_song_breakdown_competitive_order)
	if (<array_size> <= 0)
		song_breakdown_shreddfest_determine_order
		Change ui_song_breakdown_competitive_order = <order>
		Change ui_song_breakdown_competitive_order_is_tie = <is_tie>
	else
		order = ($ui_song_breakdown_competitive_order)
		is_tie = ($ui_song_breakdown_competitive_order_is_tie)
	endif
	GetArraySize <order>
	order_size = <array_size>
	order_idx = 0
	if ($ui_song_breakdown_competitive_already_updated_session_points = 0)
		session_stats_update_scores order = <order> size = <order_size>
		Change \{ui_song_breakdown_competitive_already_updated_session_points = 1}
	endif
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		FormatText TextName = song_title_text qs(0xf3f44f34) s = <song_title>
		<ruleset> = ($competitive_rules)
		FormatText TextName = shreddfest_type_text qs(0xdb2c2a33) m = ($<ruleset>.text)
		if NOT GameMode_IsTeamGame
			if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_player_stack
					param = player_menu_id}
				song_breakdown_competitive_id :SE_SetProps {
					headline_text = ($<ruleset>.text)
				}
				winning_strip_pos = (0.0, 0.0)
				strip_idx = 0
				begin
				GetNumPlayersInGame
				if (<num_players> > 0)
					GetFirstPlayer
					begin
					GetPlayerInfo <player> Band
					if (<Band> = (<order> [<order_idx>].band_num))
						ui_song_breakdown_get_basic_player_data player_index = <player>
						if ((<order_idx> = 0) && (<is_tie> = 0))
							FormatText checksumname = player_text_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
							FormatText checksumname = player_position_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
							player_points_rgba = <player_position_rgba>
							player_units_rgba = <player_position_rgba>
							FormatText checksumname = player_bg_rgba 'p%i_dk' i = (<order> [<order_idx>].band_num)
							icon_instrument_alpha = 0.3
							icon_instrument_dims = (112.0, 112.0)
							winning_player = 1
						else
							FormatText checksumname = player_text_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
							FormatText checksumname = player_position_rgba 'p%i_lt' i = (<order> [<order_idx>].band_num)
							player_points_rgba = <player_position_rgba>
							player_units_rgba = <player_position_rgba>
							FormatText checksumname = player_bg_rgba 'p%i_dk' i = (<order> [<order_idx>].band_num)
							icon_instrument_alpha = 0.3
							icon_instrument_dims = (112.0, 112.0)
							winning_player = 0
						endif
						CreateScreenElement {
							parent = <player_menu_id>
							type = ContainerElement
							dims = (100.0, 55.0)
							pos_anchor = [left , top]
							just = [center , center]
						}
						if (<order_idx> = 0)
							if (<is_tie> = 0)
								FormatText TextName = winner_text qs(0x8113e038) p = <player_name_text>
								position_text = qs(0x03ac90f0)
							else
								FormatText \{TextName = winner_text
									qs(0x238e0b78)}
								FormatText TextName = position_text qs(0x66680619) p = (<order_idx> + 1)
							endif
							song_breakdown_competitive_id :SE_SetProps {
								message_text = <winner_text>
							}
						else
							FormatText TextName = position_text qs(0x66680619) p = (<order_idx> + 1)
						endif
						order_score = (<order> [<order_idx>].band_result)
						CastToInteger \{order_score}
						FormatText TextName = points_text qs(0x66680619) p = <order_score> UseCommas
						CreateScreenElement {
							parent = <id>
							type = DescInterface
							desc = 'vs_summary_player_x8'
							dims = (508.0, 120.0)
							pos_anchor = [center , center]
							just = [center , center]
							Pos = (0.0, 20.0)
							scale = (1.0, 1.0)
							player_name_text = <player_name_text>
							player_name_rgba = <player_text_rgba>
							player_position_text = <position_text>
							player_position_rgba = <player_position_rgba>
							player_points_text = <points_text>
							player_points_rgba = <player_points_rgba>
							player_units_rgba = <player_units_rgba>
							song_summary_playerHeading_BG_rgba = <player_bg_rgba>
							icon_instrument_texture = <icon_texture>
							icon_instrument_rgba = <player_text_rgba>
							icon_instrument_alpha = <icon_instrument_alpha>
							icon_instrument_dims = <icon_instrument_dims>
							autoSizeDims = true
							tags = {
								player_num = <player>
								winning_player = <winning_player>
							}
						}
						<id> :SE_SetProps {
							event_handlers = [
								{pad_back net_ui_song_breakdown_competitive_unfocus_player_strips_menu params = {menu_id = <player_menu_id>}}
								{focus net_ui_song_breakdown_competitive_strips_focus params = {strip_id = <id> strip_idx = <strip_idx>}}
								{unfocus net_ui_song_breakdown_competitive_strips_unfocus params = {strip_id = <id>}}
							]
							replace_handlers
						}
						song_breakdown_competitive_id :GetTags
						AddArrayElement array = <player_id_array> element = <player>
						<player_id_array> = <array>
						AddArrayElement array = <player_strips_id> element = <id>
						<player_strips_id> = <array>
						song_breakdown_competitive_id :SetTags {
							player_id_array = <player_id_array>
							player_strips_id = <player_strips_id>
						}
						<strip_idx> = (<strip_idx> + 1)
					endif
					GetNextPlayer player = <player>
					repeat <num_players>
				endif
				<order_idx> = (<order_idx> + 1)
				repeat <array_size>
				<player_menu_id> :SE_SetProps alpha = 1
				if (<is_tie> = 0)
					if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_summary_badge_winner
							param = song_summary_badge_winner_id}
						<song_summary_badge_winner_id> :Obj_SpawnScript ui_badge_blink
					else
						ScriptAssert \{'dschorn1'}
					endif
					if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_summary_badge_winner2
							param = song_summary_badge_winner2_id}
						<song_summary_badge_winner2_id> :Obj_SpawnScript ui_alphablast
					else
						ScriptAssert \{'dschorn1'}
					endif
					if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_diamondBling3
							param = diamondbling_id3}
						<diamondbling_id3> :Obj_SpawnScript anim_bling_small params = {minradius = 10 maxradius = 40 maxtime = 0.5}
					else
						ScriptAssert \{'UI_art'}
					endif
					if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_diamondBling4
							param = diamondbling_id4}
						<diamondbling_id4> :Obj_SpawnScript anim_bling_small params = {minradius = 10 maxradius = 40 maxtime = 0.5}
					else
						ScriptAssert \{'UI_art'}
					endif
				else
					song_breakdown_competitive_id :SE_SetProps \{song_summary_badge_winner_alpha = 0}
				endif
			endif
		else
			if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_summary_team_stack
					param = team_menu_id}
				begin
				CreateScreenElement {
					parent = <team_menu_id>
					type = ContainerElement
					dims = (390.0, 130.0)
					pos_anchor = [left , top]
					just = [left , center]
					not_focusable
				}
				<score> = ((<order> [<order_idx>]).band_result)
				CastToInteger \{score}
				FormatText TextName = score_text qs(0x73307931) s = <score> UseCommas
				GetBandInfo (<order> [<order_idx>].band_num) name
				<band_name_text> = ($<name>)
				CreateScreenElement {
					parent = <id>
					type = DescInterface
					desc = 'song_summary_team_masthead'
					dims = (496.0, 157.0)
					pos_anchor = [left , top]
					just = [left , center]
					Pos = (-26.0, 63.0)
					autoSizeDims = true
					score_main_text = <score_text>
					band_name_text = <band_name_text>
					tags = {
						team_strip_index = <order_idx>
						current_focused_strip_idx = -1
					}
				}
				FormatText checksumname = masthead_bg_panel_rgba 'p%i_lt' i = ((<order> [<order_idx>]).band_num)
				FormatText checksumname = masthead_text_rgba 'p%i_md' i = ((<order> [<order_idx>]).band_num)
				FormatText checksumname = masthead_score_BG_rgba 'p%i_lt' i = ((<order> [<order_idx>]).band_num)
				FormatText checksumname = player_text_rgba 'p%i_lt' i = ((<order> [<order_idx>]).band_num)
				FormatText checksumname = highlight_film_dk_rgba 'p%i_md' i = ((<order> [<order_idx>]).band_num)
				FormatText TextName = team_number_text qs(0x66680619) p = (<order_idx> + 1)
				if ((<order_idx> = 0) && (<is_tie> = 0))
					team_number_text = qs(0x03ac90f0)
					song_summary_badge_winner_alpha = 1
					winning_player = 1
					if <id> :Desc_ResolveAlias name = alias_headline_magic
						if ScreenElementExists id = <resolved_id>
							<resolved_id> :Obj_SpawnScript ui_anim_glitter params = {max_interval = 0.1 Color = [61 218 250 200]}
						endif
					else
					endif
				else
					song_summary_badge_winner_alpha = 0
					winning_player = 0
				endif
				<id> :SE_SetProps {
					masthead_bg_rgba = <masthead_bg_panel_rgba>
					team_number_rgba = <masthead_score_BG_rgba>
					masthead_text_rgba = <masthead_text_rgba>
					masthead_score_BG_rgba = <masthead_score_BG_rgba>
					song_summary_badge_winner_alpha = <song_summary_badge_winner_alpha>
					team_number_text = <team_number_text>
				}
				if (<song_summary_badge_winner_alpha> > 0)
					if <id> :Desc_ResolveAlias name = alias_song_summary_badge_winner param = song_summary_badge_winner_id
						<song_summary_badge_winner_id> :Obj_SpawnScript ui_badge_blink_big
					else
						ScriptAssert \{'dschorn1'}
					endif
					if <id> :Desc_ResolveAlias name = alias_song_summary_badge_winner2 param = song_summary_badge_winner2_id
						<song_summary_badge_winner2_id> :Obj_SpawnScript ui_alphablast
					else
						ScriptAssert \{'dschorn1'}
					endif
					if <id> :Desc_ResolveAlias name = alias_diamondBling param = diamondBling_id
						<diamondBling_id> :Obj_SpawnScript anim_bling_small params = {minradius = 10 maxradius = 40 maxtime = 0.5}
					else
						ScriptAssert \{'UI_art'}
					endif
					if <id> :Desc_ResolveAlias name = alias_diamondBling2 param = diamondbling_id2
						<diamondbling_id2> :Obj_SpawnScript anim_bling_small params = {minradius = 10 maxradius = 40 maxtime = 0.5}
					else
						ScriptAssert \{'UI_art'}
					endif
				endif
				if (<num_players> > 0)
					GetFirstPlayer
					strip_idx = 0
					begin
					GetPlayerInfo <player> Band
					if (<Band> = ((<order> [<order_idx>]).band_num))
						ui_song_breakdown_get_basic_player_data player_index = <player>
						CreateScreenElement {
							parent = <team_menu_id>
							type = ContainerElement
							dims = (441.0, 35.0)
							pos_anchor = [left , top]
							just = [center , top]
							event_handlers = [
								{
									pad_choose
									net_ui_song_breakdown_launch_rock_record
									params = {
										parent_id = song_breakdown_competitive_id
										player = <player>
										unfocus_id = <team_menu_id>
									}
								}
								{pad_back ui_song_breakdown_competitive_unfocus_player_strips_menu}
								{focus ui_song_breakdown_competitive_player_strip_focus}
								{unfocus ui_song_breakdown_competitive_player_strip_unfocus}
							]
						}
						CreateScreenElement {
							parent = <id>
							type = DescInterface
							desc = 'song_summary_team_player'
							dims = (475.0, 88.0)
							pos_anchor = [left , top]
							just = [left , top]
							Pos = (26.0, -37.0)
							player_name_text = <player_name_text>
							player_name_rgba = <player_text_rgba>
							highlight_film_dk_rgba = <highlight_film_dk_rgba>
							icon_instrument_texture = <icon_texture>
							autoSizeDims = true
							tags = {
								player_num = <player>
								winning_player = <winning_player>
							}
						}
						song_breakdown_competitive_id :GetTags
						AddArrayElement array = <player_id_array> element = <player>
						<player_id_array> = <array>
						AddArrayElement array = <player_strips_id> element = <id>
						<player_strips_id> = <array>
						song_breakdown_competitive_id :SetTags player_id_array = <player_id_array>
						song_breakdown_competitive_id :SetTags player_strips_id = <player_strips_id>
						<strip_idx> = (<strip_idx> + 1)
					endif
					GetNextPlayer player = <player>
					repeat <num_players>
				endif
				<order_idx> = (<order_idx> + 1)
				repeat <order_size>
			endif
			if ($ui_song_breakdown_already_animated_stats = 0)
				song_breakdown_competitive_id :Obj_SpawnScriptNow \{song_summary_animate_kingwing
					params = {
						screen_id = song_breakdown_competitive_id
					}}
				if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_bkg_anim
						param = bkg_id}
					<bkg_id> :Obj_SpawnScript ui_alphablast
				else
					ScriptAssert \{'UI_art'}
				endif
				if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_star
						param = star_id}
					<star_id> :Obj_SpawnScript ui_alphablast
				else
					ScriptAssert \{'dschorn1'}
				endif
				Change \{ui_song_breakdown_already_animated_stats = 1}
			else
				song_breakdown_competitive_id :Obj_SpawnScriptNow \{song_summary_jiggle_kingwing
					params = {
						screen_id = song_breakdown_competitive_id
					}}
				if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_bkg_anim
						param = bkg_id}
					<bkg_id> :Obj_SpawnScript ui_alphablast
				else
					ScriptAssert \{'UI_art'}
				endif
				if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_star
						param = star_id}
					<star_id> :Obj_SpawnScript ui_alphablast
				else
					ScriptAssert \{'dschorn1'}
				endif
			endif
		endif
	endif
endscript

script ui_song_breakdown_competitive_anim_in_script 
	SetScriptCannotPause
	GameMode_GetType
	StartRendering \{reason = menu_transition}
	Change \{song_breakdown_busy_flag = 0}
endscript

script ui_song_breakdown_competitive_anim_out_script 
	SetScriptCannotPause
	StartRendering \{reason = menu_transition}
	clean_up_user_control_helpers
endscript

script ui_song_breakdown_competitive_setup_handler_scripts 
	continue_script = nullscript
	back_script = nullscript
	option_script = nullscript
	option2_script = nullscript
	continue_text = qs(0x182f0173)
	back_text = qs(0x03ac90f0)
	option_text = qs(0x3f11367e)
	option2_text = qs(0x03ac90f0)
	continue_params = {}
	back_params = {}
	option2_params = {}
	transition_param = None
	start_timer = 0
	GameMode_GetType
	if GotParam \{end_of_setlist_transition}
		continue_params = {end_of_setlist_transition}
		transition_param = end_of_setlist_transition
		if (<type> = pro_faceoff)
			if ($is_network_game = 1)
				option2_script = net_ui_song_breakdown_show_players_list
				option2_text = qs(0xd16792bf)
				option2_params = {
					screen_id = song_breakdown_competitive_id
					destroy_players_list_script = net_ui_song_breakdown_competitive_destroy_players_list
				}
				if NOT (GotParam no_timer)
					song_breakdown_competitive_id :Obj_SpawnScriptNow net_ui_song_breakdown_competitive_start_timer_spawned params = {<...>}
				endif
			else
				continue_script = song_breakdown_shreddfest_continue_to_next_screen
			endif
		else
			if ($is_network_game = 1)
				option2_script = net_ui_song_breakdown_show_players_list
				option2_text = qs(0xd16792bf)
				option2_params = {
					screen_id = song_breakdown_competitive_id
					destroy_players_list_script = net_ui_song_breakdown_competitive_destroy_players_list
				}
				if NOT (GotParam no_timer)
					song_breakdown_competitive_id :Obj_SpawnScriptNow net_ui_song_breakdown_competitive_start_timer_spawned params = {<...>}
				endif
			else
				continue_script = song_breakdown_shreddfest_continue_to_next_screen
			endif
		endif
		option_script = song_breakdown_go_to_stats_from_transition
		option_params = {transition_param = <transition_param>}
	elseif ((GotParam continue_setlist_transition) || (GotParam add_setlist_continue_handlers))
		if GotParam \{continue_setlist_transition}
			transition_param = continue_setlist_transition
		else
			transition_param = add_setlist_continue_handlers
		endif
		if ((($sb_trans_flag) = 1) || (GotParam add_setlist_continue_handlers))
			option_script = song_breakdown_go_to_stats_from_transition
			option_params = {transition_param = <transition_param>}
			transition_param = add_setlist_continue_handlers
			if NOT InNetGame
				continue_params = {continue_setlist_transition}
				continue_script = song_breakdown_shreddfest_continue_to_next_screen
			else
				option2_script = net_ui_song_breakdown_show_players_list
				option2_text = qs(0xd16792bf)
				option2_params = {
					screen_id = song_breakdown_competitive_id
					destroy_players_list_script = net_ui_song_breakdown_competitive_destroy_players_list
				}
				if NOT (GotParam no_timer)
					song_breakdown_competitive_id :Obj_SpawnScriptNow net_ui_song_breakdown_competitive_start_timer_spawned params = {<...>}
				endif
			endif
		endif
	elseif (GotParam net_transition)
		transition_param = net_transition
		back_script = postgame_lobby_quit
		back_params = {id = song_breakdown_competitive_id}
		back_text = qs(0x67d9c56d)
		option_script = song_breakdown_go_to_stats_from_transition
		option_text = qs(0x3f11367e)
		option_params = {transition_param = <transition_param>}
		option2_script = net_ui_song_breakdown_show_players_list
		option2_text = qs(0xd16792bf)
		option2_params = {
			screen_id = song_breakdown_competitive_id
			destroy_players_list_script = net_ui_song_breakdown_competitive_destroy_players_list
		}
	else
		ScriptAssert \{'Invalid transition from song breakdown'}
	endif
	if (GotParam no_wait)
		spawnscriptnow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
			screen_element_id = song_breakdown_competitive_id
			continue_script = <continue_script>
			back_script = <back_script>
			option_script = <option_script>
			option2_script = <option2_script>
			continue_text = <continue_text>
			back_text = <back_text>
			option_text = <option_text>
			option2_text = <option2_text>
			continue_params = <continue_params>
			back_params = <back_params>
			option_params = <option_params>
			option2_params = <option2_params>
			transition_param = <transition_param>
			can_scroll_stats = 0
			start_timer = <start_timer>
			no_wait
		}
	else
		spawnscriptnow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
			screen_element_id = song_breakdown_competitive_id
			continue_script = <continue_script>
			back_script = <back_script>
			option_script = <option_script>
			option2_script = <option2_script>
			continue_text = <continue_text>
			back_text = <back_text>
			option_text = <option_text>
			option2_text = <option2_text>
			continue_params = <continue_params>
			back_params = <back_params>
			option_params = <option_params>
			option2_params = <option2_params>
			transition_param = <transition_param>
			start_timer = <start_timer>
			can_scroll_stats = 0
		}
	endif
endscript

script net_ui_song_breakdown_competitive_strips_focus 
	RequireParams \{[
			strip_id
			strip_idx
		]
		all}
	<strip_id> :SE_SetProps player_name_rgba = blue2_md
	<strip_id> :SE_GetParentID
	<parent_id> :SE_GetParentID
	<parent_id> :SE_GetParentID
	<parent_id> :GetTags
	if GotParam \{current_focused_strip_idx}
		<parent_id> :SetTags {
			current_focused_strip_idx = <strip_idx>
		}
	endif
endscript

script net_ui_song_breakdown_competitive_strips_unfocus 
	RequireParams \{[
			strip_id
		]
		all}
	<strip_id> :SE_SetProps player_name_rgba = [220 122 5 255]
	<strip_id> :SE_GetParentID
	<parent_id> :SE_GetParentID
	<parent_id> :SE_GetParentID
	<parent_id> :GetTags
	if GotParam \{current_focused_strip_idx}
		<parent_id> :SetTags {
			current_focused_strip_idx = -1
		}
	endif
endscript

script net_ui_song_breakdown_competitive_go_to_next_player_strip 
	RequireParams \{[
			direction
			team_strip_id
			first_team_strip_index
		]
		all}
	GetNumPlayersInGame
	GameMode_GetNumPlayersPerTeam
	if (<direction> = down)
		<team_strip_id> :GetTags
		if (<current_focused_strip_idx> = (<num_players_per_team> - 1))
			num_team_strips = (<num_players> / <num_players_per_team>)
			CastToInteger \{num_team_strips}
			last_team_strip_idx = (<num_team_strips> + <first_team_strip_index>)
			<last_team_strip_idx> = (<last_team_strip_idx> - 1)
			if (<team_strip_index> != <last_team_strip_idx>)
				if <team_strip_id> :Desc_ResolveAlias name = alias_song_complete_faceoff_player_menu
					LaunchEvent type = unfocus target = <resolved_id>
				endif
				<team_strip_id> :SE_GetParentID
				GetScreenElementChildren id = <parent_id>
				if (<children> [(<team_strip_index> + 1)]) :Desc_ResolveAlias name = alias_song_complete_faceoff_player_menu
					LaunchEvent type = focus target = <resolved_id> data = {child_index = 0}
				endif
			endif
		endif
	else
		<team_strip_id> :GetTags
		if (<current_focused_strip_idx> = 0)
			if (<team_strip_index> != <first_team_strip_index>)
				if <team_strip_id> :Desc_ResolveAlias name = alias_song_complete_faceoff_player_menu
					LaunchEvent type = unfocus target = <resolved_id>
				endif
				<team_strip_id> :SE_GetParentID
				GetScreenElementChildren id = <parent_id>
				if (<children> [(<team_strip_index> - 1)]) :Desc_ResolveAlias name = alias_song_complete_faceoff_player_menu
					LaunchEvent type = focus target = <resolved_id> data = {child_index = (<num_players_per_team> - 1)}
				endif
			endif
		endif
	endif
endscript

script net_ui_song_breakdown_competitive_focus_player_strips_menu_for_rocker_record 
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		if IsScreenElementInFocus \{id = song_breakdown_competitive_id}
			LaunchEvent \{type = unfocus
				target = song_breakdown_competitive_id}
		endif
		GameMode_GetType
		if (<type> = pro_faceoff)
			if NOT GameMode_IsTeamGame
				if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_complete_faceoff_players_menu}
					LaunchEvent type = focus target = <resolved_id> data = {child_index = 1}
				else
					ScriptAssert \{'could not find player strips menu to focus'}
				endif
			else
				if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_complete_faceoff_teams_menu}
					GetScreenElementChildren id = <resolved_id>
					GetArraySize <children>
					if (<array_size> > 1)
						if (<children> [1]) :Desc_ResolveAlias name = alias_song_complete_faceoff_player_menu
							LaunchEvent type = focus target = <resolved_id> data = {child_index = 0}
						endif
					endif
				else
					ScriptAssert \{'could not find player strips menu to focus'}
				endif
			endif
		else
			if NOT GameMode_IsTeamGame
				if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_complete_shreddfest_players_menu}
					LaunchEvent type = focus target = <resolved_id> data = {child_index = 2}
				else
					ScriptAssert \{'could not find player strips menu to focus'}
				endif
			else
				if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_complete_shreddfest_teams_menu}
					GetScreenElementChildren id = <resolved_id>
					GetArraySize <children>
					if (<array_size> > 2)
						if (<children> [2]) :Desc_ResolveAlias name = alias_song_complete_faceoff_player_menu
							LaunchEvent type = focus target = <resolved_id> data = {child_index = 0}
						endif
					endif
				else
					ScriptAssert \{'could not find player strips menu to focus'}
				endif
			endif
		endif
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
endscript

script net_ui_song_breakdown_competitive_unfocus_player_strips_menu 
	RequireParams \{[
			menu_id
		]
		all}
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		if ScreenElementExists id = <menu_id>
			if IsScreenElementInFocus id = <menu_id>
				LaunchEvent type = unfocus target = <menu_id>
			endif
		endif
		clean_up_user_control_helpers
		ui_song_breakdown_competitive_setup_handler_scripts \{net_transition
			no_wait}
	endif
endscript

script net_ui_song_breakdown_competitive_start_timer_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Obj_GetID
	screen_id = <objID>
	net_ui_song_breakdown_wait_for_timer screen_id = <screen_id> Timer_text = qs(0xc0de1c84)
	GameMode_GetType
	if ($is_network_game = 1)
		Change \{song_breakdown_busy_flag = 0}
		song_breakdown_shreddfest_continue_to_next_screen timer_expired <...>
	endif
endscript

script ui_return_song_breakdown_competitive 
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		if NOT ScreenElementExists \{id = band_lobby_popup_menu}
			song_breakdown_competitive_id :GetSingleTag \{transition_param}
			ui_song_breakdown_competitive_setup_handler_scripts <transition_param> no_wait
		else
			band_lobby_update_button_helpers controller = ($primary_controller) Menu = playerslist
		endif
	endif
endscript

script song_breakdown_shreddfest_continue_to_next_screen 
	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	if GotParam \{timer_expired}
		RemoveParameter \{base_name}
		RemoveParameter \{timer_expired}
		RemoveParameter \{anim_in_script}
		RemoveParameter \{anim_out_script}
		if ScreenElementExists \{id = song_breakdown_competitive_id}
			LaunchEvent \{type = unfocus
				target = song_breakdown_competitive_id}
		elseif ScreenElementExists \{id = stats_summary_id}
			LaunchEvent \{type = unfocus
				target = stats_summary_id}
		endif
		if ui_event_is_top_popup
			ui_event_wait_for_safe
			generic_event_replace state = UIstate_song_breakdown_shreddfest_match_complete data = <...>
		else
			ui_event_wait_for_safe
			generic_event_choose state = UIstate_song_breakdown_shreddfest_match_complete data = <...>
		endif
	else
		GetPlayerInfo ($g_net_leader_player_num) bot_play
		if (<bot_play> = 1)
			GetPlayerInfo ($g_net_leader_player_num) bot_original_controller
			controller = <bot_original_controller>
		else
			GetPlayerInfo ($g_net_leader_player_num) controller
		endif
		if (<device_num> = <controller>)
			if ScreenElementExists \{id = song_breakdown_competitive_id}
				LaunchEvent \{type = unfocus
					target = song_breakdown_competitive_id}
			endif
			Change \{song_breakdown_busy_flag = 1}
			if ui_event_is_top_popup
				ui_event_wait_for_safe
				generic_event_replace state = UIstate_song_breakdown_shreddfest_match_complete data = <...>
			else
				ui_event_wait_for_safe
				generic_event_choose state = UIstate_song_breakdown_shreddfest_match_complete data = <...>
			endif
		endif
	endif
endscript

script song_breakdown_shreddfest_change_game_type 
	RequireParams \{[
			device_num
			transition_param
		]
		all}
	if InInternetMode
		GetPlayerInfo ($g_net_leader_player_num) controller
	else
		controller = ($primary_controller)
	endif
	if (<device_num> = <controller>)
		LaunchEvent \{type = unfocus
			target = song_complete_shreddfest_id}
		start_timer = 0
		if InInternetMode
			if ((<transition_param> = continue_setlist_transition) || (<transition_param> = add_setlist_continue_handlers))
				start_timer = 1
			endif
		endif
		generic_event_choose state = UIstate_game_rules data = {start_timer = <start_timer>}
	endif
endscript

script song_breakdown_faceoff_continue_to_next_screen 
	RequireParams \{[
			device_num
		]
		all}
	if (<device_num> = ($primary_controller))
		GetPakManCurrent \{map = zones}
		if (<pak> != z_Studio)
			spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
				params = {
					BG_SFX_Area = FrontEnd_Menu_Music
				}}
			if ScriptExists \{Crowd_Swells_During_Stats_Screen}
				killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
			endif
			if IsSoundEventPlaying \{Surge_During_Stats_Screen}
				StopSoundEvent \{Surge_During_Stats_Screen
					fade_time = 1.5
					fade_type = linear}
			endif
		endif
		if ScreenElementExists \{id = song_breakdown_competitive_id}
			LaunchEvent \{type = unfocus
				target = song_breakdown_competitive_id}
		elseif ScreenElementExists \{id = song_complete_shreddfest_id}
			LaunchEvent \{type = unfocus
				target = song_complete_shreddfest_id}
		endif
		printf \{qs(0x2bd3b055)}
		Change \{songtime_paused = 0}
		generic_event_back \{state = uistate_songlist
			data = {
				no_jamsession
			}}
	endif
endscript

script song_breakdown_competitive_continue_to_next_song 
	RequireParams \{[
			device_num
		]
		all}
	if (<device_num> = ($primary_controller))
		LaunchEvent \{type = unfocus
			target = song_complete_shreddfest_id}
		if ($game_mode = fest_mode || $game_mode = fest_mode_team)
			display_competitive_rules_voting \{voting_callback = song_breakdown_back_to_gameplay
				back_params = {
					data = {
						continue_setlist_transition
					}
				}}
		else
			Menu_Music_Off
			song_breakdown_back_to_gameplay
		endif
	endif
endscript

script song_breakdown_back_to_gameplay 
	printf \{qs(0xc895d2b5)}
	if GotParam \{result}
		Change competitive_rules = <result>
		if IsHost
			SendStructure callback = net_set_competitive_rules data_to_send = {competitive_rules = <result> loading_screen = 0}
		endif
	endif
	generic_menu_pad_choose_sound
	SoundEvent \{event = Menu_Song_Complete_Out}
	GMan_ShutDownGameModeGoal
	GMan_StartGameModeGoal
	if InInternetMode
		generic_net_sync \{callback = unpause_songtime_back_to_gameplay}
	else
		unpause_songtime_back_to_gameplay
	endif
endscript

script unpause_songtime_back_to_gameplay 
	generic_menu_pad_choose_sound
	SoundEvent \{event = Menu_Song_Complete_Out}
	Change \{songtime_paused = 0}
	generic_event_back \{nosound
		state = uistate_gameplay}
endscript

script ui_destroy_song_breakdown_competitive 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		if song_breakdown_competitive_id :GetSingleTag \{players_list_id}
			if ScreenElementExists id = <players_list_id>
				DestroyScreenElement id = <players_list_id>
			endif
		endif
		DestroyScreenElement \{id = song_breakdown_competitive_id}
	endif
	killspawnedscript \{name = net_ui_song_breakdown_competitive_start_timer_spawned}
endscript

script ui_deinit_song_breakdown_competitive 
	Change \{ui_song_breakdown_competitive_order_is_tie = 0}
	Change \{ui_song_breakdown_competitive_order = [
		]}
	Change \{song_breakdown_countdown_time = -1}
	Change \{song_breakdown_countdown_time_added = 0}
	Change \{ui_song_breakdown_competitive_already_updated_session_points = 0}
	Change \{ui_song_breakdown_already_animated_stats = 0}
	ui_song_breakdown_clean_up_highest_multipliers
endscript

script ui_song_breakdown_competitive_focus_player_strips_menu 
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_summary_team_stack
				param = team_menu_id}
			LaunchEvent \{type = unfocus
				target = song_breakdown_competitive_id}
			LaunchEvent type = focus target = <team_menu_id> data = {child_index = 1}
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
			song_breakdown_competitive_id :SetTags \{came_from_rock_record = 1}
		endif
	endif
endscript

script ui_song_breakdown_competitive_unfocus_player_strips_menu 
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		if song_breakdown_competitive_id :Desc_ResolveAlias \{name = alias_song_summary_team_stack
				param = team_menu_id}
			LaunchEvent type = unfocus target = <team_menu_id>
			LaunchEvent \{type = focus
				target = song_breakdown_competitive_id}
			clean_up_user_control_helpers
			song_breakdown_competitive_id :GetSingleTag \{transition_param}
			ui_song_breakdown_competitive_setup_handler_scripts \{transition_param
				no_wait}
		endif
	endif
endscript

script ui_song_breakdown_competitive_player_strip_focus 
	Obj_GetID
	GetScreenElementChildren id = <objID>
	GetArraySize <children>
	if (<array_size> > 0)
		(<children> [0]) :GetTags
		if GotParam \{player_num}
			GetPlayerInfo <player_num> Band
			if GotParam \{winning_player}
				if (<winning_player> = 1)
					FormatText checksumname = focus_bg_rgba 'p%b_md' b = <Band>
					FormatText checksumname = player_text_rgba 'p%b_lt' b = <Band>
				else
					FormatText checksumname = focus_bg_rgba 'p%b_md' b = <Band>
					FormatText checksumname = player_text_rgba 'p%b_lt' b = <Band>
				endif
				(<children> [0]) :SE_SetProps {
					highlight_film_dk_rgba = <focus_bg_rgba>
					player_name_rgba = <player_text_rgba>
					time = 0.1
				}
			endif
		endif
	endif
endscript

script ui_song_breakdown_competitive_player_strip_unfocus 
	Obj_GetID
	GetScreenElementChildren id = <objID>
	GetArraySize <children>
	if (<array_size> > 0)
		(<children> [0]) :GetTags
		if GotParam \{player_num}
			GetPlayerInfo <player_num> Band
			if GotParam \{winning_player}
				if (<winning_player> = 1)
					FormatText checksumname = focus_bg_rgba 'p%b_xdk' b = <Band>
					FormatText checksumname = player_text_rgba 'p%b_lt' b = <Band>
				else
					FormatText checksumname = focus_bg_rgba 'p%b_xdk' b = <Band>
					FormatText checksumname = player_text_rgba 'p%b_lt' b = <Band>
				endif
				(<children> [0]) :SE_SetProps {
					highlight_film_dk_rgba = <focus_bg_rgba>
					player_name_rgba = <player_text_rgba>
					time = 0.1
				}
			endif
		endif
	endif
endscript

script net_ui_song_breakdown_competitive_destroy_players_list 
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
	LaunchEvent \{type = focus
		target = song_breakdown_competitive_id}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_breakdown_competitive_id}
		if song_breakdown_competitive_id :GetSingleTag \{transition_param}
			ui_song_breakdown_competitive_setup_handler_scripts <transition_param> no_wait no_timer
		endif
	endif
endscript

script song_breakdown_competitive_determine_order_from_score 
	GetBandsStatus
	GetArraySize <bands>
	order = []
	i = 0
	begin
	if (<bands> [<i>].in_game)
		getBandScoreFromDetailedStats Band = (<i> + 1)
		AddArrayElement {
			array = <order>
			element = {
				band_num = (<i> + 1)
				band_result = <score>
			}
		}
		order = <array>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	GetArraySize <order>
	if (<array_size> > 1)
		begin
		<i> = 0
		begin
		left_score = (<order> [<i>].band_result)
		right_score = (<order> [(<i> + 1)].band_result)
		if (<right_score> > <left_score>)
			left_score_band_idx = (<order> [<i>])
			SetArrayElement arrayName = order index = <i> newValue = (<order> [(<i> + 1)])
			SetArrayElement arrayName = order index = (<i> + 1) newValue = <left_score_band_idx>
		endif
		<i> = (<i> + 1)
		repeat (<array_size> - 1)
		repeat <array_size>
	endif
	return order = <order>
endscript

script song_breakdown_shreddfest_determine_order 
	GMan_GetResultsData \{goal = competitive}
	ruleset = ($competitive_rules)
	if NOT StructureContains structure = ($<ruleset>) ranking_criteria
		ScriptAssert \{'competitive ruleset does not have a ranking criteria'}
	endif
	switch (($<ruleset>).ranking_criteria)
		case performance_value
		song_breakdown_shreddfest_determine_order_combined_player_scores {
			goal_results_column_data = <goal_results_column_data>
		}
		case elimination_order
		song_breakdown_shreddfest_determine_order_highest_player_score {
			goal_results_column_data = <goal_results_column_data>
		}
		case score
		song_breakdown_shreddfest_determine_order_band_score {
			goal_results_column_data = <goal_results_column_data>
			is_band_data = <is_band_data>
		}
	endswitch
	return {
		order = <order>
		is_tie = <is_tie>
	}
endscript

script song_breakdown_shreddfest_determine_order_band_score 
	RequireParams \{[
			goal_results_column_data
			is_band_data
		]
		all}
	GetBandsStatus
	GetArraySize <bands>
	order = []
	i = 0
	j = 0
	if (<is_band_data> = 1)
		begin
		if (<bands> [<i>].in_game)
			AddArrayElement {
				array = <order>
				element = {
					band_num = (<i> + 1)
					band_result = (<goal_results_column_data> [<j>])
				}
			}
			order = <array>
			<j> = (<j> + 1)
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	else
		GetNumPlayersInGame
		if (<num_players> > 0)
			GetFirstPlayer
			begin
			GetPlayerInfo <player> Band
			AddArrayElement {
				array = <order>
				element = {
					band_num = <Band>
					band_result = (<goal_results_column_data> [<j>])
				}
			}
			order = <array>
			<j> = (<j> + 1)
			GetNextPlayer player = <player>
			repeat <num_players>
		endif
	endif
	is_tie = 0
	GetArraySize <order>
	if (<array_size> > 1)
		begin
		<i> = 0
		<index_to_access> = -1
		begin
		left_score = ((<order> [<i>]).band_result)
		right_score = ((<order> [(<i> + 1)]).band_result)
		if (<right_score> > <left_score>)
			left_score_band_info_idx = (<order> [<i>])
			SetArrayElement arrayName = order index = <i> newValue = (<order> [(<i> + 1)])
			SetArrayElement arrayName = order index = (<i> + 1) newValue = <left_score_band_info_idx>
		endif
		<i> = (<i> + 1)
		repeat (<array_size> - 1)
		repeat <array_size>
		if ((<order> [0].band_result) = (<order> [1].band_result))
			is_tie = 1
		endif
	endif
	return {
		order = <order>
		is_tie = <is_tie>
	}
endscript

script song_breakdown_shreddfest_determine_order_combined_player_scores 
	RequireParams \{[
			goal_results_column_data
		]
		all}
	GetNumPlayersInGame
	GetBandsStatus
	GetArraySize <bands>
	order = []
	i = 0
	begin
	if (<bands> [<i>].in_game)
		if (<num_players> > 0)
			GetFirstPlayer
			combined_score = 0
			individual_scores = []
			j = 0
			begin
			GetPlayerInfo <player> Band
			if (<Band> = (<i> + 1))
				<combined_score> = (<combined_score> + (<goal_results_column_data> [<j>]))
				if GameMode_IsTeamGame
					AddArrayElement {
						array = <individual_scores>
						element = {
							player_num = <player>
							player_result = (<goal_results_column_data> [<j>])
						}
					}
					<individual_scores> = <array>
				endif
			endif
			GetNextPlayer player = <player>
			<j> = (<j> + 1)
			repeat <num_players>
			AddArrayElement {
				array = <order>
				element = {
					band_num = (<i> + 1)
					band_result = <combined_score>
					individual_results = <individual_scores>
				}
			}
			<order> = <array>
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	is_tie = 0
	GetArraySize <order>
	if (<array_size> > 1)
		begin
		<i> = 0
		begin
		left_score = ((<order> [<i>]).band_result)
		right_score = ((<order> [(<i> + 1)]).band_result)
		if (<right_score> > <left_score>)
			left_score_band_info_idx = (<order> [<i>])
			SetArrayElement arrayName = order index = <i> newValue = (<order> [(<i> + 1)])
			SetArrayElement arrayName = order index = (<i> + 1) newValue = <left_score_band_info_idx>
		endif
		<i> = (<i> + 1)
		repeat (<array_size> - 1)
		repeat <array_size>
		if ((<order> [0].band_result) = (<order> [1].band_result))
			is_tie = 1
		endif
	endif
	return {
		order = <order>
		is_tie = <is_tie>
	}
endscript

script song_breakdown_shreddfest_determine_order_highest_player_score 
	RequireParams \{[
			goal_results_column_data
		]
		all}
	GetNumPlayersInGame
	GetBandsStatus
	GetArraySize <bands>
	order = []
	i = 0
	begin
	if (<bands> [<i>].in_game)
		if (<num_players> > 0)
			GetFirstPlayer
			highest_score = -1
			individual_scores = []
			j = 0
			begin
			GetPlayerInfo <player> Band
			if (<Band> = (<i> + 1))
				if ((<goal_results_column_data> [<j>]) > <highest_score>)
					<highest_score> = (<goal_results_column_data> [<j>])
				endif
				if GameMode_IsTeamGame
					AddArrayElement {
						array = <individual_scores>
						element = {
							player_num = <player>
							player_result = (<goal_results_column_data> [<j>])
						}
					}
					<individual_scores> = <array>
				endif
			endif
			GetNextPlayer player = <player>
			<j> = (<j> + 1)
			repeat <num_players>
			AddArrayElement {
				array = <order>
				element = {
					band_num = (<i> + 1)
					band_result = <highest_score>
					individual_results = <individual_scores>
				}
			}
			<order> = <array>
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	is_tie = 0
	GetArraySize <order>
	if (<array_size> > 1)
		begin
		<i> = 0
		<index_to_access> = -1
		begin
		left_score = ((<order> [<i>]).band_result)
		right_score = ((<order> [(<i> + 1)]).band_result)
		if (<right_score> > <left_score>)
			left_score_band_info_idx = (<order> [<i>])
			SetArrayElement arrayName = order index = <i> newValue = (<order> [(<i> + 1)])
			SetArrayElement arrayName = order index = (<i> + 1) newValue = <left_score_band_info_idx>
		endif
		<i> = (<i> + 1)
		repeat (<array_size> - 1)
		repeat <array_size>
		if ((<order> [0].band_result) = (<order> [1].band_result))
			is_tie = 1
		endif
	endif
	return {
		order = <order>
		is_tie = <is_tie>
	}
endscript

script getBandScoreFromDetailedStats \{Band = 1}
	score = ($song_stats_backup_band [(<Band> - 1)].score)
	return score = <score>
endscript

script getBandStreakFromDetailedStats \{Band = 1}
	high_1p_streak = ($song_stats_backup_band [(<Band> - 1)].high_1p_streak)
	high_2p_streak = ($song_stats_backup_band [(<Band> - 1)].high_2p_streak)
	high_3p_streak = ($song_stats_backup_band [(<Band> - 1)].high_3p_streak)
	high_4p_streak = ($song_stats_backup_band [(<Band> - 1)].high_4p_streak)
	high_streak = <high_1p_streak>
	if (<high_2p_streak> > <high_streak>)
		high_streak = <high_2p_streak>
	endif
	if (<high_3p_streak> > <high_streak>)
		high_streak = <high_3p_streak>
	endif
	if (<high_4p_streak> > <high_streak>)
		high_streak = <high_4p_streak>
	endif
	return high_streak = <high_streak>
endscript

script getBandMultiplierFromDetailedStats \{Band = 1}
	high_mult = ($song_stats_backup_band [(<Band> - 1)].high_mult)
	return high_mult = <high_mult>
endscript
