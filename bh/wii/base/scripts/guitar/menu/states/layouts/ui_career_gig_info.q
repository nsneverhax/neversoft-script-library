
script ui_init_career_gig_info 
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
endscript

script ui_create_career_gig_info 
	RequireParams \{[
			from_pause_menu
			gig_global
		]
		all}
	SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = FrontEnd
			fadeintime = 2
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear
		}}
	Change \{song_breakdown_countdown_time = -1}
	if (<from_pause_menu> = 0)
		RequireParams \{[
				venue_index
				gig_index
				gig_display_index
				use_timer
			]
			all}
		if ((($<gig_global>).playlist_type) = predefined)
			playlist = (($<gig_global>).predefined_playlist)
			menu_music_off
			SpawnScriptNow songlist_cycle_song_previews params = {songs = <playlist>}
		else
			if IsSoundEventPlaying \{surge_during_stats_screen}
				StopSoundEvent \{surge_during_stats_screen
					fade_time = 1.5
					fade_type = linear}
			endif
			if ScriptExists \{crowd_swells_during_stats_screen}
				KillSpawnedScript \{Name = crowd_swells_during_stats_screen}
			endif
			menu_music_on
		endif
	else
		RequireParams \{[
				device_num
			]
			all}
	endif
	venue_list = ($progression_gig_list)
	z_priority = 10.0
	if (<from_pause_menu> = 0)
		current_venue = ((<venue_list> [<venue_index>]).venue)
	else
		gman_venuefunc \{goal = career
			tool = venue_handler
			func = get_current_venue}
		z_priority = 1000.0
	endif
	venue_title = ($LevelZones.<current_venue>.title)
	gig_struct = ($<gig_global>)
	get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
	progression_get_gig_song_stars_earned gig_name = <gig_global> Player = <player_num>
	progression_get_gig_stars_total gig_name = <gig_global>
	getplayerinfo <player_num> controller
	get_savegame_from_controller controller = <controller>
	GetGlobalTags <gig_global> savegame = <savegame> param = song1_stars_earned
	if (<song1_stars_earned> = 6)
		<gig_max_stars> = (<gig_max_stars> + 1)
	endif
	formatText TextName = gig_progress_text qs(0x555fff68) X = <gig_stars_earned> y = <gig_max_stars>
	if StructureContains \{structure = gig_struct
			name_1}
		title_top_text = (<gig_struct>.name_1)
		title_bottom_text = (<gig_struct>.name_2)
	else
		if ((<gig_struct>.playlist_type) = predefined)
			playlist = (<gig_struct>.predefined_playlist)
			prop_struct = ($on_disc_props)
			formatText TextName = title_top_text qs(0x0204c31d) t = (($<prop_struct>).(<playlist> [0]).title)
			title_bottom_text = (($<prop_struct>).(<playlist> [0]).artist)
		endif
	endif
	CreateScreenElement {
		parent = root_window
		id = career_gig_info_screen_id
		Type = descinterface
		desc = 'career_gig_info_gh5'
		gig_title_top_text = <title_top_text>
		gig_title_bottom_text = <title_bottom_text>
		venue_title_text = <venue_title>
		gig_info_text = (<gig_struct>.descrip)
		gig_progress_text = <gig_progress_text>
		venue_banner_texture = ($LevelZones.<current_venue>.banner)
		z_priority = <z_priority>
		tags = {
			green_btn_text = qs(0x03ac90f0)
		}
	}
	if ScreenElementExists \{id = career_gig_info_screen_id}
		if career_gig_info_screen_id :desc_resolvealias \{Name = 0x5e5490d4}
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 0.5}
			endif
		else
			ScriptAssert \{'UI_art: couldnt create songlist glitter. alias missing?'}
		endif
	endif
	reg_bg_alpha = 1
	pause_bg_alpha = 0
	if (<from_pause_menu> = 1)
		reg_bg_alpha = 1
		pause_bg_alpha = 1
	endif
	career_gig_info_screen_id :se_setprops {
		front_end_background_container_alpha = <reg_bg_alpha>
		pause_background_container_alpha = <pause_bg_alpha>
	}
	ui_career_gig_info_populate_songs_menu screen_id = career_gig_info_screen_id gig_struct = <gig_struct>
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		exclusive_device = ($primary_controller)
		if (<from_pause_menu> = 1)
			<exclusive_device> = <device_num>
		endif
		career_gig_info_screen_id :se_setprops {
			exclusive_device = <exclusive_device>
		}
	endif
	ui_career_gig_info_set_challenge_icon screen_id = career_gig_info_screen_id gig_struct = <gig_struct>
	ui_career_gig_info_populate_challenge_info screen_id = career_gig_info_screen_id gig_struct = <gig_struct>
	ui_career_gig_info_populate_band_config_text screen_id = career_gig_info_screen_id gig_struct = <gig_struct>
	ui_career_gig_info_populate_reward_info screen_id = career_gig_info_screen_id gig_global = <gig_global>
	if (<from_pause_menu> = 1)
		career_gig_info_screen_id :se_setprops \{event_handlers = [
				{
					pad_back
					generic_event_back
				}
			]
			replace_handlers}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		LaunchEvent \{Type = focus
			target = career_gig_info_screen_id}
	elseif (<use_timer> = 0)
		career_gig_info_setup_handlers_and_pills {
			gig_global = <gig_global>
			venue_index = <venue_index>
			gig_index = <gig_index>
			gig_display_index = <gig_display_index>
			device_num = <device_num>
			use_timer = <use_timer>
		}
	else
		if IsHost
			net_career_gig_info_continue {
				gig_global = <gig_global>
				venue_index = <venue_index>
				gig_index = <gig_index>
				gig_display_index = <gig_display_index>
			}
		else
			net_career_gig_info_start_timer gig_struct = <gig_struct>
		endif
	endif
	AssignAlias \{id = career_gig_info_screen_id
		alias = current_menu}
	if career_gig_info_screen_id :desc_resolvealias \{Name = alias_title_banner_anim
			param = title_banner_id}
		<title_banner_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_gig_info_screen_id :desc_resolvealias \{Name = alias_title_banner_anim
			param = title_banner_id}
		<title_banner_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_gig_info_screen_id :desc_resolvealias \{Name = alias_bg_anim_left
			param = bg_anim_left_id}
		<bg_anim_left_id> :obj_spawnscript ui_shakey_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_gig_info_screen_id :desc_resolvealias \{Name = alias_bg_anim_left
			param = bg_anim_left_id}
		<bg_anim_left_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_gig_info_screen_id :desc_resolvealias \{Name = alias_bg_anim_right
			param = bg_anim_right_id}
		<bg_anim_right_id> :obj_spawnscript ui_shakey_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_gig_info_screen_id :desc_resolvealias \{Name = alias_bg_anim_right
			param = bg_anim_right_id}
		<bg_anim_right_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_gig_info_screen_id :desc_resolvealias \{Name = alias_reward_icon
			param = reward_icon_id}
		<reward_icon_id> :obj_spawnscript ui_alphablink
	else
		ScriptAssert \{'dschorn1'}
	endif
	if career_gig_info_screen_id :desc_resolvealias \{Name = alias_diamondbling
			param = diamondbling_id}
		<diamondbling_id> :obj_spawnscript anim_bling params = {minradius = 10 maxradius = 30 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if career_gig_info_screen_id :desc_resolvealias \{Name = alias_diamondbling2
			param = diamondbling_id2}
		<diamondbling_id2> :obj_spawnscript anim_bling params = {minradius = 10 maxradius = 30 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if career_gig_info_screen_id :desc_resolvealias \{Name = 0x25321b9b
			param = 0x307d81a9}
		<0x307d81a9> :obj_spawnscript 0xb4c67a04 params = {time = 45}
	else
		ScriptAssert \{'UI_art'}
	endif
endscript

script ui_destroy_career_gig_info \{no_wait = 0}
	Change \{song_breakdown_countdown_time = -1}
	clean_up_user_control_helpers
	SpawnScriptNow 0xe7a45efb params = {no_wait = <no_wait>}
	songlist_kill_cycle_song_previews
endscript

script 0xe7a45efb 
	if (<no_wait> = 0)
		Wait \{2
			gameframes}
		hide_glitch \{num_frames = 60}
	endif
	if ScreenElementExists \{id = career_gig_info_screen_id}
		career_gig_info_screen_id :GetSingleTag \{players_list_id}
		if ScreenElementExists id = <players_list_id>
			DestroyScreenElement id = <players_list_id>
		endif
		DestroyScreenElement \{id = career_gig_info_screen_id}
	endif
endscript

script ui_career_gig_info_populate_songs_menu 
	RequireParams \{[
			screen_id
			gig_struct
		]
		all}
	if ScreenElementExists id = <screen_id>
		if <screen_id> :desc_resolvealias Name = alias_song_list_menu
			if (<gig_struct>.playlist_type = predefined)
				playlist = (<gig_struct>.predefined_playlist)
				prop_struct = ($on_disc_props)
				GetArraySize <playlist>
				i = 0
				begin
				formatText TextName = song_title qs(0x51e4baa9) i = (<i> + 1) s = (($<prop_struct>).(<playlist> [<i>]).title)
				CreateScreenElement {
					parent = <resolved_id>
					Type = TextBlockElement
					text = <song_title>
					font = fontgrid_text_a1
					pos_anchor = [center , center]
					just = [center , center]
					z_priority = 3
					dims = (480.0, 40.0)
					fit_width = `scale	each	line	if	larger`
					fit_height = `scale	down	if	larger`
					internal_just = [center , center]
					alpha = 1
					rgba = black
					Scale = (0.83333325, 0.83333325)
				}
				<i> = (<i> + 1)
				repeat <array_Size>
			else
				if ((<gig_struct>.num_songs) = 1)
					formatText TextName = pick_songs_text qs(0x79c625c2) n = (<gig_struct>.num_songs)
				else
					formatText TextName = pick_songs_text qs(0xff6165b9) n = (<gig_struct>.num_songs)
				endif
				CreateScreenElement {
					parent = <resolved_id>
					Type = TextBlockElement
					text = <pick_songs_text>
					font = fontgrid_text_a1
					pos_anchor = [center , center]
					just = [center , center]
					z_priority = 3
					dims = (480.0, 40.0)
					fit_width = `scale	each	line	if	larger`
					fit_height = `scale	down	if	larger`
					internal_just = [center , center]
					alpha = 1
					rgba = black
					Scale = (0.83333325, 0.83333325)
				}
			endif
		endif
	endif
endscript

script ui_career_gig_info_populate_challenge_info 
	RequireParams \{[
			screen_id
			gig_struct
		]
		all}
	if ScreenElementExists id = <screen_id>
		<challenge_bonus_text> = (<gig_struct>.bonus_text)
		formatText TextName = challenge_info_text qs(0x2763e860) c = ($<challenge_bonus_text>)
		if StructureContains \{structure = gig_struct
				gold_descrip}
			switch (<gig_struct>.target_display_type)
				case amount
				formatText TextName = easy_challenge_text qs(0x6491e216) d = (<gig_struct>.gold_descrip) t = (<gig_struct>.target_display_units)
				formatText TextName = med_challenge_text qs(0x6491e216) d = (<gig_struct>.platinum_descrip) t = (<gig_struct>.target_display_units)
				formatText TextName = hard_challenge_text qs(0x6491e216) d = (<gig_struct>.diamond_descrip) t = (<gig_struct>.target_display_units)
				case percent
				formatText TextName = easy_challenge_text qs(0x55e3a080) d = (<gig_struct>.gold_descrip) t = (<gig_struct>.target_display_units)
				formatText TextName = med_challenge_text qs(0x55e3a080) d = (<gig_struct>.platinum_descrip) t = (<gig_struct>.target_display_units)
				formatText TextName = hard_challenge_text qs(0x55e3a080) d = (<gig_struct>.diamond_descrip) t = (<gig_struct>.target_display_units)
			endswitch
		else
			formatText TextName = easy_challenge_text qs(0x6491e216) d = (<gig_struct>.easy_descrip) t = (<gig_struct>.target_display_units)
			formatText TextName = med_challenge_text qs(0x6491e216) d = (<gig_struct>.medium_descrip) t = (<gig_struct>.target_display_units)
			formatText TextName = hard_challenge_text qs(0x6491e216) d = (<gig_struct>.hard_descrip) t = (<gig_struct>.target_display_units)
		endif
		challenge_struct = {
			challenge_info_text = <challenge_info_text>
			easy_challenge_text = <easy_challenge_text>
			med_challenge_text = <med_challenge_text>
			hard_challenge_text = <hard_challenge_text>
		}
		career_gig_info_get_challenge_req_text gig_struct = <gig_struct>
		AddParam structure_name = challenge_struct Name = challenge_description_text value = <challenge_req_text>
		<screen_id> :se_setprops {
			<challenge_struct>
		}
	endif
endscript

script career_gig_info_get_challenge_req_text 
	RequireParams \{[
			gig_struct
		]
		all}
	challenge_req_text = qs(0x03ac90f0)
	if StructureContains structure = <gig_struct> bonus_text
		<challenge_bonus_text> = (<gig_struct>.bonus_text)
		<challenge_bonus_string> = ($<challenge_bonus_text>)
		getnumplayersingame
		GetArraySize (<gig_struct>.required_band)
		if (<num_players> >= <array_Size>)
			getfirstplayer
			begin
			challenge_validate_player_instrument goal_id = (<gig_struct>.id) Player = <Player>
			switch <player_instrument>
				case invalid_is_beginner
				formatText TextName = challenge_bonus_string qs(0x8f49cedb) c = ($<challenge_bonus_text>)
				break
				case invalid
				formatText TextName = challenge_bonus_string qs(0x8faca710) c = ($<challenge_bonus_text>)
				break
			endswitch
			getnextplayer Player = <Player>
			repeat <num_players>
		else
			formatText TextName = challenge_bonus_string qs(0xe6c877d8) c = ($<challenge_bonus_text>)
		endif
		<challenge_req_text> = <challenge_bonus_string>
	endif
	return challenge_req_text = <challenge_req_text>
endscript

script ui_career_gig_info_populate_band_config_text 
	RequireParams \{[
			screen_id
			gig_struct
		]
		all}
	if ScreenElementExists id = <screen_id>
		required_band = (<gig_struct>.required_band)
		required_band_text = qs(0x6502020f)
		GetArraySize <required_band>
		formatText TextName = min_band_text qs(0x0ff16c6b) n = <array_Size>
		<required_band_text> = (<required_band_text> + <min_band_text>)
		<required_band_text> = (<required_band_text> + qs(0x0f6d84e0))
		i = 0
		open_band_config = 1
		begin
		switch (<required_band> [<i>])
			case lead
			formatText \{TextName = instr_text
				qs(0x2daf1d01)}
			<required_band_text> = (<required_band_text> + <instr_text>)
			<open_band_config> = 0
			case bass
			formatText \{TextName = instr_text
				qs(0xa52b7cd0)}
			<required_band_text> = (<required_band_text> + <instr_text>)
			<open_band_config> = 0
			case drum
			formatText \{TextName = instr_text
				qs(0xe8928394)}
			<required_band_text> = (<required_band_text> + <instr_text>)
			<open_band_config> = 0
			case vocal
			formatText \{TextName = instr_text
				qs(0x17661ebb)}
			<required_band_text> = (<required_band_text> + <instr_text>)
			<open_band_config> = 0
			default
		endswitch
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<open_band_config> = 1)
			<required_band_text> = (<required_band_text> + qs(0x9a8b4e86))
		endif
		<screen_id> :se_setprops {
			band_config_text = <required_band_text>
		}
	endif
endscript

script ui_career_gig_info_set_challenge_icon 
	RequireParams \{[
			screen_id
			gig_struct
		]
		all}
	if ScreenElementExists id = <screen_id>
		required_band = (<gig_struct>.required_band)
		GetArraySize <required_band>
		icon = icon_band
		dims = (55.0, 55.0)
		challenge_instr_text = qs(0xdabf99c0)
		if (<array_Size> > 0)
			if (<array_Size> = 1)
				<dims> = (75.0, 75.0)
				switch (<required_band> [0])
					case lead
					<icon> = mixer_icon_guitar
					<challenge_instr_text> = qs(0xe896cd9b)
					case bass
					<icon> = mixer_icon_bass
					<challenge_instr_text> = qs(0x83e7e42d)
					case drum
					<icon> = mixer_icon_drums
					<challenge_instr_text> = qs(0xdc352e1a)
					case vocal
					<icon> = mixer_icon_vox
					<challenge_instr_text> = qs(0xf82eeba9)
					default
					<icon> = icon_band
					<dims> = (55.0, 55.0)
				endswitch
			endif
		endif
		<screen_id> :se_setprops {
			challenge_instrument_texture = <icon>
			challenge_instrument_dims = <dims>
			challenge_instr_text_text = <challenge_instr_text>
		}
	endif
endscript

script 0x7753b865 
	RequireParams \{[
			highest_earned
			required_difficulty
		]}
	switch (<required_difficulty>)
		case None
		if (<highest_earned> >= 1)
			return \{0xb08a5450 = true}
		endif
		case gold
		if (<highest_earned> >= 2)
			return \{0xb08a5450 = true}
		endif
		case platinum
		if (<highest_earned> >= 3)
			return \{0xb08a5450 = true}
		endif
		case diamond
		if (<highest_earned> >= 4)
			return \{0xb08a5450 = true}
		endif
		default
		return \{0xb08a5450 = FALSE}
	endswitch
	return \{0xb08a5450 = FALSE}
endscript

script ui_career_gig_info_populate_reward_info 
	RequireParams \{[
			screen_id
			gig_global
		]
		all}
	if ScreenElementExists id = <screen_id>
		get_rewards_for_gig gig_name = <gig_global>
		if NOT (GotParam no_rewards)
			get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
			progression_get_gig_challenge_stars_earned gig_name = <gig_global> Player = <player_num>
			already_beaten = 1
			career_gig_select_get_challenge_achievement_display gig_global = <gig_global>
			<challenge_icon> = <challenge_achievement_icon>
			0x7753b865 highest_earned = <highest_earned> required_difficulty = (<gig_rewards>.required_difficulty)
			if (<0xb08a5450> = FALSE)
				<already_beaten> = 0
				switch (<gig_rewards>.required_difficulty)
					case gold
					beat_text = qs(0x3f6e97eb)
					challenge_icon = icon_difficulty_gold
					case platinum
					beat_text = qs(0xfbf616ad)
					challenge_icon = icon_difficulty_platinum
					case diamond
					beat_text = qs(0xfe01d958)
					challenge_icon = icon_difficulty_diamond
					default
					beat_text = qs(0xf44cc59b)
					challenge_icon = icon_difficulty_vinyl
				endswitch
			endif
			if (<already_beaten> = 0)
				if StructureContains \{structure = gig_rewards
						vague_frontend_desc}
					reward_description = (<gig_rewards>.vague_frontend_desc)
				else
					reward_description = (<gig_rewards>.frontend_desc)
				endif
			else
				beat_text = qs(0x889e370e)
				reward_description = (<gig_rewards>.frontend_desc)
			endif
			<screen_id> :se_setprops {
				reward_menu_alpha = 1
				beat_text_text = <beat_text>
				reward_text_text = <reward_description>
				reward_icon_texture = (<gig_rewards>.unlock_icon)
				challenge_icon_texture = <challenge_icon>
			}
		endif
	endif
endscript

script career_gig_info_setup_handlers_and_pills 
	RequireParams \{[
			gig_global
			venue_index
			gig_index
			gig_display_index
			device_num
		]
		all}
	if ScreenElementExists \{id = career_gig_info_screen_id}
		gig_struct = ($<gig_global>)
		if (<gig_struct>.playlist_type = predefined)
			career_gig_info_check_song_for_vocals_play gig_struct = <gig_struct>
			if ininternetmode
				getplayerinfo ($g_net_leader_player_num) controller
				getplayerinfo ($g_net_leader_player_num) bot_play
				if (<bot_play> = 1)
					getplayerinfo ($g_net_leader_player_num) bot_original_controller
					if ((<bot_original_controller> >= 0) && (<bot_original_controller> < 4))
						<controller> = <bot_original_controller>
					endif
				endif
				if (<device_num> = <controller>)
					event_handlers = [
						{pad_back generic_event_back params = {state = uistate_career_gig_select data = {venue_index = <venue_index> gig_index = <gig_index> gig_display_index = <gig_display_index>}}}
						{
							pad_option2
							net_ui_song_breakdown_show_players_list
							params = {
								screen_id = career_gig_info_screen_id
								destroy_players_list_script = net_career_gig_info_destroy_players_list
							}
						}
					]
					if (<can_play> = 1)
						AddArrayElement {
							array = <event_handlers>
							element = {
								{
									pad_choose
									net_career_gig_info_continue
									params = {
										gig_global = <gig_global>
										venue_index = <venue_index>
										gig_index = <gig_index>
										gig_display_index = <gig_display_index>
									}
								}
							}
						}
					else
						AddArrayElement {
							array = <event_handlers>
							element = {
								{
									pad_choose
									career_gig_info_show_instrument_dialog
									params = {
										gig_struct = <gig_struct>
									}
								}
							}
						}
					endif
					event_handlers = <array>
					green_btn_text = qs(0xffb0c002)
					red_btn_text = qs(0xaf4d5dd2)
					yellow_btn_text = qs(0xa83061c6)
				else
					event_handlers = [
						{pad_choose nullscript}
						{pad_back generic_event_back params = {state = uistate_career_gig_select data = {venue_index = <venue_index> gig_index = <gig_index> gig_display_index = <gig_display_index>}}}
						{
							pad_option2
							net_ui_song_breakdown_show_players_list
							params = {
								screen_id = career_gig_info_screen_id
								destroy_players_list_script = net_career_gig_info_destroy_players_list
							}
						}
					]
					red_btn_text = qs(0xaf4d5dd2)
					yellow_btn_text = qs(0xa83061c6)
				endif
			else
				event_handlers = [
					{pad_back generic_event_back params = {state = uistate_career_gig_select data = {venue_index = <venue_index> gig_index = <gig_index> gig_display_index = <gig_display_index>}}}
				]
				if (<can_play> = 1)
					AddArrayElement {
						array = <event_handlers>
						element = {
							{
								pad_choose
								career_gig_info_continue_to_gameplay
								params = {
									gig_struct = <gig_struct>
								}
							}
						}
					}
				else
					AddArrayElement {
						array = <event_handlers>
						element = {
							{
								pad_choose
								career_gig_info_show_instrument_dialog
								params = {
									gig_struct = <gig_struct>
								}
							}
						}
					}
				endif
				event_handlers = <array>
				if isSinglePlayerGame
					getfirstplayer
					getplayerinfo <Player> part
					if ((<part> = guitar) || (<part> = bass))
						AddArrayElement {
							array = <event_handlers>
							element = {
								pad_option
								career_gig_info_switch_guitar_part
								params = {
									gig_struct = <gig_struct>
								}
							}
						}
						<event_handlers> = <array>
						if (<part> = guitar)
							blue_btn_text = qs(0x03fb92ee)
						else
							blue_btn_text = qs(0x4bcb780e)
						endif
					endif
				endif
				green_btn_text = qs(0xffb0c002)
				red_btn_text = qs(0xaf4d5dd2)
			endif
		else
			if ininternetmode
				getplayerinfo ($g_net_leader_player_num) controller
				getplayerinfo ($g_net_leader_player_num) bot_play
				if (<bot_play> = 1)
					getplayerinfo ($g_net_leader_player_num) bot_original_controller
					if ((<bot_original_controller> >= 0) && (<bot_original_controller> < 4))
						<controller> = <bot_original_controller>
					endif
				endif
				if (<device_num> = <controller>)
					event_handlers = [
						{
							pad_choose
							net_career_gig_info_continue
							params = {
								gig_global = <gig_global>
								venue_index = <venue_index>
								gig_index = <gig_index>
								gig_display_index = <gig_display_index>
							}
						}
						{pad_back generic_event_back params = {state = uistate_career_gig_select data = {venue_index = <venue_index> gig_index = <gig_index> gig_display_index = <gig_display_index>}}}
						{
							pad_option2
							net_ui_song_breakdown_show_players_list
							params = {
								screen_id = career_gig_info_screen_id
								destroy_players_list_script = net_career_gig_info_destroy_players_list
							}
						}
					]
					green_btn_text = qs(0xbd0664d2)
					red_btn_text = qs(0xaf4d5dd2)
					yellow_btn_text = qs(0xa83061c6)
				else
					event_handlers = [
						{pad_choose nullscript}
						{pad_back generic_event_back params = {state = uistate_career_gig_select data = {venue_index = <venue_index> gig_index = <gig_index> gig_display_index = <gig_display_index>}}}
					]
					red_btn_text = qs(0xaf4d5dd2)
				endif
			else
				event_handlers = [
					{pad_choose career_gig_info_continue_to_songlist params = {gig_struct = <gig_struct>}}
					{pad_back generic_event_back params = {state = uistate_career_gig_select data = {venue_index = <venue_index> gig_index = <gig_index> gig_display_index = <gig_display_index>}}}
				]
				if isSinglePlayerGame
					getfirstplayer
					getplayerinfo <Player> part
					if ((<part> = guitar) || (<part> = bass))
						AddArrayElement {
							array = <event_handlers>
							element = {
								pad_option
								career_gig_info_switch_guitar_part
								params = {
									gig_struct = <gig_struct>
								}
							}
						}
						<event_handlers> = <array>
						if (<part> = guitar)
							blue_btn_text = qs(0x03fb92ee)
						else
							blue_btn_text = qs(0x4bcb780e)
						endif
					endif
				endif
				green_btn_text = qs(0xbd0664d2)
				red_btn_text = qs(0xaf4d5dd2)
			endif
		endif
		career_gig_info_screen_id :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
		if GotParam \{green_btn_text}
			add_user_control_helper text = <green_btn_text> button = green z = 100000
			career_gig_info_screen_id :SetTags green_btn_text = <green_btn_text>
		endif
		add_user_control_helper text = <red_btn_text> button = red z = 100000
		if GotParam \{yellow_btn_text}
			add_user_control_helper text = <yellow_btn_text> button = yellow z = 100000
		endif
		if GotParam \{blue_btn_text}
			add_user_control_helper text = <blue_btn_text> button = blue z = 100000
		endif
		LaunchEvent \{Type = focus
			target = career_gig_info_screen_id}
	endif
endscript

script career_gig_info_switch_guitar_part 
	RequireParams \{[
			gig_struct
		]
		all}
	LaunchEvent \{Type = unfocus
		target = career_gig_info_screen_id}
	getfirstplayer
	getplayerinfo <Player> part
	if (<part> = guitar)
		SoundEvent \{event = ui_sfx_select}
		new_part = bass
		old_part = guitar
		setplayerinfo <Player> part = <new_part>
		button_text = qs(0x4bcb780e)
	elseif (<part> = bass)
		SoundEvent \{event = ui_sfx_select}
		new_part = guitar
		old_part = bass
		setplayerinfo <Player> part = <new_part>
		button_text = qs(0x03fb92ee)
	endif
	get_player_infos_in_use
	GetArraySize <player_infos_in_use>
	count = 0
	begin
	if ((<player_infos_in_use> [<count>]) != <Player>)
		getplayerinfo (<player_infos_in_use> [<count>]) part
		if (<part> = <new_part>)
			setplayerinfo (<player_infos_in_use> [<count>]) part = <old_part>
			break
		endif
	endif
	<count> = (<count> + 1)
	repeat <array_Size>
	Wait \{0.1
		Seconds}
	user_control_helper_change_text button = blue text = <button_text>
	career_gig_info_get_challenge_req_text gig_struct = <gig_struct>
	career_gig_info_screen_id :se_setprops {
		challenge_description_text = <challenge_req_text>
	}
	LaunchEvent \{Type = focus
		target = career_gig_info_screen_id}
endscript

script career_gig_info_continue_to_gameplay 
	RequireParams \{[
			gig_struct
		]
		all}
	if ScreenElementExists \{id = career_gig_info_screen_id}
		LaunchEvent \{Type = unfocus
			target = career_gig_info_screen_id}
	endif
	career_gig_select_set_gig_info gig_struct = <gig_struct>
	career_gig_select_setup_songlist gig_struct = <gig_struct>
	venue = (<gig_struct>.venue)
	if NOT is_ui_event_running
		if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
			create_loading_screen is_bink bink = ($LevelZones.<venue>.loading_movie)
		else
			create_loading_screen
		endif
	endif
	generic_event_choose \{no_sound
		state = uistate_play_song}
endscript

script career_gig_info_continue_to_songlist 
	RequireParams \{[
			gig_struct
		]
		all}
	if ScreenElementExists \{id = career_gig_info_screen_id}
		LaunchEvent \{Type = unfocus
			target = career_gig_info_screen_id}
	endif
	career_gig_select_set_gig_info gig_struct = <gig_struct>
	career_gig_select_setup_songlist gig_struct = <gig_struct>
	generic_event_choose \{state = uistate_songlist}
endscript

script net_career_gig_info_continue_to_gameplay_for_host 
	RequireParams \{[
			gig_struct
		]
		all}
	SendStructure callback = net_career_gig_info_continue_to_gameplay_client data_to_send = {gig_struct_id = (<gig_struct>.id)}
	career_gig_info_continue_to_gameplay gig_struct = <gig_struct>
endscript

script net_career_gig_info_continue_to_gameplay_client 
	RequireParams \{[
			gig_struct_id
		]
		all}
	career_gig_select_set_gig_info gig_struct = ($<gig_struct_id>)
	career_gig_select_setup_songlist gig_struct = ($<gig_struct_id>)
	career_gig_info_continue_to_gameplay gig_struct = ($<gig_struct_id>)
endscript

script net_career_gig_info_continue_to_songlist_for_host 
	RequireParams \{[
			gig_struct
		]
		all}
	SendStructure callback = net_career_gig_info_continue_to_songlist_client data_to_send = {gig_struct_id = (<gig_struct>.id)}
	generic_event_choose \{state = uistate_songlist}
endscript

script net_career_gig_info_continue_to_songlist_client 
	RequireParams \{[
			gig_struct_id
		]
		all}
	career_gig_select_set_gig_info gig_struct = ($<gig_struct_id>)
	career_gig_select_setup_songlist gig_struct = ($<gig_struct_id>)
	generic_event_choose \{state = uistate_songlist}
endscript

script net_career_gig_info_continue 
	RequireParams \{[
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	if ScreenElementExists \{id = career_gig_info_screen_id}
		if NOT flowsync_queryreadytocontinue
			career_gig_info_screen_id :Obj_KillSpawnedScript \{Name = client_not_ready_message_fade}
			career_gig_info_screen_id :obj_spawnscript \{client_not_ready_message_fade}
			return
		endif
		flowsync_cleanup
		career_gig_info_screen_id :se_setprops \{event_handlers = [
			]
			replace_handlers}
		clean_up_user_control_helpers
		SendStructure {
			callback = net_career_gig_info_continue_for_clients
			data_to_send = {
				gig_global = <gig_global>
				venue_index = <venue_index>
				gig_index = <gig_index>
				gig_display_index = <gig_display_index>
			}
		}
		career_gig_info_screen_id :Obj_SpawnScriptLater net_career_gig_info_start_timer_spawned params = {timer_text = qs(0xe4edd14e) gig_struct = ($<gig_global>)}
	endif
endscript

script client_not_ready_message_fade 
	career_gig_info_screen_id :se_setprops \{client_not_ready_message_alpha = 1}
	Wait \{1
		Second}
	career_gig_info_screen_id :se_setprops \{client_not_ready_message_alpha = 0
		time = 0.4}
endscript

script net_career_gig_info_continue_for_clients 
	RequireParams \{[
			gig_global
			venue_index
			gig_index
			gig_display_index
		]
		all}
	printf \{qs(0xcb9a7382)}
	if InNetGame
		ui_event_wait_for_safe
		if ui_event_exists_in_stack \{Name = 'career_gig_info'}
			printf \{qs(0xbde80af4)}
			if ui_event_is_top_popup
				generic_event_back
				ui_event_wait_for_safe
			endif
			if NOT InNetGame
				printf \{qs(0xbbcb48da)}
				return
			endif
			printf \{qs(0x889e20a4)}
			ui_event_add_params \{no_wait = 1}
			ui_event {
				event = menu_replace
				data = {
					state = uistate_career_gig_info
					from_pause_menu = 0
					gig_global = <gig_global>
					venue_index = <venue_index>
					gig_index = <gig_index>
					gig_display_index = <gig_display_index>
					use_timer = 1
				}
			}
		elseif ui_event_exists_in_stack \{Name = 'career_gig_select'}
			printf \{qs(0xbde80af4)}
			if ui_event_is_top_popup
				generic_event_back
				ui_event_wait_for_safe
			endif
			printf \{qs(0x1c7585ca)}
			if NOT InNetGame
				printf \{qs(0xbbcb48da)}
				return
			endif
			generic_event_choose {
				state = uistate_career_gig_info
				data = {
					from_pause_menu = 0
					gig_global = <gig_global>
					venue_index = <venue_index>
					gig_index = <gig_index>
					gig_display_index = <gig_display_index>
					use_timer = 1
				}
			}
		elseif ui_event_exists_in_stack \{Name = 'career_venue_select'}
			printf \{qs(0xbde80af4)}
			if ui_event_is_top_popup
				generic_event_back
				ui_event_wait_for_safe
			endif
			printf \{qs(0xbab141ef)}
			if NOT InNetGame
				printf \{qs(0xbbcb48da)}
				return
			endif
			ui_event_block {
				event = menu_add
				state = uistate_career_gig_select
				data = {
					base_name = 'career_gig_select'
					venue_index = <venue_index>
				}
			}
			printf \{qs(0x056eb48b)}
			generic_event_choose {
				state = uistate_career_gig_info
				data = {
					from_pause_menu = 0
					gig_global = <gig_global>
					venue_index = <venue_index>
					gig_index = <gig_index>
					gig_display_index = <gig_display_index>
					use_timer = 1
				}
			}
		else
			ScriptAssert \{'Not in a correct state for online career!'}
		endif
	else
		printf \{qs(0x52ea4527)}
	endif
endscript

script net_career_gig_info_start_timer 
	RequireParams \{[
			gig_struct
		]
		all}
	if ScreenElementExists \{id = career_gig_info_screen_id}
		career_gig_info_screen_id :Obj_SpawnScriptNow net_career_gig_info_start_timer_spawned params = {timer_text = qs(0xe4edd14e) gig_struct = <gig_struct>}
	endif
endscript

script net_career_gig_info_start_timer_spawned 
	RequireParams \{[
			gig_struct
			timer_text
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	career_gig_select_set_gig_info gig_struct = <gig_struct>
	career_gig_select_setup_songlist gig_struct = <gig_struct>
	Obj_GetID
	screen_id = <objID>
	net_ui_song_breakdown_wait_for_timer screen_id = <screen_id> timer_text = <timer_text>
	if (<gig_struct>.playlist_type = predefined)
		if IsHost
			host_proceed_to_online_play
		endif
	else
		generic_event_choose \{state = uistate_songlist}
	endif
endscript

script net_career_gig_info_destroy_players_list 
	RequireParams \{[
			players_list_id
		]
		all}
	DestroyScreenElement id = <players_list_id>
	LaunchEvent \{Type = focus
		target = career_gig_info_screen_id}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = career_gig_info_screen_id}
		career_gig_info_screen_id :GetTags
		if (<green_btn_text> != qs(0x03ac90f0))
			add_user_control_helper text = <green_btn_text> button = green z = 100000
		endif
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if ininternetmode
			add_user_control_helper \{text = qs(0xa83061c6)
				button = yellow
				z = 100000}
		endif
	endif
endscript

script ui_return_career_gig_info 
	if ScreenElementExists \{id = career_gig_info_screen_id}
		if NOT ScreenElementExists \{id = band_lobby_popup_menu}
			LaunchEvent \{Type = focus
				target = career_gig_info_screen_id}
		else
			band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
		endif
	endif
	if (($g_suppress_anim_in) = 1)
		Change \{g_suppress_anim_in = 0}
	endif
endscript

script 0xb4c67a04 \{time = 1.0}
	begin
	se_setprops rot_angle = 360 time = <time>
	se_waitprops
	se_setprops \{rot_angle = 0
		time = 0}
	se_waitprops
	repeat
endscript

script career_gig_info_check_for_all_vocalists 
	all_vocalists = 1
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> part
		if (<part> != vocals)
			all_vocalists = 0
			break
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return all_vocalists = <all_vocalists>
endscript

script career_gig_info_check_song_for_vocals_play 
	RequireParams \{[
			gig_struct
		]
		all}
	career_gig_info_check_for_all_vocalists
	can_play = 1
	if (<all_vocalists> = 1)
		<can_play> = 0
		song = (<gig_struct>.predefined_playlist [0])
		if StructureContains structure = ($gh_songlist_props) <song>
			song_props = ($gh_songlist_props.<song>)
			if (<song_props>.vocals_difficulty_rating > 0)
				<can_play> = 1
			endif
		endif
	endif
	return can_play = <can_play>
endscript

script career_gig_info_show_instrument_dialog 
	RequireParams \{[
			gig_struct
		]
		all}
	if ScreenElementExists \{id = career_gig_info_screen_id}
		LaunchEvent \{Type = unfocus
			target = career_gig_info_screen_id}
		create_dialog_box {
			body_text = qs(0x26b10139)
			parent = career_gig_info_screen_id
			no_background
			dlg_z_priority = 1500
			options = [
				{
					func = career_gig_info_destroy_instrument_dialog
					text = qs(0x182f0173)
					func_params = {
						gig_struct = <gig_struct>
					}
				}
			]
		}
	endif
endscript

script career_gig_info_destroy_instrument_dialog 
	RequireParams \{[
			gig_struct
		]
		all}
	destroy_dialog_box
	if ScreenElementExists \{id = career_gig_info_screen_id}
		if (<gig_struct>.playlist_type = predefined)
			green_btn_text = qs(0xffb0c002)
		else
			green_btn_text = qs(0xbd0664d2)
		endif
		add_user_control_helper text = <green_btn_text> button = green z = 100000
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if ininternetmode
			add_user_control_helper \{text = qs(0xd16792bf)
				button = yellow
				z = 100000}
		endif
		LaunchEvent \{Type = focus
			target = career_gig_info_screen_id}
	endif
endscript
