og_vocal_comet_4p_freeplay = [
	{
		Type = blendprev
		offset = (-0.005, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			255
			255
			201
		]
		angle = 0
		angularvel = 0
		BlendMode = add
		controls = [
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 0.1
				Player = 4
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.0
		Color = [
			59
			232
			252
			0
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 1
			}
			{
				Type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				Player = 1
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				Player = 1
				fade = 1.0
			}
			{
				Type = vocalsactive
				response = radiusscale
				scalemod = 0.01
				Player = 1
			}
			{
				Type = vocalsactive
				response = radius2scale
				scalemod = 0.0233
				Player = 1
			}
		]
	}
	{
		Type = line
		Pos = (0.887, 0.5, 0.0)
		length = 0.5
		Color = [
			65
			251
			0
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = 40.0
			}
			{
				Type = starpowerstate
				response = saturationmodulation
				scalemod = -0.8
				Player = 1
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = saturationmodulation
				scalemod = -0.8
				Player = 2
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = saturationmodulation
				scalemod = -0.8
				Player = 3
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = saturationmodulation
				scalemod = -0.8
				Player = 4
				fade = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.89, 0.0)
		Scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 1
			}
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 50.0
				Player = 1
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				Player = 1
				fade = 1.0
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 1.0
				Player = 1
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 0.8
				Player = 1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.82, 0.0)
		Scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 1
			}
			{
				Type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				Player = 1
				fade = 1.0
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				Player = 1
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 0.6
				Player = 1
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 2.8
				Player = 1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.865, 0.0)
		Scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				Player = 1
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 0.3
				Player = 1
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 1.2
				Player = 1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.0
		Color = [
			59
			232
			252
			0
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 2
			}
			{
				Type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				Player = 2
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				Player = 2
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				Player = 2
				fade = 1.0
			}
			{
				Type = vocalsactive
				response = radiusscale
				scalemod = 0.01
				Player = 2
			}
			{
				Type = vocalsactive
				response = radius2scale
				scalemod = 0.0233
				Player = 2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.89, 0.0)
		Scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 2
			}
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 50.0
				Player = 2
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				Player = 2
				fade = 1.0
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 1.0
				Player = 2
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 0.8
				Player = 2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.865, 0.0)
		Scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 2
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				Player = 2
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 0.3
				Player = 2
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 1.2
				Player = 2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.8, 0.0)
		Scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 2
			}
			{
				Type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				Player = 2
				fade = 1.0
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				Player = 2
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 0.6
				Player = 2
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 2.8
				Player = 2
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.0
		Color = [
			59
			232
			252
			0
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 3
			}
			{
				Type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				Player = 3
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				Player = 3
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				Player = 3
				fade = 1.0
			}
			{
				Type = vocalsactive
				response = radiusscale
				scalemod = 0.01
				Player = 3
			}
			{
				Type = vocalsactive
				response = radius2scale
				scalemod = 0.0233
				Player = 3
			}
		]
	}
	{
		Type = sprite
		Pos = (0.89, 0.0)
		Scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 3
			}
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 50.0
				Player = 3
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				Player = 3
				fade = 1.0
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 1.0
				Player = 3
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 0.8
				Player = 3
			}
		]
	}
	{
		Type = sprite
		Pos = (0.865, 0.0)
		Scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 3
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				Player = 3
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 0.3
				Player = 3
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 1.2
				Player = 3
			}
		]
	}
	{
		Type = sprite
		Pos = (0.8, 0.0)
		Scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 3
			}
			{
				Type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				Player = 3
				fade = 1.0
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				Player = 3
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 0.6
				Player = 3
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 2.8
				Player = 3
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.0
		Color = [
			59
			232
			252
			0
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 4
			}
			{
				Type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				Player = 4
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				Player = 4
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				Player = 4
				fade = 1.0
			}
			{
				Type = vocalsactive
				response = radiusscale
				scalemod = 0.01
				Player = 4
			}
			{
				Type = vocalsactive
				response = radius2scale
				scalemod = 0.0233
				Player = 4
			}
		]
	}
	{
		Type = sprite
		Pos = (0.89, 0.0)
		Scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 4
			}
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 50.0
				Player = 4
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				Player = 4
				fade = 1.0
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 1.0
				Player = 4
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 0.8
				Player = 4
			}
		]
	}
	{
		Type = sprite
		Pos = (0.865, 0.0)
		Scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 4
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				Player = 4
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 0.3
				Player = 4
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 1.2
				Player = 4
			}
		]
	}
	{
		Type = sprite
		Pos = (0.8, 0.0)
		Scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				Player = 4
			}
			{
				Type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				Player = 4
				fade = 1.0
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 100.0
				Player = 4
			}
			{
				Type = vocalsphrasequality
				response = scaley
				scalemod = 0.6
				Player = 4
			}
			{
				Type = vocalsactive
				response = scalex
				scalemod = 2.8
				Player = 4
			}
		]
	}
]
