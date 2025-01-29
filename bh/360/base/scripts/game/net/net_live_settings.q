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
		LOBBY_ID = Default
		DW_MS_TITLE_ID = 5200
		DW_PS3_TITLE_ID = 5197
		CERT_LSG = 'gh51-ps3-cert.lsg.mmp3.demonware.net'
		DEV_LSG = 'gh51-ps3-dev.lsg.mmp3.demonware.net'
		LIVE_LSG = 'gh51-ps3-live.lsg.mmp3.demonware.net'
		AUTH_ADDRESS = 'gh51-ps3.auth.mmp3.demonware.net'
		SERVICE_ID = 1096157161
		SERVICE_STRING = 'GH5.1 - DW ACTI LSP'
		SERVICE_PORT = 1051
		PS3_PORT = 3074
	}
	{
		LOBBY_ID = ghtunes
		DW_MS_TITLE_ID = 5218
		DW_PS3_TITLE_ID = 5217
		CERT_LSG = 'ghtunes-ps3-cert-lobby.demonware.net'
		DEV_LSG = 'ghtunes-ps3-dev-lobby.demonware.net'
		LIVE_LSG = 'ghtunes-ps3-live-lobby.demonware.net'
		AUTH_ADDRESS = 'ghtunes-ps3-auth.demonware.net'
		SERVICE_ID = 1096157161
		SERVICE_STRING = 'GH5.1 - DW ACTI LSP'
		SERVICE_PORT = 1250
		PS3_PORT = 3074
	}
	{
		LOBBY_ID = leaderboards
		DW_MS_TITLE_ID = 5199
		DW_PS3_TITLE_ID = 5198
		CERT_LSG = 'gh-shared-ps3-cert.lsg.demonware.net'
		DEV_LSG = 'gh-shared-ps3-dev.lsg.mmp3.demonware.net'
		LIVE_LSG = 'gh-shared-ps3-live.lsg.demonware.net'
		AUTH_ADDRESS = 'gh-shared-ps3-auth.mmp3.demonware.net'
		SERVICE_ID = 1096157161
		SERVICE_STRING = 'GH5.1 - DW ACTI LSP'
		SERVICE_PORT = 1150
		PS3_PORT = 3074
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
