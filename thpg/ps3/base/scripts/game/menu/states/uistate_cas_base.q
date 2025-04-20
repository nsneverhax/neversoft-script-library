
script RegisterState_UI_cas_base 
	registerstate \{name = UIstate_cas_base
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_cas_base
			}
		}
		transitions = [
			{
				events = [
					exit_behavior
				]
				responses = [
					{
						replacement = child
						state = ui_destroy_cas_base
					}
				]
			}
		]}
endscript
