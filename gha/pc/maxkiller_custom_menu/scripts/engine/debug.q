metric_time = 1
metric_arenausage = 2
metric_totalpolys = 4
metric_polysproc = 8
metric_verts = 16
metric_resourceallocs = 32
metric_textureuploads = 64
metric_vu1 = 128
metric_dma1 = 256
metric_dma2 = 512
metric_vblanks = 1024
metric_drawtime = 2048
metric_ihandlertime = 4096
metric_skycache = 8192
metric_videomode = 16384
metric_vramusage = 32768
metric_memused = 65536
metric_memfree = 131072
metric_regioninfo = 262144
show_warnings = 1
show_zone_budget_warnings = 0
no_render_metrics = 0
debugscriptprintf = 0
debugpausedobjects = 0
debugpausedobjectscomponenttocheck = model
debuggaps = 0
assertwhenglobalschangetype = 0

script controlpadmotion_debug_create 
	if NOT screenelementexists \{id = controlpadmotion_debug}
		createscreenelement \{type = element3d
			parent = root_window
			id = controlpadmotion_debug
			model = 'HUD_arrow/HUD_Arrow.mdl'
			cameraz = -1
			scale = 1.0
			active_viewport = 0
			pos = (120.0, 360.0)}
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
