og_tunnel_blackout_c = [
	{
		Type = blendprev
		offset = (0.0, 0.01)
		Scale = (1.01, 1.01)
		Color = [
			255
			255
			255
			255
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = blend
		controls = [
			{
				Type = meandbs
				response = alphamodulation
				colorscale = 1.0
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.05, 0.0)
		length = 0.01
		Color = [
			0
			0
			25
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 5.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 10.0
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
			0
			0
			25
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
			0
			0
			25
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
			0
			0
			25
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
			0
			0
			25
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
		Pos = (0.5, 0.3, 0.0)
		length = 0.01
		Color = [
			116
			38
			26
			255
		]
		BlendMode = add
		thickness = 1.0
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
		Scale = (-1.01, -1.0)
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
