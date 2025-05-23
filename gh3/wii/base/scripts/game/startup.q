use_defined_zone_sizes = 0
load_zone_address = 1
render_lock_framerate = 1
game_lock_framerate = 1
display_framerate_box = 1
framerate_value = 0.0
0x47465378 = 0.0
show_filenames = 0
output_tracking_lines = 0
rail_arrows = 0
show_all_trick_objects = 0
entered_from_autolaunch = 0
dontspoofadaptor = 1
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
enable_view_goals_select_shortcut = 0
wireframe_skins = 0
demo_build = 0
gameinformerbuild = 0
auto_change_chapter_and_stage = 0
showpolys_onquickview = 1
particle_heap_size = 229376
particle_options_debug = {
	show_particle_heap = 0
	particle_warning_script = flexparticlewarning
}
assertonmissinganims = 0
railnode_assets_enabled = 1
railnode_assets_veh_enabled = 1
clear_abilities = 0
collectors_edition_fake_debug = collectors
navmeshpolys = 2000
navmeshradius = 4000
navmeshalpha = 64
profile_font_scale = 0.5
profile_time_font_scale = 0.4
profile_time_offset = -35
spam_bail_matrices = 0
use_custom_proxim_code = 1
enable_playlist = 1
lightcachepool = 9500
all_levels_unlocked = 1
useleveloverridestats = 0

script network_driver_startup 

	netsessionfunc \{func = write_dnas_binary}


	if loadnetworkdrivers \{viewer_ip = $viewer_ip
			viewer_subnet = $viewer_subnet
			viewer_gateway = $viewer_gateway}

	else

	endif

endscript

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
