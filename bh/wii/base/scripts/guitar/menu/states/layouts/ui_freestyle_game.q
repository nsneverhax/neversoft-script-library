
script ui_create_freestyle_game 
	CreateScreenElement \{Type = ContainerElement
		id = freestyle_root
		parent = root_window
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		event_handlers = [
			{
				ds_disconnect
				freestyle_notify_ds_disconnected
			}
		]}
	AssignAlias \{id = freestyle_root
		alias = ds_event_listener}
	set_random_human_players
	SpawnScriptLater \{ui_freestyle_init}
endscript

script ui_deinit_freestyle_game 
	SpawnScriptNow \{freestyle_destroy_gh4}
	if ScreenElementExists \{id = freestyle_root}
		DestroyScreenElement \{id = freestyle_root}
	endif
	printf \{'exiting for some reason...'}
endscript

script ui_freestyle_init 
	kill_start_key_binding
	SetScreenElementProps \{id = freestyle_root
		Hide}
	if (($freestyle_game_mode = watch) || ($freestyle_game_mode = tutorial))
		Change \{freestyle_loading_screen_type = watch}
	else
		Change \{freestyle_loading_screen_type = Normal}
	endif
	freestyle_init_gh4
	SpawnScriptNow \{freestyle_game_start}
	SetScreenElementProps \{id = freestyle_root
		unhide}
endscript

script freestyle_init_gh4 
	0x9f8a46a1
	halt_wii_notifications
	($default_loading_screen.create) force_predisplay = 1
	freestyle_leave_menus
	destroy_band
	getcasappearance
	unloadappearancepaks asset_context = heap_musician1 appearance = <appearance> no_wait async = 0
	LightShow_Shutdown
	Kill_LightShow_FX
	Change \{current_level = load_z_freestyle}
	menu_music_off \{setflag = 1}
	Change \{g_hud_2d_struct_used = hud_1g1v}
	Load_Venue
	if NOT GotParam \{starttime}
		if GotParam \{uselaststarttime}
			starttime = ($current_starttime)
		else
			starttime = 0
		endif
	endif
	if NOT GotParam \{difficulty2}
		getplayerinfo \{2
			difficulty
			out = difficulty2}
	endif
	if NOT GotParam \{difficulty}
		difficulty = expert
	endif
	if NOT GotParam \{song_name}
		gman_songtool_getcurrentsong
		song_name = <current_song>
	endif
	disable_pause
	PauseGame
	LaunchEvent \{Type = unfocus
		target = root_window}
	printf qs(0x22278392) s = <song_name> l = <difficulty>
	guitarevent_venueenter
	init_play_log
	begin_singleplayer_game
	if ((isps2) || (isngc))
		get_progression_globals game_mode = ($game_mode)
		GetPakManCurrentName \{map = zones}
		switch <pakname>
			case 'z_dive'
			Change \{Default_TOD_Manager = $default_tod_manager_bloomnoblur}
			case 'z_hell'
			Change \{Default_TOD_Manager = $default_tod_manager_bloomnoblur}
			case 'z_budokan'
			Change \{Default_TOD_Manager = $default_tod_manager_bloomnoblur}
			case 'z_wikker'
			Change \{Default_TOD_Manager = $default_tod_manager_bloomnoblur}
			case 'z_credits'
			Change \{Default_TOD_Manager = $default_tod_manager_bloomnoblur}
			case 'z_freestyle'
			Change \{Default_TOD_Manager = $default_tod_manager_freestyle}
			default
			Change \{Default_TOD_Manager = $default_tod_manager_bloomnoblur}
		endswitch
	endif
	if ViewportExists \{id = UI}
		SetViewportProperties \{viewport = UI
			Active = FALSE}
	endif
	create_moment_cam_lock_targets
	freestyle_game_load
	setup_bg_viewport
	enable_bg_viewport
	($default_loading_screen.Destroy)
	UI :Unpause
	allow_wii_notifications
	if (($freestyle_loading_screen_type = Normal) && ($smoketestisrunning = FALSE))
		freestyle_create_post_load_screen
		begin
		if ControllerPressed \{X}
			break
		endif
		Wait \{1
			Frame}
		repeat
		generic_menu_pad_choose_sound
		freestyle_destroy_post_load_screen
	endif
	hide_glitch \{num_frames = 30}
	LaunchEvent \{Type = focus
		target = root_window}
	gh3_start_pressed
	KillCamAnim \{Name = ch_view_cam}
	KillCamAnim \{Name = menu_view_cam}
	Change \{freestyle_restarting = FALSE}
