Camera_Adjust_Video = {
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
		movie = 'TRAIN_Adjust_Camera'
		movie_ps3 = 'TRAIN_Adjust_Camera_PS3'
		movie_ps3x = 'TRAIN_Adjust_Camera_PS3X'
		start_frame = 0
		end_frame = 870
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
		pos = (0.0, 90.0)
		dims = (1100.0, 576.0)
		just = [
			center
			center
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
				text = "CAMERA ADJUST"
				pos = (-360.0, 160.0)
				dims = (1100.0, 576.0)
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
			frame = 0
			wait_time = 0
		}
		{
			frame = 70
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 74
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 76
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m5 to adjust the camera view."
				pos = (-500.0, -260.0)
				dims = (1100.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 76
			wait_time = 1.5
		}
		{
			frame = 77
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 139
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 141
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use \\bk to move camera target to desired spot."
				pos = (-500.0, -260.0)
				dims = (1100.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 141
			wait_time = 1.5
		}
		{
			frame = 142
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 374
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 376
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use \\bh / \\bg to push or pull the camera target."
				pos = (-500.0, -260.0)
				dims = (1100.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 376
			wait_time = 1.5
		}
		{
			frame = 377
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 554
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 556
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use \\bl to scale camera target size."
				pos = (-500.0, -260.0)
				dims = (1100.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 556
			wait_time = 1.5
		}
		{
			frame = 557
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 716
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 718
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use \\bf / \\be to zoom in or out with camera target."
				pos = (-500.0, -260.0)
				dims = (1100.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 718
			wait_time = 1.5
		}
		{
			frame = 719
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 860
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 862
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to accept camera changes."
				pos = (-500.0, -260.0)
				dims = (1100.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 862
			wait_time = 1.5
		}
		{
			frame = 863
			destroy_element
			fade_out_params = {
			}
		}
	]
}
