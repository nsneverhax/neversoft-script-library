
script ui_init_career_venue_select 
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	if InNetGame
		if IsHost
			flowsync_cleanup
		endif
	endif
endscript

script ui_create_career_venue_select 
	Change \{net_breakdown_continue_msg_sent = 0}
	if InNetGame
		flowsync_sync_notblockingforhost
		spawn_player_drop_listeners \{drop_player_script = ui_career_drop_player
			end_game_script = ui_career_end_game}
	endif
	SpawnScriptLater \{destroy_loading_screen}
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if ScriptExists \{crowd_swells_during_stats_screen}
		KillSpawnedScript \{Name = crowd_swells_during_stats_screen}
	endif
	menu_music_on
	SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = FrontEnd
			fadeintime = 1.5
			fadeintype = linear
			fadeouttime = 1.5
			fadeouttype = linear
		}}
	initial_venue_index = 0
	if GotParam \{venue_index}
		initial_venue_index = <venue_index>
	endif
	venue_list = ($progression_gig_list)
	venue_checksum = ((<venue_list> [<initial_venue_index>]).venue)
	venue_title = ($LevelZones.<venue_checksum>.title)
	getplayerinfo ($g_net_leader_player_num) controller
	getplayerinfo ($g_net_leader_player_num) is_local_client
	if ((CheckForSignIn local controller_index = <controller>) || (<is_local_client> = 0))
		getplayerinfo ($g_net_leader_player_num) gamertag
		if ((($<gamertag>) != qs(0x00000000)) && (($<gamertag>) != qs(0x03ac90f0)))
			formatText TextName = leader_text qs(0xc8b45038) l = ($<gamertag>)
		else
			formatText TextName = leader_text qs(0x8cd67c5b) l = ($g_net_leader_player_num)
		endif
	else
		formatText TextName = leader_text qs(0x8cd67c5b) l = ($g_net_leader_player_num)
	endif
	CreateScreenElement {
		parent = root_window
		id = career_venue_select_screen_id
		Type = descinterface
		desc = 'venue_select'
		dims = (1280.0, 720.0)
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
	if GotParam \{load_venue_checksum}
		ui_career_venue_select_populate_venues_menu {
			venue_index = <initial_venue_index>
			bot_play = <bot_play>
			venue_to_focus = <load_venue_checksum>
		}
	else
		ui_career_venue_select_populate_venues_menu venue_index = <initial_venue_index> bot_play = <bot_play>
	endif
	if GotParam \{venue_menu_id}
		AssignAlias id = <venue_menu_id> alias = current_menu
	endif
	LaunchEvent \{Type = focus
		target = career_venue_select_screen_id}
	if career_venue_select_screen_id :desc_resolvealias \{Name = alias_poster_anim
			param = poster_anim_id}
		<poster_anim_id> :obj_spawnscript ui_shakey_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{Name = alias_poster_anim
			param = poster_anim_id}
		<poster_anim_id> :obj_spawnscript ui_frazzmatazz_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{Name = alias_title_banner_anim
			param = title_banner_id}
		<title_banner_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{Name = alias_title_banner_anim
			param = title_banner_id}
		<title_banner_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{Name = alias_bg_anim_left
			param = bg_anim_left_id}
		<bg_anim_left_id> :obj_spawnscript ui_shakey_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{Name = alias_bg_anim_left
			param = bg_anim_left_id}
		<bg_anim_left_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{Name = alias_bg_anim_right
			param = bg_anim_right_id}
		<bg_anim_right_id> :obj_spawnscript ui_shakey_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_venue_select_screen_id :desc_resolvealias \{Name = alias_bg_anim_right
			param = bg_anim_right_id}
		<bg_anim_right_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'dschorn1'}
	endif
endscript

script ui_destroy_career_venue_select 
	hide_glitch \{num_frames = 90}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = career_venue_select_screen_id}
		career_venue_select_screen_id :GetSingleTag \{players_list_id}
		if ScreenElementExists id = <players_list_id>
			DestroyScreenElement id = <players_list_id>
		endif
		DestroyScreenElement \{id = career_venue_select_screen_id}
	endif
endscript

script ui_return_career_venue_select 
	if ScreenElementExists \{id = career_venue_select_screen_id}
		if NOT isscreenelementinfocus \{id = career_venue_select_screen_id}
			if NOT ScreenElementExists \{id = band_lobby_popup_menu}
				if career_venue_select_screen_id :GetSingleTag \{venue_menu_id}
					if ScreenElementExists id = <venue_menu_id>
						LaunchEvent Type = focus target = <venue_menu_id>
					endif
				endif
				LaunchEvent \{Type = focus
					target = career_venue_select_screen_id}
			else
				band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
			endif
		endif
		if (($g_suppress_anim_in) = 1)
			Change \{g_suppress_anim_in = 0}
		endif
	endif
endscript

