
script RegisterState_UI_savegame 
	registerstate \{name = UIstate_savegame
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_savegame
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
						state = ui_destroy_savegame
					}
				]
			}
		]}
endscript
