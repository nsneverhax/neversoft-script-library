TRAIN_NTGTweaks_Video_txt1 = ""
TRAIN_NTGTweaks_Video_txt2 = ""
TRAIN_NTGTweaks_Video = {
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
		movie = 'Train_NTG_tweaks'
		start_frame = 0
		end_frame = 586
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
			frame = 98
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 100
			create_element = {
				type = textblockelement
				font = text_a1
				text = "You can also tweak a grab in any direction."
				pos = (0.0, -190.0)
				dims = (1120.0, 0.0)
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
			}
			fade_in_params = {
			}
		}
		{
			frame = 102
			event_script = m_c2_ntg_inst_04
		}
		{
			frame = 100
			wait_time = 2
		}
		{
			frame = 148
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 200
			event_script = TRAIN_NTGTweaks_Video_Determine_Console
		}
		{
			frame = 273
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 275
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTGTweaks_Video_txt1
				pos = (100.0, -65.0)
				dims = (450.0, 0.0)
				allow_expansion
				just = [
					left
					center
				]
				internal_just = [
					center
					center
				]
				internal_scale = 0.75
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
			frame = 275
			wait_time = 3
		}
		{
			frame = 320
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 402
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 404
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTGTweaks_Video_txt2
				pos = (-310.0, 0.0)
				dims = (430.0, 0.0)
				allow_expansion
				internal_scale = 0.9
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
			frame = 404
			wait_time = 3
		}
		{
			frame = 450
			destroy_element
			fade_out_params = {
			}
		}
	]
}

script TRAIN_NTGTweaks_Video_Determine_Console 
	if isps3
		change TRAIN_NTGTweaks_Video_txt1 = "(to do so move either\\nstick in any\\ndirection while\\nnailing a grab)"
		change TRAIN_NTGTweaks_Video_txt2 = "(grabs can be tweaked\\naround without returning\\nthe stick to neutral)"
	else
		change TRAIN_NTGTweaks_Video_txt1 = "(to do so move either\\nstick in any\\ndirection while\\nnailing a grab)"
		change TRAIN_NTGTweaks_Video_txt2 = "(grabs can be tweaked\\naround without returning\\nthe stick to neutral)"
	endif
endscript
