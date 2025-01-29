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
			has_shadow = false
		}
		{
			id = 1
			priority = 1
			player_viewport = true
			has_shadow = false
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
					active = false
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
					active = false
					style = split_v_left
				}
				{
					id = 1
					active = false
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
					active = false
					style = split_h_top
				}
				{
					id = 1
					active = false
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
					active = false
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
					active = false
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
		prepass_fullscreen = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			discard_previous_frame
		}
		split_v_left = {
			rect = [
				0.065
				0.0
				0.5
				1.0
			]
			fov_adjustment = 0.5
			discard_previous_frame
		}
		split_v_right = {
			rect = [
				0.435
				0.0
				0.5
				1.0
			]
			fov_adjustment = 0.5
			discard_previous_frame
		}
		split_h_top = {
			rect = [
				0.0
				0.0
				1.0
				0.5
			]
			discard_previous_frame
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
			discard_previous_frame
		}
		cutscene_movie_surface = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			render_to_texture_with_alpha
			width = 768
			height = 320
			copy_to_main
			resolution = 1.0
			discard_previous_frame
		}
		cutscene_movie_surface_ps3 = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			render_to_texture_with_alpha
			width = 384
			height = 160
			copy_to_main
			resolution = 1.0
			discard_previous_frame
		}
		cutscene_movie_surface_fs = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			render_to_texture_with_alpha
			copy_to_main
			resolution = 1.0
			discard_previous_frame
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
			discard_previous_frame
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
			width = 128
			height = 256
			render_to_texture_with_alpha
			mipmap
			resolution = 1.0
		}
		imposter_rendering_highres = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 256
			height = 512
			render_to_texture_with_alpha
			mipmap
			resolution = 1.0
		}
		highway_prepass_rendering_1p = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			resolution = 1.0
			dummy_viewport
		}
		highway_prepass_rendering_2p1 = {
			rect = [
				0.0
				0.0
				0.5
				1.0
			]
			resolution = 1.0
			dummy_viewport
		}
		highway_prepass_rendering_2p2 = {
			rect = [
				0.5
				0.0
				0.5
				1.0
			]
			resolution = 1.0
			dummy_viewport
		}
		highway_fader = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			resolve_rect = [
				0
				0
				1280
				720
			]
			resolve_to_texture_with_alpha
			resolution = 1.0
		}
		highway_fader_2p = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			resolve_rect = [
				0
				0
				1280
				720
			]
			resolve_to_texture_with_alpha
			resolution = 1.0
		}
		highway_fader_ps3 = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			resolve_rect = [
				0
				0
				1040
				592
			]
			resolve_to_texture_with_alpha
			resolution = 1.0
		}
		highway_fader_2p_ps3 = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			resolve_rect = [
				0
				0
				1040
				592
			]
			resolve_to_texture_with_alpha
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
