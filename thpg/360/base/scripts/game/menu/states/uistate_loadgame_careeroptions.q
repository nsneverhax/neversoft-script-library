
script RegisterState_UI_LoadGame_CareerOptions 
	registerstate \{name = UIstate_loadgame_CareerOptions
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_loadgame
				script_params = {
					from_state = UIstate_loadgame_CareerOptions
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
