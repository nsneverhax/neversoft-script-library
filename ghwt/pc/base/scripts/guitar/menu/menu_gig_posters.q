current_gig_number = 1
current_progression_flag = none
menu_gp_current_selection = 1
menu_gp_stage = 1
menu_gp_last_gignum = 1
should_reset_gig_posters_selection = 0

script gig_posters_choose_next 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ($is_network_game = 0)
		if NOT vocals_mic_distribution_is_valid
			getplayerinfo <invalid_mic_player> controller
			generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = <controller>}
			return
		endif
	endif
	wait_for_camera_anim
	ready = 1
	if screenelementexists \{id = gp_selection_menu}
		gp_selection_menu :gettags
	endif
	if (<ready> = 0)
		return
	endif
	if ($menu_gp_stage = 0)
		return
	endif
	if ($menu_gp_stage != 1)
		if NOT gotparam \{song_checksum}
			return
		endif
	endif
	if screenelementexists \{id = gp_selection_menu}
		gp_selection_menu :settags \{ready = 0}
	endif
	if ((($is_network_game = 1) && (ishost)) || ($is_network_game = 0))
		gig_num = ($gigposter_creation_numbers [($menu_gp_current_selection - 1)])
		change current_gig_number = <gig_num>
		change menu_gp_last_gignum = <gig_num>
		change current_progression_flag = <progression_flag>
		started = 0
		is_special_event = 0
		is_paytoplay = 0
		get_progression_globals <progression_flag>
		formattext \{checksumname = tiernum
			'tier%d'
			d = $menu_gp_last_gignum}
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = $menu_gp_last_gignum
		if structurecontains structure = ($<tier_global>.<tiernum>) specialevent
			<is_special_event> = 1
		endif
		if structurecontains structure = ($<tier_global>.<tiernum>) paytoplay
			<is_paytoplay> = 1
		endif
		if structurecontains structure = ($<tier_global>.<tiernum>) createagig
			setglobaltags \{progression
				params = {
					career_using_createagig = 1
				}
				all_active_players = 1}
			generic_event_choose state = uistate_setlist data = {<...> createagig no_jamsession keep_current_level next_state = uistate_select_venue}
			return
		endif
		if gotparam \{song_checksum}
			change current_song = <song_checksum>
		else
			change current_song = ($<tier_global>.<tiernum>.songs [0])
			song_checksum = $current_song
			song_index = 0
		endif
		if ($current_progression_flag = career_band && $is_network_game = 0)
			getsavegamefromcontroller controller = ($band_mode_current_leader)
		else
			getsavegamefromcontroller controller = ($primary_controller)
		endif
		getglobaltags <gig_name> savegame = <savegame>
		if ($menu_gp_stage = 1)
			soundevent \{event = gigboard_select}
			soundevent \{event = gig_board_zoom_in}
			get_gigposter_camera_name num = ($menu_gp_current_selection)
			change target_menu_camera = <gigposter_camera>
			gig_posters_focus_popup current_selection = ($menu_gp_current_selection)
			change \{menu_gp_stage = 2}
			launchevent \{type = unfocus
				target = gp_selection_menu}
			if screenelementexists \{id = gp_selection_menu}
				gp_selection_menu :settags \{ready = 1}
			endif
			return
		endif
		single_song = 0
		setglobaltags \{progression
			params = {
				career_play_song_and_end = 0
			}
			all_active_players = 1}
		if (<completed> = 1 || <completed> = 2)
			if NOT gotparam \{play_entire_gig}
				single_song = 1
				setglobaltags \{progression
					params = {
						career_play_song_and_end = 1
					}
					all_active_players = 1}
			endif
		else
			if gotparam \{play_entire_gig}
				if (<is_paytoplay> = 1)
					if (<started> = 1)
						soundevent \{event = song_affirmation}
					endif
				else
					soundevent \{event = song_affirmation}
				endif
			endif
		endif
		if ($menu_gp_stage = 2)
			if NOT search_for_tool_in_gig \{gig = $menu_gp_last_gignum}
				if (<completed> = 1 || <completed> = 2)
					change \{menu_gp_stage = 3}
					launchevent \{type = unfocus
						target = gigboard_setlist_menu_content}
					generic_menu_pad_choose_sound
					if ($is_network_game = 0)
						destroy_menu \{menu_id = gigboardsetlistinterface}
						create_gig_poster_venue_select poster_gig_num = <gig_num> song_checksum = <song_checksum> song_index = <song_index>
					else
						sendstructure {callback = net_gig_posters_choose_next data_to_send = {
								gig_num = <gig_num> progression_flag = <progression_flag> song_checksum = <song_checksum> song_index = <song_index> single_song = <single_song>
							}
						}
						net_gig_posters_choose_next {
							gig_num = <gig_num> progression_flag = <progression_flag> song_checksum = <song_checksum> song_index = <song_index> single_song = <single_song>
						}
						destroy_gig_posters_menu \{destroy_ui_only}
						frontend_load_soundcheck \{loadingscreen
							gigboard}
						ui_event \{event = menu_back}
					endif
					return
				endif
			endif
		endif
		if (<is_special_event> = 1)
			if NOT gotparam \{challenge_num}
				if ($current_progression_flag = career_band)
					generic_event_choose state = uistate_band_difficulty data = {continue_data = {state = uistate_special_events <...> specialevent_num = ($<tier_global>.<tiernum>.specialevent)}}
					return
				endif
				ui_event event = menu_change data = {state = uistate_special_events <...> specialevent_num = ($<tier_global>.<tiernum>.specialevent)}
			else
				getplayerinfo \{1
					part}
				formattext checksumname = special_event_num 'special_event%d' d = ($<tier_global>.<tiernum>.specialevent)
				formattext checksumname = challenge 'challenge%d' d = <challenge_num>
				formattext checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
				if structurecontains structure = ($special_events_challenges.<special_event_num>.<challenge>) name
					change \{special_event_stage = 1}
					change current_special_event = ($special_events_challenges.<special_event_num>.<challenge>.name)
					change current_special_event_num = ($<tier_global>.<tiernum>.specialevent)
					change current_special_event_challenge_num = <challenge_num>
					getspecialeventtimer
					change total_special_event_time = <time>
					load_songpak = 0
					if ($current_special_event_num = 1 || $current_special_event_num = 2)
						reset_current_special_event_percentages
						change current_song = ($special_events_challenges.<special_event_num>.<challenge>.<songs_ar> [$special_event_song_index].song)
						<load_songpak> = 1
					endif
					if (<load_songpak> = 1)
						destroy_band
						unload_songqpak
						load_songqpak song_name = ($current_song) async = 0
						set_song_section_array \{player = 1}
					endif
					if NOT ($current_special_event_num = 3)
						reset_score \{player_status = player1_status}
						if ($current_progression_flag = career_band)
							generic_event_choose state = uistate_band_difficulty data = {continue_data = {state = ($special_events_challenges.<special_event_num>.<challenge>.state) <...>}}
							return
						endif
					endif
					ui_event event = menu_change data = {state = ($special_events_challenges.<special_event_num>.<challenge>.state) <...>}
				endif
			endif
		elseif (<is_paytoplay> = 1)
			if (<started> = 0)
				if ($current_progression_flag = career_band && $is_network_game = 0)
					getsavegamefromcontroller controller = ($band_mode_current_leader)
				else
					getsavegamefromcontroller controller = ($primary_controller)
				endif
				get_current_band_info
				getglobaltags <band_info> savegame = <savegame>
				paytoplay_price = ($<tier_global>.<tiernum>.paytoplay)
				launchevent \{type = unfocus
					target = gigboard_setlist_menu_content}
				if screenelementexists \{id = gigboardarrowinterface}
					destroyscreenelement \{id = gigboardarrowinterface}
				endif
				if (<cash> >= <paytoplay_price>)
					generic_menu_pad_choose_sound
					change \{target_setlist_songpreview = none}
					formattext textname = areyousuretext qs(0x48959918) d = <paytoplay_price>
					create_popup_warning_menu {
						textblock = {
							text = <areyousuretext>
							dims = (600.0, 400.0)
							scale = 0.6
						}
						player_device = <player_device>
						dlg_z_priority = 50000
						no_background
						menu_pos = (640.0, 480.0)
						back_button_script = gigboard_cancel_paytoplay
						back_button_params = {setup_paytoplay_helpers}
						options = [
							{
								func = {gigboard_continue_to_paytoplay params = {<...> deduct_funds}}
								text = qs(0x9b07ecb6)
							}
							{
								func = {gigboard_cancel_paytoplay params = {setup_paytoplay_helpers}}
								text = qs(0xf7723015)
							}
						]
					}
				else
					soundevent \{event = ui_sfx_negative_select}
					create_popup_warning_menu {
						textblock = {
							text = qs(0x531362be)
							dims = (600.0, 400.0)
							scale = 0.6
						}
						player_device = <player_device>
						dlg_z_priority = 50000
						no_background
						menu_pos = (640.0, 480.0)
						back_button_script = gigboard_cancel_paytoplay
						back_button_params = {setup_paytoplay_helpers}
						options = [
							{
								func = {gigboard_cancel_paytoplay params = {setup_paytoplay_helpers}}
								text = qs(0x0e41fe46)
							}
						]
					}
				endif
			else
				gigboard_continue_to_paytoplay <...>
			endif
		else
			if ($current_progression_flag = career_band)
				if (($is_network_game = 1) && (ishost))
					sendstructure {callback = net_gig_posters_choose_next data_to_send = {
							gig_num = <gig_num> progression_flag = <progression_flag> song_checksum = <song_checksum> song_index = <song_index> single_song = <single_song>
						}
					}
					net_gig_posters_choose_next {
						gig_num = <gig_num> progression_flag = <progression_flag> song_checksum = <song_checksum> song_index = <song_index> single_song = <single_song>
					}
					destroy_gig_posters_menu \{destroy_ui_only}
					frontend_load_soundcheck \{loadingscreen
						gigboard}
					ui_event \{event = menu_back}
				else
					generic_event_choose state = uistate_play_song data = {<...>}
				endif
				return
			endif
			create_loading_screen
			ui_event event = menu_change data = {state = uistate_play_song <...>}
		endif
	endif
endscript

script net_gig_posters_choose_next 
	printf \{qs(0xdcdb9658)}
	printstruct <...>
	change menu_gp_current_selection = <gig_num>
	change current_gig_number = <gig_num>
	change current_progression_flag = <progression_flag>
	change current_song = <song_checksum>
	change net_career_song_index = <song_index>
	setglobaltags progression params = {career_play_song_and_end = <single_song>}
	if screenelementexists \{id = band_mode_menu}
		band_mode_menu :settags \{net_gig_ready = 1}
		update_network_ticker \{msg_checksum = gig_selected}
	endif
	change net_career_selected_song = <song_checksum>
	change net_career_selected_gig = <gig_num>
endscript

