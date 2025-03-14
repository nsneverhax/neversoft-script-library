
script RegisterState_UI_remaptricks 
	registerstate \{name = UIstate_remaptricks
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_remaptricks
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
						state = ui_destroy_remaptricks
					}
				]
			}
		]}
endscript
