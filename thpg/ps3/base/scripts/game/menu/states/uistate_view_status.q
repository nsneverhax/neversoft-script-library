
script RegisterState_UI_view_status 
	registerstate \{name = UIstate_view_status
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_view_status
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
						state = ui_destroy_view_status
					}
				]
			}
		]}
endscript
