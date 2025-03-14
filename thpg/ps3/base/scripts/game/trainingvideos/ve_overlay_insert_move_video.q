VE_Overlay_Insert_Move_Video = {
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
		movie = 'VE_Overlay'
		movie_ps3 = 'VE_Overlay_ps3'
		movie_ps3x = 'VE_Overlay_ps3x'
		start_frame = 0
		end_frame = 2014
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
		dims = (500.0, 576.0)
		just = [
			left
			top
		]
		internal_just = [
			left
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
		time = 0.3
	}
	default_fade_out_params = {
		alpha = 0.0
		time = 0.3
	}
	events = [
		{
			frame = 0
			create_element = {
				text = "VIDEO EDITOR"
				pos = (190.0, -230.0)
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
			frame = 15
			wait_time = 0.5
		}
		{
			frame = 16
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 21
			create_element = {
				text = "Video Editor: \\n\\nCustomize your footage with overlays."
				pos = (-380.0, -25.0)
				dims = (800.0, 576.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 21
			wait_time = 1.5
		}
		{
			frame = 30
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 35
			create_element = {
				text = "Overlays:\\n\\nPress \\m0 to enter the insert overlay menu."
				pos = (-380.0, -25.0)
				dims = (800.0, 576.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 41
			wait_time = 1.5
		}
		{
			frame = 80
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 115
			create_element = {
				text = "Press \\m0 to enter the\\noverlay list."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 185
			wait_time = 1.5
		}
		{
			frame = 214
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 219
			create_element = {
				text = "Press \\m0 to insert selected\\noverlay in timeline."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 219
			wait_time = 2
		}
		{
			frame = 230
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 235
			create_element = {
				text = "Overlay will fill the visible\\ntimeline."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 292
			wait_time = 0.5
		}
		{
			frame = 303
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 308
			create_element = {
				text = "Press \\b2 to go back to the\\noverlay menu"
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 310
			wait_time = 0.5
		}
		{
			frame = 389
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 394
			create_element = {
				text = "Select trim overlay to go\\ninto trim mode."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 396
			wait_time = 1.5
		}
		{
			frame = 458
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 476
			create_element = {
				text = "Use the jog marker (\\bl) to\\nlocate the trim spots."
				pos = (-520.0, -15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 506
			wait_time = 0.5
		}
		{
			frame = 565
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 570
			create_element = {
				text = "Press \\be to set begin spot,\\ntrimmed overlay will have\\na new begin position."
				pos = (-520.0, -15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 580
			wait_time = 2
		}
		{
			frame = 658
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 660
			create_element = {
				text = "If you want a new ending point,\\nuse the jog marker (\\bl) to\\nlocate the end trim spot."
				pos = (-520.0, -15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 665
			wait_time = 2
		}
		{
			frame = 716
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 721
			create_element = {
				text = "Press \\bf to Set end spot,\\ntrimmed screen fx will\\nhave a new end position."
				pos = (-520.0, -15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 850
			wait_time = 1
		}
		{
			frame = 868
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 873
			create_element = {
				text = "Press \\m0 to apply the overlay\\n trim."
				pos = (-520.0, -15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 874
			wait_time = 1
		}
		{
			frame = 927
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 932
			create_element = {
				text = "Trimmed overlay will\\nchange to none in\\nthe timeline."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 934
			wait_time = 1
		}
		{
			frame = 955
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 976
			create_element = {
				text = "Select the remove fx to\\nclear out any overlay in\\nthe timeline."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 978
			wait_time = 2
		}
		{
			frame = 995
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1000
			create_element = {
				text = "Press \\m0 on highlighted\\noverlay segment to\\nremove it."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1002
			wait_time = 1
		}
		{
			frame = 1065
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1070
			create_element = {
				text = "Use the jog marker (\\bl)\\nto select other overlay in\\nthe timeline."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1072
			wait_time = 1
		}
		{
			frame = 1133
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1138
			create_element = {
				text = "Overlay segments will\\nupdate in the timeline."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1140
			wait_time = 1
		}
		{
			frame = 1219
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1224
			create_element = {
				text = "You can select multiple\\noverlays for your footage."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1228
			wait_time = 1
		}
		{
			frame = 1407
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1412
			create_element = {
				text = "Additional screen fx will\\nfill the available segment\\nof the timeline."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1414
			wait_time = 1.5
		}
		{
			frame = 1453
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1458
			create_element = {
				text = "Press \\b2 to return to the\\nprevious menu."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1463
			wait_time = 0
		}
		{
			frame = 1574
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1579
			create_element = {
				text = "Select move overlay to\\nreposition any exiting\\noverlay in the timeline."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1581
			wait_time = 1
		}
		{
			frame = 1638
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1655
			create_element = {
				text = "Use the jog marker (\\bl) to\\nselect overlay segment to\\nmove."
				pos = (-520.0, -15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1664
			wait_time = 1
		}
		{
			frame = 1712
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1717
			create_element = {
				text = "Use \\bk to move the selected\\noverlay segment in the\\ntimeline."
				pos = (-520.0, -15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1719
			wait_time = 1
		}
		{
			frame = 1815
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1820
			create_element = {
				text = "Press \\b2 to finish the move."
				pos = (-520.0, -15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1822
			wait_time = 1
		}
		{
			frame = 1855
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1865
			create_element = {
				text = "Press \\b2 to return to\\noverlay menu."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1870
			wait_time = 1
		}
		{
			frame = 1907
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1912
			create_element = {
				text = "Press \\b2 to return to the\\nvideo editor menu."
				pos = (40.0, 15.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1914
			wait_time = 0
		}
		{
			frame = 1975
			destroy_element
			fade_out_params = {
			}
		}
	]
}
