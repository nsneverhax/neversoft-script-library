sfx_all_params = {
	shadoweffect = true
	lightvolumes = true
	lightflares = true
	softedgeparticles = true
	trackrendernodegputime = true
}
viewport_params = {
	perm_viewports = [
		{
			id = UI
			Priority = 0
			has_ui = true
			has_ui_only = true
			draw_2d_debug_lines = true
			clear_colorbuffer = FALSE
			clear_depthstencilbuffer = FALSE
			no_resolve_colorbuffer = true
			no_resolve_depthstencilbuffer = true
		}
		{
			id = 0
			Priority = 1
			player_viewport = true
			has_shadow = FALSE
		}
	]
	default_screen_mode = one_camera
	screen_modes = [
		{
			id = one_camera
			viewports = [
				{
					id = UI
					Active = true
					style = fullscreen
				}
				{
					id = 0
					Active = FALSE
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
					Active = true
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
			allow_msaa
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
				0.0
				0.0
				0.5
				1.0
			]
			fov_adjustment = 0.5
			discard_previous_frame
		}
		split_v_right = {
			rect = [
				0.5
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
		viewport_ui_texture = {
			render_to_texture_with_alpha
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
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
			width = 768
			height = 768
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
		imposter_rendering_quad_base = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 512
			height = 512
			render_to_texture_with_alpha
			mipmap
			disablevisibility
			resolution = 1.0
		}
		imposter_rendering_highres_quad_base = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			resolve_rect = [
				0.0
				0.0
				768.0
				1024.0
			]
			width = 1024
			height = 1024
			render_to_texture_with_alpha
			mipmap
			disablevisibility
			resolution = 1.0
		}
		imposter_rendering_quad0 = {
			rect = [
				0.0
				0.0
				0.25
				0.5
			]
			width = 512
			height = 512
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_quad1 = {
			rect = [
				0.0
				0.5
				0.25
				1.0
			]
			width = 512
			height = 512
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_quad2 = {
			rect = [
				0.25
				0.0
				0.5
				0.5
			]
			width = 512
			height = 512
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_quad3 = {
			rect = [
				0.25
				0.5
				0.5
				1.0
			]
			width = 512
			height = 512
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_quad4 = {
			rect = [
				0.5
				0.0
				0.75
				0.5
			]
			width = 512
			height = 512
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_quad5 = {
			rect = [
				0.5
				0.5
				0.75
				1.0
			]
			width = 512
			height = 512
			render_to_texture_with_alpha
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
		imposter_rendering_highres_quad0 = {
			rect = [
				0.0
				0.0
				0.25
				0.5
			]
			width = 1024
			height = 1024
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_highres_quad1 = {
			rect = [
				0.0
				0.5
				0.25
				1.0
			]
			width = 1024
			height = 1024
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_highres_quad2 = {
			rect = [
				0.25
				0.0
				0.5
				0.5
			]
			width = 1024
			height = 1024
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_highres_quad3 = {
			rect = [
				0.25
				0.5
				0.5
				1.0
			]
			width = 1024
			height = 1024
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_highres_quad4 = {
			rect = [
				0.5
				0.0
				0.75
				0.5
			]
			width = 1024
			height = 1024
			render_to_texture_with_alpha
			resolution = 1.0
		}
		imposter_rendering_highres_quad5 = {
			rect = [
				0.5
				0.5
				0.75
				1.0
			]
			width = 1024
			height = 1024
			render_to_texture_with_alpha
			resolution = 1.0
		}
		jumbotron_rendering = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 256
			height = 128
			render_to_texture_with_alpha
			mipmap
			resolution = 1.0
		}
		character_head_rendering = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 128
			height = 128
			mipmap
			render_to_texture_with_alpha
			resolution = 1.0
		}
		magazine_rendering = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 512
			height = 512
			render_to_texture
			ignore_alpha_channel
			resolution = 1.0
		}
		bandname_rendering = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 512
			height = 128
			render_to_texture_with_alpha
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
			allow_msaa
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
		highway_fader_ps2 = {
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
		highway_fader_2p_ps2 = {
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
		band_viewports = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 256
			height = 512
			mipmap
			render_to_texture
			resolution = 1.0
			uidims = (672.0, 122.0)
		}
		visualizer_rendering = {
			color_only
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 512
			height = 512
			resolve_to_prev_texture_with_alpha
			render_to_texture_with_alpha
			managed
			disablevisibility
			framerate = 60
			framemask = 3
			resolution = 1.0
			uidims = (256.0, 124.0)
			profilerid = visualizerviewport
		}
	}
}