script create_gig_posters_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		mark_safe_for_shutdown
		return
	endif
	change \{rich_presence_context = presence_gigboard_and_setlist}
	setglobaltags \{progression
		params = {
			career_using_createagig = 0
		}
		all_active_players = 1}
	change \{quickplay_song_list_current = -1}
	reset_gigposter_creation_numbers
	if ($should_reset_gig_posters_selection = 1)
		change \{menu_gp_current_selection = 1}
		change \{should_reset_gig_posters_selection = 0}
	endif
	if gameispaused
		unpausegame
	endif
	menu_music_off
	gig_posters_song_focus
	reset_all_special_events
	getpakmancurrentname \{map = zones}
	if (<pakname> != 'z_board_room')
		if pakfilesarecached
			stoprendering
		else
			create_loading_screen
		endif
		if pakfilesarecached
			setpakmancurrentblock \{map = zones
				pak = z_board_room
				block_scripts = 1}
		else
			setpakmancurrentblock \{map = zones
				pak = z_board_room
				block_scripts = 0}
		endif
		apply_band_logo_to_venue \{step = build}
		wait \{2
			gameframes}
		apply_band_logo_to_venue \{step = apply}
		if pakfilesarecached
			if isxenon
				hide_glitch \{num_frames = 3}
			endif
			startrendering
		endif
		destroy_loading_screen
		lightshow_initeventmappings
		lightshow_dummyloop
		if NOT viewportexists \{id = bg_viewport}
			setup_bg_viewport
		endif
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'gig_posters'
			}}
	endif
	kill_all_posters
	gigboard_get_exclusive_controller controller = <controller>
	change \{menu_gp_stage = 1}
	change \{gig_posters_last_focused_selection = 1}
	progression_flag = career_band
	unlock_order = gh4_career_band_progression_unlock_order
	part = band
	if (($current_num_players = 1) && ($is_network_game = 0))
		getplayerinfo \{1
			part}
	endif
	if (<part> = guitar)
		progression_flag = career_guitar
		unlock_order = gh4_career_guitar_progression_unlock_order
	elseif (<part> = bass)
		progression_flag = career_bass
		unlock_order = gh4_career_bass_progression_unlock_order
	elseif (<part> = drum)
		progression_flag = career_drum
		unlock_order = gh4_career_drum_progression_unlock_order
	elseif (<part> = vocals)
		progression_flag = career_vocals
		unlock_order = gh4_career_vocals_progression_unlock_order
	endif
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	change current_progression_savegame = <savegame>
	register_new_progression_atoms <progression_flag> keep_current_savegame
	get_progression_globals <progression_flag>
	setlist_prefix = ($<tier_global>.prefix)
	event_handlers = [
		{pad_back gig_posters_back}
		{pad_up gig_posters_up params = {progression_flag = <progression_flag>}}
		{pad_down gig_posters_down params = {progression_flag = <progression_flag>}}
		{pad_choose gig_posters_choose_next params = {progression_flag = <progression_flag>}}
		{pad_option debug_gig_start params = {progression_flag = <progression_flag>}}
	]
	createscreenelement {
		type = containerelement
		parent = root_window
		id = gp_selection_menu
		exclusive_device = <controller>
		event_handlers = <event_handlers>
		tags = {ready = 0 last_section = 0 first_unlocked_selection = 0}
	}
	formattext checksumname = gignum 'gig%d' d = ($menu_gp_current_selection)
	created_gignum = 1
	if structurecontains structure = $<unlock_order> freegigs
		gig_num = 1
		begin
		formattext checksumname = gignum 'gig%d' d = <gig_num>
		if NOT structurecontains structure = ($<unlock_order>.freegigs) <gignum>
			break
		endif
		if structurecontains structure = ($<unlock_order>.freegigs.<gignum>) dont_add_gig_poster
			break
		endif
		gig = ($<unlock_order>.freegigs.<gignum>.name)
		free_gig_num = ($<unlock_order>.freegigs.<gignum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		getglobaltags <gig_name> savegame = <savegame>
		setup_gigboard_poster <...> poster_gig_num = <free_gig_num>
		<created_gignum> = (<created_gignum> + 1)
		<gig_num> = (<gig_num> + 1)
		repeat
	endif
	set_num = 1
	begin
	formattext checksumname = setnum 'unlockset%d' d = <set_num>
	if NOT structurecontains structure = $<unlock_order> <setnum>
		break
	endif
	gig_num = 1
	begin
	formattext checksumname = gignum 'gig%d' d = <gig_num>
	if NOT structurecontains structure = ($<unlock_order>.<setnum>) <gignum>
		break
	endif
	if isgigunlocked set = <setnum> gig = <gignum> setlist_prefix = <setlist_prefix> unlock_order = <unlock_order> savegame = <savegame>
		if structurecontains structure = ($<unlock_order>.<setnum>.<gignum>) forced_pos
			setup_gigboard_poster <...> forced_pos = ($<unlock_order>.<setnum>.<gignum>.forced_pos)
		else
			setup_gigboard_poster <...>
		endif
		<created_gignum> = (<created_gignum> + 1)
	endif
	<gig_num> = (<gig_num> + 1)
	repeat
	specialevent_num = 1
	begin
	formattext checksumname = gignum 'special_event%d' d = <specialevent_num>
	if NOT structurecontains structure = ($<unlock_order>.<setnum>) <gignum>
		break
	endif
	if isgigunlocked set = <setnum> gig = <gignum> setlist_prefix = <setlist_prefix> unlock_order = <unlock_order> savegame = <savegame>
		setup_gigboard_poster <...>
		<created_gignum> = (<created_gignum> + 1)
	endif
	<specialevent_num> = (<specialevent_num> + 1)
	repeat
	paytoplay_num = 1
	begin
	formattext checksumname = gignum 'pay_to_play%d' d = <paytoplay_num>
	if NOT structurecontains structure = ($<unlock_order>.<setnum>) <gignum>
		break
	endif
	if isgigunlocked set = <setnum> gig = <gignum> setlist_prefix = <setlist_prefix> unlock_order = <unlock_order> savegame = <savegame>
		if structurecontains structure = ($<unlock_order>.<setnum>.<gignum>) forced_pos
			setup_gigboard_poster <...> forced_pos = ($<unlock_order>.<setnum>.<gignum>.forced_pos)
		else
			setup_gigboard_poster <...>
		endif
		<created_gignum> = (<created_gignum> + 1)
	endif
	<paytoplay_num> = (<paytoplay_num> + 1)
	repeat
	<set_num> = (<set_num> + 1)
	repeat
	if structurecontains structure = $<unlock_order> freegigs_last
		gig_num = 1
		begin
		formattext checksumname = gignum 'gig%d' d = <gig_num>
		if NOT structurecontains structure = ($<unlock_order>.freegigs_last) <gignum>
			break
		endif
		gig = ($<unlock_order>.freegigs_last.<gignum>.name)
		free_gig_num = ($<unlock_order>.freegigs_last.<gignum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		getglobaltags <gig_name> savegame = <savegame>
		if structurecontains structure = ($<unlock_order>.freegigs_last.<gignum>) forced_pos
			setup_gigboard_poster <...> poster_gig_num = <free_gig_num> forced_pos = ($<unlock_order>.freegigs_last.<gignum>.forced_pos)
		else
			setup_gigboard_poster <...> poster_gig_num = <free_gig_num>
		endif
		<created_gignum> = (<created_gignum> + 1)
		<gig_num> = (<gig_num> + 1)
		repeat
	endif
	replace_texture_on_gig_posters
	if ($enable_button_cheats = 1)
		if ($is_network_game = 0)
			gp_selection_menu :setprops {
				event_handlers = [
					{pad_left debug_complete_gig_cheat params = {<...>}}
				]
			}
		endif
	endif
	gp_selection_menu :obj_spawnscript {
		monitor_gig_poster_selection params = {
			<...>
			progression_flag = <progression_flag>
		}
	}
	gig_posters_setup_helpers
	assignalias \{id = gp_selection_menu
		alias = gig_posters_menu}
endscript

script gig_posters_setup_helpers 
	clean_up_user_control_helpers
	if screenelementexists \{id = gigboardarrowinterface}
		destroyscreenelement \{id = gigboardarrowinterface}
	endif
	if ($is_network_game = 1)
		if ishost
			if gotparam \{setup_paytoplay_helpers}
				add_user_control_helper \{text = qs(0xb7b2ba93)
					button = green
					z = 100}
				add_user_control_helper \{text = qs(0x0bbc9ad9)
					button = red
					z = 100}
			else
				menu_finish
			endif
		else
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100}
		endif
	else
		if gotparam \{setup_paytoplay_helpers}
			add_user_control_helper \{text = qs(0xb7b2ba93)
				button = green
				z = 100}
			add_user_control_helper \{text = qs(0x0bbc9ad9)
				button = red
				z = 100}
		else
			menu_finish
		endif
	endif
	if ((notcd) && ($enable_button_cheats = 1))
		add_user_control_helper \{text = qs(0xb7802856)
			button = blue
			z = 100}
	endif
	createscreenelement \{type = descinterface
		parent = root_window
		id = gigboardarrowinterface
		desc = 'gig_board_arrows'
		gig_board_arrow_left_alpha = 0
		gig_board_arrow_right_alpha = 0
		gig_board_arrow_texture = name_arrow_dn}
endscript

script gig_posters_back 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_back_sound
	wait_for_camera_anim
	ready = 1
	if screenelementexists \{id = gp_selection_menu}
		gp_selection_menu :gettags
	endif
	if (<ready> = 0)
		return
	endif
	if ($menu_gp_stage > 1)
		return
	endif
	if NOT scriptisrunning \{gig_posters_setlist_back}
		hide_glitch \{num_frames = 10}
		gp_selection_menu :settags \{ready = 0}
		wait_for_camera_anim
		change \{menu_gp_current_selection = 1}
		change \{menu_gp_stage = 0}
		if pakfilesarecached
			if frontend_anim_paks_are_loaded
				stoprendering
			endif
		endif
		destroy_gig_posters_menu \{destroy_ui_only}
		frontend_load_soundcheck \{loadingscreen
			gigboard}
		generic_event_back \{nosound}
	endif
endscript

script wait_for_camera_anim 
	wait \{5
		gameframes}
	begin
	if is_menu_camera_finished
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript
gig_posters_popup_timer = 0

script monitor_gig_poster_selection 
	if NOT gotparam \{came_from_setlist}
		get_gigposter_camera_name \{num = 0}
		change target_menu_camera = <gigposter_camera>
		wait ($gig_posters_initial_wait_time) seconds
	endif
	spawnscriptnow \{gigposters_camera_out}
	gigposters_toggle_with_fire num = ($menu_gp_current_selection) off
	wait \{15
		gameframes}
	wait_for_camera_anim
	if NOT gotparam \{came_from_setlist}
		gig_do_hand_animation
	endif
	gigposters_toggle_with_fire num = ($menu_gp_current_selection) on
	launchevent \{type = focus
		target = gp_selection_menu}
	gp_selection_menu :settags \{ready = 1}
	show_setlist_on_gigboard created_gignum = ($menu_gp_current_selection)
	spawnscriptlater \{setlist_songpreview_monitor}
	gigposters_cycle_song_previews
endscript

script gigposters_camera_out 
	killspawnedscript \{name = oneshotsbetweensongs}
	killspawnedscript \{name = surgebetweensongs}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	setsoundbussparams {sfx_balance = {vol = ($default_bussset.sfx_balance.vol)}}
	setsoundbussparams {crowd_balance = {vol = ($default_bussset.crowd_balance.vol)}}
	if NOT (issoundplaying ext_md_crowd_good_loop_ft)
		skate8_sfx_backgrounds_new_area \{bg_sfx_area = frontend_menu_music
			immediate = 1}
	endif
	begin
	if is_menu_camera_finished
		get_gigboard_section
		if (<section> = 1)
			lightshow_playsnapshot \{name = left_board
				save = false
				usesnapshotpositions = false}
			safecreate \{nodename = z_board_room_g_rm_light_off}
			safekill \{nodename = z_board_room_g_rm_light_on}
			safekill \{nodename = z_board_room_g_rm_small_lights_off}
			safecreate \{nodename = z_board_room_g_rm_small_lights_on}
		elseif (<section> = 2)
			lightshow_playsnapshot \{name = middle_board
				save = false
				usesnapshotpositions = false}
			safekill \{nodename = z_board_room_g_rm_light_off}
			safecreate \{nodename = z_board_room_g_rm_light_on}
			safecreate \{nodename = z_board_room_g_rm_small_lights_off}
			safekill \{nodename = z_board_room_g_rm_small_lights_on}
			i = 5
			begin
			formattext checksumname = dark_poster 'Z_Board_Room_G_RM_Gig_dark_%d' d = <i>
			safekill nodename = <dark_poster>
			<i> = (<i> + 1)
			repeat 5
			safekill \{nodename = z_board_room_g_rm_poster_dark}
		else
			i = 5
			begin
			formattext checksumname = dark_poster 'Z_Board_Room_G_RM_Gig_dark_%d' d = <i>
			safecreate nodename = <dark_poster>
			<i> = (<i> + 1)
			repeat 5
			safecreate \{nodename = z_board_room_g_rm_poster_dark}
		endif
		if (<section> = 5)
			safekill \{nodename = z_board_room_gfx_fx_confetti_01}
			get_progression_globals ($current_progression_flag)
			format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = 13
			getglobaltags <gig_name> params = first_time_unlocked savegame = <savegame>
			if (<first_time_unlocked> = 1)
				soundevent \{event = fireworks_last_venue}
				kill \{prefix = z_board_room_gfx_fx_twfx_01
					noprefixwarning}
				create \{prefix = z_board_room_gfx_fx_twfx_01
					noprefixwarning}
				safecreate \{nodename = z_board_room_gfx_fx_confetti_01}
			endif
		endif
		if (<section> = 4)
			kill \{prefix = z_board_room_gfx_fx_twfx_01
				noprefixwarning}
			safekill \{nodename = z_board_room_gfx_fx_confetti_01}
		endif
		if (<section> = 3)
			kill \{prefix = z_board_room_gfx_fx_twfx_01
				noprefixwarning}
			safekill \{nodename = z_board_room_gfx_fx_confetti_01}
		endif
		if (<section> = 2)
			kill \{prefix = z_board_room_gfx_fx_twfx_01
				noprefixwarning}
			safekill \{nodename = z_board_room_gfx_fx_confetti_01}
		endif
		if (<section> = 1)
			kill \{prefix = z_board_room_gfx_fx_twfx_01
				noprefixwarning}
			safekill \{nodename = z_board_room_gfx_fx_confetti_01}
		endif
		get_gigposter_camera_name_section num = <section>
		if ($target_menu_camera != <gigposter_camera>)
			gp_selection_menu :getsingletag \{last_section}
			if (<last_section> > <section>)
				soundevent \{event = gigboard_zoom_left}
			elseif (<last_section> < <section>)
				soundevent \{event = gigboard_zoom_right}
			endif
			gp_selection_menu :settags last_section = <section>
		endif
		change target_menu_camera = <gigposter_camera>
		break
	endif
	wait \{1
		gameframe}
	repeat
	update_gigboard_arrows
	wait_for_camera_anim
	if screenelementexists \{id = gp_selection_menu}
		gp_selection_menu :settags \{ready = 1}
	endif
endscript

script update_gigboard_arrows 
	if screenelementexists \{id = gigboardarrowinterface}
		gig_board_arrow_left_alpha = 0
		gig_board_arrow_right_alpha = 0
		get_gigboard_section
		current_section = <section>
		getarraysize \{$gigposter_creation_numbers}
		i = ($menu_gp_current_selection)
		begin
		if (<i> >= <array_size>)
			break
		endif
		if (($gigposter_creation_numbers [<i>]) != 0)
			get_gigboard_section num = <i>
			if (<section> > <current_section>)
				if (($gigposter_creation_numbers [<i>]) = 19)
					get_songs_available_for_create_a_setlist
					if (<num_songs_available> > 0)
						gig_board_arrow_right_alpha = 1
						break
					endif
				else
					gig_board_arrow_right_alpha = 1
					break
				endif
			endif
		endif
		i = (<i> + 1)
		repeat 20
		get_gigboard_section
		if (<current_section> = 1)
			gig_board_arrow_left_alpha = 0
		else
			gig_board_arrow_left_alpha = 1
		endif
		if (<current_section> = 5)
			gig_board_arrow_right_alpha = 0
		endif
		gigboardarrowinterface :se_setprops {
			gig_board_arrow_left_alpha = <gig_board_arrow_left_alpha>
			gig_board_arrow_right_alpha = <gig_board_arrow_right_alpha>
		}
	endif
endscript

script destroy_gig_posters_menu 
	if screenelementexists \{id = gp_selection_menu}
		setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)}}
		killspawnedscript \{name = gigposters_cycle_song_previews_spawned}
		spawnscriptnow \{destroy_setlist_songpreview_monitor}
		killspawnedscript \{name = monitor_gig_poster_selection}
		destroy_menu \{menu_id = gigboardsetlistinterface}
		killcamanim \{name = ch_view_cam}
		destroy_viewport_ui
		destroy_menu \{menu_id = gp_selection_menu}
		generic_ui_destroy
		destroy_gig_band_money_display
		if screenelementexists \{id = gigboardarrowinterface}
			destroyscreenelement \{id = gigboardarrowinterface}
		endif
		destroy_count = 1
		begin
		formattext checksumname = viewport_id 'gigposters_viewport_id%d' d = <destroy_count>
		formattext checksumname = viewport_override_id 'gigposters_viewport_override_id%d' d = <destroy_count>
		formattext checksumname = window_id 'gigposters_window_id%d' d = <destroy_count>
		destroy_viewport_ui {
			viewport_id = <viewport_id>
			viewport_override_id = <viewport_override_id>
			window_id = <window_id>
		}
		<destroy_count> = (<destroy_count> + 1)
		repeat 19
		destroy_count = 1
		begin
		formattext checksumname = viewport_id 'setlist_viewport_id%d' d = <destroy_count>
		formattext checksumname = viewport_override_id 'setlist_viewport_override_id%d' d = <destroy_count>
		formattext checksumname = window_id 'setlist_window_id%d' d = <destroy_count>
		destroy_viewport_ui {
			viewport_id = <viewport_id>
			viewport_override_id = <viewport_override_id>
			window_id = <window_id>
		}
		<destroy_count> = (<destroy_count> + 1)
		repeat 19
		created_gignum = 1
		begin
		formattext checksumname = poster_container_id 'poster_%d' d = <created_gignum>
		if screenelementexists id = <poster_container_id>
			destroy_menu menu_id = <poster_container_id>
		endif
		<created_gignum> = (<created_gignum> + 1)
		repeat 19
	endif
	if NOT gotparam \{destroy_ui_only}
		if ($menu_gp_stage = 0)
			destroy_band
		endif
		setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)}}
		spawnscriptlater \{menu_music_on}
		if NOT (issoundplaying ext_md_crowd_good_loop_ft)
			skate8_sfx_backgrounds_new_area \{bg_sfx_area = frontend_menu_music
				immediate = 1}
		endif
	endif
	destroy_menu \{menu_id = gigboardvenueselectinterface}
