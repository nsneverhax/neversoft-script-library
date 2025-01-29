loading_screens = [
	{
		text = qs(0xb4ef0f49)
		pak = 'pak/loading_screen/loading_screen01.pak'
		on_boot = 0
	}
	{
		text = qs(0x884fa675)
		pak = 'pak/loading_screen/loading_screen01.pak'
		on_boot = 0
	}
	{
		text = qs(0xcd44da19)
		pak = 'pak/loading_screen/loading_screen01.pak'
		on_boot = 0
	}
	{
		text = qs(0x0af3a7f6)
		pak = 'pak/loading_screen/loading_screen01.pak'
		on_boot = 0
	}
	{
		text = qs(0x6b5039dc)
		pak = 'pak/loading_screen/loading_screen01.pak'
		on_boot = 0
	}
	{
		text = qs(0xe8fd8d8d)
		pak = 'pak/loading_screen/loading_screen01.pak'
		on_boot = 0
	}
	{
		text = qs(0x14597311)
		pak = 'pak/loading_screen/loading_screen01.pak'
		on_boot = 0
	}
	{
		text = qs(0x2b13f204)
		pak = 'pak/loading_screen/loading_screen02.pak'
		on_boot = 1
	}
	{
		text = qs(0x8ccf4baf)
		pak = 'pak/loading_screen/loading_screen02.pak'
		on_boot = 1
	}
	{
		text = qs(0x5dce1aa4)
		pak = 'pak/loading_screen/loading_screen02.pak'
		on_boot = 1
	}
	{
		text = qs(0x763bec98)
		pak = 'pak/loading_screen/loading_screen02.pak'
		on_boot = 1
	}
	{
		text = qs(0xd458577e)
		pak = 'pak/loading_screen/loading_screen02.pak'
		on_boot = 1
	}
	{
		text = qs(0x9bb4eddf)
		pak = 'pak/loading_screen/loading_screen02.pak'
		on_boot = 1
	}
	{
		text = qs(0x5f5dc976)
		pak = 'pak/loading_screen/loading_screen02.pak'
		on_boot = 1
	}
	{
		text = qs(0x4fcc2975)
		pak = 'pak/loading_screen/loading_screen03.pak'
		on_boot = 1
	}
	{
		text = qs(0x1df1ae9c)
		pak = 'pak/loading_screen/loading_screen03.pak'
		on_boot = 1
	}
	{
		text = qs(0x15fe69fe)
		pak = 'pak/loading_screen/loading_screen03.pak'
		on_boot = 1
	}
	{
		text = qs(0x61e578a6)
		pak = 'pak/loading_screen/loading_screen03.pak'
		on_boot = 1
	}
	{
		text = qs(0xf7fe59f7)
		pak = 'pak/loading_screen/loading_screen04.pak'
		on_boot = 1
	}
	{
		text = qs(0x254e5a53)
		pak = 'pak/loading_screen/loading_screen04.pak'
		on_boot = 1
	}
	{
		text = qs(0x51965613)
		pak = 'pak/loading_screen/loading_screen04.pak'
		on_boot = 1
	}
	{
		text = qs(0xa1ce6efa)
		pak = 'pak/loading_screen/loading_screen04.pak'
		on_boot = 1
	}
	{
		text = qs(0x7e000ebd)
		pak = 'pak/loading_screen/loading_screen05.pak'
		on_boot = 1
	}
	{
		text = qs(0xde77c09d)
		pak = 'pak/loading_screen/loading_screen05.pak'
		on_boot = 1
	}
	{
		text = qs(0x0196260a)
		pak = 'pak/loading_screen/loading_screen05.pak'
		on_boot = 1
	}
	{
		text = qs(0xbd84879f)
		pak = 'pak/loading_screen/loading_screen05.pak'
		on_boot = 1
	}
	{
		text = qs(0xf886c1e4)
		pak = 'pak/loading_screen/loading_screen05.pak'
		on_boot = 1
	}
	{
		text = qs(0xfcb31167)
		pak = 'pak/loading_screen/loading_screen05.pak'
		on_boot = 1
	}
	{
		text = qs(0x10d2bd20)
		pak = 'pak/loading_screen/loading_screen05.pak'
		on_boot = 1
	}
]
reuse_last_loading_screen = -1

script choose_random_loading_screen \{booting = 0}
	if ($reuse_last_loading_screen != -1)
		return \{random_screen = $reuse_last_loading_screen}
	endif
	GetArraySize ($loading_screens)
	if (<booting> = 0)
		GetRandomValue a = 0 b = (<array_Size> - 1) integer Name = random_int
		return random_screen = <random_int>
	endif
	valid_screens = []
	index_remaps = []
	index = 0
	begin
	screen = ($loading_screens [<index>])
	if ((<screen>.on_boot) = 1)
		AddArrayElement array = <valid_screens> element = <screen>
		<valid_screens> = <array>
		AddArrayElement array = <index_remaps> element = <index>
		<index_remaps> = <array>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	GetArraySize <valid_screens>
	GetRandomValue a = 0 b = (<array_Size> - 1) integer Name = random_int
	return random_screen = (<index_remaps> [<random_int>])
