og_frequency_rays_response_a = [
	{
		type = blendprev
		offset = (0.0, 0.001)
		scale = (-0.98999995, 0.98999995)
		color = [
			218
			218
			218
			186
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = frequency
				response = huemodulation
				scalemod = 0.2
				spectrumband = 5
			}
			{
				type = rockmeterstatus
				response = alphamodulation
				scalemod = 0.5015
				player = 1
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 0.15
				player = 1
			}
			{
				type = starpowerstate
				response = greenmodulation
				scalemod = 0.15
				player = 1
			}
			{
				type = whammybarposition
				response = scalexy
				scalemod = -0.1
				player = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.75, 0.0)
		radius = 0.001
		color = [
			163
			203
			222
			255
		]
		blendmode = multiply
		thickness = 50.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.5
		color = [
			255
			246
			161
			0
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 10
			}
			{
				type = multiplierstatus
				response = alphamodulation
				scalemod = 1
				player = 1
			}
			{
				type = whammybarposition
				response = lengthscale
				scalemod = -0.4
				player = 1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.5
		color = [
			173
			255
			117
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 300.0
				spectrumband = 10
			}
			{
				type = rockmeterstatus
				response = alphamodulation
				scalemod = 0.1
				player = 1
			}
			{
				type = whammybarposition
				response = lengthscale
				scalemod = -0.4
				player = 1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.5
		color = [
			255
			99
			17
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 10
			}
			{
				type = whammybarposition
				response = lengthscale
				scalemod = -0.4
				player = 1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.5
		color = [
			15
			177
			255
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 50.0
				spectrumband = 10
			}
			{
				type = starpoweramount
				response = alphamodulation
				scalemod = 0.1
				player = 1
			}
			{
				type = whammybarposition
				response = lengthscale
				scalemod = -0.4
				player = 1
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 19
		radius = 0.001
		radius2 = 0.5
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 1.0
		angle = 0
		angularvel = 1.5708001
		controls = [
			{
				type = frequency
				response = angularvelmod
				scalemod = -1.5708001
				spectrumband = 20
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 19
		radius = 0.001
		radius2 = 0.5
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0.17453298
		controls = [
			{
				type = frequency
				response = angularvelmod
				scalemod = 1.5708001
				spectrumband = 5
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.05125
		color = [
			255
			147
			117
			73
		]
		blendmode = blend
		thickness = 20.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.2
				responsefunc = costime
				player = 1
				fade = 1.0
			}
		]
	}
]
