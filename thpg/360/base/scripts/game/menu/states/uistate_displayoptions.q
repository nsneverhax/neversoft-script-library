
script RegisterState_UI_displayoptions 
	registerstate \{name = UIstate_DisplayOptions
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_displayoptions
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
						state = ui_destroy_displayoptions
					}
				]
			}
		]}
endscript
