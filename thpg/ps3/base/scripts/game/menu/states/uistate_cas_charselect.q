
script RegisterState_UI_cas_charselect 
	registerstate \{name = UIstate_cas_charselect
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_cas_charselect
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
						state = ui_destroy_cas_charselect
					}
				]
			}
		]}
endscript
