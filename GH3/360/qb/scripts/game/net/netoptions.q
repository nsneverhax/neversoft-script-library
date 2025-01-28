default_master_servers = [
	{
		name = '205.147.4.17'
	}
	{
		name = '63.241.179.8'
	}
	{
		name = '205.147.28.3'
	}
]
default_network_preferences = {
	game_type = {
		ui_string = "Faceoff"
		checksum = p2_faceoff
	}
	num_players = {
		ui_string = "2 Players"
		checksum = num_2
		value = 2
	}
	private_slots = {
		ui_string = "0 Players"
		checksum = num_0
		value = 0
	}
	ranked = {
		ui_string = "Player"
		checksum = player
		value = 1
	}
	num_observers = {
		ui_string = "No Observers"
		checksum = num_1
		value = 1
	}
	team_mode = {
		ui_string = "None"
		checksum = teams_none
	}
	password = {
		ui_string = ""
	}
	level = {
		ui_string = "Houses"
		checksum = load_z_houses
	}
	server_name = {
		ui_string = "Neversoft"
	}
	network_id = {
		ui_string = "Guitar Hero 3"
	}
	ip_address = {
		ui_string = "192.168.0.10"
	}
	gateway = {
		ui_string = "192.168.0.1"
	}
	subnet_mask = {
		ui_string = "255.255.0.0"
	}
	auto_dns = {
		ui_string = "Yes"
		checksum = boolean_true
	}
	dns_server = {
		ui_string = "192.168.0.1"
	}
	dns_server2 = {
		ui_string = "192.168.0.2"
	}
	device_type = {
		ui_string = "None"
		checksum = device_none
	}
	broadband_type = {
		ui_string = "Auto-Detect (DHCP)"
		checksum = ip_dhcp
	}
	host_name = {
		ui_string = ""
	}
	domain_name = {
		ui_string = ""
	}
	skill_level = {
		ui_string = "3: Hold My Own"
		checksum = num_3
	}
	use_default_master_servers = {
		ui_string = "Yes"
		checksum = boolean_true
	}
	show_names = {
		ui_string = "On"
		checksum = boolean_true
	}
	buddy_array = [
	]
}

script launch_network_options_menu 
	runscriptonscreenelement \{id = current_menu_anchor
		menu_offscreen
		callback = create_network_options_menu}
endscript

script back_from_net_options_menu 
	go_to_sub_menu = 0
	pausemusicandstreams
	if istrue \{$innetoptionsfromnetplay}
		printf \{"********************* InNetOptionsFromNetPlay *******************"}
		go_to_sub_menu = 1
	else
		if istrue \{$innetoptionsfromfacedownload}
			printf \{"********************* InNetOptionsFromFaceDownload *******************"}
			go_to_sub_menu = 1
		endif
	endif
	if (<go_to_sub_menu> = 1)
		getpreferencechecksum \{pref_type = network
			device_type}
		switch <checksum>
			case device_none
			if istrue \{$innetoptionsfromnetplay}
				create_ss_menu
			else
				face_back_from_net_setup
			endif
			default
			if objectexists \{id = current_menu_anchor}
				destroyscreenelement \{id = current_menu_anchor}
			endif
			if istrue \{$innetoptionsfromnetplay}
				do_network_setup \{error_script = back_from_startup_error_dialog
					success_script = net_setup_from_net_play_successful
					need_setup_script = create_net_startup_need_setup_dialog}
			else
				do_network_setup \{error_script = face_back_from_net_setup
					success_script = create_face_download_menu_from_net_setup
					need_setup_script = face_create_net_startup_need_setup_dialog}
			endif
		endswitch
		change \{innetoptionsfromnetplay = 0}
		change \{innetoptionsfromfacedownload = 0}
		unpausemusicandstreams
	else
		unpausemusicandstreams
	endif
endscript

script net_options_menu_back_from_keyboard 
	destroy_onscreen_keyboard
	create_network_options_menu
endscript

script maybe_load_net_settings 
	skater :hide
	launch_load_network_settings
endscript

script launch_load_net_config 
	runscriptonscreenelement \{id = current_menu_anchor
		menu_offscreen
		callback = _creationoptionsloadnetconfig}
endscript

script back_from_hardware_setup_refused_dialog 
	dialog_box_exit
	create_manual_net_setup
endscript

script back_from_load_refused_dialog 
	dialog_box_exit
	create_network_options_menu
endscript

script launch_hardware_setup_refused_dialog 
	runscriptonscreenelement \{id = current_menu_anchor
		menu_offscreen
		callback = create_hardware_setup_refused_dialog}
endscript

script create_hardware_setup_refused_dialog 
	create_dialog_box \{title = net_notice_msg
		text = net_error_cant_change_device
		buttons = [
			{
				text = "ok"
				pad_choose_script = back_from_hardware_setup_refused_dialog
			}
		]}
endscript

script create_net_load_refused_dialog 
	create_dialog_box \{title = net_notice_msg
		text = net_error_cant_load_settings
		buttons = [
			{
				text = "back"
				pad_choose_script = back_from_load_refused_dialog
			}
			{
				text = "restart"
				pad_choose_script = restart_ps2
			}
		]}
endscript

script launch_hardware_setup 
	runscriptonscreenelement \{id = current_menu_anchor
		menu_offscreen
		callback = create_hardware_setup_menu}
endscript

script launch_connection_settings 
	if objectexists \{id = current_menu_anchor}
		runscriptonscreenelement \{id = current_menu_anchor
			menu_offscreen
			callback = create_connection_settings}
	else
		dialog_box_exit
		create_connection_settings
	endif
endscript

script back_from_startup_error_dialog 
	printf \{"**** in back_from_startup_error_dialog"}
	netsessionfunc \{func = match_uninit}
	netsessionfunc \{func = content_uninit}
	netsessionfunc \{func = presence_uninit}
	netsessionfunc \{func = stats_uninit}
	change \{needstodownloadstats = 1}
	unpausemusicandstreams
	dialog_box_exit
	if objectexists \{id = select_skater_anchor}
		destroyscreenelement \{id = select_skater_anchor}
		restore_start_key_binding
	endif
	skater :cancelrotatedisplay
	create_main_menu
endscript

script create_net_startup_error_dialog 
	create_dialog_box {title = net_error_msg
		text = <text>
		buttons = [{text = "ok" pad_choose_script = <error_script>}
		]
	}
endscript
