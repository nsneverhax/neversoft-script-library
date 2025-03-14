
script RegisterState_UI_yourlife 
	registerstate \{name = UIstate_yourlife
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_yourlife
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
						state = ui_destroy_yourlife
					}
				]
			}
		]}
endscript
