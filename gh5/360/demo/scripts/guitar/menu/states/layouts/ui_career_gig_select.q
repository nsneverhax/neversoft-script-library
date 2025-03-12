
script ui_init_career_gig_select 
	change \{respond_to_signin_changed_func = ui_signin_changed_func}
endscript

script ui_create_career_gig_select 
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if scriptexists \{crowd_swells_during_stats_screen}
		killspawnedscript \{name = crowd_swells_during_stats_screen}
	endif
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend
			fadeouttime = 1
			fadeouttype = linear
		}}
	update_active_players_atoms
	progression_clear_rewards_just_unlocked
	if gotparam \{gig_index}
		requireparams \{[
				gig_display_index
			]
			all}
	endif
	initial_venue_index = 0
	if gotparam \{venue_index}
		initial_venue_index = <venue_index>
	endif
	venue_list = ($progression_gig_list)
	getplayerinfo ($g_net_leader_player_num) controller
	getplayerinfo ($g_net_leader_player_num) is_local_client
	if ((checkforsignin local controller_index = <controller>) || (<is_local_client> = 0))
		getplayerinfo ($g_net_leader_player_num) gamertag
		if ((($<gamertag>) != qs(0x00000000)) && (($<gamertag>) != qs(0x03ac90f0)))
			formattext textname = leader_text qs(0xc8b45038) l = ($<gamertag>)
		else
			formattext textname = leader_text qs(0x8cd67c5b) l = ($g_net_leader_player_num)
		endif
	else
		formattext textname = leader_text qs(0x8cd67c5b) l = ($g_net_leader_player_num)
	endif
	user_control_helper_get_buttonchar \{button = yellow}
	prev_buttonchar = <buttonchar>
	user_control_helper_get_buttonchar \{button = orange}
	venue_checksum = ((<venue_list> [<initial_venue_index>]).venue)
	venue_title = ($levelzones.<venue_checksum>.title)
	venue_banner = ($levelzones.<venue_checksum>.banner)
	createscreenelement {
		parent = root_window
		id = career_gig_select_screen_id
		type = descinterface
		desc = 'career_gig_select_gh5'
		venue_name_text = <venue_title>
		career_gig_select_leader_text = <leader_text>
		career_gig_select_prev_button_char = <prev_buttonchar>
		career_gig_select_next_button_char = <buttonchar>
		career_gig_select_slider_nub_container_pos = (-638.0, -260.0)
		gigs_unlocked_strip_alpha = 0
		banner_ven_texture = <venue_banner>
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
	career_gig_select_stretch_gigs_unlocked_strip screen_id = <id>
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		career_gig_select_screen_id :se_setprops {
			exclusive_device = ($primary_controller)
		}
	endif
	career_gig_select_screen_id :se_setprops {
		event_handlers = [
			{pad_back generic_event_back params = {state = uistate_career_venue_select data = {venue_index = <initial_venue_index>}}}
		]
	}
	get_savegame_from_controller controller = ($primary_controller)
	formattext checksumname = load_venue_checksum 'venue_%s' s = ($levelzones.<venue_checksum>.name)
	getglobaltags savegame = <savegame> <load_venue_checksum>
	if gotparam \{gig_display_index}
		ui_career_gig_select_populate_gigs_menu {
			screen_id = career_gig_select_screen_id
			venue_index = <initial_venue_index>
			gig_index_to_focus = (<gig_display_index> - 1)
			bot_play = <bot_play>
		}
	elseif gotparam \{use_selected_index}
		career_gig_select_get_gig_display_index_from_current_challenge
		if gotparam \{gig_display_index}
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
	if gotparam \{gigs_menu_id}
		assignalias id = <gigs_menu_id> alias = current_menu
	endif
	launchevent \{type = focus
		target = career_gig_select_screen_id}
	destroy_loading_screen
	if career_gig_select_screen_id :desc_resolvealias \{name = alias_title_banner_anim
			param = title_banner_id}
		<title_banner_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'dschorn1'}
	endif
	if career_gig_select_screen_id :desc_resolvealias \{name = alias_title_banner_anim
			param = title_banner_id}
		<title_banner_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'dschorn1'}
	endif
	if career_gig_select_screen_id :desc_resolvealias \{name = alias_bg_anim_left
			param = bg_anim_left_id}
		<bg_anim_left_id> :obj_spawnscript ui_shakey_02
	else
		scriptassert \{'dschorn1'}
	endif
	if career_gig_select_screen_id :desc_resolvealias \{name = alias_bg_anim_left
			param = bg_anim_left_id}
		<bg_anim_left_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'dschorn1'}
	endif
	if career_gig_select_screen_id :desc_resolvealias \{name = alias_bg_anim_right
			param = bg_anim_right_id}
		<bg_anim_right_id> :obj_spawnscript ui_shakey_02
	else
		scriptassert \{'dschorn1'}
	endif
	if career_gig_select_screen_id :desc_resolvealias \{name = alias_bg_anim_right
			param = bg_anim_right_id}
		<bg_anim_right_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'dschorn1'}
	endif
endscript

script gig_do_physics_spawned 
	create_2d_spring_system \{desc_id = career_gig_select_screen_id
		num_springs = 1
		stiffness = 50
		rest_length = 1}
	if career_gig_select_screen_id :desc_resolvealias \{name = alias_skull_reg_container_l
			param = skull_reg_id}
		<skull_reg_id> :obj_spawnscript ui_herkyjerky
	else
		scriptassert \{'pdetrich'}
	endif
