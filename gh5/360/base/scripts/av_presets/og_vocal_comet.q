og_vocal_comet = [
	{
		Type = sprite
		Pos = (0.89, 0.0, 0.0)
		Scale = (1.0, 0.9)
		width = 0.075
		height = 0.075
		Color = [
			3
			2
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
				scalemod = 50.0
				vocalist_num = 1
			}
			{
				Type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				Type = vocalsphrasequality
				response = brightnessmodulation
				scalemod = 1.0
				vocalist_num = 1
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
		Type = line
		Pos = (0.887, 0.5, 0.0)
		length = 0.5
		Color = [
			65
			250
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
				response = bluemodulation
				scalemod = 0.9
				vocalist_num = 1
				fade = 1.0
			}
			{
				Type = vocalsphrasequality
				response = saturationmodulation
				scalemod = 1.0
				vocalist_num = 1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.82, 0.0)
		Scale = (1.0, 0.9)
		width = 0.37
		height = 0.1
		Color = [
			3
			2
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
				scalemod = 0.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				Type = vocalsphrasequality
				response = brightnessmodulation
				scalemod = 1.0
				vocalist_num = 1
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
