
script ui_init_mainmenu 
	mainmenu_populate_menu_options_global
endscript

script ui_create_mainmenu 
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	Change \{rich_presence_context = presence_menus}
	reset_song_loading_hack_global
	if demobuild
		ScriptAssert \{'Demo doesnt allow use of the main menu'}
		begin
		printf \{''}
		repeat
	endif
	SpawnScriptNow ui_create_mainmenu_spawned params = <...>
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
	NetSessionFunc \{func = live_settings_init}
	NetSessionFunc \{Obj = live_settings
		func = get_settings}
	NetSessionFunc \{func = friends_init}
	Change \{g_current_band = default_band}
	if ScriptIsRunning \{handle_signin_changed}
		popunsafeforshutdown \{context = gameplay
			Type = unchecked}
		return
	endif
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	SpawnScriptNow \{persistent_band_cancel_lobby}
	marketplacebgmonitorfunc \{func = set_background_download
		On}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
		Change \{game_mode = quickplay}
		NetSessionFunc \{func = removeallcontrollers}
		fadetoblack \{OFF
			alpha = 1.0
			time = 0.1
			z_priority = 100
			no_wait}
		clean_up_user_control_helpers
		if NOT ScreenElementExists \{id = current_menu}
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
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		playlist_clear
		UnPauseGame
	endif
	Change \{g_current_music_dsp_snapshot_setting = 'game'}
endscript

script ui_destroy_mainmenu 
	SpawnScriptNow \{destroy_main_menu}
	KillSpawnedScript \{Name = run_motd}
	KillSpawnedScript \{Name = run_motd_demon}
	if ScreenElementExists \{id = motdinterface}
		motdinterface :Die
	endif
	if ScreenElementExists \{id = main_menu_select_xbox_party_warning}
		destroy_dialog_box
	endif
	marketplacebgmonitorfunc \{func = set_background_download
		OFF}
endscript

script main_menu_signin_changed 
	printf \{qs(0x283e65d1)}
	reset_dlc_signin_state
	reset_savegame savegame = <controller>
	safe_update_band_characters
endscript

script callback_motd 
	NetSessionFunc Obj = live_settings func = trace params = {msg = 'callback_motd CALLED!!!' <...>}
	if GotParam \{Result}
		if (<Result> = success)
			motd_text = ($motd_subject_1)
			Change message_of_the_day = <motd_text>
			if ScreenElementExists \{id = motdinterface}
				motdinterface :se_setprops \{event_handlers = [
						{
							pad_option
							main_menu_select_motd
						}
					]
					replace_handlers}
			endif
			if ScreenElementExists \{id = motdinterface}
				if NOT user_control_helper_exists \{button = blue}
					add_user_control_helper \{text = qs(0x3e13521a)
						button = blue
						z = 100
						all_buttons}
				endif
				LaunchEvent \{Type = focus
					target = motdinterface}
			endif
		endif
	endif
endscript

script create_motd 
	CreateScreenElement \{parent = root_window
		id = motdinterface
		Type = ContainerElement
		desc = 'motd'
		alpha = 0
		Pos = (-200.0, 600.0)
		auto_dims = FALSE
		dims = (250.0, 250.0)}
	motdinterface :se_setprops \{event_handlers = [
			{
				pad_option
				main_menu_select_vip
			}
		]}
	NetSessionFunc \{Obj = motd
		func = get_demonware_motd
		params = {
			callback = callback_motd
		}}
endscript

script run_motd 
	Obj_GetID
	motdinterface :se_setprops \{img_texture = motd_image}
	SetProps \{Pos = (0.0, 0.0)}
	RunScriptOnScreenElement id = {<objID> child = demon_container} run_motd_demon
	begin
	SetProps \{Pos = (1680.0, 0.0)
		time = 10}
	se_waitprops
	SetProps \{Pos = (0.0, 0.0)
		time = 10}
	se_waitprops
	Wait \{1
		Second}
	repeat
endscript

script run_motd_demon 
	Obj_GetID
	GetScreenElementChildren id = <objID>
	if GotParam \{children}
		GetArraySize <children>
		i = 0
		add = 1
		begin
		j = 0
		begin
		if (<i> = <j>)
			SetScreenElementProps id = (<children> [<j>]) alpha = 1.0 time = 0.05
		else
			SetScreenElementProps id = (<children> [<j>]) alpha = 0.0 time = 0.05
		endif
		j = (<j> + 1)
		repeat <array_Size>
		if (<i> = 0)
			add = 1
		elseif (<i> = (<array_Size> - 1))
			add = -1
		endif
		i = (<i> + <add>)
		Wait \{0.25
			Seconds}
		repeat
	endif
endscript
menu_sound_lock = FALSE

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
		Wait \{1
			gameframe}
		repeat
		begin
		sap_getaudioposition
		if (<time> >= <song_length> || <time> = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	Change \{menu_sound_lock = true}
	musicmonitor_system_deinit
	sap_unload
	get_random_menu_song
	playlist_clear
	playlist_setcurrentsong song = <song>
	if NOT songaudioload song_name = <song> starttime = 0.0
		Change \{menu_sound_lock = FALSE}
		songaudiodeinit
		return
	endif
	songaudioplay
	Change \{menu_sound_lock = FALSE}
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
	if ($menu_sound_lock = FALSE)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	KillSpawnedScript \{Name = menu_song_monitor}
	songaudiodeinit
endscript
last_menu_song_index = -1

script get_random_menu_song 
	GetArraySize \{$menu_songs}
	if (<array_Size> < 2)
		ScriptAssert \{qs(0xca3d1326)}
		return \{song = None}
	endif
	GetRandomValue Name = index a = 0 b = (<array_Size> -2) integer
	if (<index> = $last_menu_song_index)
		index = (<index> + 1)
	endif
	Change \{last_menu_song_index = index}
	return song = ($menu_songs [<index>])
endscript

script ui_mainmenu_anim_out 
	printf \{channel = blah
		qs(0x0d1a424d)}
	if ScreenElementExists \{id = mainmenu_id}
		begin
		mainmenu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)}
		mainmenu_id :se_waitprops
		mainmenu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-155.0, -178.0)
			axestone_anim_pos = (330.0, 72.0)
			ampzilla_anim_pos = (10.0, -169.0)
			mainmenu_anim_calcium_fulltop_pos = (79.0, 100.0)
			time = 0.01}
		mainmenu_id :se_waitprops
		mainmenu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (310.0, 82.0)
			ampzilla_anim_pos = (25.0, -180.0)
			mainmenu_anim_calcium_fulltop_pos = (90.0, 100.0)
			time = 0.01}
		mainmenu_id :se_waitprops
		mainmenu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-130.0, -180.0)
			axestone_anim_pos = (310.0, 92.0)
			ampzilla_anim_pos = (12.0, -170.0)
			mainmenu_anim_calcium_fulltop_pos = (78.0, 100.0)
			time = 0.01}
		mainmenu_id :se_waitprops
		mainmenu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (330.0, 75.0)
			ampzilla_anim_pos = (22.0, -160.0)
			mainmenu_anim_calcium_fulltop_pos = (85.0, 100.0)
			time = 0.01}
		mainmenu_id :se_waitprops
		mainmenu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-150.0, -178.0)
			axestone_anim_pos = (310.0, 90.0)
			ampzilla_anim_pos = (18.0, -179.0)
			mainmenu_anim_calcium_fulltop_pos = (93.0, 100.0)
			time = 0.01}
		mainmenu_id :se_waitprops
		mainmenu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)
			time = 0.01}
		mainmenu_id :se_waitprops
		repeat 1
	endif
endscript
