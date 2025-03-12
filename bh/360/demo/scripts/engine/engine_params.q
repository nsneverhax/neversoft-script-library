control_pelvis_offset_assert = 0
control_pelvis_max_offset = 2.5
control_pelvis_render_offset = 0
default_particle_lod_dist_pair = (600.0, 1000.0)
default_fast_particle_lod_dist_pair = (600.0, 1000.0)
splat_critical_remaining_polys_pcnt = 0.5
splat_alpha_degen_rate = 8
particle_heap_size = 2097152

script togglecontrolpelvisrender 
	if ($control_pelvis_render_offset = 0)
		change \{control_pelvis_render_offset = 1}
	else
		change \{control_pelvis_render_offset = 0}
	endif
endscript
havok_startup_params = {
	gravity = (0.0, -9.8, 0.0)
	collision_tolerance = 0.1
	deactivation_reference_distance = 0.02
	broad_phase_world_size = 20.0
	broad_phase_world_origin = (0.0, 0.0, 0.0)
	local_stack_size = 200000
}
camera_fov = 72.0
qspakmarginforotherlanguages = 100
engine_startup_params = [
	{
		platform = xenon
		target_ntsc_framerate = 60
		gpu_vsync_time_interval = 30
		pool_text_instances = 1024
		num_sound_instances = 64
		max_streams = 15
		max_sound_entries = 1536
		max_sound_busses = 256
		max_sound_effects = 64
		fmod_memory_size = 12582912
		num_mix_ahead_blocks = 2
		tcr_music_buss = music_frontend
		max_cscript_instances_per_script = 500
		primary_ring_buffer_size = 0
		secondary_ring_buffer_size = 2048
		segment_size = 8
		framebuffer_width = 1280
		globalshadow_width = 0
		globalshadow_height = 0
		cpu_skinning_buffer_size = 17500
		cpu_skinning_buffer_history = 4
		screenspace_width = 1280
		screenspace_height = 720
		default_far_plane_distance = 300
		jobq_worker_count = 3
		jobq_worker_config = [
			3
			5
			2
		]
		havok_jobq_worker_count = 2
		havok_jobq_worker_config = [
			3
			5
		]
		avatar_load_thread = 2
		cull_smallobj = 3E-05
		cull_max_instances = 400
		cull_max_geom = 1000
		cull_max_occluder = 256
		cull_qtree_center = (-7.0, 0.0, -13.0)
		cull_qtree_dim = 1300.0
		cull_qtree_floor = -10.0
		static_screen_guard_time = 5
		hardware_letterbox = true
		node_instances_buff = 312
		node_statics_buff = 240
		node_sort_buff = 209
		node_misc_buff = 2600
		node_2d_buff = 330
		node_particle_buff = 1500
		node_prim_buff = 512
		node_light_buff = 150
	}
	{
		platform = windx
		target_ntsc_framerate = 60
		gpu_vsync_time_interval = 30
		pool_text_instances = 1024
		num_sound_instances = 64
		max_streams = 15
		max_sound_entries = 1536
		max_sound_busses = 256
		max_sound_effects = 64
		fmod_memory_size = 12582912
		num_mix_ahead_blocks = 2
		tcr_music_buss = music_frontend
		max_cscript_instances_per_script = 500
		primary_ring_buffer_size = 0
		secondary_ring_buffer_size = 2048
		segment_size = 8
		framebuffer_width = 1280
		globalshadow_width = 0
		globalshadow_height = 0
		cpu_skinning_buffer_size = 17500
		cpu_skinning_buffer_history = 4
		screenspace_width = 1280
		screenspace_height = 720
		default_far_plane_distance = 300
		jobq_worker_count = 3
		jobq_worker_config = [
			3
			5
			2
		]
		havok_jobq_worker_count = 1
		havok_jobq_worker_config = [
			5
		]
		avatar_load_thread = 2
		cull_smallobj = 3E-05
		cull_max_instances = 400
		cull_max_geom = 1000
		cull_max_occluder = 256
		cull_qtree_center = (-7.0, 0.0, -13.0)
		cull_qtree_dim = 1300.0
		cull_qtree_floor = -10.0
		static_screen_guard_time = 5
		hardware_letterbox = true
		node_instances_buff = 312
		node_statics_buff = 240
		node_sort_buff = 209
		node_misc_buff = 1500
		node_2d_buff = 330
		node_particle_buff = 1500
		node_prim_buff = 512
		node_light_buff = 130
	}
	{
		platform = ps3
		target_ntsc_framerate = 60
		gpu_vsync_time_interval = 30
		pool_text_instances = 1024
		num_sound_instances = 64
		max_streams = 15
		max_sound_entries = 1536
		max_sound_busses = 256
		max_sound_effects = 64
		fmod_memory_size = 13107200
		num_mix_ahead_blocks = 5
		tcr_music_buss = music_frontend
		max_cscript_instances_per_script = 500
		primary_ring_buffer_size = 0
		secondary_ring_buffer_size = 4096
		framebuffer_width = 1040
		globalshadow_width = 0
		globalshadow_height = 0
		cpu_skinning_buffer_size = 18500
		cpu_skinning_buffer_history = 4
		cpu_skinning_buffer_location = 1
		spu_shaderpatch_buffer_size = 2048
		spu_shaderpatch_param_buffer_size = 256
		screenspace_width = 1280
		screenspace_height = 720
		default_far_plane_distance = 300
		jobq_worker_count = 5
		jobq_worker_config = [
			15
			15
			15
			15
			15
			15
			0
			0
		]
		jobq_fmod_spurs_count = 0
		jobq_havok_spurs_count = 0
		cull_smallobj = 3E-05
		cull_max_instances = 400
		cull_max_geom = 1000
		cull_max_occluder = 256
		cull_qtree_center = (-7.0, 0.0, -13.0)
		cull_qtree_dim = 1300.0
		cull_qtree_floor = -10.0
		static_screen_guard_time = 5
		hardware_letterbox = true
		node_instances_buff = 300
		node_statics_buff = 200
		node_sort_buff = 200
		node_misc_buff = 2400
		node_2d_buff = 325
		node_particle_buff = 1250
		node_prim_buff = 384
		node_light_buff = 250
		z_tile_override_width = 1536
		z_tile_override_height = 1536
	}
]
game_pools_xplatform = [
	{
		name = `mdl::playerservermessage`
		size = 128
	}
	{
		name = `templatepoolable(core::crefcounter)`
		size = 2048
	}
	{
		name = `nx::canimlookup`
		size = 200
	}
	{
		name = `anm::ceventtrack`
		size = 2048
	}
	{
		name = `gfx::cchangefovkey`
		size = 20000
	}
	{
		name = `gfx::ctempomatchingkey`
		size = 7000
	}
	{
		name = `gfx::cemptykey`
		size = 32
	}
	{
		name = `gfx::ceventkey`
		size = 15000
	}
	{
		name = `obj::cscriptlistentry`
		size = 1000
	}
	{
		name = `obj::ceventreceiverlist`
		size = 175
	}
	{
		name = `ass::cassettable::scontextinfo`
		size = 28
	}
]
memory_startup_params = [
	{
		platform = xenon
		small_pool_sizes = [
			1500
			2000
			10000
			20000
			3000
			2500
			1500
			1024
			128
			4096
			256
			4096
			256
			1000
			512
			4500
			1024
			3000
			256
			1024
			96
			96
			96
			1000
			1500
			256
			256
			512
			64
			32
			6000
			384
		]
		game_pools = $game_pools_xplatform
	}
	{
		platform = windx
		small_pool_sizes = [
			1500
			2000
			10000
			20000
			3000
			2500
			1500
			1024
			128
			4096
			256
			4096
			256
			1000
			512
			4500
			1024
			3000
			256
			1024
			96
			96
			96
			1000
			1500
			256
			256
			6000
			64
			650
			128
			384
		]
		game_pools = $game_pools_xplatform
	}
	{
		platform = ps3
		small_pool_sizes = [
			1500
			3000
			20000
			20000
			4000
			2500
			2000
			1024
			256
			4096
			256
			4096
			256
			5000
			2000
			5500
			1500
			3000
			256
			1500
			256
			128
			128
			1524
			1500
			256
			256
			512
			64
			6000
			128
			384
		]
		game_pools = $game_pools_xplatform
	}
]
viewport_params = {
	perm_viewports = [
		{
			id = ui
			priority = 0
			style = viewport_ui_overlay
			has_ui = true
			has_ui_only = true
			draw_2d_debug_lines = true
			clear_colorbuffer = false
			clear_depthstencilbuffer = false
			no_resolve_colorbuffer = true
			no_resolve_depthstencilbuffer = true
			framerate = 60
			framemask = 3
		}
		{
			id = 0
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
					style = viewport_ui_overlay
				}
				{
					id = 0
					active = false
					style = 0x5d70db18
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
			allow_msaa
			managed
			uidims = (1280.0, 720.0)
			profilerid = mainviewport
		}
		0x5d70db18 = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			allow_msaa
			managed
			uidims = (1280.0, 720.0)
			profilerid = mainviewport
			disablevisibility
		}
		fullscreen_nomsaa = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			managed
			resolve_to_prev_texture_with_alpha
			uidims = (1280.0, 720.0)
			profilerid = mainviewport
		}
		prepass_fullscreen = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			managed
			discard_previous_frame
			uidims = (1280.0, 720.0)
		}
		split_v_left = {
			rect = [
				0.065
				0.0
				0.5
				1.0
			]
			managed
			fov_adjustment = 0.5
			discard_previous_frame
			uidims = (1280.0, 720.0)
			profilerid = mainviewport
		}
		split_v_right = {
			rect = [
				0.435
				0.0
				0.5
				1.0
			]
			managed
			fov_adjustment = 0.5
			discard_previous_frame
			uidims = (1280.0, 720.0)
			profilerid = mainviewport
		}
		split_h_top = {
			rect = [
				0.0
				0.0
				1.0
				0.5
			]
			managed
			discard_previous_frame
			uidims = (1280.0, 720.0)
			profilerid = mainviewport
		}
		split_h_bottom = {
			managed
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
			profilerid = mainviewport
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
			uidims = (384.0, 160.0)
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
		viewport_ui_overlay = {
			dummy_viewport
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			uidims = (1280.0, 720.0)
			profilerid = uiviewport
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
			profilerid = uiviewport
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
			dummy_viewport
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			uidims = (768.0, 768.0)
			profilerid = shadowviewport
		}
		shadow_small = {
			dummy_viewport
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			uidims = (512.0, 512.0)
			profilerid = shadowviewport
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
			profilerid = crowdviewport
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
				768.0
			]
			width = 768
			height = 768
			render_to_texture_with_alpha
			mipmap
			disablevisibility
			resolution = 1.0
			uidims = (768.0, 768.0)
			profilerid = crowdviewport
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
				1024.0
				1024.0
			]
			width = 1024
			height = 1024
			render_to_texture_with_alpha
			mipmap
			disablevisibility
			resolution = 1.0
			uidims = (1024.0, 1024.0)
			profilerid = crowdviewport
		}
		imposter_rendering_quad0 = {
			rect = [
				0.0
				0.0
				0.25
				0.5
			]
			width = 768
			height = 768
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
			profilerid = crowdviewport
		}
		imposter_rendering_quad1 = {
			rect = [
				0.0
				0.5
				0.25
				1.0
			]
			width = 768
			height = 768
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
			profilerid = crowdviewport
		}
		imposter_rendering_quad2 = {
			rect = [
				0.25
				0.0
				0.5
				0.5
			]
			width = 768
			height = 768
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
			profilerid = crowdviewport
		}
		imposter_rendering_quad3 = {
			rect = [
				0.25
				0.5
				0.5
				1.0
			]
			width = 768
			height = 768
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
			profilerid = crowdviewport
		}
		imposter_rendering_quad4 = {
			rect = [
				0.5
				0.0
				0.75
				0.5
			]
			width = 768
			height = 768
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
			profilerid = crowdviewport
		}
		imposter_rendering_quad5 = {
			rect = [
				0.5
				0.5
				0.75
				1.0
			]
			width = 768
			height = 768
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (768.0, 768.0)
			profilerid = crowdviewport
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
			profilerid = crowdviewport
		}
		imposter_rendering_highres_quad0 = {
			rect = [
				0.0
				0.0
				0.25
				0.5
			]
			profilerid = crowdviewport
		}
		imposter_rendering_highres_quad1 = {
			rect = [
				0.0
				0.5
				0.25
				1.0
			]
			profilerid = crowdviewport
		}
		imposter_rendering_highres_quad2 = {
			rect = [
				0.25
				0.0
				0.5
				0.5
			]
			profilerid = crowdviewport
		}
		imposter_rendering_highres_quad3 = {
			rect = [
				0.25
				0.5
				0.5
				1.0
			]
			profilerid = crowdviewport
		}
		imposter_rendering_highres_quad4 = {
			rect = [
				0.5
				0.0
				0.75
				0.5
			]
			profilerid = crowdviewport
		}
		imposter_rendering_highres_quad5 = {
			rect = [
				0.5
				0.5
				0.75
				1.0
			]
			resolution = 1.0
			profilerid = crowdviewport
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
			profilerid = tvviewport
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
		visualizer_rendering_hires = {
			color_only
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 1280
			height = 720
			resolve_to_prev_texture_with_alpha
			render_to_texture
			managed
			disablevisibility
			framerate = 60
			framemask = 3
			resolution = 1.0
			uidims = (1280.0, 720.0)
			profilerid = visualizerviewport
		}
		vocals_visualizer_rendering = {
			color_only
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 456
			height = 104
			resolve_to_prev_texture_with_alpha
			render_to_texture_with_alpha
			disablevisibility
			framerate = 60
			framemask = 3
			managed
			resolution = 1.0
			uidims = (456.0, 104.0)
			profilerid = visualizerviewport
		}
		vocals_freeform_rendering = {
			color_only
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 640
			height = 104
			resolve_to_prev_texture_with_alpha
			render_to_texture_with_alpha
			disablevisibility
			framerate = 60
			framemask = 3
			managed
			resolution = 1.0
			uidims = (1280.0, 104.0)
			profilerid = highwayviewport
		}
		highway_visualizer_rendering = {
			color_only
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 256
			height = 400
			resolve_to_prev_texture_with_alpha
			render_to_texture_with_alpha
			disablevisibility
			framerate = 60
			framemask = 3
			managed
			resolution = 1.0
			uidims = (128.0, 128.0)
			profilerid = visualizerviewport
		}
		ui_visualizer_rendering = {
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
			disablevisibility
			framerate = 60
			framemask = 3
			managed
			resolution = 1.0
			uidims = (256.0, 256.0)
			profilerid = visualizerviewport
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
			profilerid = uiviewport
		}
		bandname_rendering = {
			color_only
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
			profilerid = uiviewport
		}
		unwrap_rendering = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 512
			height = 256
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
			profilerid = highwayviewport
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
			profilerid = highwayviewport
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
			profilerid = highwayviewport
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
			resolve_to_prev_texture_with_alpha
			allow_msaa
			resolution = 1.0
			uidims = (1280.0, 720.0)
			profilerid = highwayviewport
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
			resolve_to_prev_texture_with_alpha
			resolution = 1.0
			uidims = (1280.0, 720.0)
			profilerid = highwayviewport
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
			resolve_to_prev_texture_with_alpha
			resolution = 1.0
			uidims = (1280.0, 720.0)
			profilerid = highwayviewport
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
			resolve_to_prev_texture_with_alpha
			resolution = 1.0
			uidims = (1280.0, 720.0)
			profilerid = highwayviewport
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
			width = 220
			height = 405
			managed
			render_to_texture_with_alpha
			resolution = 1.0
			uidims = (672.0, 122.0)
		}
		crowd_base_768 = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 768
			height = 768
			render_to_texture_with_alpha
			mipmap
			use_tiling
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
			resourceid = crowd
		}
		crowd_base_1024 = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 1024
			height = 1024
			render_to_texture_with_alpha
			mipmap
			use_tiling
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
			resourceid = crowd
		}
		crowd_base_1536 = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 1536
			height = 1536
			render_to_texture_with_alpha
			mipmap
			use_tiling
			use_comp_c32_2x1
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
			resourceid = crowd
		}
		crowd_quad0 = {
			rect = [
				0.0
				0.0
				0.25
				0.5
			]
		}
		crowd_quad1 = {
			rect = [
				0.0
				0.5
				0.25
				1.0
			]
		}
		crowd_quad2 = {
			rect = [
				0.25
				0.0
				0.5
				0.5
			]
		}
		crowd_quad3 = {
			rect = [
				0.25
				0.5
				0.5
				1.0
			]
		}
		crowd_quad4 = {
			rect = [
				0.5
				0.0
				0.75
				0.5
			]
		}
		crowd_quad5 = {
			rect = [
				0.5
				0.5
				0.75
				1.0
			]
		}
		crowd_quad6 = {
			rect = [
				0.75
				0.0
				1.0
				0.5
			]
		}
		crowd_quad7 = {
			rect = [
				0.75
				0.5
				1.0
				1.0
			]
		}
		crowd_jiggle3_base_1024_xenon = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 256
			height = 1024
			texture_width = 1024
			texture_height = 1024
			render_to_texture_with_alpha
			mipmap
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
			resourceid = crowd
		}
		crowd_jiggle3_base_4x_1024_xenon = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 256
			height = 1024
			texture_width = 1024
			texture_height = 1024
			render_to_texture_with_alpha
			mipmap
			msaax4
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
			resourceid = crowd
		}
		crowd_jiggle3_base_2x_1024_xenon = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 256
			height = 1024
			texture_width = 1024
			texture_height = 1024
			render_to_texture_with_alpha
			mipmap
			msaax2
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
			resourceid = crowd
		}
		crowd_jiggle3_base_1536_xenon = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 384
			height = 1536
			texture_width = 1536
			texture_height = 1536
			render_to_texture_with_alpha
			mipmap
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
			resourceid = crowd
		}
		crowd_jiggle3_base_2x_1536_xenon = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 384
			height = 1536
			texture_width = 1536
			texture_height = 1536
			render_to_texture_with_alpha
			mipmap
			msaax2
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
			resourceid = crowd
		}
		crowd_jiggle3_base_2048_xenon = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 512
			height = 2048
			texture_width = 2048
			texture_height = 2048
			render_to_texture_with_alpha
			colorformat_555
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
			resourceid = crowd
		}
		crowd_jiggle3_quad0_xenon = {
			rect = [
				0.0
				0.0
				1.0
				0.5
			]
			resolve_point = (0.0, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle3_quad1_xenon = {
			rect = [
				0.0
				0.5
				1.0
				1.0
			]
			resolve_point = (0.0, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle3_quad2_xenon = {
			rect = [
				0.0
				0.0
				1.0
				0.5
			]
			resolve_point = (0.25, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle3_quad3_xenon = {
			rect = [
				0.0
				0.5
				1.0
				1.0
			]
			resolve_point = (0.25, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle3_quad4_xenon = {
			rect = [
				0.0
				0.0
				1.0
				0.5
			]
			resolve_point = (0.5, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle3_quad5_xenon = {
			rect = [
				0.0
				0.5
				1.0
				1.0
			]
			resolve_point = (0.5, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle3_quad6_xenon = {
			rect = [
				0.0
				0.0
				1.0
				0.5
			]
			resolve_point = (0.75, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle3_quad7_xenon = {
			rect = [
				0.0
				0.5
				1.0
				1.0
			]
			resolve_point = (0.75, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle2_base_1024_xenon = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 768
			height = 512
			texture_width = 1024
			texture_height = 1024
			render_to_texture_with_alpha
			mipmap
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
		}
		crowd_jiggle2_base_2x_1024_xenon = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 768
			height = 512
			texture_width = 1024
			texture_height = 1024
			render_to_texture_with_alpha
			mipmap
			msaax2
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
		}
		crowd_jiggle2_base_1536_xenon = {
			rect = [
				0.0
				0.0
				1.0
				1.0
			]
			width = 1152
			height = 768
			texture_width = 1536
			texture_height = 1536
			render_to_texture_with_alpha
			mipmap
			disablevisibility
			resolution = 1.0
			profilerid = crowdviewport
		}
		crowd_jiggle2_quad0_xenon = {
			rect = [
				0.0
				0.0
				0.33333334
				1.0
			]
			resolve_point = (0.0, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle2_quad1_xenon = {
			rect = [
				0.33333334
				0.0
				0.6666667
				1.0
			]
			resolve_point = (0.0, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle2_quad2_xenon = {
			rect = [
				0.6666667
				0.0
				1.0
				1.0
			]
			resolve_point = (0.0, 0.0)
			profilerid = crowdviewport
		}
		crowd_jiggle2_quad3_xenon = {
			rect = [
				0.0
				0.0
				0.33333334
				1.0
			]
			resolve_point = (0.0, 0.5)
			profilerid = crowdviewport
		}
		crowd_jiggle2_quad4_xenon = {
			rect = [
				0.33333334
				0.0
				0.6666667
				1.0
			]
			resolve_point = (0.0, 0.5)
			profilerid = crowdviewport
		}
		crowd_jiggle2_quad5_xenon = {
			rect = [
				0.6666667
				0.0
				1.0
				1.0
			]
			resolve_point = (0.0, 0.5)
			profilerid = crowdviewport
		}
	}
}
ps3_video_out_params = [
	{
		id = 480i_4_3
		border_x = 16
		border_y = 0
		shift_x = 0
		shift_y = 0
		aspect_correction = 1.0
	}
	{
		id = 480i_16_9
		border_x = 16
		border_y = 0
		shift_x = 0
		shift_y = 0
		aspect_correction = 1.0
	}
	{
		id = 480p_4_3
		border_x = 14
		border_y = 0
		shift_x = 0
		shift_y = 0
		aspect_correction = 1.0
	}
	{
		id = 480p_16_9
		border_x = 14
		border_y = 0
		shift_x = 0
		shift_y = 0
		aspect_correction = 1.0
	}
	{
		id = 0x4eca65ea
		border_x = 16
		border_y = 0
		shift_x = 0
		shift_y = 0
		aspect_correction = 1.0
	}
	{
		id = 0xa6046d3d
		border_x = 16
		border_y = 0
		shift_x = 0
		shift_y = 0
		aspect_correction = 1.0
	}
	{
		id = 0x233a9019
		border_x = 14
		border_y = 0
		shift_x = 0
		shift_y = 0
		aspect_correction = 1.0
	}
	{
		id = 0x82dd3e6e
		border_x = 14
		border_y = 0
		shift_x = 0
		shift_y = 0
		aspect_correction = 1.0
	}
]
