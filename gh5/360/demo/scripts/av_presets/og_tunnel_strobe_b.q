og_tunnel_strobe_b = [
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		length = 0.01
		color = [
			169
			255
			238
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
				colorscale = 30.0
				spectrumband = 10
			}
			{
				type = frequency
				response = redmodulation
				colorscale = 50.0
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
			169
			255
			238
			255
		]
		blendmode = add
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
				colorscale = 10.0
				spectrumband = 20
			}
			{
				type = frequency
				response = redmodulation
				colorscale = 5.0
				spectrumband = 20
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		length = 0.01
		color = [
			169
			255
			238
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 5.0
				spectrumband = 30
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 10.0
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
			169
			255
			238
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 5.0
				spectrumband = 40
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 10.0
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
			169
			255
			238
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 5.0
				spectrumband = 50
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 10.0
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
		pos = (0.5, 0.4, 0.0)
		length = 0.01
		color = [
			255
			255
			255
			255
		]
		blendmode = add
		thickness = 50.0
		angle = 0.349066
		angularvel = 0
		controls = [
			{
				type = frequency
				response = greenmodulation
				colorscale = 5.0
				spectrumband = 60
			}
			{
				type = frequency
				response = redmodulation
				colorscale = 10.0
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
		scale = (-0.98999995, -0.98999995)
		color = [
			255
			255
			255
			255
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = scalex
				scalemod = -1.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			255
			255
			11
		]
		angle = 0.00174533
		angularvel = 0
		blendmode = dstminussrc
	}
]
