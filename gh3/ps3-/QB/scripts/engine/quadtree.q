useoldsort = 0
quadtreedebug = 0
datanodedebug = 0
occlusiondebug = 0
cullingdebug = 0
frustumdebugtype = 3
lockfrustums = 0
renderinstances = 1
rendergeoms = 1
renderZoneMode = 1
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
	if ($renderZoneMode = 1)
		Change \{renderZoneMode = 2}
	else
		Change \{renderZoneMode = 1}
	endif
endscript

script toggle_draworder_view 
	if ($draworderview = 0)
		Change \{draworderview = 1}
		setshaderoverride \{shader = '_OverrideConstantColor'
			Type = 1
			uvremap = 0
			samplerremap = 0}
	else
		Change \{draworderview = 0}
		setshaderoverride \{shader = 'disable'
			Type = 0
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
		Change \{renderquadtreedensity = 1}
		Change \{renderscreenfx = 0}
		Change \{rendergeoms = 0}
		Change \{renderinstances = 0}
	else
		Change \{renderquadtreedensity = 0}
		Change \{renderscreenfx = 1}
		Change \{rendergeoms = 1}
		Change \{renderinstances = 1}
	endif
endscript

script toggle_rendermetrics 
	if ($rendermetrics = 0)
		Change \{rendermetrics = 1}
	else
		Change \{rendermetrics = 0}
	endif
endscript

script toggle_per_zone_rendermetrics 
	if ($rendermetrics = 0)
		Change \{rendermetrics = 2}
	else
		Change \{rendermetrics = 0}
	endif
endscript

script toggle_aabb_test 
	if ($aabb_test = 0)
		Change \{aabb_test = 1}
	else
		Change \{aabb_test = 0}
	endif
endscript

script toggle_sky_sector 
	if ($norender_overridechecksum = 0)
		Change \{norender_overridechecksum = -899986957}
	else
		Change \{norender_overridechecksum = 0}
	endif
endscript

script render_2d_toggle 
	if ($render2d = 0)
		Change \{render2d = 1}
	else
		Change \{render2d = 0}
	endif
endscript

script render_screenfx_toggle 
	if ($renderscreenfx = 0)
		Change \{renderscreenfx = 1}
	else
		Change \{renderscreenfx = 0}
	endif
endscript

script render_particles_toggle 
	if ($renderparticles = 0)
		Change \{renderparticles = 1}
	else
		Change \{renderparticles = 0}
	endif
endscript

script render_prims3d_toggle 
	if ($renderprims3d = 0)
		Change \{renderprims3d = 1}
	else
		Change \{renderprims3d = 0}
	endif
endscript

script render_prims_toggle 
	if ($renderprims = 0)
		Change \{renderprims = 1}
	else
		Change \{renderprims = 0}
	endif
endscript

script render_skins_toggle 
	if ($renderskins = 0)
		Change \{renderskins = 1}
	else
		Change \{renderskins = 0}
	endif
endscript

script render_geoms_toggle 
	if ($rendergeoms = 0)
		Change \{rendergeoms = 1}
	else
		Change \{rendergeoms = 0}
	endif
endscript

script render_instances_toggle 
	if ($renderinstances = 0)
		Change \{renderinstances = 1}
	else
		Change \{renderinstances = 0}
	endif
endscript

script show_instances_only_toggle 
	if ($showinstancesonly = 0)
		Change \{rendergeoms = 0}
		Change \{renderinstances = 1}
		Change \{quadtreedebug = 1}
		Change \{lockfrustums = 1}
		Change \{showinstancesonly = 1}
	else
		Change \{rendergeoms = 1}
		Change \{renderinstances = 1}
		Change \{quadtreedebug = 0}
		Change \{lockfrustums = 0}
		Change \{showinstancesonly = 0}
	endif
endscript

script lock_frustums_toggle 
	if ($lockfrustums = 0)
		Change \{lockfrustums = 1}
		Change \{quadtreedebug = 1}
	else
		Change \{lockfrustums = 0}
		Change \{quadtreedebug = 0}
	endif
endscript

script occluder_toggle_basic_debug 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 1}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_advanced_debug 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 2}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_passed_only 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 4}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_passed_numbers 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 20}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_all_numbers 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 17}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 8}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded_and_occluders 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 12}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded_and_occluders_context 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 32}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded_and_occluders_context_numbers 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 48}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script occluder_toggle_show_occluded_and_occluders_advanced 
	if ($occlusiondebug = 0)
		Change \{occlusiondebug = 32}
	else
		Change \{occlusiondebug = 0}
	endif
endscript

script quadtree_debug_toggle 
	if NOT ($quadtreedebug = 1)
		Change \{quadtreedebug = 1}
	else
		Change \{quadtreedebug = 0}
	endif
endscript
