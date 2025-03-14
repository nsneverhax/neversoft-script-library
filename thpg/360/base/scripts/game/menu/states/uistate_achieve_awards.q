
script RegisterState_UI_achieve_awards 
	registerstate \{name = Uistate_achieve_awards
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_achieve_awards
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
						state = ui_destroy_achieve_awards
					}
				]
			}
		]}
endscript
