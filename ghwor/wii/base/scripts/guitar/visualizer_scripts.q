visualizer_active_pak = 'none'

script visualizer_get_primitives 
	RequireParams \{[
			preset
		]
		all}
	Profile = ($<preset>)
	if IsArray <Profile>
		primitives = ($<preset>)
	else
		if StructureContains structure = <Profile> primitives
			primitives = (<Profile>.primitives)
		else
			ScriptAssert \{'UNABLE TO FIND PRIMITIVES'}
		endif
	endif
	return primitives = <primitives>
endscript

script enable_fullscreen_visualizer 
	viewport = bg_viewport
	if NOT ViewportExists id = <viewport>
		ScriptAssert \{'INVALID VIEWPORT'}
		return
	endif
	Name = av_test0
	mode = fullscreen
	if screenFX_FXInstanceExists viewport = <viewport> Name = <Name>
		ScreenFX_ClearFXInstances viewport = <viewport> mode = <mode>
	endif
	if GotParam \{preset}
		visualizer_get_primitives preset = <preset>
	else
		primitives = $blank_preset
	endif
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		Name = <Name>
		scefName = <Name>
		Type = audiovisualize
		On = 1
		primitives = <primitives>
		mode = <mode>
		width = 0
		height = 0
	}
	SetViewportProperties viewport = <viewport> Active = true
endscript

script update_fullscreen_visualizer \{preset = None}
	viewport = bg_viewport
	if NOT ViewportExists id = <viewport>
		ScriptAssert \{'INVALID VIEWPORT'}
		return
	endif
	Name = av_test0
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = <Name>
		ScriptAssert \{'INVALID FX INSTANCE'}
		return
	endif
	if (<preset> = None)
		get_random_spicey_preset
	endif
	visualizer_get_primitives preset = <preset>
	ScreenFX_UpdateFXInstanceParams viewport = <viewport> Name = <Name> Type = audiovisualize On = 1 primitives = <primitives> mode = fullscreen width = 0 height = 0
endscript

script disable_fullscreen_visualizer 
	viewport = bg_viewport
	if NOT ViewportExists id = <viewport>
		ScriptAssert \{'INVALID VIEWPORT'}
		return
	endif
	SetViewportProperties viewport = <viewport> Active = FALSE
	if screenFX_FXInstanceExists viewport = <viewport> Name = av_test0
		ScreenFX_ClearFXInstances viewport = <viewport> mode = fullscreen
	endif
	visualizer_unload
endscript

script visualizer_load_bank \{reload = FALSE}
	RequireParams \{[
			bank
			Heap
		]
		all}
	printf \{'F(): visualizer_load_bank'
		channel = visualizer}
	formatText TextName = path 'pak/visualizer/%a.pak' a = ($<bank>.pak)
	if ((<reload> = FALSE) && (<path> = $visualizer_active_pak))
		printf 'Visualizer bank already loaded: %a' a = <path> channel = visualizer
		return
	endif
	visualizer_unload
	visualizer_load_pak path = <path> Heap = <Heap>
	Change visualizer_current_bank = <bank>
endscript

script visualizer_unload 
	if ($visualizer_active_pak != 'none')
		visualizer_unload_pak
	endif
endscript

script visualizer_load_pak \{async = 0}
	RequireParams \{[
			path
			Heap
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
	if ($visualizer_active_pak = 'none')
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
last_venue_played = None

script create_visualizer_safe_venue 
	if ($current_level = load_z_visualizer)
		Change \{last_venue_played = load_z_visualizer}
		Change \{current_level = load_z_cube}
		Load_Venue \{block_scripts = 1}
		SetViewportProperties \{viewport = bg_viewport
			Active = true}
		SpawnScriptNow \{spawn_visualizer_lighting_fix}
	endif
endscript

script destroy_visualizer_safe_venue 
	if ($last_venue_played = load_z_visualizer)
		Change \{last_venue_played = None}
		Change \{current_level = load_z_visualizer}
		Load_Venue \{block_scripts = 1}
		SetViewportProperties \{viewport = bg_viewport
			Active = true}
	endif
endscript

script spawn_visualizer_lighting_fix 
	Wait \{10
		gameframes}
	LightShow_InitEventMappings
	lightshow_notingameplay_setmood \{mood = band_lobby}
endscript
spicey_presets = [
	jow_viz_pinktunnel
	og_circles_centered
	og_circles_centered_rays
	og_explosives_c
	tb_cube_starpower
	tb_cube_prelude
	tb_cube_exposition
	jow_jam_4p_diamondstar
	og_enerdonut_e
	og_enerdonut_f
	og_circles_centered_dark
	jow_cube_expansion
	jow_cube_expansion_white
	jow_jam_4p_anarchy
]

script get_random_spicey_preset 
	randomize
	GetArraySize \{$spicey_presets}
	GetRandomValue a = 0 b = (<array_Size> - 1) integer Name = random_preset
	return preset = ($spicey_presets [<random_preset>])
endscript
