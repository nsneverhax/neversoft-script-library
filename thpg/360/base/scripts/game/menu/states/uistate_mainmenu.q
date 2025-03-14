
script RegisterState_UI_mainmenu 
	registerstate \{name = uistate_mainmenu
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_mainmenu
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
						state = ui_destroy_mainmenu
					}
				]
			}
		]}
endscript