endscript
gig_posters_last_focused_selection = 1

script gig_posters_focus_popup 
	if NOT gotparam \{back_from_venue_select}
		change gig_posters_last_focused_selection = <current_selection>
		gigposters_toggle_with_fire num = <current_selection> off focused
		toggle_gigposter_difficulty_texture diffnum = <current_selection> off fix_for_last_gigs
	endif
	create_gigboard_poster_with_viewport <...> created_gignum = <current_selection>
	gp_selection_menu :settags \{ready = 1}
endscript

script gig_posters_unfocus_popup 
	if screenelementexists \{id = gp_selection_menu}
		gp_selection_menu :settags \{ready = 0}
	endif
	destroy_gig_posters_window created_gignum = <current_selection>
	gigposters_toggle_with_fire num = <current_selection> off unfocused
	gig_posters_song_focus
	if NOT gotparam \{keep_viewport}
		destroy_gigboard_setlist_viewport created_gignum = <current_selection>
	endif
endscript

script gig_posters_move_selection 
	if ($menu_gp_current_selection <= 0)
		return
	endif
	gigposters_toggle_with_fire num = ($menu_gp_current_selection) on <...>
	spawnscriptnow \{gigposters_camera_out}
	show_setlist_on_gigboard created_gignum = ($menu_gp_current_selection)
	gigposters_cycle_song_previews
endscript

script gig_posters_up 
	if screenelementexists \{id = gp_selection_menu}
		gp_selection_menu :gettags
	endif
	if (<ready> = 0)
		return
	endif
	if ($menu_gp_current_selection - 1 <= 0)
		return
	endif
	get_progression_globals <progression_flag>
	num_tiers = ($<tier_global>.num_tiers)
	found_gig = 0
	entry = ($menu_gp_current_selection - 1)
	begin
	if (($gigposter_creation_numbers [(<entry> - 1)]) != 0)
		<found_gig> = ($gigposter_creation_numbers [(<entry> - 1)])
		formattext checksumname = tier 'tier%d' d = <found_gig>
		if structurecontains structure = ($<tier_global>.<tier>) createagig
			if ($is_network_game)
				found_gig = 0
			else
				get_songs_available_for_create_a_setlist
				if (<num_songs_available> = 0)
					found_gig = 0
				endif
			endif
		endif
		if (<found_gig> > 0)
			break
		endif
	endif
	<entry> = (<entry> - 1)
	repeat ($menu_gp_current_selection)
	if (<found_gig> = 0)
		return
	endif
	soundevent \{event = gigboard_scroll_up_down}
	gig_posters_unfocus_popup current_selection = ($menu_gp_current_selection)
	change menu_gp_current_selection = <entry>
	gig_posters_move_selection
endscript

