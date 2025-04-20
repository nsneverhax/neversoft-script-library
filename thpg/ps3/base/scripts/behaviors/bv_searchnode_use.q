
script RegisterBehaviors_SearchNode_Use 
	registerstate {
		name = Bv_SearchNode_Stand
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = move state = Bv_SlideTo_Loop_Interact}
					{replacement = stand state = bv_stand}
				]
			}
		]}
	registerstate {
		name = Bv_SearchNode_StandAlign
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = move state = Bv_SlideToAndAlignTo_Loop_Interact}
					{replacement = stand state = bv_stand}
				]
			}
		]}
	registerstate {
		name = Bv_QuickLook
		task = {name = Task_ModifyVision params = {vision_shape = sphere}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = stand
						state = bv_stand
					}
					{replacement = anim
						state = Bv_CustomAnimLoop
						params = [{name = anim val = Stand_QuickLook}]
					}
				]
			}
		]}
	registerstate {
		name = Bv_SearchNode_QuickLook
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = move
						state = Bv_SlideTo_Loop_Interact
					}
					{replacement = use
						state = Bv_QuickLook
					}
				]
			}
		]}
	registerstate {
		name = Bv_SearchNode_QuickLookAlign
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = move
						state = Bv_SlideToAndAlignTo_Loop_Interact
					}
					{replacement = use
						state = Bv_QuickLook
					}
				]
			}
		]}
endscript
