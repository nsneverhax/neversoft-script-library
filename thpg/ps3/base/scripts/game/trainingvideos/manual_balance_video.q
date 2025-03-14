Manual_Balance_Video = {
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
		movie = 'TRAIN_Manual'
		start_frame = 0
		end_frame = 330
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
			frame = 114
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 117
			create_element = {
				text = "To manual press \\b7,\\b4 quickly while skating."
			}
			fade_in_params = {
			}
		}
		{
			frame = 118
			wait_time = 2
		}
		{
			frame = 120
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 166
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 169
			create_element = {
				text = "Use \\b7 / \\b4 to help control your balance \\nsense.  don't let your balance stay red."
			}
			fade_in_params = {
			}
		}
		{
			frame = 170
			wait_time = 2
		}
		{
			frame = 171
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 198
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 201
			create_element = {
				text = "Keep your balance sense steady"
			}
			fade_in_params = {
			}
		}
		{
			frame = 202
			wait_time = 1.5
		}
		{
			frame = 203
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 210
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 213
			create_element = {
				text = "Green indicates that you're about to roll out of the manual."
				pos = (0.0, 175.0)
			}
			fade_in_params = {
			}
		}
		{
			frame = 214
			wait_time = 1.5
		}
		{
			frame = 215
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 234
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 237
			create_element = {
				text = "To land, ollie (\\m0) out of the manual."
			}
			fade_in_params = {
			}
		}
		{
			frame = 238
			wait_time = 1.5
		}
		{
			frame = 239
			destroy_element
			fade_out_params = {
			}
		}
	]
}
