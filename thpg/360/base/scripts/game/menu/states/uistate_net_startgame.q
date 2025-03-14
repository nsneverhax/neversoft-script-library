
script RegisterState_UI_net_startgame 
	registerstate \{name = UIstate_net_startgame
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_net_startgame
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
						state = ui_destroy_net_startgame
					}
				]
			}
		]}
endscript
