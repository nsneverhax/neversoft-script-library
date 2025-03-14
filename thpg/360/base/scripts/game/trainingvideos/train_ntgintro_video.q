TRAIN_NTGIntro_Video_txt1 = ""
TRAIN_NTGIntro_Video = {
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
		movie = 'Train_NTG_intro'
		start_frame = 0
		end_frame = 518
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
			90
			100
			180
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
	exit_script = Turn_Off_All_NTG_VO
	events = [
		{
			frame = 0
			create_element = {
				type = textblockelement
				font = text_a1
				text = "NAIL THE GRAB"
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
			frame = 96
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 75
			event_script = TRAIN_NTGIntro_Video_Determine_Console
		}
		{
			frame = 98
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTGIntro_Video_txt1
				pos = (-510.0, -60.0)
				dims = (360.0, 0.0)
				allow_expansion
				just = [
					left
					center
				]
				internal_scale = 0.75
				internal_just = [
					left
					center
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
			frame = 100
			event_script = m_c2_NTG_inst_02b
		}
		{
			frame = 98
			wait_time = 3
		}
		{
			frame = 140
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 210
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 212
			create_element = {
				type = textblockelement
				font = text_a1
				text = "(hold \\bg, and use \\bk or \\bl to control the skater's left and right arms)"
				pos = (-120.0, -65.0)
				dims = (850.0, 0.0)
				allow_expansion
				just = [
					center
					center
				]
				internal_just = [
					center
					center
				]
				rgba = [
					120
					120
					120
					255
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 207
			wait_time = 3
		}
		{
			frame = 257
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 383
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 385
			create_element = {
				type = textblockelement
				font = text_a1
				text = "(to land, release \\bg)"
				pos = (340.0, -60.0)
				dims = (380.0, 0.0)
				allow_expansion
				just = [
					center
					center
				]
				internal_just = [
					center
					center
				]
				rgba = [
					120
					120
					120
					255
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 385
			wait_time = 2
		}
		{
			frame = 425
			destroy_element
			fade_out_params = {
			}
		}
	]
}

script TRAIN_NTGIntro_Video_Determine_Console 
	if isps3
		change TRAIN_NTGIntro_Video_txt1 = "To Nail a Grab, first\\nenter nail the trick\\nmode, press(\\bj+\\bm)\\nwhile airborne."
	else
		change TRAIN_NTGIntro_Video_txt1 = "To Nail a Grab, first\\nenter nail the trick\\nmode, click(\\bj+\\bm)\\nwhile airborne."
	endif
endscript
