VE_Scoring_Video = {
	no_music
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
		movie = 'VE_Scoring'
		movie_ps3 = 'VE_Scoring_ps3'
		movie_ps3x = 'VE_Scoring_ps3x'
		start_frame = 0
		end_frame = 3449
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
		dims = (900.0, 576.0)
		just = [
			center
			center
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
			frame = 5
			wait_time = 0.5
		}
		{
			frame = 20
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 30
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Video editor: \\n\\nSweet clips, sick tricks all add up when submitting footage."
				pos = (-80.0, 220.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 40
			wait_time = 1
		}
		{
			frame = 100
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 328
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Focus on the sweet tricks, but don't trim too much."
				pos = (-80.0, 280.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 341
			wait_time = 1
		}
		{
			frame = 380
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 401
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Screen FX:\\n\\nStylized look can help, but too much can hurt, discover a good blend."
				pos = (-80.0, 235.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 418
			wait_time = 1
		}
		{
			frame = 450
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 695
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Custom look can add up when submitting."
				pos = (-80.0, 30.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 714
			wait_time = 1
		}
		{
			frame = 745
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1081
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Overlays:\\n\\nMore screen visuals can also help, or hurt score. Shoot for a balance."
				pos = (-80.0, 235.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1095
			wait_time = 1
		}
		{
			frame = 1155
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1350
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Creativity can add up when submitting."
				pos = (-80.0, 290.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1365
			wait_time = 1
		}
		{
			frame = 1417
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1529
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Audio:\\n\\nA key ingredient to the mix!"
				pos = (-80.0, 235.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1545
			wait_time = 1
		}
		{
			frame = 1580
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1645
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Choose a track, set the\\nstart time and match the\\nbeat."
				pos = (280.0, 250.0)
				dims = (500.0, 500.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1660
			wait_time = 1
		}
		{
			frame = 1700
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1733
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Scroll through the list\\nand select your track."
				pos = (280.0, 250.0)
				dims = (500.0, 500.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1750
			wait_time = 1
		}
		{
			frame = 1780
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1930
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Preview music track will\\nplay with the footage."
				pos = (280.0, 250.0)
				dims = (500.0, 500.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1948
			wait_time = 1
		}
		{
			frame = 1990
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2413
			create_element = {
				type = textblockelement
				font = text_a1
				text = "When previewing tracks,\\nyou can marks the\\nbeats on the timeline."
				pos = (280.0, 250.0)
				dims = (500.0, 500.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 2425
			wait_time = 1
		}
		{
			frame = 2465
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2545
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\m5 to place timeline markers."
				pos = (20.0, 330.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 2567
			wait_time = 1
		}
		{
			frame = 2590
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2705
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Match tricks to music\\ntrack beats."
				pos = (-250.0, 270.0)
				dims = (500.0, 500.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 2720
			wait_time = 1
		}
		{
			frame = 2755
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2859
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Sync the tricks in the\\nclip to the music."
				pos = (-250.0, 270.0)
				dims = (500.0, 500.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 2880
			wait_time = 2
		}
		{
			frame = 2905
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 3110
			create_element = {
				type = textblockelement
				font = text_a1
				text = "When ready, submit your footage to Volcom."
				pos = (-100.0, 270.0)
				dims = (800.0, 500.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 3135
			wait_time = 1
		}
		{
			frame = 3170
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 3205
			create_element = {
				type = textblockelement
				font = text_a1
				text = "You can submit multiple\\ntimes."
				pos = (280.0, 270.0)
				dims = (500.0, 500.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 3227
			wait_time = 1
		}
		{
			frame = 3260
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 3285
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Get recognition with\\nsick footage."
				pos = (-275.0, 270.0)
				dims = (500.0, 500.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 3310
			wait_time = 1
		}
		{
			frame = 3340
			destroy_element
			fade_out_params = {
			}
		}
	]
}
