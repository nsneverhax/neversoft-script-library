highway_visual_viewport_params = {
	textureassets = [
		`tex\models\highway\highway_vis_texture.dds`
	]
	texdicts = [
		`pak/highway/basic_gems/basic_gems.tex`
	]
	style = highway_visualizer_rendering
	zone_context = basic_gems
	viewport_id = highway_visualizer_viewport
}

script create_highway_visualizer_viewport 
	if NOT GlobalExists Name = <visualizer>
		return
	endif
	AddParams ($<visualizer>)
	PushAssetContext context = <zone_context>
	textureasset = (<textureassets> [0])
	texdict = (<texdicts> [0])
	if NOT isassetloaded Name = <texdict>
		printf channel = zdebug 'texdict %s not found for highway visualizer' s = <texdict>
	endif
	if NOT IsTextureInDictionary dictionary = <texdict> texture = <textureasset>
		printf zdebug 'No texture to put Band Name in %s with %t' s = <pakname> t = <texdict>
	endif
	PopAssetContext
	createviewport {
		Priority = 20
		id = <viewport_id>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport_id>
		viewportid = <viewport_id>
		texture = <textureasset>
		texdict = <texdict>
	}
	SetSearchAllAssetContexts \{OFF}
	return textureasset = <textureasset>
endscript

script create_highway_visualizer 
	if ScriptIsRunning \{kill_highway_visualizer_spawned}
		KillSpawnedScript \{Name = kill_highway_visualizer_spawned}
		destroy_highway_visualizer
	endif
	count_players_by_part \{part = drum}
	gamemode_gettype
	if (<players_by_part> > 0 || <Type> = freeplay)
		visualizer_params = highway_visual_viewport_params
		create_highway_visualizer_viewport visualizer = <visualizer_params>
		SpawnScriptNow create_highway_visualizer_fx params = {visualizer = <visualizer> viewport = highway_visualizer_viewport}
	endif
endscript

script create_highway_visualizer_fx 
	<has_drummer> = 0
	<num_five_lane> = 0
	<num_four_lane> = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <Player> part = drum
			<has_drummer> = 1
			getplayerinfo <Player> four_lane_highway
			if (<four_lane_highway> = 1)
				<num_four_lane> = (<num_four_lane> + 1)
			else
				<num_five_lane> = (<num_five_lane> + 1)
			endif
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
	if (<has_drummer> = 0)
		return
	endif
	visualizer = highway_visualizer_fx
	if screenFX_FXInstanceExists viewport = <viewport> Name = <visualizer>
		ScreenFX_ClearFXInstances {viewport = <viewport>}
	endif
	Wait \{1
		gameframe}
	if isps3
		if (<num_five_lane> >= <num_four_lane>)
			primitive = og_highway_drum_freeform_ps3
		else
			primitive = og_highway_drum_freeform_rb_ps3
		endif
	else
		if (<num_five_lane> >= <num_four_lane>)
			primitive = og_highway_drum_freeform
		else
			primitive = og_highway_drum_freeform_rb
		endif
	endif
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		Name = <visualizer>
		scefName = <visualizer>
		Type = audiovisualize
		On = 1
		clearcolor = [0 , 0 , 0 , 255]
		BlendMode = diffuse
		alphafromgrayscale = 15
		primitives = ($<primitive>)
	}
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		Name = avfx_bloom01
		scefName = avfx_bloom01
		Type = Bloom2
		On = 1
		MaterialFilter = 0
		fullscreen = 1
		subtract = [0 0 0 0]
		colormodulate = [1.0 1.0 1.0 0.1]
		Saturation = 1.0
		equation = eq2
	}
endscript

script kill_highway_visualizer 
	SpawnScriptNow \{kill_highway_visualizer_spawned}
endscript

script kill_highway_visualizer_spawned 
	AddParams ($highway_visual_viewport_params)
	if NOT ViewportExists id = <viewport_id>
		return
	endif
	Wait \{20
		gameframes}
	destroy_highway_visualizer
endscript

script destroy_highway_visualizer 
	AddParams ($highway_visual_viewport_params)
	if ViewportExists id = <viewport_id>
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride id = <viewport_id>
		SetSearchAllAssetContexts \{OFF}
		DestroyViewport id = <viewport_id>
	endif
endscript
