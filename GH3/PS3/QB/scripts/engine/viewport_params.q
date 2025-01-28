viewport_Params = {
	perm_viewports = [
		{
			Id = UI
			Priority = 0
			has_ui = TRUE
			has_ui_only = TRUE
			clear_colorbuffer = FALSE
			clear_depthstencilbuffer = FALSE
		}
		{
			Id = 0
			Priority = 1
			player_viewport = TRUE
			has_shadow = FALSE
		}
		{
			Id = 1
			Priority = 1
			player_viewport = TRUE
			has_shadow = FALSE
		}
	]
	default_screen_mode = one_camera
	screen_modes = [
		{
			Id = one_camera
			Viewports = [
				{
					Id = UI
					Active = TRUE
					style = FullScreen
				}
				{
					Id = 0
					Active = FALSE
					style = FullScreen
				}
				{
					Id = 1
					Active = FALSE
					style = FullScreen
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			Id = split_vertical
			Viewports = [
				{
					Id = 0
					Active = FALSE
					style = split_v_left
				}
				{
					Id = 1
					Active = FALSE
					style = split_v_right
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			Id = split_horizontal
			Viewports = [
				{
					Id = 0
					Active = FALSE
					style = split_h_top
				}
				{
					Id = 1
					Active = FALSE
					style = split_h_bottom
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			Id = horse1
			Viewports = [
				{
					Id = 0
					Active = FALSE
					style = FullScreen
				}
				{
					Id = 1
					Active = FALSE
					style = FullScreen
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			Id = horse2
			Viewports = [
				{
					Id = 0
					Active = FALSE
					style = FullScreen
				}
				{
					Id = 1
					Active = FALSE
					style = FullScreen
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
		{
			Id = Debug
			Viewports = [
				{
					Id = 0
					Active = TRUE
					style = fullscreen_with_debug
				}
			]
			shadow_map_size = (1024.0, 512.0)
		}
	]
	styles = {
		FullScreen = {
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
			Height = 320
			copy_to_main
			Resolution = 1.0
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
			Height = 160
			copy_to_main
			Resolution = 1.0
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
			Resolution = 1.0
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
			Resolution = 0.5
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
			Resolution = 0.75
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
			Resolution = 0.5
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
			Height = 1024
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
			Height = 512
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
			Height = 256
			render_to_texture_with_alpha
			mipmap
			Resolution = 1.0
		}
		imposter_rendering_highres = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 256
			Height = 512
			render_to_texture_with_alpha
			mipmap
			Resolution = 1.0
		}
		highway_prepass_rendering_1p = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			Resolution = 1.0
			dummy_viewport
		}
		highway_prepass_rendering_2p1 = {
			rect = [
				0.0
				0.0
				0.5
				1.0
			]
			Resolution = 1.0
			dummy_viewport
		}
		highway_prepass_rendering_2p2 = {
			rect = [
				0.5
				0.0
				0.5
				1.0
			]
			Resolution = 1.0
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
			Resolution = 1.0
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
			Resolution = 1.0
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
			Resolution = 1.0
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
			Resolution = 1.0
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