endscript

script freestyle_destroy_gh4 
	fadetoblack \{On
		time = 0
		alpha = 1.0
		z_priority = 9999999
		no_wait}
	freestyle_game_unload
	Change \{CameraCuts_Enabled = true}
	KillCamAnim \{Name = freestyle_view_cam}
	vv_stop_camera_cuts
	Change \{playing_song_for_real = 0}
	mark_unsafe_for_shutdown
	printf \{qs(0x60e6d670)}
	if NOT GotParam \{restarting}
		StopRendering
	endif
	destroyplayerserver \{id = all}
	SongUnLoadFSBIfDownloaded
	disable_highway_prepass
	unload_full_guitarist_anims
	Kill_StarPower_Camera \{changecamera = 0}
	Kill_Walk_Camera \{changecamera = 0}
	Kill_StarPower_StageFX \{Player = 1
		ifEmpty = 0}
	Kill_StarPower_StageFX \{Player = 2
		ifEmpty = 0}
	Change \{showing_raise_axe = 0}
	kill_debug_elements
	guitarevent_venueexit
	destroy_cameracuts
	notemap_deinit
	LaunchGemEvent \{event = kill_objects}
	destroy_credits_menu
	deinit_star_power_debug
	destroy_battle_alert_frames
	KillSpawnedScript \{Name = create_gem}
	KillSpawnedScript \{Name = move_2d_elements_to_default}
	KillSpawnedScript \{Name = wait_and_play_you_rock_movie}
	KillSpawnedScript \{Name = update_score_fast}
	KillSpawnedScript \{Name = check_for_star_power}
	KillSpawnedScript \{Name = wait_for_inactive}
	KillSpawnedScript \{Name = pulsate_all_star_power_bulbs}
	KillSpawnedScript \{Name = pulsate_star_power_bulb}
	KillSpawnedScript \{Name = rock_meter_star_power_on}
	KillSpawnedScript \{Name = rock_meter_star_power_off}
	KillSpawnedScript \{Name = star_power_activate_and_drain}
	KillSpawnedScript \{Name = hud_activated_star_power}
	KillSpawnedScript \{Name = hud_move_note_scorebar}
	KillSpawnedScript \{Name = hud_lightning_alert}
	KillSpawnedScript \{Name = hud_show_note_streak_combo}
	KillSpawnedScript \{Name = highway_pulse_multiplier_loss}
	kill_pulsate_star_power_bulbs \{Player = 1}
	kill_pulsate_star_power_bulbs \{Player = 2}
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = jam_input_whammy}
	index = 0
	begin
	highway_player = ($freestyle_player_data [<index>].highway_player)
	has_highway = ($freestyle_player_data [<index>].has_highway)
	setplayerinfo <highway_player> star_power_used = 0
	setplayerinfo <highway_player> whammy_on = 0
	if (<has_highway> = true)
		destroy_hud Player = <highway_player>
		destroy_highway Player = <highway_player> <...>
	endif
	index = (<index> + 1)
	repeat $freestyle_max_players
	if ViewportExists \{id = UI}
		SetViewportProperties \{viewport = UI
			Active = true}
	endif
	new_destroy_hud
	kill_startup_script <...>
	KillSpawnedScript \{Name = freestyle_drummer_play_idle_right_hand}
	KillSpawnedScript \{Name = freestyle_drummer_play_idle_left_hand}
	KillSpawnedScript \{Name = GuitarEvent_MissedNote}
	KillSpawnedScript \{Name = GuitarEvent_UnnecessaryNote}
	KillSpawnedScript \{Name = GuitarEvent_HitNotes}
	KillSpawnedScript \{Name = GuitarEvent_HitNote}
	KillSpawnedScript \{Name = GuitarEvent_StarPowerOn}
	KillSpawnedScript \{Name = GuitarEvent_StarPowerOff}
	KillSpawnedScript \{Name = GuitarEvent_StarHitNote}
	KillSpawnedScript \{Name = GuitarEvent_StarSequenceBonus}
	KillSpawnedScript \{Name = GuitarEvent_StarMissNote}
	KillSpawnedScript \{Name = GuitarEvent_WhammyOn}
	KillSpawnedScript \{Name = GuitarEvent_WhammyOff}
	KillSpawnedScript \{Name = GuitarEvent_StarWhammyOn}
	KillSpawnedScript \{Name = GuitarEvent_StarWhammyOff}
	KillSpawnedScript \{Name = GuitarEvent_Note_Window_Open}
	KillSpawnedScript \{Name = GuitarEvent_Note_Window_Close}
	KillSpawnedScript \{Name = GuitarEvent_crowd_poor_medium}
	KillSpawnedScript \{Name = GuitarEvent_crowd_medium_good}
	KillSpawnedScript \{Name = GuitarEvent_crowd_medium_poor}
	KillSpawnedScript \{Name = GuitarEvent_crowd_good_medium}
	KillSpawnedScript \{Name = GuitarEvent_CreateFirstGem}
	KillSpawnedScript \{Name = highway_pulse_black}
	KillSpawnedScript \{Name = GuitarEvent_HitNote_Spawned}
	KillSpawnedScript \{Name = GuitarEvent_HitNote}
	KillSpawnedScript \{Name = hit_note_fx}
	KillSpawnedScript \{Name = Do_StarPower_StageFX}
	KillSpawnedScript \{Name = Do_StarPower_Camera}
	KillSpawnedScript \{Name = first_gem_fx}
	KillSpawnedScript \{Name = gem_iterator}
	KillSpawnedScript \{Name = gem_array_stepper}
	KillSpawnedScript \{Name = gem_array_events}
	KillSpawnedScript \{Name = gem_step}
	KillSpawnedScript \{Name = gem_step_end}
	KillSpawnedScript \{Name = fretbar_iterator}
	KillSpawnedScript \{Name = Strum_iterator}
	KillSpawnedScript \{Name = FretPos_iterator}
	KillSpawnedScript \{Name = FretFingers_iterator}
	KillSpawnedScript \{Name = Drum_iterator}
	KillSpawnedScript \{Name = Drum_cymbal_iterator}
	KillSpawnedScript \{Name = WatchForStartPlaying_iterator}
	KillSpawnedScript \{Name = tempo_matching_iterator}
	clearmeasurecallbacks
	clearbeatcallbacks
	KillSpawnedScript \{Name = gem_scroller}
	KillSpawnedScript \{Name = button_checker}
	KillSpawnedScript \{Name = check_buttons}
	KillSpawnedScript \{Name = net_check_buttons}
	KillSpawnedScript \{Name = fretbar_update_tempo}
	KillSpawnedScript \{Name = fretbar_update_hammer_on_tolerance}
	KillSpawnedScript \{Name = move_whammy}
	KillSpawnedScript \{Name = create_fretbar}
	KillSpawnedScript \{Name = move_highway_2d}
	KillSpawnedScript \{Name = move_highway_2d_off}
	KillSpawnedScript \{Name = move_highway_prepass}
	KillSpawnedScript \{Name = GuitarEvent_PreFretbar}
	KillSpawnedScript \{Name = GuitarEvent_Fretbar}
	KillSpawnedScript \{Name = check_note_hold}
	KillSpawnedScript \{Name = net_check_note_hold}
	KillSpawnedScript \{Name = star_power_whammy}
	KillSpawnedScript \{Name = show_star_power_ready}
	KillSpawnedScript \{Name = hud_glowburst_alert}
	Change \{star_power_ready_on_p1 = 0}
	Change \{star_power_ready_on_p2 = 0}
	KillSpawnedScript \{Name = event_iterator}
	KillSpawnedScript \{Name = win_song}
	KillSpawnedScript \{Name = hand_note_iterator}
	KillSpawnedScript \{Name = kill_object_later}
	KillSpawnedScript \{Name = waitandkillhighway}
	KillSpawnedScript \{Name = testlevel_debug}
	KillSpawnedScript \{Name = show_coop_raise_axe_for_starpower}
	KillSpawnedScript \{Name = net_whammy_pitch_shift}
	KillSpawnedScript \{Name = Crowd_AllPlayAnim}
	KillSpawnedScript \{Name = hud_activated_star_power_spawned}
	KillSpawnedScript \{Name = dispatch_player_state}
	KillSpawnedScript \{Name = network_events}
	KillSpawnedScript \{Name = online_win_song}
	destroy_net_popup
	destroy_gamertags
	LightShow_Shutdown
	Kill_LightShow_FX
	DestroyParticlesByGroupID \{groupID = zoneparticles}
	Transition_KillAll
	KillSpawnedScript \{Name = GuitarEvent_SongFailed_Spawned}
	KillSpawnedScript \{Name = play_intro}
	KillSpawnedScript \{Name = begin_song_after_intro}
	printf \{qs(0x6d543328)}
	KillSpawnedScript \{id = song_event_scripts}
	printf \{qs(0xa785200e)}
	KillSpawnedScript \{id = zone_scripts}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = zone_killsong '%s_KillSong' s = <pakname>
	if ScriptExists <zone_killsong>
		<zone_killsong>
	endif
	Destroy_AllWhammyFX
	LS_ResetVenueLights
	destroy_movie_viewport
	destroy_bg_viewport
	destroy_intro
	destroy_band
	destroy_vocalist_dummy
	destroy_all_camera_lock_targets
	bandmanager_removeallcharacters
	if ($debug_showmeasures = On)
		if ScreenElementExists \{id = debug_measures_text}
			debug_measures_text :se_setprops \{Hide}
		else
			Change \{debug_showmeasures = OFF}
			toggle_showmeasures \{for_autolaunch}
		endif
	endif
	if ($debug_showsongtime = On)
		if ScreenElementExists \{id = debug_songtime_text}
			debug_songtime_text :se_setprops \{Hide}
		else
			Change \{debug_showsongtime = OFF}
			toggle_showsongtime
		endif
	endif
	if ($debug_showsongstars = On)
		if ScreenElementExists \{id = debug_songstars_text}
			debug_songstars_text :se_setprops \{Hide}
		else
			Change \{debug_showsongstars = OFF}
			toggle_showsongstars
		endif
	endif
	Change \{structurename = musician1_info
		stance = Stance_B}
	Change \{structurename = musician1_info
		next_stance = Stance_B}
	Change \{structurename = musician1_info
		current_anim = Idle}
	Change \{structurename = musician1_info
		cycle_anim = true}
	Change \{structurename = musician1_info
		next_anim = None}
	Change \{structurename = musician1_info
		playing_missed_note = FALSE}
	Change \{structurename = musician2_info
		stance = stance_frontend}
	Change \{structurename = musician2_info
		next_stance = stance_frontend}
	Change \{structurename = musician2_info
		current_anim = Idle}
	Change \{structurename = musician2_info
		cycle_anim = true}
	Change \{structurename = musician2_info
		next_anim = None}
	Change \{structurename = musician2_info
		playing_missed_note = FALSE}
	destroy_debug_measure_text
	kill_character_scripts
	Change \{check_for_unplugged_controllers = 0}
	destroy_menu \{menu_id = you_rock_container}
	KillMovie \{textureSlot = 1}
	printf \{qs(0x0c77f0ad)}
	Wait \{2
		gameframes}
	printf \{qs(0xfa6acfe6)}
	end_song
	fadetoblack \{OFF
		time = 0
		no_wait}
	if ($freestyle_restarting = FALSE)
		freestyle_enter_menus
	endif
	if ($shutdown_game_for_signin_change_flag = 0)
		StartRendering
	endif
	printf \{qs(0xad55869c)}
	mark_safe_for_shutdown
	Change \{playing_song = 0}
	broadcastevent \{Type = kill_gem_scroller_done}
endscript
