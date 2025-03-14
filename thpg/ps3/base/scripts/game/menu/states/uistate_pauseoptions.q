
script RegisterState_UI_PauseOptions 
	registerstate \{name = UIstate_pauseoptions
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_pauseoptions
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
						state = ui_destroy_pauseoptions
					}
				]
			}
		]}
endscript
