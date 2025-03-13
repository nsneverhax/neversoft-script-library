
script refreshcurrentzones 
	spawnscriptlater \{reload_zones}
endscript

script reload_zones 
	pauseskaters
	wait \{2
		gameframes}
	setsavezonenametocurrent
	setenablemovies \{1}
	kill_blur
	setpakmancurrentblock \{map = zones
		pak = none}
	refreshpakmansizes \{map = zones}
	scriptcachedeletezerousage
	getsavezonename
	setpakmancurrentblock map = zones pakname = <save_zone>
	if NOT ($view_mode = 1)
		unpauseskaters
	endif
endscript

script displayanimcachestate 
	getdebugfont
	priority_ranges = [
		{range = (0.0, 10.0) bar = cachedrange0}
		{range = (11.0, 50.0) bar = cachedrange1}
		{range = (51.0, 100.0) bar = cachedrange2}
		{range = (101.0, 500.0) bar = cachedrange3}
		{range = (501.0, 1000.0) bar = cachedrange4}
		{range = (1001.0, 10000.0) bar = cachedrange5}
		{range = (10001.0, -1.0) bar = cachedrange6}
	]
	getarraysize \{priority_ranges}
	if objectexists \{id = animcacheanchor}
		killspawnedscript \{name = updateanimcachestate}
		destroyscreenelement \{id = animcacheanchor}
		return
	endif
	if NOT objectexists \{id = animcacheanchor}
		setscreenelementlock \{id = root_window
			off}
		<root_pos> = (<display_offset> + (25.0, 40.0))
		createscreenelement {
			type = containerelement
			parent = root_window
			id = animcacheanchor
			pos = <root_pos>
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = animcacheanchor
			id = pricachedtext
			pos = (0.0, -30.0)
			text = qs(0xaa5c95b0)
			font = <debug_font>
			rgba = [120 120 120 255]
			just = [left top]
		}
		createscreenelement {
			type = textelement
			parent = animcacheanchor
			id = pricachedline
			pos = (0.0, -21.0)
			text = qs(0x69230145)
			font = <debug_font>
			rgba = [120 120 120 255]
			just = [left top]
		}
		<i> = 0
		begin
		<bar_id> = ((<priority_ranges> [<i>]).bar)
		<bar_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		<bar_rgba> = [255 0 0 50]
		setarrayelement arrayname = bar_rgba index = 0 newvalue = (255 - (<i> * 30))
		setarrayelement arrayname = bar_rgba index = 1 newvalue = ((<i> * 30))
		createscreenelement {
			type = spriteelement
			parent = animcacheanchor
			id = <bar_id>
			pos = <bar_pos>
			scale = (50.0, 5.0)
			texture = white
			font = <debug_font>
			rgba = <bar_rgba>
			just = [left top]
		}
		<i> = (<i> + 1)
		repeat <array_size>
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		createscreenelement {
			type = textelement
			parent = animcacheanchor
			id = numcachedtext
			pos = <txt_pos>
			text = qs(0xd73fa683)
			font = <debug_font>
			rgba = [120 0 120 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		createscreenelement {
			type = textelement
			parent = animcacheanchor
			id = hitscachedtext
			pos = <txt_pos>
			text = qs(0x78ee3e94)
			font = <debug_font>
			rgba = [20 255 20 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		createscreenelement {
			type = textelement
			parent = animcacheanchor
			id = missescachedtext
			pos = <txt_pos>
			text = qs(0x45708738)
			font = <debug_font>
			rgba = [255 20 20 255]
			just = [left top]
		}
		setscreenelementlock \{id = root_window
			on}
	endif
	spawnscriptlater updateanimcachestate params = {priority_ranges = <priority_ranges>}
endscript

script updateanimcachestate 
	begin
	if objectexists \{id = animcacheanchor}
		getarraysize <priority_ranges>
		<i> = 0
		begin
		getanimcachestate priority_range = ((<priority_ranges> [<i>]).range)
		<d> = (((<priority_ranges> [<i>]).range).(1.0, 0.0))
		<e> = (((<priority_ranges> [<i>]).range).(0.0, 1.0))
		<bar_id> = ((<priority_ranges> [<i>]).bar)
		<new_scale> = ((1.0, 5.0) + (<priority_count> * (10.0, 0.0)))
		<bar_id> :legacydomorph scale = <new_scale> time = 0.2
		<i> = (<i> + 1)
		repeat <array_size>
		formattext textname = num_cached_text qs(0x9ac505ba) g = <num_cached>
		formattext textname = hits_cached_text qs(0x4e58fa0b) g = <cache_hits>
		formattext textname = misses_cached_text qs(0x4c7da1af) g = <cache_misses>
		setscreenelementprops id = numcachedtext text = <num_cached_text>
		setscreenelementprops id = hitscachedtext text = <hits_cached_text>
		setscreenelementprops id = missescachedtext text = <misses_cached_text>
	endif
	wait \{1
		frame}
	repeat
endscript

script launch_toggle_animcache_state \{display_offset = (0.0, 0.0)}
	displayanimcachestate <...>
endscript

script displayfeelerstats 
	if objectexists \{id = feelerstatsanchor}
		killspawnedscript \{name = updatefeelerstats}
		destroyscreenelement \{id = feelerstatsanchor}
		return
	endif
	getdebugfont
	if NOT objectexists \{id = feelerstatsanchor}
		setscreenelementlock \{id = root_window
			off}
		<root_pos> = (<display_offset> + (25.0, 40.0))
		createscreenelement {
			type = containerelement
			parent = root_window
			id = feelerstatsanchor
			pos = <root_pos>
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = feelerstatsanchor
			id = pricachedtext
			pos = (0.0, -30.0)
			text = qs(0xf466d819)
			font = <debug_font>
			rgba = [120 120 120 255]
			just = [left top]
		}
		createscreenelement {
			type = textelement
			parent = feelerstatsanchor
			id = pricachedline
			pos = (0.0, -21.0)
			text = qs(0x69230145)
			font = <debug_font>
			rgba = [120 120 120 255]
			just = [left top]
		}
		<i> = 1
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		createscreenelement {
			type = textelement
			parent = feelerstatsanchor
			id = numfeelerstext
			pos = <txt_pos>
			text = qs(0xdfcae890)
			font = <debug_font>
			rgba = [120 0 120 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		createscreenelement {
			type = textelement
			parent = feelerstatsanchor
			id = numfeelerstimetext
			pos = <txt_pos>
			text = qs(0x0dd4173d)
			font = <debug_font>
			rgba = [120 0 120 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		createscreenelement {
			type = textelement
			parent = feelerstatsanchor
			id = hitscachedtext
			pos = <txt_pos>
			text = qs(0x8a7034bb)
			font = <debug_font>
			rgba = [20 255 20 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		createscreenelement {
			type = textelement
			parent = feelerstatsanchor
			id = hitscachedtimetext
			pos = <txt_pos>
			text = qs(0x0dd4173d)
			font = <debug_font>
			rgba = [20 255 20 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		createscreenelement {
			type = textelement
			parent = feelerstatsanchor
			id = uncachedtext
			pos = <txt_pos>
			text = qs(0x450e2759)
			font = <debug_font>
			rgba = [255 20 20 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		createscreenelement {
			type = textelement
			parent = feelerstatsanchor
			id = uncachedtimetext
			pos = <txt_pos>
			text = qs(0x0dd4173d)
			font = <debug_font>
			rgba = [255 20 20 255]
			just = [left top]
		}
		setscreenelementlock \{id = root_window
			on}
	endif
	spawnscriptlater \{updatefeelerstats}
endscript

script updatefeelerstats 
	<max_cast_feelers> = 0
	<min_cast_feelers> = 1000
	<max_cached_feelers> = 0
	<min_cached_feelers> = 1000
	<max_uncached_feelers> = 0
	<min_uncached_feelers> = 1000
	<max_cast_time> = 0.0
	<min_cast_time> = 1000.0
	<max_cached_time> = 0.0
	<min_cached_time> = 1000.0
	<max_uncached_time> = 0.0
	<min_uncached_time> = 1000.0
	begin
	if objectexists \{id = feelerstatsanchor}
		getcurrentfeelerstats
		<cur_total_feelers> = (<num_cached_checks> + <num_uncached_checks>)
		<cur_total_time> = (<cached_time> + <uncached_time>)
		if (<cur_total_feelers> < <min_cast_feelers>)
			<min_cast_feelers> = <cur_total_feelers>
		endif
		if (<cur_total_feelers> > <max_cast_feelers>)
			<max_cast_feelers> = <cur_total_feelers>
		endif
		if (<num_cached_checks> < <min_cached_feelers>)
			<min_cached_feelers> = <num_cached_checks>
		endif
		if (<num_cached_checks> > <max_cached_feelers>)
			<max_cached_feelers> = <num_cached_checks>
		endif
		if (<num_uncached_checks> < <min_uncached_feelers>)
			<min_uncached_feelers> = <num_uncached_checks>
		endif
		if (<num_uncached_checks> > <max_uncached_feelers>)
			<max_uncached_feelers> = <num_uncached_checks>
		endif
		if (<cur_total_time> < <min_cast_time>)
			<min_cast_time> = <cur_total_time>
		endif
		if (<cur_total_time> > <max_cast_time>)
			<max_cast_time> = <cur_total_time>
		endif
		if (<cached_time> < <min_cached_time>)
			<min_cached_time> = <cached_time>
		endif
		if (<cached_time> > <max_cached_time>)
			<max_cached_time> = <cached_time>
		endif
		if (<uncached_time> < <min_uncached_time>)
			<min_uncached_time> = <uncached_time>
		endif
		if (<uncached_time> > <max_uncached_time>)
			<max_uncached_time> = <uncached_time>
		endif
		formattext textname = num_cached_text qs(0xe5d06135) g = <cur_total_feelers> n = <min_cast_feelers> m = <max_cast_feelers>
		formattext textname = num_cached_time_text qs(0x0c07be32) g = <cur_total_time> n = <min_cast_time> m = <max_cast_time>
		formattext textname = hits_cached_text qs(0x3202aa23) g = <num_cached_checks> n = <min_cached_feelers> m = <max_cached_feelers>
		formattext textname = hits_cached_time_text qs(0x0c07be32) g = <cached_time> n = <min_cached_time> m = <max_cached_time>
		formattext textname = misses_cached_text qs(0x6328b18e) g = <num_uncached_checks> n = <min_uncached_feelers> m = <max_uncached_feelers>
		formattext textname = misses_cached_time_text qs(0x0c07be32) g = <uncached_time> n = <min_uncached_time> m = <max_uncached_time>
		setscreenelementprops id = numfeelerstext text = <num_cached_text>
		setscreenelementprops id = hitscachedtext text = <hits_cached_text>
		setscreenelementprops id = uncachedtext text = <misses_cached_text>
		setscreenelementprops id = numfeelerstimetext text = <num_cached_time_text>
		setscreenelementprops id = hitscachedtimetext text = <hits_cached_time_text>
		setscreenelementprops id = uncachedtimetext text = <misses_cached_time_text>
	endif
	wait \{1
		frame}
	repeat
endscript

script launch_toggle_feeler_stats \{display_offset = (0.0, 0.0)}
	displayfeelerstats <...>
endscript

script generateacceptablestring 
	return acceptablestring = Random (
		@ qs(0x13b91f1a)
		@ qs(0xdf31e1d7)
		@ qs(0xc1ad6826)
		@ qs(0x4756bb70)
		@ qs(0x4a02d6ad)
		@ qs(0x5fb37b67)
		@ qs(0x9eb25c55)
		@ qs(0xa7069471)
		@ qs(0x4a6edd5c)
		@ qs(0xd10c758a)
		@ qs(0x218481c6)
		)
endscript
