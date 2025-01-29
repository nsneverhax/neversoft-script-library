
script call_script 
	RequireParams \{[
			struct
		]
		all}
	0x0c9b7b42 struct = <struct>
	if <checksum> <params>
		0x15a6d96f = true
	else
		0x15a6d96f = FALSE
	endif
	return <0x15a6d96f> <...>
endscript

script 0xd8c4019c \{call = {
			nullscript
		}}
	RequireParams \{[
			condition
			call
		]
		all}
	begin
	if call_script struct = <condition>
		call_script struct = <call>
		if NOT GotParam \{continue}
			return
		endif
	endif
	WaitOneGameFrame
	repeat
endscript

script 0xaea6ae61 
	RequireParams \{[
			struct
		]
		all}
	if call_script struct = <struct>
		return FALSE <...>
	else
		return true <...>
	endif
endscript

script 0x28471746 
	RequireParams \{[
			Name
		]
		all}
	begin
	if NOT ScriptIsRunning <Name>
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script RefreshCurrentZones 
	SpawnScriptLater \{reload_zones}
endscript

script reload_zones 
	pauseskaters
	StopMusic
	StopAudioStreams
	Wait \{2
		gameframes}
	SetSaveZoneNameToCurrent
	SetEnableMovies \{1}
	kill_blur
	SetPakManCurrentBlock \{map = zones
		pak = None}
	RefreshPakManSizes \{map = zones}
	ScriptCacheDeleteZeroUsage
	GetSaveZoneName
	SetPakManCurrentBlock map = zones pakname = <save_zone>
	if NOT ($view_mode = 1)
		unpauseskaters
	endif
endscript

