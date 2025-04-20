seconds_per_gamehour = 300
scene_streaming_enabled = 1
num_allowed_primary_scenes = 1
num_allowed_secondary_scenes = 1
num_allowed_goal_scenes = 1
default_obstruction_radius = 2.0
large_scene_relevance_params = {
	spawn_dist = 34.0
	min_spawn_dist = 28.0
	start_dist = 10.0
	kill_dist = 38.0
	max_height = 2.0
	offscreen_kill_dist = 16.0
	max_spawn_angle = 50
	min_despawn_angle = 75
}
default_scene_relevance_params = {
	spawn_dist = 28.0
	min_spawn_dist = 22.0
	start_dist = 10.0
	kill_dist = 32.0
	max_height = 2.0
	offscreen_kill_dist = 16.0
	max_spawn_angle = 50
	min_despawn_angle = 75
}
scene_cooldown_times = {
	chat = 15
}
AS_Chat = {
	time_block = [
		-1
		0
	]
	relevance_params = $default_scene_relevance_params
	type = secondary
	spawn_script = SceneControl_Chat_Spawn
	start_script = SceneControl_Chat_Start
	interrupt_script = SceneControl_Chat_Interrupt
	chat
	becomes_ambient
	cooldown_type = chat
}
AS_TestScene = {
	time_block = [
		-1
		12
	]
	relevance_params = $default_scene_relevance_params
	type = primary
}
AS_2PedsTalk = {
	ambient_peds = false
	time_block = [
		-1
		18
	]
	relevance_params = $default_scene_relevance_params
	type = secondary
	spawn_script = SceneControl_2PedsTalk
	interrupt_script = SceneControl_2PedsTalk_Interrupt
}
ambient_scenes = {
	test_scene = {
		$AS_TestScene
	}
	chat = {
		$AS_Chat
		ambient_area = Love_Ped03
	}
	Chat01 = {
		$AS_Chat
		ambient_area = Love_Ped01
	}
	Chat02 = {
		$AS_Chat
		ambient_area = Love_Ped02
	}
	Chat03 = {
		$AS_Chat
		ambient_area = Love_Ped04
	}
	Chat04 = {
		$AS_Chat
		ambient_area = Love_Ped01
	}
	GuitarPlayer_scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_guitarplayer01
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_love_scenes
		type = primary
		obstruction_radius = 8.0
	}
	Test_Bums01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Test_CellPhone01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Test_CellPhone02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Test_GottaPoop01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museums_scenes
		type = secondary
	}
	ThreePedsTalk_scene = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_3pedstalk
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	ThreePedsTalk_scene01 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Love_3PedsTalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	ThreePedsTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_3pedstalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	ThreePedsTalk_scene04 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Love_3PedsTalk04
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	ThreePedsLeanTalk_scene = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_3pedsleantalk
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	ThreePedsLeanTalk_scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	ThreePedsLeanTalk_scene02 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_3pedsleantalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	ThreePedsLeanTalk_scene03 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_3pedsleantalk03
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	ThreePedsLeanTalk_scene04 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_3pedsleantalk04
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	ThreePedsLeanTalk_scene05 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsLeanTalk_scene = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsLeanTalk_scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsLeanTalk_scene02 = {
		time_block = [
			-1
			10
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_twopedsleantalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	TwoPedsLeanTalk_scene03 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsLeanTalk_scene04 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_twopedsleantalk04
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	TwoPedsLeanTalk_scene05 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsLeanTalk_scene06 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsLeanTalk_scene07 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsLeanTalk_scene08 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsLeanTalk_scene09 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsLeanTalk_scene10 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsSitTalk_scene = {
		time_block = [
			-1
			21
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsSitTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsSitTalk_scene04 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsTalk_scene = {
		time_block = [
			-1
			8
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsTalk_scene01 = {
		time_block = [
			-1
			10
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsTalk_scene02 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsTalk_scene03 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsTalk_scene05 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsTalk_scene07 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	TwoPedsTalk_scene08 = {
		time_block = [
			-1
			23
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_bum01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bum_scene03 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_bum03
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bum_scene04 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene05 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Love_Bum05
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bum_scene06 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene07 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene08 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene09 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene10 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene11 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene12 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene13 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene14 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene15 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bum_scene16 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BumHaressedByCop_scene = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_love_scenes
		type = secondary
	}
	BumHaressedByCop_scene02 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_love_scenes
		type = secondary
	}
	Skater_scene01 = {
		time_block = [
			-1
			10
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Love_Skater01
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_love_scenes
		type = secondary
	}
	StealingDeck_scene01 = {
		time_block = [
			-1
			10
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = stealingdeck
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_love_scenes
		type = primary
	}
	StealingDeck_scene02 = {
		time_block = [
			-1
			10
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = stealingdeck02
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_love_scenes
		type = secondary
	}
	StealingDeck_scene03 = {
		time_block = [
			-1
			10
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = StealingDeck03
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_love_scenes
		type = secondary
	}
	CarAccident_scene01 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = primary
		obstruction_radius = 7.0
		becomes_ambient
		ambient_area = Love_Ped03
		asset_context = z_love_scenes
	}
	CarAccident_scene02 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
		obstruction_radius = 7.0
		becomes_ambient
		ambient_area = Love_Ped03
		asset_context = z_love_scenes
	}
	Tourist_scene01 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Love_Tourist
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Love_S_2Peds02 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Love_S_2Peds03 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Love_S_2Peds04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Love_S_2Peds05 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Love_S_RobotDance01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_love_scenes
		node_flags = [
			{
				name = love_robotdance01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Love_Session01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_session01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Love_Session02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_session02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Love_Session07a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = love_session07b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Love_Session10a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Love_Session10b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Bell_2PedsLeanTalk_scene01 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene02 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene03 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene04 = {
		time_block = [
			-1
			19
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene05 = {
		time_block = [
			-1
			21
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene06 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene07 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene08 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Bell_scenes
		type = secondary
	}
	Bell_2PedsLeanTalk_scene09 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene10 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene11 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene12 = {
		time_block = [
			-1
			21
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene13 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsLeanTalk_scene14 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsSitTalk_scene01 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsSitTalk_scene02 = {
		time_block = [
			-1
			19
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsSitTalk_scene03 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsTalk_scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsTalk_scene02 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsTalk_scene03 = {
		time_block = [
			-1
			16
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsTalk_scene04 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsTalk_scene05 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2PedsTalk_scene06 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene01 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene02 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene03 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene04 = {
		time_block = [
			-1
			21
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene05 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene06 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene07 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene08 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene09 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Bum_scene10 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_3PedsLeanTalk_scene01 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bell_3pedsleantalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_3PedsLeanTalk_scene02 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bell_3pedsleantalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_3PedsLeanTalk_scene05 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bell_3pedsleantalk05
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_3PedsLeanTalk_scene07 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bell_3pedsleantalk07
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_3PedsTalk_scene01 = {
		time_block = [
			-1
			19
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Bell_3PedsTalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_3PedsTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bell_3pedstalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_3PedsTalk_scene03 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bell_3pedstalk03
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_3Peds_Scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Bell_scenes
		type = secondary
	}
	Bell_3Peds_Scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Bell_scenes
		type = secondary
	}
	Bell_3Peds_Scene03 = {
		time_block = [
			-1
			19
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Bell_scenes
		type = secondary
	}
	Bell_3Peds_Scene04 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Bell_scenes
		type = secondary
	}
	Bell_2Peds_Scene01 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2Peds_Scene02 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_2Peds_Scene03 = {
		time_block = [
			-1
			19
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_BucketPlayer_scene01 = {
		time_block = [
			-1
			16
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Bell_BucketPlayer01
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Bell_scenes
		type = primary
		obstruction_radius = 8.0
	}
	Bell_Tourist_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Bell_Tourist01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
		obstruction_radius = 3.0
	}
	Bell_CarAccident_scene01 = {
		time_block = [
			6
			18
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Bell_CarAccident01
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Bell_scenes
		type = primary
		obstruction_radius = 7.0
	}
	Bell_CarAccident_scene02 = {
		time_block = [
			6
			18
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Bell_CarAccident02
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Bell_scenes
		type = secondary
		obstruction_radius = 7.0
	}
	Bell_Worker_Scene01 = {
		time_block = [
			-1
			19
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Bell_scenes
		type = secondary
	}
	Bell_RobotDancer_Scene01 = {
		time_block = [
			-1
			19
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Bell_scenes
		node_flags = [
			{
				name = bell_robotdancer01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_StealingDeck_scene01 = {
		time_block = [
			-1
			10
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Bell_StealingDeck01
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_love_scenes
		type = primary
	}
	Bell_Session01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bell_session01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_Session02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bell_session02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Bell_Session03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Bell_Session04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bell_session04b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	PBB_Bum_scene01 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_Bum_scene02 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_Bum_scene03 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene01 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene02 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene03 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene04 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene05 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene06 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene07 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene08 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene09 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene10 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene11 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsLeanTalk_scene12 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene02 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene03 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene04 = {
		time_block = [
			-1
			15
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene05 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene06 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene07 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene08 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene09 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_2PedsTalk_scene10 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_3PedsTalk_scene01 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_3PedsTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_3PedsTalk_scene03 = {
		time_block = [
			-1
			17
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_3PedsTalk_scene04 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_3PedsTalk_scene05 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_3PedsLeanTalk_scene01 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_3PedsLeanTalk_scene02 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_3PedsLeanTalk_scene03 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PBB_3PedsLeanTalk_scene04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	PbBridge_SessionPed02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = pbbridge_sessionped02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	PbBridge_SessionPed01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = pbbridge_sessionped01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	FDR_2PedsLeanTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene05 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene06 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene07 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene08 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene09 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene10 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene11 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsLeanTalk_scene12 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsTalk_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsTalk_scene04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsTalk_scene05 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsSitTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_2PedsSitTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_3PedsLeanTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_3pedsleantalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_3PedsLeanTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_3pedsleantalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_3PedsLeanTalk_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_3pedsleantalk03
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_3PedsLeanTalk_scene04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = FDR_3PedsLeanTalk04
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_3PedsLeanTalk_scene05 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_3pedsleantalk05
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_3PedsTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_3pedstalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_3PedsTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_3pedstalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_3PedsTalk_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_3pedstalk03
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_3PedsTalk_scene04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = FDR_3PedsTalk04
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_3PedsTalk_scene05 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_3pedstalk05
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	FDR_2Peds_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_PedCellTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_PedCellTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_PedCellTalk_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_PedCellTalk_scene04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_FDR_scenes
		type = secondary
	}
	FDR_PedCellTalk_scene05 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_Bum_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_Bum_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_Bum_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_Bum_scene04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_BehindFence_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_BehindFence_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = primary
	}
	FDR_BehindFence_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	FDR_Skater_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = FDR_Skater01
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_FDR_scenes
		type = secondary
	}
	FDR_SessionPed01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_sessionped01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_SessionPed02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_sessionped02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_SessionPed03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_sessionped03b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_FDR_scenes
		type = secondary
	}
	FDR_SessionPed04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_sessionped04b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	FDR_SessionPed05a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = fdr_sessionped05b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_FDR_scenes
		type = primary
	}
	Harbor_SessionPed01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_sessionped01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_SessionPed02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_sessionped02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_SessionPed03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_sessionped03b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_SessionPed04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_sessionped04b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_PlayPushing_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Harbor_scenes
		type = secondary
	}
	Harbor_PlayPushing_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Harbor_scenes
		type = secondary
	}
	Harbor_PlayPushing_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Harbor_scenes
		node_flags = [
			{
				name = harbor_playpushing03
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_Bum_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_BumBeg_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_3PedsLeanTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedsleantalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsLeanTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedsleantalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsLeanTalk_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedsleantalk03
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsLeanTalk_scene04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedsleantalk04
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsLeanTalk_scene05 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedsleantalk05
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedstalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Harbor_3PedsTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedstalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsTalk_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedstalk03
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsTalk_scene04 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedstalk04
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsTalk_scene05 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedstalk05
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsTalk_scene06 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedstalk06
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_3PedsTalk_scene07 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_3pedstalk07
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Harbor_2PedsSitTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_2PedsSitTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_2PedsLeanTalk_scene01 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_2PedsLeanTalk_scene02 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_2PedsLeanTalk_scene03 = {
		time_block = [
			-1
			24
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_3Peds_Scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_2Peds_Scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_2Peds_Scene03 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_PedCellTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_PedCellTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_LookOcean_Scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Harbor_scenes
		type = secondary
	}
	Harbor_LookOcean_Scene02 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Harbor_scenes
		type = secondary
	}
	Harbor_BumHaressedByCop_scene01 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Harbor_scenes
		type = secondary
	}
	Harbor_CarAccident_scene01 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Harbor_CarAccident01
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Harbor_scenes
		type = primary
		obstruction_radius = 7.0
	}
	Harbor_CarAccident_scene02 = {
		time_block = [
			-1
			18
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Harbor_CarAccident02
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Harbor_scenes
		type = secondary
		obstruction_radius = 7.0
	}
	Harbor_Tourist_Scene01 = {
		time_block = [
			-1
			20
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_BucketPlayer_scene01 = {
		time_block = [
			-1
			16
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_bucketplayer01
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Harbor_scenes
		type = primary
		obstruction_radius = 8.0
	}
	Harbor_StealingDeck_scene01 = {
		time_block = [
			-1
			10
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_stealingdeck01
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Harbor_scenes
		type = primary
	}
	Harbor_StealingDeck_scene02 = {
		time_block = [
			-1
			10
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = harbor_stealingdeck02
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Harbor_scenes
		type = primary
	}
	Harbor_BehindFence_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_BehindFence_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Harbor_ThrowingCoin_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Harbor_scenes
		node_flags = [
			{
				name = harbor_throwingcoin01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_SessionPed01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		node_flags = [
			{
				name = slums_sessionped01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_SessionPed02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		node_flags = [
			{
				name = slums_sessionped02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_SessionPed03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		node_flags = [
			{
				name = slums_sessionped03b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_SessionPed04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		node_flags = [
			{
				name = slums_sessionped04b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_SessionPed05a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		node_flags = [
			{
				name = Slums_SessionPed05b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_CSI_scene01a = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		node_flags = [
			{
				name = Slums_CSI01a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Slums_CSI_scene01b = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		node_flags = [
			{
				name = Slums_CSI01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_CSI_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		node_flags = [
			{
				name = Slums_CSI01a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Slums_ArrestGang_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		type = secondary
	}
	Slums_CarJack_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		type = secondary
	}
	Slums_Bum_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Slums_Bum_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Slums_3Peds_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Slums_scenes
		type = secondary
	}
	Slums_2PedsLeanTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Slums_3PedsLeanTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = slums_3pedsleantalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_3PedsLeanTalk_scene02 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = slums_3pedsleantalk02
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_3PedsLeanTalk_scene03 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = slums_3pedsleantalk03
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Slums_CellPhoneTalk_scene01 = {
		time_block = [
			-1
			22
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Sk8Session_scene01 = {
		$AS_Sk8Session01
		node_flags = [
			{
				name = Museum_Sk8Scene01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Crib_Sk8Ped_01a = {
		time_block = [
			5
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Crib_Sk8Ped_01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Crib_Sk8Ped_02a = {
		time_block = [
			5
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Crib_Sk8Ped_02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Crib_Sk8Ped_03a = {
		time_block = [
			5
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Crib_Sk8Ped_03b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Crib_Sk8Ped_04a = {
		time_block = [
			0
			12
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Crib_Sk8Ped_04b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Crib_Sk8Ped_05a = {
		time_block = [
			0
			12
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Crib_Sk8Ped_05b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Crib_Sk8Ped_06a = {
		time_block = [
			0
			12
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Crib_Sk8Ped_06b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Crib_Sk8Ped_07a = {
		time_block = [
			0
			12
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Crib_Sk8Ped_07b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_SessionPeds01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcmall_sessionpeds01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_SessionPeds02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcmall_sessionpeds02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_SessionPeds03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcmall_sessionpeds03b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	DcMall_SessionPeds04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcmall_sessionpeds04b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	DcMall_StandTalk01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_2PedsTalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_StandTalk02 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_StandTalk02a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_StandTalk03 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_StandTalk03a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_StandTalk04 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_StandTalk04a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_LeanTalk01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_2LeanTalk01
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_LeanTalk02 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_LeanTalk02a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_LeanTalk03 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_LeanTalk03a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_LeanTalk04 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_LeanTalk04a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_SitTalk01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_SitTalk01a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_SitTalk02 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_SitTalk02a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_SitTalk03 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_SitTalk03a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_SitTalk04 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_SitTalk04a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_SitTalk05 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_SitTalk05a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_SitTalk06 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_SitTalk06a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_SitTalk07 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_SitTalk07a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_BumBeg01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_BumBeg01a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_BumBegScene01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	DcMall_BumsSlpSit01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_BumsSlpSit01a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_BumsSlpSit02 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_BumsSlpSit01a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	DcMall_CannonPed01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_StealingDeck01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcmall_stealingdeck01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_StealingDeck02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcmall_stealingdeck02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_GottaPee01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_KidPlane01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_KidPlane01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_TourGuide01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $large_scene_relevance_params
		node_flags = [
			{
				name = dcmall_tourguide01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museums_scenes
		type = primary
	}
	DcMall_TourGuide02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $large_scene_relevance_params
		node_flags = [
			{
				name = dcmall_tourguide02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_BumCop01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_BumCop02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_BumCop03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museums_scenes
		type = secondary
	}
	DcMall_VertSkate01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcMall_VertSkate01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	DcMall_Guard01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	DcAir_StandTalk01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	DcAir_SitTalk01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	DcAir_LeanTalk01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	DcAir_LeanScene01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	DcAir_TourGuide01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcair_tourguide01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museum_int_scenes
		type = primary
	}
	DcAir_TourGuide02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcair_tourguide02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museum_int_scenes
		type = primary
	}
	DcAir_TourGuide03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcair_tourguide03b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museum_int_scenes
		type = primary
	}
	DcAir_KidInPlane00a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcAir_KidInPlane00b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museum_int_scenes
		type = primary
	}
	DcAir_KidPlane01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcAir_KidPlane01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museum_int_scenes
		type = primary
	}
	DcAir_KidPlane02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = DcAir_KidPlane02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museum_int_scenes
		type = primary
	}
	DcAir_CopHarrasSk8r01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = dcair_copharrassk8r01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_museum_int_scenes
		type = secondary
	}
	DcAir_TouristTalk_01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museum_int_scenes
		type = secondary
	}
	DcAir_TouristTalk_02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museum_int_scenes
		type = secondary
	}
	DcAir_TouristTalk_03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museum_int_scenes
		type = secondary
	}
	DcAir_TouristTalk_04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museum_int_scenes
		type = secondary
	}
	DcAir_BathroomPed01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_museum_int_scenes
		type = secondary
	}
	Monu_StandTalk01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Monu_StandTalk01a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Monu_StandTalk02 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Monu_StandTalk02a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Monu_StandTalk03 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Monu_StandTalk03a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Monu_StandTalk04 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Monu_StandTalk04a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Monu_LeanTalk01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Monu_LeanTalk02 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Monu_LeanTalk03 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Monu_LeanTalk04 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Monu_SitTalk02 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Monu_BumBeg_02 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Monu_BumBegScene01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Monu_TalkingScene01 = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = Monu_TalkingScene01a
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Monu_BumCop01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_monuments_scenes
		type = secondary
	}
	Monu_BumCop02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_monuments_scenes
		type = secondary
	}
	Monu_BumCop03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_monuments_scenes
		type = secondary
	}
	Monu_ArrestBum01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_monuments_scenes
		type = secondary
	}
	Monu_Robot01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = monu_robot01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_monuments_scenes
		type = secondary
	}
	Monu_StealingDeck01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = monu_stealingdeck01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_monuments_scenes
		type = secondary
	}
	Monu_CopHarrasSk8r01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = monu_copharrassk8r01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_monuments_scenes
		type = secondary
	}
	Monu_Guard01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Monu_SessionPed01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = monu_sessionped01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Monu_SessionPed02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = monu_sessionped02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Monu_SessionPed03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = monu_sessionped03b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_monuments_scenes
		type = primary
	}
	Monu_SessionPed04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = monu_sessionped04b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Monu_SessionPed05a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = monu_sessionped05b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	BWBridge_Worker01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_bw_Bridge_scenes
		type = secondary
	}
	BWBridge_Worker02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_bw_Bridge_scenes
		type = primary
	}
	BWBridge_BumScene01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BWBridge_BumScene02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BWBridge_BumScene03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BWBridge_BumScene04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BWBridge_BumScene05a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BWBridge_BumScene06a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BWBridge_BumScene07a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	WPB_BenchScene01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = WPB_BenchScene01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_wp_Bridge_scenes
		type = secondary
	}
	WPB_BenchScene02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_wp_Bridge_scenes
		type = secondary
	}
	WPB_BenchScene03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_wp_Bridge_scenes
		type = secondary
	}
	WPB_BenchScene04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_wp_Bridge_scenes
		type = primary
	}
	WPB_BenchScene05a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_wp_Bridge_scenes
		type = secondary
	}
	WPB_BenchScene06a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_wp_Bridge_scenes
		type = primary
	}
	WPB_BenchScene07a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_wp_Bridge_scenes
		type = secondary
	}
	WPB_BenchScene08a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_wp_Bridge_scenes
		type = secondary
	}
	WPB_BenchScene09a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_wp_Bridge_scenes
		type = secondary
	}
	Lans_TalkPeds01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Lansdowne_scenes
		type = secondary
	}
	Lans_TalkPeds02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Lansdowne_scenes
		type = secondary
	}
	Lans_TalkPeds03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Lansdowne_scenes
		type = secondary
	}
	Lans_TalkPeds04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Lansdowne_scenes
		type = secondary
	}
	Lans_TalkPeds05a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		asset_context = z_Lansdowne_scenes
		type = secondary
	}
	Lans_SessionPed01a = {
		time_block = [
			0
			11
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Lans_SessionPed02a = {
		time_block = [
			12
			18
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Lans_SessionPed03a = {
		time_block = [
			19
			24
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped03b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Lans_SessionPed04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped04b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Lansdowne_scenes
		type = secondary
	}
	Lans_SessionPed05a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped05b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Lans_SessionPed06a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped06b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	Lans_SessionPed07a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped07b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Lansdowne_scenes
		type = primary
	}
	Lans_SessionPed08a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped08b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Lans_SessionPed09a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped09b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Lansdowne_scenes
		type = secondary
	}
	Lans_SessionPed10a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = lans_sessionped10b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	BCity_Guard01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_Guard02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_Guard03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_2PedsTalk01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_2PedsTalk02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_2PedsTalk03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_2PedsTalk04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_LeanTalk01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_LeanTalk02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_LeanTalk03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_LeanTalk04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_BumSlpSit01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_BumSlpSit02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_BumSlpSit03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_2Beggars01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_2Beggars02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_2Beggars03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_2Beggars04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_2Beggars05a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	BCity_Session01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bcity_session01b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	BCity_Session02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bcity_session02b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	BCity_Session03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bcity_session03b
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_BCity_scenes
		type = secondary
	}
	BCity_Session04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bcity_session04b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = secondary
	}
	BCity_Session05a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bcity_session05b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	BCity_Session06a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = bcity_session06b
				on_spawn = 1
				on_despawn = 0
			}
		]
		type = primary
	}
	Secret_BumScene01a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Secret_BumScene02a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Secret_BumScene03a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Secret_BumScene04a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = secondary
	}
	Secret_BumGoat00a = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		type = primary
	}
	m_c3_epicphoto2_ambientscene = {
		time_block = [
			-1
			0
		]
		relevance_params = $default_scene_relevance_params
		node_flags = [
			{
				name = m_c3_epicphoto2_hat_ambientscene
				on_spawn = 1
				on_despawn = 0
			}
		]
		asset_context = z_Bell_scenes
		type = primary
	}
}
AS_Sk8Session01 = {
	ambient_peds = true
	time_block = [
		8
		19
	]
	relevance_params = $default_scene_relevance_params
	type = primary
	start_script = SceneControl_Sk8Session01
}

script Scene_PlayAnimScript 
	eventcache_add event_id = Control_RunAnimScript event_data = {anim_script = <anim_script> params = <params>}
endscript

script Scene_PlayAnimScriptAndBlock 
	eventcache_add event_id = Control_RunAnimScript event_data = {anim_script = <anim_script> params = <params>}
	blockuntilevent \{anytypes = [
			Scene_AnimScript_Finished
			Scene_AnimScript_Failed
		]}
	if (<type> = Scene_AnimScript_Failed)
		return \{failed = true}
	endif
endscript

script Scene_StopAnimScript 
	eventcache_add \{event_id = Control_ClearAnimScript}
endscript

script Scene_AlignTo 
	if NOT gotparam \{object_id}
		scriptassert \{"object_id not passed to Scene_AlignTo"}
	endif
	eventcache_add event_id = Control_AlignTo event_data = {name = <object_id>}
endscript

script AmbientScene_SpawnScene 
	<index> = 0
	getarraysize children
	if (<array_size> > 0)
		begin
		ambientscene_spawnobject name = (<children> [<index>]) scene_name = <scene_name>
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	if gotparam node_flags
		getarraysize node_flags
		<index> = 0
		begin
		if structurecontains structure = (<node_flags> [<index>]) on_spawn
			changenodeflag (<node_flags> [<index>].name) (<node_flags> [<index>].on_spawn)
			printf "Changing node flag %a to %b" a = (<node_flags> [<index>].name) b = (<node_flags> [<index>].on_spawn)
		endif
		repeat <array_size>
	endif
endscript

script AmbientScene_KillScene 
	<index> = 0
	getarraysize children
	if (<array_size> > 0)
		begin
		if compositeobjectexists (<children> [<index>])
			(<children> [<index>]) :obj_spawnscript AmbientScene_DespawnObject
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	if gotparam node_flags
		getarraysize node_flags
		<index> = 0
		begin
		if structurecontains structure = (<node_flags> [<index>]) on_despawn
			changenodeflag (<node_flags> [<index>].name) (<node_flags> [<index>].on_despawn)
			printf "Changing node flag %a to %b" a = (<node_flags> [<index>].name) b = (<node_flags> [<index>].on_despawn)
		endif
		repeat <array_size>
	endif
endscript

script ambientscene_spawnobject 
	priority = $COIM_Priority_NonPermanent_Scene
	new_ped = {
		priority = <priority>
		scene_ped = true
		ped_type = ped_life
		spawn_node_name = <spawn_node_name>
		name = <name>
		assetcontext = <assetcontext>
		temp_perm = true
	}
	if NOT SpawnAmbientObject <new_ped>
		wait 1 gameframe
		if NOT compositeobjectexists <name>
			printf "==================="
			printf "FAILED TO SPAWN AMBIENT SCENE OBJECT"
			printstruct <new_ped>
			dumpcoimentries
			dumpheaps
			printf "==================="
			softassert "Spawn Ambient Object Failed"
			return false
		endif
	endif
	<name> :settags scene_name = <scene_name>
	if gotparam ambient_area
		<name> :settags ambient_area = <ambient_area>
	endif
	return true
endscript

script AmbientScene_ActivateNodeFlag 
	getsingletag \{ambient_scene}
	if NOT gotparam \{ambient_scene}
		softassert \{"AmbientScene_ActivateNodeFlag called on ped not in a scene"}
	endif
	if NOT gotparam \{index}
		<index> = 0
	endif
	changenodeflag ($ambient_scenes.<scene_name>.node_flags [<index>]) 1
endscript

script AmbientScene_DeactivateNodeFlag 
	getsingletag \{ambient_scene}
	if NOT gotparam \{ambient_scene}
		softassert \{"AmbientScene_ActivateNodeFlag called on ped not in a scene"}
	endif
	if NOT gotparam \{index}
		<index> = 0
	endif
	changenodeflag ($ambient_scenes.<scene_name>.node_flags [<index>]) 0
endscript

script ambientscene_budget_warning 
	if screenelementexists id = ambientscene_budget_warning
		return
	endif
	formattext textname = text "WARNING: Scenes are using %a/%b of the total scene budget" a = <scene_used> b = <scene_max>
	createscreenelement {
		id = ambientscene_budget_warning
		type = textelement
		parent = root_window
		pos = (640.0, 360.0)
		just = [center center]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
		rgba = [128 128 0 255]
		text = <text>
		font = text_a1
		scale = 1.0
		z_priority = 2000
	}
	spawnscriptlater ambientscene_budget_warning_spawned
endscript

script ambientscene_budget_warning_spawned 
	wait \{1
		second}
	if screenelementexists \{id = ambientscene_budget_warning}
		destroyscreenelement \{id = ambientscene_budget_warning}
	endif
endscript

script AnimScript_Controltest 
	obj_getid
	Interact_PlayAnimAndBlock \{anim = PedMGuitarPlayer_Play
		reaction_state = dummy
		blend_period = 0.0}
endscript
ambient_scene_pak = none

script AmbientScenes_ManagePak 
	<zone_changed> = false
	begin
	getpakmancurrent map = scenes
	<current_scene_pak> = <pak>
	getpakmancurrent map = zones
	<current_zone_pak> = <pak>
	extendcrc <current_zone_pak> '_scenes' out = current_zone_pak_extended
	if NOT (<current_scene_pak> = <current_zone_pak_extended>)
		if (<zone_changed> = false)
			<zone_changed> = true
		else
			if NOT pendingpakmanloads map = zones
				DestroyAmbientScenes asset_context = <current_scene_pak>
				change ambient_scene_pak = none
				wait 1 gameframe
				if structurecontains structure = $SceneLinks <current_zone_pak_extended>
					setpakmancurrent map = scenes pak = <current_zone_pak_extended>
					change ambient_scene_pak = <current_zone_pak_extended>
				else
					setpakmancurrent map = scenes pak = none
				endif
			endif
		endif
	else
		<zone_changed> = false
	endif
	wait 5 seconds
	repeat
endscript

script scene_finished 
	<master_node> :eventcache_add event_id = scene_finished
endscript

script AmbientScenes_ForceSpawn 
	killspawnedscript \{name = AmbientScenes_ManagePak}
	if structurecontains structure = ($ambient_scenes.<scene>) asset_context
		setpakmancurrent map = scenes pak = ($ambient_scenes.<scene>.asset_context)
		change ambient_scene_pak = ($ambient_scenes.<scene>.asset_context)
	endif
	KillAllPedLifeObjects
	change force_spawn_scene = <scene>
endscript
