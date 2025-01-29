net_hosting_duration_secs = 15
net_hosting_game_acceptable_wait = 30
net_reservation_connection_window = 15
net_matchmaking_timeout = 90
net_reservation_max_cycles = 6
net_user_content_minimum_download_time_secs = 5
net_temp_live_settings_overwritten = 0
net_live_settings_use_cache = 0
net_live_settings_cachable = 0
net_should_allow_agora = 0
g_net_live_invalid_goals = [
	None
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

script net_lookup_digest_value_by_filename_checksum 
	return \{FALSE
		digest = ''}
endscript
demonware_server_list = [
	{
		lobby_id = Default
		dw_ngc_title_id_us = 5265
		dev_lsg_us = 'gh6-wii-dev.lobby.mmp3.demonware.net'
		live_lsg_us = 'gh6-wii-live.lobby.mmp3.demonware.net'
		dev_auth_address_us = 'gh6-wii-dev.auth.mmp3.demonware.net'
		live_auth_address_us = 'gh6-wii-live.auth.mmp3.demonware.net'
		dw_ngc_title_id_eu = 5265
		dev_lsg_eu = 'gh6-wii-dev.lobby.mmp3.demonware.net'
		live_lsg_eu = 'gh6-wii-live.lobby.mmp3.demonware.net'
		dev_auth_address_eu = 'gh6-wii-dev.auth.mmp3.demonware.net'
		live_auth_address_eu = 'gh6-wii-live.auth.mmp3.demonware.net'
		service_id = 1096157161
		service_string = 'GH5 - DW ACTI LSP'
		service_port = 1050
		ps3_port = 3074
		send_buffer_size = 16384
		recv_buffer_size = 65536
	}
	{
		lobby_id = ghtunes
		dw_ngc_title_id_us = 5219
		dev_lsg_us = 'ghtunes-wii-dev-lobby.demonware.net'
		live_lsg_us = 'ghtunes-wii-2010-lobby.prod.demonware.net'
		dev_auth_address_us = 'ghtunes-wii-dev-auth.demonware.net'
		live_auth_address_us = 'ghtunes-wii-2010-auth.prod.demonware.net'
		dw_ngc_title_id_eu = 5219
		dev_lsg_eu = 'ghtunes-wii-dev-lobby.demonware.net'
		live_lsg_eu = 'ghtunes-wii-2010-lobby.prod.demonware.net'
		dev_auth_address_eu = 'ghtunes-wii-dev-auth.demonware.net'
		live_auth_address_eu = 'ghtunes-wii-2010-auth.prod.demonware.net'
		service_id = 1096157161
		service_string = 'GH5 - DW ACTI LSP'
		service_port = 1250
		ps3_port = 3074
		send_buffer_size = 65536
		recv_buffer_size = 65536
	}
	{
		lobby_id = leaderboards
		dw_ngc_title_id_us = 5221
		dev_lsg_us = 'gh-shared-wii-dev.lsg.mmp3.demonware.net'
		live_lsg_us = 'ghshared-wii-2010-lobby.prod.demonware.net'
		dev_auth_address_us = 'ghshared-wii-dev-auth.demonware.net'
		live_auth_address_us = 'ghshared-wii-2010-auth.prod.demonware.net'
		dw_ngc_title_id_eu = 5221
		dev_lsg_eu = 'gh-shared-wii-dev.lsg.mmp3.demonware.net'
		live_lsg_eu = 'ghshared-wii-2010-lobby.prod.demonware.net'
		dev_auth_address_eu = 'ghshared-wii-dev-auth.demonware.net'
		live_auth_address_eu = 'ghshared-wii-2010-auth.prod.demonware.net'
		service_id = 1096157161
		service_string = 'GH5 - DW ACTI LSP'
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
				elseif isngc
					if StructureContains structure = <item> dw_ngc_title_id_us
						printf qs(0x0a0c61d3) d = (<item>.dw_ngc_title_id_us)
						return true title_id = (<item>.dw_ngc_title_id_us)
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

script net_live_settings_download_finished 
	if ($net_temp_live_settings_overwritten != 0)
		update_download_song_killswitch_from_net
	endif
	broadcastevent \{Type = net_live_settings_download_finished}
endscript
