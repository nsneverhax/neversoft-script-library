og_tunnel_blackout_b = [
	{
		type = blendprev
		offset = (0.0, 0.01)
		scale = (1.01, 1.01)
		color = [
			255
			255
			255
			255
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = meandbs
				response = alphamodulation
				colorscale = 1.0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		length = 0.01
		color = [
			23
			26
			116
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 10.0
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
			23
			26
			116
			255
		]
		blendmode = blend
		thickness = 1.0
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
				colorscale = 10.0
				spectrumband = 20
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		length = 0.01
		color = [
			23
			26
			116
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 10.0
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
			23
			26
			116
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 10.0
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
			23
			26
			116
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 10.0
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
			116
			38
			26
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = greenmodulation
				colorscale = 10.0
				spectrumband = 60
			}
			{
				type = frequency
				response = redmodulation
				colorscale = 110.0
				spectrumband = 60
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 500.0
				spectrumband = 60
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.01, -1.0)
		color = [
			255
			255
			255
			255
		]
		angle = 0.0174533
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = maxdbs
				response = alphamodulation
				colorscale = 1.0
			}
		]
	}
]
