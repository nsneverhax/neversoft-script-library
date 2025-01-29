vocals_visualizer_scale_mod = 0.75
vocals_visualizer_viewport_params_h1 = {
	textureassets = [
		vocals_visualizer
	]
	style = vocals_visualizer_rendering
}
vocals_visualizer_viewport_params_h2 = {
	textureassets = [
		vocals_visualizer2
	]
	style = vocals_visualizer_rendering
}
vocals_freeform_viewport_params_h1 = {
	textureassets = [
		vocals_freeform
	]
	style = vocals_freeform_rendering
}
vocals_freeform_viewport_params_h2 = {
	textureassets = [
		vocals_freeform2
	]
	style = vocals_freeform_rendering
}

script get_vocal_visualizer_viewport_texture_asset 
	return textureasset = (($<visualizer>.textureassets) [0])
endscript

script create_vocal_visualizer_viewport \{textureasset = unset}
	AddParams ($<visualizer>)
	textureasset = (<textureassets> [0])
	CreateViewport {
		Priority = 20
		id = <viewport>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
	}
	SetSearchAllAssetContexts \{off}
endscript

script vocals_hide_visualizer 
	FormatText checksumname = viewport_id 'vocal_visualizer_viewport_p%a' a = <player>
	if ScreenElementExists id = <viewport_id>
		<viewport_id> :SE_SetProps alpha = 0 time = 0.2
	endif
	<vocals_highway_id> :Desc_ResolveAlias name = alias_now_bar param = now_bar
	<now_bar> :SE_SetProps alpha = 0 time = 0.2
endscript

script vocals_show_visualizer 
	FormatText checksumname = viewport_id 'vocal_visualizer_viewport_p%a' a = <player>
	if ScreenElementExists id = <viewport_id>
		<viewport_id> :SE_SetProps alpha = 1 time = 0.2
	endif
	<vocals_highway_id> :Desc_ResolveAlias name = alias_now_bar param = now_bar
	<now_bar> :SE_SetProps alpha = 1 time = 0.2
endscript

script create_vocal_visualizer 
	Vocals_GetVocalistNum player = <player>
	printf channel = vocals qs(0x17066829) a = <player>
	VocalsHighway_GetId player = <player>
	need_to_create_viewport = true
	GameMode_GetType
	if (<type> != freeplay)
		Vocals_GetActiveHighway player = <player>
		if (<active_highway> = <player>)
			Vocals_GetActiveHighwayIndex player = <player>
			highway_index = <active_highway_index>
			if (<highway_index> = 1)
				visualizer = vocals_visualizer_viewport_params_h1
			else
				visualizer = vocals_visualizer_viewport_params_h2
			endif
		else
			need_to_create_viewport = false
			<vocals_highway_id> :SE_SetProps alpha = 0
			visualizer = vocals_visualizer_viewport_params_h1
		endif
		FormatText checksumname = viewport 'vocals_visualizer_p%a' a = <player>
	else
		visualizer = vocals_visualizer_viewport_params_h1
		highway_index = 1
		viewport = vocals_visualizer_freeplay
		if ViewportExists id = <viewport>
			need_to_create_viewport = false
		endif
		<vocals_highway_id> :SE_SetProps alpha = 1
	endif
	zone_context = basic_gems
	if (<need_to_create_viewport> = true)
		texdict = `pak/highway/basic_gems/basic_gems.tex`
		create_vocal_visualizer_viewport visualizer = <visualizer> viewport = <viewport> zone_context = <zone_context> texdict = <texdict>
		spawnscriptnow create_vocals_visualizer_fx params = {viewport = <viewport> visualizer = <visualizer> player = <player> highway_index = <highway_index>}
	endif
	<vocals_highway_id> :Desc_ResolveAlias name = alias_now_bar param = now_bar
	FormatText checksumname = viewport_id 'vocal_visualizer_viewport_p%a' a = <player>
	get_vocal_visualizer_viewport_texture_asset visualizer = <visualizer>
	PushAssetContext context = <zone_context>
	CreateScreenElement {
		id = <viewport_id>
		type = SpriteElement
		parent = <now_bar>
		texture = <textureasset>
		dims = (470.0, 100.0)
		just = [left top]
		Pos = (-390.0, 5.0)
		z_priority = 1
		Priority = 4
		alpha = 1
		blend = add
	}
	PopAssetContext
