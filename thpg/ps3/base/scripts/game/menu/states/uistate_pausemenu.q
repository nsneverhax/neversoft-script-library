
script RegisterState_UI_PauseMenu 
	registerstate \{name = uistate_pausemenu
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_pausemenu
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
						state = ui_destroy_pausemenu
					}
				]
			}
		]}
endscript
