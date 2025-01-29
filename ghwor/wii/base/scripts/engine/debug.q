METRIC_TIME = 1
METRIC_ARENAUSAGE = 2
METRIC_TOTALPOLYS = 4
METRIC_POLYSPROC = 8
METRIC_VERTS = 16
METRIC_RESOURCEALLOCS = 32
METRIC_TEXTUREUPLOADS = 64
METRIC_VU1 = 128
METRIC_DMA1 = 256
METRIC_DMA2 = 512
METRIC_VBLANKS = 1024
METRIC_DRAWTIME = 2048
METRIC_IHANDLERTIME = 4096
METRIC_SKYCACHE = 8192
METRIC_VIDEOMODE = 16384
METRIC_VRAMUSAGE = 32768
METRIC_MEMUSED = 65536
METRIC_MEMFREE = 131072
METRIC_REGIONINFO = 262144
Show_Warnings = 1
Show_Zone_budget_Warnings = 1
show_zone_budget_usage = 0
show_cas_budget_warnings = 1
no_render_metrics = 0
DebugScriptPrintf = 0
DebugPausedObjects = 0
DebugPausedObjectsComponentToCheck = Model
AssertWhenGlobalsChangeType = 0

script findreferencedscreenelementparams_recurse 
	RequireParams \{[
			array
			id
			param
		]
		all}
	if ScreenElementExists id = <id>
		GetScreenElementProps id = <id>
		if GotParam <param>
			GetArraySize <array>
			i = 0
			if NOT (<array_Size> = 0)
				begin
				if ((<...>.<param>) = (<array> [<i>].item))
					SetArrayElement ArrayName = array index = <i> NewValue = {item = (<...>.<param>) count = ((<array> [<i>].count) + 1)}
					break
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
			if (<i> = <array_Size>)
				AddArrayElement array = <array> element = {item = (<...>.<param>) count = 1}
			endif
		endif
		if GetScreenElementChildren id = <id>
			GetArraySize <children>
			if NOT (<array_Size> = 0)
				i = 0
				begin
				findreferencedscreenelementparams_recurse array = <array> id = (<children> [<i>]) param = <param>
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endif
	endif
	return {array = <array>}
endscript

script dbg_win_song 
	SpawnScriptNow \{UserSelectLeftAnalogUp}
endscript
