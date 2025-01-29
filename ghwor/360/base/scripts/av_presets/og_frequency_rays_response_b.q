og_frequency_rays_response_b = [
	{
		Type = blendprev
		offset = (0.0, 0.001)
		Scale = (-0.98999995, 0.98999995)
		Color = [
			218
			218
			218
			186
		]
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = huemodulation
				scalemod = 0.1
				spectrumband = 3
			}
			{
				Type = rockmeterstatus
				response = alphamodulation
				scalemod = 0.5015
				Player = 1
			}
			{
				Type = notestreak
				response = alphamodulation
				scalemod = 0.3
				Player = 1
			}
			{
				Type = starpowerstate
				response = bluemodulation
				scalemod = 0.15
				Player = 1
			}
			{
				Type = starpowerstate
				response = greenmodulation
				scalemod = 0.15
				Player = 1
			}
			{
				Type = whammybarposition
				response = scalexy
				scalemod = -0.1
				Player = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.35000002, 0.0)
		radius = 0.001
		Color = [
			163
			203
			222
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.5
		Color = [
			255
			246
			161
			0
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 10
			}
			{
				Type = multiplierstatus
				response = alphamodulation
				scalemod = 1
				Player = 1
			}
			{
				Type = whammybarposition
				response = lengthscale
				scalemod = -0.4
				Player = 1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.5
		Color = [
			173
			255
			117
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 300.0
				spectrumband = 10
			}
			{
				Type = rockmeterstatus
				response = alphamodulation
				scalemod = 0.1
				Player = 1
			}
			{
				Type = whammybarposition
				response = lengthscale
				scalemod = -0.4
				Player = 1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.5
		Color = [
			255
			99
			17
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 10
			}
			{
				Type = whammybarposition
				response = lengthscale
				scalemod = -0.4
				Player = 1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.5
		Color = [
			15
			177
			255
			255
		]
		thickness = 2.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 50.0
				spectrumband = 10
			}
			{
				Type = starpoweramount
				response = alphamodulation
				scalemod = 0.1
				Player = 1
			}
			{
				Type = whammybarposition
				response = lengthscale
				scalemod = -0.4
				Player = 1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 19
		radius = 0.001
		radius2 = 0.5
		Color = [
			128
			128
			128
			255
		]
		BlendMode = subtract
		thickness = 3.0
		angularvel = 0.523599
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 19
		radius = 0.001
		radius2 = 0.5
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angularvel = 1.7453301
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.05125
		Color = [
			255
			147
			117
			73
		]
		thickness = 20.0
		controls = [
			{
				Type = History
				historytype = notehit
				Player = 1
				fade = 0.5
				response = radiusscale
				scalemod = 0.2
			}
		]
	}
]
