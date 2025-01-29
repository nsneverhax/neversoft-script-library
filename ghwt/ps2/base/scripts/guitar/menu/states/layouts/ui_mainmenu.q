
script ui_create_mainmenu 
	SpawnScriptNow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	randomize
	if ScriptIsRunning \{handle_signin_changed}
		mark_safe_for_shutdown
		return
	endif
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	if ($invite_controller = -1)

		Change \{in_join_band_screens = 0}
		Change \{game_mode = p1_quickplay}
		Change \{current_num_players = 1}
		NetSessionFunc \{func = removeallcontrollers}
		fadetoblack \{OFF
			alpha = 1.0
			time = 0.1
			z_priority = 100
			no_wait}
		clean_up_user_control_helpers
		if NOT ScreenElementExists \{id = current_menu}
			frontend_load_soundcheck \{loadingscreen}
			create_main_menu_elements
		endif
		create_main_menu
		0x7ab6609c
		current_menu :obj_spawnscript \{0xedb53378}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100
			all_buttons}
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else

		reset_quickplay_song_list
		UnPauseGame
		frontend_load_soundcheck \{loadingscreen
			async = 0}
		z_soundcheck_uiresetpos
	endif
endscript

script ui_destroy_mainmenu 
	SpawnScriptNow \{destroy_main_menu}
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

script 0x727cba2a \{speed = 1.0
		Pause = 1.0}
	Obj_SpawnScriptNow 0x0b432c29 params = {<...>}
endscript

script 0x0b432c29 
	Obj_GetID
	Obj_SetPosition position = <0x850ef603>
	Obj_MoveToPos position = <start> 0x7ad7599c = <0x7ad7599c>
	Obj_WaitMove
	begin
	if NOT CompositeObjectExists <objID>
		break
	endif
	Obj_MoveToPos (<end>) time = <speed>
	Obj_WaitMove
	Wait <Pause> Seconds
	if NOT CompositeObjectExists <objID>
		break
	endif
	Obj_MoveToPos (<start>) time = <speed>
	Obj_WaitMove
	Wait <Pause> Seconds
	repeat
endscript

script 0xdaf0a97b 
	Obj_MoveToPos (<Pos>) time = <speed>
	Obj_WaitMove
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
	setplayerinfo <Player> controller = (<0x56444e32> [<i>])
	Player = (<Player> + 1)
	if (<Player> = 5)
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript
