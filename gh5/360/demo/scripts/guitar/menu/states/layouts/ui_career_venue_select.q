
script ui_init_career_venue_select 
	change \{respond_to_signin_changed_func = ui_signin_changed_func}
	if innetgame
		if ishost
			flowsync_cleanup
		endif
	endif
endscript

script ui_create_career_venue_select 
	change \{net_breakdown_continue_msg_sent = 0}
	if innetgame
		flowsync_sync_notblockingforhost
		spawn_player_drop_listeners \{drop_player_script = ui_career_drop_player
			end_game_script = ui_career_end_game}
	endif
	change \{rich_presence_context = presence_gigboard_and_setlist}
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if scriptexists \{crowd_swells_during_stats_screen}
		killspawnedscript \{name = crowd_swells_during_stats_screen}
	endif
	songlist_kill_cycle_song_previews
	menu_music_on
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend
			fadeintime = 1.5
			fadeintype = linear
			fadeouttime = 1.5
			fadeouttype = linear
		}}
	initial_venue_index = 0
	if gotparam \{venue_index}
		initial_venue_index = <venue_index>
	endif
	venue_list = ($progression_gig_list)
	venue_checksum = ((<venue_list> [<initial_venue_index>]).venue)
	venue_title = ($levelzones.<venue_checksum>.title)
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
	createscreenelement {
		parent = root_window
		id = career_venue_select_screen_id
		type = descinterface
		desc = 'venue_select'
		venue_select_leader_text = <leader_text>
		slider_nub_cont_pos = (0.0, 24.0)
	}
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		career_venue_select_screen_id :se_setprops {
			exclusive_device = ($primary_controller)
		}
	endif
	if ininternetmode
		event_handlers = [
			{pad_back net_career_venue_select_back_to_band_lobby params = {no_quit_warning = 0}}
			{
				pad_option2
				net_career_venue_select_show_players_list
				params = {
					screen_id = career_venue_select_screen_id
					menu_alias = alias_venue_select_menu
					destroy_players_list_script = net_career_venue_select_destroy_players_list
				}
			}
		]
	else
		event_handlers = [
			{pad_back career_venue_select_back_to_band_lobby}
		]
	endif
	career_venue_select_screen_id :se_setprops {
		event_handlers = <event_handlers>
		replace_handlers
	}
	get_savegame_from_controller controller = ($primary_controller)
	ui_career_venue_select_set_total_progression_text screen_id = career_venue_select_screen_id savegame = <savegame>
	if gotparam \{load_venue_checksum}
		ui_career_venue_select_populate_venues_menu {
			venue_index = <initial_venue_index>
			bot_play = <bot_play>
			venue_to_focus = <load_venue_checksum>
		}
	else
		ui_career_venue_select_populate_venues_menu venue_index = <initial_venue_index> bot_play = <bot_play>
	endif
	if gotparam \{venue_menu_id}
		assignalias id = <venue_menu_id> alias = current_menu
	endif
	launchevent \{type = focus
		target = career_venue_select_screen_id}
	if career_venue_select_screen_id :desc_resolvealias \{name = alias_poster_anim
			param = poster_anim_id}
		<poster_anim_id> :obj_spawnscript ui_shakey_02
	else
		scriptassert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{name = alias_poster_anim
			param = poster_anim_id}
		<poster_anim_id> :obj_spawnscript ui_frazzmatazz_02
	else
		scriptassert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{name = alias_title_banner_anim
			param = title_banner_id}
		<title_banner_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{name = alias_title_banner_anim
			param = title_banner_id}
		<title_banner_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{name = alias_bg_anim_left
			param = bg_anim_left_id}
		<bg_anim_left_id> :obj_spawnscript ui_shakey_02
	else
		scriptassert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{name = alias_bg_anim_left
			param = bg_anim_left_id}
		<bg_anim_left_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{name = alias_bg_anim_right
			param = bg_anim_right_id}
		<bg_anim_right_id> :obj_spawnscript ui_shakey_02
	else
		scriptassert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{name = alias_bg_anim_right
			param = bg_anim_right_id}
		<bg_anim_right_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'dschorn1'}
	endif
endscript

script ui_destroy_career_venue_select 
	menu_music_off
	clean_up_user_control_helpers
	if screenelementexists \{id = career_venue_select_screen_id}
		career_venue_select_screen_id :getsingletag \{players_list_id}
		if screenelementexists id = <players_list_id>
			destroyscreenelement id = <players_list_id>
		endif
		destroyscreenelement \{id = career_venue_select_screen_id}
	endif
endscript

