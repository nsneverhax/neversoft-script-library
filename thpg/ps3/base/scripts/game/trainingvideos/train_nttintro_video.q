TRAIN_NTTIntro_Video_txt1 = ""
TRAIN_NTTIntro_Video_txt2 = ""
TRAIN_NTTIntro_Video = {
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
		movie = 'Train_NTT_Intro'
		start_frame = 0
		end_frame = 346
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
		dims = (768.0, 0.0)
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
	exit_script = Turn_Off_All_NTT_VO
	events = [
		{
			frame = 0
			create_element = {
				type = textblockelement
				font = text_a1
				text = "NAIL THE TRICK"
				pos = (-360.0, 230.0)
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
			frame = 0
			wait_time = 0
		}
		{
			frame = 20
			event_script = TRAIN_NTTIntro_Video_Determine_Console
		}
		{
			frame = 40
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 50
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 52
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTTIntro_Video_txt2
				pos = (290.0, -65.0)
				dims = (500.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 55
			event_script = m_c1_ntt_inst_02
		}
		{
			frame = 52
			wait_time = 2
		}
		{
			frame = 100
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 163
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 165
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTTIntro_Video_txt1
				pos = (80.0, 125.0)
				dims = (900.0, 0.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 168
			event_script = m_c1_ntt_inst_03
		}
		{
			frame = 165
			wait_time = 2
		}
		{
			frame = 200
			destroy_element
			fade_out_params = {
			}
		}
	]
}

script TRAIN_NTTIntro_Video_Determine_Console 
	if isps3
		change TRAIN_NTTIntro_Video_txt1 = "Anytime you get air, you can press\\n(\\bj+\\bm) to enter nail the trick mode."
		change TRAIN_NTTIntro_Video_txt2 = "In nail the trick mode, you\\ncontrol the skater's feet\\nwith \\bj and \\bm."
	else
		change TRAIN_NTTIntro_Video_txt1 = "Anytime you get air, you can click\\n(\\bj+\\bm) to enter nail the trick mode."
		change TRAIN_NTTIntro_Video_txt2 = "In nail the trick mode, you\\ncontrol the skater's feet\\nwith \\bj and \\bm."
	endif
endscript
