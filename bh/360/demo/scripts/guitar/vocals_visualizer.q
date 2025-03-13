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
	addparams ($<visualizer>)
	textureasset = (<textureassets> [0])
	createviewport {
		priority = 20
		id = <viewport>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
	}
	setsearchallassetcontexts \{off}
endscript

script vocals_hide_visualizer 
	formattext checksumname = viewport_id 'vocal_visualizer_viewport_p%a' a = <player>
	if screenelementexists id = <viewport_id>
		<viewport_id> :se_setprops alpha = 0 time = 0.2
	endif
	<vocals_highway_id> :desc_resolvealias name = alias_now_bar param = now_bar
	<now_bar> :se_setprops alpha = 0 time = 0.2
endscript

script vocals_show_visualizer 
	formattext checksumname = viewport_id 'vocal_visualizer_viewport_p%a' a = <player>
	if screenelementexists id = <viewport_id>
		<viewport_id> :se_setprops alpha = 1 time = 0.2
	endif
	<vocals_highway_id> :desc_resolvealias name = alias_now_bar param = now_bar
	<now_bar> :se_setprops alpha = 1 time = 0.2
endscript

script create_vocal_visualizer 
	vocals_getvocalistnum player = <player>
	printf channel = vocals qs(0x17066829) a = <player>
	vocalshighway_getid player = <player>
	need_to_create_viewport = true
	gamemode_gettype
	if (<type> != freeplay)
		vocals_getactivehighway player = <player>
		if (<active_highway> = <player>)
			vocals_getactivehighwayindex player = <player>
			highway_index = <active_highway_index>
			if (<highway_index> = 1)
				visualizer = vocals_visualizer_viewport_params_h1
			else
				visualizer = vocals_visualizer_viewport_params_h2
			endif
		else
			need_to_create_viewport = false
			<vocals_highway_id> :se_setprops alpha = 0
			visualizer = vocals_visualizer_viewport_params_h1
		endif
		formattext checksumname = viewport 'vocals_visualizer_p%a' a = <player>
	else
		visualizer = vocals_visualizer_viewport_params_h1
		highway_index = 1
		viewport = vocals_visualizer_freeplay
		if viewportexists id = <viewport>
			need_to_create_viewport = false
		endif
		<vocals_highway_id> :se_setprops alpha = 1
	endif
	zone_context = basic_gems
	if (<need_to_create_viewport> = true)
		texdict = `pak/highway/basic_gems/basic_gems.tex`
		create_vocal_visualizer_viewport visualizer = <visualizer> viewport = <viewport> zone_context = <zone_context> texdict = <texdict>
		spawnscriptnow create_vocals_visualizer_fx params = {viewport = <viewport> visualizer = <visualizer> player = <player> highway_index = <highway_index>}
	endif
	<vocals_highway_id> :desc_resolvealias name = alias_now_bar param = now_bar
	formattext checksumname = viewport_id 'vocal_visualizer_viewport_p%a' a = <player>
	get_vocal_visualizer_viewport_texture_asset visualizer = <visualizer>
	pushassetcontext context = <zone_context>
	createscreenelement {
		id = <viewport_id>
		type = spriteelement
		parent = <now_bar>
		texture = <textureasset>
		dims = (470.0, 100.0)
		just = [left top]
		pos = (-390.0, 5.0)
		z_priority = 1
		priority = 4
		alpha = 1
		blend = add
	}
	popassetcontext
endscript

script vocals_create_freeform_viewport 
	vocals_getvocalistnum player = <player>
	printf channel = vocals qs(0x356837e7) a = <player>
	need_to_create_viewport = true
	gamemode_gettype
	if (<type> != freeplay)
		vocals_getactivehighway player = <player>
		if (<active_highway> = <player>)
			vocals_getactivehighwayindex player = <player>
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
		formattext checksumname = freeform_viewport 'vocals_freeform_p%a' a = <player>
	else
		freeform = vocals_freeform_viewport_params_h1
		highway_index = 1
		freeform_viewport = vocals_freeform_freeplay
		if viewportexists id = <freeform_viewport>
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
	addparams (<visualizer>)
	formattext checksumname = viewport 'vocals_visualizer_p%a' a = <player>
	if NOT viewportexists id = <viewport>
		return
	endif
	setsearchallassetcontexts
	destroyviewporttextureoverride id = <viewport>
	setsearchallassetcontexts \{off}
	destroyviewport id = <viewport>
	formattext checksumname = freeform_viewport 'vocals_freeform_p%a' a = <player>
	if NOT viewportexists id = <freeform_viewport>
		return
	endif
	setsearchallassetcontexts
	destroyviewporttextureoverride id = <freeform_viewport>
	setsearchallassetcontexts \{off}
	destroyviewport id = <freeform_viewport>
endscript

script destroy_freeplay_vocals_visualizer 
	viewport = vocals_visualizer_freeplay
	if NOT viewportexists id = <viewport>
		return
	endif
	setsearchallassetcontexts
	destroyviewporttextureoverride id = <viewport>
	setsearchallassetcontexts \{off}
	destroyviewport id = <viewport>
	freeform_viewport = vocals_freeform_freeplay
	if NOT viewportexists id = <freeform_viewport>
		return
	endif
	setsearchallassetcontexts
	destroyviewporttextureoverride id = <freeform_viewport>
	setsearchallassetcontexts \{off}
	destroyviewport id = <freeform_viewport>
