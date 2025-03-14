
script RegisterState_UI_Gameplay 
	registerstate \{name = uistate_gameplay
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_gameplay
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
						state = ui_destroy_gameplay
					}
				]
			}
		]}
endscript
