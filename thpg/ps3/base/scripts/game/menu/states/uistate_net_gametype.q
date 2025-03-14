
script RegisterState_UI_net_gametype 
	registerstate \{name = UIstate_net_gametype
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_net_gametype
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
						state = ui_destroy_net_gametype
					}
				]
			}
		]}
endscript
