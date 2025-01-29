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
no_render_metrics = 0
DebugScriptPrintf = 0
DebugPausedObjects = 0
DebugPausedObjectsComponentToCheck = Model
AssertWhenGlobalsChangeType = 0

script controlpadmotion_debug_create 
	if NOT ScreenElementExists \{id = controlpadmotion_debug}
		CreateScreenElement \{Type = Element3d
			parent = root_window
			id = controlpadmotion_debug
			Model = 'HUD_arrow/HUD_Arrow.mdl'
			CameraZ = -1
			Scale = 1.0
			Active_Viewport = 0
			Pos = (120.0, 360.0)}
	endif
endscript

script controlpadmotion_debug_kill 
	if ScreenElementExists \{id = controlpadmotion_debug}
		DestroyScreenElement \{id = controlpadmotion_debug}
	endif
endscript

script PrintVec 
	if GotParam \{vec}
		GetVectorComponents <vec>
		printf qs(0x1972291f) X = <X> y = <y> z = <z>
	endif
endscript

script findreferencedscreenelementparams \{param = Pos}
	RequireParams \{[
			param
		]
		all}
	findreferencedscreenelementparams_recurse array = [] id = root_window param = <param>
	GetArraySize <array>
	printf '%s referenced %p(s) found' s = <array_Size> p = <param> channel = params
	if NOT (<array_Size> = 0)
		<count> = <array_Size>
		i = 0
		begin
		if IsArray (<array> [<i>].item)
			GetArraySize (<array> [<i>].item)
			j = 0
			text = '['
			begin
			formatText TextName = text '%a %b' a = <text> b = ((<array> [<i>].item) [<j>]) DontAssertForChecksums
			j = (<j> + 1)
			repeat <array_Size>
			text = (<text> + ' ]')
		else
			formatText TextName = text '%a' a = (<array> [<i>].item) DontAssertForChecksums
		endif
		printf ' - %cx %t' c = (<array> [<i>].count) t = <text> channel = params
		i = (<i> + 1)
		repeat <count>
	endif
endscript

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