endscript

script create_vocals_visualizer_fx 
	gamemode_gettype
	if (<type> != freeplay)
		formattext checksumname = visualizer 'vocals_visualizer_fx_p%a' a = <player>
	else
		visualizer = vocals_visualizer_fx_freeplay
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = <visualizer>
		screenfx_clearfxinstances {viewport = <viewport>}
	endif
	wait \{1
		gameframe}
	printf channel = vocals qs(0x0fdbba62) a = <player> b = <highway_index>
	vocalshighway_getid player = <player>
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> > 1)
		primitive = og_vocal_comet_4p
		<vocals_highway_id> :se_setprops pitch_area_alpha = 1
	else
		vocals_get_highway_view player = <player>
		if (<highway_view> = scrolling)
			primitive = og_vocal_comet
		else
			primitive = og_vocal_comet
		endif
		<vocals_highway_id> :se_setprops pitch_area_alpha = 0
	endif
	screenfx_addfxinstance {
		viewport = <viewport>
		name = <visualizer>
		scefname = <visualizer>
		type = audiovisualize
		highway_index = <highway_index>
		on = 1
		clearcolor = [0 , 0 , 0 , 255]
		primitives = ($<primitive>)
	}
	screenfx_addfxinstance {
		viewport = <viewport>
		name = avfx_bloom01
		scefname = avfx_bloom01
		type = bloom2
		on = 1
		materialfilter = 0
		fullscreen = 1
		subtract = [0 0 0 0]
		colormodulate = [1.0 1.0 1.0 1.0]
		saturation = 1.0
		equation = eq2
	}
endscript

script create_vocals_visualizer_freeform_fx 
	if screenfx_fxinstanceexists viewport = <viewport> name = av_freeform
		screenfx_clearfxinstances {viewport = <viewport>}
	endif
	wait \{1
		gameframe}
	vocals_get_highway_view player = <player>
	if (<highway_view> = scrolling)
		primitive = og_vocals_freeform
	else
		primitive = og_vocals_freeform_static
	endif
	formattext checksumname = visualizer 'vocals_freeform_fx_p%a' a = <player>
	screenfx_addfxinstance {
		viewport = <viewport>
		name = av_freeform
		scefname = av_freeform
		type = audiovisualize
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
	se_setprops pos = <newpos>
	<visualizer_id> :se_setprops pos = {<abs_pos> absolute}
	<posx> = (<posx> - 5)
	if (<posx> < -900)
		<posx> = 1280
	endif
	wait \{1
		gameframe}
	repeat
endscript
og_vocal_comet_4p_test_highway1 = [
	{
		type = blendprev
		offset = (-0.0075000003, -0.00074999995)
		scale = (1.0, 1.0)
		color = [
			237
			237
			255
			254
		]
		angle = 0
		angularvel = 0
		blendmode = blend
		highway_index = 1
		controls = [
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		length = 0.005
		innerradius = 0.001
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		blendmode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 1
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 1
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 1
			}
		]
	}
	{
		type = sprite
		pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				spectrumband = 20
				player = 1
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 1
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 1
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		length = 0.005
		innerradius = 0.001
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		blendmode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 2
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 2
			}
		]
	}
	{
		type = sprite
		pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 2
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 2
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		length = 0.005
		innerradius = 0.001
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		blendmode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 3
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 3
			}
		]
	}
	{
		type = sprite
		pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 3
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 3
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		length = 0.005
		innerradius = 0.001
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		blendmode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 4
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 4
			}
		]
	}
	{
		type = sprite
		pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
		highway_index = 1
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 4
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 4
			}
		]
	}
]
og_vocal_comet_4p_test_highway2 = [
	{
		type = blendprev
		offset = (-0.0075000003, -0.00074999995)
		scale = (1.0, 1.0)
		color = [
			237
			237
			255
			254
		]
		angle = 0
		angularvel = 0
		blendmode = blend
		controls = [
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		length = 0.005
		innerradius = 0.001
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		blendmode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 1
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 1
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 1
			}
		]
	}
	{
		type = sprite
		pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				spectrumband = 20
				player = 1
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 1
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 1
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		length = 0.005
		innerradius = 0.001
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		blendmode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 2
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 2
			}
		]
	}
	{
		type = sprite
		pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 2
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 2
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		length = 0.005
		innerradius = 0.001
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		blendmode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 3
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 3
			}
		]
	}
	{
		type = sprite
		pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 3
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 3
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		length = 0.005
		innerradius = 0.001
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_brighten
		blendmode = add
		thickness = 10.0
		angularvel = 52.359898
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 4
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 4
			}
		]
	}
	{
		type = sprite
		pos = (0.85, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.025
		height = 0.025
		color = [
			255
			204
			193
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
		highway_index = 2
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = scaley
				scalemod = 10.0
				player = 4
			}
			{
				type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				player = 4
			}
		]
	}
]
