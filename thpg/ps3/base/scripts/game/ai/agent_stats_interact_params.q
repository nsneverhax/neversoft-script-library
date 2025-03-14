interact_node_rating_use_visibility = true
ss_node_max_life_secs = 30.0
interact_weight_standard = {
	scale = 1.0
	non_zero_offset = 0.0
}
interact_search_params_any = {
}
interact_search_params_life_standard = {
	node_frequency = {
		weight = {
			scale = 1.0
			non_zero_offset = 2.0
		}
		data = {
			min_rating_time = 10.0
			max_rating_time = 25.0
		}
	}
	needs = {
		weight = $interact_weight_standard
		data = {
		}
	}
	randomness = {
		weight = {
			scale = 0.3
			non_zero_offset = 0.0
		}
		data = {
		}
	}
	sticky = {
		weight = {
			scale = 0.5
			non_zero_offset = 0.0
		}
		data = {
		}
	}
	dist_to_player = {
		weight = $interact_weight_standard
		data = {
			optimal_dist = 15.0
			fade_dist = 15.0
		}
	}
	visibility = {
		weight = $interact_weight_standard
		data = {
		}
	}
	facing = {
		weight = $interact_weight_standard
		data = {
		}
	}
}
interact_search_params_guard_intercept = {
	generic_combat = {
		weight = $interact_weight_standard
		data = {
		}
	}
	interest_intercept = {
		weight = $interact_weight_standard
		data = {
			intercept_interests = [
				{
					interest_type = enemy
					max_dist = 40.0
				}
			]
		}
	}
}
interact_params_group_empty = {
	invalid_behavior = bv_stand
	search_params = [
	]
}
interact_params_group_life_standard = {
	invalid_behavior = bv_stand
	search_params = [
		{
			$interact_search_params_life_standard
		}
	]
}
interact_params_group_guard_intercept = {
	$interact_params_group_life_standard
	search_params = [
		{
			$interact_search_params_guard_intercept
		}
	]
}
interact_params_standard = {
	life = $interact_params_group_life_standard
	aggressive_combat = $interact_params_group_empty
	cautious_combat = $interact_params_group_empty
	retreat_combat = $interact_params_group_empty
	investigate = $interact_params_group_empty
	search = $interact_params_group_empty
}
interact_params_civillian = {
	$interact_params_standard
}
interact_params_guard_intercept = {
	$interact_params_standard
	aggressive_combat = $interact_params_group_guard_intercept
}
