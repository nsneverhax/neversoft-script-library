
script RegisterState_UI_view_gaps 
	registerstate \{name = UIstate_view_gaps
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_view_gaps
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
						state = ui_destroy_view_gaps
					}
				]
			}
		]}
endscript
