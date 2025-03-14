Grind_Balance_Video = {
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
		movie = 'TRAIN_Grind'
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
			frame = 124
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 127
			create_element = {
				text = "Press and release \\m0 to ollie before the grind."
			}
			fade_in_params = {
			}
		}
		{
			frame = 128
			wait_time = 1.5
		}
		{
			frame = 129
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 137
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 140
			create_element = {
				text = "Press \\b0 to catch the grind."
			}
			fade_in_params = {
			}
		}
		{
			frame = 145
			wait_time = 1.5
		}
		{
			frame = 146
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 196
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 199
			create_element = {
				text = "This your sense of balance. \\n\\ndon't let your balance stay red."
			}
			fade_in_params = {
			}
		}
		{
			frame = 201
			wait_time = 1.5
		}
		{
			frame = 202
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 239
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 242
			create_element = {
				text = "Use \\b6, \\b5 to control balance.  \\n\\nwhite indicates your balance is steady."
			}
			fade_in_params = {
			}
		}
		{
			frame = 245
			wait_time = 1.5
		}
		{
			frame = 246
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 284
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 287
			create_element = {
				text = "Press \\m0 to ollie off the grind \\nand land, before you bail."
			}
			fade_in_params = {
			}
		}
		{
			frame = 289
			wait_time = 1.5
		}
		{
			frame = 300
			destroy_element
			fade_out_params = {
			}
		}
	]
}
