
script RegisterState_UI_controlsetup 
	registerstate \{name = UIstate_ControlSetup
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_controlsetup
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
						state = ui_destroy_controlsetup
					}
				]
			}
		]}
endscript
