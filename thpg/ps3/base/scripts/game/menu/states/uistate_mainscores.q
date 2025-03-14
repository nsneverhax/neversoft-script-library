
script RegisterState_UI_mainscores 
	registerstate {
		name = UIstate_mainscores
		task = {name = task_runscript
			params = {script_name = ui_create_mainscores
				script_params = {from_state = UIstate_mainscores}}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_mainscores
					}]
			}
		]
	}
	registerstate {
		name = UIstate_mainscores_fromgameplay
		task = {name = task_runscript
			params = {script_name = ui_create_mainscores
				script_params = {from_state = uistate_gameplay}}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_mainscores
					}]
			}
		]
	}
	registerstate {
		name = UIstate_highscores_fromhsfspause
		task = {name = task_runscript
			params = {script_name = ui_create_mainscores
				script_params = {from_state = uistate_pausemenu}}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_mainscores
					}]
			}
		]
	}
endscript
