
script RegisterState_UI_Photo_Viewer 
	registerstate \{name = UIstate_Photo_Viewer
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_photo_viewer
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
						state = ui_destroy_photo_viewer
					}
				]
			}
		]}
endscript
