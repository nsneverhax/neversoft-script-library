default_master_servers = [
	{
		Name = '205.147.4.17'
	}
	{
		Name = '63.241.179.8'
	}
	{
		Name = '205.147.28.3'
	}
]
0x878cb88f = {
	0xa36dbee1 = {
		ui_string = qs(0x7b57fa09)
	}
	0xbeea3518 = {
		ui_string = qs(0x87956b0a)
	}
	0x0e5fd359 = {
		ui_string = qs(0xd73d017a)
	}
	0x4525adbd = {
		ui_string = qs(0x9c4010d1)
	}
}
default_network_id = qs(0xd9fe6293)
default_server_id = qs(0x0978b483)
default_game_type = p2_faceoff
default_network_preferences = {
	game_type = {
		ui_string = qs(0xe570140f)
		checksum = p2_faceoff
	}
	num_players = {
		ui_string = qs(0x4c392898)
		checksum = num_2
		value = 2
	}
	private_slots = {
		ui_string = qs(0x49ed431b)
		checksum = num_0
		value = 0
	}
	Ranked = {
		ui_string = qs(0xc14e9741)
		checksum = Player
		value = 1
	}
	num_observers = {
		ui_string = qs(0xa899535c)
		checksum = num_1
		value = 1
	}
	team_mode = {
		ui_string = qs(0x3f1bbbb1)
		checksum = teams_none
	}
	password = {
		ui_string = qs(0x03ac90f0)
	}
	level = {
		ui_string = qs(0x601c9ab6)
		checksum = load_z_houses
	}
	server_name = {
		ui_string = qs(0x0978b483)
	}
	network_id = {
		ui_string = qs(0xd9fe6293)
	}
	ip_address = {
		ui_string = qs(0x9c9cea36)
	}
	gateway = {
		ui_string = qs(0x57c03993)
	}
	subnet_mask = {
		ui_string = qs(0x7fc2a6b5)
	}
	auto_dns = {
		ui_string = qs(0xd952fb50)
		checksum = 0x0d1ed568
	}
	dns_server = {
		ui_string = qs(0x57c03993)
	}
	dns_server2 = {
		ui_string = qs(0x5a49391a)
	}
	device_type = {
		ui_string = qs(0x3f1bbbb1)
		checksum = device_none
	}
	broadband_type = {
		ui_string = qs(0x40bb1554)
		checksum = 0xa1f95de6
	}
	host_name = {
		ui_string = qs(0x03ac90f0)
	}
	domain_name = {
		ui_string = qs(0x03ac90f0)
	}
	skill_level = {
		ui_string = qs(0x2ca1a2e8)
		checksum = num_3
	}
	use_default_master_servers = {
		ui_string = qs(0xe20452d6)
		checksum = boolean_true
	}
	show_names = {
		ui_string = qs(0xd8c7024a)
		checksum = boolean_true
	}
	buddy_array = [
	]
}

script launch_network_options_menu 
	RunScriptOnScreenElement \{id = current_menu_anchor
		menu_offscreen
		callback = create_network_options_menu}
endscript

script back_from_net_options_menu 
	go_to_sub_menu = 0
	PauseMusicAndStreams
	if IsTrue \{$InNetOptionsFromNetPlay}

		go_to_sub_menu = 1
	else
		if IsTrue \{$InNetOptionsFromFaceDownload}

			go_to_sub_menu = 1
		endif
	endif
	if (<go_to_sub_menu> = 1)
		GetPreferenceChecksum \{pref_type = network
			device_type}
		switch <checksum>
			case device_none
			if IsTrue \{$InNetOptionsFromNetPlay}
				create_ss_menu
			else
				face_back_from_net_setup
			endif
			default
			if ObjectExists \{id = current_menu_anchor}
				DestroyScreenElement \{id = current_menu_anchor}
			endif
			if IsTrue \{$InNetOptionsFromNetPlay}
				do_network_setup \{error_script = back_from_startup_error_dialog
					success_script = net_setup_from_net_play_successful
					need_setup_script = create_net_startup_need_setup_dialog}
			else
				do_network_setup \{error_script = face_back_from_net_setup
					success_script = create_face_download_menu_from_net_setup
					need_setup_script = face_create_net_startup_need_setup_dialog}
			endif
		endswitch
		Change \{InNetOptionsFromNetPlay = 0}
		Change \{InNetOptionsFromFaceDownload = 0}
		UnpauseMusicAndStreams
	else
		UnpauseMusicAndStreams
	endif
endscript

script net_options_menu_back_from_keyboard 
	destroy_onscreen_keyboard
	create_network_options_menu
endscript

script maybe_load_net_settings 
	skater :Hide
	launch_load_network_settings
endscript

script launch_load_net_config 
	RunScriptOnScreenElement \{id = current_menu_anchor
		menu_offscreen
		callback = _CreationOptionsLoadNetConfig}
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
	RunScriptOnScreenElement \{id = current_menu_anchor
		menu_offscreen
		callback = create_hardware_setup_refused_dialog}
endscript

script create_hardware_setup_refused_dialog 
	create_dialog_box \{title = net_notice_msg
		text = net_error_cant_change_device
		buttons = [
			{
				text = qs(0x0e41fe46)
				pad_choose_script = back_from_hardware_setup_refused_dialog
			}
		]}
endscript

script create_net_load_refused_dialog 
	create_dialog_box \{title = net_notice_msg
		text = net_error_cant_load_settings
		buttons = [
			{
				text = qs(0x9d57d378)
				pad_choose_script = back_from_load_refused_dialog
			}
			{
				text = qs(0xe91d4323)
				pad_choose_script = restart_ps2
			}
		]}
endscript

script launch_hardware_setup 
	RunScriptOnScreenElement \{id = current_menu_anchor
		menu_offscreen
		callback = create_hardware_setup_menu}
endscript

script launch_connection_settings 
	if ObjectExists \{id = current_menu_anchor}
		RunScriptOnScreenElement \{id = current_menu_anchor
			menu_offscreen
			callback = create_connection_settings}
	else
		dialog_box_exit
		create_connection_settings
	endif
endscript

script back_from_startup_error_dialog 

	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = content_uninit}
	NetSessionFunc \{func = presence_uninit}
	NetSessionFunc \{func = stats_uninit}
	Change \{NeedsToDownloadStats = 1}
	UnpauseMusicAndStreams
	dialog_box_exit
	if ObjectExists \{id = select_skater_anchor}
		DestroyScreenElement \{id = select_skater_anchor}
		restore_start_key_binding
	endif
	skater :CancelRotateDisplay
	create_main_menu
endscript

script create_net_startup_error_dialog 
	create_dialog_box {title = net_error_msg
		text = <text>
		buttons = [{text = qs(0x0e41fe46) pad_choose_script = <error_script>}
		]
	}
endscript
