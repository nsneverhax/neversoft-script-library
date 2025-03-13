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
default_band_name = qs(0x194e94fa)
band_name_1 = qs(0xa7672034)
band_name_2 = qs(0x840cb79a)
band_name_3 = qs(0xeebb698b)
band_name_4 = qs(0xf8ae1442)
band_name_5 = qs(0xf4c7ac74)
band_name_6 = qs(0x28915c87)
band_name_7 = qs(0xa94455cb)
band_name_8 = qs(0x9ad39e4d)
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
network_game_postgame_lobby = 0
xboxlive_num_results = 0
online_dark_purple = [
	70
	40
	70
	250
]
online_light_blue = [
	180
	230
	250
	250
]
online_medium_blue = [
	35
	130
	175
	250
]
online_red = [
	255
	0
	0
	255
]
online_yellow = [
	210
	210
	0
	255
]
online_orange = [
	255
	165
	0
	255
]
online_green = [
	0
	150
	0
	255
]
global_should_use_net_debugging = 0
debug_matchmaking_early_desirable = 0

script matchmaking_set_early_desirable 
	change \{debug_matchmaking_early_desirable = 1}
endscript
