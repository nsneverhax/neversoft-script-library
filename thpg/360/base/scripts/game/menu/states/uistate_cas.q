
script RegisterState_UI_cas 
	registerstate \{name = uistate_cas
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_cas
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
						state = ui_destroy_cas
					}
				]
			}
		]}
endscript
