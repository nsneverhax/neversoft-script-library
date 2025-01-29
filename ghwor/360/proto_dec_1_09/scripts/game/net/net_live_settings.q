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
net_dgs_sendgameinvite = 0.0
net_dgs_joingameinviteattempt = 0.0
net_dgs_joingameinvitesuccess = 0.0
net_dgs_joingameinvitefailure = 0.0
net_dgs_debug = 0.0
net_dgs_matchstate = 0.0

script net_get_dynamic_pak_file_list 
	list = []
	return \{list}
endscript

script net_get_digest_value_list 
	list = []
	return \{list}
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
	}
	{
		lobby_id = leaderboards
		dw_ms_title_id = 5281
		dw_ps3_title_id = 5282
		cert_lsg = 'ghshared6-ps3-cert.lobby.mmp3.demonware.net'
		dev_lsg = 'ghshared6-ps3-dev.lobby.mmp3.demonware.net'
		live_lsg = 'ghshared6-ps3-live.lobby.mmp3.demonware.net'
		auth_address = 'ghshared6-ps3-dev.auth.mmp3.demonware.net'
		service_id = 1096157161
		service_string = 'GH6 - DW ACTI LSP'
		service_port = 1260
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
	if ($net_temp_live_settings_overwritten != 0)
		update_download_song_killswitch_from_net
	endif
endscript
