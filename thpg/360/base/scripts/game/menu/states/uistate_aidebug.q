
script RegisterState_ui_aidebug 
	registerstate {
		name = UIstate_AIDebug
		task = {name = task_runscript
			params = {script_name = ui_aidebug_create
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_aidebug_destroy
					}]
			}
		]
	}
	registerstate {
		name = UIstate_AIDebug_Interactionnode
		task = {name = task_runscript
			params = {script_name = ui_aidebug_create_interactionnode
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_aidebug_destroy
					}]
			}
		]
	}
	registerstate {
		name = UIstate_AIDebug_Spawnnode
		task = {name = task_runscript
			params = {script_name = ui_aidebug_create_spawnnode
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_aidebug_destroy
					}]
			}
		]
	}
	registerstate {
		name = UIstate_AIDebug_Agent
		task = {name = task_runscript
			params = {script_name = ui_aidebug_create_agent
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_aidebug_destroy
					}]
			}
		]
	}
endscript
