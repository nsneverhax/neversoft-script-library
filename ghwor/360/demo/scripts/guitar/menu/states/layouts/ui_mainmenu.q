
script ui_init_mainmenu 
	mainmenu_populate_menu_options_global
	killspawnedscript \{name = rock_record_read_friends}
	spawnscriptnow \{rock_record_read_friends}
endscript

script ui_create_mainmenu \{do_not_add_friend_feed = 0}
	spawnscriptnow \{audio_kill_crowds_during_stats_screen}
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = main_menu_signin_changed}
	change \{rich_presence_context = presence_menus}
	change \{g_songlist_playlist_size = 0}
	change \{g_songlist_beginning_playlist_size = 0}
	change \{g_songlist_infinite_playlist = 0}
	change \{g_songlist_random_playlist = 0}
	change \{g_songlist_num_5star_songs = 0}
	marketplacebgmonitorfunc \{func = set_background_download
		on}
	marketplacebgmonitorfunc \{func = start_scan}
	if NOT isps3
		marketplacepersistencefunc \{func = attempt_init}
	endif
	get_num_savegames
	if (<num_savegames> > 0)
		savegame = 0
		begin
		if islocallysignedin controller = <savegame>
			gamerpictexturerequest {
				local_user_index = <savegame>
				local_id = <savegame>
			}
		endif
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
	spawnscriptnow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned \{do_not_add_friend_feed = !i1768515945}
	setplayerinfo \{1
		in_game = 0}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	reset_stances_for_frontend
	setup_sessionfuncs
	netsessionfunc \{func = live_settings_init}
	netsessionfunc \{obj = live_settings
		func = get_settings}
	netsessionfunc \{func = friends_init}
	change \{g_current_band = default_band}
	if scriptisrunning \{handle_signin_changed}
		popunsafeforshutdown \{context = gameplay
			type = unchecked}
		return
	endif
	killspawnedscript \{name = persistent_band_cancel_lobby}
	spawnscriptnow \{persistent_band_cancel_lobby}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
		change \{game_mode = quickplay}
		netsessionfunc \{func = removeallcontrollers}
		fadetoblack \{off
			alpha = 1.0
			time = 0.1
			z_priority = 100
			no_wait}
		clean_up_user_control_helpers
		if NOT screenelementexists \{id = current_menu}
			create_main_menu_elements do_not_add_friend_feed = <do_not_add_friend_feed>
		endif
		create_main_menu
		mainmenu_id :desc_applyscene \{name = `default`}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100
			all_buttons}
		mainmenu_id :obj_spawnscript \{main_menu_add_friendfeed_button_pill_spawned}
		launchevent type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		playlist_clear
		unpausegame
	endif
	change \{g_current_music_dsp_snapshot_setting = 'game'}
	destroy_mainmenu_bg
endscript

script ui_destroy_mainmenu 
	spawnscriptnow \{destroy_main_menu}
	killspawnedscript \{name = run_motd}
	killspawnedscript \{name = run_motd_demon}
	if screenelementexists \{id = motdinterface}
		motdinterface :die
	endif
	if screenelementexists \{id = main_menu_select_xbox_party_warning}
		destroy_dialog_box
	endif
endscript

script main_menu_signin_changed 
	printf \{qs(0x283e65d1)}
	ui_event_get_top
	if NOT (<base_name> = 'mainmenu')
		ui_event \{event = menu_back
			data = {
				state = uistate_mainmenu
			}}
		ui_event_wait_for_safe
	endif
	reset_dlc_signin_state
	reset_savegame savegame = <controller>
	set_audio_options_for_primary_controller
	safe_update_band_characters
	spawnscriptnow \{main_menu_signin_changed_restore_friends_feed}
endscript

