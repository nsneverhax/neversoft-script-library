bv_all_params = [
	{
		name = no_name
		ref = all_params
	}
]

script RegisterStates_Core 
	RegisterState \{name = Bv_RunBehavior
		task = {
			name = Task_RunBehavior
		}}
	RegisterState \{name = Bv_SetMoveDesc
		task = {
			name = Task_SetMoveDesc
		}}
	RegisterState \{name = Bv_RunScript
		task = {
			name = Task_RunScript
		}}
	RegisterState \{name = Bv_SpawnScript
		task = {
			name = Task_SpawnScript
		}}
endscript
