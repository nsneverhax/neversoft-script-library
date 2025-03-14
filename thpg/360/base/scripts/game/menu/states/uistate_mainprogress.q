
script RegisterState_UI_mainprogress 
	registerstate \{name = UIstate_mainprogress
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_mainprogress
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
						state = ui_destroy_mainprogress
					}
				]
			}
		]}
endscript