endscript

script vocals_create_freeform_viewport 
	Vocals_GetVocalistNum player = <player>
	printf channel = vocals qs(0x356837e7) a = <player>
	need_to_create_viewport = true
	GameMode_GetType
	if (<type> != freeplay)
		Vocals_GetActiveHighway player = <player>
		if (<active_highway> = <player>)
			Vocals_GetActiveHighwayIndex player = <player>
			highway_index = <active_highway_index>
			if (<highway_index> = 1)
				freeform = vocals_freeform_viewport_params_h1
			else
				freeform = vocals_freeform_viewport_params_h2
			endif
		else
			need_to_create_viewport = false
			freeform = vocals_freeform_viewport_params_h2
		endif
		FormatText checksumname = freeform_viewport 'vocals_freeform_p%a' a = <player>
	else
		freeform = vocals_freeform_viewport_params_h1
		highway_index = 1
		freeform_viewport = vocals_freeform_freeplay
		if ViewportExists id = <freeform_viewport>
			need_to_create_viewport = false
		endif
	endif
	zone_context = basic_gems
	if (<need_to_create_viewport> = true)
		texdict = `pak/highway/basic_gems/basic_gems.tex`
		create_vocal_visualizer_viewport visualizer = <freeform> viewport = <freeform_viewport> zone_context = <zone_context> texdict = <texdict>
		spawnscriptnow create_vocals_visualizer_freeform_fx params = {viewport = <freeform_viewport> visualizer = <freeform> highway_index = <highway_index> player = <player>}
	endif
	get_vocal_visualizer_viewport_texture_asset visualizer = <freeform>
	return texture = <textureasset>
endscript

script destroy_vocals_visualizer 
	AddParams (<visualizer>)
	FormatText checksumname = viewport 'vocals_visualizer_p%a' a = <player>
	if NOT ViewportExists id = <viewport>
		return
	endif
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <viewport>
	SetSearchAllAssetContexts \{off}
	DestroyViewport id = <viewport>
	FormatText checksumname = freeform_viewport 'vocals_freeform_p%a' a = <player>
	if NOT ViewportExists id = <freeform_viewport>
		return
	endif
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <freeform_viewport>
	SetSearchAllAssetContexts \{off}
	DestroyViewport id = <freeform_viewport>
endscript

script destroy_freeplay_vocals_visualizer 
	viewport = vocals_visualizer_freeplay
	if NOT ViewportExists id = <viewport>
		return
	endif
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <viewport>
	SetSearchAllAssetContexts \{off}
	DestroyViewport id = <viewport>
	freeform_viewport = vocals_freeform_freeplay
	if NOT ViewportExists id = <freeform_viewport>
		return
	endif
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <freeform_viewport>
	SetSearchAllAssetContexts \{off}
	DestroyViewport id = <freeform_viewport>
endscript

