
script RegisterState_UI_stats 
	registerstate {
		name = UIstate_stats
		task = {name = task_runscript
			params = {script_name = ui_create_stats}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_stats
					}]
			}
		]
	}
	registerstate {
		name = UIstate_stats_from_gameplay
		task = {name = task_runscript
			params = {script_name = ui_create_stats
				script_params = {from_gameplay}
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_stats_from_gameplay
					}]
			}
		]
	}
endscript
