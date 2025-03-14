
script RegisterState_ui_endrankings 
	registerstate \{name = UIstate_endrankings
		task = {
			name = task_runscript
			params = {
				script_name = ui_endrankings_create
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
						state = ui_endrankings_destroy
					}
				]
			}
		]}
endscript
