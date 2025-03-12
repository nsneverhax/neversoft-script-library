og_tunnel_blackout_a = [
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
		angle = 2.0944
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
			23
			26
			116
			255
		]
		blendmode = blend
		thickness = 5.0
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
		thickness = 5.0
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
		thickness = 5.0
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
		thickness = 5.0
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
		blendmode = blend
		thickness = 5.0
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
			51
			233
			255
			44
		]
		angle = 0.17453298
		angularvel = 1.7453301
		blendmode = subtract
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