script main_menu_signin_changed_restore_friends_feed 
	wait \{4
		gameframes}
	if scriptisrunning \{main_menu_signin_changed}
		return
	endif
	if screenelementexists \{id = current_menu}
		if screenelementexists \{id = mainmenu_id}
			current_menu :obj_spawnscriptlater \{attempt_to_add_friend_feed
				params = {
					menu = main
					parent_id = mainmenu_id
					event_handler = current_menu
				}}
		endif
	endif
endscript

script run_motd 
	obj_getid
	motdinterface :se_setprops \{img_texture = motd_image}
	setprops \{pos = (0.0, 0.0)}
	runscriptonscreenelement id = {<objid> child = demon_container} run_motd_demon
	begin
	setprops \{pos = (1680.0, 0.0)
		time = 10}
	se_waitprops
	setprops \{pos = (0.0, 0.0)
		time = 10}
	se_waitprops
	wait \{1
		second}
	repeat
endscript

script run_motd_demon 
	obj_getid
	getscreenelementchildren id = <objid>
	if gotparam \{children}
		getarraysize <children>
		i = 0
		add = 1
		begin
		j = 0
		begin
		if (<i> = <j>)
			setscreenelementprops id = (<children> [<j>]) alpha = 1.0 time = 0.05
		else
			setscreenelementprops id = (<children> [<j>]) alpha = 0.0 time = 0.05
		endif
		j = (<j> + 1)
		repeat <array_size>
		if (<i> = 0)
			add = 1
		elseif (<i> = (<array_size> - 1))
			add = -1
		endif
		i = (<i> + <add>)
		wait \{0.25
			seconds}
		repeat
	endif
endscript
menu_sound_lock = false

script menu_song_monitor 
	return
	unload_songqpak
	sap_getaudiolength
	song_length = <time>
	songaudioinit
	sap_setmastervolume \{vol = -5
		time = 0.1}
	begin
	if (<song_length> > 0)
		begin
		sap_getaudioposition
		if (<time> > 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		begin
		sap_getaudioposition
		if (<time> >= <song_length> || <time> = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	change \{menu_sound_lock = true}
	musicmonitor_system_deinit
	sap_unload
	get_random_menu_song
	playlist_clear
	playlist_setcurrentsong song = <song>
	if NOT songaudioload song_name = <song> starttime = 0.0
		change \{menu_sound_lock = false}
		songaudiodeinit
		return
	endif
	songaudioplay
	change \{menu_sound_lock = false}
	sap_getaudiolength
	song_length = <time>
	repeat
endscript

script stop_menu_song_monitor 
	sap_getaudiolength
	song_length = <time>
	if (<song_length> > 0)
		songaudiodeinit
	endif
	return
	begin
	if ($menu_sound_lock = false)
		break
	endif
	wait \{1
		gameframe}
	repeat
	killspawnedscript \{name = menu_song_monitor}
	songaudiodeinit
endscript
last_menu_song_index = -1

script get_random_menu_song 
	getarraysize \{$menu_songs}
	if (<array_size> < 2)
		scriptassert \{qs(0xca3d1326)}
		return \{song = none}
	endif
	getrandomvalue name = index a = 0 b = (<array_size> -2) integer
	if (<index> = $last_menu_song_index)
		index = (<index> + 1)
	endif
	change \{last_menu_song_index = index}
	return song = ($menu_songs [<index>])
endscript

script main_menu_add_friendfeed_button_pill_spawned 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	if screenelementexists \{id = friends_feed_desc_id}
		break
	endif
	wait \{10
		gameframes}
	repeat
	if news_feed_should_add_button_helper
		if NOT user_control_helper_exists \{button = blue}
			add_user_control_helper \{text = qs(0x226893e8)
				button = blue
				z = 100
				all_buttons}
		else
			user_control_helper_change_text \{button = blue
				text = qs(0x226893e8)}
		endif
	endif
endscript

script ui_mainmenu_anim_in 
	mainmenu_animate \{id = mainmenu_id}
endscript

script ui_mainmenu_anim_out 
	mainmenu_animate \{id = mainmenu_id}
endscript
