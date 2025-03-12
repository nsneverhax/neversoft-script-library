og_vocal_comet_4p = [
	{
		type = blendprev
		offset = (-0.005, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			255
			255
			201
		]
		angle = 0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 0.1
				player = 4
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
		pos = (0.89, 0.0)
		scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		color = [
			0
			97
			255
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
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 0.8
				player = 1
			}
		]
	}
	{
		type = sprite
		pos = (0.82, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		color = [
			255
			170
			0
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
				type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				player = 1
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				player = 1
			}
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 0.6
				player = 1
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 2.8
				player = 1
			}
		]
	}
	{
		type = sprite
		pos = (0.865, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		color = [
			0
			97
			255
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
				scalemod = 100.0
				player = 1
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 0.3
				player = 1
			}
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 1.2
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
		type = sprite
		pos = (0.89, 0.0)
		scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		color = [
			164
			84
			49
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
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 0.8
				player = 2
			}
		]
	}
	{
		type = sprite
		pos = (0.865, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		color = [
			164
			84
			49
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
				scalemod = 100.0
				player = 2
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 0.3
				player = 2
			}
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 1.2
				player = 2
			}
		]
	}
	{
		type = sprite
		pos = (0.8, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		color = [
			255
			170
			0
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
				type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				player = 2
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				player = 2
			}
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 0.6
				player = 2
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 2.8
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
		type = sprite
		pos = (0.89, 0.0)
		scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		color = [
			130
			70
			109
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
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 0.8
				player = 3
			}
		]
	}
	{
		type = sprite
		pos = (0.865, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		color = [
			130
			70
			109
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
				scalemod = 100.0
				player = 3
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 0.3
				player = 3
			}
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 1.2
				player = 3
			}
		]
	}
	{
		type = sprite
		pos = (0.8, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		color = [
			255
			170
			0
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
				type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				player = 3
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				player = 3
			}
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 0.6
				player = 3
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 2.8
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
		type = sprite
		pos = (0.89, 0.0)
		scale = (0.0, 0.0)
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
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 0.8
				player = 4
			}
		]
	}
	{
		type = sprite
		pos = (0.865, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
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
				scalemod = 100.0
				player = 4
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 0.3
				player = 4
			}
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 1.2
				player = 4
			}
		]
	}
	{
		type = sprite
		pos = (0.8, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		color = [
			255
			170
			0
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
				type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				player = 4
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				player = 4
			}
			{
				type = vocalsphrasequality
				response = scaley
				scalemod = 0.6
				player = 4
			}
			{
				type = vocalsactive
				response = scalex
				scalemod = 2.8
				player = 4
			}
		]
	}
]
