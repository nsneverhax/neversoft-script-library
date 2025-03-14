hero_danger_min = 100.0
hero_danger_decay_scale = 1.0
hero_total_danger_scale = 1.0
hero_proximity_scale = 1.5
hero_item_scale = 1.0
hero_num_attackers_scale = 1.0
aim_at_danger_delay = 0.1
danger_decay_rate = 1.2
base_proximity_danger_scale = 40.0
danger_proximity_max_dist = 2.5
base_item_danger_scale = 0.1
base_num_attackers_danger_scale = 60
danger_num_attackers_max = 5
threat_dangers = [
	{
		event = Broadcast_DynamiteNoise
		danger = 1.0
		stack = false
	}
	{
		event = broadcast_requestassistance
		danger = 1.0
		stack = false
	}
	{
		event = assistsquadmember
		danger = 5.0
		stack = false
	}
	{
		event = broadcast_requesthelp
		danger = 5.0
		stack = false
	}
	{
		event = helpsquadmember
		danger = 20.0
		stack = false
	}
	{
		event = Knock_Off_Horse
		danger = 70.0
		stack = false
	}
	{
		event = broadcast_shotfired
		danger = 10.0
		stack = false
	}
	{
		event = ShotMissed
		danger = 110.0
		stack = false
	}
	{
		event = aimed_at_by_hero
		danger = 70.0
		stack = false
	}
	{
		event = Shot_At_By_Hero
		danger = 115.0
		stack = false
	}
	{
		event = Shot_By_Hero
		danger = 150.0
		stack = false
	}
	{
		event = shot
		danger = 110.0
		stack = false
	}
	{
		event = grapple
		danger = 200.0
		stack = false
	}
	{
		event = escape_dynamite
		danger = 200.0
		stack = false
	}
	{
		event = Full_Trample_Danger
		danger = 60.0
		stack = false
	}
	{
		event = Broadcast_ExplosionNoise
		danger = 50.0
		stack = false
	}
	{
		event = Broadcast_Noise
		danger = 2.0
		stack = false
	}
]
time_danger_scale = 20.0
threat_danger_large = 1000
hero_init_danger_bias = 200
agent_init_danger_bias = 300
hero_min_danger_bias = 50
agent_min_danger_bias = 45
threat_maintain_exposed_displacement = 4.5
surprise_recognition_distance = 2.5
instant_recognition_distance = 250
delayed_recognition_distance = 375
surprise_suspicion_distance = 1.25
low_to_high_suspicion_distance = 500
high_to_low_suspicion_distance = 625
none_to_low_suspicion_distance = 100000000.0
low_to_none_suspicion_distance = 750
always_maintain_distance = 2.5
