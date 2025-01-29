gamemode_list = [
	quickplay
	p1_quickplay
	career
	tutorial
	practice
	freeplay
	compmega
	compmega_team
	fest_mode
	fest_mode_team
	musicstudio
]
default_gamemode_props = {
	debug_name = qs(0x1d1be7f1)
	Type = quickplay
	cooperative = FALSE
	min_players = 1
	max_players = 8
	team_mode = one_team
}
quickplay_props = {
	debug_name = qs(0x4e077ebc)
	Type = quickplay
	cooperative = true
	max_players = 4
}
p1_quickplay_props = {
	debug_name = qs(0x4e077ebc)
	Type = quickplay
	cooperative = true
	max_players = 4
}
career_props = {
	debug_name = qs(0xd1270c2d)
	Type = career
	cooperative = true
	max_players = 4
}
p2_roadie_battle_props = {
	debug_name = qs(0xcd988a43)
	num_players = 2
	Type = pro_faceoff
	faceoff = true
}
tutorial_props = {
	debug_name = qs(0xb931e0b2)
	Type = tutorial
	cooperative = FALSE
	max_players = 1
}
practice_props = {
	debug_name = qs(0x3bee06d2)
	Type = practice
	max_players = 1
}
freeplay_props = {
	debug_name = qs(0x18b9100f)
	Type = freeplay
	cooperative = true
	max_players = 4
}
roadie_battle_props = {
	debug_name = qs(0xc5eca185)
	team_size = 1
	Type = pro_faceoff
	cooperative = FALSE
	faceoff = true
	instrument = guitar
}
compmega_props = {
	debug_name = qs(0x13e20fcb)
	team_size = 1
	min_players = 2
	Type = competitive
	cooperative = FALSE
	team_mode = one_player_per_team
}
compmega_team_props = {
	debug_name = qs(0xa3d0c702)
	Type = competitive
	cooperative = FALSE
	min_players = 4
	team_mode = two_teams
}
fest_mode_props = {
	debug_name = qs(0x7a332da3)
	Type = competitive
	cooperative = FALSE
	min_players = 2
	team_mode = one_player_per_team
}
fest_mode_team_props = {
	debug_name = qs(0x197e5617)
	Type = competitive
	cooperative = FALSE
	min_players = 4
	team_mode = two_teams
}
musicstudio_props = {
	debug_name = qs(0xc0227e7d)
	Type = musicstudio
}
music_store_props = {
	debug_name = qs(0xe45f3b34)
	Type = music_store
}