script ui_return_career_venue_select 
	if screenelementexists \{id = career_venue_select_screen_id}
		if NOT isscreenelementinfocus \{id = career_venue_select_screen_id}
			if NOT screenelementexists \{id = band_lobby_popup_menu}
				if career_venue_select_screen_id :getsingletag \{venue_menu_id}
					if screenelementexists id = <venue_menu_id>
						launchevent type = focus target = <venue_menu_id>
					endif
				endif
				launchevent \{type = focus
					target = career_venue_select_screen_id}
			else
				band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
			endif
		endif
		if (($g_suppress_anim_in) = 1)
			change \{g_suppress_anim_in = 0}
		endif
	endif
endscript

script ui_career_venue_select_populate_venues_menu 
	requireparams \{[
			venue_index
			bot_play
		]
		all}
	if screenelementexists \{id = career_venue_select_screen_id}
		venue_list = ($progression_gig_list)
		getarraysize <venue_list>
		get_savegame_from_controller controller = ($primary_controller)
		if (<array_size> > 0)
			if career_venue_select_screen_id :desc_resolvealias \{name = alias_venue_select_menu
					param = venue_menu}
				<venue_menu> :se_setprops {
					event_handlers = [
						{pad_up ui_career_venue_select_scroll_sound params = {up}}
						{pad_down ui_career_venue_select_scroll_sound params = {down}}
					]
				}
				i = 0
				begin
				<venue_checksum> = ((<venue_list> [<i>]).venue)
				formattext checksumname = load_venue_checksum 'venue_%s' s = ($levelzones.<venue_checksum>.name)
				getglobaltags savegame = <savegame> <load_venue_checksum>
				if gotparam \{venue_to_focus}
					if (<venue_to_focus> = <venue_checksum>)
						venue_index = <i>
					endif
				endif
				if (<unlocked> = 1)
					<venue_title> = ($levelzones.<venue_checksum>.title)
					createscreenelement {
						parent = <venue_menu>
						type = descinterface
						desc = 'venue_select_item'
						venue_text_text = <venue_title>
						venue_text_rgba = [255 255 255 255]
						icon_lock_alpha = 0
						autosizedims = true
						tags = {
							venue_index = <i>
							num_venues = <array_size>
							load_venue_checksum = <load_venue_checksum>
							total_venue_stars = <venue_stars>
						}
						event_handlers = [
							{focus ui_career_venue_select_focus_venue params = {unlocked = <unlocked> stars_to_unlock = -1}}
							{unfocus ui_career_venue_select_unfocus_venue}
							{pad_choose career_venue_select_set_venue_and_continue_to_gig_select params = {unlocked = <unlocked>}}
						]
					}
					if ininternetmode
						<id> :se_setprops {
							{
								pad_option2
								net_career_venue_select_show_players_list
								params = {
									screen_id = career_venue_select_screen_id
									menu_alias = alias_venue_select_menu
									destroy_players_list_script = net_career_venue_select_destroy_players_list
								}
							}
						}
					endif
				else
					career_venue_select_get_stars_to_unlock venue_checksum = <venue_checksum> savegame = <savegame>
					formattext \{textname = venue_title
						qs(0x8fcd256a)}
					createscreenelement {
						parent = <venue_menu>
						type = descinterface
						desc = 'venue_select_item'
						venue_text_text = <venue_title>
						venue_text_rgba = [255 255 255 255]
						icon_lock_alpha = 1
						autosizedims = true
						tags = {
							venue_index = <i>
							num_venues = <array_size>
							load_venue_checksum = <load_venue_checksum>
							total_venue_stars = <venue_stars>
						}
						event_handlers = [
							{pad_choose ui_career_venue_select_denied_sound}
							{focus ui_career_venue_select_focus_venue params = {unlocked = <unlocked> stars_to_unlock = <stars_to_unlock>}}
							{unfocus ui_career_venue_select_unfocus_venue}
						]
					}
				endif
				if (<bot_play> = 0)
					<id> :se_setprops {
						exclusive_device = ($primary_controller)
					}
				endif
				create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
				<i> = (<i> + 1)
				repeat <array_size>
				if (<bot_play> = 0)
					<venue_menu> :se_setprops {
						exclusive_device = ($primary_controller)
					}
				endif
				career_venue_select_screen_id :settags venue_menu_id = <venue_menu>
				launchevent type = focus target = <venue_menu> data = {child_index = <venue_index>}
				return venue_menu_id = <venue_menu>
			endif
		endif
	endif
endscript

