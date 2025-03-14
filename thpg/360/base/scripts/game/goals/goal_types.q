goal_types = [
	arcade
	chalk
	classic
	dummy
	film
	hawkman
	high_score_run
	net
	photo
	race
	story
	test_goal
	track_man
	travel
	turf
	uber
]
goal_type_photo_career_goal_points = 5
goal_type_photo_rigger_goal_points = 5
goal_type_photo_hardcore_goal_points = 5
goal_type_film_career_goal_points = 5
goal_type_film_rigger_goal_points = 5
goal_type_film_hardcore_goal_points = 5
goal_type_info = {
	arcade = {
		type = arcade
		name = "ARCADE"
		goal_rewards = {
			goal_points = {
				generic = 0
			}
			skill_points = 0
			cash_reward = [
				0
				0
				0
			]
		}
		leaderboard = [
		]
	}
	chalk = {
		type = chalk
		name = "SKILL CHALLENGES"
		should_rollout = false
		is_ambient = true
		goal_rewards = {
			goal_points = {
				generic = 3
			}
			skill_points = 10
			cash_reward = [
				20
				20
				20
			]
		}
		leaderboard = [
			{
				metric = grade
			}
			{
				metric = score_accumulator
				checkpoint = checkpoint1
				tool = accumulator
			}
		]
	}
	classic = {
		type = classic
		name = "CLASSIC MODE"
		goal_rewards = {
			goal_points = {
				generic = 0
			}
			skill_points = 0
			cash_reward = [
				0
				0
				0
			]
		}
		leaderboard = [
		]
	}
	dummy = {
		type = dummy
		name = "DUMMY (TEST)"
		leaderboard = [
		]
	}
	uber = {
		type = uber
		name = "UBER GOALS"
		goal_rewards = {
			goal_points = {
				generic = 0
			}
			skill_points = 0
			cash_reward = [
				0
				0
				0
			]
		}
		leaderboard = [
		]
	}
	test_goal = {
		type = test_goal
		name = "TEST GOALS"
		leaderboard = [
		]
	}
	film = {
		type = film
		name = "FILM GOALS"
		goal_rewards = {
			goal_points = {
				generic = 5
			}
			skill_points = 10
			cash_reward = [
				20
				20
				20
			]
		}
		leaderboard = [
		]
	}
	hawkman = {
		type = hawkman
		name = "HAWK-MAN"
		goal_rewards = {
			skill_points = 10
			goal_points = {
				generic = 5
			}
			cash_reward = [
				20
				20
				20
			]
		}
		leaderboard = [
			{
				metric = grade
			}
			{
				metric = time_elapsed
				tool = timer
			}
		]
	}
	high_score_run = {
		type = high_score_run
		name = "HIGH SCORE RUN"
		goal_rewards = {
			goal_points = {
				generic = 0
			}
			skill_points = 3
		}
		leaderboard = [
			{
				metric = grade
			}
			{
				metric = score
				tool = score
			}
		]
	}
	net = {
		type = net
		name = "NET GOALS"
		in_debug_menu = false
		goal_rewards = {
			goal_points = {
				generic = 0
			}
		}
		leaderboard = [
		]
	}
	photo = {
		type = photo
		name = "PHOTO GOALS"
		goal_rewards = {
			goal_points = {
				generic = 5
			}
			skill_points = 10
			cash_reward = [
				20
				20
				20
			]
		}
		leaderboard = [
		]
	}
	race = {
		type = race
		name = "RACE GOALS"
		goal_rewards = {
			goal_points = {
				generic = 4
			}
			skill_points = 10
			cash_reward = [
				20
				20
				20
			]
		}
		leaderboard = [
		]
	}
	story = {
		type = story
		name = "STORY GOALS"
		goal_rewards = {
			skill_points = 5
		}
		leaderboard = [
		]
	}
	track_man = {
		type = track_man
		name = ""
		should_rollout = false
		in_debug_menu = false
		goal_rewards = {
			goal_points = {
				generic = 0
			}
		}
		leaderboard = [
		]
	}
	travel = {
		type = travel
		name = "TRAVEL"
		in_debug_menu = false
		goal_rewards = {
			goal_points = {
				generic = 0
			}
		}
		leaderboard = [
		]
	}
	turf = {
		type = turf
		name = "LINE CHALLENGES"
		should_rollout = false
		is_ambient = true
		goal_rewards = {
			goal_points = {
				generic = 4
			}
			skill_points = 10
			cash_reward = [
				20
				20
				20
			]
		}
		leaderboard = [
			{
				metric = grade
			}
			{
				metric = score_accumulator
				checkpoint = checkpoint1
				tool = accumulator
			}
		]
	}
}

script goal_get_type_info 
	requireparams \{[
			goal
		]
		all}
	gman_getgoaltype goal = <goal>
	return goal_type_info = ($goal_type_info.<goal_type>)
endscript
