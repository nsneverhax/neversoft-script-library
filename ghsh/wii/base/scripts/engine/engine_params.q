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
		Platform = gamecube
		target_ntsc_framerate = 60
		gpu_vsync_time_interval = 8
		pool_text_instances = 570
		num_sound_instances = 512
		num_stream_resources = 6
		max_sound_entries = 1536
		max_sound_busses = 256
		max_sound_effects = 64
		sound_memory_size = 26214400
		super_sector_target_max_dim = 1000.0
		super_sector_max_row_and_col = 40
		max_cscript_instances_per_script = 390
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
		Platform = gamecube
		pool_sizes = [
			1500
			1500
			2500
			17500
			2000
			500
			3000
			1500
			500
			1750
			500
			600
			300
			300
			300
			3000
			240
			1200
			550
			2000
			120
			200
			1750
			750
			100
			100
			75
			250
			60
			300
			150
			170
		]
	}
]
