
script ui_init_mainmenu 
	mainmenu_populate_menu_options_global
endscript

script ui_create_mainmenu 
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	Change \{rich_presence_context = presence_menus}
	reset_song_loading_hack_global
	spawnscriptnow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	SetPlayerInfo \{1
		in_game = 0}
	SetPlayerInfo \{2
		in_game = 0}
	SetPlayerInfo \{3
		in_game = 0}
	SetPlayerInfo \{4
		in_game = 0}
	setup_sessionfuncs
	NetSessionFunc \{func = live_settings_init}
	NetSessionFunc \{func = friends_init}
	if ScriptIsRunning \{handle_signin_changed}
		mark_safe_for_shutdown
		return
	endif
	killspawnedscript \{name = persistent_band_cancel_lobby}
	spawnscriptnow \{persistent_band_cancel_lobby}
	if GotParam \{scan_dlc}
		ui_event_remove_params \{param = scan_dlc}
		ui_event_wait event = menu_change data = {
			state = UIstate_boot_download_scan controller = ($primary_controller) Force = 1
			event_params = {event = menu_back data = {state = uistate_mainmenu}}
		}
		return
	endif
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
		Change \{game_mode = career}
		NetSessionFunc \{func = RemoveAllControllers}
		fadetoblack \{off
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
		<helper_pill_id> :Obj_SpawnScriptNow sheen_highlight
		<helper_pill_id> :Obj_SpawnScriptNow sheen_highlight_bottom
		add_user_control_helper \{text = qs(0x51923839)
			button = blue
			z = 100
			all_buttons}
		<helper_pill_id> :Obj_SpawnScriptNow sheen_highlight
		<helper_pill_id> :Obj_SpawnScriptNow sheen_highlight_bottom
		LaunchEvent type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		GMan_SongFunc \{func = clear_play_list}
		UnpauseGame
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :Obj_SpawnScriptLater \{menu_set_alpha_values
			params = {
				instant = 1
				delay_frames = 1
			}}
	endif
	Change \{Current_Music_DSP_SnapShot_Setting = 'game'}
endscript

script ui_destroy_mainmenu 
	spawnscriptnow \{destroy_main_menu}
	killspawnedscript \{name = run_motd}
	killspawnedscript \{name = run_motd_demon}
	if ScreenElementExists \{id = MotdInterface}
		MotdInterface :Die
	endif
	if ScreenElementExists \{id = main_menu_select_xbox_party_warning}
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
	if GotParam \{motd_text}
		Change message_of_the_day = <motd_text>
	endif
	if GotParam \{success}
		if (<success> = success)
			if ScreenElementExists \{id = MotdInterface}
				MotdInterface :SE_SetProps \{event_handlers = [
						{
							pad_L1
							main_menu_select_motd
						}
					]
					replace_handlers}
			endif
		endif
	endif
	if ScreenElementExists \{id = MotdInterface}
		if NOT user_control_helper_exists \{button = orange}
			add_user_control_helper \{text = qs(0x3e13521a)
				button = orange
				z = 100
				all_buttons}
		endif
		LaunchEvent \{type = focus
			target = MotdInterface}
	endif
endscript

script create_motd 
	CreateScreenElement \{parent = root_window
		id = MotdInterface
		type = ContainerElement
		desc = 'motd'
		alpha = 0
		Pos = (-200.0, 600.0)
		auto_dims = false
		dims = (250.0, 250.0)}
	MotdInterface :SE_SetProps \{event_handlers = [
			{
				pad_L1
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
	MotdInterface :SE_SetProps \{img_texture = motd_image}
	SetProps \{Pos = (0.0, 0.0)}
	RunScriptOnScreenElement id = {<objID> child = demon_container} run_motd_demon
	begin
	SetProps \{Pos = (1680.0, 0.0)
		time = 10}
	SE_WaitProps
	SetProps \{Pos = (0.0, 0.0)
		time = 10}
	SE_WaitProps
	wait \{1
		second}
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
	SongGetAudioLength
	song_length = <time>
	InitSongAudioSystem
	SongSetMasterVolume \{vol = -5
		time = 0.1}
	begin
	if (<song_length> > 0)
		begin
		SongGetAudioPosition
		if (<time> > 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		begin
		SongGetAudioPosition
		if (<time> >= <song_length> || <time> = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	Change \{menu_sound_lock = true}
	musicmonitor_system_deinit
	SongUnload
	get_random_menu_song
	GMan_SongFunc \{func = clear_play_list}
	GMan_SongFunc func = set_current_song params = {song = <song>}
	if NOT preload_song song_name = <song> starttime = 0.0
		Change \{menu_sound_lock = false}
		DeInitSongAudioSystem
		return
	endif
	begin_song
	Change \{menu_sound_lock = false}
	SongGetAudioLength
	song_length = <time>
	repeat
endscript

script stop_menu_song_monitor 
	SongGetAudioLength
	song_length = <time>
	if (<song_length> > 0)
		DeInitSongAudioSystem
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
	DeInitSongAudioSystem
endscript
last_menu_song_index = -1

script get_random_menu_song 
	GetArraySize \{$menu_songs}
	if (<array_size> < 2)
		ScriptAssert \{qs(0xca3d1326)}
		return \{song = None}
	endif
	GetRandomValue name = index a = 0 b = (<array_size> -2) integer
	if (<index> = $last_menu_song_index)
		index = (<index> + 1)
	endif
	Change \{last_menu_song_index = index}
	return song = ($menu_songs [<index>])
endscript

script ui_anim_gleam \{max_interval = 5
		time = 2
		Color = [
			200
			100
			100
			255
		]
		rep = 1000}
	SetSpawnInstanceLimits \{Max = 3
		management = ignore_spawn_request}
	SE_GetProps
	Obj_GetID
	element_pos = <Pos>
	element_dims = <dims>
	<element_width> = (<element_dims>.(1.0, 0.0))
	<element_height> = (<element_dims>.(0.0, 1.0))
	CastToInteger \{element_width}
	CastToInteger \{element_height}
	begin
	start_pos = ((0.0, 0.0) + ((1.0, 0.0) * (<element_width> / 2)))
	end_pos = ((0.0, 0.0) - ((1.0, 0.0) * (<element_width> / 2)))
	mid_pos = (0.0, 0.0)
	start_dims = ((100.0, 0.0) + ((0.0, 1.0) * (<element_height> * 2.0)))
	CreateScreenElement {
		type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		rgba = <Color>
		dims = <start_dims>
		just = [center center]
		pos_anchor = [center center]
		rot_angle = 15
		alpha = 0
		Pos = <start_pos>
		blend = add
	}
	<id> :Obj_SpawnScript ui_anim_gleam_element params = {start_pos = <start_pos> mid_pos = <mid_pos> end_pos = <end_pos> time = <time>}
	GetRandomValue name = r a = 3 b = <max_interval>
	wait <r> seconds
	repeat <rep>
endscript

script ui_anim_gleam_element 
	Obj_GetID
	time = (<time> / 2.0)
	direction = Random (@ qs(0x10be1fa6) @ qs(0x815d2540) )
	switch <direction>
		case qs(0x10be1fa6)
		SE_SetProps Pos = <start_pos> alpha = 0 scale = (1.0, 1.0)
		SE_SetProps Pos = <mid_pos> alpha = 0.2 scale = (2.0, 1.0) time = <time> motion = ease_in
		SE_WaitProps
		SE_SetProps Pos = <end_pos> alpha = 0 scale = (4.0, 1.0) time = <time> motion = ease_out
		SE_WaitProps
		default
		SE_SetProps Pos = <end_pos> alpha = 0 scale = (1.0, 1.0)
		SE_SetProps Pos = <mid_pos> alpha = 0.2 scale = (2.0, 1.0) time = <time> motion = ease_in
		SE_WaitProps
		SE_SetProps Pos = <start_pos> alpha = 0 scale = (4.0, 1.0) time = <time> motion = ease_out
		SE_WaitProps
	endswitch
	DestroyScreenElement id = <objID>
endscript
