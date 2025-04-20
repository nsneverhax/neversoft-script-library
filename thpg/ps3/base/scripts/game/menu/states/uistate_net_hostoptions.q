
script RegisterState_UI_net_hostoptions 
	registerstate \{name = UIstate_net_hostoptions
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_net_hostoptions
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
						state = ui_destroy_net_hostoptions
					}
				]
			}
		]}
endscript
