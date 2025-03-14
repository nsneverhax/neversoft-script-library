
script RegisterState_UI_SoundOptions 
	registerstate \{name = UIstate_SoundOptions
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_soundoptions
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
						state = ui_destroy_soundoptions
					}
				]
			}
		]}
endscript
