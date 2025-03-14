RAK_Kicker_Video = {
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
		movie = 'TRAIN_Kicker2'
		movie_ps3 = 'TRAIN_Kicker2_PS3'
		movie_ps3x = 'TRAIN_Kicker2_PS3X'
		start_frame = 0
		end_frame = 398
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
		pos = (-400.0, 90.0)
		dims = (800.0, 576.0)
		just = [
			left
			top
		]
		internal_just = [
			center
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
				text = "RIG-A-KIT MENU"
				pos = (100.0, -260.0)
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
			frame = 15
			wait_time = 1
		}
		{
			frame = 15
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 16
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 16
			create_element = {
				text = "Press \\b9 to enter Rig-a-Kit menu.\\n\\nThis is the basic control panel."
				pos = (-470.0, 82.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 16
			wait_time = 2.5
		}
		{
			frame = 17
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 44
			create_element = {
				text = "Use the \\bk to move kicker.\\n\\nPress \\m0 to place kicker."
				pos = (-470.0, 82.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 44
			wait_time = 1.5
		}
		{
			frame = 75
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 78
			create_element = {
				text = "Use \\be and \\bf to rotate the kicker."
				pos = (-470.0, 115.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 80
			wait_time = 1.5
		}
		{
			frame = 100
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 101
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 380
			create_element = {
				text = "Use \\m2 to Exit the Rig-A-Kit Mode."
				pos = (-470.0, 115.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 383
			wait_time = 1.5
		}
		{
			frame = 392
			destroy_element
			fade_out_params = {
				time = 0.1
			}
		}
	]
}