endscript

script create_loading_screen 
	printf \{'create_loading_screen'}
	menu_music_off \{setflag = 1}
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	Change \{is_changing_levels = 1}
	if ScreenElementExists \{id = loading_screen_container}
		return
	endif
	wii_timer_start \{label = 'loading_screen'}
	mark_unsafe_for_shutdown
	choose_random_loading_screen
	if ($freestyle_loading_screen_type != None)
		switch ($freestyle_loading_screen_type)
			case Normal
			LoadPak \{'pak/loading_screen/loading_screen_freestyle_normal.pak'
				Heap = heap_temporary}
			CreateScreenElement \{Type = descinterface
				parent = root_window
				desc = 'freestyle_loading_screen_tree_1'
				id = loading_screen_container
				z_priority = 1000000}
			case watch
			LoadPak \{'pak/loading_screen/loading_screen_freestyle_watch.pak'
				Heap = heap_temporary}
			CreateScreenElement \{Type = descinterface
				parent = root_window
				desc = 'freestyle_watch_loading_screen_tree'
				id = loading_screen_container
				z_priority = 1000000}
			default
			ScriptAssert \{'unknown freestyle loading screen type %l'
				l = $freestyle_loading_screen_type}
		endswitch
	else
		screen = ($loading_screens [<random_screen>])
		CreateScreenElement {
			Type = descinterface
			parent = root_window
			desc = 'loading'
			id = loading_screen_container
			z_priority = 1000000
			tip_text = (<screen>.text)
		}
	endif
	SpawnScriptNow create_loading_screen_spawned params = {jam_mode = <jam_mode> random_screen = <random_screen>}
	wii_timer_stop \{label = 'loading_screen'}
endscript

script create_loading_screen_spawned 
	if ScreenElementExists \{id = loading_screen_background}
		DestroyScreenElement \{id = loading_screen_background}
	endif
	if ($freestyle_loading_screen_type = None)
		screen = ($loading_screens [<random_screen>])
		LoadPak (<screen>.pak) Heap = heap_temporary
		CreateScreenElement \{Type = SpriteElement
			parent = loading_screen_container
			id = loading_screen_background
			texture = loading_background
			Pos = (640.0, 360.0)
			just = [
				center
				center
			]
			dims = (1280.0, 720.0)
			z_priority = 4000}
	endif
	wii_timer_start \{label = 'loading_screen_cfunc'}
	predisplayloadingscreen
	wii_timer_stop \{label = 'loading_screen_cfunc'}
	Wait \{4
		gameframes}
endscript

script destroy_loading_screen 
	if ($freestyle_just_exited = true)
		return
	endif
	if ($hold_loading_screen = 1)
		Change \{is_changing_levels = 0}
		mark_safe_for_shutdown
		fadetoblack \{OFF
			time = 0
			no_wait}
		return
	endif
	printf \{'destroy_loading_screen'}
	if ScreenElementExists \{id = loading_screen_container}
		if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
			loading_screen_container :obj_spawnscript destroy_loading_screen_spawned params = <...>
		endif
	endif
	begin
	if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
		HideLoadingScreen
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{is_changing_levels = 0}
	mark_safe_for_shutdown
	fadetoblack \{OFF
		time = 0
		no_wait}
endscript

script destroy_loading_screen_spawned \{time = 0.1}
	printf \{'destroy_loading_screen_spawned'}
	if ($playing_song = 1)
		Wait \{4
			gameframes}
	endif
	if ScreenElementExists \{id = loading_screen_background}
		DestroyScreenElement \{id = loading_screen_background}
	endif
	UnLoadPak \{'pak/loading_screen/loading_screen_freestyle_normal.pak'}
	UnLoadPak \{'pak/loading_screen/loading_screen_freestyle_watch.pak'}
	unload_all_loading_screen_paks
	GetTags
	StopRendering
	se_setprops \{alpha = 0}
	if NOT GotParam \{no_render}
		hide_glitch \{num_frames = 5}
	endif
	Die
endscript

script unload_all_loading_screen_paks 
	GetArraySize ($loading_screens)
	i = 0
	begin
	screen = ($loading_screens [<i>])
	UnLoadPak (<screen>.pak)
	i = (<i> + 1)
	repeat <array_Size>
endscript

script freestyle_loading_screen_remove_text 
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :desc_resolvealias \{Name = alias_loading_text}
		DestroyScreenElement id = <resolved_id>
	endif
endscript
