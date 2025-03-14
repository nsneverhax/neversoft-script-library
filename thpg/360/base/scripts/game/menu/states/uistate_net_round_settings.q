
script RegisterState_UI_net_round_settings 
	registerstate \{name = UIstate_net_round_settings
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_net_round_settings
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
						state = ui_destroy_net_round_settings
					}
				]
			}
		]}
endscript
