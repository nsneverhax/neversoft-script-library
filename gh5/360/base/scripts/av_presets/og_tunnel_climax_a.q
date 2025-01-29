og_tunnel_climax_a = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-1.001, 0.98999995)
		Color = [
			255
			255
			255
			245
		]
		angle = 0.0872665
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
		Pos = (0.5, 0.05, 0.0)
		length = 0.1
		Color = [
			188
			183
			60
			255
		]
		BlendMode = add
		thickness = 5.0
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.1
		Color = [
			188
			183
			60
			255
		]
		BlendMode = add
		thickness = 5.0
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		length = 0.1
		Color = [
			188
			183
			60
			255
		]
		BlendMode = add
		thickness = 5.0
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		length = 0.1
		Color = [
			188
			183
			60
			255
		]
		BlendMode = add
		thickness = 5.0
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		length = 0.1
		Color = [
			188
			183
			60
			255
		]
		BlendMode = add
		thickness = 5.0
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		length = 0.1
		Color = [
			188
			183
			60
			255
		]
		BlendMode = add
		thickness = 5.0
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
				deformscale = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-2.0, -2.0)
		Color = [
			255
			0
			221
			11
		]
		angle = 0.17453298
		angularvel = -0.17453298
		BlendMode = add
		controls = [
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
]
