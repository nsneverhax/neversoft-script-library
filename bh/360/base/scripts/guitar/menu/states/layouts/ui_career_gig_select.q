
script ui_init_career_gig_select 
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
endscript

script ui_create_career_gig_select 
	if IsSoundEventPlaying \{Surge_During_Stats_Screen}
		StopSoundEvent \{Surge_During_Stats_Screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if ScriptExists \{Crowd_Swells_During_Stats_Screen}
		killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
	endif
	spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = FrontEnd
			fadeouttime = 1
			fadeouttype = linear
		}}
	update_active_players_atoms
	progression_clear_rewards_just_unlocked
	if GotParam \{gig_index}
		RequireParams \{[
				gig_display_index
			]
			all}
	endif
	Change \{rich_presence_context = presence_gigboard_and_setlist}
	initial_venue_index = 0
	if GotParam \{venue_index}
		initial_venue_index = <venue_index>
	endif
	venue_list = ($progression_gig_list)
	GetPlayerInfo ($g_net_leader_player_num) controller
	GetPlayerInfo ($g_net_leader_player_num) is_local_client
	if ((CheckForSignIn local controller_index = <controller>) || (<is_local_client> = 0))
		GetPlayerInfo ($g_net_leader_player_num) GamerTag
		if ((($<GamerTag>) != qs(0x00000000)) && (($<GamerTag>) != qs(0x03ac90f0)))
			FormatText TextName = leader_text qs(0xc8b45038) l = ($<GamerTag>)
		else
			FormatText TextName = leader_text qs(0x8cd67c5b) l = ($g_net_leader_player_num)
		endif
	else
		FormatText TextName = leader_text qs(0x8cd67c5b) l = ($g_net_leader_player_num)
	endif
	user_control_helper_get_buttonchar \{button = yellow}
	prev_buttonchar = <buttonchar>
	user_control_helper_get_buttonchar \{button = orange}
	venue_checksum = ((<venue_list> [<initial_venue_index>]).venue)
	venue_title = ($LevelZones.<venue_checksum>.Title)
	Venue_banner = ($LevelZones.<venue_checksum>.banner)
	CreateScreenElement {
		parent = root_window
		id = career_gig_select_screen_id
		type = DescInterface
		desc = 'career_gig_select_gh5'
		venue_name_text = <venue_title>
		career_gig_select_leader_text = <leader_text>
		career_gig_select_prev_button_char = <prev_buttonchar>
		career_gig_select_next_button_char = <buttonchar>
		gigs_unlocked_strip_alpha = 0
		banner_ven_texture = <Venue_banner>
		tags = {
			current_venue_index = <initial_venue_index>
			current_gig_index = 0
			current_unlocked_gig_index = <initial_gig_index>
			current_gig_display_index = 1
			unlocked_gigs_size = -1
			current_venue_challenges = []
			current_gig_is_unlocked = 1
			current_gig_has_predefined_playlist = 1
		}
	}
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		career_gig_select_screen_id :SE_SetProps {
			exclusive_device = ($primary_controller)
		}
	endif
	career_gig_select_screen_id :SE_SetProps {
		event_handlers = [
			{pad_back generic_event_back params = {state = UIstate_career_venue_select data = {venue_index = <initial_venue_index> clear_venue_checksum}}}
		]
	}
	get_savegame_from_controller controller = ($primary_controller)
	FormatText checksumname = load_venue_checksum 'venue_%s' s = ($LevelZones.<venue_checksum>.name)
	GetGlobalTags savegame = <savegame> <load_venue_checksum>
	if GotParam \{gig_display_index}
		ui_career_gig_select_populate_gigs_menu {
			screen_id = career_gig_select_screen_id
			venue_index = <initial_venue_index>
			gig_index_to_focus = (<gig_display_index> - 1)
			bot_play = <bot_play>
		}
	elseif GotParam \{use_selected_index}
		career_gig_select_get_gig_display_index_from_current_challenge
		if GotParam \{gig_display_index}
			ui_career_gig_select_populate_gigs_menu {
				screen_id = career_gig_select_screen_id
				venue_index = <initial_venue_index>
				gig_index_to_focus = <gig_display_index>
				bot_play = <bot_play>
			}
		else
			ui_career_gig_select_populate_gigs_menu {
				screen_id = career_gig_select_screen_id
				venue_index = <initial_venue_index>
				gig_index_to_focus = <selected_index>
				bot_play = <bot_play>
			}
		endif
	else
		ui_career_gig_select_populate_gigs_menu {
			screen_id = career_gig_select_screen_id
			venue_index = <initial_venue_index>
			bot_play = <bot_play>
		}
	endif
	ui_career_gig_select_set_next_venue_unlock_text \{screen_id = career_gig_select_screen_id}
	ui_career_gig_select_set_total_progression_text {
		screen_id = career_gig_select_screen_id
		savegame = <savegame>
		venue_checksum = <venue_checksum>
		load_venue_checksum = <load_venue_checksum>
	}
	if GotParam \{gigs_menu_id}
		AssignAlias id = <gigs_menu_id> alias = current_menu
	endif
	LaunchEvent \{type = focus
		target = career_gig_select_screen_id}
	destroy_loading_screen
endscript

script gig_do_physics_spawned 
	create_2D_spring_system \{desc_id = career_gig_select_screen_id
		num_springs = 1
		stiffness = 50
		rest_length = 1}
	if career_gig_select_screen_id :Desc_ResolveAlias \{name = alias_skull_reg_container_l
			param = skull_reg_id}
		<skull_reg_id> :Obj_SpawnScript ui_herkyjerky
	else
		ScriptAssert \{'pdetrich'}
	endif
endscript

script ui_destroy_career_gig_select 
	clean_up_user_control_helpers
	killspawnedscript \{name = career_gig_select_pulsate_unlocked_gigs_strip}
	if ScreenElementExists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :GetSingleTag \{players_list_id}
		if ScreenElementExists id = <players_list_id>
			DestroyScreenElement id = <players_list_id>
		endif
		DestroyScreenElement \{id = career_gig_select_screen_id}
	endif
endscript

script ui_deinit_career_gig_select 
	songlist_kill_cycle_song_previews
endscript

script ui_return_career_gig_select 
	if ScreenElementExists \{id = career_gig_select_screen_id}
		if NOT ScreenElementExists \{id = band_lobby_popup_menu}
			LaunchEvent \{type = focus
				target = career_gig_select_screen_id}
		else
			band_lobby_update_button_helpers controller = ($primary_controller) Menu = playerslist
		endif
	endif
	if (($g_suppress_anim_in) = 1)
		Change \{g_suppress_anim_in = 0}
	endif