script gig_posters_down 
	if screenelementexists \{id = gp_selection_menu}
		gp_selection_menu :gettags
	endif
	if (<ready> = 0)
		return
	endif
	get_progression_globals (<progression_flag>)
	repeat_num = (($<tier_global>.num_tiers) - ($menu_gp_current_selection))
	if (<repeat_num> <= 0)
		return
	endif
	found_gig = 0
	entry = ($menu_gp_current_selection + 1)
	begin
	if (($gigposter_creation_numbers [(<entry> - 1)]) != 0)
		<found_gig> = ($gigposter_creation_numbers [(<entry> - 1)])
		formattext checksumname = tier 'tier%d' d = <found_gig>
		if structurecontains structure = ($<tier_global>.<tier>) createagig
			if ($is_network_game)
				found_gig = 0
			else
				get_songs_available_for_create_a_setlist
				if (<num_songs_available> = 0)
					found_gig = 0
				endif
			endif
		endif
		if (<found_gig> > 0)
			break
		endif
	endif
	<entry> = (<entry> + 1)
	repeat (<repeat_num>)
	if (<found_gig> = 0)
		return
	endif
	soundevent \{event = gigboard_scroll_up_down}
	gig_posters_unfocus_popup current_selection = ($menu_gp_current_selection)
	change menu_gp_current_selection = <entry>
	gig_posters_move_selection
endscript

script create_gig_poster_venue_select progression_flag = ($current_progression_flag)
	if screenelementexists \{id = gigboardarrowinterface}
		destroyscreenelement \{id = gigboardarrowinterface}
	endif
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	gig_posters_song_focus
	get_progression_globals <progression_flag>
	formattext checksumname = tiername 'tier%d' d = <poster_gig_num>
	tier_level = ($<tier_global>.<tiername>.level)
	level_poster = ($<tier_global>.<tiername>.poster_texture)
	gigboard_get_exclusive_controller
	createscreenelement \{type = descinterface
		parent = root_window
		id = gigboardvenueselectinterface
		desc = 'gig_board_venue'
		z_priority = 20000
		arrow_texture = name_arrow_dn
		head_bg_texture = gig_highlight_blacken}
	if gigboardvenueselectinterface :desc_resolvealias \{name = alias_gig_venue_content}
		assignalias id = <resolved_id> alias = venue_select_menu
		venue_select_menu :se_setprops {
			exclusive_device = <controller>
			event_handlers = [
				{pad_back gig_posters_setlist_back}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
	endif
	getarraysize \{$levelzonearray}
	level_zone_array_size = <array_size>
	index = 0
	num_added = 0
	begin
	get_levelzonearray_checksum index = <index>
	if NOT structurecontains structure = ($levelzones.<level_checksum>) debug_only
		get_progression_globals (<progression_flag>)
		formattext {
			checksumname = venue_checksum
			'%s_%i'
			s = ($levelzones.<level_checksum>.name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			addtostringlookup = true
		}
		getglobaltags <venue_checksum> param = unlocked savegame = <savegame>
		printf 'venue_checksum = %v .. unlocked = %u' v = <venue_checksum> u = <unlocked>
		add_venue = 0
		if (<unlocked> = 1)
			add_venue = 1
		endif
		if ($cheat_unlockattballpark = 1)
			if (<level_checksum> = load_z_ballpark)
				add_venue = 1
			endif
		endif
		if (<add_venue> = 1)
			createscreenelement {
				type = containerelement
				parent = venue_select_menu
				dims = (500.0, 50.0)
				just = [center center]
				internal_just = [center center]
				event_handlers = [
					{focus gigposter_venue_focus}
					{unfocus gigposter_venue_unfocus}
					{pad_choose venue_select_play_song params = {<...> selected_level = <level_checksum> gig_num = <poster_gig_num>}}
				]
			}
			item_container = <id>
			createscreenelement {
				type = spriteelement
				parent = <item_container>
				texture = gig_highlight_blacken
				rgba = ($gigboard_setlist_props.<level_poster>.highlight_rgba)
				dims = (500.0, 50.0)
				pos = (250.0, 0.0)
				z_priority = 2
				alpha = 0
				just = [center center]
				internal_just = [center center]
			}
			createscreenelement {
				type = textelement
				parent = <item_container>
				font = fontgrid_text_a8
				text = ($levelzones.<level_checksum>.title)
				rgba = ($gigboard_setlist_props.<level_poster>.songname_rgba)
				pos = (250.0, 0.0)
				internal_scale = (0.8, 0.8)
				z_priority = 3
				just = [center center]
				internal_just = [center center]
			}
			num_added = (<num_added> + 1)
		endif
	endif
	<index> = (<index> + 1)
	repeat <level_zone_array_size>
	if (<num_added> > 5)
		gigboardvenueselectinterface :se_setprops \{arrow_up_alpha = 1
			arrow_down_alpha = 1}
	endif
	launchevent \{type = focus
		target = venue_select_menu}
	gp_selection_menu :settags \{ready = 1}
endscript

script gigposter_venue_focus 
	obj_getid
	if resolvescreenelementid id = {<objid> child = 0} param = focus_item
		setscreenelementprops id = <focus_item> alpha = 1
	endif
endscript

script gigposter_venue_unfocus 
	obj_getid
	if resolvescreenelementid id = {<objid> child = 0} param = focus_item
		setscreenelementprops id = <focus_item> alpha = 0
	endif
endscript

script create_gig_poster_setlist progression_flag = ($current_progression_flag)
	if screenelementexists \{id = gigboardarrowinterface}
		destroyscreenelement \{id = gigboardarrowinterface}
	endif
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	get_progression_globals <progression_flag>
	formattext checksumname = poster_container_id 'poster_%d' d = <created_gignum>
	extendcrc <poster_container_id> '_songlist' out = songlist_popup
	<poster_container_id> :gettags
	formattext checksumname = tiername 'tier%d' d = <poster_gig_num>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
	formattext checksumname = gignum 'gig%d' d = <poster_gig_num>
	tier_level = ($<tier_global>.<tiername>.level)
	level_poster = ($<tier_global>.<tiername>.poster_texture)
	tier_name = ($levelzones.<tier_level>.title)
	formattext checksumname = gig_posters_setlist_container 'gig_posters_setlist_container_%d' d = <created_gignum>
	destroy_menu menu_id = <gig_posters_setlist_container>
	gigboard_get_exclusive_controller
	getglobaltags <gig_name> savegame = <savegame>
	instrument_texture = icon_gig_band
	switch ($<tier_global>.part)
		case guitar
		instrument_texture = mixer_icon_guitar
		case bass
		instrument_texture = mixer_icon_bass
		case drum
		instrument_texture = mixer_icon_drums
		case vocals
		instrument_texture = mixer_icon_vox
	endswitch
	header_option_text = qs(0x049fdf89)
	my_song_checksum = ($<tier_global>.<tiername>.songs [0])
	song_index = 0
	if (<started> = 1 && (<completed> = 0 || <completed> = -1))
		header_option_text = qs(0x90cd6090)
		getarraysize ($<tier_global>.<tiername>.songs)
		index = 0
		begin
		song = ($<tier_global>.<tiername>.songs [<index>])
		if ($current_progression_flag = career_band)
			if ($is_network_game = 1)
				net_career_get_band_leader_difficulty
			else
				get_band_difficulty
			endif
			format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = <band_difficulty>
		else
			format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
		endif
		progression_song_get_highest_difficulty_completed ($current_progression_flag) song = <song>
		if (<highest_diff_completed> = 'none')
			my_song_checksum = <song>
			song_index = <index>
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
	destroy_menu \{menu_id = gigboardsetlistinterface}
	createscreenelement {
		type = descinterface
		parent = root_window
		id = gigboardsetlistinterface
		desc = 'gig_board_setlist'
		play_gig_text = <header_option_text>
		icon_guitar_64_texture = <instrument_texture>
		z_priority = 20000
		pos = ($gigboard_setlist_props.<level_poster>.offset)
		highlight_rgba = ($gigboard_setlist_props.<level_poster>.highlight_rgba)
		play_gig_rgba = ($gigboard_setlist_props.<level_poster>.songname_rgba)
		icon_instrument_rgba = ($gigboard_setlist_props.<level_poster>.icon_instrument_rgba)
		arrow_up_rgba = ($gigboard_setlist_props.<level_poster>.arrow_rgba)
		arrow_down_rgba = ($gigboard_setlist_props.<level_poster>.arrow_rgba)
		alpha = 0
		arrow_up_texture = name_arrow_up
		arrow_down_texture = name_arrow_dn
		exclusive_device = <controller>
	}
	if gigboardsetlistinterface :desc_resolvealias \{name = alias_gig_setlist_master}
		assignalias id = <resolved_id> alias = gigboard_setlist_menu_master
	endif
	if gigboardsetlistinterface :desc_resolvealias \{name = alias_gig_setlist_content}
		assignalias id = <resolved_id> alias = gigboard_setlist_menu_content
		gigboard_setlist_menu_content :se_setprops {
			exclusive_device = <controller>
			event_handlers = [
				{pad_back gig_posters_setlist_back}
			]
		}
	endif
	if gigboardsetlistinterface :desc_resolvealias \{name = alias_gig_item_play}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_choose gig_posters_choose_next params = {play_entire_gig progression_flag = <progression_flag> song_checksum = <my_song_checksum> song_index = <song_index>}}
				{focus gigposters_setlist_item_focus params = {id = gigboardsetlistinterface level_poster = <level_poster> completed = <completed>}}
				{unfocus gigposters_setlist_item_unfocus params = {id = gigboardsetlistinterface level_poster = <level_poster>}}
			]
		}
	endif
	getarraysize ($<tier_global>.<tiername>.songs)
	pay_to_play = 0
	if structurecontains structure = ($<tier_global>.<tiername>) paytoplay
		pay_to_play = 1
	endif
	if (<array_size> > 0)
		gig_posters_song_focus song = ($<tier_global>.<tiername>.songs [0])
	endif
	if (<pay_to_play> = 1)
		if (<started> = 0)
		endif
	endif
	focusable_flag = {}
	if (<started> != 1)
		<focusable_flag> = {not_focusable}
	endif
	if (<pay_to_play> = 1)
		if (<started> = 0)
			create_gig_band_money_display gig_cost = ($<tier_global>.<tiername>.paytoplay)
			gig_posters_setup_helpers \{setup_paytoplay_helpers}
			<focusable_flag> = {not_focusable}
		endif
	endif
	num_selectable = 0
	num_shown = 0
	song_num = 0
	begin
	song = ($<tier_global>.<tiername>.songs [<song_num>])
	show_song = 1
	icon_alpha = 0
	icon_texture = white
	item_desc = 'gig_board_setlist_item_desc'
	if structurecontains structure = ($<tier_global>.<tiername>) encorep1
		if (<song> = ($<tier_global>.<tiername>.encorep1))
			icon_alpha = 0.6
			icon_texture = icon_gig_encore
			if (<encore_unlocked> = 0)
				show_song = 0
			endif
		endif
	endif
	if structurecontains structure = ($<tier_global>.<tiername>) boss
		if (<song> = ($<tier_global>.<tiername>.boss))
			item_desc = 'gig_board_setlist_itemBoss_desc'
			icon_alpha = 0.6
			if (<song> = bossted)
				icon_texture = icon_gig_nugent
			elseif (<song> = bosszakk)
				icon_texture = icon_gig_wylde
			endif
			if (<boss_unlocked> = 0)
				show_song = 0
			endif
		endif
	endif
	if (<show_song> = 1)
		progression_song_get_highest_difficulty_completed <progression_flag> song = <song>
		switch (<highest_diff_completed>)
			case 'easy_rhythm'
			song_difficulty_texture = icon_difficulty_beginner
			case 'easy'
			song_difficulty_texture = icon_difficulty_easy
			case 'medium'
			song_difficulty_texture = icon_difficulty_medium
			case 'hard'
			song_difficulty_texture = icon_difficulty_hard
			case 'expert'
			song_difficulty_texture = icon_difficulty_expert
			case 'none'
			song_difficulty_texture = icon_difficulty_beginner
			highest_diff_completed = 'easy_rhythm'
		endswitch
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty_text_nl = <highest_diff_completed>
		get_song_title song = <song>
		get_song_artist song = <song>
		getglobaltags <song_checksum> param = stars savegame = <savegame>
		getglobaltags <song_checksum> param = score savegame = <savegame>
		getglobaltags <song_checksum> param = percent100 savegame = <savegame>
		formattext textname = song_score_text qs(0x48c6d14c) d = <score> usecommas
		getrandomvalue \{a = 0
			b = 360
			name = rand_rot1}
		getrandomvalue \{a = 0
			b = 360
			name = rand_rot2}
		getrandomvalue \{a = 0
			b = 360
			name = rand_rot3}
		getrandomvalue \{a = 0
			b = 360
			name = rand_rot4}
		getrandomvalue \{a = 0
			b = 360
			name = rand_rot5}
		<num_selectable> = (<num_selectable> + 1)
		<num_selectable_already_decremented> = false
		focusable_flag = {}
		master_alpha = 1.0
		scores_alpha = 1.0
		defeated_text = qs(0x0b35106b)
		progression_song_get_highest_difficulty_completed ($current_progression_flag) song = <song>
		if (<highest_diff_completed> = 'none')
			scores_alpha = 0.0
			<focusable_flag> = {not_focusable}
			<num_selectable> = (<num_selectable> - 1)
			<num_selectable_already_decremented> = true
			defeated_text = qs(0x9e499be4)
		endif
		if (<completed> = 0)
			<focusable_flag> = {not_focusable}
			if (<num_selectable_already_decremented> = false)
				<num_selectable> = (<num_selectable> - 1)
			endif
		endif
		if structurecontains structure = <focusable_flag> not_focusable
			master_alpha = ($gigboard_setlist_props.<level_poster>.unavailable_alpha)
		endif
		star_texture = song_summary_score_star
		stars_rgba = ($gigboard_setlist_props.<level_poster>.stars_rgba)
		if (<percent100> = 1)
			star_texture = song_complete_star_perfect
			stars_rgba = [255 255 255 255]
		endif
		createscreenelement {
			type = descinterface
			parent = gigboard_setlist_menu_content
			desc = <item_desc>
			gig_poster_list_item_master_alpha = <master_alpha>
			gig_item_defeated_text = <defeated_text>
			gig_item_icon_texture = <icon_texture>
			gig_item_icon_alpha = <icon_alpha>
			gig_item_song_text = <song_title>
			gig_item_artist_text = <song_artist>
			gig_item_score_text = <song_score_text>
			gig_item_difficulty_texture = <song_difficulty_texture>
			gig_star_1_rot_angle = <rand_rot1>
			gig_star_2_rot_angle = <rand_rot2>
			gig_star_3_rot_angle = <rand_rot3>
			gig_star_4_rot_angle = <rand_rot4>
			gig_star_5_rot_angle = <rand_rot5>
			gig_star_1_alpha = <scores_alpha>
			gig_star_2_alpha = <scores_alpha>
			gig_star_3_alpha = <scores_alpha>
			gig_star_4_alpha = <scores_alpha>
			gig_star_5_alpha = <scores_alpha>
			gig_item_score_alpha = <scores_alpha>
			icon_difficulty_alpha = <scores_alpha>
			gig_star_1_texture = <star_texture>
			gig_star_2_texture = <star_texture>
			gig_star_3_texture = <star_texture>
			gig_star_4_texture = <star_texture>
			gig_star_5_texture = <star_texture>
			gig_item_song_rgba = ($gigboard_setlist_props.<level_poster>.songname_rgba)
			gig_item_artist_rgba = ($gigboard_setlist_props.<level_poster>.artistname_rgba)
			gig_item_score_rgba = ($gigboard_setlist_props.<level_poster>.artistname_rgba)
			gig_star_1_rgba = <stars_rgba>
			gig_star_2_rgba = <stars_rgba>
			gig_star_3_rgba = <stars_rgba>
			gig_star_4_rgba = <stars_rgba>
			gig_star_5_rgba = <stars_rgba>
			<focusable_flag>
			event_handlers = [
				{pad_choose gig_posters_choose_next params = {progression_flag = <progression_flag> song_checksum = <song> song_index = <song_num>}}
				{focus gigposters_setlist_item_focus params = {song = <song> level_poster = <level_poster> completed = <completed>}}
				{unfocus gigposters_setlist_item_unfocus params = {song = <song> level_poster = <level_poster>}}
			]
			autosizedims = true
		}
		if (<icon_alpha> = 0)
			<id> :se_setprops gig_item_icon_container_dims = (0.0, 0.0)
		endif
		if <id> :desc_resolvealias name = alias_gig_item_stars
			getscreenelementchildren id = <resolved_id>
			i = 1
			begin
			if (<i> > <stars>)
				destroyscreenelement id = (<children> [(<i> - 1)])
			endif
			i = (<i> + 1)
			repeat 5
		endif
		num_shown = (<num_shown> + 1)
	endif
	<song_num> = (<song_num> + 1)
	repeat <array_size>
	if (<num_shown> > 3 && <num_selectable> > 1)
		gigboardsetlistinterface :se_setprops \{arrow_up_alpha = 1
			arrow_down_alpha = 1}
	endif
	if (<num_selectable> > 1)
		gigboard_setlist_menu_content :se_setprops \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
			]}
	endif
	wait_for_camera_anim
	gigboardsetlistinterface :se_setprops \{alpha = 1}
	launchevent \{type = focus
		target = gigboard_setlist_menu_content}
	gigposters_cycle_song_previews
