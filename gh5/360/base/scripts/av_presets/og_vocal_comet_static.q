og_vocal_comet_static = [
	{
		Type = sprite
		Pos = (0.89, 0.0, 0.0)
		Scale = (1.0, 0.7)
		width = 0.075
		height = 0.075
		Color = [
			255
			150
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
				vocalist_num = 1
			}
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 25.0
				vocalist_num = 1
			}
			{
				Type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 25.0
				vocalist_num = 1
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.0233
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
				vocalist_num = 1
			}
			{
				Type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				vocalist_num = 1
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				vocalist_num = 1
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0429
		radius2 = 0.1
		Color = [
			0
			1
			1
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				Type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.2
				vocalist_num = 1
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		Scale = (1.0, 0.7)
		length = 0.0125
		InnerRadius = 0.125
		outerradius = 0.1
		Color = [
			255
			86
			0
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = 13.9626
		controls = [
			{
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				vocalist_num = 1
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				vocalist_num = 1
			}
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				vocalist_num = 1
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		Scale = (0.7, 0.2)
		length = 0.052500002
		InnerRadius = 0.0125
		outerradius = 0.1
		Color = [
			65
			251
			0
			31
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = 13.9626
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				vocalist_num = 1
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		Scale = (1.0, 0.7)
		length = 0.0125
		InnerRadius = 0.125
		outerradius = 0.1
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				vocalist_num = 1
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.89, 0.0, 0.0)
		Scale = (0.3, 0.3)
		length = 0.2175
		InnerRadius = 0.125
		outerradius = 0.3
		Color = [
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
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.6
				vocalist_num = 1
			}
			{
				Type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 5.0
				vocalist_num = 1
			}
			{
				Type = beaton
				response = radius2scale
				scalemod = 0.3
				fade = 1.0
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
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.82, 0.0)
		Scale = (1.0, 0.7)
		width = 0.37
		height = 0.1
		Color = [
			255
			150
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
				vocalist_num = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.9
				vocalist_num = 1
			}
			{
				Type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				vocalist_num = 1
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = saturationmodulation
				scalemod = -0.2
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		Type = blendprev
		offset = (-0.005, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			255
			255
			154
		]
		angle = 0
		angularvel = 0
		BlendMode = add
		controls = [
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 0.18
				vocalist_num = 1
			}
		]
	}
]
