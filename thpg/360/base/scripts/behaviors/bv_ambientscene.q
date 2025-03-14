
script RegisterBehaviors_AmbientScene 
	registerstate {
		name = Bv_RunAmbientScene
		task = {name = Task_RunAmbientScene}
	}
	registerstate {
		name = Bv_AmbientScene
		transitions = [{events = [enter_behavior]
				responses = [{replacement = relevance
						state = Bv_GenEventsSceneRelevance
						params = [{name = no_name ref = all_params}
							{name = state val = inactive}]
					}]
			}
		]
	}
	registerstate {
		name = Bv_SceneControl
		transitions = [{events = [Control_RunAnimScript]
				recur = true
				responses = [{replacement = animscript
						state = Bv_InteractNode_AnimScript_WaitForReaction
						params = [{name = interact_behavior_id ref = anim_script}
							{name = params ref = params}
							{name = finished_event_id val = Scene_AnimScript_Finished}
							{name = interrupt_event_id val = Scene_AnimScript_Interrupted}]
					}]
			}
			{events = [Scene_AnimScript_Finished]
				responses = [{replacement = animscript
						state = agent_finishcustomanim
					}]
			}
			{events = [Control_ClearAnimScript]
				responses = [{replacement = animscript
						state = bv_blank
					}]
			}
			{events = [Control_AlignTo]
				recur = true
				responses = [{replacement = look
						state = bv_LookAt_Shuffle
						params = [{name = name ref = name}]
					}]
			}
			{events = [Control_ClearAlignTo]
				responses = [{replacement = look
						state = bv_blank
					}]
			}]
	}
	registerstate {
		name = Bv_MasterNode_AmbientChat
		transitions = [{events = [enter_behavior]
				responses = [{replacement = this
						state = Bv_InteractNode_AnimScript_WaitForReaction
						params = [{name = behavior_id val = Bv_AmbientChat}]
					}]
			}]
	}
	registerstate {
		name = Bv_AmbientScene_CheckTime
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_Scr_AmbientScene_CheckTime
						params = [{name = no_name ref = all_params}]
					}]
			}]
	}
	registerstate {
		name = Bv_GenEventsSceneRelevance
		task = {name = Task_GenEventsSceneRelevance}
	}
	registerstate {
		name = Bv_AmbientScene_Active
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_Scr_AmbientScene_CheckDistance
						params = [{name = no_name ref = all_params}]
					}]
			}
			{events = [AmbientScene_InRange]
				responses = [{replacement = scene
						state = AmbientScene_SpawnScene
						params = [{name = no_name ref = all_params}]
					}]
			}
			{events = [AmbientScene_OutOfRange]
				responses = [{replacement = scene
						state = AmbientScene_KillScene
						params = [{name = no_name ref = all_params}]
					}]
			}]
	}
	registerstate {
		name = Bv_ManageAmbientScene
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = bv_message
						params = [{name = message val = "SPAWN SCENE"}]
					}]
			}]
	}
	registerstate {
		name = Bv_CleanupAmbientScene
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = bv_message
						params = [{name = message val = "CLEANUP SCENE"}]
					}]
			}]
	}
	registerstate {
		name = Bv_AmbientScene_Inactive
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = bv_blank
					}]
			}]
	}
endscript

script Bv_Scr_AmbientScene_CheckTime 
	begin
	if CompareGameTime time_block = <time_block>
		eventcache_add \{event_id = AmbientScene_Activate}
	else
		eventcache_add \{event_id = AmbientScene_Deactivate}
	endif
	wait \{1
		second}
	repeat
endscript

script Bv_Scr_AmbientScene_CheckDistance 
	begin
	obj_getid
	if getdistance objecta = player1 objectb = <objid>
		printstruct <...>
		if (<dist_atob> < <radius>)
			eventcache_add \{event_id = AmbientScene_InRange}
		else
			eventcache_add \{event_id = AmbientScene_OutOfRange}
		endif
	endif
	wait \{1
		second}
	repeat
endscript
