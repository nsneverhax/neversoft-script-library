
script RegisterState_ui_endmovies 
	registerstate {
		name = UIstate_endmovies1
		task = {name = task_runscript
			params = {script_name = ui_endmovies_create
				script_params = {sequence = ui_endmovies_1}
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_endmovies_destroy
					}]
			}
		]
	}
	registerstate {
		name = UIstate_endmovies2
		task = {name = task_runscript
			params = {script_name = ui_endmovies_create
				script_params = {sequence = ui_endmovies_2}
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_endmovies_destroy
					}]
			}
		]
	}
	registerstate {
		name = UIstate_endmovies3
		task = {name = task_runscript
			params = {script_name = ui_endmovies_create
				script_params = {sequence = ui_endmovies_3}
			}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_endmovies_destroy
					}]
			}
		]
	}
endscript
