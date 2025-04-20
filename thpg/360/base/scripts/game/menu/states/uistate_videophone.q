
script RegisterState_UI_videophone 
	registerstate {
		name = UIstate_videophone
		task = {name = task_runscript
			params = {script_name = ui_create_videophone}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_videophone
					}]
			}
		]
	}
	registerstate {
		name = UIstate_videophone_priority
		task = {name = task_runscript
			params = {script_name = ui_create_videophone
				script_params = {priority = 1}
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_videophone_priority
					}]
			}
		]
	}
endscript
