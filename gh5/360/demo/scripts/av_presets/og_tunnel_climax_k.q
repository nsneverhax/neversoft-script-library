og_tunnel_climax_k = [
	{
		type = blendprev
		offset = (0.0, -0.02)
		scale = (-1.1, 1.001)
		color = [
			255
			255
			255
			249
		]
		angle = 0.0698132
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
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			130
			60
			11
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
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
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 9
		radius = 0.1
		radius2 = 0.75
		color = [
			116
			101
			255
			255
		]
		blendmode = add
		thickness = 10.0
		angle = 0.0872665
		angularvel = 1.7453301
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.57
		color = [
			255
			255
			255
			255
		]
		blendmode = blend_alphadiffuse
		thickness = 200.0
	}
	{
		type = line
		pos = (0.5, 0.95, 0.0)
		length = 0.01
		color = [
			255
			255
			144
			255
		]
		blendmode = add
		thickness = 15.0
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
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.9, 0.0)
		length = 0.01
		color = [
			255
			255
			144
			255
		]
		blendmode = add
		thickness = 15.0
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
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.85, 0.0)
		length = 0.01
		color = [
			255
			255
			144
			255
		]
		blendmode = add
		thickness = 15.0
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
				deformscale = 10.0
				spectrumband = 10
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
			144
			255
		]
		blendmode = add
		thickness = 15.0
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
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.75, 0.0)
		length = 0.01
		color = [
			255
			255
			144
			255
		]
		blendmode = add
		thickness = 15.0
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
				deformscale = 10.0
				spectrumband = 10
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
			144
			255
		]
		blendmode = add
		thickness = 15.0
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
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
]
