Story_Menu_Video = {
	container_params = {
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		child_anchor = [
			center
			center
		]
	}
	helper_params = {
		pos = (-30.0, 180.0)
		rgba = [
			140
			140
			140
			255
		]
	}
	movie_params = {
		movie = 'train_story_menu'
		movie_ps3 = 'train_story_menu_ps3'
		start_frame = 0
		end_frame = 330
		pos = (-640.0, -360.0)
		just = [
			left
			top
		]
	}
	default_create_element = {
		type = textblockelement
		font = text_a1
		text = ""
		pos = (175.0, -65.0)
		dims = (725.0, 0.0)
		allow_expansion
		just = [
			center
			center
		]
		internal_just = [
			left
			top
		]
		rgba = [
			200
			200
			200
			255
		]
		scale = (0.9, 0.9)
		alpha = 0.0
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
	}
	default_fade_in_params = {
		alpha = 1.0
		time = 0.5
	}
	default_fade_out_params = {
		alpha = 0.0
		time = 0.5
	}
	events = [
		{
			frame = 0
			create_element = {
				type = textblockelement
				font = text_a1
				text = "STORY MENU"
				pos = (-360.0, 230.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					left
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 6
			wait_time = 2
		}
		{
			frame = 7
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 17
			create_element = {
				text = "If you're ever lost, remember to bring up your story menu. \\n\\n  (click \\bm to toggle)"
				pos = (180.0, -65.0)
			}
			create_element_ps3 = {
				text = "If you're ever lost, remember to bring up your story menu. \\n\\n  (press \\bm to toggle)"
				pos = (180.0, -65.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 17
			wait_time = 2
		}
		{
			frame = 60
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 65
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 160
			create_element = {
				type = textblockelement
				font = text_a1
				text = "It shows all your open stories."
				pos = (185.0, -65.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 160
			wait_time = 1
		}
		{
			frame = 204
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 208
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 260
			create_element = {
				text = "You can waypoint the next goal in any\\nof them. \\n\\n    (press \\m0, click \\bm)"
				pos = (160.0, -65.0)
			}
			create_element_ps3 = {
				text = "You can waypoint the next goal in any\\nof them. \\n\\n    (press \\m0, press \\bm)"
				pos = (160.0, -65.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 260
			wait_time = 2
		}
		{
			frame = 300
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 305
			event_script = sk9_Skater_Stop_SFX2
		}
	]
}
