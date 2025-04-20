
script RegisterState_UI_debugoptions 
	registerstate \{name = UIstate_debugoptions
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_debugoptions
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
						state = ui_destroy_debugoptions
					}
				]
			}
		]}
endscript
