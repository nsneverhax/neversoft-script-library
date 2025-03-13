og_tunnel_tension_c = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.001, -1.1)
		color = [
			255
			255
			255
			245
		]
		angle = 0.0872665
		angularvel = 0.0872665
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
		length = 1.0
		color = [
			0
			29
			0
			255
		]
		blendmode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = 150.0
				spectrumband = 10
			}
			{
				type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 10
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 10
			}
			{
				type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 1.0
		color = [
			0
			29
			0
			255
		]
		blendmode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 20
			}
			{
				type = frequency
				response = deform
				deformscale = 1000.0
				spectrumband = 20
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 20
			}
			{
				type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		length = 1.0
		color = [
			0
			29
			0
			255
		]
		blendmode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = 150.0
				spectrumband = 30
			}
			{
				type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 30
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 30
			}
			{
				type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		length = 1.0
		color = [
			0
			29
			0
			255
		]
		blendmode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 40
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 50.0
				spectrumband = 40
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 40
			}
			{
				type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		length = 1.0
		color = [
			0
			29
			0
			255
		]
		blendmode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = greenmodulation
				colorscale = 150.0
				spectrumband = 50
			}
			{
				type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 50
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 50
			}
			{
				type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 1.0
		color = [
			0
			29
			0
			255
		]
		blendmode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 60
			}
			{
				type = frequency
				response = redmodulation
				colorscale = 50.0
				spectrumband = 60
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 60
			}
			{
				type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.01, 1.01)
		color = [
			255
			0
			221
			11
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
