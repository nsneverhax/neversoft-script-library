
script RegisterState_UI_loadgame 
	registerstate \{name = UIstate_LoadGame
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_loadgame
				script_params = {
					from_state = UIstate_LoadGame
				}
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
						state = ui_destroy_loadgame
					}
				]
			}
		]}
endscript
