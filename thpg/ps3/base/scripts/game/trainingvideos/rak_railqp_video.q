RAK_RailQP_Video = {
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
		movie = 'TRAIN_Rail_QP'
		movie_ps3 = 'TRAIN_Rail_QP_PS3'
		movie_ps3x = 'TRAIN_Rail_QP_PS3X'
		start_frame = 0
		end_frame = 1725
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
		pos = (-380.0, 90.0)
		dims = (900.0, 576.0)
		just = [
			left
			top
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
				text = "RIG-A-KIT MENU"
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
			wait_time = 1.5
		}
		{
			frame = 6
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 7
			create_element = {
				text = "Camera: \\nUse the \\bl to rotate the camera around the piece."
				pos = (-380.0, -290.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 20
			wait_time = 1.5
		}
		{
			frame = 25
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 262
			create_element_ps3 = {
				text = "Zoom camera: \\nPress and hold \\bh and use \\bl to zoom camera in and out."
				pos = (-380.0, -290.0)
			}
			create_element = {
				text = "Zoom camera: \\nPull and hold \\bh and use \\bl to zoom camera in and out."
				pos = (-380.0, -290.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 270
			wait_time = 2
		}
		{
			frame = 275
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 528
			create_element = {
				text = "Press \\m0 to place any selected piece."
				pos = (-350.0, -250.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 540
			wait_time = 1
		}
		{
			frame = 545
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 834
			create_element = {
				text = "Piece wheel: \\nUse \\b7/\\b4 to scoll the categories."
				pos = (-380.0, -290.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 837
			wait_time = 1.5
		}
		{
			frame = 838
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 840
			create_element = {
				text = "Piece wheel:\\nUse \\b6 / \\b5 to select the category pieces.\\nAdditional pieces can be unlocked."
				pos = (-380.0, -290.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 843
			wait_time = 2
		}
		{
			frame = 845
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1022
			create_element_ps3 = {
				text = "Snap to pieces: \\nPress the \\bj to snap selected piece to nearest placed piece."
				pos = (-380.0, -290.0)
			}
			create_element = {
				text = "Snap to pieces: \\nClick the \\bj to snap selected piece to nearest placed piece."
				pos = (-380.0, -290.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1030
			wait_time = 2
		}
		{
			frame = 1035
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1313
			create_element = {
				text = "Grab piece: \\nPress \\m5 to grab nearest piece."
				pos = (-380.0, -290.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1320
			wait_time = 1.5
		}
		{
			frame = 1325
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1592
			create_element = {
				text = "Hide controls: \\nPress \\b0 to hide and unhide the Rig-a-Kit controls."
				pos = (-380.0, -290.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1600
			wait_time = 1.5
		}
		{
			frame = 1605
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1722
			create_element = {
				text = "Exit: \\nPress \\m2 to exit the Rig-a-Kit menu."
				pos = (-380.0, -290.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1722
			wait_time = 1.5
		}
		{
			frame = 1723
			destroy_element
			fade_out_params = {
			}
		}
	]
}