endscript

script gigposters_setlist_item_focus 
	obj_getid
	if NOT gotparam \{id}
		id = <objid>
	endif
	<id> :se_setprops {
		gig_item_highlight_alpha = 1
		highlight_rgba = ($gigboard_setlist_props.<level_poster>.highlight_rgba)
	}
	if (<id> = gigboardsetlistinterface && (<completed> = 0 || <completed> = -1))
		return
	endif
	if gotparam \{song}
		gig_posters_song_focus song = <song>
	else
		gigposters_cycle_song_previews
	endif
endscript

script gigposters_setlist_item_unfocus 
	obj_getid
	if NOT gotparam \{id}
		id = <objid>
	endif
	<id> :se_setprops {
		gig_item_highlight_alpha = 0
	}
endscript

script gig_posters_song_focus \{song = none}
	setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)}}
	killspawnedscript \{name = gigposters_cycle_song_previews_spawned}
	change \{target_setlist_songpreview = none}
	wait \{2
		gameframes}
	change target_setlist_songpreview = <song>
endscript

script gig_posters_setlist_back 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	wait_for_camera_anim
	ready = 1
	if screenelementexists \{id = gp_selection_menu}
		gp_selection_menu :gettags
	endif
	if (<ready> = 0)
		return
	endif
	if ($menu_gp_stage = 2)
		soundevent \{event = gigboard_select_back}
		soundevent \{event = gig_board_zoom_out}
		launchevent \{type = unfocus
			target = gigboard_setlist_menu_content}
		launchevent \{type = focus
			target = gp_selection_menu}
		formattext checksumname = poster_container_id 'poster_%d' d = ($menu_gp_current_selection)
		if screenelementexists id = <poster_container_id>
			<poster_container_id> :gettags
			get_progression_globals ($current_progression_flag)
			format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
			getglobaltags <gig_name> params = completed savegame = <savegame>
			if (<completed> = 1 || <completed> = 2)
				toggle_gigposter_difficulty_texture diffnum = ($menu_gp_current_selection) fix_for_last_gigs
			endif
		endif
		destroy_gig_band_money_display
		destroy_menu \{menu_id = gigboardsetlistinterface}
		gigposters_camera_out
		gig_posters_unfocus_popup current_selection = ($gig_posters_last_focused_selection) keep_viewport
		gigposters_toggle_with_fire num = ($menu_gp_current_selection) on
		gigposters_cycle_song_previews
		change \{menu_gp_stage = 1}
	elseif ($menu_gp_stage = 3)
		destroy_menu \{menu_id = gigboardvenueselectinterface}
		gig_posters_focus_popup current_selection = ($menu_gp_current_selection) back_from_venue_select
		change \{menu_gp_stage = 2}
	endif
	gig_posters_setup_helpers
	if ($menu_gp_stage = 1)
		update_gigboard_arrows
	endif
	gp_selection_menu :settags \{ready = 1}
endscript
gigposter_creation_numbers = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]

