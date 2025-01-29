og_tunnel_climax_i = [
	{
		Type = blendprev
		offset = (0.0, -0.3)
		Scale = (1.1, -1.001)
		Color = [
			255
			255
			255
			249
		]
		angle = 0.0698132
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.95, 0.0)
		length = 0.01
		Color = [
			255
			255
			144
			255
		]
		BlendMode = add
		thickness = 15.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 10
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.9, 0.0)
		length = 0.01
		Color = [
			255
			255
			144
			255
		]
		BlendMode = add
		thickness = 15.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = deform
				deformscale = 1000.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 20
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.85, 0.0)
		length = 0.01
		Color = [
			255
			255
			144
			255
		]
		BlendMode = add
		thickness = 15.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 30
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.8, 0.0)
		length = 0.01
		Color = [
			255
			255
			144
			255
		]
		BlendMode = add
		thickness = 15.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 40
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.01
		Color = [
			255
			255
			144
			255
		]
		BlendMode = add
		thickness = 15.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 50
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.7, 0.0)
		length = 0.01
		Color = [
			255
			255
			144
			255
		]
		BlendMode = add
		thickness = 15.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 60
			}
			{
				Type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 60
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 60
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			130
			60
			11
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
			{
				Type = beaton
				response = alphamodulation
				colorscale = 0.1
				fade = 0.5
			}
			{
				Type = maxdbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 9
		radius = 0.1
		radius2 = 0.75
		Color = [
			116
			101
			255
			255
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0872665
		angularvel = 1.7453301
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.6
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend_alphadiffuse
		thickness = 200.0
	}
]
