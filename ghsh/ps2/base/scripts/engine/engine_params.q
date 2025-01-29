control_pelvis_offset_assert = 0
control_pelvis_max_offset = 2.5
control_pelvis_render_offset = 0

script ToggleControlPelvisRender 
	if ($control_pelvis_render_offset = 0)
		Change \{control_pelvis_render_offset = 1}
	else
		Change \{control_pelvis_render_offset = 0}
	endif
endscript
qspakmarginforotherlanguages = 100
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
memory_startup_params = [
	{
		Platform = PS2
		pool_sizes = [
			900
			775
			4100
			13300
			1925
			1175
			5075
			170
			715
			140
			145
			480
			560
			750
			550
			650
			240
			3200
			160
			1225
			32
			36
			24
			92
			24
			20
			24
			70
			82
			55
			16
			174
		]
	}
]