script debug_output_gigposter_creation_numbers 
	getarraysize \{$gigposter_creation_numbers}
	i = 0
	begin
	printf 'gigposter_creation_numbers[%a] = %b' a = <i> b = ($gigposter_creation_numbers [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script reset_gigposter_creation_numbers 
	getarraysize \{$gigposter_creation_numbers}
	i = 0
	begin
	setarrayelement arrayname = gigposter_creation_numbers globalarray index = <i> newvalue = 0
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script setup_gigboard_poster 
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	if NOT gotparam \{poster_gig_num}
		poster_gig_num = ($<unlock_order>.<setnum>.<gignum>.num)
	endif
	gp_selection_menu :settags tier_global = <tier_global>
	if gotparam \{forced_pos}
		index = (<forced_pos> - 1)
	else
		index = (<created_gignum> - 1)
	endif
	setarrayelement arrayname = gigposter_creation_numbers globalarray index = <index> newvalue = <poster_gig_num>
	diffnum = (<index> + 1)
	if (<diffnum> = 18)
		diffnum = 17
		create_small_gig_poster \{num = 18}
	endif
	if (<diffnum> = 19)
		diffnum = 18
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = 18
		getglobaltags <gig_name> savegame = <savegame>
		if (<first_time_unlocked> = 0)
			create_small_gig_poster \{num = 19}
		endif
	endif
	if (<diffnum> < 19)
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
		getglobaltags <gig_name> savegame = <savegame>
		if (<completed> = 1 || <completed> = 2)
			source_texture = difficulty_beginner_icon
			progression_gig_get_highest_difficulty_completed gig = <poster_gig_num>
			if (<highest_diff_completed> = 'easy_rhythm' || <highest_diff_completed> = 'none')
				<highest_diff_completed> = 'beginner'
			endif
			formattext checksumname = source_texture 'difficulty_%s_icon' s = <highest_diff_completed>
			if (<diffnum> > 9)
				formattext checksumname = difftexname 'tex\\zones\\Z_Board_Room\\Gig_Tex_Board_Room_Difficulty_%d.dds' d = <diffnum> addtostringlookup = true
			else
				formattext checksumname = difftexname 'tex\\zones\\Z_Board_Room\\Gig_Tex_Board_Room_Difficulty_0%d.dds' d = <diffnum> addtostringlookup = true
			endif
			if (<first_time_unlocked> = 0)
				toggle_gigposter_difficulty_texture diffnum = <diffnum>
			endif
			stoprendering
			replacetexture {
				src = <source_texture>
				dest_tex_dict_assetname = `zones\z_board_room\z_board_room.tex`
				dest_tex_dict_assetcontext = z_board_room
				dest_tex_dict_texturename = <difftexname>
			}
			startrendering
		endif
		if (<first_time_unlocked> = 1)
			gp_selection_menu :getsingletag \{first_unlocked_selection}
			if (<first_unlocked_selection> = 0)
				gp_selection_menu :settags first_unlocked_selection = <diffnum>
			endif
		else
			create_small_gig_poster num = <diffnum>
		endif
	endif
endscript

script create_gigboard_poster_with_viewport 
	poster_gig_num = ($gigposter_creation_numbers [(<created_gignum> - 1)])
	formattext checksumname = tiername 'tier%d' d = <poster_gig_num>
	formattext checksumname = poster_container_id 'poster_%d' d = <created_gignum>
	if screenelementexists id = <poster_container_id>
		if NOT gotparam \{back_from_venue_select}
			destroy_gig_posters_window created_gignum = <created_gignum>
		endif
	endif
	create_gig_posters_window <...> created_gignum = <created_gignum>
	if gotparam \{back_from_venue_select}
		generic_menu_pad_back_sound
		destroy_menu menu_id = <poster_container_id>
	endif
	createscreenelement {
		type = containerelement
		parent = <window_id>
		id = <poster_container_id>
		just = [left top]
		pos = (0.0, 0.0)
		tags = {
			poster_gig_num = <poster_gig_num>
		}
	}
	gp_selection_menu :gettags
	extendcrc <poster_container_id> '_songlist' out = songlist_popup
	createscreenelement {
		type = spriteelement
		parent = <poster_container_id>
		id = <songlist_popup>
		z_priority = 102
		dims = (1280.0, 720.0)
		texture = ($<tier_global>.<tiername>.poster_texture)
		just = [left top]
	}
	create_gig_poster_setlist <...>
endscript

script create_gig_posters_window \{created_gignum = 1}
	formattext checksumname = viewport_id 'gigposters_viewport_id%d' d = <created_gignum>
	formattext checksumname = viewport_override_id 'gigposters_viewport_override_id%d' d = <created_gignum>
	formattext checksumname = window_id 'gigposters_window_id%d' d = <created_gignum>
	if (<created_gignum> > 9)
		formattext checksumname = texture_id 'tex/zones/Z_Board_Room/Gig_Tex_Board_Room_Large_%d_.dds' d = <created_gignum>
		formattext checksumname = posternamelarge 'Z_Board_Room_G_RM_Gig_poster_%d' d = <created_gignum>
	else
		formattext checksumname = texture_id 'tex/zones/Z_Board_Room/Gig_Tex_Board_Room_Large_0%d_.dds' d = <created_gignum>
		formattext checksumname = posternamelarge 'Z_Board_Room_G_RM_Gig_poster_0%d' d = <created_gignum>
	endif
	if gotparam \{back_from_venue_select}
		if screenelementexists id = <window_id>
			return window_id = <window_id>
		endif
	endif
	destroy_viewport_ui {
		viewport_id = <viewport_id>
		viewport_override_id = <viewport_override_id>
		window_id = <window_id>
	}
	create_viewport_ui {
		viewport_id = <viewport_id>
		viewport_override_id = <viewport_override_id>
		window_id = <window_id>
		texture = <texture_id>
		texdict = `zones\z_board_room\z_board_room.tex`
		keep_current_level
	}
	safecreate nodename = <posternamelarge>
	return window_id = <window_id>
endscript

script destroy_gig_posters_window \{created_gignum = 1}
	formattext checksumname = viewport_id 'gigposters_viewport_id%d' d = <created_gignum>
	formattext checksumname = viewport_override_id 'gigposters_viewport_override_id%d' d = <created_gignum>
	formattext checksumname = window_id 'gigposters_window_id%d' d = <created_gignum>
	destroy_viewport_ui {
		viewport_id = <viewport_id>
		viewport_override_id = <viewport_override_id>
		window_id = <window_id>
	}
	if (<created_gignum> > 9)
		formattext checksumname = posternamelarge 'Z_Board_Room_G_RM_Gig_poster_%d' d = <created_gignum>
	else
		formattext checksumname = posternamelarge 'Z_Board_Room_G_RM_Gig_poster_0%d' d = <created_gignum>
	endif
	safekill nodename = <posternamelarge>
endscript

script debug_complete_gig_cheat 
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	poster_gig_num = ($gigposter_creation_numbers [($menu_gp_current_selection - 1)])
	formattext checksumname = tier 'tier%d' d = <poster_gig_num>
	if structurecontains structure = ($<tier_global>.<tier>) createagig
		return
	endif
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
	getglobaltags <gig_name> params = completed savegame = <savegame>
	if (<completed> = 0)
		setglobaltags <gig_name> params = {completed = 1} all_active_players = 1
		change \{allow_career_progression_check = 1}
	elseif (<completed> = -1)
		setglobaltags <gig_name> params = {completed = 2} all_active_players = 1
	endif
	setglobaltags <gig_name> params = {encore_unlocked = 1 boss_unlocked = 1 started = 1} all_active_players = 1
	progression_career_gig_complete <...> (<progression_flag>)
	getplayerinfo \{1
		difficulty}
	formattext checksumname = tiername 'tier%d' d = <poster_gig_num>
	getarraysize ($<tier_global>.<tiername>.songs)
	song_index = 0
	printstruct <...>
	begin
	format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tiername>.songs [<song_index>])
	setglobaltags <song_checksum> params = {score = 149457 stars = 5 unlocked = 1} all_active_players = 1
	song_index = (<song_index> + 1)
	repeat <array_size>
	if structurecontains structure = ($<tier_global>.<tiername>) level
		formattext {
			checksumname = venue_checksum
			'%s_%i'
			s = ($levelzones.($<tier_global>.<tiername>.level).name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			addtostringlookup = true
		}
		setglobaltags <venue_checksum> params = {unlocked = 1} all_active_players = 1
	endif
	ui_event \{event = menu_refresh}
endscript

script isgigunlocked 
	gig = ($<unlock_order>.<set>.<gig>.name)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
	getglobaltags <gig_name> savegame = <savegame>
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{false}
endscript

script gigposters_toggle_with_fire 
	if (<num> > 9)
		formattext checksumname = postername 'Z_Board_Room_G_RM_Gig_poster_small_%d' d = <num>
		formattext checksumname = fire 'Z_Board_Room_poster_Fire_%d' d = <num>
		formattext checksumname = posterfire 'Z_Board_Room_G_RM_Gig_%d_Fire' d = <num>
	else
		formattext checksumname = postername 'Z_Board_Room_G_RM_Gig_poster_small_0%d' d = <num>
		formattext checksumname = fire 'Z_Board_Room_poster_Fire_0%d' d = <num>
		formattext checksumname = posterfire 'Z_Board_Room_G_RM_Gig_0%d_Fire' d = <num>
	endif
	if (<num> > 9)
		formattext checksumname = glowlines 'Z_Board_Room_G_RM_Glowlines_%d' d = <num>
		formattext checksumname = glowball 'Z_Board_Room_G_RM_Glowball_%d' d = <num> addtostringlookup = true
	else
		formattext checksumname = glowlines 'Z_Board_Room_G_RM_Glowlines_0%d' d = <num>
		formattext checksumname = glowball 'Z_Board_Room_G_RM_Glowball_0%d' d = <num> addtostringlookup = true
	endif
	if gotparam \{on}
		if NOT gotparam \{poster_only}
			safecreate nodename = <fire>
			safecreate nodename = <glowball>
			if NOT gotparam \{no_poster_fire}
				safecreate nodename = <glowlines>
				safecreate nodename = <posterfire>
			endif
		endif
		safekill nodename = <postername>
	elseif gotparam \{off}
		if NOT gotparam \{poster_only}
			safekill nodename = <fire>
			safekill nodename = <glowlines>
			safekill nodename = <glowball>
			safekill nodename = <posterfire>
		endif
		if NOT gotparam \{focused}
			safecreate nodename = <postername>
		endif
	endif
endscript

script show_setlist_on_gigboard progression_flag = ($current_progression_flag)
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	get_progression_globals <progression_flag>
	poster_gig_num = ($gigposter_creation_numbers [(<created_gignum> - 1)])
	formattext checksumname = tiername 'tier%d' d = <poster_gig_num>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
	if structurecontains structure = ($<tier_global>.<tiername>) level
		tier_level = ($<tier_global>.<tiername>.level)
		tier_name = ($levelzones.<tier_level>.title)
	else
		tier_name = qs(0x03ac90f0)
	endif
	level_poster = ($<tier_global>.<tiername>.poster_texture)
	formattext checksumname = viewport_id 'setlist_viewport_id%d' d = <created_gignum>
	formattext checksumname = viewport_override_id 'setlist_viewport_override_id%d' d = <created_gignum>
	formattext checksumname = window_id 'setlist_window_id%d' d = <created_gignum>
	get_gigboard_section
	if (<section> = 1)
		texture_id = `tex/zones/z_board_room/rm_board_room_setlist.dds`
	elseif (<section> = 5)
		texture_id = `tex/zones/z_board_room/rm_board_room_setlist05.dds`
	else
		formattext checksumname = texture_id 'tex/zones/Z_Board_Room/RM_Board_Room_setlist0%d.dds' d = (<section> - 1)
	endif
	destroy_gig_band_money_display
	create_viewport_ui {
		viewport_id = <viewport_id>
		viewport_override_id = <viewport_override_id>
		window_id = <window_id>
		texture = <texture_id>
		texdict = `zones\z_board_room\z_board_room.tex`
		keep_current_level
	}
	pos_offset = (-512.0, 64.0)
	if (<section> = 1)
		pos_offset = (-512.0, 128.0)
	endif
	instrument_texture = mixer_icon_crowd
	wanted_text = qs(0xdd90f869)
	switch ($<tier_global>.part)
		case guitar
		instrument_texture = mixer_icon_guitar
		wanted_text = qs(0x890e464a)
		case bass
		instrument_texture = mixer_icon_bass
		wanted_text = qs(0xa1983b50)
		case drum
		instrument_texture = mixer_icon_drums
		wanted_text = qs(0xedb4407e)
		case vocals
		instrument_texture = mixer_icon_vox
		wanted_text = qs(0x1ade89f5)
	endswitch
	if (<poster_gig_num> = 13)
		scale = (1.7, 0.98499995)
	else
		scale = (1.7, 1.0)
	endif
	createscreenelement {
		type = descinterface
		parent = <window_id>
		id = gigboardsetlistinterfaceb
		desc = 'gig_board_setlistB'
		gig_board_head_bg_texture = ($gigboard_setlist_props.<level_poster>.header_texture)
		gig_board_heading_rgba = [255 200 175 255]
		gig_board_heading_text = ($gigboard_setlist_props.<level_poster>.header_text)
		pos = <pos_offset>
		container_scale = <scale>
		gig_board_wanted_text = <wanted_text>
		gig_board_venue_text = <tier_name>
		gig_board_instrument_icon_texture = <instrument_texture>
	}
	if gigboardsetlistinterfaceb :desc_resolvealias \{name = alias_gig_board_songlist_stack}
		assignalias id = <resolved_id> alias = gigboard_songlist_menu
	endif
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
	getglobaltags <gig_name> savegame = <savegame>
	if structurecontains structure = ($<tier_global>.<tiername>) createagig
		createscreenelement \{type = descinterface
			parent = gigboard_songlist_menu
			desc = 'gig_board_setlistB_item'
			autosizedims = true
			gig_item_song_text = qs(0xb5c20682)}
	else
		song_index = 0
		getarraysize ($<tier_global>.<tiername>.songs)
		song_size = <array_size>
		encore_song = none
		if structurecontains structure = ($<tier_global>.<tiername>) encorep1
			encore_song = ($<tier_global>.<tiername>.encorep1)
		endif
		boss_song = none
		if structurecontains structure = ($<tier_global>.<tiername>) boss
			boss_song = ($<tier_global>.<tiername>.boss)
		endif
		begin
		song = ($<tier_global>.<tiername>.songs [<song_index>])
		show_song = 1
		if (<song> = <encore_song>)
			if (<encore_unlocked> = 0)
				<show_song> = 0
			endif
		endif
		if (<song> = <boss_song>)
			if (<boss_unlocked> = 0)
				<show_song> = 0
			endif
		endif
		if (<show_song> = 1)
			get_song_title song = <song>
			createscreenelement {
				type = descinterface
				parent = gigboard_songlist_menu
				desc = 'gig_board_setlistB_item'
				autosizedims = true
				gig_item_song_text = <song_title>
			}
			diff_index = 0
			begin
			format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty_index = <diff_index>
			getglobaltags <song_checksum> params = stars savegame = <savegame>
			if (<stars> > 2)
				<id> :se_setprops desc = 'gig_board_setlistB_item_complete' gig_item_song_text = <song_title>
				break
			endif
			diff_index = (<diff_index> + 1)
			repeat 5
		endif
		<song_index> = (<song_index> + 1)
		repeat <song_size>
	endif
endscript

script get_gigboard_section num = ($menu_gp_current_selection)
	section = 5
	if (<num> < 5)
		section = 1
	elseif (<num> < 10)
		section = 2
	elseif (<num> < 14)
		section = 3
	elseif (<num> < 18)
		section = 4
	endif
	return section = <section>
endscript

script destroy_gigboard_setlist_viewport 
	formattext checksumname = viewport_id 'setlist_viewport_id%d' d = <created_gignum>
	formattext checksumname = viewport_override_id 'setlist_viewport_override_id%d' d = <created_gignum>
	formattext checksumname = window_id 'setlist_window_id%d' d = <created_gignum>
	destroy_viewport_ui {
		viewport_id = <viewport_id>
		viewport_override_id = <viewport_override_id>
		window_id = <window_id>
	}
endscript

script gigposters_cycle_song_previews 
	setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)}}
	killspawnedscript \{name = gigposters_cycle_song_previews_spawned}
	change \{target_setlist_songpreview = none}
	wait \{2
		gameframes}
	spawnscriptnow gigposters_cycle_song_previews_spawned params = {<...>}