endscript

script ui_destroy_career_gig_select 
	clean_up_user_control_helpers
	killspawnedscript \{name = career_gig_select_pulsate_unlocked_gigs_strip}
	if screenelementexists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :getsingletag \{players_list_id}
		if screenelementexists id = <players_list_id>
			destroyscreenelement id = <players_list_id>
		endif
		destroyscreenelement \{id = career_gig_select_screen_id}
	endif
endscript

script ui_deinit_career_gig_select 
	songlist_kill_cycle_song_previews
endscript

script ui_return_career_gig_select 
	if screenelementexists \{id = career_gig_select_screen_id}
		if NOT screenelementexists \{id = band_lobby_popup_menu}
			launchevent \{type = focus
				target = career_gig_select_screen_id}
		else
			band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
		endif
	endif
	if (($g_suppress_anim_in) = 1)
		change \{g_suppress_anim_in = 0}
	endif
endscript

script career_gig_select_highlight_gig_and_update_info_box 
	if gotparam \{no_highlight}
		if screenelementexists \{id = career_gig_select_screen_id}
			formattext \{textname = challenge_title_text
				qs(0x26bae376)}
			formattext \{textname = challenge_desc_text
				qs(0x00000000)}
			career_gig_select_screen_id :se_setprops career_gig_select_challenge_title_text = <challenge_title_text>
			career_gig_select_screen_id :se_setprops career_gig_select_challenge_desc_text = <challenge_desc_text>
		endif
	else
		requireparams \{[
				selection_id
				gig_info_struct
			]
			all}
		<selection_id> :se_setprops rgba = ($menu_focus_color)
		if screenelementexists \{id = career_gig_select_screen_id}
			career_gig_select_screen_id :se_setprops career_gig_select_challenge_title_text = (<gig_info_struct>.name)
			career_gig_select_screen_id :se_setprops career_gig_select_challenge_desc_text = (<gig_info_struct>.descrip)
		endif
	endif
endscript

script career_gig_select_unfocus_selection_text 
	requireparams \{[
			selection_id
		]
		all}
	<selection_id> :se_setprops rgba = [175 225 230 255]
endscript

script career_gig_select_setup_songlist 
	requireparams \{[
			gig_struct
		]
		all}
	if NOT structurecontains structure = <gig_struct> name = playlist_type
		scriptassert qs(0x6d8c749d) a = (<gig_struct>.id)
	endif
	songlist_clear_playlist
	if ((<gig_struct>.playlist_type) = predefined)
		songlist_clear_filterspec
		songlist_dont_force_num_songs
		gman_songfunc \{func = clear_play_list}
		gman_songfunc func = add_song_array_to_play_list params = {song_array = (<gig_struct>.predefined_playlist)}
		change current_playlist = (<gig_struct>.predefined_playlist)
	elseif ((<gig_struct>.playlist_type) = filtered)
		if structurecontains structure = <gig_struct> name = filterspec
			songlist_change_filterspec filterspec = (<gig_struct>.filterspec) invert_filterspec = (<gig_struct>.invert_filterspec)
		else
			scriptassert qs(0xc9113ef6) a = (<gig_struct>.id)
		endif
		if structurecontains structure = <gig_struct> name = num_songs
			songlist_force_num_songs_to_choose num_songs = (<gig_struct>.num_songs)
		else
			scriptassert qs(0x14164272) a = (<gig_struct>.id)
			songlist_dont_force_num_songs
		endif
	elseif ((<gig_struct>.playlist_type) = open)
		songlist_clear_filterspec
		if structurecontains structure = <gig_struct> name = num_songs
			songlist_force_num_songs_to_choose num_songs = (<gig_struct>.num_songs)
		else
			scriptassert qs(0x11e9bccd) a = (<gig_struct>.id)
			songlist_dont_force_num_songs
		endif
	endif
endscript

