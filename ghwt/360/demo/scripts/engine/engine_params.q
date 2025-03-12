control_pelvis_offset_assert = 0
control_pelvis_max_offset = 2.5
control_pelvis_render_offset = 0

script togglecontrolpelvisrender 
	if ($control_pelvis_render_offset = 0)
		change \{control_pelvis_render_offset = 1}
	else
		change \{control_pelvis_render_offset = 0}
	endif
endscript
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
		cpu_skinning_buffer_size = 18500
		cpu_skinning_buffer_history = 3
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
		cull_smallobj = 3E-05
		cull_max_instances = 400
		cull_max_geom = 1000
		cull_max_occluder = 256
		hardware_letterbox = true
		node_instances_buff = 289
		node_statics_buff = 150
		node_sort_buff = 119
		node_misc_buff = 700
		node_2d_buff = 320
		node_particle_buff = 2048
		node_prim_buff = 1024
		node_light_buff = 100
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
		cpu_skinning_buffer_size = 18500
		cpu_skinning_buffer_history = 3
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
		hardware_letterbox = true
		node_instances_buff = 312
		node_statics_buff = 150
		node_sort_buff = 119
		node_misc_buff = 700
		node_2d_buff = 320
		node_particle_buff = 1300
		node_prim_buff = 1024
		node_light_buff = 100
	}
]
memory_startup_params = [
	{
		platform = xenon
		pool_sizes = [
			1500
			2000
			10000
			15000
			3000
			2500
			1500
			512
			128
			768
			256
			512
			256
			1000
			512
			4500
			256
			3000
			64
			1024
			96
			96
			96
			512
			96
			1500
			1000
			512
			64
			128
			64
			256
		]
	}
	{
		platform = ps3
		pool_sizes = [
			1500
			2000
			20000
			15000
			4000
			2500
			2000
			512
			256
			1000
			256
			1500
			256
			5000
			1500
			4500
			256
			3000
			128
			1500
			128
			128
			128
			1024
			1500
			512
			256
			512
			64
			128
			64
			256
		]
	}
]