script career_venue_select_set_venue_and_continue_to_gig_select 
	requireparams \{[
			unlocked
		]
		all}
	if screenelementexists \{id = career_venue_select_screen_id}
		if career_venue_select_screen_id :getsingletag \{venue_menu_id}
			if screenelementexists id = <venue_menu_id>
				launchevent type = unfocus target = <venue_menu_id>
			endif
		endif
		launchevent \{type = unfocus
			target = career_venue_select_screen_id}
	endif
	obj_getid
	<objid> :getsingletag venue_index
	if (<unlocked> = 1)
		generic_event_choose {
			state = uistate_career_gig_select
			data = {
				venue_index = <venue_index>
			}
		}
	endif
endscript

script ui_career_venue_select_focus_venue 
	requireparams \{[
			unlocked
			stars_to_unlock
		]
		all}
	if screenelementexists \{id = career_venue_select_screen_id}
		obj_getid
		<objid> :gettags
		<objid> :se_setprops {
			venue_text_rgba = [0 0 0 255]
			highlight_bar_alpha = 0.4
		}
		venue_list = ($progression_gig_list)
		venue_checksum = ((<venue_list> [<venue_index>]).venue)
		formattext checksumname = load_venue_checksum 'venue_%s' s = ($levelzones.<venue_checksum>.name)
		getglobaltags savegame = <savegame> <load_venue_checksum>
		if (<unlocked> = 1)
			getglobaltags <load_venue_checksum> param = venue_stars
			get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
			progression_get_venue_stars_total player = <player_num> venue = <venue_checksum>
			formattext textname = venue_stars_text qs(0x555fff68) x = <venue_stars> y = <venue_max_stars>
			career_venue_select_screen_id :se_setprops {
				venue_poster_gh5_alpha = 1
				venue_poster_gh5_texture = ($levelzones.<venue_checksum>.poster)
				venue_unlock_menu_alpha = 0
				last_venue_unlock_alpha = 0
				venue_star_menu_alpha = 1
				venue_stars_text = <venue_stars_text>
			}
		else
			venue_unlock_menu_alpha = 1
			last_venue_unlock_alpha = 0
			if (<stars_to_unlock> = -1)
				<venue_unlock_menu_alpha> = 0
				<last_venue_unlock_alpha> = 1
			endif
			formattext textname = stars_to_unlock_text qs(0x73307931) s = <stars_to_unlock>
			career_venue_select_screen_id :se_setprops {
				venue_poster_gh5_alpha = 1
				venue_poster_gh5_texture = venue_poster_locked
				venue_unlock_menu_alpha = <venue_unlock_menu_alpha>
				venue_unlock_stars_text = <stars_to_unlock_text>
				venue_star_menu_alpha = 0
				last_venue_unlock_alpha = <last_venue_unlock_alpha>
			}
		endif
		ui_career_venue_select_update_scroll_bar venue_index = <venue_index> num_venues = <num_venues>
		ui_career_venue_select_update_helper_pills allow_choose = <unlocked>
	endif
endscript

script ui_career_venue_select_unfocus_venue 
	obj_getid
	<objid> :se_setprops {
		venue_text_rgba = [255 255 255 255]
		highlight_bar_alpha = 0
	}
endscript

script ui_career_venue_select_update_scroll_bar 
	requireparams \{[
			venue_index
			num_venues
		]
		all}
	if screenelementexists \{id = career_venue_select_screen_id}
		if (<venue_index> = 0)
			<selection> = top
		elseif (<venue_index> = (<num_venues> - 1))
			<selection> = bottom
		else
			<selection> = middle
		endif
		career_venue_select_screen_id :settags selection = <selection>
	endif
	if screenelementexists \{id = career_venue_select_screen_id}
		dx = (360.0 / (<num_venues> - 1))
		pos = ((0.0, 24.0) + ((0.0, 1.0) * (<venue_index> * <dx>)))
		career_venue_select_screen_id :se_setprops slider_nub_cont_pos = <pos> time = 0.1
	endif
endscript

script ui_career_venue_select_highlight_venue 
	requireparams \{[
			load_venue_chksum
			menu_id
		]
		all}
	getscreenelementchildren id = <menu_id>
	getarraysize <children>
	if (<array_size> > 0)
		i = 0
		begin
		if (<children> [<i>]) :getsingletag load_venue_checksum
			if (<load_venue_checksum> = <load_venue_chksum>)
				(<children> [<i>]) :se_setprops rgba = gh5_gold_md
				break
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_career_venue_select_update_helper_pills 
	requireparams \{[
			allow_choose
		]
		all}
	clean_up_user_control_helpers
	if (<allow_choose> = 1)
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if ininternetmode
		add_user_control_helper \{text = qs(0xa83061c6)
			button = yellow
			z = 100000}
	endif
endscript

