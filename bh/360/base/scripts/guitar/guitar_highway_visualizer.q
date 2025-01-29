highway_visual_viewport_params = {
	textureassets = [
		`tex\models\Highway\highway_vis_texture.dds`
	]
	texdicts = [
		`pak/highway/basic_gems/basic_gems.tex`
	]
	style = highway_visualizer_rendering
	zone_context = basic_gems
	viewport_id = highway_visualizer_viewport
}

script create_highway_visualizer_viewport 
	if NOT GlobalExists name = <visualizer>
		return
	endif
	AddParams ($<visualizer>)
	PushAssetContext context = <zone_context>
	textureasset = (<textureassets> [0])
	texdict = (<texdicts> [0])
	if NOT IsAssetLoaded name = <texdict>
		printf channel = zdebug 'texdict %s not found for highway visualizer' s = <texdict>
	endif
	if NOT IsTextureInDictionary dictionary = <texdict> texture = <textureasset>
		printf zdebug 'No texture to put Band Name in %s with %t' s = <pakname> t = <texdict>
	endif
	PopAssetContext
	CreateViewport {
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
	SetSearchAllAssetContexts \{off}
	return textureasset = <textureasset>
endscript

script create_highway_visualizer 
	if ScriptIsRunning \{kill_highway_visualizer_spawned}
		killspawnedscript \{name = kill_highway_visualizer_spawned}
		destroy_highway_visualizer
	endif
	count_players_by_part \{part = Drum}
	GameMode_GetType
	if (<players_by_part> > 0 || <type> = freeplay)
		visualizer_params = highway_visual_viewport_params
		create_highway_visualizer_viewport visualizer = <visualizer_params>
		spawnscriptnow create_highway_visualizer_fx params = {visualizer = <visualizer> viewport = highway_visualizer_viewport}
	endif
endscript

script create_highway_visualizer_fx 
	<has_drummer> = 0
	<num_five_lane> = 0
	<num_four_lane> = 0
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		if PlayerInfoEquals <player> part = Drum
			<has_drummer> = 1
			GetPlayerInfo <player> four_lane_highway
			if (<four_lane_highway> = 1)
				<num_four_lane> = (<num_four_lane> + 1)
			else
				<num_five_lane> = (<num_five_lane> + 1)
			endif
		endif
		GetNextPlayer player = <player> on_screen
		repeat <num_players_shown>
	endif
	if (<has_drummer> = 0)
		return
	endif
	visualizer = highway_visualizer_fx
	if ScreenFX_FXInstanceExists viewport = <viewport> name = <visualizer>
		ScreenFX_ClearFXInstances {viewport = <viewport>}
	endif
	wait \{1
		gameframe}
	if IsPS3
		if (<num_five_lane> >= <num_four_lane>)
			primitive = OG_Highway_Drum_Freeform_PS3
		else
			primitive = OG_Highway_Drum_Freeform_RB_PS3
		endif
	else
		if (<num_five_lane> >= <num_four_lane>)
			primitive = OG_Highway_Drum_Freeform
		else
			primitive = OG_Highway_Drum_Freeform_RB
		endif
	endif
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		name = <visualizer>
		scefName = <visualizer>
		type = AudioVisualize
		on = 1
		clearColor = [0 , 0 , 0 , 255]
		BlendMode = diffuse
		AlphaFromGrayScale = 15
		primitives = ($<primitive>)
	}
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		name = AVFX_Bloom01
		scefName = AVFX_Bloom01
		type = bloom2
		on = 1
		materialFilter = 0
		fullScreen = 1
		subtract = [0 0 0 0]
		colormodulate = [1.0 1.0 1.0 0.1]
		saturation = 1.0
		equation = eq2
	}
endscript

script kill_highway_visualizer 
	spawnscriptnow \{kill_highway_visualizer_spawned}
endscript

script kill_highway_visualizer_spawned 
	AddParams ($highway_visual_viewport_params)
	if NOT ViewportExists id = <viewport_id>
		return
	endif
	wait \{20
		gameframes}
	destroy_highway_visualizer
endscript

script destroy_highway_visualizer 
	AddParams ($highway_visual_viewport_params)
	if ViewportExists id = <viewport_id>
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride id = <viewport_id>
		SetSearchAllAssetContexts \{off}
		DestroyViewport id = <viewport_id>
	endif
endscript
