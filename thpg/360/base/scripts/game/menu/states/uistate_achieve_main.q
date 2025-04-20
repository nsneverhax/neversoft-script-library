
script RegisterState_UI_achieve_main 
	registerstate \{name = UIstate_achieve_main
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_achieve_main
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
						state = ui_destroy_achieve_main
					}
				]
			}
		]}
endscript
