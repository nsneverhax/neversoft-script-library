
script RegisterState_UI_mainmovies 
	registerstate \{name = UIstate_mainmovies
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_mainmovies
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
						state = ui_destroy_mainmovies
					}
				]
			}
		]}
endscript
