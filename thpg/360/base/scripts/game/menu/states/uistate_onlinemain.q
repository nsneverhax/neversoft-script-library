
script RegisterState_UI_onlinemain 
	registerstate \{name = UIstate_onlinemain
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_onlinemain
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
						state = ui_destroy_onlinemain
					}
				]
			}
		]}
endscript
