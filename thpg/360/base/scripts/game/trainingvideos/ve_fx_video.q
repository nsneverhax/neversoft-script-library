VE_FX_Video = {
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
		movie = 'VE_edit_fx'
		movie_ps3 = 'VE_edit_fx_ps3'
		movie_ps3x = 'VE_edit_fx_ps3x'
		start_frame = 0
		end_frame = 2060
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
			frame = 0
			wait_time = 0
		}
		{
			frame = 40
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 44
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Video Editor:\\n\\nCustomize your footage with screen fx."
				pos = (-40.0, 240.0)
				internal_just = [
					left
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 44
			wait_time = 1
		}
		{
			frame = 67
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 71
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Screen FX:\\n\\nPress \\m0 to enter the screen fx menu."
				pos = (-40.0, 240.0)
				dims = (768.0, 576.0)
				internal_just = [
					left
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 71
			wait_time = 0.5
		}
		{
			frame = 115
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 156
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to enter the\\ninsert fx list."
				pos = (45.0, 15.0)
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
			frame = 168
			wait_time = 0.5
		}
		{
			frame = 250
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 255
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to insert\\nselected screen fx\\nin timeline."
				pos = (45.0, -5.0)
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
			frame = 255
			wait_time = 0.5
		}
		{
			frame = 317
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 321
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Screen fx will fill the\\nvisible timeline."
				pos = (45.0, 15.0)
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
			frame = 375
			wait_time = 0.5
		}
		{
			frame = 396
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 400
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\b2 to go back to\\nthe fx menu."
				pos = (45.0, 15.0)
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
			frame = 405
			wait_time = 0.5
		}
		{
			frame = 515
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 520
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Select trim fx to go\\ninto trim mode."
				pos = (45.0, 15.0)
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
			frame = 530
			wait_time = 0.5
		}
		{
			frame = 574
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 590
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use the job marker (\\bl) to\\nlocate the trim spots."
				pos = (-520.0, 15.0)
				dims = (580.0, 576.0)
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
			frame = 602
			wait_time = 0.5
		}
		{
			frame = 728
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 733
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\be to set begin spot,\\ntrimmed screen fx will have\\na new begin position."
				pos = (-520.0, -15.0)
				dims = (580.0, 576.0)
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
			frame = 770
			wait_time = 1
		}
		{
			frame = 798
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 803
			create_element = {
				type = textblockelement
				font = text_a1
				text = "If you want a new ending point,\\nuse the job marker (\\bl) to\\nlocate the end trim spot."
				pos = (-520.0, -15.0)
				dims = (580.0, 576.0)
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
			frame = 824
			wait_time = 1.5
		}
		{
			frame = 855
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 860
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\bf to Set end spot,\\ntrimmed screen fx will\\nhave a new end position."
				pos = (-520.0, -15.0)
				dims = (580.0, 576.0)
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
			frame = 900
			wait_time = 1.5
		}
		{
			frame = 949
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 954
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 to apply the screen\\nfx trim."
				pos = (-520.0, 15.0)
				dims = (580.0, 576.0)
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
			frame = 967
			wait_time = 1
		}
		{
			frame = 1000
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1025
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Trimmed screen fx will\\nchange to none in the\\ntimeline."
				pos = (45.0, -5.0)
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
			frame = 1028
			wait_time = 0.5
		}
		{
			frame = 1109
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1113
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Select the remove fx to\\nclear out any screen fx\\nin the timeline."
				pos = (45.0, -5.0)
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
			frame = 1114
			wait_time = 1.5
		}
		{
			frame = 1153
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1157
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m0 on highlighted\\nscreen fx segment to\\nremove it."
				pos = (45.0, -5.0)
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
			frame = 1160
			wait_time = 1.5
		}
		{
			frame = 1186
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1190
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Screen fx segments will\\nupdate in the timeline."
				pos = (45.0, 15.0)
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
			frame = 1383
			wait_time = 0.5
		}
		{
			frame = 1416
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1420
			create_element = {
				type = textblockelement
				font = text_a1
				text = "You can select multiple\\nscreen fx for your\\nfootage."
				pos = (45.0, -5.0)
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
			frame = 1409
			wait_time = 0.5
		}
		{
			frame = 1596
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1590
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Additional screen fx will\\nfill the available segment\\nof the timeline."
				pos = (45.0, -5.0)
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
			frame = 1604
			wait_time = 1.5
		}
		{
			frame = 1624
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1628
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\b2 to return to the\\nprevious menu."
				pos = (45.0, 15.0)
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
			frame = 1650
			wait_time = 1.5
		}
		{
			frame = 1718
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1722
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Select move fx to\\nreposition any exiting\\nscreen fx in the\\ntimeline."
				pos = (45.0, -25.0)
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
			frame = 1725
			wait_time = 1
		}
		{
			frame = 1794
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1827
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use the jog marker (\\bl)\\nto select screen fx\\nsegment to move."
				pos = (45.0, -5.0)
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
			frame = 1830
			wait_time = 1
		}
		{
			frame = 1955
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1961
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Use \\bk to move the\\nselected screen fx\\nsegment in the\\ntimeline."
				pos = (45.0, -25.0)
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
			frame = 1965
			wait_time = 1.5
		}
		{
			frame = 1966
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1977
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\b2 to finish the\\nmove."
				pos = (45.0, 15.0)
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
			frame = 1980
			wait_time = 0.5
		}
		{
			frame = 2000
			destroy_element
			fade_out_params = {
			}
		}
	]
}
