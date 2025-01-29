net_hosting_duration_secs = 15
net_hosting_game_acceptable_wait = 30
net_reservation_connection_window = 15
net_matchmaking_timeout = 90
net_reservation_max_cycles = 6
net_user_content_minimum_download_time_secs = 5
net_temp_live_settings_overwritten = 0
net_live_settings_use_cache = 1
net_live_settings_cachable = 1
net_should_allow_agora = 0
g_net_live_invalid_goals = [
]
g_net_live_leaderboard_version_number = 2.9
net_dgs = 0.0
net_dgsversion2 = '0'
net_dgs_calibrate = 0.0
net_dgs_venueenter = 0.0
net_dgs_venueexit = 0.0
net_dgs_songbegin = 0.0
net_dgs_songwon = 0.0
net_dgs_songfailed = 0.0
net_dgs_songretry = 0.0
net_dgs_songaborted = 0.0
net_dgs_songchallengegoals = 0.0
net_dgs_sendfriendsfeedmessage = 0.0
net_dgs_sendgameinvite = 0.0
net_dgs_joingameinviteattempt = 0.0
net_dgs_joingameinvitesuccess = 0.0
net_dgs_joingameinvitefailure = 0.0
net_dgs_debug = 0.0
net_dgs_matchstate = 0.0

script net_get_dynamic_pak_file_list 
	list = []
	return true list = <list>
endscript

script net_get_digest_value_list 
	list = []
	return true list = <list>
endscript

script net_lookup_digest_value_by_filename_checksum 
	return \{FALSE
		digest = ''}
endscript
demonware_server_list = [
	{
		lobby_id = Default
		dw_ms_title_id = 5263
		dw_ps3_title_id = 5264
		cert_lsg = 'gh6-ps3-cert.lobby.mmp3.demonware.net'
		dev_lsg = 'gh6-ps3-dev.lobby.mmp3.demonware.net'
		live_lsg = 'gh6-ps3-live.lobby.mmp3.demonware.net'
		auth_address = 'gh6-ps3-dev.auth.mmp3.demonware.net'
		service_id = 1096157161
		service_string = 'GH6 - DW ACTI LSP'
		service_port = 1060
		ps3_port = 3074
		send_buffer_size = 16384
		recv_buffer_size = 65536
	}
	{
		lobby_id = ghtunes
		dw_ms_title_id = 5218
		dw_ps3_title_id = 5217
		cert_lsg = 'ghtunes-ps3-cert-lobby.demonware.net'
		dev_lsg = 'ghtunes-ps3-dev-lobby.demonware.net'
		live_lsg = 'ghtunes-ps3-live-lobby.demonware.net'
		auth_address = 'ghtunes-ps3-auth.demonware.net'
		service_id = 1096157161
		service_string = 'GH6 - DW ACTI LSP'
		service_port = 1250
		ps3_port = 3074
		send_buffer_size = 65536
		recv_buffer_size = 65536
	}
	{
		lobby_id = leaderboards
		dw_ms_title_id = 5199
		dw_ps3_title_id = 5198
		cert_lsg = 'gh-shared-ps3-cert.lsg.demonware.net'
		dev_lsg = 'gh-shared-ps3-dev.lsg.mmp3.demonware.net'
		live_lsg = 'gh-shared-ps3-live.lsg.demonware.net'
		auth_address = 'gh-shared-ps3-auth.mmp3.demonware.net'
		service_id = 1096157161
		service_string = 'GH6 - DW ACTI LSP'
		service_port = 1150
		ps3_port = 3074
		send_buffer_size = 16384
		recv_buffer_size = 65536
	}
]
enabled_songs_bitfield_live = [
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
]

script net_get_title_id 
	GetArraySize \{$demonware_server_list}
	if (<array_Size> > 0)
		index = 0
		begin
		item = ($demonware_server_list [<index>])
		if StructureContains structure = <item> lobby_id
			if ((<item>.lobby_id) = Default)
				if isps3
					if StructureContains structure = <item> dw_ps3_title_id
						printf qs(0x0a0c61d3) d = (<item>.dw_ps3_title_id)
						return true title_id = (<item>.dw_ps3_title_id)
					endif
				elseif isXenon
					if StructureContains structure = <item> dw_ms_title_id
						printf qs(0x0a0c61d3) d = (<item>.dw_ms_title_id)
						return true title_id = (<item>.dw_ms_title_id)
					endif
				else
				endif
			endif
		endif
		index = (<index> + 1)
		repeat <array_Size>
	endif
	printf \{qs(0xe8ea2c18)}
	return \{FALSE
		title_id = 0}