endscript

script career_gig_select_highlight_gig_and_update_info_box 
	if GotParam \{no_highlight}
		if ScreenElementExists \{id = career_gig_select_screen_id}
			FormatText \{TextName = challenge_title_text
				qs(0x26bae376)}
			FormatText \{TextName = challenge_desc_text
				qs(0x00000000)}
			career_gig_select_screen_id :SE_SetProps career_gig_select_challenge_title_text = <challenge_title_text>
			career_gig_select_screen_id :SE_SetProps career_gig_select_challenge_desc_text = <challenge_desc_text>
		endif
	else
		RequireParams \{[
				selection_id
				gig_info_struct
			]
			all}
		<selection_id> :SE_SetProps rgba = ($menu_focus_color)
		if ScreenElementExists \{id = career_gig_select_screen_id}
			career_gig_select_screen_id :SE_SetProps career_gig_select_challenge_title_text = (<gig_info_struct>.name)
			career_gig_select_screen_id :SE_SetProps career_gig_select_challenge_desc_text = (<gig_info_struct>.descrip)
		endif
	endif
endscript

script career_gig_select_unfocus_selection_text 
	RequireParams \{[
			selection_id
		]
		all}
	<selection_id> :SE_SetProps rgba = GH51_blue_lt
endscript

script career_gig_select_setup_songlist 
	RequireParams \{[
			gig_struct
		]
		all}
	if NOT StructureContains structure = <gig_struct> name = playlist_type
		ScriptAssert qs(0x6d8c749d) a = (<gig_struct>.id)
	endif
	songlist_clear_playlist
	if ((<gig_struct>.playlist_type) = predefined)
		songlist_clear_filterspec
		songlist_dont_force_num_songs
		GMan_SongFunc \{func = clear_play_list}
		GMan_SongFunc func = add_song_array_to_play_list params = {song_array = (<gig_struct>.predefined_playlist)}
		Change current_playlist = (<gig_struct>.predefined_playlist)
	elseif ((<gig_struct>.playlist_type) = filtered)
		if StructureContains structure = <gig_struct> name = filterspec
			songlist_change_filterspec filterspec = (<gig_struct>.filterspec) invert_filterspec = (<gig_struct>.invert_filterspec)
		else
			ScriptAssert qs(0xc9113ef6) a = (<gig_struct>.id)
		endif
		if StructureContains structure = <gig_struct> name = num_songs
			songlist_force_num_songs_to_choose num_songs = (<gig_struct>.num_songs)
		else
			ScriptAssert qs(0x14164272) a = (<gig_struct>.id)
			songlist_dont_force_num_songs
		endif
	elseif ((<gig_struct>.playlist_type) = open)
		songlist_clear_filterspec
		if StructureContains structure = <gig_struct> name = num_songs
			songlist_force_num_songs_to_choose num_songs = (<gig_struct>.num_songs)
		else
			ScriptAssert qs(0x11e9bccd) a = (<gig_struct>.id)
			songlist_dont_force_num_songs
		endif
	endif
endscript

