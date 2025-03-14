
script RegisterState_UI_net_confirmquit 
	registerstate {
		name = UIState_net_confirmquit
		task = {name = task_runscript
			params = {script_name = ui_create_net_confirmquit}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_net_confirmquit
					}]
			}
		]
	}
	registerstate {
		name = UIstate_net_confirmquit_to_singleplayer
		task = {name = task_runscript
			params = {script_name = ui_create_net_confirmquit
				script_params = {to_singleplayer = 1}
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_net_confirmquit
					}]
			}
		]
	}
endscript
