
script RegisterState_UI_freeskate_ready 
	registerstate \{name = UIstate_freeskate_ready
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_freeskate_ready
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
						state = ui_destroy_freeskate_ready
					}
				]
			}
		]}
endscript
