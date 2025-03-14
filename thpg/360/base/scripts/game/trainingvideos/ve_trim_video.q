VE_Trim02_Video = {
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
		movie = 'VE_trim'
		movie_ps3 = 'VE_trim_ps3'
		movie_ps3 = 'VE_trim_ps3x'
		start_frame = 0
		end_frame = 869
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
		dims = (768.0, 576.0)
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
				text = "VIDEO EDITOR"
				pos = (190.0, -230.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					left
					top
				]
				rgba = [
					90
					100
					180
					255
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 10
			wait_time = 1.5
		}
		{
			frame = 35
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 42
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Trimming clips:\\nSelect edit clip from\\nmain menu."
				pos = (40.0, 5.0)
				dims = (500.0, 576.0)
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
			frame = 47
			wait_time = 2
		}
		{
			frame = 170
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 171
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to select trim mode."
				pos = (40.0, 5.0)
				dims = (500.0, 576.0)
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
			frame = 172
			wait_time = 2
		}
		{
			frame = 230
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 240
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use jog marker (\\bl) to\\nselect the front end\\nfor trim."
				pos = (-475.0, 5.0)
				dims = (500.0, 576.0)
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
			frame = 256
		}
		{
			frame = 357
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 358
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Set begin with \\be to\\ntrim front of clip."
				pos = (-475.0, 5.0)
				dims = (500.0, 576.0)
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
			frame = 351
			wait_time = 2
		}
		{
			frame = 421
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 422
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use jog marker (\\bl) to\\nselect the back end\\nfor trim."
				pos = (-475.0, 5.0)
				dims = (500.0, 576.0)
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
			frame = 423
		}
		{
			frame = 524
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 525
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Set end with \\bf to\\ntrim the end of clip."
				pos = (-475.0, 5.0)
				dims = (500.0, 576.0)
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
			frame = 528
			wait_time = 2
		}
		{
			frame = 667
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 668
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to apply.\\nEdited clip will reposition\\n in timeline."
				pos = (-475.0, 5.0)
				dims = (500.0, 576.0)
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
			frame = 689
			wait_time = 2
		}
		{
			frame = 760
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 775
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m1 to return to\\nedit clip menu."
				pos = (40.0, 5.0)
				dims = (500.0, 576.0)
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
			frame = 808
			wait_time = 2
		}
		{
			frame = 835
			destroy_element
			fade_out_params = {
			}
		}
	]
}
