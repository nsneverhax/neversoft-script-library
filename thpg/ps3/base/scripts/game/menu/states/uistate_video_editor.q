
script RegisterState_UI_video_editor_Main 
	registerstate \{name = UIstate_video_editor_Main
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_video_editor_main
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
						state = ui_destroy_video_editor_main
					}
				]
			}
		]}
endscript

script RegisterState_UI_video_editor_Clip_Menu 
	registerstate \{name = UIstate_video_editor_Clip_Menu
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_video_editor_clip_menu
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
						state = ui_destroy_video_editor_clip_menu
					}
				]
			}
		]}
endscript

script RegisterState_UI_video_editor_Edit_View 
	registerstate \{name = UIstate_video_editor_Edit_View
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_video_editor_edit_view
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
						state = ui_destroy_video_editor_edit_view
					}
				]
			}
		]}
endscript

script RegisterState_UI_video_editor_clip_recorded_menu 
	registerstate \{name = UIstate_video_editor_clip_recorded_menu
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_video_editor_clip_recorded_menu
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
						state = ui_destroy_video_editor_clip_recorded_menu
					}
				]
			}
		]}
endscript

script RegisterState_UI_video_editor_camera_recorded_menu 
	registerstate \{name = UIstate_video_editor_camera_recorded_menu
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_video_editor_camera_recorded_menu
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
						state = ui_destroy_video_editor_camera_recorded_menu
					}
				]
			}
		]}
endscript

script RegisterState_UI_goal_film_clip_options 
	registerstate \{name = UIstate_goal_film_clip_options
		task = {
			name = task_runscript
			params = {
				script_name = goal_film_clip_options
			}
		}}
endscript

script RegisterState_UI_video_editor_rendering 
	registerstate \{name = UIstate_video_editor_rendering
		task = {
			name = task_runscript
			params = {
				script_name = ui_create_video_editor_rendering
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
						state = ui_destroy_video_editor_rendering
					}
				]
			}
		]}
endscript
