
script RegisterState_UI_net_view_goals 
	registerstate {
		name = UIstate_net_view_goals
		task = {name = task_runscript
			params = {script_name = ui_create_net_view_goals}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_net_view_goals
					}]
			}
		]
	}
	registerstate {
		name = UIstate_net_view_goals_from_gameplay
		task = {name = task_runscript
			params = {script_name = ui_create_net_view_goals_from_gameplay
				script_params = {from_gameplay = 1}
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_net_view_goals_from_gameplay
					}]
			}
		]
	}
endscript
