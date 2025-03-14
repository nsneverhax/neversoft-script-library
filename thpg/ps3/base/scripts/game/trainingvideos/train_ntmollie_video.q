TRAIN_NTMOllie_Video = {
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
		movie = 'TRAIN_NTM_Ollie'
		start_frame = 0
		end_frame = 502
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
			frame = 0
			wait_time = 0
		}
		{
			frame = 140
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 221
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 223
			event_script = m_c3_photothemed_chk2p1
			create_element = {
				type = textblockelement
				font = text_a1
				text = "You can ollie out\\nof a nailed manual\\n(release \\bh), right\\ninto nail the trick."
				pos = (300.0, -60.0)
				dims = (450.0, 0.0)
				internal_scale = 0.8
			}
			fade_in_params = {
			}
		}
		{
			frame = 223
			wait_time = 2
		}
		{
			frame = 278
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 344
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 346
			event_script = m_c3_photothemed_chk2p3
			create_element = {
				type = textblockelement
				font = text_a1
				text = "After you ollie\\nyou'll be in\\nnail the trick\\nmode, so nail a\\nfilp and land it!"
				pos = (400.0, -60.0)
				dims = (280.0, 0.0)
				internal_scale = 0.7
			}
			fade_in_params = {
			}
		}
		{
			frame = 346
			wait_time = 3
		}
		{
			frame = 388
			destroy_element
			fade_out_params = {
			}
		}
	]
}
