TRAIN_NTTKickflip_Video_kickflip = "The most basic fliptrick is a\\nkickflip. (Hold \\b4\\bk)"
TRAIN_NTTKickflip_Video_release = "(release \\bk with grip tape\\nside up to land)"
TRAIN_NTTKickflip_Video = {
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
		movie = 'Train_NTT_kickflip'
		start_frame = 0
		end_frame = 287
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
		pos = (235.0, 160.0)
		dims = (595.0, 0.0)
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
			frame = 60
			event_script = TRAIN_NTTKickflip_Video_Determine_Stance
		}
		{
			frame = 90
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 92
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTTKickflip_Video_kickflip
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
			frame = 95
			event_script = m_c1_ntt_inst_06
		}
		{
			frame = 92
			wait_time = 1.5
		}
		{
			frame = 138
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 217
			create_element = {
				type = textblockelement
				font = text_a1
				text = $TRAIN_NTTKickflip_Video_release
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
			frame = 217
			event_script = sk9_Skater_Stop_SFX2
		}
		{
			frame = 217
			wait_time = 2
		}
		{
			frame = 232
			destroy_element
			fade_out_params = {
			}
		}
	]
}

script TRAIN_NTTKickflip_Video_Determine_Stance 
	if skater :flipped
		change \{TRAIN_NTTKickflip_Video_kickflip = "The most basic fliptrick is a\\nkickflip. (Hold \\b4\\bl)"}
		change \{TRAIN_NTTKickflip_Video_release = "(release \\bl with grip tape\\nside up to land)"}
	endif
endscript