script DisplayAnimCacheState 
	getdebugfont
	priority_ranges = [
		{Range = (0.0, 10.0) bar = CachedRange0}
		{Range = (11.0, 50.0) bar = CachedRange1}
		{Range = (51.0, 100.0) bar = CachedRange2}
		{Range = (101.0, 500.0) bar = CachedRange3}
		{Range = (501.0, 1000.0) bar = CachedRange4}
		{Range = (1001.0, 10000.0) bar = CachedRange5}
		{Range = (10001.0, -1.0) bar = CachedRange6}
	]
	GetArraySize \{priority_ranges}
	if ObjectExists \{id = AnimCacheAnchor}
		KillSpawnedScript \{Name = UpdateAnimCacheState}
		DestroyScreenElement \{id = AnimCacheAnchor}
		return
	endif
	if NOT ObjectExists \{id = AnimCacheAnchor}
		SetScreenElementLock \{id = root_window
			OFF}
		<root_pos> = (<display_offset> + (25.0, 40.0))
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = AnimCacheAnchor
			Pos = <root_pos>
			just = [center center]
			internal_just = [left center]
		}
		CreateScreenElement {
			Type = TextElement
			parent = AnimCacheAnchor
			id = PriCachedText
			Pos = (0.0, -30.0)
			text = qs(0xaa5c95b0)
			font = <debug_font>
			rgba = [120 120 120 255]
			just = [left top]
		}
		CreateScreenElement {
			Type = TextElement
			parent = AnimCacheAnchor
			id = PriCachedLine
			Pos = (0.0, -21.0)
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
		SetArrayElement ArrayName = bar_rgba index = 0 NewValue = (255 - (<i> * 30))
		SetArrayElement ArrayName = bar_rgba index = 1 NewValue = ((<i> * 30))
		CreateScreenElement {
			Type = SpriteElement
			parent = AnimCacheAnchor
			id = <bar_id>
			Pos = <bar_pos>
			Scale = (50.0, 5.0)
			texture = white
			font = <debug_font>
			rgba = <bar_rgba>
			just = [left top]
		}
		<i> = (<i> + 1)
		repeat <array_Size>
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			parent = AnimCacheAnchor
			id = NumCachedText
			Pos = <txt_pos>
			text = qs(0xd73fa683)
			font = <debug_font>
			rgba = [120 0 120 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			parent = AnimCacheAnchor
			id = HitsCachedText
			Pos = <txt_pos>
			text = qs(0x78ee3e94)
			font = <debug_font>
			rgba = [20 255 20 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			parent = AnimCacheAnchor
			id = MissesCachedText
			Pos = <txt_pos>
			text = qs(0x45708738)
			font = <debug_font>
			rgba = [255 20 20 255]
			just = [left top]
		}
		SetScreenElementLock \{id = root_window
			On}
	endif
	SpawnScriptLater UpdateAnimCacheState params = {priority_ranges = <priority_ranges>}
endscript

script UpdateAnimCacheState 
	begin
	if ObjectExists \{id = AnimCacheAnchor}
		GetArraySize <priority_ranges>
		<i> = 0
		begin
		GetAnimCacheState priority_range = ((<priority_ranges> [<i>]).Range)
		<d> = (((<priority_ranges> [<i>]).Range).(1.0, 0.0))
		<e> = (((<priority_ranges> [<i>]).Range).(0.0, 1.0))
		<bar_id> = ((<priority_ranges> [<i>]).bar)
		<new_scale> = ((1.0, 5.0) + (<priority_count> * (10.0, 0.0)))
		<bar_id> :legacydomorph Scale = <new_scale> time = 0.2
		<i> = (<i> + 1)
		repeat <array_Size>
		formatText TextName = num_cached_text qs(0x9ac505ba) g = <num_cached>
		formatText TextName = hits_cached_text qs(0x4e58fa0b) g = <cache_hits>
		formatText TextName = misses_cached_text qs(0x4c7da1af) g = <cache_misses>
		SetScreenElementProps id = NumCachedText text = <num_cached_text>
		SetScreenElementProps id = HitsCachedText text = <hits_cached_text>
		SetScreenElementProps id = MissesCachedText text = <misses_cached_text>
	endif
	Wait \{1
		Frame}
	repeat
endscript

script launch_toggle_animcache_state \{display_offset = (0.0, 0.0)}
	DisplayAnimCacheState <...>
endscript

script DisplayFeelerStats 
	if ObjectExists \{id = FeelerStatsAnchor}
		KillSpawnedScript \{Name = UpdateFeelerStats}
		DestroyScreenElement \{id = FeelerStatsAnchor}
		return
	endif
	getdebugfont
	if NOT ObjectExists \{id = FeelerStatsAnchor}
		SetScreenElementLock \{id = root_window
			OFF}
		<root_pos> = (<display_offset> + (25.0, 40.0))
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = FeelerStatsAnchor
			Pos = <root_pos>
			just = [center center]
			internal_just = [left center]
		}
		CreateScreenElement {
			Type = TextElement
			parent = FeelerStatsAnchor
			id = PriCachedText
			Pos = (0.0, -30.0)
			text = qs(0xf466d819)
			font = <debug_font>
			rgba = [120 120 120 255]
			just = [left top]
		}
		CreateScreenElement {
			Type = TextElement
			parent = FeelerStatsAnchor
			id = PriCachedLine
			Pos = (0.0, -21.0)
			text = qs(0x69230145)
			font = <debug_font>
			rgba = [120 120 120 255]
			just = [left top]
		}
		<i> = 1
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			parent = FeelerStatsAnchor
			id = NumFeelersText
			Pos = <txt_pos>
			text = qs(0xdfcae890)
			font = <debug_font>
			rgba = [120 0 120 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			parent = FeelerStatsAnchor
			id = NumFeelersTimeText
			Pos = <txt_pos>
			text = qs(0x0dd4173d)
			font = <debug_font>
			rgba = [120 0 120 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			parent = FeelerStatsAnchor
			id = HitsCachedText
			Pos = <txt_pos>
			text = qs(0x8a7034bb)
			font = <debug_font>
			rgba = [20 255 20 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			parent = FeelerStatsAnchor
			id = HitsCachedTimeText
			Pos = <txt_pos>
			text = qs(0x0dd4173d)
			font = <debug_font>
			rgba = [20 255 20 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			parent = FeelerStatsAnchor
			id = UnCachedText
			Pos = <txt_pos>
			text = qs(0x450e2759)
			font = <debug_font>
			rgba = [255 20 20 255]
			just = [left top]
		}
		<i> = (<i> + 1)
		<txt_pos> = ((0.0, 0.0) + (<i> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			parent = FeelerStatsAnchor
			id = UnCachedTimeText
			Pos = <txt_pos>
			text = qs(0x0dd4173d)
			font = <debug_font>
			rgba = [255 20 20 255]
			just = [left top]
		}
		SetScreenElementLock \{id = root_window
			On}
	endif
	SpawnScriptLater \{UpdateFeelerStats}
endscript

script UpdateFeelerStats 
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
	if ObjectExists \{id = FeelerStatsAnchor}
		GetCurrentFeelerStats
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
		formatText TextName = num_cached_text qs(0xe5d06135) g = <cur_total_feelers> n = <min_cast_feelers> m = <max_cast_feelers>
		formatText TextName = num_cached_time_text qs(0x0c07be32) g = <cur_total_time> n = <min_cast_time> m = <max_cast_time>
		formatText TextName = hits_cached_text qs(0x3202aa23) g = <num_cached_checks> n = <min_cached_feelers> m = <max_cached_feelers>
		formatText TextName = hits_cached_time_text qs(0x0c07be32) g = <cached_time> n = <min_cached_time> m = <max_cached_time>
		formatText TextName = misses_cached_text qs(0x6328b18e) g = <num_uncached_checks> n = <min_uncached_feelers> m = <max_uncached_feelers>
		formatText TextName = misses_cached_time_text qs(0x0c07be32) g = <uncached_time> n = <min_uncached_time> m = <max_uncached_time>
		SetScreenElementProps id = NumFeelersText text = <num_cached_text>
		SetScreenElementProps id = HitsCachedText text = <hits_cached_text>
		SetScreenElementProps id = UnCachedText text = <misses_cached_text>
		SetScreenElementProps id = NumFeelersTimeText text = <num_cached_time_text>
		SetScreenElementProps id = HitsCachedTimeText text = <hits_cached_time_text>
		SetScreenElementProps id = UnCachedTimeText text = <misses_cached_time_text>
	endif
	Wait \{1
		Frame}
	repeat
endscript

script launch_toggle_feeler_stats \{display_offset = (0.0, 0.0)}
	DisplayFeelerStats <...>
endscript
