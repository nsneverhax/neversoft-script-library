TRAIN_NTGFingerFlip_Video_txt1 = ""
TRAIN_NTGFingerFlip_Video = {
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
		movie = 'Train_NTG_fingerflips'
		start_frame = 0
		end_frame = 541
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
			frame = 48
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 55
			create_element = {
				type = textblockelement
				font = text_a1
				text = "While nailing a grab,\\nyou can also do a\\nfinger flip."
				pos = (-320.0, -175.0)
				dims = (420.0, 0.0)
				internal_scale = 0.9
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
			frame = 55
			event_script = m_c2_ntg_inst_06
		}
		{
			frame = 55
			wait_time = 2
		}
		{
			frame = 100
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 150
			event_script = TRAIN_NTGFingerFlip_Video_Determine_Console
		}
		{
			frame = 185
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 187
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTGFingerFlip_Video_txt1
				pos = (-50.0, -175.0)
				dims = (1000.0, 0.0)
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
			frame = 190
			wait_time = 3
		}
		{
			frame = 233
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 300
			event_script = TRAIN_NTGFingerFlip_Video_Determine_Console
		}
		{
			frame = 352
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 354
			create_element = {
				type = textblockelement
				font = text_a1
				text = "(you can quarter circle\\nin any direction, but\\nmake sure to go\\naround the full curve)"
				pos = (290.0, -65.0)
				dims = (475.0, 0.0)
				internal_scale = 0.8
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
			frame = 358
			wait_time = 3
		}
		{
			frame = 395
			destroy_element
			fade_out_params = {
			}
		}
	]
}

script TRAIN_NTGFingerFlip_Video_Determine_Console 
	if isps3
		change TRAIN_NTGFingerFlip_Video_txt1 = "(while nailing a grab do a quick quarter circle (\\bk+\\b4\\ba\\b5\\bd), then release the stick)"
	else
		change TRAIN_NTGFingerFlip_Video_txt1 = "(while nailing a grab do a quick quarter circle (\\bk+\\b4\\ba\\b5\\bd), then release the stick)"
	endif
endscript