script create_vocals_visualizer_fx 
	GameMode_GetType
	if (<type> != freeplay)
		FormatText checksumname = visualizer 'vocals_visualizer_fx_p%a' a = <player>
	else
		visualizer = vocals_visualizer_fx_freeplay
	endif
	if ScreenFX_FXInstanceExists viewport = <viewport> name = <visualizer>
		ScreenFX_ClearFXInstances {viewport = <viewport>}
	endif
	wait \{1
		gameframe}
	printf channel = vocals qs(0x0fdbba62) a = <player> b = <highway_index>
	VocalsHighway_GetId player = <player>
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> > 1)
		primitive = OG_Vocal_Comet_4P
		<vocals_highway_id> :SE_SetProps pitch_area_alpha = 1
	else
		vocals_get_highway_view player = <player>
		if (<highway_view> = scrolling)
			primitive = OG_Vocal_Comet
		else
			primitive = OG_Vocal_Comet
		endif
		<vocals_highway_id> :SE_SetProps pitch_area_alpha = 0
	endif
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		name = <visualizer>
		scefName = <visualizer>
		type = AudioVisualize
		highway_index = <highway_index>
		on = 1
		clearColor = [0 , 0 , 0 , 255]
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
		colormodulate = [1.0 1.0 1.0 1.0]
		saturation = 1.0
		equation = eq2
	}
endscript

script create_vocals_visualizer_freeform_fx 
	if ScreenFX_FXInstanceExists viewport = <viewport> name = AV_Freeform
		ScreenFX_ClearFXInstances {viewport = <viewport>}
	endif
	wait \{1
		gameframe}
	vocals_get_highway_view player = <player>
	if (<highway_view> = scrolling)
		primitive = OG_Vocals_Freeform
	else
		primitive = OG_Vocals_Freeform_Static
	endif
	FormatText checksumname = visualizer 'vocals_freeform_fx_p%a' a = <player>
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		name = AV_Freeform
		scefName = AV_Freeform
		type = AudioVisualize
		highway_index = <highway_index>
		on = 1
		primitives = ($<primitive>)
	}
endscript

script vocals_freeform_test 
	abs_pos = (409.0, 470.0)
	posx = 1280
	begin
	newpos = ((1.0, 0.0) * <posx> + (0.0, 0.0))
	SE_SetProps Pos = <newpos>
	<visualizer_id> :SE_SetProps Pos = {<abs_pos> absolute}
	<posx> = (<posx> - 5)
	if (<posx> < -900)
		<posx> = 1280
	endif
	wait \{1
		gameframe}
	repeat
endscript
OG_Vocal_Comet_4p_test_highway1 = [
	{
		type = blendPrev
		offset = (-0.0075000003, -0.00074999995)
		scale = (1.0, 1.0)
		Color = [
			237
			237
			255
			254
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
		highway_index = 1
		controls = [
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = add
		thickness = 10.0
		angularVel = 52.359898
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 1
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 1
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 1
			}
		]
	}
	{
		type = sprite
		Pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				spectrumBand = 20
				player = 1
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 1
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 1
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = add
		thickness = 10.0
		angularVel = 52.359898
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 2
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 2
			}
		]
	}
	{
		type = sprite
		Pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 2
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 2
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = add
		thickness = 10.0
		angularVel = 52.359898
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 3
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 3
			}
		]
	}
	{
		type = sprite
		Pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 3
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 3
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = add
		thickness = 10.0
		angularVel = 52.359898
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 4
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 4
			}
		]
	}
	{
		type = sprite
		Pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 4
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 4
			}
		]
	}
]
OG_Vocal_Comet_4p_test_highway2 = [
	{
		type = blendPrev
		offset = (-0.0075000003, -0.00074999995)
		scale = (1.0, 1.0)
		Color = [
			237
			237
			255
			254
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
		controls = [
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = add
		thickness = 10.0
		angularVel = 52.359898
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 1
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 1
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 1
			}
		]
	}
	{
		type = sprite
		Pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				spectrumBand = 20
				player = 1
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 1
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 1
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = add
		thickness = 10.0
		angularVel = 52.359898
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 2
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 2
			}
		]
	}
	{
		type = sprite
		Pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 2
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 2
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = add
		thickness = 10.0
		angularVel = 52.359898
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 3
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 3
			}
		]
	}
	{
		type = sprite
		Pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 3
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 3
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = add
		thickness = 10.0
		angularVel = 52.359898
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 4
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 4
			}
		]
	}
	{
		type = sprite
		Pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = scaleY
				scaleMod = 10.0
				player = 4
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 4
			}
		]
	}
]
