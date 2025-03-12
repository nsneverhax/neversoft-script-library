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
show_zone_budget_warnings = 1
show_cas_budget_warnings = 1
no_render_metrics = 0
debugscriptprintf = 0
debugpausedobjects = 0
debugpausedobjectscomponenttocheck = model
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
		printf qs(0x1972291f) x = <x> y = <y> z = <z>
	endif
endscript

script findreferencedscreenelementparams \{param = pos}
	requireparams \{[
			param
		]
		all}
	findreferencedscreenelementparams_recurse array = [] id = root_window param = <param>
	getarraysize <array>
	printf '%s referenced %p(s) found' s = <array_size> p = <param> channel = params
	if NOT (<array_size> = 0)
		<count> = <array_size>
		i = 0
		begin
		if isarray (<array> [<i>].item)
			getarraysize (<array> [<i>].item)
			j = 0
			text = '['
			begin
			formattext textname = text '%a %b' a = <text> b = ((<array> [<i>].item) [<j>]) dontassertforchecksums
			j = (<j> + 1)
			repeat <array_size>
			text = (<text> + ' ]')
		else
			formattext textname = text '%a' a = (<array> [<i>].item) dontassertforchecksums
		endif
		printf ' - %cx %t' c = (<array> [<i>].count) t = <text> channel = params
		i = (<i> + 1)
		repeat <count>
	endif
endscript

script findreferencedscreenelementparams_recurse 
	requireparams \{[
			array
			id
			param
		]
		all}
	if screenelementexists id = <id>
		getscreenelementprops id = <id>
		if gotparam <param>
			getarraysize <array>
			i = 0
			if NOT (<array_size> = 0)
				begin
				if ((<...>.<param>) = (<array> [<i>].item))
					setarrayelement arrayname = array index = <i> newvalue = {item = (<...>.<param>) count = ((<array> [<i>].count) + 1)}
					break
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
			if (<i> = <array_size>)
				addarrayelement array = <array> element = {item = (<...>.<param>) count = 1}
			endif
		endif
		if getscreenelementchildren id = <id>
			getarraysize <children>
			if NOT (<array_size> = 0)
				i = 0
				begin
				findreferencedscreenelementparams_recurse array = <array> id = (<children> [<i>]) param = <param>
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
	return {array = <array>}
endscript
