RAK_Skate_Lounge_Video = {
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
		movie = 'Train_Skate_Lounge'
		movie_ps3 = 'Train_Skate_Lounge_ps3'
		movie_ps3x = 'Train_Skate_Lounge_ps3x'
		start_frame = 0
		end_frame = 2520
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
				text = "SKATE LOUNGE"
				pos = (100.0, 215.0)
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
			frame = 1
			wait_time = 0.5
		}
		{
			frame = 15
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 20
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Your skate lounge is your home base where you can create your own skatepark out of items you've earned or bought!"
				pos = (-40.0, 120.0)
				just = [
					center
					center
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
			frame = 20
			wait_time = 0
		}
		{
			frame = 250
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 278
			create_element = {
				type = textblockelement
				font = text_a1
				text = "create-a-skater:\\nYou can customize your\\ncharacter with clothing\\nand accessories."
				pos = (180.0, -160.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 325
			wait_time = 1
		}
		{
			frame = 326
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 373
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Press \\b9 to enter skate lounge\\npiece wheel."
				pos = (-320.0, -120.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 400
			wait_time = 1
		}
		{
			frame = 415
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 460
			create_element = {
				type = textblockelement
				font = text_a1
				text = "This category contains city and skate pieces.  More unlock as you progress through the game."
				pos = (-340.0, -65.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 480
			wait_time = 2
		}
		{
			frame = 500
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 531
			create_element = {
				type = textblockelement
				font = text_a1
				text = "This shows your cash earned."
				pos = (-340.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 560
			wait_time = 1
		}
		{
			frame = 578
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 608
			create_element = {
				type = textblockelement
				font = text_a1
				text = "This is the cost of the items."
				pos = (-340.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 635
			wait_time = 1
		}
		{
			frame = 650
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 679
			create_element = {
				type = textblockelement
				font = text_a1
				text = "This is your limit of per piece\\nplacement."
				pos = (-340.0, -20.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 700
			wait_time = 1
		}
		{
			frame = 720
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 775
			create_element = {
				type = textblockelement
				font = text_a1
				text = "There are more piece categories in the skate lounge wheel to experiment with."
				pos = (-340.0, -20.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 800
			wait_time = 1
		}
		{
			frame = 819
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1110
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Some items have additional interactions."
				pos = (-340.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1130
			wait_time = 1
		}
		{
			frame = 1153
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1468
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Watch cool videos on your new television."
				pos = (-340.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1500
			wait_time = 1
		}
		{
			frame = 1515
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1752
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Other videos can be purchased in the skate lounge menu."
				pos = (-250.0, -20.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1779
			wait_time = 1
		}
		{
			frame = 1799
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1826
			create_element = {
				type = textblockelement
				font = text_a1
				text = "The skate lounge menu gives you\\nadditional choices to upgrade your\\nlounge."
				pos = (-75.0, -60.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1846
			wait_time = 1
		}
		{
			frame = 1866
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 1953
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Purchase items for more choices."
				pos = (-75.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 1963
			wait_time = 1
		}
		{
			frame = 1983
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2032
			create_element = {
				type = textblockelement
				font = text_a1
				text = "More unlock as you progress."
				pos = (-75.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 2052
			wait_time = 1
		}
		{
			frame = 2100
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 2285
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Be creative! Invite your friends."
				pos = (-260.0, -80.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 2300
			wait_time = 0
		}
		{
			frame = 2425
			destroy_element
			fade_out_params = {
			}
		}
	]
}
