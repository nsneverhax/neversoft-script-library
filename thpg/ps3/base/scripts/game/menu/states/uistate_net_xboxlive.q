
script RegisterState_UI_net_xboxlive 
	registerstate \{name = UIstate_net_xboxlive
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_net_xboxlive
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
						state = ui_destroy_net_xboxlive
					}
				]
			}
		]}
endscript
