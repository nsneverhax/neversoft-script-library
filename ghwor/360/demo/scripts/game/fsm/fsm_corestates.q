bv_all_params = [
	{
		name = no_name
		ref = all_params
	}
]

script registerstates_core 
	registerstate \{name = bv_runbehavior
		task = {
			name = task_runbehavior
		}}
	registerstate \{name = bv_setmovedesc
		task = {
			name = task_setmovedesc
		}}
	registerstate \{name = bv_runscript
		task = {
			name = task_runscript
		}}
	registerstate \{name = bv_spawnscript
		task = {
			name = task_spawnscript
		}}
endscript
