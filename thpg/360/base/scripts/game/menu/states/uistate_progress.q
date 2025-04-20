
script RegisterState_UI_progress 
	registerstate \{name = UIstate_progress
		task = {
			name = task_runscript
			params = {
				script_name = ui_load_accolade_pak
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
						state = nullscript
					}
				]
			}
		]}
endscript
