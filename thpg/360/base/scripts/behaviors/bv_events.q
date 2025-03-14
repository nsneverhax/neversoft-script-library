
script RegisterBehaviors_Events 
	registerstate \{name = Bv_AddEvent
		task = {
			name = task_runscript
			params = {
				script_name = eventcache_add
			}
		}}
	registerstate \{name = Bv_BroadcastEvent
		task = {
			name = task_runscript
			params = {
				script_name = eventcache_broadcast
			}
		}}
endscript
