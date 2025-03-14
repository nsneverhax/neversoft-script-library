Revert2Manual_video = {
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
		movie = 'TRAIN_Revert'
		start_frame = 0
		end_frame = 250
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
		pos = (0.0, -215.0)
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
			frame = 94
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 97
			create_element = {
				text = "Jump (\\m0) off this QP then. "
			}
			fade_in_params = {
			}
		}
		{
			frame = 100
			wait_time = 1.5
		}
		{
			frame = 105
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 136
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 139
			create_element = {
				text = "As soon as you land, Revert (\\bh)."
			}
			fade_in_params = {
			}
		}
		{
			frame = 141
			wait_time = 2
		}
		{
			frame = 142
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 140
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 143
			create_element = {
				text = "Then do a Manual (\\b7\\b4) right away!"
			}
			fade_in_params = {
			}
		}
		{
			frame = 144
			wait_time = 2
		}
		{
			frame = 145
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 185
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 185
			create_element = {
				text = "This keeps your combo going.\\n\\nTo land, ollie (\\m0) out of the manual."
			}
			fade_in_params = {
			}
		}
		{
			frame = 185
			wait_time = 2
		}
		{
			frame = 210
			destroy_element
			fade_out_params = {
			}
		}
	]
}
