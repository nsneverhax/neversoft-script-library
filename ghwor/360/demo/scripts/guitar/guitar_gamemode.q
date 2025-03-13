gamemode_list = [
	quickplay
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
	type = quickplay
	cooperative = false
	min_players = 1
	max_players = 8
	team_mode = one_team
}
quickplay_props = {
	debug_name = qs(0x4e077ebc)
	type = quickplay
	cooperative = true
	max_players = 4
}
career_props = {
	debug_name = qs(0xd1270c2d)
	type = career
	cooperative = true
	max_players = 4
}
tutorial_props = {
	debug_name = qs(0xb931e0b2)
	type = tutorial
	cooperative = false
	max_players = 1
}
practice_props = {
	debug_name = qs(0x3bee06d2)
	type = practice
	max_players = 1
}
freeplay_props = {
	debug_name = qs(0x18b9100f)
	type = freeplay
	cooperative = true
	max_players = 4
}
compmega_props = {
	debug_name = qs(0x13e20fcb)
	team_size = 1
	min_players = 2
	type = competitive
	cooperative = false
	team_mode = one_player_per_team
}
compmega_team_props = {
	debug_name = qs(0xa3d0c702)
	type = competitive
	cooperative = false
	min_players = 4
	team_mode = two_teams
}
fest_mode_props = {
	debug_name = qs(0x7a332da3)
	type = competitive
	cooperative = false
	min_players = 2
	team_mode = one_player_per_team
}
fest_mode_team_props = {
	debug_name = qs(0x197e5617)
	type = competitive
	cooperative = false
	min_players = 4
	team_mode = two_teams
}
musicstudio_props = {
	debug_name = qs(0xc0227e7d)
	type = musicstudio
}
