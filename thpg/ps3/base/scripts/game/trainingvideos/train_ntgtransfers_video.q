TRAIN_NTGTransfers_Video_txt1 = ""
TRAIN_NTGTransfers_Video = {
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
		movie = 'Train_NTG_transfer'
		start_frame = 0
		end_frame = 517
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
		dims = (400.0, 0.0)
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
			frame = 73
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 75
			create_element = {
				type = textblockelement
				font = text_a1
				text = "You can switch to\\ndifferent grabs in\\nmid-air by doing a\\ngrab transfer."
				pos = (-335.0, -175.0)
				dims = (385.0, 0.0)
				internal_scale = 0.8
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
			frame = 77
			event_script = m_c2_ntg_inst_05
		}
		{
			frame = 75
			wait_time = 2
		}
		{
			frame = 110
			event_script = TRAIN_NTGTransfers_Video_Determine_Console
		}
		{
			frame = 124
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 198
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 198
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTGTransfers_Video_txt1
				pos = (290.0, -65.0)
				dims = (480.0, 0.0)
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
			frame = 198
			wait_time = 3
		}
		{
			frame = 243
			destroy_element
			fade_out_params = {
			}
		}
	]
}

script TRAIN_NTGTransfers_Video_Determine_Console 
	if isps3
		change TRAIN_NTGTransfers_Video_txt1 = "(release one stick\\nwithout releasing \\bg,\\nthen move the other\\nstick)"
	else
		change TRAIN_NTGTransfers_Video_txt1 = "(release one stick\\nwithout releasing \\bg,\\nthen move the other\\nstick)"
	endif
endscript
