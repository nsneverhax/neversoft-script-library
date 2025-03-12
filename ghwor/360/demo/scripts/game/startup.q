use_defined_zone_sizes = 0
load_zone_address = 1
render_lock_framerate = 1
game_lock_framerate = 1
display_framerate_box = 1
framerate_value = 0.0
show_filenames = 0
output_tracking_lines = 0
entered_from_autolaunch = 0
dontspoofadaptor = 1
num_rigidbody_destructors_per_frame = 20
num_rigidbody_destructors_per_frame_us = 0
has_accepted_dnas = 0
threaded_animation = 1
viewer_buttons_enabled = 1
wireframe_skins = 0
showpolys_onquickview = 1
particle_options_debug = {
	show_particle_heap = 0
	particle_warning_script = flexparticlewarning
}
assertonmissinganims = 0
railnode_assets_enabled = 1
railnode_assets_veh_enabled = 1
navmeshpolys = 2000
navmeshradius = 4000
navmeshalpha = 64
profile_font_scale = 0.5
profile_time_font_scale = 0.4
profile_time_offset = -35
use_custom_proxim_code = 1
enable_playlist = 1
lightcachepool = 5000

script set_outline_shader_to_default 
	setoutlineshadercolor \{red = 210
		green = 80
		blue = 0
		alpha = 180}
	setoutlineshaderparams \{min = 0.01
		max = 0.06
		rate = 1.0
		zscale = 0.001
		filldist = 17
		blendmode = 0}
endscript
