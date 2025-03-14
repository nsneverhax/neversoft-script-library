TRAIN_NTMIntro_Video_txt1 = ""
TRAIN_NTMIntro_Video = {
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
		movie = 'TRAIN_NTM_Intro'
		start_frame = 0
		end_frame = 678
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
			center
		]
		allow_expansion
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
	exit_script = Turn_Off_All_NTM_VO
	events = [
		{
			frame = 0
			create_element = {
				type = textblockelement
				font = text_a1
				text = "NAIL THE MANUAL"
				pos = (-340.0, 240.0)
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
			frame = 5
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 15
			wait_time = 1
		}
		{
			frame = 10
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 12
			event_script = m_c3_photothemed_chk1p1
			create_element = {
				type = textblockelement
				font = text_a1
				text = "To nail a manual, first you gotta enter nail the trick mode (\\bj+\\bm)."
				pos = (0.0, -75.0)
				dims = (1100.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 12
			wait_time = 2
		}
		{
			frame = 45
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 100
			event_script = TRAIN_NTMIntro_Video_Determine_Console
		}
		{
			frame = 119
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 121
			event_script = m_c3_photothemed_chk1p2
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTMIntro_Video_txt1
				pos = (-350.0, -60.0)
				dims = (360.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 121
			wait_time = 3
		}
		{
			frame = 123
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 122
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 124
			event_script = VO_m_c3_Photothemed_inst_p1_02b
			create_element = {
				type = textblockelement
				font = text_a1
				text = "You'll be in\\nnail the manual\\nmode until you\\nrelease \\bh."
				pos = (-350.0, -60.0)
				dims = (360.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 124
			wait_time = 2
		}
		{
			frame = 170
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 254
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 256
			event_script = m_c3_photothemed_chk1p4
			create_element = {
				type = textblockelement
				font = text_a1
				text = "Adjust the board so\\nthat when you land,\\nonly one truck is\\ntouching down."
				pos = (280.0, -65.0)
				dims = (480.0, 0.0)
				internal_scale = 0.8
			}
			fade_in_params = {
			}
		}
		{
			frame = 256
			wait_time = 2
		}
		{
			frame = 300
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 427
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 429
			event_script = m_c3_photothemed_chk1p3
			create_element = {
				type = textblockelement
				font = text_a1
				text = "In nail the manual, you\\nbalance the board by\\nmoving your left \\bk\\nand right \\bl feet\\nup and down."
				pos = (280.0, -65.0)
				dims = (480.0, 0.0)
				internal_scale = 0.8
			}
			fade_in_params = {
			}
		}
		{
			frame = 429
			wait_time = 3
		}
		{
			frame = 480
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 578
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 602
			event_script = m_c3_photothemed_chk1p5
			create_element = {
				type = textblockelement
				font = text_a1
				text = "To exit, adjust the board so\\nthat both trucks touch the\\nground, and you'll roll out."
				pos = (-300.0, -60.0)
				dims = (450.0, 0.0)
				internal_scale = 0.8
			}
			fade_in_params = {
			}
		}
		{
			frame = 623
			wait_time = 2.5
		}
		{
			frame = 660
			destroy_element
			fade_out_params = {
			}
		}
	]
}

script TRAIN_NTMIntro_Video_Determine_Console 
	if isps3
		change \{TRAIN_NTMIntro_Video_txt1 = "Then press \\bh to\\nenter nail the\\nmanual mode."}
	else
		change \{TRAIN_NTMIntro_Video_txt1 = "Then pull \\bh to\\nenter nail the\\nmanual mode."}
	endif
endscript
