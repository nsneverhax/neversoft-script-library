TRAIN_NTTBranch_Video = {
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
		movie = 'Train_NTT_Branch'
		start_frame = 0
		end_frame = 341
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
		pos = (175.0, 175.0)
		dims = (730.0, 0.0)
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
			frame = 71
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 73
			create_element = {
				type = textblockelement
				font = text_a1
				text = "You can do underflips and late flips by branching your flip tricks."
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
			frame = 76
			event_script = m_c1_ntt_inst_10
		}
		{
			frame = 73
			wait_time = 2
		}
		{
			frame = 115
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 203
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 205
			create_element = {
				type = textblockelement
				font = text_a1
				text = "(grip tape or truck side up to branch)"
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
			frame = 205
			wait_time = 2
		}
		{
			frame = 252
			destroy_element
			fade_out_params = {
			}
		}
	]
}