script ui_career_venue_select_set_total_progression_text 
	requireparams \{[
			screen_id
			savegame
		]
		all}
	if screenelementexists id = <screen_id>
		get_current_progression_stars savegame = <savegame>
		formattext textname = stars_num_text qs(0x73307931) s = <total_stars>
		<screen_id> :se_setprops {
			career_stars_text = <stars_num_text>
		}
	endif
endscript

script career_venue_select_back_to_band_lobby 
	if screenelementexists \{id = career_venue_select_screen_id}
		if career_venue_select_screen_id :getsingletag \{venue_menu_id}
			if screenelementexists id = <venue_menu_id>
				launchevent type = unfocus target = <venue_menu_id>
			endif
		endif
		launchevent \{type = unfocus
			target = career_venue_select_screen_id}
	endif
	if ininternetmode
		if NOT ishost
			if (<no_quit_warning> = 0)
				generic_event_choose \{state = uistate_online_quit_warning
					data = {
						is_popup
						stop_rendering_on_quit
					}}
				return
			endif
		endif
	endif
	stoprendering
	ui_event_wait_for_safe
	generic_event_back \{state = uistate_band_lobby_setup}
endscript

script career_venue_select_get_stars_to_unlock 
	requireparams \{[
			venue_checksum
			savegame
		]
		all}
	getarraysize ($venue_progression)
	if (<array_size> > 0)
		get_current_progression_stars savegame = <savegame>
		i = 0
		begin
		if (<venue_checksum> = (($venue_progression) [<i>].venue_to_unlock))
			return stars_to_unlock = ((($venue_progression) [<i>].stars_required) - <total_stars>)
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{stars_to_unlock = -1}
endscript

script net_career_venue_select_back_to_band_lobby 
	requireparams \{[
			no_quit_warning
		]
		all}
	if ishost
		requireparams \{[
				device_num
			]
			all}
		getplayerinfo ($g_net_leader_player_num) controller
		if (<device_num> = <controller>)
			sendstructure \{callback = net_career_venue_select_back_to_band_lobby
				data_to_send = {
					no_quit_warning = 1
				}}
		endif
	endif
	career_venue_select_back_to_band_lobby no_quit_warning = <no_quit_warning>
endscript

script net_career_venue_select_show_players_list 
	requireparams \{[
			device_num
			screen_id
			menu_alias
			destroy_players_list_script
		]
		all}
	if (<device_num> = ($primary_controller))
		launchevent type = unfocus target = <screen_id>
		if <screen_id> :desc_resolvealias name = <menu_alias>
			launchevent type = unfocus target = <resolved_id>
		endif
		band_lobby_create_popup_menu_players_list \{list_type = matchmaking_done}
		assignalias \{id = current_menu
			alias = band_lobby_popup_menu}
		if current_menu :getsingletag \{desc_id}
			<screen_id> :settags players_list_id = <desc_id>
			current_menu :se_setprops {
				event_handlers = [
					{
						pad_back
						<destroy_players_list_script>
						params = {
							players_list_id = <desc_id>
						}
					}
				]
			}
			launchevent \{type = focus
				target = current_menu}
			add_user_control_helper controller = ($primary_controller) text = qs(0xaf4d5dd2) button = red z = 100000
		endif
	endif
endscript

script net_career_venue_select_destroy_players_list 
	requireparams \{[
			players_list_id
		]
		all}
	destroyscreenelement id = <players_list_id>
	launchevent \{type = focus
		target = career_venue_select_screen_id}
	if career_venue_select_screen_id :desc_resolvealias \{name = alias_venue_select_menu}
		launchevent type = focus target = <resolved_id>
	endif
	clean_up_user_control_helpers
	ui_career_venue_select_update_helper_pills \{allow_choose = 1}
endscript

script ui_career_venue_select_scroll_sound 
	if screenelementexists \{id = career_venue_select_screen_id}
		career_venue_select_screen_id :getsingletag \{selection}
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

script ui_career_venue_select_denied_sound 
	soundevent \{event = ui_sfx_negative_select}
endscript

script ui_career_drop_player 
	if screenelementexists \{id = career_venue_select_screen_id}
		<parent> = career_venue_select_screen_id
	elseif screenelementexists \{id = career_gig_select_screen_id}
		<parent> = career_gig_select_screen_id
	elseif screenelementexists \{id = career_gig_info_screen_id}
		<parent> = career_gig_info_screen_id
	endif
	songlist_drop_player <...>
endscript

script ui_career_end_game 
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		killspawnedscript \{name = net_career_gig_info_start_timer_spawned}
		killspawnedscript \{name = net_career_gig_info_continue_for_clients}
		songlist_end_game <...>
	endif
endscript
