
script ui_init_mainmenu 
	mainmenu_populate_menu_options_global
endscript

script ui_create_mainmenu 
	SpawnScriptNow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	randomize
	reset_focus_colors
	setscriptcannotpause
	if ScriptIsRunning \{handle_signin_changed}
		mark_safe_for_shutdown
		return
	endif
	anim_paks_set_state \{state = FrontEnd
		async = 0}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	if ($invite_controller = -1)

		SpawnScriptNow \{task_menu_default_anim_in
			params = {
				base_name = 'band_hub'
			}}
		Change \{in_join_band_screens = 0}
		Change \{game_mode = p1_quickplay}
		Change \{current_num_players = 1}
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
		0x7ab6609c
		current_menu :obj_spawnscript \{0xedb53378}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100
			all_buttons}
		add_user_control_helper \{text = qs(0x8a778398)
			button = yellow
			z = 100
			all_buttons}
		if ScreenElementExists \{id = current_menu}
			current_menu :Obj_SpawnScriptNow \{create_motd}
			LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
			current_menu_anchor :Obj_SpawnScriptNow \{ui_mainmenu_anim_in_spawned}
		endif
		destroy_loading_screen
	else

		reset_quickplay_song_list
		UnPauseGame
		destroy_band
		destroy_bandname_viewport
	endif
endscript

script ui_destroy_mainmenu 
	SpawnScriptNow \{destroy_main_menu}
	KillSpawnedScript \{Name = ui_mainmenu_anim_in_spawned}
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	if ScreenElementExists \{id = current_menu_anchor}
		current_menu_anchor :se_setprops \{main_menu_bg_scale = $0xa3535721}
		current_menu_anchor :se_setprops \{main_menu_bg_pos = $0xdf0fad32}
	endif
endscript

script main_menu_signin_changed 

	removecontentfiles playerid = <controller>
	reset_globaltags savegame = <controller>
	cheat_turnoffalllocked
	monitorcontrollerstates
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

script 0xedb53378 
	GetActiveControllers
	0x3ee68127 = <active_controllers>
	begin
	GetActiveControllers
	if NOT 0xf7f68612 array1 = <active_controllers> array2 = <0x3ee68127>
		0x7ab6609c
		0x3ee68127 = <active_controllers>
	endif
	Wait \{3
		gameframes}
	repeat
endscript

script 0x7ab6609c 
	GetActiveControllers
	GetArraySize <active_controllers>
	if ($primary_controller < <array_Size> && $primary_controller > 0)
		SetArrayElement ArrayName = active_controllers index = ($primary_controller) NewValue = 0
	endif
	0x30a3fc6b = [0 0 0 0]
	Player = 2
	begin
	getplayerinfo <Player> controller
	if ((<controller> >= 0) && (<controller> < 8))
		if ((<active_controllers> [<controller>]) = 1)
			SetArrayElement ArrayName = active_controllers index = <controller> NewValue = 0
			SetArrayElement ArrayName = 0x30a3fc6b index = (<Player> - 1) NewValue = 1
		endif
	endif
	Player = (<Player> + 1)
	repeat 3
	0x56444e32 = []
	i = 0
	begin
	if ((<active_controllers> [<i>]) = 1)
		AddArrayElement array = <0x56444e32> element = <i>
		<0x56444e32> = <array>
	endif
	i = (<i> + 1)
	repeat <array_Size>

	GetArraySize <0x56444e32>
	if (<array_Size> = 0)
		return
	endif
	Player = 2
	i = 0
	begin
	if ((<0x30a3fc6b> [(<Player> - 1)]) = 0)
		setplayerinfo <Player> controller = (<0x56444e32> [<i>])
		i = (<i> + 1)
	endif
	Player = (<Player> + 1)
	if (<i> >= <array_Size>)
		break
	endif
	repeat 3
endscript

script 0x768a0243 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100
		all_buttons}
	add_user_control_helper \{text = qs(0x8a778398)
		button = yellow
		z = 100
		all_buttons}
endscript
