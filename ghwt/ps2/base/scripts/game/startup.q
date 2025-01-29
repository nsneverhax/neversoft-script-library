use_defined_zone_sizes = 0
load_zone_address = 1
render_lock_framerate = 1
game_lock_framerate = 1
display_framerate_box = 1
framerate_value = 0.0
show_filenames = 0
output_tracking_lines = 0
entered_from_autolaunch = 0
DontSpoofAdaptor = 1
num_rigidbody_destructors_per_frame = 20
num_rigidbody_destructors_per_frame_us = 0
has_accepted_dnas = 0
fragmentation_bottomup_warning = 1024
fragmentation_bottomup_assert = 16384
fragmentation_topdown_warning = 0
fragmentation_topdown_assert = 16384
memoryleak_havok_warning = 65536
memoryleak_havok_assert = 131072
threaded_animation = 1
viewer_buttons_enabled = 1
wireframe_skins = 0
SHOWPOLYS_ONQUICKVIEW = 1
particle_heap_size = 0
particle_options_DEBUG = {
	show_particle_heap = 0
	particle_warning_script = FlexParticleWarning
}
AssertOnMissingAnims = 0
RAILNODE_ASSETS_ENABLED = 1
RAILNODE_ASSETS_VEH_ENABLED = 1
navmeshpolys = 2000
navmeshradius = 4000
navmeshalpha = 64
profile_font_scale = 0.5
profile_time_font_scale = 0.4
profile_time_offset = -35
use_custom_proxim_code = 1
enable_playlist = 1
LightCachePool = 5000
All_Levels_Unlocked = 1

script network_driver_startup 

	NetSessionFunc \{func = write_dnas_binary}


	if loadnetworkdrivers \{viewer_ip = $viewer_ip
			viewer_subnet = $viewer_subnet
			viewer_gateway = $viewer_gateway}

	else

	endif

endscript

script Set_Outline_Shader_to_Default 
	SetOutlineShaderColor \{red = 210
		green = 80
		blue = 0
		alpha = 180}
	SetOutlineShaderParams \{min = 0.01
		Max = 0.06
		rate = 1.0
		zscale = 0.001
		filldist = 17
		BlendMode = 0}
endscript
