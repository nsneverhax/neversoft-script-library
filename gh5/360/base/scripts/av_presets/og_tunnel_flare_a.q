og_tunnel_flare_a = [
	{
		Type = line
		Pos = (0.5, 0.05, 0.0)
		length = 0.01
		Color = [
			169
			255
			238
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = greenmodulation
				colorscale = 30.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = redmodulation
				colorscale = 50.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.01
		Color = [
			169
			255
			238
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 10.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = redmodulation
				colorscale = 5.0
				spectrumband = 20
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		length = 0.01
		Color = [
			169
			255
			238
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 5.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 10.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 30
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		length = 0.01
		Color = [
			169
			255
			238
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 5.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 10.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 40
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		length = 0.01
		Color = [
			169
			255
			238
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 5.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 10.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.01
		Color = [
			116
			38
			26
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = greenmodulation
				colorscale = 5.0
				spectrumband = 60
			}
			{
				Type = frequency
				response = redmodulation
				colorscale = 10.0
				spectrumband = 60
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 500.0
				spectrumband = 60
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-0.99899995, -0.99899995)
		Color = [
			255
			255
			255
			255
		]
		angle = 0.0174533
		angularvel = 0.0
		BlendMode = blend
		controls = [
			{
				Type = maxdbs
				response = alphamodulation
				colorscale = 1.0
			}
		]
	}
]
