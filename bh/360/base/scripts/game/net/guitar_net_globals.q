band_color1 = p1_md
band_color2 = p2_md
band_color3 = p3_md
band_color4 = p4_md
band_color5 = p5_md
band_color6 = p6_md
band_color7 = good_md
band_color8 = average_md
random_band_names = [
	default_band_name
	band_name_1
	band_name_2
	band_name_3
	band_name_4
	band_name_5
	band_name_6
	band_name_7
	band_name_8
]
default_band_name = qs(0xc5e50a84)
band_name_1 = qs(0xebdcb393)
band_name_2 = qs(0xbbc3efa2)
band_name_3 = qs(0xac701158)
band_name_4 = qs(0x5072f887)
band_name_5 = qs(0xa8f8526a)
band_name_6 = qs(0x0ea81eda)
band_name_7 = qs(0x38d27bb8)
band_name_8 = qs(0xd5c58738)
gamertag_0 = qs(0x00000000)
gamertag_1 = qs(0x00000000)
gamertag_2 = qs(0x00000000)
gamertag_3 = qs(0x00000000)
gamertag_4 = qs(0x00000000)
gamertag_5 = qs(0x00000000)
gamertag_6 = qs(0x00000000)
gamertag_7 = qs(0x00000000)
has_invite_join_result_callback_completed = 0
online_lobby_item_text_color = [
	200
	200
	200
	255
]
online_player_slot_bg_team1 = [
	255
	255
	0
	255
]
online_player_slot_bg_team2 = [
	83
	45
	106
	255
]
net_num_player_settings_ack = 0
net_num_players = 0
GLOBAL_SHOULD_USE_NET_DEBUGGING = 0
DEBUG_matchmaking_early_desirable = 0

script matchmaking_set_early_desirable 
	Change \{DEBUG_matchmaking_early_desirable = 1}
endscript
