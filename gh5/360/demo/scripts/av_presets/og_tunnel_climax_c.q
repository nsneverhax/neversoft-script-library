og_tunnel_climax_c = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.1, -1.1)
		color = [
			255
			255
			255
			245
		]
		angle = 0.0872665
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
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
		length = 0.1
		color = [
			188
			183
			60
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 0.1
		color = [
			188
			183
			60
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		length = 0.1
		color = [
			188
			183
			60
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		length = 0.1
		color = [
			188
			183
			60
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
				response = greenmodulation
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		length = 0.1
		color = [
			188
			183
			60
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 0.1
		color = [
			188
			183
			60
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
				response = greenmodulation
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-2.0, -2.0)
		color = [
			255
			0
			221
			11
		]
		angle = 0.17453298
		angularvel = -0.17453298
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
