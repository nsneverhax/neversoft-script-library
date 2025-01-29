
script ui_create_mainmenu 
	SpawnScriptNow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	if ScriptIsRunning \{handle_signin_changed}
		mark_safe_for_shutdown
		return
	endif
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
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
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100
			all_buttons}
		current_menu :Obj_SpawnScriptNow \{create_motd}
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		reset_quickplay_song_list
		UnPauseGame
		frontend_load_soundcheck \{loadingscreen
			async = 0}
		z_soundcheck_uiresetpos
	endif
endscript

script ui_destroy_mainmenu 
	SpawnScriptNow \{destroy_main_menu}
	KillSpawnedScript \{Name = create_modt}
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
	cheat_turnoffalllocked
	monitorcontrollerstates
endscript

script callback_motd 
	if GotParam \{motd_text}
		Change \{retrieved_message_of_the_day = 1}
		Change message_of_the_day = <motd_text>
	endif
	if GotParam \{success}
		if (<success> = success)
			if ScreenElementExists \{id = motdinterface}
				motdinterface :se_setprops text_text = ($motd_header)
			endif
			if ScreenElementExists \{id = {
						motdinterface
						child = motd_container
					}}
				add_user_control_helper \{text = qs(0x789d1099)
					button = yellow
					z = 100
					all_buttons}
				RunScriptOnScreenElement \{id = {
						motdinterface
						child = motd_container
					}
					run_motd}
				LaunchEvent \{Type = focus
					target = motdinterface}
			endif
		endif
	endif
endscript

script create_motd 
	NetSessionFunc \{Obj = motd
		func = get_demonware_motd
		params = {
			callback = motd_callback
		}}
	CreateScreenElement {
		parent = root_window
		id = motdinterface
		Type = descinterface
		desc = 'motd'
		text_text = ($motd_header)
		Pos = (-200.0, 600.0)
		auto_dims = FALSE
		dims = (250.0, 250.0)
	}
	motdinterface :se_setprops \{event_handlers = [
			{
				pad_option2
				generic_event_choose
				params = {
					state = uistate_motd
				}
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
	motdinterface :se_setprops \{img_texture = motd_download_image}
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
