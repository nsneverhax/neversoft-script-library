bv_all_params = [
	{
		Name = no_name
		ref = all_params
	}
]

script registerstates_core 
	RegisterState \{Name = bv_runbehavior
		task = {
			Name = task_runbehavior
		}}
	RegisterState \{Name = bv_setmovedesc
		task = {
			Name = task_setmovedesc
		}}
	RegisterState \{Name = bv_runscript
		task = {
			Name = task_runscript
		}}
	RegisterState \{Name = bv_spawnscript
		task = {
			Name = task_spawnscript
		}}
endscript