endscript

script net_live_settings_loaded 
	printf \{qs(0x4a999119)}
	printstruct <...>
	printf \{qs(0x566ce923)}
endscript

script net_live_settings_unloaded 
	printf \{qs(0x249bf526)}
	printstruct <...>
	printf \{qs(0x5424f692)}
endscript

script net_live_settings_dynamic_pak_loaded 
	printf \{qs(0x77d7181b)}
	printstruct <...>
	printf \{qs(0xa8be8c23)}
endscript

script net_live_settings_dynamic_pak_unloaded 
	printf \{qs(0x42160128)}
	printstruct <...>
	printf \{qs(0xf33387df)}
endscript

script net_live_settings_download_finished 
	if ($net_temp_live_settings_overwritten != 0)
		update_download_song_killswitch_from_net
	endif
endscript

script net_live_settings_reload 
	NetSessionFunc \{func = live_settings_clear_loaded_flag}
	NetSessionFunc \{func = live_settings_init}
	NetSessionFunc \{Obj = live_settings
		func = get_settings}
endscript

script net_live_settings_flush_cache 
	NetSessionFunc \{func = live_settings_init}
	NetSessionFunc \{Obj = live_settings
		func = flush_cache}
endscript

script net_live_settings_debug_overlay 
	spawnscript \{net_live_settings_debug_overlay_create}
endscript

script net_live_settings_debug_overlay_create 
	net_live_settings_debug_overlay_destroy
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		Pos = (50.0, 30.0)
		just = [
			left
			top
		]
		z_priority = 25000
		id = net_live_settings_debug_overlay_root_id}
	CreateScreenElement \{Type = SpriteElement
		parent = net_live_settings_debug_overlay_root_id
		texture = white
		dims = (1180.0, 660.0)
		rgba = [
			0
			0
			0
			64
		]
		Pos = (590.0, 330.0)
		z_priority = 25001
		id = net_live_settings_debug_overlay_background_id}
	CreateScreenElement \{Type = TextElement
		parent = net_live_settings_debug_overlay_root_id
		font = fontgrid_text_a1
		text = qs(0x00000000)
		Scale = (0.5, 0.5)
		just = [
			left
			top
		]
		Pos = (0.0, 10.0)
		dims = (1180.0, 800.0)
		z_priority = 25002
		rgba = [
			255
			255
			255
			255
		]
		id = net_live_settings_debug_overlay_text_id
		single_line = FALSE}
	NetSessionFunc \{func = live_settings_enable_debug_overlay}
	RunScriptOnScreenElement \{id = net_live_settings_debug_overlay_root_id
		net_live_settings_debug_overlay_task}
endscript

script net_live_settings_debug_overlay_destroy 
	if ScreenElementExists \{id = net_live_settings_debug_overlay_root_id}
		DestroyScreenElement \{id = net_live_settings_debug_overlay_root_id}
	endif
	NetSessionFunc \{func = live_settings_disable_debug_overlay}
endscript

script net_live_settings_debug_overlay_loop 
	begin
	if ScreenElementExists \{id = net_live_settings_debug_overlay_root_id}
		net_live_settings_debug_overlay_root_id :se_setprops \{alpha = 1.0
			time = 0.5}
		if NetSessionFunc \{func = live_settings_get_debug_overlay_info}
		else
			<text> = qs(0x00000000)
		endif
		if NOT GotParam \{text}
			<text> = qs(0x00000000)
		endif
		if ScreenElementExists \{id = net_live_settings_debug_overlay_text_id}
			net_live_settings_debug_overlay_text_id :se_setprops text = <text>
		endif
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script net_live_settings_debug_overlay_task 
	net_live_settings_debug_overlay_loop
	net_live_settings_debug_overlay_destroy
endscript
