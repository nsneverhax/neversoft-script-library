og_tunnel_intro_a = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.1, -1.01)
		color = [
			255
			255
			255
			247
		]
		angle = 1.0472
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		length = 0.01
		color = [
			30
			64
			245
			255
		]
		blendmode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = -50.0
				spectrumband = 10
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 10
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 0.01
		color = [
			245
			210
			12
			255
		]
		blendmode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 20
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 20
			}
			{
				type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 20
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		length = 0.01
		color = [
			245
			210
			12
			255
		]
		blendmode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 30
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 30
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 30
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		length = 0.01
		color = [
			245
			210
			12
			255
		]
		blendmode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 40
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 40
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 40
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		length = 0.01
		color = [
			245
			210
			12
			255
		]
		blendmode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 50
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 50
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 0.01
		color = [
			245
			210
			12
			255
		]
		blendmode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 60
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 60
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 60
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			95
			51
			12
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = beaton
				response = alphamodulation
				colorscale = 0.1
				fade = 0.5
			}
			{
				type = maxdbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
]
