
script RegisterState_UI_yourlife_newlife 
	registerstate \{name = UIstate_yourlife_newlife
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_yourlife_newlife
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
						state = ui_destroy_yourlife_newlife
					}
				]
			}
		]}
endscript
