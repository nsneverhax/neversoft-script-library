
script RegisterState_UI_leaderboard 
	registerstate \{name = uistate_leaderboard
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_leaderboard
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
						state = ui_destroy_leaderboard
					}
				]
			}
		]}
endscript
