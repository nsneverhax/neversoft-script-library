show_warnings = 1
show_zone_budget_warnings = 0
no_render_metrics = 0
max_game_loop_time_xenon = 22222
max_game_loop_time_ps3 = 30000
framerate_warning_box_x = 100.0
framerate_warning_box_y = 300.0
framerate_warning_box_ref_width = 30.0
debugscriptprintf = 0
debugpausedobjects = 0
debugpausedobjectscomponenttocheck = model
debuggaps = 0
draw_uberfrig_lines = 0
crouch_use_aggro_speed = false

script controlpadmotion_debug_create 
	if NOT screenelementexists \{id = controlpadmotion_debug}
		createscreenelement \{type = element3d
			parent = root_window
			id = controlpadmotion_debug
			model = 'GameObjects/HUD_arrow_alpha/HUD_arrow_alpha.mdl'
			cameraz = -1
			scale = 1.0
			active_viewport = 0
			pos = (950.0, 120.0)}
	endif
endscript

script controlpadmotion_debug_kill 
	if screenelementexists \{id = controlpadmotion_debug}
		destroyscreenelement \{id = controlpadmotion_debug}
	endif
endscript

script printvec 
	if gotparam \{vec}
		getvectorcomponents <vec>
		printf "(%x, %y, %z)" x = <x> y = <y> z = <z>
	endif
endscript

script FindGeoSeams divisions = 500 max_count = 2000 radius = 0.5
	printf "started FindGeoSeams divisions=%d max_count=%m radius=%r" d = <divisions> m = <max_count> r = <radius>
	x = 0
	frame_count = 0
	misses = 0
	begin
	z = 0
	begin
	if NOT GeoSeamTest {x = <x> z = <z> divisions = <divisions> radius = <radius>}
		misses = (<misses> + 1)
	endif
	z = (<z> + 1)
	frame_count = (<frame_count> + 1)
	if (<frame_count> = <max_count>)
		frame_count = 0
		wait 1 gameframe
	endif
	repeat <divisions>
	x = (<x> + 1)
	repeat <divisions>
	printf "finished FindGeoSeams misses=%f" f = <misses>
endscript

script toggle_crouch_use_aggro_speed_from_menu 
	toggle_crouch_use_aggro_speed
	create_debug_options_menu
endscript

script toggle_crouch_use_aggro_speed 
	if ($crouch_use_aggro_speed = true)
		change \{crouch_use_aggro_speed = false}
	else
		change \{crouch_use_aggro_speed = true}
	endif
endscript
