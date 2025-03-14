VE_Insert_Remove_Video = {
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
		movie = 'VE_Insert_Remove'
		movie_ps3 = 'VE_Insert_Remove_ps3'
		movie_ps3x = 'VE_Insert_Remove_ps3x'
		start_frame = 0
		end_frame = 3060
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
		internal_scale = 0.9
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
			frame = 38
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
			frame = 43
			wait_time = 1.5
		}
		{
			frame = 43
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 55
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Video Editor:\\n\\nThis is where you assemble your footage."
				pos = (-360.0, -20.0)
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
			frame = 62
			wait_time = 0
		}
		{
			frame = 207
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 211
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Edit clip:\\n\\nPress \\m0 to enter the edit clip menu."
				pos = (-360.0, -20.0)
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
			frame = 211
			wait_time = 0
		}
		{
			frame = 251
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 300
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to enter the insert \\nclip list."
				pos = (50.0, 10.0)
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
			frame = 369
			wait_time = 0
		}
		{
			frame = 466
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 470
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to insert selected \\nclip in timeline."
				pos = (50.0, 10.0)
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
			frame = 470
			wait_time = 0
		}
		{
			frame = 577
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 581
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Insert multiple clips or the\\nsame clip multiple times."
				pos = (50.0, 10.0)
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
			frame = 581
			wait_time = 0
		}
		{
			frame = 688
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 692
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Each clip inserted will move\\nto the end."
				pos = (50.0, 10.0)
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
			frame = 692
			wait_time = 0
		}
		{
			frame = 810
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 814
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m1 to return to\\nthe insert clip menu."
				pos = (50.0, 10.0)
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
			frame = 814
			wait_time = 0
		}
		{
			frame = 859
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 886
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Select move clip to rearrange\\nclips in the timeline."
				pos = (50.0, 10.0)
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
			frame = 938
			wait_time = 0
		}
		{
			frame = 1005
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1012
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use \\bl to jog through\\nyour clips."
				pos = (-475.0, 10.0)
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
			frame = 1035
			wait_time = 0
		}
		{
			frame = 1146
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1150
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use \\bk to move the\\nselected clip."
				pos = (-475.0, 10.0)
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
			frame = 1311
			wait_time = 0
		}
		{
			frame = 1396
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1400
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Finish move to return to\\nthe edit clip menu."
				pos = (-475.0, 10.0)
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
			frame = 1443
			wait_time = 0
		}
		{
			frame = 1490
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1502
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Select remove clip to\\nclear selected clip."
				pos = (50.0, 10.0)
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
			frame = 1647
			wait_time = 0
		}
		{
			frame = 1697
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1701
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Remove clips only clears\\nthem from the timeline."
				pos = (50.0, 10.0)
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
			frame = 1743
			wait_time = 0
		}
		{
			frame = 1871
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1875
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m1 return to the\\nedit clip menu."
				pos = (50.0, 10.0)
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
			frame = 1875
			wait_time = 0
		}
		{
			frame = 1930
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1975
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\b0 to view footage\\nin the preview window."
				pos = (-475.0, 10.0)
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
			frame = 2065
			wait_time = 0
		}
		{
			frame = 2206
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2210
			create_element = {
				type = textblockelement
				font = text_a1
				text = "You can preview your edits\\nfrom any video editor screen."
				pos = (-500.0, -35.0)
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
			frame = 2300
		}
		{
			frame = 2408
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2412
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to pause preview\\nat jog marker."
				pos = (-475.0, 10.0)
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
			frame = 2442
		}
		{
			frame = 2500
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2520
			create_element = {
				type = textblockelement
				font = text_a1
				text = "\\bh to view footage in\\nfullscreen."
				pos = (-475.0, 10.0)
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
			frame = 2552
			wait_time = 0
		}
		{
			frame = 2585
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2860
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m1 to return to\\nthe video menu."
				pos = (50.0, 10.0)
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
			frame = 2864
			wait_time = 0
		}
		{
			frame = 2940
			destroy_element
			fade_out_params = {
			}
		}
	]
}
