
script RegisterAgentStatsStructures 
	SetNeedPerSec 0.1
	stats_standard = {
		health = $health_human
		item_speed = $item_speed_standard
		item_selection = $item_selection_standard
		accuracy = $accuracy_standard
		search = $search_standard
		vision = $vision_human
		angry = $angry_standard
		hearing = hearing_standard
		hostage = $hostage_standard
		reaction = $reaction_standard
		damage = $damage_standard
		enable_vehicle_detection = false
		enable_pickup_detection = true
		interact_params = $interact_params_standard
		custom_behavior = $custom_behavior_standard
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_standard
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_player
		trample = $trample_standard
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_goal_ped
		damage = $damage_goal_ped
		custom_behavior = $custom_behavior_goal_ped
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_boss_combat
		damage = $damage_boss_combat
		custom_behavior = $custom_behavior_civilian
		vision = $vision_boss_combat
		interact_params = $interact_params_guard_intercept
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_boss_life
		damage = $damage_boss_life
		custom_behavior = $custom_behavior_civilian
		vision = $vision_boss_life
		interact_params = $interact_params_guard_intercept
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_critical_goal_ped
		damage = $damage_critical_ped
		custom_behavior = $custom_behavior_goal_ped
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_critical_goal_ped_ignore_check
		damage = $damage_critical_ped_ignore_check
		custom_behavior = $custom_behavior_goal_ped
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_critical_ped
		damage = $damage_critical_ped
		item_selection = $item_selection_civilian
		custom_behavior = $custom_behavior_civilian
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_ragdoll_only
		damage = $damage_ragdoll_only
		item_selection = $item_selection_civilian
		custom_behavior = $custom_behavior_civilian
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_goal_ped_look_at_only
		custom_behavior = $custom_behavior_goal_ped_look_at_only
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_civilian
		item_selection = $item_selection_civilian
		custom_behavior = $custom_behavior_civilian
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_dummy
		item_selection = $item_selection_civilian
		custom_behavior = $custom_behavior_dummy
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_spectator
		item_selection = $item_selection_civilian
		custom_behavior = $custom_behavior_spectator
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_guard_intercept
		angry = $angry_short_temper
		damage = $damage_guard_intercept
		item_selection = $item_selection_civilian
		interact_params = $interact_params_guard_intercept
		custom_behavior = $custom_behavior_guard
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_guard_intercept_long_vision
		angry = $angry_short_temper
		damage = $damage_guard_intercept
		item_selection = $item_selection_civilian
		interact_params = $interact_params_guard_intercept
		custom_behavior = $custom_behavior_guard
		vision = $vision_cheat
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_big_bump_chase
		angry = $angry_medium_temper
		item_selection = $item_selection_civilian
		custom_behavior = $custom_behavior_civilian
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_civilian_kid
		angry = $angry_long_temper
		item_selection = $item_selection_civilian
		custom_behavior = $custom_behavior_civilian
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_civilian_female
		angry = $angry_no_chase
		item_selection = $item_selection_civilian
		custom_behavior = $custom_behavior_civilian
	}
	RegisterAgentStats {
		<stats_standard>
		name = stats_vehicle
		custom_behavior = $custom_behavior_vehicle
	}
endscript
