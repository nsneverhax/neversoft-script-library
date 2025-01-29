
script RefreshCurrentZones 
	spawnscriptlater \{reload_zones}
endscript

script reload_zones 
	pauseskaters
	wait \{2
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

script DisplayFeelerStats 
	if ObjectExists \{id = FeelerStatsAnchor}
		killspawnedscript \{name = UpdateFeelerStats}
		DestroyScreenElement \{id = FeelerStatsAnchor}
		return
	endif
	GetDebugFont
	if NOT ObjectExists \{id = FeelerStatsAnchor}
		SetScreenElementLock \{id = root_window
			off}
		<root_pos> = (<display_offset> + (25.0, 40.0))
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = FeelerStatsAnchor
			Pos = <root_pos>
			just = [center center]
			internal_just = [left center]
		}
		CreateScreenElement {
			type = TextElement
			parent = FeelerStatsAnchor
			id = PriCachedText
			Pos = (0.0, -30.0)
			text = qs(0xf466d819)
			font = <debug_font>
			rgba = [120 120 120 255]
			just = [left top]
		}
		CreateScreenElement {
			type = TextElement
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
			type = TextElement
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
			type = TextElement
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
			type = TextElement
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
			type = TextElement
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
			type = TextElement
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
			type = TextElement
			parent = FeelerStatsAnchor
			id = UnCachedTimeText
			Pos = <txt_pos>
			text = qs(0x0dd4173d)
			font = <debug_font>
			rgba = [255 20 20 255]
			just = [left top]
		}
		SetScreenElementLock \{id = root_window
			on}
	endif
	spawnscriptlater \{UpdateFeelerStats}
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
		FormatText TextName = num_cached_text qs(0xe5d06135) g = <cur_total_feelers> n = <min_cast_feelers> m = <max_cast_feelers>
		FormatText TextName = num_cached_time_text qs(0x0c07be32) g = <cur_total_time> n = <min_cast_time> m = <max_cast_time>
		FormatText TextName = hits_cached_text qs(0x3202aa23) g = <num_cached_checks> n = <min_cached_feelers> m = <max_cached_feelers>
		FormatText TextName = hits_cached_time_text qs(0x0c07be32) g = <cached_time> n = <min_cached_time> m = <max_cached_time>
		FormatText TextName = misses_cached_text qs(0x6328b18e) g = <num_uncached_checks> n = <min_uncached_feelers> m = <max_uncached_feelers>
		FormatText TextName = misses_cached_time_text qs(0x0c07be32) g = <uncached_time> n = <min_uncached_time> m = <max_uncached_time>
		SetScreenElementProps id = NumFeelersText text = <num_cached_text>
		SetScreenElementProps id = HitsCachedText text = <hits_cached_text>
		SetScreenElementProps id = UnCachedText text = <misses_cached_text>
		SetScreenElementProps id = NumFeelersTimeText text = <num_cached_time_text>
		SetScreenElementProps id = HitsCachedTimeText text = <hits_cached_time_text>
		SetScreenElementProps id = UnCachedTimeText text = <misses_cached_time_text>
	endif
	wait \{1
		frame}
	repeat
endscript

script launch_toggle_feeler_stats \{display_offset = (0.0, 0.0)}
	DisplayFeelerStats <...>
endscript

script GenerateAcceptableString 
	return AcceptableString = Random (
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
