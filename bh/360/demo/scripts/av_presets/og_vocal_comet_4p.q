og_vocal_comet_4p = [
	{
		type = blendprev
		offset = (-0.005, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			255
			255
			154
		]
		angle = 0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.075
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.075
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.075
				player = 4
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.15
				player = 1
			}
		]
	}
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (0.0, 0.7)
		width = 0.075
		height = 0.075
		color = [
			77
			94
			153
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 1
			}
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 50.0
				player = 1
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				player = 1
				fade = 1.0
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 1.0
				player = 1
			}
		]
	}
	{
		type = nstar2
		pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.0
		color = [
			59
			232
			252
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 1
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				player = 1
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				player = 1
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				player = 1
				fade = 1.0
			}
			{
				type = vocalsactive
				response = radiusscale
				scalemod = 0.01
				player = 1
			}
			{
				type = vocalsactive
				response = radius2scale
				scalemod = 0.0233
				player = 1
			}
		]
	}
	{
		type = line
		pos = (0.887, 0.5, 0.0)
		length = 0.5
		color = [
			65
			251
			0
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 40.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.8
				player = 1
				fade = 1.0
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
		pos = (0.82, 0.0)
		scale = (0.0, 1.0)
		width = 0.37
		height = 0.1
		color = [
			77
			94
			153
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.9
				player = 1
			}
			{
				type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				player = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.2
				player = 1
				fade = 1.0
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 1.0
				player = 1
			}
		]
	}
	{
		type = nstar2
		pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.0
		color = [
			59
			232
			252
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				player = 2
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				player = 2
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				player = 2
				fade = 1.0
			}
			{
				type = vocalsactive
				response = radiusscale
				scalemod = 0.01
				player = 2
			}
			{
				type = vocalsactive
				response = radius2scale
				scalemod = 0.0233
				player = 2
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.89, 0.0, 0.0)
		scale = (0.3, 0.3)
		length = 0.2175
		innerradius = 0.125
		outerradius = 0.3
		color = [
			0
			196
			255
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = -523.599
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 2
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.6
				player = 2
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 5.0
				player = 2
			}
			{
				type = beaton
				response = radius2scale
				scalemod = 0.3
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		scale = (1.0, 0.7)
		length = 0.0125
		innerradius = 0.125
		outerradius = 0.1
		color = [
			255
			185
			0
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = -52.359898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 2
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 2
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (0.0, 0.7)
		width = 0.075
		height = 0.075
		color = [
			154
			58
			189
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 2
			}
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 50.0
				player = 2
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				player = 2
				fade = 1.0
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 1.0
				player = 2
			}
		]
	}
	{
		type = sprite
		pos = (0.82, 0.0)
		scale = (0.0, 0.7)
		width = 0.37
		height = 0.1
		color = [
			154
			58
			189
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 25.0
				player = 2
			}
			{
				type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				player = 2
				fade = 1.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.2
				player = 2
				fade = 1.0
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 1.0
				player = 2
			}
		]
	}
	{
		type = nstar2
		pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.0
		color = [
			59
			232
			252
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				player = 3
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				player = 3
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				player = 3
				fade = 1.0
			}
			{
				type = vocalsactive
				response = radiusscale
				scalemod = 0.01
				player = 3
			}
			{
				type = vocalsactive
				response = radius2scale
				scalemod = 0.0233
				player = 3
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.89, 0.0, 0.0)
		scale = (0.3, 0.3)
		length = 0.2175
		innerradius = 0.125
		outerradius = 0.3
		color = [
			0
			196
			255
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = -523.599
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 3
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 1.0
				player = 3
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.6
				player = 3
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 5.0
				player = 3
			}
			{
				type = beaton
				response = radius2scale
				scalemod = 0.3
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		scale = (1.0, 0.7)
		length = 0.0125
		innerradius = 0.125
		outerradius = 0.1
		color = [
			255
			185
			0
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = -52.359898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 3
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 3
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 3
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (0.0, 0.7)
		width = 0.075
		height = 0.075
		color = [
			130
			70
			110
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 3
			}
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 50.0
				player = 3
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				player = 3
				fade = 1.0
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 1.0
				player = 3
			}
		]
	}
	{
		type = sprite
		pos = (0.82, 0.0)
		scale = (0.0, 0.7)
		width = 0.37
		height = 0.1
		color = [
			130
			70
			110
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 25.0
				player = 3
			}
			{
				type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				player = 3
				fade = 1.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.2
				player = 3
				fade = 1.0
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 1.0
				player = 3
			}
		]
	}
	{
		type = nstar2
		pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.0
		color = [
			59
			232
			252
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				player = 4
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				player = 4
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				player = 4
				fade = 1.0
			}
			{
				type = vocalsactive
				response = radiusscale
				scalemod = 0.01
				player = 4
			}
			{
				type = vocalsactive
				response = radius2scale
				scalemod = 0.0233
				player = 4
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.89, 0.0, 0.0)
		scale = (0.3, 0.3)
		length = 0.2175
		innerradius = 0.125
		outerradius = 0.3
		color = [
			0
			196
			255
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = -523.599
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 4
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.6
				player = 4
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 5.0
				player = 4
			}
			{
				type = beaton
				response = radius2scale
				scalemod = 0.3
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		scale = (1.0, 0.7)
		length = 0.0125
		innerradius = 0.125
		outerradius = 0.1
		color = [
			255
			185
			0
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = -52.359898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 4
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 4
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 4
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (0.0, 0.7)
		width = 0.075
		height = 0.075
		color = [
			130
			120
			40
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 4
			}
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 50.0
				player = 4
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				player = 4
				fade = 1.0
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 1.0
				player = 4
			}
		]
	}
	{
		type = line
		pos = (0.887, 0.5, 0.0)
		length = 0.5
		color = [
			65
			251
			0
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 40.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.8
				player = 2
				fade = 1.0
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
		type = line
		pos = (0.887, 0.5, 0.0)
		length = 0.5
		color = [
			65
			251
			0
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 40.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.8
				player = 3
				fade = 1.0
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
		type = line
		pos = (0.887, 0.5, 0.0)
		length = 0.5
		color = [
			65
			251
			0
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 40.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.8
				player = 4
				fade = 1.0
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
		pos = (0.82, 0.0)
		scale = (0.0, 0.7)
		width = 0.37
		height = 0.1
		color = [
			130
			120
			40
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				player = 4
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 25.0
				player = 4
			}
			{
				type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				player = 4
				fade = 1.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.2
				player = 4
				fade = 1.0
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 1.0
				player = 4
			}
		]
	}
]
