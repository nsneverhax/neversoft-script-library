visualizer_active_pak = 'none'

script enablefullscreenvisualizer \{preset = jow_jam_4p_pinktunnel}
	setup_bg_viewport
	0xeb8003f5 preset = <preset>
	visualizer_get_primitives preset = <preset>
	create_avfx primitives = <primitives> viewport = bg_viewport
endscript

script 0xb1970794 
	viewport = bg_viewport
	if ViewportExists id = <viewport>
		SetViewportProperties viewport = <viewport> Active = FALSE
		ScreenFX_ClearFXInstances viewport = <viewport> mode = fullscreen
	endif
	visualizer_unload
endscript

script visualizer_load_bank \{reload = FALSE}
	if NOT GotParam \{bank}
		bank = default_visualizer_bank
		printf \{'visualizer_load_bank - DEFAULT BANK USED'
			channel = visualizer}
	endif
	path = ($<bank>.pak)
	printf \{'F(): visualizer_load_bank'
		channel = visualizer}
	if ((<reload> = FALSE) && (<path> = ($visualizer_active_pak)))
		printf 'Visualizer bank already loaded: %a' a = <path> channel = visualizer
		return
	endif
	if NOT GotParam \{path}
		ScriptAssert \{qs(0xf52407e3)}
	endif
	visualizer_unload
	visualizer_load_pak path = <path>
	Change visualizer_current_bank = <bank>
endscript

script 0xeb8003f5 
	RequireParams \{[
			preset
		]
		all}
	path = (($0x893f2268.<preset>).pak)
	printf \{'F(): visualizer_load_preset'
		channel = visualizer}
	if (<path> = ($visualizer_active_pak))
		printf 'Visualizer preset already loaded: %a' a = <preset> channel = visualizer
		return
	endif
	if NOT GotParam \{path}
		ScriptAssert \{qs(0xb7461f48)}
	endif
	visualizer_unload_pak
	visualizer_load_pak path = <path>
endscript

script visualizer_unload 
	if ($visualizer_active_pak != 'none')
		visualizer_unload_pak
	endif
endscript

script 0x91300b61 
	clear_ui_visualizer
	visualizer_unload
endscript

script visualizer_load_pak \{async = 0
		Heap = quota_samples}
	RequireParams \{[
			path
		]
		all}
	printf \{'F(): visualizer_load_pak'
		channel = visualizer}
	if ispakloaded <path>
		printf 'Visualizer pak already loaded: %a' a = <path> channel = visualizer
		return
	endif
	if (<async> = 1)
		spawnscript LoadPakAsync params = {pak_name = <path> Heap = <Heap> async = 1}
	else
		LoadPak <path> Heap = <Heap>
	endif
	Change visualizer_active_pak = <path>
	Change \{visualizer_events_enabled = true}
endscript

script visualizer_unload_pak \{async = 0}
	printf \{'F(): visualizer_unload_pak'
		channel = visualizer}
	if (($visualizer_active_pak) = 'none')
		return
	endif
	Change \{visualizer_events_enabled = FALSE}
	if (<async> = 1)
		UnloadPakAsync pak_name = ($visualizer_active_pak) async = 1
	else
		UnLoadPak ($visualizer_active_pak)
		WaitUnloadPak <path> Block
	endif
	Change \{visualizer_active_pak = 'none'}
	Change \{visualizer_current_bank = None}
endscript
