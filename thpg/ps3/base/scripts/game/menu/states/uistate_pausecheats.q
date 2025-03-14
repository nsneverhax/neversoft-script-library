
script RegisterState_UI_pausecheats 
	registerstate \{name = UIstate_pausecheats
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_pausecheats
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
						state = ui_destroy_pausecheats
					}
				]
			}
		]}
endscript
