
script RegisterState_UI_2player_create_game 
	registerstate \{name = UIstate_2player_create_game
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_2player_create_game
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
						state = ui_destroy_2player_create_game
					}
				]
			}
		]}
endscript
