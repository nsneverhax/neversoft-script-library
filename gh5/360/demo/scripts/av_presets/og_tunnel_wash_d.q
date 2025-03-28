og_tunnel_wash_d = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.01, -1.01)
		color = [
			255
			255
			255
			247
		]
		angle = 0.523599
		angularvel = 0.17453298
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
		pos = (0.5, 0.55, 0.0)
		length = 0.01
		color = [
			0
			238
			255
			255
		]
		blendmode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = 200.0
				spectrumband = 10
			}
			{
				type = frequency
				response = greenmodulation
				colorscale = -20.0
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
		pos = (0.5, 0.6, 0.0)
		length = 0.01
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
		thickness = 5.0
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
				response = greenmodulation
				colorscale = -20.0
				spectrumband = 20
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 200.0
				spectrumband = 20
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		color = [
			0
			255
			238
			255
		]
		blendmode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = 200.0
				spectrumband = 30
			}
			{
				type = frequency
				response = greenmodulation
				colorscale = -20.0
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
		pos = (0.5, 0.7, 0.0)
		length = 0.01
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = 200.0
				spectrumband = 40
			}
			{
				type = frequency
				response = greenmodulation
				colorscale = -20.0
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
		pos = (0.5, 0.75, 0.0)
		length = 0.01
		color = [
			0
			150
			255
			255
		]
		blendmode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = 200.0
				spectrumband = 50
			}
			{
				type = frequency
				response = greenmodulation
				colorscale = -20.0
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
		pos = (0.5, 0.8, 0.0)
		length = 0.01
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = 200.0
				spectrumband = 60
			}
			{
				type = frequency
				response = greenmodulation
				colorscale = -20.0
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
		scale = (0.99899995, 1.01)
		color = [
			98
			51
			255
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
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.001, 1.001)
		color = [
			255
			255
			255
			254
		]
		angle = 0.0
		angularvel = 0
		blendmode = blend
	}
]
