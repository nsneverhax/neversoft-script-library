
script RefreshCurrentZones 
	SpawnScriptLater \{reload_zones}
endscript

script reload_zones 
	PauseSkaters
	StopMusic
	StopAudioStreams
	Wait \{2
		GameFrames}
	SetSaveZoneNameToCurrent
	SetEnableMovies \{1}
	kill_blur
	SetPakManCurrentBlock \{map = Zones
		pak = NONE}
	RefreshPakManSizes \{map = Zones}
	ScriptCacheDeleteZeroUsage
	GetSaveZoneName
	SetPakManCurrentBlock map = Zones pakname = <save_zone>
	if NOT ($view_mode = 1)
		UnPauseSkaters
	endif
endscript

script DisplayAnimCacheState 
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
	if ObjectExists \{Id = AnimCacheAnchor}
		KillSpawnedScript \{Name = UpdateAnimCacheState}
		DestroyScreenElement \{Id = AnimCacheAnchor}
		return
	endif
	if NOT ObjectExists \{Id = AnimCacheAnchor}
		SetScreenElementLock \{Id = root_window
			OFF}
		<root_pos> = (<display_offset> + (25.0, 40.0))
		CreateScreenElement {
			Type = ContainerElement
			PARENT = root_window
			Id = AnimCacheAnchor
			Pos = <root_pos>
			just = [Center Center]
			internal_just = [LEFT Center]
		}
		CreateScreenElement \{Type = TextElement
			PARENT = AnimCacheAnchor
			Id = PriCachedText
			Pos = (0.0, -30.0)
			Text = "Animation Cache Priority Distribution:"
			font = dialog
			rgba = [
				120
				120
				120
				255
			]
			just = [
				LEFT
				Top
			]}
		CreateScreenElement \{Type = TextElement
			PARENT = AnimCacheAnchor
			Id = PriCachedLine
			Pos = (0.0, -21.0)
			Text = "-----------------------------------------"
			font = dialog
			rgba = [
				120
				120
				120
				255
			]
			just = [
				LEFT
				Top
			]}
		<I> = 0
		begin
		<bar_id> = ((<priority_ranges> [<I>]).bar)
		<bar_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		<bar_rgba> = [255 0 0 50]
		SetArrayElement ArrayName = bar_rgba Index = 0 NewValue = (255 - (<I> * 30))
		SetArrayElement ArrayName = bar_rgba Index = 1 NewValue = ((<I> * 30))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = AnimCacheAnchor
			Id = <bar_id>
			Pos = <bar_pos>
			Scale = (50.0, 5.0)
			texture = White
			font = dialog
			rgba = <bar_rgba>
			just = [LEFT Top]
		}
		<I> = (<I> + 1)
		repeat <array_Size>
		<txt_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			PARENT = AnimCacheAnchor
			Id = NumCachedText
			Pos = <txt_pos>
			Text = "-- Total Cached Anims:"
			font = dialog
			rgba = [120 0 120 255]
			just = [LEFT Top]
		}
		<I> = (<I> + 1)
		<txt_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			PARENT = AnimCacheAnchor
			Id = HitsCachedText
			Pos = <txt_pos>
			Text = "-- Cache Hits:"
			font = dialog
			rgba = [20 255 20 255]
			just = [LEFT Top]
		}
		<I> = (<I> + 1)
		<txt_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			PARENT = AnimCacheAnchor
			Id = MissesCachedText
			Pos = <txt_pos>
			Text = "-- Cache Misses:"
			font = dialog
			rgba = [255 20 20 255]
			just = [LEFT Top]
		}
		SetScreenElementLock \{Id = root_window
			ON}
	endif
	SpawnScriptLater UpdateAnimCacheState Params = {priority_ranges = <priority_ranges>}
endscript

script UpdateAnimCacheState 
	begin
	if ObjectExists \{Id = AnimCacheAnchor}
		GetArraySize <priority_ranges>
		<I> = 0
		begin
		GetAnimCacheState priority_range = ((<priority_ranges> [<I>]).Range)
		<D> = (((<priority_ranges> [<I>]).Range).(1.0, 0.0))
		<E> = (((<priority_ranges> [<I>]).Range).(0.0, 1.0))
		<bar_id> = ((<priority_ranges> [<I>]).bar)
		<new_scale> = ((1.0, 5.0) + (<priority_count> * (10.0, 0.0)))
		<bar_id> :DoMorph Scale = <new_scale> Time = 0.2
		<I> = (<I> + 1)
		repeat <array_Size>
		FormatText TextName = num_cached_text "-- Total cached anims: %g" G = <num_cached>
		FormatText TextName = hits_cached_text "-- Cache Hits: %g" G = <cache_hits>
		FormatText TextName = misses_cached_text "-- Cache Misses: %g" G = <cache_misses>
		SetScreenElementProps Id = NumCachedText Text = <num_cached_text>
		SetScreenElementProps Id = HitsCachedText Text = <hits_cached_text>
		SetScreenElementProps Id = MissesCachedText Text = <misses_cached_text>
	endif
	Wait \{1
		Frame}
	repeat
endscript

