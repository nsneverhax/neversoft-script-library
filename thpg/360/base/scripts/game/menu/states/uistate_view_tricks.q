
script RegisterState_UI_view_tricks 
	registerstate \{name = UIstate_view_tricks
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_view_tricks
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
						state = ui_destroy_view_tricks
					}
				]
			}
		]}
endscript
