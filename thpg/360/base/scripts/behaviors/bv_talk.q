combattalker_mindelay = 0.5
combattalker_maxdelay = 1.0
combattalker_radius = 3.75

script RegisterBehaviors_Talk 
	registerstate {
		name = Bv_PlayTalkAnims
		task = {name = Task_PlayAnimSet
			params = {anim_set_id = Human_Talk
				anim_stage = custom
				sync_start_time = false
				finished_event_id = finished_talk_anim}
		}
		transitions = [{events = [finished_talk_anim] ,
				responses = [{replacement = this state = Bv_PlayTalkAnims}]
			}
		]
	}
	registerstate {
		name = Bv_Talk
		task = {name = Task_PlayVoiceStream
			params = {started_event_id = started_voice_stream
				finished_event_id = finished_voice_stream
				failed_event_id = talk_finished}
		}
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses = [{replacement = anims state = Bv_PlayTalkAnims}]
			}
			{
				events = [started_voice_stream] ,
				responses = [{replacement = detect state = Bv_Talk_DetectStop}]
			}
			{
				events = [talk_finished] ,
				responses = [{replacement = msg state = bv_message params = [{name = message val = "talk finished"}]}
					{replacement = this state = bv_blank}]
			}
		]
	}
	registerstate {
		name = Bv_Talk_DetectStop
		transitions =
		[
			{
				events = [finished_voice_stream] ,
				responses =
				[
					{
						replacement = voice
						state = eventcache_add
						params =
						[
							{name = event_id val = talk_finished}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_CombatTalker
		task = {name = Task_DetectVOEvents
			params = {finished_vo_event_id = combat_talker_finished
				failed_vo_event_id = combat_talker_failed
				detection_dist = 17.5}}
		transitions = [{events = [request_combat_talker]
				recur = true
				responses = [{replacement = play state = playvoiceoverbyevent
						params = [{name = started_event_id val = combat_talker_started}
							{name = finished_event_id val = combat_talker_finished}
							{name = failed_event_id val = combat_talker_failed}
							{name = priority val = voice_priority_low}
							{name = no_name ref = all_params}]}]
			}
			{events = [combat_talker_started]
				responses = [{replacement = stop state = Bv_CombatTalker_Assert}]
			}
			{events = [combat_talker_failed
					combat_talker_finished]
				responses = [{replacement = stop state = bv_blank}
					{replacement = play state = bv_blank}]
			}
		]
	}
	registerstate {
		name = Bv_CombatTalker_Assert
		transitions = [{events = [combat_talker_started]
				responses = [{replacement = msg state = bv_message params = [{name = message val = "response started while detecting stop"}]}
					{replacement = child state = Bv_Assert}]
			}
		]
	}
endscript
