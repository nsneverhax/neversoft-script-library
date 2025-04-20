
script RegisterState_UI_net_invite_ready 
	registerstate \{name = UIstate_net_invite_ready
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_net_invite_ready
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
						state = ui_destroy_net_invite_ready
					}
				]
			}
		]}
endscript
