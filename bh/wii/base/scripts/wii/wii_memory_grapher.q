wii_memory_graph_bars_per_page = 12
wii_memory_graph_current_page = 0
wii_memory_graph_on_last_page = 0

script wii_create_memory_graph 
	if ($enable_debug = 0)
		return
	endif
	retrievememoryquotastatus
	retrieveheapstatus
	GetArraySize <quota_status>
	quota_count = <array_Size>
	GetArraySize <heap_status_array>
	heap_count = <array_Size>
	bar_count = (<quota_count> + <heap_count>)
	if (<bar_count> = 0)
		return
	endif
	bar_params = []
	createstructurearray array_name = bar_params size = <bar_count>
	bar = 0
	if (<quota_count> > 0)
		quota = 0
		begin
		formatText qs(0x0bc409e2) TextName = bar_text a = (<quota_status> [<quota>].Name)
		setstructureparam array_name = bar_params array_index = <bar> param = current value = (<quota_status> [<quota>].current_allocations)
		setstructureparam array_name = bar_params array_index = <bar> param = peak value = (<quota_status> [<quota>].peak_allocations)
		setstructureparam array_name = bar_params array_index = <bar> param = total value = (<quota_status> [<quota>].size)
		setstructureparam array_name = bar_params array_index = <bar> param = text value = <bar_text>
		<bar> = (<bar> + 1)
		<quota> = (<quota> + 1)
		repeat <quota_count>
	endif
	if (<heap_count> > 0)
		Heap = 0
		begin
		formatText qs(0x0bc409e2) TextName = bar_text a = (<heap_status_array> [<Heap>].Name)
		setstructureparam array_name = bar_params array_index = <bar> param = current value = (<heap_status_array> [<Heap>].current_allocations)
		setstructureparam array_name = bar_params array_index = <bar> param = peak value = (<heap_status_array> [<Heap>].peak_allocations)
		setstructureparam array_name = bar_params array_index = <bar> param = total value = (<heap_status_array> [<Heap>].size)
		setstructureparam array_name = bar_params array_index = <bar> param = text value = <bar_text>
		<bar> = (<bar> + 1)
		<Heap> = (<Heap> + 1)
		repeat <heap_count>
	endif
	create_start_bar = ($wii_memory_graph_current_page * $wii_memory_graph_bars_per_page)
	create_bar_count = $wii_memory_graph_bars_per_page
	if ((<create_start_bar> + <create_bar_count>) >= <bar_count>)
		<create_bar_count> = (<bar_count> - <create_start_bar> - 1)
	endif
	if ((<create_start_bar> + <create_bar_count>) = (<bar_count> - 1))
		Change \{wii_memory_graph_on_last_page = 1}
	else
		Change \{wii_memory_graph_on_last_page = 0}
	endif
	wii_bar_graph_create {
		bar_params = <bar_params>
		alpha = 0.6
		z = 999999
		units = kb
		start_bar = <create_start_bar>
		bar_count = <create_bar_count>
	}
endscript

script wii_memory_graph_refresher 
	setscriptcannotpause
	begin
	wii_create_memory_graph
	Wait \{1
		Second}
	repeat
endscript

script wii_memory_graph_updater 
	setscriptcannotpause
	begin
	if ControllerMake \{select}
		wii_memory_graph_next_page
	endif
	Wait \{1
		Frame}
	repeat
endscript

script wii_start_memory_graphing 
	Change \{wii_memory_graph_current_page = 0}
	wii_create_memory_graph
	spawnscript \{wii_memory_graph_updater}
	spawnscript \{wii_memory_graph_refresher}
	CreateScreenElement \{Type = TextElement
		id = memory_graph_prompt
		parent = root_window
		text = qs(0xad334c1b)
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		Pos = (640.0, 640.0)
		rgba = [
			255
			255
			255
			255
		]
		font = fontgrid_text_a1
		z_priority = 999999
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (3.0, 3.0)
		internal_scale = 0.5}
endscript

script wii_stop_memory_graphing 
	KillSpawnedScript \{Name = wii_memory_graph_updater}
	KillSpawnedScript \{Name = wii_memory_graph_refresher}
	wii_bar_graph_destroy
	DestroyScreenElement \{id = memory_graph_prompt}
endscript

script wii_memory_graph_next_page 
	if ($wii_memory_graph_on_last_page = 1)
		Change \{wii_memory_graph_current_page = 0}
	else
		Change wii_memory_graph_current_page = ($wii_memory_graph_current_page + 1)
	endif
	wii_create_memory_graph
endscript
