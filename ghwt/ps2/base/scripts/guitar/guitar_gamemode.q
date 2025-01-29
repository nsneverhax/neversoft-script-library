gamemode_list = [
	p1_quickplay
	p2_quickplay
	p3_quickplay
	p4_quickplay
	p1_career
	p2_career
	p3_career
	p4_career
	p1_improv
	p1_boss
	p2_faceoff
	p2_pro_faceoff
	p4_pro_faceoff
	p8_pro_faceoff
	p2_coop
	p2_battle
	tutorial
	training
]
default_gamemode_props = {
	num_players = 1
	Type = quickplay
	cooperative = FALSE
	faceoff = FALSE
	singleplayer = FALSE
}
p1_quickplay_props = {
	num_players = 1
	Type = quickplay
	singleplayer = true
}
p2_quickplay_props = {
	num_players = 2
	Type = quickplay
	cooperative = true
}
p3_quickplay_props = {
	num_players = 3
	Type = quickplay
	cooperative = true
}
p4_quickplay_props = {
	num_players = 4
	Type = quickplay
	cooperative = true
}
p1_career_props = {
	num_players = 1
	Type = career
	singleplayer = true
}
p2_career_props = {
	num_players = 2
	Type = career
	cooperative = true
}
p3_career_props = {
	num_players = 3
	Type = career
	cooperative = true
}
p4_career_props = {
	num_players = 4
	Type = career
	cooperative = true
}
p1_improv_props = {
	num_players = 1
	Type = improv
	singleplayer = true
}
p1_boss_props = {
	num_players = 1
	Type = boss
	singleplayer = true
}
p2_faceoff_props = {
	num_players = 2
	Type = faceoff
	faceoff = true
}
p2_pro_faceoff_props = {
	num_players = 2
	Type = pro_faceoff
	faceoff = true
}
p4_pro_faceoff_props = {
	num_players = 4
	Type = pro_faceoff
	faceoff = true
}
p8_pro_faceoff_props = {
	num_players = 8
	Type = pro_faceoff
	faceoff = true
}
p2_coop_props = {
	num_players = 2
	Type = coop
	cooperative = true
}
p2_battle_props = {
	num_players = 2
	Type = battle
}
tutorial_props = {
	num_players = 4
	Type = tutorial
	singleplayer = FALSE
	cooperative = FALSE
}
training_props = {
	num_players = 4
	Type = training
	singleplayer = FALSE
}
