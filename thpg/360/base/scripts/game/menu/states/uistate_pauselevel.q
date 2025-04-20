
script RegisterState_UI_pauselevel 
	registerstate \{name = UIstate_pauselevel
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_pauselevel
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
						state = ui_destroy_pauselevel
					}
				]
			}
		]}
endscript
