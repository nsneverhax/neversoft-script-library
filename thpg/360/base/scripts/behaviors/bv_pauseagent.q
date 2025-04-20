
script RegisterBehaviors_PauseAgent 
	registerstate {
		name = Bv_PauseAgent
		task = {name = Task_PauseAgent}
		transitions = []
	}
	registerstate {
		name = Bv_PauseLinearMovement
		transitions = [{events = [enter_behavior]
				responses = [{replacement = pause
						state = navigation_pauselinearmovement
					}
				]
			}
			{events = [exit_behavior]
				responses = [{replacement = pause
						state = navigation_resumelinearmovement
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_PauseGravity
		transitions = [{events = [enter_behavior]
				responses = [{replacement = pause
						state = Navigation_PauseStickToGround
					}
				]
			}
			{events = [exit_behavior]
				responses = [{replacement = pause
						state = Navigation_ResumeStickToGround
					}
				]
			}
		]
	}
endscript
