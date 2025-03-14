
script RegisterState_UI_achieve_leaderboard 
	registerstate \{name = UIstate_achieve_leaderboard
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_achieve_leaderboard
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
						state = ui_destroy_achieve_leaderboard
					}
				]
			}
		]}
endscript
