
script RegisterState_UI_Crib_Main 
	registerstate {
		name = UIstate_Crib_Main
		task = {name = task_runscript
			params = {script_name = ui_create_crib_main}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_crib_main
					}]
			}
		]
	}
	registerstate {
		name = UIstate_Crib_Purchase
		task = {name = task_runscript
			params = {script_name = ui_create_crib_purchase}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_crib_purchase
					}]
			}
		]
	}
	registerstate {
		name = UIstate_Crib_Theme
		task = {name = task_runscript
			params = {script_name = ui_create_crib_theme}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_crib_theme
					}]
			}
		]
	}
	registerstate {
		name = UIstate_Crib_Video
		task = {name = task_runscript
			params = {script_name = ui_create_crib_video}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_crib_video
					}]
			}
		]
	}
	registerstate {
		name = UIstate_Crib_Music
		task = {name = task_runscript
			params = {script_name = ui_create_crib_music}
		}
		transitions = [{events = [exit_behavior]
				responses = [{replacement = child
						state = ui_destroy_crib_music
					}]
			}
		]
	}
endscript
