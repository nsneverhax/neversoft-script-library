
script ui_create_mainmenu 
	spawnscriptnow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	if scriptisrunning \{handle_signin_changed}
		mark_safe_for_shutdown
		return
	endif
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = main_menu_signin_changed}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
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
		current_menu :obj_spawnscriptnow \{create_motd}
		launchevent type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		reset_quickplay_song_list
		unpausegame
		frontend_load_soundcheck \{loadingscreen
			async = 0}
		z_soundcheck_uiresetpos
	endif
endscript

script ui_destroy_mainmenu 
	spawnscriptnow \{destroy_main_menu}
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
				motdinterface :se_setprops text_text = ($motd_header)
			endif
			if screenelementexists \{id = {
						motdinterface
						child = motd_container
					}}
				add_user_control_helper \{text = qs(0x789d1099)
					button = yellow
					z = 100
					all_buttons}
				runscriptonscreenelement \{id = {
						motdinterface
						child = motd_container
					}
					run_motd}
				launchevent \{type = focus
					target = motdinterface}
			endif
		endif
	endif
endscript

script create_motd 
	netsessionfunc \{obj = motd
		func = get_demonware_motd
		params = {
			callback = motd_callback
		}}
	createscreenelement {
		parent = root_window
		id = motdinterface
		type = descinterface
		desc = 'motd'
		text_text = ($motd_header)
		pos = (-200.0, 600.0)
		auto_dims = false
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
	netsessionfunc \{obj = motd
		func = get_demonware_motd
		params = {
			callback = callback_motd
		}}
endscript

script run_motd 
	return
	obj_getid
	motdinterface :se_setprops \{img_texture = motd_download_image}
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
