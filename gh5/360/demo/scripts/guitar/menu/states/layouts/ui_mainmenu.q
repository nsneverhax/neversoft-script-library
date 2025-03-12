
script ui_init_mainmenu 
	mainmenu_populate_menu_options_global
endscript

script ui_create_mainmenu 
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = main_menu_signin_changed}
	change \{rich_presence_context = presence_menus}
	reset_song_loading_hack_global
	if demobuild
		scriptassert \{'Demo doesnt allow use of the main menu'}
		begin
		printf \{''}
		repeat
	endif
	spawnscriptnow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	setplayerinfo \{1
		in_game = 0}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	setup_sessionfuncs
	netsessionfunc \{func = live_settings_init}
	netsessionfunc \{func = friends_init}
	if scriptisrunning \{handle_signin_changed}
		mark_safe_for_shutdown
		return
	endif
	killspawnedscript \{name = persistent_band_cancel_lobby}
	spawnscriptnow \{persistent_band_cancel_lobby}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
		netsessionfunc \{func = removeallcontrollers}
		fadetoblack \{off
			alpha = 1.0
			time = 0.1
			z_priority = 100
			no_wait}
		clean_up_user_control_helpers
		if NOT screenelementexists \{id = current_menu}
			create_main_menu_elements
		endif
		create_main_menu
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100
			all_buttons}
		add_user_control_helper \{text = qs(0x8a778398)
			button = yellow
			z = 100
			all_buttons}
		launchevent type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		gman_songfunc \{func = clear_play_list}
		unpausegame
	endif
	change \{current_music_dsp_snapshot_setting = 'game'}
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
	reset_dlc_signin_state
	reset_savegame savegame = <controller>
	safe_update_band_characters
endscript

script callback_motd 
	if gotparam \{motd_text}
		change message_of_the_day = <motd_text>
	endif
	if gotparam \{success}
		if (<success> = success)
			if screenelementexists \{id = motdinterface}
				motdinterface :se_setprops \{event_handlers = [
						{
							pad_option
							main_menu_select_motd
						}
					]
					replace_handlers}
			endif
		endif
	endif
	if screenelementexists \{id = motdinterface}
		add_user_control_helper \{text = qs(0x3e13521a)
			button = blue
			z = 100
			all_buttons}
		launchevent \{type = focus
			target = motdinterface}
	endif
endscript

script create_motd 
	createscreenelement \{parent = root_window
		id = motdinterface
		type = containerelement
		desc = 'motd'
		alpha = 0
		pos = (-200.0, 600.0)
		auto_dims = false
		dims = (250.0, 250.0)}
	motdinterface :se_setprops \{event_handlers = [
			{
				pad_option
				main_menu_select_vip
			}
		]}
	netsessionfunc \{obj = motd
		func = get_demonware_motd
		params = {
			callback = callback_motd
		}}
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
	songgetaudiolength
	song_length = <time>
	initsongaudiosystem
	songsetmastervolume \{vol = -5
		time = 0.1}
	begin
	if (<song_length> > 0)
		begin
		songgetaudioposition
		if (<time> > 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		begin
		songgetaudioposition
		if (<time> >= <song_length> || <time> = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	change \{menu_sound_lock = true}
	musicmonitor_system_deinit
	songunload
	get_random_menu_song
	gman_songfunc \{func = clear_play_list}
	gman_songfunc func = set_current_song params = {song = <song>}
	if NOT preload_song song_name = <song> starttime = 0.0
		change \{menu_sound_lock = false}
		deinitsongaudiosystem
		return
	endif
	begin_song
	change \{menu_sound_lock = false}
	songgetaudiolength
	song_length = <time>
	repeat
endscript

script stop_menu_song_monitor 
	songgetaudiolength
	song_length = <time>
	if (<song_length> > 0)
		deinitsongaudiosystem
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
	deinitsongaudiosystem
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