script career_gig_select_set_gig 
	RequireParams \{[
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	if ScreenElementExists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :GetTags
		career_gig_select_get_challenges_for_venue venue_list_index = <current_venue_index>
		gig_global = (<challenges> [<current_gig_index>])
		gig_struct = ($<gig_global>)
		career_gig_select_set_gig_info gig_struct = <gig_struct>
		career_gig_select_setup_songlist gig_struct = <gig_struct>
	endif
endscript

script career_gig_select_set_gig_and_continue_to_gig_info 
	RequireParams \{[
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	generic_event_choose {
		state = UIstate_career_gig_info
		data = {
			from_pause_menu = 0
			gig_global = <gig_global>
			venue_index = <venue_index>
			gig_index = <gig_index>
			gig_display_index = <gig_display_index>
			device_num = <device_num>
			use_timer = 0
		}
	}
endscript

script career_gig_select_set_gig_and_continue_to_gameplay 
	RequireParams \{[
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	career_gig_select_set_gig {
		gig_global = <gig_global>
		venue_index = <venue_index>
		gig_index = <gig_index>
		gig_display_index = <gig_display_index>
	}
	career_gig_select_continue_to_gameplay gig_struct = ($<gig_global>)
endscript

script career_gig_select_continue_to_gameplay 
	RequireParams \{[
			gig_struct
		]
		all}
	venue = (<gig_struct>.venue)
	if StructureContains structure = ($LevelZones.<venue>) name = loading_movie
		create_venue_loading_screen movie_params = ($LevelZones.<venue>)
	else
		create_loading_screen
	endif
	generic_event_choose \{state = uistate_play_song}
endscript

script career_gig_select_set_gig_and_continue_to_songlist 
	RequireParams \{[
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	career_gig_select_set_gig {
		gig_global = <gig_global>
		venue_index = <venue_index>
		gig_index = <gig_index>
		gig_display_index = <gig_display_index>
	}
	generic_event_choose \{state = uistate_songlist
		data = {
			mode = playlist
		}}
endscript

script career_gig_select_set_gig_info 
	RequireParams \{[
			gig_struct
		]
		all}
	GMan_ShutDownAllGoals \{preserve_career}
	GMan_VenueFunc {goal = career tool = venue_handler func = set_venue params = {venue_name = (<gig_struct>.venue)}}
	GMan_ChallengeManagerFunc goal = career tool = challenges func = set_current_challenge params = {challenge_id = (<gig_struct>.id)}
endscript

script net_career_gig_select_set_gig_and_continue_to_gameplay 
	RequireParams \{[
			device_num
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	GetPlayerInfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		GetPlayerInfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		GetPlayerInfo ($g_net_leader_player_num) controller
	endif
	if (<controller> = <device_num>)
		career_gig_select_set_gig {
			gig_global = <gig_global>
			venue_index = <venue_index>
			gig_index = <gig_index>
			gig_display_index = <gig_display_index>
		}
		generic_event_choose {
			state = UIstate_career_gig_info
			data = {
				from_pause_menu = 0
				gig_global = <gig_global>
				venue_index = <venue_index>
				gig_index = <gig_index>
				gig_display_index = <gig_display_index>
				device_num = <device_num>
				use_timer = 1
			}
		}
	endif
endscript

script net_career_gig_select_continue_to_songlist_for_host 
	RequireParams \{[
			device_num
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	gig_struct = ($<gig_global>)
	GetPlayerInfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		GetPlayerInfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		GetPlayerInfo ($g_net_leader_player_num) controller
	endif
	if (<device_num> = <controller>)
		generic_event_choose {
			state = UIstate_career_gig_info
			data = {
				from_pause_menu = 0
				gig_global = <gig_global>
				venue_index = <venue_index>
				gig_index = <gig_index>
				gig_display_index = <gig_display_index>
				device_num = <device_num>
				use_timer = 1
			}
		}
	endif
endscript

script net_career_gig_select_destroy_players_list 
	RequireParams \{[
			players_list_id
		]
		all}
	DestroyScreenElement id = <players_list_id>
	LaunchEvent \{type = focus
		target = career_gig_select_screen_id}
	if career_gig_select_screen_id :Desc_ResolveAlias \{name = alias_career_gig_select_gigs_menu}
		LaunchEvent type = focus target = <resolved_id>
	endif
	allow_choose = 0
	if ScreenElementExists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :GetSingleTag \{current_gig_is_unlocked}
		allow_choose = <current_gig_is_unlocked>
	endif
	career_gig_select_setup_helper_pills_for_gig_select allow_choose = <allow_choose>
endscript

script career_gig_select_setup_helper_pills_for_gig_select 
	RequireParams \{[
			allow_choose
		]
		all}
	clean_up_user_control_helpers
	if InInternetMode
		if (<allow_choose> = 1)
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		endif
	else
		if (<allow_choose> = 1)
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		endif
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if InInternetMode
		add_user_control_helper \{text = qs(0xa83061c6)
			button = yellow
			z = 100000}
	endif
	if (<allow_choose> = 1)
		if NOT CD
			add_user_control_helper \{text = qs(0xca33ae52)
				button = blue
				z = 100000}
		endif
	endif
endscript

script career_gig_select_get_challenges_for_venue 
	RequireParams \{[
			venue_list_index
		]
		all}
	venue_list = ($progression_gig_list)
	GMan_ChallengeManagerFunc {
		goal = career
		tool = challenges
		func = get_challenges_for_venue
		params = {
			venue = (<venue_list> [<venue_list_index>].venue)
		}
	}
	if NOT GotParam \{challenge_list}
		ScriptAssert 'No gigs found for venue %a in career_gig_select' a = <loaded_venue>
	endif
	return challenges = <challenge_list>
endscript

script career_gig_select_scroll_venue 
	RequireParams \{[
			direction
			bot_play
		]
		all}
	if ScreenElementExists \{id = career_gig_select_screen_id}
		if career_gig_select_screen_id :Desc_ResolveAlias \{name = alias_career_gig_select_location_text_window}
			gig_select_venue_window_id = <resolved_id>
			career_gig_select_get_next_unlocked_venue direction = <direction>
			if (<new_venue_found> = 1)
				venue_list = ($progression_gig_list)
				venue_checksum = ((<venue_list> [<new_venue_index>]).venue)
				venue_title = ($LevelZones.<venue_checksum>.Title)
				if (<direction> = left)
					new_panel_pos = (375.0, 0.0)
					current_panel_pos = (-375.0, 0.0)
				else
					new_panel_pos = (-375.0, 0.0)
					current_panel_pos = (375.0, 0.0)
				endif
				CreateScreenElement {
					parent = <gig_select_venue_window_id>
					type = TextBlockElement
					text = <venue_title>
					font = fontgrid_title_a1
					pos_anchor = [center , center]
					just = [center , center]
					Pos = <new_panel_pos>
					rgba = <venue_title_rgba>
					z_priority = 5
					dims = (750.0, 70.0)
					fit_width = `scale	each	line	if	larger`
					fit_height = `scale	down	if	larger`
					internal_just = [center , center]
					alpha = 1
				}
				if GetScreenElementChildren id = <gig_select_venue_window_id>
					(<children> [0]) :SE_SetProps Pos = <current_panel_pos> time = 0.1
					(<children> [1]) :SE_SetProps Pos = (0.0, 0.0) time = 0.1
					DestroyScreenElement id = (<children> [0])
					career_gig_select_screen_id :SetTags {
						current_venue_index = <new_venue_index>
					}
				endif
				ui_career_gig_select_pulsate_venue_arrow direction = <direction>
				ui_career_gig_select_set_next_venue_unlock_text \{screen_id = career_gig_select_screen_id}
				ui_career_gig_select_populate_gigs_menu venue_index = <new_venue_index> bot_play = <bot_play>
			endif
		endif
	endif
endscript

script career_gig_select_get_next_unlocked_venue 
	RequireParams \{[
			direction
		]
		all}
	if ScreenElementExists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :GetTags \{current_venue_index}
		venue_list = ($progression_gig_list)
		GetArraySize <venue_list>
		num_venues = (<array_size>)
		new_venue_index = <current_venue_index>
		begin
		if (<direction> = left)
			if (<new_venue_index> = (<num_venues> - 1))
				<new_venue_index> = 0
			else
				<new_venue_index> = (<new_venue_index> + 1)
			endif
		else
			if (<new_venue_index> = 0)
				<new_venue_index> = (<num_venues> - 1)
			else
				<new_venue_index> = (<new_venue_index> - 1)
			endif
		endif
		venue_checksum = ((<venue_list> [<new_venue_index>]).venue)
		venue_title = ($LevelZones.<venue_checksum>.Title)
		get_savegame_from_controller controller = ($primary_controller)
		FormatText checksumname = load_venue_checksum 'venue_%s' s = ($LevelZones.<venue_checksum>.name)
		GetGlobalTags savegame = <savegame> <load_venue_checksum>
		if (<unlocked> = 1)
			return {
				new_venue_found = 1
				new_venue_index = <new_venue_index>
			}
		endif
		repeat <num_venues>
		return \{new_venue_found = 0}
	endif
endscript

script career_gig_select_get_next_unlocked_gig 
	RequireParams \{[
			screen_id
			direction
			gig_index
			challenges_list
		]
		all}
	if ScreenElementExists id = <screen_id>
		GetArraySize <challenges_list>
		if (<array_size> > 0)
			i = <gig_index>
			if GotParam \{skip_current}
				if (<direction> = up)
					i = (<gig_index> - 1)
				else
					i = (<gig_index> + 1)
				endif
			endif
			get_savegame_from_controller controller = ($primary_controller)
			begin
			if (<direction> = up)
				if (<i> < 0)
					break
				endif
			else
				if (<i> > (<array_size> - 1))
					break
				endif
			endif
			gig_info_global = (<challenges_list> [<i>])
			gig_info_struct = ($<gig_info_global>)
			GetGlobalTags savegame = <savegame> <gig_info_global>
			if (<unlocked> = 1)
				return {
					new_gig_found = 1
					new_gig_index = <i>
				}
			endif
			if (<direction> = up)
				<i> = (<i> - 1)
			else
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
		return \{new_gig_found = 0}
	endif
endscript

script ui_career_gig_select_populate_gigs_menu 
	RequireParams \{[
			venue_index
			bot_play
		]
		all}
	if ScreenElementExists \{id = career_gig_select_screen_id}
		if career_gig_select_screen_id :Desc_ResolveAlias \{name = alias_career_gig_select_gigs_menu
				param = gigs_menu}
			<gigs_menu> :SE_SetProps {
				event_handlers = [
					{pad_up ui_career_gig_select_scroll_sound params = {up}}
					{pad_down ui_career_gig_select_scroll_sound params = {down}}
				]
			}
			career_gig_select_get_challenges_for_venue venue_list_index = <venue_index>
			GetArraySize <challenges>
			get_savegame_from_controller controller = ($primary_controller)
			num_unlocked_unplayed_gigs = 0
			if (<array_size> > 0)
				i = 0
				gig_display_index = 1
				begin
				<gig_info_global> = (<challenges> [<i>])
				<gig_info_struct> = ($<gig_info_global>)
				GetGlobalTags savegame = <savegame> <gig_info_global>
				if (<unlocked> = 1)
					choose_script = career_gig_select_set_gig_and_continue_to_gig_info
					choose_params = {
						gig_global = <gig_info_global>
						venue_index = <venue_index>
						gig_index = <i>
						gig_display_index = <gig_display_index>
					}
					if (<has_been_played> = 1)
						gig_icon_alpha = 0
						gig_sub_icon_alpha = 0
						gig_icon_texture = icon_unlocked
					else
						is_unlocked_gig_new gig_info_struct = <gig_info_struct> venue_index = <venue_index>
						gig_icon_alpha = <is_new_unlocked_gig>
						gig_sub_icon_alpha = 0
						gig_icon_texture = icon_unlocked
						<num_unlocked_unplayed_gigs> = (<num_unlocked_unplayed_gigs> + 1)
					endif
					if (<gig_info_global> = ($gig_champion))
						gig_icon_texture = icon_champion
						gig_icon_alpha = 1
						if (<has_been_played> = 0)
							gig_sub_icon_alpha = 1
						endif
					elseif ArrayContains array = ($gig_sponsors) contains = <gig_info_global>
						gig_icon_texture = icon_sponsor
						gig_icon_alpha = 1
						if (<has_been_played> = 0)
							gig_sub_icon_alpha = 1
						endif
					elseif ArrayContains array = ($gig_encores) contains = <gig_info_global>
						gig_icon_texture = icon_encore
						gig_icon_alpha = 1
						if (<has_been_played> = 0)
							gig_sub_icon_alpha = 1
						endif
					elseif ArrayContains array = ($gig_celeb_intros) contains = <gig_info_global>
						gig_icon_texture = icon_celebrity
						gig_icon_alpha = 1
						if (<has_been_played> = 0)
							gig_sub_icon_alpha = 1
						endif
					endif
					gig_title = (<gig_info_struct>.name)
					CreateScreenElement {
						parent = <gigs_menu>
						type = DescInterface
						desc = 'career_gig_select_gig_info_patch_gh5'
						career_gig_select_challenge_title_text = <gig_title>
						gig_icon_alpha = <gig_icon_alpha>
						gig_icon_texture = <gig_icon_texture>
						gig_sub_icon_alpha = <gig_sub_icon_alpha>
						song_name_text = <gig_title>
						song_name_rgba = GH51_blue_lt
						song_artist_text = qs(0x03ac90f0)
						song_artist_rgba = GH51_blue_lt
						alpha = 1
						autoSizeDims = true
						event_handlers = [
							{focus ui_career_gig_select_focus_gig params = {challenges = <challenges> playlist_type = (<gig_info_struct>.playlist_type) unlocked = 1}}
							{unfocus ui_career_gig_select_unfocus_gig params = {playlist_type = (<gig_info_struct>.playlist_type) unlocked = 1}}
							{pad_choose <choose_script> params = {<choose_params>}}
							{pad_option ui_career_gig_select_debug_win_gig params = {<choose_params> gig_info_global = <gig_info_global>}}
						]
						tags = {
							gig_index = <i>
							unlocked_gig_index = (<gig_display_index> - 1)
						}
					}
					if InInternetMode
						<id> :SE_SetProps {
							event_handlers = [
								{
									pad_option2
									net_career_venue_select_show_players_list
									params = {
										screen_id = career_gig_select_screen_id
										menu_alias = alias_career_gig_select_gigs_menu
										destroy_players_list_script = net_career_gig_select_destroy_players_list
									}
								}
							]
						}
					endif
					song_breakdown_check_bot_play
					if (<bot_play> = 0)
						<id> :SE_SetProps {
							exclusive_device = ($primary_controller)
						}
					endif
					ui_career_gig_select_update_gig_description {
						gig_desc_id = <id>
						gig_global = <gig_info_global>
						gig_info_struct = <gig_info_struct>
						savegame = <savegame>
					}
					if (<has_been_played> = 0)
						is_unlocked_gig_new gig_info_struct = <gig_info_struct> venue_index = <venue_index>
						if (<is_new_unlocked_gig> = 1)
							career_gig_select_screen_id :Obj_SpawnScriptNow \{career_gig_select_pulsate_unlocked_gigs_strip}
						endif
					endif
				else
					gig_title = qs(0xdebf525e)
					CreateScreenElement {
						parent = <gigs_menu>
						type = DescInterface
						desc = 'career_gig_select_gig_info_patch_gh5'
						song_entry_pos = {(0.0, 12.0) relative}
						career_gig_select_challenge_title_text = <gig_title>
						challenge_container_alpha = 0
						gig_icon_alpha = 1
						gig_icon_texture = icon_lock
						gig_sub_icon_alpha = 0
						song_name_text = <gig_title>
						song_name_rgba = GH51_blue_lt
						song_artist_text = qs(0x03ac90f0)
						song_artist_rgba = GH51_blue_lt
						alpha = 1
						autoSizeDims = true
						event_handlers = [
							{focus ui_career_gig_select_focus_gig params = {challenges = <challenges> playlist_type = (<gig_info_struct>.playlist_type) unlocked = 0}}
							{unfocus ui_career_gig_select_unfocus_gig params = {playlist_type = (<gig_info_struct>.playlist_type) unlocked = 0}}
							{pad_choose ui_career_gig_select_denied_sound}
						]
						tags = {
							gig_index = <i>
							unlocked_gig_index = (<gig_display_index> - 1)
						}
					}
					if InInternetMode
						<id> :SE_SetProps {
							event_handlers = [
								{
									pad_option2
									net_career_venue_select_show_players_list
									params = {
										screen_id = career_gig_select_screen_id
										menu_alias = alias_career_gig_select_gigs_menu
										destroy_players_list_script = net_career_gig_select_destroy_players_list
									}
								}
							]
						}
					endif
					song_breakdown_check_bot_play
					if (<bot_play> = 0)
						<id> :SE_SetProps {
							exclusive_device = ($primary_controller)
						}
					endif
					ui_career_gig_select_update_gig_description_for_locked_gigs gig_desc_id = <id>
				endif
				<gig_display_index> = (<gig_display_index> + 1)
				<i> = (<i> + 1)
				repeat <array_size>
				if (<i> > 3)
					career_gig_select_screen_id :SE_SetProps \{scrollbar_alpha = 1}
				else
					career_gig_select_screen_id :SE_SetProps \{scrollbar_alpha = 0}
				endif
				career_gig_select_screen_id :SetTags unlocked_gigs_size = (<gig_display_index> - 1)
			endif
			if (<bot_play> = 0)
				<gigs_menu> :SE_SetProps {
					exclusive_device = ($primary_controller)
				}
			endif
			AssignAlias id = <gigs_menu> alias = current_menu
			if GotParam \{gig_index_to_focus}
				LaunchEvent type = focus target = <gigs_menu> data = {child_index = <gig_index_to_focus>}
			else
				LaunchEvent type = focus target = <gigs_menu> data = {child_index = 0}
			endif
			return gigs_menu_id = <gigs_menu>
		endif
	endif
endscript

script is_unlocked_gig_new 
	RequireParams \{[
			gig_info_struct
			venue_index
		]
		all}
	GetArraySize ($gig_progression)
	i = 0
	begin
	if ((<gig_info_struct>.venue) = ($progression_gig_list [<venue_index>].venue))
		if ((<gig_info_struct>.id) = ($gig_progression [<i>].gig_to_unlock))
			if NOT StructureContains structure = ($gig_progression [<i>]) name = unlocked_with_venue
				return \{is_new_unlocked_gig = 1}
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return \{is_new_unlocked_gig = 0}
endscript

script ui_career_gig_select_update_gig_description 
	RequireParams \{[
			gig_desc_id
			gig_global
			gig_info_struct
			savegame
		]
		all}
	if <gig_desc_id> :Desc_ResolveAlias name = alias_career_gig_select_progress_menu
		progress_menu_id = <resolved_id>
		DestroyScreenElement id = <progress_menu_id> preserve_parent
	endif
	get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
	progression_get_gig_song_stars_earned gig_name = <gig_global> player = <player_num>
	progression_get_gig_stars_total gig_name = <gig_global>
	progression_get_earned_song_stars_array gig_name = <gig_global> player = <player_num>
	FormatText TextName = gig_progress_text qs(0x074fa5df) e = <gig_stars_earned> t = <gig_max_stars>
	<gig_desc_id> :SE_SetProps {
		career_gig_select_progress_title_text = <gig_progress_text>
	}
	GetGlobalTags savegame = <savegame> <gig_global>
	star_rgba = [255 255 255 255]
	if (<earned_gold_stars> = 1)
		star_rgba = GH5_gold_md
	endif
	if <gig_desc_id> :Desc_ResolveAlias name = alias_career_gig_select_challenge_menu param = challenge_menu_id
		DestroyScreenElement id = <challenge_menu_id> preserve_parent
		if (<gig_info_struct>.playlist_type = predefined)
			playlist = (<gig_info_struct>.predefined_playlist)
			prop_struct = ($on_disc_props)
			GetArraySize <playlist>
			j = 0
			text_rgba = [175 225 230 255]
			begin
			FormatText TextName = artist_text qs(0x35b12509) a = (($<prop_struct>).(<playlist> [<j>]).artist)
			<gig_desc_id> :SE_SetProps {
				song_name_text = (($<prop_struct>).(<playlist> [<j>]).Title)
				song_artist_text = <artist_text>
			}
			if GotParam \{progress_menu_id}
				FormatText TextName = stars_text qs(0x4d4555da) s = (<song_stars> [<j>])
				star_count_id = <progress_menu_id>
				num_star_loops = 5
				if ((<song_stars> [<j>]) = 6)
					<num_star_loops> = 6
				endif
				active_star_counter = 0
				begin
				if (<active_star_counter> < (<song_stars> [<j>]))
					CreateScreenElement {
						parent = <star_count_id>
						type = SpriteElement
						pos_anchor = [center , center]
						just = [center , center]
						z_priority = 10
						dims = (84.0, 84.0)
						texture = songlist_star_full
						alpha = 1
						rgba = <star_rgba>
					}
				else
					CreateScreenElement {
						parent = <star_count_id>
						type = SpriteElement
						pos_anchor = [center , center]
						just = [center , center]
						z_priority = 10
						dims = (84.0, 84.0)
						texture = songlist_star_full
						alpha = 0.25
						rgba = grey_light
					}
				endif
				<active_star_counter> = (<active_star_counter> + 1)
				repeat <num_star_loops>
			endif
			<j> = (<j> + 1)
			repeat <array_size>
		else
			if ((<gig_info_struct>.num_songs) = 1)
				FormatText TextName = gig_text qs(0x79c625c2) n = (<gig_info_struct>.num_songs)
			else
				FormatText TextName = gig_text qs(0xff6165b9) n = (<gig_info_struct>.num_songs)
			endif
			if GotParam \{progress_menu_id}
				get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
				progression_get_gig_challenge_stars_earned gig_name = <gig_global> player = <player_num>
				star_count_id = <progress_menu_id>
				song_stars_earned = (<gig_stars_earned> - <challenge_stars>)
				num_star_loops = 5
				if (<song_stars_earned> = 6)
					<num_star_loops> = 6
				endif
				active_star_counter = 0
				begin
				if (<active_star_counter> < <song_stars_earned>)
					CreateScreenElement {
						parent = <star_count_id>
						type = SpriteElement
						pos_anchor = [center , center]
						just = [center , center]
						z_priority = 10
						dims = (84.0, 84.0)
						texture = songlist_star_full
						alpha = 1
						rgba = <star_rgba>
					}
				else
					CreateScreenElement {
						parent = <star_count_id>
						type = SpriteElement
						pos_anchor = [center , center]
						just = [center , center]
						z_priority = 10
						dims = (84.0, 84.0)
						texture = songlist_star_full
						alpha = 0.25
						rgba = grey_light
					}
				endif
				<active_star_counter> = (<active_star_counter> + 1)
				repeat <num_star_loops>
			endif
		endif
		GetScreenElementDims id = <gig_desc_id>
		get_rewards_for_gig gig_name = <gig_global>
		career_gig_select_get_challenge_achievement_display gig_global = <gig_global>
		career_gig_select_update_challenge_stars_menu strip_id = <gig_desc_id> gig_global = <gig_global>
		career_gig_select_get_band_challenge_icon gig_struct = <gig_info_struct>
		challenge_struct = {
		}
		if GotParam \{challenge_icon}
			AddParam structure_name = challenge_struct name = challenge_icon_texture value = <challenge_icon>
		else
			AddParam \{structure_name = challenge_struct
				name = challenge_icon_rgba
				value = [
					0
					0
					0
					0
				]}
		endif
		if (<challenge_achievement_icon> = None ||
				(<challenge_achievement_icon> = icon_difficulty_vinyl && <gig_rewards>.required_difficulty != None))
			AddParam \{structure_name = challenge_struct
				name = challenge_achieved_alpha
				value = 0}
		else
			AddParam \{structure_name = challenge_struct
				name = challenge_icon_pos
				value = (-40.0, 8.0)}
			AddParam \{structure_name = challenge_struct
				name = challenge_achieved_pos
				value = (-60.0, -25.0)}
			AddParam structure_name = challenge_struct name = challenge_achieved_texture value = <challenge_achievement_icon>
		endif
		<gig_desc_id> :SE_SetProps {
			<challenge_struct>
		}
	endif
endscript

script ui_career_gig_select_update_gig_description_for_locked_gigs 
	RequireParams \{[
			gig_desc_id
		]
		all}
	if <gig_desc_id> :Desc_ResolveAlias name = alias_career_gig_select_progress_menu
		progress_menu_id = <resolved_id>
		DestroyScreenElement id = <progress_menu_id> preserve_parent
	endif
endscript

script ui_career_gig_select_focus_gig 
	RequireParams \{[
			challenges
			playlist_type
			unlocked
		]
		all}
	if NOT ScreenElementExists \{id = career_gig_select_screen_id}
		ScriptAssert \{'could not find career_gig_select_screen_id!'}
	endif
	Obj_GetID
	<objID> :GetTags
	songlist_kill_cycle_song_previews
	gig_global = (<challenges> [<gig_index>])
	<objID> :SE_SetProps {
		career_gig_select_progress_title_alpha = 1
		highlight_bar_alpha = 1
		alpha = 1
		song_name_rgba = [40 40 40 255]
		song_artist_rgba = [0 0 0 255]
	}
	ExtendCRCWithString checksum = <objID> string = '_particle'
	Obj_SpawnScript create_ui_highlight_particles params = {id = <ExtendedChecksum> Pos = (900.0, -10.0) z = 0}
	career_gig_select_screen_id :GetSingleTag \{current_gig_is_unlocked}
	career_gig_select_screen_id :GetSingleTag \{current_gig_has_predefined_playlist}
	if (<unlocked> = 1)
		if <objID> :Desc_ResolveAlias name = alias_career_gig_select_progress_menu
			<resolved_id> :SE_SetProps alpha = 1
		endif
		if ((($<gig_global>).playlist_type) = predefined)
			Menu_Music_Off
			playlist = (($<gig_global>).predefined_playlist)
			spawnscriptnow songlist_cycle_song_previews params = {songs = <playlist>}
			<current_gig_has_predefined_playlist> = 1
		else
			if ((<current_gig_is_unlocked> = 1) && (<current_gig_has_predefined_playlist> = 1))
				if IsSoundEventPlaying \{Surge_During_Stats_Screen}
					StopSoundEvent \{Surge_During_Stats_Screen
						fade_time = 1.5
						fade_type = linear}
				endif
				if ScriptExists \{Crowd_Swells_During_Stats_Screen}
					killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
				endif
				menu_music_on
			endif
			<current_gig_has_predefined_playlist> = 0
		endif
	else
		if ((<current_gig_is_unlocked> = 1) && (<current_gig_has_predefined_playlist> = 1))
			if IsSoundEventPlaying \{Surge_During_Stats_Screen}
				StopSoundEvent \{Surge_During_Stats_Screen
					fade_time = 1.5
					fade_type = linear}
			endif
			if ScriptExists \{Crowd_Swells_During_Stats_Screen}
				killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
			endif
			menu_music_on
		endif
		<current_gig_has_predefined_playlist> = 0
	endif
	career_gig_select_screen_id :SetTags {
		current_gig_index = <gig_index>
		current_unlocked_gig_index = <unlocked_gig_index>
		current_gig_is_unlocked = <unlocked>
		current_gig_has_predefined_playlist = <current_gig_has_predefined_playlist>
	}
	career_gig_select_screen_id :GetSingleTag \{unlocked_gigs_size}
	set_generic_menu_scrollbar_pos \{id = career_gig_select_screen_id
		scrollbar_length = 300}
	if ScreenElementExists \{id = career_gig_select_screen_id}
		GetArraySize <challenges>
		if (<gig_index> = 0)
			<selection> = top
		elseif (<gig_index> = (<array_size> - 1))
			<selection> = bottom
		else
			<selection> = middle
		endif
		career_gig_select_screen_id :SetTags selection = <selection>
	endif
	career_gig_select_setup_helper_pills_for_gig_select allow_choose = <unlocked> predefined = <current_gig_has_predefined_playlist>
endscript

script ui_career_gig_select_unfocus_gig 
	RequireParams \{[
			playlist_type
			unlocked
		]
		all}
	Obj_GetID
	<objID> :SE_SetProps {
		highlight_bar_alpha = 0
		song_name_rgba = GH51_blue_lt
		song_artist_rgba = GH51_blue_lt
	}
	ExtendCRCWithString checksum = <objID> string = '_particle'
	Destroy2DParticleSystem id = <ExtendedChecksum> kill_when_empty
	if <objID> :Desc_ResolveAlias name = alias_career_gig_select_progress_menu
		<resolved_id> :SE_SetProps alpha = 1
	endif
endscript

script ui_career_gig_select_set_scroll_bar_pos 
	RequireParams \{[
			screen_id
			gig_index
			gigs_array_size
		]
		all}
	if ((<gigs_array_size> - 1) > 0)
		if ScreenElementExists id = <screen_id>
			posx = 0
			posy = (25 + ((340.0 * <gig_index>) / (<gigs_array_size> - 1)))
			<screen_id> :SE_SetProps {
				slider_nub_cont_pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posy>))
				time = 0.1
			}
		endif
	else
		if ScreenElementExists id = <screen_id>
			posx = 0
			posy = 25
			<screen_id> :SE_SetProps {
				slider_nub_cont_pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posy>))
				time = 0.1
			}
		endif
	endif
	<screen_id> :SetTags current_unlocked_gig_index = <gig_index>
endscript

script ui_career_gig_select_set_gig_info 
	if ScreenElementExists \{id = career_gig_select_screen_id}
		if GotParam \{clear_gig_info}
			career_gig_select_screen_id :SE_SetProps \{temp_gig_info_text = qs(0x03ac90f0)
				temp_band_config_text = qs(0x03ac90f0)}
		else
			RequireParams \{[
					gig_index
				]
				all}
			career_gig_select_screen_id :GetTags \{current_venue_index}
			career_gig_select_get_challenges_for_venue venue_list_index = <current_venue_index>
			GetArraySize <challenges>
			temp_gig_info_text = qs(0x03ac90f0)
			if (<array_size> > 0)
				<gig_info_global> = (<challenges> [<gig_index>])
				temp_gig_info_text = (($<gig_info_global>).descrip)
			endif
			career_gig_select_screen_id :SE_SetProps {
				temp_gig_info_text = <temp_gig_info>
			}
		endif
	endif
endscript

script ui_career_gig_select_set_next_venue_unlock_text 
	RequireParams \{[
			screen_id
		]
		all}
	if ScreenElementExists id = <screen_id>
		progression_get_stars_to_next_venue
		if (<stars_to_next> <= 0)
			<screen_id> :SE_SetProps {
				locked_unlocked_menu_alpha = 0
				locked_unlocked_text_alpha = 1
				next_unlock_venue_text = qs(0x03ac90f0)
			}
		else
			FormatText TextName = stars_num_text qs(0x73307931) s = <stars_to_next>
			FormatText \{TextName = next_venue_text
				qs(0xc20814f2)}
			<screen_id> :SE_SetProps {
				next_unlock_num_text = <stars_num_text>
				next_unlock_venue_text = <next_venue_text>
				locked_unlocked_menu_alpha = 1
				locked_unlocked_text_alpha = 0
			}
		endif
		return stars_to_next_venue = <stars_to_next>
	endif
endscript

script ui_career_gig_select_set_total_progression_text 
	RequireParams \{[
			screen_id
			savegame
			venue_checksum
			load_venue_checksum
		]
		all}
	if ScreenElementExists id = <screen_id>
		GetGlobalTags <load_venue_checksum> param = venue_stars
		get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
		progression_get_venue_stars_total player = <player_num> venue = <venue_checksum>
		FormatText TextName = stars_text qs(0xeb575b58) x = <venue_stars> y = <venue_max_stars>
		<screen_id> :SE_SetProps {
			stars_text = <stars_text>
		}
	endif
endscript

script ui_career_gig_select_pulsate_venue_arrow 
	RequireParams \{[
			direction
		]
		all}
	if ScreenElementExists \{id = career_gig_select_screen_id}
		if (<direction> = left)
			alias_to_resolve = alias_next_selection
		elseif (<direction> = right)
			alias_to_resolve = alias_prev_selection
		else
			ScriptAssert \{'Incorrect direction specified in career gig select'}
		endif
		if career_gig_select_screen_id :Desc_ResolveAlias name = <alias_to_resolve>
			<resolved_id> :SE_SetProps scale = 1.3 time = 0.01 relative_scale
			<resolved_id> :SE_WaitProps
			<resolved_id> :SE_SetProps scale = 1.0 time = 0.1 relative_scale
			wait \{0.1
				seconds}
		endif
	endif
endscript

script ui_career_gig_select_create_popup_spawned 
	if ScreenElementExists \{id = career_gig_select_screen_id}
		get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
		begin
		if ControllerPressed square ($primary_controller)
			if NOT ScreenElementExists \{id = gig_info_pu_id}
				career_gig_select_screen_id :GetTags
				career_gig_select_get_challenges_for_venue venue_list_index = <current_venue_index>
				gig_global = (<challenges> [<current_gig_index>])
				gig_struct = ($<gig_global>)
				progression_get_gig_song_stars_earned gig_name = <gig_global> player = <player_num>
				progression_get_gig_stars_total gig_name = <gig_global>
				FormatText TextName = gig_progress_text qs(0x555fff68) x = <gig_stars_earned> y = <gig_max_stars>
				if ((<gig_struct>.playlist_type) = predefined)
					CreateScreenElement {
						parent = career_gig_select_screen_id
						id = gig_info_pu_id
						type = DescInterface
						desc = 'career_gig_info'
						gig_title_text = (<gig_struct>.name)
						gig_info_text = (<gig_struct>.descrip)
						gig_progress_text = <gig_progress_text>
						z_priority = 100
					}
					ui_career_gig_info_populate_songs_menu screen_id = gig_info_pu_id gig_struct = <gig_struct>
				else
					CreateScreenElement {
						parent = career_gig_select_screen_id
						id = gig_info_pu_id
						type = DescInterface
						desc = 'career_gig_info_open'
						gig_title_text = (<gig_struct>.name)
						gig_info_text = (<gig_struct>.descrip)
						gig_progress_text = <gig_progress_text>
						z_priority = 100
					}
				endif
				ui_career_gig_info_populate_challenge_info screen_id = gig_info_pu_id gig_struct = <gig_struct>
				ui_career_gig_info_populate_band_config_text screen_id = gig_info_pu_id gig_struct = <gig_struct>
			endif
		else
			if ScreenElementExists \{id = gig_info_pu_id}
				DestroyScreenElement \{id = gig_info_pu_id}
			endif
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script career_gig_select_get_challenge_achievement_display 
	RequireParams \{[
			gig_global
		]
		all}
	get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
	progression_get_gig_challenge_stars_earned gig_name = <gig_global> player = <player_num>
	FormatText TextName = challenge_text qs(0x6cf5c0e1) s = <challenge_stars>
	switch <highest_earned>
		case 0
		challenge_icon = None
		challenge_text = qs(0x03ac90f0)
		case 1
		challenge_icon = icon_difficulty_vinyl
		case 2
		challenge_icon = icon_difficulty_gold
		case 3
		challenge_icon = icon_difficulty_platinum
		case 4
		challenge_icon = icon_difficulty_diamond
		default
		challenge_icon = None
		challenge_text = qs(0x03ac90f0)
	endswitch
	return challenge_achievement_icon = <challenge_icon> challenge_text = <challenge_text>
endscript

script career_gig_select_update_challenge_stars_menu 
	RequireParams \{[
			strip_id
			gig_global
		]
		all}
	if <strip_id> :Desc_ResolveAlias name = alias_challenge_stars_menu param = stars_menu
		progression_get_gig_stars_total gig_name = <gig_global>
		get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
		progression_get_gig_challenge_stars_earned gig_name = <gig_global> player = <player_num>
		if (<gig_challenge_max_stars> > 0)
			active_star_counter = 0
			begin
			if (<active_star_counter> < <challenge_stars>)
				CreateScreenElement {
					parent = <stars_menu>
					type = SpriteElement
					pos_anchor = [center , center]
					just = [center , center]
					z_priority = 10
					dims = (84.0, 84.0)
					texture = songlist_star_full
					alpha = 1
				}
			else
				CreateScreenElement {
					parent = <stars_menu>
					type = SpriteElement
					pos_anchor = [center , center]
					just = [center , center]
					z_priority = 10
					dims = (84.0, 84.0)
					texture = songlist_star_full
					alpha = 0.25
					rgba = grey_light
				}
			endif
			<active_star_counter> = (<active_star_counter> + 1)
			repeat <gig_challenge_max_stars>
		endif
	endif
endscript

script career_gig_select_get_band_challenge_icon 
	RequireParams \{[
			gig_struct
		]
		all}
	GetArraySize (<gig_struct>.required_band)
	if (<array_size> > 1)
		challenge_icon = icon_band
	else
		if (<array_size> > 0)
			switch (<gig_struct>.required_band [0])
				case lead
				challenge_icon = mixer_icon_guitar
				case bass
				challenge_icon = mixer_icon_bass
				case Drum
				challenge_icon = mixer_icon_drums
				case vocal
				challenge_icon = mixer_icon_vox
				default
				challenge_icon = icon_band_sm
			endswitch
		endif
	endif
	if GotParam \{challenge_icon}
		return challenge_icon = <challenge_icon>
	endif
endscript

script career_gig_select_get_gig_display_index_from_current_challenge 
	if ScreenElementExists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :GetSingleTag \{current_venue_index}
		GMan_ChallengeManagerFunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		career_gig_select_get_challenges_for_venue venue_list_index = <current_venue_index>
		get_savegame_from_controller controller = ($primary_controller)
		GetArraySize <challenges>
		if (<array_size> > 0)
			i = 0
			gig_display_count = 0
			begin
			<gig_info_global> = (<challenges> [<i>])
			<gig_info_struct> = ($<gig_info_global>)
			GetGlobalTags savegame = <savegame> <gig_info_global>
			if (<unlocked> = 1)
				if ((<gig_info_struct>.id) = <current_challenge>)
					return gig_display_index = <gig_display_count>
				endif
				<gig_display_count> = (<gig_display_count> + 1)
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script new_career_gig_select_get_gig_display_index_from_current_challenge 
	current_venue_index = <venue_index>
	GMan_VenueFunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	GMan_ChallengeManagerFunc {
		goal = career
		tool = challenges
		func = get_challenges_for_venue
		params = {
			venue = <current_venue>
		}
	}
	get_savegame_from_controller controller = ($primary_controller)
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	GetArraySize <challenge_list>
	if (<array_size> > 0)
		i = 0
		gig_display_count = 0
		begin
		<gig_info_global> = (<challenge_list> [<i>])
		<gig_info_struct> = ($<gig_info_global>)
		GetGlobalTags savegame = <savegame> <gig_info_global>
		dump
		if (<unlocked> = 1)
			if ((<gig_info_struct>.id) = <current_challenge>)
				return gig_display_index = (<gig_display_count> + 1)
			endif
			<gig_display_count> = (<gig_display_count> + 1)
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script career_gig_select_pulsate_unlocked_gigs_strip \{time = 0.7}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	begin
	career_gig_select_screen_id :SE_SetProps {
		gigs_unlocked_strip_alpha = 0.5
		time = <time>
	}
	wait <time> seconds ignoreslomo
	career_gig_select_screen_id :SE_SetProps {
		gigs_unlocked_strip_alpha = 1
		time = <time>
	}
	wait <time> seconds ignoreslomo
	repeat
endscript

script ui_career_gig_select_debug_win_gig 
	if CD
		return
	endif
	get_savegame_from_controller \{controller = $primary_controller}
	GetGlobalTags <gig_info_global> savegame = <savegame>
	if (<unlocked> = 1)
		if (<song1_stars_earned> = 0)
			SetGlobalTags <gig_info_global> savegame = <savegame> Progression = true params = {
				has_been_played = 1
				song1_stars_earned = 5
				earned_gold_stars = 1
				completed = 1
				completed_gold = 1
				completed_platinum = 1
				completed_diamond = 1
			}
			star_reward = 8
			get_current_progression_stars savegame = <savegame>
			total_stars = (<total_stars> + <star_reward>)
			set_progression_stars new_total_stars = <total_stars>
			venue_list = ($progression_gig_list)
			venue = (<venue_list> [<venue_index>].venue)
			FormatText checksumname = load_venue_checksum 'venue_%s' s = ($LevelZones.<venue>.name)
			GetGlobalTags <load_venue_checksum> param = venue_stars savegame = <savegame>
			SetGlobalTags <load_venue_checksum> params = {venue_stars = (<venue_stars> + <star_reward>)} savegame = <savegame> Progression = true
			generic_menu_pad_choose_sound
			ui_event_block event = menu_replace data = {state = UIstate_career_gig_select venue_index = <venue_index> gig_display_index = <gig_display_index> gig_selected_index}
			return
		endif
	endif
	generic_menu_pad_back_sound
endscript

script ui_career_gig_select_scroll_sound 
	if ScreenElementExists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :GetTags
		if GotParam \{up}
			if (<selection> = top)
				return
			endif
		endif
		if GotParam \{down}
			if (<selection> = bottom)
				return
			endif
		endif
	endif
	generic_menu_up_or_down_sound <...>
endscript

script ui_career_gig_select_denied_sound 
	SoundEvent \{event = UI_SFX_Negative_Select}
endscript

script career_gig_select_stretch_gigs_unlocked_strip 
	RequireParams \{[
			screen_id
		]
		all}
endscript
