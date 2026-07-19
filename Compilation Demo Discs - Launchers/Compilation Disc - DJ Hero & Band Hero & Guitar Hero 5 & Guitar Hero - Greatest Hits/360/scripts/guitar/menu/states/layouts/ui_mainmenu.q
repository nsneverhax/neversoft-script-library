keep_loading_screen = 0

script ui_create_mainmenu 
	spawnscriptnow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	SetScriptCannotPause
	if ScriptIsRunning \{handle_signin_changed}
		mark_safe_for_shutdown
		return
	endif
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = main_menu_signin_changed}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'
			channel = DEMOLAUNCHER}
		change \{in_join_band_screens = 0}
		change \{game_mode = p1_quickplay}
		change \{current_num_players = 1}
		NetSessionFunc \{func = RemoveAllControllers}
		fadetoblack \{off
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
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 100
			all_buttons}
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{type = focus
				target = current_menu}
		endif
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		reset_quickplay_song_list
		UnPauseGame
		if ($keep_loading_screen = 1)
			create_loading_screen
			frontend_load_soundcheck \{async = 0}
			change \{keep_loading_screen = 0}
		else
			frontend_load_soundcheck \{loadingscreen
				async = 0}
		endif
		destroy_band
		destroy_bandname_viewport
		LaunchEvent \{type = mainmenu_invite_finished
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
		change \{initial_main_menu_anim = 0}
	else
		menu_transition_in \{menu = current_menu_anchor}
	endif
endscript

script ui_mainmenu_anim_in_spawned 
	SE_GetProps \{main_menu_bg_scale}
	<org_scale> = <main_menu_bg_scale>
	SE_GetProps \{main_menu_bg_pos}
	<org_pos> = <main_menu_bg_pos>
	Wait \{0.0
		seconds}
	ui_fx_set_blur \{amount = 0.8
		time = 0.0}
	SE_SetProps \{main_menu_bg_scale = 1.4}
	Wait \{0.08
		seconds}
	SE_SetProps main_menu_bg_pos = (<org_pos> + (50.0, 20.0))
	Wait \{0.08
		seconds}
	SE_SetProps \{main_menu_bg_scale = 1.2}
	Wait \{0.08
		seconds}
	SE_SetProps main_menu_bg_scale = <org_scale>
	SE_SetProps main_menu_bg_pos = <org_pos>
	ui_fx_set_blur \{amount = 0.0
		time = 0.4}
endscript

script bg_swap 
	SetScriptCannotPause
	begin
	SE_SetProps \{main_menu_bg_2_alpha = 0}
	Wait \{0.7
		seconds
		ignoreslomo}
	SE_SetProps \{main_menu_bg_2_alpha = 1}
	Wait \{0.7
		seconds
		ignoreslomo}
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
	spawnscriptnow \{destroy_main_menu}
	KillSpawnedScript \{name = ui_mainmenu_anim_in_spawned}
	KillSpawnedScript \{name = create_modt}
	KillSpawnedScript \{name = run_motd}
	KillSpawnedScript \{name = run_motd_demon}
	if ScreenElementExists \{id = MotdInterface}
		MotdInterface :Die
	endif
endscript

script main_menu_signin_changed 
	printf \{qs("\Lmain_menu_signin_changed")}
	RemoveContentFiles playerid = <controller>
	reset_globaltags savegame = <controller>
	cheat_turnoffalllocked
	MonitorControllerStates
endscript

script callback_motd 
	return
	if GotParam \{motd_text}
		change \{retrieved_message_of_the_day = 1}
		change message_of_the_day = <motd_text>
	endif
	if GotParam \{success}
		if (<success> = success)
			if ScreenElementExists \{id = MotdInterface}
				add_user_control_helper \{text = qs("DAILY MESSAGE")
					button = Yellow
					z = 100
					all_buttons}
				LaunchEvent \{type = focus
					target = MotdInterface}
			endif
		endif
	endif
endscript

script create_motd 
	return
	CreateScreenElement \{parent = root_window
		id = MotdInterface
		type = ContainerElement}
	if IsPs3
		event_handlers = [
			{pad_option2 generic_event_choose params = {state = UIstate_motd}}
			{pad_option generic_event_choose params = {state = UIstate_motd}}
		]
	else
		event_handlers = [
			{pad_option2 generic_event_choose params = {state = UIstate_motd}}
		]
	endif
	MotdInterface :SE_SetProps {
		event_handlers = <event_handlers>
	}
	NetSessionFunc \{obj = motd
		func = get_demonware_motd
		params = {
			callback = callback_motd
		}}
endscript
main_menu_fs = {
	create = ui_mainmenu_temp
	destroy = destroy_main_menu
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