endscript

script gigposters_cycle_song_previews_spawned 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gignum = ($gigposter_creation_numbers [($menu_gp_current_selection - 1)])
	get_progression_globals ($current_progression_flag)
	formattext checksumname = tiername 'tier%d' d = <gignum>
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gignum>
	getglobaltags <gig_name> savegame = <savegame>
	encore_song = none
	if structurecontains structure = ($<tier_global>.<tiername>) encorep1
		encore_song = ($<tier_global>.<tiername>.encorep1)
	endif
	boss_song = none
	if structurecontains structure = ($<tier_global>.<tiername>) boss
		boss_song = ($<tier_global>.<tiername>.boss)
	endif
	if structurecontains structure = ($<tier_global>.<tiername>) specialevent
		return
	endif
	if structurecontains structure = ($<tier_global>.<tiername>) createagig
		return
	endif
	getarraysize ($<tier_global>.<tiername>.songs)
	begin
	song_index = 0
	begin
	setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)}}
	song = ($<tier_global>.<tiername>.songs [<song_index>])
	play_song_preview = 1
	if (<song> = <encore_song>)
		if (<encore_unlocked> = 0)
			<play_song_preview> = 0
		endif
	endif
	if (<song> = <boss_song>)
		if (<boss_unlocked> = 0)
			<play_song_preview> = 0
		endif
	endif
	if (<play_song_preview> = 1)
		change target_setlist_songpreview = <song>
		wait \{7
			seconds}
		setsoundbussparams {music_setlist = {vol = (($default_bussset.music_setlist.vol) - 100)} time = 1.0}
		wait \{1.1
			seconds}
	endif
	<song_index> = (<song_index> + 1)
	setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)}}
	repeat <array_size>
	repeat
endscript

script toggle_gigposter_difficulty_texture \{diffnum = 1}
	if gotparam \{fix_for_last_gigs}
		if (<diffnum> = 18)
			diffnum = 17
		endif
		if (<diffnum> = 19)
			diffnum = 18
		endif
	endif
	if (<diffnum> > 9)
		formattext checksumname = diffname 'Z_Board_Room_G_RM_Gig_Difficulty_%d' d = <diffnum>
	else
		formattext checksumname = diffname 'Z_Board_Room_G_RM_Gig_Difficulty_0%d' d = <diffnum>
	endif
	if gotparam \{off}
		safekill nodename = <diffname>
	else
		safecreate nodename = <diffname>
	endif
endscript

