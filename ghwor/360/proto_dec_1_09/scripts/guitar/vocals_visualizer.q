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
	createviewport {
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
	SetSearchAllAssetContexts \{OFF}
endscript

script vocals_hide_visualizer 
	formatText checksumName = viewport_id 'vocal_visualizer_viewport_p%a' a = <Player>
	if ScreenElementExists id = <viewport_id>
		<viewport_id> :se_setprops alpha = 0 time = 0.2
	endif
	<vocals_highway_id> :desc_resolvealias Name = alias_now_bar param = now_bar
	<now_bar> :se_setprops alpha = 0 time = 0.2
endscript

script vocals_show_visualizer 
	formatText checksumName = viewport_id 'vocal_visualizer_viewport_p%a' a = <Player>
	if ScreenElementExists id = <viewport_id>
		<viewport_id> :se_setprops alpha = 1 time = 0.2
	endif
	<vocals_highway_id> :desc_resolvealias Name = alias_now_bar param = now_bar
	<now_bar> :se_setprops alpha = 1 time = 0.2
endscript

script create_vocal_visualizer 
	vocals_getvocalistnum Player = <Player>
	printf channel = vocals qs(0x17066829) a = <Player>
	vocalshighway_getid Player = <Player>
	need_to_create_viewport = true
	gamemode_gettype
	if (<Type> != freeplay)
		vocals_getactivehighway Player = <Player>
		if (<active_highway> = <Player>)
			vocals_getactivehighwayindex Player = <Player>
			highway_index = <active_highway_index>
			if (<highway_index> = 1)
				visualizer = vocals_visualizer_viewport_params_h1
			else
				visualizer = vocals_visualizer_viewport_params_h2
			endif
		else
			need_to_create_viewport = FALSE
			<vocals_highway_id> :se_setprops alpha = 0
			visualizer = vocals_visualizer_viewport_params_h1
		endif
		formatText checksumName = viewport 'vocals_visualizer_p%a' a = <Player>
	else
		visualizer = vocals_visualizer_viewport_params_h1
		highway_index = 1
		viewport = vocals_visualizer_freeplay
		if ViewportExists id = <viewport>
			need_to_create_viewport = FALSE
		endif
		<vocals_highway_id> :se_setprops alpha = 1
	endif
	zone_context = basic_gems
	if (<need_to_create_viewport> = true)
		texdict = `pak/highway/basic_gems/basic_gems.tex`
		create_vocal_visualizer_viewport visualizer = <visualizer> viewport = <viewport> zone_context = <zone_context> texdict = <texdict>
		SpawnScriptNow create_vocals_visualizer_fx params = {viewport = <viewport> visualizer = <visualizer> Player = <Player> highway_index = <highway_index>}
	endif
	<vocals_highway_id> :desc_resolvealias Name = alias_now_bar param = now_bar
	formatText checksumName = viewport_id 'vocal_visualizer_viewport_p%a' a = <Player>
	get_vocal_visualizer_viewport_texture_asset visualizer = <visualizer>
	PushAssetContext context = <zone_context>
	CreateScreenElement {
		id = <viewport_id>
		Type = SpriteElement
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
	vocals_getvocalistnum Player = <Player>
	printf channel = vocals qs(0x356837e7) a = <Player>
	need_to_create_viewport = true
	gamemode_gettype
	if (<Type> != freeplay)
		vocals_getactivehighway Player = <Player>
		if (<active_highway> = <Player>)
			vocals_getactivehighwayindex Player = <Player>
			highway_index = <active_highway_index>
			if (<highway_index> = 1)
				freeform = vocals_freeform_viewport_params_h1
			else
				freeform = vocals_freeform_viewport_params_h2
			endif
		else
			need_to_create_viewport = FALSE
			freeform = vocals_freeform_viewport_params_h2
		endif
		formatText checksumName = freeform_viewport 'vocals_freeform_p%a' a = <Player>
	else
		freeform = vocals_freeform_viewport_params_h1
		highway_index = 1
		freeform_viewport = vocals_freeform_freeplay
		if ViewportExists id = <freeform_viewport>
			need_to_create_viewport = FALSE
		endif
	endif
	zone_context = basic_gems
	if (<need_to_create_viewport> = true)
		texdict = `pak/highway/basic_gems/basic_gems.tex`
		create_vocal_visualizer_viewport visualizer = <freeform> viewport = <freeform_viewport> zone_context = <zone_context> texdict = <texdict>
		SpawnScriptNow create_vocals_visualizer_freeform_fx params = {viewport = <freeform_viewport> visualizer = <freeform> highway_index = <highway_index> Player = <Player>}
	endif
	get_vocal_visualizer_viewport_texture_asset visualizer = <freeform>
	return texture = <textureasset>
endscript

script destroy_vocals_visualizer 
	AddParams (<visualizer>)
	formatText checksumName = viewport 'vocals_visualizer_p%a' a = <Player>
	if NOT ViewportExists id = <viewport>
		return
	endif
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <viewport>
	SetSearchAllAssetContexts \{OFF}
	DestroyViewport id = <viewport>
	formatText checksumName = freeform_viewport 'vocals_freeform_p%a' a = <Player>
	if NOT ViewportExists id = <freeform_viewport>
		return
	endif
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <freeform_viewport>
	SetSearchAllAssetContexts \{OFF}
	DestroyViewport id = <freeform_viewport>
endscript

script destroy_freeplay_vocals_visualizer 
	viewport = vocals_visualizer_freeplay
	if NOT ViewportExists id = <viewport>
		return
	endif
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <viewport>
	SetSearchAllAssetContexts \{OFF}
	DestroyViewport id = <viewport>
	freeform_viewport = vocals_freeform_freeplay
	if NOT ViewportExists id = <freeform_viewport>
		return
	endif
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <freeform_viewport>
	SetSearchAllAssetContexts \{OFF}
	DestroyViewport id = <freeform_viewport>
endscript

script create_vocals_visualizer_fx 
	gamemode_gettype
	if (<Type> != freeplay)
		formatText checksumName = visualizer 'vocals_visualizer_fx_p%a' a = <Player>
	else
		visualizer = vocals_visualizer_fx_freeplay
	endif
	if screenFX_FXInstanceExists viewport = <viewport> Name = <visualizer>
		ScreenFX_ClearFXInstances {viewport = <viewport>}
	endif
	Wait \{1
		gameframe}
	printf channel = vocals qs(0x0fdbba62) a = <Player> b = <highway_index>
	vocalshighway_getid Player = <Player>
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> > 1)
		primitive = og_vocal_comet_4p
		<vocals_highway_id> :se_setprops pitch_area_alpha = 1
	else
		vocals_get_highway_view Player = <Player>
		if (<highway_view> = scrolling)
			primitive = og_vocal_comet
		else
			primitive = og_vocal_comet
		endif
		<vocals_highway_id> :se_setprops pitch_area_alpha = 0
	endif
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		Name = <visualizer>
		scefName = <visualizer>
		Type = audiovisualize
		highway_index = <highway_index>
		On = 1
		clearcolor = [0 , 0 , 0 , 255]
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
		colormodulate = [1.0 1.0 1.0 1.0]
		Saturation = 1.0
		equation = eq2
	}