script launch_toggle_animcache_state \{display_offset = (0.0, 0.0)}
	DisplayAnimCacheState <...>
endscript

script DisplayFeelerStats 
	if ObjectExists \{Id = FeelerStatsAnchor}
		KillSpawnedScript \{Name = UpdateFeelerStats}
		DestroyScreenElement \{Id = FeelerStatsAnchor}
		return
	endif
	if NOT ObjectExists \{Id = FeelerStatsAnchor}
		SetScreenElementLock \{Id = root_window
			OFF}
		<root_pos> = (<display_offset> + (25.0, 40.0))
		CreateScreenElement {
			Type = ContainerElement
			PARENT = root_window
			Id = FeelerStatsAnchor
			Pos = <root_pos>
			just = [Center Center]
			internal_just = [LEFT Center]
		}
		CreateScreenElement \{Type = TextElement
			PARENT = FeelerStatsAnchor
			Id = PriCachedText
			Pos = (0.0, -30.0)
			Text = "Feeler Stats:"
			font = dialog
			rgba = [
				120
				120
				120
				255
			]
			just = [
				LEFT
				Top
			]}
		CreateScreenElement \{Type = TextElement
			PARENT = FeelerStatsAnchor
			Id = PriCachedLine
			Pos = (0.0, -21.0)
			Text = "-----------------------------------------"
			font = dialog
			rgba = [
				120
				120
				120
				255
			]
			just = [
				LEFT
				Top
			]}
		<I> = 1
		<txt_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			PARENT = FeelerStatsAnchor
			Id = NumFeelersText
			Pos = <txt_pos>
			Text = "-- Total Feelers Cast:"
			font = dialog
			rgba = [120 0 120 255]
			just = [LEFT Top]
		}
		<I> = (<I> + 1)
		<txt_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			PARENT = FeelerStatsAnchor
			Id = NumFeelersTimeText
			Pos = <txt_pos>
			Text = "---- Time:"
			font = dialog
			rgba = [120 0 120 255]
			just = [LEFT Top]
		}
		<I> = (<I> + 1)
		<txt_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			PARENT = FeelerStatsAnchor
			Id = HitsCachedText
			Pos = <txt_pos>
			Text = "-- Cached Feelers:"
			font = dialog
			rgba = [20 255 20 255]
			just = [LEFT Top]
		}
		<I> = (<I> + 1)
		<txt_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			PARENT = FeelerStatsAnchor
			Id = HitsCachedTimeText
			Pos = <txt_pos>
			Text = "---- Time:"
			font = dialog
			rgba = [20 255 20 255]
			just = [LEFT Top]
		}
		<I> = (<I> + 1)
		<txt_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			PARENT = FeelerStatsAnchor
			Id = UnCachedText
			Pos = <txt_pos>
			Text = "-- Uncached Feelers:"
			font = dialog
			rgba = [255 20 20 255]
			just = [LEFT Top]
		}
		<I> = (<I> + 1)
		<txt_pos> = ((0.0, 0.0) + (<I> * (0.0, 30.0)))
		CreateScreenElement {
			Type = TextElement
			PARENT = FeelerStatsAnchor
			Id = UnCachedTimeText
			Pos = <txt_pos>
			Text = "---- Time:"
			font = dialog
			rgba = [255 20 20 255]
			just = [LEFT Top]
		}
		SetScreenElementLock \{Id = root_window
			ON}
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
	if ObjectExists \{Id = FeelerStatsAnchor}
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
		FormatText TextName = num_cached_text "-- Total Cast Feelers: %g (%n %m)" G = <cur_total_feelers> N = <min_cast_feelers> M = <max_cast_feelers>
		FormatText TextName = num_cached_time_text "---- Time: %g (%n %m)" G = <cur_total_time> N = <min_cast_time> M = <max_cast_time>
		FormatText TextName = hits_cached_text "-- Cached Feelers: %g (%n %m)" G = <num_cached_checks> N = <min_cached_feelers> M = <max_cached_feelers>
		FormatText TextName = hits_cached_time_text "---- Time: %g (%n %m)" G = <cached_time> N = <min_cached_time> M = <max_cached_time>
		FormatText TextName = misses_cached_text "-- Uncached Feelers: %g (%n %m)" G = <num_uncached_checks> N = <min_uncached_feelers> M = <max_uncached_feelers>
		FormatText TextName = misses_cached_time_text "---- Time: %g (%n %m)" G = <uncached_time> N = <min_uncached_time> M = <max_uncached_time>
		SetScreenElementProps Id = NumFeelersText Text = <num_cached_text>
		SetScreenElementProps Id = HitsCachedText Text = <hits_cached_text>
		SetScreenElementProps Id = UnCachedText Text = <misses_cached_text>
		SetScreenElementProps Id = NumFeelersTimeText Text = <num_cached_time_text>
		SetScreenElementProps Id = HitsCachedTimeText Text = <hits_cached_time_text>
		SetScreenElementProps Id = UnCachedTimeText Text = <misses_cached_time_text>
	endif
	Wait \{1
		Frame}
	repeat
endscript

script launch_toggle_feeler_stats \{display_offset = (0.0, 0.0)}
	DisplayFeelerStats <...>
endscript
