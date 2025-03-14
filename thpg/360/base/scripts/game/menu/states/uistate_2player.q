
script RegisterState_UI_2player 
	registerstate {
		name = UIstate_2player
		task = {name = task_runscript
			params = {script_name = ui_create_2player}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_2player
					}]
			}
		]
	}
	registerstate {
		name = UIstate_2player_select_2p
		task = {name = task_runscript
			params = {script_name = ui_create_2player
				script_params = {second_player = second_player}
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_2player
					}]
			}
		]
	}
endscript
