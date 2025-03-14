
script RegisterBehaviors_GenEvents 
	registerstate {
		name = Bv_GenEvents_IsRendered
		task = {name = Task_GenEvents params = {event_gen_id = isrendered}}
		transitions = []}
	registerstate {
		name = Bv_GenEvents_WaitAfterShotFired
		task = {name = Task_GenEvents_WaitAfterEvent
			params = {event_id = broadcast_shotfired
				finished_event_id = WaitAfter_ShotFired_Finished
				min_time = 15.0
				max_time = 20.0}}
		transitions = []}
	registerstate {
		name = Bv_GenEvents_Facing
		task = {name = Task_GenEvents_Facing
			params = {finished_event_id = Is_Facing_Location
				interest_type_id = location}}
		transitions = []}
endscript

script Bv_GenEvents_Timer 
	wait <time> seconds
	eventcache_add event_id = <event_id>
endscript
