
script RegisterBehaviors_SkateAgent 
	registerstate {
		name = bv_agent
		transitions = [{
				events = [enter_behavior]
				responses = [{replacement = detect
						state = Bv_RunStatsCustomBehavior
						params = [{name = type val = common_detection}]
					}]
			}
			{
				conditions = [{name = agent_comparealertstate
						params = {state = none}
					}
					{name = agent_comparealertstate
						params = {state = lostthreat}
					}]
				responses = [{replacement = logic
						state = Bv_RunStatsCustomBehavior
						params = [{name = type val = alert_state_life}]
					}]
			}
			{
				conditions = [{name = agent_comparealertstate
						params = {state = exposedthreat}
					}]
				responses = [{replacement = logic
						state = Bv_RunStatsCustomBehavior
						params = [{name = type val = alert_state_combat}]
					}]
			}
			{events = [become_ambient]
				responses = [{replacement = ambient
						state = Bv_Agent_Become_Ambient
					}]
			}]
	}
	registerstate {
		name = Bv_StandardCommonDetection
		transitions = [{events = [enter_behavior]
				responses = [{replacement = enemy
						state = Bv_GenEvents_Interest_Enemy
					}
					{replacement = trample
						state = Bv_DetectTrampleDanger
					}]
			}]
	}
	registerstate {
		name = Bv_RunStatsCustomBehavior
		task = {name = Task_RunStatsCustomBehavior}
	}
	registerstate {
		name = Bv_Agent_Life
		task =
		{
			name = Task_SetInteractMode
			params = {interact_mode = life}
		}
	}
	registerstate {
		name = Bv_Agent_Combat
		task =
		{
			name = Task_SetInteractMode
			params = {interact_mode = aggressive_combat}
		}
	}
endscript

script Bv_Agent_No_Combat 
	printf \{"==== Standard combat stub: clearing enemy interest to return to life"}
	agent_removethreat
	agent_clearinterest \{interest_type_id = enemy}
endscript

script Bv_Agent_Become_Ambient 
	obj_getid
	if getsingletag scene_name
		if NOT RemoveFromScene scene_name = <scene_name> id = <objid>
			softassert "RemoveFromScene failed on scene ped %a." a = <objid>
			return
		endif
	else
		softassert "Bv_Agent_Become_Ambient couldn't determine what scene ped %a is from." a = <objid>
		return
	endif
	if getsingletag ambient_area
		<ambient_areas> = []
		addarrayelement array = <ambient_areas> element = <ambient_area>
		agent_setinteractareas interact_areas = <array> request_search = true
	else
		softassert "Failed to find valid ambient area for scene %a" a = <scene_name>
		agent_setinteractareas interact_areas = [invalid_area] request_search = true
	endif
	Navigation_SceneResumeMovement
	interact_finishcurnode
endscript
