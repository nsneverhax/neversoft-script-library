
script ui_init_career_venue_select 
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	if InNetGame
		if IsHost
			FlowSync_CleanUp
		endif
	endif
endscript

script ui_create_career_venue_select 
	Change \{net_breakdown_continue_msg_sent = 0}
	if GotParam \{clear_venue_checksum}
		RemoveParameter \{load_venue_checksum}
		RemoveParameter \{clear_venue_checksum}
	endif
	if InNetGame
		FlowSync_Sync_NotBlockingForHost
		spawn_player_drop_listeners \{drop_player_script = ui_career_drop_player
			end_game_script = ui_career_end_game}
	endif
	Change \{rich_presence_context = presence_gigboard_and_setlist}
	debug_checkprogression
	if IsSoundEventPlaying \{Surge_During_Stats_Screen}
		StopSoundEvent \{Surge_During_Stats_Screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if ScriptExists \{Crowd_Swells_During_Stats_Screen}
		killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
	endif
	songlist_kill_cycle_song_previews
	menu_music_on
	spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
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
	venue_title = ($LevelZones.<venue_checksum>.Title)
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
	CreateScreenElement {
		parent = root_window
		id = career_venue_select_screen_id
		type = DescInterface
		desc = 'venue_select'
		venue_select_leader_text = <leader_text>
		slider_thumb_pos = (0.0, 22.0)
	}
	if <id> :Desc_ResolveAlias name = alias_particles1
		<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 1 start_dims = (10.0, 10.0)}
	else
		ScriptAssert \{'UI_art'}
	endif
	if <id> :Desc_ResolveAlias name = alias_particles2
		<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 1 start_dims = (10.0, 10.0)}
	else
		ScriptAssert \{'UI_art'}
	endif
	if <id> :Desc_ResolveAlias name = alias_particles3
		<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 0.5 float_time = 1 start_dims = (10.0, 10.0)}
	else
		ScriptAssert \{'UI_art'}
	endif
	if <id> :Desc_ResolveAlias name = alias_particles4
		<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 0.5 float_time = 1 start_dims = (10.0, 10.0)}
	else
		ScriptAssert \{'UI_art'}
	endif
	if career_venue_select_screen_id :Desc_ResolveAlias \{name = alias_diamondBling3
			param = diamondBling3_id}
		<diamondBling3_id> :Obj_SpawnScript anim_bling_horizontal_sm_crown params = {minwidth = 4 maxwidth = 8 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if career_venue_select_screen_id :Desc_ResolveAlias \{name = alias_bkg_anim
			param = bkg_id}
		<bkg_id> :Obj_SpawnScript ui_alphablast
	else
		ScriptAssert \{'UI_art'}
	endif
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		career_venue_select_screen_id :SE_SetProps {
			exclusive_device = ($primary_controller)
		}
	endif
	if InInternetMode
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
	career_venue_select_screen_id :SE_SetProps {
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
	LaunchEvent \{type = focus
		target = career_venue_select_screen_id}
endscript

script ui_destroy_career_venue_select 
	Menu_Music_Off
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
		if NOT IsScreenElementInFocus \{id = career_venue_select_screen_id}
			if NOT ScreenElementExists \{id = band_lobby_popup_menu}
				if career_venue_select_screen_id :GetSingleTag \{venue_menu_id}
					if ScreenElementExists id = <venue_menu_id>
						LaunchEvent type = focus target = <venue_menu_id>
					endif
				endif
				LaunchEvent \{type = focus
					target = career_venue_select_screen_id}
			else
				band_lobby_update_button_helpers controller = ($primary_controller) Menu = playerslist
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
	if NOT ScreenElementExists \{id = career_venue_select_screen_id}
		return
	endif
	venue_list = ($progression_gig_list)
	GetArraySize <venue_list>
	get_savegame_from_controller controller = ($primary_controller)
	if (<array_size> = 0)
		return
	endif
	if career_venue_select_screen_id :Desc_ResolveAlias \{name = alias_venue_select_menu
			param = venue_menu}
		<venue_menu> :SE_SetProps {
			event_handlers = [
				{pad_up ui_career_venue_select_scroll_sound params = {up}}
				{pad_down ui_career_venue_select_scroll_sound params = {down}}
			]
		}
		i = 0
		begin
		<venue_checksum> = ((<venue_list> [<i>]).venue)
		FormatText checksumname = load_venue_checksum 'venue_%s' s = ($LevelZones.<venue_checksum>.name)
		GetGlobalTags savegame = <savegame> <load_venue_checksum>
		if GotParam \{venue_to_focus}
			if (<venue_to_focus> = <venue_checksum>)
				venue_index = <i>
			endif
		endif
		if (<unlocked> = 1)
			<venue_title> = ($LevelZones.<venue_checksum>.Title)
			CreateScreenElement {
				parent = <venue_menu>
				type = DescInterface
				desc = 'venue_select_item'
				venue_text_text = <venue_title>
				venue_text_rgba = [255 255 255 255]
				light_bar_alpha = 0
				icon_lock_alpha = 0
				autoSizeDims = true
				tags = {
					venue_index = <i>
					num_venues = <array_size>
					load_venue_checksum = <load_venue_checksum>
					total_venue_stars = <venue_stars>
				}
				event_handlers = [
					{focus ui_career_venue_select_focus_venue params = {unlocked = <unlocked> stars_to_unlock = -1}}
					{unfocus ui_career_venue_select_unfocus_venue}
					{pad_choose career_venue_select_set_venue_and_continue_to_gig_select params = {unlocked = <unlocked> movie_played = <movie_played> venue = <venue_checksum>}}
				]
			}
			if InInternetMode
				<id> :SE_SetProps {
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
			career_venue_select_screen_id :SetTags venue_menu_id = <venue_menu>
		else
			career_venue_select_get_stars_to_unlock venue_checksum = <venue_checksum> savegame = <savegame>
			FormatText \{TextName = venue_title
				qs(0x8fcd256a)}
			CreateScreenElement {
				parent = <venue_menu>
				type = DescInterface
				desc = 'venue_select_item'
				venue_text_text = <venue_title>
				venue_text_rgba = [255 255 255 255]
				light_bar_alpha = 0
				icon_lock_alpha = 1
				autoSizeDims = true
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
			<id> :SE_SetProps {
				exclusive_device = ($primary_controller)
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if (<bot_play> = 0)
			<venue_menu> :SE_SetProps {
				exclusive_device = ($primary_controller)
			}
		endif
		LaunchEvent type = focus target = <venue_menu> data = {child_index = <venue_index>}
		return venue_menu_id = <venue_menu>
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
				LaunchEvent type = unfocus target = <venue_menu_id>
			endif
		endif
		LaunchEvent \{type = unfocus
			target = career_venue_select_screen_id}
	endif
	Obj_GetID
	<objID> :GetSingleTag venue_index
	if (<unlocked> = 1)
		if NOT InInternetMode
			if (<movie_played> = 0)
				FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<venue>.name)
				if StructureContains structure = ($LevelZones.<venue>) progression_movie
					generic_event_choose {
						state = UIstate_career_video
						data = {
							venue_checksum = <venue_checksum>
							progression_movie = ($LevelZones.<venue>.progression_movie)
							venue_index = <venue_index>
						}
					}
					fadetoblack \{on
						alpha = 1.0
						time = 0
						z_priority = 200}
					return
				endif
				get_savegame_from_controller controller = ($primary_controller)
				SetGlobalTags <venue_checksum> params = {movie_played = 1} savegame = <savegame> packtype = venuetags Progression = true
			endif
		endif
		generic_event_choose {
			state = UIstate_career_gig_select
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
		<objID> :SE_SetProps {
			venue_text_rgba = [0 0 0 255]
			light_bar_alpha = 1
		}
		ExtendCRCWithString checksum = <objID> string = '_particle'
		<objID> :Obj_SpawnScript create_ui_highlight_particles params = {id = <ExtendedChecksum> Pos = (800.0, 0.0) z = 9 start_scale = (0.1, 0.1) end_scale = (0.4, 0.4) emit_spread = 4 velocity = 1.0}
		venue_list = ($progression_gig_list)
		venue_checksum = ((<venue_list> [<venue_index>]).venue)
		FormatText checksumname = load_venue_checksum 'venue_%s' s = ($LevelZones.<venue_checksum>.name)
		GetGlobalTags savegame = <savegame> <load_venue_checksum>
		if (<unlocked> = 1)
			GetGlobalTags <load_venue_checksum> param = venue_stars
			get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
			progression_get_venue_stars_total player = <player_num> venue = <venue_checksum>
			FormatText TextName = venue_stars_text qs(0x555fff68) x = <venue_stars> y = <venue_max_stars>
			career_venue_select_screen_id :SE_SetProps {
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
			FormatText TextName = stars_to_unlock_text qs(0x73307931) s = <stars_to_unlock>
			career_venue_select_screen_id :SE_SetProps {
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
	<objID> :SE_SetProps {
		venue_text_rgba = [255 255 255 255]
		light_bar_alpha = 0
	}
	ExtendCRCWithString checksum = <objID> string = '_particle'
	Destroy2DParticleSystem id = <ExtendedChecksum> kill_when_empty
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
		<float_index> = (1.0 * <venue_index>)
		scroll_perc = (<float_index> / (<num_venues> - 1))
		scroll_len = 290
		scroll_pos = (((<scroll_perc> * <scroll_len>) * (0.0, 1.0)) + (0.0, 50.0))
		career_venue_select_screen_id :SE_SetProps scrollbar_thumb_pos = <scroll_pos> time = 0.08
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
	if (<array_size> > 0)
		i = 0
		begin
		if (<children> [<i>]) :GetSingleTag load_venue_checksum
			if (<load_venue_checksum> = <load_venue_chksum>)
				(<children> [<i>]) :SE_SetProps rgba = GH5_gold_md
				break
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
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
	if InInternetMode
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
		FormatText TextName = stars_num_text qs(0x73307931) s = <total_stars>
		<screen_id> :SE_SetProps {
			career_stars_text = <stars_num_text>
		}
	endif
endscript

script career_venue_select_back_to_band_lobby 
	if ScreenElementExists \{id = career_venue_select_screen_id}
		if career_venue_select_screen_id :GetSingleTag \{venue_menu_id}
			if ScreenElementExists id = <venue_menu_id>
				LaunchEvent type = unfocus target = <venue_menu_id>
			endif
		endif
		LaunchEvent \{type = unfocus
			target = career_venue_select_screen_id}
	endif
	if InInternetMode
		if NOT IsHost
			if (<no_quit_warning> = 0)
				generic_event_choose \{state = UIstate_online_quit_warning
					data = {
						is_popup
						stop_rendering_on_quit
					}}
				return
			endif
		endif
	endif
	StopRendering
	ui_event_wait_for_safe
	generic_event_back \{state = UIstate_band_lobby_setup}
endscript

script career_venue_select_get_stars_to_unlock 
	RequireParams \{[
			venue_checksum
			savegame
		]
		all}
	GetArraySize ($venue_progression)
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
	RequireParams \{[
			no_quit_warning
		]
		all}
	if IsHost
		RequireParams \{[
				device_num
			]
			all}
		GetPlayerInfo ($g_net_leader_player_num) controller
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
		LaunchEvent type = unfocus target = <screen_id>
		if <screen_id> :Desc_ResolveAlias name = <menu_alias>
			LaunchEvent type = unfocus target = <resolved_id>
		endif
		generic_menu_pad_choose_sound
		band_lobby_create_popup_menu_players_list \{list_type = matchmaking_done}
		AssignAlias \{id = current_menu
			alias = band_lobby_popup_menu}
		if current_menu :GetSingleTag \{desc_id}
			<screen_id> :SetTags players_list_id = <desc_id>
			current_menu :SE_SetProps {
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
			LaunchEvent \{type = focus
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
	LaunchEvent \{type = focus
		target = career_venue_select_screen_id}
	if career_venue_select_screen_id :Desc_ResolveAlias \{name = alias_venue_select_menu}
		LaunchEvent type = focus target = <resolved_id>
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
	SoundEvent \{event = UI_SFX_Negative_Select}
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
		killspawnedscript \{name = net_career_gig_info_start_timer_spawned}
		killspawnedscript \{name = net_career_gig_info_continue_for_clients}
		songlist_end_game <...>
	endif
endscript
