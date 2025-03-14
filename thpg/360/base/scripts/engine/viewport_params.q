viewport_params = {
	perm_viewports = [
		{
			id = ui
			priority = 0
			has_ui = true
			has_ui_only = true
			clear_colorbuffer = false
			clear_depthstencilbuffer = false
		}
		{
			id = 0
			priority = 1
			player_viewport = true
			watereffect = true
			raineffect = true
			has_shadow = true
			draw_debug_lines = true
			show_lightvolumes = true
		}
		{
			id = 1
			priority = 1
			player_viewport = true
			watereffect = true
			raineffect = true
			has_shadow = true
			draw_debug_lines = true
			show_lightvolumes = true
		}
	]
	default_screen_mode = one_camera
	screen_modes = [
		{
			id = one_camera
			viewports = [
				{
					id = ui
					active = true
					style = fullscreen
				}
				{
					id = 0
					active = true
					style = fullscreen
				}
				{
					id = 1
					active = false
					style = fullscreen
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			id = split_vertical
			viewports = [
				{
					id = 0
					active = true
					style = split_v_left
				}
				{
					id = 1
					active = true
					style = split_v_right
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			id = split_horizontal
			viewports = [
				{
					id = 0
					active = true
					style = split_h_top
				}
				{
					id = 1
					active = true
					style = split_h_bottom
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			id = horse1
			viewports = [
				{
					id = 0
					active = true
					style = fullscreen
				}
				{
					id = 1
					active = false
					style = fullscreen
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			id = horse2
			viewports = [
				{
					id = 0
					active = false
					style = fullscreen
				}
				{
					id = 1
					active = true
					style = fullscreen
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			id = debug
			viewports = [
				{
					id = 0
					active = true
					style = fullscreen_with_debug
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
	]
	styles = {
		fullscreen = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
		}
		split_v_left = {
			rect = [
				0.0
				0.0
				0.5
				1.0
			]
			fov_adjustment = 0.5
		}
		split_v_right = {
			rect = [
				0.0
				0.0
				0.5
				1.0
			]
			fov_adjustment = 0.5
			render_to_texture_with_alpha
			ignore_alpha_channel
		}
		split_h_top = {
			rect = [
				0.0
				0.0
				1.0
				0.5
			]
		}
		split_h_bottom = {
			rect = [
				0.0
				0.0
				1.0
				0.5
			]
			render_to_texture_with_alpha
			ignore_alpha_channel
		}
		cutscene_movie_surface = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			render_to_texture_with_alpha
			resolution = 1.0
		}
		viewport_element = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			render_to_texture
			ignore_alpha_channel
			resolution = 0.5
		}
		viewport_photo = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			render_to_texture
			ignore_alpha_channel
			resolution = 0.75
		}
		viewport_element_square = {
			rect = [
				0.0
				0.0
				0.5625
				1.0
			]
			render_to_texture
			ignore_alpha_channel
			resolution = 0.5
		}
		fullscreen_with_debug = {
			rect = [
				0.0
				0.0
				0.75
				0.75
			]
		}
		shadow_big = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 1024
			height = 1024
			depth_only
		}
		shadow_small = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 512
			height = 512
			depth_only
		}
		imposter_rendering = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 256
			height = 512
			render_to_texture_with_alpha
			resolution = 1.0
		}
		debug_0 = {
			rect = [
				0.75
				0.0
				0.25
				0.25
			]
		}
		debug_1 = {
			rect = [
				0.75
				0.25
				0.25
				0.25
			]
		}
		debug_2 = {
			rect = [
				0.75
				0.5
				0.25
				0.25
			]
		}
		debug_3 = {
			rect = [
				0.75
				0.75
				0.25
				0.25
			]
		}
		debug_4 = {
			rect = [
				0.5
				0.75
				0.25
				0.25
			]
		}
		debug_5 = {
			rect = [
				0.25
				0.75
				0.25
				0.25
			]
		}
		debug_6 = {
			rect = [
				0.0
				0.75
				0.25
				0.25
			]
		}
	}
}
