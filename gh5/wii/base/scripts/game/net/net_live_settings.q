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
demonware_server_list = [
	{
		lobby_id = Default
		dw_ngc_title_id_us = 5167
		cert_lsg_us = 'gh5-wii-cert.lobby.v200.demonware.net'
		dev_lsg_us = 'gh5-wii.lobby.v200.demonware.net'
		live_lsg_us = 'gh5-wii-live-lobby-us.demonware.net'
		auth_address_us = 'gh5-0-wii-live-auth.demonware.net'
		dw_ngc_title_id_eu = 5252
		cert_lsg_eu = 'gh5-wii-cert.lobby.v200.demonware.net'
		dev_lsg_eu = 'gh5-wii.lobby.v200.demonware.net'
		live_lsg_eu = 'gh5-wii-live-lobby-eu.demonware.net'
		auth_address_eu = 'gh5-0-wii-live-auth.demonware.net'
		service_id = 1096157161
		service_string = 'GH5 - DW ACTI LSP'
		service_port = 1050
		ps3_port = 3074
	}
	{
		lobby_id = ghtunes
		dw_ngc_title_id_us = 5219
		cert_lsg_us = 'gh5-wii-cert.lobby.v200.demonware.net'
		dev_lsg_us = 'ghtunes-wii-dev-lobby.demonware.net'
		live_lsg_us = 'ghtunes-wii-live-lobby.demonware.net'
		auth_address_us = 'ghtunes-wii-live-auth.demonware.net'
		dw_ngc_title_id_eu = 5219
		cert_lsg_eu = 'gh5-wii-cert.lobby.v200.demonware.net'
		dev_lsg_eu = 'ghtunes-wii-dev-lobby.demonware.net'
		live_lsg_eu = 'ghtunes-wii-live-lobby.demonware.net'
		auth_address_eu = 'ghtunes-wii-live-auth.demonware.net'
		service_id = 1096157161
		service_string = 'GH5 - DW ACTI LSP'
		service_port = 1250
		ps3_port = 3074
	}
	{
		lobby_id = leaderboards
		dw_ngc_title_id_us = 5221
		cert_lsg_us = 'gh5-wii-cert.lobby.v200.demonware.net'
		dev_lsg_us = 'gh-shared-wii-dev.lsg.mmp3.demonware.net'
		live_lsg_us = 'ghshared-wii-live-lobby.demonware.net'
		auth_address_us = 'ghshared-wii-live-auth.demonware.net'
		dw_ngc_title_id_eu = 5221
		cert_lsg_eu = 'gh5-wii-cert.lobby.v200.demonware.net'
		dev_lsg_eu = 'gh-shared-wii-dev.lsg.mmp3.demonware.net'
		live_lsg_eu = 'ghshared-wii-live-lobby.demonware.net'
		auth_address_eu = 'ghshared-wii-live-auth.demonware.net'
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
