Default_Particle_LOD_Dist_Pair = (600.0, 1000.0)
Default_Fast_Particle_LOD_Dist_Pair = (600.0, 1000.0)
camera_fov = 72.0
qspakmarginforotherlanguages = 20
engine_startup_params = [
	{
		Platform = PS2
		target_ntsc_framerate = 60
		pool_text_instances = 475
		num_sound_instances = 512
		num_stream_resources = 3
		max_streams = 3
		max_sound_entries = 16
		max_sound_busses = 64
		max_sound_effects = 16
		sound_memory_size = 256
		super_sector_target_max_dim = 1000.0
		super_sector_max_row_and_col = 40
		max_cscript_instances_per_script = 200
		dma_buffer_size = 786432
		debug_dma_buffer_size = 16256000
		single_dma_list = 1
		dma_overflow_warning = 90
		bone_lod_allow = 1
		bone_lod_dist = 700.0
		num_mem_streams = 0
		mem_stream_buffer_size = 0
		framebuffer_width = 640
		screenspace_width = 640
		screenspace_height = 448
		default_far_plane_distance = 300
		hardware_letterbox = FALSE
		static_screen_guard_time = 10
	}
]
game_pools_xplatform = [
	{
		Name = `mdl::playerservermessage`
		size = 64
	}
	{
		Name = `nx::canimlookup`
		size = 96
	}
	{
		Name = `obj::cscriptlistentry`
		size = 1000
	}
	{
		Name = `obj::ceventreceiverlist`
		size = 175
	}
	{
		Name = `ass::cassettable::scontextinfo`
		size = 6
	}
]
memory_startup_params = [
	{
		Platform = PS2
		small_pool_sizes = [
			752
			950
			1349
			9440
			1033
			675
			3737
			200
			1231
			176
			116
			323
			362
			669
			248
			279
			69
			2335
			16
			1203
			33
			981
			39
			321
			10
			8
			21
			14
			6
			14
			15
			174
		]
		game_pools = $game_pools_xplatform
	}
]
0xe0d000fd = 768
0x4ffe733f = 768
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
			uidims = (1280.0, 720.0)
		}
		prepass_fullscreen = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			discard_previous_frame
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
		}
		split_h_top = {
			rect = [
				0.0
				0.0
				1.0
				0.5
			]
			discard_previous_frame
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
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
			uidims = (768.0, 320.0)
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
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
		}
		viewport_ui_texture = {
			render_to_texture_with_alpha
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
		}
		fullscreen_with_debug = {
			rect = [
				0.0
				0.0
				0.75
				0.75
			]
			discard_previous_frame
			uidims = (1280.0, 720.0)
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
			uidims = (768.0, 768.0)
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
			uidims = (512.0, 512.0)
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
			uidims = (128.0, 256.0)
		}
		imposter_rendering_quad_base = {
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
			width = $0xe0d000fd
			height = $0x4ffe733f
			render_to_texture_with_alpha
			mipmap
			disablevisibility
			resolution = 1.0
			uidims = (768.0, 768.0)
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
			uidims = (1024.0, 1024.0)
		}
		imposter_rendering_quad0 = {
			rect = [
				0.0
				0.0
				0.25
				0.5
			]
			width = $0xe0d000fd
			height = $0x4ffe733f
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
		}
		imposter_rendering_quad1 = {
			rect = [
				0.0
				0.5
				0.25
				1.0
			]
			width = $0xe0d000fd
			height = $0x4ffe733f
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
		}
		imposter_rendering_quad2 = {
			rect = [
				0.25
				0.0
				0.5
				0.5
			]
			width = $0xe0d000fd
			height = $0x4ffe733f
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
		}
		imposter_rendering_quad3 = {
			rect = [
				0.25
				0.5
				0.5
				1.0
			]
			width = $0xe0d000fd
			height = $0x4ffe733f
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
		}
		imposter_rendering_quad4 = {
			rect = [
				0.5
				0.0
				0.75
				0.5
			]
			width = $0xe0d000fd
			height = $0x4ffe733f
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
		}
		imposter_rendering_quad5 = {
			rect = [
				0.5
				0.5
				0.75
				1.0
			]
			width = $0xe0d000fd
			height = $0x4ffe733f
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
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
			uidims = (256.0, 512.0)
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
			uidims = (1024.0, 1024.0)
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
			uidims = (1024.0, 1024.0)
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
			uidims = (1024.0, 1024.0)
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
			uidims = (1024.0, 1024.0)
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
			uidims = (1024.0, 720.0)
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
			uidims = (1024.0, 1024.0)
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
			uidims = (256.0, 124.0)
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
			uidims = (128.0, 128.0)
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
			uidims = (512.0, 512.0)
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
			uidims = (512.0, 128.0)
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
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
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
			uidims = (1280.0, 720.0)
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
	}
}
