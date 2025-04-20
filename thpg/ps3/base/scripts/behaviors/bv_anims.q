
script RegisterBehaviors_Anims 
	registerstate {
		name = Bv_Anims
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_Anims_Human}]
			}
			{events = [CustomAnimation]
				recur = true
				responses = [{replacement = child
						state = Bv_Anims_Custom
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = no_name ref = cycle}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
						]
					}
				]
			}
			{events = [CustomAnimation_Hold]
				recur = true
				responses = [{replacement = child
						state = Bv_Anims_CustomHold
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
						]
					}
				]
			}
			{events = [CustomAnimation_Sequence]
				recur = true
				responses = [{replacement = child
						state = Bv_Anims_CustomSequence
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = blend_period ref = blend_period}
							{name = event_id val = CustomAnimation_Finished}
						]
					}
				]
			}
			{events = [CustomAnimation_Loop]
				recur = true
				responses = [{replacement = child
						state = Bv_Anims_CustomLoop
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = no_name ref = cycle}
							{name = blend_period ref = blend_period}
							{name = event_id val = CustomAnimation_Finished}
						]
					}
				]
			}
			{events = [DisableAnimations] ,
				responses = [{replacement = this state = Bv_Anims_Disabled}]
			}
		]
	}
	registerstate {
		name = Bv_Anims_Disabled
		transitions = [{events = [EnableAnimations] ,
				responses = [{replacement = this state = Bv_Anims}]
			}
		]
	}
endscript
