0x61bee052 = 0

script ui_create_mainmenu 
	spawnscriptnow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	setscriptcannotpause
	if scriptisrunning \{handle_signin_changed}
		mark_safe_for_shutdown
		return
	endif
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = main_menu_signin_changed}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'
			channel = 0x37807f54}
		change \{in_join_band_screens = 0}
		change \{game_mode = p1_quickplay}
		change \{current_num_players = 1}
		netsessionfunc \{func = removeallcontrollers}
		fadetoblack \{off
			alpha = 1.0
			time = 0.1
			z_priority = 100
			no_wait}
		clean_up_user_control_helpers
		if NOT screenelementexists \{id = current_menu}
			frontend_load_soundcheck \{loadingscreen}
			create_main_menu_elements
		endif
		create_main_menu
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100
			all_buttons}
		if screenelementexists \{id = current_menu}
			launchevent \{type = focus
				target = current_menu}
		endif
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		reset_quickplay_song_list
		unpausegame
		if ($0x61bee052 = 1)
			create_loading_screen
			frontend_load_soundcheck \{async = 0}
			change \{0x61bee052 = 0}
		else
			frontend_load_soundcheck \{loadingscreen
				async = 0}
		endif
		destroy_band
		destroy_bandname_viewport
		launchevent \{type = mainmenu_invite_finished
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
		if screenelementexists \{id = current_menu_anchor}
			break
		endif
		wait \{1
			gameframe}
		repeat
		change \{initial_main_menu_anim = 0}
	else
		menu_transition_in \{menu = current_menu_anchor}
	endif
endscript

script ui_mainmenu_anim_in_spawned 
	se_getprops \{main_menu_bg_scale}
	<org_scale> = <main_menu_bg_scale>
	se_getprops \{main_menu_bg_pos}
	<org_pos> = <main_menu_bg_pos>
	wait \{0.0
		seconds}
	ui_fx_set_blur \{amount = 0.8
		time = 0.0}
	se_setprops \{main_menu_bg_scale = 1.4}
	wait \{0.08
		seconds}
	se_setprops main_menu_bg_pos = (<org_pos> + (50.0, 20.0))
	wait \{0.08
		seconds}
	se_setprops \{main_menu_bg_scale = 1.2}
	wait \{0.08
		seconds}
	se_setprops main_menu_bg_scale = <org_scale>
	se_setprops main_menu_bg_pos = <org_pos>
	ui_fx_set_blur \{amount = 0.0
		time = 0.4}
endscript

script bg_swap 
	setscriptcannotpause
	begin
	se_setprops \{main_menu_bg_2_alpha = 0}
	wait \{0.7
		seconds
		ignoreslomo}
	se_setprops \{main_menu_bg_2_alpha = 1}
	wait \{0.7
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
	killspawnedscript \{name = ui_mainmenu_anim_in_spawned}
	killspawnedscript \{name = create_modt}
	killspawnedscript \{name = run_motd}
	killspawnedscript \{name = run_motd_demon}
	if screenelementexists \{id = motdinterface}
		motdinterface :die
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
	return
	if gotparam \{motd_text}
		change \{retrieved_message_of_the_day = 1}
		change message_of_the_day = <motd_text>
	endif
	if gotparam \{success}
		if (<success> = success)
			if screenelementexists \{id = motdinterface}
				add_user_control_helper \{text = qs(0x789d1099)
					button = yellow
					z = 100
					all_buttons}
				launchevent \{type = focus
					target = motdinterface}
			endif
		endif
	endif
endscript

script create_motd 
	return
	createscreenelement \{parent = root_window
		id = motdinterface
		type = containerelement}
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
	netsessionfunc \{obj = motd
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