script debug_yuk \{gignum = 1
		diff = easy
		part = guitar}
	progression_flag = career_band
	if (<part> = guitar)
		progression_flag = career_guitar
	elseif (<part> = drum)
		progression_flag = career_drum
	elseif (<part> = bass)
		progression_flag = career_bass
	elseif (<part> = vocals)
		progression_flag = career_vocals
	endif
	if (<progression_flag> = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	get_progression_globals <progression_flag>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gignum>
	getglobaltags <gig_name> savegame = <savegame>
	printstruct <...>
	formattext checksumname = tiername 'tier%d' d = <gignum>
	getarraysize ($<tier_global>.<tiername>.songs)
	i = 0
	begin
	format_globaltag_song_checksum part = <part> song = ($<tier_global>.<tiername>.songs [<i>]) difficulty = <diff>
	getglobaltags <song_checksum> savegame = <savegame>
	printstruct <...>
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script debug_gig_start 
	if ((cd) || ($enable_button_cheats = 0))
		return
	endif
	get_progression_globals <progression_flag>
	change \{menu_gp_stage = 3}
	i = 0
	begin
	formattext checksumname = tier 'tier%d' d = (<i> + 1)
	if structurecontains structure = ($<tier_global>.<tier>) debug_gig
		gig_num = (<i> + 1)
		create_loading_screen
		if (($is_network_game = 1) && (ishost))
			sendstructure callback = net_gig_posters_choose_next data_to_send = {gig_num = <gig_num> progression_flag = <progression_flag>}
			ui_event \{event = menu_back
				data = {
					gig_selected
				}}
		else
			generic_event_choose state = uistate_play_song data = {<...>}
		endif
		return
	endif
	i = (<i> + 1)
	repeat ($<tier_global>.num_tiers)
endscript

script gigboard_continue_to_paytoplay 
	if gotparam \{deduct_funds}
		soundevent \{event = menu_purchase_item}
		get_savegame_from_controller controller = ($primary_controller)
		decrease_band_money price = <paytoplay_price> savegame = <savegame>
		destroy_popup_warning_menu
		setglobaltags <gig_name> params = {started = 1} all_active_players = 1
		getarraysize ($<tier_global>.<tiernum>.songs)
		i = 0
		begin
		setglobaltags ($<tier_global>.<tiernum>.songs [<i>]) all_active_players = 1 params = {unlocked = 1}
		i = (<i> + 1)
		repeat <array_size>
		level_checksum = ($<tier_global>.<tiernum>.level)
		formattext {
			checksumname = venue_checksum
			'%s_%i'
			s = ($levelzones.<level_checksum>.name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			addtostringlookup = true
		}
		setglobaltags <venue_checksum> params = {unlocked = 1} all_active_players = 1
		formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name)
		setglobaltags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
	endif
	if (($is_network_game = 1) && (ishost))
		sendstructure {callback = net_gig_posters_choose_next data_to_send = {
				gig_num = <gig_num> progression_flag = <progression_flag> song_checksum = <song_checksum> song_index = <song_index> single_song = <single_song>
			}
		}
		net_gig_posters_choose_next {
			gig_num = <gig_num> progression_flag = <progression_flag> song_checksum = <song_checksum> song_index = <song_index> single_song = <single_song>
		}
		destroy_gig_posters_menu \{destroy_ui_only}
		frontend_load_soundcheck \{loadingscreen
			gigboard}
		ui_event \{event = menu_back}
	else
		generic_event_choose state = uistate_play_song data = {<...>}
	endif
endscript

script gigboard_cancel_paytoplay 
	generic_menu_pad_back_sound
	destroy_popup_warning_menu
	if screenelementexists \{id = gigboard_setlist_menu_content}
		launchevent \{type = focus
			target = gigboard_setlist_menu_content}
	endif
	gp_selection_menu :settags \{ready = 1}
	gig_posters_setup_helpers <...>
endscript

script get_songs_available_for_create_a_setlist progression_flag = ($current_progression_flag)
	get_progression_globals <progression_flag>
	num_tiers = ($<tier_global>.num_tiers)
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	unlocked_songs_array = []
	num_songs_available = 0
	gig = 1
	begin
	formattext checksumname = tier 'tier%d' d = <gig>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig>
	getglobaltags <gig_name> savegame = <savegame>
	if (<completed> > 0)
		getarraysize ($<tier_global>.<tier>.songs)
		song_index = 0
		begin
		song = ($<tier_global>.<tier>.songs [<song_index>])
		get_song_allowed_in_quickplay song = <song>
		if (<allowed_in_quickplay> = 1)
			printf 'adding song = %d' d = <song>
			addarrayelement array = <unlocked_songs_array> element = <song>
			<unlocked_songs_array> = <array>
			num_songs_available = (<num_songs_available> + 1)
		endif
		song_index = (<song_index> + 1)
		repeat <array_size>
	endif
	gig = (<gig> + 1)
	repeat <num_tiers>
	getarraysize \{$gh4_download_songlist}
	num_songs_available = (<num_songs_available> + <array_size>)
	i = 0
	getarraysize <unlocked_songs_array>
	if (<array_size> > 0)
		begin
		printf '%d' d = (<unlocked_songs_array> [<i>])
		i = (<i> + 1)
		repeat <array_size>
	endif
	printf 'num_songs_available = %d' d = <num_songs_available>
	return num_songs_available = <num_songs_available> unlocked_songs_array = <unlocked_songs_array>
endscript

script create_gig_band_money_display \{gig_cost = 0}
	destroy_gig_band_money_display
	pushassetcontext \{context = ui_board_room}
	createscreenelement \{parent = gp_selection_menu
		type = descinterface
		id = gig_band_money_id
		desc = 'gig_pay2play'
		z_priority = 50000}
	popassetcontext \{context = ui_board_room}
	refresh_gig_band_money_display gig_cost = <gig_cost>
endscript

script destroy_gig_band_money_display 
	if screenelementexists \{id = gig_band_money_id}
		destroyscreenelement \{id = gig_band_money_id}
	endif
endscript

script refresh_gig_band_money_display 
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	get_current_band_info
	getglobaltags <band_info> savegame = <savegame>
	formattext textname = cash_text qs(0xf1d3969e) i = <cash>
	formattext textname = gig_cost_text qs(0xf1d3969e) i = <gig_cost>
	if screenelementexists \{id = gig_band_money_id}
		setscreenelementprops {
			id = gig_band_money_id
			cash_available_value_text = <cash_text>
			gig_cost_money_text = <gig_cost_text>
		}
	endif
endscript

script kill_all_posters 
	poster_name_num = 1
	begin
	if (<poster_name_num> > 9)
		formattext checksumname = postername 'Z_Board_Room_G_RM_Gig_poster_%d' d = <poster_name_num>
		formattext checksumname = smallposter 'Z_Board_Room_G_RM_Gig_poster_small_%d' d = <poster_name_num>
		formattext checksumname = diffname 'Z_Board_Room_G_RM_Gig_Difficulty_%d' d = <poster_name_num>
	else
		formattext checksumname = postername 'Z_Board_Room_G_RM_Gig_poster_0%d' d = <poster_name_num>
		formattext checksumname = smallposter 'Z_Board_Room_G_RM_Gig_poster_small_0%d' d = <poster_name_num>
		formattext checksumname = diffname 'Z_Board_Room_G_RM_Gig_Difficulty_0%d' d = <poster_name_num>
	endif
	safekill nodename = <postername>
	if NOT gotparam \{no_diff}
		safekill nodename = <diffname>
	endif
	gigposters_toggle_with_fire num = <poster_name_num> off
	safekill nodename = <smallposter>
	<poster_name_num> = (<poster_name_num> + 1)
	repeat 23
endscript

script search_for_tool_in_gig 
	get_progression_globals ($current_progression_flag)
	formattext \{checksumname = tiernum
		'tier%d'
		d = $menu_gp_last_gignum}
	getarraysize ($<tier_global>.<tiernum>.songs)
	if (<array_size> > 0)
		song_index = 0
		begin
		song = ($<tier_global>.<tiernum>.songs [<song_index>])
		if (<song> = parabola || <song> = schism || <song> = vicarious)
			return \{true}
		endif
		song_index = (<song_index> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script get_gigposter_pos_in_2d 
	pos_1 = (505.0, 191.0)
	pos_2 = (492.0, 418.0)
	pos_3 = (670.0, 572.0)
	pos_4 = (851.0, 615.0)
	pos_5 = (424.0, 164.0)
	pos_6 = (470.0, 333.0)
	pos_7 = (544.0, 482.0)
	pos_8 = (688.0, 499.0)
	pos_9 = (879.0, 515.0)
	pos_10 = (317.0, 198.0)
	pos_11 = (370.0, 433.0)
	pos_12 = (548.0, 579.0)
	pos_13 = (741.0, 541.0)
	pos_14 = (261.0, 209.0)
	pos_15 = (318.0, 399.0)
	pos_16 = (397.0, 577.0)
	pos_17 = (519.0, 570.0)
	pos_18 = (488.0, 300.0)
	pos_19 = (512.0, 581.0)
	pos_20 = (640.0, 360.0)
	formattext checksumname = pos 'pos_%d' d = <num>
	return gig_pos_2d = (<...>.<pos>)
endscript

script gig_do_hand_animation 
	get_progression_globals ($current_progression_flag)
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	getarraysize ($gigposter_creation_numbers)
	num = 1
	begin
	poster_gig_num = ($gigposter_creation_numbers [(<num> -1)])
	if (<poster_gig_num> != 0)
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
		getglobaltags <gig_name> params = first_time_unlocked savegame = <savegame>
		if (<first_time_unlocked> = 1)
			wait_and_do_gigboard_hand_animation <...>
		endif
	endif
	num = (<num> + 1)
	repeat <array_size>
	index = 0
	found_next_gig = 0
	begin
	gig_number = ($gigposter_creation_numbers [<index>])
	if (<gig_number> != 0)
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_number>
		getglobaltags <gig_name> params = completed savegame = <savegame>
		if (<completed> = 0 || <completed> = -1)
			formattext checksumname = tiername 'tier%d' d = <gig_number>
			contains_createagig = 0
			if structurecontains structure = ($<tier_global>.<tiername>) createagig
				contains_createagig = 1
			endif
			if ($is_network_game = 0 || <contains_createagig> = 0)
				gig_posters_unfocus_popup current_selection = ($menu_gp_current_selection)
				change menu_gp_current_selection = (<index> + 1)
				gig_posters_move_selection \{no_poster_fire}
				found_next_gig = 1
				break
			endif
		endif
	endif
	index = (<index> + 1)
	repeat 19
endscript

script wait_and_do_gigboard_hand_animation 
	gig_posters_unfocus_popup current_selection = ($menu_gp_current_selection)
	change menu_gp_current_selection = <num>
	gig_posters_move_selection \{no_poster_fire}
	if (<poster_gig_num> = 13)
		create_small_gig_poster num = <num>
		wait \{2.5
			seconds}
	else
		get_gigposter_pos_in_2d num = <num>
		soundevent \{event = gigboard_gig_unlock}
		ui_create_handslapper pos = <gig_pos_2d> callback = {create_small_gig_poster params = {num = <num>}}
	endif
	if gotparam \{gig_name}
		setglobaltags <gig_name> params = {first_time_unlocked = 0} all_active_players = 1
	endif
	begin
	if NOT scriptisrunning \{anim_handslapper}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if gotparam \{gig_name}
		getglobaltags <gig_name> param = completed
		if (<completed> = 1)
			toggle_gigposter_difficulty_texture diffnum = ($menu_gp_current_selection) fix_for_last_gigs
		endif
	endif
endscript

script get_gigposter_camera_name \{num = 1}
	switch ($current_progression_flag)
		case career_guitar
		formattext textname = gigposter_camera 'gigposters_guitar_%a' a = <num>
		case career_bass
		formattext textname = gigposter_camera 'gigposters_bass_%a' a = <num>
		case career_drum
		formattext textname = gigposter_camera 'gigposters_drum_%a' a = <num>
		case career_vocals
		formattext textname = gigposter_camera 'gigposters_vocals_%a' a = <num>
		case career_band
		formattext textname = gigposter_camera 'gigposters_band_%a' a = <num>
		default
		formattext textname = gigposter_camera 'gigposters_guitar_%a' a = <num>
	endswitch
	return gigposter_camera = <gigposter_camera>
endscript

script get_gigposter_camera_name_section \{num = 1}
	switch ($current_progression_flag)
		case career_guitar
		formattext textname = gigposter_camera 'gigposters_guitar_0_%a' a = <num>
		case career_bass
		formattext textname = gigposter_camera 'gigposters_bass_0_%a' a = <num>
		case career_drum
		formattext textname = gigposter_camera 'gigposters_drum_0_%a' a = <num>
		case career_vocals
		formattext textname = gigposter_camera 'gigposters_vocals_0_%a' a = <num>
		case career_band
		formattext textname = gigposter_camera 'gigposters_band_0_%a' a = <num>
		default
		formattext textname = gigposter_camera 'gigposters_guitar_0_%a' a = <num>
	endswitch
	return gigposter_camera = <gigposter_camera>
endscript

script replace_texture_on_gig_posters progression_flag = ($current_progression_flag)
	stoprendering
	get_progression_globals (<progression_flag>)
	gig_num = 1
	begin
	poster_gig_num = ($gigposter_creation_numbers [(<gig_num> - 1)])
	formattext checksumname = tiername 'tier%d' d = <poster_gig_num>
	if structurecontains structure = ($<tier_global>) <tiername>
		if structurecontains structure = ($<tier_global>.<tiername>) poster_texture
			poster_texture = ($<tier_global>.<tiername>.poster_texture)
			extendcrc <poster_texture> '_small' out = source_texture
			printf 'source_texture = %d' d = <source_texture>
			if (<gig_num> > 9)
				formattext checksumname = difftexname 'tex\\zones\\Z_Board_Room\\Gig_poster_small_%d.dds' d = <gig_num> addtostringlookup = true
			else
				formattext checksumname = difftexname 'tex\\zones\\Z_Board_Room\\Gig_poster_small_0%d.dds' d = <gig_num> addtostringlookup = true
			endif
			replacetexture {
				src = <source_texture>
				dest_tex_dict_assetname = `zones\z_board_room\z_board_room.tex`
				dest_tex_dict_assetcontext = z_board_room
				dest_tex_dict_texturename = <difftexname>
			}
		endif
	endif
	gig_num = (<gig_num> + 1)
	repeat 19
	startrendering
endscript

script create_small_gig_poster \{num = 1}
	printf 'create_small_gig_poster - %d' d = <num>
	if (<num> > 9)
		formattext checksumname = postername 'Z_Board_Room_G_RM_Gig_poster_small_%d' d = <num>
	else
		formattext checksumname = postername 'Z_Board_Room_G_RM_Gig_poster_small_0%d' d = <num>
	endif
	safecreate nodename = <postername>
endscript

script gigboard_get_exclusive_controller controller = ($primary_controller)
	if ($is_network_game = 1)
		array = []
		addarrayelement array = <array> element = (<controller>)
		controller = <array>
	else
		switch ($game_mode)
			case p2_career
			case p3_career
			case p4_career
			controller = $band_mode_current_leader
			default
			controller = ($player1_status.controller)
			if (($player1_status.controller) > 3)
				controller = ($primary_controller)
			endif
		endswitch
	endif
	return controller = <controller>
endscript