endscript

script create_vocals_visualizer_freeform_fx 
	if screenFX_FXInstanceExists viewport = <viewport> Name = av_freeform
		ScreenFX_ClearFXInstances {viewport = <viewport>}
	endif
	Wait \{1
		gameframe}
	vocals_get_highway_view Player = <Player>
	if (<highway_view> = scrolling)
		primitive = og_vocals_freeform
	else
		primitive = og_vocals_freeform_static
	endif
	formatText checksumName = visualizer 'vocals_freeform_fx_p%a' a = <Player>
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		Name = av_freeform
		scefName = av_freeform
		Type = audiovisualize
		highway_index = <highway_index>
		On = 1
		primitives = ($<primitive>)
	}
endscript

script vocals_freeform_test 
	abs_pos = (409.0, 470.0)
	PosX = 1280
	begin
	newpos = ((1.0, 0.0) * <PosX> + (0.0, 0.0))
	se_setprops Pos = <newpos>
	<visualizer_id> :se_setprops Pos = {<abs_pos> absolute}
	<PosX> = (<PosX> - 5)
	if (<PosX> < -900)
		<PosX> = 1280
	endif
	Wait \{1
		gameframe}
	repeat
endscript
og_vocal_comet_4p_test_highway1 = [
	{
		Type = blendprev
		offset = (-0.0075000003, -0.00074999995)
		Scale = (1.0, 1.0)
		Color = [
			237
			237
			255
			254
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
		highway_index = 1
		controls = [
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerradius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		BlendMode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 1
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 1
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 1
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.85, 0.0, 0.0)
		Scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
		highway_index = 1
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				spectrumband = 20
				Player = 1
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 1
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 1
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerradius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		BlendMode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 1
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 2
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 2
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.85, 0.0, 0.0)
		Scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
		highway_index = 1
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 2
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 2
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 2
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerradius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		BlendMode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 1
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 3
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 3
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 3
			}
		]
	}
	{
		Type = sprite
		Pos = (0.85, 0.0, 0.0)
		Scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
		highway_index = 1
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 3
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 3
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 3
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerradius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		BlendMode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 1
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 4
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 4
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 4
			}
		]
	}
	{
		Type = sprite
		Pos = (0.85, 0.0, 0.0)
		Scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
		highway_index = 1
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 4
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 4
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 4
			}
		]
	}
]
og_vocal_comet_4p_test_highway2 = [
	{
		Type = blendprev
		offset = (-0.0075000003, -0.00074999995)
		Scale = (1.0, 1.0)
		Color = [
			237
			237
			255
			254
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
		controls = [
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerradius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		BlendMode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 2
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 1
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 1
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.85, 0.0, 0.0)
		Scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
		highway_index = 2
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				spectrumband = 20
				Player = 1
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 1
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 1
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerradius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		BlendMode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 2
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 2
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 2
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.85, 0.0, 0.0)
		Scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
		highway_index = 2
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 2
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 2
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 2
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerradius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		BlendMode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 2
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 3
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 3
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 3
			}
		]
	}
	{
		Type = sprite
		Pos = (0.85, 0.0, 0.0)
		Scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
		highway_index = 2
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 3
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 3
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 3
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		length = 0.005
		InnerRadius = 0.001
		outerradius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		BlendMode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 2
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 4
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 4
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 4
			}
		]
	}
	{
		Type = sprite
		Pos = (0.85, 0.0, 0.0)
		Scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		Color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
		highway_index = 2
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 4
			}
			{
				Type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				Player = 4
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 4
			}
		]
	}
]
