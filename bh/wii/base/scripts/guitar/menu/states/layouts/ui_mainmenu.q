
script ui_init_mainmenu 
	mainmenu_populate_menu_options_global
endscript
in_main_menu = 0

script ui_create_mainmenu 
	reset_song_loading_hack_global
	enable_crowd_models_cfunc \{Active = true}
	SpawnScriptNow ui_create_mainmenu_spawned params = <...>
	SpawnScriptNow \{menu_music_fade
		params = {
			time = 8.160001
			in
		}}
endscript

script ui_create_mainmenu_spawned 
	0xcb0276c2 \{load = true}
	Change \{0xbc64bd01 = FALSE}
	setplayerinfo \{1
		in_game = 0}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	sd_unload_song
	setup_sessionfuncs
	NetSessionFunc \{func = live_settings_init}
	NetSessionFunc \{func = friends_init}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	Change \{in_main_menu = 1}
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	SpawnScriptNow \{persistent_band_cancel_lobby}
	edit_graphic_prepare_sprite_infos
	generatecagtexture info_array = <sprite_infos> test = 0 slow_path = 1
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	SpawnScriptNow \{persistent_band_cancel_lobby}
	lightshow_notingameplay_setmood \{mood = climax}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
		Change \{game_mode = career}
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
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		gman_songfunc \{func = clear_play_list}
		UnPauseGame
		frontend_load_soundcheck \{loadingscreen
			async = 0}
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :Obj_SpawnScriptLater \{0xcf273e4e
			params = {
				instant = 1
				0x27101ef8 = 1
			}}
	endif
	Change \{current_music_dsp_snapshot_setting = 'game'}
	if ($freestyle_just_exited = true)
		Change \{freestyle_just_exited = FALSE}
		destroy_loading_screen
	endif
	cancel_ds_operation
	0x61906aac
endscript

script ui_destroy_mainmenu 
	Change \{in_main_menu = 0}
	SpawnScriptNow \{destroy_main_menu}
	KillSpawnedScript \{Name = run_motd}
	KillSpawnedScript \{Name = run_motd_demon}
	if ScreenElementExists \{id = motdinterface}
		motdinterface :Die
	endif
endscript

script main_menu_signin_changed 
	printf \{qs(0x283e65d1)}
	removecontentfiles playerid = <controller>
	reset_globaltags savegame = <controller>
endscript

script callback_motd 
	if GotParam \{success}
		if (<success> = success)
			if ScreenElementExists \{id = mainmenu_id}
				mainmenu_id :GetSingleTag \{motd_id}
				<motd_id> :se_setprops {
					event_handlers = [
						{pad_choose main_menu_select_motd}
						{focus mainmenu_item_focus}
						{unfocus mainmenu_item_unfocus}
					]
					replace_handlers
					focusable
					tags = {
						menu_item = motd
					}
				}
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
main_menu_fs = {
	create = ui_mainmenu_temp
	Destroy = destroy_main_menu
	actions = [
		{
			action = select_xbox_live
			flow_state = online_signin_fs
		}
	]
}

script ui_mainmenu_temp 
	ui_event \{event = menu_refresh}
endscript

script 0x206fbd50 \{0x971c66e7 = 5
		time = 2
		Color = [
			200
			100
			100
			255
		]
		0x1f44740d = 1000}
	SetSpawnInstanceLimits \{Max = 3
		management = ignore_spawn_request}
	se_getprops
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
		Type = SpriteElement
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
	<id> :obj_spawnscript 0x7ccd2f00 params = {start_pos = <start_pos> mid_pos = <mid_pos> end_pos = <end_pos> time = <time>}
	GetRandomValue Name = r a = 3 b = <0x971c66e7>
	Wait <r> Seconds
	repeat <0x1f44740d>
endscript

script 0x7ccd2f00 
	Obj_GetID
	time = (<time> / 2.0)
	direction = Random (@ qs(0x10be1fa6) @ qs(0x815d2540) )
	switch <direction>
		case qs(0x10be1fa6)
		se_setprops Pos = <start_pos> alpha = 0 Scale = (1.0, 1.0)
		se_setprops Pos = <mid_pos> alpha = 0.2 Scale = (2.0, 1.0) time = <time> motion = ease_in
		se_waitprops
		se_setprops Pos = <end_pos> alpha = 0 Scale = (4.0, 1.0) time = <time> motion = ease_out
		se_waitprops
		default
		se_setprops Pos = <end_pos> alpha = 0 Scale = (1.0, 1.0)
		se_setprops Pos = <mid_pos> alpha = 0.2 Scale = (2.0, 1.0) time = <time> motion = ease_in
		se_waitprops
		se_setprops Pos = <start_pos> alpha = 0 Scale = (4.0, 1.0) time = <time> motion = ease_out
		se_waitprops
	endswitch
	DestroyScreenElement id = <objID>
endscript
