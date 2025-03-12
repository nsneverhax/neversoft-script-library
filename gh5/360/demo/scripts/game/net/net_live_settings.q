net_hosting_duration_secs = 15
net_hosting_game_acceptable_wait = 30
net_reservation_connection_window = 15
net_matchmaking_timeout = 90
net_reservation_max_cycles = 6
net_user_content_minimum_download_time_secs = 5
net_temp_live_settings_overwritten = 0
net_should_allow_motd = 0
net_should_allow_agora = 0
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

script net_get_dynamic_pak_file_list 
	list = []
	return \{list}
endscript
demonware_server_list = [
	{
		lobby_id = `default`
		dw_ms_title_id = 5155
		dw_ps3_title_id = 5154
		cert_lsg = 'gh5-ps3-cert-lsg.mmp3.demonware.net'
		dev_lsg = 'gh5-ps3-dev-lsg.mmp3.demonware.net'
		live_lsg = 'gh5-ps3-live-lsg.mmp3.demonware.net'
		auth_address = 'gh5-ps3.auth.mmp3.demonware.net'
		service_id = 1096157161
		service_string = 'GH5 - DW ACTI LSP'
		service_port = 1050
		ps3_port = 3074
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
		service_string = 'GH5 - DW ACTI LSP'
		service_port = 1250
		ps3_port = 3074
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
		service_string = 'GH5 - DW ACTI LSP'
		service_port = 1150
		ps3_port = 3074
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
]

script net_live_settings_loaded 
	if ($net_temp_live_settings_overwritten != 0)
		update_download_song_killswitch_from_net
	endif
endscript
