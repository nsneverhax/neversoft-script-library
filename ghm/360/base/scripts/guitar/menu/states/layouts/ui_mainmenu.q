
script ui_create_mainmenu 
	SpawnScriptNow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	setscriptcannotpause
	if ScriptIsRunning \{handle_signin_changed}
		mark_safe_for_shutdown
		return
	endif
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
		SpawnScriptNow \{task_menu_default_anim_in
			params = {
				base_name = 'band_hub'
			}}
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
		if ScreenElementExists \{id = current_menu}
			current_menu :Obj_SpawnScriptNow \{create_motd}
			LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
			current_menu_anchor :Obj_SpawnScriptNow \{ui_mainmenu_anim_in_spawned}
		endif
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		reset_quickplay_song_list
		UnPauseGame
		frontend_load_soundcheck \{loadingscreen
			async = 0}
		destroy_band
		destroy_bandname_viewport
		LaunchEvent \{Type = mainmenu_invite_finished
			broadcast}
	endif
endscript
initial_main_menu_anim = 1

script ui_mainmenu_anim_in 
	if NOT ($invite_controller = -1)
		return
	endif
	if ($initial_main_menu_anim = 1)
		begin
		if ScreenElementExists \{id = current_menu_anchor}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		Change \{initial_main_menu_anim = 0}
	else
		menu_transition_in \{menu = current_menu_anchor}
	endif
endscript

script ui_mainmenu_anim_in_spawned 
	se_getprops \{main_menu_bg_scale}
	<org_scale> = <main_menu_bg_scale>
	se_getprops \{main_menu_bg_pos}
	<org_pos> = <main_menu_bg_pos>
	<Scale> = Random (@ 1.65 @ 1 @ 1.4499999 @ 1.56 @ 1.49 )
	a = Random (@ 0.0 @ 0.5 @ 1 @ 1.23 @ 0.8 @ 1.6 )
	b = Random (@ 10 @ 6 @ 2 @ 7 @ 1 )
	begin
	Wait \{0.0
		Seconds}
	ui_fx_set_blur amount = <a> time = 0.0
	se_setprops main_menu_bg_scale = <Scale>
	se_setprops \{main_menu_skull_scale = 1.6700001}
	se_setprops \{main_menu_skull_pos = (980.41223, 249.8943)}
	Wait \{0.08
		Seconds}
	ui_fx_set_blur amount = <a> time = 0.4
	se_setprops main_menu_bg_pos = (<org_pos> + (1.0, 1.0) * <b>)
	Wait \{0.08
		Seconds}
	se_setprops main_menu_bg_scale = <Scale>
	se_setprops main_menu_bg_pos = (<org_pos> + (1.0, 1.0) * <b>)
	se_setprops \{main_menu_skull_scale = 1.72}
	Wait \{0.08
		Seconds}
	se_setprops main_menu_bg_scale = <org_scale>
	se_setprops \{main_menu_skull_pos = (1018.206, 251.45679)}
	se_setprops \{main_menu_skull_scale = 1.6
		1.66}
	se_setprops main_menu_bg_pos = <org_pos>
	ui_fx_set_blur amount = <a> time = 0.4
	Wait \{0.08
		Seconds}
	se_setprops main_menu_bg_scale = <Scale>
	Wait \{0.08
		Seconds}
	se_setprops \{main_menu_skull_scale = 1.5
		1.55}
	ui_fx_set_blur \{amount = 0.0
		time = 0.2}
	se_setprops \{main_menu_skull_pos = (980.41223, 249.8943)}
	se_setprops main_menu_bg_scale = <org_scale>
	se_setprops main_menu_bg_pos = <org_pos>
	r = Random (@ 5 @ 7 @ 8 @ 6 @ 10 )
	Wait <r> Seconds
	repeat
endscript

script ui_mainmenu_anim_in_spawned_cleanup 
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
endscript

script ui_mainmenu_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script ui_destroy_mainmenu 
	SpawnScriptNow \{destroy_main_menu}
	KillSpawnedScript \{Name = ui_mainmenu_anim_in_spawned}
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
				add_user_control_helper \{text = qs(0x789d1099)
					button = yellow
					z = 100
					all_buttons}
				LaunchEvent \{Type = focus
					target = motdinterface}
			endif
		endif
	endif
endscript

script create_motd 
	CreateScreenElement \{parent = root_window
		id = motdinterface
		Type = ContainerElement}
	if isps3
		event_handlers = [
			{pad_option2 generic_event_choose params = {state = uistate_motd}}
			{pad_option generic_event_choose params = {state = uistate_motd}}
		]
	else
		event_handlers = [
			{pad_option2 generic_event_choose params = {state = uistate_motd}}
		]
	endif
	motdinterface :se_setprops {
		event_handlers = <event_handlers>
	}
	NetSessionFunc \{Obj = motd
		func = get_demonware_motd
		params = {
			callback = callback_motd
		}}
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
