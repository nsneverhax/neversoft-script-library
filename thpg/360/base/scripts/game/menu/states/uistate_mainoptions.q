
script RegisterState_UI_mainoptions 
	registerstate \{name = UIstate_mainoptions
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_mainoptions
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
						state = ui_destroy_mainoptions
					}
				]
			}
		]}
endscript