script ui_career_venue_select_populate_venues_menu 
	RequireParams \{[
			venue_index
			bot_play
		]
		all}
	if ScreenElementExists \{id = career_venue_select_screen_id}
		venue_list = ($progression_gig_list)
		GetArraySize <venue_list>
		get_savegame_from_controller controller = ($primary_controller)
		if (<array_Size> > 0)
			if career_venue_select_screen_id :desc_resolvealias \{Name = alias_venue_select_menu
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
				formatText checksumName = load_venue_checksum 'venue_%s' s = ($LevelZones.<venue_checksum>.Name)
				GetGlobalTags savegame = <savegame> <load_venue_checksum>
				if GotParam \{venue_to_focus}
					if (<venue_to_focus> = <venue_checksum>)
						venue_index = <i>
					endif
				endif
				if (<unlocked> = 1)
					<venue_title> = ($LevelZones.<venue_checksum>.title)
					CreateScreenElement {
						parent = <venue_menu>
						Type = descinterface
						desc = 'venue_select_item'
						venue_text_text = <venue_title>
						venue_text_rgba = [255 255 255 255]
						icon_lock_alpha = 0
						autosizedims = true
						tags = {
							venue_index = <i>
							num_venues = <array_Size>
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
					formatText \{TextName = venue_title
						qs(0x8fcd256a)}
					CreateScreenElement {
						parent = <venue_menu>
						Type = descinterface
						desc = 'venue_select_item'
						venue_text_text = <venue_title>
						venue_text_rgba = [255 255 255 255]
						icon_lock_alpha = 1
						autosizedims = true
						tags = {
							venue_index = <i>
							num_venues = <array_Size>
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
				repeat <array_Size>
				if (<bot_play> = 0)
					<venue_menu> :se_setprops {
						exclusive_device = ($primary_controller)
					}
				endif
				career_venue_select_screen_id :SetTags venue_menu_id = <venue_menu>
				LaunchEvent Type = focus target = <venue_menu> data = {child_index = <venue_index>}
				return venue_menu_id = <venue_menu>
			endif
		endif
	endif
endscript

script career_venue_select_set_venue_and_continue_to_gig_select 
	RequireParams \{[
			unlocked
		]
		all}
	if ScreenElementExists \{id = career_venue_select_screen_id}
		if career_venue_select_screen_id :GetSingleTag \{venue_menu_id}
			if ScreenElementExists id = <venue_menu_id>
				LaunchEvent Type = unfocus target = <venue_menu_id>
			endif
		endif
		LaunchEvent \{Type = unfocus
			target = career_venue_select_screen_id}
	endif
	Obj_GetID
	<objID> :GetSingleTag venue_index
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
	RequireParams \{[
			unlocked
			stars_to_unlock
		]
		all}
	if ScreenElementExists \{id = career_venue_select_screen_id}
		Obj_GetID
		<objID> :GetTags
		<objID> :se_setprops {
			venue_text_rgba = [0 0 0 255]
			highlight_bar_alpha = 0.4
		}
		venue_list = ($progression_gig_list)
		venue_checksum = ((<venue_list> [<venue_index>]).venue)
		formatText checksumName = load_venue_checksum 'venue_%s' s = ($LevelZones.<venue_checksum>.Name)
		GetGlobalTags savegame = <savegame> <load_venue_checksum>
		if (<unlocked> = 1)
			GetGlobalTags <load_venue_checksum> param = venue_stars
			get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
			progression_get_venue_stars_total Player = <player_num> venue = <venue_checksum>
			formatText TextName = venue_stars_text qs(0x555fff68) X = <venue_stars> y = <venue_max_stars>
			career_venue_select_screen_id :se_setprops {
				venue_poster_gh5_alpha = 1
				venue_poster_gh5_texture = ($LevelZones.<venue_checksum>.poster)
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
			formatText TextName = stars_to_unlock_text qs(0x73307931) s = <stars_to_unlock>
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
	Obj_GetID
	<objID> :se_setprops {
		venue_text_rgba = [255 255 255 255]
		highlight_bar_alpha = 0
	}
endscript

script ui_career_venue_select_update_scroll_bar 
	RequireParams \{[
			venue_index
			num_venues
		]
		all}
	if ScreenElementExists \{id = career_venue_select_screen_id}
		if (<venue_index> = 0)
			<selection> = top
		elseif (<venue_index> = (<num_venues> - 1))
			<selection> = bottom
		else
			<selection> = middle
		endif
		career_venue_select_screen_id :SetTags selection = <selection>
	endif
	if ScreenElementExists \{id = career_venue_select_screen_id}
		dx = (360.0 / (<num_venues> - 1))
		Pos = ((0.0, 24.0) + ((0.0, 1.0) * (<venue_index> * <dx>)))
		career_venue_select_screen_id :se_setprops slider_nub_cont_pos = <Pos> time = 0.1
	endif
endscript

script ui_career_venue_select_highlight_venue 
	RequireParams \{[
			load_venue_chksum
			menu_id
		]
		all}
	GetScreenElementChildren id = <menu_id>
	GetArraySize <children>
	if (<array_Size> > 0)
		i = 0
		begin
		if (<children> [<i>]) :GetSingleTag load_venue_checksum
			if (<load_venue_checksum> = <load_venue_chksum>)
				(<children> [<i>]) :se_setprops rgba = gh5_gold_md
				break
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script ui_career_venue_select_update_helper_pills 
	RequireParams \{[
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
	RequireParams \{[
			screen_id
			savegame
		]
		all}
	if ScreenElementExists id = <screen_id>
		get_current_progression_stars savegame = <savegame>
		formatText TextName = stars_num_text qs(0x73307931) s = <total_stars>
		<screen_id> :se_setprops {
			career_stars_text = <stars_num_text>
		}
	endif
endscript

script career_venue_select_back_to_band_lobby 
	if ScreenElementExists \{id = career_venue_select_screen_id}
		if career_venue_select_screen_id :GetSingleTag \{venue_menu_id}
			if ScreenElementExists id = <venue_menu_id>
				LaunchEvent Type = unfocus target = <venue_menu_id>
			endif
		endif
		LaunchEvent \{Type = unfocus
			target = career_venue_select_screen_id}
	endif
	if ininternetmode
		if NOT IsHost
			if (<no_quit_warning> = 0)
				generic_event_choose \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
				return
			endif
		endif
	endif
	generic_event_back \{state = uistate_band_lobby_setup}
endscript

script career_venue_select_get_stars_to_unlock 
	RequireParams \{[
			venue_checksum
			savegame
		]
		all}
	GetArraySize ($venue_progression)
	if (<array_Size> > 0)
		get_current_progression_stars savegame = <savegame>
		i = 0
		begin
		if (<venue_checksum> = (($venue_progression) [<i>].venue_to_unlock))
			return stars_to_unlock = ((($venue_progression) [<i>].stars_required) - <total_stars>)
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{stars_to_unlock = -1}
endscript

script net_career_venue_select_back_to_band_lobby 
	RequireParams \{[
			no_quit_warning
		]
		all}
	if IsHost
		RequireParams \{[
				device_num
			]
			all}
		getplayerinfo ($g_net_leader_player_num) controller
		if (<device_num> = <controller>)
			SendStructure \{callback = net_career_venue_select_back_to_band_lobby
				data_to_send = {
					no_quit_warning = 1
				}}
		endif
	endif
	career_venue_select_back_to_band_lobby no_quit_warning = <no_quit_warning>
endscript

script net_career_venue_select_show_players_list 
	RequireParams \{[
			device_num
			screen_id
			menu_alias
			destroy_players_list_script
		]
		all}
	if (<device_num> = ($primary_controller))
		LaunchEvent Type = unfocus target = <screen_id>
		if <screen_id> :desc_resolvealias Name = <menu_alias>
			LaunchEvent Type = unfocus target = <resolved_id>
		endif
		band_lobby_create_popup_menu_players_list \{list_type = matchmaking_done}
		AssignAlias \{id = current_menu
			alias = band_lobby_popup_menu}
		if current_menu :GetSingleTag \{desc_id}
			<screen_id> :SetTags players_list_id = <desc_id>
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
			LaunchEvent \{Type = focus
				target = current_menu}
			add_user_control_helper controller = ($primary_controller) text = qs(0xaf4d5dd2) button = red z = 100000
		endif
	endif
endscript

script net_career_venue_select_destroy_players_list 
	RequireParams \{[
			players_list_id
		]
		all}
	DestroyScreenElement id = <players_list_id>
	LaunchEvent \{Type = focus
		target = career_venue_select_screen_id}
	if career_venue_select_screen_id :desc_resolvealias \{Name = alias_venue_select_menu}
		LaunchEvent Type = focus target = <resolved_id>
	endif
	clean_up_user_control_helpers
	ui_career_venue_select_update_helper_pills \{allow_choose = 1}
endscript

script ui_career_venue_select_scroll_sound 
	if ScreenElementExists \{id = career_venue_select_screen_id}
		career_venue_select_screen_id :GetSingleTag \{selection}
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

script ui_career_venue_select_denied_sound 
	SoundEvent \{event = ui_sfx_negative_select}
endscript

script ui_career_drop_player 
	if ScreenElementExists \{id = career_venue_select_screen_id}
		<parent> = career_venue_select_screen_id
	elseif ScreenElementExists \{id = career_gig_select_screen_id}
		<parent> = career_gig_select_screen_id
	elseif ScreenElementExists \{id = career_gig_info_screen_id}
		<parent> = career_gig_info_screen_id
	endif
	songlist_drop_player <...>
endscript

script ui_career_end_game 
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		KillSpawnedScript \{Name = net_career_gig_info_start_timer_spawned}
		KillSpawnedScript \{Name = net_career_gig_info_continue_for_clients}
		songlist_end_game <...>
	endif
endscript
