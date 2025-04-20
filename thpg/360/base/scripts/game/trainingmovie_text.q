Training_Rigger_sub_movie = {
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
		pos = (0.0, 300.0)
		rgba = [
			200
			200
			200
			255
		]
	}
	movie_params = {
		movie = 'Training_rigger_1'
		start_frame = 0
		end_frame = 1155
		pos = (-640.0, -360.0)
		just = [
			left
			top
		]
	}
	events = [
		{
			frame = 0
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\b9 \\b9 to enter Rigger mode"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 18
			wait_time = 2
		}
		{
			frame = 18
			destroy_element
		}
		{
			frame = 18
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\b7 and \\b4 to select category"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 78
			wait_time = 2
		}
		{
			frame = 78
			destroy_element
		}
		{
			frame = 78
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\b5 and \\b5 to select type"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 210
			wait_time = 2
		}
		{
			frame = 210
			destroy_element
		}
		{
			frame = 210
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use \\be and \\bf to rotate the piece"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 330
			wait_time = 2
		}
		{
			frame = 330
			destroy_element
		}
		{
			frame = 330
			create_element = {
				type = textblockelement
				font = text_a1
				text = "\\bk moves the piece"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 474
			wait_time = 2
		}
		{
			frame = 474
			destroy_element
		}
		{
			frame = 474
			create_element = {
				type = textblockelement
				font = text_a1
				text = "\\bg + \\bk raises or lowers the rail"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 579
			wait_time = 2
		}
		{
			frame = 579
			destroy_element
		}
		{
			frame = 579
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to place the piece"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 681
			wait_time = 2
		}
		{
			frame = 681
			destroy_element
		}
		{
			frame = 681
			create_element = {
				type = textblockelement
				font = text_a1
				text = "\\bm to snap to the nearest piece"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 833
			wait_time = 2
		}
		{
			frame = 833
			destroy_element
		}
		{
			frame = 833
			create_element = {
				type = textblockelement
				font = text_a1
				text = "\\bl controls the camera"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 1036
			wait_time = 2
		}
		{
			frame = 1036
			destroy_element
		}
		{
			frame = 1036
			create_element = {
				type = textblockelement
				font = text_a1
				text = "\\bh + \\bl zooms the camera"
				pos = (-384.0, -288.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					center
					top
				]
				rgba = [
					80
					180
					120
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
			fade_in_params = {
				alpha = 1.0
				time = 0.5
			}
		}
		{
			frame = 1150
			wait_time = 2
		}
		{
			frame = 1150
			destroy_element
		}
	]
}
