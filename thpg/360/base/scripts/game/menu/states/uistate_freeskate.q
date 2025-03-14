
script RegisterState_UI_freeskate 
	registerstate \{name = UIstate_freeskate
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_freeskate
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
						state = ui_destroy_freeskate
					}
				]
			}
		]}
endscript
