current_gig_number = 1
current_progression_flag = None
menu_gp_current_selection = 1
menu_gp_stage = 1
menu_gp_last_gignum = 1
should_reset_gig_posters_selection = 0
0x942e23ff = 0

script gig_posters_choose_next 

	SetSpawnInstanceLimits \{Max = 1
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
	if ScreenElementExists \{id = gp_selection_menu}
		gp_selection_menu :GetTags
	endif
	if (<ready> = 0)
		return
	endif
	if ($menu_gp_stage = 0)
		return
	endif
	if ($menu_gp_stage != 1)
		if NOT GotParam \{song_checksum}
			return
		endif
	endif
	if ScreenElementExists \{id = gp_selection_menu}
		gp_selection_menu :SetTags \{ready = 0}
	endif
	if ((($is_network_game = 1) && (IsHost)) || ($is_network_game = 0))
		gig_num = ($gigposter_creation_numbers [($menu_gp_current_selection - 1)])
		Change current_gig_number = <gig_num>
		Change menu_gp_last_gignum = <gig_num>
		Change current_progression_flag = <progression_flag>
		started = 0
		is_special_event = 0
		is_paytoplay = 0
		get_progression_globals <progression_flag>
		formatText \{checksumName = tiernum
			'tier%d'
			d = $menu_gp_last_gignum}
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = $menu_gp_last_gignum
		if StructureContains structure = ($<tier_global>.<tiernum>) specialevent
			<is_special_event> = 1
		endif
		if StructureContains structure = ($<tier_global>.<tiernum>) paytoplay
			<is_paytoplay> = 1
		endif
		if StructureContains structure = ($<tier_global>.<tiernum>) createagig
			SetGlobalTags \{Progression
				params = {
					career_using_createagig = 1
				}
				all_active_players = 1}
			generic_event_choose state = uistate_setlist data = {<...> createagig no_jamsession keep_current_level next_state = uistate_select_venue}
			return
		endif
		if GotParam \{song_checksum}
			Change current_song = <song_checksum>
		else
			Change current_song = ($<tier_global>.<tiernum>.songs [0])
			song_checksum = $current_song
			song_index = 0
		endif
		if ($current_progression_flag = career_band && $is_network_game = 0)
			getsavegamefromcontroller controller = ($band_mode_current_leader)
		else
			getsavegamefromcontroller controller = ($primary_controller)
		endif
		GetGlobalTags <gig_name> savegame = <savegame>
		if ($menu_gp_stage = 1)
			SoundEvent \{event = gigboard_select}
			SoundEvent \{event = gig_board_zoom_in}
			get_gigposter_camera_name num = ($menu_gp_current_selection)
			Change target_menu_camera = <gigposter_camera>
			gig_posters_focus_popup current_selection = ($menu_gp_current_selection)
			Change \{menu_gp_stage = 2}
			LaunchEvent \{Type = unfocus
				target = gp_selection_menu}
			if ScreenElementExists \{id = gp_selection_menu}
				gp_selection_menu :SetTags \{ready = 1}
			endif
			return
		endif
		single_song = 0
		SetGlobalTags \{Progression
			params = {
				career_play_song_and_end = 0
			}
			all_active_players = 1}
		if (<completed> = 1 || <completed> = 2)
			if NOT GotParam \{play_entire_gig}
				single_song = 1
				SetGlobalTags \{Progression
					params = {
						career_play_song_and_end = 1
					}
					all_active_players = 1}
			endif
		else
			if GotParam \{play_entire_gig}
				if (<is_paytoplay> = 1)
					if (<started> = 1)
						SoundEvent \{event = song_affirmation}
					endif
				else
					SoundEvent \{event = song_affirmation}
				endif
			endif
		endif
		if ($menu_gp_stage = 2)
			if NOT search_for_tool_in_gig \{gig = $menu_gp_last_gignum}
				if (<completed> = 1 || <completed> = 2)
					Change \{menu_gp_stage = 3}
					LaunchEvent \{Type = unfocus
						target = gigboard_setlist_menu_content}
					generic_menu_pad_choose_sound
					if ($is_network_game = 0)
						destroy_menu \{menu_id = gigboardsetlistinterface}
						create_gig_poster_venue_select poster_gig_num = <gig_num> song_checksum = <song_checksum> song_index = <song_index>
					else
						SendStructure {callback = net_gig_posters_choose_next data_to_send = {
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
			if NOT GotParam \{challenge_num}
				if ($current_progression_flag = career_band)
					generic_event_choose state = uistate_band_difficulty data = {continue_data = {state = uistate_special_events <...> specialevent_num = ($<tier_global>.<tiernum>.specialevent)}}
					return
				endif
				ui_event event = menu_change data = {state = uistate_special_events <...> specialevent_num = ($<tier_global>.<tiernum>.specialevent)}
			else
				getplayerinfo \{1
					part}
				formatText checksumName = special_event_num 'special_event%d' d = ($<tier_global>.<tiernum>.specialevent)
				formatText checksumName = challenge 'challenge%d' d = <challenge_num>
				formatText checksumName = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
				if StructureContains structure = ($special_events_challenges.<special_event_num>.<challenge>) Name
					Change \{special_event_stage = 1}
					Change current_special_event = ($special_events_challenges.<special_event_num>.<challenge>.Name)
					Change current_special_event_num = ($<tier_global>.<tiernum>.specialevent)
					Change current_special_event_challenge_num = <challenge_num>
					getspecialeventtimer
					Change total_special_event_time = <time>
					load_songpak = 0
					if ($current_special_event_num = 1 || $current_special_event_num = 2)
						reset_current_special_event_percentages
						Change current_song = ($special_events_challenges.<special_event_num>.<challenge>.<songs_ar> [$special_event_song_index].song)
						<load_songpak> = 1
					endif
					if (<load_songpak> = 1)
						destroy_band
						unload_songqpak
						load_songqpak song_name = ($current_song) async = 0
						set_song_section_array \{Player = 1}
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
				GetGlobalTags <band_info> savegame = <savegame>
				paytoplay_price = ($<tier_global>.<tiernum>.paytoplay)
				LaunchEvent \{Type = unfocus
					target = gigboard_setlist_menu_content}
				if ScreenElementExists \{id = gigboardarrowinterface}
					DestroyScreenElement \{id = gigboardarrowinterface}
				endif
				if (<cash> >= <paytoplay_price>)
					generic_menu_pad_choose_sound
					0xc337ea4c
					formatText TextName = areyousuretext qs(0x48959918) d = <paytoplay_price>
					create_popup_warning_menu {
						textblock = {
							text = <areyousuretext>
							dims = (600.0, 400.0)
							Scale = 0.6
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
					SoundEvent \{event = ui_sfx_negative_select}
					create_popup_warning_menu {
						textblock = {
							text = qs(0x531362be)
							dims = (600.0, 400.0)
							Scale = 0.6
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
				if (($is_network_game = 1) && (IsHost))
					SendStructure {callback = net_gig_posters_choose_next data_to_send = {
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


	Change menu_gp_current_selection = <gig_num>
	Change current_gig_number = <gig_num>
	Change current_progression_flag = <progression_flag>
	Change current_song = <song_checksum>
	Change net_career_song_index = <song_index>
	SetGlobalTags Progression params = {career_play_song_and_end = <single_song>}
	if ScreenElementExists \{id = band_mode_menu}
		band_mode_menu :SetTags \{net_gig_ready = 1}
		update_network_ticker \{msg_checksum = gig_selected}
	endif
	Change net_career_selected_song = <song_checksum>
	Change net_career_selected_gig = <gig_num>
endscript

script create_gig_posters_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		mark_safe_for_shutdown
		return
	endif
	loadvenuevideo \{pn = z_soundcheck}
	Change \{rich_presence_context = presence_gigboard_and_setlist}
	SetGlobalTags \{Progression
		params = {
			career_using_createagig = 0
		}
		all_active_players = 1}
	Change \{quickplay_song_list_current = -1}
	reset_gigposter_creation_numbers
	if ($should_reset_gig_posters_selection = 1)
		Change \{menu_gp_current_selection = 1}
		Change \{should_reset_gig_posters_selection = 0}
	endif
	if GameIsPaused
		UnPauseGame
	endif
	menu_music_off
	gig_posters_song_focus
	reset_all_special_events
	GetPakManCurrentName \{map = zones}
	if (<pakname> != 'z_board_room')
		if pakfilesarecached
			StopRendering
		else
			create_loading_screen
		endif
		if pakfilesarecached
			SetPakManCurrentBlock \{map = zones
				pak = z_board_room
				block_scripts = 1}
		else
			SetPakManCurrentBlock \{map = zones
				pak = z_board_room
				block_scripts = 0}
		endif
		apply_band_logo_to_venue \{step = build}
		Wait \{2
			gameframes}
		apply_band_logo_to_venue \{step = apply}
		if pakfilesarecached
			if isXenon
				hide_glitch \{num_frames = 3}
			endif
			StartRendering
		endif
		destroy_loading_screen
		LightShow_InitEventMappings
		lightshow_dummyloop
		if NOT ViewportExists \{id = bg_viewport}
			setup_bg_viewport
		endif
		SpawnScriptNow \{task_menu_default_anim_in
			params = {
				base_name = 'gig_posters'
			}}
	endif
	kill_all_posters
	gigboard_get_exclusive_controller controller = <controller>
	Change \{menu_gp_stage = 1}
	Change \{gig_posters_last_focused_selection = 1}
	progression_flag = career_band
	unlock_order = gh4_career_band_progression_unlock_order
	part = Band
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
	Change current_progression_savegame = <savegame>
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
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = gp_selection_menu
		exclusive_device = <controller>
		event_handlers = <event_handlers>
		tags = {ready = 0 last_section = 0 first_unlocked_selection = 0}
	}
	formatText checksumName = gignum 'gig%d' d = ($menu_gp_current_selection)
	created_gignum = 1
	if StructureContains structure = $<unlock_order> freegigs
		gig_num = 1
		begin
		formatText checksumName = gignum 'gig%d' d = <gig_num>
		if NOT StructureContains structure = ($<unlock_order>.freegigs) <gignum>
			break
		endif
		if StructureContains structure = ($<unlock_order>.freegigs.<gignum>) dont_add_gig_poster
			break
		endif
		gig = ($<unlock_order>.freegigs.<gignum>.Name)
		free_gig_num = ($<unlock_order>.freegigs.<gignum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		GetGlobalTags <gig_name> savegame = <savegame>
		setup_gigboard_poster <...> poster_gig_num = <free_gig_num>
		<created_gignum> = (<created_gignum> + 1)
		<gig_num> = (<gig_num> + 1)
		repeat
	endif
	set_num = 1
	begin
	formatText checksumName = setnum 'unlockset%d' d = <set_num>
	if NOT StructureContains structure = $<unlock_order> <setnum>
		break
	endif
	gig_num = 1
	begin
	formatText checksumName = gignum 'gig%d' d = <gig_num>
	if NOT StructureContains structure = ($<unlock_order>.<setnum>) <gignum>
		break
	endif
	if isgigunlocked Set = <setnum> gig = <gignum> setlist_prefix = <setlist_prefix> unlock_order = <unlock_order> savegame = <savegame>
		if StructureContains structure = ($<unlock_order>.<setnum>.<gignum>) forced_pos
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
	formatText checksumName = gignum 'special_event%d' d = <specialevent_num>
	if NOT StructureContains structure = ($<unlock_order>.<setnum>) <gignum>
		break
	endif
	if isgigunlocked Set = <setnum> gig = <gignum> setlist_prefix = <setlist_prefix> unlock_order = <unlock_order> savegame = <savegame>
		setup_gigboard_poster <...>
		<created_gignum> = (<created_gignum> + 1)
	endif
	<specialevent_num> = (<specialevent_num> + 1)
	repeat
	paytoplay_num = 1
	begin
	formatText checksumName = gignum 'pay_to_play%d' d = <paytoplay_num>
	if NOT StructureContains structure = ($<unlock_order>.<setnum>) <gignum>
		break
	endif
	if isgigunlocked Set = <setnum> gig = <gignum> setlist_prefix = <setlist_prefix> unlock_order = <unlock_order> savegame = <savegame>
		if StructureContains structure = ($<unlock_order>.<setnum>.<gignum>) forced_pos
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
	if StructureContains structure = $<unlock_order> freegigs_last
		gig_num = 1
		begin
		formatText checksumName = gignum 'gig%d' d = <gig_num>
		if NOT StructureContains structure = ($<unlock_order>.freegigs_last) <gignum>
			break
		endif
		gig = ($<unlock_order>.freegigs_last.<gignum>.Name)
		free_gig_num = ($<unlock_order>.freegigs_last.<gignum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		GetGlobalTags <gig_name> savegame = <savegame>
		if StructureContains structure = ($<unlock_order>.freegigs_last.<gignum>) forced_pos
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
			gp_selection_menu :SetProps {
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
	AssignAlias \{id = gp_selection_menu
		alias = gig_posters_menu}
	fadetoblack \{OFF
		alpha = 1.0
		time = 0.1
		z_priority = 100
		no_wait}
endscript

script gig_posters_setup_helpers 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = gigboardarrowinterface}
		DestroyScreenElement \{id = gigboardarrowinterface}
	endif
	if ($is_network_game = 1)
		if IsHost
			if GotParam \{setup_paytoplay_helpers}
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
		if GotParam \{setup_paytoplay_helpers}
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
	if ((NotCD) && ($enable_button_cheats = 1))
		add_user_control_helper \{text = qs(0xb7802856)
			button = blue
			z = 100}
	endif
	CreateScreenElement \{Type = descinterface
		parent = root_window
		id = gigboardarrowinterface
		desc = 'gig_board_arrows'
		gig_board_arrow_left_alpha = 0
		gig_board_arrow_right_alpha = 0
		gig_board_arrow_texture = name_arrow_dn}
endscript

script gig_posters_back 

	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_back_sound
	ready = 1
	if ScreenElementExists \{id = gp_selection_menu}
		gp_selection_menu :GetTags
	endif
	if (<ready> = 0)
		return
	endif
	if ($menu_gp_stage > 1)
		return
	endif
	if NOT ScriptIsRunning \{gig_posters_setlist_back}
		gp_selection_menu :SetTags \{ready = 0}
		Change \{menu_gp_current_selection = 1}
		Change \{menu_gp_stage = 0}
		destroy_gig_posters_menu \{destroy_ui_only}
		frontend_load_soundcheck \{loadingscreen
			gigboard}
		generic_event_back \{nosound}
	endif
endscript

script wait_for_camera_anim 
	Wait \{5
		gameframes}
	begin
	if is_menu_camera_finished
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
gig_posters_popup_timer = 0

script monitor_gig_poster_selection 
	if NOT GotParam \{came_from_setlist}
		get_gigposter_camera_name \{num = 0}
		Change target_menu_camera = <gigposter_camera>
		Wait ($gig_posters_initial_wait_time) Seconds
	endif
	SpawnScriptNow \{gigposters_camera_out}
	gigposters_toggle_with_fire num = ($menu_gp_current_selection) OFF
	Wait \{15
		gameframes}
	wait_for_camera_anim
	if NOT GotParam \{came_from_setlist}
		gig_do_hand_animation
	endif
	gigposters_toggle_with_fire num = ($menu_gp_current_selection) On
	LaunchEvent \{Type = focus
		target = gp_selection_menu}
	gp_selection_menu :SetTags \{ready = 1}
	show_setlist_on_gigboard created_gignum = ($menu_gp_current_selection)
	SpawnScriptLater \{0x1e464d15}
	gigposters_cycle_song_previews
endscript

script gigposters_camera_out 
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	setsoundbussparams {sfx_balance = {vol = ($default_BussSet.sfx_balance.vol)}}
	setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)}}
	if NOT (issoundplaying ext_md_crowd_good_loop_ft)
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = frontend_menu_music
			immediate = 1}
	endif
	begin
	if is_menu_camera_finished
		get_gigboard_section
		if (<section> = 1)
			LightShow_PlaySnapshot \{Name = left_board
				save = FALSE
				UseSnapshotPositions = FALSE}
			SafeCreate \{nodeName = z_board_room_g_rm_light_off}
			SafeKill \{nodeName = z_board_room_g_rm_light_on}
			SafeKill \{nodeName = z_board_room_g_rm_small_lights_off}
			SafeCreate \{nodeName = z_board_room_g_rm_small_lights_on}
		elseif (<section> = 2)
			LightShow_PlaySnapshot \{Name = middle_board
				save = FALSE
				UseSnapshotPositions = FALSE}
			SafeKill \{nodeName = z_board_room_g_rm_light_off}
			SafeCreate \{nodeName = z_board_room_g_rm_light_on}
			SafeCreate \{nodeName = z_board_room_g_rm_small_lights_off}
			SafeKill \{nodeName = z_board_room_g_rm_small_lights_on}
			i = 5
			begin
			formatText checksumName = dark_poster 'Z_Board_Room_G_RM_Gig_dark_%d' d = <i>
			SafeKill nodeName = <dark_poster>
			<i> = (<i> + 1)
			repeat 5
			SafeKill \{nodeName = z_board_room_g_rm_poster_dark}
		else
			i = 5
			begin
			formatText checksumName = dark_poster 'Z_Board_Room_G_RM_Gig_dark_%d' d = <i>
			SafeCreate nodeName = <dark_poster>
			<i> = (<i> + 1)
			repeat 5
			SafeCreate \{nodeName = z_board_room_g_rm_poster_dark}
		endif
		if (<section> = 5)
			SafeKill \{nodeName = z_board_room_gfx_fx_confetti_01}
			get_progression_globals ($current_progression_flag)
			format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = 13
			GetGlobalTags <gig_name> params = first_time_unlocked savegame = <savegame>
			if (<first_time_unlocked> = 1)
				SoundEvent \{event = fireworks_last_venue}
				kill \{prefix = z_board_room_gfx_fx_twfx_01
					noprefixwarning}
				create \{prefix = z_board_room_gfx_fx_twfx_01
					noprefixwarning}
				SafeCreate \{nodeName = z_board_room_gfx_fx_confetti_01}
			endif
		endif
		if (<section> = 4)
			kill \{prefix = z_board_room_gfx_fx_twfx_01
				noprefixwarning}
			SafeKill \{nodeName = z_board_room_gfx_fx_confetti_01}
		endif
		if (<section> = 3)
			kill \{prefix = z_board_room_gfx_fx_twfx_01
				noprefixwarning}
			SafeKill \{nodeName = z_board_room_gfx_fx_confetti_01}
		endif
		if (<section> = 2)
			kill \{prefix = z_board_room_gfx_fx_twfx_01
				noprefixwarning}
			SafeKill \{nodeName = z_board_room_gfx_fx_confetti_01}
		endif
		if (<section> = 1)
			kill \{prefix = z_board_room_gfx_fx_twfx_01
				noprefixwarning}
			SafeKill \{nodeName = z_board_room_gfx_fx_confetti_01}
		endif
		get_gigposter_camera_name_section num = <section>
		if ($target_menu_camera != <gigposter_camera>)
			gp_selection_menu :GetSingleTag \{last_section}
			if (<last_section> > <section>)
				SoundEvent \{event = gigboard_zoom_left}
			elseif (<last_section> < <section>)
				SoundEvent \{event = gigboard_zoom_right}
			endif
			gp_selection_menu :SetTags last_section = <section>
		endif
		Change target_menu_camera = <gigposter_camera>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	update_gigboard_arrows
	if ScreenElementExists \{id = gp_selection_menu}
		gp_selection_menu :SetTags \{ready = 1}
	endif
endscript

script update_gigboard_arrows 
	if ScreenElementExists \{id = gigboardarrowinterface}
		gig_board_arrow_left_alpha = 0
		gig_board_arrow_right_alpha = 0
		get_gigboard_section
		current_section = <section>
		GetArraySize \{$gigposter_creation_numbers}
		i = ($menu_gp_current_selection)
		begin
		if (<i> >= <array_Size>)
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

	Change menu_flow_locked = ($menu_flow_locked + 1)
	if ScreenElementExists \{id = gp_selection_menu}
		setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
		KillSpawnedScript \{Name = gigposters_cycle_song_previews_spawned}
		SpawnScriptNow \{0xb20ce9b6}
		KillSpawnedScript \{Name = monitor_gig_poster_selection}
		destroy_menu \{menu_id = gigboardsetlistinterface}
		KillCamAnim \{Name = ch_view_cam}
		destroy_viewport_ui
		destroy_menu \{menu_id = gp_selection_menu}
		generic_ui_destroy
		destroy_gig_band_money_display
		if ScreenElementExists \{id = gigboardarrowinterface}
			DestroyScreenElement \{id = gigboardarrowinterface}
		endif
		destroy_count = 1
		begin
		formatText checksumName = viewport_id 'gigposters_viewport_id%d' d = <destroy_count>
		formatText checksumName = viewport_override_id 'gigposters_viewport_override_id%d' d = <destroy_count>
		formatText checksumName = window_id 'gigposters_window_id%d' d = <destroy_count>
		destroy_viewport_ui {
			viewport_id = <viewport_id>
			viewport_override_id = <viewport_override_id>
			window_id = <window_id>
		}
		<destroy_count> = (<destroy_count> + 1)
		repeat 19
		destroy_count = 1
		begin
		formatText checksumName = viewport_id 'setlist_viewport_id%d' d = <destroy_count>
		formatText checksumName = viewport_override_id 'setlist_viewport_override_id%d' d = <destroy_count>
		formatText checksumName = window_id 'setlist_window_id%d' d = <destroy_count>
		destroy_viewport_ui {
			viewport_id = <viewport_id>
			viewport_override_id = <viewport_override_id>
			window_id = <window_id>
		}
		<destroy_count> = (<destroy_count> + 1)
		repeat 19
		created_gignum = 1
		begin
		formatText checksumName = poster_container_id 'poster_%d' d = <created_gignum>
		if ScreenElementExists id = <poster_container_id>
			destroy_menu menu_id = <poster_container_id>
		endif
		<created_gignum> = (<created_gignum> + 1)
		repeat 19
	endif
	if NOT GotParam \{destroy_ui_only}
		if ($menu_gp_stage = 0)
			destroy_band
		endif
		setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
		SpawnScriptLater \{menu_music_on}
		if NOT (issoundplaying ext_md_crowd_good_loop_ft)
			Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = frontend_menu_music
				immediate = 1}
		endif
	endif
	destroy_menu \{menu_id = gigboardvenueselectinterface}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript
gig_posters_last_focused_selection = 1

script gig_posters_focus_popup 
	if NOT GotParam \{back_from_venue_select}
		Change gig_posters_last_focused_selection = <current_selection>
		gigposters_toggle_with_fire num = <current_selection> OFF focused
		toggle_gigposter_difficulty_texture diffnum = <current_selection> OFF fix_for_last_gigs
	endif
	create_gigboard_poster_with_viewport <...> created_gignum = <current_selection>
	gp_selection_menu :SetTags \{ready = 1}
endscript

script gig_posters_unfocus_popup 
	if ScreenElementExists \{id = gp_selection_menu}
		gp_selection_menu :SetTags \{ready = 0}
	endif
	destroy_gig_posters_window created_gignum = <current_selection>
	gigposters_toggle_with_fire num = <current_selection> OFF unfocused
	gig_posters_song_focus
	if NOT GotParam \{keep_viewport}
		destroy_gigboard_setlist_viewport created_gignum = <current_selection>
	endif
endscript

script gig_posters_move_selection 
	if ($menu_gp_current_selection <= 0)
		return
	endif
	gigposters_toggle_with_fire num = ($menu_gp_current_selection) On <...>
	SpawnScriptNow \{gigposters_camera_out}
	show_setlist_on_gigboard created_gignum = ($menu_gp_current_selection)
	gigposters_cycle_song_previews
endscript

script gig_posters_up 
	if ScreenElementExists \{id = gp_selection_menu}
		gp_selection_menu :GetTags
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
		formatText checksumName = Tier 'tier%d' d = <found_gig>
		if StructureContains structure = ($<tier_global>.<Tier>) createagig
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
	SoundEvent \{event = gigboard_scroll_up_down}
	gig_posters_unfocus_popup current_selection = ($menu_gp_current_selection)
	Change menu_gp_current_selection = <entry>
	gig_posters_move_selection
endscript

script gig_posters_down 
	if ScreenElementExists \{id = gp_selection_menu}
		gp_selection_menu :GetTags
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
		formatText checksumName = Tier 'tier%d' d = <found_gig>
		if StructureContains structure = ($<tier_global>.<Tier>) createagig
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
	SoundEvent \{event = gigboard_scroll_up_down}
	gig_posters_unfocus_popup current_selection = ($menu_gp_current_selection)
	Change menu_gp_current_selection = <entry>
	gig_posters_move_selection
endscript

script create_gig_poster_venue_select progression_flag = ($current_progression_flag)
	if ScreenElementExists \{id = gigboardarrowinterface}
		DestroyScreenElement \{id = gigboardarrowinterface}
	endif
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	gig_posters_song_focus
	get_progression_globals <progression_flag>
	formatText checksumName = tiername 'tier%d' d = <poster_gig_num>
	tier_level = ($<tier_global>.<tiername>.level)
	level_poster = ($<tier_global>.<tiername>.poster_texture)
	gigboard_get_exclusive_controller
	CreateScreenElement \{Type = descinterface
		parent = root_window
		id = gigboardvenueselectinterface
		desc = 'gig_board_venue'
		z_priority = 20000
		arrow_texture = name_arrow_dn
		head_bg_texture = gig_highlight_blacken}
	switch (<level_poster>)
		case frat_poster
		gigboardvenueselectinterface :0x8e6af868 \{child = scrollingmenu
			Pos = (0.0, 50.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = header
			Pos = (0.0, -199.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = arrow_up
			Pos = (250.0, 75.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = arrow_down
			Pos = (250.0, 375.0)}
		case bone_poster
		gigboardvenueselectinterface :0x8e6af868 \{child = scrollingmenu
			Pos = (0.0, 105.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = header
			Pos = (0.0, -144.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = arrow_up
			Pos = (250.0, 130.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = arrow_down
			Pos = (250.0, 430.0)}
		case bayou_poster
		gigboardvenueselectinterface :0x8e6af868 \{child = scrollingmenu
			Pos = (15.0, 95.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = header
			Pos = (15.0, -154.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = arrow_up
			Pos = (265.0, 120.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = arrow_down
			Pos = (265.0, 420.0)}
		case hob_poster
		gigboardvenueselectinterface :0x8e6af868 \{child = scrollingmenu
			Pos = (0.0, 95.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = header
			Pos = (0.0, -154.0)}
		case castle_poster
		gigboardvenueselectinterface :0x8e6af868 \{child = scrollingmenu
			Pos = (20.0, 150.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = header
			Pos = (20.0, -99.0)}
		case ozzfest_poster
		gigboardvenueselectinterface :0x8e6af868 \{child = scrollingmenu
			Pos = (0.0, 95.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = header
			Pos = (0.0, -154.0)}
		case times_poster
		gigboardvenueselectinterface :0x8e6af868 \{child = scrollingmenu
			Pos = (15.0, 75.0)}
		gigboardvenueselectinterface :0x8e6af868 \{child = header
			Pos = (15.0, -174.0)}
	endswitch
	if gigboardvenueselectinterface :desc_resolvealias \{Name = alias_gig_venue_content}
		AssignAlias id = <resolved_id> alias = venue_select_menu
		venue_select_menu :se_setprops {
			exclusive_device = <controller>
			event_handlers = [
				{pad_back gig_posters_setlist_back}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
	endif
	GetArraySize \{$LevelZoneArray}
	level_zone_array_size = <array_Size>
	index = 0
	num_added = 0
	begin
	get_LevelZoneArray_checksum index = <index>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		get_progression_globals (<progression_flag>)
		formatText {
			checksumName = venue_checksum
			'%s_%i'
			s = ($LevelZones.<level_checksum>.Name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			AddToStringLookup = true
		}
		GetGlobalTags <venue_checksum> param = unlocked savegame = <savegame>

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
			CreateScreenElement {
				Type = ContainerElement
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
			CreateScreenElement {
				Type = SpriteElement
				parent = <item_container>
				texture = gig_highlight_blacken
				rgba = ($gigboard_setlist_props.<level_poster>.highlight_rgba)
				dims = (500.0, 50.0)
				Pos = (250.0, 0.0)
				z_priority = 2
				alpha = 0
				just = [center center]
				internal_just = [center center]
			}


			CreateScreenElement {
				Type = TextElement
				parent = <item_container>
				font = fontgrid_text_a8
				text = ($LevelZones.<level_checksum>.title)
				rgba = ($gigboard_setlist_props.<level_poster>.songname_rgba)
				Pos = (250.0, 0.0)
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
	LaunchEvent \{Type = focus
		target = venue_select_menu}
	gp_selection_menu :SetTags \{ready = 1}
endscript

script gigposter_venue_focus 
	Obj_GetID
	if ResolveScreenElementID id = {<objID> child = 0} param = focus_item
		SetScreenElementProps id = <focus_item> alpha = 1
	endif
endscript

script gigposter_venue_unfocus 
	Obj_GetID
	if ResolveScreenElementID id = {<objID> child = 0} param = focus_item
		SetScreenElementProps id = <focus_item> alpha = 0
	endif
endscript

script create_gig_poster_setlist progression_flag = ($current_progression_flag)
	if ScreenElementExists \{id = gigboardarrowinterface}
		DestroyScreenElement \{id = gigboardarrowinterface}
	endif
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	get_progression_globals <progression_flag>
	formatText checksumName = poster_container_id 'poster_%d' d = <created_gignum>
	ExtendCrc <poster_container_id> '_songlist' out = songlist_popup
	<poster_container_id> :GetTags
	formatText checksumName = tiername 'tier%d' d = <poster_gig_num>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
	formatText checksumName = gignum 'gig%d' d = <poster_gig_num>
	tier_level = ($<tier_global>.<tiername>.level)
	level_poster = ($<tier_global>.<tiername>.poster_texture)
	tier_name = ($LevelZones.<tier_level>.title)
	formatText checksumName = gig_posters_setlist_container 'gig_posters_setlist_container_%d' d = <created_gignum>
	destroy_menu menu_id = <gig_posters_setlist_container>
	gigboard_get_exclusive_controller
	GetGlobalTags <gig_name> savegame = <savegame>
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
		GetArraySize ($<tier_global>.<tiername>.songs)
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
		repeat <array_Size>
	endif
	destroy_menu \{menu_id = gigboardsetlistinterface}
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		id = gigboardsetlistinterface
		desc = 'gig_board_setlist'
		play_gig_text = <header_option_text>
		icon_guitar_64_texture = <instrument_texture>
		z_priority = 20000
		Pos = ($gigboard_setlist_props.<level_poster>.offset)
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
	0x6141c4c0 = (500.0, 500.0)
	arrow_up_pos = (0.0, 0.0)
	arrow_down_pos = (0.0, 480.0)
	switch (<level_poster>)
		case hongkong_poster
		<arrow_up_pos> = (0.0, 45.0)
		<arrow_down_pos> = (0.0, 430.0)
		case amobea_poster
		<arrow_up_pos> = (0.0, 40.0)
		<arrow_down_pos> = (0.0, 430.0)
		case aircraft_poster
		<arrow_up_pos> = (0.0, 40.0)
		<arrow_down_pos> = (0.0, 430.0)
		case statefair_poster
		<arrow_up_pos> = (0.0, 40.0)
		<arrow_down_pos> = (0.0, 430.0)
		case hob_poster
		<arrow_up_pos> = (0.0, 40.0)
		<arrow_down_pos> = (0.0, 430.0)
		case bayou_poster
		<arrow_up_pos> = (0.0, 40.0)
		<arrow_down_pos> = (0.0, 430.0)
		case castle_poster
		0x6141c4c0 = (500.0, 400.0)
		<arrow_up_pos> = (0.0, 78.0)
		<arrow_down_pos> = (0.0, 390.0)
		case sf_ballpark_poster
		<arrow_up_pos> = (0.0, 40.0)
		<arrow_down_pos> = (0.0, 430.0)
		case ozzfest_poster
		<arrow_up_pos> = (0.0, 40.0)
		<arrow_down_pos> = (0.0, 440.0)
		case times_poster
		<arrow_up_pos> = (0.0, 50.0)
		<arrow_down_pos> = (0.0, 450.0)
		case wow_poster
		0x6141c4c0 = (500.0, 400.0)
		<arrow_up_pos> = (0.0, 90.0)
		<arrow_down_pos> = (0.0, 370.0)
	endswitch
	gigboardsetlistinterface :0x8e6af868 child = scrollingmenu Scale = (0.8, 0.8) dims = <0x6141c4c0>
	gigboardsetlistinterface :0x8e6af868 child = arrow_up Pos = <arrow_up_pos>
	gigboardsetlistinterface :0x8e6af868 child = arrow_down Pos = <arrow_down_pos>
	if gigboardsetlistinterface :desc_resolvealias \{Name = alias_gig_setlist_master}
		AssignAlias id = <resolved_id> alias = gigboard_setlist_menu_master
	endif
	if gigboardsetlistinterface :desc_resolvealias \{Name = alias_gig_setlist_content}
		AssignAlias id = <resolved_id> alias = gigboard_setlist_menu_content
		gigboard_setlist_menu_content :se_setprops {
			exclusive_device = <controller>
			event_handlers = [
				{pad_back gig_posters_setlist_back}
			]
		}
	endif
	if gigboardsetlistinterface :desc_resolvealias \{Name = alias_gig_item_play}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_choose gig_posters_choose_next params = {play_entire_gig progression_flag = <progression_flag> song_checksum = <my_song_checksum> song_index = <song_index>}}
				{focus gigposters_setlist_item_focus params = {id = gigboardsetlistinterface level_poster = <level_poster> completed = <completed>}}
				{unfocus gigposters_setlist_item_unfocus params = {id = gigboardsetlistinterface level_poster = <level_poster>}}
			]
		}
	endif
	GetArraySize ($<tier_global>.<tiername>.songs)
	pay_to_play = 0
	if StructureContains structure = ($<tier_global>.<tiername>) paytoplay
		pay_to_play = 1
	endif
	if (<array_Size> > 0)
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
	if StructureContains structure = ($<tier_global>.<tiername>) encorep1
		if (<song> = ($<tier_global>.<tiername>.encorep1))
			icon_alpha = 0.6
			icon_texture = icon_gig_encore
			if (<encore_unlocked> = 0)
				show_song = 0
			endif
		endif
	endif
	if StructureContains structure = ($<tier_global>.<tiername>) boss
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
		GetGlobalTags <song_checksum> param = stars savegame = <savegame>
		GetGlobalTags <song_checksum> param = score savegame = <savegame>
		GetGlobalTags <song_checksum> param = percent100 savegame = <savegame>
		formatText TextName = song_score_text qs(0x76b3fda7) d = <score> usecommas
		GetRandomValue \{a = 0
			b = 360
			Name = rand_rot1}
		GetRandomValue \{a = 0
			b = 360
			Name = rand_rot2}
		GetRandomValue \{a = 0
			b = 360
			Name = rand_rot3}
		GetRandomValue \{a = 0
			b = 360
			Name = rand_rot4}
		GetRandomValue \{a = 0
			b = 360
			Name = rand_rot5}
		<num_selectable> = (<num_selectable> + 1)
		<num_selectable_already_decremented> = FALSE
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
			if (<num_selectable_already_decremented> = FALSE)
				<num_selectable> = (<num_selectable> - 1)
			endif
		endif
		if StructureContains structure = <focusable_flag> not_focusable
			master_alpha = ($gigboard_setlist_props.<level_poster>.unavailable_alpha)
		endif
		star_texture = Song_Summary_Score_Star
		stars_rgba = ($gigboard_setlist_props.<level_poster>.stars_rgba)
		if (<percent100> = 1)
			star_texture = song_complete_star_perfect
			stars_rgba = [255 255 255 255]
		endif
		CreateScreenElement {
			Type = descinterface
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
		<id> :0x8e6af868 child = gig_item_artist internal_scale = (1.0, 1.0)
		<id> :0x8e6af868 child = gig_item_score internal_scale = (0.9, 0.8)
		<id> :0x8e6af868 child = gig_star_1 dims = (30.0, 30.0)
		<id> :0x8e6af868 child = gig_star_2 dims = (30.0, 30.0)
		<id> :0x8e6af868 child = gig_star_3 dims = (30.0, 30.0)
		<id> :0x8e6af868 child = gig_star_4 dims = (30.0, 30.0)
		<id> :0x8e6af868 child = gig_star_5 dims = (30.0, 30.0)
		<id> :0x8e6af868 child = icon_difficulty Pos = (15.0, 5.0)
		if (<icon_alpha> = 0)
			<id> :se_setprops gig_item_icon_container_dims = (0.0, 0.0)
		endif
		if <id> :desc_resolvealias Name = alias_gig_item_stars
			GetScreenElementChildren id = <resolved_id>
			i = 1
			begin
			if (<i> > <stars>)
				DestroyScreenElement id = (<children> [(<i> - 1)])
			endif
			i = (<i> + 1)
			repeat 5
		endif
		num_shown = (<num_shown> + 1)
	endif
	<song_num> = (<song_num> + 1)
	repeat <array_Size>
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
	LaunchEvent \{Type = focus
		target = gigboard_setlist_menu_content}
	gigposters_cycle_song_previews
endscript

script gigposters_setlist_item_focus 
	Obj_GetID
	if NOT GotParam \{id}
		id = <objID>
	endif
	<id> :se_setprops {
		gig_item_highlight_alpha = 1
		highlight_rgba = ($gigboard_setlist_props.<level_poster>.highlight_rgba)
	}
	if (<id> = gigboardsetlistinterface && (<completed> = 0 || <completed> = -1))
		return
	endif
	if GotParam \{song}
		gig_posters_song_focus song = <song>
	else
		gigposters_cycle_song_previews
	endif
endscript

script gigposters_setlist_item_unfocus 
	Obj_GetID
	if NOT GotParam \{id}
		id = <objID>
	endif
	<id> :se_setprops {
		gig_item_highlight_alpha = 0
	}
endscript

script gig_posters_song_focus \{song = None}
	setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
	KillSpawnedScript \{Name = gigposters_cycle_song_previews_spawned}
	0xc337ea4c
	Wait \{2
		gameframes}
	0x2e9b1633 song = <song>
endscript

script gig_posters_setlist_back 

	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	current_selection = ($menu_gp_current_selection)
	formatText checksumName = poster_container_id 'poster_%d' d = <current_selection>
	ExtendCrc <poster_container_id> '_songlist' out = songlist_popup
	if ScreenElementExists id = <songlist_popup>
		DestroyScreenElement id = <songlist_popup>
		if (<current_selection> > 9)
			formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_small_%d' d = <current_selection>
		else
			formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_small_0%d' d = <current_selection>
		endif
		SafeCreate nodeName = <postername>
	endif
	ready = 1
	if ScreenElementExists \{id = gp_selection_menu}
		gp_selection_menu :GetTags
	endif
	if (<ready> = 0)
		return
	endif
	if ($menu_gp_stage = 2)
		SoundEvent \{event = gigboard_select_back}
		SoundEvent \{event = gig_board_zoom_out}
		LaunchEvent \{Type = unfocus
			target = gigboard_setlist_menu_content}
		LaunchEvent \{Type = focus
			target = gp_selection_menu}
		formatText checksumName = poster_container_id 'poster_%d' d = ($menu_gp_current_selection)
		if ScreenElementExists id = <poster_container_id>
			<poster_container_id> :GetTags
			get_progression_globals ($current_progression_flag)
			format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
			GetGlobalTags <gig_name> params = completed savegame = <savegame>
			if (<completed> = 1 || <completed> = 2)
				toggle_gigposter_difficulty_texture diffnum = ($menu_gp_current_selection) fix_for_last_gigs
			endif
		endif
		destroy_gig_band_money_display
		destroy_menu \{menu_id = gigboardsetlistinterface}
		gigposters_camera_out
		gig_posters_unfocus_popup current_selection = ($gig_posters_last_focused_selection) keep_viewport
		show_setlist_on_gigboard created_gignum = ($menu_gp_current_selection)
		wait_for_camera_anim
		gigposters_toggle_with_fire num = ($menu_gp_current_selection) On
		gigposters_cycle_song_previews
		Change \{menu_gp_stage = 1}
	elseif ($menu_gp_stage = 3)
		destroy_menu \{menu_id = gigboardvenueselectinterface}
		gig_posters_focus_popup current_selection = ($menu_gp_current_selection) back_from_venue_select keep_viewport
		show_setlist_on_gigboard created_gignum = ($menu_gp_current_selection)
		Change \{menu_gp_stage = 2}
	else
		show_setlist_on_gigboard created_gignum = ($menu_gp_current_selection)
	endif
	gig_posters_setup_helpers
	if ($menu_gp_stage = 1)
		update_gigboard_arrows
	endif
	gp_selection_menu :SetTags \{ready = 1}
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
	GetArraySize \{$gigposter_creation_numbers}
	i = 0
	begin

	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script reset_gigposter_creation_numbers 
	GetArraySize \{$gigposter_creation_numbers}
	i = 0
	begin
	SetArrayElement ArrayName = gigposter_creation_numbers globalarray index = <i> NewValue = 0
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script setup_gigboard_poster 
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	if NOT GotParam \{poster_gig_num}
		poster_gig_num = ($<unlock_order>.<setnum>.<gignum>.num)
	endif
	gp_selection_menu :SetTags tier_global = <tier_global>
	if GotParam \{forced_pos}
		index = (<forced_pos> - 1)
	else
		index = (<created_gignum> - 1)
	endif
	SetArrayElement ArrayName = gigposter_creation_numbers globalarray index = <index> NewValue = <poster_gig_num>
	diffnum = (<index> + 1)
	0x89ca87aa = <diffnum>
	if (<diffnum> > 17)
		0x89ca87aa = <index>
	endif
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<completed> = 1 || <completed> = 2)
		source_texture = difficulty_beginner_icon

		progression_gig_get_highest_difficulty_completed gig = <poster_gig_num>
		if (<highest_diff_completed> = 'easy_rhythm' || <highest_diff_completed> = 'none')
			<highest_diff_completed> = 'beginner'
		endif
		formatText checksumName = source_texture 'images\\menuScreens\\gigposters\\difficulty_%s_icon.png' s = <highest_diff_completed>
		if (<0x89ca87aa> > 9)
			formatText checksumName = difftexname 'tex\\zones\\Z_Board_Room\\Gig_Tex_Board_Room_Difficulty_%d.png' d = <0x89ca87aa> AddToStringLookup = true
		else
			formatText checksumName = difftexname 'tex\\zones\\Z_Board_Room\\Gig_Tex_Board_Room_Difficulty_0%d.png' d = <0x89ca87aa> AddToStringLookup = true
		endif
		if (<first_time_unlocked> = 0)
			toggle_gigposter_difficulty_texture diffnum = <diffnum>
		endif
		StopRendering
		replacetexture {
			src = <source_texture>
			dest_tex_dict_assetname = `zones\z_board_room\z_board_room.tex`
			dest_tex_dict_assetcontext = z_board_room
			dest_tex_dict_texturename = <difftexname>
		}
		StartRendering
	endif
	if (<first_time_unlocked> = 1)
		gp_selection_menu :GetSingleTag \{first_unlocked_selection}
		if (<first_unlocked_selection> = 0)
			gp_selection_menu :SetTags first_unlocked_selection = <diffnum>
		endif
	else
		create_small_gig_poster num = <diffnum>
	endif
endscript

script create_gigboard_poster_with_viewport 
	poster_gig_num = ($gigposter_creation_numbers [(<created_gignum> - 1)])
	formatText checksumName = tiername 'tier%d' d = <poster_gig_num>
	formatText checksumName = poster_container_id 'poster_%d' d = <created_gignum>
	if ScreenElementExists id = <poster_container_id>
		if NOT GotParam \{back_from_venue_select}
			destroy_gig_posters_window created_gignum = <created_gignum>
		endif
	endif
	wait_for_camera_anim
	destroy_gigboard_setlist_viewport created_gignum = ($menu_gp_current_selection)
	create_gig_posters_window <...> created_gignum = <created_gignum>
	if GotParam \{back_from_venue_select}
		generic_menu_pad_back_sound
		destroy_menu menu_id = <poster_container_id>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <window_id>
		id = <poster_container_id>
		just = [left top]
		Pos = (0.0, 0.0)
		tags = {
			poster_gig_num = <poster_gig_num>
		}
	}
	gp_selection_menu :GetTags
	ExtendCrc <poster_container_id> '_songlist' out = songlist_popup
	CreateScreenElement {
		Type = SpriteElement
		parent = gp_selection_menu
		id = <songlist_popup>
		z_priority = 102
		dims = (1280.0, 720.0)
		Scale = (0.7, 1.3)
		rgba = [180 180 180 255]
		Pos = (210.0, -40.0)
		texture = ($<tier_global>.<tiername>.poster_texture)
		just = [left top]
	}
	if (<created_gignum> > 9)
		formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_small_%d' d = <created_gignum>
	else
		formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_small_0%d' d = <created_gignum>
	endif
	SafeKill nodeName = <postername>
	create_gig_poster_setlist <...>
endscript

script create_gig_posters_window \{created_gignum = 1}
endscript

script destroy_gig_posters_window \{created_gignum = 1}
	if ScreenElementExists \{id = 0x3cc1329a}
		SetScreenElementProps \{id = 0x3cc1329a
			unhide}
	endif
	formatText checksumName = viewport_id 'gigposters_viewport_id%d' d = <created_gignum>
	formatText checksumName = viewport_override_id 'gigposters_viewport_override_id%d' d = <created_gignum>
	formatText checksumName = window_id 'gigposters_window_id%d' d = <created_gignum>
	destroy_viewport_ui {
		window_id = <window_id>
	}
	if (<created_gignum> > 9)
		formatText checksumName = posternamelarge 'Z_Board_Room_G_RM_Gig_poster_%d' d = <created_gignum>
	else
		formatText checksumName = posternamelarge 'Z_Board_Room_G_RM_Gig_poster_0%d' d = <created_gignum>
	endif
	SafeKill nodeName = <posternamelarge>
endscript

script debug_complete_gig_cheat 
	if ($enable_button_cheats = 0)
		return
	endif
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	poster_gig_num = ($gigposter_creation_numbers [($menu_gp_current_selection - 1)])
	formatText checksumName = Tier 'tier%d' d = <poster_gig_num>
	if StructureContains structure = ($<tier_global>.<Tier>) createagig
		return
	endif
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
	GetGlobalTags <gig_name> params = completed savegame = <savegame>
	if (<completed> = 0)
		SetGlobalTags <gig_name> params = {completed = 1} all_active_players = 1
		Change \{allow_career_progression_check = 1}
	elseif (<completed> = -1)
		SetGlobalTags <gig_name> params = {completed = 2} all_active_players = 1
	endif
	SetGlobalTags <gig_name> params = {encore_unlocked = 1 boss_unlocked = 1 started = 1} all_active_players = 1
	progression_career_gig_complete <...> (<progression_flag>)
	getplayerinfo \{1
		difficulty}
	formatText checksumName = tiername 'tier%d' d = <poster_gig_num>
	GetArraySize ($<tier_global>.<tiername>.songs)
	song_index = 0

	begin
	format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tiername>.songs [<song_index>])
	SetGlobalTags <song_checksum> params = {score = 149457 stars = 5 unlocked = 1} all_active_players = 1
	song_index = (<song_index> + 1)
	repeat <array_Size>
	if StructureContains structure = ($<tier_global>.<tiername>) level
		formatText {
			checksumName = venue_checksum
			'%s_%i'
			s = ($LevelZones.($<tier_global>.<tiername>.level).Name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			AddToStringLookup = true
		}
		SetGlobalTags <venue_checksum> params = {unlocked = 1} all_active_players = 1
	endif
	ui_event \{event = menu_refresh}
endscript

script isgigunlocked 
	if ($0x942e23ff = 1)
		return \{true}
	endif
	gig = ($<unlock_order>.<Set>.<gig>.Name)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script gigposters_toggle_with_fire 
	if (<num> > 9)
		formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_small_%d' d = <num>
		formatText checksumName = fire 'Z_Board_Room_poster_Fire_%d' d = <num>
		formatText checksumName = posterfire 'Z_Board_Room_G_RM_Gig_%d_Fire' d = <num>
	else
		formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_small_0%d' d = <num>
		formatText checksumName = fire 'Z_Board_Room_poster_Fire_0%d' d = <num>
		formatText checksumName = posterfire 'Z_Board_Room_G_RM_Gig_0%d_Fire' d = <num>
	endif
	if (<num> > 9)
		formatText checksumName = glowlines 'Z_Board_Room_G_RM_Glowlines_%d' d = <num>
		formatText checksumName = glowball 'Z_Board_Room_G_RM_Glowball_%d' d = <num> AddToStringLookup = true
	else
		formatText checksumName = glowlines 'Z_Board_Room_G_RM_Glowlines_0%d' d = <num>
		formatText checksumName = glowball 'Z_Board_Room_G_RM_Glowball_0%d' d = <num> AddToStringLookup = true
	endif
	if GotParam \{On}
		if NOT GotParam \{poster_only}
			SafeCreate nodeName = <fire>
			SafeCreate nodeName = <glowball>
			if NOT GotParam \{no_poster_fire}
				SafeCreate nodeName = <glowlines>
				SafeCreate nodeName = <posterfire>
			endif
		endif
		SafeKill nodeName = <postername>
	elseif GotParam \{OFF}
		if NOT GotParam \{poster_only}
			SafeKill nodeName = <fire>
			SafeKill nodeName = <glowlines>
			SafeKill nodeName = <glowball>
			SafeKill nodeName = <posterfire>
		endif
		SafeCreate nodeName = <postername>
	endif
endscript

script show_setlist_on_gigboard progression_flag = ($current_progression_flag)
endscript

script get_gigboard_section num = ($menu_gp_current_selection)
	section = 5
	if (<num> < 5)
		section = 1
	elseif (<num> < 10)
		section = 2
	elseif (<num> < 14)
		section = 3
	elseif (<num> < 17)
		section = 4
	endif
	return section = <section>
endscript

script destroy_gigboard_setlist_viewport 
	formatText checksumName = viewport_id 'setlist_viewport_id%d' d = <created_gignum>
	formatText checksumName = viewport_override_id 'setlist_viewport_override_id%d' d = <created_gignum>
	formatText checksumName = window_id 'setlist_window_id%d' d = <created_gignum>
	destroy_viewport_ui {
		viewport_id = 0xcd648547
		viewport_override_id = 0x7b80b07e
		window_id = <window_id>
	}
endscript

script gigposters_cycle_song_previews 
	setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
	KillSpawnedScript \{Name = gigposters_cycle_song_previews_spawned}
	0xc337ea4c
	Wait \{2
		gameframes}
	SpawnScriptNow gigposters_cycle_song_previews_spawned params = {<...>}
endscript

script gigposters_cycle_song_previews_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	gignum = ($gigposter_creation_numbers [($menu_gp_current_selection - 1)])
	get_progression_globals ($current_progression_flag)
	formatText checksumName = tiername 'tier%d' d = <gignum>
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gignum>
	GetGlobalTags <gig_name> savegame = <savegame>
	encore_song = None
	if StructureContains structure = ($<tier_global>.<tiername>) encorep1
		encore_song = ($<tier_global>.<tiername>.encorep1)
	endif
	boss_song = None
	if StructureContains structure = ($<tier_global>.<tiername>) boss
		boss_song = ($<tier_global>.<tiername>.boss)
	endif
	if StructureContains structure = ($<tier_global>.<tiername>) specialevent
		return
	endif
	if StructureContains structure = ($<tier_global>.<tiername>) createagig
		return
	endif
	GetArraySize ($<tier_global>.<tiername>.songs)
	begin
	song_index = 0
	begin
	setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
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
		0x2e9b1633 song = <song>
		Wait \{7
			Seconds}
		setsoundbussparams {Music_Setlist = {vol = (($default_BussSet.Music_Setlist.vol) - 100)} time = 1.0}
		Wait \{1.1
			Seconds}
	endif
	<song_index> = (<song_index> + 1)
	setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
	repeat <array_Size>
	repeat
endscript

script toggle_gigposter_difficulty_texture \{diffnum = 1}
	if (<diffnum> > 9)
		formatText checksumName = diffname 'Z_Board_Room_G_RM_Gig_Difficulty_%d' d = <diffnum>
	else
		formatText checksumName = diffname 'Z_Board_Room_G_RM_Gig_Difficulty_0%d' d = <diffnum>
	endif
	if GotParam \{OFF}
		SafeKill nodeName = <diffname>
	else
		SafeCreate nodeName = <diffname>
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
	GetGlobalTags <gig_name> savegame = <savegame>

	formatText checksumName = tiername 'tier%d' d = <gignum>
	GetArraySize ($<tier_global>.<tiername>.songs)
	i = 0
	begin
	format_globaltag_song_checksum part = <part> song = ($<tier_global>.<tiername>.songs [<i>]) difficulty = <diff>
	GetGlobalTags <song_checksum> savegame = <savegame>

	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script debug_gig_start 
	if ((CD) || ($enable_button_cheats = 0))
		return
	endif
	get_progression_globals <progression_flag>
	Change \{menu_gp_stage = 3}
	i = 0
	begin
	formatText checksumName = Tier 'tier%d' d = (<i> + 1)
	if StructureContains structure = ($<tier_global>.<Tier>) debug_gig
		gig_num = (<i> + 1)
		create_loading_screen
		if (($is_network_game = 1) && (IsHost))
			SendStructure callback = net_gig_posters_choose_next data_to_send = {gig_num = <gig_num> progression_flag = <progression_flag>}
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
	if GotParam \{deduct_funds}
		SoundEvent \{event = menu_purchase_item}
		get_savegame_from_controller controller = ($primary_controller)
		decrease_band_money price = <paytoplay_price> savegame = <savegame>
		destroy_popup_warning_menu
		SetGlobalTags <gig_name> params = {started = 1} all_active_players = 1
		GetArraySize ($<tier_global>.<tiernum>.songs)
		i = 0
		begin
		SetGlobalTags ($<tier_global>.<tiernum>.songs [<i>]) all_active_players = 1 params = {unlocked = 1}
		i = (<i> + 1)
		repeat <array_Size>
		level_checksum = ($<tier_global>.<tiernum>.level)
		formatText {
			checksumName = venue_checksum
			'%s_%i'
			s = ($LevelZones.<level_checksum>.Name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			AddToStringLookup = true
		}
		SetGlobalTags <venue_checksum> params = {unlocked = 1} all_active_players = 1
		formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
		SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
	endif
	if (($is_network_game = 1) && (IsHost))
		SendStructure {callback = net_gig_posters_choose_next data_to_send = {
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
	if ScreenElementExists \{id = gigboard_setlist_menu_content}
		LaunchEvent \{Type = focus
			target = gigboard_setlist_menu_content}
	endif
	gp_selection_menu :SetTags \{ready = 1}
	gig_posters_setup_helpers <...>
endscript

script get_songs_available_for_create_a_setlist progression_flag = ($current_progression_flag)
	return \{num_songs_available = 0
		unlocked_songs_array = [
		]}
endscript

script create_gig_band_money_display \{gig_cost = 0}
	destroy_gig_band_money_display
	PushAssetContext \{context = ui_board_room}
	CreateScreenElement \{parent = gp_selection_menu
		Type = descinterface
		id = gig_band_money_id
		desc = 'gig_pay2play'
		z_priority = 50000}
	PopAssetContext \{context = ui_board_room}
	refresh_gig_band_money_display gig_cost = <gig_cost>
endscript

script destroy_gig_band_money_display 
	if ScreenElementExists \{id = gig_band_money_id}
		DestroyScreenElement \{id = gig_band_money_id}
	endif
endscript

script refresh_gig_band_money_display 
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	formatText TextName = cash_text '$%i' i = <cash>
	formatText TextName = gig_cost_text '$%i' i = <gig_cost>
	if ScreenElementExists \{id = gig_band_money_id}
		SetScreenElementProps {
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
		formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_%d' d = <poster_name_num>
		formatText checksumName = smallposter 'Z_Board_Room_G_RM_Gig_poster_small_%d' d = <poster_name_num>
		formatText checksumName = diffname 'Z_Board_Room_G_RM_Gig_Difficulty_%d' d = <poster_name_num>
	else
		formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_0%d' d = <poster_name_num>
		formatText checksumName = smallposter 'Z_Board_Room_G_RM_Gig_poster_small_0%d' d = <poster_name_num>
		formatText checksumName = diffname 'Z_Board_Room_G_RM_Gig_Difficulty_0%d' d = <poster_name_num>
	endif
	SafeKill nodeName = <postername>
	if NOT GotParam \{no_diff}
		SafeKill nodeName = <diffname>
	endif
	gigposters_toggle_with_fire num = <poster_name_num> OFF
	SafeKill nodeName = <smallposter>
	<poster_name_num> = (<poster_name_num> + 1)
	repeat 23
endscript

script search_for_tool_in_gig 
	get_progression_globals ($current_progression_flag)
	formatText \{checksumName = tiernum
		'tier%d'
		d = $menu_gp_last_gignum}
	GetArraySize ($<tier_global>.<tiernum>.songs)
	if (<array_Size> > 0)
		song_index = 0
		begin
		song = ($<tier_global>.<tiernum>.songs [<song_index>])
		if (<song> = parabola || <song> = schism || <song> = vicarious)
			return \{true}
		endif
		song_index = (<song_index> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
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
	formatText checksumName = Pos 'pos_%d' d = <num>
	return gig_pos_2d = (<...>.<Pos>)
endscript

script gig_do_hand_animation 
	get_progression_globals ($current_progression_flag)
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	GetArraySize ($gigposter_creation_numbers)
	num = 1
	begin
	poster_gig_num = ($gigposter_creation_numbers [(<num> -1)])
	if (<poster_gig_num> != 0)
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <poster_gig_num>
		GetGlobalTags <gig_name> params = first_time_unlocked savegame = <savegame>
		if (<first_time_unlocked> = 1)
			wait_and_do_gigboard_hand_animation <...>
		endif
	endif
	num = (<num> + 1)
	repeat <array_Size>
	index = 0
	found_next_gig = 0
	begin
	gig_number = ($gigposter_creation_numbers [<index>])
	if (<gig_number> != 0)
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_number>
		GetGlobalTags <gig_name> params = completed savegame = <savegame>
		if (<completed> = 0 || <completed> = -1)
			formatText checksumName = tiername 'tier%d' d = <gig_number>
			contains_createagig = 0
			if StructureContains structure = ($<tier_global>.<tiername>) createagig
				contains_createagig = 1
			endif
			if ($is_network_game = 0)
				if (<contains_createagig> = 0)
					gig_posters_unfocus_popup current_selection = ($menu_gp_current_selection)
					Change menu_gp_current_selection = (<index> + 1)
					gig_posters_move_selection \{no_poster_fire}
					found_next_gig = 1
					break
				endif
			endif
		endif
	endif
	index = (<index> + 1)
	repeat 19
endscript

script wait_and_do_gigboard_hand_animation 
	gig_posters_unfocus_popup current_selection = ($menu_gp_current_selection)
	Change menu_gp_current_selection = <num>
	gig_posters_move_selection \{no_poster_fire}
	if (<poster_gig_num> = 13)
		create_small_gig_poster num = <num>
		Wait \{2.5
			Seconds}
	else
		get_gigposter_pos_in_2d num = <num>
		SoundEvent \{event = gigboard_gig_unlock}
		ui_create_handslapper Pos = <gig_pos_2d> callback = {create_small_gig_poster params = {num = <num>}}
	endif
	if GotParam \{gig_name}
		SetGlobalTags <gig_name> params = {first_time_unlocked = 0} all_active_players = 1
	endif
	begin
	if NOT ScriptIsRunning \{anim_handslapper}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if GotParam \{gig_name}
		GetGlobalTags <gig_name> param = completed
		if (<completed> = 1)
			toggle_gigposter_difficulty_texture diffnum = ($menu_gp_current_selection) fix_for_last_gigs
		endif
	endif
endscript

script get_gigposter_camera_name \{num = 1}
	switch ($current_progression_flag)
		case career_guitar
		formatText TextName = gigposter_camera 'gigposters_guitar_%a' a = <num>
		case career_bass
		formatText TextName = gigposter_camera 'gigposters_bass_%a' a = <num>
		case career_drum
		formatText TextName = gigposter_camera 'gigposters_drum_%a' a = <num>
		case career_vocals
		formatText TextName = gigposter_camera 'gigposters_vocals_%a' a = <num>
		case career_band
		formatText TextName = gigposter_camera 'gigposters_band_%a' a = <num>
		default
		formatText TextName = gigposter_camera 'gigposters_guitar_%a' a = <num>
	endswitch
	return gigposter_camera = <gigposter_camera>
endscript

script get_gigposter_camera_name_section \{num = 1}
	switch ($current_progression_flag)
		case career_guitar
		formatText TextName = gigposter_camera 'gigposters_guitar_0_%a' a = <num>
		case career_bass
		formatText TextName = gigposter_camera 'gigposters_bass_0_%a' a = <num>
		case career_drum
		formatText TextName = gigposter_camera 'gigposters_drum_0_%a' a = <num>
		case career_vocals
		formatText TextName = gigposter_camera 'gigposters_vocals_0_%a' a = <num>
		case career_band
		formatText TextName = gigposter_camera 'gigposters_band_0_%a' a = <num>
		default
		formatText TextName = gigposter_camera 'gigposters_guitar_0_%a' a = <num>
	endswitch
	return gigposter_camera = <gigposter_camera>
endscript

script replace_texture_on_gig_posters progression_flag = ($current_progression_flag)
endscript

script create_small_gig_poster \{num = 1}

	if (<num> > 9)
		formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_small_%d' d = <num>
	else
		formatText checksumName = postername 'Z_Board_Room_G_RM_Gig_poster_small_0%d' d = <num>
	endif
	SafeCreate nodeName = <postername>
endscript

script gigboard_get_exclusive_controller controller = ($primary_controller)
	if ($is_network_game = 1)
		array = []
		AddArrayElement array = <array> element = (<controller>)
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

script ui_create_handslapper \{Pos = (640.0, 360.0)
		time = 0.2
		callback = nullscript}
	if ScreenElementExists \{id = handslapper}
		DestroyScreenElement \{id = handslapper}
	endif
	CreateScreenElement \{parent = root_window
		id = handslapper
		Type = descinterface
		desc = 'gig_board_handslapper'
		z_priority = 0}
	handslapper :Obj_SpawnScriptNow anim_handslapper params = {Pos = <Pos> time = <time> callback = <callback>}
endscript

script anim_handslapper 
	se_setprops {
		handslapper_pos = <Pos>
		handslapper_scale = 5
		handslapper_alpha = 0
		handslapper_open_alpha = 0
		fireburst_01_alpha = 0
		fireburst_02_alpha = 0
		fireburst_03_alpha = 0
		time = 0
	}
	se_waitprops
	se_setprops {
		handslapper_scale = 1
		handslapper_alpha = 1
		time = <time>
		motion = ease_in
	}
	se_waitprops
	SpawnScriptNow <callback>
	se_setprops \{handslapper_open_alpha = 1
		handslapper_closed_alpha = 0}
	se_setprops \{handslapper_scale = 1.1
		handslapper_sleeve_rot = -5
		time = 0.1
		motion = ease_out}
	se_waitprops
	se_setprops \{handslapper_scale = 1.0
		time = 0.1
		motion = ease_in}
	se_waitprops
	se_setprops \{fireburst_01_alpha = 1
		time = 0.1
		motion = ease_in}
	se_waitprops
	se_setprops \{fireburst_01_alpha = 0
		fireburst_02_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops \{fireburst_02_alpha = 0
		fireburst_03_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops {
		fireburst_03_alpha = 0
		fireburst_03_scale = (1.5, 1.7)
		fireburst_03_pos = (0.0, -150.0)
		handslapper_sleeve_rot = -15
		handslapper_pos = (<Pos> + (0.0, 50.0))
		time = 0.2
		motion = ease_out
	}
	se_waitprops
	se_setprops {
		handslapper_pos = (<Pos> + (0.0, 700.0))
		handslapper_alpha = 0
		handslapper_sleeve_rot = -30
		time = 0.8
		motion = ease_in
	}
	se_waitprops
	Die
endscript
