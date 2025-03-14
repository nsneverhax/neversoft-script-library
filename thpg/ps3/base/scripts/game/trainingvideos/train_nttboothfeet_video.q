TRAIN_NTTBoothFeet_Video = {
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
		movie = 'Train_NTT_BothFeet'
		start_frame = 0
		end_frame = 233
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
			frame = 89
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 91
			create_element = {
				type = textblockelement
				font = text_a1
				text = "If you wanna make\\nup your own trick,\\njust kick the board\\nwith both feet at\\nthe same time."
				pos = (350.0, -45.0)
				dims = (355.0, 0.0)
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
			frame = 94
			event_script = m_c1_ntt_inst_09
		}
		{
			frame = 91
			wait_time = 2
		}
		{
			frame = 142
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 180
			create_element = {
				type = textblockelement
				font = text_a1
				text = "(release \\bk and \\bl with grip tape\\nside up to land)"
				pos = (160.0, 160.0)
				dims = (760.0, 0.0)
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
			frame = 180
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 180
			wait_time = 2
		}
		{
			frame = 190
			destroy_element
			fade_out_params = {
			}
		}
	]
}
