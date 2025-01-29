og_frequency_rays_response_a = [
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
				scalemod = 0.2
				spectrumband = 5
			}
			{
				Type = rockmeterstatus
				response = alphamodulation
				scalemod = 0.5015
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
		Pos = (0.5, 0.75, 0.0)
		radius = 0.001
		Color = [
			163
			203
			222
			255
		]
		BlendMode = multiply
		thickness = 50.0
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
			255
			255
			255
			255
		]
		BlendMode = subtract
		angularvel = 1.5708001
		controls = [
			{
				Type = frequency
				response = angularvelmod
				scalemod = -1.5708001
				spectrumband = 20
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
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angularvel = 0.17453298
		controls = [
			{
				Type = frequency
				response = angularvelmod
				scalemod = 1.5708001
				spectrumband = 5
			}
		]
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
				Type = notehit
				response = radiusscale
				scalemod = 0.2
				responsefunc = costime
				Player = 1
				fade = 1.0
			}
		]
	}
]
