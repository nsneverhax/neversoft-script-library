
script RegisterState_UI_net_currentplayers 
	registerstate \{name = Uistate_net_currentplayers
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_net_currentplayers
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
						state = ui_destroy_net_currentplayers
					}
				]
			}
		]}
endscript
