
script RegisterState_UI_view_missions 
	registerstate \{name = UIstate_view_missions
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_view_missions
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
						state = ui_destroy_view_missions
					}
				]
			}
		]}
endscript