script career_gig_select_set_gig 
	requireparams \{[
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	if screenelementexists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :gettags
		career_gig_select_get_challenges_for_venue venue_list_index = <current_venue_index>
		gig_global = (<challenges> [<current_gig_index>])
		gig_struct = ($<gig_global>)
		career_gig_select_set_gig_info gig_struct = <gig_struct>
		career_gig_select_setup_songlist gig_struct = <gig_struct>
	endif
endscript

script career_gig_select_set_gig_and_continue_to_gig_info 
	requireparams \{[
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	generic_event_choose {
		state = uistate_career_gig_info
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
	requireparams \{[
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
	requireparams \{[
			gig_struct
		]
		all}
	venue = (<gig_struct>.venue)
	if structurecontains structure = ($levelzones.<venue>) name = loading_movie
		create_venue_loading_screen movie_params = ($levelzones.<venue>)
	else
		create_loading_screen
	endif
	generic_event_choose \{state = uistate_play_song}
endscript

script career_gig_select_set_gig_and_continue_to_songlist 
	requireparams \{[
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
	requireparams \{[
			gig_struct
		]
		all}
	gman_shutdownallgoals \{preserve_career}
	gman_venuefunc {goal = career tool = venue_handler func = set_venue params = {venue_name = (<gig_struct>.venue)}}
	gman_challengemanagerfunc goal = career tool = challenges func = set_current_challenge params = {challenge_id = (<gig_struct>.id)}
endscript

script net_career_gig_select_set_gig_and_continue_to_gameplay 
	requireparams \{[
			device_num
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	getplayerinfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		getplayerinfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		getplayerinfo ($g_net_leader_player_num) controller
	endif
	if (<controller> = <device_num>)
		career_gig_select_set_gig {
			gig_global = <gig_global>
			venue_index = <venue_index>
			gig_index = <gig_index>
			gig_display_index = <gig_display_index>
		}
		generic_event_choose {
			state = uistate_career_gig_info
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
	requireparams \{[
			device_num
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	gig_struct = ($<gig_global>)
	getplayerinfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		getplayerinfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		getplayerinfo ($g_net_leader_player_num) controller
	endif
	if (<device_num> = <controller>)
		generic_event_choose {
			state = uistate_career_gig_info
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
	requireparams \{[
			players_list_id
		]
		all}
	destroyscreenelement id = <players_list_id>
	launchevent \{type = focus
		target = career_gig_select_screen_id}
	if career_gig_select_screen_id :desc_resolvealias \{name = alias_career_gig_select_gigs_menu}
		launchevent type = focus target = <resolved_id>
	endif
	allow_choose = 0
	if screenelementexists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :getsingletag \{current_gig_is_unlocked}
		allow_choose = <current_gig_is_unlocked>
	endif
	career_gig_select_setup_helper_pills_for_gig_select allow_choose = <allow_choose>
endscript

script career_gig_select_setup_helper_pills_for_gig_select 
	requireparams \{[
			allow_choose
		]
		all}
	clean_up_user_control_helpers
	if ininternetmode
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
	if ininternetmode
		add_user_control_helper \{text = qs(0xa83061c6)
			button = yellow
			z = 100000}
	endif
	if NOT cd
		add_user_control_helper \{text = qs(0xca33ae52)
			button = blue
			z = 100000}
	endif
endscript

script career_gig_select_get_challenges_for_venue 
	requireparams \{[
			venue_list_index
		]
		all}
	venue_list = ($progression_gig_list)
	gman_challengemanagerfunc {
		goal = career
		tool = challenges
		func = get_challenges_for_venue
		params = {
			venue = (<venue_list> [<venue_list_index>].venue)
		}
	}
	if NOT gotparam \{challenge_list}
		scriptassert 'No gigs found for venue %a in career_gig_select' a = <loaded_venue>
	endif
	return challenges = <challenge_list>
endscript

script career_gig_select_scroll_venue 
	requireparams \{[
			direction
			bot_play
		]
		all}
	if screenelementexists \{id = career_gig_select_screen_id}
		if career_gig_select_screen_id :desc_resolvealias \{name = alias_career_gig_select_location_text_window}
			gig_select_venue_window_id = <resolved_id>
			career_gig_select_get_next_unlocked_venue direction = <direction>
			if (<new_venue_found> = 1)
				venue_list = ($progression_gig_list)
				venue_checksum = ((<venue_list> [<new_venue_index>]).venue)
				venue_title = ($levelzones.<venue_checksum>.title)
				if (<direction> = left)
					new_panel_pos = (375.0, 0.0)
					current_panel_pos = (-375.0, 0.0)
				else
					new_panel_pos = (-375.0, 0.0)
					current_panel_pos = (375.0, 0.0)
				endif
				createscreenelement {
					parent = <gig_select_venue_window_id>
					type = textblockelement
					text = <venue_title>
					font = fontgrid_title_a1
					pos_anchor = [center , center]
					just = [center , center]
					pos = <new_panel_pos>
					rgba = <venue_title_rgba>
					z_priority = 5
					dims = (750.0, 70.0)
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					internal_just = [center , center]
					alpha = 1
				}
				if getscreenelementchildren id = <gig_select_venue_window_id>
					(<children> [0]) :se_setprops pos = <current_panel_pos> time = 0.1
					(<children> [1]) :se_setprops pos = (0.0, 0.0) time = 0.1
					destroyscreenelement id = (<children> [0])
					career_gig_select_screen_id :settags {
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
	requireparams \{[
			direction
		]
		all}
	if screenelementexists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :gettags \{current_venue_index}
		venue_list = ($progression_gig_list)
		getarraysize <venue_list>
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
		venue_title = ($levelzones.<venue_checksum>.title)
		get_savegame_from_controller controller = ($primary_controller)
		formattext checksumname = load_venue_checksum 'venue_%s' s = ($levelzones.<venue_checksum>.name)
		getglobaltags savegame = <savegame> <load_venue_checksum>
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
	requireparams \{[
			screen_id
			direction
			gig_index
			challenges_list
		]
		all}
	if screenelementexists id = <screen_id>
		getarraysize <challenges_list>
		if (<array_size> > 0)
			i = <gig_index>
			if gotparam \{skip_current}
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
			getglobaltags savegame = <savegame> <gig_info_global>
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
	requireparams \{[
			venue_index
			bot_play
		]
		all}
	if screenelementexists \{id = career_gig_select_screen_id}
		if career_gig_select_screen_id :desc_resolvealias \{name = alias_career_gig_select_gigs_menu
				param = gigs_menu}
			<gigs_menu> :se_setprops {
				event_handlers = [
					{pad_up ui_career_gig_select_scroll_sound params = {up}}
					{pad_down ui_career_gig_select_scroll_sound params = {down}}
				]
			}
			career_gig_select_get_challenges_for_venue venue_list_index = <venue_index>
			getarraysize <challenges>
			get_savegame_from_controller controller = ($primary_controller)
			num_unlocked_unplayed_gigs = 0
			if (<array_size> > 0)
				i = 0
				gig_display_index = 1
				begin
				<gig_info_global> = (<challenges> [<i>])
				<gig_info_struct> = ($<gig_info_global>)
				getglobaltags savegame = <savegame> <gig_info_global>
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
						gig_icon_alpha = 1
						gig_sub_icon_alpha = 0
						gig_icon_texture = icon_unlocked
						<num_unlocked_unplayed_gigs> = (<num_unlocked_unplayed_gigs> + 1)
					endif
					if arraycontains array = ($gig_sponsors) contains = <gig_info_global>
						gig_icon_texture = icon_sponsor
						gig_icon_alpha = 1
						if (<has_been_played> = 0)
							gig_sub_icon_alpha = 1
						endif
					elseif arraycontains array = ($gig_encores) contains = <gig_info_global>
						gig_icon_texture = icon_encore
						gig_icon_alpha = 1
						if (<has_been_played> = 0)
							gig_sub_icon_alpha = 1
						endif
					elseif arraycontains array = ($gig_celeb_intros) contains = <gig_info_global>
						gig_icon_texture = icon_celebrity
						gig_icon_alpha = 1
						if (<has_been_played> = 0)
							gig_sub_icon_alpha = 1
						endif
					elseif (<gig_info_global> = ($gig_champion))
						gig_icon_texture = icon_champion
						gig_icon_alpha = 1
						if (<has_been_played> = 0)
							gig_sub_icon_alpha = 1
						endif
					endif
					formattext textname = gig_title qs(0x1ea52c6e) i = <gig_display_index> t = (<gig_info_struct>.name)
					createscreenelement {
						parent = <gigs_menu>
						type = descinterface
						desc = 'career_gig_select_gig_info_patch_gh5'
						career_gig_select_challenge_title_text = <gig_title>
						gig_icon_alpha = <gig_icon_alpha>
						gig_icon_texture = <gig_icon_texture>
						gig_sub_icon_alpha = <gig_sub_icon_alpha>
						alpha = 1
						autosizedims = true
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
					if ininternetmode
						<id> :se_setprops {
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
					create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
					song_breakdown_check_bot_play
					if (<bot_play> = 0)
						<id> :se_setprops {
							exclusive_device = ($primary_controller)
						}
					endif
					ui_career_gig_select_update_gig_description {
						gig_desc_id = <id>
						gig_global = <gig_info_global>
						gig_info_struct = <gig_info_struct>
						savegame = <savegame>
					}
				else
					gig_title = qs(0xdebf525e)
					createscreenelement {
						parent = <gigs_menu>
						type = descinterface
						desc = 'career_gig_select_gig_info_patch_gh5'
						career_gig_select_challenge_title_text = <gig_title>
						challenge_container_alpha = 0
						gig_icon_alpha = 1
						gig_icon_texture = icon_lock
						gig_sub_icon_alpha = 0
						alpha = 1
						autosizedims = true
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
					if ininternetmode
						<id> :se_setprops {
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
					create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
					song_breakdown_check_bot_play
					if (<bot_play> = 0)
						<id> :se_setprops {
							exclusive_device = ($primary_controller)
						}
					endif
					ui_career_gig_select_update_gig_description_for_locked_gigs gig_desc_id = <id>
				endif
				<gig_display_index> = (<gig_display_index> + 1)
				<i> = (<i> + 1)
				repeat <array_size>
				career_gig_select_screen_id :settags unlocked_gigs_size = (<gig_display_index> - 1)
				if (<num_unlocked_unplayed_gigs> > 0)
					career_gig_select_screen_id :obj_spawnscriptnow \{career_gig_select_pulsate_unlocked_gigs_strip}
				endif
			endif
			if (<bot_play> = 0)
				<gigs_menu> :se_setprops {
					exclusive_device = ($primary_controller)
				}
			endif
			if gotparam \{gig_index_to_focus}
				launchevent type = focus target = <gigs_menu> data = {child_index = <gig_index_to_focus>}
			else
				launchevent type = focus target = <gigs_menu> data = {child_index = 0}
			endif
			return gigs_menu_id = <gigs_menu>
		endif
	endif
endscript

script ui_career_gig_select_update_gig_description 
	requireparams \{[
			gig_desc_id
			gig_global
			gig_info_struct
			savegame
		]
		all}
	if <gig_desc_id> :desc_resolvealias name = alias_career_gig_select_progress_menu
		progress_menu_id = <resolved_id>
		destroyscreenelement id = <progress_menu_id> preserve_parent
	endif
	get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
	progression_get_gig_song_stars_earned gig_name = <gig_global> player = <player_num>
	progression_get_gig_stars_total gig_name = <gig_global>
	progression_get_earned_song_stars_array gig_name = <gig_global> player = <player_num>
	formattext textname = gig_progress_text qs(0x074fa5df) e = <gig_stars_earned> t = <gig_max_stars>
	<gig_desc_id> :se_setprops {
		career_gig_select_progress_title_text = <gig_progress_text>
	}
	getglobaltags savegame = <savegame> <gig_global>
	star_rgba = [255 255 255 255]
	if (<earned_gold_stars> = 1)
		star_rgba = gh5_gold_md
	endif
	if <gig_desc_id> :desc_resolvealias name = alias_career_gig_select_challenge_menu param = challenge_menu_id
		destroyscreenelement id = <challenge_menu_id> preserve_parent
		if (<gig_info_struct>.playlist_type = predefined)
			playlist = (<gig_info_struct>.predefined_playlist)
			prop_struct = ($on_disc_props)
			getarraysize <playlist>
			j = 0
			text_rgba = [175 225 230 255]
			begin
			formattext textname = artist_text qs(0x35b12509) a = (($<prop_struct>).(<playlist> [<j>]).artist)
			createscreenelement {
				parent = <challenge_menu_id>
				type = descinterface
				desc = 'career_gig_select_song_entry'
				song_name_text = (($<prop_struct>).(<playlist> [<j>]).title)
				song_artist_text = <artist_text>
				song_artist_rgba = [175 225 230 255]
				pos_anchor = [center , center]
				just = [center , center]
				z_priority = 3
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				internal_just = [left , center]
				alpha = 1
			}
			if gotparam \{progress_menu_id}
				formattext textname = stars_text qs(0x4d4555da) s = (<song_stars> [<j>])
				createscreenelement {
					parent = <progress_menu_id>
					type = menuelement
					pos_anchor = [center , center]
					just = [center , center]
					z_priority = 3
					dims = (150.0, 40.0)
					alpha = 1
					isvertical = false
					internal_just = [center , center]
					fit_major = `fit content to dims`
					fit_minor = `keep dims`
					spacing_between = 3
				}
				star_count_id = <id>
				num_star_loops = 5
				if ((<song_stars> [<j>]) = 6)
					<num_star_loops> = 6
				endif
				active_star_counter = 0
				begin
				if (<active_star_counter> < (<song_stars> [<j>]))
					createscreenelement {
						parent = <star_count_id>
						type = spriteelement
						pos_anchor = [center , center]
						just = [center , center]
						z_priority = 10
						dims = (84.0, 84.0)
						texture = songlist_star_full
						alpha = 1
						rgba = <star_rgba>
					}
				else
					createscreenelement {
						parent = <star_count_id>
						type = spriteelement
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
				formattext textname = gig_text qs(0x79c625c2) n = (<gig_info_struct>.num_songs)
			else
				formattext textname = gig_text qs(0xff6165b9) n = (<gig_info_struct>.num_songs)
			endif
			createscreenelement {
				parent = <challenge_menu_id>
				type = descinterface
				desc = 'career_gig_select_song_entry'
				song_name_text = (<gig_info_struct>.name)
				song_artist_text = <gig_text>
				song_artist_rgba = [175 225 230 255]
				pos_anchor = [center , center]
				just = [center , center]
				z_priority = 3
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				internal_just = [left , center]
				alpha = 1
			}
			if gotparam \{progress_menu_id}
				get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
				progression_get_gig_challenge_stars_earned gig_name = <gig_global> player = <player_num>
				createscreenelement {
					parent = <progress_menu_id>
					type = menuelement
					pos_anchor = [center , center]
					just = [center , center]
					z_priority = 3
					dims = (150.0, 40.0)
					alpha = 1
					isvertical = false
					internal_just = [center , center]
					fit_major = `fit content to dims`
					fit_minor = `keep dims`
					spacing_between = 3
				}
				star_count_id = <id>
				song_stars_earned = (<gig_stars_earned> - <challenge_stars>)
				num_star_loops = 5
				if (<song_stars_earned> = 6)
					<num_star_loops> = 6
				endif
				active_star_counter = 0
				begin
				if (<active_star_counter> < <song_stars_earned>)
					createscreenelement {
						parent = <star_count_id>
						type = spriteelement
						pos_anchor = [center , center]
						just = [center , center]
						z_priority = 10
						dims = (84.0, 84.0)
						texture = songlist_star_full
						alpha = 1
						rgba = <star_rgba>
					}
				else
					createscreenelement {
						parent = <star_count_id>
						type = spriteelement
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
		getscreenelementdims id = <gig_desc_id>
		career_gig_select_get_challenge_achievement_display gig_global = <gig_global>
		career_gig_select_update_challenge_stars_menu strip_id = <gig_desc_id> gig_global = <gig_global>
		career_gig_select_get_band_challenge_icon gig_struct = <gig_info_struct>
		challenge_struct = {
		}
		if gotparam \{challenge_icon}
			addparam structure_name = challenge_struct name = challenge_icon_texture value = <challenge_icon>
		else
			addparam \{structure_name = challenge_struct
				name = challenge_icon_rgba
				value = [
					0
					0
					0
					0
				]}
		endif
		if (<challenge_achievement_icon> = none)
			addparam \{structure_name = challenge_struct
				name = challenge_achieved_alpha
				value = 0}
		else
			addparam \{structure_name = challenge_struct
				name = challenge_icon_pos
				value = (-40.0, 8.0)}
			addparam \{structure_name = challenge_struct
				name = challenge_achieved_pos
				value = (-60.0, -25.0)}
			addparam structure_name = challenge_struct name = challenge_achieved_texture value = <challenge_achievement_icon>
		endif
		<gig_desc_id> :se_setprops {
			<challenge_struct>
		}
	endif
endscript

script ui_career_gig_select_update_gig_description_for_locked_gigs 
	requireparams \{[
			gig_desc_id
		]
		all}
	if <gig_desc_id> :desc_resolvealias name = alias_career_gig_select_progress_menu
		progress_menu_id = <resolved_id>
		destroyscreenelement id = <progress_menu_id> preserve_parent
	endif
	if <gig_desc_id> :desc_resolvealias name = alias_career_gig_select_challenge_menu param = challenge_menu_id
		destroyscreenelement id = <challenge_menu_id> preserve_parent
		createscreenelement {
			parent = <challenge_menu_id>
			type = descinterface
			desc = 'career_gig_select_song_entry'
			song_name_text = qs(0xdebf525e)
			song_artist_text = qs(0x03ac90f0)
			song_artist_rgba = [175 225 230 255]
			pos_anchor = [center , center]
			just = [center , center]
			z_priority = 3
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			internal_just = [left , center]
			alpha = 1
		}
		getscreenelementdims id = <gig_desc_id>
	endif
endscript

script ui_career_gig_select_focus_gig 
	requireparams \{[
			challenges
			playlist_type
			unlocked
		]
		all}
	if NOT screenelementexists \{id = career_gig_select_screen_id}
		scriptassert \{'could not find career_gig_select_screen_id!'}
	endif
	obj_getid
	<objid> :gettags
	<objid> :se_setprops {
		highlight_bar_alpha = 0.35000002
	}
	songlist_kill_cycle_song_previews
	gig_global = (<challenges> [<gig_index>])
	<objid> :se_setprops {
		career_gig_select_progress_title_alpha = 1
		highlight_bar_alpha = 0.35000002
		alpha = 1
	}
	career_gig_select_screen_id :getsingletag \{current_gig_is_unlocked}
	career_gig_select_screen_id :getsingletag \{current_gig_has_predefined_playlist}
	if (<unlocked> = 1)
		if <objid> :desc_resolvealias name = alias_career_gig_select_progress_menu
			<resolved_id> :se_setprops alpha = 1
		endif
		if ((($<gig_global>).playlist_type) = predefined)
			menu_music_off
			playlist = (($<gig_global>).predefined_playlist)
			spawnscriptnow songlist_cycle_song_previews params = {songs = <playlist>}
			<current_gig_has_predefined_playlist> = 1
		else
			if ((<current_gig_is_unlocked> = 1) && (<current_gig_has_predefined_playlist> = 1))
				if issoundeventplaying \{surge_during_stats_screen}
					stopsoundevent \{surge_during_stats_screen
						fade_time = 1.5
						fade_type = linear}
				endif
				if scriptexists \{crowd_swells_during_stats_screen}
					killspawnedscript \{name = crowd_swells_during_stats_screen}
				endif
				menu_music_on
			endif
			<current_gig_has_predefined_playlist> = 0
		endif
		if <objid> :desc_resolvealias name = alias_career_gig_select_challenge_menu
			getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			if (<array_size> > 0)
				i = 0
				begin
				if (<playlist_type> = predefined)
					(<children> [<i>]) :se_setprops {
						song_name_rgba = black
						song_artist_rgba = black
					}
				else
					(<children> [<i>]) :se_setprops {
						song_name_rgba = yellow_md
						song_artist_rgba = black
					}
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
	else
		if ((<current_gig_is_unlocked> = 1) && (<current_gig_has_predefined_playlist> = 1))
			if issoundeventplaying \{surge_during_stats_screen}
				stopsoundevent \{surge_during_stats_screen
					fade_time = 1.5
					fade_type = linear}
			endif
			if scriptexists \{crowd_swells_during_stats_screen}
				killspawnedscript \{name = crowd_swells_during_stats_screen}
			endif
			menu_music_on
		endif
		<current_gig_has_predefined_playlist> = 0
	endif
	career_gig_select_screen_id :settags {
		current_gig_index = <gig_index>
		current_unlocked_gig_index = <unlocked_gig_index>
		current_gig_is_unlocked = <unlocked>
		current_gig_has_predefined_playlist = <current_gig_has_predefined_playlist>
	}
	career_gig_select_screen_id :getsingletag \{unlocked_gigs_size}
	ui_career_gig_select_set_scroll_bar_pos {
		screen_id = career_gig_select_screen_id
		gig_index = <unlocked_gig_index>
		gigs_array_size = <unlocked_gigs_size>
	}
	if screenelementexists \{id = career_gig_select_screen_id}
		getarraysize <challenges>
		if (<gig_index> = 0)
			<selection> = top
		elseif (<gig_index> = (<array_size> - 1))
			<selection> = bottom
		else
			<selection> = middle
		endif
		career_gig_select_screen_id :settags selection = <selection>
	endif
	career_gig_select_setup_helper_pills_for_gig_select allow_choose = <unlocked>
endscript

script ui_career_gig_select_unfocus_gig 
	requireparams \{[
			playlist_type
			unlocked
		]
		all}
	obj_getid
	<objid> :se_setprops {
		highlight_bar_alpha = 0
		alpha = 1
	}
	if <objid> :desc_resolvealias name = alias_career_gig_select_progress_menu
		<resolved_id> :se_setprops alpha = 1
	endif
	if (<unlocked> = 1)
		if <objid> :desc_resolvealias name = alias_career_gig_select_challenge_menu
			getscreenelementchildren id = <resolved_id>
			menu_children = <children>
			getarraysize <menu_children>
			menu_children_size = <array_size>
			if (<menu_children_size> > 0)
				i = 0
				begin
				(<menu_children> [<i>]) :se_setprops {
					song_name_rgba = ($menu_focus_color)
					song_artist_rgba = [175 225 230 255]
				}
				<i> = (<i> + 1)
				repeat <menu_children_size>
			endif
		endif
	endif
endscript

script ui_career_gig_select_set_scroll_bar_pos 
	requireparams \{[
			screen_id
			gig_index
			gigs_array_size
		]
		all}
	if ((<gigs_array_size> - 1) > 0)
		if screenelementexists id = <screen_id>
			posx = 0
			posy = (25 + ((340.0 * <gig_index>) / (<gigs_array_size> - 1)))
			<screen_id> :se_setprops {
				slider_nub_cont_pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posy>))
				time = 0.1
			}
		endif
	else
		if screenelementexists id = <screen_id>
			posx = 0
			posy = 25
			<screen_id> :se_setprops {
				slider_nub_cont_pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posy>))
				time = 0.1
			}
		endif
	endif
	<screen_id> :settags current_unlocked_gig_index = <gig_index>
endscript

script ui_career_gig_select_set_gig_info 
	if screenelementexists \{id = career_gig_select_screen_id}
		if gotparam \{clear_gig_info}
			career_gig_select_screen_id :se_setprops \{temp_gig_info_text = qs(0x03ac90f0)
				temp_band_config_text = qs(0x03ac90f0)}
		else
			requireparams \{[
					gig_index
				]
				all}
			career_gig_select_screen_id :gettags \{current_venue_index}
			career_gig_select_get_challenges_for_venue venue_list_index = <current_venue_index>
			getarraysize <challenges>
			temp_gig_info_text = qs(0x03ac90f0)
			if (<array_size> > 0)
				<gig_info_global> = (<challenges> [<gig_index>])
				temp_gig_info_text = (($<gig_info_global>).descrip)
			endif
			career_gig_select_screen_id :se_setprops {
				temp_gig_info_text = <temp_gig_info>
			}
		endif
	endif
endscript

script ui_career_gig_select_set_next_venue_unlock_text 
	requireparams \{[
			screen_id
		]
		all}
	if screenelementexists id = <screen_id>
		progression_get_stars_to_next_venue
		if (<stars_to_next> <= 0)
			<screen_id> :se_setprops {
				locked_unlocked_menu_alpha = 0
				locked_unlocked_text_alpha = 1
			}
		else
			formattext textname = stars_num_text qs(0x73307931) s = <stars_to_next>
			formattext \{textname = next_venue_text
				qs(0xc20814f2)}
			<screen_id> :se_setprops {
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
	requireparams \{[
			screen_id
			savegame
			venue_checksum
			load_venue_checksum
		]
		all}
	if screenelementexists id = <screen_id>
		getglobaltags <load_venue_checksum> param = venue_stars
		get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
		progression_get_venue_stars_total player = <player_num> venue = <venue_checksum>
		formattext textname = venue_progression_text qs(0x555fff68) x = <venue_stars> y = <venue_max_stars>
		<screen_id> :se_setprops {
			venue_progression_text = <venue_progression_text>
		}
	endif
endscript

script ui_career_gig_select_pulsate_venue_arrow 
	requireparams \{[
			direction
		]
		all}
	if screenelementexists \{id = career_gig_select_screen_id}
		if (<direction> = left)
			alias_to_resolve = alias_next_selection
		elseif (<direction> = right)
			alias_to_resolve = alias_prev_selection
		else
			scriptassert \{'Incorrect direction specified in career gig select'}
		endif
		if career_gig_select_screen_id :desc_resolvealias name = <alias_to_resolve>
			<resolved_id> :se_setprops scale = 1.3 time = 0.01 relative_scale
			<resolved_id> :se_waitprops
			<resolved_id> :se_setprops scale = 1.0 time = 0.1 relative_scale
			wait \{0.1
				seconds}
		endif
	endif
endscript

script ui_career_gig_select_create_popup_spawned 
	if screenelementexists \{id = career_gig_select_screen_id}
		get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
		begin
		if controllerpressed square ($primary_controller)
			if NOT screenelementexists \{id = gig_info_pu_id}
				career_gig_select_screen_id :gettags
				career_gig_select_get_challenges_for_venue venue_list_index = <current_venue_index>
				gig_global = (<challenges> [<current_gig_index>])
				gig_struct = ($<gig_global>)
				progression_get_gig_song_stars_earned gig_name = <gig_global> player = <player_num>
				progression_get_gig_stars_total gig_name = <gig_global>
				formattext textname = gig_progress_text qs(0x555fff68) x = <gig_stars_earned> y = <gig_max_stars>
				if ((<gig_struct>.playlist_type) = predefined)
					createscreenelement {
						parent = career_gig_select_screen_id
						id = gig_info_pu_id
						type = descinterface
						desc = 'career_gig_info'
						gig_title_text = (<gig_struct>.name)
						gig_info_text = (<gig_struct>.descrip)
						gig_progress_text = <gig_progress_text>
						z_priority = 100
					}
					ui_career_gig_info_populate_songs_menu screen_id = gig_info_pu_id gig_struct = <gig_struct>
				else
					createscreenelement {
						parent = career_gig_select_screen_id
						id = gig_info_pu_id
						type = descinterface
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
			if screenelementexists \{id = gig_info_pu_id}
				destroyscreenelement \{id = gig_info_pu_id}
			endif
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script career_gig_select_get_challenge_achievement_display 
	requireparams \{[
			gig_global
		]
		all}
	get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
	progression_get_gig_challenge_stars_earned gig_name = <gig_global> player = <player_num>
	formattext textname = challenge_text qs(0x6cf5c0e1) s = <challenge_stars>
	switch <highest_earned>
		case 0
		challenge_icon = none
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
		challenge_icon = none
		challenge_text = qs(0x03ac90f0)
	endswitch
	return challenge_achievement_icon = <challenge_icon> challenge_text = <challenge_text>
endscript

script career_gig_select_update_challenge_stars_menu 
	requireparams \{[
			strip_id
			gig_global
		]
		all}
	if <strip_id> :desc_resolvealias name = alias_challenge_stars_menu param = stars_menu
		progression_get_gig_stars_total gig_name = <gig_global>
		get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
		progression_get_gig_challenge_stars_earned gig_name = <gig_global> player = <player_num>
		if (<gig_challenge_max_stars> > 0)
			active_star_counter = 0
			begin
			if (<active_star_counter> < <challenge_stars>)
				createscreenelement {
					parent = <stars_menu>
					type = spriteelement
					pos_anchor = [center , center]
					just = [center , center]
					z_priority = 10
					dims = (84.0, 84.0)
					texture = songlist_star_full
					alpha = 1
				}
			else
				createscreenelement {
					parent = <stars_menu>
					type = spriteelement
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
	requireparams \{[
			gig_struct
		]
		all}
	getarraysize (<gig_struct>.required_band)
	if (<array_size> > 1)
		challenge_icon = icon_band
	else
		if (<array_size> > 0)
			switch (<gig_struct>.required_band [0])
				case lead
				challenge_icon = mixer_icon_guitar
				case bass
				challenge_icon = mixer_icon_bass
				case drum
				challenge_icon = mixer_icon_drums
				case vocal
				challenge_icon = mixer_icon_vox
				default
				challenge_icon = icon_band_sm
			endswitch
		endif
	endif
	if gotparam \{challenge_icon}
		return challenge_icon = <challenge_icon>
	endif
endscript

script career_gig_select_get_gig_display_index_from_current_challenge 
	if screenelementexists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :getsingletag \{current_venue_index}
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		career_gig_select_get_challenges_for_venue venue_list_index = <current_venue_index>
		get_savegame_from_controller controller = ($primary_controller)
		getarraysize <challenges>
		if (<array_size> > 0)
			i = 0
			gig_display_count = 0
			begin
			<gig_info_global> = (<challenges> [<i>])
			<gig_info_struct> = ($<gig_info_global>)
			getglobaltags savegame = <savegame> <gig_info_global>
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
	gman_venuefunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	gman_challengemanagerfunc {
		goal = career
		tool = challenges
		func = get_challenges_for_venue
		params = {
			venue = <current_venue>
		}
	}
	get_savegame_from_controller controller = ($primary_controller)
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	getarraysize <challenge_list>
	if (<array_size> > 0)
		i = 0
		gig_display_count = 0
		begin
		<gig_info_global> = (<challenge_list> [<i>])
		<gig_info_struct> = ($<gig_info_global>)
		getglobaltags savegame = <savegame> <gig_info_global>
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
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	begin
	career_gig_select_screen_id :se_setprops {
		gigs_unlocked_strip_alpha = 0.5
		time = <time>
	}
	wait <time> seconds ignoreslomo
	career_gig_select_screen_id :se_setprops {
		gigs_unlocked_strip_alpha = 1
		time = <time>
	}
	wait <time> seconds ignoreslomo
	repeat
endscript

script ui_career_gig_select_debug_win_gig 
	if cd
		return
	endif
	get_savegame_from_controller \{controller = $primary_controller}
	getglobaltags <gig_info_global> savegame = <savegame>
	if (<unlocked> = 1)
		if (<song1_stars_earned> = 0)
			setglobaltags <gig_info_global> savegame = <savegame> progression = true params = {
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
			formattext checksumname = load_venue_checksum 'venue_%s' s = ($levelzones.<venue>.name)
			getglobaltags <load_venue_checksum> param = venue_stars savegame = <savegame>
			setglobaltags <load_venue_checksum> params = {venue_stars = (<venue_stars> + <star_reward>)} savegame = <savegame> progression = true
			generic_menu_pad_choose_sound
			ui_event_block event = menu_replace data = {state = uistate_career_gig_select venue_index = <venue_index> gig_display_index = <gig_display_index> gig_selected_index}
			return
		endif
	endif
	generic_menu_pad_back_sound
endscript

script ui_career_gig_select_scroll_sound 
	if screenelementexists \{id = career_gig_select_screen_id}
		career_gig_select_screen_id :gettags
		if gotparam \{up}
			if (<selection> = top)
				return
			endif
		endif
		if gotparam \{down}
			if (<selection> = bottom)
				return
			endif
		endif
	endif
	generic_menu_up_or_down_sound <...>
endscript

script ui_career_gig_select_denied_sound 
	soundevent \{event = ui_sfx_negative_select}
endscript

script career_gig_select_stretch_gigs_unlocked_strip 
	requireparams \{[
			screen_id
		]
		all}
	<screen_id> :se_getprops
	<screen_id> :se_setprops {
		light_bar2_dims = (((1.0, 0.0) * ((<new_gigs_menu_dims> [0]) + 22.0)) + ((0.0, 1.0) * (<light_bar2_dims> [1])))
	}
endscript
