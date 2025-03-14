AggroKick_Video = {
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
		pos = (-170.0, 250.0)
		rgba = [
			240
			240
			240
			255
		]
	}
	movie_params = {
		movie = 'train_vid_aggro_kick'
		start_frame = 0
		end_frame = 635
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
		pos = (-55.0, -175.0)
		dims = (1000.0, 0.0)
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
			240
			240
			240
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
	exit_script = Turn_Off_All_AggroKick_VO
	events = [
		{
			frame = 0
			create_element = {
				type = textblockelement
				font = text_a1
				text = "AGGRO KICK"
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
			}
			fade_in_params = {
			}
		}
		{
			frame = 0
			wait_time = 0
		}
		{
			frame = 25
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 28
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 30
			event_script = VO_m_h1_bigpush_inst_01
			create_element = {
				text = "Use this (press \\bf) to start kicking hard for speed."
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
			frame = 90
			wait_time = 0
		}
		{
			frame = 178
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 278
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 280
			event_script = VO_m_h1_bigpush_inst_02
			create_element = {
				text = "To go even faster, (press \\bf) kick again when your leg is fully stretched forward."
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
			frame = 284
			wait_time = 1.5
		}
		{
			frame = 325
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 372
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 375
			event_script = VO_m_h1_bigpush_inst_03
			create_element = {
				text = "If push at the wrong time you'll lose all your speed, so try to keep the rhythm."
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
			frame = 383
			wait_time = 3
		}
		{
			frame = 395
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 523
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 525
			event_script = VO_m_h1_bigpush_inst_03b
			create_element = {
				text = "Push again (press \\bf) when your leg is fully stretched forward."
				pos = (0.0, -175.0)
				dims = (1120.0, 0.0)
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
			frame = 568
			wait_time = 1.5
		}
		{
			frame = 570
			destroy_element
			fade_out_params = {
			}
		}
	]
}
