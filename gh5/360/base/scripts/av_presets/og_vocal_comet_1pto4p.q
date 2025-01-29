og_vocal_comet_1pto4p = [
	{
		Type = sprite
		Pos = (0.89, 0.0, 0.0)
		Scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		Color = [
			246
			255
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
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				Player = 1
			}
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 10.0
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 25.0
				Player = 1
			}
			{
				Type = starpowerstate
				response = huemodulation
				scalemod = 0.2
				Player = 1
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
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				Player = 1
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 1
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 1
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
			143
		]
		angle = 0
		angularvel = 0
		BlendMode = add
		controls = [
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.4
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.4
				Player = 2
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.4
				Player = 3
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.4
				Player = 4
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
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				Player = 1
			}
			{
				Type = waveform
				response = deform
				scalemod = 75.0
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 1
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 1
				fade = 1.0
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = -0.8
				Player = 1
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
				Player = 2
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				Player = 2
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 2
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 2
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
				Player = 2
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				Player = 2
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 2
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 2
				fade = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.89, 0.0, 0.0)
		Scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		Color = [
			246
			255
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
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				Player = 2
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				Player = 2
			}
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 10.0
				Player = 2
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 25.0
				Player = 2
			}
			{
				Type = starpowerstate
				response = huemodulation
				scalemod = 0.2
				Player = 2
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
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				Player = 2
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				Player = 2
			}
			{
				Type = waveform
				response = deform
				scalemod = 75.0
				Player = 2
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = -0.8
				Player = 2
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 2
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 2
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
				Player = 3
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				Player = 3
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 3
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 3
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
				Player = 3
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				Player = 3
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 3
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 3
				fade = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.89, 0.0, 0.0)
		Scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		Color = [
			246
			255
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
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				Player = 3
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				Player = 3
			}
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 10.0
				Player = 3
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 25.0
				Player = 3
			}
			{
				Type = starpowerstate
				response = huemodulation
				scalemod = 0.2
				Player = 3
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
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				Player = 3
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				Player = 3
			}
			{
				Type = waveform
				response = deform
				scalemod = 75.0
				Player = 3
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = -0.8
				Player = 3
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 3
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 3
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
				Player = 4
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				Player = 4
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 4
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 4
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
				Player = 4
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				Player = 4
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 4
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 4
				fade = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.89, 0.0, 0.0)
		Scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		Color = [
			246
			255
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
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				Player = 4
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				Player = 4
			}
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 10.0
				Player = 4
			}
			{
				Type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 25.0
				Player = 4
			}
			{
				Type = starpowerstate
				response = huemodulation
				scalemod = 0.2
				Player = 4
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
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				Player = 4
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				Player = 4
			}
			{
				Type = waveform
				response = deform
				scalemod = 75.0
				Player = 4
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = -0.8
				Player = 4
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 4
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 4
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
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				Player = 1
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				Player = 1
				fade = 1.0
			}
			{
				Type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				Player = 1
				fade = 1.0
			}
		]
	}
]
