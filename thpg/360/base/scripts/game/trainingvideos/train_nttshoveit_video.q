TRAIN_NTTShoveIt_Video_trick = "Next, the shove-it, another\\nbasic trick that every\\nskater has to know. (Hold \\b7\\bl)"
TRAIN_NTTShoveIt_Video_release = "(release \\bl to catch the board\\nand land)"
TRAIN_NTTShoveIt_Video = {
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
		movie = 'Train_NTT_ShoveIt'
		start_frame = 0
		end_frame = 296
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
		pos = (235.0, 160.0)
		dims = (595.0, 0.0)
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
			200
			200
			280
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
			frame = 60
			event_script = TRAIN_NTTShoveIt_Video_Determine_Stance
		}
		{
			frame = 83
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 85
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTTShoveIt_Video_trick
				rgba = [
					90
					100
					180
					255
				]
				internal_scale = 0.9
			}
			fade_in_params = {
			}
		}
		{
			frame = 88
			event_script = m_c1_ntt_inst_07
		}
		{
			frame = 85
			wait_time = 2
		}
		{
			frame = 135
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 195
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTTShoveIt_Video_release
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
			frame = 195
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 195
			wait_time = 2
		}
		{
			frame = 223
			destroy_element
			fade_out_params = {
			}
		}
	]
}

script TRAIN_NTTShoveIt_Video_Determine_Stance 
	if skater :flipped
		change TRAIN_NTTShoveIt_Video_trick = "Next, the shove-it, another\\nbasic trick that every\\nskater has to know. (Hold \\b7\\bk)"
		change TRAIN_NTTShoveIt_Video_release = "(release \\bk to catch the board\\nand land)"
	endif
endscript
