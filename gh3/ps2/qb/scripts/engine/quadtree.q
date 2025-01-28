useoldsort = 0
quadtreedebug = 0
datanodedebug = 0
occlusiondebug = 0
cullingdebug = 0
frustumdebugtype = 3
lockfrustums = 0
renderinstances = 1
rendergeoms = 1
renderzonemode = 1
showinstancesonly = 0
renderprims = 1
renderprims3d = 1
render2d = 1
renderskins = 1
renderparticles = 1
renderscreenfx = 1
rendermetrics = 0
renderquadtreedensity = 0
quadtreedensity_alpha_inc = 1
norender_overridechecksum = 0
onlyrender_overridechecksum = 0
onlyrender_meshid = -1
max_occluders = 16
spamifdataoutofbounds = 0
vsync_interval_perc = 8
draworderview = 0
tempcamerafarplane = 400
quaddbg_2 = 0

script toggle_one_zone_only 
	if ($renderzonemode = 1)
		change \{renderzonemode = 2}
	else
		change \{renderzonemode = 1}
	endif
endscript

script toggle_draworder_view 
	if ($draworderview = 0)
		change \{draworderview = 1}
		setshaderoverride \{shader = '_OverrideConstantColor'
			type = 1
			uvremap = 0
			samplerremap = 0}
	else
		change \{draworderview = 0}
		setshaderoverride \{shader = 'disable'
			type = 0
			uvremap = 0
			samplerremap = 0}
	endif
endscript

script inc_density 
	quadtreedensity_alpha_inc = quadtreedensity_alpha_inc + 1
endscript

script dec_density 
	if ($quadtreedensity_alpha_inc > 0)
		quadtreedensity_alpha_inc = quadtreedensity_alpha_inc - 1
	endif
endscript

script toggle_density 
	if ($renderquadtreedensity = 0)
		change \{renderquadtreedensity = 1}
		change \{renderscreenfx = 0}
		change \{rendergeoms = 0}
		change \{renderinstances = 0}
	else
		change \{renderquadtreedensity = 0}
		change \{renderscreenfx = 1}
		change \{rendergeoms = 1}
		change \{renderinstances = 1}
	endif
endscript

script toggle_rendermetrics 
	if ($rendermetrics = 0)
		change \{rendermetrics = 1}
	else
		change \{rendermetrics = 0}
	endif
endscript

script toggle_per_zone_rendermetrics 
	if ($rendermetrics = 0)
		change \{rendermetrics = 2}
	else
		change \{rendermetrics = 0}
	endif
endscript

script toggle_aabb_test 
	if ($aabb_test = 0)
		change \{aabb_test = 1}
	else
		change \{aabb_test = 0}
	endif
endscript

script toggle_sky_sector 
	if ($norender_overridechecksum = 0)
		change \{norender_overridechecksum = -899986957}
	else
		change \{norender_overridechecksum = 0}
	endif
endscript

script render_2d_toggle 
	if ($render2d = 0)
		change \{render2d = 1}
	else
		change \{render2d = 0}
	endif
endscript

script render_screenfx_toggle 
	if ($renderscreenfx = 0)
		change \{renderscreenfx = 1}
	else
		change \{renderscreenfx = 0}
	endif
endscript

script render_particles_toggle 
	if ($renderparticles = 0)
		change \{renderparticles = 1}
	else
		change \{renderparticles = 0}
	endif
endscript

script render_prims3d_toggle 
	if ($renderprims3d = 0)
		change \{renderprims3d = 1}
	else
		change \{renderprims3d = 0}
	endif
endscript

script render_prims_toggle 
	if ($renderprims = 0)
		change \{renderprims = 1}
	else
		change \{renderprims = 0}
	endif
endscript

script render_skins_toggle 
	if ($renderskins = 0)
		change \{renderskins = 1}
	else
		change \{renderskins = 0}
	endif
endscript

script render_geoms_toggle 
	if ($rendergeoms = 0)
		change \{rendergeoms = 1}
	else
		change \{rendergeoms = 0}
	endif
endscript

script render_instances_toggle 
	if ($renderinstances = 0)
		change \{renderinstances = 1}
	else
		change \{renderinstances = 0}
	endif
endscript

script show_instances_only_toggle 
	if ($showinstancesonly = 0)
		change \{rendergeoms = 0}
		change \{renderinstances = 1}
		change \{quadtreedebug = 1}
		change \{lockfrustums = 1}
		change \{showinstancesonly = 1}
	else
		change \{rendergeoms = 1}
		change \{renderinstances = 1}
		change \{quadtreedebug = 0}
		change \{lockfrustums = 0}
		change \{showinstancesonly = 0}
	endif
endscript

script lock_frustums_toggle 
	if ($lockfrustums = 0)
		change \{lockfrustums = 1}
		change \{quadtreedebug = 1}
	else
		change \{lockfrustums = 0}
		change \{quadtreedebug = 0}
	endif
endscript

script occluder_toggle_basic_debug 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 1}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_advanced_debug 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 2}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_passed_only 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 4}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_passed_numbers 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 20}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_all_numbers 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 17}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 8}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded_and_occluders 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 12}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded_and_occluders_context 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 32}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded_and_occluders_context_numbers 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 48}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded_and_occluders_advanced 
	if ($occlusiondebug = 0)
		change \{occlusiondebug = 32}
	else
		change \{occlusiondebug = 0}
	endif
endscript

script quadtree_debug_toggle 
	if NOT ($quadtreedebug = 1)
		change \{quadtreedebug = 1}
	else
		change \{quadtreedebug = 0}
	endif
endscript
